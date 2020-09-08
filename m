Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531026139C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:36:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFffK-0003Qw-80; Tue, 08 Sep 2020 15:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFffH-0003Qr-Vb
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:36:12 +0000
X-Inumbo-ID: c352abe0-5b08-4b4b-a503-a096e0a8a4b5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c352abe0-5b08-4b4b-a503-a096e0a8a4b5;
 Tue, 08 Sep 2020 15:36:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAC8DAC26;
 Tue,  8 Sep 2020 15:36:10 +0000 (UTC)
Subject: Re: [PATCH v2] x86/pv: Fix assertions in svm_load_segs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200908150849.5699-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5b5d072-f493-c83a-359b-9ac4875ca8a0@suse.com>
Date: Tue, 8 Sep 2020 17:36:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908150849.5699-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.09.2020 17:08, Andrew Cooper wrote:
> OSSTest has shown an assertion failure:
> http://logs.test-lab.xenproject.org/osstest/logs/153906/test-xtf-amd64-amd64-1/serial-rimava1.log
> 
> This is because we pass a non-NUL selector into svm_load_segs(), which is
> something we must not do, as this path does not load the attributes/limit from
> the GDT/LDT.
> 
> Drop the {gs,gs}_sel parameters from svm_load_segs() and use 0 instead.  This

Nit: {fs,gs}

> is fine even for non-zero NUL segments, as it is how the IRET instruction
> behaves in all CPUs.

To be honest, I'd not call it "fine", but "acceptable". (And I don't
consider IRET's behavior "fine" either.)

> Only use the svm_load_segs() path when FS and GS are NUL, which is the common
> case when scheduling a 64bit vcpu with 64bit userspace in context.
> 
> Fixes: ad0fd291c5 ("x86/pv: Rewrite segment context switching from scratch")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/include/asm-x86/hvm/svm/svm.h
> +++ b/xen/include/asm-x86/hvm/svm/svm.h
> @@ -52,10 +52,12 @@ void svm_update_guest_cr(struct vcpu *, unsigned int cr, unsigned int flags);
>  /*
>   * PV context switch helper. Calls with zero ldt_base request a prefetch of
>   * the VMCB area to be loaded from, instead of an actual load of state.
> + *
> + * Must only be used for NUL FS/GS, as the segment attributes/limits are not
> + * read from the GDT/LDT.
>   */

Ah, right - this is the part I was missing when you said you'd redo
the patch.

Jan


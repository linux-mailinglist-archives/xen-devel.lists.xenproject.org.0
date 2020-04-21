Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BB1B1FBC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 09:25:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQnGs-0006lq-Sr; Tue, 21 Apr 2020 07:24:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQnGr-0006ll-IY
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 07:24:41 +0000
X-Inumbo-ID: 29afbcfe-83a1-11ea-9112-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29afbcfe-83a1-11ea-9112-12813bfff9fa;
 Tue, 21 Apr 2020 07:24:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD5C8AEE6;
 Tue, 21 Apr 2020 07:24:38 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/S3: Use percpu_traps_init() rather than
 opencoding SYSCALL/SYSENTER restoration
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
 <20200420145911.5708-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db70738a-4750-2780-2f44-b0bcd3a5f93b@suse.com>
Date: Tue, 21 Apr 2020 09:24:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420145911.5708-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 16:59, Andrew Cooper wrote:
> @@ -46,24 +36,13 @@ void restore_rest_processor_state(void)
>      /* Restore full CR4 (inc MCE) now that the IDT is in place. */
>      write_cr4(mmu_cr4_features);
>  
> -    /* Recover syscall MSRs */
> -    wrmsrl(MSR_LSTAR, saved_lstar);
> -    wrmsrl(MSR_CSTAR, saved_cstar);
> -    wrmsrl(MSR_STAR, XEN_MSR_STAR);
> -    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
> +    /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
> +    percpu_traps_init();

Without tweaks to subarch_percpu_traps_init() this assumes that,
now and going forward, map_domain_page() will work reliably at
this early point of resume. I'm not opposed, i.e.
Acked-by: Jan Beulich <jbeulich@suse.com>
but it would feel less fragile if the redundant re-writing of
the stubs would be skipped in the BSP resume case (I didn't
check whether it's also redundant for APs, but I suspect it's
not, as the stub pages may get allocated anew).

Jan


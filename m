Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EA12294A4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 11:16:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyArG-0004Gg-R3; Wed, 22 Jul 2020 09:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyArF-0004Gb-9k
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 09:16:13 +0000
X-Inumbo-ID: fbd93d20-cbfb-11ea-a18b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbd93d20-cbfb-11ea-a18b-12813bfff9fa;
 Wed, 22 Jul 2020 09:16:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11950AE4B;
 Wed, 22 Jul 2020 09:16:18 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: Fold nsvm_{wr,rd}msr() into
 svm_msr_{read,write}_intercept()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200721172208.12176-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3c3dfa9-d2b8-1042-ecf1-8f51351807e1@suse.com>
Date: Wed, 22 Jul 2020 11:16:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721172208.12176-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.07.2020 19:22, Andrew Cooper wrote:
> ... to simplify the default cases.
> 
> There are multiple errors with the handling of these three MSRs, but they are
> deliberately not addressed this point.
> 
> This removes the dance converting -1/0/1 into X86EMUL_*, allowing for the
> removal of the 'ret' variable.
> 
> While cleaning this up, drop the gdprintk()'s for #GP conditions, and the
> 'result' variable from svm_msr_write_intercept() is it is never modified.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> @@ -2085,6 +2091,22 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>              goto gpf;
>          break;
>  
> +    case MSR_K8_VM_CR:
> +        /* ignore write. handle all bits as read-only. */
> +        break;
> +
> +    case MSR_K8_VM_HSAVE_PA:
> +        if ( (msr_content & ~PAGE_MASK) || msr_content > 0xfd00000000ULL )

... while you're moving this code here, wouldn't it be worthwhile
to at least fix the > to be >= ?

Jan


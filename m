Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A26C2549B7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 17:42:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBK2O-0002nY-LC; Thu, 27 Aug 2020 15:42:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBK2N-0002nT-Sg
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 15:42:03 +0000
X-Inumbo-ID: 23087063-6f73-402d-bf63-c4e317180a66
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23087063-6f73-402d-bf63-c4e317180a66;
 Thu, 27 Aug 2020 15:42:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18721ACAF;
 Thu, 27 Aug 2020 15:42:34 +0000 (UTC)
Subject: Re: [PATCH v2 4/8] x86/svm: drop writes to BU_CFG on revF chips
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <329a104b-9640-4116-61cb-0d79928d9c52@suse.com>
Date: Thu, 27 Aug 2020 17:42:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820150835.27440-5-roger.pau@citrix.com>
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

On 20.08.2020 17:08, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2125,6 +2125,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>          nsvm->ns_msr_hsavepa = msr_content;
>          break;
>  
> +    case MSR_F10_BU_CFG:
> +        /* See comment in svm_msr_read_intercept. */
> +        if ( boot_cpu_data.x86 != 0xf )
> +            goto gpf;
> +        break;

This isn't how I understand the code and comment there: The
dropping of writes applies to all families (and this being a
Fam10 MSR, in particular Fam10). What the code there does is
cover for the #GP that Xen received because the %rdi key
wasn't correct. There wouldn't have been a #GP on Fam10.

Newer families (didn't check yet where the boundary is) don't
support this MSR anymore as per the BKDG (looking at Fam15's
only right now). This may nevertheless still mean the CPUs
return zero on reads and discard writes; we would want to mimic
that behavior if so.

And then, whatever the final behavior here, I guess we'd want
to mirror it to the behavior for BU_CFG2, except perhaps for
the Fam0F special case.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF525D3FC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7TC-00088h-VX; Fri, 04 Sep 2020 08:53:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE7TC-00088Z-8g
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:53:18 +0000
X-Inumbo-ID: 40546113-674e-446e-84bc-68d1ea65db36
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40546113-674e-446e-84bc-68d1ea65db36;
 Fri, 04 Sep 2020 08:53:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5408FACB0;
 Fri,  4 Sep 2020 08:53:17 +0000 (UTC)
Subject: Re: [PATCH v3 7/8] x86/hvm: Disallow access to unknown MSRs
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-8-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6823183f-90f0-90df-f843-6db2e84dba4a@suse.com>
Date: Fri, 4 Sep 2020 10:53:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901105445.22277-8-roger.pau@citrix.com>
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

On 01.09.2020 12:54, Roger Pau Monne wrote:
> @@ -3290,11 +3288,6 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>          __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
>          break;
>  
> -    case MSR_IA32_FEATURE_CONTROL:
> -    case MSR_IA32_VMX_BASIC ... MSR_IA32_VMX_VMFUNC:
> -        /* None of these MSRs are writeable. */
> -        goto gp_fault;

I understand Andrew did ask for this (and I didn't look closely
when I saw the comment), but ...

> @@ -3320,10 +3313,9 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>               is_last_branch_msr(msr) )
>              break;
>  
> -        /* Match up with the RDMSR side; ultimately this should go away. */
> -        if ( rdmsr_safe(msr, msr_content) == 0 )
> -            break;
> -
> +        gdprintk(XENLOG_WARNING,
> +                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> +                 msr, msr_content);
>          goto gp_fault;

... above from here is logic that handling of these MSRs now goes
through. I'm particularly worried about vmx_write_guest_msr(),
which blindly updates the value of any MSR it can find, i.e. if
any r/o MSR (from the set above, or even more generally) ever got
added to this vCPU-specific set, the r/o-ness would no longer be
maintained. Do we perhaps need to white-list MSRs for which
vmx_write_guest_msr() may get called here?

Jan


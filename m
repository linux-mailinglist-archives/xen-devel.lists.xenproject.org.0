Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581E22AD1E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 13:01:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyYyB-000298-Oj; Thu, 23 Jul 2020 11:00:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyYyA-000293-9e
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:00:58 +0000
X-Inumbo-ID: c87681b2-ccd3-11ea-86ee-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c87681b2-ccd3-11ea-86ee-bc764e2007e4;
 Thu, 23 Jul 2020 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595502056;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DSZDdZHienvWk0F8a6G+gA3BfU9aam8tN7agsDbnLXY=;
 b=Sub+95/yRcHGRJPZ2iDSEiVQ3oYqi1yVU3Ev1ysizmYDrV72FSGEYfYx
 NXI6HqCOgxSwPA6T7tGkIxv34InvYTSAaU+BMhK3NRnm6gcE/TwzuXyWL
 du7tceX3pjWWA861SfMKGGhWmeRIEFzQLGVYgZfn0LOCdY1jsRRDIuzhQ o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cH32bdtPvs4M+ydkQkC3OtU0hTk0b5mtSjMMKo7QAtlEKnwcn7ZtBKVV+VSYfPgzHAyshuUoCQ
 p2TOqw9YJELwxAPTcBUut5XpIx0uiVtj7kgiemaQaXMBz+3OuYjF1y0RkkNtN7u8bYHhvtOMlG
 OTbisKJRBJGL8yJ58+kXxvx9XA5/LtCLUHaDHAMcd7GwkYhjBSyaWutbLDHbJUwUXetHcDFN24
 Zb43Cz2qUdUk7TnVQPf0XZADKY+GCmoUBZ20sjPrkFQ7BCzL4XYVXs7rlh+b/K1+4yIWk1i+Kw
 9HY=
X-SBRS: 2.7
X-MesageID: 23353359
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23353359"
Subject: Re: [PATCH] x86/vmce: Dispatch vmce_{rd,wr}msr() from
 guest_{rd,wr}msr()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200722101809.8389-1-andrew.cooper3@citrix.com>
 <20200723100727.GA7191@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ccc153a5-cf65-c483-43ea-d6b864366e06@citrix.com>
Date: Thu, 23 Jul 2020 12:00:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723100727.GA7191@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 11:07, Roger Pau Monné wrote:
> On Wed, Jul 22, 2020 at 11:18:09AM +0100, Andrew Cooper wrote:
>> ... rather than from the default clauses of the PV and HVM MSR handlers.
>>
>> This means that we no longer take the vmce lock for any unknown MSR, and
>> accesses to architectural MCE banks outside of the subset implemented for the
>> guest no longer fall further through the unknown MSR path.
>>
>> With the vmce calls removed, the hvm alternative_call()'s expression can be
>> simplified substantially.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> LGTM, I just have one question below regarding the ranges.
>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/hvm/hvm.c         | 16 ++--------------
>>  xen/arch/x86/msr.c             | 16 ++++++++++++++++
>>  xen/arch/x86/pv/emul-priv-op.c | 15 ---------------
>>  3 files changed, 18 insertions(+), 29 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 5bb47583b3..a9d1685549 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -3560,13 +3560,7 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>           break;
>>  
>>      default:
>> -        if ( (ret = vmce_rdmsr(msr, msr_content)) < 0 )
>> -            goto gp_fault;
>> -        /* If ret == 0 then this is not an MCE MSR, see other MSRs. */
>> -        ret = ((ret == 0)
>> -               ? alternative_call(hvm_funcs.msr_read_intercept,
>> -                                  msr, msr_content)
>> -               : X86EMUL_OKAY);
>> +        ret = alternative_call(hvm_funcs.msr_read_intercept, msr, msr_content);
>>          break;
>>      }
>>  
>> @@ -3696,13 +3690,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
>>          break;
>>  
>>      default:
>> -        if ( (ret = vmce_wrmsr(msr, msr_content)) < 0 )
>> -            goto gp_fault;
>> -        /* If ret == 0 then this is not an MCE MSR, see other MSRs. */
>> -        ret = ((ret == 0)
>> -               ? alternative_call(hvm_funcs.msr_write_intercept,
>> -                                  msr, msr_content)
>> -               : X86EMUL_OKAY);
>> +        ret = alternative_call(hvm_funcs.msr_write_intercept, msr, msr_content);
>>          break;
>>      }
>>  
>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>> index 22f921cc71..ca4307e19f 100644
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -227,6 +227,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>          *val = msrs->misc_features_enables.raw;
>>          break;
>>  
>> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
>> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
>> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
> Where do you get the ranges from 0 to 31? It seems like the count
> field in the CAP register is 8 bits, which could allow for up to 256
> banks?
>
> I'm quite sure this would then overlap with other MSRs?

Irritatingly, nothing I can find actually states an upper architectural
limit.

SDM Vol4, Table 2-2 which enumerates the Architectural MSRs.

0x280 thru 0x29f are explicitly reserved MCx_CTL2, which is a limit of
32 banks.  There are gaps after this in the architectural table, but
IceLake has PRMRR_BASE_0 at 0x2a0.

The main bank of MCx_{CTL,STATUS,ADDR,MISC} start at 0x400 and are
listed in the table up to 0x473, which is a limit of 29 banks.  The
Model specific table for SandyBridge fills in the remaining 3 banks up
to MSR 0x47f, which is the previous limit of 32 banks.  (These MSRs have
package scope rather than core/thread scope, but they are still
enumerated architecturally so I'm not sure why they are in the model
specific tables.)

More importantly however, the VMX MSR range starts at 0x480, immediately
above bank 31, which puts an architectural hard limit on the number of
banks.

>> +    case MSR_IA32_MCG_EXT_CTL:                           /* 0x4d0 */
>> +        if ( vmce_rdmsr(msr, val) < 0 )
>> +            goto gp_fault;
>> +        break;
>> +
>>      case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
>>          if ( !is_hvm_domain(d) || v != curr )
>>              goto gp_fault;
>> @@ -436,6 +444,14 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>>          break;
>>      }
>>  
>> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
>> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
>> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
>> +    case MSR_IA32_MCG_EXT_CTL:                           /* 0x4d0 */
>> +        if ( vmce_wrmsr(msr, val) < 0 )
>> +            goto gp_fault;
>> +        break;
>> +
>>      case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
>>          if ( !is_hvm_domain(d) || v != curr )
>>              goto gp_fault;
>> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
>> index 254da2b849..f14552cb4b 100644
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -855,8 +855,6 @@ static int read_msr(unsigned int reg, uint64_t *val,
>>  
>>      switch ( reg )
>>      {
>> -        int rc;
>> -
>>      case MSR_FS_BASE:
>>          if ( is_pv_32bit_domain(currd) )
>>              break;
>> @@ -955,12 +953,6 @@ static int read_msr(unsigned int reg, uint64_t *val,
>>          }
>>          /* fall through */
>>      default:
>> -        rc = vmce_rdmsr(reg, val);
>> -        if ( rc < 0 )
>> -            break;
>> -        if ( rc )
>> -            return X86EMUL_OKAY;
>> -        /* fall through */
>>      normal:
> We could remove the 'normal' label and just use the default one
> instead.

You can't "goto default;" which is what a number of paths between these
two hunks do.

I do however have a plan to clean this up in due course.

~Andrew


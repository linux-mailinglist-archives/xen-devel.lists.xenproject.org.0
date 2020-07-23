Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6678922AD75
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 13:17:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyZEO-0003Nx-RE; Thu, 23 Jul 2020 11:17:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyZEM-0003Nq-UT
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:17:43 +0000
X-Inumbo-ID: 1f6aefe2-ccd6-11ea-a27f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f6aefe2-ccd6-11ea-a27f-12813bfff9fa;
 Thu, 23 Jul 2020 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595503062;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=z0Fi62eFfvWzl4FKaC8rv7RJqCwnE5cHtJaqlHI+aIM=;
 b=KEdJXvdto4tMn0QgBc+0Dd2y5RFpOQKj/YadFZF+LrVNEX3FgTA+sNQa
 AokohYmdVs7Wxy2Q/qjomjvxnMvBSOTvTgHhuahBn2P4uV6K8h8RJX1vf
 8QayS05Fn0mOhCraH+tiMI4CCQ7ToaJA47DThnzaOxf6zQ8Gj/ULZuPr/ 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: y/85bcAa3FC1Ch+hia4US6SjegNJX2bm1nOrAfHj5eQLDQCgL0L968L5FYLvhqeOy0adYLyxv8
 J3QJcjfWVncCjYliyenMP2Z088u8bX4PmeqV745oCOFWNJDpPhAOwfDwUcDfWTXYXf5qELEz1y
 w2zol5+mC2fS61sTGnMfIs0EwSxTMtUQwo5Zm+Aba61w72p0MgGnazhI1O2zhcA2Xa5s/XhkTk
 jGym3SjeHyPZRb7pzjZJbP4b+kzZd86lggdaif1gYWYwaS+YeKiyGs2YctCeRM6MDMGDDV1b5W
 fFE=
X-SBRS: 2.7
X-MesageID: 23024645
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23024645"
Subject: Re: [PATCH] x86/vmce: Dispatch vmce_{rd,wr}msr() from
 guest_{rd,wr}msr()
To: Jan Beulich <jbeulich@suse.com>
References: <20200722101809.8389-1-andrew.cooper3@citrix.com>
 <76851f30-2003-2fee-221a-df70907ee91c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4c5edb17-faf8-7b8b-a896-2d60696a3bf2@citrix.com>
Date: Thu, 23 Jul 2020 12:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <76851f30-2003-2fee-221a-df70907ee91c@suse.com>
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 11:37, Jan Beulich wrote:
> On 22.07.2020 12:18, Andrew Cooper wrote:
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -227,6 +227,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>          *val = msrs->misc_features_enables.raw;
>>          break;
>>  
>> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
>> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
>> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
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
> With this the two functions also possibly returning 0 or 1 becomes
> meaningless. Would you think you can make then return bool at this
> occasion, or would you prefer to leave this to whenever someone
> gets to clean up this resulting anomaly? (I'm fine either way, but
> would prefer to not see the then meaningless tristate return values
> left in place.)

The entire internals of vmce_{wr,rd}msr() need an overhaul.

I tried switching them to use X86EMUL_* (at which point they will match
all the other subsystems we hand off MSR blocks to), but that quickly
turned into a larger mess than I have time for right now.  I've still
got the partial work so far, and will finish it at some point.

~Andrew


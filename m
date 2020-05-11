Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05761CE515
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 22:09:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYEiO-0006BK-26; Mon, 11 May 2020 20:07:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYEiM-0006BF-5Y
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 20:07:50 +0000
X-Inumbo-ID: 160aa344-93c3-11ea-a24d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 160aa344-93c3-11ea-a24d-12813bfff9fa;
 Mon, 11 May 2020 20:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589227669;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5CxL0G0DnbnCGUkgIk9oli1/xZEqe1Hx0HCv+dYZnEs=;
 b=AdvwuSisgZKzRU64dn9KWlaE/93zqU9uFTsts1Of95USNor6AJ2Xwe9m
 7Fcs9YyejEMBfXBDomG7wjeYf2y5bPzViYdAl1C4ihz+dbNxy0qZ3xrAE
 2QkRI6b8hTpF+FM44+ORj5ImhxaIqF0aCvV7QgsBk94EC9OHCgKBOr8pS 4=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: AmCvXBpqQGe40+yP2Fk0H2wO9yR9USNe/T0nbqCUFxyNw0FPHhvVqz4ylJeeAEDafRXgyHes4S
 dbj0kdELT6MfXqu0ptfv/dls8cPHK84UzaFWJ6V7gZvGr5ZS2TkeNVUfpAVcJ2nYEef/N/8ZzF
 YK0L2+xyFk+9B/WbP2qSA3P0BJmlSAm6Ulbp+bJH1U0wLunxlphrtSPp9/pHBHhRtaQNmWQRkg
 Jb+71ccocn7FMdf9X81AojbOTPS1QGlPf5pnrvCxaaYMVYjJLc1en2DqBczvLzp2Xvrp2EEduA
 KSY=
X-SBRS: 2.7
X-MesageID: 17273758
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,381,1583211600"; d="scan'208";a="17273758"
Subject: Re: [PATCH 10/16] x86/cpu: Adjust reset_stack_and_jump() to be shadow
 stack compatible
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-11-andrew.cooper3@citrix.com>
 <4c0dfd8f-38c0-ca32-886d-94cb4698e63b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <49be63a5-1edc-cfc4-2081-e6ce8ae87a70@citrix.com>
Date: Mon, 11 May 2020 21:07:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4c0dfd8f-38c0-ca32-886d-94cb4698e63b@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On 07/05/2020 14:17, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> We need to unwind up to the supervisor token.  See the comment for details.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/include/asm-x86/current.h | 42 +++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 39 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
>> index 99b66a0087..2a7b728b1e 100644
>> --- a/xen/include/asm-x86/current.h
>> +++ b/xen/include/asm-x86/current.h
>> @@ -124,13 +124,49 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>  # define CHECK_FOR_LIVEPATCH_WORK ""
>>  #endif
>>  
>> +#ifdef CONFIG_XEN_SHSTK
>> +/*
>> + * We need to unwind the primary shadow stack to its supervisor token, located
>> + * at 0x5ff8 from the base of the stack blocks.
>> + *
>> + * Read the shadow stack pointer, subtract it from 0x5ff8, divide by 8 to get
>> + * the number of slots needing popping.
>> + *
>> + * INCSSPQ can't pop more than 255 entries.  We shouldn't ever need to pop
>> + * that many entries, and getting this wrong will cause us to #DF later.
>> + */
>> +# define SHADOW_STACK_WORK                      \
>> +    "mov $1, %[ssp];"                           \
>> +    "rdsspd %[ssp];"                            \
>> +    "cmp $1, %[ssp];"                           \
>> +    "je 1f;" /* CET not active?  Skip. */       \
>> +    "mov $"STR(0x5ff8)", %[val];"               \
> As per comments on earlier patches, I think it would be nice if
> this wasn't a literal number here, but tied to actual stack
> layout via some suitable expression. An option might be to use
> 0xff8 (or the constant to be introduced for it in the earlier
> patch) here and ...
>
>> +    "and $"STR(STACK_SIZE - 1)", %[ssp];"       \
> ... PAGE_SIZE here.

It is important to use STACK_SIZE here and not PAGE_SIZE to trigger...

>> +    "sub %[ssp], %[val];"                       \
>> +    "shr $3, %[val];"                           \
>> +    "cmp $255, %[val];"                         \
>> +    "jle 2f;"                                   \

... this condition if we try to reset&jump from more than 4k away from
0x5ff8, e.g. from a IST stack.

Whatever happens we're going to crash, but given that we're talking
about imm32's here,

> Perhaps better "jbe", treating the unsigned values as such?

What I really want is actually to opencode an UNLIKLEY() region seeing
none of our infrastructure works inside inline asm.  Same for...

>
>> +    "ud2a;"                                     \

... this to turn into a real BUG.

~Andrew


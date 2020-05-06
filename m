Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B6D1C770D
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 18:49:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWNEi-0003HY-2f; Wed, 06 May 2020 16:49:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdQ7=6U=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWNEg-0003HT-VA
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 16:49:31 +0000
X-Inumbo-ID: 8d72c136-8fb9-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d72c136-8fb9-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588783770;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=J7Zk9KjUudpNmeIavEPpapZ54N6Ni8oIRzXY6TpxSOc=;
 b=f6Y+9Xs5nNCTdm3q+y5JCX/FeTOevKmG3anbYjQfi5R7m4rZCSOIl/d6
 IYN3S/xHiuVX7gOU40j9mhLNyzAZO31KmxgZkPpHFlUhI/hG7A7wdkGFz
 vMsjqRRqYfXi0xfgrL4brBjG4pFn5ltcOgoqmXDghyK01as8m7vzWWR2Y c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eSDl6Q1sGO08BBrwYQPIYhweIE+S4UKr3twNbR/tCIm0O80s7uoDJe/FaWe31gllIMwmgQ/K+h
 V3Rp0HqPqys3dIt8f9aqSuadfR92qN28Q8wZn+mTet5sJBrtnsgPBjYsoqxEzum6JIN051i04w
 n9md28d1nuxCRa/lQHcRIBld1u4CcS3A9E3faAFfS/zIDY6pNqQd/mQ/qVHupeeFe4tuqrMX25
 Kc86VKaYS1sRy43DDrMDdJ9n1Qs0iJG64fgPvOKxrxGEDk8QVf4RdtBJeSqXkUSThgbAwkkTTk
 W4U=
X-SBRS: 2.7
X-MesageID: 17583608
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,360,1583211600"; d="scan'208";a="17583608"
Subject: Re: [PATCH] x86/svm: Clean up vmcbcleanbits_t handling
To: Jan Beulich <jbeulich@suse.com>
References: <20200505173250.5916-1-andrew.cooper3@citrix.com>
 <961921e3-c882-dad0-837e-71644f8bf208@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d64d8593-9d88-2d42-69dc-c1d8b7018c99@citrix.com>
Date: Wed, 6 May 2020 17:49:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <961921e3-c882-dad0-837e-71644f8bf208@suse.com>
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

On 06/05/2020 16:10, Jan Beulich wrote:
> On 05.05.2020 19:32, Andrew Cooper wrote:
>> @@ -435,17 +435,13 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>      ASSERT(n2vmcb != NULL);
>>  
>>      /* Check if virtual VMCB cleanbits are valid */
>> -    vcleanbits_valid = 1;
>> -    if ( svm->ns_ovvmcb_pa == INVALID_PADDR )
>> -        vcleanbits_valid = 0;
>> -    if (svm->ns_ovvmcb_pa != nv->nv_vvmcxaddr)
>> -        vcleanbits_valid = 0;
>> -
>> -#define vcleanbit_set(_name)	\
>> -    (vcleanbits_valid && ns_vmcb->cleanbits.fields._name)
>> +    if ( svm->ns_ovvmcb_pa != INVALID_PADDR &&
>> +         svm->ns_ovvmcb_pa != nv->nv_vvmcxaddr )
>> +        clean = ns_vmcb->cleanbits;
> It looks to me as if the proper inversion of the original condition
> would mean == on the right side of &&, not != .

Oops, yes.  Fixed.

>
>> --- a/xen/include/asm-x86/hvm/svm/vmcb.h
>> +++ b/xen/include/asm-x86/hvm/svm/vmcb.h
>> @@ -384,34 +384,21 @@ typedef union
>>  
>>  typedef union
>>  {
>> -    uint32_t bytes;
>> -    struct
>> -    {
>> -        /* cr_intercepts, dr_intercepts, exception_intercepts,
>> -         * general{1,2}_intercepts, pause_filter_count, tsc_offset */
>> -        uint32_t intercepts: 1;
>> -        /* iopm_base_pa, msrpm_base_pa */
>> -        uint32_t iopm: 1;
>> -        /* guest_asid */
>> -        uint32_t asid: 1;
>> -        /* vintr */
>> -        uint32_t tpr: 1;
>> -        /* np_enable, h_cr3, g_pat */
>> -        uint32_t np: 1;
>> -        /* cr0, cr3, cr4, efer */
>> -        uint32_t cr: 1;
>> -        /* dr6, dr7 */
>> -        uint32_t dr: 1;
>> -        /* gdtr, idtr */
>> -        uint32_t dt: 1;
>> -        /* cs, ds, es, ss, cpl */
>> -        uint32_t seg: 1;
>> -        /* cr2 */
>> -        uint32_t cr2: 1;
>> -        /* debugctlmsr, last{branch,int}{to,from}ip */
>> -        uint32_t lbr: 1;
>> -        uint32_t resv: 21;
>> -    } fields;
>> +    struct {
>> +        bool intercepts:1; /* 0:  cr/dr/exception/general1/2_intercepts,
>> +                            *     pause_filter_count, tsc_offset */
> Could I talk you into omitting the 1/2 part, as there's going to
> be a 3 for at least MCOMMIT? Just "general" ought to be clear
> enough, I would think.

Can do.  I'm not overly happy about this spilling onto two lines, but I
can't think of how to usefully shrink the comment further without losing
information.

~Andrew


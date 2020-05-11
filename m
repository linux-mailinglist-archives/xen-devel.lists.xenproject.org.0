Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E771CE181
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 19:20:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYC6A-0000zO-I2; Mon, 11 May 2020 17:20:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYC69-0000zJ-OD
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 17:20:13 +0000
X-Inumbo-ID: ac24b670-93ab-11ea-9887-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac24b670-93ab-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589217612;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=V4AWX8xeCPie/Pw176bJsSk4E5fPG4JRdKC6J9P9dDg=;
 b=QFqBSWaA6HOav11pto/aKiwVNzUVsjFH5CZcC0eX8W81tEW6eyTWRyym
 Cdjsq82BN9Sa6A40Q8zgrZxm9YJ8jRa8JmmV3xP6zSToSyOyuajyTJFhF
 uOVZKbFOcin/vPoO0QJtu8Ba4JuwULKn+D39npteyf+/sRSrX6f6+yEFF g=;
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
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 2lDwPoN6XwKW149XCgLpOVaYISXx3JP8MRpoHwDL3QnAsLr/LdrTBu+d6TjHE0zUkisYk8FYjM
 kwZcmUgCJKsDycWv9gOgLXHEPtahQBPta0cMaDQgC8eN7TiMXvSo36StWSS9gRkoiHghuKSp15
 HMlLiCr0+utEgtzdmbkvHFCD385NVKX2hKYue9X/CC3YDF6EUW+Bi8SWzD1Js7Ll3pgDiWA9gE
 /APtBN76qln9diU4uWQCDk3fAIkBmhdeBLuL2P6aRN5JBxWAo7oQ474wUM50PhwLV+aIlu8Sra
 6eU=
X-SBRS: 2.7
X-MesageID: 17930201
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17930201"
Subject: Re: [PATCH 06/16] x86/traps: Implement #CP handler and extend #PF for
 shadow stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-7-andrew.cooper3@citrix.com>
 <561914ce-d076-8f1a-e74b-7c37567480a1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b7cbee0d-2215-e600-e755-48a329e0786d@citrix.com>
Date: Mon, 11 May 2020 18:20:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <561914ce-d076-8f1a-e74b-7c37567480a1@suse.com>
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

On 04/05/2020 15:10, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> @@ -1457,6 +1451,10 @@ void do_page_fault(struct cpu_user_regs *regs)
>>      {
>>          enum pf_type pf_type = spurious_page_fault(addr, regs);
>>  
>> +        /* Any fault on a shadow stack access is a bug in Xen. */
>> +        if ( error_code & PFEC_shstk )
>> +            goto fatal;
> Not going through the full spurious_page_fault() in this case
> would seem desirable, as would be at least a respective
> adjustment to __page_fault_type(). Perhaps such an adjustment
> could then avoid the change (and the need for goto) here?

This seems to do a lot of things which have little/nothing to do with
spurious faults.

In particular, we don't need to disable interrupts to look at
PFEC_shstk, or RSVD for that matter.

>> @@ -1906,6 +1905,43 @@ void do_debug(struct cpu_user_regs *regs)
>>      pv_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
>>  }
>>  
>> +void do_entry_CP(struct cpu_user_regs *regs)
> If there's a plan to change other exception handlers to this naming
> scheme too, I can live with the intermediate inconsistency.

Yes.  This isn't the first time I've introduced this naming scheme
either, but the emulator patch got stuck in trivialities.

> Otherwise, though, I'd prefer a name closer to what other handlers
> use, e.g. do_control_prot(). Same for the asm entry point then.

These names are impossible to search for, because there is no
consistency even amongst the similarly named ones.

>
>> @@ -940,7 +944,8 @@ autogen_stubs: /* Automatically generated stubs. */
>>          entrypoint 1b
>>  
>>          /* Reserved exceptions, heading towards do_reserved_trap(). */
>> -        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || (vec > TRAP_simd_error && vec < TRAP_nr)
>> +        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || \
>> +                vec == TRAP_virtualisation || (vec > X86_EXC_CP && vec < TRAP_nr)
> Use the shorter X86_EXC_VE here, since you don't want/need to
> retain what was there before? (I'd be fine with you changing
> the two other TRAP_* too at this occasion.)

Ok.

Having played this game several times now, I'm considering reworking how
do_reserved_trap() gets set up, because we've now got two places which
can go wrong and result in an unhelpful assert early on boot, rather
than a build-time failure.  (The one thing I'm not sure on how to do is
usefully turn this into a build time failure.)

>
>> --- a/xen/include/asm-x86/processor.h
>> +++ b/xen/include/asm-x86/processor.h
>> @@ -68,6 +68,7 @@
>>  #define PFEC_reserved_bit   (_AC(1,U) << 3)
>>  #define PFEC_insn_fetch     (_AC(1,U) << 4)
>>  #define PFEC_prot_key       (_AC(1,U) << 5)
>> +#define PFEC_shstk         (_AC(1,U) << 6)
> One too few padding blanks?

Oops.

~Andrew


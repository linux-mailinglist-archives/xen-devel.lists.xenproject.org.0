Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1E7D86DC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 18:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623923.972208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw3Os-0005P7-Gh; Thu, 26 Oct 2023 16:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623923.972208; Thu, 26 Oct 2023 16:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw3Os-0005MH-E2; Thu, 26 Oct 2023 16:40:02 +0000
Received: by outflank-mailman (input) for mailman id 623923;
 Thu, 26 Oct 2023 16:40:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivkI=GI=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qw3Or-0005Bw-NC
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 16:40:01 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d4d5fbb-741e-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 18:39:59 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d9d8284abso723809f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 09:39:59 -0700 (PDT)
Received: from smtpclient.apple ([90.243.16.33])
 by smtp.gmail.com with ESMTPSA id
 f10-20020adff98a000000b0031aef72a021sm14585350wrr.86.2023.10.26.09.39.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Oct 2023 09:39:58 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4d4d5fbb-741e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698338398; x=1698943198; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drlToy5+TZ/eRuyjCCtF8OaHAbSMAdWdSJdcchEbaEg=;
        b=H5g1l2DqaCTpanmsq0lEdmfAVMMHwClrh8Owaslplcc6YR9VgwAgsQ44jtdxjlNJ9+
         65KHMr0SDXmLJniFcbN9rZr16xAWlU5FGHZ+iwYPOAv6Rn/qrQ1PwNRIuRYdoEEOFF+8
         +qPcdl1guPUJsEMCjoXiXtEQwVhjLowIAYGz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698338398; x=1698943198;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drlToy5+TZ/eRuyjCCtF8OaHAbSMAdWdSJdcchEbaEg=;
        b=mtHcxyQjD/j4HXEbpLa4RM3232ul+OGlCPDdJ3IzjFxh1FO3ARUCUbfWfaL2TBsCzd
         JRAVTKsRSzSy2wlsAMDpvmJmY4/6IILqKXxT/7RODauvDdmnPQCioS1BIbWAZ2+VMhWG
         JqnD7GAy68YYFeWBG3yD0ktqhpw5fMQAxXigQegX4rSuB1ACShj20SL9ukaoQKPAkrOv
         igRem5fqocmZus0lq+9fEOA1QYZAkgPIQb2BObNsVUEo1ny42MhA1mAT/TJuTjPuJ1s2
         ENamjX5/4ho7Kt1R/dCbqRkXUzd2npO+Tez95DcUtQ5z5lpq/xqojxtA9yu5oW+2ptDU
         SGGg==
X-Gm-Message-State: AOJu0YwOv4yBqGv9kNALWVChA8iBhsZ5tpsdwjo8XYLU3fcxEXQyTRdz
	MFhQbPWmfTLRxcYGFFM8dUHlAg==
X-Google-Smtp-Source: AGHT+IE/6QZbg3rbvNfECaycIqqkMZ9NzyQoROMR+oLiPwkQHxRF8llZff9gKboDOMynulqWAhsGVg==
X-Received: by 2002:adf:f0c4:0:b0:329:6b5b:57b8 with SMTP id x4-20020adff0c4000000b003296b5b57b8mr131444wro.25.1698338398466;
        Thu, 26 Oct 2023 09:39:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [RFC PATCH 22/22] x86/AMD: add IRPerf support
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <20d0e946-f156-4472-a253-7517e831f44d@citrix.com>
Date: Thu, 26 Oct 2023 17:39:47 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9ACEDF9-0A4B-45D2-90A2-92D9EEB89A9B@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <6cd765e98fa4888b9e94215f3572a94e95fe2a4b.1698261255.git.edwin.torok@cloud.com>
 <20d0e946-f156-4472-a253-7517e831f44d@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 25 Oct 2023, at 21:59, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 25/10/2023 8:29 pm, Edwin T=C3=B6r=C3=B6k wrote:
>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>> index 483b5e4f70..b3cd851d9d 100644
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -584,6 +584,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, =
uint64_t val)
>>         }
>>         break;
>>=20
>> +    case MSR_K8_HWCR:
>> +        if ( !(cp->x86_vendor & X86_VENDOR_AMD) ||
>> +             (val & ~K8_HWCR_IRPERF_EN) ||
>> +             wrmsr_safe(msr, val) !=3D 0 )
>> +            goto gp_fault;
>> +        break;
>> +
>>     case MSR_AMD64_DE_CFG:
>>         /*
>>          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a =
#GP:
>> diff --git a/xen/include/public/arch-x86/cpufeatureset.h =
b/xen/include/public/arch-x86/cpufeatureset.h
>> index 5faca0bf7a..40f74cd5e8 100644
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -241,7 +241,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /*   =
APERF/MPERF Read Only interface */
>>=20
>> /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
>> XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
>> -XEN_CPUFEATURE(IRPERF,        8*32+ 1) /* Instruction Retired =
Performance Counter */
>> +XEN_CPUFEATURE(IRPERF,        8*32+ 1) /*A! Instruction Retired =
Performance Counter */
>> XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} =
always saves/restores FPU Error pointers */
>> XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
>> XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no =
IBRS, used by AMD) */
>=20
> Last things first.  You can advertise this bit to guests, but I'm
> looking at the AMD manuals and woefully little information on what =
this
> is an how it works.
>=20
> It does have an architectural enumeration, but there isn't even a a
> description of what HWCR.IPERF_EN does.
>=20
> The HWCR documentation says "enables Core::X86::Msr::IRPerfCount", but
> the IRPERF MSR says no such think,

> noting only that EFRO_LOCK makes the
> MSR non-writeable (which in turn means we can't always offer it to
> guests anyway.  See below).

> At a guess, the HWCR bit activates the counter, but nothing states
> this.


My version =
(https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/prog=
rammer-references/24593.pdf) says:
"This is a dedicated counter that is always counting instructions =
retired. It exists at MSR address C000_00E9. It is enabled by setting a =
1 to HWCR[30] and its support is indicated by CPUID Fn8000_0008_EBX[1]."

Although digging a bit more there are some erratas around deep C states =
on some chips and the HWCR register itself is not global but per CCD =
(which is neatly buried in the _ccd[7:0]_.... smallprint at the top:
https://github.com/cyring/CoreFreq/issues/206#issuecomment-722713147


>   At a guess, it's a free-running, reset-able counter, but again
> nothing states this.  The manual just says "is a dedicated counter" =
and
> doesn't even state whether it is (or is not) tied into the other core
> fixed counters and whether it is integrated with PMI or not.

There is also a LWP 'Instructions Retired' described in 13.4.2.2, which =
is user-mode only and per-core, but I assume that is completely =
different from this MSR
and part of the features that got dropped in newer cores.

>=20
> Which brings us on to the middle hunk.  Putting it there short =
circuits
> the PV-specific handling, but you can't do that in general without
> arranging for HWCR to be context switched properly for vCPUs, nor in
> this case IPERF_COUNT itself.
>=20
> Unless you context switch HWCR and IPERF_COUNT, a guest will see it =
not
> counting, or the count going backwards, 50% of the time as the vCPU is
> scheduled around.
>=20
> So while in principle we could let guests use this facility (it would
> have to be off by default, because there doesn't appear to be any
> filtering capability in it at all, so we can't restrict it to
> instructions retired in guest context), it will need a far larger =
patch
> than this to do it safely.

Thanks, I'll move this patch into the 'needs more work' category.


Thanks,
--Edwin



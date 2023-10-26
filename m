Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE787D8700
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 18:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623928.972219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw3Xm-0007Fj-EC; Thu, 26 Oct 2023 16:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623928.972219; Thu, 26 Oct 2023 16:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw3Xm-0007Dg-AL; Thu, 26 Oct 2023 16:49:14 +0000
Received: by outflank-mailman (input) for mailman id 623928;
 Thu, 26 Oct 2023 16:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivkI=GI=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qw3Xk-0007DZ-Lr
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 16:49:12 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95fa7456-741f-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 18:49:10 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so775451f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 09:49:10 -0700 (PDT)
Received: from smtpclient.apple ([90.243.16.33])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a5d62c6000000b0032196c508e3sm14515795wrv.53.2023.10.26.09.49.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Oct 2023 09:49:09 -0700 (PDT)
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
X-Inumbo-ID: 95fa7456-741f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698338950; x=1698943750; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K+PQ0ohq0AZfnAUyub1IQxxJDPGgoGmu3D71UDCQpg=;
        b=eyr2zUPQE169uUMHlS9tgnA8cPq/1ab0uqiDNQdmIJUPEO/f67YacqimHMJgVTSVpj
         1IzV07W0YXxp0JPsSqxVcNeIPAyxy493UBMudMIk0waFFmGacSWAKRaQ3Kis1wWHdfxy
         bsVkFMTL5wmqwzqMQHK0Mbpry9OvPR9pzB398=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698338950; x=1698943750;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K+PQ0ohq0AZfnAUyub1IQxxJDPGgoGmu3D71UDCQpg=;
        b=mFRHVUtLQfkDRMrHZDHO2C6kxy8r8tPn4jsWzGOITnMdT5sdol8CEDrr5q5LYcNOn+
         hd5bS/oTIQn4FRac34Xt4drIXCwkhEyOnhJbeMKnAkejna7D2X7K6MjYgKrmwXAIwqlU
         55HW1G7HnfOyt9y96cB9qJ1hHbB26WRKpj7UNeQ32pm3VmYUR7KF2sH2Dvb1YSu+MxxS
         baJlucYxEJXVYqwITUlUPOJLxVhrDt3fwBtGE9Q3/HW1ZK21l98/ORxShHrYssezDp8n
         mOLZ20S/7P8kTkaRmU4pMWPXvWR24XLZKDYdVcVi7hD2WvCQgxYO+FjSFdk47oSW157Q
         0gHw==
X-Gm-Message-State: AOJu0YwdfxEyhBAfNQRFvtxnLqEjJ9yF056pJ1Y1ZLaDB7kk9L8Iui2/
	gD17UNG9D0yTon/lvfX+JNFPJg==
X-Google-Smtp-Source: AGHT+IEYsqQxyG0b3sSgjuFHPwEPzANAW4yhJSFWd+O80OWzHnp8teu3p99VPWK9pseJBNgaZw1CJg==
X-Received: by 2002:adf:ea4e:0:b0:31c:3136:60af with SMTP id j14-20020adfea4e000000b0031c313660afmr137671wrn.61.1698338949928;
        Thu, 26 Oct 2023 09:49:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [RFC PATCH 01/22] x86/msr: MSR_PLATFORM_INFO shouldn't claim that
 turbo is programmable
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <596186ca-53cb-4ccf-b719-95a587018c38@citrix.com>
Date: Thu, 26 Oct 2023 17:48:58 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C040881-8DF0-4CF6-A843-8C1558B5B740@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <17a99e1da838a2edeeffa5a988e22c6fcb31406b.1698261255.git.edwin.torok@cloud.com>
 <596186ca-53cb-4ccf-b719-95a587018c38@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 25 Oct 2023, at 21:33, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 25/10/2023 8:29 pm, Edwin T=C3=B6r=C3=B6k wrote:
>> From: Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix.com>
>>=20
>> Xen forbids writes to the various turbo control MSRs, however =
MSR_PLATFORM_INFO claims that these MSRs are writable.
>> Override MSR_PLATFORM_INFO bits to indicate lack of support.
>>=20
>> See Intel SDM Volume 4, 2.17.6 "MSRs Introduced in the Intel Xeon =
Scaslable Processor Family",
>> which describes that MSR_PLATFORM_INFO.[28] =3D 1 implies that =
MSR_TURBO_RATIO_LIMIT is R/W,
>> and similarly bit 29 for TDP control, and bit 30 for =
MSR_TEMPERATURE_TARGET.
>>=20
>> These bits were not all present on earlier processors, however where =
missing the bits were reserved,
>> and when present they are always present in the same bits.
>>=20
>> (Curiously bit 31 that Xen uses is not documented anywhere in this =
manual but a separate one).
>>=20
>> Backport: 4.0+
>>=20
>> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix.com>
>=20
> p->platform_info never has any bit other than cpuid_faulting set in =
it.=20
> We still don't even report the proper raw value, because we don't =
(yet)
> have clean MSR derivation logic.
>=20
> I'm confused as to how you managed to find these set.  Even back in =
Xen
> 4.13, PLATFORM_INFO was covered by the msr_policy (later merged into
> cpu_policy).  Furthermore, even patch 3 oughtn't to have such an =
effect.
>=20
> Sadly, the whole of this MSR is model specific.  Vol4 2.17 is only for
> one SKX/CLX/ICX/SPR.  Technically its wrong to treat the =
cpuid_faulting
> in the way we do, but it is enumerated separately, and we =
intentionally
> don't have an Intel check because we need to emulate CPUID faulting on
> AMD hardware to make PVShim work.
>=20

xen/lib/x86/msr.c:    COPY_MSR(MSR_INTEL_PLATFORM_INFO, =
p->platform_info.raw);

This code made me believe that the underlying MSR value was copied, and =
only specific values from it were overwritten, I didn't spot any =
zeroing.
Although running rdmsr now (on 4.13.5) does show that all the other bits =
are zero, so the zeroing must happen somewhere else in the code, making =
this patch obsolete.
I'll drop it.

Thanks,
--Edwin

> ~Andrew



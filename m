Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F27DC9CB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 10:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625553.974934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlGx-0001y3-Ge; Tue, 31 Oct 2023 09:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625553.974934; Tue, 31 Oct 2023 09:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlGx-0001wI-E3; Tue, 31 Oct 2023 09:42:55 +0000
Received: by outflank-mailman (input) for mailman id 625553;
 Tue, 31 Oct 2023 09:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6UM=GN=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qxlGv-0001wC-Qz
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 09:42:53 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc93b580-77d1-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 10:42:52 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4094301d505so13936815e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 02:42:52 -0700 (PDT)
Received: from smtpclient.apple ([90.243.16.33])
 by smtp.gmail.com with ESMTPSA id
 s3-20020adff803000000b0032f7fab0711sm1053633wrp.93.2023.10.31.02.42.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Oct 2023 02:42:52 -0700 (PDT)
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
X-Inumbo-ID: dc93b580-77d1-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698745372; x=1699350172; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZL1NpQKB1C3cjeiPjdsLoLwAWjRdpdAPuIU8Uj8yQFQ=;
        b=H4A+kaTORKXQkfmKIYyLrrhUscqQQ+Vkqf96u8fdsJA0yNC5phOElYzKVhnLcPurwV
         Iet8foiOj8XU0wVFWv9aPiwxjU3lrwvlbvAVc8F8Xu0/WzSfsWgecOEXLypohKlRK6kC
         kTzzIXy8yaKKWyWD44M+hfA9mgr5dd4/TLtjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698745372; x=1699350172;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZL1NpQKB1C3cjeiPjdsLoLwAWjRdpdAPuIU8Uj8yQFQ=;
        b=TrQF47dJh/VgJ7EK/HsREKbs3tc2szXB30xfPIQBz3yb8JqPOxcSaJ/vnYP2fma40W
         6t1MbDHnFV3pR0egE3RU1c3xTaSSet9GqfdPZHYLsj8G+898IktH+MjFP3DD0o60jM+p
         XbkpbQX5rbPt3Yzu/Ry3GeDCXYweW0NjJREGN+pKggMtq7c31itnTQpxL4L5NA1FSohJ
         WT8osvRRL/951I6lsHcZnK0XYpehu2MOrjpYVchIPxCUf7QM2pZgpD//ATpbX+Ppsybp
         Z1gP+uC1Bh1NVoj+tDyJI87qjoLxD8BKelwTO3CsmVlSBtHg5KGku77q8ZHqtiRTK1w+
         Mkpw==
X-Gm-Message-State: AOJu0YyqwQer8bNtTQkpYzBDyBRjQVHoE2Uie6ckOlSeefqPTJfxOzt4
	1QuhbY3C0ftSQrVicR18lGNRXw==
X-Google-Smtp-Source: AGHT+IES4emjF3kzIgBpyN3QL3zSyYWOPfxg/yZGUjinHzd7htTq+9oIfiFnEpgBge815KXWUQcD8A==
X-Received: by 2002:a05:600c:c0f:b0:409:50b4:3da8 with SMTP id fm15-20020a05600c0c0f00b0040950b43da8mr1192709wmb.38.1698745372361;
        Tue, 31 Oct 2023 02:42:52 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [RFC PATCH 02/22] x86/msr: implement MSR_SMI_COUNT for Dom0 on
 Intel
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <6fc915a9-4415-3337-3b3d-cef0e9f735c1@suse.com>
Date: Tue, 31 Oct 2023 09:42:41 +0000
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E50DC831-A8A6-468C-9CF1-C60F6695304A@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <9d950b3c5502b5fb5fad62845b56b15d1bacc2d6.1698261255.git.edwin.torok@cloud.com>
 <6fc915a9-4415-3337-3b3d-cef0e9f735c1@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 30 Oct 2023, at 16:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.10.2023 21:29, Edwin T=C3=B6r=C3=B6k wrote:
>> Dom0 should always be able to read this MSR: it is useful when
>> investigating performance issues in production.
>=20
> While I'm not outright opposed, I'm also not convinced. At the very =
least
> ...
>=20
>> Although the count is Thread scoped, in practice all cores were =
observed
>> to return the same count (perhaps due to implementation details of =
SMM),
>> so do not require the cpu to be pinned in order to read it.
>=20
> ... this, even if matching your observations, is going to be properly
> misleading in case counts end up diverging.
>=20
>> This MSR exists on Intel since Nehalem.
>>=20
>> Backport: 4.15+
>=20
> If this was a backporting candidate, I think a Fixes: tag would need
> to indicate what's being fixed here.


I used the Backport tag to indicate what is the oldest release that it =
is backportable to.
IIRC the choices were:
* 4.0+ for issues that were present for a long time (didn't look further =
back than that in history), so there isn't any particular commit that =
introduces the problem, it was like that from the very beginning, i.e. =
not a regression.

* 4.13+ for issues affecting only new CPU support (I think that is the =
release that added Icelake support). I can attempt to find the commit =
that added Icelake support and mark them as Fixes: that commit (although =
there might be several of them)

* 4.15+ for bugs introduced by the default read-write msr changes


> Otherwise this is merely a new
> feature.
>=20

Prior to the default rdwrmsr changes it was possible to read any MSR, so =
I consider it a bug that after the default rdwrmsr changes you can no =
longer do that, it takes away a valuable debugging tool.
I can attempt to find a more specific commit to indicate with Fixes:

>> --- a/xen/arch/x86/include/asm/msr-index.h
>> +++ b/xen/arch/x86/include/asm/msr-index.h
>> @@ -641,6 +641,9 @@
>> #define MSR_NHL_LBR_SELECT 0x000001c8
>> #define MSR_NHL_LASTBRANCH_TOS 0x000001c9
>>=20
>> +/* Nehalem and newer other MSRs */
>> +#define MSR_SMI_COUNT                       0x00000034
>=20
> See my comment on the other patch regarding additions here.
>=20
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -139,6 +139,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, =
uint64_t *val)
>>         *val =3D msrs->misc_features_enables.raw;
>>         break;
>>=20
>> +    case MSR_SMI_COUNT:
>> +        if ( cp->x86_vendor !=3D X86_VENDOR_INTEL )
>> +            goto gp_fault;
>> +        if ( is_hardware_domain(d) && !rdmsr_safe(msr, *val) )
>> +            break;
>> +        return X86EMUL_UNHANDLEABLE;
>=20
> Why #GP for non-Intel but UNHANDLEABLE for DomU?

I wanted to match the behaviour of the 'default:' case statement, =
although looking at the other MSR handling code in this file they just =
usually gp_fault,
with the exception of the MSR_K8* code that returns UNHANDLEABLE, so if =
condition here could be simplified (e.g. follow how MSR_AMD_PATCHLEVEL =
does it).

Best regards,
--Edwin=20

>=20
> Jan



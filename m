Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547E7DDE37
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626185.976192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7Kt-0004Zr-BD; Wed, 01 Nov 2023 09:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626185.976192; Wed, 01 Nov 2023 09:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7Kt-0004XZ-8F; Wed, 01 Nov 2023 09:16:27 +0000
Received: by outflank-mailman (input) for mailman id 626185;
 Wed, 01 Nov 2023 09:16:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z8cj=GO=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qy7Ks-0004XN-2Y
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:16:26 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5492357e-7897-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:16:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso50900135e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 02:16:25 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s26-20020adfa29a000000b003232380ffd5sm3595894wra.106.2023.11.01.02.16.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Nov 2023 02:16:24 -0700 (PDT)
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
X-Inumbo-ID: 5492357e-7897-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698830184; x=1699434984; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZs7Y4zGvAWTj8U3RHw5HeGotBqtrQCezqYt8W+ln7M=;
        b=I9WlFaUMO2bqeaXXR32QlT+T7Vfzuoc8TDf8tgy9XdoEHNbDga6B4YE6CZuCWSmFfp
         KYiqzB300YrDR3qGPD0l3LFDdiDhItioFY7Bpwn8S49MVkS8SQNt/TZO4S2M6DTZDMGX
         jg2ucHPT2X+t8L2rbJ7SX/bAPs7WG2Tb5579I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698830184; x=1699434984;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZs7Y4zGvAWTj8U3RHw5HeGotBqtrQCezqYt8W+ln7M=;
        b=djNV5QcnVS0xC448Km+4pIfKkgfNLcuJI1Ne+SNJl/TdiYJ14bHXbf0Ck70PAvCzRY
         22959J1T+EmM63YR1aZSKKNBSJQVRln3DUvNIU2COCkHngg0d9zgXCSE7XvJTniwhmZY
         qcwDlH/EBbmOmTdMkPgHKSPzKaS3zalCVosRN+J2PYHUQXcrziSkGZRwmwWC4Y0X4WGk
         oeOijbcvdt2GHQIR6iks+GCyAANu3ZLKV3ODpChipha1+qW0ERUJIdGMoib6bVD5Kuu7
         FByUx7Z+X5kN3Wn/hzW4zs7X+NvKwx4+DffHapGOOMWF4o/NfitqviF8RUC/G+uQmEXD
         5WFQ==
X-Gm-Message-State: AOJu0YwiHCi16eUDgc474XgfLTkT/6fBdFXkDXCp8PFQRWzOp4EKPJMj
	QRSc7ZOPTHhfDCfmd7nuFoCmGg==
X-Google-Smtp-Source: AGHT+IFTTE0o22gChz8IwH5TXgf4st6BF811Cb/E6DKPsFi81TYyeyvRyxhMaywYEqGPIx3hOx+MJQ==
X-Received: by 2002:a5d:4a0c:0:b0:32d:a3ee:6f73 with SMTP id m12-20020a5d4a0c000000b0032da3ee6f73mr10095775wrq.42.1698830184398;
        Wed, 01 Nov 2023 02:16:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [RFC PATCH 02/22] x86/msr: implement MSR_SMI_COUNT for Dom0 on
 Intel
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <2a2927b0-460b-eb52-54e1-3777dae66d11@suse.com>
Date: Wed, 1 Nov 2023 09:16:13 +0000
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C5202D3F-A109-42E9-8BB2-54FD4E9BC25D@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <9d950b3c5502b5fb5fad62845b56b15d1bacc2d6.1698261255.git.edwin.torok@cloud.com>
 <6fc915a9-4415-3337-3b3d-cef0e9f735c1@suse.com>
 <E50DC831-A8A6-468C-9CF1-C60F6695304A@cloud.com>
 <2a2927b0-460b-eb52-54e1-3777dae66d11@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 31 Oct 2023, at 09:57, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 31.10.2023 10:42, Edwin Torok wrote:
>>> On 30 Oct 2023, at 16:20, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 25.10.2023 21:29, Edwin T=C3=B6r=C3=B6k wrote:
>>>> Dom0 should always be able to read this MSR: it is useful when
>>>> investigating performance issues in production.
>>>=20
>>> While I'm not outright opposed, I'm also not convinced. At the very =
least
>>> ...
>>>=20
>>>> Although the count is Thread scoped, in practice all cores were =
observed
>>>> to return the same count (perhaps due to implementation details of =
SMM),
>>>> so do not require the cpu to be pinned in order to read it.
>>>=20
>>> ... this, even if matching your observations, is going to be =
properly
>>> misleading in case counts end up diverging.
>>>=20
>>>> This MSR exists on Intel since Nehalem.
>>>>=20
>>>> Backport: 4.15+
>>>=20
>>> If this was a backporting candidate, I think a Fixes: tag would need
>>> to indicate what's being fixed here.
>>=20
>>=20
>> I used the Backport tag to indicate what is the oldest release that =
it is backportable to.
>> IIRC the choices were:
>> * 4.0+ for issues that were present for a long time (didn't look =
further back than that in history), so there isn't any particular commit =
that introduces the problem, it was like that from the very beginning, =
i.e. not a regression.
>>=20
>> * 4.13+ for issues affecting only new CPU support (I think that is =
the release that added Icelake support). I can attempt to find the =
commit that added Icelake support and mark them as Fixes: that commit =
(although there might be several of them)
>>=20
>> * 4.15+ for bugs introduced by the default read-write msr changes
>>=20
>>=20
>>> Otherwise this is merely a new
>>> feature.
>>>=20
>>=20
>> Prior to the default rdwrmsr changes it was possible to read any MSR, =
so I consider it a bug that after the default rdwrmsr changes you can no =
longer do that, it takes away a valuable debugging tool.
>=20
> As said elsewhere, making MSRs generally inaccessible was a deliberate =
change.
> I don't think any of us x86 maintainers has so far considered that as =
introducing
> a bug. MSRs being accessible as a debugging tool may be worthwhile to =
have as an
> optional feature (see my suggestion elsewhere as to a possible way to =
approach
> this), but I don't think this can be taken as an indication that we =
should revert
> back to "blind" exposure.
>=20


This particular patch (unlike the other one that is more general for all =
MSRs) is about one specific MSR, and makes it accessible to Dom0 only in =
a read-only way.
That is very different from blindly exposing it to all guests.
Anyway let me get something ready for master first, and then =
distributions that package Xen can decide whether to backport this patch =
or not, I'll replace Backport: 4.X with Backportable: 4.X (and add a =
Fixes: line) to indicate that this patch is recommended to be backported =
(for anyone who uses that version of Xen in production).

[I'm not saying that this patch is complete, as you've indicated there =
is more work required to make it work correctly wrt to pinning vs =
non-pinning, and I'll try to require a pinned Dom0 core in my next =
version]

Best regards,
--Edwin


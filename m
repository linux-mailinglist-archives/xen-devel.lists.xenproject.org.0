Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AFE98A4A3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 15:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807399.1218826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svGL0-0000Jd-6p; Mon, 30 Sep 2024 13:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807399.1218826; Mon, 30 Sep 2024 13:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svGL0-0000GF-3j; Mon, 30 Sep 2024 13:21:18 +0000
Received: by outflank-mailman (input) for mailman id 807399;
 Mon, 30 Sep 2024 13:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svGKy-0000G9-I3
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 13:21:16 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de20ee84-7f2e-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 15:21:14 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53959a88668so3414453e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 06:21:14 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a043b112sm1220646e87.229.2024.09.30.06.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:21:13 -0700 (PDT)
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
X-Inumbo-ID: de20ee84-7f2e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727702474; x=1728307274; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9C1ppLEP2XvC/3B/IACvLbfWTCkvryj+ji0vQDSylIs=;
        b=S8PLsxhlkxj2yMt5ahtoGTlEaZ88at0GrsNj77WhQDiiEt/Lao7QGql0xyr5u9jETa
         tROL9GsBRovk+9cPBT0vLbU4esTA305PXPNyIWGC+52xwLmFqRvLEN0mgIn2aulV69ti
         tyZK+d1HqinbT9egU0AcT5pAFoR+B1zEz8LkAViRIWvZSY1oLUszljfycI5bOimNFOrB
         Zh+vpPha/B6EXo81/KYkkpwOlpxj8a8hX6aDQIjtUTSs3B0mQW0Ti6R3YbX8AQt3PoTS
         O7rJVwG7eja3GiSboilJw4VY/iqVLALphzpNOiSm6OKcahhXsj2R+7FW8c1oD5CtAsnp
         k6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727702474; x=1728307274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9C1ppLEP2XvC/3B/IACvLbfWTCkvryj+ji0vQDSylIs=;
        b=Dq5lEyBlh5pKxrInMX7XOUB48mtphUWQK+verAdRWf8FhUh8K8GUPzwecFSGRkZTvE
         8+Q0EIFDEyTZl/UZOfXmgfNM7EupECUZtAoU7ZXaBYab1g+52o6HqF3JeLx5Z9cgdfKa
         ILbs4Ay3uj2VBGmt7QATtgVRO3R1Jk9G/9zj4v07FqBSZD8jUq1FjXJXp+GQ8olAUfe2
         kc4A8MUORE4zKPqLUexwGH6BKor2G/XJldiXDXxYFDq8nFQ/y4utimwmvlRrAdAN6Ba2
         L2j+WCZIQzSAsPWC45R74AhKt1SqEvB96msTcY5jWuXOiysgqiccV6Jzn9IOSWsKelPt
         45bA==
X-Forwarded-Encrypted: i=1; AJvYcCXUodKn/ZfX9mqrF2dXFzvdCZBrGDb1C0/pXHazj5pfSD5tenWcY7rcjQT+kvDKwSf+DzAPrGf8E68=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywhu+yccL0/0e1Tb9fqPGJ5lhHPR9pLoTNNG5FwjQEfdoD60obV
	+4hl4EX2GGL/3+da0sMRINfzrFYQFAY4vb2hbvNIFHJiFFAk2PP7
X-Google-Smtp-Source: AGHT+IGLi8wRpMtV95WhbS6qC1Q5ic824ertY+eKxaLAL4cQSBaUjeyYIMbXD6j4bPHq6GcFPDwaBQ==
X-Received: by 2002:a05:6512:3089:b0:536:14a1:d660 with SMTP id 2adb3069b0e04-5389fc3592bmr6449399e87.6.1727702473482;
        Mon, 30 Sep 2024 06:21:13 -0700 (PDT)
Message-ID: <f2a461b7d13ab010cca2f94d4438c52e80d0735c.camel@gmail.com>
Subject: Re: [PATCH v2 6/8] CHANGELOG.md: Add NXP S32CC and SCMI-SMC layer
 support mentions
From: oleksii.kurochko@gmail.com
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>, Community
 Manager <community.manager@xenproject.org>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Date: Mon, 30 Sep 2024 15:21:12 +0200
In-Reply-To: <f106bcfb-c868-4e85-99fa-8c6ae804cd5b@suse.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
	 <20240930114715.642978-7-andrei.cherechesu@oss.nxp.com>
	 <f106bcfb-c868-4e85-99fa-8c6ae804cd5b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-30 at 14:53 +0200, Jan Beulich wrote:
> On 30.09.2024 13:47, Andrei Cherechesu (OSS) wrote:
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -11,6 +11,10 @@ The format is based on [Keep a
> > Changelog](https://keepachangelog.com/en/1.0.0/)
> > =C2=A0=C2=A0=C2=A0 - Prefer ACPI reboot over UEFI ResetSystem() run tim=
e service
> > call.
> > =C2=A0
> > =C2=A0### Added
> > +=C2=A0 - On Arm:
>=20
> Nits (style): One less indenting blanks here, but ...
>=20
> > +=C2=A0=C2=A0 - Add support for NXP S32CC platforms and NXP LINFlexD UA=
RT
> > driver.
> > +=C2=A0=C2=A0 - Add basic handling for SCMI requests over SMC using Sha=
red
> > Memory,
> > +=C2=A0=C2=A0 by allowing forwarding the calls to EL3 FW if coming from=
 Dom0.
>=20
> ... two more of them on this last line.
With the suggested changes applied: Acked-by: Oleksii Kurochko
oleksii.kurochko@gmail.com

~ Oleksii


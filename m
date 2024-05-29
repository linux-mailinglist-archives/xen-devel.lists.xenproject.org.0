Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0954A8D2F67
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731594.1137186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEHj-00021Z-EM; Wed, 29 May 2024 08:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731594.1137186; Wed, 29 May 2024 08:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEHj-0001zA-BU; Wed, 29 May 2024 08:03:47 +0000
Received: by outflank-mailman (input) for mailman id 731594;
 Wed, 29 May 2024 08:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCEHi-0001z0-CG
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:03:46 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8295c1b-1d91-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:03:44 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2e716e3030aso15967521fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 01:03:44 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcd73acsm24683021fa.29.2024.05.29.01.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 01:03:41 -0700 (PDT)
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
X-Inumbo-ID: f8295c1b-1d91-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716969823; x=1717574623; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cwlm85y15hvEBwmwyKTMv8ZFXNIJ7y0Stx07S583OOQ=;
        b=f84lZxyc1PlEoCvxvfgh4R7Z2ZLiOmWNaJER9o69AE7vr1OUHQbMxpsGu2ADzOO6vE
         ErHQXttu5YjTgmVpkiHrG8MHph9Ceg7DjwyQSwr1CvkR1dVFkPnpNVny1LOwhBI61puX
         SBx85i1qik3D96mUtrHADBhrYvIX8ppe4OPsyKZOSUUWieTXCTEqYbpLIuCiQPvVWx3s
         pzotZPTRhlwdY6SElVbDS0KFD9onnJAV9j7/KrJS+zmK1PU8T+hOBcp/SZvnX8UPuCJA
         lEGEQ/pIDnfJwyG2/z2XgVvEjkv3zVoMuF8p5u/0pZrnUqrSmp5m7eIB1zvCEmv5Foql
         hrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969823; x=1717574623;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cwlm85y15hvEBwmwyKTMv8ZFXNIJ7y0Stx07S583OOQ=;
        b=Pz6gwAFTaAHQGLrAGo1SeYU2GwWYP269yZF8Vx9hDchE8+uKDaoZai5G92hTIxu+ke
         uHkLc2TkymmjNOmis3wqszQy2giCqoxgBjWR/r7hkeLDUCxSAGVA0s/ND8VJisQYDnv0
         NGMVGoYVOSkXvbObUTjOkYs+hej+Zvet6aBFloJKKjCIDMvJG63Cchs4351fhgdOSroj
         /ytxVIfiSEtgfKilX1J633OISGlTy8grcaVT60zV8+pWUFgjl/5/Szp+xM3Rq8IdARTg
         mRwPjdv6JyX823nQUlLKccMp3QJT0TA7i6OhnuhVSHlJRn/Xe5UstN21VLWXiASwEwig
         whNQ==
X-Gm-Message-State: AOJu0YxVearGcy5XfOPBa0g3N+K0A5zgvYuVrTf9M0KK+sLI/LBmW2HD
	1A0hHc0Psk4rcvDWc0gp7A92SjOx/V60emNA6WEkMn90xgrglW8IpjDJkLhC
X-Google-Smtp-Source: AGHT+IEucP+Ht4k1hx3HGvoBTWJctR13u69mYAuMoYihHdUT04IFGF405mIJQJgQVGKeKmWJiQ7UOA==
X-Received: by 2002:a2e:3c18:0:b0:2ea:7db8:7ce6 with SMTP id 38308e7fff4ca-2ea7db87ec8mr3209811fa.38.1716969822089;
        Wed, 29 May 2024 01:03:42 -0700 (PDT)
Message-ID: <e9514fa9fc0a0ea9eae2f0c4accf9b3060e95f9e.camel@gmail.com>
Subject: Updated Xen 4.19 schedule
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Wed, 29 May 2024 10:03:41 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

Hello everyone,

I would like to announce that I have decided to update the Xen 4.19
schedule due to the extended feature freeze period and the upcoming Xen
Summit next week.

I propose the following updates:
   Code Freeze: from May 31 to June 7
   Hard Code Freeze: from June 21 to June 28
   Final commits: from July 5 to July 12
   Release: July 17
The release date is shifted, but it still remains in July, which seems
acceptable to me.

One more thing:
No release ack is needed before Rc1. Please commit bug fixes at will.

Have a nice day.

Best regards,
Oleksii


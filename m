Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2866C4548
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513191.793841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peu8J-0005j6-FX; Wed, 22 Mar 2023 08:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513191.793841; Wed, 22 Mar 2023 08:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peu8J-0005gG-Cp; Wed, 22 Mar 2023 08:47:47 +0000
Received: by outflank-mailman (input) for mailman id 513191;
 Wed, 22 Mar 2023 08:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WEjj=7O=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1peu8I-0005gA-AO
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:47:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 364239c4-c88e-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 09:47:44 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id j24so7251580wrd.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 01:47:44 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600000ce00b002be505ab59asm13250110wrx.97.2023.03.22.01.47.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Mar 2023 01:47:43 -0700 (PDT)
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
X-Inumbo-ID: 364239c4-c88e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679474863;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbH+WCv8BNhc37zfPS03bncde4neJ9M5FS5k8XUUnXA=;
        b=ft12kcjsYJuXYVjQzS2ZvCcyWZX9NyD7WcNO4L8sUFVtY3dhjuTca+UByATOLpKApC
         +40BC1jBgDu6uGdm2rdoDDJhAUZE6aAfNqWK8A8VZmlIxuf7tMIzrohJHZ8MVnB9Yxij
         lTU4gT3EZIcyWyJSiMkDAs4wzpHWNbfQBPeiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679474863;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbH+WCv8BNhc37zfPS03bncde4neJ9M5FS5k8XUUnXA=;
        b=fmpgDvUZDNs599vDus0GL04cx59pMIOd/oTT6pM5LEV6dgMNpYf4KdHW5FuWEkQRcl
         EKQ26r4E+BiJxDZpdn//d3lEvombV4fQ1Vy6XvYs0IapIxGAIUCQep2PuJ9FBi8hFmFc
         iC0STWMmxtgNQja1TH2uIfLihqIkiuW8pFn07VI3xI5XYEDU+dOSL2RKyr9xWur/hUwb
         jCTLiTs7LWMVMH0+TjaKyh5w+eMCXcHcWJFxEwi0o0CKNtzMzLMVisb3afdu9dzbbKnv
         ny0fvGNwY/sIXYK/nZ4gqI19BSB651eBEJQbe7Y5eTUMda5JRQoh72+xi83SsxLL6qaD
         lbdQ==
X-Gm-Message-State: AO0yUKVpl8fHZNp1HfImX1hpk5dzBol1fo+/DM5iT5bYidYqjpvf7irz
	7gKhv9aoVXxZEg+7TQwPGRsxaw==
X-Google-Smtp-Source: AK7set+2yU1zOAUPXFo0eFV8TG4u2ca2RAGgHFwa2l6/viWvOstD1fXz5HR0DdbCpNXC74bZ8C2J1Q==
X-Received: by 2002:a05:6000:1081:b0:2ce:ae4c:c42d with SMTP id y1-20020a056000108100b002ceae4cc42dmr4313907wrw.1.1679474863629;
        Wed, 22 Mar 2023 01:47:43 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3 08/10] tools: add physinfo arch_capabilities handling
 for Arm
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <947E57EC-84AC-4B4E-8146-ADEC9FD518EF@arm.com>
Date: Wed, 22 Mar 2023 08:47:42 +0000
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A8FB11F3-97A9-447B-8611-D992B6489C1A@cloud.com>
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
 <20230317131949.4031014-9-luca.fancellu@arm.com>
 <5C1E6204-51FD-4C97-8182-848F30A4A58B@cloud.com>
 <947E57EC-84AC-4B4E-8146-ADEC9FD518EF@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 22 Mar 2023, at 07:02, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> I don=E2=80=99t understand, what entry is being overwritten? If I =
understood it correctly, I=E2=80=99m writing the position 10 of physinfo
> which is not written before.
>=20
> Cheers,

Sorry, I read this wrong. We are in #elif which I read as #ifdef in my =
head.

Acked-by: Christian Lindig <christian.lindig@cloud.com>


=E2=80=94 C=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5343374BCCE
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 10:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560670.876757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qI3Q9-0007mB-9z; Sat, 08 Jul 2023 08:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560670.876757; Sat, 08 Jul 2023 08:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qI3Q9-0007jH-6W; Sat, 08 Jul 2023 08:36:01 +0000
Received: by outflank-mailman (input) for mailman id 560670;
 Sat, 08 Jul 2023 08:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYjS=C2=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1qI3Q7-0007j8-So
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 08:35:59 +0000
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74dcae7b-1d6a-11ee-8611-37d641c3527e;
 Sat, 08 Jul 2023 10:35:56 +0200 (CEST)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-c5ce57836b8so2999353276.1
 for <xen-devel@lists.xenproject.org>; Sat, 08 Jul 2023 01:35:56 -0700 (PDT)
Received: from smtpclient.apple (static-198-54-130-120.cust.tzulo.com.
 [198.54.130.120]) by smtp.gmail.com with ESMTPSA id
 e10-20020a25e70a000000b00c60a6b38427sm1464731ybh.26.2023.07.08.01.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 01:35:54 -0700 (PDT)
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
X-Inumbo-ID: 74dcae7b-1d6a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688805355; x=1691397355;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4S330Y1ApVNWThsngzKZa4UmS/ppCsmaZ5//4lF6HWE=;
        b=AQVIHbRUmazKH/8K1LQ48gxN8v7jYXf/KIveAkPxy+56XjDcXcGYtdQ9pLgcE7dgVo
         +OxJHT8YR/OjaqHpOKBjPcZ52uY32S9Iffe8gi+i3H8MchS44AkGhuEc9mFO7m8hjY6t
         heKM9ChmaihdSpt3crX1LCm3lNvXsuu/llaZpTSTZVwXsjUu89F+HJsZ+SwVmH0Ljvp5
         8MBduhsrNBeNWl53SMy+nzS9ZbC0ORtqaTz+8BFWNJHmBb/fCo3TvV2MrXDFewugIusC
         An6fM0wcu1SKZE999PbaQQkFOP1R1WvKfPRg/K+kiIzvxZPhi9sVQsRino96BX5fkD5l
         fJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688805355; x=1691397355;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4S330Y1ApVNWThsngzKZa4UmS/ppCsmaZ5//4lF6HWE=;
        b=OMR3XxLj/vvbfh8g9EnGY0FrCluntmHnN8JYr9o26pFdir3TVEqd+n9h6Nr6SpP2JJ
         /WPuruf9DfjSBClyNdOq16xSQGXHcF4wIWgxGDcYloJbnBl50VN+N+umOl9hVg+NuT84
         nEp7zOFGLlTzoGvjzvrf6LVuDWdStlcJrt2SkaVl2EyQxu7QwqfJjabw8ZFRDQp+bTnO
         rGFSSqcZpJ7PvDVXGxjxojZiu5LwM74yaUns/tD2tVZpxRd4wZtn0b5IE/nOZaMdRHlq
         perBH+Zmtc7/+XEifhdtAhgcOHTcpxj0SYbsRT6OcBwCluYT1STjuZ+lc6msJhMDNcrD
         gclg==
X-Gm-Message-State: ABy/qLYUN/NNikoQFWjkR1rJH1WwM5ZWZ46NzDcySlpQE2MGP6YJzo7t
	wWtd5Xm+9xG05o8WSPGe8hc=
X-Google-Smtp-Source: APBJJlFW8cjPGbbpspi40P44RWxWeKltA8tzwgvQBcsVjitAYdcvPCFCAaBNXXYRQ5PED0RhYTQBHg==
X-Received: by 2002:a25:6e0b:0:b0:c69:ba82:c335 with SMTP id j11-20020a256e0b000000b00c69ba82c335mr5475670ybc.21.1688805355428;
        Sat, 08 Jul 2023 01:35:55 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Date: Sat, 8 Jul 2023 04:35:43 -0400
Message-Id: <7C4F691F-1C60-48EF-A1B6-B358DF16B13B@gmail.com>
References: <4CAC8F69-ABE0-47D7-9421-77F0719B9BDE@arm.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Rian Quinn <rianquinn@gmail.com>, Ian Jackson <iwj@xenproject.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Scott Davis <scott.davis@starlab.io>, Adam Fraser <adam@starlab.io>,
 Paul Durrant <paul@xen.org>, rsmith@riversideresearch.org,
 m.a.young@durham.ac.uk, Elliott Mitchell <ehem+xen@m5p.com>,
 openxt <openxt@googlegroups.com>, Jason Andryuk <jandryuk@gmail.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
In-Reply-To: <4CAC8F69-ABE0-47D7-9421-77F0719B9BDE@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>
X-Mailer: iPad Mail (20F75)

On Jul 8, 2023, at 03:29, Luca Fancellu <luca.fancellu@arm.com> wrote:
> =EF=BB=BF
>>>>=20
>>>> Instead, the use case configurations should themselves be describable.
>>>=20
>>> Thanks Christopher, Daniel and all!
>>>=20
>>> So if I understand correctly, you are in favor if renaming Dom0less to
>>> Hyperlaunch throughout the Xen codebase? And we need a clarification of
>>> the docs/, especially docs/features/dom0less.pandoc?
>>=20
>> Christopher wrote:
>>>> =3D Community resourcing
>>=20
>> Note the pre-requisite work items for upstream Xen, listed under "Communi=
ty Resourcing", to merge code for Hyperlaunch common interfaces and test cas=
es, with docs on configuration of Hyperlaunch to deliver functionality for d=
om0less use cases.
>=20
> Are you saying that before renaming the =E2=80=9Cdom0less=E2=80=9D feature=
, we should wait for it to be ported to the common code?

Why "wait"? In what timeframe do you expect dom0less to use Hyperlaunch code=
?

Can kernel component foo adopt the name of kernel component bar without code=
 change?

Can dom0less stakeholders derive Hyperlaunch benefits without using Hyperlau=
nch code?

Rich


P.S. An intellectual property story from Cambridge, UK
https://en.wikipedia.org/wiki/Leibniz=E2=80=93Newton_calculus_controversy
https://www.smithsonianmag.com/history/ten-famous-intellectual-property-disp=
utes-18521880/

"By the early 18th century, many credited the German mathematician and philo=
sopher Gottfried Wilhelm Leibniz with inventing the study of calculus. Leibn=
iz had, after all, been the first to publish papers on the topic in 1684 and=
 1686. But when Englishman Isaac Newton published a book called Opticks in 1=
704, in which he asserted himself as the father of calculus, a debate arose.=
 Each of the thinkers=E2=80=99 respective countries wanted to stake a claim i=
n what was one of the biggest advances in mathematics."



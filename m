Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294F8391BA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 15:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670515.1043351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSI5m-0005SB-Ny; Tue, 23 Jan 2024 14:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670515.1043351; Tue, 23 Jan 2024 14:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSI5m-0005Q9-Kt; Tue, 23 Jan 2024 14:49:34 +0000
Received: by outflank-mailman (input) for mailman id 670515;
 Tue, 23 Jan 2024 14:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSI5l-0005Q3-5Z
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 14:49:33 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e213e5f-b9fe-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 15:49:32 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cf0eba6a30so11202301fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 06:49:32 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a0564020f1a00b0055c0dba33b7sm419591eda.18.2024.01.23.06.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 06:49:31 -0800 (PST)
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
X-Inumbo-ID: 9e213e5f-b9fe-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706021371; x=1706626171; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k5SU8HDvJXS/miUkS75zneZmkLhT6LXjtdvOtw/xfB8=;
        b=MVS7rkSJpg3qTQryz1yMwRhSNvEJQtfTy+QrcU+ZfKB6/KI4X1sBPKJCnvYSMFj+HC
         jRo+cr4wd+Fuf7mURA7CpUP+yTmTuszB8sO5zdwPshblaBQXMijxKdduOLKeyBMqdZ9V
         AmFks02QhXQ8n4zGxxauius/Y8Pp+1ZP5s4Vm+wVJniVqxdRl7BEfkpWPnnmNiz59dqZ
         YD8Wh9SuhltyHLnbITao83MaCXor2B6yi8PU0lWaSeKL7yLIlfbQa9rXgZWzBBGqrTNV
         TBPfoCOMIyknj4JyztoqC7p75z9uNuDEdHPmTTABHZpWtRzGN3pCSZOF6QRRBIQ03eCb
         otDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706021371; x=1706626171;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5SU8HDvJXS/miUkS75zneZmkLhT6LXjtdvOtw/xfB8=;
        b=C0n62uBca3f/SKzWzRes0DCek987FZGv/h2NScPgphyJsIAXvj+88gPnc5l9gmpKSj
         f503UIVfWn4eihXjYXX0FtvyiFf6FwZt8EMozfXxW1kX3supLlN7bYVvXkapTL74OgfO
         kPznzlUBxK+0cYIyxwDKTZC5L/FmL4aTStVPqtExZ9RwK0kIyKkTt2DhNJ+aHf3OAUTw
         9jgluK99//odgUVikiXYyf0gdGAj94e/RVHjYdwgiqa/xLXGEXK2hF21RNgv3ehMBEHQ
         6SVzOWtzLY336fWJP91LgBtI4KJf8DXth4L4JwkCG9p3M+SgsRUMe2F8pxgUmLcxAC8D
         TDTw==
X-Gm-Message-State: AOJu0YzZQQGJcSGdyXkVVBiOdMOMh30fpvWdk9AEkfqxeBIbILAPfXC/
	lMWlVRg3fA9zodg/zT1wSfv1TVW0OWIUmhMQq/U0HuViM3l48CjR
X-Google-Smtp-Source: AGHT+IG/0FblsiWLtU4/K7R26t84d394TWAaUzDgPifOCNJkiB4aafDAv/WKpDvYulsJ1ZQ+br/C4Q==
X-Received: by 2002:a2e:a445:0:b0:2cd:f62d:adb2 with SMTP id v5-20020a2ea445000000b002cdf62dadb2mr2793785ljn.87.1706021371368;
        Tue, 23 Jan 2024 06:49:31 -0800 (PST)
Message-ID: <2a08cae2c6db049dc08db59f38c4e75573e37064.camel@gmail.com>
Subject: Re: [PATCH v3 34/34] xen/README: add compiler and binutils versions
 for RISC-V64
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 16:49:30 +0200
In-Reply-To: <88a7e5af-197b-41ef-b3c2-7d4f85a3cb85@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <c4d579f02b431d6ac9366dee73ebd7ab74e44715.1703255175.git.oleksii.kurochko@gmail.com>
	 <88a7e5af-197b-41ef-b3c2-7d4f85a3cb85@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 12:22 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0Changes in V3:
> > =C2=A0 - new patch
> > ---
> > =C2=A0README | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/README b/README
> > index c8a108449e..1015a285c0 100644
> > --- a/README
> > +++ b/README
> > @@ -48,6 +48,9 @@ provided by your OS distributor:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For ARM 64-bit:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 5.1 or later
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.24 or=
 later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For RISC-V 64-bit:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 13.2.1 or later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.40 or late=
r
>=20
> That's pretty new. For gcc that's even newer than the newest release.
> If older versions really won't do, I don't think you can leave this
> unjustified (by having an empty description). Till now gcc 13.2 has
> served me well, and iirc 13.1, 12.3, and 12.2 were fine, too.
It can be 12.2.0 for GCC and 2.39 for GNU Binutils. ( it is toolchain
which is used by contrainer for RISC-V in Xen ). I'll update versions
then.

But could you please explain again why it can't be 13.2.1 ( it is a
version which I have in my distribution, so it is the reason why I used
this version in README file ) ?

~ Oleksii



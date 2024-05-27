Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332778D0755
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 18:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730890.1136163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcna-0006Ig-GU; Mon, 27 May 2024 16:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730890.1136163; Mon, 27 May 2024 16:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcna-0006Fa-Dx; Mon, 27 May 2024 16:02:10 +0000
Received: by outflank-mailman (input) for mailman id 730890;
 Mon, 27 May 2024 16:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClYa=M6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sBcnY-0006En-B1
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 16:02:08 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7715486e-1c42-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 18:02:06 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so17109068e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 09:02:06 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c818152sm514494166b.13.2024.05.27.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 09:02:05 -0700 (PDT)
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
X-Inumbo-ID: 7715486e-1c42-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716825726; x=1717430526; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PPYCjJtr/byV3Z9fbDfTBCC80oHiW158IudInU7r1Tk=;
        b=Ba1DuGPZ+l7Egk0YlWw9M4NWUDDjEgxMmiSpbqaa4ec36BC9QBVpIyKDB0opqseBrT
         5XSoKjWJ10f2GSR58xZ08sqHa0P5iFDlD7f7ZZmJCEJ2OoLavbFPLazAb9S8U9eIKHP5
         1wzXvhLvC+pKCdUaCdR6aZYnl9i5ud3QvDgk5WFqyQoYvqrmZ7Bo0Lw19+A7E134M8Mw
         EZQe3H1sfesTDuMtH0iiSAj70qo5c8CQmYDJwkzDozg4ZIfLr5yOwYZrTZq3jFRzrW6a
         2rx+ajxihsgyeeJ402JCaMV8JEsaALAHSV04BPcnSaPHvQ2zne/uI8r7QOTRf2AW8YE/
         sNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716825726; x=1717430526;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPYCjJtr/byV3Z9fbDfTBCC80oHiW158IudInU7r1Tk=;
        b=We2uJN7g5pVnt+dc4xYK+sUNW5RIJyDXAhGXsYixecYP6lA1SG+CdD2T8wMZuFi53Y
         CUmBfWakKOjQ40mU/ltkeqgn5diXZHP3vnu76+c6uaoPW3NH2HZgn7IgkknL+o54QMYX
         /WEtSSUnTIr7WT5aPwKsYS9zohcye0D3bP/cuLxV3X9GsroY3Nf709lU36Ua9v7BFkYc
         cYOCo+7nNU0vPk1x02KkWosXEbSfMOmLTZSMsQUF/wXyUZk5fZXmqxxwK5m3aX+R7i0l
         ZkYjoNedZeGv2EiYyPFH4oHlDq4sCGYxUwEI7nuBBlaEXIBKkGXzuTTk+6XVfLc0quns
         3TuQ==
X-Forwarded-Encrypted: i=1; AJvYcCURuUZkHvHMeZty+f4fOPsGkg7JM7uXqBys9hwGhVNbu4mO91KsVvi3bgQBiu1yo8q+bxHtNa3u72BPG1zYqTBsdNeeJww5i+0r9CXbIaM=
X-Gm-Message-State: AOJu0YyZNqkKzR0HroZOWcFmFrl1IDiw7qDxt1NCSkdnWtpWIdop4qfy
	Seqc3tCfJxCcswJ/ahR3P/06P3rStA5QZfOKXZTrKel8t6WDWMF0
X-Google-Smtp-Source: AGHT+IFifkSSZTwwlly6vlVp45YaE9JfHSduk5IroTNfnlIzcYno42kxI5urO1niXl5aXsBzWsG0QA==
X-Received: by 2002:a05:6512:549:b0:51d:5f0a:8839 with SMTP id 2adb3069b0e04-529652906bdmr7430452e87.5.1716825725385;
        Mon, 27 May 2024 09:02:05 -0700 (PDT)
Message-ID: <fa2f6393431cbd06a19e2555308c42238da7b8e4.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] CHANGELOG: Mention libxl blktap/tapback support
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>, Community Manager
	 <community.manager@xenproject.org>
Date: Mon, 27 May 2024 18:02:04 +0200
In-Reply-To: <20240407204953.60442-4-jandryuk@gmail.com>
References: <20240407204953.60442-1-jandryuk@gmail.com>
	 <20240407204953.60442-4-jandryuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Sun, 2024-04-07 at 16:49 -0400, Jason Andryuk wrote:
> From: Jason Andryuk <jason.andryuk@amd.com>
>=20
> Add entry for backendtype=3Dtap support in libxl.=C2=A0 blktap needs some
> changes to work with libxl, which haven't been merged.=C2=A0 They are
> available from this PR:
> https://github.com/xapi-project/blktap/pull/394
>=20
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> =C2=A0CHANGELOG.md | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8041cfb7d2..036328433d 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -21,6 +21,7 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for IPIs and Physical addressing mode for =
external interrupts.
> =C2=A0 - Add a new 9pfs backend running as a daemon in dom0. First user i=
s
> =C2=A0=C2=A0=C2=A0 Xenstore-stubdom now being able to support full Xensto=
re trace
> capability.
> + - libxl support for backendtype=3Dtap with tapback.
> =C2=A0
> =C2=A0### Removed
> =C2=A0- caml-stubdom.=C2=A0 It hasn't built since 2014, was pinned to Oca=
ml
> 4.02, and has

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


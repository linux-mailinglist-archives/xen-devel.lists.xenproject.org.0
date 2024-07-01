Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4503D91E351
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751766.1159824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIbr-0001JT-U4; Mon, 01 Jul 2024 15:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751766.1159824; Mon, 01 Jul 2024 15:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIbr-0001Hc-Qt; Mon, 01 Jul 2024 15:06:27 +0000
Received: by outflank-mailman (input) for mailman id 751766;
 Mon, 01 Jul 2024 15:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTSe=OB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOIbq-0001FV-I6
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:06:26 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c867e78-37bb-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 17:06:26 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso587038a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:06:26 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c834ecsm4492325a12.12.2024.07.01.08.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 08:06:24 -0700 (PDT)
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
X-Inumbo-ID: 7c867e78-37bb-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719846385; x=1720451185; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZH1ldReEuoEkEkYtz/pblFKwQj/JF1FyCey2xzRmtKY=;
        b=f7bUbASmULwn+bCZKVuFjUfPGZL/rqgjcKpYatHJv8ivOZn0dwCPzUTJZ7YLFekEt5
         qBtNz54gb5oNzKFXwnhCC/B4NwD3nzkZ/SmZzdPYyeVppHTDc0SN/0xDtq6Q/TbAtF7k
         tpVR0fsujE6Pjy+NbS9PW0juBFNjeSEKYvlen/tZkB8m2hlElsaO3y4XKnxP3i+i/jL2
         J2ph8tpmDHtl7bQr+KDgwZtZ2Cf8vV3ScxIMmc97/eYtfTCKf4ONZasNTwR48wZLTEr3
         Wf6/5G+GUfhkFpGN321e2TLEDIssaMZOolzTW9I9lGxVM9DFCDnKel0PTmbyP9EWoVzw
         BXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719846385; x=1720451185;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZH1ldReEuoEkEkYtz/pblFKwQj/JF1FyCey2xzRmtKY=;
        b=LD0C/o3Q68ZP3wf7oZ1mGFewElFkdjDU9SL9O0Oht/Y6c2l2MhQ2ArKHs3TKg17rO8
         BqUSjPIxVheAWF6+0Z9PaC4zolWuq07X/Gkiwxjy1J6qC9c/3yLFkmdsJi1/g0doCZXi
         4ojotn191T3K7lw+Y0rl9c2cu3MqU/Zr+MKt7evuXOkWpPbOakc2rZLeDBLeUDWdpK7a
         +LPzi0/RU0RA4w7KmSX3VsUIP6mnQq+5zoGBgZSMpL0N6LmG0VharhkipOQF3sa29qxY
         VpiyyKzo5I+W5jdqq9rF8hF0fGJpELcuQtD2UGfdt9YLMqNx4omCc/Sk/fe1JYOPlqGg
         GUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbqmc5RqTmvneSEnHzXYqKn96wJlUGULbzT0jPxYAU9N9UjC5oiHLLTx7C6fkkAwOt5Xys/MFugqbO6BZ80VbTnzqAivBNr0UFm0nm9aw=
X-Gm-Message-State: AOJu0Yw5tti25D5aT9xCtC8SeW8ZbkbfvTjo0dQcEhxZmeTftxv+kckG
	yURmMMdre+rynKdzts+SKpbOU1A7Pil3M8NMoyt5GXUCZbNrb0tn
X-Google-Smtp-Source: AGHT+IGPW80uyCnRyaAuyv1t/9vvhWajwTUNUHLRUBVckQPdEZJEvkJXNUoSB/lTxcwIg1hj/wY0SQ==
X-Received: by 2002:a05:6402:1ec3:b0:584:a6f8:c0c5 with SMTP id 4fb4d7f45d1cf-5879be9ac58mr4867343a12.0.1719846384891;
        Mon, 01 Jul 2024 08:06:24 -0700 (PDT)
Message-ID: <d4bbec5001a49c4032a8418373edb06fd17d1e65.camel@gmail.com>
Subject: Re: [PATCH for-4.19(?) 0/3] tools/libxs: More CLOEXEC fixes
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross
 <jgross@suse.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 01 Jul 2024 17:06:23 +0200
In-Reply-To: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
References: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-28 at 15:31 +0100, Andrew Cooper wrote:
> More fixes to CLOEXEC handling in libxenstore.=C2=A0 For 4.19, because th=
e
> first
> attempt to fix this wasn't complete.
>=20
> libxl is far worse, but I don't have time to get started on that
> mess.
>=20
> Andrew Cooper (3):
> =C2=A0 tools/libxs: Fix CLOEXEC handling in get_dev()
> =C2=A0 tools/libxs: Fix CLOEXEC handling in get_socket()
> =C2=A0 tools/libxs: Fix CLOEXEC handling in xs_fileno()
>=20
> =C2=A0tools/config.h.in=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0tools/configure=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++
> =C2=A0tools/configure.ac=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0tools/libs/store/xs.c | 68 ++++++++++++++++++++++++++++++++++------=
-
> --
> =C2=A04 files changed, 72 insertions(+), 13 deletions(-)
>=20
For the whole series:
 Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii



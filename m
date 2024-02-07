Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287484C1C5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 02:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677239.1053722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWa4-0002EQ-Td; Wed, 07 Feb 2024 01:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677239.1053722; Wed, 07 Feb 2024 01:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWa4-0002CO-Qm; Wed, 07 Feb 2024 01:18:28 +0000
Received: by outflank-mailman (input) for mailman id 677239;
 Wed, 07 Feb 2024 01:18:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KALA=JQ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXWa2-0002AG-RJ
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 01:18:26 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cade4004-c556-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 02:18:25 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5112d5ab492so154962e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 17:18:25 -0800 (PST)
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
X-Inumbo-ID: cade4004-c556-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707268705; x=1707873505; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pWn6m14NirrhfvdYf2GroV+X8QxzsnMmSoc1mjeExk=;
        b=YOZarVWhZ4mYe+DKWMnDpVFX9z5VfaRt+TOR+fEinb4vbciDOkx9ySrzLVCVQlEBZb
         hRfM7CWQX2XYVPek8Vz9CvXtxiqFQ/pABIMbDQYcNiCpvw19NOre1Ote417B9ckL8zcK
         ARoZ7ysZNScBvZLx7MpSVeCxPCsqgjrDo/9x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707268705; x=1707873505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pWn6m14NirrhfvdYf2GroV+X8QxzsnMmSoc1mjeExk=;
        b=r44gLaPKPOEZ7ie4nMaSm7slvpinUOaEtuH1+91SlDmKyOuh8FX3/ooFhgLNt+hOQh
         Vhv8i8EQSMZQKMiqvPrpc6TGrHwSPvdWCkkdTIgFFlOef2l222/c+3+gPPgk83ZbbsND
         WcdZXLS63GjiFCdaanDDxlOPKqq8lwLyucmhNbsBRO9lAfgqSbceWwiAuef95d6Ufe4m
         qCWcw8sKunLT9lsK9JxbGN06TC3xwzfQpNPAljQQLJkDQHXYy1MU5qblqFG8CWNnM2HW
         WCbGfaNEVEItGcKOHlAmnpc827f26C1UfkHzvFMzqTCuAq9Odbv2y61KhHbfLV8/sezf
         Nv0A==
X-Gm-Message-State: AOJu0YxV9Xd01JZj34YPr4YF17Em/4mA8W0XmS7uawJfrfxWnEKGUbhM
	r2lXZLZM64UtA4dX8IU9Y1tcl7sBTK1PUVwqz5EhCbbyIskw7EjlFWSsOhudQYLqdfUu/hK9LWp
	gzTSdbdOBSK7aiDc7XYisYnjBdfNq7FYqaPHvpA==
X-Google-Smtp-Source: AGHT+IENkt4ZFMs7CIcftLyruEXS+bafgv70h5gLDVhB99Nl4jfCxuEcftE3Tq+OJU1JG+13ks27XdNo+PR3eKVCQac=
X-Received: by 2002:ac2:4c0b:0:b0:511:6546:7154 with SMTP id
 t11-20020ac24c0b000000b0051165467154mr349715lfq.26.1707268705151; Tue, 06 Feb
 2024 17:18:25 -0800 (PST)
MIME-Version: 1.0
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
In-Reply-To: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 7 Feb 2024 01:18:13 +0000
Message-ID: <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com>
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 6:08=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com> =
wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> This patch addresses a behavior discrepancy in the handling of altp2m vie=
ws,
> where upon the creation and subsequent EPT violation, the page access
> permissions were incorrectly inherited from the hostp2m instead of respec=
ting
> the altp2m default_access.
>
> Previously, when a new altp2m view was established with restrictive
> default_access permissions and activated via xc_altp2m_switch_to_view(),
> it failed to trigger an event on the first access violation.  This behavi=
or
> diverged from the intended mechanism, where the altp2m's default_access
> should dictate the initial permissions, ensuring proper event triggering =
on
> access violations.
>
> The correction involves modifying the handling mechanism to respect the
> altp2m view's default_access upon its activation, eliminating the need fo=
r
> setting memory access permissions for the entire altp2m range (e.g. withi=
n
> xen-access.c).  This change not only aligns the behavior with the expecte=
d
> access control logic but also results in a significant performance improv=
ement
> by reducing the overhead associated with setting memory access permission=
s
> across the altp2m range.
>
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>

Thanks Petr, this looks like a great change.

Two things:

- Probably worth adjusting the comment at the top of
p2m_altp2m_get_or_propagate to mention that you use the altp2m
default_access when propagating from the host p2m

- This represents a change in behavior, so probably at least worth a
mention in CHANGELOG.md?

Tamas, I guess this is OK from an interface compatibility point of
view?  In theory it should always have been behaving this way.

 -George


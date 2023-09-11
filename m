Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05079A795
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 13:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599338.934705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfevN-0006Vs-Mz; Mon, 11 Sep 2023 11:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599338.934705; Mon, 11 Sep 2023 11:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfevN-0006Sn-Jk; Mon, 11 Sep 2023 11:17:49 +0000
Received: by outflank-mailman (input) for mailman id 599338;
 Mon, 11 Sep 2023 11:17:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mEGf=E3=gmail.com=idryomov@srs-se1.protection.inumbo.net>)
 id 1qfevL-0006Sf-8R
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 11:17:47 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4f222fb-5094-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 13:17:46 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a81154c570so2646421b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 04:17:46 -0700 (PDT)
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
X-Inumbo-ID: d4f222fb-5094-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694431065; x=1695035865; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyyP35WORJPhc34DqoK4EFV7Hiz+wLXmgadyY6G0U4s=;
        b=H9bfd+ysDyW9BifXbZd+9KsQknNvY/5adba8CupSOgXXa1APZFnPMNd/oGfW33e87L
         ipAWx/39fR9fFX5iIQSJ+s+NTVd0chMcfyYswezMKT4IYfmsA8a6PLLMG44Wk7dIbs5x
         gdYPYvTPm5FOAEgbO4/KdBoXiLMk9a/9CdWFK/mWQ4BdyJER80iuEuVM4zyXZ/4lEN/3
         s/KG0tJnsZoM3qqgtVOV/mG46tuct1w/USuCMAz175UcHtSwMsM5Hgj1eN3mb3bSqAsC
         3tPCPJoaZWcbbepvgQDtFJvytP+meCtCBL7+NIH4YOGOwZpJOKv36z8d3JLD/Xea7ehN
         jLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694431065; x=1695035865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyyP35WORJPhc34DqoK4EFV7Hiz+wLXmgadyY6G0U4s=;
        b=ve9xs8J5IdXHrLqELdmHlYBKIBQH9o9bSahf/Z5nkM3MSXm8NykOC0/Q5xSrI0vV1c
         /8lCTp5I7aJ0ckorIizKkXAZ/flpCELdXUCa+h3asUVvbjH677yB+iKPRRgUQjZuTCmD
         oNT3BIfNHAW04a5vEX++cQ3yZgop1bzW2I+hC6suBQvif0D8gCd2q5OHJ8d4te6IJ3T5
         aiLqdKdtarLOWTpgTK2v/HgkyuchqRvuUw3LwdnUuvGlDSEv0ynux7jp6wRIcNHxrX8F
         E7LX4mo8PKRwDCOoNeY7hgpGtxg5HAWOpMoVjSZKVDaus6Ea1+JPmztIz8sSsJ8Mp9y4
         Ys/g==
X-Gm-Message-State: AOJu0YzaMrbVJzW6xw5exMTWr4NY2ptHD3J2UeuoKKt6FuIPbLO48g/E
	mMweR9mGZf06I81Wh4rSow6iBee21SloshjEV/c=
X-Google-Smtp-Source: AGHT+IHfLSzLJ7DoisLGgPXbBMQuV2W9gGy4EzuCGlpOLGz+QL0UfCYEQ7BZEzqMDlOLutVjDy4yHBmGHDnDDidVnjU=
X-Received: by 2002:a05:6808:1795:b0:3a7:550c:635d with SMTP id
 bg21-20020a056808179500b003a7550c635dmr11058926oib.56.1694431064820; Mon, 11
 Sep 2023 04:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230831132546.3525721-1-armbru@redhat.com> <20230831132546.3525721-7-armbru@redhat.com>
In-Reply-To: <20230831132546.3525721-7-armbru@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 11 Sep 2023 13:17:32 +0200
Message-ID: <CAOi1vP8-o_5PT4ZpHVXcF+xRb-2Wpa1JaWZxTqyXLXMCzm54mA@mail.gmail.com>
Subject: Re: [PATCH 6/7] block: Clean up local variable shadowing
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, 
	eblake@redhat.com, vsementsov@yandex-team.ru, jsnow@redhat.com, pl@kamp.de, 
	sw@weilnetz.de, sstabellini@kernel.org, anthony.perard@citrix.com, 
	paul@xen.org, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
	berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, stefanha@redhat.com, 
	fam@euphon.net, quintela@redhat.com, peterx@redhat.com, leobras@redhat.com, 
	kraxel@redhat.com, qemu-block@nongnu.org, xen-devel@lists.xenproject.org, 
	alex.bennee@linaro.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 3:25=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=3Dlocal.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.

For rbd

>  block/rbd.c          |  2 +-

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya


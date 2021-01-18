Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101932FA520
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69817.125096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Wmo-0005Kd-3f; Mon, 18 Jan 2021 15:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69817.125096; Mon, 18 Jan 2021 15:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Wmo-0005KE-06; Mon, 18 Jan 2021 15:49:46 +0000
Received: by outflank-mailman (input) for mailman id 69817;
 Mon, 18 Jan 2021 15:49:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1Wmm-0005K9-FQ
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:49:44 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e4c48f7-8e92-404c-9b2f-df958ebeb9e9;
 Mon, 18 Jan 2021 15:49:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q18so16941831wrn.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 07:49:43 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id r126sm12606693wma.48.2021.01.18.07.49.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 07:49:42 -0800 (PST)
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
X-Inumbo-ID: 2e4c48f7-8e92-404c-9b2f-df958ebeb9e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=bueLRhGnMFSaD5BV6OB46NiQT5MIKIabH3Mj8UAiQbk=;
        b=KC6DuXLelzuof+WkJU5Uk/ENpVF62l3gZLtnvRvejynd67fvkZSeF/FAfFXG3viYJb
         4K+QuzI2u3D6KNaklkyNpCQj+X6GGJ5Nr9mKjF9LWu9n78t1LJu6zJG5+RIeFHyDtQoF
         v6BTM4vjArWMELLWinc90nnnVzha4M6xRb5eAzgAtJCp8GTM+1L04GkW0thymWZGqdKR
         TooM0GKVkBkwG+QjUPOZIZkkPq0sLnm5i4U66lEBinBBZ8XJnGNE/2oZQbJUuIcEz9Dr
         lp/vQGAj8PwzmCfAg9euH7RwDrqk2yw/Qlrh3AfLD0W6NXCd4SjjrhThoXMqtlAYo20A
         i2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=bueLRhGnMFSaD5BV6OB46NiQT5MIKIabH3Mj8UAiQbk=;
        b=ksI+6O7wIXK6Ry+rgfr2pZRR5GYQ0s1VaAvCGc6FGgUgT0d257n4leFm8lPLACpul8
         Nhfi1bD7SqTlSubZj8bmo38VJ+cC4aCm7M8EZriHUokq3YuLpj/0w0Q1IyvLBwsRxrG9
         f8aWwWFqjtlf4hk80pbeiH52LMM6DN6O+7bHhkRo9IJPEzcUFjdweY0c2esYQQXmg2Mr
         Ds3POJKoJt2jDlbqocSXI6rp8L2+U9f4kA5nJpgyNRUrOa2fmvcVxgAP/iDB5Af8WkvG
         2Z8TA45NGcCOHOaOX35OfWPVDzn/G87Q44S/lyut0DGY8ydHzjQ7k4rXz+bx82rFf876
         Cv/w==
X-Gm-Message-State: AOAM532CVSUNkGblUaDI7jIZvrQe5GgJG7ADHrRN6N5wdPhulaQLFrYw
	CTF3XUjgukB/nf6iI1kbl2Q=
X-Google-Smtp-Source: ABdhPJxiPC2OChaveXMqD0rIthafoYXmtdcNoEYh9vEMEVKUJD26R+IXQm6fjLZmNOUugiqBSkMK1A==
X-Received: by 2002:adf:f681:: with SMTP id v1mr97027wrp.133.1610984982739;
        Mon, 18 Jan 2021 07:49:42 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
	<qemu-devel@nongnu.org>
Cc: "'Arthur Borsboom'" <arthurborsboom@gmail.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Anthony Perard'" <anthony.perard@citrix.com>,
	"'Kevin Wolf'" <kwolf@redhat.com>,
	"'Max Reitz'" <mreitz@redhat.com>,
	<xen-devel@lists.xenproject.org>,
	<qemu-block@nongnu.org>
References: <20210118153330.82324-1-roger.pau@citrix.com>
In-Reply-To: <20210118153330.82324-1-roger.pau@citrix.com>
Subject: RE: [PATCH] xen-block: fix reporting of discard feature
Date: Mon, 18 Jan 2021 15:49:41 -0000
Message-ID: <00d701d6edb1$894122f0$9bc368d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKr9v/Nt+LMBjUs9/3Ji6x60nJqgaiDdLPw
Content-Language: en-gb

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 18 January 2021 15:34
> To: qemu-devel@nongnu.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Arthur Borsboom =
<arthurborsboom@gmail.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Anthony Perard =
<anthony.perard@citrix.com>; Paul Durrant
> <paul@xen.org>; Kevin Wolf <kwolf@redhat.com>; Max Reitz =
<mreitz@redhat.com>; xen-
> devel@lists.xenproject.org; qemu-block@nongnu.org
> Subject: [PATCH] xen-block: fix reporting of discard feature
>=20
> Linux blkfront expects both "discard-granularity" and
> "discard-alignment" present on xenbus in order to properly enable the
> feature, not exposing "discard-alignment" left some Linux blkfront
> versions with a broken discard setup. This has also been addressed in
> Linux with:
>=20
> =
https://lore.kernel.org/lkml/20210118151528.81668-1-roger.pau@citrix.com/=
T/#u
>=20
> Fix QEMU to report a "discard-alignment" of 0, in order for it to work
> with older Linux frontends.
>=20
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> ---
>  hw/block/xen-block.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 718d886e5c..246d9c23a2 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -253,6 +253,7 @@ static void xen_block_realize(XenDevice *xendev, =
Error **errp)
>          xen_device_backend_printf(xendev, "feature-discard", "%u", =
1);
>          xen_device_backend_printf(xendev, "discard-granularity", =
"%u",
>                                    conf->discard_granularity);
> +        xen_device_backend_printf(xendev, "discard-alignment", "%u", =
0);
>      }
>=20
>      xen_device_backend_printf(xendev, "feature-flush-cache", "%u", =
1);
> --
> 2.29.2




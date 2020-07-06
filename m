Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F652152D3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 08:59:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsL63-0001f1-VO; Mon, 06 Jul 2020 06:59:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWB=AR=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jsL63-0001ev-56
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 06:59:23 +0000
X-Inumbo-ID: 385582ca-bf56-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 385582ca-bf56-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 06:59:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 22so38052427wmg.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jul 2020 23:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=GSqycnyOgHnqRbxkdykYxL0t6AV3g94XVZgZUh4b7Oo=;
 b=nGLQub6o9/Mr2h4TTPzgZwJ63jnsecYGyIq9xnWuaYK1LVkVRYZz1s6G51ZZGQMiVK
 hg5zIyEaCgss536nOHArIsumPnWlfg46CG615CMNLStkWnjLfZuuLTJqpz+n3f7TY7Sg
 sFRzuWYlNu+5SZI8jMMw7hAEGEz+PYmeoKMc7ZMDUyTzjnz/ClSo5KmpUCIAYbXzdHfr
 vAuoyJaQl3O4Za/QvsU/LFBah8Zv1X4zqPEe88xfcHPeBeJCPeLQ/YemmMVDzk/FztcB
 Q50au6e7BF2I3vgi2AV6sWNzTGOVQYV3oGD46nrptrfVoIXEceV1kDfxp/IHCJcJOotE
 IEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=GSqycnyOgHnqRbxkdykYxL0t6AV3g94XVZgZUh4b7Oo=;
 b=dbGWEePY0E3bc3D+vrIjsSEqDREuGfpFpLGxJFBBGiHUo8xgKjoiBDEdK5+/R1bwFV
 zkLWSzSGfF6hB80Wx3w3gHx71rZ1LwGo0x0u6q+pudHZP3LjxJP2GUlFAcUoju9NvMIu
 mlw1cR97wL+QWcpsoNwUFGfRwxC00UrJ4jDV02vXDiCVE0YlVTIaoK+Bu1yAc2aHznPY
 Z9UyYisg4gkYpLog9Ou2sE/hyFogjOCa1di/OXCLgbMer3WG2HMILL5KgMPRK/0XG6IQ
 HudJraR2dKpiPM1ff6hS0Dy6bVzwgC2wrrMEmwTdu5X92oYoQ3DCzU+XIpMa6Yy2N664
 9hIQ==
X-Gm-Message-State: AOAM530yfdHksyjAEwWrvsN69yVN8ZRYSWx8+IJjoYveJ9hPC1P3BunT
 i1q5AqaLz2NFYqsaDULcJK0=
X-Google-Smtp-Source: ABdhPJwzyz2pszcNWZGno9KupPDPrGUYfRu9QXYAaGGf+9Xdw9ucJWJ0j8PPt1b+SgBWqyAquHSxNg==
X-Received: by 2002:a05:600c:2249:: with SMTP id
 a9mr45794270wmm.163.1594018761880; 
 Sun, 05 Jul 2020 23:59:21 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5782:7500:8191:456f:379d:d246])
 by smtp.gmail.com with ESMTPSA id z25sm21289086wmk.28.2020.07.05.23.59.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jul 2020 23:59:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20200703135533.336625-1-anthony.perard@citrix.com>
 <20200703201035.pv6nyhydxyzqsuit@liuwe-devbox-debian-v2>
In-Reply-To: <20200703201035.pv6nyhydxyzqsuit@liuwe-devbox-debian-v2>
Subject: RE: [XEN PATCH for-4.14] Config: Update QEMU
Date: Mon, 6 Jul 2020 07:59:23 +0100
Message-ID: <007801d65362$fb068fe0$f113afa0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGZdywpQDnhjbXBL4Z/m/aCXPm/pgJTGOJCqWE+v1A=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 =?iso-8859-1?Q?'Roger_Pau_Monn=E9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 03 July 2020 21:11
> To: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; Roger =
Pau Monn=E9
> <roger.pau@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei =
Liu <wl@xen.org>
> Subject: Re: [XEN PATCH for-4.14] Config: Update QEMU
>=20
> On Fri, Jul 03, 2020 at 02:55:33PM +0100, Anthony PERARD wrote:
> > Backport 2 commits to fix building QEMU without PCI passthrough
> > support.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>=20
> FWIW:
>=20
> Acked-by: Wei Liu <wl@xen.org>

Release-acked-by: Paul Durrant <paul@xen.org>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695A95CB0F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 12:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782279.1191768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRvT-0006Nz-JP; Fri, 23 Aug 2024 10:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782279.1191768; Fri, 23 Aug 2024 10:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRvT-0006Ku-GC; Fri, 23 Aug 2024 10:53:51 +0000
Received: by outflank-mailman (input) for mailman id 782279;
 Fri, 23 Aug 2024 10:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tpo4=PW=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1shRvS-0006Kk-Qa
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 10:53:50 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa22e6d6-613d-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 12:53:49 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-533462b9428so3161726e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 03:53:48 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2a5903sm241438966b.78.2024.08.23.03.53.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2024 03:53:47 -0700 (PDT)
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
X-Inumbo-ID: fa22e6d6-613d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724410428; x=1725015228; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaBCts23yfICKv14pkrP2OwPRJ62+K2VZ1b00yfvBas=;
        b=YkCrMUVAeDSXCj3Oz16nt1HPx8Y7Jv/Z7yNACxDnLMwAKrTLjbnDBi32XNAC0BbUnA
         NNrzkM6jO5DRlkyX74tz6FjcaEmTbS5eNccDVq/puFrVfMLn9LrWpFGohNam6kfzjso1
         V3+ZpsGYusUTN8v45jqhDelmouls4h9ejwH5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724410428; x=1725015228;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaBCts23yfICKv14pkrP2OwPRJ62+K2VZ1b00yfvBas=;
        b=hEjaYBJF/Dg8SdgxGPs2UjFQNe/yXJt08A6zAn7NDSB/rEQBWkcue0VHTpg0hsjy4I
         xiJ4SHBpnQM9pAiG/BkfTSa4bQzuhe6/Reol6huzVxklK1wNh7FHrrdDpsI+EA5SF8Os
         gaR4m4EE1knkW5AR0Zbzj3BVkM8UogSOpajSqCZDpis995S3EjLmoeFTdvkstJr+a1C7
         AJdkdEHuUdGR+pgFCknVzSUeRqw2b6HAwUR1LCqOZVY8+AuaFEpesmyEhzy+JmF8RMuF
         D5NqNyKfL8t+2Y9u2QTJlnKMtljuBrIvFDIM4kOhH3xQ4eSd9SIFydoqgff73Vamf5V6
         tG5g==
X-Gm-Message-State: AOJu0YyHjF5GRVl+K6XVyn94btitkAWy62qVwwN2F4l1Vq8JyzxsfcdB
	iwOMYdEgyV/AaRaH7KhGgC9yNUqwSt1fluxn/xM2xYvVCWpcfsWM8n3vpFT7sIo=
X-Google-Smtp-Source: AGHT+IHgUaYUn0D/I2p9wrYQNJYc4PFDEc3qxrQKjC/0NfqAVAOC5lKIOp5hOzr5w5KoGKWxS8G4GQ==
X-Received: by 2002:a05:6512:a91:b0:52c:8342:6699 with SMTP id 2adb3069b0e04-5343888aa07mr1502731e87.55.1724410427873;
        Fri, 23 Aug 2024 03:53:47 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 0/3] tools/ocaml: Incremental build fixes
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20240823105157.991275-1-andrew.cooper3@citrix.com>
Date: Fri, 23 Aug 2024 11:53:35 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>,
 Andrii Sultanov <andrii.sultanov@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Content-Transfer-Encoding: quoted-printable
Message-Id: <55A27B23-1CD1-4123-8F16-793E0966CA49@cloud.com>
References: <20240823105157.991275-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 23 Aug 2024, at 11:51, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> Various extra build bugfixes found while reviewing the `Stabilize =
Oxenstored's
> interface with` series.
>=20
> Andrew Cooper (3):
>  tools/ocaml: Drop OCAMLOPTFLAG_G invocation
>  tools/ocaml: Drop o=3D rune
>  tools/ocaml: Fix the version embedded in META files
>=20
> tools/ocaml/Makefile.rules | 5 +++--
> tools/ocaml/common.make    | 7 ++-----
> 2 files changed, 5 insertions(+), 7 deletions(-)
>=20
>=20
> base-commit: 5231765a4e6528a3208e49885b9eeff42519a6c1
> --=20
> 2.39.2
>=20

Acked-by: Christian Lindig <christian.lindig@cloud.com>



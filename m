Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3A772E97
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 21:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578911.906658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5np-0001oS-Dq; Mon, 07 Aug 2023 19:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578911.906658; Mon, 07 Aug 2023 19:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5np-0001mM-B2; Mon, 07 Aug 2023 19:22:05 +0000
Received: by outflank-mailman (input) for mailman id 578911;
 Mon, 07 Aug 2023 19:22:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5no-0001mG-85
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 19:22:04 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b03dd26d-3557-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 21:22:03 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52307552b03so6756295a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 12:22:03 -0700 (PDT)
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
X-Inumbo-ID: b03dd26d-3557-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691436122; x=1692040922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuCRkyKda8YWgOZqK5+ahsUV1F3t/tbQ+gtgKZ/2cZM=;
        b=YoXuPmyIUWvzKVGMNJOMvRR2rqwx1pTl4u8VhjYNCtdHhd6isx/cIcT0WycrVkjV3b
         HP8wMBVaZR3BwjULGAuXLV5uTJ7LkISUxMiUGvzdjFLcYXSoTBxiLaa/HxJqW0IE9wqN
         ecI14tsJA66jHxzPiEwM4oLOrtfFeYtwc0U6iKJnTV4Ac0ALW+MMsp7+uo1AeRJVTicI
         3D6Z64xlbfiprv9PttD81bwyagfAGpydyJuTSJUg3+a7MbEtyvZc3bERZkeDKabktP0K
         GUCdTxJZ16pKZSRtSYgJwK7QqBoc4tB6R8QUWgCbHKW9HFotixEAgR02xEbTxaeYI5A0
         cKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691436122; x=1692040922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuCRkyKda8YWgOZqK5+ahsUV1F3t/tbQ+gtgKZ/2cZM=;
        b=Mp47MgXeOTH8Tned/4F4DQgy1LBz2av5ltqetVhq0x7RINoOgJdMpLOFjPq89R1oEx
         WGl7TByiYZrKkEDQ2IQ28DO5yws9Y9UQLXn5r4mUGVrkB+19vRJW9L814/kzbkg/JcoT
         JNoL+Cb9judbZlQM02IN7JtA3FJH4/3aBenTLwxN3Il7PscC+llV2+v5lN8ffr/3bdIZ
         6/4M8gvL4VTBOySbp2yDNqYLfUb+bsDG2hUTo12ikh7H3S90bOn8UAVVVnHyHYuIBySY
         2IudVXZiIt8dwCrs8fcAS4Ixg6iSwnNkUAkqZQK1fzN52IWdYk+wW99ISQbzxQf9IcYO
         PnIA==
X-Gm-Message-State: AOJu0YxdM3HmLwd+3HHYkBIZAoNbYXIrtMbtC6fmE2GxZgiST+0zursS
	wwJYk5CEOuwBXmFBdqBoic1w82jChQ6jC1ogZZo=
X-Google-Smtp-Source: AGHT+IFacaM2BJDDKzxw+pVOfKCW4EIimknet/GNgHUe6qHo7FXGBs9SqdY5cBX0gWqIrid577hldRoEEbzQ7NTcQhQ=
X-Received: by 2002:aa7:d358:0:b0:51d:f5bd:5a88 with SMTP id
 m24-20020aa7d358000000b0051df5bd5a88mr8602875edr.38.1691436122534; Mon, 07
 Aug 2023 12:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com> <367db8f8-3287-d694-e591-efcffaf9ee99@suse.com>
In-Reply-To: <367db8f8-3287-d694-e591-efcffaf9ee99@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 7 Aug 2023 15:21:50 -0400
Message-ID: <CAKf6xpu-PhzfkbCsKto-VSisU6E81dtpF=HqwVtwmNoVsVTBFg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] x86: short-circuit certain cpu_has_* when
 x86-64-v{2,3} are in effect
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 6:35=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Certain fallback code can be made subject to DCE this way. Note that
> CX16 has no compiler provided manifest constant, so CONFIG_* are used
> there instead. Note also that we don't have cpu_has_movbe nor
> cpu_has_lzcnt (aka cpu_has_abm).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason


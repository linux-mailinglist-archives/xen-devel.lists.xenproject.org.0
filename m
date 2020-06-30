Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313F20F2B4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 12:28:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqDV5-0005Oh-KF; Tue, 30 Jun 2020 10:28:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMeW=AL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jqDV3-0005Ob-P5
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 10:28:25 +0000
X-Inumbo-ID: 6db279da-babc-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6db279da-babc-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 10:28:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id g18so19602986wrm.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2020 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=13o5nDkHqBf+jwyO4Tv9Vn/lkiEHiRzatByRaiR9K2o=;
 b=RJ7nWdZdT0shRGKcjVOLXMSzGtbBUl/gsR3PXa0jztjog+4+H6X/XH8H6FrlIZWCW3
 HbRouufLNIdOxxG1xTZ7synFl410supWK0tLIgjrubrUluN1FZzPQE820hvmk/iuZhgP
 miul/BRl6deezi3HWWRZrJT50xSs3gDQxSRtsgb9jXGLz6GIRp6PvJTakAaX5GSA2cnG
 bOay+ZuwOS5Nptftj19f0r1vxs/d6l1atoGJ+agyVJ+OVsgC7xreuKyz21BZQHsgA9yo
 weaxEVCTth38+MP0QJ0QvbTlOgV1WykKKHE+26RKBU/ZdP+mC36Hj2RlVlZLH9VJNEAZ
 NyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=13o5nDkHqBf+jwyO4Tv9Vn/lkiEHiRzatByRaiR9K2o=;
 b=lkgBjFxFAxQ8wsd/pxalSsgEQkA6DJNAffNRAcGE721BsdXOTkBbOuDCU4JT1f2hli
 ruongn68xU/XqjJ/rB6aFXrvbusuvCxmbLCNtbeqNFs0P7wm9TlFX57GN7l2wQmHakP4
 rxHsAxPUji4xFqR03yog6crz4iT3E6dKnc3/GOWUNQmkZhBgyVAB22HQnBI/D8ztMNsR
 bBWoeuYhVUrFgAA/jDUR/5yVqr5k6fLF93YOpGYfGAjB8svEhUv4Hg2zcbhJBxJz7OO4
 uhsozRJQU3aQRvq3P0GQq2rS2S5KU2yjCeKm4lSMyNAqvnA2UAB7dc4Ny19H79d+RNcm
 hcsA==
X-Gm-Message-State: AOAM5331iBb33tUyQPh/hs1cfmGGZx9JQhBRJCz0LVk6gSaQ73OywJqG
 wLMfaBWmMXTs+CWW1AeEHuw=
X-Google-Smtp-Source: ABdhPJy5Yd+pxDaOdBLlteKDvUPlUYU+qKcBCuNP9ML7SaYv20YFND2WFdc9lLPqurLXaD3/7/poIg==
X-Received: by 2002:adf:e944:: with SMTP id m4mr21578689wrn.252.1593512904154; 
 Tue, 30 Jun 2020 03:28:24 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id e23sm2854276wme.35.2020.06.30.03.28.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jun 2020 03:28:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Olaf Hering'" <olaf@aepfle.de>,
	<xen-devel@lists.xenproject.org>
References: <20200630102119.16870-1-olaf@aepfle.de>
In-Reply-To: <20200630102119.16870-1-olaf@aepfle.de>
Subject: RE: [PATCH v1] kconfig: fix typo in XEN_SHSTK description
Date: Tue, 30 Jun 2020 11:28:22 +0100
Message-ID: <000101d64ec9$2eb0cca0$8c1265e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKLPLlB1TIkcMYbmItBc8SAdVu6nKeHGHhQ
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Olaf Hering
> Sent: 30 June 2020 11:21
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Olaf Hering =
<olaf@aepfle.de>; Wei Liu <wl@xen.org>; Jan
> Beulich <jbeulich@suse.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> Subject: [PATCH v1] kconfig: fix typo in XEN_SHSTK description
>=20
> Rename 'vai' to 'via'.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  xen/arch/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 4a2ec87ff5..a636a4bb1e 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -113,7 +113,7 @@ config XEN_SHSTK
>=20
>  	  This option arranges for Xen to use CET-SS for its own protection.
>  	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
> -	  compatiblity can be provided vai the PV Shim mechanism.
> +	  compatiblity can be provided via the PV Shim mechanism.
>=20
>  config SHADOW_PAGING
>          bool "Shadow Paging"

Since it's trivial and cosmetic only this can go in 4.14, so...

Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Paul Durrant <paul@xen.org>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55684EF2D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 04:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678527.1055892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYH9W-0005TA-IY; Fri, 09 Feb 2024 03:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678527.1055892; Fri, 09 Feb 2024 03:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYH9W-0005RB-FG; Fri, 09 Feb 2024 03:02:10 +0000
Received: by outflank-mailman (input) for mailman id 678527;
 Fri, 09 Feb 2024 03:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vW4Z=JS=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rYH9U-0005R5-Mo
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 03:02:08 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99ee2988-c6f7-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 04:02:03 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5601eb97b29so1021461a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 19:02:03 -0800 (PST)
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
X-Inumbo-ID: 99ee2988-c6f7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707447723; x=1708052523; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elgHtFhGeyKWc7iSS6Fo66vWWF/m+4FwK52x2N/jEyo=;
        b=ASAMhuIZQvMPZLlPeM4nXi5mHeqS0EbbeyzgZA0Eg43zCPSKsJCo8yQF4jel89hDyu
         p2eOJJvF9g+Tsep1mkqkNqfE7MHj2BbgAikJjtR/inH08bZ7HQf0aiB7E1B9ahp4Q7/y
         iuUzYMjwsqEtperaJybVxxo7LojFr4bek1QEWccOGKFoK04FAiwtoWuGVwlf3sRj02jH
         gmuNssNklzq/20t9mzwm8xHBJVFRgf68lFvE4U5vYKfwNP12cvd6FzPJYbRiuStFurX+
         ts2mvNKIV4JPrkrP5HLGgpnMtiCEnSHcaghbPRnL1OYKm/dZWVNUxQRxb4AlP+pPKx0m
         BUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707447723; x=1708052523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elgHtFhGeyKWc7iSS6Fo66vWWF/m+4FwK52x2N/jEyo=;
        b=uwUS5ZNhcKLrHAiHWjgFnf/brG4pc5WEg3HPD2mxWniFzSTIgWJL11LQbr947Ge3ma
         1Z2wwQNNzdu5NFVZEDpdsUYiZv7eJfoff3wN8FAhJfs9CE/Y5v2KYAXhAySTyJXsQK5Q
         As0NukGFT7xZNyxg4qDrF64Gi+UvGmwhn0fuEigKd2xf4R8R/J5uXWLZtLFp4K4+OeQY
         BgN6njFSdhHKhXOa4IanaQJuF6peRNZl6L2Zjg1FY/8Op7xOFDJg/zhFPtGFN5uBuI3H
         yWa/yQ52Ce9NcL/HG+kNZjHhJx/WxljKN8dDMGhD82uj6EwgNF8kZTd5t/Oxsa9vUnFX
         ioyA==
X-Gm-Message-State: AOJu0YySWLEvlOGvA+Q9iw2ELRwXAKNIfUYuZ6hr7aCJmiBDGB/1D34Y
	2Id7TV/U3YXq/luAGZF0FJlEUYQTz9K2aUt8fNHyW8ta0cOfMii9hcgA6ffWYIZrX0seP6g7gPj
	NudcKuKprhNblpkTS9f69Yx9mHN4=
X-Google-Smtp-Source: AGHT+IFiqkleSYckTun/pHSbY+1Q05t4X07O53MEjk0VGM3pTQHciXTAXWWHRE0XESHTh5B2OFtNt5kfYxZsco6LseA=
X-Received: by 2002:a05:6402:5169:b0:55f:5197:6314 with SMTP id
 d9-20020a056402516900b0055f51976314mr259427ede.18.1707447723066; Thu, 08 Feb
 2024 19:02:03 -0800 (PST)
MIME-Version: 1.0
References: <20240208165546.5715-1-jgross@suse.com> <20240208165546.5715-15-jgross@suse.com>
In-Reply-To: <20240208165546.5715-15-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 8 Feb 2024 22:01:51 -0500
Message-ID: <CAKf6xptUVYzGyh7hnx2f=v0_tSEpJujc0hL3Qnyy=aNLu5hxVg@mail.gmail.com>
Subject: Re: [PATCH v5 14/22] tools/9pfsd: add 9pfs read request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 11:57=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add the read request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> V2:
> - make error check more readable (Jason Andryuk)
> V4:
> - add directory read support
> V5:
> - rewinddir() if reading a directory and offset is 0 (Jason Andryuk)

FTAOD with the v5 change:
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason


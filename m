Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C418AF590A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031145.1404873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxX0-0004Yh-N3; Wed, 02 Jul 2025 13:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031145.1404873; Wed, 02 Jul 2025 13:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxX0-0004WS-KS; Wed, 02 Jul 2025 13:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1031145;
 Wed, 02 Jul 2025 13:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCPO=ZP=canonical.com=nick.rosbrook@srs-se1.protection.inumbo.net>)
 id 1uWxWy-0004WM-NG
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:29:44 +0000
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ca3e1ee-5748-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 15:29:43 +0200 (CEST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D92653F181
 for <xen-devel@lists.xenproject.org>; Wed,  2 Jul 2025 13:29:42 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31202bbaafaso4681094a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 06:29:42 -0700 (PDT)
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
X-Inumbo-ID: 9ca3e1ee-5748-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751462982;
	bh=z8EBQJlddOmZhjCoAzh/eIKSXiNuDbvYRxmwUUoG3RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ZyZisa8T7ApL5qsWp2Di7CBNUJEqTZnGdacLIe97aedIuM8B0tEeaZbOaVjvpi0YW
	 J4pTbw6FonIGiehF3ojmIT2bM8pbIxzwBK20G8l4Dw6aRahwwGLnIq8BkTWQkkIY/G
	 TOmRxY+g96LadIS6tIUUyeXEb74KC0cDRqD/mGDJlE33Pe6q0D7Bf4JvnQhCE0zbZE
	 I+zfBlewYFL3osm8a572OUxQWlUv6l50dUuKjL5quBLKxMTHH7IdFfGJz1aBUjszvx
	 fEYKHkC3gTHrDVS1Q3bHzFMphJLTC9gthymRI41cekD7oCk0LcRTZjFz2tAJPYABGI
	 pyBn9fXWadZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462981; x=1752067781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8EBQJlddOmZhjCoAzh/eIKSXiNuDbvYRxmwUUoG3RA=;
        b=wxiAQC9RGGdkMbfTl3LF3xkGmyJGwqoDuOFSd/Ov1Tqr8uKQEM5BvWrlc7N9KCQTbS
         yTZclVkZE3EiLInxyvjeiYPkY1QO0qIpB2UcAnPTtdp9yugTSOGoFwMn7EUZ++OuEEIB
         NCIkUxUTMUmHapq3egAzgBy2eiCDZK0KpQWG7NwS1UvitrbwPCBP41mE+MTPxo5iScBx
         gf0Iq4XDpqN41aQzn9JMWkKLSk+V4Sz0OhT7UQZGSW17DlHdt1KGnsEj5Fj7tDEexvMD
         bFizvpTgfemIaulpUwP9cGagkVI/TVhUMU5LYfCtEuZT+/7fvmoMH/ek5Ps9ryNA8GA1
         K5cQ==
X-Gm-Message-State: AOJu0YwPZdfd1ueqY81OqPXMA+4+QjSXSeQGvt37uOaP48DZ5IJZqHmJ
	4tUYPFz3GxAGge085DzeGTiTM/3EiCKjHF7gmrq79co6mdxmGomlb0W6c1HKBoNq0+sIqd2kwfw
	wvfNcfH6GDRcBS0Ki2ocs6WrXX+L4XkhE0TGC6g0oFZlpgbyoIe/5Bca4xh0iuIpw/dw1UyZQ2D
	7Xi4Uq35r+LV6naO19kkTTeYO66cR7PfjFFJluQIcELHyH4pZzWbA8rYSC/t0=
X-Gm-Gg: ASbGncvQW+MKuIrji8peUqdS8l9a2hcVFDjrMvFIlwjAeuDiZAcFzYApB4xEqc20ZVV
	/6olbhrQlaYTHph0QGVM1QmSIIc2vZC+P/2jjsodoh2dX32bRYdQuyJWaS5Ij5Sa6eQxMIHH698
	ngWA==
X-Received: by 2002:a17:90b:3889:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-31a90b1c47emr4036920a91.5.1751462981330;
        Wed, 02 Jul 2025 06:29:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAuth7ZRl6+Ze0hj8Rm0N3dnZXcO4n2rUL2BjmK0D6Ov9pdzqk0xlF+zYE7IlYu5AXzt5XGR0/pyimYRk3iXY=
X-Received: by 2002:a17:90b:3889:b0:312:f0d0:bc4 with SMTP id
 98e67ed59e1d1-31a90b1c47emr4036890a91.5.1751462980920; Wed, 02 Jul 2025
 06:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751397919.git.w1benny@gmail.com> <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>
In-Reply-To: <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>
From: Nick Rosbrook <nick.rosbrook@canonical.com>
Date: Wed, 2 Jul 2025 09:29:29 -0400
X-Gm-Features: Ac12FXxBr22yzDuZ9pHZUbnNgZRc9BrJrY4FYj7X_jXFthS0xUQk5BpJu6-By6g
Message-ID: <CAEN5XSHWKaRJhzONjQvp+Bj_CeNaTG+XuzxW=Hj5p7ceh4cXzg@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] tools/xl: Add altp2m_count parameter
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>, 
	George Dunlap <gwd@xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 3:54=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com> =
wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Introduce a new altp2m_count parameter to control the maximum number of a=
ltp2m
> views a domain can use. By default, if altp2m_count is unspecified and al=
tp2m
> is enabled, the value is set to 10, reflecting the legacy behavior.
>
> This change is preparatory; it establishes the groundwork for the feature=
 but
> does not activate it.
>
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

For the tools/golang changes,

Acked-by: Nick Rosbrook <enr0n@ubuntu.com>


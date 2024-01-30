Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED9842095
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 11:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673275.1047595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUl08-00010L-Eu; Tue, 30 Jan 2024 10:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673275.1047595; Tue, 30 Jan 2024 10:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUl08-0000xq-Bs; Tue, 30 Jan 2024 10:05:56 +0000
Received: by outflank-mailman (input) for mailman id 673275;
 Tue, 30 Jan 2024 10:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjb=JI=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rUl06-0000xk-C0
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 10:05:54 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26633b6e-bf57-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 11:05:52 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40ef3f351d2so11708405e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 02:05:52 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ba1-20020a0560001c0100b0033ae593e830sm7766308wrb.23.2024.01.30.02.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:05:51 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3E0BF5F9D3;
 Tue, 30 Jan 2024 10:05:51 +0000 (GMT)
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
X-Inumbo-ID: 26633b6e-bf57-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706609152; x=1707213952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGjj4t6Tt0bfPXKL4DzHKstkGoaCWrviJvk5cF8v3JI=;
        b=j0wZ6kRg/WlrPtuK+SQYQNZqGB+clZBtu304hQN6Y+s2pyhxO8je8xij7At4szunYx
         qmKHlH7UvKAzAm29iGmany9E53IfHW6mgM4GkbNxqbcidwX3Y5l9i552JqdEv7vHKTm2
         gnfG5mmC+SRwtOgTSueY5e8N/ps5NK3ecLphKIlOq8SfZZDnuwsLW12Abrtp1m6Jq0kr
         KIyId/9hA3mDzBaQYLpg0ap8F51Nj0de5UmV4GEnyGp5YSQdKdgwcxS1LsSHaFgbmRn7
         fHs4ez3HXqji+kO8wbD/+ipCf+T1V40mILHbm0Zx7tvjDDrGiCXUYKqgZ6dY7QkJj/5K
         Rklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706609152; x=1707213952;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGjj4t6Tt0bfPXKL4DzHKstkGoaCWrviJvk5cF8v3JI=;
        b=lZZRN8kaksCwdCKVH7q+s2Fup5F5tW3oZjyOTB/AoIUwO12OOZcGS5VdDRjrRqTFTg
         KEW71ikjHo/UpTTEoM3GEUA8oBL6tJLj0tLCutAAPJAq353UAxRI7FeCp1aw6zfQOkX0
         /aKh0QuxM0RPXhdHNpHQsrSa7ln7ZBEtgsiPPlNBrh+9IGnneaBLlr1fKKR5iJpVY8mf
         eT4H7sbhRrYuUXAhhWbIBZt8jo8p82TDaM8zBvjG0XguvRRDrNavMCZiNb6EK98HcOqM
         OSUbE2NpQH+9PfOGm+aOAwR79r1WlyM0+CJs+uPgd7+J8VLlHmUIG9YDJhhVi70+JboZ
         ghSg==
X-Gm-Message-State: AOJu0YzLx0xDO1vpZ32KjJ6ZdnveTH8YGba88vDf60hZkQ6MJ06iIXyH
	59t5RBQ3d1FLYNfIiJbb9HkXbMdv5gMEceYH8jVNZec+4wV3qYWxNg+FyObxLbU=
X-Google-Smtp-Source: AGHT+IEVpRJfzbaAlKNFmBWom/z95zvc/A0bG95rOio6RyuB2LN8r/AzevkFaZe0x0Gor0Wj8R+n5g==
X-Received: by 2002:a05:6000:1848:b0:337:bdd5:778b with SMTP id c8-20020a056000184800b00337bdd5778bmr1172982wri.29.1706609151803;
        Tue, 30 Jan 2024 02:05:51 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
  peter.maydell@linaro.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Stefano Stabellini <sstabellini@kernel.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/6] hw/xen/xen-mapcache.c: convert DPRINTF to
 tracepoints
In-Reply-To: <2fbe1fbc59078e384761c932e97cfa4276a53d75.1706544115.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Mon, 29 Jan 2024 18:09:40 +0200")
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
	<2fbe1fbc59078e384761c932e97cfa4276a53d75.1706544115.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Tue, 30 Jan 2024 10:05:51 +0000
Message-ID: <87bk93qgow.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Tracing DPRINTFs to stderr might not be desired. A developer that relies
> on tracepoints should be able to opt-in to each tracepoint and rely on
> QEMU's log redirection, instead of stderr by default.
>
> This commit converts DPRINTFs in this file that are used for tracing
> into tracepoints.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


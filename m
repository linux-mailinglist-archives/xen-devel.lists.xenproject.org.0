Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4893A140CD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873664.1284654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYTYr-00034a-5n; Thu, 16 Jan 2025 17:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873664.1284654; Thu, 16 Jan 2025 17:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYTYr-00031e-2i; Thu, 16 Jan 2025 17:21:41 +0000
Received: by outflank-mailman (input) for mailman id 873664;
 Thu, 16 Jan 2025 17:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StQj=UI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tYTYq-00031B-Bf
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:21:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56a34e4c-d42e-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 18:21:38 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso11445995e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:21:36 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c753c60csm64359305e9.36.2025.01.16.09.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 09:21:34 -0800 (PST)
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
X-Inumbo-ID: 56a34e4c-d42e-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737048095; x=1737652895; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiB7t28fo8v6Pa+jD/C05PgyVfsvktli5fg7J/PavTk=;
        b=BvKJhIIGWJ2Gtdbtwircmy03Dy4KK777bdsORE1Pj4RLSM27OGjtoecnGDUFCThS+N
         dUvfqX/KZyyrYBW/uVsaJOReQ4ywffPK0xr1x9pGr0I4Otvqjmh5zVOAaaFduZvVejEW
         abaPBNO2MtKjSR4T7NLhqRk9ulobnf55KuCXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737048095; x=1737652895;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiB7t28fo8v6Pa+jD/C05PgyVfsvktli5fg7J/PavTk=;
        b=D1FBRjMvwEIa+IrUN8jVThxA7rFNoZ5om6YtF16LCEhjOrsei79LsRyDcasuElK1YX
         vEuW3GAzsjh3Aa6/AbDzLu9Hzfyk0pRa51V9urA04XA+BgvdNpgA4JnK0mZx0/gBRdRO
         H6Q3KXoUMAyYQvTZGwJcyFLXYi+Y+PAKJUSley4OBZGD2pzD5i/Ws4hCPMpJv3cAyfBt
         oF2v6ikHcAeKtFiSg1I7ZBoH3fc1xutkYv0/extVy4+ub0oMaV3z8GJ1eP96sRntMYOl
         moRKR/40+VWm+xCWHqHQk+ujT1cdicMak002zFqaQ/egMycCdLYHE1YHEDHsXLac6kKk
         dpXA==
X-Forwarded-Encrypted: i=1; AJvYcCWN5Vh+1C5VOOu5wknUQ+ZBJBkk+e2OH0CjbHgZ8rnxZWBb8oAXjPq+wPXPrxZJOPApoMCu2bnS3qI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLjGiSLxo4RXwBtsYbBV4AmGN4DfIFehcuergqQbvMNl6ZLhqc
	Eai/ESU35glbGVLAAdeSvtAmhdsinLrO6JqwdpeqvhxHOsBCTzFeGHfY1xl/jWU=
X-Gm-Gg: ASbGncvLejyK+5jPj8+YmtykeCtvT3T9nTz5Munr1ECPHw0EyifVCk7W1BWjGoT/9PH
	8ba8axzRnZYrCHGuIwxiFJ9mNezoQPtG5W7Gfw/74po12vjaAA6kPx0+QlnPh+f6jSvmWX+qtya
	BPBwWZ+6UTDQcXL3i623BBnTZTK/Soc5krIgoCfM6puS5Kz7UOG707Bmccd7y6mBYpgwkPo7zAw
	08Zk3V/tUlH16vCVGpLV3QKPavvzPI0xgxXa7MC7EakVp0iir2qj8YwUExVM+DxYQDO+56bJi8q
	1A7tECpyYOI=
X-Google-Smtp-Source: AGHT+IGO60/8X+2XAeb2bgrS2UcjWrwcCuAaq/kQa+TdjzAMBxwmBFFDJ5XQsOXQaFqBLtNYK/ZH0A==
X-Received: by 2002:a05:600c:3ca4:b0:434:a10f:9b with SMTP id 5b1f17b1804b1-436e26ab2a2mr354174645e9.14.1737048095408;
        Thu, 16 Jan 2025 09:21:35 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jan 2025 17:21:34 +0000
Message-Id: <D73O5Q2J1MGM.2YBNH2X7YYT2E@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs: Punctuation: Add missing commas after linking
 adverbs as intros
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Bernhard Kaindl"
 <bernhard.kaindl@cloud.com>
X-Mailer: aerc 0.18.2
References: <ad9d1d7db8d43c82a02f64b8a317d7ae6522dd62.1736964253.git.bernhard.kaindl@cloud.com> <0d2e9617-e4cf-4b34-954a-a790c4bfda0a@suse.com>
In-Reply-To: <0d2e9617-e4cf-4b34-954a-a790c4bfda0a@suse.com>

On Thu Jan 16, 2025 at 9:46 AM GMT, Jan Beulich wrote:
> On 15.01.2025 19:06, Bernhard Kaindl wrote:
> > Fix missing commas after linking adverbs such as currently, fortunately=
,
> > hence, instead, and thus, when used as linking adverbs at the beginning
> > of sentences. I saw them with LTeX; other checkers have this rule too.
>
> I'm unconvinced, and despite Stefano's R-b (Stefano, please don't feel
> offended) I'd like this to be commented on by a native speaker.

Not a native speaker, but those are "sentence adverbs" and must indeed have=
 a
comma to refer to the whole sentence they preceed. Read them aloud and you'=
ll
notice you do pause for a little while.

> It is my understanding that commas in such situations are optional.
>
> Jan

A comma may or may not accompany such words depending on their position and=
 use
in the sentence, but that doesn't mean it's optional. Some construction hav=
e
pauses and some don't (sometime meaning different things). In this case I'd=
 say
they were definitely missing. Reading that without pausing at those spots i=
s
just awkward.

My .02 anyway.

Cheers,
Alejandro


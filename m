Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BA92E1DE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 10:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757164.1165905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRozT-00020q-Mr; Thu, 11 Jul 2024 08:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757164.1165905; Thu, 11 Jul 2024 08:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRozT-0001xz-K5; Thu, 11 Jul 2024 08:17:23 +0000
Received: by outflank-mailman (input) for mailman id 757164;
 Thu, 11 Jul 2024 08:17:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRozS-0001xt-Fv
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 08:17:22 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feba5596-3f5d-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 10:17:21 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a77e2f51496so89597966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 01:17:21 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7fefb5sm232261166b.104.2024.07.11.01.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 01:17:20 -0700 (PDT)
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
X-Inumbo-ID: feba5596-3f5d-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720685840; x=1721290640; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I4o2X9nihmQj0rKbNHMZ5EqT/93TfZ6EaSjNzAjA6wM=;
        b=benmAmWzsOeyMX7TI8B1P8FOO0UGJgRzFAEIJzao3N2ytB5sspmHsAgL3wO49Px93V
         emWeieNQb5mvqObNHgM8nBr1WhAyFyW4wgh8oWxySMHTGiAEMDxeVU8UHHF7ztDRd9Iv
         nfc/hz2Y2ZlaqLX2A5ZLfSkfgl6GNoK62uH7TWCUYZbv7KNRDosO2Aen948dp06oFuMW
         D0gjF3EwvVCF0OsYUoBiM7TrHBE0y4vR5whki0S3ibFwBGlr3gvTD1KIVRWE6WUPUc/G
         wYz+nXJe8Q9/QoSSQS+Ld2ByBlESaxcEDl3rnSJ/bGZsYxsyOWoK49NpmskUxV2h2rAv
         waXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720685840; x=1721290640;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4o2X9nihmQj0rKbNHMZ5EqT/93TfZ6EaSjNzAjA6wM=;
        b=hUaImLOMJFhN0P7Es1qxgK7VMJW2McK5vL7E7fd+1nQCgEBLc5PGuQzRo/0Vl0c1ic
         iFAcTKWsyveWsdD2W4TN4N6ts4UJDLFAxdTivKxklK3brbpOhWpH35WEKRtWpjEYU/ET
         20Pcw8c6r5L1STecT8JvmJqlTQTkmxTB1uLJA8FVKx3Ob8LyNQnV3FY2mgVHpVFi53M4
         vqtso97s18sLEgHNPe3hapOFvKDr7+TvKh26DTl+hszcMq0nAMersagjfdtD3pagzi8o
         gZGj1Jkl5B7gSIRVpRbAGoG+iy6TULHkWYDjZzRbr2fLvclJgD3V+N/f0sN67/QFnSUA
         q5nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXktru9cMF/Mw3dasx0CxJwPBiNI3Jqagz5ChKMY4AeL9KMONyIS/nN+vk15fM0mLV//2zOf5o18HPJGjakx4JzusFsFW/WrPmBmAuuIt4=
X-Gm-Message-State: AOJu0YxBPv7Keh2J0624upBq7aHGzNz1rmQWXmZUv0q4BHDQ5hg9qGzD
	lgeGkDtPN6u1SoNVUMQy5ib7ld+SYwnk4x02NGa2QqQwmPEvP7z3
X-Google-Smtp-Source: AGHT+IFojdlE4Mkl+o4cYS56axZJdhUnhy9tCmAhm30EM9kz0Cz+Yf3qgSzJDeFuwjs62dqsEHglHA==
X-Received: by 2002:a17:907:944d:b0:a6f:1c81:e220 with SMTP id a640c23a62f3a-a780b68aab4mr705682766b.13.1720685840390;
        Thu, 11 Jul 2024 01:17:20 -0700 (PDT)
Message-ID: <647f662a901dfaee2daae6a31e08035bfe0bd6e8.camel@gmail.com>
Subject: Re: [PATCH v9 1/5] xen/riscv: use printk() instead of early_printk()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 10:17:19 +0200
In-Reply-To: <4555a777-970c-4538-be34-99393426b83e@suse.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
	 <22c78705e4559a049e72950dc311513f1c15e489.1719918148.git.oleksii.kurochko@gmail.com>
	 <4555a777-970c-4538-be34-99393426b83e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-10 at 11:46 +0200, Jan Beulich wrote:
> On 02.07.2024 13:23, Oleksii Kurochko wrote:
> > As common code is available it is better to use printk() instead
> > of early_printk().
>=20
> IOW the function is not just available (allowing linking to succeed),
> but is also fully functional (i.e. the line is making it out, and
> hence
> CI, which iirc is looking for that string, is going to be "happy")?
> If
> so:
> Acked-by: Jan Beulich <jbeulich@suse.com>

I ran our gitlab CI and it works well on my side:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1355999714

~ Oleksii


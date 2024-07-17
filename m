Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BB933D19
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 14:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759967.1169682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU3yE-0001iz-69; Wed, 17 Jul 2024 12:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759967.1169682; Wed, 17 Jul 2024 12:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU3yE-0001gQ-2z; Wed, 17 Jul 2024 12:41:22 +0000
Received: by outflank-mailman (input) for mailman id 759967;
 Wed, 17 Jul 2024 12:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9K5=OR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sU3yC-0001dO-T0
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 12:41:20 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd7a2c4-4439-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 14:41:19 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58b447c51bfso8625624a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 05:41:19 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7ff888sm441274466b.159.2024.07.17.05.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 05:41:18 -0700 (PDT)
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
X-Inumbo-ID: ddd7a2c4-4439-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721220079; x=1721824879; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6C9zWKaG9mFx6n/fZAWmesLcPisRbjEdpsDDLjA4ms=;
        b=ZCA7/mx2jZhXIAKFiFP805h352ix6I+uZkq/c7ysTE6lFFozcXlqCIoI3cULhrjp4L
         BcbnYqdb+0MYowf45wMIFpGaPA5+M/V7F+gSUdiRjfHKg/5UMGDgpMGv1wk2fynJ/hG7
         oWzXt75gsnigRQwiALscrx4mZ0FQbcbwytdYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721220079; x=1721824879;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A6C9zWKaG9mFx6n/fZAWmesLcPisRbjEdpsDDLjA4ms=;
        b=W2NIxxqd1nbpWFSo8YyUv2s2j5SAL2w7tAz7OLn4RPS/Dn8D4xKJSz6IN+8KXaaVIx
         zPHYbjnIg3+2KKRfpRBfk2kcmDEIv3zr5Aufnw1O3dI8rl959TuSrPAiNCDe3uVeYq3x
         vig19AiO7Fa2836DfEbceN/hs7iKnrUiH9VontKOUQ2wQL/hgQdJ25wAj6H+VxeRxg0l
         +KXG4kagZtg0wAauTe8qHcI4GbXXc2RTG+TY4yJ7gzgAN9Tpdanx38qkPDaFyrK6+O1c
         C7U1SbRBwnY7UlQbtG5HvH8OZmmW2neGfw55PgMlzgfxqhmqf1MUMCuTMqyuVvffWKvo
         yzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW48EuzYc98+dtB6xWcmlDP+e2WAg08Nh6g0IydiDqZnXWOg1aNYLQWeiculodnm4ugtvIRT8uZygTMJ5OLDj0SNeexMrKT3XLVyusXMzA=
X-Gm-Message-State: AOJu0Yx8HVxJ/II6lIfqXyRy1SuDA44S3g5fKimlpFoBEX9Xh7WZ4lrP
	+M1jO9By+O2InrRgEmA/ZsWKItrtNb0tpZ/zKTr2FPtbFX2higCjZ5Ss9MV+SLM=
X-Google-Smtp-Source: AGHT+IHsujX0BWIJ5N8kvllQpsz1OFi/EZHA31A+rXSNFz0QtWyxvC7pAY0/PKDqthG0wq09zOQVLA==
X-Received: by 2002:a17:906:4a59:b0:a77:c0ef:f195 with SMTP id a640c23a62f3a-a7a0134793bmr102142466b.52.1721220079248;
        Wed, 17 Jul 2024 05:41:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jul 2024 13:41:16 +0100
Message-Id: <D2RTLF5LPQHW.1GNK1CUIZ5RO1@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Elias El Yandouzi"
 <eliasely@amazon.com>, <xen-devel@lists.xenproject.org>
Cc: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Wei Liu"
 <wei.liu2@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Wei Wang" <wawei@amazon.de>, "Hongyan Xia"
 <hongyxia@amazon.com>, "Julien Grall" <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 04/19] x86: Lift mapcache variable to the
 arch level
X-Mailer: aerc 0.17.0
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-5-eliasely@amazon.com>
 <D2R4LSZFGQYM.YRUCHYZPEB67@cloud.com>
In-Reply-To: <D2R4LSZFGQYM.YRUCHYZPEB67@cloud.com>

On Tue Jul 16, 2024 at 6:06 PM BST, Alejandro Vallejo wrote:
> On Mon May 13, 2024 at 2:40 PM BST, Elias El Yandouzi wrote:
> > From: Wei Liu <wei.liu2@citrix.com>
> >
> > It is going to be needed by HVM and idle domain as well, because withou=
t
> > the direct map, both need a mapcache to map pages.
> >
> > This commit lifts the mapcache variable up and initialise it a bit earl=
ier
> > for PV and HVM domains.
> >
> > Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> > Signed-off-by: Wei Wang <wawei@amazon.de>
> > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 20e83cf38b..507d704f16 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -851,6 +851,8 @@ int arch_domain_create(struct domain *d,
> > =20
> >      psr_domain_init(d);
> > =20
> > +    mapcache_domain_init(d);
> > +
>
> I think this is missing free_perdomain_mappings() in the error case. (err=
or
> handling is already committed).
>
> Can't the callee jump to a "fail" label and do free_perdomain_mappings()
> internally?
>
> Cheers,
> Alejandro

Bah, ignore this. They are freed in the "fail" label at the end.

Cheers,
Alejandro


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677B989C7E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 10:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807094.1218306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBbs-00009s-Ky; Mon, 30 Sep 2024 08:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807094.1218306; Mon, 30 Sep 2024 08:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBbs-00007W-HW; Mon, 30 Sep 2024 08:18:24 +0000
Received: by outflank-mailman (input) for mailman id 807094;
 Mon, 30 Sep 2024 08:18:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svBbq-00007K-Uh
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 08:18:22 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eb55e6c-7f04-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 10:18:22 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53993564cb1so924117e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 01:18:22 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0439b07sm1159743e87.215.2024.09.30.01.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 01:18:21 -0700 (PDT)
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
X-Inumbo-ID: 8eb55e6c-7f04-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727684302; x=1728289102; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/t1LwQ3yicdxQKAbhqqYgVkoZkxrA/WnkZLM/T73ngg=;
        b=PP1/oiYGubRDMJQeKTONqEoWYtnGnUGptcFoDfQxEUgNm2yVfx3bhF7LBRuUNExA9O
         /xHJRnBuliHq8xbdReTR+5R1VeYC96zg6QWPSm3VUo6mK1q3d7q3GdupO6UF4+fvqAFY
         dI406WjL1oPqLGwTkgtEaI1R0TFJxk62FXuen2/lWHbwItwIs/KWM/buwIeMLNRsHIdw
         89GUQkyteUp7MMMlpzS6HVTrQVq60xIXWy/vI0gtXqbPH0vB9ZP/2OMgq6hbGU+JkSMP
         Fzuxp2eHwzlAN26XHrxj03mMd0Ygw0ctt62INKli3OXFLpG0RWglaBjXxYQWJhL41OJn
         FQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684302; x=1728289102;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/t1LwQ3yicdxQKAbhqqYgVkoZkxrA/WnkZLM/T73ngg=;
        b=OMOuTReSygPx03SVHwLNtkKCIwy0k5X2T6ECTUSvjSXan/QEJDJC5DpTbqsjKcnWAl
         gUGXoLLwZx2C6qGBzxjryEvWUFhmjF8QLxd3nBSvNhEzYYxaYS8nKR+HQ6qov7KEmbzb
         Xiq4giUn7Z6+DKQyvgYU96CCH7h3qaRAyVvc1jS75Hk15EyJW5+brUcJZWWK+rApjjLz
         +l0DBMZD7YaeapgbTemnLwvx7leQElLX525stp7KooM4rJnD5GnA1INcyeBUulJlEfwP
         2MnUSwNrh1u3WXbCwJnDaBSA8XIJdz5EOlH+4WMbUrnWtdrGfPbA8PA5ektZHu0TbQns
         dSAA==
X-Forwarded-Encrypted: i=1; AJvYcCVf5eGndth40bYOTqKlUvyDmrsGtTSrywf3n9iH6pxcSpAsFztXypQg/3yWiv/Gqmo3vrg4bqZUWqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0f87mqObmYRmZuuTLBDoM8xg8mMaBh5bPU9vszAckmloN9aJm
	rNyHntd/3aLFTSaDyZCVFFmCTlF04GKTwxcptRlEIG2ZGIwvxBXmuWMO7A==
X-Google-Smtp-Source: AGHT+IFsenWtM1Qy6uINRrrg267X3jbCWdyD2tQ2Xe1ynboY+9i4tBMFwiVxBrTquL0grLfaqpOJ5w==
X-Received: by 2002:a05:6512:3e05:b0:536:55a9:caf0 with SMTP id 2adb3069b0e04-5389fbc6f27mr4717318e87.0.1727684301616;
        Mon, 30 Sep 2024 01:18:21 -0700 (PDT)
Message-ID: <f8060942368947e61b81b8c7bd46fe8d4b735ef8.camel@gmail.com>
Subject: Re: [PATCH v5 1/6] xen: introduce DECL_SECTION_WITH_LADDR
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2024 10:18:20 +0200
In-Reply-To: <12348b6e-2dc8-4b58-b360-578f0fdd8a14@suse.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
	 <e835f07478a528266f72d9ac99c090464522bbdf.1727452451.git.oleksii.kurochko@gmail.com>
	 <12348b6e-2dc8-4b58-b360-578f0fdd8a14@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-30 at 09:20 +0200, Jan Beulich wrote:
> On 27.09.2024 18:32, Oleksii Kurochko wrote:
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -3,6 +3,10 @@
> > =C2=A0
> > =C2=A0#include <xen/cache.h>
> > =C2=A0#include <xen/lib.h>
> > +
> > +#ifndef EFI
> > +# define DECL_SECTION_WITH_LADDR
> > +#endif
>=20
> I think either this wants inserting at the very top or it wants
> moving down
> together with ...
>=20
> > =C2=A0#include <xen/xen.lds.h>
>=20
> ... this line, past all the #includes (and, much you have it,
> separated by a
> blank line, just at both sides). Can adjust while committing of
> course.

Personally, I prefer to move that down. It would be great if you could
do that during committing.

Thanks a lot.

~ Oleksii



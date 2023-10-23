Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520047D304B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621340.967709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusR7-0006XX-Am; Mon, 23 Oct 2023 10:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621340.967709; Mon, 23 Oct 2023 10:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusR7-0006V5-88; Mon, 23 Oct 2023 10:45:29 +0000
Received: by outflank-mailman (input) for mailman id 621340;
 Mon, 23 Oct 2023 10:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qusR6-0006T3-9m
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:45:28 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 467cbf66-7191-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:45:26 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso442920066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:45:26 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ga23-20020a170906b85700b009b65b2be80bsm6413081ejb.76.2023.10.23.03.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:45:25 -0700 (PDT)
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
X-Inumbo-ID: 467cbf66-7191-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698057926; x=1698662726; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zQddtfZqwnBmd7YG+YPi0IkOAC7O/v33wk03US+cy3Y=;
        b=KjACse9tmkSDZ+mL/E0I59KBpZMghXCKx1HPnLx1xuYHORr786mGTqxihrzqJP1L/F
         RW+FRmXVYIQ35oV51Ujw/nChxtmZhEeFEFKLaAB9wllun4etP1vR3ORfilDHJWuq7CYN
         n715E8x3gshjQEHn35vUE3UdEi0tlQtywatXsgbeMVAUmIG6zH5iFyzJADCnO+0ZLJ2a
         UUq88/L0RpiaTkvoVE1pPr7MMgRs7isCg85HE7sV81Uq8zLZL+vCOXJE8tIjkII8iw15
         hilzIoQWYVv4+nO+8cS4olPUc7uaf1XmVJnnaNujAV7+GAj4+HfD5RzhkjHLMacGqpJt
         54zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698057926; x=1698662726;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQddtfZqwnBmd7YG+YPi0IkOAC7O/v33wk03US+cy3Y=;
        b=XIqNRuVebM+n3hFNSJ+23s4hJh9o7pkM44N2jfRKycftKhnoNWSlrK6ai6n0sAmfoY
         yM9lUU0avfdhb+ef3tnApkpXfofJjzg9m9LHtvifyq9sZ95/FvTrDqkPRpc73mDBDV7V
         I4VULbRrXsbjF1SHn744I3c4p1ScvqVydHk4k0INdMzxaQWy2ojJxTIXF1FQIP/kls3s
         9p6e22upESz7W8r1IYLg6XS0uphBhLNMRuZp2mlpJgiYuaGtDhZmI4laQu7kn1kepYxb
         F5sEp4ZECxt/XlenFaiSewAfimkG79aw6n+xMQoNHZROmc3omhOJROa40xA7vrEelz/p
         atLg==
X-Gm-Message-State: AOJu0YwPpPTJhqaLsPy5E8N3KEAXFT3et+fCdx9YbOrOpmcMqWIG5Deo
	GetriQm3BzwteT+CBSa0/ZE=
X-Google-Smtp-Source: AGHT+IFR75jW0k2WG8jy0BvbKJE22VNq1u8c9QoUd7eSUJnEOG3pdATo+ti/r3ivKdNLUj0qakoFNg==
X-Received: by 2002:a17:906:dc92:b0:9c7:59d1:b2ce with SMTP id cs18-20020a170906dc9200b009c759d1b2cemr6136410ejc.5.1698057925727;
        Mon, 23 Oct 2023 03:45:25 -0700 (PDT)
Message-ID: <e25e6a73d926cc7a3c1bd426c5f42c42af4e7f6a.camel@gmail.com>
Subject: Re: [PATCH v1 11/29] xen/asm-generic: introduce stub header
 mem_access.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:45:24 +0300
In-Reply-To: <3cff4f87-0da3-1e46-4b86-c43c02dde064@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <79ed96f65e7c7f4036cf62ba6b5b44a371c758ee.1694702259.git.oleksii.kurochko@gmail.com>
	 <3cff4f87-0da3-1e46-4b86-c43c02dde064@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:51 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/mem_access.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_MEM_ACCESS
> > +#define __ASM_GENERIC_MEM_ACCESS
> > +
> > +#endif
>=20
> Does xen/mem_access.h actually need to include asm/mem_access.h when
> !CONFIG_MEM_ACCESS? Without that, I don't think this header is
> needed.
Yes, it won't needed. I'll update xen/mem_access.h header and push a
separate patch.

Thanks.

~ Oleksii


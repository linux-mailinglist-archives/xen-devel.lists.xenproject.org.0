Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9487D3012
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621310.967670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusJb-0000RP-Jl; Mon, 23 Oct 2023 10:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621310.967670; Mon, 23 Oct 2023 10:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusJb-0000Oi-Gb; Mon, 23 Oct 2023 10:37:43 +0000
Received: by outflank-mailman (input) for mailman id 621310;
 Mon, 23 Oct 2023 10:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qusJa-0000Oa-Pw
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:37:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30e58902-7190-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:37:40 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so473296766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:37:40 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a1709065f9300b009c503bf61c9sm6345664eju.165.2023.10.23.03.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:37:39 -0700 (PDT)
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
X-Inumbo-ID: 30e58902-7190-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698057460; x=1698662260; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XqzS0furERQEIa0Udd5fVdkBJ8YItDGEsFBVKqlbSuA=;
        b=mXaCnaXYDzkuUNxsVivXNuo8ymfSEMsOWexxusI3/15cIoIhOzZ5764Ozv9Xbs/0gw
         +toDoKw2bfiAzu4szkrIzb9XWXv662cLTzNKdVI8FDLO5ahlPYR4ekGJwP+CUNjKtrXx
         V2SLsYy2yZnoJBGrqNY3BxwfYQE0f1XdNnxDiqIpMuys67hemsv0jGXWB74o20/AzVtI
         8pLjhPvF/prmA9+SHCFxq6G6Gre8/9hIqi3ZikIeUpImJW9DG4LSu+m3PUzowXy9Z1uQ
         Nj+nhd088ImOuyCqeZIX/K2CnR54RdAJ0qRNOJ+Ko+9lF4RdFsDx7c0hRohbvhI4NdF/
         gMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698057460; x=1698662260;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqzS0furERQEIa0Udd5fVdkBJ8YItDGEsFBVKqlbSuA=;
        b=hIZN23wia7sQN20QqRz6F5SdItmmChidDQEOOpJLa1I4hVSgCqFhP23LlWPTvzEwg7
         zZKu1vheiHqWkhAuJ50HDlYv5TDh07WFRzfqdPp7nXzlvllTwL7BI9w60G2NlPyLhkCa
         5dK/Uu99Ts+UdsBB97+lD99LTEfMhMfdkGPybFOJGVJWVOM/KMK070GNSXo4HBcTlvR8
         2fiIUdjy2DBYIA+i8ntdr5PJTOoOaGWMNo1kBgBaDOtOHwpukaz2l7e+KpJjAvK6+MsJ
         KpsN/Jl0Yx7FgkhNXdobCtNjbI1BzsZqC4CHjw9p1nlTfjxryFGsAONlWrwf9dFwlyRK
         jtXQ==
X-Gm-Message-State: AOJu0Yy4HGVP8plZUuie+yR0Z+mW5JCzc0gm25+aTnGuq2SbCJgukooS
	UXwXk7QTpC33cDFJFHSEXF0=
X-Google-Smtp-Source: AGHT+IF6Pnl6pTP5IXpWS7lav2e62P0d6ORNpjjnMc66u202lXV43lQCGETgsA/TkTbv/+eWAPA3Fg==
X-Received: by 2002:a17:907:804:b0:9ae:65a5:b6fa with SMTP id wv4-20020a170907080400b009ae65a5b6famr6647560ejb.32.1698057460114;
        Mon, 23 Oct 2023 03:37:40 -0700 (PDT)
Message-ID: <354bb8cbe4f6d88152a3b5a1c3f0acbadb97dbf2.camel@gmail.com>
Subject: Re: [PATCH v1 09/29] xen/asm-generic: introduce stub header iocap.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:37:38 +0300
In-Reply-To: <57e16e1b-e306-fc8b-37fb-c770d8ea5fed@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <df3a94a5670b900ddc1a2b7e8142555a09571b52.1694702259.git.oleksii.kurochko@gmail.com>
	 <57e16e1b-e306-fc8b-37fb-c770d8ea5fed@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:25 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/iocap.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_IOCAP_H__
> > +#define __ASM_GENERIC_IOCAP_H__
> > +
> > +#define cache_flush_permitted(d)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (!rangeset_is_empty((d)->iomem_caps))
> > +
> > +#endif /* __ASM_GENERIC_IOCAP_H__ */
>=20
> This again wants to eliminate Arm's header in exchange.
Basically yes.

The situation is the same as with device.h [1].

So let's get to the same page about [1] and then I'll apply
the solution for this header too.

[1]https://lore.kernel.org/xen-devel/48c3c78d-465f-8102-87a3-cef3a5d4838c@s=
use.com/

~ Oleksii


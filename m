Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECDE6E1CE5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 09:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521027.809273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnDRv-0005AL-Eb; Fri, 14 Apr 2023 07:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521027.809273; Fri, 14 Apr 2023 07:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnDRv-00057W-BX; Fri, 14 Apr 2023 07:02:23 +0000
Received: by outflank-mailman (input) for mailman id 521027;
 Fri, 14 Apr 2023 07:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnDRt-00057O-Rz
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 07:02:22 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ac5cdcd-da92-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 09:02:17 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id v6so16443537wrv.8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 00:02:17 -0700 (PDT)
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
X-Inumbo-ID: 4ac5cdcd-da92-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681455737; x=1684047737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7E/ybxLrLBiZp41oOMePR1HXiUvoIwxiKTUvhbUPiY=;
        b=S6kxYek8CginYMAQIc8kiF5qiwsWyuU6g8bQbgntZfAVbGipZMYTJTCOe3lqR9sNJU
         PCAyVzLmD6yUGzlPDRa7hiUiEklE6aKUfvEWV2g9pxjY/2ynO4kvqOW00odhEA/gezf+
         uj6iZb5UOXruIEiGj0+Ojkrezxq4yvU09ioQUa2sjWfRunYPrrAsbNmaYFOXdez2n8n5
         zKwILnL1Grllfkqi9Qa9sEGd42MZ8f6uCQiTWPXYyTMeEtHSpucQvxaprz88ei6E9C2u
         as7E/LoSZkbL9IGbe8RZt1YFcaUSG7T/B880tJZ7IpOBf+4vNsT9G8FijnjVQMXTboP6
         72pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681455737; x=1684047737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7E/ybxLrLBiZp41oOMePR1HXiUvoIwxiKTUvhbUPiY=;
        b=EVkqX7qwTQgdMeHBsgYsXK7i4p64h85+rR5/8ylZhxZWIIvIivzaByia2FXYGK1ySD
         N8XyygAJYdwFF0zzlj2Xrado/O9EfhgZO4XeudL8+seOBhE14Snw14WXRlnU/1eXyzNt
         kQRAAcFciakv0SRuKYTiyRj8NZEfm/QlNumeRlZ/TLgExcofuBar7m1hbvDNNMqWNgAc
         hAueqyYthyeMNQaxqHaymt0BR5Eu0+NOIWiU9kvceuw24xz84gjZtHsWUaCTQhic947Q
         f43oSMeKHRzglJ3WJF/XGn7g17hbYG9DT6PCH48BuE7z2r7g22y/TqloSyECp4jSUnUn
         u0mg==
X-Gm-Message-State: AAQBX9chwQxJ6aT6at8Pn0SVWGmhC8zcvL+KvezBnuAMi8LQ3e89PdP6
	xrGsLYGoVBQS2s6igmc90H41e50+IU20QPJ8atyNzA==
X-Google-Smtp-Source: AKy350b/2rLk8o88p4VUbyle6JhVGe9hR9d819uyBdgV73sk/uZgX0GFbxXyCEIMzWz7Cw3/rrBl4ZxfoRtYYcDxmUE=
X-Received: by 2002:adf:cf05:0:b0:2f6:ddbf:5bce with SMTP id
 o5-20020adfcf05000000b002f6ddbf5bcemr331156wrj.3.1681455736843; Fri, 14 Apr
 2023 00:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-17-jens.wiklander@linaro.org> <AS8PR08MB79910752526D506B3BA881EA92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79910752526D506B3BA881EA92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 09:02:06 +0200
Message-ID: <CAHUa44FsuN0rcbwD2ei=8MochN-9zq=i1+qiLukZNCbwpV6o-g@mail.gmail.com>
Subject: Re: [XEN PATCH v8 16/22] xen/arm: ffa: add ABI structs for sharing memory
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 1:49=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 16/22] xen/arm: ffa: add ABI structs for sharing
> > memory
> >
> > Adds the ABI structs used by function FFA_MEM_SHARE and friends for
> > sharing memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I'll add that.

Thanks,
Jens

>
> Kind regards,
> Henry


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9A6E4074
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521768.810618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJ3z-0008L8-Mz; Mon, 17 Apr 2023 07:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521768.810618; Mon, 17 Apr 2023 07:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJ3z-0008Id-JY; Mon, 17 Apr 2023 07:14:11 +0000
Received: by outflank-mailman (input) for mailman id 521768;
 Mon, 17 Apr 2023 07:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5U/i=AI=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1poJ3y-0008IX-6X
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:14:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71dc1703-dcef-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 09:14:09 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso7036711wmo.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 00:14:09 -0700 (PDT)
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
X-Inumbo-ID: 71dc1703-dcef-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681715648; x=1684307648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i33sP5KxJQ3ug0hodb7+NbP/Rdc8Yf+/xfz8DRpbBns=;
        b=rWTNf2rB95O6/JkAY8AYRlsAqMEYrWZdt03p4g6aae9P/EZuvTTGnR4HTOlBJiBeSM
         +XmNm9/5Ct/Px+y8QGd6s21d0K3ziNhTlrO6oAo8WsIuR/S5GMddWieJG8qXU2dnP9pi
         9JDHdd1gBx+DcYNvlW3tlJqkC4/YicGvY4n6q+/yyppGf24B78uwxHnOH3mJDk9b3fg9
         eGSwQyL+YrIdvrwyAccS4Yk93eIIJUSQFayBkRDhTDdbW7EVo0SUscm+Bc/1gdA2b2mm
         ihieOyKpLe9HhAlVsiUW1xtqDdFMzJULVsTLc04rP1PtAsGmmUrzdM+4bU3BoEg5/MLx
         L/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681715648; x=1684307648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i33sP5KxJQ3ug0hodb7+NbP/Rdc8Yf+/xfz8DRpbBns=;
        b=d6ZHdKQyY8hbIzLJb2THHBGDonKmn6s/mXzL5/M3zzZ0BYBLX9lwJLbhuG9GCbS8NA
         h3WWkrhPxZ4L39bnKJCNT7z65sACENxbfe1l7lN3mm/aCcznaUQRjgdIwJLnpErJvSST
         aAuovtRz8GJbfRe7GdxnykFR5OTBIoXYyptBqm6OOTgm3ic1vKFWZ2l5fE7y6czaRiEW
         7TG/S9+VQcpAY/tIoL9wGDLLkJNkIk0OvAsJHqmx5vnG5Va1nBVt1yIi/PWbnCFr+L5B
         Be65XuWpPLhotrJBRfiUt2apdXWgEepJaDw2SyE0jGtFwA5uC+WRC5vaZAQDI7h5t0x3
         piHQ==
X-Gm-Message-State: AAQBX9cc7D8CsMhgMyF05tPvRdxLFSmLxv5LzPyJLy6ZJTx9IzDCOCL8
	HurM12ijWfLxVOg9tsDo07mei24FudHDJLWlKYrYYQ==
X-Google-Smtp-Source: AKy350ZoRtbAsG2NmVq9FheLuaqlFQaisu1AeojwWM+a2iRBmyUcR24EyrzgL25BAVg2XM9OlFHrztb5j2zWfJBW98o=
X-Received: by 2002:a1c:7206:0:b0:3f1:6980:2d30 with SMTP id
 n6-20020a1c7206000000b003f169802d30mr1079499wmc.4.1681715647900; Mon, 17 Apr
 2023 00:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-14-jens.wiklander@linaro.org> <86b582a9-861c-7d8f-beeb-3469ea7948be@xen.org>
In-Reply-To: <86b582a9-861c-7d8f-beeb-3469ea7948be@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 17 Apr 2023 09:13:57 +0200
Message-ID: <CAHUa44HuHhD7i3MH5h8dE+K7Mk=6NoZ8ij4K38gy6LnkX=Zacw@mail.gmail.com>
Subject: Re: [XEN PATCH v8 13/22] xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Apr 13, 2023 at 10:33=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jens,
>
> On 13/04/2023 08:14, Jens Wiklander wrote:
> > Adds support in the mediator to handle FFA_PARTITION_INFO_GET requests
> > from a guest. The requests are forwarded to the SPMC and the response i=
s
> > translated according to the FF-A version in use by the guest.
> >
> > Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> > caller (the guest in this case), so once it is done with the buffer it
> > must be released using FFA_RX_RELEASE before another call can be made.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   xen/arch/arm/tee/ffa.c | 137 ++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 134 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 127397d8e448..74b8c517afb8 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -166,7 +166,18 @@
> >   #define FFA_MSG_SEND                    0x8400006EU
> >   #define FFA_MSG_POLL                    0x8400006AU
> >
> > +/*
> > + * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> > + * struct ending with _1_1 are defined in FF-A-1.1-REL0.
> > + */
> > +
> >   /* Partition information descriptor */
> > +struct ffa_partition_info_1_0 {
> > +    uint16_t id;
> > +    uint16_t execution_context;
> > +    uint32_t partition_properties;
> > +};
> > +
> >   struct ffa_partition_info_1_1 {
> >       uint16_t id;
> >       uint16_t execution_context;
> > @@ -183,7 +194,8 @@ struct ffa_ctx {
> >       unsigned int page_count;
> >       /* FF-A version used by the guest */
> >       uint32_t guest_vers;
> > -    bool tx_is_free;
> > +    bool rx_is_free;
>
> I am a bit confused why this is renamed. Did you introduce tx_is_free by
> mistake? If not, can you name the field correctly from when it is
> introduced?

I'll fix it.

Thanks,
Jens

>
> Cheers,
>
> --
> Julien Grall


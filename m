Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7808B77F456
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 12:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585276.916351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWaJH-0006cc-0Z; Thu, 17 Aug 2023 10:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585276.916351; Thu, 17 Aug 2023 10:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWaJG-0006Zc-UC; Thu, 17 Aug 2023 10:32:58 +0000
Received: by outflank-mailman (input) for mailman id 585276;
 Thu, 17 Aug 2023 10:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwFS=EC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWaJG-0006ZW-B5
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 10:32:58 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e57d66e-3ce9-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 12:32:57 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe389d6f19so11749321e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Aug 2023 03:32:57 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b004fdfd79e732sm3342974lfk.289.2023.08.17.03.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 03:32:56 -0700 (PDT)
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
X-Inumbo-ID: 6e57d66e-3ce9-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692268377; x=1692873177;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PSX7AvdjNTBihUKOxTJpe74YPO/nEFCmos1CT+A5JMc=;
        b=TqQMnGLXjkTnf2u6fm4LPBoTT3ujoGQDSnA2+mLaL/TrTToTl6Q80DGZuL9N7KBnPl
         MWxAYl+mFUGt7F9XDtmWqZx8a/fY2GYtdSh3syhEfu/u1ki/Agu8ccSI3xCCh5VtPmZo
         vFo0GJsqsPFc3ITrvVbKsGNlyoQ1sUJUGYtXHGNX9dPlquUFyLp362QXBfZ7JNcS0LsF
         7r1I632oJfzhkZ8d+pRe/4k78lk3VqL4ypnX+LJOXqX8741Btz6Sp+cmlDGxb5ZiMAax
         EVEP++a7zWy3bx638EJ+yB6po1H/41wcRz3dSD4Hi0l5TULXTZ23JmkBh7yCMgM2VE2Y
         UDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692268377; x=1692873177;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSX7AvdjNTBihUKOxTJpe74YPO/nEFCmos1CT+A5JMc=;
        b=kZJLNY3OhX++XU8FAaDBYKtrejPpy6Qoh8hDqu2ihAHMccYxmH93wbxRunqTRkS5ql
         13UtjFAHWBkoUKBLeV1Pt8dvSFVSiS0vnnHbotBt1S+LhBciCpKGrxzpUvqxgcX/X+bz
         c0cHZDsYc1lEksKeQ4rnJAM7gT/gaiigjAlM0ie+TMTyFV/OuGGJzKAAtot5i1czKVYQ
         wFLaP2E60CARQaeTlo7QqshaPok8HhX5HUzuunDABS5Ske8xczHyfZqP8FyIW6dKy7rd
         gZqLOw2NI1frZITfQUXjFUrEe8Dc38BuQcK1+c1ud/3NtwpYFW6bLHRWNulUW18zH9ZT
         2AhA==
X-Gm-Message-State: AOJu0Yy3DUnfvkroVQ/CHCnFbAFKQUszpmb+4BMzOdUVYczMwc5IEVPw
	sRtNQ8PWBoh3wtMBcxVrDPQ=
X-Google-Smtp-Source: AGHT+IFipukl/Tz5avZuZ3Ia9Wpn4lrLCKU/ZmWO/haLgEbOOabr8eHgxqSbKFShTc0KPmM/F8PTzA==
X-Received: by 2002:a19:645e:0:b0:4fc:265d:fc62 with SMTP id b30-20020a19645e000000b004fc265dfc62mr3414616lfj.18.1692268376445;
        Thu, 17 Aug 2023 03:32:56 -0700 (PDT)
Message-ID: <435d10e37bc86f50292e29c99ae1c6b6d9cf1a1f.camel@gmail.com>
Subject: Re: [PATCH] ns16550: add support for polling mode when device tree
 is used
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 17 Aug 2023 13:32:55 +0300
In-Reply-To: <aa19cb1c-a437-7eeb-d727-3cc9867ac307@suse.com>
References: 
	<88bd54876c745ef45eb740274fd36d747c7db471.1691767729.git.oleksii.kurochko@gmail.com>
	 <aa19cb1c-a437-7eeb-d727-3cc9867ac307@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-08-16 at 15:39 +0200, Jan Beulich wrote:
> On 11.08.2023 17:30, Oleksii Kurochko wrote:
> > @@ -1555,6 +1566,9 @@ static bool __init parse_positional(struct
> > ns16550 *uart, char **str)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > =C2=A0#endif
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( strncmp(conf, "poll", =
4) =3D=3D 0 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uar=
t->intr_works =3D polling;
>=20
> Don't you need to update "conf" here as well then?
Yes, sure, 'conf' shoud be updated too.

>=20
> As said before, please also update parse_namevalue_pairs(). I would
> appreciate (but not insist) if you also added recognition of "msi"
> at this occasion.
I'll add 'msi' too.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 uart->irq =3D simple_strtol(conf, &conf, 10);
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
> > @@ -1760,6 +1774,9 @@ static int __init ns16550_uart_dt_init(struct
> > dt_device_node *dev,
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 ns16550_init_common(uart);
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 if ( strstr(opt_com1, "poll") )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->intr_works =3D pollin=
g;
>=20
> Is strstr() really appropriate? Shouldn't it simply be strcmp(), with
> there not being any other sub-options in the non-x86 case?
It would better to use strcmp(). Thanks.

>=20
> Plus the question remains of it necessarily being com1: Is there no
> way with DT to have multiple serial ports (e.g. one for the console
> and one for a debugger)? If there indeed isn't, then unconditionally
> using opt_com1[] here is of course okay, but then opt_com2[]
> is effectively a dead variable and recognizing "com2" on the command
> line (rather than spitting out an error) is then also a mistake. IOW
> in that case both would want keeping x86-only (with a new #ifdef, as
> we certainly don't want to have com1 and com2 stuff in separate
> places).
Actually it can be even more serial ports. For example, I have a board
with 3 UARTs ( serial ports ).=20
In this case, it looks that I should have 3 variable of opt_com{1-3}[]?

Taking into account that opt_com{1-2} variables are needed only for
configuration of serial ports in X86 ( in DT-based architectures all
configuration info is inside a node of UART ) then we can check only
opt_com1[].

~ Oleksii


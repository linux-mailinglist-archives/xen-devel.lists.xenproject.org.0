Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA37A2002E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 22:59:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878202.1288374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcX7k-0000Hw-5U; Mon, 27 Jan 2025 21:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878202.1288374; Mon, 27 Jan 2025 21:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcX7k-0000G6-2i; Mon, 27 Jan 2025 21:58:28 +0000
Received: by outflank-mailman (input) for mailman id 878202;
 Mon, 27 Jan 2025 21:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zo7v=UT=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tcX7i-0000EV-Fh
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 21:58:26 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4ffa7db-dcf9-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 22:58:25 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso5610264f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 13:58:25 -0800 (PST)
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
X-Inumbo-ID: d4ffa7db-dcf9-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738015104; x=1738619904; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CRRhXBF8ZIb57xxdi9/MoA8creev6fLxGDCyaxCqyjk=;
        b=MDqtHQCGXrNvQvPFxXHYA/MvD0XgUPIGijRW8LyoybtIjEcvj3Lc2pRO3HFfnsx0LT
         dSbtKZ3oAMJGx0vJC4p5XoR1PGG2i9nZOm7Z6buXyhyrpu+I192NetJ+lEBTSk2onbjh
         A/93PyfDaIrvM4hRaEG8kdcsbycIEeB21AuSoyZVpFk+AJ3FkI6AnbnYKBfdknULaLs1
         68Dz6iwMUb/IyUkwqLf6ge0na0t3eJyM4SWX5hPhllCNiBQnJA1DuHuHXXv3bUku4FNK
         gUtWjegQX8p1fxMJyTGeTWiOjRXR6OdBPRJwJlEQ9l9Qn85n5IZ4z6rNkcOmOyK0x0+j
         NtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738015104; x=1738619904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRRhXBF8ZIb57xxdi9/MoA8creev6fLxGDCyaxCqyjk=;
        b=hCmqU9gm/aENvQDuRxgtiZwjjJtW0L5VWcKm/XkLswSl++CbuYBlB5lY6q70oPb536
         OCdrA507fOgIhMmWFhkRVC8j+gzbn8ODKlannZwXU9SaKQTtkyCB/5Vcnx7rB4c+/JfN
         4yCGgs1jOSXkmV0cPBZazKoCTn10LdJCjwtWyF8D5eLI7Z5naTVvyjRF0av5n/mVHz2P
         mDLYwxqY6i8q4V6BU6tGvujqGocX12SLEUVk/9onxuE7sp1OEVNAQxDTKQP1dweXbPRa
         dVGdG87rBOakHvuLheIk464rTCmjOlDEGZ8hE17oV3dhmi4tHCivG2+6kYxgswQC9b+u
         Mc3g==
X-Gm-Message-State: AOJu0Yyvm7n+ZTPXlrSxx6HlKMj1NrjCUHw6QE9ksIDkWwNpCjOLUe/S
	OuDtetSgRyXQqvvjgl1MmzXWqB4Pt+6MHFg5TRaomS73/aNKYQ+bhRIAyofeRutIICicIAyOsBH
	wj9WCtAqTZiRs/FyKQA9DITHsung=
X-Gm-Gg: ASbGnctAeiJ+DuaM+bJ4y4xu+ngvBSvHreNyOw3as2IN7F5nb+Yx3Z7SoHJDz9edjaR
	J4bTqQOqP2Lgo29ZcgYkRl+NSwcrypsAInC+Js5wnPodIrIvu0rm7i8mq5/HD
X-Google-Smtp-Source: AGHT+IEqdNrJLbpHoVb5TRNs2QvG9PLt7XaxsPHfDx2lW2idwUYR29a6zWEWhxl02wd8iLxjwvw98X9UD9L2jh5c+Xo=
X-Received: by 2002:a05:6000:188f:b0:385:d143:138b with SMTP id
 ffacd0b85a97d-38bf57be390mr47900353f8f.51.1738015104352; Mon, 27 Jan 2025
 13:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20250127104556.175641-1-michal.orzel@amd.com> <20250127104556.175641-2-michal.orzel@amd.com>
 <CAJ=z9a24=PE-3bhmZvfTaTgpdCXp9iDTWfoH-9F9-_OdkEf4Tg@mail.gmail.com>
 <32d42df5-08d9-4670-a571-ef315897514b@amd.com> <CAJ=z9a3gN0NyuvVQfEW2v9H9F5ZUhHB9+LvK4viQhSm6A=hauA@mail.gmail.com>
 <7fff37b8-9698-44ef-aa42-f1652ea3498c@amd.com>
In-Reply-To: <7fff37b8-9698-44ef-aa42-f1652ea3498c@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 27 Jan 2025 18:58:12 -0300
X-Gm-Features: AWEUYZlAzu8yvtq5gUtKor8AQO0J64i7OgSVKbnDKGYGBE9Sd93qlt_5D50iCvE
Message-ID: <CAJ=z9a3fFB2tnmm8qp8yx+OmL45YFcv5JKqD8fVHby+of3wn+A@mail.gmail.com>
Subject: Re: [for-4.20][PATCH 1/2] device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	oleksii.kurochko@gmail.com
Content-Type: multipart/alternative; boundary="000000000000e8cee1062cb72c04"

--000000000000e8cee1062cb72c04
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

On Mon, 27 Jan 2025 at 14:15, Michal Orzel <michal.orzel@amd.com> wrote:

> > I think it needs to be rephrased to make clear the alignment of  struct
> membanks should be the same as struct membank.
> Shouldn't this check therefore be changed to:
> BUILD_BUG_ON(alignof(struct membanks) != alignof(struct membank));



Yes it should be changed.

Cheers,


>
> ~Michal
>

--000000000000e8cee1062cb72c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Michal,</div><div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Jan 2025 =
at 14:15, Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.o=
rzel@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto">&gt; I think it needs to be rephrased to make clear the alignment of =
=C2=A0struct membanks should be the same as struct membank.<br>
Shouldn&#39;t this check therefore be changed to:<br>
BUILD_BUG_ON(alignof(struct membanks) !=3D alignof(struct membank));</block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Yes it should be changed.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Cheers,</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto"><br>
<br>
~Michal<br>
</blockquote></div></div>

--000000000000e8cee1062cb72c04--


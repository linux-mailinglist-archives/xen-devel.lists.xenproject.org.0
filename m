Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725008C2372
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 13:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719812.1122690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5OTB-0007XY-Ks; Fri, 10 May 2024 11:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719812.1122690; Fri, 10 May 2024 11:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5OTB-0007VA-I2; Fri, 10 May 2024 11:31:21 +0000
Received: by outflank-mailman (input) for mailman id 719812;
 Fri, 10 May 2024 11:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/KIo=MN=gmail.com=rob.townley@srs-se1.protection.inumbo.net>)
 id 1s5OTB-0007V4-4R
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 11:31:21 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d23bc2b9-0ec0-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 13:31:20 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-61b4cbb8834so18273337b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 04:31:20 -0700 (PDT)
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
X-Inumbo-ID: d23bc2b9-0ec0-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715340679; x=1715945479; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=COlgQ18n1H1PLCXLn6irjwUuzTBnZ5prI1L/oP0ZVF0=;
        b=T4zPQQCTBY/n4qddlzMNBWKuPb+lC1qPrlBgOMJuUW35LmY1uD554cYEDtw7uZAMC7
         qiW5N3dwMpQqKnA4OrMJPdcpPqUTrMDFgtju0BBPJGdGy9w14fKFE8rMsuB2J/ue48cP
         OvJI8R+iuiC8o6hIH57MalLi84LrfsgO8gf5LkgbTIOYOhMmBnerH8f87iG0BoRr3jqM
         dgrr2/PrgyrEMa0z3ibKKsRD0jc7p/wsML2eeP9yqpZO5TxLONW6+JvQFxWmeYssjzDb
         oM5X88h7nlQoFdqlGAzOb65I6HDj4dez/9bnueuHjL+wKzuo9no+6PnFKxtty7D5EuBX
         ozdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715340679; x=1715945479;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COlgQ18n1H1PLCXLn6irjwUuzTBnZ5prI1L/oP0ZVF0=;
        b=AvNW555FPp6YtlfsQpBeN5MOvpsQevACjrQ25ZZo3BUdHwv+zgK12GInCbYOIMf+Sw
         49x7SEaDuP1qbE82Vak6aLeWTT27gWhqsZbkb8725F8YnuSxCaCHGuUk0uqQts3yeuG/
         l8sqIA+8VexVkF5fmxmQnIb5+OgeJSvLfbS8mhd+zteE6ufX/LOJqwQuKL1Illt0J4tS
         CDU92nCMj/PPA/Rw8rgLthb8TDXdipUC5uRwsJegV1EcOycLE4qyzhXzn700RBwABSBY
         E0VXbQ+Ol4UwO2DGPLdW+eAlO0HNuCQjGCe4gGTXMLAHxPezlD1QqrNngE4N0HDrquA1
         aYMQ==
X-Gm-Message-State: AOJu0Yy8h9KGm2VsNAmpffyTlgbau8P+Ihl3J/gGlR7SWvmpAPxzcv5q
	ZTSH8w5Na/GE2KxkpX8xnbIiblDUN9s4ioic2bJWP1OuCqx6W/o+TWKR23Ly1krM/L01CQZdVQF
	GhwdP0sfFY2wYb/mnFM0RfYp6gvBTzA==
X-Google-Smtp-Source: AGHT+IGSwq5uGfBHUD9Y4mLh4ft6n74c/JL5173FK9cj0MifOk2Xwk3V/d5ASh938nUbqp1MC3Hg4eTWBsXSn5mzhxM=
X-Received: by 2002:a81:49ca:0:b0:61a:e4f3:555c with SMTP id
 00721157ae682-622aff9027fmr25243147b3.8.1715340679030; Fri, 10 May 2024
 04:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <Zj3kXlHJzlqaFpMw@dingwall.me.uk>
In-Reply-To: <Zj3kXlHJzlqaFpMw@dingwall.me.uk>
Reply-To: Rob.Townley@gmail.com
From: Rob Townley <rob.townley@gmail.com>
Date: Fri, 10 May 2024 06:31:08 -0500
Message-ID: <CA+VdTb9CCBOfq3orob5XxD6VXuy7CXAKizgry+MMm=FkJs1wJw@mail.gmail.com>
Subject: Re: Domain Birth Time
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d7b319061817df65"

--000000000000d7b319061817df65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 4:10=E2=80=AFAM James Dingwall <james-xen@dingwall.=
me.uk>
wrote:

> Hi,
>
> We've added a feature to Xen 4.15 such that `xl uptime -b` reports the
> birth
> time of the domain (i.e. a value preserved across migrations).  If this
> would
> be of wider interest I can try porting this to a more recent release and
> submitting it for review.
>
> Regards,
> James
>
> Awesome!  birth date time and last modification are fundamental to about
all data usefulness.

--000000000000d7b319061817df65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, May 10, 2024 at 4:10=E2=80=AFAM James Dingwall &lt;<a href=3D"=
mailto:james-xen@dingwall.me.uk">james-xen@dingwall.me.uk</a>&gt; wrote:<br=
></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<b=
r>
<br>
We&#39;ve added a feature to Xen 4.15 such that `xl uptime -b` reports the =
birth<br>
time of the domain (i.e. a value preserved across migrations).=C2=A0 If thi=
s would<br>
be of wider interest I can try porting this to a more recent release and<br=
>
submitting it for review.<br>
<br>
Regards,<br>
James<br>
<br>
</blockquote></div></div>Awesome! =C2=A0birth date time and last modificati=
on are fundamental to about all data usefulness.=C2=A0<div dir=3D"auto"><br=
></div>

--000000000000d7b319061817df65--


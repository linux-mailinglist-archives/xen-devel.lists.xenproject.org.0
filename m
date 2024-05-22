Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70AA8CBE9C
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 11:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727381.1131876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9igG-0008BD-Gx; Wed, 22 May 2024 09:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727381.1131876; Wed, 22 May 2024 09:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9igG-00089B-Cv; Wed, 22 May 2024 09:54:44 +0000
Received: by outflank-mailman (input) for mailman id 727381;
 Wed, 22 May 2024 09:54:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xn/7=MZ=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1s9igF-00088u-5Q
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 09:54:43 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f03518a-1821-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 11:54:41 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57825ff689bso1865197a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 02:54:41 -0700 (PDT)
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
X-Inumbo-ID: 4f03518a-1821-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716371680; x=1716976480; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q8bHjw9cpzVbGFuolJD8PptND+oSuFhb4SNUO1OU8X4=;
        b=fFjJ6e46LG43dhi6vzSEXXnbCcG6BxF365ZCs3QwkT2wRqZS8gRBLhzmZrpBC2vhub
         mPnFM1d+QaAkkJAnyUI74y6S0rRdxjNx7D7jpSZT6SjYlVa1xcQmYCT6E35MDRDjvnWj
         tmrcNT4le4wupkE+UmvHXMcl1o7Vo+hGB4l1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716371680; x=1716976480;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8bHjw9cpzVbGFuolJD8PptND+oSuFhb4SNUO1OU8X4=;
        b=t4Eq1KMWg5g0pU/7Rk4Jmt6g4fukSZsgY1jBaIP+swqiBN9TT5pab1MHHI5BSELNQ4
         10bhGBcO0mVv5gzwqGYTvEj0zY8NpLvZ4vqq89NLvqzKfhX2L8WUGfLxinuX/BcHNtMX
         fcVqFWHAdEdU6pCAEN0iC2gxQLqvrfOV381RYLnVT7N+hHJgDQZjYMqyxirjuyL7cQ68
         ijBu/LPY1xnKXrahr4lLhhFcfD7Xts4PEX9rUV9bbh4Xt83ucmP6uCw3vqEAhRq87rOp
         Sfeix7vpqY05lbLko/jnuEpuidgY3HaNtrORhd8R+oPbT9d6rl3/4vm9wE1g/Iv36edn
         oX7A==
X-Gm-Message-State: AOJu0YwCU36YOZmBGSssobMzSyfRFTJBB4zpDgFC5q7k4QDCp5/Fo7qs
	eXorYGD84g2slreYzeDYCQuQxQX3GI9I1XcsFyBgbv4gRbwZ/SfBxTwSa1dW7eF0WrXj6MAQ1uC
	XlnPqMkrcokE6UhWnm6BdbX6/oZqfhQXYyrRN2DXEMN0x23b+exALY18O
X-Google-Smtp-Source: AGHT+IF7GIkd9MfU4UpemzoVhlxsdnDKAYE6i3kug+g5d5UV9PjwPb83QN3Wm8wWgaadY0s6+kuLnZel+OCQ/yZ+c7g=
X-Received: by 2002:a50:d74e:0:b0:56e:99e:1fac with SMTP id
 4fb4d7f45d1cf-57832c4b0a0mr949525a12.39.1716371680219; Wed, 22 May 2024
 02:54:40 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 22 May 2024 10:54:04 +0100
Message-ID: <CAO-mL=yTtZeRuOMHXitaHLi184ghXQqJqRfSMgFsH7mrTKiR-Q@mail.gmail.com>
Subject: Virtual Xen Summit 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004d78bd061907ec6a"

--0000000000004d78bd061907ec6a
Content-Type: text/plain; charset="UTF-8"

Hi all,

To make sure we encourage as many people to attend Xen Summit 2024
<https://events.linuxfoundation.org/xen-project-summit/>, the community
will be helping to host the event virtually via Jitsi. This will be free to
join!

I will send the links and instructions to join our event, early next week.
Keep your eyes peeled on the mailing list for the announcement.

Please note there will be no professional AV or video equipment and this is
an effort to encourage participation.

As a reminder, virtual attendees can still get involved in design sessions,
so please register and propose a session today!
https://design-sessions.xenproject.org/

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000004d78bd061907ec6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>To make sure we encourage as ma=
ny people to attend=C2=A0<a href=3D"https://events.linuxfoundation.org/xen-=
project-summit/">Xen Summit 2024</a>, the community will be helping to=C2=
=A0host the event virtually via Jitsi. This will be free to join!</div><div=
><br></div><div>I will send the links and instructions to join our event, e=
arly next week. Keep your eyes peeled on the mailing list for the announcem=
ent.=C2=A0</div><div><br></div><div>Please note there will be no profession=
al AV or video equipment and this is an effort to encourage participation.=
=C2=A0</div><div><br></div><div>As a reminder, virtual attendees can still =
get involved in design sessions, so please register and propose a session t=
oday! <a href=3D"https://design-sessions.xenproject.org/">https://design-se=
ssions.xenproject.org/</a>=C2=A0</div><div><br></div><div><div><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><d=
iv style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"co=
lor:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></=
div></div>

--0000000000004d78bd061907ec6a--


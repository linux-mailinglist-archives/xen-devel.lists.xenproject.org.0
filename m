Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F2998BD7C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 15:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808149.1219999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svcuY-0001be-Fu; Tue, 01 Oct 2024 13:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808149.1219999; Tue, 01 Oct 2024 13:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svcuY-0001Xg-9M; Tue, 01 Oct 2024 13:27:30 +0000
Received: by outflank-mailman (input) for mailman id 808149;
 Tue, 01 Oct 2024 13:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tO+=Q5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1svcuW-0001Sn-Mf
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 13:27:28 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6288736-7ff8-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 15:27:26 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c88b5c375fso4253656a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 06:27:26 -0700 (PDT)
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
X-Inumbo-ID: e6288736-7ff8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727789245; x=1728394045; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dt3C/NC9vPU0cHuCkTJoUbi8OAiwoNFojZ4xIPKaIu0=;
        b=ThTw2csxBKYz2AwmaaC3Hob2Uwtj3XPjteaFbiP5R1RScxnyhSvm0dEX2yMEAUkf7Q
         kEvJ2Oa1crWRnFhyy6qY908e9OLMkN9Z7Y/4CzPxSZZcmNKgzI18W3xGkxdvRadRiZOc
         kDDLUa+2h43jeTSZdrStd5YLZcmztxSkx2L0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789245; x=1728394045;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt3C/NC9vPU0cHuCkTJoUbi8OAiwoNFojZ4xIPKaIu0=;
        b=CoDgucNHk1fsGdYAL6y6ADvIgwJ4PK+2Bjgg/E6ghddYWh8LAmOqMqqyGZS8lzJrYC
         JLQz7kFamQWOpYwTEnNNw2QZbFUBoOCaJiWzLWYIIs095yNnt49DllVeXo3zRtpE1wU7
         RC1ZjPprFwyH0PngqOCktTc8uA+1mfI7KmKaLDkbhykjvukO/iqeqBCsG9Cz0UE7UHsa
         ZKhopCu96aQHPgeDql9Xb4d1Dz9i9po7g+scpM0iT300N1hYiXKmjdffiu9Hra9nNEhl
         fR0/Rb35BNtVC5fuD6DPvtK4ISaspkei/qLl+V32ATDy55mvEa+/2rvp0cHXq67kDki0
         LIKQ==
X-Gm-Message-State: AOJu0YzrROw73SviPhBwRFwsghGkRofyrAjO/ds2VLQF6+YzW2fQ5DfW
	0KlmiiaJxFiFQMe0LDB9lcGapUN+nH/7Ty/qug/hwHyRw8/mKZnaJcFiA661jwehkqpOH4QHNFn
	s8mtlFnU5xdxPCQ07KYKUsXHThM9GIOmCZjUWxjmhK4pG7LtB
X-Google-Smtp-Source: AGHT+IEXA8DCHn0NHJChL3tCzBrHaDTZlunllMLVC4+ksJOsR9sk054DjbzjHalcNeyhxiXL5I768uhneRTsaZXqHW4=
X-Received: by 2002:a05:6402:3890:b0:5c7:227f:39e4 with SMTP id
 4fb4d7f45d1cf-5c882603b44mr14313532a12.31.1727789245275; Tue, 01 Oct 2024
 06:27:25 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 1 Oct 2024 14:26:49 +0100
Message-ID: <CAO-mL=xm_C_0XNy49hQjtrOqDs_di4LT4fK-WTbhVXtnddQ_bw@mail.gmail.com>
Subject: SAVE THE DATE - Next Xen Project Meetup (Cambridge)
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Cc: Xen Project Advisory Board <advisory-board@lists.xenproject.org>, 
	"committers @ xenproject . org" <committers@xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000036515706236a486d"

--00000000000036515706236a486d
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm pleased to announce the next Xen Project meetup in Cambridge!


*Please save the date: Thursday 24th October 2024*

*Location: XenServer office (Citrix), 101 Cambridge Science Park Rd,
Milton, Cambridge CB4 0FY*
*Time: 18:00 - 20:00 *

What to expect?
A developer social with food and drinks included!
Informative sessions from speakers within the community (more details to
follow).
This is free to attend, but you will need to register *HERE
<https://docs.google.com/forms/d/e/1FAIpQLScQS15qh_IAUhmbTy2gNmfxNzaVuI5QDw3G6oBa0rmrVt5-2w/viewform?usp=sf_link>.
*

We are looking for a sponsor, so if your company wishes to support us
please get in touch with me.

Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--00000000000036515706236a486d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m pleased to announce the=
 next Xen Project meetup in Cambridge!=C2=A0</div><div><br></div><div><b>Pl=
ease save the date: <br>Thursday 24th October 2024</b></div><div><b>Locatio=
n: <br>XenServer office (Citrix), 101 Cambridge Science Park Rd, Milton, Ca=
mbridge CB4 0FY</b></div><div><b>Time: 18:00 - 20:00=C2=A0</b></div><div><b=
><br></b></div><div>What to expect?</div><div>A developer social with food =
and drinks included!</div><div>Informative sessions from speakers within th=
e community (more details to follow).</div><div>This is free to attend,=C2=
=A0but <font color=3D"#ff0000">you will need to register=C2=A0<b><a href=3D=
"https://docs.google.com/forms/d/e/1FAIpQLScQS15qh_IAUhmbTy2gNmfxNzaVuI5QDw=
3G6oBa0rmrVt5-2w/viewform?usp=3Dsf_link" target=3D"_blank">HERE</a>.=C2=A0<=
/b></font></div><div><br></div><div>We are looking for a sponsor, so if you=
r company wishes to support us please get in touch with me.</div><div><br><=
/div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div>Kelly Choi<br></div><div><div style=
=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(=
136,136,136)"><a href=3D"https://xenproject.org/" target=3D"_blank">Xen Pro=
ject</a><br></div></div></div></div></div></div></div>

--00000000000036515706236a486d--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1701B5EDF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 17:15:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRdYh-0002pN-FJ; Thu, 23 Apr 2020 15:14:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBk/=6H=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jRdYg-0002pI-MH
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 15:14:34 +0000
X-Inumbo-ID: 233797ea-8575-11ea-b4f4-bc764e2007e4
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 233797ea-8575-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 15:14:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id x4so6827955wmj.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=/vzn4qBkrCeYMBtBLBRWz+edSeV8ZmrT6ebTgpxFFDI=;
 b=Un4feVeCR+NoZirip32SQFvXBuem79FECRYP3YAQqURbW78TlaBsjP7N7UbHdNWRXP
 q6bidbFizd7N+4YFZfLSTWqjQhZdWY0/5wVznnFYBCoxVSXncGfcj9tlCajyixWjk4mf
 tBY3ha+i1HVgdgFjMyu+8Acul96KHGB0D7k2KI2SUjTy0AzK75wMp+mEp46UiWkCsbW2
 SYIUZqxxJTWBX0vuWS98XA5ZGtWSnMmAOGf3yhQOycQmqGOQ/eIuyMiqwRU4KQcqW43k
 FQacLpem21UPuh7Xh6AdnY/utU3vPrFTRM/IQG6T7YiwC9Q7CM/JtQ9BdOXrRNQh76x+
 NAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=/vzn4qBkrCeYMBtBLBRWz+edSeV8ZmrT6ebTgpxFFDI=;
 b=Hj/wezFmz/WYf6F/dgw4UrV7elb8helllFkg/6OQ1yTeE95lEZiDVPtcKCrpzSlflN
 tmGkOKSWEekKCVmtCL1EDPTr6YMuzMZyUPdkgrrrzAmA4cd8PPRjvH/bhqGK0AiK9VoX
 LNuPkqVhVUu+6foYJ5i8TOpknCJiwNJJUhkU/uzSIq463xH+VzDqIrVY/fHnq26reBiY
 UiKTNnsv5WMG4vxKWNhhaZwtFozcYa7wQQnWotuCYYm6nMnZgjjuoVDw7LimFHuegzeu
 Q+yoJ4tv9WOO16/utOIbVEoI3Uc8t7B7vcJgrZos8GDOYcGqXuJbb0mUX7dhux2uapIw
 PByQ==
X-Gm-Message-State: AGi0PuZ+4D0jYxDzpSn5FSTrCkHMpvBmUgIKOT80E5ChJhnN6LkQdt2z
 TTMWZxn/x8qwOosJ1XDRZuE=
X-Google-Smtp-Source: APiQypLjSDU2vuk4FX4IjUlqt4BM/LaxsI+w2MQN2eg6d9HPyGYv/cYOD+UZH5cXz33abQoJnJrQ/A==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr4567477wme.75.1587654873341; 
 Thu, 23 Apr 2020 08:14:33 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id 5sm4010660wmg.34.2020.04.23.08.14.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Apr 2020 08:14:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Varad Gautam'" <vrd@amazon.de>
References: <20200306160254.8465-1-paul@xen.org>
 <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
 <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
 <0648e7ac-f5d7-4207-e2c6-8418681cca13@suse.com>
 <004201d5fc70$128cc610$37a65230$@xen.org>
 <8590eadc-b561-ba7c-c474-141102ec76bd@suse.com>
 <005f01d60752$aa090980$fe1b1c80$@xen.org>
 <ca063a1c-d328-153c-ae9f-b91d496dfaa9@suse.com>
In-Reply-To: <ca063a1c-d328-153c-ae9f-b91d496dfaa9@suse.com>
Subject: RE: [PATCH v4] x86: irq: Do not BUG_ON multiple unbind calls for
 shared pirqs
Date: Thu, 23 Apr 2020 16:14:31 +0100
Message-ID: <000a01d61981$e45d1770$ad174650$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIK2yJyYyCu4hvzDwRQ39T9TXjhmgIXPdL9AaPqNSQCpdNRqAIEmAPBAG+DHygCIj90sAJjlYbfp7J18FA=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Julien Grall' <julien@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 23 April 2020 12:09
> To: paul@xen.org; 'Varad Gautam' <vrd@amazon.de>
> Cc: xen-devel@lists.xenproject.org; 'Julien Grall' <julien@xen.org>; =
'Roger Pau Monn=C3=A9'
> <roger.pau@citrix.com>; 'Andrew Cooper' <andrew.cooper3@citrix.com>
> Subject: Re: [PATCH v4] x86: irq: Do not BUG_ON multiple unbind calls =
for shared pirqs
>=20
> On 31.03.2020 13:51, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 31 March 2020 08:41
> >>
> >> On 17.03.2020 16:23, Paul Durrant wrote:
> >>> That looks like it will do the job. I'll see if I can get it =
tested.
> >>
> >> Any luck with this, yet?
> >
> > I have asked Varad to test it. He hopes to get to it this week.
>=20
> Any news here?
>=20

Varad tells me he is currently testing and will get back to you soon =
(hopefully today).

  Paul



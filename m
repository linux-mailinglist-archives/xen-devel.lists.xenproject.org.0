Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A4F4F8A5F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 00:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301020.513600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncaku-0003q4-ID; Thu, 07 Apr 2022 22:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301020.513600; Thu, 07 Apr 2022 22:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncaku-0003nc-Ev; Thu, 07 Apr 2022 22:37:32 +0000
Received: by outflank-mailman (input) for mailman id 301020;
 Thu, 07 Apr 2022 22:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aJop=UR=cardoe.com=cardoe@srs-se1.protection.inumbo.net>)
 id 1ncaks-0003nW-TM
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 22:37:31 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af91fc3-b6c3-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 00:37:28 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 739BF3200B5E
 for <xen-devel@lists.xenproject.org>; Thu,  7 Apr 2022 18:37:22 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute1.internal (MEProxy); Thu, 07 Apr 2022 18:37:22 -0400
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B7ACC15A005D; Thu,  7 Apr 2022 18:37:21 -0400 (EDT)
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
X-Inumbo-ID: 4af91fc3-b6c3-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; bh=NRjo0gQPxPtQ0DxJJIo/qoaHlyx8Bge6EAXf7W
	pAT+4=; b=B/MvYysW4pIjuy6ykQemuJk8urLJbGsGCH80fmYr3CbqdOmczbOA6G
	9xd4HD1VnnqHj8od3yVt3WvD3OD+D77eWUKlZoGC6pbWszEWeuU4+XgCWYO7BRIo
	u3Z9UeItPLvR9FlTIuD2hhhO3VqwDr4SkmG7/wa35DVOwljBVAmKlN+f1oWxn2RV
	qavhsz5+IDfkFQ2ZYKqWsKvVf5+sLKBJ05zyrTc7/PuNvLJNS7XWAcug2bIrjeS+
	HWb8I2VcJ0W3CFtGvonPGg9jIS7lsEio+W8U6PoFXwfbVeQSJG4jGO4hWg9+o3iY
	6P5FvYAvdTft8M/8LNqn+AoAWstCzqfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NRjo0gQPxPtQ0DxJJ
	Io/qoaHlyx8Bge6EAXf7WpAT+4=; b=gc+iOMSmZbblY9fFQUAgKcJEsOklN/BKy
	R+KGGwS4gVe8/H0bj3PHkRKeFFxz2Vw8th5FaXRq3DheLAPVK2DxGp4pfUId+Yoo
	qzhEHH+pejTa5wY5xc7lRFX2JgfrcHL3dVOmlfenAw0dbbCjuyOkFKfV8S+kDror
	Oc9ZAfkocWQdxnWXc2T2Tya1th2YAreCH7pvBu3Ri1WbC/+yirC8VgE7V8NC5+2V
	baVnTCWefH3OMETfDgwNCHzpZyBfwzVrHzDsCE6tfn960cnPZFnDQDyWt63lmAsk
	cSja/uuN1sbeb21EWaiLjLdGpWrFupXGAWpc64y70pejXBzlQ9Vvw==
X-ME-Sender: <xms:oWdPYrN7IecAtCod2b7LGd8qcINHSw_cVwrIV9r4DPYSVF3zx5s7fA>
    <xme:oWdPYl-ZXgm16NK-Jqn4CnAsgEUiG9RYtWAGALLCJbkpLlAaplthiWxM56WMQO-EL
    _UDBm8FshJ3kcKW_co>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejledgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsegrtd
    erreerredtnecuhfhrohhmpedfffhouhhglhgrshcuifholhgushhtvghinhdfuceotggr
    rhguohgvsegtrghrughovgdrtghomheqnecuggftrfgrthhtvghrnhepvdefjeduleeivd
    egleelffegleeljeehjeeiueekudfhgfegveehheeludehjedtnecuffhomhgrihhnpehg
    ihhtlhgrsgdrtghomhdpthhrrghvihhsqdgtihdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtrghrughovgestggrrhguohgvrdgt
    ohhm
X-ME-Proxy: <xmx:oWdPYqT_BrhCnYnOPqENOrGPG_uDXOpjAn0EllTJr2kf2gPFcRAc_Q>
    <xmx:oWdPYvucu8z550g2mKJlTsLbzVwjzrhT0gLaDFsMHrgdnUrpP2E2-g>
    <xmx:oWdPYjcdk1h6V8sItcsLA-z_ApDDYzsinZlEr4kxn0hvcFpvei3XnQ>
    <xmx:omdPYtqJVDEz00rrFiMSIlY9BUmspHJeMy9PSekeQLV9u7tdp4tSnA>
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-386-g4174665229-fm-20220406.001-g41746652
Mime-Version: 1.0
Message-Id: <e92fdb05-c0c7-4006-9b52-952028eaf95f@www.fastmail.com>
In-Reply-To: 
 <alpine.DEB.2.22.394.2204061323490.2910984@ubuntu-linux-20-04-desktop>
References: 
 <alpine.DEB.2.22.394.2204061323490.2910984@ubuntu-linux-20-04-desktop>
Date: Thu, 07 Apr 2022 17:37:01 -0500
From: "Douglas Goldstein" <cardoe@cardoe.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] MAINTAINERS: add myself as Continuous Integration maintainer
Content-Type: multipart/alternative;
 boundary=6a531eadccdc48d0a383929157f936a5

--6a531eadccdc48d0a383929157f936a5
Content-Type: text/plain


On Wed, Apr 6, 2022, at 3:27 PM, Stefano Stabellini wrote:
> I have contributed all the ARM tests to gitlab-ci. After checking with
> Doug, I am happy to volunteer to co-maintain Continuous Integration.
> 
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Doug Goldstein <cardoe@cardoe.com>
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a097b43eb..cc87d5bbf1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -262,6 +262,7 @@ F: CHANGELOG.md
>  
> Continuous Integration (CI)
> M: Doug Goldstein <cardoe@cardoe.com>
> +M: Stefano Stabellini <sstabellini@kernel.org>
> W: https://gitlab.com/xen-project/xen
> W: https://travis-ci.org/xen-project/xen
> S: Supported
> 
Just want to make my ACK explicit here.
--6a531eadccdc48d0a383929157f936a5
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div><br></div><div>=
On Wed, Apr 6, 2022, at 3:27 PM, Stefano Stabellini wrote:<br></div><blo=
ckquote type=3D"cite" id=3D"qt" style=3D""><div>I have contributed all t=
he ARM tests to gitlab-ci. After checking with<br></div><div>Doug, I am =
happy to volunteer to co-maintain Continuous Integration.<br></div><div>=
<br></div><div>Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:s=
stabellini@kernel.org">sstabellini@kernel.org</a>&gt;<br></div><div>Acke=
d-by: Doug Goldstein &lt;<a href=3D"mailto:cardoe@cardoe.com">cardoe@car=
doe.com</a>&gt;<br></div><div><br></div><div>diff --git a/MAINTAINERS b/=
MAINTAINERS<br></div><div>index 6a097b43eb..cc87d5bbf1 100644<br></div><=
div>--- a/MAINTAINERS<br></div><div>+++ b/MAINTAINERS<br></div><div>@@ -=
262,6 +262,7 @@ F:	CHANGELOG.md<br></div><div>&nbsp;<br></div><div>Conti=
nuous Integration (CI)<br></div><div>M:	Doug Goldstein &lt;<a href=3D"ma=
ilto:cardoe@cardoe.com">cardoe@cardoe.com</a>&gt;<br></div><div>+M:	Stef=
ano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini=
@kernel.org</a>&gt;<br></div><div>W: <a href=3D"https://gitlab.com/xen-p=
roject/xen">https://gitlab.com/xen-project/xen</a><br></div><div>W: <a h=
ref=3D"https://travis-ci.org/xen-project/xen">https://travis-ci.org/xen-=
project/xen</a><br></div><div>S:	Supported<br></div><div><br></div></blo=
ckquote><div>Just want to make my ACK explicit here.<br></div></body></h=
tml>
--6a531eadccdc48d0a383929157f936a5--


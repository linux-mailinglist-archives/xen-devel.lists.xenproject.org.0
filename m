Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A876F6A0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576672.903069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRivj-0005KC-5T; Fri, 04 Aug 2023 00:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576672.903069; Fri, 04 Aug 2023 00:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRivj-0005HZ-1y; Fri, 04 Aug 2023 00:44:35 +0000
Received: by outflank-mailman (input) for mailman id 576672;
 Fri, 04 Aug 2023 00:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRivh-0005HR-3D
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:44:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12eed940-3260-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 02:44:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C23B561DC7;
 Fri,  4 Aug 2023 00:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21504C433C8;
 Fri,  4 Aug 2023 00:44:29 +0000 (UTC)
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
X-Inumbo-ID: 12eed940-3260-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691109870;
	bh=T/Gyp8K+J/T2MSq60L3DlKPnDzhU+5aLg0S52VXWxEk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AUY9U1PoZmUQbGZyjyo4QI+aeaIdXl6poXHZfaZ8sy3RNp5UaL2rhhD/Ie9djkq3D
	 MIpdNlQtrqV5M88ILk/Hdjs9TgcpAkR5xOHstXdEIVvXPtmHkzjIZCgyPdQHerd8Y4
	 AnWdbSDY15PQ6eLz/a/xYedaPO46zKVZaE0lU3DXvUwtialPLSwnd6GTEhb7rEOkzH
	 lBsK04ODTCPijEKUH7eSpVViAwVJv4eLMLRRKHPthnWAbdNB2Gt0HQUzt2hsO6oGuw
	 EjzaafmHPrB0kYae0cZDeAXT5d68Zy6tsg/a1ZGG+iw7fShGroxzcFn9b7r67/Rzl/
	 IZGOX0pvLY7vg==
Date: Thu, 3 Aug 2023 17:44:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012
 Rule 7.3
In-Reply-To: <c39836607097b09119a4f4480c77506295333a55.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031743440.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <c39836607097b09119a4f4480c77506295333a55.1691053438.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


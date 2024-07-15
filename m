Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66BB931C1D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 22:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759265.1168911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTSUE-0002iN-ID; Mon, 15 Jul 2024 20:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759265.1168911; Mon, 15 Jul 2024 20:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTSUE-0002go-FX; Mon, 15 Jul 2024 20:39:54 +0000
Received: by outflank-mailman (input) for mailman id 759265;
 Mon, 15 Jul 2024 20:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qaAY=OP=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1sTSUC-0002gU-OQ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 20:39:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6135c3df-42ea-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 22:39:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F7B7CE11E7;
 Mon, 15 Jul 2024 20:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984E2C4AF0E;
 Mon, 15 Jul 2024 20:39:46 +0000 (UTC)
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
X-Inumbo-ID: 6135c3df-42ea-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721075987;
	bh=kKaLSwVabRDdDlLt0slI1jlhl9ANHI8aEIY1Kw5DTBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=byu1ma0qe96Pr2RZ7ZtXjLtwI+Xj1+rDG5J96UErpKH0n3gzdE/CldPAzap4U27lT
	 Oy70dkekPynFTqihT8JJfQ/FGg0+GQoeaCBjaV8qQ7BQLaPUnn+b3dKmX/UDzTJEDO
	 sOXSh2TPe9BQovUKYf9nfBV40h7xXskDHH+ze2aoevaN59Nw3GZ2Pv2ViuqlHr0JfD
	 AlV7g1MwK7Vu45UWMos+H6QwSBv57HCBbTYTqWWLFiPwbozzgYZkHxyQieLDO3BT32
	 yQLx80rZTI+mSk0vy2ljLswCYr6vwnIZ7ghVuPI62i3nfchLUlNMOsNImXWkRJsPig
	 uuQFetvjAa1og==
Date: Mon, 15 Jul 2024 13:39:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Paul
 Durrant <paul@xen.org>, Wei Liu <wei.liu@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] xen-netback: Use seq_putc() in xenvif_dump_hash_info()
Message-ID: <20240715133945.165d8098@kernel.org>
In-Reply-To: <b3fa592d-91d7-45f0-9ca2-824feb610df8@wanadoo.fr>
References: <add2bb00-4ac1-485d-839a-55670e2c7915@web.de>
	<20240715090143.6b6303a2@kernel.org>
	<b3fa592d-91d7-45f0-9ca2-824feb610df8@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jul 2024 22:24:39 +0200 Christophe JAILLET wrote:
> Most of the time, this kind of modification is useless because it is 
> already done by the compiler, see [1].

GTK, thanks!


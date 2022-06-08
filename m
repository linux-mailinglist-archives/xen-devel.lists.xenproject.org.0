Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF0E54205F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 02:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343558.568905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyjWL-0002yi-Gp; Wed, 08 Jun 2022 00:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343558.568905; Wed, 08 Jun 2022 00:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyjWL-0002vh-C8; Wed, 08 Jun 2022 00:26:01 +0000
Received: by outflank-mailman (input) for mailman id 343558;
 Wed, 08 Jun 2022 00:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtW+=WP=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1nyjWK-0002vb-P6
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 00:26:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 908ab562-e6c1-11ec-b605-df0040e90b76;
 Wed, 08 Jun 2022 02:25:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89C7D61782;
 Wed,  8 Jun 2022 00:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9750BC34114;
 Wed,  8 Jun 2022 00:25:55 +0000 (UTC)
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
X-Inumbo-ID: 908ab562-e6c1-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654647956;
	bh=Swm8frSQYF0dasnZJ7rfGFppedE+tAaQ3A6Qn1RLL4w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rzzogDpbsRIe8kdUfMX4KxxsBmYM5b21oee7lee8hmr0Hu2pzI8Xk8IDGxFFIfx7l
	 wF0TmrAZA+kfgY7aYxSXJLGt6NeWzXlBPbldOXGTi+AVdtUvQIfpYX0VDsfq65p1PL
	 sVyK3V8cLsn0mkRbDJzQUkvQ2fVzqBgaiu7ccT/+ewiLuDEm96HxRvUQ1/gs2wezWy
	 tL22JChrMYkoKKSeR9c6gPwv18/GIg/psS+1LqYd5c5oN6h0mlXUL1GIF8nYN2HALe
	 ku2HPHMg1vetN5eB0JE1bkbD1QF0c2H7zTfm9Zknr3LT0L47JlrdN18HCWjrQmjplH
	 GrfKrj+F4MKSw==
Date: Tue, 7 Jun 2022 17:25:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH Resend] xen/netback: do some code cleanup
Message-ID: <20220607172554.4b24d138@kernel.org>
In-Reply-To: <6507870c-1c32-ebf6-f85f-4bf2ede41367@suse.com>
References: <6507870c-1c32-ebf6-f85f-4bf2ede41367@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Jun 2022 07:28:38 +0200 Juergen Gross wrote:
> Remove some unused macros and functions, make local functions static.

> --- a/drivers/net/xen-netback/rx.c
> +++ b/drivers/net/xen-netback/rx.c
> @@ -486,7 +486,7 @@ static void xenvif_rx_skb(struct xenvif_queue *queue)
>    #define RX_BATCH_SIZE 64
>   -void xenvif_rx_action(struct xenvif_queue *queue)
> +static void xenvif_rx_action(struct xenvif_queue *queue)

Strange, I haven't seen this kind of corruption before, but the patch
certainly looks corrupted. It doesn't apply.
Could you "git send-email" it?

>   {



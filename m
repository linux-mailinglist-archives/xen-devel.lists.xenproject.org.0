Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C09D4CC3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 13:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841468.1256952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE6ER-0002S5-ES; Thu, 21 Nov 2024 12:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841468.1256952; Thu, 21 Nov 2024 12:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE6ER-0002QF-BR; Thu, 21 Nov 2024 12:24:23 +0000
Received: by outflank-mailman (input) for mailman id 841468;
 Thu, 21 Nov 2024 12:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSRA=SQ=codewreck.org=asmadeus@srs-se1.protection.inumbo.net>)
 id 1tE6EO-0002Q9-QT
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 12:24:21 +0000
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 867927fd-a803-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 13:24:16 +0100 (CET)
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id B831D14C1E1;
 Thu, 21 Nov 2024 13:24:12 +0100 (CET)
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 4797f817;
 Thu, 21 Nov 2024 12:24:11 +0000 (UTC)
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
X-Inumbo-ID: 867927fd-a803-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjYyLjIxMC4yMTQuODQiLCJoZWxvIjoic3VibWFyaW5lLm5vdGsub3JnIn0=
X-Custom-Transaction: eyJpZCI6Ijg2NzkyN2ZkLWE4MDMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTkxODU2LjgyOTMwOCwic2VuZGVyIjoiYXNtYWRldXNAY29kZXdyZWNrLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1732191855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xHgJ4eJ5XwEZ8MzTd18+kcOaEGlva/2F8o2ACTeVRNM=;
	b=yxoUOOXyCcnrIh5MIGLKt+gFezI6s3szXY5vlOZNbxeXF6Gzn4daTY6w5q/yYvMcYaa60+
	plYDZWqx/gIwpHnaPuMpWb73F4XS3RvEAUfi1IMJQYN7Fi1mo5op7fhaFAtV+D6d+xlE0j
	hJzfNaUXbNgN9cuSH5NixX1sBzWD2Jj2rbeW0kOdVUvNEBkdTXq5ZGsGoOgG1rDp43DLK9
	T5l/xFT2+d3oomX4FHO1rNan20HsNAcRuC42xVDU6QuaadI8HISO4Y0cwhZUdykraEFaH3
	PzT0H+Z+XH969qj/PL0KJK2SFq3wfPlmyWOgO/xK2WiA40MyaH/qe1gjDQlDWg==
Date: Thu, 21 Nov 2024 21:23:55 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Alexander Merritt <alexander@edera.dev>
Cc: v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Simon Horman <horms@kernel.org>, Juergen Gross <jgross@suse.com>,
	Alex Zenla <alex@edera.dev>, Ariadne Conill <ariadne@ariadne.space>
Subject: Re: [PATCH] 9p/xen: fix init sequence
Message-ID: <Zz8mWwLQBNq6eopG@codewreck.org>
References: <20241119211633.38321-1-alexander@edera.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119211633.38321-1-alexander@edera.dev>

Alexander Merritt wrote on Tue, Nov 19, 2024 at 09:16:33PM +0000:
> From: Alex Zenla <alex@edera.dev>
> 
> Large amount of mount hangs observed during hotplugging of 9pfs devices. The
> 9pfs Xen driver attempts to initialize itself more than once, causing the
> frontend and backend to disagree: the backend listens on a channel that the
> frontend does not send on, resulting in stalled processing.
> 
> Only allow initialization of 9p frontend once.

I'm not familiar with the xen bringup so I don't understand how the
patch guarantees this -- otherend_changed calls are guaranted to be
seralized for a given frontend?
I guess that at least it guaratees that we won't restart the init
process after init's been done on our side and before the remote side
sends the ack, so if you've all tested this I'll just trust you and
Juergen's review and take it as an improvement.

Queued to 9p-next; will send this to Linus in ~1week

Thanks!
-- 
Dominique


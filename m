Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032A931807
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:02:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759048.1168591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTO9B-0007zt-AI; Mon, 15 Jul 2024 16:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759048.1168591; Mon, 15 Jul 2024 16:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTO9B-0007wi-7g; Mon, 15 Jul 2024 16:01:53 +0000
Received: by outflank-mailman (input) for mailman id 759048;
 Mon, 15 Jul 2024 16:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qaAY=OP=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1sTO9A-0007wc-9j
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:01:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a7414cb-42c3-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 18:01:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 54605CE10A6;
 Mon, 15 Jul 2024 16:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14049C32782;
 Mon, 15 Jul 2024 16:01:44 +0000 (UTC)
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
X-Inumbo-ID: 8a7414cb-42c3-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721059304;
	bh=hdZ1uWLfrmlCAu1exDSse0MJmB2RV4h4+omKn5OeTOU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uzO8HI/eEzxNy8ddFoI3PcKHZwffFK8KyjFJ/yZOY4J6doEyHz3b7cuBtBS11XDoV
	 oLVJQA5ZzbEj9J4L8vqCeutzPWGo0S+h0KuVuJP44H2MZFJF5u3fJo9UxjJt2qLXl+
	 6u9UFCy+YunGBLHM4eKRuSipn/md0ZpJUiaR/U3xP8k3TPCLd5SILWWViWYd5QOqba
	 u1sOtnhFtGqcKET9GYqjLG7F3Xuz27DxVK9BVQu2A5XhPBt41Y6eQciFqzg0bAFg/h
	 d3rSq2d7QDciv/PwPwykU4j9OgrYwA7ieWfc2qyARTe70sdlVQiWJLEcnOFKkWHWrL
	 F9vak1PoljrnA==
Date: Mon, 15 Jul 2024 09:01:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Paul
 Durrant <paul@xen.org>, Wei Liu <wei.liu@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen-netback: Use seq_putc() in xenvif_dump_hash_info()
Message-ID: <20240715090143.6b6303a2@kernel.org>
In-Reply-To: <add2bb00-4ac1-485d-839a-55670e2c7915@web.de>
References: <add2bb00-4ac1-485d-839a-55670e2c7915@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 13 Jul 2024 15:18:42 +0200 Markus Elfring wrote:
> Single characters (line breaks) should be put into a sequence.
> Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.
>=20
> This issue was transformed by using the Coccinelle software.

I prefer to only merge trivial changes like this if maintainer
indicates their support by acking them. Since the merge window
has opened we can't wait and see so I'm marking this patch and
your pktgen patch as deferred.


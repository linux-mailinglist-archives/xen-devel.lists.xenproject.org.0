Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF37780DD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 20:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582167.911776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUApF-00019a-BE; Thu, 10 Aug 2023 18:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582167.911776; Thu, 10 Aug 2023 18:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUApF-000179-8a; Thu, 10 Aug 2023 18:56:01 +0000
Received: by outflank-mailman (input) for mailman id 582167;
 Thu, 10 Aug 2023 18:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TqLc=D3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUApD-000173-Kf
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 18:55:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89e5f34a-37af-11ee-b284-6b7b168915f2;
 Thu, 10 Aug 2023 20:55:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DEA56671A;
 Thu, 10 Aug 2023 18:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91681C433C9;
 Thu, 10 Aug 2023 18:55:54 +0000 (UTC)
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
X-Inumbo-ID: 89e5f34a-37af-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691693756;
	bh=1qtEapxNGDH8skkuiQdfvCd0U3w8aOvV4LLqp7mfI74=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N5LW9thZgqRZlGbETyYJMk90Ougk+zkmkk5nJYFqj1fOXKIz1BlPpTdl1rUjfcTEt
	 kfe1zFD1IzuJbYkfZ/ZHsjhMqVbWL7vDczXKVNEJnTvSbm25cZPxvQLPFqhYgipotd
	 LUFFFGkhiX6qBu5qUdkLV/wh9liJuuRMBN0dVR884VKsOhbjrd/vGH0U3hZ1u96gFg
	 dM7fg7pxXSG9xo8ZJ4/hK/a8ZQy2zebHjzTE5pxcnoP+yxEVCdmEsn4Me/azxkC2Fh
	 C/lgRg1EY8B6R7BJnRTl8+VS4hPp5N812vdlIaT3FDhvA6gevyXs4sHy7wo4uWi2IY
	 ISlIZmpcaoUcw==
Date: Thu, 10 Aug 2023 11:55:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@linaro.org>
Subject: Re: [XEN PATCH] xen/arm: traps: remove unused function
 'dump_guest_s1_walk'
In-Reply-To: <f6593257-833f-4c6c-b6a8-d814d294ff97@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308101155310.2127516@ubuntu-linux-20-04-desktop>
References: <23c5b1a1ffc755b5db17d699a08fc86e1f0cc788.1691659744.git.nicola.vetrini@bugseng.com> <f6593257-833f-4c6c-b6a8-d814d294ff97@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Aug 2023, Julien Grall wrote:
> Hi,
> 
> On 10/08/2023 10:29, Nicola Vetrini wrote:
> > The function in question has no callers and its removal has already
> > been proposed (and acked) as part of this larger series [1].
> 
> This is useful information after for the reviewer to know it was already
> acked, but it is not really past commit. So I would move it after ---.
> 
> > There have been further bugfixes to that function [2], but they do not add
> > any caller, hence it can be removed.
> 
> If you want to mention bugfixes, then it is best to refer to a commit rather
> than the e-mail thread.
> 
> > 
> > [1]
> > https://lore.kernel.org/xen-devel/1395766541-23979-27-git-send-email-julien.grall@linaro.org/
> > [2] https://lore.kernel.org/xen-devel/20160720161017.4508-1-jtd@galois.com/
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > Suggested-by: Julien Grall <julien.grall@linaro.org>
> 
> Aside the e-mail address, you want to order tag in chronogical order. This was
> suggested by me then you wrote the patch. So it Suggested-by should be first.
> 
> Other than that, I would like Bertrand/Stefano to confirm if they are Ok with
> the removal.

Fine by me


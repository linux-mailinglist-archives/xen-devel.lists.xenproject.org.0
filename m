Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98287D42EE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 00:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621627.968281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv3pT-00065j-1Q; Mon, 23 Oct 2023 22:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621627.968281; Mon, 23 Oct 2023 22:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv3pS-00062O-UV; Mon, 23 Oct 2023 22:55:22 +0000
Received: by outflank-mailman (input) for mailman id 621627;
 Mon, 23 Oct 2023 22:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6cm=GF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qv3pR-00062I-PR
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 22:55:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d1aa687-71f7-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 00:55:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D5328B82169;
 Mon, 23 Oct 2023 22:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88606C433C7;
 Mon, 23 Oct 2023 22:55:16 +0000 (UTC)
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
X-Inumbo-ID: 3d1aa687-71f7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698101718;
	bh=VjOa7hH9JR8P+UsriR7nJXnJVprfcZbnpsS8l2za40k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mox3um/KZBytzTtexyjuLMR91RjGT0zCkzzV09pGH9cYSTR5rZNzDKWqXgr63zeYH
	 RlOC7vs1HosSgKULs+TWbOqDpmaKSR+QMKICkYF2j+BMxXx3HXD910NV4Fn7Use5UY
	 mxMy+n0qQYtk3bXHWBHtAroMEz496+oKOuJdwrVbf69JLFhSO15TCvzZCYzNfK5ihr
	 l2fO0aYSye9PA/Eq+/0RXIOEM/1JD8+PnxjTTHA48XMVqpqtbpvo3T8qeUiqSmF+Vb
	 vrMIOrtpJdbDEAtO+nIb/CxnrD1PRa0QauaJUo7zSAVORupDwG6zXG6+lPAdiclk3x
	 csELAk16eSBZw==
Date: Mon, 23 Oct 2023 15:55:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3 7/8] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
In-Reply-To: <9fd2cc7aa1a8640630910f873f6ddb65ed7adb6e.1697815135.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310231555060.3516@ubuntu-linux-20-04-desktop>
References: <cover.1697815135.git.nicola.vetrini@bugseng.com> <9fd2cc7aa1a8640630910f873f6ddb65ed7adb6e.1697815135.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Oct 2023, Nicola Vetrini wrote:
> Given its use in the declaration
> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
> 'bits' has essential type 'enum iommu_feature', which is not
> allowed by the Rule as an operand to the addition operator
> in macro 'BITS_TO_LONGS'.
> 
> This construct is deviated with a deviation comment.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FB7CEB61
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 00:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618804.962933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtF91-0007KJ-P5; Wed, 18 Oct 2023 22:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618804.962933; Wed, 18 Oct 2023 22:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtF91-0007I6-Lo; Wed, 18 Oct 2023 22:36:03 +0000
Received: by outflank-mailman (input) for mailman id 618804;
 Wed, 18 Oct 2023 22:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UegX=GA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtF90-0007I0-8B
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 22:36:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5af3879-6e06-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 00:36:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBE03619D9;
 Wed, 18 Oct 2023 22:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41E6C433C9;
 Wed, 18 Oct 2023 22:35:56 +0000 (UTC)
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
X-Inumbo-ID: b5af3879-6e06-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697668558;
	bh=uPtmfO+EA78Azp7vtbI+izY8X0dFEvOREDQqVMr1mp8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tVDQVRpaUJ611ucsoAg2/Z/7MU0gME6UEAsw4fpsn9QDWf0RNzfG6+akgw1TnXZd6
	 11U5NwObAdI6B028SK80spZ8xwHAeyycY1jUUkZn5YL2hx8oy6V0hO9FzDNw01Zg97
	 2sKTsccBYNdrkadatRzYIZDz7uSKOrVd2tQpuE8eMM+SYuGQtgG/5NyfEY+CjhvRP7
	 2w5dqdKMF/pY4Sk/dU/QgxgASMn+QQYF3J66bxRI3DxBwmFC36Km5sSm5V/pXKR+q7
	 PTBCFQ+BbbnJbeSXZzuHgLHoHlm9jSwuh1jQXFF6s29WTWXdCAufzHRY0X+un7llJu
	 05BXzYTUtt5mw==
Date: Wed, 18 Oct 2023 15:35:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3] xen: address violations of Rule 11.9
In-Reply-To: <d760ef0c088dc15ecc411b83640735123444f887.1697636446.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310181535480.965337@ubuntu-linux-20-04-desktop>
References: <d760ef0c088dc15ecc411b83640735123444f887.1697636446.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Oct 2023, Nicola Vetrini wrote:
> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
> compile-time check to detect non-scalar types; its usage for this
> purpose is deviated.
> 
> Furthermore, the 'typeof_field' macro is introduced as a general way
> to access the type of a struct member without declaring a variable
> of struct type. Both this macro and 'sizeof_field' are moved to
> 'xen/macros.h'.
> 
> No functional change intended.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



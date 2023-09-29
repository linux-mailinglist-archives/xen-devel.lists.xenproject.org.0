Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2267B3BA6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 22:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610721.950238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKUn-0001OQ-2M; Fri, 29 Sep 2023 20:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610721.950238; Fri, 29 Sep 2023 20:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKUm-0001MP-Vf; Fri, 29 Sep 2023 20:53:56 +0000
Received: by outflank-mailman (input) for mailman id 610721;
 Fri, 29 Sep 2023 20:53:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmKUl-00014h-Mn
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 20:53:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c5218c3-5f0a-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 22:53:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 945C361F9E;
 Fri, 29 Sep 2023 20:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B82C433C7;
 Fri, 29 Sep 2023 20:53:51 +0000 (UTC)
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
X-Inumbo-ID: 4c5218c3-5f0a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696020832;
	bh=2B856vGkSTMJAMikwkE5b97Idn5yLE+F6kWpkmavanI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DFTKGYnhznCUdOreGdQjwsNSw0hnAppKR9sRDW89ZOh/f0ucalqBmTl1UnLeS4qM2
	 Gsy9EHQyznk5hQ66bVE7xk76FXl5UY5DefhElFiAR9y2zm++H9d3PEhkdOsb4a1ZM0
	 vQwW08x1Qr93mUPSux8DfXlafFzyMw2zl9TP6Buk1hHrd5DFrlqRbOrlhqt7pkmjbs
	 8XughOHYar9m4y13zStyoLy8JDwaOePUQY54mJEKBD0WeF3/nRV1SQN1gbBdO/Tk6s
	 K7NPQ4xyiZIljVwzS9LOMjWYywnNJA0OD/2fL0RWpnmr2s7ftIf4y6TyBcTqFVApNr
	 PLQFPEup2pMEQ==
Date: Fri, 29 Sep 2023 13:53:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 3/4] x86/xstate: address a violation of MISRA C:2012
 Rule 8.3
In-Reply-To: <198577fa8876efc48a08a89b55fa5f95694b37c1.1695972930.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309291353430.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1695972930.git.federico.serafini@bugseng.com> <198577fa8876efc48a08a89b55fa5f95694b37c1.1695972930.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Sep 2023, Federico Serafini wrote:
> Make function declaration and definition consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


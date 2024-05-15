Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8424F8C6F15
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722673.1126867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Nue-0001Te-1z; Wed, 15 May 2024 23:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722673.1126867; Wed, 15 May 2024 23:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Nud-0001QP-TC; Wed, 15 May 2024 23:19:55 +0000
Received: by outflank-mailman (input) for mailman id 722673;
 Wed, 15 May 2024 23:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7Nuc-0000m2-Ns
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:19:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1a2efae-1311-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 01:19:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 99FCD61616;
 Wed, 15 May 2024 23:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FC9C116B1;
 Wed, 15 May 2024 23:19:49 +0000 (UTC)
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
X-Inumbo-ID: a1a2efae-1311-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715815191;
	bh=P2TqCEm07IO71XzjbE99tAAsu3UFAKe/yxzprP+w9EM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PDVJTVGYdzhywT2OU93OBnMdiCf7NIp2Sxc/cwaM13/SuAbz+iwi20u5b4DhLUQUQ
	 cT4cAUzKi/Pzp00a+DixUD82sp3qacUVWVEx3kvnjzZ8Kug1nC6dx54eu7S5sPfMiI
	 Ve/9XRuGvwl+WxWzDkzwAPKgLMejKKb0GFFqsEKK8MzB4dW78CurJ7iR93fAGHtH6A
	 PGjQ3VORgfSMErIyeGGaoPOdp22XOsVlds3RiteITGYCCmoMWr51naLqkhrC8DwznD
	 ZX+oZfISkuVUX0jxqkPWtKbm68LU3A/1g4SRnrbQTSuEtL0ZdpqnEj1oelkE6A5i0+
	 tVhyAf/Av4buw==
Date: Wed, 15 May 2024 16:19:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 4/4] x86_64/cpu_idle: address violations of MISRA C
 Rule 20.7
In-Reply-To: <6c84f6f0bf93a00ab1acda2d39d31b1f3d5bf8aa.1715757982.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405151619410.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com> <6c84f6f0bf93a00ab1acda2d39d31b1f3d5bf8aa.1715757982.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



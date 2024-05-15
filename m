Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AC48C6F14
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722671.1126856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NuK-0000to-Ow; Wed, 15 May 2024 23:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722671.1126856; Wed, 15 May 2024 23:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NuK-0000rk-MA; Wed, 15 May 2024 23:19:36 +0000
Received: by outflank-mailman (input) for mailman id 722671;
 Wed, 15 May 2024 23:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7NuI-0000m2-Re
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:19:34 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94dd56c1-1311-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 01:19:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A9BA6CE17E5;
 Wed, 15 May 2024 23:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20D2C116B1;
 Wed, 15 May 2024 23:19:27 +0000 (UTC)
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
X-Inumbo-ID: 94dd56c1-1311-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715815168;
	bh=XlwaEmW5wYY+zIrqokwynsWAIbhKBf192GhnqdDk0ec=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ao0qrwnO3RraVDr3G3HzKiK0+gX5yJnMKRJbTEMgOypYZ64SN4TJ9jch7s+xJ8coZ
	 wzsjSGYzcRBvWM3J5uE9vy5zvjb5u7k3+UEQa+I0V+zUxWEz7kcn9skZpghRPpZE4Q
	 l3zAaIomeeXAc6cok8bU7EsOp8vSGWTiXiIR/KD6+iIBSXOZvc34rlzBq5XP0VZt6n
	 JkPEgmcdx9FsmPRASEH9vXOKxji5ngfUs43SHWOifHTnhx/qscg1aR27nsOSS6WGpm
	 doBtt2YoJJmpGphVWuObGTiEKNgDz3A2u1AzKNZw+ZeRJh5x/3qc40VTpQA44uWSAU
	 T003I1jQ0AmVQ==
Date: Wed, 15 May 2024 16:19:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 3/4] x86_64/uaccess: address violations of MISRA C
 Rule 20.7
In-Reply-To: <b131427dc03c4b89141bab7648523b81bf5186a6.1715757982.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405151619200.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com> <b131427dc03c4b89141bab7648523b81bf5186a6.1715757982.git.nicola.vetrini@bugseng.com>
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
> xlat_malloc_init is touched for consistency, despite the construct
> being already deviated.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


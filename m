Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38856873F04
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689460.1074455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhw2F-0002zF-Qs; Wed, 06 Mar 2024 18:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689460.1074455; Wed, 06 Mar 2024 18:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhw2F-0002ws-Nj; Wed, 06 Mar 2024 18:30:35 +0000
Received: by outflank-mailman (input) for mailman id 689460;
 Wed, 06 Mar 2024 18:30:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q3K=KM=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1rhw2E-0002vE-HE
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:30:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d206f88-dbe7-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 19:30:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03AB661ACE;
 Wed,  6 Mar 2024 18:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92CB4C433F1;
 Wed,  6 Mar 2024 18:30:30 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 75D01D84BDB; Wed,  6 Mar 2024 18:30:30 +0000 (UTC)
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
X-Inumbo-ID: 9d206f88-dbe7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709749830;
	bh=PbF2UlZV892Jxrsv7n/QNaCuvcvT+bdEwgeDba0rcjA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fwiXDfvlpQlGjUt62NAuwwDKSJswzGitGsNvpmH5JJsLFIOU1IdYtAoB1W3FFEwNl
	 Heo7Oc4/XqjTSTf8XTrWqufWL0CndVvbmOhLiJFh+unzTvqh+0lZ2KV0wut+1Z8bOI
	 LeK57dveh/uRc/EIjUKLKhOrsZ3f8pRkCC33dqADerQY8+AcoodtKAPCyEZKT4Y5FJ
	 7OGroKN89O9Ev4ImAbKnPPjsldWBbdcmHgAFepFtQ6e8s3tqS2Za9s0ZWIQc9YropM
	 vGNlDE99EDrTjhMl98e59+kIVa4QiumCHwSTfYpKNXdd1Zsu2vUEItWQ8lNBCg3ngh
	 UodUR2RADtwqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 bpf-next 0/2] mm: Enforce ioremap address space and
 introduce sparse vm_area
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170974983047.28981.6719841363638067454.git-patchwork-notify@kernel.org>
Date: Wed, 06 Mar 2024 18:30:30 +0000
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
In-Reply-To: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 torvalds@linux-foundation.org, brho@google.com, hannes@cmpxchg.org,
 lstoakes@gmail.com, akpm@linux-foundation.org, urezki@gmail.com,
 hch@infradead.org, rppt@kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, jgross@suse.com, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, kernel-team@fb.com

Hello:

This series was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Mon,  4 Mar 2024 19:05:14 -0800 you wrote:
> From: Alexei Starovoitov <ast@kernel.org>
> 
> v3 -> v4
> - dropped VM_XEN patch for now. It will be in the follow up.
> - fixed constant as pointed out by Mike
> 
> v2 -> v3
> - added Christoph's reviewed-by to patch 1
> - cap commit log lines to 75 chars
> - factored out common checks in patch 3 into helper
> - made vm_area_unmap_pages() return void
> 
> [...]

Here is the summary with links:
  - [v4,bpf-next,1/2] mm: Enforce VM_IOREMAP flag and range in ioremap_page_range.
    https://git.kernel.org/bpf/bpf-next/c/3e49a866c9dc
  - [v4,bpf-next,2/2] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
    https://git.kernel.org/bpf/bpf-next/c/6b66b3a4ed5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




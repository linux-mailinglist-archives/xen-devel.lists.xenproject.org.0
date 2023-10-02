Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF377B5D49
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611828.951443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRgE-0002mv-Cj; Mon, 02 Oct 2023 22:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611828.951443; Mon, 02 Oct 2023 22:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRgE-0002kH-9L; Mon, 02 Oct 2023 22:46:22 +0000
Received: by outflank-mailman (input) for mailman id 611828;
 Mon, 02 Oct 2023 22:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRgD-0002k7-2C
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:46:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8008c4d9-6175-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 00:46:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBEFD60C70;
 Mon,  2 Oct 2023 22:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D054C433C7;
 Mon,  2 Oct 2023 22:46:16 +0000 (UTC)
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
X-Inumbo-ID: 8008c4d9-6175-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696286777;
	bh=a2jOghW5Dystax6iLCr7AUgEBj8Airf3he862yNnUqs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DPbWwcgYAuKvkRU4jAGFOZssDx5jFHVWRgQJHMbT2j9TDOQHYMFky7WZ0k2SkdAqW
	 h+D9TZagak1BGHZy51WRKm5Qd9Bo7izJsUWVk0V8C9m0AO4tNePClckTUl4KH1SShL
	 J1YFLyZfrsgksTuM341l9MAiCk3J5Db1YpyIyCcq4+VHzum4CYItRrFBDvlahiND7G
	 czIPma5vhfLuMcGUxTxFEnPYh28JIJEaHupP0T6THds+yMjbztzgSv7By1RqtZNaO+
	 /0HOmZFf/mF1Bd2hreAOOLxQVcOVycoPc/GkvfqBpiFUA+RWwPzWNvYftV6VF8SzeC
	 tU0VbHr+OUx2Q==
Date: Mon, 2 Oct 2023 15:46:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Henry Wang <henry.wang@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] x86/paging: address a violation of MISRA C:2012 Rule
 8.3
In-Reply-To: <5a304ffd4fbdd0d5809dc68b857410bbc02f32a0.1696252375.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021546070.2348112@ubuntu-linux-20-04-desktop>
References: <5a304ffd4fbdd0d5809dc68b857410bbc02f32a0.1696252375.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Federico Serafini wrote:
> Make function declaration and definition consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


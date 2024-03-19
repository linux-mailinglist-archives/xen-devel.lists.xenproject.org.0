Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE587F60F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 04:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695192.1084747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQDf-0004Ev-Ic; Tue, 19 Mar 2024 03:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695192.1084747; Tue, 19 Mar 2024 03:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQDf-0004Ch-Ej; Tue, 19 Mar 2024 03:32:55 +0000
Received: by outflank-mailman (input) for mailman id 695192;
 Tue, 19 Mar 2024 03:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0xd=KZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rmQDe-0003wv-1T
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 03:32:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf4ecd4-e5a1-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 04:32:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D5CA4CE0C06;
 Tue, 19 Mar 2024 03:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C79C433F1;
 Tue, 19 Mar 2024 03:32:47 +0000 (UTC)
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
X-Inumbo-ID: 5cf4ecd4-e5a1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710819169;
	bh=lPj/oTZCgFBqvfjUslvjV05lRJo3jJ1F11An7BIiqQc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DVWW7Thro7CvBDHAtqjoiV5b5NFNEi0SPJsdaZUEru5Rr9WTdjMYHSUcodCWyTAHr
	 R+xhEgVX9+2TF6MevDpotctMAu4Hh/q7N75vPaKmOwJjN+oyszispDyOYxUSRfZRCE
	 aPqUQ2OeNgDIRPq+PRtW4E+Ox11z9cB/AsJvrw5UlI92ntz6g4Ur8JkJSYXQt7sdrc
	 3V8VjS4kdK0lhwX6YcRxN8ilMuw0fWTLVzFpeO01ADD4BFLfThwHepUSJ1RzpKDnGZ
	 4hqzN99WZIVp75K3F0Y/U/3tvRtmIEN0Fy7WdgKrowbXUM0Gy+UTbh7rWzhwBf9VjA
	 brbbcBBYTKM+w==
Date: Mon, 18 Mar 2024 21:32:45 -0600 (MDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Rahul Singh <rahul.singh@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 06/10] xen/arm: smmu: address violations of MISRA C
 Rule 20.7
In-Reply-To: <50ec3074772b0c58bef446d1c06aa41db04a66d0.1710762555.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403181811520.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com> <50ec3074772b0c58bef446d1c06aa41db04a66d0.1710762555.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Mar 2024, Nicola Vetrini wrote:
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
 


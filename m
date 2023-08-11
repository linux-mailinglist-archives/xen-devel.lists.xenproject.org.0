Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52522779A5D
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 00:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582664.912526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUaFV-0007UR-Cq; Fri, 11 Aug 2023 22:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582664.912526; Fri, 11 Aug 2023 22:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUaFV-0007Sl-9t; Fri, 11 Aug 2023 22:04:49 +0000
Received: by outflank-mailman (input) for mailman id 582664;
 Fri, 11 Aug 2023 22:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUaFU-0007Sc-0Q
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 22:04:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14e1f4ae-3893-11ee-b284-6b7b168915f2;
 Sat, 12 Aug 2023 00:04:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD0F1631D0;
 Fri, 11 Aug 2023 22:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A98C433C7;
 Fri, 11 Aug 2023 22:04:43 +0000 (UTC)
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
X-Inumbo-ID: 14e1f4ae-3893-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691791484;
	bh=aU1dN6H5/hp5SzeKFRB9VQjrrzA+QX8wskRhX1OoOmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WoW3xs6ft36kEwR3l3IHIxmhF/m0ScoW8ciCcrU1QF9QhYyTI4qVYrZGFrYxqzucC
	 NzFe3miYScrp6CntFPS0v52Vf+rP3kaOL78n4xuY8xPpNv6trcydKZ3cKz0YQjxjwH
	 FKjTFt4caKNNuiedjbLEGLErjpLP3qU/2GgCBdGjSTDTzN/iYZPuWE5GbSK/ICTGrW
	 gnzHJd9UhmhgwEPu9+l4BxAMm9dRzuLfDVX3Sn14HlQ/ppgmZh8Z4GeCk1feGmhbl4
	 o01E7j0cuITemG/Oc3ORYSRza85cUIBSRMibQn72ha/ca9aFCKt8riVuSYCTJCDtuI
	 H1M4kD/kdchkg==
Date: Fri, 11 Aug 2023 15:04:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    andrew.cooper3@citrix.com, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/2] automation: avoid pipelines on specific
 branches
In-Reply-To: <c88fc56a8985acbdb2630a81c930ef12c0743c1b.1691760935.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111501220.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691760935.git.simone.ballarin@bugseng.com> <c88fc56a8985acbdb2630a81c930ef12c0743c1b.1691760935.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Simone Ballarin wrote:
> This patch avoids the execution of pipelines in the
> following branches:
> - master
> - smoke
> - coverirty-tested/.*
> - stable-.*
> 
> The job-level exclusions have been removed as they are
> pointless with this new workspace-level exclusion.
> 

Very good thanks!

One question on the commit message: what did you mean by "the job-level
exclusions have been removed as they are pointless with this new
workspace-level exclusion"

It doesn't look like any job-level exclusion has been removed by this
patch?



> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>
> ---
>  .gitlab-ci.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ee5430b8b7..ef4484e09a 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,3 +1,9 @@
> +workflow:
> +  rules:
> +    - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
> +      when: never
> +    - when: always
> +
>  stages:
>    - analyze
>    - build
> -- 
> 2.34.1
> 


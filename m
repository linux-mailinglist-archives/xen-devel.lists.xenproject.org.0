Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B6B29D4E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 11:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085790.1444075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvu7-0007Du-6Z; Mon, 18 Aug 2025 09:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085790.1444075; Mon, 18 Aug 2025 09:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvu7-0007Az-3h; Mon, 18 Aug 2025 09:11:47 +0000
Received: by outflank-mailman (input) for mailman id 1085790;
 Mon, 18 Aug 2025 09:11:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1unvu5-0007At-HB
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 09:11:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1unvu4-00BeJS-2U;
 Mon, 18 Aug 2025 09:11:44 +0000
Received: from [2a02:8012:3a1:0:ad2f:e692:6470:95d9]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1unvu4-007gGB-2a;
 Mon, 18 Aug 2025 09:11:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Cl21S7RnQlZfKjaEvglLTfypVIxab1kHDDNrijQJ6zU=; b=phlmYgOuLsvcZwJpPJDqpvL1K1
	hYoYBVVPmSOF3dx/OevmMSX61VqrMs96WKsSXKLXz+R/tkqqX/h9imvbkYamBNAgBcrb40WGmDXd1
	6nmGJ+NB5+0zMf13kgVM4UQ90jrCgvxib/im7SjR5rhFs6lDFFC87hiVbEJ5++2jqHIE=;
Message-ID: <9f5a77c1-ff99-40db-ae49-86e34cc1a391@xen.org>
Date: Mon, 18 Aug 2025 10:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/sending-patches: add GitLab pipeline link
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, jbeulich@suse.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2508151310010.923618@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2508151310010.923618@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/08/2025 21:12, Stefano Stabellini wrote:
> When submitting patches to xen-devel, add a link to a successful
> pipeline run.

Does this mean we have enough capacity to handle normal CI job + submission?

Also, as we try to encourage people to use the gitlab CI. So we would 
probably also encourage them to write new tests because in a lot of 
cases we will add new code. So the pipeline is only going to confirm 
that we are regressing existing tests (which may be irrelevant to the 
subsystem modified).
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
> index 1991932b68..6e1401ea22 100644
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -314,3 +314,23 @@ A patch should always be sent **to** the xen-devel mailing list
>   of all touched code areas should get a copy of the mail via **Cc**. In case
>   some other recipients are known to be interested in the patch, they can be
>   added via **Cc**, too.
> +
> +## Testing
> +
> +Xen Project uses a GitLab-based CI infrastructure. You can request to
> +have your GitLab account added to the Xen Project organization on GitLab
> +(https://gitlab.com/xen-project) by reaching out to THE REST maintainers
> +via xen-devel or Matrix. Once your account is added to the Xen Project
> +organization on GitLab, also a personal Xen repository will be created
> +for you under https://gitlab.com/xen-project/people/<your-username>/xen.
> +You will be able to trigger a GitLab testing pipeline with a single git
> +push to your personal Xen repository.

I think it would be worth mentioning that this should be based on a 
recent "master" (I would say less than two days old).

Also, can you clarify why we are asking the user to trigger the pipeline 
rather than having a both that will pick a series and test it?

> +
> +When submitting a non-trivial patch or a non-trivial patch series,

This wording is ambiguous. But even trivial patch could result to 
regression. So I am not sure why we would want to exclude them. Can you 
clarify?

> +please include a link to the successful GitLab pipeline run on your
> +personal branch. This information can be added after the `---` line.
 >> +For example:
> +
> +    ---
> +    Test CI pipeline:
> +    https://gitlab.com/xen-project/people/your-username/xen/-/pipelines/1980129839

Cheers,

-- 
Julien Grall



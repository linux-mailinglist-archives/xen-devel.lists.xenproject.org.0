Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C28B902E
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 21:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715402.1117000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Fu5-0004WP-Ua; Wed, 01 May 2024 19:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715402.1117000; Wed, 01 May 2024 19:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Fu5-0004U5-RG; Wed, 01 May 2024 19:46:09 +0000
Received: by outflank-mailman (input) for mailman id 715402;
 Wed, 01 May 2024 19:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2Fu4-0004Sa-6g
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 19:46:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ed7bea4-07f3-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 21:46:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 35DBBCE1360;
 Wed,  1 May 2024 19:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C44CC072AA;
 Wed,  1 May 2024 19:45:55 +0000 (UTC)
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
X-Inumbo-ID: 6ed7bea4-07f3-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714592757;
	bh=D1z2Oq6Nr7q2jVU8pRYIWTBkfTHNnLQ/TVYIxW/fVfQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D4J/E70PLN+jRsL5Crj8FNBRTIf8KuCrrc7vQm9v0MnPE+L5rLMEglXgJ56VIvtRF
	 SuxdB7ZWt46jEQkeLJClGBvcsneeQzmNzbcje6GsLtBt7XDBvv7E8/Ak/XblieolVI
	 t8d1coLbCVmW4EvxvWN+4hLLnziP20wkmoad1mX7pRefjdercWPSCZprETyJfKmcGt
	 A+yOOLbmRMHqsqsUD4FsbTTtHngAfnQUONpgGAPh53IQf6UfjLlJ6Pg6ImOogFShc/
	 8vmF4qyCIj4q1sOoTT8hM76nHG89oKC7ULXD3wDAioefvSm1VW7quCk/hTZk7FUoR0
	 +oXDgTV15V6bw==
Date: Wed, 1 May 2024 12:45:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/3] automation: do not allow failure for triggered
 analyses
In-Reply-To: <34d8782629fc8cb1fe09060eb1aac2d6efab8096.1714401209.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405011245490.497719@ubuntu-linux-20-04-desktop>
References: <cover.1714401209.git.federico.serafini@bugseng.com> <34d8782629fc8cb1fe09060eb1aac2d6efab8096.1714401209.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Federico Serafini wrote:
> Do not allow_failure for triggered analyses:
> introducing regressions of clean guidelines will cause a CI failure.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/analyze.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 46c9d8e2e5..32bf570149 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -26,7 +26,6 @@
>  
>  .eclair-analysis:triggered:
>    extends: .eclair-analysis
> -  allow_failure: true
>    rules:
>      - if: $CI_PIPELINE_SOURCE == "schedule"
>        when: never
> -- 
> 2.34.1
> 


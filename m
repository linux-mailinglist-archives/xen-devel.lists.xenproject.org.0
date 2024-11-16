Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257A39CFBB9
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 01:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838523.1254532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6ln-0007Il-CS; Sat, 16 Nov 2024 00:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838523.1254532; Sat, 16 Nov 2024 00:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6ln-0007HD-7S; Sat, 16 Nov 2024 00:34:35 +0000
Received: by outflank-mailman (input) for mailman id 838523;
 Sat, 16 Nov 2024 00:34:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tC6ll-00072W-SE
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 00:34:33 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a7f1082-a3b2-11ef-99a3-01e77a169b0f;
 Sat, 16 Nov 2024 01:34:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 162CBA4270B;
 Sat, 16 Nov 2024 00:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90E9C4CECF;
 Sat, 16 Nov 2024 00:34:27 +0000 (UTC)
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
X-Inumbo-ID: 8a7f1082-a3b2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjhhN2YxMDgyLWEzYjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNzE3MjcwLjE5OTA5Mywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731717268;
	bh=lexmv8CYgrr7kQhQ79IlUEU49w8T8vMJdBHPPErcW7Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DvBOtKaLMdhc6gsj1WPbzVOdQ6cFf1GB7/8jfCn9e+iJ5tpHRAebxkhGTHkCk46pg
	 KIpZFZFdqW/5Mh4XDLeYf/fVB7tfsnE9JifluYNtj1bUA9pQHr3Vbm2Et31rMoEbvh
	 5Jk76YvVFJ5BEYsp3i/EbZbMsGgr8k2YzOrW6iLjvLM1fTzmj6+QBOkIrZwfk6e4cp
	 vcoS84CDERzPQpCOMMhlYJO9euYiV4kZahk8hy3Qjp4q27ngNhjBfo1v/ZFJrziMGq
	 0u6dmiCnk9HBU3pTicltltvBTzp64OiFLlSYoFYeL6kmXGWsYPEWQryvlStJGSqHwl
	 lQPouVk2qMItA==
Date: Fri, 15 Nov 2024 16:34:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/3] CI: Remove deprecated "only:variables" in favor
 of "rules:if"
In-Reply-To: <20241115170739.48983-2-anthony.perard@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2411151629270.1160299@ubuntu-linux-20-04-desktop>
References: <20241115170739.48983-1-anthony.perard@vates.tech> <20241115170739.48983-2-anthony.perard@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Nov 2024, Anthony PERARD wrote:
> Also, this prevent using "rules", like in the ".test-jobs-common"
> template.
> 
> https://docs.gitlab.com/ee/ci/yaml/#only--except
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index f5dd4de757..ab5c8be0cd 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -98,9 +98,8 @@
>        - '*.log'
>        - '*.dtb'
>      when: always
> -  only:
> -    variables:
> -      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +  rules:
> +    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - xilinx
>  
> @@ -117,9 +116,8 @@
>        - smoke.serial
>        - '*.log'
>      when: always
> -  only:
> -    variables:
> -      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +  rules:
> +    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - xilinx
>  
> @@ -137,9 +135,8 @@
>        - smoke.serial
>        - '*.log'
>      when: always
> -  only:
> -    variables:
> -      - $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +  rules:
> +    - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - qubes-hw2
>  
> -- 
> 
> 
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 


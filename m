Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF420A7B43C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937602.1338530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0V1o-0003MU-1h; Fri, 04 Apr 2025 00:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937602.1338530; Fri, 04 Apr 2025 00:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0V1n-0003Ke-VG; Fri, 04 Apr 2025 00:35:23 +0000
Received: by outflank-mailman (input) for mailman id 937602;
 Fri, 04 Apr 2025 00:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0V1n-0003KW-0H
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:35:23 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0a128f1-10ec-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 02:35:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F3900A46A5D;
 Fri,  4 Apr 2025 00:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403BCC4CEE7;
 Fri,  4 Apr 2025 00:35:19 +0000 (UTC)
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
X-Inumbo-ID: b0a128f1-10ec-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743726920;
	bh=Zmm0hfoMOjXje/OJG2o2XJH5/y5Rl9dbKPCDg+75bOI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Du+Hqn07eV+eZivyxw19vD51pEWmdtk1S6pQD648uCznI9d+8RmRCArJ1P96SRPWZ
	 aWsNeUcwNHHceTkpOdXAZl0WWeFXMscMmDx3dka9/9b0tnuNGmSMZHT1/wf2nB++IN
	 bmqjfl8o7yU9EsJMOQky0Ui9Mg7rEIq7q4YBId5d4kC2Z9KtUzi4V7rVQFfLJBUL4M
	 Z0j0/3FcmGZwvK1Uqhbdk+GEl0fmyFm3pdVZEOCgZIc+J/PqpH39EpSoVqu2ef1v3h
	 noB6JFAK4r0lMgwxFXhqwraIlid+AFQTROaV/otycs1uvrmpIrqKK+hSTitMYyBc1v
	 diqi0ThpIlKQw==
Date: Thu, 3 Apr 2025 17:35:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 06/11] ci: consistently use DOCKER_CMD in makefiles
In-Reply-To: <72551291927c75a97657890df15138579f1543ac.1743678257.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504031735100.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <72551291927c75a97657890df15138579f1543ac.1743678257.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-148214441-1743726920=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-148214441-1743726920=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Marek Marczykowski-Górecki wrote:
> This allows rebuilding containers using podman too.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/build/Makefile           | 4 ++--
>  automation/tests-artifacts/Makefile | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/build/Makefile b/automation/build/Makefile
> index 4df43b040777..fedf7524dacd 100644
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -31,8 +31,8 @@ clean:
>  define CLEAN_RULE
>  .PHONY: clean-$(1)
>  clean-$(1):
> -	if [ -n "$$$$(docker image ls -q $(REGISTRY)/$(subst /,:,$(1)))" ]; then \
> -		docker image rm $(REGISTRY)/$(subst /,:,$(1)); \
> +	if [ -n "$$$$($(DOCKER_CMD) image ls -q $(REGISTRY)/$(subst /,:,$(1)))" ]; then \
> +		$(DOCKER_CMD) image rm $(REGISTRY)/$(subst /,:,$(1)); \
>  	fi
>  
>  endef
> diff --git a/automation/tests-artifacts/Makefile b/automation/tests-artifacts/Makefile
> index d055cd696bed..80a60a94f3f7 100644
> --- a/automation/tests-artifacts/Makefile
> +++ b/automation/tests-artifacts/Makefile
> @@ -10,9 +10,9 @@ help:
>  	@echo "To push container builds, set the env var PUSH"
>  
>  %: %.dockerfile ## Builds containers
> -	docker build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
> +	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
>  	@if [ ! -z $${PUSH+x} ]; then \
> -		docker push $(REGISTRY)/$(@D):$(@F); \
> +		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>  	fi
>  
>  .PHONY: all
> -- 
> git-series 0.9.1
> 
--8323329-148214441-1743726920=:3529306--


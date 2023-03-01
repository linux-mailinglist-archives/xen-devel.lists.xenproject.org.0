Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB9B6A6573
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 03:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503831.776182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXC93-0007Vx-Ib; Wed, 01 Mar 2023 02:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503831.776182; Wed, 01 Mar 2023 02:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXC93-0007TU-Fb; Wed, 01 Mar 2023 02:24:41 +0000
Received: by outflank-mailman (input) for mailman id 503831;
 Wed, 01 Mar 2023 02:24:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+Ik=6Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXC91-0007TN-R0
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 02:24:39 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 367750c9-b7d8-11ed-969b-2f268f93b82a;
 Wed, 01 Mar 2023 03:24:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D199BB80E95;
 Wed,  1 Mar 2023 02:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FB4C433EF;
 Wed,  1 Mar 2023 02:24:34 +0000 (UTC)
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
X-Inumbo-ID: 367750c9-b7d8-11ed-969b-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677637475;
	bh=sKGaTfCyzwdZpShNXy2QehrvmJmBlYrY5TcY938aNBY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qy83DXzdgmfCmqtkXDAFamzsVp7KFwdWTk2wqYe9LfWxCaGvaCFp4F6I/P2X1WZHX
	 /AW+Jx/KZsIOr6pfTsRljfCkr2E0bc2e3vdPFgrb8YDV9pKxKn3u/lq3vr/pZf+QRr
	 kBG6Xl9wXv1xrlUmSH3KtVHkYk28LGekzYCmkqbLT7MROIOASlPTWwCWPKP3WY/sS8
	 lcJm4zGX3sYtPS7pkCtZOwpJruuB1DRVe5fWQazFvPI3I0ouH7UhKFT9TQhd8aKGVx
	 E2/qlD/J0t1K/G/odfuz/zssQivs78UyBUSdqT5QMIvre3WlDSDl49L/GEYDeywOa4
	 k4JZ4BQW7xqtQ==
Date: Tue, 28 Feb 2023 18:24:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: Always pull base image when building a
 container
In-Reply-To: <20230228182226.52201-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2302281824250.3680@ubuntu-linux-20-04-desktop>
References: <20230228182226.52201-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Feb 2023, Anthony PERARD wrote:
> Ask docker to check if there's an update of the base image to avoid
> using an old container cached locally.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/build/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/build/Makefile b/automation/build/Makefile
> index f1d56ce532..4df43b0407 100644
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -16,7 +16,7 @@ help:
>  include yocto/yocto.inc
>  
>  %: %.dockerfile ## Builds containers
> -	$(DOCKER_CMD) build -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
> +	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
>  	@if [ ! -z $${PUSH+x} ]; then \
>  		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>  	fi
> -- 
> Anthony PERARD
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72465B2A5D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 01:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403702.645891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWQy0-0004c5-Bf; Thu, 08 Sep 2022 23:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403702.645891; Thu, 08 Sep 2022 23:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWQy0-0004ZP-7Z; Thu, 08 Sep 2022 23:29:52 +0000
Received: by outflank-mailman (input) for mailman id 403702;
 Thu, 08 Sep 2022 23:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWQxy-0004GN-TY
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 23:29:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2202033e-2fce-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 01:29:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9943B8211F;
 Thu,  8 Sep 2022 23:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A5DC433C1;
 Thu,  8 Sep 2022 23:29:47 +0000 (UTC)
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
X-Inumbo-ID: 2202033e-2fce-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662679788;
	bh=0iqsbOsCrBEMw5bOAeu+wgLezyZaPXPzY0+1ThDuT84=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G3wJfr9XT+63WpU21fXcRLH+m2ruMZvMzk5O016BRtWYycx4+uo5hauVZVjAE6M+i
	 1rJDslgRACbXx2/i7BDbIPNhKc4flGDkJTcT6FQeTKEsQc8eUELlsUigoxsY6Eh25c
	 ApT+Sajpb85X7gzb9D31G/0El6MggbFfOWc2gZTurlxKXVIjeM90ezin38mKuosxhi
	 xSz68RMdH/dXCi0TrJ8lNBBhA1qEDc7vKDFXAw/1bHJYVanhaaYfQ5r6X694BiksXx
	 3NQQpPZogcTZhnNtdzR0Y43Z5dExq1GoHo2KF6sj2V5aC2F5x2keiXAjminVVzs86U
	 FtpTLVrDB6oOw==
Date: Thu, 8 Sep 2022 16:29:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Ayan Kumar Halder <ayankuma@amd.com>
Subject: Re: [for-4.17 v2 2/3] automation: qemu-smoke-arm64: Silence ifconfig
 error messages
In-Reply-To: <20220908092230.21421-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209081629330.157835@ubuntu-linux-20-04-desktop>
References: <20220908092230.21421-1-michal.orzel@amd.com> <20220908092230.21421-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Sep 2022, Michal Orzel wrote:
> During the ping test, dom1 tries to assign an ip to eth0 in a loop.
> Before setting up the network interface by dom0, this results in
> printing the following error message several times:
> (XEN) DOM1: ifconfig: SIOCSIFADDR: No such device
> 
> Silence this by redirecting stderr/stdout to /dev/null as we do not
> care about the output and we should not pollute the log file.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - none
> ---
>  automation/scripts/qemu-smoke-arm64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index c80d9b2aee00..7ac96027760d 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -6,7 +6,7 @@ test_variant=$1
>  
>  passed="passed"
>  check="
> -until ifconfig eth0 192.168.0.2 && ping -c 10 192.168.0.1; do
> +until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
>      sleep 30
>  done
>  echo \"${passed}\"
> -- 
> 2.25.1
> 


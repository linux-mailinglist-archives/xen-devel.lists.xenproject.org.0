Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA442CC2A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 22:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208871.365138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1malH5-0006Pp-9B; Wed, 13 Oct 2021 20:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208871.365138; Wed, 13 Oct 2021 20:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1malH5-0006Ny-5r; Wed, 13 Oct 2021 20:54:55 +0000
Received: by outflank-mailman (input) for mailman id 208871;
 Wed, 13 Oct 2021 20:54:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1malH3-0006Nm-4v
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 20:54:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3c5eb78-c983-4efc-8cd5-08b348a54516;
 Wed, 13 Oct 2021 20:54:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0959661139;
 Wed, 13 Oct 2021 20:54:51 +0000 (UTC)
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
X-Inumbo-ID: d3c5eb78-c983-4efc-8cd5-08b348a54516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634158491;
	bh=6XAwD7fJVOhBvmRdjPQd/C92AijiPUGTCW7HfqdlakU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RYJdkyd1okA3F+VWJ7LrfwrEN0MfaL+7KYPMGS9En0804Eoz2NDWXhMHqMprha4/s
	 zrVntv5l+11BqC3CoQB98RT3PGv+94Ok1DAHVkqzT8Rkz7kLwpmFM5d7/bN6vbbLc7
	 SyXLeNUg8kp2yhUQtk1nVF2hoznLzv0RekAwFY1pm8VHohz0fOPAAONSI/kwjYLM7h
	 PiC2XKTeoeScimq2Qt5sGJhTOOs+atZrnHeOw7Rn1jtbeYOlppLlLPpEWj9+tcZp++
	 qZ/ZEBDZCsQLSBPyYygUXOBKujlEWx9ToQd+ESbQ5OSkGBHahrS576Mgesb1hY9sCd
	 SmZqLe6FgYGvg==
Date: Wed, 13 Oct 2021 13:54:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] arm/docs: Clarify legacy DT bindings on UEFI
In-Reply-To: <20211013145202.53070-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2110131354410.9408@sstabellini-ThinkPad-T480s>
References: <20211013145202.53070-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1518877962-1634158491=:9408"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1518877962-1634158491=:9408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Oct 2021, Luca Fancellu wrote:
> Since the introduction of UEFI boot for Xen, the legacy
> compatible strings were not supported and the stub code
> was checking only the presence of “multiboot,module” to
> require the Xen UEFI configuration file or not.
> The documentation was not updated to specify that behavior.
> 
> Add a phrase to docs/misc/arm/device-tree/booting.txt
> to clarify it.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Committed


> ---
> Changes in v2:
> - dropped redundant wording in docs/misc/arm/device-tree/booting.txt
> - Add more details to the commit message
> ---
>  docs/misc/arm/device-tree/booting.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index c6a775f4e8..71895663a4 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -51,6 +51,8 @@ Each node contains the following properties:
>  	Xen 4.4 supported a different set of legacy compatible strings
>  	which remain supported such that systems supporting both 4.4
>  	and later can use a single DTB.
> +	However when booting Xen using UEFI, the legacy compatible
> +	strings are not supported.
>  
>  	- "xen,multiboot-module" equivalent to "multiboot,module"
>  	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
> -- 
> 2.17.1
> 
--8323329-1518877962-1634158491=:9408--


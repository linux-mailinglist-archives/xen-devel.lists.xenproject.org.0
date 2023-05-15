Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708247040E3
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 00:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534858.832271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pygZU-0005yV-SA; Mon, 15 May 2023 22:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534858.832271; Mon, 15 May 2023 22:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pygZU-0005vr-Od; Mon, 15 May 2023 22:21:36 +0000
Received: by outflank-mailman (input) for mailman id 534858;
 Mon, 15 May 2023 22:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pygZT-0005gJ-O0
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 22:21:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d91e955e-f36e-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 00:21:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 086F060EA2;
 Mon, 15 May 2023 22:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4B9C433D2;
 Mon, 15 May 2023 22:21:31 +0000 (UTC)
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
X-Inumbo-ID: d91e955e-f36e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684189292;
	bh=a4xUeaSWwpxYCw0nSoScWM3lYFDEh6TK0oocKUuFlCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l9KB/gTLnaLw0kD5zDf5t3LH8iS+jFEmgbt3zgDEX0HcadgD8naFbjCkv6mQk+6pD
	 Z9WfCbt29c8ciKjMPWTPihhBNOk/UqIqZRKFqsf9HCS2Z+Tmk5ZuIpyyFdpWNGd/AZ
	 qmUuq8fhoz9i5Shf5RiGZTCAO0Zx1pFPfrr9cjynrztwHxKrxeZFMBGiy4o+bw9U1V
	 xX3RfJYNZ/M5zixpivo6/P8faArGAmzxWxLf019nlNTUyrqTcJexQOeZqXCZlxmlTR
	 YHbjClAc+9TU7atKlBpCCx1lFQCEfBPPOIQBfnngk/NEeHsMl3gjqW1QzhJrMMtoLB
	 oummFdvOKbNIw==
Date: Mon, 15 May 2023 15:21:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/4] automation: enable earlyprintk=xen for both dom0
 and domU in hw tests
In-Reply-To: <7247aca99f5faf35ff1c6efd048a10c08883bc41.1683943670.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2305151443230.4125828@ubuntu-linux-20-04-desktop>
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com> <7247aca99f5faf35ff1c6efd048a10c08883bc41.1683943670.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1248633201-1684187008=:4125828"
Content-ID: <alpine.DEB.2.22.394.2305151521260.4125828@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1248633201-1684187008=:4125828
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305151521261.4125828@ubuntu-linux-20-04-desktop>

On Sat, 13 May 2023, Marek Marczykowski-Górecki wrote:
> Make debugging early boot failures easier based on just CI logs.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qubes-x86-64.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index ae766395d184..bd09451d7d28 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -80,7 +80,7 @@ type = "'${test_variant#pci-}'"
>  name = "domU"
>  kernel = "/boot/vmlinuz"
>  ramdisk = "/boot/initrd-domU"
> -extra = "root=/dev/ram0 console=hvc0"
> +extra = "root=/dev/ram0 console=hvc0 earlyprintk=xen"
>  memory = 512
>  vif = [ ]
>  disk = [ ]
> @@ -186,7 +186,7 @@ CONTROLLER=control@thor.testnet
>  
>  echo "
>  multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G
> -module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
> +module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
>  module2 (http)/gitlab-ci/initrd-dom0
>  " > $TFTP/grub.cfg
>  
> -- 
> git-series 0.9.1
> 
--8323329-1248633201-1684187008=:4125828--


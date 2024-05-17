Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3848C8DE3
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 23:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724477.1129750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s85UA-00032T-TM; Fri, 17 May 2024 21:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724477.1129750; Fri, 17 May 2024 21:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s85UA-000307-Pi; Fri, 17 May 2024 21:51:30 +0000
Received: by outflank-mailman (input) for mailman id 724477;
 Fri, 17 May 2024 21:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s85U9-0002cv-4z
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 21:51:29 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c23de29-1497-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 23:51:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 07AC8CE1B7B;
 Fri, 17 May 2024 21:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32E6C2BD10;
 Fri, 17 May 2024 21:51:20 +0000 (UTC)
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
X-Inumbo-ID: 9c23de29-1497-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715982681;
	bh=nZ60/NuZAh1uGxhlIEgxY5lAvOezDc7KKvn+y8uvDR8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W46sa7WVXc64xl0/LeZOiQ7TBE71x1KrmjTgoP9jq51vDw4uSoEDoTXF3PcIkoBIn
	 aWJd/jIrOA/KlWxIttIVhs79rGhV8zr9ckzLmPFqQcRrhrRfCfR5DujgQK8+7pETtE
	 ISE7/lIhOMRg20wKm7OXHAvJcxuOjpdC5Hl00IquuXlrHvH/QjyEP3ySm94bwhFZor
	 sLzaEMTjNxokZcHYkY/NmlFvVkYH2BcEyrIacFM3YOw+qROixLBryg0J6CHwgrGPiF
	 hU4huJw0jKXPJmtNEKeAC/kWdxEs2tvCbJgLu/oCfqS4dhOblXGxMXHuFH3f74bXs9
	 o8ZjMQfUGTxKQ==
Date: Fri, 17 May 2024 14:51:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 05/12] automation: prevent grub unpacking initramfs
In-Reply-To: <f56b08c94bacb493651f0121660aeaece34f3df7.1715867907.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2405171451040.1052252@ubuntu-linux-20-04-desktop>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <f56b08c94bacb493651f0121660aeaece34f3df7.1715867907.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1651299005-1715982680=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1651299005-1715982680=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Marek Marczykowski-Górecki wrote:
> It fails on larger initramfs (~250MB one), let Linux do it.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qubes-x86-64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index bd620b0d9273..77cb0d45815d 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -189,7 +189,7 @@ CONTROLLER=control@thor.testnet
>  echo "
>  multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts
>  module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
> -module2 (http)/gitlab-ci/initrd-dom0
> +module2 --nounzip (http)/gitlab-ci/initrd-dom0
>  " > $TFTP/grub.cfg
>  
>  cp -f binaries/xen $TFTP/xen
> -- 
> git-series 0.9.1
> 
--8323329-1651299005-1715982680=:1052252--


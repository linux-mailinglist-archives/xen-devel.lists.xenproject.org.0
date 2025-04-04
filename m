Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1043AA7B35E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937539.1338480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0UjM-0004BK-IW; Fri, 04 Apr 2025 00:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937539.1338480; Fri, 04 Apr 2025 00:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0UjM-00048Q-Fr; Fri, 04 Apr 2025 00:16:20 +0000
Received: by outflank-mailman (input) for mailman id 937539;
 Fri, 04 Apr 2025 00:16:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0UjL-00048H-L9
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:16:19 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03bb1613-10ea-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 02:16:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4FA76614B8;
 Fri,  4 Apr 2025 00:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405A7C4CEE3;
 Fri,  4 Apr 2025 00:16:10 +0000 (UTC)
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
X-Inumbo-ID: 03bb1613-10ea-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725771;
	bh=/pk15gfjkF0nSlJqxKS7TjrMWj+J3kdNaAoKzPAc20Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kdK2xHyH5mwpJ1PoFryatavEqwzF7Aswq7NLWtWd3Sn0x9dfFFVSIsNipStsMrCL5
	 rQHlzk5oxAJKZI6cSKGWapcuIo2mB3TJnWqNCp53ZlcGYM+Lq6TbQntCGd2nBd6lvs
	 to8odEr3fh3LSobgRXvzXjKKGIuuN0lkQXFZ0BnOAeIJb2US+DKJNHD/30b2TjdarV
	 lgQWRhdBOPy7r2ih86B8+mUGPZJVNrn1UlQjzxe3rfbrFGSQs9osQkRYwCRPyc7waG
	 RPy2FaW08oeRVZcY/k5z9vM6xxnwPtVTYlnf71It+yB/xTLVLs1ktQrYoUERQWAMpw
	 sHjIo+BYoSiFA==
Date: Thu, 3 Apr 2025 17:16:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 01/11] ci: prevent grub unpacking initramfs
In-Reply-To: <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504031716010.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2141594815-1743725771=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2141594815-1743725771=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Apr 2025, Marek Marczykowski-Górecki wrote:
> It fails on larger initramfs (~250MB one) and sometimes even smaller
> depending on memory size/memory map, let Linux do it.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

I believe this is the default with U-Boot anyway, if I remember right.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/scripts/qubes-x86-64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index f27296445901..8e78b7984e98 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -248,7 +248,7 @@ CONTROLLER=control@thor.testnet
>  echo "
>  multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts
>  module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
> -module2 (http)/gitlab-ci/initrd-dom0
> +module2 --nounzip (http)/gitlab-ci/initrd-dom0
>  " > $TFTP/grub.cfg
>  
>  echo "#!ipxe
> -- 
> git-series 0.9.1
> 
--8323329-2141594815-1743725771=:3529306--


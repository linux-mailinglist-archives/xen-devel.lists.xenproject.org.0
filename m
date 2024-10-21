Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A409A9333
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 00:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823955.1238045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30lO-0000nH-En; Mon, 21 Oct 2024 22:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823955.1238045; Mon, 21 Oct 2024 22:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30lO-0000kt-BZ; Mon, 21 Oct 2024 22:20:34 +0000
Received: by outflank-mailman (input) for mailman id 823955;
 Mon, 21 Oct 2024 22:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pwn9=RR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t30lN-0000kn-1G
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 22:20:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aecc6ca2-8ffa-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 00:20:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 148C45C59D2;
 Mon, 21 Oct 2024 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49834C4CEC3;
 Mon, 21 Oct 2024 22:20:29 +0000 (UTC)
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
X-Inumbo-ID: aecc6ca2-8ffa-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729549230;
	bh=sw5MkKI70xtj4yiOrk0sXVHYlbx0d1lYJImkfXc4C5w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QVVkjsmhlifpGPyZLRjoIIYpDC16S/x8k8XC+8u7c0qALeNP+BpJ+n9ibnf2ZLuqJ
	 pETKO2pH2yUJUrKp/Y3QG6yoThLZpQ2EyAbyfkVXKEbI5B15IUg0IYhIcFXUd0frHd
	 sDUo9S0hD4aChCdpaqkb8h79Ouyb1bkptqM5ARQrfTHGm2kvogl2O37qnalItgFdqW
	 9Fg1xP5qpmXEp+2e9nKvMvB1qY2vzy0OM3VwH0tCxemUx7q5m+pLx7OGa/X2XszL44
	 Zf1MyXuq49kslrRrfL3+7FGh8kBkgkXySXhj6hwGLerJ4fp+KGr0dpE+58/wSp2gkz
	 0xPbIOJrxnJhQ==
Date: Mon, 21 Oct 2024 15:20:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/3] CI: Rework domU_config generation in
 qubes-x86-64.sh
In-Reply-To: <20241021143539.3898995-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410211520180.3833@ubuntu-linux-20-04-desktop>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com> <20241021143539.3898995-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1811041587-1729549229=:3833"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1811041587-1729549229=:3833
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 21 Oct 2024, Andrew Cooper wrote:
> Right now, various blocks rewrite domU_config= as a whole, even though it is
> largely the same.
> 
>  * dom0pvh-hvm does nothing but change the domain type to hvm
>  * *-pci sets the domain type, clears vif=[], appends earlyprintk=xen to the
>    cmdline, and adds some PCI config.
> 
> Refactor this to be domU_type (defaults to pvh), domU_vif (defaults to
> xenbr0), and domU_extra_cfg (defaults to empty) and use these variables to
> build domU_config= once.
> 
> Of note, the default domU_config= now sets cmdline=, and extra= is intended
> for inclusion via domU_extra_cfg as necessary.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> ---
>  automation/scripts/qubes-x86-64.sh | 50 +++++++++++++-----------------
>  1 file changed, 21 insertions(+), 29 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 306304e9219f..4b6311efffa8 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -15,16 +15,9 @@ test_variant=$1
>  extra_xen_opts=
>  wait_and_wakeup=
>  timeout=120
> -domU_config='
> -type = "pvh"
> -name = "domU"
> -kernel = "/boot/vmlinuz"
> -ramdisk = "/boot/initrd-domU"
> -extra = "root=/dev/ram0 console=hvc0"
> -memory = 512
> -vif = [ "bridge=xenbr0", ]
> -disk = [ ]
> -'
> +domU_type="pvh"
> +domU_vif="'bridge=xenbr0',"
> +domU_extra_cfg=
>  
>  case "${test_variant}" in
>      ### test: smoke test & smoke test PVH & smoke test HVM
> @@ -50,16 +43,7 @@ echo \"${passed}\"
>          fi
>  
>          if [ "${test_variant}" = "dom0pvh-hvm" ]; then
> -            domU_config='
> -type = "hvm"
> -name = "domU"
> -kernel = "/boot/vmlinuz"
> -ramdisk = "/boot/initrd-domU"
> -extra = "root=/dev/ram0 console=hvc0"
> -memory = 512
> -vif = [ "bridge=xenbr0", ]
> -disk = [ ]
> -'
> +            domU_type="hvm"
>          fi
>          ;;
>  
> @@ -101,15 +85,11 @@ echo \"${passed}\"
>  
>          passed="pci test passed"
>  
> -        domU_config='
> -type = "'${test_variant#pci-}'"
> -name = "domU"
> -kernel = "/boot/vmlinuz"
> -ramdisk = "/boot/initrd-domU"
> -extra = "root=/dev/ram0 console=hvc0 earlyprintk=xen"
> -memory = 512
> -vif = [ ]
> -disk = [ ]
> +        domU_type="${test_variant#pci-}"
> +        domU_vif=""
> +
> +        domU_extra_config='
> +extra = "earlyprintk=xen"
>  pci = [ "'$PCIDEV',seize=1" ]
>  on_reboot = "destroy"
>  '
> @@ -148,6 +128,18 @@ done
>          ;;
>  esac
>  
> +domU_config="
> +type = '${domU_type}'
> +name = 'domU'
> +kernel = '/boot/vmlinuz'
> +ramdisk = '/boot/initrd-domU'
> +cmdline = 'root=/dev/ram0 console=hvc0'
> +memory = 512
> +vif = [ ${domU_vif} ]
> +disk = [ ]
> +$domU_extra_config
> +"
> +
>  # DomU
>  mkdir -p rootfs
>  cd rootfs
> -- 
> 2.39.5
> 
--8323329-1811041587-1729549229=:3833--


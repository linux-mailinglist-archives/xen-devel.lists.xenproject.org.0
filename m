Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E53A9B155
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 16:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966426.1356639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xnQ-0001ee-4C; Thu, 24 Apr 2025 14:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966426.1356639; Thu, 24 Apr 2025 14:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xnQ-0001cf-1L; Thu, 24 Apr 2025 14:43:24 +0000
Received: by outflank-mailman (input) for mailman id 966426;
 Thu, 24 Apr 2025 14:43:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u7xnO-0001cZ-Op
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 14:43:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7xnN-001hLa-0L;
 Thu, 24 Apr 2025 14:43:21 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7xnM-00HIhV-2D;
 Thu, 24 Apr 2025 14:43:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=fJQp4FSLbVoFKlYSD+kNPjE/uRX1Z+jvkrQFySzn988=; b=P2HVLp2Zz1aFNPE4AF5nZtyPnw
	vT1NSdFnfzbiW3pplqWs4mX9RjZ02U5y0g3YEMDpjfIJo3cbi/m/RO7WwqFYFZPeg91NaQpGdCMsw
	R0zVPC23YV7Lqg6DYji//2rRStChk9+1SJ3l3LW0pG+UBt7g0ZrVgNh78oUy/+AJUQgM=;
Date: Thu, 24 Apr 2025 16:43:18 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v2 4/6] tools: remove qemu-traditional
Message-ID: <aApOBsLtGWQ0qjK0@l14>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408123526.14613-5-jgross@suse.com>

On Tue, Apr 08, 2025 at 02:35:22PM +0200, Juergen Gross wrote:
> diff --git a/INSTALL b/INSTALL
> index 88c1464816..786e3da996 100644
> --- a/INSTALL
> +++ b/INSTALL

There's one "--enable-ioemu-stubdom" left in this file.

> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 724ce40365..82fc1e90f8 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -544,13 +478,6 @@ else
>  install: $(STUBDOMPATH)
>  endif
>  
> -install-ioemu: ioemu-stubdom
> -	$(INSTALL_DIR) "$(DESTDIR)$(LIBEXEC_BIN)"
> -	$(INSTALL_PROG) stubdom-dm "$(DESTDIR)$(LIBEXEC_BIN)"
> -	$(INSTALL_DATA) stubdompath.sh "$(DESTDIR)$(LIBEXEC_BIN)"

If we don't install "stubdompath.sh", we don't need to make it
anymore, that is $(STUBDOMPATH) rule and as prerequisite isn't needed
anymore.

I think "stubdompath.sh" is only used by "stubdom-dm", so we can remove
all mention of "stubdompath.sh" or "$(STUBDOMPATH)", here or in the next
patch.

And with $(STUBDOMPATH) path gone, this will be the user of the make
macro $(buildmakevars2file) and $(BUILD_MAKE_VARS), so I think the could
be both removed as well.

> -	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
> -	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-ioemu/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/ioemu-stubdom.gz"
> -
>  install-grub: pv-grub
>  	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
>  	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-grub/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz"
> diff --git a/tools/Makefile b/tools/Makefile
> index e9e1cda305..6ecf7c0da8 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -136,54 +129,6 @@ endif
> -
> -qemu-traditional-recurse = \
> -	set -e; \
> -		$(buildmakevars2shellvars); \

These are the last mention of the make macro $(buildmakevars2shellvars),
so we can remove it from Config.mk.


Thanks,

-- 
Anthony PERARD


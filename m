Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE1AAFBE1E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 00:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035870.1408266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtys-0008Kz-Bz; Mon, 07 Jul 2025 22:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035870.1408266; Mon, 07 Jul 2025 22:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtys-0008JM-9I; Mon, 07 Jul 2025 22:06:34 +0000
Received: by outflank-mailman (input) for mailman id 1035870;
 Mon, 07 Jul 2025 22:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtyr-0008JG-28
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 22:06:33 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e7dfe4-5b7e-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 00:06:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 00D48462D5;
 Mon,  7 Jul 2025 22:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7D1C4CEE3;
 Mon,  7 Jul 2025 22:06:28 +0000 (UTC)
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
X-Inumbo-ID: a2e7dfe4-5b7e-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751925989;
	bh=p/N83FofFSprGNhsg/s2KLRUt7xWi5SUCcZZUewH0Ro=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TqSXgvZ999gRza1Of9brJoFMPBfZRV8niqLObOFISbK35z7yf5oM21fMLAaLwK4YR
	 oZd+jG5dyy8CaD+C2WzMHEQ1yS18WIHvkmA0tOBdYwYJTeFjNzF2S+BFeQYwQOkbJe
	 AFkROhfd402KZBgvhv5IkCmfsuUBwMG9ZRWiz7TB9weVihug0K9SbG29CVguDVsZto
	 W2Wcz2gsjcPgzfYchr2YtzyL7MAe8GscTWLq1NmPwSdLX+oogGlOwAkonL2DtsWFYC
	 mFKLdOlfQCKOzTfYagTg8bmUv/hPtpYNkM3bzvPYDdUk2aXE9ivLgGTgtUsd8Fsr3j
	 gpNC6govtExcA==
Date: Mon, 7 Jul 2025 15:06:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykola Kvach <xakep.amatop@gmail.com>
cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] SUPPORT.md: Document guest PSCI support
In-Reply-To: <a20eef8513bc15e9fd87e14420eada7e7eb5d859.1751393256.git.mykola_kvach@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507071506210.605088@ubuntu-linux-20-04-desktop>
References: <a20eef8513bc15e9fd87e14420eada7e7eb5d859.1751393256.git.mykola_kvach@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Jul 2025, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Add a new entry under "Virtual Hardware, Hypervisor" for guest PSCI
> support on ARM. This documents support for all mandatory functions of
> PSCI 1.1, and separately lists the supported optional functions.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> Addressed review comments from:
> https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/401d3745a295812fef14a22b0c2a3c6017d588c1.1751020456.git.mykola._5Fkvach@epam.com/#f891958a-35cf-4c6d-b1b9-51d34559f221@xen.org
> ---
>  SUPPORT.md | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index f0b5718e84..6a82a92189 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -956,6 +956,15 @@ by hwdom. Some platforms use SCMI for access to system-level resources.
>  
>      Status: Supported
>  
> +### ARM: Guest PSCI support
> +
> +Emulated PSCI interface exposed to guests. We support all mandatory
> +functions of PSCI 1.1. See below for the list of optional PSCI call
> +implemented and their status.
> +
> +   Status, Mandatory: Supported
> +   Status, MIGRATE_INFO_TYPE: Supported
> +
>  ## Virtual Hardware, QEMU
>  
>  This section describes supported devices available in HVM mode using a
> -- 
> 2.48.1
> 


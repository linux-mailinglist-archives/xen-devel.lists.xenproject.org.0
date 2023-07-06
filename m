Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1385774A6A0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 00:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560092.875717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHXFZ-0003s2-A2; Thu, 06 Jul 2023 22:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560092.875717; Thu, 06 Jul 2023 22:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHXFZ-0003pp-7E; Thu, 06 Jul 2023 22:14:57 +0000
Received: by outflank-mailman (input) for mailman id 560092;
 Thu, 06 Jul 2023 22:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JNo=CY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHXFY-0003pj-DN
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 22:14:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88478d98-1c4a-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 00:14:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06C1961208;
 Thu,  6 Jul 2023 22:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F12FC433C9;
 Thu,  6 Jul 2023 22:14:51 +0000 (UTC)
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
X-Inumbo-ID: 88478d98-1c4a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688681692;
	bh=khrFNB2+FuKCOJkw8BykPudE62eIod6DDUux4sMwCMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N1Jyeft+3FaAIwz+vubqhBymAPsH7vnGr5GzgjtnSvvbF6qkpvCzTeeQW5hm1ApXg
	 BFEqsgIVM1ZHEbdZj7UtKaCPDgu7JG+KP/X3dahYWUno8kV7Y96EDVLGADS4IjzxHc
	 Z7dtcj794UV+M7qf0cJIHVINZz1LgS9Vp3AW765iQtIC58AC175dpw6dIK+d+ikSKi
	 zpUdEWs8EWtqrJqD15KaDNkpziTUuo9vnz6k/IxTeffoXnAaOptAHhWvvL99Y52EKD
	 k3d0H6A+AYFjSIeGvuwdomh4ZbQVgguH6j94MW+2SdDwrpDVMC00sWkkNpINTxo1zU
	 MS7enR6qpXhYQ==
Date: Thu, 6 Jul 2023 15:14:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [XEN PATCH v2 06/13] xen/efi: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <45dad847-7d0e-c2e5-62a2-f640d9879676@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307061514070.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <9a791b84be74d7ca575eb94e070aae7294d95bbf.1688559115.git.gianluca.luparini@bugseng.com> <alpine.DEB.2.22.394.2307051635170.761183@ubuntu-linux-20-04-desktop>
 <45dad847-7d0e-c2e5-62a2-f640d9879676@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Jul 2023, Jan Beulich wrote:
> On 06.07.2023 01:37, Stefano Stabellini wrote:
> > On Wed, 5 Jul 2023, Simone Ballarin wrote:
> >> --- a/xen/common/efi/boot.c
> >> +++ b/xen/common/efi/boot.c
> >> @@ -34,13 +34,13 @@
> >>  #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
> >>  
> >>  #define SMBIOS3_TABLE_GUID \
> >> -  { 0xf2fd1544, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
> >> +  { 0xf2fd1544U, 0x9794U, 0x4a2cU, {0x99U, 0x2eU, 0xe5U, 0xbbU, 0xcfU, 0x20U, 0xe3U, 0x94U} }
> >>  #define SHIM_LOCK_PROTOCOL_GUID \
> >> -  { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
> >> +  { 0x605dab50U, 0xe046U, 0x4300U, {0xabU, 0xb6U, 0x3dU, 0xd8U, 0x10U, 0xddU, 0x8bU, 0x23U} }
> >>  #define APPLE_PROPERTIES_PROTOCOL_GUID \
> >> -  { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
> >> +  { 0x91bd12feU, 0xf6c3U, 0x44fbU, { 0xa5U, 0xb7U, 0x51U, 0x22U, 0xabU, 0x30U, 0x3aU, 0xe0U} }
> >>  #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> >> -  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
> >> +  { 0xb122a263U, 0x3661U, 0x4f68U, {0x99U, 0x29U, 0x78U, 0xf8U, 0xb0U, 0xd6U, 0x21U, 0x80U} }
> >>  #define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1
> > 
> > To be honest in these case I don't know if this is better or if it is
> > better to add U only to the first numbers (0xf2fd1544U, 0x605dab50U,
> > 0x91bd12feU, 0xb122a263U).
> 
> I'd prefer the latter, but I wonder whether that's in the spirit of Misra.

My understanding is that MISRA only requests U to be added where
actually needed. Everything else is up to us and our desire (or not) for
consistency.


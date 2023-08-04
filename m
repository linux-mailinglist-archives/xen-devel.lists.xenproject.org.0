Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31B770A08
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 22:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577327.904382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1jK-0002xI-3g; Fri, 04 Aug 2023 20:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577327.904382; Fri, 04 Aug 2023 20:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1jK-0002uO-0g; Fri, 04 Aug 2023 20:49:02 +0000
Received: by outflank-mailman (input) for mailman id 577327;
 Fri, 04 Aug 2023 20:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS1jI-0002uG-FY
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 20:49:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5519c98b-3308-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 22:48:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C19D620AE;
 Fri,  4 Aug 2023 20:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ED9C433C7;
 Fri,  4 Aug 2023 20:48:54 +0000 (UTC)
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
X-Inumbo-ID: 5519c98b-3308-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691182136;
	bh=71knx/FwEiKGHrHIwzyEgucFHxOXHAsUN2J5FL1SK9o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hqLzG/NyAmEHLhQE2jNHQjUnyRYbbmYklA0S44j/laRGBJXGwcAMjGfretYhQCER1
	 CF+gXzLGmHH2AgiiS6/uocztMtQxfmH31fl+4DrAMiRm85wn4pMqfwo0w/RCEaclWb
	 LZg0L27YSlqiuQDCyFp0DQ/dF6RanQt3ilvcTNJenpOMpM6UPwffLBFuzTubo8BinM
	 pt/KGVcbnJpcCnKpD+TLVyA0/8KskzH+JHbjE3gjbtJyyjZITD+vVE/vqNqZGFyQCd
	 vzXHebBcDUgpuGsmaHFR053sIM0TKuoI8j901HdfrVbdxo6910ccNU/npzj0EiTK0F
	 9jT0mn7PF26EQ==
Date: Fri, 4 Aug 2023 13:48:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 4/4] x86/setup: address MISRA C:2012 Rule 5.3
In-Reply-To: <484a88bb35cdb6e5ec036d40fb2b4e20678fd975.1691135862.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041348460.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com> <484a88bb35cdb6e5ec036d40fb2b4e20678fd975.1691135862.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> The parameters renamed in the function declaration caused shadowing
> with the homonymous variable in 'xen/common/efi/boot.c'. Renaming
> them also addresses Rule 8.3:
> "All declarations of an object or function shall use the same names
> and type qualifiers".
> 
> The local variable 'mask' is removed because it shadows the homonymous
> variable defined in an outer scope, with no change to the semantics.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Same here


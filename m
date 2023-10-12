Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA97C7A9A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616213.958065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5Qr-0006uu-4g; Thu, 12 Oct 2023 23:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616213.958065; Thu, 12 Oct 2023 23:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5Qr-0006sB-1r; Thu, 12 Oct 2023 23:49:33 +0000
Received: by outflank-mailman (input) for mailman id 616213;
 Thu, 12 Oct 2023 23:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr5Qp-0006s5-59
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:49:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa903304-6959-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 01:49:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 799A061F8F;
 Thu, 12 Oct 2023 23:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4650C433C7;
 Thu, 12 Oct 2023 23:49:24 +0000 (UTC)
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
X-Inumbo-ID: fa903304-6959-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697154566;
	bh=a/3QuTQO4MPlb3nMrHAT/lW56mp/adUTxrArKbcL3No=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mCvdVTizl6gz8icTzOD5R2aRagQWZoTaANzdpsfy8XCaQpDhmjVLU497bWLB/f6w6
	 K0spFHJlGc3xEHq//X+aquV+ra59b5H8GMPbjESAWbMfF3nvjsA6UpcIwQBOtlmMGI
	 i9t/LS7UM1fZMn48gcRHdxPxFb5tLMjUL77CWwtWkNYBINnpVkx4BVKmWOYMM3VGYU
	 xCqvgnie8iyBWVOEbcJAcJEbdiuRew01AH+bRab/3LN45owObbyaxrBHZxayHoiObK
	 /LDQkofDcBkiEVUCdgPuJmykczdLohwaAqq8Ab6qVejlqr7FctOm/v3lPbjQXu7NYL
	 2Q4Av4qgo6SiQ==
Date: Thu, 12 Oct 2023 16:49:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 1/2] xen/vmap: use LOWEST_BIT to wrap a
 violation of Rule 10.1
In-Reply-To: <29c1c01f54d6ac9fccc86b72ee96cc66672ac57a.1697125949.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121649160.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1697125949.git.nicola.vetrini@bugseng.com> <29c1c01f54d6ac9fccc86b72ee96cc66672ac57a.1697125949.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Oct 2023, Nicola Vetrini wrote:
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


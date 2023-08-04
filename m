Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5F770A02
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 22:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577323.904372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1hw-0002Oe-P6; Fri, 04 Aug 2023 20:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577323.904372; Fri, 04 Aug 2023 20:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1hw-0002Lc-ML; Fri, 04 Aug 2023 20:47:36 +0000
Received: by outflank-mailman (input) for mailman id 577323;
 Fri, 04 Aug 2023 20:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS1hv-0002LW-BK
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 20:47:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22730670-3308-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 22:47:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E51461CB6;
 Fri,  4 Aug 2023 20:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EE9C433C7;
 Fri,  4 Aug 2023 20:47:29 +0000 (UTC)
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
X-Inumbo-ID: 22730670-3308-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691182051;
	bh=g/VgDHj32LXpUfFXYAnLTMFnaw6k10DQKllvZH82HKg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GQhAGR0vyfLBsKuJjJqiJzE4iPGxyreG0iVIW/FPZtqnCPrRYDk6EeLxNbgjdneOx
	 KxvHnWMXbGhsYbgIEjLviMLlE+3ZoLp3jgjMPPL2qqpQISL9lwMiub6JY4RWmOsccB
	 EKbYh7ckQRSheK/5C1Io4OnA9LSsdP3MQ8lLCbQitzQAkZhDn3OR1K6+QRQb/XsD8x
	 p3mddX302ZjyW7arF3BR3dsoU6zDFiSXLDCQNpnY3IxJn4iFaKxnRI9qeqA8tjsljG
	 CboH03lvsYZ4keXLpSkXZKccprVOitugFE5AZDkNoLlJX2iG+Zta5Co19a5Hm4CU8V
	 snm5yxvtCufdQ==
Date: Fri, 4 Aug 2023 13:47:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v2 3/4] x86/irq: rename variable to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <987ebd142ebd69ed062d74f7eb69c23759c51636.1691135862.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041346560.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com> <987ebd142ebd69ed062d74f7eb69c23759c51636.1691135862.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> The extern variable 'irq_desc' defined in 'irq.h' is shadowed by
> local variables in the changed file. To avoid this, the variable is
> renamed to 'irq_description'.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

You missed me reviewed tag from the previous version:
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Also Jan, sorry I am already losing my new habit of trimming my replies
:-)


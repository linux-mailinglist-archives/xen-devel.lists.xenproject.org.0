Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE8770AE3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 23:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577352.904442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2Jz-0001rl-8b; Fri, 04 Aug 2023 21:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577352.904442; Fri, 04 Aug 2023 21:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2Jz-0001oS-5L; Fri, 04 Aug 2023 21:26:55 +0000
Received: by outflank-mailman (input) for mailman id 577352;
 Fri, 04 Aug 2023 21:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS2Jx-0001oM-3w
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 21:26:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa6038d-330d-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 23:26:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F64662117;
 Fri,  4 Aug 2023 21:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8708BC433C8;
 Fri,  4 Aug 2023 21:26:47 +0000 (UTC)
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
X-Inumbo-ID: 9fa6038d-330d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691184408;
	bh=nFwmOqD17s+/h0puhgViKWCxH+gDjmT1UKWq/VvIl7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L20NbbGhz7rdTNiTW7Ngt+zhACtWMMu4w+pgTg3qKNXsYqanWt7X/mE4fLAcVK3pE
	 19ruBu+zNaKhCSz0CCVBIQH3I1I2ay1Ons4GG4mgkbn7ZCDNThIFh34PMBOQGHSYUz
	 HFhLAFj4mxFKH4n++Qf9bEVU20SbrA/UE5Dguo1tHsDyCTGL4S4QZURtFn1CG3rUgK
	 SuWU3GT14qnUHimgn2oWJQRiU/V67udpcRKxdFSwLQ4y4Bi7dusTDFL32XsXA4ULY5
	 /heeCE7a0zNoMCd1PC0smssWVgNwNlgqqECwkwWIv12GwBs/sEN9cV1xX2Uo0J5Xdy
	 umfg32m6MvW5Q==
Date: Fri, 4 Aug 2023 14:26:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 5/6] x86/xstate: address MISRA C:2012 Rule 5.3
In-Reply-To: <1ea70e5f8293fdca2bb69ec75f532722136e52a5.1691162261.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041426390.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com> <1ea70e5f8293fdca2bb69ec75f532722136e52a5.1691162261.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> Rename the local variables to avoid clashing with function 'xstate'
> defined below, but declared in the corresponding header file.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


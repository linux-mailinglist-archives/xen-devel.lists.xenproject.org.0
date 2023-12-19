Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3DE817F49
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656438.1024576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOxq-0003Xr-92; Tue, 19 Dec 2023 01:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656438.1024576; Tue, 19 Dec 2023 01:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOxq-0003WF-4x; Tue, 19 Dec 2023 01:32:06 +0000
Received: by outflank-mailman (input) for mailman id 656438;
 Tue, 19 Dec 2023 01:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFOxp-0003Vo-0q
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:32:05 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 686e36fa-9e0e-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 02:32:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 902EFCE14E9;
 Tue, 19 Dec 2023 01:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BAEC433C7;
 Tue, 19 Dec 2023 01:31:55 +0000 (UTC)
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
X-Inumbo-ID: 686e36fa-9e0e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949516;
	bh=4Bn7ju/YLZbPQDLb71q6Dam14BGYJRM+M61ZFuOR57w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hFxnXKWo4Ptg0cT9Oo6mDwrNtyC7/RErpPJUzbSCRxb71IB2gUp5GT+srpnLO+i62
	 yIYU97tRHvF45SHKnicaQljKKJlF03p7GnnehDDCI2vowjJOs6fibCNFDbWHxldcvW
	 JVaz1D4Up2A7xSRlATtRoyRXCNStGyq9aZkyR3xXfP6w0OCDFW9Jmr37pUYwjvlBHm
	 vdpiLXNqZJFdO53faCE7299JdkdUXCYsFrY72cIGwyutbwi/a+5f8UPgzLmY7TraKm
	 ykKPmUKmrCOKR7kPN357eQC01ySTEeLdY2tVn2VGhS3d1PKoIOedY7U3kRcDN+4nD+
	 VyV2ItlXfm40w==
Date: Mon, 18 Dec 2023 17:31:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 1/7] xen/shutdown: address MISRA C:2012 Rule 2.1
In-Reply-To: <22881ed8e7e28d66a730deb8812b6a4b7becc750.1702891792.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181731470.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com> <22881ed8e7e28d66a730deb8812b6a4b7becc750.1702891792.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Nicola Vetrini wrote:
> Given that 'hwdom_shutdown' is a noreturn function, unreachable
> breaks can be eliminated to resolve violations of Rule 2.1.
> 
> The rename s/maybe_reboot/reboot_or_halt/ is done to clarify
> that the function is noreturn.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


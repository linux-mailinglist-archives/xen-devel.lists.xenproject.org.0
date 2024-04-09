Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E289CF32
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 02:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702087.1096879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtz4C-0000GV-RA; Tue, 09 Apr 2024 00:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702087.1096879; Tue, 09 Apr 2024 00:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtz4C-0000Dw-OV; Tue, 09 Apr 2024 00:10:24 +0000
Received: by outflank-mailman (input) for mailman id 702087;
 Tue, 09 Apr 2024 00:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rtz4B-0000Dp-Dl
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 00:10:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e0e281e-f605-11ee-914f-f14010f3f246;
 Tue, 09 Apr 2024 02:10:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F861614BA;
 Tue,  9 Apr 2024 00:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E1FC433C7;
 Tue,  9 Apr 2024 00:10:19 +0000 (UTC)
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
X-Inumbo-ID: 8e0e281e-f605-11ee-914f-f14010f3f246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712621420;
	bh=vx2PUNwUOte/W0M63t8WMxYRCSF5PXaJ1/Gz6Kd8Vjg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UIsYugM4kOVvSSzGHAwcFa04QjyhnwKDsJNllsXgavSoyf4XoM+BFo3n6LvOhSuMq
	 d+I1cAK0z8NWPB6Fa4FVSbdbym78jH5KiSU8p3DRWvzAhSEdoknJrc3gTwm+eU2xGD
	 UnNTkxHCLyjO6WslLRLzcm1uDlfl7LQzmDICG4za/aEEckpWv3LEidDSPjWrySTkWP
	 lRLw3g+wyQ05h9uIbF2QW0bopJZcltOPuj0wefSuPW/thyWMZt6qTfpAbXt63osoo+
	 AQ0DJUH9HimB+j/IECc9GHZ7VtOciJ4qAWD+rH3zECDmtjyg2OG/M2hheIVy/iBm7y
	 +hBbQCHMc8cLg==
Date: Mon, 8 Apr 2024 17:10:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/9] x86/vlapic: tidy switch statement and address
 MISRA violation
In-Reply-To: <36e84201-b31f-4204-8cff-ed50a01a47ed@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404081707570.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com> <81ecc35d04456771b1e48cb25155b0151e2225b8.1712305581.git.nicola.vetrini@bugseng.com> <36e84201-b31f-4204-8cff-ed50a01a47ed@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Apr 2024, Jan Beulich wrote:
> On 05.04.2024 11:14, Nicola Vetrini wrote:
> > Remove unneded blank lines between switch clauses.
> 
> "Unneeded" based on what? We're carefully trying to improve readability of
> large switch() statements by adding such blank lines (at least) between non-
> fall-through case blocks, and you go and remove them?

To be fair it is almost impossible to figure out the correct coding
style in Xen by looking at existing code and/or CODING_STYLE.

Except for the blank lines, the change itself looks correct to me

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


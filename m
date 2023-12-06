Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED8B80658B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 04:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648812.1012816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiR6-0007GW-EK; Wed, 06 Dec 2023 03:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648812.1012816; Wed, 06 Dec 2023 03:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiR6-0007De-An; Wed, 06 Dec 2023 03:18:56 +0000
Received: by outflank-mailman (input) for mailman id 648812;
 Wed, 06 Dec 2023 03:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAiR4-0007DY-KB
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 03:18:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e7df044-93e6-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 04:18:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 79C68B81D8D;
 Wed,  6 Dec 2023 03:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23A9C433C7;
 Wed,  6 Dec 2023 03:18:50 +0000 (UTC)
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
X-Inumbo-ID: 2e7df044-93e6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701832731;
	bh=UBPiP2u0feUSwrmJEUtM35X+9VqcLXNJYxUsYd8kHz0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NazJzDBCCxP4P3pQz6rnBMoZH1VGWTwZ3o8JRtJwiSfpEw6SWkEuTftiWaLJAibai
	 Q5zXIrgrjtn1K/HKSDbwF0OcN5DNb1bjGO2ErKQqnFeDQzm5GN7Xt/v7mKe/pOSv/U
	 ypSSb81RGHifD8aMOJ4S1KygRVFUCmvHTK/RpN7irk/eH+Xo1xWPDo8qW3ttOvZzQT
	 zgHT/pkml2sVwnaXK5O1WG78+Nvs06iqqBh5ZBr9/U7D1P/KBPoBBBWrtMDhcdB3SG
	 xfbE80Xw8mVveKhyXGn+qohKNpmYxh1HFECanSvp4dOSn4HNHvMpJIbtyS3KlVtdw0
	 Wokc/himINAXg==
Date: Tue, 5 Dec 2023 19:18:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 5/6] x86/mce: address violations of MISRA C:2012 Rule
 8.2
In-Reply-To: <16a4587adaac7b116026c0df4addd254d4a33715.1701764980.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312051918430.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701764980.git.federico.serafini@bugseng.com> <16a4587adaac7b116026c0df4addd254d4a33715.1701764980.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



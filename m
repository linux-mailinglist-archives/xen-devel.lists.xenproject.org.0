Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD87915B52
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 03:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747111.1154433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuXI-0000Ct-Ho; Tue, 25 Jun 2024 00:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747111.1154433; Tue, 25 Jun 2024 00:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuXI-0000Af-F1; Tue, 25 Jun 2024 00:59:52 +0000
Received: by outflank-mailman (input) for mailman id 747111;
 Tue, 25 Jun 2024 00:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuXG-0007Jk-J0
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:59:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38bc76ae-328e-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:59:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCA3961152;
 Tue, 25 Jun 2024 00:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7615C2BBFC;
 Tue, 25 Jun 2024 00:59:47 +0000 (UTC)
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
X-Inumbo-ID: 38bc76ae-328e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719277188;
	bh=QaYCwnkhJcl4jr+s3WOhsEcSX4O2MueD0AfkkteZJI8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FLxOy02tUtO/r6A4o9DWiOoG/0qZFyBieMKOVZtGX6ClM2dsCai+TVhvKN2//SE0T
	 YNOcwnW9PbSWwqEgRosCMlt8KHvMtI+ZbGet0Y5ZldzcYQvCLpbaD/Mp6bQmYwMhjb
	 E1stX8BRjiXcmP6SNXbBK1rjG0zxI1uMuI596kwZxhq6cR7zbrkvzciMtFommDfEtv
	 j6jzsBd0M7Ur/fLirCuOaa1dp4dNaexfpxgTKfIntwl/73c8JGg2U0QSHCW4/hWNB5
	 vTxiIR5t8RRx/CEloKsmLuhMYR6Zqt8wa6IhzWOyZwhK0bgSREtA9vOOIP7zmr5ytG
	 KiBg+UrJaY3+g==
Date: Mon, 24 Jun 2024 17:59:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 11/13] x86/pmtimer: address a violation of MISRA
 C Rule 16.3
In-Reply-To: <fea205262d4f7b337b804a013d0f1c411a721b46.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241759380.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <fea205262d4f7b337b804a013d0f1c411a721b46.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add missing break statement to address a violation of MISRA C Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



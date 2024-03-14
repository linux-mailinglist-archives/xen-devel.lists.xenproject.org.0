Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0A87C5B4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 00:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693572.1081871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rku5W-00035f-EB; Thu, 14 Mar 2024 23:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693572.1081871; Thu, 14 Mar 2024 23:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rku5W-00033C-Bb; Thu, 14 Mar 2024 23:02:14 +0000
Received: by outflank-mailman (input) for mailman id 693572;
 Thu, 14 Mar 2024 23:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rku5V-000334-0T
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 23:02:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e28f46d8-e256-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 00:02:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7D23DCE1DC3;
 Thu, 14 Mar 2024 23:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0611C433C7;
 Thu, 14 Mar 2024 23:02:04 +0000 (UTC)
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
X-Inumbo-ID: e28f46d8-e256-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710457325;
	bh=IEDZIjOiDUXTJ1Fjsb9V8MUfaaWeGYJ907oOVLUHUnA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=od+D6HnmAKhG+HE0th8QcmNvBa7UPnQ1AqSUXTNSbw2YmC2nSBO5x4abI4QqMStnx
	 pNerSYwdWlArfn/W4xTbhFF2uyVvpno9HAhrhvLubXCy2wWZF5jS1w4BJ/aaseyiGC
	 4c+CoCcrFkuh8aKylQgxmRqmgNBWX2XJ+CsbBbOeY62iy8c/Wb4ol50sa8JPT6vvV2
	 B7onDSL4wEfDZtGhVpz9pf+QduRGwDE10WHnQMYkt4+RwlKt45ymxYPKhXopGrzdwH
	 MJTgCh05vph9Z0m+n/NGbZRJlyPtj4h2duhxZAMvrNJK31s+X9IAX3fLuRHiCm9ATz
	 yi7KdBfv1fTsw==
Date: Thu, 14 Mar 2024 16:02:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: Re: [XEN PATCH v3 06/16] x86/EFI: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <d12db1f6cca220ed83f7d7502dfca4bdc4127786.1710145041.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403141601560.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <d12db1f6cca220ed83f7d7502dfca4bdc4127786.1710145041.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Mar 2024, Simone Ballarin wrote:
> Add inclusion guard to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


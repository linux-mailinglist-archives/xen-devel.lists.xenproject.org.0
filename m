Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2954806586
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 04:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648809.1012806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiPG-0006By-3u; Wed, 06 Dec 2023 03:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648809.1012806; Wed, 06 Dec 2023 03:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiPG-00069d-0Y; Wed, 06 Dec 2023 03:17:02 +0000
Received: by outflank-mailman (input) for mailman id 648809;
 Wed, 06 Dec 2023 03:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAiPE-00067y-Lg
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 03:17:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9453d87-93e5-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 04:16:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C89061A5C;
 Wed,  6 Dec 2023 03:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F160C433C8;
 Wed,  6 Dec 2023 03:16:54 +0000 (UTC)
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
X-Inumbo-ID: e9453d87-93e5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701832615;
	bh=UBPiP2u0feUSwrmJEUtM35X+9VqcLXNJYxUsYd8kHz0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q7KVWSgaMiw7BhZlzdP3msfyN4+PdBGYOkA2Zn+2PbNeoBf0H3ym2Hh1UMygXBxmU
	 ERMdzDPdACtJXVnYUxoyi1Isd0SaIJc47dUhWNUSqCb+xGx1kfA5UrCaY4WXqk7kRH
	 7C2hTxvpZLWE8zi7ZLfBUE0vhSwSGABVPM9fcws+PDroBLerx3lCAiKDTyfjMzFo/F
	 MjdzUqDRL4HsbHW5NwAy9ycPLcmGuZmOjDkEuoeoUgCnDldGaxRSOSBnDM2w1mUgGo
	 xb6S96ANojiN0Zjq0y4z8zDfVzIwXXEn3GvyihBhEzj6KTzxiLl5WKh9fi01CJaDIg
	 EzUCTa6iUzkXA==
Date: Tue, 5 Dec 2023 19:16:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/6] x86/page: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <626f8040804d8f7dbdcde57725ac4eab895f295c.1701764980.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312051916470.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701764980.git.federico.serafini@bugseng.com> <626f8040804d8f7dbdcde57725ac4eab895f295c.1701764980.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


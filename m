Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986227F52F8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639211.996246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vN7-0006Nk-Nf; Wed, 22 Nov 2023 22:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639211.996246; Wed, 22 Nov 2023 22:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vN7-0006M5-JO; Wed, 22 Nov 2023 22:07:01 +0000
Received: by outflank-mailman (input) for mailman id 639211;
 Wed, 22 Nov 2023 22:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5vN6-0006KU-8j
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:07:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73e781e3-8983-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:06:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB03561F7E;
 Wed, 22 Nov 2023 22:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF620C433C8;
 Wed, 22 Nov 2023 22:06:55 +0000 (UTC)
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
X-Inumbo-ID: 73e781e3-8983-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700690816;
	bh=367D35biwRM29XuEyL+78D6/Jg8pPF3hKdRgUO5o3w0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=irF43FRk1lgi2I0l2orWwdX6GOKRG5p2qdylwAQwq/Kyg2SjLpzfHdms+iy7ewnyT
	 UMn7G6b42G+6Civ3SpodXlCOZ4JVi1CWdR6ZdISQYpUwdTE+0zOtpmXEcCk+q4DCl3
	 TUN1aD+XZrAs3F9flgZCfWVhDHgsCry6829eBoogEgxccVLCj3BMeijUTwl+BDC06J
	 rJ18doqsMN5gYHON8yroHqzWeP7fpaUR8KkyE/Ql7RQq6dH3gcUvwfwBnuSmJUaAbi
	 Jkj1D8Wr7UNIgcC6vge5CvlJ7p/Yv9c5ePuZGVf+aEyqp4AENiyQvxqflUMsy4tqkm
	 QHzyJvmZIinFQ==
Date: Wed, 22 Nov 2023 14:06:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] x86/apic: Drop the APIC_MSR_BASE constant
In-Reply-To: <20231122142733.1818331-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311221406480.2053963@ubuntu-linux-20-04-desktop>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com> <20231122142733.1818331-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, Andrew Cooper wrote:
> Use MSR_X2APIC_FIRST from msr-index.h instead.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


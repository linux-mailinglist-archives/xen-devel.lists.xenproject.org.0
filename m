Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE4A3349D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 02:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886985.1296560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiNzK-0002Bv-RJ; Thu, 13 Feb 2025 01:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886985.1296560; Thu, 13 Feb 2025 01:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiNzK-00029e-Of; Thu, 13 Feb 2025 01:25:58 +0000
Received: by outflank-mailman (input) for mailman id 886985;
 Thu, 13 Feb 2025 01:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiNzJ-00029Y-M4
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 01:25:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76fe1c19-e9a9-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 02:25:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 891605C634D;
 Thu, 13 Feb 2025 01:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B7DC4CEDF;
 Thu, 13 Feb 2025 01:25:51 +0000 (UTC)
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
X-Inumbo-ID: 76fe1c19-e9a9-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739409951;
	bh=GeCeotpOAjnCJizZpOps2jIFM6vLzfj+FV4o9Gy/gbo=;
	h=Date:From:To:cc:Subject:From;
	b=oeDk1jO166pkrU8dgeRLYUpHx2hK4cjoZoz5Yn8zdTr0bZXXamO9wajJFdDQYiVP5
	 +uspYhVajGmbXhgc/e6n2yrdnVE/dWqIfhC1TehySZoy/325q146F7R49wlU2DbtFl
	 3yK9V4eD0yE+HD0E97PVL8WO+UX6YeZXvTz1k/7mkxLMbdWyGVmYeiLAeIcaHnpmGW
	 YQCkBvn0cvNkDdpOfmgzwnxzR21v1IM0XhQjULZmRPmYd9rg5/ZvSLHR9DtuBEmPYM
	 La6WSx7ufDvUH6en/HPjWGP+1PBMURrl00x0hAxRM+UOSHyEjNH9BOw6cCz+lMICNs
	 ESAZbB5qKpzUw==
Date: Wed, 12 Feb 2025 17:25:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: struct mctelem_cookie missing definition
Message-ID: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I am looking through the few remaining MISRA violations that we have
left.  One of them is R11.2:

https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/9118578464/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}

Specifically, mctelem_cookie_t is a pointer to incomplete type and
therefore COOKIE2MCTE triggers a "conversion between a pointer to an
incomplete type and any other type".

mctelem_cookie_t is defined as:

typedef struct mctelem_cookie *mctelem_cookie_t;

I am looking through the code and I genuinely cannot find the definition
of struct mctelem_cookie.

If mctelem_cookie_t is only used as a pointer, wouldn't it make more
sense to do:

typedef struct mctelem_ent *mctelem_cookie_t;

?

What am I missing?

Cheers,

Stefano


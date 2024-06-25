Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68519915B4C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747106.1154424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuWl-000860-BY; Tue, 25 Jun 2024 00:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747106.1154424; Tue, 25 Jun 2024 00:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuWl-00084U-7r; Tue, 25 Jun 2024 00:59:19 +0000
Received: by outflank-mailman (input) for mailman id 747106;
 Tue, 25 Jun 2024 00:59:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuWj-00084B-91
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:59:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 242fd945-328e-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 02:59:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47CD261126;
 Tue, 25 Jun 2024 00:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B364C2BBFC;
 Tue, 25 Jun 2024 00:59:13 +0000 (UTC)
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
X-Inumbo-ID: 242fd945-328e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719277154;
	bh=JIkZmOtnXJl3xP//D5O8yllNtM9t8S6vrCiSwOvt3As=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZUc+8r6Ov99odeLg26xaLQMAuewesXCquZ/PjTIRZKWxvVnkyjFjKIVfsUpmlFleP
	 cSYswuw0ZMPdJb5yAnxYfhYJ3QYTcjHgiaK2NzNZYjYudlfEzjhxW5AKHW8/pNJubU
	 mTb1JopiOSzqkNd8M57i53FE6NEvfAgckAzhwUDsSCY0JfXXd8PqiAxwQsnwTnLBp+
	 G4KknX0AyuyP57KB2tODhYjFmWVbQfEcyssPB8ZKOBHJDl13xtuPm9LdZd/UKKYtZH
	 1S+3A2Mn1yV8ruoG54rkqmKEDSHYAt30RRb1F6G7HSyfonQzqFZWLcb0pu5zr37/WX
	 p7QD/t74ZPq+Q==
Date: Mon, 24 Jun 2024 17:59:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 10/13] x86/mpparse: address a violation of MISRA
 C Rule 16.3
In-Reply-To: <e421b80a9b016d286b9a5b8329b0bcb33584f06e.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241759040.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <e421b80a9b016d286b9a5b8329b0bcb33584f06e.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add a missing break statement to address a violation of
> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



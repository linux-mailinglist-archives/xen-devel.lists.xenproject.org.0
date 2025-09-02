Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83673B40FE1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 00:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107584.1457960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utZIk-0007xW-8I; Tue, 02 Sep 2025 22:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107584.1457960; Tue, 02 Sep 2025 22:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utZIk-0007vI-52; Tue, 02 Sep 2025 22:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1107584;
 Tue, 02 Sep 2025 22:16:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozfM=3N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1utZIi-0007vC-Ld
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 22:16:28 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77231883-884a-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 00:16:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB38943690;
 Tue,  2 Sep 2025 22:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C33BC4CEED;
 Tue,  2 Sep 2025 22:16:22 +0000 (UTC)
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
X-Inumbo-ID: 77231883-884a-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756851384;
	bh=rTTa0P43RBx62hRKI6ThhogWr2yjUp043GcKRQp5yCs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d3On7y8soCGF0cjuogyTcW89kVvCWlsihCjUWq42bnAKeO0iMQxqz0Y3V/pri+XRn
	 E47bTQwrJNXTJAXZWsI0rkOXuQxG3MFoBUypY6EiYISVLSDqTkNFIh2VM1iFbvsbmC
	 JS88orw3w+TrK+ExPDFZOEK3TxZ0qNnPDjLuhuNhytRK0VJR5ZjpTO+RYgPC7bxxnY
	 hr93wOEeIIJrloytj7wdzOX13p157Gm1XTRhqW6BwCUchHn52YqSwRgup1tlEvAu2J
	 AIai8anBPPBaLoVaXjbnow0ZHjnTVmeBVy5yjM6KmoQQcuimS3/pr2v0WAiL4sjjqj
	 tJ9rSC1hwr+/Q==
Date: Tue, 2 Sep 2025 15:16:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: oleksii.kurochko@gmail.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>, 
    jbeulich@suse.com
Subject: Domctl series as a fix to PV_SHIM_EXCLUSIVE, was: [PATCH] xen/x86:
 move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <dfadb4d5-cbf9-4b99-b389-34cb290a2229@suse.com>
Message-ID: <alpine.DEB.2.22.394.2509021507410.1405870@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com> <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com> <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com> <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop> <cc8724b6-bb31-4482-a459-156366b7b433@suse.com>
 <alpine.DEB.2.22.394.2508271442410.580734@ubuntu-linux-20-04-desktop> <5f5ba1dd-1252-4740-8c64-e4fcd8a7ac32@suse.com> <alpine.DEB.2.22.394.2508281632020.8757@ubuntu-linux-20-04-desktop> <dfadb4d5-cbf9-4b99-b389-34cb290a2229@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksii,

We previously discussed the PV_SHIM_EXCLUSIVE build issue on Matrix
and agreed on resolving it after the feature freeze as a fix. This
conversation took place before the feature freeze was rescheduled to
September 5. I am documenting this on xen-devel both for record-keeping
and because Matrix is currently offline. I am proceeding under the
assumption that the conclusions from that discussion still apply.

I would like to request an additional clarification. While there is no
consensus among the maintainers on the preferred short-term compromise,
there is agreement that reviewing and committing the domctl series [1]
in time would be the best outcome. (Together with unifying CONFIG_SYSCTL
and CONFIG_DOMCTL into a single CONFIG_MGMT_HYPERCALLS for simplicify.)

Are you still OK with us going ahead with reviewing and committing the
domctl series as a fix to the PV_SHIM_EXCLUSIVE issue, potentially going
past the feature freeze by a week?

Many thanks!

Cheers,

Stefano

[1] https://marc.info/?l=xen-devel&m=175421442423500


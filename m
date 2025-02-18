Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06822A3A6A8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 20:02:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892163.1301159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkSqt-0001SQ-9D; Tue, 18 Feb 2025 19:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892163.1301159; Tue, 18 Feb 2025 19:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkSqt-0001Q9-67; Tue, 18 Feb 2025 19:01:51 +0000
Received: by outflank-mailman (input) for mailman id 892163;
 Tue, 18 Feb 2025 19:01:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrz8=VJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkSqr-0001Q2-Ht
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 19:01:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65b6167-ee2a-11ef-9aa8-95dc52dad729;
 Tue, 18 Feb 2025 20:01:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3F982A41476;
 Tue, 18 Feb 2025 18:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830F3C4CEE2;
 Tue, 18 Feb 2025 19:01:33 +0000 (UTC)
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
X-Inumbo-ID: c65b6167-ee2a-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739905294;
	bh=prsiAUrbqd2hDG0pC/ATpJRDl67X1EL4E4uIbn+dRqs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BgY68tefh0zAmyKZyI8Rx7ODPdwAuywQyVW7JyBhVv/tMv0BmK70SISHnMDuLWn2p
	 jUcktvZytd7jOkXsb8EgKxJ2p9O5wG6ad7vyWP3fb0fXvKGUuJXhWPA2Jln7pnzEXh
	 PsAng2r19L8u3wUYA/Q9rkEQq2wXMMBXxyicN4w64cb8wp91Gly4eIZhiGhx+uPWgK
	 RSsE41G3IfJez5VpRVK9pqJz0B+PXv0hoe5hauXavsuq7SccTU2sQnTKYb9+pQ0JAk
	 u8jRaLuyF2b+ODxUlozZcFp4hpnj0p3sZhuJoJGZEJ4MmzFagBg9YAvqD26GxOk2Z3
	 eSbjsvnR+W5HA==
Date: Tue, 18 Feb 2025 11:01:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    sergiy_kibrik@epam.com, Jiqian.Chen@amd.com
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
In-Reply-To: <alpine.DEB.2.22.394.2501221349060.11086@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2502181100220.1085376@ubuntu-linux-20-04-desktop>
References: <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com> <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop> <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com> <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
 <alpine.DEB.2.22.394.2501201527090.11086@ubuntu-linux-20-04-desktop> <bae48627-fa5b-48b6-b74e-267285175eff@suse.com> <Z49gQBkxCbXIO84D@macbook.local> <41859184-bd9c-420f-96c1-65abe379b81e@suse.com> <Z4_hOmi01AkiYH_k@macbook.local> <c897005a-2e8e-4031-a828-acb8128f7c0c@suse.com>
 <Z5C_EJEtorK2pwGE@macbook.local> <6c0ebe4b-fc47-4bb0-b317-f854abb63517@suse.com> <alpine.DEB.2.22.394.2501221349060.11086@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

The topic was discussed today during the committers and core maintainers
call and the decision was to remove the PV_SHIM_EXCLUSIVE Kconfig
option.

Cheers,

Stefano


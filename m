Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C13939578
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762357.1172524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0Z7-0007nb-Oi; Mon, 22 Jul 2024 21:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762357.1172524; Mon, 22 Jul 2024 21:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0Z7-0007k8-Km; Mon, 22 Jul 2024 21:27:29 +0000
Received: by outflank-mailman (input) for mailman id 762357;
 Mon, 22 Jul 2024 21:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3Fi=OW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sW0Z6-0007Ee-2h
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:27:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 308fb55d-4871-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 23:27:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F0E8CE0C4F;
 Mon, 22 Jul 2024 21:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6D2C116B1;
 Mon, 22 Jul 2024 21:27:18 +0000 (UTC)
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
X-Inumbo-ID: 308fb55d-4871-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721683640;
	bh=eZ3Vexn5asWDHZ/yQICg46V4bCJuyIKihlB2Krshc7I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V2jKBZhK9eQ5EgdN5F91cm+RfVDO3TeieWejrRwo6F8ol0707NYzt1RmHeXSm0bYq
	 Gp2jCiwU3WxI5mp+vgrI58/Tk0Qdk9mTfnivKI1lRED2X6henfPMVADFpVkLgwb3yh
	 F2N8VmKvGhHJFIATXIKorMFl5fEJCHv3NlikLt8s7iCmFJyjYUY+erSa94N8BGdafx
	 OnBSIuW2uTQ8q+GhgMcyGr6czgSYct8qKVeMZVpdvoDiw3MC5VoMHP6dZAyexo4scY
	 E+Nof+jHC2bFzLS/EkxIHl2yCcbZ6bxYKRv/o6SqCKvoQa2RdXdydX4eAFhrkHJ2rR
	 b0HG1OVLupNxg==
Date: Mon, 22 Jul 2024 14:27:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [XEN PATCH v9 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
In-Reply-To: <20240607081127.126593-4-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407221427090.4857@ubuntu-linux-20-04-desktop>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com> <20240607081127.126593-4-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jun 2024, Jiqian Chen wrote:
> On PVH dom0, the gsis don't get registered, but
> the gsi of a passthrough device must be configured for it to
> be able to be mapped into a hvm domU.
> On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
> passthrough devices to register gsi when dom0 is PVH.
> So, add PHYSDEVOP_setup_gsi for above purpose.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



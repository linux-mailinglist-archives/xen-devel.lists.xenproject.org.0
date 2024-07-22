Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E0939596
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762433.1172599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0j2-0004GT-WA; Mon, 22 Jul 2024 21:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762433.1172599; Mon, 22 Jul 2024 21:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0j2-0004EH-Ta; Mon, 22 Jul 2024 21:37:44 +0000
Received: by outflank-mailman (input) for mailman id 762433;
 Mon, 22 Jul 2024 21:37:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3Fi=OW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sW0j1-0004EB-PH
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:37:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ff4a2ad-4872-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 23:37:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 542BF60AD1;
 Mon, 22 Jul 2024 21:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C01C4AF0A;
 Mon, 22 Jul 2024 21:37:38 +0000 (UTC)
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
X-Inumbo-ID: 9ff4a2ad-4872-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721684261;
	bh=gA7tTL5ipTj9Gr7tb6EhoUOMIQE20/6WSCx8mc/wMbQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bHFmqUAXTXbNVWSY6/IN1syUhfIs+FzmfKnxqm+YBUpzPz32KWd8wv2Oya++A+Qy2
	 noAJBv3wCoDSNO68sBgpj5Aq43k1Bhaa0oSObmi2nZzE0t0JULtqoD0vrHH+fd5HSU
	 wpe88x48RdoQILsFCgQgFjgb/m0YkBZ2vOr6piRK3hewjQW7b+U68+BMKKp9yhJ5o1
	 vxJQZhK9ox98PLykURTwAc/JGUP30ERBktAOOM16t0bl8FspOUocaju8nT3Anl5Bc3
	 CrXzcmRjqTjcEZxMPVktFF0JXzDaB43IZGFu3p6dL5B06gDmlmulbGuPjVo1xira9s
	 w0JpcicBla7lw==
Date: Mon, 22 Jul 2024 14:37:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <ray.huang@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is
 PVH
In-Reply-To: <20240708114124.407797-3-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407221437280.4857@ubuntu-linux-20-04-desktop>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com> <20240708114124.407797-3-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Jul 2024, Jiqian Chen wrote:
> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see qemu code
> xen_pt_realize->xc_physdev_map_pirq and libxl code
> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
> is not allowed because currd is PVH dom0 and PVH has no
> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
> 
> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
> And add a new check to prevent (un)map when the subject domain
> doesn't have a notion of PIRQ.
> 
> So that the interrupt of a passthrough device can be
> successfully mapped to pirq for domU with a notion of PIRQ
> when dom0 is PVH
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



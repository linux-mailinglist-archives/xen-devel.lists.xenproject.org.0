Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3CF8C6F02
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:15:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722662.1126827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Npe-0007em-S5; Wed, 15 May 2024 23:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722662.1126827; Wed, 15 May 2024 23:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Npe-0007co-PH; Wed, 15 May 2024 23:14:46 +0000
Received: by outflank-mailman (input) for mailman id 722662;
 Wed, 15 May 2024 23:14:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7Npd-0007cb-Jx
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:14:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8910190-1310-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 01:14:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A8F22CE17FD;
 Wed, 15 May 2024 23:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27A0C116B1;
 Wed, 15 May 2024 23:14:36 +0000 (UTC)
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
X-Inumbo-ID: e8910190-1310-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715814877;
	bh=5nZURLaoNtXce9Y8qA5k4kGoOJSAV9Ep36Do2UBcKbk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o+P9KyhIWTR7JvTiRtLy6cWFYqZBr6hZq9+C98cXoDmgBnyj3zZiaWjc7cmvPdhcy
	 7qVcwv85o5J63IgCni/bLyevNJtCOC3OFiAkuZLpGVVF8wysShk0NqASA8Gf61bqhi
	 uPxjsHZSZP4FqCxVEQNXWc1U/+Htv0/HEn5lOEtQfVA5ZcHbYw3n1tvb96Hg0Ql3IZ
	 qxR01yxMHEFMXR5QMWUOv7hPbvhmX0MpMddqgC7YN9zrusTkumjlXnVH/Hb8Rk2/d/
	 ZuVni1h8Rn252G8EULwVMP/WNgr6jffDaZ4scYw+OielC3ZKPD/lzYQEvYqmH3hNuz
	 k1fzuEP8wmeTQ==
Date: Wed, 15 May 2024 16:14:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 7/8] xen: mapcache: Add support for grant mappings
In-Reply-To: <20240503014449.1046238-8-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405151614270.2544314@ubuntu-linux-20-04-desktop>
References: <20240503014449.1046238-1-edgar.iglesias@gmail.com> <20240503014449.1046238-8-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 May 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a second mapcache for grant mappings. The mapcache for
> grants needs to work with XC_PAGE_SIZE granularity since
> we can't map larger ranges than what has been granted to us.
> 
> Like with foreign mappings (xen_memory), machines using grants
> are expected to initialize the xen_grants MR and map it
> into their address-map accordingly.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



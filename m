Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1328C7F14
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 02:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723704.1128734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7lD9-0001Ch-TC; Fri, 17 May 2024 00:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723704.1128734; Fri, 17 May 2024 00:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7lD9-0001B7-QD; Fri, 17 May 2024 00:12:35 +0000
Received: by outflank-mailman (input) for mailman id 723704;
 Fri, 17 May 2024 00:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7lD7-0001AY-PZ
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 00:12:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25d2ee9e-13e2-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 02:12:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D4E16CE1993;
 Fri, 17 May 2024 00:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BF8C113CC;
 Fri, 17 May 2024 00:12:25 +0000 (UTC)
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
X-Inumbo-ID: 25d2ee9e-13e2-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715904747;
	bh=p6pl74FbIfmFlxT8dPPcHg1hmaZ68bkLMFjCfCRTNWA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R1x2qYiFCITWjUuNvFhGiZmVwK179ukISANCJksJ6wbQ+/G/u/KmockHBJPVy+Fom
	 pBX5yFWxieQVdcz1/x/v0xK1dFzWi9wTkamJLB98Prrj9StO0zHS6f9xfwsjpWlViM
	 tChCGBaGdHJMAWtqM4/KiS3Xbum4DDD3eSiiyTga+aP6xzV3qF5hKlKOXgfpUMBZ2C
	 IsTS7ybYME94DPodma/kjj77/V57oRN3pBI1vrhawx8YM0neWgFU9fqye6K1jtX4SW
	 SRJB+GVl5QWDJCtw/Qo1fiDXA7pt2m+wh7OvdzoociA27ytwOMSzWD3awwC000q7eL
	 ySjpM1R8Gag7g==
Date: Thu, 16 May 2024 17:12:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 6/8] xen: mapcache: Pass the ram_addr offset to
 xen_map_cache()
In-Reply-To: <20240516154804.1114245-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405161712150.2544314@ubuntu-linux-20-04-desktop>
References: <20240516154804.1114245-1-edgar.iglesias@gmail.com> <20240516154804.1114245-7-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 May 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Pass the ram_addr offset to xen_map_cache.
> This is in preparation for adding grant mappings that need
> to compute the address within the RAMBlock.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



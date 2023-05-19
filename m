Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E8708CF2
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 02:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536616.835121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzo01-0007Zv-RD; Fri, 19 May 2023 00:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536616.835121; Fri, 19 May 2023 00:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzo01-0007Xw-OM; Fri, 19 May 2023 00:29:37 +0000
Received: by outflank-mailman (input) for mailman id 536616;
 Fri, 19 May 2023 00:29:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I2Cg=BI=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1pzo00-00073Q-MB
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 00:29:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b11ac20-f5dc-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 02:29:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-rNDO6Pq6NgOB6AuhL2p-gA-1; Thu, 18 May 2023 20:29:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15634185A7A4;
 Fri, 19 May 2023 00:29:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD7402026D25;
 Fri, 19 May 2023 00:29:31 +0000 (UTC)
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
X-Inumbo-ID: 3b11ac20-f5dc-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684456174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=izck6U+p15XsA5Y7NeSwny6iry6I1uPGq8jJ+Yvs74g=;
	b=fWTd0vHRdj7MGez+2OWCgCMJdrHn1U+JOAFo78Wi519Z4TVSe69lXy/vkz858b4g87+SbJ
	c6Kch7okY20JymjXDdsvOqow22vu52Agi7LileA/1L6R3aNNijYZAnmUYsqPr+Bv/PfUao
	B+qa6Qmgv3Yk0uRuJPHuZ1OtndMTVoY=
X-MC-Unique: rNDO6Pq6NgOB6AuhL2p-gA-1
Date: Thu, 18 May 2023 19:29:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
	Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Aarushi Mehta <mehta.aaru20@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 6/6] block: remove bdrv_co_io_plug() API
Message-ID: <eygnwu5upxmsoh4laxobo2x3i5ongnktxhp35m52mtsacgptas@ily4molhj2me>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-7-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517221022.325091-7-stefanha@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

On Wed, May 17, 2023 at 06:10:22PM -0400, Stefan Hajnoczi wrote:
> No block driver implements .bdrv_co_io_plug() anymore. Get rid of the
> function pointers.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/block/block-io.h         |  3 ---
>  include/block/block_int-common.h | 11 ----------
>  block/io.c                       | 37 --------------------------------
>  3 files changed, 51 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



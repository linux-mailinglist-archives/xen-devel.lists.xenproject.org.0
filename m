Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398F06FF493
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533431.830094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7Q6-0003es-Ef; Thu, 11 May 2023 14:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533431.830094; Thu, 11 May 2023 14:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7Q6-0003cm-Ah; Thu, 11 May 2023 14:37:26 +0000
Received: by outflank-mailman (input) for mailman id 533431;
 Thu, 11 May 2023 14:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9C6y=BA=crudebyte.com=qemu_oss@srs-se1.protection.inumbo.net>)
 id 1px7Q4-0003Xv-JM
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:37:24 +0000
Received: from kylie.crudebyte.com (kylie.crudebyte.com [5.189.157.229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56457d17-f009-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 16:37:21 +0200 (CEST)
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
X-Inumbo-ID: 56457d17-f009-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=ZvFzNgT8EWhTMGeJIh+BNbNw30pANCcOXAnUd2eArkQ=; b=WYpY4PnnYEJXSWyMQhw2u2WvHa
	pPT/dMcCgEMXDKZLvpPZSSTwSlaMbzaTHVIpG3GjoKYVMS26qIivqMsg7W0qaySl7DwzQO20alYpv
	3JXaZV1W11VeMxEApEhg64edDAMkFIqJPGSkXEe35GX88YfQDsBMAxlBN0Yh6MSEl+BCcz6k7ii21
	3zwut/j/xJgi0nQR3Q2VgWUlgIcrTvym8cvvJPC5GQgLGj03vYltU+mkegabM+zeS7vimHx5ZTtst
	f1J+Q2LiXpUgFUDkS3fw6gJxjp1uqCaGndWLdeobxGzw0SCbLVAw8iRWYd4rfPF1SgGEHQV/mPHHM
	rnF5rIWv8JzA3FEFtyGXqkLP7sXpVtbnmBcinrr+YAgly/WeHiQ7uqpoR0bgDRBH6w0AIHsvKyBkQ
	IDsb+ksmeHH2ApBF+i6zZEbC2G3LTRqZ3dN3ELT86RYJDBy52zSKAWH6FJVdFEQWRDozxvax7Ogyr
	tWcCNWVjIFjLOMoFdK+mu42R4MKaBSHWiOBxLoaSa2xETEE6NEuzqJGJCjLHrjv1OJ8GS/Aml20mN
	JZlDzIM+XZ+GBbYCEENQcN3YjtV2QnF0rCFKKit067BsI5tTPB1pOv+6ZhDMLkHsl5bdhNNjdvAsZ
	P+v4epzQqVo1mFiuXDdUDabPn4j2jQ/GXO2l0LlwY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] 9pfs/xen: Fix segfault on shutdown
Date: Thu, 11 May 2023 16:37:01 +0200
Message-ID: <2110128.8IRXTbt6Kt@silver>
In-Reply-To: <20230502143722.15613-1-jandryuk@gmail.com>
References: <20230502143722.15613-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, May 2, 2023 4:37:22 PM CEST Jason Andryuk wrote:
> xen_9pfs_free can't use gnttabdev since it is already closed and NULL-ed
> out when free is called.  Do the teardown in _disconnect().  This
> matches the setup done in _connect().
> 
> trace-events are also added for the XenDevOps functions.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  hw/9pfs/trace-events     |  5 +++++
>  hw/9pfs/xen-9p-backend.c | 36 +++++++++++++++++++++++-------------
>  2 files changed, 28 insertions(+), 13 deletions(-)

With aforementioned 2 minor changes, queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck




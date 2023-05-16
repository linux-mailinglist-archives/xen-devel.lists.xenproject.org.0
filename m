Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E6705084
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535232.832897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvbB-0000zj-QX; Tue, 16 May 2023 14:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535232.832897; Tue, 16 May 2023 14:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvbB-0000wv-Mu; Tue, 16 May 2023 14:24:21 +0000
Received: by outflank-mailman (input) for mailman id 535232;
 Tue, 16 May 2023 14:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0wm=BF=citrix.com=prvs=4936e02c6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pyvbA-0000wp-Hg
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:24:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 564ea919-f3f5-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 16:24:17 +0200 (CEST)
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
X-Inumbo-ID: 564ea919-f3f5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684247057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=asvGL2SZQNz6yR0hbwCPfuEFQwUqbyPvuKCqorCCv1M=;
  b=GXp1aubu76yPhlXykh0KJW7FGixSCPOZubevudU3O///RgZAQ88rfdBn
   B9nqDehha5qhnJ2UGD9T44cOFRNiQQEkgEJEIuU+rnF9qTtk70PlYfE/Q
   77LK4l9plTnQFPPpyZlWConJFwbOKszi13GN8GQjlArS8U2ThVlgYcY3z
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109113447
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:B5LCt6t99tnzCSBDijYdupAwP+fnVIVYMUV32f8akzHdYApBsoF/q
 tZmKTiEOv+LN2fxLo1zOY638RwAvpfdn4VrHgA9/y0zQSMU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKHySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFA5dTk+cisuKx+y6SfJin8kycOeoI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zqXpj2iXk1FXDCZ4QaI8yKW1uPUpnz2ZYQdF56R7+wzvlLGkwT/DzVJDADm8JFVkHWWQM5SJ
 UUS+iMGt6U+9EW3CNL6WnWQrneBlhMBQ9pXFas85R3l4rDW5ACUHUAeQzJBYcBgv8gzLRQzy
 16Pg97tDBR1vbGVQG7b/bCRxRu/NDMNKnQDeQceQAcF6sWlq4Y25jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vqzCxvYXASiYv6wnXV37j5QR8DKavapay4F7U4N5aIYqZR0XHt
 38B8+CG7OEKCJ2lkC2LSf8KWraz6J6tKzLVm0xmBZQJ7Tmh+3e/O4tX5VlWKUt0O9wIfhfpa
 UXQvhhNopleIBOCRqh2aZP3O9kCwq3pFNCjXffRBvJCfZ1uLieG+i90bEKd1myrl1Ij+YklO
 JybeNygS3YXD6hq1iGxQc8Z0Lki3Cd4wnncLbj+xg6s3L7YbWabRLMPOUaLRu885aKA5g7S9
 r53LNCWwh9SVOn/ZCj/8oMJK10Oa38hCvjes8FLe/STChBrFGEoF7naxrZJU4homK5Pn/zg5
 HyxWkZEjlH4gBXvLB6WQmpuZLPmQdB0qndTFTQmOlC62n4iSZyi4KcWa908erxP3O98yvp6Z
 +MId8WJHrJETTGv0yQcYIj6qoNgdTyhlB6DMyOjazV5dJllLyTS5ff7cwrr8iQSHGy7uKMWu
 7mI1QreWdwPSmxKFM/LbNq/wlX3umIS8MprUk7VZ9NXf07v2I5tLSP3k7kwOc5kARDOxieTk
 Q+fGwpC/cHCpoY09J/CgqXsh52uFe1/E1FTH23R4Ky5HSbf92unh4RHVY6gZD3YSSb49buvY
 c1TyPfzNuBBm0xF26J8Cbtq0bAW/dbjp7ZGiA9jGR3jZkymELp6LlGa3MNEsetGwboxhOetc
 hvRoJ8AY+zPYZ67VgdLf2LJc9hvy9kopGnysus4CXn9ui5057SeXFQOEVqT3Xk1wKRODKspx
 uIoucgz4gO5iwY3Ptvush2451hgPVRbDfx568hy7JvDz1NylwocOcC05jreusnnVjlaDqU9z
 tZ4boLmjq8U+EfNemFb+ZPljbsE3sRmVPynITY/y7W1djjt3KdfMP55q25fouFpIvJvjYpO1
 pBDbREdGEl3124AaDJ/d26tARpdIxaS51b8zVAE/EWAERn0DzOQcjxkZbnXlKz8z467Vmkzw
 V1l4Dy9DWaCkD/ZhEPepnKJW9S8FIcsp2UuaeisHtifHolSXAcJdpSGPDJSwzO+WJNZuaEyj
 bUylAqGQfGhZHF4TmxSI9Xy6In8vzjadDMfEa0+pfhh8KO1UGja5AVi4nuZIqtlT8EmO2fiY
 yCyDqqjjyiD6Rs=
IronPort-HdrOrdr: A9a23:z43tZKxvSlFxxe6vbFJfKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:GF4hImzw9KnNAG9pY5TgBgUoJJAFLWLQ5UvXfU67EmhwRazJZxyPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ACR/MUg2a6hBlw4JObxbVBW9xTTUj36mvWHpdnY4?=
 =?us-ascii?q?95MS5MyNzGB6Enm2JTdpy?=
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="109113447"
Date: Tue, 16 May 2023 15:24:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: <qemu-devel@nongnu.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, <qemu-block@nongnu.org>, Paul Durrant
	<paul@xen.org>, Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>, Xie
 Yongji <xieyongji@bytedance.com>, Kevin Wolf <kwolf@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>, Hanna Reitz
	<hreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, David Woodhouse
	<dwmw2@infradead.org>, Coiby Xu <Coiby.Xu@gmail.com>, Eduardo Habkost
	<eduardo@habkost.net>, Stefano Garzarella <sgarzare@redhat.com>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Daniel
 =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, Julia Suvorova
	<jusual@redhat.com>, <xen-devel@lists.xenproject.org>, <eesposit@redhat.com>,
	Juan Quintela <quintela@redhat.com>, "Richard W.M. Jones"
	<rjones@redhat.com>, Fam Zheng <fam@euphon.net>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 12/21] xen-block: implement
 BlockDevOps->drained_begin()
Message-ID: <c760c8bd-49f3-4be0-b01c-9afd1efa619c@perard>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <20230504195327.695107-13-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230504195327.695107-13-stefanha@redhat.com>

On Thu, May 04, 2023 at 03:53:18PM -0400, Stefan Hajnoczi wrote:
> Detach event channels during drained sections to stop I/O submission
> from the ring. xen-block is no longer reliant on aio_disable_external()
> after this patch. This will allow us to remove the
> aio_disable_external() API once all other code that relies on it is
> converted.
> 
> Extend xen_device_set_event_channel_context() to allow ctx=NULL. The
> event channel still exists but the event loop does not monitor the file
> descriptor. Event channel processing can resume by calling
> xen_device_set_event_channel_context() with a non-NULL ctx.
> 
> Factor out xen_device_set_event_channel_context() calls in
> hw/block/dataplane/xen-block.c into attach/detach helper functions.
> Incidentally, these don't require the AioContext lock because
> aio_set_fd_handler() is thread-safe.
> 
> It's safer to register BlockDevOps after the dataplane instance has been
> created. The BlockDevOps .drained_begin/end() callbacks depend on the
> dataplane instance, so move the blk_set_dev_ops() call after
> xen_block_dataplane_create().
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


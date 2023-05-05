Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F546F8089
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 12:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530282.825815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pusK8-00005H-PH; Fri, 05 May 2023 10:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530282.825815; Fri, 05 May 2023 10:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pusK8-0008VA-M8; Fri, 05 May 2023 10:06:00 +0000
Received: by outflank-mailman (input) for mailman id 530282;
 Fri, 05 May 2023 10:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SieT=A2=crudebyte.com=qemu_oss@srs-se1.protection.inumbo.net>)
 id 1pusK7-0008V4-BJ
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 10:05:59 +0000
Received: from kylie.crudebyte.com (kylie.crudebyte.com [5.189.157.229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e0f159c-eb2c-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 12:05:57 +0200 (CEST)
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
X-Inumbo-ID: 6e0f159c-eb2c-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=dQqO1khjEzEoVtLNIOKXHQ3bWHajiFN7+uL2OPfkzMc=; b=mdPsTpwATAWPjUrJsoF9GqrraD
	ajLSNGDetq1iGmRFud9L4vAHbADCzTD3E3c6yEdaLI3bbNGs1D4uyazX3g9WPHteinNh9oz30GZRE
	CO8h/8ds1IYxaYm2gkOCo7yB82NJf/CHy//A8XKS7wurt69xdA5mmKgLcqj8/Qjek+I2jKDWt/eP7
	MUf5+MlWwrg3SzIYfYMzYZF4OBLVHR5ZqxuXqiJPfQAECq80PEl2Kdc0m86pSda+Ppxoi442OEqdO
	06GMIvCgnIicQa5eekq+hFLlxYcWoOD6FN3s+7HFtT8nBKvE5J53fQO3t6EsUfKXr8KWuODtgBBxu
	MlCt7vSu6nU8XxBuAO4oon6qV8IQX7DrKh4D+3O94BsG6OReeTHKqKOzqIBJ4gzvxwD4qSSl9IWZG
	l7A0qMl3H8rZ+jj80Tx2SrBg+FKrFYd1DJC+iuTaIrnaibk3DWZhOFRDdUNAv5DG+NzAE2Whe0SPF
	V8rbCFG37AMef1xY+AxMloEZXIOAGM1m3edeEBVnPOQHL9fXA4OtsP17LmZUTqsh/kKAexb2RgY//
	FwZCdBD4uickZaxI4MJcwFtO/m3AL4f1b0ifFtnUgpStquuZ98puAJ+oPGsAGRWmmJ+TBYYnC2ZEA
	TNUaF0NX0WSuOJtxSSqcaHEl5uHf4J0kx6/+e/YN4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] 9pfs/xen: Fix segfault on shutdown
Date: Fri, 05 May 2023 12:05:45 +0200
Message-ID: <43162544.QFhiSxD2Za@silver>
In-Reply-To: <20230502143722.15613-1-jandryuk@gmail.com>
References: <20230502143722.15613-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jason,

as this is a Xen specific change, I would like Stefano or another Xen
developer to take a look at it, just few things from my side ...

On Tuesday, May 2, 2023 4:37:22 PM CEST Jason Andryuk wrote:
> xen_9pfs_free can't use gnttabdev since it is already closed and NULL-ed

Where exactly does it do that access? A backtrace or another detailed commit
log description would help.

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
> 
> diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
> index 6c77966c0b..7b5b0b5a48 100644
> --- a/hw/9pfs/trace-events
> +++ b/hw/9pfs/trace-events
> @@ -48,3 +48,8 @@ v9fs_readlink(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
>  v9fs_readlink_return(uint16_t tag, uint8_t id, char* target) "tag %d id %d name %s"
>  v9fs_setattr(uint16_t tag, uint8_t id, int32_t fid, int32_t valid, int32_t mode, int32_t uid, int32_t gid, int64_t size, int64_t atime_sec, int64_t mtime_sec) "tag %u id %u fid %d iattr={valid %d mode %d uid %d gid %d size %"PRId64" atime=%"PRId64" mtime=%"PRId64" }"
>  v9fs_setattr_return(uint16_t tag, uint8_t id) "tag %u id %u"
> +

Nit-picking; missing leading comment:

# xen-9p-backend.c

> +xen_9pfs_alloc(char *name) "name %s"
> +xen_9pfs_connect(char *name) "name %s"
> +xen_9pfs_disconnect(char *name) "name %s"
> +xen_9pfs_free(char *name) "name %s"
> diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> index 0e266c552b..c646a0b3d1 100644
> --- a/hw/9pfs/xen-9p-backend.c
> +++ b/hw/9pfs/xen-9p-backend.c
> @@ -25,6 +25,8 @@
>  #include "qemu/iov.h"
>  #include "fsdev/qemu-fsdev.h"
>  
> +#include "trace.h"
> +
>  #define VERSIONS "1"
>  #define MAX_RINGS 8
>  #define MAX_RING_ORDER 9
> @@ -337,6 +339,8 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
>      Xen9pfsDev *xen_9pdev = container_of(xendev, Xen9pfsDev, xendev);
>      int i;
>  
> +    trace_xen_9pfs_disconnect(xendev->name);
> +
>      for (i = 0; i < xen_9pdev->num_rings; i++) {
>          if (xen_9pdev->rings[i].evtchndev != NULL) {
>              qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i].evtchndev),
> @@ -345,40 +349,42 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
>                                     xen_9pdev->rings[i].local_port);
>              xen_9pdev->rings[i].evtchndev = NULL;
>          }
> -    }
> -}
> -
> -static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> -{
> -    Xen9pfsDev *xen_9pdev = container_of(xendev, Xen9pfsDev, xendev);
> -    int i;
> -
> -    if (xen_9pdev->rings[0].evtchndev != NULL) {
> -        xen_9pfs_disconnect(xendev);
> -    }
> -
> -    for (i = 0; i < xen_9pdev->num_rings; i++) {
>          if (xen_9pdev->rings[i].data != NULL) {
>              xen_be_unmap_grant_refs(&xen_9pdev->xendev,
>                                      xen_9pdev->rings[i].data,
>                                      xen_9pdev->rings[i].intf->ref,
>                                      (1 << xen_9pdev->rings[i].ring_order));
> +            xen_9pdev->rings[i].data = NULL;
>          }
>          if (xen_9pdev->rings[i].intf != NULL) {
>              xen_be_unmap_grant_ref(&xen_9pdev->xendev,
>                                     xen_9pdev->rings[i].intf,
>                                     xen_9pdev->rings[i].ref);
> +            xen_9pdev->rings[i].intf = NULL;
>          }
>          if (xen_9pdev->rings[i].bh != NULL) {
>              qemu_bh_delete(xen_9pdev->rings[i].bh);
> +            xen_9pdev->rings[i].bh = NULL;
>          }
>      }
>  
>      g_free(xen_9pdev->id);
> +    xen_9pdev->id = NULL;
>      g_free(xen_9pdev->tag);
> +    xen_9pdev->tag = NULL;
>      g_free(xen_9pdev->path);
> +    xen_9pdev->path = NULL;
>      g_free(xen_9pdev->security_model);
> +    xen_9pdev->security_model = NULL;
>      g_free(xen_9pdev->rings);
> +    xen_9pdev->rings = NULL;
> +    return;
> +}
> +
> +static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> +{
> +    trace_xen_9pfs_free(xendev->name);
> +
>      return 0;
>  }

xen_9pfs_free() doing nothing, that doesn't look right to me. Wouldn't it make
sense to turn xen_9pfs_free() idempotent instead?

>  
> @@ -390,6 +396,8 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
>      V9fsState *s = &xen_9pdev->state;
>      QemuOpts *fsdev;
>  
> +    trace_xen_9pfs_connect(xendev->name);
> +
>      if (xenstore_read_fe_int(&xen_9pdev->xendev, "num-rings",
>                               &xen_9pdev->num_rings) == -1 ||
>          xen_9pdev->num_rings > MAX_RINGS || xen_9pdev->num_rings < 1) {
> @@ -499,6 +507,8 @@ out:
>  
>  static void xen_9pfs_alloc(struct XenLegacyDevice *xendev)
>  {
> +    trace_xen_9pfs_alloc(xendev->name);
> +
>      xenstore_write_be_str(xendev, "versions", VERSIONS);
>      xenstore_write_be_int(xendev, "max-rings", MAX_RINGS);
>      xenstore_write_be_int(xendev, "max-ring-page-order", MAX_RING_ORDER);
> 




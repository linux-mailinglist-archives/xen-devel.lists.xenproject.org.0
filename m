Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E9BB09AD6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047907.1418204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdNc-0008ES-LQ; Fri, 18 Jul 2025 05:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047907.1418204; Fri, 18 Jul 2025 05:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdNc-0008Ce-IZ; Fri, 18 Jul 2025 05:11:32 +0000
Received: by outflank-mailman (input) for mailman id 1047907;
 Fri, 18 Jul 2025 05:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BvrW=Z7=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1ucdNa-0008CY-Q9
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:11:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8a43494-6395-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 07:11:28 +0200 (CEST)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-rthEhHQROt6pdPOwe-EMCw-1; Fri,
 18 Jul 2025 01:11:23 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AB1EC18001DA; Fri, 18 Jul 2025 05:11:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.6])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EC15830001B1; Fri, 18 Jul 2025 05:11:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A9AF21E6A27; Fri, 18 Jul 2025 07:11:18 +0200 (CEST)
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
X-Inumbo-ID: a8a43494-6395-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752815487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ARMmysfTEBbBzJJOL2kfmLEK5nKGR4pGLcHEJdAoCeA=;
	b=O9e1wRIDAyVFz0yiTt1Y4e3dquZ63W2qp5xoT07jSe+pihs0EUd5EqYMepmaKFDBXckdD+
	Noc0S4yJvK/GuA6k+uyQVTtLZuFqzfP6/DspMKQzrrgT1uwB2MoASHTYf0vGkr9QFKofeZ
	eaEqUifmi88K8L6mU2rlFdz5DdBSLjM=
X-MC-Unique: rthEhHQROt6pdPOwe-EMCw-1
X-Mimecast-MFC-AGG-ID: rthEhHQROt6pdPOwe-EMCw_1752815482
From: Markus Armbruster <armbru@redhat.com>
To: Adam Williamson <awilliam@redhat.com>
Cc: qemu-devel@nongnu.org,  Paul Durrant <paul@xen.org>,
  xen-devel@lists.xenproject.org,  Stefano Stabellini
 <sstabellini@kernel.org>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH] xen/passthrough: add missing error-report include
In-Reply-To: <20250717220207.171040-1-awilliam@redhat.com> (Adam Williamson's
	message of "Thu, 17 Jul 2025 15:02:07 -0700")
References: <20250717220207.171040-1-awilliam@redhat.com>
Date: Fri, 18 Jul 2025 07:11:18 +0200
Message-ID: <87v7nqgk21.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Adam Williamson <awilliam@redhat.com> writes:

> In cfcacba an `error_report` was added to this file, but the
> corresponding include of `qemu/error-report.h` was missed. This
> only becomes apparent when building against Xen 4.20+.
>
> Signed-off-by: Adam Williamson <awilliam@redhat.com>
> ---
>  hw/xen/xen_pt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 9d16644d82..006b5b55f2 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -54,6 +54,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include <sys/ioctl.h>
>  
>  #include "hw/pci/pci.h"

Uh, error-report.h is included without this for me.  To see, build with
-H:

. /work/armbru/qemu/hw/xen/xen_pt.h
.. /work/armbru/qemu/include/hw/xen/xen_native.h
... /work/armbru/qemu/hw/xen/trace.h
.... ./trace/trace-hw_xen.h
..... /work/armbru/qemu/include/qemu/error-report.h

Code smell: header in include/... includes header from hw/.  Not this
patch's concern.



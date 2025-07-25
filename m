Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26049B122ED
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 19:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058292.1425918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufM7t-0004rK-47; Fri, 25 Jul 2025 17:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058292.1425918; Fri, 25 Jul 2025 17:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufM7t-0004oS-19; Fri, 25 Jul 2025 17:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1058292;
 Fri, 25 Jul 2025 17:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dxns=2G=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1ufM7r-0004oM-GK
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 17:22:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efcd0b59-697b-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 19:22:28 +0200 (CEST)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-8W4TE_iqNQuHCZ3laLMhRA-1; Fri,
 25 Jul 2025 13:22:23 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DE2D0180044F; Fri, 25 Jul 2025 17:22:21 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.162])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 56D9B30001B0; Fri, 25 Jul 2025 17:22:19 +0000 (UTC)
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
X-Inumbo-ID: efcd0b59-697b-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753464147;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPxf2cZIeWCLSjErJImlBKjAAW42Zr4+chQG4iQSQds=;
	b=JzdV8B5Hs78/kmq9mgaCVZv8BeaFvF+eDkswU5IiZ71ascH37qcX4Bxr6oZTPLmUMdo7Wd
	wG7nBv3NLCX4PuqJ2IKQxrFr9E2xrsWww7+w0m3YV4aLntZg7im5d/zOGb43V3i2D92CmV
	0hMOs/6wGR9lwtu0oTOeAcymBXhV45M=
X-MC-Unique: 8W4TE_iqNQuHCZ3laLMhRA-1
X-Mimecast-MFC-AGG-ID: 8W4TE_iqNQuHCZ3laLMhRA_1753464142
Date: Fri, 25 Jul 2025 18:22:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] hw/xen/xen_pt: fix missing include
Message-ID: <aIO9SHJkDPnrfAHf@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250725165749.3893240-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250725165749.3893240-1-pierrick.bouvier@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Fri, Jul 25, 2025 at 09:57:49AM -0700, Pierrick Bouvier wrote:
> FAILED: libqemu-i386-softmmu.a.p/hw_xen_xen_pt.c.o
> ...
> /home/user/.work/qemu/hw/xen/xen_pt.c: In function ‘xen_pt_need_gsi’:
> /home/user/.work/qemu/hw/xen/xen_pt.c:783:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Wimplicit-function-declaration]
>   783 |         error_report("Cannot open %s: %s", guest_type, strerror(errno));
>       |         ^~~~~~~~~~~~
>       |         error_report_err
> /home/user/.work/qemu/hw/xen/xen_pt.c:783:9: error: nested extern declaration of ‘error_report’ [-Werror=nested-externs]
> cc1: all warnings being treated as errors
> 
> Fixes: 012842c ("log: make '-msg timestamp=on' apply to all qemu_log usage")

The problem pre-dated this, so this should be

 Fixes: cfcacbab38e (xen/passthrough: use gsi to map pirq when dom0 is PVH)

See the prior posting of this fix last week:

  https://lists.nongnu.org/archive/html/qemu-devel/2025-07/msg04831.html

> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/xen/xen_pt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 9d16644d82e..006b5b55f24 100644
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
> -- 
> 2.47.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



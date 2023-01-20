Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B710675E72
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482131.747513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxT0-0003Wi-JG; Fri, 20 Jan 2023 19:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482131.747513; Fri, 20 Jan 2023 19:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxT0-0003Uz-GC; Fri, 20 Jan 2023 19:54:26 +0000
Received: by outflank-mailman (input) for mailman id 482131;
 Fri, 20 Jan 2023 19:54:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIxSy-0003Ut-D7
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:54:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b9ca49a-98fc-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 20:54:23 +0100 (CET)
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
X-Inumbo-ID: 3b9ca49a-98fc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674244463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m0DCxynqsw+mJzYA9x8FwtAUhehPHJikFd3yCpVkhIU=;
  b=B0xGDwE6DEoqlKmiime/Ktg1opaWFteNU8K4IEELBlS4xawdv3bOoFnM
   MpB8m3+Dc93USjTfoMSWZta1qKLf8ll2N8z9aJBnC4xW9uXU9+R8tcHA3
   f1QU9RAu+6PT10UeEpEAlGYtMKVWGIwP67+Na8/OzLcUBbihWSTC3khRp
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92472794
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jDChBKM43Mi+POHvrR1/l8FynXyQoLVcMsEvi/4bfWQNrUp0gmdRn
 2IdCmqBafncYmH9f48gad+y8BwG65+HyNVgSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5ARmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0shbPGdk/
 MAlET5OXDTbnuWb37eHcPY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3QGZoPwRfEz
 o7A1373DSBCNPaz8CeA9E2Xr8KUwg/HaatHQdVU8dY12QbOlwT/EiY+V1ShpuKiolWjQN8ZI
 EsRkgIntaUo/VanZsX8VRa/5nWDu3Y0WdBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiirjU6hrgVpd4G0eO851+vvt63jsGXFEhvvFyRBz/7qFojP+ZJerBE93D1wctGBo+lc2CP/
 0ogw9GZwf8LMauSwXnlrPo2IJml4POMMTv5iFFpHoU8+znFx0NPbby88xkleh43b59slSvBJ
 RaK5FgPvMM70G6CN/cfXm6nNyg9IUEM//zBX+ucUNdBa4MZmOSvrHA3Ph74M4wAfSERfUAD1
 XSzK5zE4ZMm5UJPlmLeegvl+eV3rh3SPEuKLXwB8zyp0KCFeFmeQqofPV2FY4gRtf3b/F+Oo
 osGZ5fSk32ztdEShAGNqeb/ynhTfRAG6W3e8ZQLJoZv3CI4cI3eNxMh6ex4INE090ikvuzJ4
 mu8SidlJKnX3BX6xfGxQik7MtvHBM8vxU/XyARwZT5ELVB/O9fwhEreHrNrFYQaGBtLlqEsE
 6BeJp/aUpyiiF3volwgUHU0l6Q6HDzDuO5EF3PNjOQXF3K4ezH0xw==
IronPort-HdrOrdr: A9a23:zHrnXqzouMV9Kmhxp8hVKrPwLr1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPH7P+VIssR4b9exoVJPufZqYz+8S3WBzB8bGYOCFghrKEGgK1+KLqFeMJ8S9zJ8+6U
 4JSdkGNDSaNzhHZKjBjjWFLw==
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="92472794"
Date: Fri, 20 Jan 2023 19:54:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: Re: [XEN PATCH v6 0/5] Toolstack build system improvement, toward
 non-recursive makefiles
Message-ID: <Y8rxaDoaIWEVUiol@perard.uk.xensource.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230120194431.55922-1-anthony.perard@citrix.com>

The "for-4.17" in the subject is a mistake, the series is for staging.

It is just left over from the last time I've sent the series.

Cheers,

-- 
Anthony PERARD


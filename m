Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7691781134
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 19:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586481.917744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX2uT-0003Su-Ru; Fri, 18 Aug 2023 17:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586481.917744; Fri, 18 Aug 2023 17:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX2uT-0003QS-PJ; Fri, 18 Aug 2023 17:05:17 +0000
Received: by outflank-mailman (input) for mailman id 586481;
 Fri, 18 Aug 2023 17:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0mA=ED=citrix.com=prvs=58781cf72=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qX2uS-000395-EK
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 17:05:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64bb42df-3de9-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 19:05:14 +0200 (CEST)
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
X-Inumbo-ID: 64bb42df-3de9-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692378314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XlozQPIuWFh/+Ywlnuo0frOZwM+7n9JC+2QjZZiwnPA=;
  b=cwwS+isjZcYJYM9eg7ZNsleHfXXkRE16u/8KKRSoRfNIutWVIV+nCtJl
   QnsNGIdt4SDu3U+acaETuTTYuYmMA+9lJQRCFurIR4yjDaIWNXPIb8mfP
   KxlLvpWp4UvjCoHuHHlQSNpLLizT7dsXNlAWJTcDsOAQKbbTVN4JPc1vb
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119939033
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7P6wBKv2cxyr5fdefgXSFSPr/OfnVJ1eMUV32f8akzHdYApBsoF/q
 tZmKTiFa/rcZGOjLd8nYY+0/BwOvcPSzYI2SARprXhnHi4T+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+HxyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJG4US0yuve+N2ZGFSNI2qppzJ5DOFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zuXrj+oWkpBXDCZ4Regq1ewhNTLpgmhVrMAS4+j7NtRv3TGkwT/DzVJDADm8JFVkHWWWc9bK
 kES0jojq+417kPDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatM8vcsybTUv3
 02OmZXiAjkHmKKRYWKQ8PGTtzzaESoaN2gZfgcfUBAIpdLkpekbhwrCVN95HIapj9f+Hnf7x
 DXikcQlr+xN14hRjfz9pA2ZxWv2/fAlUzLZ+C3bAHuAsi5DabW8RLKq0gL3s6ZLdaOwGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMNGPx74M4PFyhJEfUQD1
 XCzKJ7EMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlUagHfMbhotfja/m05F
 uqz0ePQm32zt8WkPkHqHXM7dwhWfRDX+7inwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 xmAtrtj4AOn3xXvcFzaAk2PnZuzBf6TW1pnZ31zVbtpslB/CbuSAFA3LsBoIOF4pLIzl5aZj
 ZAtIq29PxiGcRyfkxx1UHU3hNUKmMiD7e5WAxeYXQ==
IronPort-HdrOrdr: A9a23:vKdJCqHdrFKTXR4DpLqE0seALOsnbusQ8zAXPhZKOHtom6uj5q
 OTdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bHYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIObuEZoTJB/KTHCKjTKadE/OW6
X-Talos-CUID: 9a23:P3aWVGH3gJgXZrDFqmJrqlcxRu0ff0bE70nSGBWUVzZiEZi8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ArawR5Q8lh0jMC/nLRTs9/u+Qf+pNuoGyCnsJqr9?=
 =?us-ascii?q?ctfiWah5rIRKmsx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="119939033"
Date: Fri, 18 Aug 2023 18:05:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] tools/libs: light: Remove the variable 'domainid'
 do_pci_remove()
Message-ID: <603d2542-ba94-4c1a-9480-a3319f75bdb0@perard>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-2-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230809103305.30561-2-julien@xen.org>

On Wed, Aug 09, 2023 at 11:33:04AM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The function do_pci_remove() has two local variables 'domid' and
> 'domainid' containing the same value.
> 
> Looking at the history, until 2cf3b50dcd8b ("libxl_pci: Use
> libxl__ao_device with pci_remove") the two variables may have
> different value when using a stubdomain.
> 
> As this is not the case now, remove 'domainid'. This will reduce
> the confusion between the two variables.
> 
> Note that there are other places in libxl_pci.c which are using
> the two confusing names within the same function. They are left
> unchanged for now.
> 
> No functional changes intented.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


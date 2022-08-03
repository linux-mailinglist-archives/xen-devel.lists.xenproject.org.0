Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE404588B17
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 13:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379807.613589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJCVU-00042r-O6; Wed, 03 Aug 2022 11:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379807.613589; Wed, 03 Aug 2022 11:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJCVU-00040h-Jq; Wed, 03 Aug 2022 11:25:44 +0000
Received: by outflank-mailman (input) for mailman id 379807;
 Wed, 03 Aug 2022 11:25:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+C7S=YH=citrix.com=prvs=207fd374a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oJCVS-0003z4-Q9
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 11:25:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff25f3c3-131e-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 13:25:40 +0200 (CEST)
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
X-Inumbo-ID: ff25f3c3-131e-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659525940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HSwpnYedOxbDIQWOpzt4A6YEptWtdfG2p3d2eIOUVzA=;
  b=TpjLP5HbidcLH/e46woUoI+yjkErCMUFZkkOVBvbQryioIaK9sIAt4VH
   vdvh+7cgWDBYQF74jf4ToSFqTWHJz2t+0IVq5f79sXNZ9j/yL3wi5aFVW
   xaIsyLBgQ0N9Yc0RLtJ2STC7fc20H/WYRvUQnCHpqcIua1RVAsptQk2y+
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77264605
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Au/WLFKsW5Snp9ROCuEKwgAaqZufnOphVZnV0M?=
 =?us-ascii?q?smfNr3fNXix3RfKay+Q/FW+adQQAGeMLe/JN1EfVX4R8wfhrKbi6CpY64Wqm?=
 =?us-ascii?q?F36eDt31gdESYEq8x0Nr3Ym3tovaXfk+c9kvjbJUzTAoepdnHVYCqP2blErZ?=
 =?us-ascii?q?ArqUg/lYzHv7xU6NTyr5GRw/Q0I85xT+yX1F2Ws5VqEtGu1QTLIujTFaJFPP?=
 =?us-ascii?q?Vk9tPzbQtB9huV5P0/FdJAEEAgsy/1IC37C4dueRPHVGd4YVHaxWHgqj8br8?=
 =?us-ascii?q?/jn45Cz8D9Pfn3Ge92DtTEEsmlCNEYS7EkEoNONf3tjnSkNSKX364q8xjzSf?=
 =?us-ascii?q?mPXUBzJLpMOaRrZkwcWQ94t58eMsMxw0NdyatkZfH269VLRDuAV+FqYNdqHe?=
 =?us-ascii?q?5fBf4OLzvyIZyj4gRBhoSPUayF4eD/2H+jDXPFYWWqBGk8H2Ovyzu7kxQLgk?=
 =?us-ascii?q?5ASPSN1v/i+R4WHGDbNqsBpMe+5U3j08DB4Gl9VV2yUT+XD93dmt6A9PvR4F?=
 =?us-ascii?q?W/hJjbkNsDJsPM3dpSFO9BAOGl8z92ZxaCxVF+ByuCV6dDD1u8YLH2ttJaCK?=
 =?us-ascii?q?A93nzxN4Nmy7lKC0zDsZ/4Of/p8fRmEGNJt0kbbh/r1NAVYr/UQ7aCvQbT4V?=
 =?us-ascii?q?n1CVwg8+Fx+ecUuzMOXUQeuzkLcNBn1+dXKmHbZoG0l7LWdgRm2+hKzKGkOh?=
 =?us-ascii?q?HCucZrIQJNkM0DkNpIIPHiJhwWpAzPUys8oGwr4ng7w9baQXJ6mgWowlE162?=
 =?us-ascii?q?U+oUy4wC3CYCb4KTAp1YgFXDoTK5rYsXZf7doORfbB4Wo2Geak8zZ3Ctj6yz?=
 =?us-ascii?q?KUY/Skwf57+jmD+7O288t5ywFJICKWQSmNztM5Rsb/6MrX0mAMaiqnXSxMJK?=
 =?us-ascii?q?mOXOv/TfDAK/PeyUzmaZBMS9jzhS535KfsL+LIidI6V/82IZV3nCeBBNd0gG?=
 =?us-ascii?q?cHfDWIoZPgyIx3Rsf/L7mSV/hfsRfEVkJSdOPlOQ+Zvdh7ifisn6KAuVBIR8?=
 =?us-ascii?q?vPCm75WeTR1wbkOezjx1BB62r/quyYITaqcTmUo0HCXuMoXtQwP88OIrIIDp?=
 =?us-ascii?q?Rhm59W8e1EbtC6a5qthNU/oA/QFpSPM/N4NxbaX5hFoKDPCSM4Z2Ubal9fwH?=
 =?us-ascii?q?z6AuEaGUkuIObjLUw6McbT4A4rMfQFEJJ72Zh/R1FwF4fhvyVENtGuvEsVm3?=
 =?us-ascii?q?LiFATMXU/0+Kv6Nk8N1LCB1Rg1GsFC3c0JoH8c1wjXtliNL+e5NwpyY1MyGC?=
 =?us-ascii?q?9sCv02Vv5BgxzvSAC1XUIJwE7eEYvcqDIHBdMUfI8g1Edx2K66Jka9VCPzru?=
 =?us-ascii?q?OZccbwkdFzlu9kZKNbJCYrHZ9V0U9Rvu2th0au2XtRYpOIP9e3rTvcJFfS35?=
 =?us-ascii?q?h0C5fhKS6WF2QgB+P7LhWNz5xj+/7JFjkw374BLtAeMXElA0hjNgwMDhCm/D?=
 =?us-ascii?q?ktRX67LRONY31YwHcYmzNb1pe/dko9hLkBY7ohniN4hqTVB7fnYgghQZYdG6?=
 =?us-ascii?q?idcB3NJLqhyXh//4XjIU0aAVkIaMphbY8+rcb+ZaeImqs685KiUmkhWEDANI?=
 =?us-ascii?q?/yMKfxgzDDL56CaafHnKFDlUayzFy7Ce7CJhOqrAn2/yQuaddpOW0u5e2RXf?=
 =?us-ascii?q?kEDbz5XmETE1IusXCL29hSDOrmlN0G47ETsjXNx3Xg1Mp7WGTQEgXktEuNvC?=
 =?us-ascii?q?u02TfntYgQsF4UAucQbsmOL+IxF9WVYy4ldNnBcuUKDDbS8BchkIM/2SDp2W?=
 =?us-ascii?q?kzJQkuOk2Jw6xc6fBLEnGPrbzz9De0FoCpnLdh2XbsfPgK91oOSc2tITdXVf?=
 =?us-ascii?q?+G1oJEaTbbTGbmtomMLz9c046Zg5cF9tqo7Ii2V49R8+raDA0vRZCUWRpwSp?=
 =?us-ascii?q?Re3IjjO1ZQnlDGXcGl0dzCJadXkCvERfXkpuz8QU2v5m8Y4F8DkJ9ahWfSPy?=
 =?us-ascii?q?tBeMRGxL2yiaEihMsDhNhzMd5g+NDMRWS7jqD+JB9+39K/V8mOmCfDEnIziI?=
 =?us-ascii?q?1n/HhZQluwDJqUuaQ2rWcfmP4ZDHEPhNVLUb7+AvTc952z00DvrsvJBWy7cb?=
 =?us-ascii?q?CsKoLz/35xJrcdDb4IoM1yC+GENw2houTFVmF9nZZgFmkfv+13Co8mfF8/GJ?=
 =?us-ascii?q?LV+Vwb3XDPq+wyuEAqArT9hkCgNdVENS5MJHfhpOTu/nYj4DOoxrCMtkbkxK?=
 =?us-ascii?q?WWlJBqUJoddJtSQFXgvDNoQi+W+vZ06XtwRlc2jgtP3ffr3yIdu3QbVL0xmM?=
 =?us-ascii?q?IHH37Ke+ibITmTsC/o3ycNSfl73A+kz9vOKkHPpdH1Cwe7XNJ7C6nx15hg3U?=
 =?us-ascii?q?/gM2uoqpYgPg2NeGEHPbnDnyGe/u3g+Kxgf8d2SpvoQLC+ZI8QVo0dprDD4J?=
 =?us-ascii?q?tN1ok1IIL08aKLYoEzHpF+5Gi3D/zYZj2YRFD7zoIM6HJ3y+vQO3sw3H6jhU?=
 =?us-ascii?q?T238mZ+9MSx0hqaM0yET7vS2KBl6tAJnFWLHqRg/7mg2VtJzLs2zX2/w3Xvp?=
 =?us-ascii?q?omstWoqmiaJSL2/nR8mmlQaPRAgk02kIyx9b1kggFMXvR71Jf7O3Q3WIpeW9?=
 =?us-ascii?q?Q4s/k7/r/s3D5M9VlEFMe5vs4lHEUGaWor5KMssqckQBgWF0gteoRE3cT1YZ?=
 =?us-ascii?q?De5V3c2/grNwacIVtfcpQ02tETUhg1PH+kxn2K88H3g6ygFVOpbelRvGRjL+?=
 =?us-ascii?q?HYPcNM448t7UWmyCsUh/QMjQHYZqZkJ0oMNTlhVEPfJ1RQxJ62CRFPlppbjd?=
 =?us-ascii?q?g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208";a="77264605"
Date: Wed, 3 Aug 2022 12:25:32 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [PATCH v1 3/7] tools/ocaml/*/dune: dune based build system
Message-ID: <YupbLL8mYTK3427v@perard.uk.xensource.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <0f2c08734668626a618767680493a006827e123b.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f2c08734668626a618767680493a006827e123b.1659116941.git.edvin.torok@citrix.com>

On Fri, Jul 29, 2022 at 06:53:26PM +0100, Edwin Török wrote:
> Based on Christian Lindig's work.

Should we have is "Signed-off-by" tag then? Also he might be the author
of the patch, isn't it?

> Initially this will be used to build unit tests, and to make development
> easier.
>
> Dune supports proper incremental builds and editor integration with
> merlin/LSP.
> 
> For now the Makefile based build system is retained too: this is not a
> hard dependency on Dune.
> 
> Using version 2.1 of Dune build language here, because that is the one
> available in Ubuntu Focal (part of the CI here).
> 
> No functional change.
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> ---
>  create mode 100644 tools/dune
>  create mode 100644 tools/dune-project

Should this two new "dune*" files be added to MAINTAINERS in the OCAML
section?

> diff --git a/tools/.gitignore b/tools/.gitignore
> new file mode 100644
> index 0000000000..c211749a3b
> --- /dev/null
> +++ b/tools/.gitignore
> @@ -0,0 +1,7 @@
> +dune-workspace*

Is this file going to be in many subdirectory or just in tools/ ? You can
prepend a slash to tell git to ignore this file only in this directory.

> +_build/

Is this where dune is going to do out-of-tree build by default? Also, is
this only going to be in tools/_build/ ?


> +.merlin
> +*.h.gch
> +*.opam
> +ocaml/*.install
> +include/_xentoolcore_list.h

That last line doesn't seems related to dune, why is it in this patch?

Also, can you sort the lines in this .gitignore?

Thanks,

-- 
Anthony PERARD


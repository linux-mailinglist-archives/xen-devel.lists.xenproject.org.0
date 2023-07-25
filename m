Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D61761C17
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569748.890778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJHN-0000Nd-4K; Tue, 25 Jul 2023 14:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569748.890778; Tue, 25 Jul 2023 14:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJHN-0000Ln-1I; Tue, 25 Jul 2023 14:44:49 +0000
Received: by outflank-mailman (input) for mailman id 569748;
 Tue, 25 Jul 2023 14:44:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Hqi=DL=citrix.com=prvs=563c090bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOJHK-0000Lc-RT
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:44:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab3d4ba-2af9-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 16:44:45 +0200 (CEST)
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
X-Inumbo-ID: cab3d4ba-2af9-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690296284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Na0Hb4IZHzXLvF3oz0irvk2SPKT81dw3L53qPjmZfeg=;
  b=PT3HjjAU13bHYq7WSGjPnmzdLx+/Zf8D4twdBk9vpCxHXctGlWOE7FAV
   xarzuIvWmyNwq3TI/q4pzpFOoiI9W1RQlwbm/Wspy2+wlDJAS+V618u4h
   kl4aAfgpBfIHEpCTlWPe5xOo8rPrOypGabWfEIjmVLyHveL/0rasOVxcG
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116075324
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:nQR8IKKPPZe9+HyFFE+RwpUlxSXFcZb7ZxGr2PjKsXjdYENS3mAAn
 WZJCzuEM66CZzPyfdByYY2zpBgH65SExtBkTwBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c56Gzlx0
 ewFCQkhLQutosmm6rSce+pz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJsNwRvD/
 D6uE2LRLDoGNoymxSu+wHP21r7lsznncowrLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l4qjb+QGCHUAfUyVMLtchsaceTCQnz
 FaTk/v1BDZkt/ueTnf1y1uPhWrsY25PdzZEPHJaC1JfuLEPvb3fkDrCVI5cNL6or+TZWire5
 huahi4ZtrYM2JtjO7qAwbzXv969jsGXH1ZvuV+MAzvNAhBRP9D8OdHxgbTPxbMZddvCEAHc1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuKGpxeEdMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QfOsIrL1PXo301OSZ8OlwBdmB2ysnT3
 r/CL66R4YsyU/w7nFJauc9AuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmreFY/RjtxW6OKkdvMueVNxsxoqwsBx
 VnlMmcw9bY1rSavxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:VIBLcq+WI4WKHu5nSZVuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3AbHS9C2pEvyYZFZejJ0JZzg3mUc0/KkL53GrxGmP?=
 =?us-ascii?q?7EkhMY62/T3ih+7wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AIXkvTg+udW0sUULy8MEpVIyQf+lD/6b+MUwcqqc?=
 =?us-ascii?q?H4ZnVHwJqJx2TtQ3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="116075324"
Date: Tue, 25 Jul 2023 15:44:29 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v4 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Message-ID: <e906e798-fc5b-49c5-bf18-f2e07912a7a8@perard>
References: <20230725130558.58094-1-roger.pau@citrix.com>
 <20230725130558.58094-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725130558.58094-4-roger.pau@citrix.com>

On Tue, Jul 25, 2023 at 03:05:55PM +0200, Roger Pau Monne wrote:
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index 3c8b2a72c0b8..dd97699bbde7 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -592,17 +641,32 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
>  {
>      int i, size;
>      struct xc_xend_cpuid *l;
> +    struct xc_msr *msr;
> +    const libxl__json_object *co;
>      flexarray_t *array;
> +    bool cpuid_only = false;
> +
> +    if (libxl__json_object_is_array(o)) {

I think a comment here would useful to point out that we are parsing the
format from previous version of Xen.

> +        co = o;
> +        cpuid_only = true;
> +        goto parse_cpuid;
> +    }

Otherwise, the patch looks good now:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


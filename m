Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E9475FDA2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 19:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569185.889500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzKl-0006aD-D7; Mon, 24 Jul 2023 17:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569185.889500; Mon, 24 Jul 2023 17:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzKl-0006XQ-9U; Mon, 24 Jul 2023 17:26:59 +0000
Received: by outflank-mailman (input) for mailman id 569185;
 Mon, 24 Jul 2023 17:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GZnG=DK=citrix.com=prvs=5629cf0ab=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qNzKj-0006Eq-IB
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 17:26:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36ca2ee4-2a47-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 19:26:26 +0200 (CEST)
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
X-Inumbo-ID: 36ca2ee4-2a47-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690219614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YHFhvsy4inb7+yvCsMm7kRjZYDroMm2BRJqX9tJyNqw=;
  b=bzwBSxpbxZB9UzrfyYe6EnFXS+CM5R8YWbvqos4+e89yxZhKXzhm/I6o
   tIhJBJ8giTgXabATZpDG9vCEIJCu6nEAaEPJHH8Ub11Ofzpj1IQAoNfhE
   Z0gR9hGby0jTwhHOslJb0Jye3R/29oO7tjoP7/I1L4LgDycw7Hzx47U5D
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117134229
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:nhTAh6BDGBz0NhVW/zzjw5YqxClBgxIJ4kV8jS/XYbTApGx33mEHn
 DAcDDrTbvfcYWvweo93bIqy90sDuZXRyNAyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC5QRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpcx9XDxD7
 /ghOjFRVAyqu+K17KCBc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XVHJ4JxBzJz
 o7A11zUXwtLBtfG8yLf3yr1msDevC36YZ1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gCmPxbDT+B2xHXUfQ3hKb9lOnMYuSCYjz
 FOhg9LjDjspu7qQIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8b0TjFE4tuCqqMnNypIy3Z/
 zCJgDoEvuBG5SIU7JlX7Wwrkhr1+MmRF1Vpu12PNo62xlgnPdD4PuRE/XCetK8dd9jBEzFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sx28zaK7ogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKP4IXOccrKFLWpHoGiausM4fFyRZErE3CE
 c3DLZbE4YgyVMyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCf9dFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcut9JcILbfZeVsO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:hiU7va2FRLX+53dq6noC1wqjBKckLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWftN98YhwdcKm7Scu9qCrnhPtICOoqXItKPjOIhILAFugL0WKI+VPd8kPFmtK1uJ
 0QEJRDNA==
X-Talos-CUID: 9a23:5Kru8m+IrhoitIGvZy+VvxE+EJ14f2fZ9WXRf3WkIFppS5GHc2bFrQ==
X-Talos-MUID: 9a23:oCUWNAt0DAcVysCL2c2nvBw/LpZa6P2UEBogycwalNilOy1JJGLI
X-IronPort-AV: E=Sophos;i="6.01,228,1684814400"; 
   d="scan'208";a="117134229"
Date: Mon, 24 Jul 2023 18:26:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v3 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Message-ID: <022263eb-e10d-4e76-8fdc-2f64ecbb347d@perard>
References: <20230720082540.69444-1-roger.pau@citrix.com>
 <20230720082540.69444-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720082540.69444-4-roger.pau@citrix.com>

On Thu, Jul 20, 2023 at 10:25:37AM +0200, Roger Pau Monne wrote:
> ---
> It would be nice to rename the json output field to 'cpu_policy'
> instead of 'cpuid', so that it looks like:
> 
> "cpu_policy": {
>     "cpuid": [
>         {
>             "leaf": 7,
>             "subleaf": 0,
>             "edx": "xx1xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
>         },
>         {
>             "leaf": 1,
>             "ebx": "xxxxxxxxxxxxxxxx00010000xxxxxxxx"
>         }
>         }
>         }
>     ],
>     "msr": [
>         {
>             "index": 266,
>             "policy": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1xx1x1"
>         }
>     ]
> },
> 
> Sadly I have no idea how to do that, and can be done in a followup
> change anyway.

I don't think that would be possible. I think that would mean renaming
the field in "struct libxl_domain_build_info", and changing a fields
name seems complicated.

> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index 3c8b2a72c0b8..68b797886642 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -592,17 +641,24 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
>  {
>      int i, size;
>      struct xc_xend_cpuid *l;
> +    struct xc_msr *msr;
> +    const libxl__json_object *co;
>      flexarray_t *array;
>  
> -    if (!libxl__json_object_is_array(o))
> +    if (!libxl__json_object_is_map(o))
>          return ERROR_FAIL;

We still need to be able to migrate a VM from a previous release of Xen,
and we are going to have an array instead of a map. Could you try to
handle both the old and new format of "cpuid"? If we don't then the
scenario "migrate then reboot" is going to fail to use the expected cpu
policy.

> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 9e48bb772646..887824fdd828 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -19,7 +19,7 @@ libxl_mac = Builtin("mac", json_parse_type="JSON_STRING", passby=PASS_BY_REFEREN
>  libxl_bitmap = Builtin("bitmap", json_parse_type="JSON_ARRAY", dispose_fn="libxl_bitmap_dispose", passby=PASS_BY_REFERENCE,
>                         check_default_fn="libxl_bitmap_is_empty", copy_fn="libxl_bitmap_copy_alloc")
>  libxl_cpuid_policy_list = Builtin("cpuid_policy_list", dispose_fn="libxl_cpuid_dispose", passby=PASS_BY_REFERENCE,
> -                                  json_parse_type="JSON_ARRAY", check_default_fn="libxl__cpuid_policy_is_empty",
> +                                  json_parse_type="JSON_MAP", check_default_fn="libxl__cpuid_policy_is_empty",

Maybe we should have json_parse_type as either "JSON_ARRAY | JSON_MAP"
or just "JSON_ANY" since nothing beside libxl is supposed to do
something with it, and when migrating from a previous version, we are
going to have an array.

I don't think anything is using json_parse_type for this
libxl_cpuid_policy_list, so I don't think it matter which type we use.


Thanks,

-- 
Anthony PERARD


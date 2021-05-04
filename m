Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F52372D31
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 17:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122532.231093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxCw-0000OS-GZ; Tue, 04 May 2021 15:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122532.231093; Tue, 04 May 2021 15:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxCw-0000O3-D7; Tue, 04 May 2021 15:43:34 +0000
Received: by outflank-mailman (input) for mailman id 122532;
 Tue, 04 May 2021 15:43:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldxCu-0000Ny-GT
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 15:43:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 353851e9-a008-44b6-a43e-7882a7291ca8;
 Tue, 04 May 2021 15:43:31 +0000 (UTC)
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
X-Inumbo-ID: 353851e9-a008-44b6-a43e-7882a7291ca8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620143011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CG6+lS2YOn+LnO07Bj9wm8DHIYJ974yHNLOjiagM7kY=;
  b=YLCyjw7m9XUO394dIhhMfddO5Y0ZVXH2DKS118KrgAT2TB6kD2IBUX2X
   ehTF4c4dCMRLq+9Af2L0+Pb1NauNbm7kIFaewkBPYlhAbAud7A3JsyXdB
   xLIdAeMhabQbxgZJvSu0ObhVNqesbZSqrHk7D2zGDq+dioVZmsX3MnBF4
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HdnusMnvgV1Hhh3dubwoBwLGhDz+q3r6GjigUP/pZ3Kh1++xV9ZwKN3/eMKjbA5i10B7TNwbED
 Ol8LswLekaoQFuLQsrjDD0CBJm0fw/mc7jInnpPKteziUrDqQtBiZEYPE6mMjGqrk4nc32kK5V
 +ZbaCg56nA8771CmwuwEpdSqnYgtOUSiIJmaYGRswFxtntKirOCqX5dQqtkmF9BInyUtLnUxZF
 GKMubgrpsW+Ta5QK4gw6hO0dpRJtARd3Hym1RztW5z3VbumXRBNth7jbQOlArCp0JQxCjBWxXA
 ugk=
X-SBRS: 5.1
X-MesageID: 43050826
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wa48pqEa1OciuhDypLqFH5HXdLJzesId70hD6mlYQxZYa9Hdss
 iokugS2xOcskdpZFgLs7m7VpWoa3Xa6JJz/M01NbCtQAHptAKTXflfxKHlxCDtHDC7y/5F2c
 5bAtZDIfD5EFQSt7ee3CCWCNAlqePqzImJgqPkw25pXUVWbchbnmFEIyK6NmEzewVcH5o+E/
 Onl7t6jh6tY24eYMj+JlRtZZmmm/TxmJjrYQELCnccgWHk516VwYX3HBSC0hAVXykn+8ZEzU
 H+nwv16r7LiYDY9jbny2TR455K8eGB9vJ/BdeBgsVQCjLghhfAXvUDZ5S+vSs4qOzq1VAykN
 OkmXcdFvl0gkm/QkiF5T/WnyjpynIH9mLrw17wuwqZneXJABYBT/dnqa0cWB3D8EYktMx7y8
 twrhiknqsSNjnhpmDU7cXJURYCrDvFnVMy1eoIy3BPW4oXb7Fc6YgS5llcHpsbECXm84w/C+
 V1AMbA5PFZbEOCYxnizxRS6c3pWm52EgaNQ0AEtMDQziNfm2phyVAEgMMFmHMN8488VolE6+
 zIPr8ArsAzcuYGKaRnBOkARsOrCmvCBRLUWVjiXmjaKA==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43050826"
Date: Tue, 4 May 2021 16:43:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <george.dunlap@citrix.com>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC v2 5/7] libxl: add device function definitions to
 libxl_types.idl
Message-ID: <YJFrn7+4AQt7K2Fa@perard>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
 <2cd96b7e884c6f0c2667ef7499ff7179b99ea635.1614734296.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2cd96b7e884c6f0c2667ef7499ff7179b99ea635.1614734296.git.rosbrookn@ainfosec.com>

On Tue, Mar 02, 2021 at 08:46:17PM -0500, Nick Rosbrook wrote:
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 5b85a7419f..550af7a1c7 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -666,6 +668,24 @@ libxl_device_vfb = Struct("device_vfb", [
>      ("keymap",        string),
>      ])
>  
> +libxl_device_vfb_add = DeviceAddFunction("device_vfb_add",
> +    device_param=("vfb", libxl_device_vfb),
> +    extra_params=[("ao_how", libxl_asyncop_how)],
> +    return_type=libxl_error
> +)
> +
> +libxl_device_vfb_remove = DeviceRemoveFunction("device_vfb_remove",
> +    device_param=("vfb", libxl_device_vfb),
> +    extra_params=[("ao_how", libxl_asyncop_how)],
> +    return_type=libxl_error
> +)
> +
> +libxl_device_vfb_destroy = DeviceDestroyFunction("device_vfb_destroy",
> +    device_param=("vfb", libxl_device_vfb),
> +    extra_params=[("ao_how", libxl_asyncop_how)],
> +    return_type=libxl_error
> +)
> +
>  libxl_device_vkb = Struct("device_vkb", [
>      ("backend_domid", libxl_domid),
>      ("backend_domname", string),

In future version of the series that is deem ready, I think it would be
useful to have this change in libxl_types.idl and the change that remove
the macro call from the C file in the same patch. It would make it
possible to review discrepancies.

The change in the idl for vfb is different that the change in the C
file:

> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -723,8 +723,6 @@ static LIBXL_DEFINE_UPDATE_DEVID(vfb)
>  static LIBXL_DEFINE_DEVICE_FROM_TYPE(vfb)
> 
>  /* vfb */
> -LIBXL_DEFINE_DEVICE_REMOVE(vfb)
> -
>  DEFINE_DEVICE_TYPE_STRUCT(vfb, VFB, vfbs,
>      .skip_attach = 1,
>      .set_xenstore_config = (device_set_xenstore_config_fn_t)

No add function ;-)

And libxl doesn't build anymore with the last patch applied. They are
maybe also issues with functions that are static and thus are not
accessible from other c files.

Cheers,

-- 
Anthony PERARD


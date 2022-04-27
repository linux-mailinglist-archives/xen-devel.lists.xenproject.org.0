Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48BB511861
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315055.533396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhmO-000710-TX; Wed, 27 Apr 2022 13:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315055.533396; Wed, 27 Apr 2022 13:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhmO-0006xP-Q5; Wed, 27 Apr 2022 13:32:28 +0000
Received: by outflank-mailman (input) for mailman id 315055;
 Wed, 27 Apr 2022 13:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y66U=VF=citrix.com=prvs=1094d0c61=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1njhmN-0006tm-4C
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:32:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7899e4f4-c62e-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 15:32:26 +0200 (CEST)
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
X-Inumbo-ID: 7899e4f4-c62e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651066345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wrwKGNtKYufMgXXR3VkOrkrXHZN+6wnoyHeHuiDPaMA=;
  b=gDAxpkbPsiELuajgQrmkh2nAzlir9AjtKnG91s7C0g1am5kqPnB7SF8x
   9exebuoQNGU/IWqwYPDwt9EMuRXRiOChGYMbWjI5L7B3XDdsJzyOLFDH1
   rp6QtedbquT8bhK1XtrrcUItI9fsBSy2MSqJJpyXrv7HjPUgTU/yj4CEa
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69441042
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EGQwGqMWh3Ujq7/vrR2jl8FynXyQoLVcMsEvi/4bfWQNrUoq1TMAz
 GseXm6DOPuJYzSgLo13b4qx/EhUvJHWztc3QAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 Y9wjq2pa10QD6juvcsHXidXAzFfFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQTKqCP
 pJFM1KDajzZIF4UGQZMUaljs/64wX/fLRRghXKa8P9fD2/7k1UqjemF3MDuUsSGWN9Pl0CEj
 mvD9nb+BFcRM9n34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/C8h1X7S99ZA
 0AV/CUxpKw2skmmCMT+NyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEApFAN6WcUE7vYHQB4P+
 UWEodz5FR1G5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A715Zj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMulGrhlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG0O
 B6I5VkJu8QIZhNGiJObhKrrVawXIVXIT4y5Bpg4kPITCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnDO7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGKr95OdQxacSlT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:Rs3h3KHQq78Z7RpJpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="69441042"
Date: Wed, 27 Apr 2022 14:32:20 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: James Dingwall <james-xen@dingwall.me.uk>
CC: <xen-devel@lists.xenproject.org>, <pdurrant@amazon.com>
Subject: Re: [PATCH] fix invalid frontend path for set_mtu
Message-ID: <YmlF5OyrcxwcKwUz@perard.uk.xensource.com>
References: <20220301093513.GA3187840@dingwall.me.uk>
 <YlV4lXZHz52xPBzt@perard.uk.xensource.com>
 <20220419120418.GA232637@dingwall.me.uk>
 <YmkKGVa1NeKBQV9M@perard.uk.xensource.com>
 <19d42d2f0981f0187508612011b847af@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <19d42d2f0981f0187508612011b847af@dingwall.me.uk>

On Wed, Apr 27, 2022 at 02:20:53PM +0100, James Dingwall wrote:
> commit f6ec92717522e74b4cc3aa4160b8ad6884e0b50c
> Author: James Dingwall <james@dingwall.me.uk>
> Date:   Tue Apr 19 12:45:31 2022 +0100
> 
>     The set_mtu() function of xen-network-common.sh currently has this code:
>     
>             if [ ${type_if} = vif ]
>             then
>                 local dev_=${dev#vif}
>                 local domid=${dev_%.*}
>                 local devid=${dev_#*.}
>     
>                 local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"
>     
>                 xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
>             fi
>     
>     This works fine if the device has its default name but if the xen config
>     defines the vifname parameter the FRONTEND_PATH is incorrectly constructed.
>     Learn the frontend path by reading the appropriate value from the backend.
>     
>     Also change use of `...` to $(...) for a consistent style in the script.
>     
>     Signed-off-by: James Dingwall <james@dingwall.me.uk>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks!


> diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
> index 42fa704e8d..7a63308a9e 100644
> --- a/tools/hotplug/Linux/xen-network-common.sh
> +++ b/tools/hotplug/Linux/xen-network-common.sh
> @@ -171,7 +171,7 @@ set_mtu () {
>      local mtu=$(xenstore_read_default "$XENBUS_PATH/mtu" "")
>      if [ -z "$mtu" ]
>      then
> -        mtu="`ip link show dev ${bridge}| awk '/mtu/ { print $5 }'`"
> +        mtu="$(ip link show dev ${bridge}| awk '/mtu/ { print $5 }')"
>          if [ -n "$mtu" ]
>          then
>              log debug "$bridge MTU is $mtu"
> @@ -184,11 +184,7 @@ set_mtu () {
>  
>          if [ ${type_if} = vif ]
>          then
> -            local dev_=${dev#vif}
> -            local domid=${dev_%.*}
> -            local devid=${dev_#*.}
> -
> -            local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"
> +            local FRONTEND_PATH="$(xenstore_read "$XENBUS_PATH/frontend")"
>  
>              xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
>          fi


-- 
Anthony PERARD


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D5244886
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 12:58:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6XPK-00015H-7p; Fri, 14 Aug 2020 10:57:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5ir=BY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1k6XPI-00014l-IZ
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 10:57:56 +0000
X-Inumbo-ID: e1c40e9a-a8a2-4b9e-83b7-47232eecfaa4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1c40e9a-a8a2-4b9e-83b7-47232eecfaa4;
 Fri, 14 Aug 2020 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597402674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=31l2HldFl0pZPK28TDX836iLY0c5NMOoihCVtwlb+Zo=;
 b=WjxcKz3kSsHpaCUc9ijUhj2/BGWqFIU2iG9WqKz7uZCVj02dCnqhlMPD
 t0TJZPalFR8NWyM8BVI2Iw/d4pXjAqi9ezXy/hOQbd0bzsELAZBvqet38
 JFDhektaDrEtewS3BWLuSQ76o9lKWZjCpgLZx3X56ZkUwH703WPN7eZ9J o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eqTRsXuYgNuwx9JlItzKOP8viDkL7CK5jVLCFdqipUezUa/+Q6cG8K62iv9gLA/uOaeSeE22e4
 ALe/qs4+rZf9UT7VMY9axsgJqJ+WRzc11s/wgn1NYUGw4Z4Wzdu8Lpatm0IrKYbjFdmstmcgt+
 3zk45Q3nzoacHZimx5BUmndTCW/ZVxAU/1Lh2ZaI83ltY9U6g9iaon9rJ4gxsxU5Mb7q7MZN9+
 S1xgIRlV6g2E9yE6iasVp4NDyPCO+qWs+I3T9Q8VmhuEuJa/jxdzKOJccLuixMxPDKShU/0sWB
 RWw=
X-SBRS: 2.7
X-MesageID: 24546995
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,312,1592884800"; d="scan'208";a="24546995"
Date: Fri, 14 Aug 2020 11:57:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <george.dunlap@citrix.com>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 2/2] libxl: prototype libxl_device_nic_add/remove
 with IDL
Message-ID: <20200814105747.GE2024@perard.uk.xensource.com>
References: <cover.1595854292.git.rosbrookn@ainfosec.com>
 <b7313e96b6865bb13b221720a437c6e2ac57140c.1595854292.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b7313e96b6865bb13b221720a437c6e2ac57140c.1595854292.git.rosbrookn@ainfosec.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 27, 2020 at 09:26:33AM -0400, Nick Rosbrook wrote:
> Add a DeviceFunction class and describe prototypes for
> libxl_device_nic_add/remove in libxl_types.idl.
> 
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> --
> This is mostly to serve as an example of how the first patch would be
> used for function support in the IDL.
> ---
>  tools/libxl/idl.py          | 8 ++++++++
>  tools/libxl/libxl_types.idl | 6 ++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/tools/libxl/idl.py b/tools/libxl/idl.py
> index 1839871f86..15085af8c7 100644
> --- a/tools/libxl/idl.py
> +++ b/tools/libxl/idl.py
> @@ -386,6 +386,14 @@ class CtxFunction(Function):
>  
>          Function.__init__(self, name, params, return_type, return_is_status)
>  
> +class DeviceFunction(CtxFunction):
> +    """ A function that modifies a device. """

I guess that meant to be used by all function generated with the C macro
LIBXL_DEFINE_DEVICE_ADD() and LIBXL_DEFINE_DEVICE_REMOVE(), isn't it?

I wonder if if we could get away with the type of device ("nic") and the
type of the parameter (`libxl_device_nic`) and have DeviceFunction been
a generator for both `add` and `remove` functions (and `destroy`).

Also there are functions like libxl_devid_to_device_nic() aren't those
of type DeviceFunction as well ? But they don't takes any `ao_how`.

There is also `libxl_device_nic_list{,_free}`, but it is to handle a
list of libxl_device_*, so it could be kind of related to DeviceFunction, but
not quite. But maybe I'm going to far :-).

> diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
> +libxl_device_nic_add = DeviceFunction("device_nic_add",
> +    ("nic", libxl_device_nic))
> +
> +libxl_device_nic_remove = DeviceFunction("device_nic_remove",
> +    ("nic", libxl_device_nic))
> +

Thanks,

-- 
Anthony PERARD


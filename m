Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4CC6C6626
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513779.795298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIma-0005iE-MU; Thu, 23 Mar 2023 11:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513779.795298; Thu, 23 Mar 2023 11:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIma-0005fR-JO; Thu, 23 Mar 2023 11:07:00 +0000
Received: by outflank-mailman (input) for mailman id 513779;
 Thu, 23 Mar 2023 11:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8edK=7P=citrix.com=prvs=439de8c1e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfImY-0005fL-NQ
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:06:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d21ee2f5-c96a-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 12:06:56 +0100 (CET)
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
X-Inumbo-ID: d21ee2f5-c96a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679569616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=szxHWg5PaGHacRUxOzdsxpFjzap0lp1Q1iAMqJ7ffLE=;
  b=KtF3y6PK2/QbCJFd5PwS7QJL0N6MZky6ittmTkTGXAM46SsDFi+3Pw8K
   xJsLUMQgKKCEUE5zOKYZspqcX76WUOO8/n9zpma8n69pMIkNuhVlM27YN
   YQDiAjZGe6NIRb2ULHLOQOo1zjFyPVK2IHrbvhL0G/vVxdXJHz9Fr6S8l
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 104419328
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:trZRSKA2+rqYpBVW/w/jw5YqxClBgxIJ4kV8jS/XYbTApDh0hDVVy
 zAZCGqHb67YMzamLowgYYu/pk0GvZbXm4c2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC5QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9Nh+DFBH8
 dojJQsIUB+l3bKUn5Ojc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TWGZwExRzIz
 o7A1zT2IRgUNMC98zOm2GqijczyzAakB6tHQdVU8dY12QbOlwT/EiY+V1ShpuKiolWjQN8ZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neWm/v5CDopt6eaIVqU7rqOpCm+ETQUJ2QFIyQDSGM4D8LL+d9pyEiVF5A6TfDz14eucd3t/
 9yUhCYAjrgihMot7KiA+G7IpWj8hMfoVjdgs207QVmZAhNFiJ+NPtL3uAOFsKYZd+51XXHa4
 iFaxpH2APQmSMjUyXfTGLhl8KSBva7tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JiCN/Ufj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhd9zPhnY
 M3BIZn3ZZr/NUiA5GTeegvg+eVzmnBWKZ37HPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnTg5B
 +13bpPQoz0GCbWWSnCOoeYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6eh8JtE1zvQOzbigE
 7PUchYw9WcTTEbvcW2iAk2Popu1Bf6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:KLOKzq41K2kt6QtM2gPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="104419328"
Date: Thu, 23 Mar 2023 11:06:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 1/5] tools: get rid of additional min() and max()
 definitions
Message-ID: <ccc0ebeb-4300-4df5-b5cf-3f4059567eaa@perard>
References: <20230323090859.25240-1-jgross@suse.com>
 <20230323090859.25240-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230323090859.25240-2-jgross@suse.com>

On Thu, Mar 23, 2023 at 10:08:55AM +0100, Juergen Gross wrote:
> Defining min(), min_t(), max() and max_t() at other places than
> xen-tools/common-macros.h isn't needed, as the definitions in said
> header can be used instead.
> 
> Same applies to BUILD_BUG_ON() in hvmloader.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


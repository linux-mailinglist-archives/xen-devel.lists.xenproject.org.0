Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBE42A73F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207296.363071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIol-0002dn-4H; Tue, 12 Oct 2021 14:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207296.363071; Tue, 12 Oct 2021 14:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIol-0002c0-15; Tue, 12 Oct 2021 14:31:47 +0000
Received: by outflank-mailman (input) for mailman id 207296;
 Tue, 12 Oct 2021 14:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tock=PA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1maIoj-0002bu-GX
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:31:45 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f20046d-2b69-11ec-812e-12813bfff9fa;
 Tue, 12 Oct 2021 14:31:44 +0000 (UTC)
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
X-Inumbo-ID: 1f20046d-2b69-11ec-812e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634049104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MBrbwQMGHzNokWHhDM1T2+lCJW7y+/uZ0c5p5B8LL/g=;
  b=QHa8inzc699qzDl1ITn985AYDDdRU+qbybCyXmejYLszqg+cizL7kxMr
   tlJBV4IfH9XbeOpPW7dTHutfDbMkKeqs/hsA84Uj/i0Ji3GB3aAifCIVa
   LWwHj/AW2hNyjfLpegMGcuJRiJ5lzcybLt5B7tJr7NbXkILxcTxrypKKO
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +jZ2SpFyoidCyXWXZ+PCGJqEnlGPwRIlziQeAjVkCFWLEstTExLy11T7F882rjq2PeUpd0TJVk
 AnNGy9YmjB8MOt5JIzAmDJ3CgK8V/ziJZUiEqwr+pQnQiQlVI/9yG5t/9mmz0Wj4SvfiVIMfjs
 mnqGIvZ9/bv4vqaF+wvbNrO4zh7QqFGLHHMQ/yiCbwZNVBSvbG61zYaYUvHp5EKrdosFQIOX9K
 4xNn1IcEkqZakBzUITmGxGuDuw1lnlb+UDk33NCjMDt4VYTMZ7aK/p+FoG0YHBdBmMnkEzJ9/9
 xDb4tdXkVfM8rVIMwd+K5Wdz
X-SBRS: 5.1
X-MesageID: 55020974
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SjdkuqsJ0EPbKApA0LeDUtnSmefnVF1YMUV32f8akzHdYApBsoF/q
 tZmKWuOb6yNajD8ctojb4q19ExTuJKExoJmQVRlqSA0Qy4X+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29cw2ILhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl8reXFT8QA4/wquFaTiRVEgxdE5FWweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DO
 pJDMWswMHwsZTURCH4WNqM/o9yXxSH1cQdRtGOFqYw4tj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS30z2e+GirgezJtSr6XowVD7CzsPVthTW72Wg7GBAQE1yhrpGRgEOkR8hWL
 UBS/yM0tLUz72SiVNy7VBq9yFa6uRobV8tVAvcNwgiHwarJ4C6UHmEBCDVGbbQOuMYoSBQw2
 1SOntevAiZg2JWUVnC15rqStSm1OyUeMSkFfyBsZRsI5ZzvrZ8+ijrLT81/C+ilg9vtAzbyz
 juW6i8kiN07iM8A16y/u1fdkT+ojpHTS0g+4QC/dnm+8gpzaYqhZoqpwVvW9/BNKMCeVFbpl
 HoZn8mT6sgeAJfLkzaCKM0PFry04/eOMBXHnEViWZIm8lyQF2WLJN4KpmskfQEwb5hCKWSBj
 FLvVR15o7R0YEOTUI1LUYf2FvknzIXDO+j1b6WBBjZRWaRZeAiC9SBoQEef2WHxjUQh+Z0C1
 YenndWEVilCV/w2pNaib6JEi+Vzn3FhrY/Gbcmjl0zP7FaIWJKCpV7p2nO1Zecl8LjMngzR9
 9tOXydh40QCCLOgCsU7HIh6ELzrEZTZLcyowyC0XrTaSuaDJI3HI6WPqV/GU9Y095m5bs+So
 hmAtrZwkTITf0HvJwSQcWxEY7jyR5t5pn9TFXVyZg35hCdzMdjxsft3m34LkV8PrrILIRlcF
 ahtRil9Kq4XFmSvF8o1PPERU7COhDz03FnTbkJJkRA0foJ6RhyhxzMXVlCHycX6NQLu7ZFWi
 +T5jmvzGMNfLyw/XJe+QK/+lDuZ4ClC8N+eqmOVe7G/jm23q9M0Q8Ew59dqS/wxxeLrn2PAi
 VnNW0tE/IEgYeYdqbH0uExNlK/xe8MWI6aQNzezAW+eOXaI82y975VHVerULznRWHmtoPepZ
 PlPzuG6O/oCxQ4Yv415Grdt7KQ/+9qw+OMKklU6RC3GPwaxF7dtAniaxs0T5KdD8aBU5FmtU
 UWV99gEZbjQYJH5EEQcLRYOZ/iY0a1GgSHb6Pk4eR2o5CJ+8Ledf19VOh2A1H5UILdvadt3y
 uY9os8GrQe4j0NyYNqBiylV8UWKL2ABDPp75s1LXtezh1NymF9YYJHaBivn2721ao1BYhswP
 zuZpKvenLAAlEDMRGU+SCrW1u1HiJVQ5B0TlA0eJ06Ek8buj+Ms2EED6iw+SwlYw0kV0+93P
 WQ3ZUR5Kb/XomVtjclHGWutBxtAFFuS/UmokwkFk2jQTk+JUG3RLTJiZbbRrR5Bq28MLCJG+
 Ly4yXr+VWe4dc786SI+REp5pqGxVtd27ADDxJiqEsnt80PWutY5bntCvVY1liY=
IronPort-HdrOrdr: A9a23:re19RqFUVVlyzVuYpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.85,367,1624334400"; 
   d="scan'208";a="55020974"
Date: Tue, 12 Oct 2021 15:31:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michal Orzel <michal.orzel@arm.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Nick Rosbrook <rosbrookn@ainfosec.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, "David
 Scott" <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH v5 3/3] xen: Expose the PMU to the guests
Message-ID: <YWWcPTdeK3s960i2@perard>
References: <20211012081323.14141-1-michal.orzel@arm.com>
 <20211012081323.14141-4-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211012081323.14141-4-michal.orzel@arm.com>

On Tue, Oct 12, 2021 at 10:13:23AM +0200, Michal Orzel wrote:
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index e356b2106d..2a0234ec16 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -622,6 +623,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>                  create.flags |= XEN_DOMCTL_CDF_nested_virt;
>          }
>  
> +        if ( libxl_defbool_val(b_info->vpmu) )

We don't usually have space between the parentheses and the condition in
libxl.

> +            create.flags |= XEN_DOMCTL_CDF_vpmu;
> +
>          assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
>          LOG(DETAIL, "passthrough: %s",
>              libxl_passthrough_to_string(info->passthrough));
> @@ -1199,6 +1203,12 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
>          goto error_out;
>      }
>  
> +    if (libxl_defbool_val(d_config->b_info.vpmu) && !physinfo.cap_vpmu) {
> +        ret = ERROR_INVAL;
> +        LOGD(ERROR, domid, "vpmu not supported on this platform\n");

You don't need a '\n' here. Also, you could write "vPMU" instead of
"vpmu" in the error message.

Otherwise, changes for libxl and xl looks good:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


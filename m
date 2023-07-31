Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3537696B2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573017.897291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSHp-0007Mx-Oi; Mon, 31 Jul 2023 12:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573017.897291; Mon, 31 Jul 2023 12:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSHp-0007Kg-L6; Mon, 31 Jul 2023 12:46:09 +0000
Received: by outflank-mailman (input) for mailman id 573017;
 Mon, 31 Jul 2023 12:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GapS=DR=citrix.com=prvs=569ba324e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qQSHo-0007Ka-RL
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:46:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 362ebaac-2fa0-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 14:46:06 +0200 (CEST)
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
X-Inumbo-ID: 362ebaac-2fa0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690807566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZDsx+7dK7eVNKtG9oC04HPXrXQEWrqokjiUX1FdE9H8=;
  b=iEaiu0RFFvZENM9FYPUFS1vfcYIY8dmYP/it635K1UB6iKTkzBimvMD8
   HbP830zpielmXqYNU+t1i/CmkuQ+qpj4kN344SkfiQDS2x7b4X7FupGas
   iSLsYycJrhrNt32RX7axtLrwl6capgJUVgEJaa0FYUqeHX8mhWFOmvlbo
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117862139
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:T9n226BMer61cRVW/6jjw5YqxClBgxIJ4kV8jS/XYbTApDIl0jJSm
 mdOC2jSPfiCZmHxKt91YYSyox8D78SAzN9lQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxD5wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+r1JJE1Wz
 MwjAxcuQj/ShKGOx4rlRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XVFZsPxx3Jz
 o7A1zzhPRcXb/iW8hi6/VX12f+IuhvWXKtHQdVU8dY12QbOlwT/EiY+V1a9ur+mi026UtRTJ
 lY8/isopLI1skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQMudUqXzUs2
 hmslsnwGD10mLSPTDSW8bL8hTa7IyNTJ2gEYy4PTCMM+dylq4Y25jrGRdZiFui6k8XpEBn52
 TXMpy87750MieYb2qP9+krI6xquqYLOVRUd/RjMUySu6QYRTK6oYZa5r2fS6/loJZycCFKGu
 RAsktCT9ukUAbmRlSaGR6MGG7TB2hqeGGSC2xg1RcBnrmnzvSf5Jui8/Q2SOm9pafghVSfQU
 HT4niB9y85Qf0OtVfF4NtfZ59sR8UTwKTj0fqmKP4IROcksL1bvEDJGPhDJgT20+KQ4ueRmY
 MrAL57xZZoPIf4/pAdaUdvxxlPCKsoW4WrIDa72wB28uVZ1TC7EEOxVWLdigw1Q0U9lnOk22
 4wFXydy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT9wU6CNm+t9J9Q9w8y5c9skG
 VnkCydlJKfX3yWbeW1mlFg9AF8QYXqPhS1iZnF9VbpZ83MifZyu/M8im2gfJNEaGBhY5acsF
 ZEtIpzQasmjvxybo1zxm7Gh9t09HPlq7CrSVxeYjM8XJMI8HVKUpo+/L2MCNkAmV0KKiCf3m
 JX4viuzfHbJb14K4Br+AB53826MgA==
IronPort-HdrOrdr: A9a23:lzWVQa8Gh1Y2l6PDP5huk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3At8ePGmtCUM5gdCmcT9HKuV7Y6IslKUP44G/pE3S?=
 =?us-ascii?q?TLkVFZ+yWCmeXwP1rxp8=3D?=
X-Talos-MUID: 9a23:9C/AdASlzPY0DHZSRXS0nA5kOZxM6p+MN08qyMoW/O68GChZbmI=
X-IronPort-AV: E=Sophos;i="6.01,244,1684814400"; 
   d="scan'208";a="117862139"
Date: Mon, 31 Jul 2023 13:45:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: <xen-devel@lists.xenproject.org>, <Bertrand.Marquis@arm.com>, Marc Bonnici
	<marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v11 13/14] tools: add Arm FF-A mediator
Message-ID: <1f570857-fad2-46d4-b2d6-992d424e53f3@perard>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-14-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230731121536.934239-14-jens.wiklander@linaro.org>

On Mon, Jul 31, 2023 at 02:15:35PM +0200, Jens Wiklander wrote:
> Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
> guest is trusted to use FF-A.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


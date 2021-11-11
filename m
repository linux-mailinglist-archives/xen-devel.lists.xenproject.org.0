Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77BE44DAD3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 17:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224817.388332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlDLQ-0008UF-OS; Thu, 11 Nov 2021 16:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224817.388332; Thu, 11 Nov 2021 16:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlDLQ-0008RN-KD; Thu, 11 Nov 2021 16:54:36 +0000
Received: by outflank-mailman (input) for mailman id 224817;
 Thu, 11 Nov 2021 16:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6S8D=P6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mlDLO-0008RH-Ei
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 16:54:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 098b19a5-4310-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 17:54:33 +0100 (CET)
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
X-Inumbo-ID: 098b19a5-4310-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636649672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=29ZxmUp5vPwRUOe7SNxx0R4TrgGF7SF8VXfP8zsjLOQ=;
  b=f4r+sQLrNQpnbWdaFZcyqfvHbWYflXwgV1lbmiYnkB5D8BsompQ4PEBR
   PTWa4aAMhj9ZTGR+20BbaKlzjydSy3dLcoI/HkVH6YH8Ktc4bZ9oUnPr+
   HHaYTDtTVtH3+jfQMJ8GDLBry6qUr/plvvuV9kQ6B2MEDxb1sZ7RpQodj
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GHQV3e41xsNjR6AKV56bDqDRByZBtCN2CZVMG3ZNBtL2P5hrVVe0yBte2XfRThidxOtKwDfOsQ
 EngpTwtij+j/ms4IiBq9npmMDmBihWWAJpX1/zvdIUJeCdUd+Jd7xiXGmCTjAar17smv6EwzbT
 Do/soYqVjLtV3ZSToxJrgsv66bZrdRgsYWXkoiiDOZthwa/zjCvWf3NVxRqVVWNAwDq95/ogOC
 qpawllKbGYAJN47P4IO7s13JYDfb5AkTIxsfS44QrO+Lx4TF3xVBNBwdUOobx7YnR2CFIyaRs1
 M5C/aDNa2WulR+2912TxG+p/
X-SBRS: 5.1
X-MesageID: 58011978
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RT8seqBIkLLhYRVW/2Plw5YqxClBgxIJ4kV8jS/XYbTApD4i1jACn
 GBOCGiOPa7cYzb2Lo1xPYmz/RsDusfUm4U1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540Es7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1Wi4ov1S0
 9Jx6LeSbS0gZIncwMQdTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjG9p35ERTZ4yY
 eIWRBY2PDDiaSRzPwZOB9UTndzvpVzgJmgwRFW9+vNsvjm7IBZK+LnyMvLFd9qSX8JXk02E4
 GXc8AzRHBYeM9COzCufxXiljOTPgCDTVZobEfuz8fsCqF+c3GsIEzUNSEC25/K+jyaWRNZ3O
 0ESvC00osAa/kGxUsP0WRH+pXeepwMdQPJZCeh84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXyb6/GKrDCoMC09PW4GZCkUCwAC5rHLopw3jx/JZsZuFuiylNKdMSrr3
 zmAoSw6hrMSpc0GzaO2+RbAmT3Em3TSZldrvEONBDvjt14nIt7+D2C11bTFxagdHbu0bUKGg
 CUvuey05boqHcmtlDPYFY3hA4qVz/qCNTTdh3tmEJ8g6ymh9hafQGxA3N1tDBw3a5hZIFcFd
 GeW4FoMv8ELYBNGeIcuO9rpY/nG25QMAjgMuhr8StNVKqZ8ewaclM2FTR7Bhju9+KTAfExWB
 Ht6TSpOJSpFYUiE5GDvLwv47VPN7nlvrY80bcqrpylLKZLEOBaopU4taTNilNwR4qKeuxny+
 N1CLcaMwBg3eLSgOXeKr99MfQ1VcidT6XXKRyp/L7/rzu1OQjFJNhMs6el5J9wNc1p9yo8kA
 U1RqmcHkQGi1BUr2C2Ba2x5aaOHYHqMhSlTAMDYBn7xgyJLSd/2tM83LsJrFZF6pL0L5aMlF
 JEtJpTfasmjvxyaolzxm7Gm99c8HPlq7CrTVxeYjM8XI8Q9GleXo4C8JWMCNkAmV0KKiCf3m
 JX4viuzfHbJb18K4B/+ZK39wlWvk2Iane4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtH6tIuE7tiwa8kycHoortWklZtEHnRNgz5AbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVN8POqZ1PwSlj3D1tgPIR33tH1t4b6KcUROJB3Q2iZTG6R4bdE+y
 uA7tc9ItwHm0kg2MsyLhzx//niXKiBSSL0us5wXDdO5igcvzV0eM5XQBjWvvcOKYtRIdEIrP
 iWVlOzJgLEFnhjOdH86FH7s2+tBhMtR5EAWnQFaf1nZyMDYgvIX3QFK9WVlRwtY+RxLzuZvN
 zU5LEZyP6iPo29licUrs7pAwO2d6Ml1InDM9mY=
IronPort-HdrOrdr: A9a23:W1uYs6mK6IUdHuXYCWyKHsaeB17pDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="58011978"
Date: Thu, 11 Nov 2021 16:54:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <volodymyr_babchuk@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v2 10/12] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <YY1KwUC7EaJC4vJa@perard>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-11-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1636441347-133850-11-git-send-email-fnu.vikram@xilinx.com>

On Mon, Nov 08, 2021 at 11:02:25PM -0800, Vikram Garhwal wrote:
> xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
> operation type i.e. add or remove to xen.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  tools/include/xenctrl.h      |  5 +++++
>  tools/libs/ctrl/Makefile     |  1 +
>  tools/libs/ctrl/xc_overlay.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 57 insertions(+)
>  create mode 100644 tools/libs/ctrl/xc_overlay.c
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 07b96e6..cfd7c5c 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2684,6 +2684,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
>  int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
>                           xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
>  
> +#if defined (CONFIG_OVERLAY_DTB)
> +int xc_dt_overlay(xc_interface *xch, void *overlay_fdt, int overlay_fdt_size,
> +                  uint8_t overlayop);
> +#endif
> +
>  /* Compat shims */
>  #include "xenctrl_compat.h"
>  
> diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
> index 519246b..a21a949 100644
> --- a/tools/libs/ctrl/Makefile
> +++ b/tools/libs/ctrl/Makefile
> @@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>  
>  SRCS-y       += xc_altp2m.c
>  SRCS-y       += xc_cpupool.c
> +SRCS-$(CONFIG_OVERLAY_DTB) += xc_overlay.c

So, this patch seems to introduce the use of CONFIG_OVERLAY_DTB, is
there a reason why the new functionality can't be always builtin?

Thanks,

-- 
Anthony PERARD


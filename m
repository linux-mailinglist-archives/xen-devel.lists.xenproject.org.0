Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF772C2B6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:18:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547023.854195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fYU-00021R-Bl; Mon, 12 Jun 2023 11:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547023.854195; Mon, 12 Jun 2023 11:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fYU-0001y5-7t; Mon, 12 Jun 2023 11:17:50 +0000
Received: by outflank-mailman (input) for mailman id 547023;
 Mon, 12 Jun 2023 11:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COfM=CA=citrix.com=prvs=5202ad488=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q8fYS-0001xy-Ds
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:17:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1221995-0912-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:17:46 +0200 (CEST)
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
X-Inumbo-ID: c1221995-0912-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686568666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fNG3XIoBLibAOG5D/FY1+HGtcCtae0c9EkKzQ9FAVQ8=;
  b=DCrdtqFGU+0NnlEeC1HvjC0faBBfKgkbb3ssC7ZZwuabcJK1+qA2Mran
   qWv7Y0P6BMooISyspbqhk35eu+5VXQ8E2nBi6TKOyjWV2AWO7CbRbSgr2
   uuCfNXE23N2s3bl9BVXYalI+OoaATGCn8i72nYn0pd2LS2Efe9SRjJ5GI
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114968253
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:muYroaNJQwh8hxbvrR1Jl8FynXyQoLVcMsEvi/4bfWQNrUojhDZRn
 2odWT/QOfaIZDOjeIwlOoyzphsFvp/RmodiQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wZmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r5uHUAQ9
 aQIEywiZCKb2+W75oC0e+Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTGZQLzhzF/
 Qoq+UzCISodbOKDxQG0yW6zt8uXtHPpW9M7QejQGvlC3wTImz175ActfUW6ouOwjwixUshfN
 EUQ0iMroe4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpbd0ttMYyAzswx
 FKNt9rsCXpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiIM5gw/LT91jOLWoldCzEjb1q
 xiVqAAuirNVitQEv4258krAmCmEvYXSQ0g+4QC/dmu94xlwfoKNe42i4l+d5vFFRLt1VXHY4
 iJCwZLHqrlTU9fUznflrPgx8K+Bv++ZEWPc2U5UA7YrxSzx/HOFT49h72QrTKt2CfroaQMFc
 WeK51MPvs8IZyr3BUNkS9nvUpp3lMAMAfygD6mJNYQWP/CdYSfdpElTiVisM3cBeaTGuYU2I
 t+lfMmlFh724ow3nWPtF4/xPVLGrx3SJF8/prihlXxLKZLEOBaopU4taTNilNwR4qKeuxny+
 N1CLcaMwBg3eLSgMneKqd5PdQFScSZT6XXKRyt/LLfrH+abMDt5V6+5LU0JJuSJYJi5Zs+Xp
 yrgCye0OXL0hGHdKBXiV5yQQOqHYHqLllpiZXZEFQ/xixAejXOHsP93m20fIeN2q4SODJdcE
 5E4Ril3KqgVEWmbpW1GPMOVQU4LXE3DuD9i9hGNOFAXF6OMjSSQkjM4VmMDLBUzMxc=
IronPort-HdrOrdr: A9a23:CXe2OaFeoIirPFlRpLqE68eALOsnbusQ8zAXPiFKOHhom6mj/K
 qTdZsguCMc9wxhP03I9eruBED4ewK/yXcX2/h1AV7BZmnbUQKTRelfBO3ZrQEIcBeeygcy78
 tdmtBFeb7N5FFB/KDH3DU=
X-Talos-CUID: 9a23:fdGbXWCika8p0lD6E3F+6G9KGpg1SWHyxkXIf0i1L1RmebLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Alp0WVw03AnobpcOKOnppAw7vqTUj2IeVDxgzjZk?=
 =?us-ascii?q?9ivKYKh1UYx7Nnjfma9py?=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="114968253"
Date: Mon, 12 Jun 2023 12:17:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [XEN][PATCH v7 17/19] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <9975f41c-c149-445a-8122-c15cfe5511b0@perard>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-18-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230602004824.20731-18-vikram.garhwal@amd.com>

On Thu, Jun 01, 2023 at 05:48:22PM -0700, Vikram Garhwal wrote:
> --- /dev/null
> +++ b/tools/libs/ctrl/xc_dt_overlay.c
> +int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
> +                  uint32_t overlay_fdt_size, uint8_t overlay_op)
> +{
> +    int err;
> +    DECLARE_SYSCTL;
> +
> +    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
> +                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
> +
> +    if ( (err = xc_hypercall_bounce_pre(xch, overlay_fdt)) )
> +        goto err;
> +
> +    sysctl.cmd = XEN_SYSCTL_dt_overlay;
> +    sysctl.u.dt_overlay.overlay_op = overlay_op;
> +    sysctl.u.dt_overlay.overlay_fdt_size = overlay_fdt_size;
> +    sysctl.u.dt_overlay.pad[0]= 0;
> +    sysctl.u.dt_overlay.pad[1]= 0;
> +    sysctl.u.dt_overlay.pad[2]= 0;

This is kind of silly to have to write explicitly 0 to each pads,
there's probably a better way.

I haven't find any example for "sysctl" but they are plenty for
"domctl", and I think this is maybe something that's wanted, so could
you replace "DECLARE_SYSCTL" by:

    struct xen_sysctl sysctl = {
        .cmd = XEN_SYSCTL_dt_overlay,
        .u.dt_overlay = {
            .overlay_op = overlay_op,
            .overlay_fdt_size = overlay_fdt_size,
        }
    };

With that, I don't think there would be need to set a value for "pad",
it would default to 0. And it maybe looks cleaner?

With that: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


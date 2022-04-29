Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66192514E62
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 16:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317438.536758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkRzS-0003mt-4X; Fri, 29 Apr 2022 14:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317438.536758; Fri, 29 Apr 2022 14:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkRzS-0003kn-1d; Fri, 29 Apr 2022 14:53:02 +0000
Received: by outflank-mailman (input) for mailman id 317438;
 Fri, 29 Apr 2022 14:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxz=VH=citrix.com=prvs=111f028e5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nkRzR-0003ef-Cn
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 14:53:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f1d796a-c7cc-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 16:52:59 +0200 (CEST)
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
X-Inumbo-ID: 0f1d796a-c7cc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651243979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xdhjm0VfALfwk2tX/QcBYmgcVuJpDyaGyPZzlGF2914=;
  b=OOYgpE/U5DzkeC0snv2GiwkANT0arR6dQD2KDKqfK+sL45ovSoDs0JrL
   9ICsxHPU2CCA+JNAqqi0fXPJwYXPQr/mYkqgWfpfuLVxRqxvSgfhQsccU
   KRVv8IgDuAUJ0LzwbFbIa7yOBSuY/g1HPWgRlSDYO1JImaTcp84JyxO1h
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70241562
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8zwqGKk/L3WB0K6BrZc1eJPo5gzzJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLC2zQb/7bamameYtxO9+zoxhXupPQzddnGgNk+H0xHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DlWVLV4
 rsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYVDkmJYTOg+8kfRxYIh10HKNv0q3gLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGMWAzNUmeOXWjPH8GVc80of2XuUXnbiVitUOwvfcr2jLMmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3U+V1ShpuKiolWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUn1g6W46jP6D+3A2g1cjRgZvUMpug5EGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J8swZX20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4NuWgmfh4waZxdJFcFh
 XM/XysItfe/21PwMMdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiO9D7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0CDr2jOnWHrd97wJJjBSFTOK0aYvd/LoarSjeK0kl6YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:ePJbm6DG9d3p07rlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.91,185,1647316800"; 
   d="scan'208";a="70241562"
Date: Fri, 29 Apr 2022 15:52:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/libs/light: update xenstore entry when setting
 max domain memory
Message-ID: <Ymv7vAEuiG3/IO3C@perard.uk.xensource.com>
References: <20220420080426.7036-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220420080426.7036-1-jgross@suse.com>

On Wed, Apr 20, 2022 at 10:04:26AM +0200, Juergen Gross wrote:
> libxl_domain_setmaxmem() called during "xl mem-max" should update the
> domain's memory/static-max Xenstore node, as otherwise "xl mem-set"
> won't be able to set the memory size to the new maximum.

Setting domain's memory higher than the original mem-max only works on
PV and maybe PVH guest, right? Because on HVM, QEMU is told about
maxmem when starting a guest, and allocates some stuff from this address
(vga buffer, pci rom I think) so trying to give HVM guest more memory
after the fact is probably not going to go smoothly.

> Adjust the related comments and documentation accordingly.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - adjust comments and docs (Anthony Perard)

Maybe `man xl` should be updated as well. In the section about `xl
mem-max`, there is:
    "Note however that the initial maxmem value is still used as an
    upper limit for xl mem-set.  Also note that calling xl mem-set will
    reset this value."

That wouldn't be true anymore with this patch.

Thanks,

-- 
Anthony PERARD


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A7C77392B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579459.907444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTISJ-0003Va-11; Tue, 08 Aug 2023 08:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579459.907444; Tue, 08 Aug 2023 08:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTISI-0003Tt-UT; Tue, 08 Aug 2023 08:52:42 +0000
Received: by outflank-mailman (input) for mailman id 579459;
 Tue, 08 Aug 2023 08:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lST=DZ=citrix.com=prvs=577b0fef7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qTISH-0003Tj-ER
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:52:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec2d3a1c-35c8-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 10:52:38 +0200 (CEST)
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
X-Inumbo-ID: ec2d3a1c-35c8-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691484758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uFJS4zUP1wrl2GtEuegrig1oYvjn3Yx0XvzdioJ2fk8=;
  b=bqHHOp3+NpBDKCELRRSo/q9nOU97RKtzgDe13wE8apeqKr85DfRt0SIA
   GinQiASs1ZYozis/GCR2OX52I7b+IB1zTb//Oc631RD1ZeKUMNzZgenH9
   mM+blK+Bn4xN+UfANLbDLyMx4MeEaRO6009mGluPXNG4AYfiIkbnmXAYX
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119255927
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:mUv5+aiaklxVgh80srR2N/CIX161lhAKZh0ujC45NGQN5FlHY01je
 htvWTuDbvyOYjDyLo9zbtvgo08C6pXcyIJkQAtk/y9hRXwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AeBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQHKCIdXzq6vN6G0bu3UulLqZohNPbSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 zOcojmoWE5y2Nq3kheM0Finvev2jz7XQdI0Ba2ayvNyuQjGroAUIEJPDgbqyRWjsWa8UtRTM
 V0J+QIhqKEz8AqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOq8seVTEsk
 FiTkLvBBzN1t6aOYWmA7brSpjS3UQAXJ2IfYS4PTSMe/sLu5oo0i3rnTMtnEaOzps34H3f32
 T/ihDMlm7wZgMoP1qO61VPKmTShot7OVAFdzgzPU3is9A9ReI+vbIvu4l/ehcusN67AEAPH5
 iJd3ZHDsqZXV8rleDGxrPslA7G798evCQbgsU9mE4Eh0Bvz+WacRNUFiN1hH3tBPsEBcD7vR
 UbcvwJN+ZNeVEeXgb9Lj5GZUJpzk/W5fTjxfrWNN4cVPMAtHOOS1Hs2DXN8yVwBh6TFfUsXH
 Z6AOfihAn8BYUiM5GrnHrxNuVPHK81X+I8yeXwZ507/uVZ9TCTPIVvgDLdpRr5R0U98iF+Jm
 +uzzuPTo/mlbMXwYzPM7akYJk0QIH4wCPje8pIGL7LYeVA3RDF4W5c9JI/NnKQ/xsxoehrgp
 CnhCie0NnKg7ZE4Fel6Qi86M+6+NXqOhXk6ITYtLT6VN4sLOO6SAFMkX8JvJ9EPrbUzpcOYu
 tFZI61s9NwTEGWYk9ncBLGhxLFfmOOD31/Xbnr/PmZjJ/aNhWXho7fZQ+cmzwFWZgLfiCf0i
 +fIOt/zKXbbezlfMQ==
IronPort-HdrOrdr: A9a23:RR3PT6wZp8TSTgA3HOhvKrPwDL1zdoMgy1knxilNoH1uA6ulfq
 WV98jzuiWVtN98YgBCpTniAtjjfZq/z/FICOAqVN+ftWHdyQ2Vxa5ZjLcKqAeQfxEWmNQtsJ
 uINJIVNPTASXh8kOP95hDheuxP/PC3tICumMLZyW5GSx1sdvoI1WtE4wCgf3FLeA==
X-Talos-CUID: 9a23:hY2VXmxsOfseVU564wUcBgULGtI1Q1fk90vgMka0EWZOZ+OXUWCprfY=
X-Talos-MUID: 9a23:BBXsmgno0I4VDVabWskadno5Gc5Kya+VDHkfjLkf6++VJQ5MNi+k2WE=
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="119255927"
Date: Tue, 8 Aug 2023 09:52:26 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v8 04/15] xen/sysctl: Nest cpufreq scaling options
Message-ID: <70f310ae-5007-45dc-b0a8-dbf20be59747@perard>
References: <20230807185119.98333-1-jandryuk@gmail.com>
 <20230807185119.98333-5-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230807185119.98333-5-jandryuk@gmail.com>

On Mon, Aug 07, 2023 at 02:51:08PM -0400, Jason Andryuk wrote:
> diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
> index c3a9864bf7..5ec050982a 100644
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -245,6 +245,45 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>      sys_para->freq_num = user_para->freq_num;
>      sys_para->gov_num  = user_para->gov_num;
>  
> +    /* Sanity check struct layout */
> +    BUILD_BUG_ON(sizeof(*user_para) != sizeof(*sys_para));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), cpu_num) !=
> +                 offsetof(typeof(*sys_para),  cpu_num));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), freq_num) !=
> +                 offsetof(typeof(*sys_para),  freq_num));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), gov_num) !=
> +                 offsetof(typeof(*sys_para),  gov_num));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), affected_cpus) !=
> +                 offsetof(typeof(*sys_para),  affected_cpus));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_frequencies) !=
> +                 offsetof(typeof(*sys_para),  scaling_available_frequencies));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_governors) !=
> +                 offsetof(typeof(*sys_para),  scaling_available_governors));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_driver) !=
> +                 offsetof(typeof(*sys_para),  scaling_driver));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_cur_freq) !=
> +                 offsetof(typeof(*sys_para),  cpuinfo_cur_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_max_freq) !=
> +                 offsetof(typeof(*sys_para),  cpuinfo_max_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_min_freq) !=
> +                 offsetof(typeof(*sys_para),  cpuinfo_min_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_cur_freq) !=
> +                 offsetof(typeof(*sys_para),  u.s.scaling_cur_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_governor) !=
> +                 offsetof(typeof(*sys_para),  u.s.scaling_governor));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_max_freq) !=
> +                 offsetof(typeof(*sys_para),  u.s.scaling_max_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_min_freq) !=
> +                 offsetof(typeof(*sys_para),  u.s.scaling_min_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.userspace) !=
> +                 offsetof(typeof(*sys_para),  u.s.u.userspace));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.ondemand) !=
> +                 offsetof(typeof(*sys_para),  u.s.u.ondemand));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.cppc_para) !=
> +                 offsetof(typeof(*sys_para),  u.cppc_para));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), turbo_enabled) !=
> +                 offsetof(typeof(*sys_para),  turbo_enabled));

These could have been done by defining a temporary macro to avoid
repeating the fields name twice, but this sanity check is good and
should prevent anyone from changing one struct without changing the
other one.

Thanks.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Cheers,

-- 
Anthony PERARD


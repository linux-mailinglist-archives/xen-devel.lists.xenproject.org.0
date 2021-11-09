Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935DE44A7D1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:48:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223775.386653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLqa-00038k-VC; Tue, 09 Nov 2021 07:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223775.386653; Tue, 09 Nov 2021 07:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLqa-000363-S0; Tue, 09 Nov 2021 07:47:12 +0000
Received: by outflank-mailman (input) for mailman id 223775;
 Tue, 09 Nov 2021 07:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkLqY-00035V-Vy
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:47:10 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7eae::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d3a28bf-4131-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 08:47:09 +0100 (CET)
Received: from BN6PR19CA0086.namprd19.prod.outlook.com (2603:10b6:404:133::24)
 by CH2PR02MB7096.namprd02.prod.outlook.com (2603:10b6:610:8c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 07:47:05 +0000
Received: from BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::38) by BN6PR19CA0086.outlook.office365.com
 (2603:10b6:404:133::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 9 Nov 2021 07:47:05 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT023.mail.protection.outlook.com (10.13.2.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:47:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:47:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:47:04 -0800
Received: from [172.19.2.115] (port=44100 helo=xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkLqS-000AmH-Mf; Mon, 08 Nov 2021 23:47:04 -0800
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
X-Inumbo-ID: 3d3a28bf-4131-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYc0XXFg4yZApRxNSrV9VzLoP3r6dgj1G351MUwu5Vy0Zx/fykJe4yhazTwU50bm4iw7NhcGkLSks9NQRtdB9owSXaethoN1TIrHdCm8aw0KrnDOX94pak0XXfORTWZfCwsTCbpYYyADy5pIeXvy3IciJ5ZwpHSHR0wvJQTDhOwSTL4HQLKEqH/OfukFCP8yEFDShwRRzh7N1QYOHdxZ2GCxO/b0+KsNWKditHxDaOIIqOVKYP7F/LeQ+qE7vpusqThjN2HQBCFUVgHVxMByCE1365uzooOvXCEJ/POHehfKeFiJ9csod6z54xZc7nmvWEIW6SAdE+FP7N5BjvYlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwIntXkifYQ8RKlL0jbwCGXz4AM+YJ1ZSWK////ySSw=;
 b=jNNFMufyjUD6B8bDkCUnkmHTGuk/sGCFsrFNWlfXZblKb60Si8T+rDd32NLSYyARPIPRqyUT9DlQq7s+rR6Pif4HYJpugrQWHzT2Vxiq8xKCD5Hp5o9AtznlLMmp5H/eC1L37sfHp11AXBdjB+HyymnuuxSPuiSAwStWR3hu6CvHNG3wcYhbYAY05aJ7hEkukOnIlRB3PSdR/rwCpgbVulsMMkTL//9YZD/sTDI5WR5RfHWFBCTUFNlPBAUXcLvbOgfolsuvRkEfJAaZcim1tWOUWiTynE5GP5oAe5s+rssLAPWcwSHL8R1VyYDcu0sskabqm9Cbd0pOQi4D79biXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwIntXkifYQ8RKlL0jbwCGXz4AM+YJ1ZSWK////ySSw=;
 b=XAvuQEDJIAnovthrAL3mvd9EgaEDZvGxoFtKF3LmzTvCqbKhoIsEteIy+qQEtAg3Vly0+VFm1dPyDDtc40de/uNBspU4WUTj7ZjzGz9e5K/a1+u2/6zO8tklkhWtBzxiEqkYH8YNmyOSe/qxtnEM2f0Qazwg40e3WN7RG/F3i3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Date: Mon, 8 Nov 2021 23:47:04 -0800
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <volodymyr_babchuk@epam.com>
Subject: Re: [XEN][PATCH v3 1/1] Update libfdt to v1.6.1
Message-ID: <20211109074703.GA159999@xilinx.com>
References: <1636147719-80482-1-git-send-email-fnu.vikram@xilinx.com>
 <1636147719-80482-2-git-send-email-fnu.vikram@xilinx.com>
 <caac2d2b-46a7-e12b-7cb0-ac1b7791d8a1@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caac2d2b-46a7-e12b-7cb0-ac1b7791d8a1@xen.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11e15e55-4344-466d-04d8-08d9a3551feb
X-MS-TrafficTypeDiagnostic: CH2PR02MB7096:
X-Microsoft-Antispam-PRVS:
	<CH2PR02MB7096AF988618861436DDF863BC929@CH2PR02MB7096.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S0mVOAws4GoZDbtxI1N1Of8apHyapMuIuAGIAmnHGrq8w5+59aykT6C1Z3Quj+MW6Vn8k+OVGB7A/JR5kOOenAFf6qG7BfUpf14WeWtAuaG91l1Bk3XajYKqyx/oH19kv9dpjb+NnyNikAUHJODltXKPxR2iK3XDbkElNOYAU5tq1sINjxhpXZ3byXfTfWZdStYmYOhEAq3Y/MY9PEOM5tt4vdBtEBOlgagpJ3YWHCHNUfOgzBbO657RgwyVJohdhG540g25RrHQtnTfe05MtspBubryqgSVKRPK6wJl480gDet32c6DN1Cu3A3Of5Tk8IY3AETFxq+IlIHWuuhULJbHnRVBWpkPFemDW++wm+OHKOqNSLFlwKY52aigkSdrwGjX7j/9RIuL3IwUYYKUbaejsYg00VocWoGC9PLlZZLrI5VgqD2eaqPCwSIsffN+vsoGKhSqJNh+zMkBj/uGXRlwEkh6x8kbny8exjUK/TFm7JYqo914d+rxoBtO2iqqgeshInhZUi3RTob7yCfcBhYxkjjIWf2bh3CWgydQpAOa5B1EifCZaBTznyVwoHhVhIfDOQiUtZlTlac0IzuQ8Ah2EMS8FaRl1OXND9JjN0vxWoYntG/43tvq8GtW/uzI7aM2KlONA76EXX3pBJzbC6Q6YNpKwb9PZajhVdw5dVY2QRb79SKISWPZL1OJ2lYGPkPUpsM3Gy/X5KgSNgs/Fs7rVPKrbXhjxUP+Hg2lAj0=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(15650500001)(508600001)(8936002)(8676002)(70586007)(2906002)(6916009)(70206006)(26005)(54906003)(5660300002)(7696005)(36756003)(33656002)(47076005)(1076003)(4326008)(36860700001)(82310400003)(186003)(83380400001)(336012)(316002)(2616005)(36906005)(426003)(356005)(7636003)(53546011)(9786002)(27376004);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:47:05.1309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e15e55-4344-466d-04d8-08d9a3551feb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7096

On Mon, Nov 08, 2021 at 10:37:31AM +0000, Julien Grall wrote:
Hi Julien,
> Hi Vikram,
> 
> On 05/11/2021 21:28, Vikram Garhwal wrote:
> >Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dtc.
> >This update is done to support device tree overlays.
> >
> >A few minor changes are done to make it compatible with Xen:
> >     fdt_overlay.c: overlay_fixup_phandle()
> >
> >         Replace strtoul() with simple_strtoul() as strtoul() is not available in
> >         Xen lib and included lib.h.
> >
> >         Change char *endptr to const char *endptr.
> 
> I would clarify this is a requirement to use simple_strtoul().
Will add it in next version.
> 
> [...]
> 
> >diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
> >index 035bf75..03380d5 100644
> >--- a/xen/include/xen/libfdt/libfdt_env.h
> >+++ b/xen/include/xen/libfdt/libfdt_env.h
> >@@ -1,22 +1,98 @@
> >-#ifndef _LIBFDT_ENV_H
> >-#define _LIBFDT_ENV_H
> >+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> >+#ifndef LIBFDT_ENV_H
> >+#define LIBFDT_ENV_H
> >+/*
> >+ * libfdt - Flat Device Tree manipulation
> >+ * Copyright (C) 2006 David Gibson, IBM Corporation.
> >+ * Copyright 2012 Kim Phillips, Freescale Semiconductor.
> >+ */
> >+#include <xen/config.h>
> 
> The build system should always include <xen/config.h> automagically. So can
> you clarify why this is necessary?
You are right. This was something got carried over from v1.4. I can build without this.
Will remove it in v4 patch.
> 
> >  #include <xen/types.h>
> >  #include <xen/string.h>
> >  #include <asm/byteorder.h>
> >+#include <xen/stdbool.h>
> 
> We usually order the headers so <xen/...> are first and then <asm/...>. They
> are then ordered alphabetically within themself.
> 
> But it is not clear why you are adding <xen/stdbool.h> as AFAICT it is
> already going to be included by existing headers. Did you see an error
> without including it?
Perhaps my build was messed up then. I tried just now and can build without it.
Will remove this one too in v4.

Thanks for corrections!

Regards,
Vikram
> 
> Cheers,
> 
> -- 
> Julien Grall


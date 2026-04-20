Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIMMEmOa5mk1ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1221434054
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287493.1567911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9Y-0001KE-Fr; Mon, 20 Apr 2026 21:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287493.1567911; Mon, 20 Apr 2026 21:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9Y-0001H5-BI; Mon, 20 Apr 2026 21:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1287493;
 Mon, 20 Apr 2026 21:27:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9W-00019J-GP
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9V-00CBiW-TP
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a45-e002-0a2a0a5209dd-0a2a450280e4-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:33 +0200
Received: from [52.101.201.123]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a43-af86-0a2a45020019-3465c97b9be8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:33 +0200
Received: from MN2PR11CA0019.namprd11.prod.outlook.com (2603:10b6:208:23b::24)
 by DS7PR08MB6848.namprd08.prod.outlook.com (2603:10b6:5:3a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:26 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::f7) by MN2PR11CA0019.outlook.office365.com
 (2603:10b6:208:23b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:26 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:25 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8s0rPKz1wdR; 
 Mon, 20 Apr 2026 14:27:25 -0700 (PDT)
Received: from DM2PR04CU003.outbound.protection.outlook.com
 (mail-dm2pr04cu00301.outbound.protection.outlook.com [40.93.13.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:24 -0700 (PDT)
Received: from CH5PR05CA0012.namprd05.prod.outlook.com (2603:10b6:610:1f0::10)
 by BN0PR08MB7535.namprd08.prod.outlook.com (2603:10b6:408:15b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:21 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::9f) by CH5PR05CA0012.outlook.office365.com
 (2603:10b6:610:1f0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:21 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:18 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:15 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DaNoqRsYFrxyOOBqNNSv9oDCvg5bUOrpRAz+ehf4eE10Q/jPWYRkZnPwYcedSc6OPwTjjJDNkxzodkP59/w9j/uNyTXLZhTxE7zhUbR3/qluxmdJxeKkSAhUfkBtwmPOMm2OLnVsYtustmpg3BFJZeEo7rasTLiUHIkIdnR2/11xT3KRLUxMTZaDWg8pJobIMos1lUlU7AAPZah/LkUKaHFqRk3JSGanQePMCId3rTW3sJ+EsZYJthy90vAuOLJ+pcN3OqlgxHPk50EpPexGVYk7BKHeYCaJ43PhhB5Mxxa5kz8dG9mI1yj/ll+/kgqfO6NsmVT/Iesj8rsYgxAL2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIka6cApKr4tHLkM0UcaDmcfawXuEpYHKEShj03nxYM=;
 b=B3kcdjBRWcXb8OgpRkxPd8AKIKKw95NdpIwFq2aq82VEw4tlDcW5SJtPzmG+USHHKtaUnFAK5oPsOl0N+nna+YKFqD0SvQD1atI6Wc2ksqwL/6lNcO6eT0Ag7yAvwYRkWiPBzsZ3E4on6FYqoibPkEXTOnW5kESkzhKCDr/aatmtNExUJ6sX8WjRcr645WkxyUrvPlwXjaMLba8ZyfJ89GGcS7lF/4zXSyMPNnak6x4aLlWutZABRtNiP7fh4OqZxcbc68lLF9GocwgSXK9yN0Z+2MHljIlSjh8zq73E8qUOMhDSZiWDnBkjz0OoU9jORemTh+Jtcpp4Cp4tNGatwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.57) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIka6cApKr4tHLkM0UcaDmcfawXuEpYHKEShj03nxYM=;
 b=Gmj4lRr5Yh7NA54s1Tki+r0woLIEESbL//qdYRqMkXLF+8JLppJHHh3TROFsajslmVpZvGTdtHUhu97ousn9IpyF3/nOaXrlGLGVCFTzmj/Qy8NUw9aB6t28gbK7hAwJF1Mw9Rsi7JlHr0yxp8vL7YFXM+15kcatH3ECGOSO/gA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.57)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.57; helo=DM2PR04CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6+hHL8Va4+eWz8VNMwXFDSquak96v0djbhqFp+rXr6PnYODtY8t2l3wE0vh6+w+Z1ev9aGHy6iXKAputSxv9pylsSF7hP2fSttWO51AGsmB9knBZmdbAmDqh0twd0kIzutAnaaKapv2oFTFHXt4XWkTVkdtjEp9nUqZeu6993ggJ/8lXnFeKiTJ8cWM+lFYROYl6xYOBp9o6M2eY0NqefI2QeEi2T0RZ6P8V/hFi1tHKIRus43KOsAxcA2X/pYcfogviUGrt4Y3zGPagb7mdsFGtHwLhDd+G+JA3sJvV5PowHKw+N/QPdKQmoLjO8i9sCC64bt/QnG1zocvY1qISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIka6cApKr4tHLkM0UcaDmcfawXuEpYHKEShj03nxYM=;
 b=SUsqa6FraOykBCUxc3KMObSPoA8Z5arTiA7kiQPLca63NNeBsWQfqX3CSb97jbaXZ6xxsIo12bnVyGkf8cMrVqNESSaPOczNXvi2yQHVkBehtcTuaCnoJevtKuA+HRGuw5UxTAcn7wd3gmM97Uf+7Ih7iKxu/AyDpcJ4OOcL22zq7aN6um3/QMGumg4MZqb04Kag2R2BluDSOFsUQ83zQd9Tai5roXv0aYQwDLxl9zZY2IbuzG97oB1yWli2WQmGE9JLUrlcB+wjKL9H8lvifsVpFwuuCxo6ZWS6ENp7kNHqAZMWEoIcQ5WhVA4IIkNALQE9YHwSYkU3W8Bb2EMaTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIka6cApKr4tHLkM0UcaDmcfawXuEpYHKEShj03nxYM=;
 b=Gmj4lRr5Yh7NA54s1Tki+r0woLIEESbL//qdYRqMkXLF+8JLppJHHh3TROFsajslmVpZvGTdtHUhu97ousn9IpyF3/nOaXrlGLGVCFTzmj/Qy8NUw9aB6t28gbK7hAwJF1Mw9Rsi7JlHr0yxp8vL7YFXM+15kcatH3ECGOSO/gA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [RFC PATCH v6 12/43] x86/p2m: Move p2m_{init,free}_one declarations to arch header
Date: Mon, 20 Apr 2026 17:26:17 -0400
Message-ID: <20260420212648.208640-5-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
References: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es013.ebgroup.elektrobit.com (10.243.160.141) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	CH2PEPF00000099:EE_|BN0PR08MB7535:EE_|BN1PEPF00006002:EE_|DS7PR08MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: a5554a6e-0510-4b09-0372-08de9f239e6c
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?MmiX7r19sRecRQnpWqyQfixt635jXmAnSav3yTFjeuTmor6AeX/9+rMA0xZV?=
 =?us-ascii?Q?iIJCzsaossVjL3/J5D4UH8K+nTufnTk6KuexDdzXA0VtLqapI27CTDsNGroL?=
 =?us-ascii?Q?8UgSPWfY0Z6Z8dFjJDed77Rzx6F9u6tIYdlmYd7nDdbC6/LAJx3JdSPNyZdU?=
 =?us-ascii?Q?nEkXXu9qi0Ma14BDzme9DZHCyu2bCDOctodC8hauJrBK5h1l+tyVwoHxcbSe?=
 =?us-ascii?Q?b0EopR+No6h8ybjVZLCTNhQA8gGyqRtNml52CkEWF5RywODBfIHBGclLjK1o?=
 =?us-ascii?Q?GMpe7YllAo1bLA1pTxG2v0l1QQdKq0MI14XNh0GXKst3uIygEfqCaAL4tHxB?=
 =?us-ascii?Q?Xsv6mFw2+3P/pIOuL8bN0L0oQCeov03iRbHc3kPPUN2xWrMX1APkmUqtIffT?=
 =?us-ascii?Q?EZx6saCh1YltKBMpi0CQiLFUk2cITdBkjQ+jeJ639rb3yQeuJO+PEQR/NwtT?=
 =?us-ascii?Q?kq9+VKVthfUcNDyqagF0w6dj63hdr0j34oU4oGreqdLXpU0ln+FlvE8x4iNt?=
 =?us-ascii?Q?rYyd8gehdwbhQPPLhlHatljAj/EV5RXHWDGoay+SDgzY4CzsJQDwsLljLbfx?=
 =?us-ascii?Q?cg9Z0EcXnVkxKWNHg28NdrT8gmU/3yGslKlJcR66gT5NL1jK8MrDPrmfhStX?=
 =?us-ascii?Q?Qndilfqs0RxrEKE2sKFFrwi+nH5EnRx1/MNQoXk5eRqUEyJgHj2St7e8DJ7r?=
 =?us-ascii?Q?WO6va1rEqOYrdQ9YPPbmSLYZKPCBQ0aEDYCnwY0Hhpcz/sz/qrNOYGOth/At?=
 =?us-ascii?Q?j/2qErC7mkDqfmBlXWWmPd5nY+e/X8LMIi8TUebDRXc9C5wi/qvHL/HTK+1+?=
 =?us-ascii?Q?fRq8LcAg5Gp22UpMGXkHvlrnkjhW3AUMPSUDxJMN1G4Y8IqocbGlVNvonH6h?=
 =?us-ascii?Q?+LRg+MihN95T8DjHge2UQQ3zEZgFIPW4CJccwt5U6c3zojh2V1h33fH9Ri7+?=
 =?us-ascii?Q?N+rCg2iycdyKqffAxrbOEZzOBKGVGbGqDg5Ls0kqJkmruQacw83SJVEsd8FY?=
 =?us-ascii?Q?NM+822M9GQBBXlwhmcUGFnfGKucHIeLRz6ArGcev9afJcPXtngSGQeEiIftW?=
 =?us-ascii?Q?Ck6vlpLW9vGDzqtKOeIgsu6JdYPax6ymiomjX0rs1f1JB/3Z2gE8rHY2PonH?=
 =?us-ascii?Q?Ue+lpS0QysAlGJjOvw6V+muPZzoQJJVxkaBi/TtO5yEkdV60lnSRHbgtR4mt?=
 =?us-ascii?Q?kqTh5Q0GdeFmlCwHTNnj0q5LvceGvhbq7/fomGTQDlErQUuJB45q8WLklNJc?=
 =?us-ascii?Q?WEpogxBFKJO/X/4b17xC6Y3zFxH0sW2p3oZOqBtutA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 rz9EV0cxbu5ghVAURjsAnKF6tkbC1axgak7v305sL+ac9RBpOJxnNVyP7FR6D9MEWPISl/0RPDPKMAtibw0g+nKj8vEFME2BPpTYwv3tbeRG4R1c+5c79VukP+bPLGqMAs9iPZrQcTzf7X30i3El5eL1Y9wPDoiQlzM0xkJch3dUC5zDYqENkWjwXcDvYn/bzy8C5q35L3gqR2dMzjbwqiTk5hETKmRBu34Lt9bhP9pk+F/rqcdQW6sLkNnThi6S7XaWAg1ex75GvjYRmbULtbBLiYO3N8VqC8CooSD9h9O/sv0x7hcVQ9I9n5UgfvQdEYyo7pmdpr1OXu87cNjW7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7535
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.57];domain=DM2PR04CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.57];domain=DM2PR04CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39762365-5891-4995-ed27-08de9f2399f5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|35042699022|376014|82310400026|156008|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4A518ktgUsUz5kVshBI6ZF/CW3kVrnmlKJx9Dh9FxK+i8ua+Q0d1nhPZc14j?=
 =?us-ascii?Q?ZZICzMApjzx2qZCRrnab4BJea0Lgp+m8W2MEdc33dsjjici43BCILG3+ypb/?=
 =?us-ascii?Q?pOJD/oSZTj2RFJybo1xfP+fFUykP8NlsWC1/zjTwZtEP3CVaBDFyUgeZxvQx?=
 =?us-ascii?Q?MJgaIxF5wG77+VxnZsqWDumldHH4RBuG29JOCTXz2fDe7cs1IIXHNLosrOiU?=
 =?us-ascii?Q?FL4vjSV5RM4hlZT/Uqg94ANKMnZQ5J6ru1+SY4Z/VKw8iPNYFCX+uz4LOrBI?=
 =?us-ascii?Q?0H7NiuIUV4gKb19xn5+CFiDJbFKIKEP8vgcdyXa5SdARwSdGMMKh3GzqfYxG?=
 =?us-ascii?Q?Q+WHlZ/Z+C7b0TTBFxkniU+TTOWAEBOSwuGSCS5wLzaPamJontkviqqGNi3e?=
 =?us-ascii?Q?HM56lZkjL/hl6hRqWMEt1ROQ50lRLmgMMJu7wirKJnFY3CskdZFUNRipoINE?=
 =?us-ascii?Q?Fh8/shlVltRN2oDF0rObFip5MY7PyOxYXiD0grSMSgWmGVtA64dQMRqv11w4?=
 =?us-ascii?Q?9js76SNZ6YrXFM3dUMI8zSruM/JYvLMCVHhM1ic6CtUU5EvVbm+V8n4bwZaW?=
 =?us-ascii?Q?v31DqTJtEr4l4BVb7Tuu4mJVM5marhpAfS2zHxoqHQ6HhHBZy/LphYY2JkpH?=
 =?us-ascii?Q?Cirj6jWzIr8I+lItxftcLnzALqtQPf8cnaik7PtT1MV0SYSG0jcPpzwiQEOd?=
 =?us-ascii?Q?yiKO1D2q/mdS+LRJNzs+tWu7vIzdRq5hJovhW/d3dlms8C9gU79hyBLad8mG?=
 =?us-ascii?Q?+Bvn6UTQ/gMbSkrUnYkFdJEsnzvNtIiBkCX1V5CRmQnEGczx8bVFP0dA1F2P?=
 =?us-ascii?Q?yw4Q7iosegw96M/gGZJML+lKvqxcn/Odc2LlCJ//yq0rpqObhj8gW6ymMvR+?=
 =?us-ascii?Q?0Ccertm9BLb6YOpiw8TMRu+q3az/ZSEORzdZUoo78pioL+GYEU/SFZZLI38e?=
 =?us-ascii?Q?DqsInvUD9JlI6G/iKhp3Ps6MnyovaXVLpfReZUO9NeijJsWA8WtrMSoZRGjw?=
 =?us-ascii?Q?pdOMkh9BRSPfqGjxAZlHZ4mQ/9odh6nk0wNJSrl2+HG4OgXmS4d14skEnkUu?=
 =?us-ascii?Q?UbtDrcRWYuYjDzV3z/Sy3agg+xdF27pf/Qnt4sIjbBbktK4o/Cpd9aEXD6LB?=
 =?us-ascii?Q?WmB91gUJ/RYyg6iFQ5QMERa2Q2ePYlRFpoFOKeqGpEpX2cy/5CDqRgJn+h2+?=
 =?us-ascii?Q?a9/YtfMpussM3pbDl/6rdBMjEf8GhmAqLMSpSaY3ke3lwWKaoePyByPUoYC+?=
 =?us-ascii?Q?FHY6wC0+nEg+cGJoSlT2k/kWAll6dy2FHwS0EO5jjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR04CU003.outbound.protection.outlook.com;PTR:mail-dm2pr04cu00301.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(35042699022)(376014)(82310400026)(156008)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X1cMaIP4+iCOpV1BCFk+r6jAGZlywFovD704ek1R2PHY3XVfF/Ca2gWYoK6pHWkG2zn9irCEFQSX3FUuxD4IHh8DO+OeU3DSzhtbnXG50I+743J6wJ+j4Tv5+YT7JSJZzNpFmHmqtAuQCQGU5aq+uxTQPq+peScep44K4mViwOqxSQH+8R6tYcqdfIESEQ+j17X5BFeCbcInNSfFo2vhEZhPoiHTpTr3PsoPt30NsYsk7imHP9oC4v+kAdGqxlvvAtadVnn1QdGUbtx1jCAe7zpkDQO1WsHr3TZUszK9humzM9keZjPtmA/twOtWtivF7UNPcAeUTfRqyppY5yL+xcNOmnkjOyjzvRt1Nsgd8+kE8sSRQQ1w2VMv0Gon9FwEDlLOPHSsOMlq+dQvmhpAAEbmMYiN8Fy73zfK49zzwgXwhuFljphnprIwbweGt1Kf
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:25.9668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5554a6e-0510-4b09-0372-08de9f239e6c
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR08MB6848
X-purgate-ID: tlsNG-720697/1776720453-89AC2161-AA47EB31/0/0
X-purgate-type: clean
X-purgate-size: 1613
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.344];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D1221434054
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the p2m_init_one and p2m_free_one declarations from the
x86-only p2m.h header file to the asm/p2m.h header. This makes it possible
to use these functions in the common altp2m init/teardown routines.

This is commit 1/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/p2m.h | 3 +++
 xen/arch/x86/mm/p2m.h          | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 5110b3e77807..ce8eeb751ee9 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -592,6 +592,9 @@ int p2m_alloc_table(struct p2m_domain *p2m);
 void p2m_teardown(struct p2m_domain *p2m, bool remove_root, bool *preempted);
 void p2m_final_teardown(struct domain *d);
 
+struct p2m_domain *p2m_init_one(struct domain *d);
+void p2m_free_one(struct p2m_domain *p2m);
+
 /* Add/remove a page to/from a domain's p2m table. */
 int p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                  unsigned int page_order, p2m_type_t t);
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index 64218878067e..be8ed85c2aba 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -6,9 +6,6 @@
 #ifndef __ARCH_MM_P2M_H__
 #define __ARCH_MM_P2M_H__
 
-struct p2m_domain *p2m_init_one(struct domain *d);
-void p2m_free_one(struct p2m_domain *p2m);
-
 void p2m_pod_init(struct p2m_domain *p2m);
 
 #ifdef CONFIG_HVM
-- 
2.34.1



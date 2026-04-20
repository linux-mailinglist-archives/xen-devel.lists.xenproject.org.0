Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJRBE2ma5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9543409D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287534.1568010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9q-0004kA-GD; Mon, 20 Apr 2026 21:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287534.1568010; Mon, 20 Apr 2026 21:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9p-0004dP-Sv; Mon, 20 Apr 2026 21:27:53 +0000
Received: by outflank-mailman (input) for mailman id 1287534;
 Mon, 20 Apr 2026 21:27:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9o-0004Oe-Af
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9n-00CBiW-NE
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a14-e002-0a2a0a5209dd-0a2a4507df78-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:51 +0200
Received: from [52.101.201.95]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a55-229c-0a2a45070019-3465c95f2a44-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:51 +0200
Received: from MN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:208:52d::28)
 by SA3PR08MB8595.namprd08.prod.outlook.com (2603:10b6:806:2fc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:46 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::99) by MN0PR04CA0023.outlook.office365.com
 (2603:10b6:208:52d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:45 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:45 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9D1Dt7z1wdS; 
 Mon, 20 Apr 2026 14:27:44 -0700 (PDT)
Received: from BL2PR08CU001.outbound.protection.outlook.com
 (mail-bl2pr08cu00102.outbound.protection.outlook.com [40.93.4.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:43 -0700 (PDT)
Received: from CH0PR03CA0406.namprd03.prod.outlook.com (2603:10b6:610:11b::14)
 by SJ0PR08MB6621.namprd08.prod.outlook.com (2603:10b6:a03:2ac::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:37 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::a4) by CH0PR03CA0406.outlook.office365.com
 (2603:10b6:610:11b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:36 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:36 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:30 +0200
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
 b=JtYkIA0sS9/ZBF0wvRhsJ44ZKiwgxFOITYNWUbJs2kDtEQLALpcNR5mHAGudtZ2VsQy/+0hwkCSmGFum9C2mbANEQ3sQ7RvFkSsPXDRFRx7kewP6muMefFWDd9N0X0v294lFo0YwdUSBKLfQwK4+isoXAyOEdWg1fSyOBxKt5FOyMyvEUr246ljL9ypPO2OqkBAqnwAhQ9o8jS85nAKGdkjOIUDNnAmh8bSQp+9+D/aX/aje9m9sbrSizhN/1ANens3lvh8c6XEnfA35OUMhEkW65CZl3p45yR+freC3RsuzGDGlaWDFmzxxkudLyR5xz+pX6LoDZu9PnT8SJDpfLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXO5psDHXrr2lWhpVfZGIS9NlsT4Gk+n8+O5j94oxLM=;
 b=WZl5WB8Rb0zzCXssJrSkVVsblLc37+8SRnNyIv70ZSLK9xf78vSpElf4ftCEpGKp4DYKBXUmYSmLmDD8nzQQ8LHL4DDLeZm6LtWZQrA/8kmfxzUi3zDJGIYnP46vWYVDDLnzIN/h9NZYvNOLi5nSqzFzqiKbmEJZe7Ei5CAKNuDavmysVcSd/r/JccTQr3PfbzirJBX/wfYO27HM6bV8hVxofJ5GcKTc0jHaY8PLmHENTY/C2fyClWypIFY9YkUR6Evotgxbo5MqmkoNw6iiYurXnzKz7fkkOq0TFHCUmpc0HUR40eOXQEqtkw/OvLAPpbqh9f4BmZP5gDnHcC/Nvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.10) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXO5psDHXrr2lWhpVfZGIS9NlsT4Gk+n8+O5j94oxLM=;
 b=KCmfd0d6gO3Y1rK4XdKRKB6ai9hbryj0/TJ4YNpKVXMDp/cgHOMF9uxlbSHn6iClA11sWNkK08TEEnl+0Goy6LISiYM/LjqAhaHx6RpYCrzIAGXWT5jY02gkTbEvVqmfdXLLSQUSwD7eDpW1a9Ur7g6yJAv3ODzs3h6k12XJHGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.10)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.10 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.10; helo=BL2PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnUrJyATV4jcskrT7rsAH90hLoE69O0lEd/g0SCKyrsVRr3wJcNpBIdinfSC2OhJNoH0uDe8U+pKvNWOTwNChAA2S4JtDKvnVPUzx6Ueyn8YG4iRq2qzSV4RQ2ZWoU3l0hHVblywMwfE30MBJT1+TBIQ+KgNGHqxc/HM3xTv3kMFlhHIQE3Qw0WDsQhbpKrUcioJdFENQsEL/wvJFGY/K3CRF7Sf19vT2VS8iaY6uvUdrwyApv/Gj3oSrmhTpBTTke12L8Bvnv66P97zvrR+VFCnlKBUMW7mfJdXiQglCd69hWLjfUj7vyPQf+0NiIthm5pPtdGgTet93QhJPWSX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXO5psDHXrr2lWhpVfZGIS9NlsT4Gk+n8+O5j94oxLM=;
 b=eCCoDppICBUrEPD2xAFyuz/hm67pKSWqJC8JGdHASPIoTe/g+MWq9mGubEaNTmwOUkxZ1fQgSArdWdCUyFVvBuRSxZngUm5jhx1wK83FTeOfmwG/zW4+5Xb3CQnTLi8OiDrl3H5tXo43FaCOLwqrQ+udvq0eupTIgB64vhVbKpLD16qvPpVDOPha0A61hP69ETWwz2Rn/+Pk/5xX1ODx4fzPSmMUo8OoDnmanvxCfBwfMU6979G/MVLvqXEhmgzKSJyHZVEaf4wTbjrydcqNi+5T4zJxsyA0M/kxrYE8/YtJJaArLJ8PPECzzzfqn3t9p31wgNqzrRWb12CBuSEjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXO5psDHXrr2lWhpVfZGIS9NlsT4Gk+n8+O5j94oxLM=;
 b=KCmfd0d6gO3Y1rK4XdKRKB6ai9hbryj0/TJ4YNpKVXMDp/cgHOMF9uxlbSHn6iClA11sWNkK08TEEnl+0Goy6LISiYM/LjqAhaHx6RpYCrzIAGXWT5jY02gkTbEvVqmfdXLLSQUSwD7eDpW1a9Ur7g6yJAv3ODzs3h6k12XJHGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Sergej Proskurin <proskurin@sec.in.tum.de>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 22/43] arm/p2m: Introduce p2m_is_{hostp2m,altp2m}
Date: Mon, 20 Apr 2026 17:26:27 -0400
Message-ID: <20260420212648.208640-15-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009E:EE_|SJ0PR08MB6621:EE_|BL02EPF0002992B:EE_|SA3PR08MB8595:EE_
X-MS-Office365-Filtering-Correlation-Id: b54807c0-55ea-468b-4acd-08de9f23a9d8
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161811799003|36860700016|1800799024|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Kq2IAjKvxqDj1XMw4+/FR+AXZ9WXP+L+LW0wYdQ7sLiyfjuQ+hjxCu7dSEJg?=
 =?us-ascii?Q?di4tj+BWibDXcuuy7G9r3Hm9q3jFE6fB1EHRzlCbSsw7n7uhvuWduoypWwlF?=
 =?us-ascii?Q?U4O+VrTX8KQrdnLIuGd1jnV8sf0XlyFzp61bLYYsKqtH4Ubn1BQkPHem65/G?=
 =?us-ascii?Q?6+ISlbGlyj8oS1jT9xRPgt3Evw3MzLThMH42UIgMdj+oWgGdXyM7Ki8NOH3O?=
 =?us-ascii?Q?7mU9qA8pp0K5tdCV8XmG9MAXwHXRFNHE/HuER3w4KsS17gsN/uikQ9Uan2qu?=
 =?us-ascii?Q?wqvxH8VUcyE3y6fe21Nx6PUQO5UlPqi6ByYbbAVHNNJZQPjTLor/jX0tp+uN?=
 =?us-ascii?Q?7ZIwXJT2SHZacXJ3VQQfJOCJh3VhHBPyleaLDjI+/K1HHISNQ9uj46ymQjar?=
 =?us-ascii?Q?HnMgl9SDDuQzgErvabHaJI2d01XL6s5O4KNQhydl8AxpogrL7oih35R+CEBV?=
 =?us-ascii?Q?a3Ur3GhOAf0HeSUZCmxj02g6D49fhXY/LZZIHwn3UWnmDubKb3OjOlO3GpxN?=
 =?us-ascii?Q?EPYtcxMptC8C9K+z28A+NGd1op/OstM1HZTd1z5e9l6YiBHVZImTlwjnt1iF?=
 =?us-ascii?Q?b1bF/oXvgqPwvWYncbhnPyJ0KcBbnrSH8unkgE2aYLky8zb/vdCYEdRJU6aR?=
 =?us-ascii?Q?M51DVl/eviLpoVw7iMJJpoaPbS2DscNk19a1X66r1LcQnbFuu6ydgNUZAg3F?=
 =?us-ascii?Q?Tz6lFbeeMiPurzNep4+CTbi/KuBviZFUZgSwDT2XMPd/F0yFlgPkaX+4OcwQ?=
 =?us-ascii?Q?Z/S2WChrqfg14ehdfDZ97g9OBB8GHPUSXUdpIfFZiUjZN5mfcT4teGWt9A+F?=
 =?us-ascii?Q?tsHVGBggwaHjv+zFBN/pRmLpyntMk7Sp1umIbg6f4ZbaxNGO0atwPVBfBRFa?=
 =?us-ascii?Q?vBKl5ZhwE9eTOWGvNvfDHmtbQKw/StIx/0H1GJa+SMyR98zecRO1mS9EBLYg?=
 =?us-ascii?Q?xs1NJm92a7y7Tvq9GZ0327H0xzwiAxEV7g3dK9qGGJ8CUQiz6f3kTnhMmeI4?=
 =?us-ascii?Q?QBDerwfY1d+wbTfyJMqSKtPP68jQ9gZ3Vn9LlCkpWUU9GVLYPIwmuZUnHZ5n?=
 =?us-ascii?Q?zgyEpaq9j5hkOvXmkCoWTI/cJNUbl+/YZWCUG0rmpMPe4b7C9jUCGHmoDog1?=
 =?us-ascii?Q?/fbY0KR6dkX/MGAPSZ3eTdDNrBhtxQG0ZH5TZb3MSwtMLJBgOv+nidWGD5yB?=
 =?us-ascii?Q?N0+HUqjy1KFiyUqz?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161811799003)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 TuRdeA+fSh4VWQFe6WW7Q0eykYbbNYcsBQv5uAzbwqs8y7tEY+opKfMYPW/JJdk/p1efQJitMgv8tMqt9hlFWSyladJsuzxzv7VUajOz2+VaGmYAyXkC1FMN+swjFL5Xfoe6rvE0D7a5ZiyuQaMuvd9zyx3pHFsrxBr4VOR58aXwkZleJGuFk5pmNL7nSxJWXGMWwsijhGXsGvLe/HxiVnpgoieChYyLg0s4N/Gbp+ybHyxG/lmx0s8kvkPQ/5QQGcztQwMDnDUPERUgnyNJbb/2le61zCVE47j8nWZrOWKCBVVkmvZ36z+g788vhQL/jMT88QA2znSSz+60uRd1Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6621
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.10];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.10];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce45e59b-c58d-44b2-2685-08de9f23a4a8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161811799003|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bK0I43aW/Q8q8NcS9Z5jtsmSvORLQTCsWDg31rihBE6/DqNpbgXfAyT9/es+?=
 =?us-ascii?Q?E6x0nPcKQXMbhJs5d3F0WyjvZPn5j1dp7/BGcyh5XsoViI4KIpGh5dCIqWPI?=
 =?us-ascii?Q?E/2wwRv3so/rTLWAbGTa45KWjQv+LbbzuiQiuIQW9vG5sPPBlr2gcaXfMi9m?=
 =?us-ascii?Q?oXv3lDfdSCOlMqAVwsuw7lf7CGjgVGj5ogttpYBbgNaX+N4PWGv8pLIwGTu2?=
 =?us-ascii?Q?ergRpp+NZpPq04MFiGrFnqzBppl6lO3rKynXGlS0bF98uHMqT02p+67OJenr?=
 =?us-ascii?Q?xXUNYbLgtcquwagnk0m/rnO8blwQBzoyugoESRus6odvZbRfZ1nII8lXgGYM?=
 =?us-ascii?Q?sklF3GBIyfDLoRtr3Q4E8b6AfwGssC65jsiASyridm81L07saGvWH9NPMVmr?=
 =?us-ascii?Q?BjVDb+QnYsYmfdgQZvzquIyofwZvM84GRklLDPg5/WPRnNBjxAzE3sp68Zdc?=
 =?us-ascii?Q?Xvtpt1aAbxHUQBkxxKTNR6j/IumwqEl0wilmf1LNJEBY/6+lQWZY5FJgXNXA?=
 =?us-ascii?Q?+t7rcJKRDuLFi96duO4kBhwqCfd3MWrBrPitK6GmmnSdEf94V9w1ZF5jiokP?=
 =?us-ascii?Q?wiPrUZ1XlWqDw/u8EwBXFEn9c4ZhxTOUQF9n6nsbnc6wzRA/zazpkdA42Av1?=
 =?us-ascii?Q?gdBLmlZ1W/d7pQURml6NpqonStkrPSEoY7ZTbWK7EYhdcZDc8AgBuT6helPP?=
 =?us-ascii?Q?DS+utzyaY9aEx0auHj9m0ZyWg05HaZXkQziuKhbPS18Sq7hxXkqvoMYKWcC2?=
 =?us-ascii?Q?NeDgtRn3plmxGEkp69ny/hlqPeVRLx8ud761rOub/RlJqhWe4HPvGD9DSOyL?=
 =?us-ascii?Q?T1nd9dVoPU0y/1Mj6f6IjqoU02mQSAO4mGs4oUNqagPc3JXd+EEzht5kd0UL?=
 =?us-ascii?Q?s3DixJm3MGqO1zL8TagFfQ5PRlNBtb4gM0SfTUjyzFve4SgjcDEjGuvMeuTR?=
 =?us-ascii?Q?xEFs6AI1+YnZFq8lVhc+oEYMT/AUXELNXwZ0I3eaETaHMrhUWtJF4nvqYis8?=
 =?us-ascii?Q?nQpNhU/PHibfj0s0jH7nPAHmUskSGPxtIyXNOg289Y7CL04dgETs+LwZqS9p?=
 =?us-ascii?Q?Pr0LwBHbWMvBbiCIRzCFqoiF/TgzWGjPhpEynq5EiHepJU3tNdFF+NyiLdrZ?=
 =?us-ascii?Q?7V5i6KiLnEPgxsqTdj21z61WU5fp/Lw3yTobFSpBneJR1mJEDyxE0EX7nTn0?=
 =?us-ascii?Q?312Txho6ubjJ6Jcr?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL2PR08CU001.outbound.protection.outlook.com;PTR:mail-bl2pr08cu00102.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161811799003)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aZSD+No7Vpjq8eC+HXZ9nbtAMqsGxEaP8QH3QoKY/BCyvcequsT8YLiy2BhxIdOkB4J99oF8K/C+P9g9OaukSPAWoIIe3/wx+akvT9b2EzKY4+HdTtA9P61enKjYi3uDlA8n1Pt/DPzBQvWhboG7rYjngIDxd+QnyE4j900wxKT5N6ZLpsNWwh7ScuEF32bTvsWxD5SVv/M1EQ+sZFt5iUpqDZpJKli0O1BIfJ9wB+i0N2f+vJrehzJTkxjZ1Fv3q3nw/xtko0Sp/DnpiQ5wjZ1SwbuYKNhGa0cMmw2RsrYMMCL32nMvX6iYC7epHVdd6yqeoz2rZIJ0x5r8V4PMyqXtG8jP2RWyC7mpizogZfV1JMjJJbWPAynt+/VjulgrbKkbAn87n6nvzZ4KBjOc/WQuCb9YmMpViqaWv1Z9dyy7WePvZq/O/CyNGNEH6xI7
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:45.1508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b54807c0-55ea-468b-4acd-08de9f23a9d8
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR08MB8595
X-purgate-ID: tlsNG-ef75cf/1776720471-AC762C48-5825F5E7/0/0
X-purgate-type: clean
X-purgate-size: 1730
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.309];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email]
X-Rspamd-Queue-Id: D1A9543409D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit adds a p2m class to the struct p2m_domain to distinguish
between the host's original p2m and alternate p2m's. The need for this
functionality will be shown in the following commits.

This is commit 11/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v4: Change return type of p2m_is_(hostp2m|altp2m) from bool_t to bool.
---
 xen/arch/arm/include/asm/p2m.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 62261d41e780..8ae0cd7ff589 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -32,6 +32,11 @@ struct domain;
 
 extern void memory_type_changed(struct domain *d);
 
+typedef enum {
+    p2m_host,
+    p2m_alternate,
+} p2m_class_t;
+
 /* Per-p2m-table state */
 struct p2m_domain {
     /*
@@ -111,6 +116,9 @@ struct p2m_domain {
 
     /* Keeping track on which CPU this p2m was used and for which vCPU */
     uint8_t last_vcpu_ran[NR_CPUS];
+
+    /* Choose between: host/alternate. */
+    p2m_class_t p2m_class;
 };
 
 /*
@@ -424,6 +432,16 @@ static inline int get_page_and_type(struct page_info *page,
 /* get host p2m table */
 #define p2m_get_hostp2m(d) ((d)->arch.p2m)
 
+static inline bool p2m_is_hostp2m(const struct p2m_domain *p2m)
+{
+    return p2m->p2m_class == p2m_host;
+}
+
+static inline bool p2m_is_altp2m(const struct p2m_domain *p2m)
+{
+    return p2m->p2m_class == p2m_alternate;
+}
+
 static inline bool p2m_vm_event_sanity_check(struct domain *d)
 {
     return true;
-- 
2.34.1



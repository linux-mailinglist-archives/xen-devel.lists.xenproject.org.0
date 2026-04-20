Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHDNNWSa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209D43407A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287491.1567892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9T-0000qZ-PZ; Mon, 20 Apr 2026 21:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287491.1567892; Mon, 20 Apr 2026 21:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9T-0000np-Mi; Mon, 20 Apr 2026 21:27:31 +0000
Received: by outflank-mailman (input) for mailman id 1287491;
 Mon, 20 Apr 2026 21:27:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9R-0000nb-Tp
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9R-001Myj-6m
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a3f-bab6-0a2a0a5309dd-0a2a45058cfa-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:29 +0200
Received: from [52.101.52.98]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a3f-aaa8-0a2a45050019-34653462995b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:28 +0200
Received: from CY8PR19CA0010.namprd19.prod.outlook.com (2603:10b6:930:44::16)
 by SA3PR08MB8547.namprd08.prod.outlook.com (2603:10b6:806:2ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:23 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:44:cafe::65) by CY8PR19CA0010.outlook.office365.com
 (2603:10b6:930:44::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:23 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:23 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8p3bhGz1wdS; 
 Mon, 20 Apr 2026 14:27:22 -0700 (PDT)
Received: from DM2PR0701CU001.outbound.protection.outlook.com
 (mail-dm2pr0701cu00106.outbound.protection.outlook.com [40.93.13.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:22 -0700 (PDT)
Received: from CH0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:610:76::12)
 by DS1PR08MB9786.namprd08.prod.outlook.com (2603:10b6:8:208::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:17 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::30) by CH0PR04CA0007.outlook.office365.com
 (2603:10b6:610:76::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:17 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:16 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:14 +0200
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
 b=Y8yN2cXiRlcg9ePW0kkWk37TqxMCFAsAcf8eIlmp16gXKWoMC4+PZohOOlMpVqk4Rcpoo3aU30L6L/OGEl7vcOzICls34Fjf8mpkKwoiko3ebg5M3wkBIIjancpdvs5+I4S/vrmKMUmYD39thawC/TKzXgct83xgvaYIIJrcNube164rsPK/BaYd7SMAq5egSxxtoWzczTDi6oF/QMyGBJmhSV4cLH1y+bdwcOzN+zMn2glz8GKYpZ33pVkg7IarXx0fDMcG3xh4tIDTcABoALomCusfs5vfE+QB9G4uEBvQXeZu+cvHDFuDFF+a60WucCM0HJ38a/Zh30aaQWPTOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3upe/u9EtcR35MDKboxPwogT42enux6AtMfl8vUTCc=;
 b=pE9FAet/zXsgROA4uIYIiotK82cBFOt7CrV/x3RRYFgnUD2CJfsAEOlJrrSqoluMwbBSSW7v56uI43ZBGX18t/pc+gtePSVwNLd+eFPAPx6/SSlyLZc/ahG/eUrKVixh2aJIvHJGT1apxVejQXif9dH3DWlpIy787N/avd3u7MkOq0FzMrlmN2JLXJy/8bxphexlOGuj/ApeHW8A/8rkczgXwUQhcxalF2ltG0bMWOP6umrw9MntC3O43w1tKXrfgOd2kfUCuoqyRjugLXSkXsoGoupTXBEvRjvRxwyO6pn0oihmPOGzXmSYQ124NU4V2ktMbQQtO3neY5qoOuUXlQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.70) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3upe/u9EtcR35MDKboxPwogT42enux6AtMfl8vUTCc=;
 b=nNhbXk/IOFWKTDgGjVBsiCTDIB1uzy0KPYxuDmYX1Qyxh0rXNbPnnsvemZzDM+OadCf9p98gbxtZE7YRBbCc3TSkaEiVkoDGdui9wJrq714kTxnaWVKhOGmvNuCf3tLZn1pzs0FM+agDxxfvQHT0b4zEPfBax6C/8xod9BGe74Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.70)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.70; helo=DM2PR0701CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX9tH4w95wXGcaNJ0B+AlZKWP6KKKGVGYqr5hdBhqZe2wKU4ea1oc+BCHuHQUbS1gkZ69PFWj2mjJnYEANU5yKtl4Gf8BvuyHob+nzizYNBaA05ZzaUDlO6EOVh9JhTZfye3IrXvHfd/E8AJp9WvHFG1mlYeBl3G4OfMsl9go8yzZ1dUWqteXWzPcwjDUTYqJTFU3D3AGWaAbJ5qa+XbclN0sJs+riozFtoxaR9Mg7ABgoq5W9s4xSiTmK7rA8TBw2y5Xrjw4hiWSDpNS8XaWRd6/b5YwrMIXgHUSA/pl/uXPyMqs1gzsBu/acwiqwQ1xl1o9qhaR5rW12dOC2WBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3upe/u9EtcR35MDKboxPwogT42enux6AtMfl8vUTCc=;
 b=CXVLqTRxJHm+UbqGX3UgWBpuMjfuWyQpLPZuKVRvn6vigT8V7n3FXVNhjNCEWFOZJwWCsBqRp4XU6terx1HUozkWbDVbHjvIMYuzLS97esuqrDeQTExhFQS+UjOCzIGHAIzviREyJQsbmlEMyROEtLHMFM2a2ePThtuqhuFkbrWsevpslcmAniFNaTVlyEaTghhJtRBZY3egYXQAsdL4qDj64BxbtiEmeJo47VwHBwlLOU0IQczeNLjC17N7JKgmF2yxa71wjp7t5lJP2pM7TToeOchGEwj3cWS88v9uQs1S96xrqFtQOMsu1a7Mm4dQ3MZOj86aWkvReGU0i+kG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3upe/u9EtcR35MDKboxPwogT42enux6AtMfl8vUTCc=;
 b=nNhbXk/IOFWKTDgGjVBsiCTDIB1uzy0KPYxuDmYX1Qyxh0rXNbPnnsvemZzDM+OadCf9p98gbxtZE7YRBbCc3TSkaEiVkoDGdui9wJrq714kTxnaWVKhOGmvNuCf3tLZn1pzs0FM+agDxxfvQHT0b4zEPfBax6C/8xod9BGe74Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 11/43] arm/altp2m: Add support for HVMOP_altp2m_get_domain_state
Date: Mon, 20 Apr 2026 17:26:16 -0400
Message-ID: <20260420212648.208640-4-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009A:EE_|DS1PR08MB9786:EE_|CY4PEPF0000EDD0:EE_|SA3PR08MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1834a0-a819-4122-56ba-08de9f239c9a
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ZCYbrNfOJ5NFQ78UP4ItYLOAnFxhrINg1d12XNUBRhPr5QliErvnGFlz4ImE?=
 =?us-ascii?Q?LTUr78bPnjI/fMfxuRHwu+WeTylm8RFBWnY6/CtXwSRbBvnXyk52uuaL52LQ?=
 =?us-ascii?Q?zbrj9i8cO6KH8bFXO7M9AdpqcrZN5QeCQRZIAKFnUmcipEfw6bTxJJBrkUZw?=
 =?us-ascii?Q?VTw0D8ppes1sj18eGwl/0Hb/sDDm81ajv82fG4L7R0eQMJXxCAt008d6Cge4?=
 =?us-ascii?Q?j1UlxrB86AUMUZKP92+t6lv+gzdyWzpeqiLfJ+De7btuvZgXrMPJeGLeasbe?=
 =?us-ascii?Q?gydwVgjfyVZfsCgMaDnvYhjV5ddTcKstp4WPG6R/KWdc23GWmFt5YQz+1u46?=
 =?us-ascii?Q?BQs1rkrib8L2oiwmj6ltJZwBAQRJoZ/nOt4FL1uxD48hzzpSGvYjBLIzPBln?=
 =?us-ascii?Q?RTiTb2zAfE9YROEKT3+lkje2V8GhQ6xZyHJMIhaulh7XWmbhQT3yXBEcSxBc?=
 =?us-ascii?Q?Eb91YEXszh1Z5/HQokpBaf8cOD2gLuVfR2CQnU0qNJuBZdCAexYpmbVhf2kZ?=
 =?us-ascii?Q?tpd4gYtuccR3B5ZC666P5ujEO8iJCX3cRfZbyQV88rwpbsXzifddbYhGQFiv?=
 =?us-ascii?Q?b4tzKBPzMDm7jjSKRuN65KsHcIPj9vLRav0HnFEXcCbOLVTwhecqqa+kK8Fa?=
 =?us-ascii?Q?GWv7qn81+mXM2qQLyCiiy3sN5GYUzHhKQUXxo38JZ3hnYjogckdHdgO0rXzN?=
 =?us-ascii?Q?UCu0Gcf9OyP6wCcCzHLb5dobtqx0/84XYCeWizsagF+Q8EqCJ2wfFix6KaRH?=
 =?us-ascii?Q?XmCPTr7391/doxMsjnH0TguqSGKWqofx4xOo7BjLIsxXdNHrAOmpXoepxg/t?=
 =?us-ascii?Q?yh4r5gw/JZm2AClcQQ16fUva1tsYSa8Hnrc5q5KqnS9lK8zLGr0RlaSPTFkQ?=
 =?us-ascii?Q?sfSc5/W9bV8Bt8D334+0Q6jcUyv0BoX1W+7a3sM1q5OFEyJjvcbJQU+eb6J2?=
 =?us-ascii?Q?l8uqpAL60GgAoQRGzV02rS2bJ/x6yG61ulStif399qI+DLvftwAlEdbok3uK?=
 =?us-ascii?Q?9xymINetrdhN9tYHZRriPMQD7qdLMREe7a60FZYjHlZi1MJwXvAiI8c9WY1y?=
 =?us-ascii?Q?wZeYKWXVsH91fwhf4OkTEdxot0XlGBIxXXykNyk9xzm9nnoxDR1iTlzWr6dV?=
 =?us-ascii?Q?YC60fV6tSneBqb0ZZ0ny8yeHBQ2+hBVtFyTR2S9+WK5BH3Ge6VeQQ1V0Jhkc?=
 =?us-ascii?Q?99FEkTPBS+m47EbSZuL8kuH4ho3Kv5murHthB/bonaTJFMto+XxlXFq1J+cb?=
 =?us-ascii?Q?YIPkkktOe/64JXMZRi5exZ49yWWWbyBTiwIRz07KeQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 V4t3E6/AMqj/psM2Su0/E1xsXf7WmVSqynX9NXmv7ONq1Qk2CVAG0UYSNyR9SRZDw2qdiYrbtq/b639eDHG4S5L2YyblTBjo6uq2zm+1Mv1I62KT+MMtjJNeCnuH7um0wuwNvMoEYwsL2dKGb6FX1f0iTpWC/M6HtuJ9WpqoYlppqIHf6xMSzGfsg+nKc0esdXqVWMaMN4XJ5PzPpPWM+eaZKXBW/lWU/SxeOUen5NZ6B5NhTuj9U5koyPr/d5cI8PZ7jvPRRRH4u1twYY7K/OdojMgm4kDu9Ju5h6L39qo3M7HFfzXgRTQgeMfEyLDnXMwX5Pd8ubyehY/zuQTaTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR08MB9786
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.70];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.70];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3a081c9-5eef-4f7d-9f34-08de9f2398f3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|156008|14060799003|35042699022|82310400026|376014|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tmsahsh1AjraGrRanQqW3bzblgUEbfFRXgoX94AILi+CJ75dNDG0JrH60Ce3?=
 =?us-ascii?Q?ca28FrYbpya4Z4tnLHHf2u5Tm4cD7yot2PIaFpTeQ6tDhQAnOiR+7iu7mW86?=
 =?us-ascii?Q?caPLg0WdqVm830mGv6D+Xuk32ece06hgma6VGdrTVuNAK599WDMEfkWGdQco?=
 =?us-ascii?Q?nteJzwcD+PGfhWRmbpZwOUYGR9XkR2ViDfDjc/q3AG3+zZ7ADxRuWo4gqqRK?=
 =?us-ascii?Q?utaqu5lZVSSnXGXEGRIVveNruyska1byj5i0rhY9n0cPEDsVaofeSyqHTVCF?=
 =?us-ascii?Q?E2Tly1Fkjz2LXQ8fniJKs0WG6EOiY2RMQRXEe+XN354C3IZ+Pk/Z368/YCWE?=
 =?us-ascii?Q?k4afv6oeboS6z6jizEcPpo7pM9hdElWpjv02WOBb0FVUAavoR6yOzfkMmnga?=
 =?us-ascii?Q?/z2BLitp4VVE5VysEBRBRVKq9HDjIbfone4AQzczoGePqcSC5O7soglBHELb?=
 =?us-ascii?Q?ZZ5DyB3u4JuJ3YFIaNxKLCC7IySu+45SqpTrfMBchI31u5ec04YpAzNZqTTz?=
 =?us-ascii?Q?Kv1p3Xcq3kgUJVyTYl6E5FNTFkj5/TBQwnR+Xn1OVu32Uk2wI/Gljs4HULsZ?=
 =?us-ascii?Q?c89qzVZcXwT5csHMj19khVHqarpDdSkKYfaCxMjwXCNTrucfHpjJsqiQDg9Z?=
 =?us-ascii?Q?Gt8/QZBPj3k3DXFCCbjYXiK9HcBvs0of06etq8/7u6598LKUhPyBa6YlOnro?=
 =?us-ascii?Q?JZz1QvW0f8bFGIyi2fQTVbWXADcBfrx+lJel/e8SI+JmmpAV7IVwoQOD9ZrR?=
 =?us-ascii?Q?BdDvJtMbmQKUfht+ZmKBCb3G5u9KRFQ8A4f1mvxvEP+LUCYLoy6mOo4rSgXF?=
 =?us-ascii?Q?vXDiUaX+6yz9cTimlbZIy71zcopeaKV0BNoquIy+CCf2Mqft12HwD1/U0Zue?=
 =?us-ascii?Q?ZYCU290hqSnMWCSU8pjVZW8u7IT8YFfG9Bzp4VeZu6FUVxkbNxqHAgCR/yHO?=
 =?us-ascii?Q?B2GKpdbBuRMjEHSP//wDLqSJ4liG1amtGa5KCLOJ+C2IM0izGH4II5ljFkh9?=
 =?us-ascii?Q?olk8/lUujDFsB1igzZyDLmtAGMIQ+R55wW1FNqfH0T4SM6iNkO/8fGjk9Dg2?=
 =?us-ascii?Q?X3ryIaJIGMUQMq3TYbIGWJNRjwEaIE9l30sGXtY6WH5kRu7lDtdtL3lseC3K?=
 =?us-ascii?Q?vavxcaDpp40Q/cd3UNFtgCjM+vtuwADidh1qFQef6H/amj8MyOeSU2h1o+y6?=
 =?us-ascii?Q?igKzDYpXJk9Vd/yTahjbBLapzakWRKbGL+ucPEnaTQTiDNVYnhhyN9NIM/eX?=
 =?us-ascii?Q?45eVDtBwjO9zhkkQ1bs+pWmBdbDsltTpjHSAPQlywQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR0701CU001.outbound.protection.outlook.com;PTR:mail-dm2pr0701cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(156008)(14060799003)(35042699022)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6mt3ceESEHsvTznaO1cMjDFf382TVKM9D476cpVD9f7Mvbv/b7/9ZJG2l6mrRLcGWBkS/IElko37Bl04ObDzJhvapBev9LH00hX5w5EiFs9HVXa/BhLFiVyZDt4hrJBjVnIPwKp+5p1UsoTJLTHZRuqoNmPv75/JgW6YPeyIu9FDnp8Y6H/oFSo/6+r/JtXVXAu8iV0YX3LOy/zCa8Y5nPtzwfjtcqTP0iWCxWwKeYz2d1vuMsuvo0bQ3RJyh6q8mP5IQlH3NCeapb8p4eYTuC80e8w3K7wbGDPPwjBVdBj7cYnoB44CdAJQAEtjaeqmNafyKfoOadVK9mU+6PiYFlzKyKUG2sRMxrEPxQcThArF5ZcyFsqZ/Er5QozS1yzSwxDG7R/4MrEcw5G4G1+RF2HmxJ+IpOgWWZ2iOoesR6IR2Zkg3dJIiN5R25PtO+dK
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:23.0297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1834a0-a819-4122-56ba-08de9f239c9a
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR08MB8547
X-purgate-ID: tlsNG-c201ff/1776720449-E19A5443-4A3B7F93/0/0
X-purgate-type: clean
X-purgate-size: 1215
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.297];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7209D43407A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds support for the altp2m_get_domain_state HVMOP on ARM. All
code used in the command implementation already works on ARM, so no further
changes beyond moving the #ifdef are necessary.

This is commit 1/1 of the get_domain_state phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    This commit can be squashed into the previous commit for the actual
    submission if that would be preferred, but I thought it might be easier
    to understand the command #ifdef gate approach by splitting this into a
    separate patch.
---
 xen/common/altp2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 6481fae1ed12..3a3283f0860a 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -124,12 +124,12 @@ int do_altp2m_op(
 
     switch ( a.cmd )
     {
-#ifdef CONFIG_X86
     case HVMOP_altp2m_get_domain_state:
         a.u.domain_state.state = altp2m_active(d);
         rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
         break;
 
+#ifdef CONFIG_X86
     case HVMOP_altp2m_set_domain_state:
     {
         struct vcpu *v;
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPt2BpOb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A0434201
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287757.1568163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEk-00088d-AT; Mon, 20 Apr 2026 21:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287757.1568163; Mon, 20 Apr 2026 21:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEk-00085v-6b; Mon, 20 Apr 2026 21:32:58 +0000
Received: by outflank-mailman (input) for mailman id 1287757;
 Mon, 20 Apr 2026 21:32:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEi-0007oF-78
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:32:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEh-00CCKM-KH
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:32:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b55-bab6-0a2a0a5309dd-0a2a450b9074-22
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:55 +0200
Received: from [40.93.201.103]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b85-212f-0a2a450b0019-285dc9679ce1-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:55 +0200
Received: from MW4PR04CA0174.namprd04.prod.outlook.com (2603:10b6:303:85::29)
 by LV8PR08MB9151.namprd08.prod.outlook.com (2603:10b6:408:209::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:46 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::e5) by MW4PR04CA0174.outlook.office365.com
 (2603:10b6:303:85::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:46 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:46 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzH16Phyz1wdP; 
 Mon, 20 Apr 2026 14:32:45 -0700 (PDT)
Received: from BYAPR08CU003.outbound.protection.outlook.com
 (mail-byapr08cu00303.outbound.protection.outlook.com [40.93.1.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:45 -0700 (PDT)
Received: from SJ0PR05CA0131.namprd05.prod.outlook.com (2603:10b6:a03:33d::16)
 by PH7PR08MB8180.namprd08.prod.outlook.com (2603:10b6:510:150::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:33 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::34) by SJ0PR05CA0131.outlook.office365.com
 (2603:10b6:a03:33d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:33 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:32 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:29 +0200
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
 b=sFf5YeEXMrQFY0ppQzS9Tm//Ky/s5COdgL3TWSif2YlhFRzgsxg5/E79AEGIj+ShlrGWUn5Ej/DfzDyekmM9chebCowF4YOqxUdv1sdGLKcrz4oj3iI4gHDc/TCWV/z/MpDxxMw1Y7EmFD6yVkbcOMiujHSEJwYPxyGJurXD7rkscmxeYCokmAIwxJZw/Fj+CTzbqK4HdgVZTg8uc5RW48t8mQy9J83oYu1RGJkzYb/4/cuS9bMNPa7bjUEwmI+oUTGe1hieGqNqQXG/puDmq1+P6cS3SXjES38is7CWJinoeQGdNvF6dLsHgO+JcqQ/lVpVDiQrkrvrCNLrThTVLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZAemscrHmCDKhZ6RJ1poqZ5UjAED/22jekv/5eW7eQ=;
 b=JjvyVMLE/yhSIQGFbV5Eo9mXGTaq+cz80YJCMmomUceEvN2HrWCJLjQd2zChcXjmjxiEmS7DH45DVU4hCrLZ/u4ElAy+f6Dll8ph5dS2Gvgeq4dc0EVvUu39LUg82soF1HQMrfFno0A6mhpayJeVR24rjQYRWrND52XNPlmj0219f/vdKfi0CtomS61Ueuf4Wn/8eMMwSW5Ikj5Zawcqb+tsl8Ac8zXlVN5YhK2XFhAvcXuxTHN1rvzghMXy0X4dtuiU9PhMTa8j0O1Y/qOyB9uhWQMzjEXWcUDQhnEnzSCSPPDOLOoA0vT3iRUOHiWt9pPm3fnz9J6/T9mVo1767w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.107) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZAemscrHmCDKhZ6RJ1poqZ5UjAED/22jekv/5eW7eQ=;
 b=mjKk8oE/VWBVx0KU3IdA0yxKAjFEcer/5adEsu7MqjuFViR7teWgqUGInzI7A969eSCRvfBG9kuEFwTQAiBPYvFRa8FtdZIqEFobbWsk7AGLh2PibGH77v8PRnvH2QHoXHgNAP+VIUmwss4qqR7vTaCH87i4MokLSkiTZ56T+ow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.107)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.107 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.107; helo=BYAPR08CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcF4O5omefIXk+Kv++dndUdKdoOlQzX9TcbZM0rxbuqC/w9FPPImO6SOH92UWtaHZ66ynYWHr/hqWPEaKNzRMCbUdNGxLRZzoVER+JtoviPNBaNhH7If+xKci7SKKsPGgYgkhRUWyfNtlt2Set8ExwTL16ZoCiUFBHf0fe8wci/BQrzrpdusDoA2oDSP8IRjsFI/QL/lpPnutf+WU637HAg4PQLyd4P7+Gjef4CNVKHt7S8BZxSORA+MIGYPjbCiLJl7PfsaOdfHlIDrJ9thEsT40TXdQvksm1mWqnAezkP2eLaZv/jOUBNe+2SQBbAFRefMI5+ejCAzlpWTjpQtmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZAemscrHmCDKhZ6RJ1poqZ5UjAED/22jekv/5eW7eQ=;
 b=s8OVYuWfKZN7KKPWRKjBKwzyaYTBVyDphvM453gsG/Jxfo7sqssPYDhYRB+AtwKnIrV375uAW7IksQ7MEiYgFdBqFy3wZa9341t5ZZ+bLx6I8VXCl00Qj1IKtzEfygfPtW420CnCSzNmxrPPcOEktXFQhCjLfaBMSy5xrMOivd4YNfZRGo4751yVI1krWsm8SSMGsbSWX0jo5mwyugz2OOiGnjKH0OiKsv/gO5C5eNndhtglsMEn4p+KZ4u1VGZvG0N62gqH182bVmgiFeFb4LKMDxo1vM1xs3a1M8EFulXOlm24jIek60nBk+1tjAGTh4HJtxIemTK1DqElKSAOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZAemscrHmCDKhZ6RJ1poqZ5UjAED/22jekv/5eW7eQ=;
 b=mjKk8oE/VWBVx0KU3IdA0yxKAjFEcer/5adEsu7MqjuFViR7teWgqUGInzI7A969eSCRvfBG9kuEFwTQAiBPYvFRa8FtdZIqEFobbWsk7AGLh2PibGH77v8PRnvH2QHoXHgNAP+VIUmwss4qqR7vTaCH87i4MokLSkiTZ56T+ow=
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
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [RFC PATCH v6 03/43] altp2m: Move altp2m_p2m to common domain struct
Date: Mon, 20 Apr 2026 17:31:26 -0400
Message-ID: <20260420213206.208750-4-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es012.ebgroup.elektrobit.com (10.243.160.140) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	SJ1PEPF000026C5:EE_|PH7PR08MB8180:EE_|CO1PEPF000066EA:EE_|LV8PR08MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 87086589-79e7-4a65-e530-08de9f245d0d
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|7416014|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?dtVa0J8+xESiURrGLwikHDuCjwQgaT3cToUdKQMbjDvUt7tvjoXm2sM6uiNy?=
 =?us-ascii?Q?HGrZP/m4YqzHt16JiWXrXEe0sOTsZjZsaFk+hwgEDZ6EvBotCQPKXFL4J/Ky?=
 =?us-ascii?Q?JrGLnEW5cRKJH9kRkrz7U+oquilFFULCzO8dyRcecodbp0iII43xqbvwciz0?=
 =?us-ascii?Q?uAuDfLNkBphenszh0Lj/nL0w+tnqKnoVazv7ucsiB17UjxVG+dc+9HzjRFeo?=
 =?us-ascii?Q?B/snrxYZ4yMDUrnkcBFzJ2KjlqUcL5g0CQ3e8vzo19EFDLM+jo2E7ctlwIlJ?=
 =?us-ascii?Q?Dp5qfDibTeHtrxbc4IT7bCszlJmrWeQmGVU935miZSay3rYFIt12jVbnA/St?=
 =?us-ascii?Q?vQKn8x9SuGBIW5N8NSQmkE28rWeyAULrNUWTV3WNvs1NzJAp752a3fHXfIzk?=
 =?us-ascii?Q?66nYMeGrdzVIPYYkSM6N9IBeFkB+14R6/W9SSpfLC6G1vcvq9PB2bijHryMB?=
 =?us-ascii?Q?YKVdCPtgJdO4mGkP2K2Kwu2z8k3Z9JETrb9eQeUXln/itxPsTYAvAcTn+rNJ?=
 =?us-ascii?Q?yQlBvgQabwPczOH9mX1dczqi5/dQmNSTTpRjDVBhFKipv3fh3ROBq/9EP31P?=
 =?us-ascii?Q?u/ilV/CMu6m1AzyF4XSbVi4FVtPxbtJMoariJEplU8bIiY09CjU2kLEXTvcM?=
 =?us-ascii?Q?nBziy44RXeuzzlP9LA1+sZH8lx1EZArS8hYOV+dkO/cwxdwTd8XSoVNDUIfs?=
 =?us-ascii?Q?pDzr+dyf4uBJ+oFP9dAGD2A8890Ud5D7d/b3QqZRjiAFJuelVKLuSmfZqIFZ?=
 =?us-ascii?Q?Nb4NO0Xn548wQCndkP0a1GMU0R93mM1lPXN62Udfb6N1scUuBVgnakFi9wfx?=
 =?us-ascii?Q?VzAEZ6lx6qj1mgLXoWcg9jr/A3DvrKiCclMGqT78yfezAW9gUW3v9XUSxzmL?=
 =?us-ascii?Q?CJD5dQ4Z5KO2MAn8VQBywoT6LxtEWq6cc3itKqj9vuM1lXZ0gi+GFQS0bbfj?=
 =?us-ascii?Q?Guv6Xn3aiOuz2VQ7CahQdP47w14yA86EhsH9uLB3A1NoRbA4eaGL1KmUC0vM?=
 =?us-ascii?Q?4Hsif4Cqg4AtvQzKjewi0uzZKRZ0LeV79Bio9t4uooyjy3GkDrhUmGgDTwre?=
 =?us-ascii?Q?qhGa7Zf73ybAZ4MGMGoLA6ogEsYsRlnFBBv6IXR/3WFhJimtRIM/KKIWTzZq?=
 =?us-ascii?Q?hcDjqDJaNbepexonEomP1vdm2yC2hMso6v9FWg37Snca7gGX75dRD/RsCNIV?=
 =?us-ascii?Q?Io6etLVDtNmMuxPvPdssRNXRoB/mFfpf61H8mWC29m5Z2RUSRnwHnghWWcJ/?=
 =?us-ascii?Q?VF9EzjSrBpWuxeyh91ls?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 W1si48NKmjL2upf5qmDXQZvXx6+mrLFLbhY37+yfSGjtv1lH2HSt4gj4m0ScxWb3aPVW3s++hAa76Ua2kcM2SYFPhOtQPOpnEebJ/+zn6CiDuApPYsmYfZ4c8BGBoVg6WYDfi/PysX2a4jEBwKqJQWl5jABCAgY9sQvdNKuMPD2ke8LFe0hZe1+hGMu44OQAoh0/5/2gYFOCJeXxcBtWsm1FkW1/VkO5aAHjAwKaB8fIbhJkEYnYWZKJpjg1RpLOgtMnZ0Vfvwesw/wGWxmzpgLpt2ynXucENd5udMwjzQQeh5k6FDRQ5IWkCDy2pSzaKNWWRfwMHE5/wD+k/rm2FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR08MB8180
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.107];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.107];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b5dc6a57-6f44-404f-e12f-08de9f24553b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|14060799003|35042699022|82310400026|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cQHJ1n0L04t/0Euq1D3D67SFd4uMZOqBtC9aDCB8xPFG/3qv1/cn4HwPzlGQ?=
 =?us-ascii?Q?QT7lG5v38XS18nhEvGWWElFXHHDcbjuDPxf6Vau5FB+FeYbewH0pt4QrQdni?=
 =?us-ascii?Q?3jRhaq6vv7tj8g7dGXBzyhw166MhuIeBKMlggrx728ufBqcy/BROx3XNH8wa?=
 =?us-ascii?Q?sqZfXGs2NDxU87AiFvLA40/kRhQZdbktL3oZEUkByL5htwwOj/Z7y1qpKv4b?=
 =?us-ascii?Q?/K+FFUcf+v4O+xOLh7DPU8EkXwVvamdNfPvhA3wJRqxgrMuwBN06U2vbuCAA?=
 =?us-ascii?Q?2+vf5O3JrAq3gPgGXuhBvgfFD9hTUy8Z+Y9fQgpwG0+wEtgUjiZC3gDMZAML?=
 =?us-ascii?Q?BmeG14Gd/SczfeW7jjDVc1//446oWiKRBt59/bvNdhWxHJIFecl/b1sH9Ikg?=
 =?us-ascii?Q?AEHQmhONGInfu0tEXxhjZ+9VtM4WWPaevI8ULp2SwSmM6prfBdLBYulPz3qT?=
 =?us-ascii?Q?NVwZy8t1vZeP4LkuDWYW4XoprT7ZfnzK640X5m0XaYh6FlkHoV1BLnM1dBX8?=
 =?us-ascii?Q?2zhHCbYs58KVPinve0USDkb9cT/b54/ZIrcocDS6xiJI+/FGkEDuvKzeumcU?=
 =?us-ascii?Q?ZA+9WFDtO8AuWjfbP8OKlX7n8zvGJZ/daTGE5lcWSstN9j+H/OXc+GcN69LK?=
 =?us-ascii?Q?zNMJzvqBVYx+EKeX8G0WWpZpqvbDnQPRF+VfoHVxnmV0K/fTTELmxGOOCSjB?=
 =?us-ascii?Q?vKFelNf55nrOwLJmmG0RTeew4EsdLLjw1f8qGOnXxlbh7Qd81Y00vtz0Aqly?=
 =?us-ascii?Q?6TTiHWsrDWPVAVtwdCLvqWKfE19lh6/dFA1YdxsrE/RnIwx/SrXAQ/aWZ1o4?=
 =?us-ascii?Q?UGtTF9liSZj6iBfqK8FWPXLcV1o3NoZHBSe0cnKn8oRH4wDxZ6O1wu/Pyr2B?=
 =?us-ascii?Q?V70Jbr9moTtDbN+SvGkiwUM8m+n6F+q9ifJqdOI2fbnC8HM9EdbAQuI23/ht?=
 =?us-ascii?Q?DTdtrQWzisaL7dCl8O2UH2QfYAGsxdweTBBmSw4snVUo75ceBx5x+wfY2Bb5?=
 =?us-ascii?Q?RavxewyVJNS8PUzZdiLraOb/3guOzUskbdAIWS0AcjyMcRxPcma4BS2KWpkj?=
 =?us-ascii?Q?qjslDMwTJRC/EFKF02reZ5Syuj1OUtMncKj/UkfZM4V6F1h6o6sdardRon++?=
 =?us-ascii?Q?qqSfqzD2F2z9arLFCbZQRpNJ7p3uYTuaP0UNKQ8LMRJTrt+TT+gEXpk6ZzHZ?=
 =?us-ascii?Q?rj4OrENE7saHdutpEUk4yQELOsmocvB8OtTP4f4gdn5OgtM1JFRyhOlvtbBM?=
 =?us-ascii?Q?q5+9gIHaRnFpbp6aWLnW?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08CU003.outbound.protection.outlook.com;PTR:mail-byapr08cu00303.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(14060799003)(35042699022)(82310400026)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+MyymflaFjgAyhQpDKMkybRTtCfZw4Qu7e0pGaYIpfhO1qZzeuA9uL5yJSoOhZphPlORpn37gstjnBRezs6/cshAbJE3UwN/RUzggUcEnqOtzNsoaBt4kJtW6w5P8bNHjcEt2G/dKbQF1KIzr60HrcuEAmkaetSgXDxcXo3zALwFpRgIYpwzUf1zHM6cJ6qezWu5M0yMDKTEn4As5sn6HppWO57xOny9ZvF7Gsq8HyG6ZjP+i/7WOZiZ9zBQaZ+cReTR06QNgZ+faustMpVhQqDi51NRAFdrsTdVtnbRVYGa1oSsxTxKYRCh48m8vIo3jgiTTRWu6X89BxtftKARW93R8kwZF/gKCcyxHW1N0L/FkkdBurrz5jNcjaxlaYQkSAmCCT3kfebLWizRxeHVED4495Ko/4ky2cOloEQe7fMyugAarsih5TjpMG6+SwG2
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:46.1162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87086589-79e7-4a65-e530-08de9f245d0d
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB9151
X-purgate-ID: tlsNG-42698a/1776720775-252B9F3B-295B4CEC/0/0
X-purgate-type: clean
X-purgate-size: 13310
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.192];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 804A0434201
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similarly to the previous commit, this commit moves altp2m_p2m to the
common domain struct. The representation of altp2m views as an array of
p2m_domain pointers is the same on x86 and ARM, and it seems that this
would be the case for other architectures as well.

This commit is a refactor, and no change in functionality is intended.

This is commit 3/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/hvm/vmx/vmx.c        |  2 +-
 xen/arch/x86/include/asm/domain.h |  1 -
 xen/arch/x86/include/asm/p2m.h    |  4 ++--
 xen/arch/x86/mm/altp2m.c          | 28 ++++++++++++++--------------
 xen/arch/x86/mm/hap/hap.c         |  6 +++---
 xen/arch/x86/mm/mem_access.c      |  8 ++++----
 xen/arch/x86/mm/mem_sharing.c     |  2 +-
 xen/arch/x86/mm/p2m-ept.c         |  6 +++---
 xen/arch/x86/mm/p2m.c             |  8 ++++----
 xen/include/xen/sched.h           |  1 +
 10 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ff895f7f9437..0909929c00e0 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -5004,7 +5004,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
                 if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                     continue;
 
-                ept = &currd->arch.altp2m_p2m[i]->ept;
+                ept = &currd->altp2m_p2m[i]->ept;
                 if ( cpumask_test_cpu(cpu, ept->invalidate) )
                 {
                     cpumask_clear_cpu(cpu, ept->invalidate);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 0cf0c0d92087..f8038087e612 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -368,7 +368,6 @@ struct arch_domain
     mm_lock_t nested_p2m_lock;
 
 #ifdef CONFIG_ALTP2M
-    struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
     uint64_t *altp2m_visible_eptp;
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 3a5a5fd43c2a..ec871717a9e4 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -901,7 +901,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
 
     BUG_ON(index >= v->domain->nr_altp2m);
 
-    return v->domain->arch.altp2m_p2m[index];
+    return v->domain->altp2m_p2m[index];
 }
 
 /* set current alternate p2m table */
@@ -919,7 +919,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
     atomic_dec(&orig->active_vcpus);
 
     vcpu_altp2m(v).p2midx = idx;
-    atomic_inc(&v->domain->arch.altp2m_p2m[idx]->active_vcpus);
+    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
 
     return true;
 }
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 08db8f37c1b1..8dd3c0f96be0 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -130,14 +130,14 @@ int p2m_init_altp2m(struct domain *d)
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
     mm_lock_init(&d->arch.altp2m_list_lock);
-    d->arch.altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
+    d->altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
 
-    if ( !d->arch.altp2m_p2m )
+    if ( !d->altp2m_p2m )
         return -ENOMEM;
 
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
-        d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
+        d->altp2m_p2m[i] = p2m = p2m_init_one(d);
         if ( p2m == NULL )
         {
             p2m_teardown_altp2m(d);
@@ -158,14 +158,14 @@ void p2m_teardown_altp2m(struct domain *d)
 
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
-        if ( !d->arch.altp2m_p2m[i] )
+        if ( !d->altp2m_p2m[i] )
             continue;
-        p2m = d->arch.altp2m_p2m[i];
-        d->arch.altp2m_p2m[i] = NULL;
+        p2m = d->altp2m_p2m[i];
+        d->altp2m_p2m[i] = NULL;
         p2m_free_one(p2m);
     }
 
-    XVFREE(d->arch.altp2m_p2m);
+    XVFREE(d->altp2m_p2m);
 }
 
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
@@ -325,7 +325,7 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *p2m;
 
     ASSERT(idx < d->nr_altp2m);
-    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+    p2m = d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
     p2m_lock(p2m);
 
@@ -368,7 +368,7 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
 
     ASSERT(idx < d->nr_altp2m);
 
-    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+    p2m = d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
     hostp2m = p2m_get_hostp2m(d);
 
     p2m_lock(p2m);
@@ -468,7 +468,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
          mfn_x(INVALID_MFN) )
     {
-        p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+        p2m = d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
         if ( !_atomic_read(p2m->active_vcpus) )
         {
@@ -532,7 +532,7 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
         return rc;
 
     hp2m = p2m_get_hostp2m(d);
-    ap2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+    ap2m = d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -596,7 +596,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
 
-        p2m = d->arch.altp2m_p2m[i];
+        p2m = d->altp2m_p2m[i];
 
         /* Check for a dropped page that may impact this altp2m */
         if ( mfn_eq(mfn, INVALID_MFN) &&
@@ -679,7 +679,7 @@ int p2m_set_suppress_ve_multi(struct domain *d,
             return -EINVAL;
 
         p2m = ap2m =
-            d->arch.altp2m_p2m[array_index_nospec(sve->view, d->nr_altp2m)];
+            d->altp2m_p2m[array_index_nospec(sve->view, d->nr_altp2m)];
     }
 
     p2m_lock(host_p2m);
@@ -746,7 +746,7 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
             return -EINVAL;
 
         p2m = ap2m =
-            d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
+            d->altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
     else
         p2m = host_p2m;
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 3d563b3bc2d1..6918a00a2a25 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -524,7 +524,7 @@ int hap_enable(struct domain *d, u32 mode)
 
         for ( i = 0; i < d->nr_altp2m; i++ )
         {
-            rv = p2m_alloc_table(d->arch.altp2m_p2m[i]);
+            rv = p2m_alloc_table(d->altp2m_p2m[i]);
             if ( rv != 0 )
                goto out;
         }
@@ -548,7 +548,7 @@ void hap_final_teardown(struct domain *d)
 #ifdef CONFIG_ALTP2M
     if ( hvm_altp2m_supported() )
         for ( i = 0; i < d->nr_altp2m; i++ )
-            p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);
+            p2m_teardown(d->altp2m_p2m[i], true, NULL);
 #endif
 
     /* Destroy nestedp2m's first */
@@ -603,7 +603,7 @@ void hap_teardown(struct domain *d, bool *preempted)
 
         for ( i = 0; i < d->nr_altp2m; i++ )
         {
-            p2m_teardown(d->arch.altp2m_p2m[i], false, preempted);
+            p2m_teardown(d->altp2m_p2m[i], false, preempted);
             if ( preempted && *preempted )
                 return;
         }
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index a9d6b081a523..e5548e64d8d0 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -319,7 +319,7 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
         if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
+        ap2m = d->altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
 #endif
 
@@ -375,7 +375,7 @@ long p2m_set_mem_access_multi(struct domain *d,
         if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
+        ap2m = d->altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
 #endif
 
@@ -438,7 +438,7 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
         if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        p2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
+        p2m = d->altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
 #endif
 
@@ -457,7 +457,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
         unsigned int i;
         for ( i = 0; i < d->nr_altp2m; i++ )
         {
-            struct p2m_domain *p2m = d->arch.altp2m_p2m[i];
+            struct p2m_domain *p2m = d->altp2m_p2m[i];
 
             if ( p2m )
                 p2m->access_required = access_required;
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 8319733b1bb6..b7d8fb9ad1aa 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -919,7 +919,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
 
         for ( i = 0; i < d->nr_altp2m; i++ )
         {
-            ap2m = d->arch.altp2m_p2m[i];
+            ap2m = d->altp2m_p2m[i];
             if ( !ap2m )
                 continue;
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ed850723f5fd..ddb4c7606be1 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1311,7 +1311,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
             if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                 continue;
 
-            p2m = d->arch.altp2m_p2m[i];
+            p2m = d->altp2m_p2m[i];
 
             p2m_lock(p2m);
             p2m->ept.ad = value;
@@ -1579,7 +1579,7 @@ void __init setup_ept_dump(void)
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
     struct p2m_domain *p2m =
-        d->arch.altp2m_p2m[array_index_nospec(i, d->nr_altp2m)];
+        d->altp2m_p2m[array_index_nospec(i, d->nr_altp2m)];
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;
 
@@ -1603,7 +1603,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
 
-        p2m = d->arch.altp2m_p2m[i];
+        p2m = d->altp2m_p2m[i];
         ept = &p2m->ept;
 
         if ( eptp == ept->eptp )
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 41517765c5ec..5bd426296f20 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -111,7 +111,7 @@ void p2m_change_entry_type_global(struct domain *d,
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m = d->altp2m_p2m[i];
 
                 p2m_lock(altp2m);
                 change_entry_type_global(altp2m, ot, nt);
@@ -157,7 +157,7 @@ bool p2m_memory_type_changed(struct domain *d)
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m = d->altp2m_p2m[i];
 
                 p2m_lock(altp2m);
                 _memory_type_changed(altp2m);
@@ -955,7 +955,7 @@ void p2m_change_type_range(struct domain *d,
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m = d->altp2m_p2m[i];
 
                 p2m_lock(altp2m);
                 change_type_range(altp2m, start, end, ot, nt);
@@ -1031,7 +1031,7 @@ int p2m_finish_type_change(struct domain *d,
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m = d->altp2m_p2m[i];
 
                 p2m_lock(altp2m);
                 rc = finish_type_change(altp2m, first_gfn, max_nr);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 458f2f260dd7..5d8ba2d2ab19 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -626,6 +626,7 @@ struct domain
     /* altp2m: allow multiple copies of host p2m */
     bool altp2m_active;
     unsigned int nr_altp2m;    /* Number of altp2m tables. */
+    struct p2m_domain **altp2m_p2m;
 #endif
 
 #ifdef CONFIG_VMTRACE
-- 
2.34.1



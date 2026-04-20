Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKW5GVSY5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1048433ECF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287444.1567870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1L-00063i-IG; Mon, 20 Apr 2026 21:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287444.1567870; Mon, 20 Apr 2026 21:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1L-0005zt-Do; Mon, 20 Apr 2026 21:19:07 +0000
Received: by outflank-mailman (input) for mailman id 1287444;
 Mon, 20 Apr 2026 21:19:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw1J-0005vn-N6
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:19:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw1J-00CBeh-3g
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:19:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e697db-bab6-0a2a0a5309dd-0a2a450599f4-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:05 +0200
Received: from [40.93.198.99]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69847-aaa8-0a2a45050019-285dc6639c78-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:04 +0200
Received: from SJ0PR13CA0232.namprd13.prod.outlook.com (2603:10b6:a03:2c1::27)
 by LV8PR08MB8955.namprd08.prod.outlook.com (2603:10b6:408:1f9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:18:59 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::c3) by SJ0PR13CA0232.outlook.office365.com
 (2603:10b6:a03:2c1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:59 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:18:58 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzyz61K4Lz1wdP; 
 Mon, 20 Apr 2026 14:18:58 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00102.outbound.protection.outlook.com [40.93.1.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:18:57 -0700 (PDT)
Received: from DS7P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::9) by
 CH3PR08MB9538.namprd08.prod.outlook.com (2603:10b6:610:1c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:18:50 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::31) by DS7P222CA0023.outlook.office365.com
 (2603:10b6:8:2e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:50 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:18:49 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:18:46 +0200
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
 b=SUXzjf+P8DXlRO8qHxgMyOiAzXbF6GzMAnMvC/upzYUeO1iaj68loWvFfON65FTvrVsdT/RVMIiTgfiLT0yWfqtPSn5PcALw716oR3UkrFqyUxVbpK5YjB/ot9GHO5XGKGIJ6zW0IE+QjPy0KsmupIq4xjqzH6Z5quUKffFnCoSRqrUP7yF+q+I+eNNS1CKlRMkxQATJZYSW8Q1VPefXHIccB6WlUbjpaMV3FbzVAGdho64dUrroTPiXLaUZ4IxhMvRHuP1npwt6XJYh7O3tE70+IGZDLg5ySGgLlzVhZn8SHGK5PXi4f7lM5zTb6uQn7RTQQXqXhtk2JUJauwSM1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUHlmqTGoOfpLiPTAGkw3ZzBrGFd58Ji7foro+DAZoU=;
 b=Hs7zSBKIelIqSF6Fx2qCws6Rt4H345CXSgBJx/f7dMi1SSh6hi/Uwx0hzPiQ7klNFXdb9s9IAGuDzwiHXV1qp3FGHjc+PgKbkRy7ptBaHKVric6siwpY+1TgMfFdIDdSy6YWTFDPx99tm7RTq8eKlknBna0bw4D1Is9NVx3Zl7/r5KdmNhcaOJvjjQL2X/7cAXiUbuv+uMTyVN4TAHjpASxfqYDaXZIylEeBQd36KFUSxlVlZ81D5eLE6SzvtqWyT0MKY/SgOwP7KAqQiQLssaW9TT3mkebQIhnaXaxQvhXej3cy7rrC62ldtqitosRbzNs5r25h7/bt7epZeqEocQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.74) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUHlmqTGoOfpLiPTAGkw3ZzBrGFd58Ji7foro+DAZoU=;
 b=e7ZbRFwwwtyTKhD9oMfXn1O7FJUhndfHMw81WBJsusiwZxIfCVAIQ/V9yaY57p8Yl5AlaugJyU4i4aZF3hXaeshcYYeC/hn+yatx3AUydXtO19JCFSxpj60PSD4CNPcBmP3unl47JDktMYV3cLxVY2fgOQWkd/HYMh59OWs/nKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.74)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.74; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lteC48OrWg27m/c40n1ydVpKtDpXX5JhGjbOisVzz4bmwGpw8ffxyz3uqL8C369rwaeTOEf4uRoSla+gwNT02Z5n25/e9yAH8KjsOV7sOxE+gzpe+Hgi8jz5j7slpYKbVCz4/rl5U7RQ4m1dF8dymaWjx11WLTMX/IsZuQ9ecXWhz3HelmpI6G6lALkWgdwGTb6jo21HieuOfhGjGzmsAGgTCgluZ1vo6FECS7NlU8Nfh76U1ncx8ntNXmcT6jLq/9sNfhD/QoKd5S+HuOPbXwdLFoFL3hYvhNfLaOtqDyASxC6x0/cFC2781JZZfFL2ryVczDMDcbShJoBtQN8JMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUHlmqTGoOfpLiPTAGkw3ZzBrGFd58Ji7foro+DAZoU=;
 b=PWKowOrVAfNZpL3sRAKqw0Ds1lmFIOt7dtzPTdW9Pk+K10KfduTQaOyBBnJupzxPYcpbML+N4xFfkgFeyGAiZ2EjDJsjn5vm+1koRqEPEsU1yu32w4l8YKsJoT989Dn/Ao1T/RiFAIPMJVtOzB3cyqtTU9eCAh2lJ0nFWEeI/nIcNnjN9YxISkJsbOIh+0oFgEUock3AygKWYQYdPxUygbLgenUMa/F//bDBeg/2O1Az2/B7TlFNmWdEjDbp0sBDXh6OM8cDehxaMRGD4asN0eIQ2SShH6rYvpjf/wob+hs8FLM8CbW5HgQ7syqfkwNK14r7bS5qdHrfG39QK2jZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUHlmqTGoOfpLiPTAGkw3ZzBrGFd58Ji7foro+DAZoU=;
 b=e7ZbRFwwwtyTKhD9oMfXn1O7FJUhndfHMw81WBJsusiwZxIfCVAIQ/V9yaY57p8Yl5AlaugJyU4i4aZF3hXaeshcYYeC/hn+yatx3AUydXtO19JCFSxpj60PSD4CNPcBmP3unl47JDktMYV3cLxVY2fgOQWkd/HYMh59OWs/nKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Aqib Javaid
	<Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 07/43] arm/altp2m: Introduce CONFIG_ALTP2M Kconfig option
Date: Mon, 20 Apr 2026 17:18:31 -0400
Message-ID: <20260420211831.208600-5-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420211831.208600-1-Rose.Spangler@elektrobit.com>
References: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
 <20260420211831.208600-1-Rose.Spangler@elektrobit.com>
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
	DS3PEPF0000C37D:EE_|CH3PR08MB9538:EE_|CO1PEPF00012E7F:EE_|LV8PR08MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ce60f8-f7a9-49a4-7fdf-08de9f226fe1
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?yIGbfdojykc+W0LEfBmzkFZS0v5cF4OGj7G8dRBJ9ePgkCAjG4+2gimYRmcN?=
 =?us-ascii?Q?qD20HCLUfFk6Pk9jxSeyo32pb4K9xIw61S6iT0cp5SV6QjIJBHHd/c9rXkME?=
 =?us-ascii?Q?b1836kFgfoadn5JBv1LqHM3+PilZ5gQA3JcJamY+Jmt9Ymskcs25LUpU6bFs?=
 =?us-ascii?Q?YXqJuJg3mJAZT/V6iMIvAsUNKowEyJ8iuUHWIzpzfoab5iDdZ0YXPinb5gte?=
 =?us-ascii?Q?m1nIzr+LxgnFf1hgVqlzc3CgTOTeJPgxxyfYiPFlt08fPPI1r3OncLI/lOQA?=
 =?us-ascii?Q?l3MrEUAUZbFXYQpOji9zycsNXIoCzWR3vzVABLkpJ1JLhQqxNyv6K44x1DmG?=
 =?us-ascii?Q?bUzlLE5m4bPjgTOu8kXTqUdZfGdYHIAF32JBjP2IH1DqavOJo/HVGYhsmKrR?=
 =?us-ascii?Q?3tOWBhsbN6yEzudIQRnekIkO907LaPiruRH8U9iu8BSoReSOhgbkOAm9YFB9?=
 =?us-ascii?Q?nxgqiP1qB9v2WjgMPebWi9qImQJqe7vdsrkLFz8Mk1B1XzjCDCDFyzhzO5F6?=
 =?us-ascii?Q?IJ32iBX+FdEO91IXI+AjpvNMeu2y5H0zrvGn0AN4w7Csl+v5yyUWvpBNX6EJ?=
 =?us-ascii?Q?j/I0mLqXTyi2Y5vvbtbCKeLsRdXLn8E6p3FrqkIiExyVIOtwEoXch9IIFv9X?=
 =?us-ascii?Q?N23GBGJq7sIiqijYDaATWCdvlVJJcuAAORWuCw/aK9xwKcJlJrYkI7uevv0Y?=
 =?us-ascii?Q?s32fuRlCoUdVIsKJkFbzXPWrhbNa0fQY6h1J+TbGHlO0uwdvQOJox8LF35zc?=
 =?us-ascii?Q?juyJsUy+ElZGSTF7BU/V5z6Z9Cf2xL2VF4N8TPAmEJasr7E7T0IOQiHeRaCa?=
 =?us-ascii?Q?j8PvDpvIQA9UcgjsON6f4uUQr5wfgla2eMw+VmjiLOivl2zuYBfFMEXr+k4t?=
 =?us-ascii?Q?2vqXA55R0PyUD4wF+njyiMMeEaE7gvPp55V6s+npFjtIXU5UvQhxiB9w05zv?=
 =?us-ascii?Q?piGUKRYJKq+fdusMuGiJfE/fAUwsPSiI7JIlUT+nGUYNE0mOmaa3oAUtDNFx?=
 =?us-ascii?Q?sWBkIf/H/gShkr36mPJ+3FrLhrhw+n2bU4GlyGyH2SxTLNHRoZy9PAQqXemG?=
 =?us-ascii?Q?tI+Qi1chC6lT4jV8NLK30BbxyAJknQY0p3yGU6orXjKQ+ivdT8ARYWjjIUTQ?=
 =?us-ascii?Q?fdI4uBPHxTAlLZOA6i+KcmxJ1GNNddNyJWzVsaoTND/wA6ubQwMuid1+ICwg?=
 =?us-ascii?Q?SgjH07vD1buJlpqNvk+GnZeFCxbJReRb8MhuX4ufq0+nh7gZQgtY0rs+xV1y?=
 =?us-ascii?Q?3MReqfyyWIvs/jEf3EHNqfOFK5Uv5vEwuSQa0DdIpQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 to26/16KVInQrUMDUrHEymSQql9l3FprZf06pigOpJROWSKMvd+jkj/5qn1CxGvbXiCrkCnn+pKwd7Mf+1mTeXQFbMsYFFQK98shYIj8yj8ahABFQ3Hl2BK+liqwVa3CML5pk2xpIbBip7YPUenkNmQv48W8xvLipS2aVz1blwFgHArzuNCeh/PSyfq//1iQm6wvgxKBYeKCuS6rzZo+z1eDUIJd5o2uSD+qx7hKiJ/+u/6Upd28CcgiCfWCymzzLEvmPDT31tHq7nm77nk6N5dsGfI6kMjHmOQCdMiAWNrIdpbRr0+UvKRUn+pSWQyME617vrw0lQOEZmKUE0FU3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9538
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.74];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.74];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3ebf938-d41e-4fd8-5103-08de9f226aa9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZLtAOaaQVXlqplYbXnL+4t39ufqiRQdrnw1B7aoOFn4olnZTjqf8edi2Xfq1?=
 =?us-ascii?Q?uE/N4uNJjxfkZtqWrVW7k3RhmPSoIIi2UTOYtRPPiSaieduStmaC/hcl4Obg?=
 =?us-ascii?Q?b7YNDMawiOFU+ZvnJ9s//RNvmbj+wqPNMNY9qqy8FaLCGitAQ+S8DQbnnnMU?=
 =?us-ascii?Q?DR0rrN3WbrZPTLrC1Iltkz47iUGSScS49W/QsxkW8cax2q+BEpoLSoJv+kQu?=
 =?us-ascii?Q?ahgiiDb+T0psJ2kDPsm2ar5BLcTRebBkPI39OMgw2CS6t7q6c4s2zlF4Msjt?=
 =?us-ascii?Q?GP1meinw29+6+k6MdPW2Yks/TfowQ13zuM/VpW9fhpFnz8zZlZSTWAOqM3f8?=
 =?us-ascii?Q?AkNt35wINQo/cWgJTZPfaDggTRSjGQ9XAwOcIRumhjD98Hq52lgoXHuoL8O6?=
 =?us-ascii?Q?P+ewXxEeSvpMupj1A22CFOlvbgxRWe2zwn2AuLYsuJOeJ/4UM0uPkisNzFlb?=
 =?us-ascii?Q?UplcTPVvEDMsnNOfu1tFkcF+56t/ncjBqT3uGwdZGbqh6PjaTl5R5l8g1npC?=
 =?us-ascii?Q?UaggypVGZDAwPq45wwU2MYucRm1RY7s1xtqCTsI/2MdbIt7RWhe58JG2JJbQ?=
 =?us-ascii?Q?GNnKuLFv4Je7pCJ+vY1z9MKCwZmHxWiYetlVgeSlH7P3TG8ueQOiLGkxQBFr?=
 =?us-ascii?Q?PrKztdITYXIp/g+PXozYkZeGesoHgpq/m/LeEx5hl8CpD6xyc28KqS0qWdZp?=
 =?us-ascii?Q?FFcA/H4DNDv9Xwy2ZIB1f4GiQmraxbfYjLKpxeexj3O/08HxGwq5/I06u1tf?=
 =?us-ascii?Q?0nDrKKN4rH+pi4tg20X+PZlda5rakVcMI/DqQWgm2xUMXqAGpO9rLbtRBxgN?=
 =?us-ascii?Q?hL+Oa5FaInZtidTjnTMwUzCf65aAmFhBGmpDsUulRGgfDte7PhdPhLKGFXGy?=
 =?us-ascii?Q?I9R7oeO3NA5pOLhGlxuu+hrcDYeiYs5qalpenP/Mul1JUCWdYwZSUzmoldSa?=
 =?us-ascii?Q?Bxcl2OZYTPFYElsBaqEAWkuJ8eCB8xf6a1WDWLvJ3VFT3MrZb9WooBMZhb3m?=
 =?us-ascii?Q?sBkqj3B8nquPExanLaJdRE6x4ZX6mZr40tHNqp8EcRMkYlWox/jMHMoOcLZ7?=
 =?us-ascii?Q?MprW2U0OtuBb44u0ejll9A8cMMRQNHHGlWF/hWfDRU+WXr/okIVZIq/CIQ9L?=
 =?us-ascii?Q?Ggkj29smDmPu3tQkIwa9qLnsGpLypb1CjoXdeWjEWDNcqO08jiHmhR5vW7+A?=
 =?us-ascii?Q?k7R8I8+UY6EblefGZFk4xx6SmyC3Zkb4pthw0Z41TLvT4p7v1+wVkXQySqNE?=
 =?us-ascii?Q?0YYdueDF08aqvgLxATDAiI+e5irOZrepoLasEtXYIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00102.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ag6eRo84iH94sY1ynTQf5oD+Ft0TYRTySSJCLz0yYbH/RtN4f+v7AxJkBB5dp0BLjMQU/1S5tmw+iRg08H26OG11VSroEmrfL3KvcXhrurh3UG2md7BhfN8Y/kVzSjtI+upwIZFD4KmfsHvsdmJrUrkXWTWAIm8eFmK+di8LD1cvpYqxdbMpmAy028KjRboq1gZCpEs0JZEliH9AcgquLJ+G7irIuRdCsdQhINp+prEdrJCxdyNdsxJksH2/MUYaQb4l/rsiCnfm5i+ZgM9gdu2b4/JMyUaxi2zwn8vuis08TvChK6L5QpKwB6rpwRq8po/cx6PqyOV1B4V7Emtjs7Xhd/2XOry9g0l4MEz6YuK/zncx+kcGjfZUVnQVN+DLIjqMxZu+46fdglo5YZQUabhoOKW6PsnvN21fXlOHQ4lZLalFBagWDS1aY4489Adk
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:18:58.7032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ce60f8-f7a9-49a4-7fdf-08de9f226fe1
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB8955
X-purgate-ID: tlsNG-c201ff/1776719945-E97A6443-87C72492/0/0
X-purgate-type: clean
X-purgate-size: 2817
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.307];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C1048433ECF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Following the x86 implementation in commit e96831ece819, this commit adds
the CONFIG_ALTP2M Kconfig option for ARM. This makes it possible to build
Xen without building altp2m code.

This commit also implements a stub for p2m_altp2m_check, as some
implementation is needed when CONFIG_ALTP2M is enabled. This is due to a
call to p2m_altp2m_check in vm_event.c which is gated by CONFIG_ALTP2M.

This is commit 7/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/Kconfig              | 11 +++++++++++
 xen/arch/arm/altp2m.c             |  9 +++++++++
 xen/arch/arm/include/asm/altp2m.h | 18 ++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2f2b501fdac4..fdf0721c3c03 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -98,6 +98,17 @@ config MPU
 	  systems supporting EL2. (UNSUPPORTED)
 endchoice
 
+config ALTP2M
+	bool "Alternate P2M support" if EXPERT
+	depends on MMU
+	default y
+	help
+	  Alternate-p2m allows a guest to manage multiple p2m guest physical
+	  "memory views" (as opposed to a single p2m).
+	  Useful for memory introspection.
+
+	  If unsure, stay with defaults.
+
 source "arch/Kconfig"
 
 config ACPI
diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index 2bd1ff4df223..8bd174ea8f37 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -5,6 +5,15 @@
  * Copyright (c) 2016 Sergej Proskurin <proskurin@sec.in.tum.de>
  */
 
+#include <asm/p2m.h>
+
+/* Check to see if vcpu should be switched to a different p2m. */
+void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
+    /* Not yet implemented */
+    BUG();
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index ca836bae7330..698c35427e75 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -11,10 +11,12 @@
 
 #include <xen/sched.h>
 
+#ifdef CONFIG_ALTP2M
+
+/* Hardware always supports altp2m on ARM */
 static inline bool altp2m_supported(void)
 {
-    /* Not implemented yet */
-    return false;
+    return true;
 }
 
 /* Alternate p2m VCPU */
@@ -25,6 +27,18 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
     return 0;
 }
 
+#else /* CONFIG_ALTP2M */
+
+static inline bool altp2m_supported(void)
+{
+    return false;
+}
+
+/* Only declaration is needed. DCE will optimise it out when linking. */
+uint16_t altp2m_vcpu_idx(const struct vcpu *v);
+
+#endif /* CONFIG_ALTP2M */
+
 #endif /* __ASM_ARM_ALTP2M_H */
 
 /*
-- 
2.34.1



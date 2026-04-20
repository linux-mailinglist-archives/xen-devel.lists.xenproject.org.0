Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MpkHteb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF74434309
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287936.1568404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFq-0003Vw-1n; Mon, 20 Apr 2026 21:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287936.1568404; Mon, 20 Apr 2026 21:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFo-0003Ds-I5; Mon, 20 Apr 2026 21:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1287936;
 Mon, 20 Apr 2026 21:33:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFZ-0000TK-5r
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFY-00EgH4-I0
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bbc-e002-0a2a0a5209dd-0a2a4505d328-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:48 +0200
Received: from [52.101.57.124]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bbb-aaa8-0a2a45050019-3465397ccbbb-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:48 +0200
Received: from SN1PR12CA0063.namprd12.prod.outlook.com (2603:10b6:802:20::34)
 by DM3PR08MB9165.namprd08.prod.outlook.com (2603:10b6:0:41::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.33; Mon, 20 Apr 2026 21:33:34 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:802:20:cafe::a1) by SN1PR12CA0063.outlook.office365.com
 (2603:10b6:802:20::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:34 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:33 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHx0YxHz1wdS; 
 Mon, 20 Apr 2026 14:33:33 -0700 (PDT)
Received: from BL2PR08CU001.outbound.protection.outlook.com
 (mail-bl2pr08cu00106.outbound.protection.outlook.com [40.93.4.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:32 -0700 (PDT)
Received: from BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::9)
 by PH0PR08MB9934.namprd08.prod.outlook.com (2603:10b6:510:332::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:27 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::db) by BY1P220CA0024.outlook.office365.com
 (2603:10b6:a03:5c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:25 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:24 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:21 +0200
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
 b=lLcQhj/cooPYNVDOhU8AHbM2Jk2L6WGxDQ0qBn1NSyJQsabo4Eg4BdAIvhpneo6lLVYEGYjOlstvewbv+lsAgxsn9pVI9FHkJMKuZXN6Yz6eQpeBMsONKZxSklcmpBqo8WKlKX5/78LUKJHDUquXGHkHJfVRmU6gwlPIVSBmbvCyJQ/lcV6l2HQPqcZrbr36c8KW4nbQxlyiRcGqIm4G1jHDVWbYla99Az3XHSKkh1BUoru2aElskEBTDHCP6eKr5+bfpL60ByWJe5dwBdOPSEllf1ohXsxDZpX8SwZAttVABcyOoc2oW4qWTuTgU9WTZYbSZQE1aMeE4ogHrcL8MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEvCOJ/znG1Y9sl6sTHGiqT4+0IS7dn5KAJvNg29AXA=;
 b=MxWUlEfcrpVoYzqNVVPHCZzZO75ITKUQlao7Ek6Uacs0FKGk4GfBqcBRCmXVkbW0Hp5pCbCkswRj9m4V1eLfglg0bGoetCCm3+MVHTYI0AwWkps5nNijowwL+uL9Z0hln1ip1SAQu+cfbKoABKLShY8eUKZSwGRQ9av7kwkOXGr9ELeulGUVW85N0H1WOUJzNDULENoTcWuO+mnX4ToTHMZsF4u6Kpqv3cuWEJi5U//ET/HUrNNtCqMx/EB3ESzLLeigXvNGgCTBjDCyt3LJZBF5iAmu3gLH1l3FBRpX9YEwqCf72VQG0WU9Of1Mvfyn1DMaO3B4XDgeMIWsMNcsMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.14) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEvCOJ/znG1Y9sl6sTHGiqT4+0IS7dn5KAJvNg29AXA=;
 b=1pDXNGpv/cLnvLpEprLKBTUImwPkTecH6SIBAjXNbohm+qvYeOvPGI9jkDhgqJBPD76vt8rLvdW45C4hc16JbTc93jrn44VmTF2M/XUmYeQZcSALUChFcrQ4vneGwVQ/t9CzVGHsVo1fKUoyntwtETHdWDQc/GyJvF60wuLvnqw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.14)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.14 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.14; helo=BL2PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2mqqgVdbMoQfn8/kR8qFsSIBGW5aXDzoO2yWM5hVgDzKRp8/EIqZydLsnV4bFxWQK/iomL7tFtLUwzm50/0H3RM3y82kLKr3egpoRr/s4B1nsJXoR1DVyoldJDlMqJ19jYYLxIAkIjY2nalZXl/Y4+BloqaS639T4wwyL/XltCLQwHL1eOAWFQ9MQISN9Js8ONKy2NB5JEH/zf2mgNixtoSQPs0VvX9QfIGhoOhsdi2V+/Ufz5nlU3mLObcqo7M6wjNo0Ba3Wz7pTyBd+FYMKqwChtNjljgbNJHPEduoO6HDjsRCBDl9rq6jx8WvPfVXngdMfwYVCjVeC/Q1GgMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEvCOJ/znG1Y9sl6sTHGiqT4+0IS7dn5KAJvNg29AXA=;
 b=W2chBkhQGzqDK7ZOi5GANLLfXMFIge4Xcd8GjcRSjlx0KCsxbTCSqezt7Ek/2+sUFMQDGkpTqWQkx+J066tiOwwv5xI9ajHwl9RbrvYh35q6rEglq3RyPst59Ky20hI9kWzsOxqwHB0BOXQlrNiyeMKRnB8cusMFRYFlreGk3J3hb2KRpToLgLanjGtRfgQF64SO4FrTomqfVHxwFikj/F6XtznF38b6JUk+Oe8ckYc74FBkOv4SU+7elGI0A2DI+w/tQ6gfz5Oh8sFCsWCQnc0eJgUjO/0ZqU21kc5ZUml+Y9dUh0BRM8JgljF+K+Xz6RyAwxDvM4itTSUPEqTiPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEvCOJ/znG1Y9sl6sTHGiqT4+0IS7dn5KAJvNg29AXA=;
 b=1pDXNGpv/cLnvLpEprLKBTUImwPkTecH6SIBAjXNbohm+qvYeOvPGI9jkDhgqJBPD76vt8rLvdW45C4hc16JbTc93jrn44VmTF2M/XUmYeQZcSALUChFcrQ4vneGwVQ/t9CzVGHsVo1fKUoyntwtETHdWDQc/GyJvF60wuLvnqw=
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
Subject: [RFC PATCH v6 35/43] x86/altp2m: Add altp2m_activate_altp2m declaration to arch header
Date: Mon, 20 Apr 2026 17:31:58 -0400
Message-ID: <20260420213206.208750-36-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|PH0PR08MB9934:EE_|SN1PEPF00036F3F:EE_|DM3PR08MB9165:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1455e2-4cab-46e0-c048-08de9f2479a7
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ixywoTqmF2w1GpfdIf6Pke67X1MHmtUXUqtymdOZe/tK419s8vOFVfV/WkSs?=
 =?us-ascii?Q?Ar2nMZuGKm4Wd0nf+KCPxrdRj0UCHWuoYUQptbFfGcpmWyTOy9gUpv3p6cYg?=
 =?us-ascii?Q?VH4yE5mC29L1omvG7+2pUM7xi5X9g8WRm4bMqUkSXUfKQZR4ne3kvvk80Htn?=
 =?us-ascii?Q?eedt5JTzYY9B1eIFiSy2rKQxpOOwK/4gFnBM6CGp/Q+yOfrPkxyeaY9xHlD6?=
 =?us-ascii?Q?/6bFw7u2fN1Y6flQI3Z+Owj/3sjZ36GtrmWWBqEH7St6sSqjV8ktwx1z8iQR?=
 =?us-ascii?Q?iJuStEipNOTB3C9i2EDrzgLvYXg9umaly8kAuXfINa9pik7lpG6uHf+85wgl?=
 =?us-ascii?Q?RESvIT+ovzU6x7EXovwOz+FVS3AAhK/XXCeKBD+o5xmdNScvtmaZ75r6JD3q?=
 =?us-ascii?Q?kXBVBZVNeJtMdCyWIEpB7+jQXnSE5+E36/wFQhnUBS/VSp38tUnMRoh3LjMI?=
 =?us-ascii?Q?Js37rAxeHioV1YQIjaJkfqYVkDdQTp2QGc9LPgAhTcn2CRERKNKgS2QKGPIZ?=
 =?us-ascii?Q?jxHrOBMB4cabcpzRtGgJaVQbVrPWJGpx2+Psp0sf/fa1u8aJWh2tY65VvPCt?=
 =?us-ascii?Q?mZTPVp5q75UDC4REo1tCbGbSqsasDA0R9r2NZLK2T61/eNfrgCYRWSRNKlKL?=
 =?us-ascii?Q?bDSL9cWNuw/xeGlQaoHXwv1DZRvnkOyD03+AiX+ObrxXAFpAstXyswNFSdTC?=
 =?us-ascii?Q?p7goDCmbjG8JmWNr5MRWj7xAw5Evst7F+mTnu3UKyIV4JaGiR0BwRD7YS/V0?=
 =?us-ascii?Q?+R/eJbMrCCbSTKbolXJAq2O3vSvk4FQN8TUqBNsE6VUL6fSxzpAzHZf4Q2/t?=
 =?us-ascii?Q?/U2ZroJyQbvUBZPLKLi11S9YN3Rjk3UI1T3xR7Hej0ww/prte2TYHs7sdpno?=
 =?us-ascii?Q?xr11/elvDCci2qDxIhLv71w6qV+MxcGf7ZqICZH67G22tOp3rhD1m+Rwle80?=
 =?us-ascii?Q?agwUcV8nYHF+s7azRFgaLpPYLJdYOLxvXIUKT47VXKtMUIQXoc1XGRvUXE4M?=
 =?us-ascii?Q?WiU1Ivnb+sq4fBcSPGqwaR+uI04EMfQA/ibrLAb78Ixva/sglCo04x+/xRr5?=
 =?us-ascii?Q?YDiXbQFF17lt7Q3Ea6n2kGstoexgpO9/ho4RA2QYsi7/ZqVhgbMmPb4EcqzP?=
 =?us-ascii?Q?z0cT56zE5wTcY95LdQBsbo1nMCEzRStESoQMD0Vjx9+0rIro767pDO4te432?=
 =?us-ascii?Q?qdD/HqfUOfUvSNb1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 erop+8h4Mj2dJ86U8tcxPi2xXRBQ73x6LGDVUjCQ+/0eogPuHai7yIPl5ZU+4WXCbou/Uh5XDWKJbFFlLm7Y8LnrmKFVRDL+zpPa1YITBXB9QmioU6iCTSS0TNr1Wx/TYpmVRZU2NsakiVAaLuLpAxH0hVeVJkN+ZIYNs+lL8Puv3u9REVc8+d4dhAIjxL2wpOs089bSNtd8K+vKnDunhrVldLWJeAYNXlbJ03m8jct0R7GlYjc1JhjcF+BT+DnE+payvqpVQ9zJZfBOL/jzPWCeKwZ0ZemaaMRDL3aySl8D1Cf++9ZLPtoaWdaUI2xdhcndUVUimbnH/cWWvnZ3QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB9934
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.14];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.14];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53552d84-0380-4fdd-dd9d-08de9f247438
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1qjuzLqXqW3+SIOAKJTUV8LXM24ULx8z/aEqWvFlGm6gDl/lm3cK95ANwYy7?=
 =?us-ascii?Q?gLB/LcXHrJ0abc7YjoBxRLOF60QwhaxnDBm9Sbyt2whWZC0/6zMraJZYZD6D?=
 =?us-ascii?Q?qvSGxX6G7XfaAyel64RZPw9QOkMyrIwr4P1o9GlnwXPPFZZGAbtM3kGUyIZu?=
 =?us-ascii?Q?m64IoI/il2vBZtlFjTQH57Ge9o+zaoL8O70bNwSFfnPIXG9SIttPTKRI7RhK?=
 =?us-ascii?Q?F5nX8gjQXQyhwlifKcHOLwgiM5whcOkKdH2pu/KuE0lg860G03PxEOxhc+4g?=
 =?us-ascii?Q?Uo+eiWu/Udxfel3RCnd830Jmx2EUgV0Op5ybkWe/Db29MB1WspcERdXk8f1L?=
 =?us-ascii?Q?iwJhRTxsbvtZQ+FxahBgXzccHS37I3KkfF0UJVpU3GZuxHxy6OkbYt1qpgMQ?=
 =?us-ascii?Q?5k3+8OCn16deY1hUTFX5yssuw3n7DuULhSluya6mEjdxZoIupRvFWGOr79qz?=
 =?us-ascii?Q?Zmbat2RRnynXb4TrRyLSHY36WIeVWF3QXXNKU5SDEDyo/z4t82Q9gF0BYQXS?=
 =?us-ascii?Q?vWj4tqi9xN5vFqE6cpKcUiSOP+YhfBoSFR12YifQWqyd1Q1mLL93/xGCzJKy?=
 =?us-ascii?Q?CcTyYLsFddWOQU72y1t4lTgzamWStiURdaWjJjzXEEN9ceALcmDp4OPd2ngN?=
 =?us-ascii?Q?NVD37qCnj/j0Dlhpb3p6CS7yiBuXDAKPCRFPla6udO9MeH1UP5f8YFpsbmex?=
 =?us-ascii?Q?ntIpDdRj80hMRBAaTuEHtSoFfMWbjiC6/iyWZVK6CA0wff9DXWDmhqUJCS/u?=
 =?us-ascii?Q?gytjSwiJ8ePPTkB+8L6hILj9/euStag6+vA0tudVDqJ9wrXTkFbkV4z2XmmQ?=
 =?us-ascii?Q?+Z/5p5HC5y+2SsLB2/lJVshHUokn2+Vvjka08tfGAvXgVgAXsRZkrDFCFbcN?=
 =?us-ascii?Q?lxkTztsNuEghewqP9/DafqLMFA/d/fGON7XuNB39XMeuZcTCOOPogq8j0O5J?=
 =?us-ascii?Q?GKoUz5rcQY/NCgguBn/U+tcfYjG6+mRNXau1/bH0wfEmhaKVHJ7AsmNMYzLL?=
 =?us-ascii?Q?snPWY8I0L/Z4XHeuhiYjO0xb8zwQ4eFv9XdFK87dSvNbLQ6DWNqbjQbkcGBq?=
 =?us-ascii?Q?u/FgMSRPJ1tB5BrdpgXXWGQEZ2390YFRepxyAiWMfuOA1fzq21whZa1zo3L1?=
 =?us-ascii?Q?LAo1kDmIcIMAwFdWqoZIAsTtVpR6ebFrk/x3LkzA2CHcUM3jRuFVnp/W/SHF?=
 =?us-ascii?Q?cfvQfM0PEvDSNoRG?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL2PR08CU001.outbound.protection.outlook.com;PTR:mail-bl2pr08cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cUHXrfb6FJbdtPo6vV2U709O36d4sO0Nb8rilLZPPISwhjgHhVvtCA1DHBa8UoiHF+wugP/a8kSwLD7n4pkCrkVrE40m2sq0KzpIfp/WQsXaoIVfPIt0G7iK6E04z1xZL1c5zPPSq8HvomPCM+DvZ2p3hRqodAulItRm65FfML6gEPZDE/7JP5zt8LjA2yswXtW7MFvyoZfWL2kB503tSQ8/AH465QaLf8cfcWeNSL/2d9xY+u2k/80V9sEpY0KNYp6QTCHebaBdwTCCCr67GHdK13N3e0Bj1o9A4ypWibSkY1uawcxgdKIQiiOEQ8qSrzyXat9GpT0qEtyl3aCtXJt8eSinYaxJmN4VKUd29MhYIbkCUP+vEPaTNHbsqwBqNQKoIEbJa0LFfTUckq35V33DOxcDcEESN5s812mn3lLA00L/9uJbb4Yuwl5pd45D
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:33.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1455e2-4cab-46e0-c048-08de9f2479a7
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR08MB9165
X-purgate-ID: tlsNG-c201ff/1776720828-2A969443-796E502A/0/0
X-purgate-type: clean
X-purgate-size: 1798
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
	NEURAL_HAM(-0.00)[-0.230];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0FF74434309
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds a declaration for altp2m_activate_altp2m to the x86
asm/altp2m.h header. This makes it possible to call the function in common
altp2m routines (namely, altp2m_init_by_id).

This is commit 1/2 of the altp2m_activate_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h | 4 ++++
 xen/arch/x86/mm/altp2m.c          | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 99c4cfa5a68b..203dba44e2bf 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -95,6 +95,10 @@ int altp2m_init_next_available(struct domain *d, uint16_t *idx,
 /* Make a specific alternate p2m invalid */
 int altp2m_destroy_by_id(struct domain *d, unsigned int idx);
 
+/* Activate an altp2m view */
+int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
+                           p2m_access_t hvmmem_default_access);
+
 /* Switch alternate p2m for entire domain */
 int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx);
 
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 8672b8c061d3..40c6ea72a621 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -274,8 +274,8 @@ void altp2m_flush(struct domain *d)
     altp2m_unlock(d);
 }
 
-static int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
-                                  p2m_access_t hvmmem_default_access)
+int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
+                           p2m_access_t hvmmem_default_access)
 {
     struct p2m_domain *hostp2m, *p2m;
     int rc;
-- 
2.34.1



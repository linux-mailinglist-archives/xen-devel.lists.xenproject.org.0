Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCl4OI+b5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8B4341F3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287755.1568153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEi-0007rt-QT; Mon, 20 Apr 2026 21:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287755.1568153; Mon, 20 Apr 2026 21:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEi-0007p2-MF; Mon, 20 Apr 2026 21:32:56 +0000
Received: by outflank-mailman (input) for mailman id 1287755;
 Mon, 20 Apr 2026 21:32:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEg-0007lx-HV
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:32:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEf-00Eg4Z-UJ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:32:53 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b5b-e002-0a2a0a5209dd-0a2a450184ac-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:53 +0200
Received: from [40.107.201.120]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b84-c1f2-0a2a45010019-286bc9781fe6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:53 +0200
Received: from BN1PR14CA0029.namprd14.prod.outlook.com (2603:10b6:408:e3::34)
 by BN8PR08MB6178.namprd08.prod.outlook.com (2603:10b6:408:7c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 21:32:50 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:e3:cafe::67) by BN1PR14CA0029.outlook.office365.com
 (2603:10b6:408:e3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:50 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:49 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzH42vXqz1wdM; 
 Mon, 20 Apr 2026 14:32:48 -0700 (PDT)
Received: from BL2PR08CU001.outbound.protection.outlook.com
 (mail-bl2pr08cu00100.outbound.protection.outlook.com [40.93.4.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:48 -0700 (PDT)
Received: from SJ0PR13CA0195.namprd13.prod.outlook.com (2603:10b6:a03:2c3::20)
 by SA1PR08MB8386.namprd08.prod.outlook.com (2603:10b6:806:334::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:39 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::a7) by SJ0PR13CA0195.outlook.office365.com
 (2603:10b6:a03:2c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:39 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:38 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:35 +0200
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
 b=Vz8dN5cmCD803/A1a4IB/le34IIjZf4xOdmvK2lxSolKDJUJXfnIUujRp5ZCCZDKXAPm+R2F/bFgVhaJGzS6Tm5WEpOzgWLvrYhqqVp0oGB/GoT6SUUw9KosHCgGSFjlz9CXlm+AR7gupYNEPe6RUrDdTrrZ6cJOjrVoxWaLt/ZoZ9x3XQjWGj9gPn/pAWoO6V54Z94qgGL3tqdOiGN56vdd7y01h0k3AR5KhljrzqTW7ydq/f7kc8e/c4pVp/yrcFV0ShBhCqLR8XaA3KzJIbvnPbga3DczlsiGWCA05iaj8ePV2RMhpiLBYBQ/OT/VjAp41ZZZqB6K34pIAGmXzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUHlmqTGoOfpLiPTAGkw3ZzBrGFd58Ji7foro+DAZoU=;
 b=cvILFjd/VdBmQWUjxb1CbatR1BWJWsiEKOL37XOQrqipV7/nJYPR7uplZWyboxDBGZy/N2YFTZA02H6HLd6R29ph6JHtf5KyX8pxxv/39zyAJDEJy1EL2hWjZI4oI4wg75Ux2f1nuVRlyjPs2gVV1HWOiyvraOHfLM3wyYYI44nxH+CCYrpuwliikxetNgmiQzM+fhEz982b/9m7esY0i9e1SGfVTIb7jnIgeh7N5mXUuC5QpazR8OvCuk6OtWy/5FhlvkG69kRHmtP3HPG047tgfpEWxBIGK3J4tgMo0I4LWKiiFm3BRDYzkkRgVPwo518EMyqAU/1iDZG5r/P8qQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.8) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUHlmqTGoOfpLiPTAGkw3ZzBrGFd58Ji7foro+DAZoU=;
 b=rECi2S5S0zPwEEXEvZw9594wZnyk/FIO8dr7X4mhzgOLlaHQF0f9BtigtweCgNfOZG9c0Obf2Ccw3eu2vguO8fm5itkEpA3IKevYiAFew2Xqrz7u5F6JsoU5D/NOLhfEKEhF0xRyG4H0toC6dV9m7a4tj4ePDyYqNaf0F2Pn0OA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.8)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.8; helo=BL2PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+maNGCt62v0NqFOWkafvLojA64pCTyVwWZn4K0Y/a44TFNEOVDTe3lAZkm0oSxJWA4XLD2wEvY77WCseab4j4ZCJNam8APzew9mpY2Jm1wL4l5/Ky41mzPdyDBvbLcpzsCJMH/EFjoJiQh3QXkjirWrnt/Hsvg2KD6t1Qu1kZgkhMCe7TTDfG8l2LnaIGw/ug/92VWmnkFCf7rUmC0NLjHza3dMzks1IB/QTKAIa59+XEUWXOHBijNQlRBjCXkIzXwsjJ7vOTE/gQU+N0P0q4Yckf705WJlfdVlcqKjc7vMsB9H/VCj+4H+DFIK9pxho+OGXLm2Qs2lquAHU1+/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUHlmqTGoOfpLiPTAGkw3ZzBrGFd58Ji7foro+DAZoU=;
 b=p8mY0arhJZr9DcMGrS3fxDPi+bi3IsikPH9ixQcXlDpUhrNI4HsCoE4ccS/5ko7+oRLoWTzjn41EzJv9F8LUiBx9p4Gqk9KHZCnwP5sgJSz6ArkikSMCbYvv4W601rdr07hJMIQmoLBPAd7IVxMm4/krFBWQOqA4eUbT6kJL2j6EqDn2uccOwXyHwT9PN5XE/UjTu8WjU0PZKo7bqtbiVfj979x+hVXdeMFVcsWQtGkP7Q1Le0hRUiTlkSy4jonmITlhgR1wYv4xu1I6r2MHN/UhuN92NGMs2AIGbCqpSh9e20rF2am71E+QdBYO66AdkO8Brwwpw/jYguE34OJOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUHlmqTGoOfpLiPTAGkw3ZzBrGFd58Ji7foro+DAZoU=;
 b=rECi2S5S0zPwEEXEvZw9594wZnyk/FIO8dr7X4mhzgOLlaHQF0f9BtigtweCgNfOZG9c0Obf2Ccw3eu2vguO8fm5itkEpA3IKevYiAFew2Xqrz7u5F6JsoU5D/NOLhfEKEhF0xRyG4H0toC6dV9m7a4tj4ePDyYqNaf0F2Pn0OA=
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
Date: Mon, 20 Apr 2026 17:31:30 -0400
Message-ID: <20260420213206.208750-8-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C7:EE_|SA1PR08MB8386:EE_|BN2PEPF0000449D:EE_|BN8PR08MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be98c0a-f33f-4396-7038-08de9f245f27
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?0fCBQ4/EiNw0buV3b20csTDfytL7oWXBQ7Subug3IPJyNor5p6kjEFNR/e1I?=
 =?us-ascii?Q?TQr2xtNUljuJMrIkiamRQyfKi8WZBGvMUJs9nGI/ennMm7680mCfb3a315qH?=
 =?us-ascii?Q?WlEa4NVcykQuN0h8zp7cFCxPHXlVaa1l3GS/PQtAEdswR/4fPV+W91CNCwke?=
 =?us-ascii?Q?omlFH58V50ZOCcL/di9KpMKPz5XXXogkdcXmawfusI3m+iJscRadXAgdivpv?=
 =?us-ascii?Q?o3iPiRIavpTxSwUFVWtgFzu6NDuL8dJ28KGjxZnBXG/9TPU/HFI9PWVk00Rl?=
 =?us-ascii?Q?5WEQHe2s7ipJYg8yHju94w3ajR5DyZVpb/lPbE3GKQOfjptI+gkoS6luK1UZ?=
 =?us-ascii?Q?Jmldcak67WzBgUY4s2JMo3i1QHg/WMGBxbvzzeCurrvOXYRwW1bYOu1wr77h?=
 =?us-ascii?Q?RPl6g3R5qFNvV9W3Lk9q2jFOxhvFCi6lQPNqZKlWD++ClYXueVHWvnrfab9O?=
 =?us-ascii?Q?U3tLqZo5YCN0LMa4ZTBy/HSTxGAV5M7+OnNzmbqLXpk7MaifFelxnGxPnRnh?=
 =?us-ascii?Q?pTX7lBdr49EL67jx4NDSEFzlTDjx398mg3RaVC6sXS2zJ1OmlLxlMKZJuT4m?=
 =?us-ascii?Q?nkDgwAcf+yQeezLxQevGwTnJN9SeOGJGEgT7BqWaPfOlFkdoNnKQ6xNjaXzP?=
 =?us-ascii?Q?JfEYuxSPDuwNRiJEPnWznQ80ZIoG4QR39yMkmB7xmEJWx/V9rk6T5kyPPSSU?=
 =?us-ascii?Q?sdJD9spAVEToIPcOL2cHBUkcV5Oa530PlXD9SaJYWoWxON/DaRmiRkmjWuQR?=
 =?us-ascii?Q?Q8NUaGufF7uyfYHvL5eH1gGnOolU25EKP1cA5l8uX40xsCAFewMamS2Jx9qd?=
 =?us-ascii?Q?5izZ5sjnW1hvmhGKCqLl2RTRk/HbmbfKBGUIK4qzfor/D/0JyuNeL6/a2c14?=
 =?us-ascii?Q?U5A0lKPIg3CqhnozJvH1dR2obCrHDjO/piQ50CsZN7YeuPw+zdTwSouRblm5?=
 =?us-ascii?Q?yvPWwOgh/MhociQGSWfZ47KWt53idflxIUwfiPJvAxqGUk78kySC30PPnt7q?=
 =?us-ascii?Q?TvQ2jmFn+uwraYIJnMBNjVRp6Cko2wi5pyoKggcJcv+0YpkIxaA4+S3lNcfs?=
 =?us-ascii?Q?y2vi1R7q2SaqE31VyDhHd+VVorxcP8o+Eqno0CWZCqWWe5/dabZtgyudZqYW?=
 =?us-ascii?Q?5J4zME2yZZsOO/OQY+XWEEvZG6VsY/Gf3lKOd7wPE5HnuH9tsnQtd82Zcqv7?=
 =?us-ascii?Q?jwsUCmbWQrv0pXOaMAEx/Dd+7gEu9tjF+ABqR4CMTEg+TAA/0uiZbJlAVher?=
 =?us-ascii?Q?t+D8c6tgMcPg6c4P5P/yU2mZW/bngsSMPv0iRXH5gg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 MziLwSTCnsACNdN3VOgopeaSV5+rrfJWRE1WGf9BFDmR6SGeAHE/0AK/pmcsz+AFl63VFLO1jRd5QB8EeUoosOLke90axvbyNx4J2m14U8tvrKV8SYnIztSmf2UFi+Y49lp0fKh/IIOj7TMfdVZ89GrW30r2roF4QjZagyHfNaELKqFDT99AmZ61mPSMC3AvLNtXZx4nF5OoIoNClZDUhmu1+R4MafZ/5xYzE1Qu4P+8JkH6P50tmFKeNgLLNOZp+R+btpWWf0TLKGHpfFaeQHF9Yp+uq/oXZzD23ZU+megjkdjH7AUwRXpINHyHs1oxa42HbnSXAxDXTKmxI6yYiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB8386
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.8];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.8];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e5b4eddc-89cb-4cf1-cc5a-08de9f2458c5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|156008|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q+DlfxjGpiIlk4j/+0F8NVnbcyZrafQflFQKy3hgKfBSTlYecP/ic9P+1B4D?=
 =?us-ascii?Q?0GWZHiCAFnUtH5Mj6vnncJcSLI+C6S9jMICm5a2ioCJTbA1VE65Mgt7mw39C?=
 =?us-ascii?Q?ZYPTegqWMNEXiedm9ACyFfCS4/vlCn8bkkrladZ4l8mHXc3rtFxAnVCbTGsK?=
 =?us-ascii?Q?wmnhSKLOG81DYRPqNfTt3AkrUtUWcd5h27Z2YeZC2xwxA7ncSaxR7yHsXJD/?=
 =?us-ascii?Q?9OGnCFNdPgiVD5BjhS0bEycwreDw1aSDsT/NVz5rPcBWQYNarhqR1reYa6Rp?=
 =?us-ascii?Q?HdAIT7ZmzsWyybzgYDlFGzXj+S+Qo5HCuYyLLC6h2e7tmNF76ZzOQ+2r4GZB?=
 =?us-ascii?Q?DjTD1HxBTJP01PG8yQgseX1Xp5RPU6DeAykY6wOKL94j43nyvdfuHxlx5iE6?=
 =?us-ascii?Q?P+8xpGBgfXOXwgUYWUil/tt5iWuvQ/YmXelTjwwsiKvvysxFZbPkT932/h6d?=
 =?us-ascii?Q?x1uGByoPzzcpzMDRR/nKLhOsHiLMKqrT+MY7EZ7yjQDqxD1hOztkbR5aWy7q?=
 =?us-ascii?Q?jBfVNf4ACK1lrN0NfVQr1DpyauwvbOexhHGWng31biYgLNcUbwdI7OrmctOB?=
 =?us-ascii?Q?tGyl6gE+Ir6d7rFIbsxZMnALD7vM7NGHMbG/PfKRCXpboseHvvbeNeqLvxyO?=
 =?us-ascii?Q?RhtQWCEqodzG6pULb9YLkMDYWFn+Z3hQwvdJiX0IBbRqyp4OLqEeKFnVWm00?=
 =?us-ascii?Q?CwqKKI3gyD7LerhBb5JmJqd1pRDgTjxuWz1UXNsJVS4UcrVdTt7Aqf9vm7jS?=
 =?us-ascii?Q?q3EZzaRNfUx6lLPBeHm6zs/DVQaq9W1rMndwEzCCBhFcdXcPagfMvMtOhuZR?=
 =?us-ascii?Q?CciDysEA1GCxoIpkjHPwz3txfWxXdaoQSpNR/XWjHBxqS0E90lrPdaU+N1Dw?=
 =?us-ascii?Q?cq6sbXa+Bx4du0Hwn1zGcgewUctFqqqAB2EYhlKGjL4YvDWp6/13n4hGPvda?=
 =?us-ascii?Q?GJt9SPJ9Q2ytRigqSay3MsNAP4sd4+/wRHrHm0p2XFk8bnvcREb3gCPew5RS?=
 =?us-ascii?Q?COQqrWyNJ27kxK3BYQc8Sjl6mnETSAu/6zNeOiAXq3aOi2ivHi9MrvjfKOYc?=
 =?us-ascii?Q?BSGn9WcXfMevy8pwrpdCWcfxtzNNbuX+d3wEMxrbVv+F4LE4RrQlhWPoWqTu?=
 =?us-ascii?Q?7M1AN6addmpsjZOjH5Iy2XOJ60Nf0/uMuk5Fh5cQcsv2DJnQ5ictbEQy0imb?=
 =?us-ascii?Q?9P0Gq7R0zlHss8sTdVRbq1dLnDARCWMFvCzQ4BwcouAlaChGMXJ6nISHnE5a?=
 =?us-ascii?Q?w7UEnkYps4edniUkKYDuogYGqgmO2zS1akGNLzIAAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL2PR08CU001.outbound.protection.outlook.com;PTR:mail-bl2pr08cu00100.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(156008)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f9/3lskek/6N57ArqSJVC3wyIJqrMK8K1GpoHtb58FpL9CbKU2JMKE0vKuaE6RfadrOZ0grXiqT3u60e/pJGnUX97KhMyA5QjLaQHQSEQ6hLpYhElKmRd48zxMyRd4pWRxI6Fk6pz2+08l6YA3C/BWIC4lTXH8QQUSFSrWN9vrpRQLZY1EcbPPbxcHH7SOxzMnCD2fpdQkH8xW+5siUE54cMIDijil4WtsO0FfNJhmvKJvA5nQeHfCzJjTMfyZTsz67IWaxrZSASoTCdaqBb7ApGhNImoV9deOu2XMmGoxL5Shqt8Js5nIk2SJlQtxTTkyLQ4CYQjfD7HxXp1WGw7AKgFVhc9QU+3KUL3YXvd4pDgL8bpABuNa8daAw1toKE0cY26YaIJ0ot0L0kMzBzixnQAUwITjsuqOAruqAzWZ5o0PQ4t+riDNKF6j/xGKsZ
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:49.3255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be98c0a-f33f-4396-7038-08de9f245f27
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6178
X-purgate-ID: tlsNG-d62444/1776720773-BF67FFF4-BEF9941C/0/0
X-purgate-type: clean
X-purgate-size: 2817
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
X-Rspamd-Queue-Id: 7EE8B4341F3
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD+gLqGb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38D43421D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287774.1568199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEu-0001BC-P4; Mon, 20 Apr 2026 21:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287774.1568199; Mon, 20 Apr 2026 21:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEu-00015e-FN; Mon, 20 Apr 2026 21:33:08 +0000
Received: by outflank-mailman (input) for mailman id 1287774;
 Mon, 20 Apr 2026 21:33:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEs-00010Z-QB
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEs-009kg1-6q
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b7b-5cb7-0a2a0a5109dd-0a2a4508a890-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:06 +0200
Received: from [52.101.193.139]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b90-63b5-0a2a45080019-3465c18bb7b8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:06 +0200
Received: from BN9P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::20)
 by DM3PR08MB8962.namprd08.prod.outlook.com (2603:10b6:8:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:00 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::89) by BN9P221CA0015.outlook.office365.com
 (2603:10b6:408:10a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:59 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.4
 via Frontend Transport; Mon, 20 Apr 2026 21:32:58 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHG0Z9hz1wdM; 
 Mon, 20 Apr 2026 14:32:58 -0700 (PDT)
Received: from PH0PR07CU006.outbound.protection.outlook.com
 (mail-ph0pr07cu00602.outbound.protection.outlook.com [40.93.23.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:57 -0700 (PDT)
Received: from BY1P220CA0042.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::17)
 by CH1PR08MB10761.namprd08.prod.outlook.com (2603:10b6:610:2af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:51 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::83) by BY1P220CA0042.outlook.office365.com
 (2603:10b6:a03:59e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:48 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:47 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:44 +0200
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
 b=Q/J5nitoav9HDuZxzEMHYvUNe32SVg/BHmnK7EELaCLmdC5+7lqGi4lZuzK6dEDVNg0uYvIVlD3B2K0WJO1rWn1FmliRWS0OhC5vcjlDWL9e3y1cc1f/DKJHTY6GhRrJIdTBFrak0VmBA4YKtUlWKnZ6HOkrNmvwhbMa52voEboIURWKDy33qFMEgqWIaIaukzqJz9hJ6nqcjFe75gFIOaQnD7x74KRBS19X3K4dAXADDDCBMHCxxGBMDLp5GcAgQX37PIAQxWJTti4Iu6SJzrvDNXBkccorPBKxoHEpYoUtsc2lAxCnuCjAvhcS/FwwP2yyxC5GyxDiuE8O0l3i+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIka6cApKr4tHLkM0UcaDmcfawXuEpYHKEShj03nxYM=;
 b=lfq5/+QnkyzF6qyEBT2fQVCut/Omu8cT4vCwxZcvyzgUxuviV7zvEN5EN0Y4NL5EPREaUsMCb2WbIFJQobdil/nC6xxhywyJvyUx9MX/6whWR/U2jpGT00kXEHrJwCErTe6c2FQN1E2k0JyZgsxKk8A1Wbn94oWsN2SE1rtBXW+zDEZ9u+wEZ8XkdYLwpP9kYvUIbRL/u3v2YGJ4lykMtrF7941zc11obYCKML3EwvEISN1Bfcv08sRyJaZHzCwifzoOr++DBvyNg08x2r3fWzbvjHgoryn5VYgNdmwd8xR8SrCw/40Guy05qt9Jq3zFKgqK5bJJtHBaTpNq5K8odQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.23.90) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIka6cApKr4tHLkM0UcaDmcfawXuEpYHKEShj03nxYM=;
 b=Z3nlMuPaivMpvv48PfnX9EoFwoPkDdyehzzUW2ayaVOPE2wNd93fhHdTx/F+bl5Fn74e05WLRCctu5OvJ5TTFt3VBNUZhQxbxZ/DCJVLCm7qaN/g9FmWGy0jBCAK74ZDHZ8ZA4WZhs92+h1tEDD7BIWHhmqmOL55fHXG3vyQQdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.23.90)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.23.90 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.23.90; helo=PH0PR07CU006.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7t64gH9Jd/+4jjkvSOiEECI1ySki1OHofI+WEbYjvniCU39IA68f5MxmhGuhGcyTFpncB6pmk3hpIHIy0B0T5FMcsaRT2FoXfPP81G8NW3jwxhAuF9CY0+1I7J9BZ/fSQ9rtP4nnitnAgKXPgn6UwaGxsoIT9bLLCgL+lgiYeg+pCyWp1G9zKyVW45asgC7GaH8X1sDhmw+zUQCvdABNvHIFuUgL5CeYloIgf+n0wLgRU4BwppZ0+pNIknQj1eRDPoIyFQmH5DOy1uslKS+pRCFP4cqtWWfjYaNyt/06QzMBbjZkeO2cMD9c2ZAutFf0W0b2ETtj9lagMP/7KHZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIka6cApKr4tHLkM0UcaDmcfawXuEpYHKEShj03nxYM=;
 b=UKtKUAmx4rDpjVDyP+qs3vRU475wexWmUuHoM/MrDnncd7IxYCA/zJ8+4G4lBifq2Liqmp2rEqEF8ABJcPMdb9zTpCkna9vqxQs3gZTlLQ6wge/c6hDhFp0Nc9zNqfRnevwo07lluz4cxrCBHdsnI9LcvyPfPZYghdHMArMCmd69gXuHQ1MNJg5SxIhaqZI7UHaH6TfIO0SUxspIfgiuEEhA1c3hnqg5J2rCsvDWVp77KRYf0pyKQZclbLORV8vrSeRowE9dIVC63B4LS4wizGs6+v9P09m4z0dbde8hDCwgaEXs8Qe92vYYrvSyEoXfCDyUeoIcF/aSkYFXMXr6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIka6cApKr4tHLkM0UcaDmcfawXuEpYHKEShj03nxYM=;
 b=Z3nlMuPaivMpvv48PfnX9EoFwoPkDdyehzzUW2ayaVOPE2wNd93fhHdTx/F+bl5Fn74e05WLRCctu5OvJ5TTFt3VBNUZhQxbxZ/DCJVLCm7qaN/g9FmWGy0jBCAK74ZDHZ8ZA4WZhs92+h1tEDD7BIWHhmqmOL55fHXG3vyQQdU=
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
Date: Mon, 20 Apr 2026 17:31:35 -0400
Message-ID: <20260420213206.208750-13-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|CH1PR08MB10761:EE_|BN3PEPF0000B06D:EE_|DM3PR08MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d5a7c2-8541-4dbb-de2e-08de9f2464e6
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?IQS5Fi1MTdn/z/oySGaFaILPKIpRmzgqU/9wQBAMh1hhNyqKGRwKPDKosSGg?=
 =?us-ascii?Q?ouGa7Wi1+j8iHsbIWsEs8jTNTKxHiNnMbTAlyofPAEcFEvfORw4tFOIIJ2eb?=
 =?us-ascii?Q?oILxirH2M/SkPloC64x0bSy/w+NldKzNTxB/uED2YHhFMxIPtO3oM+/qIgTw?=
 =?us-ascii?Q?0kJmXCYHbTMKCe/Lsor2iKHDmOL2oI45sOnJ9gksfTPlloMhS1nxJUMIOCy6?=
 =?us-ascii?Q?oWk9PPBMsMt8iK1A6QaINdr1xFyKTbAFPz6I2wa0iQIEJnPWgVrpD9uhyr17?=
 =?us-ascii?Q?eAuuSUJyoFZtX7Ka9fraEZPcwl77eOTj40wpxDr5/1IJ0sZySut9JTAz+2o6?=
 =?us-ascii?Q?q4L84JVPC8toKSvWZVZHlMZ+F759YMUCIWX/XZP4fR3v1kQpSMCk56G1Wp8Q?=
 =?us-ascii?Q?WJTOWq9lygqi3tGPvN2ZvD9x/hJAuW1FS1dc9RA3rhbmfSqCIj0xKbPJGBpy?=
 =?us-ascii?Q?XAJsIeIpm8DaSv5wGuM1Tk9AWcX7xVNT1EfFCWrV9n+Cpt/eXvZGLIFNIvk+?=
 =?us-ascii?Q?tw+VTJFd1kkeznIfa8cP3iAgsJvrbPdivB8WsV4el1cqQ/ZeX3cAs/ktwa8S?=
 =?us-ascii?Q?V9Xfoew78DgsmCGwQNfNgS3nAx1iZqhi8qn7x4LUxJy8++hhfi+volXYQZu6?=
 =?us-ascii?Q?4o890y9HQkXPbtkLBa5VZaGz0e6vdKg7oE1OOKsLQvkH48YWe/5jbtLvhR5E?=
 =?us-ascii?Q?LEnKG6tqduT7a8BJmMEcjb36ObkE5QA74PK41eez35Jzo/LjOJ796WxUnp92?=
 =?us-ascii?Q?3jIexpcSlveR4EGkkUgfFE2yPX2NV+Ph3camzWcqC6TVrr34xEz7wbFhE4CM?=
 =?us-ascii?Q?wsY6PmYqEC2Ev+OFZN6T6DVo4nyycqjyni1YtBZ6mKIOZmnkZJJ/2DAZQqFZ?=
 =?us-ascii?Q?+LQTSey+IEvH7ZW2dhKNhmvrMIAbPwAwuKmD4ACODSi91YBdRerFgUN9KIjc?=
 =?us-ascii?Q?RYUxXH3hJpbn2d/R/K0G8KFn/F+JNpIKXhi3nnD+gqzVuwd03PXR5NvtTqhS?=
 =?us-ascii?Q?FNRPDkBHP6B3lYRlB9DpNj6qlqoLIfNpC0NqZ75cNhXOza4J71+HH08xMIQt?=
 =?us-ascii?Q?SD22J3wezl1knMyqBptVKtglHI6CVSwtR8/p8xy5ylbgbmG9AMun6CX2i/eo?=
 =?us-ascii?Q?GUWZoX6jvd9kYMkwWpkkbG2sh7EoghRnoVgUA+7Yyc0dDhP9Q7v7J/rJ1bav?=
 =?us-ascii?Q?zd0gYY4QRDnk6jewkbz0ySLgtatm4zqQRNrxmgm5JgxxVm+LK3oHuTNdAEvG?=
 =?us-ascii?Q?WmvbDDEZt2UI3kLjOXC2Rl2n4AzxJIsQafkqDfDyfg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 iBvILAL9+7/o4Yv1WHDe7PIT5ubTgqC5WzBDYKGc4y5+KSrz5TRBZsY0RcXEQyFGztbVUuwnaLqKAcc3bWegtjhlU4vb3drY1E3AcE3sq6ozhrCbuW+LzOP6lGCBqYXZJptATh9BaH+VX018Gw6AtIpKjfPwvHZ7FBxTvGB8WtJQTrhCK0sqMsDeG3rX36HtLpk57+rYJdG/PnZKPN9zQeUnheufMze8QIrjRkvTOp5UswNRJWbUu1d2nl29viRw4eXdSjgTgXyboCqAsCmF2QvZkEmOA7b03HFUaF7fqiFIt2qBRu7NHO+XLWHO4RG/lry2A7k1eK0TNWylj5+Hqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR08MB10761
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.23.90];domain=PH0PR07CU006.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.23.90];domain=PH0PR07CU006.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	843c7467-a17d-4f0f-baa3-08de9f245e21
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3j6vsaEEM7yfLeXDTKOOwW9O48YLL4Jgpz4EOJwjAT+hlGgemcivSzZdvOpx?=
 =?us-ascii?Q?XakTtbUNQ4VM00kbHalz34RbwPahnU8kP+lrRsr5AytBD6orTj78BxEvPhnH?=
 =?us-ascii?Q?XWvZb00IsxiUNv4g0gXgS3lqxf8BwaAf3a2mGABt0MUAS3ELyA90aQYLjQO+?=
 =?us-ascii?Q?S7t4tKS05AVP5t4cYvZbCImON6PhvoSBWKuvezbmkznHIJ/r5Db1T1de9XMk?=
 =?us-ascii?Q?vkCSn7oaSYQgF4tHwqYyPYQ+903D6QvMvwqngBN1pGOyLLJigGgl+eukeM8z?=
 =?us-ascii?Q?IPsCO0Wbn2XqmcHfueY1Q0yT3kIOtQ7srnc5dNZqLGVnCyRdg/FciTdgGKCw?=
 =?us-ascii?Q?cjXFlquvfKKft2UHvvvzLLc6z5Nv2W+6w3MjElcQ49iQYjGLwEmemtSUd0mo?=
 =?us-ascii?Q?3ojQ7oNRMadU+JHr/EW2L0f8y1lEhepe7jsrdoy2DKxJtI+e11eh2NWuaPF+?=
 =?us-ascii?Q?BnwE+Tc/+XI1OQ1fgYYapxs/hqal3DnT9qAmmHxuzkVLh5AecCLHbRwOdzLM?=
 =?us-ascii?Q?mZTuajhWw8thqW0MMEN/ZVDj6IzKATmI2geFXI1FzdsD5/P799c/t/8jZxnx?=
 =?us-ascii?Q?jOni2hK2o851HPJHaggjOd1I6tC6ie4HxmrPYnkFne75iECUkJkL6aaS41Qz?=
 =?us-ascii?Q?BlxqN06OUm0v+ti7ZLs0uMBjKn2FprHOmg8DPELIelJJ+VfCM5s7isIocTE3?=
 =?us-ascii?Q?9nFDGPs0LSU9RXtDfZYOwz4jRMhuMpR4w8F45rsD5muPU0pkCmMa7cd2U363?=
 =?us-ascii?Q?kBMTewwoDmxknN/mR14Hw0htAflg+hxz4eyiL0wKExDWuX+CMFJz1+pDvBiW?=
 =?us-ascii?Q?A+Fca677E45zT5ICyxYsnhMxLl6J2M3QyszzZlMebBdQVR8wKoJ8TDcJEzil?=
 =?us-ascii?Q?4+qJcXSOS0uGPYbPy1rtr3vyUIyFZijjHJvJAOO7VkwlGlqULrRIgLvyQ6o1?=
 =?us-ascii?Q?crUwWwqc9U3qfD550KJ76tkgWI2a6k2UziJ6/7Ik4ercrBp4AHIimZ6/tvX7?=
 =?us-ascii?Q?WbNikhqvWNTxwYRZS7+67wOcPqUYKihuyUunpE83MTtC6CXlFKy0eHT8V2uM?=
 =?us-ascii?Q?W737D4F/SO72Wn6ymxF5w2cKTYma3Sly6sgYlOgHbnM1RNWptouSLx8HrTZ3?=
 =?us-ascii?Q?R5n5MoqDCA74MgxpgtMV5Nnf/GnEZ1cFXmT+yOCgw/0pgOXXP0no8epKUV0F?=
 =?us-ascii?Q?LEEt+gshChCIoS2XDsAs4wWEHeAFSb9dkPdmhCEW5WM2Z063ZszcPr65hHBU?=
 =?us-ascii?Q?qcncJULIagq9hodQTRF8+unGWD8rKL4kO/XpTAlorA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR07CU006.outbound.protection.outlook.com;PTR:mail-ph0pr07cu00602.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iMkE3LSFCbo/XSN75Gcru/UnJn1LGYXbTZIr9SaoSTnuwsO23mDJLqKc62KnMcZEO0Rej+XZHpXZX9chHLweo2+7bB5gt5DOAYk7j+oTRgrAA1oUupZncb/yctR8S91o4oB5J18Q+PP9Gk64WXaKw8az/rA63+2iiWAMcoT38G/6BLOSBMkCjd2DAcRW0Ma0+kzpAzDGfkeKpPkDA7nABcnWW7r5/9Vfyzp5LzBfVVqCDgkkR3f4QBJC7hmxWKA/VTjt+gfgfFZwBdOlrtepObHAKPNHPBwabvJupWFexVlQGcMHNuo4TSkSkwyn17yekbiRrXC6pL0TmxGiAAj83qAaazXSKHRSt48OM7GJHzu4/SdnREKQ82ur6uWAmkO69ca6IcGfYrWiBWluEvKy+9gQTPWC8ZCgpuJ9vrsbonN8EtETDsIMRfy3b1mQz8we
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:58.9668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d5a7c2-8541-4dbb-de2e-08de9f2464e6
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR08MB8962
X-purgate-ID: tlsNG-c1860d/1776720786-C0B64DB1-F13593C3/0/0
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
	NEURAL_HAM(-0.00)[-0.342];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4A38D43421D
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



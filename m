Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICsBJ9Ob5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369354342F5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287922.1568376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFh-0001zO-Vp; Mon, 20 Apr 2026 21:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287922.1568376; Mon, 20 Apr 2026 21:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFg-0001cX-MT; Mon, 20 Apr 2026 21:33:56 +0000
Received: by outflank-mailman (input) for mailman id 1287922;
 Mon, 20 Apr 2026 21:33:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFV-0008IB-VA
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFV-00CCPQ-BA
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bb9-bab6-0a2a0a5309dd-0a2a4502c9e8-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:45 +0200
Received: from [40.107.208.97]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bb7-af86-0a2a45020019-286bd061ffdf-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:44 +0200
Received: from MW4PR03CA0050.namprd03.prod.outlook.com (2603:10b6:303:8e::25)
 by BY3PR08MB7201.namprd08.prod.outlook.com (2603:10b6:a03:36e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:40 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:303:8e:cafe::d0) by MW4PR03CA0050.outlook.office365.com
 (2603:10b6:303:8e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:40 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:40 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzJ414vXz1wdW; 
 Mon, 20 Apr 2026 14:33:40 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00101.outbound.protection.outlook.com [40.93.1.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:39 -0700 (PDT)
Received: from BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::10)
 by CYXPR08MB9634.namprd08.prod.outlook.com (2603:10b6:930:d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:35 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::14) by BY1P220CA0015.outlook.office365.com
 (2603:10b6:a03:5c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:35 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:35 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:32 +0200
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
 b=QfxDAwOGhuwOOhRNDAhFecwO/twv8Ua/nLdlSrHHXpBfyC+ufbBIryVG9I4PyLEpQZhepD91KCFGN+sTKhDu+V46aTvpkTvQhGbM+msGz8kgrhs+QEi8DPEGO5G1jhSG6A7SEGai21wv3cRnW6Fma/sqJ3R4eZTZ4lSUAqyC4RrBXMiDwZq2wOHUDi/2XRKvt2ETbfbcfRCFTNEYOV/EZniYvQxzFgBccDiikWOfWVCemWntV4c5X+oDRZ1BBdeUGGT3WrKcqWvFu0+mAb6dUvH2Da9qjZsyKTuNzdekV/Bcq4ec+LSncVjW+R6Xs2INN5kktFSmpSS1HkDTBu6hdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB6UB8nPNPDJ1HE6m3AZNiyAJltYGI2r4/Nm/aLYhC4=;
 b=jLVs9z2xzofau9m3ZT1VltZOFIby1kP3p2Om2m33fVvJ7Et3XbsY4fEBU1zEj+mVLae7jniBPB1L0NcsW+JZHimHuW0zE8SzTg48ghlrNgktcJqYfH7bNVtpkNYSrYJAGX/O5IN2qvyt9nkalHmGjxFDwpyA3q676940yMqTDKl/HVxTN/MrFqs1914H/kpESX2pwmwHoEK9aFxTlJHNXU/VYURDuFVOBGhAIeCnBW9XJxpd/IjkGZurndb2X9RQ0pMgLiZiKfT/Ps0nZsk127wgHz145Jz1dpFmxFa75UVTJKl9PI5ySARs7y/BZAIMurb5D/adTFYWT0VdCWvVcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.73) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB6UB8nPNPDJ1HE6m3AZNiyAJltYGI2r4/Nm/aLYhC4=;
 b=qED/O/8XMTwmpggQg9GZlEmZdhwreyCWLSuB3TN1fhjUGzpNo+c2dgtByVHMmmKI6GXrF4wuGrf+aGO5PgAD4xKUrbFi0cZvpK74mNO3RWh6BgwjVSwQdoZJOOqzDq1mTyHqAjRJmwfCLG0Bv13c0FzZk9givNhaeu9p/KXjYQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.73)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.73; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw4fK9+0SsQEVeh607QdPYVVrAaF/Vlw9FPSAlsfxdaVCAyuArXLk+5WOxFsGtIS6+/cwxS2iE8OEkMZE4VgvdnDt30QNqzzP8eTWH9LUs5iC3CZS8RcdJOBnGPFDICS4rXS2J/lk4aY+vqfvHVm76J5F9xSOOKXT1Gz43sCEYCLFwzn/YBWbu1i6u7Eaix/7al4hW7E3Qa/ys+eET7aD5jw996sLBd9lb79gLKTYNH3rYWVh3IegISIzwLidi2mOufcU7M+rzpC8KoM53xL5Umc1y0LqdQZDKgzxjxjbST6limSfvzV8TaBwgd3HdK+TV/9Tw9uAPuICfjw2IpRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB6UB8nPNPDJ1HE6m3AZNiyAJltYGI2r4/Nm/aLYhC4=;
 b=oNzsDnwNZ3hW3nYWEEX0wfwbMKvsFIIT4VdBa9saQ8mqfCQjKfsT7YpDPMYyoB7Yx2T4YdEO/GyLChAzEduz8jtOLFcGLg28VrIyq2mSdDKTo2Z8wVKqE68DzoH+8u3EyCLAaozdRrkmQcFS1051DH6kMtWLPl0mIL4c1P/dzszQQRjIFT002OFsyxO85tyw/K74eSdmGMlrfFc5GIGP54u5PK/wsi23MSgFOuXOccPr5vx4ksa+HN2l0jC1FG8IZuWLR270fcjhbRBofRGaqtkpGz/2vogd78UWLvDkW50gGLCS7Tn0i3xLPaIFgQRXj0Du49WhU5+E6MFNvBXBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB6UB8nPNPDJ1HE6m3AZNiyAJltYGI2r4/Nm/aLYhC4=;
 b=qED/O/8XMTwmpggQg9GZlEmZdhwreyCWLSuB3TN1fhjUGzpNo+c2dgtByVHMmmKI6GXrF4wuGrf+aGO5PgAD4xKUrbFi0cZvpK74mNO3RWh6BgwjVSwQdoZJOOqzDq1mTyHqAjRJmwfCLG0Bv13c0FzZk9givNhaeu9p/KXjYQk=
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
Subject: [RFC PATCH v6 42/43] arm/altp2m: Add support for altp2m_flush
Date: Mon, 20 Apr 2026 17:32:05 -0400
Message-ID: <20260420213206.208750-43-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|CYXPR08MB9634:EE_|MWH0EPF000A6735:EE_|BY3PR08MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 2401a26c-74af-4c81-3b81-08de9f247d65
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?u030/QuE4rdGUY8y1qsuRdeWQokMDXqv3zAIhtEb1MAJdaFiRoGjChW0a1jz?=
 =?us-ascii?Q?8MjaKe0abcGAQbRmXW3rD7cp6zQQwMKzfVwwp26VOb6g7xBJnXesKIpjSt72?=
 =?us-ascii?Q?iA9QnRdhtZYLcQp+6NWiJ3hcpox4tYuiKCnM1rLZGx8QrR5RC/uMZhIfi+JX?=
 =?us-ascii?Q?d4W00FhoXEPhOohfRtkciYYE/SJ4HdbNrSfX7Ij69Q2gUYIV5yw3eEP7qRi1?=
 =?us-ascii?Q?1pYqhQMB4TQw926DvXIkxEaZzEln2PmFeVnvT0VNtNE9ZMgsFldUqZosgnBt?=
 =?us-ascii?Q?ZnTKrMrKr947Q1L/+CNEwYLE2bRD6kPDoYQ+M3IwoZhbTZXt+Yy3ddMFAR0b?=
 =?us-ascii?Q?Bedkll78e35Z7HMsTxKKgbcqZAn2CM2ZCWgl9ynVYhYUUPhdEVw8c7p2x9I1?=
 =?us-ascii?Q?4ym3v5Y63ELa0vy6K5i+2wMS4K2xYsflLWmfPGceFaojsIYV2WiemNt3LSu3?=
 =?us-ascii?Q?G+8gnPR59ug5IilRLuqAFq29bSKPYzBlstUQwcBhqqavO6WNwFDorApHflTx?=
 =?us-ascii?Q?h71+/O3hH3F1OP9RhNOCAZfpynO7XI7rtXr9rBQfS9eUZ2dJtVlM2P79gPVB?=
 =?us-ascii?Q?/FOxV06po1LXcP4Eg5icD8iPP9ys9bfVR0Eiz/rycjDRlhCRgnlFhVE5GlxH?=
 =?us-ascii?Q?eZRczVMU7dN1RQ9as8pxhkxBc7TmwfEMrwL5e4rquXWXj67Tp2bfLrdMkCrF?=
 =?us-ascii?Q?nvIBcqiofStQKHs8BD/0FZyvkq5r8rGsLKEUlw3cb1RcyYyBQCM0kCh+L1oi?=
 =?us-ascii?Q?fhZkbu64bI+T6IYtY2iq2C+40EUfxsNVFM2W1q2qSFXur2nTeGhDT82r9EgH?=
 =?us-ascii?Q?OE/iwAU13ALlbARAjf035x2E8r2LMgYep0oNVUZtqQNWZ/kC8sF/7KCLNsMy?=
 =?us-ascii?Q?+anJk0odYHlvz1uuiJK2PR/oSpdLSJOz+8WAZa8eHVR2oMOoUz/bgl8e1P2t?=
 =?us-ascii?Q?mlwn8adeSKiU3PYM+wsGIJ/VgROmuJPxkCgem6YYKea685wqfxKT/jdLd+Di?=
 =?us-ascii?Q?+uAlh6GQjcGVQGGXmgvH2NCKuMVRJG0HmQt5LYlmIqK5xRZNu5YiHH8ewoje?=
 =?us-ascii?Q?LpS4JfxBzjBMfp5E7Hd770wDQYpU4yVC9H7aN1Mr6Wi40jijROCh+Bf3/a1u?=
 =?us-ascii?Q?SpOfXbF7/YP88CPIBEdumH4Yik33wu5wZyyexDJG/LnqayqHsc9gjamimkNo?=
 =?us-ascii?Q?Q0Jm9nRFNcwY1eIl?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 GQ/HbE+wkVPlVkB5iPvgF5xwT8hbGFBg2Rz21nhd6YHP1pFQwfl8Ey2d8MTESumB8JaN4CgzPZOo/Nq8Bwe5h+1dYRN6uxkOKUeOm+UXkt0JjsikmrSzEUYCV74foOXWfVa8R2UBF5Y4gPrvJQuDHxAhBtzLqbWSlYqV9JG8jWuVGdLUUvPioY1UqWsrTFHTdDWVkjkCJ87N42QmnZTDbW//3BM9CqMzCKEBA9gZNcadzPHOBsPDjQbdPcNTsAwHMYIlFx7b32a2hRjGOe4mT1au3iovVi2JEecj1Yd16BKa56Xp6upyisT2Gmxu9PIvX4um848Q8kyomIb0cgzX+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9634
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.73];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.73];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c2e5957-f544-4a56-a68e-08de9f247a65
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|1800799024|82310400026|14060799003|35042699022|156008|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rAbgB1WKgSJIfDnpSDZdr0v71AOeEGt7H97Bc2ACE/1N3raT4n2B+ERi0IyC?=
 =?us-ascii?Q?0uB1o1EwCCndHW892UX5/zzdYZsxv/0lo5KaNcfw1Nyk+EyJks2OyeXZYED/?=
 =?us-ascii?Q?61oj5lTJAcYlgjJ5zO+Qu23pSeIUBn5P2JCDpMDpfwreqUH4SGNAjYaqFoo6?=
 =?us-ascii?Q?E5ZlKz9x/DlADBl2T3n94KT7tAV5snEa6f86/x2i9ZOou9cJtJew+/eMIGyJ?=
 =?us-ascii?Q?cokiHSRrdrhWWFytnTU68GpsS+jC+I34Q7ql2a09OEUWe9Aq18yacurT++R9?=
 =?us-ascii?Q?bnQ+HPyl3eKHGCDS9f2UpMTpEKuMLpDQ4yaBW9GbZWeeyQbq0WcdPBN91hQv?=
 =?us-ascii?Q?uNbmp5FqjId+Nx8kJlt3xdyHAV9YCw+b5dh8SaA8i/pu5sLUW5V94qxguwlj?=
 =?us-ascii?Q?5wqOqngM707QNQkwjNK20/x+7KuWOf2lGMOmM+boQwob5U4AG6YhLHnnvgMl?=
 =?us-ascii?Q?Vx2QnJB4DWxvG5Xlckvar6q3YFU4Yt9GQTOBfwI4Qy7xY39I0yLu5srWKRMs?=
 =?us-ascii?Q?RjRa1uQ7W5cOSDvwawMcezURSlkWjCXzOhDpQ//6MrYXS2lmvsYzuyN2vV7Q?=
 =?us-ascii?Q?Csa5Wq61O687ytEGC6N5LTUgy+R+1GTlT2/1il3oGEhYsa5F9f4zfPtAAKMf?=
 =?us-ascii?Q?5bOCNce2QVDoRhscNGO/y+6X0/Ew6Q4OOIOwUU/PksYWJQ/E00jGdXMdSiVB?=
 =?us-ascii?Q?OtkvvVAefFYszJlG5hmxKcseNiqGqrn8R9m6aelZpBblOjdZC3LYngTd2ojc?=
 =?us-ascii?Q?82XAz/f5gPJQNgkZXGcE2HVRORdUp6HbR65k7tn23kW52nwpvOTIC71zogFP?=
 =?us-ascii?Q?VewbRP+JJXL1QIHq2PNcVwMYvZXMBRrwkLqHWNlJRsaPoiWND8lzUA6aGC/4?=
 =?us-ascii?Q?rFayCb92CQwT3buGZm9baXLTyMZ0yPj5siG4yrWnWv4IwCqDOo2QKIni5gWH?=
 =?us-ascii?Q?L9Js3WwNOktpZNNINRpgauDpWBBptxh3MNQioTOhnYjwG3HpEyChrJ8+UWmM?=
 =?us-ascii?Q?RwgdSV7YfcqMjUY/MvtSk5dxd9xfwLcdyubxhxF6zmjrY91BJKcyP2Ev7JUb?=
 =?us-ascii?Q?Am2PDNJiHLi0TPD1JkS0sXyJjg6SbyW/9CeUxXbfLPsbOPIkl3IRXfNTAj45?=
 =?us-ascii?Q?IbxQADU/YKQJ0eoy6tu6EVScKIJ83xotUwIIkFbwTXgPfeSsk4OeOCXRkAp6?=
 =?us-ascii?Q?tkKoWPCZyDezxa4J?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(1800799024)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8+NdLyPprCdCj3SMjh/5XbLTBqrjD0tnuhkeJ9TusAAYfeX4FprfAr15p3Z/rcVDIZRoaMC0jplzpB4utpkin/joIH3miEW0Aaa8mA4AEj7w8g5Ii23i5KrMk4qETp4P07ws2fXJjJVTn4Q/1AN8u7whp4JpFBDqrJR7XiE37syySqMdHvj8aBojrSKQztzH6i4gcum41r8S7QYVc5qYY8g8PlDMyAS5ILogK3mAZMiTGEVDWc7AE8BariKgN2pm58QByh4MGlBrHj/qfYEhxqbDIHCuqnXgRNLEX9MCs1ZaLZNy8hwbD3sJ3/b2m94bHOqM6W+HU/jni1fNuE+yso2ZCVI2qKjYC01+u7PjOsnSyWCfRv3TUlGrcFNp21k3IofnDpH6S/jI7KiCPR0I29BYaql4/T3iIQI0eyBPmYsYDOl9+mw7uv0YH07k+2Zd
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:40.3694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2401a26c-74af-4c81-3b81-08de9f247d65
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR08MB7201
X-purgate-ID: tlsNG-720697/1776720825-B2969161-FA4B2E62/0/0
X-purgate-type: clean
X-purgate-size: 2484
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
	NEURAL_HAM(-0.00)[-0.300];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 369354342F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit makes the altp2m_flush compatible with ARM by replacing the
x86-specific set view visibility code with the architecture independent
altp2m_set_view_visibility locked.

This is commit 2/2 of the altp2m_flush phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    There is a small amount of additional overhead introduced on x86 by
    replacing these direct array sets with calls to
    altp2m_set_view_visibility_locked. That function also calls
    altp2m_is_eptp_valid, which performs additional checks, and also bounds
    the array sets with array_index_nospec, which isn't technically
    necessary here since we can be certain that the array set will be less
    than nr_altp2m. This could be resolved by introducing another
    altp2m_set_view_visibility variant (ex.
    altp2m_set_view_visibility_unchecked?) which would replace usages of
    altp2m_set_view_visibility_locked, but I'm not sure if the overhead is
    enough to matter here.
---
 xen/common/altp2m.c      | 5 +----
 xen/include/xen/altp2m.h | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 0dd3ecf226fd..d980ebed08ab 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -123,7 +123,6 @@ int altp2m_init_by_id(struct domain *d, unsigned int idx)
     return rc;
 }
 
-#ifdef CONFIG_X86
 void altp2m_flush(struct domain *d)
 {
     unsigned int i;
@@ -133,13 +132,11 @@ void altp2m_flush(struct domain *d)
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
         altp2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
-        d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
-        d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
+        altp2m_set_view_visibility_locked(d, i, 0);
     }
 
     altp2m_unlock(d);
 }
-#endif
 
 /*
  * altp2m operations are envisioned as being used in several different
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index fa2c11f5432e..5222c24ef418 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -74,10 +74,8 @@ int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
 /* Make a specific alternate p2m valid */
 int altp2m_init_by_id(struct domain *d, unsigned int idx);
 
-#ifdef CONFIG_X86
 /* Flush all the alternate p2m's for a domain */
 void altp2m_flush(struct domain *d);
-#endif
 
 #else /* CONFIG_ALTP2M */
 
-- 
2.34.1



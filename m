Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PCzMMab5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5B4342CA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287894.1568339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFW-00084S-6X; Mon, 20 Apr 2026 21:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287894.1568339; Mon, 20 Apr 2026 21:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFU-0007g5-8V; Mon, 20 Apr 2026 21:33:44 +0000
Received: by outflank-mailman (input) for mailman id 1287894;
 Mon, 20 Apr 2026 21:33:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFN-0006on-PO
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFN-00EgCp-2O
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9e-e002-0a2a0a5209dd-0a2a450be734-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:37 +0200
Received: from [52.101.61.73]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69baf-212f-0a2a450b0019-34653d4947b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:36 +0200
Received: from BN9P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::12)
 by LV3PR08MB9147.namprd08.prod.outlook.com (2603:10b6:408:21f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:31 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:10c:cafe::6c) by BN9P222CA0007.outlook.office365.com
 (2603:10b6:408:10c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:31 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:30 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHs3pNgz1wdM; 
 Mon, 20 Apr 2026 14:33:29 -0700 (PDT)
Received: from CY3PR08CU001.outbound.protection.outlook.com
 (mail-cy3pr08cu00105.outbound.protection.outlook.com [40.93.6.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:29 -0700 (PDT)
Received: from BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::15)
 by BN5PR08MB10625.namprd08.prod.outlook.com (2603:10b6:408:2a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Mon, 20 Apr
 2026 21:33:24 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::b6) by BY1P220CA0019.outlook.office365.com
 (2603:10b6:a03:5c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:23 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:23 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:20 +0200
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
 b=TQqwYXlEbHAL0dz2XIjdzYLFWfQIRhYUiLvJo04JdtHe+SW066+Kqc6c/EMx3jNfu9OVIQeg+NTZrYNoVpi9L8+9s3yu5b8fzuQKO50kH9DNy315h2c4fOL88eimgcfzcnjExaknzZ/YbdiJYIReCp6G65sTYEdHmKfXY+jASVIdSQSFCZe8fsZC+ka0u8TnyBTfS09r+TJzeRSKEqfWqzk/iKWP0OSCe3eCqM6ZCO6ch96FXNAo04FbEU2EGVorMF60uoE0jwbxu+nYMwA6PgOJKoALvJiDyB7toDklLdZj+SYVeynyN/CS0CQcVLYnBMAyIFgt+dpKidjbSkTnKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWUPA2R1jGeMCWnRBq/OLMBccKwi+cy0SSVh5xBuans=;
 b=s9aaD+MnQ2bu7In5QxmdUi7y3Dsky/01+MLTFd2ImfuBPK8qKq+myQPeCL+ZkjuhddIMT07D/L8NY0ECl92NvJn6/3YELiu4ZmMpUpjTAlZij/SNTqI9fdZDcqG/r4itB0VGbZu/fVkiFUu2L1e4bi+vsr0lTo34NeWW0cxmg7QhjNwEDYKQ4iCQ9HgIOObitTgPIU8eSoIfCk+irdIXetjzdr4aCV8wMqg3CDoYz18nd3UA0wI2Rroe0t6T71+e7EJTQGXd9SRFyhQyx8rqCqei/AN2E6bhCRItrNTNphpQQ1eOzAle3NDXMBsiX2qjbaBB0D3Kd9Mm7NCC+/8U7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.6.109) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWUPA2R1jGeMCWnRBq/OLMBccKwi+cy0SSVh5xBuans=;
 b=q3x8PNeLNDARM3qMpo6CSOXswkLcq4lQAsq7LNtlaqPX4LsJP1pEKjHJow0mGBxgdzn5xo6E3Sjh3OvexUGpCxpXD6sSKEMoH79Qw0EVpujG4+7qOBsJHZlxEz5NW8rDPP5uFbp/tHP6A2VHU6fR0pio7EIeqmxwGfg4hVO5G3Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.6.109)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.6.109 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.6.109; helo=CY3PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfCBfjHVWms+EcYedWfEJRGQjJpZt4gvVA+KIXIpHzIHixCZpxFc/mNRPOu3gNjJ2neRU+ngHu9MbrXR4oCebGLeTE88RcjqH0yPg6zQXZ8P1eO62z9R2JHazPt9PaB+JSl9LL94Dc3K1RS2aVqylKxqrl4Zu+UdqV27igpu5OeW2Kwsab5xKH54kRuQDoLEBIU+eXA5VXoOUyZdB/vaWAuaeQcPS+zz/Jo8brgFLDcz4wefL3LsX25TU6QKAwbhNFFDc+v8QqlkIx1zJhzPDm670UxdUvR7eRktK2sVex4QLaDszNqA4StpCSvTNpDMJwMrI5yBYKEZXjQJqBmW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWUPA2R1jGeMCWnRBq/OLMBccKwi+cy0SSVh5xBuans=;
 b=WYsQVJWzXRIJUyNWLh8BsWjHcLOUAy+bBCaYC9u6/AOKTi0/aGzYahjwj0Y/bew8zLZNR/SUh/fg7d0H2pM/e408/of9HpKfFLS3fbmvIXLkmGsMJb7+8fzUmWJbcwRI/Yo7/6AMnitVSNyiyelLkNWk5G21wwPa3CcV6/y9Z9/gob0pAg394Qk1I2X9k0gz42NexdAvdKkioNx1nILgQYfpgED2RDjg73bHotJx58l+IBCKKeIEOg7qmCzcmjUn2gPFTtxH25iCHFvhyxqbYuGD9RxOTKdkeP/t9LT+O7mLq9kbcsMKVWUiWIPojuwVHXVbcNVlDmm5H4iKXiB1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWUPA2R1jGeMCWnRBq/OLMBccKwi+cy0SSVh5xBuans=;
 b=q3x8PNeLNDARM3qMpo6CSOXswkLcq4lQAsq7LNtlaqPX4LsJP1pEKjHJow0mGBxgdzn5xo6E3Sjh3OvexUGpCxpXD6sSKEMoH79Qw0EVpujG4+7qOBsJHZlxEz5NW8rDPP5uFbp/tHP6A2VHU6fR0pio7EIeqmxwGfg4hVO5G3Q=
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
Subject: [RFC PATCH v6 34/43] arm/altp2m: Add support for HVMOP_altp2m_set_visibility
Date: Mon, 20 Apr 2026 17:31:57 -0400
Message-ID: <20260420213206.208750-35-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|BN5PR08MB10625:EE_|BN1PEPF00004682:EE_|LV3PR08MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d25fae6-395c-49bc-99bb-08de9f2477a1
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?/eY1PV0XBQIWvxzYfcUFwrRlS52N7t3q9QERsXtzmYPNPqw0bssmg2WW+be8?=
 =?us-ascii?Q?sZ0k+IuYxih/Z3YwB8UVknFwgbQK3ImJBlfIuzK00gcSQQltNcGU2bm2kGVi?=
 =?us-ascii?Q?gaE6pJQ/R8uzOSebuU+rmj4oC3c2hsDVtxyak0zNWTKtSdkn/uUKUQIG4fRw?=
 =?us-ascii?Q?9hlRYSwXV4KZHAkCqCqNfY95GUFdZGndIqz9MzIbRNJtdPeht1PYnCD39llH?=
 =?us-ascii?Q?sw6cWHyTDUo+1ut9u+sp+E1aJWh2P/khlRNucAPDzQjiY803AAUG8x0rCN8w?=
 =?us-ascii?Q?E1fGF427oUwlD9/FWGe3wP6ezSVx5XSZrfXaImBqnDIrXKRa43rkSuZPzQeV?=
 =?us-ascii?Q?qgU5s1nvKtkpBG6Vzftyto7HXm6AlUIVLIzg1IXhooufYeHNSszDnxOx22MH?=
 =?us-ascii?Q?A712HfkGOY4w+w+QsoC1g+RDb+7Ucp3x/Z9/wQLl9ItfVtjzjRk//NAcUJCl?=
 =?us-ascii?Q?plmXAMj8+z2h3V3yRntzU1qRuYRHCnqu09cW/JhZJXaobiJ5Lhz8O3pQJGt7?=
 =?us-ascii?Q?0ufEE2XHIcjcoZnrMYNLmoWvx+fex2NC+XhPybvgH9w7BvqhtUb/Q4F5X1It?=
 =?us-ascii?Q?nae8kiH52wIUOQ8i6qwqRgif0YqQ5JR5ouq0K5209lOnMiNOYsnHtbZAasWu?=
 =?us-ascii?Q?x+Scvh59Ne11Z480BEgx6zGNSr8JbHDaio0s95larj6IJsUb0HeoB2s9cNcs?=
 =?us-ascii?Q?R1aXvDMNijQ4xfJ0NwNcLy+z1mK2KgtQg2YBF3ehtD7JxNPihOmlv0X4m3n5?=
 =?us-ascii?Q?QW1gUNCiNdSlDftw7rG327XuB0rFWsvJswI+D6i2MxJI1agZUkfGhMyH3ICw?=
 =?us-ascii?Q?RebJCDRZpV3HxBbvuIOept3rJhXJsadSS6sPfGDN51shhsdS5tYvnlMdVbQB?=
 =?us-ascii?Q?aICKOVFDmSI9QwvWg5DDSxC/diS9KW8p3NVJSlqAIoHSu9dDc2/3v0uDhA1G?=
 =?us-ascii?Q?4f3I6aFbGvhghVaESlO+PbbabEVmqCing+XveZeojw3ih/gFF6OY0lp9E62T?=
 =?us-ascii?Q?oM9DLNTtNIy2F2AwsXaHXxnK+z3mhoSo96G8AJOt66+igHCuGZ5PjBU9B6nR?=
 =?us-ascii?Q?kJ33CkkqEt9G9yWbMmmvJNEoixWl7oQ2LHgyb+01Yj1NlNKSvRDOEVKcZAOH?=
 =?us-ascii?Q?aqxtSRCswGZ8XcHs5IcKgFw6/u+3ub/yC4uGPmjfxJyXYwRnWSokW80MAxGB?=
 =?us-ascii?Q?qPCmhSt/HqtlXbKln/N0Y0xnJwnUkeQMkJyBvYlyoIRAfn01BTcuLMMQVl9u?=
 =?us-ascii?Q?iHOGI7VXmeOVSK1I+KeC?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 eSPaC0+VnXixVmlBHYMCKYuKQfLtav0AF3tH29iGS+6bIf3H2b6c+lrqv1fOEUOohHhBAQz9/8tGXzvFKdk38zAsqgnSsKL3kO1Jlf1FgnobGp1xQUy0pBUxRyDt4pEvoIY9PN74rEzM+BRRmQW9WNfUHBo4MtuH6p3/f8stTWDPnS8YVCISn5T2zY+GgJ05PGMhFUY5x7+bxx6xSyGM0mcO4zX5ZtAjWOCP3Hlj52aAaMR4+KXndg8DCkHz+2+OJUY0O1fr+Ek4FnQDElJ1wfLKP4zHR/9sriX8NSVAtAURaWuQDCPA2XoHooQ4aIT5PDnFm8o44lmebkL2k4Ui6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR08MB10625
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.6.109];domain=CY3PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.6.109];domain=CY3PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e01c8739-929f-4b3c-ad7e-08de9f247380
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Ai4WwFQH6lPYcUg4zVGHO3S1+IF+/iKvCQ6Q+djCJcVpdLhg919AOssXKP0?=
 =?us-ascii?Q?ZJ07UT9hJyFB76erxXpRoSb4yQWv5rklLbIb7TdDhbfZ0yXA2dQjqch5md43?=
 =?us-ascii?Q?F3ZNXNBHx0gH9c9WKfLSBqINOmjqWzgOwb+kn5XKOpNVuHexHyxchqwcX2WS?=
 =?us-ascii?Q?9DZ5aYT+EB/9kFaJwYW6D5ueer/4IXQcBOEopYEr3dHWdPUZUzFQAdBVr8YW?=
 =?us-ascii?Q?3b7EctOBSbFTJ0EgoPN2rQ5XYhOPZ80ugKWp2RmG1dz3KgEPbVedeWGYVlTp?=
 =?us-ascii?Q?6Rw60NkooktAi2hrHWdxEQV/vFsIWvpogcnhL5q2lfzZ8at5HzSonSfNf2WK?=
 =?us-ascii?Q?G39GOQKkoxAPtWGpYySHQIYpjLfWdjNZPsr6jS3J/wJ9+GvWGrELcgmHES3O?=
 =?us-ascii?Q?VZei3pW4g736tgAJkqOyYZovayaKMtYDbcSSiYIWsXDW58UkrZMPl5YZ65KX?=
 =?us-ascii?Q?SorMNzAPB5tNBGoke2As9ayBKU8ZHDMLiurNI6eAx8pSlz+B8nZ2QuPyQjRA?=
 =?us-ascii?Q?HxETbmSGXFqy7fWuIEGKUWaRRvZPltF1x8DK5uAO18KMm7/2bEZHCwLWwvj0?=
 =?us-ascii?Q?qAMbc02oPUU4j5jhlQxKg32D0UtjlQ3saos3YoA5p2gKaU5fkP3lQ7wzPepb?=
 =?us-ascii?Q?yTWqKO6imQw//WO16DBLfzg9IIWWbwPxUosPYUUma+GwEhBiqyPSBHkXErTH?=
 =?us-ascii?Q?uYl4PBXt907yPmZpPTiLlqY63LSH6BqDk0HQWDKoyDbLpGyzykBibSNpe1HE?=
 =?us-ascii?Q?/W45D2NSgy2wXUL/Z+uZPc+NtJnVD627t1Zx9g/AJncf+fg/jHrKHFf9rf/P?=
 =?us-ascii?Q?xSCEWHMNexIS79Pv0s5e+Et2nKb9CjOkm5+8no19yMxb1lv2VkFOBgr9s1V6?=
 =?us-ascii?Q?yPcUnksw/f5bR9CkXIPJ2wxtU6uiqAVJjvBmSkAKNoNi2dGLFpuh20z5sOdk?=
 =?us-ascii?Q?B9t73Op0v68snEjF/nFTcl5BbBSESYl6o3xOllTrJNS9GonJ1gD1ghrq8ADp?=
 =?us-ascii?Q?H7sz5srlsAyXcsz5raGu1a1LeT/KEy+HtO22zLKRR7Wyzv1dr9t8c916rGtu?=
 =?us-ascii?Q?PqaQNaQ8LtgkdOi2RI055UjkCyope9z2sHe4OIOgWZXCi7RSP2xA6Q3UC4JD?=
 =?us-ascii?Q?2Fat0eHsNs4zP4IHCmxoOYIQUiCmIrYmiGQtwcnsS9YOdek4i3Qji9jtufjd?=
 =?us-ascii?Q?hsnhOuwSKW85/xPLCo17Y5/YCPoOvukuP/uTc1b16j+lvvsx1ILKBoQDcEPp?=
 =?us-ascii?Q?R+19JVISg8a6TQ8Q5NfN?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY3PR08CU001.outbound.protection.outlook.com;PTR:mail-cy3pr08cu00105.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IdYZ0TmxX4za9sM8oTfgqRjbVNBkIxSRvsp3gZgi7eF0OsZeC8ypinhgx0YvXfrOVXRWyADYhC49uCUcoPtT8CDnPD5pMwxObyrA+jOOg7+REVubAMFfrwBRTb6gIm2yEQAB4WQxZV8NafPGsFZrxziCZtfp63YhFATeljJOj2/aBl/qbEiiuOr7DPDGBjRnrPonbNuwz7zhhSt3uieLEudvMrdOoeUG7yQ748fKHWSSLRdClFtEUFJjUb/A99xxh1/xmpOwNsGWgJgdORJTD9xSqYUGSyzGzPLw1x4X5jMKLhG/8ydRJbi88VyyLchaWXH5HYWBS8UoQxwvL9U9HnxAEhbC1Cr6D8UF1KmvxS15tYo1H/nudX/H7DvlnhvyiFp0VSKanNvvn5lDA+wMIBpAvlhk9L3vIn8bOZvPOOReOqSCi7Ou7eFKRvIMKF6X
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:30.3868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d25fae6-395c-49bc-99bb-08de9f2477a1
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9147
X-purgate-ID: tlsNG-42698a/1776720816-05D6FF3B-8824C7D3/0/0
X-purgate-type: clean
X-purgate-size: 1033
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
	NEURAL_HAM(-0.00)[-0.333];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5DC5B4342CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds support for the HVMOP_altp2m_set_visibility command on
ARM. With altp2m_set_view_visibility being implemented, no further changes
beyond updating the #ifdef CONFIG_X86 gates are necessary.

This is commit 5/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/common/altp2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 7b80426c7798..c234bb3774f4 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -477,6 +477,7 @@ int do_altp2m_op(
         rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
         break;
     }
+#endif /* CONFIG_X86 */
 
     case HVMOP_altp2m_set_visibility:
     {
@@ -490,7 +491,6 @@ int do_altp2m_op(
             rc = altp2m_set_view_visibility(d, idx, a.u.set_visibility.visible);
         break;
     }
-#endif /* CONFIG_X86 */
 
     default:
 #ifdef CONFIG_X86
-- 
2.34.1



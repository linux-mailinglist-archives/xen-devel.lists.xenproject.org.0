Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNItJVWY5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11046433EDD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287445.1567878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1M-0006Ej-45; Mon, 20 Apr 2026 21:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287445.1567878; Mon, 20 Apr 2026 21:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1L-00067v-Tl; Mon, 20 Apr 2026 21:19:07 +0000
Received: by outflank-mailman (input) for mailman id 1287445;
 Mon, 20 Apr 2026 21:19:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw1K-0005wB-51
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:19:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw1I-009Po0-01
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:19:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69811-e002-0a2a0a5209dd-0a2a4501abc0-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:05 +0200
Received: from [52.101.48.87]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69846-c1f2-0a2a45010019-34653057acda-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:05 +0200
Received: from SN7PR18CA0022.namprd18.prod.outlook.com (2603:10b6:806:f3::21)
 by MWHPR08MB9872.namprd08.prod.outlook.com (2603:10b6:303:278::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:18:55 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::af) by SN7PR18CA0022.outlook.office365.com
 (2603:10b6:806:f3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:55 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:18:54 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzyz1731Zz1wdP; 
 Mon, 20 Apr 2026 14:18:53 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00106.outbound.protection.outlook.com [40.93.4.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:18:53 -0700 (PDT)
Received: from CH0P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::22)
 by CH3PR08MB9950.namprd08.prod.outlook.com (2603:10b6:610:220::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:18:45 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::50) by CH0P223CA0023.outlook.office365.com
 (2603:10b6:610:116::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:44 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:18:43 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:18:40 +0200
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
 b=ICT64mWF/qsbMm8d/GGTnORzDWmron4vVlfg2JP0CCcHZwp5Ij4Q6zb8LokHBWn4Yb4ExTx44y4MzEQzrWYbUGjUDXPsMwR8cqmt13EfXDevbuQWRY+PMa1/uuBrWwcGQvpKJetDlf5s2yqWleTcTv895KRE8k85rwzRpPTNjK9Pw87TEVCdGjBOkGLWrr4Mlo+EsVUp3Gp2TPiOEl0Zo4Vf8tQ4qh1yHhKhuNGjI7GwLvwpckfxxEhJJUAe4U8xhp6PHpyZYkTz3BdEPAmhZGt6oRp9Xe8dEdtXVowliWmvvzWT7gqG+H7rHaQojfngFHNhm0LqKrq6Fk+Ti5twXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZAemscrHmCDKhZ6RJ1poqZ5UjAED/22jekv/5eW7eQ=;
 b=a2s+9e6TERWhOV4u3Anf5P11AaOXVE0AtHcL3dqNBO208uNW1mD2TOS2BrtnUOh80mX6IKqynoyzYRpLeDf5THPL8xXz5GPgBe9ouoES+4VfzfRKgn38t6FbjhcairtYhydDlKGyD+az7DTniZp4atosFcyG0n1vMgcjM6/RaO6AqPumKQK6vYgD3lXQnPV5kC4gbXUVpHZiEWO5qpQ4nSEcVMQ56NSWTGkSAf4UvZPWW7ZGzuo8X7fa/nF1olXvGzH9bLVRC5ykGMImD7xgj+r5VcH/OgZqjp+krQYc5MnrhV6HjPh1aUls1bNIytZUYhR7fQOK4soYVJ4H3Wymug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.6) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZAemscrHmCDKhZ6RJ1poqZ5UjAED/22jekv/5eW7eQ=;
 b=nxaaY2nprOobJpQm5s4mRdNqkVV4NB+B2zZc3FBK37y1ANSV1NsTl3BQ/hhNNHTPw5/7MHI4sBOdC+8b2QO1WZaO8AMLobBBe0PrOZVIY+igxW/Xhq4lL0YzJ1XoLRgqglnlEb34ZkcRJpDUPvyh1OlSPjaB0Zi2GMvyu+Nu2Qg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.6)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.6 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.6; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ki2N0anapgwJV/qfTyH9ZRJQFNU07wDhsh74SGgty6J+xzfwz1WUVJNXoPCs+TuvJ8AqFr1pconipSPY3nn0SDmJAAEr65vXQQe67tZbVImfSU3XneivqYuHLxrHRS5U8sgAVo8FY8t3JANruat1qQAvXgtuGIU+kCUjMxYF3TT8JPnrV1K7CGcbj1Bzbq6WavWISkenf0gVzQST1OStJhzwpVYVy7wKVH23qHaWlYqGuH03x24bpvV/Oe3DRHFyO1HgVwpb8lxrBNTnOGOhitBxt9EmcC3FP2bhg0bM+51RvbvpNdfHq5XF2u93yJwY6RIX0HU2/IC+nb1qY3MOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZAemscrHmCDKhZ6RJ1poqZ5UjAED/22jekv/5eW7eQ=;
 b=W9UjfzkdZeL4SmZZq2eUO2dXQun/5a2XT8bc22bkE0d7a9eH8Jbj6ObKmBBXsc+CGNqIVhgf6At5Re63fJhr8Utjlbqf+g64qR+F9OdKF99EquBoNBVPGDC3i8KeOWW9LuZuNXhHy9ZS0vRmJQZYXMfx4z6e3EhvVSKbFvHzwpBMvteaan/4QrtOH1Vdxi7afX+9Wr06qjek8OWj8mKXgxomOA2zNiuEecZmAkIas4jWe5RPLYTmdViepAh4Arln97Mu+LAb+T98nDvjtFfuyXECLORs+7W1BltPEh+BxVfvTfx8ByPHS+OiS1trU+YodpqZJSZCc05i1CEDPxGWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZAemscrHmCDKhZ6RJ1poqZ5UjAED/22jekv/5eW7eQ=;
 b=nxaaY2nprOobJpQm5s4mRdNqkVV4NB+B2zZc3FBK37y1ANSV1NsTl3BQ/hhNNHTPw5/7MHI4sBOdC+8b2QO1WZaO8AMLobBBe0PrOZVIY+igxW/Xhq4lL0YzJ1XoLRgqglnlEb34ZkcRJpDUPvyh1OlSPjaB0Zi2GMvyu+Nu2Qg=
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
Date: Mon, 20 Apr 2026 17:18:27 -0400
Message-ID: <20260420211831.208600-1-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
References: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
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
	DS3PEPF0000C380:EE_|CH3PR08MB9950:EE_|SA2PEPF00003AE9:EE_|MWHPR08MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: d8466819-255c-4766-a98e-08de9f226da6
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?uEYXeZYhW9cwyyvzpDroGt5SLLSrTZbb99ZncCzrieF8hEELamBjQChhBwCK?=
 =?us-ascii?Q?LVhpc6MtPSW05h6yMHvAudW1DG1taoP0bsNSHl37nVX7Muxc2qH7A8xiTFkx?=
 =?us-ascii?Q?LF1Az898kluetY2lSL/CIhTUbc7qj1Fh7cT2zS7htrVOVCZUczGYFpLHff2t?=
 =?us-ascii?Q?Ewl0V+bpD6Bfg51ZABw+nOcsODiixk0onkzJgMAKFE+QotDXWRXn//TUCxhJ?=
 =?us-ascii?Q?JpmsmlK8YuhPLBVw5edGxb9MSFzszxApR9S8GTgc+E/2BI/6AijXbVUSa+Lo?=
 =?us-ascii?Q?tIwAKL8qtbQkztcV8rlHZpgqO/3uVzESLugDrY+hz3D6pZ2Hr6+5PC/jkrYo?=
 =?us-ascii?Q?/dqDRnuCW0X1ZE1Hz7k7ehr5jaGGcLt1DqtFo/BcFmaAupK8hlFD4m+rfIBv?=
 =?us-ascii?Q?018R0+CQJn9aUaPUw9rMCQrAZT+bVm9B0gha7RNn4aPTmYm7g2arlr5qJQzV?=
 =?us-ascii?Q?lnNTaNBFE3vmBeopdQAcCPOAk1sTDi4s6e6aVz9raMDqsxJdxJEfGT/L/rQD?=
 =?us-ascii?Q?lLfSkhdlNQ7iRmk3G8QZBhdpW217xiDkkFMQL4afWX+LyCwPZyRoLRDqTVsA?=
 =?us-ascii?Q?J3NuQwU9ClANNlNr4HwTQrc+A9nfSm/kPFUDoRSW7H/VJBaVq1IvRdhkw7CM?=
 =?us-ascii?Q?bHmaeUA2KM/gnnUIyCTUZpt/jfhrL1bgJ17DjCpw0CmPW8EAZenyeXUFkxcI?=
 =?us-ascii?Q?t00l9go5gZqdVs9SVN+A+Xli1czNHo6Sg7Xi0w8IQP30wT0MCFJNfRs75HSR?=
 =?us-ascii?Q?9W736gewW8XlpcAu5ra1Wz7zI9N/lym2ieoY+GD7HizQXqUvt/QX4KEL8qlw?=
 =?us-ascii?Q?resyADhGsZ4NpV5Eim7OB8w+YkZN9GYcnjpQR9Pbe7ym08K70tz2RHTAvHwX?=
 =?us-ascii?Q?bF7zxA+bC+p2T+QIy4rOu7YWvoYmQZsA3KX2bN8PLyTj6im81ItfP1wcbzhI?=
 =?us-ascii?Q?6b4FSIr3mVvZWmzpYBYD7um4AjlXATGjLJQKgySosNiNAQGL2ZiEWpmtoWIu?=
 =?us-ascii?Q?IgugkfOlkyUQo0V+XaspeGuRP4u5zN0eo2cixQm1ljv0zS2GoZSHkekqD0sP?=
 =?us-ascii?Q?QRh4e19hFRYyARwlY76d7lwTzWkrZjf2T3KDjGpR2O1wM86kdXqGFVq1yYKY?=
 =?us-ascii?Q?sKhpw2rUemIHvyNnyrHFnTQUNfSRbOAHbVCAg5who0OFrn+NYlLcV1v/kYmN?=
 =?us-ascii?Q?8D3VXaFqTk7CuEW3vfkfIOVZufIv7j5+15KzCrsPhdJv/rm9L4PesokX09XK?=
 =?us-ascii?Q?qQKlBY6sa+M8dj1PqKE0?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 BeEoIODdPFcvpBA0Scws1/ZXamUBKOjp5PiqOB4Le2odzsIsDt1TKzjnRlVeoG3a9X3UG9Zipw3S6a1qw2zUlmmCrc1oyHnixHGRE49QMfn9e25IiRY7q1xnRZcTrbi3+KjV6JZ+amN978TEt2Bja8utdTRxNHMKftY37s8iJ0i4XdAcDpRS88zE1s1Ykod3lHswa6teUYvctE4EDJMdvNRBmWA9t/nagmH0D7o1fw8AoA6k+zFTOUi8tybvCzUGHDgvQJvw4Xbsv2xShtiUolBu+QXjiARaZb/nEt3bsxbgRbDg77l901TqRLdWLQkXq12gm4t4oosFGGfcnS6NVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9950
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.6];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.6];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8df39f8f-60d0-47e5-b00f-08de9f2266f2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|14060799003|36860700016|35042699022|156008|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dlsVvWrIoOBwtQmpmKVEqCA1+1EgzbV79HZvlxhNUX0p19wxv+dl+uWn+drC?=
 =?us-ascii?Q?bOlbhbyBHfhmkoI7ebV0xxopkd4dNAkH6V5yNEFoSKBfNO7I/8fYM1qeOQd2?=
 =?us-ascii?Q?bdkQwAYnKwcr+0cvA8aDC+f6+6zacSR1Dcnfhoha5UHbD2zFXoDnC4WW5l+2?=
 =?us-ascii?Q?XulvpygDrLo4rUl9LzAwWrE6fgbO0Gnj2L7c2UVuaDTPoFEEIi7wdH7vJ0UV?=
 =?us-ascii?Q?yx/h07r4RyfI8d42ZDJb9bRAyV7Dajzb+n9qRtkGm94KO3VhPVY+cPsa0DFe?=
 =?us-ascii?Q?94FnBW8iwBafMSPlD1pgncEe9yc1Xg+JezQh4oIqiRS+RBEjfBqiimh79sQE?=
 =?us-ascii?Q?x1wyolCw2lb+JIB27ovOtDJuwOnWqaxLqmQB/9K87pmRJrVgpO6qcm8Hnuh4?=
 =?us-ascii?Q?5o1BzyNOSefkE2NFoqDvDPnnkZStBSXPUwnbrmhERfO7E5PK7y9S1tVEiiDc?=
 =?us-ascii?Q?zpQbgI8CQJiYRxorMlxVpFs4GGVMNzwNtjQ62LUIACGCSM1TQX47OBw3sZWF?=
 =?us-ascii?Q?19u+d1QBIAzIbxKB7FfYb85DkKvJh9MYn9cyxBimu3TWKUTrU/5xSsjalo7H?=
 =?us-ascii?Q?H6B1ynvqX4hsI6CL1fb0XJ4fAui7jlr9x2Yth8xBnOAw4oC/XRsT/x/NRG8a?=
 =?us-ascii?Q?Nxn/c0Kx0eJi1ILvBJp6ewctI2VWlDmg9jvRDYVLEULQaSaf7yWZ+cGLcmMN?=
 =?us-ascii?Q?b9ltvP9+DGVLgl1Bzk4lmlpSrd0gMvODP83QViv5ipS9GEwVR7TWf3AmcL1V?=
 =?us-ascii?Q?FzQCffuYwzVcyqjGnPytcoD3WIGjH5KtTWyaMUR77PPAoAT7J3QEwzznO3gw?=
 =?us-ascii?Q?H68w054WhFU6bxj5UGjYF4/I0A2qZc8xXt0JCBIFcPdwIpp6JhKBHWy4CgaV?=
 =?us-ascii?Q?NXkiN63fB1e6mrx4KUT4NniSnxuA1u+rQ/wMmoAQJZ0zies76JPD4GDSQylV?=
 =?us-ascii?Q?riIzytzRvPfOJQf96NyUlqFL3q6Fjd2JP4IsoLwfKuLOTtXK+5fai3CwWwvg?=
 =?us-ascii?Q?Zegbs74UGNNX7lAgvpEb0sY6XEetKmTfNLXy1xGmC2XRErixfTIZmVq1iHmq?=
 =?us-ascii?Q?MNljn4wT5iJowR/BSSSMV7ChfE6MkNj7Jlp8RyJucssHLo5JLldFLUmtimMO?=
 =?us-ascii?Q?c5MwyfQajX6ITWkMY7FJrJsNsstsxsvUogvnSAtnYpr8+bmnJsrctTiEzRFi?=
 =?us-ascii?Q?6Gakib57up0qXc/ngTGLGQG6nw92kWR35LOgEVWYpt9LEFhrLdpE4avW4I0J?=
 =?us-ascii?Q?Sfwsf/lYwKXuoXNu7z5U?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(36860700016)(35042699022)(156008)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eB1HgBlSeJ+cfUWwJjLt8M+D1Qw6n/Q2UfmM8/mExeOrns4se9jQzxgDKlxusHJ5ywwhrnecoyWf8/EigCliacY3j1PArB2+RQ8kWbtQ5iMvt03PfGsqcCXmwCpJFRKLOgrTKBq3WYrepL09ZSoES25Pm7BePFDOPi5GrEW7gzVJfsKLApOKg1mP9ZC5gYhFmnfAqmIx3QA+xBrtQlZN1iNMBgi9R3Drt4HkTHzSNVVF8gz/UIXkBUXODuaqK7Au4TARPpSoZdL9SmTTQAZ2vnIj/kYUnCMECTdob3qn4F6AjMeWpoVYuV+sI+2nfYhFIUl4OfUCV72HI+2RsRZvP0I9wOIcZyjipUP4GtX5WUIrnwEI2rdlsYhUUCFmG3DPebFTK0nvs96ZBGDqWBYPTYI3DSdDIfaMR7fvrXnkGuTooFEwl+LoXuapdi+zXZfq
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:18:54.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8466819-255c-4766-a98e-08de9f226da6
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB9872
X-purgate-ID: tlsNG-d62444/1776719945-B4A11FF4-2653A649/0/0
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
X-Rspamd-Queue-Id: 11046433EDD
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



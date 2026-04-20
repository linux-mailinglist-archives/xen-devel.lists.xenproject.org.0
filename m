Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNF1H1CY5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0C433EC1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287442.1567857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1H-0005jK-Tz; Mon, 20 Apr 2026 21:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287442.1567857; Mon, 20 Apr 2026 21:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1H-0005h1-Pp; Mon, 20 Apr 2026 21:19:03 +0000
Received: by outflank-mailman (input) for mailman id 1287442;
 Mon, 20 Apr 2026 21:19:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw1G-0005TH-GI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:19:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw1F-00CBeh-St
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:19:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69803-bab6-0a2a0a5309dd-0a2a4508b6f2-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:01 +0200
Received: from [52.101.52.100]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69844-63b5-0a2a45080019-346534641cb9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:01 +0200
Received: from BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34) by
 SA3PR08MB8825.namprd08.prod.outlook.com (2603:10b6:806:39f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:18:53 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::ca) by BYAPR01CA0057.outlook.office365.com
 (2603:10b6:a03:94::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:53 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:18:52 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzyz04Glbz1wdQ; 
 Mon, 20 Apr 2026 14:18:52 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00100.outbound.protection.outlook.com [40.93.4.0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:18:52 -0700 (PDT)
Received: from CH0P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::29)
 by BN0PR08MB7357.namprd08.prod.outlook.com (2603:10b6:408:166::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:18:47 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::e9) by CH0P223CA0012.outlook.office365.com
 (2603:10b6:610:116::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:46 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:18:46 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:18:43 +0200
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
 b=sCnVKkOMlpg8ZS48BFPTcqJmjGuvI1vfLZTQb7/8FwVKYE6ogLzHtredKfkFoR6ArpXrHN83AZkNiKBRzNX1XtDy1y4cTKgd/jU8lfAsIlui1Q+5GoHUQXAtu5eUUzp7wYNB24axIYsGfMXkQtnFHR51VVfbqVZXsehjXILUW5t72HZgGiErTwBaDp14ASw6Ju8uWP7yhU8BO7vrGXuqP27dT0dX3AIALyQ+61E1nt6SWJeJDTRbZ0YhU0D79zwyb48BMaulKNbo54quGQhCSrfTFWkMjBN5n2j0NU5vZ3KhgSaTRGVGbYii4XXNBhIVdKkwoMpEpm7F1+qTEBmPzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p9JopnflYJnPfdpu0O1EcjHiZAqSeSW4TS/vKusOYI=;
 b=PjvqX+61NuR5PWzS4OgkbYbXxn1hZ5JJMZXfJxRoq2Pl7Cj67AKvbTcBfHpJsRZS0ePwqvNgOV5JuhSWbjXOQFjxt3zfutyyoQUZ/1SkujgBsbV2K22WYPGBYGem5ELnnf2yZuGD1Qz2AzzHtw8y3S+A4o3H1P4aT4kuyAzW4jQQnWgU2WZXunw/yDLkTUf4z6BnNvOvd/vndnK6mPQC7RIFo/cGB3Do3fPnajKDFdq6tnTTrcNAOYTDgB1a3rh51JS7GhxCVt6bMxXdYva7Z6l3aMT7mzkTi7cYFMIv3XT67K696adTcdQrDeoxNUJdmkV16djx7QVYdmUMPYl9fQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.0) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9JopnflYJnPfdpu0O1EcjHiZAqSeSW4TS/vKusOYI=;
 b=zT56D/Ih35FlpXM5WpTynbVXVI/2dqU+5ZUUN1drb+rtIKV8IEGcfZUgSSzbUegShgESWEV/rxYVl7PzJCPrjYe1eWLcJTf3nHh1wgrO8YZF3SY4msIFxnmey/jvCvMNXzUMy0VjVDR1Fyt82tZf0i1kWx9woUn0ak2SR9A4Yjc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.0)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.0 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.0; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgm14QpOFHp0W8yp0SOeSgrAbr+MZLl8wZOQqcBVhRkBqJZUnM5sA37SBV4Re3AN6jPYCosB0LWqKJXJ7J9NL0G1EbEq9elcSkqc4FF7Lyi74tK05aOjhmUFS/GegvAA7E1qSpc61Vj8TSdfh8G3Sg3w6pt9DcgROzQoqoPV1ozvUWmo/c8gfggzHVjzc2TjQmR8ukYcxurQfapGcmyvdUkdYVk4VJF2OIlL+qth7TmgMBLdVjLZCrGJOg1n3C05Db/J5KwwFXagjOcsdUFYG3KIvnQShESWiVzSMeZtjmT02mwfoH/pIy6gv80Kj/pC1i4UNkCYS4ibD5aK67ZHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p9JopnflYJnPfdpu0O1EcjHiZAqSeSW4TS/vKusOYI=;
 b=BmqSSf1wPJkupXUHRFcRCBQfxm74HF8Lvv2yscmIHI/yQKkmelFBym42wMrfzBD659jqvlzKLhl0TkXL4L7i+5PIKODEt9lII26G8HTF6ya1td6muXux4JtvY7Vq4uha/+/TWTLUxFpKiX/QZoZhkO84uZizY+z2/ti0vEXCdHori6aKc1TOJVD7NQuJzfX9oXMV1vAAiRtPaq4Hk9FybNQJepnUrrsda7wYemLXeqc8WbG+YrUonYDaiGtrLAXApNz3kK46NmwhMj6qUfkUyayvMmw7uE8XZ4BfhFfwInPgq34ATa7huJMZEf6Oa8BLFuBOcayEKfQ92ECPryyS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9JopnflYJnPfdpu0O1EcjHiZAqSeSW4TS/vKusOYI=;
 b=zT56D/Ih35FlpXM5WpTynbVXVI/2dqU+5ZUUN1drb+rtIKV8IEGcfZUgSSzbUegShgESWEV/rxYVl7PzJCPrjYe1eWLcJTf3nHh1wgrO8YZF3SY4msIFxnmey/jvCvMNXzUMy0VjVDR1Fyt82tZf0i1kWx9woUn0ak2SR9A4Yjc=
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
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH v6 05/43] altp2m: Move altp2m_supported to arch header
Date: Mon, 20 Apr 2026 17:18:29 -0400
Message-ID: <20260420211831.208600-3-Rose.Spangler@elektrobit.com>
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
	DS3PEPF0000C380:EE_|BN0PR08MB7357:EE_|CO1PEPF00012E80:EE_|SA3PR08MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 442ca524-3800-4b04-188f-08de9f226c69
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704160111799003|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?95roG6s6BBrsXa6BxovuPboPBoAD3i7d+enVIzccSfylntts06JITGjXrtZJ?=
 =?us-ascii?Q?Yp5SzJCnkF2FCdNqha1BA96F/dV7XezKZ1CZq9ypiYt4r8z9rp603QkUQHyj?=
 =?us-ascii?Q?x2W3iLg3+Guh2iceKVvmguakLzqK84SnB6YpdMolGlfXaK7T5TNI42ndG0fi?=
 =?us-ascii?Q?gc4VP9y2uUzQl0t7fNx8fn/G/isirB8qfbetKDtf2wjXOau/GLzT5YGlm9ur?=
 =?us-ascii?Q?JwsrkgAJfpy/M7QzwOsIa4xfJdWfKwMWlp1+LpL4KdbAC9QukLOP55ZRDy8v?=
 =?us-ascii?Q?rWgbmowpmMfMeoszJk4ccc2mF5ZicYPolTOUV2dXUdNsXbMIkk+P+GowQaCQ?=
 =?us-ascii?Q?0h7FiY+5gk3ySOp0MH0J1T0W8TVx08VH87OH+0a6WOx+8mN2scDuBdtEtawC?=
 =?us-ascii?Q?9fx3pB9LcvLjr+LQ2NT9CFRYYI+SZDGw1MNaJEoiISQpH0BpKiUYbXJZ+SGZ?=
 =?us-ascii?Q?HNn6VrcLsuOJWW6ZpeMyHooGrmfEHbqF2HNM3JgTxNZXi0V5uUDmZDmJWEgU?=
 =?us-ascii?Q?S47tmOxL99AMC7QojXqyyi+sv9M1o9O0MEFQQ449WDXG+ePMlK1mNDJiwWw6?=
 =?us-ascii?Q?vzQzwzTOqzFARmnJGKj/Mm1GlFHg7wgZLxqc77VRAiaGuu/j+MNSvqYMi8bK?=
 =?us-ascii?Q?vgl8iAEgVY1+yFgEnc6F3xu7+0Kt2REjPnEDlKaWNl20SWXR+oGLWOBcmWG4?=
 =?us-ascii?Q?yKe9lEpI/36nGa8rDvgDkWeTwuTOHzSaVKvFJH8xQHFBbvV303rpBcP68Utx?=
 =?us-ascii?Q?mv6xb9fEsuY9mL+sZ/xC99aRadm8oPgUn8m3ED3fyRk2HqB3VgZ7AA2HONrm?=
 =?us-ascii?Q?P1PWDr4dHLbmRuQsn8faktoOeWlwL3vlQITkC0sq0uum7/Mdw+Xv6ItzE3R2?=
 =?us-ascii?Q?V5RNRKSux3cezbBKt8sZdRE/umf9bc8nJF5W6EGEzoW4Hg7Hrg3RPGnP6h0+?=
 =?us-ascii?Q?EAR9aMmaIP3kPeJhLgRZyEGkGBvNumZA2VmAimoMGKb4U8AOwN3sXm3gJO2n?=
 =?us-ascii?Q?2a/CkS1zZ5zbGt4Pda3P+xrAam11k7ywhp73VIAwoM7CnfSzSghzujj1nFZx?=
 =?us-ascii?Q?M4qjq411crgAYtJSG1HCtTQgSMsOkBWyHZ2eWe74OVfr64WI/cl/+bsEOL7o?=
 =?us-ascii?Q?oAI7rTXV7m2j/tW06Ldd/Rj4TKLFcsgCxUOCgH9TUV1CWitXYEClDy8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704160111799003)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 X+FIY9Ipl6SaJLAJy6R26f8QFMUQp3YzSUcK7tfPn1TSQUtd5JL/Iw6bBAn8jKmyGPmWDq+o7Cc0HMypqGjbzY2TnHcBIaWzsKm3KgssGZ+my9km5iccOu3CoJfQsuJiIQla7n5VA1LlfeBM2xvNdhfqm+RyARyuFqC8ip2oDeoguz7xvjURMm1amrESb2+lrQVAMZuG9CYwooDYEXTnF57PbaXrwwz9FP+i6gThAMlSxz7I7GWgp9ucRAxiYjbXyAQgN9dL/O52mZdWFF6be3PYBJJdb9NU0hQWrC+Hfp18sxxKh1W/8lAiHdj2I0mf+9IdDdQQFU6pi/EneCQ97Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7357
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.0];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.0];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee8c9645-1991-463b-4267-08de9f2268cd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704160111799003|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IvJH0AXODL7AsP/0fMon5jPMRlX2G6HZECfwd2A6mE8ZArlwRTwvHM7F2v0j?=
 =?us-ascii?Q?VMKC/hCcCNxM5niPv+saQJCq930YVzEh7kzkE/hwsPT9VcwxfjesClb8HoLS?=
 =?us-ascii?Q?4iBph+y7MKWOX7UqRQzjokqgy7Q6tdkBr4DT5tRajq+TFCFDYMMmFFaNrMww?=
 =?us-ascii?Q?dd4OurmL4ro2g+YWw60Sugn8yUC1Vbdrus9pRXlzQ3x99uE4rvs+T3HfxG2l?=
 =?us-ascii?Q?eTcEkN7gqh2l6Oz4swGjCyMaALLUAcE5Yac3GHNk9fJaEJmXR7Lb7AvocB13?=
 =?us-ascii?Q?Co0a0svxjUrS+9pkvSKikvVI+dyd2y5m6pQ97c2Gx92EVJ01kuzGhhNOvskk?=
 =?us-ascii?Q?Gqb2dPGipMrE4Bvt/FQVuFdLX7APB9KmqxmqHbWz623jmdcF2sAax/ScylVx?=
 =?us-ascii?Q?Qw3f3MqMTomJmzoCCiLy1M147WMGjAO9sBMoc/BZKzBfUeU1J6U17Ws7WTbz?=
 =?us-ascii?Q?tAsIVxmcnRM7Ge7wO/tOEGlxYGBYRNoDB65luzjzPVtHuqfDM+4NMBy9aNwY?=
 =?us-ascii?Q?4BbEdc4nb7E4gKMTL4ALgnv1qwDEtF7r85YmQarnDLhJG1zRkTbBNSh/bOKT?=
 =?us-ascii?Q?T4lwghlvKkwumQGyv60NWbD3iZgkFUrz6Z8jJhf7Fp3qyIYGy7mjZQb1+oka?=
 =?us-ascii?Q?mNd/a2m+X7sIcCnLW3AyPHIsiaRdpbtHsi+3h0ZjLGSW8H8Xn9whbFL8IHnn?=
 =?us-ascii?Q?4IQ7o8bd32m0N21hHW1jaUoUykaT1izozCXJNmULIi7YvJJv1cy6tW2VD+pT?=
 =?us-ascii?Q?6jzANdTH1bdvqr3+WPr370LjiCDd91JL8YRN1vB1oTH0Gium1hOBHBzV+GaM?=
 =?us-ascii?Q?7a6hCSHsH/AhXNbgVs3qJuAlSPL9BknewarBjGxqMSSXdtJHaOdtqWZAsbEu?=
 =?us-ascii?Q?OUOFj43Q7aOzNURc75MihE7jb17ThLbblinxZr0HdpO+uIucTx31bGWnTFPm?=
 =?us-ascii?Q?HSUbbz/+T3HjqMaPe6XP8GD49Cq/St2GTXsmajuHHpl1c+LsetR8Zc/D4lsf?=
 =?us-ascii?Q?MzXrFlUYPFNPrxqbzLHj9x+ePo6f+NT/aj8+A9asIh9Jy4gB8CTRPxdM59CX?=
 =?us-ascii?Q?UIitr9TJPog7eG3hhu6fVaw7vzJDirUHEeGSFYkMZkAQPLkhtQm6+DIDGE6N?=
 =?us-ascii?Q?5jaG18j0pCit9fn9R6XX5G5tAVuqmsBM+ydfSr2tAg9Vhpdze7pA+M4=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00100.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704160111799003)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+Dqh+sMHtGgaEMBqj7lVNkdSHBjFYsS5eFVcyE7geqTSGXDmrXyBzsWAK+6ekM/iOoGNf6+Y4ncB/KdJ/1dVlT4yRevOKzoxOjXi+ZteiDIHHkmFVA79A1k8P7XHw3KNiuFgiPCj0Nj7WDmCtBSjSHefd9ZnrGOXfDQ8y1XLEA3b/k9Poes7BQC4CRENceJ9bB9OFHNj68NrcOGLCWZEqOtBtoqmRMl044nknpjNTiW3yK/ohRib1KIhRGXXpIx9JpOUXS2h6eG2I7NXJM1kKBVLSFFOvh5MPqA4EJLB+sH/m1LwlupTAHiYMx5EGwOudPFFr04pbgykxbZAtmU5CwG0wsB58z0ypWy/0RQwPAFbJkra96hro6WQ+bKmYqsJp3fzLcPqiociOfKu/1sNjFVfEe9GRDu4Q/r/HxTd1GWngxh3z1LzsO/Cm8Q1iitG
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:18:52.8546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 442ca524-3800-4b04-188f-08de9f226c69
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR08MB8825
X-purgate-ID: tlsNG-c1860d/1776719941-3BB7CDB1-C6AAF97A/0/0
X-purgate-type: clean
X-purgate-size: 3203
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.344];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: BEE0C433EC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Following from the previous commit, this commit makes altp2m_supported
available through the asm/altp2m.h header.

This is commit 5/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/domain.c              |  1 +
 xen/arch/x86/include/asm/altp2m.h  | 11 +++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 11 -----------
 xen/include/asm-generic/altp2m.h   |  7 +++++++
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 512b18d4010f..e4f1cbf3b51e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -39,6 +39,7 @@
 #include <xen/softirq.h>
 #include <xen/wait.h>
 
+#include <asm/altp2m.h>
 #include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/cpuidle.h>
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index ad5ded833a75..07e760f60659 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -28,6 +28,12 @@ static inline bool altp2m_is_eptp_valid(const struct domain *d,
         mfn_x(INVALID_MFN);
 }
 
+/* returns true if hardware supports alternate p2m's */
+static inline bool altp2m_supported(void)
+{
+    return hvm_funcs.caps.altp2m;
+}
+
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
     return vcpu_altp2m(v).p2midx;
@@ -58,6 +64,11 @@ static inline bool altp2m_is_eptp_valid(const struct domain *d,
     return false;
 }
 
+static inline bool altp2m_supported(void)
+{
+    return false;
+}
+
 /* Only declaration is needed. DCE will optimise it out when linking. */
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 6406bb687718..e6d8042831dc 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -701,12 +701,6 @@ static inline bool hvm_hap_supported(void)
     return hvm_funcs.caps.hap;
 }
 
-/* returns true if hardware supports alternate p2m's */
-static inline bool altp2m_supported(void)
-{
-    return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
-}
-
 /* Returns true if we have the minimum hardware requirements for nested virt */
 static inline bool hvm_nested_virt_supported(void)
 {
@@ -876,11 +870,6 @@ static inline bool hvm_hap_supported(void)
     return false;
 }
 
-static inline bool altp2m_supported(void)
-{
-    return false;
-}
-
 static inline bool hvm_nested_virt_supported(void)
 {
     return false;
diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
index ecee6942f4e8..a3cdbdae9953 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -6,6 +6,13 @@
 
 struct vcpu;
 
+/* returns true if hardware supports alternate p2m's */
+static inline bool altp2m_supported(void)
+{
+    /* Not implemented on GENERIC. */
+    return false;
+}
+
 /* Alternate p2m VCPU */
 static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
 {
-- 
2.34.1



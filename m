Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEV9D1OY5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6A433EC8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287441.1567848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1G-0005Um-M0; Mon, 20 Apr 2026 21:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287441.1567848; Mon, 20 Apr 2026 21:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1G-0005TI-Ih; Mon, 20 Apr 2026 21:19:02 +0000
Received: by outflank-mailman (input) for mailman id 1287441;
 Mon, 20 Apr 2026 21:19:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw1F-0005TB-QY
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:19:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw1F-009ir9-76
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:19:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e6983c-2eae-0a2a0a5409dd-0a2a4506a764-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:01 +0200
Received: from [52.101.201.142]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69843-7371-0a2a45060019-3465c98e35ba-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:00 +0200
Received: from MW4PR04CA0115.namprd04.prod.outlook.com (2603:10b6:303:83::30)
 by CH3PR08MB9878.namprd08.prod.outlook.com (2603:10b6:610:21d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:18:52 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::8) by MW4PR04CA0115.outlook.office365.com
 (2603:10b6:303:83::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:52 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:18:52 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzyyz6xZLz1wdP; 
 Mon, 20 Apr 2026 14:18:51 -0700 (PDT)
Received: from DM2PR0701CU001.outbound.protection.outlook.com
 (mail-dm2pr0701cu00105.outbound.protection.outlook.com [40.93.13.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:18:51 -0700 (PDT)
Received: from CH0P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::22)
 by CH1PR08MB10763.namprd08.prod.outlook.com (2603:10b6:610:2b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:18:46 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::b4) by CH0P223CA0023.outlook.office365.com
 (2603:10b6:610:116::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:46 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:18:45 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:18:42 +0200
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
 b=csBjKEiHYBo257UQ2Hp2tbVuO196RUQhiK9Rp1vz0sfzNEa/NDf0WqjQuzf/mK00ZLY1e+RQNoyMKilm/rwRE9LlOhmuUvvJoHXWvek50nf8yveU6ZZScmfcr9NmtcruH83T9X5A0aCFlm0XE+i8zOfNymZTNIdTQZ9+JdxowsUoPBQndH5M4eCCeX/yQGqryNnq0Y412WNmHLcJGT95oQiSaB1AOmptIHcX7UK6lCVJtQxV4O+ru+q5quN71YXfecuGsenFYvgBWc0C3GlxGsKN+G7b+8P+CGA/E9XC6vucMm8ybyCLnTPFtCpavQFJOEZia6au/7AgWBSj1oRJjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCpfUimCCQkOtqeuUzULZSjqPkZv/1OumHTvfODlnj8=;
 b=yV7veiXiJk+2BSsy7FuyH09r3nkpwiZUVZE5iDpehrkJ5OLK+ifjl1wB5m4y3ny1qQc6U14cWmceZdffDw3iPEg6G67mgvlv1ShmEsP4U+6qJzvZeHAtLnEumgmqT2vU/RStPuS+2wCTyOkc6UThOAIQMphgYGGLSKLXbFDej08ogNnPrN72kmuDpCM6QcyV07t8y7RxjoTytbpZ/Vl5WhJgKYsjR6sa6yH1Puc2pr9uVJ55XkBVgC5EyMeE7/1T5K+AeC9vsED5tNFnPxVo1sFEySsoLdxs/rGLmTuraIAueeKfhQQRfnYg7kcNw3/ZFeYGsGM3yiqvfzz3S2J/TQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.69) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCpfUimCCQkOtqeuUzULZSjqPkZv/1OumHTvfODlnj8=;
 b=grtP+joM00orfX0T1IofgbQqxanheNi94Y5fqhxaWWI8jfo4jfIym5M5+97pMyEoWMxU+zOnOrioLZ9uvNWUSRLznie0VAvt7fL+DgZdn/LbxEgV+PICIyLOQGNNUZutbpTySRimDdRw0UO/PMrY/k5GKokWeVB9ThWAQcS1nqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.69)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.69 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.69; helo=DM2PR0701CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voUyNLs34usTXE4LwAsNG9JvlY6roeZMi1LDdYbe+lPmIoZTpcWa5V6qzAM30P+2SNhiDkmLm57i+bVFgQgYTkseQv97ciCC+A8ptNO4lbziwtc3cfYjarFFUWGQZJTQzoUqZoipFnnayV2QY3RlJVu7UOqw9l0sxX5ahfC3Qu0/kt2XjgNwaVXAAxOxlzACrhk/fOgJVNGfwytUGr9vuUqqD8WUOldWY/2uT5jo1yez/2hwvwwc/2hxEXZSNatm3Do2AoyL5CYLtwO9iOEOcqLwqa79Gcw5EkfppdRkx9X3Ng3waSHRXqatAJD3qm6e9xl6LqhTgFolcWNYpAcz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCpfUimCCQkOtqeuUzULZSjqPkZv/1OumHTvfODlnj8=;
 b=u4DwST9OXo/iIY83P18O0lIvA5qoaA5HGliE+hEGnZOyirZXjIAED98znHCmRjkqM0X1IxOS80zQ7X3e730bP99Ikg7/27ufxnkSKO1/DSZaJLXUau8rt9AZ+7SLnB8J8Z54VG7J1r/cMWjH9XcYT8Rxmz4g6OH9mANY+U2vsPT4RmIi85wXzR4N8nX77EENjMUH9y6c9q1IC4qhew4SVmzBY1l94w/OwfRY1sbkxQack3LjQF3dX5HxQwNzOwJ2cv2c9K0ppV1BFD4HaQetIdJ47xv83Yoykr84oOO8JF7IKU8WLcyApANJLP/rT1lFUgZ/iVAUjctLzMvcx4dprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCpfUimCCQkOtqeuUzULZSjqPkZv/1OumHTvfODlnj8=;
 b=grtP+joM00orfX0T1IofgbQqxanheNi94Y5fqhxaWWI8jfo4jfIym5M5+97pMyEoWMxU+zOnOrioLZ9uvNWUSRLznie0VAvt7fL+DgZdn/LbxEgV+PICIyLOQGNNUZutbpTySRimDdRw0UO/PMrY/k5GKokWeVB9ThWAQcS1nqU=
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
Subject: [RFC PATCH v6 04/43] x86/altp2m: Rename hvm_altp2m_supported to altp2m_supported
Date: Mon, 20 Apr 2026 17:18:28 -0400
Message-ID: <20260420211831.208600-2-Rose.Spangler@elektrobit.com>
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
	DS3PEPF0000C380:EE_|CH1PR08MB10763:EE_|CO1PEPF00012E81:EE_|CH3PR08MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba856e8-d1da-4592-b052-08de9f226c0e
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161311799003|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?s6MdfaPKvkwCasjR9raeFlrfes7mwErCK090DmhXnQRT0IaUDVRbJL3apO69?=
 =?us-ascii?Q?OE+zO1MviYLRDo8ZXYglrXtvDRlQ4N+gXPGswbmXA28GkRt8hEXAwdtyV/Pw?=
 =?us-ascii?Q?ZlrTUpN/Crly48PoUz10UvBwn3kRaql8/A5w+Zq7mOdVFtb01qVDSdqSMNou?=
 =?us-ascii?Q?T0XSJEWh1XFCtRhFn10zbSMronxgdkB+n8I2HNettNObKSnk9ZcrF+Be/Cwb?=
 =?us-ascii?Q?XBwQArr7dwdmQ5XFY9Xk46zGJE1wbrtUka2/HMg4hRldN8jviLURgqbdSJvj?=
 =?us-ascii?Q?b6AF4/HGoFnfp421pPmwiFy5p3eHoxNHA2KBcxD99OxZcgLUCer5RhqcK0fG?=
 =?us-ascii?Q?IB+QQQ3lNRp0fFTA6E0OJsuedkb+YwZxYiqJWOieDfz/CCe477fBNBv8jU7G?=
 =?us-ascii?Q?pgjbiML+ZdoSitfy1x3pz1lmG+2MJlKAClpE8B3hSirN+coNUi4X8++HVYxU?=
 =?us-ascii?Q?ieOvKPW2RT4oTbR3LIlXCNm9FKFjYVD71FPZ/DXsPJiJ+hKZzwbgJ6Tk8aCZ?=
 =?us-ascii?Q?qjNHHBFfHZO2XZk/Gu3oa75reDkVKgnmIKEnucnvs7aJB48q038ODophkseT?=
 =?us-ascii?Q?ZtmSjVVPv7f6+K+LAa6DO/IaCfMjqOhbQhj9xgofvABcm1JPGyVCypInzkqd?=
 =?us-ascii?Q?BJvp2YTslnLNZ7ZjJEcQfi40IkTsaV8a9dEBw2Dn8Rdox3OzCUgMzpFPHWhO?=
 =?us-ascii?Q?v/FyGl9C4kjWwD4/4ZjbhSw4wzphODTgHAE1N71pjK7BY7n6r0Am0o5JvW1t?=
 =?us-ascii?Q?VuH5F72fpuE26rWDq4qBwniL+gtI7fhjpl4vs047JoFEAYTjXF0o0ZFD1Qhc?=
 =?us-ascii?Q?WCidjORlDbynetTFdcFMx/IwBOZVZg4tm2vGyaEYBq5B2zUIBFxAj024nCsA?=
 =?us-ascii?Q?9EU89iNnms16e4OE3gPyjC92QqjEklJMNoCAqN5U20QylPiPjX+ySnELV3MA?=
 =?us-ascii?Q?NbcLv9FiCvzxYg++6GkpmglDu2dcw7VfJMbrpmm79skNJn+BaeaxFtC+u1Dy?=
 =?us-ascii?Q?9+Z6MxrfpgUmn52XQO3pNHfKSEt+320LtcdClkDXvmb4fQ9uMNNmral5mhOh?=
 =?us-ascii?Q?nI+PAnsY9gZ8dL/B5Pky/kjIrT+tSMHx6POA7I/St4GiTAXqILkYNFD10vHf?=
 =?us-ascii?Q?mfKtgtevWlekG0tCIBgso5D53q7fh+Rg5bCJZnQRXlsFH6jSwNlsGSoNCmiX?=
 =?us-ascii?Q?d4x+9bAs5nGvBpn20GsYahv1TvylnsO+5Z5YGcuIIQSQgnq95GH07+LUqY8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161311799003)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 n9Zu4CfJEbnMLG+Q5OX4f4K4e2x8gd8DzXVHP+kF5v+YtonObBQUcK1EdiKAHvuj0YqXH3zTqxdo4q8gWUAiddjH7yL+XuTBUk2nCM9MY6EbuK8lRsTKSzqV4CMG+s/jJtby1bfsrcNE7mAiViMiNdjkTywiIGgLudIDr6/AiyfoqwlEr7vr7cjBhrwwg0Bg61oxVxssP+A/Brl1Sp5dYDjzrkow3GPRbThDx2qz33LRoGDo37dGn4XDYO0rfvhChkSFfcarDVFcJXdpQfINdcIYQsCuNr37T0tkoo9Nh69i7tXf1Pk0uhJUJfUzbWdKQSA+ExkfUSKTTcTiWNKgaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR08MB10763
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.69];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.69];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ae124ef-aaf1-4bdb-8486-08de9f22682c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161311799003|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d3og/NRxQX/4OPA73y/i2eDYOx4TVTfvGSO/dnJGfGn0auIuYUVyZRPJVbEe?=
 =?us-ascii?Q?3MIypTO1JWCkp9+lUCXW4BLC5uZf6JjdHUBLIkIPfThLn9CzDgU675KgkX7W?=
 =?us-ascii?Q?ooj/VkyivnTKhkrClCKLkoZ9R9FScj2X88UOyLpJxRH6IlicKohepS96jxOl?=
 =?us-ascii?Q?KidBbSRDIik0DMIxL4PBI6o+6DNdAkORtQIi92zvz5o47VVMH32vUqqbD1JP?=
 =?us-ascii?Q?+lQ41NeLz0oYV5di22hCjhbaWIpAv8cpHBjdefz0xzHqcyksiEsDXPAwT9y+?=
 =?us-ascii?Q?8bBdY17slunjhPQ729q47TPOsMAWuW3BKbY4oIRAaRgFie6RooXTNKJpfy1f?=
 =?us-ascii?Q?SVT52KjmHGVKXpcHo0+yDzeO86zktLwlRVluKt5wD8eXsDnTIr0D7Vveileg?=
 =?us-ascii?Q?QOO9YFEZGp+k+Z1k/w+JbCyKqpNPCLYKhbSckYnszFf143V2L9WFafdESFGR?=
 =?us-ascii?Q?QltT685CiVbbYSVcA1wDGO3/S20vAGKSAPnD9lxM+sKhzSTUR7kZKt9Z0CIk?=
 =?us-ascii?Q?ZxzwkrEUJao8K/a0deMzPZj0DdypUvBDjg2Vlez4F/G3A6vvNpSWsPEQUjN3?=
 =?us-ascii?Q?dRy4qW0FQBzLEl/s92mOkxAwtb8pYA6+7doWtje9bFqCYorNXsfEEUa3zKl+?=
 =?us-ascii?Q?U/3y0QctSWvWQB1fqFKTfnytfSNHItcE0+x5Q1vCdYz8JB9duuRqw//zm1pa?=
 =?us-ascii?Q?/H3UDT1K78tehw/8GVFX17bkQ9cwEQoEssI1pVo9XShv/aTW8PQlRc8MTT6z?=
 =?us-ascii?Q?+/zRE5FVrZDUTmBBcZf8qE3Zxw10ob/d+iyRwvvfRd0XYbwWNiocTFOLD4D0?=
 =?us-ascii?Q?w1IX0AOvPe3+unWXOT0wt8dwk7wxDIv9lCs9z/v/dziIXvY1UGSuN5BF1omN?=
 =?us-ascii?Q?JOFwE0V53wRqZBOX2di04Frov7v1lqtDOsEmn53xSumm0Cwg4pL5CpbgQeoU?=
 =?us-ascii?Q?Lc+XUN0oQro687UI9PEOuitZKTlXp7ZlWpK3cOYdLyK1QpPUrlees1wSFhqn?=
 =?us-ascii?Q?7giqEDjaOimx/u/0xbqNKSCewGdp0ixeDvbr7ZYLaNxYtDzSR0LzDMxuOgoR?=
 =?us-ascii?Q?H49rsXII84VquB6xUUotJ98p3w16SfOSqDpVfqsUOoa5yP2XQRi1VVxJwUyz?=
 =?us-ascii?Q?vz0xkQDJxH8XcaM92e9sgBF1GhaFLNrb6+sZOhbVtjE2RnaHRdsJUs0MIWtl?=
 =?us-ascii?Q?c2BuTK1d/mFSfiFWg1eGqGrGfcPI5n6oZYrKC45PfmncOYXD/5YP20u1iXM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR0701CU001.outbound.protection.outlook.com;PTR:mail-dm2pr0701cu00105.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161311799003)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QBmdIm/HzIGUi4onSOmPAL6wX3mJekWd0RnJiXuq668zghe1xCAiBBOQRs3GDdUFkThYKod8Wa+yJCU/v0gZjq32rRz/yMgQxQOmOQYzPu9es0/FD1jJH58tme1JPc3+bW+Px2UfRRYTEhcMNMBTcWkmbfErBKTOJBiO9KvJItage3Rip/v+kDc1d2w1WDAadgrA8o95XE8lHtatriVf8oZh+x3PU5BajUA2wPMyygCbB0iJS3nuVj5uJ/UvDP69fBqBPMO7vpKQOqwYpQlyIsalWijF4val/VpjTZ9yCpVHAVYv3V44Zz4yRaUaorqRWXHjQxpdh98EFWneyjvcm2ClU1LXCeGHCIMcMU0OVckVSF5jLKimzmjUSuNKsd3/atKMqOgSnT6LgEflyaN3/PSkFAJCGjcfAJTbeOsztAFrizj5mfCAkKXYlRgWSXE+
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:18:52.2881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba856e8-d1da-4592-b052-08de9f226c0e
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9878
X-purgate-ID: tlsNG-16d1c6/1776719941-91B86D75-3C8C0DFC/0/0
X-purgate-type: clean
X-purgate-size: 5417
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
	NEURAL_HAM(-0.00)[-0.235];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CCD6A433EC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using a generic name for altp2m_supported makes it possible to indicate
whether altp2m is supported on other architectures as well. Even if other
architectures always support altp2m at a hardware level (like ARM), altp2m
might not be supported due to CONFIG_ALTP2M being disabled. Therefore, the
altp2m_supported function can be implemented on all architectures to
indicate if the hardware supports altp2m *and* if CONFIG_ALTP2M is enabled.

This is commit 4/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/domain.c              | 2 +-
 xen/arch/x86/hvm/hvm.c             | 6 +++---
 xen/arch/x86/include/asm/hvm/hvm.h | 4 ++--
 xen/arch/x86/mm/hap/hap.c          | 6 +++---
 xen/arch/x86/mm/p2m-basic.c        | 4 ++--
 xen/arch/x86/mm/p2m-ept.c          | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1d458f1372e5..512b18d4010f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -698,7 +698,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
     if ( altp2m_mode )
     {
-        if ( !hvm_altp2m_supported() )
+        if ( !altp2m_supported() )
         {
             dprintk(XENLOG_INFO, "altp2m is not supported\n");
             return -EINVAL;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 86c12c0d1ef4..bc35efdf2c02 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1692,7 +1692,7 @@ void hvm_vcpu_destroy(struct vcpu *v)
 
     ioreq_server_remove_vcpu_all(v->domain, v);
 
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
         altp2m_vcpu_destroy(v);
 
     nestedhvm_vcpu_destroy(v);
@@ -4566,7 +4566,7 @@ static int do_altp2m_op(
     int rc = 0;
     uint64_t mode;
 
-    if ( !hvm_altp2m_supported() )
+    if ( !altp2m_supported() )
         return -EOPNOTSUPP;
 
     if ( copy_from_guest(&a, arg, 1) )
@@ -4965,7 +4965,7 @@ static int compat_altp2m_op(
         struct xen_hvm_altp2m_op *altp2m_op;
     } nat;
 
-    if ( !hvm_altp2m_supported() )
+    if ( !altp2m_supported() )
         return -EOPNOTSUPP;
 
     if ( copy_from_guest(&a, arg, 1) )
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index e7c1364802f8..6406bb687718 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -702,7 +702,7 @@ static inline bool hvm_hap_supported(void)
 }
 
 /* returns true if hardware supports alternate p2m's */
-static inline bool hvm_altp2m_supported(void)
+static inline bool altp2m_supported(void)
 {
     return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
 }
@@ -876,7 +876,7 @@ static inline bool hvm_hap_supported(void)
     return false;
 }
 
-static inline bool hvm_altp2m_supported(void)
+static inline bool altp2m_supported(void)
 {
     return false;
 }
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 6918a00a2a25..563eba3c0d36 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -501,7 +501,7 @@ int hap_enable(struct domain *d, u32 mode)
     }
 
 #ifdef CONFIG_ALTP2M
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
     {
         /* Init alternate p2m data */
         if ( (d->arch.altp2m_eptp = alloc_xenheap_page()) == NULL )
@@ -546,7 +546,7 @@ void hap_final_teardown(struct domain *d)
     unsigned int i;
 
 #ifdef CONFIG_ALTP2M
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
         for ( i = 0; i < d->nr_altp2m; i++ )
             p2m_teardown(d->altp2m_p2m[i], true, NULL);
 #endif
@@ -590,7 +590,7 @@ void hap_teardown(struct domain *d, bool *preempted)
 
 #ifdef CONFIG_ALTP2M
     /* Leave the root pt in case we get further attempts to modify the p2m. */
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
     {
         if ( altp2m_active(d) )
             for_each_vcpu ( d, v )
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index e126fda26760..ce14066fedaf 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -128,7 +128,7 @@ int p2m_init(struct domain *d)
         return rc;
     }
 
-    rc = hvm_altp2m_supported() ? p2m_init_altp2m(d) : 0;
+    rc = altp2m_supported() ? p2m_init_altp2m(d) : 0;
     if ( rc )
     {
         p2m_teardown_hostp2m(d);
@@ -197,7 +197,7 @@ void p2m_final_teardown(struct domain *d)
 {
     if ( is_hvm_domain(d) )
     {
-        if ( hvm_altp2m_supported() )
+        if ( altp2m_supported() )
             p2m_teardown_altp2m(d);
         /*
          * We must tear down nestedp2m unconditionally because
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ddb4c7606be1..84159198f3a0 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -995,7 +995,7 @@ out:
     if ( is_epte_present(&old_entry) )
         ept_free_entry(p2m, &old_entry, target);
 
-    if ( hvm_altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
+    if ( altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
     {
         ret = p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt, p2ma);
         if ( !rc )
-- 
2.34.1



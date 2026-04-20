Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HfaEHSa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CAD4340DE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287588.1568063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA7-0007un-5r; Mon, 20 Apr 2026 21:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287588.1568063; Mon, 20 Apr 2026 21:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA5-0007hX-VS; Mon, 20 Apr 2026 21:28:09 +0000
Received: by outflank-mailman (input) for mailman id 1287588;
 Mon, 20 Apr 2026 21:28:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwA0-0006mT-VB
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:28:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwA0-00CBn7-Ar
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:28:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a45-e002-0a2a0a5209dd-0a2a450280e4-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:28:04 +0200
Received: from [40.107.208.75]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a62-af86-0a2a45020019-286bd04bf5a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:28:04 +0200
Received: from BY5PR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:1d0::40)
 by CH3PR08MB8803.namprd08.prod.outlook.com (2603:10b6:610:17b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:55 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::e9) by BY5PR04CA0030.outlook.office365.com
 (2603:10b6:a03:1d0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:55 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:54 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9Q4kcBz1wdX; 
 Mon, 20 Apr 2026 14:27:54 -0700 (PDT)
Received: from BN1PR07CU003.outbound.protection.outlook.com
 (mail-bn1pr07cu00302.outbound.protection.outlook.com [40.93.12.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:54 -0700 (PDT)
Received: from CH0PR03CA0446.namprd03.prod.outlook.com (2603:10b6:610:10e::35)
 by DS0PR08MB9619.namprd08.prod.outlook.com (2603:10b6:8:1ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:46 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::b1) by CH0PR03CA0446.outlook.office365.com
 (2603:10b6:610:10e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:46 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:46 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:43 +0200
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
 b=KmUHL3giBvDV90PUB9gQ+LCpR0oAsKIwFYcbFiBZipOm1uvMCTSObL/oQzUZgW6ZrRNF19JwiSoBZQYzxkuH17y3OXJMInw7p/uKg+uDF6KWeUqt9p9yDVYUtwrALI78UMNfEpX387TrwL8U48lG/IoZdMw44pAeikr1zalyjGrUZ+yAp8Y+yOicqFGvCMJ6oKO4DF1iP1s3LYnLt3GlbYagZxca7A4lGuLwfSk+JTsDoqnmXADdKJfMT4MiPYcdwHM7FAELn2xqFKtEresaClbGhd/oak+GC/76DcnVr6w7Ck6RyFad6AhiEqNNL6ljQSNnYbInusLwzuVJllLKfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvY1Hq4hwLu2aLmi7v9CAxN3huVX6llKANSCVnMm0ZU=;
 b=GGBSb/mLw7P0Qpkk5AaMOIXae8ImBNMRqGFyfaL2xDH/VsqyalQtgUkt/raDruzP0zUVGiDusIDj7hKOBbuSVBWl8GLK/Crpj5Bhch3DC49mOcms/zZffEk78t4UY/GpdZoH31LUx8dh+zjfONOOTUxTkhT3UqwzBz1iovnUQ8drPP0H1og9vlijcFMgdFti8P/V6dvfN1u2i49IpcUqVP2B/9k7+ELPeFv5XkofZ5KkndnwvH0XH2raoj7o9XWVhpr2V4pSoc3vWyX3qNj/n+TjGkypALbBhzcAXdjR0yFD1Nd3gFdMZpTVfLb/ACbdTJTDYRaZ9j9WziVMXijd1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.12.2) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvY1Hq4hwLu2aLmi7v9CAxN3huVX6llKANSCVnMm0ZU=;
 b=gBLKsFEpBpxDjZYWykV5lZuc+vLLAJwJYcGZRBIRmWkEhf1RGu8SamoYo4++TYUuBSDvhOLSWabQaoFfv6H1VrsHuy6HARPIUmkY8FGY75GgIphFCquWG69qZqQWwQ5IJzBAcb8JOyC1js64hO9xrxJ7I7d7Qxh+y9+oQLAd9E4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.12.2)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.12.2 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.12.2; helo=BN1PR07CU003.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJAPAsaPZf+I/CE95epreu456e3g8/wUPnmuc6msVkTaSW53LZ1fItsHA9oqGNheP8gukjyqmq2vI0G8b8jfFQ7eM1++BTQIE1R4m4dyhI4I6id5CMgOF6U8gH/IT/jBGCy+p7ak0jlwbegzZY60UXolOX8tJVecnatGFrupaa+c25zxo9FEF7WJmW7jxCUaG4yjphdvu/S/HigFYKvKkZv4izEu+4cW0TF7ovOKRDraGx3IsEKYBTq8lBWY67d4T6a6qyb/TKV4dyjQg/EnVxeaAe3NMMwGf5w9D5TdIi8dBNphDy3K5jNy+tH52VK7t46fw/7d6Vdbb7mvtGqvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvY1Hq4hwLu2aLmi7v9CAxN3huVX6llKANSCVnMm0ZU=;
 b=BubyTJy+uuFnZrB9UFpc3mcUWOc5LT0g0lloAqu/VU73OaXzNWQ5Y67D3IMEJKHR7px+JEZQXsiKrwvxTpuMYMlNdAgJxLU5NegLnNEYk4JeU+p1c+zHxhW7KHC6cuhp8aqjLm8mE/5ZwOC7D7yY+YRlzG0XAUt//0UO9gVAyXtog+Be1dnGI1pB4PqQzMr+KkbJ9+40PPp/fzay4MzA5xQiMsEtKIWK+avdE9MGlW9inxIx47XJBivkXksgR0YQfc6OfbWZxciw51HL4Bjc3CH4PudUKoHNex/wLhXKDiW1beVCfqm3mEnYIamlemJUJRr5vRzd5tElVix3dZafCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvY1Hq4hwLu2aLmi7v9CAxN3huVX6llKANSCVnMm0ZU=;
 b=gBLKsFEpBpxDjZYWykV5lZuc+vLLAJwJYcGZRBIRmWkEhf1RGu8SamoYo4++TYUuBSDvhOLSWabQaoFfv6H1VrsHuy6HARPIUmkY8FGY75GgIphFCquWG69qZqQWwQ5IJzBAcb8JOyC1js64hO9xrxJ7I7d7Qxh+y9+oQLAd9E4=
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
Subject: [RFC PATCH v6 29/43] arm/altp2m: Add support for altp2m_vcpu_{initialise,destroy}
Date: Mon, 20 Apr 2026 17:26:34 -0400
Message-ID: <20260420212648.208640-22-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
References: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es013.ebgroup.elektrobit.com (10.243.160.141) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	CH2PEPF0000009C:EE_|DS0PR08MB9619:EE_|MWH0EPF000A6731:EE_|CH3PR08MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e785e4b-54c3-426f-7e08-08de9f23af79
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?OoOsWKlW9lCvsd3JfNTvs31I+wP7gQHATOD91UTuGQQXHvXA1qcih02asRoI?=
 =?us-ascii?Q?awwaXPH8AcqtKR2Ld7XBMbG7p5xiaAXTzIF759vSjVMNfbVfobZ+z7IMT1vg?=
 =?us-ascii?Q?bV/LpD1N9CxpaY9OKEJs5yI46TWGB9Aa4z4geeaKv72tcVmkTHnL+JJeLMLl?=
 =?us-ascii?Q?pyI5WWLGlSvK4+hMsF+LvwgZWIPMcXwLK0HEfuXIgA+o25kHGvGCV7/LsOUH?=
 =?us-ascii?Q?7mxVpfc7AAJs31ORonb+2WcY1zcXpLxqs3kjvtDYIzYYxnJVbluQgvl+cp2J?=
 =?us-ascii?Q?gHaN+4sr9M62S0UmZk4PFmndqvmBLqy7HdT4rK02u2ZWby1iVh0DatKnsC4T?=
 =?us-ascii?Q?xaNzW1U8A7IinDtZ7vilvuvZYTvOcum9FHM7OR3RSX2QmlACJiQqkEVWL4n5?=
 =?us-ascii?Q?fg4gYsrlzPjdt77l5Jzm7GQxbp/Pl07DoRz1fv/yYC3orne9F0n7QhPoWyI3?=
 =?us-ascii?Q?tZ3TqK5GVTNvyeVb0m0GHH6n6Cqp2HCF4ubiq8t5wuyjBPLgFlDLrxQc1Cxr?=
 =?us-ascii?Q?hsraIUYnRNcITIzOUrhjouHF6ndtQcFZxOacH76PHnoNL4MRWMEwtpt3jVjk?=
 =?us-ascii?Q?ygmQQUk1Eu6KVz6VMj0JDGrvLacjE+f6oHJwcloDv0zm1m8P3tMrc7nmIU5o?=
 =?us-ascii?Q?Mv9sniduJIrlvw00sE5vyW2JSxYBnmWsHPdKzqO0lBc+9ZWAfNAGfLmfwmNS?=
 =?us-ascii?Q?Z3sayZ7xPmrFXvo9+NwxEc/7YnNgxaVSv8YBrm73dEW63zVF5jSg76AM0YU2?=
 =?us-ascii?Q?IhP0yJRkC1dk4Sn68PfMiPko/PjXXqceyFHMNtPwQ+Ei2xXYm380tzM4WkwO?=
 =?us-ascii?Q?81q9sKb13gQ2267vpI+GfFsxpXRcD9eae+sMwj4NrwnF8KJBVCRBuz1Ewg1Z?=
 =?us-ascii?Q?DuA1FVEDYq/DTPy+fDzYWPALFnAEZuG4JBBZ4PsN1bg3QwIHOaa4QWNLujW9?=
 =?us-ascii?Q?MMPfLU6UVWd4N2Vw1F3rrINjulF3tUpU2YyVq8fYS4UssIoJI3C2HRLonoS5?=
 =?us-ascii?Q?FSJGY/5EVovT3iwCkza0s1YE/CmGEsnAcNiFHqoxEkyup/M9KCu+bkxMlHuu?=
 =?us-ascii?Q?mq255K4HE8FzmVKZDPEkjgq5AQGXWv/mnDretqip9qKHi4qudCJuXa+rBTGT?=
 =?us-ascii?Q?f6g4QCEYGuhl?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 OxzzmR/dTB6li+wilIJU/ibAjRBRO8HfMPCgZyLFCsjYj5OVuTG6L67lEh6G+9NDvTTPOhVILE0A2biN0Jyg5lhxJCEaNS4ZUJXrpMurLnjC1dpHMx6kj2kU+IMOsJB3gIOXrsGrcU03RLcYQhT2fODzG8dAdLElCyvHCkSlDXDWfPBCynRWuzK9mOi1dMuNmTA7yRwC/iyRIFPt7FMPTYX4sZf7xioQK2YUWeAmNHSVjwJ3GbbHVaVpZghwz1Xa7grRXP539jp12RnjqtS5ccfaPWNNZYse1f7djV4HmQn7A9T0LrCT7xN0GvAQbOZeg5EMvkTXWBM8xtB4n0GWeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9619
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.12.2];domain=BN1PR07CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.12.2];domain=BN1PR07CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4de98956-961f-42f8-99aa-08de9f23aa6c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|156008|82310400026|14060799003|35042699022|376014|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HGZ3I7Fgwwbg1s6VEvotr/Vc0YZJvF7Lzgdo/Thph2JPKXoEj7vveHyovNVK?=
 =?us-ascii?Q?nETUj5o9pwa+MEW+74kGz1xM2OgN2j3gsMJmVQrt8xULAzjV7lT+pmeEqrKN?=
 =?us-ascii?Q?b5D4P/QaPY/Cg8IgJkGGBOVpa+P/WaEiHyufmpwFcZyNFR1bL3V8Eo5v9Yu/?=
 =?us-ascii?Q?OCwAyTMRws8AWIloFFM3LjjHJ0yLOhwjPr9O2S1aHHpjnK8MLY61wfngwR6n?=
 =?us-ascii?Q?fC5fPl3phGZmTOzkeQMPf8fVb/sUSu7jBKUf/C5SV+OtEc1UJnFg8mRAjN7Y?=
 =?us-ascii?Q?XWW8yzwFoeIJlVPUPH0uj30QRiOgxLYWjq3G2gq8B0ygXXbvOIAphJfDJns0?=
 =?us-ascii?Q?Ax/JqI2+j4ODhdmGGfyFDsSv5kriOqQUPL5MP+0dqdnylwQAt/XyY4zeP7u/?=
 =?us-ascii?Q?du/ldbCs5pbofbWM4Ys3GWVHLUKisJXqVYd5P9TYpRwbuKiLJV8ikmtGO1UL?=
 =?us-ascii?Q?IUtlAd1/vUD9cnnd1gP1vWFuUGvSugzJgP/79lzvZk/Bq5amgm1EwAxlG6RT?=
 =?us-ascii?Q?2lnDoY+lRIFD6ntv6YC4tJ2g8LxIBbDSZQdOggQ8gRfvq3yUDtiFKNoMyeLU?=
 =?us-ascii?Q?5dbu3FeSRJAuyM1sr0/X6rnpzsAgbq8mPDBJSAoMxZvAQdCQ1Ne/m1quuO+w?=
 =?us-ascii?Q?rR4Y/m1q1dBrJf6SaTDetm/LltO4QkLhB3j5jeKrzSkHZeSSydCDkkvK7BVu?=
 =?us-ascii?Q?n5DMWkM4sivhNXyV3yGmSYuNb+9y78yIspqCPM4gso1QI4cyCShkJI0lLGI/?=
 =?us-ascii?Q?6bZzfSEYHFg457g5P8sObdaZI11KWksdjhYPE0ytfwcNoHLN0XtsXlANOyEq?=
 =?us-ascii?Q?pp5qy9H4AnqTEvGjGOhU7i68uHsyzaJYrmbw2ZVLgugH8rdO3lci9/6P4U0H?=
 =?us-ascii?Q?aHQ3GBeR0LTXCTY5ndTqI3bW7N4YIIelFhRAAuabCl2mVlJLP1SjIfw3Nfvp?=
 =?us-ascii?Q?ZLpCMWi/DOOB009cUBmpdX+7DY8dPr8yQ0LInKeSWPHB6VqKuII5xZzqHRd+?=
 =?us-ascii?Q?hA5YNoowftl90u5iu2e8tI2VmaxLueTmgzNOc/1H0p2qeUL60RTI/VsXRkoD?=
 =?us-ascii?Q?Op8tUN1FbIWRTvYMpBRNA5JRlrvyXgc93S6wEfIiwYW7bFjqis8IWc7JujK8?=
 =?us-ascii?Q?qa/0U+QveJ6z?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN1PR07CU003.outbound.protection.outlook.com;PTR:mail-bn1pr07cu00302.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(156008)(82310400026)(14060799003)(35042699022)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZakltMU1mMnE+bRdLJuOgP3hZwlqIBPWQHfg//M8oJvt1MQQRkXjaLQRF0H+gnj4WGLwqFRJv3EJW2a9xI4IKyLGvKGgwYeuTYsONWqTZ/NlgR1fkq/U9ZXV5upMvNflBep1h5NzCVIJZqHP+rREk0mcKzlAwXSU+O0TeHTN86mBHA5pnMAdq7tziScffFdN7r7WnMGG6qwephEFGELSzwoFwlEJf11hivkmeUzuKsZsetIJPGWQT3Ro8oPKuWq3+CyYJ5135bz+w6Y/RVZVl2bV7ab8DpEGjZmziwT4MJYqoH9ZxwqrgeYhmx8MfQiPQCkJNBsXxkZC8HO2/2ptwwqa44OEnK+kHdktH2SmBJl9wQGV7ebGsrUIUQ4UwWB8863vK3cnVJQMgOAiTnzH85KcBwHbzS522Gnv7KrQ06BVCjQJronsY3aPsJrZ2F7g
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:54.8764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e785e4b-54c3-426f-7e08-08de9f23af79
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB8803
X-purgate-ID: tlsNG-720697/1776720484-88EC8161-95025BFE/0/0
X-purgate-type: clean
X-purgate-size: 3182
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.304];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[elektrobit.com:email,elektrobit.com:dkim,elektrobit.com:mid]
X-Rspamd-Queue-Id: D0CAD4340DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds support for the altp2m_vcpu_initialise and
altp2m_vcpu_destroy functions on ARM. The x86-specific function calls,
altp2m_vcpu_disable_ve and altp2m_vcpu_update_p2m, are gated with #ifdef
CONFIG_X86.

This is commit 2/2 of the altp2m_vcpu_{initialise,destroy} phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    The equivalent to this patch in the v4/v5 was originally part of the
    patch named "arm/altp2m: Add HVMOP_altp2m_set_domain_state". In that
    patch, the check that the VCPU passed to altp2m_vcpu_initialise isn't
    the current CPU was removed. This was because ARM only implements the
    external altp2m mode, meaning the current VCPU could never be a VCPU of
    the guest for which altp2m is being initialized for. Therefore,
    skipping this check was a slight optimization. I've removed that here
    because altp2m_vcpu_initialise is only called during an HVMOP, and
    skipping this check on ARM (especially when x86 also implements the
    external altp2m mode) causes more confusion than the slight
    optimization is worth in my view.
---
 xen/common/altp2m.c      | 14 ++++++++++----
 xen/include/xen/altp2m.h |  2 --
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index e699b64678d8..7b80426c7798 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -11,6 +11,7 @@
 #include <xsm/xsm.h>
 
 #if defined(CONFIG_X86) && defined(CONFIG_HVM)
+#include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
 #endif
 
@@ -59,7 +60,6 @@ void altp2m_teardown(struct domain *d)
     XVFREE(d->altp2m_p2m);
 }
 
-#ifdef CONFIG_X86
 void altp2m_vcpu_initialise(struct vcpu *v)
 {
     if ( !v->domain->nr_altp2m )
@@ -68,10 +68,12 @@ void altp2m_vcpu_initialise(struct vcpu *v)
     if ( v != current )
         vcpu_pause(v);
 
-    vcpu_altp2m(v).p2midx = 0;
+    altp2m_set_vcpu_idx(v, 0);
     atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
 
+#ifdef CONFIG_X86
     altp2m_vcpu_update_p2m(v);
+#endif
 
     if ( v != current )
         vcpu_unpause(v);
@@ -90,15 +92,19 @@ void altp2m_vcpu_destroy(struct vcpu *v)
     if ( (p2m = altp2m_get_altp2m(v)) )
         atomic_dec(&p2m->active_vcpus);
 
+#ifdef CONFIG_X86
     altp2m_vcpu_disable_ve(v);
+#endif
 
-    vcpu_altp2m(v).p2midx = INVALID_ALTP2M;
+    altp2m_set_vcpu_idx(v, INVALID_ALTP2M);
+
+#ifdef CONFIG_X86
     altp2m_vcpu_update_p2m(v);
+#endif
 
     if ( v != current )
         vcpu_unpause(v);
 }
-#endif
 
 /*
  * altp2m operations are envisioned as being used in several different
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 7defe6126563..37c875a52327 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -24,11 +24,9 @@ int altp2m_init(struct domain *d);
 /* Free altp2m views */
 void altp2m_teardown(struct domain *d);
 
-#ifdef CONFIG_X86
 /* Alternate p2m VCPU */
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
-#endif
 
 #ifdef CONFIG_ALTP2M
 
-- 
2.34.1



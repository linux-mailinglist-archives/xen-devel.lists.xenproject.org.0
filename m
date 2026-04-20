Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMorBWKa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C4434045
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287506.1567960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9h-0002iR-4Z; Mon, 20 Apr 2026 21:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287506.1567960; Mon, 20 Apr 2026 21:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9g-0002fl-Px; Mon, 20 Apr 2026 21:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1287506;
 Mon, 20 Apr 2026 21:27:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9e-000283-4N
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9d-001N7n-GO
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e699fc-bab6-0a2a0a5309dd-0a2a4503cf4a-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:41 +0200
Received: from [40.107.201.99]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a4c-672d-0a2a45030019-286bc9630e4a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:41 +0200
Received: from SA9PR11CA0007.namprd11.prod.outlook.com (2603:10b6:806:6e::12)
 by DS4PR08MB10791.namprd08.prod.outlook.com (2603:10b6:8:2a6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 20 Apr
 2026 21:27:28 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::d8) by SA9PR11CA0007.outlook.office365.com
 (2603:10b6:806:6e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:28 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:27 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8v0nmFz1wdP; 
 Mon, 20 Apr 2026 14:27:27 -0700 (PDT)
Received: from CO1PR07CU001.outbound.protection.outlook.com
 (mail-co1pr07cu00101.outbound.protection.outlook.com [40.93.10.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:26 -0700 (PDT)
Received: from CH5PR05CA0023.namprd05.prod.outlook.com (2603:10b6:610:1f0::25)
 by BL3PR08MB7364.namprd08.prod.outlook.com (2603:10b6:208:357::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:22 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::29) by CH5PR05CA0023.outlook.office365.com
 (2603:10b6:610:1f0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:21 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:21 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:17 +0200
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
 b=Kyf7/ZgHnGQQzKCMH36FhTphA12Ijc+sZcT629uaAqIIrbzBUc8hAThw6OuOpbwU4K1aOhTS5Q+8ABNYi//gZ/6uSFrHfGO+XD+vGUR6l9QFPGuOQNDDfn21X59DzlI1vA46dZkZNQ/59+gu2y6URVz/Y7gSi/aQ9XM1mdYYNG7wp3d+iaf1bTSR4vSHaGlk4i+RRP8OgPde5hJHubpw+vHgfQZunF7LABc2phjBQ6BDOBQhpfIGjIuPt0DB+hpldqdxFQB8L+SXpWyMEWTDWwqz20/M+GA0rxTUdpCl8X9aeQCjx43G+lXJEhvIBzdt+lGAC7DHuSe5GqcvKCHg6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct7OYHDuserQjrdnXDT2Q3J5e72VZGG2o8HBBgpiIsc=;
 b=jeQnDKACIStMJKaHBmfo1kHCg8xVk0tn7TTRJtRHq32Rve/U3MfzFnLrtRQyP7Ouaq5XtEvgBwSWxdmYe2bzg8K9v82dYYD3HBogK454M5BcwOEEfpdwh//u3cZz11c9E8cO+7vImNcQ6bnrxOzjZJcHLM00MSVHW+hGHRyK2CAbzo7ao1sSMtLsYXUUNxg8UIyD/QPXnNBa1eLU6CnBfT7zyCnMKnmlmKvKdh6ZRjcUCXsYMqvtzBdWGEr3Q0I4bfRHgO7tJbTdTaYn8wDJLe9vd7SBXWnfRYTI9MNJvmkrhgIAIqKD6N9Bntq6KUajKs4RyMsoSWahCjtQ36MYDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.10.89) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct7OYHDuserQjrdnXDT2Q3J5e72VZGG2o8HBBgpiIsc=;
 b=BQ9mD1vz27gAQQlAgYdXw6gX4wmBMCNVTTQd2QJr/RI+F2WKhLisuIgRg4VVJxwZi8J4auyOLW6ORPM5RcU31U5jQ+Ld9RcWilXJGw8gwp1uowAwQo2b1evZrd7CRGdlrgRGlJHZdkocVFeeayPa9Q105iYfPR/PcwVuqXYhOzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.10.89)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.10.89 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.10.89; helo=CO1PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/PGi302Mh1oqY8s11ew3pRbPUO1VE77wUA+skc1VyZBVcjo1d2yn+XMsRQpnPm5FVA9jp1OCxOKAu8Fv+7vYiKTnQvt8RhHsBvi/TDVc0yjOcg9qAkjA19wD1PvAMDSReXy3LD+r8itSu8d3/u+KvFN6lCb8L7L+B3vAreVBVBYQr8WGRrN1SkjOGsiWdItrBIV1YjhXewxOSvYBSTNMnYN6cipqcCN3vvOa87M/vq1iDfNr+OolyAryouS7LucYAujeo4gu6JVwPhuArN83sI5OztQGC/TEWsDoSeTjgwCUI6JaJ8jZL0Svr6cmLbtOpX5zz0uKoiorQXIRWJy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct7OYHDuserQjrdnXDT2Q3J5e72VZGG2o8HBBgpiIsc=;
 b=pCbhG9aSLCvfbOBgyXfFxIOiDBQwd5v+Lk+yWVGF44QcKbrm2KAOirY8AJMEFIIaDWwcQeU6sSsPdow6eDhM6PZRx3/2XHreFFOjTZnVJk3uqD/zSRsD1s60kTQ85O0UFUogxlsvij0AmoU2Wmu3tQtB55zp/cX/z/oWLnR64zoWmNCck1bdV1TG4lNxzItCPVgFR9Devjd76wmFdWuR5+VUAbSIPbFjIM4xuwVB+9An2DviUpZ9ylmM829d0Qq/UChLoA8UZJHf1HZ93rtrtwkcgz8OkG50//OGqc4a9v0wunSVqqwSBGMvW1L0an9OMAlNNJo7PC6DAY2ORDP2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct7OYHDuserQjrdnXDT2Q3J5e72VZGG2o8HBBgpiIsc=;
 b=BQ9mD1vz27gAQQlAgYdXw6gX4wmBMCNVTTQd2QJr/RI+F2WKhLisuIgRg4VVJxwZi8J4auyOLW6ORPM5RcU31U5jQ+Ld9RcWilXJGw8gwp1uowAwQo2b1evZrd7CRGdlrgRGlJHZdkocVFeeayPa9Q105iYfPR/PcwVuqXYhOzY=
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
Subject: [RFC PATCH v6 13/43] x86/altp2m: Add lock functions accessible from common code
Date: Mon, 20 Apr 2026 17:26:18 -0400
Message-ID: <20260420212648.208640-6-Rose.Spangler@elektrobit.com>
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
	CH2PEPF00000099:EE_|BL3PR08MB7364:EE_|SN1PEPF0002529D:EE_|DS4PR08MB10791:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea5f87b-1d35-40c0-4c8d-08de9f239f75
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?WHPnQIXN2eX7sItNdR+heqLOcgAJVqiLJb06qhHWJ7Z7yNEEEwvurq9TqAZ9?=
 =?us-ascii?Q?5m3VOHqo/Zo2ig0oSLBtPZdSNrwBE/MU85u87WzIBi5ugz/uvpo2OjQql5fP?=
 =?us-ascii?Q?kZVoefCCi6HQip4K+9RcbyNLon5SAojuuLLQtCKjdEHXOsxkGZiuMlkLKTgD?=
 =?us-ascii?Q?pz8l9oyDnFKdQceSj4Vcd3LhTcMobHdN8/9PxDhCMNr5BDDX98MdBTos8f4X?=
 =?us-ascii?Q?edGO97mO6UzjvBhq5KLWq4F+f3W42s6FNggwJ1g2lhJ7v9LWWa6LUWhHKMUP?=
 =?us-ascii?Q?2gN9ukxF+79xQsASetz4fqBNsHqc7FGoqMdXJJY2p0nBRurkhF+xZt3Y58BG?=
 =?us-ascii?Q?OxuxVvQHtr7wmTQAjQermNQkSWTy4goa08wwkGEgDlwT9wIIg8SBjLmo7JPo?=
 =?us-ascii?Q?jwDGvV3ll1D3dXEW02k22Ju86eC8YQ9ul85/gmKtV9ntcdpWwHgAomFqXaD9?=
 =?us-ascii?Q?32YDis3KPT0c5U9kVoQnzX1cvG3RS1U4Wh1JiLGza7pTK2Tfu9BiNlUtFQx4?=
 =?us-ascii?Q?5hG5uFEEKMO9jnNaxe5N0/dDtzKTjX/hjz8y9SMn4QRf7T8PaHfQmG51+uw4?=
 =?us-ascii?Q?rqGMdDileTuPB5rigtGx9Z1LkaFx6rxfeGaiOp+fHtrcNi+pAuhl7vQZdKl8?=
 =?us-ascii?Q?bORRMVP+bdR5nn9Qe4Vrw1v41oJC9OL9WLlUNXQxTdfQG5f+RE/KqB/2Zma6?=
 =?us-ascii?Q?BtINK2ikoZO5ZcR7lvWGNakR1ZNOz8K5f0hLJdBD8L3T65y0JWTtOlIhzmmN?=
 =?us-ascii?Q?VcYcysOAAqapQQL7bJ7cTNf9IANyVdASq6RrFOER+iQhHx51Odk4+oZ0qIf4?=
 =?us-ascii?Q?h0iqfHN/4nVMwyx2FBR+3MPuHeifz7pta9hLnuin6j9Aj0hTWyJwK1gvaA1l?=
 =?us-ascii?Q?8aA96C3ITSlAPUdGC3yqHnyHh/eL3NPtRm2jPjnS2KLh95scGqS2MvMLgpp1?=
 =?us-ascii?Q?xoIHmi3TffpKMzu7BgqMap+avdxEBrtTsid1IcnO9vMG7aTkH8IJfG/a7Z87?=
 =?us-ascii?Q?iyaWhX6lnytQ3WWxR5WJW2zuorDhrMWVv1aUyKfAtN06swQs/85bsWbO+O3y?=
 =?us-ascii?Q?tvBdA67QhAItPVjf5+0lFeGBFCFN7uzDUFlWQcTAjRofSfWdXVoD3LUL43NC?=
 =?us-ascii?Q?vF5otZPgHw55jHdaeIDQblKOAPW83rSchg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 ZXdEGbdDMnaIXcK0+1mXqOTQ2i1YJ7axfzXR7LH1DBs4FJOkRUfAAvt03XyhGCgYfnbhWbu1rTgAHvzwz0TqKip5toACGSr5n2PUmUtFzprd7m3vOdLRSv5BysM/t96W0dowm1CFngMmK3SoQCqjZt6HYSlHdBMGhTGVD/tHwTnhT56hBcILDtd9roS3ERGBgY5drLuYomIgTt1mFNq3Ol7efMxDhKQl0LCdry2sXz+bHK+g28I8qbM+qGxGwWCChiAjo6cg0hkb9iBdO2OshVLeyBSuZOFwyalX4kUgMGFF60caN6uDeHahx1grTSVFF2eq0rVzR7ZfhyYWgz+XVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR08MB7364
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.10.89];domain=CO1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.10.89];domain=CO1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8ac005d-1b6f-41cf-b7dc-08de9f239bbe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|36860700016|156008|14060799003|1800799024|376014|35042699022|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N/6+q/KYCFgRYwjYhU7I1Ic1rZV1gogNtkR5B83ZAsiwAQ4ezv5CWSzwYLrV?=
 =?us-ascii?Q?+ad0g/PnWdOH6P/aG4yqo7LBy23PWNQqhs3VRsY4wp7jLuK6WZQs2Tz7lSJj?=
 =?us-ascii?Q?KGAR6qoiHKANLur7ERf1Pm5RhZo8yxeisRh3dK5LU99/JQv6MrNS8r9PR2Ix?=
 =?us-ascii?Q?HC8NSZK+ObLeuTXv/CI3qq2lF/lpc402shi0f93cu4ZgKX9Dd7y2a3ybiVEF?=
 =?us-ascii?Q?IoGUF10dZ7VSuqK+E0WusT4ZxuyNUll+vud+Oc9B0+8ffFJEyHvt+Rhm2T2u?=
 =?us-ascii?Q?up/pwiO7JpEWfVmMPFewYRZ1qU4SIxdo8bCH5EkjvaN3m3qtMEtg4zKcJq0y?=
 =?us-ascii?Q?cfcXnEhBMcxspB0trpWrtpiZQPi3h59YTwcTpALh42Z+4bfGDVXRrnCp+chh?=
 =?us-ascii?Q?gBKRxcT2rjVn2k9rOA1ZOKx5EyX83HzOyjqJkqsPi+LH7zLSEDzNFQDgqwXG?=
 =?us-ascii?Q?KVtmuKjFXZdczFRQCdAvU4cjK8EreLtP8uTWAJmpXhsEsVGA54c3a91t29pB?=
 =?us-ascii?Q?FCVtGcFKLgG/n3ra0N3qGFOArEZcOkmItp00h+MqnuLCJKpJlersP4MSLzU5?=
 =?us-ascii?Q?GDL1qVxLVLuzNDrO2L927lqnSLo7gIPe697nw+7LfN+mqMJFmDU48nr/5KJI?=
 =?us-ascii?Q?t7Vq5oVLQ/WBKk+X6QRTJ9U9BJ1maz583BGWzWTRGvVJMxh7MM3Sd7FkNBWs?=
 =?us-ascii?Q?9abkNZXFzW9RBRxeW9Z+TwQVVqArcw62ojq81/YZAWOviM3CHdkIxoa14sNA?=
 =?us-ascii?Q?EYra6Xl94EC+XvPi2MQeEHfupGeGkThIeWwlZzOcIJ8US2ev8axdlGQ3be3d?=
 =?us-ascii?Q?5EdjDEL4Qr/jNAVJsU6bQRO/aTyIaQC86SjAaGiqRL6ld9CU+5FdFXMiLlLT?=
 =?us-ascii?Q?nIsw4PhmZtES5Dtkyi46fC/VjSxB+qm1ycHk/+WfeXrpu1XzLr+firK+py8k?=
 =?us-ascii?Q?7M+LY5Lei/tcguogXHa3UC3Nf5n3sIBscj0CDKfpaul1uQITGJQLeh7OzZCs?=
 =?us-ascii?Q?/CWCvgAC9DSLnZ0M/EAEVf51aEgtVLZzD790eJJiKQN+RAiDYAKiIGnYjNlS?=
 =?us-ascii?Q?2x1UXFIKwRlu4HIrpu+9OyNr76GybTL+0XDlXrFtK+drw1er7UzoZJaglVZZ?=
 =?us-ascii?Q?iC6NzfKZxe0Na9eX35RHj5GOsZKz+MPngg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR07CU001.outbound.protection.outlook.com;PTR:mail-co1pr07cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(36860700016)(156008)(14060799003)(1800799024)(376014)(35042699022)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HpdXB1xWVXQCLHFzYoiluWcJM9Inm13O/3QIP2PsqDXzEtOLZskBbc/SELGQqg98ll8+2RtV2u+7yJTovXONDcQaK+6wXXofZTSmURW6Og3/iKwBTdnA0zO4Lo3Ag0Ud23He9fqa5vqK9iHacqRFOSBgXeu4Ebag+oRtGMTRZoqfVm1RuLPc9vw5lexksijWlTtQTsIzTsRyBXOdDzaM3ECuSYFLSh+KitWRm2chcGnDKQZwTB+VwzdkKO6PXu8wrU12qli8Rmn7GthTh9hplNuzYn7WMwlY4hJDcKNyDxMd7Si+pi0YsoqNOc2qo4hjLhgCzEz3iudQj1kxWqnR6aIl9UT9oZGwhiBtyj2C1yCF4ra8wpK3ukFMshnH8Q3GM0kqwAu59BpRDs2hvyhPbh85XI9XGuM+ZQto1MOmXazI8St+PfzMAknrgyBaTDgH
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:27.8113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea5f87b-1d35-40c0-4c8d-08de9f239f75
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR08MB10791
X-purgate-ID: tlsNG-33051d/1776720461-A2965938-B53D01F8/0/0
X-purgate-type: clean
X-purgate-size: 6429
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.231];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 513C4434045
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds three altp2m_lock functions which wrap the corresponding
altp2m_list_lock functions present in "mm-locks.h". The "mm-locks.h" file
is only accessible in x86 code. In order to make altp2m common across
architectures, it must be possible to acquire the altp2m lock without
including an x86-specific header file.

These functions cannot be static inline like their "mm-locks.h"
counterparts, since "mm-locks.h" is only included in source files, not
header files. Therefore, these functions might introduce a slight function
call overhead over their "mm-locks.h" counterparts. However, the altp2m
lock is mostly used in init/teardown routines and HVMOP implementations.
For these cases, the altp2m_list_lock functions have been switched out for
the altp2m_lock functions so they can be later migrated to common code. The
only other function using the altp2m lock is altp2m_get_or_propagate, which
is in the hot path of the page fault handler, so the altp2m_list_lock calls
have not been replaced for that function.

This is commit 2/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    This seems like the solution which makes the most sense here, but it
    would be nicer if it could be static inline. I'm also not sure if the
    "mm-locks.h" functions are really supposed to be exposed outside of
    their translation unit like this, so feedback on this is appreciated.
---
 xen/arch/x86/include/asm/altp2m.h |  4 +++
 xen/arch/x86/mm/altp2m.c          | 42 ++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 9c58a396448d..7cff40beb7c6 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -156,6 +156,10 @@ int p2m_set_suppress_ve_multi(struct domain *d,
 int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
                         unsigned int altp2m_idx);
 
+void altp2m_lock_init(struct domain *d);
+void altp2m_lock(struct domain *d);
+void altp2m_unlock(struct domain *d);
+
 #else
 
 static inline bool altp2m_is_eptp_valid(const struct domain *d,
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 2dc84b76b8c1..371bf3f0b8d4 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -129,7 +129,7 @@ int altp2m_init(struct domain *d)
     struct p2m_domain *p2m;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
-    mm_lock_init(&d->arch.altp2m_list_lock);
+    altp2m_lock_init(d);
     d->altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
 
     if ( !d->altp2m_p2m )
@@ -221,7 +221,7 @@ bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx)
     if ( idx >= d->nr_altp2m )
         return rc;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
     {
@@ -230,7 +230,7 @@ bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx)
         rc = 1;
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
 
@@ -348,7 +348,7 @@ void altp2m_flush(struct domain *d)
 {
     unsigned int i;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
@@ -357,7 +357,7 @@ void altp2m_flush(struct domain *d)
         d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 }
 
 static int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
@@ -409,13 +409,13 @@ int altp2m_init_by_id(struct domain *d, unsigned int idx)
     if ( idx >= d->nr_altp2m )
         return rc;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
         rc = altp2m_activate_altp2m(d, idx, hostp2m->default_access);
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
 
@@ -431,7 +431,7 @@ int altp2m_init_next_available(struct domain *d, uint16_t *idx,
          !xenmem_access_to_p2m_access(hostp2m, hvmmem_default_access, &a) )
         return rc;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
@@ -446,7 +446,7 @@ int altp2m_init_next_available(struct domain *d, uint16_t *idx,
         break;
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
 
@@ -463,7 +463,7 @@ int altp2m_destroy_by_id(struct domain *d, unsigned int idx)
         return rc;
 
     rc = -EBUSY;
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
          mfn_x(INVALID_MFN) )
@@ -481,7 +481,7 @@ int altp2m_destroy_by_id(struct domain *d, unsigned int idx)
         }
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 
     domain_unpause_except_self(d);
 
@@ -501,7 +501,7 @@ int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
         return rc;
 
     rc = -EINVAL;
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
     {
@@ -512,7 +512,7 @@ int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
         rc = 0;
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 
     domain_unpause_except_self(d);
 
@@ -773,7 +773,7 @@ int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
 {
     int rc = 0;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
         rc = -EINVAL;
@@ -784,11 +784,23 @@ int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
         d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
             mfn_x(INVALID_MFN);
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 
     return rc;
 }
 
+void altp2m_lock_init(struct domain *d) {
+    mm_lock_init(&d->arch.altp2m_list_lock);
+}
+
+void altp2m_lock(struct domain *d) {
+    altp2m_list_lock(d);
+}
+
+void altp2m_unlock(struct domain *d) {
+    altp2m_list_unlock(d);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1



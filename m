Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067BCA29E7
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 08:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177319.1501641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR3e1-0007z9-TH; Thu, 04 Dec 2025 07:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177319.1501641; Thu, 04 Dec 2025 07:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR3e1-0007xP-QO; Thu, 04 Dec 2025 07:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1177319;
 Thu, 04 Dec 2025 07:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VGT=6K=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vR3dz-0007xJ-KC
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 07:20:51 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1951c8c-d0e1-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 08:20:48 +0100 (CET)
Received: from DU2PR04CA0207.eurprd04.prod.outlook.com (2603:10a6:10:28d::32)
 by PAXPR08MB6509.eurprd08.prod.outlook.com (2603:10a6:102:12e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 07:20:43 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::67) by DU2PR04CA0207.outlook.office365.com
 (2603:10a6:10:28d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 07:20:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 07:20:43 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV1PR08MB7732.eurprd08.prod.outlook.com (2603:10a6:150:53::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 07:19:36 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 07:19:35 +0000
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
X-Inumbo-ID: c1951c8c-d0e1-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=szNsPoKqarA0xNnpFYZZAgTZ6/jDOxNonbYl+iRDbhqVV0+/wu5Gdnn1B6nO2uwb8N9VS4Rr+fhwuavSAbAaCOlmuqnYUCtHjDAswDGjaF5lNIHdd5qBW5kotelFGpbU7hLZFdeUGbRq/MPNMK/FFT/d101XqB8h7ROIwVzgB2xTl3Az8PSrnXvVbkJYeAXissgLzwgdj1dSPK7s3gmVK4pZ3aSQDIMFU7M5BPR6DlrJiqs5997SXpKpVZ2NFn41OlsCiPsKyqCN33xn5SuAuz00sRcVj4H0ptESnPGAifJfMwRDHgos0W92maWvnjRzppVOu8ObnisTDQ/yBOI1TA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rG587oZEWwoxfK1+u71M6Y71itEBhTBhYHZl3XbcZc=;
 b=IYOyby4r3+3E/yI9BPXNlTeatA27wZMjHoGBpHW7f5/9XfRXiXkkufAatz2WVVYVrQ6OfLiZ4/JsOyUch1vYqdiN1ptbhOUecB4ViTVBxrQ4/AxE/whT8trCyP3o/Lbx9RVwCdxFM8Pp9z7JT4d8UCch3S+aT4RA2DBUpJnXsLw2bgynCUqh24c7QqmF1T00b+ljjiGjfnKTdyaj8Rvpv3E/5DH2dteKQ7Vg7IzKanSQFsSg5J6AbsSMhHcFMh0/lm1wfNjI0gjR5Osa91L134NFTDwpEAUfFNc42OnvG5bpvjRGadKY4hcoZGJhafXugOlCdMNWA/Tx0Jq5vZVM5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rG587oZEWwoxfK1+u71M6Y71itEBhTBhYHZl3XbcZc=;
 b=WwI/TuRrME4d+YVuxQxdHd/CXg8bh8sYL1vGs+N3Gx79yiNVmEaMvH/oUZiu0j6fJYDGrRPmuYHwhMVOVYRBVcsMfY6d55czj+R3oTkKlMOU6YlHe5dmefH5ysudhkQ2TUVsMZDsojPJwRuKUuUZ+L4nRW9yRnaji6z6aIz7kes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZqn+Kt8vblsiypluH97/ODIqs8uwPzcfrBbvNaGBhFkopUFMVS9KUysp+KPk7d8HvIGjXRs4sDPQvYcTWoSYIWPMx3HAWPGfOqY4Dd1nmoEleF6oS0lE+TtKs6eEc4YQewXfr0XLksKJzrHcI5hi/tvguBhq+tHySFIaPqfjeOJValTNWwwuFJX36V40zPhfvLEog8sScDM7hm6B8+0fVY7wadz/1RJtal9zjx8yWnKohynPZV4ezDTOMu4cpWPB1fWMYC3s0kgjohk3kCRv8oObG8JNiJkKAJkfqvpWmGMES/hoVYtAnty8Rs2xUZ5vNvOJlKQllKd91g99V67eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rG587oZEWwoxfK1+u71M6Y71itEBhTBhYHZl3XbcZc=;
 b=vkUUUJmuYZ0CqfL50zjFzv2gv7DjHfxpx0r4x2vhOjZZ3LMyhN3/BgLaLXgzm1IllreAh7p/xkxAF8I8D/TkH6teDVdEZzGy9zJlXrlhn4N4OSe9lT1TSN12gOgP/Tr/akVhf+PbzQP8KjsiIXo02tpwVUmPWvPS61e2whdTJZFajQGzVHKo8cGVcMzqzL7dUsWv3S8+Y5p80HzCcwxcydqarEC218clQe2UB+LjSvMMf6yG5NeGO/7i33c9NUdAwgLNZCQy/pHBRFjrsUzkR7XhyRWUChREYpJYxn9yXCC5WTWYW2pWvwwjmIFG6eRCUh+91J1IqplJq2LpNRwAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rG587oZEWwoxfK1+u71M6Y71itEBhTBhYHZl3XbcZc=;
 b=WwI/TuRrME4d+YVuxQxdHd/CXg8bh8sYL1vGs+N3Gx79yiNVmEaMvH/oUZiu0j6fJYDGrRPmuYHwhMVOVYRBVcsMfY6d55czj+R3oTkKlMOU6YlHe5dmefH5ysudhkQ2TUVsMZDsojPJwRuKUuUZ+L4nRW9yRnaji6z6aIz7kes=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Hans van Kranenburg <hans@knorrie.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <JBeulich@suse.com>, Maximilian Engelhardt <maxi@daemonizer.de>
Subject: Re: [PATCH] ARM: Drop ThumbEE support
Thread-Topic: [PATCH] ARM: Drop ThumbEE support
Thread-Index: AQHcZHiHHimnEym6ZUmnz/k7agCZbbUQOtwAgAAHNICAACU0AIAArG6A
Date: Thu, 4 Dec 2025 07:19:35 +0000
Message-ID: <A58EC61D-A05E-42B6-B541-60F577AA222C@arm.com>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
 <f081cd84-a626-4b02-8c8b-6c0c0b723b84@xen.org>
 <875a6a6c-f81f-449e-bd57-7e720d07e8a2@citrix.com>
 <9ddb8824-2d88-444e-819a-e46be4b406d1@xen.org>
In-Reply-To: <9ddb8824-2d88-444e-819a-e46be4b406d1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV1PR08MB7732:EE_|DB1PEPF000509F5:EE_|PAXPR08MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: a9106228-9aa1-4e70-0d61-08de3305a2cc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OFBBT2tYbGNZM2tYVlR4aUMxeC9JSmRkMlBURjUrUGIxVmcyT2ZueHRSUTg2?=
 =?utf-8?B?VnBrR2Z3bStqNGVkRnVuNFJrOFRkaG9JZkNTMGgvcjBjcDU0NzdIV211Zktl?=
 =?utf-8?B?ZjV2M0hlUENNQ1ZiTzlQaTY1c3BrSGFQMEREVXdZeVoxc0lzVlBZYjFOVlJn?=
 =?utf-8?B?TEtKSzZnaEVHOTB5dWtlTWhQMFdKcHF1RkpXSUEyMGNnYnkrSVBHYzRZQWNG?=
 =?utf-8?B?UTVaRTM1LzVYSkdseUROOXlManNveUIxcWVERGh1eUZ3ekRLM3crVWJseVM2?=
 =?utf-8?B?TmZQYzNJWDZkVUwvMXB5TUUwcU9hdkxtUHBQMWZCRndEbHBhR2FPdjJlZWxj?=
 =?utf-8?B?UWFvemtKdXJqWGtDT2V1eklianpvZDBaTStUaDNwaitTN0ZlSmZBUFJ0M1N1?=
 =?utf-8?B?Tno0RFJHOGhZUmtpYVZabWpqN05CN1hsVEN1Y01iY1hlekJoM0cwYTZSZm5K?=
 =?utf-8?B?NlVQMkpXU0tFMEtIN3J3cmhQcFZBSmhHK1ZNMHZwaExkNjA2aTlTMjRSUWpL?=
 =?utf-8?B?VXlMSTEvVjJibzdhcnA5MXdSdFcwQ3VNRkFIck9VOXVCMlRQUTZ3ZDZRcEgw?=
 =?utf-8?B?eUxyQjU3cUI4ZTdoMmFIdVE3TzhpR280MXRxc2cwU1ByY2dyK2Nrd0MwWUFN?=
 =?utf-8?B?bXYycC9GcDd1Z3NCMHduM2I0ditlMHdpMHBuZXRxaGZ0SFBCT21wYjN5eU4v?=
 =?utf-8?B?RTJHQU8xQnBvWmY0dG1SL09BQXRzLzJYajN1RE1vd2YxOW1BbGN5Mm9pREwz?=
 =?utf-8?B?RENuTml1WlR3WDhhR2JxNHNVdWE3Rm9UQTdmc3MxQ0pEWGZpRUxPQ2VxNDY5?=
 =?utf-8?B?ekdCZFl0N090TDZjRmhBTy9UNkxWL3VkNy9MblFxSmMybEVST2pjWFdDN3FX?=
 =?utf-8?B?d2dyWHVoQ3B3MjFUYmJqZ1diQndxUFd4NXhpOVZ4MDVLTDNLWGptSHFDZ3dK?=
 =?utf-8?B?L1Bud0MzTVpxcUhyK3Z5OVJab3BrWXJEVFo0dEtnSkxHdkJGNnltRXNGTWZG?=
 =?utf-8?B?WFVmV2tOekh5LytldjRpNjl1TnA0aVNiVGVWSjhZdHpiVlUrWW9tN1hWRXg2?=
 =?utf-8?B?aHVXSGpaNFFja1U4VmtBUHJveGE2MHpKWlFsMlRaZmYwWDIxeFZCekN0NU5k?=
 =?utf-8?B?K2lNVHhwMzJzRnRLU2gzTDBIRFhBTXdySUtHVjZVY3owcXJLaENxeWxaRzkv?=
 =?utf-8?B?dy9JN0tPY2FXUTJ1cFdEQ3hGV1lvTW9jbFRKUU82Yko3cWNydVlhM0dhUmFt?=
 =?utf-8?B?bm91bW5WaXpER3VTTlpPeWlLUExpcXhhMlFVbHY1WTR4YVJRV0FPUkhnemRs?=
 =?utf-8?B?b1JIN3kxTE5tMzY0enJBemw1TG5oUnhPREpPUnRzZkptbHRmZFJlZ0Q3Y3NM?=
 =?utf-8?B?Zk5FeEk2Z0RodGhpYVdzZis2UENza3VLY2FuZDBtNTdDTkw1N0ZDbm1xZUgw?=
 =?utf-8?B?Y0JCaXBXR2NIOHJHbFZ5eEgyOWh4UGdkWW1LaVd4NWEra3kxUXg4YTFqSjYx?=
 =?utf-8?B?S0h0dStJZWc3UitMRlRmQ3FRa2NKdmxCMy9GTVBLbGd1Z1gvQXZpbFU5Skpy?=
 =?utf-8?B?SXdQWmp0YjVJNDg2dHpOYjNrdm1MVVZFMTVGSzFSbHFrU0VWV3RKTGxQZ2VE?=
 =?utf-8?B?b1M3NURwbnpCRXZublZuRXVoZWhXTGFRVjhDT2ErdENmVjNGQm5YNk9Wd1Z2?=
 =?utf-8?B?endFQUV1VDZsM24reit2QVVBNUxBZ2Y4aEhqVEZJWTZEenNNRkV6S3hyNitU?=
 =?utf-8?B?b2xGL2pleXBKMDFMRGtlWXI3TmpsZkxQMzZmR2t6NW1wOCtoM0RMQXBWZkFH?=
 =?utf-8?B?S2ljMG0wU0tUYVdGdW1rejFUU3U1bFlHQkY0S0Rmc2UrUXYzb0NyVjFacEE1?=
 =?utf-8?B?djFTemZENU9KeWVYY0N3eDErcTVkeFhOQmlyb09tcnZNWkU2ZWZtd2ZSWXZ6?=
 =?utf-8?B?eTY5TnNLRU83Q3J1MDZFc2tzWGtPWHBUOWFaMzFCZk5ML3dkS25HOHNwYnox?=
 =?utf-8?B?Q2RRbkl5bjZodkVMWlVxYTNSSG9ZOG9ESWtMa1JXTXNWTDA1cHlYc01Vam0w?=
 =?utf-8?Q?A6PMbz?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E85492E474FB7E49B3F293B6AC8BEF5B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7732
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c660111-9178-4b25-0756-08de33057ab0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|35042699022|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEQ5b2MyOHNmRGZjUExDaytXN0RvbjlDQWRvU3BzZnUwTXhtWEE2WFlvdEU3?=
 =?utf-8?B?dkp0UDlPTTNyZ2VDd3NLaWpBVlNobzlxS08wK0xxM3ppTWRmSnpkUXpTLzBW?=
 =?utf-8?B?c3JZblNuVzdzNWpsSjI5dEt6ZCtWQ1dOWE5BR2NPWTRJcjVlcDFhRmxNVkJE?=
 =?utf-8?B?aWlaSi9uaUZxVE9DVVUxUlZuKzdCOUJ4UkN5aWNacEdVZm9IN3kyOUVSMGN3?=
 =?utf-8?B?M25Td2x0ZWllcWdoZURZb3JnS1pwSkdoZDE2bk1pM0ErVzlmOWNiNThKRzd5?=
 =?utf-8?B?cFJQUTBvN2o5dFNpV1dsWkgwaUJvMVljbjhmMnVVQ0FkYjJWcjRJSm1KRFBF?=
 =?utf-8?B?Z21VeGZtZWtXVVU4WnA4S3oydzhZY2FBdkcwS3NlQ3VOTjlwYUdFbERLd0pz?=
 =?utf-8?B?b2t1dUZVcFFtVTJNNUNya2hmN0p4TlowUXlWd0dONWNsVXRMMlZKclNmSkRt?=
 =?utf-8?B?NlllQkY3MWJRNXFPUDBoVkt6M3RvM2tZMGhsbG05ZlZzWDZLUi9BS1FjQjdr?=
 =?utf-8?B?TzFzTVgyK1lkUXllc3lVMjdGT1dCWGRldjExcUo5enArdXp2QzA3ZGdZSFRX?=
 =?utf-8?B?RWxCS01hKzVOZnI2S2ZkU2cxWDEwOUtxZS9PRHhmeFVUajNFb0VtaXFlWW52?=
 =?utf-8?B?MmtJS0N3RkpZcnptaXZKRi95bm9DSWs2QzJudytvL0dWTVh3RnNuZ0dBeGJX?=
 =?utf-8?B?WG5qRFNFdUdzb1h3SGZhZmZHVUl5SG9TRmlUajcxWDNaN1BRMlVZdFAzTzBY?=
 =?utf-8?B?cnU0T00rQXA0Si9qaWdtd2ZjQ1JhdUlJQkxYc0J6UHNwek1tUk1jVmpFOHpu?=
 =?utf-8?B?alBYOW9nRWdmUTdlVEFoa1AyWktnNG1KR01YTlE1WENLSDR0R2ZqajdpT25m?=
 =?utf-8?B?b0dNeEY1cS83NmNHOWlmOGdtb2tiWC9lZWY5VXAxM1RSWElGcUpnMlBYM1Fj?=
 =?utf-8?B?eDh4TjFRbHJSS1ZFVHR0TXBpSFM1d3JFalhNdkhNRS9leS8xbW5Zb0hTZmd6?=
 =?utf-8?B?dVJ1dzVzeWpmVU5VbmpFTC9KK2Z0dU9GUlV5ODJZZllkdTc3MWVrc2czeVdq?=
 =?utf-8?B?NTdON3ZETlNVaXJwSXVLbmcrU0xNT2Z1T3FGclo0bUZ2eVVoajc0czFWR2xL?=
 =?utf-8?B?QXdFNU4vV0k2OHZSSC9RRWVEN2w1YVpjVnF3TXBiWmpmakFhZi9PK2lWeVlS?=
 =?utf-8?B?TlNoMWpzK2hSL2xocTdSSGsxRTVHekgwN01kUVRoK1hRY1oybGpWYnA4cE9Z?=
 =?utf-8?B?SkROKzRRODRpcHhQYURTUThBVkdKSElTTVIzOUhZQnJ1bGZXTytjNGZZanQv?=
 =?utf-8?B?Z1lOVWJEeEcwdTg4RHVic3A3LzVIc3hYNW1yUnFJdDQweVRQdTZuOVlzM2hp?=
 =?utf-8?B?TGo4cjJuYnFrSnlsdGxFSVNMUEd0WEJwN0F1eFA1MGtQYlNkZzIxV1E0Y0Np?=
 =?utf-8?B?NEJ5VWRqUVVCWUxnSCs1OXBiY1NIRGlhWlNWSFMxcmc2NkM0WWJ3cG5kcWhz?=
 =?utf-8?B?SHVYcW9Ebi9yY1E4SU9YTW94VGYyaC9heThlQ2J5UXNlVU5UQ3QwUU5MM29q?=
 =?utf-8?B?SlhNRkRTeThuTTc5bWNFS1c0SnlnVllaa0pEMlBuS2dBTXhzSXMvQWp2YVRI?=
 =?utf-8?B?cytqRDJrM0JsU2pSdkFML3RQQU9mOUZXcDJkd1V1QjdvWWdiU1hzSGxpTkFz?=
 =?utf-8?B?YStOVmZ1Z3g4Y2ZWeUxSaXRUNHBHR0VYS2dza3V4Q0FiQjA1OFRFVDhrSzlN?=
 =?utf-8?B?WHgxUmRIVlh4VXBGTUdRZmV4RUJRMXA5UGNFWDZ6L3pqLzhJeUlUVjdrUXVC?=
 =?utf-8?B?ME03N3BKK29iN0VkUHZVRHdMdEZUUDVIYXppOG55R3lUaTM5MVlnZXQ0dnZi?=
 =?utf-8?B?dEVwMlozODJMYW5jdHd6eTZaVDdPYWhzTEZyK0Q2TnhXVkZmdG1lVEZXVWR3?=
 =?utf-8?B?OHRHc0xaUjVGbmVlMmxzcjVNa2V4TEJvMjZXaVNPc0tCcVVqazN0WStla24v?=
 =?utf-8?B?MUZRUUpBN2U3ZWxsYjZ5SlQreWFwTWIvNXVlT2dXTnBla1EvZDQ2bUdRNnZW?=
 =?utf-8?B?ejBYUEladFUraE44QW14TGRZcFRscUxJK0x5NS9WcDJaTkhNY3pQbWQ2a2sy?=
 =?utf-8?Q?VRaU=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(35042699022)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 07:20:43.1230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9106228-9aa1-4e70-0d61-08de3305a2cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6509

SGkgQW5kcmV3IGFuZCBKdWxpZW4sDQoNClI1MiB3aGljaCBpIHRoaW5rIGlzIG9uZSBvZiB0aGUg
ZmV3IEFybSBDUFVzIHRoYXQgc29tZSBwZW9wbGUgYXJlIGxvb2tpbmcgYXQgdXNpbmcNCjMyYml0
IGluc3RydWN0aW9ucyBzdXBwb3J0IFRodW1iLTIgYnV0IG5vdCBUaHVtYkVFLg0KDQpUaHVtYkVF
IGhhcyBiZWVuIGRlcHJlY2F0ZWQgc28gSSB0aGluayBBbmRyZXdzIGNoYW5nZXMgKGluY2x1ZGlu
ZyB0aGUgb25lDQp0aGF0IHRyYXBzIGFueSBUaHVtYkVFIHVzYWdlIHdoaWNoIGlzIGRlZmluaXRl
bHkgcmVxdWlyZWQpIGFyZSBPay4NCg0KRXZlbiBvbiBDb3J0ZXggQTE1LCBJIGFtIG5vdCB0aGF0
IHN1cmUgdGhhdCBtYW55IHBlb3BsZSBhY3R1YWxseSB1c2VkIFRodW1iRUUuDQoNClJlZ2FyZHMN
CkJlcnRyYW5kDQoNCj4gT24gMyBEZWMgMjAyNSwgYXQgMjI6MDIsIEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQW5kcmV3LA0KPiANCj4gT24gMDMvMTIvMjAy
NSAxODo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDAzLzEyLzIwMjUgNjoyMyBwbSwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEFuZHJldywNCj4+PiANCj4+PiBPbiAwMy8xMi8y
MDI1IDE3OjE2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+PiB0byBrZWVwIGl0IHdvcmtpbmcs
IGJ1dCB0aGVyZSB3YXMgYXBwYXJlbnRseSBubyB1c2Ugb2YgVGh1bWJFRQ0KPj4+PiBvdXRzaWRl
IG9mIGRlbW8NCj4+Pj4gY29kZSwgc28gc2ltcGx5IGRyb3AgaXQuDQo+Pj4gDQo+Pj4gSSBhbSBp
biBmYXZvciBvZiBkcm9wcGluZyBzdXBwb3J0IGZvciBUaHVtYkVFIGZvciBndWVzdC4gQnV0IEkg
YW0gbm90DQo+Pj4gc3VyZSBJIHVuZGVyc3RhbmQgdGhpcyBjb21tZW50Lg0KPj4gVGhlcmUncyBu
byBwcm9kdWN0aW9uIHVzZSBvZiBUaHVtYkVFIGtub3duIHRvIEFSTS4NCj4gDQo+IEludGVyZXN0
aW5nLiBUaGUgQXJtIEFybSBpcyBsZXNzIGFzc2VydGl2ZSBhbmQgaW4gZmFjdCBjb25mdXNpbmcs
IHRoZSBsYXRlc3Qgc3BlYyByZWxlYXNlZCBpbiAyMDE4IChBUk0gRERJIDA0MDZDLmQpIGhhcyB0
aGUgZm9sbG93aW5nOg0KPiANCj4gIg0KPiBGcm9tIHRoZSBwdWJsaWNhdGlvbiBvZiBpc3N1ZSBD
LmEgb2YgdGhpcyBtYW51YWwsIEFSTSBkZXByZWNhdGVzIGFueSB1c2Ugb2YgdGhlIFRodW1iRUUg
aW5zdHJ1Y3Rpb24gc2V0Lg0KPiANCj4gWy4uLl0NCj4gDQo+IFRodW1iRUUgaXMgYm90aCB0aGUg
bmFtZSBvZiB0aGUgaW5zdHJ1Y3Rpb24gc2V0IGFuZCB0aGUgbmFtZSBvZiB0aGUgZXh0ZW5zaW9u
IHRoYXQgcHJvdmlkZXMgc3VwcG9ydCBmb3IgdGhhdA0KPiBpbnN0cnVjdGlvbiBzZXQuIFRoZSBU
aHVtYkVFIEV4dGVuc2lvbiBpczoNCj4g4oCiIFJlcXVpcmVkIGluIGltcGxlbWVudGF0aW9ucyBv
ZiB0aGUgQVJNdjctQSBwcm9maWxlLg0KPiAiDQo+IA0KPiBJIGhhdmUgYWxzbyBjaGVja2VkIHRo
ZSBUUk0gb2YgdGhlIENvcnRleC1BMTUgKG9uZSBvZiB0aGUgQXJtdjcgQ1BVIHdlIHVzZWQgdG8g
aGF2ZSBpbiB0aGUgQ0kgYmVmb3JlIGdpdGxhYikgYW5kIGl0IHN1cHBvcnRzIFRodW1iRUUuIFNv
IEkgdGhpbmsgd2UgbmVlZCB0byBhZGRpdGlvbmFsIGRpZmYgeW91IHNlbnQgaW4gdGhpcyBwYXRj
aC4NCj4gDQo+Pj4gQXJlIHlvdSBzYXlpbmcgdGhlcmUgYXJlIG5vIHByb2Nlc3NvcnMgc3VwcG9y
dGluZyBUaHVtYkVFIHdoZXJlIFhlbg0KPj4+IHdvdWxkIHJ1bj8gQXNraW5nIGJlY2F1c2UgYmVs
b3csIHlvdSBhcmUgcmVtb3ZpbmcgY29kZSB0byBjb250ZXh0DQo+Pj4gc3dpdGNoIHRoZSBUaHVt
YkVFIHJlZ2lzdGVycy4gQnV0IEkgZG9uJ3Qgc2VlIGFueSBjb2RlIHRoYXQgd291bGQNCj4+PiBl
bnN1cmUgdGhlIHJlZ2lzdGVycyBhcmUgdHJhcHBpbmcgKGkuZS4gSFNUUi5URUUgaXMgc2V0KS4g
U28gd291bGRuJ3QNCj4+PiB0aGlzIHJlc3VsdCB0byBhIGNyb3NzLVZNIGxlYWsgb24gdGhvc2Ug
cHJvY2Vzc29ycz8NCj4+PiANCj4+PiBJZiB3ZSByZWFsbHkgZG9uJ3Qgd2FudCB0byBzdXBwb3J0
IENQVSB3aGVyZSBUaHVtYkVFIGlzIGF2YWlsYWJsZSwNCj4+PiB0aGVuIHdlIHNob3VsZCBjaGVj
ayB0aGF0ICJjcHVfaGFzX3RodW1iZWUiIGlzIDAuDQo+PiBUaGUgcmVnaXN0ZXJzIGV4aXN0IGlu
IEFSTSB2NyBvbmx5LiAgVGhleSBkbyBub3QgZXhpc3QgaW4gQVJNIHY4Lg0KPj4gSSBzdXBwb3Nl
IHllcyB0aGlzIGNoYW5nZSB3b3VsZCByZXN1bHQgaW4gYSBjcm9zcy1WTSBsZWFrIG9uIGhhcmR3
YXJlDQo+PiBzdXBwb3J0aW5nIFRodW1iRUUuDQo+PiBDYW4gSFNUUi5UVEVFIGJlIHNldCB1bmls
YXRlcmFsbHksIG9yIGRvZXMgaXQgbmVlZCBnYXRpbmcgb24NCj4+IGNwdV9oYXNfdGh1bWJlZT8N
Cj4gDQo+IEZyb20gbXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgQXJtdjcgc3BlY2lmaWNhdGlvbiwg
dGhlIGJpdCBkb2Vzbid0IG5lZWQgdG8gYmUgZ2F0ZWQuIFRoZSBBcm12OCBzcGVjaWZpY2F0aW9u
IHN1Z2dlc3QgaXQgaXMgUkVTMCBzbyBpbiB0aGVvcnkgaXQgY291bGQgYmUgdXNlZCBpbiB0aGUg
ZnV0dXJlLiBTbyB0aGUgZGlmZiB5b3Ugc2VudCBpcyBjb3JyZWN0Lg0KPiANCj4+IElzIHNldHRp
bmcgSFNUUi5UVEVFIHN1ZmZpY2llbnQgdG8gY2F1c2UgYW4gdW5kZWZpbmVkIGluc3RydWN0aW9u
DQo+PiBleGNlcHRpb24gdG8gYmUgdGhyb3duIGJhY2sgYXQgYSBndWVzdCB3aGljaCBnb2VzIHBv
a2luZz8gIChJIGd1ZXNzIHRoaXMNCj4+IGlzIHJlYWxseSAid2lsbCB0aGUgZGVmYXVsdCBkbyB0
aGUgcmlnaHQgdGhpbmciKQ0KPiANCj4gSSBiZWxpZXZlIHNvLiBUaGUgZGVmYXVsdCBiZWhhdmlv
ciBpbiBYZW4gaXMgdG8gaW5qZWN0IGFuIHVuZGVmaW5lZCBleGNlcHRpb24gaWYgaXQgY2FuJ3Qg
aGFuZGxlIGEgdHJhcC4NCj4gDQo+PiBJJ2xsIGZyZWVseSBhZG1pdCB0aGF0IEknbSBvdXQgb2Yg
bXkgZGVwdGggaGVyZSwgYnV0IHRoZSBidWlsZCBmYWlsdXJlDQo+PiBkb2VzIG5lZWQgZml4aW5n
Lg0KPiANCj4gSSBhZ3JlZS4gRG8gd2UgbmVlZCB0byBpbmNsdWRlIHRoZSBmaXggaW4gNC4xOSAo
SSB0aGluayBKYW4gYXNrZWQgdG8gY3V0IGl0IHRvbW9ycm93KT8gVGhhbmtzIGZvciBzZW5kaW5n
IHRoZSBwYXRjaCENCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K
DQo=


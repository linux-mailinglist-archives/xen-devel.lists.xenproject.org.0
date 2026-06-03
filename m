Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MlXTJDx+IGop4QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A5163ACB2
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="dkBwB/UF";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327048.1592282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7V-0002Mq-GA; Wed, 03 Jun 2026 19:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327048.1592282; Wed, 03 Jun 2026 19:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7V-0002JM-C2; Wed, 03 Jun 2026 19:19:17 +0000
Received: by outflank-mailman (input) for mailman id 1327048;
 Wed, 03 Jun 2026 19:19:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUr7U-0002FY-0M
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:19:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUr7T-00GtBE-DM
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:19:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e30-5cb7-0a2a0a5109dd-0a2a4505df40-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:15 +0200
Received: from [52.101.43.51]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e31-aaa8-0a2a45050019-34652b33fb25-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7094.namprd03.prod.outlook.com (2603:10b6:a03:4ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:19:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:19:11 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYqvcQg2khEAWcwVjHgNAdxMFyRUsF65euyJgbVeM3j4STQt/Z9AYt6CdlSlzMQTyqh5ktgKNUBFd2x44Vk4xJcjTuaM+c6mgfjeT2dSe1lYRIT+toH+NGhJnmPn3IGoXKwSbLCfJL8OX+y+FTYzJ9Kspqn3a+O/YeM0owW99/9ORZjSDUzz7AQi42Z1F0UDQZqy29rKV1foLnpV95gL/GDO7YMnUko/BhauB161e2TzUerwt7DThw51t/Tsv9DHNuaa7m/AnqyzS4uBPsLqyjy8nIyo0ph8CHgx3A3y+fSOj7aCyNJjEMODAPq2JTkgeu/7w+DHw+t8eeUp1zIt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlBDS5/WxilHHnMTim1lkP8xSg+HVEVyGvnZB+I2/d0=;
 b=W9vdbhHHHv2ym89bKDsVbqFj/37gFLYWJvGMdO4W/mWccBoqzSv7+4CeuXFAUON8t/Z/ad84EFqCxfzZ/0dPscimJv0LfPPH5+XOd7Brtj68NSI2WJz4mKSiWBfxikB09pz9pOxth45mZGwzVmvUZgdgqqgILoiF3tYiWw5mSxTl9ZqdblGhuzJbeBD5KisIudr9hHYcZ31IXmEVZFsR/voMWSaBQZyXfqbOG+n1A535NwgEeXl8XH/qKj8jLW2aZLSbxBGGuXzApN2E7c0+lB2altbGXiO+zR+AM4JAqQmsa/vDBwpeguddcySta49UeRScZDqnfb2N7D+33Fjv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlBDS5/WxilHHnMTim1lkP8xSg+HVEVyGvnZB+I2/d0=;
 b=dkBwB/UF2ZhwMIiSAe2y7kLo8ou59mWbQV4XnWh6o5jXWQC9JT5vuplO7QpGjvnFiEJQXJJk4EoZqlKnm/lND5C4tdKU9VrY2y5v+xswSWs0zA6G6fyAe/h3Fyiv6tVa14Q0GH+K+nyafWA+oabNs7z1FCF3KAdTxSedVHKQFjA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 v2 5/5] xen/numa: fix setup of non-aligned memory affinity ranges
Date: Wed,  3 Jun 2026 21:18:36 +0200
Message-ID: <20260603191836.77955-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603191836.77955-1-roger.pau@citrix.com>
References: <20260603191836.77955-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:408:f8::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: b3906853-c3df-48b3-e92d-08dec1a4fe0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	95HHjkClq7DlH8/4DAOCo3TneutDI2dTh2K2XA4jkMGT6KsMYxxac6iRgBocDs5RDS+8xN5B4OMxejmYWG4AdnyZCJJBqDj8nehAYoU26jpHKfXcaCbv3Hoojtg9mqrgdpSSCVxOeRDHbv+wQWXESm3FMsKENYj3mEvgC3eZOgyACpAmKFX3Fa7WobE2Z2AJQdI3OYoOzRg4ApI/gvWI+dgowYCmWvurcGg9V7ef7kDfkEcfsr5MWdo4lz8QgXl+dXAwRpHEeGpr0ebZhv7aCYUaxP0Gqx7AfZJI8NW19ORkw4ykS+y1wLiDx9dVkhhN5USMpqtf93OiTSKwVtVB5weB3jpDAVGAUXlN7X4Z5VZT+PCuu/aKXdMufAZvTByBqEdM6SLKjzQX2NnL7Il1SDEeg4hY9kWjpgY9remCZ4Ftg/Q+MLrlTxElJFY57D4dk1hoCZXHwV6vaYS0xoTMw/jT1iNo5U+7Dx1m/Qx4sg5u5MEImyqlyMDmMfLJuz07plxhcGvZM2q9GMWqQo1UWa9Rqk5RvQJw5zG5li3rnGv7JECuEr/WRc3IySuDWDCsjWlO0dqJdrcEbDPQowalIS7V0oPmvHwk2PCCEiMlCYfroNI7z9MsrRzIXX2GMCbXNJ+c/lmfpsyyoP07FNPjxOfCny5YZ7R5O3vVBfC4XRkwS/420vqcg2Ow/fLlzJ3e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N29uQlowbExpTGpOZVBuaTIwWFJlbGxvV0wrUGtFbkluRW5GWUQwRWgycys5?=
 =?utf-8?B?RVFHZWU3SlNYNGdPSjltN3lTQ0RKRzF5Q1VuVGdlSldGYXFDRFVuWmc2K2hj?=
 =?utf-8?B?a1hxM1RwWW5ZeWVMeUxPblk2OGU4KzhFQ1ZncHFQU3FDSHk4NjdQT1pjMzhi?=
 =?utf-8?B?QWJwcVI3emthcGwxcFNRaWt0OUZaVFVvNXNUaHkzU1dkWUJNL2wrU29vVXc3?=
 =?utf-8?B?UDAzejBYU0g4OE1iTWc3QWZvazNDUG5PMi9EdTV3QTlaanB4NjVVNGgxWnZK?=
 =?utf-8?B?NnR2QWdnSzVVaXRXM1ZKazRTQTZiK0FOUkFhTGNqaWtlRWU4ZmhDSlVaT2kv?=
 =?utf-8?B?b0dUQzdyZWFMVmE0b0lTd1p1R0tDcExSZmZvdE1kcHpaNzVqTFFnMnpOUUJH?=
 =?utf-8?B?bHpNY0dhK1U2aTcvUk1ZYkMvVnQyYTlZOVlhRUExejlheWVlS3o0VWtHTWJL?=
 =?utf-8?B?cENUTzRBUDh0NEJWRDJvNXJEd21RZHUrMTVoSU1KTGNVMkRQT25pN080cnV3?=
 =?utf-8?B?dUFjSngwemRMeVh6ZGg5UFVYekNVTG1IdGx4dDNHUXZ5VnVrNU45SVZLM0Vi?=
 =?utf-8?B?TFRWZDVqbnhiTVk4bjYrK1RZdTBDOW4zNW80U0lndWdNSVFkcnB4b2poWTE5?=
 =?utf-8?B?Smw0cVZOc2VGcW5oOHFJeTMvUDRrZXFTMGRGMmpNNmQyR2tvRE5kL1BkbTUz?=
 =?utf-8?B?ek9WRFVwTEZ3MzhGK09wZ0ZRRG9OVHFZYy9CWE0yTGJxdXB4dkVvZDI0bys5?=
 =?utf-8?B?dWkyamhDbzhqNGdNT1JYNmljMDJaS2lCVHBHZVRHMXhhOU5YTEVUTEFxMDdB?=
 =?utf-8?B?VStlcUx3ZEFYTVlicWFNUmVnQWp3K1BaT3V0S05VblRlSTZwVGxqN2kwdUlr?=
 =?utf-8?B?cUJlcXpxMmx5cVJzWXpjdSt0elVkMDA1bDU0ZEkxdm91R1R4VnpDTmZZU091?=
 =?utf-8?B?TEp4b3VleE95RE83TmNDbnE3RjZHY1JmMDl5MWh2akFWdkxvWnI3MzcxLzlX?=
 =?utf-8?B?OTgvaWhoRng5S3BqaUo0SlZXbkFOUDI0V3ZSYWM0eEJNMEpiS3Vkam93TXYw?=
 =?utf-8?B?eU1obzRhMVJjclZncUgycnFycFRzWHgyNDNzdGJtT0NUQzJiZXRoVHBPZ1Nk?=
 =?utf-8?B?MmlBM3ZRUTJsWmZSbUwrVkRSSENmODlmY3J6MjRvZmhXNnJ0N0dnb012Wnd6?=
 =?utf-8?B?UytWWTVpOGdiUlJWWHhGY3dWbVZXS2p2UkkrRzNqUHl6clFheW9Zak5GSWNX?=
 =?utf-8?B?OVN3TEZ5NWVVSzNjYThxRUs1cmlzTTRoNVNOTUp0Q2FlVEp5MWFIcytFRzZ6?=
 =?utf-8?B?WUVndjRMOUY0YnNCNVJSWWJkL2tNb3BydEJMMDdCL2ZnSnowVzhaYkFlYlFq?=
 =?utf-8?B?NFFhemRHWUlMTHp6UXI1UG1aQmVPTnFUZzJyZitYRVhjNGdGbUxtWEdQbklz?=
 =?utf-8?B?VVVLV2xybnV0cVF6Z1NBWm5nQUZvZG5yWndYSk5iNnFyZmh3UnpFazd6ZVk3?=
 =?utf-8?B?OGdkU0FHc1hLNG9FTFdRd2M4YU44WTdkTjErSW55SW54bWRDRHV1YWloaTZz?=
 =?utf-8?B?TjhSSFk0MG9VRWVDd3VSSGZkZVc3Q0s1OForVUI1L2hxaFhna25FQ3FySU44?=
 =?utf-8?B?bFhQanA2R1JYWjFSVDRDVHBJcGRrUjVweDlKNURvT0hvUzJXR0diMUJIcjlC?=
 =?utf-8?B?ODk0cHUrM2VEcHJybUpseDRCa1kxeXkyVzFNQ3kxQmF5R01jOFQ0dks3bHpG?=
 =?utf-8?B?Sk9vekdzM05URXJ5S1l0Y1I1cTdpT3B2eUZGNXJQajdlSEhHeTFGSmQyeWpZ?=
 =?utf-8?B?ZHBET2hQVEd0UmN1YnNnaURnTE1IV2tLOHMvR1RaMkpqTVJJVXhyeTJqMTBt?=
 =?utf-8?B?MkJqdks0N2UyZ0loamoyblM0RDdVcERaOVo3V1FVUC9pa1hlb2NQSlpqY3o1?=
 =?utf-8?B?b2xrd0lUTWNLL3hMN2FicWc0QU0zdkFJSm9rMjZIMk4vNDUxM1pwRDF3d25q?=
 =?utf-8?B?enBCVkRPZ2M5aU1XamRvRW9uYXJNa3I4Z21vdzZ5TE1XUmYvRjhEVUgvRFky?=
 =?utf-8?B?V256aVEvTWpDM3lvT0lEYXZLT2hWMkFMbXdhajlCN2hXTkZJQkVualdmd1Fa?=
 =?utf-8?B?TVQvaTlGalEvV0VYaHpHZmxuU2tVdW55VXg3bW83WFBWN3hmY2s1cnJyOXpz?=
 =?utf-8?B?Z0RMWkU4c3FCTHdoOVk1MXNzb21DaDBWNFFIVDFKQVVJRHQxaWI2VStxTHNJ?=
 =?utf-8?B?cVgyb3Fza3NxQnFpWmowY2w3YlAwWk5Td20zT1krQkVaMmpkaEdxMjlEYzR3?=
 =?utf-8?B?R1NoTlRad0w4aTk2Y21KWHQ2ejZSZ0UvVTBiVXhRM3d0YnVSYTBTQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3906853-c3df-48b3-e92d-08dec1a4fe0b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:19:11.6237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ijBlQAtEkp6dHK4AxrGlNrf+2CDKSXmiwWjo8xcXH0fE8xWy7U7hj5jK8Xk8SH/XP+iv5HDEQxcxsbS+5zNPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7094
X-purgate-ID: tlsNG-c201ff/1780514355-E338A443-D7E8248B/0/0
X-purgate-type: clean
X-purgate-size: 5490
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29A5163ACB2

The logic to populate memnodemap in populate_memnodemap() assumes that all
ranges are aligned to the hash shift, this however is only true for the
first address in a memory affinity node.  Any subsequent ranges belonging
to the same node might not be aligned to the hash shift value.

Such lack of alignment causes issues to the logic in populate_memnodemap(),
as then the tail of the range might not be properly accounted for and setup
in memnodemap.  Fix this by forcing the start address of all regions to
be aligned to the hash shift; if such alignment causes a region overlap it
would always be between regions on the same node, and hence will never
cause setup issues of the memnodemap array.

Introduce two additional test cases to the user-space NUMA setup unit
testing, first test case is the native memory affinity and memory map of
the system where this issue was found, second test case is a simplification
to demonstrate the original problem more clearly.

Fixes: 1666086b0044 ("x86/NUMA: improve memnode_shift calculation for multi node system")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Do the rounding after the checking.
---
 tools/include/xen-tools/common-macros.h |  1 +
 tools/tests/numa/test-numa.c            | 45 +++++++++++++++++++++++++
 xen/common/numa.c                       |  6 ++++
 3 files changed, 52 insertions(+)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 9e2799178235..88b4a0e5a693 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -69,6 +69,7 @@
 #endif
 
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
+#define ROUNDDOWN(x, a) ((x) & ~((a) - 1))
 
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
index bced68d4d7f1..8122e63a88ed 100644
--- a/tools/tests/numa/test-numa.c
+++ b/tools/tests/numa/test-numa.c
@@ -158,6 +158,51 @@ int main(int argc, char **argv)
                 { .start = 0x183f8800000ULL, .end = 0x183faabffffULL },
             },
         },
+        /* System with unaligned affinity memblock. */
+        {
+            .affinity = {
+                { .nid = 0, .start = 0x00000000000ULL, .end = 0x000afffffffULL },
+                { .nid = 0, .start = 0x00100000000ULL, .end = 0x0fc4fffffffULL },
+                { .nid = 0, .start = 0x10000000000ULL, .end = 0x103ffffffffULL },
+                { .nid = 1, .start = 0x10400000000ULL, .end = 0x203ffffffffULL },
+            },
+            .ram = {
+                { .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
+                { .start = 0x00000100000ULL, .end = 0x000165bffffULL },
+                { .start = 0x00016600000ULL, .end = 0x0001aa1dfffULL },
+                { .start = 0x0001aa1f000ULL, .end = 0x0001aa53fffULL },
+                { .start = 0x0001aab8000ULL, .end = 0x0001aac6fffULL },
+                { .start = 0x0001aacc000ULL, .end = 0x0006f3fefffULL },
+                { .start = 0x00075dff000ULL, .end = 0x00075dfffffULL },
+                { .start = 0x00076000000ULL, .end = 0x000a7ffffffULL },
+                { .start = 0x00100010000ULL, .end = 0x0fc43ffffffULL },
+                { .start = 0x0fc45000000ULL, .end = 0x0fc47ffffffULL },
+                { .start = 0x0fc49000000ULL, .end = 0x0fc4bffffffULL },
+                { .start = 0x0fc4d000000ULL, .end = 0x0fc4d3bffffULL },
+                { .start = 0x0fc4f000000ULL, .end = 0x0fc4f0fffffULL },
+                { .start = 0x10000000000ULL, .end = 0x203fd7fffffULL },
+            },
+        },
+        /*
+         * Reduction of the issue above: introduce an unaligned middle region
+         * with regards to the hash shift.
+         */
+        {
+            .affinity = {
+                { .nid = 0, .start = 0x00000ULL, .end = 0x00fffULL },
+                /*
+                 * The offset of the region below is not aligned with the hash
+                 * shift: the shift calculation only takes into account the
+                 * start of node address.
+                 */
+                { .nid = 0, .start = 0x01000ULL, .end = 0x04fffULL },
+                { .nid = 1, .start = 0x14000ULL, .end = 0x14fffULL },
+            },
+            .ram = {
+                { .start = 0x00000ULL, .end = 0x04fffULL },
+                { .start = 0x14000ULL, .end = 0x14fffULL },
+            },
+        },
     };
     int ret_code = EXIT_SUCCESS;
 
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 8544a1598218..92f8f1cedce1 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -405,6 +405,12 @@ static int __init populate_memnodemap(const struct node *nodes,
         if ( (epdx >> shift) >= memnodemapsize )
             return 0;
 
+        /*
+         * Round down start address: if start is not aligned to the memnodemap
+         * chunk size the tail remainder might not be added.  Overlaps created
+         * by rounding will fall into the same NUMA region.
+         */
+        spdx = ROUNDDOWN(spdx, 1UL << shift);
         do {
             if ( memnodemap[spdx >> shift] != NUMA_NO_NODE &&
                  (!nodeids || memnodemap[spdx >> shift] != nodeids[i]) )
-- 
2.53.0



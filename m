Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBqhM+S1hGk54wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:23:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242EF48CA
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222123.1530157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1C0-00015X-V9; Thu, 05 Feb 2026 15:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222123.1530157; Thu, 05 Feb 2026 15:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1C0-00012r-S0; Thu, 05 Feb 2026 15:22:52 +0000
Received: by outflank-mailman (input) for mailman id 1222123;
 Thu, 05 Feb 2026 15:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vo1Bz-00012l-IE
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 15:22:51 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81d60b51-02a6-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 16:22:39 +0100 (CET)
Received: from DUZPR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::14) by GVXPR08MB10543.eurprd08.prod.outlook.com
 (2603:10a6:150:15b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 15:22:32 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::98) by DUZPR01CA0012.outlook.office365.com
 (2603:10a6:10:3c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 15:22:31 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 15:22:32 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU5PR08MB10851.eurprd08.prod.outlook.com (2603:10a6:10:522::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 15:21:29 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 15:21:29 +0000
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
X-Inumbo-ID: 81d60b51-02a6-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ilIwo6X5a0p5o9sLT655X27iI7v4c3xJlMBQJm7O0c3W2utZUKVdKH0HtUxz5izlqa8H3S66pdbXZElrr7TVVXSIZPzDXyWQoSajoTVojfI6DtNmB71PdIS07qfrIPFafgjgFF8QetXrLRRgsYXd+tPhokJ+SQT5Ff4XD/ZFn9rxlLpzriHng5HGTs1y6flesG0ACvlNwVr+6QyXvfBp/M1m/KwcNh41B5FyXZHihJshspfKxDOpQx7uhRPo6obVzj/IJBFGszUmo0o/rvlPWMH5D17yCinp23GNJAw0mPBq8ct5Pr0TUJ8pgyxvsL7IUT43txPW7mb5FOza4yUIWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJxYP8Z+yZ6wCzrr0ORTtdyUimwFteTYhoYHE1xRPdM=;
 b=yB7dYCyP5e3nwl1BdA6d2/prMcZMGPl7qYuzprFmyGGQgls4e3DbSV39+7K8ZosyObSPpQcnQaOfyhwLbONXlTCCAYYmPRqkixxV5wvOA93RjdVzolIlMd9GvDYKB70hn3ipsqEXfH4kBuHcgA7gjQdmBn4ETWfP7d47Ep1Hf5rYnU/2+kxftqjogRmyD/untlZdFtv1ZI4/qvpiDNMUBroi7Amv2G8lsP5somWgJQlSJHufb+MjlpUPYs7IpGnOneDZczUByoBw0ka5HR8UZHwg69XLAIBRFCDtscLcWkjTvhTkmBvqV77nJHRMKAppSNzx77VTYfYYZ5n6J51ANg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJxYP8Z+yZ6wCzrr0ORTtdyUimwFteTYhoYHE1xRPdM=;
 b=O04m0hVfAximFOwk/qnnyNc6jIFzon5pN7qjOgC3o7vTRfKef55sMKfD5IL35hdXLSwidrq8J6AxUAl1p59qB76CbKNeN8oh6bDtlVt24JZZwmuLDHGrlVRiiFQ4MhT0YoLz7oekwE1hReVjMTXYvmZo/VZDFNlEZjEypJfM1W8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bycO4cGyeLpf+mtPR3gTnAEtB6MgckVGsdZ/2wK0Z4LJlSUYGDt8BnawCQ8JOfDCouQXJjjRskU/Zg4Ws80F1dHwH31XJzYyRibkkDzYVAGwrvYtqOLIqq0Fsv7/HONpNsdIXDLcB9VG/d7U99PlYzXKWbQ8wCY4YXbNtGa8qdyePYhmR8D8nc9KSpFh3FTPZ2qJ9emzMWd1M88sNsBqxFUJR277avP3FpGsu516V+3krkU8ndYYVCS+0zCuQ5fqcEH7ZaBBVi+secaD766eZmUClJ0D1LZnDQxfG8w2bfbiXTsOo7kGACqbSRf4wxiFXJEuCq6jhikLtgQdfFK4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJxYP8Z+yZ6wCzrr0ORTtdyUimwFteTYhoYHE1xRPdM=;
 b=CEzc7LpUY4WJHnaYuSnAOn78LdUdOx12mxkRE8xfScHbm67zWI4pgolkBH6cDAeY8xWyYcx/PLBy7Niv4X2xUNWKDYWae6SL3yr9fJdKVNEyxadvM1/sZIC9U0hqR0/yBB97FiKqw6myFTyORR7JWJ0zzPgNTshpcAZ96iUfT+eFQCU+vYCOraP5dkxlP3Ouh+zlngGOK1CRe44RWlQlvL49jqQS+bLDTKww77AHOrPBUMXQIWjPHeHLUF3RE+XxUFRqZu5ySoVvNRW9XvFR7x9CZMqXMOYl2jZQjlqQjidyVndxBm4xT982eC3JgFQpIglPml5cqCIad18eqJyZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJxYP8Z+yZ6wCzrr0ORTtdyUimwFteTYhoYHE1xRPdM=;
 b=O04m0hVfAximFOwk/qnnyNc6jIFzon5pN7qjOgC3o7vTRfKef55sMKfD5IL35hdXLSwidrq8J6AxUAl1p59qB76CbKNeN8oh6bDtlVt24JZZwmuLDHGrlVRiiFQ4MhT0YoLz7oekwE1hReVjMTXYvmZo/VZDFNlEZjEypJfM1W8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: use BSD sed compatible regexp in SRCARCH
Thread-Topic: [PATCH] xen/arm: use BSD sed compatible regexp in SRCARCH
Thread-Index: AQHclrAVmOqVSx0X9U6hX+RPaUIqwrV0NaIAgAADJYA=
Date: Thu, 5 Feb 2026 15:21:29 +0000
Message-ID: <5F704F5E-A754-4264-9121-56FEDA0EA02A@arm.com>
References: <20260205145913.99032-1-roger.pau@citrix.com>
 <2038c5c4-c542-4382-b89c-0082a51d6d2a@suse.com>
In-Reply-To: <2038c5c4-c542-4382-b89c-0082a51d6d2a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU5PR08MB10851:EE_|DB3PEPF0000885C:EE_|GVXPR08MB10543:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2d605e-f026-4897-e07a-08de64ca61f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TXNicEFGNHVWTm1mL2pJRVRzZnhvQW13VHE4TnFncFgwRk5RVWVIN29FWEcr?=
 =?utf-8?B?aWV4a1VIcTlkSHRWdVRxcHJLMlNMcXVGamVVRHdsZzA3emtGNVZONjVlSDNN?=
 =?utf-8?B?UjVOelVRd2RLYmRNZlJBZllHY2tTbU5yNUJyY2dacmsyQ1p2ZnNSWEJ2V2U1?=
 =?utf-8?B?OVh1RlJiK1B6Z2tzVnd1VHNEMEhXK0RKM2ozSDhVTndxWVF3TDg4VEtrMG12?=
 =?utf-8?B?eGxaUjl2Y3Q5MVNCazFZZzA3SVU5SDkwU3ZzKzI0UGo5QSttMU5nQjlHYWRX?=
 =?utf-8?B?YTVrTWd5NHNUc0VvZEd1R2VJUWoyY3kyRnFIbUticTI2ejZyOVVHS0hMN3V1?=
 =?utf-8?B?a2NWaVV2a2dnRzBRbkEzT3Z4aVVrcFFXZG9GL290RzhZbzlzUGJ5Y2VyRGk1?=
 =?utf-8?B?TjljMDF3R3pja3FKYVp1c21JckVnd1lBdlhTOVpkRWg3cGlMdTd1QVJNUVkv?=
 =?utf-8?B?TGQ0d2N4Uy9aWElLaXZod1o0c3FWUkNKZFAwa3NmbGU5OFhyQXNTRGQvUnpP?=
 =?utf-8?B?L1EzcE1pak53MkpiRWVXRXo1dVJoa0ZYNmdwSVM4SG9qQXFCUndHRWJpVDB5?=
 =?utf-8?B?dnR3UG4rZ2FsTFQxbmxNRU9FSEtDWnZwbkNPSUd6SE8zRlBwNnFONGdGUHVR?=
 =?utf-8?B?WWtuKzhsZVZTWFFYK3JtYXpEbU9ydDNWVjh5WnI5OVQrMHovKzdkb1FlOXRI?=
 =?utf-8?B?M2loN1hIL25JRFR1S2tKelVaT0VJOGZ5ZnpVU2RQYkpWNVI4b2xpTTNhYVkz?=
 =?utf-8?B?YU5iekVsRndnSFlzVlRLQTJkQVNUUWNCMERlYWQvUXdORktweUVDNDVXR2Ir?=
 =?utf-8?B?aGFUTFVUTmY3emNoYW1hZkFvanRqKzl5UFZ5UkRmUEZISEtjYjNyN2NOWnVy?=
 =?utf-8?B?UXYvZWptbzRpZnFDc214VnZkakpoYzg2c2Q3R0pzdEM0bUFzMW9IbHlSSE5C?=
 =?utf-8?B?c1crRktjT0lhYmZrbTY2UHFieXR5NEQrdGFTWFNOZ0hxa0ovTXlrYWlYRkFj?=
 =?utf-8?B?VkNkUXp0MGVpRFhWb1hpOXE3d2tvRkVqNDBtc1NvSmxuRW1YNER3a2Jkemx5?=
 =?utf-8?B?eGpDZUNhSExoTkdTcWs0ai9NZE1mMmdZRmV2LzVKQlN1VWtlNVBYaHhwNXJK?=
 =?utf-8?B?R2xYd3EvZFZsMlJOaSt2K3ptVXhXaU9FVXg5TG44QWFpQVpqZmJFVjNhTEkv?=
 =?utf-8?B?RTVmTUZCTnhNY21Ddzh2dU1UKzRnWWtIZGZ6WEpURnZJQTV5d0Vzak1aZVRi?=
 =?utf-8?B?bjRPYU5RcnJFNzNtMUI1WGFHS2JkcktNMUdpT3RWOVh6T282YzBEWGpUdWFr?=
 =?utf-8?B?ejNPTzRJL3dBVDFIdDFaZ0FiMkxjbENDQUZNdm1lbklHNWliejIrQmhMRnZR?=
 =?utf-8?B?QUZyaml2dEdGVU5PU015SlFKUlBsODUvNjQ4TmN6VnpQZ0FnYU42QzJBL3dK?=
 =?utf-8?B?c2wrWkZyY3g3Q1phMTFYVEd5SnlEZWx0SzRTcThqeEZzd1lBb1dnVjdJKzd1?=
 =?utf-8?B?VFpsYjhydEt5TlphcnpqZHE2VW5MKzY5SHdwdXpOdmFveHlQbjhUaGdUZlY2?=
 =?utf-8?B?ZE1heGs2Wnd3OFJpS1FKR0IxdDdXQ3BnQUFTLzYrU2tveGg2YmFrUnQ4d3JJ?=
 =?utf-8?B?MHFQZG5OMFJHOWdUSzRRUW1iVUNzaURPcE41WSs1SUJNeWNzT0tOMk9INklG?=
 =?utf-8?B?azBqdWZtWjVhS0gvTG5iK3hmN0V4YUtTcTdTVEVWRE91REt3NElhSndLSmdK?=
 =?utf-8?B?SWhNakIrdFV4ZVhEQWFQZ1Urc1dmTVgvbHhCVGdaalczWmRXUXJ5czVTeDQz?=
 =?utf-8?B?SkN6enRWOE9NYkVUOEdrM2lLbUtRa2xwT09Pc21KSU5DT0tkV1FCMllJbjZH?=
 =?utf-8?B?aHpReFl4MjA2MmdzTUFLc3hxYlJYK0tzQ3M2OGhTZ21LTm0wRit3dnRuYUZj?=
 =?utf-8?B?eFFYOGw5ekNtcjc4SlkwVk55NmN3ZW9wRk9LTk9QTDdHM3F6Y1BTN2lmYTU2?=
 =?utf-8?B?ZWd3VGdqTS91RnRpZlFSQlIwWFd1Mm93ZEpqUHJ6TmRwWEp2NjJjN1BRczJO?=
 =?utf-8?B?ejNNZ0dUdGxab2tBNS9SRGd2bW9XSG9vRVVhcEVWNGJxMEI0Q2dBbjV3bDVk?=
 =?utf-8?B?d1d2ZSsvenNMWHF5VzVHMWNpUVk0Q2F4eXNyZkQwbmNBR2xna2xqc1VSZ3Ny?=
 =?utf-8?Q?HCgvy7M3hfpSN7eGdHv+UNU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <398E664D7AE03346982457F649BC3C13@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10851
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0c2793d1-ffcd-40ba-5715-08de64ca3ca1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|82310400026|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3QyMDErcUZJQ3grc2pDN3FqSEZ6eWw2QURhd1lodCtIRHdvelF3eXIzZjVJ?=
 =?utf-8?B?dWlqblIzNkZQWUYwdVlNL3JwVDhYL2xySE5IODF4eHpNYWhGM1liZm1tcGVn?=
 =?utf-8?B?QkxaVEhzclV0ODhER1JCanJ3TjVoNnh3ck1mMUUyaUU0c3FwSEdiN3RHNmxB?=
 =?utf-8?B?dE1ld1hLMzhtR1pYZEZKRGFKUEZpdzB3a2kvWG1Pc2JPaDFRTEU3TEZORXh5?=
 =?utf-8?B?ZnAvNFpXTytLODZrN0Z1bG9WN1l2Yk1OQUF2ajZ3M0VwWHQ0amNaOVhFWWpU?=
 =?utf-8?B?RWtkem5PWE5SdkJNOWV6NmJDbjByb213and6VythajVuT05ENlVmeFE5dEhG?=
 =?utf-8?B?eWdiZVVPcFptNHp1eGFtRFlFTUo3RXNHL3ZMQlpMSktCcXFQZjFUaUZnenlH?=
 =?utf-8?B?OTRiWmdZK2MwcGdta2wvK1NuZmhhV25kdUFUTDdxMkZtc3hKWG4vMlphRGJx?=
 =?utf-8?B?anplNThCaWtXemxTbjlORFFId2QvaDl5NTNQTENhQnVCS2NjWmhKZ1Q5Z2NC?=
 =?utf-8?B?SUZCNHhBMEh5eEhEKy82bFdISkFxaXlWNk50Qkhia3JqU1lmTEdRTW9DdlJh?=
 =?utf-8?B?SEJwZ1NEUVA3UnNlY0lvSFZFVTJEeXBtZHlWVk5sTU9PRmFZVWtiRFBrZ2hX?=
 =?utf-8?B?ci90bFFBN0ZJSlZaQ2VJVFh0c0dHNXpTMWdqZkRpNUI0VEhsZVRLeHREK0Vo?=
 =?utf-8?B?WStIUk9rdUg5em1EeVFhZUoyNGZISzJJNTNsbkVUVWdsa005cTNwTzduYzRH?=
 =?utf-8?B?MGpNMUM3RUdUemJjODFZUkNwOWZSMVp5RkFxNlNkQmxXbFRHbktmT3VMQnFt?=
 =?utf-8?B?NjVjL0JPUEwyRlIvVkhXdmdrVWNKb0xZR1hhd3l1VHRuVU84UDJZM3RJa1JS?=
 =?utf-8?B?R3ZPRlFhRjMwVjBvM2tBNE5OYTJNNUU3eXU2ZHFWUU5Ya1MyT0Y4bktvNmpn?=
 =?utf-8?B?Um55WS9rdHFvNjd2RHlXaVRiUmJmd3grUWY2OXVOV242aHNLTFpIdStkT25R?=
 =?utf-8?B?YWNWcnByS25kLzltck1QcDVrUG1JaStUaUxNYWIrWFBZdmpYWVBFZ2N0VWd5?=
 =?utf-8?B?Yk5zOXl3RWxaeEZoNkpCdFZUSFFSckdISzZmT2I4Vk1qaVJpMk01eCt5a3px?=
 =?utf-8?B?UzBkejFYMzNBempTbDRvZDAyRm5vcXo0WGI1Skh4bDlHMUNTTGFoZTRiaVE5?=
 =?utf-8?B?V043amZ3eGNjUVE3ZmNFUlA1Wk1KWjg5dzFSL0puU2ZsZXQ2emVRZ2RQNkdv?=
 =?utf-8?B?S0RxR2VaRFdZeG9tQ3F2SjBtZHhvQVNRSE9yTStVdmg5cDJoMjY1a3lSdEhs?=
 =?utf-8?B?Z1Rxa1g0aTl6aVR5c1VOakFvWlBZOXJSVW9aRWk0Q0YvQlMvNUZxeUNHNm4y?=
 =?utf-8?B?alhxUEkvUmJUR0tDV0tkZUtCRTRnelRERWdnZDBvZXFuY2loa1dqNTl4SVNl?=
 =?utf-8?B?a0NNTFNMdXNWVXBxRzQrREZsMkZCUzVkZUpFVkIvY1BhbGVWNTB3ejB5aHMv?=
 =?utf-8?B?K2tTQytSYUVwc3B2L2ZCQVNEYXh0WnVISFJSVUZpUWorSzZHWFNXQk5FajN0?=
 =?utf-8?B?RmU4T1pMcnJNeWVJUmNRa0RUSXgrQjRQY3FOYzE4R3NIbzQ2aUdScmkyUFA1?=
 =?utf-8?B?dzBNT1NtY1d6UFhnYzVLbWh3dzE1TGFTY0F3cjMwaWxFS3J4ODFySktQYjZO?=
 =?utf-8?B?OUIwQ1VuYldpb1UraDVYYmI2N0VscUwya2RyUWpuZ1RRSitDdVZjOVNHc3h1?=
 =?utf-8?B?RytRbC9XWXFXOVdDNE1YSDZtTkkvNDZaemhtM01pb0pLWE43VWdVb3ltT3NP?=
 =?utf-8?B?MmtVcFNISHBaYzFSZ0FBRjlJRDM3T2dQM2wxaWQ1d1RIbjIxcEFyQ1B4clgr?=
 =?utf-8?B?UC9SZ2FVUzhlTURTYyt6VW1tc0g5VmxuaERUcmVXUFBNbHdleXo5azBWWFh6?=
 =?utf-8?B?RUc5aUZmMGxnYkp0L0dZQWs5YnhjUVIvYThNQWV5WWxjWEdteUZGeGVyeVlq?=
 =?utf-8?B?QnZFOFhaanprSVQrZG41dHUxbHdLM1puazROUUlnUkRNQnNxSXl1VnFSRnFD?=
 =?utf-8?B?dlRCRlpaWFdjRUNiQ05heThKR0xEdnZ2N1BDWDdDTDlCTExMZFJTMGVPS0tu?=
 =?utf-8?B?dEgwTElxb29rZFJFQzZxMTl5cnFKelBuUHlXY2t2SGhORGY4bU1PQkFyV21C?=
 =?utf-8?B?SGtiYVIvZGtrS1h1TnA2U2M1a0V2NUtwSkxWM2JCYnZ6YWRWNVFFZUU2NTYr?=
 =?utf-8?B?QzE5Qzg4REQ4bldnVnFhMTdvOWNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FKKzakTLOSmBDEkdHqvTB5o9nELyqrn/7x4ZXwq7+onXEJPgRg0Tp02JQRXF42w62nd4Gudq/y6ktRGvW2t5UnFNHTy4d04Xxi9axuXs0Ucybznb0HAKJNlmpiuXh1F+4PITCB+eri2/brr/cH3pi8wcG4LxfESCCKQOSBXvKa2OTZjUUTx30sjCNI82L4GVjalxJzhOX+BCHc1biwLkM9RynV0zHNYYZ88Eg+3S57W+GINZIvLk4N8Oc5e/TJCE9H+q0vatAujkSt5nf3QebWC1TUBCTjiBkx5UbzH2LzEgBsJLeDks03TNZIoXBJ11E12HPDLIMUBs9GHYC0ekAw1kquflEHnuu4OUmX56DWaDJLiQGjdiSPY07+F6ZD+IRlvvKFqGNzvX2gkIaIS3lmPVHHFEf4jGuOiZT4t0o0R2L4x0/5cebeovvkSyY1dk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:22:32.1555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2d605e-f026-4897-e07a-08de64ca61f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10543
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 2242EF48CA
X-Rspamd-Action: no action

SGkgSmFuIGFuZCBSb2dlcg0KDQo+IE9uIDUgRmViIDIwMjYsIGF0IDE2OjEwLCBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDUuMDIuMjAyNiAxNTo1OSwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4gQ29udmVydCB0aGUgQVJNIFNSQ0FSQ0ggdmFyaWFi
bGUgc2V0dGluZyB0byB1c2UgdGhlIG1vcmUgY29tbW9uICdhcm0uKicNCj4+IGV4cHJlc3Npb24g
cmF0aGVyICdhcm1cKDMyXHw2NFwpJywgYXMgdGhlIGxhdGVyIGRvZXNuJ3Qgd29yayB3aXRoIEJT
RCBzZWQNCj4+IGZvciBub3QgYmVpbmcgYSBiYXNpYyByZWd1bGFyIGV4cHJlc3Npb24uICBUaGUg
dXNhZ2Ugb2YgfCBhbHRlcm5hdGlvbnMgaXMNCj4+IG5vdCBwYXJ0IG9mIGJhc2ljIHJlZ2V4cCBz
dXBwb3J0Lg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCg0KVGVzdGVkIG9uIG1hYyBvcyB3aXRoIG1hYyBzZWQgYW5kIHdvcmtz
IDotKQ0KDQpSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bh
cm0uY29tPg0KDQo+PiAtLS0NCj4+IHhlbi9NYWtlZmlsZSB8IDIgKy0NCj4+IDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL01ha2VmaWxlIGIveGVuL01ha2VmaWxlDQo+PiBpbmRleCAxM2UzMzZiYTU0ODQuLjMxMzUy
ZDRjZDI2MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9NYWtlZmlsZQ0KPj4gKysrIGIveGVuL01ha2Vm
aWxlDQo+PiBAQCAtMjQyLDcgKzI0Miw3IEBAIGluY2x1ZGUgJChYRU5fUk9PVCkvQ29uZmlnLm1r
DQo+PiANCj4+IEFSQ0ggOj0gJChYRU5fVEFSR0VUX0FSQ0gpDQo+PiBTUkNBUkNIIDo9ICQoc2hl
bGwgZWNobyAkKEFSQ0gpIHwgXA0KPj4gLSAgICBzZWQgLWUgJ3MveDg2LioveDg2LycgLWUgJ3Mv
YXJtXCgzMlx8NjRcKS9hcm0vZycgXA0KPj4gKyAgICBzZWQgLWUgJ3MveDg2LioveDg2LycgLWUg
J3MvYXJtLiovYXJtL2cnIFwNCj4gDQo+IFBlcmhhcHMgdG8gZ3VhcmQgYWdhaW5zdCBzb21ldGhp
bmcgbGlrZSBhcm12NywgdXNlIGFybVszNl1bMjRdID8NCg0KVGhpcyBpcyB0aGUgdGFyZ2V0IEFS
Q0ggaW4geGVuIHNvIHdlIG9ubHkgc3VwcG9ydCBhcm0zMiBhbmQgYXJtNjQgc28NCnRoaXMgaXMg
cHJvYmFibHkgbm90IG5lZWRlZCBoZXJlLg0KQXQgdGhlbiB3ZSBqdXN0IHdhbnQgdG8gZ2V0IHRo
ZSBtYWluIGFyY2gsIHNvIHdoYXRldmVyIGlzIGFmdGVyIGFybSBzdGlsbA0KbWVhbnMgaXQgaXMg
YXJtIHNvIGkgdGhpbmsgUm9nZXIncyBmaXggaXMgZ29vZC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0K
DQo+IA0KPiBKYW4NCg0KDQo=


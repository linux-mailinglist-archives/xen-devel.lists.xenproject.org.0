Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A565ECB0EFF
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 20:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182154.1505077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT3Op-00027F-S7; Tue, 09 Dec 2025 19:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182154.1505077; Tue, 09 Dec 2025 19:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT3Op-00025c-PP; Tue, 09 Dec 2025 19:29:27 +0000
Received: by outflank-mailman (input) for mailman id 1182154;
 Tue, 09 Dec 2025 19:29:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vT3Oo-00025W-QE
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 19:29:26 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d3033fc-d535-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 20:29:23 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7823.namprd03.prod.outlook.com (2603:10b6:8:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 19:29:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 19:29:19 +0000
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
X-Inumbo-ID: 5d3033fc-d535-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ia2nvS0bC+S6zfMNZjLUq1/tz2VqbEa9D44v3b5hC/PHxCZOvNm+u81NmnOTFfbNrTqOPLmdc/BXIrO8trkJ2DCFTulUijCId1PO3M2cqvtpZdKcijlaNLfvHUncqaezvbvHMVqp8nByP6RRKRj49c7aoWmvsYfcHSss5YfAfdDesTfUq+7beSYtpedwRPcC0Nqog1eWltSFr/Gu/5OUOU/oGyZ3NelXhuqzhJncU/OPowu1NW1rgS8M8NO2NA47pwsG1dWKjLClvtmKt7lmKYBLD0+wM7aQtdHrQUOArKL9kd4gTwdBELxg62tG+XBQJwt9f83iZgZAhUi2v68uHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6/d3t8RbuO+YWintdj/kQr3VZIhHoXgOWe4+2QqjY4=;
 b=aeu0ScvvBNYE6a8PVGHzFY6+pQA17Jaq5d2DrwvdkjsTVsRo1PfXDXJauz81AiOIXWTq2wTlezZ59JwcrD//inBJvXcMscqMj0qRJvodM5Xu8KeT4Xriw8lmbMRDwu9S/BwoKsy07Vnf74V21u7bqJdoYBw0opLMOPvbzEXOAZwqF5/E8hemw5Ntxo+OG1XlxbQ0oq8JQrda7ji0Bo1nqeGoEkdvAah76wGLoEPkmNAFyPlldNCOfwMplFhSPmGMTbOgg3ycD9llOZ7kwugM92CPf+dAh/CL92PEBE3L348I/Lngt6XGXfLZySfCnOPwLhSCILzXSbQjfVvxZTohuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6/d3t8RbuO+YWintdj/kQr3VZIhHoXgOWe4+2QqjY4=;
 b=R5Y9GxA8BJ3iqf1LPm2PYL6zVLeVGsj6rhbGtv+Q7Kh1AnmagxNwTYBLLNPt84jgkwEm5ygxxn/0+ILHz4sn/X0jAqxDAilTFgoLC6pBPiqyCOZkE5k5Yjj4GYttG8eg/oVF7Xnt2WexVsn6mWEzHqOwNYh5CbzXTSb0Rk5iqqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d8a37c7e-106f-4bb3-a4fb-3ad082cda7fa@citrix.com>
Date: Tue, 9 Dec 2025 19:29:15 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/pv: Inline domain_set_alloc_bitsize() into it's
 single caller
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251209180750.2145364-1-andrew.cooper3@citrix.com>
 <83c524ed-dec0-4792-9129-0bfc7498ac97@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <83c524ed-dec0-4792-9129-0bfc7498ac97@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 387eaea8-efd5-4c2a-53be-08de37593fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWJCTlpkL1o5eDBDK3dNRjRXbytCK3NzalBJVlRaNWpTaHBaVlZYSmg2bzZj?=
 =?utf-8?B?Q1dJb0dzNWhvUkpMMlNEZ2crMHl6SFRLcDhybmtSMnBVNi90QXdIT3h4L0Jz?=
 =?utf-8?B?K0Q5YUJsWjRoS3o0Nm5UQ0ZmNzV0eWo1azV3K09Eank4MzF1emJnS0Z3M1I1?=
 =?utf-8?B?SlBPZDdjenpjZFJseGlWWXhtYk1SSC9YMUxVbWRXZExsTHM0Uldjc0FMMTA4?=
 =?utf-8?B?VnRKaytiK3RaaWRPZWMyQ2toMExVbXNCQjRZVnBnSWMzUEtzcTg2YlNqd3dH?=
 =?utf-8?B?cVZCTUprUUpaNG80QVgzaWtTbll3Ry9CZG1tZmRNYll0K29uTHRKaGtucnBi?=
 =?utf-8?B?RzVvSE5qbjNESnA1K0hWMGFXWE1uWkI5Z216aDFJSHdsejZhN2J2QkZQdUVQ?=
 =?utf-8?B?L3hrQXhSL2hQUXVMSS91aGFldVFHa254d3hhd05UVHFBK0tqaThiQ3pHMGhO?=
 =?utf-8?B?c0l1S2ZKUTlMU0tHQW9HaCt5TjNaZ1Z2c1ZBb1NlWkNXWlVXWXoyWi96WUJ5?=
 =?utf-8?B?eHhzQVYzTzRpL2xpWm01SnoxT2tLV05UMEdhdjFKcFFRZ215eCtyRWdaTEpH?=
 =?utf-8?B?bldzSndHUllEOVhjZDg5TUJ5QWxzaXUxS2xpOEhaNW5VbFptVmYxOWJINlh6?=
 =?utf-8?B?Nzl1Nk0ya3hFVFFOd1hnWE5HYmRTNFdhYUN3Z2h4bVJNNnhLcUFKZWpSQXFT?=
 =?utf-8?B?cmtLclovWktvazJDbm12VXlNR05YTTk0NmhjQ242MG94WndVSElpVldDRVZN?=
 =?utf-8?B?aVJicVQ5Sit3TytWTmdnamYvb1hNQmZMeG9lWXE2KzhueUdLWkRpb3ptNDIv?=
 =?utf-8?B?bFd1SDBkbnlqQ0tpbVduc201VlNHS0l6d0xZY29RdVF4eHA2M01VN2V5KzBl?=
 =?utf-8?B?SWNxdk5DVGNRRlJnL2lEbm9qS0NKWjUwWG4ycjZxSnVVeHM5RVlYZU11QzBs?=
 =?utf-8?B?cUk2V0ZjV1RCZmdYTjFicGtLdlo2VVhTZmY4RGpPOTF4WlBja2NUaCsvc0lh?=
 =?utf-8?B?Ym1ZcEFvWnhTOXJLUVoyV0ZZZFRVMFNQMDBGMTA4V1k2RzNhNTRTMjV6cFdz?=
 =?utf-8?B?RWc4b2owVk5Bb0ErTkdEY3ZncGdtbWRsTk1FekNtd1diZkIwVlVaZUcwdUJz?=
 =?utf-8?B?SjZ6RS81NGZLM0gxTS9IbHp0R3YvalhSV3Rmc1NoN1c1aGQrMm9SbFNQeDk4?=
 =?utf-8?B?aE9YR1BpcHRRQ3NxdjhRQ1RYQnZjSUtuTllRSGtMU1RvUzlZNzJ3UmFySDBR?=
 =?utf-8?B?dmdjTS9xdGoxZHd4UmE0ajN4ZEs3TDJWY0E4bk1pRUl0RGhmWnIvVEJwZUdh?=
 =?utf-8?B?UjJPMnlmV3EvNzd1bXVXMlpEZk1mMXNEREhlMGNhVkg0dzdWM2ZabFdmTUtW?=
 =?utf-8?B?RzFqZjBKYUNBTUh0ZmFSUXhYaWY4d1RZRVBSQVVvamxDa2JLTEpKT1lJczZn?=
 =?utf-8?B?ellQTHl0VFR5a3RmS3lKaDR2SEpqeTg2Mm9UNjFXNHpxVGE4NDlkQWNCZlUr?=
 =?utf-8?B?UWQ4NllIK2xDZzU1cEFheVM4YU9sKzlZSDhaQlNmWVJqTWVBVGFoaGJ0Y2tX?=
 =?utf-8?B?Q2Z4bXFPazB0R1pUWGM0N3pUREloM3hYTVlMZWU4Y0Y3T3JCeDJzZHhzUmww?=
 =?utf-8?B?dW9BNFM1T2lMWS83NWpUMUdEb1RnT3RBY1p1NnA2YW1uNEtFV3dVS0IwUXh3?=
 =?utf-8?B?bk9HeWNreVNFUU9yMDg0NzlOQVoycDM5WFJHNGtKSFIza08xTWozcnN5TzBo?=
 =?utf-8?B?TTJqMkJKTTh6R3lEdlN4SkgwTmdXbEErMnBOeEpCb2JZL3Z4dy9zeklCVm5L?=
 =?utf-8?B?WjJBQm14NVZnSXVVaWFpTktwc2crMGRWSmovenAyOEZkeTMrZWp5WTg1b0s3?=
 =?utf-8?B?ck02UjZxMlQvaSs5NHRhYUt4ZzFRZXM5WnpOcU0yY0YreXJhK2FvemJ4OHgv?=
 =?utf-8?Q?kJVIL24YMhnaJ4wX2LvzMeYXx4OhBCwR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXp6eXJhN080dGp4WVBUTWwvZEtqTG5GQkFTcGFaVHgyZHBoL0RBQVJZQ1Uv?=
 =?utf-8?B?WEhUaG5HSXY0dm1MMmNhdHhEVSs2b1BZN1k1L1grSnJaTFoyblYvam1GbDZo?=
 =?utf-8?B?UG1YaUFRa09PQVdYNEdXL3o1bG4vcHFLKzBwUzZTMktkTXJzZDR5bDVyWlRw?=
 =?utf-8?B?cUJtZTJZMTQ5bEFONVg5Y3RHMGMwRXo5RThKUVc2c0piM1plbllUcHZyalZm?=
 =?utf-8?B?RVYvT05XRmRnVk5LQTd0MDlNQ2UrOHhzQ01mMHNzNVh4M3Q5UFY3bXBndW5C?=
 =?utf-8?B?am1USzRTSE9ZZ2VqKzNwNkVLeFFhc0ZEcWZNUDRQZDF3bjNCY3UrMU9vZE5U?=
 =?utf-8?B?QW80c0RPbDNTZ3BaOFFTMnZHSUowRWhKaUw4NjZtbzRENkpqQ2tscGl5Ulpi?=
 =?utf-8?B?dUdJS1R0TWEwRGcycDRBREZsN0xZL3UvNjFwRWlxWTl1RU1DTTZpbG5rall2?=
 =?utf-8?B?M2U4UE1TRXlsNGsyRmVMdEVqZDZJM2lCK20wellPREFlWlZtK3ZFckhNd2VJ?=
 =?utf-8?B?QmlsT2lrNW0zdjZuaVliV2JtN2dlUkxzRk5PMFhjUyt4UkhYVWRTbWxUTXJS?=
 =?utf-8?B?V25ObGpucEhMckh3QVRSZktyVDZTVDBYdzZWVVNDWDlNaHozMUVWM2svSU43?=
 =?utf-8?B?NWYvYWt6dVhCVVQzWFBTZjRWR1ZObzNSUXc2N294SDlCK3B2b1VzTTc5NzA1?=
 =?utf-8?B?Z2xwdEdlMDRtMjE1SGpoang2c3FNbHJMYS9QeVQ0NWhIdm5ORjdVajdzWVV0?=
 =?utf-8?B?RGVQM1d1SW5GbW0yZTY0M1I1Z0tKL1lqRGc2VitTamNpL2x5ZE1wZEM5dVA1?=
 =?utf-8?B?cDViZ3FhRWRzZ01NY1k4ZFNSZmFlSlIxWTkvV3J4YVB2dGNiSHBPa0o2Tk5C?=
 =?utf-8?B?MTFaWWxZUFRyZ3lwTmppTWhBYks2WTU3VG9VQ1BwVmZLN25Xbi85QTRybkpV?=
 =?utf-8?B?VnhzQkJaVlhqbGkybW5UTTIzWWNaeEZ6L0JVWDlyK2xOeGFmbVE0cGFoMkJm?=
 =?utf-8?B?ZkRyQ0xhN0V5bDgrRU4zMWVDcCtjZklUNVduVHh6dktqZE1QUGFuNXg5VUpX?=
 =?utf-8?B?dWNQM24zMzZhaDJxbXNMK2ZVSkwwaUxYRkoyUjZJZ3RjaHNXdVVvVFBtVWlh?=
 =?utf-8?B?bFpWOThVcHc1TUJHV0ZITW1aZWNzQmxweERXVFZDYXdibGtwdTBEQkt6NUlS?=
 =?utf-8?B?N0pKWXJmeWVXLzF2UGpYVnUzZ2dVd0FyS1N0QVBqZWpJV2pIaE1wckVoMkFH?=
 =?utf-8?B?YktSeDNSaFRIQ2VLa0xrbSt0Z2JDUCt0K1dpb0UxSVdxVkJzeDhiY0lCdG50?=
 =?utf-8?B?V211MDJiN3NXazJmTit2WWFMYi9LaXhKbXVIem1Fb3RuNStNODZhRmtqc3Nz?=
 =?utf-8?B?YmlWTTZyWDZGSWpWa1RRZ2lyRUVjdDR1VVZjSDVuWmlnZGh1Z21ybHRyVzl3?=
 =?utf-8?B?UDNkbnpkaU82TXlocys1Sno4SjJNYjNhenp3eHlLZHYrMnVIWC9BOUV6ajZ2?=
 =?utf-8?B?cGRMb3BjY1ZTamlmMzVrSUlqd0NpNGxzQ1FwVkFhaFdSMDl0NTJyRDYzNFQ1?=
 =?utf-8?B?OUtSR212UDVPR05xaDNuUHBURWN1L3F1enlBU2lqRmV5OGRhdlFaSE1lNE9O?=
 =?utf-8?B?ellwaXE2OFhLRmNCdk13bFcrUE9RWkhPUG40Y2tDRmRFRXBuRDJuS00xdzVL?=
 =?utf-8?B?ODZvQ283QlRKOFJuRzVlVG5xRlV1S3c3N0NLcTlQS3E0d1BiaVpQOVVZdGY2?=
 =?utf-8?B?VXJoRDlUdVp4ZjNVb0tkRHVPSHhEZGdxYUpjTHozQk16eGFlbXROUjNNY0Rm?=
 =?utf-8?B?NjkyeFNiNGFwYjBOVXRuZVUzWFh4U3FBVjJvcnJacGVqc0d0SlJJUUxPQ1p1?=
 =?utf-8?B?MEZNU1lMMUN4aDBkVm1pUE56V1hSRlRPL3FEdGhuTG5Gb0NnbjhscVQyNGNK?=
 =?utf-8?B?eTBZQnJGems3dHR4NEhwQm9sWFp0UGQzQll1dHh0UXpCMUNpdHpMYzJsNGor?=
 =?utf-8?B?U2c0NUszbDNONGxEU0FIeThEaXduSXhiNTUwQi9RUGZKR1VXckZycDJoSjJL?=
 =?utf-8?B?OFkvNi9HMm5MdjZINm5CQVk3Q24zOFBTYllxUFdCL3E0L2NQWW9CYlc2b1g1?=
 =?utf-8?B?ZXFLRk5PaFJuT0hBUDcrL2RMWitNSVdvNEhObHNnRzdtV0ROdmZwRkpFelBp?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387eaea8-efd5-4c2a-53be-08de37593fda
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:29:19.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VY0/r0mXicR1712MLUfZM32KbrQagTqZaKNNz0OBlMvENuYE+IJdgwgcaeJOpNJSReFDjSaHPxlRC6UmupimsxiTIY0dSluSDpKQt+p0lWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7823

On 09/12/2025 7:21 pm, Grygorii Strashko wrote:
> Hi Andrew,
>
> On 09.12.25 20:07, Andrew Cooper wrote:
>> Prior to commit 02e78311cdc6 ("x86/domctl: Make
>> XEN_DOMCTL_set_address_size
>> singleshot") (Xen 4.9, 2016), it was possible for domains to switch
>> to being
>> compat, and back again.  Since then however, becoming compat is a
>> singleton
>> action that can't be undone.
>>
>>  From the context it's clear to see the is_pv_32bit_domain() check is
>> redundant, and from the singleton nature being the only place setting
>> physaddr_bitsize, there's no need to check it for being 0.
>>
>> No functional change.
>>
>> Co-developed-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Split out of series to simplify things.
>>
>> bloat-o-meter reports:
>>
>>    add/remove: 0/1 grow/shrink: 1/0 up/down: 25/-96 (-71)
>>    Function                                     old     new   delta
>>    switch_compat                                447     472     +25
>>    domain_set_alloc_bitsize                      96       -     -96
>>
>> which will mostly be the LFENCEs embedded in is_pv_32bit_domain().
>
> Thank you for doing this.
> Not sure if it's needed, any way.
> Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>

It does help.  Technically it lets me commit the patch right now, but
I'll leave it until at least tomorrow in case anyone else has comments.

~Andrew



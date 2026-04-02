Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMInHZErzmnIlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:40:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D735386319
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271297.1559526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DbS-0008Iq-WE; Thu, 02 Apr 2026 08:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271297.1559526; Thu, 02 Apr 2026 08:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DbS-0008Gk-TF; Thu, 02 Apr 2026 08:40:38 +0000
Received: by outflank-mailman (input) for mailman id 1271297;
 Thu, 02 Apr 2026 08:40:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w8DbR-0008Fz-0w
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:40:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8DbQ-001D7O-DX
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:40:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69ce2b77-e002-0a2a0a5209dd-0a2a450a9c72-10
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:40:36 +0200
Received: from [40.107.200.69]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69ce2b83-ee98-0a2a450a0019-286bc845e156-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:40:36 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS3PR03MB989216.namprd03.prod.outlook.com (2603:10b6:8:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:40:34 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 08:40:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNBFMrT1D+ZdPa9WZGjq4ACFo5/TguifaAIY6dmO1C+FbqHW5hJEOs8bLbBzCdde1OmXG0LgiahHE1E64ZIhI6W6ImbZ+UsTHKD165cIpzZwLC9lY1Ex+SINH/o6WdYDKuFD0XFv0gdQEEdtiAU72BIi6Hri/VXJbzkPqcAyWh+A/0nXxrGXOlHR9H7e5R3x54N11w46Yf01chcXDf2U7p2D1M0E1vWfaF3psN+XOtx9b8YlSdEaUtvn4MC7Vvg7dQprGwL2P7frgDa7SvPTADL1fPWOB+Oyznpw1V9Y6Vtb5xUq/i4s5pwMgluAk//3vgKfx7JdAPEJqKZ3T8p1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdfQ8Ppn8w3mAl8W9T0lMjJOVO/ZVKu+sDdhkmaWNwU=;
 b=ehqPr0C/7ONp0C0aiPWiuUBTwhcH6+VDjZlDkMAvJx6o77Z7chXBoJcCHH2I6c8mdy2a0FhZcVxKSjisnTqd6szGxpZEsHInS/SsKmxMlBYL1F5BArKwBHLjBamm0ULjVmUxeXlMjA7BWCzWi5dqE1dbbH86xYJYeOfHfvbLbDHMBUpvflzVR2zZNTk3rvd0NkMUPZSLikSCKIcPlMaz9loATByCd5cCc3lQj12Jtg2mR/1pAamP8d5x9+5VA+6HWRFk9o9tpRlaxtKObzjgxX7OesNcDMYGg23o8RYwvaoxuiMEq/zW3pSGKm6ucisyVhZAq459HJmdtAYSgSEPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdfQ8Ppn8w3mAl8W9T0lMjJOVO/ZVKu+sDdhkmaWNwU=;
 b=VZ427re7rHirDSoxbBw7PhAz01yFkNBFTPAWrSdLa+JHXwuzUn2FoHuHGUOlcHitJlaTJ2NA3MAZXGovDdrgcDbTwH56XgZaGbL7IW8XcOBBBXeHA7Xg/HKzD5m+TAvebKkjlhXYzpF7w6otFi8yBzZqci4sw+PNVPnlP989UMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <17c4e7b4-297a-4bf9-9160-659723d15e48@citrix.com>
Date: Thu, 2 Apr 2026 09:40:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Lockless SMP function call and TLB flushing
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <94b2e444-844a-4d34-9c9f-de0b9e6e23b1@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <94b2e444-844a-4d34-9c9f-de0b9e6e23b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::11) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS3PR03MB989216:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7a3d8b-3c90-4e7c-b884-08de90938150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JoJE7nW3Axl4A6BtWe+erKCFIT7SApXdn3afPB5VPdRFrOiDZ0FQwcobgP2TPa/j0DJ3HZtIu0ryogdKPwHir9sQca1YdA/BxoUmUGD9ZYbOkNLn7FvRtthdWG/nD1DGhimeIhGmUJNwwaaz5QARdcQnzhbsvacHopEiCBgrYzVQLRwgOKyzg2iEnSvX/5GlOoxQX5gRqS0RZn+GxtAa6PjIIGV03PFAu7ODVnRrU27EMnte7GWdKbTwsyW6CqW0VQIcyg0rvNeNEhsui9T7j6Od1ibw/jTLy1H29o2NTma0CQrmD0DrjMheacY5AZmLwWJdnCLXgrdGB8GKBQuutxDOgwp1XvEPRr2IZoSOvVQV93/Codu9I3DY7Cw4OuZmITS59LxjCUHjXAFbJUXl6DmRLkhPeMUeREfpoDNWposioMltyjrWSlSbxkHs5Wd+S6xmTaZauDUhn+tBOHeItptOK+3qmiGfZnwkNCNsR62QlzZMXN90Pc9hOjdghnCdCLkblIGAHml2U83SNcgsvAUtyVUohgKYVuWHOWNIPY+YxEY2XP4L30PbAdjp+afrhFLXorkKjJvjOMufzErvbwg5tH6rGuKXv+CIJvmNjcTkPaZjTib34bMdHf5DBbFbyZ46sDNf2uQ8kiRFu+ukJ0HnapNblIwXcBTKGSLIN5yab8FJJ9/9ZQKnpbSI5scrJxiKfElK36zFQiZPJlWae02BPcka9uxPPrn1Z69zmRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2RIL05jQmphQjhrcy92YzA0Rk96Y3VPZzN0RVBQVG9Ia3ZxN0FUV1RFdVg1?=
 =?utf-8?B?VE15L3FlN1FDS295TzlFZ05EN0RFRUNaRlhjSjFCdVhQcUFWQ3BhM0JJVG9l?=
 =?utf-8?B?cWgySzNzbXg2aTNsMHZTNVUvejhveGxQZzRMQWppMUcwczFRWkNaRHRGM1dq?=
 =?utf-8?B?RUhPM3VaVVpjRU9ZS0NMSi9EYUYrMVRESi9tc0ZPNEkzL2dsWDAyTzFNTkF0?=
 =?utf-8?B?VnNQVnh3RmJTZFNOVFFDZkVMZnp3WkJtSWlKaFpBUFJqZUhCMXowZkp1MzJC?=
 =?utf-8?B?dkF6UEpLMHNBTkRYU2FpYks4eUZuaFlkbFVwd2hROGc0bFFMMjBZVE0yWXRu?=
 =?utf-8?B?S3dtczFxdnRONEJpbFF3MXlRTnFVcStLZTI5aHlPOEk4VW9CcDBCQnhHL01a?=
 =?utf-8?B?TTJ3MkMyUUJUOHhvWjNybklnUE9YMDZuekYrK1hGQkQwYXJEK0RtZURtQWFo?=
 =?utf-8?B?VWFGQ0tmVG1nYjBxM2FZekF6cmk5Y3NKbXpvVEVsRzRGb3dOVjZVMTNxWmZF?=
 =?utf-8?B?M3lwckFKc1dia1d5aVdNeTd5L014b2NZUG1IMHJLbzVjY2Q2SzlnTkgyVVZa?=
 =?utf-8?B?ZlNzdnpDS1VDb3FVK28vdTV1VUxQcFo2UEdZYTBNM0JKazVhMVFBTU1WcUlT?=
 =?utf-8?B?dFZqZGFONXAzYS91dHFHL0YvWmdYZm1iOURObGh0WVFjZFNuRFl4ZzhkT0tp?=
 =?utf-8?B?WVM3WDAwd2pad1YyKysxRlpkZlRnTG9IaFY1N1VzdVJrd0s2b1p4OEQ5eEp2?=
 =?utf-8?B?dWhuMnZMd2wrYjFObDVNOFZCZ25yR2hxL01NRzRCd1NJWllIaXEvOXk3UE9q?=
 =?utf-8?B?aEVWeUpjazRzNWJBNlRSK282VVVkNEtrQmRMd3hPbnhMTkRteFFzYU92YWlC?=
 =?utf-8?B?RGIvTERDODB6Qnd3NkNaaHVWQmt5cktiZldvM1pGT1htWFJSMUJRak03dk9n?=
 =?utf-8?B?NU55aGQ1V3A2V0g1b29LMFVXYlJGS05KTFE2eUFLdExCZzBrVHV1V1JVUnpr?=
 =?utf-8?B?OTBldWRzVXJ0SFR6UktsR0R5ZjFMaERDR1J5Lzdta1Z1MTM3U1FwQXdvUElP?=
 =?utf-8?B?emRRb1EvMis3TUpQWkRDa29ZU1J5eVFSMHU5WWNYdHNoSGNnRXJXS0U5N3lO?=
 =?utf-8?B?eDMrQzVodXZIdDVtbjBZNDBiTW9oZUw5Q1lwMXNSL21oQmZyUzB5eVBzcHY0?=
 =?utf-8?B?R1JXdVNaSzBQNTkrcWtLVGQyL3ZuZUdFWERoNHp5NTM5NTNOWGx6cStQbzN2?=
 =?utf-8?B?Rmw5Qmo3bW0xdzdwcUE2dDhvWWVwaXEzT3VBMGdZb25FNFRPcHRCNzZDVUd5?=
 =?utf-8?B?ZFRiMmFtUUd3eWJHMkhPeTlJakNmY1FUSFRVak0xVTZ6TWY0SHJwN3lab2NE?=
 =?utf-8?B?eStVdExrYlBGNzdDdDhaYzlDeThmaStoWlN5aEtkT3lGeUMwM3RERUZjdXlv?=
 =?utf-8?B?dExTdmp0d0taUlBMYWRqMUQrbDR1aHdEbGkyOGxQSVlRU3U2R1ZTdFFIbUhu?=
 =?utf-8?B?MEVILzVBMG9zQ1hpb2owckR6WGE3cnJJdi9kU3NtcXlWR1dGbXA3elhJMTRn?=
 =?utf-8?B?cWlNYlBnVzhoRjE1b2s3L1FTYlVDTnZYa2ZIWER0MGpjSWZyTlhlUzJ1OEFK?=
 =?utf-8?B?QXFrWTVoMW00dmR0SG1PL1JyMzlaWTU0VUZrU2R1UG9PYmRXci9NS3JVSDRL?=
 =?utf-8?B?NUtZWHh1UU1mOU1pNG9XZTM0c0tGY0p6OENxUXNTNGwxWk5CbDVJRmFJYkJL?=
 =?utf-8?B?cURlNHppd3ZrYjl6UVhUYzdnQmRaTk5mcFptVlNmTGRYRkZ2Y05HQm1kVkNs?=
 =?utf-8?B?akJTdFB3cTBCZ3NTU3h5dGlId25IUC9WT2pQMnA2UWhhZXY0aFdwL0xpUHU5?=
 =?utf-8?B?TWNCU2lNalV0SVVzMmpaSk9IbG8wOUFUa1J1UkVkRjRiWDNkS3ZBMnRBcGNk?=
 =?utf-8?B?b21YMWFnZUhQMHhrWWxlYVlIQ2J3Zyt5VG81d3JGVmVLSVZ3NVlGOWRsT3Nz?=
 =?utf-8?B?cW5zcGlFellmK0lYWkFra29uVFRMOXpUelhtKzJqeVVlaFpHcjExcnVyMjRt?=
 =?utf-8?B?cmYxWU4rNmExTGg3RTI5NXZ0WVFUcjNZcnJVVXBKck41TG1oSTZqdG9sbVJk?=
 =?utf-8?B?Y3lrajJZeWxhR2pHOVQ2bSt4NzFQL0xzTU5RWnhPQS94dkFIU3BsVUd5L1ph?=
 =?utf-8?B?dFRnSFRFeVBKMGVKVUNpUVpuQ1ZhMVh0UU5IdVRMQ1BxYlU5alo1K052RmFW?=
 =?utf-8?B?QmNqV29qNTRaTDdSQmxhUzlQZlpCdWxLL2ZYY3ZUZ3VDMVREQVhPN0Mzc2VE?=
 =?utf-8?B?OHM4b3FsU0Q3RXFseEFkYmdnQkUzbnlxRE9xNlBDVFo0TUpsL0lpZE9JNkph?=
 =?utf-8?Q?mfTMj+u7gLcWkj4w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7a3d8b-3c90-4e7c-b884-08de90938150
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:40:33.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REngbXTmkn/KeaTi85VDkWhfGhAIZu2la1L1RE6kWolycYgywV6n1NypN3ST18oRCTHU4Y7ApDESnClKSFbHeA5B22IF3IjXjEQ2Ic3TQjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989216
X-purgate-ID: tlsNG-4011c0/1775119236-BD1580B1-CFD10952/0/0
X-purgate-type: clean
X-purgate-size: 2803
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0D735386319
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 7:09 AM, Jan Beulich wrote:
> On 01.04.2026 18:35, Ross Lagerwall wrote:
>> Hi,
>>
>> This series implements lockless SMP function call and then rewrites x86 TLB
>> flushing to use SMP function calls.
>>
>> We have observed that the TLB flush lock can be a point of contention for
>> certain workloads, e.g. migrating 10 VMs off a host during a host evacuation.
>>
>> Performance numbers:
>>
>> I wrote a synthetic benchmark to measure the performance. The benchmark has one
>> or more CPUs in Xen calling on_selected_cpus() with between 1 and 64 CPUs in
>> the selected mask. The executed function simply delays for 500 microseconds.
>>
>> The table below shows the % change in execution time of on_selected_cpus():
>>
>>                    1 thread   2 threads    4 threads
>> 1 CPU in mask     0.02       -35.23       -51.18
>> 2 CPUs in mask    0.01       -47.20       -69.27
>> 4 CPUs in mask    -0.02      -42.40       -66.55
>> 8 CPUs in mask    -0.03      -47.82       -68.39
>> 16 CPUs in mask   0.12       -41.95       -58.26
>> 32 CPUs in mask   0.02       -25.43       -39.35
>> 64 CPUs in mask   0.00       -24.70       -37.83
>>
>> With 1 thread (i.e. no contention), there is no regression in execution time.
>> With multiple threads, as expected there is a significant improvement in
>> execution time.
>>
>> As a more practical benchmark to simulate host evacuation, I measured the
>> memory dirtying rate across 10 VMs after enabling log dirty (on an AMD system,
>> so without PML). The rate increased by 16% with this patch series, even
>> after the recent deferred TLB flush changes.
> 
> Is this a positive thing though? In the context of some related work something
> similar was mentioned iirc, accompanied by stating that this is actually
> problematic. A guest in log-dirty mode generally wants to be making progress,
> but also wants to be throttled enough to limit re-dirtying, such that
> subsequent iterations (in particular the final one) of page contents
> migration won't have to process overly many pages a 2nd time.
> 

In the context of a real migration, both the process copying the pages
out of the guest and the guest itself will be hitting the TLB flush lock
so reducing that bottleneck may increase throughput on both sides.
Whether or not the overall migration time increases or decreases depends
on many factors (number of migrations in parallel, the rate the guest is
dirtying memory, the line speed of the NIC, whether PML is used, ...)
which is why I measured a more controlled scenario to demonstrate the
change.

IMO throttling of a guest during a migration should be something
intentional and controlled by userspace policy rather than a side effect
of some internal global locks.

Ross


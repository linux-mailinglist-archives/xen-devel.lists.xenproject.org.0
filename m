Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF9OCA2P/GnDRQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 15:09:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A83B4E8EE4
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 15:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302723.1576523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKyTd-00087c-Hf; Thu, 07 May 2026 13:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302723.1576523; Thu, 07 May 2026 13:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKyTd-00084g-Er; Thu, 07 May 2026 13:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1302723;
 Thu, 07 May 2026 13:09:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wKyTc-00084a-1a
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 13:09:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKyTb-003s2p-3Q
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 15:09:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc8efa-e002-0a2a0a5209dd-0a2a4505ae3a-4
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 15:09:14 +0200
Received: from [40.93.201.11]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc8ef8-aaa8-0a2a45050019-285dc90bd5e2-4
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 15:09:14 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS6PR03MB989137.namprd03.prod.outlook.com (2603:10b6:8:368::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 13:09:11 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 13:09:04 +0000
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
 b=Qu2DTZCO7KJfdj5oQWNDQy00HYTW7en0yT4DR8Z/TDVw6e5SDx/0d/k3u8Ti+eG8ZWdITbeXRuVgd+l58RV5P+GwdS9s5kqIvC+Q9OKlz4oHFYPvUe/HSfCWCBSniwPQzqvYjBIdd1YaRsRgiCJeh1FOmm/Purya+EvbQIZhv7L1US60k1qIZozFA9t9c/SgZX7oIP7v+xRoZ8fxSRm/mzaT/1Par/jadoQqIvg8GcudUAr9iTSI9Ki27lcyClB75j0jibUb+inQEYG1HA5peIDDr8f5brTJQogEZ8//w2F70LnuUnAMZ3shAT6g6cwxlcIxbcqauWx2OcnDwP73pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mnm+yObtMeIg91hRA0bU8O3aLhLSlsKNRkfmBP3+Ty4=;
 b=l6k5BOjUvGMoLY5x4OzkfUqs+g8WsbshPz5g09l9JICLntDHWBpbxGRfVKNqgeJCkf/6VcMdm6zasZSv6V9U1mq2pozgLy7H+R9+Ymo9vUP9fgr1yQbEzpuMINO2URDRlYjf4KcT9gugf++abTY+u8NZDKPjKfniAK8PQYtyAYNNGB06vcQ5Q8dId6Ya3LrKjo0bf0B1k2Wl5qSiiao/rxG3r1k+eesg1mCChi+XUN8/RcTdbjl5y9AOzRI2RFDBCZUK5Fm0Jv6ifeYtbwFffFkq+59scptoXEqr5PXujD/GrHSCq2EoF0xxTB/rcBmFisA9/DcUvChrw4vi2SZFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mnm+yObtMeIg91hRA0bU8O3aLhLSlsKNRkfmBP3+Ty4=;
 b=EPPjJMt3wQVw4Xqiqmoqzbr90Ri8KsIY4ltrszFIv0h+UaCw8PeOdOEzfcr4fGlpYX4ba8Ke4sFdwWrCdeV4VyBOP7Wq/gYwA/NYcybLBQ6peTp0gGkcPhriIMcbKAPQfgz7UdcO8ue9mLoLP45I3T7yLzEkOiXI4GBr7burPtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1c6c18e9-54ce-49f5-b0f3-5a7f553d646f@citrix.com>
Date: Thu, 7 May 2026 14:08:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/svm: Don't toggle local event delivery on
 stgi/clgi
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260507105507.2078971-1-ross.lagerwall@citrix.com>
 <20260507105507.2078971-2-ross.lagerwall@citrix.com>
 <c62cd90a-0325-4a65-a1a2-a29aaa912200@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <c62cd90a-0325-4a65-a1a2-a29aaa912200@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::9) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS6PR03MB989137:EE_
X-MS-Office365-Filtering-Correlation-Id: 698ba661-d81c-4d8c-cb86-08deac39d039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h90AvGH5T3i2EdK6vqjPRbko68QGmES6Kjbghr6NjguvB5E6/bWCrIcW+oknNGAn4Vh2LBV9Sh6fxZTE5iv1RB2FAQ5ajkmeWOLDxfQo8frdfB8v2Ucn5++L4SaAXaTM+XUkYQRCnr9GJ1uJ9tB47veKHnPFAGFWWs73c1yXrP/q5xBGVh2Ey8Qhkl6PR07+kULawIC/m5hKERbNXHQLZtJpjpPeqRfR2cpoAfKVwiI1FgaRsE/tNZVQOsgoQgZMzxVlnGCJ0UgSr+BSzFus6g8eY6AkkqCHd/lUXtS6EJwYL1mvRGN5JGWXCx3Kn8+b3y/G8MSoe46OtdudGkvSPSeUXzD6uNmAo87lzWyf+hHgmlXLIiaXO1DLUBD1z6VTuNBM3ia0fdhEL/GQKr08PPm+4cpzXqBa908Dyk/PvStIsSoU7tFvyaRsvfYwowRhtWOtyHlqDWeEM78x/zeaVTBXp+TL0+6qEqEoYpr0kuUcdYJTKXLSACwhfHPsT9LfjXlxcMhlxH2v54H3ubNdlSP95LEG9+WN/R9iYfuCt4el82t4fbKRi2igB7UsSjnzrC9EvOG+e+by3fGkzh2Ykxz9i3OOdoH5UHz/V1/Yu+r6BmWar9krLlB+aSZOLrCJfMlsUFV9rOpn9inP0yVuB214DNhnxFnxJZLM5tb/JefzogfApFrFYCtYp7oM+NZ9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm50aFlLNDlBdUw0MHNIYXVEQWtlSitBOHFlNWM2OVVyQVBYbGdYb2l3dkp0?=
 =?utf-8?B?ZVFEU2RMeEpnc1FzT0lOSGNXZmoreklZMGtuQ0libTZkUjZUbDNPN1B2VXlq?=
 =?utf-8?B?eGVxTFZDSXlNS1JsV1FoenBDTVN4UEs4RmV6M3ZjY1pVV3oxUTdITGNtSEh0?=
 =?utf-8?B?ZkNCQ25aOHhNNzRtbUdZZlpwdThBSnVsRVV3Z09SVkY3dlVFUzB1aERFWVFL?=
 =?utf-8?B?b0xOTnJjeXlEYmZmbEFub1FUNXdDNklSU0J3KzdrQkxVUFZFKzk0Szd1cVBx?=
 =?utf-8?B?Sks4R2JtZXFrTWxNc1JYRGFzUlpmaXVNTTVlMEd4YXVnY05FVk9qRm42dUVF?=
 =?utf-8?B?TmxOdFpIOXBkZDJJWHpWTlBsVVE3WHo2M2ZqZGt6anlVVEVhT2ZxOGN1U0Iy?=
 =?utf-8?B?QlRRSUJWTEt1cjUzcFYvL3dybEkwQ2JrWjhNb0tLMkw1Sjk4Nm9vbCtKMHdh?=
 =?utf-8?B?RCsvb3VvS09PY0hOemRDajg3VU83NlZPZktOcFVjMEJoMWhBT2pqOVgybHk3?=
 =?utf-8?B?ZWVFT3F0Mi9yeWZWUk1ScHNkVVF6RHo1b1p0bHJ6WXF1cXRsZkcwQU9wOWM3?=
 =?utf-8?B?aVAwUlBxUzFEZzJlRWYrcmQwU3pHZWZ3WkxvNFlnNVdrNFRHZGQ1Y3ZaMmJS?=
 =?utf-8?B?YkUzVHZBbEhiR0pVc283U3F0TXFQS1QzSEhsdkRPZVFlT1F4ekRSVllpakgx?=
 =?utf-8?B?OHJjMlk5bmJMZGxBZDc2TGRSTHJNN1pxdWRudnVYcS9YQzJoaTBreERFQ0pK?=
 =?utf-8?B?SHc5c1ZGa2NPRHc5bjVyUFlzSE9TbDBvaThOZG9wOUJRTjRpVTB4azVnR2Rj?=
 =?utf-8?B?UjJvRnVpMmR4WTdzdFEya3JadFh4Vjh0aVQ2bGZ6d1d4dEVQTEwwODhPN0hx?=
 =?utf-8?B?SW1UMHJmR0ZnRGtXcDBHMFV6UFpCZVpkSTdyRzdhZVBGOGRrdTkvMk5EREh2?=
 =?utf-8?B?Y2xBQTRRRDZkNkdBNTEwZWJQbHRaUFNRVTJISmhDUnUyU0lTdVhoSXYwS0tM?=
 =?utf-8?B?cWl3SHV2YzhsNno4U05BeFBQWUo5aEdZclRncWt1NEFWUUFJYWVXNldqYURJ?=
 =?utf-8?B?QVNkenJpTWlrNWV2cFlZSHAzUkJhR1NXTlBaaUhCQkNzY0JFZEJxQTA1YmRk?=
 =?utf-8?B?MzJZNkdaUzk0d3laNjRoaWtJUHR4N29kbGVuOUlhcGFQNW9nUmtrNk9NNmJl?=
 =?utf-8?B?ZkZ4bUNUWTYvUzZNaSt5eGkvWUl4dHBYRjR6TjNrUmpIa24zdWFrQUJ6a0xv?=
 =?utf-8?B?WnB1TUU2YTQ2RnpiaytJaFlQSndJRnVnRDZvbGlDR0I1Y08xZ0JqQldOQTZy?=
 =?utf-8?B?QkFZUncyUXJYeGFRY3pXZnFiSEt5QjZEZHhCYTJxQ3dlN1YvVzF5SVNhMXdL?=
 =?utf-8?B?TUowOHRaNi9EK1JZR1dseDNHY3hLYit6YzQyQkdYOTVBeWJpRHhDS3JCVlRx?=
 =?utf-8?B?TmREdWdKOVFlb1pmQ0ZLVnllc29LNFpSOGloaHMxKzhFNllPN3VUS2NOZjZm?=
 =?utf-8?B?cTUwdXp1VUFybzkrdTdaeEZwV0krMDVmYmZ4WGZVYllRVnNPMHQza3poamVz?=
 =?utf-8?B?bDRoeG8wQjA1d0IwM2lSbGRud2xVTzRwdXc2TFZqWTBHaXFkU3BmNGZTLzJF?=
 =?utf-8?B?TWJBUlAxa3NBNUFLcTBQOUtrWDdSb1JSazIrWHlrSFlESkFOa1hOb1lQWHlR?=
 =?utf-8?B?aGs0dm4zenJibHdEL1E5a0pYRy9MMTEvUHh3UmtzdnZsM25ET2VIbmYvdHBy?=
 =?utf-8?B?OGpvMTBRdEZOUEZIMG1sTXBKTEdBNmNZQmxRZGJLUGU4MHcwMWFZWVhmM1Ay?=
 =?utf-8?B?bXV5UStIVXBSeFJZUUxrNFJCWUxKR3dSVGpmZTZzTTB1bmpoeTFwaDNJZllT?=
 =?utf-8?B?eVZ3aFpBdzYzZkNhQzl6YkZ0R3hsaEhqV3N1ekVDUVhEVUl6cnFEa043VlFF?=
 =?utf-8?B?eUpFUnUyczJZVGNBNnphRVdTbXRCTEVEck1LZjh3SlVFcVBSc2hEVisySlVp?=
 =?utf-8?B?b1U4SFh0S01oWnY0NHBNNmo1RWVtK3R2TmZsck41UmdqbHMxcnJza3pLbGZp?=
 =?utf-8?B?b2xkeis2Mm4vQlpjNXljMmFXaUJrdGRwc1dVaTNkVytRaVU5YXAyVFQ0TzR3?=
 =?utf-8?B?dFFiMHRTU0Z5OHRCWDZPMXFkUHl4bWhTQUwvUkxkQlJuTCtVRlkrU0wreUFX?=
 =?utf-8?B?ZjAwMENtR2RyVm42U0VpM1U5Y1NFOGV5UWxHaDlGNWhXbS9HeTcrSmNVRjln?=
 =?utf-8?B?ZDlvczFYclI0bjlGaTJSZHJzZDlwcU4rbUFzUUZJM3NEV01tUkRtRm8vRXVj?=
 =?utf-8?B?VjdsYmdEbTZ4VTJvODRucThZTnppcWp3djJkckVxK3U4dUFSQ2ZWa3VJcWpa?=
 =?utf-8?Q?Pxx/+nzPMIeBRTC0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698ba661-d81c-4d8c-cb86-08deac39d039
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:09:04.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtgxpTzszPCD8rcigMpEWLZ5Q7oLQbwtSK+kd2gV3x8kf8QAHENlUvW92lMTnMKJuz26DJKdsDENyekMNwljYyX1DrVCiLgDoLG4C6WWx0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB989137
X-purgate-ID: tlsNG-c201ff/1778159354-E1B9E443-608B86DE/0/0
X-purgate-type: clean
X-purgate-size: 1068
X-Rspamd-Queue-Id: 3A83B4E8EE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 5/7/26 12:28 PM, Andrew Cooper wrote:
> On 07/05/2026 11:55 am, Ross Lagerwall wrote:
>> There is no need to explicitly enable/disable local event delivery on
> 
> While the name of the function is local event, I think this needs to
> state evtchn because "events" have a separate meaning in this area on x86.
> 
> Personally, I'd phrase it more sternly.  The masking (or not) of evtchn
> has nothing to do with GIF/IF.
> 
>> stgi/clgi since HVM event delivery already takes into account the state
> 
> STGI/CLGI.
> 

OK. How about this instead?

x86/svm: Don't mask/unmask evtchns on CLGI/STGI

Whether or not evtchns are masked or unmasked has nothing to do with the
state of the GIF/IF. Therefore, do not toggle the evtchn mask on
STGI/CLGI - HVM event delivery already takes into account the state of
the GIF/IF. This ensures the behaviour is consistent regardless of
whether vGIF is used.

Fold the functions into the callers since they are now only a single
assignment.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>


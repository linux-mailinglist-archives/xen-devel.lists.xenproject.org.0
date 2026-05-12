Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFvGJ8tOA2r63gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:01:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE89524421
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307119.1578848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpXO-0007J4-4e; Tue, 12 May 2026 16:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307119.1578848; Tue, 12 May 2026 16:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpXO-0007GW-1u; Tue, 12 May 2026 16:00:50 +0000
Received: by outflank-mailman (input) for mailman id 1307119;
 Tue, 12 May 2026 16:00:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMpXN-0007GQ-3O
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:00:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpXM-001f5C-GT
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 18:00:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a034ea0-e002-0a2a0a5209dd-0a2a450ce802-48
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:00:48 +0200
Received: from [40.93.194.54]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a034eae-62f1-0a2a450c0019-285dc2360737-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:00:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7932.namprd03.prod.outlook.com (2603:10b6:610:24e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:00:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:00:43 +0000
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
 b=biREu3GZwBgapqgndEkFO7oXJB4jJCeQvm4OD6DvrgT+HgBfThH42jK0mqyOSKSm2d3a+qEsC7ZSSRTmw+tUk4f8IU9lvOhcUakGXhCW1AnJvIS/egM/j/9uJe5fMsvT16VtSUYPwzuSuNHpcuGG5WbEE6J5aEaBliVDjwOcp+20jyVu/r9A98/OQj0e8OZDwwhW7azO8BOj7gZ7StclxQo6l/E9b+MMOZJjzOyhOBTev2jN31jvgmOzhPkkql7ALndRTFrfG1oPG/jRcomgoFn9Q3Qao+A5hKZovPRiNWHy9CoLTmTrH7lZtWeGaobAFJjL4j5WeDqkk5gXHD9bJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhT6Vs6Jx06fGzR4NA3PVDjreTWo2DacVg2LjuEUJ+4=;
 b=uOgXXxc8rEJQQxWOHDLcqMqjRa1SZAFCyq+W8ovmhL1zku5cWTnPmqZSjybj+Gvw7pujm1t0u4mi/c/o20STTa8/S0Ne8LFowxMGWzR1IhHx1pq44tHqStEp/hsJ35At4FHx1C55Tp6AYAcqU2rh+kNdBA2kQAa3BSORKq9INpcA7+No0zj+lSCaBQpeuXH6RqFaJvTQcfUsjYPRTaZ/P3RWltBnnDnawA8Mjrvs1KjXUhE36gyhQ1BUdMTfOipCSPU3PmjKTv4oXVEussR10sHDJetvY2ioi9POPZrJDwJG4qNWNQ1/7FXPB80S+IB4GxijoH7ZYOAObrsESoxElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhT6Vs6Jx06fGzR4NA3PVDjreTWo2DacVg2LjuEUJ+4=;
 b=G22ZULkkc3v2K3DR/BX4T3/Ken1sCZtTw4LQdrtkQORkLajic4otfKzRQYZlb6R3H0vlcMQrL4k5+zgwHMGXesvKXVBhNEfbbHgQhp6FJdHVTU8cWOqcbJSJETlN73Lzi9xPQKufiHnTqo7UYCGryLcM2voWA1DFrM+vmURpN+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0865df94-79bf-429a-856f-498e96d1fbeb@citrix.com>
Date: Tue, 12 May 2026 17:00:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v2] memory: overlapping XENMAPSPACE_gmfn_range requests
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e3af387a-dd8b-4d58-8356-777319c7a2bf@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e3af387a-dd8b-4d58-8356-777319c7a2bf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0629.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: a06ee24d-f53d-44a6-295b-08deb03f9f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	o0/uOW/lZwzxw78zA/rIV7HJH1ftEeKGPsY467HFcZJnkErCiqz0mLPjL5m2bFwei+QJ8bONTCMwbkwFm01W7FOQ6QqyjX6t+661V+loyf1ZRsY4/kuydf7DYTDT4JK3r4McJTKToECmu34JqxTrvTLw5SWe/T0YngzbLsAa3qUhK8fYYpG1lEXo/xuU6fab4fPm176QQ6P6eRObQV2qWq0FTR5S7lvmKxTgqi5kcLToqdkC8Uj01Gf9d0JZ24prcxnQvrvfn0Mdf4+pNScCDgNKagAPYaZX+P1u7lFWUOx945Caf7e4tAAUi7gsan5XAHYgmT9VamwHX57z+FYNGLDF/cV+D93BBD9nBGHgbd6k/49MwzR0eEoDlqP5DTiggjlsCQV1QVOXpgRKLgdBUFTdN1jVjI19zgB9FOzzc6Rd2t3n7RTicL5IhhXLaxoBfmmHZHi5qzMWac7qad1ycC/FtZe1oJ9tjw94vjTaU9kDynu1ACC6rjXjHWuinMLlo4BACWGSkd7fbLxPf+54d9NkzvszO4Xo7a/E8WMuQi16YFuEKUugodcgqM+fAP07QhU9uNSNk1mQ9N2Lq3aYOn/ucSU9absnsb5q4HOCgDh52iwOGhtYsBlehax87IOUnGS4PaE2NTNsL2j+Cl6DB1ytGJG4XnaQsae85GA1zf9ndZrqGC5hdIXbRfZ3ZOvz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEZYSVVXNjFSclhmVldpcnczVUpLcFo2ZzBESE5hZ21QcmV2NFB0b05kNTNv?=
 =?utf-8?B?TERMMnlqUE9MSGVMN0J2eWZ2V0JoMjJDT2FiL29tOU9OMzNtbDdUanJnWFN4?=
 =?utf-8?B?USt2L1VldFRjNnBLV2d4SDVJKzJpSHdHSUdxUmUzRldqN3lDYkxGZmNiVUlV?=
 =?utf-8?B?NldIVWI5cXR6T1AxTjk5d2x3NGdLeWNxTVordzlQR1NnRGh0a0QxN0dIeTJn?=
 =?utf-8?B?MEx3c0d3d2xRS1E2UHNrd3l3ci9CdHYwSFlmanpwSFRkbkNMcGNMZWZQTFk4?=
 =?utf-8?B?T2NrRlgrdmRRUWh3TDFDVVdOekFCN0VPVjNVeEtkQnhVTUg1Nk52QzBwa0cv?=
 =?utf-8?B?K2syWE84QUo2ekszbER4NU03Q0lHQ0hZOTRqVnFVOExNd0lZOTUyQkVpaCtt?=
 =?utf-8?B?bEVJc0h4Q3lQYmU2WE9RY01UN0hoaHl4dDRwQUlXdzFpdGVuZHRiK3lQZHRl?=
 =?utf-8?B?NHpVQnIrOVBtZzV3dzVsVzVwQk5xNVNkT3owS1lCVFp0VTBMbUY1d0RSQmtD?=
 =?utf-8?B?YlR0S09iMllzMmhkN1NCMkRKZ09DQ0pWTXhqc2xPR010bkpWWEJHRU1NMW5m?=
 =?utf-8?B?ZzQ5RnJ5eDFPb1dmb0FOWmRYVlQ3cHV6UFBQSFFKK2dLOTFENXg4K2cxMG5S?=
 =?utf-8?B?Tm9OZHE1aE5pbmhxSFR1WTNUbkI1ZlpxT3IzTi9tcGNTeE5rZTBjWVFxd2dy?=
 =?utf-8?B?Q2Q0VlcvSUtDSUtpc0VTZ2xUK2Vzdk83eGNXd3c4eWwwZ3NobHJsK0NGblh6?=
 =?utf-8?B?V1BMOW1ad295WlN3OUt6amhXbDBXNHc3TUpES2dTb2pkcWRJdUhjT2o5MjdI?=
 =?utf-8?B?dThpWE9kcjg0THhnK2xicmxCUVQxbXlZT25zZ1QzUFBXNHROVDRYV2RTTlFQ?=
 =?utf-8?B?U3EvUnFxNlRFeXRwYUp3cWhIWEptY3VnWm9IODNQRkZTZm1rTG5BcVRJbHha?=
 =?utf-8?B?Nk9tUzg4djlrT1V0aUJYOVdUVnk5SzR5b1paWS9BWFNsa3JNcFl1bmVaU2hp?=
 =?utf-8?B?Uit6MFJpWDdDRUJ3YlJOaWY4OC9LZUNNaHhWK2dyVlFKU0NOM25wRTZ4SEFL?=
 =?utf-8?B?cHc0L0U4TGU4VzhZNC9IS0hlVmlUUDBtY0ZsK0ZwYTlsSHhtQXJHYXBJRGt0?=
 =?utf-8?B?L253SDh1OUpyRnFrMVh1UytrTklnNmFPZVhFcVRDU1lpUUpkSFNOb3JFcUJ2?=
 =?utf-8?B?d1BRNWtvcVRRLzJUdDR5NXdoc3VGcjhuVjIyUTY0L3FoZURiNE5GdmtuRTFp?=
 =?utf-8?B?ZVFEalQ5dEp2ak1sV2UzMlFZQzRZSm05K0hwaW4vZU92UWZpb1BpejAvUW1B?=
 =?utf-8?B?VDl4WWdnSVFobm9wVlRLNVVEVTU3NDZtWU1oV3ZCRmc0QmRYeGtOUXVhd3Nr?=
 =?utf-8?B?OGtiUzVDa3h4cktnbzdKTDZsV09GRmo3UFU3OG1rQWF2VjdqeUN5R3NqUU12?=
 =?utf-8?B?S08vOXVwVDQ2NUVUSGpiVzYxajcwUXNSNXVjVUhRS2hreUk1dkhVWVRSL2lL?=
 =?utf-8?B?UktEUHBNcjVzTi9VUzF2RmhaNEswYjN1d3A4cmtNZ0xPMW1PZlJTZzJmZlda?=
 =?utf-8?B?UUhaNU5pSkJ5V0JUV1JOdEtUdERWWUJNSUhpMVAyb1RVUm9iOGJUNm1xUEt6?=
 =?utf-8?B?OGNYektzRGJrdnphNWdBM3VESitwU01Kc0JaS25hbkg5dVV1a3I1UUQxcFlY?=
 =?utf-8?B?UGpMNVYwdUUvZVhtcjlVV0FhWW9VN01EdWJ2TGJraFRlVmpGWlRCdjRaWXRF?=
 =?utf-8?B?K1pMd1VnOU5pbWJURko5US8yc3NEZHFBalVRTnY5TEJwWmVYMS9GbG8wTjcz?=
 =?utf-8?B?alNzYWFBZmRVQkVDZWZXODdPbEVqTjE0VzY4M1pBdGFyRHp4VWdiT1BGK1NI?=
 =?utf-8?B?bFNkMHk2QTVaVTdITEhYZEpFYllOcjM4OW9pZHdjSjdDUDZJU3Q3ck1zRWNY?=
 =?utf-8?B?M1l0V2RncS9FZXJUMzlyYkxqSi9zSm5Td3h4d3V2U3BKNTlGbWZVUDVIdlVU?=
 =?utf-8?B?Q21wVXBEM3p0dENNRjN5ZmdtSGJwdWtka0ozZ2k5emtyQlFndnp6SnNHNXEw?=
 =?utf-8?B?Y01ZZlBDaUhpQ2tXTUdsSWkvSDJsTWk0cFplVVNKREJZeHhLaHlCNngzVVRt?=
 =?utf-8?B?UHhpMDYyd0N0anJaNUlzMHhyeFFEODJnOUhEVUFKNkIySTNLcVZtK0xUd3BC?=
 =?utf-8?B?djI5UTI4enVpM3NVUUFiNzNyV3FuT2hFRXRJTURGWmNwYUFjS205NVhtbHlW?=
 =?utf-8?B?YVhRR1NSTy9DZXEzVThMN0RSQjNEOWZSTUZJazRTUXNzV0E4Z0x5SkNQSVNY?=
 =?utf-8?B?Y0o4cFc0TlZyMi9vc1NLMVFPcFp2TU5EN1RLWi9nb0ZGbC83NXR3ejN5SEFV?=
 =?utf-8?Q?E+cEi39tG9mivis8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06ee24d-f53d-44a6-295b-08deb03f9f41
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:00:43.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sORlPqzh95AN9GHyUr17VkqjNp62IlTR0EF33wrW6K3t/Ps8E8L6ylBzk8oRGbcgFY43nPF5f96vBcioq3ykG/UnGKeyAtTs7minByZacOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7932
X-purgate-ID: tlsNG-d25034/1778601648-DB370CF5-656EED0C/0/0
X-purgate-type: clean
X-purgate-size: 1120
X-Rspamd-Queue-Id: 4DE89524421
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 22/12/2025 10:33 am, Jan Beulich wrote:
> Overlapping requests may need processing backwards, or else the intended
> effect wouldn't be achieved (and instead some pages would be moved more
> than once).
>
> With some adjustment there this also covers XEN_DMOP_relocate_memory,
> where the potential issue was first noticed.
>
> Fixes: a04811a315e0 ("mm: New XENMEM space, XENMAPSPACE_gmfn_range")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course an alternative would be to simply reject overlapping requests.
> Then we should reject all overlaps though, I think. But since the code
> change didn't end up overly intrusive, I thought I would go the "fix it"
> route first.
> ---
> v2: Adjust XEN_DMOP_relocate_memory handling for the working-backwards
>     case.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can't say that I've understood everything going on here (hence the
test case), but the test case says it does fix the bug I reported.

~Andrew


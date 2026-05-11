Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GOAMp6bAWoBgQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:04:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C750A8BC
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305869.1577995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMMXw-0001EN-I8; Mon, 11 May 2026 09:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305869.1577995; Mon, 11 May 2026 09:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMMXw-0001C3-Ei; Mon, 11 May 2026 09:03:28 +0000
Received: by outflank-mailman (input) for mailman id 1305869;
 Mon, 11 May 2026 09:03:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMMXu-0001Bx-DD
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMMXt-002OOg-Ga
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:03:25 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a019b5a-5cb7-0a2a0a5109dd-0a2a450ac0be-26
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:03:25 +0200
Received: from [52.101.46.61]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a019b5b-56b3-0a2a450a0019-34652e3d6df8-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:03:24 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CHXPR03MB989196.namprd03.prod.outlook.com (2603:10b6:610:2fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 11 May
 2026 09:03:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:03:21 +0000
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
 b=JHipfDw9CgvUej9oXf1nqoePBZmrlOGjRGPQJkE1oEKh9Gr6A/9fPKMuICPc0tZyDOoE8QWIpVcIkguHV641iQVgQvinhk7JljajVHv2ejb/R6zSYGa+wZfJWV5OdcWFWwPiCgsSx0HHLZGdLANJ22XRYk2wlNI3nqu8wR7PNN6QqlU0BJSRZ05Q5SAKIy/PGcnhofhXhpMiVRxpdogIaysmLt0kY9gHRBJOX0A4mpkrjNkSih9AFgGIQP2cdp5sn4+DCzAV3TXpqxoqSX0UQXt+3f4N+RzlsoQR6gz8Y1mFqjq/qoFPSB+CUpv0Xtn0QOZA/MHMALrDpIzhPWpqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oG10SayMrqEogdE2+xZWBJaUMiEzpOs9UQzcLRW+Ww=;
 b=KtxeXimqngl3hXqmSsohCBUMj3SC+3/9TpLDvH7DlAmlrT7r6cZTWo1j3/eo6ivtxpu0rIkdXOADRHt71aUlUYikMe+oBIoLhCBT0NvlHnjmMzTEYn2cOkrYTxFJifNXmHzHlZTsN3BGYdzIzcbrhZ4OkGo+IwLtA6U4pTWsIYqcHdzByaK5neMqwQoZYkeAJEFkEN4MtTMQrGEB8vy9idQVB51pbuIxrS1OPrtDf+rrb/NG9KX/bPeRRxGEwNEaTUnnqQ4gWtD4kMCwERNGsYtfgIuwyf254seBiKH8SHrpCPRSJ+LkojGukVF0LKIj27pkXr4MYv3lmQ6IKiXqDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oG10SayMrqEogdE2+xZWBJaUMiEzpOs9UQzcLRW+Ww=;
 b=mABMZweKq4SwwIT2R9k5+YoKfNAP+15v2d3QeR8JROcsE0cbz4c8NDEalfC76KANKvedoRsA/VqahmlYyCcYKT+wZYrd4j1LDz+uFs2BvO56PA8ktRpdDhv+UkPpmmTzVgVUNU+O37QVOq+xuruAkxTGE0uQn3gREEwOAEqwkII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <455c64a2-bae4-47d0-a2bd-902be3ea6127@citrix.com>
Date: Mon, 11 May 2026 10:03:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/5] CI: Adjust test needs[] to ensure binaries/ is
 non-root
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-2-andrew.cooper3@citrix.com>
 <a7932bc7-86ad-401c-b462-01078e6e11bb@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a7932bc7-86ad-401c-b462-01078e6e11bb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CHXPR03MB989196:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3d2c57-5bd5-4538-8f22-08deaf3c26a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KxxFo/xKxei9fftduC0OLH19yXKoyBs+guE0+0FdICmz5Ja0k2QSsEm6xz6e43tWCr0fzqjqMIsD4Gvdac/O2vcLDiOikgo/xR9IKWNDwrLudjxrBuCGcjATpO+JvbFGzRuSxtZUYCwU40RmXuWYbf+aDdSVdg/5L3SXya+XN0IhpNRuL+3h9opbxMHWj3a2KWm3Czyn8j0NSds+TXIBbJOLUBZ+Xisx72WAQzWy/RZ1aU80XLm/nmHyC/qC9Wk5JyF0mINP6rtQEn7Etmago3KESEooztOse5cm/KIIvT9f/p/qBESRyc8trKI/bw1m6vYqAGb48cA0MKaid8Tz8DhsoH85EGv4lukpwKR7S+wqwP43tqYJj4ISMvMPTEQwvc2MkpB9hX2M0DUP0IoZEERIto/jX61QqeHrKbSAoLuwWTmg+go8ndt0yt+l6adir1cl3T2hwnZtlopzF0zyWEi38MDT9So/NDZtV1NTwooST9j4gS1NDiF8aHBVGUJStnbesQs6/scrKGf9sHrdj+O8jIZafwKXNhfBkEezV+tblQ/JeG4f1MkBvTNp5PJu99IYkgB1N4rf/0cHHFdrH/Af3Lfd+7qVX5fYNOxYWiBTa/xmwo3NmFszU4jPxdeVohENTELWGZJrrOuwiaP28GfzPIZcQ8CaUemPCHKmeNeanegMP4M0E9hfFE+igNl7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHNTSnN0aXRITlo4TjNvYkN1NkFSZUtwTUx4SUIremVDZ2Y4S0hRbGF3SmVL?=
 =?utf-8?B?OGJ4ZFpNdkhMZ3BqSE1BVm92anVxWVk5WHZzaHpzZXVmSFcrZkhwd3JETDFj?=
 =?utf-8?B?Yjg1TW5wcTVyM1JGRXFKaHZnMW5HaTd0MEtRSlk4V3NBUWhCSVdBd1RINlNt?=
 =?utf-8?B?QmFMSTNPaEdqdzVKQXpaWEZZeVEzRnRZOHlsdVlvREJ0d0dpN0F3L0xxaUR5?=
 =?utf-8?B?dWN2akEyS2k5bnRyZ1VmQlJkS2Q5YnI4UFowQnplajdhTmo3MDRhYnJmSlhq?=
 =?utf-8?B?Rk1ISkVvMEphQ1ltVWw5MVpCdW1mVEJTRXlPKzgvNWR5L1dZOTJRUVpYTlY3?=
 =?utf-8?B?MlVyZW9QSVRoRFNpdHhJL3R3WmRPc2pHM0JGb09DcHRkQnVFc0pESkFpOVh1?=
 =?utf-8?B?OXJtM1dzaDhVZ1ZMVU5CV1k4bjZDTjRGaktSckN6VURCS3NWR2E4NXkwTklV?=
 =?utf-8?B?SE5BUUpJSTBCM1MvVWZoNktMZ2FzSm9BNW9KMElJdFdWUWdJTk9CK2tCbWc4?=
 =?utf-8?B?T3dFUFVldEppSHllaTVjVDRsT3N4RmJEc2VTOXRadUxmcEFOQ05rTjVRVzJR?=
 =?utf-8?B?dXJTcmgvcWpUeGhkdUQ0c2JSYzdFcUVHa1l3NEtoOEpFQUpMTHlrRjcyVjIy?=
 =?utf-8?B?blBzNHJNYnU4dzROYVduLzVSTkpJcHZNRHRMS0p3NXAzVHpzNHVTMlQ1emdG?=
 =?utf-8?B?WWtOZ1I0eEZBbWJpanhjSzlvOXlTMVFvU0NMRG5PL3hMaFE0aFFNK3FJTkpK?=
 =?utf-8?B?azhnTnErY0xENE52eVBpVTNCVHdQTnU5TUcyekdpSTQrSTBPY1Q3Vi8xNktR?=
 =?utf-8?B?YUc4S3RxM25zUDZsWEdsNGIvZWoxcE1JNWt5dDZnVG9LWEJzVXNQamxVK3JM?=
 =?utf-8?B?NENLWDdSdWRSRUtTQ2tYRXRYcDkzd1IyWmZHWHQrNnprd1pUL1pzSy9JZGt3?=
 =?utf-8?B?R3QwU3ZlellZYnVFQjhUdHNTVHJjUWpQVjZnRldYMWNZSk9oWmE0UTR2cUEv?=
 =?utf-8?B?VkcwNzRRZFVKeGJXbDdLVTkvZzJmaHRHRmRTMmhUOFhoY0dvV0ZNZEZMMmpn?=
 =?utf-8?B?bFJ2ZEF4aDRjbzd3clR6VWx3MENLTmkyYW1rQnYvTUdxbVpXYVRrTHlnaklD?=
 =?utf-8?B?VEV0MjMrOVA0TlcrOUM2clJzRTRkSFp5Tk9wSkpsOGY3WitHUFVIcmlqaUZv?=
 =?utf-8?B?NlNCdjlab0lhVCsvajJudXJmemtCbkhhMWNsS3NDaW9RNW1EUnRlMzNWa3ph?=
 =?utf-8?B?VWttTUlDTHF5d3ZRQ3ZsSFVUbERSN282ZktTVTNIajQ0Z3Q0WFpYa002KzVm?=
 =?utf-8?B?UG5mM2gzSlN6S0ZXazk3WCtVV2VYNmhUVzNkcGovZ3NjS2g4a05pdGc3aHk0?=
 =?utf-8?B?VndXdE56Zm4xYkVETmZyNDhVNVU3cFNWVkpzSWhIcVpGQ1ptVUhUSUN3NkdV?=
 =?utf-8?B?bERRbEZwWDNURlhQdkxUeDJLYzhIU1VDZnc3T0ZwNmxWUjVZeEcrSGxvWTE2?=
 =?utf-8?B?ZjRsNG1tMFN1SWZaWkdmZ2hZRktxc2xvajVEL29WYWJQcEZCWkwwd1RraVcx?=
 =?utf-8?B?Y2cwaERzYUZhaGZsdDZndnlSZ0NLZ3ZIdUtHQTlHcTVGK2dhbW15L2hsM0lO?=
 =?utf-8?B?a2cyNW1MOTdGYTYwZ2dCVFZXOURiTzZLZlViZ3F0ZFVwY2NmdFFlbWlsdnEr?=
 =?utf-8?B?NmhTWXJTZ3g3ZUIyZ2g0TmtsdXdWUGVWbTZtek1CUTNVekJsTEtPSzUwelZ2?=
 =?utf-8?B?VXZWMTRqYlFRbm1leThGRld3alRSOWtKVHVsRGVVYVJwMmZTY2NvTTM1UFpo?=
 =?utf-8?B?WWxKa3piYXJIeFNpR0ZpYXdDendERXlBTWNZSVFiS1N2My9CSG1uN0wyV29r?=
 =?utf-8?B?WXhBKzhMMGJLTUlZc1dzSWowRWlvVlZ0V0I1bUJQNzUveUowUkxkZXlHcXVF?=
 =?utf-8?B?R3NkQnNxc0VFdnJBeU1tRVlzK3VFaUxoaEFDUGlRYVdWc2UzcEgzalMrR0RM?=
 =?utf-8?B?QnRJSld5TVFjUFpIWUlpUG51eHk3OERPQmlIaWpJK0FlR2VUMFF5amxIZ1Zl?=
 =?utf-8?B?WkJ4UEFwNnVyNFhQQXFYMDQyQlk4NDZmamk2U2hjK2hWRHBVWFUwc3BoZVRs?=
 =?utf-8?B?eFJaVUludnpheHFWem5WU1VtQ1BWc2pHdmhzTVN6d1FreERmdjVRS2JBU0NR?=
 =?utf-8?B?MU5GOVhqY1k2TFFVVWFmc1ZSdXZnYmY1aHJaMG9VK3J2UE1TNnI1OUt2TXpI?=
 =?utf-8?B?Zys4eGFLK0JGblJzbXBNUnIrUjVWeVJzMEh4UjlydUlVaXduOW00RTBuMXcr?=
 =?utf-8?B?c0E2bEU0TzBPOVZ5TXUyc0NiZVNkMUNtczhpbkRzUDVJdjBCZWVhV29ObU4w?=
 =?utf-8?Q?MIIi0NUGWYC/1sTg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3d2c57-5bd5-4538-8f22-08deaf3c26a6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:03:21.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suh4hkt46wXsZw/xsviipvxZ2npYXdrSwSyk6BZIRIIfiFyfjE/DyoKgDq0E756BZAup/n2AH0Q1k7k88KPu6O6pYZTj36xCazategNZ2Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR03MB989196
X-purgate-ID: tlsNG-4011c0/1778490205-73D788B7-BCC99DF0/0/0
X-purgate-type: clean
X-purgate-size: 3131
X-Rspamd-Queue-Id: 102C750A8BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,cardoe.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11/05/2026 7:16 am, Orzel, Michal wrote:
>
> On 08-May-26 23:29, Andrew Cooper wrote:
>> The binaries/ directory is a composition from the artefacts, and also used as
>> a working directory for most of the tests.  If the very first artefact is from
>> a root container, then the test must also be a root container to use it as a
>> working directory.
>>
>> For arm64, the existing linux-arm64 artefact suffices.  For arm32, pull in the
>> microcode-x86 artefact as it's the smallest available.  This bodge can be
>> removed when all build containers have become non-root.
>>
>> For the qemu-xtf-dom0less-arm64-*-xen-version jobs, use *arm64-test-needs
>> ahead of alpine-3.18-gcc-* (as it's a root container), and to deduplicate
>> the *-export dependency.
>>
>> This will allow us to change containers to being non-root one at a time,
>> rather than all in one go.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>>
>> We should also stop using binaries/ as a working directory for the tests, but
>> that gets very complicated very quickly and I don't have time to do it at this
>> juncture.
>> ---
>>  automation/gitlab-ci/test.yaml | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index 8770c523e228..517af1732437 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -15,6 +15,12 @@
>>    - qemu-system-aarch64-6.0.0-arm64-export
>>  
>>  .arm32-test-needs: &arm32-test-needs
>> +  # Bodge to ensure binaries/ is non-root.  Can be any artefact which comes
>> +  # from a non-root container, and microcode-x86 is the smallest.  Remove when
>> +  # all build containers have become non-root.
>> +  - project: $ARTIFACTS_REPO
>> +    job: microcode-x86
>> +    ref: $ARTIFACTS_BRANCH
> I don't see it being removed in this series even though the containers are non-root.

Correct.  The Alpine container still being root is discussed in the
commit message, and is why ...

>
>>    - qemu-system-aarch64-6.0.0-arm32-export
>>  
>>  .x86-64-test-needs: &x86-64-test-needs
>> @@ -569,16 +575,16 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>>    script:
>>      - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
>>    needs:
>> +    - *arm64-test-needs

... why use here is ahead of ...


> This also pulls in Linux image and rootfs which XTF tests don't need. I think
> it's much better for a test to list the actual list of its dependencies.
> Otherwise you are asking user/developer to dig into the yaml.
>
> ~Michal
>
>>      - alpine-3.18-gcc-arm64
>> -    - qemu-system-aarch64-6.0.0-arm64-export

... the alpine inclusion here.

This can get reverted once the alpine container is split/reworked, but
not before.

~Andrew


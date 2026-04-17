Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFZoHHwT4mnZ1QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 13:03:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D614041A9F2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 13:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284148.1566041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDgye-0008MD-LR; Fri, 17 Apr 2026 11:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284148.1566041; Fri, 17 Apr 2026 11:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDgye-0008JA-IZ; Fri, 17 Apr 2026 11:03:12 +0000
Received: by outflank-mailman (input) for mailman id 1284148;
 Fri, 17 Apr 2026 11:03:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wDgyc-0008J1-7n
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 11:03:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDgya-00GVVK-SP
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:03:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e21363-bab6-0a2a0a5309dd-0a2a45099c7c-38
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:03:08 +0200
Received: from [40.93.196.16]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e2136b-2497-0a2a45090019-285dc410a61b-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:03:08 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6593.namprd03.prod.outlook.com (2603:10b6:806:1c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:03:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:03:03 +0000
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
 b=UqCpAzScKlKPgxlsFF8bB2DNqa7wTY9mry/y1jtwVfMfmkK5I1tV/2MW8e4qWZauWX2oRzYASXKa7oEFXqfT734e3BftmHXzgMfXHbfnz8rxLeAR1fw+g6GnQher7XGQ3iQIUiEeKX/tHxnpjX5TcKel7vuW7nMANRjXv/eoJxvPOUhOUWqxVyqJh0C7kWzECa4xMUX8eHPSX41bkKXSNNAeOLHmuDGd5rRAYL20e36EhP5tK1AsXmi0Tu/o3lR9+OpvnD9sesEPGQcbGk/JX7OZCLg4mU0OxbCtKApXACwE/A0vzEdzhQHPdhH2l/TMC0kc0vJSJ653i9ljxBYmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXFFW5cCNEJImpfMu8JNAqwenfdf+U33IxhgXjoAFSI=;
 b=kj8jZpHVyZQSzHqV8k8RhOurFE143io4V/5imBG1RwQ+GHHOv0TzKuXSAXrfWa1zz0OPlqR42UQ1Zhr3gyEGcWX3xRmzG2usaANN5B6GbJNl1pjEh6y9FU/dZDteureP5Jbowlw2b5ysIrZYGBX59DUXZLNfKdEvPCIEtIUQ9+LZcjEbPLruiTTLdEqoqQ5lpHZRuUbIFmcbsjJlHLAYIiiVQqvOrFSh/ilhN/p65LAizGgI3nohTaYehwu28vaZxIGRgv/GmWB6up0IFVS2jmWkSiXqjdmK1IqXBSXNADK/br/J0xC+j9brQR1VHXRzvTKeAG7kLxOh+O0QtpctYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXFFW5cCNEJImpfMu8JNAqwenfdf+U33IxhgXjoAFSI=;
 b=XyevdfQ5btUfGkCG8GiFtmcWv8/pw+8eVm9MGiIy7zsmdJuC8ecnI/Maga5IloWDCGMI68XvuOyhmoVQlpxU9v0pKJIFHC/QnfKX4si/8EE2qgtS1FrMU4bMc/wvvK8435lRMK4sYwSAP1pDqpER0Qt3zzF+NsWsKhEKrS5/HGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a6b71c55-fce7-4995-b38b-83133d702bd5@citrix.com>
Date: Fri, 17 Apr 2026 12:03:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/mkelf32: Actually pad load segment to 2 MiB boundary
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260417105425.1184232-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260417105425.1184232-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3PR09CA0021.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::26) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcb582f-3a8a-48f6-cae9-08de9c70e5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E71QjShRyuxGK8NpDEh9ZxskBGeN8lPDcw8BcYb0jC4WFY3t8Ewu0PQ12CTVPvVNH2PoYQ3aqp4xmyMkjR9D5hdVedh3bwyqP99cdswUBfzdlKyfF9FIeynZbrkvh6DvxVr2AUHkeObu3r8faEkYgdqi1X7z3wa1gSoq24cunDsG09v62ta055LecXxvm6FTPmTaJqGI4MKuvL4/DLsQZpvtC8pg3wgnw402JE0p+Po0eno04lfFMxtZJjRXGJ4hiF8CkrgDutIj1bjudwA/hza2oA8/YcLosC/yZNIZvKRVbrDS/lo/dILgNNHFojeCLnFsM0qvbGiBB47d6p7ZKti68kgupAzKCm9NlKuwzmhA3vQBwv3R02R4cSqzryYV2VC0ioIM9ceYlZz6tM08fol/9nPTEllN6upUnJIWRfiQHxp+y0OV0bjA6Ue93Q1F1ByOX5CnjRFxe4sCa3qLTHSDwz4/01QN66s1BS0AVtd93NvPi5+GeePPr7NLn7XQV+4n6uECrdI6oNdwkgbQmwnAvMmWAoWDK7WMKLgusL1646rsU3gWN0B7LButd/cpHY/naRXLyVX5LGZXkFoBFXmhXPTw8m/dA5Kun1XygAs/1PTv/nZrQNPY8Em7hl0UkOhGn8RZruJkZd7pvUKJysznmL8g3Y5Ept5yOaRYRrMsTQadXRlkGbRvu1dl6VRjxPNN7VKNAC3qJ056hDGaUIdXAQeLT9+rhYUOD8wStjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk80Q0tlZDYvcHpvVWlXOG5TR28wU2hhRmdpNWFBOG54aCttbzZ0VUdvYU1I?=
 =?utf-8?B?d0llcERzcFpDWlV3WGZzSTUzZDZvVk1zKytHdE9rL1c1YjJuZXR1MFFENGtv?=
 =?utf-8?B?bVNKNkRWRElzdnc3bHhOd1lNSGdGRFFhMVJxRGthT1o2WHZReG1VU041bkZL?=
 =?utf-8?B?TVNrQ3dvTXVrQ1B6Q29WU05Vd081YXpRR0xuRk16aGFaeTZLbnpqNUZiWjNn?=
 =?utf-8?B?UURhU0VxK0pGenZveFpkdkxvUlJVWVhtZExwb09rWlBsay90ams4RHA1cGdU?=
 =?utf-8?B?c05rTlpTYW85RlQ4bjYvenVoVWdqNkRVRkI0c1lLdWkzQjdiVWdVYmpsS3Qx?=
 =?utf-8?B?R1UrbVVhQVhUOXpZYTNIOGZhS3k0Vkh4Q1lHbFRDTGE5UlpoQzZyajZyY2Y1?=
 =?utf-8?B?K1ZCK3F6ZlAyNGxGTk1BakFISllKSFJnMWZUa3M0YkE5cFpMeFVWRy9oRUxk?=
 =?utf-8?B?L0R5WHpsTkJaa0VWRzBCTkRJZW5FMlNYUGZwRVdQVzNlei9IbkpwajVGV1BX?=
 =?utf-8?B?c2VKaEh4Wm9aMTIyZnFFZ2pIbEdGUXhtVlZBazdvbVlXeDVUWlJGV3ZFRlM3?=
 =?utf-8?B?MSs1Z3B5bGZBTTg2a2V2VGxHNTUwbmJBR2trcXp0K1lNVy9vb0ZrZjA1UGJh?=
 =?utf-8?B?WWl3TStNaisvQSsrVjczR1V4azBwRUtKUitiZTVuNHAxMVp3YlRaR3Nud2Ja?=
 =?utf-8?B?Z1ViWVpJOEZHQWdzeHYyK0Q1WW52WDBEUkVxZU5uaUtGelBRTzFUcXo0UDh0?=
 =?utf-8?B?VEROQ0gyR0JQMitJYzBEUmgxd2lmVHhvWGxXSUVTVkhKV2V0Y3VuQk5WTFB6?=
 =?utf-8?B?MXVuVUlrQldhTDh1QjNoTVlRZjVnZ0VvVldMWlNocFl0T2ZlNHNnbi96aUlF?=
 =?utf-8?B?ZzdlNzQwaDJwUy9tODFKSzlzU0loemtMM0VzQVBOaXEvZGcrMlZhSUNEM1NB?=
 =?utf-8?B?TGJjRUllV2tHdE9BcTNHcFhFWXRlQWNxSVhHS29md3JwV0VwaDd4NldnS25T?=
 =?utf-8?B?bmxodHF1WTVEQnVaWkcvd09wS0N4WGl5dHI0ODUwM2xabmtPWkUwZm13NWdR?=
 =?utf-8?B?eXJqTTVFYmlWaE1jUTk0Q1RkelIzZGNNZVBnY2dGdDFwbUE0YjhlczhBcGQz?=
 =?utf-8?B?SXBzaWszYkFxSWswWFlYYnpzNGo5L255ZVl2dEFoNElxUG83ZjBvdHhOZlh4?=
 =?utf-8?B?SEcreU1BMlBVdkhOS3FlSlBLdVFFaGpaaGUxMnJXNEVhc1pJN0l2aDZIc3Rh?=
 =?utf-8?B?WHZxbUF3NEFsbmtTTTZvanlqQStDL2ZUTmNXMUk4dkFUZ3VkLzVFMlV0M1dh?=
 =?utf-8?B?eldyUE5obUtjNmZhTjYwOWl6b2FCcWVxbW9hUk41QWlRY3hzaE1mK3pEaVVX?=
 =?utf-8?B?cEdEdGpkczRZVHpST1R2OXhYS1FMdmtIZ1ZJNHFnUU5MQVlMYVZQQWkzSkFr?=
 =?utf-8?B?ZUUrYUxoTzRSbklmaFI2amxleTNaUnlydmJ5VWhvOElQM2ZKNjJBc2ltZTh4?=
 =?utf-8?B?VEFWUGRKb0ppdDZYa2dsTnM0M2pVYnU3V29QMUhyYXVMcWhBZU4ycUQ0YUli?=
 =?utf-8?B?dCsvZGJ0dEpyNkhaUTFLWnBIL2ZFM042aEMraEVHYmx0TUZhclZGemViMTFV?=
 =?utf-8?B?eTliSkxISHJxZS9GVVJTNVJza0hPWDdIVkVKcGR1a3gwK0tUNjhoQlZDMjBQ?=
 =?utf-8?B?Vzl4N1FEWWZHcW9OQSswODF0RmF6aWVOUkNBWlNCS0VHbHBYeFNXZnB2aTlW?=
 =?utf-8?B?M0JTcVhueTFPcTcrTjR4VytRTEhVNXZhdkJCSDM3OFRrN3lIU0U5bFdINVlH?=
 =?utf-8?B?Y3VQdzN6bzNtcXBac2pZd2M0Q2FFUUhrdUJ4V3Rzd1J5NnQwZnc4VU1DSHpR?=
 =?utf-8?B?ZTZiZmh2WVYyQ0JOdlN3bm4rMjZUZlltelJGVDNtaGpzdDBVdExaMnZ1S1FM?=
 =?utf-8?B?WVVmelNnZVBpYldidzE2RmpQQ1Awa0FabENFV1cxRmFsdHJQaGk5aklmdkZa?=
 =?utf-8?B?cWtBQWpncDh4T1pOMnJsSXkyaGRobktEN2JwZEhpWUlnK3BUQmR2cnF1R1dP?=
 =?utf-8?B?cENtTFg3d3R1TmpCQ1JIQnF6NGlkOXNkSTZvUklIT3ZIZUx1UjNIUTNKU1VU?=
 =?utf-8?B?c0R2ajhRUkFTdk93aHZzcEdQUENqallKSGdneU1OWlFjT3VQRVNtTFMvRWtU?=
 =?utf-8?B?bkRMWWUxSmxGQ3ZrZEk4cTVrQUdOaDVSaG5rRDBwQWl6Wm56emhCZDNyWUxw?=
 =?utf-8?B?NTV0THBxNXBWTTk3L0JHaVNRTnJJcldEb1NDYTFwTVh0WVFEWjVZcUtnYmhM?=
 =?utf-8?B?VHdHWVVEdkV4Q0VxQURPRXVrekJ4RmhjSExJYWhBcC9zRWttVFJVTk5Mb0dv?=
 =?utf-8?Q?xgsivhkc2r+DsUxA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcb582f-3a8a-48f6-cae9-08de9c70e5ae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:03:03.7990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTauemr7bEF8oFAdq1ROy/mgldTW19SU++3DLoIgOcfFkLORaPyG9VNVnZ6naUJDyJi0j2dGTOvKHmddPe5tcL7AYLD5q1TLkWi/zs+R8I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6593
X-purgate-ID: tlsNG-bad1c0/1776423788-92573A53-9C15D7BA/0/0
X-purgate-type: clean
X-purgate-size: 1046
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: D614041A9F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/04/2026 11:54 am, Ross Lagerwall wrote:
> Fix the code which tries to pad the load segment to 2 MiB but only pads
> it to a 1 MiB boundary.
>
> This manifested itself as a page fault while scrubbing RAM during boot.
> Xen failed to mark its location as reserved in the E820 because the last
> 2 MiB superpage overlapped a reserved region which meant the memory was
> given to the allocator despite being RO.

Do you have the relevant snippet of the E820?

AIUI, you're saying that Xen was placed immediately below an E820
reserved region (a valid layout at 1M alignment), where said region was
inside the 2M-aligned boundary that Xen was expecting.

But I don't quite follow what happened next.  Where does read-only-ness
come into it?

>
> Fixes: 4fb075201f54 ("x86/mkelf32: pad load segment to 2Mb boundary")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

For the patch itself,

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

but likely to want a tweak to the commit message.

~Andrew


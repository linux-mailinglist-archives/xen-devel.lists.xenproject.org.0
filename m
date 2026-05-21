Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECRVJus1D2opHwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:42:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FCC5A97CD
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315594.1585332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ6SD-0004Ns-Vn; Thu, 21 May 2026 16:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315594.1585332; Thu, 21 May 2026 16:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ6SD-0004M2-Rm; Thu, 21 May 2026 16:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1315594;
 Thu, 21 May 2026 16:41:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQ6SC-0004Lv-Fc
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:41:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ6SB-00HFFM-OF
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:40:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f3596-bab6-0a2a0a5309dd-0a2a4509cd7c-12
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:40:59 +0200
Received: from [52.101.48.43]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f3599-2497-0a2a45090019-3465302b07db-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:40:58 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB989271.namprd03.prod.outlook.com (2603:10b6:806:4f6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 16:40:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 16:40:55 +0000
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
 b=nrDFSkhZcUSWVS7U5uYlw8VuirDQwI9ipjmCpO5LM8CPh/9AGVpPqeHtXaAABfVNs0POVRj7MfbAj1DDIr1h3ikfqzqawf3/udECuwlEBW8wQE7uib3fiQKLI8YgV09Jwr0ftenzfyqyzlHWxFaSggiwdBXUrgUBvdp0gb+a1E2h7xbVJDKOs7F8ucot1jvW0Yu75PhsD/gtm6uguklpnStDoIgewikILo/qqm6Gy98Xo9qf0CNgVgnLNxmMeWOr9yRmY7BnTZ27BsTlZE1p68ZNQzct1V51jcpW514Vzlu9PcbrKKYIBsop18Y82ahWAuGLY1y4Gefo2TB9NgWrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKi4X2Epiwg4cD4i7btV/ChlzcS6r1I1bjKtN8VuvGo=;
 b=dvaZh0XEeWMDg4GGgF6t7beEVab+KzQO12u6jt6w4+qX7airFPxL17VeVl8N8+TTKXJr6ofPGB5nXLy2bzipdWzhwmbbXUi+sxO2vWW72Zof7MNBs5av+PqjNO5O+dCY787uBTUpxsux1cjPb6/9r4R+J7+7TE7/dbjXRG5RjClVD4UICQ9LrTmzkPu/9ongw5wxtjs9GAwfiX1fAJKbIVJJAN1XsFgVAPxiJ1wjUtzWhezEnUf/HRcNz+93LRhWezidus4skEVj/vUfTL8pkRO/zv5nwoyewuwnot8dWX7lcazMMThMwF7Pj47Gr+3O5ZRICrnZdPbQ8l0XW4MX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKi4X2Epiwg4cD4i7btV/ChlzcS6r1I1bjKtN8VuvGo=;
 b=o/N7VaAHuYhx8chJzk3120exxLUZvqX4DmQiS/XGlHCO8w69VA3tCjQmZpMIYxa61ItHl/7bYcZD82Xx5SG1OK3OtVlQm/Po4vTPHqFNUou3TkXsMuSbUnI6NA6yJoohdzicDAJYTuVtSSjZlhW7Y80NexiC/pc0uHdQpz5YfKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c37aff9c-6214-40ad-8ec9-ad8f497dd1d1@citrix.com>
Date: Thu, 21 May 2026 17:40:50 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/tests: Fix paging-mempool xen_pfn_t format strings
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
References: <20260521152344.2050899-1-luca.fancellu@arm.com>
 <1c5238c4-dc03-4204-b5c9-f94ac4c0a65d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1c5238c4-dc03-4204-b5c9-f94ac4c0a65d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0330.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB989271:EE_
X-MS-Office365-Filtering-Correlation-Id: 968422ed-aa05-427f-e865-08deb757ba72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ARusVqd/jzAf1D8ikYdPuV92yVXCwIfEMv4zIte2+wAwChEWa2Yy+y4Hp01oZn7Oebz7rE9jdJxpXbr8mAVPSSSYklChMPX6sNPuVF4x+MyLPQUkOw/cNFQMrqWyuy86OmLdpdobz7G2hl9lbrnddtFlmoOdZvWFKmwkNm+oXES0SXZayDyPknwZB5C9Vo72kScSsFhwO3BVIPT12s8ABUKqrQvsePE2WrMuxIkAt3AGOSFzzhXr5WuecwQJybj/QRUxeGr0JaJAmnE1dP/VLoEzxire6Dd8FY0pmn5a+uO02nGYAvFEOYSo8xLNbwbRRmlAtZ6NfoLDSmV1omgAgJoXIe1G24T/OsbsLs8lLmeSk/P5MnQOQ7BpOBvrMZTh4aCRvrfN2RjqElHrkt5os72Y/ZVlpvg7/34COp0eQSBBR0eDSliwDYEj8WFOWTyl6yXRmVodZ//loVRn4n/mkBhnioPLuuHxqYndPu4LRzbZ6HagwxqGylWg9sZ4gXarmYADAuF0NrvZW4tD5mVrB8yeq3zXiYARKNSm4s//oLxjj3ZWEh2CHTW86/g2dr+KLo7cUyWmXvtG2QquJhwl5jdrFEnx5KpYdeMv+WYCtD6CdK1BBnHhH2+8YkWWpuK/rEL346gEoqaG937/VwLfKlVpLsRlhAj69xBq7ZBvAl6+aNrdzNLIwSk1BNZ6KJUf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ell4RUo2RERqcHlvL3Rkc0ttdWhDTlRaOG82OGhYU2RiYXlRcGQ4Nmk0NUxK?=
 =?utf-8?B?UG9GdXdOZXhDK2gxZDIvRU1PUkRGYXVlRHlZdDNTMU9xR3NVUDBwcnpKSE5C?=
 =?utf-8?B?MnFvcVNIakVDNGNlNGdPdk5FTlhTSGhIQ21UUC9nQ0pvQzhzeXk2NURiSkpC?=
 =?utf-8?B?Mkk2VS9QdlYwTmkweE0wVm9iM2NJNWhvQ3FkQ0VqQnVRNFJBbk5oc2crLzNn?=
 =?utf-8?B?VkFUditLWlhNR3ZQK3pqamt1dm5QUkowclgxeGZoWlkrSDJsc0dsNTg1T2Jx?=
 =?utf-8?B?R2RXS09uUFZENmd0dDEzQmRmYnYvU29Yd095TElRWjBrZExGNkJMUTlwUkVs?=
 =?utf-8?B?bytzUStwdkUvSEVpUTVVSUVSMVp6QlRBdjQyL3Uvd3hyVUF3dkpjQ2craGlq?=
 =?utf-8?B?OHg4RlBDRWVObFk1UlpYYnlxRWNyYWNVaW10NmFkcWhGNjg3V2hCbVdjSzZD?=
 =?utf-8?B?ODNoVnJlRTU2MGhLVE44YnFFRE5QTllpOUxaVGxmM0dtWXZIc01CK3A4ckFj?=
 =?utf-8?B?OXczUU5PeFRJVFQ1NEFkaEVCNWFBMjB4QStTQ1Q1UE11N1o3cmYzTjh1aTBu?=
 =?utf-8?B?WTRtRHZCNm1WNUJuVzdFMkVVclNUS1ZMbmhjTGN2cm1qbFRXZjZKalhVa1k1?=
 =?utf-8?B?Q084blZwYm1HdnFEbitpTjRnOFYxRTFZRDIwR050c2JmdjlvbW1iOEdsTHVi?=
 =?utf-8?B?L1Q0SjREeHFKZ29uQ252Vjg0QjBPZEJ0amhZUjBZdGtkOS8zL2NoVEl1bmZI?=
 =?utf-8?B?VjQyendCcGVwcU9RckZsNC91YVM4U3lTS1JMdnNOMmR4Wi9aZW4yWWNWNmla?=
 =?utf-8?B?b3lqRldmSG4wKzFWQWRoMUJaelhVQ2JHWE5BTG5WaTdvSmxMVGRnYkhYNytn?=
 =?utf-8?B?MWR6TFhVa05ySW92aWdURmNWK3RZdW9PNlpyTFNqT1dXdVdtVzRVL3lWc0hr?=
 =?utf-8?B?aGVXUk5WZlpXMndKVFdFVUk2NEwxbFhqcUxudVN4Vi9RZWg5S296YnZOd1NN?=
 =?utf-8?B?NmxsVDBuSkF3cDJTMVNBUWt4T2hZMW9VZ1RXblY4dzBVajE3bjlJc2kvYXdh?=
 =?utf-8?B?UU4rYmlPOXJzYXVicUVrWEpNVEhobklvNHlOc3hObWltbXR1cEZMd0RMV2t2?=
 =?utf-8?B?NWlQdFF4eWV5SlBsK1RuRmluVHB3Tksrd1pRTEN2L1hWOUxSRHJsYzI2MnBw?=
 =?utf-8?B?K3pQMzFJeERRWi8zOVlCV042WkxQdjVhTnRhT2hWNE5rVUg5UllraW9JQTQ1?=
 =?utf-8?B?M0YwYjI0aS94bmtoSHUxWjg0OXRmWXFzRTViYmVnazZZTWRxWEVWeURkSlUz?=
 =?utf-8?B?TWdLWTJwa0d3Ky9wdzRpUUN4alB6Zkd4cU5qSGxnWjZZSGxlQzZ1ZG5MeG95?=
 =?utf-8?B?bWRzMCtUUjhiRDZxTUMwNXMrckF0MnA0L1czelBXKyt0Z0tsMDAzbERwdExS?=
 =?utf-8?B?ZEcwV2Q4V3RwdXZQbk8xNG9SdFlTZkZ5T0Q3b3hWRkhkSVBJeXNKcnZtN0xo?=
 =?utf-8?B?QXgyWHRkczVORm5LT3BJUFQ2ZjhnUHdhTjYwMFVodE1nZG1JV25xV2RJRjdt?=
 =?utf-8?B?R0kzQTRRUlNuWXhJVmFOa3ppVTA3QVhHWDM5Q2tqL1VTbGxqSXZlM1FPVlky?=
 =?utf-8?B?bHJqS1c3cldIUkttbEk0VXU1NyszSmQxZG9saGpsRm5ZWDBtaVFOUlBXdUdK?=
 =?utf-8?B?NkI3WUkrMFEzQnlEVVVEQ3dYY3FvY0RIYmhUS2hzU3BkeUxvL0YzL3dNcmpS?=
 =?utf-8?B?eEVkZ0U2VXNGdVF0bkRtZC9WK2QyU0dGR3VlM1pxbzVFcW9PaXU4emJWZ1Bl?=
 =?utf-8?B?dXIycHZ1cENKVTFYZXVvbUE1UWZGUWtmOTErL25Wc2w2TDNscHcvUThDUGow?=
 =?utf-8?B?OTVwdVBXNG1uVGJ2UEFMT3pYNEFZckhXVW9iVDdpUC9WWnYyZVVwRU1hSlg4?=
 =?utf-8?B?b2pDdmdlYk4vMy9HZ3E4SUREM0ZNQ1RVenVpTEdCZERaUzg2SEw5V2VROUcx?=
 =?utf-8?B?TGRMbFlzTGxtTFFTcUl1KzZUdUxhTWl5TWV5M3BRQlNiRTl1V1ZYMUUwa0Y0?=
 =?utf-8?B?Z3ZzZVd2L2pMdkFyNlUrVDFwNjJORi8wSXdsdjNhbzAyVnZPYkxHazVxaHBR?=
 =?utf-8?B?TkluK1I3MEJUbnJNYVJlMTFpdk4rdWNYRytQQVNjdjdDay9ZV211Z3N1MmFy?=
 =?utf-8?B?Y1hjZHBLVzVMSDhuTEFoYUFhMGhtdTVlRmFENnk4Z1lldW1KMkZpVy91RnVk?=
 =?utf-8?B?RTFhQy9DeHdYUWpMYkI2VzhpSTBkQWxEelIvRzlxYUltclpvU3A0clIwNXps?=
 =?utf-8?B?UVc2TnZuWlhzcURNS2hOb2tPVXlwdFdaeTNzcTV3QWJrK3E1TWZtc2Rnb3E5?=
 =?utf-8?Q?oLVXzzxeJZ5B95no=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968422ed-aa05-427f-e865-08deb757ba72
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 16:40:55.2108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6KRH4mn3Sx/kesuzRs72SzuUr6B4eyhUzMqVRCxkSRMRNiCv2yfel9OyycAAvZharMVzQjO5tjpNfqjfhy+hnTpuWmv8LiXgAUGqZVHBtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989271
X-purgate-ID: tlsNG-bad1c0/1779381658-43175A53-C75FF4DC/0/0
X-purgate-type: clean
X-purgate-size: 2060
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:luca.fancellu@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,xen.org,arm.com,amd.com,gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D9FCC5A97CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 4:30 pm, Jan Beulich wrote:
> On 21.05.2026 17:23, Luca Fancellu wrote:
>> xen_pfn_t is not an unsigned long on all architectures. In particular,
>> Arm32 builds see it as a 64-bit type, so printing it with %lx triggers
>> a -Werror=format build failure.
>>
>> Use PRI_xen_pfn for the GFN diagnostics instead.
>>
>> Fixes: 66c982a5d3614 ("tests/paging-mempool: Extend to test P2M relocation")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> This looks okay, but while we're here ...
>
>> --- a/tools/tests/paging-mempool/test-paging-mempool.c
>> +++ b/tools/tests/paging-mempool/test-paging-mempool.c
>> @@ -208,7 +208,7 @@ static int check_guest_marks(xen_pfn_t gfn, uint32_t mark_start, size_t count)
>>          if ( errs[i] )
>>          {
>>              rc = -1;
>> -            fail("    Fail: check mark unable to map gfn %05lx: %d\n",
>> +            fail("    Fail: check mark unable to map gfn %05"PRI_xen_pfn": %d\n",
>>                   gfns[i], errs[i]);
>>              continue;
>>          }
>> @@ -216,7 +216,7 @@ static int check_guest_marks(xen_pfn_t gfn, uint32_t mark_start, size_t count)
>>          if ( *mark == exp )
>>              continue;
>>  
>> -        fail("    Fail: check mark: gfn %05lx expecting %08x (%u), got %08x (%u)\n",
>> +        fail("    Fail: check mark: gfn %05"PRI_xen_pfn" expecting %08x (%u), got %08x (%u)\n",
>>                 gfns[i], exp, ~exp, *mark, ~*mark);
> ... aren't the two ~ wrong here? The message looks to aim at printing the
> same value as hex and dec.

That's intentional.

The mark is the GFN number, but inverted so gfn 0 doesn't get 0.  But
this also makes it awkward to read when something goes wrong.

From the failing example in the original commit:

      Fail: check mark unable to map 003c1: -22
      ...
      Fail: check mark unable to map 003df: -22
      Fail: check mark: gfn 003e0 expecting fffffe20 (479), got fffffe3f (448)

This presents the raw mark, and the useful-form decimal.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pe0DL6oaUWq9/QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:15:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA173C820
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:15:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=DQBXGoJQ;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359626.1613123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDss-0004VW-PY; Fri, 10 Jul 2026 16:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359626.1613123; Fri, 10 Jul 2026 16:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDss-0004So-Md; Fri, 10 Jul 2026 16:15:26 +0000
Received: by outflank-mailman (input) for mailman id 1359626;
 Fri, 10 Jul 2026 16:15:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wiDsr-0004Sh-Nb
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 16:15:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiDsq-006ouY-V8
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 18:15:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a511a96-5cb7-0a2a0a5109dd-0a2a450be0e8-10
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:15:24 +0200
Received: from [52.101.43.39]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a511a9b-b7da-0a2a450b0019-34652b27fe65-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:15:24 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CH8PR03MB8324.namprd03.prod.outlook.com (2603:10b6:610:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 10 Jul
 2026 16:15:20 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Fri, 10 Jul 2026
 16:15:20 +0000
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
 b=r809MHsVQ7+JwKnxzgYr+Rsdg3TZYC+VZ0pWyRwhYVjj/NxnS6vOGSg4HHqKrwycXYq6pULLvwXnL5FNNdsgGqs03kcZ5/drEGQmOSoxx6J0syNEnLwDTnasF8yQSiUQBItEnqhd39u/WMj+6A69hntqAIGCVru1RF8C4G3q3RhsKjKLXbKJBdqCGsqHYD5ajCRep0A1EGqXCuYxutTiFrxfI0N4miby7yRafVWX+YY8607LnNan9a4u2X1MdQXQX6yaY3K30E+U3AsmwOdoyAXT3qM1F61wGb7dNsWg2cos//ntM37ZOx3xRNfJVpvytkAiXeQqBwJQfYLojqDQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qhWqKA9sH5B/1LWeYbmdxMTMq3OrDnSgXno1230JJ0=;
 b=ugwb+/oyu4WE1jfbFTKjF/FjRBA+KEs44TAk23CeYyjDmtHsLO6ZFzRo6e95r7js8qOXgVN0gMKl7Dc5Drt2XfN3CQ3x3Q71x9XpDaFgY3cLFJpMaUfs4G3EmC/asOXh6xPHeHUjGU46COGWXomkCKe1owOI0ZonxTAHO2d/6XRXygnpbQgdSaGRl4C2UB9cR8o/Lp2sG2slRTl2IJLBBD7ifGMBMKJhFNnLDgDHCVLI3+imhaYej+1mBYDEQrrhCjEqjE89ROioCAc5RPKPw9DcAUPfwed+XdSHXLKloMrQ8NbbCNoJeXnxY+nHsld2PJLbB0B4uWL34zjblIQX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qhWqKA9sH5B/1LWeYbmdxMTMq3OrDnSgXno1230JJ0=;
 b=DQBXGoJQHpyaW8dcTFV93a0CkbBCBYFklWbsAdJqkPG7njvQ/y6RWJNdIBopsVpqRC4qHjbXlAN/tQjPBAZRNohUAZc6NJzdOBOB5sc4bULb3eBvoMvj605pwV5xa/tFAhaGMWTZ0rdJxtLy718AbGOtmVmI0wPNBnIAfHrdG+4=
Message-ID: <ccc8ef59-d956-4a70-9fb9-bba241087c16@citrix.com>
Date: Fri, 10 Jul 2026 17:15:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] CI: enable FRED on PTL runner
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
 <6f41b87651f282ac118c17b1562251f7d74c9496.1783626895.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6f41b87651f282ac118c17b1562251f7d74c9496.1783626895.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0335.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::16) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CH8PR03MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: b279df02-9197-4467-d5da-08dede9e7015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	mBD52UY1YxeE5m5nr19P9u1uy9nI9/vRQuExLMd+L/vpAdxqZmRR9Sv9cER2eIQeRW4zsR9x6aa1iGjLU9pSS0OE/Br8v3mcfF0MCy4kq0U7bjMedejyEbvFDKMWkvDX+7DjTVTVdMuwG7kba6BLfbBCeSF++A29GVaD92kjw2i4uUMGm8vJJ8DBSrLTQZRF04I2l8oQ5T2pSMJUf6Rnr9seaMVukD8prwR0QCS41qrMHqj1+EeB+pohDitmlQMmUdIWWziNMOUHT9uoMoVLuU5n+XhNYcyj62pUqrAKngQ8utHUai7k+burUWCRsH0Dn2f+9Z+Rc9L0e6nnpqF7xuCN+ZGnPLv1SLqeu920tWxbHbTTVqcn62A0dZqi52guT0SL5y72ybyQcXkj13xTqh0s/3pBX30deWVhxnhas8UipqHrWgXnpmWHMn+W3eu0tIrIyd9qR6E7AzhlNJ9/+6G69S+1O80dpVdjEU18tQ854ARgn42pvepUQubv69RuCGNfXgaKhI4hH+cApdk3KjEK9eFn5ap6Vl9TSJ/sEbdzWeR8N5lzm/ds1KP5lHDgut8OzdWJly4qcKUe4SsnZDNCn77quxm3prLKZV+++kkekgUmvonVZbxck/+3FDgODebeubJga8KBScW/qqkA+iVZxktQmRW/LxdV3jyrYfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUwyUWFPenFVWGtqZGRHSDBXajY0UkFXYUJDcG1XT0JuLzF4VHZXUlA2aUVv?=
 =?utf-8?B?azBWai90cUd1VkJCbHQ4emVDME1UQi91c3JCQlM3R1Jhc0ZJM3dncGs1cS9I?=
 =?utf-8?B?TXlGRjRWY2lQMXNDY2Y4VDNQQUhMQ2RjYlQ2U0hmUXFLZ1F1L21jK3JlMTFM?=
 =?utf-8?B?V25ieVVNZ2IxcE1IcXUyWkxFK0NkTHRYNHVjcEZlYTl1cDdJZmRocWRMZTd1?=
 =?utf-8?B?bEE3Y3FCZlk1NVR1cFMwSnh0WGI4a2J2VE1zbkhYZzVCTHhsZWRlVHJhZkFt?=
 =?utf-8?B?UWpZSEtQWTQvUFNUbmtKUTI4TDJuY1d5MDFKTUNLKzBBd0E4Mi8raXgvSDk4?=
 =?utf-8?B?WXp1MGVaVzQ3bHl6djZMWDVGZEQycStHbFRNaWJTZkFheG1zOHVoZFRkaFBk?=
 =?utf-8?B?ZGMxNHBlbjJQaEVRZkw2NktjNk11L0RUNWgwR3NkSnNSNWEvNWNtWmNua2lI?=
 =?utf-8?B?cEdwWHBTUm5FRExtSWtzM1JHcjVxMUJESEpGb0J0NHBOMk9ITzV2eUtRSjln?=
 =?utf-8?B?UzNSRjE3Sk5iclhUVlo3REMrNmRzRXhBbUZVNHgrc0w3MDBxMWx5aTJWWDhv?=
 =?utf-8?B?OFpyUStDcm53SmtIMXNFSTIyU0pMTTJIcXgwMmk3MzlQYmNjTm41bXJWQlUz?=
 =?utf-8?B?OVYzc3lkUXBLaEY2ZzFFaTRTcnBIcHI2M3E5RXdxUHFXcU9iODY3WkZ6QXBi?=
 =?utf-8?B?blBjQjYxWDg3ekpWZjB5RWpiL2pXOWJ2Q2NyejZrTFFGZnNtS2VQQzN4YkVP?=
 =?utf-8?B?UU1jZUxQTUh5dTYwZnhJTGNSbDR5dGFkdVJwWkRzWmdMcUk5anpWWFlxQXJj?=
 =?utf-8?B?T2Rxclg1aWpPY25VSTUwcTR0Vk0yNVJLbzZaZlErUzNDeDlsSzRqZFNaRm5F?=
 =?utf-8?B?YUNFam1iOGdpSUpURjBXK0FXaXB3SzM5NUt2ZHpvZFNPVGxIYzdUWXhuamw0?=
 =?utf-8?B?ZnVIOGdSVnVQVndPNWdlemxzM29FYWhsNktNS0NIejkwVEhvaVQwVFBiem54?=
 =?utf-8?B?L1FsRmp5cTBIaFdlTFpKcHF0M0haSnZaM0l5MGNaTkxQalBFWlZVTjd4L2tU?=
 =?utf-8?B?YWZTZFVnVnpoZ2FaSENQU1c4dnMxOXBXSllmNXB4VzZQQ2RpUFV1MzZISVdU?=
 =?utf-8?B?bWl3K1cwM0xUOXI5am5jdkFndTJKN1ZadGJMZlgraldoaWp4Wnd1OTRpOUNk?=
 =?utf-8?B?d2g4V1J2M2RWMUhxQW5NQ2NzeXllNFl5RnBJTHU2OGVMeXBIa0g0TlE4YjFB?=
 =?utf-8?B?Z3JxbURGaFZQNEl1akdjWDBxTUVXK2NMWU5MMmF6UGRSRTkrNWJLdGwyQXpv?=
 =?utf-8?B?RVNESld0SFpWMGw4aGFmbUJBSCtoNUJ5YXVKendpSXpzbFlsOEtQeFloZ0Zu?=
 =?utf-8?B?QXk3bnJoT0I2cTNHMENhb2NnVFJhVDgxcWk5ck4rMStBODViM2tmUFBTbXdB?=
 =?utf-8?B?YWQvY09YNldsUXRSWncwOGRTRHhaTE84aDBUV1J6a1cwQ3pVNGY0SnVmS00x?=
 =?utf-8?B?L1RkdmJKZ1pyaElnSDFqT0hnUjBONm5ob3ZrRVlBbWgzalIyWmFJRHYwUWZZ?=
 =?utf-8?B?dzZDWlhGWGc4M3NkMGhyZUJYcUJYUVNtMHlENjdNKy96eDI2K081QlJPbzVV?=
 =?utf-8?B?M2VQeVoxN1BDK0IrcUUzelBmRyt1dmcrMlBXa1gxaVhGdFMvYzBsT1p3Zms4?=
 =?utf-8?B?dWY5QlBJUHp0L3p0V3Z3cEdZaitoTUREaEVKaVF0SVdyajRYYWtIOFNxajdt?=
 =?utf-8?B?UEkrR1V3amZ0QWsyNmtsWVRTYmJieXREc1V2QjJLWERsdVVSUjVmdk9nMVNm?=
 =?utf-8?B?Z3ZrUWw3ZjRHd2RQeVdLZzRzc2hrbzFRQ0Jhb1J4Vmx2L05wR3Y1SGl5SSt3?=
 =?utf-8?B?T005c3pvcE0xb1E2UmhpaVlneU9lMlBsamUybXFoS2ZwbVNLUUJPN1Vtejln?=
 =?utf-8?B?dGFRcGQwRG9ablVobGpuVkJzcHF4ZURxT3h5ZmF3YWJYTVZ4THpiaUkvMkY0?=
 =?utf-8?B?MDl0Q3hneDNFa1AxblU0K29WTzNGTWVQWVRyUWFnb2t5THpqZUhsS2VDVVVu?=
 =?utf-8?B?WmwxSTEveVVIdlBPd0Q0ak9iYzc3TWJvQVc2TUNIT25ySW5wWldpYnl0M0ZH?=
 =?utf-8?B?UGxzbUJKNUduSVNsdEJwbHJXZTBGVDk2K3VhVUJVaUQvTTJyc29MOGl4OUFn?=
 =?utf-8?B?a0d0MWw5TzNQQ1VWQWFLTEJlWkowcUJuaGNoYUdHQUpjRldlWkVmWWpqVkxW?=
 =?utf-8?B?OFZscUY5NE4rK0hKeWY2eWNQRWJFY1ZVcUVNdHJZUEppdFNkL2ViRWFOemdV?=
 =?utf-8?B?aEZWekpuYTdUeVNNcGFqT3NoVnJjakplN1ozTE5TMWZqUXQ2QXdNZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b279df02-9197-4467-d5da-08dede9e7015
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:15:20.0533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qm240yiaOzosKICsZ2Zxy4yiD7xaGVTGwSUGxv0EvoCNWyzjrpR9N6+ZVBjn1Kdk9CbbfMqzAZQKg6MCqIi1P8Fn2QicNztx2NAg8dS7ZUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8324
X-purgate-ID: tlsNG-42698a/1783700124-A1FCF9ED-0B3FE912/0/0
X-purgate-type: clean
X-purgate-size: 3070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:cardoe@cardoe.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07EA173C820

On 09/07/2026 8:57 pm, Marek Marczykowski-Górecki wrote:
> Add new job-level EXTRA_XEN_OPTS variable, in addition to CONSOLE_OPTS.

This is stale, but easy to adjust.

> For now, add "fred" to all jobs running on PTL, but separate variable
> allows customizing it later on per-job basis.

"FRED is not yet enabled by default on Intel systems, but is expected to
function.  Explicitly turn it on for added test coverage in the short term."

The final task is to make MSR_SPEC_CTRL virtualisation for PV guests
work under FRED.  Right now, PV guests will lose speculation settings
they believe they have set, hence why FRED isn't supported on Intel yet.

>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/gitlab-ci/test.yaml     | 1 +
>  automation/scripts/qubes-x86_64.sh | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 7cc52146304e..61adc1baff30 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -177,6 +177,7 @@
>      PCIDEV: "56:00.0"
>      PCIDEV_INTR: "MSI-X"
>      CONSOLE_OPTS: "console=com1 com1=115200,8n1"
> +    EXTRA_XEN_OPTS: "fred"
>      SUT_ADDR: test-22.testnet
>    tags:
>      - qubes-hw22
> diff --git a/automation/scripts/qubes-x86_64.sh b/automation/scripts/qubes-x86_64.sh
> index 7a59fa5f1116..065f03931bea 100755
> --- a/automation/scripts/qubes-x86_64.sh
> +++ b/automation/scripts/qubes-x86_64.sh
> @@ -260,14 +260,14 @@ TFTP=/scratch/gitlab-runner/tftp
>  CONTROLLER=control@thor.testnet
>  
>  echo "
> -multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog $extra_xen_opts
> +multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts
>  module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
>  module2 --nounzip (http)/gitlab-ci/initrd-dom0
>  " > $TFTP/grub.cfg
>  
>  echo "#!ipxe
>  
> -kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog $extra_xen_opts || reboot
> +kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts || reboot
>  module /gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen || reboot
>  module /gitlab-ci/initrd-dom0 || reboot
>  boot

Wouldn't this be better?

diff --git a/automation/scripts/qubes-x86_64.sh
b/automation/scripts/qubes-x86_64.sh
index 065f03931bea..9f8288cc02e3 100755
--- a/automation/scripts/qubes-x86_64.sh
+++ b/automation/scripts/qubes-x86_64.sh
@@ -15,7 +15,7 @@ set -ex -o pipefail
 test_variant=$1
 
 ### defaults
-extra_xen_opts=
+extra_xen_opts="${EXTRA_XEN_OPTS-}"
 wait_and_wakeup=
 timeout=120
 domU_type="pvh"


Everything is expected to append to this variable.


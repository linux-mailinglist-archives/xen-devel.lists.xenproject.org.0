Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nzsMBaPvUGoI8wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:12:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57173B1DF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:12:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=YR1O00gS;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359304.1612933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiB13-00059I-GB; Fri, 10 Jul 2026 13:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359304.1612933; Fri, 10 Jul 2026 13:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiB13-00057C-DO; Fri, 10 Jul 2026 13:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1359304;
 Fri, 10 Jul 2026 13:11:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wiB11-000574-1o
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:11:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiB0z-006TXF-C8
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:11:37 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a50ef79-e002-0a2a0a5209dd-0a2a450c8900-40
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:11:37 +0200
Received: from [40.93.196.13]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a50ef87-e897-0a2a450c0019-285dc40d75ba-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:11:36 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CH2PR03MB5255.namprd03.prod.outlook.com (2603:10b6:610:a2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 13:11:34 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Fri, 10 Jul 2026
 13:11:33 +0000
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
 b=wO1aPwGWeAflgIHrRJMc3xmVTLVcT34ayf9NgiZwkdojzkVEmIaF4PciBvJHHDZTy/Zcy+oX1CmSX4OkcokQ7AHXWbB27KLxXXu/ytApstc7+q3N4PH52EaNw6QGxpxObGqIQoPETk2iV/PTmg36GSQfMz6oar7utSfMjpb2ytJI95BuN6CJVVZJXLmn9KQ/nYw+8nGT3NrbMiZALopT86aucmxbNY5OZubP4i+IT+37eca5iI64hwRD6x1EYaFMWErTcze2PKJthktyKdmMEvh7FLMy6erU16DZj/fCSB+jrIZDb9hf8Zk9tmeT8FAWb0M9h0H+W4na5aWwlGspgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWGn7SXH1PCy7q5rGRK2s+7URhEWay2XJdSSbkXt0ac=;
 b=syd5wAGs3FDstN3yQaVwYmPtS0vmjiE+7+HSyCv23tRX86VZ4upaqf8XDHVqk6crvyObcmUoemZSQn16RWyQoVnJnBsmvDJD0wki/uni2a+irfO06LfPnXaLyOI7rZ3ZpJIkUyBA4DRnDlwdehwk8OiMWR8o2GrgvEBmsK/WQwD4kgdjLEM0L6Gg02N+ZQXdvY7k/Yq1RS8HZODGu1d14xtH9N/I6aOlE7eV3yCr6NoFY5Y4BNKh4spnzkvJ2YvLGkB5uL6Uf2qucRAbi2SNmwnL3ZUcDDhN2uWs/t+jmZWdULy9bJVeRxSkEIYRayw28unc0tdMs1YkxvendyBvlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWGn7SXH1PCy7q5rGRK2s+7URhEWay2XJdSSbkXt0ac=;
 b=YR1O00gSVJqebrLUqNfHpgJ5UY5c54NdEpIvyWCaJxpBNMs6q2S9pBOCUu637RCe+kskBpQxNcXCjsthJzY77aFmwlRM4h7epNnF8wvOmnVFQc71BP6iERWXizU8AAAbS7b7pCsuvqjPtSakVn5lQdBllHG7UvcsEat2/RixFws=
Message-ID: <5850cce1-e36d-4c84-8e40-80a7c8771585@citrix.com>
Date: Fri, 10 Jul 2026 14:11:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/2] CI: add PTL runner
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
 <3a541b59a711fbf8d9ec3d262cfeeacd2db25113.1783626895.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3a541b59a711fbf8d9ec3d262cfeeacd2db25113.1783626895.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CH2PR03MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: ee026c23-6a50-4f1c-96a2-08dede84c3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	sxY2Cb98TqDYapJvz8VWK2/DGme15WRdx+TVKpIMUezpH53o5HE46kreYJ/oQiSLRt+gL37coq6e1ENVe6YiB13A3c1eJl0xzTc40j3bmvn0wb+ycNz6glykyxPQ5F4AG60QgLXyQT04vS04BPjczd+hs0GWasznJHxGQw4VTRf//6JrLyUjA92E04RCQeaL3OIi3PUJNk3ZktsUAHdTWA6DQ6QIjUBn60ron8gEDrZWNYwsDr2YTZsJyzf1salZyQnca8A5iLbwVcjwV/4YGqkEK39YkeGdkT9SLbcg2PcxhD7xI+nyoNkf12HVsE/s1JBteZZn2Tlvm2HG0N+Cs3pF9LOPst4AdGHipt6AyOc+0E2GMCiRWs9HZORJxulXAUOSgPYQe4+WK97e0Iuz0F5OejDL83X+j3oea0Mew4nAzvT+5fmgHsQTWQ2lu6111UQinu36QPvvZMvtVp54vuoF/Ql2PNSIY2pIqgXi+RKN8IqtjNrLeoSg2Ko+BE5rS70G2COSvEFydzGz0ZAO9aCAlm5mqYcqNhUc7JNKsFUKXgOQ7qP84yrn/W+Iwu3IrFn5hKr5tX6cJPisykwGx2LNAC6KAkBVtEJH5OCyStNBVHQmOG1ZrBjBDdpDCLt6NlxbHoqwrmH3DAp/J4CJz4vJbM0uA/nwokL7i532P1I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9ibXI5U2dmRXN1Y3gxSDQ0T1FuVEVBZVhoYkxBRldvLzQzaFI2MVZIZXdn?=
 =?utf-8?B?cTJhaStTQXd5cnZiSWc2OXJWVXIyNU9ZalNHeUlaQ0YwZzIyRU9lL1hYczkw?=
 =?utf-8?B?N1hUSFI2czRaUWkwcjBkN2U0WUQ5dkJ5QmZPaEMwaTgzbEU2MHpQelFsU0Ex?=
 =?utf-8?B?WEpPSFlJVFRzV3M5cDVKdTBvZGVPNEtKTW10VWNZNmZDUWw0SVFrcVlXNmlu?=
 =?utf-8?B?Uk5vL3hlZGhIRW1UWm9YNm9wUk04M1BRMGtQMW1qQVRmdG1mSzEzSllGYkQ1?=
 =?utf-8?B?RXdtdEtzZ1pkdlVFY0xxM2xveWs5cHNVRWtVRDl2eHRZOElVQTQydUR0a0c5?=
 =?utf-8?B?ZnY4UWYwUi9odkt3amFaL2ZFcmxjUDM5SDR5cC9aclRmK3dFSkhPanBINXF2?=
 =?utf-8?B?ZzAwVHNURVo5R092a2dlL1NZVGVSUTRJS01pdE9hZnZKdUZ5clFCdmhMVUdP?=
 =?utf-8?B?Q3c0N1ZLRFJSSlM3RDFXbEpEY05jNXRXSVNoYXM0eDAvTFk3UXIvbUZ6WldM?=
 =?utf-8?B?VkgzL0YvYVVtRlBhTWErZEczSmdPVlYzUDVzWnNNUHpydWRLRHdWU0M0cTRx?=
 =?utf-8?B?Ui9wcVFKNkE3RFAzVGxTWHJBOGNqRVBqckRzdXUzLzdybzhxUUQxbjh0MUsv?=
 =?utf-8?B?dStDL3hjejhLWjRrcFV4QlZhVUJDWU5ucS9wTmZpU3pjRWcrV2NBRjVRUWE4?=
 =?utf-8?B?eXFtSWVETTRKWUZsbmN6R3VCdFZjOUdmYXhFY2pIYVo3bENqbFJiWThLZGdO?=
 =?utf-8?B?NzJ2N2Y2SlUxay9vL0VEOEk0aWFHQ1o4VjgwKzMyZXJrQktheFBSQ3V0aWp5?=
 =?utf-8?B?d3ZYVXB0RzlHZSt1TWRIbFZQNUt4Qi9XTEFGM2llVU9rM0VvWmFVYjZKSzJy?=
 =?utf-8?B?NFA1cnZRRm43MHo5RVhqVEw2TFNOdHNsMlBqRTZGZFQ2Rno0NldoTm1oNEVr?=
 =?utf-8?B?RTNYV3pod1Q0UU0yVFNidE9LWGtOZXkrUjUwOXAxaHpKQkt3dWcvMjVwSjdL?=
 =?utf-8?B?K21HMjFETU1ZNFNhckZ1dW1HQzMrTEJ1LzNUTDhvZkdxQU8wcEdRcm9mWTFD?=
 =?utf-8?B?ZlovT0tWRENUWTBzalhQR1BSOGFoRE92ZC81cFVndFplTVpLcHJBRGs4Tmhs?=
 =?utf-8?B?RGRudHdZbVk2cFRCWU1rRWtJMkdMNTgvdGVzZGFTb3VIUjRUcEwzdElyTjZx?=
 =?utf-8?B?a1V4ZUR3VnM1YkhUUWYreVZIRzVNK1NubDFORm1ZbzExKy9ITStmdUhRVmI0?=
 =?utf-8?B?ejVrYTNOQmlFYzlXVDREcDNyZFNYdE5UL2R5OXc0VDhoZmNhSVBreXkyNDNN?=
 =?utf-8?B?VHVCSkdvUXdDaldhMmUwdnRqSDlMQ29tRTF0ajkzSlQxVUd3MVR0cFVTeFVV?=
 =?utf-8?B?TmVhTzVYVEJwZXJNNzF2NC9KalVpTXZaTWpwWjR0OWJQb3NaREt2emRtbWpJ?=
 =?utf-8?B?cWRiSzdqZDBDaEZUOXNjb2xFd2Q5TE5ZSG5LVWFIQ0RsMDBwbWJ6N3BqaURm?=
 =?utf-8?B?S20rSlU5WHE2cjVLZ2xmNFQ1WitRc1RoamtVZ1QvV2RYNmp0bm9yay9rR2Mw?=
 =?utf-8?B?eGpaTW56YTVrWUR1WlhrZmRJbFhrcEFPSkczeURabXpySHRhUWdsa0NGbzUx?=
 =?utf-8?B?ejFoRnpYb0NFUDRValBWQ1o0QllXcUJOT1VzWndQS0xhcVppcnBhek1CaWI3?=
 =?utf-8?B?VkxnT1FpRzJkR2FLSmVoTnBoYm50WEM0WE1jem13UzdzNERiS1dsM2I1T0Jl?=
 =?utf-8?B?a01WeTVWL1VmUDRjUTFIWlc1bnR3d0k2dmpwNk9vRVYrZnlpNTNQZEgreENE?=
 =?utf-8?B?SUtia2NxV00xVTlBTjBQK2dGRGRxclZzSVNTNXppclFvMnVKbUNnVHZKa0Qw?=
 =?utf-8?B?VlRyWjlPOUhKbldEcEJQeFhpMjl4YW1jaTZweXpjK0hCaEFIUWlVUVdYcGdV?=
 =?utf-8?B?Mkw4SE1wOEE4QTQ5eTNSZVo3ZDJMMEEvRXVXaEw2TG5yWWZLSC91clNzYTJ6?=
 =?utf-8?B?VFNhTXQyZDNkZkFhVGdkZ21mMFB6UlkwbTZxUWNKODh1eWVPNFNxK0hEVXBl?=
 =?utf-8?B?Q2k4c3dIclNrYmFINEhBbTJaWWVkS2N0RExzSVo3TkFxajZrS0pVRThCcUU0?=
 =?utf-8?B?NkpJZWg4b3hGWS9Cb0FFVlgxdzhZaFV6bGVtR09XZTdzQStCNDZzdEtmUUw5?=
 =?utf-8?B?VjNOejhuZmRidFg2T2tIZlZCOFR4RDJrZjZaZkpuWTVEOElBTHpvOElDU2Vx?=
 =?utf-8?B?dmJEMHE3M2ZSb0pwdzBHNEh5cHhZdjRNeThsL24ybWRNNDlBK25GNzlTUXh5?=
 =?utf-8?B?MEtIS3BFS0NxWVZ3Qyt5aFRvVHNtSVVjcnlSdXJBZnBITlJzRjF0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee026c23-6a50-4f1c-96a2-08dede84c3ef
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 13:11:33.9018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1J3XjduqL6O1u+/O2bAHbUHuMD2iJPoX/I9aWyBAuJfV0o8HNFpV4aiv0D9pp2Kxc+TU4GLy1Yq/WZ5EwIBIFv4IvVw3e8VTv6WpXCp8c9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5255
X-purgate-ID: tlsNG-d25034/1783689097-D6D6A6B2-B29E13DD/0/0
X-purgate-type: clean
X-purgate-size: 601
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 4B57173B1DF

On 09/07/2026 8:57 pm, Marek Marczykowski-Górecki wrote:
> For now run similar set of tests as ADL.
>
> Exclude suspend test for now. While firmware claims S3 is supported,
> suspend attempt fails (power LED blinks for a few seconds, and
> then system reboots). With no messages on the serial console, even with
> `sync_console`.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

I'll need to configure the runner in the right place(s) first.

Did you sort out the dual NIC problem?

For the patch, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y9vTB7+KJmrHYQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 11:26:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D24654963
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 11:26:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=KL3hCmiv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331482.1594042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWWEa-0002b7-0n; Mon, 08 Jun 2026 09:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331482.1594042; Mon, 08 Jun 2026 09:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWWEZ-0002YO-TQ; Mon, 08 Jun 2026 09:25:27 +0000
Received: by outflank-mailman (input) for mailman id 1331482;
 Mon, 08 Jun 2026 09:25:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wWWEX-0002YI-Sn
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 09:25:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWWEW-00H1Fq-Uv
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 11:25:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a268a77-bab6-0a2a0a5309dd-0a2a4508869c-42
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 11:25:24 +0200
Received: from [52.101.83.135]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a268a84-63b5-0a2a45080019-346553876b4b-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 11:25:24 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PAXPR03MB7665.eurprd03.prod.outlook.com (2603:10a6:102:200::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 09:25:21 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 09:25:20 +0000
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
 b=uvXtUC/SdJxYSs1g3SXBRUpgZmHBXEgGcCUpBD3oKj9/53/x5FQw2J1k5GB3AohGaeSN4keedaDBobyvU48romkp5zYKRscjGKcluj7GKpvMVdI0n0vhGZhgnx1jQF+PjrImY8qhfehmtIeyRvqgaYjNDbeD0rAzaYCkab26dIm1UMR+OfBFkXNazSyzmOdkIpYIDG/HdvxYqeJ3WmUWsdQ4ekll0gHmE/LIUDPcOeFbPX9WuBMl/h21q4s17IBZ4Z8IpOdUMXIBow5ncJhahbMfjig3JtSBQ3Yya3TqiQSg5hNfnHWbzmB0Cgj/smgVtrEU61/KyJB7zHYK2WqRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apLdSircczYnTWe9zXrJPb7nc9E74AgPYo3ia4U+13o=;
 b=l5VyjrjW7cFKk6AIq36DF9Lmy009tof+jNJkEXbqhhHnVzEyvumauv1zgnK4FPjkp6iIwYE2c5cZrvUdRgf9wNfNCnRpE9qsaaE80AFb96/bTODZzxVhkaSTbS8AAT7g3AMV0a/uD4pFuvECltFYoTVChhGLYstRuUf7UKhrY5E6vLf4XWFArCVHR+vNWzA0KMcpRgzSFp1c/KA1oaMHjtjVtD3YUNLRxzEFrNGN+RNQKxeWoERr9qIyrOOjwgAF/oq0lKkCkMgtr5VDky1NIfZu/zlDZUDiMbK+l2qbwmlu0g66CVCfYK/nUhKK5s80VzNKbbuHEE9D/hTdRcQRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apLdSircczYnTWe9zXrJPb7nc9E74AgPYo3ia4U+13o=;
 b=KL3hCmivRf3Grhzlfwm/RP9irbibi/EBv5CgNo8ToxsmOIp6e4b28h/q3EbTQlJXpNSb8ZRrRuPq/HINK8Ray3LU+7gP96bncxednhFxT/MgBlIiieL2GyQeaU1jY85f5iSns5RHLwsKLft3abP1MTP3qhQCYH+LcIj1xd8HYFfBcBFU5BNe15hgDM4EztpvU/qR7yeqD1zy9Z+1d+DpJBugZFOCGC6CMFkdrQDhfkof7cCTb493Nqco8akNFjcoCR33/MEJJ38JVc9DJXPJhcxtLOZL1hHj+wfGE3w0uNTbFP3zoMRwFRdqRsjFfgJrwC9EixBskNuFt2dfapM2UA==
Message-ID: <f258e2e5-f7ba-4183-8b33-c3a169dc1d7c@epam.com>
Date: Mon, 8 Jun 2026 11:25:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
 <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
 <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
 <4c96c478-aeb5-443c-a6ca-f23caf7d5430@epam.com>
 <e489f44e-ef61-425c-bd0e-0a992c32f7cf@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <e489f44e-ef61-425c-bd0e-0a992c32f7cf@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0383.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::25) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|PAXPR03MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 729ee785-c413-4a14-b6ab-08dec53fdc85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P5WWFt5zCwrAcGgtlij0DDOnLIoPQbEcL9gWEe4EU7PNk6sEefxWFA29aFeSMiJxXjWlJ4an77l5ind3tIxOqG/A/KUPK3N0StWkg4P4q2ibGUCc6Tq4D4csOqX3rE8smR3ImwdKV0tjvRCdivM+6cwzeO6bUfKHMe/9PQA+8vk/ubAcGI2x02SaWaZ9i1w98uo1EypBeVCMor0TkBMSr9STn/wHzMykb8AZBcvLcB7eDKz0pQA0a4og8CatxsslwOERYj3uUadDs/UMpXV9ji0RdLjHb6WiwiSrqb6SBExLyhougO6EiEDIsF6gw0Mp3EizosCvRLvQgGEmgopePVMxJ8c8iS6lrT9IvMS9C9wCcIN9LDKsmacFtOjQ/G3CuR0q9GzPpYgXbz2zbRKRKAMe+kg5+LBYWY/UG8jrJ1LglLC/d/fIqE+i3WQMs0U1apHniZj0msBQe+3bBFNoiGIQvc6U3GaE3T05BfI6832tE8wjHgp9KfMc//Oi0syIcIZuOBJ2BWJNqTU++CHRhx1ty5S072PssDXF6RUGBIZ6bElp46xYa4RZW/tt5Dh6JzYYcIdmGojDplI64XZtf40BslSHuJoFNnkNWbUsXy94dbXG5a/SjLbBROrKQ1JA/w0FH2DMHIW7elskiBCbkVuMj7mdanszYbo6WG6qNWUb6SDIL/WkTWoAzO0pKiJt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDJwLzcvUHljc0l2NXV4bjJHeUhQMWwwT3NYZ0RQUk9HOWRZd1Q5b3ppNzNh?=
 =?utf-8?B?VWhBRDhZaHdJR2VPWVNvcmhZNlJiUWxrdlVYZmZCVHMwWUxwcjdFWU9UaGNB?=
 =?utf-8?B?TndSSUtjVmc5dkZiZDRRMG4wLy9pVzZkUnJTemVieE11dXFva0RzWDZjUkFJ?=
 =?utf-8?B?WXlScmdIbFQ4QXNqMmM3R3JUb2RWZDlZcEROWHZBR283UkVlUW5FQXo1c2Fs?=
 =?utf-8?B?UVNDTnVRcXl4K1lIOG5xVm9LWWdhZ1ZiZ09uemE2dFFWemtyUXBya3RFSnFJ?=
 =?utf-8?B?bFFtdHZIckhscHVQZVJkeGtmQmNNY0haaXg4bnA4L0NuMkRFWGJmOWczOTRQ?=
 =?utf-8?B?d2txam1Oa0pFSnZQZG1FWkhza29Dc0htZCtORS9ndUtIQmZFZkJBRHRBcnY2?=
 =?utf-8?B?OWo4a3I4QzJZWkJvUGxnN25nakVGdEMrK00zQVA1MzhiSkZveCsxajVjTFhj?=
 =?utf-8?B?SitaL05MRlp4MDYrdVJUSk5oRTZHSHhqS3RMa1pjL3dKSi9ZZUJFSWVjalFR?=
 =?utf-8?B?RDNhbWxOQjZIeUVmUnVhQkM0LzJJTVZGbURZbFJoYWhSSmNGNkJucUNFR0xG?=
 =?utf-8?B?T24rL2tHbmFyN2FhanBGdEdYZGQ3ZkczZTE0RUhZbFV6ZU9ualljejc4T2h2?=
 =?utf-8?B?SkNJU0l1VThmZlA5dEwyaGQ1eThEVDVoOXlWeThISW1xWEZqWHcrbGVYbWpZ?=
 =?utf-8?B?aC94d3VxN0ZteFd0dmFJWGhWRExEY3RUWVIrTGFKU3hKSXVYVWl5a1NhenR1?=
 =?utf-8?B?cjhMMU80aVJEZjh6Y2grc25iOGhLcTVKSzZrKzRNU3AvL0JMcmRSajUrYWhR?=
 =?utf-8?B?QkRoVGUxcUpFbWl6RS9tMmlZcUFweE5NUFFqVnA2Z2RJKzZtNHhXUzl5Mm8x?=
 =?utf-8?B?QmFud2M2dzdXRGI0YlFhOUs4emxHeU9Hd1Z4Z2d2aUlaM2pJdTJrSHg1ZjdT?=
 =?utf-8?B?dk9OeXg1SC95cHRWNXRMYlo4Vyt3Z2R3VFVPajdFMjlPYkluRFdQaElxbGUv?=
 =?utf-8?B?Y21lcllGL3VsMjlOdGZhZDY0ZU5WdkVyOTdUcysvZkpuMHNISFdSU1N4TWxX?=
 =?utf-8?B?TVF2b216d01LdjZKSkVtWURjTGVTSzJ3K2JTVDdqeEo5Mjl1dE9sa2UvWUVX?=
 =?utf-8?B?clVqYkZqSjhpZisrUVdNeUNNN1hNL3dEMy9oV29vZWhvZU9aQStybWhTVUJx?=
 =?utf-8?B?QXEreHRvcFBJb3REbjFZNzlqblF5Um9Wcy9JYzdPMndEUkxEZk5TbTdrK0lw?=
 =?utf-8?B?dGdoajNjeW4zVGF5ZjBPSHpyR2VUZ2piVXFVcDRGUWNBVjQvTXlmM2I5Tjdz?=
 =?utf-8?B?Nk5EZjFLeVRRdlNWUDlFdXhtQ1J1bVpEZFFJamwzQ0hsenFRWnkvQUllVUhv?=
 =?utf-8?B?SFdMTDdySEV1a1RPYTl2UHdQRnAzYU0yMFl3REptQ2ZyOEY4NU5haFdhVTRy?=
 =?utf-8?B?Q0c3dU8wMU1mZCtuUDR2bSt3VGY2cjc1dnNvRGE5WUlWL3lvN2lBa2R3Qm9v?=
 =?utf-8?B?NmNDOUphRitQaFExZ2NBeWdXcml2d0pmZG54Zk4venpJcVFqeFJab2hmRFVU?=
 =?utf-8?B?UTJNc3dOS3gra3l1M1FsbXFzak95U2FjMk5GZSs0Z280RlowRUlXQzE3Z1lJ?=
 =?utf-8?B?Zk92b1hUZkFHbFltRjRzN1NyeWc0UFRieFZkRElvenFWaStaNUVpdzkwS0lI?=
 =?utf-8?B?VFVBWEJ0L24rN0ZnRzh0K0txYjJMcHk2cktBY1VRczBjb25ma2R4WHVJQXE1?=
 =?utf-8?B?cnlUZVR6a1RNQlZhaEdFaGtsYjZZWUpWOGdMdUJiVXFOWnc1R1pFWnpvSHI1?=
 =?utf-8?B?K3ZQR2FFKzIrb1hTeklYbkxNSTF6ZFhkSW1zTDlKT1NRUkd1UWxOT2hQNlhv?=
 =?utf-8?B?bDhiQ1RLZ0ZoaDJ4Y1V6L05lNG5EeXpSUkdrOWFTeHNLWlRMakJpUEcraTQz?=
 =?utf-8?B?b1JYRVVRNmNKZjVoWWhBNmRaUitDUGRmdjVsNkd4eXllNjBPUlNKVm5DbjNS?=
 =?utf-8?B?U3lhTWhWQzRaZ012bmRrYWh4S1pMYTYwejE3RVBMNEFZWVEveFU2SEtIS2Ns?=
 =?utf-8?B?M3pCcUJ1MmdMR1J1TnBhMVp4WEYxVmdOMkVNT2tNZkRGVlBnUWk5bkJWMlJN?=
 =?utf-8?B?S01kVTEzZlA0Z3o0Z0JIVGJFS2VXMVBzNThFUVhTUk5DUmUrZGI4ejg2NUtJ?=
 =?utf-8?B?MTl3SlM2VTVtV25FaS9renRNdDRON05lb0wvOVo4eXBURUdLR0NCenZ6Znpy?=
 =?utf-8?B?OWFBd1pPOVhiSG0yblZMKzBhMkFkZzhGcmRyT3Vka2I1Uit5RURxNjRHNHZV?=
 =?utf-8?B?UWRYSVdnWDhZclZGVGQvblpUcXFuU2dRZURIUDBoUjd6UGorWG9sZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729ee785-c413-4a14-b6ab-08dec53fdc85
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:25:20.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgZgkTMbGtZ1/WHXketTe73QJSVE6ROXVcgFvJuN7U/8L2urUMak7B2LGqkNzD4YH0xxEquRMIFOUYx7BVODPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7665
X-purgate-ID: tlsNG-c1860d/1780910724-B7171DB1-CFAAB880/0/0
X-purgate-type: clean
X-purgate-size: 2163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:from_mime,epam.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68D24654963

Hi Julien,

On 5/24/26 13:00, Julien Grall wrote:
> Hi Milan,
> 
> On 28/04/2026 11:16, Milan Djokic wrote:
>>>> The original idea was to also allow stage-1-only support. But I'm not
>>>> sure if stage-1-only usecase is useful or even valid for Xen.. I will
>>>> update the patch series with the missing parts for stage-1-only support,
>>>> pointed out by Luca, but the question remains if this is needed at all.
>>>> If not, I can revert to original state where stage-2 was always
>>>> required.
>>>
>>> By "stage-1 only" support, do you mean Xen would use the stage-1 in
>>> replacement of the stage-2? Or do you mean the guest will use the
>>> stage-1 page-table and there will be no isolation from Xen?
>>>
>>> If the former, then I believe the page tables don't have the exact same
>>> format. Today, the page-tables are shared between the CPU and IOMMU, so
>>> this would need to be duplicated. For now, I am not sure this is worth
>>> to do.
>>>
>>> If the latter, this would require the guest to be directly mapped (i.e.
>>> IPA == PA) but it would also open a big hole. So I would want to
>>> understand the exact use case first.
>>>
>>
>> The latter. In this case, the guest would configure stage-1 while
>> stage-2 translation is not used, so there is no additional isolation
>> enforced by Xen. This would only be intended for specific usecases with
>> trusted domains. But yes, this opens a significant hole if used with
>> untrusted guests. If there is no strong usecase, we could restrict the
>> implementation to always require stage-2.
> 
> It is still unclear what would be the exact use-case. Is it a system
> where the SMMU doesn't support stage-2? Performance reason?
> 

This primarily targets systems where the SMMU does not support Stage-2 
translation.
If we decide to keep this code, I will address the associated security 
considerations and document the corresponding AoU in the design. 
Otherwise, we can fall back to supporting only the "nested" translation 
case.

> Overall, I would rather not add any extra code in Xen without any strong
> use case.
> 
> Cheers,
> 

BR,
Milan


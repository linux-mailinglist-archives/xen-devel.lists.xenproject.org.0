Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP7UNFGsBWrHZgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 13:04:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219F6540C0B
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 13:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308811.1580156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNTrr-00053h-NB; Thu, 14 May 2026 11:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308811.1580156; Thu, 14 May 2026 11:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNTrr-00051I-JX; Thu, 14 May 2026 11:04:39 +0000
Received: by outflank-mailman (input) for mailman id 1308811;
 Thu, 14 May 2026 11:04:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNTrq-00051C-3P
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 11:04:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNTrp-005Op3-GP
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 13:04:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a05ac3b-5cb7-0a2a0a5109dd-0a2a4506862c-20
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 13:04:37 +0200
Received: from [52.101.62.67]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a05ac44-7371-0a2a45060019-34653e43b6a5-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 13:04:37 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB8029.namprd03.prod.outlook.com (2603:10b6:806:459::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 11:04:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 11:04:33 +0000
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
 b=o3qi9FOM5Q8HKJdQBS5B5F1+5APB8LfSRjNc0S7YUOwjFYCTQSdd5q6aUf0dTOxsKEy0m7oOnLx98Qbp7gqtWz0rHLSLJt7uJDXBU9k7FLvcnriUQvNqOFVAcv+3kPT5QIRPdjsJz0wzltTZElH1hKoAP3qNPWsi7iXMlNDmxaOYHn2FBqZpGmJSYU3ubN7MnaKnQBhMz4xAcrSRJe4Lk/rsUiJryiHoYq3RCL2e82D/O178wY/ox9WQkchlBYGEwv9V7OTmiPhMqZ27VUrbqV8qCxK5wNg+ELkGnp8L866hGY0dnGFSLdFIY1AJYxcjkjsRc6PRPbg2eh8AAsQmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSaEEcDYrRK++tvoPBXXE89DF4EmroRQqLTKQYKxFMA=;
 b=kGYFZ9/ACWbnz7+64+eGnPu4ybayaCDEDraXzYKn9VQ6972wYeQkgPEhtnxQIwn9Xhtp/jR1aq2p4jz03rn12heq8zZmXV1WbRi19qa8n4y/GKShNqMtartT2JTxeV9bvYcWGe8tDu+VHAjdZj1sPGd8reSEfzGTZw3RYvberqrhbX/t3vuLH92+vj/EWrSstwyLje4/Aq1oYomkyXObPDSM8w4h1SnpBlB2br3tfhUrLFUhVWGzYbZU0DmbtjGlM2JCA3IpfElnZh0AUtgYYNcpTAEFOR0IFoPGDmUiVNZay8krbZLAFIVxrePgeezVIOKnAO7Sv1vmSD5VdNH1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSaEEcDYrRK++tvoPBXXE89DF4EmroRQqLTKQYKxFMA=;
 b=x0rxvkLDve3xCFQxyRkoudhEfqAWlRsh6q0gHfpL07MyQtwaNnYcQwgPn7xkW45xNi8G2KLjWnCVnSbQC5qT0iRgM0x1T4d9RBaMBTPkpN57Qm5GgOjUC9LFT21gMNfyehmNyetReGYb+H828VdSZq52zlaQBsDjqxkgISMOdhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <26ec207d-0053-4505-b62b-351fe6cb8f15@citrix.com>
Date: Thu, 14 May 2026 12:04:29 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@gmail.com>, xen-devel@lists.xenproject.org,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] ci: ECLAIR: avoid intercepting intermediate linking steps
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <edd4d992a269dc45b4a41f1c8277ff0d04995dc6.1778753597.git.nicola.vetrini@bugseng.com>
 <fbd3768e-1245-409b-b1d4-b27978367a7e@citrix.com>
 <bbe533dcaee879df50bdf00cefde87cf@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bbe533dcaee879df50bdf00cefde87cf@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0036.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a360b8-1864-46c6-0032-08deb1a8945e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	7qZKY/+EhwzgQ5XaWtQSRM+RR2x7pQ1Jci0ISIiGsXY8PPKgyI1oVHnYUkD5/GJHEp0lGA4HWbjNndFAEh8i6djo4s9fehT88asd6zMegC3DdDTs7IIupjBAwLN9VToCRzQ/irQ43gFuUmrVkpAwYy15mMWpMI2eRIxn4dRDsCRneaJVHs4cnzTCExGzNPPqG02FV4GCqiY4nM40iJ4GwffWao8wHCOiPslbpKjTmmtm8Pbgtmh+8WDgskKLt/FdZN2thbH2FUGZ2+QlrOXIDQamH3pRZItnYHHp1m+BsHzrUzcgqal+smh7QLJjlnT/3G2Sdk+NM03WbM2irsgk/OvvhB9ekq0w8KT7iv/nmEOPjYKTSoHDOU70YkF4jcRfCumFI0oFMj/hFu2ruwQOHFOtFHtCt+F28k3Yde/bkZmavEzVEZhguWyuoXrw5DJDtWj7fTj2Z4UaWC0Vk5bE6J3cc69ALWkNhUEhjnQ9OoIO1LEOFA4If8TFGvK/BKhhhyDrjjhGwaGF6RNB49n+0V6gel8nRCra4ja04QDDpF2NzsMZipMU3Pc/Xy7HJ8dFmi8nNhYXYP0T+oKI+SFlhzpoXpeMH8J/scJQb83h8Bau6vxJQv83IHNdqcURzz1YcLzLvl98bEwTKDc9BWR2jEylL/Ud2SOXwMSiGaqhocd/e9mlMvi9+1KPRCHpwgiropX6vUh/WJR5FA8ngltgMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXVRUjBKSHVqemRLaGlxaURCc3dubjVPMWE3VVVoemtBcndDd3RqMUxTKzFM?=
 =?utf-8?B?UkdHUmlhTy9acExZUlN4cVlBUjM5MTVJbE4rejA2aWJkT0xiQWtIa1JndXpD?=
 =?utf-8?B?NE5NTTRqRjJ3SDZvSU1FK3ZsdEd5SmhjbjZ3K0RiWE1nVm9pWWhoZ3hpVklj?=
 =?utf-8?B?TlQ0TXExSkxLOVppYk9YY1dZcVNPUDRESWg0SzRhdnovQ0hPcmZWV29vUGZG?=
 =?utf-8?B?OXltc2pMVHlRMHo1cDV2ZmxFNEVZWEtycTlaS013REpNdENwaTBtZDZxd1VT?=
 =?utf-8?B?VzhqdTF4NDBoMGtXK0Vya2MrYWo1OUZ1TWNZc1VtN1pwb3dNdnJ1dWhCR2Np?=
 =?utf-8?B?Qmx5M0NpTVN4RE1hc0RQdEdvV2czdEdxdVJwTi82c1pqaWZyYk9ndGplTlkr?=
 =?utf-8?B?WU9keStydkdPV0tSc1JBajBNam5OdmtzWlV5aDl0Nmk3eTg0cWFOZmUvVmZj?=
 =?utf-8?B?RTFGOTJ0alp0OUh2WFEzUVlVSkRDLzdkMld0cEdJSVZzeEJaZkxDckgwc0t2?=
 =?utf-8?B?YTZ4M3pXTXIwTkg0bVRXUkRIbUxrTm96OFVtUHkwbXVZOEFqaEZUK1pveGFB?=
 =?utf-8?B?QUs2NC9EQWlRVFFBT0IxWTNwSzZRdlZQVUN6aWVpRjVrNndYcXI0M29VY2NV?=
 =?utf-8?B?aWJldmRaUU5nSk1pOWlzNDIzZGZxTG0yc052VXZlMk5LcUYxS0t0akg2THp1?=
 =?utf-8?B?KzFGL3RUcFRtZjRDZTJKeVJ6c24yZlBFQjE2dWp4bzBSN0pPTS85dFprekQy?=
 =?utf-8?B?blQ4M3JYMUJUSk5Uenl5eExLRkJDN3AvUm1qUkl0RVdXc0lDZUV2ZTlkSnND?=
 =?utf-8?B?d1BjbnpJOGJ2d0lzWDZ6MW42QStFZGQ1Wm1yS29iQmxNbndTMnNLdHRTVGhz?=
 =?utf-8?B?VU1PNFBwUjlEaExPU3lXTkhKRjN3bVIwQzdCdkNJby82V2tnWW9udUZVV0x4?=
 =?utf-8?B?ZTVtbktpQjZXb3YwbnVlUXBnY3NZdmx3VUw0enJyVXU3WXdIVmpHdHZpNHNa?=
 =?utf-8?B?Q2VzK2ZSODBWRVQzcm1BcHR5S2NEQnVJTTlmZTRwRlBoVWp5UDc0VlFuTGhr?=
 =?utf-8?B?YzlYaXB6SmlQUlZFTkJQYThrVlE2dnl5WjlVVzhmNEtTWk5McmM2SnQrYTBO?=
 =?utf-8?B?SFJDMEZFSHJFcWVtZk5OUFlMMzZncmRCc2xkWTJ2QlBNV0xBOUtxRVhTV3Bk?=
 =?utf-8?B?eUlwVDgyYzZVMEpublh6MkM3cFJxVy8rdWxpa0x3SWw4MHQ2TlVIejZtOWJy?=
 =?utf-8?B?OUNKREtjRytacFZURm1TTGdyQ3gxRC9jUkJKSG9qaG1MNW5hOUV4NWlWVmZt?=
 =?utf-8?B?QnAwZlorY21PejdkRWY3T2Yva3JiQWFKTEFDYkMraEJpYktleXNyQ0Zla3d6?=
 =?utf-8?B?cjJqSG1aN2VrSW5FczBCdEhZeDNOZzNTV0J4d2VZMEhLTG9NRW9BL2FhVUI4?=
 =?utf-8?B?VEtLekMzQmxKdWtYTSt5aHljSVkvQjR2Tll1cHFuWEx5eDV3VExMY2RuY1Az?=
 =?utf-8?B?WC9tNXJIQUxYQ01zWUQrWFE2eG5qRVZyOUxrQWRpb1NWRWRud2dlVTNYNDMy?=
 =?utf-8?B?R0twWnFKZ21SVDZZODUxV1J1cmRHcnI1VXNZTEZwUm81elpLbFkrUk4rdy9l?=
 =?utf-8?B?ZVNzcWp5R1BrQmVSZVlBWnAxaytrNXkxSFF6dnE5SVVrWVpZd1NnZlRWM0hO?=
 =?utf-8?B?clVET1JUaDV4em1zUWcwQTJ3SkVlaG5NWlh2NXJFeVpZWUtaaU1kVmlWeGpu?=
 =?utf-8?B?aW5MSkxTN2lpRkNWa3JtSUFHK0thQlBWcHUxNUIyUDlGN3pCSGRxZ2tvb3Zl?=
 =?utf-8?B?YXJSejZXd2ZjVjBBcEIxN3FjVy9HNFJZTjRCOUJ1cjZKTzF6cFpEbXFkRVFi?=
 =?utf-8?B?T2hWaHN3anNlakdSODF3UTVSZGd4SDNKQldVd0JIUnMzTUZBSmVIMnF3TnFD?=
 =?utf-8?B?UkJyQ25KY21wUUsyNmN0cFEzUm5CTTR6cTZCL0RDUHlYeHlqOVE1UmhEb2s1?=
 =?utf-8?B?V2FWVHlmTXZxVnluaDVmTUZ5Q1ozb3loUFpSVWZDT0VCQXNLK1Z0RDVtbURq?=
 =?utf-8?B?YjZiYmtjWUVZam5ndC8raWE1eTJwdkdsakhxMldSWFZISTNDeUF1UXplQ3JZ?=
 =?utf-8?B?dzJ1bkxIbUVNZnd6TW1YNVpSWDVwT2dMYnljL0xnMEdEcTNxeEs2Vy9XaXYx?=
 =?utf-8?B?SDZpUmFqUk1GdHhjV0p3eVNmN0hkVXBEemtObkE0ek9RbU14L3dCYjBzQlQy?=
 =?utf-8?B?TW9GVUUwYnRySGNvbEtaMVZaWXVZS2RvNExQa2VRUjlrMXV6bDNsM1hmUXAw?=
 =?utf-8?B?VmV2MFRuR1h3NnZWV3dsdDNJVkdZalVlYmh5dEVRRklVRmk3U2M0TWJjMTFM?=
 =?utf-8?Q?XV8J3895bHXM1SK8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a360b8-1864-46c6-0032-08deb1a8945e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:04:33.5790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1isjMtveOpcJABpvsvRIAMujm/OWKR9pRzBNa9lqZWEp6Tt14/n+iPEP6mJho/ywC6VY6Ocn5GA6qiWU1JdMnRWxmJPPoutGRNFmyIBvqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8029
X-purgate-ID: tlsNG-16d1c6/1778756677-8D584D75-8A10C1D4/0/0
X-purgate-type: clean
X-purgate-size: 2517
X-Rspamd-Queue-Id: 219F6540C0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,lists.xenproject.org,bugseng.com,cardoe.com,kernel.org,suse.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,bugseng.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:nicola.vetrini@gmail.com,m:xen-devel@lists.xenproject.org,m:consulting@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:jbeulich@suse.com,m:nicola.vetrini@bugseng.com,m:nicolavetrini@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
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

On 14/05/2026 12:01 pm, Nicola Vetrini wrote:
> On 2026-05-14 12:38, Andrew Cooper wrote:
>> On 14/05/2026 11:16 am, Nicola Vetrini wrote:
>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> These do not add any value to the analysis other than duplicating
>>> some reports
>>> in whole-program analysis, as the intermediate linking steps are
>>> only used to
>>> build the symbol table.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Pipeline:
>>> https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2524548198
>>>
>>>
>>> A significant reduction in wallclock time can be seen for both arm64
>>> and x86_64 jobs,
>>> with no impact on correctness as far as I'm aware.
>>
>> Yes, a very nice improvement.  I suspect this wants backporting to
>> stable trees too?
>>
>
> Perhaps. Is the rate of analysis significant there?

Security content drops on all trees at once.  Even shaving 5 minutes per
tree (and it's more than that) makes a half our improvement in wallclock
time for CI to complete.

>
>>> ---
>>>  automation/eclair_analysis/ECLAIR/analysis.ecl | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl
>>> b/automation/eclair_analysis/ECLAIR/analysis.ecl
>>> index 399099938f..ec37f7eff5 100644
>>> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
>>> @@ -34,6 +34,13 @@ their Standard Library equivalents."
>>>
>>>  -doc_end
>>>
>>> +-doc_begin="Do not analyze intermediate linking artifacts, as they
>>> do not differ from their final
>>> +counterparts for the purposes of MISRA C static analysis."
>>> +-file_tag+={xen_efi, "^xen/\\.xen\\.efi\\..*$"}
>>> +-file_tag+={xen_syms, "^xen/\\.xen-syms\\.[0-9]+$"}
>>> +-frames+={hide, "kind(program)&&target(xen_syms||xen_efi)"}
>>> +-doc_end
>>
>> Why the difference in suffix in the regex?  Slightly rhetorical because
>> it's the full link address so includes an x for 0x.
>>
>> But, the two regexs for suffixes really ought to be the same, so I
>> suppose we should exclude .* for xen_syms too?
>>
>
> Fine with me.
>
>> For the sake of clarity, do the names xen_efi and xen_syms want a _tmp
>> or _intermediate suffix, just to make things a bit clearer?
>>
>
> Ack
>

Ok, I'll fix up on commit.  Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>


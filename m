Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOroDMk5sGlbhQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 16:33:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD82539EA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 16:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250209.1547685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzz5C-0006de-9D; Tue, 10 Mar 2026 15:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250209.1547685; Tue, 10 Mar 2026 15:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzz5C-0006c3-63; Tue, 10 Mar 2026 15:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1250209;
 Tue, 10 Mar 2026 15:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pBDb=BK=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vzz5B-0006bn-5h
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 15:33:17 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72f44dfd-1c96-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 16:33:14 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5536.namprd03.prod.outlook.com (2603:10b6:a03:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 15:33:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 15:33:09 +0000
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
X-Inumbo-ID: 72f44dfd-1c96-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxFMpE/pQMLi+wMcJYqrBc/qcKgdfG9XBfKOv6ZPQj8wWob6R+VZxHj+Sakp3oxjMVeNOTw0ioy7YejVEkRRNBTrScM3S2icPWhdOlLEhGuLLuCrLETtC9z/HjEoHIRpBV7iRS/5OcXCR6JqKzUJepq2mLsQgAZXkW43QSruUnDm9LLQfPrOD4QImUYZo4BhLnl0YKklgPlmEfxiyovgKzhukMdZpZp/Kq1TiQYs/cLlLCGg/Y6KocRjQgLL9zj+quVyH58rMRq4PwPtOT4w8CO3FSEcwf27tQjqSYcpQWgC/bTIxrt+mHdKx7ecymaLipxBKG7fgg7YuGEQn/ohvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvYyQWMH+apiELISRx4dcMqrsGKmwXo2+p/KCJkUEDY=;
 b=pVlrlSIr0WeW6UoSvDgZCJ75qbgMeyeOASpnYCry7C8G3hwxXdMvovRHvIdCK903ulZcnPpO2vMke2z+L9ronREx3JIBqZLHs4Up/8Fh2/j+6cjC8xXQWG2ZbcszNp225ZUBCerzh5ym6ixvYaJ2rAFaqg4aFe2BXL/kQmXrPB4y4eDdIGGpP0kSQfeybm6Dvlzfj3YK9JfJ0OGugi5ldlwed44GObFH8Mbviyxn3HOKEkDr1MkZCey0GCtjLYxoPlJKppXEhor+ardI/RsXbEAluXHejul5znLIKj1tPK9nEYgVTYZyjPSVGUPlueRdwU94vmcEM3lxPQCDvkILqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvYyQWMH+apiELISRx4dcMqrsGKmwXo2+p/KCJkUEDY=;
 b=nq6Dx2gAHjbI6oaAzScj3mYUFhEzVGTNnlRvgOWj2If1yEOfTaQP/0nkMbKKKFbmil7CiM9eU+/vCbMXoF/Cvh5rAKlZot7aZPcMkMIfWxNyagWR7a8cLJKSCa8t2ZipnFVEvuKAyTikA1+csw+41xnw9hGm7NVD7VLr7pb9E9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cd55fdfc-a3f4-466f-876f-dcbbe842ab40@citrix.com>
Date: Tue, 10 Mar 2026 15:33:05 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/6] x86: Remove x86 prefixed names from hvm code
To: Jan Beulich <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-4-kevin.lampis@citrix.com>
 <4a5018a2-9867-432b-9464-874532241316@suse.com>
 <9eed183c-4157-4432-94ec-a7b7a689fd4a@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <9eed183c-4157-4432-94ec-a7b7a689fd4a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2fc338-3d5f-4a25-5cba-08de7eba552c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	z+OjmC2FsSw0ViyG5W8zka31gZIL4MI1Dd6e1Ww9dd45G6Sxv4JeRjrhCCX4iTOBYbi8lf4R5RLgeVbVXgH7CezoQD9l0OoIHnbCBneHkA+2VKt2YwEK1o1LXkjETgopc12kn2bbkr+wgw0sqRNKFpKR1TMm0xRb686h8bOD7Tk/ZcOTTIi230bbXWerltYOnKoAD4NI8h5BubEk1F3d6Aarfkvo7in1Ona0jEiwWVfYUoNmC53NlvQSzmb4pb8gqwBuo2YK2p9fRLnlUaT+/o2PTjy2iTI7jcaBUGNJxG778J+xJ6oxooyZbnq2MSgY7XabuXJHr7sxP2E8LK2RBraH4dcyl8MFfL75cC8lc+Nm/KNbkjbAz5a/py5S/aqmdskZyzaSoaLnvobGmTG+MWgmkMnFGZTtRZOc+mcPnvmaT511dnbSzTbeZleD7T0k0T+5xtP1FRw4nAxyIbow67yBfeeqBxcQfR0Qbj6ONKpuwY3A/T4KSalKbqojeq0BsFUMLNgHtMS+AbNhRTfLFPKMgx1KYxTCKao9CzJbmM4rj378V6JNGT4q7WBSduKIf62naNNsc9Jy71A/QJPG57QzkEfI0GnEc4x96zbW985eKd1qu95pI8CEXdkpR0xMiOJlT7pykVKVz0JYQ0ODVir5GOpuG8iFtcgCAGt9ZBc45yHIZjAxdQV3FQx/2qQNqX8EV0ZRZExY9OPDp64KZvvQx7o9BuFdaQ1Uxz0AaO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjVNR0E3K2VsWkpvcFZNclVhNUtOVVRpbjJXUmJyWjRFL3VTL1RhWGMyb0Nz?=
 =?utf-8?B?RFB1dkVTcmd0QStzaGo2Ni95WHc4S3RZOWVPMjQ1VmorbjNxQUV2eCtibTFP?=
 =?utf-8?B?SUxnaU1mUk0wa2tVRG1kQmo5Y1ovSDYvN3NMK3Y0dE0zdzVBdENwbjg4ejdj?=
 =?utf-8?B?Rmpqc3R1WE1mT2hja2g2UnFmRXQ1KzhhOTR4RWR0TnZma3FCZ1I0MG41TE1W?=
 =?utf-8?B?bmFFWTNMU2dFUWphbFFuZW84Mmlia212WTBRZHBhdlNmREJzSGNFejQ0anJa?=
 =?utf-8?B?V0xxVFFLQXczK2ozWFBRejdaWUIwVysxUTdROEhoYnBwY2JEdzA3L3dXRDFm?=
 =?utf-8?B?MnloRWNTcm9kcENkZ01mb0RvY29WR21YbWRHZktjclhzaitUN0RFYnFQYVFp?=
 =?utf-8?B?YkpjclduclM0bzdvLzluUlkrckIxL0RGL3FWdVdCb0c0YjdQMTM3OHZ5SSs3?=
 =?utf-8?B?N3ZseE03U1c1bXo4Q3liK25jaXFmbXl2amhGVmpWQk9hWDAvVlg5WGdGTDQw?=
 =?utf-8?B?bmlyWG5WQlJ5b2tLaElKbzRhRjMxODhRdVNrSWd3eDAxYmpKWDhFb29jc25v?=
 =?utf-8?B?VTdtcFVva2xZUndKcFlqaDhoUTVabnJZSG5WSkNaYlVXT0pQWkRpK2FINGpZ?=
 =?utf-8?B?Y1Y1aGtMejd0MmdPR3pUNVQ4NEZjWTVucFRXSy9lRnM0OTIvek1OM1dFMmVt?=
 =?utf-8?B?TkFuWjVMMzFjVW5Hdk9aenJmZHlPRldSSkplMTZwRlB3THk5U0tCVFhJOVRE?=
 =?utf-8?B?SmJXQ3J5OEhzR0tNb09KSExlbFVyb3lqQjNRc1hieGpZdlpxaEljaURhL0xn?=
 =?utf-8?B?VFhHeC81YWl0TkdYbGtHeU95WDdwemJsV0JwVDdSTVhGOHk5aStEMXFCdTZF?=
 =?utf-8?B?K3ZjWlV3VjJCMHBmbjNXNTZ5UEtWMml4ZktPYjlCem1vUktzQ1dDQ3dDM3c5?=
 =?utf-8?B?SlYzSUJ1T3VEdVJTT0VNWGg0Z0lQbk95RFZSWjRpd0JQSFMwYlQrdjB1ZWF0?=
 =?utf-8?B?TkxJRHFCcTFkbUV5V1BTRzF0cTlaUzluTmYyYlhoT01Qb0psdTVnaTUxMEFk?=
 =?utf-8?B?aTdjRHgwNVFFLytJRXJxZ2MrVXRIdVN2WmsyVTZibDFjSEhCcTk5T0lsZ1pM?=
 =?utf-8?B?RWs2b3ZuNFpJQ2F3cGdtNTU0dTFmZC9mNWJwb0xiaGtCMjNNSXBBVG4zajNj?=
 =?utf-8?B?cStMYnBHNElCV1ozZWdaUzNDYm5NTEYzTHRjRElhUVJEclRabDdpWkY4dUV5?=
 =?utf-8?B?Z2NlRyt5T3NSc1MxNnNKazlJYkhLUHU1M01vOGt0NlFqeVUrWHVleHVnbXB1?=
 =?utf-8?B?WGZwV2twS2lmZ004Y0s3RTJvQ1R0dExqVUIyeVNWeW1pc0owcExMRG91bktR?=
 =?utf-8?B?M2RKa243WXJSeFMrbDlSZlJ5RS8zd2tpbzcvajQzeXdDNWluZWlyeG8ydzlE?=
 =?utf-8?B?MkcxVC90U0wvUllvS3dseVpmUzRmN21lS2Z2NW1VSFZjSXdTWWtrdnlkOW12?=
 =?utf-8?B?bVFTbkVrMG9KQ1hHTEVDQmRHaDhXTFk3WURTdmI5Vm9NR09SZ3dSUkh1UnZp?=
 =?utf-8?B?eDB0QUVrVXRKMVFJRXZXSTJwdm1mYmZ4dkx6Vk5LRFhCNVZ5OUFyd3lYU0JT?=
 =?utf-8?B?dTE2UEp4eVFTWVg0cVhEaHgrQ1lOMVR2Qzd2WWJwTWJrdExxOUVHeTBpelNS?=
 =?utf-8?B?VmJMdFpYa1FkdWk0c0dHK0l0OE16ZWFJM1hmR1krVGpaQXZ4SDJrOHBjL2la?=
 =?utf-8?B?Uk9ERFpxTW9FTUU5VW96TVVNN21RWFBJeEJwa01sclI5SkZMTHlveTZSZnRN?=
 =?utf-8?B?SUNGOWtJYllyQUF5UDhXSTdyMEFDZWVxamg5MkZrTHExcDh6ZHM0U2lFTi9P?=
 =?utf-8?B?ZlVGa1FyZzZuSVBqVUxTcnE5VUQzSkNBNGhyVzhwMlJLRUp0UTEzb2JvVlQ1?=
 =?utf-8?B?L3BpY05FYm5meEVZUWJTS1VDZ2pOMlZVT0FSU0RoOG9rNk1Wb0hiZG16eUdz?=
 =?utf-8?B?L1B6Yy82NHVha2xKYWcxaFp6L0xpWUZqTzlSOEF3UjVicm5rd1NJbjhNdVdv?=
 =?utf-8?B?Z1FKWnZVa2RvVlhIVTFFckoyNVhjMWpXY1NVUUVkMmdMNlI4RGtNdW5oTG5M?=
 =?utf-8?B?UzJ1VktrM0xud0R3amJKKy9vUUwvOFh5TFY0YjdWcks1WlJxQ3BRZ3JHclVZ?=
 =?utf-8?B?cXVraWhybTFQeURWbkVYSm5yenFPeTU5QkdPUjAyb3hIbWdFd0ZMbjhmcmFw?=
 =?utf-8?B?d0hMSUZJQW5heVMzZnB0dEgzbDR2eUdnOC95UXI0K0VUcHZmU2ZZTzlxeito?=
 =?utf-8?B?c3hIQ1IrcTZGb3dIbTFmcFZRM2duUUtjVkljZlRmdzdnV1grYjFyQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2fc338-3d5f-4a25-5cba-08de7eba552c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:33:09.2068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUxPpIJHuzTxN/gUUBG0uqag4s2Uq2f4sRq7XQCAAoOjlndGYG2ciBY/796NVL7X65dp6KxwqHjnTYWGjomcFnWW6NpwqZW+AYVaai4n27c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5536
X-Rspamd-Queue-Id: 92BD82539EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10/03/2026 3:29 pm, Andrew Cooper wrote:
>>> @@ -3073,71 +3077,71 @@ static bool __init has_if_pschange_mc(void)
>>>       * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
>>>       * this time.
>>>       */
>>> -    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
>>> -         boot_cpu_data.x86 != 6 )
>>> +    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
>>> +         boot_cpu_data.family != 6 )
>>>          return false;
>>>  
>>> -    switch ( boot_cpu_data.x86_model )
>>> +    switch ( boot_cpu_data.vfm )
>>>      {
>>>          /*
>>>           * Core processors since at least Nehalem are vulnerable.
>>>           */
>>> -    case 0x1f: /* Auburndale / Havendale */
>>> -    case 0x1e: /* Nehalem */
>>> -    case 0x1a: /* Nehalem EP */
>>> -    case 0x2e: /* Nehalem EX */
>>> -    case 0x25: /* Westmere */
>>> -    case 0x2c: /* Westmere EP */
>>> -    case 0x2f: /* Westmere EX */
>>> -    case 0x2a: /* SandyBridge */
>>> -    case 0x2d: /* SandyBridge EP/EX */
>>> -    case 0x3a: /* IvyBridge */
>>> -    case 0x3e: /* IvyBridge EP/EX */
>>> -    case 0x3c: /* Haswell */
>>> -    case 0x3f: /* Haswell EX/EP */
>>> -    case 0x45: /* Haswell D */
>>> -    case 0x46: /* Haswell H */
>>> -    case 0x3d: /* Broadwell */
>>> -    case 0x47: /* Broadwell H */
>>> -    case 0x4f: /* Broadwell EP/EX */
>>> -    case 0x56: /* Broadwell D */
>>> -    case 0x4e: /* Skylake M */
>>> -    case 0x5e: /* Skylake D */
>>> -    case 0x55: /* Skylake-X / Cascade Lake */
>>> -    case 0x7d: /* Ice Lake */
>>> -    case 0x7e: /* Ice Lake */
>>> -    case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
>>> -    case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
>>> -    case 0xa5: /* Comet Lake H/S */
>>> -    case 0xa6: /* Comet Lake U */
>>> +    case INTEL_NEHALEM_G:
>>> +    case INTEL_NEHALEM:
>>> +    case INTEL_NEHALEM_EP:
>>> +    case INTEL_NEHALEM_EX:
>>> +    case INTEL_WESTMERE:
>>> +    case INTEL_WESTMERE_EP:
>>> +    case INTEL_WESTMERE_EX:
>>> +    case INTEL_SANDYBRIDGE:
>>> +    case INTEL_SANDYBRIDGE_X:
>>> +    case INTEL_IVYBRIDGE:
>>> +    case INTEL_IVYBRIDGE_X:
>>> +    case INTEL_HASWELL:
>>> +    case INTEL_HASWELL_X:
>>> +    case INTEL_HASWELL_L:
>>> +    case INTEL_HASWELL_G:
>>> +    case INTEL_BROADWELL:
>>> +    case INTEL_BROADWELL_G:
>>> +    case INTEL_BROADWELL_X:
>>> +    case INTEL_BROADWELL_D:
>>> +    case INTEL_SKYLAKE_L:
>>> +    case INTEL_SKYLAKE:
>>> +    case INTEL_SKYLAKE_X:
>>> +    case INTEL_ICELAKE:
>>> +    case INTEL_ICELAKE_L:
>>> +    case INTEL_KABYLAKE_L:
>>> +    case INTEL_KABYLAKE:
>>> +    case INTEL_COMETLAKE:
>>> +    case INTEL_COMETLAKE_L:
>>>          return true;
>>>  
>>>          /*
>>>           * Atom processors are not vulnerable.
>>>           */
>>> -    case 0x1c: /* Pineview */
>>> -    case 0x26: /* Lincroft */
>>> -    case 0x27: /* Penwell */
>>> -    case 0x35: /* Cloverview */
>>> -    case 0x36: /* Cedarview */
>>> -    case 0x37: /* Baytrail / Valleyview (Silvermont) */
>>> -    case 0x4d: /* Avaton / Rangely (Silvermont) */
>>> -    case 0x4c: /* Cherrytrail / Brasswell */
>>> -    case 0x4a: /* Merrifield */
>>> -    case 0x5a: /* Moorefield */
>>> -    case 0x5c: /* Goldmont */
>>> -    case 0x5d: /* SoFIA 3G Granite/ES2.1 */
>>> -    case 0x65: /* SoFIA LTE AOSP */
>>> -    case 0x5f: /* Denverton */
>>> -    case 0x6e: /* Cougar Mountain */
>>> -    case 0x75: /* Lightning Mountain */
>>> -    case 0x7a: /* Gemini Lake */
>>> -    case 0x86: /* Jacobsville */
>>> +    case INTEL_ATOM_BONNELL:
>>> +    case INTEL_ATOM_BONNELL_MID:
>>> +    case INTEL_ATOM_SALTWELL_MID:
>>> +    case INTEL_ATOM_SALTWELL_TABLET:
>>> +    case INTEL_ATOM_SALTWELL:
>>> +    case INTEL_ATOM_SILVERMONT:
>>> +    case INTEL_ATOM_SILVERMONT_D:
>>> +    case INTEL_ATOM_AIRMONT:
>>> +    case INTEL_ATOM_SILVERMONT_MID:
>>> +    case INTEL_ATOM_SILVERMONT_MID2:
>> Can the Silvermonts please be grouped together?
>>
>>> +    case INTEL_ATOM_GOLDMONT:
>>> +    //case 0x5d: /* SoFIA 3G Granite/ES2.1 */ // XXX ???
>>> +    //case 0x65: /* SoFIA LTE AOSP */         // XXX ???
>>> +    case INTEL_ATOM_GOLDMONT_D:
>>> +    //case 0x6e: /* Cougar Mountain */        // XXX ???
>>> +    case INTEL_ATOM_AIRMONT_NP:
>> Same for the Airmonts and ...
>>
>>> +    case INTEL_ATOM_GOLDMONT_PLUS:
>> ... the Goldmonts.
> We need another sync to intel-family.h.  Christian made a correction or
> two in this area.  I'll do a patch.

Scratch this.  It looks like we're already up to date.

~Andrew


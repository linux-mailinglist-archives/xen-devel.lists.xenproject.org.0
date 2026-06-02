Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODzvHgKrHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:05:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6662C207
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324705.1590204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUM0C-0003sj-Mt; Tue, 02 Jun 2026 10:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324705.1590204; Tue, 02 Jun 2026 10:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUM0C-0003pu-JV; Tue, 02 Jun 2026 10:05:40 +0000
Received: by outflank-mailman (input) for mailman id 1324705;
 Tue, 02 Jun 2026 10:05:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUM0B-0003pj-7x
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:05:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUM0A-0037bU-Kp
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:05:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1eaaee-bab6-0a2a0a5309dd-0a2a450ae702-12
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:05:38 +0200
Received: from [52.101.57.66]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1eaaf1-56b3-0a2a450a0019-34653942c7c1-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:05:38 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7855.namprd03.prod.outlook.com (2603:10b6:806:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 10:05:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 10:05:35 +0000
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
 b=X82mWSSfkcLRUEWRVvZifGlKCt1VBGlwX+tCSRbXIij8x44gI0r3IcU4pq4s8urSPLzllRrCT+UfAxFvr+DODbVKwiEQ3fXWlg0+xknyYZqNWcO471NwamANIFa2i73dUAIrlSq1VFAWMy0i6+U52mnkof7pSUbKgUVhcMvhrLPlV2KvJDjtX8hEoqqD4JtJJ6nGOKaHkXC4Lae5ix6NrNZP4g88s20xrAflE/SCoELz6tw0L8K9848U0LXYzjJaAzpjq9STiYrRizvRmYHBY4Hm4oJAyRl82KNHXZ/NbHCZoNyud3Szau4ZTvEVjUaxy3eZaUGZsTJGtuFfxhL1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5aoZLIyBgmWH8pauqS37sErT3pu2WCyZcAgIiblrSQ=;
 b=COFS5d5EbSZprrWklShWV6BWimUPA8NugSmWo0PHY5DPX762jFpyE/7c2BvAzzAACZn7L+IbhcZldF+oAWUYVV92G680ErYv36dNiXMgbPief9MD5ghv3BcYNQehcG5QQh/CSX5bic74gXNYSJRqlwNP8OWtxt++6awKm9Gmtuui1LXmCQzVY0IF2L7HBddcv0whCuMnXnpD63oOZtcaxUMt9hJpvVdp5LBeH8AgUxi02euvVpG4c/pMUKc4WpepwZmn3gBgdxlBAqv9/bRaWnk3l2Ahw6urG/Rngo+xz1UPqCkHZmjf2g2XA9IS6kIqShDgc0/hXnh7fSmxL1nyew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5aoZLIyBgmWH8pauqS37sErT3pu2WCyZcAgIiblrSQ=;
 b=eaCCNvF6lxUqNfxgFDBfR8IEfKcgbUyrKgDJbyBfIpmkaMDYNBihzGU1JSUsxRCn3aMAgEsrM8OcSquCjkRv4JW1GFJqUchiYpKvweoX8h/cQe4ee+Fy40Lk/muPibasdgJ1e+w8maYr/lAGwGnpL+vmcTWI2s96aNzLsKlhshM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9915b0a4-0219-4c91-b070-d39c74b84d03@citrix.com>
Date: Tue, 2 Jun 2026 11:05:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] public/xen.h: Update mmu_update comment
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260528075539.10209-1-frediano.ziglio@cloud.com>
 <fe9e3f66-5f69-43e2-b367-af8a8e152c41@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fe9e3f66-5f69-43e2-b367-af8a8e152c41@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0013.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 364b7ff1-5e03-41db-362a-08dec08e7d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	xhWtucRV8LYxDd+vihmkRKbRt3w17RgPWP7brH4j7PeePOZJMWAFMkoPvYMY/KnNWTkFnzuE+mwiOjiFRY2wcufs9+TXi9p8GOzUb5KmDgJe+GPjGM7920N4vobH4H+fsAzw5hqjW0lOA9cKLQZhRJZTF6IxBTMjjZ/iw9ZOrZX8Ap7KhJnboRNyIizrVsYieWofvMwfR1cZas1ieznN5N2NsuFB6r/xR3jbdd03zNEwo5YG0rWmfPXS1//c/xsH/YluBjrdPhrq0KhhTZMVJFJ3vff0dJj7ZFBA1RE/NGDAb9b78tPcYDcMCfSsdO/aSQLQc16JHy25ubhpbMzQoUSCCawdP6laCkDtmWQwaQZLMgfs3/8q8jEtcf8HKugrw62+QuenXBu8IL6Ax1FvzjDUiCnWHl7tV2QNMN2MjHerMOUVmTIJEPkaRaqZ/DgQca+50zX96S6TPDUP6LkKa1vCAuvQG+KoSjPFgq2Rm91xwW8BqDii2cIf+mRJGEsgdjtB1Ul0PkzpsUirGC/1ZHW83UzX6sKk11XtBcKD7Z0CosQ7mEZmzpHHR9Xe8AZEMYhnWb7x4bT5+KszVJNimFX9fOS1q55QQSZJmw2XkScL3c1TUK1/RFxrpgNeeRTCzzzmNq040exJcT48Pe9jut06HwaXb6ykKPHg0e/13BXVlblFnd9IKXtLOKKAt0YU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU5BNnZtQ2psNFZzVkZJRTN1VFdHOEQ1YzRnVHhCTS9zdVdDOWE5cHcvOHMy?=
 =?utf-8?B?MkI0cHVoZlF2THVSZlhGUHJGTWtmWnlXY0pZZzM0VUtnZ0p1c1BpZEI3OWY3?=
 =?utf-8?B?ekxmNnVqeEJyaFRydG4zVXVBWkY3aVRrQkhXak56RTNNLzAwajRDNU4yTHh0?=
 =?utf-8?B?ZThGY0JmTlJnbW4zWkV0d1N2em16djYvUzJLQVNOcG1UWjdVd3dqb2Rkd05Z?=
 =?utf-8?B?VXRIUUptZ1Q0UkUwR25wV1JMZTE0VWM4NEpjWnQyRVd4Unc1VnN3dG1zZjVV?=
 =?utf-8?B?QU1FN21uY0R0bm54eWRteEt6cjNKSFVBUHRMUEoyVFVNcGp2OThVS1o1SHZp?=
 =?utf-8?B?bTBSOGlTSExnYU9NR2h6dzM0cHEwTkZ1enR6bnl4RUZzVVl3TTZnSXY2QWhD?=
 =?utf-8?B?aXZxcHJOWnEza3BvMFdkbW42c0NxRklNV3dwUkExKzVOWTlmUjA5bmZneUlv?=
 =?utf-8?B?S3RnS3RxdFI2WG9LMFl0ZHV1MGdSNXJrYVZjd01RQUNOeUYvVnRjdGlkUGc1?=
 =?utf-8?B?WXlFSi92bU1ld2swMFN3d1R4b2hpcEZQNG9hZDJja0g0V3A0NllXNFpHQ0pP?=
 =?utf-8?B?NzZ4eUtFaUFOWXlUR0xtYThiZkYvcEtoQ044NkMwcTNQdURhMlkxZ3MxMklz?=
 =?utf-8?B?TFdKN05jcUFJVjJmSFlmOUMzVTNMaVZSTThaaFN0ZzZmVlozZk9lTGRPMlpt?=
 =?utf-8?B?UVhubHhWZmxadExkV2ZVK3RUTkRqNEVQTlRhR294ME9ZelhlVVNSWU05dTVx?=
 =?utf-8?B?ZlpsZU5aczlRYWFCa3ZuVExDN1Z1eWFFN0VXNWsxOG42dlJXV1l2RUhXQWVI?=
 =?utf-8?B?MTBYMkE3MXAvN0cyeCtkMHRERzVuSlBMeFpZTGpSbkVlcjJRT1VpbFF0a3Ri?=
 =?utf-8?B?SjNaY0JIMlk5dG5LY3R3d0lhWUx2WXJ4SEdQMG85RVNLVWhwNFdIbWR2bU9s?=
 =?utf-8?B?Q3FHdjhaY0EwV05jSGVNOUl4S0t6NHg5ZlU5cXZXWExqYXFUV2YrclBtbXds?=
 =?utf-8?B?OEVRWWtwOW1ZL3F6YnliRk1sQ3g5eEgyNkQxWlRLY3dOVHhkUXJBeGN6MWNN?=
 =?utf-8?B?Mlo2RVpGMDFvdUhKS3pEZ0kwSVRrOSt4bzlxOFJPSGZPNGtVV2kxcVpvdGR1?=
 =?utf-8?B?TlBlUzZ4TXNudnE3dDd0QjZTUGwxM3JrWlBiK1lWRk4rTXl5TjFkOUxWZWYx?=
 =?utf-8?B?NEladVZ4SHk5NjEzbGh4bHU0R0Zld3NsK3ZSRkNaZnRhZndTbHpHK2FkajBs?=
 =?utf-8?B?ZTFudmtiNTVTRW9NTU1LdjJRN2lUTmUrcnk3MkdPQThXQ1FMQ3V4U1UrVG5n?=
 =?utf-8?B?aGkxT2xpNHc3YUN4d3k3QU1scGdudWdacytSaHhGaVR6Q0R2cFBCMWR6Z2Nx?=
 =?utf-8?B?ckZYVjRKSFU5cFNuSmlNZjFJSXlPZENTYnUwTXlXWDc1dkpLZDNab2I1b3dV?=
 =?utf-8?B?ZHN4c0ZLaWtyVjVCR1hjaWxFQ21IY1RXNUZGcjJXaGRNYXdZdy9HOHVnVldU?=
 =?utf-8?B?WHd0TlZIVTJmY2ZHL0dleWE4L2dxRmxYKzRaNld1STVtajk3OVRhbFAwQmQx?=
 =?utf-8?B?aXFkYmFYaGM4NXk3eTFIZlZ5TWlaT1cwSjM0RFZxa2w0T2VXcnQ2TFF6c0xQ?=
 =?utf-8?B?KytYaVJwWWFPN05ZR1RmL1dHekp2TnNmL1poRDB1K0NQcmwyNnBjSzBTYmFI?=
 =?utf-8?B?a3U5WmpOL3NyeG5ROVp1eUVSOUpLS2FadStzTWh2SnAyVnVHa094SGtPTGhh?=
 =?utf-8?B?ZlZBRlBOamNhU0xMemE2aXQxb3pFRjhCVklNcVdjbDB5cnBiZlN3NmlHSDBy?=
 =?utf-8?B?b0cxbzFCSWt5UHVYRGpjajVIS2trUW9rZEd5SFBIMXdmdkVSYThnTTZmUXht?=
 =?utf-8?B?VEFxcThMU1d5RU1VS2JvRzE5WGVWUU90NkhlMDJ2TkFNMWlhdEJBa3o1Ujhu?=
 =?utf-8?B?V3V1QUYzTGxQZE01czJUaElJQktJdHdqUmVnUEdyRTd3Vy94RTV6UEpCL1M0?=
 =?utf-8?B?TVBsN2VCS2RlREJlR0VvV05ZbXBkZ3RPcUZyVG9SZ3lnanNJNU9yczU5YTJH?=
 =?utf-8?B?VjFVcWJyeWNzay9QUVprOVdCeHpkdTlmR0ozVTVNMkFwQ3JZbGRQR0RqVXNE?=
 =?utf-8?B?YWcvaitJU21ISHVJcTZDT3VwOEtKQ25HT3JJQ000S1BQYjlyanAyWWl5eERB?=
 =?utf-8?B?cXZUdmxNVWt1Nks2bEtjejJpUFNhT3dubllWVjJhZitQUWJJL2FrRzVzcTFC?=
 =?utf-8?B?VGdFdTRFanRDekhtcE90NHgxR0hOUy91aENzWEhzcU1XRWFFaTJnOTI1L2NH?=
 =?utf-8?B?TkZLZGZ3VEFZbjhvai82TTk1UnZRa1NSYjNsOFFzcGdvOTVSZEZMRnBlYk9y?=
 =?utf-8?Q?mBCwwpAtEPw33VOs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364b7ff1-5e03-41db-362a-08dec08e7d08
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:05:34.9881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJIz/rRe0c25xP4sT1uGesWrnMxy7WViz9wjjIths6g2q9wNWbQ7fLImawqT8CcyEF8wG0dqEBn6noDqTyesLWVb2OCWc7q2uOvxLNvSA9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7855
X-purgate-ID: tlsNG-4011c0/1780394738-727758B7-E1FF65D9/0/0
X-purgate-type: clean
X-purgate-size: 922
X-Rspamd-Queue-Id: 1AD6662C207
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@cloud.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 02/06/2026 11:01 am, Jan Beulich wrote:
> On 28.05.2026 09:55, Frediano Ziglio wrote:
>> Frediano Ziglio (2):
>>   public/xen.h: Update page table layout comments
>>   public/xen.h: Update comment for mmu_update hypercall
>>
>>  xen/include/public/xen.h | 17 ++++++++---------
>>  1 file changed, 8 insertions(+), 9 deletions(-)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Considering these are (doc) bugs, I think I'm going to shovel the patches
> in without asking for a release ack.

Patch 1 is fine, although I think it ought to go further and not try to
not-invented-here explain what an x86 pagetable entry is.

Patch 2 is an ABI change, which is why I didn't include this in the docs
changes I put in prior to tagging rc1.

At a minimum it needs to explain that this is dependent on the pagetable
format, and is safe enough following the removal of the 32bit build of Xen.

~Andrew


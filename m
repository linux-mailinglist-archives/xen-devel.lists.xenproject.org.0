Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DfNDcWJBGoxLQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:25:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EE53501F
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308119.1579660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAVo-0006GH-4d; Wed, 13 May 2026 14:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308119.1579660; Wed, 13 May 2026 14:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAVo-0006DL-1u; Wed, 13 May 2026 14:24:36 +0000
Received: by outflank-mailman (input) for mailman id 1308119;
 Wed, 13 May 2026 14:24:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNAVm-0006DF-3X
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:24:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAVl-0058n7-Gh
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:24:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a048995-2eae-0a2a0a5409dd-0a2a4506a7f0-36
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:24:33 +0200
Received: from [52.101.61.64]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a04899f-7371-0a2a45060019-34653d40a8ba-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:24:33 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7244.namprd03.prod.outlook.com (2603:10b6:510:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:24:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:24:26 +0000
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
 b=vQKBa61HGYdIIZY6hFXCMPPK/rDuwNK3wcRkQfXFlSkDkJ921rspBUOQCZmV5AW5mxJV4WyvaSuHb54tR3Mj+Uve2RyHt58l169JDlEPUer18SOkSnWkX/WrPblYZNKWOvm6v8O/rELGjfBkuyHi7/toMCyfQoATWGhJkGx0W/kCiOuy4becStj4bPRYNTrCwv8y7MFZ2Smjsisou7wo/ak0vU5mo1pYIPC8BUecVgh7iIBaKJ3eDxq7MuwW88izawZZnTmAlBvH7IBQdgpo6bdOwJwpXNLR53vEvVsCd9EAXN/k+9k8PzNKL6bDB2QQW0RzEVNaUkWD5rqsfrzuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6tH1DzWP7kTqpyEIXpYlbkFd2UO+V+9H697SiL9rhk=;
 b=Mf4BxlYIZoS72Hh3R1xUcBNCZLFqQgtUU+PFDMNNxuETw5C/NoPhH6X+d9XABSTIvzNOO+ibDxrcLC1keOSSCSrRoe11jEKRjR9L3T222PeBVwtD+nWyFF/wY7fsikKYFCjIagjwSmMyzBwv7g39cVzg35puC01xs9OS6pPEV6Vq6ud3cZT72ydr9TDPQ9Nop6wpjTLQaUYazoqjhJdibF8wm8aiVAtxtwnaMyJo2euh0U8KcrDop6qT9CAofBg0xsSovr20Iwb4WBVujSTeTw1S442R9xbXG316aM3IEmDRn/CI0P6kkLM1+XoE4XujQ7LA6d21hWeONXs881Fz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6tH1DzWP7kTqpyEIXpYlbkFd2UO+V+9H697SiL9rhk=;
 b=uig2ThJBsFeJUS5WN0PI/SAe08vkyi3nHfHdboaQHyfQ8QIYXxYiuyo9ZJkmjG4K49uMlfM+OJFDL+dcCHBMuvpqv0aZmGUTy4vfdozxDImD2Xx0iEO0IHNYAG7ELXzvRbiQI9SmmrN+g1RQeyicaV3OolSoNh2HAMtZpZHY3wU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 16:24:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 3/5] x86/vRTC: support century field
Message-ID: <agSJlh8KQ9orL6wC@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <383355d1-7032-4445-8a06-cb4411ea797e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <383355d1-7032-4445-8a06-cb4411ea797e@suse.com>
X-ClientProxiedBy: MA4P292CA0004.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fcb7ec-f781-4ecf-c073-08deb0fb55d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|18092099006|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	xsVt6L44x2qtZsVXhC0uZmP3N0tsoU6sw+5JCQQy9frOc9SVu4lOkJnBJACDmNBgNqDh5oyPb195MZa13IVmSJ27zShPI27fieTfqcJK4ELjeY55Z+Z97two4psdyht2Gyc6Ya2wy76ieoNojHfrHdiNylwSecR1QiJ0qkRTHlku6k/znXt7XHcYF7nn2jogeFgTTxulLrg4hFhjIPgn8MxXhR4+/XWYGXdWi6R6kQNqpTtuyreEoEx7cRj2kk0X6SJj/3aUzBmM6fI/wtBSnJtu7EoTGyzUn3pkpRurZSVmJvfRxU1jMw5NojTsWYijnJd+nt13qrVTFANwCfQfZtkb6L0EU4YZgmKoy708QZnH9wTKk7Mdz9VBpVDAkZX1UzQSIXSA8pLjoFfTa4d878zC17uW8QGzlVXrURvNuL0wI2Ahi7lIPqDnztzK8ZlEdT9Lvyf2SDoUX3adLb6i89WqZejOXPdC3Mp5C/ZEvrHAAvJX7ajxcfppK4RGQeoKR0jRtUfHt3/QF1zJvCUurfMfP7f1uFyyfX3pOFmuiHDrPTRnJXyAnV+0e+kN6FWsuq7vf4sgJWub8VET8/g2e+N4oXrANdBLn5rWg7rMZgOR4n545TPZhjHg2ZKMCfNwJimTo/dQgbjy4ohoEkZPwBc2cS8yozNIH9GlYn1MYCG3Dizc4tS5y5LHFIsDdR4n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(18092099006)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk9OSEpQMDJCMWZEUkRZR0ZNZXRDeGJDNmZzQlo3WUlZSzJVb1lHTlJTMVBX?=
 =?utf-8?B?UC9jV1pNM0ZYek52OG1PUDVuV1hTc3JjTDdDK1FYa3dzalJqTGNxeEVNVmlT?=
 =?utf-8?B?LzRYb2lsdHJueWphOHpQTWFaV1lJeHFYTmppcGN4N0RvUGxFUXJqaStTZW5Y?=
 =?utf-8?B?Rld6SC84KzUrTTdsVXhLNDFjMUVyaC8yd1NxZy9zK2Q1NTlFcFRnWDJaK1Z0?=
 =?utf-8?B?dmwwcnVjNjZOejljcFcvbVZhR2VSVmV4bFgvVlpJS0ZibzVLaVlsdEpneEox?=
 =?utf-8?B?SlBQNnFoanlicVFtZmVVZDdSOE45VWNucnJrdEtuV2x0b2NKcHVYV0RwTEpu?=
 =?utf-8?B?YkV0UzFnR1FlRHJyaFhXaHpaU2tZT3VvOTAxbXNQL2ZOdWgwdDYwNHdiR0dW?=
 =?utf-8?B?VUF0QklQVzFlQ2U0dlBzeDZjNFZJcnJzdWpSZ0s5YlBsN0ZlcnpkdnhNcFFl?=
 =?utf-8?B?eUNkcWJKcVJFMlgvSkZkNUlyNkNlMUdkSDdpRGFyZURWd1hlYnIrSXZrTG1Q?=
 =?utf-8?B?OUxqV0V4U0RVNG5lOWtzR2t6NVU1dlRWL2xOcnprOGtodXF0NXdYUWJqcFFQ?=
 =?utf-8?B?alNOSkU1eWp6RExzYXllNFFpMGxDTkl4OHZvQTVvbnBUa3pXa3hyd3hRaCtQ?=
 =?utf-8?B?Vi96Z0dKSkp4UmlmS2l6UHR1cW01OTNTMlhaVllML1ovK3dRS2pIemZwNmFR?=
 =?utf-8?B?NGNLQWNtclhPVk1CUWNIL05nMEsvbHlpOUNwRzBTdjNQQW5rRTM0UjhzWm4v?=
 =?utf-8?B?emUyT2xOZ045Wnd3dE53YUkzV3J0bXZ6dXM0dFRnaDBUcmNidnh6MUx2L25J?=
 =?utf-8?B?QThweXhvbVFob05ycGF3R0hSdWd1TVdXM3ZSRkVuRGxYTkxzRVVuN1NkOS9t?=
 =?utf-8?B?dFpIRldNV3NncENkNExuVkhMZ3p1R2xrOEF4K2ZTMzc3OUMvYjJqRFp1WFJP?=
 =?utf-8?B?TWlFblFCcjJWamtXRnJzVTlxd1A5Z1ExV3M4Sk81bGJpYUhqRG9vMlNKa0Yy?=
 =?utf-8?B?M3lZN1pyVFZQakdSdmpPTXo5WDczbFBjcGoxRlVFTmViRTF4UW13T2w4NkRx?=
 =?utf-8?B?cjVvd0xQRU1KcjgxcTJNREl1TC9hRDVtNGFGWUVOQUdDSGRzY2hOK0hLT041?=
 =?utf-8?B?cUtZNmxneTZtajUwWTdub3VHbFFJQlVweTh1L3ZmL2tiRnRmRXZIbUxZNVlx?=
 =?utf-8?B?enVXWHFQUEg5d2o0ZHMzQjhLTkZHd2xxUHNZL3NzeHkvNktaQlpSQndvQWdo?=
 =?utf-8?B?Uk9USkhCNE81SXdlOWdiMXVlaUt4QVo5d1NGSk0vM1MwWUUycXlXa0ZaUmVx?=
 =?utf-8?B?akhxeDYrbFVja1RCM2d2VXVWb3IzU3cvc0t4ZXhTdnU5cG5BZEpoQzRnZ0R0?=
 =?utf-8?B?M3N2cVV2emVCSVZicWNVT05iTWhMUHZpVHlnSm5HUUlkanhVSWF5cVhjVTA4?=
 =?utf-8?B?RHNpZlQxUTdyazJLYy8yazREVnBlZkhmNTYzZHRLS29OdElCVGFhM2xsWGRB?=
 =?utf-8?B?UEdMMlRKdWhvUHlhemtMYWxsaU5QamJkTXZmQmxLQk02Uk0zK1ZxR2oxRW0r?=
 =?utf-8?B?K0g4Z1Mvd2tCMUNwdVlCZGwySndHaVluVGtRTTFidElENWMrVFUxVyt3Szgr?=
 =?utf-8?B?NEtGcHZPa2lXNTkxelBhZ3ZYNkZZZmtGbTZaZGsyeTBvZ1BCT055dGNnY0N1?=
 =?utf-8?B?VTJJbFBVR2dWa1IzOERQNmFyWEdNeTBPcFBmQzVNb0lCOHVtc1ZxcmNDYisw?=
 =?utf-8?B?eWRhYk93eGxhTkRJd3JxaGNJNS9vMmxkS2g3eWpqbVBCaVc5RzdYUGZtcEhC?=
 =?utf-8?B?N0JxR0RsZDdHVUROd1dNNjd6cmhlemxqdFNrTUQ3cFZhcGU0cER4aE1Cai8x?=
 =?utf-8?B?MGRpbW5uckVtZUlZbTlVakc3UEM2bEFPNTVmak5DUjJDU1E0SG1zUjRnNmtO?=
 =?utf-8?B?eHVCc2gxRjdOR05NZElOTmMzWGFLWnFCaENwTU9SNy84VEpxNEkvNngyM3Bl?=
 =?utf-8?B?UjZiQWszVHJ3SVpGZlVhUTI4aDFQYk1xWGxYMUxyMHFvTkxacUJZL2RLSS9q?=
 =?utf-8?B?M0FGbXIva0RMM1pUcWNkc01wM3FjNkZBUDRVZWdXMlJNYWhlNTNFejJEUUVv?=
 =?utf-8?B?eVd5R1dDUFlwTU5lMldtcnpocUYzUU9MbDN5a3F2dzZzVTB1M09OR29QYUp4?=
 =?utf-8?B?Q2dhRFhZRmxIMExrRzZYV0ZqZlhqaGh0aEVFekFqVUZDMTh3OTZkQ2MrbWNF?=
 =?utf-8?B?SmgrcnNVZHJOcGFZcE92R25sSmdIckRrQmtNbnI1N0o3YWw2QXQyYnJmR1By?=
 =?utf-8?B?T1c0ODNRY3A2d1BjR0JlVU9WQkZtdEVNODloWitiYlU0eE5tUk1HZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fcb7ec-f781-4ecf-c073-08deb0fb55d8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:24:25.9204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giUr+NjTzRDnRFQ/dynVORHZGU0NgN9hQm1kJBvqxwl3ZGxzFs+/f4oorqCcwDReEy+b5XVq4GeKvH6uWAYiIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7244
X-purgate-ID: tlsNG-16d1c6/1778682273-8DF81D75-AF43F9E9/0/0
X-purgate-type: clean
X-purgate-size: 6530
X-Rspamd-Queue-Id: 6D2EE53501F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
> Both ROMBIOS and SeaBIOS (with CONFIG_QEMU=y, as we build it) blindly
> assume availability of this field (at its conventional index 0x32); OVMF
> at least has code to inspect FADT. Hence we ought to have supported it
> virtually forever.
> 
> As the index is beyond RTC_CMOS_SIZE, leverage the padding field in
> struct hvm_hw_rtc to hold its value. Update the field only when involved
> values are valid BCD century specifiers. Otherwise (for VMs migrated in
> from an older hypervisor) leave handling to the DM.
> 
> This makes the Linux rtc-cmos driver report y3k compatibility.
> 
> While extending xen-hvmctx.c:dump_rtc() also add RTC offset there.
> 
> Fixes: 4ca161214355 ("[HVM] Move RTC emulation into the hypervisor")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Am I overly paranoid with the checking of the field, considering that
> Xen 3.x post-dates year 2000 and hence all firmware nowadays usable guests
> have ever run with should have been aware of the field? Or am I, quite the
> opposite, still not strict enough?
> 
> I can't help the impression that this introduces a latency issue for
> the 2nd of gmtime()'s while() loops: We now allow years up into the 99th
> century, i.e. over 8000 years away from 1970. 8000 years are very roughly
> 2^^38 seconds, making for (again very roughly) 5 million iterations there.
> Did I get my math wrong, or do we need a prereq change to (vastly) reduce
> the number of iterations of that loop (e.g. along the lines of the other
> one, first going in 400 year steps)?

Hm, maybe we need to add some XTF testing for the RTC?  I'm slightly
worried how much time this could take, and since those calls are
serialized on the s->lock I wonder whether enough parallel accesses
from the guest could manage to trigger the watchdog?

> 
> Isn't day-of-week handling flawed? If the field is brought out of sync
> with the other values, shouldn't it stay respectively out-of-sync? And
> isn't it excessive overhead to go through rtc_set_time() when the field
> is updated while SET is clear?
> 
> Perhaps we ought to also support alarm day/month features?
> 
> --- a/tools/libacpi/static_tables.c
> +++ b/tools/libacpi/static_tables.c
> @@ -33,6 +33,8 @@ struct acpi_20_facs Facs = {
>  #define ACPI_PM_TMR_BLK_BIT_WIDTH           0x20
>  #define ACPI_PM_TMR_BLK_BIT_OFFSET          0x00
>  
> +#define CMOS_CENTURY 0x32 /* Conventional index used also without ACPI */

IMO this define (together with the RTC_CENTURY one below) need to be
in a public header so it can be consumed by both the hypervisor and
the toolstack.  Having two separate defines, one for the hypervisor,
and another for the toolstack will just create confusion.

> +
>  struct acpi_fadt Fadt = {
>      .header = {
>          .signature    = ACPI_FADT_SIGNATURE,
> @@ -88,7 +90,9 @@ struct acpi_fadt Fadt = {
>          .register_bit_width  = ACPI_PM_TMR_BLK_BIT_WIDTH,
>          .register_bit_offset = ACPI_PM_TMR_BLK_BIT_OFFSET,
>          .address             = ACPI_PM_TMR_BLK_ADDRESS_V1,
> -    }
> +    },
> +
> +    .century = CMOS_CENTURY,
>  };
>  
>  struct acpi_20_rsdt Rsdt = {
> --- a/tools/misc/xen-hvmctx.c
> +++ b/tools/misc/xen-hvmctx.c
> @@ -311,7 +311,7 @@ static void dump_rtc(void)
>      printf("              0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x, index 0x%2.2x\n",
>             r.cmos_data[8], r.cmos_data[9], r.cmos_data[10], r.cmos_data[11], 
>             r.cmos_data[12], r.cmos_data[13], r.cmos_index);
> -
> +    printf("         century 0x%02x  offset %"PRId64"\n", r.century, r.rtc_offset);
>  }
>  
>  static void dump_hpet(void)
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -47,6 +47,12 @@
>  #define epoch_year     1900
>  #define get_year(x)    ((x) + epoch_year)
>  
> +static inline bool is_century(unsigned int x)
> +{
> +    /* Constant below should match epoch_year above, just as BCD value. */
> +    return x >= 0x19 && (x & 0xf) < 10 && (x >> 4) < 10;
> +}
> +
>  enum rtc_mode {
>     rtc_mode_no_ack,
>     rtc_mode_strict
> @@ -482,16 +488,32 @@ static int rtc_ioport_write(void *opaque
>          data &= 0x7f;
>          s->hw.cmos_index = data;
>          spin_unlock(&s->lock);
> +        /* RTC_CENTURY always forwarded to DM. */
>          return (data < RTC_CMOS_SIZE);
>      }
>  
> -    if ( s->hw.cmos_index >= RTC_CMOS_SIZE )
> +    switch ( s->hw.cmos_index )
>      {
> +    case 0 ... RTC_CMOS_SIZE - 1:
> +        orig = s->hw.cmos_data[s->hw.cmos_index];
> +        break;
> +
> +    case RTC_CENTURY:
> +        orig = s->hw.century;
> +        if ( !is_century(orig) || !is_century(data) )

Is a real RTC strict in such a way, ie: will it refuse to set the
century value to < 19 (0x19)?  For example QEMU seems to be way more
relaxed, and allow any century value.

> +        {
> +            /* Prevent further use of the field. */
> +            s->hw.century = 0;
> +            spin_unlock(&s->lock);
> +            return 0;
> +        }
> +        break;
> +
> +    default:
>          spin_unlock(&s->lock);
>          return 0;
>      }
>  
> -    orig = s->hw.cmos_data[s->hw.cmos_index];
>      switch ( s->hw.cmos_index )
>      {
>      case RTC_SECONDS_ALARM:
> @@ -507,6 +529,7 @@ static int rtc_ioport_write(void *opaque
>      case RTC_DAY_OF_MONTH:
>      case RTC_MONTH:
>      case RTC_YEAR:
> +    case RTC_CENTURY:
>          /* if in set mode, just write the register */
>          if ( (s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
>              s->hw.cmos_data[s->hw.cmos_index] = data;
> @@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
>              /* Fetch the current time and update just this field. */
>              s->current_tm = gmtime(get_localtime(d));
>              rtc_copy_date(s);
> -            s->hw.cmos_data[s->hw.cmos_index] = data;
> +            if ( s->hw.cmos_index != RTC_CENTURY )
> +                s->hw.cmos_data[s->hw.cmos_index] = data;
> +            else
> +                s->hw.century = data;
>              rtc_set_time(s);
>          }
>          alarm_timer_update(s);

Don't you need to adjust the tail return of rtc_ioport_write() (below
the context here) to return 0 when s->hw.cmos_index == RTC_CENTURY, so
the set value is also propagated to the DM, and not only the index?

Thanks, Roger.


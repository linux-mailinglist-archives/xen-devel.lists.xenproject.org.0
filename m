Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBhuDf0vEGoaUwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:29:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3305B2196
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316584.1585966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQN7o-0004u6-8A; Fri, 22 May 2026 10:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316584.1585966; Fri, 22 May 2026 10:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQN7o-0004sS-5N; Fri, 22 May 2026 10:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1316584;
 Fri, 22 May 2026 10:29:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wQN7m-0004sK-1L
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:29:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQN7l-00AZea-8U
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:29:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a102feb-2eae-0a2a0a5409dd-0a2a450bbbc0-12
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:29:01 +0200
Received: from [40.93.194.28]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a102feb-212f-0a2a450b0019-285dc21cb658-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:29:00 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH3PR03MB7434.namprd03.prod.outlook.com (2603:10b6:610:1a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:28:56 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:28:56 +0000
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
 b=JseZLmoPjDjO14Z86dCqvLgcXu4w1SNdcd4NVY2ov9XaDftsMXQlkiYtwzsR7c7ZJPJO7P+D26evNe3KbtcKNYHKamZucl8sq2YV0ocoYz6k56eYnCSWT2bOmuFAf7HMoC8T56pTE66yo/AVIDFRHNk0TNRx4gn05rpgvrf7ao3w4zF20kuDUWwHARrcNe44Wgfr94GTUpmCZ34magbOwVUlsoYUiKyErLbK25dQZLt+Wq0hVKHjdjVw81VQ4M3/RSEvmt1fJSCWthj8g7v+fUJJTHOxDyMCKkQhEymqov+bkfGUOv48ohImo6BH0E0h5LxmMoUv4qJEe7uBEjcpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txHzWCjSq5UHHy2rzvHtDkEJ9cKhg3LtUcdRkop9CD4=;
 b=OH+cdcauKaTFDEFA9j+ct9vdDed7UCpwX7NEfekeInPxSyY9CB5PkwQs4m1qs/ydreSgSC/1qOI5ggyZpfgVAuwIwaBL5rZ6y6h6jIJULErsYpXlser+Ta4vCfLlzFpUvaxX/nY35n5GDyf+1XBrfhWWbIsf0Zl7ct2SGGGN5KC7jFQQAMX8TEWEHxjBe8Y2p6pkz25r7Up4FD2gleTFPTRlKC8+z8jdQIekHrEscwBLZ4mRpaFqlOehBPfcwA9aNarEn6Zcy+Z2loVz7G60vl8PynSQARD6ySSnllnaza5mOY71tm8CFOc1w4ZQGt45rWP+OWKpMQb72okIy7Oy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txHzWCjSq5UHHy2rzvHtDkEJ9cKhg3LtUcdRkop9CD4=;
 b=YzT044pq0c5tMqp1HRfyvkFz7mWKcpWJRLaDVgG6H6vcmYAkoVSFDhFqhKbrrvhIAMboLPX/XkQIHCezB6CQcmSOxCOlOWEeWiEdabk7PmDAFJdL3IG6tmHObwFbruzL4TvDQHsCNdBZ2c/JX32oeJ5voBAL4K21fky34cN91Cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 May 2026 12:28:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 3/5] x86/shadow: conditionalize / rename local variables
Message-ID: <ahAv5C155Pd71mtv@macbook.local>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
 <86b0f926-6733-48ca-90d5-5601e7c6f0bb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86b0f926-6733-48ca-90d5-5601e7c6f0bb@suse.com>
X-ClientProxiedBy: MR1P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH3PR03MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea73029-38a5-4498-a20a-08deb7ecede7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WD1BhDzdtwqT01jmSsG5gQCcd1qSb8Ht4WZbIG75dKSCP9fhFd5z3W0gsrXKXedCVKWe0zommWTzsZTp/Sg7GebpHjlBzCGDUP11cnmfuObnM7aGGu/D5/dNoRzY75bCJ0TVT6jCPxCXXuEkiX8V6irwfw2FD9J2HR8jw0XNGVtJRVGgfv+GBtH6PABZqUVFj0yom08KG0mhOwSvviH7tI3QABS+DFbzmENpfikEcSlEe6wpgvO3cUIWrW4u2YrzuyKFvGnshhav/yKs/6h6vh66oP7cXIPQ37/dPP9+tBybhGrqYmIOgTKsSNzSy47CIeVO8Mmnfat3n9DE6FUhRdmTIarrF4jQzbdKf1usPQ3wUZHTrDjTMXTRaObszw4qHjSfvLZiXgSGWiyFzbLgS98h+LYIolK6edchp29KTs32C8GGOSevsnAEgXOK/09sevMqHXNIMxWVpuFigM5wWh+XZ/NLWsqU7ijXlWj7+PVBtXrjvVTyZ/oo5BdqxUz8Fmg43khFcPjn4EOgGFVhg6inT1V2de0DrcqE1JDH7wzZXJ/+3suu1aCy6WPlq02lzgA8rrHsoLCMLoWaIqRdKUGc4vj/tKj76hujIYwFxcWSCSSJOoNS0fbpN+NWZYAeObqJ8IXlDszUHD1QuQTyugHP3ojloFAdjY1CHSKk5KBn7M1iULlvwTzXZja/jgbw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWNYVVljYVBmVXVKc1ovSFF4UDFNemtSUWVaUDV1VUZYVnQ2V3dHaFlzRGFB?=
 =?utf-8?B?UUdFY1FWQy80S3I1TGhhRjh2aUYxNWhjL012YTF2VFpZSXN2RjNnTUoxbloy?=
 =?utf-8?B?NUtvb3JvL2hBQkI5d3VYMUdSUC9wMDFIdjZrVEdoanM1d2F5WE5WWVp5cE5H?=
 =?utf-8?B?RkFsWHdQRkFpY1hZK0t2MWRweXJ5MXdyTFgyUnZKK0U3dUZRTTFlTkNscFNI?=
 =?utf-8?B?MGRYNmttRzRVZGdQQUFlYlc1cXo5dHZrOGdJU1VNeVZ2MnJOamNrNHFIdlZa?=
 =?utf-8?B?Y3F1MXRGUnRocFh6TGxIb3FKT05sTUdGWHRXREtMVHJVbGpHczdsL0V6VnVq?=
 =?utf-8?B?V24wajNFTmdOL0RjQzlBOEdOc0I1bjJYYjBQUlpNRU42ZWFtUUM1RWpuR1E1?=
 =?utf-8?B?SUhhNDVuZUhtZThtem01Z1dNMnpBdEMxclRvZzdsV2VCelcxbUVaYWR4TFhk?=
 =?utf-8?B?MDg3S2dmai9UNXp1bUZDUURrLzgwWUh1Tm1EVUZJaVR1bmx4alJmZXdneG85?=
 =?utf-8?B?a0xLbTcvUWs5TVIvZTlJc0F6MFA0bXE3NExJUDNybHREOXBXZnY1bFJOVkx0?=
 =?utf-8?B?bjNuTDROYnlGd0dydDRBbXREc2lBLzJ1aklabjRxVlI1T0d0WWw3eFA4R2Rq?=
 =?utf-8?B?ZnEvZUluN012QnBHK3RKcGlpN1EzWGhNRDB2SlpMZjFzaU9qMXBHYkhTYXB2?=
 =?utf-8?B?WVRBckQ5QlpxYTB4MytkR3BUN1pBNDIvbW5KanZUWTFlcFNDUkpMaE5lQkZo?=
 =?utf-8?B?V2hvZFMraXQxb1kyS0FSajNTV2MrUzh2cnBIcjdTOFZCYVNuMXpJU3I2aUFG?=
 =?utf-8?B?Mjc5a0N5RDFRc3Ivc29DaHM4MEZpcmx6U3BjVzFpNHpqTEJGTzRsRWN2Q2dv?=
 =?utf-8?B?Z204bnJMZXFzaTFoNWQxU3R2MGVSS3NoL1E4YmJ5RjMxcHJGdU05TVA4V1Zw?=
 =?utf-8?B?MkVSeFZiMTcvcktnNG5tK2NGakZUMUZxeGkwTEM5dFJuZm0xTXlTMFo2M0Rn?=
 =?utf-8?B?VmRMeTkwSGMwZmZrOWU4c3dENkpaZkVwaGFWMSs1eTNpam1Sa2h1RGg3QUUr?=
 =?utf-8?B?cWJ0b1ZNa1A5TjlQdE1vT2d1RWhCV1VkZHQ5NStvMGRXd3pIYWV1R212alJQ?=
 =?utf-8?B?ZWNkdUZyRmNpWHdIYXlFSzJ5ZW5uM0o1aDB0eVVQN2RYRFdJV1JNZFdkalhk?=
 =?utf-8?B?U0NHQzRmL1JXWCtzb1p5WG8vZjUyajlFVjlYVmpVdGoyRlpJMXFCbkx4YnFh?=
 =?utf-8?B?VmNLbGxGKytadDVIdW5YclF0WWhXbklsa1lEbHhUbEEwa0paZTIwSlNXTDNF?=
 =?utf-8?B?dnJodzVNaFBVTDJvY1I1YXRmOENzb3d3V2xqc0ZjaEl4aC9WUEJrL0U1Z0Rx?=
 =?utf-8?B?UkNHZWsrM0ZkYXBMTW9CV2NER052TFJMK0xSSEFUUk9OenJhdncyVE1STmFx?=
 =?utf-8?B?QXdCVEx5bnZCdmhaejhwNFp6bVI2aE5wWUQ4QWxVZHFhMU9tOE5SL0JJSS95?=
 =?utf-8?B?MXZCcFZuUUdYOC9QQjAxNDF0TlhXanBGTFVydWhhNWtSYlMwbU1pTUpZOVRY?=
 =?utf-8?B?a0Y1Z1pRMlNKOVFuMWFLZEdibVFabEhramtwdEVSY24vQXBNNGxwWnovTVJp?=
 =?utf-8?B?NmgrcjNrL25MbEZpWHU1aW1hVU15NmlDM1RGdEtWOXFEK2pyOStsV3RxL2kz?=
 =?utf-8?B?cDc4cDJHMTBoeXFGN3ZlUjZ2SGo1a0NwOFFIT3Vtb1YwSko4VG5iNTlIdHFH?=
 =?utf-8?B?NnZCbENKV2xXOE5xTVh2dGJFcEJaWTY3bzRhbzh0SHJiWEJ4ajdTMDlUT0U0?=
 =?utf-8?B?bjhGWEZIY1ZyOW9rUm8zQUYxL3dycjR2OHBUd3dqNkRtN1NQVktmY21QSGhM?=
 =?utf-8?B?T1RDbXV2aldHU0xVR044cXF3Vk8vV3l3NzFqcTZZVzRPWmI4VEdTTUVHSUVh?=
 =?utf-8?B?QWpvYWRHT3NGOVFzdVJqUkkyTHlPcUVUV0p2SHYxVVM0RjB6YzBmb0tVSTNT?=
 =?utf-8?B?QWdJcHNNZGY1V3k3N1pnUm1BQ21IVjRObmlTdGhhK2VTTkpORXRhNm9rdVNS?=
 =?utf-8?B?NE1MOVRNQUJjRlgrQW8yMFR6UlZUZTVGRTArS0FpVDk1NStHM0RSSm5RclFk?=
 =?utf-8?B?bUp2MDgxL3MxZHJsamU1NjNBRjF1RmxDYjlZRVZRZGR4dHdseitnbkR4RHRo?=
 =?utf-8?B?dTZJY3VEcURnNTBoOVRjZGZBTjZFL3NOaS85S1l0TjlOaGZtRUgrSkJsUHVL?=
 =?utf-8?B?ZXNZZXUraXVQK0QwbW5COHRTZXBBNG1NWDJWRmlRTUNnU3JkamVnSjNKS3lG?=
 =?utf-8?B?akI0MWw5VUFzU1N4TlZVTFpSanRzbm5VNjZOTnlmN015VGROanRLdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea73029-38a5-4498-a20a-08deb7ecede7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:28:56.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yU7aPFQsCmrBv21IlpiiZXUEfuoe7DvWaQoGxchF3I2bfz4ZH7b5Xo9eESv00xVaBMiMnd8K3ZWQC0w4Ddvt6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7434
X-purgate-ID: tlsNG-42698a/1779445741-1B57BF3B-2AD1CF3A/0/0
X-purgate-type: clean
X-purgate-size: 2248
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9C3305B2196
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 01:45:12PM +0200, Jan Beulich wrote:
> ... shadowing a function scope one in one case and the global _end[] in
> another, thus violating Misra C:2012 rule 5.3 ("An identifier declared in
> an inner scope shall not hide an identifier declared in an outer scope").
> No difference in generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -857,13 +857,13 @@ do {
>  /* 64-bit l2: touch all entries except for PAE compat guests. */
>  #define FOREACH_PRESENT_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)      \
>  do {                                                                        \
> -    unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
> +    unsigned int _i, _nr = SHADOW_L2_PAGETABLE_ENTRIES;                     \
>      shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
>      ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
>      if ( is_pv_32bit_domain(_dom) /* implies !paging_mode_external */ &&    \
>           mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
> -        _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
> -    for ( _i = 0; _i < _end; ++_i )                                         \
> +        _nr = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                     \
> +    for ( _i = 0; _i < _nr; ++_i )                                          \
>      {                                                                       \
>          (_sl2e) = _sp + _i;                                                 \
>          if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )               \
> @@ -3349,7 +3349,9 @@ static pagetable_t cf_check sh_update_cr
>  #if SHADOW_PAGING_LEVELS == 3
>          {
>              mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
> +#if GUEST_PAGING_LEVELS != 3
>              unsigned int i;
> +#endif

Hm, that one is nasty, we would better use a different variable name,
but that would be more churn.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D5roCSy6T2p6nQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:11:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B4732AB0
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:11:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=av8HIuss;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358250.1612457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whqOW-0007jw-Ty; Thu, 09 Jul 2026 15:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358250.1612457; Thu, 09 Jul 2026 15:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whqOW-0007hx-QP; Thu, 09 Jul 2026 15:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1358250;
 Thu, 09 Jul 2026 15:10:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whqOV-0007hr-F5
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:10:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whqOU-00CRjr-Rs
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 17:10:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4fb9d9-e002-0a2a0a5209dd-0a2a450cd44a-36
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:10:30 +0200
Received: from [52.101.56.15]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4fb9e3-e897-0a2a450c0019-3465380fd9fa-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:10:30 +0200
Received: from DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) by
 CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 15:10:25 +0000
Received: from DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a]) by DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 15:10:25 +0000
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
 b=pR0De8Uv1iSRu2VYz3UeA8o2UMOPiU7vMwkTgMq+4txZUdl1w9mdL7o3/QAZ5AxBtMbh1+MjPTut9c4yp8tTs9v8StTVAW53PMWfCG7IfNJJHOGYlFc548++a8zTp7ovSdkjmjWSNNrpz3nvVIpVALuFORKlPu6OsnzIeFaoiTKaAwZeQ8zGolTWvTfZX4tL169yF8DDkQI4bdaAVUPFRhcG7HnE/T3pn7RAqo1JwxH+rTq9pdRHB/q9NKNl9Sd4Ee6mjDH18zZselIhHbCwcYwq2GlUNRAWVu/taZx+eBTorifvVPV7RScklJeltoiq2oQzWQ1kSeMYaA6ktRxEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZVzRQtnUTwP8wpKKwYeg5dC+kJgA+KulGGmLGXjpAc=;
 b=NroDSzIj98MG/GIwPOzk672FN4RSqexYEbklB/BhTI7ECXQOTDitcFL4KAgCd9fcQtPqDu9rJL7PD4nDbVLidO8IW7WOH+rcJ/9+7A17AjmlVAmgCtRMVzxYFoU5YjAkuWjime5j8Z+kJJ2o4DUXiz3Lu6AiWR9OKYxzpGbmGQK/UgoBZnAApmv0fxprGwdat60m4pt0twy9pnQCKkV2pvQDSlugUkQiXEApMcZdZq7A6y8qSTs1Ssb3Sth5VPWrujoX3foj6pKXmS7YMiJnpQxvWYLd2lETaIAlohXfcX5vKnLgW5ggZRDpUmh4QRPpJ5nOKfVHKjJbwcQVuVvGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZVzRQtnUTwP8wpKKwYeg5dC+kJgA+KulGGmLGXjpAc=;
 b=av8HIussgLi/Qsxdkckf2e23TdH4Du15510tEDYnW9mO4/sU19OII9hYpNM2+DnN/QCLj7Y2n/rL5rI0VFGbL3WM57oO9h58pOeUtGxxyM4GJ/YZ7haPuil1hu5ISXEe5ix1W857Xfgn4NfzxM6sC15ec1s3uRfNNV94GM6vFAM=
Message-ID: <ef345395-bbfe-48b2-85a5-31b8f43ac746@amd.com>
Date: Thu, 9 Jul 2026 11:10:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] vpci: allow queueing of mapping operations
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <97e3323363ab442ccb21a00d5ed0488b6672870a.1775742115.git.mykyta_poturai@epam.com>
 <aeizOTxvSXlLKGHX@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aeizOTxvSXlLKGHX@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0113.namprd04.prod.outlook.com
 (2603:10b6:610:75::28) To DM4PR12MB6472.namprd12.prod.outlook.com
 (2603:10b6:8:bc::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6472:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dba1d8-c243-48b0-7ce9-08deddcc340d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	2NLHrE3x3e+1OnuP5wq7FPUVKykgcXytBBitcERPl9ElwPMMATQVubinufPKIiX1HwEZezOQPVVA83UeVvGJNTgIzKN2E2vMzS2eBOq+nCr3AC6SVTEGYT30rZojesG6ibkzhlhcRfvld6JwrD4qbZtpPFLz+W8UKxZBJ0TmzWttsmu5hBxAVsXnF4fKCiVkXgwZ7+IW1FHS5jixyWviAdBzbe6bWmEhZipRq5z5vt4leOKy+PQC25IbFD4nOdhtUwyxwbhhVt/ImXUXWOHoUduxW3Y6Wa27Er1g9wLbLF7pRwcxAWRyqkj0LXdmhw6Uv4tMD+ZTWswPNYJzB0LNY1Wssdcm/8TkqbMmvbuN/CgXXOGQ1zMxule1OuZe2//l4DmXjvU2LdNF+9QlwLczi4eUfpoX3tXINXdLPn/fDLkSTK0g+07MxHk/u9y7mP2hBO+UKtzUYn404oyby3g8nwFxlgK27R7tkt0Jf8ExU6fIKnOfGkDPh1fSXk+IcTDiz83nxA1xlsOjlSfPq464gSINgU7eKMx4HVBVxVG8AcUsUwYjkMO56NQTweNkctlr8Y9nCjLdkgcaXbY/xqFJcnk5LAClSIvcozQCeY7zbdgR/qjORE9cGhOkiNsAym4t8Xb8Zez8xTLaySTcyklNd1SCtsBxWV0+hw5h3++ZAg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6472.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXM0amloTTB4Zmk2Q3RMZzEvc00yT1czQWF6ckQvTExoazViUjYvc1EzQUsz?=
 =?utf-8?B?NU9GMXVSVjd2YXU4QnlmM1pEdlQ4RGxVZ1RxdjNneHJZVmFLS3JlVHU2dUYy?=
 =?utf-8?B?RExkcFZRZlQ5RERSbDV6blpUMGp2U2ZRczdISFQrbGVBcXo5RmtOZkRRRHpX?=
 =?utf-8?B?QUE5Y0c3YTBIT1hTbnJuSThnL0xrYWQvQjVKTWt2b1pEZGE5UU1XL3V0MUNI?=
 =?utf-8?B?ZzZ3MUxmcGtyR3ZOY0R1UjV3aFFUdzNqN0E5bmRuTzAzSVhwL002cmVNZ05J?=
 =?utf-8?B?RmpEdEt0NjUvNUlnYVRPTFpwamFXekZtbEF1d01mN2tYU0JZVm80WUYrZ0VX?=
 =?utf-8?B?ZjJZd2tJUDcrWmVRZVNBMjVjb1ZJMHl4RzN0enBTSGtHNDFsMyt4Y2RLRFlN?=
 =?utf-8?B?WktUVWlSd25mK1pGTUg4azV0OEdNWEovWjNyaGFPWk5rK1ErLzRya2M5Lytt?=
 =?utf-8?B?cEZPOEZodWVZa2JqOGxlaXhkUEJSbXVaS1puL0xuVlRtNXBLL09aZis3TENo?=
 =?utf-8?B?a3FaNGFxUWorSkhxZE1CSzA1Yy9NZXlPL1p0ODRKRSs1c3Z5MXA1ZkhpclE5?=
 =?utf-8?B?R05zZCtFUC9kaXBOM2ZqeGdKQ2dWandEc3c1L3ZEaHNsSlBQM01tNyt5bzFN?=
 =?utf-8?B?TDR0aVFic1VWeXluazZnemt0RXRUam1ZQ2svM1pDdG1mWkZOUzBObC9tbTEw?=
 =?utf-8?B?dHppaFJMd0NoQjRGM0Y1OFMvOHZKOU1nMm5JNlFYRVphZmlPam9aMEM1OXhS?=
 =?utf-8?B?N0pMR3JCOVExWDZJaG5xUDZzcjVndThJUzZ5UVg5d3Uzc1Q0S0FscFR0YXJl?=
 =?utf-8?B?Rm5aYktYbmdsL3F2dmc5UEp3NEpsVGlLTlVaSHo1Q3RQN1JxUHArVTZpMFcz?=
 =?utf-8?B?WGJGL01iNUh6UEp2bWZzdWdVTmZtRUgyYTdoSjN4ZHZGcU9vdDlzYW5Eb1JG?=
 =?utf-8?B?Y0xMb0xRYXRGYWFsMjJKUTNvK3VhOFhneUxiUXF3YW95cE51Ry84MUY5WkZl?=
 =?utf-8?B?MGtsQ0JTZ2NwZitBQ0QySW1iSFZoWUo0RFZrU0ZzQzliMEl2ZW40Nzl0TTRD?=
 =?utf-8?B?alhPcWtMdkFmQlJGZUdJajJDUjU4MTZsYWJYTC9XSm9oN3gzeFQ4ZnhUOTdm?=
 =?utf-8?B?bzMrTkhGOU1jb0tqcVNzYkxVV2ZlRktBM1VSbTlrMllkbXk2cDhBdmdJTnFv?=
 =?utf-8?B?aEZCV3grdk1Ea3BnejA0RWF5MENDeWdPeFJPYnpHb2toVXN1Tk10WndOYVRY?=
 =?utf-8?B?NmU3M0tQdWV0dTNtaWtsTGJ1TjN4cTVUNlZDemtTWHZISnVCM0tPVTdyTGRr?=
 =?utf-8?B?Qm5FOWFDVVpSTGQwN0NuWURMdnZ1ek5uaU5nMzhDMENRbDdXRktoSTg2SUJq?=
 =?utf-8?B?Zmp6a2hSN0lBV3M3dUFHN0pDelg5alYvK21ZR1FFb1J1SURpc2lLUDVkT1VM?=
 =?utf-8?B?MjNHa2FrZGd5bnhwQnJML2h4NC9nY2pmamhkZzRjUmdKYkJ1aWJKNm9XYmcz?=
 =?utf-8?B?Rk4vN2tMTFhLNUhUb2ZKNlEwemxzQm13akpxNTJDNFhtTFRPd0g2b3hjZFlQ?=
 =?utf-8?B?R1Fta1lCMmVYaWtpOEdPMXRJYUdMTzIxTkFXaFhCOTRiNGFNRDRmTDhZamM0?=
 =?utf-8?B?VHF6ZUdLbnB1dHpQdFU4TGl0UlhtZ3VCTHVldWJkdVhWbFltNmdpZm1Wc1pz?=
 =?utf-8?B?YkRNR1ZOMm5LcDJSWHlvM1YzdVY3M2VqRlJrVDFNWkV4OUZyekl2WmdpaEU0?=
 =?utf-8?B?a21SQWVhM3MvV2czMEI2L3poSU5kV2dTanJGTWlnWVpReE9LbmpSR3l0ZWJV?=
 =?utf-8?B?bTFGS0xYb0JTQTF6VXdOSWRPVEJlY3ViVEVsazQrRkJ0SGdqdkFmTlMxUkFO?=
 =?utf-8?B?TFh0YVBUZWJxaDBKWnZScnFwVitmYmhZemh6QzdxQW56NkNvTHlnOEw2eGFG?=
 =?utf-8?B?bmZCSjh0VGZPSDFUTzJkWG1Jbk1OWDRVd3ZEL1BqSlJFQ1RKSkJPQ1hOaXRn?=
 =?utf-8?B?czZiaVVpcXFReWFlUGJNaE9IYlFGZTFLOTdZcDBaTS80ZHJYcmpRV0FmbEpE?=
 =?utf-8?B?TnVtWlc0Q1BTVzlPTFZEdmpCYmtxNCtJQjlPNkZGSUZ5ZXZzbytWNGdwYVQw?=
 =?utf-8?B?RHZMYnh0aHFkUkVyWDlZVlAxZXkya0JxeE5lTzlNRk5uR2duRzhZVHc0bmww?=
 =?utf-8?B?UGppekpHcG5reE4zV21JeVR1c1BZekpFem1CbUdOcjIxU1FTczRFSVl4SHNh?=
 =?utf-8?B?ejZHbExRb0xRdHI0MXpOQjJaUmxhem5FVDBUSzBoOWZFSUR0b2lUZVpLUGZK?=
 =?utf-8?B?ZDg5Q2hXK0Zha2RhcWxES1FucUtnSW9Lckx2L3FIcHVmaWlMSE9zZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dba1d8-c243-48b0-7ce9-08deddcc340d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6472.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:10:25.2600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZrgbhaqQCg8M/XrohIE8SUcjlyyOCLeWwEhntCkPkd91eliMvOONVVt6yRIrBZ6AfbmOeU8s3vXN01Ke7aNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710
X-purgate-ID: tlsNG-d25034/1783609830-D75666B2-8F9D28F8/0/0
X-purgate-type: clean
X-purgate-size: 2119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:dkim,amd.com:mid];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 618B4732AB0

On 4/22/26 07:38, Roger Pau Monné wrote:
> On Thu, Apr 09, 2026 at 02:01:33PM +0000, Mykyta Poturai wrote:
>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>> index b55bacbe6e..e34f7abe6d 100644
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -155,14 +154,23 @@ struct vpci {
>>  };
>>  
>>  #ifdef __XEN__
>> -struct vpci_vcpu {
>> +struct vpci_map_task {
>>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
>> -    const struct pci_dev *pdev;
>> -    struct rangeset *mem[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
>> +    struct list_head next;
>> +    struct vpci_bar_map {
>> +        uint64_t addr;
>> +        uint64_t guest_addr;
>> +        struct rangeset *mem;
>> +    } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
> 
> I'm a bit puzzled (possibly missing something), but why are you
> keeping this vpci_bar_map array here?  AFAICT map tasks are allocated
> on-demand after this change (by using {alloc,destroy}_map_task()).


Currently, a single mapping operation encompasses all BARs, so it's less
overhead. This is tied to the way modify_bars() populates and queues a mapping
operation: it iterates over the BARs multiple times before queuing it up. I
could see a point in perhaps allocating a map task per BAR. Indeed, in the next
rev of the BAR-write-with-memory-decoding patch, I'm planning to introduce the
ability to map/unmap a single BAR. If we allocate a map task per BAR, however,
we'd have additional overhead with tracking 'const struct pci_dev *pdev' and
'bool map' per BAR instead of per PCI device, along with refactoring of
modify_bars(). Since mapping only a single BAR is still a rather uncommon corner
case, my first thought is that it's not necessarily worth it to make struct
map_task only hold information for a single BAR. You can see a preview of the
next rev of the BAR-write-with-memory-decoding patch at [1] since I haven't yet
sent it out.

[1] https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/commit/d20f252670dff2d01c4c0c4b815abb2cae07062e


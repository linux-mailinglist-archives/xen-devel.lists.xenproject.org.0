Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QTLrE0dSRmryQgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 13:57:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2C6F722C
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 13:57:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=rBvoFqFM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351721.1608801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfFdW-0005Rs-1H; Thu, 02 Jul 2026 11:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351721.1608801; Thu, 02 Jul 2026 11:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfFdV-0005PC-UZ; Thu, 02 Jul 2026 11:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1351721;
 Thu, 02 Jul 2026 11:31:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wfFdU-0005P6-UE
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:31:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfFdU-00DlGH-8Y
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 13:31:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a464c04-5cb7-0a2a0a5109dd-0a2a450c952e-0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 13:31:16 +0200
Received: from [40.93.195.24]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a464c02-f399-0a2a450c0019-285dc3185f3d-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 13:31:15 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by PH0PR03MB5733.namprd03.prod.outlook.com (2603:10b6:510:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 11:31:13 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 11:31:12 +0000
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
 b=cR+hwX//0ZOHqcU9FxeggPNm/9QgLNOY6NqAy8f/yeOrqfIA5G4aATUR0nvDfwgVns0nyCCW/MGyd5nN1oyFKnwXkCVyzObR/74yetuK3OLypJR5iuIdCyghXZoRhDyBopvQ1BttJwnagzc2mfvRqiRYn27OfJLF46Ko9PMghDfpl9yxVJoTA60izKU9e7p8SNTFQFp3R1unSK6KxEv/L0nY3wdpmSsEe5WAN/j7j3zYFsAR+aOMYt6dTY8uvG08syieiYqYI48suF4+M47J1aInYxz8kvjYzBvQBqafCzFLJ1c5snwd6VemnvR0YfHUObeoYa4x6bVmfIFDjsFbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YE7qMEO+fWBMM1cuUzNhk18IMwC2N4Gohux8+fi7Ys=;
 b=TFF4YC6d883VYfDP5Mu5iz5pF2NKmQ8GfGhsmG07EGSA0zBtViL4rvxrT0cF5K2TBUYgh5YHizSb42EdGH8HhwETh/IOm4DjBoP2UlzFYm0+R2p7nMRsMBHBFFOqQROM3BGMQkaeSZQz5oTmSVxYjCGdLkI8KgPA07ljJoZqeF5lFPx9b/00ZBQjOlUS90T3uycMlHyt8ak9DX0iirReDaQevMgHhEBLfJPWyLAAT1lC57v1WtF7l99J04FSZRFpJYip5s8DH/1n7erBy8UXF+6+RxtMDGhpzy95uitO4IuBbNdiFeqcOyKb0+R5PgXjzSFH0fC8axLd0/vYJKZUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YE7qMEO+fWBMM1cuUzNhk18IMwC2N4Gohux8+fi7Ys=;
 b=rBvoFqFMesccSP/e/t02WT92LKeyiX9C0Z6GoOZVN7cnb31YeIY3KrZM08BKsW3sUj5WIcem+MgrxJzIOVZILbIyMNSbVbwxCQl7motyeRtfXkkqsO2ExQDpyWw7Ie4OLoxkGY6fmIp+jzlq8iQIcu2yQAMjDglug6yRhqWdjlg=
Message-ID: <6065311f-15b3-403e-b39c-f9652f0513ff@citrix.com>
Date: Thu, 2 Jul 2026 12:31:09 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/4] x86/HVM: don't (almost) open-code POP_GPRS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
 <a89951cb-43c0-45bd-aba1-273cd053deae@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a89951cb-43c0-45bd-aba1-273cd053deae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|PH0PR03MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db6a722-3f9c-40e7-1646-08ded82d6bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cJ21bNoD3ZljtzXm7GbDIMe8AFBoLAWJwt1WeSypYz/WJwI+QiAE+Fud0iL8BdINRb94tFkQ8dZZTXXgkujhaxem80aflYu5x28LTqJzqo/6962Lay1RTGSReNEzSkThvb7OW2I2VtW/sirskEbL2DtRJciQdvOlCV29xDdvxO9dm7iCMKUTTySGAMGoVeWzPuxfiEoX6hKi4s43uuNl/J+sgqRiTf1tgfY3TxGB0t0VVDYYISO5SEF0JawFx/alrzpTJYv1iiThdVhqYUws9q6HNr5lOzmpOroS3vxV+IBlDAHdYn/Q9oIG1RYXj318vRO5B+GHSAUUBVEMxzeyHJMjcU8dgxQkFzRsBwVZih9etqkxEo0JUvDwTtwjARUkH9xb9JdQa21FUi5R60IuJGkoFlKxeNJvTFVV2UAFKF66kiNwiozo9qhjwjeFiQey+YGfBXud7FY0ohWeVaBT7ymiL3ZE+bl5XuYiJIdYni7G4uueU/0f1felwnyENA8emNazb3FGS8wuWLb8+ELb1EEnDmmGNTHyBCbSYTFAs8imJbQdFds486c2SAYvvay6rCuvvv8VINXg4Tig1/0qeDWbVLtT/sU/Tj8Qx99/XuDl5q85XtTmM7VDoqpGjKP6E7hyztWJVtlebVxFx7qUOSoN5vJbxsjkXThF9Tdv/Sc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cS92S3d4YWZqUWdsQmdiZTRZSDZtR0VzdTh5eVZ1Rk5tUmxIb1FKUkFxSTZS?=
 =?utf-8?B?bGExcUs4Tlc1bEZmSzAyV2dvaExkU2JzTEhWeDI4WkliSXNqaVlqenBUVm1T?=
 =?utf-8?B?SVRsVmUrSnMvNDlITStEWDE0U2xsSEgwTC9NcG1QR2N0UjRqZ2d5ZFhVZnZX?=
 =?utf-8?B?NGdSMkF3VUpac2RrME8xMUVvWDBPSUF6em52aEZzbDUvZEFBVE54Z0x2b05i?=
 =?utf-8?B?SEczcDNMVEd6U1FLTHE3RzF0cDk4UVRDU200L0l6MkRsNHlSMlRVVDFER1ha?=
 =?utf-8?B?Q0lMZTFuWmN5R005Y1BVakk3UENpcnJQaFlGS3lLbFQ0d0MyNmRXR2IrZTlJ?=
 =?utf-8?B?K2tCbmo1UHZvVExkdDlWUVR5cjBlZ0NoaGxoWmdUd1E2S25QS1Q0eEhZSE5u?=
 =?utf-8?B?d1BXeU9nYkp4SVVHbWJ1RGhZKzM0dFNGdmU4VCtacWlRMGo2bEx1MXA2My92?=
 =?utf-8?B?NWoydUFpZ1hNaW90ckVpL3ZSa1J2UWNKM1ZEN3RsV3d1WG9ESE51RnlmcUND?=
 =?utf-8?B?RlpmYjZEWElhQVlwdXdaQjZTYWtBZTZMU0pTTmZ6WWlGZitIc0UrOTJZNXZz?=
 =?utf-8?B?cktBaGVFQWt4b3NsVkg3NjcwRVJ4Rm43ZzM2Vm5VZEdMTWJRUTNLWFdJRnQy?=
 =?utf-8?B?REFocUtWSkcrdW9xWVNqaHBhRUVINkxEamdXc1pnb1htdUdQUmIrMHdRZ3J1?=
 =?utf-8?B?WDEwZ0E2ZHFEVnRqOHp3UVpxRUdmOWo0OHJkMElQMlFiVG1yNlMzR3F1eEIw?=
 =?utf-8?B?cmdQM3NUMnNSWko5RTZRUDB6THpnVU1PYjFDdXhTQ1Z1aUUvdWRMUDFYRjVq?=
 =?utf-8?B?TFQyS1RmdklMNnZOUHN6alFVRXRyR2hBOTdEV1RqWGtHWlVkRWRQeWU1elVL?=
 =?utf-8?B?ZzJ0aW1lUTY2aS9xTFlEa3BxR0ZRcEd0QmhHMUYrZEcxQnlPNGFaMmhCZXBh?=
 =?utf-8?B?VTRGV1pNVWc2WSsrNVhVRWtJNFRRRENDSndyc2ZQYTc4cXEzM21aVTQ4M1B4?=
 =?utf-8?B?VGFsRDJSZ0FObVN5TzdRakczS3pIVWZoOUV1anRidTZFajVicHFVQXJ0TDBW?=
 =?utf-8?B?aTBxYjY2QW9ybXRDUDZYQUx2SEo4Y1d3SWZOT2RxWm1oVFZKa3IweEZzZXkx?=
 =?utf-8?B?QmpDa1hYNnU3djBmekhXZExKbjlEM1RjNGp3VThmVGo0Wk12b2Y5cWlqMG1x?=
 =?utf-8?B?MVFyNXIvVFhkZllZRGRGWWVSOCtIMjJFSGkyTjRaTlNMSG42M1lqdW92WGJG?=
 =?utf-8?B?L0Vhemd5Q0g4eWQ1eFBUYndocnVuQU9GR0FvMm1yaFVqQVQ3dEo4anVCOHdP?=
 =?utf-8?B?bXExYTlkM2ZzMHU2UlFRMk1kT084TlpGYkg0NGYwUVZZNEVLa3RPaks4T0Q2?=
 =?utf-8?B?ZUx6RkJFSGowMUQrYTA1ci93MU9UNlljNXE2aHJ2a3hyZkY2RFlDSWhzbVM2?=
 =?utf-8?B?VnRCTFNIeklHSkIyNFdYcm5COXBocVpYbDhUd2lVckFibEU0ZC9OYXJqL1ND?=
 =?utf-8?B?QWhxN3Ntb2p5dkMrVFhLN2tyS3Ryd2NwZEROeVVneXZRQUtYb2ZhRmc4aGJJ?=
 =?utf-8?B?L1BIM2ZkZUxyQ3l4VlRSc0JPSkt3MmZvUUZTSDZiWDRKbEloRlpmdUJlbENL?=
 =?utf-8?B?RlJDRUQ2Mk9iMEVJNkVWYkV1VGRhdDV4MCtLbmVBaThvUmxPckt2Ym9uZE9C?=
 =?utf-8?B?YldSejlwRE5FQWM5TE1LN2wyTXpibGMvRDdqQzA1ck5JOEk4NWw5R1p3eUlN?=
 =?utf-8?B?NnVHZ0JtVHkyL1piSEcwaDNxYmJKZENYbmNEK1FrYStSMVFWd0tWek1GSmFv?=
 =?utf-8?B?UU1HV28vc0pKUng1S2NuQ1VwSEJ0Qi9rUUxiK0t6VHM4bjRBcVd6RHpxZi9i?=
 =?utf-8?B?clpPS0phVzhVREVBd2xzSm1ub0hDOFhzNURuc0M0WkdlNlBLdExQUUdMWE56?=
 =?utf-8?B?Zmg3bjNRb1Rxa081QStwTndJTk1IK1VjMys0Ly8xSXpxSkp5SjVNS2UrWmRX?=
 =?utf-8?B?ZVFqZVA1ak4yMjcwclRWNE83SUhDT0FFeXRMS3kvVENUMVNETk45eFBzMUkr?=
 =?utf-8?B?cE5EeXF1blBSTXJUUC81cmJEZ296T1lJbzJwT0pnOE9Xczg4YWlpWUhibkNt?=
 =?utf-8?B?WkhlVTh2bUIrVWk4Tkh0MzNncXJOQ3lobmM2OUJUT0tFd2phMXA3clpZSUpL?=
 =?utf-8?B?YnE2Q01MNVRnRTRwUE9GVVZtVzlLT3U2ZTdMd3k3V2dSYU1aWUUvWmN1WVBR?=
 =?utf-8?B?TFhMY3RyUnRzQWZscWQ4L3dwVldUemhVVHZ0a2dVZ1Q4ejR1emNoV25ILytI?=
 =?utf-8?B?L1Vya2sxSVREa3lhQXVNcms3Z0NOK2c3VUpQVzFBWjZCU0UxOVRKZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db6a722-3f9c-40e7-1646-08ded82d6bae
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 11:31:12.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gsd8KiC+nsmi+4XLL501rdvXkEqe6pSHj9jBx6gxGlz6RG3eIvfeQVv5hC8aIaoCBel5584GAa3oDQijLaYsp/xlaVm1oDMWCWsQupPLslU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5733
X-purgate-ID: tlsNG-d25034/1782991876-0EB3DD51-5EC61805/0/0
X-purgate-type: clean
X-purgate-size: 733
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFD2C6F722C

On 02/07/2026 11:55 am, Jan Beulich wrote:
> It can be used as-is for VMX. For SVM the special treatment of %rax needs
> accounting for.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is the minimum required as a prereq to the next patch (to avoid the
> need for custom adjustments in the two places). We could go further and
> switch to using PUSH_AND_CLEAR_GPRS at the same time.

I've got several part-series that result in purging SAVE_ALL/RESTORE_ALL.

If you want to put this patch in, then Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com> but I firmly want to finish my series before
patch 2 adds yet-more complexity to macros which I'm wanting to remove
for being too complicated already.


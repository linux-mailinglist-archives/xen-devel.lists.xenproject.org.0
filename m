Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB50CF35E3
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 12:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195334.1513300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcjAz-0001oh-DN; Mon, 05 Jan 2026 11:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195334.1513300; Mon, 05 Jan 2026 11:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcjAz-0001lp-AK; Mon, 05 Jan 2026 11:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1195334;
 Mon, 05 Jan 2026 11:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcjAx-0001lV-RS
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 11:55:07 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f6d2f90-ea2d-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 12:55:05 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8448.namprd03.prod.outlook.com (2603:10b6:8:322::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:55:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:55:02 +0000
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
X-Inumbo-ID: 5f6d2f90-ea2d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuOwOtsuXPQERFjah0FRlEEfqUE1ulQiyKGNuAEiqPMRe25McDtZ1DwFFAwyeRVDKbl8jQAmnmrKrRG0W6kvpWpjp0Jr5LFb+LIWZvh1Z9lWbAci0bBpTWJKqsTk6fDuw/xeosFx0CoJf5F4vTJYvzcMKQolLZWs9EAaYQfhKc8OaYWp5Ce+k5dLZtK8CEhxz8QeiDhzCceZuPE02sXADZR78Nklh4CWaOvMl3MIwHu7JfJlZCRr7tHo1xdVrPqcCvT41z7pIMNMA+YlGjIbMLkve8UHTgAvIc5doKO7ZwsjbW98RE/mTXIDDeFCt4njLz1apcHIiArm4RB2ELEVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVSzjmRxUNtkuc29qu1eezjpn/C8hcGzXlOoQvcPSXg=;
 b=LBUeNDLDkMw6dC6jX/jQRufHij8E6EPv4xx/6SbseFOwNOHEea7pXBIU4kGYmgLLMe8qiUICe0pOEsYkk32vkzIFqvqUO0Pt8uLuUi4PWMVMf66/j0mIoqEFvGXJkcyelwqmg0gYbOZThBE/jSRCRGtd0bx4bm7eNNHoQisR8TtRFf/jzMeHeQp8ibU27PTzBKIMtK2penGKOakFhVwDWzDm3PbXlv6KwtjVYgaBrSBb/w4CCAKQue0q8ZHPtumPOEJxFbzBaSsbMm0cLs152WEqhuk3+DndUoE4La1F6tAHPfPa3OXMF/JzrMoZEznZCmI0RT6VV7lLj7m2avHl/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVSzjmRxUNtkuc29qu1eezjpn/C8hcGzXlOoQvcPSXg=;
 b=K21apxCnnuhWwlbwUEQ2RFQBo5xnZRlxs42FZ4SIjhA8llYIomrICczgCwcPwu04gzzl8MGq9N7mkPlpJzerLtHoLc/IT5NYRi/mcOjxOBdwoc1m9/FpOzHswVZUwS0kBE2339ZkpYaNdlAwpq4i4bDtHa/SaZ9wKNSKEz5fYjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cc95886d-1ca9-4780-9438-d9be8317de80@citrix.com>
Date: Mon, 5 Jan 2026 11:54:58 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] xen: rework deviation to address varargs MISRA
 violations
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
 <24aefd91-18ef-4ac2-a1b2-6098aa31e716@citrix.com>
 <6a0d6249997997a1b152d860932f68bc@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6a0d6249997997a1b152d860932f68bc@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0128.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c552305-5478-438f-4e46-08de4c514245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnROK3ptalFMNTBuNHBmZXlOOUZjOTNuUDhBdUJmaGJEbzVNKzg5MlFrSFNa?=
 =?utf-8?B?UnVzNVdtSk9jODFIcXNsUXE2MFFxWW5VZDhVbjQrVFpoOEkrN0NyMlQ4SzI1?=
 =?utf-8?B?eDhhSW1oT2hFVFZEWk8wTkhoQjdaYmU0aFVlenJaUHRTWU4xMURvMjYyMU1N?=
 =?utf-8?B?aUx0Wm9IQURlaGQ3OXdVUFZkMEt2YnR3L2pKaElaTUVydURLSWwrc1NMeVJa?=
 =?utf-8?B?YXBKUFhISjlRWEtlQ2RPR0p2ZlBzV2FjQ3hYU1hrNzVWM1BRdXlEWmhQd2Ro?=
 =?utf-8?B?N1R1b3VIdjcvSkNTSEFHR1MzMjFYbzlmZi8ySnJEeUZzL3l0ZmQvZ2xvQi9s?=
 =?utf-8?B?cmVYaUNrWjNCcmpwYTlYd01zZGljbjR0aFg0ci9qZXYyNWt6M3ZKWmt4RXh1?=
 =?utf-8?B?ZW1ua1R4eVlSQ1Zhb2I3NDVvUFFoc3Fxb0hxdlBKd3RMRjVBTTJOd2N5SnJo?=
 =?utf-8?B?NmFQRCthSDNXRTdndnpEUk12Q2NvTWlkZnZjMkRrNFRYOHRFZjhoalNlblJ0?=
 =?utf-8?B?QU5EdmtKYUNjYXRhK2JCL1hUS0pBcWRVUEZCSzVIc1p1aFlJVm1tRmNhRzFM?=
 =?utf-8?B?UmtRZXRueHozZkZYYUZwWmFpUSt0VnkwRTFqTE91SEhTT1ZwY25pdVVHRzJY?=
 =?utf-8?B?RGRTY1NVSlJLd2YzUEROMmZPMzhYaXRla1ZhQVNJL3p1M1pia2p3a0R6OElz?=
 =?utf-8?B?S1pub1hGRFZWOFJaTHJGYXVJc1U0ZTFGcnprV0dHcXdJWUFqWG52dHUxb2xM?=
 =?utf-8?B?SVB4bDlNSkJhYnZjSTNYTTRyZ2lVQkFNaTVTSmxDUVROdTk4QW1JWWd6ejVT?=
 =?utf-8?B?YStSQlNzc2IrZ29WeHlzTHRzalF5UlhsM2d0OFhkcUtaTEhrbkhRY0pJQ3hG?=
 =?utf-8?B?RGJrbW5pOURBUWV1a05IR3gzS1lUdDg3amVmT3o0Z3JtUmllRk1MNUc2YWxG?=
 =?utf-8?B?blZwUVJrd3lBOTNxdTloZXMrNU4yaUN3QmxpWGZSOXRjSCsvbFhpSTdNc1dP?=
 =?utf-8?B?WE9vRk1PK2lZSndiUUZMaCs4eEh4d25jdnRsdUYvTWxFWE1tdmpkNEFrNE92?=
 =?utf-8?B?YURuU1U0VytncmRnK3ZERnowZXRLMWYxdmllQkxQeHoyLzhMSFYyV3ltNVEv?=
 =?utf-8?B?U1dHL25zRXg1eG9UbXdDdGpjYXZLR2xxMDc0TkQ4aGYxM0liTFdBUWEvSTFR?=
 =?utf-8?B?QlFwLytFTktuYzRhcVBmUHM2bEV1cmt6eWo1bDc5VTdYd25YQVJMVHVMWFRW?=
 =?utf-8?B?NEFaMkJ6Y3daZW1sZWk4ckZhS3dMNnR3bUNkNTZ5ZVRuTXVRK2U1TnlLdWcr?=
 =?utf-8?B?WElaaFZnQlVqRWlGMWtqL1I0eXZRcUZpS2EvOVRKZXVXejRxQyszTGNNb3dF?=
 =?utf-8?B?T0RqcFUrNGxOZzJIYVY0K3QxWThua1c3SE82L0pvL3QvVGh4NEZNTXhXQVNE?=
 =?utf-8?B?MUszNlBqTXpOTXlNcTBLSm0vV29HSTN5L0VSMmNzSEhPSXM3QWlEeGhucGdr?=
 =?utf-8?B?c0VtekxYY1g2MFd3Y0FtSFFXWEF6c21WZDZXd3Q5aEZEOW14NXNxM1ZuY1l2?=
 =?utf-8?B?TGJ0Kzl2UGw0bTJsK1NvUXRFR090OGVKalhxMFR6LzIxenl4ZlI3TU9vUCtG?=
 =?utf-8?B?aTNPcWVBODFpYU9GY1UyeXdnZ2pqby82WXhvcVNFRUlPbzhhN3hpbExPYjBL?=
 =?utf-8?B?YTVOZlZRMDJyUUM2a0hJaXNSeitoRzROSktlbUFoRFlnV0hxTFl4bGhpSWVy?=
 =?utf-8?B?Q0QrYmt6RDN5QVFEem1CSGxQYy9JWFhWRytOVkNhUlZIMjJYM3p3b1M0UzNl?=
 =?utf-8?B?Ly9Ja056RDhoR0MrMnFpb01BdWJOWVJhMEVaUytUenk1Mys5Q1liREpqVTdq?=
 =?utf-8?B?aU05eTNJc0tZOG82TzFFYi8vc0hoc3h0ZXF6TGtwWUNvT3J0K2VjaTE3bnph?=
 =?utf-8?Q?+CVcbqS5T5b+i3gN9tToVTP9qO76UjmV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RklkaEcxMW8xVmk4Tm9rWFR6MnNnN0ZoOVZLcUYwTytmYTh4RW9jNVBLM3o3?=
 =?utf-8?B?MlRYd0t6NVFIWVR1OW5nZ1lXb1BkSmtVZld4T1ZuRHpVUi9rVUJxWlNNcEJT?=
 =?utf-8?B?ZEIxbjNTbUI5NGdDb016dFpTRGhDeHg5a2JZTG1QVkN6bFF3cENYMkM1THM3?=
 =?utf-8?B?U29wUmdCeGV3cVZXL1ZkRVJ1WVdKa0RubVNNOUdzaVVyRW1RR1NmR0RzaHh3?=
 =?utf-8?B?RnlVV0tQUzZFcEY1d3VKVERPYWNuWjhxNGo0VHVSYUV1WHNoNkRJa2ZpVXEx?=
 =?utf-8?B?V0o4dGpweWh5ZlFUd3kvbG5hS2VBTldGRThvc280S0g0THJtK3oxaHhEaVNX?=
 =?utf-8?B?dVQwNUFFclg5cklTMzh2SEpPUjI0bWZYOWFiSVpuU21tbVlEZDNLK0dkVFIz?=
 =?utf-8?B?cFJWUENtcmlpcTZhb2NpbnJjaWtKc0gxdXhHd3BZTkQ3OWxGVENPeFNRSTJn?=
 =?utf-8?B?TTZCSW91YXRXTTdpS0NVQS83aU9jbDJUK09CQ3N0VUVpZ1pJbzVXQlVwNUZH?=
 =?utf-8?B?ck9UMU5MLzdmTDRIWlI4U0xWSlZjUC9ETXdiTDVPc1YvaUszdzZMWlZya0wx?=
 =?utf-8?B?dU1VSXNGenpzcnVaVWFGeU16TnM5V1g5OWZkSWVwN25Fbk9KZHNvd0NiRmFQ?=
 =?utf-8?B?RkZkTmZDcWtyUmYvRXp3Mm5uNGI5Smc5YWJ0N3NFSDBUT1VtbjlDZjkydlFy?=
 =?utf-8?B?VnpkZzRVMlZEbWdRam1SVE5QTDdDYVczUlE4SmtzbDU5S1VnV1lFZTBqMklw?=
 =?utf-8?B?Q2hMcy96UFh5TDdmZmMxdEJPa3pBdGU2elpMd09qV0wyN2tsSWNSN202WnJ0?=
 =?utf-8?B?ZXowMDJ0KzBmck8rbzdENTRxRWdsOG1OMTBreC9WUnlPU0EvRkwzVEFjR0Jr?=
 =?utf-8?B?OGhrS0pWaUUrazVDbmIvZzV5T2trNDdEU1kzdjBUZzdiMlJISHdsSmdOWVJz?=
 =?utf-8?B?czB0Y2czWWNOSEZ3MUZtTUF3YnZYRCtJUzduVUhLN1J3VnJZRnlHVjdac0ZT?=
 =?utf-8?B?eEwzcDFSc1d0S05KTndNdlo1MnNvRlhodUxlb1ZhRGxUcFgzUVBWOFlqMnc3?=
 =?utf-8?B?SjV6MnFOSWoybmFWc0VNb0RLSDNCZnpMZ2U5WmJKdFJzOVFBeGpSZU14cjYz?=
 =?utf-8?B?VTc0OThmd21EWENUa2V4OUVkbDlvT1NCUTBhc3R3N29lNW9oRTdiSGJPM3BI?=
 =?utf-8?B?MXRITVBJWFVDZnJqUFlnZFRjbzB3NzJMMDYxZ3lMaGJqNktQOXZLSmxDWmR6?=
 =?utf-8?B?N1ZGTUJaU09LeDZQYXNnTmloZGN3b0lINWo1TnFERXNpdWtNU3F2VUNWZ05q?=
 =?utf-8?B?QWR4dUhKcncvdTdkSVpnOUpvMTlBK3NKVThJc001b0N1SGMzNEdhV0lJeGZq?=
 =?utf-8?B?c3JrUHNJeDRuTHExSEVqdGdsQTZ0TG5BNzZJaXpEc1dkNlFBZnRUWDZ5Qkdn?=
 =?utf-8?B?OFB3dkZQNld4QlMwQjNZMXlxanFSYU5YYXZBZ3dQL1ZmUENRWWxPN3MxdU5n?=
 =?utf-8?B?czJjZ3JWTG81WTdHcG5ZanFDN2s4UVNucjJ5WFpEMytRQUMvY1ZLRWdCd1FK?=
 =?utf-8?B?b2dVengxd2kvYnJqa09SWGI0SDArU1NpaGRpbGF1Vy9aY21SejFMUmt1dVRv?=
 =?utf-8?B?VUNiSjJTUGNYOEFiQ3B2R1hhNlREWDVlQ3ZUV2RSb3JRQ2ZETy9zSXNqOHJX?=
 =?utf-8?B?dVJIQzlNclhJL1UyZ0pjZWJKbzhrQjFsaUovSGxzVGwva2txTEorL1pkOUxS?=
 =?utf-8?B?OVpXZk1Qb2dPYnlsb2NoRTRWN083Q3pUbVdKWTFGdTNUd29aVHpnYkpJWmM4?=
 =?utf-8?B?dW04Yzk4MzJucGxRSjdKOGtyWEtQNndSdVp4S0tiaEllaFgyQnFnQ1dVck5Z?=
 =?utf-8?B?QXpJMktWUytnZ3l3ZDVzZlNkOFNLV3Uxdks1ODRRRlltVGdyanBaL1VSL1kr?=
 =?utf-8?B?NzZSTk93emtHYWc2TW9iRWhTVXo1TjJhNHVIMXdkM3ZxNUw3K3Y4Uk83VUE1?=
 =?utf-8?B?SUY4WXZrU2hDdmJ5VTE0WEdkRXo2cUhBM05wa1hTNEZKY3phelZLYnRIb0pQ?=
 =?utf-8?B?bzFFTllDUVhwTXFKKzVENU9WbElDKzB5ZDdqcWFFdXZkUjk5QUJhK0k1aEY4?=
 =?utf-8?B?ampsUitlL2FOYm1YY3lsa2UyK1QzQVB4cVA1OEsvQzhobEU2dkpackQvTGFF?=
 =?utf-8?B?RFcrMWlvMHdBSlY0R1ptTmJtUXd2b0lTVk53cTNLd09QNS9QK3VFZk92cXI1?=
 =?utf-8?B?NkQ0Y0p0TlN0dW1DZmtldVVsSHVzSWV4THpBMDRVUzN1T2VYdktGUjlTUW1j?=
 =?utf-8?B?TW94UWZSc3JzblNxaDYvNkFBT1ZwcW9FT1NUWFJaUnRRcU9sNTdPUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c552305-5478-438f-4e46-08de4c514245
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:55:02.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shvYJl3Wyf+aqb06gQWUwFPd96JdNz3bN/SsDui4OXNMtjHT0kFn77p5jPRNpzfspQiXbZLb6vdI3QWzuQbfk2DRNMITDQrQgIihuCMipoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8448

On 02/01/2026 11:53 am, Nicola Vetrini wrote:
> On 2026-01-02 10:42, Andrew Cooper wrote:
>> On 31/12/2025 11:22 am, Nicola Vetrini wrote:
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 219ba6993b90..7dee4a488d45 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -570,13 +570,11 @@ safe."
>>>  # Series 17.
>>>  #
>>>
>>> --doc_begin="printf()-like functions are allowed to use the variadic
>>> features provided by stdarg.h."
>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
>>>
>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
>>>
>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>>>
>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>>>
>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
>>>
>>> --config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>>> +-doc_begin="printf()-like or scanf()-like functions are allowed to
>>> use the variadic features provided by stdarg.h,
>>> +provided that they are declared using the `format' attribute."
>>> +-decl_selector+={format_attr, "property(format)"}
>>> +-config=MC3A2.R17.1,reports+={deliberate,
>>> "any_area(^.*va_list.*$&&context(ancestor_or_self(format_attr)))"}
>>> +-config=MC3A2.R17.1,macros+={deliberate , "^va_(arg|start|copy|end)$"}
>>>  -doc_end
>>>
>>>  -doc_begin="Not using the return value of a function does not
>>> endanger safety if it coincides with an actual argument."
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index b3431ef24e26..584907b048ec 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -570,8 +570,8 @@ Deviations related to MISRA C:2012 Rules:
>>>       - Tagged as `deliberate` for ECLAIR.
>>>
>>>     * - R17.1
>>> -     - printf()-like functions  are allowed to use the variadic
>>> features provided
>>> -       by `stdarg.h`.
>>> +     - printf()-like or scanf()-like functions are allowed to use
>>> the variadic
>>> +       features provided by `stdarg.h`.
>>>       - Tagged as `deliberate` for ECLAIR.
>>
>> Much nicer.  But don't we want to repeat the part about
>> __attribute__((format(...))) here?  After all, that is the justification
>> of why it's safer than nothing.
>>
>
> Ok, that would be more accurate for sure. I didn't do that to preserve
> the original intention of the deviation, but they are practically
> equivalent with the current codebase, so changing the text makes
> little difference. I'll tweak that.

I can adjust on commit, if you're happy?  Everything else is fine AFAICT.

In fact, this fixes the x86_64-allcode complaint for
vmcoreinfo_append_str() which is already annotated, and
debugtrace_printk() too (not yet enabled in *-allcode).

~Andrew


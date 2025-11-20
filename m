Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C351C74007
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:39:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167265.1493619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3wY-00076D-A0; Thu, 20 Nov 2025 12:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167265.1493619; Thu, 20 Nov 2025 12:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3wY-00074k-7I; Thu, 20 Nov 2025 12:39:22 +0000
Received: by outflank-mailman (input) for mailman id 1167265;
 Thu, 20 Nov 2025 12:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM3wX-00074e-MC
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:39:21 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eefc0577-c60d-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 13:39:20 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7425.namprd03.prod.outlook.com (2603:10b6:a03:55d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 12:39:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:39:16 +0000
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
X-Inumbo-ID: eefc0577-c60d-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UK/zYpupBo8fFLv+gq4trKNDEr8ZiSF+BQhq6zn3n9N707a3sXQesTjM+OL0G1caW6YjhNyCateK2LR/1+YA9PgymmFd1v7ZyJvlZZ1FhDrKGO+jfK3h220ifQCpOOCBOXIBQgFFShejhE9CKX7LK8KfbGmpVwkdzLaHT9Nc/oRRQxh1vYT/JGt1WKOSDDqdhnvk5poM3lLrMOXls+gK+xUCHcAFD09od9ha++FoLvIpmSX/KOnLsa5ujB45Aj7bRI4FuhB8/LlxyaNbHEv2VscbGjZRBhDcfnjxLHLuf6n59asK8SEGEEJa1EkIY3ZlDft1oxO0tpvTEV+l+lCbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdLwMcnhlrjFVcov0EOJ9YlhH98/3pPHZO9quUEfe1Q=;
 b=LMQBjeLyfkFHjJc80p7UWFPnaX7Pz3BveReKst+BrO6jDyweU7h4FvE/tkNgOT303Ct5Q7pI1/Ayw7cNfEuHCk5BS8es29E/ArfULfylN8T0XBea0Y6ZaFS1LFKmsQNNQMoK9yMCYekUA6Q4MAk/MCUR8HKwk3FW945CPUrW0bouWJKJLls2MC0OkZ5GdlCcTTY09t+ENC3I9Zmq+ltNmG7/TzVb3XzNXMdMCtDPP2kMV2Piqwfu44zTnVdOIJHZ0OzpNPesoTFH1Mg7Y3hvITp8AEKZKEwsmUDrbnUshuQVkAHF5ubScrcVElzl4It5hqL2AlkjJi/LxfDIrfdT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdLwMcnhlrjFVcov0EOJ9YlhH98/3pPHZO9quUEfe1Q=;
 b=WQito1LEY5EkJ4LQBGuJuQZf2xLfpG+77MEJfy39GxRe5alD4CofBpOyTz8DJPBtBOZsVHygueBa2G3W0F0bz1cQV380LdcOnb3QxIaqilq+/xtUdHkmiHqeU/yTCdhklqNquekM2odiPqBStzWlZw20uqI5nXE4Y1KU12qRxKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <01830e1a-9e6e-428e-b6b0-0360d5519d43@citrix.com>
Date: Thu, 20 Nov 2025 12:39:14 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/vPMU: don't statically reserve the interrupt
 vector
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <06f2081b-64e0-47f5-b66a-26363979cfdb@suse.com>
 <f491eb9c-7822-4637-95a3-bcd994b20dea@citrix.com>
 <bde84a94-77af-4fec-9075-a709323abdc4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bde84a94-77af-4fec-9075-a709323abdc4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: aa93a1f6-c542-4824-39b9-08de2831d190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlVZc2M4cFF2UnN5NWJYeWh2eXpIQmx2VTRJUW5rK01ieXJoa1RWZ0xhVDk4?=
 =?utf-8?B?NTM5VzFqWTNqa0lQK2daWFdsS1BnZThEaTlnamp4WEVYVlB0bTZ0cVRwODNq?=
 =?utf-8?B?aGkxMVVGM1g0bHFPV1p2OVRLY2FlUzcwb3FqdkZieXcvbzJtcXdnQ0d3UDVJ?=
 =?utf-8?B?NDFFSUxlUGxTbm5lQTU3ZjdRY1pBZ0RsNk92bE5QdkYwRElsNVk2NDJ1MEwv?=
 =?utf-8?B?c2JVWFIzUC93NzczVTg2cWpJZFgrZlpZRkx1dUhJRVJndVQ2R2hrRjBKY2o0?=
 =?utf-8?B?aE9uTElsaFErdWZIUnhIK050Q2xNbGowc2hJWUd4VnA2Q0NVS0dMQ1J5VXFl?=
 =?utf-8?B?TTVOWU16QlBYRmxWbnlKRzEyS0ZjMkw1dGxKR1pnc0FFU3lBOXlSRm5CODJz?=
 =?utf-8?B?Rm9OTTJqeGFuWFZNZkM0cVdnekE3bFl2K3U5ZGVDYVVtT3RkREl3UE9jWjF6?=
 =?utf-8?B?a1lOSDdmVDBLMjgwaFlndkMzYmpYWDNlRFViQkNJUWhTdHpMNGpUN0xNYmlO?=
 =?utf-8?B?b1ZTVWxaSjl1Z1hGY1FocCtWdERNNk03VkwzSXpvMHp2NXFmSVJqUE40VVJv?=
 =?utf-8?B?cXFPd1lmSUtKNTF6T1g1MmNYTk5mWDdlbmw2Tmpaci9LTS9zODBRbENtVHBD?=
 =?utf-8?B?N2dYRElHZU0yaVhmUDhIVXpYQmJyelFhb0xEanUzM1p4NEI3N0NwWDBtR3Q2?=
 =?utf-8?B?NlFYNDlBb2lNb3BVRXFrY3VYTmZQc1VMbGduMnYzWmZMWkw4WEkrLzY5dDRP?=
 =?utf-8?B?MXBWTUNOTE4rNitISVNrajIzMnh4Tmd3Y0hFcEtOcjdmTUhkUXFaQ1JsRFpC?=
 =?utf-8?B?Q285SEhSaTVBazhzMEV3Q0QvVFA4Y1RQUlg4VGJlMnllTkNQandPUzNnUC9p?=
 =?utf-8?B?VisxL2I0UERMUVNValhJR0pnZVB4cStmR1k2QlpRWlJjRE5aZldPYnNnRWV5?=
 =?utf-8?B?UEhZT0wxSEdSNHN0ZWtLMVFQTkpkTndXL3RXUGNUdVlVclRVblBEY3ZsU1dz?=
 =?utf-8?B?ejZ1Y2w0enN0aGJsMlpuaTk4TjBjK3pMVmpkQXQ5SUtJUmNBVlI1dnFxTlhB?=
 =?utf-8?B?dytJcUp1UG0rdko4MkROaXdibUllRHVKNTM3SmdtcWNhMVp0emRoQ0ZYRE5z?=
 =?utf-8?B?SWgwVmttZXRPSWRUK1JSSzRSa1YybFd0Q3dTazc3NFdZOHNXWWNvM0duT0hx?=
 =?utf-8?B?amxYcSsyajltdmRKTTQwWWE5WjdvVE1QV3JWODJQKzBCNVdTek1YSFhYL25u?=
 =?utf-8?B?emtMcWd3UWQ4M3lITWRRQ2J0ZFhYcnltSXFHemY0MkRGQURVb0N2YmM4UFY4?=
 =?utf-8?B?RStKQVdKSDd2dTcyeFJwczNPOWJudUtXNW1TT094ejliRVQvNm1IZ0tZVHZH?=
 =?utf-8?B?NkZjdlEzb055TDh2TEdOZmdYdHBJV3o4clhJNmtQSUo4N0F0N3JjTnBCTDVp?=
 =?utf-8?B?eWxnL3RhSllFcXFIeWczdllSNlJwdE14YlVJQnBibTJKOC9iaUpYK1VXQmJT?=
 =?utf-8?B?K1UrYW9nTDRVTVVOd0pvTkRKMUxGSkFtU0ZNM3NkZE9MbzJhS20wTUJOaHJh?=
 =?utf-8?B?NnZxc3FtOGJUZEcweXpGVXExb29jSFpTNjkrSnBMQ0UrQ3cyaUUvR2VMVUFB?=
 =?utf-8?B?NG9Hc2cvQlZUMy9JdjNqbDJyT2pGd092Rm5CQTVuZGRrWDhQU1IyOUViTTlF?=
 =?utf-8?B?eUJ6blFDVWdZU21hYkxJSFRGdFZyZHlBSEYzVHVLOTFaKzVQem1OT1RZcjFF?=
 =?utf-8?B?dFl2TXRHdUszL1VPZms1TCtISVZqSG1VMWFJNC83anV5NFhNbjdKMTZSSnZH?=
 =?utf-8?B?c0xTMWNqeVlSaUNCcS9YR1QyOEhCcmk4S3IrdGxxYTRnSlg1M28wZTdEVnZi?=
 =?utf-8?B?djQ5b3dwLzJIUnpvL2N2TFRPVFJYaEhZbHdIaTYySXZMNzBXaUxMR244THkw?=
 =?utf-8?Q?rCsjiqd20hIeaWvMQy6SuC7Q5ZHgQ0eV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFRDMlBnaGxBd0RjWmRTamZRdTg3cU1ETVp6elZpQTkvdU1wM1dxbEtrSnM3?=
 =?utf-8?B?Z0djMG1UcVBNb2JaSm83elk1alZ4ck9QYmNVQVRrVzNldnhTMlFhcENZc2hG?=
 =?utf-8?B?MzBRcVd3aXpuYkRXK3RwdCtpV0toSzlQdFdJSFNNVFB1aHhNZFNkNEJ1bXBQ?=
 =?utf-8?B?b3F3cnU3bDg1ZWxWQ1Y4OVNnQ2xvSTFZRGtjb1IrbndPTXVmZXR1Y0Q0Vi84?=
 =?utf-8?B?bmNYaS83SVpuOE80MjJ1eHB2MHZZNGNzYkVtaDBqU0EwZ0s2NERGV1B0WGFz?=
 =?utf-8?B?NHdueURGMnJySUs0ajgwY3E0NGlzaWp4VzVmekJja1BGMkVDek9jZVhaNDU5?=
 =?utf-8?B?MGl5Nno0bEY2aHFmaWRLKzhNMkJ2dTY4dGx1aWNCODNBOHRXbWFCN1hXU2Er?=
 =?utf-8?B?RHBJZ3M2ejVseFFvckxaZStqWDI0Qjhvd3JTMlQ0MWUycGZuTzlVUFR2NjhE?=
 =?utf-8?B?TmJURERhZWRXb05BcFc0VG4yRXhDbG1JRTdvZ1RWZG0yR05leEdaQmYxbW85?=
 =?utf-8?B?RDd4YTRhVWZiSlJsSWpueHcwVGh1Qk1PNzY3TTVoVFgwbWRDTnhiYittOGlV?=
 =?utf-8?B?TmFWYkFZRzFBcW04dzM0Z3RqRGZIb0VkclA2azlWckxTVnVsRExtNVhqNmVQ?=
 =?utf-8?B?TkJEN1pmYUhUZHRpMGJoUzdxNGRWUktCVGFaaElMUnRoa0p0ZGtxUWx2TEhP?=
 =?utf-8?B?Y2prcE9oRHh6TUp3My9XZ3cxWTFlaGl1ai9tMGZ1QThRU25WQXA1Umsvb24w?=
 =?utf-8?B?WVpTdmVhZUlrWUZ2cWNBeDhPY2I4UkpkUmd3UkNwSENERjQ2THVMYkpWQkdO?=
 =?utf-8?B?dUZoWXkwQ0ptSHF4aERJL1NxLzducDZpTG9CZzladTFMWm5FNmIzMWdMNWI0?=
 =?utf-8?B?SDhCVFo0SVpxRThiRGtrVndvZlBTRGY3bjdlSDZ4WGg1cGt2SEczc3MvdzQ4?=
 =?utf-8?B?WjVoQkNPazNLS2RXTTA5UTJ0SUNIdUlIbWl6b2lpbkJwNGUxUGVIeklCVWdr?=
 =?utf-8?B?OE41MktRU0ZBSXo4b3Rvakl2MXlGTjdsVTYzZlI2dVRicDRzamFpbE4wTXNx?=
 =?utf-8?B?UG8vU3lCTzB4VWlPSG05bWRrS2IxSkM3bXE1MDlxemw3Vmo5SzZhVzR5emlX?=
 =?utf-8?B?V1JJRVJBMjU5d0tMM0VzNTRFTks1U25hZDdUSW1DZ3M3M09lQmkvNHhCOWFh?=
 =?utf-8?B?VE83ckROeWZucUxwYXJObS9OUEZyMjR6MG9lSmRuYWhjVmkxd1ZZTjB5T05F?=
 =?utf-8?B?WjFJQkJURjljTkpJYmlRKzdzT1pWa2g1M1dqemdDdUt3T0ZNVGxnbXpYNjBt?=
 =?utf-8?B?dGZhdnhFZEtDMitURHdEMUFDYnRkelZ0L2k3U0x5S1NpYlROR0RnQVc5WWkx?=
 =?utf-8?B?Q1ZnY0wvRW4zNG1QOUc4S3Jac1hJRlFjMExLczBZLytMdnRyNGdCVG9BNzNr?=
 =?utf-8?B?VzZkTUplcHJRTWRyVHBVQzhFZ2RqOERwRGxxc2VxN2VEdXM5Q1hkaEhjMXZF?=
 =?utf-8?B?Q1h1WVdGeW5WQ1FGNGhEQjlhM214em1SdExnSFN4T242MnZZZUxBY2xmeC90?=
 =?utf-8?B?RFEzNDZPQnRqVnZGZ3cvdmk1dU5BYkhnMlJKbUNjWG0yZUpUWS9XSkdBUDNo?=
 =?utf-8?B?d2llMW90RWtmd3F3T0ZnMDd3ODVnZzNiVU83dEhyTlQxczNyYVBtT2dqZXdS?=
 =?utf-8?B?bVRRalBraWFtUW1jSHA5QUh6a0MxOGREdFYvZVVnbHhtemRRc3E1eEovdnJS?=
 =?utf-8?B?SDduMTc3R2VVaFN4d0E1QkdjTGw4UjJOMVRHaytUbCtDc0puRVd6TkR4eXNu?=
 =?utf-8?B?ekljMG41TExsQzBwSTQwcHBGL1l2M3c2WjJZc0JaczM3WTF1bDVaU0F4NS9m?=
 =?utf-8?B?dmJGRjFFLzdmcHVOV1VtbllVYWZwN3ozVEtKaDBSNjJZMXNOOEFiLzBRT0dT?=
 =?utf-8?B?ZDhGQXgyM2R5YVVQNCtFTTBNQjZ6MUNlS1lxQzlPalZVRVRzN1FvSldyMDY4?=
 =?utf-8?B?ZU1FOEErTWFiZExkSVBTNG1lVzIreXRndUMyYlQ4VkxJMFVxd0lQVUNNZDJM?=
 =?utf-8?B?azNHUEhiVHMrWnJQdDlnR1EzS2tyTVJOSjMyZDZzZXYwalMyRWowdVZjZjJz?=
 =?utf-8?B?WC9GOFZDVVE1eHNWcVJ3T1QyQit5amdEZ3EwTEJIa2VWcnRyL0ltK2VmQ2Jw?=
 =?utf-8?B?S0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa93a1f6-c542-4824-39b9-08de2831d190
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:39:16.9222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9C1vkmUOgdZ+w+L/KHUe7YtS602z/JR0Ym6sLp6pY4IibLFk/ahcnUsY9FTlzW7/cx9W46sCWzd/QtsFxOq2/WD0AVnTovWLSqLR/RC6/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7425

On 20/11/2025 12:31 pm, Jan Beulich wrote:
> On 20.11.2025 13:24, Andrew Cooper wrote:
>> On 19/11/2025 10:51 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/apic.c
>>> +++ b/xen/arch/x86/apic.c
>>> @@ -1313,16 +1313,6 @@ static void cf_check error_interrupt(voi
>>>             entries[3], entries[2], entries[1], entries[0]);
>>>  }
>>>  
>>> -/*
>>> - * This interrupt handles performance counters interrupt
>>> - */
>>> -
>>> -static void cf_check pmu_interrupt(void)
>>> -{
>>> -    ack_APIC_irq();
>>> -    vpmu_do_interrupt();
>>> -}
>>> -
>> I know you're only moving this, but it's likely-buggy before and after. 
>> ack_APIC_irq() needs to be last, and Xen's habit for acking early is why
>> we have reentrancy problems.
> I was wondering, but was vaguely (but apparently wrongly) remembering that
> the PMU interrupt is self-disabling (i.e. requires re-enabling before it
> can fire again). Should have checked vpmu_do_interrupt() a little more
> closely, where from the various plain "return" it's pretty clear that isn't
> the case.

It can be configured to be self-disabling. 
IA32_DEBUGCTL.Freeze_PerfMon_On_PMI, and variations on this theme
depending on the arch perfmon revision.

I'm not aware of AMD having a similar capability.

>
>> I think there wants to be a patch ahead of this one swapping the order
>> so the ack is at the end, so that this patch can retain that property
>> when merging the functions.
>>
>> Or, if you're absolutely certain it doesn't need backporting as a
>> bugfix, then merging into this patch is probably ok as long as it's
>> called out clearly in the commit message.
> No, I'll make this a separate, prereq patch.

Ok, and with this rebased on top, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XKl7J37fL2oxIQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:18:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07686685AB5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:18:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=wlIxjlj4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338145.1599155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5KU-0006vh-P5; Mon, 15 Jun 2026 11:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338145.1599155; Mon, 15 Jun 2026 11:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5KU-0006sy-ME; Mon, 15 Jun 2026 11:18:10 +0000
Received: by outflank-mailman (input) for mailman id 1338145;
 Mon, 15 Jun 2026 11:18:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wZ5KT-0006ss-P9
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:18:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ5KT-00HBO0-2N
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 13:18:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a2fdf5c-5cb7-0a2a0a5109dd-0a2a450bae82-46
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:18:09 +0200
Received: from [52.101.46.62]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a2fdf6f-212f-0a2a450b0019-34652e3eff7b-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:18:08 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by IA1PR03MB8090.namprd03.prod.outlook.com (2603:10b6:208:594::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 11:18:04 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 11:18:04 +0000
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
 b=UaKxBQykhkyQYhd08juX/7L8o3AHd9XZ1H+kryouNoNU3ZLAlQa/GK+KCKq5P7VPD6C14QR/YzGJsh3uZkzCh/n5V34RRs+ODur0cjOUeGwsOmRH88zapkhPPP0Eex1DzpYfqFBSqmL3dxnxGAHp2RM2KO/qjvemdIxyuJTQcrfpw+1CGFYiTd2UxXhWa+icYCsmcG97EPB0IiS+89wX94ly9S/VCsranKnIW//e0O4nEUq2qeEfcGR0Tvcda/fQhLqY84EKeidWw+7PUGegmVFDBuxjZNF71wWp28TlHMgSCl0n/kG2Clxu+avuU6KN+g/7utYPfEqip3o0cBQsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKnKsblZOtUHkaeMEgVjkBmhyXkauCACqHhYTwaQB90=;
 b=HT/HKypfmJZGfQ42rvSdyvSj4/wT3c+iDiG3SlMCunF+bwbJfFmwj9iH1UVkb0hSM9bHmVI/hz8udHp2S41jflSyrTGUpJL4lRmv0ETicuvsy0en9gx5WewCOJypz+yDVjju/YjB2XDzuhd1dpkEw4N0GIeOOUyusAX5WtKFebabmSg9liF5N54ce0zcxMFxw83RZVy0BADV5TEmEfhr3CT6Jzc7SxgV1W0LZPE3lo34TcryrvLf0tWnOudKtDCiJSZYKTlM0Fke9iceaGTJ2ZoYSJtW2e8YvXFGOsdgCj+F9/SChGr4VmDQhZLoCqJNN+cJMgu7b2VJfLgRCTH2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKnKsblZOtUHkaeMEgVjkBmhyXkauCACqHhYTwaQB90=;
 b=wlIxjlj488IQlBkH9rOL2TSF2mQ+OmW1GJzTooJBm2HODpMPhrjfDRU64SUVn5jBx8HPERt1b8Xajj+kzzr7QKARblkcMp61v1OfS9VOaW0FwrKMvx5BfntCNA1z7Uuzm7HxNqxgtJOl1UQ35jgH/YTMrkf74YfDW2bo98cBVQ8=
Message-ID: <683a3df4-21c7-434e-96c8-934631673795@citrix.com>
Date: Mon, 15 Jun 2026 12:17:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] domctl: Avoid taking domctl lock for certain ops
 used during migration
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <3034d82a-f1ae-4c6c-a293-ca44b7e086fc@suse.com>
 <552cac1b-2be9-481d-a687-01c965ade221@citrix.com>
 <a32680d6-e321-4c97-b53d-71d7041e1c0e@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <a32680d6-e321-4c97-b53d-71d7041e1c0e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0689.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::14) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|IA1PR03MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: d0855c8e-9583-4783-096f-08decacfc51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QVGVEWHOvZiV7zJ4PF3LJ3OfhJq3OQf2fMN+LAn32ejut1FhW5M793G/BNHivFq6MY/rGtkgqvnek4DnnK3ZjFCzsBXWgVbdEMqXn0G39vbx30GSfKHWGC4sIbkZbkVjTad8gIKVihhvbK3FB+xTfGmCwqOHtxRHdBR5lGrLseLAwO2dpTbbuOaPkqqugk1kMiJ/cKBMZbkic1frtkxNrnZGy7eFzCkIWKa4WoSScd9ObDTXbv3VDinnuk5Ll2lfpqWidd3P3KMKapMDUEKSuvc6LIcb1Wi5rklmyY4/aNGAdLUnrmBwQA7WP7KzKT0nDdcxZ0CVDxoRVJYzCS1Dw3tMreC7Zf03+nVSi63oD+gw0VW+Wzl+haBAoY/6LvOKJpCr+HPfkTKdCpt8Is7gfuOp7ZZrnLIUXrA25IqTMOwdaV3uy9Uzx8o9Bigyb1QVqqMKSidjq7QWqlZL5tcbbyQHM8/exO4gMdeOi6OWdtRYS+YFRL2hXvr85KqN2GThJGRlZk58MUgBgtcQl83mxQz5zbCQaUdaNj/sqmoy0DL/HW9cGWeN3LSvHodkmeRGKQsNRqlYFGKRHWY9WfZjcv6R+T4Dd480qvWGgRcEBWtH3cceTGxn0lwkD2zhHpp2VbcwQ5h6Ns48j1LTkPkv7qp8SaK1Owb2vxa8+OQ1VZu61Jui82VnQ9sMh5+lo8ww
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nnh5eTR0NXo2NXZRZm5CNWZHS0FiUTdJYUkvSG5WNHBnYWpaRkVFaWNpWldu?=
 =?utf-8?B?dS8rdlJhYTBLRE9TNHNvNjAvbDJzd2VTRE5ITzRxNnMreVQwdDlWVTZpRUtI?=
 =?utf-8?B?UTZMbUlUWHVoSnRWcnUvRFZQRnIxUGo1WGZRTU8wQldGZ3M4KzVkNWp3U2JN?=
 =?utf-8?B?SWUxN3k2c0QwbjNIVFlyemlCZDUvR0NMUmIySkcvUlU4RzNqekFzdEpJMWky?=
 =?utf-8?B?MW1la2pQQU0rM2R3anZkaEFERmJjYVZlaHlsQmYwcE5zV3laS1gwbGpQck1L?=
 =?utf-8?B?YTdTa0xMQS9WS2NYWWRMNGVMWlBOeC9xaEwrMWRWYkprVXdkSGVkR0hkQm5R?=
 =?utf-8?B?Y3g4eVBVWVlCS3lhODQ4b3I3RHp0RnRRMzVtbE1xUnNRWW5MQkFJdm1Xb0w5?=
 =?utf-8?B?eU84c09rL0NwRWVlNFZpWXd4bTBpei96SEZ3VXdNZ1Z3WVJYcHYrbWg4dG1i?=
 =?utf-8?B?dys3M3ZFdFRMdEZuWlg1WUNiQjFCRnNNMytGRzArMjIxU3d0RFVyWlREMEdM?=
 =?utf-8?B?cDd3N1daYW5BMXZFWjRpYjNSblBKcVNkRVllbmpuNUFLYnExYVJlOGxUU0Ur?=
 =?utf-8?B?c2hWTVp6eGRLNFl0YW5zbXJ0bi8rU3F3ejg4c1pPTkRRN3RiZ04wbDdnSmEw?=
 =?utf-8?B?dmdpZUUxd1lUQnVuR2RHa0xWOExIbjdBOXQ3bUpQMk96L0crZHFkU3NHbEdp?=
 =?utf-8?B?UXVkSUFidzh4TkpVWHNGK1pHZzRERE1Kc21hV3YrUUtITll0ME54d00vbEVH?=
 =?utf-8?B?azMwdHpzbHM4amE5emJoWGlxUUFrd1FOOGpMRW0yNjRFUW9xOHlGTHVQcm5V?=
 =?utf-8?B?TTA2c2h4a2JoZ1BYY3ZsbHJuejZ2T1VEYU5vL3RFSUp4U2ZQUStacVpMMVhX?=
 =?utf-8?B?aWpRbGU2dWdXVXNrZ094cHB3TmtwamNKUU5PMlpRZ0gxL1AzYXlLRkhZZ3pt?=
 =?utf-8?B?VTQ3UTh2Y3dZc3dXenMzbFczOSs1UWl5V3FkNEF6cUE0eDRGV2QwTnZQOTll?=
 =?utf-8?B?SHhReElwQmlwRmUwalVzWXV0eTJqNmpoODNBcXNWNTZqYVJKSVc3TWlicXJT?=
 =?utf-8?B?UGl3UTdrYkx4S3hSa2VWQkd3VnZCMG94dG5CRVBZUURzYmRtWStMeGtOVFRR?=
 =?utf-8?B?czl6akZ5RGo3RFY3NUVQUUtyT1JPZzFJc1pSVEErLzRCVm51c1NLb0FIUGcy?=
 =?utf-8?B?THZsaS9qOWJHTDBydkFhOG01cGJTdTd1bXdDdEk0OWlCSUZTdFkvMVV5VlpT?=
 =?utf-8?B?THIxSGxkNlhhOTh0Mlo0Vy9RLzRkL0xvNllKZHk2S3RPSml2QjJrT2I5alFy?=
 =?utf-8?B?ZUlPcmI1dUxvcDhPUk1jNU9KTEZtc2RiN3ZnbUNicEkvVk15eW9ZWUpBM2lF?=
 =?utf-8?B?QURIRVhaTVlOQmF6ZjVxZFFzTWREdGdhc1RKQVcrZ2l1Y0ZlaGFvSkE4dmhS?=
 =?utf-8?B?V0R6WlQyRmZNclVya0tRZS9mTEtFb3g3UzlpamNvSCtaR2JXeStHSEpNaXJj?=
 =?utf-8?B?R294UUdOL3doSXBUOEtZTGdaSzV4bG9xU3RYREFoOEgvODhxcWg4cmpWaUY3?=
 =?utf-8?B?b0Nwd1NobzdLakdqdmg0Q2svVTN2TTZSVkdmWWtSYUJIV3FYa1J1UUpNcmIv?=
 =?utf-8?B?eldYd0F4ZW0vSVk0M1pSd3lDeHM3T0o1ell0RGhodWFYcTIrZnowWHpXb1NN?=
 =?utf-8?B?c21peWNrZjJ4alZndFhiOS9Hb0RhUnlRVzVDM2djSUtaOWxKMnZJbzFKbjI1?=
 =?utf-8?B?U3FMRjZJNFhuSE9WNkRWd2pXOHZYY1JKS0tZMGJWZ1BmYzIwUG1ad2ZGZGNR?=
 =?utf-8?B?d29BcjI1Vk1pT2MrcGhvOHQ2OUNoYmRpREZtU3JheVBoUmpRSGlCelVoUGNY?=
 =?utf-8?B?Zm9admViK1QxQnFnVnVCQ0RORTRvcjU1OFYxWEtOQ2J4TzJKZ3JYV1Y2ekwx?=
 =?utf-8?B?cW56Q3p6eEJZOFlVWndiK2hzRVdXdFMwTVhCUjNCZVRaQThBWDA4RTVFU293?=
 =?utf-8?B?TU9WNHNLc2tKNlZSL2c1dlFNb0hzR1djRW5xKytEN0ZXejdmWUdNejdwcFF2?=
 =?utf-8?B?ekVKOGdEcTlocFRFR0dkZDlTMVZBZVdqa0tuZU8vQnhNUXVQazRuVVJjS1Ra?=
 =?utf-8?B?YlpHSE5PdXlmQXFYTlpoYldLZmFXWTJVY0J4bEtyQTFISi9YQXZTVEIvdFhj?=
 =?utf-8?B?a3pEWlFWMGlOK0Q1L1J5aFR1WnBYQ0ZuUjZPc2pUdVRWQm03VCtlUjJ0cnVO?=
 =?utf-8?B?ZGIxZXVPZGFIbGdiVkFPdW04NGczdmFaUWZZdVJ2UGRRZzV2U0pUWEoxZjBk?=
 =?utf-8?B?L2VLQ3k1SmpJK2I1bXRXa0ZEcW4vR1dKQ05VV1ZYSlZHU1E4T2VxVTNrQmdR?=
 =?utf-8?Q?4GOflOe35No8+bMM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0855c8e-9583-4783-096f-08decacfc51a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 11:18:04.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuPZWr/R2aj7o+djWCB/eYK2J1x/ZM+tOboDUwCWJCdBRNSYk1udaxrsbQoZLLpySykgAYh7ipFcAOjMw8fkHluFpnmyPOiMPuIMtXwk7wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8090
X-purgate-ID: tlsNG-42698a/1781522289-18961F3B-2E610E22/0/0
X-purgate-type: clean
X-purgate-size: 1335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07686685AB5

On 6/11/26 5:06 PM, Jan Beulich wrote:
> On 11.06.2026 18:02, Ross Lagerwall wrote:
>> On 6/11/26 3:55 PM, Jan Beulich wrote:
>>> On 09.06.2026 17:15, Ross Lagerwall wrote:
>>>> When performing multiple migrations in parallel, the domctl lock may
>>>> become extremely contended:
>>>>
>>>> * Operations like "xl vcpu-list" were observed to take in excess of 20s
>>>>     to execute.
>>>
>>> Does "xl vcpu-list" involve ...
>>>
>>>> * The "clean" shadow op may pause the domain, restart with a
>>>>     continuation and then become blocked on the domctl lock, causing VM
>>>>     downtime in excess of 20 seconds.
>>>>
>>>> These issues can be fixed by not holding the domctl for the frequently
>>>> called operations during migration.
>>>>
>>>> Thanks
>>>>
>>>> Ross Lagerwall (2):
>>>>     domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock
>>>
>>> ... XEN_DOMCTL_getpageframeinfo3?
>>>
>>
>> No, but "xl vcpu-list" takes the domctl lock
> 
> If this is still the case after XSA-492, then maybe the follow-ups I have
> pending to post will eliminate (or at least reduce) this. I don't think
> that's 4.22 material, though.

Yes, AFAICT "xl vcpu-list" calls XEN_DOMCTL_getvcpuinfo and
XEN_DOMCTL_getvcpuaffinity for each domain and both of these still take
the domctl lock.

Ross


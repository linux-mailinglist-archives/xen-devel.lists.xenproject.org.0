Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0601C97D30
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 15:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175737.1500353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ4kW-0001C3-G5; Mon, 01 Dec 2025 14:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175737.1500353; Mon, 01 Dec 2025 14:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ4kW-0001AO-CI; Mon, 01 Dec 2025 14:19:32 +0000
Received: by outflank-mailman (input) for mailman id 1175737;
 Mon, 01 Dec 2025 14:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9V=6H=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQ4kU-0001AI-Sz
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 14:19:31 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb9698b2-cec0-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 15:19:23 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB8453.namprd03.prod.outlook.com (2603:10b6:208:540::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:19:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:19:20 +0000
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
X-Inumbo-ID: bb9698b2-cec0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHmxpafdaO7y5d2mmVNdCTqpS0Cf4dUO+7XZNUZRtgoO+qfqjYRGOMYuobRAATTDS2X8na/19CFRDgMEUKETtyu+NRQnslCNuavynondVItqN4Ty9yO1U7cLtoU9tPTwq7hPv7Gyk1tmP4dmXssWptIpmjj6zWaN+uzVzaIlDBkfXnpHvlV7k1mht/aQfBkQs/4MHRgxI9GtRq6DOo15mPaPHYuZpo3pTkxGcHtlQ5VqOi3Ier7DUzpwhai/SKt3WoaqDBIAGuPShKqc5qJRDVsmaGXDe1c9pTOudNt9LsUuVzyigdZzH9cjML/flncPsXmyfgcL215DTSlJm+rRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrPiG4g47fZrVfZHKt1No8nMNfrWSmlFY2AjhxLv/EQ=;
 b=dbnJaWYJY0YdZm+Fp2FgvetRZdMJcsNSVlYe5b5QbENybCJqwVs53V9JhBVMi0U4tIBRxp/jbfwi9I9AdO3kwAgWjHtSdweBjeicxUmsR4/6KqNeeDt3Cq0ISI0XlKdCMpLxf4sSAHxRtlad18WCZkyt6rUemUjRH/x7mH/3GEbbc69DD9pBkgfWl1AzdWmYSSnCBDY8HlT71LfO+twnEXL0T14p0hZsPyPE8J4ATledq9veHDxk+PfsmGz8t5xA23XeR+RPm42XIX6GFkuLKKlBG5RxUZzqG1MYr1XlqSlATT3cyQEzkpUc6WdbGo574Ajt5gtazHJr3pz1l0OEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrPiG4g47fZrVfZHKt1No8nMNfrWSmlFY2AjhxLv/EQ=;
 b=pokK4gBoYiefr6a5ky9Hm8YZnQnKtBpY7Vu3W2ys2JHkoq8CpjPh2fI6QfcuclLkSs9XZMbbfj/FOZRRQ5HzT5mrEtj93bUtlCfITBaPeV2HUdTtgpw/WuhKCYaEf0GSPZrrXZNuOy66HYm+Syr5/9dwtFF/rOaONvhRKzsYJiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <040dbfeb-fe2f-4b5f-9495-799a22876d4a@citrix.com>
Date: Mon, 1 Dec 2025 14:19:16 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Krystian Hebel <krystian.hebel@3mdeb.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/lib: Introduce SHA-1
To: Jan Beulich <jbeulich@suse.com>
References: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
 <20251128184757.1243678-3-andrew.cooper3@citrix.com>
 <bb4ca936-da10-46f2-bf9c-055e19990d82@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bb4ca936-da10-46f2-bf9c-055e19990d82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0226.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: adf5be1f-c613-42bf-a5c1-08de30e49e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1RLMytFVDMrcnVMcHdVTEZlUTA4SjBRVkZDVHoxbjREVFBTUHZWQ1llWjZ6?=
 =?utf-8?B?TUtZMzBjYk9rL0lRbUVzbGdCU05WTGx6OXNEV0Q2TDJqNVU5TVdVZUx6bWth?=
 =?utf-8?B?dndWL3hhKzVkRld0Y3IwLzA0dWJIaUhWYzczcE03eWtPWTR3bDJVNW9TSWJo?=
 =?utf-8?B?VVBZY1E1aWhFNFgwRGdFbWtzSGxSRGNFRGFIL3V5UUNwWXlzM200WjlzK092?=
 =?utf-8?B?aExMZ2QranBOeGJsZFU5bzJJN2ZQSFlSMjR1Q2JKQzlqenkrUW9od016cjZp?=
 =?utf-8?B?RkhNbjZVNS9TUUs1MDlodGl0ZFYwOXVENFl1RTNNb28xKzBuYXQ1T2xnRXhU?=
 =?utf-8?B?MFVsaFF0RWI1cW02SFFHcisrQlNJanM0eGJzNHZvUW9vcmV6QUlZQmFQNGpZ?=
 =?utf-8?B?TTRqM2ZkTElObHBGWlB5R1E0WFpvNHVRUzVqWTkrNmdUTFZ3dkVRS3VGaWFM?=
 =?utf-8?B?VW9OTlBRY3ppMG9rTUZVVTk2cURPME9KYVczZVkvNytkVm9qSE1XZXBjbk1D?=
 =?utf-8?B?TkhZbTdYRGkvMlcvWmhUODhqY1V0SWc0UDNVRVF5RGJQRG1GR1Z3MWNPWExC?=
 =?utf-8?B?ZkRvSGhrZS9hRmd2RTJjaXlPdlVSeDR1Y0RnM04yME9zZXpCQ3hiRVdKby9P?=
 =?utf-8?B?UnJqeWgrV0orQXI1NVFZOTlPMk5SYUdzbGZGS1JacW9xU0NsT0U0L3U2N0Ux?=
 =?utf-8?B?QVI1SE11OUZ0TkR6SEdlTTIxQVB6OXc0eUF2cDZTTGUwaVlRTE1kUzRlTTRa?=
 =?utf-8?B?TmQzMVJCYjJaVjJWZHYwRUZEb003NUwwR0xMOWdDTXFrUVkrZ3ViSlFYWXZw?=
 =?utf-8?B?Y3I0aFZpcmVhcFl3Vi9leDBsWUZTMmtYVkxmTnpiVHV4TmNRbDkrMEMwUEZl?=
 =?utf-8?B?QmVEWS9Td2Rtcm9ZQVg2MzZGWHMzZEc3dCtxKzI1M3RCWEZPSCtpR21NVXdF?=
 =?utf-8?B?S2pxZnd5RVQzQlR0YTRCS0RhMi9vYy9TTVluNjZaTSt1S1FzMmRwcjduZlBH?=
 =?utf-8?B?eWkwUnpSOTROVklJZ0IvRlRMRTNES3A1QWgyYTduYmN3Y3gvNVBMcytPa2wx?=
 =?utf-8?B?SkNSMFVtSzlvMFl5MnpyYnRjMDJQa1R1dUc0Q1cwR05mRFpUajJKRHIza2pm?=
 =?utf-8?B?MUFDN1lQUDlEc3lJZm51Rk5TTTdDZjJ6bWlCWHBHVlNEc1Y5VGd0VjZGbGtO?=
 =?utf-8?B?ZjhrUlRsMWdLMWtnVFoxT2ZjMjQrem1CeUs0aDhaR1JLaTdDbStUYVA0WDhG?=
 =?utf-8?B?MXBlaUVBM1F2NXpmVFd6ektsV3FlVXdzWWppVXY5OUNNa1pyWkFDS3pwTzNo?=
 =?utf-8?B?ZlQxc2xUZVRaeGVibVlwZEE0Yk1zS3lxTGppU1Axc3ord3ZFYmdJaUZyQmhh?=
 =?utf-8?B?andmMnRKRFR1a0ZkOS9RemM0Y01GZDkyemcrOHB3R1IwckwxWWhVVDVPekdD?=
 =?utf-8?B?dXBxRXp5MFJ0MjBkeFBzTG9VMGtMTUIrU0s1Z0tHYjVLam8rZmlHRU5aaE9x?=
 =?utf-8?B?aVVxM0grc0s2RG9BUjJkdVNGUWF6dmUxR0p5OVRWOGN2L0xYQ1Mxc3NGVVBz?=
 =?utf-8?B?cEhMNWZHSTRveGY0UGV2V1R6M2o5SGV5SkpETlBjR011L2pmVXpFa2FNYUNv?=
 =?utf-8?B?SEhSQVM1Vmh2TUJTNVowYTM5QTI3Z3d2VmNWWGExT0hsSEhNZ0RuSm5hWmxS?=
 =?utf-8?B?UjV5WTJvejEvUEt6TFNXWVdzZE9zOU0xUVJEb2o3dXdoalpwMStWa2NJQ01X?=
 =?utf-8?B?RWlwMENOaE0yZEVFR1YwU1JlK0Z5cWREL1QyandKWUxscTRSbGtFOUFkTHBF?=
 =?utf-8?B?R2dNSnZUekU0bTN3Y2UxMUdZWGFXeG1mZ0ZtbUhVbWVwZW8wRE5ybmtUOThJ?=
 =?utf-8?B?dm54enlUaCtnR3BlejlVU0RRa1dORCszcEZSL3Y3MTVXNkNyZVB4R0x5Ulpn?=
 =?utf-8?Q?KSSIhiXpNx5Elfj2AxsPdUSh7GvuNrls?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1h2aWVESDJ5cXQ4NFJtSmNndVBnU1p2KytTY2pmMnJ0MjhGSkRGMXZCempv?=
 =?utf-8?B?OU0yRGhOZGpUbnUyQnZYOXBJWTVibkYyeUxLMlkyY1U0RGE1ZGJ0Wjh0ekJK?=
 =?utf-8?B?aGlYUFk5VUVScExLYTR1RFJCWVFZRzBvem82ZjZPclEwbmNtYVFPNW1sdVh3?=
 =?utf-8?B?NkEwTWpTZzJGaGxSdUlnUXlpTmpsbjRyclo4UG45ZHB3dEJJRDB6T01STkRM?=
 =?utf-8?B?TVpXcDBnWnp1ZjBuZFl5cGZJYWJXMDlQZWtHaWk1ZDBFdzJWVW1iaFgxcGV4?=
 =?utf-8?B?TE5hdlJJVFo2RFRnUDBmOWdqcDloUC9XOTk5NGduencvQjIwQmw3RmJ3U2Zi?=
 =?utf-8?B?aTR0VCtYMFg5QVI0UlNIeDZPSkFXUHIyUExWY0JXY0hjbFhHWGR5ckFkVEth?=
 =?utf-8?B?WExXdmtGdDJYYmZGQWJraDY4NEkxcW4wQzhvYXJDcThvYW5EZVRjdG5XZmw0?=
 =?utf-8?B?bkdQT2FZeEtXUkRSNWpZdGVZc0tvMFhOeE1aenljeS9LRVlscG44bWlTT0c4?=
 =?utf-8?B?amU2dElKZXdLREJpWDFoeXU3QjEwYnRsWUNuR3laR3J3RTNLUlcxN0lsQWgx?=
 =?utf-8?B?WVUxL1hsOGkxY05Qd3U2d3hHN0cwSENlQVdib2N6QnhzTzNOUHZ1WlZXZ1U4?=
 =?utf-8?B?S3ZLeEM1RFgrMFZOT055a1kyMkkyaWtqanpBMVREN3BJSFBBc3ZuRkZqNk4z?=
 =?utf-8?B?TXNRMWtHdGR2eWl5MHc5a2dic2piOE5aNEFBSG9hRzlocjBGNTlkWHpjdmlZ?=
 =?utf-8?B?M3F2azBRRkg3ZCtlR3BZYXcydWpEUXR2aUxEamJ6WUpWOGJ0MzdodVdMeUVN?=
 =?utf-8?B?NEoycWdaajd6TDgydS9xb1YzQldjYnhxUzJuUE1xd3BpcTFXTkNXNE1xUmpn?=
 =?utf-8?B?NHFNR0VwaUdjR1czWmdnMHhZeWt2U1dtalkvWXVleklENnlGWUdQbEdIR3pC?=
 =?utf-8?B?cW9hMWpHd1lqdVFETnJmUmJFaVc1Vno2S1N0dGU5V0hyL0c5azJZS0VENFZr?=
 =?utf-8?B?MzNZNG5FdEcxNFpVb2p0ajdySWlZTkZZamI5emhmWlkxV2xjc3BEOEowU2RB?=
 =?utf-8?B?N1JUWDhoRlArenBZWkpkUW9ldklJaTIyRVNxeHFCTlVPVDFpdWpZeWhyMEJs?=
 =?utf-8?B?UEI5alYxQjZDaXpFeDZ6VDJ1Q05MVWduTk9zanlZdC9nVWRtNkQxSllaVVBu?=
 =?utf-8?B?UnlsYkYxejlRRmRPa3hCRHpON0F3ZGhYeENwY3p2SVprYjNLa0NMSEI3Q2Zv?=
 =?utf-8?B?STIvbVhqa042UUtOSDhSNDZ2T05PcDRHZkFDVTNRK2diU0JycUNGUDVSQTMx?=
 =?utf-8?B?TFVWYUcrUC9HRVFiSG0yRkw2WG1mSW5rbkxDa3AzM1lHeWhCbmRPa0Z0eGFT?=
 =?utf-8?B?TEZVOGV3RGRnU05RTmJnRzdZTzVlMWcxaCtGUTczNTRKeFZ5VXIwa1ltL2Mw?=
 =?utf-8?B?dXVQdTEzeHRLeXVHK0ZYTXZ0eUV6eE5oODhibDkvMHh1OC9kNnZQaDVOZHR2?=
 =?utf-8?B?Q2dlOHF4TUdQM3F0RUxKd3FPd2VHQUE5ZmhteldOWWFyMXZqaGY3Z3dPWkRU?=
 =?utf-8?B?VWEzMDFTMXdEUVRBVFMvWmVZK2d6RWtsalVoNGsrVDNDZ1IyWDhvL2YyTzFG?=
 =?utf-8?B?bjdKdlNtTXJkRlBCSDN0R3d2cFRkL2ExVzlualNSbUZVSjk4eWxNSXFBc3VH?=
 =?utf-8?B?ZzYwV3hZZTRWNVVlOXNYdXd6c2puK24zYitvSzBEZkJyaHVZQ3kyTDZnaUdL?=
 =?utf-8?B?V2lKSTRTR1h4SEc2SS94d0RDVzg1S01JckhZaFVvamI5ajhuZWVkRzJsZExL?=
 =?utf-8?B?N0h4ZkNkNVAyVkZOamkxRXI2bmR3Y2NXdk56QUNhQllNQ1hKdjNXQ3BZZWZr?=
 =?utf-8?B?V2ora0IyL20zc04wT3NaakRvZkVUYXpqN0xtMWdrbEtEUlAwM3EvYU9GYnMr?=
 =?utf-8?B?UjhWd3M3VXVCUXdtUDF0V3pISEFKTmVtVTFPcmx4SjFjTUxXMTJtVlFOS0Qw?=
 =?utf-8?B?bGwrVU05aFNaRWJ4cDQxaVdFSnBQWGVmMjdvNkFHc1JncEd5Y2NUUEZjTUlJ?=
 =?utf-8?B?cG4wQ0V1czRNVkNjYm9TTDhZbU1IZHhHdTVyaHZVbFlrRkN6d3hjWkpObTRR?=
 =?utf-8?B?MzFhNGY5aGl1MzM2QmtFalNuUzc5QmFTd2tPUUd1MUJpb2dPYnJtT3JqN3Qy?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf5be1f-c613-42bf-a5c1-08de30e49e7b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:19:20.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kohop4dysEVYyhg0XPbHy4y874ZTB+Kf/6QhrWzM7hKSljuogityp+hA+6DBaa6CJMhywMzeeY69OxS/NoSZu2le6dJ2qBaslWrEkmZvj0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8453

On 01/12/2025 8:46 am, Jan Beulich wrote:
> On 28.11.2025 19:47, Andrew Cooper wrote:
>> --- a/xen/lib/Makefile
>> +++ b/xen/lib/Makefile
>> @@ -17,6 +17,7 @@ lib-y += memset.o
>>  lib-y += muldiv64.o
>>  lib-y += parse-size.o
>>  lib-y += rbtree.o
>> +lib-$(CONFIG_X86) += sha1.o
>>  lib-$(CONFIG_X86) += sha2-256.o
>>  lib-y += sort.o
>>  lib-y += strcasecmp.o
> Why exactly are we confining the two SHA<n> to x86? They're both plain C
> implementations, so ought to be fine to build everywhere. Being in $(lib-y)
> they also wouldn't make it into the final binary until a reference would
> appear.

For the SHA2 patch, an objection was made to compiling it on the other
architectures.  Personally I think they ought to be plain lib-y.

I could always have patch 1 fix up to lib-y and have patch 2 match...

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE8BB3B8B
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 13:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135715.1472730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4HDB-0007X3-Qf; Thu, 02 Oct 2025 11:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135715.1472730; Thu, 02 Oct 2025 11:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4HDB-0007Uw-NZ; Thu, 02 Oct 2025 11:11:01 +0000
Received: by outflank-mailman (input) for mailman id 1135715;
 Thu, 02 Oct 2025 11:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=veGM=4L=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1v4HD9-0007Uq-4v
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 11:10:59 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741405f4-9f80-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 13:10:51 +0200 (CEST)
Received: from GV2PR03MB10998.eurprd03.prod.outlook.com (2603:10a6:150:27b::9)
 by DU2PR03MB8122.eurprd03.prod.outlook.com (2603:10a6:10:2f1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Thu, 2 Oct
 2025 11:10:43 +0000
Received: from GV2PR03MB10998.eurprd03.prod.outlook.com
 ([fe80::3358:d080:db3f:c4a]) by GV2PR03MB10998.eurprd03.prod.outlook.com
 ([fe80::3358:d080:db3f:c4a%7]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 11:10:42 +0000
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
X-Inumbo-ID: 741405f4-9f80-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mqt1O3BM8SJlRrvnBokdp0RFhedXMnbc7jn7ItHAVdhByyk7pLby/7gDYkjzYy8DHnbNHn//hJnuj/TWtFYs6mzjIEUwOxEHLdrU5LyHL7YTrZkinPDTYaCm57xj2KTkr/LmkkKaiP8f79x5ADTNH8yJpEwRhXTwddJ7PniEEjeENBwpXalAsmmY9Gy45O0sSsxiXE8awKT2FnFdI1zeh5lRurMwvEiCY/gKDQb0z8QjFtXKXPXQ/rE2JedPlCbvNcZ+pLNqfYqQHHcxGA/wMTvWts/fSiVudC00NR8Z2HY//p7ecLWQskmu48EECYg66bEb1b8ExyDkf0dY7akogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GyfR64pNTgcQqYoT1qYuyv4fzec20C0AYH22uKTQd8=;
 b=fjMkJmYrlwzDIiUk6PnE/K5axWJXzMtzU98RZP597P8eBG8QNPM3utfjR5IOwnzfCTXt3dqNzMIQF4EmNFAg5NJmvIrKQiKGmaX2m5Qv7ga/5anVnHurJclYKp/c77mXB3GDBsuxOj3Bf8/7NZyavkK2EsreswQIr0mETd5aTbIf1PDsna3npUUCdhvPGGXQh9R1UQ2bw9IL1hQ0TOHftW3p7f4FeB8e3TgHJcQf8Dt5eOEAwSPPpcGkbGkYogFLo1AqSS8Ln8x3MKDLSa21tUNJOlu2xs2zFyG/5uowZc2pZtuDRnNb+ilxuvWSx+xa3ggzWZ4/tWCwCDpY7das3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GyfR64pNTgcQqYoT1qYuyv4fzec20C0AYH22uKTQd8=;
 b=MMZccIV1ako3iawXtPb8uuThK656rlVEJHxKJTd4OzcEACYd6iOJ7nc1HLNHOPxxnv3u07ACR0RTchlI6Zd174uOhRAUW2WMckK/ngC+JpYIvtbHEoblzO6QeIuIthqiNrvKNlTn9pKjOpuKYiMe1YJGYvW0Dde6XOE8PJMcorWu44JZ8qs/QAaSwpHuUEwnvJm8p9Epw5okwknyvg901r0xJ/R3H17fXrm+XUHkYJmIizXmZHirfv3szlbl7WafkYHVgVS04Nk4rJaJAgMGSkya2IkeX6y7aN++0UqZbzKUjfIXmbEyQmvu183q+32ioaBNdG5lIhZM/WxIk7wFkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f3e662d1-7626-49f3-a673-e3cfd8d7944d@epam.com>
Date: Thu, 2 Oct 2025 13:10:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
 <bf042eea-ed2d-431e-b1f0-7be0c09194ef@citrix.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <bf042eea-ed2d-431e-b1f0-7be0c09194ef@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0112.eurprd04.prod.outlook.com
 (2603:10a6:803:64::47) To GV2PR03MB10998.eurprd03.prod.outlook.com
 (2603:10a6:150:27b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR03MB10998:EE_|DU2PR03MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb3da9c-60d5-4045-3daf-08de01a453bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVg2dFFJdTVhclF1dHlhMUpHczVQSnNZelJkeHl0YlB5cEtaWkMybTk4dVdo?=
 =?utf-8?B?MDZONWVIbE45d0RxZWlWVGRGOEtYZTNvNW02T1VrUHNVR3V6eFpVYXh3MlRF?=
 =?utf-8?B?NTVzNkQ2M20xNmYzTVpTZE9Ram12RFoyVEJOb2s1Z0VpUWN5TnhEV2IySjc4?=
 =?utf-8?B?N2FQMXdkeUo3WGJpT2hOdjdqUW5FeGFJNkM4S3JUeWdkait5RGdiS01yQUll?=
 =?utf-8?B?b2FxOUV3dlF3OEZaN3I4RHJUbk90ODlmb2JaZmNxSnFZNFRBbXIrUElDUkJY?=
 =?utf-8?B?alRXaDhWQ3NQL29mU3ZsQjhNMVJ2VmlVOG9EcnJyRHY3Kyt0Yk82cWNjcllK?=
 =?utf-8?B?WTZFam15VUptYTNMUXp3T1lzUjhCVlJsM2JKaGNkYk80RVJQaGxDRnk0OWNZ?=
 =?utf-8?B?NXQvcWM4Y05CNzVBRGNHaEpCem5rL0lOampNQURDWEFDQ3JtR2g0eHk4S1Iv?=
 =?utf-8?B?Z1RJek9ZT1YwVmpaTnQvVHBaL1RFWnJWVmZ0QzlZSHhlNjhKTEZOUi94Rmox?=
 =?utf-8?B?c1hFTFRBR2FKK0hyaXM2OFhmcEJ2bnE1MjNhUmJib0l0Y083M0R6Umx5a0w0?=
 =?utf-8?B?QlNDNkhkZFdQSE5ZSHF2M1dSMUJuMWt2NEkrcU9lT25aQnV6WWpNYjUwOUJO?=
 =?utf-8?B?UTRvdkZSTytoMndNUmJUSUVhSzVKblFEbmhMMlRjVEhqVWR3cFVGSG5PdWZX?=
 =?utf-8?B?YS9kZGg5SDlJZEhTY1YyRFJHWU9ENFFjd2RINzJxWTBHUTZ5OTRsalVCbVVz?=
 =?utf-8?B?RWhpQ25aRkJQUmlzSEJxV0ZHUTloeU9OU0FvOHBXakJSRzVRaWdhT2dsTFpi?=
 =?utf-8?B?M3BFc2EwVjd6RkhIZHRvcHhMMHNKVGdHSkRaUHN0aVVMVXZZbVp0c3hVV2xy?=
 =?utf-8?B?SFFYLy9DMC9OaFh2czFXbVpqRU9BRjYvWVVEdXhtTjhPUTAwQTBkNTB2ZVhI?=
 =?utf-8?B?RU1XYkREVVJvOThjQUYxZGk1UFFGUy82cnB1VWgyYllWTjV5Z0tiUzNRV05G?=
 =?utf-8?B?b201andCV3hObEdwbmFGTWlYWHI3SkFMcU1xTlg2UzNhd0pRbDBFZ0lQNTNK?=
 =?utf-8?B?VFRVN25FaUNnVElPQUtueHpJeGt0djFjMjlqekVnMThyNk1TRDVFc3hkd2k5?=
 =?utf-8?B?L1N5clBaWmdyWDgvUWVRNjlQOUJtcG5xOU5DWFNYR3lDMURodGRITG0waStj?=
 =?utf-8?B?WHFSVG1DRDNJUGEyUWFQZ0t0SUZzcEVFZUgwTXRNZ0J1QVVIUXFoVHRMSnVM?=
 =?utf-8?B?aWFmb2hIamtjMkFiNUcyM2grT3hHUTZUbkZxYXBUSjZSRHZUcXNqc1J2VDQ3?=
 =?utf-8?B?Z2NDYlQxQWduMjRuYWY0aFdzMm9hL3pxaHk3K0c2ZDRwckhYcVM1RzRFS2Ur?=
 =?utf-8?B?NXBpQWw3SFFQRVh6M2NNd2xNRUJTTEZzdmdHYlZmMzZjSVJkTWI5Q1c5SG5W?=
 =?utf-8?B?d2F0TytpVEhMM01DN0J6TlpZOTVTTWV3dytXUUhWM0laQ0UxdVRiQWlKcGFS?=
 =?utf-8?B?Z3dFa3hOUTlxMUVEQlhSbndkeTd1SmRqeTIrNjZ2a2lLeU93WjN0YlBuREIv?=
 =?utf-8?B?WHBNMGZyQWpic2lJZkMrTXVBUWIrRTE4OFdFMFRKcEJiVndLRjNlVDhQdmpU?=
 =?utf-8?B?WHIyMGN0d2k3NmdDUzJNZHdyYndwQVR0ZkVCTklEZ29HamlVWTNUUVl1NEk3?=
 =?utf-8?B?YUFrRzgrSDRJMG1LamNxRGJoUXk2Vnp0WHZKdHJESmZlbnNrSXdFQjlYNklX?=
 =?utf-8?B?WHZrU3JrUjVMZGQ3M1lUU1lmemxZeG03TmNlU2RGQVJBNll3QTM5aFFHQms3?=
 =?utf-8?B?V0dTWS9IL3hRU09VZjRRVDNhL0RFN0Iza0RTQ3RHcXg0ekc2M0d4K014bWVr?=
 =?utf-8?B?VnpuQkNkcWJ0VmZxanNEdjlWMWxwR0xGMmREbFVtQkg0OE12OFpvSnVyZENB?=
 =?utf-8?Q?DdzjfVALE8JGVvc9re+YriRc3GS//Z80?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB10998.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVN3TjlGSVUwcDRVSCtqdzJWcGQxNVQrYjY4Zm8ybDYyVm9PUUZrSmpDUVNM?=
 =?utf-8?B?ZmRiR2FUMGpRRUFQNS90SjY1eFVjbzd6NHpxNXNGdk1ReUtTUjBCM1hINFhG?=
 =?utf-8?B?ejg2TVllc1FnL0pJZk5lMkg2TEh3ZG5iTnRsTWp1SGRENnA3azBEVnZWOGh1?=
 =?utf-8?B?TlhOeTNORGN4dmpTSkk4ckZ3K0hoakgvTk51WnNQdHFXSDFVYUR3RERBb1g3?=
 =?utf-8?B?YTBCRElTanc2bkZLUUJ1dEw5dGlQT3hMamQrd3o4YllCMWNwczd2Z0VYMXU0?=
 =?utf-8?B?ZERvanBVcHE2c0xPVUcrVUd4SnZrYzFrSDhCWjkvZE5RWU42Y1BleVJrSzNu?=
 =?utf-8?B?cTY1b2Q5Y3YrdHQyNDJ0djFFMTI0SmhyNWtpOEVKQms5R2x3aVI3Q0JXUU13?=
 =?utf-8?B?MWVZSURBcUJBUWVGUGJQYlVjZGNMekZtNVBTSWFQUkdqTkt6d3FoNmVHaC9w?=
 =?utf-8?B?a2VuVzQ2QWVxbmpxUmo5RDFLam1JTmVxTXRiSkhYWUdLZmFJUFFXcHREOFRn?=
 =?utf-8?B?ZGZPNHRaRDArSjF4RGYrY2lEZVcxSWZFWDRRMDRmcWhxcnc1WkJDQnZxQW1D?=
 =?utf-8?B?ajJDQzZtamZzS0lvMkp4T0tUMGE5WUJyY2o3Y3BKY2lVYkFkZDJMTWVEZHJD?=
 =?utf-8?B?OWwrTk84N3pVVzJNbTBXcHVhYlVaUjUzQU96MjZPUEhIVW1TcGIwUGUzUGhL?=
 =?utf-8?B?eklHcXdpUnZuWmx1bWZWUzJPbkVSeFZ0SExRUTd6MzY2SDFJVFlBOGZmd2dx?=
 =?utf-8?B?UW43NmZXbWhRcjBEaUVjRkJROHdMbUw0eVNCd240RWViYWVsTzZ2VEtqeDFZ?=
 =?utf-8?B?MnphWUozeVY5T1kwZ1hIM3dwWDVFaXNWTEVsSk5MOHRFNUlHcWtvK1BsaEN0?=
 =?utf-8?B?NE9rTHJLYVlURUFQbjNVWWtad1NzM3ExcXlXVFhLV2taN05nbU1XZmRtdkdY?=
 =?utf-8?B?bXJCNUQxbUkvVFVqd29rSFZMcm9LbGFTUkR4YTlaYldBL1p2b2ovMjZRZnJj?=
 =?utf-8?B?azQ0aVdrYkQ3NU5PMm1wa0ttZVEyZm5TbjRTdW5sTm41MWc2ZFpvRlRqNDk1?=
 =?utf-8?B?N2hkQWd2ZS9lZkEwVHFtUnhCZmVnL0MxdlNaQUk2TGd1dWZyNHZjTStmYnBI?=
 =?utf-8?B?SENOTkgveGc2VGFhdk1IYjY0VW1ZK3czK3ZWZFpJZmdKN0dzYkhSaEZZSE9k?=
 =?utf-8?B?ZTlVYkpuSGNwL04zWm10cDlSMFVYbmtIcXZGaFRVZU5ZRFI4WVlYSzJGR29i?=
 =?utf-8?B?QkFubWVHWTI4bVcrNUZxYVU2TjRLN0RUY3Z5NDRMNHpOZzI1NFhYOUZlNWND?=
 =?utf-8?B?RHZlRnZ1U3RDL0U2NTg2WWJxUkNqVG5OVDlwaHl6bnRUelNaVDBMWlZQM1ZJ?=
 =?utf-8?B?RGMwQ3RGOWtFVG1OdWRrQnU3SG5kWWJERkdzWmFkV3RrTkVDVnQ5M0ViMG5X?=
 =?utf-8?B?T0JxY09oUmZGbFBPN1dtMi9aaS9MRGsxSWhuMjEvOG1Mc0F1UXpYT0l4N1BT?=
 =?utf-8?B?M0dieTZqYVFCOGVsYXFCSEQxOUl1VjMrWFpmdDEzVUl4MGhxcDczUjI1bXlM?=
 =?utf-8?B?REJYdDJHZEo1MHR5R2M1enlWQkRtTkNTZFVMRGZZS2ZlVlppLzZJU1dpNEdW?=
 =?utf-8?B?Wm9IeGxWUVJqSmdPWDhRdUI3SHlCcEpNYUNCanIyNno4K2Z3U2t2TENPY25M?=
 =?utf-8?B?aXpoYnEzQjQyMHJRNFZMVGpyNS9OWUs5R25Keno5VlkveXgvZlhVSVBuWmFW?=
 =?utf-8?B?emNvWUNXaXlWaUpiMGRMdlNudzR6Z3dVdXZZVnBGRTRiSUc3NXFWREhjWlhv?=
 =?utf-8?B?UCs1RVdMZDNXdXN1OVhHcC9NNUFPTEJkdk9XOW4yTU81SlpITld3bHJLVnJa?=
 =?utf-8?B?cFhmYjdld1RDRExGOWY0VWJsUGhkM2JUNitPd0FwK3dHMlB4bmZlbEg5T2Zt?=
 =?utf-8?B?K2psWWVpMk4rODRLeXo3OTFRaU1Fc0MzZFlYMDJZUG5zb0ZWY00yVFU3SHZ1?=
 =?utf-8?B?Q05RWW1CWTR5eGRJQjZxeDdYbksyTllwNmpyZzdmUzJtczBvaWMzSGxJZnlN?=
 =?utf-8?B?Z1ZjSnhtcHM3KzErSGp4anAzbXlNVitKdGFLSkMyY083cTZDQmx5MzcxWVZq?=
 =?utf-8?Q?415m+hvh32cqlx4typzVVgSNb?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb3da9c-60d5-4045-3daf-08de01a453bf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB10998.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 11:10:42.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJIU3PDTUQinwmydf0yHg320AjHZOdQW6kRYvS9qLAfTZUtQ8qUY98fuVC2hsbHXyETxFwseDJ4jMyGIbOc40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8122

Hello Andrew,

On 10/2/25 12:10, Andrew Cooper wrote:
> On 01/10/2025 9:01 pm, Milan Djokic wrote:
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>
>> ---
>> XEN_DOMCTL_get_address_size hypercall is not implemented for arm (only for x86)
>> It would be useful to have this hypercall supported for arm64, in order to get
>> current guest addressing mode and also to verify that XEN_DOMCTL_set_address_size
>> performs switch to target addressing mode (instead of relying on its returned error code only).
> 
> Please don't copy this misfeature of x86 PV guests into ARM.
> 
> Letting domains be of variable bitness after domain create leads to a
> whole lot of bugs, many security relevant.
> 
> 32bit vs 64bit should be an input to domain_create(), not something that
> is edited after the domain has been constructed.
> 

Yes, the idea behind this patch is not to introduce variable bitness, 
just to have the ability to get current addressing mode through 
hypercall. In our case, we have used it only in domain creation path 
(after domain_create(), to verify that target addressing mode is set).
Of course, whether this hypercall support would be useful in mainline is 
open for discussion.

>> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
>> index 8720d126c9..f227309e06 100644
>> --- a/xen/arch/arm/arm64/domctl.c
>> +++ b/xen/arch/arm/arm64/domctl.c
>> @@ -33,6 +34,37 @@ static long switch_mode(struct domain *d, enum domain_type type)
>>       return 0;
>>   }
>>   
>> +static long get_address_size(struct domain *d, uint32_t *address_size)
>> +{
>> +    long rc = 0;
>> +    struct vcpu *v;
>> +    /* Check invalid arguments */
>> +    if ( d == NULL || address_size == NULL) {
>> +        rc = -EINVAL;
>> +    }
>> +    /* Domain structure type field and actual vcpu mode must be aligned */
>> +    if(rc == 0) {
>> +        for_each_vcpu(d, v) {
>> +            if(vcpu_get_mode(v) != d->arch.type) {
>> +                rc = -EFAULT;
>> +            }
>> +        }
> 
> This is deeply suspicious.
> 
> Under what circumstances can the vCPU setting be different from the
> domain setting?
> 

It should never happen, this is more of a sanity check. Alternative 
would be to use only one of vCPU or domain settings, checking against 
both seemed more complete to me.

> ~Andrew

BR,
Milan



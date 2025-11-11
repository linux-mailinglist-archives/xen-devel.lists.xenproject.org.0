Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DAAC4F6E4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 19:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159286.1487653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIt3a-0008IU-27; Tue, 11 Nov 2025 18:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159286.1487653; Tue, 11 Nov 2025 18:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIt3Z-0008FN-V7; Tue, 11 Nov 2025 18:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1159286;
 Tue, 11 Nov 2025 18:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIt3Y-0008FH-C2
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 18:25:28 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb8875f7-bf2b-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 19:25:26 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by PA4PR03MB7453.eurprd03.prod.outlook.com
 (2603:10a6:102:e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 18:25:24 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 18:25:24 +0000
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
X-Inumbo-ID: cb8875f7-bf2b-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UB+Tu9YSHCFM9Qmzpsrc3SFnOrMeZYJaDcQtz0OJg8oD5zajFw6ckjcUpUGYQjgQHGfu5YQcM8sjbDJ1jZo2XVQEx7mW/rJGcp8pStWLnIjZQrCcpkxAQUIcDhvz2F/WOG/7l+P7pgFplbZmDeHIa9NFZGDDjbPopBzwHO6z23D+ql6UBId7N4qCZx8MHlYpkoXJ8XBEfASQWBkXB5UaEZcFttE1JDsOhcrDtqrGAN/yAfx4gb1EO5Ob3ssZ3qu6AhC5oNNAD1vgoPYV0uakyORU5SfXSVngM18ulfzfD2rqjJ2Us4Zhj/Hc1xnCXi/ebGi6JzWbOwgzRJKwDGvQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MujHwEvH9fQGdWuKIksiRjYbWNiTAHP3lIb0CxOPtb4=;
 b=QFcI3ExIKZd6e+etoJoStdrfvuCm0boJLdO3OtkZ/+xqCXcxuOzx3v4ULi5pwx1TTlr/wvvPKutwO7VjsA1AyOtt15rUdQ/G3bfQNuf+DZV2DDIcVa6KrnCQC6NKhEUXpdvyg+P3z86l8OhayxmgcXe/E7w5W0rWS/XCLmxOaxQbgtSrn34zUegYgEniewuq8x57MKgc2e1/ObN1W4SvGrbNxYQCHgM7+fhrLrdvaWcVnfTzU+WZI9av9Y3UUJmEiVeka+dnOzQ6QM7E6rmv31OyzZLszvWZHJW4xcrJVzlmsYb+PFrxK4NyZXe70L8VKfyHBqRLMOBYpEcDJpeB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MujHwEvH9fQGdWuKIksiRjYbWNiTAHP3lIb0CxOPtb4=;
 b=RwenEz+4UEPvwngZ69bjrbqKmGgv75DdcXJHXqH8B+JY42/lsXr3KOQg/eIrxZrNdmWoE4rMR4CJ3xKR42OES/Ng2x7Dito/oFPGmNyhJV7DJ1O426B2X2+7ox1/ewcYoTC2z4C+WJ7s0Ke9ibDUme0VancDjXFJ4I4zWg/LY0n81/07I/SPsU3a4tL6ZsQtxdn3B7tXf0WV4dOwoTB+mFjudRD9wyAU4pc1iwhn6iWm7WPu5b8EJG4kO8dQx1hu3scbJD0HZ3Yy3hHZFzKT0s5zOi2+OjnD7F7BefpP06q/fGLtnGosRxmh6GWg12qmndJZXXrZdxnPeVScddM+fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0a5af540-214d-46cc-93e5-f0266bb79064@epam.com>
Date: Tue, 11 Nov 2025 20:25:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20251031161716.1222956-1-grygorii_strashko@epam.com>
 <a4d3eb8d-17ea-4d3c-87ef-ba5c3477b8c3@suse.com>
 <edb590e4-340d-4a0f-9543-0dfdcc7b54b1@epam.com>
 <210edee7-8525-47a9-8191-ea7d94db5fce@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <210edee7-8525-47a9-8191-ea7d94db5fce@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB8919:EE_|PA4PR03MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f8f888-357b-495d-8117-08de214fae58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akdNOTkxQ3BEZXJHUHhIRTVNcDlOeHZSaTAwczFqQjdhZkp6VFBOTmJRU1lG?=
 =?utf-8?B?R2s1OGpRQnJ1Ym03L1oxOGtwWjA1Rmc3OFBhOXNqSmZpLzFrNGpLOE9TY1VG?=
 =?utf-8?B?MnNMOGVhUzlhbFQ5T3NSUmV0SVpCMUhjMGY4NVNvL3QzTlgxRmJ4NnV0ZjYx?=
 =?utf-8?B?OHo5dVZ2c0FzNUNVT3VhME52WStYZWcxVEN0c0pBRUUydGlHaHI5TXlkSEg4?=
 =?utf-8?B?MnVvdjJmL1pucThvZ01CQk1FaXBxWDA3WFUrMnljcFpGUXlPUllETXJPNjM4?=
 =?utf-8?B?RHVnM01NNGxySGpZQUVPckp0aFFaZzFXc3liaElLZzBkdzE0eTZQRjYvcnNE?=
 =?utf-8?B?bUp4RVVhb0RXb3hCeERWVTJ6cFZzeG9zWFRycndDalZtOUJoZ3d1em1wMnFM?=
 =?utf-8?B?Zk9Ia1kxNVVLbDNFbHFQRjBFSXNORGs2S1hQOTZ1SEs2ZWd4L1FMYUVpWmZt?=
 =?utf-8?B?YVU4bGtRamo0UEE2YXAwRzFOZXFBUkhnV2JLak5BRys3UGIyZXhhd1ZGanlT?=
 =?utf-8?B?UythL2dldGFCOThyU1QzRlNqSVFqUmU4SFNiOUFiNFJtTlhzZkt6bjE5ckVi?=
 =?utf-8?B?UU96Z3VFMkVJTG0zWVg3UUp3c0VaYSsvRUtHUDF4TlFJWkVPbVRtTmRFSnZi?=
 =?utf-8?B?WjFnZXpUVzZ4T1IxdHBqQnZFV0kzN1NqaGJYaDBueE9QZWFFYXVzUm1mQ0J2?=
 =?utf-8?B?RnkxMmNRZFBMcThldVd5NVh2a3ZhUHNoMjVsSnJVTVFpM053ZlJHRXphaHFT?=
 =?utf-8?B?SkJJem5zK2tkUldyVW1zOXZnU01jUzFhWSthVkZoZ3Q0MnJTMWk3MWVpQXc1?=
 =?utf-8?B?VmhJNjRPZjg1LzRHWVpiYkJvTFdhSVpxem1ZSERmVGpHUER5VVJNbWRqU1gw?=
 =?utf-8?B?c05SMzhMNm1leUdzQVNTMjIvZnlKSnc1NFA4Zml6UnJzUC9CdmxJY0lRWWxv?=
 =?utf-8?B?MEZwOGh5d1I5VzBuUmliRTUrTlRVTlcxWU5rc0hleUJybnFVOXM4M1EvZmZk?=
 =?utf-8?B?TlRYUVdPUjI0TldWbndRakpoM0ZBR2ExZmNMQ2hzblJyMzJ5cE1VcVN5Vk5h?=
 =?utf-8?B?bEZKZkVuYkRPZUsvUGRVZGdRS09CYUwybWZBamRlVXVHUElTL29SNmZ3aEp6?=
 =?utf-8?B?ZHN3WmZYVzJXU2JuS2taQzBMMmlZaFBTbGM3NkkvRUdUSEkvZnlrUldWVm9o?=
 =?utf-8?B?UldYSmRxV21Zb1FGeXZtQWx0Zlg1b1JuN3hEbHNZOXgzN0pROFVybUFUSEF2?=
 =?utf-8?B?bUhKZTJJSk5xNXh6SU9ZUzJ6NDZDR3hycWVqeG5aVXdJRTNDTlB4K0J0ODEw?=
 =?utf-8?B?Yk1ZS21UY05ydFljWUg1TFV2S3dtT202VDc1ekVCYmY5ak81cStnQ2FBelFT?=
 =?utf-8?B?Vmg4NjR2VXRwSkxtTk5MUUpYam15d1NHdGd1OFBoZEJQc3h5VnJTdnRmOTNP?=
 =?utf-8?B?T1dHaDUxWUdRTWVudHZHOEM5ZDVnM0JCVEZNVlJIK3pNQUY4QU5KeHk1clF5?=
 =?utf-8?B?QUdjeU52UnIwQzEwTFhydTl5ZjhxcVNzNllZckE5S05zZXdBUEtRKytPTld1?=
 =?utf-8?B?ZDRnYzZxMTBPOURXNmxSUEFtRlV0NFYwTXA4dmJXQ1FrQXJsSzVwSjBSNWti?=
 =?utf-8?B?MGNYMXpKNFd1anJ4VUtpRXpDQW5hZlNRL1NKMm5OYlRvUWMxRWQxVEJYN1Rk?=
 =?utf-8?B?UDJFQjNQcGYzV0I5R05zSk5MUi9WV0pRYjdxSnV4SmhQa3dqeU1MWGcxY3ZH?=
 =?utf-8?B?N1hsMG1ITzJlN1pJUEtnQVpRc2gvSGlBRnlQUFNYQjE2OXloMmRINFhSZnBR?=
 =?utf-8?B?cjNRZ2ZCZGRtR3ppY1RsS3N1MGVTOTBPcHVJS09ZeGoySmRqeHNodlZIZzN5?=
 =?utf-8?B?QVJpNy9oQXY3QU1PczluUThLVndVbjFHUkozY3cvc3pUenc1RHBNZTRhRkhl?=
 =?utf-8?Q?0wZt2klB45JsDojTMh1+4sNPVcBqQY5s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjJBZ2VZd2hmZ08wY1dFb080SDl6OEVGeTNrYjlNYkNVNW1CSVp2akhTOGU0?=
 =?utf-8?B?WW56Tk80azAvKzN5RGl4R1UwT3ZIdnZUWjJ4V1lRQVkzNHNPUExoU0ZzSGhR?=
 =?utf-8?B?OVZYZEtNVnhPUkRFY0g5eCttZXRmN1kzaUFXa2JFdDJZOWxaQm5USTNHcGti?=
 =?utf-8?B?N3ptTEo1MHZPbEttVlUxV0NPL3NuaGNFaDNNVFoyK01vNnJQZ2MwZ1pYQ1Fw?=
 =?utf-8?B?bUtyclB3UXZ6YW9rOVFELytKYXNRZzVpdU1yL003VXlNZStQb2J2Z1hGbW5V?=
 =?utf-8?B?anJFRTlTcHdHYjh0TWI4cTVxeUhGOXVuWnl5S1F3RG8vaGRwdFJuRkx6YTYx?=
 =?utf-8?B?aFdGQXh6cEhKRE5ORGxXZWt0aGJXL0ZNSE85Z0NwL3JVVjlVcXl3WDJmTzJQ?=
 =?utf-8?B?YXZ2bHBsdTBna2JmVW51bE56VlFFV2Rzb3ZLUEw0eXl0TDJ6dzBrUzhCd2g2?=
 =?utf-8?B?U0Q3MENnTmZqUkhEOXRQRWZrazZveW4xaVM3cWpRYjZxdjhUaXA2bFJwTUNp?=
 =?utf-8?B?R2g1NkNJTGxsUzh2OXZPNmhBNzUrU0JhQVhDV05uenJmUXgxZ0FYZW9qZmdS?=
 =?utf-8?B?Y0tzblpZR2dHUDV3RG9QOUZMTGlXbmdsbWpKQVBEN1ZUeGcrVTgzZHp1eHN0?=
 =?utf-8?B?b2FlNjZZQ0FVVGVBaVdYK0dyb0pBNmYxQlZ5d3NqZ0J1WHUwUEdqdUl4YUxL?=
 =?utf-8?B?a0lzQU1pdFhrZ1BZOC9uY2N3OFRwT0t3K0JOejVKVXNNY2doaXlLcVp2ZVlD?=
 =?utf-8?B?ODdBT0J4M1ZabE94TjRMa0R4SlhQRm5xcHB2Y0toaS9xVVBVdndqUVZuZ1F2?=
 =?utf-8?B?a01nQk1EL2xXbG5obDdPSmZ0ZEFmZUxoNm5ycWhMS0tQQlA0MURJQk5kZzhS?=
 =?utf-8?B?UnlCVTdpemY5cnE2REEyUlVpMVFIckZiZVlmV2tKN2ZUWlJ1MUd2TWVXdXlJ?=
 =?utf-8?B?TXNBYmFZN0Qxb2poditmYi8xa0xjR3E3UDJLeHlFaDVtUldhRmNYY3djL3Ex?=
 =?utf-8?B?QzVVUk50RjdrZng1Y0gzemtlaUJDSzZHa3dub21zL3NGM3hUNEgzMnhldmhu?=
 =?utf-8?B?SzN2dDZwVldSUXBPWUIwR3pOazd6K0xvLzBmSld0aFJ0K0N3OGw5QVduNmFx?=
 =?utf-8?B?L3pxcnRBNkd4aGtUS1IwbDkyVUNob3U4VXphdVpUcnpLcm1RWXN0Nnpzc0Zt?=
 =?utf-8?B?SHhIYU0ySXViejhFcTZTMlJFZHJVbm1xNjN6ZXdSUUdKUTRMSmNyQjd2bFN5?=
 =?utf-8?B?WDFNNmRHcHNEaGhiK1V6bk1PQllsbGRvSVdUc2ZCS2NYMVZlYlRjd3puYmwv?=
 =?utf-8?B?bHZtdDZpdmRYdUtsWEZkak9XcEMrbW5NNC9tTnJ4a2ZrRlVlcjExWVNwWDlV?=
 =?utf-8?B?RzM5aUxpT3EyTzAreUdoMXN5OWk1UlMrS3dyTmpyVGVWVHFzNXhlV09TcS90?=
 =?utf-8?B?UkxMcE1aYyttNmpmckpzVU5aVE5Kc3lUTFJhSnhMYWhEVHY3TFBscTZNa2RF?=
 =?utf-8?B?MTJHOVhaWXl6K0REemF2U1BjT3FBdzFVL2FRSG1EZFdlRkRBTERMMW4vNWRr?=
 =?utf-8?B?RXpJQWlnaGJiM0ZyaHF4YkJCdnhHcE52dUlFWFJuN1EzMy9NRHVIWjB6WTZG?=
 =?utf-8?B?c0lhRnliVmZxa05rcCsrdUlpSGt3UzhwYWN2NjJoYkc2UFB3cnNBTUxDTXpG?=
 =?utf-8?B?cDVWRVZ1K3Y0SjhOb252UEh4bnQzUHJwRStNb3lYcXBNRlRzS3lzTzZrSXpp?=
 =?utf-8?B?QUxBdWFoQkxHbnk5QzR0cmcrTnJSS1k2WlBlM2hwVUgzMzlTL3c0QUVGK21Y?=
 =?utf-8?B?cHhpOHFYbENpVVU1blpremM1WjJvekl5VHhmclc5OWF3UDJ3OXBNMFdFWE85?=
 =?utf-8?B?TlBnaU1obnFvWmQrNGN4cVRqSytMekJJWTBYcjJkZVpVWFhibUpWQjVHeVln?=
 =?utf-8?B?SVhBR0RIMUlrZFA0VTdKc0NMWTZXMjRBV0FzY1doMGlVeERSd2RIb3FqdmpG?=
 =?utf-8?B?dmR2T3ZGKzNhRmR3ajh5c0ZGdlJTRDhYUlQweHdaajg0SDNzRXU4RzN2YU4x?=
 =?utf-8?B?RmV6aHhmMm1XU0dyT3FoV3JaZDFBVS9hZWt5R3ZuQXFyc1RpQkl5dk45ekpG?=
 =?utf-8?B?YzIzWkJpcVd6MTFZaVI4aCtlU3A1Vi9BclBGODhKeTlUNEpBajBuQnRzd3Ex?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f8f888-357b-495d-8117-08de214fae58
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 18:25:24.6255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+1ctiwgvwzHn4s/Cqgy1C4dlLwzYn7PWSRSvtQYJrSt6sfPdK2YWRKjnZqB95M4XPxrBxtmmv4doZ6JTYoWqKDVLWfSt2RtI5by1xFphWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7453



On 06.11.25 15:47, Jan Beulich wrote:
> On 06.11.2025 14:42, Grygorii Strashko wrote:
>> On 06.11.25 13:35, Jan Beulich wrote:
>>> On 31.10.2025 17:17, Grygorii Strashko wrote:
>>>> --- a/xen/arch/x86/hvm/Makefile
>>>> +++ b/xen/arch/x86/hvm/Makefile
>>>> @@ -1,6 +1,6 @@
>>>>    obj-$(CONFIG_AMD_SVM) += svm/
>>>>    obj-$(CONFIG_INTEL_VMX) += vmx/
>>>> -obj-y += viridian/
>>>> +obj-$(CONFIG_VIRIDIAN) += viridian/
>>>
>>> With this, what is the point of the additions to viridian_load_{domain,vcpu}_ctxt()?
>>> You're adding dead code there, aren't you?
>>
>> Hgrr. And we end up back to v3 regarding this part.
>> Check in viridian_load_{domain,vcpu}_ctxt() may/may not work depending on toolstack
>> behavior which is not strictly defined (loading HVM_PARAM_VIRIDIAN before/after
>> viridian_load_{domain,vcpu}_ctxt()).
>>
>> So what's the conclusion here - drop this check?
> 
> Well, Misra wants us to not have any dead code. Hence why would we add new
> instances of such?
> 
>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>> @@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>>>                rc = -EINVAL;
>>>>            break;
>>>>        case HVM_PARAM_VIRIDIAN:
>>>> -        if ( (value & ~HVMPV_feature_mask) ||
>>>> -             !(value & HVMPV_base_freq) )
>>>> +        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
>>>> +            rc = -ENODEV;
>>>> +        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>>>>                rc = -EINVAL;
>>>
>>> I find the check for value to be (non-)zero a little dubious here: If any caller
>>> passed in 0, it would get back -EINVAL anyway. Imo -ENODEV would be more suitable
>>> in that case as well. Things would be different if 0 was a valid value to pass in.
>>
>> The idea was to distinguish between "Feature enabled, Invalid parameter" and "Feature disabled".
> "
> But you don't, or else the addition would need to live after the -EINVAL checks.
> I also question the utility of knowing "parameter was invalid" when the feature
> isn't available anyway.

My understanding here - I need to drop non-zero "value" check.
will be:

     case HVM_PARAM_VIRIDIAN:
         if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
             rc = -ENODEV;
         else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
             rc = -EINVAL;
         break;


-- 
Best regards,
-grygorii



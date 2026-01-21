Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKJdI2eucGkgZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 11:45:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7F55706
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 11:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209590.1521551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viVhi-0004yV-5O; Wed, 21 Jan 2026 10:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209590.1521551; Wed, 21 Jan 2026 10:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viVhi-0004wf-2P; Wed, 21 Jan 2026 10:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1209590;
 Wed, 21 Jan 2026 10:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viVhh-0004wZ-4v
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 10:44:49 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3410c81b-f6b6-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 11:44:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS2PR03MB8465.namprd03.prod.outlook.com (2603:10b6:8:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:44:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 10:44:44 +0000
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
X-Inumbo-ID: 3410c81b-f6b6-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pj/TaHskxK5ojStGnYaDZq6Pm0xU5XIzYIVugDqVy8kai6I39mpH/EDHcfGGg4cVAMrt2Ig/BDnMKNnj4Twqva+ElKK0STMzVMWJo4EXWctxic/oNhjobKOidwcjezBOdRiCMiyBZ1efUtEj7W650bBjK1RUe/5ebimCY5UlS3RO6SctXYkCOTQ8zMPLdb6gUhlh/7MTAZvDfEva8KJDmWFmlN1tLMRDzURWkwGLsLgiEmSq4gsI/FgmuVkGvKcYLArqtoczBEHio+kodHa1yfhG5VHSmTG00V3b8PniaYcW7XdNHB1A/OySLVj8GGSr+rYa+jHQFPW6v6l9zUSvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1sCkk9HBRqH78MMZZKGvEHnm57eyzSriRmSJeR7KLg=;
 b=Zq6ScSaNsflSw8qIJbuYByeVSP1VhBbFZs5CYlj0H4wUEMheDyBrRxvne1n8cT/vxR9ebxm8nB4jgZhRMnvJ5j3NNqVhMgqY1ZXq1VhAknDpzOxtj+MOjQLihtck8SOIhjwtu0s4krCWNNmmWOdErhMnCnC2Av3yP8hxWmfN0PYMrZpZgfgFe6vRpx7P6AyHjiImDQOLISaFJp6wZRLoUFbimzeH2OazXPaXtULLDUIKg/eTX+Fy5b2L729CDJbEWcm8jakiN5nWnhIaGTnRwtD+nzLg5YGFQAemS34HfjZWx9zytl5qFKRfToldlN6TxZgU+AxZC3YJ+o7v/pJbFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1sCkk9HBRqH78MMZZKGvEHnm57eyzSriRmSJeR7KLg=;
 b=enQ+sNsIF2PGxqsq5htd+evkNYutyQSlkazxRlN8jFK+t+VfWl+1hlCvjD25DtaqyDNQlLcH+ozbbPLE1cHciS2ZGOTF4ziTa2wyZ8Xc8FMhCEidS0p5zRApbtytKsXswCjXeNVMV3U5qIkCtq1TKWRbSE+NNjYVyWaCFx4ddjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <95c6eb65-44ef-4a2d-8353-27363b952076@citrix.com>
Date: Wed, 21 Jan 2026 10:44:41 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 5/5] automation: Disable ucode loading on AMD's
 analysis run
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-6-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260120093852.2380-6-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::29) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS2PR03MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4cc9db-7a26-406d-8739-08de58da16f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2R6aXJ5UmVSWEErOEl3Q09KMEJxNitmUlR4ZGlqWngvQ3pLMEo4MlZPejB0?=
 =?utf-8?B?d0NhV2E0UDAvT0F4RDlOcU53VU5GRC9YRFF0Z2VDSEE3b1UzMkVpUXBsTDV3?=
 =?utf-8?B?ZGM2a0tRQ2g0QkRsRmJqVVZnRWpxQ0U1TlNBTjNibE8xTDdQN21LajJmVkFH?=
 =?utf-8?B?MDdJSW1CaWxhR0JZdG9nVCtLTVRPNEdoRTFXOVNHbENiaE1wTnB6UlFEa3VL?=
 =?utf-8?B?SjRDVFN0RXBlSi9Yb3lzVkI3TmdqU3o1TE16ZTZSTG5QSGxCczJxZ3Q5cVI2?=
 =?utf-8?B?R3R4M01XRXZvVy82eUxYL2xFU0ZCV1g3ZzRTNlhQOEhwekhxcmFZYUh0MUlH?=
 =?utf-8?B?UWlnQSs2S3FHR3FqVy9CR0JBa3JLM3NGYklLZllEdU9pQlBsZ1hvSTR4Y0ZT?=
 =?utf-8?B?ZTllaFd6OFVpTDY2OEtyTmZFSjNBeXd1MlE0aytpaXhhUjdZakpRcmRKek0y?=
 =?utf-8?B?WEROUUtWSUxFVHVWK0VRK3o1RklTTnV4UUNmengvQkZLY2NXTWtMcWx5OHg3?=
 =?utf-8?B?QStCQU1jRDdEZjlQbVRMdmlTRkp2aWxPb2hxN2FJakhOQjJOdEdrSnhoUDY5?=
 =?utf-8?B?YW5hUWZnSFo5UjFWRGUwV2dlMnNqRjhOa2tzcDBFclZXLzBDMllFbXFTNDNC?=
 =?utf-8?B?OFZOMjNaTlEvMFJvMGlhME85YVF0bHhlSEFGN1FiWXV0eG9Pb1dZSUpyYXRT?=
 =?utf-8?B?OEpqeTVTMlV2QUpWcGNPb1JPYkxhMnI3VHZzYitNUFI0NjJIU0tibVc3VUZi?=
 =?utf-8?B?Qk11UUxkcEo3R3ZPR0tCZHhCSkpzTDhiZzVDQUhveHZ1MWIxMVNKZFh5VnpG?=
 =?utf-8?B?ZWllTDJUbjFIcVB0N1U2UTBOWlA1eGt2WTFDZStiSEVwZTRyd1NNZWptZFli?=
 =?utf-8?B?Mm5OaWNTZnplNzN2L2poK1ZtWnZNd3N5RHVzVWU3ZFkwVkg1Q1c2Q3RaUWRp?=
 =?utf-8?B?K3dLR25UOHRUcm5hYWk3dmg0S0ExdEFYSXVjbDhBQTgzOStxTEt0R0VwTnc0?=
 =?utf-8?B?VEJseS8wTUhWOFZlUkVwNnpuYW9SaG5oMzQvNjU4OXU5TFRmQ0JMZWdwME5h?=
 =?utf-8?B?b1o4N3gvbWJPVzdSRENxSXZEbHNSclF0SDNmeUpyNXBmOHJJbFZBNDZOVkFT?=
 =?utf-8?B?ZFVBZ0wvNHY5Z29JdklXUTRIUlE0aGlOTVZkSmVIMTVIOEdFTXMvMENWUFVJ?=
 =?utf-8?B?VUVNK0puQ09ZbVFMVDJzMGJrWEVKakJhanJuMDdZZTZxK1M1c3YzZkRPY2Jn?=
 =?utf-8?B?RncyYWhNQ2ZaUTJmN2lLRU9RWUdYanlXT3Jub0t6VnNEQ2dxVzlHeEVSbnJD?=
 =?utf-8?B?V0phbE9LSWp6OG4yemtUelp0Vm92ckxYcGNHai9Ybm00NVY2b1pzMHdaQUJv?=
 =?utf-8?B?QzVqSWtPb1RMNU1YMGh1ZXdSbmxLbzNrNDVFY2d3ZUlXS1Ixa09aUUxkK3pW?=
 =?utf-8?B?cnI5T2U0K28wSCt0b25mNllhNWJJQWZUWCt0TXBkcGFQMFQraW1NaFk0b1lU?=
 =?utf-8?B?azBLK0tqWjZkUlE1bTNRNHV5WC9UNmJ2bXoxNEs3b3VCcGQ3L3UwVm0zcTFZ?=
 =?utf-8?B?VVk1VUZxd0Q1TEZQL2VFWkx3T284L2hZU0daRHVmV0FoT1VSWVhZaGxaWEFK?=
 =?utf-8?B?WFNIbk1pT24zdmJBQ3BlbEUzbG1saEFRMWpQLy85L0Zpa2NjTWlXSXo4TW1m?=
 =?utf-8?B?dWZSQjl3ckNjTTJvcHhtdndFZkFwMG5zMWFOaVhhSFJCMXk2d3doOXU1cGMr?=
 =?utf-8?B?RC8reDZuYWxCeWpWb1djdzh5cWxxQnJoRFpWdVdyKzJ3ZkYxd1h4QXNUTnVt?=
 =?utf-8?B?dHVnZjNoL2JZN2c1Und0OG9jeFFBUXY3RE80dU1icThqeFRqWHV4V2l1ZXV3?=
 =?utf-8?B?WmFkRTkwT1Z6RXJuM1FCSmJQNllSSmlJMGlPZjc2TkJDOWZKeFN4Z290cjdN?=
 =?utf-8?B?TXFndVNPT1ZobDhIeFZnQmtQQ0wwS3Vtajl1cy8ySC8xaDVnZitTUEFHanJt?=
 =?utf-8?B?dDZGQlU5bURsL3BpajRQZ3BuQURVVkYzTkNpRktaREcvbzhJZ3dnbVZMOGwx?=
 =?utf-8?B?VkYvZCtnUzlNR0gzWllXNTI0SkE1ZHhuVGpkdXE4VjN3dHUxNGsrYWk1UEFz?=
 =?utf-8?Q?10Ow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGx2dXhpWWI2K3BZS3MzYkdKcHM2NE1xaVFuVlNVNjBjQ0RDR1pvUkdtYitB?=
 =?utf-8?B?V2U0VS82dHdTUEhvQWh5bmFUdDI1c0MvaXNTUFV1ZmVjZ3ZQNXVPWEZncjdP?=
 =?utf-8?B?NWszUWtIMDZ1MFBWdHo1Q0RibXo5V2cxN0RDY1FxZ09ab3dyOUo0b3hPaHRE?=
 =?utf-8?B?bG1HREt0SEsxVmYyY21wRUV6eXJBeW4zdWF2cTlTTkFLQkpGNVNxWXZsOHNj?=
 =?utf-8?B?UnNCM2srOUQ5NUdDV2VLcVBTemlVNmlSRkRraDhCbTkrendzdzZzQnc3aXNo?=
 =?utf-8?B?U3ppTzFlUDArMCsrdDNCdFoxc2x1ZEZWbWlTYjJkWXNFejZXRzJTWFJwUEV3?=
 =?utf-8?B?N1VZL0RjbENqL0N1UWpJeXNTcGlRRThOK3kyTWs2SldVbnp6Yjkvd09MUjhu?=
 =?utf-8?B?M0dMMGJnZDFWclk4dW5ZUHVGaHBFd2wzTDRGMlZoNlRONFdETjBsVWl6eFRR?=
 =?utf-8?B?NEE0QTdDSGdkUWg1QlNhN0pNLzlrd0hDNkhOTDFCaDhSMHA4UEV6czlJUy9q?=
 =?utf-8?B?aUZkejlSWjRld3RYd1VxcVlxNFo5V1htZXc0UCtjVGNSdFF2TERvK1BtKzdp?=
 =?utf-8?B?bWVwbW1tcS9GeWduQkNyTzZNS1RHZFByMWRPUTNyd0pHUCtwVVRhRW9HMUNE?=
 =?utf-8?B?dkFJZDNQWEFrZlo5YisrYzI4cWlvSE01VngxN090VXJaZzlyQkd3eGtvVERX?=
 =?utf-8?B?emRNNXZIZm5ucjZFWTk4Z2ttZ21JUCtSUnV1WVIvUE9FRXNIM3FSd0E3MFlQ?=
 =?utf-8?B?R3pJelBGckpPRW5iUlRQblV5VC90cnc0cGN2L2xlVm1xc254OTFuQXZQSE85?=
 =?utf-8?B?SmFBbDZYWXEvQ2tWWXhzYlYvV3UzRHFPMmFETVhhVFdWaDR3TE5MemhhMG4r?=
 =?utf-8?B?MzkrT0daQ01CeXdvTDdkeDRGRTJvcDJxNkVEZTJ1YjdJV3lBaldqVWhGY05t?=
 =?utf-8?B?QktueHJoZ3pWT20vdjU4Zmp6ZkNOaHZRR2wwV2NtWlBBRmI4Ly93VTVSbGxx?=
 =?utf-8?B?YzM0YzJCVHorbmVHNGZaVnhXNE90Nk83cklubGxXVVpmNGQ2MUFKUkM1eDh6?=
 =?utf-8?B?YUtOSVdNckF3RnFENmlqS1hPK3M2Z2NYNWoxMmIrSVJuUndsM3dXaG1hR3NR?=
 =?utf-8?B?TDdQaGw2eXpISXFXYXRmVDhOVE92SmhYQ2g5bDFORTQ3TlZaeFBZSkhrUVZl?=
 =?utf-8?B?NE02amNZQmdyUjY3dXBxMWRMTVJOZEszNUJlaXZGUDhqWlh2dTQ1M3VQZEFr?=
 =?utf-8?B?ZFp1VEZFNmREMjZraHcrRFJpT1BSbG9xZndJMUhuQVRhK0pOUTI1YWJDL2t5?=
 =?utf-8?B?Nms4dzJvdzhYU05tRUVIdFBnSjFLR1BZT1lZb0V1S25aaHU2V0VEKzdXTmJV?=
 =?utf-8?B?UDhNbXVoM1k1cjFoNFh0Z0pHQzl4dWpVSkdsWjd4cWVmN1pzSkxVVlhLVjBs?=
 =?utf-8?B?RDNiNGRxTWdnWE1zbGZHQkcxV3dnMHRDSDkvSE14RUdPQUpuUUtLQVNJYlBR?=
 =?utf-8?B?U3FhQ2I5OCtWYmxEUU5SOHNEeE5uTXRSNEVTb3U5dnBRcjRUVG1VYUYrMmJn?=
 =?utf-8?B?cXJiR1l0Z0x2RHZvSGdCKzFOT3ZBZjJMTDZoYXJEdkw5QkpzeVdlWFFoMUtQ?=
 =?utf-8?B?NWVBeEZTZmNSeEovamFPRm5QZ3ZrWDQxV1BnZVZuOW5xek1BR2R4c1U5V3JQ?=
 =?utf-8?B?N3lnY0Zxb08wcGhWcGJOSmZ1Z3pJaCt5dHY1OFNIV1o0b1NOMXdqMzlYRlpy?=
 =?utf-8?B?T1lZOHZHWmQwTjkzQXhwY21TckJseENOdUJRS0tkV0lkZnVXaEt6M1R4Ykhz?=
 =?utf-8?B?c1VpVW4zZldtYlJGWTI3MThiZllSRU1GcDQ5Q252anI1VU04eTRGeno2LzZL?=
 =?utf-8?B?a1hBOWE0VVdoTlkwWEJ5bDJMVmt0S3hJV1I4OUJVNUhic0lSdkNKNlJjSm9W?=
 =?utf-8?B?dGk2MytVaVhMc2FGL2Y3bjF5S2ZrNEJvaTZ5bCtGbFVtSkRUV2FKaG55dkZU?=
 =?utf-8?B?RUwzdlBDTDVLakVtZHBHWG83SEFYREtoLytCMkY0cmk4Y1JxZld3cnlDZXJR?=
 =?utf-8?B?WW5BeGFWdjEwM0hFY1dkVi9jVUEwT2FjM1lOVkFPMkVVVzNRb3VHdlpHVXZa?=
 =?utf-8?B?a1JXRG1vdmJiaHVlSGIyeUpJbFlkVmlpeGhKOUNoSHZKSWJPVlA5RXVUU01S?=
 =?utf-8?B?S3dPQ3NkdFBXeU13M250MHZPTDZMdWk4NEhtcytzM04zYnBVRm85R2dvRnh2?=
 =?utf-8?B?UE44aWdhekxrSXZ1a2Voczk3Mm1JcTQxczEyM1hKNlBoUmlwOFRaN0hySjg3?=
 =?utf-8?B?Y2NkcE9LWnVvUXFidGR0SHJHTDJ4WlBUVGtYSXUwMEtYRjlydVN2U1dyOU1q?=
 =?utf-8?Q?ftqfLAwret0R7k54=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4cc9db-7a26-406d-8739-08de58da16f1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:44:44.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pQAVlVOT+paxDOPPRyfQdLaHgYQKKWoGW14oEZ50th1eKgDvMucnhETsIIMRfwhzbFDP0ofz8SmyeH1n7YnZvPtx+GFONpBiBXaBBACq3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8465
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E2F7F55706
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 9:38 am, Alejandro Vallejo wrote:
> Explicitly set CONFIG_MICROCODE_LOADING=n
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I've discussed this enough with Stefano in the past to know that it's
part of ThePlan(tm).

~Andrew


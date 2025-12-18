Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B2CCD222
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 19:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190126.1510760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWIbZ-000433-Hv; Thu, 18 Dec 2025 18:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190126.1510760; Thu, 18 Dec 2025 18:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWIbZ-0003yP-DT; Thu, 18 Dec 2025 18:20:01 +0000
Received: by outflank-mailman (input) for mailman id 1190126;
 Thu, 18 Dec 2025 18:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6E0R=6Y=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vWIbY-0003qp-OV
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 18:20:00 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29522fa6-dc3e-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 19:19:59 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7444.namprd03.prod.outlook.com (2603:10b6:806:398::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 18:19:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 18:19:51 +0000
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
X-Inumbo-ID: 29522fa6-dc3e-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtWvcpHi7Bnuw+zPd0MJhXAWD7dgDkCLDET0Aid+8BjTwOen/fr+cMm+8+r7I3D6+5S77CD0ZiEKx0a8P0TZ5sVeklmU/5Rnfax+1G6zJzvW0X5QudVn2DezZxpTFLaFth5aT74VVWD5zhiPAUnSIDHnwq+iYpP2qTkv1IGinCuh1AOql4WX6PX7NjaNTzAld/Uoz4KH7vclSaixim3iJpiYNJ5cb4RnP4uLlCFoiTBf5FQkAddPVgj9RZShYgSBRlJV+ZRKKDvvUzL8MUtf2gF9YrB8Oh2AiLs0xzUpVj9WYzbIsJrhkXodVXpAeHG7Wv4xH/z8s/6YsXMoGRX7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OdRRQa8t0+XY7qJlOwaXc1ncWpFT2D7jETm/Em3mDM=;
 b=KMJFe236qg+gEtY29Z9hN23bphibFJIAuj7hc8t9sbzh0OzAxFKVJtGMTa8SjZTSwqolNpRVZQLjvSVbe9FFtC1JGqMNA3C2crPtWGK+tq7hDoQ58Bl0sW6JKlOfbaspFPo8vUGkEQ+6qNjoorbjCvx7fhUpi4QMl/Q8FlLVz0DGU/F5jiNaeY1i6PN9kM6PHy4vtfediTzvdVYnGiSAFQeQ38iQ41S0qawQwyU8WkECRe4Qo1bbmqIQ3dxT0BnDsFtkM+Ivs4xcNbBaPj7fc4rN0wOuB2CW7+2hauxJyab3bts+voXLFozN99RlHRl/RN6oGBVlJr8FmpdBOydC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OdRRQa8t0+XY7qJlOwaXc1ncWpFT2D7jETm/Em3mDM=;
 b=H3ZR2KYyLIfl1FlcbPKoPd+n+Q6kNevpE+oo9Jn/c+MhoGx39iE/qLkcHxORYV+Xdz1uzDG+SDfCuuZSHiqQnu7UqOuZICj6gTEJcfYsPmIs/5S6z2I5NATSSzL6tpGSPTjQkPW43ulWmEb146lSFbEtQzYCGPT2pK1Vtci3oVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <acbc46e0-e102-41cc-ace1-578a20644b34@citrix.com>
Date: Thu, 18 Dec 2025 18:19:47 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <74f1594aad235765002b59f2baa975cc8fe72f06.1766053253.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <74f1594aad235765002b59f2baa975cc8fe72f06.1766053253.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::32) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e97281-b565-4ee8-47d6-08de3e620930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dW9oZGxla2pUa1UvZUF5ajNnTXI2YzNtOFFoUGFWWlFsdzdWOEZzM2hXbW12?=
 =?utf-8?B?RkVMQnlNNWY5aW9naE1KS3cxbGFUK0JqeG5WRW0xQ1VzU2hhUGNDNExYcjJy?=
 =?utf-8?B?RzRCL0dobGpqVm5GaEQ3R1daeXoyV0hDV0UzR2NTb25JNDNpR3FqK1kxTi9R?=
 =?utf-8?B?YXd1b2cvVDJtU0JsbXh0bk1INFdaNHdLc0o5R3huU0lQV3ZoaStzTDVOWVBQ?=
 =?utf-8?B?QlNKUWExNjVuMittWHdTcWMzaVg5ZW1oVTNLRndXQmJGR0UrQ296K2M4ZTFT?=
 =?utf-8?B?VkN2QS9WNDhSQk12UE84bXlHSmhyTytGWjkzbGoyL3BmMmZXL0dXZDBOYzNu?=
 =?utf-8?B?U01veFVXZFo0a0xZcm9LUEc1NTg3Q0xKbmxlZlZTNDNPTzFFeEQ0d3ZqeWFr?=
 =?utf-8?B?YTJ1U3ZLQWpXMHdZRXpyY2NjT243emwza2VURHNqand4UEd2OUM4endpRXBH?=
 =?utf-8?B?TjBoQ3lFYjk0VmRkam5kVjYzL0RZQ1Izb3NySlNDakVzZ3I0MTFUMlNBb2hC?=
 =?utf-8?B?b0JMWUZ3UmYvV1QyejBnT1JnZW1MT0JwMFdZbkdxSVA1TnRlc2o5L2wvYjBr?=
 =?utf-8?B?YUVVRlBBNDdIcFVRaXRJZkZVbUdFTEJiems4VnFYYWhkZWZzSjFWYW9IYnlN?=
 =?utf-8?B?RFVHVDc0eUFtSDY5NkQzZ0ZDTkI1STJQSlZuMFFiUFRJN0ZydTJUVjVla1p4?=
 =?utf-8?B?YVVkK3k5aldzWjBEQzZ0WS9QOEcxZExnRDF0a3dCS2ZOaTR4UnV1d3JibWE0?=
 =?utf-8?B?UnU2TjNWa2xwelRBR2JUVTNwazc2TEZwTGFwbkttaDF6a1lSeFc0VVU1ZmNI?=
 =?utf-8?B?OGdJRTZPeHpqTDVVUjd3dWZ1d0dCaXNxOUh4Qk9aQUc1ekxPSHJZSEw0UUNp?=
 =?utf-8?B?Qnkzb0p5dm5qR3VEelBMK2ZZQWxLTm52N3g3czEvci9EU1lSSEc0UFB4a2Jp?=
 =?utf-8?B?UnVVbFNWTXpkQ1B4Qy9sSVZTTnpyb2IxZDlLNmkyZUxaMTVuQlYzZzNtYS85?=
 =?utf-8?B?ckFVNVdiemZiQzFudStKYnRNTExkSE9MN25hTUVycFpRSlZ4UjZsV0paVWVY?=
 =?utf-8?B?UHpUYThoTURHcG82WjdpZ1AwUGdSN2pzSjluYTBvNENOK0o1N2U2SDRQYXY0?=
 =?utf-8?B?OTBRSHA0QU5nUHNUSnBZeTZINXkyUUN1ZGN6Z1hSZmxmdDlvOXc4L3ZCTGFz?=
 =?utf-8?B?ZldCTmN0WHk0bVFyczliR1UzMWhnTHZscjFWb1hFYUNNdFJYeWRVVlNGMTFM?=
 =?utf-8?B?THVkTzZ6M1pjcllzY0kxSnJoaEtINEk3WnVqVWQ2UjJnVnVOdk9WWm9ObmFX?=
 =?utf-8?B?MEkrS0F3SnhCVjBXbEdGNjZKcE1QejBTVlhYbjN6UWQxVHRyMmpFNjhDaFZF?=
 =?utf-8?B?SkNRbjZSWnphL1BaeTVDbENpUlIvSzNDSzlUNjlRNC9MWWovcWF0YWxuUWJT?=
 =?utf-8?B?VkdrdjlFQjhxRVpZcnc5TkNKQUFsa25pWHZhVThhL0tvNlFGcjJBVDVCekk4?=
 =?utf-8?B?TlFWLzZGQkQ1OVNpdFpuR0pHRXFDVUJOSCtpeWg5WStqOEpGWnl6Z3JUSlRl?=
 =?utf-8?B?N2FaeTlLN01WdzFWWHlHRTZHeUdDMy9UQVg4VEVSYzk5NjdKYmIraVkyWlJy?=
 =?utf-8?B?dTZhcHIzVXo4WkFaR2srSlhsOFdxTEZUOFJ0QW56ckVMU2U3VURSOUxnSWV1?=
 =?utf-8?B?aHJSODBNL2IrTXdSeUdaYk1SRGVkb3FyQnVxOUh6ZHRxNjIyNUM2dVVSYmNt?=
 =?utf-8?B?M2RlczdPMlNqTnV2eTdUMnlRREpjQ2x0R0x2aE5LcXhEZE51Nk14aGlXTkFV?=
 =?utf-8?B?UnE1NXNWb08zeEgydE9nK2dGdUZoYjlLcDdwbElnSStUd2pOMnh1ZlUxbEFr?=
 =?utf-8?B?aU1zUGJLam1PbXRCMUFheUErejRRL3F0TC9hSEphTnpqdEIzbnVKMVhXczBn?=
 =?utf-8?Q?xokm/wIZntrhLpLHVmBaHLLitCGqriwH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0dPcXZNck9ZeEkxY2lmdDNPTnNCN2tVREloeVhjcDEvcG11WGlNMjd1cGQ3?=
 =?utf-8?B?MjRNNGJKVzdqdklIeSs1Uk5LeWR4RXVGMlZiSkVHemh2NGQwK3dMVmpIYnVn?=
 =?utf-8?B?djBEN21UNlJCbXZlMWpJU1Q1SWVENnFuZHp5Q2tBb0hSSERsZEVMWnZZVG5V?=
 =?utf-8?B?aVEzR2pHaDNBK3hQaWRoRWVKRHY3bjNnRmZkTUtnUXFFUERpWFlqaFZ0cVpZ?=
 =?utf-8?B?dWFVTlU3WVU3OVZaZTNUZ0trMGRVSVBZMlk4SklCK2dkUWJHcmtXS1pLa1ZP?=
 =?utf-8?B?Y0J3QmJLZU1zemZEbFVUQkFDbVlVTzVRTDFTaXlMdUVMMHBsRkdJQ3dJbDBh?=
 =?utf-8?B?ckNaeVlOczM5Uk1WdkwwTk1SQUk4UXhDUGZXOUZoTXhPbVVTYWVqU0RuZm1Q?=
 =?utf-8?B?VHRjWDh4UXcyd09wWHRSMEZXR0JjTkxmeVRCU3czMzdBS0sxaXJyUUJBZU1F?=
 =?utf-8?B?N0o1cmlWcEh6ZVVnSG9KTGViVkRjd0VueVN0ZEdVcWF6ZEl0Z2NuNHdkWWlK?=
 =?utf-8?B?clhUTFNzK1pXYWpDd3lPRU5adjZDb1R2cmI4OGZPZEVrWkpac3hwYmgrV1ZG?=
 =?utf-8?B?eVVJVUE5Z1pQQjNHTnV3S2ErcGJoTmhSMmVhd21CaTk2WUVTdk9CL1krNHZU?=
 =?utf-8?B?VXAxM3ZWNVdtODRsS0hzVXIrRGsyUzZTSzRpUE9LbSszdTZxQnpMRkRHck9O?=
 =?utf-8?B?djFkNmlPSDJaQllhMmpTMEVYSkpZQWtXZGVJVzZMNUgyUHJvZUU0VWlkRFQx?=
 =?utf-8?B?T2pVZS8yWTVUU0c4OHhocGhyUWllMFpJNVVuSHBHQk5EeEhwdlNVM25NODhJ?=
 =?utf-8?B?WEFxSVNBeTd2MCtCYlhxVUYxbkdoNkkxYUZZcW8yRTBxaHVhMnI2VE5MS0FI?=
 =?utf-8?B?RGJHSjZtM0xJN05Fa2VYNzRtNDJJNU42ZVpESHdYM0J5RTI3RFRyUjJNNkVo?=
 =?utf-8?B?ZXYwblJMK3AyWGF4c3RTVzZ4Y0JBdGxZM0x1bmZ1c1RZNUtXdFQ2c0dNMWJs?=
 =?utf-8?B?dTdLckR6Yk9yTVhXdW5EQmdOMHdUVjVpVzBPNXFBaFVLUU1ISkxZUk1iQnN1?=
 =?utf-8?B?UWVEalE5ZFVqZ1QrdjhQM0xXc0VFQk1aS3ZabXRIaWMvVjg5WldKaUNSeTk4?=
 =?utf-8?B?QkRieXBCSDlMcGVlaHc5QVd5NGU0OHhYMWJRdStsbFkrY1BVUjNxZmxZTzAr?=
 =?utf-8?B?VGR0aCtWcG5wUWR1ZXF0Yk91ZGo0Nk9qS3J1a254RlJmbmJqZmxKdUMxT1V5?=
 =?utf-8?B?N2U2U1R6bHdKM1Qwck5tZkhQblp1SlFaZ1NYZkJvNGwva09SSWtaNDY3S0RK?=
 =?utf-8?B?dndMeFd4Y3FmOEJzWm5LdThmZm9hTkRVV3doUW5sOU56em5SWlg2WTZCcWVr?=
 =?utf-8?B?aHYrU2FHZElMclJ6eVJsZHlPWnpDMEdFNjJRRHBsKzFJSnlyQzRBNDR0MFZt?=
 =?utf-8?B?UzdibnF2NWxiS1NCM00xYzB3dEdGZ0ZhYTF5QnBoVFR0QU1WTFNNMU1ocXhx?=
 =?utf-8?B?d1BFbUFTblBLeVVaL1puRkFzcmRncHJMaU0vTFdTTGJrazNRNGtOcXh0T0xI?=
 =?utf-8?B?SEI1ZnN3dHpzb3FQTnl6b2FEeHdVWGtpYzc1K0lKQXJIczlRS3NMR3NXQThP?=
 =?utf-8?B?NjRCR1ZBNnAwa0lRRTVDaWJRdVA4dTlEcktFdUhqelBxdXgxZ0U2S3dLdFNt?=
 =?utf-8?B?a2w1SC9VQ2llVzJiM1UvczBQdi8xRHdsMWxpL1BTNG5SV1FGVGNGaGkvUnZ4?=
 =?utf-8?B?bldZd1JPZmQ5MmdlMit2ZnpHNnl5TmQ1cStydFVIVE9QMTVJay9YRTR1d1N6?=
 =?utf-8?B?ZlNCMHBqckllUmFMTjFJSkY0U2ZuRnlGYkhFUlc1VU1YOXZxWVRCbGtYUy9s?=
 =?utf-8?B?SC94L2ErbkxUU3plSjloa1k5MitiMnp2TnBUbmtSRWM3MFpvd29EODlmenhO?=
 =?utf-8?B?LzlHMmI5ZUx0WUFrdCtkMWhSTWdqYXJsOTViZGpNamhHY1hmT2pkNVY5K1Ay?=
 =?utf-8?B?dlpiZVFxRWpkMTlDQW5BTjBQc1hCQUFVbFNyNkhNTVBIR2xnYTViRVNocGJI?=
 =?utf-8?B?VEtsVHJnTVhQYXE1WEpjYUxWeGhPT2dzUkhxNDhiMlFoOFUvM0dMSjJlQnRy?=
 =?utf-8?B?WGMrcjJyQ3ZHZWZXclZhKzhnSGxoVXdPVWRLcTRlaWo1WXZzRlVGaENGMTIr?=
 =?utf-8?B?b1VtOTladExwbHZjdDJ1dTVPU0tjSS9hMU9KUFV2R3BhM0FuOGxaNVF6WGxn?=
 =?utf-8?B?eXBXZnFtUk51WXA1V2Y2Vm83NTMyZEdQbW1OYW9UNU9DZnBMSXplZHBFWWFm?=
 =?utf-8?B?L2VucnFUbTJ1ODduOHJVTmJyWnhVd3JQU0l5VDJHSzlpQWF6c2JvL1JFNUdF?=
 =?utf-8?Q?vQ3W7hfZ9JbOmink=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e97281-b565-4ee8-47d6-08de3e620930
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:19:51.6493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uk3efgvx64GUerspMYdcECIv42HgRqR/2ygdERo8JnNwYv3iqYNyZ6EjLqTdqZem5I/N9sN/loFyE3WyWErHFt0PWcO5OaqDsyYpfnyyYEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7444

On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 47973f99d9..e566023340 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -473,36 +473,21 @@ void dump_pageframe_info(struct domain *d)
>  
>  }
>  
> -/*
> - * The new VGIC has a bigger per-IRQ structure, so we need more than one
> - * page on ARM64. Cowardly increase the limit in this case.
> - */
> -#if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
> -#define MAX_PAGES_PER_VCPU  2
> -#else
> -#define MAX_PAGES_PER_VCPU  1
> -#endif
> -
>  struct vcpu *alloc_vcpu_struct(const struct domain *d)
>  {
>      struct vcpu *v;
>  
> -    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
> -    v = alloc_xenheap_pages(get_order_from_bytes(sizeof(*v)), 0);
> -    if ( v != NULL )
> -    {
> -        unsigned int i;
> -
> -        for ( i = 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
> -            clear_page((void *)v + i * PAGE_SIZE);
> -    }
> +    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
> +    v = alloc_xenheap_pages(0, 0);

I know this is only interim until the next patch, but
alloc_xenheap_page() to match the free function used.

Personally, I'd merge patches 2 and 3 together, because everything you
touch in this patch is deleted by the next one.

But, whatever the ARM maintainers prefer.

~Andrew


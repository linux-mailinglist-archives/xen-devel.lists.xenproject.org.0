Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32636B59471
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 12:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124624.1466902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyTLo-0005TP-Re; Tue, 16 Sep 2025 10:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124624.1466902; Tue, 16 Sep 2025 10:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyTLo-0005Qp-Oi; Tue, 16 Sep 2025 10:55:56 +0000
Received: by outflank-mailman (input) for mailman id 1124624;
 Tue, 16 Sep 2025 10:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/dE=33=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uyTLn-0005Qj-1J
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 10:55:55 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7004f1e-92eb-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 12:55:53 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM7PR03MB6418.eurprd03.prod.outlook.com (2603:10a6:20b:1be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 10:55:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 10:55:51 +0000
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
X-Inumbo-ID: b7004f1e-92eb-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUGMLzTyGjwok8m7O9nuKgs/Svthsm3ISTvQbYhl+OkUCKHFuBUdo1gk843rSy/o3Emq1/hAbunNunRlC7glfEUzH6Oc9SZGGvfMRk0JCg1IETTC+t/bIxaE8p15nyDX0cHaQffbW2vAo7C6IvS6Bv7Pfcxb+E4ionFNDgVHBURheM6GHgiKUJxURdBsQLzBB1EiW0h2wWKE1Tt7zvyzMnioWUrcI8e+Z7PrOspHgrbzoQOeE9dEM373vWuO84BFWCPQUg9x+vVh/W4YYaFS0zjbfhf5oPEL81vRJ9wg1cUMTT3IrAX3IthmbN3yx9g3DsPCFja1AHSTjsWvgykNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QawKr7LjBAp+OlI6uqGWIkXkO+C1u8qxqlumOft6VDg=;
 b=VKy6f8qCOvbg6PDNOeUh9c+ebXDLDu1unQ4tY28QNptswsg6sNUkQCPNAm44jrZHw7Dk7ypAI8OwPoGmEv9V+XZO5fyWpoTj/QiZRazSL91cj4DFsMlEDDzx++xT2QSOAMJ4PwO9oFtBMj8QougcvI/yPuU5bi9EGMEeXjaZHsjz+5GB8MU7NcS/HhfPEVlT5NRJrddgsHIr8RN6sPl8sWyg/osb0Rcz5KWz5MBijkN7zHIgrtQeRrsEpdSrKj3RZZ9Tm7qx9ymZsmr2B+r3X+3UPawC6VUtF8Mv+ydPkLjAuFQqrtfL3dM91iPO/IZaz6keBwyeYZmbeA5to2LQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QawKr7LjBAp+OlI6uqGWIkXkO+C1u8qxqlumOft6VDg=;
 b=FxNx5LQMxO6E1UCp/NGy/n1+46YHPP5ywG2CCoedV2/wrCeEOGjSeFRuh2IR/iYoG9WXhAZTi/LHKGEKW1yD47h2hwEbrio2UAq9AN3BS9c+PooCDicAboqkCrAYOEVXeLtjAMvN4kiuBffnPpfiH2XDiP3sIdREKX2xsF/7JI7QKsPFS3GUjQebos7iL5IVeUjS1Roj4221kMCEzPM5RJUw3oo+NrgA0/0nHgm50XT0RuGMvR5290E7ih408e9Ek0vRu/KwQJgFGLCME/4cW4l/o7B0kx1cidkN+Rl1KPeJ80GkqDEM/ee6nXqYFV/+ZWj0cLYas0d6wOd8VDgIIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <bd0d3670-51c7-4c60-9b45-201f00a14b8e@epam.com>
Date: Tue, 16 Sep 2025 13:55:39 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0286.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::13) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM7PR03MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f0a16d-f71c-435d-8222-08ddf50f99b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDR0aURpbzlWTkpCUXNVcGVGUGttWTZuM04wV2tDVGF5YS83MEl4UTdidW1p?=
 =?utf-8?B?WVNxODFQY2dmdGdaZjl1S3M4NXJEMHZOTVQvYm9UbVJ5SGxjNXlYTit1VlZ5?=
 =?utf-8?B?MzRBZDRhb1RUZVNnTi9TMjdFdTlqZk5OV1laTnNEcmpFdWM4NnV4cnpodXJp?=
 =?utf-8?B?TWwrdnV5RmFCWllJYzcyR0svSWlGQVJCRElnUjczbWVrNFQwdjhLck1ZQjdI?=
 =?utf-8?B?TkhnQzdiNkd5YThxZnBLa0F2ajJodS8vTGozczRtZzcwdjE1Wm83VFF5WXht?=
 =?utf-8?B?YjZTUWFBQWhEM3IrcWpvS29zNFpTOGJyTFQ4dnFSUjNWNjRGd0R2RkpXWjJr?=
 =?utf-8?B?di9QL0M1cUhpU0h5TE51UmNMa1Z2aFZ0d1JPRWJ1YU1XMmNzZG1HWndxR3kr?=
 =?utf-8?B?bDZUcVhjaWJlMVZDTXZWVDFEVWx6SHU5OEhkK01iQXRBcjd5WFl2R0w5ZytL?=
 =?utf-8?B?Qm02Q1ZZb2JFYWI0S1RzaU1mdWtWY3dxOWRueVh0MlltZldiMVFvL0FvZ2Rs?=
 =?utf-8?B?M0RiTUxDMUZTR1BUYzNFSVR6WEZRZEVVRXFVK2pvRGNQY0hzWXVnanJLeENw?=
 =?utf-8?B?Q2lOeG9ZZlBZcWhUbnplcm9xNFJOTWhFK2JnWTFiNDA1cUNiRThZU1hxODBF?=
 =?utf-8?B?dlZYZWFKWEtTQUxIM2trNTduREhoVnA1R0x2eGlLMFU1YStDZWNwTTB5MFFn?=
 =?utf-8?B?Y041RjVLNDhhWlc1UzZPUFl5dmRQbU4wOENtSXJVWFJwOFpWSm5PN1FZWTNW?=
 =?utf-8?B?OERCcG1QUXZQS1VmMUJGdkpScm1RTnJhdS9kMXhWMm5qT3hnRFovNkRUdjFx?=
 =?utf-8?B?VHBWYmJoSVZjN1hjaVVzNTE2bVJzeVVRNld3dVc1NEhPZy9RMnNBaHg4RXJz?=
 =?utf-8?B?cTUxTTgzRFhQdkZ1dldzdk4vNnhBRTNxTG9BNEJPb3RBVFM5cHc5T1dZLyts?=
 =?utf-8?B?TUd1cDNNL1BvdmlBY2ZPOG5Bbi9oMVo2UFpsZ3dwYWFhWTE3K0tzVkpCZlgv?=
 =?utf-8?B?NEpnNG84Y1h4QzZoRmxIcTFMQ0tqRFpjMk5nRXZ1Ry91aGpTNVF3WWdReXUy?=
 =?utf-8?B?V3FDdXdwVmVFc3lFOTdNcktkSVpJd3NScGowWk9FV2xGeGs3dzBqUklHVnVm?=
 =?utf-8?B?cHNGemFVNDkwUVBUbHpGWEZmK2s3SXBySmVYN1Y4UU1WWXo4T0I5L2ZTR0Fl?=
 =?utf-8?B?cno0bFp0Qmo3UjgwUS9tbnB0LzVrc3JvYTlweGRtcWpOY3Nhd3BwZE8yOWRM?=
 =?utf-8?B?NkU5ZWc1Wmd0c1RaWnB1NjlaaTVId0tJY3RONTVqdUdCdzR1ZlU2NjhCdlNi?=
 =?utf-8?B?Rk43eEdWa0RIT3FhQlhxOEs0T1Z3eEdBWDBnQUhBUmJUdnc2UHI3Tm5LTWxu?=
 =?utf-8?B?b0c4bnoyZzYvNVRMQm5kMTJoQ2pQaXNQT2JoQzY4bzJnMjk0dEt5b2s5QkJT?=
 =?utf-8?B?Kzg2andzSWQvWW1zeVRXVHIyYzMrMmdyS2VMRW55Ti9hL0ppMk1ST3VJS0JY?=
 =?utf-8?B?S014cEtNeFRZZ3VCYWpCOVZJVUg2dlNHTENwR0ZxaU52WDdvbTMyejNVVlox?=
 =?utf-8?B?dW9OV05CVHUrZzBHNU1BMFI1MkhLZ053cVBZVm9yUi9iUFpibjBQQXAyK2c1?=
 =?utf-8?B?K2YrWG53QUNrM0NtR1dUd2J0QjVWYXhvVEEzVWJING1RVUppNVBRWHBRZlA4?=
 =?utf-8?B?OEQwVDlOK1BqTGM3WUV3VFIvaE9Hc2c0Rm1JM3JoNnloQVFmb21mKzdydS9Q?=
 =?utf-8?B?SlhGdldUd1ZEVmxabHpmZkc2cGp3blVqYjhFUjBEVHFSNGVaY2ljcy9QYmo4?=
 =?utf-8?B?ZnJKVnVzVUR1ZkxEZFJJYktsZmNteFc4RDBsQm9DdlFnSFc1S254NGd4M25Y?=
 =?utf-8?B?U1Q3cUNONVBtenVCbSszdzlpQU9vaEx6WmFNWkpKT084WER5Y052OFRlOFFP?=
 =?utf-8?Q?9t0VSgu3bF8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckZsSnVrNjJQTlpkcUtmWm5Qazg1ZXBjUHhMT1ZoQTFUTzhyMDJmb1pIM1JS?=
 =?utf-8?B?aDFGanRiWlZpZ3llbnI0b1paZWtGYjFscm9NWTVxeEZpci96Y2RWWUJseXhN?=
 =?utf-8?B?VDY4UHlCT0dway8yaXJGRmd1b0Y1ZzhwTU8rRS9obGEyUXl0RUpUUy9ndGRJ?=
 =?utf-8?B?c3Q5YXFSZUg4YzBVcURGNjFrWW9va091QmJKczlQcXVMUGVFNko1Q3ArM1Nj?=
 =?utf-8?B?cU1ubFdoQXlDUWZZaW9lOVZpcXV2MmEwQmVYNS9JTFVoZmlxVFFqaytkcWEx?=
 =?utf-8?B?Skp3SXI4SEZIMHNYM0VpS3JocTVIWFFaWWR1Mm5kWVdxT3kydlpjRThwOURM?=
 =?utf-8?B?TWwyZllaVHlsTXhsbFA2TzI0bVcvMkdkd0VKaEYxUGZIZWR2c005MjNIQkQz?=
 =?utf-8?B?Z3BiRUlYd3VJc1pmc3gyK0txN3RaSXFwbXVyaHh0T05iT2tLbkltL24xejJ1?=
 =?utf-8?B?TkJ3MWlZYWpjTUJTRG1qQUFMNGpvM0tOU2Z3MDEzUXlRNTZLa0p0alNyZGhm?=
 =?utf-8?B?YTRHTURlTjdJVEI0cUtjRTcwRnVzYkZ6aTY2SUhkL3JZSlgybldCdmQzOWNM?=
 =?utf-8?B?d2wyWnZKRmFYQ1d3bC9ITFhycWMrUkc5cU1KNzlHV0czZWszNGxFSTFjWDYx?=
 =?utf-8?B?eG4wMnlBVmhBV0orRWl5NE0wSUVxS3NBeGliajRSM0Z0amg1TFpPYTBBM0o2?=
 =?utf-8?B?b09mZDFPcUNDc0ZOQUEyZ0xqeUtsRjJML01MdnVYZ3psL2x6YW1aK1NMK0tI?=
 =?utf-8?B?TmpXaEVsN1ZOdVR1b0VqY1o3ZmduQ3c5dnQ2bXhDN2tBcVoxd0wvMnFYK3hJ?=
 =?utf-8?B?QUk4TldXR3hvNlBWYlB0bDN4UXJmWWFYWDRxdTVoaDZxaEMrVXBUcnEvVlRr?=
 =?utf-8?B?REdTMmZpb2JhYXNJMEdnZVZ6MG5uYjB3dloxUHliVjBGd1Y5TkE4cXUvd1ln?=
 =?utf-8?B?N09nanJRWXVGcFpLRXhkZUVOdU4wS1pLNDdrc0p6OXpzR0tINHJQRXFpSzhF?=
 =?utf-8?B?V0hmZjJSNXFlMlpIVWNUd3J1NkxxblVkeXJsbjh4S0NIdmpOdU5QYTRlZmRE?=
 =?utf-8?B?QXJLNWNiVS9NM1pqdC9BcEJ3cmplVTk2RExFd0R3eFF4TXlUMjNTeEUra1px?=
 =?utf-8?B?YzkyYUtoYlk4Y3dqcEhKeUgrUWl2Ui90bGo2SzdCNGJ5TUNSSlVWMCtyS3lB?=
 =?utf-8?B?OE5YUVVGZWF2OU9JNzYxTk80cHpBWS9UUlJ5NSt0YnJGZ2s2Z2UyM05CRU04?=
 =?utf-8?B?TDR1cTRlSVpVdjlWRFhSSlZEYzFGOVBDMHpwV3RXTVE2dFZCVVh2R3RMeUY0?=
 =?utf-8?B?K25OdkVEQUZZamJpYTNwWC95RE9DTTFpZURJdko3WmVVS0xoV3U0bmUzbFNZ?=
 =?utf-8?B?WW5nVDRoT0hzaGxQNFVQU0pCTVd6RmNRQlhtUEN0LzFRZys3OFhUU1ExNGVk?=
 =?utf-8?B?TDQ4cW51UTlZSHZEb1FNVmFrek1Jc2Y5UzhZSUx0NzEzME1WRm5ZVlh1cE5z?=
 =?utf-8?B?WlJDN0MzbUhPaHUwbmNkTkR6STZTclF1c2twQjFldlRWQWdWRnF5eXlpM1Ar?=
 =?utf-8?B?emFBN1J2S1NxcERmbytqbS9XMHcwdUxNajkzVkFocFBWKzNaVDdWa0N0YVBJ?=
 =?utf-8?B?UVlQY3VkVzdiM25jUDlNdTFyazJjbDNISGZlZEhMTlNoK0xQM1FsS2ZSbldq?=
 =?utf-8?B?bGVPa1h2aDFZdGlvWnRMMHRxbDlNdmJFcWV4K2t0RC94a2pxTWdDMnpVZE5T?=
 =?utf-8?B?T01OMzF6UHJhMlZOSWltVG1YRTdOMUMyU2lySDlibURud2lqU0JBdWNPbHZh?=
 =?utf-8?B?N0RLQ21zSFU4MkFvVVdqMk90NkRFbGNDQXNFcHdGSThuUW1lMUlGSE1uN0pF?=
 =?utf-8?B?Y052ZVNKZTNrTGZ6STZTYTR3WVFGVjAwR2VMMTV2VnBFZFd2T0gyb0pTVTYz?=
 =?utf-8?B?ekx5dlZMTkpvN092cHpSajFBQnpyUTJaL1hwNDdjZytDUnhYRldXN09neHlR?=
 =?utf-8?B?VjM5TEx3SGJtYzhQeTM3Z3hLejdGOFdxWlpaV2owZjZRRmlsb0dMRXQ0eE5H?=
 =?utf-8?B?VDlTMWRXTmZ1Y0tKZWFCZzFjaE5zOTJ5SGJQTC9aQVhhaXZwWk51WGVYMHEy?=
 =?utf-8?B?bm1qckY2Y2t6T215QkdEbnhhblI0Ulp1SXJXL0tUN0xBc2xuS3ZlZWRyOWJa?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f0a16d-f71c-435d-8222-08ddf50f99b1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 10:55:51.0655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/tU2yF65mbpRPZbNoiPaeqVRVZoeV95XxhLzcjLWg6XbDv7mTO9DREVMAMxDcGwgHhbGQJXJp3Jgw0WsiwAdVCvT67qQa7LrM+N+wfVH4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6418

Hi Ayan,

On 12.09.25 20:00, Ayan Kumar Halder wrote:
> Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
> Test that Xen is able to generate SGIs.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> One of the aim of functional safety is to test hw/sw interface. This means that
> Xen is able to configure the hardware correctly for the desired functionalities.
> 
> Normally this is tested from the VMs. For eg if a VM is able to receive irq, this
> implies that Xen has configured the GICv3 interface 'correctly'. However this is
> a high level (or integration) test which uses not only the GICv3 interface
> between Xen and VM, but the interrupt injection code for Xen to VMs.
> 
> We want to have some kind of unit tests to check that Xen is able to receive
> various interrupts, set priorities, etc. Here, we have written unit tests for
> software generated interrupts (SGIs) as example.
> 
> These tests are expected to be triggered as Xen boots (right after Xen has
> initialised the GICv3 interface ie gicv3_init(). The aim of this test is to
> check whether Xen can trigger SGIs after gicv3_init() is invoked. If so, we can
> claim that gicv3_init() was done properly to be able to trigger SGIs. Likewise
> we will have tests to check for priorities, SPIs, etc.
> 
> A script will parse the logs and claim that Xen is able to trigger SGIs.
> 
>   xen/arch/arm/Kconfig  |  8 ++++++++
>   xen/arch/arm/gic-v3.c |  7 +++++++
>   xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
>   3 files changed, 36 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 950e4452c1..739f99eaa9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -73,6 +73,14 @@ config GICV3
>   	  Driver for the ARM Generic Interrupt Controller v3.
>   	  If unsure, use the default setting.
>   
> +config GICV3_SELFTEST
> +    bool "GICv3 driver self test"
> +    default n
> +    depends on GICV3
> +    ---help---
> +
> +      Self tests to validate GICV3 driver.
> +
>   config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>           depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 4e6c98bada..eb0c05231c 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
>   
>       gicv3_hyp_init();
>   
> +#ifdef CONFIG_GICV3_SELFTEST
> +    send_SGI_self(GIC_SGI_EVENT_CHECK);
> +    send_SGI_self(GIC_SGI_DUMP_STATE);
> +    send_SGI_self(GIC_SGI_CALL_FUNCTION);
> +    send_SGI_self(GIC_SGI_MAX);
> +#endif
> +

I'd like to ask, if possible, to minimize mixing selftest and functional code.
Like add gic-v3-selftest.c.

>   out:
>       spin_unlock(&gicv3.lock);
>   
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index d922ea67aa..5cb58cdb92 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -346,6 +346,26 @@ static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
>        */
>       smp_rmb();
>   
> +#ifdef CONFIG_GICV3_SELFTEST

if (gic_selftest_run)

> +    switch (sgi)
> +    {
> +    case GIC_SGI_EVENT_CHECK:
> +        printk("GIC_SGI_EVENT_CHECK received\n");
> +        break;
> +    case GIC_SGI_DUMP_STATE:
> +        printk("GIC_SGI_DUMP_STATE received\n");
> +        break;
> +    case GIC_SGI_CALL_FUNCTION:
> +        printk("GIC_SGI_CALL_FUNCTION received\n");
> +        break;
> +    case GIC_SGI_MAX:
> +        printk("GIC_SGI_MAX received\n");

	   gic_selftest_done = true;

> +        break;
> +    default:
> +        panic("Unknown SGI triggered\n");
> +        break;
> +    }

Potentially GIC selftest code can be guarded by some "gic_selftest_run/done" vars
if xen boot is expected to proceed further after testing.

> +#else
>       switch (sgi)
>       {
>       case GIC_SGI_EVENT_CHECK:
> @@ -361,6 +381,7 @@ static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
>           panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
>           break;
>       }
> +#endif
>   
>       /* Deactivate */
>       gic_hw_ops->deactivate_irq(desc);

-- 
Best regards,
-grygorii



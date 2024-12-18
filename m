Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510C9F6246
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860061.1272122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNqrU-00033R-M1; Wed, 18 Dec 2024 10:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860061.1272122; Wed, 18 Dec 2024 10:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNqrU-00030s-J6; Wed, 18 Dec 2024 10:01:00 +0000
Received: by outflank-mailman (input) for mailman id 860061;
 Wed, 18 Dec 2024 10:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TrB=TL=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tNqrS-00030i-Ld
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:00:58 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20624.outbound.protection.outlook.com
 [2a01:111:f403:260c::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9673725-bd26-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:00:56 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU5PR03MB10542.eurprd03.prod.outlook.com (2603:10a6:10:528::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:00:53 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8251.008; Wed, 18 Dec 2024
 10:00:53 +0000
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
X-Inumbo-ID: f9673725-bd26-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NagCExrFI9hoXb/tcJvUBDNfOiwHTLNPWzMaBLBeg0uH8sG4nkXWnRYDYPOUGEyBfF6eA3ZZADjVLMOnUTo8PNVFw1XzSmqwzypBQW31tUb58WWCALaLqcgIwfYySpcgxMdKUy7XVrY2dZZrp8Agja1hLa4Wq6CfNgX8DSvlBoGFFZmqwpUcDo7dKqsKFnsJFtcInYO108mDKOwvbPA6cub66WSG/nMAITWWc01xjrarGk4XYPo2tnp8IqzWyGwUv/DXbbX9TYYfCAiN8GxguZepbz1zXLZ/mq8pJ7qm85+n1Ad/gtxPBWEdQeGyPVxdnUxqK5wRQbbQQmPNqp20Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggK9E33gzVgqYP1cvYu7rpiSSpPsHcS8R6I11iylhVE=;
 b=KYA/HCpX1INiszeGIycuGgv+669kbzT4uSjQ8WJ1jFzwnoVo+0kMM5ayA837WwdPvHTVYGJ2yz/GXAjDtvRM0GJOCkKXA1Nx0thhiRAqz9euWrHZHZO0h2VLcUwuW05e9YwfQwMmW6sKBn3L/8nKu28XzEa2kHmzu//RkGeCBAQq5ARW+4X3k2MTNJ4ucEavuGNzvRo1Ck8osHg5VfA1w8OWqhF+ut18zDwH9TO7c06BA05p1xcMo3F7SxGrHuiQEYbp2MxGs6IwQ4gF+QhAikRIyW5Hb0AiVe4GbgUVCGDn8VXmgLfmKWCznXUDccA2RuWNs21CBwqIGpRTmxtdAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggK9E33gzVgqYP1cvYu7rpiSSpPsHcS8R6I11iylhVE=;
 b=n/x+alhB0TCb8XRUFHYTrZX37WFqTDrEE/VPFNFpf316KInjtx0MO42DcWZ6BL28VyK24XdmKyktTS0VjXkdwoxNQU4zHLqA3lKAZxR9molMcKQS0SSVf49iQYgWOwSweo956Ccp02tAJL39i3Yt/TMf05v4Ijp8cb587V98n3YCJHR03PRvqph3xDIJAJgQxDIIdLccf4/4qDeKcZr/7UfL+rc2Ew4s7Y4tx6F0lKiaUXfqWc4QDwThoDXfXXhE6ueDj3ib0AL3w9BWiV5c8IznMto6WwKCtjszvGUdriWOYTIOUM1CMnV9nz1t0YTuS2rgbja8jXSG7pglKeVBmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <858496ff-b8da-4dd9-abd1-679dc4f67b30@epam.com>
Date: Wed, 18 Dec 2024 12:00:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <9003a677-e78b-4cf8-b890-c6cf432d5837@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <9003a677-e78b-4cf8-b890-c6cf432d5837@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU5PR03MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5f1ad2-08a7-490c-b91d-08dd1f4adc10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TCthbTdCc2ZGS2plWXF5YVQ2eVZsdkhrTFVQcGEyV0FYV1NQQ053TXdJOWpj?=
 =?utf-8?B?MlNqeG9zcHpKcHNRa2R6TnhNeHNsbzUvbTZhQlZzYVpIVEVhU1cyL0ROLzY0?=
 =?utf-8?B?RUhOVW1uN1pPUGxUQnJCcEdBUUFMRGhMR0lwUWlLNGtsKy9xMGNmN2sxNXhS?=
 =?utf-8?B?ZXVRUUIwRW9CQ2daR29ib3RTTVB6eHROUnlEbnBxd2hqeHZrSjVYbWhYV05E?=
 =?utf-8?B?K2g5U1l5Q3dzSWp6Ukd3RW1oQ3ZNeDlLajdQMnBPVkdldTAvSFVCVEVDemV6?=
 =?utf-8?B?L2ZYeUh6M3g3SWRYMThmSlRFMEZCbkovQU81UGltRys1TzlIcURoUmtlVlFy?=
 =?utf-8?B?YzgwaFJiS291azBTMDExZW1nb05VNE11L2pDam1WVXIyZHN1MFZnb2V2Nm5w?=
 =?utf-8?B?OWh1bUJPaTBnT0ZFRTdpYWNiRHU2dXp1ZExqblJMd2tGb0x6UVRzMFlzNldB?=
 =?utf-8?B?b29sa1EyMDgyZEVLOTg1QkEyb2FTb1MzNDFaTldXbWtMT0hObUQzT2FHOTd6?=
 =?utf-8?B?aFhLUHh2UjcwRmZwUzNHeHlQSHd4T284KzFlSllNZ1FzblBMYkl1Q285TDZM?=
 =?utf-8?B?WU9obVJnb0tNczNxaXEyMi9ueDY3NEpIdzFzQWMzK2l5c1VCU1AwYWNuMzRH?=
 =?utf-8?B?NVA4SXBQcG9GYVlRNHliWUs4L0ZSb0FlRCtDbnhmMGhUTWNsSUxMeWtHTDAy?=
 =?utf-8?B?MmxaUmZoT3BpZy9BcGtJUCtLZGgyejI4K2Y0ZEFGSkh0OFh0UGFlMGhRZno3?=
 =?utf-8?B?U0piY1JCMXZEck9YUm1JRFF2MzBkTEpjUS8rUUV5dVZSbTZFZnNmQnN5WDhs?=
 =?utf-8?B?RnJJaUtXVU1HMEgzdnd3bXhGM3lkem9qVkpsS3Ayc3BLYVlqOUw2WHRwRVQr?=
 =?utf-8?B?SnNIdE4wTVcxeVBOVVg5Q2hMRDl4MjFwQkh6UzQ2M2x1U3ErYXk1TXhXN3pS?=
 =?utf-8?B?VVBWS0sxVUk5dzd6RHZDR0l4eHNvSEllT2pEeGJ1REtGNlBXTkdQOVpIdDlL?=
 =?utf-8?B?VWlBMGtGcG9WOEVnSVRsVUFNR3d1M3doeDlIdzV1QUZWbUxnRVl2S053TkRv?=
 =?utf-8?B?TzF5L0F5UXlvdGpOb1Y3SlkwSFRtYS9JU2lqdGZUS1lrSkhwMHUrMThmVGpE?=
 =?utf-8?B?UEZVTlV4MGZFYytpQU5IbmJRS01JQUJjWUNPdDNhSnBKZ295SVorL2s5Z1ZZ?=
 =?utf-8?B?eUxSRFlCdXh1dGRNOC83TTVSbHo1K21TNVN4SGJYcnJLSTNWdDlENjZ1Vi9u?=
 =?utf-8?B?bGQ3d1ZPVktqR3ZnZGxTTnBDMjU2MUhSMkhRbHNzOUpBUlZ6UUlyM2FBSlN1?=
 =?utf-8?B?ZktpaXpzUjFDZExJOG5YMzl3UnhWMEthbVZMSFgxUUpUWW9XUGlXUXRsOC85?=
 =?utf-8?B?RWRReHBHS1BlcFhUZVFuWTQrQ2JRNU92UzFNVlFQOTVwNGNzZzF0QXlwRS9i?=
 =?utf-8?B?RjYrU1BYakcrNnhXZGpWeG5Xa1NXa2pPdjNZS1VZSXF1UFNKaEx3R2dha0Jz?=
 =?utf-8?B?cUMxVnprZnFvdE1seG9nMDZNblBKUkJXV2FWc3llV0FlbTNlbFYrZnRwTEM5?=
 =?utf-8?B?UU8vN1BzQ3BZNWJpdXVZSnNucVdzcjBRQ0NOQmxCV01BMHhIVzhmcXJCVUFI?=
 =?utf-8?B?MGgrMjkvekY3WlhqQ0JhSk0zSVhKaTY2Z2hjdTRRUnZpSEoyaENOY0txME1U?=
 =?utf-8?B?UlNoWHI2TGRXS1gvN3JYeERiOVNYZWhPK0FiMWQxbHdHdWNhclBMRFZUb2t5?=
 =?utf-8?B?YjZZWTZYcnloUEZtQmxBWjFZYmVKcjlnaHg3Z1VzZXprVmNXZUF5V0FjeUlU?=
 =?utf-8?B?a3k3VmVWcVVJSjVYUnAxbkRnRTZYVlRwOW1nK0NHQVhlY0VXNFdpWldLU2Ry?=
 =?utf-8?Q?KO5sWQbcKhY0m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0UraG01V3pOSEk3aitsL2llT1QzVy9iZUpqcE9ZMXNPc3l2aHAzSk12THMy?=
 =?utf-8?B?NFZURlo5MHczUnU3NG02VndFdmlzYnBSZTBOUkgvTldadDgvbXVsY2RHU1lX?=
 =?utf-8?B?THNET1pXMkl3TmZGWllPczV0M0hnU0V6T2JNbE9GUUE4cHBMdEQ3ajJkTncw?=
 =?utf-8?B?SkZxYlE2TS80VFVWaTdXSnJQZkkwQ3RaMUFnOHkzRWtYN3d5TzhmbzFIeUJZ?=
 =?utf-8?B?dEFzTUFERjliU1ZDNGsrRnJ3WWg3U3F3MC9DU3dUZ1lSblpFNmk2dGc4bXpa?=
 =?utf-8?B?YXBJZXMzQVZXN3p2WCtaUGtjS1Jjc1ZONUxZYW5uQmFWRkh1QlpUNkViaXpr?=
 =?utf-8?B?R0lHWG5ZUFdSNE1oSVFKK20zSFlnWHc2bzR1NHVGNDVMSlB0S0x1dDRGZTBL?=
 =?utf-8?B?aFJhZ082ZFZ2dlJsejU2TUlnRFVUcEpUMXhScnlBSWJvQWJpbEk5Z3hxL0JS?=
 =?utf-8?B?Sk9sZU9jb0RkeWM1bElzUHZYcVlrT1Z4R0EzUzI5MTNWU3JETmpMSDV0dlRM?=
 =?utf-8?B?Y3o0bHljZG5aY2tHZitNbG1tbG5SUEpERG0rbTZvWVdhaktRV2JhWFpTaitW?=
 =?utf-8?B?U2RyU2NiK000dUcwU0hlamt2emVnQXI0STR4NENsbGxScVliS0V3Y1FURjBk?=
 =?utf-8?B?WVVEZ29NMHRnK0gvUlRRbkFlOUVNelVUMklsREZqS1NNMU9UZEdoLzBKc3FL?=
 =?utf-8?B?S011emZwWTA0YmRIRlVmRW04K1lWSUdacHNyU0JEMHF1Z3lhZmVpUklad2Fx?=
 =?utf-8?B?R2FOZkFCMzFwMnVrUVZod2FLQ0Jxd29kR0R0Q0dvdncrc2FMZFZ1bVI2VmdT?=
 =?utf-8?B?WHFZWDdWU0pxR3lZaVM2eXVPRXZ6WGlUcXFVRnpEQzNxaldKNStnZTB4a25S?=
 =?utf-8?B?MUFwVUlYdkMwMGV2MUo1UVRuMi9wY1E3T2ZicktqeHVKOFk3cEZhMkZDWkVX?=
 =?utf-8?B?Q1g1M2RhRk5uUmVheGVMU2Y2MDNuSThoaEN5S0JKSFp3eWJWWGRkN25vL0k3?=
 =?utf-8?B?S3BtSW14T3Vic29ocGxkYkEwUzlsVnhDMGdvYVlxYlN0blRkaWJsaFpxMzlW?=
 =?utf-8?B?MG9LelRFRWRWc21USDhsRWdsdmdsbHkrNVAwbElmSTVLN2tialZReDBNc1ln?=
 =?utf-8?B?NWVqUDBCdFFqckZQZXBDcWtUL1lCWHBtbnpZcWxwQjhCRDQ2bm5HZ21lVWtI?=
 =?utf-8?B?SEtFK1V1WEsxNlphcTV3elZ4V1JkS0d5S3hYbm5PVitHU01MZ0s4VDJHYkxk?=
 =?utf-8?B?OCtmYjMrY1d3RDIxZWZHT09IVHlxaGswcW9TS3BsSDNNbE1LdWNZOXFBNGgz?=
 =?utf-8?B?VldZcHNyMUlBeGN3M0hjbHMrL2RRejh2NHR2aGptZ3I2NGRxL1FZL3ZzMnRM?=
 =?utf-8?B?MmhuQ014UTIvNTJKNWlmTllITjZ6akNWRW9ja0VpeVg4M1l1TkJDcVBDdUdQ?=
 =?utf-8?B?MzRnb1V0dlFnNWRLQVUxNTducVgvTnhkaFNzV29sdVdDNEh4R0JIa214dUFl?=
 =?utf-8?B?K3JiT3dWVC9kS3VBUG05djVBL2huOFRQc1RsMk8zOSs4bXNwKzUzMit1THVD?=
 =?utf-8?B?UHpGOVV0K1VVYjF5b1RDMVA0YVp1Y3ZyQy9FVUd1ZXdYMzRmUmFRYXMzK0ZJ?=
 =?utf-8?B?a0d1OXpNemVmOGtBTjg0Yk83dUNCbFVQdTZIYmY5THFZYXBxRDBrSnB3d3k4?=
 =?utf-8?B?SURhOGh5NWU3bUU4Rm4zQkNka3pCOGpRVUNBRWFYcytIRFdNS29kSUpIblRm?=
 =?utf-8?B?aEcwZmtaY3V0ZXAydktqZXJRajVsdXlKRkFvMWJzT1J2eXVkUzBnRUxwWXFh?=
 =?utf-8?B?QkVUMkpibU45cTRxaWhNRm1TcW1BUlJxdnp6RFNYZTl5Rlk5R0J2TE93LzNI?=
 =?utf-8?B?amd4MGlIWnlKdEVmZkc5MDVaN2FxNS9zQnBMWmw2a1RVVktMdzJYZkdSdFdT?=
 =?utf-8?B?UVNBQ3Y0ZXNUQ2NCMlMwZVluR3BSZUtUaEFmSnZ6TW9oNWZYdXg1c2lJbWlN?=
 =?utf-8?B?bEVuUGQ0Q3RyYmM0UkNLR2lNbGw3V3NKMFJEUnFJTkdGcXg1V2lQaEpNR3Bl?=
 =?utf-8?B?aURnb20zdEpXUnFYRVkxZ0lGVms1dytGYkJ5NWs3QjRZMW5VRnNCUTQ4bnA4?=
 =?utf-8?B?eVpqUXRKU0Y3NCtjbmMvdFV0MFh3QTVVZEcwYTY4S3paN3oxSEs1alJIRzhX?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5f1ad2-08a7-490c-b91d-08dd1f4adc10
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:00:53.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAvY+B7/vhneCDPiFjiolpp/kp+hq18ewyfQWP0e2zvjvD0vJsJCooZwAHHc39sLU+9FRU5yZUd9weuxkb6zIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10542

17.12.24 15:02, Jan Beulich:
> On 17.12.2024 12:47, Sergiy Kibrik wrote:
>> Allow to build ARM configuration with support for initializing hardware domain.
>> On ARM it is only possible to start hardware domain in multiboot mode, so
>> dom0less support is required.
> 
> I don't follow this. Late hwdom is supposed to be started by a (minimal)
> toolstack iirc.

Yes, on x86 it's started by toolstack. This is not supported on ARM.
However dom0less can already handle hardware domain initialization on 
ARM, without much of an additional changes.

   -Sergiy


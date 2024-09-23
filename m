Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE77597EFAC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 18:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802240.1212452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssmNF-00046f-P4; Mon, 23 Sep 2024 16:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802240.1212452; Mon, 23 Sep 2024 16:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssmNF-000446-MD; Mon, 23 Sep 2024 16:57:21 +0000
Received: by outflank-mailman (input) for mailman id 802240;
 Mon, 23 Sep 2024 16:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=449k=QV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ssmND-000440-PF
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 16:57:19 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:2409::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3521f21-79cc-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 18:57:17 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Mon, 23 Sep
 2024 16:57:14 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 16:57:13 +0000
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
X-Inumbo-ID: e3521f21-79cc-11ef-a0b9-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrftLvFslUK98cV8QV0+PRJiMCY+sCgS0F3knOpJ4G1zBnYWgVSPL8uFKeK4ieryL5/JAwv9Hybt4I+emEn1XsFF9BKapRd1zLWW6+8lNhCn04Fjjnse1dMtmVXe1US/rzY8UP4Coze6Rus4jo4R8u5d/bDEXt1ekYxKcf6wlsp8k8brPge+ONHEQmVkpBLtVzCgMag94DApXKorOmum4Zt/0jABE+8uRL+1uy9RmnZhm8F0APgMad2Ep4hEprLOtjJ85prJk+8MF2t//7K9/aq3eBGLzSX4ImXGHk/yoV+UM12S15oEZn6c7ct7iVAHr72cltzHsbdWLSsqsk5/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hch7Ymjbpm4iBj+4E5sEAdxAdRJFGEgYTpM8/SkxQ84=;
 b=ewhR2fQx4V7S+0IqmUeT9BLYTsKYBzawn0WojfP/Vkhhc8LNJ94bHJiiJ1xRqlItd4RA5pD6TBybfDJxuYev+t3Ne7RDdv0/65RYESYGH6IWHMlzI3+3Xfew6bU4tHPZhCEI2YeLhVUjz7l7x5MWVxOZniCy/akdcITou/C+qXnNfW83QTyXLFERZ0TqT6FL61dNjw+tBtxW6bpyBeNcV79r51e+IN9g6sK00mmjo7P4s4JwtF2T/rrAU9fr+A6AoqDFVpMkGB3AcKndYx+l8kzJA9ws2OfFcspxWIL2L46fK/B3Fo4dLsQkkpCZY4cfHUvUO5b5j/WirX+qF2qbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hch7Ymjbpm4iBj+4E5sEAdxAdRJFGEgYTpM8/SkxQ84=;
 b=5BBlEcFNyrNXAbci3TfmH3CxyNl2bLr84GcCjkFQUaJDs7mwG4KqaGc0OXN29XB9e8nZvsLDo2B3t8v4CGnnHV6WmRrDHWK09nXXv6XDcBv3IcPr/SM7tQ/+kdMlCHoxtbKzC4voKgwM6Yv/RLhHaXX76k95kfnGNxS+bGEXlLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <87472b10-8e36-462f-a4fb-973684bceaa1@amd.com>
Date: Mon, 23 Sep 2024 17:57:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>, Julien Grall
 <julien@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20240916121851.3587139-1-ayan.kumar.halder@amd.com>
 <C3DB9D13-B9E6-4F8D-9678-59555E36AD68@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <C3DB9D13-B9E6-4F8D-9678-59555E36AD68@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0522.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::8) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d796218-721e-43a9-7aca-08dcdbf0c571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFhmRDdtM3d5a0JOV1hrbkVrdDBxbFZNSTlheFJ3YkUvbTlGTEEyZVFNRlMr?=
 =?utf-8?B?UGFScnhheFNyVm50VEN5V29qd1BxTnpMMHcvTkc5b0dYamFLUkpGQXQ5SkVX?=
 =?utf-8?B?WnBMYmxCMXdlcGtzbTJVVG1xNm1NT0wzOHZ1d1gxRTh6d2JRb0R4alQvUkN6?=
 =?utf-8?B?NDdvb1Jaa0ZSWnR0S3JmcWZXVTNNWnJMczBYTDFyQ0JQc3I5ZzlLK0lDS3pi?=
 =?utf-8?B?NmNzTnZtaGxaMi9mYisxb21Yd0Zua2dlaFg1RGFqNHBvMjN4NHNwMnpLQWtT?=
 =?utf-8?B?TnpJOVFyM0ZGWDU4SGwveHNLR1NZWXRYNjdsRmY0TUZOM2d2UDI3eUYxbDgw?=
 =?utf-8?B?MFRrRzBlSDNWakN6NTJmNXpTSFEwVUVuc1ZrK3JBa3ZOUkdHNGlmaW5LOWFt?=
 =?utf-8?B?WG9QejdzOUJ3UTluY1V1dUYwdzFFdnliUXpVZUVvZjZISC95VXlYM2JrWXE5?=
 =?utf-8?B?RWc5blVDamJpbldjU00za3pHdENTK252ZVF5ZEdYUTNhbFBnZFhyYkRUVEwv?=
 =?utf-8?B?Rlk1V3dQK3NLS29qZFJEUU9SMUp6alBBbGsxL2M1b2ZEZ1g2QUNJTlRrQlVy?=
 =?utf-8?B?MEl0enBwNmx0OHR3Y2lNbVYrMnE3cmlXOWhkckEvL0pMN2MxZ3A3dktCMkNO?=
 =?utf-8?B?M1JmYlByWkVIckdiQkFzUlpUQ3JkWXF3YWpJU3JwSTdWN3M2WEhDWk9XSDg4?=
 =?utf-8?B?Q2lCYzhTbWNGbHoyS3BKQ3NyaURSWjRrZUlIeFpPWXVmSWllSys5dmtOVkc0?=
 =?utf-8?B?L00yMi92V2UybzhtQ0dvSFJEWWxyZ3A1RjluWHptRnU5UEUxSUE4cWR6bHU1?=
 =?utf-8?B?b0VmS3dRQnRCVHB4Rk1yeVo4M3BNUnpiUXdqbVpjMjd0eVdTbnNnUSt0Z3pn?=
 =?utf-8?B?ZVdMalR2ZVRxZWlpRlpBYjhpNFRJbVJyVVRKd1JvaERrZHJMZUNWbG5xYkhW?=
 =?utf-8?B?bnJ5YkNRWGdZWnU1RFJsK1NXMk51UjBoRGxib1JnY3lRdWF4Q0dRNkNObnlz?=
 =?utf-8?B?TWZLVmxEeWQ2ejFXQVFKcjNIbzh2NWNvcWRiWWFwOG5CdURNVUhBblhFYkdC?=
 =?utf-8?B?b2Vlc29MWHd2UC9MY2NKVnNpSitaU2EwMytHWWlIL1VTTExMQkVBN0lnVVNz?=
 =?utf-8?B?NGJjMU5FSlp2NFhCcEYzTjYxck1XM0NZVGVOaTFkK3hoOXdRcEFuQUgxUnF2?=
 =?utf-8?B?THJseS95Sk1wTTRVUUx4SlhPNDlVYVgrbGR2R1pZdEhWWkhyT0c5c01ZYjI2?=
 =?utf-8?B?VmNvSlNqNmErNmNib09FL0p5V0hOdG9nY1NVbXVLNzBBYWQrME9BMmk1OUJO?=
 =?utf-8?B?WW5hSjU1SUJFZTlCKzF5Ni9LYVI2aUxoTjdFSjNvaUxQZUxtbmIxWGJHODFw?=
 =?utf-8?B?VUpBL21MRFpoWml2czVXbkxKL0lHNWh3eXVldmpBVzJPb3ByQTFzenBBdmhk?=
 =?utf-8?B?WmtwQ2U2c09GMUFOZG4xR1JrWUkzYmNteGVodUNONTkvcmhiLzFzemc1TzR0?=
 =?utf-8?B?ZEJYb2tPNGkrZUZYWUVZZWd3WmpkOEVuakxyM05VNDZlb2VYQkozS0E3RnRG?=
 =?utf-8?B?NlJTaGpNOVZmQnZJQWlHOE1wUUw0dHUzQ2s5bC8xb3pKU2pZYlovSmNRN2wy?=
 =?utf-8?B?elBVVjMvQ29Xa2Z4SVZ2WklTMDVqUnhyWFFHN1ltRThPS3U0VFFzcld0TEI3?=
 =?utf-8?B?TThwSjNmZlRtWTl4ZnNwdmpsQ3crbHZ6aC84QjVlcDY4TUtRcDFaa2pCOTB5?=
 =?utf-8?B?ejVqMncyNWlTZG5kOFJ0R1RBUXdEYWlwcmJFc3BSNzBKSXNnaGRBdzErN0Ns?=
 =?utf-8?B?Q2FlMzRibk8zWGVOMTAyUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE5MNThiWElKdEErbU9jMWtpVng1Sm10Uzlva0JiVEZRU0lVZ1AwekNwT0p0?=
 =?utf-8?B?M1Jjc28zOEJPdXREZCtmaUVZaGFvdjVyM3pQK3pSVXRHaGY5V3czcGJjaDB5?=
 =?utf-8?B?Y1pyRU1iaitmT1psWWZtN2tVb3EwNlpISjJjMXNWQi9qaDFzZlVmSjh4WGNt?=
 =?utf-8?B?dXhydk9DWDc5Q3ExTG5hVWdyOTdRSHBkcUJxRmZnTUhTcDc5ZysyMmd2Wml5?=
 =?utf-8?B?MjVBRm9DTXlXSzJmRVR1cmNzZEZZUDFCd24vWUdSSkNHR1dqV3pyeXJodGdG?=
 =?utf-8?B?aldBRTc2RklGbXVXbWVsbm1YODBTS0k1eVlOaFQ2OXUvVzNYRHgrTHJ0Um5n?=
 =?utf-8?B?Uncza2pzT3ZSYWh2N3B3TDdvTTBrY2hTZ2Q3dk5JMEI2TmxNSTNNc2MwRGFM?=
 =?utf-8?B?T2I2RGR4U21sYkxMNGVDTUU5TzZHTkMxM24zeEdFeFJCVXRYdFNTQ21HRzEx?=
 =?utf-8?B?Zm12eWlBSmJUMHY0MlNnZHFSSXhlZ1dEbnpNNmhHUC9sY1BPT3ByWGZSdkFh?=
 =?utf-8?B?L3FjalN2QnJLUm11M3R1U2MzZ0dNeG4xWXh2ajhSUUY3Qk1FeXkzWmVOdWJ1?=
 =?utf-8?B?WnNaY1RvbjNNUWxScmFYR1Z3ZVF3MUdBVC9CdnZ4cGNsYVRORE1wbnJKaGVx?=
 =?utf-8?B?d1p1YjB5aUtiY0FCeUw1RWJSaE1vRFV0WVdkcXcvTFBDRE5sdElLcFR5eU1h?=
 =?utf-8?B?QysvWG9TMjBTa3BmSW1JY0gyV2ttVVNmUGNXSWlTUjNMRjk0czJTc1BoaDJt?=
 =?utf-8?B?Qi9JZnJRNzk1enovNkViWVBwanRhU05DclFZVHFpTlhQN0p6REpQZC9KT1RG?=
 =?utf-8?B?TURUNm1Pd3JKY0VkNnpNS0tjRTVLdGtJZEVTb0pJY3dFNUM0cEdDQnVlejlW?=
 =?utf-8?B?emNPZXZEZlhhd1hxMklxNFpRSi9rU25zNFBYM1JqRm02aklRQzRZRHpqU0di?=
 =?utf-8?B?bit1T3RZS0ZmUHFrY0I0TSswcW4xMXFYU3o5TXdHN1htOVoyOUJvQSt6a2x3?=
 =?utf-8?B?R3JUV2RMSkc3WVhkcTBrVEpPSGR2S2swNjVYS0hkUDlTK2tRV1NzQllEdDk0?=
 =?utf-8?B?N2VNT3dPcENFWVdlRTRCYy9TeGlzeVY4Y1kyckxFeE5jK2IzdFpXSkRhU0xm?=
 =?utf-8?B?RmJlOXUrR2tnalpjV1ltRmpmWk56dUFzWXY2SUFzTVJPVGpVS0hYMER2bTV0?=
 =?utf-8?B?bHdlL1ZJU1h3dVBVTTE0VDhQUEZZbEJlYmZWeHdVYm5mc3RMN3dKR0Nkdk5E?=
 =?utf-8?B?WTV4am9CQUw5T3l5S3NhUXRzOVgwc0s3ZlUvQ1d2bjQzbDVIU3prcmpHUlFB?=
 =?utf-8?B?UFRiNVc1akpOdXFWL202RTVuVlFJUUM0VkpqSzBwOTRQMVNUQ2haQ2ZueG1R?=
 =?utf-8?B?NFMwTk5iK0VkQ1E5d3M4dmhCcTJ3Yy9HN3V3N29BdUN3aGE4M1VJSjEvZGxZ?=
 =?utf-8?B?Y3k4Z1djS0tTcUoveDhuUkIxTktaMjBwZlRhM3NYeDcrSlpHcm1OYjhlREt3?=
 =?utf-8?B?S0hvVHdXQlpLelBSYjVUT1NaUE9TdEs5ZkxXNzEydTExZUNBTVNjTStJSGtp?=
 =?utf-8?B?UFBEdzkzaUlEY2pNNm81d3lLZVJZOGZndnN6M1FtdlpmU3pCZ0htdk9LRDRn?=
 =?utf-8?B?ZlJRdXpUUTJZaU95SHFaSTNtTUdWUkhBSVFVdFVra0FjN3JuNFRiLzdKQW5P?=
 =?utf-8?B?ZmNKMjYxelFLV0RreHRUZnBDVmJzemd5d01GTGlXenJkdmhaR1U2eFZwRVd3?=
 =?utf-8?B?ZDFLbHYrakFKeWtieGdoV0EzRU1IZnVmU2JHYjNlN1ZrZmk5V28zelhtZGkx?=
 =?utf-8?B?elZFWmNJRXp3eDZHRnJEd1ptdmdtOHlwazMydVVsdFJZVmFmZXVWZlM4b2FS?=
 =?utf-8?B?dngwR0cyVUVRbGdHQmQwNnBXRlFJcmxlYzBTMUFBWEtqQnA3akFBRVZEak1R?=
 =?utf-8?B?akI4S2IvYWdjTjdlSVRNamRFWUxFcVVvWTdnVzdYMmlUeXJsTXZZQUdtYWpV?=
 =?utf-8?B?bnNRQ3NQQ2hNQjM1YU1XNVIwbGlQT0cvWWFQVTBqVnQvN3dCM201dy9pZDJq?=
 =?utf-8?B?VFY3NGc0dFUrenpLSjdMQktMSDA0NWJ2NExrN0wwZHUyUWYreFlROTJjckNZ?=
 =?utf-8?Q?S79DlSH9u5AzG18jizzPX1wYc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d796218-721e-43a9-7aca-08dcdbf0c571
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 16:57:13.3959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCsZx4FJ9GigE84qWmbWoFygH3g/nUIPjiozogfnPsrv7ifccSFt0WEfcpTPgo7yhhQc/9bPqxxKJqiI/qEhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393


On 19/09/2024 13:01, Bertrand Marquis wrote:
> Hi Ayan,
Hi Bertrand,
>
>> On 16 Sep 2024, at 14:18, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> AoU are the assumptions that Xen relies on other components (eg platform
>> platform, domains)
>> to fulfill its requirements. In our case, platform means a combination
>> of hardware, firmware and bootloader.
>>
>> We have defined AoU in the intro.rst and added AoU for the generic
>> timer.
>>
>> Also, fixed a requirement to denote that Xen shall **not** expose the
>> system counter frequency via the "clock-frequency" device tree property.
>> The reason being the device tree documentation strongly discourages the
>> use of this peoperty. Further if the "clock-frequency" is exposed, then
>> it overrides the value programmed in the CNTFRQ_EL0 register.
>>
>> So, the frequency shall be exposed via the CNTFRQ_EL0 register only and
>> consequently there is an assumption on the platform to program the
>> register correctly.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Removed the part of requirement which states that Xen exposes the
>> frequency of the system timer by reading the "clock-frequency" property.
>>
>> 2. Added a rationale for AoU.
>>
>> 3. Reworded the AoU.
>>
>> v2 - 1. Reworded the commit message. Added R-b.
>>
>> .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
>> docs/fusa/reqs/intro.rst                      | 10 ++++++++
>> 2 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> index f2a0cd7fb8..86d84a3c40 100644
>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> @@ -30,7 +30,7 @@ Read system counter frequency
>>
>> Description:
>> Xen shall expose the frequency of the system counter to the domains in
>> -CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" property.
>> +CNTFRQ_EL0 register.
>>
>> Rationale:
>>
>> @@ -116,6 +116,28 @@ Rationale:
>>
>> Comments:
>>
>> +Covers:
>> + - `XenProd~emulated_timer~1`
>> +
>> +Assumption of Use on the Platform
>> +=================================
>> +
>> +Expose system timer frequency via register
>> +------------------------------------------
>> +
>> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
>> +
>> +Description:
>> +Underlying platform shall program CNTFRQ_EL0 register with the value of system
>> +timer frequency.
> How about: CNTFRQ_EL0 register shall be programmed with the value of the system timer frequency.
>
> It prevent to use "platform" which is quite undefined here.
>
>> +
>> +Rationale:
>> +Xen reads the CNTFRQ_EL0 register to get the value of system timer frequency.
>> +While there is a provision to get this value by reading the "clock-frequency"
>> +dt property [2], the use of this property is strongly discouraged.
> I would put the second sentence as a comment as only the first one is the rationale explaining
> why we need it to be correct.
>
>> +
>> +Comments:
>> +
>> Covers:
>>   - `XenProd~emulated_timer~1`
>>
>> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
>> index 245a219ff2..aa85ff821c 100644
>> --- a/docs/fusa/reqs/intro.rst
>> +++ b/docs/fusa/reqs/intro.rst
>> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
>> OpenFastTrace parses through the requirements and generates a traceability
>> report.
>>
>> +Assumption of Use
>> +=================
>> +
>> +To fulfill one or more design requirements, there may be underlying assumptions
>> +on one or more components that Xen interacts with directly or indirectly. For
>> +eg, there may be assumptions on the underlying platform (hardware + firmware +
>> +bootloader) to set certain registers, etc. The important thing here is that
>> +anyone who validates these requirements, need to consider the assumption on the
>> +other components.
I think there is a typo.
> I would simplify a bit:
> Xen is making several assumptions on the status of the platform or on some
> functions being present and functional.
s/functional/functionality.
> For example, Xen might assume that
> some registers are set.
> Anybody who wants to use Xen must validate that the platform it is used on
> (meaning the hardware and any software running before Xen like the firmware)
> fulfils all the AoU described by Xen.
>
> What do you think ?

It sounds ok.

- Ayan



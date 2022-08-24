Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D459F39B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 08:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392210.630405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQjuQ-0001ii-3F; Wed, 24 Aug 2022 06:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392210.630405; Wed, 24 Aug 2022 06:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQjuQ-0001gF-0E; Wed, 24 Aug 2022 06:30:38 +0000
Received: by outflank-mailman (input) for mailman id 392210;
 Wed, 24 Aug 2022 06:30:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQjuO-0001g7-IL
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 06:30:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42df1259-2376-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 08:30:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3408.eurprd04.prod.outlook.com (2603:10a6:803:9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 06:30:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 06:30:32 +0000
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
X-Inumbo-ID: 42df1259-2376-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHwkxSE15cBjwHAu4rPCoIsF5PEI/nViTXSnIagZhDkXuVl4GGcrIooxbaHo5x3CAke6MN9YeH/HjT26jLUoQS31O26hsW6E60Au6/2wFEuJjKGiY/YM9im9+8P4liHDiH4HFuqQ+Wnl2qUocv6O4tHXSZdKIAqCTVPKvqzU3XqES6kgumCwyYvAkAUJO1F0pO5WgeuFi2x/oSlSLZtDHn3v4t0pkAZTkuC3cSfDGgf4SAAYRGT2JqTe4yk5O71C12eZ6iCEuV53tGn+2EGC2kjlndNhJiZtwd4X4TR2tml/ujHxR4H46fKC4TU7UeK3Rpw9UOPtQocWeudc36oUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdcHiNA0s7gRgW1pErjR4Q4Wi4Ympbh0cEEQ/hfafN4=;
 b=QoRf6AqXNmGnWH/BtVtFGqQH/rxvg+8Y10KnQWxRMbqc3uMCpM3r/Bra+IL37bz0Fz1hg4ggJ8e26PD0cS+kV7bjz0tBvXbZNvWJDXQ3x/xwpWNm+YekQSPz4LaEcIeM53nxsCRv/ITVnsTbrtRG4LBb7bo5m/w+njg6qtDjurihDj58W69NXEtW7q1/COubiwHgoMsHR5numT5pUf4LEZl9xEZ/LuQFj6lhczQWCGuBNyyi/OIEG1WKsgYgQZCUYvP6LflHRIQFRGZM7GpR8YC8Kfg5BqKWzCMGO7nepffI3rZM3sc22DPY+1Pkp5swskB29s4ZSo/EP8z5Qy8XDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdcHiNA0s7gRgW1pErjR4Q4Wi4Ympbh0cEEQ/hfafN4=;
 b=hanvSkUCInQZV+iECJsrdHoFIAnlQC8i4wNjzjSF78QXEC2IeDIRcxrnDFQeIfTMKgc0AIVl+2YSI4fPsKdfOVPU7A57GcTDTRdwrDH30DoF4F6tbGXF6vz1FDlx/1cmCJ8nt+fXZyWQcfYBAlMk/kMTPGygGjE7L9QiEeNDuzTs3Dyu8xyzs2zjLqLmp2HNpVzqZ0tE6a69OIjgr9KJDO2jOPA4TGMaoTczHLtnUEn3m99iQKoTnZ4jgstmBORhEQX8GSsvj2FgVxfm445YQiEvn+Dzm1fVP1JB2th/sQ+smQGSPEV5kCEfi5SmGysw5ivz1VDxMNfvC3kd84408Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82fe9c20-2b6a-fb53-8ab2-84a955efe14e@suse.com>
Date: Wed, 24 Aug 2022 08:30:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 SeongJae Park <sjpark@amazon.com>, Maximilian Heyne <mheyne@amazon.de>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
 <bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0032.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::45) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29ed7516-274c-46a5-cbd9-08da859a2505
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3408:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nhK/pBnY4LPru6WO8w6D06X7MaCTtT0Lgw8WrajjLnsWwIXYp1KRd3J4hVynTpfiZWa/NHHEWC8MqhajTlU9wZeIryqN0foPXtoiTbsyyh91ADAFfjxxndyzmPX2ROIZ/Rcg4ev1aQHKttO2aDvkSaqXESXyTHUWa3kH0HNxNdn+LWzNqSGBKQ+nMQlJVzr3a/rWANv57DVGB21GlagJh026k5n+HSuOFGbPHDH3ma2ARTyK67jRjc6XGBqo1dfTPTQY2mwI21pT9TEG19qzwSK8J6Sgh/i+YAjO797NvVXxXsWBlXrnK5V5rMuwe+nu2VXf0VugvkVN6iHAPteFaRQDZtiS0VF6/VyLEojKuHH1WZMiwleO0kCHSRSs7f5zZGAsMDgeQmkw4QayW9H+xusTUsm2iSJ1KP8zU38GPSFGeamCxuhWFuSDaXItQUTjntm0eigpK3ZQVWfccqGHbSTPXHFEWh2UAyffbZwvzBWGQKO+6yz1K+SpZ+/7dgJDhkjGqopYW6gFpA6+BpDlnr8GoudhYPU3mjGfg4o48pqXxE7LoK7uL4fscLUmsWao8eBuPzxtq3KSzsf4H82aqwkvzJdQvKQYVyIDbrX+IVEeanrRc/DeDoPYBSJjqBrmCXOs7tTWZKc3nmlVb/cb2S1GZwjOtawYf5N2WQzGPjM4WiZEAqtlLSGu+e5K3z9knE2q57aW+LIxzUPmRy2KcHYOfUZqe05d+KnoSpngcR9og7cV7tvxe/AVM6H9Tb4ZBLpCjTpTq6gdGjucwdmYT5z6T6Ndg7myWcv16kjwz8U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(366004)(39860400002)(346002)(6512007)(316002)(4326008)(2616005)(86362001)(186003)(31696002)(38100700002)(8936002)(83380400001)(5660300002)(6862004)(66946007)(66556008)(66476007)(31686004)(4744005)(36756003)(2906002)(478600001)(41300700001)(6486002)(54906003)(6666004)(26005)(6506007)(37006003)(53546011)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2owcm43WHIvWGVCUlZjV05aL2dFbTFQRHRKSzFWOTRKQ2d4SE0zMWo2ZTVU?=
 =?utf-8?B?RmlVMDczbG1YYUFkVnkxejVpNzJNWWFlalZpaklMc3dqdG4zWVpGYUJ4WStM?=
 =?utf-8?B?L1hWVUtRZ3p4M0hGVGNueEZvYitrOG1WWnZKVmpjNVpzODFsNDJBUzJDdCs2?=
 =?utf-8?B?MFU2Yk5vR0pUdUdRbFh1dWVrTzU2RC9neGpyM3ZwWmoyQUV3MjNUWnNieTI5?=
 =?utf-8?B?WlZ2bWl4TGROUVdBMFIxY3I3LzUvWk5rSEZBbXc1OTNKenJmTGFCSVJyMVM1?=
 =?utf-8?B?Q3orWms3OVdHWDZaZ0dzR0Rydnova1JxeFdIK3kxKzhaOGNFbDNNckpQdnRX?=
 =?utf-8?B?UFBVemQ2b3ZneCtUTHZwb1lYR2FUWEtHZUJ3MWU4Z1JGQzVwYXR3Q3ZPeTdM?=
 =?utf-8?B?eHdmNlg1L3dNanVndUMzOWY0bXNmTmVsSDdReUJkci9wZlljOHRQSUh6N3RG?=
 =?utf-8?B?TVVMUUtLN0FjT3R3K21JdTRPdXdoT2lyV1RkR3g1TVBZRStyb2RmVWY1ZXN2?=
 =?utf-8?B?ak9YR2VxaWdsRzJzT25jaGUwQXhTazdDSm51TmI0Y0FmaU5xR1V0WW1LdjNW?=
 =?utf-8?B?V2JNVmI2dVVBY3o2VFJsSVdZc3lxR0pnOGdiMC8xL3dsQzgyd28zVHlIZHV3?=
 =?utf-8?B?UHhwbDVHdkxBS0N1OURZeUh3T2lGR24zaGpyQ2ljWENreERzTUp3MGFEbWdD?=
 =?utf-8?B?NmFLTkY2cStxdkhOUUd0czM5cTFpQklLQVNhYWx1cUt0RStGVncrQWxBbjZS?=
 =?utf-8?B?UXdrQWRQMG1UdktSZjdhclJqd2xNaXN1VWYyUXB5Qjg0WmRaOVZNSWhrVFRv?=
 =?utf-8?B?QklrWnZGRTAzYk9HWWYvcjRaR1IvbUw2ampHTmVqMmF6bkpkcUtodng1YnlC?=
 =?utf-8?B?WDhpU1JmbHkzc2dHdVY2dkVGOFd3S2YvRjZ3M1RTNTlnVERvMTRqaTVBNnY3?=
 =?utf-8?B?SkhUeWlmZE5mWXBPL09tMTViQ0hnTzV1SFhaNW1yOXI1TXdJcXFhZEo1WFZ0?=
 =?utf-8?B?aGozL3JuN0JTNmtFSHRqSnZPSlNIRjlwT0ZjQmU1Q2R3V2M3aUoyY09Zd1or?=
 =?utf-8?B?R2JBWDVDcFlVam41UkZjVXRDcWsvWUgxSFZJVVMrUldNeURoZjR6TTM4M2FB?=
 =?utf-8?B?a0sxL3BzdTFFWlR4RVRya2F0M1ZWTy9mYjQ3U2RzWCtONnhhazFJMFcvbm5k?=
 =?utf-8?B?dlVESVdBNDlRNjJrVDFxeUMrSUJJNTJadnRLV2w4a0xVWnI1R3d5S3ZnMnNq?=
 =?utf-8?B?aEdZRnhkMjI3cDJ2cE9xa2RlMFh4NHg1MlY4cjdpUUhBREhkOEZmLzlDNk5a?=
 =?utf-8?B?eUNFa2YyV3BqRWVnWHZjVzVBeHVzbFl3OU9UdFgxbWhFRStuWlZnMlAxV0FC?=
 =?utf-8?B?dU45L3NyMkYxN0I5UEZ1NGNDRjZSQ3N2bHJicXc4eUhzZ3VSR0t4ZFZhRzd6?=
 =?utf-8?B?dGoxODRjakVNMndxSEk1NUtlc08rZjdQZlRpWXlzRTVJL0Urb1lWaGljYU84?=
 =?utf-8?B?K055R0ViNHBETmE5QWh5QjI0cHJLc0tOaWZ4SHhPTW1wYWJwT0RkZ1k3aEJB?=
 =?utf-8?B?bDNWZSs2WnpJVXBCZUloVitPVi9VOG1vQ3NqR1FKeGtUb0FCbUVzNFpZaFBt?=
 =?utf-8?B?YnpZcjBvUHpZNzBiZXY1dTVYSUxzLzMrekhrTzV2WWtqekpnb2RNMzVQa09l?=
 =?utf-8?B?Z0JxUjJUMWY3V3ZsajYyeXBWc2xzeEhwUWdtREppbkROcDFsM1JkOGsxM0lQ?=
 =?utf-8?B?RnZ4czdEN0oveS9iVTlZdGNTREhCK3krU1l6d1dObDV3aVEvdzd1bm1xbU9u?=
 =?utf-8?B?OXpwblFDdmJ3ZjdUNnYvR2VLVWFYMEFsR00vNTUvL1padDZ0SXFZT1l2S2hw?=
 =?utf-8?B?SUJUQ3p0ZERKNVMrVXA1WjdNeGxYTmtKWGorN2M5MEFaSmxXd2IyMnA5VTFk?=
 =?utf-8?B?bzlwL0tLRGwvejZRMlFpVWdRaDNLclU2ZXNNYWJkVFk2Tk15YXJYbXNkWTdN?=
 =?utf-8?B?SHJpR21MSzUzSEpxeGJnUmlmcWI3ckV2YTYyWUU2MEtqdFhLQkVVL05uY0ZE?=
 =?utf-8?B?YkRremd3YmFaSkpNKzJZakxUUzBDVkhQY1FlWXZZLzNOQTkvejdDczNza0kz?=
 =?utf-8?Q?KEY9ay0veKYNDcBb6zWGU9e7O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ed7516-274c-46a5-cbd9-08da859a2505
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 06:30:32.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmGhOn6qMf/uLIbUBeO9Epbr7oWPdADsGHvFOBY8LPUJBnc7sRgne7pFi6dGLUjrrCJqjkZMpoEXdctGTp6ixQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3408

On 24.08.2022 08:02, Juergen Gross wrote:
> The blkif.h comments should be updated to make it clear that the values in
> Xenstore don't reflect the state of the connection, but the availability of
> the feature in the related driver.

Isn't that implied for all the feature-* leaves? I certainly don't mind it
being spelled out, but I don't think there's any real ambiguity here.

Jan


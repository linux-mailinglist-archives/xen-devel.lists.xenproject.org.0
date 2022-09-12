Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9988E5B5E35
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 18:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405927.648345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXmHw-0000fm-DN; Mon, 12 Sep 2022 16:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405927.648345; Mon, 12 Sep 2022 16:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXmHw-0000dv-Aj; Mon, 12 Sep 2022 16:28:00 +0000
Received: by outflank-mailman (input) for mailman id 405927;
 Mon, 12 Sep 2022 16:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUhb=ZP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oXmHu-0000dZ-GK
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 16:27:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da83ba2a-32b7-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 18:27:55 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 16:27:53 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:27:53 +0000
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
X-Inumbo-ID: da83ba2a-32b7-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTsc2NJyt0WjWPQrkBT1sBOtmb8mraGuXojn6pcLxqpWhrFHLS7UY6XHEgOsFQrbO70jqr8V0EPTvBqp1ZIxlSsqgM/2Usx/aG92/qa9GBdOJ+wsb4t+Z6cLbYBcVILFXPnXcgUKV3sDFvbNMsrZx26n2uRdcGvzBg8h5pJrukzE37uRL+tPdMo7iIrR0tPG5Tu/lkaYXoCoId8DpJty61QWHCKT6QP6HpRMVnjEZw64yO4oN/ayANgoaHulkHGGZ7oQBMwGf9TwWQWzQXeKiGY6+G+oYpVFZxuxndWGfw24NNJfyxFoXy2FgVSE93EkvqAo28B69Mfx0UdLdp3ghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpJ06u9BXM0JzeopbQ+Fova8Tdy6vBvUefEsnTwjJ0g=;
 b=bdfMRrGzF+IBcXKC2FEYJK4TotS8DFSpvXuc85V18dNNGlZOXLSB4rk8PUIy8A9nmIEfPX4BO/6ttBMLzoxMACKvI93MEGU7idnrAPO73NiC419/bzRbjiyl41dZHI7y/aSsesITw34w7hWCxaMdq+0ncWiT+01hSZkBY6lWwvXKWSDlpViB5IuuPW1Rk8IcrPWpjnIQsmb1Zcv4JpzQKofaOQJ5IriTD3HK/g7aRPvi4H7VKq3x7YSd5Xq5JgmAwZ1haiqaLQ7cAwK28eRR5w6MvH77IoUmYUzqKfitU3+KcEp3ig69nc1v4h14gY7mSv9tjmaQARtyXNvEFobRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpJ06u9BXM0JzeopbQ+Fova8Tdy6vBvUefEsnTwjJ0g=;
 b=ZIEUgMVBHx8XKiH6ajZ+DcmNBfD+zShX5WEj0wYH3+Jj1MyM0Zy3IljPbJnCZvzq+H+eUFRR8vaxCLkJrIsrxQytdjdNhWfOuE1GdC5AcAu5KkGqJj7RPv3VbD+6A3q0OoI1n4DOG4MA9S1p0GKqngApen8JWQGHyZ90lJyBBQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <64aadcab-5f41-6d2f-4dc9-39415016816a@amd.com>
Date: Mon, 12 Sep 2022 17:27:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [ImageBuilder 0/2] Use lopper to generate partial dts
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20220912115934.19552-1-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220912115934.19552-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::13) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fdebf78-4f47-4dd2-6859-08da94dbbdb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	65dugSbKpmoO624oj6w40EHLxnFV7eLGY916e8bQW6PUTRObJOyhkFCwqWSCi1YY+9omRvUNfHOFTcLxy/1ox16Z51WWSbhim6I2i0TXrRUVnuNEJttVQ28EtYbQEoL6zr/tRuScBKKhPfF15c0jPNLwxkdfq28EdejthUapvutzKueXUmpCKryLzfu1NG0R3UKUv012b9oWZCkl9CyrqTbBiJwH2Yc96JyxfZL6zMF7sWaO5kyWz0uaKBjHO2Pqye72Xn8+2v0WJ6b8AMPVYEXIhg0cQrhEA424S7HMLqJ+oaJaRTAVbUCGnULnyX8zNAwSI4SAzLTu4W+Ggi4A2UAhOQwrkYm8CUOoRM1zijY/Mjb8yemyreTGugOZejZxMXFDzUgFisAHtDvmmsvdVdXoVx7bAEmu2+QP3+3MQw8Cs2vS/k+8IeJOxl8hWxYD1xgS9kfKydWYyW4e9fW7m18m0n/PEc/fZSkUXCGhe2VAskMwCUiaOEBJX5BegGRUAV6iJWQRfpG5lB3Bsa0lVp24gqd+i4TFrn5CFlKFcGKBtvcUmMh9A7C2czh7vCKb3Mk0fTAwtjZ1tGsWZXslj0HiU1pHPOeMRSUV1df7YfM5Odqe1yr5ZMCOShbiNSLAgB11Qe5VU7fYZ5vpY3+AuiZNiwp0KkA8fXUzZmQD/POPMeZBDZKOSTWePDYjVkGW0og9944O3huml4LobMiOdASsDUXqvtgpu6+RQqkJeEMEBujIVsOttFD4k+DulX7t9bQOpUrsz89RQgxM+uRib0Ow2JcoVN8l+tFVN/KgYGjT1Fosu1MSkeBPKBKqhdJMbyAgaYh47/kFsNYTmgEE4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230017)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(5660300002)(8936002)(2906002)(31686004)(36756003)(31696002)(83380400001)(966005)(316002)(66476007)(6486002)(38100700002)(66556008)(4326008)(66946007)(8676002)(41300700001)(6512007)(6666004)(53546011)(6506007)(26005)(478600001)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzVFRWZReGVkQkxmN2U3R0FNZzcwRUF0V0U4WEM5TW1OK0FzMnR0bkZvbmMx?=
 =?utf-8?B?TVZOWkp2dXVrd0RsUXg0N2lhVjB0dEY2Q0ZOY2ZoTXNwNjRKa3d4RkE4NGFr?=
 =?utf-8?B?eHpCMVdHTGRnQldlYjRwSkhtK2RVcWZBVkxhWTJtWXJVSFl2MFN2RlhUNlpU?=
 =?utf-8?B?UU9HTyt2RHhjQU4xUGkyMGs1ckRkQ0JDMVJwRFoyOTFwcnBrTDNYZEtZN0NY?=
 =?utf-8?B?UHdEUGJOUE5pQ2ovUnNLOUs4SEY2ejVmVUpSWllDalkxUHZtK2FIZzhLRDVa?=
 =?utf-8?B?ZGlTTWVhbVJFbG5wRWZCS1QxR1hNZHAwV0JXL2IrU3EzWERtUzhoTUVURzVG?=
 =?utf-8?B?ZGtxZllEck52WHNEZ3I1VGFMais2dHdLclVzQ1NzekNwWnBBOEt3Y01jVzBr?=
 =?utf-8?B?UURzUEcydnp1Unc4QjYwMkVDa1hza2htbVBTRFNTZXBaSVJuTkZSMHJYY05T?=
 =?utf-8?B?YWcra21CdXJURHd3QnRid1poYmlSL1IvUUtJclI0WVJRd2ZGZG9Xb0NmdHNI?=
 =?utf-8?B?Q0tBbWdLWGtnR3kyTEkySWhlRDlBWk5aQ3pLZDBvUDg2TW54WkgxdnZ0MWZr?=
 =?utf-8?B?anI0WHlFb2Juc2grSlpkSVVJenBHQW5GTk1qSXE3WDRJSDFTbW1hNjRRekpZ?=
 =?utf-8?B?SjMxYWU5MjFnRFVCRmhQd3hUYkdhMHdTVWRNd1BWSTd1OHZRbmp6TWlzaG0z?=
 =?utf-8?B?MnhoNEN0bVBXV1BEQ1lpM01tbGxMVGM3V0dSWHVPK1lUQ1JkMnFKRUFudUJV?=
 =?utf-8?B?Q2RzRy9uclMrdHdQWDdGSTVvR2lpVWlsVGZaendCbVdMaDVGZU5BTnM1cXdx?=
 =?utf-8?B?UytSbUcwQzBnTUtLRkdYaDl1NXptUFNwM1Rvd3pzaEN3NW9IV1RTVlYwZUpv?=
 =?utf-8?B?RHlHbHhjSm9FNklYc0hON3ZDU2Eyai96ZEtKV3hhc21TRDhXL2lpeWhZK2hR?=
 =?utf-8?B?Tm13TzRpTDA0eFpOYWZQT0pJMDByd241cERQYkdqZU9keThTN1V3Y3VVWkY0?=
 =?utf-8?B?UklIelRDMkdjWDlqMld0dG1EY1VRL2ZzQVRwMzMxTkg1bnhEdGd2MzJTUmJ4?=
 =?utf-8?B?NTNQVWFleVc5K3p3V01xdUVDeTV6K0J4ellZWFo4NnAvYlFCRCtUMXRqenhQ?=
 =?utf-8?B?dVNGZnRUWEFsOVJ3UFpqSkRSUTJmWmhHR0R3MWlRVHR3emI4VVQ3UWFIdExY?=
 =?utf-8?B?eGI3RnhMSkxET2V2VkowMFhNaEdHRE9uQVNzTWF0eXB1bHI0WG12RDBvYkxC?=
 =?utf-8?B?Q0NMWnZxc3lPS25ZS3ErYmZKbXZBbVlGZ3ZDOVhmMG91c2I5dkNYdU15dFIv?=
 =?utf-8?B?UXJ4ZXZyL1B4dWVYVUZOWkVsbjl1ZStSc0NabklqTEx1bzN6UE1jaVlhczIy?=
 =?utf-8?B?ODJPMHVFRlZqTi83NTdyenM0VzRlY01IbTJEd2JHdW1iL2FuRG01UW0veTU0?=
 =?utf-8?B?RTE0c2RMMEdwczk0V3hSSVorbnVvVkJIMGV3d1pjNm1zOWVUajZDTXZpelVY?=
 =?utf-8?B?bjIvZEdBTnoxOUJ4c3cyTTdlK1lRWTdUUVBBcm5yRys4KzZrbUJtcnNLdFQ3?=
 =?utf-8?B?M3E5U1JzR0loYlJ1VG9IeGVCMkFjVkFkY2ZCRnVIZ3FSU2FmT0l0dG5HaUkx?=
 =?utf-8?B?UGhwVGhzRkVrQVFxZDBEb1ZKNk80UUUwNGo2eDVMdzBlMEpJajl5SGRoUzQr?=
 =?utf-8?B?LzRURG5PNU5JSWxQUW9jUWZ4K3F5a1JOZ2Rwemo3ZlcxNFFqaVpBbk9pZE5w?=
 =?utf-8?B?RDIzdUtTemhaelZ1YTdvMVVoeitraThoN2FTVjkzWEN1Y2FsalRZWmVmaVBv?=
 =?utf-8?B?ZkEyOFJCaGhoNXpoV2Q4c0ZxeTQ4QmJjaGNlekJDSVdlUnFWYTVzVHRRYnZs?=
 =?utf-8?B?MnZKeVRiWERHWDdVWVF0Y1oxUU1ZUDVnYStjL3Fad24xTExhalE2aDJnaUYz?=
 =?utf-8?B?R1lzT08vNGw1ME1iOTN3V1VxczZJaEZnNzVrQUVFeGpVeXdCdUQxeURrcnZP?=
 =?utf-8?B?eFgyNmsybFpqSUVDN1NVZ2ZmMDJMQ3AzbUU2YUdDb2JvN0pTV09TVFBrOGl3?=
 =?utf-8?B?dWx5V3JHaVpxM3VaeVpyMlZNdFVuaHlqVHM4RkhrN3ArVXdmVnNrK29Xb2JT?=
 =?utf-8?Q?D1jabgtX6Y8mEhnQaj52FEi74?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdebf78-4f47-4dd2-6859-08da94dbbdb8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:27:53.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCUApgX3FoG4MnkgmeRFNZ5VUzRw26osGF2TfxbJiriEHCFy8j0waRuy4l4aNDdOvcuFvEJJips6uO3W2yJ+Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721

Hi Michal,

On 12/09/2022 12:59, Michal Orzel wrote:
> This patch series introduces support to generate automatically passthrough
> device trees using lopper. This feature should be used with care as the
> corresponding lopper changes are still in an early support state. Current
> integration has been tested with several devices from ZynqMP ZCU102 board
> e.g. serial, spi, ahci, mmc.
>
> When using this feature, make sure to use the latest lopper's master branch
> status [1].

I am guessing that this is the first time the imagebuilder is using 
script from an external repo. There might always be a possibility that 
future changes to lopper (master branch) might not be backward 
compatible or might break something in imagebuilder.

As such, will it make things better if lopper is included as a 
gitsubmodule for imagebuilder. This way a specific revision of lopper 
will be in sync with a specific revision of imagebuilder.

Please let me know your thoughts.

- Ayan

>
> [1] https://github.com/devicetree-org/lopper
>
> Michal Orzel (2):
>    Refactor sanity_check_partial_dts
>    Add support for lopper to generate partial dts
>
>   README.md                | 22 ++++++++++--
>   scripts/common           | 73 +++++++++++++++++++++++++++++-----------
>   scripts/uboot-script-gen | 17 ++++++++--
>   3 files changed, 88 insertions(+), 24 deletions(-)
>


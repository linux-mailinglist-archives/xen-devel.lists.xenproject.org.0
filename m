Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D055B8E7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 11:13:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356354.584523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5knf-0006d3-EZ; Mon, 27 Jun 2022 09:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356354.584523; Mon, 27 Jun 2022 09:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5knf-0006b8-B6; Mon, 27 Jun 2022 09:12:55 +0000
Received: by outflank-mailman (input) for mailman id 356354;
 Mon, 27 Jun 2022 09:12:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GcZ/=XC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1o5knc-0006b2-U5
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 09:12:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 506d10d0-f5f9-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 11:12:49 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 09:12:47 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::6d20:93ce:c4d6:f683]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::6d20:93ce:c4d6:f683%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 09:12:47 +0000
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
X-Inumbo-ID: 506d10d0-f5f9-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cipr/Qr93yAE6mIczRhvbwlvkuykh2JziJdQRejBexHNOoT7Egb4RraD8R0OWGqI6EX376CVWSgeF5Q4A/Edt0X6siIR8xb98sjmqAiQ8t5/lUTF2IauKcJ2ouMsUbRT6zuMJ/H8bnnlYkTwV4GmhDM1qVuoFlnviUqhUlWwMeEbp0oZ1vI/EUAWeUIFoVUCgBcyNKZ2CqT5FuKABOYn5mwVCRrIkpJUW24Mb2VHkfj351Xuzg5YlrQWgAkyWoG8nkNj3tStGLBLAj45sxHymt32ZfmXIWeD27Y/JC41PdjT4YYVEesN8pe6ynJ/WKblq9ZBtEi+tx14UfDEXEChwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akhsvOYGdoJ+diln81bTJZEySyGASwisIxxl8Q5BpCM=;
 b=VsWlUXLeXrAdMzSpng7ukvVVLCQBYrx+CdaUAiHwFDiMRm5oP1kw8nQxFoOVVvmZImdQbk9yPMpkedQG1D1zwQPDoL/zeGOaiqmj4JZr+KRBPXbiUsmIR+45sxW7/txtDe/NosvW3FXUzCf9Ps5S/08RE2gpNcN8LOh4hLrv6Ffrggs+ppi58Wr4Bwd3cKlbus6Rw5oyASndkCtC2uq5XNUVAky60fz/aj1hqlM+y7nrWT/hfBa/gXsHd0L+dFfrNP6/LVukWt5NbEI07FteAvbKrdA3tFt7U4F8Y9lAQKf0pkepIfg3TIm0hgl82O2FpJja13RUBw8qWavEQsx6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akhsvOYGdoJ+diln81bTJZEySyGASwisIxxl8Q5BpCM=;
 b=IcV3By6Ms9ifc9nvvNXiKPkLhJvs6aHxrf0/Jl3iSq+1U8y++s2f+hUTqTfewneKhzg1NrXu/tqQ1i5SdLDpEa1FC/W9QXWQoDfnwQ6yw2E15k9tq1Hf2qCrESNQ8s5nvxIB6yjytuJM0rDqKGxYAO3C27nlCl5741nG5YzY5Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d20aa14a-0889-958b-15ad-91c4e1fd1578@amd.com>
Date: Mon, 27 Jun 2022 10:12:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [Viryaos-discuss] [PATCH 1/2] uboot-script-gen: prevent user
 mistakes due to DOM0_KERNEL becoming optional
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net
References: <20220626184536.666647-1-burzalodowa@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220626184536.666647-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61621b5d-65f0-4814-39dc-08da581d3392
X-MS-TrafficTypeDiagnostic: DM6PR12MB4185:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4wsa6dIr0TJjbG5/b8PJVdK9YVruO00yHuQQyrhLCMP81n+n8J338/lQjVeNACuzWMrNn3Ky/01R6n1qwvFjHvQ1tpTHNRgG5DuMFbPWhXJqI4943MP+re7gxtfg/DXVOCPgA32mFk/7PxDH1o0r7MUas4etk7jmV8UTAwEH+KzW8l3TfWJTT5VkfNOy2Nw8mPRGvhTU8wXpRebIQ8ydgR6oI7Wl0jtL/sslRdtAovhinYGHeaiT+ARiNebNAANt3fTbITCZJfX0IbUaKuDPrww7Ci0Nv6Iytrv/kTkEV8v8zqJnxnKvdfKFjOOjoqU9O/QRVS8x77OxSWrqHU7avCv7s+wBEg5wKGPPed3vz+P5L7IJQQmmbGUBjZMV/gtoQDpENTqkS87Vv8z1RdVYLWneTQdIRD2Jj/qyGs+7rsu84CGFkFm60sVdqFkGA86zcS+a+K1bg6aEsifZnix48MI26y85rIMQO5LHRDtHC+jo8onuMmJt1H0Kp2KhoHQ3gmnCZ2TCmiSEvnyARUOA23j+tv55y3RqX459jED0BO4bomS8qEjdDf3dTaRiuFyEd+hOpcZjL5lv+JNbWs3AtddzI6bf22noVJ6iye5Knjh1nLfZ1w4wr6bSiHuLPoVo7nXhVg6uPtPoZ8AncT0AfblaD8/vUWH4RIqAEczG5N9LSnjwbUDyMzlOkhy/vGxPntfsxVrgdF5VxWpgdNTQ5iGRLB4bRcmTNfUpLPc4vKRgLNr5y0rgdedMalkhRmDmxlHNVyaPaM+j9QbnO4AERj59XBGfQZWSNKFDOZeYOq5/GgkNC9QgpikIO5Y1DAje
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(66946007)(31696002)(66556008)(38100700002)(5660300002)(478600001)(66476007)(83380400001)(2616005)(41300700001)(186003)(8676002)(2906002)(4326008)(8936002)(6486002)(31686004)(316002)(6512007)(36756003)(26005)(6666004)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHdNT1U4aGRNWnYwL29Wc29qakhEd0hiUlRVajVMSytBcHB5M3k2OTZXRUc3?=
 =?utf-8?B?bER2TG1RTlZOOGFsajhiYStUS240YkNpMDlmUGtEa3ZsckhnYVpaVlFaZjNx?=
 =?utf-8?B?bzhjMzFvZ2xwSmVoTG5hUUM4VXJnZzRENXExUGdWTDBVRU5QN3RMWnczRFpl?=
 =?utf-8?B?cU5neDZ0bUhieEkzaUtnbUxuZnF3R0F5eDRSV090ZGc0dVV0L3RqQU9tc0Va?=
 =?utf-8?B?cUY2SXFDNkhxRXAyaG1YYUt0Rjk2Ly9PQWJqbWs1WDBHZXdnTGxpSGNQM0cy?=
 =?utf-8?B?aVVSK3pkazVzdzA4dzIrVXdCUDQvMklqbFo3NjdhT2ZRb24ydTdkeE8xNDRB?=
 =?utf-8?B?aVRzTVBMNTVSZk5WdHJ3bnZPMGtucC9xOTE3a0VDVnBUVklkRGgzM0ZZNmhI?=
 =?utf-8?B?UlRMOXZBNlV2cWpKWDFtUTg4QmtrZFRHUkxrR0lxQTlvWW5sV0ZhUG4yWktU?=
 =?utf-8?B?a3Q3YmFzcDRhbG85MWRRUlFaSk5CWm5ZeG9tRStzRHJTaXJCNURZb21XNVhl?=
 =?utf-8?B?NDFOYVdPUWdCdDl6UlcvSENhUThxNS9XYW85L0IremVMelJtdzNIemJodlp2?=
 =?utf-8?B?ZkxWalZ6bzh6cWoxT212RjU3ODBOcjlUVlJOblV3WWVSR2JKd1laWWg0c0Q3?=
 =?utf-8?B?d1dIaEpFNzBwc1Y5SWxZcTVBV0NZdnpRaC9KK0F3b3lZbk5EUXEvQ0czRkJF?=
 =?utf-8?B?U25oMm5ra2JiWnJTTVUyQTdpRU5VVThIODA3N0R2bE1wQ01VRDdZanFScitr?=
 =?utf-8?B?YWQ2L1BTWVZrQm5yQnVaUnE4ZW1BTW5CcmQ4NzhkSU1hc3NXT2M1Z1J2S0Ni?=
 =?utf-8?B?SnJob1psRk5IMjJGVzgxWmlmUEVtL1V6TEpzNlFjUUE3dHZKVXEwWEMyVFdH?=
 =?utf-8?B?V0ZOaFpuZ1FHR2FUOWpzbm9yakV0Y0dGamYyNERLOG9sK1pjWm0xdkk0MDlz?=
 =?utf-8?B?RlVmRFlsNDNjZkk5bm1Razc5azZWb1NtTy95bE1idjJPdG5GYkx5WlREVWhw?=
 =?utf-8?B?Q1N2ZEp3S3kyRUt4cEhlYmdRSEd2VHh5RVBPdy92bE50bUd3cWNkMEVidWVC?=
 =?utf-8?B?QjVIV3NtaHBrSXZNeWE2VzU2SzdQTFNxUnZLK0pwdjNJbGVMQlBiNFNJNTRO?=
 =?utf-8?B?T1ZXVjErRzB3RUpneSt6Nnp3eHZmOFVwRWwwc1pIdUQrUUt5U0RSZURnRXdY?=
 =?utf-8?B?U0R1a1VWRkoxWGFQZHR0WmEvQmlmcFFKNnZCQ3ZRZU90Qm5aYVJnYWRUV0tL?=
 =?utf-8?B?QmVQV29YSVdjeklNYjhIMi9lcE1ha21Sa2hibis0b080WWUwdiswbEliQ1Bz?=
 =?utf-8?B?a25YVWNpLzFHY1NidHdncFRMMENVaGRwbVBzSFVDL0JiUi9zYzR3aGlUcUVH?=
 =?utf-8?B?VndHVUIvOE1pb3RFMm1zdTJJTXU0WW9rR0p0T3hrelBVSWlKM3gyK1YwS1hX?=
 =?utf-8?B?dUdiNmdTd0JiODFrbWJ4L3pwY1BGeXA4QmdHY1lQQkFIbTV4Qlg1WDFPMFk0?=
 =?utf-8?B?ZTlXeFFESWxVZkxCa05vNEVOUitLZzl1Qy9SVTIzaFREeUtPanVKK3lrSWIx?=
 =?utf-8?B?SW5RNnREdGwzK1lmQTduSTJCYkFaR2xERGpEWGl4bXZESkF6WFdtWG1vTW1o?=
 =?utf-8?B?RGR0bDRudVJ5NW9lZk9mU2szT2xjeXFMdEFTY29tK2JnQXVaWng5ZzRxUXZJ?=
 =?utf-8?B?VjZhTS9hb0R1N0tDalArVTd6Sk9oZUZJUTJwVW8wKy9rYzMzbzdoTjlCUzZj?=
 =?utf-8?B?K3BBNVNzaEpkSDJRemUzejBJK2hOWnlQL0tSQnhkQU1nK3pTcGNhL2ZBWFBJ?=
 =?utf-8?B?NXJieTNGdjhXR3lMcGVCemZMc1J0S2hXdmpxdStUZG15VjZ6U1EvNEpyeU81?=
 =?utf-8?B?VWJCSmxMRGRkKzUyTTBVaXZ6R2QxQTdPYVZZWGcyRHI4aWlmVGMycGlpU2lV?=
 =?utf-8?B?S2s3dFFTbDdVd203ZjlVUEQ0MjBUWkZ4d25vWDZ4UHgyTWNVN3RVd3c0SnZi?=
 =?utf-8?B?RTZDZGV2K2w1dWdxaURVRlBxbktYQnpQNnV2SEpOaTJSQ0lTejBKb0JXWkZv?=
 =?utf-8?B?eEFUWnZmVkxqVXlGRjlucmxpT2l1YmgwVjBOOElzQytOMmF2czNiZGtqWVZm?=
 =?utf-8?Q?jd9wcFCHscR0nQdW7easfdA0x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61621b5d-65f0-4814-39dc-08da581d3392
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 09:12:47.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyzCzuFNOwXQpCkeUv3mODETHt5qAANa9OMFS1vPDtC1WAx3P1teOkBf3316Zt9NO2XnhO7xC0bzYhENRhP4Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185


On 26/06/2022 19:45, Xenia Ragiadakou wrote:
> Before enabling true dom0less configuration, the script was failing instantly
> if DOM0_KERNEL parameter was not specified. This behaviour has changed and
> this needs to be communicated to the user.
>
> Mention in README.md that for dom0less configurations, the parameter
> DOM0_KERNEL is optional.
>
> If DOM0_KERNEL is not set, check that no other dom0 specific parameters are
> specified by the user. Fail the script early with an appropriate error
> message, if it was invoked with erroneous configuration settings.
>
> Change message "Dom0 kernel is not specified, continue with dom0less setup."
> to "Dom0 kernel is not specified, continue with true dom0less setup."
> to refer more accurately to a dom0less setup without dom0.
>
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   README.md                |  1 +
>   scripts/uboot-script-gen | 21 ++++++++++++++-------
>   2 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/README.md b/README.md
> index 17ff206..cb15ca5 100644
> --- a/README.md
> +++ b/README.md
> @@ -100,6 +100,7 @@ Where:
>     been specified in XEN_PASSTHROUGH_PATHS.
>   
>   - DOM0_KERNEL specifies the Dom0 kernel file to load.
> +  For dom0less configurations, the parameter is optional.
>   
>   - DOM0_MEM specifies the amount of memory for Dom0 VM in MB. The default
>     is 1024. This is only applicable when XEN_CMD is not specified.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index e85c6ec..085e29f 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -410,6 +410,20 @@ function find_root_dev()
>   
>   function xen_config()
>   {
> +    if test -z "$DOM0_KERNEL"
> +    then
> +        if test "$NUM_DOMUS" -eq "0"
> +        then
> +            echo "Neither dom0 or domUs are specified, exiting."
> +            exit 1
> +        elif test "$DOM0_MEM" || test "$DOM0_VCPUS" || test "$DOM0_COLORS" || test "$DOM0_CMD" || test "$DOM0_RAMDISK" || test "$DOM0_ROOTFS"
> +        then
> +            echo "For dom0less configuration without dom0, no dom0 specific parameters should be specified, exiting."
> +            exit 1
> +        fi
> +        echo "Dom0 kernel is not specified, continue with true dom0less setup."
> +    fi
> +
>       if [ -z "$XEN_CMD" ]
>       then
>           if [ -z "$DOM0_MEM" ]
> @@ -457,13 +471,6 @@ function xen_config()
>       fi
>       if test -z "$DOM0_KERNEL"
>       then
> -        if test "$NUM_DOMUS" -eq "0"
> -        then
> -            echo "Neither dom0 or domUs are specified, exiting."
> -            exit 1
> -        fi
> -        echo "Dom0 kernel is not specified, continue with dom0less setup."
> -        unset DOM0_RAMDISK
>           # Remove dom0 specific parameters from the XEN command line.
>           local params=($XEN_CMD)
>           XEN_CMD="${params[@]/dom0*/}"


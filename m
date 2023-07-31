Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38595769013
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 10:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572816.896861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQODi-0000EN-IZ; Mon, 31 Jul 2023 08:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572816.896861; Mon, 31 Jul 2023 08:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQODi-0000C7-Ej; Mon, 31 Jul 2023 08:25:38 +0000
Received: by outflank-mailman (input) for mailman id 572816;
 Mon, 31 Jul 2023 08:25:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQODh-0000C1-Ny
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 08:25:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d293518f-2f7b-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 10:25:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9402.eurprd04.prod.outlook.com (2603:10a6:10:36a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 08:25:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 08:25:33 +0000
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
X-Inumbo-ID: d293518f-2f7b-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jjj7K7MbQ4nnz5EQZIaa+U93o4kXLOiiCxLoAhmRO4jMf2OB25YlfAaioY3DlNk16RigKseVArghPrrw2inlCIDkE2UYYu6upTBHGdwLnznQ36ced28yhJR63KeZIEGzMgxXfFcsLY5/s7zgoDPTfIpXqJfU6WtG0mK6AdOv4/p59ZTNZjeNmy2qSsXaN6L5xDxQgkHKGqX1V65GMi++gMwjmOXD1wa5y0SOPPUYs+Q99iYfcBSn647OEuvti/e6NQBTWrxExqH8I4qsLb/8u2ION1oet+w8+/yJLV9k4m3/uifFCn3dG+OLt1GhU6CEnlVcNYJ9xBsi9UncxHAjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1IOJs6dM+ln2n+eWgja0/unZdHwdc6WKQG2w9VYQzc=;
 b=V92kkcnAttZxe2gLYPGBxuUaQ9kDeOeihFY2vWvf/dU+kn7pBMWmX3Eg1l18MuwXoOMrEmpuy7P7vocWR7iThNdQLj6bb1VZkkFS+dbh87v7oWOHigUKmQr4dCyVQXWOQMG9ti3VN5KxEtidVOFl6wrHOERrstA+mWPl0DgktjWENIgJbV+T38osDV2vfnfEYCzP7C8I2B7naaQPjwE4hKa5dy66McYXngGsbhzvPEWl6376ucGsaMKbo4nF8grDeylfCl/GhHSWCT9XTFtXKaUErCL36PftkRb9H2D8YEMtoTmR6ls+lnYrDTniUpe820NVOmc9xJDG/CVQSw6WJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1IOJs6dM+ln2n+eWgja0/unZdHwdc6WKQG2w9VYQzc=;
 b=LptbSVTf81ZldtCbbJe1dqnPUIqhNo7g8cFXCGA/fmcdqV3icwob0WnUJA0L04eg+2bMpqIKwa1JmU0kwEV7sfgOKeYwTmEA3ivwmvMrtNPSu6YDzEXr6m0sZvZT/s6BYGd7avaQX2qecrQGHmqHX0TwCPyviisi7tKKGbiuKr3RybUpCe4QlT5R1bHT77Is23TxEG0hEGeoHXEqSwjMEgU01qZX7e+XvuUXnlC9qrxzsJpwHdGNtquzsp13SS6DPDoYFUM5+f7HB1YLCUhW3FOv/x+CuSIYpa8FXN8841lwsEaphzERso8Nq41lm8ItSXjpEmXnqHTSvJxXiz2jEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88fc0c4d-de8c-73ae-93ea-5df60a30493d@suse.com>
Date: Mon, 31 Jul 2023 10:25:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 3/3] x86: Delete str()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
 <20230728194320.3082120-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728194320.3082120-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 51eaba6c-bc7b-4530-b515-08db919fb554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	etPWOv9ppDm8S2O3744ym+yyDi6u0/9V685ZUs58rjB30hWa6ZHSrP5OAd/SyqDAyQlgkomcaAO0mcInQ/fxf9uGi2j1ajNXF6qZ2w0IQQVnvvxC+AyeyxEa7ORhugKb5Ah4eJpt1JBDuZOBMkdgRembs3SMq7ltjE4xEEarRpcvSaDA7QGk7qB72Vs8+YEzZJfrvQWhtR4VxTG3c1AN6DRy5xvNIo1KqojKZCQa3+lGiJwbFgHKsfVcbyEtRjXqDsU18YgD5EoAIFIsw4I+ZtB35AIpBRUAKyHVoIt2Y+VjnhvYG/wiprOwCsBmv4SxrypTC4yUuNXtfawZs4w6KYWC5HROvR6TBRTciViwMSsNLX6VnM8dl9oNS8m0Y+jGHAy4AwDEqnexDIUT4/rtNHO44515J/196dOxZtDINMxRXV02fjhlRGAygTEvpZ87SBqGgjfPO4WGzCwW2y5iImBHJRPmr1OHlDrTSq82eCwMyOjxkq1uOxd2VlfVB33I+YsJZUmHkQczJXC2tqtgYoRUrJVl3Z6szHtGFrW+7Kf3IafDGXEal1oOTEGKENSHZise3GE/cYNVAFPwxsMjOYua3e28WFYpQ8212hLOgIUxP26A9hZqsqn3j+L1xTNwb/GoBcdqR39OK7RjXSEs8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(66476007)(86362001)(31696002)(41300700001)(31686004)(8936002)(8676002)(316002)(5660300002)(6916009)(4326008)(66946007)(66556008)(54906003)(478600001)(2906002)(38100700002)(36756003)(6512007)(6486002)(6506007)(26005)(83380400001)(186003)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VS9hcVcvdXlJVVMwU1FXZUVDZ0tZMmcvSjBYalJqTjMyRjFVbmxzTWJBWjZy?=
 =?utf-8?B?alBUN3ZIQjdVZGUvYjI4RGNLVFhkQXViRFBGS3Fwb1NvVlMzUEMrWkFGM2w0?=
 =?utf-8?B?ZU1PN2hSZCtYcnBCNmhlWDVBdnRqcjEzbzFhbUVkMGhHZ0t4a2VjOWRkT1dB?=
 =?utf-8?B?WEpZbkFRVTE3ZjMyeGF1ZHlBR0prT2pqZGlEMXkwc3grYnR5Sys2cEJKY3JL?=
 =?utf-8?B?M0JkenU2Mmtsa280d3ZnSWppS00zZW5zY2F3N3Vudkd0YWhnWVpTWS9pKzRl?=
 =?utf-8?B?RHRLZ0tnVTJZdmZqWnF5VlU1RTlZaS8zK29idjNWM3FHbVR3U2lwR1VoSmcw?=
 =?utf-8?B?VXpPenNTTHVWWGs2S2N6SDVtVnpuOERiQTFNa0ZYOU1FbHhiSkNvejNTQklE?=
 =?utf-8?B?VXg3T3UyZUUwVkI5VFFzTktnNGYzbjVvWWFObkFnam96NG9QNWg5RWhXaGpx?=
 =?utf-8?B?N2NObHp0UFhyRWprTEgwVk42TFhWQVExeHl4YmR6bGNJTzExd3RiYVRmckJO?=
 =?utf-8?B?NEwrcmZYRmkrR2FuV0VnQ1A2K1JUTitjV2I4OHh1SUc3VHJsclcyMWgwc3ZQ?=
 =?utf-8?B?MWtHN0dSQlBpT3IxTEU0dlUzcWZHRHdvVUQ3QTN1SWtRK2tVM0tvWEhNbmhN?=
 =?utf-8?B?SnRyVzA2S3VzOGhZbHk1TllwQkJRbGQ0dlJKNU0vaEFzNmdGZ2NkNnVnZmtR?=
 =?utf-8?B?ZDFOTFFOODZxTk5yVUUySDBwT2ZXbjJYNi9CVGlWZGtRR0ZVK1lTTFBES3Mz?=
 =?utf-8?B?bTBaTjZqQUE4b3NJSVE4dGlWRzFqTkoxNEF4eVZjMnBFQTZIY2w1a1FtcktV?=
 =?utf-8?B?aGdxOXFFeVRzNWhqUjJSRy81Q3Vwd2NBbGlQcXJMZ2hDNXRkQnZrV01PT1RM?=
 =?utf-8?B?b200ZnE5and5NDBRUmxWOE9aR2hZdFh4M092ekE4bEg4QnJ3a05TdEZlUk4v?=
 =?utf-8?B?aGZ4bU9Hazc1UEJzcXBMSTl6Wnk5MzRDZTlPRlgrVm5HU2xZYnJGUDJKMWFS?=
 =?utf-8?B?aE9iQ3BtRGZiclhBeWR5ajZiNzk3NVVkdXc3RVlWb1pBcndHZ0h3YmJPZFdr?=
 =?utf-8?B?bHVuSHZKdFpib2JGM1h0KzBpRzgwWitRaDk0TnRlQUhHeGZiZ3loZnFEVGVX?=
 =?utf-8?B?SUJKRlgweUJ0ZXVhdi8rLzBHNGRXdEZVQkJMdlJxSENFdXlwWFhibUZKUnVQ?=
 =?utf-8?B?aC9jU0ZlUG5ERFdXZDYxUHZzMHVHbjN1RDJkejVWdERYK0hTckprL0lYbUht?=
 =?utf-8?B?WUd2VGh0SGJiRm43WkZRelM5OGh3azk5VWxaNnFnOVJNN0w2RlptUU4rM0d0?=
 =?utf-8?B?VDVPOU55UmFwUmhSQTZxUHpYNzFNdGw2REJjT1RXc3hOYWNlTzdkZHgxMjJI?=
 =?utf-8?B?MzR1VjBvUnYvTmRhZzVlbG5EUDYzd0NNOHdPaFY2ZG9mTkZtTUw2N3BMMUZ2?=
 =?utf-8?B?dHVsRFlZVzdTU2pua1JqMDNOd2EyeWJrOXlkMUxWcjcwMGxaUDhLSHN0VEZx?=
 =?utf-8?B?VHJscm1zWnFCaXQ4YmI0Q0FKQW9tNHU1NnI2ZW9FT2NxQVo0b2lYZSswSHR3?=
 =?utf-8?B?TE9yc2ZRUW9zelRLQkZreWE5dlBGRll3MVZTUVpxbzdiYVBzL1BUOExZRG9H?=
 =?utf-8?B?WnFhWFE3ejh2bmNkMnVGd2Q0b0ZJc0dNRTM1SWo2ZHRqYW94TXR1V0svajB2?=
 =?utf-8?B?TzIzVm05SXpnVEZEdityclZhZkZYa25xczNGWXNwUEhMdHYrUUdSMDV2YU5F?=
 =?utf-8?B?ODVrVEFIb1ZNTnBmaThZWXhvdkE1bElsK1E0akNTTGh0cktVb29Yd2FsQ3d4?=
 =?utf-8?B?Y08wMiszWnU1RGs5QzBDODFlc1JxdDRWOGI0U2RkNkpFTHdCOStNRlZYZXov?=
 =?utf-8?B?T1ZObm1YOUIwU3FkdmVRbkk4a2FTR09NUHNmVWdjYXRsd1BaaERVclk5RnNK?=
 =?utf-8?B?ajVWcWY5aGVwaGRFZGg1MlpnanZ1ZGRBZlJtaVp4UlpXcUQ1djBFTm9pKy9p?=
 =?utf-8?B?OHJ5eFkzVDN3UlpXem5yaEh4ZytKaFFUcDhyWWVUZ3hzUGR2MURMQ2dONzVL?=
 =?utf-8?B?MGZkSmRZRzZVcmQ0aVlYbkc4Q3RSbHE5NWxLbWJvQnN6SkpSdlM2eCsxN1Vr?=
 =?utf-8?Q?tZWbqCObEbMi0BLYJdRCXPuNK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51eaba6c-bc7b-4530-b515-08db919fb554
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 08:25:33.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvwlTg/jr/vr/misIxCV0uNATA9w7IofDj+ZR4V2HGwyyDdFSL2h9sOEwjYUi56Z3vqIYTy2Vk6ajWiRc9GdBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9402

On 28.07.2023 21:43, Andrew Cooper wrote:
> This is used in an assertion only, which is somewhat dubious to begin with and
> won't surivive the x86-S work (where TR will become be a NUL selector).

I'm kind of okay with the removal, but I can't read anything like the
above out of the doc. Can you point me at where this is said?

Jan

> Delete it now.  This avoids many cases where as a global symbol, it shadows
> local string variables.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/hvm/svm/svm.c      | 2 --
>  xen/arch/x86/include/asm/desc.h | 9 ---------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 56cb2f61bb75..4d29ad3bc36a 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1614,8 +1614,6 @@ static int _svm_cpu_up(bool bsp)
>      /* Initialize OSVW bits to be used by guests */
>      svm_host_osvw_init();
>  
> -    /* Minimal checking that enough CPU setup was done by now. */
> -    ASSERT(str() == TSS_SELECTOR);
>      svm_vmsave_pa(per_cpu(host_vmcb, cpu));
>  
>      return 0;
> diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
> index 225a864c483e..a1e0807d97ed 100644
> --- a/xen/arch/x86/include/asm/desc.h
> +++ b/xen/arch/x86/include/asm/desc.h
> @@ -238,15 +238,6 @@ static inline void ltr(unsigned int sel)
>      __asm__ __volatile__ ( "ltr %w0" :: "rm" (sel) : "memory" );
>  }
>  
> -static inline unsigned int str(void)
> -{
> -    unsigned int sel;
> -
> -    __asm__ ( "str %0" : "=r" (sel) );
> -
> -    return sel;
> -}
> -
>  #endif /* !__ASSEMBLY__ */
>  
>  #endif /* __ARCH_DESC_H */



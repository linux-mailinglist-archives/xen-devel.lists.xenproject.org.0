Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC559C0A2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 15:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391415.629223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7Xe-0004Oo-JW; Mon, 22 Aug 2022 13:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391415.629223; Mon, 22 Aug 2022 13:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7Xe-0004LN-FR; Mon, 22 Aug 2022 13:32:34 +0000
Received: by outflank-mailman (input) for mailman id 391415;
 Mon, 22 Aug 2022 13:32:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ7Xd-0004LH-BS
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 13:32:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50044.outbound.protection.outlook.com [40.107.5.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dffd961a-221e-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 15:32:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3171.eurprd04.prod.outlook.com (2603:10a6:206:8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 13:32:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:32:30 +0000
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
X-Inumbo-ID: dffd961a-221e-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZC2zQo34kDnso/eP0cBvwd5V83tfsVMkeiocH67hCb85jdkj9vfpZXATdGEeCp/kGceV1V4mAO21i31/2lx/+lGiTflmKaLQNLQmicG7xzNYa3B5jD45XODPKkTTZh7/FTK9f0rtZOeMl6kIVGNbch4sEYjW9aMr1hrwFONOri7YPQl/EGxDQAfaCwvdr1WSKbYjDFkoiG74UYcrdKJrQuwxbqOMFWH/0ajn1o10cF9yY83+CAINkmkA1ksZ4Vd1sk8RFIEA6PHHcLkdHZ35IygEpPOIrjipgEYvkGx0SDh2e61XvOcKenDDSNGvNSN6ozIMeqioergfOyJelfkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emkvf+RvM18r/zdy6kiHg/r5I4LGrEwfhhSbTNwbF3w=;
 b=OUU5y4g+i4vYyKznwjn7RzhefACWhUDC5aanhFnYCJv4dpo4fkn/cYhPCCCDKczpmFS3yD5FCv8Bw4+sIX9DsZCtYdvvdl70PBU4xWXWeFSei/9Nzw4CVlpqz44LSrn9Y/0B0+705FUTPx1KPOBtvTWCsaXMQbexso1etHrYIONZyMqkzHV9ErfeXWZ/HZd4CwxnT0s42uLmVmISlsNvbMNAPecyAlRM2mMNLET/5d+o4NT08NyAyhjHDQF0CF+vVmVe7w1kakAR9K1OzwvhZyLkRnU9FZd6+1TtNdGsyDEbqXcuKoUf/LYp/VijgOrWZdr96R4gC9w3r0uSgqQprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emkvf+RvM18r/zdy6kiHg/r5I4LGrEwfhhSbTNwbF3w=;
 b=ndwYLaYpWM8B/0zQcMocT66Tz6yLy5BlvKONBZPWJL6k5yWlOk9LxMUJ7QZcDXSGqOoBD5CUwO+VXEAQF+uWGF4heXRQyBW1n0qdgtpXw+EIxB0U+5GS6CGyFZKRPARQNx2RUzh+SdHYlQVgrlDJs+N0z6C6ztGUvc1myMT9KJQmfDKNLBRJpwcQaKJzHzDVwqpFXQrgQUYEvLSLWmxL4YWLgJb3UA4H0eOpKalhK0+xh3xLClF2r5AaljlR9dvLZpX5GJpZ4I+VVxmmP2EFQaysgR6CMDl/B29yWL1BzIAZRfrBH0sHscGWHQSopd+6cwOYD+z6fPZ+nV6fm3qTEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12fc8d64-89c9-39fc-3abc-0994bdac6d19@suse.com>
Date: Mon, 22 Aug 2022 15:32:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/entry: Fix !PV build
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220822131204.25814-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220822131204.25814-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8f64983-541b-4c43-b835-08da8442c30a
X-MS-TrafficTypeDiagnostic: AM5PR04MB3171:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w0eTg2yoxJsxliGhPoMeS6qS2ALmFqD0JJ4towDGNRwqT/rVy0SHT4uKKNpXvzxh+0Vxb+Q2Hj7QMffzXQp7fcEy3SDamUJhQ0oBMe/D+25QZje2pNdqrHnnf+UQf5AFHSrOKtg+3we3F8loVmOBFaWovgmuzhovCOxO4/0R1ybqa5yEkpFjEyLuqi+10MzLmmeOEGaHLM/ArVAaHVpMsn7CKQ6nDDQqEjPuJTL+iwrImmm6Uzh2vcAB3xGt52C+dNa9FfwgGcm0fE3hI30zZbvGwrLwa/1eImMCb4JFxQm+P9OT2l9BwK/3LKWGDfkUKmAeSLfTczlFdF7ruEQF1cNJlyUWNwi61xaHXNVzCyPm5oqkCi3c+klGZVDtn9xhexXc7BKFJjCuWqPt54o2zn5pBpS965y5xK4qsYQju7pN35VfuseZxLOnLrA0E5luPAVr1YOrqaA87fBRxrZG1nrRyQkyvkm2wGS0+TrikNyFgFiiitzyelq8vEPbS2LXfvTE6h2QfXg1UXqAYu1FkkxNKlPbC4yoHzGan6MfdHEH8jRKaTcOVNS98F8gD71VTTMUGqVc1w8wX37eD/8cB9yJ5FzrxKw4AwJTdpOVIaSBx7eSAaEWGnr237flczeQDza2vEoLLQed1oLX1Bk3QMR0KE+X8bjX5PuWA8shSY2GJooQtyMv6DWgAVDlZjhba/xuShbavISUZhIu6m2exhBvvo9wUX0lvcbO0LUeIAoewEr5RcmTYPQTN2PAflwLnitKtH6bGjsg0QTPjpmtyXiyEItmgDyArdYJQPEyNVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(366004)(396003)(376002)(86362001)(6506007)(6512007)(83380400001)(38100700002)(31696002)(6916009)(316002)(54906003)(8936002)(5660300002)(66946007)(66556008)(66476007)(8676002)(4326008)(2906002)(2616005)(186003)(41300700001)(478600001)(6486002)(53546011)(26005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHMvUzBpd3prUzNSd3crelBzYnBGRHV5T1NodWRYWFlMb3l5bis0Ukhnblpl?=
 =?utf-8?B?U1ppaWVacHlvR2J1TC91enVkQjhLY0FESDlDaGdTNjBPWDYwT3hVbXhrMUgz?=
 =?utf-8?B?UWkrWTZHWjNUYUdiVTFpa0dMeDdldmVpWUtFbHUwWFVOcDlTdkw5UDZRaW9x?=
 =?utf-8?B?Smx5MFNrYUozTVZBRitESXZpVHd5Y2VjU3l2UGQ2bHRQZWtobjZOSFJtTjlD?=
 =?utf-8?B?UTlnSk5rak1RRzEreTdtNWJtcFZMQTNuQWQ5K2wvUmFFRkhHYVBnZGhhZ3Vz?=
 =?utf-8?B?VmpFcEFIMmJIb3QrR2ZyZmxoNmtKNks0ZDNzT1VVdXFqVDRXMDFOTVA5aXBh?=
 =?utf-8?B?RW9adGhCOWNBZElGZXFsSjZwK09waWJnNzdvK1pwakcwQW4ydkdsODc5bldK?=
 =?utf-8?B?Q3lBOC9XdjBQeE1ybGlJU2NjaDNiNjM5Qmd3OGl5SVNBVUpnTEtDUTBpR0k4?=
 =?utf-8?B?VENCNURFYVRKcmtrNCtxU0VNTjBYOWlmYmZ0ZU9pUjRkMlJleHBtNUNRenVs?=
 =?utf-8?B?cXc4L3hUWHpMTzZJNk91aE5XZzgrdHlYSmtlaXIrQ01WeDQ1Ym8xak84TzVC?=
 =?utf-8?B?TG1ocUxCa05YZHhKY2RlMENiM0I0SVNVbjFnWFplbEtjVGxCczFVVUZlNzZY?=
 =?utf-8?B?VmcwRWZuSWpsR3Zxb0Y5QWs0cklVWUI4b1ZURitIMGI0MkcrYThvZElvWmMr?=
 =?utf-8?B?NGJlZFo5c3JoSXZ1akoxK2NnVzkrSnBQSmFScW4rQjlGMjFvVUNmM01XL2Vv?=
 =?utf-8?B?ZVVlOGRNdCt1KzZMaGlySjhVcjV2dzZ2Z1l5Z3I2UjdZeVl6NkJjamtIWlpX?=
 =?utf-8?B?cVE2dDV4Ynp5ckVvREdXMDhoYUhJSkRXWmxGSTIrenp6Tys4eTVNS2J4ZWhZ?=
 =?utf-8?B?VHlzZ2pXM0hybVY3b0h6VFh2Y3RXQXVDMnlmL2N5Q3Fnd2pJSldpd1lSdVFV?=
 =?utf-8?B?b3ZIRmxnT1dlV2JSUHkxVm9tUXAreWc1cW1rTW0vZUVwSlQ1cmNJUUY2R2gr?=
 =?utf-8?B?ZHd0cllISDhpSU0zN2JabGlCeS82RmpRdEhyd0ltWFBMM0htTlo2RzJsU2l3?=
 =?utf-8?B?dmNGZ0oweFR2bk1DRjJ2aGptbHNVNHFWRnFESGdkV1BjcnZjS3RjMW5FL2RD?=
 =?utf-8?B?TmpUb0lmbFRsT1RUYkNpOEFZdUE3elRTWXVPc2FvbjJUSU50SHQ5anVqaUpU?=
 =?utf-8?B?ZG5IYklnMlMyNk1EWUZ3WE9pQ3RlT2Yrb0tkNC9IOUdpN3p6dDU1dDMxdTZZ?=
 =?utf-8?B?S3BZNktsbVZjTTZpUmtjQnZleE5DWFpzdk9JeDVkN3g4NWY5WlNFM3B0bnZj?=
 =?utf-8?B?KzE3U0pJb0tvbWhvQUUwUWhnczRpcHlIMWpGdDg4dlp5aUVvUUZLRERGTVFx?=
 =?utf-8?B?NGR4VUFWdmpGMHFjRFozYXNCeWNNNHROcEZUdFg0SmV2VmVHckxmZ3VoeWky?=
 =?utf-8?B?MjF6Tkt0MWkzZkc2RVFNQ0ZSLytCSmpKY1huTGZVbWdFcHZweDdtZEpFaHZl?=
 =?utf-8?B?dDZERmlrZzNhc0pTWmxIWGg5eWdOVm5HbG9ZakVpTG8wTXhrZUh2K1NTUTJT?=
 =?utf-8?B?Vy9PMCtlRGViTmY0OEZqR29UTEliOVQ0RXdvRnNBeWpsenZLUjIzdHVEcWVR?=
 =?utf-8?B?c2l6U2hpeWFjelpaZ0ptTzU0R05MVkVIMkpKdmlmTjRSM09MNjUxVUREeUFG?=
 =?utf-8?B?UndLbXZlNTUrc0VTNzB0cUo3bjB5MlhQeWFIbm9EOEIrMjVpQjlDM2pqcUt0?=
 =?utf-8?B?eStuK1JiWVhuUlU0eUp5cHdvTFpnQ0FMQlFiYTFNNWtYdUV5ZUxXMkx5V29T?=
 =?utf-8?B?NlhKd01rYzM1bmUvZFVWeUhhaTdsWTY5YjJ0UXp0WngwQnZSbnNOcUxaZ0dR?=
 =?utf-8?B?czk2YVZILzYxMGNPa1dQK3dRUGpjS2xTV1BNS0puZ3NtSGVaOFdOUUxpRzl1?=
 =?utf-8?B?WEd5WC9tUWM1WWQxOHU1NFZITG13b2g3dXlPSjRHVFVsdXR1OWxueWlVMWtj?=
 =?utf-8?B?R0I2YXRHRW9iWEJFQW1vS0NyZjlHOHlDaVlIa3I5cGlKOWQ5eHBTUVBxNjNn?=
 =?utf-8?B?VjJ6RHVucHo0NTJZOTFSbkVybVpERXlydkpzdlFWVzdFa0RBMGxSOHkrRWIr?=
 =?utf-8?Q?CG67d9Y6vj7IyvT9dg42icJVu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f64983-541b-4c43-b835-08da8442c30a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:32:30.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8KHYltfQkQMcGEE9H7OLKnAwG22I2DpnYGgYbpFOqsesB/Rj7oOJcMwZi3ybDOGILsuXCNu+NtjUWCWjXml3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3171

On 22.08.2022 15:12, Andrew Cooper wrote:
> early_page_fault() needs to outside of #ifdef CONFIG_PV
> 
> Spotted by Gitlab CI.
> 
> Fixes: fe3f50726e87 ("x86/entry: move .init.text section higher up in the code for readability")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Makes me wonder whether the original change then really was worth it.

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -22,6 +22,17 @@
>  #endif
>  .endm
>  
> +        .section .init.text, "ax", @progbits
> +ENTRY(early_page_fault)
> +        ENDBR64
> +        movl  $TRAP_page_fault, 4(%rsp)
> +        SAVE_ALL
> +        movq  %rsp, %rdi
> +        call  do_early_page_fault
> +        jmp   restore_all_xen
> +
> +        .text
> +
>  #ifdef CONFIG_PV
>  /* %rbx: struct vcpu */
>  switch_to_kernel:

Rather than putting it at the very top of the file, may I suggest to put
it immediately after

/* --- CODE BELOW THIS LINE (MOSTLY) NOT GUEST RELATED --- */

or yet a few more lines down between continue_pv_domain and
restore_all_xen? Which, as a minor gain, then also doesn't require you
to add a new .text (or other section) directive. Preferably that way
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


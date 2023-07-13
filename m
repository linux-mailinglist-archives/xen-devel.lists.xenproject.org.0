Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6472752159
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 14:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563142.880164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvZO-0008Qh-Lj; Thu, 13 Jul 2023 12:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563142.880164; Thu, 13 Jul 2023 12:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvZO-0008Od-If; Thu, 13 Jul 2023 12:37:18 +0000
Received: by outflank-mailman (input) for mailman id 563142;
 Thu, 13 Jul 2023 12:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJvZN-0008OX-SR
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 12:37:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff3a393c-2179-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 14:37:15 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8065.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 12:37:13 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 12:37:13 +0000
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
X-Inumbo-ID: ff3a393c-2179-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVsQEsUly5uReDrkAbi4+mZUkz/G8Ih1F6XlFt5oP+o+pUcntjjApvRlPsN0eZPqeJLdFNf3Fsg5ZcQIG3CmxcFQAh5HqgcHi+a2RbRw6ItqFiJDVlum5gjNTj3bG+UBPL5gB4fYGgbRvRFE1sD7wpFa1sLRmSVKXdgaFMQi2io/tZxRBf96imzeiCyxKqgWY0uSQxKbqLoWsl1A6LQacH1M2mswOzJlUubIi48SqnYFmTn9JM5t0eFY9ewcBZP0ojvZ8EvDXprZ8d3bDdmSO8K5DiI8zoMxUnVEGnDP1qcIFSodUF4kuoy6SoGFIvW4LZ7ntjV7In0un7/ODihJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YFlR+gDc6meItpOHRB1S3DEccJnN0Wdyc9BOoURh00=;
 b=WfntvFURbjaqJH9F72DGAVE0B9HDPo5/LYmNchcoIOppVWHJFpeh4KksnS/yoAruy9lRDyPjqyuMn4Tt/dCGlA+k121ASl3pxONGnYyoYEXEdGvfQaO+fBgKBS+RTblJ6LwQJ/wUYtPSVdauCmiXcIXGTitzVS6/1k9FHNmxCbVZF1GPRn10/mlW43TA6ijmVaWXLPjPUqJsij4/LbQsN0i1WkQ2YlkAzXwwQdWA7x474MZCJlbQBROl2RweoiSxX25GC+X5azZTuxLxH5QgDGJ4R6la0ea7IeMohFlNGbvabng8ZrfmKDTxP0ZtNHLwnj4fytmKC0yflEvoezKtIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YFlR+gDc6meItpOHRB1S3DEccJnN0Wdyc9BOoURh00=;
 b=uH0DUqSQ6ADrHsixMJzEjVzoG+9hvtDwTEKPHwBeGyOpJLVGeOHUEBuX3f/E0ZUPQaNuoBp69tmHqoXt4KyaAafBShKA6GWgqrZEV2npfCl0rjENyPxv/UzxOXP3AhL5rJa21eleeS27AJBS6M1h1868L8YVgdd2f90fykNTTnhbFMj7lIkSHflusVlH2+kaNigcETxOzn+N0aDaFzv0KqFadjcf7QdCd72rF/C4SWMIQrbpwyKKxIpTj4Vth+u0YaHdtjD1rOMyWG7iDBAQAhBJli3e5rtOT8tK7DMYG8aeYqU24QTcITJXDOIt5SzU8HeDGHfyUfffYJmU1c47uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e16348c-4b43-0ed3-fa53-b7bb69538437@suse.com>
Date: Thu, 13 Jul 2023 14:37:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 09/15] cpufreq: Export HWP parameters to userspace as
 CPPC
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-10-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230706185440.48333-10-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c601e5c-98c9-4d31-6735-08db839de242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t9fouMGYfvBQBFX2YM3SqFaOz71Z/IvH03HwhIgQrblpSPQKN9AzswwaHDbRQ8qzmOg6U5M5hW9hRSsfOw9tK1mHW7NzJM8YAHxGK3r3RpKHMwUXU9e+XLe4ProxdJF+DcF35Rtf8OVhkh3L+SG+aZLSGe2G2SDNyVE1TGXkZF05zmUhw1rVsy6QRWjwUIFLlI8R8/ej5ZHw4XD91EAgGZCw3EYtnFo+ETezXqfYtA73WOljIkU1SFxGcNbw+RHbYZ1aTl+3iNYOI92wWkdYS7N8icRMZX4k+jqfrqresQSKOVXghT/Wx4rBUMhFr+F3SCk1NScgscF4xCNhA7gXR3eI0DJVnehX+/8lemuUgf6dZBr554SHxDUtRPcFKtLvb0ZKBO7cvacP5iG6rCMgcMsES5ERDrvenWBKva214PCS9qq6WLUjpCdmnSu9YFLsc8boML05aIzCFmbWFUF3RJBbV65nocS1CyPD1ibaNU1l9NMVpQLLINEGK9J3Ek+Zot8YImvnU4Wocc/SmT9Oo+N5RAOu28VW2KmcWAetSiQ4CpFIwShNgJXs2rTKDQwhUjsz6QnDydKMZUoE+RnXmFit12uI59aJkD3ENMQi4D4trc4EL1YzBMtA5pylpNCy5OpRVeQr8S0SGbHX422d7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(2906002)(38100700002)(6512007)(83380400001)(2616005)(186003)(26005)(53546011)(6506007)(86362001)(31696002)(5660300002)(8676002)(8936002)(36756003)(478600001)(54906003)(6486002)(41300700001)(316002)(66946007)(66556008)(66476007)(4326008)(6916009)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OS9LUUNwZVdhVnRvT05ESk5xNGlNUTZUTGxOOFU0K3FDQTArMWYvemc4NXZI?=
 =?utf-8?B?NkFvaHJnVVBzV1pVSWtLaFV4bDlka2J0VExTQ1JsdFpHN053YlB2SW9uK0Nj?=
 =?utf-8?B?OFlGVlNIUXc2cWpmTFZUV1lUczAzRWNnQ1A2RzdjQmtrdE4yWWdwODlMUFFr?=
 =?utf-8?B?bEI1a0tlVkFTUXpMS2pBT3NOVy9FOGxJOVYzQUdyNXhkbURGZzBvdExHZVcx?=
 =?utf-8?B?SHBoQ24yK3VGWHE5MTlTVGpjZCtqQWpIUTNueUEyMmFsR1ZWS2JKOUlxeVp4?=
 =?utf-8?B?Z1dDRVFYY3FGcHhZOUdtUHJXMWw0bkRvZXczSlBNamZuS3ZCdU81QnUxejZN?=
 =?utf-8?B?Ukl5M1NiS21FMzEzcHpxM250bkhuN0lab2RmSFp5YzhVM25UeGk5bUZRZiti?=
 =?utf-8?B?L1U2U1JiTlZ5eHVtdkluajhuSVVtUWtqNFZZWTFEUDlkOW5aODJKZ3FvYUJH?=
 =?utf-8?B?UG1hZ0FRYmtCT2FmdDhNcUxTV1VSeW8yRG0vZEdyblZPSDhXZHdDRlZXS0U1?=
 =?utf-8?B?OTg2NkJHQkk4UkovcUkrdUdCejd3V1l0Yi9SM0lGby9PUW16eFRDcUJPM0du?=
 =?utf-8?B?U05xTEhiYWJVRkpxRjZ3ZzFqM2dTdGd6TWp1Q215R2VsQ0EzQUgyd0Y4ODFW?=
 =?utf-8?B?SW1kazhzbGkycktneFlQQWJrZVN3RmtySDBPc0ZSdTBTUUt0OGltamRFVkdQ?=
 =?utf-8?B?S0g3WUVIdGxvUE14NCtkdSszRm4waVNWeUp2VFdoaml1MTgxM3NnbFpkcEtK?=
 =?utf-8?B?NkFNYS9rVWRId1c0N0dWTGJoaFhBaFRQVlhvN2ZjMlZMdGtqQXhqNFptdi95?=
 =?utf-8?B?bWhaWi9sMFZSKy9GL1lLaHlod2EvVlpSZnAvMmVqdWY1cTJWejMrYTU3dTZ2?=
 =?utf-8?B?ME9YVEpOanNVMFJUNzFIWXdrZUc4Y21iWHJxYi90ekJ4MXBNOVhDOURIdFFy?=
 =?utf-8?B?cm1UTUt4cndkMHlNZGdKell1dm9BeXBEL25rNjJSYkpjekszSnRPVVB4N2pS?=
 =?utf-8?B?bE03OWhqUlFLUVRVWGpFQXEvTDlGMlNabkw5d1J1NzdieENJalZxZkZ1N05y?=
 =?utf-8?B?OENXbWNYLytkU2ZyNUFmbnpubWRhd1c4c2JKTm9OSGpZUUJkOUFjT3FtNm5Y?=
 =?utf-8?B?eFVkOW5mckgrTkw5SW9mdDcrUnY3ZE5obzBMSkQwd3Y5b3lDb1p3bWhxcnVx?=
 =?utf-8?B?OHpKMlNBZHpkYWVQUWdWVVU0QlhoMjZMb1dXT2tYeTZ5WDJMWHhZZUxGeXc3?=
 =?utf-8?B?UllHREtuZGN4Vk01YVRGNzNhRUlvS1phS2JlQ0I3Y2xUODZKM3V3enE5Yk4x?=
 =?utf-8?B?L1R6b2dKMVdlL2Jza2hGdEJUZkpUMWg0US9lbUJCM2NJZTBONlF1eTg2dnJK?=
 =?utf-8?B?WFEvYW9EVE9iWXV2d3JxbFRGd3RQSExzUEZnV0N4bFVBZlQrZTR2dzF1QjF5?=
 =?utf-8?B?bmxRUW5pYkJRazNDQkdoNGdobks4bTJQVUM0UjA0OUJHb0wwdzN4L2YrUXpP?=
 =?utf-8?B?RUZ1ZXlpQS9EcDZBM2JwNXc3UUtwa3JNT1Y5TFBoYjh0RHpsRTk4NTR6SzIw?=
 =?utf-8?B?T1BwOWJIeE1TVUhwN3JPYll5ejB4OGZoV1RYVERoQjkyVlJsYThNUitEUEty?=
 =?utf-8?B?amRWeE85N0NUakZ6NGtPYU54T0xOQUlpSHpKZVM3bEpvME9FQjgwUDVCNjBD?=
 =?utf-8?B?SG1oT21LRXpEbmNycGpJd0pDTUVMRzhrOW5yaVpkTkN1YmliQzJsL2VFMDRL?=
 =?utf-8?B?QjdvMlpDYlc5VFl4Z0tocWpVWFhwMmRBRUhzWXo0TE9zclFaTFovbkxIc2pm?=
 =?utf-8?B?WklVK2JmNFRWNGJQd0t6bnEzZFZwcG40a05NYzFIMlBDTXNrUWJQTlZjWnJj?=
 =?utf-8?B?L0ZWUjczUkRwRGp6V05uRDR4Z0dEZnpmTTBxQXo0YjlScGhoZUZQL0E1UUNs?=
 =?utf-8?B?ZWNEWnZiK1F4aU56Zkc0M09RWTFTaXhZeXAvRWw2b1haSzhjN3pUc3pSTllL?=
 =?utf-8?B?NlFKNjFKeW5PeWpxVWRERkxFaXpVdmk4YWZLQVNOTFRGMUU5VDBqbU9tdHdU?=
 =?utf-8?B?K0xRejVFNDU0dmhKQUtLZC95ZVhTWE1HTkFSSVVyc0hUM1dGbjRGaVFJdmQy?=
 =?utf-8?Q?I3QdYBLuQTCAzt67kYO9QzVTS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c601e5c-98c9-4d31-6735-08db839de242
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 12:37:13.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZVce08La/0A3AAvGsRdqxLMf7+4LqBQRWB3lzh4FVReMQsjKtQrwOLSGxeNiBx8seZDRGvc2MpzCJ2hgb+P5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8065

On 06.07.2023 20:54, Jason Andryuk wrote:
> Extend xen_get_cpufreq_para to return hwp parameters.  HWP is an
> implementation of ACPI CPPC (Collaborative Processor Performance
> Control).  Use the CPPC name since that might be useful in the future
> for AMD P-state.
> 
> We need the features bitmask to indicate fields supported by the actual
> hardware - this only applies to activity window for the time being.
> 
> The HWP most_efficient is mapped to CPPC lowest_nonlinear, and guaranteed is
> mapped to nominal.  CPPC has a guaranteed that is optional while nominal
> is required.  ACPI spec says "If this register is not implemented, OSPM
> assumes guaranteed performance is always equal to nominal performance."
> 
> The use of uint8_t parameters matches the hardware size.  uint32_t
> entries grows the sysctl_t past the build assertion in setup.c.  The
> uint8_t ranges are supported across multiple generations, so hopefully
> they won't change.

Isn't this paragraph stale now?

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -251,46 +251,52 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      else
>          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>  
> -    if ( !(scaling_available_governors =
> -           xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> -        return -ENOMEM;
> -    if ( (ret = read_scaling_available_governors(scaling_available_governors,
> -                gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
> +    if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
> +                      CPUFREQ_NAME_LEN) )
> +        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
> +    else
>      {
> +        if ( !(scaling_available_governors =
> +               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> +            return -ENOMEM;
> +        if ( (ret = read_scaling_available_governors(
> +                        scaling_available_governors,
> +                        gov_num * CPUFREQ_NAME_LEN *
> +                            sizeof(*scaling_available_governors) )) )

Nit: Too deep indentation of this last line. If you want to visually
express the continuation of the last argument, add a pair of parens:

        if ( (ret = read_scaling_available_governors(
                        scaling_available_governors,
                        (gov_num * CPUFREQ_NAME_LEN *
                         sizeof(*scaling_available_governors)))) )

Otherwise all line beginnings want to align with one another, no matter
whether new or continued argument.

Also there's a stray blank after the 1st closing paren.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -296,6 +296,61 @@ struct xen_ondemand {
>      uint32_t up_threshold;
>  };
>  
> +struct xen_cppc_para {
> +    /* OUT */
> +    /* activity_window supported if set */
> +#define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
> +    uint32_t features; /* bit flags for features */
> +    /*
> +     * See Intel SDM: HWP Performance Range and Dynamic Capabilities
> +     *
> +     * These four are 0-255 hardware-provided values.  They "continuous,

Nit: "They're"

> +     * abstract unit-less, performance" values.  Smaller numbers are slower
> +     * and larger ones are faster.
> +     */

With the adjustments (provided you agree)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


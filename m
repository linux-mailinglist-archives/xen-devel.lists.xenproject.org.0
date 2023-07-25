Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13668760A53
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 08:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569444.890176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBW5-00022z-PJ; Tue, 25 Jul 2023 06:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569444.890176; Tue, 25 Jul 2023 06:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBW5-0001zh-MR; Tue, 25 Jul 2023 06:27:29 +0000
Received: by outflank-mailman (input) for mailman id 569444;
 Tue, 25 Jul 2023 06:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOBW3-0001zb-Bo
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 06:27:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e6e8af7-2ab4-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 08:27:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6913.eurprd04.prod.outlook.com (2603:10a6:208:184::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 06:27:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 06:27:22 +0000
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
X-Inumbo-ID: 4e6e8af7-2ab4-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcwtXWxhj4BVtisZb/CrRyzno2hq+hqiFJ33bAW2X/R13tt66MdWQuzOXpGUY2yt8N/H7HYqmwQxA9e70F+3PDwlr7zP8vQYVVxI7WHxFfZwFC3HuhzEuxmCTZsAX1TYLCxLSQYiS1pEajvE9R1qV1+FjNmLMc7zP0k/z6pRUhnt4kNsawRsV3RTbtLKohEjfnGYqrAnHg0cixt9PsIRRJaCKKUJTlCdZDeZjzqFE3xj4S0MD672RVMlKJxEs32Jm92aLvtOc+/yz1rW5+wVFO6ip22FpvtrZxhd0+KHB+rywct0J7gTNiuBVqalEfCQiwzb9haljimJWDEAy9eJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GA4MOW5AKBwAfd4brLWNNySCOAmZVuNXK3Cc4TRsOyI=;
 b=RiEjNSH6j8dKk4SKyYyQvrxlQjoS4KRnc7tZPuUJgmeMOdR+rzSKvwYv8wpk/jizoSGfPyTV9CH09kI89n0nPgERImtwtrlz9fY84EECLyUox7+yXbjbWMsjaVucfUBa53135jNpWSA8tv/my3RYnh8sRbSyrBHS+VRoElz3XkQaVp7P8fVc5GcmdfBdfOdLIQIrDh9oIDMzviJDl1VxpaWGt2NPQRUGaH/707/C6usHDtty/VluBmp8sG+/IeS8I7WmAW1Zx9b1RqYI2rKNk8R9UlKiiQ8j5XlZOxFKP8G94KX5dPOOrOWwMXnumxC33mii+xymb9Yu19Vd6UPX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GA4MOW5AKBwAfd4brLWNNySCOAmZVuNXK3Cc4TRsOyI=;
 b=rf7naCbJJ8A7iVXNY4pQ69YQjoQugU5AAPqqHJJUS67/4bAtBYzHIRL5YB7hm8HyqcepOIoSDOP3bePtVL5xUbSMwQOf+j0oy2gQ7J3KFp4J0j23zH9OW5ak5jph5R6ZK4MBGFs4yPcZPKafM7gwAclkRgCBacHIj7ioGFVqLQVyTYA/DPgTk1d+2C3hGgWIA7hRFvOfvcmlYG6PUei1x45s2dkCIJmxKzy/+0dJizDZrg+YIfg2jmPZFbWogsfKkhW/dsSpgm9xJmohROCMGS1fuJFi6W38yLGjP5yxnEcH5GYn13j/PfsvhyRDOMipvJ++dg+LwXNc++mh338nQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3d8123e-2b81-d3e0-3883-83dcdaf99700@suse.com>
Date: Tue, 25 Jul 2023 08:27:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230724125857.11133-1-jandryuk@gmail.com>
 <20230724125857.11133-7-jandryuk@gmail.com>
 <7636d3d2-c78d-711a-ed90-aedd1b464c6c@suse.com>
 <CAKf6xpt1LzKMv7E-G3sTpUWrEApy+BX8z7dG69oS1upHcpytMg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpt1LzKMv7E-G3sTpUWrEApy+BX8z7dG69oS1upHcpytMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dab50fe-884f-4ece-4951-08db8cd83453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kjSepgdMn2WwKcP+cAFTYQNXCf58bqTybScxVUFzal1HHExp4egtxPZBm4g93+7pfMI+KQ0qPLXm8ulus3Wcqjiwi2/VxTqRZcE+N8lbfZpDUCwLhjeIKep3kTiTo5pGJZUFhYKiF999PEZKZrKp0zaO3XfkEs4wKBMCjKF0FZqD7u+kADYiV7bv/+F/wKnQE2vkOy7mpUp8xZVDaIC/+4y8I+qtrgGij0lXB0D+9Ir6yBM/ns7SZP3CUoY4s83RDlDWhs/fHQfhKG7OCPMygRF1ZopD/GAm5IfkzQA6VYVrfmdL6rDPT1YVkshSGAyFjZD3mF18y+eNNnUvXL1eWPxmpTjavq94qvJ2yo0UzQcX9QRe5DC8w/chJlTbFuyMmalFcnISDmwMSZMITe2ISS8ESRJ30MmVfwtVJAuCrcFql3Fx9E+8fsA62lypIQB1EJcTwkhZYRB2e4tHskMu3zhBwAAVxh3v0r6qn7veOT4gRPF2Klr/LjcSRUJQwAtLwppINZ9LaJtg+LLzvHjEu6HxNr7Zu479zhqik6dqljPYJFtpXmQ0j5iRk1GLMCtJitEh83Gpb98drQ+mRNlarb7RUPVQukXoMs+0UF1rEkf3/+rewPAjrxA5fNDmzeZId2iu1Cb+JQjNueONIGCvtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(31686004)(8936002)(8676002)(5660300002)(41300700001)(316002)(4326008)(6916009)(2906002)(54906003)(66556008)(66476007)(66946007)(6486002)(6512007)(26005)(53546011)(186003)(478600001)(6506007)(31696002)(86362001)(36756003)(2616005)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0s4bkZOZDhVVEVJSG12dVBVSGw2V0wxODByTHp2ck1hMVJ4T1NKZTRZT21m?=
 =?utf-8?B?Qkdaa0hRUk9JTVpmendLUzFjWnJ1MzZ6N2tkNDJ1djd3QUFsYTVHdm9GVnhZ?=
 =?utf-8?B?UGpCYlFEb3lRV0dRcjlOaWtCd0Z1amFtNHlZbU9CT29EWUxPdnRWbWpyVWI0?=
 =?utf-8?B?YnhEVmtGbjJZNy9wUEhRajZiSnpGTnZZWlFxUnQvbTB3R2kwRjFIRVdyb2NM?=
 =?utf-8?B?a2xNdXlzTU9JbHA0a3U5Qm4wZW1CUVBVVHRydDN0Wis0OTJQVE80OFhFQ1ph?=
 =?utf-8?B?Q2ZKZnoyMm14b1B3SmhGWlpRQ0liQjROb1FDVjM1ZWt1MmEvaWxQSnNTaTB0?=
 =?utf-8?B?aVpjcHNZaENxRlkyQURFLytMZG82cWs2ak83alRxa0haWXVuMXJTQThWUWlU?=
 =?utf-8?B?dy82SUhVL1dramx5ZXlvR2ZNY2o0UjIvWENUckdNWkJlb3RjM0NYeDJyUzlo?=
 =?utf-8?B?cSt2ejhsTHk1S3VEZ3cvOEFRY0Mzd2Q4TURZTUJuUzNEb3JrR1l6bWY3b3Uz?=
 =?utf-8?B?SWJxWE51SUxuWVM1dzIvM21CbHdmSzFmL3A2OE9GR2svRFZEbnZGWWM2ZE8x?=
 =?utf-8?B?SWdjOFdKWTZiRWlMTUI5TGRGbjBSUGtwQldLT0NKYjNQSU83Rk8zVEk3dGM3?=
 =?utf-8?B?emI2Q0NoK2dDd0dLMkkwczlacFVURTlsa1hGNTlVeHltR0cwRStpWFBCdStS?=
 =?utf-8?B?QkUyYlJIOFpVVHVQZFpQRnRWeWRqZE1wK0preXBBbCtSMDJjQmpyVkRFSGhJ?=
 =?utf-8?B?OFpyYTg1OGQ3RVFaRUdFYzV2OFUzczI4TlVBV2ZzWlp1bG5MaTg4b1FLbjBM?=
 =?utf-8?B?Vk1zcjBqK1cvUjRPZTdiMWtUVjJ1TVRPczVIMjlTZlFxMWd5Mm8zbmNZSjQ1?=
 =?utf-8?B?dXpZcjhpM0JsYjh0RkNDZy9Fdi9ROE5iMDNCbkZhVjh1THFkMVNEd2s3Q0xG?=
 =?utf-8?B?VkQ0VHV4RDJ1R2ZkUDU4ZnVGd3VpRE9CTk9QLzdhc0RadzJlZDBNbjloM2xJ?=
 =?utf-8?B?VzJJMUNSbitMaUdseWNUcEFtZnlSSVlPR1pOaXJHazU2S2hvVzVWS09WeVJ2?=
 =?utf-8?B?TDRKdFVCWHFQR1IvZk9Yek9EcjlMdGlVZElhOW5rOWJ5UjI2clF5R0REL3RW?=
 =?utf-8?B?VUVNSWErd0g1N01FRUFoNUVITEFEZlJhQkVJY0N5VTAyUTB2UkhQcWlXQ3ZR?=
 =?utf-8?B?ekl6R25DZlpDdDAzOXZQbmtwaEdoN1RnZzA4eExQNmZwbzlyaUdQbzdsRktp?=
 =?utf-8?B?WVE0RVVzYjZGQ0E1ZU15SkRFWDMyRUZuODhkSnYyS1VkN3d1UzRpMlFzUHhM?=
 =?utf-8?B?SDdxMlB6NUFNbURKclZQQXE5S3pVc0NiSW5aaFRlMnc0cWg2L0p4WnFmNnNk?=
 =?utf-8?B?bDdDQjRkTVhvcXVJZnI5WGdQOGFYbmZjem0zYnluV2VPSnREMUx3amMxVVNP?=
 =?utf-8?B?Q09MdHJod2xGT1dzdGxZUTR2TXpsaTBQYStGOS94dkd6V1EyWUVpcEduQzBp?=
 =?utf-8?B?ei8zZy82ZTIzUDNERjhUQkJRcHU2TTBpMXY2NlZoWjdMZW5ONksrWldYcFh6?=
 =?utf-8?B?d0JnQVNBbTVsV05PbVUwdG9OZXZ6SkhrOHYwNGUwL0N1MzlTL2FoeUlUdHNp?=
 =?utf-8?B?d1kzeVZ3TEhVNUhrci9ZYWNLOXpxRFFNOGcxM0lRTktEekVweElnVWtHa3h0?=
 =?utf-8?B?cWtXVyt2cllIRlZPR2hRYys4M2U3dFRpcUgxR0swZHVoY1NNU0xYTnI1Q0dV?=
 =?utf-8?B?ZjBQNG1tcU9peDBXSjkyYjRGZkxxUjZURldDTWJGcFVRVjdvQnVjenBsM0dl?=
 =?utf-8?B?OUtrNUdsc2FqTWRiNWJPU1FMN2FDY0RSN2VKbXV2WTFZbE8vbWNlN2JrcmpB?=
 =?utf-8?B?OHZCTEJEVUdhQnRGemwrNFU0clJRbUVkVWV5SXI2VDJhRGJqdUJMcUNhK2g2?=
 =?utf-8?B?TGdwNFF6Q0pTK2RDc09ZQzh5bDdsWjNucElXTXB4eFd5bWMzazVpZnFOWW54?=
 =?utf-8?B?ZlRZRHlMVG1vQnR6dG02Mngzcm5ML2M2WWovOVdaaWVzcUtXSEhnMDJNMWE2?=
 =?utf-8?B?c1pVdFhzMFNUb2VHQXNoMXFpTVRBcTV6RGs0eDY5bjVoZnQrTFFFQ050N3l4?=
 =?utf-8?Q?qNPxsuTxQrWknHe8vzds9A94f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dab50fe-884f-4ece-4951-08db8cd83453
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 06:27:22.2990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRgyNi7JA39GQNmKeLkBO8P1SaBUDVBxtbozpsgkLLfRYamUHCNSiZm/Wx8xwFl1sxvX41C41cKKn9foe/1UUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913

On 24.07.2023 21:49, Jason Andryuk wrote:
> On Mon, Jul 24, 2023 at 12:15 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.07.2023 14:58, Jason Andryuk wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
>>> @@ -0,0 +1,521 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
>>> + *
>>> + * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
>>> + */
>>> +
>>> +#include <xen/cpumask.h>
>>> +#include <xen/init.h>
>>> +#include <xen/param.h>
>>> +#include <xen/xmalloc.h>
>>> +#include <asm/msr.h>
>>> +#include <acpi/cpufreq/cpufreq.h>
>>> +
>>> +static bool __ro_after_init feature_hwp_notification;
>>> +static bool __ro_after_init feature_hwp_activity_window;
>>> +
>>> +static bool __ro_after_init feature_hdc;
>>> +
>>> +static bool __ro_after_init opt_cpufreq_hdc = true;
>>> +
>>> +union hwp_request
>>> +{
>>> +    struct
>>> +    {
>>> +        unsigned int min_perf:8;
>>> +        unsigned int max_perf:8;
>>> +        unsigned int desired:8;
>>> +        unsigned int energy_perf:8;
>>> +        unsigned int activity_window:10;
>>> +        bool package_control:1;
>>> +        unsigned int :16;
>>> +        bool activity_window_valid:1;
>>> +        bool energy_perf_valid:1;
>>> +        bool desired_valid:1;
>>> +        bool max_perf_valid:1;
>>> +        bool min_perf_valid:1;
>>> +    };
>>> +    uint64_t raw;
>>> +};
>>> +
>>> +struct hwp_drv_data
>>> +{
>>> +    union
>>> +    {
>>> +        uint64_t hwp_caps;
>>> +        struct
>>> +        {
>>> +            unsigned int highest:8;
>>> +            unsigned int guaranteed:8;
>>> +            unsigned int most_efficient:8;
>>> +            unsigned int lowest:8;
>>> +            unsigned int :32;
>>> +        } hw;
>>> +    };
>>> +    union hwp_request curr_req;
>>> +    int ret;
>>> +    uint16_t activity_window;
>>> +    uint8_t minimum;
>>> +    uint8_t maximum;
>>> +    uint8_t desired;
>>> +    uint8_t energy_perf;
>>> +};
>>> +static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
>>> +
>>> +#define hwp_err(cpu, fmt, ...) \
>>> +    printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ##__VA_ARGS__)
>>> +#define hwp_info(fmt, ...)    printk(XENLOG_INFO "HWP: " fmt, ##__VA_ARGS__)
>>
>> I'm not convinced ", ##__VA_ARGS__" is a good construct to use. I notice
>> we have a few instances (mainly in code inherited from elsewhere), but I
>> think it ought to either be plain C99 style (without the ##) or purely
>> the gcc extension form (not using __VA_ARGS__).
> 
> Using plain __VA_ARGS__ doesn't work for the cases without arguments:
> arch/x86/acpi/cpufreq/hwp.c:78:53: error: expected expression before ‘)’ token
>    78 |         printk(XENLOG_DEBUG "HWP: " fmt, __VA_ARGS__);  \
>       |                                                     ^
> arch/x86/acpi/cpufreq/hwp.c:201:9: note: in expansion of macro ‘hwp_verbose’
>   201 |         hwp_verbose("disabled: No energy/performance
> preference available");
>       |         ^~~~~~~~~~~

Of course.

> I can use "__VA_OPT__(,) __VA_ARGS__" though.

__VA_OPT__ is yet newer than C99, so this is an option only if all
compilers we continue to support actually know of this. We have no
uses of it in the codebase so far, which suggests you might best go
with the longstanding gcc extension here.

>>> +static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
>>> +{
>>> +    static union hwp_request initial_req;
>>> +    unsigned int cpu = policy->cpu;
>>> +    struct hwp_drv_data *data;
>>> +    bool first_run = false;
>>> +
>>> +    data = xzalloc(struct hwp_drv_data);
>>> +    if ( !data )
>>> +        return -ENOMEM;
>>> +
>>> +    policy->governor = &cpufreq_gov_hwp;
>>> +
>>> +    per_cpu(hwp_drv_data, cpu) = data;
>>> +
>>> +    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
>>> +
>>> +    if ( data->curr_req.raw == -1 )
>>> +    {
>>> +        hwp_err(cpu, "Could not initialize HWP properly\n");
>>> +        per_cpu(hwp_drv_data, cpu) = NULL;
>>> +        xfree(data);
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    data->minimum = data->curr_req.min_perf;
>>> +    data->maximum = data->curr_req.max_perf;
>>> +    data->desired = data->curr_req.desired;
>>> +    data->energy_perf = data->curr_req.energy_perf;
>>> +    data->activity_window = data->curr_req.activity_window;
>>> +
>>> +    if ( initial_req.raw == 0 )
>>> +    {
>>> +        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);
>>> +        initial_req = data->curr_req;
>>> +        first_run = true;
>>> +    }
>>
>> What part of data->curr_req is guaranteed to be non-0 (for the condition
>> around ...
>>
>>> +    if ( first_run || data->curr_req.raw != initial_req.raw )
>>> +        hwp_verbose("CPU%u: rdmsr HWP_REQUEST %016lx\n", cpu,
>>> +                    data->curr_req.raw);
>>
>> ... this logging to be effective)?
> 
> Hmmm.  I think you are correct that there is no guarantee that
> data->curr_req will be non-zero.  i.e. a BIOS could zero the whole
> register.  In practice, I see 0x8000ff01 - energy_perf = 0x80, maximum
> = 0xff and minimum = 0x01.
> 
> Would you prefer that I make first_run a static variable to track if
> initial_req has been populated?

Well, I wouldn't call it "prefer", but I see no easy alternative.

Jan


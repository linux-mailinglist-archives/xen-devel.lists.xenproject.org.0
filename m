Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64772953A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545740.852267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YTU-0004GG-Tn; Fri, 09 Jun 2023 09:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545740.852267; Fri, 09 Jun 2023 09:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YTU-0004Dd-QJ; Fri, 09 Jun 2023 09:32:04 +0000
Received: by outflank-mailman (input) for mailman id 545740;
 Fri, 09 Jun 2023 09:32:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7YTU-0004DV-35
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:32:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d002475-06a8-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 11:32:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9304.eurprd04.prod.outlook.com (2603:10a6:102:2b6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 09:31:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 09:31:58 +0000
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
X-Inumbo-ID: 7d002475-06a8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwrW3AylT+RhJv7TZQA5zdEDmKJsy6HDiekZdVn5cd6tZZEDRjV7N09l/v903jM2SDEjE8yNs0UMhZ5C1nSg6QUNEQRtDnHCk7653z4yWv8Zjt3d71BRJ4MOQdcz5BhRtnYktpTGL9aH5InoZX07lXbrB0cWy+V8yZAI68T5taTOrenLyixmqujF0yLibtqk8Sw6mS2UOw9xquV6qcry5F/kddzg2vvvlJ1ZhMp6naykSWFj29/Q10PA4cZZs5mB5VG+d1ijegZhjidS6ONTHsmw54LUrvRiH6xLnEt7ibLBH+BupC7PiX38kTh2df8DoH7cgMUAgAMqN8a2CAKR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3zI9Mh/x5ZJX9Vk3bxj5HHqfaHgpWBbNS0I8Uu63V4=;
 b=MBxE8pO7pv/M5P9jtQFRXjZqbTxG/A/e0CWN9LCNtdjmzsvuvYsaMy9J/gqj3jgcYDTdRV6M5LDMAjdFloxikze1cARkJAEqfh4CvG1ObBd+RWiKEC8L0uTm5qFeXuG994Uv6qa1pfyxp+xn3T2lgQFja2qjdaX17Hskr2p766Pd700idcElF8ESC7fT0a2464bFJk2v53tK+rplHxpLjHWa7ceTucIJRrrKxNf1Rjg3UcZoSupADTjlAIO6/UqTdSR/OJcZT5C8pXxBVoNH3LcOj6ULu/uXjwdJXiOFrf7PPuSxCgwyZWhYxKhxVq3J0VXYQG5kLi6rusvxxWz40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3zI9Mh/x5ZJX9Vk3bxj5HHqfaHgpWBbNS0I8Uu63V4=;
 b=GMwen8avMMxHQGzL2kfhUYjViGdjN0P9FxBHxKsq8/ORdwyjAOoiKcldqJD5bfiE/cWQOJIpTFS55oeIbEajUKdjvckY6FANHm9enrkSRCjyvG3fi8YoTcP+p9g2ADeLMKV3B4BK4ye7l24cKSfw3GUO869gtVmNYypREzvhkR60QRlfkdTbNCnfUqw9fcllwaiWJFzsb5qe9Nsf0Jeg1Vd1RsItm29fV0/X066sADOitqK/6zJ+pPPR/UPSBn+y4fXxDPBLtmCp88BeP63UaTVGpNUd5G6ISZiiJrRsZdUaRF/EvKeZrHs4JFEggCVbUyJzEJl25+uSx9m7dTgUSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9162ee1-a6a7-96ce-652e-54eb30a3db78@suse.com>
Date: Fri, 9 Jun 2023 11:31:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cca001e-1a4c-48ce-af8c-08db68cc5f3a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zaV2l77dk/xe06vxiwGM2epPI7c12sbTbQrbuKFyF5ihCe3cLb5X7JRk6CUK23PsvAIa0mlIk2s14fA/Jj5xiv2oxPAJgTnk8tmOiRpS1ze5cFSPKsZDjsXuZYxxbQHFayFDhJg2isMroitNOGUL96Cu1dOn7x51ZqrqLK1uivWcY+n5eTa4vm3mhEl4nVgrAmS4W9yh0vbnQ097PNoOydvBJZmLBexToiCHjMnfjdWmQjUAO/PG92+Na+zkyj7HL851ytVMQxG8Vf36q5FcJlAr5oqsUkC0lwDSHtQsfw4llREMYKBeWlfPv0plTbe7JduCWBLgRVRHSK7m/j+0FflnegzUVh8mi4oQLrK3vYQVh+4uMfBgjMzBOwmFzTyR4NynDCyOUObUr7CHODJKedyEXG2klTQIkzdeXcxGTxOqxhxcLDAxeeXduwJtXVHsD0Z/DBe1u4EdjcSzzRz3GpMp6wCDRw+RAsVH+QrTOhtadnE2MMdru9S8loLEjKQQsCCbUiFTfz4eY/JJBmsXJC5DzVyrBf8l3ABqMqBJEi3/1qAeQ9uH7sLI8rNFzzsR/xqmKNEdNZAVR1UIidS3HF9gt5Quy5Xh1pXKgh4CDEoJCY0KjfCH5zA1F/cv3IdUg0xGcmRVkQtsD59fOfcFRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(2616005)(6486002)(186003)(66476007)(66946007)(54906003)(110136005)(478600001)(8676002)(316002)(38100700002)(4326008)(8936002)(41300700001)(66556008)(83380400001)(26005)(6512007)(53546011)(6506007)(86362001)(31696002)(5660300002)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm9iZmdzSkF1U2pMdnZQbGRlWGY4TVozRHA2NWdkUE9TejRTR1dlRzlJb0I1?=
 =?utf-8?B?ODhoVnhXSEhxQVdjNDdlazlETGZJVE43bk9uekJ5SnpOOGFFbTdkVys3MjZk?=
 =?utf-8?B?TVl2cWozY1VFbFoyVnBjdVRSWnRTT2lGeHdQMGI1ZzhLYU1HaHB6SXlMMzF0?=
 =?utf-8?B?Z2VCMnk3UmZwQ2JqVzQyV0x2c08xZzJlZ0ovd2w5MlVydUM3QkQvR1R2eE5k?=
 =?utf-8?B?SzdTeStnaFUrajVZOFczS2NJZm91YkFBL0hPbmFwbGFQeitndURqVmxXbmFJ?=
 =?utf-8?B?cXRhaHpLSHJIOWpOMEViS3U2c0V0WjdGYk4ydko5aHBVM1lsU0FNRnB4bit4?=
 =?utf-8?B?R3BhL0l3aUd3b3ZNbGgrZFJhVU9acnM5Y05uWHRXSU50SE9LUnUxajlpdzJ3?=
 =?utf-8?B?R2QwbHFUZ1NiU1R2K2V0ZlN4TER6M1hHbU45NnFNbzJJUHhqM3FLVjlvSnNa?=
 =?utf-8?B?dWkrV3crbkpCWmtHM0NyZWxBQ3pMZysrTFR0Y1poNi9vNzRXUFJFZUt4LzVJ?=
 =?utf-8?B?a0duUHBrVTgva0Rxd015ZHFSZ2Z2d2hUNWc1VUlKZk0ra0hzUXd0cVl0eFBv?=
 =?utf-8?B?L1dXRXVjamxXMEl3T2ZERkJ0OUVHVU5BcFc5c3FSZ1RBd0RJbEZ4b2RnTjFh?=
 =?utf-8?B?OFp1NkJTNkVPWkRvUThiTmRKd2c4ZWdHTFA5ZDdyY3NwOEgrTU9CQmR0b3E5?=
 =?utf-8?B?Ym55N2gveDJLT3JrUTF6emwyN2w4dUNwY21aNW56ZE9jeFV1dEwvTHpSOHNM?=
 =?utf-8?B?am1wOUpsTTJieWsxNEJVRFl0NHc3MDZ3djZERXArbzNTOXNPU2NRcnBHdFZq?=
 =?utf-8?B?RjZaRFh6QVRXbTN2RHFNL0FwbkdBNGF6NlV1ZUJmZ1J1amVVOW9acWZmT0Iy?=
 =?utf-8?B?eW9IRmhJSUxhNE9PMEQ5S1A3SzQ2cTBReWZxMkRCZ1d0dlZLbWNmb2Z3WVJX?=
 =?utf-8?B?TUpJZVdoMi8rYWtXSE8waVVMWkFMTCtLaTRVT3R5YSsvSEhINmVBY1d2Mnpi?=
 =?utf-8?B?aDFVOGVtK1VmNlBpdnk5YzJ1M0svQ003cHFLUVM0eHFwckg5Ynlrb2pvMXRD?=
 =?utf-8?B?Ulo0NGladEwwbm5tZXVwNmpTVE5tNWdCM21FdFRXTlFsaFFhQ05UTXUxbEZn?=
 =?utf-8?B?cno5NkFIeG5BVURvVlVwNFpDV1ZaS2lFSWFBNEtNQ0tvT3ZlRnc0cDJzemMx?=
 =?utf-8?B?MFAwOXVNaVdNc2xpczlOZzlOSDBKa29TK3hYQ0tGbjk0WWEyTitVNmNTd3ha?=
 =?utf-8?B?TE5DaXptNEQwTHI5RDE0aG5PbXArTnppLzFBa0p3VkpOeTNiM3QyRk9LVGY2?=
 =?utf-8?B?S3gyOWJmMmdxNTJHRWpEUldsN0FYemEydjlubU16YllIS2pJTy80elQvd2Ny?=
 =?utf-8?B?a1MwZG01VXVlNVNCRGJGNXdHaTdOdFJxbU5WeFB5QzBaSGI5VnV2d3lOekxt?=
 =?utf-8?B?MEdVa2l1WUtIazV3R1h5TzNOdTAvaGNRNWFHRXpLdGtzN0h0VTV6Tm5abDZN?=
 =?utf-8?B?ZVl6Rzd6ZXdMRDBEOGhtVlN3VTRONFBMZWl5dkUzU3g2YzNKVkJPZFJtOUxC?=
 =?utf-8?B?SlQwSWVBOGF2NkszaTF0ZXJ6UXdPTXpuYWh4cFp0TWQ0WStiSVhPUWEwaDJi?=
 =?utf-8?B?SXdLbHRQODhITFQvVkJERHZnRS9jTG4vbHhqV0UwcDlLQmE4b3hVR1RIMGRv?=
 =?utf-8?B?RlpzTUo2eWdaSE03eXliRTVwV3paK2NvRWloOHhOa0FKbE1iOHR5MU9IN1JU?=
 =?utf-8?B?MnhDY3dnbHUwMDJqZjRzaGdjdEFUM0hZbDJVV2c0UkpXa1d4TkFnVFlLVlhS?=
 =?utf-8?B?cFdNQzdOSVlJamlrQmxOMkV2UTVPakNFd3FNOThoR0NXWGVlQ3BzR2JmYmtM?=
 =?utf-8?B?YmVOd1RhY3RpckVRckJRYVh3eE5HY0dqZTBBNlZXaW5yTDBBZThUbGFhZGJs?=
 =?utf-8?B?SWtXVWt6R09wQno5NFNIb1RVQUJlRW8zbU1VdS9pRFJxMXk4eTQ4dEpPNWt0?=
 =?utf-8?B?MzBuSFBmTDFwaFJIYk9kdGF2bzZ6dnRQblVjejlBanlieHRqa1V0T3o2Umdw?=
 =?utf-8?B?cVhkWUtDTnpTd1kyM2pjNklDQWxZV3V0UU1lbHBUMS9YMjlMK1BDa3lvTlJY?=
 =?utf-8?Q?kLBAgu43Z4GVN8/Sj697TJyKT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cca001e-1a4c-48ce-af8c-08db68cc5f3a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:31:58.4587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7pq/0Sr/2FzCd4XeNQCYw2SaCnh2u2xV3rbRlOae0JYE1kYVIvV+61BTqd7b8x98ffbaZ1O4x7ObznJDDU2Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9304

On 08.06.2023 19:40, Andrew Cooper wrote:
> MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.

Right, that's one thing which should have been done right away.
The other is that both macros should have been purged from
tools/tests/x86_emulator/x86-emulate.h (which includes
xen-tools/common-macros.h). Luca?

Jan

> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  tools/include/xen-tools/common-macros.h | 1 +
>  tools/libs/light/libxl_internal.h       | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
> index d53b88182560..168691be0e93 100644
> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -73,6 +73,7 @@
>  #endif
>  
>  #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> +#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>  
>  #ifndef __must_check
>  #define __must_check __attribute__((__warn_unused_result__))
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index 8aba3e138909..61f4fe1dec55 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -132,8 +132,6 @@
>  
>  #define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
>  
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> -
>  #define LIBXL__LOGGING_ENABLED
>  
>  #ifdef LIBXL__LOGGING_ENABLED



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783A6C3064
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:27:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512357.792343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pea9W-0006yk-UW; Tue, 21 Mar 2023 11:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512357.792343; Tue, 21 Mar 2023 11:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pea9W-0006vy-Qk; Tue, 21 Mar 2023 11:27:42 +0000
Received: by outflank-mailman (input) for mailman id 512357;
 Tue, 21 Mar 2023 11:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pea9V-0006tf-2Q
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:27:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 623c3c7d-c7db-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 12:27:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7710.eurprd04.prod.outlook.com (2603:10a6:102:e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 11:27:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 11:27:36 +0000
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
X-Inumbo-ID: 623c3c7d-c7db-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr4+XbpWeWTJRrzAlV1paATsvAHHAGyrPA5E6teJrOjmfGLEVuVrztGucPKl/U3eDN3L2+uJWhk63nN/0eHjPc/cPKfG16DBYOX1vHwwXeTyTGQ4LEET9uzp4nVxZwd24binkxy+3K424gZjEFa1AuT/Izd8pFZrOup7+Ogk0QiySbu2EbidHWDLvU8EsEURPuPdmk3U5AYCKAE1+DRfKHSCDV0iTCy/lz0A9ZHuGWN0r/xE1+rnLg9FEi/i2WEILxiFRF51tcJv9F8OF9wE+Lxm5/56gtSddQtQjMTJrYPEbyF3+ftIoPZgQPmgznvqXN58fjvRm9TOemhJOIlq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbQAeUsV36rUNqz9uTU9a3E1pL9/cgy3Ba8/+0SuuVc=;
 b=adjclk+Bz1ohycSC/VRSdghB5s4S5vCLTYwPkAvulwlhXDbd89Sf9elhFmpFMNAF2tfjli0TjXj//9EtvZUMAMO+FZGkoBPt4ssJQIUXxiKd4/X8Dhqq9LdsO7EXQaa3DHGZgXhxY43LMhn/MTZD/kE/9LlskvYRDguLyaOhzAiWWrtKctHpY24n3ouHwo+uH/ZQZU1zApqPN2ksDKS4ZK9n+Pcd6/aFiOsw3vU+J+YshHrHSgI9qEKmZXxX6kdWZIuhsDCQRFUVg1KjQP4GhRIWwJzs4InfRNG7EaFEZ+LG2TSrPGxAx5DhxwraJIiVJ++3SiKEDbWwG+lhv/zWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbQAeUsV36rUNqz9uTU9a3E1pL9/cgy3Ba8/+0SuuVc=;
 b=1NqXPEoASF/nC6Dmj4cwRO7P6DLp7vdoCiSrinaz7t+deLN41WUMArvcKMC1amQhifMxQikt1KzpgbhVQtM1NL5a8lM1I+/BGbRmnQa3Ne3TVY4bEWaFZ9BATJHQY2jUnoNrhZflyQXHo0hoBd1h8WV01yfcPXwwbWyRJMYGc4SEcjGUmtoWSWeN2TJdtD02dBoqh7Kd1x6T4e18IifZPFQKeSY1R51drqadBOERX8E3DXXu2aP14r9OPj6VZMpFV+BgJqdN6omIlpY22YXCzz9UwgH6/oZC3B3R52ZlFCSIsD40uRsg76Mr7rH09JyYDM29dcGk/5sbXamKP1dP/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0581373-bc41-f05b-d3c9-d5e12b0111fc@suse.com>
Date: Tue, 21 Mar 2023 12:27:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/7] xen/riscv: initialize boot_info structure
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <1941d4ed64ff6edcc6354d09d6a40db4d6f63c44.1678976127.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1941d4ed64ff6edcc6354d09d6a40db4d6f63c44.1678976127.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 53efe73d-d2ed-44a7-66ea-08db29ff4533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6B2ATbSfEmtDVsgZgqiH/AH/ApouOcxEbD4W3EJPqqlb7zaquQq30DYDtv2CHtUi26fryoGOfwZ1Z5P4uAeybzP0BJHBVW+u7l8TEUBwkI32vTCkUiMITMxiQ0MSRm2C51T7L3X4bmoFOa6T/YhoXQiyGSnsAUdoLj7/k7kRl/hYuK75hNF9iH6Tscz7kxKcQDycZc4zpByoUrkbOxeQDlpJPTvyeZCsKwE9wu+u30+OSgsDpF6bjbqqdxMd9tliV9hgTZtE0Kz/MEoBPxU4fYz502rUVWaCkJWI06lKYfVISHCwoNPphp2TDQ4/JeMvhXiYwKbZAePQ+1RZ1yj0pYlpIpU+IvUVvd+xbhSydSWXFGFYNaI12HrfOdvmR/Fv8CTyZgpy7p9btX+rOGYzTIjvt8XOsMcveANIGPFbWm2Vk3q3daI3mfyQBzJ6gxIcA9jRkgqgbi5xMuZX5ENanuSIksQ0BYYoeUPpB61KOtC9zJJA/ahdc3Stn/s0TmlpxfOrQab0Y2su5XBbwWzvZ2IUXLQz6j8lV2OOQF8trFXLW4cn1FAxV5i0Q3+HjF/OA8x4FvXMA0H7yVSJ6EBQM8cqy7FM6ejsWmQk5wU5SRrflIA2CTbpYU9pTS/SX62npWJhi8taVTptDVhCMxjnrmuCfRXsJbCEmMp0D6sQAKGK2V08db4+4svxr3inUzOVpZxk3CfyIZmFDvl7ZEBCO6vrEmGBoRlDwyFwGV/zOabkRoG4tux2EHng5MPf5BwWFOsIB9n2Qh+L3mT9va2kY/y5UMyPFNTUDyx/1omoo4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199018)(86362001)(31696002)(36756003)(4326008)(8676002)(6916009)(53546011)(478600001)(66946007)(316002)(54906003)(66476007)(6506007)(6512007)(66556008)(2616005)(31686004)(6486002)(186003)(26005)(38100700002)(8936002)(5660300002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG9PQmJMY2dFOEZLSlA0Y1dkVFFicnVYMWhtN1N6dEw2UTk4OVh6SWdrem4z?=
 =?utf-8?B?WXUrY1hyYkwrSXlQckQwcURzVnFuY3Q2cEMwSDZ2eVBRRmdSL1RWL0JiM2dH?=
 =?utf-8?B?bk9QbHBBTEVvckRxdHEvZnZtdWRqUGVpYjJ5RXRTRmhuLzRRTEpUSG1sMU43?=
 =?utf-8?B?OTR3UUlCOGxhQ1l5bUVIN0RQbGpMOTVEeWgvbURjcnQ2dGpidjhGTlJyWXpI?=
 =?utf-8?B?WldkT1RvY1I3QVRvNlF0YmZaUXpSaDVmM25TR1BzeDBiUlFiL1VzZUh0ejV0?=
 =?utf-8?B?TjVMeUJRTjNXSWpIMWc2UHJDaUhIOWZZY3hiZXV4MWUzRjd5MVYzdktIZDNa?=
 =?utf-8?B?TW94dFUrOFFJRFhIbEc0eDJYTGpiM1U1VkQrMFRzNFR2TnN4TDg5UklIRmEy?=
 =?utf-8?B?bUtWbi9HZVAvREE0VlptWnZETm9RWVFVZ3p2L0tDN0tKNTNJeEFRNWIyZk9a?=
 =?utf-8?B?b1VBanNIWTRrMW1JTE5JR3BPYVNSSE9JcTdjd2V1UEtqTlZ4RENGMWhpSTRG?=
 =?utf-8?B?ZzQ2SEFBa1VubHBiQ0xzQUVtYUVmTEZKbnV2TG1PM1VnMmIyTmJPRThDRjAx?=
 =?utf-8?B?RUZZVEFwam5UYlFBMkJrbHJhWWk2TFMyakVKVFZWdlRxdnBHYnV3Q1NTd01L?=
 =?utf-8?B?MUVjbTh5ckFWNTZTNENNOHdUZVhLTlBPRzFzRTBsMUFjYW4yRDlZTiszRXd4?=
 =?utf-8?B?SVNuK1QvcVZ4VkFvQlRHYzJKTGhMbU5MaGtxb2M4d2dQc21yQWdWK0pHL2g1?=
 =?utf-8?B?bnduTnRpdkhWUlNhQnJsajNNOFIrL2FRZjB3YkhUbTlPb2dIRWlRWXJGVDZo?=
 =?utf-8?B?MVgyejhJb01UR2RwOU01LzM4di9wQmdyTDYvU09Ta0h0bTRaTncwSlpLM2Mz?=
 =?utf-8?B?UmlYOHJqaFdneGVyMDJpaFhzKzVNK2o3ejRuc0kyeS9ncDR1c25hbkNIUm0w?=
 =?utf-8?B?WDBOR0Z6TEtja3lkNWJYd2RsWUVkOThvaGZRYlNtZWV0Y3QySFJRYmNyNlVR?=
 =?utf-8?B?VW9ZTy9WSEZaMHplMndVSmYzU0h5clpLTHFyeDByU3VKcFY1OUlRQ05mcHlV?=
 =?utf-8?B?OWlvOWw1UFNoRktOUmIrenlYOFFpWE0ycnNxME8wR2E2SFltNmJkOWRaWkx6?=
 =?utf-8?B?MEZUaUNxdVVxam5qaG5kRVZMbEd1TVY5dnhLekZOS2E4dHE4SjlLNzhLZWFP?=
 =?utf-8?B?cXpGeFlHcS9JbzZvNGcxWUFCdUlubzJadUptSFlINnMvV2wwLzU1b2kvVnVS?=
 =?utf-8?B?aGl4VUZMTkVUWDJRNGNJQm1RamdaTWk4YmxRT0JyS1Z2TWRIbm5yOHdETFhL?=
 =?utf-8?B?WkQ4emVTTW8rM3ljVEdseFJlcjA2Tlh0dFRnWnpBRDNHUlFtditWTkN2T2x3?=
 =?utf-8?B?VUhHQ3ZFaUllT0EzRFJZVWRtRFkwYVUzbWRvbnpTKy93MGRYSkgvUGFEZm96?=
 =?utf-8?B?bDBWQTdBWVVWYnN6VkF3WU5iKzF1ZFkzK1J3QmFaeWNZRHVUMmx6M0JmMC9N?=
 =?utf-8?B?U09rQzl3Z3NWVW1YbVBBdkdzeU5hakpKZDU4eUpoL1lHRlA1VWFHa1BKcFhz?=
 =?utf-8?B?bkgydWVkVGJVM0NZZWZHazlDem1STFZXbkdOQkw2RmhEL1FLRWpNWjJEMGFw?=
 =?utf-8?B?b2JmVWh1R0hkSUtSUllXZkxFMENGNVc4SGpTUGNvMUhkY0QvUThLQmpCV0E1?=
 =?utf-8?B?UHdZNmpKUXBMRHlxK3NBV2wvMk9SOTl4a2pkYUcvNzdCZXFDVDRTQVNMVHov?=
 =?utf-8?B?Y3hUczZ6ck50QU1IanRXOFhQc2t5UkxlV3NtKytWeG5vL0VFYW43MUQzd2xa?=
 =?utf-8?B?dVBoOGFEcDFCQUg3Rk85MXZlZk9lV0h0eXExcCs4a2JxU3BVZjBsSU0xaE9z?=
 =?utf-8?B?NlhWL005SHZwMTNvWW5PeUllZUtGRlpsY0V5aVA3alJib3JsczdrOWtCMGVQ?=
 =?utf-8?B?NGpWRWZ5NFBGWGFvUERWUHZyK2srY1ZaUkk4NDVQK05DNXlGYkllWHRUMFlu?=
 =?utf-8?B?WFZ1dWxGSHg2dTU2SlIxVzhLem9qdWtNZXEzc1RIUlZNcWVUdVZlV2F2VkVR?=
 =?utf-8?B?Z1RxT2ZSdW1sZE9jQyt1UkpYVGF0Ty9WVFdsSE9mWE1maEJibjJtSHV6M1Vh?=
 =?utf-8?Q?9G2lE5w3BuY2obMH5kmd67OSQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53efe73d-d2ed-44a7-66ea-08db29ff4533
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 11:27:35.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPSVEFlP/XANiAuYbuVL33d9xjROrGC/Tda5Be/LmbdC4rN1NPTWnSmFvhPAwDTslxbWB2tw44xOokWGjDYY9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7710

On 16.03.2023 15:39, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,12 +1,16 @@
>  #include <xen/compile.h>
>  #include <xen/init.h>
> +#include <xen/kernel.h>
>  
> +#include <asm/boot-info.h>
>  #include <asm/early_printk.h>
>  
>  /* Xen stack for bringing up the first CPU. */
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> +struct boot_info boot_info = { (unsigned long)&_start, (unsigned long)&_end, 0UL, 0UL };

You add no declaration in a header, in which case this wants to be static.
It may also want to be __initdata, depending on further planned uses. I
would also like to suggest using C99 dedicated initializers and in any
event omit the 0UL initializer values (as that's what the compiler will
use anyway). Yet even then I think the line is still too long and hence
needs wrapping.

> @@ -15,11 +19,19 @@ unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>   */
>  int dummy_bss __attribute__((unused));
>  
> +static void fill_boot_info(void)

__init?

> +{
> +    boot_info.load_start = (unsigned long)_start;
> +    boot_info.load_end   = (unsigned long)_end;
> +}

I'd like to understand how this is intended to work: _start and _end
are known at compile time, and their value won't change (unless you
process relocations alongside switching from 1:1 mapping to some
other virtual memory layout). Therefore - why can't these be put in
the initializer as well? Guessing that the values derived here are
different because of being calculated in a PC-relative way, I think
this really needs a comment. If, of course, this can be relied upon
in the first place.

Also please be consistent about the use of unary & when taking the
address of arrays (or functions). Personally I prefer the & to be
omitted in such cases, but what I consider relevant is that there
be no mix (in new code at least).

Jan


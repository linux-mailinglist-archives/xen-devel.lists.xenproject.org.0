Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF475BC77E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 12:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408671.651482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaDsC-0004Qv-UP; Mon, 19 Sep 2022 10:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408671.651482; Mon, 19 Sep 2022 10:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaDsC-0004Np-Qc; Mon, 19 Sep 2022 10:19:32 +0000
Received: by outflank-mailman (input) for mailman id 408671;
 Mon, 19 Sep 2022 10:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaDsA-0004Nj-IH
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 10:19:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b88f61f-3804-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 12:19:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 10:19:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 10:19:28 +0000
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
X-Inumbo-ID: 8b88f61f-3804-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WujtaAusYGVYRNW8sBTyZY1UrcnqrKmqECpEa1jim+dzGR+YCpvYwmEJko6yVaKrAZGGbi+y6gR5JWFhOjh5MLfkUctbKJSzfaSXmtg+yD6Z5chZQE898eEKmIJhljJjMDWxHjVnE8P+4Rl/BH1deusb7mhYco6SMVDhT6zHuOrTc2IrOdtksQtkCILcXOodUFJSpB7lbn5+Xv/jjrWSErpRZA5+kTfThiCnk+QJMwk6S6OkjqNbQy8Xx1swkxEaXctVyZ8r1JGrgLEkYR57LA2Ac3z0ASJxMP/eDHC4+Kjq/e952Bu9ny8bOImtCQma3pdbNB9lJFYEGBuqrrsAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw+BMow05VRz5iuOzQEnbtb0xxj8OkDZVK3R17H9mro=;
 b=m6TlVWkYl//Z7eM0JQhuOK+1hBCeKnlEbT69b8rth0tEGAJG8J/kOSsM0y+sbTt7KcgyRz3rbBUQ5Xe+SsO94JbjHgO7EJi9woCyq86VhcFmlFv4AlK/fqrw1m8kQ5ewbJtEMDoYhoawRkc0BWBS23H1sb3+hlnS8tvj6Ec8sICeab2Q7TsgpBH+m0LneHwKqZ4gw+RWa3Nvb1DxqywJfDPsG+fpnhVBUhQltMgMcrd5otGtGu4mKq4au1oHsH5JvySa3U0pPZtv/LKsrH0CPRfPIDGn8f7hWFLC7QiOgMaNgMJcyCszexmKofZ+9L39SWTl0XccfQccmsYa55qY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw+BMow05VRz5iuOzQEnbtb0xxj8OkDZVK3R17H9mro=;
 b=L9PaoUhhEnrjmw/KBNQvnkJCxpRFnResK5kvfmjotcA9fVxVeesSdb92s1/vxONEiVDkp8BuE6MWPtEQK1NfbyvU9KfbZIh/KNOijCB96GAowJ6xTnc8ct3M0CwtPBqlP/VSBabIOO1PvFP5FgP60Yo5N4yoFU09thTN2hvCC+UF6aie2dFjxfwindNi+4Y7S1WwB2Igr6Psju6Pqd2dHbZa35MfYNI1/Yu4CmTGiROsXiOhxvr5vHzUC+f7diucfNe5RZ45OXaD7X8fhNGQchd2sy6taau0ZHVflSbsaZkvoN3P09ImvHFDeHisx5naLED5UAliIb/2zid1GfRyZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <039ff47a-064a-bfaf-31a0-68d4e055cfdc@suse.com>
Date: Mon, 19 Sep 2022 12:19:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] acpi: Make TPM version configurable.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wl@xen.org,
 roger.pau@citrix.com
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20220915204029.1227112-1-jennifer.herbert@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220915204029.1227112-1-jennifer.herbert@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0667.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2c1a7c-65c4-4500-c550-08da9a286f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8XOy3QNQZWvZfRg/S2V7K/GRa0ReIgdOyoTxkK+3+ZPzxdCy319NlaK8LEdrAFYgE+0XY82X3hOBGXlU3a9r+wP4Kn61lLMqcr76OhwzqtWN0/irAtnh33JY3IiGd1aOxMNLrb7BEo3CW7Bu4NXsTBHuwEFwHeyv1knywdni0yMBwoCNAiz3Ik3DaEw2H7LqO/0cownja20xzCjU8+Ve6W7/fxdVhazvUYAirY9aJa3Fxt0NMplYmFNMQNVU4Vtu4RWiEVCUfffnEUA+w0VD7g0N/mr5Yi/teOISvJXRA+yKxr2Sdl5mx4Y+m0EfUSTcoWq27KJXBPoVf3RGNqE+2w/NmiApvJQD0iUEe9z+G82jn631gWPdQPLWsd7DNqq5mMzRzEd2i2L8tHYnot46hFWTn5Fn6UUoD+wdAOv30zCJfy/TwhPjz39BQjNrEcRoE8q/c15S7jqC1Dc0XHtmVnhRuiXE47dhvgFILxkenWiyMooRZVq6wedocxEqGqAiE/ewG8Twu0+w9pUdrwo2D8YGZt6LvTLLGsYo+kCaNtt99zGpGmGH3qi/jBbFyfXKqW7BLZtA1VGv/0iTp39ynCefZPG3E5y/mNH3eiY3vTArW7uP+lel+vfFFKKzYU1KyYmoClb415YsSGbK/ilrO8bHhqmZzPy8crsiutD+8U2Fn9DJXydp2VSeaxEm5S2OnL5/xTIN2uCR7F+wxuswUDUdfEPLG8NOChwgaGp7twIIsOd0J2kHurG5WKguNULhjDvkGgDFy5vk92Gmyt17KNRSaXs8GrVhzDKCKQXFmME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199015)(31686004)(36756003)(2906002)(316002)(38100700002)(4326008)(66556008)(8676002)(66476007)(5660300002)(66946007)(8936002)(31696002)(86362001)(6916009)(186003)(478600001)(2616005)(6512007)(26005)(53546011)(6506007)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVpxR0dNc3VkYXBlSXdVOGV5eTgyTTR5OGhaNTdNellSa3VjQy9mR0djUFRC?=
 =?utf-8?B?TmMweGFQcHc2ZktVbFRERjdNNE5CcFlWUytjajZrT2pQS3ljcWdUdFRsaDJH?=
 =?utf-8?B?bk1KNnRScjd3emlxWVNMR1RFMnVIdExVRG50VXh1UGdHMjNiNzYrNEFndVpE?=
 =?utf-8?B?Nzg5bGJ1ZE9jc3ZnTWw1OGJVeXYwZTNaWW1ERmplUE9EZjFFUGx4RkxkZnhT?=
 =?utf-8?B?L3JyaDFMKzd3SUg2b2xsckxMTWJxRmd1emxWTG16NGYrV2NXN2Y0L1IvRE1E?=
 =?utf-8?B?cHNleU9VQkUwdGIwU00wYmJoandaYUdPMGsrQVRHbytrWjBCMGU0YUlTOFUy?=
 =?utf-8?B?VHRLMnl2eUkremxsdHZHUE9VS005WTJKajBCZEcyb05xTm9aR3RmNFhjMFZ6?=
 =?utf-8?B?WmZNektxR2xtOThiK2N3NEtKcjhCZGRSUWVwblNuT2Y4UUc5WXVZL09vTzNM?=
 =?utf-8?B?T25BZGk0Rk5tdVF0Tk1RK21lS2Y0Tlh5TjBUdis3T0FZTFFZTEFsNFVxWFpn?=
 =?utf-8?B?V01jaE9kamdENGQ0STdsT1J2aVZsNG9RalZiOG5Vc0RielhMaW1hVlRJd3d6?=
 =?utf-8?B?WDhXQzh3aWQzUWhzZDhsS2ZMUVErMS9GUE01ekdHVWp2bEVPSEVpYmRQNzhD?=
 =?utf-8?B?VEd0Y25rNlJsMStrR2Z4aGJUV1FiWnkvQ1RKT1NGcDEwOWR1YmNva2hZZ1M0?=
 =?utf-8?B?UkNYR0pzTlgrYjNQRVVWazdzbDBucVB2MTdNc1Ftc1BsM1pyc3V4cWN3ZThj?=
 =?utf-8?B?aURVbkFiN0YwUVBSMlFndW4wNmlvWEViQkhJSUdmSlRtZXg0K1hDYXhTQXFM?=
 =?utf-8?B?aDlmYVZQeis1a001R2NsUkxJQW0vR3ArcDcxdk5FRTZrOUZLd0ZqRlRYQUxq?=
 =?utf-8?B?amFNQVQ2UExWR1YySFFTUzg4c3ZlY1ZwYnJSMWE4WlhJZ2FhQ2tzVVZ6TXR0?=
 =?utf-8?B?QWJZNktVWVpPanMrazEzcnJlVGpOWklBdGVCMXA4Ty84U0J1eS9WOHZBOEkz?=
 =?utf-8?B?QmhpcjRnSFpwU1kxcWtwMDE5N2R6L1kyY2VieGxkOEJHSXltQzJRcm42RUE1?=
 =?utf-8?B?aWUrQWNQMDVvazJXdGNwMTczVlUyQ1Rkam5FekVXMnB4eDY4NHA0ZDFZUXR0?=
 =?utf-8?B?eWZaWVFNdEljM0I5aGtoY0NLV1hJb0dhdWZWRlFXVnZ3dWQrU2xHRUU2eXJF?=
 =?utf-8?B?dTJ5cytlUmRJeDJWOFlld0xiRWF2V05XckdlUUlITCtFWGRGY0tabUVsUk1a?=
 =?utf-8?B?U3FkYmxNeW5DRFNhSEdZUnlqUlYyZFdVZ3QySmZOUkVSalF5dTB0K01UTldy?=
 =?utf-8?B?SmtIUnVEYzJaMTNNbzdBRnJTYkhiMXltSUJVc2E1bXZURjN4T1ZVN2JwekVH?=
 =?utf-8?B?U0kzb1RydzBBdUkrZENpcmJNelRwcUFnTndFUEl5R013anNUNUxjRnhwUk5H?=
 =?utf-8?B?V0xTTlZmckdVUFgzTzZhRWNsd2ovV2h6SHVhV1lmaVlsbFU1eHNPVlp0eGw5?=
 =?utf-8?B?WUNjSlVDM0Zobll4L1FUdnIxVGtMYzg4bWpmc3g3clRiMDdxUk5MQ0hSTEJ0?=
 =?utf-8?B?UkpJWUZoeUdVdUxrWmduMFpuZkNMeUl0ZlZCcmR3NUUyZ242Ly9oVFBPemhv?=
 =?utf-8?B?aUI2YjBqcnBPaVc0NlZ2cU5zTTA5VVVZZWY0ZnN5YkgxVmxKYm1KQTZJZE9y?=
 =?utf-8?B?bUdSM1N6TFc3WjVCUTd3SVg4UUxiQVl5ZTNsbG9pdnZydnJSSE8wQlNLNHhw?=
 =?utf-8?B?WmtJa0JKQ1Y4Y0dlT0VKakhrOUdoVDNnK1M5Q1EzZSttTnV6aERLQ3FjNHdi?=
 =?utf-8?B?cTQ2V3JyVk9jeXBRME9OeE5yamJ0OEdza3hyNWhrRldGR1BnRG9jdTBXMmNJ?=
 =?utf-8?B?a1ZLV0xPbHZJNldSQWFnbHFxd3J0NU9uWjdNeU51UXJzZDBJOUN3VGlEWjVW?=
 =?utf-8?B?c0ZnZmNTY0tvZXdLQnVDdjQ4cERkWGRoK1JtU2lpMXQ0NVp3d0hUZ0cwTklG?=
 =?utf-8?B?S0t0ekh0NVJVcDNnSnpFQ01rdWpWY1VqdVE5M1VBVFJZKzJFNEVydDhjd3Uz?=
 =?utf-8?B?dlMxNWZRWk55Y3JIU2NubDNZZFcwY2RzZ1FjZmVLMC8xaUNTeGNMWVVFQkhC?=
 =?utf-8?Q?ownzBEqiWrHvFPD4LXGwL8WYs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2c1a7c-65c4-4500-c550-08da9a286f15
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 10:19:28.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxIda1CYewLq2HOdxRzneXv5srptydztKYIs1+jmqKbAm6qqNjx/ULRz7g/2mkQB5HAuDY2cWViD5fsNeSOMmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

On 15.09.2022 22:40, Jennifer Herbert wrote:

First of all - please follow patch submission guidelines and
send patches To: the list only, with maintainers Cc:-ed.

> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -994,13 +994,22 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>      if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
>          config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
>  
> -    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
> +    config->table_flags |= (ACPI_HAS_TPM | ACPI_HAS_IOAPIC |
>                              ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
>                              ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
>                              ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);

Did you not mean to drop ACPI_HAS_TPM here when ...

>      config->acpi_revision = 4;
>  
> -    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
> +    s = xenstore_read("platform/tpm_version", "0");
> +    config->tpm_version = strtoll(s, NULL, 0);
> +
> +    switch( config->tpm_version )
> +    {
> +    case 1:
> +        config->table_flags |= ACPI_HAS_TPM;

... you now OR it in here? Or else what use is this statement?

As to the use of strtoll() - I realize we have nothing else in
hvmloader, but I'm still weary of the overflow potential. Just
a remark, not really something to act upon.

> @@ -78,8 +78,8 @@ struct acpi_config {
>      struct acpi_numa numa;
>      const struct hvm_info_table *hvminfo;
>  
> +    uint8_t tpm_version;
>      const uint16_t *tis_hdr;
> -
>      /*
>       * Address where acpi_info should be placed.
>       * This must match the OperationRegion(BIOS, SystemMemory, ....)

Please don't remove the blank line here.

Jan


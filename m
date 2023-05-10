Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B69A6FD8D8
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 10:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532686.828933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwen3-00053X-E8; Wed, 10 May 2023 08:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532686.828933; Wed, 10 May 2023 08:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwen3-00050s-Ay; Wed, 10 May 2023 08:03:13 +0000
Received: by outflank-mailman (input) for mailman id 532686;
 Wed, 10 May 2023 08:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwen1-00050k-Lb
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 08:03:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a3328aa-ef09-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 10:03:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB10047.eurprd04.prod.outlook.com (2603:10a6:150:117::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Wed, 10 May
 2023 08:03:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 08:03:05 +0000
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
X-Inumbo-ID: 1a3328aa-ef09-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5RY3f4CO4rCqU7IDnvx3lUUT/gv13SDXAh8lMH1udCL3LOqe0Cow8Cb4fl8XTbm4RjU0iG1h2IN5va8Nqd2Gy10GEcLO4YGt40RYyGIP2s3LWju37OntGhEFSnlyErbPCPuz/Ar1/Xakd6KEaJRDyldcbTFApjA/LJrvzmOZzIaaPuFNOWa8Oy6DdWkTOMkXgVhKioTItbubtqfoGAuy9MEeo/eM6wdqYcZQbLnCt6LzHg4p+9RNXBoyXqbnubgv2J5rJc0UR9hR5GkiZcn1BlbxeWeSRXta9vb5aEPyJRNm7P4katUdhwcwWdriKtG3g3o/r45SyHzLaU+a1NaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVAIGQMnGL6MDJ42uGSoqBIUzYduE/3zimVh4z8RD6M=;
 b=Jm5pHSC3OKLeuq4ilPtvcVdjKiur92osYcJ8K86xyDipQhOl+3cggZQaPEA9l2Hc87/R6VQLsCfBs5h6ux1oukBDMq/cHXKuVUjxavB+RE1UFiP2r8R1kitcHL+Q0s1gHZsev2KzJSxnYoFXCxsr13KNfz2sQ6ftYS0T8Q5q6eEwOxvLob+L39EFeD/MYXI8XxMawN4RMbKkN5N2RSOAX90gIQAv7FZPLEnH9EuylaaeEVUVfNdgZNjpoer7kL+eBD+Kpl+iLR2zlm6AdCAzPptZWpoClU1KthN2zrFqb6mOoVr4b0E5Dl9bLVslxUz6BW0J7I6q5ORrO8ujnhzwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVAIGQMnGL6MDJ42uGSoqBIUzYduE/3zimVh4z8RD6M=;
 b=hLH66T6C6R7r3n5fwA2u2f6bzXHNQ+kECO0S7GaSXyD2xkOXhQsu6LnUbpa+teqyt9THAngh4EcEq9f0VxmDEpw9/hXqNwpQpsORXjpMQnLPrr5VID3Yz3Lp8/vUHIGhvfixKIFYvxkuANDomaVtztZoSU2WTyx0gcGLDtj7QqHs2lyLr8uqtMjTctUlEEz9dYdXYl0IuGRG1DHIr5EPBrirjvzhpwgVbeUCkqC0+XlTcFKA7IWEJh0rmLV7M1UkDLIey+AnJ5C+Nb7ni6u5sJTNDhh+JaC4lUa3J5olPDh//RPpyy2/5ukj9ixDIiWBdS8X9s4bh2afT66pLK085g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <283798a0-0c69-7705-aade-6cd6b2c5f3c4@suse.com>
Date: Wed, 10 May 2023 10:03:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN PATCH 2/2] x86/Dom0: Use streaming decompression for ZSTD
 compressed kernels
Content-Language: en-US
To: =?UTF-8?Q?Rafa=c3=abl_Kooi?= <rafael_andreas@hotmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1683673597.git.rafael_andreas@hotmail.com>
 <DU0P192MB1700F6DFE45A48D90B5FE679E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU0P192MB1700F6DFE45A48D90B5FE679E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: 198e4ee5-f0e0-440a-dd0e-08db512cfc20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fSvmYG1ecltPAorwWI2RfKgRRGH/07lV9DgZToM8Igb5Sh1zOjYyBFYFqwEQsAiazAzfS+UxrhRkrH2VjW2XP0nwvp4RKAO9tQotQ4GOa+27gmjvVzDHA2n3Z6kB4jPzS/qLU3Va2tm//8SWhZm7Cl5sVwHjqTywY89cVN+6bvxV55ZJsp2TD6rXSNjt8A51gzmehiLU0emQ3RDXUjKXp29wSnpRDK+OCD0rSI4alF+0lku9LUSaW7bOoAvH17TeuPG5gCbvc0FdO58BrbQJVTshhjlQzNftVkD6tvnVR0ytUm+p18KkkKP4CZhP3nmBR/yS7wHCociGkFa4ZSJY66jS0nbCO0vTLmgb+T1Y+LRoqhSl6caqgGuHg7FCnmOnz9fUvPqLAWS36x2U/4/0TqEeymcin0bhZthwryxlmRb+JhCT29BAxTLmtJT4yZ2RRdxooqWsiee5FOUZhFg9bbBgkISmzgXVvFdkGY2LJaWk9MB/+K1kXQ4te5TDD/fyp4sQgxoh667lriyWbl6JaVXeOG4BHG7mXrw18b5/6hIT5WFkUXKqvafbgMqR+0RH3wpXL93m4pmlPuJJhNrxY2+VFG381m/NxEJcVyjL2WLvcNEzCa4xP22C5Yhc5Czresq5+Phfm5t4S6nL5sP+VQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(38100700002)(36756003)(31696002)(86362001)(31686004)(8936002)(8676002)(5660300002)(478600001)(6486002)(6506007)(26005)(186003)(53546011)(2616005)(2906002)(66574015)(41300700001)(316002)(66476007)(66556008)(66946007)(54906003)(4326008)(6916009)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUg0YlR1ZVRDTG0vb1U2MTRDYy92NXN1SUxSZmdSSkpjaGx5M1U1SGpTRkt5?=
 =?utf-8?B?b1VDWW5NQWlaNEI4ck9LcGpmMFBwRURSMllNZTNCWXl0YmFUelE4SHVjd3NZ?=
 =?utf-8?B?MWIvWGNoUE51OEJaMDIybjRzV1BqVmNpL2V4akprVjk5dlpSUTdVbThFYTVl?=
 =?utf-8?B?ak5yQ0x6dlFrU0dHM1J4VXRSelNWMmtrSWRVNHF5S241SGdCMmVRNU9vWjMr?=
 =?utf-8?B?MkxYcXJtZEpzakdad0toRmJuS2I3Vzcyc05MbEJJK3hyalZrL1VhRUxxd05L?=
 =?utf-8?B?cldsajZJZTBtNTEyNGlWa0lyWnZtcWt4RFRmRGtabTB5SGRLdzR1dUh2dWgv?=
 =?utf-8?B?U05pL1d5ZUlyTnlHQXNhcFo4U2VGNXIrTGY3dlNnY2hJRDVXRk91bnJQK1oz?=
 =?utf-8?B?SWZHOENabCs4MEt6bWV4SCtqRkh6UzRtRG5FSGRHRE5BQXEvR0lkc1hVUEJ4?=
 =?utf-8?B?cWRnZ3BoalNyN2tESlFXNGkvaTM3YUcrRFcvaFRUa3BWd1paTW5HRTZQYVFq?=
 =?utf-8?B?eHB1UE9HQlc0dlMxUlgvSk9ETldXY2EwSEU1Z1k3Y1NYWUsra0JYN0F5SWxY?=
 =?utf-8?B?UkpoTTc0S01aQVhoei93Z09yYTAvc2EreCtjWGdsYVdkZnhkZHFqbVpDUlZS?=
 =?utf-8?B?Rnh3Uk9RRFkrc09Mc01qZk1pTyt6R0hnVzJIeGtPK2t4VHQyZFhSVkYxeVdn?=
 =?utf-8?B?K2Z1eWpuTHJGeUdzMGxEN3JISDl5UEdNd2Iram5OZVhJbTd6SFVwdW5RMWQ4?=
 =?utf-8?B?dzBwNS9JWllpOGFVLytHTTI2REdHaCtWU1pvSW1reGFjTnAwUXVJWk5Ham5m?=
 =?utf-8?B?cUtkcHdOUllSYWV5R205L2JObnA0alhsZ3JSK1VrYTZmUXhUSjE0SE5lWGcv?=
 =?utf-8?B?NFlaajVLakZkeGxxVzVpd3dOcTFHdkk4aEh6SDVOZ3RyeW9xV250ZjhJUFBu?=
 =?utf-8?B?RzN5c3lkbUVleG1GbDlEU3hqQVp1UDZGSGtuak5iTmxGWWx3bDdJanhOcVll?=
 =?utf-8?B?NHJrRllsSnFSalA3bzQ0ZFJnb1RmUnMySzZweHFQdTluZDlvbytEaTdOOHFK?=
 =?utf-8?B?RDFKWEtSeDdrRWhoMkV4REl4MlJqRlRGSURRWFM1Vnl1S00rbzNETHgyUmEw?=
 =?utf-8?B?VDVnQjBnWi9NeGlwcnhVODlZOEF3Y1ZzWVFYeXBmbCs1bWxFT081UEtMcDha?=
 =?utf-8?B?RFhuK1JOS3BGU2JMSk5jMnFPUk9LNmUrOCtwZEtUOW1YYVgycDRtcnh6OFBD?=
 =?utf-8?B?Z3RtOHB4azdkVFpncEZQWHNNeGtPNFIxOWN6Q1lOT3UwRTlXaUZHUGU5M3N5?=
 =?utf-8?B?NGRRTWpsZmF6T0tPVy9VdjBadThvSjM4emFIZVphTEVZd01pRy9KbStMNUFE?=
 =?utf-8?B?SGozd3JsT1VlcThFZFhlc1JsUzVWZWpzelVZSWZZdDNXZlFBV1RDbmJ4ZU1N?=
 =?utf-8?B?cUZ2MHExUG16RW51TGhqdW84TlM0ZUNpQjZyU3dZNHFvY1lLZlI0L244WHpM?=
 =?utf-8?B?YWRmak55Q3ZnQ3VNTUtTV0dFYTY1QVYzbkJqM0MwbVA5VXl6NjcvZkZBU21W?=
 =?utf-8?B?YmcrdEtBTXU1TERQWXo1RkFNRmtWRXBDNk9UbExFMkFxUFNibHlGTzIvTTRr?=
 =?utf-8?B?dE5rdEwzYUk2aGRlY1NreVRYYnZPS1lLendBdmc5ZG5FVzRZQXRDSllDL2Jt?=
 =?utf-8?B?aUFjSzBOaytHQ2drbGtiREg2R0FsQWNQTXB3Rmg4UzZSYlRnOXREM0ZTcEZC?=
 =?utf-8?B?YStaUkhQbVc1MUYwc2lNN3ZrOWJ0TWFob3ZnU2k5OWZCa3hiNXRXV1VjUi81?=
 =?utf-8?B?SmVmMC9sdmNnSTB3VEFMRTVobmMyUjR4N1c0WS82bnErNk5yVXhweENQZlNq?=
 =?utf-8?B?cXU1V0x4cmFCbnVDT0tUMWlsaTZYNnFxMXhXd3FLN0IrM3FJSm5URHdwa2lz?=
 =?utf-8?B?N2oxSmhZWkV3ckRJcml2TTRBSkNKN1IwdXdnMS9BUjhPNDFXbnJDTk1iSzF1?=
 =?utf-8?B?SVkxRHRTYjNZZy84WjczYnZ2clFaOUxvZzlWeU9UMjg3OGhKdlJUOU5UVzQ0?=
 =?utf-8?B?bE1HSXVZNHRiaVJ6eHpseXRmQjNyZ281eE5tQXptV0Z4eTEwSDFNU3VsMzd4?=
 =?utf-8?Q?Ng/QlQB9lZwG212T1KhUiVfz2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198e4ee5-f0e0-440a-dd0e-08db512cfc20
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 08:03:05.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fb9w3b4AXi/whWb88kfnizLMsFPO/NW3XzkI18k5V4XsgmzpeZEhsYrODj3cTcYilmgE2jnRlpGwJpCSLsZGLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10047

On 10.05.2023 02:18, Rafaël Kooi wrote:
> On Arch Linux kernel decompression will fail when Xen has been unified
> with the kernel and initramfs as a single binary. This change works for
> both streaming and non-streaming ZSTD content.

This could do with better explaining what "unified" means, and how
streaming decompression actually makes a difference.

> --- a/xen/common/decompress.c
> +++ b/xen/common/decompress.c
> @@ -3,11 +3,26 @@
>  #include <xen/string.h>
>  #include <xen/decompress.h>
>  
> +typedef struct _ZSTD_state
> +{
> +    void *write_buf;
> +    unsigned int write_pos;
> +} ZSTD_state;
> +
>  static void __init cf_check error(const char *msg)
>  {
>      printk("%s\n", msg);
>  }
>  
> +static int __init cf_check ZSTD_flush(void *buf, unsigned int pos,
> +                                      void *userptr)
> +{
> +    ZSTD_state *state = (ZSTD_state*)userptr;
> +    memcpy(state->write_buf + state->write_pos, buf, pos);
> +    state->write_pos += pos;
> +    return pos;
> +}

This doesn't really belong here, but will (I expect) go away anyway once
you drop the earlier patch.

> @@ -17,22 +32,32 @@ int __init decompress(void *inbuf, unsigned int len, void *outbuf)
>  #endif
>  
>      if ( len >= 3 && !memcmp(inbuf, "\x42\x5a\x68", 3) )
> -        return bunzip2(inbuf, len, NULL, NULL, outbuf, NULL, error);
> +        return bunzip2(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
>  
>      if ( len >= 6 && !memcmp(inbuf, "\3757zXZ", 6) )
> -        return unxz(inbuf, len, NULL, NULL, outbuf, NULL, error);
> +        return unxz(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
>  
>      if ( len >= 2 && !memcmp(inbuf, "\135\000", 2) )
> -        return unlzma(inbuf, len, NULL, NULL, outbuf, NULL, error);
> +        return unlzma(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
>  
>      if ( len >= 5 && !memcmp(inbuf, "\x89LZO", 5) )
> -        return unlzo(inbuf, len, NULL, NULL, outbuf, NULL, error);
> +        return unlzo(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
>  
>      if ( len >= 2 && !memcmp(inbuf, "\x02\x21", 2) )
> -	return unlz4(inbuf, len, NULL, NULL, outbuf, NULL, error);
> +        return unlz4(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);

This also looks wrong here - if the earlier patch was to be kept, I expect
all these adjustments would have to move there. Otherwise build would be
broken when just the 1st patch is in place.

>      if ( len >= 4 && !memcmp(inbuf, "\x28\xb5\x2f\xfd", 4) )
> -	return unzstd(inbuf, len, NULL, NULL, outbuf, NULL, error);
> +    {
> +        // NOTE (Rafaël): On Arch Linux the kernel is compressed in a way
> +        // that requires streaming ZSTD decompression. Otherwise decompression
> +        // will fail when using a unified EFI binary. Somehow decompression
> +        // works when not using a unified EFI binary, I suspect this is the
> +        // kernel self decompressing. Or there is a code path that I am not
> +        // aware of that takes care of the use case properly.

Along the lines of what I've said for the description, this wants to avoid
terms like "somehow" if at all possible.

We also don't normally put our names in such comments.

Finally please see ./CODING_STYLE for how we expect comments to be
formatted.

Jan


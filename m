Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC138759518
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 14:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565822.884360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6IQ-0002ZI-5J; Wed, 19 Jul 2023 12:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565822.884360; Wed, 19 Jul 2023 12:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6IQ-0002XM-2M; Wed, 19 Jul 2023 12:28:46 +0000
Received: by outflank-mailman (input) for mailman id 565822;
 Wed, 19 Jul 2023 12:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM6IN-0002XC-Vh
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 12:28:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca453d4b-262f-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 14:28:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7292.eurprd04.prod.outlook.com (2603:10a6:102:85::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 12:28:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:28:36 +0000
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
X-Inumbo-ID: ca453d4b-262f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvstOa7anT9pniV7cmL5KlFaQIARlMY3ecC7BJl3pY7XTAJSUHTbMCe1+k8DwDD3evz1sQLZcqwUZKQVIyT3UCHk103/NantKebYq7RoF7v0rYeEFrAPRGx9L0eOCvNxAOvbc/zFjY19szgWzpggHAv53PKtZu/p+WYObYLEvjoGk8BrH+CMH7zK8BZjTrs6Y3evJ5LM0oiOPC6H8IsS043NThNOJwp/4/8sAWFbbsFyqeMe/DiDN5vILQQcNUzxiQlrHTSqEOycdfXTmypXPutaecpYUUEDBSmK0R5dwn+2LB7ZvOzARR+7aTjeg5oQzqIvvvLVelbzS13A4Wk4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nbtjm3If5eDSy+y56CW1wRtxXW938WDjfFg+QN6FgU=;
 b=T0Kt+4T8lizEEJxUd/uXJugS6xqg6KyfSNn6yimeaj7COjNDHD29mnkTMouzgM21T38i161QPHtmv0Xq9v5U6a5F7jjxVZ+XJnzqMKSjwSBnzMpcKJklngNo3RuO90BN7O3rTENmg26YYfvDYifsP2phW71eTP+GPiAipNnMzw8XqnoMpan0nY7HXqwaBkV9Do+uhwADssRZ3WSZHYQ7+t07TI/19L74YKDVFrZug34XnRqUe8+riPYwtiE+kALhFCmFdzAnEbLzIFM24mC9entNlpe/Ob0RZJm16Dk596T+XPZ66r4K3TvvQrs+lnQP8vjDTqi7EbF8tAnw8RVMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nbtjm3If5eDSy+y56CW1wRtxXW938WDjfFg+QN6FgU=;
 b=re2A0PNovIH13gnVYOu1fR/W4/c3o8y8IWFiznLlCSTXUpXqe82Z6574c1I6bNExJSpRBZDmwRdYiW7FlvSD9rGihlaA41qmuf7OgCCiWFnTUSpZgRY4J6Q3jHdki9xXAryV9Ao+38yPSAWsR3VKCtn1t+OLOlKHusRcosmmeaLPrAwO1/fzpK9yFfpy3KtHtpd39fBTN8Ls+Aol9BpQfZYUptIsdYBiyKj5nCY5Jov7tFik4sIkvoHWUjzQl1yTVdLtngZo0SuZ5jPVn+64qp2W3Ds5zArFEPtrz71Oo3kosH12ol9LQY0Qv1zb4nOQVU5FJNZr+PP0Apzy7pP0nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4559e5d-9736-af7f-bc0b-130a9b391b69@suse.com>
Date: Wed, 19 Jul 2023 14:28:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/4] x86: allow Kconfig control over psABI level
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
 <28a84bbd-b0c4-dd80-b9c2-59770d0f54fc@suse.com>
 <bb671300-543f-3754-b428-73b91ae321a5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bb671300-543f-3754-b428-73b91ae321a5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf5c3b8-347b-416d-5464-08db8853acc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XfP8zf7hXIeKcnChded/sNI8Y0xx2PzKqUTttFFkbUrn7Ut4+3mR/oRK0WrjDrEaK9etyJCnjv0irkaBdjUOT41EcOAEVSKpmZ9rUmf0ZLveAfAwXAbcxM9uFdt7DIte3rCnQO4mUSgcZl2663Qp4rvwOgNNH87BQu+h4Mfn69TCdJTu6XVfPS1im+KieRi8Mur36AHKCMTYYvv7GQ91kWHCsiGAOqdvlbpcwq5+iDrfV2XqYyHOJGzj3utMD3rDa7eJ+TczdWCz1meWSo0PuGMf4F14fef3/EVOu+bem/mjnVzK0w7QnniexOnYLEFKOvF66E0oV54JemXA2OdBqHjvXTrpMD+5/cvTa5f7lAsCL/I6mV/HCzd4eRP/49GCt4yhAGRmeBOeU9PW33ekpcwjDolrfFanTMNxMbRvv4oqCYzUisJ9yHAmYPOBdnf2gpchSM+1O42bpuNI7ceHZrDK7xSdxXPhxW7cwI4UKQUG1f0sh2BwxCGKD1uojcNc5//VPvl6tCi+KwPiuE/CNvHfVu89OEc+vvRB4tzC2B83AvHpONAcmspyLcbp+ulzRkXpxtt3zw/D2i/O7KMAjGokWReGko4kGQAKNIoJVqOFcR4ESN9rVBBde1sVW/Ofw+HgD10nGmIpNZKG7Iu0Sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(31686004)(66899021)(6486002)(478600001)(54906003)(83380400001)(2616005)(36756003)(31696002)(86362001)(2906002)(26005)(6506007)(186003)(53546011)(6512007)(38100700002)(6916009)(4326008)(66946007)(66556008)(66476007)(316002)(41300700001)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3Q4NFo3dDJxeWhYU1FUcG9sSWt0dmJDa2c4RTIza1JMY3pWYzArdjNrZkVD?=
 =?utf-8?B?MTVOQTRROVdjZEtTaVFjdjJPZHJWQXZnSEJnTE10dmJ6YnhXbkV4N2VKUVBQ?=
 =?utf-8?B?QmU2YUlZSHJjZUphVWFDS25PMEt6MlRRK3VHSDNhbCtYeFVzRFhsUkR6ak8x?=
 =?utf-8?B?NmxrV3czSHBWc2JPM3l4QmxRdms2bjMvZURCY0RNL3piK3llQUtyRE9INUZZ?=
 =?utf-8?B?cWlrR2g2RllFMmtmVXhOQk1ubWkzb1VlQ0Q1TGtCcUVYcUlnS2o0VVYzNU9y?=
 =?utf-8?B?QTMvY0NDQVN2RTg2TURDNzBsS1BYSXM0cG1McWZNN0tzOCtUejFmdzRIMmE1?=
 =?utf-8?B?WndnRW1HcUthTWpSZFd3WG5meEtYdkdnblA3TmNnb1JJcDBmbVlwRVFOaGc2?=
 =?utf-8?B?SVh6WXBkc05xa2c2ckYveGNWbk1SNWllbGxjSjR4aUJlUzg3MU5QWjFwc3Qv?=
 =?utf-8?B?WmdQK2FBWm5DZ2Y2U09kbjVBZ05lUFhVVUEveWpVMTFrclFuQ3hWS3hPUW4r?=
 =?utf-8?B?cHd5eTIyWldWV2sxMUkwVmlTTFVSNGl1T1dOQ2hvZXRidTN6NmNBcUVLUWV2?=
 =?utf-8?B?RmlrMFN6ZW9OQnZ3RVYycFNidVA0WWY1S1BaRG9pd3dvcVEzei9pRlJxaU9w?=
 =?utf-8?B?eHZVQzdYWit4L3hVZnAwUTRIOTZZV0hEcU9mUkp3Y3pJdTloWU4vOEIzV1RC?=
 =?utf-8?B?ZklYclNJUzA5NThZY3h1RzEycnpHeXQydmNqeXB1akpiZ1ovVmJIbHllRk9j?=
 =?utf-8?B?TzVzeEJ5UFJnL3FuVkw3OVhQS0pVMTlleEVGY20rNDVaSEZFZlhMQis0Z2xk?=
 =?utf-8?B?NTZPdUYwYnBDNlQ2a081aitFVFRYblY0LzhrQXVRZXZRcmUxSlpnUFA4UDc3?=
 =?utf-8?B?YmcwVkpSRVVpcURkTHZEUzlZZG5qYkVET3Z2d0dCcVdvOXZLcWkwWlBUckJw?=
 =?utf-8?B?Wm1NeGNOVTM5RHl1aWRBaUlpSHVTaGlVNTFvTWo5NTdwS0VJTUcySVpVUVdX?=
 =?utf-8?B?VkNERkJlYVc0emxleVRvejkxWkVmU0pUVW9nSzNhbTNleWVLRmNOWFFXOUQw?=
 =?utf-8?B?UnJyeFA2ZjBISmhrRGVPQ3Z3STdoM3YzRHdzSi9LdDZlMWp3UTBDYVRiL1U4?=
 =?utf-8?B?cVdvd0FWWml6SWNhUUxkVStVVFhDSTFoY05JUW43enpYVG11aWwvNi8vaTlD?=
 =?utf-8?B?b0ErbTBscG9ESVJWcWlhNmpZQllxTFFqM0Q4VDFSRG9NT0FPcUV5MjhVY1dC?=
 =?utf-8?B?ZDdMaS8vYmE5aXZuZDNWaWpwWENFeUFjRHZ0SkVkZVdTR0VCS2xiS3ZmcEFU?=
 =?utf-8?B?aVVWdy9CMTc4STNTZTgrWWxobzdQZWdFRFJBcHpncXFVazI2RTZpR2JaYjN6?=
 =?utf-8?B?ZGt6UUUyMGg0Q2lLb1F5cEdLWEhHQjFHQWFuTU0vRHR4ckF6TVZTditlaXNE?=
 =?utf-8?B?Q2N5RUhSdUtHcE5YdjArN0huRG9tcm5qUXhLd2EvTUxocGc0d1hCNVN4QU9O?=
 =?utf-8?B?eEJjRDRYM28zT0F0blg2ZFNrVlJnUkZQTW9tZEVrMXNXM0szSkNxaXhUTWYr?=
 =?utf-8?B?T2tFWndnVWZPc0d3SzY4RlQ0MTNrcSsweE1FTlR2dHZXSDRqRDRvSjRxaG1x?=
 =?utf-8?B?ZzNyVldiOW5iTmRHZmVoUndHL1JURDR0QVRqVlZrdmtHZ3RRZGQxVFU2UkFN?=
 =?utf-8?B?dEgyS2dDUjRVV2F2RWxhTFl3dnZSZjdUdzlma3FuZ1RWa2NRZC9yTjYzUlJH?=
 =?utf-8?B?WnEvdnl4eHRBQzdna2IxSE5jUks5RHpxVmxHOWxjQjA3d1ZiYndxVVAyWDRK?=
 =?utf-8?B?cTVoT2JkWFpKaXVyUFVVSWtnTENFVHpiUm1LWXZ0d004RGZtbFJFZktFTVY4?=
 =?utf-8?B?VXdwdXdjZnVZdE1IeHdROGcvR3ZqSm5EZ1RJRURPMklza0Y3S01Xb0VFd09x?=
 =?utf-8?B?N3VJeFlCUmtlNkxuay9nb0U3ZmpPeVlVck1oTHBUZ1huY1NXcjduYXduRHkx?=
 =?utf-8?B?S001cTMvakR0Qk9RZkdsV3VtaENjdHNOcWhSTEJZcGNEQUhGSWFaQ1BVcHZS?=
 =?utf-8?B?b1d6aVI4by9wR2FDN3lCWUFYdWo4NVZ3a1ZtS3BIYmdwVndSa1l1Y3FqTEJK?=
 =?utf-8?Q?Imgls7bWhS2GCRbTLTKIw7H00?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf5c3b8-347b-416d-5464-08db8853acc8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:28:36.6652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13M0MgHUtv6WrVA7i2aJ9WhYc5sOzhmohWCqGb5FhqH6FCgg84Z/3GrGfmcimZ/KhdoQHvW+Ia+358CMrINCww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7292

On 19.07.2023 12:04, Andrew Cooper wrote:
> On 19/07/2023 10:44 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -118,6 +118,36 @@ config HVM
>>  
>>  	  If unsure, say Y.
>>  
>> +choice
>> +	prompt "base psABI level"
>> +	default X86_64_BASELINE
>> +	help
>> +	  The psABI defines 4 levels of ISA extension sets as a coarse granular
>> +	  way of identifying advanced functionality that would be uniformly
>> +	  available in respectively newer hardware.  While v4 is not really of
>> +	  interest for Xen, the others can be selected here, making the
>> +	  resulting Xen no longer work on older hardware.  This option won't
>> +	  have any effect if the toolchain doesn't support the distinction.
>> +
>> +	  If unsure, stick to the default.
>> +
>> +config X86_64_BASELINE
>> +	bool "baseline"
>> +
>> +config X86_64_V2
>> +	bool "v2"
>> +	help
>> +	  This enables POPCNT and CX16, besides other extensions which are of
>> +	  no interest here.
>> +
>> +config X86_64_V3
>> +	bool "v3"
>> +	help
>> +	  This enables BMI, BMI2, LZCNT, MOVBE, and XSAVE, besides other
>> +	  extensions which are of no interest here.
>> +
>> +endchoice
>> +
>>  config XEN_SHSTK
>>  	bool "Supervisor Shadow Stacks"
>>  	depends on HAS_AS_CET_SS
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -36,6 +36,10 @@ CFLAGS += -mno-red-zone -fpic
>>  # the SSE setup for variadic function calls.
>>  CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
>>  
>> +# Enable the selected baseline ABI, if supported by the compiler.
>> +CFLAGS-$(CONFIG_X86_64_V2) += $(call cc-option,$(CC),-march=x86-64-v2)
>> +CFLAGS-$(CONFIG_X86_64_V3) += $(call cc-option,$(CC),-march=x86-64-v3)
> 
> I know we're having severe disagreements over Kconfig compiler checking,
> but this patch cannot cannot go in in this form.
> 
> You're asking the user unconditionally for the psABI level, then
> ignoring the answer on toolchains which don't understand it.
> 
> The makefile needs to be unconditional, and the Kconfig options need to
> depend on suitable toolchain support.  This is the only way we don't get
> a false statement written into the .config, and embedded in hypfs.

I was tempted to base this on "x86: convert CET tool chain feature checks
to mixed Kconfig/Makefile model", but then it likely wouldn't have stood
a chance to go in either. The technical issues aside that need solving in
that other patch, I still haven't had any feedback on the conceptual
aspects. Yet as said in other contexts, without having the conceptual
side (largely) settled, there's no incentive for me to invest time in
dealing with the technical issues (which surely are solvable).

When raising this aspect, did you pay attention to the first of the TBDs
in the patch? If we were to force build errors (for no real reason, see
below), we should first try those fallbacks, to limit the possible
damage. As mentioned there, support for these -march= forms isn't all
that old.

As to forcing build errors in the first place, that goes against the
intentions with the mixed Kconfig / Makefile checking model. There we
would only issue warnings. Albeit as mentioned in that patch, that's up
for discussion, and a majority may view things differently than I do.
Especially here there's no reason to outright fail builds, though:
.config / hypfs wouldn't really state anything wrong - the binary merely
wouldn't make use of newer insns despite being permitted to.

Jan


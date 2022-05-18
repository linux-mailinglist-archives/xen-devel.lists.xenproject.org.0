Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C352BB4B
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332089.555729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJMK-0008Pr-U6; Wed, 18 May 2022 13:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332089.555729; Wed, 18 May 2022 13:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJMK-0008MP-QF; Wed, 18 May 2022 13:05:00 +0000
Received: by outflank-mailman (input) for mailman id 332089;
 Wed, 18 May 2022 13:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrJMJ-0008MJ-8X
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:04:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d87ee5f-d6ab-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 15:04:57 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-LMbg5mXfPtSXCxzpVyn4MQ-1; Wed, 18 May 2022 15:04:55 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3250.eurprd04.prod.outlook.com (2603:10a6:206:b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 13:04:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 13:04:52 +0000
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
X-Inumbo-ID: 1d87ee5f-d6ab-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652879096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCFWjg38DMiEyF7lKWWnUxcwO3pC19Y8ZRqkPG8+U4U=;
	b=Md35FX81YqZAEi5YhSwQOYWOtIbr5O5DNI23TcpNhcKp5j5SuMSAbj/ZcbxqaWcIGVv6kb
	XElR1/EFnVJXeS7iBiTTBtNUnmCsYjUCYxluN1gX77Pz6b8vqHVibmfhDP7frN24xS3/jE
	FzPOh7Y7eBwWRPFFMh5AXThUTSDBJzA=
X-MC-Unique: LMbg5mXfPtSXCxzpVyn4MQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQZykUL+oSzIn5e/RLMjWDuK/KWjS2rkfcKOrpi6GOfWno/Aixs/1oY6HotdSbBVkypQ9T0Z/bIdx5FT2qtTyfWclKkTAf6bt2EIqYxPkPw91ZfqxsiIfXh16EtIksyRTxElf609Mm7Xwb+dUITZ38Y7YSoPPzk+hBFTU72isVtbD3xyVjh9zmi9QEtoj9hSQNY/TBfi6lDwrcgl3owMYbOmjhhO7ByqIQK+2crUT/E+0bfi1O9Od+T/kP+uVMV/u7mmbJcdrfF9+CCxQT3+HYpzRVgHaFivBS5naX2z9lWSfd2CmHNfRMuu1EEHAAUZmI6mVK50spT8fbI2dCyrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCFWjg38DMiEyF7lKWWnUxcwO3pC19Y8ZRqkPG8+U4U=;
 b=FNe+R+6B0zRR0njhdsEf/BJdfs/YhBykCnW47PUwExZ46vc4OcJAw9ha2xKECTcYfZym5r+Gjs3H8Ba6KTBS/51d50eegJ4hAzeLqh9dQw+CA4RZa00qd2WgvzDsoY6GTLhP5bl2VUOJb4IKE59CA/EWqr5Q4/PICGrBljsW/tiJh7/qtg1JpjuKaE4X+KXI2sEHiobn4qYf+nKDgj8YP2HgwBaDjR7BhxMlzWDEBYYpddI8cAPcVpk6IjcsItV9qrUfebLjDo99MJ7P4D0m92i2PI/MfAn14mophrlCJkkPsUkND4q2eTJ9/daoi/zPz0WMulPrG51LhSO4jb7CHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b04ca55-f617-dc14-cbf0-a3e427ad5869@suse.com>
Date: Wed, 18 May 2022 15:04:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220511014639.197825-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 626fd96a-38c0-4e37-1eaf-08da38cefefd
X-MS-TrafficTypeDiagnostic: AM5PR04MB3250:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB32500757C2F006D949E412D5B3D19@AM5PR04MB3250.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kv+8aFkDdi+N7tAsmuflE3/Jj/9mMax3TKR7jd+g/CXiZnbiFtV+va8mlikOLMxyKI8XZoBer0aXgpVFZmcy5eJZOrkE/oGNbslK64Sz87fAWeKMF9ZRwQqsLsYebb4t39PtxqaACwlYAv3ttfZ3l2WVqraB/ILMH+/U7McZu2QpdAiQF+dq4Gb012LKMgjMQyU3HE7aRGV5fdwEQTF+7VwR0Iiz2cFzjI1O+40qZlZVkAfkCPCODSZRpELW4QWRWI7Janjp/jDltJbA0i4aeZ2mN5sIreQOqR+jEGu5k80r1fW0XSAM2F9wwOCfn8qR1eY3x1o2P7zg50ew5xMksZW5Ph0G3ZUW+xDBRZfJqsk/A/nQNumTg0tnSgErQA56Ik0u+FUkhFF/z/1pWdhQk5SIicSy4gGiSY5Lbh/IxR9BDNsg3ZicsYGF+HqeGHzF2gWqmr78Yo4RMIwiSCewE9NCr/Yso7QfJOF+bPmzzLCGUYSvW2dwmuOZGbNJuwbz7fYPNSrk4xzDXGuftddw/z7Qpyu5ZrhGaiINnZ+lMIZ0IhXWgp3hDcPmi+Xd1m+EOirjrcFnM5DkRpSU3G3OjtRD7jd/HbjP4Hxet5Uujg9c/uOUDPmma2xQUNBppm6GZ2fq950gGv4EJB9ZJkGMWhcKiMvX1IHGqfenmiLfcHgfIW5R4o9aFkNgIZW8qi+rg2TFDFwzJQIJDmCTts4vaznvYLcy2HfkSO9svH//AZyjUYK2WTAuIBQ8gVYsH3TQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(8936002)(66946007)(66476007)(66556008)(8676002)(4326008)(7416002)(38100700002)(508600001)(54906003)(6916009)(6512007)(316002)(2906002)(6486002)(31686004)(6506007)(26005)(86362001)(31696002)(186003)(53546011)(2616005)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OURLaURuZjFDNmYrZ3hCNEpGMHFnRzdCdGd5OHpVV25hSERySFNzSzhhK2hV?=
 =?utf-8?B?UXJXYnlyOUpOUFpRMGQrQThZOTc4Q2hua2FhZEx3c1FseHJzbW8zVDZLSGJp?=
 =?utf-8?B?ZXFVNkZKMlhNQzlNVlZORUdSbWZrMElUQzd3a3dEdGRoZEZmSEdpVk1pdXFw?=
 =?utf-8?B?UzY1a0kvaktzdnlIOUY2alZmVWZXMmNGcEdSdHFMNmxyazZCWlY1Z3F1L2xp?=
 =?utf-8?B?RUNURXYwaHR5MlQvek1ra1FTZms1NUE1ZSs5clp5a3JsKzZ5SFpxRkFLb3dC?=
 =?utf-8?B?WTlIT0M0V0hKaU8zeWFzRzhReUZvczJCclpNbU1heXlaMklZNjhXblV1T0VF?=
 =?utf-8?B?dldjVHAvYVE1cUhpV0VPS0wxTnVmZjZvSmszMmdOcHE5UWx6bytpUUMyeWFh?=
 =?utf-8?B?OFpZVDJUMTJzRzhyemdWSjVxTXdKc2FUdGJ0TWdkODVWOE45Q2g3cEZWVTFW?=
 =?utf-8?B?VXBIaSs0MmF4eFdWMURnVzVYR1ZIQkJsTWpYcGlKcHBncFNFblNUZjdIY3dG?=
 =?utf-8?B?bXNmTmRiRzFKMlhhQ3pqU1J4bXA4RkNpTWo2Mk80SjlEdkV0WXVnTmQ2R0Nq?=
 =?utf-8?B?Z2YrZ21ZV202a3FqTlN4aDdlcjhvS3pwK0p2OWZzalRqL0oyNzN2OG93aVV5?=
 =?utf-8?B?RG41ZGgvTFZOZTEycXVGQjIxL012QVZvVVYvdldEM2JrbzVzeVE0bDkzQkJh?=
 =?utf-8?B?aU5sWTJFdVFyZEV3VFVkNUpCeDgxMVBSaS9lUFpmRjBkdVJ6QVJXTzJvaVdG?=
 =?utf-8?B?TnRHV2VUVmZ0eEplT1BUN2YzMC8vR3BiMkhUanBNYnFjOXRNMVFhSGtvUnRD?=
 =?utf-8?B?RFM0aGM5UTdwLzlPMndxVC9sYUFNbHFHc3RRTVZYRExpMGNXMWV2WlUwMFdP?=
 =?utf-8?B?V1M4a1RZWUtZaDhLb3RCR3JLa1c2cWh2S3N5aDRHVS8vOUhCTk1xR2tGMG1K?=
 =?utf-8?B?TWVtWlBWeDVxN0VTeU9DcnQvWGxhc3VjTTF3S21HQWpBWHJnaHl3T0RKM2l5?=
 =?utf-8?B?TWhCNFFGVm9ITkRWVGlUUC9DMVVuUW5UWkNNVVhqcTNyaVVqa1J0YkxMblBy?=
 =?utf-8?B?WlorMTV4T3loM29nMTBYMm5tMENodlVzWlZ6Yi9TZ3g1MDNvMTk4eFYyUzRF?=
 =?utf-8?B?N1VkdEhxTFBtenRIZlZVeG13NUMyTW9oTVVUdGpTQmlKdEhYOHhrREErV1gw?=
 =?utf-8?B?MDVqYjg3R3hwWHNPMXp6Wi9EbU1DRm5WeGJTVks1dnVNQk52dFpWM1E2VWw0?=
 =?utf-8?B?WUgxck1XdWNFVzI4SzJKaEREWGtJa2pFU0NUbUVRdXVZSC8xWFNraVQvUVc0?=
 =?utf-8?B?SXhYOU41eDQwK1BJUGdpa1pyVEVGZUhwYllxQW1IV2hIV0g4YTVWZ1h0djRM?=
 =?utf-8?B?bXcwcXZjUTRMdlFoL0JIclc0T1BYS3k0NDQwd3d5YVJGNkFiYVpZNHBCb2tP?=
 =?utf-8?B?dEtZY2s4ZXAwOGhzdEdSck5EOXFRUHV5NnRnNFVtVy9qNTlqODZGMmVrRmp3?=
 =?utf-8?B?UzhTMjlBNE12ZGFmbm1OVWRaeEEvc0xZb2ErVGxhdkVqMWtXVVM4SGFna2VX?=
 =?utf-8?B?YjNQTTBYUDZPVWdCZTVoN3h4YllMckJaT2ZqWE5wUHRIYzZOVkFKaWVxNVdr?=
 =?utf-8?B?Uk9qSk5CWlhMV2d0WDZRSnM0UnVUMS8vb3NYL2RCREJRd1kxQ3VNQjF1aEV5?=
 =?utf-8?B?NWViRHVzUWVHMExhM1FkRzBYdmRselp3eDl4ajdJNHQ2WWZQVld3bXNCc2hW?=
 =?utf-8?B?NkZOa2NWWDhNS05tR3U0TnltMFJBczdmTzFxZ2xMRXhxc2V6TENOWVNINWYy?=
 =?utf-8?B?Vlhha2Nidkt0dmFvbytudkNCWnYvK2M5MzdqOVRQR0FBcnZGdktYMCsweDJ3?=
 =?utf-8?B?QXB3TnFBdEJ0OSs2eVVuWGxNcGRBL1J3cWx6UDA2c3IyaDg3TUZNQy9XY3N0?=
 =?utf-8?B?RFowMXZHVFd3QmdQNkxmeGZIVzZ2alBiUVBFNU44Z2RVakgxMGpyc1ZsMmRM?=
 =?utf-8?B?NDdoRElNOG1oRVBNSU5yNVhYYWtDN2orWlBibjhZNS9XL2JRbTdCWGhTcEti?=
 =?utf-8?B?QTdTcFRlRHVLTkw3bm9mbnp5d0VEZkRWTjZQUnR0SGRoWkMzRkZPTTNqV01w?=
 =?utf-8?B?OE53dlAvUklBMFNPaVp0TGpPNzVFQVg0dlhVbHFYblRhbytxUGFiVjlMeUNk?=
 =?utf-8?B?RzEzWVRRTnFwKzZpT1l5a01jbXdCV3hwcVQyNVZCczlNYlVmTVptUUF6VTY5?=
 =?utf-8?B?aHl2Tk15Z3dEL1VWVW9rVUtZQ1RvYUVkUXM3VXZrbHkwekEwaThBS2k3c1Y1?=
 =?utf-8?B?YnA5eWN1NGxHTWRLZjd0NjgycXowOTVmTXErdDJmR3hIR2hsN1d5UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626fd96a-38c0-4e37-1eaf-08da38cefefd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 13:04:52.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+NhYCbm27vBai56XoK0u7q0LoHomyakn7Cht+OYHBM36QqAjKSTet8craYA+6WBkOAEwsyAy+ho0awPFfQnmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3250

On 11.05.2022 03:46, Wei Chen wrote:
> x86 is using compiler feature testing to decide EFI build
> enable or not. When EFI build is disabled, x86 will use an
> efi/stub.c file to replace efi/runtime.c for build objects.
> Following this idea, we introduce a stub file for Arm, but
> use CONFIG_ARM_EFI to decide EFI build enable or not.
> 
> And the most functions in x86 EFI stub.c can be reused for
> other architectures, like Arm. So we move them to common
> and keep the x86 specific function in x86/efi/stub.c.
> 
> To avoid the symbol link conflict error when linking common
> stub files to x86/efi. We add a regular file check in efi
> stub files' link script. Depends on this check we can bypass
> the link behaviors for existed stub files in x86/efi.
> 
> As there is no Arm specific EFI stub function for Arm in
> current stage, Arm still can use the existed symbol link
> method for EFI stub files.

Wouldn't it be better to mandate that every arch has its stub.c,
and in the Arm one all you'd do (for now) is #include the common
one? (But see also below.)

> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -1,6 +1,5 @@
>  obj-$(CONFIG_ARM_32) += arm32/
>  obj-$(CONFIG_ARM_64) += arm64/
> -obj-$(CONFIG_ARM_64) += efi/
>  obj-$(CONFIG_ACPI) += acpi/
>  obj-$(CONFIG_HAS_PCI) += pci/
>  ifneq ($(CONFIG_NO_PLAT),y)
> @@ -20,6 +19,7 @@ obj-y += domain.o
>  obj-y += domain_build.init.o
>  obj-y += domctl.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> +obj-y += efi/
>  obj-y += gic.o
>  obj-y += gic-v2.o
>  obj-$(CONFIG_GICV3) += gic-v3.o
> diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
> index 4313c39066..dffe72e589 100644
> --- a/xen/arch/arm/efi/Makefile
> +++ b/xen/arch/arm/efi/Makefile
> @@ -1,4 +1,12 @@
>  include $(srctree)/common/efi/efi-common.mk
>  
> +ifeq ($(CONFIG_ARM_EFI),y)
>  obj-y += $(EFIOBJ-y)
>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> +else
> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
> +# will not be cleaned in "make clean".
> +EFIOBJ-y += stub.o
> +obj-y += stub.o
> +endif

I realize Stefano indicated he's happy with the Arm side, but I still
wonder: What use is the stub on Arm32? Even further - once you have a
config option (rather than x86'es build-time check plus x86'es dual-
purposing of all object files), why do you need a stub in the first
place? You ought to be able to deal with things via inline functions
and macros, I would think.

> --- a/xen/common/efi/efi-common.mk
> +++ b/xen/common/efi/efi-common.mk
> @@ -9,7 +9,8 @@ CFLAGS-y += -iquote $(srcdir)
>  # e.g.: It transforms "dir/foo/bar" into successively
>  #       "dir foo bar", ".. .. ..", "../../.."
>  $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> -	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
> +	$(Q)test -f $@ || \
> +	ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@

Please can you indent the "ln" to match "test", such that it's easily
visible (without paying attention to line continuation characters)
that these two lines are a single command?

Jan



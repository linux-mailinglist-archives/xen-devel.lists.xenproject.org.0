Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A684CA855
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:41:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282314.480980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQAT-0005Ux-NM; Wed, 02 Mar 2022 14:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282314.480980; Wed, 02 Mar 2022 14:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQAT-0005Sz-Jk; Wed, 02 Mar 2022 14:41:29 +0000
Received: by outflank-mailman (input) for mailman id 282314;
 Wed, 02 Mar 2022 14:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPQAR-0005Ss-V5
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:41:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6e23165-9a36-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 15:41:26 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-_sxWMuvmMQ6j6E66vToC5w-1; Wed, 02 Mar 2022 15:41:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM4PR0401MB2276.eurprd04.prod.outlook.com (2603:10a6:200:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 14:41:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 14:41:23 +0000
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
X-Inumbo-ID: d6e23165-9a36-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646232086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqA8OqD+yUMC7m6+AcDWe9b9RNpI0QXmhWjntsHZNcY=;
	b=FNw2VU+M3LY1tuDt48SO51EYIP1SQ0/4Xdo4Pj/hfHdQk57J8WkNwbISldzjpsO9yfZl76
	1KeF5vLGFL6MrbG4gvIOiZfw7GhU9h7j0hMQ/YW37FieibYZ2mA1fihv2SfcabXEMq1Utn
	qDtb6ERaYHoB4TdYHfyyx4Jx9qns7BA=
X-MC-Unique: _sxWMuvmMQ6j6E66vToC5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6Zef21ViGf5i1vijMjg9LFhQE1M5ad7tE1NTMdoQxzeJZgdaTB8ERXDUSJR7I20izIeTIt3cD/BRCtudrAbdMaouMraN1cfN4DQ4yaS6xfvmhwa7929gSjd95HAGr74anE6NtKd+ptqvnlcgQDY32NrvYAzUHP9kq3xqKlKahBkAYXvojGJ6XuszXq/XUxJi28sHKO+39dhuWFQZqtLtVUSvhE14h6F73RzqcSOOr0MWJtaUjTXRZxe2x1S/oGiTA+grUIEBMGKSp4Q+KbuGYJwBJnOcSq8SUDEq/ELHno98mU/LmAuMxUfY7otnHbB8g+VWTrFZX/zPcDcPQfswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqA8OqD+yUMC7m6+AcDWe9b9RNpI0QXmhWjntsHZNcY=;
 b=FBLCUEenjy46GfC9ARouQaYPo9p8gYe06rzV6rk7l567Db6E/ridFixGiRdFrrbaV20lkcORctE03HnEGiCcP9vxEuaVGbg2qqxn7Xj3T+4bEZl6KMm83aeBUOsRA6NC/PBossvqDOtfeZFdj7bYDtxWafDYMzeJ9y/pPMxNmTzMxSiepOqXE59D4XBm5KpL++7H1L1NVc4Fd7ze+NoyVU9og8nMWpdxNJz+zBxBVQg0PoAH4/wSgWD/XAnClYQCwRgbvyVV6FBDggYHb7rzdRDfdMa2aIMRvxNwVLNRbCvU9H7BNph5tN5zsLKyS/12Y2D46P+miI08ROxbxBCbPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f67e599d-4dfc-c98e-75ee-8510237cd527@suse.com>
Date: Wed, 2 Mar 2022 15:41:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] livepatch: set -f{function,data}-sections compiler option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220302134425.38465-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220302134425.38465-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0058.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb73a5f8-6ff3-4cbe-2f2c-08d9fc5ab952
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2276:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB22769289A635B1753D6AD6BEB3039@AM4PR0401MB2276.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YhiTgDYfZZ2Qtq1iTLry4iPEiXCRrkeVG8qYzAFVCveVayZzws6S0Qd8K/vPS/YjfSxc2bx2Acb3RIR49kyGfC1HKVEc1sKqRs2+CeufTY72DPG3TGMIY2wyLdJepv0YAii/wnO9dG6n39wYuaD5wWEwmK2IgjhgnxxCKA2r7pL1LiVo108jcuahrQ7KobziIvE7AI3QU01TzYbHNXq4RoEuPTSpI8JDREWoS6KEUn3xhW5MQswWLq+ghN/qN9fXqcUqmgBzDWkJh7gkwZ1vtekhrCwzAM4ic0VO4HZDv1DMah78lb/nhPZjKNz1ay1TZXCIkXdw024cgZKMVKQTsDM+zkoKVPPm2eWsqCstbYVndhpKxlgo5iSwie40MCAUv7zMaoGi07z1epSQjE4GhavOTrlqur1V192tIuoRMzoJlvUFreR1tBj1mJlFqgBWLoIv+bDSxxepmlqSVZ6zP1MnEXJVcB1DuJSUYmHP4ig0BodSauNT1vw4appp+zJuzt7UNeBs6yXbTZ8O6Iu3EDakdm4dxxswYRjfkmLvhaT1mvVLh9TETBr0Hlo5wzXPlBQJN5iYEIx66Be6rMR1X+eHNtyw+7huVqvD7vtoqP032d8PnO5SEzILFiTQojOBxGswc5tQpYMu0sLXLmLb0/3awFiC7/MfeLeMsVK4mwFZ+ygNEHpxlVO2C16U9ug1vpedDTY4LpiDmuDpOiOlLH35BIJ1Dh67qFHq37INwoG7g6GYgBnlSspPDQX8PZDP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66476007)(508600001)(38100700002)(66946007)(2616005)(316002)(6916009)(86362001)(31686004)(6486002)(54906003)(6512007)(6506007)(8676002)(186003)(53546011)(26005)(2906002)(5660300002)(8936002)(83380400001)(31696002)(36756003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnJVWmtIdW9QZWtMK2JUYnpWQk9UQi9sd3dDckRLd01Va2hjMEx1RG5ZSUV1?=
 =?utf-8?B?anJpSUs0NEFIeUl2eWlONkZmcG9aV3V4Um1DVTlqRE1ZSmx1dElyTjQrdUhy?=
 =?utf-8?B?WXpXSVZOSHdtME5hV2ZDVThma250OXRCQm5Qak1OaE1mbFhKamw4VXQvamhM?=
 =?utf-8?B?NXJjZnIzMFBZa3k4VTh5b1VxaFd4NHRucjgvYlFrZHNxKzlwL3Q5eHN5WGJX?=
 =?utf-8?B?V2VYRE9LYzNmT205akttQmplNjFuYUF4UjlaNEM3OUtBbEtaNTdXSk9OZUNS?=
 =?utf-8?B?dlkwSFpCRlZYZXphZFo5VHdQZDJ2Y1JEMndscnA2UXJnWDhkQ1hVZWk5NGFZ?=
 =?utf-8?B?WGVsdk9UckJ4UnF6WnBIZVR1eGhlU25iV0JvbE1MZkg4YUxDTzBqNlNNOTR0?=
 =?utf-8?B?cWpES3lXOUdHcFIrYUFOTUxCVFJybDJBSmY4eG14ZHAyNEYrL3dhUWhnQ1Yw?=
 =?utf-8?B?U2NoaE5EaFpZN252ZmIvT0g0M0hoZGorTnc1RitNUU5qdlRGckF1bEF4VFl1?=
 =?utf-8?B?L1FyUVhSZUU1SFJyMUd2K3I0TExZR0Nta0EvVVMyOWI1MmtwN1VBZHIwM1Ew?=
 =?utf-8?B?cU5LUFZtNWlrcjJOdnlrZGVtSVR4WHRNMDJSVVd1cEM4T3BOZmEvNG9WVGFn?=
 =?utf-8?B?ME9wNjVuNlliUlhtcWhoSEdHblJleFlhYW1FdlhSZndxTzRvR0w3ZmdvKy9N?=
 =?utf-8?B?RlVBWEdocGY5dHVGNDBwRzFPOWFLTTVnSjBZL2J5T1FPU0RYcytMdmVxc081?=
 =?utf-8?B?cGIvaWF5R0czUkxwSTZsVzU1Z2gzUXhYNTdDVXI0NnE2Z2ZxZWdMUjNJZnFt?=
 =?utf-8?B?bzN3TVdYUkQ0d0tLbzdEUGRRV2g4VTJPYmRCKzAzUFRsVDVkZWt1T0pEd0oz?=
 =?utf-8?B?YnEwT2VDODlmY0Y5c3VsVDJSRWFwRFBjaFgwaUdBOXpoMXcwVE9sY1dxaVgy?=
 =?utf-8?B?eWNoa3R6WStLTk96Q1VCMkF3Y3JLeTZRNFpjZmpBSytQUjlCeUJPZWJlWEZu?=
 =?utf-8?B?eEpORzc4QUtHVjdGN0lkd3F6VkZSMjI1MHp5b2QwalRkem1kNTJlNzZaZS9Q?=
 =?utf-8?B?S29naEVGRFRKNHFDejZXNlQ3ekJyUmsrcGJISVZtWHRlSXNoYVVwdXU4TWR6?=
 =?utf-8?B?QklFeS9LWFpKS3lRaGhuVnlDK0dzLzJGQmhRR3RQczlENVBadlVuWUw1alFN?=
 =?utf-8?B?Y2RtWTlrbUJZSm40YUx2VElhczZsbEg1aUVsWEZFMS9MUXE0cHZPOTViUkVY?=
 =?utf-8?B?ZXJmRmwwcGZFNGpjOGw5emNteXV4QnR6VnQ0VjdzRjJ1SWpqQjhBeUhxZTln?=
 =?utf-8?B?THJuVHlVNFV4cHcyYWtPNVovUE04c0NIRXVxQVVNbnF3S1BQd3phNTh1S3h2?=
 =?utf-8?B?UnQ2QTBkTDVXZDNwUW1sYTNHMHE4N2RmK2U4bmVnU0d2eG5EUTNWU2RETWY0?=
 =?utf-8?B?MWN4UEZSajFlTXljc1dpNlZuODVMeGQyNE1rRzFlYTM2ckZRNi94M2FIdkYz?=
 =?utf-8?B?YjRPVmVLQVJENHJIeXlqaU0ya0J6ejBYNU9EbWtSTE5jMHVWeW0yOUxjbW9T?=
 =?utf-8?B?c04rcytsUDdHZE1uTlRBRkJkeGFZQ3RlR3V2VUxQOG1PV1FoeTFPVWZhc3Ew?=
 =?utf-8?B?bWVYMXdzMkRDOS9Tak9EeXdPSUpwVHYrdDR6OEgrUUp5SmV3OU1ralNGVFpI?=
 =?utf-8?B?Y3B4OXVNVEE2VUxlZFUrdjBMQzlBdVc5ODFmZEtZMCtMV0JydmdHOXY3RU1M?=
 =?utf-8?B?UUxTQnZybU9OT0lNWWZ1RnN0SkNCcmJBS3BZTVRDcFpobUlTSzZRcTg5MGh3?=
 =?utf-8?B?NlJtYTNHbjFsYkN4NXlpTXBRRXRDS24zR2crS1JBdTZabUdhdXVBaEhnTEtY?=
 =?utf-8?B?UURjWENHSTZNZllSSHdPeHhTQk1JOExqbzJ1b2Vlb3cxNjk2Y2czS2Vza2F0?=
 =?utf-8?B?dWJTa3BMU3N0OE5RcVVNQTExZC9PL1Y5Q2k5am8rQ3VaT1loTmJVNjRmaHZH?=
 =?utf-8?B?bC9HNUJTOFhOZG5VUy9NWWQ1Q0tLaVY5NEt0WFk2T0hySjdkY0Q4UmYvRWpo?=
 =?utf-8?B?angvOHU2Wi85a1FxSktscStjOXNLeVN5M3NSSGZQYTdGdjExSm1VZWM3bTVZ?=
 =?utf-8?B?a0tvV09JMHN4cFl1MC9DTzBTSFBKai9jd2F5MWxtMnRQaTEzU094WStTelF1?=
 =?utf-8?Q?OIioETKt8hMJOtllfXbRSpA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb73a5f8-6ff3-4cbe-2f2c-08d9fc5ab952
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:41:23.7469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQTxq3nTEeTNcBLVe1CxTW3FlWzX7AfkLm+hgqyCuLuH/Hvz4sZoO7ZvlIUIDJ8JOZIyDGPHtd9kT1y6CLBdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2276

On 02.03.2022 14:44, Roger Pau Monne wrote:
> If livepatching support is enabled build the hypervisor with
> -f{function,data}-sections compiler options, which is required by the
> livepatching tools to detect changes and create livepatches.
> 
> This shouldn't result in any functional change on the hypervisor
> binary image, but does however require some changes in the linker
> script in order to handle that each function and data item will now be
> placed into its own section in object files. As a result add catch-all
> for .text, .data and .bss in order to merge each individual item
> section into the final image.
> 
> The main difference will be that .text.startup will end up being part
> of .text rather than .init, and thus won't be freed. Such section only
> seems to appear when using -Os, which not the default for debug or
> production binaries.

That's too optimistic a statement imo. I've observed it appear with -Os,
but looking at gcc's gcc/varasm.c:default_function_section() there's
ample room for this appearing for other reasons. Also you don't mention
.text.exit, which will no longer be discarded.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -269,6 +269,10 @@ else
>  CFLAGS += -fomit-frame-pointer
>  endif
>  
> +ifeq ($(CONFIG_LIVEPATCH),y)
> +CFLAGS += -ffunction-sections -fdata-sections
> +endif

Perhaps

CFLAGS-$(CONFIG_LIVEPATCH) += -ffunction-sections -fdata-sections

?

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -88,6 +88,9 @@ SECTIONS
>  
>         *(.text.cold)
>         *(.text.unlikely)
> +#ifdef CONFIG_LIVEPATCH
> +       *(.text.*)
> +#endif

This coming after the "cold" and "unlikely" special sections and
ahead of .fixup isn't very nice. Also from looking at the linker
scripts ld supplies I'm getting the impression that there could/
would then also be e.g. .text.cold.* and .text.unlikely.* which
you'd want to separate.

We may want to put the entry point in a special .text.head, put
that first, and then follow ld in putting cold/unlikely stuff ahead
of main .text.

For the reason given in the description I can see why a conditional
is warranted here. But ...

> @@ -292,6 +295,9 @@ SECTIONS
>         *(.data)
>         *(.data.rel)
>         *(.data.rel.*)
> +#ifdef CONFIG_LIVEPATCH
> +       *(.data.*)
> +#endif
>         CONSTRUCTORS
>    } PHDR(text)
>  
> @@ -308,6 +314,9 @@ SECTIONS
>         . = ALIGN(SMP_CACHE_BYTES);
>         __per_cpu_data_end = .;
>         *(.bss)
> +#ifdef CONFIG_LIVEPATCH
> +       *(.bss.*)
> +#endif

... are these two really in need of being conditional?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -353,7 +353,9 @@ config CRYPTO
>  config LIVEPATCH
>  	bool "Live patching support"
>  	default X86
> -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && \
> +	           $(cc-option,-ffunction-sections) && \
> +	           $(cc-option,-fdata-sections)

Is this for certain Clang versions? Gcc has been supporting this in
4.1.x already (didn't check when it was introduced).

Jan



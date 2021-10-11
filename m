Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5B428DF4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206003.361452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvM3-0007yo-Jk; Mon, 11 Oct 2021 13:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206003.361452; Mon, 11 Oct 2021 13:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvM3-0007w4-GX; Mon, 11 Oct 2021 13:28:35 +0000
Received: by outflank-mailman (input) for mailman id 206003;
 Mon, 11 Oct 2021 13:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZvM2-0007vy-32
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:28:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2062be32-2a97-11ec-80da-12813bfff9fa;
 Mon, 11 Oct 2021 13:28:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-mBfnUlkqO5m4JUtnHRJkCw-1; Mon, 11 Oct 2021 15:28:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 13:28:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 13:28:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0074.eurprd06.prod.outlook.com (2603:10a6:206::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 13:28:27 +0000
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
X-Inumbo-ID: 2062be32-2a97-11ec-80da-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633958911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9kzb4yBJ9OGJMK0JLjIkh6eFopaFEA/AGpXNmsx6zw=;
	b=WMuceT4k9gLt0VdYxoytNadobM8u4o9nuX83gy3bIjrd6lD9rDryEeoMaPqMu+T/mosVp6
	f00rPRCoiDDfeTJZsFKFh/dki8UOzmtTZaDdbSbrHr2RsH4SvRh+9fyeQiRiZgvN5wlDvt
	OKGBO+CwMhkgTdHqshfmx4fN81OgAow=
X-MC-Unique: mBfnUlkqO5m4JUtnHRJkCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G33pFvyomwleGXyV1O+MvVLvAZ1xvccCscBAlpB5e3eX5gYQD/z9cVaC5qlFviYzUSAfCs3SnCI5io+VhNPWbD/hYTJWx07MH3Ic4O7jLC80WAxa2Na9TkCJUAiLCpC8ukEJoD+b2m6E6vTtf48iYmj/YPjoMrVv5HTiqwsbS5r04C3aXbdeH+/7Et1x1U6bbv6weh3gACC0Kpfi5P48KzC8bFhBT3avp1ok5/DvJtPYK84TF45pDxH2F9toeotL56a92ot1bebe+b3ljpIR68uZJz6TpIt8JmN4R55TMUF+Wec+OmO5YcVj1FhUNDBRezPDj6WJ7MrhMmUaX0nsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9kzb4yBJ9OGJMK0JLjIkh6eFopaFEA/AGpXNmsx6zw=;
 b=VynkAk2uIjjHMp9BqD4hQkgxNSAvlxqOKkw9zOOoeoXSm5xB4vQJDpNY1L7VBfLsBKVRuEEK4xChZ/v3D78MKQGAkSnbIzpbYv4hZUrFX+PdNh7+YTlbZSFcpFe/d158HgpYvpOR1YvR2ioINCHsT0g3F4jbjKWJ67QCWaFYro3vNsQ5nanDmKB9ZzQYbDHOvo72aL8V8fXA1hTJ4K8qzzKi3jb1PL3hoyUFucvKnYXk5aJFIQPPRjnokzyLyJt8ZieBXOldPo0BO1uTTQV2kZ/p/2c6dZva7MdJaMIZ1VHEq7of4O7GKt5TXu2XHJ05NymeG+YB0Dw03YHa2PiDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 25/51] build: rework test/livepatch/Makefile
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-26-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd4ffeef-b577-f360-060d-6df09d6f0219@suse.com>
Date: Mon, 11 Oct 2021 15:28:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-26-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0074.eurprd06.prod.outlook.com
 (2603:10a6:206::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc5d8cc-0d0e-4d49-3798-08d98cbb02d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6862CB09A80B97E5F5F54F1DB3B59@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/geUbh7MtuDWexjovJc7OPdNBMrJzkGsN8Vur6YapEUh6MSIOihKRYqP/xR9Af33KYu7G5jkiTg2JGGh2T+TyP3crxHF8Z+f+rhwX+VB3oBQjjjaDbTsQLRnKGPN6PHdmT8HPoDsPZzfR6T43vlauHysZpdvDmmuvXSwKJN7NxbebP2tYm9u5V4LZjFrfh8c8d3mPDyaAI3P5xWaKF1KWiH0rZQhdSoSjbTjo0nL4Fqt+qmg9GBnff7+towAH5Rd3y912/DPxua9+yQltEFPO+PdIxxbgxEq2ds4nHHToetaUr0H1H7CFsfGI32cZZsh6TAPPOYIHtzE0A4iAgAIbJeoszfhY6zP+jga9UsFSNK2WvJuxAKzVsXqd+AE7hel2B/DnH1p8iHSVnniPNzPlAPHC6CBrqI+QUNBzzT2rnQEFf7OcSgnAkEoxVw8ZWjAKlV61icYA4yo+2foECFYS5TcP6CAnR/jYuPWYJ2+XwAa2gfAjKRl3Ji2HqbjqDdWlh8jKlVAhhCaIx2KgVjCnpYelc/Uu6S9sBGhFpLQnJ/DEc0/7AZajPOvIemDUlT5sLjRtprz/fyYJnHqu25dKDwFe+YsVMNQkXzM8XL4lSabHKF+tDTaKc9zLKBOR5BOvOkfURNbCv4ts8FEG/icfuR/wSK6anc0d/4zciEyldJj+v+Zi/vQoUFiSziMSzW9bzjESKGFhb2ZylnBro3NUTXwDUL+WMDVYW4CYofEy1XNaJXpapnU8FyFnxcY4rgn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(5660300002)(7416002)(54906003)(26005)(186003)(31686004)(53546011)(6486002)(4326008)(86362001)(8676002)(316002)(508600001)(16576012)(83380400001)(2616005)(31696002)(8936002)(956004)(66946007)(6916009)(66476007)(66556008)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTR6RHBZbkQ2Qld4ZTlOeE1vQmZTU04yc3RtTWNEbFlQaS8vaGUyZWl1Mmcz?=
 =?utf-8?B?bXpGRTg3YWpJbytjZytOcER0T0JYbG1RZVBmSXhGc2R4MXNDanBtUjEycE5F?=
 =?utf-8?B?NU50SGhZUUFUYjBYbVlIYmZGWUU1RXZNV3N6RzE1aTBLM0RjUGJxQXRFSVVS?=
 =?utf-8?B?a1FBZFVVREswK1FKUWRyUitLVzRucklKbTYxcHlZR2QzVENDWDMyYm5BOVVy?=
 =?utf-8?B?dk90dUp2SUVNTUN5ekZPaXlEWUkrTFh5M242RDk0am9vRDV1aVV2dk9Qa2NR?=
 =?utf-8?B?K05uaEpiL05tSjNnTVI5c3RBTjQrWmV4Mk1oeVQvMmFNRWQweFpwcVBWYVFQ?=
 =?utf-8?B?dkk4Z0ovVThBdVZ0ckR0cXNiZHNOekJEZFZWaGx4QytQSnlvYTRVSm5xNEVG?=
 =?utf-8?B?RmRTTWZ6a2JISmI1a3hQRm1IakpSSHRGT0xNZkRlT1hhYm9TaHkrWlRWZHQz?=
 =?utf-8?B?U3NjdTVkVmw0dE9STzMwaHpUR2JsUGVwSmJDRmJxSk1lemJNb2NmbDhwZ0VJ?=
 =?utf-8?B?VHc3cWRFc25qSUZWR0d5VXR0SXZSS0lBZ2VLb0YxR2gwQUc3eUR3bnF5VFZZ?=
 =?utf-8?B?K0E3dTJZMEtzcFlZVE1NUmFBK1F1VmpBeDR4ZUFXa2wxOEFhZHVsRTJHS1B3?=
 =?utf-8?B?UXRVY2J6c3pOeG1tTnF2cmZDMHRDL0JaSDFMeG9iWktNRWdhTEIvNmg3eVMw?=
 =?utf-8?B?RGVubDVaL2gwZTNNMzNhMFRhbW9uRlVQYlNQb0tJa2ZKbkVLcFFnOENyM1dl?=
 =?utf-8?B?R2tsRUx4VHVnRkNsMHlQOUdxR1AvdHdCcXZhT2RLcUdTWnFyd1NleFBPanFy?=
 =?utf-8?B?eVRlTnM1QUdGWmpyOG9McVZDRFd4ZnBkWmtMQVowQ0VtVXV4MmxCaTN2TzJr?=
 =?utf-8?B?bjBRQVNNWlhBRm13SDhlY0JzVVE2SnVaRHhvSHBKQ2RpRnZ0SmtsU1JDb1Bi?=
 =?utf-8?B?eEVhOW9kMkk5UytVMlhRVUpzVEdjWGNrM0p2cWFYaE1OWmhRbFB6UHgrRml1?=
 =?utf-8?B?ck1XWGZoRFNwMjFScEJ4VWsrSno2L1hnK1oxK3Q1cFhISjc3SWY3ZE5PUGZI?=
 =?utf-8?B?QkM3eEw2dkk5UW5lQW9XN3ozRGY5QlQ2LzRnQURJVDhuSG84NnBhdkxId2JU?=
 =?utf-8?B?OTJiQ05tN0VPenI1WHkybmxzNlh2TnB6OUtSK0FDL1MwOTFQU1pmMEVCc1dI?=
 =?utf-8?B?ODMza3hpSWVoQUhKTlFObFI1KzRwcHVvbkh1L0lyZy81RDZ5RGc0a0drUWh6?=
 =?utf-8?B?VEp4dHB4REN4Wm5GcVl0VTR0eXNscGxHUmhiZXExSnJ2L2xJWThYRGxacVRo?=
 =?utf-8?B?NUUrNnFya0cxbE5xR1hLMXB2eWlZbXJHckRPT2xkVEV4VDhSMVRKMlNzemFW?=
 =?utf-8?B?NjBpdTV2U01acVorK21VbnUwbHUzay9jZ3ViSTZDQXBETGRiVUF2MHJ6MnE0?=
 =?utf-8?B?QWF3Q2NCYW85bVRGOHdHSmdzNHFYbjY0enM1dXhYeUpBZ3Y5VzQ0UFltd0Z1?=
 =?utf-8?B?SUJzZjlERkp6ZDgxejVINHNpSDdpa2tVUVVhbHQzMTBQMk9URzR4dHZ6ckI3?=
 =?utf-8?B?UmVDZDNUemZpS1Y4R2hudWs5Z0FuM3ZvWldSVmxHUDhsQ1psK0wrWEpVRm9i?=
 =?utf-8?B?SG4rRjdUUHA3OUlTL1YybjdNdGJQNTN4dEFmaThYdTRIckZGV3MxVWlETWcz?=
 =?utf-8?B?cGZkemdrVnVQV3Q1a1BzQUZIYWM4NGpndkh3K2hNTWk2Wk4xb09XbHVtZlgv?=
 =?utf-8?Q?UyzlI6vsLr7LkfJ44cqSGTnFPl3aY6oPF/9B8l5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc5d8cc-0d0e-4d49-3798-08d98cbb02d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:28:28.5478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOWvp22s+PIIKznr7LOBYQSx0/X+Za/AeV3Opcx3wSE7Y0hynRQ+2S+w4Ksn3ns6tmks6Zm397uKVf5oUjvgDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

On 24.08.2021 12:50, Anthony PERARD wrote:
> This rework the livepatch/Makefile to make it less repetitive and make
> use of the facilities. All the targets to be built are now listed in
> $(extra-y) which will allow Rules.mk to build them without the need of
> a local target in a future patch.
> 
> There are some changes/fixes in this patch:
> - when "xen-syms" is used for a target, it is added to the dependency
>   list of the target, which allow to rebuild the target when xen-syms
>   changes. But if "xen-syms" is missing, make simply fails.
> - modinfo.o wasn't removing it's $@.bin file like the other targets,
>   this is now done.
> - The command to build *.livepatch targets as been fixed to use
>   $(XEN_LDFLAGS) rather than just $(LDFLAGS) which is a fallout from
>   2740d96efdd3 ("xen/build: have the root Makefile generates the
>   CFLAGS")
> 
> make will findout the dependencies of the *.livepatch files and thus
> what to built by "looking" at the objects listed in the *-objs
> variables. The actual dependencies is generated by the new
> "multi_depend" macro.
> 
> "$(targets)" needs to be updated with the objects listed in the
> different *-objs variables to allow make to load the .*.cmd dependency
> files.
> 
> This patch copies the macro "multi_depend" from Linux 5.12.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Just two and a half remarks; I'd really like the livepatch maintainers
to properly review this change.

> --- a/xen/scripts/Kbuild.include
> +++ b/xen/scripts/Kbuild.include
> @@ -151,3 +151,12 @@ why =                                                                        \
>  
>  echo-why = $(call escsq, $(strip $(why)))

Not the least seeing this in context, ...

>  endif
> +
> +# Useful for describing the dependency of composite objects
> +# Usage:
> +#   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
> +define multi_depend

... I would wish we wouldn't introduce further names with underscores
in them when dashes are valid to be used.

> +$(foreach m, $(notdir $1), \
> +	$(eval $(obj)/$m: \
> +	$(addprefix $(obj)/, $(foreach s, $3, $($(m:%$(strip $2)=%$(s)))))))

I'd like to suggest to be consistent here: Either $(s) and then also
$(m) in both places, or $m and then also $s.

> --- a/xen/test/livepatch/Makefile
> +++ b/xen/test/livepatch/Makefile
>[...]
> +$(obj)/%.livepatch: FORCE
> +	$(call if_changed,livepatch)
> +
> +$(call multi_depend, $(filter %.livepatch,$(extra-y)), .livepatch, -objs)
> +targets += $(sort $(foreach m,$(basename $(notdir $(filter %.livepatch,$(extra-y)))), \
> +    $($(m)-objs)))

I think it would help readability if the 2nd line was properly indented to
reflect the pending open parentheses:

targets += $(sort $(foreach m,$(basename $(notdir $(filter %.livepatch,$(extra-y)))), \
                    $($(m)-objs)))

or (less desirable imo)

targets += $(sort \
             $(foreach m,$(basename $(notdir $(filter %.livepatch,$(extra-y)))), \
               $($(m)-objs)))

Jan



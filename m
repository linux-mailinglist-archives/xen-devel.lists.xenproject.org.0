Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3D570F876
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539068.839579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pIv-0008ME-Fw; Wed, 24 May 2023 14:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539068.839579; Wed, 24 May 2023 14:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pIv-0008JA-Cp; Wed, 24 May 2023 14:17:29 +0000
Received: by outflank-mailman (input) for mailman id 539068;
 Wed, 24 May 2023 14:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1pIt-0008J4-FW
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:17:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b2df34-fa3d-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 16:17:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7034.eurprd04.prod.outlook.com (2603:10a6:10:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:16:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 14:16:56 +0000
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
X-Inumbo-ID: b4b2df34-fa3d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIBW/3Pd3m7YchDFMMFscO9NtW88uFQ7bAY04kh9oMW4bI0C7ow+HzJ1DPgpr3uXx3rC9MHVh1/0gOfw5/+1pLGvz0lTmEBy+S76llB/76HGSyKhVe4xJHadcUiCvca7140T/uwpPxL7Z+iP/jHUQk2wwpYzUuflZI1iDAJSntOnFqIAdmspKQ6daIKXpUlnGCp7zDMKuW5JUXoJzmD/xVBhWA3M7nidNj2/YyUUIYov6+0qEEDLTxMhuivH/xHBAlL4mEjBW/4OjyiQ+wCPlNBPlBGFoY32lH2nOSrBBTSmxqoaLlegsB7hVqAl941h7J+kdocCokBdGpNuAnM75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXM7rh3xdQyaxZ56r5dLp8WFv33ZZYdit8eD2pxupCs=;
 b=KVVLYbVsSEqEWyxOTjm+kZ577sYMnqua2qSN8KDJaiKhyYAVXWBKFX3+AdSW7RNj6R8lkpwvLoanw+VYNNfqg5pfOiOi+7M+XeKXh/1STEdSDPt7B57clKDuOfTP64TKF/tlSXDpx3GpML07ZPIWJxQT6Eo+4CY3HGaotC5Fw8FEhbgnKD4aGUvqgM2gMYpnCazcapQfzGtSRm5PiO+Wd8NTKxk+TP/wKV1FQvOn6usbXPKiQshoqDEAmBNUBmkhOB8L8lJ+8Cuu1I7qc64ltnWbnKHEVow9gb0enAvELUnitkAQ/qxlxRwo2Nuwlbr45swriudc1Oi6muNCV8o0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXM7rh3xdQyaxZ56r5dLp8WFv33ZZYdit8eD2pxupCs=;
 b=uUNl5rEd801v+7qAwJ16PXqXHhBq8md39YuXftdGZet9oW/4wT3yJgNzGimqvkSr21eDrXcsd9FRv/KNiows/1HxLt3uo8v82bpgT6PU88+miruDNDcmwn0nM/wmDfqIEQeZfhjhxnqC6CQFxNM1lqdxo9zWvyMWo50yzs21olfWfhJqkE9QEXubqD2H3qE95nVP+ZAfUlxSovoI2csdhTlDZXqq+qUVkmjTtx4TeIktuHP0DOI+ZwibPLJl1v3P0ttGzBgk6ZU/AO6jOm7HRh7CjgJkallrQB0z4EthMpyMJNrToPrrT9q/RLjLyB/ISEUydsZiRdMTRAZs7psjdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eaaae1c8-fdef-0746-b744-3a3e04933164@suse.com>
Date: Wed, 24 May 2023 16:16:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 03/15] build, x86: clean build log for boot/ targets
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-4-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb4d441-590f-4710-9669-08db5c618786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BT7bDWdWJY2K8NneMVl3PkQlwPs0h0TeunMnNJ4EGpXbdhRKa/Oxr3M8mhW6JgXywpVvD5AJu0hZUuuYYgmORTOHBro29+l+7yWVviyn02bkeCHrBPM+yrbR8T5+C3Vy/+yZPO5zv+3RNuOTfZIlO9pqP8H7aSHtOFfK856qH//mn6iSrU/yl3PWFFBvi+I6oUrV1bCE1QVRcr/35Lzq+nfkIpC5Q6nka1RjMR4CWEHEJg9nM2rv9H/27+1CQl0WKOxyMqgBSoWjwfzxLY3+yzPG3aKt1tLm0fZdSm7lpiuph525GCFryQe7BnOZ5MSTkrN1hautiYsYw3ejUkJ4wRa681Yx1sCbY8tt2leqjE+stDTdZ0aEtdXnQyOyxIQotwYjroxqPCtHQOt5lzVQAK+vjaESvXD4r1n5st+LAVSDLINzEJOqMxys6gMc+HcHr7Wi4mATtwrDqP5yJ0iiVvBF/lcW01zOyOT5UCSXxQrLnw5Fvvj4uv+GOGQ7hg+KifXS/+hLwPJdwtd2fFZv8LAJPGohNOgFiOV9pKQfJg6kz+aXkl6irJ7g1hY2NmkReMdfLKPS6tVVQTY0s4I24mocjhZOzSikNy6od9/sbLNa+q9ReQCSvSQqzeKECOKiWoyYXEURe/LIAZCWcQWqnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(31686004)(54906003)(2906002)(5660300002)(8936002)(8676002)(41300700001)(66556008)(66946007)(66476007)(4326008)(478600001)(6916009)(36756003)(316002)(6486002)(26005)(6506007)(6512007)(38100700002)(2616005)(86362001)(31696002)(53546011)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDE5VnJUNHQ0Z2MzOFNjRG1hYit5ckFzN3NaeXNVczNpbHRyRWVCN1F1b0xC?=
 =?utf-8?B?bTlkTFBGMU1sY0VBbHdmVE82a3prbnVuOEtFVW1JR0lmRkNjN2pRM3J2b205?=
 =?utf-8?B?RXhEMDZ3eSt5d0Q5NUJUbkwyb0ZQVlFzL1RBMlliZzdqcDZtN1JrT21pV1dk?=
 =?utf-8?B?b2ZKSE53NFFOTFlnT1YyQWMwWGFJK2NkK3phemxCVW0rSjFLaDFxNGZFV2p5?=
 =?utf-8?B?cmR2d1hhSzM1Y3FaNHo0N0Y1UWs3ZmZ4d3JFa0xVUGswcHBBdzhURkIzNXdF?=
 =?utf-8?B?cGYvQkxiM3Ivbi9yTG9lVjVzdmQzamZtdUR3Tk1FTWRrUTNyQnZudVpPczRV?=
 =?utf-8?B?cVVxc1l1ODV6YndwVjBEYytoWlVrZkNlRlF5clNidng1OTNNN09HbGRZbGNW?=
 =?utf-8?B?eGxOOERjamJuOWFhVERieEh5Tk1yeGd5M0pDV05qanEzNDZuL1pBTVMyUmdT?=
 =?utf-8?B?ME9hY09nbm4rUFdkRFJPa2dKWEZNU1ZhRlpYL2NkbHNuZ2ZJdnRMQktEaGNl?=
 =?utf-8?B?dFhUTGlsTGgxaEhQNDV0V1RCNStEY3U0R2laMHppMGlObUIzOHoxR01OaXFw?=
 =?utf-8?B?SmdxWCtsVGo0MHY1NzJEVyt3S2d1QnZrbDVsWkl5ejNBWkZnNXJJMU13OTBB?=
 =?utf-8?B?a2g1TjhRTjF0MFJ5UXhLc2Ezb1VzRkhSejdMQ0tiV01oWWwwTnFQVWtsUU95?=
 =?utf-8?B?aVJka1pHR3ZsS2swS3NrNjB5cjIveDJYc1p5em5jdHoxbENzMnVBbFo1REhS?=
 =?utf-8?B?alB2ZmZCRC9TWmViRDdWYUJZODdvTnpQSVpDbzRua21rcGt1dzNVS281TVlJ?=
 =?utf-8?B?djBVeHJ2UkZ0eXNndDkvaVpIZ0RGd1cwVnEzaWxmWVZhaG1iKzZoYkIxczNt?=
 =?utf-8?B?eU5FeVFudlM1ZGx0UG9CWnJXbzlCdUFkMlY0MWsxQU03ZVNySGJORDloT0F2?=
 =?utf-8?B?bjFwaVBXKzFuZ2xnZlFtUXkvUXpmUEhxYWlHSlphYTJWdmdEeTN0blZtTmRv?=
 =?utf-8?B?ZnNsZ05MRGNIZXZwbzZwVDRYeHJaL3ZXdXp5U0g4TS9tME93WGhJTVFtQ1pF?=
 =?utf-8?B?OEpnaE5CaXBIUVBrcEllK0t2Y1lldmUyWS9mandST3B3U1czdVRTbzUvT2lF?=
 =?utf-8?B?d240eWpZT3l6bVlkMHovWFgwajAzeHhmaGdxb0lDcXgxdHAxcW14Tk01dTlx?=
 =?utf-8?B?bW4rTGtkKzVIenVTRUZEajNNNjFoSCtDUzg0MzBNV0JwcDB0eFNhdG1hQkN0?=
 =?utf-8?B?N0M1WTQyYzZtN1JvNmMxZi9pN1hGWFFwVXhqSmNrU1ljaFFtN25GTFVoZEM1?=
 =?utf-8?B?b2NaMXkySmJQT2w3RW9vNEgzMjliVUJiWWpzdytSVjlTNm95d3ZGb0tUU2ZD?=
 =?utf-8?B?Mno4WDVZaVI0YytBS0VlZEtZbFNQdFBRdk1pVFF5OUg5WTlTTVJ1cmEvbDB2?=
 =?utf-8?B?RFhVdkFYcXNic0Zsanc2MHhmOTRlVlBpMk1yaVNQTDFWeHdXZWw2V2pqVytQ?=
 =?utf-8?B?WFRCdkR1c2tCTXBFY2pEMG1KWFRlMVpxSUdzTlE0ZENrK3Z3ZlZCdW1TYkJE?=
 =?utf-8?B?d2djQ0Vlck55UGFHaThyam0vZi9ZbHFvaTRuNVI2dVBJYmN3bDR2RG55YW5z?=
 =?utf-8?B?WWo2djNSbGZDckNJK0R4d3FXNm11cW9TNjlZYTNRQ1FBUnIwOUcyb1dnNTNu?=
 =?utf-8?B?Nk45b2YvNjRxYTU0d2RRQk9sbDllUFZsaGZNZUswMi90ZzJrTmZYQmZXTTN5?=
 =?utf-8?B?VG1DbXIrQ2NpWmIzQldnK2kxVHIvZjZDZ3FlSHU5WDRHZy9yKzJZeWNtNlpo?=
 =?utf-8?B?dlcrSjhFckVHT1hqV0R4czVEZU1BMWVBVUc4Z3RJZkRFUzcvN0J0R0FKWDFh?=
 =?utf-8?B?UHJPdHFmV25sbWJrSU1iR21xQVhPQWZuUld6UVg4cXFYQWhMKzZUMDdsUHhl?=
 =?utf-8?B?dnR6MWwwTlQzV0wyVWNGcHlPK1h6MkNkakRFMVFRR3RIMDZkTTBuVTlUeXN1?=
 =?utf-8?B?S2s4dzBxZUdXVDBaMmRnYnJ6OXVHY01wSHdZbDB2TXAzY0t5MFpMc3h1VGti?=
 =?utf-8?B?eXJHQmhPeUV1TkFsWExRazhsbGs1VXVDcXBaaHErWGc0MHVpZHlIZitzcmIr?=
 =?utf-8?Q?jy9P2Fdwlcn67ec0Fid/7A8Ed?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb4d441-590f-4710-9669-08db5c618786
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:16:56.0094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYXpD10uaUKtyySM4wBZ7epw1geDKT4FWUqjrn364U5hMeCAOycUbfRbGWOYcDzdHFBlwFI/uirN410FqKutcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7034

On 23.05.2023 18:37, Anthony PERARD wrote:
> We are adding %.lnk to .PRECIOUS or make treat them as intermediate
> targets and remove them.

What's wrong with them getting removed? Note also that's no different from
today, so it's an orthogonal change in any event (unless I'm overlooking
something). Plus if such behavior was intended, shouldn't $(targets) be
made a prereq of .PRECIOUS in generic makefile logic?

> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  xen/arch/x86/boot/Makefile | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 03d8ce3a9e..2693b938bd 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -5,6 +5,8 @@ head-bin-objs := cmdline.o reloc.o
>  nocov-y   += $(head-bin-objs)
>  noubsan-y += $(head-bin-objs)
>  targets   += $(head-bin-objs)
> +targets   += $(head-bin-objs:.o=.bin)
> +targets   += $(head-bin-objs:.o=.lnk)

Leaving aside the question of whether .lnk really should be part
of $(targets), don't these two lines also ...

> @@ -26,10 +28,16 @@ $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
>  
> -%.bin: %.lnk
> -	$(OBJCOPY) -j .text -O binary $< $@
> +%.bin: OBJCOPYFLAGS := -j .text -O binary
> +%.bin: %.lnk FORCE
> +	$(call if_changed,objcopy)
>  
> -%.lnk: %.o $(src)/build32.lds
> -	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
> +quiet_cmd_ld_lnk_o = LD      $@
> +cmd_ld_lnk_o = $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
> +
> +%.lnk: %.o $(src)/build32.lds FORCE
> +	$(call if_changed,ld_lnk_o)
>  
>  clean-files := *.lnk *.bin

... eliminate the need for this?

Jan

> +
> +.PRECIOUS: %.lnk



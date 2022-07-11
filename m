Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C837556D4D6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 08:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364848.594793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAn7L-00012L-QN; Mon, 11 Jul 2022 06:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364848.594793; Mon, 11 Jul 2022 06:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAn7L-0000zL-Mt; Mon, 11 Jul 2022 06:42:03 +0000
Received: by outflank-mailman (input) for mailman id 364848;
 Mon, 11 Jul 2022 06:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAn7K-0000zF-5c
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 06:42:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 912a28c2-00e4-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 08:42:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8498.eurprd04.prod.outlook.com (2603:10a6:20b:341::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 06:41:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 06:41:59 +0000
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
X-Inumbo-ID: 912a28c2-00e4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bU5ltNTj5VOpZXeWyLHQV4uU++ZcvA1f2Skou6DvoQjM12Ltcp0EPPFCvquNZtDYiQtpdPcjKuLz6P2v0HhEZBfgB4/DfIiXPI8Gmp2b3iSD/9WP8taTMb6ppLNH4+WrJZsV6vkxBhENsBF6u9APbtFMjp2C8cvEVhvYY08EnUncbstSsPlfMAGJccSyyvbkdEVzoRcmL3u7ESbcAGgsbEYOeA9kB6ODSRTkHkCPXjdx0SVJAQRtS0+Xe8Fpqz9KiolNtlkEnXijyv7o6Rujerm7vCk2V26GvmWqbdBVhoCYdGyVdw+DHRlkg2rS2r4MQpXsHZjCK5VjW8sYqwqnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVQPCx6foil+0u0VNm/ZGf4G2/wA7pcHMb2QEaFUE1I=;
 b=f0To4FmPZmP7pAfSd+ayFUbLzkpirTWFDld82HmRusT12u+ID27SXzwTkzFX3gWqHZqsqa2j9TLsOrKpQMP8sx02Ia0XIG4Q2volUeJUONRzmVgl3GSI0vVGo9ublnoPFWl56iJJvZt7CfzQD6ihjko+4UqBubSdVcw9SZozOSQRpQNBM8gexrjmEN6TeUHAqwJWThTBio0019ZEwyBmPHZuiWOeaSmCZVq4AmETX71+cVct9GjjgC+PqJ5zZJz4fSNljay8z287mXvVUyfiVDF12/3jGRbicuKnZ1CDYt3KgjlpwYUj9yD7Najwrqlg/X2oiPhAw3YEJ4bEtjpsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVQPCx6foil+0u0VNm/ZGf4G2/wA7pcHMb2QEaFUE1I=;
 b=OJUUWT/2cfB2wu0H0bQbbRhFAetm/MbFCvY2TkDUT1KwOMofqht6Z4o1IPn6dFUG1XV0KAKYE3O4ISIZv4qMpofsI5iaRbSitH6uOKdidE3fy1N/k3US4LnPZxHthDgytYNbCFuwecIgXwawh3LZ8WIM/6r5B/dPeqIhkOrdrBZlWkBP7UMqQWnw+1X5GpWOo6Hsc4UZZeaVqMqvJEfNuzSJagveCGFDM5fy7RSD4ceux4x1W8NZ2Jy5jaOjOcgMRLkYlFrNqy0EaHNrAcxgsEgpWuYCS6vSRok3jA9SboeekumDzPqxxtYJ2ASvfVEVwQEkwuvqIq7K3F+Dj5Xp9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb459be1-1f02-ba6c-6ef3-ebfd787fc773@suse.com>
Date: Mon, 11 Jul 2022 08:41:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <20220708213403.2390-1-demi@invisiblethingslab.com>
Cc: Xen development discussion <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708213403.2390-1-demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cddf1a7b-be5c-4af4-a612-08da6308745c
X-MS-TrafficTypeDiagnostic: AS8PR04MB8498:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vPm6ahyHk9tcZ5Zo83hlWz21vg/H1vOdxKJ/Us5k2JFusXO82Oobc8st4U0+7rtRQT4jEfdJTWAxig/oZK9T549qzrBii/oAu5oPLpWynZ3QnnApQfZg9LB0rHD7zf8odtSvKHWlhGLQAkv9a+jfsXqGiqMnwwIDL+TG4NGIY/TstmUx8oDQFZBnSej1JJUPukrrD0cNIQzyfPsbflNE9anjOoGy1Cw4B9HnOiv+F9A5Xc3FElwXUH38bCafM50n3P3U57ynKiH5HrA8Nd/NkAfYefLOBHyBly5zq7J0BOAby/o4bgdSp2m5lxmI471LhC5bATPSTqd4GtfjYm2NjADq7soUViAlikqxD7fPIijcrB6jfJYigRkXQdaiLEwQuSMcxOsm2neAkgM+TJGGrKRhYWTAEINPob6iOKsBJ6GApn9l54qjEz04N6mnEvvFvs4HedFA5mnwtIcCjYKWVCjfoCuMpqIHmFj7BYaeeizudLuclatpks1JG7HWokaB458bNhyM1S8D1C81py89HrVW6a6qwVU2szfdbrVpsptn2Lw/RTXgmYZqZ1KzDsJ4q54080b7fMZjXprWoI0Yu1qgeungpx5b+AnD3p+GXmwr3W2EFL1DA/7L7NA6OC3v/jEUAGrNEgMMvXLx4Bcu0ooC2BGzadDwu/U28JaznMvxI/zLfLwOo5AXQK2unFZoi/Y0SG5HwValFmdkXqSlOV1TjRrzgUfhNxFHLCeRYnqBtoPRCbFkMiN6TMRodoHtHwC6Qw3ChLTpqK6RnFYGmHnTfJDVknHXHraOyNxX3p/rG5WG1iCsWoGilM5fAhpJKdNaLHbCFcXvf3xfh7zcUm2X+bSa/kPbUYM1vHPU8OVAYT5VD7CoY1Nt5Auew8Ty
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(396003)(39850400004)(346002)(6506007)(31696002)(38100700002)(2906002)(41300700001)(83380400001)(6512007)(86362001)(6916009)(8676002)(4326008)(36756003)(66556008)(31686004)(66946007)(66476007)(316002)(5660300002)(8936002)(478600001)(186003)(53546011)(2616005)(26005)(966005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnRGd053N3djSGJvTnFocjExcFE0eXp4Z2ZUbVBNbEhDWnExMEJ1ekQ4bUFn?=
 =?utf-8?B?V1R2MzdUakNsT1F3L1NrL25tdXlkaVNFT1BXMEFvUVRxb1VMdlFreEkyc1VL?=
 =?utf-8?B?bFJYaGZ1bXBqZmo5WGZzMVYzUnFkL3E2NElhWWk2VFFRUEJnVG9oWGVBYm9C?=
 =?utf-8?B?ejNEN2IvUTMvbHp0elBaTmtQbStUaXFFdVArZzRVUm1BeFFVbzdxWEdxTFFN?=
 =?utf-8?B?MXIvVE5idEthTVhIdEc0d05ubHZpVDUzS2x5TitvUnAzc2FCb0tMNDc5bVF3?=
 =?utf-8?B?M3JnaUpqVzdTN3YxOXVNbzBvWVJFZEN0ZExYa3BqV3oyR2Y4SWxJTkIvb24y?=
 =?utf-8?B?dDkxRE5IeHVwVEYxSkZEWkx5VWpDV0FrRVFraURra09RVGNYRE9PV1k2N1hz?=
 =?utf-8?B?NFdrMTN5M3VXK2VBQWhSNWlwdWdqL2todTdpanR6MzMrWVY0NncyaWpoYVo5?=
 =?utf-8?B?M0NJWjluWnpuMnNMa1FOS1NGcXQ1UmJDYzVWM2FQR2Y5UzN5Nkw4aDhoR2k3?=
 =?utf-8?B?MkU4dEV2OHJSUlp6SU5aZ1NlcWJBeHpFWnNra1hGN0VzRUJhZU5XbkhyRkNV?=
 =?utf-8?B?Z25PaEtoV2V6QnlseXRSa1dsV2hXRmVjQ3RveUNiRkNmdUJiM3NVOWpIUUI3?=
 =?utf-8?B?eWV5TVZDV0F1STFTandFeUN1N29KRXBFdEJiVmlYV0RaUG5yVHorN3pVcHl1?=
 =?utf-8?B?QVZvVzlad2VwbGE2Mk13RlArRDlXRy90eVFiMEJhSTVaVEdUT2t2QUlWNjRn?=
 =?utf-8?B?Rk5RQkhIMTZuYnRlYkJmMFNaelFOVHhkT0FsWCsyNld2TFVzdGY1WWFJVXNq?=
 =?utf-8?B?cTBNRlU1MWIxQmhNa0lCTVUrU29nQ0lITEhsbkRjNmdsNWpmeHFUU0ZCVFVG?=
 =?utf-8?B?b0FlaXhDajFxb3BZc2xmVHZVTGZPalFnTFJUaDFIR0FEaWlnZGhaOVFZYzI4?=
 =?utf-8?B?elBSc0x5ODVtUm4vbklzMlYwemhYVXl1dlVwd04xSlNycFNMeWRjK2VFdXRp?=
 =?utf-8?B?RVVNWW5yaWJ2MWZNaVNvc2x0aXJkeE1ZTEc5TXhQdURhcGprSy9JRnowcWtq?=
 =?utf-8?B?K2N5K3YvWWk3QzVxb0N4ZE4wbmQzV01IN2N1aFlrYVlpMENwS3VieThXQlVu?=
 =?utf-8?B?K2VKblgyVEY1NHdHVTI2Z0owV3llVmZrSmJXY2lmRHJIbkkrUDB1L3pxQzFq?=
 =?utf-8?B?a3ZnZXRiSkhHQm9WL2dXLzB4YXZiNVE2WGkyWVFid0ZkWitoNmlHYjhWWnVO?=
 =?utf-8?B?S0tJTURERXNDYVVJS2NIM0VsVUJXbUZ1SzM3dU95Z3NkUHZ2NjNXL3RkRjBv?=
 =?utf-8?B?QmcyM1ZiYjFFa29ueUxrZTFCMGtRS2hXYlJIWVpiZm80UlZvdC8rVEJpVi9p?=
 =?utf-8?B?Z3c2a0R5MW56VHJtWEY5dFNNYTA0UGJNR1p0T2lXdE9JU0JUMGVkR0FuVTZt?=
 =?utf-8?B?M2V1YXVhdU5aWkg3YUpQUW91SitmektMNjNVa21uTkgzUDUraHhFenJmVFZB?=
 =?utf-8?B?YnRuNm1ZeUxrcmtmNkZ0My9IK1huc1drSnVGLzdqdnhQQW5OY0daM2xzamFz?=
 =?utf-8?B?M0xabW1obTdWekVMZXpCWlc5MlB1ZHMyMm9BVENuUUFWTjFNcERjWm9ZQVJD?=
 =?utf-8?B?bjJGd2EyczJNOExlR1F4V0xVOW8yUFhQK1ZNWlpraEwwd2x2MlpMY294L3Iw?=
 =?utf-8?B?TFJQODdxZVFIb2h4ZWZjWjBkd3pRakpHUnMwb2tYQXpkcjBJVkxGN1BReFhk?=
 =?utf-8?B?VWh4ZmJldTNxNGY1LzJENytSbTY1KzBSOFA3MjVSVkdCcWV2QVFnTzdickx3?=
 =?utf-8?B?LzdXZHpSMGNLWWRmSWRJUG1CMVdTY3hCbTRqRUx1a0dkdmRxcFJIbmpZYmxy?=
 =?utf-8?B?RzMreFo5K25XNmxWR3ozWklPQlUzR25hcE1FYklsZHlrQmNFRXlML3BjbVBO?=
 =?utf-8?B?OWVIeDd5cmc5TnZMOEpENjdOWW9lYXVlTUswMU11aWtFclRpNDZzNzJKQVdW?=
 =?utf-8?B?d0JPOE9jT1kxTFpMS2pvL2JrcC9aTlN2YW1TWXh6U0orc3kxOTcrem1MeFhk?=
 =?utf-8?B?NjJTK05jclUxbk56TS9Gb3p4Qmx4L25vYVU4Y0MwbEkzWURhUjlkQ3kwTVRw?=
 =?utf-8?Q?Dbq46xJ0lK6jXAZse3d0Vs7A4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cddf1a7b-be5c-4af4-a612-08da6308745c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 06:41:59.0557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xELfHhEMhhRUnnPSgk+LT4RSapJnLr0sp8MJ7PHl+R42dPzHbtrRe6GncCh4GT/ev3cOs89SS6djy9nXbzhf5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8498

On 08.07.2022 23:34, Demi Marie Obenour wrote:
> The EFI System Resource Table (ESRT) is necessary for fwupd to identify
> firmware updates to install.  According to the UEFI specification §23.4,
> the ESRT shall be stored in memory of type EfiBootServicesData.  However,
> memory of type EfiBootServicesData is considered general-purpose memory
> by Xen, so the ESRT needs to be moved somewhere where Xen will not
> overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
> which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
> in memory of type EfiRuntimeServicesData.
> 
> Earlier versions of this patch reserved the memory in which the ESRT was
> located.  This created awkward alignment problems, and required either
> splitting the E820 table or wasting memory.  It also would have required
> a new platform op for dom0 to use to indicate if the ESRT is reserved.
> By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
> does not need to be modified, and dom0 can just check the type of the
> memory region containing the ESRT.  The copy is only done if the ESRT is
> not already in EfiRuntimeServicesData memory, avoiding memory leaks on
> repeated kexec.
> 
> See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
> for details.  Tested using qemu-system-x86_64 and xen.efi.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  xen/common/efi/boot.c | 134 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index a25e1d29f1..d2f66a430d 100644

As asked for before - please have a brief log of changes between
versions (at least for the delta from the previous version) somewhere
above from here.

The patch looks almost okay to me (see below), but I'd like to ask
for explicit confirmation that this time round you actually did
test the change at least on one architecture (presumably x86). Iirc
one of the Arm folks offered to test it on Arm64 - would have been
nice if you had included whoever it was in Cc.

> @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
>  #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
>                                   (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
>  
> +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
> +{
> +    EFI_STATUS status;
> +    UINTN info_size = 0, map_key, mdesc_size;
> +    void *memory_map = NULL;
> +    UINT32 ver;
> +    unsigned int i;
> +
> +    for ( ; ; ) {

I'm sorry, but I'm now going to be picky and _not_ offer correcting
this style violation for you anymore.

Jan


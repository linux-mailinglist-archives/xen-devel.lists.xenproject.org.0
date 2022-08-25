Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED15A09F8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 09:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393063.631777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7Al-0007jH-Uo; Thu, 25 Aug 2022 07:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393063.631777; Thu, 25 Aug 2022 07:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7Al-0007g0-Rd; Thu, 25 Aug 2022 07:21:03 +0000
Received: by outflank-mailman (input) for mailman id 393063;
 Thu, 25 Aug 2022 07:21:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR7Ak-0007fs-Rl
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 07:21:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 792aa7dc-2446-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 09:21:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3526.eurprd04.prod.outlook.com (2603:10a6:209:c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 07:21:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 07:21:00 +0000
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
X-Inumbo-ID: 792aa7dc-2446-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+Ty4xvXOFS5zFjP2VMcdJjO7uiISYnm3jkY0LZxUpBkKW/9yw2bPFTSSMEB/azNlWougGZmYAMOHqwbBBBOYQhkiyOy9Guc7a43/iMPu7/ZRCa+naVO9qSGVpkZ8g8ZUGIMK7krHEzT1YwMaYUrUtnThLOCvwaSy83WljftCN05W9HV/jJMw/SXpl0+bR0Ohm1GGg+tfq8BS/eJwv9LyqtisWeBOa9Ps3g4dDcunLL53eFu6SOmH/DglyZ8vlv0K53T03kkonO5n7KD811qj8oYXF3TdHZEEJ7r22HEJr87kH005I26S5jlRkj+h8XgaXAyBtFrlbkE5SpqlDqvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIOCOVhm6SwhzfTV6ARkOvTh0o+gBDrXK5PAE8jgfy8=;
 b=fbrgw2NmxNDxNo8BBwVta2d35ywIUDy3l2LD+Q9M7WK9aIrAlBfC38oJxcre/o+n0QNcE3Yiyul0WaZyU2ZJbQUBVxuzkMPe4gaaeXDYKJ4P442KLj81T9rqaL7i18TvR+geyrdmKYuL7IMj+X1Doi0WsQ/HF9+pQx55uIjyjKIJUFxP1i/Pc5wIbllRYgvm9jVQdo2aDVYdWobEnPQInDrdhABcuMtwdXhYN4+o6EmmlUFDOzKf/ISYRinzkE/zFPmqOPVYFtV4GXG85dh6KfXKNEfN2r05Dlw0EFvuHyRApQU1nU8TkUiFegz9VUtB7w/nIlTbTUjsHA95LCCdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIOCOVhm6SwhzfTV6ARkOvTh0o+gBDrXK5PAE8jgfy8=;
 b=BdnS9VOn2XyKHsPnrsfiNtnSuVoywyDpGYoIZDFRjZOEyjaMyzz7t6gBjBsLhGOYitz44E4PejYb2J3HrhRZxM0623t88Wye10fDMxyKbgRTq6WjUfx/fXyDjCj7ic6BdYA6uNADFdUx2TbLSDZx5IQsxhRfp+OXKR2J2NIFB2gOyUwl9STTs8xyhJ9iXcADCfP1rSH7FGVnpX1Y3rbZHOFvpq5jY7lg9FYbpfcIYWPcwu6WVakglTNjaQhPw38RL3CTXmMPS28wXoo0GoNtUDsPPemzNn0FD1HrqsvGH3V0lnjFIks5tZJDo77AojDc33e0tYYDRi95F3lI1hwjtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a69da9c-5b91-2c79-c5a5-7a5335295d86@suse.com>
Date: Thu, 25 Aug 2022 09:20:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] x86/hvmloader: Don't build as PIC/PIE
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
 <20220824105915.32127-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220824105915.32127-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 860ef8c9-e485-4bd5-4433-08da866a5c80
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3526:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/FSUwik2dxIG9bVsRmbLmFiy044YE9siz1cyTISBYgiJYZA8svqBEzG6fNTC+WokAlyKVI7AVCrAqHhVDiawSpovkEHJeqnJ/g3lieXMLSyk5hpyv4AUDTCLJ4iaPdQO77A1kHSUDwrFQvAoeiO9ChQFKpX/UR0efzKCqen2DWuiw6IBjs95y9Ldf6V5L9WupRNHiilyKpidStKZ7hzmVxC+PDWIEuTv/tCa65I/uf4Z12gBEg3iq9zgGY/o2TQIv/IqifwNGJj3318vygyyt3Dj5MI2sJFH+8fu34lc9sAS9bUvCWqCDQBA2j9t8Nm7fK1dS7sxvQX/Csnzeo4mXgLGEHl2DAwTIj5aaqD54WrT0q4KCZL7fvxiEzcTn1/R7nmYgA09KAtJvhV8QN+pcR27D5YH4zB2g5+5TnbvP1FOPCzJ89ywYm+kSkaVK+JcVpaa5uZbsSmGraY7ptpEEoZhtZ07YHq+E1gqJWJ+87uCz+3EjtCDQ7Gu0aCNoKyvm1oVSqqaOHwN7R7Na61XTTyuZlmtzSB66KJvwTPwNzTf6y0naU+JVFOkNX+odKRx3tOVGBPtykcdbo51RhhovO1vR650OQbiRug0CR45GhIl7VFc2ZEIStzO9ApidkTFmdaxWb7E+cKNTswt9+3a7g9/w0F2fFGkGwEHIkAdTkndtkz3/l6JzpFjxNcLOxGI9gBgYvM1f4PVZS6xt9WKsv+t3jj9fbXN/Tx60eYwO2kAGW6rz74rpnCeIG1FPHM4bWNEwBf31NiDtpRcSEytypB5iza0RwW5zi6BsQQI2rg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(366004)(376002)(346002)(41300700001)(6506007)(83380400001)(6486002)(186003)(2616005)(478600001)(53546011)(6512007)(26005)(5660300002)(2906002)(8936002)(316002)(6916009)(54906003)(4326008)(8676002)(66946007)(66476007)(66556008)(38100700002)(36756003)(31686004)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S09Db0Zuck1CZWJvTkxTNmpKZzdaTktMaGpBN01iaFhMNm05Mjh4TDZML2dq?=
 =?utf-8?B?TXRMRHBla0o4bDhyejRxR3NyRG51WURJUEFvUGQ0YVZWWTVVaEZwbTl0MGta?=
 =?utf-8?B?N3JFek0vSnJoL0c5S0FMcGVXQkU4alNvQWxmZlZIWVo5MVBxaUNrempVS1pR?=
 =?utf-8?B?UDdSSzRjd1g1NC9GNHFkL0x1a1BZalA1Q1B1T0N4U1FJTFo1bUNkc3pJSEg1?=
 =?utf-8?B?SDg0U2N3UEVuNTQ3eURXQ1JqYnlBWUhobEh4YW80bmRDY3JYU041NFpiNjZK?=
 =?utf-8?B?YW5Tc01pck5waHNxVnUxVjBkR0Z6aFVVc2pSNGN1SnMyb1dpQjlRbnhjVjJY?=
 =?utf-8?B?L0xGaXdlYWJ0bC9rNWVqVFZNalVaMmVCUzYvbEkvQkppRUdUc0VIdXBxRWRr?=
 =?utf-8?B?c0N4VkF1NlI4dlI0Z0NVKzBEL0plckovL1ZuQ3UzcVpYcGhZTkhvNFJ3eDdD?=
 =?utf-8?B?azhEWDUwWFRjTkd4UzRMSlhXOUI0enZqTVFZeHlqbk5hNkxOUjVCMHJzQXQ3?=
 =?utf-8?B?Y3lybHRUWis3ZldTNVJsTTREakdBWW1DNVBoNzFYN01teFRGcEx0L1FjN3lh?=
 =?utf-8?B?MFI5c1NDcndPbnZ6NUJ0NmpoMGFqTkdOb3NMNGxGUHl3b3dQM0tvZVJ5dTlh?=
 =?utf-8?B?cVFuVmhibnhEcS9ad28xRzVJOGtFcDR4Qjl0NjFPZzhWNHZpWlk4eTZhU1BG?=
 =?utf-8?B?VGZGajFwVXg0N2czVGJ5SExacVBzbUhjTmJ6azdjM3JkLy9MdjdMSk9pdytH?=
 =?utf-8?B?T3N0Z2N0NTVGMjJMbG52bno2cXZjZ202TmRSQlJqZ3luR0pSa3AvRFhRV3Uw?=
 =?utf-8?B?UmlHVmRXUVluUWUrY1NLY1pnOHNsUERJcjRsUHB6aWRnamJ4TW16c3NFL2g2?=
 =?utf-8?B?TkFGVGdXMnVKUVlhK3U3ZDNRMk9ReVRYV2hDRk5LN0ZyT0Y1b21ET2FzR082?=
 =?utf-8?B?TGdhdHNuNmhOeWNBVTJGMmhVK0k5WFpBSExzenc3TGN4Y04vdnNqQ2ZtSlRo?=
 =?utf-8?B?b0NWSEI1bHdoOGJ2YnJWU0xSUlByWmNsS3NUVVRNY1J4T2wzcWg2QWt1TlRI?=
 =?utf-8?B?ZUg5MFo3SENacWxTT0svY09GQUVMS2tVaFVyWjdabjZhbzNIUHJJUUJnSm9y?=
 =?utf-8?B?SlZPTjVKUWtUL2JKOThUWWFUMzlhS00va1R5YmRhMXBXNFBoQ3dHYkZ1THhP?=
 =?utf-8?B?NngwSlZKOURiS3FFTndtQ2l3RVBTZFI0Z3VOVDRkakxMZ0xQZ2NHOFlicm5l?=
 =?utf-8?B?M3g3c2xQRVZXWFQ3RjhmVzYyWTI3SGxRK3RFREVvclRuWHdBWXQxNDB6SVVX?=
 =?utf-8?B?RTBBekU5b3N5L1U2NkZCeHRVTEZtWWZsaG4vc1h1cnZxQ3dCQU41OGJxTDNU?=
 =?utf-8?B?OU1laTZpVmZITnJhRE9oS3NEOVRDaGtzQUQxdFBxWEhUYWFVd0IzT3BBVHp6?=
 =?utf-8?B?WThZVk0yNFZwYUtHMkRFQS9MY1dSaTJaNUp5YmdSYzJLQ3V6bWVKOGpHZHJH?=
 =?utf-8?B?cTU2NjJldmtCNlFDeDk4T2dTNVVMTUVteHkzV1g4emoxc3V1ZjZuZ0lWRVND?=
 =?utf-8?B?RTFKUkVrL2FkYnkvS3NQQU9XME5ObW1lbnpuOTlVY1d5UzM0TDZGcU9RMzJ0?=
 =?utf-8?B?aVNTTUc3VWFObllRblM4cWY1c0E0VFZseUtlOEd6cExPYlZUZTBBRHVmazJi?=
 =?utf-8?B?ZUhrRVNPaG0wNTR3cUZHbWdBcGRMMUZtS0NQRE13VWlrTWFZUkxMb2JSQ0pp?=
 =?utf-8?B?c3JZUUFuRzg0VUNXVE9VL3FMWVd6Y1MzU0wvQytPNEY0VG5pVno0WXFUWFZX?=
 =?utf-8?B?djI1bVRrRHRSQmdOQzQwQ284VWVZSTI4TGw1N3RDSkloeUN3a09TakJIY0lG?=
 =?utf-8?B?dXpFQlRBbFNQN0FERHFpN0I5RjFaK1U5NHRnSHJweE10dzFLa0RxWG41RTdq?=
 =?utf-8?B?dHRzWXVobktjd24zblZJclRpM1RRbUtCeUM4YTJEYktiVWhPbld3dmlBUVQ3?=
 =?utf-8?B?YnA2ekVKMG0xeDRzVXJEbUp0SHRZaVFvVU1WVklUa3lDTTNkdHNzZ2hINkhS?=
 =?utf-8?B?ek9ieWEzeCtCWFYxbWhaalBnK2Q2QlRUUUpxVzBxK0hJcXlmL2lORlA5UEhl?=
 =?utf-8?Q?Oz6Fx5aGTKGlfVuMflhWvuTQn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860ef8c9-e485-4bd5-4433-08da866a5c80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 07:21:00.4161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R/KBAhdWmttmZxc0MczERDivaFhBoZmx9MKrBuDdN4OttDnstvUWUjqAkE+IRcklV/zPkv9zfmCpbOqXuHrIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3526

On 24.08.2022 12:59, Andrew Cooper wrote:
> HVMLoader is not relocatable in memory, and 32bit PIC code has a large
> overhead.  Build it as non-relocatable.
> 
> Bloat-o-meter reports a net:
>   add/remove: 0/0 grow/shrink: 3/107 up/down: 14/-3370 (-3356)
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  tools/firmware/hvmloader/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
> index 4f31c881613c..eb757819274b 100644
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -23,7 +23,8 @@ include $(XEN_ROOT)/tools/firmware/Rules.mk
>  # SMBIOS spec requires format mm/dd/yyyy
>  SMBIOS_REL_DATE ?= $(shell date +%m/%d/%Y)
>  
> -CFLAGS += $(CFLAGS_xeninclude)
> +CFLAGS += $(CFLAGS_xeninclude) -fno-pic
> +$(call cc-option-add,CFLAGS,-no-pie)

This is supposed to be coming from EMBEDDED_EXTRA_CFLAGS, if only
it was spelled correctly there. See the patch just sent. This line
(see that other patch) is meaningless anyway, as we don't use
$(CFLAGS) for linking here. So with it dropped
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I do think though that the description could do with some expanding,
as I don't think -fpic or -fPIC is the default normally. I suppose
it's only specific distros which make this the default.

Jan


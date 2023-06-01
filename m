Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7984D719A30
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542386.846190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fv4-0001R3-Tk; Thu, 01 Jun 2023 10:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542386.846190; Thu, 01 Jun 2023 10:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fv4-0001OI-Qn; Thu, 01 Jun 2023 10:52:38 +0000
Received: by outflank-mailman (input) for mailman id 542386;
 Thu, 01 Jun 2023 10:52:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4fv3-0001JY-CD
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:52:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2085.outbound.protection.outlook.com [40.107.13.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a61786e-006a-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 12:52:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8144.eurprd04.prod.outlook.com (2603:10a6:102:1cc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 10:52:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 10:52:04 +0000
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
X-Inumbo-ID: 6a61786e-006a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3mxKvLyIDT/It+kEUk9Yy8wZIj4EbekIslN/4X0Q+u78et1PNFJSAX9Dwr139Pqd92FAWJxgMwUSR8iPZU1FwvjoYNMpsJnd3AukuVXwlDsQUD7zTKdiW18+N5A2NnQx1Q7Gg6jhX99D7u5/b8P88DYuB5Jr/OGpUZCJZcQA01ZuBsJ/KmX70iNcBmUZ7DeaBDk6cZ6cBeRzLSHcP6DMEpVXUGCWauWKC95gijyQLnhvXgu6O+/YOLRmGWSPGkNpRgUYULaNh60Me99UImHtVg+BaF/eK3x/y+ITTHySqEaVWNYS7+YhCGz8+oe+Hj7iI0KqPyzTGuaBorHyDvipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5qe1jyLKYLDYNrMU8v8+SZKQGDxs/cDgRGtUtj4itw=;
 b=WP6kAeKbw/B9+GX1Tur3kUQRB778bnzHFwSW0yEgwfhg+YwfnCAxPS+mbzbzdn0sX69G8Z+R98OgcIXkls+vKUCVHWeaIO0Mt/eTO0jFuhY/Xug0dNLzTXMPHhe8Ia2DBBiWIBMrd+XlcTcb8edaqml19aXBWt0Mgcj6GYTnnIiqdicc6Eefm2rGQ1NQMcGW00weKBizfSyRHITMIFxeuq/+hIQgAL1suVjVuhjFvpeP0VWl1PVLaB+wgxRUcpMEk+GR49lMZovxyJVl/hOc16RSJrC5UB3R9F5zm+QzfyF62tGxgtPimvcFbjFDWJlwoP6ZYAqgQKwE6Qa60bKhIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5qe1jyLKYLDYNrMU8v8+SZKQGDxs/cDgRGtUtj4itw=;
 b=A7VT+oEKzZBx6vqm0/xf0Ozy5I7s47XlWb+EuE6L9aUauqfwVLupq1Dz8B+stjlv+cVq1xBEiYnmk0fZ41uf1y3RYcoM7XPaM1+dRSAYAcSq+q4d1QnmQcAqb4V4hjnvygpD+Njfv1jj53tyrWcLZIURoUhayJCoWmjlC849HTdLoS3FRu4SrHUHERjqHS1egGZjSHptAAuNDqVga6uuyaUKvbLAX4/YUe6vzcWZdSvqLEyXmIiW4suP17M9wk5OUbC5YkW+0Uw2Fq8rninWdbkHsgz+mb4QWGPTbi6KIi4gwvnCkzohIF/EenrPyfFFDS499hjKIkvYmsDyugq3eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d323d34-66ff-1608-1d91-9f7de78ad53b@suse.com>
Date: Thu, 1 Jun 2023 12:52:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Ping: [PATCH v2 2/2] build: use $(dot-target)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Wei Liu <wl@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com>
 <9bc7544b-659f-4c09-f54d-647641483605@suse.com>
In-Reply-To: <9bc7544b-659f-4c09-f54d-647641483605@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4c0550-7535-4650-2a5c-08db628e3c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L6G7KHB7K8oq7cCB/0BGLWxa5nGKmimg2dmlnkcwhvtaSBxuftZ5LW0+QVRQLFFRm+JuPjh3BdMIvZ690tMx1udnlRyAGO/1klErdtHoLID+lrIgpXfYaWrQrRgDXl/CmcaE93m7lZX42Mp5tmNgkH+B1mJaOAIu3/GT+Fe4TDhd8fh6p1mhHXqhqi9b9yJfi630RXzIAGjGiJ1AFfd+935BSbIajcmICi8AWiMvekY64scfJheQIB/s4OsG0l9kWGhobejHZJGE0OE6AWGT2+kBz4ezuWAMT8CYi6WIY0edmjEJVFQiflleUwIxZRKm057j/wKb7pReDIpj2MaqM/zdzFtoSuLxVEWlBztEt6A30POFPa6oXODyaibijYvkW7ReXkY89LpOWr5IItRvGGv8H3rsTJrab+XAWGowjKbJfnxyZgGpiHQa4ofK7mRTTRxqtrV5PF46vWlMWYx9R2/4IRaEGri4WsYPNNnnnlW8DhNt/KFSLP2PLMRMxzSbEnTY7jB7oUp/0dCKrsnbr+3o7E9X6HvcO3sFg9DVR5SDRiniVOmdZ3Hdwl1N7x7UgmAeT5UUqs4shesWT0i3WuelFh8jB9eH1vDDuCP1ca8P4f8MZu5/TqeEXrQNB9qnZ/BPc2qYBSh0sEn4mjjV9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(31686004)(26005)(6506007)(6512007)(53546011)(41300700001)(38100700002)(186003)(6486002)(2616005)(478600001)(54906003)(110136005)(4326008)(66556008)(66476007)(66946007)(316002)(2906002)(5660300002)(8676002)(8936002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clJDRlByeitmR2c4VUFHSHNkbURiaG1HMHhoVFdhUkswWThta3QrM3doNFFj?=
 =?utf-8?B?b1hlU3lGblkzVXI1ZThONUJxQ2w4Sm1ieGZ0R0lzZ1hpWWRKbEMwTWdRelFN?=
 =?utf-8?B?dDl0VG9KV00yZlloVlI2dEQ1Nmo0S3pTYy9URTE2aTBiemZYUVc3WUsyekJT?=
 =?utf-8?B?SXBMVk1CcEVBM004MDR4WFowUkZ4dkkzMWNpTlJ4V1h5aGJlWE0zWTJMVFRS?=
 =?utf-8?B?WUpKOGJqMzFkaExzcndTT0p4WEpUNDI1UzJLRmNSQllsNUgrdG1BQlR5Y3NJ?=
 =?utf-8?B?V0c5MnJTYitrK2JrOVpLd3RPemdScENkSUVYbGtJa3FYQmZZNXZIbUJqeWti?=
 =?utf-8?B?RG84dndzdW9FYlFVMXJDWjNzSG9tVG5udnpYbjdoTTZvQ1lpV05hbG5UT0JS?=
 =?utf-8?B?ZjBuR2VneVMrM2Vaa09ySkp5SGpJRzV0M1YycG9xYXBwZGRmdzZKRWFIRnhZ?=
 =?utf-8?B?alk3MXRNdnRCK3VvNThhTURtaEd2akEyQjRFZFkwVTJSV3FKZWdpczAzY3U3?=
 =?utf-8?B?RmpyQ29FZlZETmlGZE1WZTRpMTJSSE4yMnVoUWc2ZEs3Q3FVU3dUVFJQUjNm?=
 =?utf-8?B?REpVT09kR04rWTVNR2xFYVJTSVFvZldDWXV4Z2pVZlNveTI5YzBWUDVkaVhk?=
 =?utf-8?B?RUhRUmVNQXMxdXFQU2hpcEZZb3JpM29jMmZNVEgrb0pwZ3R3bGpBVW53dTZW?=
 =?utf-8?B?SlN6WTVzWEcwMDVZQU5MYnF3dTUrcytCOGt5T3VxTzJ2djJRTi85TDN2T1h2?=
 =?utf-8?B?OXMrNUhDdHFkc2pPeXNaNWJjd1JsdEZTRWVzbEljNHZHV20wQW1XZ3BjS21y?=
 =?utf-8?B?OWdHckFWbE1SZGFHREJ6OUhuKzlXUysvVHQ5dWJMemt3NlFJQzBiQkJpcG1w?=
 =?utf-8?B?aldTU3V3NlBXZkdhL1BzbjJ2SU51MUhVRFVFc1dFQkRWdmRjWno5Z2N5WWJy?=
 =?utf-8?B?R0JLY1VZcW9kVnU3Z3JNYitQbTdkbW9Gck1uR2N5Y3l4Ukdhd1VBNXJRMmtS?=
 =?utf-8?B?Y2tDckpRbEduMURhaU8yQXZUTzNJL3c5aVZZbWRCdXZaZVlFTFBLc3BwY1p6?=
 =?utf-8?B?aHVQdC9XL1Z4bm5icC95SWg1anNWc2tJY1Q4S3IzUkl4UjFmZnk0a3REUHUv?=
 =?utf-8?B?U25QSnRJNk1FUmVxa3Rxb01HdXhScE1lSS9wd0VWOUxIOGRDc1VVVWRqbmYr?=
 =?utf-8?B?c28vYmlLZ3pSVlpCbGppRkwvbUprcWIxbWNsUTJUWWhPdUxsTDQ1S2kzRnBn?=
 =?utf-8?B?V0kxenZTMTdEODBpZ0h6TGREMW9SQkx3MTR1TzZ2UXkzTmlUNE41SnR6cFBE?=
 =?utf-8?B?TC9XQklvSXRZcHR2em9NaGFCZkVuS2sxblUrTFgwMmh1ajFBOGN5eFV0Zm5Q?=
 =?utf-8?B?QkJHWkhNSVlrK3ZYS2pTdFpMNldOZ2x3S0YvWFBnbzd3dWdPTkEyZmlXYWJ1?=
 =?utf-8?B?UFhYcVRic2RNRUI1NTBXUVJKc1YxTURWNEhtQ2dOakhxR3picHpZQ1ZIMHc3?=
 =?utf-8?B?Sk10clRPU0ZpNjBWbVJjdnk0QUUzNXlVSmpDM0hVQi9COWRlTzNZazlsbGNJ?=
 =?utf-8?B?U1FOalIyZS8wazFSUUNoM0N2LzVHb2JWNWN4OHFFZWt3dHdiZ0x2YTZnMXh5?=
 =?utf-8?B?QlJ1aGJDTDQxZHVWdS9QU20zeDhhZmt0Q0l6a3JhaDkvK055YThpdUl0OTAx?=
 =?utf-8?B?RjdPeTljeWlsUVpkb0ZILzBFZ3RtV1ZsL0Y4SndwZVJlT0ZyQVZUOVd1ejFK?=
 =?utf-8?B?Mk9xSHJieWdzNVI3ZGpneG9Ja1pPNWtDWHJDZyt5Z0NITHNKQ29vRVcrd2VM?=
 =?utf-8?B?WjdxNHRUS1MrVWlVdHBGam1RMmQ0WHUvQ1g1WjRSRGdvSlFoNkFaeG5OSkZq?=
 =?utf-8?B?VFVSdnNmWTJwUmFiNzdSMkt3NkRrZ1Z0RTZvZU80U2FZQ3pIQkZGNWIxLzA4?=
 =?utf-8?B?blhCQ0Fadk9nMmtWSHhrTkNOZWpldWxvNVgvcTF2dDBoaEhuUndzTk1ES1lx?=
 =?utf-8?B?Q2IwaFJSSEQzLzhpNTY3VkVhcUdka1BJd0dIRHRKM2JYTzhjQ1FtYTVtNWcz?=
 =?utf-8?B?SWtGTUlaNHlWeTFXTmk0U0NmVUYyUVdYb3hrS2xEYkZGcEdWa0gwSjZwdXcz?=
 =?utf-8?Q?Iuf9IUmA90QUs0rUr0Q2LzVxc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4c0550-7535-4650-2a5c-08db628e3c96
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:52:04.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W66PApC3MKk6AerCBl67njdisdm2nkZpm+QvaJY0QHsaF5v+va7ttkX0mGfGxnZqGXyTcFj5hBEqojkzElbcYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8144

On 08.05.2023 14:58, Jan Beulich wrote:
> While slightly longer, I agree with Andrew that using it helps
> readability. Where touching them anyway, also wrap some overly long
> lines.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I didn't expect this was controversial, so - any chance of an ack or two?

Thanks, Jan

> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -93,17 +93,19 @@ endif
>  
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> -	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
> -	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
> -	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
> +	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> +	$(NM) -pa --format=sysv $(dot-target).0 \
> +		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +		> $(dot-target).0.S
> +	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> -	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> -	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
> -	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
> +	    $(dot-target).0.o -o $(dot-target).1
> +	$(NM) -pa --format=sysv $(dot-target).1 \
> +		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +		> $(dot-target).1.S
> +	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(@D)/.$(@F).1.o -o $@
> +	    $(dot-target).1.o -o $@
>  	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -123,7 +123,7 @@ syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SY
>  
>  orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
>  
> -$(TARGET): TMP = $(@D)/.$(@F).elf32
> +$(TARGET): TMP = $(dot-target).elf32
>  $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
>  	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
>  	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
> @@ -137,23 +137,23 @@ CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_E
>  
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
> -	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
> +	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> +	$(NM) -pa --format=sysv $(dot-target).0 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> -		>$(@D)/.$(@F).0.S
> -	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
> +		> $(dot-target).0.S
> +	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> -	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
> +	    $(dot-target).0.o -o $(dot-target).1
> +	$(NM) -pa --format=sysv $(dot-target).1 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
> -		>$(@D)/.$(@F).1.S
> -	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
> +		> $(dot-target).1.S
> +	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
> +	    $(orphan-handling-y) $(dot-target).1.o -o $@
>  	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
> -	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
> +	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>  ifeq ($(CONFIG_XEN_IBT),y)
>  	$(SHELL) $(srctree)/tools/check-endbr.sh $@
>  endif
> @@ -210,27 +210,34 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
>  endif
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>  	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< $(relocs-dummy) \
> -	                $(objtree)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
> -	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
> -	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
> +	                $(objtree)/common/symbols-dummy.o $(note_file_option) \
> +	                -o $(dot-target).$(base).0 &&) :
> +	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
> +		> $(dot-target).0r.S
> +	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
> +		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +		> $(dot-target).0s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).0r.o .$(@F).0s.o
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>  	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
> -	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
> -	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
> -	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
> +	                $(dot-target).0r.o $(dot-target).0s.o $(note_file_option) \
> +	                -o $(dot-target).$(base).1 &&) :
> +	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).1) \
> +		> $(dot-target).1r.S
> +	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
> +		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +		> $(dot-target).1s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
> -	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
> +	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> +	      $(note_file_option) -o $@
>  	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
>  endif
> -	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
> +	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>  ifeq ($(CONFIG_XEN_IBT),y)
>  	$(SHELL) $(srctree)/tools/check-endbr.sh $@
>  endif
> 
> 



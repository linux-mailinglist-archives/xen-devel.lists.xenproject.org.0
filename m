Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8D461A18
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 15:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234600.407129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhqc-0005Nw-Nv; Mon, 29 Nov 2021 14:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234600.407129; Mon, 29 Nov 2021 14:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhqc-0005M8-Kr; Mon, 29 Nov 2021 14:41:38 +0000
Received: by outflank-mailman (input) for mailman id 234600;
 Mon, 29 Nov 2021 14:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrhqb-0005M2-Jt
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 14:41:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74474803-5122-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 15:41:36 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-XCAkVwWgN-eRmoqBgS9Nnw-1; Mon, 29 Nov 2021 15:41:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 14:41:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 14:41:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:206:1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Mon, 29 Nov 2021 14:41:33 +0000
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
X-Inumbo-ID: 74474803-5122-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638196896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLldLxqzanr/1+fXhyaA+tKXGIzZtY4THjrEVyz4E8A=;
	b=XZB8ogTHANTc90/zwjP0UYU1Q2l7+dWO74XOBMVdGcNT/8JPNo+zZjB5kp159rdTOMVNDB
	Bve8TgCeUVKtMADLppNrZhuvembcXUEF3wjPJr1ekZwNRwRk63C56ZnhzQ5kop7gbYF22N
	9OuX02SzYA+pd2/xXnRqSful0Oi1eGE=
X-MC-Unique: XCAkVwWgN-eRmoqBgS9Nnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZdrfTzo2DmFHoybMHTYegaDMicaLlsZfJOLXqsMhxedXlbEYOM6emtAWuC+nnO4rT7vM9HnQyRGTdqqfc3Vpf09mayL1L5+FGC2nWuPNipMq+BiBS1/1wRX9zeUnu8qh9JU3fSUdnKZjd8W2Cw/P6lFKJqiuLZRF2bgGdCFBysVwM3rLINmdzVlKXRREHEZkurgK7v5NRrptohL8TRSL1TgRko9PBV3QfLNuh4x1umCyjlHJgfBdgESa3bFiQTmJ/FE/5wH59wTYnkGUL42HJB6u1AlIXviOCjtqLQ3i6+hrFB2RN+eDO+KKmNnpo7tygQPEt5bDxcbC1gS3vCbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLldLxqzanr/1+fXhyaA+tKXGIzZtY4THjrEVyz4E8A=;
 b=a7aYRAqJnjwJX30yPSjiJf2YoCbHxqc9PDvLu3YndVJepS4+24WO4VASySnDXlSwyhFYar11hRXGMM6kvezt12w9g3vU3rLnkR3pT7YckgNgyXPMHlr7mf4vfg/NkcBNkFJuiiYoTCX99mlvm9vDhxpUm3SghWAQrH48KarvpVXiQn4i55Vvp/ZEFQ3B89V8kg/rlw6oHisVCkOSohEif95amleYjQesXVeaKffBBkC1+KeK5Gh3S/Qce282kTbEMYijCu8qL0f8ZNIRbwOKRShf04MINs43yloIxf3vEKbpRWN1tnoVWfeagEXJ/Hxj26bMhcWBjfokr2Brd4EKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a171ee49-0ad4-858c-b999-7910b3d1195b@suse.com>
Date: Mon, 29 Nov 2021 15:41:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 54/65] x86/stack: Annotate fnptr targets
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-55-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-55-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:206:1::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 110bb939-27ab-4046-77c9-08d9b34656eb
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152F265BF7B4EDF591338B2B3669@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HFhCjuYf4UehTIzRJO4E6UY9HClzMnrpVS/1Ujf0Cae7JE9H+2aVk5wCitOGn+Mp++snI35aamR94CF56gc0VNrmwbiZX87WrkwS8uihv+NeUt7AuMc5dtfjmBCJEI1wmjOR4GUvSoS++fH4EZLsPfwjQa9O7JRxPFdxWaZ3AFnxnlGaKLZiUCFJsgt511LS8FHpqrBnEETqRhNOScRxX9CuMRPrvBs7hu7G88hsExFemVIia/BWOsQDW9tEXgVsjj73FtJR4KghYmUcQY/z6lzOKKiZwhS7UNzfkGqV92i6AhuTvqi/hpGW9CHNbSvKfRcHIMXIsGSK9sOqJqrr74FUSH/Bg25TQmA1eS/bSL9FRMBzNCJr1sTQZ8ldXWw9DxZoHlvwKtIreHublNS91+0XFL37gzVEhnbUZjdRZvht83SqXfw4KLkgTROHjX68JSTeA4qWknKh9mtUa8/AON5j4VkyrXga6LjesiZD51elDIRqQl8cFbHcYC7Y44PDwLlTRhteh/18CwIwqFb+zzaNjoYAYVP0vVNak4EFo2XLXfg8wuKgHhnoIv6FFNww8dGH1CETD3NSueHH10EqLPA+1l1YKMLwSsvry1kZBGUTwONvEdMXwoY2TabkCBl6lEGaA6nTtBMeGIc8q778HnxZP+Yf2oLpIzXDYr3dXjCQ/I+m386A8uxY/OZifyuq2B6GC33fIYJ0Jkn9lPWJJVFDIjyPsPeLcT40qqQyPtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(36756003)(2906002)(8676002)(956004)(4326008)(83380400001)(2616005)(186003)(8936002)(31686004)(6486002)(5660300002)(316002)(16576012)(86362001)(6916009)(66556008)(66476007)(66946007)(508600001)(54906003)(4744005)(38100700002)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rit5WTUzYmh2RWRCQ3JRV1VyNGdQTHByMFlVN3ZVN1hzQUZ2K0FBbnhHeVM5?=
 =?utf-8?B?Wi9tc2JtWnJPME1Ddm1vTkxaZUpPV05ZSHBVanRvbklZeFNsZEhpeTR4aFB0?=
 =?utf-8?B?Y2g5MmFaSUdqWTZib0xHOFduYTFETXZCWGxzY2c2RWNlU1dDcU8zdkF1VTdr?=
 =?utf-8?B?MjcyTDhOTkczM0c1Y0tVYlRxYWd4TVl5LzFEaVA2UCs5UU94dHRIdFkxdGlV?=
 =?utf-8?B?TVNqTHdkK1cwVE5hM2VCVzNxbUdtQmR6WEJ4MUt0MXk5T09SaURGVmFucUxu?=
 =?utf-8?B?YkluK1ZoTGFwMHYzSDR4aitPRytlOUJSWnc5S3lJaWJjajdjRndNZ0pISUds?=
 =?utf-8?B?d0JPbEF0NVdmSjhPaFAvSTNSVUxjOEJ2V1ZVeXZRUFJhR3R6Smc2R1ZHVjJQ?=
 =?utf-8?B?VmU2b3lnVzNVMjdTMFZVbHpGam00RnlnVzVHaWtWQitVR0JreHhoQXBDNUVv?=
 =?utf-8?B?aE1mZHZRdE1INWtDczdmeVFnUEVzSDlWYS83eXVRaVoxcVY1b2JuZnozTWhx?=
 =?utf-8?B?c1JadEcrWXp1V0lyWGIrWXN5RDNORHNMcGdPWmlBNVpIeGJlMEF1R0NqYW9J?=
 =?utf-8?B?OWd3TTJFTVhOdnowRjYzcWZkSU5yemxid2pnb0lIbko3cy9obWxCbWd4S1Bw?=
 =?utf-8?B?UE92Q0tRUW1EbDM4VFZxdVdMT2dodUIyaXZHZU5TdGQ5QUd1OXA2dHNPUDFY?=
 =?utf-8?B?ODJaODFHSGdJVytxM0VyQzl3ZGVTVXpCSmYrSDl2Sm1TbzFWdVM1Sk5WWGts?=
 =?utf-8?B?bys4VndjYXNKZXRwSVhoV2duMXZodjgrNExjb05mUzI4RnBpUGl2Sm1aYWVF?=
 =?utf-8?B?SVdyajdIdjFQaGduKzRrUUYvOEZlYUlwTkRDdWlrekNGZ2prZDN1RjJHQU0w?=
 =?utf-8?B?Nlk2S0s1ZVhGZ3l6V1Rydjl2M2VyMDkrZ1VFcW1wTkNNZFFUSE0ybUN4bUQz?=
 =?utf-8?B?cDAzUW55eGQvOWF2RHFOK1lucVgxKzcvYnVoQUpNb1hrRnhSMzhCYWJFWml1?=
 =?utf-8?B?WFZubHpQWGlXVWRSaDB4aG1TdThRdlBBa014NHV6VDZtTGhRRHZ1d2EvS2Zu?=
 =?utf-8?B?Wk1xR0VHN2dEc2xsNndlRkFmOFlHYUdJSHhpQXBNaEtZYURiL1prY0ZqdzFR?=
 =?utf-8?B?T1I5ai92UWJBSUxwQmRiL3lsNnNBaTBJRzJ1Zm1WKzllT3NKdE5hK3pCeC92?=
 =?utf-8?B?VFVuS1VPNGVyVEhXajdLWmFtRS9mMHB2NTN6NlBmYis0NThSZDZjV2lhczE5?=
 =?utf-8?B?YTBHTlROdENoZE8ybVZpQk12b3ZhR3V5M0E4bTFRL1VReHNlRXBWTGFCeDVJ?=
 =?utf-8?B?MnNSNVYwcUh2bndHWkNQM0x0S1VSQkRPZmtHNkZKZ1crZEtSajVNN1NNTm5j?=
 =?utf-8?B?Qno4Wm51bmpQSXdoQUE4aisxelhFZnRHRURkUXB0SmtGQ3dya0J1MGpXR1BD?=
 =?utf-8?B?clo3aTdBditEejB2Z2Z1UmtBYXlQZEVNTGpNaWdsUWdJc01rRDlqSXNpOHpG?=
 =?utf-8?B?Q3kwelVick8vQzNXNlJJR3FMRDFSUituQTFycjNUS3pmK1EzQVRTRjdxbXhB?=
 =?utf-8?B?ZUhoWFd1SFExd3I1UWtYTTY5REtGbEdHeVNKM283ZG9JUVVXbFM0TDFkOFZz?=
 =?utf-8?B?UWFnR211aDErQ0h3RklnQWszYXRIenJtZTlKemxiREkrZ2JpelY2bmFvZmlK?=
 =?utf-8?B?OHI2VWREMDlHUnBHb0NlSGcyQ3VxR2o0cW5Fbm5iUDJzVWJvTXJuZFZhbTds?=
 =?utf-8?B?WXVIMzZsamdEQzU1eU01WXNXUmhQWXlvWUxOQ0IraUpENnpmK3UrT053RmRC?=
 =?utf-8?B?UURuV3RDM2xFOFpjRmpoODlBVWxUVElPSUNYbDVXWngrN3I2bmx1NWJjbm5l?=
 =?utf-8?B?MDRCVUtrNlZpSDlTS2hWTE5HSlgrMmtkYkxRRVZtVlBUamVFaWJBdWlKWjhY?=
 =?utf-8?B?UGROTmxmN1I5UzhYaDVKelJ1T3FubUNPSUUyaWJmeHF0L3pSTlNYekQzY29Y?=
 =?utf-8?B?VFdrLzNxbXpFTkZON2ZCd3k0bk4rVmpJMzZKVHBzaWVOTnh4NWQ3QUpCQ0NV?=
 =?utf-8?B?d0tNa0llQ3VrZjVLb2R3ekxDUGhONmkrSTZLakIvWmhIRnNjVWljVTZibjZP?=
 =?utf-8?B?OHNidm5TdGJqWXRyem1Yb0tib2hRa0xtcXdNNHdDb3VQTEtBeTduOHE0c1BC?=
 =?utf-8?Q?YoNg+dB+imJbQyc60+tO6Ic=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110bb939-27ab-4046-77c9-08d9b34656eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 14:41:33.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7xMbviyC2TNkBcooXe5Jrt2KKAB5nNdgDxQdx98W0yHbkcUhN2Bald1E0TKqLH4RtI3x7P2/0KE3ll2Jj1EYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 26.11.2021 13:34, Andrew Cooper wrote:
> --- a/xen/include/asm-x86/current.h
> +++ b/xen/include/asm-x86/current.h
> @@ -173,7 +173,6 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>  #define switch_stack_and_jump(fn, instr, constr)                        \
>      ({                                                                  \
>          unsigned int tmp;                                               \
> -        (void)((fn) == (void (*)(void))NULL);                           \
>          BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
>          __asm__ __volatile__ (                                          \
>              SHADOW_STACK_WORK                                           \
> @@ -198,6 +197,7 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>  
>  /* The constraint may only specify non-call-clobbered registers. */
>  #define reset_stack_and_jump_ind(fn)                                    \
> +    (void)((fn) == (void (*)(void))NULL);                               \
>      switch_stack_and_jump(fn, "INDIRECT_JMP %", "b")
>  

While the risk of use in a context really requiring it is low, I
still think we'd be better off wrapping the whole thing in ({ })
then.

Jan



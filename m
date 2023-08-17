Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A763377FA24
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 17:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585482.916627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWeW4-0007o8-G9; Thu, 17 Aug 2023 15:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585482.916627; Thu, 17 Aug 2023 15:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWeW4-0007mN-DO; Thu, 17 Aug 2023 15:02:28 +0000
Received: by outflank-mailman (input) for mailman id 585482;
 Thu, 17 Aug 2023 15:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWeW3-0007m9-0z
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 15:02:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 133efcbc-3d0f-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 17:02:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9282.eurprd04.prod.outlook.com (2603:10a6:10:36e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 15:02:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:02:23 +0000
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
X-Inumbo-ID: 133efcbc-3d0f-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMvci4SrAvhVRIRF6qG9gODxzGwvPLZGW2/Os1K+/8YAK3z4zmNcvDzXXRuBEX2k6flRnJ/SGIbCrg2u0qevKTNFhJnqpwsAXPmnSd5oc+80ibXN04eWlcMVDjpeWy7vs2gnPYnWyLwhiubwNf2hq18TDlcmBi8ifZSKfW0bhrDJ9+hM2nQShQle+S5zmRLJX9fpShWiLmbJptSxuv6abYZnVFC7GGGtF41AQb0aQOIxhFw+enXhGyeP1pn4KIonMQo5Smtx3YBevuKmPQ9pxMC8lcnNpbNITql8DRQ/tSEam2/PdP2J30dzAutIyO53YCA9m/Ov0OoNAUdclshubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+L34wGYUn1nLC40IHC53VdZ4a8mANwKT0u5/K9e6bk=;
 b=dklcCyiKvdA0U1pE/h6G620cqRTxBwsh7cd3rZVxC2XrySHK1tLJ3Imxosnde0L4BMCK08zyUnESDhSPYuEJpi4FUD2en9CpB1xqCundbSVHFDVZYeFFQV81chQ8aivX2HxdWCKbUL6FJ09XoLW2iBzD2kF7As7qAXGDWRZrugVhWuNuZGpM59X7VOfnh6D8VlRFNWRaNy4HqUE0sUZJooFh8YKlGXvw2juMhNsm8T2ZCtxDDao+8tyCle2GGIHjrUFFO6rrn0AbqEnhVIHe1CjDAzicuedOs1amNWQmndUqvGYhylZ1eSK1hEW+iCyJLLm3dRKfoHva33WlmGGBZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+L34wGYUn1nLC40IHC53VdZ4a8mANwKT0u5/K9e6bk=;
 b=a872ofm+7W5oELkZ0j/eZ/ooyB1wj6iz4AfRKo+PvDTz+Of5ow4mVmSvB5KJwpUo8Lfm4cVVZTYxS1KwVXHP10WrXBUMSmwLFooXwQzsril/N5MXqQywSJB6p6+5Ub0XEiaKg8fIwZ7fPY8hQGvAgVCNXnnTrubt1BA5lV4pKsg5xTPxJjlkgWBphiJGxm+6k4faVTfcTutRLhAyD16ZIHeLKAQY1hJt04V8PwOKOlgteSNFKMfKBTTRMhNXpV5U1d0MmjpSP3EJmnIwM6mtx6AL0QrxnlskyESkEVhdr8mpkm38rdjPTdVqwZETd+SO3x3BGgtz54lAv/91a5N4Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6827156-70bb-c8b3-c4d0-a8906fd0e7a2@suse.com>
Date: Thu, 17 Aug 2023 17:02:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 3/3] drivers/video: make declarations of defined
 functions available
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1692275359.git.nicola.vetrini@bugseng.com>
 <cc46049dbdf86cad33f6a9f7ae79851b54cecea1.1692275359.git.nicola.vetrini@bugseng.com>
 <111382a3-0845-99b5-1efa-dfc505084c66@suse.com>
 <b61b9659a790701ec0b20e6c92dfb701@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b61b9659a790701ec0b20e6c92dfb701@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 419c40f8-cde0-4c80-c0ae-08db9f32f667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g/ZScgsdcBfthXn71iL2jCIsSYkzJVXXJTWH0YOa7OeyntH6ISs2OBNV8M4KzIT+Y6hAXvWwYiuoYucV92VcXEfs2AcWYXYV6uORiRz0Nfnlyz8DHUOeKSm3YJeptZRg8up8xu6XyT2iOhN6rJF7OQrDgSZuCw9LElr2t3IfJwsNlZaWim8XHgUDaPsKnADy4jTtnzg0bb3mJU8W3xnzWMOg3eGvN5qCUKxbTqvXFcC4XS07bAVWHB4Mm9HHTZR9lIQxb3YYp2P8S0OYc+cgwajn3kBG5pDUFeu2IRcIZg4pCwWAJ/LQKR4ycyb1n6oX0p7+QPHPNrntfg+LqkGiS/eVSnBn5VbEEZQeNt1HvmCDOTmIkrnyoRtpETulIWKlSWBq+/vF+TPQiHxI9POZMPxMaF/cxn93I1/rgZF3muoMuoB6MW+K+cyuHiFFfPdRuDxIpdCC28PCad1RrW+ON9prKUCr0ERupYcGUQ+QOLOYYGHIrCDgeQxIwo10WDnDdBtKK3ZygRXU0okg8BRTadYuvmyhUmUHqHylksE+1yM/hbTDfoRda+Ti3L1buNUccWxZFJlOipBzfxLulJWNcmAor7APEw4RQ6QYLarABwNrJcU1MkyHn4OLS/Rw9YMrsLbgjeDJt9lLwZi7w50UgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(31696002)(2906002)(26005)(86362001)(7416002)(478600001)(6506007)(36756003)(2616005)(6486002)(6512007)(53546011)(5660300002)(41300700001)(316002)(54906003)(66946007)(66476007)(66556008)(6916009)(31686004)(4326008)(8676002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGk0anQ5VEdnMHNNZDJENVYzZ2VFZEtVUkE5ZnpxUGMweFJPL1dmRWV0aGx5?=
 =?utf-8?B?amxmNzNnV1V4WTJCekJNUi9RZ2czcitLb1IvUG9XOWcySVBCY0VSdVp1ZUo0?=
 =?utf-8?B?bDI4b1UwdGtuMCtyemNVM0FPd20yNU1LT3BtOWpFT0tIZk91Vk1KN05qdFpB?=
 =?utf-8?B?TW9rR1lFTTc3VGxqRXQ4N2FHODhRZyt1LzJHNE9ORXhYOGEzSDN1MVREOTFr?=
 =?utf-8?B?blVBS1QwU2hMV3VKbUNKOFFGNXB2OVNOSjkzK0d3VHZoNXlFYUNUV3R2bi9r?=
 =?utf-8?B?SldDcGFudUx1cWRGcjNrNjU3OEQ4SU1UZ3NPaDhXNFlXcmF0UnIwMU5RcGsy?=
 =?utf-8?B?NWNLclVnWkNOMGlPQk9tNElhTEdzUzhKUWRuSENYWWpSMnNHUzkyY24vR0s5?=
 =?utf-8?B?V0RaOU5qV2RwNFZVRUNmdklhYmVzOWQwYTlNdlRBM2JZZXhhUXJiWlpFWlhy?=
 =?utf-8?B?ckl5UTg1aVozWldHd2lkZXRmd2h2djQ4UE9RcytMTXlFRGN1U1VDbHprNEVT?=
 =?utf-8?B?MWI2TnJHTm9ydlJiQTgxNWJYU1JoeEtVTzRiSnRSYjBkT3VVWHEvbm5yQVhE?=
 =?utf-8?B?SHd6M3ZZSm5BWlpoYXF0UjZPRFNmcDk3VERRSGVPRjQ0TW8xNlpJaUxQMlZM?=
 =?utf-8?B?ZzluVDNjdVpqbnNvdnAxWDcrVENuQ0RHZ1FMLzMvZTE5eDhBSFkwaGN0MEtN?=
 =?utf-8?B?MkQzQWs3eGVTRkFtcUk4aGNkWkVUdWdrUnoxdHUzTFpBQzB6M0tBMkpiMU5m?=
 =?utf-8?B?T2xsTlhCNEVTeERqamhnTGJLTnk4SDBHYlFOUmFQMGp2UDYxMUVnNzF3ekJW?=
 =?utf-8?B?d2JjWTJsZGNPQU10UDNqYWlJWXAwajZzR2F5N3JTc3VHaldXaW5kcVh6WjJv?=
 =?utf-8?B?eEpmaHR5MGFzckVyMTVMVDFBdVNaWlhQVlRrZ1VwNFpvZUY0QzY4a0RKMGF2?=
 =?utf-8?B?bGtUalhqZHRVUzNCL0haQ3YrdHRWTHUweVZXeVZlS1dPcHZzTEIyRkZIQ2Vs?=
 =?utf-8?B?WEtsR1h6cHpmT2wyeUdRbkVhNVhWSm9nbkdsQlFUYkNFTnN0SjRwRUN4RGtG?=
 =?utf-8?B?aXhnaE44ZVlTNjFNN2ljM1FUMVNUcDltVTR4NmVwVFY1bVhuWnZnc0x1Q2c0?=
 =?utf-8?B?WFNGMG9NWHYzbWIrR3VzS2JxdVdYaGlka3NodzFVdFQzcWpjYnBaMGJhbVNR?=
 =?utf-8?B?MkVaYnFFN3UreTRDeThjaTlSblRxWTY2cW0vdWV5MzVvaXVDMStjSE9XeG52?=
 =?utf-8?B?RkFyVVRoSzJBYlVVMTNqbjd4V2Y2NHhLMWI4a1pHeXVGanlSR3NRVCt1bVVW?=
 =?utf-8?B?dGFId294dENlYXFsYWN1SUNMakRrd3NJQW1vU0VvM1VYTVRYZFE1Y09oWnZH?=
 =?utf-8?B?SEIzeW9JdlE5SGtoWk9pNVJ3RE5ULzRQNDVSQmd2ZFY2VEVVRURSUGpKZUth?=
 =?utf-8?B?eWZLemxDUTlrQ0V6WTI4RzdHN2M4SDJHWXJJenVsaW1nekJ6UTZzNnhjMTEy?=
 =?utf-8?B?NktsejRENTR5T2xjdUQvdXlaS3ZiUmppNlZHRjJrNUdkWDlnT0wzR1o4bmdP?=
 =?utf-8?B?U2FFV1pIVktaZEFWc2lkNGlnYTE3UHBuVTVkN3VBMElKaitpZnNOVWgzYUw5?=
 =?utf-8?B?Nkl2UGV3VS84dmRJSGVkSlBtRHFadUE2OVR1c0J5TmZSYXl4cFdoTG1xNmVu?=
 =?utf-8?B?eGR6ZDl3VGZLNlI2YU5oMEM2dmNQcFJDOWdJRzFKR01IYmdXa3NXcDU3dm9n?=
 =?utf-8?B?MXlWaVdnUTRWWUdIRnluZFZOYktJZ2c3OVVMRHY5ZG9PbFk1THJoQUsrdWUv?=
 =?utf-8?B?eHFkWFdKU3NVdmhESlVmOGIzR1NWZDIzOFNDRm5TR2l1TE1aL1BtL0lXQXVU?=
 =?utf-8?B?eCtEZzVrLytnNi9takJnaEtlalByQnFnZDI3VlVRSEttNTRmYm5wcTkzdkVL?=
 =?utf-8?B?WUJkSmh0YU04Q2RPcWJqSlR2MGZRVWt1UmMwNThvOEJ6MVFwazIxTHYvSzdH?=
 =?utf-8?B?L3ovVGtMeEZyYUJycURiK1g2NnEzaFVvdGlWZVo3TTl0VkVmU2ZYRTJ0Nkg0?=
 =?utf-8?B?ZWkvVy91M0NKY2tDQ0loai9oYnk1NUtleDU2MEVEK3RlcmxmaVdDeFJjSzFE?=
 =?utf-8?Q?meS3ehFfxwRd1I9ctHvMnF4CN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419c40f8-cde0-4c80-c0ae-08db9f32f667
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:02:23.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ks94ZlP3aVFjio54n823B4yIYwzqPlYBjvs+TQfNmi7PUCvCCmU6kD7oOPMyYDbKqRSr9vZ3NH3xhj+LUou6Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9282

On 17.08.2023 16:52, Nicola Vetrini wrote:
> On 17/08/2023 15:28, Jan Beulich wrote:
>> On 17.08.2023 14:39, Nicola Vetrini wrote:
>>> --- a/xen/include/xen/vga.h
>>> +++ b/xen/include/xen/vga.h
>>> @@ -15,4 +15,20 @@
>>>  extern struct xen_vga_console_info vga_console_info;
>>>  #endif
>>>
>>> +int fill_console_start_info(struct dom0_vga_console_info *);
>>> +
>>> +#ifdef CONFIG_X86
>>> +void vesa_early_init(void);
>>> +void vesa_endboot(bool_t keep);
>>> +#else
>>> +#define vesa_early_init() ((void)0)
>>> +#define vesa_endboot(x)   ((void)0)
>>> +#endif
>>> +
>>> +#ifdef CONFIG_VIDEO
>>> +void vesa_init(void);
>>> +#else
>>> +static inline void vesa_init(void) {};
>>> +#endif
>>
>> Hmm, on one hand you simply move existing code here. But then why don't
>> you leverage the existing #ifdef? The more that it's more specific and
>> in line with drivers/video/Makefile having
>>
>> obj-$(CONFIG_VGA) := vga.o
>>
>> and
>>
>> obj-$(CONFIG_VGA) += vesa.o
> 
> Are you saying that CONFIG_VGA implies CONFIG_VIDEO and therefore 
> "#ifdef CONFIG_VGA"
> at line 14 of vga.h can be used instead of the #ifdefs inherited from 
> the original locations
> to wrap all the declarations that are being moved?

Yes - see drivers/video/Kconfig.

Jan


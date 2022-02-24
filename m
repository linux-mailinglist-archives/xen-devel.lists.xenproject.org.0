Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700DB4C2C6F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278225.475395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDlK-0001LJ-Do; Thu, 24 Feb 2022 13:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278225.475395; Thu, 24 Feb 2022 13:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDlK-0001IL-Af; Thu, 24 Feb 2022 13:02:26 +0000
Received: by outflank-mailman (input) for mailman id 278225;
 Thu, 24 Feb 2022 13:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNDlI-0001IF-Hf
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:02:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0200af39-9572-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 14:02:23 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-deP1I083M8GJ6McpGPNGAg-1; Thu, 24 Feb 2022 14:02:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM4PR0401MB2225.eurprd04.prod.outlook.com (2603:10a6:200:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 13:02:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:02:20 +0000
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
X-Inumbo-ID: 0200af39-9572-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645707743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEpt8K81dSGr7Jz7vUqsd2S4FoBoc3q7IOZcYJczdMs=;
	b=HJHjjUd2SdPLGcpN8d14GeSAg3AOYpSXTq9y59mR0IB7vqJQ8JxX91tFlPtVWquHpWSZn4
	M+3/EVIQFA3jYCeuJsWPg7vp8SuBMJgpRn1M/acBFsSeDcvhiku+DbwYAl3H7CVce3G56+
	PuP5TIqrOsimk/6VjmF1lM1SKvRGV5s=
X-MC-Unique: deP1I083M8GJ6McpGPNGAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehzs+ytTb5iCQacaI3+3H1AX1LV0WZ5E6Xjpu4P8eNAIInYbrOT6gHjzGLkdbA8nFmPSu53sEIdfWJXQ4T6ds+8E9eDyoU4pKo/hKlr67EvRiUYfLaoJDa+wBUpoNAvNduMryk0t5czcsdxr7XW2nxrtdQdjCUSyIexGegNGZt6podb1AbWgcC3qyZpnvrOsXLXkoiQptL8R4JNbOaFI2b3V3ir1ZnXf7vQRNFnF0e9tWW5ctEHQa7nMVbJrIId3VCNgwvh0rd6rN8/LYUDnC9qyu5jlRC3Pzb0HhyWSjJLLzyNCa5o9Bnz1te3Wxg8zasijZdGmxzqb1TeCBbfF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEpt8K81dSGr7Jz7vUqsd2S4FoBoc3q7IOZcYJczdMs=;
 b=e94J7XkEDBeng+rI1tL/cEYNfgrvgzbrqkgSlDJtyc48QAzQx/4WlgaVN/+F5mbdupgNb3shQ+zdhYnud9/fStmL1Az7O2tDv4JPEdXxl1wjYU+gWyXVWcRDsRsvio80AnYWIWm0HXIBbaGLKvTrdx18ykpuOOECCyh4vHyTpk7WMWfp5+ZC9Bfp2gHyAUY4K6b9/afHjwPUuJ4lOqEG+pIRkbVBO+hlDdwNYQWbiNKdv4v8hw3nK9HwhKncxERNyQKetKL2TR6oXtEKqwTlzMuuFI3to7DiMXe7acTSa6X90+S2Rxri64rwFl+BA+/Ly7/dFobBm3JlEXk7w0h8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9c27f92-9bbf-9d21-b3e1-f4985a29652e@suse.com>
Date: Thu, 24 Feb 2022 14:02:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH_v2_1/3=5d_x86/PoD=3a_simplify_/_im?=
 =?UTF-8?Q?prove_p2m=5fpod=5fcache=5fadd=28=29?=
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <0c61e460-122c-6486-00b7-22a9a24ee1fc@suse.com>
 <d60d879b-faa8-415e-cffa-c7e05da2814a@suse.com>
In-Reply-To: <d60d879b-faa8-415e-cffa-c7e05da2814a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b0a494c-c7a8-498f-5061-08d9f795e49f
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2225:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB222562CE54E541874902C82DB33D9@AM4PR0401MB2225.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QpT7W/h5KLtE3HcfTbNhkiLXuzejGggL49Jf8bXVmIUAXbtbEsPprwedgmqkzbNktKcOUCLXGs/Dz7e9/VAWV8cQE1Ds/kzYnypYUO8a7eZOAY63qyA6jrIIMN0bu89gUJACtyLL6+OqCNjRKQubaIhkZTOby0tP2B9lXc84KBByMndBoTT8JnvB1wVpfe1yWHwYFmFdtmPTJPlHMewRqbNoYyQ/WiwH3IA4XO3Fj7Sk1xnObhq+cy39FpfLX9GyNnTjOVrvoWG7wLaQOyRoFu9WtnL7rEkVa/l9CvSt8/m8d2JtIn50NiDyvJe1OQdRCbcxPNpYB7nTQsYqlF/89CXiDjrW73OlVLNL+7rwHxcVsGxGhWG9HwwakMufnYmN/cpC8eVkeSr6dyoj5MiklEhabfUsDqJTbfeO1Yxj6lKZRY2qnPOxYgTv8biTxJv9MusFH3P/ZmzgCeVu7Y4rk2PytjiVL/kQsu1ZNztQXaprqDRPuvz3aFaGNxbtzsbYogR+rmcKKT1ut2ebrc7ti9Z0u3sOWde4uENYa5hAOoXZkm4E2djvhLZ5sDUKpl44Xr5w3HpUOPQT1GpdjDAqfDSPOuZoiwZG6preoJfVTlkXtLXSoddYesponaXwEIJkEhxjvN5sachesx36PRWjTevl7QW5gHeBHUwYKqmXd5VRn/AnZtz9g9FpKKjcQBV4bnnLPBX/1wJPi2AxWSdqU6yAPqcxFqV/G2We/kfGZ1qNVmzss8Ua06v2IVoSYTfK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(6486002)(26005)(86362001)(66946007)(83380400001)(31686004)(6916009)(54906003)(2906002)(66476007)(66556008)(4326008)(53546011)(36756003)(31696002)(508600001)(8936002)(5660300002)(6506007)(6512007)(38100700002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFdSbmFTZWp2RmI5YlczOGxiSGlKbUFEcXhUZjV2VE5UZjI1Q0pIcWREWGZQ?=
 =?utf-8?B?L2RSdDVZaHg3Sm5lbVhjSldCTGI2bG9RS2J6bHFOQzl2MWhOdUNNQjBYdmtH?=
 =?utf-8?B?VVdnV2thNlFOYllVdkxZajA2RDBva2xSRitNeGFpT3Y4UjhieFE2RGtNQ2dh?=
 =?utf-8?B?KzhNbGVTTjI4cTVKbTFTL3lOUWZJcWZhZGNrUzUvNUR2RHNqUlNGVkRjLzFV?=
 =?utf-8?B?YndCWTlsZWJ2V05ESDM5RXNENk5JUE5EUVhocVgvNXZMUXJjcDNHcEJUakNp?=
 =?utf-8?B?cWlJaTljTVNGeW9Dcm5tSVR5TW9MUmtKV2I3Yldjdy9IaWY2bTcvU3JuQ3Mr?=
 =?utf-8?B?U1pHQkxBbHIrS21aY1dCQzErY2FaRCtxdWsrT2JBNDQ1ZCtqZXNsc1EyYWpr?=
 =?utf-8?B?L2s0c0VrWmJnRU4ySUZGWmJQbG9PaXZWNVhJVlRBYVZDdmdMTjcvSENuQU1Y?=
 =?utf-8?B?ekxIQjFNcFJoenZxOEhBY0RBdzBaQ1NRQlQyaSsvT0NtcnpXb2ZWNTRhM0lK?=
 =?utf-8?B?WkVOU3MzNkFBay9MVWUzd25FS0NWV0xxRndiaTlZOVVPNFhRUkdneHBtcHF6?=
 =?utf-8?B?UjZmVEFHemlnWFlRUWZVMGZtZTM5TmVkaVhhSGVNemdVckQxM2ZuRWtJRTk0?=
 =?utf-8?B?Uk10bHloZjE3SEVoQkphL0hpYzJtNnArZkZneHo5WFhiNTNWTjNmN2FmVUww?=
 =?utf-8?B?d3VOT0V4Rlphd21sS2gvRXQrKzZ1blkxT0oyWGFQaXpIeHZUVnRJZ1YyVWRI?=
 =?utf-8?B?QjEzTGk4QzN4WE1XTkhiWGZEUVNEV29CRWFNTk5lb3g2azd6eExPelZaVEl5?=
 =?utf-8?B?QWZ6am9tYzZHc0x3a3BvSXJyOWxjSk9TeTdmRi9Rc0JqUGJqMllzTEM1OEpU?=
 =?utf-8?B?TmdmaWZaL215Y1NEcVFVdVVpYUp3a1ZuNG1ReWE2d0pWaXZuc2lFT0FiNmpI?=
 =?utf-8?B?bnJFb0FEZ3Y4ODVmTHdzRHRwT1AzcVJrQU9RVW41czJLalRHVVlTdmF3ZWF0?=
 =?utf-8?B?SXVsejBHZnpzUFZuQ0s5MnhROE5SYTZjNjd5MU9BZmgzNHl3MGRKUkdkdmZL?=
 =?utf-8?B?dmliS0ZCUDJZc0Q0aW5aejJjc2hPL2QxSGZCNHpjcnQwdmprZnUwN3hxTHRn?=
 =?utf-8?B?THdRays4R08ydTFKZS80R3BTajVmTHVBTzB5S3M0dWtqOWx2VkFtNkdlRW1r?=
 =?utf-8?B?V0JsTFRLUXJiWHpVbWk0clI5SnFGa2ppTnAyd3llcGtpN2g1QUhYaTRkL1hG?=
 =?utf-8?B?VjVwOS8vRmZDN3BsdVFEL0hON25PRGZudnRZWTljVCtHSHFKa1VQVlA0Nlpp?=
 =?utf-8?B?QzBLV25iRWJHZStYL0UvM1dpdEVvcGVObm16N2VSeVJGbjJvTGRDWGlJK1M3?=
 =?utf-8?B?V0tDZWpIWTJ5MjdJTVArekp5ZjBMY05iSm84MnRLWjBOMytlNHJtVVAyT1l5?=
 =?utf-8?B?YWZpRHJsVloyZGl1NksrSGxOd0M3ZkVIOTFLQjZteDBVNGdGWWpwR2VQMXh1?=
 =?utf-8?B?dWFhSGRQQkZLTGRpempQa2F1MWZwMmc4T1lsREk3enpUS2VtbDVLQnRKQ2JO?=
 =?utf-8?B?S1NubS83NmJkYXNPcVdZRTRGK2t6K0RJRjBhamVtb0ZrRk1aL1ZZaWo5c0dn?=
 =?utf-8?B?b3FXZkZETXQyTGhxQWZYVEJyNVJHWHJWQVJlSGhaeUx2US9XV0tBUmJ0L0cy?=
 =?utf-8?B?dnNNKzlORk1FZTBBdUNxSEJuRS9LU0lnaFN4Y0M4b04zZjNjYnZiZzU0WUln?=
 =?utf-8?B?YTQwY2EvN1VuVFZzN0hMVE5aL3ZoSnFkSVlwbWk3Z2VFU2NCdllGUDE4NVo2?=
 =?utf-8?B?Q3BadVJ1akdsam9HM2hPS1ZDUzJyMjUvUlBDckljcjVXeXZQdmdFK20rOUEv?=
 =?utf-8?B?cXR3eGdtZi9XYXBGL0R2bTlOcUVjKzZjc0hVS2ZTS0dSeHNHZzcrUTFUQjQ4?=
 =?utf-8?B?T20vODJnL0Z1NHJ1bERJOWxtTGtxV1kxdVE0c09OdXZqRG4rQ1hmRHpZcXln?=
 =?utf-8?B?ZTF2ZVN5aDI1aXd3TzN0dDlMZGFxRVN0NGJsOGJ1eFlUTVY1UWkyaExDNFZq?=
 =?utf-8?B?YjFaNjNyRDRaU05XdFJDMGRjZVREMnI1akl5OTdBRE12ZldBKy9YOXZDaXYy?=
 =?utf-8?B?bE45dWlBQ1RzbVFDMmZkOGFQRDlZUUJwZVArYkloWGhma2lxMlJZTWwzL2d3?=
 =?utf-8?Q?lGDtsgVf2PDqAO7m9Xhmxxc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0a494c-c7a8-498f-5061-08d9f795e49f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:02:20.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /knJe35nCtrDoEjR7jO6K657Es68HmcCWasS4mbb4xL63onWQHV7sLauYDurPbqOkXYcw8+v/iHFuc5kbM3ZzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2225

On 27.01.2022 16:04, Jan Beulich wrote:
> On 04.01.2022 10:48, Jan Beulich wrote:
>> Avoid recurring MFN -> page or page -> MFN translations. Drop the pretty
>> pointless local variable "p". Make sure the MFN logged in a debugging
>> error message is actually the offending one. Return negative errno
>> values rather than -1 (presently no caller really cares, but imo this
>> should change). Adjust style.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Return -errno. Drop exclamation mark from log message.
> 
> Ping?

Another 4 weeks have passed ...

Thanks for feedback either way, Jan

>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -58,34 +58,27 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>>                    unsigned int order)
>>  {
>>      unsigned long i;
>> -    struct page_info *p;
>>      struct domain *d = p2m->domain;
>> +    mfn_t mfn = page_to_mfn(page);
>>  
>>  #ifndef NDEBUG
>> -    mfn_t mfn;
>> -
>> -    mfn = page_to_mfn(page);
>> -
>>      /* Check to make sure this is a contiguous region */
>>      if ( mfn_x(mfn) & ((1UL << order) - 1) )
>>      {
>>          printk("%s: mfn %lx not aligned order %u! (mask %lx)\n",
>>                 __func__, mfn_x(mfn), order, ((1UL << order) - 1));
>> -        return -1;
>> +        return -EINVAL;
>>      }
>>  
>> -    for ( i = 0; i < 1UL << order ; i++)
>> +    for ( i = 0; i < (1UL << order); i++)
>>      {
>> -        struct domain * od;
>> +        const struct domain *od = page_get_owner(page + i);
>>  
>> -        p = mfn_to_page(mfn_add(mfn, i));
>> -        od = page_get_owner(p);
>>          if ( od != d )
>>          {
>> -            printk("%s: mfn %lx expected owner d%d, got owner d%d!\n",
>> -                   __func__, mfn_x(mfn), d->domain_id,
>> -                   od ? od->domain_id : -1);
>> -            return -1;
>> +            printk("%s: mfn %lx owner: expected %pd, got %pd\n",
>> +                   __func__, mfn_x(mfn) + i, d, od);
>> +            return -EACCES;
>>          }
>>      }
>>  #endif
>> @@ -98,16 +91,12 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>>       * promise to provide zero pages. So we scrub pages before using.
>>       */
>>      for ( i = 0; i < (1UL << order); i++ )
>> -        clear_domain_page(mfn_add(page_to_mfn(page), i));
>> +        clear_domain_page(mfn_add(mfn, i));
>>  
>>      /* First, take all pages off the domain list */
>>      lock_page_alloc(p2m);
>> -    for ( i = 0; i < 1UL << order ; i++ )
>> -    {
>> -        p = page + i;
>> -        page_list_del(p, &d->page_list);
>> -    }
>> -
>> +    for ( i = 0; i < (1UL << order); i++ )
>> +        page_list_del(page + i, &d->page_list);
>>      unlock_page_alloc(p2m);
>>  
>>      /* Then add to the appropriate populate-on-demand list. */
>>
>>
> 



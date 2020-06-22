Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0F20321F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 10:32:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnHrX-0005NR-No; Mon, 22 Jun 2020 08:31:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnHrW-0005NM-9b
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 08:31:30 +0000
X-Inumbo-ID: c186dae8-b462-11ea-be4b-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c186dae8-b462-11ea-be4b-12813bfff9fa;
 Mon, 22 Jun 2020 08:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDgYWfQE2km+PJgZcpWkrua+galLBdruqY10D0Yf8q+zvCoz5Hy7Itg7BHb2CK02iWBV0cAeTbJQucrR6GgEMq2nkInhebA0LYlPTDWcYLrBEZ+Kt7hk+aYXski56buQznYSaKeEkE8TohFbC1ImRJNIFo540kGQiGpAsUWJdrwzI+P6UIbK1mj2lTtT5FXeOL2m3FYvvIanBq0sBbpP63uf4qmtX/eG3KlJhwpnR0aAtpDwC7gvirCnnO/PFUiyOa97gQKagiyKNz5jFYJNbP4FIw7JkEByy/WfeBqhDYP7WT/tONCtDn5xEkg/G4xvGHj4i44NxXpvNXzkibnlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25ytYj9uCGoj+ojl69tAQKmC4JucJCp9GoThbB8TDmk=;
 b=jWb7S5WLybFNLzo3oIUrmZajuP264eQARRH1jiEESM5C5CHW1zQTEoVAVVoKRtZ/ZMjkfAqEIHD/NB+e5kAlupRYviwtojiNBWZe2KpeXgmgozW5Lg4KsLUp1bhdxEEtZ/tmdVCZPLU4ZeMwHzjYyFlJjdyE+jTD9Hl7Vo5FrbUB9+tGEkIHH6o88QfMGl4K/SLrWWzuWG4Xf9kI/48MQ+i6jClOUeIgExl+b2naz4pYBPfRgdYN9VENJDgt0/qdRuCyDzMsug2IivaO7D3u3oz6enQOMVnzyvmIn8O0a6Unzk4xIw1/L535cwy9Hvef0hERn+UjY2qousGU58Tagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25ytYj9uCGoj+ojl69tAQKmC4JucJCp9GoThbB8TDmk=;
 b=MOixHdnaTXOJi6PNKXhANOQdRGs5VWrpsvA9h8UZ1b9A4vQegXehXegm4XZo9R13fAVItqiw23/3OoSQ+C43TUMrCYAyLIWgWK33PZBcUdN1DSRy3W+O+Dn9UpdVCMZ0h95CsdZMkdpeEXsUPL+H2KPG7FfauuCaNGXbDwkPrDBD8xWXpLbMKIewKcrJYB3tomqBvgssSoROqJAqJdHHOjc0l1P0rnnyIrEGSkGVySJbSSF67OrVBBZWI7Mf4b/s4jlELNMYQ8Un8ZwR2/dWtlNUi6ZbQeWREWQmiQHwIH0l5ZWXRDq6VcuN3FlbIFOiX2hIZVtSJMYu6WLJ0SYiSQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5454.eurprd04.prod.outlook.com (2603:10a6:803:d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Mon, 22 Jun
 2020 08:31:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 08:31:22 +0000
Subject: Re: [PATCH v2 3/7] x86/vmx: add IPT cpu feature
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <626789888.9820937.1592523621821.JavaMail.zimbra@cert.pl>
 <20200619134452.GA735@Air-de-Roger>
 <222341136.10901881.1592794156165.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4dc53352-3936-efc8-c21c-54053fe210f7@suse.com>
Date: Mon, 22 Jun 2020 10:31:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <222341136.10901881.1592794156165.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0077.eurprd02.prod.outlook.com
 (2603:10a6:208:154::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM0PR02CA0077.eurprd02.prod.outlook.com (2603:10a6:208:154::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Mon, 22 Jun 2020 08:31:21 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5562369b-e065-40f8-4ed4-08d81686a4b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5454:
X-Microsoft-Antispam-PRVS: <VI1PR04MB54541AF4EADE1DF5A796C406B3970@VI1PR04MB5454.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxKa5FC3w5J5LCdNJJoVhjtgrScYgA49FfJm0x/9uGsdP2/QSoJ5FnEpH/NdXki3S8gMSz7lAh0s3LCQAOgqJ0N6LKqhAjyeDb7Eah8/rYC+4amEqAADiCmA/9+2DW15MT7MB89CDlAWiLFz45uCNVmuUYLsBvYjqE9GVf1zoSHIRsL9FBlLgAtlpEa+Vcur2U91/u9x/spGyEXIHSuXQMRAHNmpexQ5xiqhHuLT9+WAzr9PFEJe/5vZXJfleuviq5908tFsxzl8obQmHwDjh+1FZW+afuYrvRI2O0ux58gWT0Ep/Iby5ZVRxzb0c25zHvafqE6x8eJwXxbf6KLGgBeafdZcHH/AXjxvwJ30hNXxlQH1NQ/TVBGkkbnguPMsdflNv1Hwl+SWnwl7IJlbtg6h/g6MaPRbuTvNwnep77f5B+q01qH1nfKmtBNBJR0FBc8s5uPW4ZT/VTkh+MctUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(39860400002)(346002)(376002)(366004)(2616005)(66476007)(66946007)(66556008)(31696002)(26005)(6916009)(6666004)(53546011)(956004)(6486002)(16526019)(2906002)(186003)(86362001)(36756003)(478600001)(966005)(316002)(16576012)(52116002)(5660300002)(8936002)(83380400001)(66574015)(54906003)(4326008)(31686004)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xtRGtJRypGnrGYA9B/7Vv1sfZCxXgRkxJ0WmK/1KoCqnSoWKgz4ItZqT//SsV++ueSZ8edeAII5HFhzaQvSHzTS812gPtHHCAADuRM4sUQLcnuH2vsGmD2kcWx+XW6Wkk5U4CNNMe0cymm8vFlgHUs0ajro7H0k2shk9K7wJEU/OKsL4nepMfkmKjpgtZICL5FVtx/9v8OPkGpNo0vdbDQLCMaNWo0UWDOipEsc7P9jA8J8YbENowNP96MaWS4+XUQMLG3+wWzC/2XMBi5U5PCffA3uAxjUhCx+8S6pPBtIM4cWdoYxMWhYYkbi0+sSLMQcvU/dmekUXlltiOLvovgo2nUdj8ExRh+IlkhR9i5bc5RaRDwKO/WtfyTPG4FEdPnslXG3NIl9vgy4gO+Gn7dHDB++0a4aSilj095/5OHX9ZaByVdDvcfjsnYtfi40/pNHJryDpi1qoqs9jcS0ypAn6CiIkKNB0sVlz69uJzqc=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5562369b-e065-40f8-4ed4-08d81686a4b3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 08:31:21.8807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOdceobeyRxud/ZKnCSQ5c8keNl6PY82M3CLt3lF5P0WJXF9paCl99mrqCb2LJDj8TwQE92zIMDFowL+5Pp3SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5454
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 04:49, Michał Leszczyński wrote:
> ----- 19 cze 2020 o 15:44, Roger Pau Monné roger.pau@citrix.com napisał(a):
> 
>> On Fri, Jun 19, 2020 at 01:40:21AM +0200, Michał Leszczyński wrote:
>>> Check if Intel Processor Trace feature is supported by current
>>> processor. Define hvm_ipt_supported function.
>>>
>>> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
>>> ---
>>
>> We usually keep a shirt list of the changes between versions, so it's
>> easier for the reviewers to know what changed. As an example:
>>
>> https://lore.kernel.org/xen-devel/20200613184132.11880-1-julien@xen.org/
>>
>>>  xen/arch/x86/hvm/vmx/vmcs.c                 | 4 ++++
>>>  xen/include/asm-x86/cpufeature.h            | 1 +
>>>  xen/include/asm-x86/hvm/hvm.h               | 9 +++++++++
>>>  xen/include/asm-x86/hvm/vmx/vmcs.h          | 1 +
>>>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>>>  5 files changed, 16 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>>> index ca94c2bedc..8466ccb912 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -315,6 +315,10 @@ static int vmx_init_vmcs_config(void)
>>>          if ( opt_ept_pml )
>>>              opt |= SECONDARY_EXEC_ENABLE_PML;
>>>  
>>> +        /* Check whether IPT is supported in VMX operation */
>>> +        hvm_funcs.pt_supported = cpu_has_ipt &&
>>> +            ( _vmx_misc_cap & VMX_MISC_PT_SUPPORTED );
>>
>> By the placement of this chunk you are tying IPT support to the
>> secondary exec availability, but I don't think that's required?
>>
>> Ie: You should move the read of misc_cap to the top-level of the
>> function and perform the VMX_MISC_PT_SUPPORTED check there also.
>>
>> Note that space inside parentheses is only required for conditions of
>> 'if', 'for' and those kind of statements, here it's not required, so
>> this should be:
>>
>>    hvm_funcs.pt_supported = cpu_has_ipt &&
>>                             (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
>>
>> I also think this should look like:
>>
>>    if ( !smp_processor_id() )
>>    	hvm_funcs.pt_supported = cpu_has_ipt &&
>>                                 (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
>>    else if ( hvm_funcs.pt_supported &&
>>              !(_vmx_misc_cap & VMX_MISC_PT_SUPPORTED) )
>>    {
>>        printk("VMX: IPT capabilities fatally differ between CPU%u and CPU0\n",
>>               smp_processor_id());
>>        return -EINVAL;
>>    }
>>
>>
>> So that you can detect mismatches between CPUs.
> 
> 
> I'm afraid this snippet doesn't work. All CPUs read hvm_funcs.pt_supported as 0 even when it was set to 1 for CPU=0. I'm not sure if this is some multithreading issue or there is a separate hvm_funcs for each CPU?

hvm_funcs will be set from start_vmx()'s return value, i.e. vmx_function_table.
Therefore at least prior to start_vmx() completing you need to fiddle with
vmx_function_table, not hvm_funcs. And in the code here, where for APs you
only read the value, you could easily use the former uniformly, I think.

Jan


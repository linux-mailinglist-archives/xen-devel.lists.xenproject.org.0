Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07707CA486
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 11:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617397.959948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKFz-0003tH-Lg; Mon, 16 Oct 2023 09:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617397.959948; Mon, 16 Oct 2023 09:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKFz-0003qH-IU; Mon, 16 Oct 2023 09:51:27 +0000
Received: by outflank-mailman (input) for mailman id 617397;
 Mon, 16 Oct 2023 09:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsKFy-0003qB-I7
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 09:51:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ff5e82b-6c09-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 11:51:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8383.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 09:50:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:50:53 +0000
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
X-Inumbo-ID: 8ff5e82b-6c09-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQA+LaaWZnVysgUyfA916AKaIZE7ZDL9Bd5B5edV0612n6GcdPLMJ3dHGv7jz/myPP2DUqXZz/hAxFlYiHLDLI1IMC/yXwjlu/1WsKS+kGrvHjrafjAnHIpnwyPs8xh3VIaix0ZmwRVMNxbnBqHwfcSqcy7zKBIIAOo28LB8qieZRWYk0KnHG4XgwJ31pN9oy7ygVvlVP/Y/pdigsGgXE2e5+uxQSYSY5QapQkY1vQ/Hw24vrrTBidWXj6U/y8gr0RXfnz7SO++sGs0kcjh/gll490W1lhCLDPsPizEF+cRl+cIacSwUlYZY31zd83sHu19Juifbt09oLFPKDQF3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyZMMmHqsmVmtbKO221HB05oUdCWddLylbulPVfTzsY=;
 b=elKyKdHSrvxMaGSFmJR8EI1GqxYu5IBFg1acUCoG+6NwQ4toFl0egF0DGEzfTpB/8bff2/TrHVwHpuB0LmF6+7q+FYbp/zffsFlOEyVww7PPfek/H4Dm5ZFSvRM1Y8+oZnB9Q5V2g2I7cZMsXJaJTpbEaxwTKPRZBS98bF7N0MZf4ah07452Y+iIXm4DYP5SsUvGHMBO79uZxALVItUhNRB8j8ZnUhDKE0D8OeZvLD234YcTxwBSKuO6ZexjQYyM+MqsizkqRyiBaeN8yvjrsk7Gh9b17gBm1ZVW97Ac/ZmovWYFN6s5mPKLVzu7lAen75/eBeK/LhpXytoBvpBaAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyZMMmHqsmVmtbKO221HB05oUdCWddLylbulPVfTzsY=;
 b=u+opWBwAr0adMAfHdXtv/QaK6IcNujwLaCuEp+oGkrvNWC5TUXFaD5kxlPXb+9SSXnKpoKo9qqhpIxOsKZluQ8ArGhUGWQjGB7ae2IMXmHA7dHxurAIb29gV3+xPaWoeCeEsx0yKvMBZDHnt4Ar4O7kizyfGD5+Q1XrYezTXiqu8DyslvZoo9bNt4xhoGnldvPdpwvJisfFHFTC+QkZ/xURyklttgOXwCwVeWbkqdtDGVQuOtV/IlSdbHhynVqlvNEYPEwX/1KUlgGffak1X3tEdJDSNbUZZlW2QwZmFMIYAsA+hw9U2Mnymj1GSvN2ZZZ+nZ44Hk5L/7GzgyidDRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44543389-a750-d121-f6f9-8fb4d4f3a16b@suse.com>
Date: Mon, 16 Oct 2023 11:50:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/9] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
 <ZRVMhdyI8s4chr7b@MacBookPdeRoger>
 <d285a456-307a-0a36-0910-cb80f419627d@suse.com>
 <ZRVeiAFlyf1LJ2qR@MacBookPdeRoger>
 <CABfawhmAZGTaKZfmwY4t8599i6qKaTOJ-fngFmtvS4LhJMh7iA@mail.gmail.com>
 <b05190e0-f091-b52c-7d89-d72bd993fec9@suse.com>
 <CABfawhkK7LVQKhTtCAMpoaGLH24SwpyEAJGpu-PohR5e6W=pMw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhkK7LVQKhTtCAMpoaGLH24SwpyEAJGpu-PohR5e6W=pMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: 6821c569-5544-4483-582d-08dbce2d62e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XjRE9HJzcGf2oePERn8SCumdwJJoUtR1XshAGKAS5i7IECvtrb/GImQsv7XRbram9fane/AUgI4Z7hFSJ4SaHJHsxOUF5vWykQLG05Ki0g3b709HG9lfg6Jbb1SUc2g27lb4tHxE79A6I9IiZtFCc4cZx2yQ66F0PIfDItdcZd/YbN+sC1Fx5ZfxiVRuD2yAPI4nLZYx4Upq4pGyqXIEkX3QhY4QlcR5p2qGPetBjweRCFCA6V3FcM8b34AisxsyO4vxD/iKdIYEG5b+Z6qY+kQgY7+KOXJW4PQRP6oxe3DfSgySUocSDG23CmR3aQafTmtCjOws3dNragek23chDVSVX8CarfQHdna2BsVYUdx5HS7Rs+o/gxDIMZcvX/hXttk/S9yKQLjdE9D6op2kAzwQ5ZjXKrN5srDAbB9OHP/hyMnPTYsAl7ynPLNz/NjopNvAsHbGsbPlB8/32j++nmnHh7RdeXEIPdffaRyvxTIzMTbNE5ZG2xxzQtPP7Fbd8ntiHBIBLQbBrUm18Zeu3BY7o/7L8/vi/w9vVvJEGoONjjqNaZ+C00JDZyCzyzGXlVfZhCVYzWOavN+EwlEl5Jn1BMB/eQ1WFTcZIc8QVLSaRKkqeOsV1jBle7MMIAA482Nxk9ftXzbBvJmXL9IUgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8936002)(8676002)(4326008)(5660300002)(2906002)(31696002)(41300700001)(86362001)(36756003)(38100700002)(6506007)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(31686004)(53546011)(66946007)(66556008)(66476007)(6916009)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1ZaZHFkdU9jRDAxSlpBMjRxaHI2MERheXpoelQrbnlubno4UVhDaDVuRi8r?=
 =?utf-8?B?Sk9hMmJtNmtjeE1aSXV6Tm9qZTI0Y3ZEb3N5alk3ZTFzSzByYXkwN2NiRlF3?=
 =?utf-8?B?RXZ0cnNEOHNiZ0l4bHNWd3RKL2N6NkhST2tXVXhrdmltUFZXQzZTeXo0TzVy?=
 =?utf-8?B?WjIzOE50SkRFWHQ3NGpOdDZuZmxRMHNReXJDOTdZQzBYMldGdS9ybi9MdXEy?=
 =?utf-8?B?c2M3WlgvWXFaQjVudXlTSUdaWGsySUlXVHNOS1d3dEtUbGJvYXdMck12Rkpi?=
 =?utf-8?B?ampsSmhORjdjZnJSdUQ4Nm0yRktsMGFXMVlHcC9YcWhEQkFZeCtTbmthS2Vm?=
 =?utf-8?B?elJHY0JORDVTcTJyVlJ4ekJDWHJOaWdHTStMZ2dBS1lwLzBYcUlhRUJra2dZ?=
 =?utf-8?B?MWhjVm1CVnp0RC9xV256aG94QVZCSWVzS2tvZWFFbnZhYkhiQjhaS2hjbWsy?=
 =?utf-8?B?aDhMb1BNVGFOeVRKSGxjMVM2VXBlamtka0V6ditzTS8xSU43YjhnMjR5bWx5?=
 =?utf-8?B?Y2hjUWJiUGFCTk5iNE5CSU1DU1lPTjNraXlOb25QZ05CbTFRdnlZVUhXVXFl?=
 =?utf-8?B?SXN6Z0thUWg4d0lkeWs1TlkvYmNtbjJSd282VDRHU3hyNjNuY1M5a1pvQzBU?=
 =?utf-8?B?VUwwRzZsTDBVWTQ5TGtraTNzeE9KYWY4WkFTNXFHbWIxbi9BS1dYajh1M2E4?=
 =?utf-8?B?OVF0TElHeC9BVEN2K0NaMTJQdm8zQmJ0Z01jVlJUaGdmK202bitScU50dlZa?=
 =?utf-8?B?R1FjRmJBK2k3cWR6eHFIY0s2MVd3cDJwUUR4WjJ3cHkxd2NROVIrYXBYdm9E?=
 =?utf-8?B?RHFDaEFQaXB5cnJQM3BpV3FMN1ZFc3hnUktCMG5xenBMOTBqMy8rN3J1SFdi?=
 =?utf-8?B?ZzJZM2xiamVFZTBiYjBzc01XRG9oaWtDSDB4RGZDejVWRkdNcWVoVkY3NGFR?=
 =?utf-8?B?TGFQS21SMmIzV2tpVkpBYmg2KzVNWmY5d3g1a25pOWY2Z1JIckpUdmd0OXpw?=
 =?utf-8?B?Yjlya2d5ZFJDVkd1NjFybThnWlQ2VXJyZnV3VmVnMUpRT0p5NllmUTFJc0U1?=
 =?utf-8?B?ZU5LTktJZ3pEM3dEcEwybUhqZzRnR1VQRlRTcm00WFh4emcyMjZ1L0JhU2Fm?=
 =?utf-8?B?b1BpSjBhR0pDNkZSWGtubjE4dGwyditpZFIxOXVIcytabG9zUjJJTjdnbFdK?=
 =?utf-8?B?cjFwbTFicXd3QU1LaG1QSCtBeXBFWGNTbnVTSlVQeDJVejRuczE1SUpwMlVO?=
 =?utf-8?B?YU5zWDNYRjREOTNlS0lwT1h6YlZUVGUvVm93d24wSmw4aWVFRm4yVytIZzB3?=
 =?utf-8?B?UlZGZVZUWjQ1R3JQbjdBOGJBZzF6dkVrKzNoK2J4QUhkd2lDYmFXZ2MwU0ZK?=
 =?utf-8?B?MzZlZnhmZFg0aWs3SkFwK00rSkowMENsK0NvQ0FaeEN2YzNmajFjN3VIdDZz?=
 =?utf-8?B?OVRLNjlKWXV6Mkt5UGZEQXRDMDNoaWRrU01nMlhIVlJYWEM3QzJ6VlMvR2xF?=
 =?utf-8?B?MzdFajBjV20vTCtPWWFBSXVzTFQ1Qk1QUThORHlvdXMvV0o3T0NKNlhZNEF2?=
 =?utf-8?B?c2RtZTlMNU00REpDT1VkTUxTVE9ZZklFelhRazNDMWhRekY2TmxySk9HdWEv?=
 =?utf-8?B?clI3SWtqcXYyaFRpYU5ON0pSbHk5WWVkZ0FyL25IQXA3bnVLK2pJRUZpWE9N?=
 =?utf-8?B?aGVGR3pmK3M4L0tscTBXd01JUkJQMjU5ay9qOTZ3TmxZRHRKcHZXMkkvMDE0?=
 =?utf-8?B?ZTgzSURCVUg1VVJJTHlKT2pWbEhEWDVORjVkZGlBUDAzVTd1Z1dVdGcwdk5F?=
 =?utf-8?B?d0orc3lsc2pZQmNaNFpQcGIvVDMrckdHd2tzb0dDWDcySm5jbklNd08zeXNP?=
 =?utf-8?B?UTNLRHFjQ1B2YUNSMjlKZGhvRGgzQlorb0pvUHgxRUQyNWh2bHdlckJWWkg4?=
 =?utf-8?B?UWwyZk0wblMyM3ZSbjRSTlRxQVN4K2xwYjcyZmVZQitiM3hnYmdQcXlxK282?=
 =?utf-8?B?dzkzdnRVN05DQXpTdjg2YlpHNDM1YVlId2pod3VPaHdaWGM2Smk0QVVCS0U3?=
 =?utf-8?B?bUpJSnlDUkdyMzF1V0Yzc0VQd3psOEErL1FybXNRVU4yc3VsWWlUVFBMaWhj?=
 =?utf-8?Q?oIOvrQrDhdLz0+PgdZ5Co7pyU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6821c569-5544-4483-582d-08dbce2d62e4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 09:50:53.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiI5k092/j8b5v4/1LUKIzq/5juTUoaBb5FDCpHkMD20tG3DbCYPjkSF82JgQYvKdmTqHPe6NL3pwoaPiEeqVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8383

On 29.09.2023 15:01, Tamas K Lengyel wrote:
> On Thu, Sep 28, 2023 at 9:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.09.2023 14:57, Tamas K Lengyel wrote:
>>> On Thu, Sep 28, 2023 at 7:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>> On Thu, Sep 28, 2023 at 12:11:02PM +0200, Jan Beulich wrote:
>>>>> On 28.09.2023 11:51, Roger Pau Monné wrote:
>>>>>> On Thu, Sep 28, 2023 at 09:16:20AM +0200, Jan Beulich wrote:
>>>>>>> +        /*
>>>>>>> +         * Map the area into the guest. For simplicity specify the entire range
>>>>>>> +         * up to the end of the page: All the function uses it for is to check
>>>>>>> +         * that the range doesn't cross page boundaries. Having the area mapped
>>>>>>> +         * in the original domain implies that it fits there and therefore will
>>>>>>> +         * also fit in the clone.
>>>>>>> +         */
>>>>>>> +        offset = PAGE_OFFSET(d_area->map);
>>>>>>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
>>>>>>> +                             PAGE_SIZE - offset, cd_area, NULL);
>>>>>>> +        if ( ret )
>>>>>>> +            return ret;
>>>>>>> +    }
>>>>>>> +    else
>>>>>>> +        cd_mfn = page_to_mfn(cd_area->pg);
>>>>>>> +
>>>>>>> +    copy_domain_page(cd_mfn, d_mfn);
>>>>>>
>>>>>> I think the page copy should be done only once, when the page is
>>>>>> populated on the child p2m.  Otherwise areas smaller than a page size
>>>>>> (like vpcu_time_info_t) that share the same page will get multiple
>>>>>> copies of the same data for no reason.
>>>>>
>>>>> I think you're right, but this would then be another issue in the original
>>>>> code that I merely didn't spot (and it's not just "copy for no reason",
>>>>> we'd actually corrupt what was put there before). IOW the copying needs to
>>>>> move ahead of map_guest_area() (or yet more precisely after the error
>>>>> checking for p2m->set_entry()), and in the original code it would have
>>>>> needed to live ahead of map_vcpu_info(). Once again I'd like Tamas to
>>>>> confirm (or otherwise) before making that change, though.
>>>>
>>>> Yes, it's already an issue in the current code.  I wonder whether
>>>> logic in the guest or Xen could malfunctions due to the fact that
>>>> map_vcpu_info() unconditionally sets evtchn_upcall_pending and injects
>>>> an event channel upcall, but the later call to copy_domain_page()
>>>> might unset evtchn_upcall_pending while the vector is already injected.
>>>
>>> Sorry but I really don't follow the discussion here. My understanding
>>> was that map_vcpu_info, as its name suggests, maps the page. We use it
>>> to map a new page into that position in case the fork hasn't set it up
>>> yet but the parent has one. Then we follow with the copy from the
>>> parent so the page content is matching. If there is already a
>>> vcpu_info page in the fork, we just do the copy.
>>>
>>> Now, if map_vcpu_info does more then mapping, then I don't know what
>>> it does, why it does it, and what happens if we skip it when the fork
>>> is reset for example. Is the suggestion to call it map_vcpu_info every
>>> time the page content is reset (ie after the copy)?
>>
>> The vCPU info area (already prior to this series) and the two other areas
>> can be updated by the hypervisor at any time. Once one such area is
>> registered within a certain page, if another such area happens to live in
>> the same page, copying the entire page again would overwrite all updates
>> that might already have been made for the first area. IOW copying ought
>> to - imo - happen exactly once, when the new page is allocated.
>>
>> As to map_vcpu_info() - just look at the function: It writes to the newly
>> registered area. Even if the function name says just "map", that's an
>> integral part of the operation. We can't just map it, but leave the area
>> untouched.
> 
> The domains are paused (both the parent and the child) when a new fork
> is being made and also during fork reset. If Xen really does write to
> these memory areas "any time", even if the domain is paused, we will
> need a lock to tell Xen not touch it cause it hasn't finished being
> constructed/reset yet.

It's not really "any" time, but "any time the vCPU is (about to) run(ning)".

> Moreover, not sure what Xen is writing to these
> areas, but if it's anything "stateful" it should be discarded or
> copied from the parent because the guest state must match the parent
> after the fork/reset op.

How that? Both are running independently once unpaused, and the data
written is derived from various bits of system and guest state. I see
no reason why the initial populating would need to clone the parent's
when immediately afterwards the data would be overwritten by child-
specific values.

Jan


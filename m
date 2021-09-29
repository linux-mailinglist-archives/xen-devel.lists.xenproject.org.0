Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2341BFEA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198646.352238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU1A-0004bf-7z; Wed, 29 Sep 2021 07:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198646.352238; Wed, 29 Sep 2021 07:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU1A-0004ZG-4m; Wed, 29 Sep 2021 07:28:40 +0000
Received: by outflank-mailman (input) for mailman id 198646;
 Wed, 29 Sep 2021 07:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVU18-0004Z4-L6
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:28:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ec6ee1d-6973-4e3e-947d-c9f6be05151a;
 Wed, 29 Sep 2021 07:28:37 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-VrPEJvPBNCOUaM56QZpXUw-1; Wed, 29 Sep 2021 09:28:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 07:28:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 07:28:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0090.eurprd05.prod.outlook.com (2603:10a6:207:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:28:28 +0000
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
X-Inumbo-ID: 4ec6ee1d-6973-4e3e-947d-c9f6be05151a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632900514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRLUKn+ePbvuD7VZ655+hKZQqJV+M970FDPCaA9nB3k=;
	b=kDPaDwzkqRst4ST64wnkFiXb5MFbcg2OpGuPLpzET/3MZ5hxE58JVGiagGCQeac9ftIYQQ
	G2gxVQ4UyPSNbLoGDFL+PZXy8kJqzSujkgqzTh0HRGAiVJ0JxCEMoTnsxx6u4kS44BQAR4
	HJu0FjcfQKfaZjFsPPtI33ng6Ce9oDA=
X-MC-Unique: VrPEJvPBNCOUaM56QZpXUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdR0GRmXwq9YQtF/hOUARRFdl18IYEeCXYs+zuBvgcUTx0FCDz8viXcjvzWq3fDL36Kk2mDAUIa14quavI3n5V3GGZpmztXz+ZuG32qip5Yxgpdj9Haw5QGr4CiCVkksnQMy5N74bJXyiGT5EaO7zYz4SotQEk+wKDX6EODF3L5RJuR+WLtO5jPdBttgB63ypIVfJkYUR1yeMDVN5WH7ffqNgia5YaEYoqcENtJ3QC1spRTAFUEFh8t5M+FE8kD7EjkhQ+bxnGT/r5c+1pMHZGZMSfUZtgp4IpnMdVnC9oISCCs2/vwtV2QYcYem9+sMDl7uj3eqzu+dTR+jQf1hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bRLUKn+ePbvuD7VZ655+hKZQqJV+M970FDPCaA9nB3k=;
 b=AeS3x7aQ6zf4vJEultWNKNvuLFRyPxCH1bfmPm4JU8FChFXXmpI/LfPExiwxjkfJRPnDxpeCyY9Lb/H4SPgC6jwZMNnP8XLrB5lEjV5F1rEggRB9Sh0bbwKZtjC7wQHDkNeJr8parRRWJXr+Ed77CvA+wNE3qsNxMK+N81idx3uh7cuAlrJG+sFA+JxGkpiCRzUFNoD7m7j9x2eZkIwZ+W0nIWbrs2DACdsxO3z1vtuHVGHWUE6xPTeJ8gc7Tg/GQJxp1HebOp9/Q+nspA9omnnkaXJmXZAMeAjNslVCJMRCcgTF4K/mpq4FnEKgclcbdbEkx7FZJ1IIsHSrGlZVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 7/9] xen/x86: hook up xen_banner() also for PVH
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <5af11027-cf9d-cf78-9f48-b2ce2edd6e62@suse.com>
 <2ded8c58-b9c3-89dc-6883-1794d1c4126a@suse.com>
 <d9b6e98c-4e75-73f3-1e6d-42df300cfd49@suse.com>
 <89cb2d39-2bfc-dccf-8e92-39e4e952750d@suse.com>
 <f613a83c-2b29-23eb-ca78-a8a75a67f651@suse.com>
 <e095eec1-f35b-ca35-9ad1-54c817e61408@suse.com>
 <1bcb3b62-8327-7da8-abdb-65ee965714a7@suse.com>
 <86a4d837-5603-39d0-4643-c31597d524df@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae73b283-fca4-de3f-d654-bde94405e05f@suse.com>
Date: Wed, 29 Sep 2021 09:28:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <86a4d837-5603-39d0-4643-c31597d524df@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0090.eurprd05.prod.outlook.com
 (2603:10a6:207:1::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa44c12b-65b2-48b2-60ad-08d9831abb60
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4607872D28E4A14937649260B3A99@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vGNbndID5ocMMvInaIVxkyEOO8tfOT8ceutK7ahDrmB7zQnoCDiSe0xerqKljEi8e0TfakhOaT40hqH0gDPE/QsNuoIrmftI8PBJP1aPCEiUFc4eJVVCnIF4sQoVOXj0z22WBvayf/3qLMSWRe1J86VJJ2G6wY1i2kmXsXjoJhppw3Wts/ELVTBNOop3lLk3usXFgifaN2t6oH9q4z1MOR6c+tx5qTWNRXDwph3ksL9xr8wyxYWJRAm4JEYeY0Rbg5nmHMduFB8QxVT8+5RqCVHIwNEmdHX9AQDP+ip8WWoZDWlsWQlTqHWlXnjkV9qVAMVQqxADsx7h/EhklpE4lwHvHnhkbPDFnuIizNOPYvYWE98bJnXlWuR9HahWGkOfZ2iIJGznlByqOd1fIQjfB5X79GBDRgVjB2G2b7mup+oLpbHa7EEKG4Izpw2cm7WiiDVNdTWRSRWntaMk86V+d5HSp37WKPPqlQQcec567EIf/h4ZMIcesQroiWr9Iq8otz1y8Xrh/z9FczCF5CXJBC8tsiw9OljChtnkEgJ+ycf3QDvUlDyw38js+R4MDn7dWH/UZZv1DNB/JCIEIbZi0bdpV2pJYjpe3XieV0q72gu7hlVIaQWA7/YlXX1H7uSkOMk/CExyqKbXzy+ng2SmUY1nbkhtuQwE+um2/6kiPCYY9lHKdpufoeXtKNtxcnPEubOZVqLb6fxLAM9bDvKDZcE7AAru2xkH7ANs8Hlhq1Didq3Muznz7V3/dOO/llSa/rQSTwfoWZNFyEg6qAjXp/vXMDGoZoHt5HhFriMb/e8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(6862004)(316002)(4326008)(38100700002)(36756003)(26005)(186003)(83380400001)(956004)(2616005)(37006003)(6486002)(66556008)(86362001)(53546011)(5660300002)(31696002)(31686004)(66476007)(8936002)(6636002)(8676002)(66946007)(508600001)(2906002)(52103002)(158003001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHBiVlFIaE5RM3UxSEpPS2hLTjYwQ0g5N1lNSEhBMkdPR3djU0Zoa3ZFYkdp?=
 =?utf-8?B?R3BBMWRmczJxbTZvc2t0ZUdOdEJHakRwNmtpdmZMcnN4bkFzNnA0UFMwa1hS?=
 =?utf-8?B?WERuRnZzYVQ5UklEOEJNdERhZUFBKzBRYjIwNWExcTZuamNZZlVjbU5GTXY4?=
 =?utf-8?B?bGQ2bVh0Rm5taUZLYW1oTU5oek5QczFvUVQ4QU8xMmZySTZsZXNpbEUxNmdz?=
 =?utf-8?B?Z054TGVPc2t3OEtaS01vUXZqYkFDQnQ4VVBScDhPOG00dTkwRXJlS1VSTjNP?=
 =?utf-8?B?MFpaZWxQaWJFcjkzUUlZZE5FV29PWTRoT2czTWQ4a3g1YnNhdGNaWUVmYUtu?=
 =?utf-8?B?WDkzbWtjRlgzWGg5YXpsbjJJcmhKYnVGUnhpcDJVbTFIVjVGMWJycm5xNklD?=
 =?utf-8?B?SEdlK3kvVDIzTWU4dlVybmJVRys2Z1BqWTBUWmVPYk9tc3Y2QkY3QmxmeTZX?=
 =?utf-8?B?TTRRRTJMWkx1blFRVnc0bUJMaHF3ZGFNYWNjeXdvbFRuMVQ2SVdEWEhveXpL?=
 =?utf-8?B?US9rTThQV0FjQ0pOSG9wQkJCZndYN01pL0hsYTlaa28rOG1EYjJaWVZ0YXJq?=
 =?utf-8?B?ajNvSjM2Q2tabkgvZHhFRW1pQTBQODB0ampuVWVZeWdwK2ZTRWpsTUw5dEZu?=
 =?utf-8?B?MC9YcU9QWTFDLzMvcFpyTXc0Q1gzNG9YdjAxUElVRkM0WndWSWhNaFlzVVF4?=
 =?utf-8?B?RXRSYWdaMEh1MmcrUDZKL0tCTHBEamJqSzdPZFl3MFE0cmRLZ25JVGZ6M0Vr?=
 =?utf-8?B?OGJDcHBZZGhlNXIrZzkvQUxxUVRzNmFvVGd5QWMvMUxmYTRCZktKU1VRbER5?=
 =?utf-8?B?SEhCbGp6aGozRU1Jd2k0ZXlkcjh5WU1XaHg4VjBoTkJ0c2N0cHRiU00wM0FZ?=
 =?utf-8?B?cWpka0poR1A1VkxYR3FlMnZNb1AxNnUvOXh0cldjYkJqdUlBWkVMK3Zhdy9o?=
 =?utf-8?B?M2owb2FObHhiejVDbjhGSU5LaGx4SysxQzJiYnNqd2F2ZUFnUzBMQllVTWZV?=
 =?utf-8?B?amQ2d2YxY2hEbW9nWi9ZaWxsQ1pLYmZnVjVxNWhMeUI0cVFGK2svdlRlTStX?=
 =?utf-8?B?bmtWSEhlbUVOY2N4TjRDcVh4UEttRXFsdTAxc3A5cjF0NnVGclE4OUY4RzRs?=
 =?utf-8?B?MTl0WGVlekxUSGxaa1lRemYvd2JIamhwRGcxeUVucEkwSWFkNzJSR2Z6SEh3?=
 =?utf-8?B?WEl0MTROV2tWK3pFT2xnSW1tYjVibWloYzFTQSs1Q2NsZGdmbTZJSnEzK1ky?=
 =?utf-8?B?SElLSnNCcFdTQkI4WG5vLzF2VXZFTlJYajRlSGEvaTFhRy8vRVk3bDZpalQ2?=
 =?utf-8?B?VjVYeUxaOENIS0lxTXFKRkRxN05YbTBNblc1QlNZZUpTZ2h0dzZZV25JZjZo?=
 =?utf-8?B?QXBYNFVJc3NhaEppditGcTRjV1YydFlxRTBQYlJHemR0S0Z4UnV0QjJMSUtG?=
 =?utf-8?B?aFRDMHRFK2tQdTRkVUFTcGRuRjRsQ1VsRDl3dkRlMmtRSmwrWVhGOU1reDZO?=
 =?utf-8?B?U3FhZ1ZYYkN6RmV2OU0yeCtGdTI0RVplNXlnY3BsaHNPd3lVQklybC83R1Vu?=
 =?utf-8?B?VE5tSU4xazZTT1NnbkFpMExIN04vMUhPRTlPZWRqa2VzMnVIdU9uS0htWjBU?=
 =?utf-8?B?a2N2ek5nQXl5RUdyb0JBa2hFUHdnUkNKYVI4Z3ZOL1dKL2F6emRiZTY3bW9N?=
 =?utf-8?B?eUhQV1MwWXRjTFlvYU8vYnJJZzVhUDJZQWFjRlpoeFpwd0pQQnlaQ3AxV0tp?=
 =?utf-8?Q?OcEW7L/gSBUkJ3iHQ1dLWjooQahiZH1vZxIxOp8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa44c12b-65b2-48b2-60ad-08d9831abb60
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:28:28.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hd1EzYtFh7472YvRbJeUMaojYn1G/CppMPSZe0RrxRy9kxGjVXt2YrM4doVC4qMMFx4Vu7sumNfEUwX2yuRzQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 29.09.2021 07:45, Juergen Gross wrote:
> On 23.09.21 17:31, Jan Beulich wrote:
>> On 23.09.2021 17:25, Juergen Gross wrote:
>>> On 23.09.21 17:19, Jan Beulich wrote:
>>>> On 23.09.2021 17:15, Juergen Gross wrote:
>>>>> On 23.09.21 17:10, Jan Beulich wrote:
>>>>>> On 23.09.2021 16:59, Juergen Gross wrote:
>>>>>>> On 07.09.21 12:11, Jan Beulich wrote:
>>>>>>>> This was effectively lost while dropping PVHv1 code. Move the function
>>>>>>>> and arrange for it to be called the same way as done in PV mode. Clearly
>>>>>>>> this then needs re-introducing the XENFEAT_mmu_pt_update_preserve_ad
>>>>>>>> check that was recently removed, as that's a PV-only feature.
>>>>>>>>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>
>>>>>>>> --- a/arch/x86/xen/enlighten.c
>>>>>>>> +++ b/arch/x86/xen/enlighten.c
>>>>>>>> @@ -261,6 +261,18 @@ int xen_vcpu_setup(int cpu)
>>>>>>>>      	return ((per_cpu(xen_vcpu, cpu) == NULL) ? -ENODEV : 0);
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +void __init xen_banner(void)
>>>>>>>> +{
>>>>>>>> +	unsigned version = HYPERVISOR_xen_version(XENVER_version, NULL);
>>>>>>>> +	struct xen_extraversion extra;
>>>>>>>
>>>>>>> Please add a blank line here.
>>>>>>
>>>>>> Oops.
>>>>>>
>>>>>>>> +	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
>>>>>>>> +
>>>>>>>> +	pr_info("Booting paravirtualized kernel on %s\n", pv_info.name);
>>>>>>>
>>>>>>> Is this correct? I don't think the kernel needs to be paravirtualized
>>>>>>> with PVH (at least not to the same extend as for PV).
>>>>>>
>>>>>> What else do you suggest the message to say? Simply drop
>>>>>> "paravirtualized"? To some extent it is applicable imo, further
>>>>>> qualified by pv_info.name. And that's how it apparently was with
>>>>>> PVHv1.
>>>>>
>>>>> The string could be selected depending on CONFIG_XEN_PV.
>>>>
>>>> Hmm, now I'm confused: Doesn't this setting control whether the kernel
>>>> can run in PV mode? If so, that functionality being present should have
>>>> no effect on the functionality of the kernel when running in PVH mode.
>>>> So what you suggest would end up in misleading information imo.
>>>
>>> Hmm, yes, I mixed "paravirtualized" with "capable to run
>>> paravirtualized".
>>>
>>> So the string should depend on xen_pv_domain().
>>
>> But that's already expressed by pv_info.name then being "Xen PV".
> 
> True. Okay, I'm fine with just dropping "paravirtualized".

Done. Do you want me to also make pr_info() vs printk(KERN_INFO ...)
consistent in the function at this occasion? If so - which of the two?

Jan



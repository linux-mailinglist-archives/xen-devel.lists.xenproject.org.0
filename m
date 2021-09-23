Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95841621F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194461.346425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQhi-0001nM-7S; Thu, 23 Sep 2021 15:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194461.346425; Thu, 23 Sep 2021 15:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQhi-0001lT-3N; Thu, 23 Sep 2021 15:32:06 +0000
Received: by outflank-mailman (input) for mailman id 194461;
 Thu, 23 Sep 2021 15:32:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTQhh-0001lN-6U
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:32:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01735a8f-fa7d-4cff-809b-e25f27363241;
 Thu, 23 Sep 2021 15:32:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-N8twr9TiNfeJGpqMDpf8KA-1; Thu, 23 Sep 2021 17:32:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:31:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 15:31:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:31:58 +0000
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
X-Inumbo-ID: 01735a8f-fa7d-4cff-809b-e25f27363241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632411123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9kXcq69D0bXdw3pbsqlftrpFQJqP372BXXSOWoCFpws=;
	b=TU9Iv1eaZhMcYC5WwTMSC/BQouaVGVApbihssSihtV91Vf8avuw2CG2YP7mWXMeZHeeYf2
	LKitMPS82sDRiM4k8qYjj0NobiScNUCv9ytv07IcL2mWuJ5LeuuUpCL8K6kXgcPoRS4g9h
	CFHhtJEm/ErqVqF7AEaRqYani77YRQI=
X-MC-Unique: N8twr9TiNfeJGpqMDpf8KA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJyMLl9S4u2ce2KlGq/i+WrRjis1fO+Ebw3fJtmyMLNfRMgd55uc2Np/KNSIYqZZIILSNIgaNt2PMuZTC4m1QPN4N4SLVipPxudOT3XSnHgXT2eHs/jJE9DB+zHtC2EYvMGyM/5zRy9VfUDjOWYq+IPwPSX84ZfflgvAXhreQOfTiw8KyJyUwINBObapOfYUnEmXAl5Nhyu8/ITavzaitFJTF3X01OpdfhCUu8bd4ERuFN9EqSDftMdu0TNCyCEXCf4pNT1xu2G/7VfXY+bHVAPxezOKO2lIU2bbBY4d2HnUP+kKz7aGhXjavu/Qxwcw5MacsJmPfSdsVEaWdXrp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9kXcq69D0bXdw3pbsqlftrpFQJqP372BXXSOWoCFpws=;
 b=G3X6L+wGTWRXPIn9J2uT2xsjoujoDFJwbeQZw2E2tTHCkjjY4M3m24Ph4o72EnKX5zaGXHKi2aRljbV00PAtG1tkMBEzs6QsW7WlyAfPSkrarAkNJVZskxgveawTC12Qs7yrZPcjhKQwaYAlDPdXALvnQDha7BA7bNDDJ/y1b2YckvQyFRw9gNlRb5nMDV4mlGTcxHsYijKcmI2x1y0Zd+Oo1GbqTP3phiokMLLbKXhnoqjRcUjc/R4VZmP11tykLZ2BUqAOG3Gg5C8ySjkqfQKt9LLnFOiK6/z3sBfWAx7qqjcVy2tpZj1hUXAOSEOQbe+xrj+NCN9ovC/JKjBJwg==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bcb3b62-8327-7da8-abdb-65ee965714a7@suse.com>
Date: Thu, 23 Sep 2021 17:31:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e095eec1-f35b-ca35-9ad1-54c817e61408@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 416953b3-d528-477b-5289-08d97ea74868
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68637095E69AFD9C149EDAC3B3A39@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eola3OnvjqlASQMzAKxKZClOYH4l2bZejwtY4wYxupTU3tO1BvP+Mv3+yVqv0UHglhBgdIccSV69d6o0xD7B7IvNBkK22fbBLvLov+z5lDHNq05CURSxDJFJka0XsjiXoeOs9qm5joOn6tGzhm4OH02ZL52OGGGo8Lf1W+TIuno8pZTxyzR8qqoTvMmtPg48DfdNsDGgIsfagtDe7u8xetVYBhEZrgkWOujoQ38X+BZQdjUW4GcSZt3fpdqXo8pwdE6mNKfq73AfIrjfcocGw1EWAqaWf33ZiZZNBjZVorPzHPNCtGbYnQ+dPuXQW8ktaIB0yQmQRCcOGWF+o5QsLqkfa367j6m6RkClJJte4V0FvNkqMZ0DZHiRm673/v9f52akoBSbE0/1OZgisVqfWU1yu2y0MewhPUOiheREeOOtvNYbzbCx2wc93Mmym/AuCUC5vL5VCRxP5jimK1ZSXlPEAv3P/8aOESmOT4qtLAMDQxsinY3Dw2qxPmFxtlDHuGpFXuTMyEjeuxUt5naSc8EajqXbJZRcqZfO0CJ4ed5KzPlbrJZiu3H+qBHXHIfFD9O333HBVxZEB/nin9SPd3d+XTz24uI+5N2Nc57MgANPIa0VO7lc54EE+eHUJtW+UXkGYQqhya8OeJI1tR6XL0ec8qn/xHuE59CAITsU8gzDSERZMjQPSLNNYPZrqUAzEPQJqRDHETOuEzacMNdun7oRZZDby8wE6vKcY7I9VFwpqUUtvVs5WFq7NPHBkB9f3DOTw7XR3SVE2f1JFLJRUZ6ZCANUFYaBer0GzAjWnlA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(956004)(86362001)(16576012)(508600001)(2616005)(186003)(2906002)(83380400001)(8936002)(4326008)(38100700002)(37006003)(316002)(5660300002)(31686004)(66946007)(31696002)(53546011)(6486002)(36756003)(54906003)(66476007)(26005)(66556008)(6862004)(6636002)(52103002)(158003001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmU4TnZOTE00NXNrdEQyM1NvZnovR3JTZjgwbEFQZWFSWTc3bXRsSzhidWlz?=
 =?utf-8?B?SWxZMDlaTGk1KzdsZFh5WXlMdjBIWGZOZEFjSk1MZ2g1NDd6bHdNRmJBV0s2?=
 =?utf-8?B?Rzlkc2JXSTk5aWY5TEMrbVN2RExGKzVIQ3hoeC9PSTFnRU9va0V0aXlnNHFZ?=
 =?utf-8?B?ajFkZ3hlMXd6MjhDNjZxWlFjaCt6SmNObEd5RXBzMFFYalUvdkdtbFc5aDNp?=
 =?utf-8?B?K01tbVEzclJ3SVBxS2dpRkJsc1lBOHNBRDhYU1FWR0J4enNSNnZoV0MwcW1q?=
 =?utf-8?B?Q1JQNEhpZ2lSdmtnbTl2eTBNaFZiMVRKbk81QklsOTJrY3o1UG43V1NPMGNS?=
 =?utf-8?B?VHEwZ1ZvWE1jb05xQ1JGK3ZBRWYwaUpwRmIyQ1AvSkR2d0hub0toS1JvMHlV?=
 =?utf-8?B?R2RRSCtjNHlBSzB4T0RGN0RydVpobnBHSTNFVGJBb0ZVYXFlT3ZMVVBBK21k?=
 =?utf-8?B?dVN3cytjdFp5RVpPMXIwZHB5ZkxSU3hFSWlDdmxRSVlKaVNWQ0NSMEMwc0xv?=
 =?utf-8?B?NldGMVNmNTlTd1lxUXVoeTBoYmc5SHFwM3ZoUmEzNGFLMWtjSWozaDlVc2J3?=
 =?utf-8?B?aC9GYnk0b0FKQm5PVWFmS2FIZnpqNnFqblh2VWdvbHhud2FTR3RQMUh6TTFR?=
 =?utf-8?B?UGs0dnY0NFJoTnVDdHBWa0dJQyt2a3JzOEJPTXNyRWpXVUF0cjB4K3NGMkVi?=
 =?utf-8?B?SFB3Zm8zOHBjaFFWczJUcFYzbUxLVEcwYUoxRXR0YkQxTkdtVHF4eWxROXFm?=
 =?utf-8?B?VHNaemFLSWlrNVk0SDRWRFN2MFdONThzMVJDTmxWNTdnUWZ4OFRZTzZlMDB2?=
 =?utf-8?B?MDN4a2tpelcwcVVFZEw3U0x3Y21Mcm52MHpWanA2YXlockYrcy9ZRlZmcGZu?=
 =?utf-8?B?N2FxdFp0aVNaZmI1NmdpUklYTmFSLzBranRLZGxPbS9KQk5Vb2d5T1pKN3pT?=
 =?utf-8?B?WktUcCs5bFZpZCtQcUFTNnc3alJqUnpaTnRvU0RKek5OQi9CTTFVMzEzQ24r?=
 =?utf-8?B?ZDFMR2hVbXNvaHcrRW1VSGNyc1h3M3pydllHVU5kZFRlNElWSEI1NktBUzhr?=
 =?utf-8?B?bTFCTFhuOExYbjJKL2VVNnMrM1NDZCtWbHg3V3pYVGhxQUNEd3F5SUV6UlIr?=
 =?utf-8?B?WFNrdFcvWmpXdVZzR0grZW5kUzJScjBZYnVoWW1HN1lmVmthR3lEektzZVlJ?=
 =?utf-8?B?bkNiMU1KQzFIMFNnQUMvWkt5c2VyeXI3eFV4Z0c1MEF3VldrenhGMGw5MWpK?=
 =?utf-8?B?RnU3eTFha3VRTjZaaFRqTE1UZEE0Z0xMSTg2UjBQR2VOdFJ4azl2ZFFhSFNO?=
 =?utf-8?B?SndveDl4Z2xmRGtFZXdlVDljdjNZSU9FUVFUc2lPS2hJSXpHZVJ5d1lhU0N4?=
 =?utf-8?B?OVluOTRmYUNhVFl3TUtUQ2ZvWTNSTVROTWxBRGpnbFN6USs0TzNqdDhnRVE5?=
 =?utf-8?B?Z0VMQ1lzb0RJaEp5Zmg3U0drVFpPVDRuZ2x6N0dlRW45YmJzUWswQitKTVNu?=
 =?utf-8?B?NWZOQTVQWVN0VnNLOTlxNVVTak1SSFNJSzF5OFlVM3RGUDROWGlWWi9TSkVB?=
 =?utf-8?B?LzBoVWl6VjAzWVgrYTJUUVdZUEEyeFdYZExDMS9YNFBhUnRVSC8zRlFvUlVQ?=
 =?utf-8?B?VHZsL2REN3lLR2lJaWt6SCtEUDNYbUx0RW5FZkVWU2NGbTlVSFRCcVVFRWZu?=
 =?utf-8?B?VWU2cEY5SjhjVFZ1ZGhqMEExVWt5Q0dYWmlZZGVUUUJra0NoaC81TWRKZUkr?=
 =?utf-8?Q?N2skWF7X/M1xfwoMvyk0TScRY+xX2COGtiQV7yD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416953b3-d528-477b-5289-08d97ea74868
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:31:58.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 188gB6kPrY2aEcMVPD2BV3o8uiFr/2HV5Kmev+AYknyl1GYtXsls50A7LqsuzoMnhCG+CdRbMWdmtIM8qGMwqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 23.09.2021 17:25, Juergen Gross wrote:
> On 23.09.21 17:19, Jan Beulich wrote:
>> On 23.09.2021 17:15, Juergen Gross wrote:
>>> On 23.09.21 17:10, Jan Beulich wrote:
>>>> On 23.09.2021 16:59, Juergen Gross wrote:
>>>>> On 07.09.21 12:11, Jan Beulich wrote:
>>>>>> This was effectively lost while dropping PVHv1 code. Move the function
>>>>>> and arrange for it to be called the same way as done in PV mode. Clearly
>>>>>> this then needs re-introducing the XENFEAT_mmu_pt_update_preserve_ad
>>>>>> check that was recently removed, as that's a PV-only feature.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> --- a/arch/x86/xen/enlighten.c
>>>>>> +++ b/arch/x86/xen/enlighten.c
>>>>>> @@ -261,6 +261,18 @@ int xen_vcpu_setup(int cpu)
>>>>>>     	return ((per_cpu(xen_vcpu, cpu) == NULL) ? -ENODEV : 0);
>>>>>>     }
>>>>>>     
>>>>>> +void __init xen_banner(void)
>>>>>> +{
>>>>>> +	unsigned version = HYPERVISOR_xen_version(XENVER_version, NULL);
>>>>>> +	struct xen_extraversion extra;
>>>>>
>>>>> Please add a blank line here.
>>>>
>>>> Oops.
>>>>
>>>>>> +	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
>>>>>> +
>>>>>> +	pr_info("Booting paravirtualized kernel on %s\n", pv_info.name);
>>>>>
>>>>> Is this correct? I don't think the kernel needs to be paravirtualized
>>>>> with PVH (at least not to the same extend as for PV).
>>>>
>>>> What else do you suggest the message to say? Simply drop
>>>> "paravirtualized"? To some extent it is applicable imo, further
>>>> qualified by pv_info.name. And that's how it apparently was with
>>>> PVHv1.
>>>
>>> The string could be selected depending on CONFIG_XEN_PV.
>>
>> Hmm, now I'm confused: Doesn't this setting control whether the kernel
>> can run in PV mode? If so, that functionality being present should have
>> no effect on the functionality of the kernel when running in PVH mode.
>> So what you suggest would end up in misleading information imo.
> 
> Hmm, yes, I mixed "paravirtualized" with "capable to run
> paravirtualized".
> 
> So the string should depend on xen_pv_domain().

But that's already expressed by pv_info.name then being "Xen PV".

Jan



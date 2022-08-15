Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9573592E98
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 14:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387373.623582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYmu-0007KZ-7a; Mon, 15 Aug 2022 12:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387373.623582; Mon, 15 Aug 2022 12:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYmu-0007I4-4S; Mon, 15 Aug 2022 12:01:44 +0000
Received: by outflank-mailman (input) for mailman id 387373;
 Mon, 15 Aug 2022 12:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNYms-0007Hs-M1
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 12:01:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0635b4cf-1c92-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 14:01:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8625.eurprd04.prod.outlook.com (2603:10a6:20b:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 12:01:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 12:01:40 +0000
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
X-Inumbo-ID: 0635b4cf-1c92-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YskZ1acWsFW5YJeKGp8N2knMLff5lDsgZmbW9OzYEzS7FWmAjXGEFU1jqD0E/etCEper5z/m67ijbnkBZfgGoKKtWjmLEWKJAvIjF25oUVZGbV3WXmFXgnIU72+ji0WSQwViDDlNhSw9jIi/x7KYDtXn1Zmm5s439q0tzOR3CtHbviGeb5FssIyyjtiZygR1yVxJf1RcVuur1QkxQQatbqbeBHoWr+TJyo74I1SwVPFTV2eI3IWTDtHODJqnzkwkxPY2FBSLLsiQvSFVdQePRykMVGyY1GHjDQvA9S8K/4eGm+fJ6fHW48OB2ZFoTFKVT2jsErhQHZrQLRVVdA09pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzxEECZE3UQWPRsK0zf6m/AiIGs3nO6FOBvjNy3oJco=;
 b=ZBpadD7pOfmFEaxfyLtxZNuKm7sgpRIIzsT37HfgcR5XayfUlf0gn6zMp3DjqbpcaC0cLMYwZTNGnMb5b4mJp4MKdaZdsY1xngONjL/hEtj4q95VGZuSvxvF/dWBanp+Lv6J8mQycvyykHKfhFEOBG/FV9uf9mhvdzxoPj7PS8v0AklPKkqxw6OkKrGsUAC7Y6hGWj8lAi0FO16RjfYEBDmLvo/WiUh9U/folTvq2zuRPeDFELbvG4hrcYsjyLpRC5nGWBPmogatKzpCWD65n2Vx+dPwCrv1d/1kvzkqxdLnBelLaizzT2O7bM6o+CqIGUBzeR6Y0Oj7QtmXy2mYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzxEECZE3UQWPRsK0zf6m/AiIGs3nO6FOBvjNy3oJco=;
 b=GiVqLt9dkVugLNJxXC+NFj0rX56VmUyah7MsBEfDs2QBEY1W2WGtnkg8oIb51Q0wtWtYaUJ//raeLy6uYrrM+LY2hQj95yZl9McdlBORcM/pEBeCTOH5iQpsq9z7NgBW8RDInftQDptPjC6wt+87+I2cs7qETu5/fA+jU+QQy/fX4t1GOhLAuVIJmeuop0HGRbZJ/fE7fUO6xJ9T10i8eSMqQXkH19kCxKm/mLGOwPPEykdZTfjG/HmMGthTx1K4Vya1jTBRK6umzgEvbGattmHFa+qFIBLd09CmzoF4FApywtZUVAF7ySBK8HFQPONVDIfS2Qt2UUVu4Weow9VkcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f35ad9e2-fb7e-15bc-0fe0-42cded9679db@suse.com>
Date: Mon, 15 Aug 2022 14:01:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] xen/sched: introduce
 cpupool_update_node_affinity()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-2-jgross@suse.com>
 <9abc061b-2d98-ace8-af4b-0881a5737dd6@suse.com>
 <1e86164f-b08c-a9bd-3437-af569342cc1e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1e86164f-b08c-a9bd-3437-af569342cc1e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0964e519-4d52-4145-db52-08da7eb5e9ad
X-MS-TrafficTypeDiagnostic: AS8PR04MB8625:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ueaaaidzXwKGibi3BEdO3Tl52HIjWokVwFDW7Et0wojc8KV8dwWsGEU0jmqzzhE9aXEP7afoNmfXZhF7fFnJVKHXnDEtFvQkFsY6GyHoX1WQU59KgXmhGBPImS0yrtz1f7UwxifeHvtdVL7CGsfJXH8uzsjfoL6tVmFlSw5XgAT/UI3m6VLGO3X80R5Qwew0D3Ls76V3yPSl/mgDv1alYgguyF8XPiLQMtZUyDjAJ1lznMTHokKUFWf/KjvaYFW39LQ+x8UYvFLzPpUsY3KWVjTxbXLYw/TD/6wS734hp7BUdwt7EvwDATmAfZyM1xhh3enU8++GkKTEkAJk2lFYtUVzlKYM0r8jgmxJCAr/b3D7MKRcl5Gtceo4sCIABdUVn+LZzbjoh6a/I3U9R6CpxuryMFPrL1P5ZazLcb1pNm2o6UpvgxlDIDZi9HcfnFFU0fI0N5fnqG+0P21b0/AVQdUMkc5f/Lm2IYkQdcObszMfSOS1lMiSpsLI4njAJbrkXMF/qK0A8r0JEmUPMXpKsbvzPD4GpqPfXcwPuj76CEr8gZWk1HbmxynN3i7xcwosh45xMkt5Xa4zc7cPuK9GaI6HnzFUy3oEbsktPTOP9bN+yXJ/UwpnWfonCOtQBiXUhdEZVtfF5jxpMzHgsr7HB1Z8kpOYptjat7bLy1axalmky9L3pthKkAtlItPi/NmmazKkLXdPn6hMVydRY2N1z8RaAG/941wxy32Zbev99nlRRtjWXgI7/R67pvmYKNhDo2NvuuOlav1QAvzOlkqPVJZ/A84ZmNboIzGVw8Ld+t6XyKxKVk4UXgZkLselUvxQtNnjMYys8ZBtMn8oEm2k4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(346002)(396003)(39860400002)(38100700002)(31696002)(86362001)(316002)(36756003)(66556008)(66946007)(66476007)(8676002)(4326008)(83380400001)(8936002)(6506007)(6486002)(53546011)(5660300002)(478600001)(2616005)(6512007)(6636002)(186003)(26005)(54906003)(37006003)(6862004)(41300700001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWI5bU4rRURpd1JjdHhlYTNOV2ZIbjBNRUxTRjhRQmRRQ2xJS1ZERHBRTXFT?=
 =?utf-8?B?eS9Wdi82elZTUHZ5emlsd3I5RlFwcVVpRlVhL29CekEzVXMwbUhmSDZUa2pQ?=
 =?utf-8?B?bzJWcWpkcXdaSTlYRGN5QncwdzZ5eEFlTm8yMFcyRDlGRVNzK0FtNk5CZkhY?=
 =?utf-8?B?b0d0MGNCcXQ0SkpYbmRlVmJkMHJ6aFI1U3hWbmVjS1RISWVJMlpGeG9xdjdD?=
 =?utf-8?B?bzVnR2cvbk9CdUVSRE5RTTErdm1nTEpGL08vSEQ3ZE9kL05CZTVqV3Y1RmdW?=
 =?utf-8?B?VlVuaWd3MnhvN1Z3b1c5QmtxcExJcWs3RUgwWGlRb2Y5dHZ4OTdyTjNzSENW?=
 =?utf-8?B?Y1E1ekpCQ2lkQ21WSkU4RjkxSmZ2RnBIeEFJdjU1SUNCTDlITHFZTnp6dU9p?=
 =?utf-8?B?SWZObmFueFRnWnd4WGtxTm52a2lHR1dPaG5kdm9zblRRTkxvVzZsUFJTZkxQ?=
 =?utf-8?B?UHJaWGNKVldyL0JhZWdJSjZNQkpSVFJKYm12cURGS1dPTi9pV2lQVzMwV1lC?=
 =?utf-8?B?Mml0T0lJcDg1Vy9YSGdnd2RXcDFkeGlkaWFmWTlIRkJhTUJzNFdVcGZVUWhp?=
 =?utf-8?B?TUQyRTlnU1I1ZlNLMzhubW1md3ZLU3FiWjBmQ1UxbXFsUTJWcG1NaTNwclE0?=
 =?utf-8?B?ZSt3NDBVc25XVXROUzNLcERJaDdIUVpCd2tqTG1HdW9QL2wxNzRQV2hOeFAr?=
 =?utf-8?B?SXYzNHlUdXFQcVo5aDQ0MkJzcitsSG9ObGU3S2pkUm5McXNsdVZXdCtzNXMr?=
 =?utf-8?B?KzJlQTBJV2RVNlJueCtnQ05zcUN6dnVXR2crME40VkZ1Uks0M2lWMjNtUnpO?=
 =?utf-8?B?VE1zcFdlNEh4MTVBb095bzJQVHluVnRHcmJkeUZya1pka3Z2dUR3M1dhN1pP?=
 =?utf-8?B?OUlKSXZCcHZrQjY4UENCcmxqRGFVTTFqSTZNWjhGUWQxVzFObkFlNmszaHJw?=
 =?utf-8?B?T2ZFYVN0SDJBT1BSTEY4ODFZamh2TjFqZXViQ3BkMm1TOTVLclJhTmd4SDNm?=
 =?utf-8?B?WEw0Vm9JcnJkQWhWMUZ1Tk4zaWd1NWZpaS9ZMStOeUozY05Jc1pRN1B4Q3BR?=
 =?utf-8?B?eU1Fb2pWT2NMWUhWYzZUbEpxeU5wcHQ3c3l5RU4xaEVyS0pjSDhhcTFSK3RC?=
 =?utf-8?B?d2x2TGtWSFBsREZYNnAzNGQ3emtlSldOK3RUekY0R2ErYTBpb0JScFBTOWg1?=
 =?utf-8?B?d3VzaFpOYkhHSUV4UlpvNk05UkdISVRoR1JxTlQ4ei9oYWoyL1dVM3ZhdEJl?=
 =?utf-8?B?VDFZazhHUzBsbmpPd01SYmNXNUFSSkhkNjhUTWx2SmJ4Q2hnSVlZVmc3NUpS?=
 =?utf-8?B?V3VzNThtek9FNGNwMXRlWU53ckNMQUpGRGp6aGJMbU5EREpvQkJSM2hWU2di?=
 =?utf-8?B?d2xmc2trdDhLVXBDSHl3MVp1VWswVUc2M1FBblBvYWJRRWhxVVd4WCsxUTRa?=
 =?utf-8?B?bXo0NHZFZm1TcDlhYm50YUxKTWU4ZFIwVklWaHdZeHBrMGsyWVNicERFdVBp?=
 =?utf-8?B?NFZ5WmRXRXI4ZTZOTG5wK245MldZOUNOcUtYcHdvNFlaVTVUcEdMd2hIeHY3?=
 =?utf-8?B?a3V1c0RnWW5BMW4zeTZnQTFaSUtsTyttRktkdDAvbUV1V08rZHhjUGlMNzBt?=
 =?utf-8?B?UWVSNVVPdGdlR1V3UmlObGVEekFsSzFJdDU4NlRpMUJ1d0tFSFUyRnhWNVA0?=
 =?utf-8?B?YzNpNjVOZVZQbXRkL0F3ZUhxekhIVU9GTDJ2SnVEU0s0RStFcTVVNkpyR3ow?=
 =?utf-8?B?WXAxN3dzVy9XRkFNbEs5NDdJWlZkKzU4OVoxWFJXU1lsOXNaMWhXWUxna0Zj?=
 =?utf-8?B?ZXplTXJuMlhIUEtwQ1RKMHN2Zm9oWWxnUERWampNczk4WWtvT1ExZkFVS3o5?=
 =?utf-8?B?S20vK2tpSzFoOXFueDMwZlc3eWNsNGVncTg3TCtkTHY3TFNXUkZCN1I0L3gx?=
 =?utf-8?B?b1VCdzhrNjdBUm1pTlRFTEI4R2dhc2h3YkN4eThPUFBZWjhmcnVqWEt6OFZi?=
 =?utf-8?B?SUROTFdMeFdMSmJGNGZhdDZNWmhoQ1U0WEdxd3g3akNUdlFld1dOU3UyUGtS?=
 =?utf-8?B?TE5LWXZzMXp5alhEODF0VExuNGt0NmkrcnhCK3JJVlFrSzdyeUZrdjdCcE1N?=
 =?utf-8?Q?YH+SGuq1HI7PhbxOG0P2Pe5PU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0964e519-4d52-4145-db52-08da7eb5e9ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 12:01:40.2105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H33SzcPToWhKeUeb3nvDWyoUP3pNq7drbKRhpCVtd7mXTvfTbsdimLcJgfnaITYlpMVJ4KPWIZQaNlga3lYm/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8625

On 15.08.2022 13:58, Juergen Gross wrote:
> On 15.08.22 13:41, Jan Beulich wrote:
>> On 15.08.2022 13:04, Juergen Gross wrote:
>>> For updating the node affinities of all domains in a cpupool add a new
>>> function cpupool_update_node_affinity().
>>>
>>> In order to avoid multiple allocations of cpumasks carve out memory
>>> allocation and freeing from domain_update_node_affinity() into new
>>> helpers, which can be used by cpupool_update_node_affinity().
>>>
>>> Modify domain_update_node_affinity() to take an additional parameter
>>> for passing the allocated memory in and to allocate and free the memory
>>> via the new helpers in case NULL was passed.
>>>
>>> This will help later to pre-allocate the cpumasks in order to avoid
>>> allocations in stop-machine context.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with the observation that ...
>>
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -1824,9 +1824,28 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
>>>       return ret;
>>>   }
>>>   
>>> -void domain_update_node_affinity(struct domain *d)
>>> +bool update_node_aff_alloc(struct affinity_masks *affinity)
>>>   {
>>> -    cpumask_var_t dom_cpumask, dom_cpumask_soft;
>>> +    if ( !alloc_cpumask_var(&affinity->hard) )
>>> +        return false;
>>> +    if ( !alloc_cpumask_var(&affinity->soft) )
>>> +    {
>>> +        free_cpumask_var(affinity->hard);
>>> +        return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +void update_node_aff_free(struct affinity_masks *affinity)
>>> +{
>>> +    free_cpumask_var(affinity->soft);
>>> +    free_cpumask_var(affinity->hard);
>>> +}
>>> +
>>> +void domain_update_node_aff(struct domain *d, struct affinity_masks *affinity)
>>> +{
>>> +    struct affinity_masks masks = { };
>>
>> ... the initializer doesn't really look to be needed here, just like
>> you don't have one in cpupool_update_node_affinity(). The one thing
>> I'm not sure about is whether old gcc might mis-report a potentially
>> uninitialized variable with the initializer dropped ...
> 
> Hmm, yes, I think the initializer was needed only in V1.
> 
> I guess you could remove it while committing in case no respin of the
> series is needed otherwise?

Sure, I'll take a note.

Jan


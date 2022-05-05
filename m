Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E0E51BAFE
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 10:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321855.543003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmXCC-0004nj-QN; Thu, 05 May 2022 08:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321855.543003; Thu, 05 May 2022 08:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmXCC-0004lE-NO; Thu, 05 May 2022 08:50:48 +0000
Received: by outflank-mailman (input) for mailman id 321855;
 Thu, 05 May 2022 08:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmXCB-0004l8-Pu
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 08:50:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7414b1e6-cc50-11ec-a406-831a346695d4;
 Thu, 05 May 2022 10:50:46 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-wir383SwNpOQVknM7N4V3Q-1; Thu, 05 May 2022 10:50:44 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5752.eurprd04.prod.outlook.com (2603:10a6:20b:a7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 08:50:43 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 08:50:43 +0000
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
X-Inumbo-ID: 7414b1e6-cc50-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651740645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ak6H5CiI3ws0MkhZrIndIX8PvuJbEqaZ1rfQvkSoe9A=;
	b=jW7a25BZlEXdlzzEpYWzurw0gLEobJ2XRF7APiUSnoYUGYum+zo+VBHk7RJeoAFZYMUHo9
	vd/dKzItZTZ8AIGayWjS8XKvEVNSnuXlrAttuGy2glixVb3YbxBZGczH1rpTMAiYIU0Q17
	getVNM2t7NuvE4R+qgouojHrR4L2AAI=
X-MC-Unique: wir383SwNpOQVknM7N4V3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnnO6GvbIAVA+bHTFM6bZQGhG79jVqMQdBL9jASfY1pMZ4hleDRbkdkiLfzuLL+S8vdT96f+tDy4sC/0+TGe4Q1ItGkhwuxNJNkKUJtW9T4VUuD0JLFMHG7XOYbd1vwuq7HWv6IzcrOmtA2KCh30MRv1uauMoZJR/v7Aj7DfBUmekZTT3NIxkI5iYd0GETfbd51S0Ytw6ELpCSP+YjVdRN6BQWE3Kjgh/4UTbFf5kdhnbBkSPZiKJxmWF/iDPLjWLxCLk7FPGiSJfpbvpxB6WoS4Ba4brxxqCIud6Pnpeq9k48AzaWL/7p1/u0m2vWkognz8/80SMq8c1bZc2kyq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak6H5CiI3ws0MkhZrIndIX8PvuJbEqaZ1rfQvkSoe9A=;
 b=bBMjBHXKk3JkhY8Wj/U/zjmYs3MQxMMjINL0gSZuiFGGVXjpG+yu+ekSI6NHTTOyCco1StZfi2Cr1Q1MbGDt128v7IHW/jFf29LKHy0uxWCzx1dVOhY8KqCpgZ/QRvTz81z4rgamgt5oxfKwSuqn5aH0p+oBpHmrx+bPR4cmp0BmsoSiFJvG4NiKuu8WGb6kAA6EnMcpc31ghDo+N4aK+mEqLOoprCcFccnmEoVYDskIBpJF9pINgb2GWnMWnVhqt6sd6otUCNBmoYyJxOchyUiJy+XgUtIVlgFS54egrf4V3/L1y7+3ybr45zHItBLvGokkNKeL3luPWEWAkYTSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
Date: Thu, 5 May 2022 10:50:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9aea18f-1cad-4fc4-c2a7-08da2e745670
X-MS-TrafficTypeDiagnostic: AM6PR04MB5752:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB57520D204382B74503A4EDA4B3C29@AM6PR04MB5752.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8UUHueoUIEoom7cc7vdfmwozZfC0H/SHjQAoWh67IKBLcnZ437VC6vQKt0rb6hBcwmbqUjU7K9GbJseL3+Q9SPzoQzuN5kXYALTu3oS1OU/ot/3wUk8uGxxpXy/bNsLnuqPcfKMCCseLz2OME0YetjHW6Z2QiIEwqXJ0wOSt9rsDDSMM5lZsvkjRQsnceu6sgee9e7Wj9uCc+YbROPDE0wTiI4tQmNyCgYt0EF5PVtUyogIzguK/DhaR2swolhaeF99SI7PCvE6befLqJf3PnpxsyCrBTKzxR2nVOBQBU1Yu38yIu/m6kt7veH6VW+6zMja4GRBpzXn9EaZCgBeLIJSNRHa1SuZt5HFLAw5LiXg80RNk1hdonh1oghpfmeNT3E/wfqCNo0gdFolpIUAkjO+tFsEXk1DOSEa7YjIyJKlliVrklTIg74A9sGDSal+02avLCfidPc1pPttt6jmHRbivw8v5t82anzHNv2CD5/UmL8JIYLjHDk7dGf8lkuFASIAy2K28iopxcxOpsGcw9+e9CFxMjSAEOG6okAmmiwmooCLBVrl/UsvP43kIyaC8LxMgiPmceysc0gStfsIlURxSjbkBCJKXJQ/d+qFHA2+ARNhwWRdeBvxoY5GmnewgUOfRZLf5z7MMyV8iiF2GHHgnx7M3bJRAQuvRiuuFqtuJg/qecIU0Dka3PJqI6klzGOP2+5y3+FiQTiAnjZ1e/hIyGI0B994c8UYcdqwcX2aTu0uMewCZ2INlLa/hKi20FE6NaF+WKmPk7pERiK3gpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(26005)(6506007)(6512007)(53546011)(8936002)(31696002)(86362001)(186003)(2616005)(2906002)(36756003)(83380400001)(8676002)(4326008)(66946007)(508600001)(6486002)(66556008)(66476007)(5660300002)(6916009)(54906003)(38100700002)(316002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmJ5ejBZRWluTk0vN0xrU2U1d1NEOTVITEh5L0IwOW0zT2RCbW5MSEJ6ZklV?=
 =?utf-8?B?Qm5kVHMyRUpUYXNXUmxrTU11c2ZkU1M2SEVyVElDdVIzbkdlOHJCN1ZvN0Nq?=
 =?utf-8?B?K2pkWXMvanEyay9oRWx2OWkyRlNOMmpRb25URndHcEdDcFFqNHZTdExQM1B0?=
 =?utf-8?B?Rm9OTm9LK1R4NEU1UjlJOTh0MnNYMmI4bmo1UUwvL2MrSHFPcHNaRk85bmpp?=
 =?utf-8?B?NWFtOUFZOWU4c0E0UGhDaWxKRXNvclhLRXRTRWxtYWhwRW5TVTNWQ09aTkFp?=
 =?utf-8?B?UytYeFdCbElGNkhTTkxUMlJqaC95SUJieUdUWTlJZllOb2Q0Nkd1UTRIN3Jl?=
 =?utf-8?B?UC9CNjVyWVVIanEyM3NSOGhoVUdHS3VYVHgxTmErekNJYzhNYVAyWnpFdVAz?=
 =?utf-8?B?N1BEMUNOd25TR0Q3aEhLaiszandsdndUaVMwVnY1TGE4NGMzOXk0MGpwd1Zy?=
 =?utf-8?B?Y0NjUGFHWTM4UkRxZFNETUI4Qzg0dlY3UVB4YnpISjVlSEpjdWZZYTNEZTVw?=
 =?utf-8?B?SklROWU3N3ZrblZZOVZ5Q0pDSTlkMTRiRzE3TEwvc2x0K080dkdYd0pVQnps?=
 =?utf-8?B?QkYvc0VYY0xxV2dJek9OMmM2aWU1bmJpYzlDS2JJeTBGQlBFcVl2R0R6d2h4?=
 =?utf-8?B?ZlVZbXdrTlJORzVYUEF3anE4Ykt3OFZ1M291TCtsa3JjRjhZcmdiR2pRc3FE?=
 =?utf-8?B?dmRMTllad2tpWmF5OVJ1djR4dVAwTDU2TE1HdGgrQ1RtTURnVHk3YzJDRGhU?=
 =?utf-8?B?UUIvUXFwUm1kNkNRUTJYc3d2TWdnMmpYem1uVTExVW1YNWJNUE9yOWJ0QkZ5?=
 =?utf-8?B?VFpnS2FzSTg1YmU5MUo1L2VHQkNWVU94M05JUzdEYXNuc0tHYTV0ZWIwRXhw?=
 =?utf-8?B?ekFpV2syazVlM2ZxWjJBeTRTYkdKVmZVa2RoazZ3RjNMaGllQ3QvaHllNkhm?=
 =?utf-8?B?a3hzdVREWWx3NG1qcFEvTVFlSGZFZG1aR2Nvai9ZN2tEL29WQ1JodWhGZkk5?=
 =?utf-8?B?a2x2czNac01sdkRjU1hhNGZFT3Y0T3VhWTRnZ3ZhZzZVbkdHK20rd2pETjJy?=
 =?utf-8?B?S2NKNUV3dE0vVEhZN1N2N040ZUdka1J3MFYrMGxLVFFVTnRiVytIaU42T0xJ?=
 =?utf-8?B?T1hkY1prcmIySFJQY3JOTGJxcU1kZGdWa1FqVjFXNjBiQVVzdEYzU0FSM29D?=
 =?utf-8?B?Qmp5aUFLMGV4OTVTY2NkK1ZHWnJPd3Z1eUxHV0Zwc0VZV3RWenJSckM5NXVU?=
 =?utf-8?B?THViVHdSQnA5ekgrL0E2NFMvM2xIUmdHYTY4RXBPejlVWnIxSlAxUkFtTU8y?=
 =?utf-8?B?aTNBU0pDN1FHYndVTVlFZlRFb2ZmQVIxbnpPalNYaXpGdWJ0ejZNK1dhcW5z?=
 =?utf-8?B?TkdHSVBBdkVHdUtTUlBtVTV5ZzhTVWJHeE1ndEcwU2NKMjhTLzI0UDR1NnVG?=
 =?utf-8?B?eFdyNzcrOXF6aFV2SVdSb2d0Z3V3dEdZNXFpYWlKVDJSRWYzeFVHSlpZclV1?=
 =?utf-8?B?ZG9mWkxwcnQ2bnFacGI5VlorUStGNUg0SXpoRjBhenZ6VlFGRkFzR1ZKMkVB?=
 =?utf-8?B?clQ0V3FMdVlTQWdVamRMMlFXbHBGZ2VDaDU0UWp0U0V6QjhHd0hTcElJWUdK?=
 =?utf-8?B?aWp3dnlicU5FS05uY1VoRDRWYkNjSGFsTk9iZzVTamVpNFA2TTRvZ0h4ZDF2?=
 =?utf-8?B?WUx0cVUrYjVjeWJjc2s2NzQ0dmZ5dlpOMno4b3M0Njd6bEcwd3JWcjhRYmlU?=
 =?utf-8?B?WS9CSHJLaVU5a2JQTE9LVERvVmx0bXVHVjBkcUN3QWZKWk9uSkhJeTlzbUxx?=
 =?utf-8?B?bmF5L1M0Q2N6MzFlSUtHVzRtSklLc2FET2JCTEVveElBeUxxTnEyZFNjdEho?=
 =?utf-8?B?UEtVNDlWNGhMcWJtWUpCeEttYkVwUUVzelJqd2VYK0xqeXd2Mko1VHM5c2hF?=
 =?utf-8?B?TVg4T21rc1VNT2YwNHZnOHBzeGE1enN0UWZQSHB6aDNOQkt1TUtKM0F1L2xC?=
 =?utf-8?B?MGVRRklUTWJ6VUZyUWZndXQ3UFpBd2lzVytlQUNobmQ0SUtZS3lIamozNFVQ?=
 =?utf-8?B?SFE3ckdwZmhQS0F4WUxFanl2SFErL1ZoTjFqdHgzS0R4dENNNFB4VVRFQ3o5?=
 =?utf-8?B?eVZYTjBiV3J1Q1pQaGZVbS9wRmVMME8yQzdqaEdRcVVpMEY2cUcxaFdQeGll?=
 =?utf-8?B?V0NrbW9BdlZrZUkyaUN6MGxndTkreG84VExsTjU1L3VvRjdpeGhvN1JDN3J2?=
 =?utf-8?B?UncwMy9CMUdjcXNickdxQzVrOTRxeWlUVmdkNnVWVFpjRmZqMDZ3M3lwK0Nw?=
 =?utf-8?B?ZEU0ZUFFTjFwYmY4cDRPSmtPZVZJTzUrVjNKMk1xZWtlSEhRMENSdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9aea18f-1cad-4fc4-c2a7-08da2e745670
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 08:50:42.9223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZe5TxKfGynyKGcEU3Rbcuv+m7xbnC+UiY+oKU3n4Plh2jthYkkhJ47w7q7+v7r0wUP3tkOt+cDEG9VFppinuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5752

On 05.05.2022 10:44, Penny Zheng wrote:
> Hi jan
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, May 5, 2022 3:47 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Henry Wang <Henry.Wang@arm.com>;
>> Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 6/6] xen: retrieve reserved pages on
>> populate_physmap
>>
>> On 05.05.2022 08:24, Penny Zheng wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Wednesday, May 4, 2022 9:45 PM
>>>>
>>>> On 27.04.2022 11:27, Penny Zheng wrote:
>>>>>  #else
>>>>>  void free_staticmem_pages(struct page_info *pg, unsigned long
>> nr_mfns,
>>>>>                            bool need_scrub)  {
>>>>>      ASSERT_UNREACHABLE();
>>>>>  }
>>>>> +
>>>>> +int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>>>>> +                                   unsigned int nr_mfns, unsigned
>>>>> +int
>>>>> +memflags) {
>>>>> +    ASSERT_UNREACHABLE();
>>>>> +}
>>>>
>>>> I can't spot a caller of this one outside of suitable #ifdef. Also
>>>> the __init here looks wrong and you look to have missed dropping it from
>> the real function.
>>>>
>>>>> +mfn_t acquire_reserved_page(struct domain *d, unsigned int
>>>>> +memflags) {
>>>>> +    ASSERT_UNREACHABLE();
>>>>> +}
>>>>>  #endif
>>>>
>>>> For this one I'd again expect CSE to leave no callers, just like in
>>>> the earlier patch. Or am I overlooking anything?
>>>>
>>>
>>> In acquire_reserved_page, I've use a few CONFIG_STATIC_MEMORY-only
>>> variables, like
>>> d->resv_page_list, so I'd expect to let acquire_reserved_page guarded
>>> d->by CONFIG_STATIC_MEMORY
>>> too and provide the stub function here to avoid compilation error
>> when !CONFIG_STATIC_MEMORY.
>>
>> A compilation error should only result if there's no declaration of the
>> function. I didn't suggest to remove that. A missing definition would only be
>> noticed when linking, but CSE should result in no reference to the function in
>> the first place. Just like was suggested for the earlier patch. And as opposed
>> to the call site optimization the compiler can do, with -ffunction-sections
>> there's no way for the linker to eliminate the dead stub function.
>>
> 
> Sure, plz correct me if I understand wrongly:
> Maybe here I should use #define xxx to do the declaration, and it will also
> avoid bringing dead stub function. Something like:
> #define free_staticmem_pages(pg, nr_mfns, need_scrub) ((void)(pg), (void)(nr_mfns), (void)(need_scrub))
> And
> #define acquire_reserved_page(d, memflags) (INVALID_MFN)

No, I don't see why you would need #define-s. You want to have normal
declarations, but no definition unless STATIC_MEMORY. If that doesn't
work, please point out why (i.e. what I am overlooking).

Jan



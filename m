Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25933C747A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 18:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155511.287060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3LFz-0007tz-IL; Tue, 13 Jul 2021 16:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155511.287060; Tue, 13 Jul 2021 16:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3LFz-0007rC-Ez; Tue, 13 Jul 2021 16:27:39 +0000
Received: by outflank-mailman (input) for mailman id 155511;
 Tue, 13 Jul 2021 16:27:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3LFx-0007r6-Ih
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 16:27:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b534839-e3f7-11eb-877f-12813bfff9fa;
 Tue, 13 Jul 2021 16:27:36 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-QiGfjtuMN3y5mmPPBwLf8Q-2; Tue, 13 Jul 2021 18:27:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 16:27:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 16:27:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:205:1::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 16:27:30 +0000
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
X-Inumbo-ID: 3b534839-e3f7-11eb-877f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626193655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXFogW2iLNr3+ISwri6Kupc6tyJl+RHjwnHigCw36RY=;
	b=j+OJxWfjkuDNHJ1R3i0izhBrKeXuI3lAPPUwXynNENSQRncTElpW2Bjd5vwbua7RSKPQPE
	omgu5zIOGBOJy5LejOepGW99KOG8nc4c3ouI9eMJqS8dMMJXikpOzJ6oNABOqWPuuwNVJr
	SsRDF1aZfo8K2VCwmNAgbWkcMy8pmKc=
X-MC-Unique: QiGfjtuMN3y5mmPPBwLf8Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dbp8smAJ2DzOZwQ/OYPQPpn7mC3PmMLpsgfdAXXFcl++O/EhXnAy4hMQx376ok4RYECIIgI83wUwnCKtUd39HEVxA70LZe7dNP/EoF1aoFLdwEOm2xbbEGaD2A1tghBMUa7aQTcareuus2nKGi7Ro7cqB4QAU7HHHAEwMBaCAQUdpKO+7yn4DvPcNXGg/gksLrHGTz7TkC48jnDBpZ4hHFRLfcJLUtBJNOjWJFqxhaayhd/4z5zzNCIYNlloPQqiIXwQU8UoIsmx8iWuMwU+3T9MCJSXC5RjLkzx0WcML5lk8xmiqogTleV1KXa1hUytxR+PZ90o/ptXL48B6vQ5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXFogW2iLNr3+ISwri6Kupc6tyJl+RHjwnHigCw36RY=;
 b=NrXkY44PTjr1uNOd5b9GlSg5O5dVA86heR1IB56lXsJvu/ot6+mAKsWHxFP1omsRpoOWAMCF7n2fKVFQOkmNbQocni9idXyb0FSmM36jou9xmzRCYWt7XclJyVuHRf27rlejTS8/0dvMJvth+dVJhw/pTz5rZjqSkcnmkRdSdHGmnPNixUv8CJmXDTRg8tx3lvnZI3SW9mUdNgD6/wgYedrorQMl4yB7Zpn83Q/kdlbqXFfk9atKBCkO+c0s6xLSmgKNQhDD0qlJr5hOHtSIvgxTtQMgnEKwso8M0VIwENtLSivoFHvbfibcMo7Q9SSffUO84IldzOHwpMGzvXZ8YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Juergen Gross <jgross@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <ce9e3ba3-7e1a-b592-7e9a-e35099c8d483@suse.com>
 <b27990f4-ac98-8221-ddb8-fa4699a0d43b@xen.org>
 <6c6afbc3-4444-7c3b-d6ef-2d3a2baa0b53@suse.com>
 <c7f47a50-b559-f8ba-5ad2-6868c01b6f52@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51a62c3f-e3ef-f7ec-748f-75ade81f51cd@suse.com>
Date: Tue, 13 Jul 2021 18:27:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c7f47a50-b559-f8ba-5ad2-6868c01b6f52@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:205:1::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65cd1f32-0208-40a1-2749-08d9461b1c74
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703369A60DADE9EAF79F8ABB3149@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fYZ9dqOnW3FZXvQEy1mJ7AzfTh7rjEMLC9xlZ8jXnLN3suqsbC+oTJZ6p0ik2TFAwhROiSNqDIkrUz+rMKYHJ7ZVEgP6Gl/zAxh+vWyAH39ZXfaaGINKSdBPIlf9TNITGWh9o4bOpP/LqGX6bX6+NtQvSLLfhXBejMQmlB/AWKaYqMxII59H0Ub1z041YkGxb8/e37HwE+Y5jm0DdhvPgTg8PmnOCQTM6G0AaC1v4fmX6LAhRS0BR50FiDkU3OTUhJCR8rPUI6CVhk+mRWbCqR+Hm6xNNUyImgtPCS2cGqvRna5RHUW2EmvmuCk2WUHb0zVobqG7TE18GyZ/jqvLFdhyxFQXFZ1dvjjA/O771Fw299+XWwYmgIV2t4HOfNIVj7f4u413F6R1dXa5T1WaGAJXKxuE1yt0Nk3t84SUuTOVJCcdP6fV0tsus/ACbt1C9RUzz6G//irMAeXaJXJ4PlM0UEeAgi1PHARvfSw87jabMzH4HwsX3A9/tdKzFLcXZh6OPLm1N0Ms8hHFrYKuqUrU4Lbxg2zNEw/x4UXA/lcUWB2mUR9iHK90V5VQTHnIWjjF7GCdIESEABwcc9P0MOQybPZ+NDtaqjAVJgu6l1p4WUzzOCBBf/rSatocRzD+XLfpCKWnDSs0t8lv1Ke5K5oRddLM2H0Z0nM3TJS1XmOOsAnfSGudXKKy51wID8qlGN2gbUK8bYa6AY0OP0B1JfCCgT9LS398Qf00xQrNZjfefBD6SxBIorNaiFEpbbntjbFlzpDADh3XBlfXixAYvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(396003)(346002)(39840400004)(2906002)(66476007)(5660300002)(66556008)(8936002)(8676002)(26005)(6486002)(478600001)(66946007)(31696002)(6916009)(2616005)(4326008)(16576012)(186003)(36756003)(38100700002)(86362001)(107886003)(54906003)(316002)(31686004)(956004)(53546011)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z01pV0hoRmVrS3NDeHo1Y3pEakg4b3JadWhLYkZBN3hITEF2TFY2OWZnRFpL?=
 =?utf-8?B?S0owdmpoRVg2ekNBZFliMmdzUGs2UWNVSTBNNHJyTG5aNzZ0MGFTSGE3ZUVw?=
 =?utf-8?B?V09uWjh6MkdmaUdnb3NtZVZHNVNKNVNOZmMzZTRTVCttVVM2Z1c5UzFyUDQ4?=
 =?utf-8?B?M2pjQlNqQkxmZTlwMENNREZKeUxNYmJZUXVQTnlhWC8vbjRHZUlDZnF3dGVt?=
 =?utf-8?B?L05yaEhQMHlFZ3F2YnJNUnRFQ21SaDM4d0RISmZzaDkzMzA3dnF0MUlaMTlS?=
 =?utf-8?B?SUpkcnhySW95MnNJaXdmVkpnekJzYjhJREo3cERlbmRTcGxXenZiU3huK1c1?=
 =?utf-8?B?SDlGL01IU3J0azlmeXpRRW5RN3VpdWlINGhqNkJoOFgybnM1TGlXNG90dmFV?=
 =?utf-8?B?YnYzQlNtNGlkNHc1S3dxNzNETFRkWDNXbGR1dUlzM0x6SlNFOXl6Q2c4OGdy?=
 =?utf-8?B?S2tTam9mczhFZlR1cm0zTFBzMHkwdlBZN2d4dHNTd1VGRGlIbjlHSFhjRkpq?=
 =?utf-8?B?YVdlallyNUZhVlE0KzF5aTQxTW81ckFLZEwyL3BNWkp1aUNZUkVPSWNZZHN3?=
 =?utf-8?B?ak9mVUdxcUNLTmYrM0JCTzhuS2U4a0ptanJhSU03NXg0UysrODE2OUhGNWdn?=
 =?utf-8?B?NDVvbnQ2a2VnS3dhQ05wV0NPWDRBZVN5UlB4dmxUVDhBcEErWTMrdkllMW5T?=
 =?utf-8?B?bWdHdTQ1VDZ4MUhvRGxNNm93a1NKdk1rNnRmbmpOcjNKTXZqaFEvclJiS0E5?=
 =?utf-8?B?M2Q1K3dZUUFIZ1Ric1NoMnJNUFluTUVJM1FieitTVm1uYksvSGkwaHc1L2hx?=
 =?utf-8?B?eGhQTzNLdjBOQldsMG54MFlGZzRFamZKK0dsTHpBOXlLWUYrQms5WVZsampl?=
 =?utf-8?B?T2t0TFg2YmllclFwcXNnQXZTNVFWK0xnNzNtaWt6WTJuMS8wTm8yY04yMi84?=
 =?utf-8?B?d2hlcE4ybTc3MytRTEZ4cTV4WWpLSVdqL0ExVmVYT2s1TjZwL2MreHRja3ZN?=
 =?utf-8?B?b1lJZkdsbEdUOTYvMGx5SDBBZ05nQTBoMk9jbktnWS91bldGL1c4VlM5SHJv?=
 =?utf-8?B?TFRBTmRHY0gyVE5FMEl2TXJ4cHZYdDFqeDA5dTlGc3gwNjArdHNnQ0tRSXFW?=
 =?utf-8?B?TWhGNFhBYU9YSkV6cVhqZkw1Rm9xTFJDSlZjQmhHTkU3NVhQM014RS93S2VK?=
 =?utf-8?B?MTg2cXpKejk4dDNhNGlOV0pNRDVNaStiRk44UFNHMGV5QnlLMHFzdUgzMUpi?=
 =?utf-8?B?bGxZRmprb2FWOFN1RlJLRU5OMFVMbC9NOTZzZkxLQWVSeC94WnZ6NnlKZ241?=
 =?utf-8?B?Mnd6Z2JyK0UrdmZ2OFl3SGRSem1QSnVWVkN0VTRTM3Vjb2FQcDZZOGlKbHFZ?=
 =?utf-8?B?WnBIaTVYMVdFM3B0alVpY0k3Y3V6aExMckpiS0hrV1Fhc3RTRmZuMW8zOVlZ?=
 =?utf-8?B?cTBEcm1NNWZuMmRVTkJ3a2FzUTBxUjJCeEh1WERIZUY3TVpGR3RpR1ZxVGtS?=
 =?utf-8?B?NGJKZ0V3WjJWbUZCTllyZFZ3WEpEUVA1NTBWQlVYMTBBYlpqMWlwQ3BIb0ho?=
 =?utf-8?B?R1dHS3E5RjdIcVNLcVRXVnFJQzZpZVdHalR3dHVSWUZ3UG42ZkUzUmkrM3BN?=
 =?utf-8?B?T09BSm9sMXJyRjc1UUpvVXRGSitxc3R3eEltajhpZ0RlNTN5NDl1Ulp0dkdj?=
 =?utf-8?B?QWsrSFpoUGgxaFB6VmJUaTlXZHRpV3JRZW4zT2xTWW95d3Zsc2JCakMvRU15?=
 =?utf-8?Q?ag9l6ne1qM+duwLSOCxXijd22cGFOxMd98BgEnw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cd1f32-0208-40a1-2749-08d9461b1c74
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 16:27:30.5831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YYXD7hbhDOuzuBejrPZltHujnInPuoa8DZq7dmj2YmWz1s/7eCpFtWI03LmVXS2ssVd9LxpKOM19N2FZyZuFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 13.07.2021 18:15, Julien Grall wrote:
> On 13/07/2021 16:52, Jan Beulich wrote:
>> On 13.07.2021 16:33, Julien Grall wrote:
>>> On 13/07/2021 15:23, Jan Beulich wrote:
>>>> On 13.07.2021 16:19, Julien Grall wrote:
>>>>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>>>>> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.
>>>>>>
>>>>>> Even that doesn't seem right to me, at least in principle. There shouldn't
>>>>>> be a build time setting when it may vary at runtime. IOW on Arm I think a
>>>>>> runtime query to the hypervisor would be needed instead.
>>>>>
>>>>> Yes, we want to be able to use the same userspace/OS without rebuilding
>>>>> to a specific hypervisor page size.
>>>>>
>>>>>> And thinking
>>>>>> even more generally, perhaps there could also be mixed (base) page sizes
>>>>>> in use at run time, so it may need to be a bit mask which gets returned.
>>>>>
>>>>> I am not sure to understand this. Are you saying the hypervisor may use
>>>>> at the same time different page size?
>>>>
>>>> I think so, yes. And I further think the hypervisor could even allow its
>>>> guests to do so.
>>>
>>> This is already the case on Arm. We need to differentiate between the
>>> page size used by the guest and the one used by Xen for the stage-2 page
>>> table (what you call EPT on x86).
>>>
>>> In this case, we are talking about the page size used by the hypervisor
>>> to configure the stage-2 page table
>>>
>>>> There would be a distinction between the granularity at
>>>> which RAM gets allocated and the granularity at which page mappings (RAM
>>>> or other) can be established. Which yields an environment which I'd say
>>>> has no clear "system page size".
>>>
>>> I don't quite understand why you would allocate and etablish the memory
>>> with a different page size in the hypervisor. Can you give an example?
>>
>> Pages may get allocated in 16k chunks, but there may be ways to map
>> 4k MMIO regions, 4k grants, etc. Due to the 16k allocation granularity
>> you'd e.g. still balloon pages in and out at 16k granularity.
> Right, 16KB is a multiple of 4KB, so a guest could say "Please allocate 
> a contiguous chunk of 4 4KB pages".
> 
>  From my understanding, you are suggesting to tell the guest that we 
> "support 4KB, 16KB, 64KB...". However, it should be sufficient to say 
> "we support 4KB and all its multiple".

No - in this case it could legitimately expect to be able to balloon
out a single 4k page. Yet that's not possible with 16k allocation
granularity.

Jan

> For hypervisor configured with 16KB (or 64KB) as the smaller page 
> granularity, then we would say "we support 16KB (resp. 64KB) and all its 
> multiple".
> 
> So the only thing we need is a way to query the small page granularity 
> supported. This could be a shift, size, whatever...
> 
> If the guest is supporting a small page granularity, then the guest 
> would need to make sure to adapt the balloning, grants... so they are at 
> least a multiple of the page granularity supported by the hypervisor.
> 
> Cheers,
> 



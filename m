Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA6512D45
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316075.534799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njypw-0002HS-EB; Thu, 28 Apr 2022 07:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316075.534799; Thu, 28 Apr 2022 07:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njypw-0002Fd-Ao; Thu, 28 Apr 2022 07:45:16 +0000
Received: by outflank-mailman (input) for mailman id 316075;
 Thu, 28 Apr 2022 07:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njypu-0002FG-HW
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:45:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 233ff87b-c6c7-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 09:45:13 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-nbhzx9b4MgKgCwLNOE32uQ-1; Thu, 28 Apr 2022 09:45:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 28 Apr
 2022 07:45:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 07:45:10 +0000
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
X-Inumbo-ID: 233ff87b-c6c7-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651131913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twdjcPLUi3FM+jhN/JK7zJIH+eOYabDtlTxL63eHsRo=;
	b=VPY3iQD94RjCUz/nzxyroYY4x6K4OcyJjyZIcushMFw8jG2keKn6R0IVkSaMC9hS6Bz0cU
	9uTcCBTUf2WvzJNKl9a9Meo0HcPIOelG3fiZ2T23iYqVHQ/VhOZryGVnOJsH/+H84ic2Re
	eBoCF6QXiQhUKvFiMe6SlWE8afzSTZc=
X-MC-Unique: nbhzx9b4MgKgCwLNOE32uQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlBGQds2GRdb6Eu55Ib1xoYKh+n2z7jxkdQhhHW90scY2lTlDUcM4dMTHFDzayyT1OyR+3krLsLGvjPG/K4oFuUmSArlPc87aRUfoZ9puCGlsqXdgGd6G4e+SxCqhOtvF9FTiEbuOpcZpSFNcZ/s692AnwItrQzb6Jko4yLtymiChetG5MrOaC8LgqzznwI5ATqy/Uo2esvcnmXsIf1ZICiblOiOAzcrFDIXXqtNk5Id+FV6reHERokkMHyc+8/Fi1eZmbey01+fSePAaRM0yKqAq1xFLeUEJAkd9KDvRGPTbnjWhLxEU+ZC61OVka9G/vERCzOxTjki5a8WlWwhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twdjcPLUi3FM+jhN/JK7zJIH+eOYabDtlTxL63eHsRo=;
 b=h//M82UTQjh5KqB9ELa2hhN/fy4mhhJQ5Qf3PBlEbVwcqgqyjEamh5/pSf51MQksQ0yYLwqpHHJnE9L8L92XbcbtOqFY0o3uHc4RLD/t1GnKWde+gpkF1/Ed1rdD3gY/Bg2r5+YOIezR9dnqTMyyC4kQKlmSRMVdh3d9l4NEh2m1QDy8tWM99ICvVMtgPz2Bze5t9/GnMXx2HUOx7f4tKWJK4uV91NvwjG364GJ0agEYg87UnPZxViGcXml5jCEPhGZe2Y1RdLoPuE+oOs3zCrHZAl/vZwnzm+IMMD0RZH0c8kbE7Z4N7zdCaiOt85SGeYlWE6Lhxxnjq0D3ASp0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34c7f008-a530-db45-cfb9-63b26944f03b@suse.com>
Date: Thu, 28 Apr 2022 09:45:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 osstest service owner <osstest-admin@xenproject.org>
Cc: David Vrabel <dvrabel@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <osstest-169781-mainreport@xen.org>
 <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0059.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5343caec-b335-4cf8-9c2a-08da28eb05d7
X-MS-TrafficTypeDiagnostic: AM9PR04MB8147:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB81474B4B81F6589AEA154ECCB3FD9@AM9PR04MB8147.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fdnfvukqSyViMK7tNRasyVp99rhkpRRPDLLZ0CLg6jcaBXTmGMdggygXYzaiZ17iwga6vbtXktxoEKW3AJDw1bqUOmDwXGBuNSPvb9Q/FQOj7XnW4eM8XJSO3i6uYDUcWYUL+TZ17yNoughXyc3Uxbqo8Ejz/vyPka3qGHzDVyIziMzbYZVbIBVWj7/Jii6RVoMYIXlv9DDcxE/Ut0V4im2GypS3TRP7BYcKTjDnLXZTbqCdSco3zNxUlqwPEXB40zxTiYrKjBvxbW3l19ClNRQUNI0HHQPLPsFU5MoVEYuNg8TRFfOsVETcFej2dN+NLfn0mJCbjn1swkA1lTvMpmpUGsar3alNDP5gUwp1XFTvfNQ6vfH1V17+wOdWaue0vQqeXfAcsVmt3SioLURfw3ZTYHaWnppxXKyeM7i8n25Ufa5+zol2WaxHp8xx9VycEIsRUkXJ9yVjP0mf0u4XzyU9KqJMPL4fWfRsYBRnfJDZMKCwT+jMuRetZaBsb06Q4yTR4CFLAz+M7gcHBTyamIU7ZnxwbGfJtIqKYynWzyREtNfWj2Ik/cCu97UDLhPlEct0WUgNJea2IwopZ0BdmPWtjZRxALJMo3+0/jV6lA6WCswK3V58hLx1nWb+4uFIu45vG36feu52nhUz8zYFM9qRutQAIgH4vQUTq7nbf5X3eQgnqQUa41rfIdt1nsYCDt1l9S7MtYvIpnEd5k+wi9GMCfyeLbD982GdzPac+N50XgAJWq0wJm1y9pHefrns98E5K2u7HEuwj90iuqGBNyQccxm1auMoqSVkS8uSWcbwfhafiFr1d8df8tpnxMFtAGqa6J9Q6WcyU3MzAfR5yg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(66476007)(31696002)(66946007)(66556008)(86362001)(5660300002)(83380400001)(2616005)(6506007)(38100700002)(53546011)(966005)(26005)(2906002)(8676002)(6512007)(54906003)(110136005)(4326008)(36756003)(31686004)(8936002)(6486002)(508600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjhSWDQyY0tlQ0JIcnUrc254S1IwcG9lMHFzY2JLSVdUUmJublFGQ1RhQTl2?=
 =?utf-8?B?akFMbmVDQm45U3plQktOeDVrQTlhVjBLZ0x5c1dSa3JXTjFQai9LLzV2Zzh3?=
 =?utf-8?B?L0JIT3IzejUrd2ptdVRGVXQ2NDFGdHZJcE9QbEhCQXFxb2RIaEZLYWU5VFZ3?=
 =?utf-8?B?YnpnT1ZpUUE1RVpKdVdqdTFNOVY3SE52eXQvUjFYNVROejJqUUlRNElQRWdn?=
 =?utf-8?B?N1R4Nzh1dS9DNVhveEtXL09kMUZpRitNdENkZXlORDNhWjJoanRMcG9RbnBu?=
 =?utf-8?B?MnlJanNjNlU5YmM0S3dOZ0dtNHk4OU03K3pMeWZUR1BkZUJCOGV2VDNxQnRz?=
 =?utf-8?B?bDJBTEQ2N28xc2pHM280c0RoNVZKcGh4K1JCV3d5T2Q1TVBPVkphM3lNNWFw?=
 =?utf-8?B?UjEwclJwQk5VYkVBZ0pDd0trK2oyZHhkOW9FWVU2V3ZCdTlQZStISTlkZ0xL?=
 =?utf-8?B?Z1duVUpYTHJaTjM5Uk1NTnVmdlovOHFIdVVxQnphZ1hadjlxTWNWZjB0WDZZ?=
 =?utf-8?B?T1NZazVmM0ZEdnl1TE80bVJDcVIrMXNMTmMxSWcyMVdacUsrR24yY2VvVTNq?=
 =?utf-8?B?Qzg0bVVEcDFYSjEzVVk4STV0TUpHSW9jajBoWC91Qi9WSSt6U2w1VVJEZ0tp?=
 =?utf-8?B?dVdnZUpNNFp6dWt2aVY1dVBSSHFtN1ZEMUljUEpVcG40ZEkwQkRTbllXeGtX?=
 =?utf-8?B?UGVHTG8xVllkclIrU0pxSmlpWmRmVDhtd0svZzZOSU5IOXdqVnBFZjBwQTgw?=
 =?utf-8?B?QUtOVHR2b0ZoUk16OUVFOFlDSDFoUzFKQnlxQmcxS1FodE9yMndjVzN0L3FS?=
 =?utf-8?B?c2JoQWZMeGU2TlR1aGhuTUlJSHNEdkR0ZWJFTmtLSEJxanlVeFFYVWplVmYv?=
 =?utf-8?B?d1VyeGJvTEhhS1llZVo4YnhIbURxQVBTSUlCWGc3bzZKK2tIR0dFY3c3dU1y?=
 =?utf-8?B?MithRks3V1RUNlR5QUZpRVVwOHRKOHh6VmFpSVYyY3p2WGtDWVpkck1QRld0?=
 =?utf-8?B?WnpPdjJabjVHSTZtVzN4TnA0akZKQThuTE41QnNRaW9lZ0p1WXZ2L3QzMmxa?=
 =?utf-8?B?bzZONVpNcm95SlF6ODFTeTdSNWp4bWZBQ1FTUHplS3ZlTjUrYUlRaDk1YkQ3?=
 =?utf-8?B?dEg1VnBHek5ML2wrS1dvYzFGWW9kQm0vb3JndzVtNktVL2Zoc1EzNGRjQXEr?=
 =?utf-8?B?ZExFSGdTbkxEcHNtYzJLd3E1QzVDUlNpUG1QTXU4MjJHRndLaEJSUFZmRExD?=
 =?utf-8?B?bWp0bHRvUWd6bm9SNkdEcHlTWG5sOVd1TVZqYzg2WkhkUk5Pald4dGtXYmRj?=
 =?utf-8?B?MURraFlSTzVLWFArQTRXOW94eXk2RG1DcDBFa3FOMGFQUFlwZm00SlhUenJa?=
 =?utf-8?B?WGxUdzJvbnd3YklISVFMdTBDbjUxUFN3RDdKV2xWUmtYcDhkTU92ZnYxbVRx?=
 =?utf-8?B?amlhWlE1RDFHUUI5dC8yZTh0Syt6VHFUOGJWYml2bXg0cHRBam9ZT1JFblpG?=
 =?utf-8?B?YWRHS0ovRkNNR0tkc3JjRXZPUmxnSFc1UGRZc2tOODB4aWpsMXBYaWdLZ3ZE?=
 =?utf-8?B?aTlSekJHaG10aHBUTkZhemE2cWhuR3FGakdOV2JLNFZyTlRvRFNmWWg3djBj?=
 =?utf-8?B?My9zTDZheHhQUVBIdjl3U2VuTGh5YmNQeDB3NWF4S0h1QVJRR0k1TE9ZdkZt?=
 =?utf-8?B?UUtFOE5uZ3V1SHhvcWNvWVpIVHNkemJMa1A2QjE0am96YzFLL1lmRVZGZXpr?=
 =?utf-8?B?Y05yTmR1Y1kyN0EwcGJVZ0hCL3M5OVJERkZZejQycUxtL3hPVkkwRTRrSWFH?=
 =?utf-8?B?c0dwVUhRNlVTQjg4S0xaMmZ5VzVMSXNCekhGSjBFM1dkbUJodzNCaHgveXNN?=
 =?utf-8?B?ajZjelNFelZDOGMrUWNDYXM2MFJ0bmdCcnczeXRYVEZ5cUdGWnlzc1pDUkhB?=
 =?utf-8?B?b1gzQUpQYmxkTVdHbnlkNFFGODlQMHl2UUhlMzE4dzZhMWlNR2M2RC9DcDZC?=
 =?utf-8?B?R3RFT0ROeFRiLzUrWldqbXBtdkJST21KdEJLdTlacVo1ZDZ3YkFQN0pFQldu?=
 =?utf-8?B?SzVzdEtucERhZ3VndTgvNHVqWll5c0hBZHdrSkpQdW5kT2tnQUt1WklNV0t2?=
 =?utf-8?B?UnBDc0VUMytKbjFJZHBFVlZCTjJpdFJRckZMb1NaVmZVR3o4OE1mRmJKWTFF?=
 =?utf-8?B?aDVReS80ZGN4VERydUNINmt0MUt6SElrL0tQTWlYQWZiSmo5anhLL2tIVGd4?=
 =?utf-8?B?ZVU4bVM3YlNNc2J0KzcxMjNEMkdoeUJQSEI1bkE1Qk5QUFQ4T0x5VkYxZUNt?=
 =?utf-8?B?ejdKUndUNW51Ync4WlZXTWF0OVE4R2pMVjdmdzlHajUrVktnNS81Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5343caec-b335-4cf8-9c2a-08da28eb05d7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 07:45:10.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OvE5P32bv2hDWgJKBjGN2njFam2ailNucai/KTIwz9CLnpbaQGQ8SsneFxU8qrOgLdqSVrj1g5U+0fLw/Uw1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147

On 27.04.2022 19:10, Julien Grall wrote:
> Hi,
> 
> On 27/04/2022 17:38, osstest service owner wrote:
>> flight 169781 xen-unstable-smoke real [real]
>> flight 169785 xen-unstable-smoke real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/169781/
>> http://logs.test-lab.xenproject.org/osstest/logs/169785/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 169773
> 
> Well, I was overly optimistic :(. This now breaks in the ITS code:
> 
> Apr 27 13:23:14.324831 (XEN) Xen call trace:
> Apr 27 13:23:14.324855 (XEN)    [<000000000022a678>] 
> alloc_xenheap_pages+0x178/0x194 (PC)
> Apr 27 13:23:14.336856 (XEN)    [<000000000022a670>] 
> alloc_xenheap_pages+0x170/0x194 (LR)
> Apr 27 13:23:14.336886 (XEN)    [<0000000000237770>] _xmalloc+0x144/0x294
> Apr 27 13:23:14.348773 (XEN)    [<00000000002378d4>] _xzalloc+0x14/0x30
> Apr 27 13:23:14.348808 (XEN)    [<000000000027b4e4>] 
> gicv3_lpi_init_rdist+0x54/0x324
> Apr 27 13:23:14.348835 (XEN)    [<0000000000279898>] 
> arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46c
> Apr 27 13:23:14.360799 (XEN)    [<0000000000279bfc>] 
> arch/arm/gic-v3.c#gicv3_secondary_cpu_init+0x20/0x50
> Apr 27 13:23:14.372796 (XEN)    [<0000000000277054>] 
> gic_init_secondary_cpu+0x18/0x30
> Apr 27 13:23:14.372829 (XEN)    [<0000000000284518>] 
> start_secondary+0x1a8/0x234
> Apr 27 13:23:14.372856 (XEN)    [<0000010722aa4200>] 0000010722aa4200
> Apr 27 13:23:14.384793 (XEN)
> Apr 27 13:23:14.384823 (XEN)
> Apr 27 13:23:14.384845 (XEN) ****************************************
> Apr 27 13:23:14.384869 (XEN) Panic on CPU 2:
> Apr 27 13:23:14.384891 (XEN) Assertion '!in_irq() && 
> (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at 
> common/page_alloc.c:2212
> Apr 27 13:23:14.396805 (XEN) ****************************************
> 
> The GICv3 LPI code contains a few calls to xmalloc() that will be done 
> while initializing the GIC CPU interface. I don't think we can delay the 
> initialization of the LPI part past local_irq_enable(). So I think we 
> will need to allocate the memory when preparing the CPU.

Do you have an explanation why the next flight (169800) passed?

Jan



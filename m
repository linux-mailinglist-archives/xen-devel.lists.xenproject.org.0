Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6B474871
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 17:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246903.425821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxAvS-0006wV-A5; Tue, 14 Dec 2021 16:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246903.425821; Tue, 14 Dec 2021 16:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxAvS-0006uD-5u; Tue, 14 Dec 2021 16:45:14 +0000
Received: by outflank-mailman (input) for mailman id 246903;
 Tue, 14 Dec 2021 16:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxAvR-0006u7-Ia
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 16:45:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34733439-5cfd-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 17:45:12 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-AJLBPiHANomlkwT3xjOwIw-1; Tue, 14 Dec 2021 17:45:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Tue, 14 Dec
 2021 16:45:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 16:45:08 +0000
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
X-Inumbo-ID: 34733439-5cfd-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639500311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMZVw8TI2E2IED6ByzTbPC6NglxWEODXw8SstT5zBac=;
	b=LSNO1vih59TO+ZAEToajVixoFKXledL17AdEk3Ume3eG/iaxtqH0XxVM720P/xDEJOJ8Co
	HY9Ueg4Xkki59zObTgFL6CV6ZyQatfgkOv3lV+MgRNHVSHdYfaHpJgo+O5n5J64Mzwcujo
	WNIglTgVoZkJ9zrWsSZEvoq7ZEzv4a0=
X-MC-Unique: AJLBPiHANomlkwT3xjOwIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsvZDWWWbsAV+V8cpLoGR2jEtVYtYkdHBH+4AFSNva2oN5mfa7rg+44dKJjK97sactuUAKjHn+jegSAryzzFXplIVK7LaENdrNEm24CQ+3frhYz+L5tcTmwbjEFR8NC3EgARMvVFMF0Zg/3ZZgtrK/HXfKntSDjsUhe7SKSOQJ7M+XiYBZvq/wLk5G0sqaDEjL2fjYPyvtdVhlx5C8+fS52IvOC9dKvp6/Pi/0Fq35jjOhmRGf2qhCRSlh1q5M9oScEajc/X87p2youfEqj/Ggn4O5bpUH83K10SOUNt4NbEEoCwY6jKLPrLL5fTXs2o8y6AFj6SK4WZa7KrwWznVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMZVw8TI2E2IED6ByzTbPC6NglxWEODXw8SstT5zBac=;
 b=OXCRq2zZz3ZceTNtbPDY/CulO6c6+siIyykjyxOvU6S2BD/9vqbZjBmU7Q7VXZEgKl4d4zZfcxTwJ5Myo05R+r+08RkQOBiNX5ueo9eaIfGLSs4LEmKzRwlO2SbdLgh87jWkqSkWCWvMifqC87N7iifo+PS2E8vPBD7kPyb0BPomAbBrNOkHmFMDK0bHUFqRYhmRlzb+VlYjSuN1cRcwxdqb3VaPieOTPdebswXO2yEH8ALbqZMQTA/CzEM8XS59+Dj4pfgWnT5GNRCl2edrD5QhXtxRdzJ+mhYza6PzrSw2ul8YMU3+9i4/rzdfb3zwYnnHbDHvbToc9bYiYBfy+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
Date: Tue, 14 Dec 2021 17:45:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aabdfd40-b82f-4b3b-6445-08d9bf211681
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57428DB90F310EE95926C295B3759@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dRhmYyg8uo/lSxFN77S32K+kSzV0NM0K0wquq6HSMQ6ETlBNhsnx3w1v1B2dWKV5O1j6/2s28ujsTA7G1zo2jg/kuCHjxvq5HloOriodSw+4DDF5qj/SDo2XV7TNfKwpMxGwD9YU22YxKPT12mhAT0RUd+AmE7mCISydJcIkhZpQcsOf9U9h1xDKkQHjBXIb0ztmU+KjTamSAGrQ9FGSL3X+Ror7BfST72ZjEHfpEv8uw5MPShJoOvRnw82za7wZWrJaZbe0YP8HM9A8vcRDoHrhoAosJeVTrEVyMbg0ab1t4UrmdSelL2RcmanFgavrDxKOwStPlq32R5TmCgSZ5xbSJgBias7bS6sAS1iHdJ2kc53U7f0F6W3SNGQlAgWIdcex7CxC76QoTv04pXA0iXrZ+llLLTlVi5cbmRtZIVn6WmPmd7Ke3oCfQ1lqMLxCCA62i97iQdIWdV19fjU3SF9/NGDghTb0jAo4Tt5QwGWhYByQt7wyhYZFExr27r8Ah5BQHNN1ymRSIZn2riVXUVewDreRw0yljX8NGSqfRf85GYAKq8mmwz3BdnunlLw9nB+2C9ZAfyx2+zgIVngmSdrkWHIJXa5noHaLcICxrIusHm7FwKxofZg3Hgr4LE4tA6cTddRMuSYUcXxGp4bc0OMYZjtWUd8FOZ9Zvsflzoajonj1A5sWwERBsLkkGkgs/Wc4MdlbfKL++sfjyeSDi8u6F1uGVnMf9P+TtP8P5Tg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66946007)(2906002)(4326008)(31686004)(508600001)(66476007)(186003)(66556008)(7416002)(26005)(38100700002)(54906003)(316002)(6916009)(8676002)(53546011)(5660300002)(8936002)(6486002)(36756003)(6512007)(86362001)(6506007)(83380400001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGZtdDhTbkNFSEpYbkoxM0txbmVuazFxbU16Mk1IOUVkdEVmKzdoRWxlQkdS?=
 =?utf-8?B?cGgzMVNGK0FFZzU0RW5QRnJyaVM5ckxsbEw0SkFpOWU5OWgxbUVvQmNuVGhl?=
 =?utf-8?B?VEFIRmVQS2JyOVUzVWVzanZkRnd0eWM0NnJvYiswL3V2RDQySHQvOEtiaWQv?=
 =?utf-8?B?T3VqTENtNVlodEZnYVByV2lieE1uVXMxaWNYUXJNdmhwVnorNGwwdXRpakRu?=
 =?utf-8?B?d0lxdUFOODNwOFhMdFNqd3dIZG84MDFLY3VmVWt6L1hRemtlMzl0V2I0RFh3?=
 =?utf-8?B?emFxQUhzYW13Wkx6RVMyUlNqWU5nSHFGT3ZrUEJxbExPVHNMcFBCSGExaFl4?=
 =?utf-8?B?L1BsVXBMTnVZZkw0eStmeTZMb2VvcVJjMnhtUHd6V3hXSUF5WkYwTXB0OWxQ?=
 =?utf-8?B?YUI3c0FxSHRseHRyRDBEQlRxWGZER0U5M1k3RjVsRGpRQjErWllLQkpBOHVO?=
 =?utf-8?B?Wkd0VCttaTZUMkVsMnNoaEZ0QUM0TmxxYktPMUR1RUVrL3BuMFVTYXNJelBx?=
 =?utf-8?B?bVptZFl1UlA1TVVKNzVzNXdJemlZWEhpRzRrV2tpcWViRkZFa3hPZnRobGxo?=
 =?utf-8?B?UXoyUjVXU0h0aG9Ua3l2U3k3VDYvb0JkSDJDMkU1RWZUSnpEcDRTMFdCSzh4?=
 =?utf-8?B?b0FqVTg3bEdsNXhQb3FTSk43cktDanhqcldBeStKa3hqSEtnaldWVmM2dEhT?=
 =?utf-8?B?Ylh3am9wTDk5Q2ZlT0VIMlZoMU80bmlYdWhMZ014N0gwZEpPSk5FRHhZSWRW?=
 =?utf-8?B?ek5qdHJCSWYzL0tCb1dBZmFmRHVZOUhWS2UvUERjWmtqaVpDTmtxSUgwWlhh?=
 =?utf-8?B?UStjOUNEdmFKUGk3N0JaZ2NaN1FJUVljV2hpN2cxb1NscWVuOUpyOVJ4VVRj?=
 =?utf-8?B?YW1vdFVUN1p0ckhNb3lnY3lqOHV4TUdzVzJVZGsyMzFQdjdVUEs5VkluTzRv?=
 =?utf-8?B?Wi9qL25INHIrU2M4TG52VkZkQkJmbGk2djRySzZiU08rSFg1aXR5c09Rdmdl?=
 =?utf-8?B?WUE2SjJzNmw1N1FBQXZMVERlUUx6RzFJaGJyUnVhMktQTEJieElTcHhlR3VR?=
 =?utf-8?B?bndGSkcwWU5xQ0NaeXBtMW80Y1JSM0ZVdEdDTkp3ZW00U1IyZU1mRFllaUNx?=
 =?utf-8?B?ZllWWEt1dndJK3IyajhLdkw2Z3p3WjBKQUkrUTR2ejR6cjRya1VYMmZCNjVK?=
 =?utf-8?B?VVZ4VnN3dUpVVGE2dmRsaDBKL0Q5RCsrVUJNWUlSTnlrNERjZlF0ZWUySGFo?=
 =?utf-8?B?czVwZ21mU1lZSVRPTFk4bENYdFZ4c2U5WWRNend1S2RJdlVMb3dCRzhWQ3V0?=
 =?utf-8?B?d1lDN3FlWmNtY2R5NlBzS2JLUVBlRk9jdzRqZThWcXk1ZjVtSE84a0o1anhU?=
 =?utf-8?B?L0wwRy9ZVHJCMjROTzBiUG1NL29XWFM4UDFkYjV6QjZqb0dQL0NaSmI0aHV4?=
 =?utf-8?B?aVpUZy9rTVV5Tm9VWHVINU1zWVhPVmczSmFUTFR6TExCT3JDQW1TaUVlMHho?=
 =?utf-8?B?Nk44b0w4OXAzWjhibUV6TUd2dzJFVDJFalA5R3dMN0x6bFhQZmVBRzZESzZa?=
 =?utf-8?B?S25qbnUwZmFLNTdvY0J5SWg2Rk1BblBZMXBkazljYzduK1g5Y2xTc0pGcHRQ?=
 =?utf-8?B?aTFsNldhN1VadktlZ1pyVHBMeXBOTnBIRXM3eWpwY2hzdm5LcEovaFdJNjJx?=
 =?utf-8?B?Njk2bmtpOU9tZW0wVEdsc1NMN1c0L0JWaktzaUQxTlBiTitJOU9rQ1VHdWRo?=
 =?utf-8?B?K2VFM1B4T1RoUnB6UVlIQVJ1WkUyMnphNFRsd3F0aVRKYjRvZ1gyaml6bS9t?=
 =?utf-8?B?a3J1eERjSnF3TEhCTHJaRHlRZms5RGRuNkFhRU13SXF0WUtKakRlT3FuNk1S?=
 =?utf-8?B?TDV5T3NLWnYvRHlKL2hmMXlBVzVjRWw3eEoydFZ1S0VjeHd4YjZNZnhUTnZQ?=
 =?utf-8?B?MzVTVmQ2UktJdGJubnNUTGxMRFhKdWh1K3RWMUFxclBsbkFBa1VxRkt4VW9V?=
 =?utf-8?B?allLMXlmR0VxaGFaYW1lOStNWjV1Y3lJK1ozdkRkWDNRSE5zN3NuUkRLbWtw?=
 =?utf-8?B?NWRrV2FjYmNoMVZSd01uaWFhMCtnY2FjSXVEWVljYzIvb296eFRFQnlLa3hI?=
 =?utf-8?B?STRFMTJ2R0c0Qkx4c1VtdU50MWFUNTFMQzdmM1FtcFJ4M20zdmpGaWt5blV6?=
 =?utf-8?Q?aW7QIGA8z5oGIDKGThzH/u8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabdfd40-b82f-4b3b-6445-08d9bf211681
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 16:45:08.3539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGyQC/ChAtNUW97qRU+G0GYeUHPRNshv0uoYeZh/Sxqdt3Sdk0ALJEoJAQcv32JNwHxiPX9LNSdZGFzyMxeIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 14.12.2021 17:26, Oleksandr wrote:
> On 14.12.21 15:37, Jan Beulich wrote:
>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>>   
>>>   void free_xenheap_pages(void *v, unsigned int order)
>>>   {
>>> +    struct page_info *pg;
>>> +    unsigned int i;
>>> +
>>>       ASSERT(!in_irq());
>>>   
>>>       if ( v == NULL )
>>>           return;
>>>   
>>> +    pg = virt_to_page(v);
>>> +
>>>       memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>> ... this really want to (logically) move into the new arch hooks.
>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>> notice there's some dead code there on x86, which I guess I'll make
>> a patch to clean up). But first of all this suggests that you want
>> to call the hooks with base page and order, putting the loops there.
> 
> I see your point and agree ... However I see the on-list patches that 
> remove common memguard_* invocations and x86 bits.
> So I assume, this request is not actual anymore, or I still need to pass 
> an order to new arch hooks? Please clarify.

Well, that patch (really just the Arm one) effectively takes care of
part of what I did say above. Irrespective I continue to think that
the hook should take a (page,order) tuple instead of getting invoked
once for every order-0 page. And the hook invocations should be placed
such that they could fulfill the (being removed) memguard function
(iirc that was already the case, at least mostly).

Jan



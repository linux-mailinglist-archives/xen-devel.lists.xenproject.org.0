Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D06144AF24
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223934.386906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkRhk-0007Mq-92; Tue, 09 Nov 2021 14:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223934.386906; Tue, 09 Nov 2021 14:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkRhk-0007Kb-5m; Tue, 09 Nov 2021 14:02:28 +0000
Received: by outflank-mailman (input) for mailman id 223934;
 Tue, 09 Nov 2021 14:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkRhi-0007KT-SZ
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:02:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aac409a2-4165-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 15:02:25 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-ebTlZ7TFNseIg6AB3om4MA-1; Tue, 09 Nov 2021 15:02:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 14:02:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 14:02:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:20b:2e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 9 Nov 2021 14:02:20 +0000
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
X-Inumbo-ID: aac409a2-4165-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636466545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yAPD9V9vB+qDkxTtdgPOFyd0MVmFplO5HDEgpCdpTwk=;
	b=QFjKru3zO6tsAp3orYG8NWLmcamDhYfPzOiW9R6lEIOzRWBqteIJcUiBFt6SMIbyQtOvpw
	olXVDi6sF18fLoVLvTbC+M7/SvPDnMyrDRGaFktyY6qkx9kba0D7hNfGlly605Ca9DSrN8
	6yHgf0Z24Z85oGLWIZF0KO8Z5uUOtq4=
X-MC-Unique: ebTlZ7TFNseIg6AB3om4MA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2lAYFf2fb0cMmtAl6JaWIBcJul7K982H1R9GAAlaJl660fKYFXuczQIDNbtF5O6Rc8XObDw8Ki838ZD/mk6nPUkRuzrkD70i77BM0qEO5/WoRvwRSC3FDAkmO8euqwUJh1vJdSxzQ6xZAxxay7g1ajTUZ5LtbPHuQcKyPub9GGZXp2N3wjXPWMKJ48Xq4pwKwgeD1o5aRkUgonZnW5P/jOrvEh56x/bcm8/TadytwHeDFFICOGw9A1u1kg23P1wL7TmOg864tCUIx5g49Bk69cbKk/Hd4jRjNCqT/0RMZrw75cMBbLL+ehZCcHoYrIzgZBPIapEjVBjzFvLmkFvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAPD9V9vB+qDkxTtdgPOFyd0MVmFplO5HDEgpCdpTwk=;
 b=mmDMPjlFjhe7pEN3q/2OyDXTIX/LaBjNN81Ml/4j2Fn9E0G9WOuS2SVInNJ2WiA8XiV26vlHyaO5pdL8hqfe1iyPlJD/6SlBpfFaHkAHRG7Yv0NShQPTuUhFy7f8shRe6XePHCnLGTXOqVHMSN/BnFEvbq4pjwNZaxBCrx8gSrEwhWhq23Ts8qnK5Gx8kinZI4f4OBdWOwpBDZJg0VJdqR1P6e4XhUWTKfIkfUOKX0LF2pJJEkH3eBXrx6ptSBUxnFvhckB38mIrkXPe4mIyoMp0CWAgLeEXImTVr02JzM/5254L08M66YIeSdiq2rzIVcOJdciXfPxZfKG2wDyaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a2e1fc5-9422-5a37-8216-6b905f533798@suse.com>
Date: Tue, 9 Nov 2021 15:02:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: ASSERT in rangeset_remove_range
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: iwj@xenproject.org, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, oleksandr_tyshchenko@epam.com
References: <alpine.DEB.2.22.394.2111081430090.3317@ubuntu-linux-20-04-desktop>
 <666a0b12-bfda-a6b4-a7e6-d58e0a01d5ff@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <666a0b12-bfda-a6b4-a7e6-d58e0a01d5ff@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0017.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0fdda87-e956-48d6-3c77-08d9a3898c69
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32934A6C33555671A7B3C9D4B3929@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VHs2hr3+RcP991BPzapCm5Xftq0IycSYF9vy2n697yGTn6Qdibf4sKihm7LBJX0l/wJO+IHCuG6E8tpeitnbpoFiloYlOMj48+m4lerGvbv52Ee6IvK3bJviJ4YT7Bsoe1f/f1iLUlxZZpbfIgRCPdZmUCD2mPvvpczusei3jBDV8mbP8J5cbile/WUxykpvy4T15AjpaZjOFeX/a0mOtY6x5u4Fe9mKhuhrpkjeAd/vaYIY9N/spb5m+6xXSmz4nks33Wq5xATPFjqiq7tlJ9yoxzLFQY1MUA/FE4qSyDkcMs/mS+QG1eVbh9wznQZiBm3YvE2yoj/0x7wrHbdCUTCuFsozifnLusNRnZcgMwUi6/FJGF3Lrb2GMxGchN7cDyQWiUj+0MOlMg+lOx4n92nU5FWdWZyF9SWP0a+zJXXW3vbQi+vEuanT/O/AuMC0LrbD0Ia05mga8ElmniR1OVmS1dkyR6eeUjFUs3k414jYO8nwAaZWXLUug0+jxiEYLWEfxdWPkBYUd1kN+hAvAq5XDWysopVSn+PObGaOt5tiwLXjYto7MHzL+f8jfnlcLERJJQR4sGhsLmYKyubPF76/c2Vt4crsgxtxkvQbTa5ZcqfbcLniezFC0m4fjzAsWKmxJyh+z5TokLAKqPCSamPvGW6CQn/+Gy9wrvWyFmox2JbG7uteIIGFM8vzi2nsijSDOILZj9Ddirg1CN3H7FRWy5ENzKoDAwJZGPGQw9NM4aDPeWDn5fE4U6ZoPBmH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(66556008)(66476007)(2616005)(31686004)(508600001)(38100700002)(26005)(5660300002)(186003)(36756003)(7116003)(2906002)(53546011)(31696002)(110136005)(316002)(54906003)(16576012)(83380400001)(4326008)(86362001)(6486002)(8676002)(8936002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk9NT0lzdTZKMlMyeVBKS2hPMng3VzArdFJXTTF1M0ZqZXR5YWRMRDQwVTJ1?=
 =?utf-8?B?QVdvWU1kOU03OFpweUphQmtSeHpjbDRkNnBRNzVnSHRpUmV3RThFY0VkZkVB?=
 =?utf-8?B?dW9mUXM5SWU2b3lPUE0wSm9udjE3QTRWVUlIYzVDNE4xVnU4STlLNWRDd0xH?=
 =?utf-8?B?K0dmVjAzN0JNRy8zVGVMaElFekVpZ3pYbkFZU2sydW1GR2hoclF2WDFIUmhs?=
 =?utf-8?B?SW4rY1BETzUxSmExNkE5NlFHQ0dSSW9ORHEwSmVZaERjWkg3VTIvcUxZaGZ1?=
 =?utf-8?B?M0lORG9nb0RLZDNzVnQxMlJ0WDM5cEYwZFFKVkNrZjFNdVZjbzNNbXowU2NV?=
 =?utf-8?B?MlZwMm1DRDBXYW1LZEUwTnFLOWQvaHZ6QnRYWVZZZll2bnVoZnN0OWE2bXkv?=
 =?utf-8?B?dDlrSGtQZzJWSzRDenkxNzJaRUZ2ZjJNeUord3lDdTZjbnVXOFpLeTFKRjMz?=
 =?utf-8?B?WkppRU1yaDBiblhUeFhYN0c0SWRzbEh1N1poc1kxcU1XWXk5WjlUVVdCVXlW?=
 =?utf-8?B?QjFEVmgvbDVYaDhkb2NVL1NYQ3hES1NITHlDY29DMEhxSjlNVnNxMTNibmo3?=
 =?utf-8?B?OW5mWU82Vm1LM01TbWZESGVDWHFabk1Oekdia24vV2IzdVBWcGQzUFNhN0g0?=
 =?utf-8?B?NW5NSjF5MStHN1dHdHo5dEJKUkFDbUplSjN3a1V1c1hzQ1ZoVlhoYkFSLzlX?=
 =?utf-8?B?SE5mc1RuUU15a3FnV3hZMm5aR3hyZjFKcWM5bC90Si96cXdwMHNQbk45bUF2?=
 =?utf-8?B?Q2FLL0VIdUZtbXFZU1RNKzM0ODQ4Q0NyY3ljbllPRlFGRTREV0pUV1BNMjhm?=
 =?utf-8?B?WVVVZm9nRWlVVWNSMGM5T2svN2M5UlVEbFN1L1ZhZGV0ZzcyNkxiOStENDBy?=
 =?utf-8?B?aGdualRGVStLZzhYVVBjUDBOZ1R2bkcxUEIzSHVab09tQVM5MXE0cm5HckNC?=
 =?utf-8?B?RCsyZTRGNWhYbHdES2lFTGNUT2NOOEF5ZGpSQkd5M2dWUEpYVmhtUEpWUFQw?=
 =?utf-8?B?WjkrWGFTTGlCSUZCNGtta256Q0RLbkhCZENwUGJUQ1lBTXR5V2w4TFFvblRs?=
 =?utf-8?B?TlRDYUlucjgxbENUSCtmSyt4NXpXOGJ0K0txZzFuQTR2cWl1RkVQZnA5ZmZS?=
 =?utf-8?B?bmp6QUJiTGZoeE5pT01XNkxLbHMvY1J4N09Edml1bnMzK1ZSQVA3anUzalJX?=
 =?utf-8?B?eWMvazAyalFZL2xPQnpzNjU5NU9CT2FZUFZIeVZwaG5hZHBkK3N3WGtsdDNo?=
 =?utf-8?B?bXR5U3lXZk9PSE5OTm51WXQ5WWhXNDUwTmRBWVF1MTRqWDNpZm41YkRSSGFT?=
 =?utf-8?B?R1pMVkFaQlRhYVdyMmU5RWQxR3JKQ3JLSDVuc0VMbU1BMk54VFZIMVBKaHdM?=
 =?utf-8?B?cnlSbGxtMDROYnZlSWpQNmdFenVrNlZ2TFFBdm9td3craW02ZG1DQ2VxNDVL?=
 =?utf-8?B?VVllamtyWE4xdjNHemRSMFA0REFIUk42MlBnUDVCQUVNU2hxcmNYUW9iOCt6?=
 =?utf-8?B?UWZPK3AvMzlMTmVxaWdOZmlsd1grL0JLQlYwN250Skk4YnZ4cEV0eUtMUHIx?=
 =?utf-8?B?TlhSY2UxeC8raCtDa09RZXE4MGxuTmlkVFJHc2J1NlhRN1JvOHlDT2Q2UjRI?=
 =?utf-8?B?WUpIOG91eWhaNms1WWJWeXBrdjIyYXIvQkhJa2JnZUZpbzN3RFBNcWk5NTZT?=
 =?utf-8?B?eWpwZHBFV1I2VWlNZUNQeXU5Tjh1MmdJWnZ0MmphSnRzdXFpaCtYZVI0ZjJh?=
 =?utf-8?B?Vk1nRGVWbVp3QnpnK2hXOVJuL0JqakZqZzdPb1pLY2ljZG40OVdlQTZrTnpV?=
 =?utf-8?B?WkFWZEhvcWxWaWlIb0pRY1NETnZyOGZUTGhib1JpMGVKYUtnN2piK3d6VUF5?=
 =?utf-8?B?WXpqZjV2L3RZQmpUY3lubTBvNDBnQjhueVZINkxIRGw3STFBcmdwN3oyT3Ry?=
 =?utf-8?B?cFJiWXBPQVQxbGdjbjFNRWN5K2s1eWw0VWRMbno3LzZOeEFwVU5nQ2lnUFVq?=
 =?utf-8?B?U2Q1ZEphTU16bHRPSkkwL0VoenlDVmxYck1SVFhCNHlEQWJlMVl0cThQYlpZ?=
 =?utf-8?B?eTBoWUZHeFRjK3p1Ni9yOXN0T1AyY0kxWk01TlpIT2U0WitJVUIzaldSNG1S?=
 =?utf-8?B?c1JKM00wVTZWOW50dVJORXdEUlJ3TXJmUGJKd09lT05DR0Fwd1ZnNzVyYnVr?=
 =?utf-8?Q?1eu/oVXGAG//vksPDe604Xo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fdda87-e956-48d6-3c77-08d9a3898c69
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 14:02:21.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCfDkofcnJyc6WFcqj01Zt7FXoHuFTGs4HRjeibJoKRGDMlvij1Ut6CbpwuCFwPRgN1U6TLXVEKOJZGIaVFsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

On 09.11.2021 12:58, Julien Grall wrote:
> On 08/11/2021 22:45, Stefano Stabellini wrote:
>> I discovered a bug caused by the recent changes to introduce extended
>> regions in make_hypervisor_node (more logs appended):
>>
>>
>> (XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)
>> (XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)
>> (XEN) DEBUG find_unallocated_memory 994 s=40000000 e=7e7fffff
>> (XEN) DEBUG find_unallocated_memory 994 s=200000000 e=1ffffffff
>> (XEN) Assertion 's <= e' failed at rangeset.c:189
>>
>>
>> When a bank of memory is zero in size, then rangeset_remove_range is
>> called with end < start, triggering an ASSERT in rangeset_remove_range.
>>
>> One solution is to avoid creating 0 size banks. The following change
>> does that:
>>
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 49b4eb2b13..3efe542d0f 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -459,9 +459,12 @@ static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>           goto fail;
>>   
>>       bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
>> -    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>> +    if ( bank_size > 0 )
>> +    {
>> +        if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>>                                  bank_size) )
>> -        goto fail;
>> +            goto fail;
>> +    }
> 
> I would move the size check in allocate_bank_memory().
> 
>>   
>>       if ( kinfo->unassigned_mem )
>>           goto fail;
>>
>>
>>
>> We have a couple of other options too:
>>
>> - remove the ASSERT in rangeset_remove_range
>> There is an argument that we should simply return error
>> fromrangeset_remove_range, rather than a full assert.
> 
> To be honest, this is a developper mistake to call with end < start. If 
> we were going to return an error then we would completely hide (even in 
> developper) it because we would fallback to not exposing extended regions.
> 
> So I am not sure switch from ASSERT() to a plain check is a good idea. 
> Jan, Andrew, Wei, what do you think?

There might be reasons to convert, but I don't think the situation here
warrants doing so.

Jan



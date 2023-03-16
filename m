Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33876BD04F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510578.788474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnB6-0006y9-Ul; Thu, 16 Mar 2023 12:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510578.788474; Thu, 16 Mar 2023 12:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnB6-0006vx-RS; Thu, 16 Mar 2023 12:57:56 +0000
Received: by outflank-mailman (input) for mailman id 510578;
 Thu, 16 Mar 2023 12:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcnB4-0006vr-N2
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:57:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28dadb16-c3fa-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 13:57:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8032.eurprd04.prod.outlook.com (2603:10a6:102:ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 12:57:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 12:57:47 +0000
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
X-Inumbo-ID: 28dadb16-c3fa-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRkcMHSg7nteHw16bSj6iRNsZm0g6m50V4UXNzi4ikSMuHQr7urv1OUrD1/okJ+5Y62/E/6F7EqU5HVXBen/Y6tnc9qnkCeirmst1PfaKZ3yur2WvSJCF1iwRd6oSVJGnrt7o61gefCz7/u2QgCfDY7rKeshKVSyqKZd6mXz0J0OvUF7YYCtAaAd/SHMYXq4TdxcBK+Fkl0joU67lIuAXU3UcsQYU1vb/ILbYsKw0lUrTIAADr7FKZ8y+Kb3m6uNEbLFEIEIiipqBAGeLXilrBrlW5ow705N4G8bUiKUo330/JpHiXo65wQgSoxhuhZmpd+73xkl5hn6Bn2G44a/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTTNPMhlZTG7vpEm6rQjJ/GNuDSISUUy4PmeEqqCvAM=;
 b=WPmy/2MunEfxTRuIHzENXRct4O9bMHULzfSm7RYKPLkaV3jV6nndu2q7Wv75ongB++zAVOv4PeBiDhHlI7cVITYw7AHOcp2tuopcbqctRpoCR1wDNMq9MjSuJkgYbq5MKwDkxifnoCpSz7Bp7Rxj9LAv6TL+/2wIXiq73Ucb22TvNGd7Qz3AhJbVAzSSGrtOyUjbVXVEz3ef/JVuTF7TTxIzv9I/u2YXd6PzwRocPJ7UzQQWop3/l9Olytt+gt31wL+dSUr31U3LTu75kAF408CwqolTN8fU6taHrMGJ2y/shXVyVPXCuM8rJefxNvZwjYMhlTMPs4E8Kyn63fhSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTTNPMhlZTG7vpEm6rQjJ/GNuDSISUUy4PmeEqqCvAM=;
 b=KoC4bTzCjp22cVDNWzCjuA6Jmy4ho/jxYAGIl0kmwry7eXvCfPrp+MdTD0DNR/Q1KkgPooSlukruHmQL7Vo0AoSa04DQO0BlTukOvP7kE3H/3mE2Lb3mL44963ImHyQxGEI4CZMDQit3Z2rnTdDaEceo0lqQ9dQfztXE61wLQ+e8FXimkmX9gIOw5KL/ArNIe7MbE+Y6C38IFV+VUncODrGyoLFuEqn2NQurXZVuinDBzKqNBctGIP7ci1ky1ZMlr89They345O7W5yFqOc1jP26qWFHxNgyR1n72cFaU2Ww2RFXj0f9UyLV1+hOcgkaMZZnoL+i4+e6m8GinnZeMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91d3373a-2a50-f868-7471-08f9def8e6b8@suse.com>
Date: Thu, 16 Mar 2023 13:57:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/5] x86/paging: fold most HAP and shadow final
 teardown
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
 <67b9378f-cf4a-f210-aa2d-85af51c51ab0@suse.com>
 <ZBMKhQWl1pZppgSj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBMKhQWl1pZppgSj@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7b5bac-bf16-4fb6-c547-08db261e0a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YoRmv2AP9IBlVlatMm4ComtvkXcAjl3VhQoiR95oJWA2qfu0lvS2XbahuqmclmmqTMyRKucrC3uscay32gza+4OR0omrk5DKH+s0LfWP4UUykVccybD/Yb6+/QQsHeOOC7Rsdosn9jjJUJSKSpsa/7VJhV0qqvC+QK/7YvweIIGxAhU1NtEXNdLQeXe575gXhe0SuQxbY//NTovrPqlBsZI1/h1xoRnEPle0QfrOcSLSKOtNuZsV9cOjMCINSmg3JekeV8Cth3zeJvFbicMuJnSjNJv7cu8CpWXi+0xcN21l78H0dmRakeypp86X8B01mdHv5A3oSnqA9NLOSewMEV7VyW+A+98c/2T5Y0f7yf2Ssor0hxqgXDoZ2KcjbbIc1lwxlnkfSCi5ycNUwUNWgOr7XcGL0X1PrckLP87fAZaacCwcDHkVtmutedTUzBY2Z7UzbMQ/ilBK2e10zofqLWHoLcyDqhLWs7Ii3jhbzWUijG2nCuAJeTCyN5upFvAAnBytqTJjJUvKN+205btOEAXQd7Nrz56CZmyJ/YDC3zHKBjYej4dKjmsJjTThSushIVYuH1cwF7dqgRogL7Pxp8vz+18ol+bwHv6pd1eeBHsCLHOjnMB+oqXWWsvOwMWHZeUfV5HCjAZbOtN4wSa10a8bdsZJ96JYfPH48dV7cE96+zpf7SyYVbc2MGnrCIfqJR14pVIsLBNAZXvdopjEuLHPOxopKIm0v1KQdUhVV4k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199018)(31686004)(5660300002)(41300700001)(8936002)(2906002)(38100700002)(31696002)(86362001)(36756003)(478600001)(6486002)(6916009)(66556008)(66476007)(8676002)(66946007)(4326008)(316002)(54906003)(83380400001)(186003)(6506007)(6512007)(2616005)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2gwY0VtMzdmcDlUN0hIQVlYTWlMSklzbm13K3dZbXdQVHB6aDhXYTRPSktn?=
 =?utf-8?B?UGpVMzl1T1Y3R0VZZ01ReFdFU2dmSG1rZnJTczc3VUwzeE1BeVFtRENjVDBT?=
 =?utf-8?B?RGV0YnorSlBJajBLb3NMdTNFQk93dHZWMHlObUJFMElmWXFnU0EvWWRKVGQz?=
 =?utf-8?B?aWtRZ0ErcGVwZFNTSmlHOEpjRlRINkVQbDZXZFprYjNsUjJSN1VUdXlraGRQ?=
 =?utf-8?B?TXI1WGxNZTJNKzlNU2gyMXRqMkhVcG1xQWE5SUVIdE56eUZ4VDJJQXN5RXJP?=
 =?utf-8?B?M01uUW1BRDFsRlllOHlnTFFMckpLdG4zVHFSbEZnYzNtVysybVpjK29tbDVK?=
 =?utf-8?B?ZVl3WUtKa0kvWXRodHBqd1lUN2lJQnA0QktjRzhCZTM3TUl1dHgxMndBZG11?=
 =?utf-8?B?U0hVc1ZXM1N3d2ZTdTFiTzhxeG8xTWpVTzljU25rdHh6Z3Z1SFdUb2xhNDVz?=
 =?utf-8?B?WmNFV2JhK2s3OWxxRTRTMlJDT3Q3K0VqM2pRdU1HTzBNWDJwazFhNWhudkJH?=
 =?utf-8?B?UmlnZytaS1k4dmdub0E2c0VDWDNNanUzQ2JGU2srVk02TEpxczU2Q1pYVEky?=
 =?utf-8?B?SXRHcXc1VVZNTm8vN005c0hmRTJzbjFmclAxQm5HekRyYVB0TEVnQzUxODZB?=
 =?utf-8?B?akh4cE0vM0RTV0ttZXJhWlJ5WDluT3VNMzhPVG9McEphSzYrOHVNcnlnaC9k?=
 =?utf-8?B?RElWSWIxby9VNjVidTFQKy9NajZVcU1YcUhjbGhBWnE5aHh4SmZPV2VEa1Qy?=
 =?utf-8?B?VXEreS92eUpwTFQwWUlhVWgyb2JWSzl4ZTIyOGpxRVA0Rzk3RVB6OXpjZFhq?=
 =?utf-8?B?WHpKTUdrZ3BJeDIvb01VNWcyQU9ybmFSZVVNekxJRTA5cVpGb2tIVDZWUXpj?=
 =?utf-8?B?VXpzd2Vkd2MrMDdFWEE5Y3lrUmx1MEZnUG5XZzRLUzVGZ25XYjE0N1RGalFw?=
 =?utf-8?B?QkxmSUxmdStaWkdZZHZZN3JQRjVxQmhYazJoTzhNTHBDNzIyaVJ3SVhtejVI?=
 =?utf-8?B?UFNURFZPVHNMcUJuL3lweDJFRDJZdzBPWFZuUmx2d0NrMThCR0EveTFDN01Q?=
 =?utf-8?B?eVBqbzU1WnF3cUlUdUJNdHdBVGFqbzJpZGZzSkJUeWZxZjJ0ZTBJT2tYZzYw?=
 =?utf-8?B?TmJmMTdLM1pYejIzNUZTa09nWnNHUHRtakhIUmRjQ3kyckVReCsxOXdyOWVn?=
 =?utf-8?B?Qm1uTkc5b0IyVEUvNzAzWCtYcFRJV3ZjbWtyMmZWR21LUGNSVkFZMG44dm82?=
 =?utf-8?B?MDFoRWRNRGVJSFh2cWExcVhlem5Wejd4TW44OEdTUVlDVkRWQkNJYlYvYUht?=
 =?utf-8?B?VUZSeG5hdVZwM2thWmZjTGJrZ2VxMmNRMkY5dnJHeWJCRDlaKzE2TmQrMXgz?=
 =?utf-8?B?SkxZTU0xdmFYWUJpQ2t2My9CWTFJUFkvdjd3NW80emtMYlhSR1VQOW9CTGhG?=
 =?utf-8?B?OWlVZFJZV3lrV0tQVkR5SlU5VVR5UmliSjFRbFdMcmN0cGUycXVqSkg0Vm9x?=
 =?utf-8?B?K1NOeXdGdmUrMmJOZ1E0MGVtc1o5dElzWmxaNUxzSW9sYnc0bWFGeDNNMVRQ?=
 =?utf-8?B?ZXQraUNObEQwTEM4UmthQ2RuZHR0RE11a3Z2eHVBVVJib201ZGpYZG9WMHJy?=
 =?utf-8?B?YnRQZzFpQ3UvM3N0eVF4N2xldXNEeERSQlBVUk5yUW9Qdy9GRjYza0tDMnpm?=
 =?utf-8?B?VGp1eTVleWhtZWdWYUlNUkVETmRTaVlXNldwenRDYi93TEtqRklzREtjWC9Z?=
 =?utf-8?B?WGpvNTlPQlhTN3Q1TjBucUpkNEF5Rys5U3puVTh2bEY2N01hczBsVlgxd09a?=
 =?utf-8?B?TlV6ei9YcDZZcGl0S2Y5bER3cjcvY1FxNlJXY1ljV3EvZHJnakk0UTRhdkpt?=
 =?utf-8?B?V0FjVGlwTzlocWxEazJVWUFUQk1Pb2h0VCt0VnFleWlCRkIzY2NndHY4Qlpq?=
 =?utf-8?B?U3RNUHBKUGszZVgvUUdIK3dsbEh0TGJGampMTEx6Ri92bk1oeGpxTXYrMzBI?=
 =?utf-8?B?c2dBOXVRbjdFSks3WXFzQWNvVEdaUnVXY1BKM282cW1sTEEvRzF5VEhSVWsy?=
 =?utf-8?B?aWhUeHRnL0YrWHdsR28xWDROMUFVb0t3NkpGUmYzNnNGVUllWFE3NnlucGo5?=
 =?utf-8?Q?vQ7ttVTSI8gRRc4uAOPtLUM6C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7b5bac-bf16-4fb6-c547-08db261e0a77
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 12:57:47.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikS4+GSCGlMDmLnrBcOkqzRFKrwQH2wh0C7F/n3VbB2SUGVjapHWI3OpSLlghKtAvflLc+zBQtqMZdw/eC3tAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8032

On 16.03.2023 13:24, Roger Pau Monné wrote:
> On Mon, Jan 09, 2023 at 02:39:19PM +0100, Jan Beulich wrote:
>> HAP does a few things beyond what's common, which are left there at
>> least for now. Common operations, however, are moved to
>> paging_final_teardown(), allowing shadow_final_teardown() to go away.
>>
>> While moving (and hence generalizing) the respective SHADOW_PRINTK()
>> drop the logging of total_pages from the 2nd instance - the value is
>> necessarily zero after {hap,shadow}_set_allocation() - and shorten the
>> messages, in part accounting for PAGING_PRINTK() logging __func__
>> already.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The remaining parts of hap_final_teardown() could be moved as well, at
>> the price of a CONFIG_HVM conditional. I wasn't sure whether that was
>> deemed reasonable.
>> ---
>> v2: Shorten PAGING_PRINTK() messages. Adjust comments while being
>>     moved.
>>
>> --- a/xen/arch/x86/include/asm/shadow.h
>> +++ b/xen/arch/x86/include/asm/shadow.h
>> @@ -78,9 +78,6 @@ int shadow_domctl(struct domain *d,
>>  void shadow_vcpu_teardown(struct vcpu *v);
>>  void shadow_teardown(struct domain *d, bool *preempted);
>>  
>> -/* Call once all of the references to the domain have gone away */
>> -void shadow_final_teardown(struct domain *d);
>> -
>>  void sh_remove_shadows(struct domain *d, mfn_t gmfn, int fast, int all);
>>  
>>  /* Adjust shadows ready for a guest page to change its type. */
>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -268,8 +268,8 @@ static void hap_free(struct domain *d, m
>>  
>>      /*
>>       * For dying domains, actually free the memory here. This way less work is
>> -     * left to hap_final_teardown(), which cannot easily have preemption checks
>> -     * added.
>> +     * left to paging_final_teardown(), which cannot easily have preemption
>> +     * checks added.
>>       */
>>      if ( unlikely(d->is_dying) )
>>      {
>> @@ -552,18 +552,6 @@ void hap_final_teardown(struct domain *d
>>      for (i = 0; i < MAX_NESTEDP2M; i++) {
>>          p2m_teardown(d->arch.nested_p2m[i], true, NULL);
>>      }
>> -
>> -    if ( d->arch.paging.total_pages != 0 )
>> -        hap_teardown(d, NULL);
>> -
>> -    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
>> -    /* Free any memory that the p2m teardown released */
>> -    paging_lock(d);
>> -    hap_set_allocation(d, 0, NULL);
>> -    ASSERT(d->arch.paging.p2m_pages == 0);
>> -    ASSERT(d->arch.paging.free_pages == 0);
>> -    ASSERT(d->arch.paging.total_pages == 0);
>> -    paging_unlock(d);
>>  }
>>  
>>  void hap_vcpu_teardown(struct vcpu *v)
>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -842,10 +842,45 @@ int paging_teardown(struct domain *d)
>>  /* Call once all of the references to the domain have gone away */
>>  void paging_final_teardown(struct domain *d)
>>  {
>> -    if ( hap_enabled(d) )
>> +    bool hap = hap_enabled(d);
>> +
>> +    PAGING_PRINTK("%pd start: total = %u, free = %u, p2m = %u\n",
>> +                  d, d->arch.paging.total_pages,
>> +                  d->arch.paging.free_pages, d->arch.paging.p2m_pages);
>> +
>> +    if ( hap )
>>          hap_final_teardown(d);
>> +
>> +    /*
>> +     * Remove remaining paging memory.  This can be nonzero on certain error
>> +     * paths.
>> +     */
>> +    if ( d->arch.paging.total_pages )
>> +    {
>> +        if ( hap )
>> +            hap_teardown(d, NULL);
>> +        else
>> +            shadow_teardown(d, NULL);
> 
> For a logical PoV, shouldn't hap_teardown() be called before
> hap_final_teardown()?

Yes and no: The meaning of "final" has changed - previously it meant "the
final parts of tearing down" while now it means "the parts of tearing
down which must be done during final cleanup". I can't think of a better
name, so I left "hap_final_teardown" as it was.

> Also hap_final_teardown() already contains a call to hap_teardown() if
> total_pages != 0, so this is just redundant in the HAP case?

Well, like in shadow_final_teardown() there was such a call prior to this
change, but there's none left now.

> Maybe we want to pull that hap_teardown() out of hap_final_teardown()

That's what I'm doing here.

> and re-order the logic so hap_teardown() is called before
> hap_final_teardown()?

I'm not convinced re-ordering would be correct; even if it was I wouldn't
want to change order of operations here. Instead I want to limit the
changes to just the folding of duplicate (with shadow) code.

Jan


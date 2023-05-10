Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024AE6FDB33
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 12:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532722.828993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwgd0-0003Tt-Ar; Wed, 10 May 2023 10:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532722.828993; Wed, 10 May 2023 10:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwgd0-0003Qa-7z; Wed, 10 May 2023 10:00:58 +0000
Received: by outflank-mailman (input) for mailman id 532722;
 Wed, 10 May 2023 10:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwgcy-0003QU-W8
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 10:00:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8df1f041-ef19-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 12:00:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7949.eurprd04.prod.outlook.com (2603:10a6:102:cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 10:00:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 10:00:53 +0000
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
X-Inumbo-ID: 8df1f041-ef19-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXYvn9/tUjqZ7DZ9Y+M0YYKCABtFHH6FEscgAkav9ylHZFQ++y1dZykYO5KUDcV8ovYZob9m3Y6cmovEX6jXaKk8VtHBZCHO8yoojbiWxDehatkVeeSzhcSGlfHYG8XeWexkNPfT1q2/GrYeQvZEOFCVF1aHhPxGEcm7vnCKRH0KvV/nXORhmejYj8fiCAUnKYsrr6i8kOTcfVjAYo7EIrNDfYJgHRODvpVYoO3bUD00JkbeZjsUEaZRC8xGu5K0hcvDbDpb36QYa8yMC5Q26M4f1DBav35wSEGe5NhiUJe6gdxP8xB9zZxvB5lNwRuzgK6yf/otAq7YXb8Vq7l7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKYiWpXDCM+z2qrWJWYHeIba4Y+0XKQKAWBJxbyEV8U=;
 b=USEOvp5Wdr4qBa1n1I9T08tlhDW1G5Kjp8curlMfViyCAVUgy3sRrOe2aCIr1urwUSAZazCW+FjfCmbPskJOYvkQCNISfHFXsjyVik1jalw7hshGHmjJijPCYRDcbxLL+TlRCXxt+nHl3AyQhfBA5Y+5PmJU7hdhDWT/fDcQrqP6nRRJ9Nde7l+YTTPD19W5JFOejvatqBvvoEeGVppa8geduFd2U2xO8Wavl7Ixi3X0wu5x0L3LGuadZf4YQ44veE+iyaL7AanF4K1qBSQIWQ/kgD4nGKrPozbUW+rmMgqnEOiyjiP/PnUY6prctsCGhzkI8SYDbsrSvp+ZWSdPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKYiWpXDCM+z2qrWJWYHeIba4Y+0XKQKAWBJxbyEV8U=;
 b=Wdc6VR/Gqtzs75Kkysv3VG4r7M8yAHv+LMeeV8GwLxxZA4XetBChLr9Dvt5r0xlg9mNgBGNqpjW7q7No6WC4+vc2A+Rx2lDnAtF8xjrU/Eo55/tIpP7R7orEYfsUwW12f6v1vS16D/qjTYUbTnvuQnbkVOYuW8tfgCLAiBW5oRIr7mYegc3sFNaRvbAXHLTKMPxMJfZCPN6IsYiU3wK85/aTycF2isZJRRppGCuOtIB0WfZsSZAMIB3pG2XV5FxcIvbjaZntBcKzoGmTKJ8KwjJXqfh4IiQT7LG/eA1OTHXGhCBnTuFlbia36Qvfj3mhURQUZUGkJcFDz9XatRAi+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bde1d79-03ef-6f8b-4b28-8d7e6867ba18@suse.com>
Date: Wed, 10 May 2023 12:00:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] iommu/vtd: fix address translation for superpages
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230509104146.61178-1-roger.pau@citrix.com>
 <bc750b8d-77be-f967-907a-4f19c783ad99@suse.com>
 <ZFtVYEVsELGfZxik@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFtVYEVsELGfZxik@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0246.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c61b08-9c94-493f-8701-08db513d7108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hb5sQ9OizO5tRjssdG7WYiYlToCFCqT+F+ALFUPufHOIdvzauh54Saa8AmQF8mPO3YPTE/dz5/ddYb9DvXprYHJ9CsGPkU84D117s2cJlwot1Rc+WctgrKPYFUXVCVZcQbLic+WaoJsk7D59EJoT0wVoUSPlacumpH3Xac0BBLJjxBoA9LZ57YpcCUSii0EhZnLqjtp0PAXQshCRb049+VxgFpsBTZe0QyZJhgNBR27tCpF2n8HNZ+ygoMbBkIDOIz6+CsBl8rwQgObbthCTkNvKk5S2GDHR7B5zb6Vff4T091y92KH9KZZA9kauzJNN3uLlSnYqss5gfaSE+BGbK5ZJ6TAvVKJjcPs9YcdsO/5UhuYUTgoIUktlu/8jRsn2MeZiDkXk5yZLr34osqDmSCrcYvy+x+2PYQFqta712/4dXXFgjHHhkFEEVdguZtSx7WYnZNZqrCjRdeqv4QwngBXIZ7YPGPVpRwkDExCtP7AA3t2D9NkPITCmIlH9hvscSRhiMzueOYVAmkbyeKjv52ro5RnoAldR4FDohh8cySFKw+VurQ7T5VcpSrhpuKhtAvnR76nJv1otGP9vnSjIv9g67kC3Gx3z4J+kGM+8WSdtUZEWsKFcEjT8VWOl3Dhw7cxzcR05fCCzJ87XRjIrtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(83380400001)(2616005)(186003)(2906002)(31696002)(36756003)(38100700002)(86362001)(8936002)(6486002)(316002)(8676002)(41300700001)(5660300002)(478600001)(31686004)(66946007)(66556008)(66476007)(6916009)(4326008)(53546011)(66899021)(6506007)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkdmZDVkR2dhdUMraGZaajA3Qy9HZGpWVkFQeERKeVVtUWpGVndhdzhUaUZC?=
 =?utf-8?B?TE9tZWJHZzk1a3lVV2xPRHlTOVV4NCsrelZtZWFwR1Z6RFhHOWR3eUhDa1Rl?=
 =?utf-8?B?WmZNL0pFdUxVWm82bEZrSDdXdDM4bWVVSkppOEo1MDlteE5GT1hQYVpQV0xJ?=
 =?utf-8?B?VlBPQ21qRlg5TDZCWUp3OU5BaE96THBNSzVSVEhxZzBVWitlbG5RVExxaDQv?=
 =?utf-8?B?OThaSWkzQjR6TVljQ3pjaHRFYUNzaEZrYmRLbEMzRzU0NGN4ZzMrNHViUEpR?=
 =?utf-8?B?Wm1WZFZTRko0Ykx4enlYdUFIRFRDSmx5RitsQjFhN2krQ2x3SU9KU0hWTjBQ?=
 =?utf-8?B?QkhYSmxsdEdHdHQ1OEhXZ3FVL1BZVmNXbEhiRVZGUGI1eStjRXpzaGpDMDdY?=
 =?utf-8?B?bzllazV0azdscHA4UGJGVjQvVUcyZmxLTGVTaGc2TXB1dDNtTUdvVGtMTHRS?=
 =?utf-8?B?LzBHN0tTRVN6SmE5WUFzeFdVenM2SUxTU0ZtQnJ4ZjFZcDFIYk9GcjFuNGx4?=
 =?utf-8?B?WE1TZ01yNWVrbUZpUko1Q1VDNDFaZ2E1a1pLcXE4d0Q5Wi8xZ3UrT3hOUm55?=
 =?utf-8?B?cG9DaVpqNVp3a1hvY2poNTNDWGo4N1RESzZLUWlGaXQzcU1ZSk5PTC9maERr?=
 =?utf-8?B?MDlOaDMrU1FVY3NRR1VHTkN2WGRycXRuSkVFRi9jN1NZamJjQXpPUm05L3BI?=
 =?utf-8?B?bEw3Tm14TVBOODR5b2ZQMytoQnNQTUY0UXZheUJCcHJpZFhqL2FiY2Irb2M5?=
 =?utf-8?B?T25aeWNWaXh6NTFTR1pZcTg5NVFiTGRQV1NiR2d3RkUxK0NsZUYwZW5JaHFv?=
 =?utf-8?B?dlpUVmpLS3VWU3ljc3NRUmNFK1ZzQXlxemhlSk9HcjZ3bU5LVHQrK2xQRTFK?=
 =?utf-8?B?OTN4Z25OWUtUSWk3QlYyNGxVWUFlanFDRjdkUnlkRGx2cXlCc1BKYWtua0lS?=
 =?utf-8?B?Y1dPeFkxOVh6QzlmQWpZT1BTaTg4ZnZqV2tzSy9JajVRcXVpVGVBYVVrNmFh?=
 =?utf-8?B?a25JSnI5ZitzeVNsK2M2eXV0Z2srV2JaMUlWRUh1Ym4zUjZ1cGsrV29BUE8v?=
 =?utf-8?B?Y3RXaXJpSlNDb2R6QVFhNTV4R3oyeUlxVm15SzcrSWIrdjU5eDJnQzF4V2hs?=
 =?utf-8?B?bTdyd2hncGxpMWxsWDBTYjYzRUwzQUNmK2VTaFQvbXJ0NWcrTjBOK201bDF5?=
 =?utf-8?B?ZlBTVngrN0NIVlFkMlpNTjAzeUJDalRQdzZ5S1NmeXdjQ21HK1hGWm9sa21s?=
 =?utf-8?B?L0k0c1haTDFKM0wrYjlHdHFFUnp0emRFRkFobzVBazVMOEY2OUhSY1dvbHJh?=
 =?utf-8?B?enl3LzBQUmdabTh2bFlXSnprdE05K3l0MzBNaEFUa0RSaGk4eXA1SHFWTzJr?=
 =?utf-8?B?Tm9xU1VJdUpFK3d3TFdYMVdoeThrWHZOZ09YTjd0WEpWdUptQXEycEM2U3ht?=
 =?utf-8?B?YXprK3VUY0g3T0o5L3hJcUUrc1lBanQ0cXgxQkJsd1FLQklhZG16QlNoS1dw?=
 =?utf-8?B?OWp3WVlYdEFybnJiNjBrMlhYVjlxK1RzelJBU3pOSTlNeUtjaG5qeUVRTjd5?=
 =?utf-8?B?dGNpRWZWeVIxK1N2cURuQmpETzVQSWFjUnFrNkt4MDE2eWNzVTIwczEyTzhN?=
 =?utf-8?B?NEp4Z3NialdRS2ZSSDhzVlBuaG1tcTFTeTZkdmVTRXIvZFQ5ZFpXTUNHZUJy?=
 =?utf-8?B?bHdncVpaN0g3bDNvQ3NIU3QzOG5PK1NNZE40QWJOUENJNmNFeTc3TUg1Rk1z?=
 =?utf-8?B?NkZxRm5GL1dHSjhQeElLTndURHQxUHFzVm03TWF0OHoyK0o5aUN0cUsrTXJj?=
 =?utf-8?B?ZE1aQlh2Uk5BU21PY0NxTE9OZmRFOENJOXBKYWtJcXQ5MWJKd01OWURxUVRP?=
 =?utf-8?B?aFJkd1B2cSt6clI4cDRFUzZYWWNidjBVMWhVdnBsRjY5Qy96Y09yekRnSnRI?=
 =?utf-8?B?cHQyWWNxek9TLzJUanU5K0hRNTlQU3FHQnM4R21lOUZjWG5VYmJUaEdrcGkw?=
 =?utf-8?B?bEVrVEV0T3lEdlZnUk5lNXVyVzcxN050V2d5dGcxMVhGQ0NYV3BqT1NqT0dZ?=
 =?utf-8?B?MXgvMUxZWExoTTZzWnUzRjMrcWFFcnZjcTZ0d3JrdVZ3TllCTGJGY2lRYWNt?=
 =?utf-8?Q?EPI46cRq/R7MyuABhLbVbROJK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c61b08-9c94-493f-8701-08db513d7108
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 10:00:53.5979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ktzvYzMxMfRqEIVyJHUkDdnt8A4Frpl1tFsdddmgnMhlz3JNyC39Bso93ZjE2MGhe2l66ED5zsFVZrZK47+UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7949

On 10.05.2023 10:27, Roger Pau Monné wrote:
> On Tue, May 09, 2023 at 06:06:45PM +0200, Jan Beulich wrote:
>> On 09.05.2023 12:41, Roger Pau Monne wrote:
>>> When translating an address that falls inside of a superpage in the
>>> IOMMU page tables the fetching of the PTE physical address field
>>> wasn't using dma_pte_addr(), which caused the returned data to be
>>> corrupt as it would contain bits not related to the address field.
>>
>> I'm afraid I don't understand:
>>
>>> --- a/xen/drivers/passthrough/vtd/iommu.c
>>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>>> @@ -359,16 +359,18 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
>>>  
>>>              if ( !alloc )
>>>              {
>>> -                pte_maddr = 0;
>>>                  if ( !dma_pte_present(*pte) )
>>> +                {
>>> +                    pte_maddr = 0;
>>>                      break;
>>> +                }
>>>  
>>>                  /*
>>>                   * When the leaf entry was requested, pass back the full PTE,
>>>                   * with the address adjusted to account for the residual of
>>>                   * the walk.
>>>                   */
>>> -                pte_maddr = pte->val +
>>> +                pte_maddr +=
>>>                      (addr & ((1UL << level_to_offset_bits(level)) - 1) &
>>>                       PAGE_MASK);
>>
>> With this change you're now violating what the comment says (plus what
>> the comment ahead of the function says). And it says what it says for
>> a reason - see intel_iommu_lookup_page(), which I think your change is
>> breaking.
> 
> Hm, but the code in intel_iommu_lookup_page() is now wrong as it takes
> the bits in DMA_PTE_CONTIG_MASK as part of the physical address when
> doing the conversion to mfn?  maddr_to_mfn() doesn't perform a any
> masking to remove the bits above PADDR_BITS.

Oh, right. But that's a missing dma_pte_addr() in intel_iommu_lookup_page()
then. (It would likely be better anyway to switch "uint64_t val" to
"struct dma_pte pte" there, to make more visible that it's a PTE we're
dealing with.) I indeed overlooked this aspect when doing the earlier
change.

Jan


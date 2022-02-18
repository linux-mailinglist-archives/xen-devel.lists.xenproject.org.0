Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E266A4BB41C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275193.470955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyZc-0003wM-DE; Fri, 18 Feb 2022 08:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275193.470955; Fri, 18 Feb 2022 08:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyZc-0003tH-A7; Fri, 18 Feb 2022 08:25:04 +0000
Received: by outflank-mailman (input) for mailman id 275193;
 Fri, 18 Feb 2022 08:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKyZa-0003sP-In
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:25:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43ffd845-9094-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 09:25:01 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-K0EXySFlOVu4K_s8W5CwEQ-1; Fri, 18 Feb 2022 09:24:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6035.eurprd04.prod.outlook.com (2603:10a6:208:138::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 18 Feb
 2022 08:24:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 08:24:57 +0000
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
X-Inumbo-ID: 43ffd845-9094-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645172701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpfJ/2lOHie385EtIUECXmt0dCOgdruSpPCiFO+/p2c=;
	b=fS3jL2YYd4Y/Su3sjgl2R1tHnL08Fo1ltOpMqpQuEhIQKqIS/6GboEjbwV6s9PwM+WBiae
	M9BXhpSnzBzNz5XeYLVaPNrKfs/6T4Hp3jk2L0g9UmvPON+25apwQqRHccHrHFys0DoA1d
	uMK23D1Q6A3DRL4mVmPf9uWpQrdWB44=
X-MC-Unique: K0EXySFlOVu4K_s8W5CwEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrshcfwHjzl54bR3UaJI/KjXteN1L7OrXVwZml+glgigsZyoVReMgRxGkbO/+gcQf4hDBfeCXn0EFZbkkZEFaVj2kX7a3r7SVz2Kc5OB8+hXSAhnR4o87jYaZ01nf0u59oeyXUWiCDQ/BhlduAVVS2xNEliDUi6LtRZHJtjZVeeGujkH4iBmtSZKFwyLhIpYZLq41ZE6PFgxlTG/MYeTzOfmPGiTNheZhzX6nPLY103sdGvyyukx+tCWB7+XAXT93jxdsexXpS4/Q4MwdSJcNMzBfC6Wm8xaj3IHQVkBSaalG+h99paXhSTLJUOwvFIQoQWyynykPIIvjKOqC6HAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpfJ/2lOHie385EtIUECXmt0dCOgdruSpPCiFO+/p2c=;
 b=Q0F9pkCAuV2z6KL6TIEewGFv8o+PRdojPIICTQzoMweS7ZQJBXv6mBJju+/vAl1Zh+f+OeF67r0Y1UPSfFYatFxl6xX5G5ZNQzu5oTpbzz4xn1uZfaPwemM9lXjJsHgkwKkJ3zbquoOH+AVteqCEvKBGk+PHef690AaHwhfEdnHK1UEdXbPUgenyFw84iodotWREdHmSA5WsX/pR9d7W5TcDS8O0GnSZO01d0/QskG094ujcQctEZAmmcnb3ZoI+X/Bti1wpmFphpVt/hfFcdDDLu5RZq1mdq3BkU5YttrEDZjHVJv3Xer7z8M8UmpwC4l0lZX0yf0fPVe/pTcVXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78991818-ca76-2065-3511-f7e62a3f2e0c@suse.com>
Date: Fri, 18 Feb 2022 09:24:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 17/23] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant
 <paul@xen.org>, =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <b985d619-05ea-73c1-1919-b0343e5a9b8e@suse.com>
 <BN9PR11MB52763A2638F1460EC83420B38C379@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB52763A2638F1460EC83420B38C379@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0038.eurprd06.prod.outlook.com
 (2603:10a6:203:68::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b01c6eb8-42f7-49a2-0e8a-08d9f2b8260a
X-MS-TrafficTypeDiagnostic: AM0PR04MB6035:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB603599FB8957E0B4121E1D2CB3379@AM0PR04MB6035.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/OeT8T2BMGxqSCNi6Q91s3g1KyDFJW0LqNNibpZi7YFylvGCzinm4p2Gbo768M5B2TJwaVnE2rW8YqSrT93jqy+j8721X0boc4+OZPxGEMRPBsneduWvO4a+azsRvLqj8uldkwPeBhDJ6Gl+4sBoHYEf790ntde8Dzow440lo72trVG5b/niQEYriXbala6HLxxUouvWK9qfcorpGZnu1ehJ9XFv9pzUePEQvyxgCZanuoFVxB9uRDUAyB0bQkA+ZjeistedCDzb9m5AfW3lo78Hq56RFLVff7/qQmO91g1BSccY6GNbfnSt4p7dkcVf37D9ddB8zVnBvboY6bEUewsbMYCaIvV1enjzqAs20m3fasaHdiDmzDNrVVBVB6kUx9xbvPy3XT73gkMq4T4cZGIc6rqGKPOLIm0clr5gefm4xiT/7zOs7o6tX8Vs25GgyY8IxaVBzlAz/ljxcRGN+kDkDgwOTT4D892GBt0ZvRTpznoHCFbChCYoU/LxwtwRFJA9Dn5pfgHEMe/YSIlTuKbJy44hVq8PB0tUum1YEkhVlpR92nLwjISIIk8Au0TuHYzTZHIIMhe9ePEX+DJOsKEvDGgSB3cxejeVMMJZVrsOo/d4yMngwJx+cYDu8LTLn6W7HT0hhHI/dsuJ148EC6p0NUgZrxIlmP2DLFQYszWvRo/JkVPOPuy4UEkbb1cvTU9jdIS0QVKswBbLULsJfkMastSMeuSsZfJPUX7FB5auhNkZictgtMu8fr01ZqPn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(86362001)(508600001)(8936002)(31686004)(8676002)(4326008)(66556008)(66476007)(66946007)(31696002)(5660300002)(36756003)(6916009)(54906003)(6486002)(2616005)(26005)(186003)(316002)(83380400001)(6512007)(38100700002)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWJZMWhHT2pSaGhHYmxGcndQUjJsVnJRZ3lsTVhwdDZ0ZmxHMTFHZ1k3Q0tp?=
 =?utf-8?B?ekdab2JNVXN6NERTaFo5VUJTdDN0SDJSaVptS2UvZXZTb24reEVmaTNrU1dR?=
 =?utf-8?B?WG9xU2RmNnN3VzlqKzZHdnBTSVY5Zkw2YzdSL1lGOWFvcmlXK1lhMmVrSERG?=
 =?utf-8?B?QzF3YjZVazZMMXdNM3FSd29QVHh4eE95UEN5bkxSWTVNZ0JCRFVqRGwzR0oy?=
 =?utf-8?B?Z1RmSVhZb3RjVGUrTFVWNmd0SHFDOUMxY01IQldpblZCa2lRSVBBajNOQUdn?=
 =?utf-8?B?YnNvMFY2L2ZYbWVzZnJWSlp3YSs4Q2ZoQS94QnlwRHRnYVZXa0o0YWFqUkVN?=
 =?utf-8?B?YkpSUDdhNHdBY0dJYytidnVwQks5NE1SRUs3V0UrTlQ5dnZEVmNwQ2ZkdzNR?=
 =?utf-8?B?Q2pad3pjcGpsQUoraFVRbnNsN1lYNkw5RkdHajh0SG5XSmN1V2hnTnJrN0FR?=
 =?utf-8?B?OVE3eFVxM2c1MG1SYVYyeUxwemN1NENRSmZzRmNORzJDMTFreDM3K0d5SVNB?=
 =?utf-8?B?K3BvQVB1RHJIRlhKc1UwQXJIMDRBdUJZSXVVQlc4bTZhVlV6STZhL3Y1d2po?=
 =?utf-8?B?SVpzeHU1ZUJnS0ZkVmJZejNhY284blptZStBVEtOT0d3ZzR3YXY2Rmh1RVNy?=
 =?utf-8?B?VXJIQk5LYjJheUZETGRtaWlwNmw2Q0ZBbzFQcnhqY3RUcVJiN29MU25BM1Vw?=
 =?utf-8?B?QlhDTklwSXNNR1ZiZk9ub1kwdFpRaE1iZUtaK0JxMk1kVVYrSGNiek9MUUpp?=
 =?utf-8?B?OGJhYTJMTGN4dEc4L3FzYytEQ1V2OHZPd0dpOTZNNVJ5WFlSSy9DY0hvMTlu?=
 =?utf-8?B?WWp5b3RQVm42MDdYck1lN2h0eU1MN3FRTkNSOWlzM04zY3RCbWJTNjJYMnFV?=
 =?utf-8?B?ZFlhdDJNc1lFL3lqbnd2V2hsZUtKU2JnQ3ZlbTBodkdacDVkZ29PeW5zQWpM?=
 =?utf-8?B?VXdsVExoY0Zibk1tYTVYang1L3lqNVhOeUREU1lYMmRqQ2RNZ2ZXcm1icFBl?=
 =?utf-8?B?SGdsRElsMFU5RkIrWXoxTytYWnpKYXcvbE1HWUF6Qk16dmhkM1l1d1NPQkEw?=
 =?utf-8?B?aGd6Mjh3eFpCekg2aWQ1VEt2NU41Y0VXdnlydDV4YzFOVFh1VVdXdmFsdU8x?=
 =?utf-8?B?TjFIWkhjZmd5RTVwVytOV0FNYm55amRkTlZKbmc1YXRvZnRpWmhPaUVoR1Rk?=
 =?utf-8?B?dG1RTUIzMjZJcDJqMStmL2gzcWJ3dld6YU1ZdTZEZEsxQ1hYWHpFaEc4cE91?=
 =?utf-8?B?ZnBXVjl1cjdPazJsdkJrYjhFc3lzYTA5TDlzWkptc1JjRUNWejdOaFV3ODFp?=
 =?utf-8?B?ZU4xUURUMitKT1FrVSt6Mk5xRlZud3AxVGc0Q0FveTY1RkZXN2FEM1U5SEYv?=
 =?utf-8?B?UVZMSTFwZVFlQnRZRXJkaHMrb2pUWnY1RCtLTDFuY1paUUFwQW83M1U3STY0?=
 =?utf-8?B?RVp1YW5VMWI0cUlXUU5OMFVKTEtQekdlRlRmbUszV0E5OVZDNDZnZCs3bEp5?=
 =?utf-8?B?cHpLRU9maldPcXZzcGp1REp4ZGlZdGxUek5KYzRRVDlXSHNhc1BqUW1HbHBP?=
 =?utf-8?B?UzE4RmhVbUhnczhKYXpJMkhraWtzVkVZeXBFeE4rem9vYVJYSVVVSzVUSlRr?=
 =?utf-8?B?UkdUbG5FOFpvazlIMHNZT2h3UW5oWGlLK1JFVXlJajNzSVBkTUxLdG8wenhM?=
 =?utf-8?B?d01ieWZHeWU2ZWRVRHlhQndRa0t1WnVyVnhHSDVJQ0l6cDVDTkhOM0xNcFh2?=
 =?utf-8?B?REtaYVNJandnWHpzVG1aV0lLbUp0QVBLaUhzb2FOOWw0NDNyMTlQVzJQWUZI?=
 =?utf-8?B?cXJrTCtaN3BTNmpjQ3VyL2pHUHBiRDZHazJWeEhNcmViMlc5b0NucVdUMGE4?=
 =?utf-8?B?MnhVdi90WmwzZ0Nxa1FZOU5SSnl0SGRQcVIrVHYzU2JqVGtZaXQrRTZlZDYy?=
 =?utf-8?B?Zy9DZzdRckNITW85R293U3dwaitMT1Ewa2E1dGtMTFNoZ0ZCQVFwM1Q2cVV4?=
 =?utf-8?B?S2cybjlUajlqZG9uSDNaZEZKZzJSVFVDbjRoamJRR3RoWUFYaG44VnovZkJy?=
 =?utf-8?B?dnoxeDFhVHFlMVRtZWc4c05hUnNPMGRJVUMzUjRWZ3QyZmVKNHdtRG5kUXU4?=
 =?utf-8?B?UFQ4U3NFVTdJTU15bTdZMndodGYrbUtMbU9yRkROa3lWN09UL2hyU2ltYmVi?=
 =?utf-8?Q?PapaPvm/igA9g2tF7tjyTco=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01c6eb8-42f7-49a2-0e8a-08d9f2b8260a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 08:24:57.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BswgXIsuHUQobfzrZNAdj/zCGmyOvPOIxFYOFmtU/j6yEkkIwhJonw2H3Ihb3UbgLVdvXd5aKJ29nspuI1mp8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6035

On 18.02.2022 06:01, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, January 11, 2022 12:35 AM
>>
>> Page tables are used for two purposes after allocation: They either
>> start out all empty, or they get filled to replace a superpage.
>> Subsequently, to replace all empty or fully contiguous page tables,
>> contiguous sub-regions will be recorded within individual page tables.
>> Install the initial set of markers immediately after allocation. Make
>> sure to retain these markers when further populating a page table in
>> preparation for it to replace a superpage.
>>
>> The markers are simply 4-bit fields holding the order value of
>> contiguous entries. To demonstrate this, if a page table had just 16
>> entries, this would be the initial (fully contiguous) set of markers:
>>
>> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
>> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
>>
>> "Contiguous" here means not only present entries with successively
>> increasing MFNs, each one suitably aligned for its slot, but also a
>> respective number of all non-present entries.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>, with a nit:

Thanks.

>> @@ -478,7 +478,28 @@ struct page_info *iommu_alloc_pgtable(st
>>          return NULL;
>>
>>      p = __map_domain_page(pg);
>> -    clear_page(p);
>> +
>> +    if ( contig_mask )
>> +    {
>> +        unsigned int i, shift = find_first_set_bit(contig_mask);
>> +
>> +        ASSERT(((PAGE_SHIFT - 3) & (contig_mask >> shift)) == PAGE_SHIFT - 3);
>> +
>> +        p[0] = (PAGE_SHIFT - 3ull) << shift;
>> +        p[1] = 0;
>> +        p[2] = 1ull << shift;
>> +        p[3] = 0;
>> +
>> +        for ( i = 4; i < PAGE_SIZE / 8; i += 4 )
>> +        {
>> +            p[i + 0] = (find_first_set_bit(i) + 0ull) << shift;
>> +            p[i + 1] = 0;
>> +            p[i + 2] = 1ull << shift;
>> +            p[i + 3] = 0;
>> +        }
> 
> some comment similar to what commit msg describes can improve
> the readability here.

I wouldn't want to replicate what pt-contig-markers.h describes, so
maybe a comment referring there would do?

Jan



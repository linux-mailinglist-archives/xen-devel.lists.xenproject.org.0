Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C2D65327F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 15:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467960.727025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p805K-0005qW-RS; Wed, 21 Dec 2022 14:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467960.727025; Wed, 21 Dec 2022 14:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p805K-0005nR-OE; Wed, 21 Dec 2022 14:28:42 +0000
Received: by outflank-mailman (input) for mailman id 467960;
 Wed, 21 Dec 2022 14:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p805J-0005nL-68
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 14:28:41 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2c2e983-813b-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 15:28:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7299.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 14:28:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 14:28:37 +0000
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
X-Inumbo-ID: c2c2e983-813b-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6lUJvR3BJ9bA5dcLHKShGnb7whZGnw9/Q+zxFyoxkhCZgKKVM3OAJvRyPjlWl1Xcx9VoaihcRlMjmPODQsHzzQ/SXXrXLQ0pX10UXCPy8aydul+J7MMiGHJRRcEfodwserRHD93WOeeCc6EwYfYBPOc/ja8C/WYFAKe9FaUqdzHlpw/IoCLIhIO4Rxx2CuDLYOUS74DTN4GMDbPI+XMxYli/DrxSBgXWqeB+ZiZmXDhz62Ttf9SKZ7Q2umBbcQ6kNIMvyufTq7MlLt7qyMW4idcJWZ4U2/wNskUS5465Jg+wpaI+8EEJ3i12L0tg6RcKQX3dFU44dBs3eSV3FJ6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bzW95XeRgMGOpd47+WI11+pl6WdJmyLKjqUrmzgKpo=;
 b=L20rlfGizwQ/mAh2msm3cxAxThzAEno7s6YSHMkL1JfWjmtDFhz/4Iefos9z6zvEEgxHC0oMX+r5vEeTZ0UgR7qsLpXHdTf0DYRtpqC2x/xtjiO34CZFL3BXkNNOa3/ZhDiAkYt9km3fmydmhTNgMkuKjOal4w2BwVuMbYc2lxR6i0ZjWjzc0BsBOinPvKJrdce43EmH7oZEZF1z2P66UCsAVu5vAuxDYVnmLICgOb1qOhqPpWEUUwp/k3e+9v2+wC6A3CbkaAORnrNYpEKZIxf9XuB8eoBQnFZOEmm2GNu9oKfuArYLOeN0CV4hJtN82K74ctSIh79keddaNhUBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bzW95XeRgMGOpd47+WI11+pl6WdJmyLKjqUrmzgKpo=;
 b=K9erS9aQzFxYZOXttbSE+KhvAkPs5UOtqK8ZDRy0xCWx8HoUXpEEod6orlWjXWyZN7tXMU2MUcBtgkjkdR+UVGBnDwO/6eSo0tfEgUY5kj92b815tPmfyEpSz2cs9zxpzZ/wOV9Zg8OMETTg51vTIFdxC+FcY3yEhe4RX7PDvveH9vwY934qBin7SXTqwIF2glVcTHvHXzOf6VzWLUcZisJ5XMeT8QaL69uCjk6yUVgWH4QxHoHwS4VslhJel7QozeHsUcgDIBQKigLLnmjx/VtBuWLEJgFWRKc91l4V8QovybuO8T5x2Q0TQKCkyegf0101YoOnFiAtyZW5lud7Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <053dc83b-2e9a-3fe7-621e-7c187d511d83@suse.com>
Date: Wed, 21 Dec 2022 15:28:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/8] x86/paging: fold HAP and shadow memory alloc related
 fields
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <660507f9-87fd-1061-1fa0-2aeb42ac2eef@suse.com>
 <ef7d0d5d-de03-a0cb-351a-d4b0993b9268@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ef7d0d5d-de03-a0cb-351a-d4b0993b9268@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: faba73a8-21b5-4d22-ffb6-08dae35fa5c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ScvePfAtjJpY5F7sZKRrCdH304koXchxvXiYQUzUc3h122vWIY4em2bPI4PNyTWBuukE5c6rFEGwoPaP0R2sCSWeXdKPfGM0vNL4awZxG2PttOSFM1GqVym+L3vwaWDXY2MGD1WCOWyqUUsPG25r+LbvrEBbGXgqcnJ+w8rE+4AWLB+JQsqaMrg6Tj8KeXOK9SLRzy2OhlDu4Jf0MyJHGoAth2McLHJpUvtQstRympRZJNHdKhUc8bJvmu2CzLib+yfSSOke2Uk/r42BEBF3z/bQRFdf+sM0UvhL0p4CPKKQbmJJ6Mbftuyze6SZlkHT2nwoydTWxnY8jtFBHDamwmtIoiNguzbmGEQvSaPgThrtbK3Vosn36R/Hu65Y1TavDn0SEeyKr0+4fhO0dISEpl8LtDOdC8yYi7lkp0mO0LU3dIYQHQSkeeVLlhHaS2OfgwPp9JQFf7XiuBcXAJmmqchb4o8pDWiIYomIVUJIJnuw2SqVMgQ0PCchyngpCjiLQOA49UGHOZ+Atfy+sAexEi0bVvn8IyZ5bAKP0a/H5OzUAgCb6NDw1LBS+gmEz2lOqjxxXB5ayNRJz8S8g0d3a71KUPYt3HzcGId5Vzt40X27OEn4MFoctzZTRQmpnlmahe3QxAZpPZZYBva3uBGPqX56RUt1hxctHvHo1vMuIaIzdLMjj3ExbEoi09k849yjcOgzzvv0RHzDvd0dMwqavuTeqDWLwVXAmZqCk49o9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(6916009)(86362001)(4326008)(8676002)(5660300002)(31686004)(6512007)(186003)(26005)(66556008)(38100700002)(66476007)(316002)(2616005)(31696002)(66946007)(478600001)(6506007)(36756003)(53546011)(8936002)(6486002)(41300700001)(54906003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlZVT2QzUFJOV0dUWkZ2TmloVTRBaWUxK3hVSk5ZUlhFVWZSc1Y3amJCb3ls?=
 =?utf-8?B?MmlzSVZTSjI4WnduZWpXUnIxWVVkenJIWE42cmtCM3RUSmZkTEVyQUtKRlho?=
 =?utf-8?B?QzR4dGRpR21FTzNBN1Y5dTVzb3VSR1Q1ZVNNb2NVdDBrMHhjcGF0dWtlcXFv?=
 =?utf-8?B?Z0Noa2lFV3FkUjhVeDFLWHJTSzd1aVR2S3M5aGcyaENYQ2s2U3BrZmxNTFJs?=
 =?utf-8?B?TnlMbkhlb3kyeXRFRmpuTGZldXJ3QmhQZmFJbkJ2dWUzM2REUElXaEtZNnQ4?=
 =?utf-8?B?SHFTRFZQbXpsOURYd2JhaDVtSnFVQWNVUjc1alFFZFBMS0F6K3Rtb1ZnaHFD?=
 =?utf-8?B?TVdLR3UvOUt6U3JYVGUrenJvbStzdDBLQWMrbmtaQXoyeDl4QktLdXBFNFVh?=
 =?utf-8?B?Y2RMQ21pejlQMThmSGR5RDhRSmRtd3BkUCtpUUtNTU4rMzk5d05tYk02ME5Y?=
 =?utf-8?B?Tm5GbjVuL2FwdW1BNi9vOU1oMVEzRE83OTY4NGZyYW9ENGx6ak5YWW9COFRS?=
 =?utf-8?B?NHJYRjB6OGVSMVhMQ3JxQ3JOcTQ2UElSdHROb01XRk1xN3oreEF5bTBMS3gy?=
 =?utf-8?B?VEFCWURGcVJqU1dLQVFrMk5PblpWK2xIQy9EZFhXSnF2MkxDa1BHNVRtSkt4?=
 =?utf-8?B?SmZLejAzR2VWaWdWTFZwcGszWXRwMmlZTkhUc1cxT29wYUpvbjlkN3BFWHlH?=
 =?utf-8?B?ck9zRkJ1Zm5sTmhXdEtuakFNS2UxZTVuUDFQWHV4Y1dLZXpTek9HcDNnb3RJ?=
 =?utf-8?B?aW04N0psQ2RmY2YwZ2NveTNld2dFYTFqcVNwUWwyRTFzaDdJU0NEWk96VnR2?=
 =?utf-8?B?YXhYNVZiVkFObzVSVUlRN3dEakN3My81YmFuc3dGNm4yaEhud1FyTjJ3SFNz?=
 =?utf-8?B?ajlCYmhjNFBkN0pNZDM1UHF4VjVyNCtETDlwVlU4ZStRcWRUVnRna0ZFZy9n?=
 =?utf-8?B?TG03cGFsM2MrTVk3VHdpeURBdC8zRVlkOVVTVUhmN2ZRcWhNT3ZVdmZEZnho?=
 =?utf-8?B?RUY4VExZejYvU2s3ei9Tb3RaR0tQMksxMkhoSG9EWFdWdWRRMlF4dVUzSkpl?=
 =?utf-8?B?NEp4TjN3cjVUem1WVlFDbmtPNUtxTUZEd25DaURQZkg1cmFsdldCaHFieXNo?=
 =?utf-8?B?RGs0TE1pNEJoSkNSaFl5emtZYXpUUmpDREJNU0ZIdnFzWEppdU5RSndwMXFw?=
 =?utf-8?B?R0JSNitHRDIyRUsxYWkxZVBYSzM2QXdpV095WFNBWHdvUXFhY3N0a0JKS0VR?=
 =?utf-8?B?YjhCQ2xackFCbEp2UGZRVFRmOFhsZjc4eW5SN3J1M0hlVDZsZGxZdklqYVFv?=
 =?utf-8?B?SllPdWNyaFU2Z09Nc1Brd3ZCU2xXcG9tMjEraHd0RDI1M3ZJdkkzUk0wMnZy?=
 =?utf-8?B?eU95N05UbStSRkxZWFI4UU5wRHZ5dVBPd1ppOExBMUFpNnUxN1VYVjh6MFFE?=
 =?utf-8?B?cVRzRGhTUWhjZ00rNDlxZkNPallDQ0Y4YkhxVG1ja2EwdXA0NFRVU01kU1Bh?=
 =?utf-8?B?TmNxQ3V1c3FPQzdIYS9oT1IySWxmVlg3bmNyTzhpMWYrQS9sVElWbit4YWtw?=
 =?utf-8?B?c2lraFVMK2RzNVU1anRFT0FRT1Y0VDF5cm1Rdjc0SGUxdjJPdXBiUisycFNm?=
 =?utf-8?B?MVk2TENCVUUyTFZjT2hSV1R2dlZwVmtWUE1CQ0htM3VOcUZiMGxOOUZrVGpI?=
 =?utf-8?B?eHFlWStWNlBxUWxqSHIwSnFaMGJQd3l0RHQ3UFdhWUdVTG91OU1GTXlaVWRK?=
 =?utf-8?B?d0FpNnZQZWNYUFpMNHRPZU9WalhLYk1ER3JnYzF2dmppeTRETUpFZG9DV2ZM?=
 =?utf-8?B?VkVPSXhUd0R5MUh3S251OVI5cmY1MWZ0czZZMENFaXFTdTVnTmEzUnY2Z3ZY?=
 =?utf-8?B?Q0xKK0VPemNYTlhQQ28wMEZDbUlzY0hoY0U4V05SUzZnS3VNeFdqQW5TOWN5?=
 =?utf-8?B?emVhREpZcXBHZGxPZHVYbjU2M05DcFlsY214WUlHNDgvOGtrdnNlNk5wNWRk?=
 =?utf-8?B?ZnpFd3lmSzBGa3RIV2YyVVhESlZKSUduZXhEU1AzbGlsTUpRR2dSNCtIYnZJ?=
 =?utf-8?B?dGl3UkwyUUMwT1ptY1VTOU1aK3RDSkI0cDczUGMxRUVBL1hnRTZKdGNITjVr?=
 =?utf-8?Q?i2ZBV8SiMFLnxSoToP99djJX8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faba73a8-21b5-4d22-ffb6-08dae35fa5c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 14:28:37.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvO5WH65n3X+BYJA+BRLx33DelxgN6dApOpyz1RrVzwHbQ/8f/PVC6rihg+obM+az3RIhTPwQLd4E/+8sbW4cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7299

On 21.12.2022 14:49, Andrew Cooper wrote:
> On 21/12/2022 1:24 pm, Jan Beulich wrote:
>> Especially with struct shadow_domain and struct hap_domain not living in
>> a union inside struct paging_domain, let's avoid the duplication: The
>> fields are named and used in identical ways, and only one of HAP or
>> shadow can be in use for a domain. This then also renders involved
>> expressions slightly more legible.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, with two minor
> suggestions.

Thanks.

>> --- a/xen/arch/x86/include/asm/domain.h
>> +++ b/xen/arch/x86/include/asm/domain.h
>> @@ -179,10 +173,6 @@ struct shadow_vcpu {
>>  /*            hardware assisted paging          */
>>  /************************************************/
>>  struct hap_domain {
>> -    struct page_list_head freelist;
>> -    unsigned int      total_pages;  /* number of pages allocated */
>> -    unsigned int      free_pages;   /* number of pages on freelists */
>> -    unsigned int      p2m_pages;    /* number of pages allocated to p2m */
>>  };
> 
> Do we want to drop hap_domain?  I can't forsee needing to put anything
> back into it.

I would prefer to keep it, even if it's unclear what may want putting
there. It's not obvious to me at all that nothing ever will.

>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -979,17 +980,17 @@ int __init paging_set_allocation(struct
>>  
>>  int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
>>  {
>> -    int rc;
>> +    unsigned long pages;
>>  
>>      if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
>>          return -EOPNOTSUPP;
>>  
>> -    if ( hap_enabled(d) )
>> -        rc = hap_get_allocation_bytes(d, size);
>> -    else
>> -        rc = shadow_get_allocation_bytes(d, size);
>> +    pages = d->arch.paging.total_pages;
>> +    pages += d->arch.paging.p2m_pages;
> 
> Any chance I can talk you into having a second space before the =, so we
> get:
> 
> pages  = d->arch.paging.total_pages;
> pages += d->arch.paging.p2m_pages;
> 
> nicely aligned vertically?

Sure, I can do that. I recall I was actually pondering whether to ...

Jan


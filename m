Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C1467814C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483130.749092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzca-0006Xd-9U; Mon, 23 Jan 2023 16:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483130.749092; Mon, 23 Jan 2023 16:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzca-0006Uk-5k; Mon, 23 Jan 2023 16:24:36 +0000
Received: by outflank-mailman (input) for mailman id 483130;
 Mon, 23 Jan 2023 16:24:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJzcZ-0006Ue-0m
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:24:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b0ac85d-9b3a-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 17:24:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8594.eurprd04.prod.outlook.com (2603:10a6:20b:425::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 16:24:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:24:31 +0000
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
X-Inumbo-ID: 6b0ac85d-9b3a-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX5vUPMpCHWodzN3sXdQycIMaWITxzZatTAXmDfK0+IV6MH0yF9EE2bJ0egmC0aqhy9flMKBBGiy2TZm8Kgz0HRrPPzcuzAvDo5mfzDrKWteRM0JKm3yrLo7ZikWKjF6/BaKwO3liOjIYy0aa1T+vSIwQ1K4SUEQX3sr30mZj4BG5wctGNkhy8xAlt8qcZuJ2I8w/43BrYYw0/Kaxrf0wFkNyf0rVWw2lijG806HJ4/7VNJnRg021blW+EUQZbhY1JQa/gOWJfGgQ3YA6vgYUzzxUcxZ0l7J6C2oKnopw/VRslQ69/QTXRVHIWdrrzsxUXPdBlECequvvu4vPh6vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpEjFsSQ6y2gsr604WoOs2H3Jxs7HWLWOC83Gv+E2tc=;
 b=ddT/d9P40v5Bl4yKBu9SZX+0GUSiCA1HvRXVA2FPQFpGvHLE5bhRnriiw7C/mtp+B0wLwuBOfOMHnjNwF+NwtkSNmHJhhfXHozz8T/LHz+TIdIz6T4+50GCZm5Y0iQ+qNI/jiFKR5cPZKlyZR1WsZk827SRSvwwvZqYwOgtHaVUhjmVSyTJqif/YJDF/fw5PRC4dps99W1nk6Z1SB8FEY3igTD7a2FoLc/uTL6ss1hstzxoZ9Jk6fA4JAJ+oXMw6BExwoSMg7drZNnPBVhLm/uhc8vo2lrT1ptfEEs4YSPIfAcvl2JnxQo0rZkZPqRBj2NbaqP7F/NVWBNlPrS3MMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpEjFsSQ6y2gsr604WoOs2H3Jxs7HWLWOC83Gv+E2tc=;
 b=xvIqT0v9UEPEY3vbcNqtPMghYqMO1VnnvLoLEPiL+MDe371inAlwZEBYLIQVBj2h1EwpPo6k1DoDdWWuCo3/PrKdx9Dwb5VB+vI2mif0XdZiUJhHwPZJFZ3j/LbpaqkSqsidzUjZFrZSd2EEJh9ke4FlzTS1nKdCP2KTuAEzcjbUMKiZs3v/hvuHKeTisMVXEFGkICQ2/iGDnaL6rNQ9d7Qci9U/uMgciBJsktv9y1V5a7y3gGnIpVMQaypF6GkXjlBV24seGnw2a0EeSAEf72k2W9uuja2+46196Vzcd0Icu0zZ6N/CDtVSdm5FhR0elV7cvNPm6ONULvydoo0iMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com>
Date: Mon, 23 Jan 2023 17:24:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
 <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com>
 <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 13d7ef72-ab85-48cf-818a-08dafd5e4e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	muht6iyUJbb/sqqC+tD7FSAbJwUha5OuHP6q9nzs6YjrN8BZzsVWIOcbGv6YOU4OZ/IMW6sDJurUYQdqv9ftaWOjnQxy9JTCf7QxeZu+GaUXWVyW0Z1H/pMCnVy+5mi6IyGR/39Xu0ZHAu5kQjvz9Hq2IPY1JyAJgmHtavG1d6BTCwS/rYKFd925IY/ktfZA/Gxrlp/U+69Fh3z1bSBy/S71QQ85+gLcAngO4uyLyB/RrSabEw8qW9FlmyA8gymw6VPfR7dUT4/TeQxBplVRleZ4xjDtrdNcISshFipNHlwIKeQBV9LfC4sNszINL4KjfCn+xaA1UbgRSPiaL74sZRRl3nVDLAyMDKILoewTlESxFqAKBhuPFMGAgRzar1489GVmY01/jSbk+TbP6AkrENJ+o181Hq5rmIEC+r1xpCu8OUdrfaCKacEFfJDqpd8hGvPLeqn6y0fdOmODFNlqV9fyvGWEyIFCG/c6oBVT2kI9r15tY2eRn10ZlybcAxaC3UWd2ODGJXOueCRFnrPmZGZyUV4ehJAkiiQtNNqxn4nVKE3vZ1u1PvgeI3ar1Y7D/r1kg9KA7bSEvb9mD9CEFdRJToa1vS78UlVwIAZFuEPtD4slnWqvS7IV1e/RPSYaU/JOIibcM3ogmeipff8fePXird0zQI056TtWc61qgI3hU0iA8vS65QfseyGfL5W6Uql4zccrtk4OMlPpEGQNQCdstByMDb0n2XjlaDhv3l4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199015)(36756003)(66556008)(8676002)(6916009)(478600001)(2616005)(4326008)(66946007)(66476007)(6512007)(186003)(41300700001)(26005)(2906002)(31696002)(86362001)(83380400001)(31686004)(6506007)(54906003)(6486002)(316002)(53546011)(5660300002)(38100700002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dURGRUR3WHQ2bWVWSk9zZkxLRDRldDcyNzhTdGVyaVdLRTg3WVF2TlRSMjZM?=
 =?utf-8?B?VmoybFp4OXdpYWIvaVQ2MnZFUFU5eFljOWJYSUV5Q3V2REFGeXdVQU1EYjhr?=
 =?utf-8?B?djViTG1oMEVSN2R5VW5UV0w4dDV5WDJsL0taVldXa1VRc2VEM0dPYjJZWGJn?=
 =?utf-8?B?S3hlRjhWZCtYK0VSam9ENVhiRndKekxGRFp6Y1VpWWxsNlJtb1RDUEdIU09R?=
 =?utf-8?B?blBaU3FsOVFXd240QzVpODhRajlPTFRjOHFHT05vMEw2UG8xQzFOaG5xWGxO?=
 =?utf-8?B?RzlVdnBkYjJCSVpLa24yLzY0eHVIdUtMZUxHampJNTgvYTZMWkVzdmUzVWwz?=
 =?utf-8?B?cVZEbVBuL1dvN2RMVzQrMi9md1Y1a1hHejYzZjZtM0VxTi9YNVpMWHBFbTho?=
 =?utf-8?B?SVVVd1ZmNWIwemZUSHBUQ3RiK0E4c1ZIbkFmdkJqZHNxNmVGM1BYOFNPV012?=
 =?utf-8?B?NW96Mnh4ZTJDWklkRUduZGFDNWxHbm9Gd2taWFRNa3lremptMEFqaTlvOFZH?=
 =?utf-8?B?Rncvb0Z0WWZieDI5dnpwWGtTSzRJaGhudFBDTDM5SU1xTXl4N2lnUm5NUXFn?=
 =?utf-8?B?cTVJOUNLZlgvcTNLSzVhMFY5V2FubXVrbGtEcHpFWmpUdkFYZUphd0VnL1Jz?=
 =?utf-8?B?N3VDbElqTytsb2ZPOTcreVl5T0dXWklzUExPeXhtbzlYWHdqVGtsbHBzSVFK?=
 =?utf-8?B?RXByMUJhQjRPMkUvaEFySmhpdk8zc2lNamorTmsxbktmbmQ5cDJpelZuaXF1?=
 =?utf-8?B?eFBlUVhtcWJnQmtQak1heXBndkxzVDBZc0pRVXI0YklML0FVRGFWdTdZQmtq?=
 =?utf-8?B?UzA0QzdFK2JTTnVMMVF3Y0JQOVU2QThoQjhDZittV3dGSlI4dlBnNUNrTzdE?=
 =?utf-8?B?NG40bkFmWEtET3RIK1Baem5leS9jd256eXkxcXpBTEdvb2M2Z2MxdXJUSUpz?=
 =?utf-8?B?WFg4Mkw3Yng3bVVlM0duVDZoR1pyTDFaWVpZeHV6Y1gybkZpVFdMaFg2bldv?=
 =?utf-8?B?ZTNrVDhtUVZVYzQ5Mys4Rk9LTlgyVmNuVzlFTGJKbS85d2tjVUxZWjB4NTFW?=
 =?utf-8?B?Q2gzSUVwWkorQ1BTdmdIUzh5YVVhYUNMVzNnd2FrR3ZyMEUyWWxrc1RCR2Qv?=
 =?utf-8?B?c1hpaWlReWpyMlJHUmtrVDdhZDduNkQ0SW9NVFFTT1UrYlRmckFtZTBqNjlu?=
 =?utf-8?B?dUxiL0V2UFFTQ2dIL0k3MVVBSFcvaDUyMkljejZvY3JKaEJaUXZMUEk1ZmFC?=
 =?utf-8?B?WkNBQkkyMlFUenAvQ3g1WkNvMnZzRzZiWjZma2htcUg0UlpzK1ZhbG5EelMz?=
 =?utf-8?B?SDVQODZ6cjNzbmdFVUcyK3JOTnEzOHhOMy9vZGo2VUdoTTk2ZklLaUUvVU44?=
 =?utf-8?B?Y2xuYzBWRGNOYVkvZEVlazNRRUNDSlQyZlFJbzBRQ05PMGw5VHNKWXA4c0pR?=
 =?utf-8?B?MzV1Mi9wL3FkSmpVSndGQzhXM1NtVlAxeHFRaGN2SUM0Ujg0a2FINUFUc0Mr?=
 =?utf-8?B?YjVXV3hTRkhseHpLVnhSeFkvR1B2MUptWTJSTnE0RHM1cHVuNTFsZ0lmNWNl?=
 =?utf-8?B?N2RHSmIwemIwbEZGbkw5R0hkN09QT1RHREdHUmJSVWYxN2NMNEMxeGhpVkVD?=
 =?utf-8?B?TzdVSHFaVnllbWVjdG1rS3hVaXFnVkdWL2g1dGI2RStQQ1J1WXRFd05LVFBD?=
 =?utf-8?B?ZENmS0VrOWpEemd2WnhQaFVyNmNHYndRcExYUHJ4TklqWVpmR2xTUFI5TDR1?=
 =?utf-8?B?bjZYc2JxbXY4TUFZNDF6dGhzTVBCNWkrVUhmaTZENG10T3pXSG1OZ3NwNFlB?=
 =?utf-8?B?U0kwVjRQSlVFLzdOZEFVREtTcVBob0Z4dk5GZWtFRVlEbHVlVTRLUnhuYVBE?=
 =?utf-8?B?aHNCOHFsMm4wT3JEN2VHbGZoZ2tEWFI2WWNKcTJrekhIc0ZQMG1zMUlvMTBr?=
 =?utf-8?B?Q05GYnUweGt6NThyNjNtNUtSTWRIR2c0Y20wcS9yRzR3RmVoTFU1L0liSUgy?=
 =?utf-8?B?WEhQZzdPYStWZFRnZUhSV3RwMzZiK2lYUjJlTk1nSC9NR1NGZGFoRFFjdTZt?=
 =?utf-8?B?bFFxWDBWUnVmTmFRMUF4dC9PTE50cFRGbUlVSnNMZTBESkIrRmVpb2NWQlFn?=
 =?utf-8?Q?zyWim2ApX4DyRnsUE2vW4x4xx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d7ef72-ab85-48cf-818a-08dafd5e4e46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:24:30.9905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXiEbKU1aPVXni6M8W9ZGuR9V9uNTwGKs01RL6Pxahz9Ou+jENi++rmK8MvxlMMdweyA3s3uszzZenfFDaPH1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8594

On 23.01.2023 17:09, Tamas K Lengyel wrote:
> On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com> wrote:
>> --- a/xen/arch/x86/mm/mem_sharing.c
>> +++ b/xen/arch/x86/mm/mem_sharing.c
>> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>>  }
>>
>> +static int copy_guest_area(struct guest_area *cd_area,
>> +                           const struct guest_area *d_area,
>> +                           struct vcpu *cd_vcpu,
>> +                           const struct domain *d)
>> +{
>> +    mfn_t d_mfn, cd_mfn;
>> +
>> +    if ( !d_area->pg )
>> +        return 0;
>> +
>> +    d_mfn = page_to_mfn(d_area->pg);
>> +
>> +    /* Allocate & map a page for the area if it hasn't been already. */
>> +    if ( !cd_area->pg )
>> +    {
>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
>> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
>> +        p2m_type_t p2mt;
>> +        p2m_access_t p2ma;
>> +        unsigned int offset;
>> +        int ret;
>> +
>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
>> +        {
>> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain,
> 0);
>> +
>> +            if ( !pg )
>> +                return -ENOMEM;
>> +
>> +            cd_mfn = page_to_mfn(pg);
>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
>> +
>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,
> p2m_ram_rw,
>> +                                 p2m->default_access, -1);
>> +            if ( ret )
>> +                return ret;
>> +        }
>> +        else if ( p2mt != p2m_ram_rw )
>> +            return -EBUSY;
>> +
>> +        /*
>> +         * Simply specify the entire range up to the end of the page.
> All the
>> +         * function uses it for is a check for not crossing page
> boundaries.
>> +         */
>> +        offset = PAGE_OFFSET(d_area->map);
>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
>> +                             PAGE_SIZE - offset, cd_area, NULL);
>> +        if ( ret )
>> +            return ret;
>> +    }
>> +    else
>> +        cd_mfn = page_to_mfn(cd_area->pg);
> 
> Everything to this point seems to be non mem-sharing/forking related. Could
> these live somewhere else? There must be some other place where allocating
> these areas happens already for non-fork VMs so it would make sense to just
> refactor that code to be callable from here.

It is the "copy" aspect with makes this mem-sharing (or really fork)
specific. Plus in the end this is no different from what you have
there right now for copying the vCPU info area. In the final patch
that other code gets removed by re-using the code here.

I also haven't been able to spot anything that could be factored
out (and one might expect that if there was something, then the vCPU
info area copying should also already have used it). map_guest_area()
is all that is used for other purposes as well.

>> +
>> +    copy_domain_page(cd_mfn, d_mfn);
>> +
>> +    return 0;
>> +}
>> +
>>  static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>>  {
>>      struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
>> @@ -1745,6 +1804,16 @@ static int copy_vcpu_settings(struct dom
>>              copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
>>          }
>>
>> +        /* Same for the (physically registered) runstate and time info
> areas. */
>> +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
>> +                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
>> +        if ( ret )
>> +            return ret;
>> +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
>> +                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
>> +        if ( ret )
>> +            return ret;
>> +
>>          ret = copy_vpmu(d_vcpu, cd_vcpu);
>>          if ( ret )
>>              return ret;
>> @@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain
>>
>>   state:
>>      if ( reset_state )
>> +    {
>>          rc = copy_settings(d, pd);
>> +        /* TBD: What to do here with -ERESTART? */
> 
> Where does ERESTART coming from?

From map_guest_area()'s attempt to acquire the hypercall deadlock mutex,
in order to then pause the subject vCPU. I suppose that in the forking
case it may already be paused, but then there's no way map_guest_area()
could know. Looking at the pause count is fragile, as there's no
guarantee that the vCPU may be unpaused while we're still doing work on
it. Hence I view such checks as only suitable for assertions.

Jan


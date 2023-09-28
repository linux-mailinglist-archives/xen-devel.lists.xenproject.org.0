Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D77B1815
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 12:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609433.948535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnzC-0001Xi-P7; Thu, 28 Sep 2023 10:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609433.948535; Thu, 28 Sep 2023 10:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnzC-0001Vb-LR; Thu, 28 Sep 2023 10:11:10 +0000
Received: by outflank-mailman (input) for mailman id 609433;
 Thu, 28 Sep 2023 10:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlnzB-0001VT-7D
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 10:11:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 572f4cd7-5de7-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 12:11:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7097.eurprd04.prod.outlook.com (2603:10a6:10:12a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 28 Sep
 2023 10:11:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 10:11:05 +0000
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
X-Inumbo-ID: 572f4cd7-5de7-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbdilbLjUW1bp8PSYWocBA1WPxl+1ov31P6490xeFTnXUOxBfkE1WBAWjWRve42sd7K9f/+RFkWmLe97FO+G7+yVjx34dr6Urx69X1CP83XlolaYIFuqeDb7fqzbbwfL7Y7ZGMiuuKg8LsFAkoJdF5Ob1WbiUzGV/2u5WErFy0djdnc+X7hoNpx0hWDglXwkw4N2t8adZ+vlCHke/vzKH5YQU2QQa0dVHUvwsCr820to6GZSP3/oh/Jn7hDOBdsMqgpj0wlbuuvW2s+OrX7Oku8pPXpt/GjvGP/eYwXph0MI2+8UUbooAZfz5g8rKCpOCqotaFvvX6XCJAsmgKmk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMXGBBlkA6slFqLbMvehze/eWvDnTt87mceZCPdp12w=;
 b=FgGEZAFCEKZ4FEWZIBA/2hZoCGCHMl0YYPx0kjl5VTBeF5VtfDxO7/dioXiW1FqaWmK4KkfbdoDEYc3ueXFfzNoly91vlJcY10FtMjvj42pdllOVEifgi9jvRXx6wDPhhfBbBytVGaxcEimFVBT9qbhr8yjrXuzKF75gdz4PZ2WaB4tjkfTC399mBWJjd+d5t1BYLEbU7TeE4GEFzelEiLeTCXy3C6LcZcakkiV4ynyL/U758O+eMjNXMAwXyF9mxm6tOWOI9cd2FkhSH1nvS6gbQV0UH36c5C+NhakpM8LyTWO5uKPV36jOechRY3MuOLqwZlaDkUuzXE8jvyl7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMXGBBlkA6slFqLbMvehze/eWvDnTt87mceZCPdp12w=;
 b=MeEcBPWPDsjmQxtO76cHwZYU7BVUqgZsFDEuvBwcYWFW/k6hdIEOD7VAU1Nl9DqroxDn1uY/jiFB89EmBJh8RRkBN4aA1KFz5kLCAT6Obb8ImSbitdAfw7ZmC+J7BD3cv16VOqLzKzinEIurNKMywchvOdPITT8Tjaio6BQZlSWeR/6q6vR+3UvLoxBjunx4MfVi/b8fwNEFdTpKZ/PcwafEXJjNxmUCs4LZNCLnylon22oOqyQSDWUcOLQpgcANa6BZPBI49FnR6RZf0o2j8WMlIyI9SMoVvI1VxlTmbMn/4bHk5YjM9e7VZS9RK6AReK/HtqqqMfCapIrNSDjt+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d285a456-307a-0a36-0910-cb80f419627d@suse.com>
Date: Thu, 28 Sep 2023 12:11:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/9] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
 <ZRVMhdyI8s4chr7b@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRVMhdyI8s4chr7b@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b5a579-f8b2-4fd2-bcc4-08dbc00b39e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JfPdr/kErUhirlYqZqE4ufoa7Igf4wRNwo7HaZVzXZFXWljRaBAHo9ZzbBRVuDvgIbL6QBBWa+m6NhMz1l2JT3mwHyZPJn+NTF3HW+hiihbw913RoRMf7PX6UpsVmrIjbVmCbP64I+MpMjd7+zuWLp2tCi0g5NXYyHCqrKI7A15oThawxeKKM1GxDmvm4T998X0+VcvjPsjBRDO9Gjw5uJO9pvG+lB5hVLq/O2ByhGwGThLGmHdeVzsn70v6bikpbmLFpOTB1szX/FRakpz4oRAzV0fpQkhq8vsgjiWXGxLYTqTWXTKX3xVi0x4TDl519p27pYjhqedNudaZvEd5oeMzdqnArOTmssLmyQyoQ7voGKOQ1mxDWP3KDh3T6+rvw26xreRJEzXtOUYCgo8bMn9vXKW3sp0/MFgE58skHtvT42MnW0H5aUWCHqDiVYjnwomVANycCyxO9KPt4Vuw9aRpOP9TWA6BaY4il1tC9Cpa38WEegMGy17cNj2lK+Iz6Jnidsq0XFdSZ3iLO3ce9kqyUjCeF51rLi5eN3gkgLkqNirOJFrG2m2QWtCZvAChb8zOuFybM8X+Y6A/0FE90VOxiWC4Sft5Tf2iaJJbNj9kVBQUkued17RMXYakpigZU64YOwsGbXoJjdFiF3/aEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8676002)(8936002)(4326008)(31686004)(110136005)(5660300002)(66899024)(53546011)(6512007)(66476007)(66946007)(54906003)(83380400001)(316002)(26005)(6666004)(41300700001)(31696002)(38100700002)(2616005)(86362001)(6506007)(6486002)(66556008)(2906002)(478600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXZnM2VHaElMTnUzZDJ3YVN1anFUQTVacURKQy94V2JQV25GQjRqdVhFaFJt?=
 =?utf-8?B?QWFHdnQ4VFh1ODBtMzhpS1JXOUU3U3o0cEl0aXFXUGd1My80dVZsSTM1KzRH?=
 =?utf-8?B?R1JFVEl3V2tiRm0rK1I3Rjd3QTRlUmpFclJKeVBrVS95SXByclp2aDQ3YVIw?=
 =?utf-8?B?a3QxQXVxNk5LOG9hWUpHYlFPWHcxb0ZEcVJwNkNzcXRJUXppSTdJekdKcDlL?=
 =?utf-8?B?c3hSbXdGY0lEUXh5Mm1mYkRkeXQya2FrdUpLRjNIR0lkTUxYWXlOL3dLYXJD?=
 =?utf-8?B?dEFtTUoxV0xaQU9CdVFEa1ZmTDR2U3Vuc2xneUJuOGFrZytYa1cxUU5sdU1L?=
 =?utf-8?B?cmgyOGxsNWcxSjJMcVVPenQwQWJ3bkZpaWI2OVpXNmxNT0hJTzdYMk45QUxz?=
 =?utf-8?B?ZGo5aUxLaUFId1g5MnVQOEpLZXF2dUJydzJXNTd6ZEhKYVF4RVIrS2ZYNStE?=
 =?utf-8?B?UXZaczhXSzRCUFFUTm5zVTV6cUtWYnNYN21kdGpGTTl4ZE4zM1hmU0RoN1RS?=
 =?utf-8?B?MWtQcXZiMDB6SmRQVFpvY2ZNTmxjSU8yUWdlRGpiTjRTdFRTV3F0WXozSDA2?=
 =?utf-8?B?ZjhPWVhaNG9OSkJ0bTY4SDFnekpRVDlvQUxGQzJ0M2NPNGxoMy9EakRrNnp1?=
 =?utf-8?B?REFQTXRURy9Ta1FTQVZ1Z2Q1Q1dDa21zdGFhV1VIWGpvU2xIWEQrTFp5ckpB?=
 =?utf-8?B?eThzZWlrNFRIdDRRMWIxcjFVa2FodG1pUW5XTEh6aXN4OW1SVEppcnU5SFpC?=
 =?utf-8?B?RGFITmJnVzJOU29JZHB0VE9zNXRqekNmek1LQ1Q4eE5VNGtFR0phYVdhNzhR?=
 =?utf-8?B?YVMweVRVSEFsZEdYYU8vREdQSms2T2p5ZzdCeHJPUVdSS0dqWk5lK2ZaeDNR?=
 =?utf-8?B?enVBTDcvRGdMNTJVOEZZWkxnYUE5YndqbDZMMzEwYUhZWXpSdlFJdWo3Qmw4?=
 =?utf-8?B?dU44aVBpMkNOOHNLMG1YUlhnTGNoRHc4K1RtaTZZbUhWUWR1WFRvUUt5RU9R?=
 =?utf-8?B?OXhnemdRYlcyUkQ2c3RZMmRVUWVnSlVZS0ZHc1ByWWFtbm4rNTVYWjVrVzVF?=
 =?utf-8?B?WExuZGl3MDY3aXpJOWo4TnlxSjhheTFMUXIwTVRyTjMrN1c0K0QyQ2RSS0pS?=
 =?utf-8?B?Z1lyMFlZU1BmS3ZMa3FKUWN3UDZQNXB4Yit3OCsrK3Nvc1ovUGpSVC9ycUox?=
 =?utf-8?B?OVhjREsxTHYvZGdhZGtiaEZ0VjV2ODhvTXJoa0x5bExwdllqcWRBRXhGajd5?=
 =?utf-8?B?SlZ3bUpwYkZyQ25udFRqSDQ1ZWQwWEdvM1NoYUhKUVQwd0V6QUg5WWlucHBv?=
 =?utf-8?B?dHpCZUUwblE2eEQ1K3RuMklmZXZJSm4vWVJ6eWlqeG1ONnZrcUhNZkRtbmRF?=
 =?utf-8?B?SEUzcDhGZnNhaDVDU2pXY1lrblVkZ1VNcktKQUlUdk4xb3M3YVk5eGhnMGti?=
 =?utf-8?B?cGdBTC9nOE5QMk9RU2dQNzZmekZCOEJEZzF0WkRXN1lIWHZYbVV6a3Jkdzhk?=
 =?utf-8?B?T1pnYlF4VmJlZzdneVhPYUZRUjVyZm5rQUdXbkpOekhQUFNnR0ZjM2pLK1ZY?=
 =?utf-8?B?dHdIc1lzOHZqS2JvRWZZWWs4Vk9OSlh0bUV0YkEweUd0dmU3bnNwenNsS0lX?=
 =?utf-8?B?RmhJNHRmT1lrLytlV3JpYkgyTUEvS3I1Q0dGdGlaWWdZV2FOQklNZUVpTksr?=
 =?utf-8?B?YlowdllSV1o5TFRjeU5uNFBJbnFzdjRoS204MVpyQzFHYTJKbFdnK2Q4am1F?=
 =?utf-8?B?cHNhK2Z1WE91dWRTMktWZFRvSjQ5U0NqNmZKbzBORnhXaElibnh1R0NoUlho?=
 =?utf-8?B?dGhhZTR5aXlxTmtuVE9kUGtuemNDN2dSdWhFSFdQdlZlVU9Tam9jaUh1ekFl?=
 =?utf-8?B?RFhlMkFUUWxTL2c4K0t0NElaRDRxTmhvRGNCYlByZ3VrRDhORUFjSURqRTBS?=
 =?utf-8?B?VFZ3QzQrdHp0M0RLWXNlKzlBUVc0bFN1cUtnRE4zK3QwanliL3ZCQWR0MmN1?=
 =?utf-8?B?WXJyK2ltaW5FQmk0OEEvTitEZkNPdThNMkdhT09lU0ljSDBtTkw5bUM5NHJl?=
 =?utf-8?B?VzA2WGNTbCtLbjNQWHFpTTk2WVJ3M2NGR1JaT3Q5dTJHbS90SlNOVTl1SG1V?=
 =?utf-8?Q?i0tpm2HGlcKH1pF5RffnFMKdp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b5a579-f8b2-4fd2-bcc4-08dbc00b39e6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 10:11:05.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4gDBd1iB10Pt5Ih8VsIBC1qCDs60+2IxvAtD/BydRh8aPW29bCL8fyl/jG0M+o5tCQtW46cltnR71W8OQ7edQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7097

On 28.09.2023 11:51, Roger Pau Monné wrote:
> On Thu, Sep 28, 2023 at 09:16:20AM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/mem_sharing.c
>> +++ b/xen/arch/x86/mm/mem_sharing.c
>> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
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
>> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
>> +
>> +            if ( !pg )
>> +                return -ENOMEM;
>> +
>> +            cd_mfn = page_to_mfn(pg);
>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
>> +
>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
>> +                                 p2m->default_access, -1);
>> +            if ( ret )
>> +                return ret;
>> +        }
> 
> I'm still unsure why map_guest_area() shouldn't be able to deal with a
> forked child needing the page to be mapped.  What happens when a
> forked child executes the hypercall to map such areas against not yet
> populated gfns?
> 
> Shouldn't map_guest_area() be capable of handling those calls and
> populating on demand?

Funny you should use this wording: P2M_ALLOC will deal with populating
PoD slots, yes, but aiui forks don't fill their p2m with all PoD slots,
but rather leave them empty. Yet again I need to leave it to Tamas to
confirm or prove me wrong.

>> +        else if ( p2mt != p2m_ram_rw )
>> +            return -EBUSY;
>> +
>> +        /*
>> +         * Map the area into the guest. For simplicity specify the entire range
>> +         * up to the end of the page: All the function uses it for is to check
>> +         * that the range doesn't cross page boundaries. Having the area mapped
>> +         * in the original domain implies that it fits there and therefore will
>> +         * also fit in the clone.
>> +         */
>> +        offset = PAGE_OFFSET(d_area->map);
>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
>> +                             PAGE_SIZE - offset, cd_area, NULL);
>> +        if ( ret )
>> +            return ret;
>> +    }
>> +    else
>> +        cd_mfn = page_to_mfn(cd_area->pg);
>> +
>> +    copy_domain_page(cd_mfn, d_mfn);
> 
> I think the page copy should be done only once, when the page is
> populated on the child p2m.  Otherwise areas smaller than a page size
> (like vpcu_time_info_t) that share the same page will get multiple
> copies of the same data for no reason.

I think you're right, but this would then be another issue in the original
code that I merely didn't spot (and it's not just "copy for no reason",
we'd actually corrupt what was put there before). IOW the copying needs to
move ahead of map_guest_area() (or yet more precisely after the error
checking for p2m->set_entry()), and in the original code it would have
needed to live ahead of map_vcpu_info(). Once again I'd like Tamas to
confirm (or otherwise) before making that change, though.

Jan


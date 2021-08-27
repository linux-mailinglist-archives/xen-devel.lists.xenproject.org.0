Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AACE3F9B18
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173757.317016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJd7y-0003LG-0c; Fri, 27 Aug 2021 14:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173757.317016; Fri, 27 Aug 2021 14:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJd7x-0003IU-Sn; Fri, 27 Aug 2021 14:46:41 +0000
Received: by outflank-mailman (input) for mailman id 173757;
 Fri, 27 Aug 2021 14:46:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJd7w-0003IO-5J
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:46:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 954c794c-0745-11ec-aad8-12813bfff9fa;
 Fri, 27 Aug 2021 14:46:38 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-mHkSysQ7MxCuPeyhcB8qqA-1;
 Fri, 27 Aug 2021 16:46:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 14:46:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 14:46:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0902CA0013.eurprd09.prod.outlook.com (2603:10a6:200:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 14:46:35 +0000
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
X-Inumbo-ID: 954c794c-0745-11ec-aad8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630075597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7J1H3J0X+/LLquYbfXYODBT3Oje80wJi5hvPtEZe/w=;
	b=hTg6JHUUXDc7Z1ds4P1FH/lJ/Db2K9AfIz/aN2955J8iiOCYUG5kbjSTACwYvFGyjCGswP
	4/ZMOCjWxALX2TD9Euvb5CGmGIaCSrnmNPqSsNkNVA0P6QaNpUmrabz4SI0KgtlFrM3XuR
	MY0AV6idOJ8wKOKcBg+tqp2dzPx4vGE=
X-MC-Unique: mHkSysQ7MxCuPeyhcB8qqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2cVKdp6o5355qHo/mh5TtHn25dzyo4Tf9FnC8yTzCt2KCtqbpTxS8SZD8/xTL/Ntx2P7ChxuX9w8pjMtHKA81Jq2soJPq8WkoHPLpz5ngFb7VvX4kVjmZVsWwYjqEnHo22Q9xHMRPV8Xic37IV4J08KdYX0TYxX2c+VgoeIvaSBe1mGvrxX2nl/rYfk0w40sTpK7T1gYdNfigVEwRlLF56jnoNIaND40B3haGKs7zgr1ogov1CHkoj5Yj9CiM3g2GhdgVRxcLL9yCx2gDFZatAnw5ml5xFREBwd527g/yg8V50SBL3bYokSSYNOvTosfjskLpW6Opio4HtCAaJywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7J1H3J0X+/LLquYbfXYODBT3Oje80wJi5hvPtEZe/w=;
 b=lRbvzZUVoKvlC0vniwOwwQeiCorFyq2O69JCHYp2eFFgn0ngeNnGgfNHmVNcKw7Jj0kwXZWuVxDqiPIzvX5MOs/BbdhBlMTMnvY5eFNqiJoq6QvZofYqncQs/ijl7Ks0RsIHZH8NQ2E3mq2Hq2Eoi93cYPlzllkANDlRBUI4i9JeQUh4cbLiLeNboWibI7Wk4rN4n84lqdb+0P9PAQcCnEqUFMKs6IRCsAlvBIo2FsUqhbZFwIVKWR6h5tiuXF7WhIXlcsHceCqCXEvMYY/6EVduOwc8EUWQRd+huhjYIc8pjCvIwXO5EoYDRMEuMdqx0u1RdCCMmYl5gJ3SADr0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: XSA-378 fixes breaking PVH Dom0 (was: [xen-4.15-testing test]
 164495: regressions - FAIL)
From: Jan Beulich <jbeulich@suse.com>
To: xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-164495-mainreport@xen.org>
 <6bf7f023-a00f-4853-fbe8-83d9d2aff370@suse.com>
Message-ID: <953dd8e9-1c44-3881-6b62-306cc31cdb2f@suse.com>
Date: Fri, 27 Aug 2021 16:46:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6bf7f023-a00f-4853-fbe8-83d9d2aff370@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0902CA0013.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d9029b9-ce0a-4b55-3c9a-08d9696977fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54708F86CC3CE37E5900659FB3C89@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b7/dVy3g8MG+5A0AwXGGxEvDR/T06Rr3GRT/UjCHGUKxlesSXKqE3YJRBgZ57RE4ytV2M3u9oSWZ/0cYYSSkfuY3KvHSgqCBSuRPvv53rr3pwvNvTiWLzaWjAZnP6oLDZlknjN1PvZDHp2oD90Tw3rnUKHBmUaH/dQTu67lr3UhmxcNu9kpr4EHY+HCQ1fvUFaGif6jzykl8MxZioEf4F2LQRmsfv/WPtFiQ5IWxVaZEYIU+RgzzQhWnhagMmKIRx1RdZMhjI70DmrSMwS3kmvvUBU5ByuOP6dB5tnj5oopOA5xXaW8Hmshh/seAdMWp4WfT2/eBM933hj+p18Ep0e1dX6lqKIQaCoaJjsq7tzO4tzombUwvogHsaDpLOaypGNkAnIthEN+Y7q6YPxPR5M3Bm/KQ4vMJJ6KGzoyCCtpRUlEvDplHe0pLLDoSMlf6E75L+dKhj3+GfRN4nNYWC+sjbi+ThDmsFrWf9YRuWJg+ECJer1iAaOzobdmp9MQfMBxBO0a4YQgCBoNgwY1oiy9gg+gGpPXG+p1BDeAGXph7ldqw2QxgBnmFKUPkb1ZOloalDJc6oC+WJqaCuSdEzakgHDgbn4hRS5B01VyoFBe7Oi/LUMlf7ewKSy7cdo+eqEuAMbEy3pxski6wFX8wZ3nRMxBlWpqOTgtTK9ewQUZVZOwzbJwTag1e/dnc9iXk768V96RcAurJrl/SaQ8nYaTtwarPRqv9i2jgGn2nEPlTWHS/n05Ceo3NaIFRdOqSnfgjwtfGK1+IUJSNnQbfJgbQXNkpMzi3OvovEprdOB8QtG+37/cbVbdRailY3a7G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(346002)(136003)(39840400004)(66946007)(86362001)(31686004)(26005)(478600001)(16576012)(31696002)(83380400001)(8676002)(53546011)(956004)(6486002)(5660300002)(2616005)(2906002)(966005)(6916009)(4326008)(316002)(8936002)(66556008)(66476007)(38100700002)(186003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkNQOG9UeEpKeVBMWVhEMXBMN2Ura05YSlRmeVVWQkNROUNNZGJZZHpJVjhO?=
 =?utf-8?B?RGNtOUxjUm4ycm9LN2d2eWw1MElGSitVNERCTk5XNS9vTVVvNXFyZitSQ1F1?=
 =?utf-8?B?eGM4RG9EL1lsRFpYM2hhQ2pVbmtVc0N3VXdETlRIcmwwNnFSNFM0RVBTNDBp?=
 =?utf-8?B?UEh4M1NGSzl6dG1Ja0N1eDVWMTRXL0RVMXhVMGtJMmRtRTZ2cGVuMjVQcXVw?=
 =?utf-8?B?YXBqWUpqMERDNitiOTFNMWtna2JJb3FRVW9qZm1xVjdTVDhzQlA5ekNQbkxs?=
 =?utf-8?B?Q3dxTWQ0MEJRQXV1NzZrRXJ6b2VQYlZJcEx6ZGVPN0kxZ3dXL3ZrNmtqbnBM?=
 =?utf-8?B?aGovTUF5V0l3UmRENUpkWnZwZEVGYkpRMkhIMFBITXZGWnVaT2RKaGNNdkJD?=
 =?utf-8?B?VmNJOHlURHc2SFdOZytCRTBGbFFhaGdKV09IRFhEMUNGb1JBMHNYMTYzM0RX?=
 =?utf-8?B?OUZVQTlGL3I5NUJIUmVXZHFvMmJyS0RYTDEvWmJZZ0JRUTgrckVhZTkxdUky?=
 =?utf-8?B?b29QYWRlQ1dWQ0l6bHAzaUVmMVJiV05qd3pHZ1c2RjNUZWQrZ1ZNWmN0MHFP?=
 =?utf-8?B?OFFnbVNiNncxVGR4WVRGajI3UXhVNURoNlZFY0pSODdWd3cyN0pFWG55emxm?=
 =?utf-8?B?Kzg4ZDdpdjVnRXg3VjJlbjRVNTJYckU4b3hWUTVVb2FYRnhSK1c1WUJQQlhh?=
 =?utf-8?B?TzdvWW53WmtiQnBzbnFBeERwZURyaFBEYnN2cnY0WG9qVUZFN015Nkc0UmxV?=
 =?utf-8?B?ZUh0RFBpWXd3VEpsN3d4aXRYWTRnUjhlZHIwSVN6MW85amdLNXloV0FQU1Fz?=
 =?utf-8?B?cGJ0TUdudTZObjB4d0dac3gyNlhMZHpYQnNRSUhvY1hNZmZicnVqU1pqb0Q5?=
 =?utf-8?B?TXFwakRGOUE4TzlHQllkQ2U5UWFZQmwyOUJpQnNrWldpQnJHL25aamZHMmdx?=
 =?utf-8?B?RHg1bWE3ZThiQmtrVlhacWZGQnJXMnVEd0lrWnZXbGNaL1ZrcGRZTkdmK1hr?=
 =?utf-8?B?ejNueVpGV2p2TkJ4bTByNW81aUp0VlNRNmpBUXF3aGtIbEUvSUlEM2JzcStL?=
 =?utf-8?B?YnJnQWRRS29vdDNUNm90d0R2ODFMS3hJVFZuQmpyOEdDb2MxM2hPc1BwZ1du?=
 =?utf-8?B?cmxZdVNqTHl6dVA2VlAxSVczWGlBb29TUDhDYy8xVVVINTJqMHpFR2lRVUhH?=
 =?utf-8?B?cW9zK0ZVS29Sa1ZVa3pmaU1CMEZmMXlVK09SK01rWXdXQ3lDcWFNczR4amQ3?=
 =?utf-8?B?eHJFQVl4M3hudWlVdmMybkJPQnIybGlVMFAycXJBUXVNZXJRbTJOZlB4b3Zs?=
 =?utf-8?B?Tm1sVG14bVAzakowRnVKeFNIMVA5UnRTRDBkK1BiRXdLa0FUSERRTWdKcmI3?=
 =?utf-8?B?OFJJUUZXMVJQVXhVbWF6eWdJTlE0bkdIYnd2cElVcXhZRDlRQmM3OENpSFQ2?=
 =?utf-8?B?a3A3TlhmT2NZR0ZSMnBSYjB4bHBTT2h4Y09LQkoyTE9CM29CN0VCYUFtL0Vk?=
 =?utf-8?B?NklWV3Z5aWorSHF0Y3EyK2RFQUlCbzhVd1haWTdxQ0ZadFRyOFdSWmJmL0V1?=
 =?utf-8?B?dmdFUW1uRHJhS2JVWXI4OGRNcEdaRXZORlJWSWNxRWxyRXlWd3VMcUwxQmpH?=
 =?utf-8?B?N252ZWJ0c3U1b0RtRS9iTVJ1UHFEVUxtODRodEN6UHo5ZjNiOU9xd2EweU1I?=
 =?utf-8?B?eHoxZUlRY2dlOGdNclhVRk10bUxKUmsvblFDUDJPZnA5RVVqZ0w5dE0xWlZU?=
 =?utf-8?Q?qDCZzhvKqFA7puuU4VeH9FUl0gh28f1DA8YSpjZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9029b9-ce0a-4b55-3c9a-08d9696977fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 14:46:35.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lf+FcfEUAnY7I2bTipGhuBRhCAmah48W3ldWknhRNxdwDh/lCVUwH/WC/ZQXZ4yu+zN/k6bAQtuwO+latFajyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 27.08.2021 15:29, Jan Beulich wrote:
> On 27.08.2021 08:52, osstest service owner wrote:
>> flight 164495 xen-4.15-testing real [real]
>> flight 164509 xen-4.15-testing real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/164495/
>> http://logs.test-lab.xenproject.org/osstest/logs/164509/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-amd64-amd64-dom0pvh-xl-amd  8 xen-boot              fail REGR. vs. 163759
>>  test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot            fail REGR. vs. 163759
> 
> This is fallout from XSA-378. During Dom0 setup we first call
> iommu_hwdom_init(), which maps reserved regions (p2m_access_rw).
> Later map_mmio_regions() gets used to identity-map the low first
> Mb. This, using set_mmio_p2m_entry(), establishes default-access
> mappings (p2m_access_rwx).
> 
> Hence even if relaxing the logic in set_typed_p2m_entry() to
> 
>     if ( p2m_is_special(ot) )
>     {
>         gfn_unlock(p2m, gfn, order);
>         if ( mfn_eq(mfn, omfn) && gfn_p2mt == ot && access == a )
>             return 0;
>         domain_crash(d);
>         return -EPERM;
>     }
> 
> we're still in trouble (because the two access types don't match)
> when there is any reserved region below 1Mb.
> 
> One approach would be to avoid blindly mapping the low first Mb,
> and to instead honor mappings which are already there. Or the
> opposite - avoid mapping anything from arch_iommu_hwdom_init()
> which is below 1Mb. (Other mappings down the call tree from
> pvh_setup_acpi() imo would then also need adjusting, to avoid
> redundant mapping attempts of space below 1Mb. At least RSDP is
> known to possibly live there on various systems.)
> 
> Another approach could be to stop passing ->default_access from
> set_mmio_p2m_entry() to set_typed_p2m_entry(). (And I think the
> same should go for set_foreign_p2m_entry()). At the very least
> right now it makes no sense at all to make RWX mappings there,
> except when mapping PCI device ROMs. But of course reducing
> permissions always comes with a (however large or small) risk of
> regressions.
> 
> While I think the latter aspect wants improving in any event,
> right now I'm leaning towards the "opposite" variant of the
> former. I'll draft a patch along these lines at least to see if
> it helps, or if there is yet more fallout.

There is more fallout - with the initial issue addressed as
described I'm now hitting another similar domain_crash() in
guest_physmap_add_entry(). There's no question there whether to
check that old and new mappings match - they are different. Here
PVH Dom0 setup really does what the final XSA-378 patch is
intended to disallow: It produces MMIO mappings to then replace
some (or really most) by RAM ones. This means I'll have to
further adjust how pvh_populate_p2m() works. This will have to
wait until after the weekend, sorry.

Jan



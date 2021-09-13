Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C03408493
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 08:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185411.334050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfHm-0004EA-RK; Mon, 13 Sep 2021 06:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185411.334050; Mon, 13 Sep 2021 06:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfHm-0004Bl-OB; Mon, 13 Sep 2021 06:17:46 +0000
Received: by outflank-mailman (input) for mailman id 185411;
 Mon, 13 Sep 2021 06:17:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPfHl-0004Bf-SC
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 06:17:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e630182-145a-11ec-b39c-12813bfff9fa;
 Mon, 13 Sep 2021 06:17:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-rXMWRt6jOlWcEjCfcLK_Yw-1; Mon, 13 Sep 2021 08:17:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 06:17:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:17:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 06:17:38 +0000
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
X-Inumbo-ID: 4e630182-145a-11ec-b39c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631513863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKAl0iYcj7NCke8e9iNAbFLKipAgg52emyZBF3rkWps=;
	b=Mp4ulQzuHZtDrmjwQLkL45TT1UzsmnkLoVgwZICrYXSQd6xdAp7Pvi1vffwIRM6Oisomeh
	1owCntmmbxrp56ofMZ/8mzOsNUp4Hy8qeowtPT4wNdkZXh9XijZjo42lXBtCarDt+oDY7i
	ggUcWne3U71cTtLEC5R/mhtg1qrGRm0=
X-MC-Unique: rXMWRt6jOlWcEjCfcLK_Yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzFBOeusD01//5LjL0aU8j6uXsH44rsKL6NpzUsI+GhCZKEY68nkSpzsy2XonUx62aZvfab1f4oR4KLenM/MTPF4AuMtdG/4IXhclNpfTMr5gGPCpq6Pr/eKIbWENXPNcgIHBw9Q4xXvP2SLTNXQsLa/x0HMq4Qoa7x0SU0oo2jGjQS++/n+UFWJi02MWi53bM5n3G2V72l7iJB3LiPS2T2Suwm1APsftGRRjdwC17flkAWxTO/l14ys0nBhG9L4cXOISNNJ5GtQ8W3nyVZbfjYS6hxFTiYgKbA7FZAKx7s/Y2tBBNjCInJePx04ISYBq3AukDUd5NZ0FIku227biA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VKAl0iYcj7NCke8e9iNAbFLKipAgg52emyZBF3rkWps=;
 b=faMTdXKpAvDHXO/rI5UdTNY6J7jOWvavTxgpQjUp1dXKIKk4A+oQWKtDWLB+nwo9JjcoBSSZlQMWilMvJa1Kb9VhVNgJyxuVjU2xi0IwXbMG4sRQyL/jd6mU/P3dloaLM7aNC1TLWmlVibuO43GbLrJI4P1IanOfRhL/kHfal3Gk6VLxxg7CfZvRVITnN2Qc/uOVxyJwNX/864VWKosq7171O+zNK9+nHwb2hXkdc8sa+M5Fq/+RIE7w8WfF4CZEVPX+Jc1flcO+BTL11jQUUj/rRPqarH15y1k4C3k36nAvRLkan4iUND0fICEukLqwviRvvb+1iT4q/1sQuOnwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH] xen/gnttab: Store frame GFN in struct page_info on
 Arm
From: Jan Beulich <jbeulich@suse.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
 <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
Message-ID: <c006550f-4fe7-29c5-f370-dc67bfac2b95@suse.com>
Date: Mon, 13 Sep 2021 08:17:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf121ce6-f195-4c0b-1a84-08d9767e301f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23361D66D5AB4E8B656AD6F6B3D99@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8n5dx5NkBk8tsl9hyu1OW/1cb623pRWOKCuAryQjRtDLML8EGiBPAdKc0u24hmF7Rh2RM4sxCwh0EYKhOkcX6id8fiOevWBjgtqCVOD9Gaj0f1pj6JQJSj2N6r0qS5U5MSdZgu/f2F/91kBHjWrwYiqI9vuyvkBy2RvodjMrzYhBc1mV8m+5MWbzjh9G42xI7mQjnZxJk4W/nz3S9YtjuFaziuF5bFYtSjwJ1enwmDyfemR5yU7sY1JThxvrKICQvm4d7LpZ1lwmThNQJjdYEgx9NqjkF1iFVxohxXb/CULIuBGfCUxCDCJplE6oVT5dx+j6zkEoegRfTj3DWfHgnaN1s5pDXrZNj9mPAakjsZHqfyR/PvPsxR6tNFvZxRmzHzJKbJcTJmxEzwMi2x0GsabwOnZN9n3g63e/dwWAXtDfWqSQ5OYk7QSRR0J6Iah2BwtWIwFgNagHiuIs9GtfJHYPM43U9cNhvV3KP+mN1SDmExdPUYJCjSgvjwP9DuZ2qIu8EFLR/XZiOQWocrCdATcNw8WqtPaN7ZxcppLcNp00E5XkA47RyVZJwlWZkbCgDreb0xUAfBUNyESk/bkpHWc0zvqj/rUYleuBXh2HqmAmPgR8qfydOkA4AHzcIYYCcph8T0VQle7P2Yu4a6wh6EoowHfaly/bpfr5GPNOeTaTIt/SucDS88FPeuvDuKfhjbpet5LuAqTXXzeqYPuzGJxsO7K3iOFZk5J1UzXXQG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(366004)(346002)(396003)(16576012)(8936002)(26005)(186003)(66946007)(53546011)(316002)(6916009)(8676002)(36756003)(38100700002)(54906003)(66556008)(66476007)(6486002)(4326008)(31686004)(2906002)(5660300002)(83380400001)(31696002)(86362001)(7416002)(478600001)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTAweTFkdHdHTFZzcTlZdVp4eDYrTEM1YW9MQVo4ZHFTNGE4eXpKTDFOT0Vl?=
 =?utf-8?B?Q24zVDJydFJHMU0yeUt4MWJhaXpCUTZvYXNGdUdXODdtV3QxN2wvZE52Nklo?=
 =?utf-8?B?elc3NmN3WDlrM3lvSThMaDJQb016VkpGZkxFenRTZngvWS9jSmQ4VnNMUXNs?=
 =?utf-8?B?WGVPMndDU2d4UFNCelZJWGdvMC9NMGJhS2RnMitWVjIwNVlqdVkzK1k0QTgw?=
 =?utf-8?B?UGlKY0cxc3NjbGFNNGc4SitKdWJSNmlpemhzV1dMRXpUczlXbUVkOEpWblJX?=
 =?utf-8?B?aWk1UnpybjBkZThuQUVvZVE0U2NZOUQzOTJTQnlrMWdkeHowVWFxWnEwY0dG?=
 =?utf-8?B?Z3ZmUDZhdGpRdzMxM244Tis3Q09waXNBamkveERHWXE2bGdSMmtGcGo4M08x?=
 =?utf-8?B?Vytndy9HQUFNdkNubmJoN1VCQUpTSGhHMVZzWDNJb0FUcUxKR096elVZUlFz?=
 =?utf-8?B?TXB1M043SkwzNVBKRStGNS95OExVenlIZFFkQ0VPYklmMmhlcW5MWnhKY1Av?=
 =?utf-8?B?Qys4MlB1QkVhRGVyK1RweEpqckZFL2Vhc1pBSlcxbGtLZlh3eHdqaCszdWF2?=
 =?utf-8?B?czZJbzJYZmUyZ0VPSkhCZ1V5UWVLZ3lqelpXOEg3WkxTUUloUGNKVjRwNVgx?=
 =?utf-8?B?ZVZRWVcySHhlaVlrR3FSSVVuSDduTFpiYWV4TWtwQWJRK2JoQm5PWXlnYSt4?=
 =?utf-8?B?SnRJaXBrcVdVUHNXT29MN1RoMmlwUjBNcE5mOU02aWl4ZXJuRGVRVENUN3c2?=
 =?utf-8?B?S3kwZkVSbzFIL3RrTThaSlpPVjZpNStpZmFQTHR0aEhIK2lrWjB0UmFVMEJp?=
 =?utf-8?B?Q1RRTmxXLzRjOHRTa2kxcFVmNytKcThpRTVqY2ZsMGIyeXlhSTQ1SVIzUWR0?=
 =?utf-8?B?bU43VzZvSDdmR3hjRVYrNkthM3NibjZNOG1wZGNSbnI3dzVpMXh4cWxzaDBU?=
 =?utf-8?B?c3FOVXBWaXA4ZWtLczdHOHpKOUhEYXNaZE1zRW9DVk5TdGRITnJERmQrNWF3?=
 =?utf-8?B?QU9kaFlpb0ZZZzZENDFSK3NyaVl0QnpKSGo0YXNka2ZxMHNZNlFjU0EwMzZS?=
 =?utf-8?B?aVJSTjNubEMyRzNKUENWUWdOSDZia3ZpMHZlNGtvd2tJcmF5WVphL251Q1kw?=
 =?utf-8?B?MGIwVWtxUEhJOVQ4czhKU05JQ0FiMGhDc3k0elBUMmhCSUVHT2Y4WjVRUDRk?=
 =?utf-8?B?cnNkTk9tc2drMkFYTnh2anhpd0UrLzJueFNwQ3FFU2k5ZVhWVzNGZTJtaG5Q?=
 =?utf-8?B?Yks1WU02MVRTWmhOanpzTHFxRUdkMG1mTHl3Qk1hbUw4dzhOY3VyMFc0REU5?=
 =?utf-8?B?TTBITkIrZlRhV1JibXJhaEVEK2kyZXpTd2lTTWZMWWNDUHdHOGY4d25uaHd6?=
 =?utf-8?B?ZEpYQUF2RGU2bjBJMDdiVlFwaXdtMnJ6Uy9XSndVclJUM0FsRE1uRjhRRzJr?=
 =?utf-8?B?UWVVT3U3V1p2N1AyS2FlN1VvaDAxNS9mdmxQcEdLSy9VcGx2R1BRT2VGSUZh?=
 =?utf-8?B?VVF0V00veVhDeWVVeTd3U05QWGxUd21kMXhucjhiMUltdWphNzF6WHZ6M3ZE?=
 =?utf-8?B?TWVRK1RyUXVjUUJuN2t3RVd4WENkekx6MndQZkRmM2RuY3dyTFhhSzIwc1NZ?=
 =?utf-8?B?ZmpJMjc1K0I3aUVEaytyeTRBV1VZbWsrb0N2eXZWb0xZOGJ6UEQ2ZURnSm9h?=
 =?utf-8?B?R2R6dHdWSW83NG9OeFJRa2ozdndRaXI0UU1KZHV0VHZYVDkwMXNVb3h4ejNo?=
 =?utf-8?Q?N2s5QDcesIlEdVkHh5rnkROPPQ2zCtlOI27eZ2h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf121ce6-f195-4c0b-1a84-08d9767e301f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 06:17:39.6076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYeIODdfiji/BEHCqU/BnUYqTQlDz5L+6Ce04X+NifI0Qlps+UWzsU3J4a/VcTee95CRwyXnb6sQRPxoRM+I8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 10.09.2021 09:52, Jan Beulich wrote:
> On 10.09.2021 01:04, Oleksandr Tyshchenko wrote:
>> @@ -731,11 +733,19 @@ static void p2m_put_l3_page(const lpae_t pte)
>>       */
>>      if ( p2m_is_foreign(pte.p2m.type) )
>>      {
>> -        mfn_t mfn = lpae_get_mfn(pte);
>> -
>>          ASSERT(mfn_valid(mfn));
>>          put_page(mfn_to_page(mfn));
>>      }
>> +
>> +#ifdef CONFIG_GRANT_TABLE
>> +    /*
>> +     * Check whether we deal with grant table page. As the grant table page
>> +     * is xen_heap page and its entry has known p2m type, detect it and mark
>> +     * the stored GFN as invalid.
>> +     */
>> +    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
>> +        page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
>> +#endif
> 
> I take it the write done is benign for other Xen heap pages? I suppose
> this would want making very explicit, as such an assumption is easy to
> go stale by entirely unrelated changes.
> 
> I also wonder whether you really mean to include p2m_ram_ro pages here
> as well.

Actually I've meanwhile realized I should put my question here quite
differently: Aren't you effectively introducing an M2P here for Arm,
except that you artificially limit it to the Xen heap pages needed for
the grant table?

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79703F943E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 08:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173386.316373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJVCK-0005mi-0A; Fri, 27 Aug 2021 06:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173386.316373; Fri, 27 Aug 2021 06:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJVCJ-0005ki-TC; Fri, 27 Aug 2021 06:18:39 +0000
Received: by outflank-mailman (input) for mailman id 173386;
 Fri, 27 Aug 2021 06:18:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJVCH-0005kc-UI
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 06:18:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c562626-06fe-11ec-aa90-12813bfff9fa;
 Fri, 27 Aug 2021 06:18:36 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-zChCGvlQPTKPFaTQRE2ZNA-1;
 Fri, 27 Aug 2021 08:18:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 06:18:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 06:18:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 06:18:31 +0000
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
X-Inumbo-ID: 9c562626-06fe-11ec-aa90-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630045115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIOCFS5BCPwQGnE/zvCQb9AN/xmuFqbMtZ4rYAij2wU=;
	b=KaJeC2BrfjNMEiPuIqqAL/vSDbsucqneh1Gw0glblXMsRfNf5GS+nSSRr4n1h9VN1jcjdM
	/B+hXoRBJ8r2OC7Quur+HGJi55Wjw13CfbRX2YXDM3CzMGLyNcWOAlvroJvCyHjmS6x4Y4
	zxBe7iuaeEPKIPCCswsEnu6gogRYTSY=
X-MC-Unique: zChCGvlQPTKPFaTQRE2ZNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADaJjYF7mKBULx51dXRuDs2KfE6nTxbmvFUNdf6qv7uyo/wMWJSngG3tBR+ELVyhtoiQGB02kza4gBBxzrF+5AjLC8T+4eyxvBk7b/6QKvgR5sMw8jE2dWXmnXrrpoIuASQyiIxUu6vq2/p6RTeXINM1BLE3YE/YEIhfUvWUkZlR3NCrgrgRHImfuOu/WN071gC2DDOhRteSU62yrf5w41Fhr7tNtz1xRF3Oka7oDJ/YatvhGQsMlWzqcXPrtNINe6Jd5DMORPeY0tZsg2cUpjlyUJhdpZ40lIv+6UjVx6MJNddL412qujFZFpVfWHCg64fLNhdO9VMHl4NcrUC1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIOCFS5BCPwQGnE/zvCQb9AN/xmuFqbMtZ4rYAij2wU=;
 b=U4yAONjaD4Z4HS1NeaIlXgQPXC/YDuE2cWFMwFEaoRTBt3CjZBkPKTSHicq1xFHh7voS8tfErjSN/3RAzKdmTT1AL+RLov3RX6nd04J57w+RGZOLlp81yearntZXoUxVZRVmmIVk+4BL64/U5b9PNGPsZ+ELDSCigqohq5sn66p7yGNxJrzOOMsxv7PeGquX2NtWA/lXWrpHWESSpSxoV/Vt+VmPUHy21KD1k3g30IfatA/xeuWswyaW1VgfwijTpql3seOtSCIWlILc2tZ+ZVpOocnDiv+sLBZJec7dtzAnqJXEcBr+DhwqUQO4aQE9pIjK8eSegrhhANwEFcPg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 16/40] xen/arm: Create a fake NUMA node to use
 common code
To: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-17-wei.chen@arm.com>
 <alpine.DEB.2.21.2108261605470.24433@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ada9a6f-ca9e-cc2e-f06c-7f754e2a4833@suse.com>
Date: Fri, 27 Aug 2021 08:18:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <alpine.DEB.2.21.2108261605470.24433@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0019.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a7519b9-02be-4fd9-7f6a-08d969227e28
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB647842CE2944F5C651D712F5B3C89@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	By5//pTvJj/qfEqB4EIbkGlNFIA1r+TJa5wFrq72QELDSO8Y8O2frAkgkb0ViNjMM8K8kVCumntcgHimZsiUQdWcc434l42CIi1w590PGnRQdkW6yYSn+lqEpCTGBV0KqKcCk3ek5YTCpbrA56LNqI9A6F8Nrc4n72IHNVdm/rGqyyIS47NYgtSEOyP54FYjAxaAvkqCTyryiatf8l1L6rWDoAOcS0pW1eEu7sW4XuovPugzRpQW5t5bCtiltbbr5Ug23xyQS3x+7a6R22J+zhn4yyf8G3BWpx2wXtDDvcEV3MZiVS1PreQNlpN3o9t0P/D2Mzs+8V4VdcI4Vi17IrB3TRs4y4PjtKCggWzAQ+QJnkCGPdNFpkAoRgAbBcoQkIpW8MejzZAHEibWStG6vP3wHILh1Nt8DGfL0UVfH6so0DJpfv30PYAmd/UUu2NBH687NnL8k3IC0iGKBfoe7ZjZ6uFnxHZJGC8Lxrb643VhYotLmbyHLJ9Hm8nZNZo2fPNTQFkdclr25sc+iSi5o56dVI+TZlcoBUvn/djqLpAgOnAfpUbjZraTCEzeED1hEnLbnwhcRgupQ9H3BWqr1hvieCfZB0AZmJ2VYLI+OCM7j/Xbn7ayP5xY6rM293dAPHslEvUcu4Hv8bdMzqF2DNm9GTxJ/MU+FCofZmJ/EiCrxs59j1pmhy07L/Ai8DScEKk1zSIwssPd0Kl9kVg87Uzw0gDSbjJ+qSXB9B4YGAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(136003)(366004)(346002)(396003)(66556008)(66476007)(8676002)(26005)(83380400001)(186003)(5660300002)(16576012)(316002)(6486002)(66946007)(31686004)(6666004)(4326008)(110136005)(86362001)(31696002)(956004)(2616005)(8936002)(53546011)(36756003)(478600001)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ZYeXFCSy9aWEV6d3kzalIwSUxBUVVVQUwyNVJta040cFFRN0VlVDZmSk1z?=
 =?utf-8?B?N01MWGlLNklQb01JTHRVSUczL210bm5Wd3kvcW5zdDU0V2J4QjEwa0wyQUdY?=
 =?utf-8?B?Y0JaVEZ5Z2ZJVHAyTStkY2hMYU1WdkhUc0g1TWRQRHNQaDl2djY2NWNKQ25W?=
 =?utf-8?B?NGNkZnRqL25CRzdFVEhzd2txdkhnNGJJeVpHV0NDVGk1YkMvdGp2bGFHQzNT?=
 =?utf-8?B?QTh1Qjh3U2F3WmNrMUZ6K1BtTGN4U3I1c1h5SHFBVFFqcnlaRVJpSit6V1pC?=
 =?utf-8?B?aTJ2U2lOWllpTUdYeVlId0k3R29GdVJXZU5RMm92WFNCU1JMMTU3cEdCR2dk?=
 =?utf-8?B?MUVoRVdBVmY1ZHpTUy82bGhlZURlOWxJZWZPekQ3ZTZqQ2QwZDF6YkR1czRX?=
 =?utf-8?B?MHhzMWJ2cEMrekRhNzZDbGFXZmNubjgxa3J6OE00VEZVeCtJNnFhMFZvbkRi?=
 =?utf-8?B?UkRVWWtnQ0l6bDFVeUk2OGh3cHFSZUFuSE1qSW5VeWFmclNmRDcxVXRZc3ZY?=
 =?utf-8?B?aUE1ekV0ZkIyanZ4TkZFSDdkcDY1RklUWGFNM2hwZkh5S1RYYitVa3h0ODBJ?=
 =?utf-8?B?ZHEzQ0lzMWUyMyt4VlEvUW15OWpNWitBbHN3cVdPWnl4NXJpTTdOWW1WUEZ2?=
 =?utf-8?B?ZlU2R3VYTTFwQmdTL0ZWeDhnUGZJUkZUSGJLTk80Nmh3MldKL2c4djFoRlFZ?=
 =?utf-8?B?eG1WMXF1cFliQUg0NmFLWnZYTzZGd3JoUEoxOVJnM1VSdFBsRnFsSDBjLy9G?=
 =?utf-8?B?MUw5TG9wY2FJWFYzYTlwQ0JrZGlhWFNBbDRzTUN0M0RxK3diSFZxV010YlVS?=
 =?utf-8?B?ejQxY0hSMkI1VE9Zd2xrZW81V1VJMFRGY2NtMHlKa3hianZDNjJVekxXVm1s?=
 =?utf-8?B?TDRjcmZ4RnNHa090RWYvdHdHbFQzUjByWFNqWEx6K0JNTlo3VllhYWNsMHZL?=
 =?utf-8?B?dmZKcHJLYzZGazFZMUEzTEdtWWFXRWw4WVhWVU92dGlGaVBiaGV6eDBXcGN5?=
 =?utf-8?B?YjBFVkVaN0syOEhZU0loY09ZRGEyenNJZ2RVWG5OWVVTMjRReWw3eXFnQjNB?=
 =?utf-8?B?czVoSEtLT0hpNXQ2eGNVdlhyQ21vZVZibldBU1BRMTl3VGtLcUdTL2hmTVhl?=
 =?utf-8?B?ZmdNV1oxcFozTUptQzZBYkdtL1h3enBuTjlwYlNwQ2JGdlFkVUVwRENLV1NG?=
 =?utf-8?B?Nm9pbG5NWXJQYmFIeDV3dXdkU2hNeVptVVM4NUMyMDRvWkFVRmtsMHEwc2Rh?=
 =?utf-8?B?R09wM2VBZm5RS3FDa2dCRmlmRHgrSlJtSmkydEVjdk5jK3hSTHNCSjlrclE1?=
 =?utf-8?B?YkJLd1ZVQ2ZUYm9FN2ZhTmxxWlJXTEFjMW5nZ1MvZTM0b2NnRFF1dml1M1Ra?=
 =?utf-8?B?WmxDd2JjMnROcEw4eWI5cmFvclh6U0ZMQ2oxQnkxS1hxUGVKa0tmZXQ5amR4?=
 =?utf-8?B?bnJFRzhId2N1M1U1TUdiQ0szWUxUNy9pUDliQ05vYm5VSUhWalQxclhQTVdE?=
 =?utf-8?B?WEU1UHFIV1hoRGxqaXhJTEE3VjhHMkFLVjIvcUQ4NWRwbHRMNDg3Ti81bnpB?=
 =?utf-8?B?eGV6M2xyTzk5aFBndlRrRmljWEswTTIyaklXaXRwbStRK1BQWEVDbmk2ckdi?=
 =?utf-8?B?RHNBMmp3RmhVSkZpcWxEY3VnVjR3dGI0dXJHd2QxempnM1RMM0krNFZCVGtI?=
 =?utf-8?B?YjNkczlDcnFTdjYvMi9mV3J5WCs2bXpHa1F1MXFNVU4wMEFvZVQ0WEhmZUNG?=
 =?utf-8?Q?7oUI6sVqLu7V9KDKV1b8AkDeeznpLm5PFIUoC1s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7519b9-02be-4fd9-7f6a-08d969227e28
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 06:18:31.7043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBzheN+6VVaptWYQvZE9tW1JOm77fYDzbLAYJW9VFPAE4gc+8VymavTGDaF/ReovENCgGyGGSkRNqQP7xy0zdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 27.08.2021 01:10, Stefano Stabellini wrote:
> On Wed, 11 Aug 2021, Wei Chen wrote:
>> @@ -29,3 +31,54 @@ void numa_set_node(int cpu, nodeid_t nid)
>>  
>>      cpu_to_node[cpu] = nid;
>>  }
>> +
>> +void __init numa_init(bool acpi_off)
>> +{
>> +    uint32_t idx;
>> +    paddr_t ram_start = ~0;
>> +    paddr_t ram_size = 0;
>> +    paddr_t ram_end = 0;
>> +
>> +    printk(XENLOG_WARNING
>> +        "NUMA has not been supported yet, NUMA off!\n");
> 
> NIT: please align
> 
> 
>> +    /* Arm NUMA has not been implemented until this patch */
> 
> "Arm NUMA is not implemented yet"
> 
> 
>> +    numa_off = true;
>> +
>> +    /*
>> +     * Set all cpu_to_node mapping to 0, this will make cpu_to_node
>> +     * function return 0 as previous fake cpu_to_node API.
>> +     */
>> +    for ( idx = 0; idx < NR_CPUS; idx++ )
>> +        cpu_to_node[idx] = 0;
>> +
>> +    /*
>> +     * Make node_to_cpumask, node_spanned_pages and node_start_pfn
>> +     * return as previous fake APIs.
>> +     */
>> +    for ( idx = 0; idx < MAX_NUMNODES; idx++ ) {
>> +        node_to_cpumask[idx] = cpu_online_map;
>> +        node_spanned_pages(idx) = (max_page - mfn_x(first_valid_mfn));
>> +        node_start_pfn(idx) = (mfn_x(first_valid_mfn));
>> +    }
> 
> I just want to note that this works because MAX_NUMNODES is 1. If
> MAX_NUMNODES was > 1 then it would be wrong to set node_to_cpumask,
> node_spanned_pages and node_start_pfn for all nodes to the same values.
> 
> It might be worth writing something about it in the in-code comment.

Plus perhaps BUILD_BUG_ON(MAX_NUMNODES != 1), so the issue is actually
noticed at build time once the constant gets changed?

Jan



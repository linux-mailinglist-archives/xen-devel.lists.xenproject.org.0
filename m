Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C894047EB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182876.330706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGYM-0003Kz-SD; Thu, 09 Sep 2021 09:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182876.330706; Thu, 09 Sep 2021 09:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGYM-0003IR-PA; Thu, 09 Sep 2021 09:41:06 +0000
Received: by outflank-mailman (input) for mailman id 182876;
 Thu, 09 Sep 2021 09:41:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOGYL-0003BU-8F
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:41:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7cdabcb-308f-4224-8e25-b303ff245fa9;
 Thu, 09 Sep 2021 09:41:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-ey27L9XlOky01RcoT1pE-Q-1; Thu, 09 Sep 2021 11:41:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 09:40:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 09:40:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0902CA0018.eurprd09.prod.outlook.com (2603:10a6:200:9b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 09:40:59 +0000
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
X-Inumbo-ID: f7cdabcb-308f-4224-8e25-b303ff245fa9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631180463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlMga0mUYNhs7SvP6Ti5KthRY5hVV+M0UFQXOq92hf8=;
	b=d/lxTS9Hte5yDpXafaruUWGd9A6wMYLHZvwPT+A/0Vc/2PtS3kvyG14IwX6wpxdBtwkTsC
	coLH5Nm2hVI7yJ15ajCRiCinkJ1fDYYh9SvlBY1uu5/t+WEQtfryWyi0Mfnnhe2ZsIOXFy
	Ujk1IxQUC2Anx934NnRhziCwf/VXbz4=
X-MC-Unique: ey27L9XlOky01RcoT1pE-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INuQQql2Y59ieJUv3ntsMtni+/+HABtKMYu+GLZKXhNZOX9O2XmTnE0CThsOBu+FTc4S50P4HVoiyA8xRswRgc3KFaBMg5K5vfGOcMoe6Jv84uuTWvSSRr1Z5fdWjIpZN9zLt73/EvAWbMxO154bZqexW1QiRrmHO1liTOGfMFX2JbNW5pcZ+LGyvJPUl2F0qV94wwEp4Ng7+AdEX2UonFJgtFeUosgORugkodRDEc07iP1zvLjW62MT4zXt43PnhQhgSVhVU2k34tLv2JAbnPGJiGrWk6woUouoeNHETvqEcUSXhYTWggbeZuB3bT5q7jgd00Vw6+NTowLeyPwrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wlMga0mUYNhs7SvP6Ti5KthRY5hVV+M0UFQXOq92hf8=;
 b=f3pbn/1XUwxZecJSNIR4fL/9LJqlt2rJHF+QkI0F8JcpMGhxT+GtPQYN+eg+21raeo9AsdCqpjgK9eLLJC4UAB2K4K2XXA8GQasTNWynjQjAyeyT6UiZepyVMRg4S7FvgmYdd3yvHvw65xoonvvjs3hd3QUF8v7EmkSJVFPZlYd3co3+NdxFKErRFnS/rd6ZkxE3DTvUWclqJy6Qz3fcGX3jDdzIOYomx9qRo8vaXe8LapeWPPoWvxbeNbfUadt6H7CaOvovxRwL1rKTADdgX1ki+S8tW+qrvHMVV104EBOh98WE8vu80jsBNR2MjX5OXCYzzjwCdbWULNsFqp4YuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 7/9] vpci/header: program p2m with guest BAR view
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-8-andr2000@gmail.com>
 <90813678-d873-d346-5f53-ab97aaedd3e6@suse.com>
 <f35a7bbb-8a9a-06c3-c7b3-60b49013d8e5@epam.com>
 <ee9a69f1-6b47-a944-7255-4ffaa3e1c601@suse.com>
 <b9fe88da-3bdb-0b37-f2f4-9a575806e6de@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2cffae86-1a2d-a9c1-e5f1-1083ed24480f@suse.com>
Date: Thu, 9 Sep 2021 11:40:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b9fe88da-3bdb-0b37-f2f4-9a575806e6de@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0902CA0018.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf5e3832-995f-43bf-0eb1-08d97375ee54
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71524A9A256C8CC4835FFCD8B3D59@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	te3/KmN7Fn8GrbUYGtIvUzBp4fdkc9IXk22IBejbbH7tND0ejvLydY65SPiV2H73m9HX6HTHttEuT8/s4WjJgqcOUBTD3ZseBo53dHtDbUUhpoOnMpr/eTRlYm1kvTeJSEyDCUn9CZLeI+ZFkWyBDyUjyOyIscYvZoZKCecXRpo9jB373nvJizWJaUEYPzQtz2M6yXRBcqMpOizPtTFt8plxAmNYdAwaVfr4aI331kdLYHIQs6E8OkZRE5jcfB80fMaCtveo6dPgQSLZOVWRu2cNMAUs2cPkBzs7O6DdNjyL8I0L54VdltbZf5zkp8HwuYM9AS8vIG8s8WZJDEdwkZTmFJZObHijmXjTYzZnCNK3puBbz63ExRio+G1UEOL3sVGcgDS/uMFeCDBjJ0z1VWA1x9aRLFBXcILDenWRZ7Y1U62WglR+a2hg8VPcFF1qMN095IaeINfJHVTLtw9Atlo6Vx70QGa7D8r2SQ9fp2S7/ZeGsGe3A5e1Q1HANoWNbSIHvnSC/LqHZrIFL+hf7x/tlCbXrvVDIeWL/X1eeXF+uvcDJdlXIJnvWIrKHp2zHvh5U/FpULVNPt/wcCQTZm7sfZccNoAXc8P85zfB25v1ndOR85UrIcLDfSnFy3ZOFjIB1COuzAeLBTCIAawbO8wGp0IYo4/rgdTAUhobJLfo4+kAcLrLMFIuDVMVi6PaVEnGO48EDGdiSo07LwCXNVbqKfvaUdVxnZ1ZW3JOXWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(346002)(366004)(39860400002)(31686004)(956004)(38100700002)(2616005)(83380400001)(4326008)(66946007)(36756003)(6666004)(86362001)(186003)(2906002)(8936002)(478600001)(16576012)(8676002)(31696002)(110136005)(66556008)(66476007)(316002)(5660300002)(6486002)(7416002)(54906003)(53546011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckxCdUMzaXZ1Qk9VdWc1MDZXYU54Z3ljRVcyZVQrYk1uTy9DQS8wQUVUZ2tl?=
 =?utf-8?B?R3gzRUlReFlweHVnWXRmMWt4U3JkeXBhVFg3UEpNMDVEbUdHL1d2VlRwZDNa?=
 =?utf-8?B?Q3Z2d3l4NnJvWVJvUDZuY3pRenlWRjN1VUtYOU1OWTBCVVd0S1dQbFZZM1c2?=
 =?utf-8?B?NkVkZWZBZ0NJUGt3MXBzSW5wWGl4eTFPRVRjNVNlTWZqVldJTTF2Q2puZmtu?=
 =?utf-8?B?ajcwK2dabmJubVdDY3VNVWpIUkpSN0J4OVMwMDczM1dIQUQ5TzBhZnk1Nkl2?=
 =?utf-8?B?dEpBcnIwUkNCL0M1V3VTYTllRzZiVXBOQWpkNGo2dnlhQnJpbk41QTFPQm81?=
 =?utf-8?B?dGdTRlBNVnhMdTJNTUtpQ2tIdEhJZ25BNjdZc0ZmTW1IYXlKQnRSMWhpR2Jr?=
 =?utf-8?B?bzVXbFBqY3ZJOEQ4dUlhSmdhbGs4TDZMSjVTSWIzOU5EdStGVmNmdmpWUnRl?=
 =?utf-8?B?TTU1aTREd1ZQMEVpOXhGSnZiUXlqcWJmWDRSWjBwM1RaRkNhT0huUENHK093?=
 =?utf-8?B?eUJGTis4bXZyUEpXTVUvbVlTa3ROdU8yQWdxRnk2NGFFRFRDclhtaFR3SE50?=
 =?utf-8?B?N0Zsb0NzYkxoZlhtd1hDRXFEc2FLNi91aExRaS9yZURuS0owR3A4Rm9kT3BL?=
 =?utf-8?B?cFlPTngxVFQ1L1JCYk8vZW1pdWlHdi9xRGRBUmhwVk5CcnlzVWZBOHBkWGlR?=
 =?utf-8?B?NTJEQmErcndiRWJ6c05zZ09pTG5zUXlOSCs4WVVSelZUeDN3a2lGZnZib0x5?=
 =?utf-8?B?T0wwb2MyalBRcTJBbHNqSVBBSjNqcEV0ZlBJR3dqVkUybjRLT2tKKzcxSEVv?=
 =?utf-8?B?cVRPa1EvaDZqdXAydDhLSnovbTh1QW9pL0tZNXMrQUNlOGx1RnQ3SjR4c3JN?=
 =?utf-8?B?bDlCOFd1eHF1Nk1XSDRnblBsVU5XcStYYVFyUUZQNkJJTTJWRGFKV2FLT2dM?=
 =?utf-8?B?MllSUVB1KzQ2SnFVOUhyWFdGQ3RFUXUzcUFDR1Y4Qkw5TW5LOHNwUVYyNFVj?=
 =?utf-8?B?VmE4YW1mYklnbFMvaGxFNG9FYlp6Wnc5dmUxdUdzcjdja1FIUTREQks5Nm9x?=
 =?utf-8?B?KzhWdGlQeWVJV1hXVXdKcmgzWU44VEF2Q001VEc3eXNvWU5JRzN3YzkyL29E?=
 =?utf-8?B?azJnanJiMWlFaVRFWGcxdjhGbHRGZEtmOGl4QWx0ZzhYbzY2UjNxK01jZmNN?=
 =?utf-8?B?ZHFyZmtWb0E1UjR4UERIaHNRU1Fydi8rNHBSNnNwSTkyYmtiNlhOdGlYbDcy?=
 =?utf-8?B?R1NsTU95WWhMOUJpVE5EYW9NN2ZyQUY3elJYOEY0REVQaXUrN2NSWjR4M3h4?=
 =?utf-8?B?MFQ1U1BzWFJNd20wblgrU3ZsRTlldTBPN3EwVVo5REFDeDNIaG9PWG5UZi9F?=
 =?utf-8?B?enZmcXBpeExCalVadWluZGozQWx0LzFZb1Awd3VBUmljTkJvSGVMRkRjLytD?=
 =?utf-8?B?WEJmLzJpa3dXUXBydHRZRUtKTmZjQkRPZWlZZ2hqeVhiWVJSY3dIck1PcnFX?=
 =?utf-8?B?RWhJVzMrOEpTTlcvbDIzU0laVGNKQ1JFazdreVNlbFNuTWRyZzJZcnVRMytv?=
 =?utf-8?B?Z0xrRHhEaUllK3FZK1A3UXhnZ2M4bkFVSjFZd3ZDUkdnaVlkZFhRdVJwNlha?=
 =?utf-8?B?clJ5cjZUVjExOGR4VzF0QndEVSsxd0hJNUx5UE1kL3JBZjlXTnpSMXI4SUxq?=
 =?utf-8?B?VWZWdUhaSnNNbVpqdXl4QU4yWWNoUGlhOUlJZittbTUrc1NRejVVSGpOMTJD?=
 =?utf-8?Q?F4wfSHmxe+9bVtltV0pBv+a46uaJ2Ki3yMBDDyh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5e3832-995f-43bf-0eb1-08d97375ee54
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 09:40:59.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPWuVR/4LhLGfYZdRJJhJGDFgUmXu3IX191SCUX0Nu9W8yqOstqgrv1U/EVJ5CkvDdu782bokeBUPv8Fp+J03g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 09.09.2021 11:16, Oleksandr Andrushchenko wrote:
> 
> On 09.09.21 11:26, Jan Beulich wrote:
>> On 09.09.2021 08:13, Oleksandr Andrushchenko wrote:
>>> On 06.09.21 17:51, Jan Beulich wrote:
>>>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>>>> @@ -37,12 +41,28 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>>>>>                         unsigned long *c)
>>>>>    {
>>>>>        const struct map_data *map = data;
>>>>> +    gfn_t start_gfn;
>>>>>        int rc;
>>>>>    
>>>>>        for ( ; ; )
>>>>>        {
>>>>>            unsigned long size = e - s + 1;
>>>>>    
>>>>> +        /*
>>>>> +         * Any BAR may have holes in its memory we want to map, e.g.
>>>>> +         * we don't want to map MSI regions which may be a part of that BAR,
>>>>> +         * e.g. when a single BAR is used for both MMIO and MSI.
>>>>> +         * In this case MSI regions are subtracted from the mapping, but
>>>>> +         * map->start_gfn still points to the very beginning of the BAR.
>>>>> +         * So if there is a hole present then we need to adjust start_gfn
>>>>> +         * to reflect the fact of that substraction.
>>>>> +         */
>>>>> +        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));
>>>> I may be missing something, but don't you need to adjust "size" then
>>>> as well?
>>> No, as range sets get consumed we have e and s updated accordingly,
>>> so each time size represents the right value.
>> It feels like something's wrong with the rangeset construction then:
>> Either it represents _all_ holes (including degenerate ones at the
>> start of end of a range), or none of them.
> 
> The resulting range set only has the MMIOs in it. While constructing the range set
> we cut off MSI-X out of it (make holes). But finally it only has the ranges that we
> need to map/unmap.

And then why is there a need to adjust start_gfn?

Jan



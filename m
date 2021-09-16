Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA140D34B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188073.337153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkx4-00088k-LZ; Thu, 16 Sep 2021 06:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188073.337153; Thu, 16 Sep 2021 06:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkx4-000866-IQ; Thu, 16 Sep 2021 06:32:54 +0000
Received: by outflank-mailman (input) for mailman id 188073;
 Thu, 16 Sep 2021 06:32:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQkx2-00085x-Mt
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 06:32:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea4fc8e6-16b7-11ec-b5a8-12813bfff9fa;
 Thu, 16 Sep 2021 06:32:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-fAiQU2UxP4--whI59exFGg-1; Thu, 16 Sep 2021 08:32:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 06:32:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 06:32:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 06:32:46 +0000
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
X-Inumbo-ID: ea4fc8e6-16b7-11ec-b5a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631773970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k945y5QOEnDG8MEEiPbwh7dChsxCNiGHKDa1fcct2dk=;
	b=ZRFnbITd2YXeaW9VX/SB1m0mPF27DMapSAc9xjcjh4uqFqMAEsrNVnMRWkfN213rT6nKkr
	bcCU5AQlXNJKvXhicG4BRq5VHuNl/kPsvUKMvsk6IPZDATdDAUZhjAR3ssWCDGSWpLBuQe
	cfcxI7Q7/iOGpHalqKlkQ+Gx5WEcc2A=
X-MC-Unique: fAiQU2UxP4--whI59exFGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUe8hi+nQ6NVAxbmGMsjbTBuE6BIeB7HRoosTI/kHEV2K++D2/f8rUQ7cOnU81TF/Z59R/kh/3km7hHTBFqKSGs0n78+AVCfhZ456MMqOf1M2ppvJ/CSk+9WHBA1kAE771FrFLG/awWCxlTHjPv91k6ui3hO7i5WVxWlFsyxxsbsBeKzcN4tgLCkg4+Q/sLQrbgntjm6uv4ILR3WglF324Fq/32duAHhw9jyn2/qFuHiyax58cxxpblhB1pWSPzuzniEueu/7JZJPCwP1IY29Wle6GjUOnsR9sEERq4LFfPdiyFX7BaNTsYIioiuC41d1MEuHwExJIi713qas+YQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=k945y5QOEnDG8MEEiPbwh7dChsxCNiGHKDa1fcct2dk=;
 b=ZTqb99Ac4XTDCNvLoDOfufQ5c3M8YrsYvHTnY70t9TVc6UbFDaOK5jOUvlmz3ndAs4lv94wA+u2xTBCRz4kCgjePK0sl+n7jysqW5i0IBxdAXBDBRPqlPYu5tjfRfuhO2zi98l9Q2uM7o8UNDIvCI4dRjR/FzyiTFSz/psfbwdTElKDLShXgmF+fTi7sD8pWrFfmU1JwneY+JZptsKqL2BJiFtvzutKy+D64rnDihSLzwyLy9AZsNOQBMcRAWSFK06lqmHiovB3byhwlTQ/jMtU8xwebYWBQab7W8aIdnpUglhwC92SYxTIZX3k3wxCO1AmzZA+hzu4Q712zRc5S6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v7 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <penny.zheng@arm.com>, Bertrand.Marquis@arm.com,
 Wei.Chen@arm.com, xen-devel@lists.xenproject.org, julien@xen.org
References: <20210910025215.1671073-1-penny.zheng@arm.com>
 <20210910025215.1671073-6-penny.zheng@arm.com>
 <acf2e43e-5db1-1374-013e-b152093b41ba@suse.com>
 <alpine.DEB.2.21.2109100916270.10523@sstabellini-ThinkPad-T480s>
 <d2e87c7a-08e0-3cca-fe4a-6278d6939591@suse.com>
 <alpine.DEB.2.21.2109151106430.21985@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13c4bcf7-24bd-71cf-e7ab-2c6f1ec53998@suse.com>
Date: Thu, 16 Sep 2021 08:32:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109151106430.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9da854b2-c103-4fb4-8810-08d978dbcc31
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233600B0FAD4DB28FFD23788B3DC9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WRvgfD/1mA+Wmay655qVsUgi9zd6jYuNw1sNPExmJDRvjUmER44xUEGs2DpAZ7Nyaxtc1aTK//m2bmUIHjVWqtqM/HLuHPg/BFJyXJurzrsGfgRKkNIU6xSFyvrZhFr7fedFSAuLpFCwT214O62r7UFgX+vnWdZMGURzQ0M1/29yNgEspuMfRynBEejwtYb33B0LTOVgaNrSYpGHZgXoeS++fpZi1IOG5HNsFY1TrxmHI3AeLBWVw1bKZyRfPi4lOFiDvzx7MxdLD7ZZYLTDeyLWWGhaERDZ3vRIGkaiTGLnRM/FEhimPOzpK5BeRYVr1mq6cuGkH/FD4Kb8P5i3j0kfzT+1SlOHaCiegj90CWjMZUDxjVg2b19MZ332VaAO2/LmOuO3u8SJxDhIcFNebLgu/hUyeYoLqzWqqhJqCSwdOAKneFowk2pjoHfdv+MZumf6w3o1gSatCzExLf4yQYPpBfh3fkImV6n/TzGavttgEAYUrC2HZK7E5QC/othrnpylc6CBJmKs7JfTz5pOoWGrauiJeN4VppYM4sLMnz1bmQI2Wm6Fgk5eMafVcdwVckmEj95N9wVKHYUaV0X28dZrzMRehCqjnPhGe1ITpzT9qYczxnXkdOSc2VR5WTdPI2NzoURjfivpZNxvV6sKnP0Xa6cXQjQHziwUQxBYQcuaNGJPD4SyxXUZHTkEUZrJfHTZaTna/4z4VVb6or2FQ5/YG6LvKZSIE25h6NJSGMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(66476007)(956004)(5660300002)(186003)(66556008)(26005)(8936002)(66946007)(53546011)(8676002)(83380400001)(38100700002)(4326008)(86362001)(478600001)(31686004)(31696002)(36756003)(6916009)(316002)(6486002)(16576012)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGEvRU5lL3BoOTNGaENtLzF3cHoxY2o1YXRmRG1pUWxPaXNoR2J1blVNbC9y?=
 =?utf-8?B?VkVmV3ozZEJnVzZ1aFhCamV0bTNjOGVVM1RtUW1Ua2FPZnVOaUY4TW90UlRz?=
 =?utf-8?B?eGFWQWRJT2tyZTZBYmdKWW1VQkRBVkdyM1pubkRyQmhJaWI1UExMbFNHL1M3?=
 =?utf-8?B?M2MxN2JwK3A5VS9SaGpnWU1NODd6cHErTTJhTnF4RnpkUGN0WFR2VXdjc0JO?=
 =?utf-8?B?N2s3RURBcThIVVVtQkF1RmNCNFFBZWFhUjhPViswR3hUcHZMM2lpbGd2WTlN?=
 =?utf-8?B?L2NPZWg4cjljYUJoamozRXRBUVU0NVFtdDVQckFQTlZnQ2hVUUsycDRtdVVs?=
 =?utf-8?B?T3VMNHUwYjU1c1lrZC9ZYlQ5SHAyWnR2aWZKWDRZTCtjb1p5bjdBdElGVUFt?=
 =?utf-8?B?cmExLzczNEpIQUIzK0J1ZGRqNUVJSEV2ZDI5OUtnN0xXZUpXYVJmWDcrTlkw?=
 =?utf-8?B?ZXMvS08vRFg4c0F0ZjZFZUhVWUdtS1NwOUVUaVgyTUZjVmREeS9WWGJ5Y1Fy?=
 =?utf-8?B?NGpIT2w0NnR3RjI5bUNodHcvVTh6Qkw3SHVROC9FUUU5d3NudkhxTk14WGtl?=
 =?utf-8?B?dTNlcG9oRURLYlh0TzRXZEVGd3pvMlFaTjJuc1JhUkJ0UXc5eCswMW9kMXRy?=
 =?utf-8?B?VlMvdGpybFVTeHBDRXkxVnh1ekhObFUrT2lDOWY5VVJ0ZTFGb3RBbktPb2d2?=
 =?utf-8?B?bUpDZXRLN25WbTFFZzVOWVExa0lRL3c1cnpvNEtwV1hKTmxGR1RpSHlFaXR4?=
 =?utf-8?B?K2JIWmdER291WHVrYVhzMjRZV0ZYRmNaTlIwWFRRMXo0SnJ5eFE3RzFjWGc1?=
 =?utf-8?B?TENhanI3UEh3OUNtT1A2NUVTb2p6RmxWc0ExT3RLZy9kZlF5L2Zxb2E2Wkdk?=
 =?utf-8?B?QUEwczVwNjcxYngxMTZzSkp1TktHSkt4cmJKK2ZHOThQRnNYcWJvOWxhaEVq?=
 =?utf-8?B?ckdydFhUV0tpSDZHMXBPcW5MMzlGcFMzZmVSalZFa1k1cFhtSzR1dUJMcXNV?=
 =?utf-8?B?MVBwOGE3S2crU01QYUVHOUlxNTg0aDl6UmwxTVZEVTZleFRoVHdrandUUFBB?=
 =?utf-8?B?YmZqRU5QQnFEdDJGL0hnZE5Welh0MlBScDNUeDEyeGxiNEgwRjltaEc1TDRa?=
 =?utf-8?B?STZDdGNBTGgvejkrSWtCc0R5MGFWUi9jRWVuTS8rODUwMW5BTlJwZG85WlFI?=
 =?utf-8?B?aU80a2VVdjU5OGNOUElrZ244OHUvS2k4Q2xxS1IxRytLRzJjb0Z2REpxRnVP?=
 =?utf-8?B?YXZyQ0lEQ1dhU3drRU9Ta3BIbEZtaG5RNEd4MVB1N08rZmJHbU82S1YvaW9w?=
 =?utf-8?B?b2ZEd2xOZ3h1VXNuMGNRbXJYK296WFR0SFFJd3BiNWc0Q1pzbk50V0g0eUt3?=
 =?utf-8?B?d0FFTVptR1lEanB5N2NBelRMTFMyVXdEeTM0TVRRMFpUTUllVmRUUEdRd282?=
 =?utf-8?B?Q1lkM1cwOFgxa0wyNURmejFRc2FZTGRRbUhZbXNuVHM3SlRKcmg2dVoxWTl3?=
 =?utf-8?B?OHE5VkJva2MzLzh3dXNwZExJdFpMdlBYWVEybU5aUHR3VXVSSlMwUnpScmJQ?=
 =?utf-8?B?eS9VVGNLcDhzMHE4blRhUElrOFZRS0g4dUl4UUxuS2FweXNNdS9JK3JDRW5R?=
 =?utf-8?B?Tk1HK0kvb2gxUWtoZHhSWVUwSE5iK05lQ0ltTExDYUl2SnZRVEw0Q3J1NHBj?=
 =?utf-8?B?eXVWUkNLQmRYWWZxMS9kVHpDVEpkc2pRRWZsK0QxSEdTU3RmUVgwbTYrV1Zl?=
 =?utf-8?Q?n+6SfWrxQGnQoXrfL04R4QE9BT/oGALXIuD9N1i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da854b2-c103-4fb4-8810-08d978dbcc31
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:32:47.0573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qApueVjA3f4TWgAYn2VerUEU/cYG/ufU7pdkRgZTyIuTORtDNpobJw8jiVkD13ZIOQWiuNXzmyCdJoX+SS0HUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 15.09.2021 20:12, Stefano Stabellini wrote:
> On Wed, 15 Sep 2021, Jan Beulich wrote:
>> On 10.09.2021 18:23, Stefano Stabellini wrote:
>>> On Fri, 10 Sep 2021, Jan Beulich wrote:
>>>> On 10.09.2021 04:52, Penny Zheng wrote:
>>>>> In order to deal with the trouble of count-to-order conversion when page number
>>>>> is not in a power-of-two, this commit re-define assign_pages for nr pages and
>>>>> assign_page for original page with a single order.
>>>>>
>>>>> Backporting confusion could be helped by altering the order of assign_pages
>>>>> parameters, such that the compiler would point out that adjustments at call
>>>>> sites are needed.
>>>>
>>>> Thanks, this now takes care of my primary concern. However, I (now?) have
>>>> another (I thought I would have mentioned this before):
>>>>
>>>>> --- a/xen/common/page_alloc.c
>>>>> +++ b/xen/common/page_alloc.c
>>>>> @@ -2259,9 +2259,9 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>>>>>  
>>>>>  
>>>>>  int assign_pages(
>>>>> -    struct domain *d,
>>>>>      struct page_info *pg,
>>>>> -    unsigned int order,
>>>>> +    unsigned long nr,
>>>>
>>>> If this really is to be "unsigned long" (and not "unsigned int"), then...
>>>
>>> Thanks for spotting this. I think it makes sense to use "unsigned int
>>> nr" here.
>>
>> I see you've made the change while committing, but the subsequent patch
>> then would have needed adjustment as well: It's now silently truncating
>> an "unsigned long" value to "unsigned int". It was the splitting that's
>> now needed there _anyway_ that made me wonder whether the patch here
>> really is worthwhile to have. But of course acquire_domstatic_pages()
>> could for now also simply reject too large values ...
> 
> Yes. Are you thinking of a check like the following at the beginning of
> acquire_domstatic_pages?
> 
>     if ( nr_mfns > UINT_MAX )
>         return -EINVAL;

Something like this might be the way to go.

> An alternative would be to change acquire_domstatic_pages to take an
> unsigned int as nr_mfns parameter, but then it would just push the
> problem up one level to allocate_static_memory, which is reading the
> value from device tree so it is out of our control. So I think it is a
> good idea to have an explicit check and acquire_domstatic_pages would be
> a good place for it.

If this was put closer to the DT parsing, maybe a (more) sensible error
message could be given?

Jan



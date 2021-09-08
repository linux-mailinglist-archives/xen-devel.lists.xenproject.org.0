Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F0E40397E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181819.329146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwNt-0005Nb-CQ; Wed, 08 Sep 2021 12:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181819.329146; Wed, 08 Sep 2021 12:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwNt-0005Lo-9J; Wed, 08 Sep 2021 12:08:57 +0000
Received: by outflank-mailman (input) for mailman id 181819;
 Wed, 08 Sep 2021 12:08:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNwNs-0005Li-K9
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:08:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89de3fb2-109d-11ec-b14f-12813bfff9fa;
 Wed, 08 Sep 2021 12:08:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-KSshkRI8OLC-HnKJ5vqB0g-1; Wed, 08 Sep 2021 14:08:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 12:08:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 12:08:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 12:08:51 +0000
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
X-Inumbo-ID: 89de3fb2-109d-11ec-b14f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631102934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LsHY1ULNA9PA1Ool8eII2TD7Ugxn9D41f/uPUTi33jM=;
	b=YWftrmIP4di7d4Fd536QsXelGACMctDixAInHCegIy7jMd91JkPh+PVdASfzlXtq7v+luS
	OGgKZNRe+JsQtzcj1HrxWI7Syma5Oo16FzHgtl4tZA4GoYfEfDz99dHoOwiV+YMWnq703O
	bp/A3vIxy/qkxxbaOQP4jl4dbZFyD80=
X-MC-Unique: KSshkRI8OLC-HnKJ5vqB0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJihRneq+s3lDAE3y6DluchPZzJYlXMOZIrjvgorEk0u6zLxjS/CDatI+zgIMnfS9NGXIrwee6TD++eftth2SiHIOjxPKtqnHIzfji+zJl/humVISBWlo3bVwe1ZwWBXo1dsAO2Cgb1RoXcGp9+4Fj1Rl5c/UM/EMp8Fs/M4KiJ722RBjUq4aFSFU+wo40Gz7H03KGSYTySIydFF2SZnuNDi1mnUBo2TRYt2oROoXvXE1FFo/t2yLx7fSQLwWAeWjjLRh+PbIZ/UuaHZ5mAGJ3kjpKU+aymvMlqXIfXYPUTpxuAVihNyUr698jOlzCklXLu97Q6+vtfNhqSzu2KG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LsHY1ULNA9PA1Ool8eII2TD7Ugxn9D41f/uPUTi33jM=;
 b=PN6I8pMpZYuM7TTVEfrbTomjKU82d7f+3MxVB5y6yTyA0NJHNMcr4ASap5op0MW/d0YwZKUeGokwfB+lJekbbTv8L8ENbeQBVcgCQeMcQ/5RjpxEvO5gxHHEeyHxO9ItSsl1W5XsUm6lVzEDF2jOyibd5QhRaotsE4PuFrf4VpTaOh7ZskKBPRXR/NswEE9mt/isLd07ed1/BLj43knaxqMVwvhySMk/QXqmCSWHJ5TsHe00wuQMdbdkG3+4Ctlr/NPFXjind6k66T0J/4v1TtZSNqNLw1XdPaMU6qQJWwQucPZ+h0La9E/8+qMRlE/TXSTUgHci1vi0NcFSqPJMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/2] x86/cpuid: Detect null segment behaviour on Zen2
 CPUs
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Pu Wen <puwen@hygon.cn>, Andy Lutomirski <luto@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
 <20210908081945.11047-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a27d3631-86a3-cacc-efd6-97b02e3f8b94@suse.com>
Date: Wed, 8 Sep 2021 14:08:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210908081945.11047-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85a39ec5-6f67-48b0-f35d-08d972c16c16
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB339110BE9FE200C9D583122CB3D49@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NeNUTTPQApBE+kcj+NU3afJ7RF1TftV3M0cyLgdLNj/Jd/WGAZufSvOfS531O4o+xdymlO77+fZlfxS1aeEd01eIYJDDhZYRoGfSv3Ni/yb0z6M5MIpFpmX8QnB7oYtyOOl/3o1+3U7KQOdf5871GYfxsdelOXOnxOtqh93mj4Qxd+wEvS6kq0RNGwKZ0ZhVEZ4DgEHCZoVDPbl6VEnsNLn3rOejULRZorf7rGUNCDXS1X3CsipHBO3NS9+J6tKpy5QSZUHe1ZJfYFHm4i1pyNBk2gWyT9Y29WPbHZCUhKjSJEfFQUdbcHM7EdrDICkUMSoXcf3qjPBA2mfllghHXAx19hYaAK/UePIAQpSvsbdYc4fNrbMJCfeIDwEOTOKGidyXk6BPoLcLKUh9Qj4qBhgiAF3ZdivzgJnFOl91NfR90jfPUP0SR7Wakv6pEV69ddX3N1D65k2pOg8jxWU4HKJf8vl5H3g8zwAflimYUGgLCSI2/RLUSztkbcmfEIhl0XYW8vHxhf71sWqTi/yf+IHLRxFgjtsNTdTi9YPtayfIT6jV0q/8NslRXXh4gHDqm/XUCIsCAcyaQYM/gxPz765Kf7019MeCMUgO7mfs6HnnAEP/ZdQb3pjX67NlqqWE7vwVlUDvHqE/cBkkEmRClE2w2GBwok6rd/JE/iXVFA6SGc1ogvHiR7vlFCRuFay5dOAPS0lrOYC7aY76ODXaaKdaYww5fme5N+QA3D4ba6W7qQOGNahmD2bmShlQubfQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(54906003)(36756003)(186003)(6486002)(66476007)(8936002)(38100700002)(5660300002)(53546011)(31696002)(26005)(66946007)(4326008)(31686004)(8676002)(66556008)(86362001)(2906002)(2616005)(956004)(316002)(6916009)(508600001)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFNtVkxUeTBFZjVsQWpuaCt6Z2Noa3dWdThNQVNldlorb0Q5ZmZmNTlITDMz?=
 =?utf-8?B?cEEwREp0ejlkQVU0d1hsL3l6dWhVcmsrUWV6bGtrc1VieHNhK3ppNW1jNVdY?=
 =?utf-8?B?VXNWY2IzZDU3SHNUQXpELzdKcVhUTnRUb2RLc1JpaGtLdGNyWTdDd0tqemdp?=
 =?utf-8?B?MnFQTGZEZHk0T1cyYjVYWFR3RTh5Y1NZZkhWVzhJK2toaEZaSFlkU0hjRCt6?=
 =?utf-8?B?WUw5Q0tkeFZrYWk1VGo4Zi9lbkViMWFnaTAwZXRBWTFPeWd6MnFkeE1jTFFT?=
 =?utf-8?B?VG91NFlLTzQyQTBlYlNjM3NOVDhsVXl1ZExGS1BMQmtsZWRidEZieWVMZS8y?=
 =?utf-8?B?OXNLTkxua3RJZWtPd2Mwa21YZ2VJZUtxRmhpNnc4VTVxRURvTklPek5IWHM2?=
 =?utf-8?B?L0poaXNFVmVucXlTR0Z3THYzTlAySnJIOEYxcU40STBqMG1lUzNDZ3ZmK25Z?=
 =?utf-8?B?QlBaU25CQkJXbUgxR01zSS9CZlVBQVhOWmRzdmdzTWprSXVUVkphUXoxYlBD?=
 =?utf-8?B?cGt5SFlRNWJORXVJL2ZGc1E0Y1dnME1vVXRYQ3dBMEtkL2IrenFRYnR0Zjc4?=
 =?utf-8?B?QWJ6T3prRk52c3oyTHFhbzA4U3NNRzFhNGhGQ3ZjaFNWRkhieS84Y3ZTOGxU?=
 =?utf-8?B?UGtIVE5ENzdOUWZSZHk3REJscnEycVFpbUk5R2xpM0NOSmhKa0VseXFoYlFS?=
 =?utf-8?B?YTI3dEVNSmhSZFE1RGRRTmZxdEdJZ0xER3hCR0VSdlF5cEJRTkJ5NkRLeFNr?=
 =?utf-8?B?UEJla21OUDU4VTRGT0I2MEo2ZTBHUkVUcEJFWFpCMEtZdE4xUmhIR0UzYXhG?=
 =?utf-8?B?UHBqakMxb3diNE1FcjMwWnZxSVNmUnVlVGgyUUZpTGh6WTQ4YnRZbG5QL0xj?=
 =?utf-8?B?N1QzUENMK3pWeEZpb21BOHlxbE5WOVJ2TWhvdnh2dHNQUU9jdUVjUUQzSVpt?=
 =?utf-8?B?K1lRT2pqbTR0QUxHd2NVU1BhZEVMMWoraEl6b2psU0JMVHF4UEloWnJ2SUhS?=
 =?utf-8?B?c0o0Z21SbnBjOW9TY2h0a1prT3Z2dDdTMHNFeEhTRDhlTjA4ODJsNld5MXl6?=
 =?utf-8?B?cEtyb0hxOW01Nk8xYlVGZDFyUWxYbnprYk8yVS9oTDJqeE5ZMUdJRUlpZ24z?=
 =?utf-8?B?UFd2ejB4VkNqSXlFaTBZa212MUVYcUVlVElzNDlFSjVwL1VSclNOOE8reFQv?=
 =?utf-8?B?WUNqdWkxT3NldDd0MmVYTk1SQnEzcXBuc0FyWk55SVovdHFQMmxoY1FUZUtP?=
 =?utf-8?B?RUhhWWpyS2l3eTdra3I2dlBPZG1BOXc2TFMzWDlGaXdLWkl0bWJ1YzlDRXcz?=
 =?utf-8?B?alVwVHN6MTFJaUxDS3FpcFdsd2V2bGxOTy9kNC9JOXVPSmtTV0FaS3BCY1li?=
 =?utf-8?B?TTMrQ0x6Z0pPcFVwYmJGZ08rQmlxQnRuSDBXRXZ0a001Vkk5Z0NFdEhkTE9j?=
 =?utf-8?B?VDl4TnQ1bmVlY0dBYVpMV1ppUUZGNElMRGdjNUtlL240T3pUdTlSWTU3VVVt?=
 =?utf-8?B?L1J3L1M3Y0lDQWhPZXJQWUZXcUdFbTVwbkxucDA5Yld1a0ViUDJnOXJNdzRF?=
 =?utf-8?B?ek1SRlNmaGY2RUFzRXBtY3UwSlpGUFBMc3BOaW9TeW01Qk85Skp1VjNOTVN5?=
 =?utf-8?B?Rk0yVHVFbmFZOUswamV2d3ZLRDhMRFBPL2Nkd0NLd2Ixci9kTW1IanErbWRv?=
 =?utf-8?B?R0xSejZjTVpHSWhHNkVyaTlZR2RiL1BYMS9QZHo2UFo5M0VIN3hKSysrMDRa?=
 =?utf-8?Q?EStC87hSkb9gtXxkH32cpU6IO6ZLL1r8tOznUJV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a39ec5-6f67-48b0-f35d-08d972c16c16
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 12:08:51.8513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UY2KpoZxkmIJvWDigDehxM364KpxmMNd2zOvvDRn7I9+GH5kjFESdJhhWyWI8LW9N1bdPBta3zFtRVIVqvSXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

On 08.09.2021 10:19, Jane Malalane wrote:
> Zen2 CPUs actually have this behaviour, but the CPUID bit couldn't be
> introduced into Zen2 due to a lack of leaves. So, it was added in a
> new leaf in Zen3. Nonetheless, hypervisors can synthesize the CPUID
> bit in software.

Considering the prior model checks, I understand this isn't all Zen2s?
No matter what the answer, I'd like to ask that the first sentence
start with either "All" or "Some" (or something along these lines).
Which is of course fine to insert while committing, so not need to
send a v3.

> So, Xen probes for NSCB (NullSelectorClearsBit) and
> synthesizes the bit, if the behaviour is present.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



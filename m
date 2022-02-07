Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966284AB7F4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 10:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266624.460323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0gM-00082X-JA; Mon, 07 Feb 2022 09:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266624.460323; Mon, 07 Feb 2022 09:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0gM-0007x8-Dp; Mon, 07 Feb 2022 09:51:38 +0000
Received: by outflank-mailman (input) for mailman id 266624;
 Mon, 07 Feb 2022 09:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH0gK-0007vB-KO
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 09:51:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88b38ab2-87fb-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 10:51:34 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-fSsQYmgiOKib0r30aXbAoQ-1; Mon, 07 Feb 2022 10:51:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6166.eurprd04.prod.outlook.com (2603:10a6:20b:b6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 09:51:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 09:51:30 +0000
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
X-Inumbo-ID: 88b38ab2-87fb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644227494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwgq335aOJOtqXr46wEMq33uLC4uGbizI9qqa8QslsU=;
	b=VfI0C+xeuP2vVA5ldTA9HvoB4+dMIQ0U5pTmiawC8tKMOEl5zPngP4RZAhj5iqGCRJmmf4
	05WHosO8UK6Lt6GCEHBVJ39co1t3/Nrudh9SPl7rP3YXS7wBCm7sE118UiWJibRAz7iFrN
	xxNooxqgzKLd5nndbrQn/OlvrnWryZM=
X-MC-Unique: fSsQYmgiOKib0r30aXbAoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGuj1CgOaTHaOba19z8DpKUNXI76cr0SHK8fbMesAio1QaZ5OR7nHewZUPvD47fM7Etsrnj9fZ/I6L+VyDvbGk+qMZGlwq4BzM4uKX1Kp6d9rm83v2uz/Ot6o/p/qv5Hu/HHTbVDB0TmFh3jgjtO/bUaapgX0INJS0yLHcWvCJ7ef/M+GuhpOSPKYGgf0nM+m3fLE8TNYFnNsNfjnra/PzosGl95gPmzQYHcgj13Fv7Nn7KTlZDWXQfNbBLGT5cej9GtmSSoIB8b/5W9uNKzqAWSW4FWDRCpanaYbz1f4lLb9NgNEO9i+ZM3mJn0TsKF4OpHBFGYeC43aq0zAXaNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwgq335aOJOtqXr46wEMq33uLC4uGbizI9qqa8QslsU=;
 b=QRfnpGj6mH9FZGYpU6fOoKHLuF0Pjz1jX6tzsHzlb55DNtusdbvBm/Ouio8ObnefLZ2tVbXr+RYwJK7+KFGKQdaIBVD2ccpQqGn0VXgtEeiDFfC9i+PM0rXtTNztKDOQWJSbC87x0LCMNPsCbdQGLDSv5fjAtWey1K4PJai7/b5s7U/DAMAXeq7xKHAmA3y3EOfEXa8DHLhfvRwr6pR3i/tIpqq0RLuq2aetmXolIRgSt272aVdmBTdbua3XdXdumMTKQpzJOkCzNRTNnzqNUPR8K2cbXdcc/OItufX/f3UL62oonh+pCmBYglbIPJRD77iyCCDfHYRKfomlS+JhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1cb63467-787a-0a75-0f77-893a0b7e0ac3@suse.com>
Date: Mon, 7 Feb 2022 10:51:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/16] x86/P2M: drop a few CONFIG_HVM
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <55643e68-432a-116a-b68e-2200e364e5da@suse.com>
 <CAFLBxZYCqCKeuM4XJTNgEwzoAG7P8aw2dP5kHFSSHX_xmuOWBQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFLBxZYCqCKeuM4XJTNgEwzoAG7P8aw2dP5kHFSSHX_xmuOWBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0038.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1244574-72a8-4573-b358-08d9ea1f6ac7
X-MS-TrafficTypeDiagnostic: AM6PR04MB6166:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6166426083205AA88BE34CFAB32C9@AM6PR04MB6166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kODZ9lrdG/RCJVyJFw0473cWYIziwiPm3KIlPL+HzUt0DWu1ZXHo298QhXgF5bW4KjY2/FizfRJo+HKkGR6mgus/MzJFjhG7k0QvuIq4CsxG/74YteG8XGwdbBTmcX/ztejAKn41GeIAgDqO3Qky0IXHV/DUV7+EoEiJCRWT9Ox1Yvd/bGkwd/A6K5PeqY4ySLKMTPy8wBOe/mL0JjUpTj+h5nZKivcUcSpIjbYUbPp4BGW5fuPoa0OUoPCki4qLhbrzFAtQBtbc4i+5lrT0TOcKKmeZ5NjmBZ2p4UGWv3LpzvfBHv3E5NAe3i0x53Q7u4QTscIR6+bZnI+bHek+AAiq26A+m8otqk5bz4LFMpGCiGqVXSkBKiuMrG/natCGXejzuLb3PpV49vGWexWiQyvs45sZsYuv46ls+sqrtl+H5pPudCcFy/rdTPj6TB6F1/TBsGFgNDLuEMrALp/88VctvsO4PR8WWJu9xZMGs2v1rwdSBz5Ii/Lj9IWupla+svXtpelsXLFiG9hEKBJYi1vf7ZLdqZppWWAQ5E5FTi2Cz1AIyGQKXtJR/M9TC5QcOtCtriYeRXmjN6VrMZYkFfpZudy47MUPNHLd7beznjcjdxBtL3exqZnu+HF8d00rQjronuPHq7zxHXpX72sPsr6pB48zZvWovjYOStxcntEp8SnbDnzjgQmOmvWPzpvDUuUTgm1jO3DXk6JkJZEjOhWCIqrT6up9iLb9tnzEgRw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(54906003)(38100700002)(8676002)(8936002)(4326008)(66476007)(66556008)(316002)(66946007)(6916009)(2906002)(5660300002)(6486002)(2616005)(31686004)(6506007)(6512007)(508600001)(53546011)(26005)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGI2T1phcm9razUrRjJWc0JxTEZiT2hlVmRzM21ubkQvZUdOSzVtRG5vZGp2?=
 =?utf-8?B?QWdjV3Y3MENmYjFUQW9oSmNCTHdRYXEyRHNJT3FzOGFPQzFERzV4aHNVeUY3?=
 =?utf-8?B?TkR0eUJCTDFxZ2lvS0dzUGRSM09rcVBmSmVsdEJ4RVRoODBQWmVUSUFqS0NC?=
 =?utf-8?B?bjJ3QUV2Q2c0a2czanJRV0FzTnVJTXpCV2U4UWVvY2p2NG1kWXFJdEVLTlRo?=
 =?utf-8?B?N1BjUkRWa01Hb1R3b3VBRkRvN2hqNGl0L2paanc2VWtKa0FZUUVaL3dyNlU2?=
 =?utf-8?B?TTEvNDNnaTdjdEtueERlUzhKYlcwZlEybVdVbEJjS084VTM5dG0xcWFpNE1q?=
 =?utf-8?B?WlRtZnh6aE8yNnBOeFUrYTlZcFF5d2lBS0hvVldlaGg4NUFiOGNKU09pNU5V?=
 =?utf-8?B?V0dJbzN4Y1pkUitIaXJSVWRlUkgvVENGU1hzdmE4aWFzdEFRQThHblprYlVT?=
 =?utf-8?B?MHZnYjA1WVk2UnJBT2JZRzZtQjh3eHJJK2hucmRDTmZDVmpMYWJ0bWc1WU9K?=
 =?utf-8?B?NWdtRk8rQnJscmx3VVNQekpWMXNUNmV5alZYNFFaZ2lUc1NiL3BlTitqOFZ4?=
 =?utf-8?B?KytCUEFoaEdhUjQ3K2FrM0lOQnl0cVlUdUNCTGk5MHlnaG45Rnp3bEgrZXhT?=
 =?utf-8?B?Y0tjdU96WjFWTUNsZXRicklmMU1OVERKTitTeGZkaTlyR3huTGpMaThsaWpL?=
 =?utf-8?B?OXVweGlBQ3o2T2pLbGtSQm15WTRRaDFyaG5LbllwTC9icEV5MnFtZWhxQmFD?=
 =?utf-8?B?YW9pRWZhWHVvR29Ub2d4bUJpbk5jWkpKVnFtUTVNc0xsbXlCaHkzVmZWMVJ5?=
 =?utf-8?B?UjRIdWNwemZCUFlSZUxYWWt5MEtTT045YnZnemdOWUtwY3ZqcWZNWHlTUmhF?=
 =?utf-8?B?YjhmWnBOdURHcThBZ2pONVkrbWd3MnUzZUVYVVZGbkF3TXUxR1d0cllEbzlD?=
 =?utf-8?B?RG9rSUN2dGxYSmczOGV3OURTckFiUjlIZHRtNGRUWTlnbXBpVmNsZDErL3R4?=
 =?utf-8?B?OGR1VHZIVmpEbXZYS0RRT0FlRVB6THdEVFJCVGNFZ3ptNndpbXMydUJuZFRZ?=
 =?utf-8?B?WWtaeDdFRU5iZDVKbFd2Y1Z5TFdHZEk5bHZrOThoNGx3R01OUUwxS0tjcG5y?=
 =?utf-8?B?YlQ5czhTZktvRzVVNitiVVR3VnZUd1BLS0d6cDRTYlFyNmNrcjJNMzZROTFR?=
 =?utf-8?B?bTJVU0hUNk5FZHVUNzBZRzgrdnlLL3VsOXlZckVLcDg3MlhsSU5TUTF4K28z?=
 =?utf-8?B?a1VuWXpiR216ZG1jTEhmanJjcUhJQU9NV1NMYmFmakw1QU8rK3N3QjJldDhl?=
 =?utf-8?B?ajhRQmVHZThhSEltNGpPcHBCeFl0MkhKSUZpbHR5R3lKNUxqbjFKMHR4UFll?=
 =?utf-8?B?OHByajhOcXBKa0lXb2FoT0xLeUhDRDFyeHd0UDQ5WHRxSWIvK3FUYk96UVdL?=
 =?utf-8?B?Wm9VSWRQTlk4MlM4NStJSEhlTnJTRG9qODdDU3R5M0hyQnBRak5jOFVsQzU3?=
 =?utf-8?B?RUYvYkF2MFBKcTcxTGtkMTAvb2tjNVRvdVYyYk91aXVWMnpaT3RObERXS3lk?=
 =?utf-8?B?SXQ1dFRPTWQ3djM5WUJ2UWR1cFV5MWFQSmR4ZElyLzYwMGhkRGx1QzVlTTRi?=
 =?utf-8?B?NEJReE1OeERvM0tTdXdkY3dlanYxRVFHbTlYRjNXQWZKVmU4SWY3eWRQeHpv?=
 =?utf-8?B?bm5wYUtSemhLdnVGZEZxb21VQkxhSzh6SEVUNE53Z3lzMHI4Qmt5WVNhL0dv?=
 =?utf-8?B?V2Zka3J6LzNDM3R4bzBTWG10aHhtUE11bUQvWjVDZmdKdis1YjJiRHVuOXBt?=
 =?utf-8?B?SythSzlrdE0raW9VbWkyWElWcXJSZmIzci80R2hCR3M0QlJUSU5TU3ZpZ1Y4?=
 =?utf-8?B?dHNhU2F2eWVuNEMzbDJ4UWlza2lTNWJUaXZnMjhybTZid0FvSGs3enUrZmI5?=
 =?utf-8?B?Vk5XaTE0OHlIMzhRaXBQaHhiV09ENnRZMXQ3Y2QzcVM4c0JUeGZMaHIvL3c4?=
 =?utf-8?B?bWUyZlhzRGtacmxlclBXSndPeENIam5MVWMzdGtENk9JUGV5MnRZSDdPekg3?=
 =?utf-8?B?N3QxVkQvaEdrVmpBMFkrVU9kcHMzbC9ia3F5WWRpNVVzNTc3MmdkV3JRYnZw?=
 =?utf-8?B?dHRNOWNydzB1Sk5zdHVTMHJZQlR3UEVsK2xVZ3lZM2MzWFg1NGNINGlWNFJo?=
 =?utf-8?Q?hi6ug8vp5Xfn/Mhv48pesqk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1244574-72a8-4573-b358-08d9ea1f6ac7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 09:51:30.7868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkpUvmMmvFfcP/cem/vqjhERQdxvqNZJCbhTwZft0xxBmUIL2gzjLF7nakQVqzGVVladyg9OpOVlOzLGdqFI/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6166

On 04.02.2022 23:13, George Dunlap wrote:
> On Mon, Jul 5, 2021 at 5:06 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> This is to make it easier to see which parts of p2m.c still aren't HVM-
>> specific: In one case the conditionals sat in an already guarded region,
>> while in the other case P2M_AUDIT implies HVM.
>>
> 
> I think this would be much more easy to understand what's going on if it
> was more like this:
> 
> ---
> x86/p2m: P2M_AUDIT implies CONFIG_HVM
> 
> Remove one #endif / #ifdef CONFIG_HVM pair to make all the audit code
> CONFIG_HVM only.  This is to make it easier to see which parts of p2m.c
> still aren't HVM-specific.
> 
> While here, remove a redundant set of nested #ifdef CONFIG_HVM.
> ---
> 
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks. Unless you tell me otherwise I'll assume the changed title and
description are merely a suggestion, not a requirement for your R-b to
apply. I continue to like my variant better; in particular I'd like to
not mention P2M_AUDIT in the title and this way avoid "While here, ..."
or alike.

Jan



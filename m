Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7945DF52
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 18:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231717.401144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqI9s-0007ui-Kp; Thu, 25 Nov 2021 17:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231717.401144; Thu, 25 Nov 2021 17:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqI9s-0007sj-Fi; Thu, 25 Nov 2021 17:03:40 +0000
Received: by outflank-mailman (input) for mailman id 231717;
 Thu, 25 Nov 2021 17:03:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqI9q-0007sd-Mw
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 17:03:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a176530c-4e11-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 18:03:37 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-5YflJLjuMFmYvvQ45S1UMQ-1; Thu, 25 Nov 2021 18:03:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 17:03:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 17:03:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:20b:451::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.15 via Frontend
 Transport; Thu, 25 Nov 2021 17:03:33 +0000
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
X-Inumbo-ID: a176530c-4e11-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637859817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OdWm2aBLXEmAIhTbHU9dtDXCDZVzD71TdNALJ9ly6yQ=;
	b=HxaRRhBYscnPrBApdUJs+7kBrXFvdXpDRK0NKSgsTp1hX43RfVOOiDc0j0d49MGY82Zgpv
	F/5vV6t7ckm8eGc/4gu+y8/2zyW/owf1rQzjvugYRj3tY9a3fh+mJCwUHQohMkdw+Xtxgd
	xb5+NhtW3WfI73U3xLbrKS2NCnbr1vE=
X-MC-Unique: 5YflJLjuMFmYvvQ45S1UMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ap4GrvOjgP4SBiAQkwUmZZhjJPSNTKTH8u5k2V+8nchDFbIpezErf/3uZruffQqsXWjg3I8dqYnJCYolr0n6WOhtbXqBxBcX8U2KITlqghGp56z5YRdDtwAas/zCG6XYUKljqpa7bF6fPQSlhrhK/pKtPo8y5t0Rapi40kiM6Xs7fiXwndkVE+agUUty236d47Y9jM8E+Tfyrgc2uy27M93iII5aUkkawhS0KJhzJUWnccIcZMqDEejHNeSa19RFdmq1b9GOpE58nUH9xGSYjmOBIcxXiz5k4ERXig3o9+xves61pXSqAXRssZTm09Y5JzwUSuuQMgXp/b5yF1ZwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdWm2aBLXEmAIhTbHU9dtDXCDZVzD71TdNALJ9ly6yQ=;
 b=EbiVWe5OE5UBNdU0cuLB09S8jj0Q0JDAgKRukY6CIjTvuXqNghGwotumSkKe0e24n9yq5BcmwrjksvksxQTARcaryDDBk9zSadIdL+BCQyo8cjVzZsVDyN7ITJGGRt+MRBbNsi68L+oMfG+Tr0Z9mMgL1g8cXKz9NkQfm6oVsywWLG7Qa7AcfJSr4dt0GgURwI2OTpqECEQGnwC+9EOOITd7dLXuIjrREUKgYaXufW68LbBVa+Am25N/RYddJiQrSX/f8Zi9x3elKDhnZmeS+KeJLNKxsGl5v/K6sUr5mztl1LKXQD9LB/fl8GbcOJqqQYaNS5O92wm6AtX3VigkXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
Date: Thu, 25 Nov 2021 18:03:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0006.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9385d291-4f68-4293-44b0-08d9b035841e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478CCF9C32DE35F7F414ECDB3629@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AVahQF/1Y0KCCKLvQA/196PEiJu1H2jPyO0s0FZu3WQ5p+wmTIZHo1jjJO4dCry6a4DWbZRtoq6sJTRsKqaJWr7bTuhw5E1HxZW86LAucarNQBHS/lNoOXtdpy4u96iHUepLsJxdJ59b7WsHg3pIy4tCILlEyEJETWX3V228wvVxXXZsSc8xTyiO+TfecaUQ6tpVprMwLvbZbSgd3ST1gEk+FzE3IsOvKT45Ju0rD24mCODMfVtL8wh7XkZNDQcWtsidvn9nyDxFuaonpK59rJIGyZ/RML84xVr5cVJypBGOZvDR0vDHa0Sz4Mf2so12wqhjreM/fI9XrbyfiE676aEjxyAgsCvFu4JCbglLSAaBBkNf+frxsn0JLcABQ6zfpz65m43Ce8gpZL+Q9/IfxoiYd5Z8nxTNTFKIpNMzCvfbSEuOVOU0JlpooPQPkoUFQL00TpoAd7cJa2sdpfxPNe22lhFxqPTIQodx4If69cND83t5vTtjVsvno53UQy/84lGZrhhYzetd2U0jPIiGMQkDEPyiZsD+UL9drtXSaIyFBI9TDEbESliJTZfMNdmNzn8qBo22GahqL/rP21yLxPjZsVRc7rURtVgnNbkzHStrMImc2BjWcc4rhskzEeHEQmuiqS2Ttnai7Hj/Ph7+3WZCheqbEfpLIbbYvyUIP0oLnlAL22BJBG4Ncrcr0x0DMJB2D2LKFB9I7fcGXV9C+DS/3SpMWWK5D7PgnBLBLk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(2616005)(2906002)(16576012)(36756003)(956004)(6916009)(53546011)(38100700002)(66946007)(83380400001)(316002)(54906003)(31696002)(8676002)(31686004)(6486002)(508600001)(8936002)(4326008)(26005)(5660300002)(66556008)(186003)(66476007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzFlVEVaRFo4Sk1zaWRUb0ZFMnM0eFRSR1Z1aVV5RXJaVnJETnVxUEdtSWhQ?=
 =?utf-8?B?UHhtOTc5UVh3QzVHTzFFZXRJbUlzNmNxR0tGOGJQWVBOWWlYNitnZVM2THJ0?=
 =?utf-8?B?cXprbnYwNmFmdkp4QmQ3aWpKdS91MkRqM29BNWUwcmIxREVoYjd6MDRyZUNX?=
 =?utf-8?B?TnorTzFCRnpKd250Y3lpb0EyZjNqWTMwa2FUWEY2R1BDQVJ2amFOcUdQdklY?=
 =?utf-8?B?bmdmbStIajN1Ui9Jb0JEZlZPNjhjVGF5TWFDSDNFVmV3bk10ZXlvMWFvcjNo?=
 =?utf-8?B?dStoSnorUTF3SjlKUmFHRDREK1RTMHZEYzVBeDl3VjNjTk9wQmZzcjBQZjIx?=
 =?utf-8?B?d2wrMDJvSk4xenlqQk5vRkIyeUlvVFAyMDFtV2c0clVlYk0wcDJWWEJUMzZt?=
 =?utf-8?B?Z3FkK2k0VGtxYWx4N3hNSVZqd0FaRk5ZS0tsUWpkRStiMWpRaUpza05pOGxs?=
 =?utf-8?B?akFqSDhHenRCVHRicHNGUXlOSmJwWHZIZUNNcFlWeFhXOG5WUFJnQ0VGem1v?=
 =?utf-8?B?Rm03QVNKN1BKYVhuVG41UERPTVFEbG8xUEdaUnRTT3hvc2dyUzBXNTk2SFRw?=
 =?utf-8?B?bk5nM0dkSXNkUnlydnFjeGhRYjJlWHpQOEJFQ0xmaWF5VWVYeXBwazJvZmVt?=
 =?utf-8?B?WlNyamovQTFYeGdNNGFvbnhtcExybW4vb0FpNy91Q2xXeStXcHNVRHVGVWZX?=
 =?utf-8?B?SDQwcXFjUC9YM3pPN09FRnR6SDlSK3lqS0RsNGVvaVVySlBpUXZNYlhLb3pW?=
 =?utf-8?B?NEtjZ1RUWkFETkRYRHVyQ1NGcEs3QXRqWG1wUDFMcVUvOEMzR1ZmUmhUV2sz?=
 =?utf-8?B?RG1zRElnRXJUZjY3dUhqNHpyaGlsOFBCNWlqbS9zQ0JIYXpmT3U3R0h1emZt?=
 =?utf-8?B?amRFWGR6QTZCUkhqRHNXekd3TklEKzRVeU1EL043VVNoc3o1T2UyOXpjazlz?=
 =?utf-8?B?ekhJVWtxamoxTjBzQyt0MEV2SC9LQzVRdks1cnhJN3BrWnRIZjJVL2dXWTNp?=
 =?utf-8?B?elFuNjlxRU9uYzJtTmFEZkgrTGM4eFNGdWEwWmhIOW1iS0ZGcUZhUHhHRWJK?=
 =?utf-8?B?MFJ0NkI5SXl6N1lRWWI1MFZDTXgwUnM4ejFqWit2b2VDYldETHdwSmR0KzMy?=
 =?utf-8?B?YmU2SFVZOGVBdWlJUzYwUDhCMzhuVVp0U3MzUGhha1lKNTM5bXhTOU5YWExn?=
 =?utf-8?B?cTMreWRRRkZlS2Rsd2pIUjFLWEllOStjSTJtWFFWemptSEtxMmo4THFuc3ZW?=
 =?utf-8?B?UUdFaXhrRkhxbm5xOXUraHN4UVlXd2pjSUU5VmtvNk1CMWVaaTdxejY5cnFP?=
 =?utf-8?B?K3QzWEZXaDZJMjBVRUJYS3ZRRENBVDVuODIwTGtJVjdzUjZUYzd4NFJGVWJZ?=
 =?utf-8?B?bmdLQ1hOa2M1YllWR0J5Q0dQOS8zNXJGRWZoYnJFK0pWY2RzNUhnNXR0STVS?=
 =?utf-8?B?a3ZRK2VGNll0ME1QTzRSM3oyWERDSDRCc09xYkkzeGRSQmM4NEVsdlZ0Q3hT?=
 =?utf-8?B?Qk9VQ1VyUStOSUtONjhtRUFTL0NDUTZxZGYyb1VSRTU1T2dQMWJvbTBFV0R1?=
 =?utf-8?B?dHdYaHVnZGtTTnF3eDRsNERyc0J3VXgwVE5aVGJaSUduWlZFQkg2RzR1QnFU?=
 =?utf-8?B?Y2VxRnFXa1A0Z1h1MHo1QTZINlBQM3g0M3ZLK0g5a1dCUmJZM0FMUjdnblhq?=
 =?utf-8?B?eTdyL0hDZzU1elZ1Z3FwcnpDVEp5bDFkejRNWi9INXYvT3ZYZXNRNkZ0bEVJ?=
 =?utf-8?B?NGJnb29zVnhmVklSRXlPZUV5dy92THMyc0RxUk4yemdtYlExZTE3a3lkYVFJ?=
 =?utf-8?B?UUtrZnlUeDVXVTBmK3lEbXp5QVdtNFpjbmJqeXd5aTIxTmx1azhWT3M0eGcw?=
 =?utf-8?B?N0xLNlRZRlRLek03azN5Qk1GUXo3NElvYkpDRlhrd2pIQnlNZnVxSzVQVU42?=
 =?utf-8?B?SnNXaDNUaTJ3RGVPcFBkTVZxbUxJNHZRN1pFQUVNZVNZSnEyd0wyTnplOG9N?=
 =?utf-8?B?ZzNORjZVODNTNFRJeTlhZU9kUTAwNThXcEs5U0lqOCs4ZGRua09jV3k0a3Yr?=
 =?utf-8?B?QU5xK3FHeVE4dTFYd2ZZczE0VHNtRXh5VTJyNHQ4R0F2RDhZM0IrSllNbmR1?=
 =?utf-8?B?VXVWcUQ4VU1LdWllKzJJdFNCV21IOXQ2dDFOUU0zak42WDRPQXpqajN3NXpK?=
 =?utf-8?Q?+7TOQa+ic+hptiFS7XHz7yA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9385d291-4f68-4293-44b0-08d9b035841e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 17:03:34.7686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YO6ssDq5UxHA4Jxe89Tp9yHKIJOD2uJLeZ27HkfkBbRodph6wDvITK2xWVmNxIgG8tDtNsXr9h1GXKLE5m0EAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 25.11.2021 17:54, Julien Grall wrote:
> On 25/11/2021 16:49, Julien Grall wrote:
>> On 19/11/2021 10:21, Jan Beulich wrote:
>>> From: Lasse Collin <lasse.collin@tukaani.org>
>>>
>>> It's good style. I was also told that GCC 7 is more strict and might
>>> give a warning when such comments are missing.
>>>
>>> Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
>>> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> 
> Actually, any reason why there are some signed-off-by missing?

I often keep the author's, but drop ones which clearly got there only
because of the path a patch has taken through trees. These aren't
relevant imo when pulling over the change; I could as well take the
email submission as my basis, after all, where just the single S-o-b
would be there.

Jan



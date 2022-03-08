Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA24D1C36
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287134.486975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRc1t-0006mg-Nl; Tue, 08 Mar 2022 15:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287134.486975; Tue, 08 Mar 2022 15:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRc1t-0006jc-KL; Tue, 08 Mar 2022 15:45:41 +0000
Received: by outflank-mailman (input) for mailman id 287134;
 Tue, 08 Mar 2022 15:45:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRc1s-0006jS-Gd
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:45:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdaf3d7c-9ef6-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 16:45:39 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-dhf2GIfpPJSroUqeHyqXpA-1; Tue, 08 Mar 2022 16:45:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4770.eurprd04.prod.outlook.com (2603:10a6:208:cd::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.25; Tue, 8 Mar
 2022 15:45:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 15:45:36 +0000
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
X-Inumbo-ID: cdaf3d7c-9ef6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646754339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03narhm58yymq5xYHn/zV15iRGoSxQQeNHULGpanEoo=;
	b=OTbz5S/vgXbRKlJSMfolEbYEUMSz5xWYSQSseRdcR10UBzjxXVa5INvC6PslMn4FbBYaoG
	8gt3Ui8ULwvyEpQSqCGudH8OeRYL46ExG0LrCyaxtV4jQJhNE6gB2TSDXvzp1FccMft1aR
	0zJdvivHVmVGxlIdlCTzwBduL9YKu2w=
X-MC-Unique: dhf2GIfpPJSroUqeHyqXpA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELK4yED9EHgYea/ha8/+RjbGQD0phm3TnJB1rL/eVajachx6C69ZkhfPmcHm/sOiP0gXGk0s90/XHECz9bJaCc4ekQQatkBTqkMhJ9rfM4fcKsKQ0cuRgjjihXuiwJY2s1GCMLLoWWGxub9f94pn06gyyIbT4oBR/bz0KDiCQrhDOxo4Okc4BXuJ4p0aHyczHPY9X8d+Z1UDptkLbWqZXaqmi91tjq0nBzjlPq9PwvBnPlday+BrDNZ4nWj6kq4Unku/m3lyVOVksJB705Or3SrBQ0OKsOMGUCj4QW/IR+ZQ6s0gyWsnPJitCaxZajxYir2O0KOv/HTAwKBtWFeOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03narhm58yymq5xYHn/zV15iRGoSxQQeNHULGpanEoo=;
 b=UH0fEfq0jlr4tE3l694Tr4xWPjCwsIQH/IRXKsUNq0wmhtgXOWoXUhBU+gmKdiy/QxdiACYI5EY6+r7BCHFEm1SKQVpo7FsYwlAzy+uFPdeLZXVL834FEdASMMlPUQ8WrM/zqVp5eMUaFcouXD2lsFrtjsGd0+KzTKxG/5oy9kKlqygYu3nInWA7IlcBdLwwlw1Ul2DDIdKZtjth/O82oycBM1L5yhai+vhIrNhG4vsAvBjdyJ59NAj+Ibn6B55+Q75is0BAodBJ7zgIwbAMhSoLh45v2memZMlNSdPYwJ8g6ww1hhscg1IGOiGP7tlW60dYfXvrtgx5IBucYg/d4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c625d90c-ec0b-a2c3-cf93-08c99cc2f3ce@suse.com>
Date: Tue, 8 Mar 2022 16:45:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v1] arch/x86: Livepatch: fix overflow check when
 computing ELF relocations
Content-Language: en-US
To: Bjoern Doebel <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <b74a68b038c31df4bb94a5b5e87453f5a249cfe2.1646753657.git.doebel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b74a68b038c31df4bb94a5b5e87453f5a249cfe2.1646753657.git.doebel@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0325.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b15a256-e615-48b5-0c68-08da011ab03b
X-MS-TrafficTypeDiagnostic: AM0PR04MB4770:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB477043BB2BF6AEB2E3AFBD58B3099@AM0PR04MB4770.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ANXXE6obnG5TArXj7ato+TR+Wk80RKHi9ZRmc8BpZv6ugBaMwUZjelYX4bDgJ+0ShTHYqM8gmwPXJGioZedRmMfON+fjkY1Ehw78dcqPbVcuC8prWiMUHkPHMEuey8B5AYniroMOGwDYqVVsyGpp3PBLY6Oo8t9QG/HwwCTs6djGf+EaJbWPJU01USYyA+0JGGSELpPTAeh4bELtzDLvOq/7XxDQAbjdMKK2mbwgjNSSaA5yAPVA/cciMe17ClNe7xPR+M+r/uOBpc9+08yDp/WwX1DWUQ5TAdtAK932nw0GbYrEq8ZGvhYFx/syjwKQZXp6hA4DrXDPf3i7+p9pmtWodY3gr93mHVV0atjVRp9hHuvx7wVqgas3n2RWHTLYROQP8ecK96TUSf2QrdwmhtdX7DuxxClZtkIsOscb1ytOvcJXVQzh5fMxrRL2aQu6Nk2FXGIT9GMiJSjKYVeYzxtVpOsfdTeLWBd6v/zn9nXYC08GG512kvooQy4nKHzpCJAFK4y4MD2FxJxL2yuWSbz28KojBBH2WSuDM//PR+p4zDKP0zi9eEcKsAdM26poLyhSmS9RtlUccOlu2tU4r0cVxgTl6EYf71GUFJQ5iJY+8e15E3/jmWHsWN78PoFu7OHVLqtbijZqMsUWqgpsz90kxOIm+/hHPgAWeDgjyjC+mCX9SH4Ei7alsE6nzw6ocAY8DN0PYY8OeeK8iEbRFEMEfzcNqAixNxFy1b2rFq8vGjqlwddP3LcXiQ2l7rN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6486002)(31686004)(6512007)(6506007)(36756003)(53546011)(83380400001)(5660300002)(508600001)(31696002)(54906003)(26005)(8936002)(6916009)(186003)(86362001)(2906002)(38100700002)(8676002)(4744005)(66556008)(66476007)(66946007)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d05DRWJ1TXJKOXU0ZXExeG1mVnlsUFJ4dEFienRQYVJSZ1ZVKzB1RHdLdzZK?=
 =?utf-8?B?YlR5V3Q5MW9uejNBTkd5Tmp1NFVJSTFPRFFSM3YxME1uWURCdTdyTElRTkpI?=
 =?utf-8?B?RFRkelVTbXJDS1huNldWdktWWWRaOEI4anhhWE1TQS9OTVRkM2MwOEwxakVT?=
 =?utf-8?B?L21hUzFVL2w0ZVZjaGowTlVEV1Z0T1c5eGpRZ1ZXNDgyTHQydC9raXVYVm1O?=
 =?utf-8?B?cE81UnpqSFlXdWRRd2JVZklWemttdTlWREJ3QnQzVmh0eHFzMkl6M0JOWU5y?=
 =?utf-8?B?R3JGUEF4SDZhWjlSZU93OUlYai9ZSWlLMzUwMFVNS3NpL3hlWlpUNThRT2R4?=
 =?utf-8?B?WGpQRmppclF4RDFUdjYvT0dQWURWVVZCdUl0eklIZzB4YnFJaUszd3pwTlR6?=
 =?utf-8?B?MTd1TWwxU3dML09FZ2M4bUlaeWY5THpmYU9rbGEzcENpRTFGMlVGQjZCTzIz?=
 =?utf-8?B?bXoxNXJiOW5mS0JyUGoydEpwQjVpbStDR21zRGd4WThEemYzNU9SdGxlUnN0?=
 =?utf-8?B?Ti90T1NwaE53NVEySlVidWErdGErenAxMk1YcE4xZnBSMk1rRThjaHAzSXhK?=
 =?utf-8?B?ckpzNUlLNHhwWGNvQTlvU1R6d1pNMkhmVHJuZkhlbjRVSWw5Y21JbEtQUzcx?=
 =?utf-8?B?M0YzbW1rbGI5V3ZCTnBPeUdqTm0vbUpHU3BCYmw3ckZEQkdRRWlwbEhrOVYr?=
 =?utf-8?B?Nm9HSVJqZlJNdENGamRCcjZybFcyZ3l0ODArRzVlc1d0RXlEZ3Nvd3JDdTBv?=
 =?utf-8?B?cGZBOTk0N0gxNVIrdDhadXhPckliT3lSR01pTXFhZ0ZpSHhSOVB0Zi80OWFG?=
 =?utf-8?B?Z3FDSi9WSHh3S3ROT2RpVnlMUnNpT3hhTFliMkpQdy9mUHQyTktreUFDUzNJ?=
 =?utf-8?B?dmhkWllIVEwwU1NRWEdwMkRZQjcwVHpzeEhSTUJXZTJLdGIzbmliajZ2Vk9r?=
 =?utf-8?B?NHdtMTZSSU1kSFpKR0xuVzdZdlQ0dFN6eDZXTmNSTmdQS1JQMnRFRXR1bXJi?=
 =?utf-8?B?K3h1MnhPVjBTSzB1ODZqd25XR2QraVBBNE9ORStmYjhKVHREVGpWU0ZkeEpU?=
 =?utf-8?B?RFR1TkpzU3IyLzNlcHJsV3FqQnUzVFdGeTdzTWhuNkdQZEMzMzZMZ2xmSERW?=
 =?utf-8?B?MG9aVHRtZUZURXphako2NzJReXRveU9DaVQvMWtMcE9TOWVCbm9JYVM4bVMx?=
 =?utf-8?B?YXc4aVBZY01hVjZFRW13cG1ETTFKRTZ1MEJ4dnpKZWZINGovYTQxa3NCSjh6?=
 =?utf-8?B?Yk9ETlBqaFJOYVJUb21yaHZTUEh6SHNmU2dWZ1dsMHRzTjhkcUVIRlJ4dUg4?=
 =?utf-8?B?dFg5RlBVTkNNaGxva3g3L2d3NlpoN0xUMkF4TFU1QmJEVU5xdEFiYVQrVjl5?=
 =?utf-8?B?N0ZDeXR3VmVCZm5hMzdtWW1YZEZVdXJEWUxQWHIzZDNKNERWSjBDTS9GdDRB?=
 =?utf-8?B?bjI4bExmNFA5S3gvTmh2OTh2SE82ZGZQM1plQmJXNU1ISUhSUGdvVExqQWlN?=
 =?utf-8?B?cEJINk9kVmluZkVINTFnSEF0aldERmdZcUEzRjBpRFJWVU1EWFh4NUhCalNU?=
 =?utf-8?B?U2xXeHN5UlFZeGZzOG5jOHNaaWJCWEZFOUJUejgvTTNxSjRQUGtBaDNaTy9j?=
 =?utf-8?B?VWMxQ1dacUxJdndiNXdmdEl4ZmlKWUxndE9lOFl3SkZHMW9wQ2FVbjhhSHN1?=
 =?utf-8?B?RGk0RDNkMWxmaE5LRnJHcEdFMVpTbGZHUDIzZnhlTWpVQlhlMnczZkxMZ3ZU?=
 =?utf-8?B?UldxRGRnNmZleW1peDZOTE16dmJ4akM0RlA3MjVtckNRNHY5R05pb3p5eUJW?=
 =?utf-8?B?NTV1VDFLdlFITFRUTDh4TFB0c3lXWU9oM2dnLzJwRThSb21ad1U4Y1BCcHk4?=
 =?utf-8?B?aXpURjNheEowUXZlNFNMWGsxbkwwVHJLL0NNajhsRHcyUHRBd25Gam1YZEt3?=
 =?utf-8?B?dUFNOUNjbzBZMHliQzIvYVA5dmtRUk0rbFRGUWs3aW1zM3ZMdWlweDRLQm1v?=
 =?utf-8?B?a2x4dTF6TVNHN2lIUm1LZ1FNcEpJNURpdXpJVVgwSllVYjh3WURNSVgvV3di?=
 =?utf-8?B?Wnl0L2VPWDVzSEM4UVpqU3RRVVpjd2pCUjlxL1lkQmkvRnd6WnpHdUJUejAv?=
 =?utf-8?B?akJUYzh3NEtacFd0dnlwMDM4S3pBeUcxVFlxZmFtaExUWGppNXVGQXF6dTZh?=
 =?utf-8?Q?YGXgiIyXx02kV7xZmPgPAWs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b15a256-e615-48b5-0c68-08da011ab03b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:45:36.4721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdDJjZgQhytZJnXSr5gj0aQg8HkwdXgbieTLRUL/s+qWIWG3QsY/ny/FqB532UGJ/eYnoOTFHQPHbWMikm+BCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4770

On 08.03.2022 16:36, Bjoern Doebel wrote:
> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -339,7 +339,7 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
>  
>              val -= (uint64_t)dest;
>              *(int32_t *)dest = val;

Afaict after this assignment ...

> -            if ( (int64_t)val != *(int32_t *)dest )
> +            if ( (int32_t)val != *(int32_t *)dest )

... this condition can never be false. The cast really wants to be
to int64_t, and the overflow you saw being reported is quite likely
for a different reason. But from the sole message you did quote
it's not really possible to figure what else is wrong.

Jan



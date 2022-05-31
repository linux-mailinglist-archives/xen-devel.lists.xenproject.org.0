Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E586E538D2A
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339299.564136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxYm-0004s0-AT; Tue, 31 May 2022 08:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339299.564136; Tue, 31 May 2022 08:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxYm-0004pK-6w; Tue, 31 May 2022 08:49:04 +0000
Received: by outflank-mailman (input) for mailman id 339299;
 Tue, 31 May 2022 08:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxYk-0004pE-RI
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:49:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84bc0136-e0be-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 10:49:01 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-eW0TRB5XNcmtU0wCinHNZg-1; Tue, 31 May 2022 10:48:58 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4767.eurprd04.prod.outlook.com (2603:10a6:803:5e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Tue, 31 May
 2022 08:48:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:48:56 +0000
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
X-Inumbo-ID: 84bc0136-e0be-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653986941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yB5KMgF/thjv6/fbxCHH/G63rFuKteY0TBslkJ4aQT8=;
	b=P2pe00P9SW4U0R8y5OOsroth5XcGXZsd1tBO6+hyLOaPRZXvRHL/owIuVSsSgaLI78B0Mo
	NCD8VhYf8G+ebhsA4nz268MqBvgV7QoHHBVXTGLAct3SvaLDrk93EzRCkRt15VeHYugukk
	laTx3tPC+FqZioFlkJioWQbuKpqUsaA=
X-MC-Unique: eW0TRB5XNcmtU0wCinHNZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akrHeXIw3ELb4RU0QTfaXOvS2rkbMOiXketzfsmCgYqNXDt8x2HNTNx9r0IqPxxwYKg9AmZoD4Xi8UYQ5cjItycooPuSUIxEaPRfR+INiFrYrxBR3nOu+xOiAqfki13TpbXPknpbD86Vhzo0sx1WSL0ZacYHIiSFWnpPV2jQX5dSah7jqLrrHxuEUJ29iMPLIs3Pw131Ji8I/tWR4ASBjwu9sVG8JJ+huDp2I4zI45ruUBUemx9OLWNmphAO+uXenKC/zMWxAOU2NlUs4h1MjnMdwVLk66OJVNZzAl5K8Gs233fAvUZJcjwcomN7oT25iOw2FI0EGKt/C2z2c/WnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yB5KMgF/thjv6/fbxCHH/G63rFuKteY0TBslkJ4aQT8=;
 b=ait56F43DyG8SzuVl8lRzQwud3cAJUuQ9bURLOKBdnOhorI7ina4hbY29HaRFZ7jF71K/zzEZkDr6swe3v5XWpJA4TQLpAUFO9OAbDi7kCfyG4oSEcsC+NarvNizrqNaV5bNdxv1OmO9yBYCBjZzzgKa0ldAHL8uqrnkiH7xYJ5gNCWjHg6kHGP9sJw5QXoFAYQtrtS47Y5GI+xtk6bqpskuhz2tbH9zAZvOfffoYFBmKnnqq12f+ZszbBhGTl9uwDSaaYqlgRfb1dDBKw/XGOP+siY5499f0r9CFtQl3pfjNfUaLJ1oFpIu7Ad6sUCGGV9ugJUjcR4C+ONOJUfZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f8b6b07-fe70-5468-90b1-ae5da1495200@suse.com>
Date: Tue, 31 May 2022 10:48:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 8/9] xen: introduce prepare_staticmem_pages
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-9-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531031241.90374-9-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0016.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b692c38-f13d-4450-a0c8-08da42e265e0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4767:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4767E257051D7794E9F5D161B3DC9@VI1PR04MB4767.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+PA0EECeJXKCUPEzD7EDuchfHyYPOLGg/7YeJ7mmhFbPMTlSyoB6aaPwS4852tpDB/HjABECZQ95+lNUmOkHetUKDXPPLmRJ9+jC9k+3lQCrZWGEyLpRdgg9k8H0c1mDExIl8N6vQaLyy1EQ+7qc628iDrBuLy6FOfUfKIoY1rllWfIclA3Ol3grIeUi2kb+UsmIb4zBjEao5GqC5f9G3d1HY4i8TwFTCvwPUAThNH/Js6vn20ZRZiGY5lIjloaIEOCJW9x1FxDoc6yMz6XuooSVL0w5pBGctyIJEZVoVpsL9tMmp7OEbsz2B98To5CpAc/C8SL9d74z1+2LaDEp6VpN31m9ZioXmODSgCBPCWtNwta7kqqnw8RJqSoUWj50F1AgPR8Gra0B8QUTDLDZvYFrYJRBzjuRVS2RJZ1hyNlopx+ISoPCZt+Axuw9enE+WhGQl6bB6bC/pdl2JzxVf7WD3czClojtHXZnVYqRvc26JCuAwgsVJSK4zGsQW5zy3JogKUxl97WWe8Faszlf1SxtvbEXqj8H03UzVzHbQKXuVafo6e8uC3+8W0KnsaDguOHQrXpPlvm9qyNiWcOjDUAnuhRVnEgK1dDzH8cTKTmrR2k3iXqzBIwsPAeL17fkCJma7vXNEupoAc8UvApZbiRHr3ujmmSQln0I4CUN5xiEHA3Hf2mr2ZH11NI1x4sEB7PECutap67chd7qgrhj+kAA+F88NgS+wgfPBXv8inwVWMs32rk/xzURPk4dzti/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(186003)(66556008)(66476007)(2616005)(54906003)(36756003)(4326008)(8676002)(6486002)(6512007)(53546011)(6916009)(26005)(316002)(2906002)(508600001)(5660300002)(6506007)(8936002)(4744005)(86362001)(31686004)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXloaEhEZ1Vrc2l5bUI0VzZHM1lLYTEydGZQalk2aU5RcUgwazZSRjR1bFBz?=
 =?utf-8?B?bWc1aGVjZGFLcWNRMU5FRjdIaGVGVE9TMW1NN08wSm1KTEp6S1p6aE0xcXpo?=
 =?utf-8?B?QS9Hc2tpZUh6NUI3enBka3V4bHZrQ01yQURJRkRpNXRrNHNxVVpyZTI3QkRy?=
 =?utf-8?B?UlFkUmEycGVvOUU0Q1JSVzJpZTNybk1JaDJJaFMyMFNuOXY1dGpBU0lsSXBt?=
 =?utf-8?B?SVhnalJncDFWUnVDL3J1ZlFIY3ltT2c3RE1WTFEzTktqVXYvMWZqN1BlRGRi?=
 =?utf-8?B?MEFqZU9MZkJOa1ZkS3owN1dCVG4yYTNWZ1UrT0ROcC9jSnh1bmk0aWdoY0VH?=
 =?utf-8?B?cGt6Q1ZJVk1VL1dQUlFVZ0tHcXdDeVVPLytFMnl3L21mSStuUzZ4ZHl4c294?=
 =?utf-8?B?WnEySGl3b1FSRUR2UGhkTWhBRjFaWWc4R25ObTV6a1VMTEFuSS9ZRkkzTzNr?=
 =?utf-8?B?SE1NWk9UMDBlYXlnVjV6cVMwZFpuSDhUdzVsNUpHb0J0eC9oWkk5NnRMbzVP?=
 =?utf-8?B?V1pTSjdFMTU2ZXRtQmJ1bjNmb3NHalZsZjgwUnlaeUQvT3ZleEhYTVQzb2pY?=
 =?utf-8?B?VElXeXltTjdnODIxdEUvVjFuMmF4WDcxS1pNbG4wbkJKa29PY2dZSm9HSFNq?=
 =?utf-8?B?U0JaWTg1Ykw1akFnUkU4ZitxckNvM1VUeGpZR20vbTJDbG9qekZ4cGc5TWFL?=
 =?utf-8?B?djF1a25SQVpHaDM3WnJVSjc4MDg4MUJhMGVaNVNDekFvczdHNTRaUWlTN2lC?=
 =?utf-8?B?aVpOSStWMkZmVmR1YmREaGZyZmNPckJkTldmcCtjeDZGOXhDZHM2OG1McHk5?=
 =?utf-8?B?eitYWThoRDI2cS9RL3BGbEc5ekJ6UG5MNHV1RmhYakdJSXZlc3hscERTK014?=
 =?utf-8?B?bVZ2dHYvNUhTdTR3MmxzbDU4UWVuNk51WFM4czNTZkdxTkJxNHl2b2E3aDFr?=
 =?utf-8?B?VWpWdVRhZjcvQVZUeDIwUTFxWFh3RnVjMUdac1gxVXQwcGc2NmRHZFRMRWxj?=
 =?utf-8?B?dy9sTnZ2VmNJeHA1M1Z6L2pLY0VpeTBVaElaS0RGYTBpSVNaN2R6eHcxNDAz?=
 =?utf-8?B?dkNYQXJQdUFLV1Fzb3lrSUQ5eFRlNGpHOUNpaGlJT2gwNUtROVVib1NFNHZE?=
 =?utf-8?B?NjB5WmU3Tmw4YytOOVZQSS9XcjNWcTBxUUJua1NOK2ZvM09HSml5elN3SFV0?=
 =?utf-8?B?TzhGYUl3SFB1cDBMUk5PNGdsVDhRNkJKdzIwSmo4UE5LRVg1YUVSYzNYUGxF?=
 =?utf-8?B?cXgvQk9VRTJFVGM5T2p3S1hOS3phRVNYT29zMFRxUFh0RDdjVmFiNDkrK0lh?=
 =?utf-8?B?TUZoOHlHdXdHV1VpYWR3Z2hCTUpKYnpoNUNLc0hMTmwwNGYxOVAyMEtsZU1r?=
 =?utf-8?B?WXJHeDZRK1d3cmtUY2YyeVVrQjdyVi9CeHZkTTNIdzluTVlJYk9STjFDZ0NN?=
 =?utf-8?B?Z28yMUJna2p1S2NGTE9FMFZ1N0svRE1xcFJXMFZNNmo2ZGk0MUljWjN1Uldq?=
 =?utf-8?B?Ymxyd1dqdDRUVFoyNUErNWpUU3FCRGxBUFpqVkZNbzczVjNtU1lIbTRaM0hK?=
 =?utf-8?B?YjVpeEpiZXRVS21qU3l4MUtXc1Z2NEJNMTFLdUoxV0ZiS1BuTk55YUNOSHJx?=
 =?utf-8?B?eVFSd1F1ZjBKQ3YxMEtkTGhXdEtZTG1BLzJxL2E0dTE0S0MzUkExQ0tmZTVH?=
 =?utf-8?B?VE9GNkxrN3pEVEduL0E0dFdKdW9XWEx3bm1RV1I5OFRGQVVHZXd5UTlEMitM?=
 =?utf-8?B?UGIxRlhFcUwwd2s0a3B2ME9nZ2lHS2VJTVV1TWlpbkpnUldqNHFWSG0zSDVl?=
 =?utf-8?B?cGVrdWE5eTlWbnpmaGdOUmlzeVc3S1FFOHRTMWltMmhxd2xFYU5LUWNZeWJI?=
 =?utf-8?B?V0dqckJvMUFhTkZrSFV3dUYzU0ZCS2RQZU9JOXkxWFZLL3lQZlo3R29YMzFm?=
 =?utf-8?B?bWZpOU5NSmFIa29nTlYzRkpWbEw3U0tmSUhBZlNVWjZHZ0MyZG9NbTRuTmJP?=
 =?utf-8?B?T0Qvc29TY2xFNlpwbmhvVnFTUXhJbTZVdXo3TzZzcXppeGdSUWQxWVM3WVBI?=
 =?utf-8?B?d2ZXVUErREQ1dHd2SEFVeGZSUUxQWVh1ckpnZmV6WkR1aTYrM2piSlM3MjBM?=
 =?utf-8?B?SndyVy82cm4yM3A1a1dxM1NNam1zMElPeWRQeC9WcHNlTHo2MndHMi9ucVY2?=
 =?utf-8?B?NFdqT0tYeTlsMklMTDAwelJzTkdEOEZKNE8wcTBoaFJvNUdaall6ajYxVFds?=
 =?utf-8?B?TXRRVVdIeE9JS1UwZVozbE5xRFJqTVpTaHhRMTdpbXlFUmptRHFJNTVkM09i?=
 =?utf-8?B?UndkMjhaNU9oZVpwY0htWStJWExzangzR3lHWFlzOXp6MURZUEJVdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b692c38-f13d-4450-a0c8-08da42e265e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:48:56.7171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8k7PpLu3wGO1g4VXZAdvqF03B5W/gPQxhfHdBPxDQGlxP+nq35Ymf4q+oq+XsxJthvYrFjwh37qjXfox+AR3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4767

On 31.05.2022 05:12, Penny Zheng wrote:
> Later, we want to use acquire_domstatic_pages() for populating memory
> for static domain on runtime, however, there are a lot of pointless work
> (checking mfn_valid(), scrubbing the free part, cleaning the cache...)
> considering we know the page is valid and belong to the guest.
> 
> This commit splits acquire_staticmem_pages() in two parts, and
> introduces prepare_staticmem_pages to bypass all "pointless work".
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



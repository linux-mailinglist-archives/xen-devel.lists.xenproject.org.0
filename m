Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627EF464C89
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235935.409253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNiC-0004gB-3i; Wed, 01 Dec 2021 11:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235935.409253; Wed, 01 Dec 2021 11:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNiB-0004cj-Vi; Wed, 01 Dec 2021 11:23:43 +0000
Received: by outflank-mailman (input) for mailman id 235935;
 Wed, 01 Dec 2021 11:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNi9-0004ap-ML
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:23:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22811267-5299-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 12:23:41 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-OKr8UtJ9Ov-iTLLRsZduhg-1; Wed, 01 Dec 2021 12:23:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Wed, 1 Dec
 2021 11:23:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:23:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:20b:488::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 11:23:37 +0000
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
X-Inumbo-ID: 22811267-5299-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638357820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2nhRI7VpQ04wiK8ysKm/PMNnbw1RJy4/s9ua0AMl50=;
	b=D/M3aiop/b4+C2SuLv/j9YtOwT5iGyrV1OXNNnyTf/e42g/uahcBr7aQJX9fA9xhLbIbl3
	sFFm89hPsi1bvqqZzezQxwaMKHMhm2zfOH0Riic58KYkwtCj3lM1R62PT1frOTvRx//G+k
	FMfFofWKiMPEjkUcERSqF43kU4k9EYA=
X-MC-Unique: OKr8UtJ9Ov-iTLLRsZduhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAjxSt3flwwMUzMEnXTmHJ5S1M7VFdjHYdQJxd8QlcuEjtHAUF4p3dlpWr37ODPiF26XYIiomKXAzA3UgKPhSGtO2lcNkP/+HJNK4LxR+7UcspUZw/7H3RJ95D0734CUHFNXNLU6Qh/Blrh+1yKa+ibpZApXGGBtnhHca9gdhK3sJOXgSrWAYNmnncvB6Vl9ajUqKI/pWIWmx8Y5wdp1BhkV0FBHJSlBnKStDoztAe4cJ2AuLioGXQMO8tt9nZmMprSJxPVrDdW235v7kQRAsUhLCxvCVqjcxArwQeWblh7d4xNnuC0CKBrLTj2I0qBPCFwyv2Mqu50+mwF9ArMcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2nhRI7VpQ04wiK8ysKm/PMNnbw1RJy4/s9ua0AMl50=;
 b=e4jEuG8AxeGQtwRgfHhPS7RVXbfnFDzhIiMHawRnhWZc9YyQHbSb0eIFvYqbvYIs63HDc9vZj/TyP7p+UGkjsijJ8qOpuc69e+bUzWGrSB3Z9k87lIoL9tEMCCq3ukMUdry2c1iLN/KY4g/oOXJjGkE9EJoD1bTv5X0GESinCS30xZFUVft9KGRWlNMnx50+4rZy31jlUcstoNkT6vC/bsrcH8plalvOeEuOLvyTEOoG+Vfsib5bqgKB/wwRgUixwwFXb64/J0sabkT4/6DoXeQiSz0ax2X8nlo0wA5oQZdm1CYsnkTLYCDUcqy4Zp2DGEVnkvKw+bxhZ5MeyuSPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55db927d-b3a6-6d0c-00e6-8607cc2c178a@suse.com>
Date: Wed, 1 Dec 2021 12:23:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/2] xsm: Further fixes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211201111555.16408-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211201111555.16408-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0017.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50346310-c1a3-4f49-d62a-08d9b4bd04f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29593142C67F4C582EFA6595B3689@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fqf7u03RY8bxMII+qlvVyULSJKR5OMrpdrGz/W8k/DpUj/Fw5E6+Ol9b2dcKK7QP9JrNBbUzMTNsWMqt8o5Pj9cl2S5JPTGLJURAiHcb7CMXa3fs5+nySCV3rrJ6sUl7bvy37Z3VrLs0fv7HZDN9SMX7JbSaddqvB5hNtu7xsvIJXm9vxdU461P5ANmH3EN5U5Cs6INxSWB64kUBGqSo9udNxB2jQJvLAGg6c7GNV7t52yCBMvqa8+IZiBGCFHjNC68aNBkhPfn4IuEAvPkBna9qoprKWyDaibcUf/i/9Z6vTuwXWZ34heBHATAE/roWpfofJQCfKwU5mEAHbaI3MzAcQvvD5w/LNZlRg0uRPRDohSL/FTi0UU9wnBTnzle1kYUyVemW5uS105FVWCf79k9LF0FtNu7x1T44vXuLvPgHbM4JsRBsJGkd00/rlEnppkBUMdVXb35/lUHOP9PUcl9jlLsH2iadSU7K+heaAUF8ADbYyXRrwhKT6afU+EvtVs2QQP6tpeIBwmYtSaGIWuTq/v+O69cDYmCzuut3G0hyDpb4f2/z7fj1X70JB54kyCFXcO6GFglRc0gfdApzAhDkRsPN3ekJ9Kg5zMAXR2N4/Nkr5yxMRBgsLwvIkIwP5wsHt4FF3YeDzhYXbMvSiUPEKsfd8pB/yznVfLhNCMXtRo9c/OKlWzo20tJFdQLSDewkgb3jF3/SF9dHyhAp5mI6AKj6mbuV1fS5UlZzA7I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4326008)(54906003)(508600001)(86362001)(8676002)(8936002)(558084003)(316002)(16576012)(36756003)(6486002)(53546011)(2906002)(6916009)(5660300002)(31696002)(26005)(186003)(31686004)(956004)(2616005)(66946007)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qzgvb1Vyenl1VmdxcHJJRTdadVNieXEvSjEwUStoM0s3RVJLSE1tNzNmNFJ6?=
 =?utf-8?B?TUxzeFh4S0cyQndQZ2pjNVdiQjFIeGdoaGdLVjZXbGIyU3d0M2Q5aWljQ09P?=
 =?utf-8?B?VWJQTFV2cjFNSzJ3NTN2TGVqQkY0dDYvREFjYmsxNEFHUU8rc3JLRmFvZlh5?=
 =?utf-8?B?WlZ5b0RzcnRocjlqc2xFREIvaUtFL3dQUnk0NXFtQkhyanM5cWpFTmc0aTNs?=
 =?utf-8?B?eTJ2cVpEcmJXTnFRU0Y0MTY3TDBnL3ZpTkxEdGhUdEJOU2NXbWp1Qnprcnla?=
 =?utf-8?B?dFpzNTNkSStTaFl6eHBWNjVnYndJYzJZMW5QbDVjYTRCOGJNUjFGS1E3RTRN?=
 =?utf-8?B?cmpDTDczWkhJYXpQcEhlS25VWDlJYW1TRXlmZHdkZDh4RGJIcnYvdy9aZGFS?=
 =?utf-8?B?S3lCc291MUg2K2I2WEQ0QlI4RWtDWHhLcDUydDFMM3E1dno1a1A5OVNoN29M?=
 =?utf-8?B?SWpVWTZDa3NHa0JDYk1UYXlVQ0lUVTF0TW5vUXlKTWFJbkhJQ0tkd1RjREZQ?=
 =?utf-8?B?NEZEZFJMVko2dmFncE9KRmQvSFZCbDI4QlM3RTh6Y2lHWUw4NHNxK3pqZ3NY?=
 =?utf-8?B?THY2YnF1dC8rU0V0TDZzdWQ0NGxYL3UyZGNHcEJCWC9BVFh5bmVoNS82K0M4?=
 =?utf-8?B?WWo5U00ra1dYdENWUnRVWU5tZFlRbEtleWM5dk13d010M0JlNUZvK1VEdlJs?=
 =?utf-8?B?d1dKdjkvVFVrSnpXWkNjeXhrbDJSTWRLK2lBVUNreDlqRjYweDNUUWc3bWNU?=
 =?utf-8?B?OE9WZnlpR0dEOCsyMXhQNEFIeWczVmZ0SHMrUDdFNkc4UTRlQy9HSDZCOVgx?=
 =?utf-8?B?SjIwZTYySWZQMHBwRzBoajNOeWVJaWpXYkg0WXpRNWc0bWlKTGhxZHZBcHRD?=
 =?utf-8?B?WHhlOW84Wkc4R2dvQnhHLy9CU1d2L21taGY2ZUFPYm5MdDEwMFhqckF2cGJ0?=
 =?utf-8?B?Q0UvUDhDUmlzQzltZUxUVUlwNUhSb3FhZW5xR1k3VDNBUzBITkJvTXlxMzd1?=
 =?utf-8?B?MWpvS3lkRVU3Zkt2MHlIUlk2UEVLNjhRam5sbHpYWXl3VmxZc3ZQendCVFM4?=
 =?utf-8?B?TGErL2tQNGpuemdWalpUVm9KUzVHdi9zQ2RQOVFPMlk2UjR0OFMrRElqVHV1?=
 =?utf-8?B?ckNCVGZqek0valdDUGdrSTFib01PZ1FyVXZZalc5VFk2UENwMmpzMXNFNkkr?=
 =?utf-8?B?SHpNRDdHaFVoVDByZ3FXdUFHb2xjOUc2dnNSNTgvdVExanhBTjduZjFxUG1w?=
 =?utf-8?B?L2Zwd250WVAzT3N4VzhlZ1cwVmZvbkVlNGlweUFtU2ZON0hQaFpPYmEyaXVZ?=
 =?utf-8?B?MVBUNjV0VnBjVlM3ZEdldWxEeW1DbzRZZTZZLzdQOUJtanc1blptLzg1SFMz?=
 =?utf-8?B?QU84c2FxV1BNaHozL2kva1BLRkpKa1dNQjlxemZRS2w3TGlLYWhtTFBTTWtI?=
 =?utf-8?B?bnROYkJvb3lBTElLNnVhNGV6RDNaVW1nL3ppTXUzYnNwb1FMdTlmWXozUVpV?=
 =?utf-8?B?SHVsNTFJNGlQUjJVRnFYdlMyNE9sbUplVyt3b2tGa2lGaDlQSUdaNG1HZ1Jx?=
 =?utf-8?B?MkFzazM5RHFCTFVqaVhzSXo5dndQZnpPOHdDQ01mNW9mdis4RHJ1ZkpoR2tu?=
 =?utf-8?B?VUQ0TjE1ejEzeWJ6cmpuejdqZzkyL1dFdDV1cktERWdFbC9wT2ZlRHhPejlO?=
 =?utf-8?B?a0RlVkt2S3M5SkkxN3pNc1VhNUI3QlZiS054ZzJsVVQybW8yUnU1NVkxRThY?=
 =?utf-8?B?Q0lMVjlBRXZoVEFpQUVGMmI5LzBKNmt3WnhJQlBEaDFXMzZtdXROa0FTWncv?=
 =?utf-8?B?QmUxM2M1WmVNREJnSUNxbU9WUWRmSUJjNU1Nd1dSanNxRUhjUXZTTWVsODZt?=
 =?utf-8?B?N2d3N3BabjVDdVVGM09qRzZLS2g3UFdtY0doa1IrcWdOSlhJMzEyZ3NXMlpK?=
 =?utf-8?B?QVF5MC9kemRlUzNiRkVCeXpaYWNDdE9iMHFtTlA2VXRNdU03WUdxUXhmSFdt?=
 =?utf-8?B?K3YvMzgvdy9kWFJNU3hsc1E4Y3JXR0VVbnFiWENUVHFoOWNieGxWa280RXEy?=
 =?utf-8?B?YmROQ1p5aUw5WEtVODdCT0dRelRUbFZyUjc3Tnc0WHZGdGo4am5DSUNQSzZG?=
 =?utf-8?B?eDZNY0hTQ1hJWlNNSnVmdEwwaFFiSktGUUN3QjkyK3VYM01zNU5xeE5xTjZ4?=
 =?utf-8?Q?8L/YKL1zaJBoN0GEmmnjYHk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50346310-c1a3-4f49-d62a-08d9b4bd04f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:23:37.5881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Gygs1C2jZ8WdBBsY3KauvCMJ98xgNOvtRKLt3FEkVjwN+DSVNkCxxa+QVZ5TmnbIyNTd7/hSA9PAMOoQ2f9kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 01.12.2021 12:15, Andrew Cooper wrote:
> Andrew Cooper (2):
>   xsm: Switch xsm_ops to __alt_call_maybe_initdata
>   xsm: Drop extern of non-existent variable

Reviewed-by: Jan Beulich <jbeulich@suse.com>



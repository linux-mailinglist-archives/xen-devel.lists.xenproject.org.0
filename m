Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B6416E4F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 10:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195031.347491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTgzw-0002Xz-2f; Fri, 24 Sep 2021 08:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195031.347491; Fri, 24 Sep 2021 08:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTgzv-0002V2-VP; Fri, 24 Sep 2021 08:55:59 +0000
Received: by outflank-mailman (input) for mailman id 195031;
 Fri, 24 Sep 2021 08:55:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTgzu-0002Uw-FA
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 08:55:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3abc449a-1d15-11ec-bab0-12813bfff9fa;
 Fri, 24 Sep 2021 08:55:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-6bHg7BIhPGSQ0mNpn5SSDg-1; Fri, 24 Sep 2021 10:55:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 08:55:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 08:55:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0051.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 08:55:52 +0000
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
X-Inumbo-ID: 3abc449a-1d15-11ec-bab0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632473755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oVQQTPXxci+0Cg1D5M+tpUegLfCxCcaSTPoNvSXUPpw=;
	b=l7m4Z9XuYF914ttfRiI2uHMTMD2h++KGldNt+sjfhyvDOk9XGfSaTJmr/QZ31Ndy3AnIIh
	15zf7l9HjojSbqeg3mbP9coOuP8zklxRG5hlOnIz6Y2pr4ad6SrunCwIBcngQc23PqoUM0
	KP73v9uLgyR97rgdATUv0IBeMTsyeeo=
X-MC-Unique: 6bHg7BIhPGSQ0mNpn5SSDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVc/JlSz+BOOldySCKMvYXOOHFIx9j3tzq1cK/rJf8110VMtJGb9+KF7ho5PC8/lSa3pDKKCKDqFTxxx8hdw4vuQHsX+83bL8+kB+y96UmC8mPKGJqqkEpb7xnSL2GfiPy5CPYktRByJ6ODy8k4XqUH2Aga3bab4hr/O3Q2ArUf4ZWlZmMvydIwCFd5XDpyTzs3Z8OmSfccHQcnBtVR8AHffUyKqru0sJG24SrMS7hBa7WOLmMvY58jDwj59WlbpcM9AW3LwdmDmFiI2aH24cLQ4igJS7HKjZl6JnPs+RqJ1+iHt4U09GoHZqfwDI/toiCfndbkZbxiFtGi3xPXj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oVQQTPXxci+0Cg1D5M+tpUegLfCxCcaSTPoNvSXUPpw=;
 b=ZkkAjew49PnH3QLtRAHKDissVwDe/tGqdAvQqouTVggKMNGN6xVysbq5whiE/DXEp3KSNg3p7E7wKORly7sHBHnPM3yKkQU6Favxv9ikp5VNYM0kskC9TgLpF6547Ufkj2I2cLv1xm3LlNFl5XXbx9xT2g1mCfD3iAk+cNcnItrQlVzZNpt4eynIsv5A17EOaJMlkfTa9dmnhwN2gb1rEVduR9mazlsuW9KeC89W2Ut4JjaXGywrlBGihVvayK/8MSlmao2t918cCXNASWB8CBguFIXyXuFki6xER9yZGdI+n89kqAjJJGU3G6YkVUqS6NwgAQJ5VS7ZHMsLSMZMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 02/37] xen: introduce a Kconfig option to configure NUMA
 nodes number
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9bec4214-5f50-9ea5-0212-52d248b63ca6@suse.com>
Date: Fri, 24 Sep 2021 10:55:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923120236.3692135-3-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bbca9cb-fb5a-402d-cd4e-08d97f391ced
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37732F22C84A90D56253F7E1B3A49@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NhPIuKa9eGml2mDnEdRp0mP/0jV2CsaypgsvjGVts3lgO/3qXPJU8SSpOSdxOMcWkjs7EaStK3FogsuoFa9VtxqxkxPN9KbrHH6yIQYOWuzKwr4HDJZF2r0ykNghSczO425Mlzq0n8ZxEpdgH37HQXZr4YeSINh9lJOYCvC+6UovDOhHR0QtrqZKt1lHKgiLbGe0rErHUaFtjzvX8O1mEiFlGR+PpYh3goO+qY2jE/malmA+hKcg3drlzh8kjwEN+CNep9A+N5O3koV/VmxqLuQQxsD/vF/dgZ2HEkCpRRrZKnIrkSt9poi9J+zM6HmPBQMprUOngDm7G78eZlEHiWyJ7S4oXWHqoPn7cI5ScrodojONg+J/gRdR7QXZNmfXPkZAMOmCPuoJIsYwhiCG7TCyuTjABFNvD1bbLWMJVeEMAGmp8RKRCY0kLeE1qQD5g4FMfZge8gjtN0LAOkRjdlnUC3q6cgjwBZL72TrHZjcNQi2SnryTx/rE5wdwfLEnJFao7ClwbAjwXmNq2dJ040GxpEGl8wnSboBLlURJouiAYLyrrdTJIPpzWH33KW2Hg6GQesgUVtG9mYhlbFzLBv/9+A1aXaXixSX/51GM3zLnstcvZZrnf9pD5R8HmC3t0mxF6tOjQkQP/SvRSod4tfy2I4dltDth9LvUIWvX3WrcVR2u7NAXTjXO0lOr7ZzcHCnhPlYFUpwTFIPD9QnKOgdI9zKZhKa6iyp3QggXGcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(53546011)(2616005)(38100700002)(956004)(26005)(31696002)(86362001)(2906002)(6916009)(5660300002)(36756003)(83380400001)(31686004)(316002)(16576012)(8936002)(66556008)(8676002)(508600001)(66476007)(4326008)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1lTK004L0RkckVRTUd4YVNiSHcwa3dmY0NoQWY1Um94a1hpaTU0SnlFVEw2?=
 =?utf-8?B?WWh6VGw3azBzVXpueWlleXlUK3V1Vi9LL2tkYnR3M1FNdHo1UjRiYk1uRGl3?=
 =?utf-8?B?UzFKVWtTUTZFbEtlK2h6bFdTaEtBbFdjbm1uend4ajFLekN4TFNDajlLM0RB?=
 =?utf-8?B?S2N6T0NFTklJM2ZaS1BUL3o2ekIyb2IxRGFOZXN4MlhnSkpUWStGK1h0M2lK?=
 =?utf-8?B?K0UvdXpPVzBFRGJ0VE5YaURxbVVlckh0NWFkVjdteC9lK0VhbDZlZTc4QjJ6?=
 =?utf-8?B?U1FoYWY4RmM0ek1VUDNCVGdsQmFldHFLRGkzaWVZb2pBOVJuSEVpUTFTbTNV?=
 =?utf-8?B?RFJCbUpzNFZDZ1JQbTVKQ0s1djFEcEJQazhiL2p5ZEplWnNRWGczT1doL2RK?=
 =?utf-8?B?UTJDcW96Rkk0cUFQUHhxcXJSZllBbTRuOTBXY2U0TTYvQjUzRXFPR3kvQ1By?=
 =?utf-8?B?UXlmZ09XM0tIVHo0YUZBc0RtazFlWEgzcDVXTzYvcEVnR2NNTjhEakVFcmlE?=
 =?utf-8?B?R0t5Q296czkrTEhjajRjOUdqTVJEcGxIeFV1VEdWbkFIY1NpOEpjQjJmY0Rt?=
 =?utf-8?B?NlUydmRTa0N5VWtNbWpUZlpGaDRDL093alNGcTAxeXRwNm9BZEZLL0lWZnU3?=
 =?utf-8?B?Z3RaMit1NS9wS2RwTU9JclBXYTl4OW84ZVB2MCthV29Pa1YrY2hpMnUvWVll?=
 =?utf-8?B?SGhyMTJ6bmxxeUt4UE5tRVlUY3dyVVM1U1F4WDJLV0hXd3M2NTJOSmsyU3Nj?=
 =?utf-8?B?MHZiRFh3TmVER1g2WkpvOUpXb25PN2p3UkRIWlprdEhxd01kYXBFMEc2ZmRM?=
 =?utf-8?B?T2VOMEc3VlA4dDc0a3NHelExazkyb0hVUFVPSkFlNmR2UFpEODFkOWh1cWxD?=
 =?utf-8?B?ZEYySU55QVQrclU5eFdEcHNPWFg4dlcyZXR3NE9OckZ1MWU3dlZENjdwQW1k?=
 =?utf-8?B?L2RheDlYY3FvVzZEVElzYUV1dndXVyt3OWdxZnN5U0lHdEU2U29SR2NhWThO?=
 =?utf-8?B?MUpadGlVcHZMT0QyZy9EWS85Y2NOZk8rVnRyL0lnVmFhaVZCT3Q4THROVzJ3?=
 =?utf-8?B?SWN0ZGtqdVM3bDNDV3I2M3I1aGxkNGIvL01ObFFTQVZsWXZBZTFTNlA5akxE?=
 =?utf-8?B?UmtDTDgrMUtsWDNJb1pja2lRV29uak8zUytpTkdLLy9yU3pXb3Q1MTkxalo3?=
 =?utf-8?B?NEZMRHBEZCtYWFR4ck4zR2h4dXo5MVo5Z1FKeFVIeFBjQnlVeGlFNjI4dmRo?=
 =?utf-8?B?Nll1MFpaeVJkSzhrZExSRFYyQmRJNmdmVzZOT09PamwxdG1Fc0IrSnBpQmRz?=
 =?utf-8?B?VTRBck1iVHBwWkgyN2FkUlliQTNMTzZSUjhqeEZqMDQ1d2FKbnZKcG96NVR2?=
 =?utf-8?B?YldvT1ZUWVQ4TXk2ZUJIWGZsWmNTUFNnT21QRVRQZ09SZFRuVFQ4RXZEa05Y?=
 =?utf-8?B?YktpNEN6Mm9EMXM2R0YybSs5Y3dvMVdvQ290N2Z4VU9IUURYM1JYUnZ0dmFm?=
 =?utf-8?B?cTB1UDlmUEtkZ2gzWk12b3JPMDFyNmpXMkRjSHZKbWVlM00vakFFQnlrVzJ0?=
 =?utf-8?B?MmcyMFQ3emR0TGh3RUsyWUFDRkxHMjZRdEhGNEExd0ZHK0RsU0JRRzB6a3RI?=
 =?utf-8?B?bWtWd1hnWEg0SmNwMWFKQSt1SGFNbkZPU21wUDNTa043aHFrS2hNMGtaMkRV?=
 =?utf-8?B?VnA5UlJFT1c2YlRKcytuTjk1Ylc4bGtWZWdGM3FGTGVRNW9jbjZka1oyZ0Va?=
 =?utf-8?Q?SRDDc4zHbd8RbvlTJh/pM2K/tUI0W/PjwX5nTrz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbca9cb-fb5a-402d-cd4e-08d97f391ced
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 08:55:52.6944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAN4tFWXLZ6KIrHkIAOBdl77lRxDY4mDT82ioO3VDSYMIk8B4LJOoqeh8CbND2Jwfx9VHye//RtfpgeNsEbT+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

On 23.09.2021 14:02, Wei Chen wrote:
> Current NUMA nodes number is a hardcode configuration. This
> configuration is difficult for an administrator to change
> unless changing the code.
> 
> So in this patch, we introduce this new Kconfig option for
> administrators to change NUMA nodes number conveniently.
> Also considering that not all architectures support NUMA,
> this Kconfig option only can be visible on NUMA enabled
> architectures. Non-NUMA supported architectures can still
> use 1 as MAX_NUMNODES.

Do you really mean administrators here? To me command line options
are for administrators, but build decisions are usually taken by
build managers of distros.

> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -17,3 +17,14 @@ config NR_CPUS
>  	  For CPU cores which support Simultaneous Multi-Threading or similar
>  	  technologies, this the number of logical threads which Xen will
>  	  support.
> +
> +config NR_NUMA_NODES
> +	int "Maximum number of NUMA nodes supported"
> +	range 1 4095

How was this upper bound established? Seeing 4095 is the limit of the
number of CPUs, do we really expect a CPU per node on such huge
systems? And did you check that whichever involved data types and
structures are actually suitable? I'm thinking e.g. of things like ...

> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -3,8 +3,6 @@
>  
>  #include <xen/cpumask.h>
>  
> -#define NODES_SHIFT 6
> -
>  typedef u8 nodeid_t;

... this.

Jan



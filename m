Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3451A135
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320756.541656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFJC-00081B-3X; Wed, 04 May 2022 13:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320756.541656; Wed, 04 May 2022 13:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFJC-0007z7-0H; Wed, 04 May 2022 13:44:50 +0000
Received: by outflank-mailman (input) for mailman id 320756;
 Wed, 04 May 2022 13:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmFJA-0007z1-As
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:44:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ca18f9c-cbb0-11ec-a406-831a346695d4;
 Wed, 04 May 2022 15:44:47 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2174.outbound.protection.outlook.com [104.47.51.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-1YeZStKJOSC3bckf5qsO2g-1; Wed, 04 May 2022 15:44:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB6235.eurprd04.prod.outlook.com (2603:10a6:10:c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 13:44:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 13:44:41 +0000
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
X-Inumbo-ID: 5ca18f9c-cbb0-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651671886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kk26KPZ3qaX7PUBimH8FV/lVXnDPWBg6rQVr+FCT1Hk=;
	b=nRx1T51zGrf2CTSxzEGW3W2XOGNf/u3Q2rxdmyPlNWWdSMaJVoAL/rmMzC9tXZCo9UM7KU
	MjgjhRlp0Ip7q03FzzK/M2xCQIOpp1JwAI3kS8K98/HhAS+jEv/0ewcmJwzDFFpgANDN2z
	22/zKufmNfNKL2DAn63YmwRYyYZwWs4=
X-MC-Unique: 1YeZStKJOSC3bckf5qsO2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYdJCffISq8lC0mZ6EX6aWQb4tzhbzA91bFnvjI7/uyn07pjiMOXQhU6Mvoh+sZVjwz9kZGNpQAwAy49dUyD/G5x0Re4docbzNI8huoUZzRqvwWfgXGnhfDcOp1EEBFWV+3paQqqmi1n9CHaYd05ijTRWQCyeQJXuNG5NzfvDiXPOT+KaW1/GAuX1/6MgietSf0gROtNClyEPZgyYjXMxvIqIfqocmStYthjS8mamjr7FRBzulDPAdPic+/CAo4c+zLfWTjCn/V2xVixzliwMB+3/PQ+Y+b5RT225tBxjG9eclKD9pViw3RwGBmdwPSZUaznNbR04AfinXDpRLmGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kk26KPZ3qaX7PUBimH8FV/lVXnDPWBg6rQVr+FCT1Hk=;
 b=cq+e6kvvRWlNqXZSgB7+JTdSVhwSH0gJLCnGkMc0kqp29iTbFHSMg2+9+Rso6PGgeHUwzvrHVPi4Jddf2+rSNt/kYoXQZPxX3+/dFzgr8IdFd5604XPcGU4wpyvVzkmlxc99rSczH6iRe8590/CBuJcHL5Fy0sF3I4TS+NrcRjJiOQ2aIIUGszqR9EXP3OmMDKxCjlIGYYrZJWKdB+IRFD9WtbC8gTk/JybA+v3PrHuXAG75IySniJxaOvEDEiZxhogGaCfw4KA6Gar2xCGd4e74jPYPpXoWpQjVa1dcOtxEzLqyGfJzoCR+sl6AEaJzwzsdeTjWfWzx+ym/LccBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
Date: Wed, 4 May 2022 15:44:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427092743.925563-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0051.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b92b6687-af6c-447f-4845-08da2dd43db1
X-MS-TrafficTypeDiagnostic: DBBPR04MB6235:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB62354C5CC48DE13B87D6E5CDB3C39@DBBPR04MB6235.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qvfIEHOYd4cYGg/1oyvw7Xt5jS8S2iQ1caGDxlbgT+MqUtlcdjH/zwp8A0XBWB2eluBwslPWmlZ7ysEuJ2XhmHRfQutlOhyKsWUZnqx0c9yuk38wKX8BVVEx1wiNTUTiyGN6Y4RXv/kuhRB9IFk9kDdSlpb+cTuorRRBv3sHv/vwrQbLf3KP+k5jH/ZooFuvR9UNAZwOBUdlcLmpNBzmxV9fdMOENlqv5LyC7hYxMTMgQBaOywpcngv3ZQPTbvk+RcJWtmipM3j5GciCxuISQwLQc6vYqlG/YFC/PK4YlwHkBzMNwgQsGrrgLg4T8fxkrDdquvy4PzP1UOlQYKUWu9ygqoCKn8Z0h2B5BawnwvUFndC3HWu4MOgAKEyCd5F7Zp9ieDSu4b/PFapmePRU4K/rN5Btj1lFIJQegGZTtOhnaNrxPm9htpkg3ZM1tYyOfQQPU7fobNcmBGRRrLHSuoglEMoKoWzyQ6Y9SOMy2mlxtwwHMBYqha6DxTlnF+ub8tNGBn37T0gcwYtLK/1P9HacReCmtcfMm6vWRrgWDg9yZITXh8xPZx8K6tQ1WogCftAth7iYJIVs82bAEtt1HdxukWC6g5UmH4PDAt6wHIK3NhZUCSeGyg6pHMXG4XK1/ibaOzCZ1Ryt1yhr+LUrqUjrnfbq/FcfUEifrBQS/AODmnANWH57lNDiRdJXbbsSYQFigDVerO+kVpRZqjIyWwRNjDErvaTy756FbXbTYL2kZVHXDHrfGVXlAl/+czKW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(83380400001)(53546011)(6506007)(26005)(6512007)(31696002)(316002)(5660300002)(86362001)(186003)(2616005)(8936002)(36756003)(4326008)(8676002)(6916009)(54906003)(66556008)(508600001)(66476007)(66946007)(2906002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDlYeUNNSGx6UmxXdWtGMkh0U1piSkl1dDBqaUdKU0Y2VjBaVzRYWkltZEFI?=
 =?utf-8?B?T2lwQ0pQUERCRFRQMUJqYTQvR1lNTXZWWmlDa3hQWDJMK0VQblZSSEFMN0Js?=
 =?utf-8?B?UWhtY2tVMWRNK2hHY0FOeWlHWm5KTWtPNzIvckZsWTF4c3dycEYrUTl0RElY?=
 =?utf-8?B?MGk4emhsZGhmN0JSWWNRd3RoZFlMQm5IdVFjTXVmYWorTG54QlZsVHU1aGpE?=
 =?utf-8?B?TjNkRndCZHNacS9QeUFLeWFCeFVRVUNQR0t6Y0VVZC9USkFwaHI5YkhPUmVh?=
 =?utf-8?B?K0d5YnExbjM1d3NjVm5xbnhBSmJOUWdmUzVBWUoxOGJOaHZvb3Urd1hDc0Nn?=
 =?utf-8?B?RjRlcVJ2eS9kdDF4Z0Nqd0lJZGZXQnZES3ZLNWRGTElhU1JLV0o2TnZUWGsv?=
 =?utf-8?B?eWtPVGlwVHduTWhvVEdLNHBxQ3g5ZGlxR0tMZldObURMbWNYV0RTK2JkSGpL?=
 =?utf-8?B?ZmdsOEJ5U2RSb29wcHNucG5HZ0ZWQkZXUVRSRVY2eGJUSi9zaDk4WTBFUXFF?=
 =?utf-8?B?Z3F5QTRBMXFjTnJoNGZxRElCL1NOaGJoTmd1YlM2WVhtc2IydEJncUlHV0Q4?=
 =?utf-8?B?MHVPYWk0VGJJc29GRU1pTnJPWUFsRnpzczF3M29kdnFuZGVVakdZSFZMUHZq?=
 =?utf-8?B?K21LUUR3MnlEYm1lU0hjR1NISlF2RlVkNTBmdm84UXdlampaSEtXaTg3NTlE?=
 =?utf-8?B?VTFzdFlUSzhNdjRPMEtIcW1iOWFPZ2Q3WUN2L3NhQ1IvMTFEaVpvUWtLZTE2?=
 =?utf-8?B?L2xxbG1ORk13MjJVZ3NZMExzK2hsay9uRmwyRkxxaTZyZlVlSG1CZ0t4QmdW?=
 =?utf-8?B?UGpxOGMxUGJyK2g0NWJZN1lKekRRSE0xdVlCckxDcnJxSldhUWxQK3NnNDRa?=
 =?utf-8?B?WW9Fcy93RXY1eGY5WGoyNTlJWmUzdm5wK29kSWhkdmN0a1J1TGpUTzZ3N2E3?=
 =?utf-8?B?TXF2eTBhL3lia3hUbVhZL3JpbUhvN29xMytKaVR6cVlaWjkzU1VxSGdqRSt4?=
 =?utf-8?B?ZkdTVFJ2UXhxN3ZETUpISnBaMDlmcjFlL2pWT3BCUkpReE9mK2VRa200WmFn?=
 =?utf-8?B?K2NmRXVTcFRMczYzVXErblBzMUJtczNhbnNkeW1GRHJXYkp3TEFPaENPQkwx?=
 =?utf-8?B?NHM1NnBJSHIvNEF2MWhjc3NPNlIvZUZhYmpNR2tkaEV6SmNmL2lNOG0vUUhU?=
 =?utf-8?B?VGdROVIrNjk4SCtTMTVZdHhpVGVFalU5c1hyN0RjNzlWc2ZiQWpic2wvelBF?=
 =?utf-8?B?ZVYrMU5xNXUwbWFuUzVLMUhmOXoydVNhYVNjdTRTdDNRL3JmTk5vV3FuVXZE?=
 =?utf-8?B?STFwbVc4SXFaWDBRYVdGaXJLTmNiQytCZTFOWEJjZmdCM2plaHVVQTgveExG?=
 =?utf-8?B?QkFTa0JUSXVFdGVLNUJNTXNJQWM1RzRFYW1GQ2Q5ZFkyN1RTREp3L2hOa21p?=
 =?utf-8?B?bGMyR2pxNHVWeG9Mek1DMjlRQ2UyWVVUZEtuQlBWNnppaWxYc1E2U2VTdDdL?=
 =?utf-8?B?QWJJQ0MvL0FrTUJhdVNraEUzcktEclRDSk9GMUVRZWtjWHQrYldjTFNwMy9y?=
 =?utf-8?B?d1dnZGRhNlgvMW9JaDJEZy9FNFB2c1B4YXlvTnFFVndhZEl0bzliUVNlOWdh?=
 =?utf-8?B?MUI0QWFPa3VZU2JpeHZ3VVZvbWFIZGJkSDhUVExpZTUvV0dlQlFndFBaTFk5?=
 =?utf-8?B?V3RvcFlPNXRrS2gvVEpTZDVpaUU5dFU2SUN2UVovY2plWmlkekRKWHVVenVw?=
 =?utf-8?B?WDVnOXAwbkZVYTRnWVNDVkpMY0ROSk8vMjNZbXBob291bFRCOWxDRkN2OVBY?=
 =?utf-8?B?SFI4N0wxWnFSYUZjS1BHMkRkNVVPMFFZOUlCZTc2Rk5rQWZGZnNJTTVReUJn?=
 =?utf-8?B?cGlyZUUyelBueWZHTklwTHkzaTJSb2p3aXVIYmxqSXJRcEk5S3p5ellDbzlR?=
 =?utf-8?B?NlE0dHRDSVdxZkQ5QTFBQjZLaU1JNXIzTnp0T21WVWFVVWJNMFIwVHdEdXFE?=
 =?utf-8?B?ODFPb051Yk91SFF5Szd4Q0g5YmVwSDBkaTVhL2c3dVdsb0R5blUwZElBYXBr?=
 =?utf-8?B?OG4zTS84YlNEQTVOMVpub0E3cnF2U3ptWUU4N1cxaEpJMG5ZMTBjdDNlNCtq?=
 =?utf-8?B?VXRaZGc3OUdsTlFjNDJIamRONVd4ZytqU1dGVFI4ZWNoNG9HWU1VRVFyL3pR?=
 =?utf-8?B?RHFUZzI2OFNXK2prbjZnV25vZnV2NXdFSVZrdWk5Tjd1blpYRXhBdHRxNHl1?=
 =?utf-8?B?QTNjNFYzakgxMlkyU0N5ZFErQkM1elNQMHRxVXdTRklGWVRuZFZrY2RyMUI4?=
 =?utf-8?B?M29yQzFsRVVIN01OdlVaNHBkc1VWbENIekdzaGFBU29hTURISTV5UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92b6687-af6c-447f-4845-08da2dd43db1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:44:41.8781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGWyr6nuyeBdinYQlpnJelA6TGhGVNm5U2CSEssStKEcftmAHU4MS33eP2Ihk34D4HH/BwyCFG2JcyT52hwlDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6235

On 27.04.2022 11:27, Penny Zheng wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -245,6 +245,29 @@ static void populate_physmap(struct memop_args *a)
>  
>                  mfn = _mfn(gpfn);
>              }
> +            else if ( is_domain_using_staticmem(d) )
> +            {
> +                /*
> +                 * No easy way to guarantee the retreived pages are contiguous,

Nit: retrieved

> +                 * so forbid non-zero-order requests here.
> +                 */
> +                if ( a->extent_order != 0 )
> +                {
> +                    gdprintk(XENLOG_INFO,
> +                             "Could not allocate non-zero-order pages for static %pd.\n.",

Nit: "Could not" reads as if an attempt was made, so maybe better "Cannot"?
I'd also pull "static" ahead of "non-zero-order" and, to help observers of
the message associate it with a call site, actually log the order (i.e.
"order-%u" instead of "non-zero-order").

Also please omit full stops in log messages. They serve no purpose but
consume space.

Finally, here as well as below: Is "info" log level really appropriate?
You're logging error conditions after all, so imo these want to be at
least "warn" level. An alternative would be to omit logging of messages
here altogether.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2769,12 +2769,50 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>  
>      return 0;
>  }
> +
> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;
> +    mfn_t smfn;
> +
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    page = page_list_remove_head(&d->resv_page_list);
> +    if ( unlikely(!page) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pd: failed to acquire a reserved page from resv_page_list.\n",
> +               d);

A gdprintk() in the caller is acceptable. Two log messages isn't imo,
and a XENLOG_ERR message which a guest can trigger is a security concern
(log spam) anyway.

> +        return INVALID_MFN;
> +    }
> +
> +    smfn = page_to_mfn(page);
> +
> +    if ( acquire_domstatic_pages(d, smfn, 1, memflags) )
> +        return INVALID_MFN;

Don't you want to add the page back to the reserved list in case of error?

> +    return smfn;
> +}
>  #else
>  void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                            bool need_scrub)
>  {
>      ASSERT_UNREACHABLE();
>  }
> +
> +int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
> +                                   unsigned int nr_mfns, unsigned int memflags)
> +{
> +    ASSERT_UNREACHABLE();
> +}

I can't spot a caller of this one outside of suitable #ifdef. Also
the __init here looks wrong and you look to have missed dropping it
from the real function.

> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    ASSERT_UNREACHABLE();
> +}
>  #endif

For this one I'd again expect CSE to leave no callers, just like in the
earlier patch. Or am I overlooking anything?

Jan



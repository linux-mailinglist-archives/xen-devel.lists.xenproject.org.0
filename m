Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1BB50F8D9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 11:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313627.531262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHjM-0005uO-Qz; Tue, 26 Apr 2022 09:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313627.531262; Tue, 26 Apr 2022 09:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHjM-0005sZ-Nr; Tue, 26 Apr 2022 09:43:36 +0000
Received: by outflank-mailman (input) for mailman id 313627;
 Tue, 26 Apr 2022 09:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njHjK-0005sT-MY
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 09:43:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5648841b-c545-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 11:43:33 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-8miIKrbOMcS4MvmG43Q9kg-1; Tue, 26 Apr 2022 11:43:32 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3519.eurprd04.prod.outlook.com (2603:10a6:803:8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 09:43:30 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:43:30 +0000
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
X-Inumbo-ID: 5648841b-c545-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650966213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBsKKHlyLqmSn2knHH9wbNuOYlQtIABaamErmqRjfhA=;
	b=g0KafCneORV4Z+VcEBS6DMHMjocH4OBdInoqHkJD66ll+r2yke1UVs2Qb+w8EREocV2tMQ
	5IneNlvQmBU7ha9c07+XBjJT26nzbIeDodEYNhCMhUoChBo2vQlTIyyaNGKb7Kf8RaL6Mi
	/NPflKE+rMDSlRrKu/B3K5xUJLwp1QY=
X-MC-Unique: 8miIKrbOMcS4MvmG43Q9kg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0LkS7shb2rF/UkJXwtsY5DImXpZ6zWwq2DQcty4kg44wTpE+nfZ4LlPjrDjST6C5pYwnEALufqW3TCzUhx7BDn4+jqrF4jXDOWQwBe+bUFigGmfANpdjHgiFzzfGGyG4ff8hSiGHcN238KLmonjv1VVBUgK1sJWhRk98S8rYf9GforyncLcG/c1K/L/8gv6DGxCwIhoQE/qGBEBI25KP1vnx9sIQegynldK9g18ugc7mIS7/fwj4Kh1hgOSiQEp1n4UqYxY6vlnZCCyK6fhrCchyhCT5exsBOUDrM9nrnz82iuiImK6o2B926I0dYIU60JilKoP/6+JLya1GZG41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBsKKHlyLqmSn2knHH9wbNuOYlQtIABaamErmqRjfhA=;
 b=RRVdTnwLy95u3ADtpxuDRlgYHfAQ+9xuuh4NBMu2nDV4rAa/KdKfbr/AbfpRhiBCj8pbcDjiGmvjXPhx2Fvd76A79u7M17/wukuPN5sIy3D3YnDAot4O5VCVPePPlokXSTJ4O+otRNBX/XDySyS24MGL63uyIL5gSpwiopddZF4zlUCbHU0BLMDdUyMfjrKx1omZ5x5jUk2pR1Awbp5Elbig3iz+/FdG8wi2RvN5PFIuFvOdYdQ344rxGbNqkxjYl2ubQbvU/JgZXF4QR9jNvc7QlnJvHMFHOw9zhpNYYzWn7Z3k5cZe0OtwhtvsTV9fN9UdWhtoujPSoQW4VUsMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2942e8ed-e839-c3d7-69af-25f926d11da0@suse.com>
Date: Tue, 26 Apr 2022 11:43:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/public: add new macro to ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <20220426090810.28616-1-jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220426090810.28616-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9586b037-2941-498d-e22c-08da2769389d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3519:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3519B157645819EB4430CC10B3FB9@VI1PR0402MB3519.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	irX1JomIHdpE54To9qz5lsCpqolsy58Kcm4D/8+NajzBqUmLKWZzsmi9HKslXHaI60v9itagD+85OI96yfiePzK2IvtaxxAgtWhSB8IYonRVTjTKJQHBxWH8pisVN5CnSvNvQJkUaF+/88fy/462EQM80Csq7rRr8r7yZ+efx45ZIceFCejxJCwSeeje3QmCbJCkyfB+Eh4VIDbAl+XTnyMJi+veMUV5H7xLSoK9EiRa3Y31RxZeA/7JUwojsdACwS6DRqgCpU1Co/3DdxRqUlVX7Xt5DxXZF839a37dKrmZer5ZETGB1m4r8e+/WpVP7+H2+v4wSispJEYvmT8Ozdj0M3ni2BPwVGFu4HglWZP1BLJK4z8FjoUu3GJDhpPNk85fIcdLwzXRX3SW5Uh4RiUj37inoUFjwnw6N8XgL+edhApc4nsZvBSXirmEWg11T8Vaq7/L8tkUGqCfSza/dBfFNrmn2n70rS7MMPe96fgrCEFHdmODd9U5k6qbVsTp0B4BMQ8r2Y753sXDRWHMjVyqkay9q9U5CsnOHzdcyFQHzZFSUqfxAoVkWJbzuKONQW969MtWPnbaCRxMpny2ZPGNXDVWTeVVqb4T3TpJQKc7ZC69i7MWDXshzi+X6aBgLeRpkURrIK9YjmP3mf0sDYck0DluR35pOQxq0P4XcR2PDNA1GHhaWKSkbQlfoVBXxjDgnLO8/LNsRv/c3ZR4ujytKApuKwQJKpffXPRUyrVbYoSbPEEny+T4/QTXz+z/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(66946007)(66556008)(26005)(66476007)(38100700002)(6486002)(37006003)(4326008)(508600001)(86362001)(6506007)(6512007)(31696002)(186003)(53546011)(6636002)(2616005)(2906002)(5660300002)(8936002)(4744005)(36756003)(31686004)(8676002)(6862004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU9CYmZ1QmR6THdUWDRmMCswSy96WU8zbS95OTFCNUZuajdrZ0tYeE5vK0Jw?=
 =?utf-8?B?bG14N1Vxek83VCtjR0Y1WXF3Y2ZYRkp5d2ZmZU1SU3V3YldZaUw2UnNsQzVs?=
 =?utf-8?B?TTlGZmhFRDhISnNFb0pxT1NqN1lzZXdQZkNCQ0R2enNFM3ZjRHpqR1d0Rk1S?=
 =?utf-8?B?S3FjTXhyVndQcjVyM0VLWTlwcUxsWUtZNnpxdnlkK2lvbXdFZ2lKeVhMZk9M?=
 =?utf-8?B?QXUyTXgzUmxyRjBZSk9CZDhNbnBIYXhCdjFobzBzSXFXRjVXTm1YMVBITEE3?=
 =?utf-8?B?UXpwZ0RuQjA3UTVxWUZjak5TeXlnVU1qMk5LWWU5bU9jZ0xWeE1CL3J1ZGlh?=
 =?utf-8?B?aWxZYlFBTnNrN1U5WkhMaklyZ20vUU5Tb2FGcytlbTRybHVxUEpKN3NqOXFH?=
 =?utf-8?B?YmY5K2lsaThxWFBONWZZVUlBcGdkWDh1aXo1QnVMY0cvaVBPWEV4Q0lqbm94?=
 =?utf-8?B?UmEzNm4xZVNTZk1PdTJJY2s2RW1oYnZjcVc4REp0Z1RRbUxDQ1RQbEdFbHRn?=
 =?utf-8?B?V0s4bkFZeC95aDNXRVpnbEVjaWp4YjdzNkdYVFNBRkk2YjROZUFCS05VWXd3?=
 =?utf-8?B?MjhUNi9RNEV1TTVrS3NwbEFXR2c3cVFoYmVxM09OWGxLcjEyMU5Za1doR1dw?=
 =?utf-8?B?VmhleTlPTHVTc3VzSk9mTmtSZEJIbzRUOEhLWVAxZWU4RlJhWHhQN0xxUDYx?=
 =?utf-8?B?L0ZRSEsyNGloeTBlQ3Q1aWVkV0krT1FKSFpvVlYvV3U3emtNdW5oS0JwZXRQ?=
 =?utf-8?B?eGFhVGNjNWdzQ0hkc250VTFwNVJyQ3VvRzhMQ0U3Y0xINzZNL0ZxYmhWNXpx?=
 =?utf-8?B?Y0lGN0xRNE52bUlSSG8ybzljcldiUWxkTitwcDA4UHFDT0h5MG9YY1RFckpt?=
 =?utf-8?B?YjNUV2tTWWZUd21TeDFSUzR1dWdZWFA1NWpIZ3I4NDVpemZTc21POUlVdUdX?=
 =?utf-8?B?UkRPNW50SU4reE1PV2VPRTJBNUdyWDh4aDNqZjQ2V2JvZW8wUW9JN2R1VzlS?=
 =?utf-8?B?Sk9CdzdPMjFVYW0yc3BLNGd4eVJMbjlINENHWlB3RjhIUXYxd0xPcXk2VzNH?=
 =?utf-8?B?cm00aXVNRXY3TkZpdEVvYU52YUgza2pXSFh5ZmlpMGJzRUt3TWNtUXpLaUd5?=
 =?utf-8?B?K1BNREV0M1BndDJnVEw0cDBuSThhK2QzT05mVW9OYUw1MTFiOFZkblczLzdt?=
 =?utf-8?B?QS9ka3Y3Y1oyaHhyZU1uaDB2T2M1Q1NLZUJmR2t6akF2K29jMmtRR0Y3OUpT?=
 =?utf-8?B?eHF4MXNIRWJ1Ymt5N09kNGQybHhGeDl2UkxlTnkwY2RNSmdxT0QrcXgwUUx0?=
 =?utf-8?B?N3l4NEM4UHpkV3dOSmdKT2VqMW5uZk9EK2llZGNsU0pWR1A3d2ZUVC9zMkV2?=
 =?utf-8?B?MVA0RmJOcDhsNVdKcnM3V3RSTjM2T0h3TUh1ZXRVZzY5eFNKN2hkQ3ppcTNC?=
 =?utf-8?B?RWFyVndNRC84YURmQ1B4U3krSkxzeGJoUFQvUXVyMXdKdHBEZFBEd0F4SCtw?=
 =?utf-8?B?UXl5dG9oWW81a3pKZVZtY3pWRXpCMlBHUGRGdk5LYWJqcnZuNkNRdVNUZXB4?=
 =?utf-8?B?NFROY0pBZE9TamN0RlpqNnp4QnExUEJzZ3B3NHgvU2RMMENwU2Z2YStGczJT?=
 =?utf-8?B?RWI1dnBYanFRWEljNis0dC9Lelkrd3Z2MFhYU0hTb2YzZUw5UUFBMktSUWFF?=
 =?utf-8?B?UzNndFU1dUxRam1hVVl1MDlJNTJoQURrcWVhZGdWWDRHL2tzamd4MlFJeGVY?=
 =?utf-8?B?MklxMzlmL1pyVFlPWWt2cmNJYjViZUZQVE5ab1ZmVi93SkYzZFJERjdUaFBT?=
 =?utf-8?B?cFNpQmV4TExFL1dwTFdWaDlGOVBraitOamRNT2pwNFBQUGErQ0pwcXJydEJp?=
 =?utf-8?B?UHl5ckFlUFhVdGdkT241VjN2eURGR1haOVptcGhveEdoeXgyZEt4L0lHU3lP?=
 =?utf-8?B?VnJQVWdaSFlNeXJBWFRibzRtL2dNaU1USHllMFhJRlNWSmFwcE5vdXp4YzJ2?=
 =?utf-8?B?QnhDMGFZS05FS1BJalVqTkRpMUt3TzhSbEFYcFhuTTJmK2xxR1Zxdm4rN2VV?=
 =?utf-8?B?MXZkTTZBcVF5Zk5nYlplK3Jzd3lMMlJpN2hUaXdzbUVJRWFmMGYwQ2svRDE5?=
 =?utf-8?B?ZXhwbVhYV1ZKMm00T21jbmEvQjFPN3dORXlGMUFPbWV6bmxrRU9ra1hiaWo1?=
 =?utf-8?B?WGtvS0RjU1UzMDZweGQwU3RibTFwSGpjclYwUkJLdXQ2bGlRaDZUN2NldnJU?=
 =?utf-8?B?N1VBelY5ZzhVMktsUDM4QmVDb0F0YzBpeDE4QlkvZEorNTJYaXJDSnFFVXBz?=
 =?utf-8?B?OEpMTzFma2s0QXN4N2t3aFdKOXlhYUhZZnoyK2M4SXd6bWFVbURJQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9586b037-2941-498d-e22c-08da2769389d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 09:43:30.2672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1/1msx7KTa/Cv4WMVGjxBR1aKfdJqrKXjx+qWPX6r5j3q32hcyNKm6iiUeEsVTCeHWpSRYH+MfzxevpfNrAtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3519

On 26.04.2022 11:08, Juergen Gross wrote:
> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -184,6 +184,11 @@ typedef struct __name##_back_ring __name##_back_ring_t
>  
>  #define FRONT_RING_INIT(_r, _s, __size) FRONT_RING_ATTACH(_r, _s, 0, __size)
>  
> +#define XEN_FRONT_RING_INIT(_r, _s, __size) do {                        \
> +    SHARED_RING_INIT(_s);                                               \
> +    FRONT_RING_INIT(_r, _s, __size);                                    \
> +} while (0)

I think it would be good for the comment around line 100 to also
have a reference to this.

As to style: Could I talk you into not further proliferating the
inappropriate use of underscore-prefixed names as macro parameters?
Even more so one with a double underscore?

As to functionality: I take it that it is not viewed as an issue
that many of the macros here evaluate their arguments multiple
times?

Jan



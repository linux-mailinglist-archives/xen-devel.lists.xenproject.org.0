Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5010849D061
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 18:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261051.451597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCljb-0005sU-On; Wed, 26 Jan 2022 17:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261051.451597; Wed, 26 Jan 2022 17:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCljb-0005qn-Lg; Wed, 26 Jan 2022 17:05:27 +0000
Received: by outflank-mailman (input) for mailman id 261051;
 Wed, 26 Jan 2022 17:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCljZ-0005qg-CO
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 17:05:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26c07965-7eca-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 18:05:24 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-jzeIIYHROTu92sdhY7QoAw-1; Wed, 26 Jan 2022 18:05:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4656.eurprd04.prod.outlook.com (2603:10a6:803:6c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 17:05:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 17:05:20 +0000
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
X-Inumbo-ID: 26c07965-7eca-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643216723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6xXIlZsR/EHC3KNSbZpEtND2Qqmdsanz5jGkPQWzr8=;
	b=G6rZGFu4mJGEPDKdBCYcJGDDN13CtWMSIihDN+1zKiZ+NLehkwz9zI+ur8taC4avVsNNef
	3fqPhYqrWzC02WAirtPg2o7yuRoEy5tfViiketLs6SZo6ALiDpn5lNSrduKCTbM+dJawaB
	7O85X6czlBLjsqYtcUNsQ9rnmSdyJc4=
X-MC-Unique: jzeIIYHROTu92sdhY7QoAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEkm/s4/9mxRXgC59HaOltbLFWFeR7ZpudF0zHyL4R5zgwXq7/nsfUWanogOynUlkP74DS5sqxFErg0YIGHyRoTVLs12ZAzzB+YPibkWRCjysUOsIdGrz82UFKavNxLhu5G1/ORTwMAZgk0joD3zmdc5YhgaxTZdGxuCi1B/bO0U0XDhDSjt+rz7Nec5o+jj0w39kwoGkYJWLWKnXBhQFq2DCtbytw3X9xbi1cZMVDr/SAgrwfwbvYs0ypbW7GgDr93X1ZwXwF44rpnzG9W4ofRnyPoGc0uiUMZiwK2LA6M79w35XGLC18/U15nml5RFo4Hznc0E3Qevas5M2hHlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6xXIlZsR/EHC3KNSbZpEtND2Qqmdsanz5jGkPQWzr8=;
 b=Gl6boWEgoYVpFa01euQW4QNhgsD/rTAjzDRYm2mQe/pyWlpbV7xkmsMUu4WDRwY3emcAWIvGsB/CMmXZpLdFuDjrWXQxrKs3TE8By5DMvwfB/t4EO4HNAhKWp/3dRbKiksq7FjQeDDpUOlU4zdL7ZnEebFlAKL3KNcHNLuQ5+oKD5SY3ZafEecJHn3GkZxFRWIzsKdzLVLnw8dSM6ggQ2pbxFfHUM4FQIG5EhkIrLhL6z8b4mTNEk4hjSPGmfLoY80miLnmhMGGdRKHF/zqI8JJfPbyuEVi/G0rdjerJQ0EWLsr3xgeOPfxAYiPSM8+EuRTDoBgwwdTB1o7H5gqCGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da3a98e1-9c91-043f-1a2e-8719e511a81a@suse.com>
Date: Wed, 26 Jan 2022 18:05:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/8] x86/spec-ctrl: Use common MSR_SPEC_CTRL logic for AMD
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126084452.28975-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:206:1::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75476dd2-b197-406b-d2c1-08d9e0ee08d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4656:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46566FFC2E7C080340E878F5B3209@VI1PR04MB4656.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ate3nFjIhU22MTajZFRyMTI5kUW2uw/nP3JCWAdfKhARm31BBpxaSnUAU45PkjVABhPa+IHsFnIvDxg7zOtGzih6kyqdpqE2u7cArMFoMrHm+tzLbWZt5sxAcMCjT4v4nTI8kXomw8koDMeYAKn7srDWawxSPGvhS1R37/fL4cgXxlEt018OyBHfOzhuymiH6iXTW94HnsGluzt79c2u0Ja/Uz4uC1DKMF+4U65rF1pSRxNCa8qLYyd5xveFDP0GKoF/j7FgXl3D6JeDUxXN8gKOhVgLvpQAtHeTSdQW/Em5pLBqqzgr4dqBMwdWl5zI4hbmAV6iahAldpb5k7lAh3dxEy4984pZcN2nKAr717zs7XTyJgeXCAgbx5KPVLSKLWyXL8izJr9DktGeiVvy5Iajgubmv0VDHzcZnolnjuROx2s/G2L82mj7//XNj7LWArLln+S24++BHjklR3i9pqWesqMMqeiE42pK0vCksQ1itvDjv9WUkiTScM/2/iqhpYE4GDz0jFRGOp4JX8AFYtZU4C50Z9PCvy+fSPDgSKCZL3wL0fgrCsmfqavhjYsCItEW4jvnPUZ4uOOHAieQtYB6WdWr+9edHnJ1kJn8qf5taROWXHoAUZcK4Deo5jZHShT5MFygVRh0Bi4o38eI9zuemjeLJn/eZHqqEWdeZm/KLo60ZSvlswS2w0QZ3gAAcKm5O8ZLLX7RwXOJjnDaxSP4DRIM14oAa4t6MPleTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(31696002)(2906002)(83380400001)(6486002)(508600001)(186003)(26005)(86362001)(2616005)(53546011)(38100700002)(54906003)(36756003)(5660300002)(4326008)(8676002)(31686004)(6506007)(316002)(66946007)(8936002)(66556008)(66476007)(6916009)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUNoSnB3SzJ3Yk54Z1ZtNjhYemtJQmRXQzhhV1V1enhZOFE5WDVweThONTRv?=
 =?utf-8?B?VEhOUEM4Z0k5cmdCZ3h1Q0tldFNxOXJoeHFaNUt1SVFGRE50bytLQmN6Z3pa?=
 =?utf-8?B?RWlqUmpVWXFqY1BVeG93cjRlVGxMWXlUSmFqVlljK0trd3hIbVptMWJnMGF6?=
 =?utf-8?B?cWV0dHU3b0JvZ2lRYzJncDhlOEsybm83UHJBNDZ3UFF0eXZVQmNRV1YyNzRT?=
 =?utf-8?B?U210NkxzcGtXa3VmVWZXWU9xSWFXNmdLelFKc3RRZ2tuSHB5SnlTUTgxR2xY?=
 =?utf-8?B?bUZaVXpFU0NsVjFhOENtN0hqNUczeVkySW1EWFp0cXNTRXlscVJvNDdtWUli?=
 =?utf-8?B?RGZaSm4zV1RNT0NlU3B2VEYxZVNDc0tsOCtMNVU1czh1alQ2eDNhWFZJdlJm?=
 =?utf-8?B?S04zVHpVcTUyYXdEemg0d3VSMGNoWlIrT0QzMkNnNVl5aGJMSXl0cFlmaEI5?=
 =?utf-8?B?bHAzNHFQdG45d21YRko1cnhyY1Q2SGQwQ0hxTEJwbUdTL3RqdzFFbllWemZm?=
 =?utf-8?B?OG9SZnA5bkp0MHl1SEl5aXhFSXZtMWN6WTlqUmRCNlR0YldOdVdmOU9zdUoz?=
 =?utf-8?B?UFRIY01tSWRWTnUyTzArYWp6M0JtL2JzWEtIOEsybEo3M0IrYzJZM01xcnpv?=
 =?utf-8?B?Z1dwN1BndHVUYkQ2VkpMbDc3OXgvRUhqb0pGOU9NVEJKU0o5dy9JQTAzZWZU?=
 =?utf-8?B?SzRKdVN6WEV4MkhnNjdJUmQvYit0RjAxMy9WVUk5blIrZTgxK3g4OENhT1Nz?=
 =?utf-8?B?Mi9wMVpVN0JzNEN6WXlJcWJxYy9vWHRhK0VPa2pJUDYxZm5pOXJ0bVNsVEZQ?=
 =?utf-8?B?Y3Bma29PdUU2Q21RMkZseHBkNUlXbWdrSVlDempDblJmS3dZNGp2NnlZUGlz?=
 =?utf-8?B?ODZaQlZFeXR4d0lMem5YR29HR2JYOXowczVPUlR0Y1E4TkR0aW5SY0J3RFgw?=
 =?utf-8?B?a3hqWkNHeUJMVmE4ZXkveERNbmRQekhWRlczdTFQdWx0bnlndU5MRFdmOUJJ?=
 =?utf-8?B?bEhidmIrcWN6VlVFQ25JRXZwbVI0MkQ1UHBheDJGaG4wUXlrbDZ6ckRFcVZ3?=
 =?utf-8?B?aHNIbzRVOWxaR1NlalN6WmUzWmVzOVdqNERBdFo2cHlTUWtkSU9KOTArejU5?=
 =?utf-8?B?eWdUN3VBM3dpTDlwOWczYklxK2lVNDBsUkd2Q2ZULzkzeFQrdTJPY1pWZlVO?=
 =?utf-8?B?TFU4MmtGZUZEYTNiMlpab3ZsdUZ1Y2dMcEVrbUZDMVFQRjh1Z01teWFXOExm?=
 =?utf-8?B?ZmIyN0FuaHNjRkFTSCtQeEVoZzNqZjRKQ2pDK2FCOTdWRzB5ZSs4QTJUSFJl?=
 =?utf-8?B?b08vUWg4MXJ2b0thNzdiNUhiUmwxb0F1aG8vOWdCNDh3Um1OV3BWOFZlTTNk?=
 =?utf-8?B?Sm80NEV6UDVqYVVBNzlJQ1lGVEwra3ZOZkR2aHB4RUZwQnBLM1BCU0tSdHVE?=
 =?utf-8?B?alNLZlVxTm1WM3FSTEVBOFA2TWhVZVNLT2pSQVZKclVhcGQxNmZkNnVwOEtU?=
 =?utf-8?B?WDBXdCs0dmhPSjN3ZFZoWnBTQVJ6aXI1S1NhRkxXRzJrMkhvbElLNTRvekRT?=
 =?utf-8?B?MjlHc1NMNEhOK1lSTndtTDROR0w3WFhDcWNrdUU5akJEeFFjbEFIWlpPYjZF?=
 =?utf-8?B?Z2t5M0s2OUVDcU1mcWRhaEpBMmpydTFpZFhNT0lFcVFjbjRjaFVtS2R4Y2pU?=
 =?utf-8?B?WmhQb3RlanMxdStWNC9yS1p4ckV5bzBoTmNqUmFBQmF2VFpTVnFoQkZPWGRD?=
 =?utf-8?B?T2I3NHZJSlp6ZGVqQ3M2bzl5WTFidkdZNWI5dllSN25QOUd6Mmx6dVQyUFFq?=
 =?utf-8?B?SElGd3BXWXY0ZHVuN2hpZU5XZFlSSzBOSFhVQjBTMGxqSzNhUG84WFBwZW1j?=
 =?utf-8?B?dWxXNW5oZDQrOSsvbExMTnF6eVczYlRQL3YyMjJiUnllbE5VWjVsVlQ0bnpX?=
 =?utf-8?B?Zi96MmhKMmhiSkFBY1hobUd1UjVJRjFnci9MblpzQ29JVThOdEdlanBieWo4?=
 =?utf-8?B?M3JjdzJHcWFHWnJOb3A3VlpJOFFIQXN5RitMRGw0cEJFNllLNDA0WmNPamVz?=
 =?utf-8?B?WHhLbDVzVW9Ya3F0Q2grNnhVQ3NnSTZIdTUxc2Rpb0I4L0N1Ym5VNzZtdDZi?=
 =?utf-8?B?N1RDbW1jUUNUYnI2T2oya2xMYXRjV29aT3hlczRmdVM0a3h1OXFqYU5vQ1BD?=
 =?utf-8?Q?oi/SNZxNwbBLAAU/Ns7hKxo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75476dd2-b197-406b-d2c1-08d9e0ee08d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 17:05:20.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxLH9UqQwvS6RacVrLYBM2lW+0u5qPzSmokYGsJeJfx2V/YMdiP3jxCQCpQX7h1kT1lwSGS/cECuONVw1mgsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4656

On 26.01.2022 09:44, Andrew Cooper wrote:
> Currently, amd_init_ssbd() works by being the only write to MSR_SPEC_CTRL in
> the system.  This ceases to be true when using the common logic.
> 
> Include AMD MSR_SPEC_CTRL in has_spec_ctrl to activate the common paths, and
> introduce an AMD specific block to control alternatives.
> 
> For now, only configure alternatives for HVM.  PV will require more work.
> 
> This is a reasonably large change for low level defaults in the common case,
> but should have no practical change in behaviour.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One nit:

> --- a/xen/arch/x86/cpu/amd.c
> @@ -1031,12 +1033,32 @@ void __init init_speculation_mitigations(void)
>          }
>      }
>  
> +    /* AMD hardware: MSR_SPEC_CTRL alternatives setup. */
> +    if ( boot_cpu_has(X86_FEATURE_IBRS) )
> +    {
> +        /*
> +         * Virtualising MSR_SPEC_CTRL for guests depends on SVM support, which
> +         * on real hardware matches the availability of MSR_SPEC_CTRL in the
> +         * first place.
> +         *
> +         * No need for SCF_ist_wrmsr because, because Xen's value is restored
> +         * atomically WRT NMIs in the VMExit path.

There's one "because" too many here.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F144CF289
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 08:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285647.484866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7hy-0006X2-TB; Mon, 07 Mar 2022 07:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285647.484866; Mon, 07 Mar 2022 07:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7hy-0006TY-Q9; Mon, 07 Mar 2022 07:23:06 +0000
Received: by outflank-mailman (input) for mailman id 285647;
 Mon, 07 Mar 2022 07:23:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nR7hw-0006TS-JH
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 07:23:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c9eabd7-9de7-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 08:23:03 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-3WfyqMADPJS0NrUhL1c3zg-1; Mon, 07 Mar 2022 08:23:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7660.eurprd04.prod.outlook.com (2603:10a6:10:20f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Mon, 7 Mar
 2022 07:23:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:23:00 +0000
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
X-Inumbo-ID: 6c9eabd7-9de7-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646637782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WzFDXxWDK2sJ2o/S5nZgsygIWlIUOI+W05Jh37KClns=;
	b=Tcprjass3bM4WGJZZtxTJQ5qBN1mDfNZoVwrSLlI0PpC/12aEmh7NJZbcUf/+FK90uakmY
	F+E3rjfUi4xQtzNrU+vqu15orzkmGdsmJDzIIA9A5tWZ/Fw53AaNKboTVIohvYoVKrDI0N
	PQGoMdt11n82s3/OH5wiAfHCb/GtaGo=
X-MC-Unique: 3WfyqMADPJS0NrUhL1c3zg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwayfVxW3dkXh0gSz/D4ubTMGQRRVQKvkmQV/JXzSeRLGSjlS93WgeckRLhmGm+KtdtiWfCgHRBex628WkYjhhyqPtSRreUrZXqsIR4dkkI0oomxWWYjJDwqcxeBLYJRSUYY0ynZ5OdCOZoMpQ63QV57sQt0kmdHzggTimsgkaseUegx3WgaFT7Fa0JXtrtzXgEUJaSypUz1irQH6n/+0+I49ejbhUg+xMBsY/R03A2LnQMTZox6pUlN1fATwXlviz3wLIujSh8o8StOvfmTbcE5upbSSnxKVuSTnkbliHs4tA8hVJOQy8arSFTph7H8+wZ5TRMdE/wo6Ymsw+f13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzFDXxWDK2sJ2o/S5nZgsygIWlIUOI+W05Jh37KClns=;
 b=BfFEpTsiERuq99e3QNAfVvGLSLzNPiXcAe3AYLsgJT2M4GufXohrLV7grDNkXyMqhTgmgbzRVgkrTLG3cV2rIO6dX82NTEWhifS9HIUa97lFGdlv0lh1SCS9AWl7zEWzC6FnkxotoTZxW42tjgvo/aCg1v52F6emciEfVHwzfbeWtTo4bDIWuTRyx1kULsFpnWZpyxh1zNEa833P6EUbnxiBSmoAnp9tjqu7FLhpgc12usGX4WOMwn1LZq1sfx9L2O9oI49i7da9eG7PhM7NMl+zzHZvxhitV28FJouW3pA5BqANGY26ncWxXyByH+dOZugsvGVP6EDP1Y7IiX9ikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b15ca91c-9847-b0cd-a4f7-b2a3b919d253@suse.com>
Date: Mon, 7 Mar 2022 08:22:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 07/36] xen/arm: add coloring data to domains
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-8-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-8-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0099.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c355017-9874-4518-bcc1-08da000b4f16
X-MS-TrafficTypeDiagnostic: DBBPR04MB7660:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB76606D461FBD4A87E224C6C0B3089@DBBPR04MB7660.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Iy96HcctTaxJSF/BiY2QzxKVjQOq0mZVWKhQJC8QtcZQ9z9Y0J8XoWQ+BL4IjlyLJjxS/lK7dIOCk08iIs4AkGgwHzRF9x4fnFg84aZlDTC3l/lDE+KpHj7ziwbrJf0SMDv16oYL5ij/j2LCoocy5gU/IEC8CoSN1X1seNzChD63/EkpB/ro1j+BBOoGM6vp7ht5ypODVFW9HeMboQgORcAGDiUeXt01iyeenSXr7+IAWyddUWWyoOkvs5rdSylX0MRONkXG2QFwjub2EPCqrpfLCIWmKiTqGvLy8h8HcMjv5fBrAIOFmwNzoh+QDgmd0EYYnWIXNks8xd1557HKD72c5lAKTGXL643oTTOp7xvPiCzdqqgKGbNf0V8SQ7pPj3i4ddOTLbNOtNAYjOS7xotab7TXYaFCY2MnaKnfDHb1lz1SWhln6/DifFRIq4Gzee7qSOYu9mLj0I8IVNPQIpoY51sRrFPUA4pJPqz3e5/yzFgGpHdI9Ag4Um4OJqI6KxKrRUekaH5yKG1RmqM+GYfD8r5dy5/AOW+lkHqOY0tlVhi7R2VAamb6Xsz0oUwoDYy4kSjCql4hgkaOV9qdInrqNnp5OYvC9cWuYk7TFDJXhLzeKnZ4e2Md0b06NMUrbxAtGiojUgZlsK0wch+XJSUxTRVzNGoTGPHymh+qEpZclnhFvQyhmLscQev3fX9OXWITAcP7t9yeDPjGFoC8ex0c4JaM4gDzjxB1t7PCDoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(38100700002)(36756003)(6506007)(2616005)(31686004)(2906002)(5660300002)(7416002)(316002)(26005)(54906003)(66946007)(66556008)(6512007)(8936002)(31696002)(6486002)(86362001)(6916009)(186003)(4326008)(8676002)(508600001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3VDWFdRZ3ZGZDQzUllhcjQ4a3l0Q0hkM3NYL0tDbGFGS1hUeHJoZW5DRHM3?=
 =?utf-8?B?K2JYMXBrR2ViakY4dzRxeUNuNEZxUHdobGx0QjdIbzdVS1R2SDVLYWJQMkky?=
 =?utf-8?B?RXRyY05ZOXlLV25XY2kvVGRQMjdMcG42azVkU1hIVE9BZzJERjI1MXRGZEMr?=
 =?utf-8?B?LzFrOGQxTkRkSWoySXJDYnlBeTQ1anlMWFNvRXZYV205SmdpaVA3K1RXTWo0?=
 =?utf-8?B?MFQyRENQdUxneW1ac2JVUGZWenpRclFLazJMaEpSTDlSNlhlY3NKOC9DOHBj?=
 =?utf-8?B?WFJxajNXQ0pwRGdsV2s3R25yWFdYMGRlbU5UWDhxbjYra1dQZlB6RnR6Nkls?=
 =?utf-8?B?QzMyT2FHSXZWdG1xUGRubEtKbmhYY2M1TmwxSklLQjlxNHFyNmZ4Um5qckdv?=
 =?utf-8?B?RXR1UVRmOTh5c21Sb3YwSHFEYlp5UC9VZ0QxcWIrc3luZkk0TGxIS1BpN1cw?=
 =?utf-8?B?UmxUOXhsTGhOSDcvcmFsaldjZUtoUmZRVVpXaEt3NGtTclZtWDZ1azN6RlVu?=
 =?utf-8?B?R2x4WHZrTjNVRm1UT0lVclB4RWlUNFJTM2tVSEZHV3dVMGZqVGMwTDhjWEI5?=
 =?utf-8?B?SDVVMm11eDAvWUhTMnd4NCswMHI3czZCU0FRUlpPZGRwNVRLKzY4ZFVzaWYr?=
 =?utf-8?B?ZVNWSmVXLzltRmUwUDBjb0JuaTVoMW1aQjd0MExxbzF2emdic1F2a0NIODdT?=
 =?utf-8?B?elJwNzExazFsdm51YUVYTlJzZ2pHY3p4dTRjWmlHRFpTcTluei9XVVJvTUVM?=
 =?utf-8?B?ZUZUM1lacTJLeVdDeEJoa2JWTThNd3k3SThlbXZiWnpmK05BMzYyYlBLYUFP?=
 =?utf-8?B?L1FVbGJpb1pIeVFKR3ArVDVIRzR5MUFLN2ZSOHdFWUxjeVJidE9oU0s1cHBw?=
 =?utf-8?B?MTN4UlIwWGcvMTlHdXh2YnpDNCtqS0RVNVZndVNhMkh5VDVkY0NrRDRVdFJI?=
 =?utf-8?B?aGRRK0tiMGhnOUNVWnZyYnpFejRxOHNVTkpkb1Q3cmliZVZrazVwMmk3UmM5?=
 =?utf-8?B?Rnl1aVMrOFBybFEvNysrakg4d0d2M05YQmQ2SUR6dCtwaXRibVB0VXJqZVNU?=
 =?utf-8?B?eENCSW4vKzUwZmV1ek82TDFjd2JQL25Wbzhwa3FscCs1YXZQaUtIRW1OOXF1?=
 =?utf-8?B?QVRSUHRsM1lXbGxSakFTOGIzZkI5ejREekg5OS9KeVV0UUQvV1ZaWitrcXJX?=
 =?utf-8?B?Y2VxSFUxWkN0b0k0cmFNRCtrUlI1Sjlsc3B1bDBxMXpNVGJxUVlGOGNoSXMz?=
 =?utf-8?B?cEhCNjMzWDNKRCs5NHFFVWZVSHNscENiMFJ1QzVPTmo0ajJ3dnF1RENqOWFx?=
 =?utf-8?B?dG51L0hIeXVlSEpRaUc3RUgxVXp2K1BzVzRKdmZRbGE4UmxPbkVsSVRnU1FK?=
 =?utf-8?B?UWYvMGdFRTRzVmw4TGtwMTkzTDd1dHovdjU3RUhBL01TRmxFbXIrcVgvbGpx?=
 =?utf-8?B?QmpEN09uYlpPZXdMWTlua0xCcDhxdTBjQUl4Z0pnUkpLWUVUbk9kR0xEUFFW?=
 =?utf-8?B?cDhoNVhSWmlVZ1JTTWV4VTVVR2dqU3hvVG96cEZuaHRiNmRFUHUyU1FuMS9J?=
 =?utf-8?B?NVdJMWFLZVFmQW9rMWNqRkh3cFRCVUt5czhvcGEwQ3VUcHBZWGM0MzRJa2Jz?=
 =?utf-8?B?N0ZqQ2p1djJWVUJwbWxtQTgwQjNWL3hCNDA4MnprV0ZIekQwNWdCMmVTSng0?=
 =?utf-8?B?RVg0bjAwRUFvUUh1NC9Dc0g3WEZEV3VRT3NRZytvMDZRdTdma1dpZ0JXUjVH?=
 =?utf-8?B?TjFaWmE3WFllY1VvdW9sZFdNdk92ZUoxaFNoM1l3RWxTTW1pMk9panRPOGts?=
 =?utf-8?B?bTFJTXMwSnYvNUIvdXhIMHRsZys2SWZJWmN2MTdRKzhsYmF2clIxdnc0d1FD?=
 =?utf-8?B?UDZUZjgzQTF6V2pINGVuVVFVV1lLNndSNUdOQW8yTktWZXM0NExlU2gzYy94?=
 =?utf-8?B?QTFJaWZUR2JjM011WEpXcVNZUDBzUC85amNwYW0yWkpCcUJwZHh6T3R6ZmZk?=
 =?utf-8?B?cTdTbis4VWQwSkNGUTNRS3NISktFdG5rbnNJT3EvVDFIcXgzV1RuUjN4Rkdq?=
 =?utf-8?B?cjFBV2FLRlBwY09uQ2d2Q0JBMHJ3Zm9IM09laEVaam5LYWdxTGxldy9HeGhl?=
 =?utf-8?B?OXdiK3NYbjljUVNHaE13TytBNUMyekt3VDNFWG16V2xwQ2hoYzRNTkFoMXNO?=
 =?utf-8?Q?5bSzCjjcSEE5w6gfO7WrnYs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c355017-9874-4518-bcc1-08da000b4f16
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 07:22:59.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtFYDOMX3rYep6JoCnwjhJvJjRIQNBgtrJKnGmUmHNymjbKcBIYHkgiF3oie0e7iNFZcYXeINaRqEl+G4txsIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7660

On 04.03.2022 18:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> We want to be able to associate an assignment of cache colors to each
> domain.  Add a configurable-length array containing a set of color
> indices in the domain data.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>  xen/include/xen/sched.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 10ea969c7a..bfbe72b3ea 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -388,6 +388,10 @@ struct domain
>      atomic_t         shr_pages;         /* shared pages */
>      atomic_t         paged_pages;       /* paged-out pages */
>  
> +    /* Coloring. */
> +    uint32_t        *colors;
> +    uint32_t        max_colors;

You will want to justify why this needs to live in struct domain, and
not in struct arch_domain (as the title would suggest). You will also
want to check whether uint32_t is actually appropriate to use here -
see ./CODING_STYLE. Finally, a comment this short (and hence ambiguous)
isn't worthwhile to have, imo. It (as well as the title) doesn't even
include the word "cache".

Jan



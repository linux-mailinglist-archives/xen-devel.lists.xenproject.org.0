Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2CF39D858
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 11:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137758.255187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqBIx-0004Gd-Na; Mon, 07 Jun 2021 09:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137758.255187; Mon, 07 Jun 2021 09:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqBIx-0004El-JN; Mon, 07 Jun 2021 09:12:19 +0000
Received: by outflank-mailman (input) for mailman id 137758;
 Mon, 07 Jun 2021 09:12:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqBIw-0004Ef-Cf
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 09:12:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e023499-821b-4341-bce3-0a77fa965720;
 Mon, 07 Jun 2021 09:12:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5--Aio0mhGPPmjhr91Zmh3dA-2;
 Mon, 07 Jun 2021 11:12:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Mon, 7 Jun
 2021 09:12:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 09:12:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0701CA0010.eurprd07.prod.outlook.com (2603:10a6:200:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.12 via Frontend
 Transport; Mon, 7 Jun 2021 09:12:11 +0000
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
X-Inumbo-ID: 3e023499-821b-4341-bce3-0a77fa965720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623057135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nd7r8vCjVBhTQMZz/7WnPMW+Svvzm6ytLVcpqPiKHmY=;
	b=AzgLqFUtJFKNh479w1hAjvGxS1jbV6pVlPewiLuewwYmrF6Xkm2EetspyGPXjbaVhPdbJ4
	qCWI4iUjVvxF1uR0VgMQesdccybMPGRTGoEaAxCrYzVwI5xoCoFEcSpZUXMANhGcmLE85w
	acaELp11FiOKOdzwxIiffCMorWUAxn8=
X-MC-Unique: -Aio0mhGPPmjhr91Zmh3dA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaI9vRbrVG5Xb6cXMf+metaT8QomDrDZYPIANDkUTF24FwI0qK3pOcBgr3HULcuAh8LeZ8PpNQbYfvozin0HO9RMrh0yU/zb/IYLvVPBhNjjNoTuixOIuvDeLlDFB/PvZ/HQoXFVsSIkTF+kM0zmCdlACHIheeYbEFAO31gAno5np7VQ5FY5rFHtqTcQZ2pBLyOa/J4jND813sIR73fqh6jgewpg7NtnjjcDhOqJvv4+d0ihgGVhh5pAJqYzawRWerw2Z35OrCPrHucokyS2AHW4D7br6rIncLESDNmSGhZKcuMdfBqiq4YU8nHpLK/AlhqZzVkMpLxm+dgO44lCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd7r8vCjVBhTQMZz/7WnPMW+Svvzm6ytLVcpqPiKHmY=;
 b=REbIull5AI/cEMc74PPbwXBUff/urlWsEgH5F1PeLzf3+3C4WMdSyBvP/7lrBJdKDA1EZYd7HG7nbw4iHkSlkV5Zf2IBP5clmig26Mu07k58BiKJp+IvMKJG2yYfBxUk18FSDeI+Gh1+6nL2FTZLJ5ATIaaNks7/RFHUZFG0E3AeHI2xBIgsYUTsPPg5UjTERO/7wQbB55Oe8SJZxJapRypMzhazMaTMsB5lAQlwsBsXp9ZpwbqfSalSeW9qIxKjOhbBrH7rkMt7Azll4eOKV7KlglFh8gV1+KycKSR6rEdZJhxMHQe2NXAJgqxrAwRsxyVxHBPaoq79X/bH+N3/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/libs/guest: fix save and restore of pv domains
 after 32-bit de-support
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210607090425.18277-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <672a88b3-353c-fdc4-d6e0-ee3a725b5788@suse.com>
Date: Mon, 7 Jun 2021 11:12:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607090425.18277-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0701CA0010.eurprd07.prod.outlook.com
 (2603:10a6:200:42::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5dfb7b1-0ba4-4a50-90ca-08d929945568
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70243ABB86153B257C6CAF5FB3389@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BhHirDzsFgGJ5duXy5ou/fTNFoBTz+QUPBP7/5886Z3Hd/EuHpA1qUMKcX4TDxNtczicQxzE1UQsU+5aD5lxWSa/8fQevknWtzDKzA5kPcQYh7vbPVEMfJAq6xKY4nwvGFOpvkiyVK1QTpV6FgDZY2QJ43BphZXCKQ0AAU/CiCVYjxBYXn6XVACw3XnMIsvM+ijBbYzafI318eYTjXCb0eyUKW3KvmKZ/pPCmY0zx9zTOXME9/vv8NOjrqVCJsg/4Vag0G4nOlKNv4NORACy5VCNPJmO3EeYLzS67eYGdsv+P1xmDdTyzDdIaKmkO76aKxop+E1qtZ9nqL0ouJSkK8x7WXYxHgDRd/yko8l2Rnr/e8Y+yPKweEq0eSaHzUAekkPTJWFR8LB/rOcZ32fKEWPEL9Oq3kIgKD0lW4C33bctVlseFV4v7iXcvKqkw0sUXprGJzHbm7OXiSkZVIeyPqj7E+nOJq7+VJkqstgLdsJubfPuj2sx5P+M39mgiAATjELwlod4dJA1fBQPpZAVBeMzOdKUPzZsqlp2zOi8F9t709XUzAwUUfmg97iGgSJT53pVhsGgH2IMPvJPfUD/rsVcLqKiqJQsaddhKixSZuo1TvpoQP3qAdYmBWg/QpqbpY4jEhPaB5aGbZkL5PYwQza+/oRpg5U7oMUx6hJXTmRPffAkbCMTdJH3OWVzH4Yt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(366004)(396003)(376002)(53546011)(8676002)(6862004)(16526019)(956004)(83380400001)(316002)(26005)(16576012)(5660300002)(37006003)(2906002)(478600001)(36756003)(38100700002)(31686004)(86362001)(186003)(66476007)(31696002)(6636002)(6486002)(2616005)(66556008)(4326008)(54906003)(66946007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?WGdzdzRzazV0L3VWSEhMOGtxSlN4VzNkOWVQalh0RHRid1Q5NTdMR3NEL1Q2?=
 =?utf-8?B?a3p3LysybGlSZ3VINmhOU0pPVERvUURQVXN3dUs0dEI3dzdtZUlkVTZaVlNP?=
 =?utf-8?B?UStUbjVhTHQvTDFQVHBHWm5pQk5oZUs5eUVjcnVNeE9qNXRDZXVyamFIMnk2?=
 =?utf-8?B?R01vdi92SU1hU1lhM1dCNUs3NVlPZGhrbFM2MFh6OU1uSk5vaVFBcjE3UHFt?=
 =?utf-8?B?RWRFL0U4UVNqNjJVbFhlMnp1Ni9zcmpPc2w0bHpkQisxelRydGMyQThQMm44?=
 =?utf-8?B?c0QvbjVCL3dGMFgwVXRvOXVWaWdvY09lZnlXWnA0R2tpVStjZFV6NGYvMy9s?=
 =?utf-8?B?Q3J5d3NhY05obmpFY1M2Q1hYS0IxRUVUeTdJV2ZXYmZ5VWcwNTRzL21RSFRT?=
 =?utf-8?B?bkMyMytrOHI3WjQwMUFWb2szVDlPNlVzUmxQZ1Bicm5FTmtuSytQeU53dkJp?=
 =?utf-8?B?TlpXVzlUNmtScEdZb0VBdnZyRXVDekZMMDdTbDB4Z1RxSHhOUWp2Rmtra3BN?=
 =?utf-8?B?Q3pOU2xyamtHcHFkMXFMbFUwVE5OSlVKOWFUaWZyWHU2US9kSHZPdWh0QkV5?=
 =?utf-8?B?YjZBRUJHaHJFN2JkSERGNllwRlVzWlFhT3A3WVZMbE9kYlNtREJLZmFwRWdN?=
 =?utf-8?B?SWwxdDVyMnhMWUltRzRvOWhXaFlPWFdEZERBWjJ5QzJsN21ObHp0aS9ZWHJo?=
 =?utf-8?B?TzByTmRFTklCWmJEWkp1MFplZy9wekZFV3FTaExoSlNHKzVOSWppbEd1RzRi?=
 =?utf-8?B?cGlRY0hucTE4VEVvQ2hDSFNGUVN1SE1Vbmd2NllNb1hWVzJ6cTg1WTFSS1py?=
 =?utf-8?B?YS9IelVtbllGM1R6RUtFOE1IR3NHYXFuVDZBZU1GVDVyVFN3NHBxNk0zVVpk?=
 =?utf-8?B?WXpkcmFWQmp2V0VubkQ5VmkxbVFwZFc0cXRJRSt2d2JIWXRsbmtkVExMQXFk?=
 =?utf-8?B?aURNV1I2OFBqQmFNRU8rWU5qdmhDNDJPSFVVWVFLMW1PbGM5WncwZU16T1pL?=
 =?utf-8?B?TmxYMnViRUVKQXh3MXB2WTZJdXlWbmZmajRFUnVwVlRhK0lib00xcGVKYnJY?=
 =?utf-8?B?YTFLNjZZVEplblRZNHRkV3JvTjhNcGlQSjZzdHN1cDNCSENEMkpheWh6Mmw1?=
 =?utf-8?B?anFHM2wrdFNtV1p2ZTM3am51NE9FT0cvUktvazBPRStsS1lZejUzZTVnSkhp?=
 =?utf-8?B?blJvbndBMWRIRk9oMHlDNkF0Q0dmQkREUC9nVy9NUXFGS3F5UFBiOUxyaVBk?=
 =?utf-8?B?bWRDRDlPR3ZGRlZyTFI4TDZFNmQxTTBsaGtZT3RkMXlzd0h3SU5kcDNBbHd1?=
 =?utf-8?B?VVovV3J5Zmo0Y1BITFhpQVlaVHIwRGkyQnJYa2p0UkdUa0pXZGN4WkllKy9T?=
 =?utf-8?B?cUVXYW9mRzc1OWdCOW81bndXL3hWY2pvS0JRbnlDelBMbHlnWWxCNU1XWVVu?=
 =?utf-8?B?aDFZbHk0NlFpTTFSazQrOCtwZzV2bFBmeU5LMGUrMVdxWkFSbllYcTAvQ3No?=
 =?utf-8?B?elR1WkFBRzdyTThpeWRldVVZQngrN0hZQnd5MGFpWjhOTnlsdXUvN2dYcDUv?=
 =?utf-8?B?K2dCcGNqUjF1SVRaZThiMUpQV3F1aUIwNFNXdGlCVHl2UjM4akZRY0pCdktG?=
 =?utf-8?B?VjBUTDk2SDhNQ3RxOS91SGZLSytXSWliN2RrL3R2R1cwRFozK0JLODNxMnBO?=
 =?utf-8?B?Tml3UHNXRDFKQnkvOFMwS1NzNnFvTVphZUtkbnVUa3VUNFYrbFREdkdxUDI3?=
 =?utf-8?Q?lYk6B5k8zvVm6k8A+AbLDcPimcaOip34EiB4aqT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dfb7b1-0ba4-4a50-90ca-08d929945568
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 09:12:11.7299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiDkn/10wwEUswIgi+MXlqVwYkVpZCGLK6+JZORL98h3+vbvFEK3mbx+YRvWnohnIfXFAxyMuM3+jU14I2LYhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 07.06.2021 11:04, Juergen Gross wrote:
> After 32-bit PV-guests have been security de-supported when not running
> under PV-shim, the hypervisor will no longer be configured to support
> those domains per default when not being built as PV-shim.
> 
> Unfortunately libxenguest will fail saving or restoring a PV domain
> due to this restriction, as it is trying to get the compat MFN list
> even for 64 bit guests.
> 
> Fix that by obtaining the compat MFN list only for 32-bit PV guests.
> 
> Fixes: 1a0f2fe2297d122a08fe ("SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported")
> Signed-off-by: Juergen Gross <jgross@suse.com>

As this will do for the single present consumer of the field
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Nevertheless I wonder ...

> --- a/tools/libs/guest/xg_sr_common_x86_pv.c
> +++ b/tools/libs/guest/xg_sr_common_x86_pv.c
> @@ -154,6 +154,7 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
>      ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
>  #else
>      /* 64 bit toolstacks need to ask Xen specially for it */
> +    if ( ctx->x86.pv.levels == 3 )
>      {
>          struct xen_machphys_mfn_list xmml = {
>              .max_extents = 1,

... whether the field wouldn't better get set to an always-invalid
value in all other cases (either by pre-setting or by adding an
"else" here), e.g. ~0.

Jan



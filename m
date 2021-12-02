Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259504662E1
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 12:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236512.410283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskhH-0004sh-Ka; Thu, 02 Dec 2021 11:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236512.410283; Thu, 02 Dec 2021 11:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskhH-0004q7-HU; Thu, 02 Dec 2021 11:56:19 +0000
Received: by outflank-mailman (input) for mailman id 236512;
 Thu, 02 Dec 2021 11:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mskhG-0004q1-2S
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 11:56:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db10fc38-5366-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 12:56:17 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-qkAkGOU9PB64rEWRvpSWtg-1; Thu, 02 Dec 2021 12:56:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 11:56:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 11:56:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0142.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Thu, 2 Dec 2021 11:56:13 +0000
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
X-Inumbo-ID: db10fc38-5366-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638446176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fip1oEKgQDVzbRYQv8yGd4jqLPdCUUi+hGnXJ1ew0gI=;
	b=B6rH7zJ80E34dPFyLFuoIeNxQZCg2DIKNzdZduwY663WakeCg7iXiYoNKrPNDVSQwgp29W
	OUl14T8k7Yfmea5Otwv2/rB+UBYIpEfG7LUHBsv5RbDDXjCM9JofLR3GiMg+w4lyk/ByOp
	Jo38Wk63G/gDgUcPjhtJP6bdGFCbgnU=
X-MC-Unique: qkAkGOU9PB64rEWRvpSWtg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8vYNntMpxc5fYnzoZG6J7Yc+NVeKPnoxYNg0+xyqtq2lsYOFsVP+tQSQjZul80jDLSMPBU6U56Gx8qb1uWghMJyqBBqC0xggDDvGsWI8DeE0IpgPN7ATacFsD9Otx9QWQVsfZs/+ZE/QRRv36x4iVydEBMVAfMgQQsFmUn1MqZPXH4d67soc16TyxyifGRnW6Gf0VhNs3laS3uSsColR2pNNXDkwy070aIQvqc8fnW/wkRuXQ96ZXXfbrSkzAQH2f6s6DdHDQS2SRid146ZdByLThRzTZ1zLhbI1xEahQTN0fv2fqwEThP+VjchxbAMlNP/qaq0YbqUcx1csX8T8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fip1oEKgQDVzbRYQv8yGd4jqLPdCUUi+hGnXJ1ew0gI=;
 b=WjrNru5aaf55dbIzGLkgdx3vK7/xuokVpzX97ray3JjVSy+TG3DsGLciKMqGy44OHQQImHOo9/zhLzJeFhN1LAjUGUOXSH5jl+VD6tlztP0VzIL9hauTAI33tr+Q8sQ8lGGoxYMcp3Z8dTSqX5x0yRcxXNqw5ls7uWVR1sNjqkNvEtD3psMGCr24IP8lWH1lyJ+Latpkh/v3ZTN7xtAN0wcqE0iDhK7QuIJubqT3Wkw2OdRIUaeOCXeHaIKR2qcG3c2oHjNezFyOaALkI2Xhacz6zPgPf2vkdUSWJZCUkIN9ch1aX5aqNGMc39DgRGIhjPegEp5tTMLIjRM4SIvtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <852a6903-02d3-c167-6cef-3079a6b1c64f@suse.com>
Date: Thu, 2 Dec 2021 12:56:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 5/8] x86/boot: Drop xen_virt_end
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130100445.31156-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0142.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 353b6809-4e6c-4cc6-2c5e-08d9b58abd34
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260602502EC07CB5B7517301B3699@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	37MXOCDvaP7/IiA2uHI4y9Fmhwl4iM3xSXEN9A2a+CNBPcGpmVgILOOaYYSCLz+TbLuMz/2TqeLye+PSdj/dZ6L0mfa6aDpz4M4ot41Bv98CzH2jgRlLXhCjrOa7Sc9GSCpr/N4Yx3jvfWafPQHKFAKocn8YmlMnKvJ1Pw7RjwQhaUgMDd0D5ExJY15Gmiq5s/IiPnnNbQsYE86THvkvNzHnIygRiWYYYhXJpvCtr+z05BNjSTKqLsF8XGguI/B18CbYx7dtWJAsYv4QOGKsQ8YpsF0fNe68adVT5ES82jcsNLpP0Owof78SBhXYSyMbgEd8mOxgz1KnyMiuCuJ9p1CZ2r+i9q/4VAZhUNL9VqPkosfhTqVM9yvQnjb/uCW/K/FTCHyaFCVeDjiC5OIMmW6pg/6zWgyfzsiF4POOPqYbQKTys3AXwPd7G4HOZJ5Tm+6rpWlGoD4k44NstgiQVG4xCe28Fpa5+rv7yBR5+/Vq5MGUp00g9gMVDO3YVIA1Y1Bv86PgZpPrQLywQ4n2bFvTScWt6ykhWnC5CafvXrgCj3uh8F2miJtTI6m04dQ+AnD+6C+wHZMNRUD2U5rgKjWo6u0Ybze4TLTS6Iiul8Uy6N0sCSRumh0/w04JXKktYEhW8IUizHYmNjPmz9phY7G9y4jsE8xT1YAUTrsQ4XT3dZDUckQtECx1hZ7Ba1gD3h5PFADQGzai3NuzsWVX3TBwgY/ayTvKO4ScNkS6zxFugWYmEU8FBsCVWWymjiSq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(38100700002)(66556008)(6916009)(26005)(31696002)(508600001)(16576012)(316002)(4744005)(2906002)(36756003)(53546011)(54906003)(83380400001)(66476007)(5660300002)(186003)(86362001)(31686004)(8936002)(66946007)(6486002)(2616005)(4326008)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBZYmZkZG5FQkVZZ2hjUFk1aTVkQ2dzYjFPUU4xSmdrRHJHYkp0SjVNOE1y?=
 =?utf-8?B?cDF3ZEQyQkJUZnZwNEVGc3huUUE4QTBDaDJCbWYwZzFuVWlBaHh1djZVWFlP?=
 =?utf-8?B?YlBBbkpGV1VhenpGRDRMRXZ6MWsxczAwRE95NmxZNU1JQytFWWU1UlRlNFNZ?=
 =?utf-8?B?ZWNLS0hzZjhZU1ZiUXJZc0Mxa0NPeDhLUFRLWGN1dFNRc0loblBGcUVsY1ox?=
 =?utf-8?B?b0s0Z0Q3Ujl1NkIyaExjS1NrQ3BBREVSYjRWb09jU3J1TlM4YlBDTFFPWFNM?=
 =?utf-8?B?QTR4YzZ3VVdmb0xDTWtlb3VtbW52SVFLVUMvVHJwTkZPS3lYaHIxRWFoRWo4?=
 =?utf-8?B?N0tBUjFoN1ZIWDNSY1lvNkhpSFNrR2E4WkJZZGp0TmpNUG1vUWpUREVRS3Bz?=
 =?utf-8?B?QVdiejNFWHYvZ0UxSHZsbzdYNW9Qem5xTE5iR3ozYk4xcFZWb2pwKy9NczRr?=
 =?utf-8?B?MHFNaFpIWWRRbExxRDg1OGxMaDNXY3J5ai9tR2tkNEwvVDZKV2daWG1NaEV4?=
 =?utf-8?B?V1FRdW4rNEpXOCtYT3llWmYvamtTbGhoTGltYVdXaWJsKzBUd2p3ZEZKQ3VV?=
 =?utf-8?B?VzhqVTlRZDYrOVVMUXR0T25kTzN1ZHFVUzJGK1BWdEFDdHg4UlF2ZllGVVdq?=
 =?utf-8?B?Mkk2SjlFYTc0NXdObmVrUDI5YnBUSDl4aSttbmhxKzVjVGtOb0lPc2xDTVpE?=
 =?utf-8?B?bUZLL1dROU42K0hyTExvVitwT0xoOVo0YmFaQStqaTZwdHZlTVppcDdlVWJ5?=
 =?utf-8?B?RGRzYkZvUWdGaVdzNk9ib3o4TzkwVEpxTytiSmc3UW11Tng1VWpMbFlTRjNk?=
 =?utf-8?B?Vyt4UTEydDM5L3pnbzVtZ05hYlUxdmxaS1FiYTN2am8ySGh6RGVoS0RSa1RX?=
 =?utf-8?B?R3lhY2QrUHFvNVdHeUFNWFZjVHB0aWw3ZGsxK3k3NDEyUmxjR055dWNNTU5q?=
 =?utf-8?B?Zm93ZVlKdjZSYmFsVmd0V0dqSWJsSGp2QUtOTkRuZWlpZFhQaTkyb2V3QWs1?=
 =?utf-8?B?dGU0RHBtUUdycWJ5ZXVSWEFSNmhKL3J4dmJjdFE3Szg4bVc5T0FFdzRYQklT?=
 =?utf-8?B?ZXJ5SEJ2em5pd3A4bjRkd1NqenIycjBudW1DRkRMNnhwQmlBRUhXTkdTVEFk?=
 =?utf-8?B?TzkxWG1wKytxQ0J6TDQ4RGN5L3JKK2poajcwdkpwNFUrbDlPeXJGN3h4RnlC?=
 =?utf-8?B?ODRib3JEZG1sRHdpQmdFeDBFWmloR1N0d3FURzZnTnVscklpK0hDdE0wajhR?=
 =?utf-8?B?ZnBzYUw3S3l0K0Jib0tIMTdFc2htT3o2SnhleW55S2hJUVlYQThnOUUxdXI4?=
 =?utf-8?B?cUhmM0hDQnd6cXplZlJYUm1hNDBEdmROZUl0RDVteWxzZ2I3bUYwbFp2YlNz?=
 =?utf-8?B?SEZwaGdhZUpUbE1yZWdvQmlXNHpLMGdyNWpNL1Z4WC90SUNCWVpFUHBQOWda?=
 =?utf-8?B?eXlLelVuRjdYQU93NnhvVDBrdWpGdHpTcFB3V0EvclBvd2hiZFJzWXU0NEt6?=
 =?utf-8?B?M0FMM3pVZjV6bll1cjRHNlB3SnhKWnJuVkZ6YW55U0x0amttZHk4YVpJbTJ6?=
 =?utf-8?B?cU1MOEpScjVFYUphYUxPZVdrQUdlak1hbHN4TGlOajNVVHZZdnE1eFVqM2FH?=
 =?utf-8?B?SkpvRlZUcUxBVG1EMGdlbEFFaDUrVGlqbDRVZ3JyTnpVVFBRR1dnOHdlWFUz?=
 =?utf-8?B?L2ZUQ3UzSGNlUy9UVUxmeDVhWjNEdyt0OVgrYjdsUytSYVc2NWY4M08vc3BV?=
 =?utf-8?B?TmVtOVFIdHJCTFlJTm1TMTJmTlhOU1BOdEN4cEdyYVN3ZU03WEx6d0hiUDRP?=
 =?utf-8?B?RlRUa3VyQTFUL2pydXpZaENzbDV6c1pRVE0xOXViZVFqbmhZTnpFK25uYkF4?=
 =?utf-8?B?MDVFak8yYmNab1hMWW0xVDZaWURuRnhXdG5WZ0M2UitZdzlnNVpOeDB0ZHNK?=
 =?utf-8?B?a1BuVjNqUG9yTjZxbm5Mam53bXc0OWdYVW91L2x5c1l1Tmd4WFRma21CWjY0?=
 =?utf-8?B?bjdkME1Sd3MvVy81S2IvN3NianhlVGd3b0ZxcHdkRWtKT3Q2aCt2TWlDdHlv?=
 =?utf-8?B?eW1ZdWEzSUZmNjUwck12TmsvSUgybzRpbEZPZ2ovbW1ERUZoUWxlK3BvZ2J4?=
 =?utf-8?B?QkpLSWo1ajJCSmQ0Y0M4K2owZHdSaE9lRDhKSWJPSW1QcFlUODhNYkVmVGpx?=
 =?utf-8?Q?jb2C+2OkGbflc/jyBvPTnZ4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353b6809-4e6c-4cc6-2c5e-08d9b58abd34
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 11:56:13.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxsXmTJjFxny33nelvz17EJr65EcIK1eRJurjKOysDHAsvKjd1dwTw5AaGDhIaZMlPXGUS8FdEaXKFzUsox1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 30.11.2021 11:04, Andrew Cooper wrote:
> The calculation in __start_xen() for xen_virt_end is an opencoding of
> ROUNDUP(_end, 2M).  This is __2M_rwdata_end as provided by the linker script.
> 
> This corrects the bound calculations in arch_livepatch_init() and
> update_xen_mappings() to not enforce 2M alignment when Xen is not compiled
> with CONFIG_XEN_ALIGN_2M
> 
> Furthermore, since 52975142d154 ("x86/boot: Create the l2_xenmap[] mappings
> dynamically"), there have not been extraneous mappings to delete, meaning that
> the call to destroy_xen_mappings() has been a no-op.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

While there's a contextual conflict with patch 4, my understanding is
that this one is independent of that. On that basis
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E23BE3DF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 09:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151994.280851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m12Gh-0003Xs-Hd; Wed, 07 Jul 2021 07:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151994.280851; Wed, 07 Jul 2021 07:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m12Gh-0003VR-Dv; Wed, 07 Jul 2021 07:46:51 +0000
Received: by outflank-mailman (input) for mailman id 151994;
 Wed, 07 Jul 2021 07:46:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m12Gg-0003VH-89
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 07:46:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e7d697f-2b63-428b-910a-a36c7eb3e365;
 Wed, 07 Jul 2021 07:46:49 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-uirHHT5RMaGyzTV3UnxDOA-1; Wed, 07 Jul 2021 09:46:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 07:46:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 07:46:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0051.eurprd05.prod.outlook.com (2603:10a6:200:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 07:46:44 +0000
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
X-Inumbo-ID: 0e7d697f-2b63-428b-910a-a36c7eb3e365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625644008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIRrQE298L27KOZQuDhUlhq3lDEV4n3IGRDKDKfwLc4=;
	b=Bg/P+D5hDewVD2+uCT5/AsIXex2siBXt86dFO+Ca7sR3Qd6hiLji1rNWZcICsa36s2R+1o
	rOXd2vbpvyDrQ/sWxb4b1BuF5teQIJRdwdW4LBQTej9V/dC+4XAteswzlYflYM2lzhL65G
	DDglr9xXJPDt7ERvxMEYcc/NHmHvHXs=
X-MC-Unique: uirHHT5RMaGyzTV3UnxDOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVwOxHKkKFPfj8R1F0zIQEcyp3863vGzFSqNTVskHrM6jN4929IE8P4APzy7BWj5UzbyVpgFIGjlZq8fiCIKKRNDAms4sTcuXUjRlTKnorD/EEwyP4QiNbkMpnbBTCawZvFFvizZcWQ/thBgICTm8ptrshG1AKHkHnQ/+stGNbs9C/vBafDoPyMOaaS4TB8odmqM2Ohu4PHqkgK2oFkPtFOxR0Adsctd6pXslGnR6jm16HPOwCUZAbJOfUq/Te+MYWn/TE5bPSQQGpVLQ1jnCYyDCK8LhBsOCkP71G6O7S+smLGbdgYzEQOrV4++XzUWuecQMP1tgD9nGBM/SkrjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIRrQE298L27KOZQuDhUlhq3lDEV4n3IGRDKDKfwLc4=;
 b=Vs0KRFDrShnzm4yS6oHgwd14KU7/0TnWX4TWbtUtFJk4u6R/5jlNz8xzZErAf39onfrPIA+N9OEDJUAtL986J3DzhrXfpnGvlHqiTkwSqPFeiH7UIR31r/ehgMfsqRD/UnIat50FGgiPpnop3z3w6Zxt09uxe6Mqdx7jbsQv1tgg62j4KG63gikicEtfXxD2l+RgUv4sSEYoqPn1h91T75l0SmP40bEHlMSugtsox5pkkXSoVpYZfZhuaC9Nx7wob5pfOAcr7yjtLw7rQilDqfrS8+t+dCTk+CuGc3rrZUF898h5WtGKGh5O20Eea4SKsUSrZe/FzAHFtpKof/oUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: iwj@xenproject.org, wl@xen.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, julien@xen.org, sstabellini@kernel.org,
 jgross@suse.com, christian.lindig@citrix.com, dave@recoil.org,
 xen-devel@lists.xenproject.org
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56e4d04a-dc79-ecc2-5ed0-0afef09077e7@suse.com>
Date: Wed, 7 Jul 2021 09:46:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0051.eurprd05.prod.outlook.com
 (2603:10a6:200:68::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9c0ac69-70fd-474e-7d86-08d9411b5e76
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26055AEC06E187C85BDDBFCBB31A9@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FbjHwunrPiPqj5jjx4vF2iEUlbZ6EhN3GjA9zmrAoiKxpolGWq+qgGzNI0xDO/rRvcMHm2xuLo7yjEWdjPqkGnNRmbmXCXdJ32ISsoe/LYhjekJtIvcyVmKTf21zSktN69ADhFi68yNrzIOQMVHvQEhrMceOnNNczt+WK9bAFqkhltDemrOrcaCj0tUppTYJ8BTRpF9XwDxUb0RTyrX1wQRPPdspcvfqh+Tliq/8P1Oqk7HgZDL5xywSOaCXDR47lLXAkKroIUKuVCeptKlDandCJGRucPp1T3IkdGqMmsK1OlcVJfQk98X4rnJrKhNEOc0Y6DieinTRqi3H8P5CeVrGzru/9xq/7in3IiJPVueNk0vKjci0v4w7xZ455p4t9JVFx91PTuutjamTpvKDD9zGK88so+dHLu1Ew6ZHgcQydvKPWeKLPKGWPWsUKpYLNEpCsysATffHmJ3Q867eUQcNlZdzMWUzxNd+UUr56eyvl2OxJlyioJCWyG3Lwg1oa/mgneyCu68ba8JvyxV9k6oacV45P1J+Q+WQ23noelLm8qoyXaIyGo+OCpIkwYtXGexJrZxb8gmKtbcVkJZ3iV0jzQsgg/czTAWy+EIaOTZdo4Hi5O9vDZ0lh94RqAbSTcULJMzEAOQfdN/n1ByQMLTSw0VPQbWTujl9QUKuaJYBj67BRMFbcB6LtkJilKn+OnNJiUKjMAlD/DSqmm9JHf/GIlXnQS2Xt/z0b3gC9FA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39840400004)(366004)(376002)(396003)(83380400001)(38100700002)(186003)(66476007)(6486002)(86362001)(31686004)(956004)(36756003)(316002)(4326008)(478600001)(6916009)(8676002)(2906002)(53546011)(66556008)(26005)(5660300002)(8936002)(31696002)(16576012)(2616005)(66946007)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejNZSFljQ09kbE5TZkZUZC92QVlhN0xBYVFVOUphMk5mWTlEUkNCZVdONElm?=
 =?utf-8?B?ZFRGdnVwaDJKRXpYZENPV2xvQU5PYXhRbWVsM3ZFcWZ1VEN4dElmTHcvcTV5?=
 =?utf-8?B?WCtHQkJGUFExc2NiaGp5WWtYMGJNREQrckJCTlJtcVNHNTRjUUlXNmlGdXp5?=
 =?utf-8?B?djRSRUdUNWNndnZMcWcvc2RLKzE5M1RhRXFMWHByeWtjbTBTWlhRWEE0UkZj?=
 =?utf-8?B?WHJ0TEtBd1NPWEZtKzlkS0dFZzJDR3lEOGo4eCtqeGJqT0F6Z0RhT0Q5cWE2?=
 =?utf-8?B?UG1OWmFhWEQ1cm5ZOE44VFlwWGx5Q3YrRjdObFBIS3pPL1RKV0ZJLytlR3Rj?=
 =?utf-8?B?SGtYOURpbFNXN04vZ0RERDJQNDR3OVFOQXJkb1g5bUVYWlNyUjBYdnZQMkp2?=
 =?utf-8?B?NzArN1VKeU5hOFBsZzR5WFNiWUlpQW1NMGxTdDduZjVUazk1NU93WnF6SkNz?=
 =?utf-8?B?eTdDNVRpOUduMit3Y1k3d2NwLzNVVDRHQlV3TU0xRGNNam95VmNwMHp5Y0pv?=
 =?utf-8?B?d0pBb2dFTm1rWUlXT3B6czd6Qy85TlNTdTlvUzZpTFFWVW5MU1NhV3dtVzdE?=
 =?utf-8?B?VUhQMHp1aDJDdjIydEsrNGFiNit6a3MrTHpObTNnaEcrZkpKbGhFZUc4VFVX?=
 =?utf-8?B?ZTlZKzB1ZVRiYzduZzQrOHBlcVdiYkF0OUdOYWUybnhOYkU3aXZ3MFhvUWlt?=
 =?utf-8?B?T2U5MjhMcjlBYjYrQUFaZVNwRVpxa0tMTFJ4TDRwclYwSVVRNDJ5NlJUdnl3?=
 =?utf-8?B?dzV1amtHendUL3BLYXF3T3Vxak0rbjFVbUZpWUcralZKa3Jabm01eWNtekN5?=
 =?utf-8?B?bDgxMW5VVmFyU05hVE91dk5BNklBOG92Y0dIVlk5NE1lb2x5TWNpL3JlSTFs?=
 =?utf-8?B?QnFLNUh4dCtLa0lIcE81cldoOGNTeFNFSnV0ZWxkd2I3Q1Qvb1RjakdIWnNT?=
 =?utf-8?B?UXlhVEZtd0VzLzdwTkhNaDZaTDlyM2R5dTBTc3IzUXRuUTZGVUhtdlcwQXZG?=
 =?utf-8?B?VlVxalJKUEJzWFZlOXNYT1ZhcTJ1eUthQTRrbmljVVUwZVl2OTBrenlYb2Qv?=
 =?utf-8?B?WWhUZVJiRDgrblVKSmdYbkNDWTN3ZVlQRGp0alhvZFF6d0NvcElvcGNnZmlH?=
 =?utf-8?B?eHJtVlZlRTZoZWFaOXFPUW5NMkNLdlM1TEwvR2QyUE1CYnZWSExjMVlnYzIw?=
 =?utf-8?B?aFZJbHd2Tlc0THBQUGkvd2JhbmpOU0thdlIydi9Xd3dZU2FSdGpSS3I2bjMw?=
 =?utf-8?B?b2syUzNwTDZUZWllb204WU1GV3lkb0pic3o0UEYrNVF5MC9pakR3a2ZkU2Ns?=
 =?utf-8?B?WWpvektNZldONXhOTXpHOTkyckJRMzNVRzVwK2FXVUVoZVlLZnkwMlRiMHU4?=
 =?utf-8?B?ZWl1NG1KR0VZZG9Gc3RVM2F2eXQ0Zm9GZjA0V0pCUXo3bDZ5dGtvZ1N5NmlS?=
 =?utf-8?B?aEl4N05jelhzN0VYNmVRWXRWY1dSUlpxQWN6bGpUUHBFY1VIQWFPSm5qaklF?=
 =?utf-8?B?L2ZOdTR6U04yQUVvQzNmWEplTjNJZi9QSkU1bjg2ZDVMR3ZaOG5SRU81Vkx3?=
 =?utf-8?B?MVl4SUZEUkg5cEJ4TzF3aXRKSkNhS0p6OVpySHVUREtrSzI4eXAvaTdDSGhZ?=
 =?utf-8?B?aXJiMzdqN1ZvQjhTSFRya3dyczY1cnNCL3Q2ZmZ2YVVBZUxHV3ZERjNrMG1u?=
 =?utf-8?B?M2N3VS9LZU8zdzZ2YzJLNGp4ZVVXbEN5SFlyTld4Uk9SUUhUNzg3SWhnMkpI?=
 =?utf-8?Q?0EdWRWVgk6YGVa0lVS4gR/F/86+mmoJOIYyMRYn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c0ac69-70fd-474e-7d86-08d9411b5e76
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 07:46:45.5521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SR+2twnPtSzzXS5fClOm6UbiiNSNct5WEKHhJhNX2QJoeSLAORSK4ONfTI/ZnIwX2M2c/kzf+pNoR7UaOMppsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 07.07.2021 03:02, Igor Druzhinin wrote:
> Current unit8_t for pirq argument in this interface is too restrictive
> causing failures on modern hardware with lots of GSIs. That extends down to
> XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
> as well. Internal Xen structures appear to be fine. Existing users of
> the interface in tree (libxl, ocaml and python bindings) are already using
> int for pirq representation that should be wide enough.
> 
> Domctl interface version is needed to be bumped with this change but that
> was already done by 918b8842a8 ("arm64: Change type of hsr, cpsr, spsr_el1
> to uint64_t") in this release cycle.

Let's hope it's not going to get reverted for having broken the tools
build in multiple ways.

> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1385,7 +1385,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
>  
>  int xc_domain_irq_permission(xc_interface *xch,
>                               uint32_t domid,
> -                             uint8_t pirq,
> +                             uint32_t pirq,
>                               uint8_t allow_access);

Take the opportunity and also change "allow_access" to bool? Or is
use of bool prohibited in external interfaces?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -441,7 +441,7 @@ struct xen_domctl_setdebugging {
>  
>  /* XEN_DOMCTL_irq_permission */
>  struct xen_domctl_irq_permission {
> -    uint8_t pirq;
> +    uint32_t pirq;
>      uint8_t allow_access;    /* flag to specify enable/disable of IRQ access */
>  };

Please can you make the now added padding explicit, like we strive
to do with any new additions / extensions? With at least this aspect
taken care of
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan



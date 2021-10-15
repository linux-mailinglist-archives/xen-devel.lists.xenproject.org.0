Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B642EE63
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210111.366843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK5V-0002aD-Od; Fri, 15 Oct 2021 10:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210111.366843; Fri, 15 Oct 2021 10:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK5V-0002XO-Jo; Fri, 15 Oct 2021 10:05:17 +0000
Received: by outflank-mailman (input) for mailman id 210111;
 Fri, 15 Oct 2021 10:05:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbK5U-0002XF-Kp
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:05:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fcccf13-fb38-4ebe-bf8d-b850cc8e8a3f;
 Fri, 15 Oct 2021 10:05:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-DQCCqSQoN3i1lpyqPKX5sw-1; Fri, 15 Oct 2021 12:05:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:05:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:05:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0402CA0019.eurprd04.prod.outlook.com (2603:10a6:203:90::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 10:05:08 +0000
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
X-Inumbo-ID: 0fcccf13-fb38-4ebe-bf8d-b850cc8e8a3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634292314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8bD126L9ldiYG2yNwGi2hmVGOVHgqbVZUjn5UhGaa4=;
	b=H/JElzXwtlvZlS87/NjN/P/ADhkjSwSW10IFrJ38bf6YK57EXymTqhvhk/66X+831qafKm
	2c18ZT3axad23bs3w7K0CTSCKtCPMtQPXwhTQKTUpo4ZG4ZDF2I9SID+a4mFXksNeUSXTY
	B/y2i3p1z2gnm4zIuT3QhGp7ZkFNgzc=
X-MC-Unique: DQCCqSQoN3i1lpyqPKX5sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iE2eMfkjvJ0dxCeX8CdR5g/8icIZJsTXQQW+MY3j7zsn14NVl2kEPWZCKgvZ6CzAXoQ0cG+Yzf5I0qfrdmxpbQVcb7b1aiu/ca22QFzrop1i3o3vFJLo5bpv2ZQNcFxZQfd2hcKmk7tC7oq517rFEuCHyGTbK5riG1uyHPmTMkIHZeC3UIYwyL0b3siiaXDVlSUcih4fjgq/ibSUic20Bl7n2ap0/gsLyPLpCb3lipCxC1FQfHXBTwGN7ZodmXq3r8GyQbyPwc+xknyBiuePVEPO13chBSrhO36xf1lSs5LcpujJPR/rsgPULYezeu9v+sD+6bqc5IE6iUNV8QFViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8bD126L9ldiYG2yNwGi2hmVGOVHgqbVZUjn5UhGaa4=;
 b=NIbaMWsqHCCtvrQPd50pdKIdd2RSIAnT9OJsq+SdafF1fLKRqwQqpwRY73F/0o2igCAGDE71p+sY65lU5DTVMPFLGDCLo0xaYG/yHHwbsLTiFDm/HfiCyP4SXt3ov1ZCZIeFU/Z5e9aUstq77Lkh3Ns9mi5UUNG5A/cOuQ/zquH5MWDDW1V+NF1QuqRt66rTyO1FxFj0MlOHGomDhLLvOQkugz8GLK8mmDQRz04uGt3RTiN2xNmRDOYUK8czOKY1OwnvyrIPbZnEXLRlKOKM8zI+OkvOBw5gyGm0c1BEB9OknCaaZi5b90OW1Clc7Ds54JQEsPBQPRMO/Vw6vncZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 3/6] gnttab: allow per-domain control over transitive
 grants
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d741841-6aaf-1d33-e1c6-b98f77ce41fb@suse.com>
Date: Fri, 15 Oct 2021 12:05:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210922082123.54374-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0019.eurprd04.prod.outlook.com
 (2603:10a6:203:90::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5090543a-96a3-4635-b7cf-08d98fc34543
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352755C60C6CCE72546512BB3B99@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PrbDy7nAKJhdSBGpklO3m1e78ZyNF9zct4bS4CC1/N5fHUS/FlGtQj454yo4JrewMDNudID8Op3bEEJE+US7gwvLT81TzD52Q+BaVJDQfVfWGwstKSuVxrf9c0+M9hdQWIUa/KvM8bWbK7UvHrbMKA5FvY96SyIJw/0spSp6Jf4Jd9QwazBBsllfKc4rf151gU6lUq4vKurG7qr0jhDRvDbpEglBBhOVjOwwjKV+yNZmqb3TcqgvHFj6D3skJdFvzsnjTLtTnmelDmutiQwuH55n6b9074g2VDN/wlPge49OrKBz2WQozvMfp38etjzqqqtuKojYSj0V/OaTGrPSJqQ0g2XoekdIN378BeuUjnWA2qoLWEyeEE/fo6DdvoniriaTiA1JhqF1H2dMPnA+TVRk+/0wTYzZLlUxa6Xvronc9fPxYag1EZGQrVVKtPaQTOn0pCgQFKW0AZ/GBsfOVFfT5lv9cvhHeWKZptgpncegpTAS5KTVZjShlI7nwUElomaxlep3kNItuGuO9IJ5R4kum8pMfrUZwZHmxClRDqkO+GVeDQ5sZzHQCSxpPwuMWcaBOj3s1vKauf7xxbKLVfKSNJDx05NcEAVwXhJLRcpv5kCUV6WazefGX2TQDd2bTl6zTDxLUMMgA6jRBwBfnwQStBHad4Ma4i0VtuomDxc33LUDrrDYJQmZXEkkmD0n4rdGvSLKe1u/KFSCEqTqt1gJK2X0NUJhoSQaCBfSf3H0IncuPaF8IqrU96VAt65A
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(53546011)(316002)(956004)(86362001)(31696002)(8676002)(26005)(31686004)(6486002)(508600001)(7416002)(8936002)(38100700002)(36756003)(66556008)(66946007)(83380400001)(5660300002)(2616005)(186003)(4326008)(66476007)(2906002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlRvYi81Y3hwTWlWM2ZOM1VMOXBVUk9FWlM4Ti9sR0psaFRWd1ByeGJ1aThJ?=
 =?utf-8?B?Y2R6Q0tuZzVkcUVvRytRRnJ1TlNNZHk3eEpHd2hqRDRaY0ozWGwzWnBkVnVB?=
 =?utf-8?B?a2RBeTFJcmVVdzhVMU9hbzVDbVZBRXVPdUNSOStRclU3NDFIakdPamJJN3Va?=
 =?utf-8?B?OERXTWVtU0tnS0J4aS82NFFOMXUwdGxvbUZMelZNaEtadURVN2ZZNUxpRlJq?=
 =?utf-8?B?d3BINDdYbitsRlVKaU1MdVJkbXpEbTlaOVFYK013WHRNUTRBNWx2anlabzhL?=
 =?utf-8?B?UVdmYVJoTzFYK1ZpMjZLVy9iVGYvVzhhSC90TTBSY3ZGNXVtQUZIT3dkN3I3?=
 =?utf-8?B?YWEydXZ3RXdJYi9Ccys3MnRkdEN5bWh6UFF6NmxSemhUVEZkMno3SUZjWXcy?=
 =?utf-8?B?SGx5SG1TRjgwYU9IYTUvdzFjMFlTeU45QTBVUDR6ZElSMDdVMXhtT3lTMVMx?=
 =?utf-8?B?b29YUW5CT08zbXJpSkpVbVdQNW0vM3BUUXZoNVBsdU52MFBQVEJ2dExJaUxI?=
 =?utf-8?B?V3VLSUxDZ3AwUE9sRXVHRlpMZEllV1JiUnFaYlVQYndmT0trK1JHQVBMMTAv?=
 =?utf-8?B?djBCMExuMlZCeWNMRitwYlFiWDQyRGdZUmx0bWFNa0d4NGFOaDltdFFQOXNS?=
 =?utf-8?B?N3VCdWx5emczcjh1OGRvNWVqQmxaTkh6K0lUQUM1VEtzV0RrOWxXczhpaU56?=
 =?utf-8?B?WFRWR3BJUkYzRjNkYXErSS96aWtGN3dLb2wyRGM1d1RKeERTNExWb0ovdEhO?=
 =?utf-8?B?ekJ2Z1YwNmhoOTExNjljamE4SXVvVW5ncWZjZEpEQ1J4bUwrVEltY3dhNWtu?=
 =?utf-8?B?OFlMSEVmTnczMnVKVHhvUGJodlhnbzB4QWlKdmpOTzVrRXY1NzJpQmtGQnJp?=
 =?utf-8?B?SXJEWXc2eTdMaGxqTlFSeERkbi9UMW1qL3FpakgzMGhucnBIa3cyWU1Ibk5V?=
 =?utf-8?B?Mk14SW00ejVmSjZ0S1F3U3lUVDhiblZKYVFrUnBSdGtlNlZKZ3pzemgvQXpO?=
 =?utf-8?B?WGlvc0tWc1MyRDM2WUd6OUNiY2xuYlovNU4yK1E5RzhWS3dVeDF0ekVhdWpa?=
 =?utf-8?B?Wjg3V2ZSY1BvbTFaR3I0WXNvT25PQkNxT29PMitrL0cra21TZjRxR0lONnVs?=
 =?utf-8?B?blQxK3k4ZWM5MnhOS1dxazdxaFlYWmRPN2pjZ2pvelpvNDZ2K3d4OHhrQUNE?=
 =?utf-8?B?cDUrRDFySm1kRjJUeGhXVmd6RldaNFhGcEV3b1U1Y0dKZVlEZGl3Rjlkb0lJ?=
 =?utf-8?B?U3FxTXRUVnlhejBQREZ4a3dEQlZVVllnWGU5eVFiZmp3dXJRdlRQYXovQzZQ?=
 =?utf-8?B?ZGRrdmpPRlk2QUszNTBtZWxhWmxNVStlamFZZDYvbnFQQXQ3VUtpaGNkNDlm?=
 =?utf-8?B?UnpDRXcwVmp2djBLQ2J2QmFNK28rYmFLUHpsbHhGTFcrRFM2Z3lKbzdkTnor?=
 =?utf-8?B?K1haTlB4ZWorQk1NRVYwaEU1OHNDcVc4ZFBKdWI1QXNRckdFVmg5WnpIdU44?=
 =?utf-8?B?WXA2SHl3SXFYcVRnRjRrOTBLV0VPOWRmbytQZFVRWHNwSW52SlFzeksyZnpP?=
 =?utf-8?B?bkMzUEc0RnNFakx3cHFUR1ZINFc1bGlJb2tJMjV1QSt2ejZEa3JrQng5ekNN?=
 =?utf-8?B?aytDamhIcnlOSCtLQkVmRk56SmhTQXBUZVJBYWt2N2M2NG9SRGcxU2k5M291?=
 =?utf-8?B?aEJIcXlLYnpoNkRBbnlDR1RQNFRMZjdXcjlNeDloNGY4TU4rYk40VGw2QjU1?=
 =?utf-8?Q?VgicpP7w+oBkuTqT7Kk/5Tvq3Hmrv0DcrwWWY+B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5090543a-96a3-4635-b7cf-08d98fc34543
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:05:09.4005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mx2bfplmRq3T83S5Y9ebUYZvTV9fQQBrCLXK62Pg1gWPj0hJLwKEl2aXGz4aLz4tC78eKOb2Oy4Bv1hyEUzHjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 22.09.2021 10:21, Roger Pau Monne wrote:
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2649,7 +2649,8 @@ void __init create_domUs(void)
>              .max_evtchn_port = -1,
>              .max_grant_frames = -1,
>              .max_maptrack_frames = -1,
> -            .grant_opts = XEN_DOMCTL_GRANT_version_default,
> +            .grant_opts = XEN_DOMCTL_GRANT_version_default |
> +                          XEN_DOMCTL_GRANT_transitive,
>          };
>  
>          if ( !dt_device_is_compatible(node, "xen,domain") )
> @@ -2757,7 +2758,8 @@ void __init create_dom0(void)
>          .max_evtchn_port = -1,
>          .max_grant_frames = gnttab_dom0_frames(),
>          .max_maptrack_frames = -1,
> -        .grant_opts = XEN_DOMCTL_GRANT_version_default,
> +        .grant_opts = XEN_DOMCTL_GRANT_version_default |
> +                      XEN_DOMCTL_GRANT_transitive,
>      };
>  
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -750,7 +750,8 @@ static struct domain *__init create_dom0(const module_t *image,
>          .max_evtchn_port = -1,
>          .max_grant_frames = -1,
>          .max_maptrack_frames = -1,
> -        .grant_opts = XEN_DOMCTL_GRANT_version_default,
> +        .grant_opts = XEN_DOMCTL_GRANT_version_default |
> +                      XEN_DOMCTL_GRANT_transitive,
>          .max_vcpus = dom0_max_vcpus(),
>          .arch = {
>              .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,

While I can see that you make these adjustments for retaining backwards
compatibility, I wonder if we need to, at least for Dom0. Dom0 doesn't
normally grant anything anyway and hence would even less so use
transitive grants. Of course then there's need to be a command line
control to re-enable that, just in case.

> @@ -1965,6 +1969,8 @@ int grant_table_init(struct domain *d, int max_grant_frames,
>      gt->max_grant_frames = max_grant_frames;
>      gt->max_maptrack_frames = max_maptrack_frames;
>      gt->max_grant_version = max_grant_version;
> +    gt->allow_transitive = !!(options & XEN_DOMCTL_GRANT_transitive) &&
> +                           opt_transitive_grants;

No need for !! here afaics. Not even if there weren't the &&.

As to combining with the global option: I think if an admin requested
them for a domain, this should overrule the command line option. Which
in turn suggests that the command line option could go away at this
point. Otherwise, if you AND both together and the guest is known to
not work without this functionality, domain creation would instead
better fail (or at the very least it should be logged by the tool
stack that the request wasn't satisfied, which would require a means
to retrieve the effective setting). IOW I would see the command line
turning this off to trump the per-guest enabling request.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -98,8 +98,11 @@ struct xen_domctl_createdomain {
>  /* Grant version, use low 4 bits. */
>  #define XEN_DOMCTL_GRANT_version_mask    0xf
>  #define XEN_DOMCTL_GRANT_version_default 0xf
> +/* Allow transitive grants. */
> +#define _XEN_DOMCTL_GRANT_transitive     4
> +#define XEN_DOMCTL_GRANT_transitive      (1U << _XEN_DOMCTL_GRANT_transitive)

Omit the former and have the latter be 0x10 or (1U << 4)?

> -#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
> +#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_transitive

I didn't even spot this in patch 2 - what is this intended to be used
for? Neither there nor here I can spot any use.

Jan



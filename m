Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9A5EF31D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413600.657347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqXV-0002Qi-2M; Thu, 29 Sep 2022 10:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413600.657347; Thu, 29 Sep 2022 10:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqXU-0002NX-Vc; Thu, 29 Sep 2022 10:13:08 +0000
Received: by outflank-mailman (input) for mailman id 413600;
 Thu, 29 Sep 2022 10:13:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odqXS-0002NR-WD
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:13:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2054.outbound.protection.outlook.com [40.107.249.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a5187f1-3fdf-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 12:12:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7895.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 10:13:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 10:13:02 +0000
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
X-Inumbo-ID: 4a5187f1-3fdf-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnpLKKgB7opppae7lPf1b3VhYqZKhWxG1tvB13HPVe7QUYBEP4tncH5PID4fRCP470N/O4hK1jqx7h86ZaQCkZ8Z9TQQk2ENX4r32RRelIa52XVAbq6CGBuKbgLXYjw75QOMpHsJloPjNclAEMRPimasr8GSq83vMC44B6Kxs6UVmRZzOvL7qB+SPzqfg3AOleJJ4iPgT03GV3M2UmJXVq9FrMTluj4VKOyHgTHl3bcVuoiXWMhmhmBzHVDIABqYRQA2oPsoguWPbJcLWD72SVRs9W3e2Htzrdm7G0DaxB6ACm7aJaDsCRK7D2+p8H+WRsUe71Z8oBXiAfOx6XyWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJZngrMWEoKajva0wgPHwnrMgCW/c9vOJB5xxRh7SaE=;
 b=QUG9mrR6GnBfSaaBJClkAvOUAtwjeEw8xqEBlJ2O8043yPVfr2P2ZyrguZgioXBS7iaKF1mgAK0Os/RpWwKOB/2SoF+JDy1VnBl8TkdteiopQV4ETV0C5tn4h9lhLNCnDLGl/zSem+J7qApdiFaI7Q4V0nDQN+r5aX2vFDpjDEC83EIo1Bwj53OxWjwIkubRZmEh9nsKkYlIvSeQD7SKjTlcfl4FWHw9UozXK4LiL0evHphmDEd3MerWwIb3Hy+wVqVPE/mV8c4/Oeey4G9Px0b48dkqLIyksKrHhNCogEkv8zNnd960XPEhcZRD+1Seq3D0DiL+FbiOv8MXnlbk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJZngrMWEoKajva0wgPHwnrMgCW/c9vOJB5xxRh7SaE=;
 b=y4PF+/zv4Wul8bjUirYKYQlYE2ajtBV1Ty12eGjUU3ZvSJCxgrHaWllXB8UfRoym8b7hVQ5+f7/B+nVIU0YoL2Bv+WM4SXRn3gTdFdd7uF03bBMuMRSSxwMNuoWAALZTFnW1MeuRoqxFwp+LHY8M49qvCU+FzNmyQDUdJda0NWECO5YJS4+Mhg+0dfjew8dGBj4pSvuDz2335VDapzODv+yJzk4wtLoHu+NpSb+xzLtxrWzyAg21EW7Q03FOeKu+IBqIk0K9jgs1D43fLePqfzoemx4HW+jjT10IgwdBukuNpCDkQpIGBrszcs33YpnDqli8W5AXRZXFoPRnipjNcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <576b8ac4-7ebe-e8eb-2fb8-2cb7f592d585@suse.com>
Date: Thu, 29 Sep 2022 12:13:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 2/2] x86/ept: limit calls to memory_type_changed()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220928141117.51351-1-roger.pau@citrix.com>
 <20220928141117.51351-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220928141117.51351-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1c1201-7052-4d31-7603-08daa2033134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P5eDTYX9FqhzQZveq3kX2I7nxXziQYn13lH4hvEREJXfhQ0VBVs1lbn3Q+m1w/g4PYNOLekVo5iHmtLgNIUy8JzPaYiQU2/orSebfLKkHeVbJqUjRbxb0Zu3EX8S6isU+onD1vGr+wbZrGDpz8mmPWC4Myu+y3r3xxwr7+mLidRTmGlG8Swt6B4vgbNuG6ZkBFKO0wP2BkhUjP5oyA76Sk9bm9znXTchNwR8kohM07rNtFrF9/mUQX7+G7ezKpd6oejxbVAaWHyktjs9hZ1NRMAD4qsA9mxyff9R+4kdcigTBxsjff2y/neMv223k2RktSf85WKdwbwMOMS32d9+Hl+RblhQavlqS0lKbBYGXv+f3egITt1stywnw9uQQ14WEghC0OnhFkrrS993WgkpTyV4zA+kjCEhnRSKwupRvolQGefxIv+tVBTr6PFZ0xsVkTOYuxjsK6JhY0W2d+Sw0c9FHKAqKltcl+tDq2f+Ke7sx02wzG+R4wAiFPb1KuxGrLlJMT8M11b+pfHGFJRC0Lm84oZwKF2XwZoii4acmhzEDl41fzEilVmQFy8d2lveIx84vEq2LSoc/JUuR+VFglkjymfWorkK80N3qRH+W4leEe/sYtkoGppOgqR/zeHa3EOgqPmXjOyLEwDDH8Idr243UP6XvPSiUGBlgJpz4K9mRXepPCQlFYtpxksEC94BvqWW8R5h5gSsSnYb/RTIiT4aX1mm93X8WqC8T8sB6QdUXnHdubUorZro9TipQzsfdgB4JlZTdCnDfjGeG2jiNmoV76eAtu4v1pJ+W5jjTIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(2616005)(186003)(2906002)(83380400001)(38100700002)(86362001)(31696002)(36756003)(31686004)(66556008)(66476007)(66946007)(316002)(6486002)(54906003)(478600001)(6916009)(41300700001)(6506007)(6512007)(26005)(7416002)(53546011)(5660300002)(8936002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE1KdVh6UTM5ZENXVGNwVmFJMHhWb2dKSUw1R2NBclZYTEwvQWZWQ0pkdDhu?=
 =?utf-8?B?ZmdiZkR6bktUN25ReHhRbGJreHRuaVRSK2txTk52U1NvWDB0VlNsWnJhWUVr?=
 =?utf-8?B?N25HM0F1REc0czVpOFRMelp4eVhRMFlCSUtpaVNRUmRPQWNwbVRNTzFYZEF0?=
 =?utf-8?B?NHJrZTk4UVZXTjZEaDA3dFJUdTNrYmZLMzljVjV0LzFGUm44blE3clRVSmVx?=
 =?utf-8?B?RnZVbGYyTDRWQ254TU92bEtiQis0RFptM1V4akhNYm10b2syd1hrREZoMWRy?=
 =?utf-8?B?a011ckcvTHdzTGp1bXY3VDNFZjVrVW9KR1hVaDFnQUhIWlpqeFpubkJnQUJR?=
 =?utf-8?B?L2thYi82VzdvTysrUzJRY1pxcUtIY1BlS3FiOFJHajJubVN6TTgydU9iRHVz?=
 =?utf-8?B?U0lZK2xudFVKMFRuNWlvV0NOUTFZVzlEeEtCdlduNnowRlZTeVg2Q0FrT0RL?=
 =?utf-8?B?S251RlE3azFuaWZ4RUZ1ZTlBTFB6Z0ZwUTQ2QTVLN3NsSXlqKzlJQ0Q0U0xi?=
 =?utf-8?B?bFIvTk9QVFRheTh4NlJUOWVBSW9rMk5MK0t0MlpKSklFWU5TVkNRSWk2M2Rv?=
 =?utf-8?B?ZHZhOGt2S0xaMmtVT3hSOGRaZGZKTnpwdnowZVB4blNzOHFJaVZ0QTNBT2lM?=
 =?utf-8?B?WDM5NGl3eUpnYk1RM1dGTFRvSUE4dWFCSUhzTkxhUW1DR1ZHTUFhQWY4OUEz?=
 =?utf-8?B?OFpDTVRDLzVhK2xmNmpDdVNlcWpkYjA3UlhCY1EvNkxnZHJUUkFkTUE0NW1i?=
 =?utf-8?B?YXUyS1piNHkzeG5VOXZlTmxlQkNyK0lPN1B0UkRJVWpFM2YvVlZOZURja2V3?=
 =?utf-8?B?L1lKUklPN3Q0ZkxnNUdqWWc1N0xJY0d5Q2JWaDVGVFhPc2hIamtvcDFCVnZO?=
 =?utf-8?B?RzdOS1VGRisvdXRvR0Z6aHJlcXpVNzZCYnNFbjlOSnpQTzI0UkxGMjNJcmFR?=
 =?utf-8?B?ejR3OGF1NzJIZVZtSWZkZHNUUXk5QlpEZjNSdGd6SDZvWC9IKzQreTMybzNq?=
 =?utf-8?B?ZnRDOGRtTUZmZUZ3VGgvejVMUExiS3ZtOUFsZytQV3JubWNaZDM2MnpoNHhL?=
 =?utf-8?B?ZmRxR1ZlUmpZMHFqSXc2cjRiL04zSHNYV3BCZUtDVmk5cXo0d0E5cFA3VHlG?=
 =?utf-8?B?em9KcXB0T1JUT0pTODJITnJRbVdTTTNiK1BFSitCRFd3RXNFY0cwYU96Rk1h?=
 =?utf-8?B?SWYwd2RoYUF4dCtzdytUTC9qdTl3SkU0VnIzbHJnbDZIbXdZaXRqUDU4WVp6?=
 =?utf-8?B?SnAwMGFpNnNDNlJpQVoxSVF3WTlUZWhMRGFRV3dSTFRMd01HbUFkbGI0Ly8v?=
 =?utf-8?B?ZllhWmJEdVQ4RnBwZEE4c0pCNlQxTW10bHUyRUpHZXR1OEF2SkI4WFEveFF6?=
 =?utf-8?B?K0wvZ0tvVFQ1c0ZZMWlhN3gyOTcrdExhckdGQUgzQ1dQUW04RlJxK0VocitF?=
 =?utf-8?B?M0NUeW9wN0QvRVYwQzNNbldkazNVQ05XU28rMmJoZW5OZGY2UzE2QkN0ODdV?=
 =?utf-8?B?Q1RQeU9QRUJhei9oaUFvOFE1NkU3OTkxbW1pR2l1alF5YWxFSW1NUU9XMXE4?=
 =?utf-8?B?NjRod0FKOG1SRllhWGg4bmVwU0I2Z1ppWjc1cEtUczc0MWRXZCszczhSckZp?=
 =?utf-8?B?eE90RWZpV2tySTJKWFp1dTZlTC9NMjJYeU9Rak5ja3B3ZUVHV1JidEFXL3Ri?=
 =?utf-8?B?SEljSGVkb1pHZ0xLZXBucjNCT3JzeWgyc2gyaEJvaVA0OExIeXhCV1MwY1RJ?=
 =?utf-8?B?MlBMRlRJZE1GVGJleThaQTBNb0dNajN6SXF1RUpNdjdLZGltTGFUL3V4SGVt?=
 =?utf-8?B?VUhJVTlrVHBXRFlvY2cwUFJvbGNRbTQxUGNPWEJQVWtPTFJDRkxBTXR6angv?=
 =?utf-8?B?RW55RDJySWxuTTdLaVFZdzRYNWdSbktjWmdQSC9TSTlEQnZNeDhOazMxNWVx?=
 =?utf-8?B?TVlWQ0c4UEY1YlgyaGk1S2o0M1VXaER0OTZPME5PV1BsMXcxdHN4VFBRVlNO?=
 =?utf-8?B?YkcyUHJ5U1p4WUorR0FaM3BhNy91NHUza1NuQTlKOXlkZW1qLzNISW5IdG5i?=
 =?utf-8?B?MW5vVW9MWU05d3N2Y0ovVFFadkhPNi9MZUtlUkxPWWhGZFhiVGhVRW12Yi9s?=
 =?utf-8?Q?Rz79ld5yTp8LxVkQnDL3rJIKu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1c1201-7052-4d31-7603-08daa2033134
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:13:02.1563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06hVF4Xe+Vuq0bgEDUFfuQPjg17N6UWQuGEYUtjWBUTBfQiTovgXc42Jujs9lK84A9WhgBDcINlJiDUGNv8teQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7895

On 28.09.2022 16:11, Roger Pau Monne wrote:
> memory_type_changed() is currently only implemented for Intel EPT, and
> results in the invalidation of EMT attributes on all the entries in
> the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> when the guest tries to access any gfns for the first time, which
> results in the recalculation of the EMT for the accessed page.  The
> vmexit and the recalculations are expensive, and as such should be
> avoided when possible.
> 
> Remove the call to memory_type_changed() from
> XEN_DOMCTL_memory_mapping: there are no modifications of the
> iomem_caps ranges anymore that could alter the return of
> cache_flush_permitted() from that domctl.
> 
> Encapsulate calls to memory_type_changed() resulting from changes to
> the domain iomem_caps or ioport_caps ranges in the helpers themselves
> (io{ports,mem}_{permit,deny}_access()), and add a note in
> epte_get_entry_emt() to remind that changes to the logic there likely
> need to be propagaed to the IO capabilities helpers.
> 
> Note changes to the IO ports or memory ranges are not very common
> during guest runtime, but Citrix Hypervisor has an use case for them
> related to device passthrough.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one minor remark at the end, which can be taken care of while committing.

> ---
> Changes since v2:
>  - Split the Arm side changes into a pre-patch.

Despite this I'd prefer to have an Arm maintainer view on this as well. As
previously pointed out the resulting code is going to be sub-optimal there.

> --- a/xen/include/xen/iocap.h
> +++ b/xen/include/xen/iocap.h
> @@ -7,13 +7,43 @@
>  #ifndef __XEN_IOCAP_H__
>  #define __XEN_IOCAP_H__
>  
> +#include <xen/sched.h>
>  #include <xen/rangeset.h>
>  #include <asm/iocap.h>
> +#include <asm/p2m.h>
> +
> +static inline int iomem_permit_access(struct domain *d, unsigned long s,
> +                                      unsigned long e)
> +{
> +    bool flush = cache_flush_permitted(d);
> +    int ret = rangeset_add_range(d->iomem_caps, s, e);
> +
> +    if ( !ret && !is_iommu_enabled(d) && !flush )
> +        /*
> +         * Only flush if the range(s) are empty before this addition and
> +         * IOMMU is not enabled for the domain, otherwise it makes no
> +         * difference for effective cache attribute calculation purposes.
> +         */
> +        memory_type_changed(d);
> +
> +    return ret;
> +}
> +static inline int iomem_deny_access(struct domain *d, unsigned long s,

A blank line would be nice between these two (and similarly for the
x86-only pair). Omitting such blank lines is imo advisable only for
trivial inline functions.

Jan


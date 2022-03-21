Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37E4E2340
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 10:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292830.497290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWEEt-0004dB-O4; Mon, 21 Mar 2022 09:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292830.497290; Mon, 21 Mar 2022 09:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWEEt-0004ah-L5; Mon, 21 Mar 2022 09:22:11 +0000
Received: by outflank-mailman (input) for mailman id 292830;
 Mon, 21 Mar 2022 09:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWEEs-0004ab-1r
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 09:22:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60cc1432-a8f8-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 10:22:07 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-JnFwAIxDNTKoUU8_VDiCyQ-1; Mon, 21 Mar 2022 10:22:05 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5306.eurprd04.prod.outlook.com (2603:10a6:10:1f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 09:22:03 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 09:22:02 +0000
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
X-Inumbo-ID: 60cc1432-a8f8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647854527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yfO0uyOzDUx57rQewKM942yUEIhHG+jMQZNgXKxOGMA=;
	b=al96JwmK0qcR/2UzvAw1HP8boWbdgATYFLxjDTyuiER23d+fFM0Umo945NN6sqQKeCHD97
	O6VshHPriwDBKKSbd9elw7Ap5ZN5AxAUReIW+kaCPh/J9yqqfh2ElbS+acn+6P1GQbLDAm
	2NUzRp5WKsMNhPNFkZ9IDetlJbX+l8E=
X-MC-Unique: JnFwAIxDNTKoUU8_VDiCyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Le8E05RVIZHJgbj6SbSuc6DubYEYiFux2O6srvDDtwhSZXgksg/2CTiOPraSe7W7OFDzHP4POuh/34t3axTxiv/oAdGj2ClpHK1vSaE9xwmBsg5qMzz9DTzkGHSrHEp5VhJvlHU5FfNeydUD2MozwdXe+IIqAapn3BOh60dHnkfN/vZlh5VWvKTDive2mFbLrcNRfi+YKCT6/ValU13fR1tQNX/wqRsO+EpfU0AExKYSMOc/ynyrv2DXykLuE2wuZe9/IjKFzVgMyqeRARsQBxk3g3Ohs6veV3pUMEsiQMzSXt0GBm+mY+sCzWgz6eEVlNhMONKJ/xjWZSjYOxhR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfO0uyOzDUx57rQewKM942yUEIhHG+jMQZNgXKxOGMA=;
 b=VBRnQOS8eknBI3OMQiLd11yQ/gtBaH+wDKkiD1LyliglBjEiuuJc23tlIKvT4zUkNuKtFidHcchkxVqhRiG+VANkn7UD6gG7UdQXfCOS0u8HrGpzuH5U5PhfbPlrVVwP6iTaezX8eeCnhkqcEU78MRXNp1rSdnmOCJSuv53tWXK8PHKo4RKJhLDataQzNwsjgNdIQPiNZ+612p719YiJuFZ7TJVDtP6XmninyYe04Zbn+HakuIhwpO90gJhKL9pVLziC8YZFhdqOT04QZJ32r7jW04NVaKAQl0XFqUgIGAFGlgH2Ye5dOswdzx4zCAMzVPTzn2ItbxdHYtFKUqxxLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb61531a-5482-3aab-58bd-84f99f21ec48@suse.com>
Date: Mon, 21 Mar 2022 10:22:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] xen: Introduce a header to store common linker
 scripts content
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220321082114.49953-1-michal.orzel@arm.com>
 <20220321082114.49953-2-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220321082114.49953-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0042.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 610ec041-fe6b-4dec-05fe-08da0b1c4255
X-MS-TrafficTypeDiagnostic: DB7PR04MB5306:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB53066AB53565BCE15CEB5CAFB3169@DB7PR04MB5306.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9z6dJOA+GxgqwPy5UA+KZfhjs87xKeVTDZz2NVH2FOo8+Dp5isHaLCq8knnLckpoXISF/YbrsXVI5BgLVO9leTZLB0HejxKvuWjo840iWazfhDfqEG3xKJtVNzwL6PxHSjKCYLWlgquNvl/hn7u+xmpOQQw4T+ymTGyAOGF2g2hxXpY6RkYHvx9tRiM0kgiRtbn0JxIOvBTEBzoqLGHD/LkJw67+c3ZfDRTt4Brj6jirN8zheRbIJacafYD0PLIYdW6razh13D9PuPnGnULrAt6Wj6cYUXLSja7YmdJWFAgF96x7/RQce/McoVxgm4fkKCvyDXtPewimR6izTSspc6QjMPXOAmUdjozq1VrYgOnPOv64327mm3rZTBOdnjqwYD7Lhz1dOhAZ7ZZWg9IsVzIOMkYHy3RLMyMt45bE2s0FW2WuGsZ+m8/eWdxBtvsx4Rtsjt4AW34uPzztLdRnwyApzdmbTY9Ved50hLitkBEIq/CnuXPXmjv4mk/1f8A7ofsGCIhcUr2RRA4+S3iuuCDMBhG8vD5yCdaU1re7jBEd+zGdqHrj0AVGwKJLDGqmokqLJ70srMZXSmFa/XUoX2NzLDy6wVYvFFpUHNZtSWx/fPxnuZrksHc+LR4e4+vn5RpEU3+ypIDOc8qqKzEsSNXqwIMVEEWQcbElf95cZmu4uBoiqVtCRcRzq4RFqHNowFVEbUsTyk/HIJKeDQNBfglJbj9uv13AOMqOt6ytD5kIDb/hf4ab6zPSwTs1z4v8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(8936002)(31686004)(6916009)(5660300002)(508600001)(316002)(54906003)(53546011)(38100700002)(31696002)(86362001)(6506007)(4326008)(6486002)(66476007)(66556008)(8676002)(66946007)(2906002)(2616005)(26005)(6512007)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBBYnJoU3J0YnFxWFVHTGJORzFEaWFEdU95RkxwN3c1UWFaZjh5MU81SUVX?=
 =?utf-8?B?TFlZV1VTTnlRQlJiL00yVXJWRENod1hWZkhKNUMzYlVpd3VUdkl2NDBRdEpT?=
 =?utf-8?B?dXBhcjNoY0JBOFYzdlVWbkNkeEVPbUdSYjRoNWMrMjdCQzBudVU2UGdWVzVV?=
 =?utf-8?B?MDc0L3dBVmhKVlR5dWwvaHFJdERGRUllRTBVMnhXZlZWREN3ZVEyNElROEVp?=
 =?utf-8?B?eGdiTEZIOTFSdFlMZG1zZ2h5YUM3S09RN0lkMkhnckdpT2FRWEtoenppd2Yr?=
 =?utf-8?B?RTdkbENuNEovYTQyeFo3MmNUZ05keVprNmJyS08xZVZrZTE4SnNTK3ltNFJY?=
 =?utf-8?B?eERqTmtUQTNDeGxrWWkyN3VMM2NCNThQMVQwVzJGU2JvNFdZdFVzUXhzTXVG?=
 =?utf-8?B?VTl4TWNQQ05BbWxTTFh2ZlF0L1RpWnlEVzNlcDlTZUZIRDB4TDhPZGxkQjM4?=
 =?utf-8?B?TE9LeHdCakQ2cGFjV3VCQnFUdTYyVHN6TVNwOFRUVVJ0OGFLV1IrdnRpZGVj?=
 =?utf-8?B?SlUyZTdDWXVNMkdmdnJ1STFEWDVmNVNwODBTRWJaWTMybmJYejNmZ1k2WGh0?=
 =?utf-8?B?QmpsZEhHWVhvU2cvY0pyYXFFRzBFUGVzZ0o0OUpCKzRFUUtUWHN0cWdTRjlm?=
 =?utf-8?B?YWdjQUN6WE8remU2N2JKdDA3U0ZKZ0E0MmM2endvWGRudUlDUzJwa3d3ei85?=
 =?utf-8?B?UGR5MUk4NkdmbGJMc3BkY0JGTUVUdm9OWk4rSXk3UHZXSzU4bHhYL2xWakJL?=
 =?utf-8?B?SHRpbnB5ZEp0aEJQdkVxSVdxQThxMUFQTFZmZEV6dklnZkljQ05ob0xkQTFX?=
 =?utf-8?B?WVkxRUptNHhVZCtnS0FYYnNHT05nZDltN0ZFYU43WVZUMzBXR1llWWM3eUZD?=
 =?utf-8?B?N3JaWEtpWDB1dXg5N1hLdHg1R1FOOWtXYzVqNGNsQi8wRmlGeEhKeWJrOHRk?=
 =?utf-8?B?OVJUZlRlNWordGN6YUd2MXlhaTVVdXBTUkxQOUdKa0JKVlJOU21xWVg1UzFL?=
 =?utf-8?B?cktLQkVtc1h1TDlsam9pWWpNd1g4YitBTXkveVJXbm52YXNYK0pXU096K1Az?=
 =?utf-8?B?bWxLQ1UzbzVIY3M5SW5LRnFYVHc3c2xOYm5XRDJxVitsa1IwV2Nqb1RjVk00?=
 =?utf-8?B?VGsxNHVyd1UwTEZCbVBxSWtkVlFQdG1jV05TNEV5alJBczJWYWpZK1U4VDZx?=
 =?utf-8?B?RTdJZEdGSXh1ZU5ZUFdLWmJnMjlEbUFlL0IzdmRhMmlDVGRJY0dUckk4aW83?=
 =?utf-8?B?WUFxR2ZWY2tYRnJ3Tjk1cnVuUEFxZlQ1aWhFcXdjd0VkT2UrMHFJVDJoOFlu?=
 =?utf-8?B?bzZJNHdJUlpyRzViQmFIZU41SzJySFFXU0Y3ck9xV2dEYjcwTDZFTjMzME8r?=
 =?utf-8?B?ZFlQaVFDaVVLSkRXMy9LN2JXNGh6OCtibCtmYkNTVDE4MVgvcmFtdC9Hak1W?=
 =?utf-8?B?ZS9zc1F1eGFqSitFcit0NXZtY0ZkdzMyeGYydDZ1Y1MzZkovZTBuSU5IbXB5?=
 =?utf-8?B?QndNZDgwczFXY2IxNVdIQ0FJTzM0VjQ5WU9uL1VwYXFrY3RrSjZkSEFxZVVl?=
 =?utf-8?B?L0JiWFVQQjBGOVNXN09YaTQySUdSOHpEa3FjOTVRTjNFWDRZSTgxZTVzWGEz?=
 =?utf-8?B?eEw0SkQ4RkFlS2pUV0JmRFpVOTlzQTFWcC81MWI5ZWx2cVhUZFVqN2c3UjJr?=
 =?utf-8?B?cDNhQUc2ekthNm9GU3JLSWFnV3V5MlZLa3VKMmx4WkR5NCsxa1VpeEpPMGJj?=
 =?utf-8?B?WllacStuSEhQN1hPcjdpV3gyVW1wZ0JMYmM4MS9oYkRlVnRqQ0lMRTYrb3dh?=
 =?utf-8?B?b0d3MlA3MDhyRnU3VkNvR2hZbnZza0huVDU3ZnFkZnRXYjhvaDZvZi94KzdB?=
 =?utf-8?B?MiszdHRHSWlTQmtsdnRzdnJqWGRnTEFwSWpKS2EwbHNUdEhmNEhqd1d0OUZy?=
 =?utf-8?Q?O1h8nbKUnFwoxNdLr7TrOemJgk7Ac2cU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610ec041-fe6b-4dec-05fe-08da0b1c4255
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:22:02.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPO1yL9kIthoWeF3no4Ez26y2e9SMAPSzoV8l2XJUT69YcBmzYpAjAORlyb0ci8uZKvlbkIdfZy59SMeLugmHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5306

On 21.03.2022 09:21, Michal Orzel wrote:
> Both x86 and arm linker scripts share quite a lot of common content.
> It is difficult to keep syncing them up, thus introduce a new header
> in include/xen called xen_lds.h to store the internals mutual to all
> the linker scripts.
> 
> Populate xen_lds.h with the first portion of the common sections.
> Some of them are not yet added/completed in arm linker script but they
> definitely should be. Please note that this patch does not aim to
> perform the full sync up between the linker scripts. It creates a base
> for further work.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>  xen/include/xen/xen_lds.h | 114 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 xen/include/xen/xen_lds.h

While perhaps just minor, I'm not happy about new files added with underscores
in their names. Dashes are easier to type. Plus, looking at Linux, it may make
sense to name this xen.lds.h.

> --- /dev/null
> +++ b/xen/include/xen/xen_lds.h
> @@ -0,0 +1,114 @@
> +#ifndef __XEN_LDS_H__
> +#define __XEN_LDS_H__
> +
> +/*
> + * Common macros to be used in architecture specific linker scripts.
> + */
> +
> +/* Macros to declare debug sections. */
> +#ifdef EFI
> +/*
> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
> + * for PE output, in order to record that we'd prefer these sections to not
> + * be loaded into memory.
> + */
> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
> +#else
> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
> +#endif
> +
> +/* DWARF debug sections. */
> +#define DWARF_DEBUG_SECTIONS                      \
> +  DECL_DEBUG(.debug_abbrev, 1)                    \
> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
> +  DECL_DEBUG(.debug_types, 1)                     \
> +  DECL_DEBUG(.debug_str, 1)                       \
> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
> +  DECL_DEBUG(.debug_line_str, 1)                  \
> +  DECL_DEBUG(.debug_names, 4)                     \
> +  DECL_DEBUG(.debug_frame, 4)                     \
> +  DECL_DEBUG(.debug_loc, 1)                       \
> +  DECL_DEBUG(.debug_loclists, 4)                  \
> +  DECL_DEBUG(.debug_macinfo, 1)                   \
> +  DECL_DEBUG(.debug_macro, 1)                     \
> +  DECL_DEBUG(.debug_ranges, 8)                    \
> +  DECL_DEBUG(.debug_rnglists, 4)                  \
> +  DECL_DEBUG(.debug_addr, 8)                      \
> +  DECL_DEBUG(.debug_aranges, 1)                   \
> +  DECL_DEBUG(.debug_pubnames, 1)                  \
> +  DECL_DEBUG(.debug_pubtypes, 1)
> +
> +/*
> + * Stabs debug sections.
> + *
> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
> + * be benign to GNU ld, so we can have them here unconditionally.
> + */
> +#define STABS_DEBUG_SECTIONS                 \
> +  .stab 0 : { *(.stab) }                     \
> +  .stabstr 0 : { *(.stabstr) }               \
> +  .stab.excl 0 : { *(.stab.excl) }           \
> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
> +  .stab.index 0 : { *(.stab.index) }         \
> +  .stab.indexstr 0 : { *(.stab.indexstr) }   \
> +  .comment 0 : { *(.comment) }               \
> +  .symtab 0 : { *(.symtab) }                 \
> +  .strtab 0 : { *(.strtab) }                 \
> +  .shstrtab 0 : { *(.shstrtab) }

Please don't add non-Stabs sections to this macro.

> +#ifdef EFI
> +#define DISCARD_EFI_SECTIONS \
> +       *(.comment)   \
> +       *(.comment.*) \
> +       *(.note.*)
> +#else
> +#define DISCARD_EFI_SECTIONS
> +#endif
> +
> +/* Sections to be discarded. */
> +#define DISCARD_SECTIONS     \
> +  /DISCARD/ : {              \
> +       *(.text.exit)         \
> +       *(.exit.text)         \
> +       *(.exit.data)         \
> +       *(.exitcall.exit)     \
> +       *(.discard)           \
> +       *(.discard.*)         \
> +       *(.eh_frame)          \
> +       *(.dtors)             \
> +       *(.dtors.*)           \
> +       *(.fini_array)        \
> +       *(.fini_array.*)      \
> +       DISCARD_EFI_SECTIONS  \
> +  }
> +
> +#define CTORS_SECTION                           \
> +       . = ALIGN(8);                            \
> +       __ctors_start = .;                       \
> +       *(SORT_BY_INIT_PRIORITY(.init_array.*))  \
> +       *(SORT_BY_INIT_PRIORITY(.ctors.*))       \
> +       *(.init_array)                           \
> +       *(.ctors)                                \
> +       __ctors_end = .;
> +
> +#define VPCI_SECTION             \
> +       . = ALIGN(POINTER_ALIGN); \
> +       __start_vpci_array = .;   \
> +       *(SORT(.data.vpci.*))     \
> +       __end_vpci_array = .;
> +
> +#define HYPFS_SECTION            \
> +       . = ALIGN(8);             \
> +       __paramhypfs_start = .;   \
> +       *(.data.paramhypfs)       \
> +       __paramhypfs_end = .;
> +
> +#define LOCK_PROFILE_SECTION     \
> +       . = ALIGN(POINTER_ALIGN); \
> +       __lock_profile_start = .; \
> +       *(.lockprofile.data)      \
> +       __lock_profile_end = .;
> +
> +#endif /* __XEN_LDS_H__ */

I'm not sure _SECTION is a good suffix to use in the four names above:
These aren't individual sections in the output, and for CTORS_SECTION
it's also not even a single input section.

As to CTORS_SECTION - I'm unconvinced of generalizing this without
first getting it right.

Overall I think it would be better to introduce this header along
with actually using the macros. That way one can check within the
patch that what you move / replace actually matches on both sides
without needing to cross patch boundaries. If you wanted to introduce
(and then include right away) an empty header first, that would be an
acceptable intermediate approach afaic.

Jan



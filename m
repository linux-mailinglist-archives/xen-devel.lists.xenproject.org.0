Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB13F8399
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 10:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172792.315301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJAVe-00050X-Gr; Thu, 26 Aug 2021 08:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172792.315301; Thu, 26 Aug 2021 08:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJAVe-0004yX-DJ; Thu, 26 Aug 2021 08:13:14 +0000
Received: by outflank-mailman (input) for mailman id 172792;
 Thu, 26 Aug 2021 08:13:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJAVc-0004yR-U9
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 08:13:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1446322f-2d1c-40a9-8989-72e5b8609346;
 Thu, 26 Aug 2021 08:13:11 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34--90rYP00PbSKyc-OmmovOw-1; Thu, 26 Aug 2021 10:13:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 08:13:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 08:13:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0080.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 08:13:07 +0000
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
X-Inumbo-ID: 1446322f-2d1c-40a9-8989-72e5b8609346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629965590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdcEZmaOcUppxVpKpDhiZgGDmoXT0mEZ+4TCEeTmcy0=;
	b=MdLj3b2tj+r4lmahhlcZgwCrCclroSB6kADsIQZ3eSI755vA3RNbUt8NAx8N6mv18GrXFA
	N/tnCy5iEpvCdZfTYR1G1hXamJ8x4G0/1gcfFbyGALu/GGfcnEIJOG75VHgx80oTcqDfMe
	WSx5+tuoNy7hsyQs6lmLPYa8dkDKb1k=
X-MC-Unique: -90rYP00PbSKyc-OmmovOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/qYbwJMoNgw9UYDSIW2a/l2Jm417L6WjPyongJIA3AKLcIHwcvszC5LwYcCUZWz0WiY49o9hrrBiSQT/A2fyg59ixIkQKqVR0cvbGNxii8XBh5TiqsThXA2PupPvolNlUhtwGO5bcq4GgRbchDZiBbkp5eG8ZUgu3Yh6ECrjnsWIwzzpqyf6mOb4G9IdnamK3OCM0JwjLe1iiv5DsvV5+/FBVeuQkXZgK2q2yaYQBuf1+MF1vvvLdZPU4xxpNuSVIl6+n8nH+jeBCGcIjTwpU0TLR/94BRWNZoFuLQXMLKSPi+y0nxfFqNYJTo9UXbm70Y3Zlp5guwxAJ57HOM0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdcEZmaOcUppxVpKpDhiZgGDmoXT0mEZ+4TCEeTmcy0=;
 b=Uzj4TV8PRBDsNOCC5gXf7EKBlbAtYKgZWvJm7+/evYZFxGvzGPQGgY7Y9G4uBEFF4/mAuLjHJ9KG72RtFEwpjYOPVlrXasMpCpPiyTT1ddci5TNFiwcCHl86D5df8jxHDs5+mHKHxNfnfk/sxYXQfYvVSgBpXrS4MzPtYD8XUhUEiDMCF2xV8Y2evK04kBqFyKpxo9Uhc9CMRZQDtRLjCrSGEpOj+NrW0iwvHhiy7zp9OB+bcsXniS6NeQ1hMa/tG9lXlE/4blB1A02/XhUiD7Mo9Q0Kcknxe7F7LqRCxFKwXK3DuH+PHJg7RcOwSakjNyX01AVPnp6gyYrLAJqNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 5/7] xsm: decouple xsm header inclusion selection
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-6-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e4471d4-7d0a-757f-1291-de6e93d1d6f6@suse.com>
Date: Thu, 26 Aug 2021 10:13:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210805140644.357-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0080.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac849dd9-8a0d-4d4a-656a-08d96869567e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB708702C3D615784126AC4410B3C79@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lqQhQoJRT0OZunvB+naoiTBdHANd1oXv7Nwd3eBcpeA08cbTT+fTdyqgwcx27nEVtu0dHekJFjm7rG2H4HMTkhxxdkwHlloQjsY1Og47U6evYjnsXiyyc5jKxtv3cMNAhMZnQPX8r23xqdzglJPI+xH5cCafNTmo4K2qe1uyXbj8UceQHi4S6BJtNbFkCuH27elrKHSAdZPHBPZ9N/8iULl4pVu4OEcYIsBXBkVbiWU6NnSSOEbtLWnSBt8dywJkfVtFdtr0gEhXfKIqh0kNYMb7KSReP/1upq9q7OU8BBLaJS+flPcn2PAUdNxGGvRq9IiWlD6YWdFUDq94feNG9jBYsIuNbg7GgFHFHY3ynXADuJ9bMGUxLpdq8SKEOht/EU466wLM0I56ztw2uWWynVMfiEGXNTpWQrLvql1eTAkFRIn2YQi5t9kMkzeDjqagoVWY4WPXQBJH9FljS+RQ6FNf/c9GeySy+J1OYsv8cet1+WqKOFUzaQPzcG2TdE1tCV1aLtNvB1NVcdn8g8T2Va28zy2TNGb5G3ZL0hGJ1o9bjTK8Dk2jC/eN5FF5cJP5mOdo528t89SvpEr8Qvnxqt450l3eJG44l5lm8tddwsDanXgw5eLAsup98H9jjhK9vdff3Mnae7RYOUXAocr8XWjy4fLN9EVMqW/KMD+RxyUJMK2Qgs1hHddTMzXLbHD66EzSfGeIY82DuUnnYJh9okw0iaIGDfW+J3OCcYIokvDTIuftiJzkw51qwvjMaRUD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39850400004)(136003)(346002)(376002)(6486002)(31686004)(66556008)(53546011)(36756003)(66476007)(2906002)(86362001)(66946007)(5660300002)(26005)(8676002)(31696002)(6916009)(8936002)(83380400001)(2616005)(478600001)(16576012)(186003)(956004)(4326008)(38100700002)(316002)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SERMMDFKWkVtdlNvL20wSk5mMkd2bmJFV1EyMzFEbXhCeEhCSmRDT3RnYmNo?=
 =?utf-8?B?RENRcHZ4Tmowc21nU3NrZloydmQvM0hUdTE4YW1xbk5oVlBGdTlsVWF2M0xr?=
 =?utf-8?B?VWJ5dlJCUVVnL2lwRzlUYnNVN1JhT2x5K0oxN3hKM3hXVTdVbzkyeHdSclQ4?=
 =?utf-8?B?ZG94VU9aVzJBdUZDQXhUN2lrbG9mS2p5ZktlZkRrNHNZY21sNHpyZnduU0JM?=
 =?utf-8?B?aXRmcmZUWUdRRnpTQ3VOTWVVRDJKTHoxb0dCN0dYMndFQ1cvcVRMaFVzdUYy?=
 =?utf-8?B?MVhSblhGYWdNZ1UvOGxkbkM0QnYrVUtxWWpIUGlPZTFBL2VkUDZtWTFFQnk5?=
 =?utf-8?B?MWpPS2pycExVbGJqZTVoMjA3OHRlWnIwcC9rYXdmSFU4RnkvcG80VTQzeGVC?=
 =?utf-8?B?OUR6L2FNdnBwcDV0d1hoelBrejFoN0NkRnZ4eEcvVWN2TlJ4SllCMlhtcExv?=
 =?utf-8?B?R1I2YjArY1crejBEdjJGZFYyTHd2ZzdxVVF1Q2ZwTWtwbXhUMDNvc3hJRkJC?=
 =?utf-8?B?SjJTak8yV3dsdit1YVl1WXZmdXJrc00yK1NBdHc0ZUI3UG84TitURnJod252?=
 =?utf-8?B?YnpxTGJEcHYraUNoc085MEx4NVFRckhxc1Y2ZlloQVJreStNYWRXaGN2UDdm?=
 =?utf-8?B?S2VGVVQ4NkJYWlpRa2NqaysxdHMydUhGV3JOSlNOTENrcmhvbVVNYklwTmkz?=
 =?utf-8?B?OTJ2Nkp1TWFNT0QyVU85eXFGditnV0t1dGJSQlA1eGVWS2Vyc1dLWmdtVjlv?=
 =?utf-8?B?YVBwYnhmZFdnY2hkbjVpdDVFeDB2Z3lxblBVMjA1em0vb1pJOTFpWVNYdFJE?=
 =?utf-8?B?QStOUjBMSHhMUzB1bGs5aVMydzE0and3TlB4N2tOWldJQ0FnYVRBdkdjNXJQ?=
 =?utf-8?B?TDJtU1Z4VW0wVHJLc0M1Z2NjbEFhQjA3UXkvNWM4RlZ1UldPWlNhWVo3eXJ0?=
 =?utf-8?B?RnkvUEZWU2tMK1NrM0pQdnBabFNVUUNCRXQyLzhZVENoZ0MrRjcyVnBuczFl?=
 =?utf-8?B?K0hYZjg1MmZYOVlFTEhoK3FCc3B6TkxpY2JlYTF3MGJBVzNLTGZsTXFLVWdy?=
 =?utf-8?B?NkQrZHNabWNJRWErbjhRb3FGbGJ3ZU5FdUsvemR6d3cza2tGaU1jV1p4M1RO?=
 =?utf-8?B?SDRXUEErcGZIUFRLM0QxSUlJYXZpaGJhZlRrT25kK1JFYU93WHc3R0xhNlJ1?=
 =?utf-8?B?dkV1d3g2THdIZHVsSlNwSlA3TXV1N1lMRFRZT2tDeTZSM29wYWllNmtiTDBh?=
 =?utf-8?B?aFFNdG1sVVJYN2RmQnRnRmh4enNNQUp5ekxMemxWbW1hRnUyeXpGb2VHRVFa?=
 =?utf-8?B?RmxDbkNwSElVZ0ZYSGovZ0lTNEExSWRKdlZoVW8rR3hKMFF1Y0x5RjNQcjg2?=
 =?utf-8?B?NEprOUZEU3h1NkVrVk8xYzBzWHJYa3d1VUhPcUkvZ2tjR1ZFaEd1YWNoN2Jz?=
 =?utf-8?B?dGUrQXlOdUVWbjVVWFlxbGdmdkh5NGZ3ZjVocHMwNTl3THhjdVNhTUl6clhE?=
 =?utf-8?B?SGVScDQzWDhweGY3b0ZHNjlSeUIrUy9ZdlU1dHp0ZUFEWW9nbTJXN0pOSStD?=
 =?utf-8?B?SERtdUQybGUweDJjdWt3TWVkcVNja1RrTGRWZDlKRjZIejFPMGtLcEdWeDlL?=
 =?utf-8?B?Z2VTTGRnOFFMaHVBdDJ3dW1FbGYzeFpnTEZtb05TRlNNdjd0OVdxb0s0VUJz?=
 =?utf-8?B?eVZua1AzVHowRERFNU9OSXJwaUFwL0JNeTcwSjFmMnNHVERTNysvbGlRb0Zx?=
 =?utf-8?Q?uPCoXHeo13ARyZCtGANeN4yQOdLc8MMURM3JSmq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac849dd9-8a0d-4d4a-656a-08d96869567e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 08:13:08.3303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCTUsed5grgWEeo5Uu+R2uKLtZYQuWCx56ogU0/+xtVwBWeLbY+2F2EjXchIxMvRCZTWRrM/bQtMoc9OAWxmZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 05.08.2021 16:06, Daniel P. Smith wrote:
> --- /dev/null
> +++ b/xen/include/xsm/xsm-core.h
> @@ -0,0 +1,273 @@
> +/*
> + *  This file contains the XSM hook definitions for Xen.
> + *
> + *  This work is based on the LSM implementation in Linux 2.6.13.4.
> + *
> + *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
> + *
> + *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2,
> + *  as published by the Free Software Foundation.
> + */
> +
> +#ifndef __XSM_CORE_H__
> +#define __XSM_CORE_H__
> +
> +#include <xen/sched.h>
> +#include <xen/multiboot.h>

I was going to ask to invert the order (as we try to arrange #include-s
alphabetically), but it looks like multiboot.h isn't fit for this.

> +typedef void xsm_op_t;
> +DEFINE_XEN_GUEST_HANDLE(xsm_op_t);

Just FTR - I consider this dubious. If void is meant, I don't see why
a void handle can't be used.

> +/* policy magic number (defined by XSM_MAGIC) */
> +typedef uint32_t xsm_magic_t;
> +
> +#ifdef CONFIG_XSM_FLASK
> +#define XSM_MAGIC 0xf97cff8c
> +#else
> +#define XSM_MAGIC 0x0
> +#endif
> +
> +/* These annotations are used by callers and in dummy.h to document the
> + * default actions of XSM hooks. They should be compiled out otherwise.
> + */

I realize you only move code, but like e.g. the u32 -> uint32_t change
in context above I'd like to encourage you to also address other style
issues in the newly introduced file. Here I'm talking about comment
style, requiring /* to be on its own line.

> +enum xsm_default {
> +    XSM_HOOK,     /* Guests can normally access the hypercall */
> +    XSM_DM_PRIV,  /* Device model can perform on its target domain */
> +    XSM_TARGET,   /* Can perform on self or your target domain */
> +    XSM_PRIV,     /* Privileged - normally restricted to dom0 */
> +    XSM_XS_PRIV,  /* Xenstore domain - can do some privileged operations */
> +    XSM_OTHER     /* Something more complex */
> +};
> +typedef enum xsm_default xsm_default_t;
> +
> +struct xsm_ops {
> +    void (*security_domaininfo) (struct domain *d,

Similarly here (and below) - we don't normally put a blank between
the closing and opening parentheses in function pointer declarations.
The majority does so here, but ...

>[...]
> +    int (*page_offline)(uint32_t cmd);
> +    int (*hypfs_op)(void);

... there are exceptions.

>[...]
> +    int (*platform_op) (uint32_t cmd);
> +
> +#ifdef CONFIG_X86
> +    int (*do_mca) (void);
> +    int (*shadow_control) (struct domain *d, uint32_t op);
> +    int (*mem_sharing_op) (struct domain *d, struct domain *cd, int op);
> +    int (*apic) (struct domain *d, int cmd);
> +    int (*memtype) (uint32_t access);
> +    int (*machine_memory_map) (void);
> +    int (*domain_memory_map) (struct domain *d);
> +#define XSM_MMU_UPDATE_READ      1
> +#define XSM_MMU_UPDATE_WRITE     2
> +#define XSM_MMU_NORMAL_UPDATE    4
> +#define XSM_MMU_MACHPHYS_UPDATE  8
> +    int (*mmu_update) (struct domain *d, struct domain *t,
> +                       struct domain *f, uint32_t flags);
> +    int (*mmuext_op) (struct domain *d, struct domain *f);
> +    int (*update_va_mapping) (struct domain *d, struct domain *f,
> +                              l1_pgentry_t pte);
> +    int (*priv_mapping) (struct domain *d, struct domain *t);
> +    int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e,
> +                              uint8_t allow);
> +    int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e,
> +                           uint8_t allow);
> +    int (*pmu_op) (struct domain *d, unsigned int op);
> +#endif
> +    int (*dm_op) (struct domain *d);

To match grouping elsewhere, a blank line above here, ...

> +    int (*xen_version) (uint32_t cmd);
> +    int (*domain_resource_map) (struct domain *d);
> +#ifdef CONFIG_ARGO

... and here would be nice.

> +    int (*argo_enable) (const struct domain *d);
> +    int (*argo_register_single_source) (const struct domain *d,
> +                                        const struct domain *t);
> +    int (*argo_register_any_source) (const struct domain *d);
> +    int (*argo_send) (const struct domain *d, const struct domain *t);
> +#endif
> +};
> +
> +extern void xsm_fixup_ops(struct xsm_ops *ops);
> +
> +#ifdef CONFIG_XSM
> +
> +#ifdef CONFIG_MULTIBOOT
> +extern int xsm_multiboot_init(unsigned long *module_map,
> +                              const multiboot_info_t *mbi);
> +extern int xsm_multiboot_policy_init(unsigned long *module_map,
> +                                     const multiboot_info_t *mbi,
> +                                     void **policy_buffer,
> +                                     size_t *policy_size);
> +#endif
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +/*
> + * Initialize XSM
> + *
> + * On success, return 1 if using SILO mode else 0.
> + */
> +extern int xsm_dt_init(void);
> +extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
> +extern bool has_xsm_magic(paddr_t);
> +#endif
> +
> +#ifdef CONFIG_XSM_FLASK
> +extern const struct xsm_ops *flask_init(const void *policy_buffer,
> +                                        size_t policy_size);
> +#else
> +static inline const struct xsm_ops *flask_init(const void *policy_buffer,
> +                                               size_t policy_size)
> +{
> +    return NULL;
> +}
> +#endif
> +
> +#ifdef CONFIG_XSM_FLASK_POLICY
> +extern const unsigned char xsm_flask_init_policy[];
> +extern const unsigned int xsm_flask_init_policy_size;
> +#endif

To be honest, I don't think this belongs in any header. This interfaces
with a generated assembly file. In such a case I would always suggest
to limit visibility of the symbols as much as possible, i.e. put the
declarations in the sole file referencing them.

> +#ifdef CONFIG_XSM_SILO
> +extern const struct xsm_ops *silo_init(void);
> +#else
> +static const inline struct xsm_ops *silo_init(void)
> +{
> +    return NULL;
> +}
> +#endif
> +
> +#else /* CONFIG_XSM */
> +
> +#ifdef CONFIG_MULTIBOOT
> +static inline int xsm_multiboot_init (unsigned long *module_map,

Nit: Stray blank ahead of the opening parenthesis.

Looking back there's also the question of "extern" on function
declarations. In new code I don't think we put the redundant
storage class specifier there; they're only needed on data
declarations. I'm inclined to suggest to drop all of them while
moving the code.

Preferably with these adjustments
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan



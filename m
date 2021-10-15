Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41042EDE1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210038.366744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJh3-0002tr-Jq; Fri, 15 Oct 2021 09:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210038.366744; Fri, 15 Oct 2021 09:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJh3-0002qe-Fu; Fri, 15 Oct 2021 09:40:01 +0000
Received: by outflank-mailman (input) for mailman id 210038;
 Fri, 15 Oct 2021 09:40:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbJh2-0002qY-Bw
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:40:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc018572-2d9b-11ec-822c-12813bfff9fa;
 Fri, 15 Oct 2021 09:39:58 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-SZqKm_8mMPqclDzGmBwqNw-1; Fri, 15 Oct 2021 11:39:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 09:39:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 09:39:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Fri, 15 Oct 2021 09:39:53 +0000
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
X-Inumbo-ID: dc018572-2d9b-11ec-822c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634290797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIAWWs9j41bH0x/Er5tH9xUdRz2opxoNRR4Bc7MFB28=;
	b=b0FgGTdddwPEAbjhyWlK4M0VEfqNQfQWxMuqp8fi5MShODZOWrHNlUz//A3ev0OMnzDk3u
	Wc4pUgniuT50B6B9T3XoU3rRzRZ6a125bEVLlxQxFXWUzHEGAgSAu2JTz7WsQ+oF9IORUA
	luUCWPqrGK1tGgnlfVr5fsCh0+1QHWw=
X-MC-Unique: SZqKm_8mMPqclDzGmBwqNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JM6jmeUGQBsAc3IFlQf0xnjoyX43uBSq3aquXCFP6Ie+VdqNf+E2K9JA4Br+nH4Fhmi9Htg+SSD/GN7lthiN2jDN3hy0S7LOhfqhhHTLRTRyAcebaIxf/vqq+Z17xce/aFnjZ7J4dIOcHWVc6j8SndDwvkZa8GGjTRDjrEOUz4PAohjGbOlwfnTQ55W/uNefem4KYFqar14it31CmCbP6Yhz/w65Tgj4cHxGUkabLqPxUs/dX8eytY7l6B4Z2bcoOzkwCBuhtdj9+e04D0CjIVGzathDm3caK7VSy+uN6q2qFqZwBiRdsnSbd2ZEA2a+IWkpH7B4dftP0nAF7OFyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIAWWs9j41bH0x/Er5tH9xUdRz2opxoNRR4Bc7MFB28=;
 b=Qvp6nB1M4DNfPBeh2sQ4to1JJ0crhiabpWyInN+hmgicaW8FkB8Xz/n11U1ZZ+QbokOcrWjHvF75koIn4HD53x7lbUB0/QJFSH11f2/JJWP7ZMdWVltRHAu6thVn21e5RG31x9Q/pucV5IrmvRZkiTbsiXQU+63tT0v2Kz0sHtBwZTO6S+gNG5UCutG8vrA3dBIVOPcAzOA5088nImWSEDiIRRyTJh2Js1RcKZcKeQIET3raft27QlJwcCIjoUCiS+TQ1tV43ATaz0hRQdnSInztNbHHM39fTs15PySwOz+oTFtDcdwIJy4Lhjg2jPStQ7mV8CLNi7SpWiKx2k6omw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
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
 <20210922082123.54374-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5564634-5f9e-0b94-f73a-d44ae65c30f4@suse.com>
Date: Fri, 15 Oct 2021 11:39:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210922082123.54374-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd3deadd-e014-4de4-c093-08d98fbfbe74
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448D7701F2F322F46611FEAB3B99@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TaOV4ogJ7CjFZeBAE6zvMw2gkKI+Hrck0a2hksjziNz2ppL7CdRpLrLvTq6Ae8z4PnzGQ0MG0VcRT3/8LCILwS260gQlK7TdH9BCaLD8Jp+dXe6FKqfwZ4IgWrkNSRWEQ6ISsto7Biwm9D91Ci4k7w30aULuK2Xgua5X/rbCmubj8vbgayJ7fgVPDxkkFR6i0bgep9ZLjzTcdtsBw7bcavoqD9nLjqkBSHPheNnvTWamSg9XkDwSXRPyYGo3YcpUnVTtMgJwOJXJd2rP80v/rlI+2zX9J/ocJlL4TASNBHJlkkPTEsRD4n64M7bw0jmiOhqD/TlrZZp77N+EAgbdQP/iK11iQFLk7ebBcMZJO/sjFiQugMROvLlSVhPpJFCzD07oRIcvPhIAcnit1vR0EpfXLtJCRuZKBQvhwlBjuedKDnEFYM6a9uePi8czu7/96BlOrCfd6PflZlHefweklCRTfepmQOjgcsDebnnDH3jzzyNxWFUpRLwJApr3CujIQj8rNSJ44wf7w9P4rdkAgjrSTtzChXFbqboE/yfvFRDB12zB58OZH6yYdqHpMiUqwld/6ZTc0UcQgwMlw1Sbj5W2fAl/jOsF7Zs68HNn8FUgFukNMjN22A1uQ0/2XzCh1ReQwu6qCqQ1MvCpxPkY56w72qtqBMdN88sDeFSSSlSlKsqvpoje1DmP5K/CbO2KPXd/kcIVFx7RNIWXOxJAy1aieURKDY7YLvnvY9mMtWWMEa7EkKaRvEGZxCuRCDKB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66946007)(7416002)(31686004)(186003)(66476007)(38100700002)(6486002)(5660300002)(16576012)(508600001)(36756003)(8936002)(2906002)(54906003)(53546011)(4326008)(2616005)(956004)(6916009)(316002)(86362001)(8676002)(83380400001)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1wMUo2OER0NkdzTlMzUlRvTWtWSmd0SlZFSUNNQ1YxUVhjajQ2RVdqcTNz?=
 =?utf-8?B?SGgvL09CT3F4VVFpY1dSRlQxak5CVFZORkMyenpZTnZ6T1JkSkhEQVFjNXJj?=
 =?utf-8?B?R1gyUHFJZ0hvbzlmWmlXbytORE5iQzZBV1pvcnpPRkwvaStxZ3c5QkhSTHNa?=
 =?utf-8?B?L0RQR0ZMNUlPeU9GdzFPMFBXUDlrWVRYK2FIbWFHdmw4Nks2WlpjNkdTWUht?=
 =?utf-8?B?Y3lkaXp6cS8zY3pmNkR1SnlrWEl2UTJEK205NDc3bnpiUzJXazhncHIyUTJC?=
 =?utf-8?B?RU1NY2RwNlRITUdvQytrUyswSjk0WmVFeFZCYmNBcmVReWhOS2NzeFg3Zkxm?=
 =?utf-8?B?TjRQMmRudm8vSUFrZnVyUmlsL252M0pnemJ4K2ZOVU0yUjZNNXpHd0kxZThY?=
 =?utf-8?B?VmYzNzNIdmVrYmtYNlkvWk9tZUFaaVRRQUtkci84ZEJvUmg0V2lIRGlndlRs?=
 =?utf-8?B?cG82aGtCMUcvWmlMUnhScFFVYktsWGE1MmJHL2NOeXBQOExqZy9nNC95UzBy?=
 =?utf-8?B?WitoMnRZU2g1T25LWWxjN2dFK1M1ZUF5OWZHTmZLR1JBVVZQVHJNbk5FZTZS?=
 =?utf-8?B?MGJVVUhTWkFMUHRYRk43OUFFUkordXBKSGNqNEladGVlY05vWkR5M3VGeW5r?=
 =?utf-8?B?VThEL3g5UHJCOGdOTi9VQzdzcDRkMHZjVGtad1FTWDlDOTFOcU9meUp0b2R4?=
 =?utf-8?B?cWRPNFFHc211WFpzd2luc3hEY0xtdS95Z0pVNWpRZEh0dG5IUCt3MDNySU0y?=
 =?utf-8?B?d2ZZYUQrU2U2VFlURml4K09JTXE1cU9HbFYxaWdvMGZnWFh6NVhjY0hLQW8v?=
 =?utf-8?B?ZkFzYWo2a2tXQTVBRWRqWkZTUWdZeHJaYk5JVDVYbUFSNDkrNXpHbmRCTmJR?=
 =?utf-8?B?eGZZRjBvWEczWkdTYkg2NDNmVWNEaTErdEVaODgwZDBWOFo3MzF4ZWE3bDRN?=
 =?utf-8?B?ZGhVZXFab3ZVT3l4VnZTNXNvZnJLbUVyS0k3eW1FcFQ4aWlXWk9jNW5VT0hY?=
 =?utf-8?B?Sis2Y3RHZXhMY3pLSEZCR3gvbk1BVEpuVm4yQXU1OTJQYlVhekJUQ2JTcGpT?=
 =?utf-8?B?dmJWVDZ6L3dZSWRBOVE3a2hIUGxsMU50dE9IZWZGQjZ4ZDFuMThiV0lRTjkv?=
 =?utf-8?B?OS92eHU5azl2ZmY3a3d0SkNUMnhabysrREpYK0p2Y1ZrV0ljUHZ1SjRjcXRF?=
 =?utf-8?B?YWcvNDFGOVJQQUdDTkR0ejdxdHJubWZzT2VqNzF6dXdNY1g1N2dyZFZvOWtI?=
 =?utf-8?B?cDdEU3ZFSEIwcUcwRTdMU2Fqc0JORnV4eC9sWjZSaHZLTXBaRkVNaXJPTTFJ?=
 =?utf-8?B?MkdRY3l6VmYrMzdTYlB1SVprZVNhb1hIZllCa0xmNzlMMmYyLzhrK2dWcWZ0?=
 =?utf-8?B?UVJIWUJ5eitjUXhwNll4VFp4eFJtM3RxRGNMQ2dzUU9ybWp5dmh1ZkxVYm5L?=
 =?utf-8?B?MnJkbWtVWEI0SW1NTHoxaXRvRkJkSU1jcEliYkJhQlVtSzZZV25LaEg5NFI3?=
 =?utf-8?B?dWFJV0diZmxLT3dFdUpZN2ZwL1huVVhYWUV0U2MrVHFNcG8xQlpUaVhXY0hT?=
 =?utf-8?B?WmpLVk1Ebk9kTVdwaWZTeThsSjJ3bERHTVRxWXFaVzNYSjA5Mys0S3VyL0pa?=
 =?utf-8?B?QWxjSlhwSVJBcEpNQ2NaaUlFeTJ2Z3FWU3BDR2oyS00vMzAvR3ZiWkhEQ2FV?=
 =?utf-8?B?dysyWEVUdm5MUEJPYVR6NEdjT0JwL2ltMWU1aFEvcEFZSGs5TWVDOTFHSUNu?=
 =?utf-8?Q?pWmEY9pyBTPo3sqJTrDLlkfNJgSe6OuqTi2QOsV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3deadd-e014-4de4-c093-08d98fbfbe74
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 09:39:54.7733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9fZAWL6i7YNwoCnW9Rv3GjjksiqbJhUyO34H0LUJI5Hp1Ky6kwJfB5Ug6SzqO8izs53nhN8QUfNtLSXclwCbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 22.09.2021 10:21, Roger Pau Monne wrote:
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -53,6 +53,7 @@ struct grant_table {
>      percpu_rwlock_t       lock;
>      /* Lock protecting the maptrack limit */
>      spinlock_t            maptrack_lock;
> +    unsigned int          max_grant_version;

Nit: I realize the version field also has "gt" in its name, but just
like I consider that superfluous, I don't think "grant" needs to be
in the field name here.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -87,14 +87,22 @@ struct xen_domctl_createdomain {
>      /*
>       * Various domain limits, which impact the quantity of resources
>       * (global mapping space, xenheap, etc) a guest may consume.  For
> -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
> -     * default maximum value in the hypervisor".
> +     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
> +     * means "use the default maximum value in the hypervisor".
>       */
>      uint32_t max_vcpus;
>      uint32_t max_evtchn_port;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;
>  
> +/* Grant version, use low 4 bits. */
> +#define XEN_DOMCTL_GRANT_version_mask    0xf
> +#define XEN_DOMCTL_GRANT_version_default 0xf
> +
> +#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
> +
> +    uint32_t grant_opts;

As it now seems unlikely that this will make 4.16, please don't forget
to bump the interface version for 4.17. With that and preferably with
the nit above addressed, hypervisor parts:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan



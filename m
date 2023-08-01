Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939A76B803
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 16:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574346.899599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqhl-0005Ma-Oa; Tue, 01 Aug 2023 14:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574346.899599; Tue, 01 Aug 2023 14:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqhl-0005Jz-L1; Tue, 01 Aug 2023 14:50:33 +0000
Received: by outflank-mailman (input) for mailman id 574346;
 Tue, 01 Aug 2023 14:50:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQqhj-0005Jr-VB
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 14:50:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1e83bdd-307a-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 16:50:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9865.eurprd04.prod.outlook.com (2603:10a6:10:4f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 14:50:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 14:50:26 +0000
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
X-Inumbo-ID: c1e83bdd-307a-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB5X9TaytQilnF7vBZiIiZ40c4ZHlcvtsQNSjcq8lcLgWcdrvNzEOh5GOmIuSD8FfnbROZCy5QcZk2rIeySQq+z910d54Mg50c3e1F13iMxD97ZhFGaZSxzW3APRGw196ZNe6pR0HPqh27AJrhnm4BUEuYWIp5vXx7S67HgIHePRxLbfImnIOv/z0StGEHw4qv1nDcdX6FxF6wwGkutnFUqaEL7fxU2/T/tbvOiAiycy1PrXVBVjSMGPp2CHIFba/iox2Rj4uKWzMdliEvi1ZhaNoCUPymPBYk3BvaYxUHDFSaGU26dYuXaVCx7B4Mc38Aba9rRic1r11P0ewtk4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gs1JOrX2quhXPpOm/hsB2Y/9bXV8kVqK94dVS7bKTWY=;
 b=NvbooTn/81BL+u/Fsrd7NLGr0MA+cyzCepFKahPBbtjTRjOKWVFG9D8OF3G5XXEfa+hUddd+CsxLDL4UJFlAfjQeFk6xSwIWgz6uwikRh1uag0RxkpuaxKLvYPLd5ef2vjLi1Q6ABr2vLdOAG5H3+V8BpgI3x3K3oBsJmxdcEaiWXW5l1xIHWydi9Rql4JwjHgKuhbvrT1V87/ZI/rtVeEwKWGDq/3jpA9HYu9ItxSCRwgHGOPCbi5u/ftNhOHE/zyD07eqZ4B2Cv+U3oK6we8BhZBAdXs2Lp4Mm2TZyUewudJW7VQe4aFXLgqUVQXIqPip/av3xFs2LyDEoAijyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs1JOrX2quhXPpOm/hsB2Y/9bXV8kVqK94dVS7bKTWY=;
 b=ty7GkQnZ6CmF2EyRnSGPi4N6ArshK71Sq9G6tLwY2arTodLQEul4mndiTxCyvIeVw+1C1G+4VKOA3r+vDQhsTbUcsSJUFoCTJPhLe9VNAn3MUuPe+5JTOWyhBIKKYb1lV4GpGRpYuoD4FlIS/9gPnDxz9P9B84FFzbJp+YYGgZqmI3vz9x72Mgd303DBeGfW3nkLgywXsmOk9f3SOqd/K7P6WWDAQGtFFLB8kqsiQE1kPJeEXkcghACQGy5nK/en/Y5um3nOoVGCYlJ7wrft6oOgkBw/XkQ4JC3+gn/uG2MEXJrtARdrdLPDN3I6h2Toa/oZU5hGItyGzqbJLez+RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45d03ac2-94f5-d05f-fc7c-7402b3e6eaf6@suse.com>
Date: Tue, 1 Aug 2023 16:50:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v6 2/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1690899325.git.oleksii.kurochko@gmail.com>
 <ba5b82958dd7e0a144f7534105bf1e5e61541204.1690899325.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ba5b82958dd7e0a144f7534105bf1e5e61541204.1690899325.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db133a7-a86c-4f8f-36ca-08db929ea49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n813i/UfYW88ZEb8cdnvHSb/Zq50TvwpSBLUMY7uT4OXeY/7K85gk5zkw8tc7u8IgkeNYowhB2zdW1oXKHVFFez+eiWXUTKB12mMX4RTJkFsjrtw/1bNQ8LgrjGcwYnBq8gh0ZXF+1tsGguYzKCgQ0hulCLja0IQyy5I5PeD7EawoV/JYxxEto92kJjeoW/esm5Yc1K1gJyRdcAAcd8rcdBDXqKg5UmDx89svWKXm60u0e7TU3NDiiaq4QtH/bUBRdlb+Rx499gVypsyhERB6zpgZmy5akFQEAMl1QRlh2WeAjvNiWpfBBCIyWRjhZOf93iYkBN1JI5ZCe/TiRCaiAcddD6IeFCIxgvzhK811egPY9nxkgrfADy7sKtM6yukQ8fkFELubuxQGK0h/Njt6wTLVqpPV4rFwB1rpLlgMnPVXFAhwPIQfCxe3/cGQZfkCIKpcDjMf+n401jXqGlX8BstommZKLAxq7bOO/i8CjAVpRNhqsDTUMFzEHmuZ6ZDZ7ckEImTosOhjykB/Axu3iE51/BZvhgHRyQCPRedqVENHvxsoVxkX8yuHWiq1xZAWdOyNo06ubfuz4kU6GpqwX94+A4qbaqax+HLrgDed6/ONpZs8ADfsTIK9ps/MjbaheFXarBbic0J1NodndFoHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(2906002)(6916009)(4326008)(2616005)(4744005)(186003)(86362001)(316002)(31696002)(31686004)(478600001)(41300700001)(38100700002)(6512007)(54906003)(5660300002)(66556008)(66476007)(53546011)(66946007)(6506007)(26005)(8676002)(8936002)(36756003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXdJaFdqUTVPRk9MNlVtSzlxQ1NOb2ZSYjhWQkJLTnR0MDh0RGFRT2s4Tksr?=
 =?utf-8?B?bU5uRXYwR29qeDFLVFc4a01vdUsya081WXUzd2tmY3FzOFNsK3hUcGIzcEtF?=
 =?utf-8?B?cEFock5zc09SVmt1UVZsazZhYjZRd0FHU0ZDb2lzQm5XQlhHdUNWZTNGdHlR?=
 =?utf-8?B?bG5QTERGeGNBWHBoOXNHcFVjMldpS3dZTENZTDNqTDgrM2pFL3J4RUFlUXoy?=
 =?utf-8?B?NTQ0KzVXOGJwMk96WVRNWE0wRWRHc2xDdjhGMzNNeUwyUG9jR1lIdjZxMGdm?=
 =?utf-8?B?ck1oNk1DWWtZTzA0Nms3OVJBSWN4UFZKT3dXTDF3WUo5ME12VWVKakVOOUUw?=
 =?utf-8?B?Z1lhV1ZzRGUySnNKUXVvaWIzb3hqYWZhcmJtb0gyL3YxUHdKTHBYQXRtbjc3?=
 =?utf-8?B?SithUVB0bndKOElON1dSSjBqL3ZhbzdLbythNEpzMm5tZytlTnpYRmt5enpD?=
 =?utf-8?B?Qm5RNittWk1UUnhFWnhBcXAvWS9aaTlzcjhyWnlVaUt3VTI4djhXY0xabnpK?=
 =?utf-8?B?VUhFWll2a1YxanpPV3RLWUlUZGd6Y2lEOGluNTZyVW5nbHBkVitYa1BGcW0x?=
 =?utf-8?B?VTlWV1VIdldnNHhsT2wxdjZ2MXhpblJQbGRSR2NzOHZqclUxYVJHYmlBVmRr?=
 =?utf-8?B?TU5JME5ONlc1YlJDeFlEa1Npc2t5S1lDZFh6Rmhad0U0NFhyTkNKS3EzUW55?=
 =?utf-8?B?Ny9YWmRRbTBwT3J3d00zb2ZaS3M2MFRHbHBINjZOUnRkZ1VITnpiSlluRkZy?=
 =?utf-8?B?S2E2WElNSGxScE1xeXQrMHZaNVpMT3k5dmhhUkVvY1lFWmlHY3ZnTFBhZ2Uw?=
 =?utf-8?B?ZUhMYm5heUZoMnF4WHNNbGFqakRGR0RET3JWeUxHR3Y3alJ6S1BPck50WkZV?=
 =?utf-8?B?SVRpT2ZhVEdNdXZwQU5NVUdCMkI2ODIxZjErWGV2MGljZ3VBUWRzMTFOcFoz?=
 =?utf-8?B?aDN4VWNXaEFNWVNEdVFyampBVjBkVFdUTXFxbTVYRlRwcHpLdXpzU0Iyc2o4?=
 =?utf-8?B?WG1TMEdqTDFhOCtNeDJRNC9uby9hZXMyNmxiUW5YMUg5bXNTdDhuZ3h1eFNN?=
 =?utf-8?B?V1pqckdWQjJtdkZmT2hMWVhxZG1aVnBWVk0weFhOYkJ0NmxTYU1YajVXUmN4?=
 =?utf-8?B?VTIzVDh4TCtoOFRrT3RZRzAwZzVNOXhMWE9oTzZtenREcitSMFNZbE9GaXhQ?=
 =?utf-8?B?OVh3YW1YMDRlNThwRWpnRkV6b3VsQ0JRbWI5cWJnU2JCYUl0QzBLUXRya1NT?=
 =?utf-8?B?L0ZlMzM0cnBqMkMwdlp2VDl5eG1JeUpOZDJEMk9vOU9ELzd0clBNdjlnSmFq?=
 =?utf-8?B?MXlRRnlGVlJvbk9pZEtldWpuVDgyc1RlWWRHeDlMT0pEaWJwMGFmQ2R1dzZE?=
 =?utf-8?B?OWVlcDFvbU9iODl3RW9hdVRWK2lqUzFtc2s1YTU4ZVZDakVTbGNYTzhKVmRP?=
 =?utf-8?B?dC8xN2craXY2cXNYVGwwT0hLMmswRXd0b2ttdFg2UUVua0ZNY1FqNWJsalhj?=
 =?utf-8?B?U2lzbnFsbkUybEhqenFhR3d3NmhoVzQrVmx6RDNJOVFuTjd0OXdUbFpUZmpw?=
 =?utf-8?B?bk5lbjJuYmJvdnBlRFV3T1pDSDhRZzdya2p5YmRLT1VjWGRHQSsyODJuV2Jr?=
 =?utf-8?B?TGJQUnM1K0U3VE12QTVUb3BqVmlmU216U3NyQndJQ2JSMFZSOGx3alowcWRq?=
 =?utf-8?B?ZGdiL1kwR1pxMWxxbW9WM1ZFazg0dUV1UHZsUnhkZWFCZE5RYS9Ob3RhY1hi?=
 =?utf-8?B?aUNrL3FXTitQM25lN3Z2emdhYUh1Skd4RW9sZktxMjUyOFVhbThCZThOYmhK?=
 =?utf-8?B?Slk4bi83aE5tdWdwSzNGQ25naGptSDFITnU3bG9MKzcwZmVVMWVEVzNCb3lt?=
 =?utf-8?B?Ni9WblFBRzhRWFJXR0FmSk56Z0RPa0JRUnlDelFiTlUyeE1ISUxpd0tvZW1v?=
 =?utf-8?B?K3QvVlZCdVdQSEhzNno3L0t1S3YrNmcyVU0ydnlhVUhGNHBhNHE0aWRJR1BU?=
 =?utf-8?B?cXlZWkpKUzcwdUlWdkhwazlDY25aVUw2T0ViQ0FuVW9zMndqVWtJRHpGcDM1?=
 =?utf-8?B?VU1rUHNlZEVHRHBSYURqdzVrMWpmRGw3UEhiYjUyODdIL1VjbjBUVGNJVGRU?=
 =?utf-8?Q?1uvg58Vb5cAroXt7WeXqJ/9I9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db133a7-a86c-4f8f-36ca-08db929ea49a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 14:50:26.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyYSi911thsOciblBZa/7mT1xHUW/xdwQ+YVMs3SnAFxXeTY6DuQaBvdvLnFkUaAraBsSRCP3Hv8NsQlyndiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9865

On 01.08.2023 16:30, Oleksii Kurochko wrote:
> @@ -54,3 +70,17 @@ ENTRY(reset_stack)
>  
>          ret
>  
> +        .section .text.ident, "ax", %progbits
> +
> +ENTRY(turn_on_mmu)
> +        sfence.vma
> +
> +        li      t0, RV_STAGE1_MODE
> +        slli    t0, t0, SATP_MODE_SHIFT
> +
> +        la      t1, stage1_pgtbl_root
> +        srl     t1, t1, PAGE_SHIFT

I think it would be good to be consistent in the use of pseudo insns:
Above you use slli, so here it would want to be srli (or the other
way around).

Jan

> +        or      t1, t1, t0
> +        csrw    CSR_SATP, t1
> +
> +        jr      a0



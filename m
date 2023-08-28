Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2F78B530
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 18:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591691.924143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaesO-0000fU-Kw; Mon, 28 Aug 2023 16:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591691.924143; Mon, 28 Aug 2023 16:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaesO-0000cy-Hv; Mon, 28 Aug 2023 16:14:04 +0000
Received: by outflank-mailman (input) for mailman id 591691;
 Mon, 28 Aug 2023 16:14:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UdW+=EN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaesN-0000cs-Ne
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 16:14:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6fed88d-45bd-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 18:14:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8727.eurprd04.prod.outlook.com (2603:10a6:10:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 16:14:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 16:14:00 +0000
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
X-Inumbo-ID: e6fed88d-45bd-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjRO/9gc1GrEsVTgCg6ENaEJMwMFZ8cnYmybqLs4+HL7fry98DXru5fJ86pqV31L+WngX+veN60U2/XtxvtLFuafksw2uk5znF/2Vfc35KrMeooDWLMi8gmIHAU43M0KuqvZxhW0HyR1UV1zNmhj7INWcToMXEJwXgmHAuqyDqiMsTvpWqHRUivSlqH8NlxFpDJsrsLuh0IEjFaCultpM2en5CoUL7m941Nw4BdpAXquzQWVHFuXMhDMHMDGEfyYzxlkbHkJzOnMH/AJVaGJ3eKFKX9m5fRUnXdVp5vXg5smeVM0sk12iZ+oD4ifm7YtABM9VGqu4NMJsFDpkwO7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hcb8Z7PPC9Fxf1bYcSW64of61eCT5EJ6bq4tWZPQP0s=;
 b=cWmiopd+c1EUHe/1E5WcjlI8MT5vYp3GczBh4aFdmZD9qWbyBWcNqGe2nlLGAHqrQVXex426tTyDYBwghlYR86ukiaJHrl9/90tlbJ6x5mjVxYWEtRnDiLopyJ8kjCOTG6OMJwCUEM/iVE3npmcYGQqvF94AhlaBf07LW0wypTrM0/SrW7k/vgeNRWt11NZ+HDRCOovqRAr+FaRcE8uNydJB1IlEqaGEOBlOv6buUfN+l9HGZIM1ONN1AWSFeFI8aEXO7y9WhfPDcnGJioPehiDCBihH5RmJNwv8DX2JgLd2XKuFALD2SlrQohn4VDd5d9nDfhDaRiyNuFYbJsameA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hcb8Z7PPC9Fxf1bYcSW64of61eCT5EJ6bq4tWZPQP0s=;
 b=fzcmtITQwAjYjHGf7NOyUOAgUsBVo+LAMgbhEe5KkgykN6F6XYUHkTLN3vNlgklN9UEozKj+TY4xSncjK2TgSZ2PWe4SO7z7pjRvR/ZuS/6iuPnLGOSYjebVfDImSoSYc8BpcVPn8OjJC4PRVtIpTXhHjScOg/539jQj0GKNEd+D0EW+Lvg8nDaQ2SwVdQ8R+CpcAFNHrYTYJtSR/s+mmm1+44acKeaL1PEIGzqF0padB2EBCbawE4qpjvCiAjM20KqRsJAMsWLEsVwHDl/ANQEt2w/DoF/hJRu23OZcX5V3X/7jsDlk1sbiSt2iOyip51unbOe4TBEvEIUp4ZVTbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d2f917f-f613-52cc-7d98-df2c6139b718@suse.com>
Date: Mon, 28 Aug 2023 18:13:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] x86/irq: fix reporting of spurious i8259 interrupts
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230828101428.23579-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230828101428.23579-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a834924-5975-447a-5150-08dba7e1ca10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6mOAh7ye7zbDg9H+fLqZNEooVC7ApFJbBd6MgBnb79BvnL542j7pLJkw9vcXh8qrGzoUo1/cv93wP9EYBM47C54mL9xfqRIlx6zgMjqfmV4M2XjUXg5pvC0DQX4CPkam15FumH8QMsjdNf/zkxvmNlu42Zll+1UIjTiFFKRtQcg5aYzC5B+Gz1ViBe7lxejQ8dffF2IMKFaM7Lx1d3IW3j91V83l2xd2O9/N/LByHAthtR8yPSyPCxrtpVLvqtT6gCtliLbJ+2ILJsg4g4+1Xxs7yrjs+3kNIGLwD9e3o+h0mCGPtDpkULLTOdFwECtsca5TD65jz/VDWtWsragwEptUwt4dtWtyJ75GRm726Lmmujt42hpH/jgeJW+12xMofCAZn7c6YieomVQOKxlXTo9ZkSO5zmRf1QGD6Rq+IzOxx9j+inHlBSW/Jw058NYiL3cgbSBlPCkXwN5dBjpxzwHKGwuRt3z8msV6hBJBZ2ij5WK7lJbLEIISqBQcj6vQB6GeWxqP9BYfsro4mDEUck+1UBSIphzri7F02DQQCwtx6V+ee3iAuOKblRWvHT6X/M3zFN7sddiKZ6s5aVwNvQO28aOwAdmGGs90Eh2jTEZlbgyRB5lB12PWEZuUt6Z1NPET89jjda+B0wZq7fJ93A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199024)(1800799009)(186009)(478600001)(83380400001)(26005)(31686004)(2616005)(6486002)(53546011)(6506007)(6512007)(6666004)(31696002)(86362001)(4744005)(2906002)(316002)(38100700002)(5660300002)(4326008)(6916009)(8676002)(41300700001)(66476007)(54906003)(8936002)(66946007)(36756003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU9wdU5xMWxrWFdJNHdwWUJQR2hUR2szbVA3K2JHaGhIVjhYd2xaWU53U1BU?=
 =?utf-8?B?SklveHpyS2hwcllvSGZyZHYvZ0VwVFd1bkZsS3pxdGF4ZFgyZW9JdllGbjBh?=
 =?utf-8?B?SWd6RExXanYzZVVtL21GaEdLZGJ6MDlNck9Hc2sveUdLSk9BMzdCRDVnT21p?=
 =?utf-8?B?WGNCNjl5a3doK0RtUUVhN1NROUJhL1lHeWhpc3BuOUNTalR6N2xVbFpVQS9M?=
 =?utf-8?B?MndSeUN0S1A3THNPbGFOSlQ1Q0tITXlVQW9KdHdXU0w2TzB1ckQ0bGY4UUln?=
 =?utf-8?B?YkMzMzYrOWNaQXFYU0txd3kxQjc1MW4rUjlkdlpjMS9pR1gybVEzb0JUa0NM?=
 =?utf-8?B?UzRuUkNSeHZwT0dDTUdzY0U2ZklVNnFrNVNPNWJLdEdLME4xK1JDREtJcHMz?=
 =?utf-8?B?RVVvTENvVGwzTm8zNTVjN25Odzc0S0ZiM3Z2RmJPREUwZ2VxNW1lWi9OSnVF?=
 =?utf-8?B?bjhMUURkMnpRODlacFJpOUhhZXNCR1o2a2JubTVzcWdkbEJGdjJEMVd1Yk9O?=
 =?utf-8?B?andXZkg4YUVUOFlobGNESGY5NlZnZXRmWk5WNXNnUGJFWWV0anBPVGZXQk1m?=
 =?utf-8?B?Y0dQcWw1clBPQjNURXBnVURpaHAvcis4YStDVFJiT2RkNVg1NDlpTFBEMTdl?=
 =?utf-8?B?WnVTWnh5Q1U4ekZyV0lEYmMvTmVKNlZwc0Q4Ty9IdE5NQ3lzNEZGaGZ6MzV0?=
 =?utf-8?B?cGpFYTkwMVdVUHdKWmR4dS9NYXYzNmhVaFI5bi9hMk9HcVZnQWd1NkRHdkxV?=
 =?utf-8?B?eW9KSkNhL2VpT3VLVmR2cXNPWGhydHdtdUtqTGhSdElEdURFMjB0M25IeHFU?=
 =?utf-8?B?cW9XTThLNzdoenpPSDRyUTZMdHhpdnZLazIvVHFHMlN3cWVPVHRnZGhlcGpV?=
 =?utf-8?B?MmlkTCtLYTBIVkhRdW1ic1plUCtzSnBjZVQ3T1l2aStkbXJZK0Rib2tLYU42?=
 =?utf-8?B?NGxOU0RRdW5aMGtST2VqTEUycXFoMStraUFjVWE3eW9idlJ1eldZZFB2WlBT?=
 =?utf-8?B?NWo5Qm9jYTV1ZjJsVVJRZ2pTR0U0ZjlVM0tzZEx5RFFUVU1TbE9GRUc5OWhH?=
 =?utf-8?B?RnZCa05ibjZ3aWdRSXZZYjF0WU8vbTB3eklmKzRmUU5pZ0xGVUJWVUVsK05v?=
 =?utf-8?B?S2V4cEt3UDVyRGt1QVBkSkI1SUVsdUxqWldNdHJCajVOMko1RG9XUjd4SWN3?=
 =?utf-8?B?YmtwWWxsOGlBZ3pLaXhPcUI2SXJHU0lSOHd3UndaMWpmUE84MGErQ3lyZXM3?=
 =?utf-8?B?di9wTy9Qeld0SUN3RU9COUlNczFZeWIrMjN1bXlWMHlLSTlxb0tDazAvK1kz?=
 =?utf-8?B?NWtPT2R2OVRIcTdxcGloc3o5amM3bEdBTFRIUzQrUVc2Ty9iWmdVZSsxM2FE?=
 =?utf-8?B?QkpRY2p2dGlTSzlNY3lsN3J5OVd3Q096TjROeXg2L3VkZk05NlQxb1U2M3U3?=
 =?utf-8?B?cnFXaUFnNko2VmdvQkxhSWNUb3hDcktrd3lrVmlCVUZrWkRDM0ZXSWdoaXh2?=
 =?utf-8?B?VCtiTnhidVJJOGdGVm02NnkyOUcveXZSYmp6MVA2V2lWNXcwRDJubjlUQzRa?=
 =?utf-8?B?TTdEbmZSVGk0dG1YOXdRY0pESmdjaHkzNExwVEgyYlFoS3p3MVpjMXlVZk1u?=
 =?utf-8?B?bk1CZ3ZTVDdMTWt5bGwyQ2lURE1iMXJIQWFqa3BqeGZCUm5KaE5pWlFuZHg4?=
 =?utf-8?B?V25GRGxySHZkZG02UHI3b1VNaVlIWndsM3NxQnR5SFlSOVhYWHJqOHdNbVc1?=
 =?utf-8?B?NGN1dE4vbUd5QVl3YnZ5aFVucWM1cUFUQjFtVy96L2JqeFMvWXNtR2kvYUx0?=
 =?utf-8?B?bWtBOG9aeC9PdXZQUTI3a0ZrRFk5L291bHpObDFQM3dZZ1NJMVI4Njgrbk9O?=
 =?utf-8?B?VUYvaU9uc0FVdlZvK2hJcGZ2ZU1HbGdyejgxSmRSMzBONUpaZk9VeXJudmw5?=
 =?utf-8?B?NlJ3akgxWEt6UU0rRXVnOXU3TXVqTExaTlpwdzJPQzhqdXBialQwKzVjOGdJ?=
 =?utf-8?B?QTVtNlFsYm9UTnRqb0Q1OWhUbm5FdmJIcHVocUV4YW84RmxGdTJmUElRMVk0?=
 =?utf-8?B?QkRQVFhMaHlzaGdGYllidW95cTVYWEpqOEVQakJPUVBqdUF4TzdPOFRvYTRB?=
 =?utf-8?Q?nwUPxfly0mf4DpVFYZs2ZJnay?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a834924-5975-447a-5150-08dba7e1ca10
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 16:14:00.4730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aF6TSTXlsRZBSYZMm7LFUgP2bp9NYlBKk9+V5gvx3yKuS+zJJjbfDbFWmdbSCahiP04ODzmZo610g2D9x1FnDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8727

On 28.08.2023 12:14, Roger Pau Monne wrote:
> The return value of bogus_8259A_irq() is wrong: the function will
> return `true` when the IRQ is real and `false` when it's a spurious
> IRQ.  This causes the "No irq handler for vector ..." message in
> do_IRQ() to be printed for spurious i8259 interrupts which is not
> intended (and not helpful).
> 
> Fix by inverting the return value of bogus_8259A_irq().
> 
> Fixes: 132906348a14 ('x86/i8259: Handle bogus spurious interrupts more quietly')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




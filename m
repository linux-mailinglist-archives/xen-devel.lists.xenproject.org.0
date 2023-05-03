Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620656F5514
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529054.822990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu91Y-0007AM-Ba; Wed, 03 May 2023 09:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529054.822990; Wed, 03 May 2023 09:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu91Y-00077U-7m; Wed, 03 May 2023 09:43:48 +0000
Received: by outflank-mailman (input) for mailman id 529054;
 Wed, 03 May 2023 09:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu91W-00077O-Kx
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:43:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff163415-e996-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 11:43:45 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB7086.eurprd04.prod.outlook.com (2603:10a6:800:121::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 09:43:43 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:43:43 +0000
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
X-Inumbo-ID: ff163415-e996-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvlVrJCN1wpMUgj5RBZnno5n0WKap57OL1+JRDZ+F+g+KkFqqEPEh/ZJ+fYg8GTyCIw9EHZb83WR1IYoR6uWXPuj6xwsItRbGt4/wzYmDPn3EL+IUJy5eBWL75MDauAz4vBkBKsZkBB2ZBljNfWnKuGKloYUCqqR02mL9l/3zyX1Tsk5LWLZsO/NEGbnkEvs1ooRtbtlOXmKy3mr1lEqxF+lVFBsZRGdizqEGK1EmlEBcCdiOuhxoouVjYQQJXIFnTRlup8qFaz7zgd05vpIBveqO0A5QyhPXI5fp7ScdliD/mfYRxaQ8yPfMwlcFqc4/cWMJRerBYIdNJRexF8N1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Qwx2nQ1Z3b4p2Wd1pGiSoSwuiZ9EYUJViH5NdLyHps=;
 b=dufUCTfLXKqyjgptp1iOZTWPPYfzECmxfAzmTaGlyrh9GW+LyK9LHiuJDJKUbLXWrQT+YoUWo/w8X2rt1+niE0uqFrdCK5ezlXpK0bdCT5gch9RBnJdANYvswpdW25uzhqDrB5y7I4g2ggkFzf8cZenUmfXjbL/bFB8/MxPMI6qtUi2sS3gAScs5UGP2EzocKHWn5m/TYyarPbN1AVL5NBSg081iiDCftz4L70rtZYYbQaS0uydZvEJaPpp4jh7To17opIurqh/VyJW0OhZF9z1wAykjbQIGoShZzMji6qPLk1butwNfcsHycZhOCyPzBfy38UcMpsfuYVwsmL93tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Qwx2nQ1Z3b4p2Wd1pGiSoSwuiZ9EYUJViH5NdLyHps=;
 b=b+aVJ4RrBo3Op8HqLlmoDkjfH42M2z4CenQFBy7kWX3+eUr+VytlS7FWC9ZB/ImqlU+YSUOkA4EXpn/wOcNCFMZ7xSJKbdN4pZc8S0kPqXUCeCNY17RXiHCKOcnTebOSP+SpevsU2+RG4mg+/NBYvId/w/iY3zdKHSG9mKDxgcjiqVd0N1ljd7LOzYF3Mcfc9Ito5PfIFwDhhFwDOlNAuypu04j8tMRL0b7R77005i8d6J566AhdqtGy0rP3zvI5+nl4f+7tAiZ13G4S9O8qm4OkUi5S0pqvovxpcqwWPcDYGaJwUBlKWeSJNrzCXT7TXAd9udnPLCxy4FHvgXhtwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
Date: Wed, 3 May 2023 11:43:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/6] x86: reduce cache flushing overhead
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 60341197-c4d2-4551-8528-08db4bbae23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FkMeEnChH262wCFRe4r7jt69aNSmLpwDSoHKxhFiC/onfK87bxmIqT7atpT0wUkRNvMs8VM4dNL6WdP6o1PbUbkTgk1DXRqlvA4P3DOPluheeHAQr25MHlnlnZ/Nuh5nkVKLnTqhOTx4AAOPGZ5fegU2g+tyqif9Okv4+qnyzD/zij1kGhP3PQ++YiMca4cSNQiyWh/7L8Zgo8yYX5Rwd0dhQQH0Oxg1X8spohnI65+vf1KOP06uRuAaIslnhsXmjZ8dJDq/uLMpdsKya/iIBu5+RQyNwJ0VdVR0BrbcyTb2xL66XRE1ZuQKzUKLfXFv4+v6HAUeewjEqaBkSLeCEUYwa8+cp1m1G9kj8fJkCQY6Q1dhhMEzaD1A7/PxiJiiwBvwHIUnIBdIXTxo6TpQunrDyxRok5EnBjheyJFdD1rq5UEFgfEEJ5RjVM/XwBb+6iMNvJMY5Oqm6eny3WnYhHyMbO/lYiDwLW+/tYqGYk2wUI3V2GbfjhYEzjUfAkGx5hjnadinIFDdW5oDSY8PuIfKugRksjda8IXOICd/TVajvnbA++mG7shx4TrjU+PMWvzyMOlFijdJTjpyZgbVGHMY0hpc2lzdTjvq1bP2+TA0jwgmD3RvIoBPGTpYUdX2CW8tjz8OrmyeODZaEMwqug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(31686004)(36756003)(5660300002)(2906002)(38100700002)(31696002)(8676002)(316002)(86362001)(66476007)(66946007)(66556008)(41300700001)(8936002)(4326008)(83380400001)(54906003)(186003)(6512007)(26005)(6916009)(478600001)(6486002)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTd1Z3djQVV1L0VVWkhxdFNxNEZ5cm5GSXdmUWpxK0EzTjJDU3pUaU5palU4?=
 =?utf-8?B?WHdUVzRybzB4cjgyQlJTaE9sVTNuWXplYnBUSWRmMjFnenpJNHlUY0FNTVdH?=
 =?utf-8?B?S2t0Q0tiZ3h6bzgzam5yeFNZOTIyekR5TDlpQUVUV0U0N1F3dGlKVDc4dVJC?=
 =?utf-8?B?Q2dFcDBMTnF3TXQyM00xcllvY3MrYklEeXduZndIMm9JdVNRaWNZQ2dJcXUy?=
 =?utf-8?B?M21nckFhRGNreWlDS3BXR2g3VTl4ejRoSUVmaTRycVhKZVNEZlBkVVdYenpV?=
 =?utf-8?B?c0Nmd1U4cXI5TUNXZFhFMmMxU1RaOTZzVS9GeFpxV2cwazhRSmZTV3hEeCtY?=
 =?utf-8?B?V0N0MFc0WVpSb3F5d3J1VStwZ3RaVDhwVjkyU3J1MTN5WDBSU1VSUEVvQWFp?=
 =?utf-8?B?Z1pUbWlhbVBvUk5XOXQwR0hERkFpbEQ5eHdQaFVtRHZqdGlhRUZSSWVqcDJL?=
 =?utf-8?B?RHNoSkxyZndaWHhybEgyTG92RDBtWnpUUEZWMWY0WWxvMzlDOG50T3lVN0g0?=
 =?utf-8?B?ZkVGL1AzUERDRzZWektGMUZRS0ZCbGFCaDFaTitpQjNYWmk2KzdUSmxGYmxJ?=
 =?utf-8?B?N1FEWDJCV0NrM0Q4cG5lVHpicXMvazNINk1QdkxaaDJzVFB3RUJUNHJBRkFE?=
 =?utf-8?B?cFZodEgrSGhzVlE2N2JiYWtZUEVaczVoNEZYRk1uVHB3NmdZSzIzekd2cFBC?=
 =?utf-8?B?MHFtSUg4Y3JIYXJMNFFCc3FKNVBUa1NOZUlzRkVRMENrZ29uRjRvT0NjQW9o?=
 =?utf-8?B?a2FpZlpWbGhWYWJDd3RMUytRZkNRNHc0dVh3MFFvRjROaUdHUklLT0xmaUs3?=
 =?utf-8?B?WTZPNnNGRlA5T0w0V1FSMy96OGYwelZhbE9kc1puaHFzVG5uenN2UW42aUlQ?=
 =?utf-8?B?MGdSRkFQRGVuZlplZnYrbXZEeHJUMVE1M2NuZnRSRkRWaVI0eFpGUnlZbXFy?=
 =?utf-8?B?dXROb1hBSVFxaDNzQlNCem1wd3NwUW1vclJtSjhkMDlEY0VOL2cwUll6Z2do?=
 =?utf-8?B?OXZQS2c5MS9RVGRHbTFWVWtNSzVNUmJ4T3czTXZmRnpHTUF4TmdyR09TSjgr?=
 =?utf-8?B?WHFjajhBRmhucmxCcndmWUNCVVROTENqTGptMW5DZmxPaGYydzNDdUtBcjZl?=
 =?utf-8?B?cWRTbHdpb21vNDJkWFByMWxOZnJtMHRYVHhYSHRvMjFqWG41SVRONk0zTkZt?=
 =?utf-8?B?QXIxYWJmWTdLZm1Nb0tXYlB5Y0s0NkZEYXR5U3VCWVd5anIzcllNSUhtV2R4?=
 =?utf-8?B?dXVycmhsS1dhRlVyNnRoNHlnTDcxQi9ITzNzUWNubVI1Q2hIaTZ1REJtTGp6?=
 =?utf-8?B?b3FOZ3JtWVFaZEpsVjErc3A4SmUvVjhIUVNwY0VTL1IwWEJJb3pmM2JqUWYv?=
 =?utf-8?B?cTdqODloZjFwMlR2UnlCUkswdXAvVjFMaXJ1Rk5vVnBta0puZkFsR1hiZExP?=
 =?utf-8?B?cGdyYmwrK2V2Z0hpdEpKV3pXNlRIUndCR3EyTDR5a0JXejR4R3pqM0VSNTc4?=
 =?utf-8?B?R3phQ0JCMzFSckRVRHhGdjRDbEVvK0NqTHhoczBNZ2pWMUM3N2VWQXgyVkc1?=
 =?utf-8?B?SVNsQk1rWHRGYmhraFpTdTVTNGVMNGpkRWMwc2tNZmt1d1AzNGdnMytON0hI?=
 =?utf-8?B?dEE1VkV5N3NTK0pyWUpJdldKSXRHblNKeE9VdVlGUi9PMDBPUmRXdUM0S2l2?=
 =?utf-8?B?RzlsazUxNmRaRTFtT2lkTXNKWmx5QU1mWXM1VVFYOEVIYUlzV0M3S1BudkNv?=
 =?utf-8?B?d25pT1Q1UDJIdlhGaE9qUkd5dFpRa01YTmJoTDlKMTVoV3JVVEhja3pMVnhp?=
 =?utf-8?B?UFoyQUtXcnlTSEhrckQ4dk5EV05HV0hqQ3BKRGpRMWQ2YlNOVCtLTXltNmhH?=
 =?utf-8?B?WjBJMHVJdUViWGJPTmZBa1liVFlvY29va2dKZW1tdkIvaXhGK2svdkZaNHlI?=
 =?utf-8?B?NjBkNTJPUGlkMU02Y1ZyU2xkNmhOUFpXVkZFUHJSbS9hVDVmRjZlbnA0YUI4?=
 =?utf-8?B?VkNJT3daUzZDbWFJR3RFU0RWQnRpNUxyQmlaMUN1YkRodGVYNWRTYUtGZEFZ?=
 =?utf-8?B?RDNma2RKOFhFZFpPMW5la2MxeWZDc1VabXA1SVpCTTV1UjFhTHBJMU11NkRP?=
 =?utf-8?Q?dPYy31lpixX1oadyT/L5FK62K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60341197-c4d2-4551-8528-08db4bbae23e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:43:43.5911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hnc4CZffQ4vYpGE4NIt+OCnmRL+VctUOGgTtMB9dm3CXrOAjdlwUSSGzLa0wyEehkzPF2qg44ru23rCKGYYwYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7086

..., first and foremost by using cache write-back operations instead
of flushing (evicting) ones when available and sufficient for the
purpose.

In the context of making the last patch I started wondering whether
for PV we don't flush (write back) too little for MMUEXT_FLUSH_CACHE:
Just like for HVM, pCPU-s a vCPU has run on before could still hold
data in their caches. (We clearly still flush / write back too much
in MMUEXT_FLUSH_CACHE_GLOBAL even with this series in place.) We also
can't call this the guest's responsibility, as it may not have any
means to have one of its vCPU-s run on the intended pCPU.

v2 is merely changing some names, compared to v1. Other discussion
on feedback sadly looks to have stalled.

1: x86: support cache-writeback in flush_area_local() et al
2: x86/HVM: restrict guest-induced WBINVD to cache writeback
3: x86/PV: restrict guest-induced WBINVD (or alike) to cache writeback
4: VT-d: restrict iommu_flush_all() to cache writeback
5: x86: FLUSH_CACHE -> FLUSH_CACHE_EVICT
6: x86/HVM: limit cache writeback overhead

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EB94F1403
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 13:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298293.508099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbLAh-0008PD-Lx; Mon, 04 Apr 2022 11:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298293.508099; Mon, 04 Apr 2022 11:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbLAh-0008M2-Ia; Mon, 04 Apr 2022 11:46:59 +0000
Received: by outflank-mailman (input) for mailman id 298293;
 Mon, 04 Apr 2022 11:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbLAg-0008Lw-C2
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 11:46:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed0651f9-b40c-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 13:46:56 +0200 (CEST)
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
X-Inumbo-ID: ed0651f9-b40c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649072816;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=L5jW5RE6cvaWkWIcFvyidr+eAITaQpKh27PfryRVcMw=;
  b=aDZH35jMkj/Cwdlh75yz0puaOv7e4AklpqC12PQwFW0njRH0kq7NU7hm
   4LUYLedOVe3IgvuL8ot0QOxtukzfV3GRUgjCrHgSjx1OESBOOj9tG5qP9
   eTH2V5SP2UpnsZ/dAntCkh/27Zg6YD7Ydu0ikKI6vaomkEvghaevPSz3j
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67930837
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tg9BtKKJUF7+ThQ3FE+RxpUlxSXFcZb7ZxGr2PjKsXjdYENS1GZVn
 TAdXmmAPvzfY2CgedhxPNnk8UlVvZeAmNU1TwplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I9Pq47hWCwVBKzV2/4ebzd3UDtBbbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv15sWTa2BD
 yYfQRxxMy3dWSFRAAsoS5AEk9+Qmnv5UAQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs5BwCSYtBONEA6RjO0KnozSnaHFdUUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4iDGJGT9bxgbQ+0RqmBNzEJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdEIumkieRsybppsldrVj
 Kn74145CHh7ZiXCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikE4AALWnMnCIqeb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:KIePPKN/bJPscMBcTqKjsMiBIKoaSvp037BL7SBMoHluGfBw+P
 rCoB1273XJYVUqOU3I5+ruBEDoexq1yXcf2+Us1NmZMjXbhA==
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67930837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyL+MxncujTCEgrku0eJuCTHj/yGx8+lTkXLghnqc2Ib6h5RvqJP6w5bb6fc/VvgWcZNUrLfyB+07RlrwB4PeEA3bv72hCPVzg143NnWBUuJwhakGVcuXghAm6JqZ+N4SglNJbaKQDfiU9pcZNOJuKp9xgUxn6MMSfRCg/17dymUsHm0WR66O78NJnCj0TSD/k76KGxpB84SpvnROtjEOEiojvrDAwLMLt/zlQkPxppHvOP68rg33l8Qd96LzNaLbQ0ncNfN6VW2DamIf93sgOgxQwfQKAZIyrRz67KKrzZdFkvYKL2dPje0tc+b9BhQg7wU4uK9n94GBN2CnZklyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSroECJFTvu8DETz7yX2PPyTBY1+J/yDVqrHC/7PL8w=;
 b=BjtBpTdWvv1kB3jx+gtpz06lZmwX40tue5qAZybHMwQrbH7kXfpMPd7vq4G84wi8WgdPBua27vbC3OcR7Cg6Kb5U0GElvM8pY3I0pT5HgvaFLBAPx48qfumkDIJdcvypUujwO3hfaS3Gqy9OiGVLM2pZlphNkKWZVFSqa+LrdpzQjhZ5hKRXh+sBVYzWrnLNPSBlmfV7E0hJmMbmAbXGlE97G3v+XVU6y524nxCIFokTau2MkK1ta5hB3i5xnZfzqivIAT4vGzAhzJpnSBpcGU5DEJ7rLmvd8XSIdwZZpUanFxqT2nkmppqqRlwj5yxs62ARSoyrcnYttLdvFJmmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSroECJFTvu8DETz7yX2PPyTBY1+J/yDVqrHC/7PL8w=;
 b=m2YE7rwUm/0du9oxW4aVfZOsuZbzbraDRl/WDLKE9avobqjkJZpPh5nO/tmKrbprH5BdZ7ICXTUUC9Np4R3YZI66+ZdYrpyTSIU5lOMilTDJcAsAqtriyx/S7pqgEGL5+aWlANZDxET/Z9l4aCAmxsjlF2UpmK26yB8PtDKM05w=
Date: Mon, 4 Apr 2022 13:46:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/4] x86/APIC: calibrate against platform timer when
 possible
Message-ID: <YkrapvsmmjcZkwSj@Air-de-Roger>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
 <37ee7fe7-1218-7fa3-bc29-0fb45389bf75@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37ee7fe7-1218-7fa3-bc29-0fb45389bf75@suse.com>
X-ClientProxiedBy: LO2P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 650a692d-d6d4-4419-ce66-08da1630cf4c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5918:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5918EE0C7FA72A8CDA7F48918FE59@SJ0PR03MB5918.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QmF7teGEw2pfwV1PiTnjXD5CrADfMBD/Gdhi58Wh8XsjMYEI2sRYarNaXGQ4lTi0f9mLycDjQhNol36ip31ozVo5yI7Gk5+ReEGr2f5mwJ3BC1P7tKv+n7n0lccJdXLeGWciwK1eHb9CxzIOLvBG1vJn3Y/wL+N7f07SwXtO0dLJcdhJgtCewSzay7Uq6Z7i//KW9+HNDq0YIpNGgQ+LTkyVTxGgIG7jJmuyML7AZm7UUr7tj8VuJrlI8qy5kIRS0mtMkuC5WXTGUc8z2No4adgCrpD7y6QpT6V+rPsFVEX6RUwNgcvTqEr0HHzAjdA3p6ZjHIFHVbytEIQDIgFP4FqbJUWKXzLSePjBWfQ/UJB4eMbzs+TGhPRs21IJ+1OaYhD0SEXLj/p1RgRtgSh4LssW1GATaGq55XopZiPvbqP4XdnWcYaPeX19iPbTUAuusZCF0Me+BIlhqCOwzVZj29LkE3MOrtEvsVED5Qc1Fqjjsr7FIMW+7/WqYdmTC2ns88qgtpyCZcPJS6K0axtelrHEFOQSyhDdwzSDLajCLQjBMNJhKhOk3Vh0r0lLipj7Vksq0Jurm7KjvjJC+5UyfES1WWliQaHJohPVzNmIbE9g0wnx9WIf4QZf0vg6KStCdILAFmySx+W1MJQxF50oUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(2906002)(33716001)(66946007)(9686003)(6666004)(66556008)(66476007)(82960400001)(85182001)(8676002)(4326008)(6512007)(316002)(5660300002)(54906003)(38100700002)(83380400001)(6916009)(186003)(508600001)(26005)(8936002)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGd3Q3RUTzJ3c25TUTJyVWc2ZlJmc2pNcFlBMnhKaElaWFRSWEZYZzdwd3VB?=
 =?utf-8?B?T2Y2WlNNUjVBZFdZSHlDK2EwdHBMNHNMU3VpanpvdlRHdUkyNTBFZjRRNG5T?=
 =?utf-8?B?dG5maWdoTTdGUG04R2tDbXkyM0J4ODVvV2Urcms3TlFjUUYyOE44aCs3WE1D?=
 =?utf-8?B?WnlVaTBmd1NHM3ZLdGFEaWE1eXlxQUlTUWFOemtHY1BoYmhhYkc3UE9nOHMr?=
 =?utf-8?B?THA2b0tqT2hpOTVVdVhIbDA0UkJPYy91MW56Q3diRzM3WEFFTitpNWhTQWJ2?=
 =?utf-8?B?bW5CUnJJL2RxWGZZUlpwV1dQL0J6VHNIZjRReEFIS3R4cHJZak9qSTRNWDBa?=
 =?utf-8?B?bzBtakxCTGt4VlFYcEFxYUtoNWwvQWtsTWV3T2pDS0VLRjVITXdENUVpTTN4?=
 =?utf-8?B?Wno2L1VCU0UzTSs0bUFsYWF3TU9wd2hMcXFoWTN5d2FmMTdhZnNKbk1kWXY1?=
 =?utf-8?B?VkJnT1lNNERkdXpEWFJ4eUxVb20wTEkvS1BxeSs4NGJQOGZVZFlBZFc5S284?=
 =?utf-8?B?bk1LMnJYS1pWRWsxOVZQRU13dkhWTlF2VlgzZlNwSHNNR3J4VGt2M2NZWXND?=
 =?utf-8?B?UlVpdVpmaFp0TWhaeEtWeVhwSUJqRjJIWmNyQ2JCRkQ3VEJadnVmMEhXS1Rw?=
 =?utf-8?B?bXIxcUNLZ3NMWm85bnJSdE5nY0lPWkx4alhLTnl6NFYzQXhZNGRTRmtscU1H?=
 =?utf-8?B?THhNL2lIellKSmcrcXhyMFZwZkxLNjZJUVd4K1poTE9KMlB0S2ZsY1dSUHB5?=
 =?utf-8?B?Z3RIb3Y0MU95VTQyL1Zwc2FzNFVMdUw1YndEeHBiWXVyem8wbXc3TWRZa0dU?=
 =?utf-8?B?QTBaUk40Rk55QTRJR214RmdQRWJYWTljRlhMVzQranUwOURseXpBaS9OdU5m?=
 =?utf-8?B?OHovZm1WTmxoL09DOTIzc3B1a0R6RjJVMi9xMGNoczJEbUg4dU00TEpEUCt3?=
 =?utf-8?B?UHNsS3VhT1FWb2l2MHZJZVpLRG1xMXE1WUtCYVdzMkc2NFMzbHZXYk05enl5?=
 =?utf-8?B?dDFRM01rbVVRY2N3WnFiZDNld2t6aU9scGJFQ3NHL0VHWWpJZnoxcDhSajVj?=
 =?utf-8?B?VEJ3NFl0dlhVVFM0b05rYmNoR05JLytVK1crUWltdkNCVXBjR00wb0VKc0Vn?=
 =?utf-8?B?TzBiUXpLQ0hEZ1BFeW0zMTVGKzlHLzBaSzFtTjljN0VPQTRhMVJHa2FzaVBS?=
 =?utf-8?B?Q2htMmNhZklacFVHS3YwTEdTMk55bWlhUnhnUlBmZWJFVU5WM2xPemJqV1Fh?=
 =?utf-8?B?Slo5VmhxbVJZMTUvOHM1bmMvandybWcrZTk0MUJLSU1wanpxRFcvcHBWcXBS?=
 =?utf-8?B?SGgyanNlZHRQMG1kcm1IQkFwWGRhSzhlVHVmZSs2WU8zWDJUTHJqUTdmdzhU?=
 =?utf-8?B?QkFvUlRrY0ZHSXZUcFY4b1hIWkM5UFBRalRkVVJQTHBHanhEejhlVXNjOGlz?=
 =?utf-8?B?OEtGVWN1ZWpYME5neWRQMjh3eUl6akxvaCtFano1VnhHRy8vZTdYOXA4UThh?=
 =?utf-8?B?V2JHak5mQ2poejJtSUppU2p2dmM0K0NXcUFLeEhYSWNQVk5WYmdMaFhTREFu?=
 =?utf-8?B?T1BudHNaaVI4bkV2NXNjS1VzNTMxcjc0aUg1MmNGSVNoM0dMb3V6bjlvbnRl?=
 =?utf-8?B?aUlYRHJ2MzZjcXYwV1VUT25LUVpzb1M5WlJSWnFmVlFhdmxLUU4xM3dwM2V1?=
 =?utf-8?B?SmtIM3M3c2lnWEhSRlU2amNSRVIyVVlzekZRRU9PNlBNOGZzOHBWM0U2SldG?=
 =?utf-8?B?R0lWVXU2YkZwcGgrVEVqQ3EzaWUreERYMmxTYzZ2VlY5TFdYdG9YWHBCYTVY?=
 =?utf-8?B?M1RpK2JBQzRsWmxlM0h4b0g1d0Q3UUs5ODFqSDhKcjAwemNld1ljZ1NHSXZG?=
 =?utf-8?B?dHU0NGJFUlBrTlliZDJSUzZJY3lOUEZlVWNXb3EwYUNqVUZhUGwxMC9LSERJ?=
 =?utf-8?B?ZzhxblFITmZ4VU9xOW5tamk1Tk5YQTZjOG42QXQ3Y1crWWRhRXZqUHR1NWxW?=
 =?utf-8?B?YjNUaS9mMzdpc0VSYWxxSkVMRUJZUGpMMW1SU3lEem8xY2sxQkJJUmM2Y3Ja?=
 =?utf-8?B?S3kxMlJRNm8zOGV0TllBMUhJNWZJNXBGeEYrbkdwWStuV3lUbTE2M1NWREgr?=
 =?utf-8?B?VXBvWGUvSE11VGlBMnI1R005VGpPRmVqdUVTREN4dCtHOEtpRmR0VnN0cTh4?=
 =?utf-8?B?UjJvNkhOei9NQzRoOWdKUmxFV3YzbzVrUDVIOUlIWnV4dkZPZ3d1MUxzZnNI?=
 =?utf-8?B?Y2lGcE1qeGtEU2xic0dHNFFOaUNGZVFKRmRQN092bUNjR2FRL2ltTkNOTFVH?=
 =?utf-8?B?ODBoNS9WdXJPRkFibGlkcWtLZVM1ejNZaHl6TEZBUngzUjAxbm8wMEI0OGdU?=
 =?utf-8?Q?/X9vqpS4EH6lKHUg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 650a692d-d6d4-4419-ce66-08da1630cf4c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 11:46:52.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpM6TT5bKaNQPSJC2owXBOz3Zk7uYZp+qIhk3/jJzvIrJPt5bY5kVUMoTtQ6TdrRgOiEBwu5+aHm1jX906p6Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5918
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:29:44AM +0200, Jan Beulich wrote:
> Use the original calibration against PIT only when the platform timer
> is PIT. This implicitly excludes the "xen_guest" case from using the PIT
> logic (init_pit() fails there, and as of 5e73b2594c54 ["x86/time: minor
> adjustments to init_pit()"] using_pit also isn't being set too early
> anymore), so the respective hack there can be dropped at the same time.
> This also reduces calibration time from 100ms to 50ms, albeit this step
> is being skipped as of 0731a56c7c72 ("x86/APIC: no need for timer
> calibration when using TDT") anyway.
> 
> While re-indenting the PIT logic in calibrate_APIC_clock(), besides
> adjusting style also switch around the 2nd TSC/TMCCT read pair, to match
> the order of the 1st one, yielding more consistent deltas.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Open-coding apic_read() in apic_tmcct_read() isn't overly nice, but I
> wanted to avoid x2apic_enabled being evaluated twice in close
> succession. And I also wouldn't want to have the barrier there even for
> the (uncached) MMIO read.
> 
> Unlike the CPU frequencies enumerated in CPUID leaf 0x16 (which aren't
> precise), using CPUID[0x15].ECX - if populated - may be an option to
> skip calibration altogether. Aiui the value there is precise, but using
> the systems I have easy access to I cannot verify this: In the sample
> of three I have, none have ECX populated.
> 
> I wonder whether the secondary CPU freq measurement (used for display
> purposes only) wouldn't better be dropped at this occasion.

I don't have a strong opinion re those informative messages.

> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -192,6 +192,9 @@ extern void record_boot_APIC_mode(void);
>  extern enum apic_mode current_local_apic_mode(void);
>  extern void check_for_unexpected_msi(unsigned int vector);
>  
> +uint64_t calibrate_apic_timer(void);
> +uint32_t apic_tmcct_read(void);
> +
>  extern void check_nmi_watchdog(void);
>  
>  extern unsigned int nmi_watchdog;
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -26,6 +26,7 @@
>  #include <xen/symbols.h>
>  #include <xen/keyhandler.h>
>  #include <xen/guest_access.h>
> +#include <asm/apic.h>
>  #include <asm/io.h>
>  #include <asm/iocap.h>
>  #include <asm/msr.h>
> @@ -1018,6 +1019,67 @@ static u64 __init init_platform_timer(vo
>      return rc;
>  }
>  
> +static uint64_t __init read_pt_and_tmcct(uint32_t *tmcct)
> +{
> +    uint32_t tmcct_prev = *tmcct = apic_tmcct_read(), tmcct_min = ~0;
> +    uint64_t best = best;
> +    unsigned int i;
> +
> +    for ( i = 0; ; ++i )
> +    {
> +        uint64_t pt = plt_src.read_counter();
> +        uint32_t tmcct_cur = apic_tmcct_read();
> +        uint32_t tmcct_delta = tmcct_prev - tmcct_cur;
> +
> +        if ( tmcct_delta < tmcct_min )
> +        {
> +            tmcct_min = tmcct_delta;
> +            *tmcct = tmcct_cur;
> +            best = pt;
> +        }
> +        else if ( i > 2 )
> +            break;
> +
> +        tmcct_prev = tmcct_cur;
> +    }
> +
> +    return best;
> +}
> +
> +uint64_t __init calibrate_apic_timer(void)
> +{
> +    uint32_t start, end;
> +    uint64_t count = read_pt_and_tmcct(&start), elapsed;
> +    uint64_t target = CALIBRATE_VALUE(plt_src.frequency), actual;
> +    uint64_t mask = (uint64_t)~0 >> (64 - plt_src.counter_bits);
> +
> +    /*
> +     * PIT cannot be used here as it requires the timer interrupt to maintain
> +     * its 32-bit software counter, yet here we run with IRQs disabled.
> +     */
> +    if ( using_pit )
> +        return 0;
> +
> +    while ( ((plt_src.read_counter() - count) & mask) < target )
> +        continue;
> +
> +    actual = read_pt_and_tmcct(&end) - count;

Don't you need to apply the pt mask here?

> +    elapsed = start - end;
> +
> +    if ( likely(actual > target) )
> +    {
> +        /* See the comment in calibrate_tsc(). */

I would maybe add that the counters used here might have > 32 bits,
and hence we need to trim the values for muldiv64 to scale properly.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8250DB3D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312491.529744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niu8l-0005NI-Ns; Mon, 25 Apr 2022 08:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312491.529744; Mon, 25 Apr 2022 08:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niu8l-0005KW-Kv; Mon, 25 Apr 2022 08:32:15 +0000
Received: by outflank-mailman (input) for mailman id 312491;
 Mon, 25 Apr 2022 08:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niu8j-0005KM-OR
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:32:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34642581-c472-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:32:12 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-oUMUKYlAMVa2Yg-nFT7akw-1; Mon, 25 Apr 2022 10:32:11 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB2923.eurprd04.prod.outlook.com (2603:10a6:3:da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:32:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:32:09 +0000
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
X-Inumbo-ID: 34642581-c472-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/iXrr5wbNhiSfeRN5CafS9CPFmFmiZ1NrYkK3k2eoBc=;
	b=OrXI8RrCgJYu0U36MH1G3nbd00GCoYsXRFNdWVCyKqlDLAWjZ2v/rYKAtPzu2GVqyJ3QYv
	ISeEhvBFztkrr/AhUWx16Ejg2Hyfoeadr+tjP3V8ajKtXsbgce/Q261GeqpYP0aiLx/MnK
	b7Nv+wq+BjkpArljAeWXp2ycfRRR6Rg=
X-MC-Unique: oUMUKYlAMVa2Yg-nFT7akw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHI0KfcCU2uigwWDWFkCx6UQb18qfCQvO4Xtbxp02SKFpdwTu8bwWyGGuWZqshO0KX31eFKZ2n4ZifoUlYNNTTlY65ffS4ZS2QSK49+3R/IRuX1I12hgNnlr4O5jcC5gtglVAqdb/ZhxNJO5n+TDxsc3FWu9lAFhIvQae2tsWgkGgrU5jx40LMxAnK4wifPHdU/GICO6wX6NB7hTYDeZPHguap0WLuKxDl1a56GFcwZGIlPkN4cnmED3QllQuQVlor1tfsaRfvgu4XcRhGGEMO8/osZr8Y4PgSa9t4RRC+uM3IOfsnMkVhg6my/A+wAjVMnsAd9WqHG9OJi3wNyjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjdSQtedmMFCh8llXOYSf/g3U8VFnBdTE7dsIXoukzk=;
 b=WsFxqEPx2zlx2PsD33HJ1WnxZ2pguQ9u43ppwthKVBozbTx/1oioyitOrsQ1m76GmqlZvBpXSA9uAMtxVtEUTXLeaEIqr+xiFiMeJFeRbZvmeoFF39+hu4GH3vx52/h/QXwZ1CLcDWmWhen1+sTcCuS2DEdW5kHG4ifLnQP75WQ5nuC2dAf2OXKUZ4/4scDVnexkRFkl+UYNsnxhKmG5P+cKhvSzgwH9BcA0SygWVTqRkS3/7p+Xg7LCudqG/HkbCd2YrRiHKo5XfRutP/SP4sIEKxy9mXcUeOmgsLmTPpRCWYhwMJmRBenX88w32HKh4/65BKytgtP4qwkrPSEP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc4323b2-e074-f86f-eea0-9cd6a802bed8@suse.com>
Date: Mon, 25 Apr 2022 10:32:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 02/21] IOMMU: simplify unmap-on-error in iommu_map()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0330.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bab5479d-ae76-4ef6-773d-08da269616bd
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2923:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2923FAF86F9E84389C8CBE7CB3F89@HE1PR0402MB2923.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4plGuojbvHRApdQtJBz5lbEa4KFSgYrAfWdhtKGjJzcLRz0T2jqpuT6+2YD+LiLN+70FjKx85i4q7NOy1P3/BjRQyw5zjA2E1GJXZtDLvSAgIYuXWIOr7GdVK3nUMe6grWwRaO/cpI4LkYVFFHiLNrGp9r49iTQEWnj6RaiE8KQ8dPZAopM+1fddAxazCC9IlNmdM6jvb+bdS2n7vCbJYT6z2gmPXBCcaBVfGS6/OF6kOwOEpRxicVOZrjfJ/r8j2rPRhxykfyVSujkHUnFpYG6GUAFVtccMyv6BeIpK6Fs6Cpnvt+daCzXb3h6Zaa54ZehWF15nml1RMUuAW5V0BJhEmBKmtjVdOniM8IGGVxqiyoyF3TUqUxBK5/LcftisJ69nDT7eMZ0QCqwmjo4zvcxOWeivt1CUGx3f3tvobed80iTGyJbEyabKYWlab0n1rT6Faf/myCHsw7YRyYsZmUrVIfxrnJI09zDtlWEgFAxi6Sw4Tu5b6YIFlp9Z06DRBosHA+OUcYmg7Ur5ZiUQRV/rYzFNq315+00+bLxlCvZ3/r2sTSoO6CMEdrE76GAQX5eUPnRVrwHhfC1f/kEsorxx5b6hOgY0fgfg+gLJv4FEzoF6+9w1w7P//ekXOdymEqLXdqa0d2DDMiqmImSSiAZCVaET5OTeYo19XgIzlMBJ9wMp1t5PYaxTeQwg79HR4/4BtMlDVH2ASgDM88Z5XQRpHgy8i0H/6d4tDk+F1srOAcqmiBYU8KtxxSEF37j2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(8676002)(316002)(86362001)(66946007)(5660300002)(4744005)(31696002)(66556008)(38100700002)(6666004)(2906002)(6506007)(2616005)(4326008)(8936002)(186003)(26005)(6512007)(54906003)(6916009)(508600001)(6486002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SRBWLxRBnBIwe8OiebPawFRHRf1xo+30UsiNPDLrhKJoYjwOHAm3mwCUFXmm?=
 =?us-ascii?Q?F0JqRACpAXgzVquzlsoRkbQpeF/jiXmGhJgAEYjMVC0dQEUnRfun7LtrwPTR?=
 =?us-ascii?Q?dtoImZtfHsHcif9hmYM8ay3nrMF4pJOyl9Gqjq+29+rSTISuaDPBf0Hj7I0n?=
 =?us-ascii?Q?AmQjpRyLrSbT9yt3ZEiq169ci1CKwFe7wMYCSzb4wb22G14Q1iKxLH3AKmDv?=
 =?us-ascii?Q?P03/r0niaPQMrzocaFaipMF3HKLVlmLjkr+JYFGctrHoAUaRJw3lAIIgEG/o?=
 =?us-ascii?Q?AT0CClSh+Gd2Ow656lVsUeZqzThD/Amw2Le5T2Un2bZ/Dnx1mzzkIKN9i38L?=
 =?us-ascii?Q?HBb1WZ5mItLhW1p3pefTSOfk1tKrbQHGfs/04+DXXpo4c+P6TEyZ5Z4iaxEM?=
 =?us-ascii?Q?rlC/T4qiTpxTmlXNDu3IPOVPVPLYAy5KYN8Dby91/roKeBvxV89EI9mUn5db?=
 =?us-ascii?Q?lwVqixnFvEmLLCygQG8cOVsRSNUVy5JyRqXr43DqvQJoM3WfyIvC65vGkFT2?=
 =?us-ascii?Q?JWDfaqv4u45hvdYDriOHmULf4WlzHixQW88I30FQj3FP4wHowMNxMZaRovJX?=
 =?us-ascii?Q?n3bC2x0sSoGUo1RIr3QywjGF5heal1EvFvZmKsquli7rcSqi+beWtNwCTnw+?=
 =?us-ascii?Q?QH+uh/b0Fzy9LC62Lh96+LwFgfl+bB11IahLYPzUViphqfEIlwIs+vU8vhPC?=
 =?us-ascii?Q?DRNcMIRs3gnjbGe5n24G9uYX+rU4IqAkl2A1lLQAGgJUESPYuQU5r4LBeThw?=
 =?us-ascii?Q?UBQpB6mnbVwxRP6oVhLlJWKF+UtgytWo2Wx9ouiUPW6mPltuR88oEStn9KxE?=
 =?us-ascii?Q?mRcRaIUQMoRqRWki8F1CvxSXXPgy4lDyk5bF9gsyTDcZByTz1zoWm8wK19Eo?=
 =?us-ascii?Q?0FXCxiS8whw+vrxAmvGpgkZMZFCwsLOOBM+BtOSFWHc62SJYb+t4uNuYN4EB?=
 =?us-ascii?Q?Mcmef2kB1ozf3Vx3kB9B0fqBLtonmAa0Ri/OJNjqan1+vzKewg5hJsJ7RKqp?=
 =?us-ascii?Q?SMgYRQdhEOM/YjaHZIqrp/uGaFCbs97zOcOKOrKAszeiZCX45ndGjiPPOCH2?=
 =?us-ascii?Q?IElHwnKxVTrPrjjjV6vss7j4nhPhlKseCd6JDOcuRbiTAQiDNLbXBA6LSLU9?=
 =?us-ascii?Q?QDQLVdazo8N6dm57BnzwX8ICK9R97fMVJa5aGU++C81C2k6J82yJ5Kv363x7?=
 =?us-ascii?Q?U5sjkrsesC9qlwP/I5Tl4SburM6Xgs4x5KhzUOpvA/4VBXAiQ4U9KjpmRM0K?=
 =?us-ascii?Q?KdAEboU+hZ2p12BIrVJzKxJ5dXFKzTaTqztBgXCRxCF1F/2aa8vyX6PwUoAr?=
 =?us-ascii?Q?oDFlWWHF/8hVEmhDeVdfZdZPPXlDtPekMzLbjECgog7pmuNvvoJdv7QDjkp3?=
 =?us-ascii?Q?QF9kuMNQH51NmAqJ+wNuwuLzdtnO3YsdiDsP7LEbaQoP3C/sQa4cGz9759Tq?=
 =?us-ascii?Q?T6WuDNdUfuhfLZJmvHcGaeQIUSSp7deGvSBboKJFoYis2FYyh5QJOco2Ntdh?=
 =?us-ascii?Q?2TRiLXlK0itheC4IUS8NqoQPMoNYX8mZZWlRsGx7bYt9p/TWGADg8GeAKBZC?=
 =?us-ascii?Q?WpPMmlwHtcXAclFrRKtwOfY2c0a6WFxfW5NrHd9pJJ06Ln/7JFJQGdz/q0CB?=
 =?us-ascii?Q?2y5/LplOylO8emOIm6hifYHIUN9LXt2KvR1yTk53OIXDLaBrMZYo9UKkmO/Y?=
 =?us-ascii?Q?S0bD50NrzIUGx++HAWNGFo3ELd9dnw9mNCKEBgij3363b37EUkrTt5YeWqwf?=
 =?us-ascii?Q?JYLHxBQrKg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab5479d-ae76-4ef6-773d-08da269616bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:32:09.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: td2wkBK9YkcAHiFj5mmvYuijr+lhcC4Pjzl44ZVZqzBUX58CA8SXvlhRVCvp1HNuwG7nnafQr988hMtZ6HouEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2923

As of 68a8aa5d7264 ("iommu: make map and unmap take a page count,
similar to flush") there's no need anymore to have a loop here.

Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -308,11 +308,9 @@ int iommu_map(struct domain *d, dfn_t df
                    d->domain_id, dfn_x(dfn_add(dfn, i)),
                    mfn_x(mfn_add(mfn, i)), rc);
=20
-        while ( i-- )
-            /* if statement to satisfy __must_check */
-            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, =
i),
-                            flush_flags) )
-                continue;
+        /* while statement to satisfy __must_check */
+        while ( iommu_unmap(d, dfn, i, flush_flags) )
+            break;
=20
         if ( !is_hardware_domain(d) )
             domain_crash(d);



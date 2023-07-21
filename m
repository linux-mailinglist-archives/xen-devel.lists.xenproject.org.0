Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E2D75C8D4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 16:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567562.886791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqgg-0006ae-8v; Fri, 21 Jul 2023 14:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567562.886791; Fri, 21 Jul 2023 14:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqgg-0006XN-5L; Fri, 21 Jul 2023 14:00:54 +0000
Received: by outflank-mailman (input) for mailman id 567562;
 Fri, 21 Jul 2023 14:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMqge-0006XH-OB
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 14:00:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff29d584-27ce-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 16:00:51 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 10:00:47 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5486.namprd03.prod.outlook.com (2603:10b6:a03:28d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 14:00:44 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 14:00:44 +0000
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
X-Inumbo-ID: ff29d584-27ce-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689948050;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HPs0jO0dgxc3GjGS7waCoLoeQGzAyYKP+W+WJc2h+bI=;
  b=fNI+ds3l6+B/lPPuFVHjcZ7fMNn4Wu2KqBWbER/Il40MkeT2nGuOz8cK
   3lzV5e0Vi13jBCie911GJMw/1wm4GyglhL+v6B1jX6/anH5coklqycSBk
   BwoI/yHvQSBGLeYe4HQZfxW6ekRrwP5y839t2F7iWvb0vSahK+A7vZqxN
   c=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 116880714
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:P6qP/a8Cr/gZn9sPIinwDrUDR3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DdOCG3SPPyOa2r8edx+atm09hlVv8KEnIVjTgdt/Hw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoS5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklkz
 /A7dgAvLSuOhuu6kbm5ZOBAhp08eZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpidABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWw3OrAN1LSNVU8NY2oH3Q+EsWUicmWGu0gKeCqWOwRs9Qf
 hl8Fi0G6PJaGFaQZuf6Wxq0sXuVpCk2UtBbE/A5wAyVw6+S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hRS2NCsOJGkOfxgtSwcf/sLjq4E+iBHIZtt7GavzhdrwcQwc2
 BiPpSk6wrkW08gC0vzj+Uid2mr14J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1RdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:D9eWVat21eeLQXv86tN3IRLQ7skDUNV00zEX/kB9WHVpm5qj5r
 qTddAgpGbJYVEqKRcdcLG7Sc69qBbnn6KdjrNhXotKMDOHhILKFvAH0WKB+UyDJ8SkzJ8k6U
 4IScEXY+EYZmIK6PoSjjPYL/8QhPGa7aayif7a3x5WPHpXgmJbgzuRyDz3LqS7fmZ77FMCeq
 ah2g==
X-Talos-CUID: 9a23:cGnE0G0TCq09WMd1g133urxfMPopUSPt7jTrLk6xBTdiSpOcZV/J5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AAcQsww+3a395iWWkHec+XzOQf5tIw+eQL0VXq6U?=
 =?us-ascii?q?Li8alaxdTFjmAkTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="116880714"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrHxPp5EhwhCMjvzV3aVw+MtfStgColXoERm4KfgTmNFgsxIjzk5ddu+pGbACWHVFLHvuqKQdoTxmu6nJ+xvfRTz+xu7jktRgoZ0hKfcxiYjafecMsUZpE+DXeHJxeh2BAqS6I+scYCyRvByCLujJMM+c6YeVuca7xgEW3KY1h0MMHndx0MlA+vGy4kB+3UUqyjrlayPHDzMqxGRlVGiBeXUwKshCwrp/kaBe1WL9zjZ3cJdVRp/PwNGBhLjeNLsFL/E4yug412atxIKN7YKgh1JJgtU7l7rdfTt9p0B77wQEhgOjmKMI1pwp4EXpAa6aAKjw7R0pwULJfLXA3zc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGCR4WQjahRGD85HAR+HBHPkFJZjYjOYKGK+49iIN4k=;
 b=ZBLCUHo9ROJ1BPnPFGHByYdb5QF+MHbt50HtwvrBphaT3Lxs7z3TKuNiM9t/43ssj/fgb8CZc5iiq+cd54E0Orvgc7Vvzew2M5abH9YhEEZ5QESIlzjt9kVpA0bnJMURo6Kt0ADkKENFFXSWMEmKdQblFGbptgtiEv9+5mvPvIHKzmgm1ER2IZvPsNcNkXfggSYuQSIR530B9xREuS4Ngd0zns2PKyxed04c4zaP+r+Vyq+OkcGQg/cxkY/+mHORvOMelL8JbKMLvAx2OjQtR8JyV/KeIlXcNVffX/M7cZKoORLrF75sUASp2cyzy+JdAqPB0t8oAnZRJWbFinVolQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGCR4WQjahRGD85HAR+HBHPkFJZjYjOYKGK+49iIN4k=;
 b=bvLDrFTIbQmZTloxxf19IiqCyStwPOZTPRCn9PCqMwJQyRHcVm7J9YXgtrB103QClWaulh9I4/SnbDw0evenUvgH4ewt73lScC/p1wSv5ZrmNPhQbrbPjObxUsi/F8k6tALMFjrhJyS7CWnv7JTSlxgETjyNH9wMQm/aeaoVYBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 16:00:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 11/13] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <ZLqPhwEcV6BVrryh@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO2P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5486:EE_
X-MS-Office365-Filtering-Correlation-Id: 63207440-952b-47e3-80f7-08db89f2e094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/U6GDFJ+dgImlseuHryHJXJyqy17ZGe/RtResxtqd7GEdUG+W4BUcT6HY/4XIFfivyAy4MJIlyebV0fbtIt/iPYrH2ZiAty3ruwC+L86ewhgLCTGqaC5/CF+L+aomsoynuaSehHaxZZqN/pvyCPIm2WwbyPvNUpYvv2WPDExwKLVNXYkb2mxwWR/l0vknWjrSSDUUmhEUMTOn5ZcFibRhtJejg4rCoUMP70iicme25ONjpGM8u8SfnUNZFetnA7ypnHkI2B557rLI2lI7lImBRCuiC32eaPgsWmg2icv3ji5E03WA92OjvkGj464XqiBWmJlSta4OAg8tppqg+hybjKN18CyJPvTtARu4BW45Xpmz3YV+u7sq8mJU1z4SNvaJ/IR+zQbikEBLE6gfBbNBGcLv6SZJCcrkLkT8n6e4La83uU8Qq1sqAJxzePlRIAa6L1vgAN0n3dsem/fkE7numYX9r6URnktJto22lXeMcask8Z8sdDO5Akv625pGwASJr9uBqFnhhTLtkJk8duDhLQh+H0Z5lxWbJ8G02qMdePD0jCx3XPsIQaXQD+WtRkQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199021)(26005)(6506007)(38100700002)(82960400001)(186003)(83380400001)(85182001)(9686003)(6512007)(2906002)(5660300002)(4744005)(66556008)(478600001)(86362001)(54906003)(6486002)(6666004)(316002)(41300700001)(66476007)(66946007)(8676002)(4326008)(6916009)(8936002)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUlrYklsMGs4a1FGcGNvb2R3NHQxYnhycEZvNFRPUVpkd00ySEk5clRpNDg0?=
 =?utf-8?B?UW5aMkU1MUYvL2c3L1h0eCt0aGtkbWtmdktYMHFod2xYRGJtV3FaNmtlLzNJ?=
 =?utf-8?B?S3RDVVE0WHhYa3VjK2txMHdTQWNQMWlURzZwR2JyejNzeXJlaTFjZEpqYlFB?=
 =?utf-8?B?WkZKNU1YMktIUGVNMHdBNXJtYlZnUnpQZEFTVGR3ODhUUE9BNnlLTVZTeWxh?=
 =?utf-8?B?WGxyUDJWeUtiQVRBMk5oWkRDTkNLN3IveDVweEREQkJ1VUNZN2hZY0QyVkM5?=
 =?utf-8?B?WDFQcWNBeWRycENiWk5WL3JHN0VJQ2pET25xakZYUXJNa3lIT2JvSTNoWGxm?=
 =?utf-8?B?TCt0R0NBSTdtUEJtc3NLWHlGcXZRMDN3Mk1kclBHaVZJUEVMWFR0Q2dSL0NJ?=
 =?utf-8?B?a3FBbkU5QTJjbk1DRCtVRXBNd3VPSTVXNitWY2l4TUJmZ0pob2kxMmFjSlVX?=
 =?utf-8?B?cFlqK2RhZC9NeHZNcVFUWGErc2kyN3RpYWlDTDdJd3JQTXJrN2FpYUlIOGd6?=
 =?utf-8?B?SG9xYmFid0k3NFhBK2FZZDI4bkJhMm84RU5sV1dBaEhyRDViSkpEZDhXTEYz?=
 =?utf-8?B?dkJ0RHFYMm5QMk5EUWZRWTA3RjhRSllaRW5XU3B6dnordVFxNnlWNVhRY2xs?=
 =?utf-8?B?TmZmSGdTQWl1c0xwQXJIeUkyOVFUSDgvZE1aS1FyVWgvMUdRSS9zSlBWZnFF?=
 =?utf-8?B?M2xIZFpyNWo1bSttdlRSVzNjbmFDRHJLWk1yaUJzNkxqVi93L0E4akMwOU5G?=
 =?utf-8?B?YWh0VERvamM1bSt5SXhNRExJUENwNFB4MFhVMHVPVUI4NnRWQUZKaVVtZEps?=
 =?utf-8?B?Z241bTlNNGxyU1J3U0F2dXFhdHl1QnQ4d1VZVTdNcWFJcU1EcDJZZHVtWDVB?=
 =?utf-8?B?eDNPWkRqT1JNbVZTUlRDd3FVZ213RW9id21kbzJLalNBT2c4eElsUmZHM0Mw?=
 =?utf-8?B?YXE0Z0NNS1pxK25XY3pWVVU2akNJMDZ0azJZUk5yM0pjblBpTXVoRXpBT25W?=
 =?utf-8?B?Y2JNS2FHUDI5dmRuazM5YitDTE1JSWtJRFByWnNURHplaEg5RC95TXVjRHM4?=
 =?utf-8?B?bTBTdnRtWVlrUk1uOHJFaTJnQjFhWVJDajV1TEJMYWQ0Vk5EU2M3SUhHQ1lr?=
 =?utf-8?B?VHVBUG9mbWIrcE10MXpnMGRDWW5XQUJQYTVFeUZmNHhaVXpmTm1Icm9IemhY?=
 =?utf-8?B?NDhSeUFnQWFpWWJ5RFB5ejhQRlVCMk9YZGNjUmdLNDdaWXJuVm8xLzJ1MGVm?=
 =?utf-8?B?WjJTWDdrTnhtdFNrMU9xOGdrdzY4MFVWbU1YNWhEdkNmTDZNdDVIenVQRFVM?=
 =?utf-8?B?T2IzT2hSYitBUDg2OThkTjhaeFpWUUFRQkpySy9oQTVMb0ZhZ3ZLRjFoaWFD?=
 =?utf-8?B?TVZMZENka2tkMGgxaFlzbmJKSklWM2VIekdzMk5lMnlzbFRBZEN6VGVORkdw?=
 =?utf-8?B?T2RWTWVwQzd1K3NCZ2N3SkRoZEJKVHlURW5mSHdYSkhIVGU2MlA0OUZ4alRi?=
 =?utf-8?B?eUhiVEFEQVoxdWZyME1YNTBlSHdtZWcyZFFDS2M5S3hXTyt2cE1wRUpoY2FH?=
 =?utf-8?B?ZGp1d1QzU1EwYVErTGc0ckJZU1J1N3pERm0zdm1obFhVQWt6dWZUVVl5UzNo?=
 =?utf-8?B?UkJvS0l6dEdEOXZVa3lEZkVTNlhGbitaaFJRSWgzemIrS3lFYTNWcytPZGdU?=
 =?utf-8?B?Q3NzWXZrYjdCL2taVzVjdWxQUlVEZHB4M0x0Wk9qODZFMEdqSHhJWUY0Z09v?=
 =?utf-8?B?NzBnSExjTWhveDBCTDRqZkorei9lNWNZcWFlYWRnd2FmcTZEVU9OR2xXUWNt?=
 =?utf-8?B?MzB2Q3llRUIveFNiVk5SS1MxdmlvZW1qMGhYV0pIWlZTMEpwNlkwcitRcnlU?=
 =?utf-8?B?QWg3eHZNZElQaGY5czFOYlNkemJzOHdodW1NaTcxZGRDSGhFS0svY2xLMi9C?=
 =?utf-8?B?VFZaWWpHTFlvcnN3clJGY2swTldmQVdLR2ZmeTBUWUExN0s1YWszUUlmNmZY?=
 =?utf-8?B?Y1pxa1YvaDhzRlo3cDhCaTJGQmIwZ0o0YUROa05JWUt3MU5uTHY3MFpRUkkw?=
 =?utf-8?B?WVlRUVFnaU1BRk1uKzJHRmczakdXUUJ0UnhvSmN6dkZRazJWb0FKTTd0emxQ?=
 =?utf-8?B?TFlWWXZubHVyTkJTTE5ML1pnQVR4Qi9yTFQ4S2hxSEF2a0J5U2lsa0lWeCtK?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mjqUMV9f0pYkrShfswpyoiYspzFxK2U7pzqkhJufFqdAypb7pspul7FG0hasf69Z16WmmvDQLKkMrastuabUs69Lvk13aAhjfEf0WjweS6Og0GNNcdEMFyWDkqG9yR7DwRL4qt9G1Ov4p/SKhU3ATaWPmbDBe2JVyrRwpDppjCAa6xqaU5IIwf1Tm7MfzBeUy76Efc+CMHgZX/NOxSB6B1kqDjxnkhmjc3+xvSWczT65GQHMPzAc5vrnq+zTXAd2SKA9oaUmTRadhgitOkJ9o8zc3wZv+8r2mEY0ApQV1BTbHQUko32HEbPXzh/zhu0XSGpI8XaLxMSJxNc0L8swkqcrcR355m3GLjQQnDP+KZgDt/w9Ml2d9ghl9wsZWDXnJizUs+e6r+YpyRe40KsANLzK8cvLFLxCKK+Y93a2ZpeLptAm4iFDCuTeKnmyWfo1p8J0oaLT+qvggK56bK+GWtY665Dfqkk9dRXvdaHmjueW4s79T9lehjUiTSNMfSBDbykVBebtmp1gp6RyWrXtySIr79OGGWS3x9p+CY6mk+1PHjbUQBt7qWxyEU7sYNtbvYkgoTuD+5LqNa1K8fO0WpRAJTCbLJm1yx8zp/lq9IbGuGc5Tj+Bv2VzA4k+PnhpP26rm8pzEdFy8aZiXvr38hywNkaemS7tsw5yhts5FL1W2h5mFhENEQSkUBwQp7Hy/6lEDtRmF5gJUGRaVRMxS/KYBhO5rQa5smjWMNkQKVn5szES2viCVHzyTOYPrIH7JzBdumOplwAXdPcpsL4trKPvqVtyvRmtPWXHrd27LJQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63207440-952b-47e3-80f7-08db89f2e094
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 14:00:44.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzAJI0OsoI3aTCV0drnCsct93ddhcta2wGvbVCp3VLnJnZ6na61vE8vSd8nTU4U/0iLC6u2sRmvK/modEakSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5486

On Thu, Jul 20, 2023 at 12:32:33AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.

I do wonder how this will work with ioreqs, iow: shouldn't it be the
toolstack that selects the virtual slot of the PCI device (in the
guest bus).  Otherwise I see a hard time reconciling how ioreqs and
vPCI can work together if vPCI has it's own (private) view of the bus,
and thinks it has exclusive ownership of it.

It might be something to deal afterwards, but would likely need a TODO
tag in order to realize it needs to be improved.

Thanks, Roger.


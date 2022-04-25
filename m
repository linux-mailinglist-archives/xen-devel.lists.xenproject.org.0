Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68BD50DB2B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312473.529719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niu5m-00037a-Tc; Mon, 25 Apr 2022 08:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312473.529719; Mon, 25 Apr 2022 08:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niu5m-00035o-Ok; Mon, 25 Apr 2022 08:29:10 +0000
Received: by outflank-mailman (input) for mailman id 312473;
 Mon, 25 Apr 2022 08:29:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niu5k-00035c-U5
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:29:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c601b801-c471-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:29:07 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-bP04QAlhOe2EQBEyjg18Sw-1; Mon, 25 Apr 2022 10:29:06 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8021.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:29:05 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:29:05 +0000
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
X-Inumbo-ID: c601b801-c471-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z2vjN2m0sI6wewrZIc2Vi6egwfUpSl6a+CXzDwfH8Gw=;
	b=GxkvIsUceHG27uIN9xHSJ1nvLyPgA6xPsCRC5oG9YS460uVytg5n5C/ebYOGW9NWjAkNOu
	DFOxAunrvmdmEeIyu4rk9fbS5j/Zi2XlX8DfWxP9U0mFWHESH7oCgKJH6i6/BCSOOI3Ohm
	JKHdxEDF/FBMKzuetbRrrNYRmjj4k2E=
X-MC-Unique: bP04QAlhOe2EQBEyjg18Sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dP26ePVuI4cf7E0NzvLGRferT3clbTpXCcv50tYVj8WQ0Nox39i1BDsCwydx78VmHAiJ2XRAUlX4R48Bo4NuGiLbR1Tpc5e7FAd8XdYlnIwTVMWdB/sNDr5DJGyJnBIys6I2cx2+F3BwCzreeEa1yMzV/adgyXEk2buakLJ4KzyHTMVhinbYVJgWSgblEznPQEoHJ+aZyAgtoL/e7ZoatN2Oxx27N+xLhUL7aPalnzq6snTLLPueh7Wj1H8mtKrKPjLIPRP+55zDR51nqfdQcDLfD9WZteIVgZcq+YpjQEqX6TX9V1g2ha5OKuU5lYdlaDvTZZFYvl8hxthkTXa8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2vjN2m0sI6wewrZIc2Vi6egwfUpSl6a+CXzDwfH8Gw=;
 b=PzQ/mVeIuPdqkzNgGvn4lGIaYgooSFZPL8KWTRY50q8PSbfIP6A+xT3roz7CMt0tgq9tT4eyOWaSbSJJLAnmYpb/E3Ft5jLTpP1VMHHbLnCEf/ZBZKv2YC9+Q2dPxg9Xs9SAQm8BhU6977G6RWJtLqv0BNlGrmywJs8GSTLzhyGGmdAm2nzEqJ2CyddwC6ATuUYnykxxhbynzsuFfZS3ST5wGzhqVdSeAldhvO4bWuHzgEYQQjkb0xqvkMucdNdT9k0dex7WcwCnAajlHjd+gLoPYjUluq3iswJzJARzB/T+ZtRadh2cPU0D3/V8cHPzsP8NLBG2uVOeAwn+2fc9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Date: Mon, 25 Apr 2022 10:29:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 00/21] IOMMU: superpage support when not sharing pagetables
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0478d19-7f98-47b3-3847-08da2695a8b6
X-MS-TrafficTypeDiagnostic: AS8PR04MB8021:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8021F8E74F509D5661D7534EB3F89@AS8PR04MB8021.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ftvH1B7vyWQtJ1pOXUwhpmWsQdV94gbLm7U+3VkWOsdtaqE9DCZEaCxWiljgLvOrT8czBGALjum7rR2Bw1oLsOIF5DzF9PJXufAMjssYigs3zjbNOVEMb+JJ97OqASifur/xCt4KLddVRb41qsPC0mLcvLYhLpS3apbAqWpClV5ELS4n/rFhTTPHQmgdkaGGGExu0ho0a0lynYCNY59CgrPLiI8egg7REG1UKSggUjGHpA0B5kwEsupXs5TrpHSYMkODphtYFpfYy2FEsywgRrs0HhX8dWgDcb8ApUU7ZIVjdH80qeARbeSD1Jk2qQlfHb9f1aPFWjLp8lndiN6fSRqjwGJ82gbNBoMJ2LMFIRR54zhxJUN7AkcWPr91kLM3MfZIeJiP8axwnZu9aMnGiJIvOjY/Ex+OiOIBzmeYcNzbG72HdJHj8g06AjTpOmNKwaQU++5p2EJoWToIWRixOWw6Zkz70lyAkhjkBU89+SyseNkvHAMQt0X4WyrE56q3vquHBz7xd4ha4JhAlsaKno2w/D4Q3d6WKwu+mXDNbxnkcP7ztq3MrLAnSUm1jzi8TtV9lFipcld2hW7ck5cJ4p/QWfUHC5W57AsqDjestPtYUCKTgzenfB9yJyUQHStIdUYPli8E6/anT3K80OSHMUsfxKE9y7FtvHbQZyRby2wFn/9kJIXRHV6AI0upyKFSy/U1u6Sb3e7Xo6Mtz4jV1OLreHAPIpfDSbgm15sr9lVkNjQ2d/aIdK4MPBNqtyY6D9qpL602FcvkzOa2qXCqVPHS1r7llrXkcwJmFOa8745w+4WniyygZoENvFAcIOe0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(966005)(6486002)(66476007)(4326008)(2906002)(31686004)(8676002)(5660300002)(508600001)(2616005)(186003)(83380400001)(38100700002)(26005)(86362001)(8936002)(6506007)(66946007)(6916009)(316002)(66556008)(31696002)(54906003)(36756003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1ZjSzhHM2hncjhrTkJMVCtSSGlISXhITmhZRmM1b2s4ZjEvMDQ5QjU3bHps?=
 =?utf-8?B?M0l0ZmlZcnExMldxYjdodFZ3NHUwZkpXeGszaDJ0RmRKU1d6MzJvcmdqdTE5?=
 =?utf-8?B?dStwMnBjS0JPdTd5QXFVVUxoaFErbXFqZ29BaTd6T1dBenZ0QTM1TlpHZi9I?=
 =?utf-8?B?U2lYWnR6YVlucytpWWdjNDlwT1dIT2xxVnpWWEJKOVNId3Q2N1N3bWpFSTFG?=
 =?utf-8?B?aFEyOG1LZHltc2o5UnFuWU5GZjNrYmRUZkw5b1JiVVhIMlFyVWhHcHd4aVZi?=
 =?utf-8?B?UGMzQU95MlBFenhLa0JQVnZqb2p2ejMyamtweU1YdmgzU0JWUnYxdkpERDRK?=
 =?utf-8?B?d0lWK0N6RExNQytwdDVpZXpJRjlEODFpQmNBYWlXckRlNVVpcCtvaHBPamhr?=
 =?utf-8?B?R2hub1g2aWQ5UzRhQzYwZVJac3lEc2lUaUlwNTk1OUF0UzVjVVJ1dkhKem5i?=
 =?utf-8?B?Nk9jSlpxWkllZXZNQW9uNkd6ZTdRb3JrTDZORXBNcVBMNTBHSE00Zyt3WE9O?=
 =?utf-8?B?RWF1MWxFZmlFRFA3MWlFeEFrNHphZWFkUzVDTC9aL2s1Rnc5OUFIdkh2RGNM?=
 =?utf-8?B?THNZdEI1VmhtKzYzLzB0OUlkM01ybUc1bnJyZ2lJWnJjQzkxeTJueGNyc3BZ?=
 =?utf-8?B?a1lrd09xallSUlpCUHhVdjdsRC9pWEJnSkJDbmc4cll3Y01aQjNhajlkallu?=
 =?utf-8?B?cWZveHVzeXFqOFcxQVdic3JBQUVpRG5TSHp2KzdsL3VRUkJXV2hYU2ZoT1lZ?=
 =?utf-8?B?a2FBODViVDZVbHU2alZMeE5aL0JuSXRyejVzc0ZFaFk3NklwZml4djg3aVlZ?=
 =?utf-8?B?YjZwclNoaDM0Qk1qdEpFdlptTW9qUkp1enMrL2JZeDMvRUR0K09FbTdsVVR5?=
 =?utf-8?B?allSMGdNVkFXSEFxWEp4T3NsUC9oNlpwdVlVMmcxZHJ5U0ZRTDhzTnNSSFln?=
 =?utf-8?B?YjV5Rzh5QUJ0Y0JSSGtxQlN5ajlTNzlCQnZCV29kWkNyNi9OZlhxRE43dFpK?=
 =?utf-8?B?ZU9uMmlYOFd0TnBZbi9FTTF6a2x2d0c4S3BZdlFhemN0QWhXV3g1Q0k0cmtH?=
 =?utf-8?B?SjRLejg3TCtnREwzMXVROVJLeG56aDNIck9GcHMzZk9yYmZ4bGJlWmlJUnM3?=
 =?utf-8?B?T0cySnFSV3RBTnlUN2dqSHIyMThpdjRHOXlvdS9sVFJlZ3hoRFRXU25MZ0ZB?=
 =?utf-8?B?VG5DK1hkaC9zVUkxU2ZESkJCejJMM3VIZDYvV0YxQm12cExDZEw5dGcwanpo?=
 =?utf-8?B?N0NsNlU3VUxSMHFLZjZ4REtOZ0IvMDZiTXFrVXFOZHN2bnQ4aUZNVlUyd0sy?=
 =?utf-8?B?cTI0QStkTzB3QkU0VFIxak5qZmYrck1MeXZjNVJpaVkzQ2s3VzFQbTZ6VFZr?=
 =?utf-8?B?eFdURzY1L3NnWU1oSnFpcU12L0JGY0pNMFU4eGNPc1MvUjFlbURqWEdTYTBB?=
 =?utf-8?B?UldZK1FKOWd0SSsyRm1DaXJwQjI2WFprVnJUL3F1S2d3b3hZZTJzSjRob1VB?=
 =?utf-8?B?a1ZyTUt0ZDdLaU41MFBOREFFY2JUVlowbTdhbjNqQUsybWxKNUMzajZ0UmxL?=
 =?utf-8?B?ZGRKdngxMEZLTG9xc0lCNVlzN1BXcUZKanFBZ0s0dnpjT3U4ZHVIRnN4OFZh?=
 =?utf-8?B?TzFyTFdXODN5TE1VOGJKUjI5Nkg3MHhvUkFnVThzOE9YRXArMFM0Y1VaNnpG?=
 =?utf-8?B?dlMvY01jeE95NlBRVEpsa1dSTk1TaCtKekJKMFVQMHFZQ3Z3Z3hGYmEyYWpI?=
 =?utf-8?B?TlRBMUUwWnV2VlNReGV1SzZPVGw5TUdMUC9BVkJ1SjZUTkVzZzNXUDBPcXhw?=
 =?utf-8?B?TlNPS1psUmFqaDRwb1ZoUEt4b2NDQ3gwdVlscjQwQlFuTEp4bXpMaStRL1JP?=
 =?utf-8?B?c0pQOEZ2anErUVVmSVpqME1pdEhtbXM0dG1CaGlHSmVWT0txRjFQMEdPMVZ1?=
 =?utf-8?B?Z3QwN2tsbHQ1RHdqc01ZMEFWYkdBUkgzVjJDcmpUKzNtMnZVazEvQVNlMEE1?=
 =?utf-8?B?SzNxcU9lTW13UFppQjFvN290a2Q2emd1RFZ6ZU05QklIVWZ6OWx5WlJwNzJP?=
 =?utf-8?B?S2JNUFpKYTd6dGs4OHdYaW5taUJON3h4T25ZQy9UakFMeEJBc2taKzVDVXVK?=
 =?utf-8?B?SGJTNDFVU1FvSVVtMHQrekdkS3RNZHI3cElwN2hPMmhlTGlmd0JCQXNYcGgw?=
 =?utf-8?B?VElYZGJZNUFKV3ovTTFzeHVYa2RoODJSNmRqbnRXNXlqZmhTNEgzbmNpUHIy?=
 =?utf-8?B?Z3QvWTE1RXdKZXBTMmRGT3FqeEJ0MjJ6VE1ETkRrM2w4a0xzdDVJTDFOaHQ0?=
 =?utf-8?B?aUlTeUNLS3RCMEtNQWZVUlZiWjdMMDhMVGxIdlRERVJJQW5YaWY2UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0478d19-7f98-47b3-3847-08da2695a8b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:29:05.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiClTMN3XfXlIAmcWo5dB/Cr6/ET1LEY0CgJ+o3owA0O5RiaZUsJqmGVALtWTW2WShlCOOw2YVVEu1l8nLUbEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8021

For a long time we've been rather inefficient with IOMMU page table
management when not sharing page tables, i.e. in particular for PV (and
further specifically also for PV Dom0) and AMD (where nowadays we never
share page tables). While up to about 2.5 years ago AMD code had logic
to un-shatter page mappings, that logic was ripped out for being buggy
(XSA-275 plus follow-on).

This series enables use of large pages in AMD and Intel (VT-d) code;
Arm is presently not in need of any enabling as pagetables are always
shared there. It also augments PV Dom0 creation with suitable explicit
IOMMU mapping calls to facilitate use of large pages there. Depending
on the amount of memory handed to Dom0 this improves booting time
(latency until Dom0 actually starts) quite a bit; subsequent shattering
of some of the large pages may of course consume some of the saved time.

Known fallout has been spelled out here:
https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html

There's a dependency on 'PCI: replace "secondary" flavors of
PCI_{DEVFN,BDF,SBDF}()', in particular by patch 8. Its prereq patch
still lacks an Arm ack, so it couldn't go in yet.

I'm inclined to say "of course" there are also a few seemingly unrelated
changes included here, which I just came to consider necessary or at
least desirable (in part for having been in need of adjustment for a
long time) along the way. Some of these changes are likely independent
of the bulk of the work here, and hence may be fine to go in ahead of
earlier patches.

See individual patches for details on the v4 changes.

01: AMD/IOMMU: correct potentially-UB shifts
02: IOMMU: simplify unmap-on-error in iommu_map()
03: IOMMU: add order parameter to ->{,un}map_page() hooks
04: IOMMU: have iommu_{,un}map() split requests into largest possible chunks
05: IOMMU/x86: restrict IO-APIC mappings for PV Dom0
06: IOMMU/x86: perform PV Dom0 mappings in batches
07: IOMMU/x86: support freeing of pagetables
08: AMD/IOMMU: walk trees upon page fault
09: AMD/IOMMU: return old PTE from {set,clear}_iommu_pte_present()
10: AMD/IOMMU: allow use of superpage mappings
11: VT-d: allow use of superpage mappings
12: IOMMU: fold flush-all hook into "flush one"
13: IOMMU/x86: prefill newly allocate page tables
14: x86: introduce helper for recording degree of contiguity in page tables
15: AMD/IOMMU: free all-empty page tables
16: VT-d: free all-empty page tables
17: AMD/IOMMU: replace all-contiguous page tables by superpage mappings
18: VT-d: replace all-contiguous page tables by superpage mappings
19: IOMMU/x86: add perf counters for page table splitting / coalescing
20: VT-d: fold iommu_flush_iotlb{,_pages}()
21: VT-d: fold dma_pte_clear_one() into its only caller

While not directly related (except that making this mode work properly
here was a fair part of the overall work), at this occasion I'd also
like to renew my proposal to make "iommu=dom0-strict" the default going
forward. It already is not only the default, but the only possible mode
for PVH Dom0.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id puh6Ch01KGqsAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E3661F01
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=tiwgoMxp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333592.1596713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydq-0001r1-8T; Tue, 09 Jun 2026 15:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333592.1596713; Tue, 09 Jun 2026 15:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydq-0001pW-4p; Tue, 09 Jun 2026 15:45:26 +0000
Received: by outflank-mailman (input) for mailman id 1333592;
 Tue, 09 Jun 2026 15:45:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wWydn-0001j7-SD
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:45:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWydn-00DRr1-8p
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:45:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a28350a-e002-0a2a0a5209dd-0a2a4507d5a0-16
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:45:23 +0200
Received: from [40.107.209.48]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a28350d-229c-0a2a45070019-286bd130e868-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:45:18 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:45:14 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 15:45:13 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTlUq2fUM2pnEw3KtFzYEzVleFHXKR/6jzCEsIu/Gcnw/zPebGO+wU8QZwLsUHMlhbrvzGbd0YBi8lvBOtB4UKIBiNRD4rwyvUoRozOVJYTv3f2O+fiCns+82+tF6VPvDgxFoFey9ZMmqZv4n6OTAzOS1S3yOVnTbOtww3s7Bw7OOAPfh0ESzBDDXAC2sjuj1BkUNupKVFU1Wak3teseqYxEcjKFkJQuWrtZaH/gRXXUhOykStUGQSMsoRu7L85NLlCYv9ifr46SPTA37XVz3cS4YlAN+YyOT1t/aOpZubxwxRkd6PzBMDYEUJoxNZKrtHvK64uEXKOOtIAImoAiLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPg+TWxKIYR7XaCE1xZJb8H3djSCjAFUgUsgKxDPc0Q=;
 b=Wdq3I/dtHErL1WORbMkdJOYKNj32oSpS/JlTbP4yTt8mDvHb9yZtbZL+URct0Nz6TdAnM8YBrnhCWoqbvTV8l001daCGxPSVb7S5dxJ+CAtGzGm3xfMGWzd3MHeGWLkoPZG/UlfBhWGwl/iuZcm7xQB59TSiACV2h2rl/ZZxYJrqVbQon8T0BYVsmz3i6XdWfEfyKnaLo8zWgFNFfdByHSEnzY+pHoHSiM43YhrcNVGZijspCJ6o6hHdrcdJpp/vTpLrRqxGz/aN2GGCjEx1jKyOZXsa12WpyNNzy03UKbi28qYVl4DB/2JFZWqPocEi3bUElBgSiRTy8YzOABZWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPg+TWxKIYR7XaCE1xZJb8H3djSCjAFUgUsgKxDPc0Q=;
 b=tiwgoMxphYeM5NJ8SLewcpAjM5/a9DwI8vyDEo+ydxUjMM/yx9CptbRItYnjwyWOycx/wcqPO6twrgV4V0RzJPSyUXuML0MGZsP/+xujWW5NgluhN8BgAuHuLV+l95TVC7Un76+YESlNJAneQJABVDgfS5I3aTjqaSmjqBqtqxI=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>,
	Kevin Lampis <klampis@citrix.com>
Subject: [PATCH 6/7] x86/kexec: Pass boot params directly to new kernel
Date: Tue,  9 Jun 2026 16:45:17 +0100
Message-ID: <20260609154518.779757-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260609154518.779757-1-kevin.lampis@citrix.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0450.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::23) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd852ec-ab58-4522-e3c8-08dec63e1806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	YYBOz7E6oipfqvpyR/YMHTTVsaJS1hqWyPLN6MSaJNswnloY++e61Yhq5WAycf6ibHX2RDmAsxkN1jEKmOXxcNT2XLbpmeg9rGH3MDoHFJFbwsURv2PS4NfRysiKmC4KzTZbQXMn0I/V2rqHHdvopKXwFM8feZM1G8mUy2UK2j+SmHp0zbtKtzHtUBEf9k70QRZX4r4q3LbvQaLYcdtmS3MXGRSm2veXcVq5LTMd67ueopdSJPMw36QTe3r9UPO7xX9TAaIspuHzZcymQeNuL9cP341aWrj3YiyfQymH0LxFEkccQKAzO3AdRZK15J4vVVescyeaunMw6HQihLxKApnqt/I1jrJvmNUxUP/kML6c5PP8p/MdUT7fouleyKonLna3Mq2WS49wzuRYE0LWwxgV1+OPptGwAjvRQ03gXL6/uTTbun+XXc9aFAJ1J1r1+4pRcTSKs5aNNYCuLbS7jFEvM/TVYOI2zOWYbji8c5YxuUTygWhNI+IzdRfkD0vXmAyF+sW5Ysu7JFF5KhfmIdvZPuCPbSi5h9h24xe7evlgHSqohndeBZpPXmVDWzi0fGfYJQ/6sbeCYyYIAzTE9K5TxfjNrkqBuJ+W91qSOJOVsBTOwDbKmyDn7Gdo7V8b0ta63BCbF8tQWmeIuJMSQHwKzXX0YX40wOpyA+VRLoVzYBDzxjX5sbirV4000Mfu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g7Hiv0adepktj0eX9wDa19U7YmyVJujy6VpoHOigMAKN1uAp+B95mg5Z+3f2?=
 =?us-ascii?Q?mA75NaESqEFnJ+yS0LC2EqjZW1n9aVPCr1LL0B5/TakcuaDQLWMg1z4nSWOZ?=
 =?us-ascii?Q?GJM5VzMbMqm4b+aLcDb1ueeBZvBpnvzep0HIfwXjk+i/4CDM9ACbFm7aP90Q?=
 =?us-ascii?Q?g3GMDULO2hhQfcimEQ0SmmOuSK9j2KaxuOSPYASxhGhsLLCwZsVkgG7pcXp5?=
 =?us-ascii?Q?sYcxjJ9zx5ELVdVKxBd5zNk4x05/P3CjVcWzfPpfOyr/gWO6ylWsjfrhPcfM?=
 =?us-ascii?Q?lUx/cYeHA/lUAKda4IualikU91m6tr9DoMcW0t92HO6YDJtwLuKRoacC86g+?=
 =?us-ascii?Q?+DOZ0geIgf/uYCa3Vg/Rgiy3FEjKSSgBErFk4Amfao5UUbtW2ydaHqTh7oB5?=
 =?us-ascii?Q?7tJv7wtiG6LrHMdfS2Oe9hyRdfSPdBZNz/RPhHUGjvPzdVrjacCtvEYjuZh/?=
 =?us-ascii?Q?pv8qximcfxWIuDGTlZDC4e8puJ9YSzMMlwq+n6qhuzisQhtxl857YXYVSEsq?=
 =?us-ascii?Q?nrnEnrlwPFr9e/gADaDhckrnDKtqG/JkAc0R1u6OsMyzQh9wdZ/WVd3JWWzg?=
 =?us-ascii?Q?137L7apLt1P9r/BpQoZCug5MB6FemE8/VMBCXWRAvU2YLqB4DJwCjMG0Pj5h?=
 =?us-ascii?Q?KSP2f7kCtagBzfX17xHXdLAfhy9ucutR+hKfiqDm4/KmPJYC10LoEREbVY0f?=
 =?us-ascii?Q?YHBkLfBy6HlPbfOfMqwVYNvqPzD/D78NS+QGSdAoDzeH36Q1aDUEI7xDeyz/?=
 =?us-ascii?Q?aU7WiVsZvuSG7OcxDLvjx4yh+2HWnNZvHqzLiPrqVZ3+gKUlEJ6Wby4+Ydtt?=
 =?us-ascii?Q?JiAWomZvGs84ZQ8H7U0o1NpZ87FloJX5tlvhskgkX93r73h9nj1/AZtznnAk?=
 =?us-ascii?Q?gl5hoQMn/CxMaUOhicjRLXaK1qgBDLhRFWBwCvRgFnfq881uV0G1wJnosgvy?=
 =?us-ascii?Q?8xweEoChmiRXO+fVtOYdWTAJvWDU8wXTOO7tutXZzskYbPSevS+xOoB6rWoQ?=
 =?us-ascii?Q?GKWW3+XWDIu4QSGFkazY803K8sqHC7uO34/IWxoG+SBGnuUer2kqy8rNAz9L?=
 =?us-ascii?Q?Pt1Yn6AVRGuEfeWCV+eTXYqNxkpaxrDC45b5QSn0UuY6im4nB1BXnnGT2TsM?=
 =?us-ascii?Q?DcvXJG9E6m4orE3XFUeEwN2aK6lfJ9DrOpwTP+mMHx40cXUeAZIj3Sna7MoV?=
 =?us-ascii?Q?jx2y3M4KT4LNV5MvtDWq7BvPQcainzTXvjZHDiyI80V/VzRZwJYc83deK1HG?=
 =?us-ascii?Q?6+e6wZYQiB/TxY/Wgq2YtkKAov0kLdAc2VeIFrWQfj0m7z2Fod4pW+naScir?=
 =?us-ascii?Q?KjjHwygsZIXej+R2y8hYY97XqpclSvDoOeREvFxpwbjOfWbtZL1bV2/Q34eU?=
 =?us-ascii?Q?TEykfo4rMdX9z+HG2awbgjIBdmSSw1MjWAS+0JZ1MBEu7ffoBEFOajt4z6Ly?=
 =?us-ascii?Q?QYvSSWL0l6ZmR2yLvKybIL9GxNb1/YHLzVFl5jAlqRi+yN84DUbo8BLznMnO?=
 =?us-ascii?Q?ZesbKjWVdQocCPZKr1YRlJP5t2K81jBCM4mGXg+c7wE1hwLLydOi8/ptmBic?=
 =?us-ascii?Q?umiqt2AsrbAkZdca3OCQoKhq/zU5sDPdN+fC78PAKpTP2nIzCC8sNYwxpRs0?=
 =?us-ascii?Q?sfVeQ+Ix18mvNKRVoh1TsH6m9+uNwPqd4e1dyubF1FStze5ZVlS/HKkclUxS?=
 =?us-ascii?Q?4Ccd9D5Vl/CSkgF3y2byS1G7w0THLMNYr+JCNV5UqLrtoedwpf+aUsfIWgr8?=
 =?us-ascii?Q?r4C6z4oWGQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd852ec-ab58-4522-e3c8-08dec63e1806
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:45:13.1258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcrPE6PC8LAOep5Vr9d5wg1kbESwr5Wa5SvC3phofBIksjc678378IH2mGbf4BfWtITTwYRYNHnqtxzUy8IrKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785
X-purgate-ID: tlsNG-ef75cf/1781019919-23374C48-7470FF23/0/0
X-purgate-type: clean
X-purgate-size: 2348
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:klampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A4E3661F01

When doing kexec on an EFI image there is no purgatory and kexec_reloc.S
hands off straight to the new kernel. To facilitate this the linux
kernel boot params need to be passed through %rsi.

Signed-off-by: Kevin Lampis <klampis@citrix.com>

---
 xen/arch/x86/include/asm/machine_kexec.h | 2 +-
 xen/arch/x86/machine_kexec.c             | 3 ++-
 xen/arch/x86/x86_64/kexec_reloc.S        | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index 3e189acf24..010e0c7046 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -7,7 +7,7 @@
 
 extern void kexec_reloc(unsigned long reloc_code, unsigned long reloc_pt,
                         unsigned long ind_maddr, unsigned long entry_maddr,
-                        unsigned long flags);
+                        unsigned long flags, unsigned long arg);
 
 extern const char kexec_reloc_end[];
 
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index f921eec5aa..2edc1bd0af 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -198,7 +198,8 @@ void machine_kexec(struct kexec_image *image)
 
     kexec_reloc(page_to_maddr(image->control_code_page),
                 page_to_maddr(image->aux_page),
-                image->head, image->entry_maddr, reloc_flags);
+                image->head, image->entry_maddr, reloc_flags,
+                image->boot_params);
 }
 
 int machine_kexec_get(xen_kexec_range_t *range)
diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index b52d31a654..6a2c839b83 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -33,6 +33,7 @@ FUNC(kexec_reloc, PAGE_SIZE)
         /* %rdx - indirection page maddr */
         /* %rcx - entry maddr (%rbp) */
         /* %r8 - flags */
+        /* %r9 - boot params */
 
         movq    %rcx, %rbp
 
@@ -71,6 +72,8 @@ FUNC(kexec_reloc, PAGE_SIZE)
         movq    %rdx, %rdi
         call    relocate_pages
 
+        movq %r9, %rsi /* boot params */
+
         /* Need to switch to 32-bit mode? */
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
-- 
2.52.0



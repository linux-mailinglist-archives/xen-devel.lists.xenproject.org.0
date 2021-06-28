Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479603B5D72
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147822.272871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpu9-0006yP-C1; Mon, 28 Jun 2021 11:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147822.272871; Mon, 28 Jun 2021 11:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpu9-0006v1-8M; Mon, 28 Jun 2021 11:58:21 +0000
Received: by outflank-mailman (input) for mailman id 147822;
 Mon, 28 Jun 2021 11:58:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxpu8-0006ut-47
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:58:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62e3e985-97cd-4a7f-9f9b-2416465eae8e;
 Mon, 28 Jun 2021 11:58:19 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-dY3iSNqnMbWEyLwuqv1VwQ-1; Mon, 28 Jun 2021 13:58:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Mon, 28 Jun
 2021 11:58:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:58:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0206.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:58:15 +0000
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
X-Inumbo-ID: 62e3e985-97cd-4a7f-9f9b-2416465eae8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624881498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BBtvtRsR+vScZJWOTg32R7Q02yQyzv+05uwRDq5vNt8=;
	b=Y4LEWryGdfsCYBp4VsKHOR2wlWdaXcr8GS6W2vTM8pgZujQoZS14+VeUmjpHqjmO47+8Jf
	OKtEXkx70shE2wUW5jZr7a+aKIFDhAfMwaYXL0gBD7SsyHoh7eFFwGh0dy27VH3jYtL590
	09PEWznDy8nWVWgyTX9wOKF50hgYGOw=
X-MC-Unique: dY3iSNqnMbWEyLwuqv1VwQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqsDjWq9i33j5ZgmB3n2A2noQHw78sjoCJjVuq+q3cbwWG0d/nWRNcXdyo9CBRTT+vx7qeDEsPCaGzp7Hej89viD82DENBZSUCJY6gAF28iRbL8TYCsjRkHKc9NM6YMnPItNplSIyuIMhFPTck0Ce91Wdd2nK2lOhSXr4CaQXXBnn6cFj7BK4Iqc2lhpcqzTER8dHTYBp9NsRjXgOQUJBOKufHZGfpg5i2k1qalvet3ZmQW3kW1I1Q5Qc5Vmper0oA9YGN1iRPlaqlNRMRbJCCob5slBDawWC5if7qs1HX/vOmfUJKorKpp4mH8nMvOMqpb5ms0X9ZhHqSWDKnDr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBtvtRsR+vScZJWOTg32R7Q02yQyzv+05uwRDq5vNt8=;
 b=OXnXKPEys7H1UWnlAkKOZpnphnJwJyOtIMZ+IGMHDWOplmeqxKIF4xLbdA4VJvzs4Hi5Q9xg11e/7HpIjnXqoHqhKZEFzDEjM3BUOXS4T6MMEEF2+/Uskipfc4U2u69iACDSS0bscjnckszg4daO4B/a5EqWKSfKu8eGhOBLW2dXGQR5Qe62EOl6qAKnRc+EH3N7D0EpeMIC6yZYElgtQ/j9gAD8GqP1KeMed5ZvLiWawA3QswXwR/43G1b/yUJUoqkVbMwKAxQEX7t1ugYxo6Nitjl/x3PAh31GZhlFw/JHJZCLq1sBjPSYjeXRSujlBTSdEpnq7ZuiNZJS0ja0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/2] x86/vMCE: change address space for incident reporting
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b16904ec-0302-4094-7d89-f484cbf0f8a5@suse.com>
Message-ID: <a119ae20-cd82-a4a2-e46a-38ad3cb918cf@suse.com>
Date: Mon, 28 Jun 2021 13:58:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b16904ec-0302-4094-7d89-f484cbf0f8a5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0206.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41788579-d552-4f39-df27-08d93a2c0347
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33905D6A7E601CD10E266E57B3039@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mH7Xq4gEVM/dxIdRsSYJrMhcn5ZiErLc+aKjH+ufGmM8zSZStElE8VaTPTf4Lj8Ef/KnF35wfycFqlLTYFbu1P8/qll/A33v+Mz9l8OzX3eWvoYze7O7IgCPCzpVK3PI5ryK3KKdi5pPTlKCe4/MIw2T4+q0ZVFZmDK/9SkZYwj9XCpbbux+8OIL8siUszAfQH1BBnykSrrikrTL74pLsE0f4tXQBXNiqgQTumYAl+SjYCOa3K3h2KIzVbzXfwDwiYuv+3leljSlGlBavG3wws4S7zhAN1WhK3PkZZeljSh9mM1jO3ZVqgdcS0cij0Pu7ccJbtDerJVjfo5PsXw7Ziyssc9cvBV5kXAJt/O4YbeAJCKeVTrc88kHF71zs9M5D1nXMggzvYy9X3Yodudo6zSFHaYnqpoZMt3SLkC56VoG8oMzpHLenpTLxD6I4jH2UwKTzOW0Bg9z0KXvA6P1yW17YO87SFErfJMRP6Yrs9IJksx7AanokyJWQcV5DA7OG/oK4fDi4zNy77asA71o4AEX7p6I5+XsdFN9uktw3Z9gQIE33+1htCws/JQq7X7qlepfKHTe5hbQKgehH+RjqHWLJHA9hP2ZT1yl3ybUJQs2ZSErXjBCxTR+am2GMMbMKBX0od8UFxSjxKOaVu5KPJCHQI68foqtxFM3ga01kX8v/MdotiNc5hJ7ekfEQlqPKM1+A5FlU2IY50NwRLNVmhL/P7XyN51ArHosq2TohQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(8936002)(26005)(16526019)(2906002)(2616005)(83380400001)(186003)(54906003)(36756003)(38100700002)(4326008)(66946007)(6486002)(16576012)(86362001)(478600001)(8676002)(31696002)(66476007)(5660300002)(316002)(6916009)(31686004)(956004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3Y5NEMwalpuMHBoaDJROGxqU3A1b3UzQjAzcFh4UWtJTnBOYUN3ekM1Nmt0?=
 =?utf-8?B?dytyU2pYTE5OaXV3UTdacnpkM1pQYzBYZEdEc3Zxa0ZvbDVFOWZTc0hXT3cv?=
 =?utf-8?B?Tk9DeWVPekRBa1BTU250Mkx3L3lZOTJ6OWtjZTgvMkVmVFAyZUtFeG1xNHpq?=
 =?utf-8?B?c3gxaENKS3ZaR3RHUjR0a2dIeEZSdzNNRi9USExkSXcyTzczODFPZjRNMXNF?=
 =?utf-8?B?QU0yRVhyMEVMemF4VmE4Q2VpRXk0MnBxRWwwakJHZXlsbnFPcFVRWTZMRlUz?=
 =?utf-8?B?NHFKRTZ0amxZUWhPeDVvUkN2VUd5N2ZzZytjL3RDYUJiYjJtS3NmVTNnQnRG?=
 =?utf-8?B?ODJDbHhZRDVsV0ViV0JxUHVYWnE1clVFd3FQQzdoMENGaU5oTlpLcGJDRDVB?=
 =?utf-8?B?L05LSFYwVTNPM29RbjNReERqcm5NbW9UV1FvdlJYSXljN0liL3F2eitiVmRy?=
 =?utf-8?B?dWd5N2xJYmR4aVlsdEpOV0RaczY5dWgvV1JiT0Z4aFNyejJ6Z2RsV0xuSnRo?=
 =?utf-8?B?N2ROb0RRYTErenNyQWx1WFVUV2h4eG03ZzVZWks4V3dEZ3UzSDNnZmFkekVK?=
 =?utf-8?B?L05VZm9yRk9qYnN6Z1JsNlFqVkE2NmlaVmdwdXViV1JsSGU0RG0wbG51TmZz?=
 =?utf-8?B?NDNNTDgvazVPTUJ1NTZHQVJRS1pObk5OK2hFajRwR2VWS0xvU1duZzRIcFpq?=
 =?utf-8?B?TEpWV1hEcVNCRnhjNW1YTTFLWnk5Q3VPTnpIWUdDaXQrd2lsRlNLZFhMREJt?=
 =?utf-8?B?QW9vbnVwSk43a2xlcW9WNUNGVUpTTWVmYzRjbC9mU0hrTUxFdnRoTytIOHpO?=
 =?utf-8?B?dUx5ZmJLUGNNdXBlc3FzZ3EyWDNMdC83bEwydFplUndhazluclkzSU1lcWhw?=
 =?utf-8?B?cWtQZHJzTUVTWnhrSS9rcTdTN1N5M2lxU2ZvVko3UzBUZERhcjByYnRPUTdJ?=
 =?utf-8?B?ZEs4OStrK3Z0cmsxQlpoSmJmNGdIMEN0VklzVzdtbW0vTStNeXFkWGM4c1hC?=
 =?utf-8?B?RTZ5b0Z2cEhpODdlRHdvRFZqS3o5Z0NGY09Dc3pqWmpqOWw5bCtJeXlmLzZU?=
 =?utf-8?B?dS8rdnFSRCtiSjVhWVJXSWE4UldDditTc0NacFFyZ3JTTXRCNTFiSTBlUlVa?=
 =?utf-8?B?eFJjZlFCeG1qSXR4WlZjM3BMaDRwbHNJQ1BUQUdOdmhPbEE0V3g3Q09FZDB0?=
 =?utf-8?B?bmd1TS9UM1hxbksxYm5laHQ5ME5YcVI0eXVYdld0VVZBQmJqOEZ5RVhEWTlq?=
 =?utf-8?B?eEE0cFQ1eG52ekZveXhBcG9nQVJ3dWJTTWx2eHZobm9FS0IzWUtVLzJNV3Bx?=
 =?utf-8?B?K1ZVSzNFWno2dE9BNUdQbnBxeUtiZElFVUdUaTVhSU1tUkRwaDBCMk1MTklJ?=
 =?utf-8?B?RDlwelRKeEU4MkZEbVl2SzNYOGc3VTMwMkUxRFl6Zk12Z212SlFRcWlJNGI4?=
 =?utf-8?B?QzBOaVJlWXFSellMcUZqZGEybXFEbE5xbGJDbmh6VUZXZUVGcVlxV0hEbTF4?=
 =?utf-8?B?M255VTFJejZYNzRXMHV5cW5qQ2NZamRKa1M1UHQrYjE1WEVYOUxXandkWUJW?=
 =?utf-8?B?MlNlUDJ6akxxVDY2Q1QxVDJSWEVyU0kzVTE1UkI4cWNkYW0wMCt3OG9sT21L?=
 =?utf-8?B?ZTBId2tKQTVhTndQYTgwMUJMYUZZeDNodzVHVXF3UEp2aGNoajR5Uk0xc0U3?=
 =?utf-8?B?eU9xb0JIWkRPRVV1aGhPTkw2STRmSmZISktBMCtUM1VFdXpwY2hxaC8xUk8w?=
 =?utf-8?Q?bz/Bp4gsQK11r22xS6AqVkXV9hUJjErX8N0ybEw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41788579-d552-4f39-df27-08d93a2c0347
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:58:15.8659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Myh23j6xBDpp/cqXauBIK+BUZ0s7mGV4HYoUt99xeYOwrtbMBLRjax16RtHr8W2F8vfTBp0XQAxqZAbPd5ywFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

PFNs are purely a software construct. In particular their association
with MFNs can change at any time. Switch to reporting back GFNs through
the hypercall interface (but stick to PFNs / paddr for the MSR one).
(Note that unmmap_broken_page() validly expects a GFN anyway.)

While doing the adjustments, replace an open-coded instance of
PAGE_OFFSET().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC because of the change to the hypercall interface, for which the
address space is not documented anywhere anyway. Aiui the main purpose
is to get things logged, and in a (system wide, even if maintained by
Dom0) log system wide meaningful addresses are surely of more use.

--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -1,5 +1,6 @@
 #include <xen/types.h>
 #include <xen/sched.h>
+#include <asm/p2m.h>
 #include "mcaction.h"
 #include "vmce.h"
 #include "mce.h"
@@ -43,7 +44,6 @@ mc_memerr_dhandler(struct mca_binfo *bin
     struct mcinfo_global *global = binfo->mig;
     struct domain *d;
     mfn_t mfn;
-    unsigned long gfn;
     uint32_t status;
     int vmce_vcpuid;
     unsigned int mc_vcpuid;
@@ -87,11 +87,13 @@ mc_memerr_dhandler(struct mca_binfo *bin
             BUG_ON( bank->mc_domid == DOMID_COW );
             if ( bank->mc_domid != DOMID_XEN )
             {
+                gfn_t gfn;
+
                 d = rcu_lock_domain_by_id(bank->mc_domid);
                 ASSERT(d);
-                gfn = get_gpfn_from_mfn((bank->mc_addr) >> PAGE_SHIFT);
 
-                if ( unmmap_broken_page(d, mfn, _gfn(gfn)) )
+                gfn = mfn_to_gfn(d, mfn);
+                if ( unmmap_broken_page(d, mfn, gfn) )
                 {
                     printk("Unmap broken memory %"PRI_mfn" for DOM%d failed\n",
                            mfn_x(mfn), d->domain_id);
@@ -115,8 +117,7 @@ mc_memerr_dhandler(struct mca_binfo *bin
                 else
                     vmce_vcpuid = mc_vcpuid;
 
-                bank->mc_addr = gfn << PAGE_SHIFT |
-                                (bank->mc_addr & (PAGE_SIZE - 1));
+                bank->mc_addr = gfn_to_gaddr(gfn) | PAGE_OFFSET(bank->mc_addr);
                 if ( fill_vmsr_data(bank, d, global->mc_gstatus, vmce_vcpuid) )
                 {
                     mce_printk(MCE_QUIET, "Fill vMCE# data for DOM%d "
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -465,6 +465,7 @@ int fill_vmsr_data(struct mcinfo_bank *m
 {
     struct vcpu *v = d->vcpu[0];
     bool broadcast = (vmce_vcpuid == VMCE_INJECT_BROADCAST);
+    paddr_t addr = mc_bank->mc_addr;
     int ret, err;
 
     if ( mc_bank->mc_domid == DOMID_INVALID )
@@ -479,6 +480,14 @@ int fill_vmsr_data(struct mcinfo_bank *m
     }
 
     /*
+     * Provide a PADDR through the MSR interface, for historical reasons. What
+     * we are being passed is a GADDR (i.e. MADDR for PV and PADDR for HVM).
+     */
+    if ( !paging_mode_translate(d) )
+        addr = pfn_to_paddr(get_gpfn_from_mfn(mfn_x(maddr_to_mfn(addr)))) |
+               PAGE_OFFSET(addr);
+
+    /*
      * vMCE with the actual error information is injected to vCPU0,
      * and, if broadcast is required, we choose to inject less severe
      * vMCEs to other vCPUs. Thus guest can always get the severest
@@ -487,7 +496,7 @@ int fill_vmsr_data(struct mcinfo_bank *m
      * vCPUs will not prevent guest from recovering on those vCPUs.
      */
     ret = vcpu_fill_mc_msrs(v, gstatus, mc_bank->mc_status,
-                            mc_bank->mc_addr, mc_bank->mc_misc);
+                            addr, mc_bank->mc_misc);
     if ( broadcast )
         for_each_vcpu ( d, v )
         {



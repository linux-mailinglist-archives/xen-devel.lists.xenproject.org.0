Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81000489DAD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255481.437815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xeL-0005Z0-56; Mon, 10 Jan 2022 16:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255481.437815; Mon, 10 Jan 2022 16:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xeL-0005VT-1U; Mon, 10 Jan 2022 16:36:01 +0000
Received: by outflank-mailman (input) for mailman id 255481;
 Mon, 10 Jan 2022 16:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xeJ-0005T2-IO
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:35:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d36c49-7233-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:35:58 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-oph9Qp4wPkeRr__U9TiIBg-1; Mon, 10 Jan 2022 17:35:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 16:35:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:35:56 +0000
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
X-Inumbo-ID: 63d36c49-7233-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vVPJBcYTbo9ytg1J0+W0phlaHU+E+B/oL/8qhHj56U=;
	b=Cs+pb2vYbXxm23zJ7E/q9kREBYZiuonH3kalnD8IMebiSj/kdPwE3ne9+KoL9rlxf5cGNu
	oQ8USHdjxk+MO5iPKhJsQOaI9nGbOH+anwkamiVCvF0XGdAhKC1vx1IWgf+/YKTTvOtvrT
	rYkxeoCADMvgTZ/5MzCKwtVELENLkxM=
X-MC-Unique: oph9Qp4wPkeRr__U9TiIBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ4Yhzg2y8CiasMH6H0bgHBjfyaQfUV8le8ZyEpKSgNAMM4UnwEdeY3ScRPNrtw7ltgyU/7K1xdrSO/yxJ8eqFOr68GLDmljHoQpcMfjFElX1bILDHHbNi4ZExjvBWs1IVSOqKCLZDppgVNUcHv91A00c01jd5e3SEkiB/A5jrvdmRwHoM3OViXjNq/KI/HX7zWx+DIZ70Ujx6AD6LosnroohEM7CZNfHRL9T7Ts5CcEoZiGmnWIGYyqvRlVSMh6U9QsK2mjocqMPR8UnNtr2PJA8nwYEwynpUAgSXcAALKygqIRobeucm4rupBHVwNp2nOiz13ZA4acsIeY/au8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vVPJBcYTbo9ytg1J0+W0phlaHU+E+B/oL/8qhHj56U=;
 b=jJEiyiq9sUWvJO3j9Kwr4d5AsICdKwcUdVDI+hqs6Mcd0fRe0AROHqjQl3jsc6cvL4gCcNNC6w5KHizDoTbCa0RfR3ACD5yBPeamaP59sfZ3kPpWdT5XmlA5xq5pWcZfuNUCU7vNY/jgAgAk5qbt47Lx/VqZFfX3DBshhv8WNmol3h4lf6SyqyBsDl9WeWmtb8TAOnkd5OXC/umOR+tlsnveROPpxsDL5mRK4Pu/NgqQbIcQnXudAldynr4dTyNXEhN8Ac5iF0aaMbQNd8nTfHUyNBAcbbxQ9CP0Qqt8M+M5cemmy3XC+++LjI/Df0xtr6t53WmyCRFsP5IMO7vQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b522c22-cae1-c5e1-0df9-eca37de54ab3@suse.com>
Date: Mon, 10 Jan 2022 17:35:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 19/23] AMD/IOMMU: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f5014f1-420b-4f50-faa1-08d9d4574665
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477FA0A0FF466221F84635AB3509@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1q1aKq3FXT593upbQRBMaJ0+q1BuZtYXn3emf3EKP2YFBgcvqNwGc1l8f8X+On0Q68NKeMnBeQBtBGdBAbUWNy/lYmf3OikRDD/rRT+fsag8I+vKb315e9ha+Axgff/zBOdaRuchkOTLmGI7b+MW9+8NhWfwaJsNKPOWAUbfp8oiA+kl4IWWnbzFpDZ96tv9OJA2ZERFE+5VRLnHZUdJwQaa/XQV5E+39100YAkgbB7Bx2lX7dNqVxm9yEuqOZsS4tzqWn0NGViFcpSYaZyqaFCI+h14uG/nlLztfp0lrG/jIMfQ5ff1Z0AQ9WSfRDitFZ8IBzknv23GFVfGFAIZaCpM+hxKRCfSn7t0wVVNS2BgPx5nRZqMI7pLrmW4AkqeSCz1E0gumsjI2m4PiT8c6b+x+2m1qkaCFzPr11QhBR9E4WVfuSgN0mjXfxi4Kz5zyAutg9hFD13nXvzkRuE1e+9INejne3BXkRofSO/KJcaZghqzuJhpFJZH1gkLAJ7UHIXY7vJu9Ia0jRoaQiNCNcRZYgCg1YfpA3XnvUpQa+Dy9c3Pjy/NsPvjfysInX6+A1iSY8otvb0zTUxWMKu2PLTRCz9FO0zv0AmvXegKeFXAFhSj1aY6kGAjA9cFFxIv1sxm6yxDGsGyZPqSMbwYUXUz1Z2BuV/cnkmLJB/xsFLNY5PzOObnR3/8t7sPdIBOC6qFSioC4QA2Hgoe4QTTxUD9varUYA9r97jX9in5uzU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(6916009)(86362001)(36756003)(8676002)(508600001)(6486002)(31686004)(186003)(26005)(2616005)(6512007)(66556008)(6506007)(66476007)(2906002)(66946007)(4326008)(31696002)(83380400001)(38100700002)(54906003)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YklWUktEeFlBdXdCWXBnY0ZUQ1FZOVlWWFJhOVU2Mi82bXdSeENsV0E5akgv?=
 =?utf-8?B?bDk2Y0NaR0hLOFBRZCtVbUpub0lrQ1N2eGJRUktjNFUrWlNiMVNjS3ZRR05O?=
 =?utf-8?B?all1MnNaUmhVb0ZEZm5SNmR0bHZhQ3RUNjR6OTRFeEd1ZzI0YVg3cVAyV0xC?=
 =?utf-8?B?Y1ZZTUtOQkE0UWl2RlY1RzF1aEVyUnk4RDRYSFd2VDQ5dTBiblIwdThPNk92?=
 =?utf-8?B?VzNvQ2IycWt1aXk3SmdkQTFDNFcvK0xRcnBVM094cFE5V1E4dHY0OGlpZzBZ?=
 =?utf-8?B?aWpUNHlLNFd6SllOZThnNFpUbk5UMTJpMnBzQ2F0ME1LZ2VPMEcrNjdVZk5h?=
 =?utf-8?B?WlhSTVA2MDUvUHFOUXgrQ0d4aDNDOWdHT3M0M01ubUx2Ny9sYTlOS1YxTEFk?=
 =?utf-8?B?VGNxdGY0M3dBTzRUVjQwdVA3M1RKVnFhZzR6eklzSFRFS3dmWFI5b0NDSzhS?=
 =?utf-8?B?OFUzazQ5bDBuakk0R0R0T1BPVzB5YWxXc0IycUEwRllKc205U3JWZkxObXRk?=
 =?utf-8?B?TkZQQXVua0RIVFZ2TG85a1RkeTdsWUhocEgzVnNJN0Z6c0I1VGsydHNma3k4?=
 =?utf-8?B?ODN2dHUzdVQvdlBtS25WV0l0aUMvdjJwdUcrZHVqdGdGWmcrdW03Q2dLVWZL?=
 =?utf-8?B?bmpLYUxiSU5aNlpKK1RHNTduL0I2WGk3L2pRY3FRbU5qem9ZOTdiYnN0dzBN?=
 =?utf-8?B?ZVphZjIraWhHNGVCb3MydkNJOFdQYlAyV1VxNThiYkxySy96RmQ2ZmsraUxh?=
 =?utf-8?B?SFlSR3pRSEVTcjlOdytwVSttTnRkZzdHb1c1WGFzVHZqK2M3ZWd3L1ZZM2Er?=
 =?utf-8?B?akNJdVNVQUpTbjdpMFlVc1dDK2pyWi9saFRIQmNwcU5tQTk5TXlrd1F6ZDR0?=
 =?utf-8?B?OUZPR2hzTUNwWEhET2FnQnJweWxMMGdWODFzVlZJYjRpdFVlWE5pS1ZFQU9F?=
 =?utf-8?B?OW5aQW9wY3U5b3hDbWltWVh6b3pvLzVlTjRnUXdpamJQeEFWQXduYmhUWWgr?=
 =?utf-8?B?VWNNMTJZZXlkVmppQlpXUFZyVU5wbEFlNUcrT0dDR3g1ckhhbnBQekc2aDFt?=
 =?utf-8?B?TjdVeDcyenAzeExmMTNCTXJLTnhSQnlIMFhiUzhVWmpyak1XRlJMQ3BTbHFX?=
 =?utf-8?B?QktYYjZnRlBPOE9RZFRvOU1Pa1NhMGd1WXZBZXZJSkdGMFRDVUpaTFZGN2Rs?=
 =?utf-8?B?OGk4anZhVmhjVmMzdlNJY2pCem1nYm5XUUljTEhPcmQ0SU5GOVVuckNrQXBs?=
 =?utf-8?B?Nk05ZjJsNmxwb2RWMC8xa09HTlhhZjJqZkxza0h6TFhDQ2N2NXRTY09SRDJZ?=
 =?utf-8?B?NG1jZlEyQjFxNTQyL2p4alVWRnVucldnV1RCakx5b0FEQUlUTG5SVG9rbU16?=
 =?utf-8?B?bWpuMU8wdTN6MG9xZnFaUlJIOWJNU3JIMlBGSXErb08vd2JjUkxJQjVGbzNu?=
 =?utf-8?B?OUZFZDR3MzZLQndxVTZaeStmZFRFdDU1aXo3TzFpcUVLMzdBNi9qZDROeC90?=
 =?utf-8?B?MEliSDRBb0kzN0xYcGxKOXRITmZ1UklNcUxYeHpxSjNEcHB0VFJ1T1RKbk9P?=
 =?utf-8?B?MzRodUhyN1BocXdVdXV0OEZ5QzU3QmtQYkluNHhnUEsyVFNiUCtyeDhKdmIw?=
 =?utf-8?B?QzQrK0I3bWtSeWkrYzF2dTh5aE9VU3hPMk1ZRXZndHZJYlRpamJHWUJPWGRJ?=
 =?utf-8?B?dGxHY1hjSUVpOGdYZlBIZnRFOTBhdVJpVTkrZHAyN3RCNnFOcUtjVXBEdzFI?=
 =?utf-8?B?V0IzVFBBamxudHhUT1g0MVhyTlZRcEVBU3ZFd294K3B5K3k0SHc1K3BUUG9B?=
 =?utf-8?B?a0JsUm0rVXoyYWR5elJwenl1dlV1M2kxM3FnK3Q3b0VQNEx2R2NDUmcxcDZa?=
 =?utf-8?B?ZTVJZzNRY1BTVmZaR1A3VmNWTWZIcnNiUkk1c2UrVFN2bmNsdXdhWjRWVjB1?=
 =?utf-8?B?eEJwK0F4dERCTGF1dmQzbXJxQU9pQjVJSGo4M0g3V3RabzE1TWYyeFMwNjRj?=
 =?utf-8?B?eDd0VjNmYVdhU2l0SnJ3SWwxQ01OeDczeHo5amxlbzhIVTloalA3VDVLT1JI?=
 =?utf-8?B?MlZDR0JyQmFQRytMMVNjMWNoYS91d2t0S0pxQ3dIaWhuZ2VNVTNOeFRpZFZq?=
 =?utf-8?B?RzBwbjNUU3VYN08zbGtRcjlUZ0ZLNlU3Q0hjOGtSNDM3RW0vZzNpUTF2MnVt?=
 =?utf-8?Q?HbpV6rHgj2oi5BHplhTvnHw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5014f1-420b-4f50-faa1-08d9d4574665
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:35:56.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wye6FQNvm1bUwwNd7HjVA+KZtXrfDbLsYdyE5DMTRGpIQLs70OdhwUHQ61MMxc5gzz61Ci/yNKXZdVpE7ZEorw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet,
pt_update_contig_markers() right away needs to be called in all places
where entries get updated, not just the one where entries get cleared.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base over changes earlier in the series.
v2: New.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -21,6 +21,9 @@
 
 #include "iommu.h"
 
+#define CONTIG_MASK IOMMU_PTE_CONTIG_MASK
+#include <asm/pt-contig-markers.h>
+
 /* Given pfn and page table level, return pde index */
 static unsigned int pfn_to_pde_idx(unsigned long pfn, unsigned int level)
 {
@@ -33,16 +36,20 @@ static unsigned int pfn_to_pde_idx(unsig
 
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
                                                    unsigned long dfn,
-                                                   unsigned int level)
+                                                   unsigned int level,
+                                                   bool *free)
 {
     union amd_iommu_pte *table, *pte, old;
+    unsigned int idx = pfn_to_pde_idx(dfn, level);
 
     table = map_domain_page(_mfn(l1_mfn));
-    pte = &table[pfn_to_pde_idx(dfn, level)];
+    pte = &table[idx];
     old = *pte;
 
     write_atomic(&pte->raw, 0);
 
+    *free = pt_update_contig_markers(&table->raw, idx, level, PTE_kind_null);
+
     unmap_domain_page(table);
 
     return old;
@@ -85,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
     if ( !old.pr || old.next_level ||
          old.mfn != next_mfn ||
          old.iw != iw || old.ir != ir )
+    {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
+                                 level, PTE_kind_leaf);
+    }
     else
         old.pr = false; /* signal "no change" to the caller */
 
@@ -262,6 +273,9 @@ static int iommu_pde_from_dfn(struct dom
             smp_wmb();
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);
+            pt_update_contig_markers(&next_table_vaddr->raw,
+                                     pfn_to_pde_idx(dfn, level),
+                                     level, PTE_kind_table);
 
             *flush_flags |= IOMMU_FLUSHF_modified;
         }
@@ -287,6 +301,9 @@ static int iommu_pde_from_dfn(struct dom
                 next_table_mfn = mfn_x(page_to_mfn(table));
                 set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                       true);
+                pt_update_contig_markers(&next_table_vaddr->raw,
+                                         pfn_to_pde_idx(dfn, level),
+                                         level, PTE_kind_table);
             }
             else /* should never reach here */
             {
@@ -413,8 +430,24 @@ int amd_iommu_unmap_page(struct domain *
 
     if ( pt_mfn )
     {
+        bool free;
+
         /* Mark PTE as 'page not present'. */
-        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+
+        while ( unlikely(free) && ++level < hd->arch.amd.paging_mode )
+        {
+            struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
+
+            if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn,
+                                    flush_flags, false) )
+                BUG();
+            BUG_ON(!pt_mfn);
+
+            clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+            *flush_flags |= IOMMU_FLUSHF_all;
+            iommu_queue_free_pgtable(d, pg);
+        }
     }
 
     spin_unlock(&hd->arch.mapping_lock);



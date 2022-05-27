Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49970535F32
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338023.562787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY2C-0006wS-6M; Fri, 27 May 2022 11:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338023.562787; Fri, 27 May 2022 11:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY2B-0006tE-Tz; Fri, 27 May 2022 11:21:35 +0000
Received: by outflank-mailman (input) for mailman id 338023;
 Fri, 27 May 2022 11:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuY0j-0003mu-8i
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:20:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f366a85b-ddae-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 13:20:02 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-44-_zmL6YhwNZuTX0hg1el-9g-1; Fri, 27 May 2022 13:19:58 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 11:19:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:19:56 +0000
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
X-Inumbo-ID: f366a85b-ddae-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ccB0FqtHHL8l/2emiNG86bYyLELu/eicE503PEmq7h8=;
	b=WjtNNSvpY6yp+prMCXRILKROyfcjL4tXe0VB+hPcTFVjkTfW3jdXuirSKVghZEHoVdLFEg
	UuR0EDWa/+0kZOF7OeZ2LpfkQbiMMG8w/DHlw9iqs/nfoI+M7T+eF4M13DCjKer//l75pu
	6idjsOhCierLIjThgA8W+F2hsmxW3UY=
X-MC-Unique: _zmL6YhwNZuTX0hg1el-9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqcgB5aCd9CfB+WL5HOGL6Ua+tmEhP2YNYTgvtbV4alIZ+OZcYK3mUBuy8Hqd+3zhjB/b8PfCnGg7rZlkOTVDJucdOPfJMeK611Oq7DFaJA3zEn2jTj8cs5E1mgLbwLS+Zs8zgVo7BEJzQ+EpKZ83rRZnVyXHSknd/czI9joQB74mg2x4gqsT3hC84oati0FtEiKSVeVxNfIViMnjW3lHXLZ3k8Htk1GXw6814704dd4NEcIdZ72teIv8kQ5dlg2+1SBxPltuolMTCFD9rQHhC3OzyP/zzgPpruh4LhdKfmtEpd5vQUBizyN+PGlcWBkHo6Wi9+3seum3afkSfKYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccB0FqtHHL8l/2emiNG86bYyLELu/eicE503PEmq7h8=;
 b=nR2wIqM8czn0wSh7TaziZ3IEC04OaQprfOliqW78kHzM2XWN3CTwdZIBs1ygUI0Q0YOFiEEA9JYB+aGkAyx5t3zIz6F91ydM4NhL9lrvnvYMKBIUxsXDS/72BpNy5WOE1D6g6g8rTrhNfQi0AKveXbOsyfk4Lx+cLAsJ/HtdKxCuQ2yEN/ptzP8g7mbdMLZdmkDGBZkUFjm/77br35ZOmBhTsxcK2vZLiKs3qMI+JNuu/z1Ah1oscZEer4J6rC+0FjIFKSWkaJnNIYm5ElvCe4+kvb7kkFs0T5kqFgZ4lmB8pEkDeNp1FgEqWcTlyyLf7WHxO3yIu6d7H4v8n2b0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3126189-2fec-ec14-7129-7897cde980a8@suse.com>
Date: Fri, 27 May 2022 13:19:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 12/15] VT-d: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0249.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d92381c6-47a4-4cb9-8c1b-08da3fd2d48a
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5831EB8901288EE5368F7574B3D89@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W44r6fVakDa+hkDWyb6nmGlaZsN51S5U0drRzYW05Np8DYGEmw6yRUDhKLxyguTCq0YV0+5z/3IOD7CPdRGWVTqIuJJAQw+DYtns5Lejd3zPt1yLgE4S3CwndfdeD1rxfvtBuw/Kld+iXG9Sp4HmF5iKaKEhrzhaWPQDA5xLXRzJu7yRdoGcV9OzT5R04gsOfPgRvJBlNmMMfh7gn5E4C66Fla9s7l6iP74/gf+HITnsQNzZ2ylij4OF2r1jYZsCqX7k2FdPrAy+gM7q2pIp0NgLpKk7iXjh9G3HtGVzzIZgx5T8YfvxC3HhKXJEKLktZ+mdKWjcJGf1ZlsUiFCfwsUJqIG5fo7LXcO/HudW8XItA8j3bL00PEFu+HgsCLlnL8VGNiP12qLI58oTrRJxGvpsufDVdMcJQWutRE6Rv3lRDAoj28qoE6Hn4519gQKJ8mp8SQCEZkaOCLoFvkxoROIa/pCycHIu09kHIEU/G+b/9C39TlFUmToe/3Jnew2M9TJkSbCF/VXJ71w5VAKq4a+TsvODxkn9mntGTBdmUrWcpD622bSyZdNOEK0Zwxb1K5oAjsKoLg996bHMy7zu3lEKoX8zjhmve6RsP/cwzw23fybi0R11ob+eUNcyEUgYePKAieTI2mpV4mj/N99oaAss5mYo2FkHBK6PyC7hjkh5nN8ZnRMofqFydXCGePB7JnOmgQdYq9lpxdcsDS0S27K9mJb1rIsdxoeICNOGGZF1U//db7NVWgJRu2/dOQpI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(26005)(6506007)(316002)(66556008)(66946007)(54906003)(508600001)(8676002)(4326008)(66476007)(6486002)(86362001)(38100700002)(31696002)(186003)(83380400001)(5660300002)(31686004)(2906002)(8936002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGNOWnZzTXY1TDF2a0NGNUJickNMcE9YQXhTRGpqUTJieHE4RWdOYllRSHhG?=
 =?utf-8?B?cUdWc3JnVFBpQVprVGNMaDR3ZEpQb05hd29UZEVYbnhOd0p6TVVqQldYL0pu?=
 =?utf-8?B?QUF2ejM2SUVMWWFHY3RyYjQvb2t4NnlXd3FFRE96RWJjaUxvaGd6cUhSVkp1?=
 =?utf-8?B?MjFqZVd6SnpJRTA1NjBxSktIdGhGZXNTMWtXd28vN1RBNUd3a1FESkVZSU92?=
 =?utf-8?B?dzQxbkZMM2lqa3RPTzkwUWJ3YlR3dDIzcitTNTMxall1MndoSGRZR0RZYXdy?=
 =?utf-8?B?OU4wYjE0aCtGWVhXbDRBRmRjYnRXNjhJMi9oTmx3c0JWdzQzZ1JCUFdoV2Ev?=
 =?utf-8?B?U2o4NTZ1eWEwQndwVlcrVStQeGdBN0N2UERRamhzb1hBTklnRllsRUNBd3A1?=
 =?utf-8?B?VElHamJocHY5d2R4akg5YkVVaUppRG9yTGNjQS8wWE1VaFkxYWVYdkNDOFFV?=
 =?utf-8?B?Z3JsUzVuYWJpMXFLeHBjaVoxNHFady9Pb0JWSUw5djJJbVIzbDc3dlljWjh6?=
 =?utf-8?B?RWdIVnR2SGpsODNTWlZtd2trcnJwVFZrQUR4WUhtL0JNTm1aV1BYU3lpTC84?=
 =?utf-8?B?Z3lZSlUwYWp3eGhLbk41dzkrREhJVXRVcTJaY3JKUzV0NWlScXl1S2dLWWhS?=
 =?utf-8?B?NzFsMDJGUlQ4ZnNDbmZJYVJNTzVKM0pGMGxGbkNCdFRTSExzR1Q5Nm5OLzUy?=
 =?utf-8?B?Mjh6RDdKN2RwWERST09LRkRyaWVuemI2d2t6M2hSckNoVEZkSjlhTjgydnFr?=
 =?utf-8?B?a1ZFazYvWEtEcjIrRTZ1VUo1OXFHdkNxbGVjVU1lYjBtaXArOSt2NkM0WTRQ?=
 =?utf-8?B?cWlQNnlFQm5sUUx2MXZMQ1BZRkNYNzZKOXVBREdmbVFkc2U2ZS9ma2wwNGhw?=
 =?utf-8?B?WDZEQ2QzWHRYUDloTTFzZk1DTlZqWEh1ckt6SjM0RU9hS0hXa3NGL0FNZ0p0?=
 =?utf-8?B?ZUQ0S0VOODA5bGVjdHdJNHNSOGhzNTBNME5oNXR4WFdqajdYeitGYlFIUTdC?=
 =?utf-8?B?dVczVTM1Q1YreG5qdDVoeENvdUY3ZUxIbjlUN2NIUkN5b2Y2K0F3YlF4SmFl?=
 =?utf-8?B?bzJrbWVSZjdHbEtPeDAzYk8xQmZxazNpZWtIRDZybnFyZkxLU0NFWXNBeFBh?=
 =?utf-8?B?by8weHB2Q3BRUGtmaUNVU1llSE0rZ0NXSi90MmFVZ2VmWmZtc2xQQVA0U2Ni?=
 =?utf-8?B?MFByRTdrNEM3MHQzQUNNbjg1N0MvKzBENGlSc05oYjh4SWY4dEhWZlhyYlNS?=
 =?utf-8?B?RTZtZ3dscTB6VnFHZFd0ZXlXM3JEL3lHaXFCWEJ4TFU4aE1IZlhOZHl0cnF1?=
 =?utf-8?B?dlpBRkEwNjBwL2tGRFlpVEYvQnpkWnc2Zjh3bElUejd1L0d4SzZBYWZRRk4r?=
 =?utf-8?B?RDhIN2FCdU1DSWI5QStSYWxYMzRmY1pTRVR6cmkzWVl1bk9QNlJ2TU50Um50?=
 =?utf-8?B?ditMdDV6dWVpOW5DTEcreFQ0OThOT0ZIeE56My95WjlQYnA0ampOMklVSzA4?=
 =?utf-8?B?eXlIWG5MSEF6ZGpBR1h5UGVKZUFicXVIZlQrNUphMTl1bFZNMmNmN0VOWENu?=
 =?utf-8?B?UFZkdDJueVM5Z2lhODErVXo5d25iaFZYck1XajBRS2wwaU5uRDhObnNrVFJx?=
 =?utf-8?B?OC9WV1gyNGh4VkMyNEt2WTBkOEFDUTFSSUlJOUc4eUtnWG5WUzNoZ3NOTkkv?=
 =?utf-8?B?YXNoZGtsaHlWYlZQckQ3VHptR2QwR0hvcytjSmxaT2FyZXRxYWsvOEVWcU5t?=
 =?utf-8?B?SGhPZis1cVRWYmwvemV6Q3FVY3VrQ0ZaRDFvenl0RXF2bUJUVW5BUWhMdWxR?=
 =?utf-8?B?Z0ZBcXFxVFphMDZQaU8vaUdUTndCdEVBZ0FyUWhsNjRTdU0xNVNRdVlrZDY0?=
 =?utf-8?B?Tkh1RXIyNFVZVEtkdzU3RDNIZzdxcWFpcWdmWHUxOXdMdFNkTDRzaXdacWZO?=
 =?utf-8?B?ekVTVFg0UGNZL1ZsdXZxelFRanJkVFdmRDBCd3Bzb3Vvam5sOEY3KzQ0SzRD?=
 =?utf-8?B?Z3BubUUzbW5UeTZKVDduTHIydkZxOFViYytsTWZsa3dBb3JRSGZWai9HUFJG?=
 =?utf-8?B?MktTVGU4WnlFZjlLZEVUbXlic1A2TjFSa2xOWVRFa1FaY0FnTWcrUHJvOFd4?=
 =?utf-8?B?VFRQckFtbTI4bkR6Nk9wTk5tTGZCY1dJaXdwbmhYUy9zTWJmMVNmY3BPOHRK?=
 =?utf-8?B?L2V4Y1pDbEpYL2FtM2g1TTVCU0xIY1d4d1JXUWkyQ3RWYVBQWkN4TTNlUkF2?=
 =?utf-8?B?bnphUVZYeSswSDU4ZnZzNVNFcXRmN0ZNNlJMRmhDZHdiQWNMd1oxODBHSUVm?=
 =?utf-8?B?TEN2ZDhNQ09DeDRMZDVJZEcxRzNVMW9UdHdaUlV1aU0zWWNTTjVTUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92381c6-47a4-4cb9-8c1b-08da3fd2d48a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:19:56.9284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eIXHQ41+V/iIoSnDGdl0bfuYbSg5pZi2H/B+o7H0ccnlnE3+CoGnm1PcdQWnEq3R+xppYpntTmnTNSudMnkOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
for whenever we (and obviously hardware) start supporting 512G mappings.

Note that cache sync-ing is likely more strict than necessary. This is
both to be on the safe side as well as to maintain the pattern of all
updates of (potentially) live tables being accompanied by a flush (if so
needed).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Unlike the freeing of all-empty page tables, this causes quite a bit of
back and forth for PV domains, due to their mapping/unmapping of pages
when they get converted to/from being page tables. It may therefore be
worth considering to delay re-coalescing a little, to avoid doing so
when the superpage would otherwise get split again pretty soon. But I
think this would better be the subject of a separate change anyway.

Of course this could also be helped by more "aware" kernel side
behavior: They could avoid immediately mapping freed page tables
writable again, in anticipation of re-using that same page for another
page table elsewhere.
---
v4: Re-base over changes earlier in the series.
v3: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2219,14 +2219,35 @@ static int __must_check cf_check intel_i
      * While the (ab)use of PTE_kind_table here allows to save some work in
      * the function, the main motivation for it is that it avoids a so far
      * unexplained hang during boot (while preparing Dom0) on a Westmere
-     * based laptop.
+     * based laptop.  This also has the intended effect of terminating the
+     * loop when super pages aren't supported anymore at the next level.
      */
-    pt_update_contig_markers(&page->val,
-                             address_level_offset(dfn_to_daddr(dfn), level),
-                             level,
-                             (hd->platform_ops->page_sizes &
-                              (1UL << level_to_offset_bits(level + 1))
-                              ? PTE_kind_leaf : PTE_kind_table));
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(dfn_to_daddr(dfn), level),
+                                     level,
+                                     (hd->platform_ops->page_sizes &
+                                      (1UL << level_to_offset_bits(level + 1))
+                                       ? PTE_kind_leaf : PTE_kind_table)) )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        new.val &= ~(LEVEL_MASK << level_to_offset_bits(level));
+        dma_set_pte_superpage(new);
+
+        pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), ++level,
+                                          flush_flags, false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
+        *pte = new;
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -232,7 +232,7 @@ struct context_entry {
 
 /* page table handling */
 #define LEVEL_STRIDE       (9)
-#define LEVEL_MASK         ((1 << LEVEL_STRIDE) - 1)
+#define LEVEL_MASK         (PTE_NUM - 1UL)
 #define PTE_NUM            (1 << LEVEL_STRIDE)
 #define level_to_agaw(val) ((val) - 2)
 #define agaw_to_level(val) ((val) + 2)



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E670483F5C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253113.434167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gR0-0003vQ-TW; Tue, 04 Jan 2022 09:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253113.434167; Tue, 04 Jan 2022 09:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gR0-0003sT-PW; Tue, 04 Jan 2022 09:48:50 +0000
Received: by outflank-mailman (input) for mailman id 253113;
 Tue, 04 Jan 2022 09:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gQy-0003gL-JL
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:48:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8358c224-6d43-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 10:48:47 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-BkuKODKcPv2OFf3F3W0sCg-1; Tue, 04 Jan 2022 10:48:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 09:48:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:48:44 +0000
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
X-Inumbo-ID: 8358c224-6d43-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641289727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hCkSWuMSwqATKZ5dxxY4oQpVb+g/5Cx++Q3cRs+RAlc=;
	b=jwzPwuOzZUFBqXgdqz8Ri52vWuYg+jv8wNwpsyKsknBwD/Mtw8r4SO1Adgf+Rp7CWmCy7S
	Ijgr5e09o8WpPvfvAfbSySJJPT2RdtlN5iNuGiuStVOlKR3tnXX+pP8C7E4MUZ0bqpT7U3
	PBlwP0ZAsX4tBGS9xKk4HRbVyz2gxKM=
X-MC-Unique: BkuKODKcPv2OFf3F3W0sCg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P42KkC2a0QnMEAd2YleSb99539qSf7uyFgugtR0u7scqDhy9VZQ5KkeGWDWBCwMew2rAWH5nG6ZpiNGRa1/1DkfhIf/CN/0ZvzaLtwpcSmB/bQsfx1uYiz1K7/U2Wf5ir4+foltPTaHW4HK73ulEV2VGXFRuBP61foGzR3SUyJPrRUf3zxN4MESaiau2CZLKynRLofjf17vj64FJ8DUd4VeNLmHtzk/Bz5u5JYCuZP5fJEYxu8kwOlWEgsfVkY67VMVcUMcX23omXfXW4Hlj1nlP2WSK4US2bcLj0KK1Sx4yFuddUl/CeWrCi/sxbKMlLzjXuu1AKS/isi3E/cyoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCkSWuMSwqATKZ5dxxY4oQpVb+g/5Cx++Q3cRs+RAlc=;
 b=NnEkS35xlxKGZ2TYI7zFEkgZzlS4wWCNHV7grtlTurnPRNJoupqaBtRNOrbby+mOhh4V023D2Wuh9Y039MeZ5nFhv8qZ4Pl4BZ7gNFHP744bvJ4dGRMv314KoRHWKadlYvOuxIhG0icIdn7/vowBebLvXgqV3PWH0+ajw/gu8BAoj6zc3e9jt8N5t5GRW9IlqhPO1z8yhzVH/CV3QSAjA8c+U8NeyJggip3p575CkPjANXwEJPSJgw6NmJ4zYKJagqsvR9hfxONqosyoTdCI1OBDDVzzJL7bgFGPFptHvdimbBkzFdSePorHNQ36TJVLmO+qA8F70Z/Vt4FJiSfBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e5c460b-9123-bfc3-d5c8-0922f7b2e667@suse.com>
Date: Tue, 4 Jan 2022 10:48:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v2 2/3] x86/altp2m: p2m_altp2m_get_or_propagate() should honor
 present page order
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
In-Reply-To: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0046.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aede9649-5820-4c2d-205d-08d9cf676559
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2446F3FC60A2AC50C7B24513B34A9@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QHsmhDJPkDzcJZ5IwjoLFZMKVVDwezTG6oznQBDtIxV3fkF62KHHIQWMMOoHN03dVDLYO5PcvgfBC7lrSY7gLNoPxCbD8VKeNE0P7jOgj9TrhX3vP8s6WPjp5h41IHVY8Iu1fakBDu/Z51bR3Yjg74qCdANaN9CKr1l2KLLhhkGn+ULhkeJZ1r4ClhElUz1OSvw8Y4yh7XNwYxfZap6IiZwMjrVX+8QqgRKDaUYbaVfpqmVfE39jM6W7dp7JXkRDTubZSTKQPQuSwng6MMjN70PBgsTnBuURzm36ym4TNTQ3X8mqa+cDGjXr5HACoAFfRQoTZ/pDVhi8t8ilU/fedxJ9F7KInPtt1bpYrmX//2YANJeL+yAG2M343J5PTqacCbkQTGyzxkvOak0u7IrmYZ+Hk3M35nuCmOX/nGBYxjNocEKGFLHaIrRZrtJanSirGCv4LhPX4tBOZvM46KSDHx5Gk5HgGZsB/attzuUnKdRsNGDzZ9nDFkFjQ9UgP8Hhq022srTWTjSpG29VeVbdz6mefvzFOV690qBsNvecEm0ZtWBXuZc5JtWohosR0I2Uwlo47tzglcQ57x4J7Xz7bsNQhBOeynA0xricqFJNZ+PQ4eTPRLEwONAwBOOcclk4qnjWZx1p3h5vqVZuxqjvzRxVx5PpCRxZQNHYPtlO2bPT/5IoEmcVwT2kDUQgluDjtwbtEOnlzlTOC6e7tZebbPgtybUDqG64HbUubMZ0AfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(31686004)(508600001)(38100700002)(36756003)(6916009)(5660300002)(8936002)(2616005)(6506007)(8676002)(4326008)(6666004)(86362001)(83380400001)(6486002)(66946007)(316002)(186003)(54906003)(31696002)(6512007)(26005)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkQxbzNYSEFEQ055WVRFSlpCZEw2ZkNXTVhqRVRlMjBRQlVJeUxvV3YxYlBM?=
 =?utf-8?B?cG9lV1oyYmVRTENvblVwck1XbjNIMGFpL3k0NDhNbUJPcFMvZzF3d3A1NnFS?=
 =?utf-8?B?SnVUSXM1TE00eWpyRnZ4QnhLbCtyb3FIdHUraG1XS00rR0tTZ0x6QnRPT3hN?=
 =?utf-8?B?bDI0YmZ1cHRoaHZZdnVJNjJkVHlEcUtKa2wwS04zZ1BhdXc1SzFGc21CME43?=
 =?utf-8?B?eFB6WnU2ajdkU1pUbDRnSko1UDVRMEhtbFh5U2Q3c0FydU1hKzh6T3FOaVpC?=
 =?utf-8?B?L203Y1RrOXpqcndQMmJHaFBQSC9GclRwSUVHeSthM2RTajlORWxoWHhXWHJS?=
 =?utf-8?B?aXZuTEFoQ3ZRaW1WYmFJY05LeDNJSmQ0MDE4YUhudXdna3MzVmJmNG1scERy?=
 =?utf-8?B?ZmlDc3N6eFVjS3NTZHRpS2d3ZHhjZGIyY3lrODREa1R4ek0yTThmcVZCRzhZ?=
 =?utf-8?B?R0VvZytSSGhZUHBwZTlZWkxYZWJNcXdhRXV1OUMwQ2FqSU9ra290aTRaZzZM?=
 =?utf-8?B?VDdYK2hoQzVGMjVoWFIwZkZ0UzN3REZnM2hPU09HU2paRGZIaTIzeGd5djdY?=
 =?utf-8?B?TGZ1VkhscVhRbDc2dHdERDZiQXRxUHovK3Q1S2U5eEFzWW13NHNZdGRWVUFP?=
 =?utf-8?B?L1VtOTU0cGxJTjErdklubU4vVG5RUkpxbkVuUERoMnAxN3NTcmgwT1dYcmoy?=
 =?utf-8?B?Z0N3blNyWGhGQmc1ZGwwZVd5MkZIeExNdWZMWlRhZXRiWklxRjU5elVFV1RQ?=
 =?utf-8?B?UDgzTCtpUkd4WU1YZWlDZ0hHTjdXN1g4aFhqeFJrQnF6Y2tMa21OMDVKTStQ?=
 =?utf-8?B?SXpFdHJObTRDVEVUKzlLL0pOamFMZzlwMUNpYms0WUtrL3k4WCt2dForUlQ5?=
 =?utf-8?B?QVQzckM1WFU5MmlCRUFlL1MrbE5ZczN1M1ZiWjlqUjFKejlYd3p2K25QUEVX?=
 =?utf-8?B?OXJuNWRVZVZuRnl3cXVzQ1UwUHJGbmEzRHpiWjMrZ2svMVdDM3l4V0JNRUQ5?=
 =?utf-8?B?Y1c2dzhyaG8xZEsrVkg2WGh3RXYxcWNjWU1IRFNxNHF6b0NOZ2RtSnB4RHVO?=
 =?utf-8?B?bWx1cUNBRG1PYmg5UndtbGtST1pKcDhDVTNBUExVcCtMZHphcEpmOXdZbnI3?=
 =?utf-8?B?Q2U0aWNmTzQ2YXE4ck5uRFMxRU4rUmQwY2hid0JKQ2J1TERRK3pNd0NHV3pU?=
 =?utf-8?B?R05FdjNCbGkxMjFJbVRKdmVNR1ROZmdRYmtpeENOS3B1VFliMjNrT05TeC93?=
 =?utf-8?B?cDhhb0J3N0dQZDhXNzUrVk5JTVhXVnBnT1F6LzdRSHhkcGlzblZOMXVUN3ll?=
 =?utf-8?B?aEVxT29ERFFPNVBDWmtoWDNGSllldjA5aG1TWllHZVNadjFFbUpRWVNmV2pK?=
 =?utf-8?B?VDdvMTBjU0pjSGpKTHpXNFpNRWFLODhZZWFrTmRhVm96dFp6QmlQVm44dUd4?=
 =?utf-8?B?Ky83WUcyZXI1VUhCL2NJMkpURUN3U1ExUng0eEZIR3IxRnFFSE1lTjgxNHdD?=
 =?utf-8?B?cmJGendyRFY2SmUvZk5GYmdYdTVOOW9mRmdYSWFwK1hLYlBHUTA5Ti9rcVhU?=
 =?utf-8?B?bEFqZXBCSjdUYTVSOUVoRXRGUk95MFRzQ3NTdVhxWnJlLzQwYjZ5dHl1WU9h?=
 =?utf-8?B?b1lQUENEM0Z4LzZzSStHYU1yOEhwTURscEdsU3FNdmp3YnlJVENybTJqQ0Vj?=
 =?utf-8?B?bVNVYi9hMHlmR2NEZ2RDMGFCcE5qU0ozOVZCR0dtb1pTT0NKNWZxVDlnUWVp?=
 =?utf-8?B?SGxJQXRiK1BiZnA5dnZEc1I1MUtkOHVpUlc3RzhGRGErTnlITjlZOWkybDU0?=
 =?utf-8?B?cHp5STVKMXdVNnJMeGlLN2I1bFRDTm9iaXo3eElqK2l0cGtxQmEwd2FRRUV6?=
 =?utf-8?B?ZlpsZ0tPRUJrU2RiU1BnOFp2aE8xS3BGSFlzdndZS0xQQnhKVE9SYU84OW5F?=
 =?utf-8?B?WERIeXlRZW1QdHFxajY1MXIzK2lzS2hlZHZmS2ZsL2g3azlrcjdldmdESkR4?=
 =?utf-8?B?d0VQWnFJRlhRcmIyWHJOUUhEcjhxMEFmRDh6dXpsVlFpTTFSU3kzVzN1MVV3?=
 =?utf-8?B?cmwrNGFkUGNqVHdxN0VuT0Q5ZEtrVnI1VnpVV1pNOE82RisvV2ZHNWVMSWlU?=
 =?utf-8?B?ZWdlQU5wZDU2MnErYmpaMmpGTFUwb3pPNGhvRngyS1Qyd2J6REk0NkpIREg1?=
 =?utf-8?Q?VCw6sZEbbhKHwuz+vO3n++g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aede9649-5820-4c2d-205d-08d9cf676559
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:48:43.9536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mE7jqxDekhmwkeGwOBnV74rF3EFsSnWH86xLnY5dOWWn90JBYUyUzqu0G6EuOIOwuvQZb7VESzKruVGuMfrZRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

Prior to XSA-304 the only caller merely happened to not use any further
the order value that it passes into the function. Already then this was
a latent issue: The function really should, in the "get" case, hand back
the order the underlying mapping actually uses (or actually the smaller
of the two), such that (going forward) there wouldn't be any action on
unrelated mappings (in particular ones which did already diverge from
the host P2M).

Similarly in the "propagate" case only the smaller of the two orders
should actually get used for creating the new entry, again to avoid
altering mappings which did already diverge from the host P2M.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1832,7 +1832,7 @@ int hvm_hap_nested_page_fault(paddr_t gp
          * altp2m.
          */
         if ( p2m_altp2m_get_or_propagate(p2m, gfn, &mfn, &p2mt,
-                                         &p2ma, page_order) )
+                                         &p2ma, &page_order) )
         {
             /* Entry was copied from host -- retry fault */
             rc = 1;
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2198,10 +2198,11 @@ bool_t p2m_switch_vcpu_altp2m_by_id(stru
  */
 bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
                                  mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int page_order)
+                                 p2m_access_t *p2ma, unsigned int *page_order)
 {
     p2m_type_t ap2mt;
     p2m_access_t ap2ma;
+    unsigned int cur_order;
     unsigned long mask;
     gfn_t gfn;
     mfn_t amfn;
@@ -2214,7 +2215,10 @@ bool p2m_altp2m_get_or_propagate(struct
      */
     p2m_lock(ap2m);
 
-    amfn = get_gfn_type_access(ap2m, gfn_l, &ap2mt, &ap2ma, 0, NULL);
+    amfn = get_gfn_type_access(ap2m, gfn_l, &ap2mt, &ap2ma, 0, &cur_order);
+
+    if ( cur_order > *page_order )
+        cur_order = *page_order;
 
     if ( !mfn_eq(amfn, INVALID_MFN) )
     {
@@ -2222,6 +2226,7 @@ bool p2m_altp2m_get_or_propagate(struct
         *mfn  = amfn;
         *p2mt = ap2mt;
         *p2ma = ap2ma;
+        *page_order = cur_order;
         return false;
     }
 
@@ -2229,6 +2234,7 @@ bool p2m_altp2m_get_or_propagate(struct
     if ( mfn_eq(*mfn, INVALID_MFN) )
     {
         p2m_unlock(ap2m);
+        *page_order = cur_order;
         return false;
     }
 
@@ -2237,11 +2243,11 @@ bool p2m_altp2m_get_or_propagate(struct
      * to the start of the superpage.  NB that we repupose `amfn`
      * here.
      */
-    mask = ~((1UL << page_order) - 1);
+    mask = ~((1UL << cur_order) - 1);
     amfn = _mfn(mfn_x(*mfn) & mask);
     gfn = _gfn(gfn_l & mask);
 
-    rc = p2m_set_entry(ap2m, gfn, amfn, page_order, *p2mt, *p2ma);
+    rc = p2m_set_entry(ap2m, gfn, amfn, cur_order, *p2mt, *p2ma);
     p2m_unlock(ap2m);
 
     if ( rc )
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -852,7 +852,7 @@ void p2m_flush_altp2m(struct domain *d);
 /* Alternate p2m paging */
 bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
                                  mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int page_order);
+                                 p2m_access_t *p2ma, unsigned int *page_order);
 
 /* Make a specific alternate p2m valid */
 int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx);



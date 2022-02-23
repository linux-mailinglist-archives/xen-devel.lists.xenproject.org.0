Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930004C17F1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277470.473985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu2Y-0001J6-QW; Wed, 23 Feb 2022 15:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277470.473985; Wed, 23 Feb 2022 15:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu2Y-0001Fp-LC; Wed, 23 Feb 2022 15:58:54 +0000
Received: by outflank-mailman (input) for mailman id 277470;
 Wed, 23 Feb 2022 15:58:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu2W-000083-JD
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:58:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e8ea6a3-94c1-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 16:58:51 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-zU7gkAc4PgqNKoLYXq-eyA-1; Wed, 23 Feb 2022 16:58:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2479.eurprd04.prod.outlook.com (2603:10a6:800:53::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 15:58:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:58:45 +0000
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
X-Inumbo-ID: 7e8ea6a3-94c1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645631931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Absf33xo61iOtxqb/+8Eu6L66vlBNlW2G4hE8J6Sq7o=;
	b=PqAPjUGtAceYdQRviw961lJiU11Jf6C59vrit+3rMXZCvtHHLDh+N5VYTeQ/epH2RBrAGX
	JbOn1+u/US+iLSXP/7k+9ANySfeu5S+YVu5u8QPumfkXqCGof0WkmP3l/Z/OKGqoNls7ax
	Gky+QAtvV47fFQHOVrA7U35x6SbxsGk=
X-MC-Unique: zU7gkAc4PgqNKoLYXq-eyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGvqI8lY7T3PBBTL5P2rrn9cyf77+7GvTxPiIbgNQMErHX/MCsgB0+dFKhzvdwzRy+03eQs7zGlyTgwKHKAMAak8bAUVimKA/EZGEDz+8IZTC9vqkbmdjFgPslcR6e27Ms+j0uzo8J+HuYV+9qqb9QtGJ+PlwtIdXl1tObNpTKz3BvuzN+CbrVsYWcPG0um6efkIIJjcNVfw9SK42ilWE6OcbetAeAdAMHO+ex63PAjzFQ98+Cj+l80pgQbCHjSjaVcRunk5zAGAwqJq7cUCW+x0+livy+jowYYoBhm0VFBosu68sZErUCuw+hrXFSmWHDodJ+qhEK5A8+9P65ETPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Absf33xo61iOtxqb/+8Eu6L66vlBNlW2G4hE8J6Sq7o=;
 b=I8D7EbBgxBaBfszSBub3/rkec2CUJV9chcxyvXDV9FynTk0ZHj2zFsLipI0kBG3PHVQI67GmObZ74aAMvaneMbMDTqsa3q1PmQN61cwltyCT3dukz98deSmZnnSc28H51QbUMxglHgaKDiqJtUlZ8Tx6hBUZ92wmBdEoJ3AlzS1veQ8ibGzUC4+E9PtW9Vj0Zlmy8JD5/E0a+s6LUWDloYbgKoJ2k7WVVD/CyNp+RXZnwOKBTnQGF8XjkfAiUpZtA17ZEfK0d9j7mNksIbgaGqwWNrVjnU0owYQrVq36xjQAdbL0Z2ikGPfoq4laNhS/QuOxdWEUNa0F/a0OHT2w4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c61adefa-bcfd-5792-8017-72403f3f0920@suse.com>
Date: Wed, 23 Feb 2022 16:58:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 03/14] x86/mm: move guest_physmap_{add,remove}_page()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0355.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5795b0e-57da-4f2b-a191-08d9f6e55f41
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2479:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2479512CE5B72045A9C5BB0EB33C9@VI1PR0401MB2479.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WABS4NcpsqIOvX/u/RMoLxxGAwmzGlIny8Vn/d0YWRwPz9fcFZKcvOquP7EeXByTDwIuK7rqGVb/UXmDyZkw5cws7p59BikH8Jdrl3hNASQAZstsGRj1bz8r0ypkhmlmwqdDWrZoaHo2s7C58K7O5WCJUyIcBNeksZCiwOw2cEF8D6WFpfEkAQyxCBocLuXhqSWgf9YViTduPpB5x3uqXvt5chlgeBkWdxSXfO6ymqoT+TCAzxJv3ZOn0Xa7RaSvF4QTntz8WfAzmdVMG7oXxjeQKylAkROX53kF7hq7q7BEHW/8iAX7MGpKVyvUUatmuUfGCXtcQAiSp7+fyOXRMWf3v1y5xGHWFr7qx/zVAcHaP9Q4yUJpropajWY7es5doa6X89IRZRji1ILVKTeFrbW4nXWHSkpaQ73X5n06lt85ZtjKaG79+Td9+1yTVd3Fz+8aeI4I2JEsRekhs9BFC86IVz1AwOuCKtdqi4FGt4zWRwzgxKDX8xDfQFOaSbihkgBJe5C2ATF/Bg+Xu5JGqcgNZl2bgyqaMEoleJmuBmPgfqB8m3n2VsLQdNEYPz/4EZUXTNBE9JVvwWEkqGgXSMuvXGuTrCyBJA9dImSrsQHSz7Qkm00LIQdnL63VO1Z2arhpq7h3Q8F8/bz/0tIVXngQhTm8K58+wZUMJIAM/BaQFd50+uzzq7l2BvR1TEUBpe+vlcbxa2b4iX3F+2+JlsUCgsY6p55wzk9C2ww9/bCmCTnTo9nQg8CJEnPnrN1+XllIDU6j2tq3zOF1wMxScsFKmonlpIHUSZ+OFbmsTVPAGcPaeSEnf5tdUfiM762oieo/HnvNr0rgc7x2sXeXwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(8676002)(4326008)(26005)(66946007)(186003)(6512007)(2616005)(2906002)(6486002)(508600001)(6506007)(31686004)(316002)(8936002)(6916009)(31696002)(86362001)(38100700002)(5660300002)(83380400001)(54906003)(36756003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWJiYkl3U1VSZk1DL0QweW9XbmRCUEkrQ0NuZklzYUU0RUdYZTNHZ3IxRDRN?=
 =?utf-8?B?WmE3U3hrZkFzWThZNWxQTXJ6OUFqbmhWM3YwTkk1SzAwYm1GbjFvWlUvR1FJ?=
 =?utf-8?B?L0k0MEJFanpySTJLRFhlR2c0R1JnTTZZZWtmaVI5VEZUeVdMQkF1b2NTTWxr?=
 =?utf-8?B?aXIrbG9FUWxlZ3BkMm5VQVFldTVnN3JKek9PbW1nOFl4RFl1OWV5YkFnTXFB?=
 =?utf-8?B?Ym5HaERrTy93SUlteHFpQ1JJaEIzTEZycVZBK2IxMkVuOVNMMHBQRHdaQk12?=
 =?utf-8?B?OENiTGxXalgyeUdmSnB1ZmhyOUQ1S2ZTRzl0cnhiVGJmZS8xTUlPemNDMnJ6?=
 =?utf-8?B?RWU1VmFMMUJzOURtSFhMZnV5WTJEVUZIRXhLaU0ycUthcXQ1OW0zckkxN0lZ?=
 =?utf-8?B?WTgzcEVuMjZWWjVrcER0SWVXelFSbUtxaXpDSEREVks1dDVMUzRnakZjUmhu?=
 =?utf-8?B?bUdxalY5ZUthUHVJZS9yM2txTG9BbUo0T0FySjdlVk5KN3lKSGl6NUNrSXhM?=
 =?utf-8?B?T205OXh3UXJ4elA1N2FpRStPbmxQWEdMcXY0N2tWOHpRZitJb1l3UzZIOUNp?=
 =?utf-8?B?eUc3VC9CYVgrU3RweGw1TzFpYk12NnYySWtSdGZsS25aWHB5M0VXb2E5emMx?=
 =?utf-8?B?bkZDN3paUGVrd3NNVFkxZitFcUJORTcvNzRxT2QxdlZLMGpsaHVJUjU5R25q?=
 =?utf-8?B?RGlwWXFtSlEzWXhhTXMzL1RScEM4eGpDTXNJWXIrL1cxUXVhMHBxVDhSN2VJ?=
 =?utf-8?B?cU0vVXZ5dWdyWnNITmhHaVhjR0piSzF6UnMrbi82ckpVR1IwOUQzaVQrZG5Q?=
 =?utf-8?B?K1R2bnA5b090L3JQN1U2dXJSR3R2cVBIdGFWbjU3RXdlM3dydmZ4eUR3SG1m?=
 =?utf-8?B?d284V0x2ZldUZER1TlZtbkI3Q3JGSEZhb2x6dUJOemZNOExyNng3VERCbVlM?=
 =?utf-8?B?Y0FZRC9abzJTNUsyOU4rRmRyemw4ZjBpTjB1RjBmWHRYVHpkUWxFQnFQSFhJ?=
 =?utf-8?B?bzRScDJDc3FMQktEcnp4SFU3TXkwZTBOd1RUcWx6SmRkK09URmwreGlndEsy?=
 =?utf-8?B?S1MycmZIS1IvZzNJdlU2UHMzeXBvcWdCSXJnZXBrR3VQMFI3UHh0RGJ5OGdP?=
 =?utf-8?B?M3lpU3laU0NSSW1lY0F1T0ErRDFJd1VFa0VtRUZ0Nnc4cVE0TmJGaWUrbEFZ?=
 =?utf-8?B?d3ZjZ2hRc2txQTJmTjFIbktadHdWNWk2ZnhYUzlZY0dQTkZwdTU4SHlhbjFL?=
 =?utf-8?B?RnBXUDBCUndPdWlheFg1WENLckJKOTNHcnQvclU5L3NFdk5HQnJtWFNrQnYw?=
 =?utf-8?B?RmlNZmNYdXAwS2s4WUhsWTFzM3Z5RFRFOEVLeWR0S2hJdktzQlFDbDROM2Rp?=
 =?utf-8?B?cXhJMnJWRG1NdElKUThtdjRtY1IzTk1Qa1BjNnF0dkR1ZEMzU0d1YlFwR0s3?=
 =?utf-8?B?ZlFPVmhwdFBNVGg1aEo0b2hNa0tzT0NnVjVVNzBBNlgyemdMMUJ3Y2NUc2pl?=
 =?utf-8?B?TWdXdGtGYlorL2VJcm56R1VzQk9ObG5Qa2N5VlYyYmtSUGJVWmQ4LzVwaGFS?=
 =?utf-8?B?RTIxblNkMFd1VmlCMGErZXo4K2twV3k3UE52WVN5NEhUSEUwRmRySEx2Z1U2?=
 =?utf-8?B?WnhPeUd0TEJzZGxzbURQY1dNcUlXaW9TSTNZUWlLVkFHbzhsNndNSGl3Wkxp?=
 =?utf-8?B?ajdLR2RWWGhiekx3YmFpSzZ4M3k0Q200K3I2bWcydGQvRzhBNm9HcGplZ2FO?=
 =?utf-8?B?QTlGeWxqSjRQNTVsYmVJMGZuMzBuVCtDSU9GOHBJcWhFOXFlWk5SckZVN3Nq?=
 =?utf-8?B?M3BocVdxZXNKN2pPVGswWmJkZ0FQV2NpNDYyNlhMN053UzVYWkc2Zms1Yzk2?=
 =?utf-8?B?N0tZZm1pQ3RHeE1YTVl1Sm1Jejc5SzIrL0RTZlR3RkMyanlRaEg1V25NYTc3?=
 =?utf-8?B?cUdtcStkWWRYRVZiV2NPRE9HR2xieU1relZGY0VOejlNYjNLdTdmZnh4VC9V?=
 =?utf-8?B?djN4bXdjdEpIUnNkWm1ON2w4c2hLVU1WdmN2eEhuMUJVdE5yZHNKaTdqelNM?=
 =?utf-8?B?TU5IOGFMb0laWWxWeE5WcldjZ0RJS2czRzNxc0NMcmtQZWx6MWIxcElVdW15?=
 =?utf-8?B?VU9iUGNYSHVnWnc5Wk5RVUNNNDhacTd3Ykp1bUxSQUZFS2hzZXFsc3lST3N6?=
 =?utf-8?Q?ds6oL/oMsFh+53nuota1DVg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5795b0e-57da-4f2b-a191-08d9f6e55f41
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:58:45.7278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvyFsYc8ownQ1/EGeS4qc3C+pgthdYbarHFA0wTgKjdSk3AqKqDNzyheg+KHEyVbjy1Z4C9THSAyFZVHFwz8EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2479

... to a new file, separating the functions from their HVM-specific
backing ones, themselves only dealing with the non-translated case.

To avoid having a new CONFIG_HVM conditional in there, do away with
the inline placeholder.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
v2: Re-base.

--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_MEM_SHARING) += mem_sharing
 obj-y += p2m.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
 obj-y += paging.o
+obj-y += physmap.o
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -870,60 +870,6 @@ p2m_remove_page(struct domain *d, gfn_t
 }
 
 int
-guest_physmap_remove_page(struct domain *d, gfn_t gfn,
-                          mfn_t mfn, unsigned int page_order)
-{
-    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
-    if ( !paging_mode_translate(d) )
-        return 0;
-
-    return p2m_remove_page(d, gfn, mfn, page_order);
-}
-
-#endif /* CONFIG_HVM */
-
-int
-guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
-                       unsigned int page_order)
-{
-    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
-    if ( !paging_mode_translate(d) )
-    {
-        struct page_info *page = mfn_to_page(mfn);
-        unsigned long i;
-
-        /*
-         * Our interface for PV guests wrt IOMMU entries hasn't been very
-         * clear; but historically, pages have started out with IOMMU mappings,
-         * and only lose them when changed to a different page type.
-         *
-         * Retain this property by grabbing a writable type ref and then
-         * dropping it immediately.  The result will be pages that have a
-         * writable type (and an IOMMU entry), but a count of 0 (such that
-         * any guest-requested type changes succeed and remove the IOMMU
-         * entry).
-         */
-        for ( i = 0; i < (1UL << page_order); ++i, ++page )
-        {
-            if ( !need_iommu_pt_sync(d) )
-                /* nothing */;
-            else if ( get_page_and_type(page, d, PGT_writable_page) )
-                put_page_and_type(page);
-            else
-                return -EINVAL;
-
-            set_gpfn_from_mfn(mfn_x(mfn) + i, gfn_x(gfn) + i);
-        }
-
-        return 0;
-    }
-
-    return p2m_add_page(d, gfn, mfn, page_order, p2m_ram_rw);
-}
-
-#ifdef CONFIG_HVM
-
-int
 p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
              unsigned int page_order, p2m_type_t t)
 {
--- /dev/null
+++ b/xen/arch/x86/mm/physmap.c
@@ -0,0 +1,85 @@
+/******************************************************************************
+ * arch/x86/mm/physmap.c
+ *
+ * Parts of this code are Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
+ * Parts of this code are Copyright (c) 2007 by Advanced Micro Devices.
+ * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <asm/p2m.h>
+
+#include "mm-locks.h"
+
+int
+guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                       unsigned int page_order)
+{
+    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
+    if ( !paging_mode_translate(d) )
+    {
+        struct page_info *page = mfn_to_page(mfn);
+        unsigned long i;
+
+        /*
+         * Our interface for PV guests wrt IOMMU entries hasn't been very
+         * clear; but historically, pages have started out with IOMMU mappings,
+         * and only lose them when changed to a different page type.
+         *
+         * Retain this property by grabbing a writable type ref and then
+         * dropping it immediately.  The result will be pages that have a
+         * writable type (and an IOMMU entry), but a count of 0 (such that
+         * any guest-requested type changes succeed and remove the IOMMU
+         * entry).
+         */
+        for ( i = 0; i < (1UL << page_order); ++i, ++page )
+        {
+            if ( !need_iommu_pt_sync(d) )
+                /* nothing */;
+            else if ( get_page_and_type(page, d, PGT_writable_page) )
+                put_page_and_type(page);
+            else
+                return -EINVAL;
+
+            set_gpfn_from_mfn(mfn_x(mfn) + i, gfn_x(gfn) + i);
+        }
+
+        return 0;
+    }
+
+    return p2m_add_page(d, gfn, mfn, page_order, p2m_ram_rw);
+}
+
+int
+guest_physmap_remove_page(struct domain *d, gfn_t gfn,
+                          mfn_t mfn, unsigned int page_order)
+{
+    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
+    if ( !paging_mode_translate(d) )
+        return 0;
+
+    return p2m_remove_page(d, gfn, mfn, page_order);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -8,18 +8,9 @@ int set_foreign_p2m_entry(struct domain
                           unsigned long gfn, mfn_t mfn);
 
 /* Remove a page from a domain's p2m table */
-#ifdef CONFIG_HVM
 int __must_check
 guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                           unsigned int page_order);
-#else
-static inline int
-guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
-                          unsigned int page_order)
-{
-    return 0;
-}
-#endif
 
 /* Map MMIO regions in the p2m: start_gfn and nr describe the range in
  *  * the guest physical address space to map, starting from the machine



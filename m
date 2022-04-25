Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0450DB78
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312583.529898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuJV-0006ND-Qc; Mon, 25 Apr 2022 08:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312583.529898; Mon, 25 Apr 2022 08:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuJV-0006Kk-N8; Mon, 25 Apr 2022 08:43:21 +0000
Received: by outflank-mailman (input) for mailman id 312583;
 Mon, 25 Apr 2022 08:43:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuJU-0005as-5B
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:43:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c179822f-c473-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:43:19 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-b_RJjmPEOLKgT5WnXpataQ-1; Mon, 25 Apr 2022 10:43:18 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6098.eurprd04.prod.outlook.com (2603:10a6:208:141::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:43:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:43:15 +0000
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
X-Inumbo-ID: c179822f-c473-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5dMhpfznMlqVzr+kJ/53g9HZAHAFuJCF88KGG0p/Pw=;
	b=gskIEYe9IOm7q3QfsHWYC2um8rRth94hdRAjXOeqLzzgOlwkvnjnTtnJ3qyM3ZYwNpcL7i
	XXfZ0yFtaVjMo+1Cw6RWnPhv0CqOBmpH9/wALLZ1Pj+sqc844dOQAtCp799P6Pj9JlMs6b
	dNoRD+ioyrDskObMH6tsdZfh7vw++zc=
X-MC-Unique: b_RJjmPEOLKgT5WnXpataQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZftQTbEYgdFI+6kFvVAR1LxW+gdwYPevxgRcxbAjkJH2xeMrt1lhDdShjj4WxGNyXpSN8/wAYkXtG3mNdNvLiSiLehSEP1GOWXE7OjIFRwb8kL+waytULHoEbRruTU5us+n3Zp5XGJfkLAhGj3Mkf/aD/7K+HGjvICVAmXDXazDxdLVvnBxFr0HBJW5gQ5IiX54qaWTzMNagqB0pNz/bSqyOmiLXIFmBMvSajgYZSa9Ofn/DrLFImniq8DO46z2FsH5wV9XUAHA+tlVcNDWtNkdTFBzvF7veo47iWWYTsqrh3htOuju3MwoMm682VsCRL/yLNM+0ZiAie4PQIaPDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5dMhpfznMlqVzr+kJ/53g9HZAHAFuJCF88KGG0p/Pw=;
 b=hPrybism78QkDSlKfu4XCcxGX0U2vKBDRgDyZNGShWVF9DJlzW21kuN/2eom/yaoHbd6QkU2k1e/B+s+yoPc0B2lk5x9RgUItu2UTUcGjf8JsgYoO70kT/W8Yz5j8sB1TuWApNa/GJDFERrf07Eje1SkYjYHr/OHIqIayTomzPrI4sRTSnPw5GF6JhmHb1pu56K5gVcNFEpWvc8VwvaeDgwMs1I03wx3UrFjHo4tqOSYppSSkezTBcUZWagYru0351ZSQ7+YUn5o0HiXmu4d1r/5j5MjR4BvBfA/EdJ/scN3tm0BXRvLb7TKkkgoOdIoc/hdmC1nHPxbUl4rtm3Yyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0e2d865-5ac9-d7ac-c763-f4b99b699224@suse.com>
Date: Mon, 25 Apr 2022 10:43:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 17/21] AMD/IOMMU: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::41) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f182e83-4d2b-4a78-34b6-08da2697a387
X-MS-TrafficTypeDiagnostic: AM0PR04MB6098:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6098D2B8DD4C9692A9D8800DB3F89@AM0PR04MB6098.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ytsBkCaiyoBdFjY91ut+WHsBc5lfa6NiEnTAJYQGLPRDVwVIshYUIGksbHMJmMwvoBhJKIDKjXXXXtW06f6og/+du/wk0zu2/8OqHw4opGJMo8fqCpit2HjL6DrzVkr5XO909B2v/jl+yb29yqWC/kE+2amqVj5BpRKJoc533Mt/MZyvDNP8AZAxYRNmaWNu2+jIi7g+AVw1mIoy5qqKmCmkCcrrp1ppHuV65kPVtarNyBpAuChiI0YkbK/BkzeaXM4rWkRhh1wWil/KBhe8BJsYlcFcR1bwfb8KQRtp34aEfKtZOShA9pAAdJi228p80QvWqochXLt/2tbvZtsaE5N9W84360ojKDwSl/z7ISzBoaRNO2arq47qReNO0FoLbk66JHVYiQzRX1XDs0FbyFPu95Z0fz9mNYA2RhKl9i6HyAwDhZ0rhqWbJ2oT/FtT4EIwQwO3bMdoyDvUCSKZXXlv0QsH5WAR1p+GDeQ0ljJqN4zunCwgGLjbDGDQioa5IQixe/vbZc6heBBl70NgBZVhVjFn/82Y1XdVeEyyDgrxjKCun+E4PI0CEg6ZgA7UJNAY+pnsSnW1Y2wF3Dvl8ivLJddl+xVMLnNUxCXGTVf+FWYT6HuCEBLC9hB20gPSWpiVIPVIHrnSmfNVSJFlntt4znH8KIzFGGvClAfOBZ2kqO7xf4M9cNl8voKRQ6JIkFifhMDqBT/Kqum6SaiX3hbT8nwu5qvgEeyas9rDFcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(2616005)(508600001)(8936002)(86362001)(6506007)(6512007)(2906002)(26005)(31696002)(38100700002)(6486002)(186003)(83380400001)(66476007)(8676002)(66556008)(66946007)(54906003)(316002)(31686004)(36756003)(6916009)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlFYZzNjek5Nb2VjR2ZpcDh1NG9uNWRzQjFDdmhoRDZ6ZkhhM1BPUmErbmhN?=
 =?utf-8?B?WGpuaTEyaU9iMGhpZXdTc1c0cjNhM2NwZGdLUDNoRmVPeFFWTXhVc0xuaXU0?=
 =?utf-8?B?UFFoTHQ2YldRcFBLeGV0RDdiRnZ6UWRJK2lHSVF1UVkwenlXSUFuSUs3L1Nj?=
 =?utf-8?B?SFhOMXRZNlU1UE9MTzRwdXQ5OTZ1cjZDZGkvWTgrVk1FQVVhQmtCY0tPOTdk?=
 =?utf-8?B?Sm1WNGE0cHFGZWJXRFIzY0cvLzhlSlpKeFhPQVRNWVJaaFVXNlE5RFd3bk0z?=
 =?utf-8?B?YjhNMGxLU1R5N05tQU5QeEVUU3NtN05ManZ4eldhdnd3ajFlOVVSV2NIUWJh?=
 =?utf-8?B?UEk3ZWZZNkJGV0VtVWUwd0xaaXNEYktEcUk3c3JPSkRPWDJuQWxFNk5BM0pp?=
 =?utf-8?B?YStDN2hXR0hQeVQzU0p5eWpXUm5PSVJHbDlJNUt0cFplVm11SnA4d3lEeEEx?=
 =?utf-8?B?U0JVdjZZdVkwVm1NeHgvd1cyUVhOZEk0RzdYQjhBRGZrS2pCNUxsNHcwTVZ0?=
 =?utf-8?B?N0c5bE0zdnJ4YXpiNHpWM2RRMUNSb2QzU0wycU9sWVdFMEV6NFR1WE5GZ1NG?=
 =?utf-8?B?NldNNGVNT2lwQllDdTkrZEhkaGh1bnlYaG55NVJCVnc5THpicExRNlNIK2VC?=
 =?utf-8?B?SnRSUGx0SEVFbmJZenR2RWJTL0w4V0xONG5pTjg0SEhVRFRCcDVUbUhMRXdQ?=
 =?utf-8?B?T0dudThiMk52RkdJc0pTNGdKVGRkZ2J0TW9yMExDMmdxZWx4NXduMTlTUGxQ?=
 =?utf-8?B?UGJxdXQyOWlOeGdScGtVaEFseEhzNVVlL3I1Zjl5YUt5Z0ZaT3o2MTBGbjZP?=
 =?utf-8?B?SURTUXgzUFZpOVB0ODVxOVYxTEVEbWg0UVhzb0tDdTdJVnZLV0plWFJoZExq?=
 =?utf-8?B?Zy9RRlVOL2xkd0x0czVqRmhpR2YwQzhUdzR2SHAydENuWVMyVUpSRENKZ20r?=
 =?utf-8?B?VE9qeU9WZk1PSzJFUnpQV3hTZ0JOTTNnZGVoQWVoY1FNUDAzb0RuZkh1cjBD?=
 =?utf-8?B?YmxBUEdvS3VNSmQyU0ZXdncySW94Tmd6bUh1OE5zUU9scG5wL2dYL2kxVk91?=
 =?utf-8?B?Z0ZFRVRkNjFqdXIyVG5rbS9MUXBFUG0xdUhHbHBCdWtEN3k0UDNLbHpvL005?=
 =?utf-8?B?MDNLOGtpb000YnRwUkczWWFJVjdQTzhpRVdTUHc1MnQ0SzR1aWp0NWdEZDM3?=
 =?utf-8?B?WUFUUng2WGd0Q0dBZjUwMDFCZmJhRis3QUxxcVlodDJCcUd2M0dFUDM2MUFh?=
 =?utf-8?B?T1hydjFLaUN6WWdhZGMxcmZ5NTByTjBTdC90d3dwdnRCRUdNVGhmei9kQzlY?=
 =?utf-8?B?bmsyWEJrL1B5d3FyWmxML2Z6VFBjNE5FdmE2dkJsVG9DZjRpRGJjdFpYZVA4?=
 =?utf-8?B?dHNLTTVFMExsSWxtVTlDMDVuaEw3RGtNSE1PakZJWGRBN0xxQ3hHOGE1Ni8z?=
 =?utf-8?B?V0tkSHFNSkx5dUJwWXZUeDdOS0p0bWFiUkJQdXNjWHdXNjU0SkNObG9VelAz?=
 =?utf-8?B?Ukk0SDhaK2czZWtaNVkxVlVhMzJPVjBJbUszelZnWU9RSFprZ3N4QzYxc3pH?=
 =?utf-8?B?QkFRZGFYRGVQUDlMSkFzUWdITVd6dW9tcThEM3VQcHZVeC9JMjVValRFY2xr?=
 =?utf-8?B?QVNWOTNub09wQmxmZ0N2TVo5ZytPaXh1WHFmbkVzdTNXdzVOZCsyK2thM2JF?=
 =?utf-8?B?U1BPSzRtbmdvdGhiQzJLa0xnaVF1aFNEaWNmMHZSd3VxTmFvUTc3ZXNhNTJ2?=
 =?utf-8?B?UnVsM1J3SUp4MWlxenlVeVNmUHptK1l0eGJPcUNEb2RmenIrVStBcmt5RUtS?=
 =?utf-8?B?cUMwTEJMWHo1SWJXV3FldmVsUTB5NlpMMnZwRFV4YnlvMjJQc2VIVUgzZXhD?=
 =?utf-8?B?OEZmV2hnUHdFZWI1cXNoWnN1dVQxM0tBRXJWbkpZRHpMblRvTnpDRmpnTHVB?=
 =?utf-8?B?VDFuTlBna0ppMjR3ak5TL1cxSnhIem5YMzYvSWtyK2pPUHFFWndYWHRrSG1B?=
 =?utf-8?B?UnFBUmxWZ24vODArdWxzU1dQbG5jMXlmRTBNNGxaRk1GRTJ5KzdkUnl1eERP?=
 =?utf-8?B?RUJvVS9CVWkxUjcxWDRDYWdCY3A1YmhhMU1QWjRaWTlVWG9zdmc4dk9UQzcv?=
 =?utf-8?B?aDJrc1JWdStTdHd5cjczTUFJbFcyaDdtSnZKZzl5dWNBN2gvSzFLODdUS0lO?=
 =?utf-8?B?THdoNENxU3ZGSjRyN09iTEdmMk96bGxVMFd5dXcxallvMFJQem1CWW1jRFJq?=
 =?utf-8?B?QWwyV3Q4NzRCckdGTE0vdTJxVkFCT3ZmNEd1L2RPb3kra2ZGQXhRK3h1Rk50?=
 =?utf-8?B?dDR0K1ZQajZvS3dkbGNkRkE0M3dMTWZ3WHo2RDlmaElSZTNnVmtaZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f182e83-4d2b-4a78-34b6-08da2697a387
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:43:15.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agMlyq3K+fhi5YuXGvetiyiMKMi6oafnFHppyh2d4gNy0WJhVsZb9SsFfVrYfUX3Q7gO7gM4O8p66QuC5Jrj2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6098

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -81,7 +81,8 @@ static union amd_iommu_pte set_iommu_pte
                                                  unsigned long dfn,
                                                  unsigned long next_mfn,
                                                  unsigned int level,
-                                                 bool iw, bool ir)
+                                                 bool iw, bool ir,
+                                                 bool *contig)
 {
     union amd_iommu_pte *table, *pde, old;
 
@@ -94,11 +95,15 @@ static union amd_iommu_pte set_iommu_pte
          old.iw != iw || old.ir != ir )
     {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
-        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
-                                 level, PTE_kind_leaf);
+        *contig = pt_update_contig_markers(&table->raw,
+                                           pfn_to_pde_idx(dfn, level),
+                                           level, PTE_kind_leaf);
     }
     else
+    {
         old.pr = false; /* signal "no change" to the caller */
+        *contig = false;
+    }
 
     unmap_domain_page(table);
 
@@ -407,6 +412,7 @@ int cf_check amd_iommu_map_page(
 {
     struct domain_iommu *hd = dom_iommu(d);
     unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
+    bool contig;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
@@ -447,8 +453,26 @@ int cf_check amd_iommu_map_page(
 
     /* Install mapping */
     old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
-                                (flags & IOMMUF_writable),
-                                (flags & IOMMUF_readable));
+                                flags & IOMMUF_writable,
+                                flags & IOMMUF_readable, &contig);
+
+    while ( unlikely(contig) && ++level < hd->arch.amd.paging_mode )
+    {
+        struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
+        unsigned long next_mfn;
+
+        if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags,
+                                false) )
+            BUG();
+        BUG_ON(!pt_mfn);
+
+        next_mfn = mfn_x(mfn) & (~0UL << (PTE_PER_TABLE_SHIFT * (level - 1)));
+        set_iommu_pte_present(pt_mfn, dfn_x(dfn), next_mfn, level,
+                              flags & IOMMUF_writable,
+                              flags & IOMMUF_readable, &contig);
+        *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
 



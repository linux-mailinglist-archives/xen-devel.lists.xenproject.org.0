Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D684E4696F8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238897.414036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDzc-0000FM-7B; Mon, 06 Dec 2021 13:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238897.414036; Mon, 06 Dec 2021 13:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDzc-0000Ch-3q; Mon, 06 Dec 2021 13:25:20 +0000
Received: by outflank-mailman (input) for mailman id 238897;
 Mon, 06 Dec 2021 13:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muDza-00006G-2D
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:25:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3c4364a-5697-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:25:17 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-v5fdYRZ4OUu7QHgtNCUuHQ-1; Mon, 06 Dec 2021 14:25:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:25:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:25:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0069.eurprd02.prod.outlook.com (2603:10a6:20b:3a::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 13:25:14 +0000
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
X-Inumbo-ID: f3c4364a-5697-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEsj9ndE9Q/guZXie3VtZKqzHbg+waaXmZENccFoZSo=;
	b=YQGjFPuf4p5k0i5fn5Yv6hFI9zSpAoOuAoaxMCHSO7N+pVY+HjIkN4p194yWTxj+IsaQBw
	HlGwyQvQD8+u1LJq8tXMyuNy1meEQt3kKfy81OnNOp17kUJAbKIP5PlXOPnswtVfCGUcYZ
	g22KU21wcHFtSYbPpwlLtEc8i5oitEI=
X-MC-Unique: v5fdYRZ4OUu7QHgtNCUuHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUvRpZEW59XVzwhyslnO8WMGV104htmC65eSt+/sZGCNVoMDEJJ+ADgQwU63E1VUCjQHMEFbkmNGf5SxZoWjM0zLeLYuMinikRnvobyE0PB2klH+DTqyf8LX9pmd3udmxXNzNYKJBSgPM5SM/w18xtk0GCJYv7S+O6K49WGWH0LZd0CVp0GY5+K+xtxDzpw769dcRQtDVQ3qi+LSq7Csdd0UZjZG3LocsCfE6CrwjXzPCpy2f8y4H1+XbOMgDamUgr0aWvyl0vqv3+/hbBoZetdLa4cxwVdMZKPSxzOdJkaESez/rm4vbM2J46IkQgM5ifsvGyPZFUGzFS2JopUYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEsj9ndE9Q/guZXie3VtZKqzHbg+waaXmZENccFoZSo=;
 b=PvTXyMEY94dkfTY9uovKoxq62fORdCvx27G2ztMFZkpuBpjUAEzQDkX0Ky2Nxha971Ze0bJM1xzdoV6XLqAs19APak7EpDUU07rYTuB/EC2G54kDnNmoZkfFpqnKViLh36R0mGpb0RUKKha4ZQx2TTNhXdnmiZn/C3QkfUGKc/xxxL+LGQFfWAYcLaDqaf683snquApwfhEBNmuZK5lceSQsgcGiepmBmZNyTZZV/RujcLLa6mHbrpeEjAVp9QrbsbsKzH2z5y6pfsColqCSAB25jlunIF4yvVtrY95ryOd26LZ+LgR5hegkzRAA0bX7hvtyZBitPqgBF/0+ranC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa49dc63-965a-bf9b-3d42-11286b709a24@suse.com>
Date: Mon, 6 Dec 2021 14:25:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 1/2] x86/paging: tidy paging_mfn_is_dirty()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <61c1d38c-65a6-e150-ed53-b565d30c18c9@suse.com>
In-Reply-To: <61c1d38c-65a6-e150-ed53-b565d30c18c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0069.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3785d258-9018-437f-83f8-08d9b8bbd6c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70249C3E45EC0872E3283A15B36D9@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ZPPKKrEaDGXpCFmOQdam3nCEmK5iyDKzROmE+B2LuaZKnPdHJ+byW0fxA1L8pCCHL2avmAZB1kX4yAnpK3FEWJ1tBohFkCqiiKzUJyauTOkKaWd0UUwXbRMucJVtRBMbtraNOPqNJ2irzIZXrYDeYefBRkTZ0wycfp2SUOIkPpUK+SfkexH9fsDYz3Sp8+IkD39NH9GdnRIpCRtKbRkkqFHfK09LNFqQVwzKLCtxHmW+yW4YsVY8cn71JUhdXrFtl9rkKhIlZbyHw0Us1h8JvuBaHcAGSioXtUrnvGz8KGpHg1wtlKZWxHE9EzVG89F44R/MwCotO10S0xF+xSHo2yEqEtRMknqvHrjyCyadZDGot6wGGpKUNH7M3/baC/9+K2OPxMIuqo31vgJi1RgbcWjTylmu1TRhP6pi2pq8T5mRMSoQAr64U6VFSrmbJ3HJ90AmAQA57pnpEbAbRhQxZpwxzTp+RU3KUyAFqNqFNZnmbO+udynj7clyOFIcfIh+iuK4/mQv4K7Ruk5ElNfBn6giKh9irUrZjJReTvsmNgE0qKvlUJ85AFl3scl0fcyQsLtKlVbxg21RTGoD2AVxMSJcJYzDFwLfi3YV2IXN0EQAf6fsSO7jsdHAJEeLpuNvAHginbYPxeeMN1D/aQcJtDOUl3EeJ85g53eq3Mzu9Vyq2DKaz7w3w+HASdhNymHTe7Rn1eN+DdPqZWDblsQt9/p8gd0uwMCsGSjokZug4TtSf2zYqYmwAKufmolf2qR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(6486002)(2906002)(86362001)(31686004)(186003)(36756003)(4326008)(31696002)(54906003)(16576012)(316002)(83380400001)(66946007)(66556008)(38100700002)(66476007)(8676002)(6916009)(508600001)(8936002)(26005)(2616005)(956004)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2tJRW0vNm5lekcwVGpLcnczOW1ZN1U4cWkxL2xWckdEUVRGc29HcFZkbkVF?=
 =?utf-8?B?RzVjTEdKQldFTXc5RnBUdjB6KytKd0dzbzBJY2xkaU5KcWNFNnRLTlg0M1NV?=
 =?utf-8?B?MVg0YlZyT0lXaFhaZ0pFQ1dYRnk3aExnUk12NFkxUXRMZUliMDVrUjZqdWNL?=
 =?utf-8?B?b0tYYjdjM05NVkN1QTJJbkJiSjkvcU1uQUZQL2hiS3BLZ0lCMWRoSll2K0Ju?=
 =?utf-8?B?K1RqVlByOUs4eVNvVHJTbTlOY0FxVXp2TmJFdnU1Tkc0ZE9ZYngwa3dkTFN4?=
 =?utf-8?B?RjBXOVlreml4TkNRYUVkREx3a0V6Wmpodzd5bVY3QTUrTktXRWtraWJzd3ZT?=
 =?utf-8?B?OVMxUkVDOGZTU050TUVOS0pJL20rL0kvOXFrQTAyVGE5Z09ZMDIvdEFLak93?=
 =?utf-8?B?RmczV1ZqY1hNcHRwN3JzL2lRSFVSSVk3anV2NGZMQ2ZibmV1emFDMEVrNSt5?=
 =?utf-8?B?Y3ZWOU9KbHBrYnZnRzVCMS9TbUlTTmFwL0NzQmhiVzVBblNTVWZjcDBTa1Ns?=
 =?utf-8?B?KzNJZ1dXZVNxUWV4VVIzUTdQRmh4dXlpOUhiVTd2QnlIZ1hYWU1WM2ZaVW9L?=
 =?utf-8?B?UXgrRmlmQU8rbWorVWhXY1cwWkh6VUp0OHptWEhoNUt6djlFSXZrQ3ZseTE1?=
 =?utf-8?B?THo0aGxPbllqRFBVSlBmOTlCVHYrQ1ZIMU1BVllxSi9BdFV1cVF2WXIvTklO?=
 =?utf-8?B?TTRZdUhscitJQS9BRWNVTk5qeFhzUnlrNjNvcXVvZXVWZ1Z5MjNaWFdOSE1r?=
 =?utf-8?B?Z2NESmpJbVo0V29DT1lWWklqWUFsUEszcXZBcmRwb3RTVEhYbW5IM3JROGsx?=
 =?utf-8?B?aklFYjIxRHNRci9aQXhPR3JtbXlSL3hwNUNvYUVYWHJuR2lWdmVWWlhla09u?=
 =?utf-8?B?dlNvcVZjcVdnb1JzYyt0WnZES2gxczk4WFVjR2tzbDF0dDNZM3RnbWdDTjdi?=
 =?utf-8?B?Wlh4TFRrdy81dW1sT3VmQlRoYTVJVTZTUHJWMVJBbS9ZNzVWL092MDdrVmFM?=
 =?utf-8?B?Tkh5b2s3dndUWVNmdFdsblQ4OHFlT3JEKzdUblVwMEs1dXJjTE1sR3NxL1lX?=
 =?utf-8?B?elFuOHlNQ1FxYW45aUl6d0UyaFkwNVNHZDhtZUc3MFUrQmlLNHVDV2RDS2lZ?=
 =?utf-8?B?M1Zxa2ZyR05pc0ZXM3BsRVZZSWl4cDhNcHVua2hNOEgyL1ZsOTVQZXFxcWNL?=
 =?utf-8?B?Yis5bWZRbmFtUDRrbEZ4VFpSUTZUcko1L2VOV3ovMm1tMk9hazhvNUNzNlZl?=
 =?utf-8?B?azVicENRWTRqcmc3U0FkU3dQeUM3YWprd2RIclJLdGR5SGpqWlo0VDhQYm5L?=
 =?utf-8?B?SngwZU5ZUjBZNi9kbDBBTVFqWkx4QjBBN0E5ZzN1N2tIblhrMnBnaGc4RUZH?=
 =?utf-8?B?SzN1OFlYUEhSNlZCMnFqTmdtdFp5THJNMkMzMUFWdzhKS2N2Rnphei96Wm5G?=
 =?utf-8?B?Wmh5Z2hjSURTc2MrUFdHTzZQZHlHbXE2S2xqK3d6R1VKdTdsNGhLbE5FR2U4?=
 =?utf-8?B?RUdBeFFWNWsyN0Y2UWRXWFBGM1J3TUV6S0I2WncrSVpob2grTDNyeUwvS1BU?=
 =?utf-8?B?Nm5sMHp2b1o5RXp5a1F0UERFRXZzcG9ZRG9JNGQ3b1lQaDFYWXVSL2txS1FM?=
 =?utf-8?B?czZRVWdmOE5FT1VVUVlnbFhLNVFpYWNrOGVUSEozY2tEMVN0TFIydDNhK1pP?=
 =?utf-8?B?clRrL1ZnUGdLVFh6a3FOYno4cUgvZVBNQ0RmOWk1Yi9RVUJCS29tdEF2K2lH?=
 =?utf-8?B?c2F6NU11aUM2Mnhsblp2Mk1DdkVzYk1XMVY3a2VlSlNlVmlvN1NCcWhIQ2ZU?=
 =?utf-8?B?c283b2VFTEZwNDJTaDBJRFJXUWd6cFVreVFYSFR4UjNBTk0zL0c1K2lVbll4?=
 =?utf-8?B?RmpqemNMK3ZNd1hCSHpwemM4YklwY0YzUHFzQUtEL3FyRzJpWWlSWDZrQ1BH?=
 =?utf-8?B?ck4yTllPMnlNMFVwTDdMeS82dG9WdXpYcmZYQnd2R0hIbDN1RnhpY1orWjBY?=
 =?utf-8?B?U0dmUkR0eWtFK3d4VklyMk9pT2JuRU5mZ3M1NGxybDFTWnF4RnY5OElIT0oy?=
 =?utf-8?B?c1hRZ3NmOWtFUFRUS25KMng4aHYwMWRZbTZnVmtWek1hTS9CNzNpWFBhOUx6?=
 =?utf-8?B?R2MxemZnQmIyV2ZOc3IwZWxLQWlacUUvMFMwa0xkOWNBRHRKVHBjOUNUOXdh?=
 =?utf-8?Q?Cq8rdZksaGGSEZq0jBpnDIY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3785d258-9018-437f-83f8-08d9b8bbd6c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:25:15.3013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqIFL8fd6X1r+EElkR4K+8mzfZ1GOQDL1JwIeihL9scjbNA8Voy49iA8J3vIuCBmrY79AKUd36w11ArWU6pLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

The function returning a boolean indicator, make it return bool. Also
constify its struct domain parameter, albeit requiring to also adjust
mm_locked_by_me(). Furthermore the function is used by shadow code only.

Since mm_locked_by_me() needs touching anyway, also switch its return
type to bool.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Change return type of mm_locked_by_me().

--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -40,7 +40,7 @@ static inline void mm_lock_init(mm_lock_
     l->unlock_level = 0;
 }
 
-static inline int mm_locked_by_me(mm_lock_t *l)
+static inline bool mm_locked_by_me(const mm_lock_t *l)
 {
     return (l->lock.recurse_cpu == current->processor);
 }
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -351,14 +351,14 @@ void paging_mark_dirty(struct domain *d,
     paging_mark_pfn_dirty(d, pfn);
 }
 
-
+#ifdef CONFIG_SHADOW_PAGING
 /* Is this guest page dirty? */
-int paging_mfn_is_dirty(struct domain *d, mfn_t gmfn)
+bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn)
 {
     pfn_t pfn;
     mfn_t mfn, *l4, *l3, *l2;
     unsigned long *l1;
-    int rv;
+    bool dirty;
 
     ASSERT(paging_locked_by_me(d));
     ASSERT(paging_mode_log_dirty(d));
@@ -367,36 +367,37 @@ int paging_mfn_is_dirty(struct domain *d
     pfn = _pfn(get_gpfn_from_mfn(mfn_x(gmfn)));
     /* Invalid pages can't be dirty. */
     if ( unlikely(!VALID_M2P(pfn_x(pfn))) )
-        return 0;
+        return false;
 
     mfn = d->arch.paging.log_dirty.top;
     if ( !mfn_valid(mfn) )
-        return 0;
+        return false;
 
     l4 = map_domain_page(mfn);
     mfn = l4[L4_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l4);
     if ( !mfn_valid(mfn) )
-        return 0;
+        return false;
 
     l3 = map_domain_page(mfn);
     mfn = l3[L3_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l3);
     if ( !mfn_valid(mfn) )
-        return 0;
+        return false;
 
     l2 = map_domain_page(mfn);
     mfn = l2[L2_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l2);
     if ( !mfn_valid(mfn) )
-        return 0;
+        return false;
 
     l1 = map_domain_page(mfn);
-    rv = test_bit(L1_LOGDIRTY_IDX(pfn), l1);
+    dirty = test_bit(L1_LOGDIRTY_IDX(pfn), l1);
     unmap_domain_page(l1);
-    return rv;
-}
 
+    return dirty;
+}
+#endif
 
 /* Read a domain's log-dirty bitmap and stats.  If the operation is a CLEAN,
  * clear the bitmap and stats as well. */
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -173,7 +173,7 @@ void paging_mark_pfn_dirty(struct domain
 
 /* is this guest page dirty? 
  * This is called from inside paging code, with the paging lock held. */
-int paging_mfn_is_dirty(struct domain *d, mfn_t gmfn);
+bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn);
 
 /*
  * Log-dirty radix tree indexing:



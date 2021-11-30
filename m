Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF87463C60
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 17:58:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235393.408393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms6Rt-0000eV-2V; Tue, 30 Nov 2021 16:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235393.408393; Tue, 30 Nov 2021 16:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms6Rs-0000ch-UF; Tue, 30 Nov 2021 16:57:44 +0000
Received: by outflank-mailman (input) for mailman id 235393;
 Tue, 30 Nov 2021 16:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms6Rr-0000cb-IW
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 16:57:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f99f9ac-51fe-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 17:57:38 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-6Az65UrjNqCOgsq1suTUcw-1; Tue, 30 Nov 2021 17:57:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 16:57:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 16:57:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0081.eurprd06.prod.outlook.com (2603:10a6:206::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.21 via Frontend Transport; Tue, 30 Nov 2021 16:57:39 +0000
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
X-Inumbo-ID: 9f99f9ac-51fe-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638291462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXR+2MsWMPUPGMTQirMkmMTxFCGJM6iNZvEz/VzF8DA=;
	b=YksQqJ3bAAIsYkbm1YqrNvtvsrQALuvPaEHhtvjYGTOT8HoN+/m+G0BYcxsTAVxirdS2Kv
	hfGT2uBIFJ+DpCsgHDRzaDmf4LwbuDDZRmGFx2zEpt8xsuoc6XhpNeDy50WjA8+OG6AXaS
	mgUl55CZyKAxDxSUvr6R6U7GjSKOLe8=
X-MC-Unique: 6Az65UrjNqCOgsq1suTUcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDsIn/GaqsYkHgRFvL1FfiJUOSBj87Gbo10ec9GHD+4y7aLQog6R5DYJqifK+jAvZ/0gytnnYYybI3oYJtUpgqocKQIz6YNmGDq+M68AvNxNsszBSVqUb7EpGMtO+ye4OkOOGCr2KxJ+Au8w0yEfrYi23iFUl+42UJ044oABjy9LMqk1ztZMsax8SS+t2yI7D1W6v8/w2jeB1JTPeUr3SkPFNY+JYBM9AiTHEjtDxfGwco/p9dgiE/8h8GmZBhYeSFtAYAiNh+yS3mTeHl5K9d6f5KUUUCsuwqKddPqvwQ3NgbLyq+ohxjzVAc1T93MPUdivs6T/G4pSbkNIGfsIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ5UX9T3eHeUdOvm6MT+nCstxPpI2elfjhWVptsFKFw=;
 b=VtqM5P3qOOHcGDhUW4NgXvslRvrTK2kcDF+p4QTbcLeEOSt63mtP0FJc8teutisd6mn+xOQ25HdKj61n+1IfpMzpkXObXDZIvUR8svwd+zSlbf5H6BaF9HJAWY66Q3mDj+0KNkxhz2t7ZGDXzjUX1xoPQHKhz5u7RScc6bSTBJHWhqH+uR4JWHuoLZfHQ9L8tyC2y6lf3yFBb+q1iTXGVBxyPwqbjlkbFGdKtgyGuaRzeGA1SdVQLdeP+DwNvO/f81MtKyNEntVn1gJdCWfbBStN3h2bdD+RWcIY4ZFMb6pmdnoFKR0V6JCExrgsPAhpF/cXw1Fo+Oe9wLrm03xFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d510d82c-c0f5-70b6-d506-6ad119c5e3b3@suse.com>
Date: Tue, 30 Nov 2021 17:57:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/EPT: squash meaningless TLB flush
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
 <bb4f2e4c-3ab9-a1b9-457b-f46275d34c87@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bb4f2e4c-3ab9-a1b9-457b-f46275d34c87@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0081.eurprd06.prod.outlook.com
 (2603:10a6:206::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e7361aa-e1db-488c-f6d7-08d9b4228467
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48479F183E43C4BF26815B85B3679@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lc6wSCgPCiy+cfIL025L6HumUILoUSjEVD/VkV8pL6PKL0xG8GDJFmBSmEY/qmAx4UTBl9R/DbHrVD86DLCi96X5wLTN8MNIk5s+N44+blR9/XKLBlfgem6GaJRQcMpJXGcA8RoGHe1JsN5AVvYxpNb0HaIX/9LCaI9BvNyWQ0ilWa4ePeocRECsthiharjaDv4U4XlFlO2jVR4QKhytJyNrm1IUxxgQ1F3D1kPDIoPx+IJRK1lqQMd+O3MGdM6/BkE5KxFnRSxzf6e1p8rRISc9J0n0jeppZVFUD5OfV9kdZv+rxVCr4rqNvZsNd02XoP3gNvC4yIIHkGILy5GUJF0zrHVXbQhpfGQYDa1AE9X7hkiZxgoNzp3LsjrZBkgslTdmBR2/3w6VZWRwlPs3iqp3KVBZZeOmfi9Jve71TXwzt5d8Jh9tzVw/88w8i7JahfibvnDDq0YrwM7DrYphe84P0WhfscX6iPI0sEm2o20yKdcONv+4xGc1WmlGfuCrk4P46eM2CG49oIKSiHePEn78A6Qcl/BwClMPHBUuXmHWTDYhAgTf8T9jHS/OxYDnnzcuk3RtNDb1y8N6vhVL852yBeKpshPGHCDzwiornFSjDGT9sWGjQMG+j41MzNkh/J036odRlkVsdTZW3FpsSiPjRtD341+5FGqUBKAnziKrqc692sh/xA488mYTM1YrG9sbHkHEtKJF+Y0dt03nG0KR24RyqpT/RR8LpT4Yezo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(86362001)(6916009)(53546011)(4326008)(5660300002)(31696002)(186003)(54906003)(16576012)(83380400001)(8936002)(2616005)(26005)(4744005)(316002)(66946007)(66476007)(956004)(508600001)(31686004)(2906002)(8676002)(38100700002)(66556008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnrCOhYKC9oDkVZLVWpMc6AWEPDsMOltSowSP4rM2MadzEYkxP6OkOJZDt9f?=
 =?us-ascii?Q?HthzhgbiobvAmp3RKCEwDabvrT7SrfTr55mx2HNRWpEPith3U4ESSlDDVAkG?=
 =?us-ascii?Q?6LbfgLOucUgRxhDdNpaHtlrX2CDk8TXO+BTiaaoAsqLo3adr2hj40hsyxZ/r?=
 =?us-ascii?Q?006190g9h7PY73SoLC/gAMyh9sPW0KnwdxYrQ/s3PvjYiOu6WigBfxqahvwZ?=
 =?us-ascii?Q?aLNQSxEErb1zQgnteMePbSrFADtJO/n1zFof8VuvGKqLiQFqpMY0cVZheDzx?=
 =?us-ascii?Q?CFCiaSEOIobMXpqik2BchPfTePmtSrrnFvmtIEITm2xvSXFi/Q42vTKEopDX?=
 =?us-ascii?Q?CAPLaFBy/gJ2z8DL55gRJq7Q6ditqijupWENqsGqzbLCwJb2FERfBq3ZCWQw?=
 =?us-ascii?Q?TNqgXFoRzBcdDpUnel/pBJ4NpMgNuoyXRZnTCXj7OwgUKGcq5MLb6nXhZZYz?=
 =?us-ascii?Q?SLR9IcwLT5GdTAEDTrL1HFct0uw4tQB/uK8TF83ZJqZa22XvdZUZst5MoeOC?=
 =?us-ascii?Q?i+arS3+wA6yfG4IRKbAs3umfPtig7x/8GdC10zOdJMxiqeO1l+WaN1iSPYi1?=
 =?us-ascii?Q?LIN/E6cPkKRdhcviWPLaHoo7tM77xp9gZUd55MHvsRxXnlrm4ur6JmI94yYJ?=
 =?us-ascii?Q?VFrq1PGxwRrE84XkRmgNnR92fffD7YjOEboSCWs8ClJPGg5OERVRSvfQ9KLX?=
 =?us-ascii?Q?aMi+K5IVFfQTf5Pbwt6T1JKSYlofMESKkEjOcbdD5vTuCsrq39o8gHIhJvdW?=
 =?us-ascii?Q?PCyn9wK4pHYEGG4mgzKFWc2eq2w6plOJ6CfeGIO9ddTY7kAxM6VspGnxov3i?=
 =?us-ascii?Q?lF5CjQBkm9NdUsCVo4O/KMtNoQtNoTkU4xH2ubBv9KX/BUTVV26Jy2oZIAtN?=
 =?us-ascii?Q?wK38wvaAhxDfxeCVNPBwaIOE8SbMK8O6LVidquMxtUkr+ERxEm/l898DU+Cn?=
 =?us-ascii?Q?5/kYdUDCF/zlHfjGy1pHbnpLQKIHwyDkU+cOciLAizKKb2ql8WFO05RdxA79?=
 =?us-ascii?Q?NWr70G6DMlzXcJVkFZQALr+EI55PSkgunXITmYdY2wtzjZ7pLcxeBNToU0xy?=
 =?us-ascii?Q?hsHM559qxaVn2yCEat16TJhauupEDDvepfXBY97wXqIX9NiM3ZErANpGqrJB?=
 =?us-ascii?Q?iXVHUqqzyU8isl2JNuUuIBnzUbwRWq9O81XfnkAjMSuFXlhDPtQ2+gA5bgOe?=
 =?us-ascii?Q?PKEx9He6sCUe+pB4cd7yZCRI3mQ0V9SbU1RaBffmjq4adtKgw9QBWE80+I8v?=
 =?us-ascii?Q?I+7Ewcl/K+6mg+D2GGeaVvqA2QHg0MbRDP9bvKc+9kfvcE94+Zj9+cnXW9xv?=
 =?us-ascii?Q?W3sd31qnrcRYp0VJH2UhiWZi7MRWDd7Zmre9wvr7JDE7/rTSTOyJIwpdy04B?=
 =?us-ascii?Q?xVJxjqOgRLS10FZrVmF/4Neb1jONXYOMy3IUtLg/+W2x0qPvhp1yA0F71ZGC?=
 =?us-ascii?Q?NKAm6sELik/TJFOawbUIO1DsxAA0a2OHLkAC/2nlAPYHS0W2nNymnB/f8zYE?=
 =?us-ascii?Q?8LXVWfGeZ/1DMpLtfVTN8ibMT+/UsCown/KPykREbqL9xolbixJYKkbv+LS7?=
 =?us-ascii?Q?Rsxc+74xy9fF+fBTAwUXA797YOw79cnOVEOpHybcTrvWd4cFc7GvF8C139Cp?=
 =?us-ascii?Q?9VA258ekSwq/WR8zQFaiUjM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7361aa-e1db-488c-f6d7-08d9b4228467
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 16:57:39.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJadte0OssMskf1Cle9O4U77ktorRPtb6b4GIleWMGUTRBu6cY3p4BoN0/0OX1FzF7yYSA+kCDo63wMXjo2ptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 30.11.2021 17:44, Andrew Cooper wrote:
> On 30/11/2021 16:10, Jan Beulich wrote:
>> ept_free_entry() gets called after a flush - if one is necessary in the
>> first place - was already issued. That behavior is similar to NPT, which
>> also doesn't have any further flush in p2m_free_entry(). (Furthermore,
>> the function being recursive, in case of recursiveness way too many
>> flushes would have been issued.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> ept_free_entry() is called either recursively, or after an
> ept_split_super_page(), and I agree that it does not want to queue
> multiple flushes.
>=20
> However, I don't see where a suitable flush is in the superpage path.=C2=
=A0
> Am I overlooking something?

When it gets called after ept_split_super_page(), that's in case the
function failed (and hence no update to live page tables was made).

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41384CBAF6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282898.481743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiKr-0001Ns-OC; Thu, 03 Mar 2022 10:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282898.481743; Thu, 03 Mar 2022 10:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiKr-0001M1-Ku; Thu, 03 Mar 2022 10:05:25 +0000
Received: by outflank-mailman (input) for mailman id 282898;
 Thu, 03 Mar 2022 10:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiKq-0001Ia-5B
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:05:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70ae4b13-9ad9-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:05:23 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-lVBXtSbMPgubX3W_YL5Jkw-1; Thu, 03 Mar 2022 11:05:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3311.eurprd04.prod.outlook.com (2603:10a6:802:f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Thu, 3 Mar
 2022 10:05:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:05:20 +0000
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
X-Inumbo-ID: 70ae4b13-9ad9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646301923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A25zh5BjjDRbl+SbPOMZedHC8tdiYgioJS38R9kRtSE=;
	b=Ma7CvuTUnH1TWKgYSajr8Weznh8m23GDGeLmoHyvZJSSqF2B5sRhYPjJkP7srjBo6IjR69
	D5CF99rMzMT1ds2T8L70NpwR4/J8kjiF0/AZygZSUS8lbF9FISdHFDrnKS0+LG/DHjmCt4
	Utw6kDSOe2PJC8ottYqEtM5Ws0hz/Mg=
X-MC-Unique: lVBXtSbMPgubX3W_YL5Jkw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFbfilM322kOSYz/nQ7WXY94r11oTuVP/kEs0dxhSFUov+pxwEU9/v4Ov287wRfSX5j0pd5qu923K5ZlxjXN2l8KuuQrcfXMzHQ9dLQxEEMKmXX6cI3SfZc8Evg9McapynvozQu3144xxKioKZWGvI59983CaGdychJY9V4i8xYgoPe7/Oa1Lr8mtOzZ8yMtYwBcXF1sZbDCSN5GxHMhWjDC0vSHsBxXxFscvAgHJUstfcek2R7qC6UPrhXRg8dUSYc8n+aIn6UvbAy+HelGjFNrHEORCoQuI2C59w/zcXe/6ovby29ru+jJNgSGo3I0zF0F8vFYiopKHP4dubDZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A25zh5BjjDRbl+SbPOMZedHC8tdiYgioJS38R9kRtSE=;
 b=JleOcDtZ6i8zfGK82DZSp/Kh+JZin+gliWqD4zGavMJ4e2uirvd6yRmJ/jSYFwakY4+rBDEmwE4t/A5U6zwsw381I09FgSZGqa0drxEVHLiA+2ourk8Q7dfTPD7U7C1A3Py85x9aiCFwEJxCkRfSE4m1YvBsOSAXtFbv909NvBO0Kkjv2bDTv79Ep/WSbiy/W+8ZHuJW5AP90mGMrG+ut1gssFu6b8fudE+R08H2TUysqUL+w1nMl+gk12PijS+UsWu6gCbEDvghpwyvXMZStkHxuhp3/L3MEUhzbjOPU5L/o/K2v0WO14U/+GrNrAe1lry4Rui+tjBXl1bipPXjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96b6ce72-9c64-1ca7-56fb-63a30cd8591b@suse.com>
Date: Thu, 3 Mar 2022 11:05:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 2/7] xz: fix XZ_DYNALLOC to avoid useless memory
 reallocations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
In-Reply-To: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0046.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a39c6b9-221a-49c2-9392-08d9fcfd531a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3311:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB331108ED422FE0D70D98ADDEB3049@VI1PR04MB3311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4cBCAVLdWfc/iqTj21zyN6NN7PNMjUjHYmmzb0N/K2N5RimRvbG9TSK83OkExGpUSFoUK5N+bbIiM93cfFIVJyPjJ/FUDBmijoMEVv/Eyao+RIHfBWz4pvs0g9Y4lApnsFXhbgR4adD6k7sm0RZqiZ7fFzI3FNxAK6THJSeiOA2ulgbXLj7zL0RoOcMrZK2OiZZEEHkDQjKo+Yi9plArlP2InB6gI/qqUu/a8FyfgyXis+p1QA3I3ArJH9vnHrl2ZwFCxYWbjrWVkItqrKqV400MC1wibj396hrogqIt2VBMnXAT8e80oJ9FuoMnfW8JkyIiPH7bjsAil0DSxnAPyWfz6/NShYWd7qZPmw+HW4Ov3mbQ2GUm3xBfxdv5MufKY4rDMK79v/IAVw7ubE5YHNSvztbBuegPHRooH2UsMvb0Q7D6bP7FeXDN8oBvsKQQmdIJbAf2IIezy4rUT8gakYO23vvGmBQQztsj9LWnaOAuC+8J7gUaXN+IsNx0C/O2aEznb5Sj3rHPw+ZfY6MuZ0qVLz1TUO/fqYEUXptuYNkr3oicjg2nlS4u6OaJxyiLnTY5Qn1ue8h2HsBhhickqbJ5rDXn5C0VALBvkviRr/R3AuynIV+hDdT5PGVEdhcIuArnjPhA42xPJ5HujLtI8wSZr8GTo0lcWogMSafiDm7l/E9Ze7+btOZ5OKZXze0FF/smquKjUcBZzqPXQBKWekSBXlPFyLd5Eig5nn8pXUYH9ZrrzZ5AoKHLOcjJQOF5urlQPRwP0PQO86WDsp9yuxIUad/ZtfkWD507yuYlnvhPMnDhNSOSferJGQ9FR+r7RET6ycxR80dYLgmtQAqCWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(5660300002)(6916009)(54906003)(966005)(66556008)(8676002)(4326008)(66476007)(66946007)(8936002)(316002)(6486002)(2616005)(186003)(26005)(508600001)(2906002)(6512007)(6506007)(6666004)(31686004)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clNGRXQwQkdzQ3VJa2lDb2pwcFozL1M0dTZVK0YzMUxKQmFQY0RsVk1iN29V?=
 =?utf-8?B?UGNwcVh2dUsrN0RSOElYb0h3SklQV1ZTQVhuQ2tIc2RpVkxwVWt2OWprMU1j?=
 =?utf-8?B?SDFZdlJWSHljeGlMbldIWUZoaWZsY0JrUnNKcXBDVERScXowUkVsQ2tUck5N?=
 =?utf-8?B?MW5XemRNZUtqNFU5MW94TUpEa2pXVmVqKzgrMytXSWI2M1h5anpwUGllZ2F4?=
 =?utf-8?B?ZzlESVJRSnR3YjR3cG8wRTFqa3YxekpaVldFZEF6c2ZKeTBpOXF3a0hrK1lz?=
 =?utf-8?B?ZXcrMWRNbW9IL0VyQ2pJQ1YzZG1rYndXVmxURnZPN1dUWGM4S09tZHVuVXY0?=
 =?utf-8?B?bGNBMGd4OXZiQnF6NS9TODdhTmZCUjF4dURtcllZK2laT1VpZTFvRkdpK25n?=
 =?utf-8?B?OEhWNjl4Wms5Mk83R2NaN2N2UlZWTnk2TkdwaGV2OW5rbDBZWncvSHhidzVG?=
 =?utf-8?B?clVHTktRUERkS2VtSHNFQXdzNFZ3QysxR0U3alA1L3NUbktwcFlSNWh4ZSt6?=
 =?utf-8?B?UTRHRW5zQ2h6YVRKSHJweFF6YXlBMDVvMFYyRXA0R2dHN2pqSTBmY0FaalNN?=
 =?utf-8?B?NkM1RXJHdUpOcnk1WDlHdit4R0wzUWxDMlNWZ2IxaktXREQxQlNpaUR0S2lF?=
 =?utf-8?B?Zit1VUlxOFZMbVpOd0Z1NUtiRFA2aXVjTDZyNlZFcHd5dzE0K2xsVnNMY2tK?=
 =?utf-8?B?bW11WnZ6dFp2U3IvcGFGWE5JNVRTTHNaaE5ERGRWSXhlUHRkSnFMSU9GSzRu?=
 =?utf-8?B?bGZPdU8wZ3U4WHV5UEN0OXBpZFRWQTljbFhWcUh0WXVqVGRXNUc3MVVkb3Np?=
 =?utf-8?B?TEswVEd5YkNtUW00cWxOclVySVlFaFFRWTZXZjFuNjd5UmxuL21HMjh5R1NU?=
 =?utf-8?B?cGtWMHlGQldlNlZyZUJvbVdHQUI5eTkvRXAzMWxEeU1xMFZ1NW9UVmxtalhq?=
 =?utf-8?B?SS9lZkJTWXlrT0tUN1pKQzV0cjgzL0JDQ3ZUTGJzODRWTjlWR0dRMGxwbDFZ?=
 =?utf-8?B?MTloRm1OeTdML0wxcmRnQ2p2SEthUnhjVHRVRUppTUZHdHJESE16YmY0U2Vt?=
 =?utf-8?B?bDB0TmVRN3Z5OEZxd2xJNmFzZUhKNXNqTS9kS3JkVVZjYjhQall3d1BoR1Vq?=
 =?utf-8?B?ZzQwYjFPRzUrWlhHRHI2a0xIckhNRjVHTTU0aUJqeVVYY3ZGMHBSU3RaYkRy?=
 =?utf-8?B?dUI0dXMvbGlYRm5iTERJSXVrMmVLcjRuZTU1YXpvY013ajFuZ2hLUi9BUWp2?=
 =?utf-8?B?RnhTQTh5OW82VGc0dmNKTkhOZHhpYkVxYlZ2SlVGVjJsZ1B3RXVsVGVxbWhp?=
 =?utf-8?B?VGd5djJ5eWZhZ0JsbzR1UUFUcUJJQlBJam5iY2pMbERFdGhGT1dxR2JVTndN?=
 =?utf-8?B?K3VaYzY2Y0cyc1VyQnJzTGxlODRNTEpqMW1RcmpzVUFzcjgwSkFmTGVKMDNC?=
 =?utf-8?B?RUZnOWs5bVEwbkpqdU51SHFndWJNQlpRcHJySUtrVVRpblkwaW9neXd1dUM4?=
 =?utf-8?B?U2FoS2R4NStXRzVvZ2wybm9VZERheVM1M3JtY3VkQmRxajJXakZ1WkQ3ZUN0?=
 =?utf-8?B?cmdydEJXdDJESnV4NkdpRlVaeWFhZEMxQlErNll3djZhWG9QZWE2Y2FlSEN4?=
 =?utf-8?B?cTBXdklIM1BzaStkckVsMU5MSTFVK0VwcE5ocThyWWVnYnRsNXlGdmhreXhj?=
 =?utf-8?B?TlRVUGZsbjBRRVc4SlIyVC92RXR6NVV6eDhEcmF6SXczMURnMGRCOEZKNHBW?=
 =?utf-8?B?MlhPNUJXTVFZbWxZbWs4aEY1K25HMUVOUFAwUjIxMzRXVENUM2VObkh1dXVV?=
 =?utf-8?B?K1Y2VjlrYTZJREIzYWZVcHNzQW1CUmI0M2NvSzJmS3BTVjlRbnNpc1RzSzV0?=
 =?utf-8?B?QnJkeUFGMzEzeG8xaklZSU1rVC9XMEFwZUsrTjMrM2FCaHVUWnZFbHo2L1lM?=
 =?utf-8?B?TnU5N3FOdzF3RFIxbEYwUDN4YnVGTisvb09Gb3BBVXorMEpEWnhGcGZha2xH?=
 =?utf-8?B?cU9IenV1amtmdStnTTE3OTJzM1o3RWk1NWVPZnlXSGlwZTdMVDBjQjhBNSt2?=
 =?utf-8?B?NkcwQzlHMjRlREIyeGFVTUJxVkNYL1pYbUhjb1BURkhSRHNWT0dHOHlvVVVI?=
 =?utf-8?B?SElzZUl3ejZORTJpMnFDUTNuQm54N1JOT0k1eFF1R2tzd01NNTN4VnFhdEcz?=
 =?utf-8?Q?mcCigTwdN61BHlimLIT23Ek=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a39c6b9-221a-49c2-9392-08d9fcfd531a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:05:20.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2pVIqO0g/cJMcHQCC8gGNWYht9VLAGr33eqv9lyKMBsgeHThgKnhYsrHq7Hw6/xnzFTlrm49uIuk3c2HkPSPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3311

From: Lasse Collin <lasse.collin@tukaani.org>

s->dict.allocated was initialized to 0 but never set after a successful
allocation, thus the code always thought that the dictionary buffer has
to be reallocated.

Link: http://lkml.kernel.org/r/20191104185107.3b6330df@tukaani.org
Reported-by: Yu Sun <yusun2@cisco.com>
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Acked-by: Daniel Walker <danielwa@cisco.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
[Linux commit: 8e20ba2e53fc6198cbfbcc700e9f884157052a8d]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3: Retain all Linux side S-o-b, as per 5e326b61693c.

--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -1146,6 +1146,7 @@ XZ_EXTERN enum xz_ret __init xz_dec_lzma
 
 		if (DEC_IS_DYNALLOC(s->dict.mode)) {
 			if (s->dict.allocated < s->dict.size) {
+				s->dict.allocated = s->dict.size;
 				large_free(s->dict.buf);
 				s->dict.buf = large_malloc(s->dict.size);
 				if (s->dict.buf == NULL) {



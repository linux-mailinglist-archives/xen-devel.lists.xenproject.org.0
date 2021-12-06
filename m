Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D209D469744
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238951.414173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEAv-0008ES-MK; Mon, 06 Dec 2021 13:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238951.414173; Mon, 06 Dec 2021 13:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEAv-0008Ad-HF; Mon, 06 Dec 2021 13:37:01 +0000
Received: by outflank-mailman (input) for mailman id 238951;
 Mon, 06 Dec 2021 13:36:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE6t-0002vN-DM
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:32:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 019b8d4a-5699-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:32:50 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-ckVGP_caOFCRqsyow_THQw-1; Mon, 06 Dec 2021 14:32:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:32:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:32:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0020.eurprd07.prod.outlook.com (2603:10a6:20b:451::13) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 13:32:47 +0000
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
X-Inumbo-ID: 019b8d4a-5699-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0H0YRL04KECEnhSZHc0txOpsgQMjHkGgxeFv8W2+jqE=;
	b=D/6tE1R+cawc9hyHcLOvREHYrRaKQ8BjnPYIpTkogf+uEDfh8GBaE9HsyAMiJ/7viitO9g
	oVGTFU22erumMurarkVebqnnLzrB2slo/QBJMcMeYdzuaBSSBfrJ99j3wqdUwMwF4+30iY
	AsPHxz/r7/Agy45IKXfp8B1zJeo4b50=
X-MC-Unique: ckVGP_caOFCRqsyow_THQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuusALwaYDo70rTqtwEigMhnhMGU3Vvh3d7lBVjX9Q10tZrOn1xr+9RL9BCE9toUlvKXSZWOwC6+wI1sbgW5T4OhalDG9woYMDTF7Qoo0E/V5oB6CVeortBtMXvyX+VNA2NVGYQ4fm69UXIgmkFzz8XIMr1U82Nkn2LfVWuiDydvJwsbz3vAiR4OXL7FdtH0ClKT+qBN/8cS7RZejGqajArztcncoOySBc3OXehbgqevhS/ArdlyM15JW1K81BmplCs98v1u4yWmzZNoj6eHIGzNVqv7Qqj8YYvAOQcc7eKta/ibKe9HJnmMZlT+YgVrTBV8nhKlRGEB0JoC2uw5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H0YRL04KECEnhSZHc0txOpsgQMjHkGgxeFv8W2+jqE=;
 b=f0uVbyaYbJzew4awXtkAUJB/GXEP+g7qkTYFwiZLvhuV2a0R9OyOGEuaZs94USVdMAkaCUrFIg8xzQ80C9ajShp1i4JKNb2nbR8HsCjFQ8ZNjEsSFq2kO64JOUIaXCjEPxKQ7NUL8wdKMlNKYitl5PK4Rcx7kQ1wamDHUCjnHPopD+uaH1HTPdM9+pKXHEwcu9YAfbsIAoANv3EBuie+fMP4ZwPC3makoJSD/d2MUvU9ejepeRD35mLDqTCurwspfDhgfZJ+dVfnbdpW0X60rmNcMdkzL8Vsiicu5emVCsGteHec1v7p5GtcTBnVnmeRATRMpxovlYXqhEV3G7Y0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fdbf442-ad2c-7348-06a1-9efa47443ce4@suse.com>
Date: Mon, 6 Dec 2021 14:32:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 6/7] xz: move s->lzma.len = 0 initialization to
 lzma_reset()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
In-Reply-To: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0020.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b9101cb-262b-4af4-b7a1-08d9b8bce490
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57413B42A037B8ABB9EC757BB36D9@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mjgz4oKlgb+prCkFWc30aspYNaqSwXNJvTpbRq+eKsoBQMz/4jPlp3uX7dpEF96IrsfrbVL/WnpXNPUQSNCUYTWpHmxMAvXA05bHtlZ5RZYtSU1KS8B9Fbzd2/ubxfdXWruUu0bVfDQBfWaqPFmb4pAA6QDkvSBQ1EOxkYdmyTjX1g/BWrIrmHqGbKoex0K9yvLlZvilGnhhuuGDgZkFaVb65de4QAj59z7SeH9oiZPpI9EFrcyP8p3D8Usn1NVwKDkH63WNV8h2gAZOo9cxmLvK8aIn080bVdcYVKt8DCZAnaJszOKrJF1DPFIaGM42GCDvUsRJ/uEXdRp1q5TgeGscXd/do+EczNZgH6nwDZXvnP49mRExJMNRHHjYXp0pmcUqlYRFAA715BXERUcFaHuO8gm9M5YK7NYw73bBwxFzsPL4N4khfWLGh1JiiaHz0rqsAuAMnLqXMbeyn4JZ3f+fJXJom+BpYHQGw06TMeeA16drBRFU+RO0bjsCeKoZq3lJimZpGQByndCCxOGgvGIXtM8ZQ6QFvB5CY3qGsY4iErC2LMicK7n/F/05tEs4qt+ZKF5RJ8wQAaDeLwFDiZK+Zwzd7XsIC96jseB2ArVoCNqlkLgpt0hGHE9KWdPO2AXn54PU/o8hudfw8hGx5CA32V6IGipArjx7GL5LUBUjsLqXFmX8Mv3lT8+BteAqkTZMqsDv7WZ4PIlDm0rl+i8B9dzRfgqoEwRiZ6KZWlVoodDVTCIQRZY6tNHwDcwTIxSLh6Fw3kO/IlC8/jDfvD2+4F5ZjJb7tAD16ercUbBc/bS1Xi3AGtia9jRLB74y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6486002)(8676002)(956004)(186003)(26005)(4326008)(2616005)(38100700002)(86362001)(31696002)(36756003)(8936002)(66946007)(66476007)(66556008)(508600001)(316002)(2906002)(5660300002)(6916009)(54906003)(16576012)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0hvVFhXNjJiZ1VhSGIrMHBiWVpKOXgzZUVBa3M3Ui9yaHAyMHNIdTVueDRs?=
 =?utf-8?B?dmkyMGY1OVlYeS84NG9YaFRQbjdTd05ZdHJNWjRQUGtSMngwNFpRem9sakNv?=
 =?utf-8?B?MFRJT3J2dllWZEUyRkNzNVRMYlg4THNXcnMzRmxDZEFucXRhYjdCckNqaWFu?=
 =?utf-8?B?NkVuQktzYmhJNUFPZ05rckdGSlJpNytLazZuWjR4Mk1FYVE3UXVUN1ZVWUpU?=
 =?utf-8?B?TXpVdmNlTDlHRnMyY1p5RHlTTXNTMUMyQmV3ckcyT1pydFJXVUVqankyN3ox?=
 =?utf-8?B?L2pSNXp3OGJKbmY5YndJcmdOOG5yb2RjVk5OUS9jdi9kc0ZDalFZUWloQ0VK?=
 =?utf-8?B?ZTJzaitDYVo3N1BaMTBlN3JhclQ4RHU5RVBoOTdjZ3dlN09vbkdGSGFKNHp2?=
 =?utf-8?B?Uk1xbHVQcjNxYmROaWs4LzhIRUZQbCtHVHJwblVZWXNXY2NiYmVzVXE5S3l4?=
 =?utf-8?B?TTliMitySHZhTUdER0FBRzUyUGxMOVpzM0tjWDl2cUc1cWdnamtKekx4aUVx?=
 =?utf-8?B?aGpPMy9zYWpGbEVtbFlXMlFkb1dBYVJRbWVxVU9lOU5WNmpVbnJHUmlsQTB0?=
 =?utf-8?B?L1FGSjhHaitWMndYckNMNEoxemdLTEcwQXVKM1hzV29VeWlsNkNaOHM0Q3A3?=
 =?utf-8?B?azFYVjVha2xVM21yY28ycm1DRUFQV2FVaW1telRpRmRyTCtKd2VRRmYxcHVC?=
 =?utf-8?B?ZjUxZjJXRGNvcDZ3S04wc2toTldKSEVnZTUwK3Y5SDg5VXFhbmJiWU9PUE9s?=
 =?utf-8?B?M3dkeXpaQW8wc1NIRTlxSk1rTkdibzd2Q3JFT1VRaVhHcmpROUc3WjJPYk9C?=
 =?utf-8?B?UnZWMzB6TnJIdlhvZHRGTEVTSTI3czNGNVdGZ0x1cWNwRHJXdUFJOEN2dEls?=
 =?utf-8?B?bjJHVTByWkF0dlBhenI0dEhRMkdGZE9lMnkzVnJMbEJsdzJEM001aE1rU1A0?=
 =?utf-8?B?eU1ia1E2NTNsRVh6NWhQRGgyVm9vYm1MMWNaVUpWREhZZ08wZ1RjZks0K001?=
 =?utf-8?B?enZ0U3hjYVRSSXQ1R0NYZ1UrU3FxQW9TNlBSUHJQaVFPS0NmVllVZHNjcWFs?=
 =?utf-8?B?NTJUOStNbVQ3NHFacGF5NHBKbkhXYmpuWkdmaUQ3SGxUYTNmbXBWSUEwZkJa?=
 =?utf-8?B?YWZsdHY2aHNiUU0xR3ZkWEJvQVg4Z0owNnA1OTRuK3dvWUpzTW9KbTVZbG9z?=
 =?utf-8?B?TE9NODhrcEpQdDFQSEhEaTIzZHlTV0t1eTJJcHhjYzM1ckJyVHIrWWV5dGFG?=
 =?utf-8?B?b1RwWmFkaEk0anJTZ1dDTnpVQUlnQVFtZStjMm9yYjFtZm5NZkVrcWU1MUNo?=
 =?utf-8?B?RGI5S3N6T3VLV290bnRMWkNTOXpHRHRoRE8xbGNQZnlMN2FPY203MzVCVWxu?=
 =?utf-8?B?OTNMVlFkZEZrbUlSMlUvbHQ0UWpSNWIvVllIRkFEbjV1MFBHSjRxc1llZmM3?=
 =?utf-8?B?NUJxMlFLbk55T3RveU1URXg0SExhMS9kVk1wTjIzdk0rL25RTFJBUStFQVZK?=
 =?utf-8?B?MDRFajQ3QnNNbDVINWg5Rmx1RG9FNEpsMlB6eDdrc3ZORlpTNUxmVHovMzVR?=
 =?utf-8?B?VCtCT0JCazZpTVhSTXQzZEhiQVZNcG53SytqQm9Jam4zUEpPMzJtQVFVK3Rn?=
 =?utf-8?B?d0ZlY25kWldMZkJKWURxNVBWSUpNY09MUElDZytPL2d5U3laRlR5bnVnb2lG?=
 =?utf-8?B?SXBoeTI3WWd0Nkx4ckp0dUVDU2J6bVNZeDVUaU9wT3J4WWFSTGh2d0J4S21a?=
 =?utf-8?B?TFdtOS9GdG1pOFQ5Wk8ycW0xUUpEK3VnRXZYNlRrZXJCUGlIcDZNa3IxNmJo?=
 =?utf-8?B?bzZhbVpoQXZpTzJySHFvcUZyTlQyWjF6NUxwNjVpdWZMSGYwOWx0VWN2QktQ?=
 =?utf-8?B?OTd6a1Z6V3VhZjNML2kyKzdLZk9yU2xrOWhBeVh4SlFHV2d4ZjFxYko1VThN?=
 =?utf-8?B?a2x6TGtNcE1FNGtVdmV0RjhmZGpxUDZkdnk1NzIrRzA5U0VveGd4cVdIY0s1?=
 =?utf-8?B?YTNPMUh5NGQ2MFRaR3FuVUsyNE0ydFNHNzgvclBJOG11UVdlMm11YXptWDRF?=
 =?utf-8?B?NTNuQ292NE9DV1RDWStDMXB4SUN5Z3JHRG1jODEyRXExSHhCM1RlN3hOa1hI?=
 =?utf-8?B?OWtjUGRjdFhUUkVWN1I5N2JlRHlkNGg3M1VTQ0k0UnZ0a2NvbjF4ejhtNzBE?=
 =?utf-8?Q?uUpcRBEdbMbH1y05WaxaQNc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9101cb-262b-4af4-b7a1-08d9b8bce490
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:32:47.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrqb7I+fJYfinTvMr48BzkjUJNEpRAYF+uyCKIxI1nBYRgI+BoPqaA3wyEVY36hT90nVyCeuys/H8+UQ8jBI/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

From: Lasse Collin <lasse.collin@tukaani.org>

It's a more logical place even if the resetting needs to be done
only once per LZMA2 stream (if lzma_reset() called in the middle
of an LZMA2 stream, .len will already be 0).

Link: https://lore.kernel.org/r/20211010213145.17462-4-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
[Linux commit: a98a25408b0e9b0264abcc3dabfafd9ff2ea1046]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: Retain one more S-o-b.

--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -791,6 +791,7 @@ static void __init lzma_reset(struct xz_
 	s->lzma.rep1 = 0;
 	s->lzma.rep2 = 0;
 	s->lzma.rep3 = 0;
+	s->lzma.len = 0;
 
 	/*
 	 * All probabilities are initialized to the same value. This hack
@@ -1174,8 +1175,6 @@ XZ_EXTERN enum xz_ret __init xz_dec_lzma
 		}
 	}
 
-	s->lzma.len = 0;
-
 	s->lzma2.sequence = SEQ_CONTROL;
 	s->lzma2.need_dict_reset = true;
 



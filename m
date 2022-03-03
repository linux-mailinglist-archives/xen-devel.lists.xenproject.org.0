Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20194CBAF7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282905.481754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiLK-0001uK-1j; Thu, 03 Mar 2022 10:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282905.481754; Thu, 03 Mar 2022 10:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiLJ-0001sP-UU; Thu, 03 Mar 2022 10:05:53 +0000
Received: by outflank-mailman (input) for mailman id 282905;
 Thu, 03 Mar 2022 10:05:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiLI-0001Ia-CD
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:05:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8011eb29-9ad9-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:05:49 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-8CtoAN92OBCwP41myE49Rw-1; Thu, 03 Mar 2022 11:05:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3311.eurprd04.prod.outlook.com (2603:10a6:802:f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Thu, 3 Mar
 2022 10:05:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:05:46 +0000
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
X-Inumbo-ID: 8011eb29-9ad9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646301948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czqxhntDmPvVjF13ScNMIxw0RdrjFUc3x6QkChagSno=;
	b=Mgsg8p9rLiOMzE26mWS+WGjsPEjMJftPkkt1owSwN07Y5fhtTiu/KBL+TJRpx6PaGwiSFe
	txe7kKnE/Hj6WpcNbIaL/ZlIKVA3RggaTxAxHY45KonXWA9q9fEsdd704fpfh1Khm5Ud3X
	TsGLt8y5yQcTifFqL+j5Rk5xzI8RprE=
X-MC-Unique: 8CtoAN92OBCwP41myE49Rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWgN3gEVs+Go2tXmB/MTgSsMTUWg4xmwH0Y1dFLeb/0AcRpKTpEbBiIFgkSx6tlR99FwjEOY0/8YJYORIu+xxoHyGrFzYF6uxdybCDbkdxewtHiviGYdPsgKCUfnDe5STk/FSnOM0LjI6z6A1ttLFQ3C4sMEe0bYqcXnb5fC3wd0nOZL1JbXSNCal8Q3FuDkTPA6zQIYjSbyqvfT9P4ZN5i1PPg+bRWePaTN/TnIVIKnauW73Yx+xZlMV3vYzpkVx2jOvsRi7kt22frpsN3bunqXFVeKGncCHS4s3GbdtT0MofiBL0C0EkpckGvy60G2mZSrc+YEHebP2RE1SFexXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czqxhntDmPvVjF13ScNMIxw0RdrjFUc3x6QkChagSno=;
 b=kOMm8N+JttOmqIzFUyB1KWcvLpkdRi1V77Z6TbZan5U/rBsZR/BZlmgqDj4uNOm+ZndTDoR1Z0xM7YDy/QDABtNriPMup6v0EYuwP0kOFUyIheGIGQdFBZZrcm4Jwft9hpm+DAItUv6uKcZl1N5yI2RGbjTFjuLHmivi+V4s5sjezRL5QpeqUhHNy2srhkXi9rlGLlUP7itCeoHt2C/f+SstAgGkXcdY0F+AgMDogylXSK7J87Xw9Bo12F8scNso79DzadgoZJ+FTk2SG7ln4el5jPDFKIUTcVsQU30ZKXMo5NKQpdIe1ugPpvwxHPIwm+72d1wY7QDUo4qfWEWkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f81b2aa-cd27-d83e-790d-b80c41619c11@suse.com>
Date: Thu, 3 Mar 2022 11:05:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 3/7] decompressors: fix spelling mistakes
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
X-ClientProxiedBy: AS9PR06CA0354.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4766f35-6c31-451f-3a1e-08d9fcfd6297
X-MS-TrafficTypeDiagnostic: VI1PR04MB3311:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB331102994E311619158A127DB3049@VI1PR04MB3311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XcrSoDsQZBnE0/lr6ZUQtVQH1HazpTZsUbJavvj57ebP9Vs5XXAen1sf491Y8ToIANH1G483N9rPNL55je/bvDvSdLYhqiC6yrdoFjm9iDedzJ7WkvsCoN9sRgBQlLeXHniEOH9cyDz2Dqd2smezMvxDapu/J+ZSYOsntWp/WMRMHo0u+IzelfaajS8XJXMuZL+XE0C42Und9bXbMvB8XLdyJQvIc/pEp+wq7ZlFqEOcswWjVBrNK0yF2kq6wt5NYBDZ7GwmFDrXgZWuaNsKRRk3e9wmmmIE2kCqB1foS1uvBoI4r+CNzNXZr5lqIIpAgDT2M8jKjrSTh+8mqrripnPzv6RPjnCXPBcoSEY3i+0yEQ1gfwaO0Z24MmFypM9wfFC8OLNPokzTravzsK1mJtz72TL8rm9pCiREo9SU4xwhYwe8LZLkH3oUmSZES223YgckrhODD+SKUY/JjSnkbQbxFJoQ+1GkerhFVwWHxWoKrl4hjMnYSB9/n0GGMzV2x+bK9No2L8UqqQ8ciGp99z7sHoQWfswaR4B5w1ZFuNj42WIAeV9ePJfqsWc7RBbtObQEhZdw/0vRme7VSXCqhHvt8CO2JI5/C04iz6TT3CK8ca5kOYSt2R9DcovNWJRQZwZjYvx9Gx0k30LV1BmGcq9bKRyEgMxpc/dOKU3dws/EOaWVBCv72wT6m2D9FuiylMp+iyMGk341v1xNXiHRDubAHKsqnro4llT96RGd9YXwSUrEf3O7KmE2PPrwuPoVh6a6UgG8dWsMAxsJeH7JU/d9ETLoGxT8cnRHJEfwwIAuWU1FmyUqHe3wXnhvUIQU3/E81RdkMMYluJlMPZebLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(38100700002)(5660300002)(6916009)(54906003)(966005)(66556008)(8676002)(4326008)(66476007)(66946007)(8936002)(316002)(6486002)(2616005)(186003)(26005)(508600001)(2906002)(6512007)(6506007)(31686004)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFFSRHgxeHZBS0lVRlhSOStvZ3E0N1lHRTQ5cU5UOVVFZDhySHdPdWxBQUFZ?=
 =?utf-8?B?T1ZhZmZhLzY4QzA4dEQ3V0VPVnArazFacE13SGo4TWR0VUdMMGkvbUFNUVJ2?=
 =?utf-8?B?TFNoeXlpK2haNW0xRmhHeUxpZ2xqYU0ySWU5MTBDTzlLYkFqTGE4M0VRRlE2?=
 =?utf-8?B?NEhPdG1hblpqbVFwcFNFSFlZa2lvMEhDK3FsQXkybFhaQkVReVpoUzdIc3pv?=
 =?utf-8?B?REIraHlISFZISTduOW1MSjBKN1lPaGZBNWhOY1VtQTJjT1lJV0VFSGtNVU5j?=
 =?utf-8?B?Y2NHeVpjWVN6S3RrYTFlVEhtRzZONUJObE9qUHJ5S0NYZkNtOUVBSURPMEdR?=
 =?utf-8?B?cjdEeXVYNm8yTVNRWmRLdjNnUmU1YU5TRUVqNklBSGU3cWFSeUYyVm4zTEl1?=
 =?utf-8?B?TVcvUmJlaWpjNU5MQWphZ3VnYUdjZHpNRVYrakVoSnZEbFEyQTBqNUxNZzQ0?=
 =?utf-8?B?eE9xSUVDVHpiaDZ5cFlhLzMwbEt6ZlpyUS9xY0xCd3BIdE5RZFdyanp5UFFs?=
 =?utf-8?B?SGFwTlgzNjhuSGVJWW5YckFWbis4amMrRlhKeGpnVjNJaERPQTlPaURQQnRw?=
 =?utf-8?B?M3FhTmpucFhWakc3ZHJDb2cwOEJvdVFaaHVuc2dsN3Z6MWt0VU5mcE5ITUNI?=
 =?utf-8?B?b21CTTVEY3RTRDJKeGk2UXdqcXFveDRnYUEyRWZZZDF5M2hMaDJZUEkzUDFD?=
 =?utf-8?B?MDRRMSswejM1TU5vSm9UVVBXQm9haytJeTRyWHY1SGR5ZGhtTVkxamc0eWs3?=
 =?utf-8?B?U0MwdTl1RFBNMkhqUUk3M2d3ZnF5ek5GUkNhYmM5Y3dSRmYrVjdyd2tlNHU4?=
 =?utf-8?B?K2V6Qi9WTWIwZ2U4UzdZTGErb1puM0hwK3NKTTl2QlZuOUtUR1I3S3RZbWsy?=
 =?utf-8?B?RXhMMitwdW5LYlVVTFdwZmtRT0Q1b21FazVyTTZhWUJoalNCRnhlTWRONndW?=
 =?utf-8?B?YUVzRTlWY2l0TTNUNXFETndHeHRuQXlKSzZaaVRacjJmV0Ivb3l4dTNqSzV5?=
 =?utf-8?B?Ym5zWUZWYVdHdjdTa2V1cGNJVGZFM0tNOEVDQVRidWlJcDRQajZ0Z1c1UHFB?=
 =?utf-8?B?Q3RTN01nWEZKZmNoWlhGb0pMWTZJQlNhU2ZtcGZPNTdSTlkxZmJqbnBYeHZh?=
 =?utf-8?B?Y2tqMC9tQkFDYWxVOGFUVW5HUG1hMlZpaktnV0h5UzFzYzRNaGIzQzdwOHBu?=
 =?utf-8?B?OE1rSURhRVk2bC8zVmROOVZ5NlZaWVZUQ25mOEhqN0EyczVRdjZkVXhIS1pw?=
 =?utf-8?B?YjRES1k3cnVsMllwVHRlUC9VNEdGS2M3b2QzMjhFbUdpQ2dJVlJCSlQ3WXRJ?=
 =?utf-8?B?c2xVU3JsdXQyaEV0S0RHNTJ4UlpiR1piWEJOYy9Id2lvbHc1RVNzUFNSa2hY?=
 =?utf-8?B?RGx4NGI0ZWVHRkl4bzdIejdQK3JMbWxsRC9TNkxTWEM4OVlDTE5SbDhrSy9m?=
 =?utf-8?B?b1MzWWJyMUxtNzkxOXl6MkFZaDQrS09xT0I2bDJzNTE5MlRkcGdxVGJCeWRK?=
 =?utf-8?B?NHBrSUNvN28vcldSLzZUclgzQUMwWWZOV2MwTVpJOHY5U3gyemxubFNIMkhn?=
 =?utf-8?B?MERMbzFCbTZnNW1XRzczRjRSS1dmVGZCVUgxZTdndkpuQWZHOWlxcTd5ZDlh?=
 =?utf-8?B?MXN3TnJ1OXlvUW1xL2JSTEV1V21HdDdKTkpTbWk3bFhscVNpclJPMkkyYlZn?=
 =?utf-8?B?VFRETmwxeFBad3ZIY0FVcmIraGxMNFN1SFpGWVRuOTJCMnkyczN3b3hmSU5W?=
 =?utf-8?B?NlphVEpyeURhT25PQjJteDFNMldWc3pZUUljN25xekpleVA5eXlVbVp6S09D?=
 =?utf-8?B?bHpOclB1M2ZNUGpsZW1uUG52QzJlSWtGZlpKaDRRZEVvM0lURXBqMzd3c0Fl?=
 =?utf-8?B?Q3pHZkZMNXFpRDEwRW9QeWN6RnlnODFIa2lVRU1rckJya2dYRlVRSGQzL213?=
 =?utf-8?B?d3hzZ1VKM2FMdXBzcGdLSk1Mb2tGL2tvYlpsZGdMTHNUR2RTeldHQnFnQzZJ?=
 =?utf-8?B?ZFdEOXBQekJGTkN0ajBuMWpDSi9DVTZkVWZRM21zdXhUaHpYNXdtMFNyS0xk?=
 =?utf-8?B?WW5DenpBc3RnZTN0VHFwU3hRK0FNTHNCZVVja05YRWRRNGFMV05Tck5BZStm?=
 =?utf-8?B?NGcwZUV6bW9SVkJJNmcvT2laRGVOdGRKZzQ4djg1VXBhZzNtRE1nTDBadjdm?=
 =?utf-8?Q?PYoweQctqqXg1CFq7i/kO/A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4766f35-6c31-451f-3a1e-08d9fcfd6297
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:05:46.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOngXPT+0olejHMQW+UB/y9caSKV33OF4nOYTLQWBIPgee1jdbu4/rQLAC0TYVGVo3dhzQN7f6i8W1LaBJvOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3311

From: Zhen Lei <thunder.leizhen@huawei.com>

Fix some spelling mistakes in comments:
sentinal ==> sentinel
compresed ==> compressed
immediatelly ==> immediately
dervied ==> derived
splitted ==> split
nore ==> not
independed ==> independent
asumed ==> assumed

Link: https://lkml.kernel.org/r/20210604085656.12257-1-thunder.leizhen@huawei.com
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
[Linux commit: 05911c5d964956442d17fe21db239de5a1dace4a]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3: Retain all Linux side S-o-b, as per 5e326b61693c.

--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -73,7 +73,7 @@
 
 /* This is what we know about each Huffman coding group */
 struct group_data {
-	/* We have an extra slot at the end of limit[] for a sentinal value. */
+	/* We have an extra slot at the end of limit[] for a sentinel value. */
 	int limit[MAX_HUFCODE_BITS+1];
 	int base[MAX_HUFCODE_BITS];
 	int permute[MAX_SYMBOLS];
@@ -326,7 +326,7 @@ static int __init get_next_block(struct
 			pp <<= 1;
 			base[i+1] = pp-(t += temp[i]);
 		}
-		limit[maxLen+1] = INT_MAX; /* Sentinal value for
+		limit[maxLen+1] = INT_MAX; /* Sentinel value for
 					    * reading next sym. */
 		limit[maxLen] = pp+temp[maxLen]-1;
 		base[minLen] = 0;
--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -23,7 +23,7 @@
  * uncompressible. Thus, we must look for worst-case expansion when the
  * compressor is encoding uncompressible data.
  *
- * The structure of the .xz file in case of a compresed kernel is as follows.
+ * The structure of the .xz file in case of a compressed kernel is as follows.
  * Sizes (as bytes) of the fields are in parenthesis.
  *
  *    Stream Header (12)
--- a/xen/common/unzstd.c
+++ b/xen/common/unzstd.c
@@ -16,7 +16,7 @@
  * uncompressible. Thus, we must look for worst-case expansion when the
  * compressor is encoding uncompressible data.
  *
- * The structure of the .zst file in case of a compresed kernel is as follows.
+ * The structure of the .zst file in case of a compressed kernel is as follows.
  * Maximum sizes (as bytes) of the fields are in parenthesis.
  *
  *    Frame Header: (18)
--- a/xen/common/xz/dec_bcj.c
+++ b/xen/common/xz/dec_bcj.c
@@ -422,7 +422,7 @@ XZ_EXTERN enum xz_ret __init xz_dec_bcj_
 
 	/*
 	 * Flush pending already filtered data to the output buffer. Return
-	 * immediatelly if we couldn't flush everything, or if the next
+	 * immediately if we couldn't flush everything, or if the next
 	 * filter in the chain had already returned XZ_STREAM_END.
 	 */
 	if (s->temp.filtered > 0) {
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -147,8 +147,8 @@ struct lzma_dec {
 
 	/*
 	 * LZMA properties or related bit masks (number of literal
-	 * context bits, a mask dervied from the number of literal
-	 * position bits, and a mask dervied from the number
+	 * context bits, a mask derived from the number of literal
+	 * position bits, and a mask derived from the number
 	 * position bits)
 	 */
 	uint32_t lc;
@@ -484,7 +484,7 @@ static always_inline void rc_normalize(s
 }
 
 /*
- * Decode one bit. In some versions, this function has been splitted in three
+ * Decode one bit. In some versions, this function has been split in three
  * functions so that the compiler is supposed to be able to more easily avoid
  * an extra branch. In this particular version of the LZMA decoder, this
  * doesn't seem to be a good idea (tested with GCC 3.3.6, 3.4.6, and 4.3.3
@@ -761,7 +761,7 @@ static bool_t __init lzma_main(struct xz
 }
 
 /*
- * Reset the LZMA decoder and range decoder state. Dictionary is nore reset
+ * Reset the LZMA decoder and range decoder state. Dictionary is not reset
  * here, because LZMA state may be reset without resetting the dictionary.
  */
 static void __init lzma_reset(struct xz_dec_lzma2 *s)
--- a/xen/common/zstd/huf.h
+++ b/xen/common/zstd/huf.h
@@ -131,7 +131,7 @@ typedef enum {
 	HUF_repeat_none,  /**< Cannot use the previous table */
 	HUF_repeat_check, /**< Can use the previous table but it must be checked. Note : The previous table must have been constructed by HUF_compress{1,
 			     4}X_repeat */
-	HUF_repeat_valid  /**< Can use the previous table and it is asumed to be valid */
+	HUF_repeat_valid  /**< Can use the previous table and it is assumed to be valid */
 } HUF_repeat;
 /** HUF_compress4X_repeat() :
 *   Same as HUF_compress4X_wksp(), but considers using hufTable if *repeat != HUF_repeat_none.



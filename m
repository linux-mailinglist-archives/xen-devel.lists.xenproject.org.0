Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D51469712
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238931.414106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE5n-0004ra-Ci; Mon, 06 Dec 2021 13:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238931.414106; Mon, 06 Dec 2021 13:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE5n-0004pQ-9T; Mon, 06 Dec 2021 13:31:43 +0000
Received: by outflank-mailman (input) for mailman id 238931;
 Mon, 06 Dec 2021 13:31:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE5m-0001ky-5h
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:31:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8a94c20-5698-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:31:41 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-Ol2FtoHwM_-8VHNEUxWd3Q-1; Mon, 06 Dec 2021 14:31:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 13:31:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:31:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 13:31:37 +0000
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
X-Inumbo-ID: d8a94c20-5698-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAJSbOAWfHuLFcVKCx4FIX88ogDJjxq7Nkbi5ApfgJ8=;
	b=PeezM512LJkJP7h4cNygVKkhFonY3Je6x2WEN8aSQmEhnsiehzEMG2QhgXNiza/BppeEeP
	T6BddUHvwFLDY6zLCSEu9k5nIsyVpSZQkYJXTd1SOHF0ATVWkoiewBiLh9c2HAkcpzOJvo
	gzpO9fkohvOF5G6yjLhsuX2MwckvJZQ=
X-MC-Unique: Ol2FtoHwM_-8VHNEUxWd3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BL6Nwfj6zQQmSEWMR90RZA2I9/ZNwgV2ZtLp2sg7d7iIo2pWMI1YkqnF7A+QxEuQNyiug+lch/3g2asgtYfOk78rfKfH/r4WrxTctObC9XazF18mM0r4OXkk/cIwodmAYtmzOAU3xFiA++236H3CpT4LZBfIKKlbt7q8jOihOWVEEfGs3VVvcH0X/shdsurKMGSut+AaxK48TTzdy5PhPOZiZDN9nTuCZfDBR0Vf/H3XkVM4cs8fD9oGZ2dvZ7Xnnr+dV0pmqjZEeN99k8sDtcVPo5xFqevrphvebPdYI0zxusewKt5uk0TV4rVO64uoNAqbsP9tpEiDvyjSETkwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAJSbOAWfHuLFcVKCx4FIX88ogDJjxq7Nkbi5ApfgJ8=;
 b=lKgTmMKOh1UBILzYgPFB7BxMNeN/fy7Thz/68TXRqWxjcNqQKTG5gbxoJhJt+XDdNmlmYWlopnoeB6irqJVsrXcyTfc8ZzKEiqCo3ui1+0JsbKdUbakT+iNjdA6hkduM7KOUfq+trephArWcNMuw4G5dnv01wtxTV+r2z2KsTMtEgKunoeN+3s8MrgrjZPlwNMRxBOY/12urV3Gc69TBx+Y/S1yaJQicvXhJ1VpQ9VkmGyrApn/fbkAv4ZUiJ+BA59Is3jj2yBbYOXBv3hEeQtiEXpJKYv29FRwao8mZ1NDpYLMxE4V3VHasNH2M6YvP8voImGzPah3/PiQzkOD/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <994c93b1-1a3c-bb66-255a-ec9c1837d6ce@suse.com>
Date: Mon, 6 Dec 2021 14:31:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 3/7] decompressors: fix spelling mistakes
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
X-ClientProxiedBy: AM6P194CA0005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bea26491-c1e8-4b98-b1fa-08d9b8bcbaec
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829713D2A741D2047DE5A5FB36D9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bio5tA6h9DtxB+5cGgl5ATxPvKqniFH3dn+K1RLAqY1TW7prPZNP0VT6knJfYYJfzFE8yAW91M3AFVWOsHhvdWCGzZ0E4QFwqzayZZApX/tFXh6MuCJekCVrqV90ayvw5zWoeJWzAuN3CPbI33ZsWvJl/2KuG7arxy/0KRLDN/tcrkbNCyIgNCZnryxpOGBKYaDwwlKFCSksHiY9UD49yw+zvYBuwccDetcJYuU+KblIAr6NXpLKkk1rOX1uHyvVouczS0twMbpOq3eLjtyKlOTuTTYgsvfkOEZ+BLZ533ismR6hTND4OpDyEK9S0ia/ivAnIUXsVkCbjcof1XmslYL6I9DL1/rvhsYPNJvB2hjBDwLehzOqMF3rtTtnD3qNC9RaN5YoV2fiMiWUnk/aJiVeECFvUeElCN0sPP3YP3irM3bVdXt6rd2xTgexSp/n7VB1hto+ZUSxG/3uXBzi23Ps+pfUWsCxVinionpZ6o8FBuYMWi9U46/KesaAxNskIDedHIMHSHGvY5yQzIBvICNXoX+FESCNQv4XOZ6Kw6VE1ck78otn3CtOdTuk1vn5K3VtW3xKt9rJhG3RZPmoEbIAVftZNnKHx1twAgf98qSfmazMDtW0GzcFxwk5P6Wnt6Hwmhaaw64cVZU6mPfBKc7EVJOZVT4UzoFedv8QzjguiF30cTM+ic6AmWwpOMDzc3OURf0G3IwLCMBZFIbgxcJfmhdHc6Qh6tPRUjsgbmYGLEv4LXvueFslOVMZG+iDnNFvZ5cDKswvKIjZNwitLeamBEuNOyczA3BSB8rgbOW23NmGuESeY+YkFMsEDz0m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(956004)(2616005)(8936002)(186003)(31686004)(8676002)(36756003)(6486002)(66476007)(316002)(6916009)(5660300002)(86362001)(31696002)(83380400001)(2906002)(26005)(4326008)(966005)(54906003)(66946007)(16576012)(508600001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDA4Z1lYTEJOSUxoNVVDZ21SNXJ0NEY5aEZSNGQ3RXZpWUZlVFNWaXZYR2pF?=
 =?utf-8?B?dkVScmtibEJqVTE5R1hxZEwwZDlBTUF6dnZ0Um4vSm1ydkxoSXdlcy9PazR5?=
 =?utf-8?B?TGhUdU5pcUxsS2puSUt6WnU4Nll0WWJsak0rbjh0WjliamJScFRXZzloM0dz?=
 =?utf-8?B?ME5QN3Nmd2pja3grVndhVUJvR3NnQTdxUFlpR3dDVWNDWnlIUTk0VE0vdjFJ?=
 =?utf-8?B?aHNZY2xmL09wemp4a2srSXNocVBKSTJDQ0ZVb2VmKzg3b05ORUhBM2lrVnIw?=
 =?utf-8?B?L2pvZmRvK0czWWE5Uy9QdERXdEtSVE5IQkVhNDVPSSthTVVMbWVpREFGbXlI?=
 =?utf-8?B?MlhqMGlELzZzeGpEcEt4TElSVVhWSWZrUVVQc2VYU0Y2U0U1dXlqVUQzaXhX?=
 =?utf-8?B?eGRCOUI4a1owL2svL1ZKWXdDSWhZL0pBNk1zVHBrbXhkSHpSODBBVG1oUHJy?=
 =?utf-8?B?WVhtajJOU0twazltZnhxTXhFWUx2TFFNbEUwb21BdGF5bnpWNnZYZXNGZzYr?=
 =?utf-8?B?TFlvVHBsaDJhQ2lRYm5iOFRjaDloS2lISVNyMXNEbEF1bXJ4WTVieUowd2Fx?=
 =?utf-8?B?R0RPMlhTblZoTWdsRis4U0NUTXRPNGZud3dYNzZCU1VGMXljbWhnQ2ZJRjlp?=
 =?utf-8?B?NzY0bjMwcmtsYjVpQTAwOUhRdWY2bUowaVZjSlM5dkVDcmlFRDV0dXdybTdr?=
 =?utf-8?B?cHRpNG5xUHUydFl2TVJCbG81cW11L3U2Q1Q2UmhpNjY1UXZKR1RLZlRmNU9K?=
 =?utf-8?B?dmgwWVAya1NaUE51bHRSTzYzNkhYWU5vT3JnY2NabytwZkRvWGxaVERRc3lV?=
 =?utf-8?B?ekRJU2NoT1h3bHJNSWFKKzdOY2FZMnBHWWVXcnVGVzZZcHRhOE5RcVRIOHBp?=
 =?utf-8?B?VGFPYW9rN2RXaGp1Uzc0dGJVc1V6dlZ5dEllNHFPb2RmMEJWeHJNL3Ruck1H?=
 =?utf-8?B?MVNiM2dIY0xQTTlEL2tMZW5Ubmpxb01GL28yUVUxWEV0c2w0MFFVSThlbUs2?=
 =?utf-8?B?dHBKNHc3OCtPQmR0WE81SVBRckVQWDZYOWVuWEIwUmNYcmVtamgyT1RvdThh?=
 =?utf-8?B?b0xieUxFdmFPaHVMZE9DemJEcjJlZy9tWE5PRGJ2UE5TLzExRzNhTmZTb1NK?=
 =?utf-8?B?VzBRWEhyTWFScUs0bTRQa2M5bDBRT0RrWEVpdFJhVndScHNIdXRseDBRWnl1?=
 =?utf-8?B?OFFscmFqSm9Pc1U5L0xpM0JQQ1RXUTNvY3JwUGlqcFVaNGp2SUYycUJrcW42?=
 =?utf-8?B?WUovYUhsR2tVb0p5bllhbWxvSUg2cCtTc0d6NW9KY2xVK0t2TlVYdHluYmhT?=
 =?utf-8?B?Q1lpNXl2bHpBSnVFZTNOV2laVnEwWVVUN0tCNmhZQXRQR0lqTlpHSit3YnlB?=
 =?utf-8?B?dGxSa2pHTnZsMWt6TWs0Ylc5RTM0M1MrUENaWUdncXhsWGJhYkZTRWFyTlB5?=
 =?utf-8?B?ZzZWL1NqdGJaK2pIODlsYW9tZ25GRHRkTVZCdllzM0NIRTcwbUZkRnUxR2F0?=
 =?utf-8?B?ZDJtL2h1MStPaVZQaEFYajF6MGthZVBrT3VtdXFkTnJ4NmZGOTVnUkZRRDVX?=
 =?utf-8?B?aW9ZM1JJRkRsVFNzTEVDbnRMeWZYR0hWUjVJcmFtQkVmbnBRZzRGc2pRc0FO?=
 =?utf-8?B?eGVEbDJVUWppcHI4d1NBaHZwbGpnMm93bEUyR2podTNnL25WRXFMOW9qMEdo?=
 =?utf-8?B?NHVYaGlCKzAvS2U5Q0FRVnF6U2VKclFuWTNGenlMZ0pydnoyeXlObVhyMlZV?=
 =?utf-8?B?TSt6bEhOOTJEanhLY3krR2lDd0twZy9XR3VoRWpjemwzWWx1OUtqdVh4U2Mv?=
 =?utf-8?B?VTJ3eXlpdUdOajlFVGJNdHBFMDVIS0Urek1RaHBwWGRhb3JQNSs3U3h6QXlL?=
 =?utf-8?B?N1MwcHR2bEFXZEZPZGRuWHl1KzBkSS9EclRsUFZ2eFdEOHpyTE9BKy9YbkdW?=
 =?utf-8?B?aUh5eUJYcFdlbVhlazZTbmM0TGovV0NNNjEva0M2cjc1eXJTWG1pUWxLYWVU?=
 =?utf-8?B?MEI0NDdIZnBmYmswcTZqQThwV1dDT2llMVFVempvbEdrVDVuMTVzcTlNblg4?=
 =?utf-8?B?dElic0x2NFlhUTRhQ1N3VUErUFBwbmwvZ0l3RVN6ckc2RUZtbUYrTEVlbUp5?=
 =?utf-8?B?bmxtRWRNRCt3dlc4OUFxbkVxRDF0OFpxUXlKcjRHaGlYZzUxdUlKN3NHVGRq?=
 =?utf-8?Q?ojLFLOaONV/uAJKe9Y8fTOI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea26491-c1e8-4b98-b1fa-08d9b8bcbaec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:31:38.0341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOkXFw06gutDTV2AdGsUn8oQJ+riNUMmGV5c/1NJSQaEe5lZ6BNkwoFVJXM8AjdKweK4vVK1JA+aublu+UUiNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

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
[Linux commit: 05911c5d964956442d17fe21db239de5a1dace4a]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5879456D25
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227726.393984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo11s-00035Y-P5; Fri, 19 Nov 2021 10:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227726.393984; Fri, 19 Nov 2021 10:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo11s-00033m-L3; Fri, 19 Nov 2021 10:22:00 +0000
Received: by outflank-mailman (input) for mailman id 227726;
 Fri, 19 Nov 2021 10:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo11q-0002Lq-Q9
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:21:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86a1f2e4-4922-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 11:21:58 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-ZVJ6HCxxMOOcOERfDptcKw-1; Fri, 19 Nov 2021 11:21:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:21:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 10:21:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Fri, 19 Nov 2021 10:21:55 +0000
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
X-Inumbo-ID: 86a1f2e4-4922-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637317317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qo4aw9jO+x/yjshebq2fIVWJsdP1zKWvaVAQTszqXLM=;
	b=RYqw2J0yOtH3His1mRNLG9dG7K/4vIT71hJH5TLWQOaYgQXvR/sTgIXdEUZ7aL/l+ARMmg
	NsRgIytXcaXv2fTVZzZAY1l2wht6gPfkCAI2MOrJjEZUdAAdbT9Rn78KbBfgRbtIgtlXQd
	7y18YCxo8Ttqc0XQfMxlSY5GXKKAEzU=
X-MC-Unique: ZVJ6HCxxMOOcOERfDptcKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/TWJ94NsJ4TYyaR7dEgP0JAbgm6tGbhLaE6HrDAIjJ8cXAa9VhTVTjQa0EOo5r/1sgdOUC3y/Be6LjUIocWYSdGc+KCpQWMHjp58s8/FY0fpIlJzqIPoTYx6trnLmj5KIRFRDnHJSbxEHYzbuEvSC7A0I0YYuydleq/ist51M1NYdoUxDySbP7/Xold+rf2W3x/Xnnii7YpNzncC8j2x2mfXgedPsHeIqndOsUNQLNSNGQECvgGJ50SvzdPbhKVWmbrNdV4g9leKZFw3Amihh1Ln9ghpX6LqpHZhKyaXSj0GZUgmbe8U6AsXUX8ADv3DfmgBqbUCNeNSWyU58i7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo4aw9jO+x/yjshebq2fIVWJsdP1zKWvaVAQTszqXLM=;
 b=B+ehqTDJVyejfUQ4kdAuqaupy8w1o/E/v4gYqlb1IoN2rGLiNbky6s4pZFCvSwxFs9wIwyEAOLIgftsKwtvrUq6OY1LBVBaYzJfGtHu5CLvZ6zkci44e9/j++8yw1EDShtHqoFaqRKcazdpUy4cMCwBP7VtFcA28NqKLbQ5voqF4UlNEiYaCqlnbYyRwNHjAIlkjq8lfc4+Pc/jTtP9TBLf8D/oZaDC6K9OGKCSZVPiOJNJK8xebGs7lizlsWcZDdALDveTv3wz+Dxezc8SiYFNizW6+FSmEnC6IEUccTGwan7Wqdj8wIzsOzTXHRTnrbVguVV+iKnRUv7JWUSfd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c70932d2-f3c3-2b6d-c2db-69a0c3ab2b2c@suse.com>
Date: Fri, 19 Nov 2021 11:21:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 3/7] decompressors: fix spelling mistakes
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
In-Reply-To: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d1c5f9e-809c-4df3-2c28-08d9ab466975
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2704ED968B0C83517EAD5289B39C9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ovbjpF5fkrJ5cw1kCDFH4WWahZktHL00tWGoUMXK7xRFfMPxSu/aZ6S+qZT71EZ6dxA9yKrHCuxe4t1yHFuxIhdnFxT3C+XRUIicie3oLuFGQSCPNMK6hKx/XPUMQ3xUe/nYiUGaPk1R4lZ33qCEDRp1Z67VuZQEDfkngXr5cGbPLKqNcezWwP3dI2JPp1THA8NAXfUMwUSh90paMT5UYhBGuRMIZE63Jywa4Vu7PrPpqz/ZE1kflSfXgvxBiAtb4S3nlPRydux3FXgbRN7XTJM5pQGgWTTrPSanrmhJIWduUrQaZj9QdJstvlBic0SAIui3QSG0tXGLEGtcHpscFFYGgL4U27jNcYdauz2zC3jjgyQ80fvSpgYQimmOnbt+uyFtJljhOgITFvzXoB3tWKzEx4Szr8zTfsgzLeT2zKsU2Vjfm/0mgjqa5xIcs5ECUgxNGwTTA23u9IkXlednTHssFwjcLIyNkHCiSbup/WIfRkfd73O/nY9oC9A5g9/tyipXW23zOU9eF19T2XkZKpNEJbIK89lznjH6UgxC0qaLnPp5P8KXxuzkbtESQ239B09q7krN8Askzt9saNpsjWBOU/mGBvHDBBfHoAfm3M5NAhpKe6cW9+oyseYDKrG/gtP80xl1vbVL1uiMGxG3mUaZh8jpYy0bx+sN/qIRIqXWZsE22K+mthw39YwrzAohTOIU9EUPI/vi9s7CYGnYZw2IPWd6HG2HOwAEVDzbPNBKNJtU3B0O30VIwebFLrYofaq+vFio3O82D0/GKSp0VcFPIYCIzaZiZ1FIpJvz/+IwPq1CnwbLXMgvB6E0pfE3APafg0P2AcTjusuWbsDCcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(38100700002)(36756003)(508600001)(2906002)(31686004)(8676002)(83380400001)(66476007)(66556008)(86362001)(956004)(2616005)(5660300002)(26005)(8936002)(6486002)(186003)(316002)(966005)(66946007)(54906003)(6916009)(16576012)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE1pKzlwbVVIeDRQd2hBbWlqYjA3RkZvcnRFMUFnSFdWU3BESFNleXJlR0lX?=
 =?utf-8?B?L0VyR1N6Y2hISUhpbitNVGlVWDFINThlbkR1UmJKMnZXeWFPNEord1ZxYktq?=
 =?utf-8?B?eG55Tk1UREduSVpDYVRxTzFVOGRYelhmeVVJUEtES1M3WFY4UW1BSThwVjg1?=
 =?utf-8?B?cSszV1FwNmZDYVFqbUVYdklBV01ybU9oNUFBdkRoVHY3QS9MUjhldTl5V3dG?=
 =?utf-8?B?RTVQNElJZnF4cWlaOXpPQkRhaVBWTmZleW5WREllTlNMRXZjNHpBMURoSkhY?=
 =?utf-8?B?ZWtHQmNTeVhnSlpvMzBlMGkzMStjZWFVS0R3L0s5UDhHSTR2bFhUQThwRDJ0?=
 =?utf-8?B?emNkN1BiSmN0L2t1UzdyZVFhNGpqR3BOb0lBNHppWVhnTWNIdXRjelpRdjBi?=
 =?utf-8?B?bWZuaTllN0J5dWNvR2ZGZWZ6OTlaVjRQTVhQUDFxbG5tMWVyVmdYdzdxZEVV?=
 =?utf-8?B?ZENXQ0FpQnp2VXNrb3VMcmlkQVdFY25RVStXV0w2Q2RJSGgyQlBRRTgzNDdO?=
 =?utf-8?B?L0x2YWpmR051bjFBSGRXbkl2SVFQUW5QbnJRelh0d1JaSkd2cDg1TmlkN3lF?=
 =?utf-8?B?RVNybkR4ZFBRV20xWjV3UDVXNjVackdIeCtBM0FwY29ydjUyd1laa2U1OFlU?=
 =?utf-8?B?T21uTys1T05pUVhmNzFMTDRCWjhoNXdOUm93Qm9ydW5LcVd4L1pMbWgvV2w1?=
 =?utf-8?B?dVJhbGhNYWJwU1h3aHBpYkFiZGp6blZWMElxQ2lUQVZsWFNFcWUvbVF5b3Nl?=
 =?utf-8?B?NENRNkoyOUV1UmprUVZINEVRQlV2N1JSR1F4ZzhtRWJrZk50T3g3Qjd3UlJ2?=
 =?utf-8?B?K2ZwcWJyV0gwRlhoYytKdUFlTUVtekU3dWpqSGpYQW9Ld0tKWjhDdWpId3Vu?=
 =?utf-8?B?cGVGSXpDY0t3cDIyTmJFWC9XeFZDOEgyaTdoQVY0bEJocHY4UXJ1MlNkRkhj?=
 =?utf-8?B?U01jdFlsd3htZjBsd2hmeitVbW5PS1MwRWZEcGJOSE91TTZyVmlQZ0pKdjhK?=
 =?utf-8?B?Sm9wak5KZ1dQRXM3MUc3TUMxOUNMQUdPSXNmU2JRUjFKR1VKTWNBZGFiblZD?=
 =?utf-8?B?aFdxNGQvVitzelA0NmFUbUhKaFUxQzFiaGI1L0RSalF1OTJWazBCZzF4cVdY?=
 =?utf-8?B?bDJpaE9zTXpaa1VZYXF2S2hpa2RoMWhRUkUyOElGWkp6bGZSKyt1VldSRWhj?=
 =?utf-8?B?a0pGY3d4bDdpTXE0TThoWm0yNHVBM1ZCWDh1NTdkc0hBOGZkNTYvV05VMWhq?=
 =?utf-8?B?OXVsZ1c2enYxVkwvNDdRWVFUbEdja2NGWTBqYzRRNjZ6aUtLN0dlNUZRU3lH?=
 =?utf-8?B?SlY0SzNmKzBnRG9QVWwxSmYwRVFEcUs5bkJsOEhwK1M4ODZMajB3ajdZcy9C?=
 =?utf-8?B?MDVac3NLSmFySDJtMUcyd2pMdkpSVVh3aDBXVXU1cmZHd1pVaWRZWmhzMVk4?=
 =?utf-8?B?Zy8yQXBxV3JRTElxMVZkWXBGOGFtbnBpWm16azl0dFpkcG5kSjd5bnhpbWE4?=
 =?utf-8?B?QndRNDVvQUs2M2l4bjNmMVV4MTFkRDFPSmRuRThGeEkrZjhUbE5PblBHbUk3?=
 =?utf-8?B?YUt1bm8zSVJOSHgxZEN3YUZqRVZBdDBmYTV5NzdQTzBIeDZpRk5taFBHV2Qy?=
 =?utf-8?B?WVNZQk92WEhtMmdQSHJITVBtVXpWNU1uMk10bmRsUXNReG4wN3RXdHlPNTE5?=
 =?utf-8?B?ZVpmbTRnL2hyalcxUGhFOG5NNm1MQ1diRnBwcjNOcGhIUS9nemkxemJvcFA5?=
 =?utf-8?B?VzNuaWprQjU1QjVSaXpkQVFZSzJDVGVxdlp0RXpub0JRRmtsZ2lNOVhWTzdq?=
 =?utf-8?B?YWpkaFRSVXU2NS9TZGtRa0VROFVYbVJkeGQ4MXVJbjlZL3pJekNmaFgrdHQ2?=
 =?utf-8?B?VjhVeithOXQzVTlSRlFJM3E1ZkdHb2IrK1V6UTBMQkFlWXdHVUtFN1pqTys0?=
 =?utf-8?B?UG1PY24ydVhNNFRmNEhPcEJ3WDhKWXVseDJ4QVRkTm4wQ005cVVUaXlxbko1?=
 =?utf-8?B?OWIybG1Cem5IZ2xiYzMxc1czU1VNUXhaam9ySHYydFpncDBSN0xjYXh6bW1U?=
 =?utf-8?B?MjJkN0tSbE0weEFPc01pTHFTRGlrcGdjc2cyUHNYMGhXbDdDSmNZeUhBb1FB?=
 =?utf-8?B?M1RhVGMzall6Nllkc2xzRmRJYmd6dkhEamZPZ1ZldFVWRGIzUmJVRmJWakls?=
 =?utf-8?Q?ervi4eTuKu/MiGGh9OnV5S8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1c5f9e-809c-4df3-2c28-08d9ab466975
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:21:55.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5eL/MTSRGZg5mUvUl9UpQnX05S+kUQsrNGbvN1YoXmMuB4019jRC0awPRjooD4fBZx6jewnd6QYUErIfKH7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

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



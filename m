Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F513BBEBA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150339.277994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QJQ-0005mD-56; Mon, 05 Jul 2021 15:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150339.277994; Mon, 05 Jul 2021 15:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QJQ-0005jn-1X; Mon, 05 Jul 2021 15:15:08 +0000
Received: by outflank-mailman (input) for mailman id 150339;
 Mon, 05 Jul 2021 15:15:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QJO-0005ip-Mt
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:15:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5d38695-dda3-11eb-844b-12813bfff9fa;
 Mon, 05 Jul 2021 15:15:05 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-LTFVSklMNfaIzjJ13K8rMQ-1; Mon, 05 Jul 2021 17:15:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 15:15:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:15:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 15:15:01 +0000
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
X-Inumbo-ID: c5d38695-dda3-11eb-844b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ct2KS5gJ4GCYf4vquepAwBJLuaf7rCN9u1z/krvGGpw=;
	b=IrGNOYM2HlVgcAZqjFkjsb4JOMh1/Yx+aQqgr1SoDvDJXSy6TI7hT7v2eUfLpE5xm7OuwG
	NbBJY0KQwREkqL+aup7mMr/U2fsmmjVsP7uEV4VEIQJB0evgTbVFUsiPoiH/rW5GZe2Ink
	lK3WJ/lgorMIzMaMd8pc7xmiuIzxufw=
X-MC-Unique: LTFVSklMNfaIzjJ13K8rMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMA3jOCGabCp1tW4CXM3tJEMM11rQ2H45rzYqYJyaPrGlprXyTvjXQdT6y7mIoOUiKyjQSgZozdsZ+hNFh/xxygyA6WhuneQfiOEjw6tcAsDHsZkct04eUGw9PfAjWWLZg6iGBPPcWa6nFnxKTNJwEUOEwAz4r65edpMSpYfWCHd78/rWqFTPpfvsDf9YdkFECNKWLr538WTv+zHLW4zqPdnDtIVSXz2TA90P/roxP6wISc/Yc+S1tCvDAIlG+hEUTTy89/VK5KuS6D5jH5IABMSYhhd/LdSy/uu6Gv/L17NAodcrd3xU3vT/4l3XGBi7td5gxH/yIIx1uyGH5Id3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ct2KS5gJ4GCYf4vquepAwBJLuaf7rCN9u1z/krvGGpw=;
 b=TzASB6Z+VdVlXGfZKKfmSTintQWWNKzleJbkSqNGrZnHiEp+Cwh9uc7ezPZOrrsTUX5E1bZOMzsy8w0721v8Z+XfrViWlVeeg+VKdCvMa6QkMeezD9Y8ABv1ncdEnx8vR371nrYt8jjggMHv9coRRU4IhcYKBJ8iglN8+r+cDL8gZPmuo//xipIbjtrgtsgOC8sdP7UcJKY7YIPiyNbRTucbYnND1Hj08hC8cXYul8V9+O/qt/EF7LCHamQbRohXSSJ7D0B/RolxmoEN837w1KezxvUc4uzAp3fTYvIRxidIn3TjJfHWHXkFIzSdvREJVZ2V51EZoaT8EYj5V60w/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 07/13] libxenguest: guard against overflow from too large
 p2m when checkpointing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <952285d1-9fc3-ab03-f6e4-c7946805e4a4@suse.com>
Date: Mon, 5 Jul 2021 17:15:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6ef64af-feda-4532-f531-08d93fc7a8f2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26082ADF55D17004EA2DBF5BB31C9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rvSOtUUwj361yXyegFbJMyWlR6Bt5pzhNKdaLImcVw+/h41oo/45ObmTPhjt8hO7f1BbcOFQ0WwMMR1P/N7n0bYFM5NHvgsYaAT0zcRXUGRkqiQyqQFXwrms3eb5vXqkZmn7E2dpN1a/BnxrPrpnbHAmu1NwQe0sA3JzBCIO21ln0dQdXQNMh/KCVQi/0lQTxGHpXCXUbgYPDZ/QaJHoCpAZYI//WQk9STYvMifbHehDby98ESj8GzUNy0b4X7spj3+UdbCn8qzecnzAkNYIEz8tbmhwTsPackcIZkNPW1eEas4CDc1wIee5+H2Eu51nStJJb8ztQqTGjmbGzC927RHkAeNq6t0K1LSpZM28DgpF5kSetCt0poWFiKtwBhnw9oJOFg5hSKYca2Ut5Rj3CAuQuq2Jy6oG1mwy9lJlJ0WTc97OAM6kty8/lrC8mcYK+tD7H1cP55Q/DmnhcFhXVMsYjwvSSoGW6p0Gu0bAM8xpGIMQTFeER1iDw4iXaW1EkvGra/dNZSsWFjZf51kcz9HYiGDLOLpP3hC9FQJ4F0iVJuXkf7kMhz9dSuIiOM1H1Yni99l+lvGOh94Px2tNAOhjz5mV3KUXmCh5Pkbpshiao8hpDR1ev0X/JpgxvBhoLOr0WE3+5I3gfxGDudVIDOGrGUbWegxcFCKVyewgzHpjXe6kI0WwRkf80qEdkWbN6u/I85L6Y8Wz1dNGEJzcDvoapIFE/R96vsjQowmvZlk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(376002)(136003)(396003)(4326008)(54906003)(36756003)(8936002)(316002)(8676002)(6916009)(26005)(2906002)(186003)(66476007)(66556008)(16576012)(16526019)(66946007)(38100700002)(31686004)(83380400001)(478600001)(956004)(2616005)(31696002)(86362001)(6486002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmF5K0ZUYTRDc1MwSlVaaEJjTVczMGtjcXF4M1lwSUpQSHdDdkdRWmZkQmxo?=
 =?utf-8?B?K09qYXV6RUxtcW9DV1J6bGlsMFlLY2ZCRHJydDhVdklZNXNjejBsR2ljSVBR?=
 =?utf-8?B?RHdod2g3elMzY3F6aUdrYnJOalNCbnlRWnJaM05QblFaWEVwMmJJRjROL0Vi?=
 =?utf-8?B?blh2STFNK1NVNzlEaFFRbWpkcEg4d2VBMFdzeHZtR3V1bExraDAzNXRGbmF2?=
 =?utf-8?B?S1N1WkNpWGM2Rzdqcm8zaUUxNGVqZWV2cTIyQ21lRkowTXNoMlZHN2FHR1Zt?=
 =?utf-8?B?ZzhDaVZpSnpuVkErblV5ZDIyYXBCNmNWSWJwaGVsN2ZvSDFEY0tGTHdXb3VQ?=
 =?utf-8?B?RjhIMDBuclN4aUxXa0RWRXk0WVdsNStiS1FvNUd4aElLZ2sva3ZqMForNHNr?=
 =?utf-8?B?TkxJcVA0WGhLR3c1VUowOXd4Rk9yeDgvY0l6aXRGQzZnT04rdFQ5Mlo5dzZm?=
 =?utf-8?B?LzJ3SUljeS9HTFpOMnBxVlovSE9MTjArbC85Z256dWcxZjVCay94UmNpUDRx?=
 =?utf-8?B?akNDUno5eVhjYUlzTWJzbmhoVndsY0VUWjhwQ1A2WFdGV1Q1N1dLaTRYcVAx?=
 =?utf-8?B?MXZiK0VHMnpxS1p5Qm45WFR6Qk9vZlNLanE0Y0lEQ0h3RHhwTkxsY2lJejZn?=
 =?utf-8?B?aXNKbmNJMWFpWTJ1NEVSN3JlZTRiZDlEOFVJSmowc29YMkhVamNNb0hKa2ZT?=
 =?utf-8?B?dGFlZ0I0aytSYWJUNEJpNjZtMnFlL0ZBTlZnZ2dPRy9wdzdzWnBycXpTYm91?=
 =?utf-8?B?d1BvZktHK2V0cVB6bUcxWDRXTnU3RWZvVXpRTnNndkxWenlJVzZacStUTExy?=
 =?utf-8?B?eUNWRWttb242YnVLWVgzVXlVeXhiS1dqNjRuMCtuSVFoWVVsUytPRE1VNU1u?=
 =?utf-8?B?TW5HcDliT20xMitjeTE0K2J4ZXZLVDFOL2xJa2RCeWFTY3NNL0VJSWNTT09R?=
 =?utf-8?B?YWlEWWhISU5xUDV3c0xxbmV0T3dGY1BYQVVjdGJaUTVjY1NkODgwNDdkekN3?=
 =?utf-8?B?TUxMVStUS2NYOUNJRU1qN0Q3NnNCV01YSHpEWTNOSnVvOTNCS3dyWk9hdy9I?=
 =?utf-8?B?WTFiTnQ5Y2dEQWtudEtaSWtiZnpDd2xVZGdVc2tUQjcyT0pzd2t6MVVrY1lz?=
 =?utf-8?B?M2V1Qk12Q2ZBcEdRY2MxRi9aUDVyTGRWS3lEN3MvUmwwRnBTNVAzYlQ1KzZ6?=
 =?utf-8?B?QUIzeng3VGZScEt5UE5rZENjYi9UWE1WeUdZWHArMTdkYkxUMnEya2UyMGFZ?=
 =?utf-8?B?L3NybkFIZUdIczA4bWlydnhObUZQdzJBWlV3NDBZbjRyYm1qdnhzNjdrTEtC?=
 =?utf-8?B?UkxGWTNyL2VWSmluUFpXalQwaWpLVjdEdE9LUnh2ajRJdmpVc1lReW5CSmtD?=
 =?utf-8?B?UHUySFhBWXpqRXRuemhWSnZTOEc1c3N6Vk1nVkkzQWh5dVRDUGNSN2JkZHI0?=
 =?utf-8?B?T0ZPTVZvR29VNjVRRndvbTFQUXdzTEcxYlJoU1dWNTFzODByMTc4SnErQjFT?=
 =?utf-8?B?OWdmYkFoOTMrOXh3SlBJNFFQYUN2cDFKTXVlWkt4UEhpUjlIek1GMVBpWk8v?=
 =?utf-8?B?azhFMlJZOTJ4K3libE55Y2htYWI2L2JrbkU3ZkpCbzhKZXRaWEdweXlmc1dP?=
 =?utf-8?B?MGUwVjUrNjRkenF0d2I2YnNXWHJ1eTljeDVNRFJnMy9KUVowQVA3SnZaM1VD?=
 =?utf-8?B?Nmk5ZG14R0xnVkk1b3l0WEZsQk04OWRzVmFFMk1BTWtVRUNsbCttTmlBNm5E?=
 =?utf-8?Q?0bTVqlNvIwFG2tQktC4IfYutQIX3f5l4GKjDbk1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ef64af-feda-4532-f531-08d93fc7a8f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:15:01.6381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33CBZjKB0dqSo67eBVcDFqO19R4dG4zKlrspIGSbmbW0IrjIEvD2WuNn0IIjYlv20paZwQwVFplIvF1QkzQ4OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

struct xc_sr_record's length field has just 32 bits. Fill it early and
check that the calculated value hasn't overflowed. Additionally check
for counter overflow early - there's no point even trying to allocate
any memory in such an event.

While there also limit an induction variable's type to unsigned long:
There's no gain from it being uint64_t.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course looping over test_bit() is pretty inefficient, but given that
I have no idea how to test this code I wanted to restrict changes to
what can sensibly be seen as no worse than before from just looking at
the changes.

--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -450,7 +450,8 @@ static int send_checkpoint_dirty_pfn_lis
     xc_interface *xch = ctx->xch;
     int rc = -1;
     unsigned int count, written;
-    uint64_t i, *pfns = NULL;
+    unsigned long i;
+    uint64_t *pfns = NULL;
     struct iovec *iov = NULL;
     struct xc_sr_record rec = {
         .type = REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST,
@@ -469,16 +470,28 @@ static int send_checkpoint_dirty_pfn_lis
 
     for ( i = 0, count = 0; i < ctx->restore.p2m_size; i++ )
     {
-        if ( test_bit(i, dirty_bitmap) )
-            count++;
+        if ( test_bit(i, dirty_bitmap) && !++count )
+            break;
     }
 
+    if ( i < ctx->restore.p2m_size )
+    {
+        ERROR("Too many dirty pfns");
+        goto err;
+    }
+
+    rec.length = count * sizeof(*pfns);
+    if ( rec.length / sizeof(*pfns) != count )
+    {
+        ERROR("Too many (%u) dirty pfns", count);
+        goto err;
+    }
 
-    pfns = malloc(count * sizeof(*pfns));
+    pfns = malloc(rec.length);
     if ( !pfns )
     {
-        ERROR("Unable to allocate %zu bytes of memory for dirty pfn list",
-              count * sizeof(*pfns));
+        ERROR("Unable to allocate %u bytes of memory for dirty pfn list",
+              rec.length);
         goto err;
     }
 
@@ -504,8 +517,6 @@ static int send_checkpoint_dirty_pfn_lis
         goto err;
     }
 
-    rec.length = count * sizeof(*pfns);
-
     iov[0].iov_base = &rec.type;
     iov[0].iov_len = sizeof(rec.type);
 
@@ -513,7 +524,7 @@ static int send_checkpoint_dirty_pfn_lis
     iov[1].iov_len = sizeof(rec.length);
 
     iov[2].iov_base = pfns;
-    iov[2].iov_len = count * sizeof(*pfns);
+    iov[2].iov_len = rec.length;
 
     if ( writev_exact(ctx->restore.send_back_fd, iov, 3) )
     {



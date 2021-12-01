Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB1464C44
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235878.409143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNMg-00055Q-OM; Wed, 01 Dec 2021 11:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235878.409143; Wed, 01 Dec 2021 11:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNMg-00052H-LG; Wed, 01 Dec 2021 11:01:30 +0000
Received: by outflank-mailman (input) for mailman id 235878;
 Wed, 01 Dec 2021 11:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNMf-000520-FP
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:01:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087a4eff-5296-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 12:01:28 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-jjKr47zZMxaB6a3ZKhyu7w-1; Wed, 01 Dec 2021 12:01:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:01:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:01:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0161.eurprd06.prod.outlook.com (2603:10a6:20b:45c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 11:01:25 +0000
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
X-Inumbo-ID: 087a4eff-5296-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638356488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3SD4EFe90Lggs8cQz5yURwjH248lNbQoaGblSbtee8k=;
	b=b/xpd3n0DIpsq7kdTe9xgrVlb5sDA8DKIbdrN/BD4g2J4tXf9He/HyHqsKbu91EmU+ZnqO
	hYNhPBy40P2OoLALsNL1PeW0k+CGUW5kLepSDM/DEU1u/8u6ScqPFN0O9MWAP5sPICSbZ9
	Lta2f85g68rCmKXv59uv+Yme+sjURFw=
X-MC-Unique: jjKr47zZMxaB6a3ZKhyu7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efPgwyBHy4QT1c/YMgeoASqJwVCwm2KWUILRJIma8NK2H4k+BoJWD5sKr1U5Y7sXvc7AQkKy0gjLL97C+Y6/bJWdEJpBzapg8ABNLRZQHdsRAGJew0YYBUyoeBVO4aGM3bZIZISkgN91IsbGKROy7B3MKyzlzpaK9bF6DjSLZBNb4YP2w3oGMSo3/XXn6apzMbnMOwWb5bJ4xxrLVPPK7BkgZYPm/pGqXltSOlc5JCqCTNXI4QLlzZ3n2BtCE/C+zJGcOjIwNpYaAjYalTIh+gFcXIvjeHhfP8/jYnx4buBv+pniUHsSFoD/QvW5B0eu+ObiUpiBu7N/YzUa1VBUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SD4EFe90Lggs8cQz5yURwjH248lNbQoaGblSbtee8k=;
 b=GJPGSH7l4a/D06JboL3XncY49JYhjUhC0g6xiVI89rIcKS2dhCsno4D2bfq2kfvNsBTJGTwUN+Ji8RuFMcZ1rFmRo9LOou2BRG5ELwmw8TsIQ4UF5btuYZlRdBn/chiYZ5qr1UJJMK9dTOYSFz/2erl0A06zXpfsyEum8RMtYSbUZB+Pjy1PkkmXnwrx5vT/9m0ZX+VXBRJIJFWoK4VwxZDTlGrCcvVbx8x5hvhayQ7PCxZOCxjgj2JjDNnI8aXS620HyuwS7czMci02p0qpx1xntLz0s7rN2QYO5KFTHUgeO/zITks8I6XPGNSsPi9SeTqIRQkXoCSqJmwo62WHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1110809-b4fb-c53e-5f46-dc7628165634@suse.com>
Date: Wed, 1 Dec 2021 12:01:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/2] x86/mm: don't open-code p2m_is_pod()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
In-Reply-To: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0161.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63740cbd-078e-4d64-8644-08d9b4b9eb2c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57438F3356DBA7AF891FCCD0B3689@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sctOP0GClj1bhtYr4E4vKPV5WjgylqRk46Kf8+tQfcW4EI13mtiyuXCC7HtmgZ0jdMg5oVubJKK4+z01Sho7IeIAoMDh6AOkVZy0KzbFvdEnLBZnRuTbJCRIyIbTgFZI85PAyQzhT7lEEeIt3dqWJfDLvpHQF9itRblsJnjH3WPwqsMiJGZct071I2dLmk2s0Esl+XRMHT9elQTh1A3LSfh9L9EXyfW6WckDfVIN/I9SAEI7ugjQ515iXulLc5uLCuR8ynbZ+Gw8ofra99tlegH2gkOFEaNvBMz1nsMk+TsGiwQwcbw4McHd4pwFhTFe7HCU+Bo4iv0JGksg6xu/MbUEXxX9dDneE5AZaWIE0NFMcKqbik1XHhbq0NxwNgGAk+J7TXgYrspBeThPkIpilolG7dhGG/euOLHlz89Xz/ajKkgnP7zG8/qxGp2npyZ9sQaYx4gD/Y1JmEYLszcqEqxlOzOGkJjhRyFOputcdNz7IgJBNfgjxgNj5WgJ1yzx/QVb1wYyhjjN6wqCzFfOTtpApTrB5KAoltCrZ4ZmH62j55ieCCBdorIbjhJ/UMT2BOECaDi6hkg0zzasb9m2dr96+eymn9a7W0cHugK9wlQqC7nj2Pzv1t56XlGsm72c5uKto982rqFv6AlDBeyJJWHECBcROCKWcwaUEKe2VTPuwDZ+e6gUI1Rr1nYhm2EfVyXBRs7J9bMTs3I/gD8PBvZV1MwvBlTDi3MvHKag5ikFdmv+fVz5ifISXLo2oFLJ6AR+q51/XXZaBbUjrEy+/j+11s5NXOeAa6SuPDhjqCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(8936002)(16576012)(316002)(36756003)(6916009)(31686004)(66476007)(66946007)(83380400001)(38100700002)(31696002)(5660300002)(2616005)(956004)(54906003)(6486002)(186003)(86362001)(26005)(508600001)(4326008)(8676002)(66556008)(45980500001)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ams2eURQejQ3Rk54bWxoNitOdjNCOHdCOE9xNExicXhRL3NKdTlBblA5d2xK?=
 =?utf-8?B?UDVvTENPeklYemgyUWNpdUdNVHhuMHJsYnR1REtpdE1SdEJqaXBFTWh1RXJP?=
 =?utf-8?B?WEozQzVCMFAwemxjOWZmRVArWVgycUZyNnEzZ0RYbXVpM0VJc1B5RjZrY0FS?=
 =?utf-8?B?cWxUVU5YQnI5NkVEOS9USjlhMVR4Uzl1WjhBUnlHdUk3eDcvNE82US9hQkpO?=
 =?utf-8?B?ZlYva1JXWmhhZEJLRzNTNUoyekRTWVRpemlRYzA1YnQrTEFFNmhyVVFMS1B0?=
 =?utf-8?B?WDgzV25LYTlWeFd0Q1ordXVaSldFSGo0aDl3aUlveW5uK2VGWlluWmFKeERQ?=
 =?utf-8?B?TWx2V3h6N2FJUDU1Q0x4U1YybjJ5QXk2NGZNT3VuUTBzVU8xSnd0NmRCZ2xq?=
 =?utf-8?B?dmorSHBwSGdSRURUNWxqaW55bW5hQllleUt6S3FzTmxUMTNYQmIvdFU4TFhi?=
 =?utf-8?B?UXFXS01URmx4LzNZQU56dFRaLzNqdkowV0pjdkVMQmVGRVZuVnlOOXQxek1i?=
 =?utf-8?B?bHBGM2VYalV4SlBscElMYlZaU3UycWtjSGJscUJtZVo2OTRlUTFpQW1QSjZl?=
 =?utf-8?B?STNRYVlZUWcyeUk3WWFtY1BUcGxRN2FRaDQ1TktUSDc3SmtlNVUvckRwbzF6?=
 =?utf-8?B?ckpMNVU2TVBtRm0rSGliU2tqVHN6U1cwM2JrYUlRekI5VmFma1NLUzNnVUZ5?=
 =?utf-8?B?RlJYQlJlSUw0UnZwM1ZzemtONmhMYUJnb2FSOVZiSzNVNGQ5cGR3U3FiaXpU?=
 =?utf-8?B?dmh2bnVMZWNsNmR2UzlNZGI1Mkt0cStrbWt5NDk2aEJ5a29MTG9nMzhDb3JK?=
 =?utf-8?B?c0lQUExBM1pTRE9pdUxhdTlFY3lKaU5kZkZKSUt5dVlwZWdyKzlHRFYzL2pl?=
 =?utf-8?B?NnVvUS9KV1V5WFpGVWpScVp1eHZxY05CTjRNTVcyRDg1cnUvcDgzRWg0OWNS?=
 =?utf-8?B?ZFMzeDkyRUNKRlgrL3FSSE1XS3Rid1ZtbzRodW9BM2lLTkNvUlRHZnBZcnoy?=
 =?utf-8?B?N01NVVQxNDVmeitoeTdleDlGbU83eXVuZUtkeEpEeFRJVjJzOVRLQS9FcCtG?=
 =?utf-8?B?QjFRb1VmdWlCYjZJUVBrUUhDNmVPdmZQU0lybmI2RjU5dVpSZm9icHFib0Z5?=
 =?utf-8?B?RlVVenlta3RlREM0dzUwRnhRNE9vR0gyUnEvcFFDdWNabXBaSFYxWmdqUUd3?=
 =?utf-8?B?eVZDNmxzQ2xuYmhIdVpFV2lScUNaUklkKzdqMUFZRGlOc2JBY2dvc3Q2WmFX?=
 =?utf-8?B?MXREOENzSWJSdHRqMUxWMkxlLzA2S3ljbHVEdGRsd1RBNmRUV3ZsVkVGV0Ry?=
 =?utf-8?B?c2RXVnRBS2FJOE9QdGpTcDh4L1d5U21uMTdnaWtnM3RuRXBLeG9BU3ZmNURX?=
 =?utf-8?B?UHNNNDNRcVM2UkFoK1lUYzZnclhuaVZualBZaW5WQ2pOTnZUUEdJNUpCRUNj?=
 =?utf-8?B?bkRvQVNPVmNUN2ZLZFBaaWpzeU85ckVDMTJkdWdydUdwc0krYUd1eUVaNkFn?=
 =?utf-8?B?SkE1M1UvM2FTTmhWeUc3dXNQQkJYSGd1QVVoaGVSNnUyRmhZdGVpMzE5TmRY?=
 =?utf-8?B?WFRhakU1RDRCM0pkbFVwZjByaEdSdXluNEpMRzBYZHduLzNERGZqSTYvdjND?=
 =?utf-8?B?T09MK1RRNFNYVUNXcXBxRXFRekFmU1BlUWZyZ3pPU1RTZTVteDNhSWdpVGhN?=
 =?utf-8?B?RWVMSHREdElFaUl6ZjE1RWxQVnU4ZFFBNG1YVFZ4ZVZwNU1JNVFQTld6ME5F?=
 =?utf-8?B?MEp3M3dmSlpNYXZMVThqUktPTzJmTStTTjlFTmJXcXZFUUpYUy8wemROanlQ?=
 =?utf-8?B?SXlJR295WCswTjUraUFKTm9scUVLSFpmbThmdmNGQU1jNEVtaWppbVFjYmJj?=
 =?utf-8?B?YkY0NU8veldHTTVjVFhFVUgyckpRRHhCeU1WaWhPbXRoUTJFSW1YdW1VN2wx?=
 =?utf-8?B?WWdlSHBBamUrVmc5MUZ3d0FpbWQ1bW1KTld3UlF3UWZZaHhiaThZVUNmcjFY?=
 =?utf-8?B?RHpGTVhVMkxZT0Jwbkszbm9sT1dmMmkxQytGVmNLNlgyYjJoSCtBcEdZYzdk?=
 =?utf-8?B?NzEreE9WWHd5Qkk4bG81YUNkc24vek5VcktZNjY3ZE9WdGtGOFhpdW1wN0Ux?=
 =?utf-8?B?SkI4S2FwYmlXSE94MnIzK3JYMk5aRVRWaUVsbFpIZEFadVVxMnpHRzlEODZZ?=
 =?utf-8?Q?NL07SubK8sCtFFmBDBuqWaw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63740cbd-078e-4d64-8644-08d9b4b9eb2c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:01:25.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDnjOLDiHA/MRvDC2mvPHe1EiUmSVQ1Si7tqVLl68a9ce7wBDeaRn07C5OmPJ+W9k69h6g8ny33TevS99wQGTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

Replace all comparisons against p2m_populate_on_demand (outside of
switch() statements) with the designated predicate.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -344,7 +344,7 @@ static int ept_next_level(struct p2m_dom
     {
         int rc;
 
-        if ( e.sa_p2mt == p2m_populate_on_demand )
+        if ( p2m_is_pod(e.sa_p2mt) )
             return GUEST_TABLE_POD_PAGE;
 
         if ( read_only )
@@ -1071,7 +1071,7 @@ static mfn_t ept_get_entry(struct p2m_do
     index = gfn_remainder >> (i * EPT_TABLE_ORDER);
     ept_entry = table + index;
 
-    if ( ept_entry->sa_p2mt == p2m_populate_on_demand )
+    if ( p2m_is_pod(ept_entry->sa_p2mt) )
     {
         if ( !(q & P2M_ALLOC) )
         {
@@ -1478,7 +1478,7 @@ static void ept_dump_p2m_table(unsigned
             ept_entry = table + (gfn_remainder >> order);
             if ( ret != GUEST_TABLE_MAP_FAILED && is_epte_valid(ept_entry) )
             {
-                if ( ept_entry->sa_p2mt == p2m_populate_on_demand )
+                if ( p2m_is_pod(ept_entry->sa_p2mt) )
                     printk("gfn: %13lx order: %2d PoD\n", gfn, order);
                 else
                     printk("gfn: %13lx order: %2d mfn: %13lx %c%c%c %c%c%c\n",
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -543,7 +543,7 @@ decrease_reservation(struct domain *d, g
 
         p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, &cur_order, NULL);
         n = 1UL << min(order, cur_order);
-        if ( t == p2m_populate_on_demand )
+        if ( p2m_is_pod(t) )
             pod += n;
         else if ( p2m_is_ram(t) )
             ram += n;
@@ -618,7 +618,7 @@ decrease_reservation(struct domain *d, g
         if ( order < cur_order )
             cur_order = order;
         n = 1UL << cur_order;
-        if ( t == p2m_populate_on_demand )
+        if ( p2m_is_pod(t) )
         {
             /* This shouldn't be able to fail */
             if ( p2m_set_entry(p2m, gfn_add(gfn, i), INVALID_MFN, cur_order,
@@ -1332,7 +1332,7 @@ mark_populate_on_demand(struct domain *d
 
         p2m->get_entry(p2m, gfn_add(gfn, i), &ot, &a, 0, &cur_order, NULL);
         n = 1UL << min(order, cur_order);
-        if ( ot == p2m_populate_on_demand )
+        if ( p2m_is_pod(ot) )
         {
             /* Count how many PoD entries we'll be replacing if successful */
             pod_count += n;
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -841,7 +841,7 @@ pod_retry_l3:
         flags = l3e_get_flags(*l3e);
         if ( !(flags & _PAGE_PRESENT) )
         {
-            if ( p2m_flags_to_type(flags) == p2m_populate_on_demand )
+            if ( p2m_is_pod(p2m_flags_to_type(flags)) )
             {
                 if ( q & P2M_ALLOC )
                 {
@@ -884,7 +884,7 @@ pod_retry_l2:
     if ( !(flags & _PAGE_PRESENT) )
     {
         /* PoD: Try to populate a 2-meg chunk */
-        if ( p2m_flags_to_type(flags) == p2m_populate_on_demand )
+        if ( p2m_is_pod(p2m_flags_to_type(flags)) )
         {
             if ( q & P2M_ALLOC ) {
                 if ( p2m_pod_demand_populate(p2m, gfn_, PAGE_ORDER_2M) )
@@ -923,7 +923,7 @@ pod_retry_l1:
     if ( !(flags & _PAGE_PRESENT) && !p2m_is_paging(l1t) )
     {
         /* PoD: Try to populate */
-        if ( l1t == p2m_populate_on_demand )
+        if ( p2m_is_pod(l1t) )
         {
             if ( q & P2M_ALLOC ) {
                 if ( p2m_pod_demand_populate(p2m, gfn_, PAGE_ORDER_4K) )
@@ -1094,8 +1094,7 @@ static long p2m_pt_audit_p2m(struct p2m_
                     if ( !(l2e_get_flags(l2e[i2]) & _PAGE_PRESENT) )
                     {
                         if ( (l2e_get_flags(l2e[i2]) & _PAGE_PSE)
-                             && ( p2m_flags_to_type(l2e_get_flags(l2e[i2]))
-                                  == p2m_populate_on_demand ) )
+                             && p2m_is_pod(p2m_flags_to_type(l2e_get_flags(l2e[i2]))) )
                             entry_count+=SUPERPAGE_PAGES;
                         gfn += 1 << (L2_PAGETABLE_SHIFT - PAGE_SHIFT);
                         continue;
@@ -1132,7 +1131,7 @@ static long p2m_pt_audit_p2m(struct p2m_
                         type = p2m_flags_to_type(l1e_get_flags(l1e[i1]));
                         if ( !(l1e_get_flags(l1e[i1]) & _PAGE_PRESENT) )
                         {
-                            if ( type == p2m_populate_on_demand )
+                            if ( p2m_is_pod(type) )
                                 entry_count++;
                             continue;
                         }
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -992,7 +992,7 @@ guest_physmap_add_entry(struct domain *d
             ASSERT(mfn_valid(omfn));
             set_gpfn_from_mfn(mfn_x(omfn), INVALID_M2P_ENTRY);
         }
-        else if ( ot == p2m_populate_on_demand )
+        else if ( p2m_is_pod(ot) )
         {
             /* Count how man PoD entries we'll be replacing if successful */
             pod_count++;
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1476,7 +1476,7 @@ static int validate_gl4e(struct vcpu *v,
         mfn_t gl3mfn = get_gfn_query_unlocked(d, gfn_x(gl3gfn), &p2mt);
         if ( p2m_is_ram(p2mt) )
             sl3mfn = get_shadow_status(d, gl3mfn, SH_type_l3_shadow);
-        else if ( p2mt != p2m_populate_on_demand )
+        else if ( !p2m_is_pod(p2mt) )
             result |= SHADOW_SET_ERROR;
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC )
@@ -1535,7 +1535,7 @@ static int validate_gl3e(struct vcpu *v,
         mfn_t gl2mfn = get_gfn_query_unlocked(d, gfn_x(gl2gfn), &p2mt);
         if ( p2m_is_ram(p2mt) )
             sl2mfn = get_shadow_status(d, gl2mfn, SH_type_l2_shadow);
-        else if ( p2mt != p2m_populate_on_demand )
+        else if ( !p2m_is_pod(p2mt) )
             result |= SHADOW_SET_ERROR;
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC )
@@ -1586,7 +1586,7 @@ static int validate_gl2e(struct vcpu *v,
             mfn_t gl1mfn = get_gfn_query_unlocked(d, gfn_x(gl1gfn), &p2mt);
             if ( p2m_is_ram(p2mt) )
                 sl1mfn = get_shadow_status(d, gl1mfn, SH_type_l1_shadow);
-            else if ( p2mt != p2m_populate_on_demand )
+            else if ( !p2m_is_pod(p2mt) )
                 result |= SHADOW_SET_ERROR;
         }
     }



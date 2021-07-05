Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F0C3BC15C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150446.278173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R7o-0003ij-NG; Mon, 05 Jul 2021 16:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150446.278173; Mon, 05 Jul 2021 16:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R7o-0003fk-I8; Mon, 05 Jul 2021 16:07:12 +0000
Received: by outflank-mailman (input) for mailman id 150446;
 Mon, 05 Jul 2021 16:07:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R7n-0003f2-2b
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:07:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d1d7ddc-ddab-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:07:10 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-tDzpL-PgPjae8nrhJsOXHw-1; Mon, 05 Jul 2021 18:07:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 16:07:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:07:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 16:07:06 +0000
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
X-Inumbo-ID: 0d1d7ddc-ddab-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rM44k3o2q11woEJoneKZFwdYs+k+agPXTnKUSJ4RUI=;
	b=AJXg/fi97XXi1bFrKsfpvvcL229ZS7QHoc+AUyKytN+x/xKWAAUtk4ROSXa0EHoqAkweuu
	xODA0uB1JbpXElKqzpZcEBs/mAslbWcTV+VvwUZu9b5PP2y28JrZ5r9oLyH6XpVHgKmB/z
	yKn/MElGahD9KCM/AzoQ0GraN522obA=
X-MC-Unique: tDzpL-PgPjae8nrhJsOXHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB5WSPbuvEIeX5HZf6PM6jZHn84WurshqPMLz1bpQCMV22mez4tC6oJkmDdTcXrub3V+R6tE/WCREglZ3D150xAAbql06GquYcNSCh/9RdjWMeextbRyULal3Y36RoMlANh6mcJgebm9LT99KuCtgXBL07SPUd3aO5OGo/n1XFGEo01Z2Vdk8/t+j8BxIgkMak0JBL0eUgrtqbBy2I3jxRO79ppF9koaEMQ1iTO1S1KfwOK8zNJerO6GLvtvQrkQ84Qa9BCPSmV5K27yn4hBFLVi83yRngWY1hfPLyHKoB/gd6ioXBuqJEb8TIpFr1SFVVUTvv1Rf2OD1iE3t2Wh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rM44k3o2q11woEJoneKZFwdYs+k+agPXTnKUSJ4RUI=;
 b=J7evhxc717kKriMazwBwp8xQh/VJ/lgTc0EdM6PTLp63L74ja7zsKobjtqW6ivVN/k80JEuy6/SWUC39giSN33XY3ETAZcodwYkjNBxTE2Mf6Ske+C1m2FRwPUj+n40O0NAazhmKJ0zT/JCGit1dDqaFWjMFhS/MUMCOHB+coBx/4L3CvJDdZsis7DJu93Mzepgs3PBS2PDym3a7hu9p8OKM25eWhHmrVOL4YM82wYCIjFsoEbC4dWCqw9YxFF1Zzsnq/eA2mW1FAmCbk48drgB6+Bclh6b0UJbeW7lqdzvRTwbCgzhR61qsRWqBuTb/dMuz/Wsd8PRKqBY9u2V7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 04/16] x86/P2M: move map_domain_gfn() (again)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <2b9d4562-1d44-d038-ea43-fe8b067c6070@suse.com>
Date: Mon, 5 Jul 2021 18:07:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8731208-2287-4183-1bd0-08d93fceefb1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686136D2DC426E86489CEA5CB31C9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UzMbmNCgbd144QW0tKZ6Sqshxvd+isgDMTJOviz5OFWKF8hsYzgw0xnPTZm1Pjs3T11FChs8fZ4S2Zumvr2gMeO6AbNJwaI1UhF3LeTOGK650atI1xU0lRhYAXdlQx0/O1wuLClnsNcKL+BI1pI/U4qpP00hl1hGKdhPnsrWtgeu5gIFQHplnR+7VjhKwPqA6W9+5KZFizJ5ZmLQtNNP+Hs8eB0f0A82I7+lyoqv6kSn55vikqAvfA9ZJZFXTVzOgdtz/Chb0sVIktDPeTcdf+NW+H+kDaCu9gA/RIIwNCH4meTsy8O8PB5H+rmN4ADlLcI7j052891ia7xib8T5pnbpHHFCB4qRJI84+JUfiA8pQVdW7aP4jQVep9qXIte88p6s4pj5xfolSTx6FAa9OlbPbk+Nqv5dix5V1qOT/0DJWD5AQbbrcJIrb2vD+onAzg9lALhKhX0rbqZXgOEAQoAa25Cx5hHrUEgCNYEknGbU0+AaLTHiP7C1L8g/PrIykL7iCrGSM5K6oXMeTQY84bKMx6Hf1Z/Ljxp+QY9BQQ6lgebqgGZX7lnvOhRhMZYQN5+/fO4Pi6QUf3rWzkeSLuzqWkNEPt0e9FlAHySjC1c6ljd+mBi0Coe7SaVutSMyad01wNFYGq2Q82TVvDpWjiYcAGt/rJwj0xpzt4BwPavpE7Wt6Q9OvF8ivi/V08AAM+eO+EETmbqQJER9r8kUolt43uZ5/oKh7rJ5guxKM5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(136003)(346002)(396003)(66556008)(66476007)(86362001)(66946007)(5660300002)(16526019)(31696002)(31686004)(38100700002)(26005)(36756003)(186003)(2616005)(83380400001)(54906003)(478600001)(6486002)(316002)(16576012)(956004)(4326008)(6916009)(2906002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWY5UXRXNU5PSU5wVUZLenphYk9lc2ZpR3hqdG52aEZMSHkwUTNSOFR6Kytj?=
 =?utf-8?B?Q0VXSkhxZTZnRnJ2STdjamk5dlhjVnlybDIxaHpobUZLTTRJOHRzSHlocWVs?=
 =?utf-8?B?dCs2cmFWWDVZc2h5TXh2TFhTUm9iMjU2c3dBMEx3SmlEQjZhSTl5T2Mzd01H?=
 =?utf-8?B?RGxtZFdOb2E1U0orQStJWnVsWnFpbFFERVVDeW1ZVkJLWVlCeUM4Z2lIeHo1?=
 =?utf-8?B?OUtNQnJKblBQYVBWZFIvcXlFVXdCVWxuQVppNWRZNFhacWc1NmplQTNORHhm?=
 =?utf-8?B?OThlR1FkcERnWWZ0VXBITzEzYU5mbEdTSTdmSzJmQVVpKzd1WjU4K0p3WldW?=
 =?utf-8?B?Ty8rZFZWM1hacUtUMXE1cWk5WjRTRU0vMG1vcU9peStqVmtEdUMwZkRvNUlY?=
 =?utf-8?B?T25ta21LbHBhb1drbXNQRzJNVVhZaDZUWFJsVnkrM3RwYW41Rzl5Q1J4U0pQ?=
 =?utf-8?B?VUhzem9YQTNHZnRGaWJaNFpRaHQrRmRvR010RGdBb1N2S3hiQUIzRWRyL2ti?=
 =?utf-8?B?Z0VHNVlXTDY1cjE1eE8wRzIzc09kcWNjY2pSZy9JMlpUYjJiMkFpTUhka3pX?=
 =?utf-8?B?UjBVQi9udExqOXo5TEpQU3B0QlNtek9FMVFzU1JZWmpBTCtYTFlpbXNNUzhM?=
 =?utf-8?B?UTNRVUdocy92RVJVcU5tUnRZKzBORDdqZFpUWElzMUNRWFBnS0FTM2hYRWVH?=
 =?utf-8?B?NVYyVHRGd0pnUG9BUmNmaFlLaDJQRnFOZjUrUXQrRTRQTWcvWVZ4eHNmZU44?=
 =?utf-8?B?MmltWEdGL3BTdzVyRWpCa3lRZTFTODJMbEJhWGQ4KzRIOXEwUFh2NlIrZEpK?=
 =?utf-8?B?ei9lMi85L1FiY09KTlRWL29BZ2pIbzZ3Mk9JNzZNME95YmE4QWRPNW9Obm5a?=
 =?utf-8?B?enJIRU5aQWpoUDdWOFRVWnBnTWpGR05FRzVtL3JHQjMrU0VrM2gwcmdJbnhm?=
 =?utf-8?B?VXg4MnBJbzlsQTB3YmpWRndIK2psSW9hc1BkK1E1eC9SZVlMK2RLdzQ2L1NI?=
 =?utf-8?B?d2dVKzF6cm9NWXlqRzZsTHp6Ym54WTRZYURseFl5ZGNRSVdsVTRrOG9qOHQ4?=
 =?utf-8?B?MlUvQk1PT042eEwycU5XcGFMK0dhNDEyMkFlTTNJdGRzQVlIVHhoNExIQnpq?=
 =?utf-8?B?WlorYlZSS1N2eDljdk5yUkhpT2JOTlFpckIxZmI0bmlqc0VyQnBVR0g1NERz?=
 =?utf-8?B?UUtCZkl4UUJmT3Z5MVArS3FKT09hSGxrbEZBRFJ0SG1SMkNpUWxjeFRKdUpy?=
 =?utf-8?B?ZWxrdWVqRjlxWFpNV0tKN1dUajRmRDNYWm9MVC9LU1ZyZnpyalRpb3JTUUpR?=
 =?utf-8?B?dXl1dHR5Unl0SnNickZudStKSlhSam1ZTTJac3F0b3hJbVN6NHZWTndlVlRN?=
 =?utf-8?B?RU1CcS9BMXRzKytsdFBHKy81aWNDVXVyTnZoam9Zb2ZGejJDN2hXdHBBUnhI?=
 =?utf-8?B?WVhNSHJYSWdCYkZ4UzhJRHRZNkpXSXNhWG9KanZKNFdWL1JlbTRMSzY0Z2JV?=
 =?utf-8?B?bDdBd0dBc0U3cHlGekhCQU9jV0daWEhXVForOFJOazArQTFNaCtkY1JKY0JK?=
 =?utf-8?B?SnVYL255OUlKcCtWcTlzVVNNeXVQQlNWdHovRGRkUHJaWkozaFFadnhJZngy?=
 =?utf-8?B?UXJXV0ZYMGk2ZzRydzVaTUp5WGRQMzdVanliZXUxNnU5T2FEclh4UEI0eDl3?=
 =?utf-8?B?SkdMejMrVlJoS2FFVFJncTJ5c1VrWTR4SitrNEUybnFIL0p0Y3FRN0FTUUNE?=
 =?utf-8?Q?kwJg9PWqzb12h9eMR2ptBoI/68dsFr7ZhOWcLgX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8731208-2287-4183-1bd0-08d93fceefb1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:07:06.8139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79o9fp1B9gBRFqR6ZMgTW+lJ0U3Vtx1vbWVYJsHL4rfQe9vWPWWmO6ZUgDmA6CkdhReyfYDfrE1Vj47oM+rpww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

The main user is the guest walking code, so move it back there; commit
9a6787cc3809 ("x86/mm: build map_domain_gfn() just once") would perhaps
better have kept it there in the first place. This way it'll only get
built when it's actually needed (and still only once).

This also eliminates one more CONFIG_HVM conditional from p2m.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -535,6 +535,56 @@ guest_walk_tables(const struct vcpu *v,
     return walk_ok;
 }
 
+#if GUEST_PAGING_LEVELS == CONFIG_PAGING_LEVELS
+/*
+ * If the map is non-NULL, we leave this function having acquired an extra ref
+ * on mfn_to_page(*mfn).  In all cases, *pfec contains appropriate
+ * synthetic/structure PFEC_* bits.
+ */
+void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
+                     p2m_query_t q, uint32_t *pfec)
+{
+    p2m_type_t p2mt;
+    struct page_info *page;
+
+    if ( !gfn_valid(p2m->domain, gfn) )
+    {
+        *pfec = PFEC_reserved_bit | PFEC_page_present;
+        return NULL;
+    }
+
+    /* Translate the gfn, unsharing if shared. */
+    page = p2m_get_page_from_gfn(p2m, gfn, &p2mt, NULL, q);
+    if ( p2m_is_paging(p2mt) )
+    {
+        ASSERT(p2m_is_hostp2m(p2m));
+        if ( page )
+            put_page(page);
+        p2m_mem_paging_populate(p2m->domain, gfn);
+        *pfec = PFEC_page_paged;
+        return NULL;
+    }
+    if ( p2m_is_shared(p2mt) )
+    {
+        if ( page )
+            put_page(page);
+        *pfec = PFEC_page_shared;
+        return NULL;
+    }
+    if ( !page )
+    {
+        *pfec = 0;
+        return NULL;
+    }
+
+    *pfec = PFEC_page_present;
+    *mfn = page_to_mfn(page);
+    ASSERT(mfn_valid(*mfn));
+
+    return map_domain_page(*mfn);
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1869,58 +1869,6 @@ unsigned long paging_gva_to_gfn(struct v
     return hostmode->gva_to_gfn(v, hostp2m, va, pfec);
 }
 
-#endif /* CONFIG_HVM */
-
-/*
- * If the map is non-NULL, we leave this function having acquired an extra ref
- * on mfn_to_page(*mfn).  In all cases, *pfec contains appropriate
- * synthetic/structure PFEC_* bits.
- */
-void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
-                     p2m_query_t q, uint32_t *pfec)
-{
-    p2m_type_t p2mt;
-    struct page_info *page;
-
-    if ( !gfn_valid(p2m->domain, gfn) )
-    {
-        *pfec = PFEC_reserved_bit | PFEC_page_present;
-        return NULL;
-    }
-
-    /* Translate the gfn, unsharing if shared. */
-    page = p2m_get_page_from_gfn(p2m, gfn, &p2mt, NULL, q);
-    if ( p2m_is_paging(p2mt) )
-    {
-        ASSERT(p2m_is_hostp2m(p2m));
-        if ( page )
-            put_page(page);
-        p2m_mem_paging_populate(p2m->domain, gfn);
-        *pfec = PFEC_page_paged;
-        return NULL;
-    }
-    if ( p2m_is_shared(p2mt) )
-    {
-        if ( page )
-            put_page(page);
-        *pfec = PFEC_page_shared;
-        return NULL;
-    }
-    if ( !page )
-    {
-        *pfec = 0;
-        return NULL;
-    }
-
-    *pfec = PFEC_page_present;
-    *mfn = page_to_mfn(page);
-    ASSERT(mfn_valid(*mfn));
-
-    return map_domain_page(*mfn);
-}
-
-#ifdef CONFIG_HVM
-
 static unsigned int mmio_order(const struct domain *d,
                                unsigned long start_fn, unsigned long nr)
 {



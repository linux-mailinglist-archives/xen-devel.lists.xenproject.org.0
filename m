Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99D3B72A9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 14:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148033.273396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyDG8-0002oT-Sb; Tue, 29 Jun 2021 12:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148033.273396; Tue, 29 Jun 2021 12:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyDG8-0002lD-Oe; Tue, 29 Jun 2021 12:54:36 +0000
Received: by outflank-mailman (input) for mailman id 148033;
 Tue, 29 Jun 2021 12:54:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyDG7-0002l7-Vu
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 12:54:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c52841f-d7e6-46cc-9007-af3e1e348d48;
 Tue, 29 Jun 2021 12:54:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-wV90MzgDNd6tK67nmVbnFQ-1; Tue, 29 Jun 2021 14:54:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 12:54:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 12:54:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0148.eurprd07.prod.outlook.com (2603:10a6:207:8::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 12:54:31 +0000
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
X-Inumbo-ID: 2c52841f-d7e6-46cc-9007-af3e1e348d48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624971274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+kokP/tuDkyLODI5tQsnPxes6fbGBAjcWgNA4ZJ5vuU=;
	b=T/ryBV1FU9uX4mGQiug/YPFntSOCAppTzOJCdArRz2ALD7bmILfzUQ1KT3cD+vJ32kCh1p
	UQZ43ZKn54tYK/sBx1KlzNCFo88Tc/Qq2e4pFtql7Hx+Iiaj7VgvKMiOVfnTleJ0llLkhE
	tmrYTudePMyA2jE/31HBQ9hnZv4RsRg=
X-MC-Unique: wV90MzgDNd6tK67nmVbnFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eo9pFtuEFG5Qkayi4jocKmijweQyc7U/+ULZ2VjDYtGIBExF6KR5NqPbrIq03kx4hcfFGnZmYbExOFP2UYZnKEs33V2m0I+Lh+QukU03kAg96wa3NW3AJDDRJS16UOXgfQxn4E/Xr+eqIKTRU1fflMUYSwoU5BgbmqF5536cMxudfqE7VpEl4P2baFXzbQs6jtqQB5x6ZPSoOVfvqKA4lbNVBVbFERH/eykIzxZ/JaIxfss9ypd5YKioIqdIjx87xnbzLECFJKS7AQ9msT2OSKCJMozVDe7iteXNW0YoCmIx17cgLqJ7P1BKhzap6es/hivcIeFOWB8vLvpsle5CSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kokP/tuDkyLODI5tQsnPxes6fbGBAjcWgNA4ZJ5vuU=;
 b=Boq3w/EWTVPbbie0DBFeAwXXKqtI8Svi9rtf9JQIDEUiLH9MLTZuPZ4p/N4pteHr7JMt50DzCE+knBGf38mudE91XaYmbYufTf853UDK5YPRtP8qF6j+NqlrO6dE3aoJ0ZS9n/7XBD/J3HZ7oH86mi/ql61MEmgfezBliq6DBAqSrcQd/Z5SneWELsNzspGCWp3wCyDJVUzVLvKgq9cRLZKBkbABPuiDY+ZSfjs1d+41HRPEvj4zzV48ziYNn2CXV6kZXk1u5kGIgaehLoTlE91MwEWNeixPjVPYPI+FghZT9lcv5SPcLANd7pGXRrv2335jcfP3wOZr5yd0N4r9Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/2] x86/mem-sharing: mov {get,put}_two_gfns()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
Message-ID: <6f4c081d-732d-87c0-2ad9-0aafea1ad927@suse.com>
Date: Tue, 29 Jun 2021 14:54:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR07CA0148.eurprd07.prod.outlook.com
 (2603:10a6:207:8::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e76bf4ee-f027-440f-4e05-08d93afd09f0
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617328F6756513CF8EDD31BAB3029@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4vUTuA9KLImDiM7GrQY6rg7gxz4UJDGBEhwUoTrruwg7i+IisFTFX/AagiMlc72aBb1QXlagUIZiNLcuM7vR54687mvmc95bpbX4EGzoZUaUWjchdx18h+ML11BMIjQoPNEpW5jYv7jIsBw642zgE4KQXNS1pbk1Bf/XWmYQf0Ysqzqc6D+h1P77FRwJzggAvPpqq1Dfh5e6WxzsFskHHBDMoSGctG9p1W7utXWvvf61kmjRK663j4XGaAzFljTi0I5DwCfw6MdvXvsMpOPX6sevFqj0Pjg4D0/JiUIzgvHYD4VW8aMVjYwI7cQ0MvJmVdctXi3WuQAlC6bgvA0gMdsq807QqMBcZt4NAdS30tKlhftrYrB0aqnsXhhNSF8ZjIimP0iUTsefNIKS26xZk3XgfwJKE2A50lU6toOKyd6wI3JZMbuHb2OZAKe564jt+ir57VXLybmNDOqxXlp6GVnHVK7Kao/Y1HlLkRODCs7T91pimsqlpyQVyk5rJSi1UessEinrgXh03eh/zNzzVEjOlT7lV3d7glq2JDdlwOlBhzRLYXNIdELyXEsX4/Lkxm/m5roB8+WZzaUR/t7088KTHETSDNvnke/j1dIUZiYpSGW4JOOjYkMcaK0+s8P8lBMYShg/SlRW+MHpi/O+dUNHyOZVbdSRfRzGS6/gbVkc5cJSMSsn1+6AR2eA98WccYvcAl+/3T6nygNASNUqPaTr2TNa54zRWV7SELhUCHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(366004)(396003)(376002)(346002)(6916009)(478600001)(5660300002)(66476007)(66946007)(956004)(66556008)(8936002)(8676002)(2616005)(31696002)(86362001)(38100700002)(4326008)(186003)(16576012)(316002)(6486002)(54906003)(26005)(2906002)(83380400001)(36756003)(16526019)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlhyQzVaaGR6YjZHK1JkbU5PdndSZ3NmaUhoVEVISkpBTTgvNVlFSGd3TDBM?=
 =?utf-8?B?bjhKODJFbHRFSlgza0VScSthaExBV01GZ3NZOHQ1c2pGREZ4Z0tucDR2dkNT?=
 =?utf-8?B?MHdHVVY5RDRXVEE4dmZzQVc4emlDL1pDeWQvd0lUQ0RaVnhENEZ0by9iMkUx?=
 =?utf-8?B?a2tMVllYUFoyYUk5ZS9YbjV2U1RZekJqbEhIUWdQZW5Sb1FVSzZlQlBobTN1?=
 =?utf-8?B?NFNDL2pKOEZDa2JPZVptNTBMaTNXNU5yc0N6dXVleXZodVpzd2pGMHlJU3Qx?=
 =?utf-8?B?V2EwRjY3eHY1U1NrOHNxT2VHOFNwcXZYUG13WGdTWXdOemphVlV5Q1BkMk5B?=
 =?utf-8?B?Y3NaZitCZ3FEckluSmxXS0M4bUFpbWFUY0l5azNXU1BLSlp4WU13ekM2dzUz?=
 =?utf-8?B?TnNFaEdXODVYYi93MWtiTnc4MUhHYlUyV0dxZzRiUEhSR0Rmajl2TndUaFo4?=
 =?utf-8?B?bW1UVGNqd0lxZXVtNHpLNTk5cVBtRGJDZU5seUtwbHJYUzJBbnl6eUtkMTdl?=
 =?utf-8?B?MG0yM2JvdXhaMkk0eFhjMWhtQWhQdDQ5b2VHaDhud05tVFRVcE0wdEJBRkQ2?=
 =?utf-8?B?UUlhZUVVU1U2YXJaSGRFUDVsOERXb09rQjZVNEpsRzJKeEFlRWVOMjBtVTlJ?=
 =?utf-8?B?TDd6d0tYd0dSV2VaY3FFTzRkbENnb3pERVpHbHBNdEVha1VLdjRSQkhkdG5l?=
 =?utf-8?B?SXNFWnpsSnYvNjFZK2IwQ1p3alNBWWhkRWY4UG04U3V3ZU1PMHhOeE1oSFc1?=
 =?utf-8?B?N0ttZDAwRFJhQW4vS25yaWJWWW5uWWZUb2NiYjdlNC8xU2U4T0djeG1JdG5p?=
 =?utf-8?B?OWhxVDNVQ1J0OEIzcTBVMlV5MXQ1d2RiZUJzOTlOMmh5ZTJnaDhUM1lLZ1Ey?=
 =?utf-8?B?QlptcUVtVjVuRUo2RnB2bVRqYlIyTVQ3cko3Q0ZyQzgxOHEyQ3ppK0lLZ3ZL?=
 =?utf-8?B?Yy92RXFETnZGZUZPSDJEUHBpSmdtK1NYNVBwdzFvajgvcWJjNHhwUVpIOGll?=
 =?utf-8?B?ZEt4SnVpRU11empEenJJbC9GWHBYZStaNnhGYlBKaHdrRmFMYm1WclYvM2R0?=
 =?utf-8?B?RkNpNDRtU01WUnRGTlVPSzBxaHl3aEpFemUycWs2TTFPa1U3NlJtY2FJdHhy?=
 =?utf-8?B?SFpPci9PLzA4VkxscEkzdmJuT2VMdzhtaFlLbDRkVTJIVXAzYTJ4K3NoMHoy?=
 =?utf-8?B?aGhyNWRJU2djQmpReEdvUzJnd0JmK1MwdFJxUTVtWjlJS1c0ckVGblNUNGQz?=
 =?utf-8?B?S3d0Umd2TlB6akQvemZpb0N6WlVBNzI1OUNRdXYyLytMYzA3VnNBbmRTUDZp?=
 =?utf-8?B?N1Z1eGNyRHFoV1h4ZU00NkI3NkJrbGd6ZFA4SjA1WWswbFFFK1FJTmFDT2ZO?=
 =?utf-8?B?STVZbmw4RVRTRHJGTEoxNFhNLzVVeHBHVSsvYm5kc0cvZ1ZsMnZEZWhlNnFW?=
 =?utf-8?B?UzBsYS9EbnJHa1p6NCtiVHVMSTRxSnJsY09TZm1YbG5XTHBNbkRhMlVvZHRI?=
 =?utf-8?B?cmQwaFFmQ21aUlcrN3pOWjNJMFdkSjdpUzI4TlNqQUdpaW13cG5OVVFKS1ZL?=
 =?utf-8?B?L3N3NEVzRTh3VmpVb2Fwc3JUaUx4YkY0MENlQU1tbnNWbUtRaWJXeTZUSFI4?=
 =?utf-8?B?NHFLazl6YUFJOFZUenROZXFzMDk1L1RqenFxTnVPRDhxNXZWb1Fybk1RMW9s?=
 =?utf-8?B?NEFjWE5nTXExMG9XK3pnQUJZK3hBTmNNeWd5SndzVGVsSm0wNDJ6ck5ONHZi?=
 =?utf-8?Q?ZHq9QbjJvo0ToyThmG8lE0fMzktLLpZ42cULMKg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76bf4ee-f027-440f-4e05-08d93afd09f0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 12:54:31.8385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKxvF2MAqdrEX8dwJMWSmWkrsiw5USFrZ5+Ybo5lsV5QGsV5xK+EiJKaabV+U4DibmOWgh6g926vp29h/8TPYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

There's no reason for every CU including p2m.h to have these two
functions compiled, when they're both mem-sharing specific right now and
for the foreseeable future.

Largely just code movement, with some style tweaks, the inline-s
dropped, and "put" being made consistent with "get" as to their NULL
checking of the passed in pointer to struct two_gfns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -432,6 +432,66 @@ static void mem_sharing_gfn_destroy(stru
     xfree(gfn_info);
 }
 
+/* Deadlock-avoidance scheme when calling get_gfn on different gfn's */
+struct two_gfns {
+    struct domain *first_domain, *second_domain;
+    gfn_t          first_gfn,     second_gfn;
+};
+
+/*
+ * Returns mfn, type and access for potential caller consumption, but any
+ * of those can be NULL.
+ */
+static void get_two_gfns(struct domain *rd, gfn_t rgfn, p2m_type_t *rt,
+                         p2m_access_t *ra, mfn_t *rmfn,
+                         struct domain *ld, gfn_t lgfn, p2m_type_t *lt,
+                         p2m_access_t *la, mfn_t *lmfn,
+                         p2m_query_t q, struct two_gfns *rval, bool lock)
+{
+    mfn_t        *first_mfn, *second_mfn, scratch_mfn;
+    p2m_access_t *first_a, *second_a, scratch_a;
+    p2m_type_t   *first_t, *second_t, scratch_t;
+
+    /* Sort by domain, if same domain by gfn */
+
+#define assign_pointers(dest, source)                   \
+do {                                                    \
+    rval-> dest ## _domain = source ## d;               \
+    rval-> dest ## _gfn = source ## gfn;                \
+    dest ## _mfn = (source ## mfn) ?: &scratch_mfn;     \
+    dest ## _a   = (source ## a)   ?: &scratch_a;       \
+    dest ## _t   = (source ## t)   ?: &scratch_t;       \
+} while ( false )
+
+    if ( (rd->domain_id < ld->domain_id) ||
+         ((rd == ld) && (gfn_x(rgfn) <= gfn_x(lgfn))) )
+    {
+        assign_pointers(first, r);
+        assign_pointers(second, l);
+    }
+    else
+    {
+        assign_pointers(first, l);
+        assign_pointers(second, r);
+    }
+
+#undef assign_pointers
+
+    /* Now do the gets. */
+    *first_mfn  = __get_gfn_type_access(p2m_get_hostp2m(rval->first_domain),
+                                        gfn_x(rval->first_gfn), first_t,
+                                        first_a, q, NULL, lock);
+    *second_mfn = __get_gfn_type_access(p2m_get_hostp2m(rval->second_domain),
+                                        gfn_x(rval->second_gfn), second_t,
+                                        second_a, q, NULL, lock);
+}
+
+static void put_two_gfns(const struct two_gfns *arg)
+{
+    put_gfn(arg->second_domain, gfn_x(arg->second_gfn));
+    put_gfn(arg->first_domain,  gfn_x(arg->first_gfn));
+}
+
 static struct page_info *mem_sharing_lookup(unsigned long mfn)
 {
     struct page_info *page;
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -559,62 +559,6 @@ int altp2m_get_effective_entry(struct p2
                                bool prepopulate);
 #endif
 
-/* Deadlock-avoidance scheme when calling get_gfn on different gfn's */
-struct two_gfns {
-    struct domain *first_domain, *second_domain;
-    gfn_t          first_gfn,     second_gfn;
-};
-
-/* Returns mfn, type and access for potential caller consumption, but any
- * of those can be NULL */
-static inline void get_two_gfns(struct domain *rd, gfn_t rgfn,
-        p2m_type_t *rt, p2m_access_t *ra, mfn_t *rmfn, struct domain *ld,
-        gfn_t lgfn, p2m_type_t *lt, p2m_access_t *la, mfn_t *lmfn,
-        p2m_query_t q, struct two_gfns *rval, bool lock)
-{
-    mfn_t           *first_mfn, *second_mfn, scratch_mfn;
-    p2m_access_t    *first_a, *second_a, scratch_a;
-    p2m_type_t      *first_t, *second_t, scratch_t;
-
-    /* Sort by domain, if same domain by gfn */
-
-#define assign_pointers(dest, source)                   \
-do {                                                    \
-    rval-> dest ## _domain = source ## d;               \
-    rval-> dest ## _gfn = source ## gfn;                \
-    dest ## _mfn = (source ## mfn) ?: &scratch_mfn;     \
-    dest ## _a   = (source ## a)   ?: &scratch_a;       \
-    dest ## _t   = (source ## t)   ?: &scratch_t;       \
-} while (0)
-
-    if ( (rd->domain_id < ld->domain_id) ||
-         ((rd == ld) && (gfn_x(rgfn) <= gfn_x(lgfn))) )
-    {
-        assign_pointers(first, r);
-        assign_pointers(second, l);
-    } else {
-        assign_pointers(first, l);
-        assign_pointers(second, r);
-    }
-
-#undef assign_pointers
-
-    /* Now do the gets */
-    *first_mfn  = __get_gfn_type_access(p2m_get_hostp2m(rval->first_domain),
-                                        gfn_x(rval->first_gfn), first_t, first_a, q, NULL, lock);
-    *second_mfn = __get_gfn_type_access(p2m_get_hostp2m(rval->second_domain),
-                                        gfn_x(rval->second_gfn), second_t, second_a, q, NULL, lock);
-}
-
-static inline void put_two_gfns(struct two_gfns *arg)
-{
-    if ( !arg )
-        return;
-
-    put_gfn(arg->second_domain, gfn_x(arg->second_gfn));
-    put_gfn(arg->first_domain,  gfn_x(arg->first_gfn));
-}
-
 /* Init the datastructures for later use by the p2m code */
 int p2m_init(struct domain *d);
 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F603BC171
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150494.278250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RCt-0000eN-9p; Mon, 05 Jul 2021 16:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150494.278250; Mon, 05 Jul 2021 16:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RCt-0000ca-6b; Mon, 05 Jul 2021 16:12:27 +0000
Received: by outflank-mailman (input) for mailman id 150494;
 Mon, 05 Jul 2021 16:12:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0RCr-0000cU-IX
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:12:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c627eb38-8db0-4455-965b-fd9d8148daa4;
 Mon, 05 Jul 2021 16:12:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-nfg0Z1IoPoar0iN8f45gJw-1; Mon, 05 Jul 2021 18:12:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 16:12:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:12:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 16:12:20 +0000
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
X-Inumbo-ID: c627eb38-8db0-4455-965b-fd9d8148daa4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yI8ENYCvOiVvVPyRlAvxJHQLLscO+/O+v8v+irLjSQU=;
	b=ZLN1wkcrAXQ1TyAnp0+K2DedjMxTZCqsoOmHLyV1/OwSD8HCNqSiXjm5l/SOAV2hAqL+00
	B6tA2MrMo/IEo/R/bB/WECalx27Zv7rFPAP6xRX2yj4mDdQHR1vOQyt0FdOW/JNciJYkDw
	ZP6OKDl9qAksmQ1+fLi44fW6aFW67II=
X-MC-Unique: nfg0Z1IoPoar0iN8f45gJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klO1sQULZnu//plWeUv0DFznEeRhrzklkETixQXlaOacL+XOWBRmnEJiUnnxarXFAxXE0mgMRId/zwFYcpUDo8zVOVDU4o3dz9gJWEiLAR6s2REr6xCp+sdz6/IARdQCxzK4GZSF+BtrK9mV3eTaT0Zlvz5VVigC37BvJzxdZcXoJOAuITC7T50J+UUQpLhrpOGz2bp8Jrl8NN4j1sCwXcfPZKI9s3+biNDQEf4gldo5PDvOWgCYYNSfrfIc2pxcyP+IuUhL+b7T10I2HHGNNxfkCqFNN+9fh7ehD3jLq9Ycbyo61L9qog0RKkoxWobKmvTugaqc+fQSUQCTtJh0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yI8ENYCvOiVvVPyRlAvxJHQLLscO+/O+v8v+irLjSQU=;
 b=jZzif3O4XyWaN5ZblSj/dfJgA+bT3tm98StvWUWpkEfZrDt82PknfflHwEB9fdIWl1wFydUW1/DoqPATjULKxEps9+nesLbZutVuQolmkKwUoRBGMcmp6EgQQHke4cwDSUPJoC0o6X3Z7eU5eI+zlx9q7pdDpwTmsgWuIeCrYIMPEbO6zA/I5cxBKw0NBPfvqUzVd4V8wr5wa/qEcZDz6ZYJfBA39ZRmqg18eoFGf4lnpLyEr1wDfpEVPww6wUEzCKgD0pV7s9jFAOqq/vFV0aOksbIdnrB6cFWzoNN87ltfk64UeMoob2YnXAG5aQVZF2KNGLk/8+4o49YZDkYLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 11/16] x86/P2M: derive a HVM-only variant from
 __get_gfn_type_access()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <a940e734-75ae-2660-7b2a-9b426437c48a@suse.com>
Date: Mon, 5 Jul 2021 18:12:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::21)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4932d410-cddd-4299-5f57-08d93fcfaaec
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829357C1CCE91E9C8537166B31C9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AlVHGamxBCuHYuIOcFbBGoGEIHgJpfarT9fMneT5Z7mjbxPwYN4JuRLNfMTCWcgWWl4zE7Byg8UATOQiis4Oo/5HfsbjEnbAtXW4j68+KDoF+d/Ms5xFjO/DUjRftBNYHKfENye3H7IztIeF+e5g6Cs7FbXFZn6X1aTax4fQbk0c8e4royMcp2qkzbVE+jjNsiKvlp/9c+U7WgjpNJAG8dqoSrOc4C3hKX2wOyDu4vlZsSy/KzTCBHTxfEWNnABwURAA8DkpH4UllBpMc/yx9zamf9JNPhrMlZR/bsewlZCjGMgeAjL2VYTGDb+YfhAc9mlqELFypuX62C143eUsWsDpZLVhB8cLROIA1TkFaYG37es3udX4q2E+xu4aQYMMHQLZSD8vu78tsJdUQoAW5aYIX0e7Y5BmG10d24QCpCRC6dwLQnOkcMjbrDr4u+jguc2ZFstSa5Z2AJEZKFAFK7HcgjrcCo0praqESpT6qGOanUuIdObFBOV9so8xcfJRU0Gzl1JDnbPKtJnmaDhy9Rc9IVoKNPKkEyN1KgFfSNKA/ipc8brNHIouE4f2rsKgTonsi55Px0SkuFRfG8QeE1moT1yXN97f8ZpRSknwvauMYLAR8iwaPyGMwrAWRGi5dx1sofHsQ8kUVYhslUrYAGmYyJyYyZmIBh2CvHwfkJpQdKP1YQLNIzktxxF9wkBB6TCUavJa4RjWnkQDvGrnov6Opzgj6egMbNtHOs5Yma8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(6486002)(26005)(16576012)(478600001)(2616005)(956004)(86362001)(2906002)(6916009)(6666004)(316002)(83380400001)(8676002)(16526019)(66556008)(36756003)(8936002)(38100700002)(54906003)(31696002)(4326008)(66476007)(186003)(66946007)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlR2MkdrTFk2a0JreHFXcjFBd1ZmdDEzUjRmVTNuTWd6MWdTalJPSkhacEdE?=
 =?utf-8?B?ZjM0OEltRi9qVFVDRkpPT1h2ZnB4ay85cnF2UGtYTEo5T0FGTDkxVytrb3M0?=
 =?utf-8?B?bEVzRVU5ZVo2a2NKQ1lRbC9qM0ZCS2s3d1g1OWVLSE1aNTVpc05jMXo4NVlk?=
 =?utf-8?B?WEEvd0MzZU53UEJSVXlSTE5obEpMN1I5Rjg1Nnd3ZnArQno0NENaY3dMcFpt?=
 =?utf-8?B?aWV3dkFNeTRrWnZLOHAvZVo5RERMRkVXdkd2bnRVS2pUY2YrQW9mdXdtcFJC?=
 =?utf-8?B?TFhJNHZ5MlJ2b1RDNFhhRGhackxtT3Z6dTZrTWhVd1JscVZPb3BPa1hRbEYv?=
 =?utf-8?B?R2ZNZlpwWk94SkhGWGpnWHdlWVRvQXB0WSs1UGh3dDV2ZC8vVWRvbmVRSmMy?=
 =?utf-8?B?SUltUXBtZ01LMU54dkNzQjE1UUtFZlNUaVdKaFRyUmUwZHZzU1VjVjM5YTJF?=
 =?utf-8?B?RVloeGFjeDNlOFN0K2tWbE5WN2FoRUkxQ2Q0REZrRGJaU05mYnVmeHhueU1h?=
 =?utf-8?B?b1habHBzc3JDRFF2WEdRZmJIczBJMWdHREkyY3Z2OFpQYkd2ZTVuMm11WDdi?=
 =?utf-8?B?VldIa2lvejdJcHNkRDdyNWlUby9NazBUN0pUZWlvVElpSUhWQ3F5Q1NpRnRX?=
 =?utf-8?B?TktzR2JNSkNob0ZQRVFXMkcvcFJLdWI2RDM5QXJYVDcyZ210OGhLdkt5Ukp3?=
 =?utf-8?B?RDVMYnVvR21qTVpwY3h0enNoelMrL2VTSkdsQjIzRnBrRVVkb1UxZ2x1U2Vz?=
 =?utf-8?B?K0FEbzhYd3hDMnFndG9vVUN6MnUyVFJmYnUydklvaWV0ak4zbG5kVEdOeEpO?=
 =?utf-8?B?Zlhpb1YyRGdxd243VWsyUlBGU1JMencyTFlOV2tKUzVMNFZFUmp4dFhHMFRy?=
 =?utf-8?B?Zk90RklIeHpoS1BhblRYajNZS29md3puNkQ4VDd3T1EvNGhTaVYyd245cW5h?=
 =?utf-8?B?VS9vVkNacFA1dkFnYzRLY2p3VUp5ZmdTZ25EZkcwR1hLY2t5NG9zaHYxS2x5?=
 =?utf-8?B?TFlyRHFZeDhKUVFEb3poVWJWczNPTDRPelIwblEvam90dC8vR3dRVXVXcXN5?=
 =?utf-8?B?UmNVdG5oNGdWdjFSYk9mMVU4eklkeXFoTEc0MURRZUdwM08wU0VnMnlxd09Y?=
 =?utf-8?B?SUNWUHk2R3ZuYWRLcVlGZEQ1Q3N5Nk91RGp0R003R1lxWEV2Mk1sNksyVFBr?=
 =?utf-8?B?MmFhKzdaM241SzRsNHMrTXRiRVg1bUxaRHNFZlAra091RWRlOFVPSGtIS2t6?=
 =?utf-8?B?NTR5SEdKczZzTWtZbFY0ZnlCNHRqMHZJUWVuRzEvc2dNQnE3MkQ5T0pSZmxT?=
 =?utf-8?B?bXdEYzFHZ2tZMFNLVlJ6RktEN2xIQzlzVitFay8rU1daYWZ3ZlVHc2ViME80?=
 =?utf-8?B?SFVNZmxoRkEzamFLSHpHbkswWTl3YkJxcGR6OUpPWUdyalA2ZjgwOGVRTjVT?=
 =?utf-8?B?ZkptNDQ1b3d0ZjliT0VMRW1ubkJaSG9TaS9Ob1J1VjRmNXlPa0RzTnVEME5q?=
 =?utf-8?B?V2h3bkEvaWJCWnQ3WmlZV0R6TVgxc2Rza3czTkxyNzNIeE1uVEY3aE5wQisx?=
 =?utf-8?B?eFRnQ3BMU3pkTnNRbTJuYVlFZVI2d0RBRzFOcy9TWGFmbkJrajY2UG44N0NZ?=
 =?utf-8?B?bHQ5N3U1aUpkTm1YWVNFMGJ0NmpQN2NlKzhnMHZzUG5YNFIxNnV1WVMyM1My?=
 =?utf-8?B?eitvZGlNRGdJSGR3dWNoMzdmZUdONzNUblhHZFAweVRCZXRuUXV4YUFwd0JR?=
 =?utf-8?Q?+9Kq9h6Q4jJ544Hoal39+m3CE/tzGhXBZKy7taM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4932d410-cddd-4299-5f57-08d93fcfaaec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:12:20.9272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qm9skyo2jG38lXY9rCzAMxlNn2hBAs/A8LOvXWoxM2/Y/BqKUnBRzfEyONhsC/44C3Ftj42OT4XSSTmMo4lnpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

Introduce an inline wrapper dealing with the non-translated-domain case,
while stripping that logic from the main function, which gets renamed to
p2m_get_gfn_type_access(). HVM-only callers can then directly use the
main function.

Along with renaming the main function also make its and the new inline
helper's GFN parameters type-safe.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1711,7 +1711,7 @@ static void svm_do_nested_pgfault(struct
         } _d;
 
         p2m = p2m_get_p2m(v);
-        mfn = __get_gfn_type_access(p2m, gfn, &p2mt, &p2ma, 0, NULL, 0);
+        mfn = p2m_get_gfn_type_access(p2m, _gfn(gfn), &p2mt, &p2ma, 0, NULL, 0);
 
         _d.gpa = gpa;
         _d.qualification = 0;
@@ -1736,7 +1736,7 @@ static void svm_do_nested_pgfault(struct
     if ( p2m == NULL )
     {
         p2m = p2m_get_p2m(v);
-        mfn = __get_gfn_type_access(p2m, gfn, &p2mt, &p2ma, 0, NULL, 0);
+        mfn = p2m_get_gfn_type_access(p2m, _gfn(gfn), &p2mt, &p2ma, 0, NULL, 0);
     }
     gdprintk(XENLOG_ERR,
          "SVM violation gpa %#"PRIpaddr", mfn %#lx, type %i\n",
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -299,8 +299,9 @@ static int set_mem_access(struct domain
     {
         p2m_access_t _a;
         p2m_type_t t;
-        mfn_t mfn = __get_gfn_type_access(p2m, gfn_x(gfn), &t, &_a,
-                                          P2M_ALLOC, NULL, false);
+        mfn_t mfn = p2m_get_gfn_type_access(p2m, gfn, &t, &_a,
+                                            P2M_ALLOC, NULL, false);
+
         rc = p2m->set_entry(p2m, gfn, mfn, PAGE_ORDER_4K, t, a, -1);
     }
 
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -478,12 +478,12 @@ do {
 #undef assign_pointers
 
     /* Now do the gets. */
-    *first_mfn  = __get_gfn_type_access(p2m_get_hostp2m(rval->first_domain),
-                                        gfn_x(rval->first_gfn), first_t,
-                                        first_a, q, NULL, lock);
-    *second_mfn = __get_gfn_type_access(p2m_get_hostp2m(rval->second_domain),
-                                        gfn_x(rval->second_gfn), second_t,
-                                        second_a, q, NULL, lock);
+    *first_mfn  = p2m_get_gfn_type_access(p2m_get_hostp2m(rval->first_domain),
+                                          rval->first_gfn, first_t,
+                                          first_a, q, NULL, lock);
+    *second_mfn = p2m_get_gfn_type_access(p2m_get_hostp2m(rval->second_domain),
+                                          rval->second_gfn, second_t,
+                                          second_a, q, NULL, lock);
 }
 
 static void put_two_gfns(const struct two_gfns *arg)
@@ -936,8 +936,8 @@ static int nominate_page(struct domain *
             if ( !ap2m )
                 continue;
 
-            amfn = __get_gfn_type_access(ap2m, gfn_x(gfn), &ap2mt, &ap2ma,
-                                         0, NULL, false);
+            amfn = p2m_get_gfn_type_access(ap2m, gfn, &ap2mt, &ap2ma,
+                                           0, NULL, false);
             if ( mfn_valid(amfn) && (!mfn_eq(amfn, mfn) || ap2ma != p2ma) )
             {
                 altp2m_list_unlock(d);
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -286,25 +286,13 @@ void p2m_unlock_and_tlb_flush(struct p2m
         mm_write_unlock(&p2m->lock);
 }
 
-mfn_t __get_gfn_type_access(struct p2m_domain *p2m, unsigned long gfn_l,
-                    p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
-                    unsigned int *page_order, bool_t locked)
-{
 #ifdef CONFIG_HVM
-    mfn_t mfn;
-    gfn_t gfn = _gfn(gfn_l);
 
-    if ( !p2m || !paging_mode_translate(p2m->domain) )
-    {
-#endif
-        /*
-         * Not necessarily true, but for non-translated guests we claim
-         * it's the most generic kind of memory.
-         */
-        *t = p2m_ram_rw;
-        return _mfn(gfn_l);
-#ifdef CONFIG_HVM
-    }
+mfn_t p2m_get_gfn_type_access(struct p2m_domain *p2m, gfn_t gfn,
+                              p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
+                              unsigned int *page_order, bool_t locked)
+{
+    mfn_t mfn;
 
     /* Unshare makes no sense without populate. */
     if ( q & P2M_UNSHARE )
@@ -329,8 +317,8 @@ mfn_t __get_gfn_type_access(struct p2m_d
          * Try to unshare. If we fail, communicate ENOMEM without
          * sleeping.
          */
-        if ( mem_sharing_unshare_page(p2m->domain, gfn_l) < 0 )
-            mem_sharing_notify_enomem(p2m->domain, gfn_l, false);
+        if ( mem_sharing_unshare_page(p2m->domain, gfn_x(gfn)) < 0 )
+            mem_sharing_notify_enomem(p2m->domain, gfn_x(gfn), false);
         mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
     }
 
@@ -343,9 +331,10 @@ mfn_t __get_gfn_type_access(struct p2m_d
     }
 
     return mfn;
-#endif
 }
 
+#endif /* CONFIG_HVM */
+
 void __put_gfn(struct p2m_domain *p2m, unsigned long gfn)
 {
     if ( !p2m || !paging_mode_translate(p2m->domain) )
@@ -377,7 +366,7 @@ struct page_info *p2m_get_page_from_gfn(
     {
         /* Fast path: look up and get out */
         p2m_read_lock(p2m);
-        mfn = __get_gfn_type_access(p2m, gfn_x(gfn), t, a, 0, NULL, 0);
+        mfn = p2m_get_gfn_type_access(p2m, gfn, t, a, 0, NULL, 0);
         if ( p2m_is_any_ram(*t) && mfn_valid(mfn)
              && !((q & P2M_UNSHARE) && p2m_is_shared(*t)) )
         {
@@ -1666,8 +1655,8 @@ int altp2m_get_effective_entry(struct p2
         unsigned int page_order;
         int rc;
 
-        *mfn = __get_gfn_type_access(hp2m, gfn_x(gfn), t, a,
-                                     P2M_ALLOC | P2M_UNSHARE, &page_order, 0);
+        *mfn = p2m_get_gfn_type_access(hp2m, gfn, t, a, P2M_ALLOC | P2M_UNSHARE,
+                                       &page_order, 0);
 
         rc = -ESRCH;
         if ( !mfn_valid(*mfn) || *t != p2m_ram_rw )
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -453,10 +453,27 @@ void p2m_unlock_and_tlb_flush(struct p2m
  * After calling any of the variants below, caller needs to use
  * put_gfn. ****/
 
-mfn_t __nonnull(3, 4) __get_gfn_type_access(
-    struct p2m_domain *p2m, unsigned long gfn, p2m_type_t *t,
+mfn_t __nonnull(3, 4) p2m_get_gfn_type_access(
+    struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
     p2m_access_t *a, p2m_query_t q, unsigned int *page_order, bool_t locked);
 
+static inline mfn_t __nonnull(3, 4) _get_gfn_type_access(
+    struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
+    p2m_access_t *a, p2m_query_t q, unsigned int *page_order, bool_t locked)
+{
+    if ( !p2m || !paging_mode_translate(p2m->domain) )
+    {
+        /*
+         * Not necessarily true, but for non-translated guests we claim
+         * it's the most generic kind of memory.
+         */
+        *t = p2m_ram_rw;
+        return _mfn(gfn_x(gfn));
+    }
+
+    return p2m_get_gfn_type_access(p2m, gfn, t, a, q, page_order, locked);
+}
+
 /* Read a particular P2M table, mapping pages as we go.  Most callers
  * should _not_ call this directly; use the other get_gfn* functions
  * below unless you know you want to walk a p2m that isn't a domain's
@@ -468,7 +485,7 @@ static inline mfn_t __nonnull(3, 4) get_
     struct p2m_domain *p2m, unsigned long gfn, p2m_type_t *t,
     p2m_access_t *a, p2m_query_t q, unsigned int *page_order)
 {
-    return __get_gfn_type_access(p2m, gfn, t, a, q, page_order, true);
+    return _get_gfn_type_access(p2m, _gfn(gfn), t, a, q, page_order, true);
 }
 
 /* General conversion function from gfn to mfn */
@@ -509,7 +526,8 @@ static inline mfn_t get_gfn_query_unlock
                                            p2m_type_t *t)
 {
     p2m_access_t a;
-    return __get_gfn_type_access(p2m_get_hostp2m(d), gfn, t, &a, 0, NULL, 0);
+    return _get_gfn_type_access(p2m_get_hostp2m(d), _gfn(gfn), t, &a, 0,
+                                NULL, 0);
 }
 
 /* Atomically look up a GFN and take a reference count on the backing page.



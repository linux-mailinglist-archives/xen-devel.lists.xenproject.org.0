Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1079A464D54
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235962.409299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msO9o-0001eM-77; Wed, 01 Dec 2021 11:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235962.409299; Wed, 01 Dec 2021 11:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msO9o-0001ag-3I; Wed, 01 Dec 2021 11:52:16 +0000
Received: by outflank-mailman (input) for mailman id 235962;
 Wed, 01 Dec 2021 11:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msO9m-0001aD-LK
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:52:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f99ea94-529d-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 12:52:13 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-8Sv8aH-JMdaPmLWtdMHVfg-1; Wed, 01 Dec 2021 12:52:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:52:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:52:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0058.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Wed, 1 Dec 2021 11:52:10 +0000
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
X-Inumbo-ID: 1f99ea94-529d-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638359533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jFiFW1A5HX6NQdugw21gayywBYK+vQSEiTp/bOCwvUk=;
	b=Mvij0ji9DSMjxqrYNiCw6JzfAYaIWYg4lozKY5IymnLfuTSdCrnBFvS9lmjQyRn5+uIGOV
	XeCycDq3yMrbg5xiUfccp7uaamd9OLLOu+sdO6iddaXCCP0KFUvSoOLPNpnWvjGgNGXSQY
	1RdWeMbqwNDWizSnaNWZzrA4YFRYw8c=
X-MC-Unique: 8Sv8aH-JMdaPmLWtdMHVfg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8+QdujFIaN3lpbRGY9kl0J35q/jeHmqhfiBUDkOpHJR4ztwbhfJs/LXIfXZoI+LeoAd4Oz0Daj0iLCx3Ub1RkTZjhskgo0QJej2IdCvlW2Rc8c6gkEUaDF8E6l7xmpSFLmY+EYQHz4FiqUdSRfvcdYx2Mur8q6J4CFMdsiyI8AuGQrFeN7sWveWCQweNTxRuEvJ2ihUNFpll03KC9sKmBeuedD+/TdjhfS65olDddystgrfr3Zv1sLJwtPOo/HD2WyN+OkX3xrcOKpfEqude/8NlKTBqsejBMVnzPa/BoT19c3+CEU4Y06axZ2RuIGQR/fbPlPHBbxTADP60UO0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFiFW1A5HX6NQdugw21gayywBYK+vQSEiTp/bOCwvUk=;
 b=kzQHidR1fSJWaFpb08kVjAvMnorPNx54ervEN7SBfGf83KY21CtqU4oQ+2j24w+zufeC2RC5sjcTylVCaDksWt04domeoehGIJg4Mk92Aa6+lLEzkEj7zHnxgxZn7mmMaWijpop3OhNC5KVLHQr6RKORwZvPTZlNYa/9u5hh1D3kwCq0uUkrqwwyGSGDwxKtsrc13xrGPDaM44w4N/kHVSuLaAX/cCJJ8eWIuVrAd6c9k0z1UFrlLZ9qcobFfNeQ9092JB91Y6uGP9/bq17H4dOcHBNt4xiTgoac4sfs8Rd72of8ua9qwGvDnUgiy/7XZb+RbN+EjDZmcEIS+PNHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e698a39a-f9fc-18d7-07cd-d0b9da9c0eae@suse.com>
Date: Wed, 1 Dec 2021 12:52:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/2] x86/PoD: move increment of entry count
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
Content-Language: en-US
In-Reply-To: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0058.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c27536ab-408f-4c8a-2af3-08d9b4c10229
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB559803D103399B3FC97F87F3B3689@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MSY9GOsxx4vAmZ7TZnoSztFFdyXAc9sUATNaauHB50L5kOc18ilYGvkUuw172ai9PMMsiO4Oea7PFP5AJVFbDcGeD5I9FX4wxxDgk+bFi8V41OWD5u5D/R8ncpYmbMMllBRyE8gpkclIHVICdxNIvea8jXChCx6vGWDTHxNX+A5wqt/+kdjIZqGeJjkAiYzY9oRNLmpVBHOnAPl7zo5Pp3ejboqujiZypAy6mdG0Qb7ysyk7qqWWYvmmgSQ80YxgTvSGvKSENmtppRD2VWXd1qXYHRJI+J35bkilgCpTRMxDE7i/PMumVIEcjSZ/3zQFY198aoGuVSpQD4k5X7ybyuv8zVLFbyMkJHqZDVnpJvmH4gtRuWHrsmlwy2CT7oJK9UhrldzbXRIACGaMfkDXvPlMsDdS2X5FyXmp0UCVeNZlV4C5H9xYsqeh5O3eGDGnERG1F2NmLuXm0yHUcuwSTlCEEcrIs8n1lVaX/JUE1EV8cfNm/ydNGEsyeTzEoaAF4714xfFuR255h98DFq7I8WvR7fpFBB82dN2AK+ogYKgwX/dQRhWpz6PFdeKTD3svGJCOONBmbOrO+GuyG+7sEEmdDW8bXdWPK+GVM6lhLfR2h+zSn2y80kjyxwIC3yHiYu4+TciDUkZutbXNi/p8phEcprbGizX9SbxgS+/m5otr49HXujkK9o2nr2C2NBxPPUHzALrlKg2jtF87hn353sgV5lB4b+J2oZ7xts8KuDdyHEtSlePdbZtkPFHAW186
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(8936002)(8676002)(66946007)(66556008)(31686004)(66476007)(316002)(2906002)(36756003)(83380400001)(16576012)(186003)(2616005)(6916009)(86362001)(38100700002)(6486002)(31696002)(4326008)(956004)(5660300002)(508600001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVV6dWYyb0c5SVVwQWIyc2twS01ESSthYVd3Yk9WVnVuYnJjbzlGR1FublFE?=
 =?utf-8?B?M1UzQUJ6QWpDS1hzN2JhWXB5YjA3VEVTall1eVVRekNCMlNKTHcxUUFJSDA0?=
 =?utf-8?B?WTQydjZuNS9ydHRicmZNNlkxL3BpazNMbWgycHRmdlRQYzhzMzFicEdQR2xZ?=
 =?utf-8?B?elkvSDFHMHBrQkdtWTBvalN5SlUxb1FhTjNITnJ0QTlaU2ZwcHp2OWR0dk9M?=
 =?utf-8?B?emg4R1VTaC9WSTB6RVc5NTMzbXZuam5QZWhVM1pPUGRoRS9Cb2l1OGJPdXBG?=
 =?utf-8?B?STZEbmdnbkhLMlpHdGp0cTQ2Ri9yaks0cmFLclhjRTVUcTNpVnhhVGFQNjNO?=
 =?utf-8?B?YXczK2lrZTBjQnR5a05oUDJPaFAzWFUwVUgwd243dTdiU01rWm9YbHdidE1C?=
 =?utf-8?B?U3NWRWJKUTFUVlprNFFseG5vNGUyL0VWbzN5R3NkVmp0eEI1OEY4M1kwTmdw?=
 =?utf-8?B?NlNpeElrQTgyaUF0enBBWEd2MjFXVDRoYWlsQXp4TmJCTEorZ0R5RUZJeUlK?=
 =?utf-8?B?eEg1eHhWYmNzMDZRa3NSSGZBNnNTd1J1ZVNxbXVDSllIVGpjaFE1UkRhOGhO?=
 =?utf-8?B?M2pTUVdyTUJqenh4S0NnbW8yb3VMM1MwNjdNSEFyZUdLUFBldGNrQXU5R2V0?=
 =?utf-8?B?YkNwa2dtcFBXcXJoOHJkQzhPTkQ3djQrN1V5UktGNUg4NGQ1ZTFuZytsZTk3?=
 =?utf-8?B?VWlLbXhteUp5dE9qejl2Yk5TeTRmT3JsaHd5VXRtaHc0bWR6UlMwR1pGaHdl?=
 =?utf-8?B?OU9rK2FNRTVlRWFrQnVXODJ0UndON05Vc1ZYeXIvbDVvMnZ1c3ZCTXEyU1Fj?=
 =?utf-8?B?a2ZwNW1KNUFVOW1pWjRXdkZpZW8vTmt2K0xUY2IwRzRFdTFNZXBPS3E1ejdK?=
 =?utf-8?B?ZGg4NFpBQmxEQXpKK3duSGRNWHE1clhvamJ4cldqNkxlWi9TSi8zMTFnTlpG?=
 =?utf-8?B?MkJsbUR4Vk1nTk0xQTlCQjB5L1dnZ0FxcXBWaS9WSTdDM3ZTSkd6ZlBuVndm?=
 =?utf-8?B?Slg4d1pSS3N4R2Y3bE9jOWRxN09WYlJOU2NROXJTeHlqNGh6d3VKSG14aXR6?=
 =?utf-8?B?MWNEd3JuaGUzdktzR2VmeXp0OEhaMDZERXd5Qk4zdEdxQUJhRkV5cS9MWStW?=
 =?utf-8?B?b1FmVjJSc2haZ3lmRVN5ME00NUdxYlVGVFZQbjIwWGszeWNacFg3aXdHMVJi?=
 =?utf-8?B?QVcrMkhQbDBOMkc2WCtUdFJMQkNGeUkzbnYralptcHB6OWVOVnppMmZaeHlU?=
 =?utf-8?B?TTZleVV5QklpN3h1RnRNUXFHcCtkUnl6azltNGkxcE9OV2xxMkNFRE05Tmpp?=
 =?utf-8?B?c0FnWDVJWU9ocFNkSzIwTGJlUzhHOE5RRzFJTlJCckxYUFh1bjVENCsyT1dm?=
 =?utf-8?B?UXVxU2JNYVpJc3N2NGJxTkRoRVlFYi9nRjJpQVZFMjBsSEJCN1FYR3U1eGZh?=
 =?utf-8?B?MDFzNWQ1Yk9SSzh2aU4vSGJ5b2VMb0pFVDk1dVlTY0xDUkZDOTYzNitjS0dQ?=
 =?utf-8?B?aEgyM0pMdWZZUEZ6eTBxYjRaVFJaVXlFZ0dSWE94ZUk0RjRhMHVRdXdSeS9y?=
 =?utf-8?B?MERYc0Z0UFdTN2pwclpxdTYweDlmd0FWL2FkMWxQNUdVZUxDamFFRlltSHR3?=
 =?utf-8?B?TEQxSXJiMGtuTncvK2ZLeTJMNmxnSG5WRmtSTnBrTHZpcE5PTVAxYnBqZWVN?=
 =?utf-8?B?cVJ6TC9WTG4wQVhMQmJZSFd3OGk4d0hybGZ0UHd3eDhxSGU3TXZrQklJNlhX?=
 =?utf-8?B?cVVEM0RZeGtLdXVWcVV5WFMvSkhiOXJaMnFiYTZoTzJRcWx0RW1KYlgwN3VP?=
 =?utf-8?B?Rm5pdEl5ZGw5QTBGQyt1czNBNjlNSEZEaEdua1BmNTdwS1ZneTdNamxJMG1V?=
 =?utf-8?B?M0c2OWl5UWhjeVNxa0JIOVBVRVkwdHJrcUlNdytNU001eko2bWEydDZkaHBG?=
 =?utf-8?B?U2ZIVDB4RWtZdlNOWVg3eUV4SmJ4cmFxT2U5S2F6clVKc0dHMGxxQ2pma0pX?=
 =?utf-8?B?czVoSUxKVzV6RTZLc2Y3RXFRN2t4SXM4YkRVeU1Kb3dtTHZjeUpzWHFBdnZx?=
 =?utf-8?B?aVBVYnErSVArYWJoWGdQSTBXU2xBcUk2cmZmUEhiWEh0TGhkeVh1Z0VlM2lG?=
 =?utf-8?B?K1poTlB3YlRDWW1Ib1BjditTWHVWbjI5MENCRWxVOTRCeTloSW9yNy8za3lj?=
 =?utf-8?Q?tlfqtLmS6S8zLie3ui10kwk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27536ab-408f-4c8a-2af3-08d9b4c10229
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:52:10.9005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8LjKjPJCDMDZbSZcA01SaBqPeFtwvkHMRmKNoNvRwGe+CWrf5d6bDlXG/wK3XL05kBzLit4ncb1tNKQi7+1eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

When not holding the PoD lock across the entire region covering P2M
update and stats update, the entry count should indicate too large a
value in preference to a too small one, to avoid functions bailing early
when they find the count is zero. Hence increments should happen ahead
of P2M updates, while decrements should happen only after. Deal with the
one place where this hasn't been the case yet.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Resending due to the original submission having had the same contents
twice.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1345,19 +1345,15 @@ mark_populate_on_demand(struct domain *d
         }
     }
 
+    pod_lock(p2m);
+    p2m->pod.entry_count += (1UL << order) - pod_count;
+    pod_unlock(p2m);
+
     /* Now, actually do the two-way mapping */
     rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
                        p2m_populate_on_demand, p2m->default_access);
     if ( rc == 0 )
-    {
-        pod_lock(p2m);
-        p2m->pod.entry_count += 1UL << order;
-        p2m->pod.entry_count -= pod_count;
-        BUG_ON(p2m->pod.entry_count < 0);
-        pod_unlock(p2m);
-
         ioreq_request_mapcache_invalidate(d);
-    }
     else if ( order )
     {
         /*
@@ -1369,6 +1365,13 @@ mark_populate_on_demand(struct domain *d
                d, gfn_l, order, rc);
         domain_crash(d);
     }
+    else if ( !pod_count )
+    {
+        pod_lock(p2m);
+        BUG_ON(!p2m->pod.entry_count);
+        --p2m->pod.entry_count;
+        pod_unlock(p2m);
+    }
 
 out:
     gfn_unlock(p2m, gfn, order);



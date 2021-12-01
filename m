Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B11464C10
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235849.409088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNEe-00011t-LJ; Wed, 01 Dec 2021 10:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235849.409088; Wed, 01 Dec 2021 10:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNEe-0000zH-Hl; Wed, 01 Dec 2021 10:53:12 +0000
Received: by outflank-mailman (input) for mailman id 235849;
 Wed, 01 Dec 2021 10:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNEd-0000Oa-1d
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:53:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df86d3ef-5294-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 11:53:10 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-58fWeLOpOBeox4l2FTO6pg-1; Wed, 01 Dec 2021 11:53:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3534.eurprd04.prod.outlook.com (2603:10a6:803:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 10:53:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:53:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0105.eurprd06.prod.outlook.com (2603:10a6:20b:465::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 10:53:06 +0000
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
X-Inumbo-ID: df86d3ef-5294-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638355989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kRxZT307uKBK1UcuellO4ewXtOz3JX0bF445MqtSGI=;
	b=ivNMOY2nAc+tNy3+BV1yA8Eg0zoVicryiZ/K+t2mZFLUGJmqkcOmqUp0iuzzUThRAKsNJp
	oMNHZIt0ooAK3N0BUTRiDhGcVSeYRyNaizuIA8iqvUJ8xTfBFtH/06k+TWs/Uc+Os7f5aI
	qYWu57M7YXOyZi/17V9Zy0vtwN5gAUg=
X-MC-Unique: 58fWeLOpOBeox4l2FTO6pg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mK0slyE5Fpd+FEfeZnOu93036UbDylk0wsdKvXFXXEW4sS7kJ3/hClRNecSA2EZPAo96OCM3WqXeCmeguczysO/VsHgCIFm/W8DDTF/L2rvSgquZM0Bx2mtFEPzBjW6lCfv/3sGUWYsFluUPzSFWiEYLjxs3Ypc5eiLuLO9pHvFoKwaYzu9fklacqZIuSjvqcCSM5qXSR6LGGgyluhfQTp75OIuww1wkJIzTdvbUFZHan/r2Iu+RTkI40tOSmdHk33L6i5Hk7vqnWrxKXt00fnjuZw/Dy7w1Mz2m4pwSKQfbp8uVjLWgT3bx+AGbWWazyddEMFgHHMu92aDlmL2PgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kRxZT307uKBK1UcuellO4ewXtOz3JX0bF445MqtSGI=;
 b=ezvo8V75ITWCQpX+xt25eElDvGGwn893OCG4oayXeF0wwerQBXrdwah6gX1FlqWZK7U7Wl0anbmMVS/eUCtMjCSjTj3OsXiGcpb9tkaxvp1kDA82JWRwVuSUMAe90FAFahBu65hYemyR3HpZDHxs8cduxfLBB7xBHYoMziel19wjAfstORAauYwioHda2itKM9GW8pxEWvug1a1U220ADHIMQYYMKXs0p8CrmkjCNaup46zHeoMg9d+hS48VIs34g2862lxj3D6fCl58kEXvzaH6vt2bhicgnJZlkKKFKACPQvPW7fKMYIKzDZvavoMHjtkb1pL1QYlTDQs6opZHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2525b63f-f666-2430-2c22-b1b7b0d5d7f0@suse.com>
Date: Wed, 1 Dec 2021 11:53:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/4] x86/PoD: simplify / improve p2m_pod_cache_add()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
In-Reply-To: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0105.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 667d2f9d-01b6-4853-d4a4-08d9b4b8c1cb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3534:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35349AC8C360CCE0E59AF57CB3689@VI1PR0402MB3534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u6OsVc6HhwPpEvW1f1fXKfGR0G+R77edy/BK6n8lwslUMrqKKaZego89DhfGWjBpl7d7wr8ahT72OnkG87Pol1wvJMwQ9C9AKazeeeMFsLDYP7bT2nVus6PY8DLBCdnQTu3iBvXIWpd2g/KTeltTM83E2M8rXkAVfzWfCKbzHPTub1U+WXQusvb4C0Zmt+CWfsdYNDqsQgA8HXfIOqfuC67Qbb3waQ6nQGYH6Oc6nQXwnzUXYmfafI/5eF2cnaItmkp24opkgdh+3s86tx5dCl+4UtSMkhB3mSTbwbg24Vm4UpxJxG+ut8Mkxd2Y1I9DGbFOMGIEOcsGs51j1GNMNs9MICNFr2zDuTmicEcp6pEcY6WmNlW7pZbHIqHOh4BZSqGZBSATgOKptIhC7b+q7yJ43M7TyDKDEa2gZXEy/A8XSPECihg1PsYKQesxJwjyS06OQjYs9JuMhFldi3+mpNvgILdAe58V+YfxwTURTSc5crmp5QD3IOMg+Y204Tz5eZgkFio7zkH27gCNQt8JQTc/epESyGs+d4h8q3mSZ4NF/FZCbaS2FUWarVedGcpPcbP/2zE8FzEoaKdQmCRV/+NHDCpVI3Y4gqK/LLRA1rcEYh85Oa2mpuDBp8LtXR66GkHQtY39L+tNm/iIu3Og49xTmqAtjlN9H4rjUNwEbW71LizY8qznzG/3W/2LLCMuUPvK8piLpSgiz3PpwNclnbG7GsREoXL3cizONfi5AkFn3mhxxKp9YWXsT9EqrVnI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(956004)(2616005)(36756003)(66476007)(26005)(6486002)(66556008)(54906003)(508600001)(66946007)(86362001)(8676002)(8936002)(316002)(5660300002)(2906002)(38100700002)(83380400001)(16576012)(6916009)(31686004)(31696002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0p6TzJSSWx4b3hnKzlmMm5OaTdTaVNNdGxKQjFjODFpL3AyZU5KSms1Vy9R?=
 =?utf-8?B?K1dHdk5xUjVIZUoyOVFaakZNV3V5RVR6MU4zc3pndUwxd1A5U2tLRHNCaHl2?=
 =?utf-8?B?dEdkd01QeEpGTGhhaDlDR0N6clprSndpNzd3VjA4eXZqTGdKWTgwOWJ3ZE10?=
 =?utf-8?B?NkRJSUZqaS8wRU15ekhidWNHODloaHh0R0JQRDVHcUdXZC9laUsvZGlGQ3pt?=
 =?utf-8?B?eGN4QzVOOTlBSU52NmU1UWo4WTF1N1JtemJUZ21iZ09Qc3N6dWxRQzEzNTNs?=
 =?utf-8?B?ZU1VaE52NnpmNThHT1hmM0xSY2hsMTJoQUY3Z0N6T0lBaFZpcWNGNTlSL1Z4?=
 =?utf-8?B?Y2NXZTdUUC9mTTQrZ29CdmprZTRPTUwwaHUwNk1pRVI1UnN2TVNoUzZoeUlX?=
 =?utf-8?B?TzJFcHc2cTdpaXg5V0VUa1VsSUpDQmpreWNTVjI5UWNrY0IrNGUrcFd5S2xr?=
 =?utf-8?B?d1VTdy9xUWtJZW92K3F0c290NDNmQm5Za3dON0dIbEh6dWVBczMzRWc0TFFa?=
 =?utf-8?B?VjdOL0xOWWVFcTcvUmVvdktkNzRTeldxZ0RqbWZ1N01VUGptVTNJck9xQlJS?=
 =?utf-8?B?WEdaTmlLMG9TMHdXWjVTUE5DNUhDRldYaGdJaC80YXNVVG0yUVdsaTdBcVpG?=
 =?utf-8?B?RTdYcklOSTZMbEdpd29teHdubElDWDNJdmF4QW1oNkxSZ3NxU0h1VHBqQmtY?=
 =?utf-8?B?NUl5OUpod25ka0tYcEFLRFNDVTAvRTJVUWRhcWRtNC9EOGZPR1JKTlQvMVNF?=
 =?utf-8?B?SFdsUjJnUEtkSkNMTDhiaFRkNUhVTWZEVkFrNmgyWmdFMFE1b1RWZW14RWph?=
 =?utf-8?B?cVlnRGpCMkxNY2hOVDZPMGxnTTZjaXRtNWRacDkzamkwUVM4dkhNS1JlK3hj?=
 =?utf-8?B?UXhuWU5yRmJ0cTgwV2wwTmVIRHNMWDBGL2xndTdoYkM0VlN6UGVmZ28rcGxl?=
 =?utf-8?B?VmZrVWFobWoyTERwdE1VY2VncXowUWk2bFVLRHlGR3hDY0tQL1BZdjNUWW40?=
 =?utf-8?B?bk5BeFd3OXJoQlRIb2lDNlBvd1pDTTVoc1dmaDRiQTE3QWJkN3NVVG9kMXFa?=
 =?utf-8?B?Zm5pZlY0aTNvS0VCM1YxZ24xd3BiU1lhQXFHNGptUjUvaWZkUUp4QVk2dlcy?=
 =?utf-8?B?clBTWlhwZ2dhQ3JYQlI2WDBzeDZpcklBbjcwVUNiN1djVTlaMzdFejVrSXBQ?=
 =?utf-8?B?V0lNUDYzaGNhVlQxVmxZQStIVGZjTFNhcG1VVUh2dE1YSWdmRWJ4SDA3azI5?=
 =?utf-8?B?TU5UVGJFM0VvNmpjbWV5UXVlRFdJUjV1Nlp1Yk5KZGxQVjlrKytxWHl4ekVz?=
 =?utf-8?B?MStxTG9BOTc1eGs2NGIraTVYZTY5VU5jc09PcnBBOGlNdGVVVnZibzBsQjhS?=
 =?utf-8?B?Z0xleXNWMWJaV1ErVlJ4TURjSTBTbXk5dTY4NnVXb3Jhc1FkMGhYVFdvM0Mw?=
 =?utf-8?B?aFYwRHFTMXY0M3FWNXMxZjdrTzRVYUxFbEc1RWRsSzZWV2hPVFRWVjUxQVdu?=
 =?utf-8?B?YWFvaW9yYXV4N0ZDUU1vTzcyNkdTaFp1M0NVVUc3Zi8ySHE1VUM5UlZvTkh3?=
 =?utf-8?B?VUNDNmR2MkRyTlZrcXpDZlhlMlRaTjE4SkQ3d3p4SENpdEhWWi9iYWlDbzZp?=
 =?utf-8?B?UFZhbjJpaEFDZFpMa3pORTJkZmxwMldyUHdOUHRGZEJkNWgrYWlkSXhUeVkz?=
 =?utf-8?B?dFVrUW53R0d6b0tvbUNEaVJqL3VTL1JSR3JHSU5PR3JUR0IxSCtCc21ZTjdK?=
 =?utf-8?B?ZWJxbzRqYmZxWHJYU0t2clpxME1EaGU5SGlTOWxBTzJtT1NrdnEvMXhTdXNN?=
 =?utf-8?B?eG9xU2JYNHFSMjB2eWlhZENTaW1HRTRobHNIUXVTYS9DbGxKUTNtYnVYL1Bl?=
 =?utf-8?B?T1JGeUNxbEc4NkxnVDljWjQyR2hxTW1ZNDNrR0lGN1ArVXhOc0h5SFNlU1li?=
 =?utf-8?B?ZWRaTFR4djR5RGs3VEhWSGo1NGkybXl2UEhBOEhQaFovbTRUVjBwOTlXVFV1?=
 =?utf-8?B?N084ZG9ORzM1ZVpQT0hJNmtEeE55TkdyQ0V6RG9NWjhkRlUwNzFlWHBmOXpq?=
 =?utf-8?B?Z2wwMW9TSEpucjNBYnBVYXhqRUp3dUpBdWFUMWdSMUFKRks4c2dCL1QvVXd0?=
 =?utf-8?B?RVhaK3hmSTVKQjFydWVubFlvRm41UlQxaWhtcU1oNGhpYXBrUmREd1kwOFlB?=
 =?utf-8?Q?pZIytdpm1S71O0jmEGXY2ZY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667d2f9d-01b6-4853-d4a4-08d9b4b8c1cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:53:06.8968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWVhRqI369Puhq9W04OtoL1rtS6WyGf2AvwMOX+LQTuH5077rcrLrbf43k3b4qOjxYwYphWTJ0Ik4uOFOZjhhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3534

Avoid recurring MFN -> page or page -> MFN translations. Drop the pretty
pointless local variable "p". Make sure the MFN logged in a debugging
error message is actually the offending one. Adjust style.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -58,14 +58,10 @@ p2m_pod_cache_add(struct p2m_domain *p2m
                   unsigned int order)
 {
     unsigned long i;
-    struct page_info *p;
     struct domain *d = p2m->domain;
+    mfn_t mfn = page_to_mfn(page);
 
 #ifndef NDEBUG
-    mfn_t mfn;
-
-    mfn = page_to_mfn(page);
-
     /* Check to make sure this is a contiguous region */
     if ( mfn_x(mfn) & ((1UL << order) - 1) )
     {
@@ -74,17 +70,14 @@ p2m_pod_cache_add(struct p2m_domain *p2m
         return -1;
     }
 
-    for ( i = 0; i < 1UL << order ; i++)
+    for ( i = 0; i < (1UL << order); i++)
     {
-        struct domain * od;
+        const struct domain *od = page_get_owner(page + i);
 
-        p = mfn_to_page(mfn_add(mfn, i));
-        od = page_get_owner(p);
         if ( od != d )
         {
-            printk("%s: mfn %lx expected owner d%d, got owner d%d!\n",
-                   __func__, mfn_x(mfn), d->domain_id,
-                   od ? od->domain_id : -1);
+            printk("%s: mfn %lx owner: expected %pd, got %pd!\n",
+                   __func__, mfn_x(mfn) + i, d, od);
             return -1;
         }
     }
@@ -98,16 +91,12 @@ p2m_pod_cache_add(struct p2m_domain *p2m
      * promise to provide zero pages. So we scrub pages before using.
      */
     for ( i = 0; i < (1UL << order); i++ )
-        clear_domain_page(mfn_add(page_to_mfn(page), i));
+        clear_domain_page(mfn_add(mfn, i));
 
     /* First, take all pages off the domain list */
     lock_page_alloc(p2m);
-    for ( i = 0; i < 1UL << order ; i++ )
-    {
-        p = page + i;
-        page_list_del(p, &d->page_list);
-    }
-
+    for ( i = 0; i < (1UL << order); i++ )
+        page_list_del(page + i, &d->page_list);
     unlock_page_alloc(p2m);
 
     /* Then add to the appropriate populate-on-demand list. */



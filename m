Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585D13BC181
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:14:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150513.278283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0REm-0002VG-AQ; Mon, 05 Jul 2021 16:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150513.278283; Mon, 05 Jul 2021 16:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0REm-0002Rr-75; Mon, 05 Jul 2021 16:14:24 +0000
Received: by outflank-mailman (input) for mailman id 150513;
 Mon, 05 Jul 2021 16:14:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0REk-0002Rj-RL
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:14:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e652e46-ddac-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:14:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-OE61xHFRP1q8W0wKZCZoCA-1; Mon, 05 Jul 2021 18:14:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 16:14:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:14:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.12 via Frontend Transport; Mon, 5 Jul 2021 16:14:17 +0000
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
X-Inumbo-ID: 0e652e46-ddac-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SE8Wia9zm61iMhrCrdaQ5NA8h1Pf4RFF97weGVEt5BA=;
	b=Yb8yBTDb+NQuyVLclt4YehGLeraLfF5zELXNUAs7KI36Bzz03QROZVh3Tl8OQXITUif2d7
	fs0gCwwZr5505Z+YREFUVjZVC+huwCS7bJHyRqbpMjh0G/U1z0suUVbiaWUZjwu0gFUS6q
	UR66xk8tU2CcpUj+17B47EP2aTFtbSk=
X-MC-Unique: OE61xHFRP1q8W0wKZCZoCA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuAjUIEwdgZp0zcXUX35ro+FoVIW3GjIUk02XXdU7PwL60awowAeSfyH3p+6jRpWBkz32iCJe8K3jXYgkHtTKHWQBxxyaTQGqj+j7XQpxS/RLAIul7wQrl/uj4dqgjbkPY8Naw9S1ruG8MyrIud0B93/Jvz6FsDuTgZ/WVrMKZ7AXLZ0Mml6vz5s9ur4ePpDg7k7o5UH0sim+qbsFewNgNashAnb3U1Uekkv6L7QPreVfKSafxbiCx7O5yTgbfRDzxrdx59ta5JK3GwjoMvUUSWq02EfDenwON7cAfgb71WTeHpQGjUKkyXL9SaV0opqvzzXUbm5r51J4QUdeM/f6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE8Wia9zm61iMhrCrdaQ5NA8h1Pf4RFF97weGVEt5BA=;
 b=Gh5nyEls9IdAabiPi3v+agXhVcClU8qGz8Xt04Do1rMM2FZ2atuyEW6QWPBmX6EvRhWVbbl9N8vuBpIrNHzmdVcvLbThURsDHtVJh39rgfeDaqF1dHvCwkr1x/aiACz7gTEfTgGW6pF1TOQdRn5D/l9N4zSATNxNwGk23AsSu5kUlAhtKDxnt2QL9SyH4Te6YrCSrvuA7mBj5yp1yPuw5iKT4SvXLhpHQ5YW2UnTWACBZlM2p2c+X2lkcOS+zRtyOqLYwEmIomXAQhoMzyBLs9fvGMccCbuThz72L17rnCHQkF7IO63/r/4MOwpmdBhi8ahNJ36m4KIa8bW7Fafggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 14/16] paged_pages field is MEM_PAGING-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <ab136038-0242-086c-9e67-02c47e1db3e0@suse.com>
Date: Mon, 5 Jul 2021 18:14:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ac3251a-5d68-4396-5a9a-08d93fcff124
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB282929B3A219C161C84AD21BB31C9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ns1tYEUSGRJ+NDUmSLhzDmSiVwqFXjy8snJjKEOqc1C7zVNCCaELy4OiXZUx84klKxDgP16aINfAmqn8zXv6THQAH5nYWnzC3nvvOuuNnuO8eF4pLlkiRo0xiu871s8+sliomkAnJQnYqdWdpGji3yYCVAGknYqvw8jmrRQeXwGgKfpcUd76mdp8ML8wEV+rqZr8W2H3eYvQiV1wdirOP+5GutmihGoJAGRJ2zmiayNMFComrQ+0mRcfVMxBJoNW1oQg5GNeePgdzv+jNKh+dJj6xtGG3v0Ep4KgYZukdgMVrU+LY+wpIvUgjEw1WW2J1R3ISZBY9qoG7v8ziEhKclcxGig6KihXHYF8Gim+KPNs6DF6yOoLlByT6I1LpoehqNYNqeolNgtr1ZPZXqjE/Qks4LYDQgCTxmTTTHVEFucQ1bUVz3zxA9DMjOyGhLmTeeOP5AMOoDcOs37IEyGQe2j5gd/zoYCOeorBdDisl0R+HMO15dnm+TDL+Xahsvp6oSErOnRaQD8bI4l5+AWlrDnukvJ8ymsWrtCFXJhfMvf4YOYsB7cIzUj2HV+Zk/VHPlXeeo2KFMX/SsK6zSMQQGbeuiIH0ce85mb2g1yZBcBB/BXtqRMDdHQQ1V0ORZX+7r+2BcUrJgezkCmq5vR9CNoDdB6JtRASq04LtNAJHw9l6ztf2QBldFpkipMSSnuWNQFCsGSlfoXn5J1JjoqbmGgj5q9TqIEp4Em2VE3uryI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(6486002)(26005)(16576012)(478600001)(2616005)(956004)(86362001)(2906002)(6916009)(316002)(8676002)(16526019)(66556008)(36756003)(8936002)(38100700002)(54906003)(31696002)(4326008)(66476007)(186003)(66946007)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDhYSElWUllMWXhGelJ1bDJ0cldMS0ZnS2x3NEtENGlaWTBXUGZSKy82R3ht?=
 =?utf-8?B?T013WkYvZVNlSjlZZlJSQmsvdjJ3eVl5cjMzYXZLQ05kTFEvdXFMTXkyTFpP?=
 =?utf-8?B?dHVNOVU2U1NKTkpqMVJsYzlqUDdEblIzZ1N6SzY4SGFTQklkcVNKT3UzQ2xV?=
 =?utf-8?B?VUgyTUd6SDhJVlN3VmU0MzVEZEcza2lFYXkyTzR6WG53N05SSUNIMXo5WitJ?=
 =?utf-8?B?dGNuR1QzL2N0cVFoMjArRFJERlhlUWE0QUg2NFc3OFR5OW1zMmJFZzJXaG5a?=
 =?utf-8?B?K1YyQ1lGQWVTTHZBMUxBaUl5QXhObXhhWExMbUxmMmhkVG5FVWtlcCt2VzZW?=
 =?utf-8?B?WG1nWDYrOTFUSW9naWIxaXNBYjUvS25MYThndHZVNEdGOVFGRXFIQkh1VGo0?=
 =?utf-8?B?Z2R1ZTJFbmo2dkRvSzJYd3BFMVRhd0NJRklYbC9aNGlzQUtTN2pSS0tyUERz?=
 =?utf-8?B?Yml4Nkk0WGN3Qkh5QlBVcW5yNUpxTDV0WnVTcnlJbGVqcENuKzB6TXJXbXJR?=
 =?utf-8?B?bzQxbXlhYWkxeTVsczJOS1ZRRHJlaWl5cyt0ZXA2dzFvL01rNm81bzBaRUpt?=
 =?utf-8?B?SmdySzI5b3pGUURjSE1MMXJFdGNwZ05SVmIwUW5kUjVDRVE2UHFCTkxndUVt?=
 =?utf-8?B?TVQvUy84OEcwbi90aWIvaGJzbUVmMExDTFJuM1l6Vnk5THRqMGpqYmkzWFFF?=
 =?utf-8?B?MkxKZjR3K3BEcG5reHdxSytlNTFFd29Nd2RMNkhRQVFJaUpjdFRLeEVBVm5B?=
 =?utf-8?B?aG5GaUk1aDlnK1kwa0pDL3lRSndkaGY4dVI3aHF1NnZ4RnpkQVlOMC96Mi85?=
 =?utf-8?B?dm9aZFpKb1FaYk1WUGFleEhRV09adjYrZ3JFMU12Y0hyUUZobGdSTlRLU2E0?=
 =?utf-8?B?RlY5TW5FTWxsQi9pbTZCOUU4ZUZQc0pQRHN3aHk3RGkzQ0tDcVQ0NmlraEtZ?=
 =?utf-8?B?WjlEZzM5Tnd5WVI4VTFCclBseUlVTDU5LzNXaW14SVZOVnVRYUQ0ZWIwRXBn?=
 =?utf-8?B?cWVXMGlvSGhJdGxZYzhXZGRmemRGN1RkV1kwWHBLRnR5eklRL1VhdklQWWsw?=
 =?utf-8?B?NVlEQ3FQaVhtTEp3SlZpeU9BWXRVSDN4QWJqZXFLdElXRVF2ckEzenFKdXp0?=
 =?utf-8?B?L3hUK2dwTWZ6UlgwQXIrMU1pTnlJWHFaLzBjSzJXbDZlWDczdEF6bmJIT3Nk?=
 =?utf-8?B?aFRnM3o3OWNJMTdEWWN1MHpKbHBRUXltK1Y2Zk5YNXVkQWN2T3dDTFo3ZEVy?=
 =?utf-8?B?a2k2dkd1eXZ4MTFiZnZUZjdjSDFvVThSSzFmek1aeFA1QlQvM3B1aXNWcmdV?=
 =?utf-8?B?eFhQZnY4VzZBKzlFbUVmUjRHejB0ZHFjaFNiaFJQOFlaOVpGSG5qWXJHY09H?=
 =?utf-8?B?Szl3OEtMbDl4QXJJU25JT1ptYnZQZzY4K1o0c1N5ZElHcDh2YlVaWkEvQjA4?=
 =?utf-8?B?Z2ZvTHVtT3VrVFFUMFJqRDN4YnYxN3A3NFQyWkVRR3AvV1FYdEhhK29LdGF3?=
 =?utf-8?B?dGhhK2N5akZjcFFPTEFvUEdmeDVEbG16OW9vT2hjN3IxcFp0NFMwT1VFU01E?=
 =?utf-8?B?RlY2MjBmdUt2ZThlQ0p4REtxdWR5QzQ1dTU0aXhJLzB5K0pUQXRuYU5MNlYw?=
 =?utf-8?B?Rml5UW1uMW5DOUxzNFZ5c3hVOW9qNGlxVlNEcTdHZjlTRkNFMlQ4clpYUXVQ?=
 =?utf-8?B?MnlVdWhuT1BZL0ZOeVdWa205czBMOTRtcUFFTzI3UmRSYUY0NEVEZDEvYTlK?=
 =?utf-8?Q?aIoZZEMvtlO8BI6CWq6a8uyFgJljUcLhGRjgvsR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac3251a-5d68-4396-5a9a-08d93fcff124
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:14:18.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J79D1wJi9TCx7nxk4QDPnugR5HQQ81UdQx2OpXzRgDBPFlohSdWByPjxvCwgNxPqsto/x3qFV5UxQtMsccSuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

Conditionalize it and its uses accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was on the edge of introducing a helper for
atomic_read(&d->paged_pages) but decided against because of
dump_domains() not being able to use it sensibly (I really want to omit
the output field altogether there when !MEM_PAGING).

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1213,6 +1213,7 @@ int add_to_physmap(struct domain *sd, un
     }
     else
     {
+#ifdef CONFIG_MEM_PAGING
         /*
          * There is a chance we're plugging a hole where a paged out
          * page was.
@@ -1238,6 +1239,7 @@ int add_to_physmap(struct domain *sd, un
                 put_page(cpage);
             }
         }
+#endif
     }
 
     atomic_inc(&nr_saved_mfns);
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -666,11 +666,13 @@ p2m_add_page(struct domain *d, gfn_t gfn
             /* Count how man PoD entries we'll be replacing if successful */
             pod_count++;
         }
+#ifdef CONFIG_MEM_PAGING
         else if ( p2m_is_paging(ot) && (ot != p2m_ram_paging_out) )
         {
             /* We're plugging a hole in the physmap where a paged out page was */
             atomic_dec(&d->paged_pages);
         }
+#endif
     }
 
     /* Then, look for m->p mappings for this range and deal with them */
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -114,7 +114,11 @@ void getdomaininfo(struct domain *d, str
 #else
     info->shr_pages         = 0;
 #endif
+#ifdef CONFIG_MEM_PAGING
     info->paged_pages       = atomic_read(&d->paged_pages);
+#else
+    info->paged_pages       = 0;
+#endif
     info->shared_info_frame =
         gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
     BUG_ON(SHARED_M2P(info->shared_info_frame));
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -278,14 +278,18 @@ static void dump_domains(unsigned char k
 #ifdef CONFIG_MEM_SHARING
                " shared_pages=%u"
 #endif
+#ifdef CONFIG_MEM_PAGING
                " paged_pages=%u"
+#endif
                " dirty_cpus={%*pbl} max_pages=%u\n",
                domain_tot_pages(d), d->xenheap_pages,
 #ifdef CONFIG_MEM_SHARING
                atomic_read(&d->shr_pages),
 #endif
-               atomic_read(&d->paged_pages), CPUMASK_PR(d->dirty_cpumask),
-               d->max_pages);
+#ifdef CONFIG_MEM_PAGING
+               atomic_read(&d->paged_pages),
+#endif
+               CPUMASK_PR(d->dirty_cpumask), d->max_pages);
         printk("    handle=%02x%02x%02x%02x-%02x%02x-%02x%02x-"
                "%02x%02x-%02x%02x%02x%02x%02x%02x vm_assist=%08lx\n",
                d->handle[ 0], d->handle[ 1], d->handle[ 2], d->handle[ 3],
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -390,7 +390,9 @@ struct domain
     atomic_t         shr_pages;         /* shared pages */
 #endif
 
+#ifdef CONFIG_MEM_PAGING
     atomic_t         paged_pages;       /* paged-out pages */
+#endif
 
     /* Scheduling. */
     void            *sched_priv;    /* scheduler-specific data */



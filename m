Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9304C1806
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277501.474030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu5T-00050v-5y; Wed, 23 Feb 2022 16:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277501.474030; Wed, 23 Feb 2022 16:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu5T-0004xW-1O; Wed, 23 Feb 2022 16:01:55 +0000
Received: by outflank-mailman (input) for mailman id 277501;
 Wed, 23 Feb 2022 16:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu5Q-0004wX-W5
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:01:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9bb3574-94c1-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:01:51 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-LkOjBEtmMImzsigRdtK4dg-1; Wed, 23 Feb 2022 17:01:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0401MB2358.eurprd04.prod.outlook.com (2603:10a6:4:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Wed, 23 Feb
 2022 16:01:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:01:47 +0000
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
X-Inumbo-ID: e9bb3574-94c1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfo3pz5C0VU61envUYqryzUUTaf8SbibABEgwXmQS1A=;
	b=To/TDaUDsDXdOYRqaNhhJB/eFoFahlSA/4CgfpvonTKgePSbNyDwwMQw7SKiURpIwc/78d
	iMVSFvoNuBsFo5iW1AE7rJV3sCDtEowOelgd+BIfwH7PeHnnpT6wZSLYPN+m1dL2zO00bI
	7T2wnUWu3k3L+7iLjt2c/W4yIIFsoN0=
X-MC-Unique: LkOjBEtmMImzsigRdtK4dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fb7R63YCslDyguUIQvOAwRdmtRrETXPnQb83PxVSl9SuaTZwpQZ2W7vunu1iGbdmkn1lhNmVeox/CZkOaFh00yDh1iKgqAzrHi9NydrMrBXnj18vMrQb5/HcWOJ51oNdftKn7/I/G63U9bl344DzD6aoaXzk5mSg/N6dl3g6V97p4UxeExklGV6NOw7JPqGHP20KwNCKQSK7HlhPoCITQve9dpulPywGx7XfAz/spMpS+W+TiLOlUeRN/uh/8r28iKEP1BCMX6fhlZuz0deyNZtbDpAtX4YdajO55XOu8S9mGUoUs3ohHoWLqCcmnqPe41YS8EWoLn/1ClrCg066+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfo3pz5C0VU61envUYqryzUUTaf8SbibABEgwXmQS1A=;
 b=KBhjcWzUcuyz6mD9aUXDak2WPiyjuBnlmxKPWg07p+C5QKlZSaEJqfJh4BMJ0DuXH9AAjASpZ3Fc8B+YaPs2CpSxbj2kKqRHP8JRp47HWybXI4FxNHLQhqrvrZd0EvVC1LZzbs9GpYJObSnxfwmGDfI7gaVjFdQKFhLAuXv6UXbgFrY6KfWpxgJcc+i5yOqeutBsQVwOBhuEcGx4/UVAA3N6WVl+a21EkY5eNM7+yH1TZzES1mNqrRVzuRJQpoAAiNtB+EQWoJPw1sqocHGccMFGpaswe17YGOvY4huUCm/Dl+26+mliuxxaTDk8N+1uRKHpHz+pzCvWJId01rvooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88109672-c829-e083-5084-b12fc68ae39b@suse.com>
Date: Wed, 23 Feb 2022 17:01:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 07/14] x86/P2M: split out init/teardown functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0069.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 589884bb-04b3-4ada-67af-08d9f6e5cb35
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2358:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2358575E15CB2B15C27FB6C7B33C9@DB6PR0401MB2358.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RKuZlGQSLig8OeXUsVYkt44fLNwk/yCmIrfvvR01DUzhySt8pnlJe3SzCf1IxuMI2QMu3LWBB0cf6QYschvrg9h7WauquL8R40Y/pCcSwu7O1WoqXwfmroqGDWsF5YfQEycgi40kw9KchxYnhWU2Kr9y5NW0sGUkQ7FUA+EJQwBljcl85wk7+9103jXRKS6uPVG0iip6jegHuQNXhR37S49GjSOxkOy+O61Wj0b4+FVvwN+BZkX8Jy5yEb030G0DcQXlHQnO3H7fpHEIL+YBbuDv6SyOJuEuf5RUUS/M/Ag1ew+Mv1aLQuikPqdlTlhrbUQRx0DoAo/E4YROgUJnq3oh9IZRT1MAG2jSEq/1nDeajWFLkoO10m6skAh1qPK3Xmdh8m9iqyVt6PeEsHOS4tMsFXfmOREFuj3SCv7DJuWxqYHkDFUTCmCONVX5l2YdtymX49vB40DhRglid+2MKMuJ4oeRSzOST0kTE6ZX4p7J2XeEifq/Spkk6ggNYUoWM3BQlhH2Ur2+KAk5ZQMzMHFfhfwNgWk3/ETjnLuF+ZweFVUqxag+i+xYqygpbAUH6v6AT9IQHdZGnN1wf7g2yw8DX/1J1xiO8foQ9mSXZWDkcP6lWTwoB+aynWMyqMVuj2qnawPWSwiKVtnekIJ19o0xGhRopeU5g+cvE7LCSigRzB3OWlKQ888x/qsjAzgBYulWK7CVOkMOq/b9AAVAnzaqDzX2LE9oZ+wdnjIy5ZYKG3LksC7JafxdOMSBuXuP6PJEdNM0b6aRiBkD6iJCgorE6/3vlzytHOiaaUdZUGlTn5E+tgSS0t1dv32C0kcYPvhH4Zq3vzosGor2JtjbTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6506007)(66946007)(8676002)(5660300002)(6512007)(83380400001)(4326008)(66556008)(186003)(6486002)(66476007)(316002)(26005)(508600001)(31686004)(36756003)(30864003)(54906003)(2906002)(6916009)(31696002)(86362001)(38100700002)(6666004)(8936002)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkllQWdwdFVKMmwxQjd4a0cwSXBKUVZsaUxNRXFJUzBzeGlWeDliRk9RemJB?=
 =?utf-8?B?NVdIcUVYOWcvRXBOYk0yZE10eitYbEMyZ1piOXo0MVFnMlFqNjNQT1FoTWM1?=
 =?utf-8?B?TGZtYVpMRGpUU2Jjai9nWVllOW5VMFZCUTJmOVh5K1dnZ2lJRWhLSlVaL05r?=
 =?utf-8?B?RDRTa0oxeGM4Z0JqRlE5TmtadzhCdFJkNlpGNEJQaXdXYUlxUjlzd3R6NVps?=
 =?utf-8?B?ejRDMFdFZXl2VjlmWUhTMGtVT2ZhRlRqTEtGcjhMdzdsaHk0VUFVSmc3UE5k?=
 =?utf-8?B?MkRGZlBxNlhUeFB2ZzBSclBWeXVXbTdVcW9rSE1xRFZRVSs2TjBKczluQnQ2?=
 =?utf-8?B?NVpqcVUySXZVdmhNQ3BrYlpHdFJsOXVJdytwbURIVXpEWWZUSnc4NytUZkhI?=
 =?utf-8?B?WTNlaWsvT3JrRWJYY0ZOYU5lYWJTS1ZFaitmb25RN1pNemtzMUJmZDBlMktE?=
 =?utf-8?B?ZUw3S1dHN0VzRGl0YytXeUtYRjFhRFBwN0oyblNBSEw2bHU1YStjTDZhMWk5?=
 =?utf-8?B?SG1jaEZhWFA4ZmFISE1tUS8zdmIyNHVVMjlMaXVxRWx1SUNwMjZFaTVzckZR?=
 =?utf-8?B?K0Fud3ZFd1UvaXJkSlA5SWY1bTg2ZlhBeXpRVnJram5wM2xVNlBnNVVaTmRj?=
 =?utf-8?B?L3ZlQmQ2KytkSnpFZDFoZXpXYTJCOUtJdXZlTENGZ09Bb0RGWXBsc1ArVHJP?=
 =?utf-8?B?aC9jZWwvWWdjK3N5cFpodm14YXE3dWtxS2crUCtUckRTaTV0UnlScVU2ajdK?=
 =?utf-8?B?MDd3L3FLVjIzWCt3NGJaTDczRjR3QnU3UzZIRVZtNjB1dXJjTVNtQzErT2N4?=
 =?utf-8?B?Rzh0TW9hYnd5SzZPc08yMTdDcEJqVXo5dGhhN1Y3M2pxYUZpejcwSjgrRVFa?=
 =?utf-8?B?Y3hJM2x5TkUwUEdMc0NncVZzOHhCeTdmbHRJbU5DYnRBVTB5THhZaW5qMU1M?=
 =?utf-8?B?QWthZzQwd3RCek5mTndiSDY4MWRHdSt0RTcyQ2lNNzZna01HTzIvek9taUVu?=
 =?utf-8?B?NnlVVSttRHVGWUhNbkx3aW56WmN0ZkV2NnJLZFNob3JDZHF5RHdqbkNiTXV2?=
 =?utf-8?B?bzZjdmZlcno4dDFTSlZXUjc3ZFd4bkZNMUlvMWtTRUtTV3dIZzBabVU4aHdt?=
 =?utf-8?B?T29SQzBYamxTZllyeHF5ekpkRVF5Q3hEVHo4UndzRllNNU00TW1CclVGcFNv?=
 =?utf-8?B?UkxLZml3eW93U3g1TjFkclZWT2ozM1kzdjFKZXFJb1lsb0JjNEpTQ3RUQ242?=
 =?utf-8?B?ZDl3ejBpWDNWdXBuWEZTbXIremlNMTVHeXM1aHc3YW5DM1JncnZKemZOOWxa?=
 =?utf-8?B?RDJabDVYNkZRaVo2Z2N2bXpRREZaczRvejlVa1hqeWw1Zk1WOUpZelc5dUl2?=
 =?utf-8?B?ekNCMCthUzE3UEQ3NytrVEJ3UmFCWmQ5ZFphcUF1dW1UU0kyTGtaY1FTbHcz?=
 =?utf-8?B?amZacUQ3QW5PVEFnSlczZ1B3VDUrczcrMCt0a0xnQ0ZocmhNL2FoWTlkRGh5?=
 =?utf-8?B?dGtxZU95TGtLL0V1VW1hc1VvMW9aN2dvZVBId0ZhNGNNTUphaXRPOTJCWTNJ?=
 =?utf-8?B?WFZpTzFod0Y3bVdQYkV2ektHOGFEckRpZW40a2RSUExZZUkyMURXOTJ1SytY?=
 =?utf-8?B?TDE4NHE1cm5nVkRHeGZUQjhWVUVaMk5lcm9vMytZOWwxaEFtRHJTVEZWMzN5?=
 =?utf-8?B?dS9oQzAwdzRzdlE1MjVXQUxiNlF5cU00dlNDNGk0SjVjd2ZpV1NhOEhzMElz?=
 =?utf-8?B?L0RTVjJtdFhSc0pVeVUxUTd0QmRJTTVHUGhqdFgxS3VVcFFoSVQzWkdWcFFm?=
 =?utf-8?B?NWRFeURXTkozMTNiam5ZY1dhOTlkY1FTTUJyNTRFSnRUWG9pcDFQOHJSTHhm?=
 =?utf-8?B?UUZrOXNxSGJidXliRG1RTExGdDNndnFZZFhMbWVCTnBFeGk4aFQyVEoxVlIr?=
 =?utf-8?B?RUV4TUtualhEUDd3MmpJbkdVTEhuK0tCMTlKOUI5WEYxTUxXbDBrekIyeURk?=
 =?utf-8?B?aDl1RkhwZTdGNUxCeGUwcnRvWXVYbnp0YUxVZFJ5UUVZbUlxL2ROUXp2dy9Z?=
 =?utf-8?B?VzJyZlFLalRBZUxacGdnQ3N1ZU55dXBhemgrVi91UDhuUU9tbTRtS1c0MTln?=
 =?utf-8?B?aHFvaDVjOFdHWm5nVVd5dElHUE0yV2NSVDA2WXFIM3RFYW9hQjZGeW5pTkNX?=
 =?utf-8?Q?9Iz2FEUy2eKLFwoRt9kO4Pc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589884bb-04b3-4ada-67af-08d9f6e5cb35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:01:46.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xx/eBZ9fyL2DRKznAJZ6Sjjub6W9q0KbPrftzL757t/93pDbtIo+sFd8BmxdSajgj3MlpauhiDx6O/AeodxI2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2358

Mostly just code movement, and certainly no functional change intended.
In p2m_final_teardown() the calls to p2m_teardown_{alt,nested}p2m() need
to be guarded by an is_hvm_domain() check now, though. This matches
p2m_init(). And p2m_is_logdirty_range() also gets moved inside the (so
far) adjacent #ifdef.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
v2: Re-base over wider p2m_add_identity_entry() exposure in earlier
    patch.

--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -7,7 +7,9 @@ obj-$(CONFIG_SHADOW_PAGING) += guest_wal
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
+obj-$(CONFIG_HVM) += nested.o
 obj-y += p2m.o
+obj-y += p2m-basic.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
 obj-y += paging.o
 obj-y += physmap.o
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -19,6 +19,8 @@
 #include <asm/hvm/hvm.h>
 #include <asm/p2m.h>
 #include <asm/altp2m.h>
+#include "mm-locks.h"
+#include "p2m.h"
 
 void
 altp2m_vcpu_initialise(struct vcpu *v)
@@ -123,6 +125,44 @@ void altp2m_vcpu_disable_ve(struct vcpu
     }
 }
 
+int p2m_init_altp2m(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
+
+    mm_lock_init(&d->arch.altp2m_list_lock);
+    for ( i = 0; i < MAX_ALTP2M; i++ )
+    {
+        d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
+        if ( p2m == NULL )
+        {
+            p2m_teardown_altp2m(d);
+            return -ENOMEM;
+        }
+        p2m->p2m_class = p2m_alternate;
+        p2m->access_required = hostp2m->access_required;
+        _atomic_set(&p2m->active_vcpus, 0);
+    }
+
+    return 0;
+}
+
+void p2m_teardown_altp2m(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    for ( i = 0; i < MAX_ALTP2M; i++ )
+    {
+        if ( !d->arch.altp2m_p2m[i] )
+            continue;
+        p2m = d->arch.altp2m_p2m[i];
+        d->arch.altp2m_p2m[i] = NULL;
+        p2m_free_one(p2m);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -25,8 +25,6 @@
 #ifndef _MM_LOCKS_H
 #define _MM_LOCKS_H
 
-#include <asm/mem_sharing.h>
-
 /* Per-CPU variable for enforcing the lock ordering */
 DECLARE_PER_CPU(int, mm_lock_level);
 
--- /dev/null
+++ b/xen/arch/x86/mm/nested.c
@@ -0,0 +1,74 @@
+/******************************************************************************
+ * arch/x86/mm/nested.c
+ *
+ * Parts of this code are Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
+ * Parts of this code are Copyright (c) 2007 by Advanced Micro Devices.
+ * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/sched.h>
+#include <asm/p2m.h>
+#include "mm-locks.h"
+#include "p2m.h"
+
+void p2m_nestedp2m_init(struct p2m_domain *p2m)
+{
+    INIT_LIST_HEAD(&p2m->np2m_list);
+
+    p2m->np2m_base = P2M_BASE_EADDR;
+    p2m->np2m_generation = 0;
+}
+
+int p2m_init_nestedp2m(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    mm_lock_init(&d->arch.nested_p2m_lock);
+    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    {
+        d->arch.nested_p2m[i] = p2m = p2m_init_one(d);
+        if ( p2m == NULL )
+        {
+            p2m_teardown_nestedp2m(d);
+            return -ENOMEM;
+        }
+        p2m->p2m_class = p2m_nested;
+        p2m->write_p2m_entry_pre = NULL;
+        p2m->write_p2m_entry_post = nestedp2m_write_p2m_entry_post;
+        list_add(&p2m->np2m_list, &p2m_get_hostp2m(d)->np2m_list);
+    }
+
+    return 0;
+}
+
+void p2m_teardown_nestedp2m(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    {
+        if ( !d->arch.nested_p2m[i] )
+            continue;
+        p2m = d->arch.nested_p2m[i];
+        list_del(&p2m->np2m_list);
+        p2m_free_one(p2m);
+        d->arch.nested_p2m[i] = NULL;
+    }
+}
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -35,7 +35,6 @@
 #include <asm/page.h>
 #include <asm/paging.h>
 #include <asm/p2m.h>
-#include <asm/hvm/vmx/vmx.h> /* ept_p2m_init() */
 #include <asm/mem_sharing.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/altp2m.h>
@@ -56,17 +55,9 @@ boolean_param("hap_2mb", opt_hap_2mb);
 
 DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
 
-static void p2m_nestedp2m_init(struct p2m_domain *p2m)
-{
 #ifdef CONFIG_HVM
-    INIT_LIST_HEAD(&p2m->np2m_list);
 
-    p2m->np2m_base = P2M_BASE_EADDR;
-    p2m->np2m_generation = 0;
-#endif
-}
-
-static int p2m_init_logdirty(struct p2m_domain *p2m)
+int p2m_init_logdirty(struct p2m_domain *p2m)
 {
     if ( p2m->logdirty_ranges )
         return 0;
@@ -79,7 +70,7 @@ static int p2m_init_logdirty(struct p2m_
     return 0;
 }
 
-static void p2m_free_logdirty(struct p2m_domain *p2m)
+void p2m_free_logdirty(struct p2m_domain *p2m)
 {
     if ( !p2m->logdirty_ranges )
         return;
@@ -88,205 +79,6 @@ static void p2m_free_logdirty(struct p2m
     p2m->logdirty_ranges = NULL;
 }
 
-/* Init the datastructures for later use by the p2m code */
-static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
-{
-    int ret = 0;
-
-    mm_rwlock_init(&p2m->lock);
-#ifdef CONFIG_HVM
-    INIT_PAGE_LIST_HEAD(&p2m->pages);
-#endif
-
-    p2m->domain = d;
-    p2m->default_access = p2m_access_rwx;
-    p2m->p2m_class = p2m_host;
-
-    if ( !is_hvm_domain(d) )
-        return 0;
-
-    p2m_pod_init(p2m);
-    p2m_nestedp2m_init(p2m);
-
-    if ( hap_enabled(d) && cpu_has_vmx )
-        ret = ept_p2m_init(p2m);
-    else
-        p2m_pt_init(p2m);
-
-    spin_lock_init(&p2m->ioreq.lock);
-
-    return ret;
-}
-
-static struct p2m_domain *p2m_init_one(struct domain *d)
-{
-    struct p2m_domain *p2m = xzalloc(struct p2m_domain);
-
-    if ( !p2m )
-        return NULL;
-
-    if ( !zalloc_cpumask_var(&p2m->dirty_cpumask) )
-        goto free_p2m;
-
-    if ( p2m_initialise(d, p2m) )
-        goto free_cpumask;
-    return p2m;
-
-free_cpumask:
-    free_cpumask_var(p2m->dirty_cpumask);
-free_p2m:
-    xfree(p2m);
-    return NULL;
-}
-
-static void p2m_free_one(struct p2m_domain *p2m)
-{
-    p2m_free_logdirty(p2m);
-    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
-        ept_p2m_uninit(p2m);
-    free_cpumask_var(p2m->dirty_cpumask);
-    xfree(p2m);
-}
-
-static int p2m_init_hostp2m(struct domain *d)
-{
-    struct p2m_domain *p2m = p2m_init_one(d);
-    int rc;
-
-    if ( !p2m )
-        return -ENOMEM;
-
-    rc = p2m_init_logdirty(p2m);
-
-    if ( !rc )
-        d->arch.p2m = p2m;
-    else
-        p2m_free_one(p2m);
-
-    return rc;
-}
-
-static void p2m_teardown_hostp2m(struct domain *d)
-{
-    /* Iterate over all p2m tables per domain */
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
-    if ( p2m )
-    {
-        p2m_free_one(p2m);
-        d->arch.p2m = NULL;
-    }
-}
-
-#ifdef CONFIG_HVM
-static void p2m_teardown_nestedp2m(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
-    {
-        if ( !d->arch.nested_p2m[i] )
-            continue;
-        p2m = d->arch.nested_p2m[i];
-        list_del(&p2m->np2m_list);
-        p2m_free_one(p2m);
-        d->arch.nested_p2m[i] = NULL;
-    }
-}
-
-static int p2m_init_nestedp2m(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    mm_lock_init(&d->arch.nested_p2m_lock);
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
-    {
-        d->arch.nested_p2m[i] = p2m = p2m_init_one(d);
-        if ( p2m == NULL )
-        {
-            p2m_teardown_nestedp2m(d);
-            return -ENOMEM;
-        }
-        p2m->p2m_class = p2m_nested;
-        p2m->write_p2m_entry_pre = NULL;
-        p2m->write_p2m_entry_post = nestedp2m_write_p2m_entry_post;
-        list_add(&p2m->np2m_list, &p2m_get_hostp2m(d)->np2m_list);
-    }
-
-    return 0;
-}
-
-static void p2m_teardown_altp2m(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    for ( i = 0; i < MAX_ALTP2M; i++ )
-    {
-        if ( !d->arch.altp2m_p2m[i] )
-            continue;
-        p2m = d->arch.altp2m_p2m[i];
-        d->arch.altp2m_p2m[i] = NULL;
-        p2m_free_one(p2m);
-    }
-}
-
-static int p2m_init_altp2m(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
-
-    mm_lock_init(&d->arch.altp2m_list_lock);
-    for ( i = 0; i < MAX_ALTP2M; i++ )
-    {
-        d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
-        if ( p2m == NULL )
-        {
-            p2m_teardown_altp2m(d);
-            return -ENOMEM;
-        }
-        p2m->p2m_class = p2m_alternate;
-        p2m->access_required = hostp2m->access_required;
-        _atomic_set(&p2m->active_vcpus, 0);
-    }
-
-    return 0;
-}
-#endif
-
-int p2m_init(struct domain *d)
-{
-    int rc;
-
-    rc = p2m_init_hostp2m(d);
-    if ( rc || !is_hvm_domain(d) )
-        return rc;
-
-#ifdef CONFIG_HVM
-    /* Must initialise nestedp2m unconditionally
-     * since nestedhvm_enabled(d) returns false here.
-     * (p2m_init runs too early for HVM_PARAM_* options) */
-    rc = p2m_init_nestedp2m(d);
-    if ( rc )
-    {
-        p2m_teardown_hostp2m(d);
-        return rc;
-    }
-
-    rc = p2m_init_altp2m(d);
-    if ( rc )
-    {
-        p2m_teardown_hostp2m(d);
-        p2m_teardown_nestedp2m(d);
-    }
-#endif
-
-    return rc;
-}
-
 int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
                           unsigned long end)
 {
@@ -298,8 +90,6 @@ int p2m_is_logdirty_range(struct p2m_dom
     return 0;
 }
 
-#ifdef CONFIG_HVM
-
 static void change_entry_type_global(struct p2m_domain *p2m,
                                      p2m_type_t ot, p2m_type_t nt)
 {
@@ -751,57 +541,6 @@ int p2m_alloc_table(struct p2m_domain *p
     return 0;
 }
 
-#endif /* CONFIG_HVM */
-
-/*
- * hvm fixme: when adding support for pvh non-hardware domains, this path must
- * cleanup any foreign p2m types (release refcnts on them).
- */
-void p2m_teardown(struct p2m_domain *p2m)
-/* Return all the p2m pages to Xen.
- * We know we don't have any extra mappings to these pages */
-{
-#ifdef CONFIG_HVM
-    struct page_info *pg;
-#endif
-    struct domain *d;
-
-    if (p2m == NULL)
-        return;
-
-    d = p2m->domain;
-
-    p2m_lock(p2m);
-
-    ASSERT(atomic_read(&d->shr_pages) == 0);
-
-#ifdef CONFIG_HVM
-    p2m->phys_table = pagetable_null();
-
-    while ( (pg = page_list_remove_head(&p2m->pages)) )
-        d->arch.paging.free_page(d, pg);
-#endif
-
-    p2m_unlock(p2m);
-}
-
-void p2m_final_teardown(struct domain *d)
-{
-#ifdef CONFIG_HVM
-    /*
-     * We must teardown both of them unconditionally because
-     * we initialise them unconditionally.
-     */
-    p2m_teardown_altp2m(d);
-    p2m_teardown_nestedp2m(d);
-#endif
-
-    /* Iterate over all p2m tables per domain */
-    p2m_teardown_hostp2m(d);
-}
-
-#ifdef CONFIG_HVM
-
 static int __must_check
 p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                  unsigned int page_order)
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -15,8 +15,30 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+struct p2m_domain *p2m_init_one(struct domain *d);
+void p2m_free_one(struct p2m_domain *p2m);
+
 void p2m_pod_init(struct p2m_domain *p2m);
 
+#ifdef CONFIG_HVM
+int p2m_init_logdirty(struct p2m_domain *p2m);
+void p2m_free_logdirty(struct p2m_domain *p2m);
+#else
+static inline int p2m_init_logdirty(struct p2m_domain *p2m) { return 0; }
+static inline void p2m_free_logdirty(struct p2m_domain *p2m) {}
+#endif
+
+int p2m_init_altp2m(struct domain *d);
+void p2m_teardown_altp2m(struct domain *d);
+
+void p2m_nestedp2m_init(struct p2m_domain *p2m);
+int p2m_init_nestedp2m(struct domain *d);
+void p2m_teardown_nestedp2m(struct domain *d);
+
+int ept_p2m_init(struct p2m_domain *p2m);
+void ept_p2m_uninit(struct p2m_domain *p2m);
+void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
+
 /*
  * Local variables:
  * mode: C
--- /dev/null
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -0,0 +1,207 @@
+/******************************************************************************
+ * arch/x86/mm/p2m-basic.c
+ *
+ * Basic P2M management largely applicable to all domain types.
+ *
+ * Parts of this code are Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
+ * Parts of this code are Copyright (c) 2007 by Advanced Micro Devices.
+ * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/types.h>
+#include <asm/p2m.h>
+#include "mm-locks.h"
+#include "p2m.h"
+
+/* Init the datastructures for later use by the p2m code */
+static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
+{
+    int ret = 0;
+
+    mm_rwlock_init(&p2m->lock);
+#ifdef CONFIG_HVM
+    INIT_PAGE_LIST_HEAD(&p2m->pages);
+#endif
+
+    p2m->domain = d;
+    p2m->default_access = p2m_access_rwx;
+    p2m->p2m_class = p2m_host;
+
+    if ( !is_hvm_domain(d) )
+        return 0;
+
+    p2m_pod_init(p2m);
+    p2m_nestedp2m_init(p2m);
+
+    if ( hap_enabled(d) && cpu_has_vmx )
+        ret = ept_p2m_init(p2m);
+    else
+        p2m_pt_init(p2m);
+
+    spin_lock_init(&p2m->ioreq.lock);
+
+    return ret;
+}
+
+struct p2m_domain *p2m_init_one(struct domain *d)
+{
+    struct p2m_domain *p2m = xzalloc(struct p2m_domain);
+
+    if ( !p2m )
+        return NULL;
+
+    if ( !zalloc_cpumask_var(&p2m->dirty_cpumask) )
+        goto free_p2m;
+
+    if ( p2m_initialise(d, p2m) )
+        goto free_cpumask;
+    return p2m;
+
+ free_cpumask:
+    free_cpumask_var(p2m->dirty_cpumask);
+ free_p2m:
+    xfree(p2m);
+    return NULL;
+}
+
+void p2m_free_one(struct p2m_domain *p2m)
+{
+    p2m_free_logdirty(p2m);
+    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
+        ept_p2m_uninit(p2m);
+    free_cpumask_var(p2m->dirty_cpumask);
+    xfree(p2m);
+}
+
+static int p2m_init_hostp2m(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_init_one(d);
+    int rc;
+
+    if ( !p2m )
+        return -ENOMEM;
+
+    rc = p2m_init_logdirty(p2m);
+
+    if ( !rc )
+        d->arch.p2m = p2m;
+    else
+        p2m_free_one(p2m);
+
+    return rc;
+}
+
+static void p2m_teardown_hostp2m(struct domain *d)
+{
+    /* Iterate over all p2m tables per domain */
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    if ( p2m )
+    {
+        p2m_free_one(p2m);
+        d->arch.p2m = NULL;
+    }
+}
+
+int p2m_init(struct domain *d)
+{
+    int rc;
+
+    rc = p2m_init_hostp2m(d);
+    if ( rc || !is_hvm_domain(d) )
+        return rc;
+
+    /*
+     * Must initialise nestedp2m unconditionally
+     * since nestedhvm_enabled(d) returns false here.
+     * (p2m_init runs too early for HVM_PARAM_* options)
+     */
+    rc = p2m_init_nestedp2m(d);
+    if ( rc )
+    {
+        p2m_teardown_hostp2m(d);
+        return rc;
+    }
+
+    rc = p2m_init_altp2m(d);
+    if ( rc )
+    {
+        p2m_teardown_hostp2m(d);
+        p2m_teardown_nestedp2m(d);
+    }
+
+    return rc;
+}
+
+/*
+ * Return all the p2m pages to Xen.
+ * We know we don't have any extra mappings to these pages.
+ *
+ * hvm fixme: when adding support for pvh non-hardware domains, this path must
+ * cleanup any foreign p2m types (release refcnts on them).
+ */
+void p2m_teardown(struct p2m_domain *p2m)
+{
+#ifdef CONFIG_HVM
+    struct page_info *pg;
+#endif
+    struct domain *d;
+
+    if ( !p2m )
+        return;
+
+    d = p2m->domain;
+
+    p2m_lock(p2m);
+
+    ASSERT(atomic_read(&d->shr_pages) == 0);
+
+#ifdef CONFIG_HVM
+    p2m->phys_table = pagetable_null();
+
+    while ( (pg = page_list_remove_head(&p2m->pages)) )
+        d->arch.paging.free_page(d, pg);
+#endif
+
+    p2m_unlock(p2m);
+}
+
+void p2m_final_teardown(struct domain *d)
+{
+    if ( is_hvm_domain(d) )
+    {
+        /*
+         * We must tear down both of them unconditionally because
+         * we initialise them unconditionally.
+         */
+        p2m_teardown_altp2m(d);
+        p2m_teardown_nestedp2m(d);
+    }
+
+    /* Iterate over all p2m tables per domain */
+    p2m_teardown_hostp2m(d);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -35,6 +35,7 @@
 #include <xen/softirq.h>
 
 #include "mm-locks.h"
+#include "p2m.h"
 
 #define atomic_read_ept_entry(__pepte)                              \
     ( (ept_entry_t) { .epte = read_atomic(&(__pepte)->epte) } )
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -594,15 +594,11 @@ unsigned int vmx_get_cpl(void);
 void vmx_inject_extint(int trap, uint8_t source);
 void vmx_inject_nmi(void);
 
-int ept_p2m_init(struct p2m_domain *p2m);
-void ept_p2m_uninit(struct p2m_domain *p2m);
-
 void ept_walk_table(struct domain *d, unsigned long gfn);
 bool_t ept_handle_misconfig(uint64_t gpa);
 int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int order, bool *ipat, p2m_type_t type);
 void setup_ept_dump(void);
-void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
 /* Locate an alternate p2m by its EPTP */
 unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp);
 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182557648DF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570806.892982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvZz-0000ve-Gy; Thu, 27 Jul 2023 07:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570806.892982; Thu, 27 Jul 2023 07:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvZz-0000ra-Df; Thu, 27 Jul 2023 07:38:35 +0000
Received: by outflank-mailman (input) for mailman id 570806;
 Thu, 27 Jul 2023 07:38:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvZx-0000oV-Il
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:38:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9636c91a-2c50-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 09:38:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8026.eurprd04.prod.outlook.com (2603:10a6:10:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:38:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:38:31 +0000
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
X-Inumbo-ID: 9636c91a-2c50-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S36Ixr4Z+Ln7tN/dSjpT2baYv+w+4WIJiQR4Y7v84Fm+jtYj2MFZjWvXX9jfOYlzeb3//uzQVAU9LPIVp5Y0KMOmFavrmOw2MXoNZrSXTonHXQ7MAbCbFLkP8VsfDVHV9Vo0cKC4TJYM6snAho+ZqwvE7jxptQ1ZyIpDiboUpLvB2WSzEwTlhvA6q5JkrWAHv90IUL++jVckFvUIvgKBHvuoItsuF4V89wPg9Pvu7UJSCwM16rlQ4jILKfUr31WP9HfhWoAYtLlAq9QJOoBQqibggntGDOo4SXRJ0dCPU9LgT/a5/BnuZ0mRfl/AYlNiKtnFKwxQkhk1BdUBiIZBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42G1q1cbtqLAMoOILaHON+bdi1vm2gokigDbkHTcLas=;
 b=im54/SKoplx/5mwC6VfvATT4eOkoJI7tyUjARqxjVN5ipGGcNV7SU+Dd/F61wI29u2vLS/cmzjv6E6ePCZKhD3UeT61rrCdr8omA9YMCHdhGvRBdxDhCYVWEYREY3zqNNrSKEtNS+w3vbAyGOwk7KI6f+eXt15leHVQ7j616GCcNwDyYSqjLSDJwYxzeCEOVXoV7pl8bvO+1MldyQpRkl8w65N6G9/jodYJc6lBD0o5Tx7nH3a8s8T9mTZvd4sbWTih2BcnfvnWFZ113V/05pM5baLH2pxekg4fymNa8f236e9Zj1NehNvyXRybWeuvjAspx/dIM3FvU3RaW88erIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42G1q1cbtqLAMoOILaHON+bdi1vm2gokigDbkHTcLas=;
 b=C0f1ociMyS9vc9x+0AzwYlBDRBJ2/UxqacI/na6zD+u+AdonkZvChNia62dtt/tz4YlDTSVK+0VeH7AHSdoCUU27RfR0WiRVLvv/MHXJLheKlYh3lgemwBXVKSPXGlAbElpXgRvSYpvD222Jh7BlHM7v0kPCm2zhmHboZu+p4ima15joL+SvgPwYl79uPTfkUTSj8scy6J16rKFoU2v3fXZSQD1Syf0E9PIbedDnhhYoglz8mvXlMKqdx68eZXoLOx2v6t7bfGyiyH4TZVUQU59xGdjB5vDiOBLtst9/Ev5vvtDJIh7Qs1BtNUKfv/nZIKcpdDLPJx8CfHLNVjN0Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5641f8eb-5736-8ccc-122b-b3b47c1bac28@suse.com>
Date: Thu, 27 Jul 2023 09:38:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 2/3] pirq_cleanup_check() leaks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
In-Reply-To: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e47f9d-840e-464a-5cba-08db8e747992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SQg/baH/L+3HTi5t7EeuF7Jhyc36KxHdDA/186cQTCKdqBaQBR3kCTRqmRPvkVptJPolJL1kbmkVqYYh8GnB4SEI/zmLASS4+c9P0ebAKY3+hho5p/NBEczDvJbofFnkcs0+hk8n1Q29UsRNvTnT3Ewk9LoHl6OGbIXuwj2DxBqLrFaC/cciePAI/8tQshKOpThh5CVZuShAyCFocY2jiCmCtx4KOejW1mPs5X2ugqiPGRtt3xosfHJWmlJFYVj4TWw1Hhmi/Zn1tMuG317a9omN/zATFCbLygIeluSyd0Us5T/we8vh2uE9+keft3L3Zj/HjlJOAWwmq0hw6xLn5hLGchSoOBBUy53nKJNl8FCrwvEDCPDXXSkR32aonyAKH03J8n8YBbZOFcAQFJFPdd6nemJvv5rQKTAvIj/kaFQ7rMnCy72yh5TT5Pipd1gyKqoX9MDxok9wirtrNGMl0PnVPl/2+LRoL9Ii3VtS+KswnwXM9273upk5UxtemDCu5Me0pp3qxDmtG4QTUD00AgZpESeSNPYyp3lpL9emORIr50h5AxxE1VaAlnyPtwsgFiJbk6eKQeFp5xWFZJW53wsFVZT+O3LtLv5Zuab2jJM9vqR5qxOD5ej9TARvV6dGt4s4MREPYYRnIAJ+5ZH/UA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(6486002)(478600001)(83380400001)(6506007)(26005)(6512007)(6916009)(4326008)(54906003)(66556008)(66476007)(66946007)(186003)(2616005)(38100700002)(31686004)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBhQ2tpNTRDZ0RWRVMyZmNySmRZSFNsZXVvZjhzbC90ZmE2TlZuWmNNaG4x?=
 =?utf-8?B?THlsTEFsRGlPYld5d3V6OW1lbGFvcDJDSjdNRUhXd2dyTzZjRUpUaE5YWTg4?=
 =?utf-8?B?VnhiVkE1aDJ0RGUzRnBmanBweEJ4VFdBWEZhN3lGb0NkekVLMTM3eloyQ3lk?=
 =?utf-8?B?RDN3ellyc2dBQUIwOGtLKzZ5VDdCKzVKSVBtaTNJaWYvd29sd1dFQlFIOWYx?=
 =?utf-8?B?OXRpdFBGNFErTjRRbTl3NnQ5ak5MK1g1SXRhYzF3L3BhOWVzV1dadTloaTF5?=
 =?utf-8?B?dTE4RGFaV1ZRR04vWFBWSUdOSmk4NjJTemdhRkRuc3F4ZVVCT3RTY0N5L0Fs?=
 =?utf-8?B?RzBiTWVPVmI4UTR0dGIvWFNTTm10Z1lMTjI4ellyWHRwSy8zZ3BrbTFnOG9G?=
 =?utf-8?B?Y0V0Y1BTcGFqeHdiWm8rUGZhdkl3QzlrTTdhdDZqTDI4ZWZ1UzAvbjJ3ZjR3?=
 =?utf-8?B?ZE5BQStURzM2UTVVamlLYytjdVZ2bGw2dTUyWXppYUdVODBZeVpNUnZaMDRG?=
 =?utf-8?B?RzVaT3ZxMzAyWDBDVWFnOGNYRkpSVzJlbmM3UUNvMTcyTlNSQjd2T1hlc2dz?=
 =?utf-8?B?anF4V2FDOHRwREFsV0JWU0h6UFdyZTA1NHBNaTNJeDJZSkhQQkhMTVAwVG9F?=
 =?utf-8?B?dUhOOFZTL054ckV5VVl2VldqOVloNm80RTJrSk4vR24vaHNaYTFSSjd5dlZR?=
 =?utf-8?B?TzFneVJxb2pTQjU4S21Sd2dmbFVzZUxxSjFsR2l5RjVjUk9IWTU5ZURHWWox?=
 =?utf-8?B?SWU1TUphc0dPc1FBWW1mK0djc3dpWGFwRWtuVm05VDVWVUJWMGEwb0ZERHBB?=
 =?utf-8?B?b1F4YlU2a2NPQ21sY1JkVzBYOXlwQ0R3Y2U2YXN5clAxRzJ6V0ZqMGpDd1gy?=
 =?utf-8?B?anRRM3JPQU5FTTNUSzE4TVVLZjBrY2xuZlpQZGs3emIxNmRxVys5OUc2YmRY?=
 =?utf-8?B?eEhrWFpGRm1GVG1XMHRyMk96VkRhaFFIb1duVW4yNm1VOWNOZnBHNHZtbmtH?=
 =?utf-8?B?aW1mbU02S3hVRmNpeE1oMW55L3RDRGJYa0FldzVqQlhWNWo3K0lRcldQK29o?=
 =?utf-8?B?dUVHRmVMWmNwTElOYlMyZ3pBM3g1QWM5NTg3V2Nlc2lxRkFnUmZsU2RXTjZa?=
 =?utf-8?B?MmlRTHVFYVlWcDVDbGhna2N5Z3BCM01rVHY5aFcvL0lUR2FhZFo4dUlUck90?=
 =?utf-8?B?U0svMEJZOXcyS2FsTkEvZTNnbjRSeGkvZzYrVG1zOERPZ2FMWmtJRWtYcnBy?=
 =?utf-8?B?V1ZlTEZXNyt6Z0tBWmNQWU9zRVpWYTBXZVZzT3RPdHhhdlJYRmh0SzVzanJ2?=
 =?utf-8?B?Smo4Ri9JeTlKdStmSW8rOWdOZGhlOFVXdGgyZ3VHWS9tVkdjdDg2RW42cGFn?=
 =?utf-8?B?Q2hlK2h1dW9hYklJSEw5c1hxNEdBS3licUxvUDZTdWp6RU94TU9EdVNQUksr?=
 =?utf-8?B?NkE3MVU4QnF3MEtqME85KzZLbFljTkNxamJvcXpZY01DeXFnUlhJdlRBclQ0?=
 =?utf-8?B?VHZ5eG5BK0c1bmkxM0ltUEIzRFVIRmJjQ1pGRFUrWEdES2JPU25xcTJaMmhq?=
 =?utf-8?B?ZEpRY3JRTFAyandNdG1ramVydVVDTWVKcjBjSDN5aHFmdC9UVUlTOXdZM2w2?=
 =?utf-8?B?TGY5Ui8zb1pxOFNYQTh1UFJITE0xcm9GOTFYYmhwMVpmS2hrMnA3YTNSdGxl?=
 =?utf-8?B?OEMvVEFoL0FWWVAzRlN5cU9WYWFQVStiWEp2a1NrREFPSEpJSVdvMjE5Wk4x?=
 =?utf-8?B?RWhPTWxjVWxISmswcVNDMEcrREt6eDI2blV1OGRhMzNiVFVuMUpXVStNZmd3?=
 =?utf-8?B?Znh3NW1XRkhER0txOXhZME9TRFVwejNnWEtaVUY1VUhZRjhTYWQwWEdnQzRI?=
 =?utf-8?B?L2grSzhZVVFBZWloRmp1TnVCMkV2L3BySmFGZlk1L3ZvdDZ5NkRuQW8yVm01?=
 =?utf-8?B?ckVIQjZVWWZjOUg2b0RsaGxBNWZuOWpVc3hBbjBiY3RXbi95NjN1RndLZ1Fl?=
 =?utf-8?B?WC9iSk5rVlN5VUhhWU5zTVQ0Tlc0UHBveFVabFdHZHB4Tjc2Sk41TVdrOWhv?=
 =?utf-8?B?ZEdpUFlUNnpoRzFuSDVHNEJNSTV0NHpZaFdhQm5YbUI5cEdMNzJSV1RFczE4?=
 =?utf-8?Q?g2FLT96rF7IwML60nqmP49Nua?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e47f9d-840e-464a-5cba-08db8e747992
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:38:31.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swjeH4W5T0YnuLfNMSpgIRAZZEoeAnVaSz4EnZ2iiuAz2brzEmkuQnZvDJCIVMWWVXrRcfdhquAaPDKU6TIz+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026

Its original introduction had two issues: For one the "common" part of
the checks (carried out in the macro) was inverted. And then after
removal from the radix tree the structure wasn't scheduled for freeing.
(All structures still left in the radix tree would be freed upon domain
destruction, though.)

For the freeing to be safe even if it didn't use RCU (i.e. to avoid use-
after-free), re-arrange checks/operations in evtchn_close(), such that
the pointer wouldn't be used anymore after calling pirq_cleanup_check()
(noting that unmap_domain_pirq_emuirq() itself calls the function in the
success case).

Fixes: c24536b636f2 ("replace d->nr_pirqs sized arrays with radix tree")
Fixes: 79858fee307c ("xen: fix hvm_domain_use_pirq's behavior")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is fallout from me looking into whether the function and macro of
the same name could be suitably split, to please Misra rule 5.5. The
idea was apparently that the check done in the macro is the "common"
part, and the actual function would be per-architecture. Pretty clearly
this, if need be, could also be achieved by naming the actual function
e.g. arch_pirq_cleanup_check().

Despite my testing of this (to a certain degree), I'm wary of the
change, since the code has been the way it was for about 12 years. It
feels like I'm overlooking something crucial ...

The wrong check is also what explains why Arm got away without
implementing the function (prior to "restrict concept of pIRQ to x86"):
The compiler simply eliminated the two calls from event_channel.c.
---
v3: New.

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1349,6 +1349,7 @@ void (pirq_cleanup_check)(struct pirq *p
 
     if ( radix_tree_delete(&d->pirq_tree, pirq->pirq) != pirq )
         BUG();
+    free_pirq_struct(pirq);
 }
 
 /* Flush all ready EOIs from the top of this CPU's pending-EOI stack. */
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -711,9 +711,10 @@ int evtchn_close(struct domain *d1, int
             if ( !is_hvm_domain(d1) )
                 pirq_guest_unbind(d1, pirq);
             pirq->evtchn = 0;
-            pirq_cleanup_check(pirq, d1);
-            if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
-                unmap_domain_pirq_emuirq(d1, pirq->pirq);
+            if ( !is_hvm_domain(d1) ||
+                 domain_pirq_to_irq(d1, pirq->pirq) <= 0 ||
+                 unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
+                pirq_cleanup_check(pirq, d1);
         }
         unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
         break;
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -158,7 +158,7 @@ extern struct pirq *pirq_get_info(struct
 void pirq_cleanup_check(struct pirq *, struct domain *);
 
 #define pirq_cleanup_check(pirq, d) \
-    ((pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
+    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
 
 extern void pirq_guest_eoi(struct pirq *);
 extern void desc_guest_eoi(struct irq_desc *, struct pirq *);



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ECB603ACE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425547.673439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3go-0003qP-Sc; Wed, 19 Oct 2022 07:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425547.673439; Wed, 19 Oct 2022 07:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3go-0003oS-PU; Wed, 19 Oct 2022 07:40:34 +0000
Received: by outflank-mailman (input) for mailman id 425547;
 Wed, 19 Oct 2022 07:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3gn-0002QA-Kt
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:40:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fa9ec51-4f81-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 09:40:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7053.eurprd04.prod.outlook.com (2603:10a6:800:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 07:40:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:40:31 +0000
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
X-Inumbo-ID: 4fa9ec51-4f81-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U37Wvqu9UKgMQNEYUCUxBzLdO8eR7E1D/VNw5j00Suz1aTGsNuU+lBSqy9waEQg4IdgC12LrbrG6YrBnH9BRcmzVUhgNJuwAm7ByW45I8FQZXQ5Oqo1PhDZF2HWTgkza3aEiiF3BuFPeqR7bhPojtdtQZKJ9+KyPBkhpBtTBZ4kQhCQKMzuzO8F5YQ7C6ChxkvP0QX9/1NzkOLyDocuahxDkYXRuCRwPMWyS8GEaYBIjR034lzRf4XNyUiqLWtHM98ezYjsnOU4yQYemB+F3x2AMCkkEjJjenZiWoZebT3jtWP3glha47aKJYWuigLl7pUjhpw6ZGxB4fiSPijsPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ys5qUv51nmA4Djlb7ZReN8bSfFratiuu2AVuBlXA8hI=;
 b=hkvfCA3TvpnPlwwr9qPB+OkRdBGY8FGvw0pJ+Q4dhyfaYu5TOaSn+m3Laq6hqjB9MbPiQwWVl8jrfbF8+iv6DDgkwbXmDWgCzefgZ5FwJQgRpojK0Uwxc4jZtTj+e6FnIX6rkI2gWc40aWwrfXGbPCi0Rhs2Dnig9XhaAfGjg3UI8CbMfn/C9BCxYNeO0CxTI6l/41z+u6kTxxRgtxkWcrxbwiEvcI9P5qHWZ1vUk7wHAyQzIMzKOGmUz9LXdcXhv4J+/cL503BpftujvNk3A8s+6Tt3sJ0ApVT3Sh6l1OoUvWldPzNCMIXfFeQPVCPrO2jlekO7d92ne4Hzz5auEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys5qUv51nmA4Djlb7ZReN8bSfFratiuu2AVuBlXA8hI=;
 b=jW7HmTmecVUTa5ENqHULQr5tLw0/JXIzalGC0BumQ9EEgTe0IXiu+nmuCbsSROdQRIygOD0C9Iu6lJLYshqIYrOIeZDlJEWYgqFO7d7BA+3y2E4hUjGb/meggTjzQLsWfs1sDvfd3RHKXfkGkwZ5/UhP+j3e25cz/J9sB3KkD3YEB3NalgZMdKkHDEKII0rInf2HsfEe/CPHYCWgjUuNNP0Op7gCx/Mst8qGnfP4DqKv4jFZjTcD+n2m2BLcaxfZ/Bk7Mm4jT9IPxyCMdxVLptO42xgbj5AjklHJFo/o3KgHG9eO9TBAdJ5iD3j2kzuARnxAC7cww9CWjtJ5AzDJFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <214c9ec9-b948-1ca6-24d6-4e7f8852ac45@suse.com>
Date: Wed, 19 Oct 2022 09:40:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH RFC 03/10] domain: GADDR based shared guest area registration
 alternative - teardown
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0fbdcf-ebc0-4a6e-b642-08dab1a532fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	91ndG52ZwxfKmvtSDkw7DrjWZkHE3s8S+r8G7XFuaMXvBOm8p6IZaApwhQC/k6yEF/zflQZZgx7ii0Zxd1hxgSZeRw3Xt27rqKxcAoS9fiZnV5ZtzkETGI8Ps+7SrhCbY4bc4yj/8AlOoJejbjwm9/EDX9HMuiAwP5P3D+0BDzTCXn7JV3zOV1nIk6aDx/0/JXlGSNE64QKQEwdS7UvNjIIx6LEwL/5TMrZB8ABY7vzYOXNrbPYXvye3dnPY3KBsUicssHhIgTf07J9dl3dx687th47HGyY6Jac57zMt3RffhS7Jh/i3PPhCxCmwffSvMXZgY4IKUzDYyzIOH8oZqmoTE/nChyODsgQhUOhilnkyLCjUWgY2qjkpOcRr+79A0/uCxFfqWqmaU1hNe89R66A7j7pnhSbGFbOHg6RXluZi2t7t7n3O97QfaXn5zmCKumk9BzKTJ54nvXhy4OO/+QVJBRrxXl8sVzCOUSmXduzIWOObbOBxWM+6WbwSjFtaBf1IE6sXrwwv0wb0VD9cb9ZJYkX93mgSdeCnWpHekRhMxghxn1aIgTU+EXSTRfWFGLlmeJ92wvcTIM5gpaOGeNWrIHk5YBSr9DNaaPTQvef0pYFjNaDhWwEbfU3X8BXuH68hAwZsCKoycOHtEdSrNvVSnGSYQdVUfZ2LCNzB4l99t9mZ9zx/I64t1Z68/AFc1nxRVhYnQNbXj7L1s77qgbDyfauWGHMmYGptkIqN1futl1JtS6w5p3CIqGowHB/zaS38U33cno129auYvg/xf0Hbhl3J4mggOXjNnkGLVWQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(41300700001)(2906002)(5660300002)(31686004)(8936002)(316002)(6916009)(54906003)(6506007)(478600001)(66476007)(66946007)(6486002)(4326008)(8676002)(36756003)(66556008)(38100700002)(31696002)(86362001)(26005)(6512007)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S05HbDNsQ2piQ0R0WlNMZ0ZqclVoQnBHNjZLZWhDMVdZNjlaQlRBZUR4UCtX?=
 =?utf-8?B?WDRlZ2RoOTRQTVBDRlZlMHRJZ1FHUFdhSFZYekxpamJSWjRYTU9GQjVXYk5s?=
 =?utf-8?B?NVhSN2FwM1k2d1NKbU4wMVlOR2NXMVZqMU5yTlBKWlBGVDRMMGU2Q0RyWDVn?=
 =?utf-8?B?WVl1SUk4QWhzUjBlOEswMjNoMmpUeFB3MXpaQXh4cTI5N3N0WjdueFBCQ0VV?=
 =?utf-8?B?K1BPUzkwUDhJZEQ0M2YrUFpRMzR4VUFSZktoeG9hSnNGdUFnZ0ZtQUg0RmZ4?=
 =?utf-8?B?K2NhMFNVVG9ZcmhTV1hxZ0dpRFlQLzR1MVp2SzkwWU51SUR3OVV1N2VSL2ll?=
 =?utf-8?B?cnZLWFowVjdDZ0N2NWoxd1hlQ3JXMWczenpIbmREQ0thSlNrZUd1ekRhd0JM?=
 =?utf-8?B?Q2dTMGpkZ083Mjd2UEJ0RytjVkVNUGEwY09CL003S0tCdi8ydnh6SFhEVHhZ?=
 =?utf-8?B?QXUzU0NZMWdSK3lVOXpyS3dwdDQyTU1VSTRWK0l2YjBOUWhQS2VCY0txUGNt?=
 =?utf-8?B?Vms5VHc5UUpzU281OGo3WHU3djZaVzBjQkd0YUpZNWQ1Vy95bkYvRU8wNzg0?=
 =?utf-8?B?M2VXYkRMRDc0OHNnTkh5cGNKbHVmTnltcXc5VnhZZEN0VTdzWHJzeTVxNTNF?=
 =?utf-8?B?cklIaGh5L0pVRWpYQWlRS1dsTW9PTk04NkJHUE1MeThKeHdkWDJrbk5PV1kr?=
 =?utf-8?B?cGFKZ1Z2YXZvQy9BQWtRUitXMlBIcGxJUFVRT2NxWVNuVjFJNUMwM2N5TG9O?=
 =?utf-8?B?OHlXcTFzdVdvOFRKMEtBNGdyMFlGZklSdFBQcXZ0K2lDOWZzQkdjMnlXQVhT?=
 =?utf-8?B?NnhBM1ZmaFFuNEtrL2N6b3J2SlN1NDFacEg4TDd4YkhSend5N2UzYXh2YjRz?=
 =?utf-8?B?Ui9FTldZRjY3NUlQNmUyYnBpb0tZVmhhVXBWVklaVVc3NU1oOWZjekovK0Zh?=
 =?utf-8?B?aUZ3WVJnVC95OGFnZy9QT3NNbkRzWDBtODNROVV4ZTVvSVhxODAxSm95RjUy?=
 =?utf-8?B?ZmozejNzeHN3Y09YWGYxb0U2MkhrYjF5dGtTNG9EYWdhUXJISUd4c3BWWm8r?=
 =?utf-8?B?b3ZaQmdUY0pDd1c5SXFveVI5aVNjdy9zdXN0MzR2c09uSENUR3g4TzBNWk5x?=
 =?utf-8?B?N1o3VXRuV1pOYkhkRldKT2dSZ01LOVlIVXRoZ0JCTFMxazZiK0FWS0xkL1VE?=
 =?utf-8?B?RmtEQlBXSWZNbm1QMFhkSWxHZ3BmUzhBOHk1S0JRRTRSM0hjZ3BzREdrWkZy?=
 =?utf-8?B?ZTdoWFVQSU15WHJwUkh5WnNKK3U3YkE2aEgwTlhOTVE4MjFIVVNCOWNMM0VO?=
 =?utf-8?B?dGNCWkhHVTYyZHdqcTFxc2FFZlV0M2lGT2FvYVRqUU1UVUk0MENub1NpSFE3?=
 =?utf-8?B?L0FsTlhwSHBkUTJVRml0VlpxTm9NTktNMmFyQ0d1UUdFcGw2aXpGczlwZ0Vo?=
 =?utf-8?B?UWo3MjJJYVhGSVJLUmVDSldQNFNBWXV1RTgzWHQxeWpUWXBtR2NmekFBU3M3?=
 =?utf-8?B?RkpHZTkvZUZvWEtHdERPQ1ZuN1NUdEQ5b2lpRTZlOHNwdFEvcmJLa2lWemc2?=
 =?utf-8?B?SkQ0SlZmcXhlbVQ3aEE2d0hQN0h1bUtCaDF2NmpmR0V1S3FvVVBwZHJZeTBr?=
 =?utf-8?B?clE4ckpKZXpaZE5zQmRpZUdybEtJa3RMK2NtZGhCUlVvQlZxejRxN3lTbUtY?=
 =?utf-8?B?d1d4dG5Ka1pVODRFYXd2V2cvSVdLUGN3dVIvTzA4L2p4YkJHRmZabXcyUU00?=
 =?utf-8?B?ZGZ6ckVvZnlrbjlqbG1Bek1rVVMrMU9WK3dielhzYVdRNG9Vcm1sQ0pZdFhL?=
 =?utf-8?B?UmMxdmN4TE14SGRnazZXVjcvRVQwMHdJb0tzZDRUWTRhSXZ6SzhBaXNoV0xv?=
 =?utf-8?B?a2FwRFY2SEZaMlhqVkRGR3MrVGwzWEtub200cHZMdkZrY0Zhb2w3THZZQW9l?=
 =?utf-8?B?dlB1dUdIS0hxLzhzc1ZaVEg1cks2cHJ3TkljZFNFUGdSZ3lPQURNWDN1emJT?=
 =?utf-8?B?aS9uZHJuWll6MENNdEdzNG13UVY1YkQvMzFjNVJvS0ZXZlJZZzlKajA0dnZa?=
 =?utf-8?B?Q2h1ZDdnL1pBRXN2ZVBSMm9RZ3g0OU9nNkdMTjgzQlk4KzFHRWhTaGFjTUhS?=
 =?utf-8?Q?h1lx5ewCMpWw7qGLXLYDDPUl3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0fbdcf-ebc0-4a6e-b642-08dab1a532fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:40:31.1026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBTIDukUI3PcDhSfJBYbmRNLzJ2DY5oOfvZU4dfWBdLjk4WYBSiHZpRkYdnyWgsKlrMdul2swqc5K6QBuuQRvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7053

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary domain cleanup hooks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Zapping the areas in pv_shim_shutdown() may not be strictly
     necessary: Aiui unmap_vcpu_info() is called only because the vCPU
     info area cannot be re-registered. Beyond that I guess the
     assumption is that the areas would only be re-registered as they
     were before. If that's not the case I wonder whether the guest
     handles for both areas shouldn't also be zapped.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1035,7 +1035,10 @@ int arch_domain_soft_reset(struct domain
     }
 
     for_each_vcpu ( d, v )
+    {
         set_xen_guest_handle(v->arch.time_info_guest, NULL);
+        unmap_guest_area(v, &v->arch.time_guest_area);
+    }
 
  exit_put_gfn:
     put_gfn(d, gfn_x(gfn));
@@ -2350,6 +2353,8 @@ int domain_relinquish_resources(struct d
             if ( ret )
                 return ret;
 
+            unmap_guest_area(v, &v->arch.time_guest_area);
+
             vpmu_destroy(v);
         }
 
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -661,6 +661,7 @@ struct arch_vcpu
 
     /* A secondary copy of the vcpu time info. */
     XEN_GUEST_HANDLE(vcpu_time_info_t) time_info_guest;
+    struct guest_area time_guest_area;
 
     struct arch_vm_event *vm_event;
 
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -394,8 +394,10 @@ int pv_shim_shutdown(uint8_t reason)
 
     for_each_vcpu ( d, v )
     {
-        /* Unmap guest vcpu_info pages. */
+        /* Unmap guest vcpu_info page and runstate/time areas. */
         unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->runstate_guest_area);
+        unmap_guest_area(v, &v->arch.time_guest_area);
 
         /* Reset the periodic timer to the default value. */
         vcpu_set_periodic_timer(v, MILLISECS(10));
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -950,7 +950,10 @@ int domain_kill(struct domain *d)
         if ( cpupool_move_domain(d, cpupool0) )
             return -ERESTART;
         for_each_vcpu ( d, v )
+        {
             unmap_vcpu_info(v);
+            unmap_guest_area(v, &v->runstate_guest_area);
+        }
         d->is_dying = DOMDYING_dead;
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
@@ -1404,6 +1407,7 @@ int domain_soft_reset(struct domain *d,
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
         unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->runstate_guest_area);
     }
 
     rc = arch_domain_soft_reset(d);
@@ -1555,6 +1559,15 @@ void unmap_vcpu_info(struct vcpu *v)
     put_page_and_type(mfn_to_page(mfn));
 }
 
+/*
+ * This is only intended to be used for domain cleanup (or more generally only
+ * with at least the respective vCPU, if it's not the current one, reliably
+ * paused).
+ */
+void unmap_guest_area(struct vcpu *v, struct guest_area *area)
+{
+}
+
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct vcpu_guest_context *ctxt;
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -5,6 +5,12 @@
 #include <xen/types.h>
 
 #include <public/xen.h>
+
+struct guest_area {
+    struct page_info *pg;
+    void *map;
+};
+
 #include <asm/domain.h>
 #include <asm/numa.h>
 
@@ -76,6 +82,11 @@ void arch_vcpu_destroy(struct vcpu *v);
 int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset);
 void unmap_vcpu_info(struct vcpu *v);
 
+int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
+                   struct guest_area *area,
+                   void (*populate)(void *dst, struct vcpu *v));
+void unmap_guest_area(struct vcpu *v, struct guest_area *area);
+
 int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config,
                        unsigned int flags);
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -202,6 +202,7 @@ struct vcpu
         XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
     } runstate_guest; /* guest address */
 #endif
+    struct guest_area runstate_guest_area;
     unsigned int     new_state;
 
     /* Has the FPU been initialised? */



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A791E6F5B97
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529325.823620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEp7-0002PV-E4; Wed, 03 May 2023 15:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529325.823620; Wed, 03 May 2023 15:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEp7-0002MX-Au; Wed, 03 May 2023 15:55:21 +0000
Received: by outflank-mailman (input) for mailman id 529325;
 Wed, 03 May 2023 15:55:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puEp6-0002MD-1O
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:55:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e64e6568-e9ca-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 17:55:18 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9658.eurprd04.prod.outlook.com (2603:10a6:10:31f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:54:49 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:54:49 +0000
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
X-Inumbo-ID: e64e6568-e9ca-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWxT0JNuD/IcywYuvhA5HvAE1wg0FUD86AIUHN3xrgU2LOGT1lIEST8aWLu15jfJRV41koLhE+PglHGgE2nurqYpdJ1ihUX9ymRRI7k1fMIXJt08HazO+/2WYXqfyVunJUXi595easd5UDF7J0npFg/O6F8uPpzfxn5Fy7G+Hwr2vu4Wx0zPOgUnolSf8WU3xXml7DwGSCz0eJ+f73WrutXcMcTN1GXnACEqxP/CBz/2efMide4JVDF+in+8qIX6ZiqJp46UumsE+65+CwiAjUOaR7lpJs/3cqJ1oeBtV3qWemfhxkO2DAOWO7ELNyxJ3095CoorJP4xHDQxL8MLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ4sjL50lVdQLdIcCEEN0lFGFwGWLMMNd8s5YRynU9w=;
 b=CTnIt+QB4/HGpwjgHslqoHPIvwZ/DbsXDv9ayW8eRDJDJnL0stGVaMX+d5r1KLB/gozgW4NjAGUtTS/ZU2vT86AEigRMHHbI78Fx1eBCaHakjgnZR1JDOZ69WJQnF405r15wAbmC1BGQvl7wHQE+DZvJqys4i3Niz6ojw888ajbSQkc92fF6m50kibj6abRiDoHYbNpFQgDhB1wOT+w1mkWxVlx55gnltDdEwDqe8+gk333iJdkQe+yzxD3zD/dLieDs14pf+UQ9JrMWE00SDwMlSnRRnBmVg17ek81KpBfUtNscHYIvF5pRzihnCiadFcT9yOQydLcHyxpvHkWq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQ4sjL50lVdQLdIcCEEN0lFGFwGWLMMNd8s5YRynU9w=;
 b=ZZDp1jAKFNSe8oww7lYPnsm8pgapYjtkSCYrIbasG0m5wUCUl3BoPaWP+41vIMb7/9BpmVW4O8SeyRwkzgaHKms32pdoTm9wh0IaR0ZVnks8KkoNB9SwkT3iLarwrDZ3+oL2T4C1xGALMo+XGV14kQKuHL4seeMgM0SUBVck4J+RLZW0qnaiaMHT5/4PGRVZpCv0X4Y4kFMnk7mSPCgv70o0uze8YcLE7ONkZDZIn5gv7XKC+wn8zMruD8THSnP0l/IIJTTQZ7JtDfk0WU+qGLVT/gpZcHzQmF1N+feyFW3WLKnMSh4tal3tI1vbkDpnDmV0uxMaNjGX5i6pIl0LuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68cdb299-c41c-b6a5-c9ce-bd915508ecf2@suse.com>
Date: Wed, 3 May 2023 17:54:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 1/8] domain: GADDR based shared guest area registration
 alternative - teardown
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
In-Reply-To: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU0PR04MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5e5982-4c31-4f43-a921-08db4beeb9a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ATUtPuHGqXm+bDAuOd4cESMq7QuAD5Bkl4WjdS+yLWHkRmIwEQRpcDq5uaI6FMIJt0OYLiSTAoWZFaY31zfksU8XthFysVYI1IIm74HIZ58f2ot0pMCRpjJntofkvSdr7b+wjsyptOT5sPv5uy3AmGhPjqHeJXS3sdgoIE4atYlBckRsyqhxhUTnPHA5uTHOM+io0n5HEjANeKCUxUaWzobehyKYPFCYKWA6nIXRkYeY75tCmkH6X4Z9PlifzmpBDsKlGUHdXu2LIbrBrzrF7idClVzuYxYq1uaC5As8bbIyuCeV5olTM4Sna2kW3cMPgXfJIEH4ucWvr0hkIpd5mMeXE4aplJn5yCvrN/oTSqFPsEJuJTQi2DxQuRmaH7Z406+mNMFqK5AKNURIyjtXB3d/G6sZDCmr1LcqclXkSKVrLEOh0mtjMTq60z0wlf7y2Fjy6C+oa6YsUC/WbmUOvo81wAvu4VE+vSDIGJuTRqP++hmiBbJm9Ied+0bsBeidMRf+DnwksCOeAIf2iNOLOjKj3ZjnG6esM4cG9Pknxb8cCtUefOpsH2W5ehTdjRVgJqcQBoDjdI6T9pMqfJy4pIIduHcoF9uwmaSfI9XQ0JDI5hCcTNXtuiCvek+2uBUaYciijoIfCBO8W6nkpFDqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(31686004)(66946007)(6916009)(66476007)(6486002)(316002)(66556008)(41300700001)(54906003)(4326008)(86362001)(31696002)(36756003)(5660300002)(26005)(6512007)(6506007)(2616005)(8676002)(2906002)(38100700002)(186003)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVIxM2hvYityYm5yTm9xWWdYODViekMxN3VjSDVtR0RaamxVT1BXQnhvdlVZ?=
 =?utf-8?B?SkJWLzFqZDhYU0dPejFvUkVFT1hPNTB2Ymh5NXhGMnZXVVQ1MU9NVTR3dnM0?=
 =?utf-8?B?YlpwdEYwdXNsZGFYNFhFYXQzR2JrZk5TWStqT0VyWkRZRURicVhzMVVhL1pQ?=
 =?utf-8?B?Y2ZmVjFxVEFxSmNFNHBEL3RMWFB1NjdoZzEwYytWMGRDVDUvRUluaUg3NDdY?=
 =?utf-8?B?MlYraHdDdkthNkF6aUlBRjNOWjR4QXBrbFV6VzhUaUhJTUJ5QWQ5RUtYNHJl?=
 =?utf-8?B?Ym5YcHV4TmlUdXJwTGFqa3krbUc2WWFDd2VwOWU4UHB1VjFoMUtCSkVYTytV?=
 =?utf-8?B?em1FSnJ0OTJKZnhubU1RZUdyTEthYzFtSWVYOGN2U1M4TGtaVzJEc1V1aVF0?=
 =?utf-8?B?Umo4OUpPbldGdForbnlsVm9rdE5hWE1pOVdPeTdxcitLM2hveDB1ZjI4T3N0?=
 =?utf-8?B?UjNPU0JmZ3FyQUwwL1VRZkh6WWY0dkR1VEhPRCtVNXZnalRVemVhUEFkUGsr?=
 =?utf-8?B?VGJLL1EwdlhCNjAwbDJ1UGhHclRsd0RucDRXTXlwTUJ1YjRTSUdyKzBUVVdU?=
 =?utf-8?B?ZVZnVUZ2K1lESU5UR2dFdG1kUnN6bjJDTm9tLzc5Uk1JdkVTQkhxZGNTUjkz?=
 =?utf-8?B?TDJ1c3VwaGFqZEZYNlN3MUptZ3NUQTZJaGVOZ25KbkExL3NpdU0ybDg0NHFk?=
 =?utf-8?B?Q28rZGlLYi9ZVlhMOVFNMHd2T01LRG1vZ2djV3lHSzh0WE9ZNEFFWWZKNHo3?=
 =?utf-8?B?clNWOThWU1FiTFYxK2VKbUFrNG02bEJTT0YyUjU3Q0ZlbUhGNi9yckl2amls?=
 =?utf-8?B?T25iTGdqZWNFYW9GTUhYaVR1dkZSUTRiTVN1UXZrOFJRSkFVeGhnZ2NhVURt?=
 =?utf-8?B?a0pXcmZDYUUwVStPakI5RzRLWFpNcFNybnZBQ1I0aGV5RU1ydlo5OGh1U2dY?=
 =?utf-8?B?Vmd1NkhXTzZJbkREQ3lreStlN285VHNyWktwOTEwU0lhelFnQWVaVE5NOGEr?=
 =?utf-8?B?a0VLbHQ3VEZadmlxTTQ0SnJycVY2dms4Z1A0UjRhOUdWWmVOUFcvQjJ6cWph?=
 =?utf-8?B?QjhDd1Z6TjdaMUFqNjlrL0NlVmtObkVLclVscmxFVkR0d1BCZXRlYUk4TGt4?=
 =?utf-8?B?NDZLdzlIMnZlN3RKeEJId0FFb3p6UEZjT3VCSnFPSVVpTzRDTjAxZzlMdmpx?=
 =?utf-8?B?LzI2NWlUay83R0NwcGtDOVVObEIvN3dUMnNKZVp5Q3pNa0RHdVVpdzc2Ymxh?=
 =?utf-8?B?QkppaXRuN1BXVnZOcmRaalpvWlFtTTFrWHEvY3ZWd1hzeC83ZHFUcE1ScFpL?=
 =?utf-8?B?a0VTMG9aVm1DQUxQZ3JrT0ttQ2F3OHBiVHFhVFFKV24vUzVaU3F6b3hDbzlH?=
 =?utf-8?B?Z2dhSEhvOVRibTlPSWJpZ3VBVUQ4THEzYjlCVFZFY29WVjhUY1JtYlh1Ykpl?=
 =?utf-8?B?c2VBMmZoa3ZPN1J1ZXJOT2xBWlZPb2ZhbXhwWmpoL0lEenNydlFuYXpOd1Mx?=
 =?utf-8?B?M2grK2h0SHRLeVFZOG5JVFFFTklodXp0RHNwQThGMnc1SEVEZjkyVGVXeDdh?=
 =?utf-8?B?aG92L09HdVZicU41UmRvMyt1ZW4ySkFTVlVyS3dNcnAxdE1rdklvSDQ2OEdW?=
 =?utf-8?B?dFBIMjFWL3BrNnBVQTlLa0tzU1dqU0lReTBkYzlFRDM2SDg0NG9yMEFtY2l1?=
 =?utf-8?B?R2pBbjBtWW1Oc2VjM2Q5VklubUk3NHE4ZHptd2hSaUhQQjdWNWdPQzBOcEZl?=
 =?utf-8?B?WVc0bHlwTUZSVlhVbkVGMWF1QllGQjg4bnJhZ0ZmWi8rYUlnWmZBTWVudFpz?=
 =?utf-8?B?NXZtOGNoYldacGh0RmpFaDJuaVpDVitOTDlIVSs0T0tjRjlIMWcyR2F6UnlD?=
 =?utf-8?B?ZDd5bkdmUkUyVzV3Um1EYkJzYXMyVEVPc1d0dnVaYkhlcUpVQ3paQmVGNjNU?=
 =?utf-8?B?WXhrZ1JvRzU5anZOSFVXcWd3ZmxtQnF0VnFKTjVEUHRKU3VKU0pJLzJBU3g4?=
 =?utf-8?B?YUhoQkRTVk1tZUU5RjBrUWhTaHp2L25wblJLTGdLKzlkeS9UdHhJK0NCNXpx?=
 =?utf-8?B?dmFDVmFDSWJPdmVwZXo3TGdNY3RsclE0Q2h6eW9FN3J1YWw0eE0rWEwwYUMw?=
 =?utf-8?Q?IrXl3850+5Ziq5SIkOAFNSZiU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5e5982-4c31-4f43-a921-08db4beeb9a9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:54:49.3439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQ8Rjd067xQUqIeJOCXp0IjbyVVxKWUziIJ+yLKPTgRMxvnbayLxXRBLL6VFSFSDgWFkNaPqqtsc4Vf/Ekqi2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9658

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary domain cleanup hooks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
RFC: Zapping the areas in pv_shim_shutdown() may not be strictly
     necessary: Aiui unmap_vcpu_info() is called only because the vCPU
     info area cannot be re-registered. Beyond that I guess the
     assumption is that the areas would only be re-registered as they
     were before. If that's not the case I wonder whether the guest
     handles for both areas shouldn't also be zapped.
---
v2: Add assertion in unmap_guest_area().

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1019,7 +1019,10 @@ int arch_domain_soft_reset(struct domain
     }
 
     for_each_vcpu ( d, v )
+    {
         set_xen_guest_handle(v->arch.time_info_guest, NULL);
+        unmap_guest_area(v, &v->arch.time_guest_area);
+    }
 
  exit_put_gfn:
     put_gfn(d, gfn_x(gfn));
@@ -2356,6 +2359,8 @@ int domain_relinquish_resources(struct d
             if ( ret )
                 return ret;
 
+            unmap_guest_area(v, &v->arch.time_guest_area);
+
             vpmu_destroy(v);
         }
 
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -669,6 +669,7 @@ struct arch_vcpu
 
     /* A secondary copy of the vcpu time info. */
     XEN_GUEST_HANDLE(vcpu_time_info_t) time_info_guest;
+    struct guest_area time_guest_area;
 
     struct arch_vm_event *vm_event;
 
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -382,8 +382,10 @@ int pv_shim_shutdown(uint8_t reason)
 
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
@@ -963,7 +963,10 @@ int domain_kill(struct domain *d)
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
@@ -1417,6 +1420,7 @@ int domain_soft_reset(struct domain *d,
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
         unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->runstate_guest_area);
     }
 
     rc = arch_domain_soft_reset(d);
@@ -1568,6 +1572,19 @@ void unmap_vcpu_info(struct vcpu *v)
     put_page_and_type(mfn_to_page(mfn));
 }
 
+/*
+ * This is only intended to be used for domain cleanup (or more generally only
+ * with at least the respective vCPU, if it's not the current one, reliably
+ * paused).
+ */
+void unmap_guest_area(struct vcpu *v, struct guest_area *area)
+{
+    struct domain *d = v->domain;
+
+    if ( v != current )
+        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
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



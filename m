Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86377B1466
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609301.948305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllEi-0005wl-7S; Thu, 28 Sep 2023 07:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609301.948305; Thu, 28 Sep 2023 07:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllEi-0005tR-4f; Thu, 28 Sep 2023 07:15:00 +0000
Received: by outflank-mailman (input) for mailman id 609301;
 Thu, 28 Sep 2023 07:14:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qllEg-0005tI-Ag
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:14:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b925a907-5dce-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 09:14:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7811.eurprd04.prod.outlook.com (2603:10a6:20b:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 07:14:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:14:53 +0000
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
X-Inumbo-ID: b925a907-5dce-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XncfQc0sIzeHxi+64sRriMtsouf4h/fYcmpMckmZdPL10dfHqwhGShMnvoGaEWz5sETszq5daV+UltXJoBtfSo5YaVMHAL3VhEj8NOgcOJ5OZNBbIvVUzezH+gt6tgOhRcCg+rqogAxQwkPoWklZOOk/aGzxOhOnfPSjk1dHZ/fGIWWmoxop/SwQGBABeEErOT0NBg48JjZknm87BXPMi3ykbAWQC8faoemC7tUUTNycoL6u7yMgFmDTjkhzaoJNHEUK7fhSzSTifrxnBG3D6fLKfVlV13GHnCWQbalwWVvZT/ud4i/bw02FRbZW2suW3ccCakVNztRx6nVxE9/RwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INAcouYCwzSE0qAgMcfbHm4G+IYIvkxnPJ/SO/FIaKw=;
 b=S6eEd8eVwE9QNavKmcg3jn+G1qd+otdGxFUCqA0njVNLRc1TWC9aJTiOBjq128G9QG4L/t81EQXh7rChKwL26gedZydD2xt2Z0O0ZFgHxj/2ypUx8tMnLQZBKF8lU4ytsY/p/rdwsuzWm4TueqP23rTAcrhwOfCRBuezRa4uzzvCJbFVjfYvhwlKPi/rh5dQPZ/32sOf2PPiF9ZGwaQ7YQpCwDTmtXMzxWrVC1GgAvFXv505HR6NhVqKymvNY/jkU1bzB2cm3hWzmQQXsMsNiu6zeFvksQz0BTM2pIEUC25xH48GXxgTvXryKg58UQmGcE5t93APOa8921VXfx9Lhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INAcouYCwzSE0qAgMcfbHm4G+IYIvkxnPJ/SO/FIaKw=;
 b=zAdYvV1esiUOdqVmqfP71NVuZ+EHT0buBkBhIe1mNJ7Y6EBiwIl9LMDLVrGmHiJvIvT3P4OLsxrZB0dvSWVr5ns+ksVcaCZYWOZhmzQZWsnA7OtKhIauLxG/mYUpW5LcHffyGCHF5MWUJ0wPKuxp/UeD8iIXiwsPWvR2NvgmkPrNQs2IJrlgrP0dTWezOSYLfJ6Tc4sky0eDX5GGARn0y2gmL/1l9QF67xKqgzliymiTq93cJew0dN7hvWc17Rmt8SA3oRgVZOQd6elNyjRkycNEBHyvH1HeiPRJQIIvwT8bYbu3EoKR23d/5rnsdOIjJG0+16eCQrf8kErhfMrg9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <298c3470-643c-5f73-ceb0-4b0fc2441952@suse.com>
Date: Thu, 28 Sep 2023 09:14:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 2/9] domain: GADDR based shared guest area registration
 alternative - teardown
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
In-Reply-To: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dde82e-15e3-4663-599f-08dbbff29c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7uNXY13Zzk0PNbxDT05wIo/eyG7s+4xY2whxeWqYE0RZdsruVNZJyngvxCnIt0NRMIDYIRnlnIC9Sxm5hAxsaGRwcJYcXMzKvMpqDlChVA+Gadvlg7yO0xXpIoDRGVX3BwFhK/1ufZVd0kDSbD+tkJ12igoJUdZjiZrjhwizeQbyx5+Yw5SsgVd+eUrKWgyVECFl64Mw81hDJ5cePZBd7XlYYK4PFSDwvipzU/OrlDlLZEblIl7/2jYnW8uBYlFpQqZqwdNthkc7AxMKJ8xpVxcm9p1nDLz9M3Dtx2GqySjvv81c8FdmFl2HFlCQNlcVue5J3ZLvQAaLLecC3KHuLo4RE5SeKkw8NKCgLhnU537YoxC07/Ggl07vWMel3y5QUYeSY3PlxEmDraqbmAK9ofrVghw+WeJbI4IyZgz5UUtUMS+wR7YEn/DrZz3XILW5/Ri4/NSKrC3swW+j5cusi1yCvIMsKvz4mGeN1McNNeUs3EtlX+fu+n5JhyJhgPqWKUVeciNW8UNtr6RTUgiPcatYaOtivKRSY0/bmeHB6wF2qBaevLCtPWN2MA4N4UzsgRvRKRP3rPXfdQyOX47neIfSxcRx8sJ6K2UufG0+M4RALYp/FYvwrT52e0h68A86dIMSnB4z4QbwSJ5a1Or7Kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(6512007)(6486002)(6506007)(478600001)(2616005)(2906002)(316002)(6916009)(66556008)(54906003)(66476007)(66946007)(8936002)(41300700001)(8676002)(5660300002)(4326008)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGhUanloVGhYc0pUcTlGQTVPMi92ZzJmT1hacUNCcUhyZkxqSXlmcUljOFNl?=
 =?utf-8?B?N0RoRWhINXlsZW9HKzFaMVpoOHkwc0pGQ054NzA0ZEpyVEEveTdwUUVpN21p?=
 =?utf-8?B?L2t0QjFxRk00VGlsQy9mN0FnaVRPWDE4OFpIT25GcG5RTEJCZEYvVFkrVnY2?=
 =?utf-8?B?VEVFRHRjTVdGcGIraXhvbW0vU2NwMEJtYVdmZmpRWmw0bkhva256UG5aWHJI?=
 =?utf-8?B?NmdvelVmaUduZW1heWRmbHNZeElXWkJobnhTRTFmR0xTUE8vWHYvQUJFeHpO?=
 =?utf-8?B?UEowYk9uRDNEMnlhVzdpOWh1R2NxNnQwbW9zbDB3Zm5Zalg1SGo3TnJYRE5R?=
 =?utf-8?B?SEpoRGVNMm9hZ1c1TFhXOCtsVm5YOG1Ra1RzMXFiMDJsM00rV3lZYmpDT1ZL?=
 =?utf-8?B?VlRTRENmNkxBVFNyakxPM0pGcTJjZ2d0eDBEMlllU1NVS2d5RzBWK2kvT1FB?=
 =?utf-8?B?elVhbENRYkxFZmJUMWgrUVNCbHpIQUpwSWhLaW92RUI5ZmxuYy9vUjdCSzdV?=
 =?utf-8?B?VnhZbjQ1SEdVRHIwYlhrTHcyZmxiNUhIa3lmNkE3QXpaVzNTZWdtQmVMTitM?=
 =?utf-8?B?cDRteVlEcHZJN0l1ZWRoSi9pT0JCRE9EWlN0cjhIYU10VlFkQWVobjZ2bDNq?=
 =?utf-8?B?TVNXenB1SmE1SWtpTkZYaXdkOHdCbG9OSlp3MUhjY0FWbUp3Z09xU0lKQVRq?=
 =?utf-8?B?L21KU1lPSjA3QXJab2VGeFYvaEkrb1ZuOGNBNFNya2U3QXEwZmUzRnd3WUZO?=
 =?utf-8?B?K1BiV0lmcTlOSVFsSWcwdU1XZVEydll5SUZnbElJRCtyajM0NC9Gd3dYcS90?=
 =?utf-8?B?S0dzZyt5Qmt3QW5xc0tLdGk5b25ieUVTdXdLV0ZVNFdxbVRrbkZZdzljV1Rr?=
 =?utf-8?B?WkRKWnBIWjV2d2N3K3lGWVRvUFAyZGdKNDExTitWU014UXdJY2pjUGJuWFk5?=
 =?utf-8?B?dDJJZzZKTVRQdWdsTmErMmdsSUlIeWtlMmFHZ2loNUg0QXFxakFzTEl0NlJE?=
 =?utf-8?B?eWlJNG8vc1kxUUhKd3F2c2lidnNneUtmdUVnMVdCdVJVUFhrRWJLcklPTkEz?=
 =?utf-8?B?NmZJQ0p5WnJqRUFFcmtMa3JvNWUzU2RvczhzYTBnRmF6N0xGN0wyL3AwWWRU?=
 =?utf-8?B?SkYyOXliaDV5cEg1N1kyUDQ5NFR3NWxlVnJmR1VodkcrWkV4RHJUeGlUSndv?=
 =?utf-8?B?RTlsamk2b1NNbmpzT0lGMUZlaEt5TWhJWXcwWUJ5dkZKbXZ2VmRZMWxvMHhW?=
 =?utf-8?B?UHJsL0pLM09iL1d5Rmw1QmdJSUhZeWVLUThES2hEdjRTN3AxSmcwVHJ4U2E5?=
 =?utf-8?B?cGNVZUwxTUVLbTdFN2k2N2M3WTZCdkZWUnZQcjgvMTQwNkVMdnAzR2tQOXho?=
 =?utf-8?B?dk1TN0xMSTRKQldFcm4wVGluQVo5VitFNHBnb29VNmcrTjZuNTY2anlkMGtU?=
 =?utf-8?B?N2UyMERiTWFUVmFGbEkyT3YwRG1vOVZKRWs3KzhaSDF4MklHQzZDWXBXZUs2?=
 =?utf-8?B?TXJReVNhcmtGUkY4YisrZXJYMU1RZ1paUkI4QU5UR3VYcmJVK0NGV0ZyUVZs?=
 =?utf-8?B?ZWhvcnpESHFFbk91RkUvaGVQcTNmRnB5R2c1M2FpMk1vS3o4ZEtjenF6dnhE?=
 =?utf-8?B?eGUvYUlhcmQ1Snh0VUdKUmtRa0d4SDVYLzBZNm5pc1EwckZnOC8yWkwxWjB2?=
 =?utf-8?B?L3kyN21KWm02TjhVU25Bb2V6REtudUJvbG5Uc2JKWVY3MGV5dDg4dE01YWRu?=
 =?utf-8?B?MGpzUThnZ0x2SkJXVGw3SWVlK21remJIcUdVK0laL29hQ283VlFNZjZvUmVF?=
 =?utf-8?B?TXpPWEpieGFDR0x5cjhWN0dBTUM5dEpVdTRocCtxUWhZWThGMWJIUmxiRWVl?=
 =?utf-8?B?MG9Fc2xhcG9JaGQ3Q1dJTW1hQ2RwZ2dKcFN4emkyK3pqV3MzdmY0eXJqK2NO?=
 =?utf-8?B?SXZpOEZCZ0lSNHZHN0xNdzZ0Um93UTFjVHpMMzh3ejZob2ZZNlJiSnlaVGc5?=
 =?utf-8?B?M3RWN1g1cHJzd1NkSVJabHE1TVlPTjJmUyt4SERJL3JiVTExbVhVa3o2NjJN?=
 =?utf-8?B?cTByajVvaVZieWNGWGxFaTNHek9HUnIzTFVkeFhYNXBBb0N3Q0E4QjgrSlUv?=
 =?utf-8?Q?pi4PmRnP6A6S5s4aXf67qw/YP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dde82e-15e3-4663-599f-08dbbff29c79
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:14:53.2770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrrNK5DkDPLi0kbA3ws+huJTiC35quKfi8mjyvT0ijM2904QdPXSecx3HxMZTd3WO9RPu3a29/4NbZRBWfiipQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7811

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary domain cleanup hooks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v4: Re-base.
v2: Add assertion in unmap_guest_area().

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1024,7 +1024,10 @@ int arch_domain_soft_reset(struct domain
     }
 
     for_each_vcpu ( d, v )
+    {
         set_xen_guest_handle(v->arch.time_info_guest, NULL);
+        unmap_guest_area(v, &v->arch.time_guest_area);
+    }
 
  exit_put_gfn:
     put_gfn(d, gfn_x(gfn));
@@ -2381,6 +2384,8 @@ int domain_relinquish_resources(struct d
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
 
         /* Zap runstate and time area handles. */
         set_xen_guest_handle(runstate_guest(v), NULL);
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -992,7 +992,10 @@ int domain_kill(struct domain *d)
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
@@ -1446,6 +1449,7 @@ int domain_soft_reset(struct domain *d,
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
         unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->runstate_guest_area);
     }
 
     rc = arch_domain_soft_reset(d);
@@ -1597,6 +1601,19 @@ void unmap_vcpu_info(struct vcpu *v)
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
 
@@ -77,6 +83,11 @@ void arch_vcpu_destroy(struct vcpu *v);
 int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset);
 void unmap_vcpu_info(struct vcpu *v);
 
+int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
+                   struct guest_area *area,
+                   void (*populate)(void *dst, struct vcpu *v));
+void unmap_guest_area(struct vcpu *v, struct guest_area *area);
+
 struct xen_domctl_createdomain;
 int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config,
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -203,6 +203,7 @@ struct vcpu
         XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
     } runstate_guest; /* guest address */
 #endif
+    struct guest_area runstate_guest_area;
     unsigned int     new_state;
 
     /* Has the FPU been initialised? */



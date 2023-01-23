Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03554677E70
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482947.748765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyCN-0004Wn-Or; Mon, 23 Jan 2023 14:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482947.748765; Mon, 23 Jan 2023 14:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyCN-0004UR-Lt; Mon, 23 Jan 2023 14:53:27 +0000
Received: by outflank-mailman (input) for mailman id 482947;
 Mon, 23 Jan 2023 14:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyCM-0004Rs-DL
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:53:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afabc85b-9b2d-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:53:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:53:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:53:22 +0000
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
X-Inumbo-ID: afabc85b-9b2d-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXMuFJfzrcQlpcDC69Incyxye9jFnwS750Wdii0DIuTGkz9QRcBAKq7ON9H4umSJiUrQIcZMctqIzsamEnaAMRb2yve1YkIqkxKUeq79nRO5GaRz3DOOkt6MNDj2VpI8IZTwNX6Yk0TVs4TfcoHjaxVEK5jgJ5vCMsXBsiJMLKGhafGSFYRTzvj1WvFXXaC65gmKEwFlfMrJQUypHgIT1F/u+mcadn55X1HYdIARZEo+LM5sAURFTthP9dC0h0WOMo3+L/TX5db6RF9jEcLkANJW33llMZejcrjYnNF2oQwZXHQiLhkG2qwf3wZH3JOuqTtsY4K0xKECsCdj6GlJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ieUVVVZIskofyobszOZSotS3S7+YkheR+/Im8erqdU=;
 b=fldU3ziAkLwa4ox1AkWShDeX/nHqVy222+XKZcuva4OihxXyvMPF2FnK6yonqo7TfgghpXyILZesNXSSPEmHTUcVRK8BF5Ng2Rn7wINf+yJ6TsTHnub3PpfWX9tu7UZ16wEkL8zPPy3pXN3Ebo8jRAM8F8DpZmmAD5AP7klVDhJCyKOts7jGsXGuFnQqvNudx6vAkmusycPVfGPo4Q3q5B2qIzMBOehXCknG6+uOOglJQIpjWzsV0lgF3h4VOtgOqB6ZaATaAHwwEdqDT5MjGeAGRInVjS5vSWcDlQxHxPthSmp152QNsU3P/VouHIDm/qqkl4rGpCUOb0j+MP5Low==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ieUVVVZIskofyobszOZSotS3S7+YkheR+/Im8erqdU=;
 b=esxef1x32bA3RXV5hIalJEseDd5tFDfOXiD+tvs7AnAkzfjeIrUhLELr6YtNWXs8uJdERHKuuWFB29zl3IM7LYSfguHY/tsteemR2D9ds8cuTqQHDmXn+IWmziV4uRzxAKBLJCOLhB8lKdHWBFhgjo/HFUB3IppOwyRkmVkefJ7bDJ0pWbNuLRg1RuHMQaWtLngcNwzJQ98ecpDXXv2EK8F0dtJJMCJXPqNy//tRWkeYsKNraqXFQ6oClbLM6NqRuvU9Oqwk7n8SxkfU7OoN5JaQwZHmNpM7Pk2ntSSj8jSlQPr/AZciNqTPn7skUtAJNzTS4+UwNKvlSunGm7fUyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a9fd51e-d083-ad95-8f38-2829c980bb66@suse.com>
Date: Mon, 23 Jan 2023 15:53:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH RFC v2 1/8] domain: GADDR based shared guest area registration
 alternative - teardown
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
In-Reply-To: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: b814be01-3ba0-4110-1e7f-08dafd5192eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ZcH9VsGK1/hHH4DrxWcVsGeRTD/vD0LrcCssfY0beNe0GXux3MLSr4o6cFYHW6YhlNpnwr7KZ60+HHAPw9R3qWQR1IHc5a2aUWhgp8mKHoJY6qZXRt79sId86XMvs3EpYT80LJg10jtKQn7ZrJXjRndeKPrsm2JEYV+aEbqA2YI4cSoscvzK/r4UNDadRtnmmvJrKOQgd7Qr1tdWNnSukNd3h+u+S2jg8eaUxVUktWr8uOHirbIw8EqT/+AfNpICY+xeXfbwBqpaUj5865lE+tnIZLuEYQDRBdxFM2At2KCog32KVdlwzBWVlM1ypzMo1xnGcMIhtv046Fy+ctuhSQDzjTt4jPMOcJxNoiOHR2RpdrNvXPvUhalKX0TiMJwhyWBQAP8UAE55N6zCVDwqjXhzFv2oAXrC/mrhoFVweCmqhXPVECWl5lniEWBlGtacgapFeC8NTMfDeklfYcUGJIcaQ8FcC8Ec9WKnRy1CI29fYpEzQ8DuUb5k0UUPl87N36PkP8f4NOtPrVseXOCu6kGESTwAiUcVf2aoV/agvDsBi89+aAW5Uars0woXBqVc4ARk1iKOVQvIKdlYGD8sY6kLzVZ3WcZV71SrT1ZY2mg7UwNWiFNURQNOnxk7rwNgsgA/JzPhYXb07Z6rDHx6EN4eYdC56bFXzaAwvesak8js6unFdq8IF2yhjeZxO00e6gHA4Zr9/KMYzLZXpbHvsYy0S5yYOGXYwqSaa96BLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199015)(54906003)(86362001)(41300700001)(316002)(8676002)(36756003)(6916009)(66946007)(4326008)(66476007)(66556008)(31696002)(6486002)(38100700002)(478600001)(2616005)(186003)(6512007)(6506007)(26005)(31686004)(2906002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkNzRmYzN1NDZlplRXNLd1Y1QUZCbmY3U09Pejlla2wwK0ZJRFh4NzJOQWpF?=
 =?utf-8?B?RTBiaTlNWlVGdm5MOUsxV0UvZ3NBbzVSZWpjVjY4aEhIckVBYTVTVEJIcFQ0?=
 =?utf-8?B?Q0NGdm50dXg3SlVNNTNydDhwMnd0aTR5V2cvaEl4bEdydVlMSUVNbG1NcmUr?=
 =?utf-8?B?RjJDK2t5aitaWVF6NVBxT2hqeWh6MXYxSStJUExSaS9PbHRpUldkbmNKa1BR?=
 =?utf-8?B?RXZSUUh3cEt5QUw0YjlRV0Z2dXNWc2Z5QVN2V2hVRytUQXQxYnN4bW1EamVn?=
 =?utf-8?B?OEdYc2tsYWpJcW1BaUJ0eEM3dVk3aTlweFdDVFdjOWxBdVh0UmoyZDZaWVd5?=
 =?utf-8?B?QjVkbDRmRWdDM05FRC9Jbi9iK094R0hjMFpWWE11Rk5oWGQzRjYxai9nUnM4?=
 =?utf-8?B?Z1c4U1BWc2Nkai83UW5TOVJHbU5xaDJienZNT1ZTN1FERlVEYkR3YUZDVklF?=
 =?utf-8?B?a2M1MCtUMnFtTUxCZ3NHNW1JZlZtNkJxdHRCOWVCUmVpaHdSa2RQWitPNUNq?=
 =?utf-8?B?M3ViMkhieWZudmdEeXk3b3VwalZmNzY1L0Y1MklIUlZEdUJHNzJScmlYTzAw?=
 =?utf-8?B?OTRhMmx6UDh5SnFETmJ4OWpOTVFlSklzcTYxVStnM1ZWMDloTE91OUZncWZF?=
 =?utf-8?B?ZElvVG42NW03M0M5OVU5emRLUjVJcFpsMldjRW9vTXZpYUk3UlVmUHNFbit4?=
 =?utf-8?B?WEd1OGttcng0disxV083emFhbkdFQ0l2OTNxdVZucTBmOHd4RFJ3bHB5NnRU?=
 =?utf-8?B?dklYOThPZWZNNXFMK01RUDdxeU9NU2tEYXJZV05nNElXQllpa3pwVGxBZEw0?=
 =?utf-8?B?Z2FSeEZxYkN5d1BTZFg0SW0vSkd1NTBzYXQ3azI5NHJ3d2l6dmtUQkRTd2Nt?=
 =?utf-8?B?YjRkR3A3SmFlOUdkZ0haajNDdTVJd2FzakVrQVdmVjV5bndmRFdrOWNtRGR3?=
 =?utf-8?B?dXFOK3lqZFlkYmlKWDV0MGVDQ1VnRklLR0loN1JRd25YMW9LTENwU0x0NGda?=
 =?utf-8?B?VmlIbEt5cU5heUdmQmQ4aEFnaGhRRlFqRXhFcUpOZ045a0Y1MDRSQ2d6WTZX?=
 =?utf-8?B?WWI4RUxKeldDM1hSd0JLdG5LUE1PazVtem9wNVduaHJSb0d1b2VKYzQ5SGtR?=
 =?utf-8?B?cUFnMHNVajYyV0FsNUwvSHVRUjdVRFQyY0dTUGVuMGI5V0FZM1QvTTIvM2hv?=
 =?utf-8?B?U1A1TDZHRk90QWJ3VWhjeHEvS00waGJVV1ZNdERkSTNBc00wd1NlamZXWVhz?=
 =?utf-8?B?a1BINzBvNzlUaHhkMWNvNXVaWi9zNTBiSExLZTRKczhvRUlnQXVFSm5ITXlY?=
 =?utf-8?B?SGxMN2VxdUZsazlCYXNYUG5zMWJKczR1NGdNSmNGOThxU0NpZEFOU3E4NkpG?=
 =?utf-8?B?RmpuYTRacjZ5NEVMT0JnU0gwTDVQM01wNjkwK2J1SzRYZkpHSzhyZ3VPRjlk?=
 =?utf-8?B?NDR1R0hmOHFmWTc0aTkzTXVoYjhpd1lVM0dtV1Jnd2RqdFZGSE9HUWl1THF6?=
 =?utf-8?B?SjB0c2JXZUNCUkFrZDJrWEFJZUlGczBMQUl3c2tQNTVTczY4K0tpKzhzRjc3?=
 =?utf-8?B?YkdmelJ3Rm9vOGplWWIvcDVzNDFmRDV6UnNUaDlqNHNBVTZzakdQTlR2ekFa?=
 =?utf-8?B?N0ZTUGVjUzUyOHJvMkVQU20yK2gycVRGTlZNQmxYODZhV21sZWc4N1o0VjRS?=
 =?utf-8?B?czQ4aVhTc0N5MkhUL1lJSkUzbmNuNW5BcWtUWlNBc29rbnBSanlTWU5rdTho?=
 =?utf-8?B?Y0lUOXZBL2RFL1pwTERiMTFlOElodEhNRGdNazI1TWg5dTA0bmJCc0p5VE5s?=
 =?utf-8?B?QWEzUEx4NDF0Q1p4Z2Zhb29iNldkM1B1R1hDUXhzd2dIOE40VWp2QmNhbE5C?=
 =?utf-8?B?cU04dC9MVzZ4UHo3cndMb3ZTd01vb2xwNFI5Z0k0Ym82N1VWRkhORmhLWjIw?=
 =?utf-8?B?ckhuV3pMLzJQZWt2TVBSRmwzZjZJWVQzenBpSnprOFpIZVRJaXFQU0l0bkxQ?=
 =?utf-8?B?THhYOHNpRmlyNHRmUnEvSDBLZ2JWb2JoV2lKY0FDbDh2UXhRUnhBTVFSWmc5?=
 =?utf-8?B?bklNTUR3cUxZYWFVZGxiWktrazVhYkdWQXFaRnFlS0x3UndkVDQwQ2c3dVRT?=
 =?utf-8?Q?5cqbhST9+6tW0eo4mMnJRLeYq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b814be01-3ba0-4110-1e7f-08dafd5192eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:53:22.7906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xCEzB4ZIIs59guhEr+jSabhPV0O5enaoa2pKbyyI507xppZ1NS4FXl/Q2Cz+4yyAoeXlryYLN4ppqzOcTb9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773

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
@@ -1014,7 +1014,10 @@ int arch_domain_soft_reset(struct domain
     }
 
     for_each_vcpu ( d, v )
+    {
         set_xen_guest_handle(v->arch.time_info_guest, NULL);
+        unmap_guest_area(v, &v->arch.time_guest_area);
+    }
 
  exit_put_gfn:
     put_gfn(d, gfn_x(gfn));
@@ -2329,6 +2332,8 @@ int domain_relinquish_resources(struct d
             if ( ret )
                 return ret;
 
+            unmap_guest_area(v, &v->arch.time_guest_area);
+
             vpmu_destroy(v);
         }
 
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -658,6 +658,7 @@ struct arch_vcpu
 
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



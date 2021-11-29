Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908B24610E1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234367.406752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrchU-00023v-VH; Mon, 29 Nov 2021 09:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234367.406752; Mon, 29 Nov 2021 09:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrchU-00021N-S0; Mon, 29 Nov 2021 09:11:52 +0000
Received: by outflank-mailman (input) for mailman id 234367;
 Mon, 29 Nov 2021 09:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrchT-0001Km-4T
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:11:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 626debbf-50f4-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 10:11:49 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-tJzzrkJEMqaeOpyx4GPydg-1; Mon, 29 Nov 2021 10:11:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 09:11:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:11:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0099.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Mon, 29 Nov 2021 09:11:46 +0000
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
X-Inumbo-ID: 626debbf-50f4-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638177110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VzBI2412mUYvVTF6nElIfuplOF2xNQD6sD5YCcOEANA=;
	b=I2WH7rpI218ypVBDE/62Z5TN7fqLHB5Vf+Uc86sMrFIQRWXL6lQeDWyO3GktKhNwfGHTh/
	LNjlOhf1Ww2xIA1BA/97ZqCNiHkU/EhsOESyfGs0ZBHDChKPuszGs7HgieJtL0cDDQZ9PE
	7f0U4UBdfeqh6X2ETEQ3ZH7BsTD5fRs=
X-MC-Unique: tJzzrkJEMqaeOpyx4GPydg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoG6/To2SBx+7al80e3b1H81UjFOPeKkHK3u+fKBcHQZtuefNlG0fV6v4umptnjiCv8e4EwQv27IfztWGx1WVGUZRoOCr8JsGRWK3wdhuPSNWBkah/dGDLYgF0wccGPOf/U2oU+nFDAc50hqHRmFObnw9eF92BCMOz3PC+Fuv0k12/YGH4z2Ya1sG3dtDMmw/AeLbrpAm1/fs+UtBVc+tJGvFmVn8pircrZEYm4MjImFbWVZgwPIulKcAo0SdzVCEgCrnXeeqi7oqjsnkXDjR5m5yO4iqvGdvm/dRkLPb66MAfY0BpzhwTHTxjAU5uBj8Q4tYvYZUuf56u1ETQ0b3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzBI2412mUYvVTF6nElIfuplOF2xNQD6sD5YCcOEANA=;
 b=Wu8YiNb8EZZBHPULvmB6saEBd96N2WY0rMT7Ir4aFqwb95mEgXfSlWTYbf8pfXr0+YfpHUHgJdX3xQxcURaytjZlOOHp4Ygy3kVvAHFVzQLtVKw1HONiNVgzvc/GPg4ZKtdMJUYYHvgKrVCDFGh4tpRmbqEvCLNpCiXI4yiYpPgArMj2tVp939I6HUTTHOtq8JjSCGw8iKVgUeujNrzDD0k6WDpapkYgg9tL3CKwj2BvOQTV9KUXptmyuvwbaHvXQ96NMj+zStaoJNiHAkGO1JiaVS58prvNKSOB07KoqBEOo4ZAgis+h4u7SNrP5B5qAl9xh+Tl2mLpnhuk3/vaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f59b9122-010b-0a5a-c436-e10928452443@suse.com>
Date: Mon, 29 Nov 2021 10:11:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 3/3] x86/vPMU: move vpmu_ops to .init.data
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
In-Reply-To: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0099.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a186a0-59b6-44dd-0ce2-08d9b31844fa
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384DD2622664805B1603455B3669@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2a6ZEHShZmcdwXADy55F1Q3DwECYzGqzsID2CSM1N98MYnwO8N2n+XXuABUBDPCwCflc0hRoWNSXO7WIqN6XXbqVGvlE4igJLvswDQJsNhzDVvlDAW0IW8ULHaQ5PXPaFMY+e/rS9nap+Kxpa4d8wAmLa3eAZgJq6I2nmaEekaIpoXkU/QQdE7/FaSFYi6BdWM4RhdcSW6kIZFNTuXiyK3vYXuyBEkX5ctRhBvY9FTKxCvrAJaQIYml14MTmULtDn7rzJ2J5eM1LoNHYgPfeoplQI7foQP98GspKwAkOdW+ZPrrUw/NTUS7UCHInvT+CBDfONHANSanFVXEO4pQ4sLKDDUykgDhxqE5wM7KxX/DJUH/2IvCnjAkLpiQdeVI5BTHPJlS2uBW/My9v7xz10YfwJa5g3HYGs+Isu9nBZxo9uQh8iKm5VX0FEyhYeR5mMB7UAwFiAYpAoaPwd9S8+KzVXrxFVIm5Ry2H8ZFyHgQRWJmuvI4Oo4t0/Ev3RtiJAt5uRt/YdGpWrpiG5JRS4vRFkMceuEteZga/UgIfJWvDJyAxVAlr2M2nlpkiorVQiqQuYF+W8U99j0JPWz2Amh5++3G+LmPLa7UA07OC7kn27pT3D5+LA4f0ZKbE113KYHUwrZgEu3gegzARJIVO0gTQPjelFxuKZrlOh8YNg4McQKFA5y7Z6+FtIHO8/DMUEjLEXf++Vi2V4ewnYIFW1H3xzstkSl8e6olivOuBNfUVqiXILqr6egQ6eTCfgZaxl4DBF7uvhNfqfkNueiMsLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(38100700002)(8936002)(2616005)(6916009)(8676002)(26005)(316002)(956004)(186003)(16576012)(31686004)(36756003)(508600001)(66946007)(4326008)(86362001)(2906002)(6486002)(31696002)(54906003)(83380400001)(66556008)(66476007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0V5bTNSdDZUWjlwSU52VVg4YjMxM3Iza3cwbEFJVktXN2xhdVExQ0xyNXph?=
 =?utf-8?B?aHZmYTVNczdBdGZXTFYrczlUUHB2NE9Yakx1L1VDSnRsd1ZodkY3d0NsZHZC?=
 =?utf-8?B?OVdya2o3VkdBc0VIbFp0aDVpQlg1TWhmeExWYUtRZU12dnphVHJRcGlzVUtZ?=
 =?utf-8?B?eG9RNXY1Z3hETng4UFhyaWNuV04vTXY1ZzNUWjNha1ozdTgyZ3MvcUIvWlcx?=
 =?utf-8?B?TlpsZG5XMW1Od2lkWGxpU0dHWm5RVWhpV1FrelBmeFdiNm5PWG9XK2dQamNP?=
 =?utf-8?B?V1RIaGg3ZFlsdE9HRG5qNjg5LzNiOGlZK0Q1YkpRdjJVdjNrTGdaU2d5b3Ax?=
 =?utf-8?B?NmJ5aWZRTVAxcHB4L3V1RjJ4eVlTWlM4eEpqS2c0UzNQWnNEcERLZStFZ1BQ?=
 =?utf-8?B?aVdCTnBNak9Lc2lTZUZqVWpuMWVXSDB2RExOdWNUR0FUTGRYSVRjRi9adVpS?=
 =?utf-8?B?b1grUTJobEFCczF6VUJIOG9uT0NQSTBmbEJwMlhLWm50andxWndHZWs1RCtH?=
 =?utf-8?B?RWU4K3AzOXloQ2tkK05yN1dONCtrbUdTRXluNlBTMmFJZFdQRUp2RHZLam5U?=
 =?utf-8?B?YkRSd1lFT3pmeXpqajJFTUhUL085UE5rdlppOVRacDJndFA2N0tjVWE0ai9I?=
 =?utf-8?B?YzZOSjcvV2lQc1lqWEpRU0g2VVhraHRteE5zMFhWeHlXZHJvRFVTT1ZXR3Y2?=
 =?utf-8?B?aDdaQytXUkR2Z0EzcDFxdGpIWDY3YW93Vzh5STQrblgrN2FJMEc4Yms1LzFT?=
 =?utf-8?B?QWZ1YWdyQnNNN2xlU1lmN0ZhODF1QzdmVTl0aG9TVFozNGZCSjVLdnk5eUFO?=
 =?utf-8?B?bEk0N3FXbHpWYkljcTVIZ2xEdHBic3UyL1Y4VUIrK3JXTmErbTVyTTcvT0E2?=
 =?utf-8?B?K3VXbWRXNHlrRXRJdjZqTXU0Q3d0ZlV3dm9zYkZ3aU9ubEVQYVdSc001SGFG?=
 =?utf-8?B?SGJDeXdtZHBRMWhLYm5yQzdGMXVmRXhici8xQUUyYVlna0dqVlA0VnlBNm5W?=
 =?utf-8?B?K2JyN3FrS1Uwdklad0R1c2lVdVp5VklpWWpldmNrRDY3UFVncHRCRXdoUk4z?=
 =?utf-8?B?YWtGamNXZ2tCRzNiNkxCUk93eDlISE05YUpEdzhRb3BtYnk3ZW9ZbEJyY2xw?=
 =?utf-8?B?dS9tR0ZZS1V3bW56dmwzQ2oyQUFvdnVvMmZXSy9JVXcvV2lJUnhzNUY2SEJW?=
 =?utf-8?B?VmNmUi9YTjZHOWptN3JnZitKdkppTEFmZlFheWc2VGRSVnNuNVRZS2ttenpW?=
 =?utf-8?B?SUxMYkJXWGlqT3FhN3o1bXllYUF2VzQxSTE1Z0FHRjB3a1U2cll3NDM4UDFU?=
 =?utf-8?B?OHpPUTdGT3lTc3NycGdLSnIyZ0FIT2FOSjBpY2xUYm5pc1J2Tk8ycys3VG5B?=
 =?utf-8?B?SzdlMXJiZndsU0pxZDdMcW5PQkp5cE5mRFZtQTd2Wk9SeGVnbkdtZ2dRUyt2?=
 =?utf-8?B?Vm5KRTJYS2JRL1l4RU5maXJCQVJnKzRHQVNHV0IrcWZKa3ZuU3Uzb3FlSVJQ?=
 =?utf-8?B?dWZrZ25yWXF5QnMza0NZenVYcnBvaURiazl4Zms4QllWbk1NSHlJZTBjMG9T?=
 =?utf-8?B?UmVidjNhcit0V1ZDdjZFQ1QxYW9NL3haeUZteXN2ZHRLdFczSnRkZGVmVkpC?=
 =?utf-8?B?bVVMUlljTXA5YzFnQXhRNkYzZEVEM0NGcWwvRmRRRW9SRHRVUUlMbE9KdkFQ?=
 =?utf-8?B?OTIxajBNQU1iUFd4VHhzQlF2WnlFYUg1TUQyQnZnbm1ZZXAwVnR1OVhYL2JL?=
 =?utf-8?B?d1dZNkFXSjZxWWN1elJqckpseVNGSWUzODFEaGxUSGh4NXI5Uzg5NXF6dnFo?=
 =?utf-8?B?YkZoQ2ZXS3hMdUFpVEhVK1o5NUtDL0dWMlBTcFhHQjRuZHd5R09zeHNtQ2pL?=
 =?utf-8?B?TC8rWmJuYTRzR2h5S2czV0ZhVFg0TmI4V0l0Q01zcjNoN1pzZjJPYlBGU2Vs?=
 =?utf-8?B?RHZ3Z3ZtSllLODcyZzhFV09Oa1hJZzJEdEowejNVcVA5aTh5SFJGSEhraC9P?=
 =?utf-8?B?bEpXSlpON0N0MnZzWENHUXhmR3MzT1VWM3BJTHNZbVNyTU5Ta1JRdGhubExl?=
 =?utf-8?B?Z09LajM5UkxOTitEcW4xQW5EWHYzK3AzQ0wzVTk5cTJHa25POU1OZTkyV2Jz?=
 =?utf-8?B?cm00S2hVS2NKbDhENWt1ZkQ0TXZLKzFFTGNiNEJhdXRicFpaL0FxemRkZ0Jr?=
 =?utf-8?Q?K3l6Dok+WCqOofLeKufRktk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a186a0-59b6-44dd-0ce2-08d9b31844fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:11:46.8800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLDI6gPzbXbVex81UrU07MzDxIW80KNft6GQVlW7OXEQaAukJ09GlbeAVlnSYKF1LxRpSTVOZkfuiny2NfQzvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

Both vendors' code populates all hooks, so there's no need to have any
NULL checks before invoking the hook functions. With that the only
remaining uses of the object are in alternative_{,v}call(), i.e. none
after alternatives patching.

In vpmu_arch_initialise() the check gets replaced by an opt_vpmu_enabled
one, as I couldn't convince myself that the pre-existing checks would be
sufficient to cover all possible cases.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -49,7 +49,7 @@ CHECK_pmu_params;
 static unsigned int __read_mostly opt_vpmu_enabled;
 unsigned int __read_mostly vpmu_mode = XENPMU_MODE_OFF;
 unsigned int __read_mostly vpmu_features = 0;
-static struct arch_vpmu_ops __read_mostly vpmu_ops;
+static struct arch_vpmu_ops __initdata vpmu_ops;
 
 static DEFINE_SPINLOCK(vpmu_lock);
 static unsigned vpmu_count;
@@ -136,12 +136,10 @@ int vpmu_do_msr(unsigned int msr, uint64
     if ( !vpmu_is_set(vpmu, VPMU_INITIALIZED) )
         goto nop;
 
-    if ( is_write && vpmu_ops.do_wrmsr )
+    if ( is_write )
         ret = alternative_call(vpmu_ops.do_wrmsr, msr, *msr_content, supported);
-    else if ( !is_write && vpmu_ops.do_rdmsr )
-        ret = alternative_call(vpmu_ops.do_rdmsr, msr, msr_content);
     else
-        goto nop;
+        ret = alternative_call(vpmu_ops.do_rdmsr, msr, msr_content);
 
     /*
      * We may have received a PMU interrupt while handling MSR access
@@ -375,7 +373,7 @@ void vpmu_save(struct vcpu *v)
 int vpmu_load(struct vcpu *v, bool_t from_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
-    int pcpu = smp_processor_id();
+    int pcpu = smp_processor_id(), ret;
     struct vcpu *prev = NULL;
 
     if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
@@ -423,21 +421,13 @@ int vpmu_load(struct vcpu *v, bool_t fro
          vpmu_is_set(vpmu, VPMU_CACHED)) )
         return 0;
 
-    if ( vpmu_ops.arch_vpmu_load )
-    {
-        int ret;
-
-        apic_write(APIC_LVTPC, vpmu->hw_lapic_lvtpc);
-        /* Arch code needs to set VPMU_CONTEXT_LOADED */
-        ret = alternative_call(vpmu_ops.arch_vpmu_load, v, from_guest);
-        if ( ret )
-        {
-            apic_write(APIC_LVTPC, vpmu->hw_lapic_lvtpc | APIC_LVT_MASKED);
-            return ret;
-        }
-    }
+    apic_write(APIC_LVTPC, vpmu->hw_lapic_lvtpc);
+    /* Arch code needs to set VPMU_CONTEXT_LOADED */
+    ret = alternative_call(vpmu_ops.arch_vpmu_load, v, from_guest);
+    if ( ret )
+        apic_write(APIC_LVTPC, vpmu->hw_lapic_lvtpc | APIC_LVT_MASKED);
 
-    return 0;
+    return ret;
 }
 
 static int vpmu_arch_initialise(struct vcpu *v)
@@ -458,7 +448,7 @@ static int vpmu_arch_initialise(struct v
     if ( !vpmu_available(v) || vpmu_mode == XENPMU_MODE_OFF )
         return 0;
 
-    if ( !vpmu_ops.initialise )
+    if ( !opt_vpmu_enabled )
     {
         if ( vpmu_mode != XENPMU_MODE_OFF )
         {
@@ -564,18 +554,15 @@ static void vpmu_arch_destroy(struct vcp
         on_selected_cpus(cpumask_of(vpmu->last_pcpu),
                          vpmu_clear_last, v, 1);
 
-    if ( vpmu_ops.arch_vpmu_destroy )
-    {
-        /*
-         * Unload VPMU first if VPMU_CONTEXT_LOADED being set.
-         * This will stop counters.
-         */
-        if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
-            on_selected_cpus(cpumask_of(vcpu_vpmu(v)->last_pcpu),
-                             vpmu_save_force, v, 1);
+    /*
+     * Unload VPMU first if VPMU_CONTEXT_LOADED being set.
+     * This will stop counters.
+     */
+    if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
+        on_selected_cpus(cpumask_of(vcpu_vpmu(v)->last_pcpu),
+                         vpmu_save_force, v, 1);
 
-         alternative_vcall(vpmu_ops.arch_vpmu_destroy, v);
-    }
+    alternative_vcall(vpmu_ops.arch_vpmu_destroy, v);
 
     vpmu_reset(vpmu, VPMU_CONTEXT_ALLOCATED);
 }
@@ -681,8 +668,7 @@ static void pvpmu_finish(struct domain *
 /* Dump some vpmu information to console. Used in keyhandler dump_domains(). */
 void vpmu_dump(struct vcpu *v)
 {
-    if ( vpmu_is_set(vcpu_vpmu(v), VPMU_INITIALIZED) &&
-         vpmu_ops.arch_vpmu_dump )
+    if ( vpmu_is_set(vcpu_vpmu(v), VPMU_INITIALIZED) )
         alternative_vcall(vpmu_ops.arch_vpmu_dump, v);
 }
 



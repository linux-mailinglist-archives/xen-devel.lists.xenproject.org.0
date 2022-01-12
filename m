Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B648C093
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 10:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256404.439966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZUL-0001Zv-32; Wed, 12 Jan 2022 09:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256404.439966; Wed, 12 Jan 2022 09:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZUK-0001Wo-Un; Wed, 12 Jan 2022 09:00:12 +0000
Received: by outflank-mailman (input) for mailman id 256404;
 Wed, 12 Jan 2022 09:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7ZUJ-0001Wi-Rm
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 09:00:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c2818d8-7386-11ec-81c1-a30af7de8005;
 Wed, 12 Jan 2022 10:00:11 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-K5LKwEfpM1iKrIhsGQ7mAQ-1; Wed, 12 Jan 2022 10:00:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 09:00:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 09:00:07 +0000
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
X-Inumbo-ID: 0c2818d8-7386-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641978010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=99aq0vw8NRqNyBe+YhHkXBIjNUpFYn+VJxKaX72+69Y=;
	b=AO8AyPt1Uw3xZKXJ64quH8Ad1EqQJwkGFSvc64yqd0JgaMk0liPCSBmFaY3CGlaMTaUQHJ
	8AyokRp50X97gqMkAk0Kzzn4+149nVyzbHK3SzTcSPR0qJmMEzDt5BLfrBj5aWONsrU92B
	l+ScAA3rfad3mG5a5aijTn9rnctmHHY=
X-MC-Unique: K5LKwEfpM1iKrIhsGQ7mAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq3Qjt5xNlO0Hu1MOkHgWSeruHkgT0NNR/NQvOzLGUDCrZadtpnYhKL0z756aFcZaj6FeJ8HG/nImGMD0otneNyBRBugxryWWV2ysH7qektcDxdyBUmRgsHM74WVgWDq4yK2mF6N1qvOWLyfq7yXFGT23nx5xfEXqtcT9cJmpqhHCtrU/bjrDrZ2dha8QViqoyfbAnLm19NARXzlOdQRBeR/YmEE5eogFyULfdY2m1R9mU1oqcte6lLb7+1zrLrzFXQQmpqbOB2ahKv/bCjDmEBBySOzM9PKW4OkrpnzQUxdN0A3mTUwIB/ZibJH7Ikkh4wr1PDwvj32mIENp9dtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99aq0vw8NRqNyBe+YhHkXBIjNUpFYn+VJxKaX72+69Y=;
 b=NuVIv/FGXKOjUdRh3WqWrjCeK9uM7BqukvQ1K/4hKYzPic5U+OJK7qbEhEH8HqqOlXDHLr8asQXno7AlZoDtjS1LXe7uCDqpKoRjOUmKe94X0J0CngEefsVBCoh715CtpOsdxF9DJbEBbIpE/vdISWhBNSluTkTpvmi4+xgMipIXd6znvKhWKd6VtYiQVKNFHOK4OozBw8QaodaxQPD7bBU0/sPmK5I91EWhW+NiGg0og+xd9yOEulWOHz7yJQdVXMbzDv+h+EuSzblCJAhvMXjZpzAGmy26/8vLF28KhbOebXtqw2B3WsDQqZDxda29fXTOp45g/0EXWxeI95OGXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01baee92-9d7f-5a2c-d63f-1de390bc10e2@suse.com>
Date: Wed, 12 Jan 2022 10:00:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: replace a few do_div() uses
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24f4a0c4-335c-43cb-5cf5-08d9d5a9ee50
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494354B6E27013E5E6799C16B3529@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dWntAXfu+vdJXrD71MGQxyaO47ZKSwbByt3NcMWPGwwjaQIWcUq1AF8oTfPwYKUDxpitPJhCm8g7vsJiuW9U5M1Aih5mbu4lzf50aKV5tL66ee25DPjosUXNQy/+zRybqd5k1A+vpSJbqJygkkeCgmWJWRdlfjGez/+MtvJsgd0xHwzk0r0vN9YPjmFG4MlvnkYS61tq7GxAVVc9DBAojUnN0vEOyRLhhODKmwjV2iDXhZmiIfQprbWZ6G8nK1jQsh/dL3gBtOmDTjVnw8gu2WpZSUpfFdbqbNCZvXsY4C2R1jNXqd0VfEFCJpddTJbbL7I731OfoBGdystDfxB3vnCXIGT3d5Ve3B33+a+58/TAHkgKZu/ogC5OwiLGYRikI2SucugKQIAH5NrgYeqaI488moz3MBJzPT2BwhkU4HMqa/F4Az/uut/aYKumo7IyvX/PGBCisLvaFbeEJworgBewgApRW/ON+nqsS9gwNTxrk/GIDLoM5AwDyH/oc5jsVGnz37Mobq1PdpXAQLy0OfKbIOKyOZujjdLpt5lDIrCq0Qi3GUTFapeSKsEee6grb6qaZQD/G0Ye/vx1DuuHf6YooRJ16rhbybugcKk4apgtt2MQzn2V484eKbAr1EmX53RnHAuHAhXGxzYdtU2paDoTfT6cA3lElso9evPR+UvCQwmD/rBYn+R8TZzaNHXsLbuxaptX4V08WkAQ7l1LkjNucrSe7nwOiY0uvKbc1hw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(66946007)(8936002)(6486002)(6916009)(8676002)(5660300002)(2616005)(2906002)(6506007)(6512007)(508600001)(36756003)(31696002)(38100700002)(31686004)(26005)(186003)(316002)(86362001)(4326008)(54906003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzFQQ0lFQU84eXViR2gxYS9xSGhVajZwV0RrT0h1U3IyQzg5dGF5SnpIRDlI?=
 =?utf-8?B?eGQ0bVFJZlBOTGRocXR4UmRRVTZFeEdybHRwcENpTndlSEU5T29haVZlMlhF?=
 =?utf-8?B?ZmVEckI2aUlmS1BnSnJvN1pYZHNMYnR3OEM1MmRFeGROVEJ6Z0JJYmh0emp3?=
 =?utf-8?B?bjZMMW8wZlRjelR6QVd4aU43NzdDNGZoQlJaaVEyV1BYVDJVb2cyOUVFZHRh?=
 =?utf-8?B?dWxaMFJxci9wRm5vSzRQMkhJcWFEWWVFeU9HSGVld2VlSHhwdTRGdjFacGgr?=
 =?utf-8?B?NTE0Y2Q2emZQclpnZTRXblZwZlljVzlwUmpOS0I3eC9SUnljV1F6cm1pVG5C?=
 =?utf-8?B?Njk2TFp4TE5OaitTRzlCT0REVWRxcTE5dkhGQm8vWk1wTzB4RnlOVVMwYUQ5?=
 =?utf-8?B?WDFhaE00V29mWkRJaGE5OG96WWVwTVlBUWtXUjdnREE0TUppVC9zYkY0VjhV?=
 =?utf-8?B?SkxyMnFzbXMvenBpTjd4dE1pWW9pbUZWSlpCWEVBaURMQjJPR0pNeEY1N25p?=
 =?utf-8?B?dUdXTEoxWnpnamMyanBWY2lIeXREdHk4eDFVUlFiMHRmZitYTjkydFZuQ2NC?=
 =?utf-8?B?R05GS3dLeHRzdmI1aTBSVjJabXBjWXBUQjlXSjBuWkpFU0RNQTRHbWhQUkZU?=
 =?utf-8?B?U1JDU0tIemNHb1hXNmQzdU9FTDZUOXJOL1hEK3JYV043bFY2eWRncmdYYlF3?=
 =?utf-8?B?VG94TjRlcS9valZKekZXM2dDRGpEc0tsb0I3cHhaM1NwTjRreFpINTE0ZDUz?=
 =?utf-8?B?Vjl5V3FoNXBIYjVpcXJxTWxBdlByN3UxY1BsQmFqdlkrQWVWeTVKaENIQlM0?=
 =?utf-8?B?MDNwTTN1dHZPRk43cFFvOTZUcDZlRytCdnEvQUpjdjFEKzE0dUtOU0JQWmxV?=
 =?utf-8?B?UVpZaVh1eVA5TnpPMTFWcnJyeExzbUVDR2JEOTRWMWV5dHRMUms1SUc1RkFJ?=
 =?utf-8?B?TnNWZTQ2a0l5UzBMY3cwR3BTakxiYS8xdzR3cmZuaVdLL1gvNzBtSVNGZ28y?=
 =?utf-8?B?V0drQlptOVZXbzVKMFFkWVRMY3ZxejVpTzFMQUdOUllZZ2l6eUJEM1VRS3pv?=
 =?utf-8?B?NXZDWHpqNVVJWFpYaytzZ05kRy9xTzltbHp5ODVpWjR6R1lsZ2E5ME0zZ2Z5?=
 =?utf-8?B?OStXdVY2eUE2U3h1Y0laSXArdWhWczZ0MTNENFltbnVzc0pnNkJaempORGlo?=
 =?utf-8?B?SkVEczNpU2pWQ21kMzJza0ZBQ0ppd0pqL3FmMjBscnVKMjM3QkwveVM2dXVR?=
 =?utf-8?B?Y1BwZC9qUS9Panh2b08xem1jVU9rcUN4MDI3T0J1cGsrVGpnUzBWOEFTeXFi?=
 =?utf-8?B?MjNZYnVPSnJWL28rcXhJY3FTeldSbmQ1NnIzWFZMU1NwbEQ2VGNYZElVb2pr?=
 =?utf-8?B?bmZORzBDYzNVQXJOQVNYbXNXR2ZHU0lua3hwYWRHb3QyNlV2aFBiNnQ5UUZp?=
 =?utf-8?B?T1VMdzIrTlN4UUEzRGlQVWcwRHBTd0JBbm55eTFBMUg1S1pYT21DWnJqYU5N?=
 =?utf-8?B?a1hCM09uRHpQY1kyVGdrbFIxeGtkMk8rUzZZbkZ4S0hFYWN1QzlVUk82VXRE?=
 =?utf-8?B?Z1N2SjBFK3dmSi9uOUMzY05OVTVndXlGYi9PSUJCV2RwMTdKNm1WSDdMMzV5?=
 =?utf-8?B?ZDVJTUk5Q2RpdGRqTC85NlFYcjlmWEttVnFONnllblRWQnFDYzd6b09GWk1X?=
 =?utf-8?B?QkVCa2d4MEpuRzRXMzQ0cG5zTHhuSVVGSzhoSUJnUDg5TjNBeWQvZGFBMGJz?=
 =?utf-8?B?Mk5KdWV0LzF5K2hFa3QzWWQ0ckdlSnVWTUxMUDNMbmhram5pZ2NOQzNsRkdt?=
 =?utf-8?B?THZSZkFUMFQ0MExMZnJISWpSdVMzaC8rc3RqWmZRLzQ5UnkrazB5Qm5sbWkw?=
 =?utf-8?B?Q3lsNldXNGlUalpER0pzNStHTWthLzNMUXozWThac1NmNjNpNVBGdjdkbTQ0?=
 =?utf-8?B?WDJiaEEyWXJvbmkwdE84bnRkRUdNcDJ1elpNTkhKMncyQmJwaXBMQ3MzY24y?=
 =?utf-8?B?K1RCRXN5UHczb20vYUd6M1BDMHNOQUh4anBLSVNiMmFtWVFQRGNMRmFZK082?=
 =?utf-8?B?RGc0ZklpTFFqckdKcmYxWkx2Zm1DcnVCb0tyU0dCWlBxM2Eva0EwOFM0ZmtH?=
 =?utf-8?B?eGRzWGxQU0pQRm5pN2Y2N0pzeFc2VlhGWVoxRm53YTM0WWVXRkJ5TlIyZE5O?=
 =?utf-8?Q?aNdUhfS52zUkPGKOzspP36Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f4a0c4-335c-43cb-5cf5-08d9d5a9ee50
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 09:00:07.5478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whVY8KKauIP2E84gIa3UPGBNHysyFN1pvElpe6j9pKRncw8sF3u9ZSyTabLpzzM/OABo5Fk2+eHYtuA2t9XxNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

When the macro's "return value" is not used, the macro use can be
replaced by a simply division, avoiding some obfuscation.

According to my observations, no change to generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Arguably the ULL suffix (in write_watchdog_counter()) or the cast to
uint64_t (in div_sc()) aren't really needed in code which gets built for
64-bit only.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -392,9 +392,8 @@ static void intel_log_freq(const struct
             unsigned long long val = ecx;
 
             val *= ebx;
-            do_div(val, eax);
             printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
-                   smp_processor_id(), ecx, ebx, eax, val);
+                   smp_processor_id(), ecx, ebx, eax, val / eax);
         }
         else if ( ecx | eax | ebx )
         {
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -105,10 +105,7 @@ custom_param("hpet", parse_hpet_param);
 static inline unsigned long div_sc(unsigned long ticks, unsigned long nsec,
                                    int shift)
 {
-    uint64_t tmp = ((uint64_t)ticks) << shift;
-
-    do_div(tmp, nsec);
-    return (unsigned long) tmp;
+    return ((uint64_t)ticks << shift) / nsec;
 }
 
 /*
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -292,10 +292,9 @@ static void clear_msr_range(unsigned int
 
 static inline void write_watchdog_counter(const char *descr)
 {
-    u64 count = (u64)cpu_khz * 1000;
+    uint64_t count = cpu_khz * 1000ULL / nmi_hz;
 
-    do_div(count, nmi_hz);
-    if(descr)
+    if ( descr )
         Dprintk("setting %s to -%#"PRIx64"\n", descr, count);
     wrmsrl(nmi_perfctr_msr, 0 - count);
 }
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -610,8 +610,7 @@ static uint64_t xen_timer_cpu_frequency(
     struct vcpu_time_info *info = &this_cpu(vcpu_info)->time;
     uint64_t freq;
 
-    freq = 1000000000ULL << 32;
-    do_div(freq, info->tsc_to_system_mul);
+    freq = (1000000000ULL << 32) / info->tsc_to_system_mul;
     if ( info->tsc_shift < 0 )
         freq <<= -info->tsc_shift;
     else
@@ -2173,8 +2172,7 @@ void __init early_time_init(void)
     set_time_scale(&t->tsc_scale, tmp);
     t->stamp.local_tsc = boot_tsc_stamp;
 
-    do_div(tmp, 1000);
-    cpu_khz = (unsigned long)tmp;
+    cpu_khz = tmp / 1000;
     printk("Detected %lu.%03lu MHz processor.\n", 
            cpu_khz / 1000, cpu_khz % 1000);
 



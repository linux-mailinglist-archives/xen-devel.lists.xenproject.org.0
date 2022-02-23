Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB974C0FE7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 11:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277263.473710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nModm-00068C-0P; Wed, 23 Feb 2022 10:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277263.473710; Wed, 23 Feb 2022 10:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nModl-000657-SV; Wed, 23 Feb 2022 10:12:57 +0000
Received: by outflank-mailman (input) for mailman id 277263;
 Wed, 23 Feb 2022 10:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nModk-00063c-HP
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 10:12:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2af43107-9491-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 11:12:55 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-1qtB_w43ORWL5V3XoRAkvw-1; Wed, 23 Feb 2022 11:12:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3004.eurprd04.prod.outlook.com (2603:10a6:7:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 10:12:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 10:12:52 +0000
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
X-Inumbo-ID: 2af43107-9491-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645611175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh7f+LBqpvIMNCjCDOJiXb25hwsGdct++TnJN1+j8lY=;
	b=dqeXxKdKqyzLVlffWW0mvShefVhNQl9ecmh8kfZOH6EpwjDLsjcFsmB05DctUEDLAeJQF+
	ZHf1LRt35IH217yief9frulbnbwwWw/92y567C4OHY1ApeSD2tg86RWNZsIQMGC9ao9JIA
	atuaX1OZdbStpB2TgdKE4voa+ZsU5yA=
X-MC-Unique: 1qtB_w43ORWL5V3XoRAkvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYSWRom+mbYbqITaeiPawAaNs1fYsxB3aeWUas25CSyX/GlE4q8cMY4MAxpXz4vfBCQZvOyZZET99KwR5cGUzAtf8/nzZXqnEv5mviAXjnuAAtl+DnhsdAVrrPL0UADUjAwwt8gPbhQHXhi0IRej1DWWTzbMJ4svjyqqS3B4q8UfiHitO+nk4e4veF2116zFJq61HXHUxEMb2B+BEQW3qr5tFd/avw/Rrxz7JQasrEo66ESObEn62LKYRcUxkb1brP9Lwwiim7pMiZLfvVh4WEeGua98DAn6wokTo8RcCwD4p2pRUmQpz/LHnkccMVyhlDqiy39DPjr7bLKTAuigCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh7f+LBqpvIMNCjCDOJiXb25hwsGdct++TnJN1+j8lY=;
 b=aQuZMXX/VId8N2/9y14DSvJd8W7wDHGzE2rB2PZEXSYrQaGWS/NSQZszSDgAqCkrYwhAw1PxkUvqw6VnKNX5X1Z1vxvXhuq/eAD9EUmVTjbexXz58ekbCxkldQTg8siMi0SsA1dmtNrqkMDAPcvsqC1tI8Urif8GKKTt28tiTlqHoU9BBjVjzXsic6R3tqKHeHWcdQ1XlHiiOBxYB4RFHX6rNwjZ3nlNk++ySsQWXtug4F4YMUhKDH/fZCABcO3QWplZN2E2tRV8J5DoktIPpBV/i8wTUDWApc+KgQmGuBrUg2II3fuLkpbA/Qj1NJCOtzJC+qo74+0kZnD9dmX4rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c1f9c24-a07e-b5b6-2f20-18eacb835763@suse.com>
Date: Wed, 23 Feb 2022 11:12:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 2/3] x86/cpuid: replace more cpufeat_word() uses
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
In-Reply-To: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13411b8e-f3f3-456e-21fe-08d9f6b50d74
X-MS-TrafficTypeDiagnostic: HE1PR04MB3004:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB3004F9F84CE5D742E31DEBF6B33C9@HE1PR04MB3004.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+yHwTHIzSfCoOJYxZ8nHPXEL5Fx+X+axAwR7fS5yV6sY+jLlViOwVuUtT5AD680mtbFgl0dpFpu0vz4dfSN2zZwWmJb5PCrGLn/T19/kg3wukwOwU9dDQqe38mO1KAJFSEWU0KrR8nk8V8la0+uURUa7t/nulGluhErlZ/JJv+0xmoa6vWNWLbdmrNkTB+U5foljpNV9Kzh/0etGePk4Nnh1JLvShyH639cKtG1TQ32F5sJvR38L9/cGAtwDegrYmhQ8uXnBt+MZ93RXO1S3Sg27aVD/iERyPp5D/nWopwa6MoO7tw/Gg+bwuiipI4jjWHB2ACQV0MBXnPrmiA3nAqegY1Uc/cZh5hZYdc9qOVYTJN9PUV/+AmXg2dtBrD8Q/lA7Ab5Dt2bN7Wk1GHaJOUdFeuyqnYkoas2zG2znddlBeDvZidFjIdJRwPJ4JI4mWG6RlvhPIoqqMj4TtqNZnUktlzJqRN0ZRVWhhmd+H96IeCMDDVFpHT3htovorIBq52FV5X2cO/9KTq0x6uklAYQqsdzDScOUBizRfMEU8FH1b2l1/toBh+QhvFwUjFvADMVj8KwJbYOH1CBDB6z2Z4+9tLltGIukv291b/+1laacqpOn1FKBaUDsy1v4sgnokvWgUCDwiVhqWTWy1k/DD0Ngih74HwbH093ma+cfJCGCi20iRSoX8fTvThe9CbmYB3c+CsBE3dwH80uLEfzWW17k+b4ZhEDgB6EhHToSOsnq2TA/9Sf1Q2RmAuFQe2tw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(54906003)(8676002)(6916009)(508600001)(38100700002)(2906002)(2616005)(86362001)(5660300002)(186003)(26005)(31696002)(4326008)(66476007)(66556008)(66946007)(6512007)(6506007)(31686004)(6486002)(36756003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVViMG8wWkN4TzNuMEFTNEdFeVNNc0dvUHA1b011VkFYSVdSWXR1OFF5VTZP?=
 =?utf-8?B?NnpIYTBXcEhwbTU0TWRyOUJMOWEwU2thdVRSMEkyQnlKeVpwMHpSdjZjd1F2?=
 =?utf-8?B?aEFrWUt4RzdrZlI4VE9EUG1YckJHblZlcHR4NTljNTByNXVkem5mMnRxbWw3?=
 =?utf-8?B?VGF2VytGb0dOS0VXQ0t6MlpqUVFEb1NKOHNnYmJoTVB0TitvWkVMYWwrWHRC?=
 =?utf-8?B?bk5qMUZZZXgxYklVM0pzQmk5VXBDcjhKa0pwZ2VYUlMxL2kzU0R3cE1pV2NF?=
 =?utf-8?B?ZEZZTHRTaFErMDgyd2ZleHZJODR0NURjNHIxM3lyRmVFTUdVeURUQjFLRzBB?=
 =?utf-8?B?ZlFFVVAvTEI4TU1VSmJ2QlVScnNjUmlMdmJRa0JHODlvb3NEMytXU0JoQWh5?=
 =?utf-8?B?V0E0OFNTQWx0b1dUbUtkdHBHUVlTQzE2eUJQVFJ3d2N1ZXNKN1B1TnNMdElF?=
 =?utf-8?B?L0c0bk8xWHV4VG9hb0piT25Ta3VVSU9BLzcrWndjRzdVOXVpK2U0T2ZKV0hQ?=
 =?utf-8?B?aWc3akFQNjNTMXdvd1Y5dVdwdnJvSU8vQ0dYVzVUOFgzNElXV2J6N1F6a1ov?=
 =?utf-8?B?ZDNNSEVXZGNiVnhFNWg5QkYyWFZ1VFBSSC9VR2lDQUxFRzlZc2VVeHZxczdl?=
 =?utf-8?B?VG9FNlQ5YUVwUkU5K3haRXRCdktkMUtPVXhjZCttdWtINjBUbzc2aWlqdUM2?=
 =?utf-8?B?UzMrWk9SemZWVlVFVGg4b2trZVVKYlNXN3lJeldFNG5oZ0dOV0FWamo0MHRv?=
 =?utf-8?B?cmlVNVJwa0dRUzJvSWEvRC9hM2RKclpVY2JGOXVlYUJSaUJBTjZGK1dLSXQw?=
 =?utf-8?B?UUdXMTBxbXVYZU1DM3NNR0lzWlUrZGpwQTdmWDN5NFhIeHRDTzczOHQxaDBs?=
 =?utf-8?B?V1pXaG1CY1BEenIwbHgyeVQ5dUUvSG9PSnJSKzNkd3Z2YUpJRGtCWGRsV0xY?=
 =?utf-8?B?blArc0hFKzZWVmF6NnJlNURTTFhhNE9TRjI2ZDJlejRBcUZlQktySzVSOUht?=
 =?utf-8?B?VFlSalFuR284Ny9uZnc5U05tZEt5dkhURXY4QTNIQjBnTzU1RUN4WUc1SXND?=
 =?utf-8?B?ZlAvUVIyZUFSd3VsVVNwUk0vT0VVZUVVRUgwK29tMkN2WExxTXRnL01hRDVI?=
 =?utf-8?B?alFjRVVMQlVZZzdaSHRmeUtiL0oxdnltT2pJY1VCSVZiTGFJK1RjWGJCZFh4?=
 =?utf-8?B?SVhPc2VncTNlNGl6VWJmUXR2bWttcFcwZG9TRFFCQjV2MkdZbnBHZm9ibWh4?=
 =?utf-8?B?SDBUWStSWU0wdnJEZ1JaYzRQQloyTVJQY0hOOFlYUnhxZUcwbjR1VUZCaGJi?=
 =?utf-8?B?RTM0d0RUVGNjM1VrMDNhWW8zVmt5OFJyRFc1WVMwQld1ZlpJbWNUcTZlTnNj?=
 =?utf-8?B?Nk43eDZ3WkYxY0h3OWY2ME9ESWcxZUdpV1Y5VGZJaFEwTjdyU2FUMXRIa3Qx?=
 =?utf-8?B?RWw2U0haTmNnOGE5ZmxFZlRnelg4UWFDaWhsMkVwank4UjZHWnZMN0JQeUpw?=
 =?utf-8?B?NkpSRGh6QitSaFgvNHBjdXRqTnpSdWtkaEszR0lrUEdsWFJYcGFMRVo2QnNM?=
 =?utf-8?B?YmJiaitoV01FMlF4V0lVY3U4dElId0VBRFJEMGx5MDhnNFdMQ05jZ1N1aTM0?=
 =?utf-8?B?TUphb1ArR241OUF1MWViZVJCSEo5MDBzemk5RkNQZHZpSTE2MUtjcXlzaXVF?=
 =?utf-8?B?Z0pEc2d0TmltT0Qyc0JoVXAvUVFwUndIdXU4bGV2Ym5vVEVjL1VQNlUzNEs1?=
 =?utf-8?B?YnV6enhNeVBCK09LQkZNcFBsRjdUUFJQeSthZFh3OFFGaTc3Uk1tcjZ4and5?=
 =?utf-8?B?RnQ3SjU4N0lrY240MVdnQWM4am1NenBSUFZqL2NDaHlwK0ZZYWV5TWw5cTVi?=
 =?utf-8?B?RVNOUGFCSTlXNnhjcXFkbnJ4THdmSDIwdGJrMkFJUnVGZStFNlIzaUlRWnd6?=
 =?utf-8?B?YWVJc1VSSkRsc3dYWi9DdEN6dXlpRmd3M0JOT1lmeXlLT2RHdkdURHc3VXJi?=
 =?utf-8?B?NlFrdFVrYktLNHQrcGMvRXVJT2NtNWpueWoweUZoQ1NxbnRwUUEzQUQ2aTFJ?=
 =?utf-8?B?K0w3N3haNDk0OTlZZWQwTjN5SEZrMGpDaW4zdnZRRW5OYW9UdC9CeFpueVBT?=
 =?utf-8?B?NGNhWi9TWUJ2L2RlOVRZZ1Z0ZDNnRFdzYzF1V2Fqb0pmdXF1V2lyS3VUZkZl?=
 =?utf-8?Q?DN8b5NHvRZmoLyR3azhMPLg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13411b8e-f3f3-456e-21fe-08d9f6b50d74
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 10:12:52.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VE56K4lXdCdfzizju23qQECTxIbhQJS5VfR+hjTPpMn0eLm5fo1NVJrZRh4XkZ5g57rO1yNRquW1J6nm6Q6+oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3004

Complete what e3662437eb43 ("x86/cpuid: Disentangle logic for new
feature leaves") has begun:

"Switch to using FEATURESET_* just like the policy/featureset helpers.  This
 breaks the cognitive complexity of needing to know which leaf a specifically
 named feature should reside in, and is shorter to write.  It is also far
 easier to identify as correct at a glance, given the correlation with the
 CPUID leaf being read."

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -332,23 +332,22 @@ void __init early_cpu_init(void)
 	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
 	c->x86 = get_cpu_family(eax, &c->x86_model, &c->x86_mask);
 
-	edx &= ~cleared_caps[cpufeat_word(X86_FEATURE_FPU)];
-	ecx &= ~cleared_caps[cpufeat_word(X86_FEATURE_SSE3)];
+	edx &= ~cleared_caps[FEATURESET_1d];
+	ecx &= ~cleared_caps[FEATURESET_1c];
 	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH))
 		c->x86_cache_alignment = ((ebx >> 8) & 0xff) * 8;
 	/* Leaf 0x1 capabilities filled in early for Xen. */
-	c->x86_capability[cpufeat_word(X86_FEATURE_FPU)] = edx;
-	c->x86_capability[cpufeat_word(X86_FEATURE_SSE3)] = ecx;
+	c->x86_capability[FEATURESET_1d] = edx;
+	c->x86_capability[FEATURESET_1c] = ecx;
 
 	printk(XENLOG_INFO
 	       "CPU Vendor: %s, Family %u (%#x), Model %u (%#x), Stepping %u (raw %08x)\n",
 	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
 	       c->x86_model, c->x86_model, c->x86_mask, eax);
 
-	if (c->cpuid_level >= 7) {
-		cpuid_count(7, 0, &eax, &ebx, &ecx, &edx);
-		c->x86_capability[cpufeat_word(X86_FEATURE_CET_SS)] = ecx;
-	}
+	if (c->cpuid_level >= 7)
+		cpuid_count(7, 0, &eax, &ebx,
+                            &c->x86_capability[FEATURESET_7c0], &edx);
 
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -685,11 +685,11 @@ static void __init efi_arch_cpu(void)
 
     boot_tsc_stamp = rdtsc();
 
-    caps[cpufeat_word(X86_FEATURE_HYPERVISOR)] = cpuid_ecx(1);
+    caps[FEATURESET_1c] = cpuid_ecx(1);
 
     if ( (eax >> 16) == 0x8000 && eax > 0x80000000 )
     {
-        caps[cpufeat_word(X86_FEATURE_SYSCALL)] = cpuid_edx(0x80000001);
+        caps[FEATURESET_e1d] = cpuid_edx(0x80000001);
 
         if ( cpu_has_nx )
             trampoline_efer |= EFER_NXE;
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -516,7 +516,7 @@ static inline void __init construct_defa
 				   (boot_cpu_data.x86_model << 4) |
 				   boot_cpu_data.x86_mask;
 	processor.mpc_featureflag =
-            boot_cpu_data.x86_capability[cpufeat_word(X86_FEATURE_FPU)];
+            boot_cpu_data.x86_capability[FEATURESET_1d];
 	processor.mpc_reserved[0] = 0;
 	processor.mpc_reserved[1] = 0;
 	for (i = 0; i < 2; i++) {
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -48,7 +48,7 @@ void tsx_init(void)
         bool has_rtm_always_abort;
 
         if ( boot_cpu_data.cpuid_level >= 7 )
-            boot_cpu_data.x86_capability[cpufeat_word(X86_FEATURE_ARCH_CAPS)]
+            boot_cpu_data.x86_capability[FEATURESET_7d0]
                 = cpuid_count_edx(7, 0);
 
         if ( cpu_has_arch_caps )



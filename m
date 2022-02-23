Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49964C0FE8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 11:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277274.473720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMoeg-0006nY-9e; Wed, 23 Feb 2022 10:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277274.473720; Wed, 23 Feb 2022 10:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMoeg-0006lG-69; Wed, 23 Feb 2022 10:13:54 +0000
Received: by outflank-mailman (input) for mailman id 277274;
 Wed, 23 Feb 2022 10:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMoee-0006l4-Kv
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 10:13:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c64d1f8-9491-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 11:13:51 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-GfFDp9XRNV6Kqbx2eU2lwQ-1; Wed, 23 Feb 2022 11:13:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3944.eurprd04.prod.outlook.com (2603:10a6:209:1c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 10:13:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 10:13:48 +0000
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
X-Inumbo-ID: 4c64d1f8-9491-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645611231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+vFchMkCIGjXqw4WIqVN7N88HXvbjRZMQ+krXE3zHAw=;
	b=mxKNUioZZMy4wGx79AWeaVdO+aSaToomCZG1S8fZo/CjxXG48jiuW/G5aH04waDWg0OxPV
	/vQ/UVJy3nJIsfDNfbY5UeOHROLl/igTx3utqgXKEgleLFMZIQmFHrZxnWIrmoAse+jrdS
	lb1psGv3jqQbENQQrWt4PrtPsa/vquo=
X-MC-Unique: GfFDp9XRNV6Kqbx2eU2lwQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcwFmDds1+ioIa1QmD5Xw2vg2viIfhaTzEEfFwDob+Ifz+l0vslujZidvsfL45p4LXYU5AsVnzvwwUs6NK8qL+8Koiw+dmE+AP5F1mmx18gDPAMaKdDOokbjoScHQoC9tLgylGLbilV0H7Ayw+B0yIw17INwCzFiplHgFOin9V7N3UEtRgmSNSAXRtFgyEVevVrxo/OuU+icjhTrrDxNuLuhzCE/9oeU9vS6001fQSdOg/cGYEAUZ03HdR4NfZo66KzUeT06mO4L9tc3g7YjiI8Cft5O22SptX5x+ORcdrxQs+ZB0efoDprIybz93fAcvfPI6Q+nkinj18Rtj3TYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vFchMkCIGjXqw4WIqVN7N88HXvbjRZMQ+krXE3zHAw=;
 b=U4XIfWQ2IMccEo4G2R162NAsUrDVB2Lpd6Yr9W1Q9/7l3nx3VprLgjrbNZ7aFLfJZxrnrhGc1GSKrvIrz9JRhh+/B4o7Kxq9tGP+E0CffRIXUcpKWh5shhAR1PgaHPrh5HyC9AtjTgTfjwef2Nc4ouInqbBA64mGfhZkqzML/oo5BUIrRHoZIuSXeMZEuzMFaenS80SWaxPdFu5tNxta18majcczQGogqQZAMOw/3mIsxknoi2zngvjuRZ8iOblfwdUH7+52H2fFzIOZmm+9j+3TvzcGQxK/HuRKKsV26lS6ZLK/aJ8xa8wTGFInhWGAJS37Aox+IpW8uGkew4PCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7026f7df-1f70-0018-a6eb-b7e043b279d8@suse.com>
Date: Wed, 23 Feb 2022 11:13:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 3/3] x86: correct fencing around CLFLUSH
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
In-Reply-To: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0361.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80afe333-36c1-45b7-7170-08d9f6b52ea2
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3944:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3944B6526F30BD8664E049F0B33C9@AM6PR0402MB3944.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i3f0j+l1BXYm63Llx2q90YUDZKFvmc1FK0a2q96chVbmbkcVdJCbjkK0FhhxJRRIL5VnOkt4LETM0zMnRboZceFs1grngGIbZFSXz5Be/rNzZuXp7Docsv0OUxMpytysH26sFpfTGNqYKWyWzJjhAJk9aOocuHpNmvslj1mzeRmhvbrVNIibqIZ+LHcbFTSpaWq64TDIQr244R0pgsrvUjJiqfzbCQD2E/9Tvu82pvfaQjebepVgl/2l6KvbiTnMOfafmjlrYRdyrbaxsvh4H/gtM9+gzQbpkzg6EyUE/n6/U726o7fSnOmWG0mIpVazJM14GS+af2Z9Gy34cOQATgEqBQaSPM12dOOn6iBJ/dudepdLDC+UWM/eFMZK2qTjTuHEOoiE3efk7xXKcHdCkYd1TCOv2si8e7M725XYa+2z+rvMZ2NptCbnrFziMOtUDO6f+rcR5EBEEDR/gw3NpYGdf+vuktbjnB1aO4Jn0Px8a1NvDq4Ms2xi/zoT91nXNTdQrZ7UgmClw7y5rGedLwNZ53d7xMQA8sqBg0GoiUikjN8gT2VJ5wZ41emDCn7NVXeB/IuirsDrPLYgcdE4qrwn+1Bxx8dEbCeZWbVKbuOBol5OX6umSzdO/ndTldLpsq0p98AdipVwxE3i7HzjM8Ufi8Tot0IzJJftrrzkWM47g7nwefeUwvNe5zOsClxuAomE0vDDqW2o3mjh6EfKfEBtj2D+baz0PEsU/IA5LuTM54H7YjJ1LW9PFJqbo3rs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(6916009)(2906002)(316002)(54906003)(8936002)(31686004)(26005)(186003)(2616005)(4326008)(6512007)(66556008)(6486002)(6506007)(66946007)(36756003)(508600001)(8676002)(38100700002)(5660300002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmJlTzZNTDRwSUQ4VVNzYkk3QU0vU1VkSjM0bWNFWDk5WUlZbHJZTGpDdXN3?=
 =?utf-8?B?R0FHTnNrZXJSSU90Q3E4eHllWEt1NlNiNmJ6c29BMEJXRWVWM3lPcFpUT1Jw?=
 =?utf-8?B?ZjRjTmFIM2MvZG9iZ2dyQTZ2Vk5YTXI2TUR5MlYyMFF5ZXltQnJqY0Fwb1dL?=
 =?utf-8?B?bjV1YzlwMXRZUnBmaVB0WjF6ZE5GRzJrdlBuV01VZEtrbzNmTHgxN2VVRy9E?=
 =?utf-8?B?SjlXa3JURTM1RS8rNHRGSWJvMTlNR3l1RzJtMU8ycUh0cENlcUZWQUd1ajU1?=
 =?utf-8?B?NUVxQ3RlM3IyMnpnd3ByeTZwNVY4blN2UG1hVmYvY0tGSUtuQlprNGd3dlhB?=
 =?utf-8?B?YVhSWHZQTjQzeHZDUzc5S3hpRFQ1Nm9HQzRsTlJoKzZneEMvRndlQ2tGVzRX?=
 =?utf-8?B?SzIxU3I5UXlBa1Fvc04zYzkxdlU1Z3hObEdqUkNTZHJXak5HWUJnVW5PeE1G?=
 =?utf-8?B?SkxiSTdrZzFCNG1VSGV5VTFnMnl1QnppdmMyVlR5b3Z2cnh0bkFVRmxMcXoy?=
 =?utf-8?B?WGE4bXNMTzNGcGtrbjB0SWNCMDV3OEsxcDhSTkphQ2xRNFFVNTFjQlgvMjM3?=
 =?utf-8?B?OVdSTVdkVy9hR2phOUFickpaRjV1Zkk4cVB6K203RWs1K21iOFkzQmJGSVZ3?=
 =?utf-8?B?ayt0Yit0bnhDeU0rNW8xczVOS0JKSHI0dTVnRnBud0xGT0lKSCtZRnJFL2pQ?=
 =?utf-8?B?OEZWTW1Gd2RqSkhYK2x4WUgvSTdXUFNaL2l4UVE3Um5iQVlxajUyajNQVks3?=
 =?utf-8?B?QlNFYTIyaWxDS21kRWlmK1hiT0JtUUVFbXgrU2MvcmFaamhKYjJMR3pWVXJu?=
 =?utf-8?B?OFR2V1dHVUkzTkVRZ1JtZlI2bE50UnE0UG5xWmlyaXp1YjFiRkRhWldiSnJz?=
 =?utf-8?B?aHdjLzJ6NS9wMC9nbmVzbHVURU1QQ1JEeUVvZ1FaVW5OMGlHWFBnRlVMNWJv?=
 =?utf-8?B?bzM2QUliVTJRbU05dEFKNFpCRTdQZTBaeXc2b1RNeHE0T3cyaUlrbnpXdENS?=
 =?utf-8?B?RVJ2dUhpYmhGb2d5SlgxQ3RNZzMxQnkxb3JlUjZuTm1CcjF5ZndTUlR3aGxL?=
 =?utf-8?B?OFlEZWQvVGxqOHNVZUM4cUZpYnNwYXZZTld4VnNENit6SE1qblljejRwN20x?=
 =?utf-8?B?NG5neFFtMkx5MDV5MitILysyU2N5SEhveGV2ekJGdmVsdFBmbTZWaDc2aC82?=
 =?utf-8?B?TE03N3pYWGsrMjVhNit1YlRneFgyWXNkcmthOGlpd0FBSFVxTkxDK0lpYmln?=
 =?utf-8?B?U0pKVXN6dnZWY1BiS0I3ZGlkdHNSdTc5OE1lUTdXaDNDSjExTHlVaXp6bVdt?=
 =?utf-8?B?T0VQcVV6Zm92VW5Rbkh6anpUTzYwbndBM2lnQ0tBUnloTXJzaWQvLzRZbmU1?=
 =?utf-8?B?TnNLUmxlYkJWTThiUWhjKzdHRkkxaHEybHQvRXVYS3l0WEFLQVpoakNuNEI5?=
 =?utf-8?B?NHNXQVloRk9aVkVsME9VSVF3K2E1b29Pbk5ucGdzdUdocHR6bEpGRGNPRHEx?=
 =?utf-8?B?TWhsanRPUU15L2EvRGRaM1M5NUlaYlNjRTh4UjVFMVNlc0NQaCtLc1BSWGZM?=
 =?utf-8?B?NDZ1VEVPcGtoVm0rc21Ia2JQN3REc2RQdU4xOTJqVm5vZ3gzOUpuakJvVFNR?=
 =?utf-8?B?a3dsQkxnbUo5MXRKcXMyWktXUnFXT1lKUmEwQmhiYitnOXBkcEJpUVRFaUxQ?=
 =?utf-8?B?MWprdjZtdTJYdHpKaHZaSnRoVUU5c2o2ckRCc3pHdDVsWDFUOHpPN3FNM05n?=
 =?utf-8?B?Vm1LWVdaVFFqWERHMjkvbzljS1N1dzRUTlNjUW9vc2Q3cDlaam9kNkNQUzJZ?=
 =?utf-8?B?eTJET3lKL1lMenZYTCtGWHpSR3Q3alpBdFVMdUVFbmZEUDZrWHh4R1BTZ2hN?=
 =?utf-8?B?V2EreHZXNm94bytVTW9iaVFFR1hYOHd6K2hlYmZObDV5Qm54Ym12dk1UYkFM?=
 =?utf-8?B?RXIzby90UnFkSDlnNmNTOHR0aVBINkxNOXNXTzBmaHI3bzRBWlhrdURmQ3Ni?=
 =?utf-8?B?dDZjRmtYZCtGWVhIYWhTY0FxZHdOYjlQRnZkTnczSUlHSHQ5Z0pzMnRHazZ1?=
 =?utf-8?B?NDZ2RkpISWVsaklaeWJjSW9jVTFOOEp4SEJvQ3J4amhKaDVhWmhWdmlyZHhx?=
 =?utf-8?B?YkZtbGJUOERSUzIwc1BLb2g4QmRiL3lObGlIWmJxUXV1bmg2QWZqNUVWYjBK?=
 =?utf-8?Q?No7Rmj+VGG7/7498iDZYbvM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80afe333-36c1-45b7-7170-08d9f6b52ea2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 10:13:48.2953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCSPMnGN90FqVsojaQuh7oCjVREzxu6IoC6UjpwOSUf2mgf7r8W1bRUUPJRtjp+hTKA6MmlCICU4mVEReOPbwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3944

As noted in the context of 3330013e6739 ("VT-d / x86: re-arrange cache
syncing"): While cache_writeback() has the SFENCE on the correct side of
CLFLUSHOPT, flush_area_local() doesn't. While I can't prove it due to
lacking a copy of the old SDM version, I can only assume this placement
was a result of what had been described there originally. In any event
recent versions of the SDM hve been telling us otherwise.

For AMD (and Hygon, albeit there it's benign, since all their CPUs are
expected to support CLFLUSHOPT) the situation is more complex: MFENCE is
needed ahead and/or after CLFLUSH when the CPU doesn't also support
CLFLUSHOPT. (It's "and" in our case, as we cannot know what the caller's
needs are.)

Fixes: 623c720fc8da3 ("x86: use CLFLUSHOPT when available")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -346,9 +346,14 @@ void __init early_cpu_init(void)
 	       c->x86_model, c->x86_model, c->x86_mask, eax);
 
 	if (c->cpuid_level >= 7)
-		cpuid_count(7, 0, &eax, &ebx,
+		cpuid_count(7, 0, &eax,
+                            &c->x86_capability[FEATURESET_7b0],
                             &c->x86_capability[FEATURESET_7c0], &edx);
 
+	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+	    cpu_has(c, X86_FEATURE_CLFLUSHOPT))
+		setup_force_cpu_cap(X86_FEATURE_CLFLUSH_NO_MFENCE);
+
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
 		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -245,12 +245,15 @@ unsigned int flush_area_local(const void
              c->x86_clflush_size && c->x86_cache_size && sz &&
              ((sz >> 10) < c->x86_cache_size) )
         {
-            alternative("", "sfence", X86_FEATURE_CLFLUSHOPT);
+            alternative("mfence", , X86_FEATURE_CLFLUSH_NO_MFENCE);
             for ( i = 0; i < sz; i += c->x86_clflush_size )
                 alternative_input("ds; clflush %0",
                                   "data16 clflush %0",      /* clflushopt */
                                   X86_FEATURE_CLFLUSHOPT,
                                   "m" (((const char *)va)[i]));
+            alternative_2("mfence",
+                          , X86_FEATURE_CLFLUSH_NO_MFENCE,
+                          "sfence", X86_FEATURE_CLFLUSHOPT);
             flags &= ~FLUSH_CACHE;
         }
         else
@@ -274,6 +277,8 @@ void cache_writeback(const void *addr, u
     unsigned int clflush_size = current_cpu_data.x86_clflush_size ?: 16;
     const void *end = addr + size;
 
+    alternative("mfence", , X86_FEATURE_CLFLUSH_NO_MFENCE);
+
     addr -= (unsigned long)addr & (clflush_size - 1);
     for ( ; addr < end; addr += clflush_size )
     {
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-/* Bit 12 - unused. */
+XEN_CPUFEATURE(CLFLUSH_NO_MFENCE, X86_SYNTH(12)) /* No MFENCE needed to serialize CLFLUSH */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D85B58E87A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 10:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383442.618611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLgpa-0004O2-3C; Wed, 10 Aug 2022 08:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383442.618611; Wed, 10 Aug 2022 08:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLgpa-0004Lq-0Y; Wed, 10 Aug 2022 08:12:46 +0000
Received: by outflank-mailman (input) for mailman id 383442;
 Wed, 10 Aug 2022 08:12:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vQbV=YO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLgpY-0004Lk-6h
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 08:12:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35585cfc-1884-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 10:12:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9141.eurprd04.prod.outlook.com (2603:10a6:20b:448::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 08:12:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 08:12:40 +0000
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
X-Inumbo-ID: 35585cfc-1884-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/BrmW2qd15zMtsk2Yw7bhllWo0J2eDyMui5Qx/zAKjcqAdRPt3PaZxx8YrDdwCd/jJCN5XZ6LuHgpGrWwMI210QJi88uu5SYP2yh2ob8niZmHHjNsKp/Ciftp3wkJGglPwX6m6rHyVkxSZv3UzUoJNgfWMtK//cK8Hm3j6CNEbY6n7OguZU9omdW+N26ODT2YPCOq3XyQ1riwnID3i5ZwLGzRQ/GIZFMmCznsD43BCoGxfTTzpGz5Le0n6mduxwKBfj240Mmtx+IVLjFuX4fGMHFKhJBy/dbutn6c4CRN2L74v1/TKO07NLaQasQLUUgU0xXxhBHJ2Nx9R98jkPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtygoRxhESv/N6X1/yEBbnxt1q39SAhRXgxSwy1OZzc=;
 b=VLiHX8m8wTasQlz5K2WV5VcvytibU1OJXirOkHakmOykgqCesLRmsI1DiyWgjhcDCuVXQJsGnrAYVo+oInREQxBX2V98gSD66393pwMDXSNP3/anGhirFWGbtf29A53Kj39Nrjv/GuQN9M+2qISZoBCmIiU7rc5lx+mWfZZkjwIkLV9HSsdmOea270WJBBg3s7RHDx3Vn269I3GfJ7wTa8xhH5AWbS8I3nQULldYYbV5nmcG/MfZr2bKwcXVGKV0saoWuYoE/ehA9f6Cfbig4hZhx02gLl9ql+oweXb6a3b3hItbOSC9SvplMVXltr+/xhqP9QPvyqwCTwSpak5jnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtygoRxhESv/N6X1/yEBbnxt1q39SAhRXgxSwy1OZzc=;
 b=GmoRjM3G5CfRfxdPZFwBMVHj0FX7tVSe7ShQU2ZZgdyi9Uz8j3AQqZB6YNqdJWp7A+rJuYaHadGARDBzD0oc2kAb+Fmvctp+9UmUQ1ru7d1asi+I6RTWwuCzWw8BWIwY7EBrj5ZS2Yj/6aWoJ4LN1T3H5FR2J4gFfCPR7Mg49t567oKfFqeMr1VyoDP85+VK8INlSknJ3x5eSw5/lqQx5n5rRftbKRrZzAlKJtqla4BykAIt0xO/PMQmS+Ia8bAOnKQjUTAk6dN1s7j/qOF8qlYWnoNM95ycdsBsOjZmQtYmk7lCCi1PPCOy3Jl4cAEWJpPrClzl/uZJ6VSCGyseIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d5ceaf6-5e2d-6f5e-f8d6-67483cb68daa@suse.com>
Date: Wed, 10 Aug 2022 10:12:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/AMD: check microcode size against CPUID-supplied limit
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0033.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::46) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f673c2fe-8ef8-4a7d-4ff4-08da7aa8185f
X-MS-TrafficTypeDiagnostic: AS8PR04MB9141:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	URMDcsEu5cvzojMLbVU/u1cs4NnmzCh8sfaoJBwVBwirlq2Oi7aLmd0Vs0GjI7C9xN40LFgTAzGvBKxkYniLp111jYytJEsDW+0vB9l5rBB8WT/6SpY7bAhyFKcercgbR8tE1A0qn1uJhu7Oapm8RSjXvjLOxO1AtFWRaIhplxsvE4DJiYkbUUKF8ZVNozow/fCGCO6EzRjjTdXqB2cuVZshQf9HeVOHu7KUNj7NXnUwadF/sy9heNOmn1QhxThpu2BnGJ5F68G+B+nlM8JadpIRyntHxAPdXoRKy442Bn/SdmsXhy5Xnt4+U92twVeOT8Wha7fm4SqXocDcDb4xYP/kNNNXV8RV83mHpRcQW0TYagAgBOFFxinhm995YWhAkQi/lyQ2hiyRimTVH/j84+HJtB9Y3f8wMlqVAYxgq7rhTvxNx1WmgBE4Cbl8jqyHNqwaljj4SE2qAIV4MUr1qNrXDdmuRarDg7exhepVM8jdKOs2iHwGgopF1jQXbbmFLzyflAZ1q0Nu8H3xqF0fGBP8zC1p0D0TzyBeZCPW2mPHxerEnDPhGtQSd5CBwVTI11/1BSoCFKdXA3MlATWag4IWGxBUesQGwKKQdxLmMNguvohjRFleStSJuaMZgHDzYFkh2QYd1rF9qkV9R8wzNiRb8OFEfkAa73ebEb2ALkh5YqZzRLsM1cew5KaLtT9j+B+zB1naNfPLiWWpPuxHo7EtYe2wYaA8zgCkNDaFyI6HoQCFeoEPVF8MSj2nvF1gWL918+m2uMxBILpkLptdCDj9r8DKHIVzEYNUtGNUVrBj70KgKgUlDam1XfDEpfAvtOSrewljOMTqhw3ReAUAmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(396003)(136003)(39860400002)(376002)(41300700001)(31696002)(2616005)(6506007)(86362001)(6512007)(26005)(38100700002)(186003)(83380400001)(31686004)(5660300002)(8936002)(4326008)(66556008)(66476007)(8676002)(36756003)(66946007)(2906002)(6916009)(6486002)(478600001)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eENucExuRFNzeUp4elR2TGNJWERIR2hLaHpQejh3MVBWZFlkNDJRbVc2TUo5?=
 =?utf-8?B?cEViNFJNN1RKMjQzSXd5V2FqbGREY2lqRkZRSzQ3aDJmYm9BeDdOWG9PMUpp?=
 =?utf-8?B?UWhiZ3FtTnBaTE1hMkoxeWV2WEdPMlcvMnVRZ1V1K0lKRUdSQjlKNGpzTmJh?=
 =?utf-8?B?WDdRZkFVTDBvcXBLc2xPMFQvcnJUdW16L2dQUEtvS1VhNnBTRXVsaWhGcWVi?=
 =?utf-8?B?Wksyd1Fvd1ROOFhWSzQrSXVzUjdib3oxSlhVd0Evbi9OTG14Yk1tZ2Mwd2Z2?=
 =?utf-8?B?VnFQSHRBaXVnb1JEUnBQY0VzdnliTkR5Ui9SdFVEVHpnNUpRcWZqRkZPTlJw?=
 =?utf-8?B?QWVmOUhaVEh5TFM0ZmZFNlNtdmNBcS9kTkdjaW5tSThhcFN1VlBPQTI0RldW?=
 =?utf-8?B?NFZ5WnBIRndtcWRCdlNKZ1UwZms4UE9jelZBMzBFQ1NTNjBhSzlqSnVJOHo2?=
 =?utf-8?B?YmJZekQ4bGlyVElQaU9jazVEdVppdWs5UkNKQVBzd0U3Z0FmZ0tUb0RjdWpE?=
 =?utf-8?B?c1hUT00xOHhQRkVBYWNZRlBEVTZzRlVpZzJFS0E2MUdYVXVsTDVNdEpXKy9Q?=
 =?utf-8?B?cjdzT1F4cXc1WCsxSE9STERTNUo2WWNodVNzVzl5V0p1S3RLS01qcFBQMFhE?=
 =?utf-8?B?WGZZQzhkOFkvLy9XY1lZY2RhVmNJenVOb055b3hVODFkQ1BOb0dhT0pWYW9Z?=
 =?utf-8?B?UzNwaHI3YkR5eUt0eDcwMEtBcTN0MVQzeFRZWE1KT2xXd2V5dFR1SEszdlNW?=
 =?utf-8?B?elhUV3hDdmp3dUVWVExPakpDV0QzRUJDbisrSnN2WEZpazRQODFpek1YS2NL?=
 =?utf-8?B?TFlBc25aV01OUmRvalpIcVhJUlZTcm43U2p5emhHSG9aZmd2SGhOeG1oUjNE?=
 =?utf-8?B?SlZibjVUNnpDTTJUSVJ5THF6Q09MSy9tRjFzZ3hVcHVQdTFxZmFCVjZQVkQ5?=
 =?utf-8?B?d3BQckMyZVNUSUtIeExEck1CeXR2STRxdUdzZWoxT2JKbk9SSHhKaUgxdWxS?=
 =?utf-8?B?dXR5RHMrZm83Y05Ld1J2U0I1cjRwVGhyR1hnRlE4Tk4yd1BNWUpNNEZLSUs3?=
 =?utf-8?B?SEJ2MTBsZVBvYXdrVEs2b3VUd1Q5WkFNcnlpUGVYYUVod2hZZVdVV09uaUp5?=
 =?utf-8?B?ZHFxa1R4VEtvY1VEbkI4RVd1Yk5uNmYvTTVtYUVRbStRTlZOVVVxdDFzaWg0?=
 =?utf-8?B?aTBIZ3A2a2ljbDkzcFowMkwyb1NKUGFxdCs4YjdMS1JKYk1LcHBSWkxFVTlm?=
 =?utf-8?B?aUhuWC9zSzhFOG9ndld5WHNEVXZNTldMcHZIMXN3SUdlZEZFTzluT2xtMVdT?=
 =?utf-8?B?STdVMlhzMjVXTDZuWm4rSXJJY2Vqenlkc2hsQllqWTRWSk9JeS81d01zaUI3?=
 =?utf-8?B?a1I5TGxCK1RmRVJPMW9XcVUwckhVUjE2NVlhY0VQZlJHOTFqOHpINVpzb2xO?=
 =?utf-8?B?NXhjVFpteXNuc09BSlNYOSs3SG43VDhURWQ4UkpHN3I3Wmp2eXpRa3YzaUl3?=
 =?utf-8?B?SHk1YVMyRWRHVjMzR1VmRnRjaWJ5OVdaaTlGTUppWEJ5MEd3UXRidHl4Q1o5?=
 =?utf-8?B?cVNLTWgxN1ZGcXdudXZBQmpUNkJhazdtK2RGTjZPOFFpSGhHa0JKcEVYaTlD?=
 =?utf-8?B?ZmhCa2tDTE1WY21pNG80T2kzbDdZOGVucGpNTU1OM095REI3cGN0cm5zV3Mw?=
 =?utf-8?B?dFI3bkY3a0o3S05xb2ZGZTBPdU5pTHE4eFRRM0lDajJYdmJmR0VOdU1tNEZj?=
 =?utf-8?B?NzlKd3FsRzdTOEhsNlUzZjBuZGsxdHlQZjQ0aituQ2JrZU0xRDE5Q2RhSFVL?=
 =?utf-8?B?TG1KUW1odWVMOG1mWDlHL1AwdjVaLzM1RXkrN2lyMVVGL2VEQ2JHUUJLRDRV?=
 =?utf-8?B?ZG4vamFOSGltc1lVdmlNTlg5WXJTSTN4R1JsbW9CUkJDOGtpazcvc010bncw?=
 =?utf-8?B?Tmpra2x6NUlmN2VFS3Z4NEFYU0p1ci9tbGcyWXFNM01XLzVJUHpXcFpWL0lZ?=
 =?utf-8?B?QTNQczJkYnJVZVpDUTQ2aVNFUk9DTFNPYk51SFQ5ZURxWExqTFNoanhpLzZl?=
 =?utf-8?B?enhTbDRvNlplc3U1UGZiNTBnZGllMkJkL2luamJKUkdUZW15TVI3T2JnSkl0?=
 =?utf-8?Q?9KAG4osPNbA08jj/Mt9fhXs8q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f673c2fe-8ef8-4a7d-4ff4-08da7aa8185f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 08:12:40.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +q0JbOU17Iezp5O2GHwtBll2rdHeFhO470/CjnFbGPHZ/Qpsfqe86UX13k69lT9qXW2zy2QQxUCb0+AGnXtzGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9141

With there now being a CPUID field for this, let's try to avoid further
growing the set of family-specific "magic" numbers. Sadly on the boot
CPU it's too early to use the host policy, so an actual CPUID insn needs
to be issued. Let's take the opportunity though and make the extended
CPUID level available early.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -352,7 +352,9 @@ void __init early_cpu_init(void)
 			    &c->x86_capability[FEATURESET_7d0]);
 
 	eax = cpuid_eax(0x80000000);
-	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
+	if ((eax >> 16) == 0x8000)
+		c->extended_cpuid_level = eax;
+	if (c->extended_cpuid_level >= 0x80000008) {
 		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
 		eax = cpuid_eax(0x80000008);
 
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -108,6 +108,13 @@ static bool verify_patch_size(uint32_t p
 {
     uint32_t max_size;
 
+    if ( boot_cpu_data.extended_cpuid_level >= 0x80000021 )
+    {
+        max_size = cpuid_ebx(0x80000021) & 0xfff;
+        if ( max_size )
+            return patch_size <= (max_size << 4);
+    }
+
 #define F1XH_MPB_MAX_SIZE 2048
 #define F14H_MPB_MAX_SIZE 1824
 #define F15H_MPB_MAX_SIZE 4096


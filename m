Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1B59528F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 08:34:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387960.624452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNq8R-0004p9-LL; Tue, 16 Aug 2022 06:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387960.624452; Tue, 16 Aug 2022 06:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNq8R-0004ll-HB; Tue, 16 Aug 2022 06:33:07 +0000
Received: by outflank-mailman (input) for mailman id 387960;
 Tue, 16 Aug 2022 06:33:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNq8Q-0004lf-02
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 06:33:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47fcff95-1d2d-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 08:33:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8112.eurprd04.prod.outlook.com (2603:10a6:102:1cd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 06:33:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 06:33:01 +0000
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
X-Inumbo-ID: 47fcff95-1d2d-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ9H2cb2Qx0y+kfHOPE6HOGs2gjiCscOzH1TLo2eEQISFMcazaA/xAajbQGD62mjiKyk8CWqp3DC1zA3uKGx1GQdotvLqdGXa2Kltq1Ds55XefbVKo5sATgHmZ1ZhWaM2ejrLNNULIj2pzIjGXDv4rpX5p9/aRf0Kk6eFEwjTCU5OOChgFoEXxxHVohrjIwSBjt2UPdX3nC5mHls1qDZG9TDFg6j7p5Qivap1CI4xcOqu1dQE6NLDX3NC7hQQoMy+cnRJCq0Iot3FxCqRo6LtFDrqlSFjKbuKnfHZHyq+qrNQmA3rLsqyr5xxrMkIWlQlTBVTZqyBTUdLugFRUdCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccQ6u66wE4z1aGcyRkbwjalqIrT4SRm5yCI2P5XJOYI=;
 b=R84eAtnvgSvo/UOPt/cs6LAc4U97H70tPa4qLucKBCJUxHc2MLBeFjKMU0wAoSeJsTLIMVoSQCE3NhCPU7dCTFph6ptcWy2oL/VAPWav+cw0Jlv65EJI7HcKoO/9Z3P5CPcgbTXyRYv/dPTYpAhtkH5a68/A4qgYW5txpKULsjJuUXdY4lLj3q5f+u7mKwooDTbIuu/o2mbb+Zv5CLlTxKpOCaoSN9dDoY1Dbp2hWk6x5DGGljA2Dto9BOuWkp88BNJxL3jQ8IFwDnMxR799vNd+vTmD3vciaumTEViWx5j/Jrw9dYRF7tW7Os2IOJTvxsf8erPxjgOALXwg4Vw54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccQ6u66wE4z1aGcyRkbwjalqIrT4SRm5yCI2P5XJOYI=;
 b=zLgQNhZeQjVEJtC1WhPYcTKsQQh0SqC5EvvnCaGkzqxvvFLdQqWLF2BDk5OW/v8ARRaxpsnSCuDgg3ZbKS9ctgFRdzx9ce17Bx6BL3nZ2kFDPYgof3FoJxfGVFWD7U6aOyk8sLsjlHa3pTH2lpcOELKD/kqiz3/U9d30gXl5Qbd9y7nKkfHw8PNJyTW0/sR/KneU1cesFt3L5Fv/cKLMxyBkwLbs4zY9Fe7Sgsj8wAgh4lsHNQNCAmW64M9jATKvJ6LFKUqv8iD5p2k2klrBxS3QlqeGyCGtETWEJmKp9LF+wa7UB7d4u+BYcHJirn5IRCEhQklCWZ06liDSV46VNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f5f7adb-d34d-e753-0880-92eccccfb75a@suse.com>
Date: Tue, 16 Aug 2022 08:32:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: rework hypercall argument count table instantiation &
 use
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec758cd7-3d08-4adb-0ed1-08da7f512b08
X-MS-TrafficTypeDiagnostic: PAXPR04MB8112:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k9uy28MeLK7SS+dB2XL81cnJDpUdVm7L21bXd1PXaHwZeKQ0SVGZH8PBGyIgNItzmZBipJBiXdQ1YGVBrm0qIzKYWO1cJqSu8TZfR7GYQ1oZmC8A19jNRCtG1cvsPEhCSsgS/NRRL+jwnGIC2yrrDMD2X/GpD93JjAmW6xBpPxJRK2TxhMN3fcVpvBVphCjXI9EY5ReUNcKs+Ijwhm9fRGNJtZFl2KBgU42DJeAzwobUF8gh5aaAIig0Z2YQQRKh6Dc0DuAx7Tq+JjLxt3o63q2X8udlBvxU1xKtZBWc4xFQP4I1yPZM6vLQEWFdG9znG7fzBaCKG3izZrgpXSHp4x0wh/0j5UHsGmOATTRafku200yuBt6R2TXFf7195TCeNOxUjoR+lgtsSaOBwfd+oOvgQS2SM1g2OGZ+yA8tQe2E401i3unbQXx1b3rIkX7pjn3qmS1/bSjcOQ3CRiKRk257ITC8tCgOtdDtuIGMKW8/FTLj4NIi0Likolxu65PCa3HcK+y122jdZWX3QcLlFTdZ0HzQuNtG7YPZGkGWeVOt0R6iYq/wcp2V1Xef6valMgrlauzPAuprrDlBgqM7E++rEPrUv6k01DGV4i0Q3C6zCKSPEWy35cRcwsCIPBa/b1quT4L8SFPmol0CDWCeTKEgGIAzzTpN5thkK431WMFtaBCKm9bQ38v9IkM44kcIhbJhIM3CqJU8mc4RNyfToXNgSgX2VEVSebEy9527+FhgsbJsFIfWJOJ3PyiAFBfvm49wrMfuOnL3yKhtgUUq8qfriPB93psZ5+BXC58t5HStASKHkunWFoec+oNg9XYCrrZg0gzKkt4CTIwD6q57XQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(186003)(38100700002)(36756003)(26005)(31686004)(86362001)(107886003)(6506007)(31696002)(2616005)(6512007)(6916009)(83380400001)(41300700001)(478600001)(6486002)(54906003)(5660300002)(66946007)(316002)(2906002)(66556008)(66476007)(8676002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFJqZmQzZWN1UWcyYXJvK0VJSHYyc0FmbzFpd3NReEJHMGJOdlJ1bldsWnBw?=
 =?utf-8?B?ellpT25tMEU0a2FaZnN3Q2JFaTVlQ2czVUplK3ZNV1ovajZkdkh5OUZST1c2?=
 =?utf-8?B?RXZCZUFYQnBwTW05MmNqa2VEMkE0aW96ekU3K0ZHTU1GQXdJWHBQU2FtVExu?=
 =?utf-8?B?eXg1amtYWWtkdFlPbkZaQXVsb1ZrZ0tKRmZkMkQ3REFLeDFZR1J0OGpYS0ZL?=
 =?utf-8?B?NmM1UDVVUkxZQTRtNmN4MGt2NmdOUEp3azZTS0YyWmx6RThWNzVuTHR4UldP?=
 =?utf-8?B?UXJFdEdOb0JkV29VMGNyaDQyQlRlazBEL1JQdXM2YUlBM0doSU15UFZYaE16?=
 =?utf-8?B?YWljUU9jYklpM05RMHVPR3lWOXo5dzVTWGdyZDk2RWhINHFmTUZPS2dvbkIr?=
 =?utf-8?B?dXF4ZWlCaWludVF0WEU2NFJ1ZUVYVkxFRkJtUUFneUlNL2lYQlFBQ3dibi9l?=
 =?utf-8?B?NXQ0UUpNcmdmdXVvMUNjT0JNR2x3eno3ZzdTRDV1aDhZTkdKWGhNeXpDd2d6?=
 =?utf-8?B?VTJTenZBNlE4VWFBRlhDYWZuSGZ0MHlHZEkxRXh1eThLb3pLa0RPK0dsd1Rw?=
 =?utf-8?B?UVArNE03K09QVDFVYytxWjUySjc2M3BOOG5PeDRaSC8wNDFBMVVoZ1NyaGNG?=
 =?utf-8?B?M2xJbFZIMG5VRTR0enJ3OGo4MCtmanJOWHlGWm1hcndhMTh2VC9yQmRja1hB?=
 =?utf-8?B?ZFVmcS9sOFFyb29ucXlkRGYzQ0NqN0hFUmxzODZtYnZrTW1ENURuUzVHSEhH?=
 =?utf-8?B?Y3VnVTRTbXEvT25mZ2FMUHlXU3Z4ZkVxVVBEeFpQTUpPamZNOU10WjJLdW1w?=
 =?utf-8?B?M2lxbndNMXJCUVZ3T0xRc2hkWHpvZkMxekdnZTV6d2dMVUQyVHJrQ2xQa2NB?=
 =?utf-8?B?Um45ZHBvZHhrclhDWENZZ1BWV1lhWm9HOTl1TFpsNjFVTE9WSGErSHRib2hH?=
 =?utf-8?B?T3I0TFUxN2Z4YVk1QlpydnRrK0kxbjRiQmMxRnFoNkxKQmtib0owcXVaYWFR?=
 =?utf-8?B?Q0UxdDlVdXg5SUgrR0FFbXFKQURIUGxWOVh3b3ZqK3BMb1FobTdXRG5tbW0z?=
 =?utf-8?B?Y256eUZhMmtwUDlqNXlWenRIZ3daNVp5dSt3QXNrai9ucmVMb0htOCtXczFW?=
 =?utf-8?B?T2Jzam9CVTR0d3cwdEdzSTFjc0ZhYVhDckMvVlROeHFTazVXMGRmRGtwS1Q0?=
 =?utf-8?B?cXI5N1VHeU1aSGtzWlFCWXArZzZNbU5BNHJlVnBTRjJQYTFlMmtYWTFIY29M?=
 =?utf-8?B?RnpyVEVxUHg0QVV3Y0VjU1k0S05rcWt4eGRuUkh5YXp6S3p3ZFd1bUhnWW5y?=
 =?utf-8?B?YnN4ZVlKRGU2ak1WSWdVS2gwdlJkRU1udVBQbURCaDZmVDNWZllQVm56V3hi?=
 =?utf-8?B?eGNuTndySkJQK3E3bk1YRGxMY0hxZVgvZWQ0WWVNbE53Zk45eDd3d1Azb1Ir?=
 =?utf-8?B?WnJoSVNYbHUvRFpuSFlzOFkvbUovbGtzQm9WTGVmQlFZQzZiR2R4UHMwa25Z?=
 =?utf-8?B?TncwSkJSRFV3QXI0R25vWHNSZ1NaMmVxcE1WY3JUcFdDbkFCV2VwcE1qbnpu?=
 =?utf-8?B?VWpVQlVHV09scnJQSFVNUURYc1JFeVkweEFBaXAzd0RrZGtObWhQdnRSRFUr?=
 =?utf-8?B?U2Y4QzFiK3l5bFVOcWIvb29sUUNSRTg0c3dKRm9BdTVxSFNFRTdxY25wL1Bk?=
 =?utf-8?B?M0Y2SS9kWnhJd3Y2bm11cmdyaStoV3RUYVV0emhJdHBIYVcwWWJKRDcwczZ6?=
 =?utf-8?B?VmtycTdDeGcvZ2NRZktWekVtZ012UU52bloyc3pHeWlpOGlsb01Hdjk3cWRH?=
 =?utf-8?B?QnFOSVVHQmFoKzRIcnRBV3J2ZStVU25KY3ljNGdISW9vcEd1RXZLdTNPWkND?=
 =?utf-8?B?ZVdEVHpvVXJhOU5TTnhDUnJ5ZmoxMDAxSzBtUU9uTVc5aTBaQWpYbmVzRWxD?=
 =?utf-8?B?bVNHVEZPWUZ4dXg4dGVXN0EvWVNWQjJJTGZXWCtoL2JkeFdBWHZnQk5ucUlG?=
 =?utf-8?B?dXFkRmd4Wi9ueWtWd0Q3M010QXdjL3BhWE5FdW5yOXNUTUxISEx4VWVSUUd6?=
 =?utf-8?B?Ym9YbUtzUEhvekFYQklsNmpOb0lBZ1JqSGtKWXBXT1VaR1FmSkZoQWd5bHo1?=
 =?utf-8?Q?DLLgy8O7rm2ikxkzn/su+12Pv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec758cd7-3d08-4adb-0ed1-08da7f512b08
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 06:33:01.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3wPj+UlqqHVY59iXcdap79cNB8nBmB67VAXo+cYsufQol1snYwW9YPWOj9FXM+YzHLW3Wt6YUf9GXCBm3zp5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8112

The initial observation were duplicate symbols that our checking warns
about. Instead of merely renaming one or both pair(s) of symbols,
reduce #ifdef-ary at the same time by moving the instantiation of the
arrays into a macro. While doing the conversion also stop open-coding
array_access_nospec().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use single-macro approach.

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -111,11 +111,6 @@ long hvm_physdev_op(int cmd, XEN_GUEST_H
         return compat_physdev_op(cmd, arg);
 }
 
-#ifndef NDEBUG
-static const unsigned char hypercall_args_64[] = hypercall_args_hvm64;
-static const unsigned char hypercall_args_32[] = hypercall_args_hvm32;
-#endif
-
 int hvm_hypercall(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
@@ -177,7 +172,7 @@ int hvm_hypercall(struct cpu_user_regs *
                             regs->r10, regs->r8);
 
         if ( !curr->hcall_preempted && regs->rax != -ENOSYS )
-            clobber_regs(regs, get_nargs(hypercall_args_64, eax));
+            clobber_regs(regs, eax, hvm, 64);
     }
     else
     {
@@ -190,7 +185,7 @@ int hvm_hypercall(struct cpu_user_regs *
         curr->hcall_compat = false;
 
         if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
-            clobber_regs32(regs, get_nargs(hypercall_args_32, eax));
+            clobber_regs(regs, eax, hvm, 32);
     }
 
     hvmemul_cache_restore(curr, token);
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -43,18 +43,8 @@ compat_common_vcpu_op(
 
 #endif /* CONFIG_COMPAT */
 
-#ifndef NDEBUG
-static inline unsigned int _get_nargs(const unsigned char *tbl, unsigned int c)
-{
-    return tbl[c];
-}
-#define get_nargs(t, c) _get_nargs(t, array_index_nospec(c, ARRAY_SIZE(t)))
-#else
-#define get_nargs(tbl, c) 0
-#endif
-
-static inline void clobber_regs(struct cpu_user_regs *regs,
-                                unsigned int nargs)
+static inline void clobber_regs64(struct cpu_user_regs *regs,
+                                  unsigned int nargs)
 {
 #ifndef NDEBUG
     /* Deliberately corrupt used parameter regs. */
@@ -85,4 +75,9 @@ static inline void clobber_regs32(struct
 #endif
 }
 
+#define clobber_regs(r, n, t, b) ({ \
+    static const unsigned char t ## b[] = hypercall_args_ ## t ## b; \
+    clobber_regs ## b(r, array_access_nospec(t ## b, n)); \
+})
+
 #endif /* __ASM_X86_HYPERCALL_H__ */
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -27,13 +27,6 @@
 #include <asm/multicall.h>
 #include <irq_vectors.h>
 
-#ifndef NDEBUG
-static const unsigned char hypercall_args_64[] = hypercall_args_pv64;
-#ifdef CONFIG_PV32
-static const unsigned char hypercall_args_32[] = hypercall_args_pv32;
-#endif
-#endif
-
 /* Forced inline to cause 'compat' to be evaluated at compile time. */
 static void always_inline
 _pv_hypercall(struct cpu_user_regs *regs, bool compat)
@@ -65,7 +58,7 @@ _pv_hypercall(struct cpu_user_regs *regs
         call_handlers_pv64(eax, regs->rax, rdi, rsi, rdx, r10, r8);
 
         if ( !curr->hcall_preempted && regs->rax != -ENOSYS )
-            clobber_regs(regs, get_nargs(hypercall_args_64, eax));
+            clobber_regs(regs, eax, pv, 64);
     }
 #ifdef CONFIG_PV32
     else
@@ -90,7 +83,7 @@ _pv_hypercall(struct cpu_user_regs *regs
         curr->hcall_compat = false;
 
         if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
-            clobber_regs32(regs, get_nargs(hypercall_args_32, eax));
+            clobber_regs(regs, eax, pv, 32);
     }
 #endif /* CONFIG_PV32 */
 


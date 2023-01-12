Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB816673F8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476173.738215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFy99-0005Ur-NS; Thu, 12 Jan 2023 14:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476173.738215; Thu, 12 Jan 2023 14:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFy99-0005Sb-KP; Thu, 12 Jan 2023 14:01:35 +0000
Received: by outflank-mailman (input) for mailman id 476173;
 Thu, 12 Jan 2023 14:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFy97-0005ST-Ce
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 14:01:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2054.outbound.protection.outlook.com [40.107.249.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e238e7c-9281-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 15:01:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8537.eurprd04.prod.outlook.com (2603:10a6:20b:434::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 14:01:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 14:01:30 +0000
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
X-Inumbo-ID: 9e238e7c-9281-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4TDR/EjdVzfF8gJg0EwKmIRx9k81maO44+S6RcKj1t3j2StYeyE1iT2Yvpk1kCyjW40YZEbUXfZ4hbbOppJUle9ZaBj2e6J7pTqKQtog0C0Qu1Ir+5xOzkwb7ChH9QPU2WprvITr1gdkUcgarlQT1PWQmOu92r/lAJFfIrpqSlhHScSPXGtYoGuQBnELh8gO46M1fAqV4eiLxBfeeUAlr+l5C1Xe//+HNzmd34ZRLEXbYEUf+AjB0sLMI8/BXfHLM+TjDTJB6yT3grUcfktouxnFrhrLYNukROYxNgm2CZ2EOLiE5WdiZZLFkVizWSMQVhw1i2D2gyKM6bl++KP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJjRH7h1ZjdWbrus5g79m3fp7lbTH6/IpDJ5Io/pxKM=;
 b=AWtY/kf6gOv0a8lqD+5AbBSayEOxxh9yffB+smNLJmYACkhhR8NE5RirPRTKN6Pgbij7tIyJnWHystLIskD+gtZWsfX+500csi+L+SJvIe/kd/esfX5+xmMgbnCvTV+GB95u/67WG4C3bgbx+ZW6Yx+BFcpD6/Pyy/YzOuTWs2XDTcNg7O62ZTVWFYOZKfAR/G5D4F2wojXX3RVay7ppRJhB5RAFqxTViPwtLVIigGN/Ubxq95r+T50vvfVEu8za5ILlnfGljY+Sdm+GgjDrolgdWKKtvsHDTb08NEfEdutDqgCXfvcCHQdyp+htQKj6dHblNcoWLHQ0pkircfpy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJjRH7h1ZjdWbrus5g79m3fp7lbTH6/IpDJ5Io/pxKM=;
 b=jbdShx4+n1bDwLTGX3IcqKaBTFI5zYaOMvghJo+3nxm+1GJTosbmWPLBycfjl+tgjddA+u/mjQn5KdsLnpU0LTDyU39NfCXSQkhtlt9tjpzNbih/PojPt7yb2olTApEggukO9TsfmzsFWXnlHBw5gv/Tf3taWHLXnlMDLdAYbFy3oyPVvFluQ4YpJtA9UtG6XnK3Rx4XXpEEs7X9BGS9HUEyi130A+EthdWOxoQRlTOrGy4vySpvoXJbRCXI32/wiDIRz/Bo4i6s8FihjJsQX61yHfXYkP5oNz/f3ljcrYuJLDxqS8xwU7AUJpLCEGHdqhIwmFOMABb0+fEI0mESIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com>
Date: Thu, 12 Jan 2023 15:01:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] include/types: move stdlib.h-kind types to common header
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 174b2b5e-88b0-4110-edfd-08daf4a58132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Ix20JLXTC4lsH0nmgDqIrtyB3WuTv/6nuvTkNJn1AavHsz7DnII/YuzWCn1X3JAsDE+taojlV4kUnWBPCtkS3B4f8aPgXoTldp33Z1VRI51uMCaie69kp2iXyBwg9LTWSRFIzMCRUntZZrdXw+XDiMjfBrd17vStQKquITjCpIPY49xH5A8V2wfhUuRPeDzzQl+KAPEECCJzvtptdBi1+n6yk77TopEjkUoDdbzmCiuyaJaPSHzg3BYG+8g6QT6ktk0Q/qKWUyrYxMMht7+R+X984w4KDqtaRIiYJYXYpNyh3r8Zhdeig1pSImOQkK7uAXTOS7VZOaCBnA2wnhc1ApbvqXYdVUMhNCT+CJq+P93CvTk0Ms9MAQbV5VQiAHqQd1CeoB6RL8z2/DUI10xT+TpvJRhMErFghKR6uRd45/Y5G6VARihsl++youmO84XnvQ9QjRutquQWEC0/IHb5t3JsG2jyymwkbi7WRBp0YMMZVstmjhhplBeRhB1zAE9DXFPHpnXT7XLPKLMzJchC/G9A39S8xv8MG6HlXayVG95MRjcU3sTsLPfo6CSWtzvYqlo6HssGUUhNJzkbFgQRqfr9rvDDK/rzskn9wW2EqN3EHe9B2s4lndMEMp8Yi6GnIx2gp1v15cVwtT+rmGLK9X4fMpN+e9MIAySTSNEFPMKsVlaP2mDZi7cFd3p4lpMyvhxAnXYKOQZCqbRHvAZlk99m5AURS+bnRTRgCM3tUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199015)(8936002)(5660300002)(41300700001)(86362001)(38100700002)(36756003)(2906002)(31696002)(6486002)(478600001)(31686004)(26005)(186003)(6512007)(6506007)(8676002)(6916009)(4326008)(66476007)(66946007)(316002)(66556008)(2616005)(54906003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU9zU2pWR0xqYlBoZEU2dS9XNDhDUWMyMjFHdEVPdjdybjhnYVdURDE1SXFu?=
 =?utf-8?B?amdreVAxWWFTMXovdjVoN1RnZjNxRWkrdkd2dGdpOGovdHNKdFJhdnVJa0xC?=
 =?utf-8?B?REZUaTFTbzNqT1pHZ2hheGxpSVBiMEh0T29sQ2c1KytQSDRlblF6Y0MzUXQx?=
 =?utf-8?B?VnI0blkwbTFXVDZxQkFCalVJcFJFenRuTXkzSEs2dXpDb3A4SXhBc25ZZEdU?=
 =?utf-8?B?ejRsNE5CeUtLNUJ2dXpyMWVib0V5cXZ1UlN6RlRFNFdXeE15N3ZTOFFEc2pV?=
 =?utf-8?B?MGpuZkdNVmpaeHlWQjRmVWdPTlgxamdxenF1SUt6bWtGZUVTcC9Sc3h1alZM?=
 =?utf-8?B?K21VeUJsNjA3a0M3K1lMVmF4NmJPVXowUGR4alhwRWhZaGlKVHFISkRDcFNr?=
 =?utf-8?B?VzE0OW9LN1B0MnJTSGRDTUhpdWN1ck5IU0lYSWtEeWwxUDB5QkQremFrUVN4?=
 =?utf-8?B?UU05Z3hFZnFNejZjenNIQnVvcDZxczBoQXN5amVUOEl5ajhaNytQVldicWF2?=
 =?utf-8?B?WXlVeXQ2cXg3R2NXTGNtVlFFYVNKQkdYSWtFazc2UzdreUdZZGdsS1JtaDFa?=
 =?utf-8?B?eVdxdmNwRzNtOUhiTktQMjBJdXErYnlLV0pVa0tPQjY1eFdaK29kWGhCMEh6?=
 =?utf-8?B?UkI4Rm5QNTRlQWdxMVZkM1MzQVBTTDcwVDdyQjdQUHlvRmxLN2VHMVNGcDli?=
 =?utf-8?B?amlEcG5qODJHdC9VYzk4VWx0aXI4dUd4U0FkT09XTWxSdkZQcVJqM3VOTUdB?=
 =?utf-8?B?WHFsM0VZNnEybzBobVV2eVM3OGxjejRWZkl4ODFhNC9Ta0I4S2R5VGpLek5j?=
 =?utf-8?B?bkc5dlY3MFBucUFlcnozbUN2aGIzMkxxOG5JRjdBM3c3L1doNnk5b1FjVjlV?=
 =?utf-8?B?UGlURko5cUlRRmliMEF6R3lpR09BQVB5MlVwR0R2L3ZGZU5MK0tvb1ErWEIx?=
 =?utf-8?B?Y1pBTStFa0FKUndjaUJNcnpoMlRqYmppSTVQY2ZhQWJlU28yUjlkNDhza3pI?=
 =?utf-8?B?VG1sWEd3MENCLzU5bCtGeEZkNEpOeTEzSHRYOTB6a1duQWVab2ZseE11SWJW?=
 =?utf-8?B?TGJWQ2Fpc2t0THh5bU10Z083ZEE3aXVnV3MvQkZ3a3ltWkk4YVdRNHgyYkwv?=
 =?utf-8?B?Y2FWNEFwYVlHNnVTUzhoVzU2YzNZakRDTmExMEpsWG5yY1k3MTRiUFFyV0Vm?=
 =?utf-8?B?TlRPUjIxTTFKYXByS29wZEw2ZkFaMW9pYkZ0ajgycXB0WGtDTjZLSThSOHJU?=
 =?utf-8?B?Zzk2K1NkYTdjTUE5MWtrMWpwVlE2T05mSUF0dWFJUUdHWEp4QUlMNFdjdUF1?=
 =?utf-8?B?ckVvdS9mLzVBRnRqMmIydkQ2RU1jVndHYUhXeXpyd21MOFErOC80RnNRanZu?=
 =?utf-8?B?YytWTThsYjVRU1dsTFZCZGhtSHcvS3ZiYkxRN0IwWVlITEkwQ2NVUnRQN3Rv?=
 =?utf-8?B?WjZMQzJBL3U4YTg1WnRPTFhTcEJudUtJTk53clB0L09DUUdyRmk5UHRxdTJU?=
 =?utf-8?B?MGFBNVNLTFZwUHFJTUlFNzNlOWtEdEVRc2d0STM4b3phelNuQ2tCM1dTekRa?=
 =?utf-8?B?NlVaMHh5Z1dnOTRQOVc0R3dTR1NwLzR2QUEzcTNROGFlajR5WUN3bGJhV0F6?=
 =?utf-8?B?QkxQSHlSWDA1MVQvanlCRy90dmU5aGFqaUVtcUh5M1ZreGFlNm9iMjQ4UWdl?=
 =?utf-8?B?VTU5L1VoaHRmZ1VOemsyRjViSWdUVS9rZlc4dkNJQ09JOXI3YkhtdlFhcUZW?=
 =?utf-8?B?NmhBd0cyVzRRTUloMjRvTE1NM1p0T2RzdVZ3SXQ5K1JGUHpiZ203TU16SjRG?=
 =?utf-8?B?MFdZSHpRUE9CLzMxeWRSUWlXbFViTmZKTDBDWGszUjUvdjNoTkh3ZCt6ZlBh?=
 =?utf-8?B?NThEcE5aQ3psK3o0UWN2bXdKa3ZNTzUwYVU3Zi9hN0VBdE5EUUYzUXhwYjdt?=
 =?utf-8?B?bEZFU0d1U0J0WDJQYTBpb2F2VllaYnZNNVpCRTJnaE1vUHg4VkVPeDYrMnBR?=
 =?utf-8?B?TVRZQXgzK0k3c3Z0SnFTM3g4MzFaRVgwUExMOUcra1FjVmFQTzJhVmhZMks4?=
 =?utf-8?B?cHZTWkhsellYajlOL0xtQzlSa2IxT0oyUHRnVStTM2RBWlowOVk4bUVyaW9C?=
 =?utf-8?Q?FDrOcCzhW4k2xl2MT6eaPuSok?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174b2b5e-88b0-4110-edfd-08daf4a58132
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 14:01:30.2444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrjkouWn3IvIMEgsXaPcfIWdvk4FmrhV4OVeTScxXFSMoXCbN4Tg3h6PdmE6ZrYfgl+YowGg9GfO+CZ/O0/rPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8537

size_t, ssize_t, and ptrdiff_t are all expected to be uniformly defined
on any ports Xen might gain. In particular I hope new ports can rely on
__SIZE_TYPE__ and __PTRDIFF_TYPE__ being made available by the compiler.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is just to start with some hopefully uncontroversial low hanging fruit.

--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -54,19 +54,6 @@ typedef u64 register_t;
 #define PRIregister "016lx"
 #endif
 
-#if defined(__SIZE_TYPE__)
-typedef __SIZE_TYPE__ size_t;
-#else
-typedef unsigned long size_t;
-#endif
-typedef signed long ssize_t;
-
-#if defined(__PTRDIFF_TYPE__)
-typedef __PTRDIFF_TYPE__ ptrdiff_t;
-#else
-typedef signed long ptrdiff_t;
-#endif
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ARM_TYPES_H__ */
--- a/xen/arch/x86/include/asm/types.h
+++ b/xen/arch/x86/include/asm/types.h
@@ -32,19 +32,6 @@ typedef unsigned long paddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"
 
-#if defined(__SIZE_TYPE__)
-typedef __SIZE_TYPE__ size_t;
-#else
-typedef unsigned long size_t;
-#endif
-typedef signed long ssize_t;
-
-#if defined(__PTRDIFF_TYPE__)
-typedef __PTRDIFF_TYPE__ ptrdiff_t;
-#else
-typedef signed long ptrdiff_t;
-#endif
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* __X86_TYPES_H__ */
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -5,6 +5,19 @@
 
 #include <asm/types.h>
 
+#if defined(__SIZE_TYPE__)
+typedef __SIZE_TYPE__ size_t;
+#else
+typedef unsigned long size_t;
+#endif
+typedef signed long ssize_t;
+
+#if defined(__PTRDIFF_TYPE__)
+typedef __PTRDIFF_TYPE__ ptrdiff_t;
+#else
+typedef signed long ptrdiff_t;
+#endif
+
 #define BITS_TO_LONGS(bits) \
     (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
 #define DECLARE_BITMAP(name,bits) \


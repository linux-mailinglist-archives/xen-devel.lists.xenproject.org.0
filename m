Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E6610B37
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 09:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431441.684350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJi1-0003KH-CG; Fri, 28 Oct 2022 07:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431441.684350; Fri, 28 Oct 2022 07:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJi1-0003Hy-9O; Fri, 28 Oct 2022 07:23:17 +0000
Received: by outflank-mailman (input) for mailman id 431441;
 Fri, 28 Oct 2022 07:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jtyv=25=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ooJi0-0003Hp-ED
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 07:23:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62d9dbd7-5691-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 09:23:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 07:23:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 07:23:13 +0000
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
X-Inumbo-ID: 62d9dbd7-5691-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP0MM2Dbw+SIT8P/cq1IuvqZl0F4NCrnhjtHjOh0zPefiNKUPTiJ5IFHu2DDWekt2YvMDR6JXWtdRRUs3+cgzs/QK/Z08PWOugRodB6b153wg49cSno+DspqJEBmJl7cGlSUO8YquzU1eJJzKvHXWTCbX2lLwwrb1RbQYoLD62q7UZq4LqyJCDj0f2ioRIOl1dus+5JsJ5LYPDdbbNT+1Nxa29yfaEW0m8mdFzx3H7xfM5N+fbWl/e/B4M4suBiHddQsR565JBUUVY3xbS57pwwswRTrOC1boVIQmTvP/fuiPXJnAX7XWyEjaLG9aX6dvpnAb/MNoRgUDqQycf9toQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4EnGeRwXar3+da6jwqvXI51YktxFxeKbOMUsdd7OF8=;
 b=n3ui2QSscLcNXWx53MsSA1MFmdJ0XphkFKK6l0i5EEpO1GS2BX4BxK/LDXLCu9duLoQ7/p/NitDlRJeiPpfL3/OjGGmji+QIydr3GBScSveFlKH98TZbEDHCBlgpJkjWHFGkoXm6r+Xn+mE7slHodEaNmh2nsGLNmASjjWyfmZxosdUvpVD74BUYncfDZmDGv6jMag6WieFWxhfaQ6yZnGbTPRjtqCGVUsHV1qmSVVN+hGy7C+PO6v9iKtJfZOXkArzzab/9j7mAwgTF2+YJXWV+G9xJ9WOgPE6g2ZxTschkN21MZRis2qCwAVmqQpVWy4auvAmEySq4oZt4wDymwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4EnGeRwXar3+da6jwqvXI51YktxFxeKbOMUsdd7OF8=;
 b=CMf+uJBsEN0kWZASqJEnO7IYLhFosBujId9SraPi/42LRzZSbpdYm+E9UkurKX/K1M9Fu5mySFUtfPGrSMVehA0UI7rLQ9BVOFL5DGooI9XFIZyivjiqrF6SN8kffpiZ4Ffb9gecRCvbZ436ldqe7zdkpn3szOqm5PNf/1k36kZkOoDetUuWItuRc5j7zKk1d/tBaoz+71y23eznh0XBYEHAWILYIGKSzm5PxQnAT78WH0UqdVdYYRxlDuuGGsQ93VL4dNtxW5mI1DcLIIt5t8UNxe1L45hEVp/jHW89lCIz5b4AR7e1tSyBURMJHetNqlTT/8TtrO7bGDEx3C0N9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b038c16d-2c94-584a-ad84-02403c52b0e3@suse.com>
Date: Fri, 28 Oct 2022 09:23:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH 3/3][4.17?] x86/pv-shim: correct ballooning down for compat
 guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2398b0e8-ea5f-dc8e-46d8-2d3994a98b34@suse.com>
In-Reply-To: <2398b0e8-ea5f-dc8e-46d8-2d3994a98b34@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 401ac5b1-ad37-4fd6-5975-08dab8b54626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MaKF6QKUQhTwCvkvqieXw77wWm1OI3YsgaHzzaH/MIhe9w0WrWinAM1GonlRIOV5or70tF+L2cEAWDcmc0H3f9sD4h/MG1MLF40Hj5hf+EsKY53DuQL1pXR/akaWD+O9fdkYTZZhIerdFHEGPZyyIizsfhXegCdnrkDUbvDOwonrZQrZ7ZbCQ2rRY8Mlttxktulx6kD8b6ZlUYoevDBJrUqy2ZxNQbHbBZ2QvQO8xag4AcLbvXZMc0u7mzobY1dr5cAyi58yVA6ruUN5JAyAqxKN8edJR+ZKtpsYyy2wFfYv+TOn/G4F7nFdY78tcIM7QmHkN9vZunNYJ3nB/vF/hf0vlktK00I5O54buj4yODDMpygPuv3+N07Q6t79zeEvF63Q592ivFKfq0JYXz4NkJY84LHN8XptJVr9MuEalQJ0FM/PmfOlenuer1aAMgpeJ3goyVbibbTY6lTo4lKPyzY+g6FRez1ZwBzD1nfeLZSWvGN/Ecv8u/wVWVR+yFJ305EeZ2E51czqOO80neMjmnHSVMnQleD+fyg5jmi6UMqSAn8zLBs9+9TMij5TlGOGVna1G+eWCQ1D1WmxQZ+IrjhUXa+q/nISKROQNH0anmmMYgidZCbImQT/wZaje8A7xzuHKZJjvc7YSc3DgNesXfkT/1JPqGDwX3aWu9BR3Jt4UCPpVFGNLvs54ADESemmANC+e+vXxeQ/kjR75NQmqGtVCYJZW5bGhuqqTa9ZAhF0WOmbvn5P77VldaPdqfNJzPB2ZR7ScmTFyDZYftL4+yCifXtXggLKoGgAvLsMcz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(316002)(54906003)(6916009)(8936002)(5660300002)(2616005)(186003)(4326008)(36756003)(8676002)(6506007)(66476007)(66946007)(66556008)(26005)(6512007)(41300700001)(2906002)(83380400001)(86362001)(31696002)(38100700002)(6486002)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm1LNXNNS1U0aFg4dGpIZGVtVGp3WVkxS3R6WnJEQklzNmJCZHNacnJKSXRX?=
 =?utf-8?B?enRVWStDMGY0R0RQekR5RkJTcjZteGFDNHVwYmN1aFFxY2F2aDRvME9qYmIz?=
 =?utf-8?B?ajUzbWtyK1VERmZ1d082Q2RVSTRQOFBVeFNpMzdHTnNROWNkdHI4cWtmZG9O?=
 =?utf-8?B?L3RsTFhBcHJ6cUFTZmltU3Y4djc0SldWMjJkcmx5RWpPM3M2VUZ0QWVMUHlv?=
 =?utf-8?B?a0pNWnFmQnZsanpGUC85YW9PRlNubGlTZ0o4a0hHaW9LR2VWNnhkV0NTL1l5?=
 =?utf-8?B?bklpTGpMclF6K0NHVVZSTDBZL1FIYWxaVkZZUkVGdGpBREdhVTRxQTBMUFZQ?=
 =?utf-8?B?eEM3a2RCNXNVaVNmTkV6TFBXNHNMaXJzU0lOQWpDd25UTU1CME5KekdqL3lu?=
 =?utf-8?B?YUNrMVEyb0I0T3MwTE90anVZRDhKY0REUCt2Q3NBcTVhN056dmpzc3pmbkc4?=
 =?utf-8?B?czBNTTB2amVGL1F1VGxVWEhheDRRNFZncERKaHZac0t1UzIwMWxKYVZUR1VL?=
 =?utf-8?B?emh6cG01KzZXMUNUV3htc1BWdjlMZ0ZhVW9FVm5oYUxTQXZvTFAyb2NsQWM0?=
 =?utf-8?B?RzhteUs0NG54dHR4SUdMY3VrZEN6STN2bkV3WisxQ0NKcHhKcjcrR2I2OHRX?=
 =?utf-8?B?a2p1ejdOT1A5Z0R6RWVxS05QRHB6T3VUTmdnSmFVZ1BTTFBTaDMvSXVKNnZT?=
 =?utf-8?B?NzFJMS9TUTdJTi9tQ3g4V3JhaC9CT3JxOGY5bkhjWWVTb1J2bnluT3BrbHFM?=
 =?utf-8?B?UzBnYzAwZmxwWEoxUDIxd085Ly9rczJkT3hzT1NXL1BNVGcyd2NmQnlsSEhO?=
 =?utf-8?B?ZUlEalFDSVZ4UWJuS3ByY09KMTdrRExQK0xGZVV1TklOejkrQk8waXY5azBI?=
 =?utf-8?B?SnZCSXdzdkdma2crZmZIZHpHN09WQUJDalgxSUJwYXlHWnUxWThaYXhRYTdF?=
 =?utf-8?B?SWtzSEJPUzhtYy92NFdNNHVBRndvRWQwZC9WbEhET2ZWdjJFbU9LQ25MRWZU?=
 =?utf-8?B?Lzk1dmtIdmxWWUsyTHZYK2l0RXkwbEdmMkZxZ0U0aFBFT2dyd3B6WWEvdTQ0?=
 =?utf-8?B?NHZvS0RrU0VvZExwNkdUdEJSUXpsZWNrUmdOOGFNMVBCUDl4dHorUUs1Rmp6?=
 =?utf-8?B?M1ZvQmJCaUpXMXdNczVJdUJVU0tCM3h4YVBUWEM5YWNlek5OTW1GUDc5Rm11?=
 =?utf-8?B?bmZFd0lCUjRyVWRuR0hEbko1VHZTOXBLcUppRVhLRmJqR2VTZzJ2emZmR1pS?=
 =?utf-8?B?MzF3RVc3aDFSd3BhU1RwcE1hR2s5c3MxMVpHajY0dUx1TWsrdlMzSzBmMksw?=
 =?utf-8?B?TlNiUkJicEhpNDh4SGhHNEhkWGg5UmFadTdzOVIvOU5KK2dJaUZRRmRlWTY1?=
 =?utf-8?B?a0kwd1lLanpDUFVvY3Q1N0Rhai9Pak1OakIxbjQ0bHBpMW1OUzhsUE1NT1Vi?=
 =?utf-8?B?Z0xUM0xnWG53dDNQek5ZRFhxcHdla2lBYzFOWlcxTmtVWnY3VnVyWE9LOXZ2?=
 =?utf-8?B?VGw1a0FwUkVyODZGTTNrRDNVVk5IRzNyNnE1VVdzV0svRFdjZW1NSXFoUjNX?=
 =?utf-8?B?SUpsS0lhZGlOZmxOZStWMGs1cm5vcmpmOXFBN3VidkNKRjFMcnE5ZFN6Ykxh?=
 =?utf-8?B?cFVVakRxOGJnci9lOWIwb2ZEN3E1WjFOZyt5V0sydGFRdXB0WkgxaGtObUpK?=
 =?utf-8?B?Mll2dW1hQ0ZXVm5BQnNHUjhGdUtLRjI2TkVEeTl0V3hlR2N2c1E5UXVwcjFr?=
 =?utf-8?B?OUhaQ3F4TUJSbjlNWUZDTkZIbkllT0tsbm9BbkV5QlBlM1Q0aURRSERyRVgy?=
 =?utf-8?B?eTJGNlcwV3F6VmVEbDFBNkZsNWYvYTNhb3lzMUtsT3h0L1Z1OXkyWkZ5Mjdw?=
 =?utf-8?B?VWdieVllVHlrTzVxRXF5UEtOK04yc0k0emcvWkl0MG1RVmxNYk9PV1Iwcmg2?=
 =?utf-8?B?TFM0VmdwdDZNR1ByakNoOXZuOEJZNW1UNlpiZExxRGFtcmFCL2NqUVhSdjJT?=
 =?utf-8?B?ekhPU3J2UXY4QUZqNm85d0Y0QUwxTUFIU2NKSFZwQlJ4SmVBd1JDbDJxMEFN?=
 =?utf-8?B?eTgrc2RsZW00S0x3Q001QVhNdFpCV0oyLzJyMGlWZ2IzWkdkZHNvU1FGWXMv?=
 =?utf-8?Q?qPS/i+GMrZXg+HbUvTPPLS880?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401ac5b1-ad37-4fd6-5975-08dab8b54626
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 07:23:13.2949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2W5LiGUCBqks8d5844u/qQQNP+huyopMCOjkYs+eBRnVoBoZzOHTnz9bdrMjyu+E6fHKEpAfoGpn3HiaRIjfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Igor Druzhinin <igor.druzhinin@citrix.com>

The compat layer for multi-extent memory ops may need to split incoming
requests. Since the guest handles in the interface structures may not be
altered, it does so by leveraging do_memory_op()'s continuation
handling: It hands on non-initial requests with a non-zero start extent,
with the (native) handle suitably adjusted down. As a result
do_memory_op() sees only the first of potentially several requests with
start extent being zero. In order to be usable as overall result, the
function accumulates args.nr_done, i.e. it initialized the field with
the start extent. Therefore non-initial requests resulting from the
split would pass too large a number into pv_shim_offline_memory().

Address that breakage by always calling pv_shim_offline_memory()
regardless of current hypercall preemption status, with a suitably
adjusted first argument. Note that this is correct also for the native
guest case: We now simply "commit" what was completed right away, rather
than at the end of a series of preemption/re-start cycles. In fact this
improves overall preemption behavior: There's no longer a potentially
big chunk of work done non-preemptively at the end of the last
"iteration".

Fixes: b2245acc60c3 ("xen/pvshim: memory hotplug")
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1461,22 +1461,17 @@ long do_memory_op(unsigned long cmd, XEN
 
         rc = args.nr_done;
 
-        if ( args.preempted )
-            return hypercall_create_continuation(
-                __HYPERVISOR_memory_op, "lh",
-                op | (rc << MEMOP_EXTENT_SHIFT), arg);
-
 #ifdef CONFIG_X86
         if ( pv_shim && op == XENMEM_decrease_reservation )
-            /*
-             * Only call pv_shim_offline_memory when the hypercall has
-             * finished. Note that nr_done is used to cope in case the
-             * hypercall has failed and only part of the extents where
-             * processed.
-             */
-            pv_shim_offline_memory(args.nr_done, args.extent_order);
+            pv_shim_offline_memory(args.nr_done - start_extent,
+                                   args.extent_order);
 #endif
 
+        if ( args.preempted )
+           return hypercall_create_continuation(
+                __HYPERVISOR_memory_op, "lh",
+                op | (rc << MEMOP_EXTENT_SHIFT), arg);
+
         break;
 
     case XENMEM_exchange:



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815DE5F6776
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 15:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416899.661585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogQei-0004A0-Sm; Thu, 06 Oct 2022 13:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416899.661585; Thu, 06 Oct 2022 13:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogQei-00047K-Pt; Thu, 06 Oct 2022 13:11:16 +0000
Received: by outflank-mailman (input) for mailman id 416899;
 Thu, 06 Oct 2022 13:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMX9=2H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogQeh-0003yu-CU
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 13:11:15 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50076.outbound.protection.outlook.com [40.107.5.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b135d48-4578-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 15:11:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9560.eurprd04.prod.outlook.com (2603:10a6:20b:470::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 13:11:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 13:11:12 +0000
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
X-Inumbo-ID: 5b135d48-4578-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPaqT4rCOTuky1Zn/uyRRbxGEK9gE9DkLGh9sWPSrLk9+KeDr04oIUoNam2s9TlmvZkBYHV5UXCBqHgts3AizQRd2ELohfIhxz3VB29QPIymKubuE4J/KyGeonSiXhYNAsf+IRlB4oMEB9z1QW8FljDTWg+Y4Ejmdn3ZxfZkyJbkm1wLtEhHelu/eu63vLAwBC++X7mUrNLl+/jXqazJAKh5fTv8MalHXok47YAuITa7F75VNPKg7rnHAZRZJVizDi+m1Wd6cgpNd7I5AKztnh2laFj6ahXfHuc8azN0tWQpMkYk4/YbPhsoSSecAgoQVSTUJvFO7BxAlngCTIW38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsP25R/4gs4hqLJaINXdXJap1S3h0P4oZ+V3WVxiDK0=;
 b=mXQKEmQQraa3puiNwYnJNKTpm1b8o4YN2iVysIHkx/8DGCN4jmSuE5ATCunW/rB07S/EaWB8GmPLqzMkNmkNdkuxUQREo/K99xPVfH+eaUl/ph9iQgrciXlbwpfj7yX/UUaOaphq4eDw+VwRH4vxSzMtgLjBu4Y701wzV6gZ6A7AjBUi+Qe56pebzCy2Nt86kJtkT7DzdEKlq79I/Gp2+qtA97BHkv32r2QGEmfOQ6XcgwUvexsfkzW0nMtgdqBDaPQGGDjwxZO+Mln35Eicr9BUxeloQC9dFDXWCXEoZpub+fqADRvThBFihyA9/GuZ1tPt3+Cw1myiJLdSl9UjIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsP25R/4gs4hqLJaINXdXJap1S3h0P4oZ+V3WVxiDK0=;
 b=TIwGfD1ThDWRYsL/JHNNc446FRkz8RsHpF1ELrZXwWIgihQaZJwA31xyISsBjEfUx56s7r9l8Mx7egXXMaF4O//Dgm0qmgX5WiiOlQAwSsAMiiIB98TT17wEwh0RfO5TAgGwmtJFIpFBrG6XHCq4QCUH7o21rky/p/fYydxayHFZU9bleszB0F1wLbQf6LHJrMwYxi+PmIv7v80TOdJPG/2ixJChCf/E9EO0THNgPuZmlUXCDFHqyYZvBoMRjhRUtK+qYTISg0qlzis8038DXO8AIiY9cPwaq/17c59kDnW8R59r0DDuMoUVsvXTvDiUfQOJNRBGoVwZRYQVQhSfww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1dac86de-cb8c-d2b2-d0ab-bf76707d22d0@suse.com>
Date: Thu, 6 Oct 2022 15:11:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: [PATCH 1/2][4.17] x86emul: further correct 64-bit mode zero count
 repeated string insn handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
In-Reply-To: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: e2403c17-6fb3-48c4-bd6c-08daa79c3e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0oH+rauzweuTyqBEYFa7igbLj8xbV8m8zPWO8R6Xn1V/o8AyOF2MnN9t48W/SIfmHI1SsOVyZWY7jt/qLJz1LOdjUlYdo9r5886tjgA6w+lcdu4FdBkhzn9GX9ofjGNNN0AkDm3WtpHe2Qm/ZIEbCOG/xyZB8idrs/acA0eXbFQJHYjfH8HsrdIe9S2prhW5z+ycqfZX6i9V3/2S9UxhrCbPB/cphX8ddXf6OtPLMNYX450fT5nrqXeB8dJbeY+sYSU3tVNhQhVvEOXDykYtedBYP/EHmw/rh/LJlTUfNlPu+BqI/kgpoJ+pLb5+vavDqW+MDOyl5HC22kBvmzWXr5LaN5X40IMyHEQK0JTkthZbAFgflBMOEzBh+YWewwrpK4ineSGAoXVALkO/EDuP5lYd/GD1MYfCMLrcUv0BvC0SPOLNklK5wD8wtsMK37RLTIXeJyK+aQwxxU3ll6t7FoPnhJnfVh7gZE0nh5QE+c/oeA2Sz1dWQl/OYH4bEKWUs0QqSu9FnPTmk26yc47vWPVsv1oUjUmkQrZiKH8ATvw3SOLhWzGoI8wMb+tURc3rHG+EbXUYlDIL7GCN8/yTQ2NO1c/4lQ5EV87hkC1enrOYv+UMklKoIkdfmziDHnZo15hjCYr4f3C/kteGJQm0USKMMYtBFI4llNkyxmDAi5Y+WDWW/rDwQWBURz8O3gAJe+gRV/g2rNw2zMeHm+hak0O1s4r+WbPVV+fsnEi+vvqujygFeDd6FhhJDnjT8+Tyaf///gIncw+77UXTYjxC0ol2r+5Pb0Dh3Xo0nFLwCaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(31686004)(36756003)(6506007)(26005)(8676002)(4326008)(83380400001)(31696002)(2616005)(478600001)(2906002)(186003)(41300700001)(316002)(86362001)(6512007)(6486002)(66476007)(66556008)(38100700002)(66946007)(8936002)(6916009)(54906003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0Z3VEgvSEhvM09uVFplLzlPNUFLS1k5K0pSZmRVTEVnVFJnclBHajRibzhx?=
 =?utf-8?B?cUE4UWVlUHpYem8ydUlmTkxRZ1Z1bUpmWEtDTE93NXJIMjN6YmtZWFVJOWg5?=
 =?utf-8?B?Zi95NGVHNmFFVnJ0TERydThkUXU0aE56cFQ2MXQxY0o0Q25sQ0dMV1dWRHNG?=
 =?utf-8?B?WVJldHRQT3ZTQjdKLzJZZkNaRHVUYnRYOVBoZ1JiWHoxVDVCa2xqZXFkM2VD?=
 =?utf-8?B?a3Q5ZzBvMzA4SUJOWFpoUERWVGxRdXQrN25GTEJpUklkWFFKU1RnZjJXYXpN?=
 =?utf-8?B?RTZtM1hma09RWTZqYmJIS1haVVphK3Bhc245OTdlNmFpTzdsbkNSVzdzeng1?=
 =?utf-8?B?Q2k4N2pnSldDZFNBZWd3amQwbGV2UmY3ZUp4cVhSZ2lRa2VFVWdyUVA4VE9J?=
 =?utf-8?B?YkJwL3VsMEM5U0Q5eUZ3aS9LYVA5TkJvbzI5WmZJcnhocW9DU0xxUUR4c1F0?=
 =?utf-8?B?MTdtcGVKK0ljUlpkVU5wZWZMK3lKNzFmWWpJTEhBZVVtZWUxN3NsVllWaHA2?=
 =?utf-8?B?YzEzU0Nxd0RhVnEvamEzQlJHdFQ5SHBKWlNBc09NYU40bEJsOHdqaEUrZDho?=
 =?utf-8?B?K0RiYXhRcCtEYTNqNGZuUkIzUkJBSTVZeUhsYTMvNGFOMW8xZVNub0ZCSTFj?=
 =?utf-8?B?eG93OXFmbktwdU5pT3IvYUg4NEVwV2JCUk4wMWZXUzNCVnFPQkw4NGU5V05B?=
 =?utf-8?B?SWhFV2Z5a1hOOGpTYml3eFhGV3RNTDlVR1ZLbmJzMVZmcXZUVlplYnNXc04z?=
 =?utf-8?B?dm8xM1ZEK3p1M0d5UUw3bXJ5VFNCL0dlOUE0ZUdyOXpMRG53QzdjNnJuS2c5?=
 =?utf-8?B?NURlcldSR2hYMkgrOURxakpVZ25FTHI3THNXbXAvRFBJSDB3enBIYlMxM200?=
 =?utf-8?B?R2hKVk5xbDlrNUsveFJoNXFvUHFCZ1FsZnZOaCtXOUJQZ3B0Kzhsa3FCWjlm?=
 =?utf-8?B?T2taRVI4eUxCUFpVdnh3dU5UenhlN3BmOUhWVjRwRzhpaWV5c1JmNkZoU1J5?=
 =?utf-8?B?S3B2OVFTT0lYbTZCTnpkMkJkb3VjM1E4enFSSlVqcXN1a3ZkNjAwU2tHVWRx?=
 =?utf-8?B?eE5qZTZ4NUJCZVFSdjRYYW4rd2V2TzhWQm9pSWxMZGEveXNVamZFRUZ2eHZ4?=
 =?utf-8?B?MWw4ejZtZkpLai9nSnZYSUNzakFvM3hZYzNJOSsxNEdmWnB5V2RhdkN4UkpW?=
 =?utf-8?B?L2gyc0hYd2RyU2RFT3RxOWVQNE1aSThOWW5YUXlhTnlDNVpGM2xKREt1Mi8y?=
 =?utf-8?B?TzZBcElnaUZ2SG5pZS8rcWVQckN2SUd6QU8rMEJvSE4rL3NQdkYrZjBDZ3p3?=
 =?utf-8?B?OHdjZ2s4ZWhkZzRhT1BtcmI0NFFWR1JIQVRldUxKb3FkSEU5L2RpZGJMS1NQ?=
 =?utf-8?B?clZRT3NhMXJPUjJ2QW5mSnlaM0ZwVGo1Q3B0Snlrd01MUmJnVmtZdmw1N3Vk?=
 =?utf-8?B?QVBaUzJVS1RwNkl2azNkNmk0Ylh6WTBEZ2Y3MlF5Q2pYaGxtaWVEcHVZQVFK?=
 =?utf-8?B?aXNWaXBqSkJNZWFlR3diZmRNcWZBNk15ZmVmSU5HcEFXdjRWdVkwUzlaTmw5?=
 =?utf-8?B?VlZWM09lK21lUllUSncxWWVEM05jWFJpV210VXJWUFdGMTM5cjJUSHFvdjFH?=
 =?utf-8?B?WkJUc0VHMnd4a0RHWjVyMFZQZjJRV1pUYm9SUjlpdm5ibFBWbWhjbFd5b051?=
 =?utf-8?B?VlhCQk84TXByNmQrbmZYMVVIeFdacDdBYmd4enlCR2s3OTJBWHhQeXNwQmQ0?=
 =?utf-8?B?TkwxZXdETUlxNFplK2oxTytKVzVxTmYxWG5BdWFPbTAzQXhOVjlOQWM5OUx2?=
 =?utf-8?B?M01qRFdPVndBS3JTbFVFUTdIUld0ZjhWd2FHTVRxNEE2MFZFUXgzK0oyNTQr?=
 =?utf-8?B?Q2FFcnRBK0p0T1BDUU15cmJTQ0sxMGsvK1BESXEzSVA0Y2Y1aTJPZ2IzSEYx?=
 =?utf-8?B?ak9qSkhtaU9JTmRFVllPYkF3MmltdmRCSTZ5YVdHTlBRdFZWbzdOMzA5a2U1?=
 =?utf-8?B?SmFoQTZ0MkxoazF5QTZpZ0k3K2F6TlNBR3FGSkpENTJoZzgweDQxYXZJTzVl?=
 =?utf-8?B?R3owL2NreWk3QkcrMmV1Kzg0YS9JbEJ4TEcraVJjc3F3SThONjJRYklIeVh6?=
 =?utf-8?Q?pJDged39t92y3OYMpJK6xoIOj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2403c17-6fb3-48c4-bd6c-08daa79c3e4e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 13:11:12.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jl1SaxOlIke6NhBTuKNR6vjRjyYmqQpD27/SYVxVpf4tcN8R0ncWir9HclrT5/mfRFmc8OY6plYjI+eBNfHJ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9560

In an entirely different context I came across Linux commit 428e3d08574b
("KVM: x86: Fix zero iterations REP-string"), which points out that
we're still doing things wrong: For one, there's no zero-extension at
all on AMD. And then while RCX is zero-extended from 32 bits uniformly
for all string instructions on newer hardware, RSI/RDI are only for MOVS
and STOS on the systems I have access to. (On an old family 0xf system
I've further found that for REP LODS even RCX is not zero-extended.)

Fixes: 79e996a89f69 ("x86emul: correct 64-bit mode repeated string insn handling with zero count")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Partly RFC for none of this being documented anywhere (and it partly
being model specific); inquiry pending.

If I was asked, I would have claimed to have tested all string insns and
for both vendors back at the time. But pretty clearly I didn't, and
instead I did derive uniform behavior from just the MOVS and STOS
observations on just Intel hardware; I'm sorry for that.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1589,7 +1589,7 @@ static inline void put_loop_count(
         regs->r(cx) = ad_bytes == 4 ? (uint32_t)count : count;
 }
 
-#define get_rep_prefix(using_si, using_di) ({                           \
+#define get_rep_prefix(extend_si, extend_di) ({                         \
     unsigned long max_reps = 1;                                         \
     if ( rep_prefix() )                                                 \
         max_reps = get_loop_count(&_regs, ad_bytes);                    \
@@ -1597,14 +1597,14 @@ static inline void put_loop_count(
     {                                                                   \
         /*                                                              \
          * Skip the instruction if no repetitions are required, but     \
-         * zero extend involved registers first when using 32-bit       \
+         * zero extend relevant registers first when using 32-bit       \
          * addressing in 64-bit mode.                                   \
          */                                                             \
-        if ( mode_64bit() && ad_bytes == 4 )                            \
+        if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
         {                                                               \
             _regs.r(cx) = 0;                                            \
-            if ( using_si ) _regs.r(si) = _regs.esi;                    \
-            if ( using_di ) _regs.r(di) = _regs.edi;                    \
+            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
+            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
         }                                                               \
         goto complete_insn;                                             \
     }                                                                   \
@@ -4248,7 +4248,7 @@ x86_emulate(
         goto imul;
 
     case 0x6c ... 0x6d: /* ins %dx,%es:%edi */ {
-        unsigned long nr_reps = get_rep_prefix(false, true);
+        unsigned long nr_reps = get_rep_prefix(false, false);
         unsigned int port = _regs.dx;
 
         dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
@@ -4289,7 +4289,7 @@ x86_emulate(
     }
 
     case 0x6e ... 0x6f: /* outs %esi,%dx */ {
-        unsigned long nr_reps = get_rep_prefix(true, false);
+        unsigned long nr_reps = get_rep_prefix(false, false);
         unsigned int port = _regs.dx;
 
         dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
@@ -4630,7 +4630,7 @@ x86_emulate(
     case 0xa6 ... 0xa7: /* cmps */ {
         unsigned long next_eip = _regs.r(ip);
 
-        get_rep_prefix(true, true);
+        get_rep_prefix(false, false);
         src.bytes = dst.bytes = (d & ByteOp) ? 1 : op_bytes;
         if ( (rc = read_ulong(ea.mem.seg, truncate_ea(_regs.r(si)),
                               &dst.val, dst.bytes, ctxt, ops)) ||
@@ -4672,7 +4672,7 @@ x86_emulate(
     }
 
     case 0xac ... 0xad: /* lods */
-        get_rep_prefix(true, false);
+        get_rep_prefix(false, false);
         if ( (rc = read_ulong(ea.mem.seg, truncate_ea(_regs.r(si)),
                               &dst.val, dst.bytes, ctxt, ops)) != 0 )
             goto done;
@@ -4683,7 +4683,7 @@ x86_emulate(
     case 0xae ... 0xaf: /* scas */ {
         unsigned long next_eip = _regs.r(ip);
 
-        get_rep_prefix(false, true);
+        get_rep_prefix(false, false);
         if ( (rc = read_ulong(x86_seg_es, truncate_ea(_regs.r(di)),
                               &dst.val, src.bytes, ctxt, ops)) != 0 )
             goto done;



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF076F9BF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 07:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576826.903401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnpX-0002EX-3T; Fri, 04 Aug 2023 05:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576826.903401; Fri, 04 Aug 2023 05:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnpX-0002BW-0e; Fri, 04 Aug 2023 05:58:31 +0000
Received: by outflank-mailman (input) for mailman id 576826;
 Fri, 04 Aug 2023 05:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRnpV-0002BP-Il
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 05:58:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed9df163-328b-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 07:58:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8302.eurprd04.prod.outlook.com (2603:10a6:102:1ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Fri, 4 Aug
 2023 05:58:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 05:58:23 +0000
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
X-Inumbo-ID: ed9df163-328b-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfSj3zzos0U0BDsmFMgW155JOtqOPGpEkUI5cVOsRyIbipQjGH9NtBSCkJ03w9J9hf2avhDMZ6HPTP+WWTE+AO6Ivx9UykWdUw8CQg7OuUTUS1DPeptlLKcMhfPUepbOdrh0mAo/90VetAS9LwdHgfPHOv7ykIEoesaO6IKaKG5O6W9OaTWDOqj4VH3a9JF8/AEE4WFnEIgok+SzdhsOztj658zmYJdqOuCPkDuouHkiBKfpZYezqKHROMsMaimy3QkpqoFwe2Jq67PL0mgV60yDJiVhXCnFOPy6Zng/DfGbhwX4orSY0CGKkqSXuf8N3ZCsXLhEfqof6XOC7lbZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWGvK5YPHXrng9atAY5AiFGKlI+n927P1PkwtxN6LTc=;
 b=Q1sdczgXC0zWnNpU48HhBNE+IEjmQ3NmVNLidmtv622lwIK1G6f8v4ELAr+1SQEfnaItcynIemtpLDBZL1voTFtxa/tBw6tJcugA+f6uLAkfUzjhaSqUsH+/4MOBRmCCqJz53vJYx47iPYrVrFemf9ngv3rNPysUDSQWek9OUdCGriEZPARwV622CUT+7ihBoZx79Drnq67eeemgT85/Bm6lFhZCzH9+2SyLvJTvyauhTfXmRkDSln6dUxe8uOnj6nbLz0VxrYEnuT1nkaN9CaPwSJnE82md4BwNMsXEYYAo3ohsOQkaab09BSC6CSKUF8AVgZSHccVTmKmqUnOvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWGvK5YPHXrng9atAY5AiFGKlI+n927P1PkwtxN6LTc=;
 b=oB1QiqmTc9COXV0LgKxgkQRGn995HoAT0gEew0eFjqkM7dS0RsApWhAnXxkAQPTGHyHr21cXWjRxMdOKNxK4zlU7KSiR/0GMBnv2IPYLQQx1eEKnbo1BrvWKP8WRxR1LzligWFVbLWymBsDfuBk7P8/mWObv5WQxx8hhYtJaa+yQBp7ZnI0GwTtp69/FW4rnQbFjKwkudvcxQH2wgR4EH+5aLob52vqaGX44gxbGrh01YQDk5GzER2WSFJCTF0B0pXo7Iw9YD2XF4jXWeLpRwozvM/h7C0W+jdB1vtEmeHdaasi9LPPLp22qd4zApwHJyaubnjUtfnldKIVwoWBVgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e81cf29-65fd-74fc-db4f-95c453acc327@suse.com>
Date: Fri, 4 Aug 2023 07:58:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86emul: further correct 64-bit mode zero count repeated
 string insn handling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7e4dda-d52c-4a67-4aa5-08db94afd02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dgd6Iwqg21VuaIzpHpEaU5DJQXhejNItHVdtBPOtCNpVF2DrQrGIila4YJ4ccpokTojVfZ8VTOaej0DJBb0vWY7fLv1VRKUy8l8LUx+K7NmM42AbsAwWYcWDiAGbNJ6rHFGHvM8e1+ZHZbCY9PVMvBIuYc6z58JyOGSBf3ob78E0/w+k7p2dAiiuhwvQh1rwt1msFZ3aVXF3kbyAbOiGyVCzqMSq4KiZymC+3P1vjmvCE/rrHAa/+BUDBNf7fvLUX2/g0FQpbkIo/8GhrcubzchH0siPoqvdMA/uUwDgg8cXAOA6x8whwlCrZywXV+tXSvvrRB5OCAUtZZlCJENN0msTi6XwKhi+n+7XUQV1T/YznLNuhAFmMu9QXIFlKb6Tud81mRNSGx9Su9VH5m/l8ZLHvURWgP/bHXyeJ5w4kD14G9vXkE6G304NJv0GkXUvouuGw1QfcAlhz3N5iQD9ssEwNFW0C3k7C2Dbrxdr3oOOi8jrL2NbPAKOQpOOvi7aFu8w9rezKoWfFl2EIOUgmHbPHvE0EdNGPvpaKx7S1kNNLOAqzm16h76kd0IrW3Zy5YhLWELJhnfrrkTau1Dca85PfRKitWtHZHyS38B6wMGu1HxKqFaJVQdxhyfSRR/JqVUeOC5BeziChh9AKlTk5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199021)(1800799003)(186006)(86362001)(478600001)(2616005)(54906003)(36756003)(6512007)(316002)(26005)(66946007)(66556008)(6916009)(66476007)(38100700002)(6486002)(4326008)(31696002)(6506007)(41300700001)(8936002)(8676002)(31686004)(83380400001)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVJacjlCNk95NHlvdFhKT0F3Q0VpcjhKVzhDUFJiRzRoY0pNQ2tpOHl5aTFq?=
 =?utf-8?B?YlBhbGF0eUt3OFZ4VzlkZXpNeUZVVTJLZHR2S1dndi9mbHZNYmdVTncwRTFh?=
 =?utf-8?B?RnkyN2htUnNqY3VaNGlFblNoRUxBYUxNeEhjb2IzTzRaUFZLVWZxcUkzVi9u?=
 =?utf-8?B?Y2tWSUNIV2MveXNEU3A3bE1RZ3lNUFByZFBDaStNSWVrMFlrc08xRisvVDFG?=
 =?utf-8?B?Y3pkYS92RCtWdVZtWkVzSTBKN2VvMGFucllKQVZsNmdNdFB0ZUpkR00vNlNL?=
 =?utf-8?B?aStXRkNwNFJ0eU9JSE8xcmJrOUs0bDlZNnlUYWpKMFNDYU94aHFkK0dNcVhS?=
 =?utf-8?B?QjNPdTdYYngrREZOSkpmWlJhUFNOamt0RDVha1MwNVYyRXhHenE1YXE2a0V1?=
 =?utf-8?B?WFJwMkNXd3BvY2ovMlZrNGhPTlZzOVM3UklXc2VkbmRpRU5kc3ZBZDRQM3po?=
 =?utf-8?B?L2NPTW92NnVKRThTSEdwamR6UmlTRnRKWFZQY3Y0WlZFV3hZYW0rYzFBYm4w?=
 =?utf-8?B?UHh2RG5ycUdiMVQwbGZzWndnaFFiYm5OME90aWppN2dmTnVkMGxYUTlSTnRR?=
 =?utf-8?B?VGhCMU5kQVdvSkdaMU1zMFdSc1lCRG1FMTgrSThmYnBpakUwS0ZxSFJiN1F1?=
 =?utf-8?B?dVhtYkVtc3VOQmZZaldqZm1WNW1RMm9vQzhxbFNLSGlRMURDMjdaT1k4L2VU?=
 =?utf-8?B?Q1BybytTam5qYy9RQnR0NzFsLzNWMnpETWkwcTl0SE8waDBRV3RteFQ5SlNw?=
 =?utf-8?B?NWo5V0w5L2VMUUNGZGZWWWtHa3RKT1I3dXhQUkFkNGxWL0tDYWlvT3B0VWtB?=
 =?utf-8?B?aFZBSmFnQ2dja3hTb05qU09vd3BCYVlrdmFKcXV2SGcwN0E4QXdYRmNSNW1t?=
 =?utf-8?B?RkNOSnFIU3NHaTNZN2lNc2lYbVBiLzNlNXJSYVRST2llTTJTcHc5cmNUUnVD?=
 =?utf-8?B?VG5yYWtERFlZbmxqaUpuRlF4L1lsRDhmWGxubXZNcFFFTFcxVDVPOGJ4N01o?=
 =?utf-8?B?RWlFVytLaUtMN2J5dnNkaE1EcDZRVG8zblpaQmYrOXErYXNpM0R5eXhraVFJ?=
 =?utf-8?B?Zmt6c2gveWlyM2QxY0FwdDRObFhhZWxnWnY5SHlEOC90R1hScjkrVXkzbGdt?=
 =?utf-8?B?NXd4ZUQ5QS9yUFJyQkRwOFNMR1l4UU5OKzVKeVQ4RTVLTkUyS3I5YnZWdVMr?=
 =?utf-8?B?N3BFSWIzVGRIRXBHWlg0V3didG5kZDVkOEFBdTBoZXhxMFVXaXFyVXY2Q3F1?=
 =?utf-8?B?bnZxUUFONzFzVzlvbHdmQmFCNDJlaFlBZkl1TVNDK21TNlhBYzR0UmEvTnNX?=
 =?utf-8?B?R0pPNkgvTE1wbTM1NlErNGE5d0NMSEQ4RmdrTHJsN1czSTBnbDFkSjBQb296?=
 =?utf-8?B?L3RZWDQyUG9QWnUvZ2kxNmk5VWo4ZjkvcVFNMnowNHorOXZJYm41YlZoZUk3?=
 =?utf-8?B?YTVrMlZ2aDJsSGt4dk4wTWhrWGJLeXRETDQ4MEQ0ZThIa1NITXZTcDZ5OUtx?=
 =?utf-8?B?L1dTRHBBelNRZXFkQ1k2aWNhcGh1NFh4OTliVVBzQ2kzR1pDclBhcUhTK3VR?=
 =?utf-8?B?Q2djZHpyYitEa09xTXNNODFjOTZqRExiS1BtaGo2Z2Z1UHdWcXFEYWkwYWRL?=
 =?utf-8?B?b1lNSmJOQk1UWGdmOExnNFIydWpOTm9QUnlmY29ESGdYbzZxU2p5SnM4cWZZ?=
 =?utf-8?B?U1FFZlRvQUtWVnpBdVVYUjZ3TkRQYTcwV29SQjJlV3pjc3N4TTBkb0VJZ1hK?=
 =?utf-8?B?QUI5OGdrY0hwTVZxR3RMTmRsNG5lSkxyc1IwdVljUE9ndGNCUCtOOTFZUm1x?=
 =?utf-8?B?bG1MOTFpU1g5TXNUZ0M5TlZPRnRkbEtZYmdZSXpKaUJwZkVURjZFc1pRaWVJ?=
 =?utf-8?B?L1NlTnlvOEJWVTFLbXRFRlFsUmZhREdVc1M5ZnRWWncrdW9kL0Y5SmRZMkhM?=
 =?utf-8?B?cEpYZkF5aFEzYjhVVUo5Tk03NngyNmdGSFI3djRiMThrR09QK2pVckNjazRF?=
 =?utf-8?B?QzBnNDdRMXo5bnViR3ZaaFFxY2JXOE5rMHNHb0MwWDBySExpMVhqR3dnQklY?=
 =?utf-8?B?WnZqdUdHQndqbVV4OUR1WHg2b3dVM3FISjc4UXJWWjhBVUhpMU9UUGtub1dU?=
 =?utf-8?Q?8Zg6Qilev+pqvUSzfFH/yuGE2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7e4dda-d52c-4a67-4aa5-08db94afd02d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 05:58:23.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buK9IqSUBMKcr3tWQWRHS7rE3v5k4gEa706jTlg/3JsgLUT3mhZbdVb6EMNLd1lzlogAMCwTZwjmIYCU8ZLhPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8302

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
---
v3: Re-base.
v2: Re-base over re-ordering against previously 2nd patch in a series.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -489,7 +489,7 @@ static inline void put_loop_count(
         regs->r(cx) = ad_bytes == 4 ? (uint32_t)count : count;
 }
 
-#define get_rep_prefix(using_si, using_di) ({                           \
+#define get_rep_prefix(extend_si, extend_di) ({                         \
     unsigned long max_reps = 1;                                         \
     if ( rep_prefix() )                                                 \
         max_reps = get_loop_count(&_regs, ad_bytes);                    \
@@ -497,14 +497,14 @@ static inline void put_loop_count(
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
-            if ( using_si ) _regs.r(si) = (uint32_t)_regs.r(si);        \
-            if ( using_di ) _regs.r(di) = (uint32_t)_regs.r(di);        \
+            if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);       \
+            if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);       \
         }                                                               \
         goto complete_insn;                                             \
     }                                                                   \
@@ -1775,7 +1775,7 @@ x86_emulate(
         dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
         if ( (rc = ioport_access_check(port, dst.bytes, ctxt, ops)) != 0 )
             goto done;
-        nr_reps = get_rep_prefix(false, true);
+        nr_reps = get_rep_prefix(false, false);
         dst.mem.off = truncate_ea_and_reps(_regs.r(di), nr_reps, dst.bytes);
         dst.mem.seg = x86_seg_es;
         /* Try the presumably most efficient approach first. */
@@ -1817,7 +1817,7 @@ x86_emulate(
         dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
         if ( (rc = ioport_access_check(port, dst.bytes, ctxt, ops)) != 0 )
             goto done;
-        nr_reps = get_rep_prefix(true, false);
+        nr_reps = get_rep_prefix(false, false);
         ea.mem.off = truncate_ea_and_reps(_regs.r(si), nr_reps, dst.bytes);
         /* Try the presumably most efficient approach first. */
         if ( !ops->rep_outs )
@@ -2154,7 +2154,7 @@ x86_emulate(
     case 0xa6 ... 0xa7: /* cmps */ {
         unsigned long next_eip = _regs.r(ip);
 
-        get_rep_prefix(true, true);
+        get_rep_prefix(false, false);
         src.bytes = dst.bytes = (d & ByteOp) ? 1 : op_bytes;
         if ( (rc = read_ulong(ea.mem.seg, truncate_ea(_regs.r(si)),
                               &dst.val, dst.bytes, ctxt, ops)) ||
@@ -2196,7 +2196,7 @@ x86_emulate(
     }
 
     case 0xac ... 0xad: /* lods */
-        get_rep_prefix(true, false);
+        get_rep_prefix(false, false);
         if ( (rc = read_ulong(ea.mem.seg, truncate_ea(_regs.r(si)),
                               &dst.val, dst.bytes, ctxt, ops)) != 0 )
             goto done;
@@ -2207,7 +2207,7 @@ x86_emulate(
     case 0xae ... 0xaf: /* scas */ {
         unsigned long next_eip = _regs.r(ip);
 
-        get_rep_prefix(false, true);
+        get_rep_prefix(false, false);
         if ( (rc = read_ulong(x86_seg_es, truncate_ea(_regs.r(di)),
                               &dst.val, src.bytes, ctxt, ops)) != 0 )
             goto done;


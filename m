Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38216D65C2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517913.803902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji0R-0000SJ-Ow; Tue, 04 Apr 2023 14:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517913.803902; Tue, 04 Apr 2023 14:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji0R-0000Q6-M6; Tue, 04 Apr 2023 14:51:31 +0000
Received: by outflank-mailman (input) for mailman id 517913;
 Tue, 04 Apr 2023 14:51:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pji0Q-0000Q0-MV
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:51:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e687569-d2f8-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 16:51:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB9979.eurprd04.prod.outlook.com (2603:10a6:800:1da::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:51:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:51:28 +0000
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
X-Inumbo-ID: 2e687569-d2f8-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XANcl+4tlrwBoTsvD4ro7L547vtHaE+az1sGOkY/hrFadqxBtXZkvrZCC/jz6BXakZ6cu7AUFEs0i16TgCKVtvMr1mgj7DCLuz2Z/Hty859M0y5ybeqP1dZrj/2BnOvq3XTMHrlkkjenbnzpR9j2Ria5AO2aWKeVIcXAlu0qQQzuUMoi4O75KdVavZKxTK8GnEhAPALDy3i5iH4PqBf0ci1lJXtZxi4U6iTwl2u9ZXgzaYFewQ6x07rjvnAcgGJ9+jmTaHmoPU+4RJcjCbN9dtt1PtjIezmiPrL0C6uqZ54s/T+CuCCeyMNNOsZWIoiN7DVr+tVvAqHle/1lQxA/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoN5/J1wcWGoWrTfKMxsXC6epsaN4Cagva4IJnTZ3rI=;
 b=Kit+0++cgohLU6r5aI7YpsOx4hEl9AOJMOZ7R5o/ex5zt7ZeQpXLvm/zQv0G4v1N51Q7mwZBnwrcB+bx0MGwXhzEqFmlMt+hAYrCGvHy1G4L7CVNYo6Q3JTniVYAQqxMcSUzG0Zt0Z2NaI2hflxuGkYDLn46ynm4B+dRp6sifDyEEXCYEXWf9qfE5JRNBLJcFvbSbz5/QLi31CdiPsIeIgDW6ruoSx/MRZ2cD4dPBNL4TRV7X4zJpREnnu3Uodf7z6lb2srNzXMXMOa8AdhhBzbEUmTVdcum/Iyg5mOa/rniVbbEx3rpE8GqwI1/fITzlphHN9ftYS0CYfxoLadhDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoN5/J1wcWGoWrTfKMxsXC6epsaN4Cagva4IJnTZ3rI=;
 b=LQnFx00uCEIVsIM9lGKLXcHwic0V8q1JPW4C9g3tBt7uUwoxzZ33EQnJpWc3fUT23iCBcrGo8WrgZoKbt1e8xUBsEyQs4JS+eTWD6+lrfh7Kk87uZYisugXeXpJy7HqFhNq7eHQlPnthxxLMe8PpcuR7D+PCIAtJql48Wd8pwRxJM7unnS+CfyK6gdjW0s9ofJga1eBVSxskbduvrQhitwQfH8QmBE3YjvgdZdIHkCHxgW0ryxFddy9sJDVrU9DgFvklZGaQY+n6mDe9YORc+aGBucM6AdO0SdeRtn3II/9H4EAV7NYiRYE5JmvqiExY0BkKKZ4TSX0nxVxbvhTH/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf5580db-3573-ec73-9e59-61aee337b2c6@suse.com>
Date: Tue, 4 Apr 2023 16:51:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 3/9] x86emul: drop regs field from emulator state structure
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB9979:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc72461-e753-4fb9-92a7-08db351c1204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+i+O0wDRCs1crW0KniaW9fvWic7mfNcpD/5r6FOdWEqHExEkTjPNd+v7NWom4d0yhaawNWpSc/tyTLYN5c52pMSX+MWejYkNXG16t5g+V0eIuwNgA6RS0w3KPTaFX6YT+Ld6+dZ7hleyfJnFydVJKN4nBr5bM6g8oznX31lRfQPwX4ZE0Zl+AOC72aI6v8QXVsE/6eUg6bPre2zWtB+wFtdGWzn93eBXSGt44qKWq1KRnZDvjIgjbV8yYPG3y41OUzBAsiN1AVs/6ux4XV4eAq9+zVqNk5lPjkPmG+xM0B51VYOjwYwX7DG09EZ8xcCtkubXi8/mh72zt62a/Rl9QwnD/0/2jYFoVND6m+wgX+H5xBXr0kfM6u2MXV4S/mP2YOiqHDkMtHWyh2VnsKFtfKIFlcPal8U/9zmzyuRqjNZLUa7ja41GXATlQjescI1Ya65LbJxNPYIr4RLhup8sbXPuyz8IT+EtQnUw2Wbq0838Ri3lhkgK0B76yTbxRLVWblLbw3ZyHbjUBPlga1/ReyRcpdZcghtKfbdMCCN3YG3lVtnZYP6WMMO2l6pg7oWfDQsN4MciuW/yJ1rQgKoiGF7IKqrzCrH4tpFCJB9sm4Pn2ooVRHwssXD1wusmMWlLLphm6CDZ8sTjk5arO6P8wOMzDKpj8zZoE/WeUu85mKj8iJdnXbT5VOq2k8IWCmoe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(366004)(39850400004)(451199021)(2616005)(6486002)(6506007)(316002)(6512007)(478600001)(54906003)(2906002)(26005)(6666004)(186003)(5660300002)(38100700002)(66946007)(66556008)(66476007)(41300700001)(86362001)(8676002)(31696002)(8936002)(6916009)(4326008)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXBHWUk1NTdlN0c4Y2h0ZndzK2x3TDcyYnFnU0x0L3YvblZsVnJPc2M3TTVo?=
 =?utf-8?B?YndCV0tVQ0VDVlBpVStFUXZMb0UzOXNvUDhubjBhTU1zeEdpWUp5UlZHeVF1?=
 =?utf-8?B?bi8zSzdqMFkwcjI4azhwVXAzOTNIRVg3cWZMSE4rNlJuN0xVOG41TkY2Rk5t?=
 =?utf-8?B?WnUwMS9zOC9pcDRhd3dUYWMyTE5PS3IrR3cxckhmUUJsT1lvRi9CZkJ4Q3Zm?=
 =?utf-8?B?QSthNEgrU3NCOUNuVWsvNk55UDgrbk91TmRGQ0xrcDdUdDRrN2lXdFBvSy9X?=
 =?utf-8?B?aVdackMvM2ZUSkc2OTFqcnZrSFkvMExkYnRDbVFweitPYXBpc0s2WklRczFR?=
 =?utf-8?B?WVJWV3U5ODdhRzZHckc1TkRCeGRid1Bwb09HZUZURGFmZ254cHlvZ1l3eGlJ?=
 =?utf-8?B?NHhWTGlmN1pHMTU1cWpTZ1NtV0FzV0l0VDMvMko4UGQwc0xhOXJjU1gyL3pN?=
 =?utf-8?B?enBGSFBpUE04QWtNQVZ5SjlLTFEzR1NxaHhuMU11QUlBRDZBVWVSN2d2R0lQ?=
 =?utf-8?B?ZUg2WDNoc0t5SU15U3RXeGp2cnJRRnV5Ni9zdUhHbjNtRlFQTWNHRmd6WmR6?=
 =?utf-8?B?WU1NSXZGNVNHTGUwTUJLZ0FsTUpVTGdIVFRsMlNhS1BKYnlhVlhoY3ZjOE0v?=
 =?utf-8?B?RklsTFlqUE9qU0xTVlFIZ1BSL01ENWZKVWV0RW1oUDRBTkxHUUU4MGdPVGNZ?=
 =?utf-8?B?VXhUalRwTnZJRjVxYzFuZEIvQWxEdkR2SHo1dTZQZ3R1NnRaWVZ6bnR0TDFT?=
 =?utf-8?B?VVZGeks0RElHRjh5S2FWQU5IU05BRTNNV3JNWGlqdnNoVFBkdTRxSnhjMGMw?=
 =?utf-8?B?MFlFVGpVZ0ZVRk5PUVF2N2NKK0Z3V0NXanlQRHN1Rk5qMHZoOHF1RE92bGp5?=
 =?utf-8?B?S1NLbnVoT2NlSy83ODdZY3FZVnZFdjU5ckVERTYxMWV1MHVid0lNNko3NEg0?=
 =?utf-8?B?Y3ZuUnRGM2pid210K0Zaa1N5eU81L2lFdWpGVjF4WEdveHhFVUJuQjY3YnJI?=
 =?utf-8?B?RWZ2aUZZS29FTmM2WVNmWWVuOU5aVmVBSkJyQWp1YTBVa2ZzUTZ1LzNtVkgv?=
 =?utf-8?B?Q3QxZmw3ZzRFem53NDBLZXFTaFFJVm9hSWlqV1pXbTNyVDc2TEt3MSthbXBt?=
 =?utf-8?B?T2VWeVpwY21JZDkwcVI2SDE3djlRb2JaUWtJbkhPZklVcWgwRC94MlBGb1cy?=
 =?utf-8?B?UUEzaDR2djNMaWxibkJxZVJ6VDJZNDloUzVzM2NSNi9aYVFQOFNqK1BoRUxt?=
 =?utf-8?B?YXZrVnFZcXpmdDBzSXNBNGo0OXdhMWY5NjF5WkF2aFNoL1FoY1NFc2lhc2pq?=
 =?utf-8?B?YW9kdmRETnhmaVpJRzNOb2NjM1RaYTJjSUhRdTlWaHdEN1BmeS8xVDJqeUJx?=
 =?utf-8?B?R25YeHpNSTVKT0lPcVlNQW4zYk1od051Sy9jcFV1ank1Z0VrTzZhcmxnQ0gx?=
 =?utf-8?B?RGtWdUtsL29ZeHBwcit0M0ZwM1pOT2ZqaEdNVlVRQmpGdEJVT1BJbmErNVZT?=
 =?utf-8?B?QkhtZE1EMkUrS1NIeU1RRlExWUgxZTJuWWhhOTVjaDdvbjJCazhIV0FXWnln?=
 =?utf-8?B?cHhIZnZuQlpIZUJkaGxYMklDQ0kyWXhqVGl6Q0dER3hDWHFRUTNDZ1FWTWlW?=
 =?utf-8?B?WjNncXZDemtNanRTTXllYStraUhjdCs3bDc1L3BOZGtVRmlORmorZUlLczB1?=
 =?utf-8?B?dk5kTk80Q0ZicDJrendhZXhiUWNEalNyUW9vaHJENjViTExDaHBFdlVEbHdM?=
 =?utf-8?B?UjAwYzhoRGVLU1V3OG0vZElCSlR3UTZ3dG9jRDRJSUNKenVSZ0VGbE1VV2NZ?=
 =?utf-8?B?Tzh6Mm1STWNtS0Q5OEUvYWhpMUxQbzU0ZDhHZUNoYXRZU3J4UWpVRlNtbG56?=
 =?utf-8?B?Tmh4K2Q1Y3BKREdFK3lyMnNUeE83dERJa2o2TFRsSDRwK1AvcVpWNlZ1dS83?=
 =?utf-8?B?MGxTc3pHdXFSdjRHczlCb0wyYWZhUkJTK0lqZFNIL0Nvb244cUtadnRaQTJi?=
 =?utf-8?B?YVJubnVFaFZmSnRUc3gyUVM3WUsrWTFLZmtRN2JGMWZ3Z2RxVXZXSU51Vzdi?=
 =?utf-8?B?SXEvdW9ZSHBxbmk1bHFJemdtU1d5T3Rrc0JHaURUWmljRXE4UnkwNzVqQXBK?=
 =?utf-8?Q?geUtSPpQsDwSsOmrbrBJ1d5Zq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc72461-e753-4fb9-92a7-08db351c1204
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:51:28.2371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2LtRZdsAfE8Y0Vt+/qcG366+tWsmoMtZEMrlP2JlydSqXLFpnf9wu4csyY9Y/BJ7h/uIhdZXQUgIvOphrq6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9979

For an unclear reason 0552a8cfda43 ("x86emul: track only rIP in emulator
state") converted the original struct cpu_user_regs instance to a
pointer, rather than dropping the field altogether: The pointer merely
aliases the one in the context structure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1013,7 +1013,6 @@ int x86emul_decode(struct x86_emulate_st
     s->ea.type = OP_NONE;
     s->ea.mem.seg = x86_seg_ds;
     s->ea.reg = PTR_POISON;
-    s->regs = ctxt->regs;
     s->ip = ctxt->regs->r(ip);
 
     s->op_bytes = def_op_bytes = ad_bytes = def_ad_bytes =
@@ -1129,7 +1128,7 @@ int x86emul_decode(struct x86_emulate_st
             default:
                 BUG(); /* Shouldn't be possible. */
             case 2:
-                if ( s->regs->eflags & X86_EFLAGS_VM )
+                if ( ctxt->regs->eflags & X86_EFLAGS_VM )
                     break;
                 /* fall through */
             case 4:
@@ -1458,33 +1457,33 @@ int x86emul_decode(struct x86_emulate_st
             switch ( s->modrm_rm )
             {
             case 0:
-                s->ea.mem.off = s->regs->bx + s->regs->si;
+                s->ea.mem.off = ctxt->regs->bx + ctxt->regs->si;
                 break;
             case 1:
-                s->ea.mem.off = s->regs->bx + s->regs->di;
+                s->ea.mem.off = ctxt->regs->bx + ctxt->regs->di;
                 break;
             case 2:
                 s->ea.mem.seg = x86_seg_ss;
-                s->ea.mem.off = s->regs->bp + s->regs->si;
+                s->ea.mem.off = ctxt->regs->bp + ctxt->regs->si;
                 break;
             case 3:
                 s->ea.mem.seg = x86_seg_ss;
-                s->ea.mem.off = s->regs->bp + s->regs->di;
+                s->ea.mem.off = ctxt->regs->bp + ctxt->regs->di;
                 break;
             case 4:
-                s->ea.mem.off = s->regs->si;
+                s->ea.mem.off = ctxt->regs->si;
                 break;
             case 5:
-                s->ea.mem.off = s->regs->di;
+                s->ea.mem.off = ctxt->regs->di;
                 break;
             case 6:
                 if ( s->modrm_mod == 0 )
                     break;
                 s->ea.mem.seg = x86_seg_ss;
-                s->ea.mem.off = s->regs->bp;
+                s->ea.mem.off = ctxt->regs->bp;
                 break;
             case 7:
-                s->ea.mem.off = s->regs->bx;
+                s->ea.mem.off = ctxt->regs->bx;
                 break;
             }
             switch ( s->modrm_mod )
@@ -1517,7 +1516,7 @@ int x86emul_decode(struct x86_emulate_st
                                      !s->evex.RX) << 4;
                 else if ( s->sib_index != 4 )
                 {
-                    s->ea.mem.off = *decode_gpr(s->regs, s->sib_index);
+                    s->ea.mem.off = *decode_gpr(ctxt->regs, s->sib_index);
                     s->ea.mem.off <<= s->sib_scale;
                 }
                 if ( (s->modrm_mod == 0) && ((sib_base & 7) == 5) )
@@ -1525,7 +1524,7 @@ int x86emul_decode(struct x86_emulate_st
                 else if ( sib_base == 4 )
                 {
                     s->ea.mem.seg  = x86_seg_ss;
-                    s->ea.mem.off += s->regs->r(sp);
+                    s->ea.mem.off += ctxt->regs->r(sp);
                     if ( !s->ext && (b == 0x8f) )
                         /* POP <rm> computes its EA post increment. */
                         s->ea.mem.off += ((mode_64bit() && (s->op_bytes == 4))
@@ -1534,16 +1533,16 @@ int x86emul_decode(struct x86_emulate_st
                 else if ( sib_base == 5 )
                 {
                     s->ea.mem.seg  = x86_seg_ss;
-                    s->ea.mem.off += s->regs->r(bp);
+                    s->ea.mem.off += ctxt->regs->r(bp);
                 }
                 else
-                    s->ea.mem.off += *decode_gpr(s->regs, sib_base);
+                    s->ea.mem.off += *decode_gpr(ctxt->regs, sib_base);
             }
             else
             {
                 generate_exception_if(d & vSIB, X86_EXC_UD);
                 s->modrm_rm |= (s->rex_prefix & 1) << 3;
-                s->ea.mem.off = *decode_gpr(s->regs, s->modrm_rm);
+                s->ea.mem.off = *decode_gpr(ctxt->regs, s->modrm_rm);
                 if ( (s->modrm_rm == 5) && (s->modrm_mod != 0) )
                     s->ea.mem.seg = x86_seg_ss;
             }
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -321,7 +321,6 @@ struct x86_emulate_state {
 #define imm2 ea.orig_val
 
     unsigned long ip;
-    struct cpu_user_regs *regs;
 
 #ifndef NDEBUG
     /*



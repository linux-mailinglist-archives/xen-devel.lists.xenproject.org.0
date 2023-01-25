Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5D67B5DC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 16:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484432.751011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhgA-0001eA-4X; Wed, 25 Jan 2023 15:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484432.751011; Wed, 25 Jan 2023 15:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhgA-0001cT-1U; Wed, 25 Jan 2023 15:27:14 +0000
Received: by outflank-mailman (input) for mailman id 484432;
 Wed, 25 Jan 2023 15:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKhg9-0008PB-BK
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 15:27:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc73d8e7-9cc4-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 16:27:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:27:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 15:27:08 +0000
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
X-Inumbo-ID: bc73d8e7-9cc4-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmrsoaMcuaqEvysV4AVdeOJZhpbqg4/Wm77DCxX8k7qFrUudr3j0eWi8H7H6nodf+kvODhQsoF4JlM9U4ZkkV6kqw7iKraffDW+xBzk56jzF5z1JXPkzLUK29aaavnyJZ2JKimhq98e2KGhwz3RcHXDDDqJOqAytpFp2sVzF2x8tp0cpSWiWX+dkoolUIJFpuuoGRPzzcHfC5U1X+3ig0zUjtrnXMevGy2zsGIoF1o9MVfWJHFTg3hr9RXVYGJRGk9NAtZ18pSPS1u7JvqxMwOy0dp9+N1O5agWgJIBFEw7V79xVbsLjC4JMfjq2cKKtCo1GRUPiGVk8kh/w+S/iFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPkRfwew94fNX+zunfbWzw+IG6xaC8yyVufkSJVeAIQ=;
 b=V5FJQnfdXphepJF44Tn1IE7c8gG5SWAnNgWCqfha7qxuTffv2Jf33tbZ0aFqiSjwVbPRonNpBQeaIqckfqL9eb7u/ElCojlm4eoxSvSJEk6kCgDYAm/LDAI2+hIBL5JhAjqLWPmHJaQwUnzjUzb0IUEs24zMeDrylZsSCiBgqtKoc1gHjzrPohZYli0FrWz8ET5LnIZfXStB/5TXFim3fD6Wx/Mt9e2lqtLvi6dDUd+irNhuo6W8zbro8UNU4msBrAWUU3knZOveqdl3tyvnNUzPaHSiVMRxEuOPbVrvp4uBkIgkmCOCEX9szlCyfCUqlpvuLITQQbMdjklDpfDvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPkRfwew94fNX+zunfbWzw+IG6xaC8yyVufkSJVeAIQ=;
 b=D5FmR54IefBLJmFMWH4qi+4qs+2q4u03PaRumYGktJMimE8YIEr8QNLVkNuY8z13MdLoj84CNlWe0MuRQuJa370x/bPNF55u4kfb5w4e18WooTMz9ku+pOanxfLVZr2UUHGqnTI6Uw2796PI6tsMCerDlzlePq5LDr/u7xExkTrYrInq0p0qyt4nJgc6ZF5A+VvdPqc1dxblc+49SRy1H+mOUaoV3cPfCQaM7gA3bgO9HaXIcmYgTpGWLG9drixMC81YprLfB4P5ssgD8ULPkL7mK8DshdAoigjmROC+337snxzzykRrHNeZRehfvYEXAsOK9v1Gon53BMq8/CyeoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33cf5bff-4d74-c5f5-0c2b-d773d10f2fb2@suse.com>
Date: Wed, 25 Jan 2023 16:27:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v3 4/4] x86/PV: issue branch prediction barrier when switching
 64-bit guest to kernel mode
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
In-Reply-To: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 1287c27f-06d8-4f7c-a238-08dafee89ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G0Xo+7iaaXzwQMF1BPJIZBnW9erBhL/AHcPCtqSTQ3RfFdUZTG52YuFX1WE9JqtMrrsk2rT31GHzXmnA0HYktdzZIYh3JP3sdQwyc8LMUiosx6hMG8uepWUJfjjFjn1lleQ4jHMHdsLKPl5rht4nFL8QVgBbjRukJVowl1XE8Z54gzAau2GawC61W0uF7JQvDDFjc6Raf53YvmdTYOGIYd7wieWRyJAFGcRd9afPZS1cnARZ1zRMu9xWxv/Cc18kxf2Q+9Zj9wDucFpaHCeMb/4Jh4GjXUtQyOTyROIscPCTGKktcnojt4+z1akPnWAlDxAM9ndT+e9LM0bFUxPYDGfJTlQHgnX5NVEdHjPU8IbgV6nniO5iq5ArsWFI9DqPWa28r7aS4GISogIBUy/BVGbngJM1vLr1OJduJ6bImOAz8zmZQC1KzDujhtubOKGl71wxYaV6m2R+GTEEfjY9IO+nxXBZDNzpxkFg70KlxEDVyVtZUigwvHFsZA65XKCULD5DGs0iLsJD7xTmMmCqpiy9vMWqhk20HLwp/poc33T182lnev2LVQijvAu/XIRMU5E8S0TPU45FLOpodwRSRgEim9u+b15bKNijs+fu3XuW3IMHvLgwL+GSNcR2iJFzjRdTGwxS87F76G5MRzwHgsddT4AoOcW5JumTk3w4OzgQL1TeD6XFAw9i33ZIXiJAmsxQYRjBFAU07ZC71e0VAhq0AJ0HxjXUXdB91UEthV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199018)(36756003)(86362001)(2906002)(4326008)(2616005)(83380400001)(8936002)(5660300002)(66476007)(31696002)(316002)(478600001)(6486002)(6512007)(31686004)(186003)(8676002)(6916009)(26005)(6506007)(38100700002)(66946007)(54906003)(66556008)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUhpQ1NEZnhQT2N0enFSUEFUTVRxcGROZmFUUmdRN094ZXNORzBZWWpHdFpJ?=
 =?utf-8?B?WFJDWnVtS2RaNG1uK3VzMk9RUHdSR1RnYUJxZXBXUUNNMGdoS3hvTFl4WEFj?=
 =?utf-8?B?ZXVRQlAwOFF6WlRvRjZnaE9USXFMUmpIdUNTelJDRU80dDFVUEVuUGViK3pE?=
 =?utf-8?B?eEZQTGVLcHpXbWc4d295V2JrK1ZBYkpHOHhUL0JpZC9abGU1dmZpRVU2SzF3?=
 =?utf-8?B?MEJLL1ZJQlg4OXBxTzBScm9oanFlN2hDbGtGV1A0MVlFTEgxK25oVkEzeWs0?=
 =?utf-8?B?eVdyeXEzMUNURVNDRGtMc1Rkc1RSQkFxTG9KTTZ5UXFlMU5UeWZ5UmJmUm9l?=
 =?utf-8?B?N3BsakVGRm03SkdRZG1FNzdDUFpNZ2JqUWd5RnRVdWJuZjZqL0NHZmE4YlQz?=
 =?utf-8?B?NkYrUGZvMUJBdk1NZHd5dUxPQ3RVd2MwaDVKRXR4dWNqVFRBQlVQOWY4TXk4?=
 =?utf-8?B?TFFlM0E1VkFFeFN5OFFPZ3Q2Rjh5aWI4N0FOYTA3Rm9jUm53OVNyZWo4OWRk?=
 =?utf-8?B?SEVMUmZLckFGWUxTeGUraVl0SFA2Q3pWV2I1dit2Kzh1cFd0bjBWNUZYYUNR?=
 =?utf-8?B?QVN5Z0JhQ0t6Mlh2ekw5T3RoM2hIWFQxRFhtWm9SSXllVmpOZmlZMWhmc09K?=
 =?utf-8?B?WG5HWnhhMUlFT0NlS1NVdE03TjZpVjZUQ203RkVaOXhnTUUxRGVLcnVWd0VF?=
 =?utf-8?B?Um4wbENtMVlFdXZEQ29mUTh2Rk96d00yRWNxRVZqTGFtTktoK2JPZDVManZZ?=
 =?utf-8?B?UE95ZEN5b3UzZisxdVJGYWd6WnNOQWc5MjdxbS84YkcyalNkMCsvRy8yeVZa?=
 =?utf-8?B?aHV3NFBBdExmSVZOYjQ4SW5ZRjFKeGJzSnQrZjBMVGF6QkJKMU00TDQ5YWtw?=
 =?utf-8?B?Q2ozbkJsVzdFdnhiWTQ0YTdUR05lcytIeld2cSs1Y3BmKzJOK002TGMwZmVs?=
 =?utf-8?B?M2djU2YyQXRsMEsxQTF4ZkFaRjNJLzFETmlwOFNZaXlWVTEzaFdxOVJoYjJa?=
 =?utf-8?B?bzU1NTU4VmZva3owUUVTS0pBckFjbGxVZHVPS0FlckoyNEVwUGNlNHBqNXZR?=
 =?utf-8?B?YnVqMTYxMzk4NklpZnFmMmk0TGJLTE4wNVZHeG9BZkdSUTUxZG53QkZLVVp4?=
 =?utf-8?B?c1JKSFdrS2pYV2c0dmNvMVlObHhFR0ZPbk5YUG8vU01YY2o4c2FXM04vdzJR?=
 =?utf-8?B?SExRWXhjdEFCN0FHa1BqaVM1ek8yMFNneWZXMlNhTmYxaUdiOFFDNmxGOVUx?=
 =?utf-8?B?ZWMwSG1pQ1hUOVdKUnJBd1lXVGRucHk5UmZnTmZBYzZpL1J5SVp2UjhFQnlI?=
 =?utf-8?B?b1hscnlqcWQwV1JINUMwenNtTFo0cHl6M1U2MzZQeE1iMTIvWTdRck9UTmZS?=
 =?utf-8?B?ZXhOV2NEWGRJY05QSjBZZUVTZUJlUEZsVmh4WkM4OS9uUUFBQmdta3dLcFRL?=
 =?utf-8?B?VG5FVHNVSjV2R3Aza0pUY0VpTm9QNEY4VDNrRCtTd1ZkWXY4cVhvbGxLeXNL?=
 =?utf-8?B?dldsSVhjQzZDYzhYM0pGWUpvaUVFOUFNeWxPbG5qZ1hGeUxDTkN1aWcwOE5x?=
 =?utf-8?B?b0FjYzhXV3lvYzIvalM0cjNzdUczT1JSREgzZVM5Z1ZtOUNlbzJ6ay9UZFNl?=
 =?utf-8?B?Yks5Smgyd1NUN2NtdFFYNTdIY1pLbFRyL25uWEdrSXNXdmdEZjVYaFNIWi9S?=
 =?utf-8?B?R1lvOHNwdElJUEIyT29YMm5jRjFjNVgwT2RrWEVTMjZuY2k5c3pQTDM5bUVU?=
 =?utf-8?B?MDN3eXBzenI0VDhjcmlMNkpndFRDZmR3Tkxwd1dSa1lXaG83NEI4V3V0dVhM?=
 =?utf-8?B?c3RiZUpVVjFpK0E5aCtBSmdIWEF6ZnhhWUpoQ2UxMnhpR1dFTG5Wci9BdU81?=
 =?utf-8?B?VDBZWVVYZkZFaFFSVlRjYThCYzdQTzM4UHpyQ1FveFFPVnl3SHNSeWNKdUdl?=
 =?utf-8?B?K3psdmdKYWMvL1JVenFCSnlhd2ZHSGhKQ0w5eXNiNkZTS0JpbTVQaWdjVDc2?=
 =?utf-8?B?c3RlQ3BDUTVORnRUVWFNbFBLTTFCcjM0azh0c1JTUU13ZlUrYm96U2dFY0NG?=
 =?utf-8?B?TkowZUUwWHpvVTdjYVZVa1RiYVoyUmxlMEhacUpaOW9IRFJWSCsyT0hxclc3?=
 =?utf-8?Q?TOtHAnN+D421NM3pGjigj6Rtt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1287c27f-06d8-4f7c-a238-08dafee89ef6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:27:08.0740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3erKZWRXGrqZ9ZEY9zj75An4uY/+PkWG0p0l4H47jHyrusBWrmdK2/QSKupPPUWgai2w/oxYu9QF+Sqrb3mcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295

Since both kernel and user mode run in ring 3, they run in the same
"predictor mode". While the kernel could take care of this itself, doing
so would be yet another item distinguishing PV from native. Additionally
we're in a much better position to issue the barrier command, and we can
save a #GP (for privileged instruction emulation) this way.

To allow to recover performance, introduce a new VM assist allowing the
guest kernel to suppress this barrier. Make availability of the assist
dependent upon the command line control, such that kernels have a way to
know whether their request actually took any effect.

Note that because of its use in PV64_VM_ASSIST_MASK, the declaration of
opt_ibpb_mode_switch can't live in asm/spec_ctrl.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Is the placement of the clearing of opt_ibpb_ctxt_switch correct in
parse_spec_ctrl()? Shouldn't it live ahead of the "disable_common"
label, as being about guest protection, not Xen's?

Adding setting of the variable to the "pv" sub-case in parse_spec_ctrl()
didn't seem quite right to me, considering that we default it to the
opposite of opt_ibpb_entry_pv.
---
v3: Leverage exit-IBPB. Introduce separate command line control.
v2: Leverage entry-IBPB. Add VM assist. Re-base.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2315,8 +2315,8 @@ By default SSBD will be mitigated at run
 ### spec-ctrl (x86)
 > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
 >              {msr-sc,rsb,md-clear,ibpb-entry}=<bool>|{pv,hvm}=<bool>,
->              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
->              eager-fpu,l1d-flush,branch-harden,srb-lock,
+>              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ibpb-mode-switch,
+>              ssbd,psfd,eager-fpu,l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
@@ -2398,7 +2398,10 @@ default.
 
 On hardware supporting IBPB (Indirect Branch Prediction Barrier), the `ibpb=`
 option can be used to force (the default) or prevent Xen from issuing branch
-prediction barriers on vcpu context switches.
+prediction barriers on vcpu context switches.  On such hardware the
+`ibpb-mode-switch` option can be used to control whether, by default, Xen
+would issue branch prediction barriers when 64-bit PV guests switch from
+user to kernel mode.  If enabled, guest kernels can op out of this behavior.
 
 On all hardware, the `eager-fpu=` option can be used to force or prevent Xen
 from using fully eager FPU context switches.  This is currently implemented as
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -742,6 +742,8 @@ static inline void pv_inject_sw_interrup
     pv_inject_event(&event);
 }
 
+extern int8_t opt_ibpb_mode_switch;
+
 #define PV32_VM_ASSIST_MASK ((1UL << VMASST_TYPE_4gb_segments)        | \
                              (1UL << VMASST_TYPE_4gb_segments_notify) | \
                              (1UL << VMASST_TYPE_writable_pagetables) | \
@@ -753,7 +755,9 @@ static inline void pv_inject_sw_interrup
  * but we can't make such requests fail all of the sudden.
  */
 #define PV64_VM_ASSIST_MASK (PV32_VM_ASSIST_MASK                      | \
-                             (1UL << VMASST_TYPE_m2p_strict))
+                             (1UL << VMASST_TYPE_m2p_strict)          | \
+                             ((opt_ibpb_mode_switch + 0UL) <<           \
+                              VMASST_TYPE_mode_switch_no_ibpb))
 #define HVM_VM_ASSIST_MASK  (1UL << VMASST_TYPE_runstate_update_flag)
 
 #define arch_vm_assist_valid_mask(d) \
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -455,6 +455,7 @@ static void _toggle_guest_pt(struct vcpu
 void toggle_guest_mode(struct vcpu *v)
 {
     const struct domain *d = v->domain;
+    struct cpu_info *cpu_info = get_cpu_info();
     unsigned long gs_base;
 
     ASSERT(!is_pv_32bit_vcpu(v));
@@ -467,15 +468,21 @@ void toggle_guest_mode(struct vcpu *v)
     if ( v->arch.flags & TF_kernel_mode )
         v->arch.pv.gs_base_kernel = gs_base;
     else
+    {
         v->arch.pv.gs_base_user = gs_base;
+
+        if ( opt_ibpb_mode_switch &&
+             !(d->arch.spec_ctrl_flags & SCF_entry_ibpb) &&
+             !VM_ASSIST(d, mode_switch_no_ibpb) )
+            cpu_info->spec_ctrl_flags |= SCF_exit_ibpb;
+    }
+
     asm volatile ( "swapgs" );
 
     _toggle_guest_pt(v);
 
     if ( d->arch.pv.xpti )
     {
-        struct cpu_info *cpu_info = get_cpu_info();
-
         cpu_info->root_pgt_changed = true;
         cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
                            (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -60,6 +60,7 @@ bool __ro_after_init opt_ssbd;
 int8_t __initdata opt_psfd = -1;
 
 int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
+int8_t __ro_after_init opt_ibpb_mode_switch = -1;
 int8_t __read_mostly opt_eager_fpu = -1;
 int8_t __read_mostly opt_l1d_flush = -1;
 static bool __initdata opt_branch_harden = true;
@@ -111,6 +112,8 @@ static int __init cf_check parse_spec_ct
             if ( opt_pv_l1tf_domu < 0 )
                 opt_pv_l1tf_domu = 0;
 
+            opt_ibpb_mode_switch = 0;
+
             if ( opt_tsx == -1 )
                 opt_tsx = -3;
 
@@ -271,6 +274,8 @@ static int __init cf_check parse_spec_ct
         /* Misc settings. */
         else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
             opt_ibpb_ctxt_switch = val;
+        else if ( (val = parse_boolean("ibpb-mode-switch", s, ss)) >= 0 )
+            opt_ibpb_mode_switch = val;
         else if ( (val = parse_boolean("eager-fpu", s, ss)) >= 0 )
             opt_eager_fpu = val;
         else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
@@ -527,7 +532,7 @@ static void __init print_details(enum in
 
 #endif
 #ifdef CONFIG_PV
-    printk("  Support for PV VMs:%s%s%s%s%s%s\n",
+    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
@@ -536,7 +541,8 @@ static void __init print_details(enum in
            boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_md_clear_pv                           ? " MD_CLEAR"      : "",
-           boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "");
+           boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
+           opt_ibpb_mode_switch                      ? " IBPB-mode-switch" : "");
 
     printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
            opt_xpti_hwdom ? "enabled" : "disabled",
@@ -804,7 +810,8 @@ static void __init ibpb_calculations(voi
     /* Check we have hardware IBPB support before using it... */
     if ( !boot_cpu_has(X86_FEATURE_IBRSB) && !boot_cpu_has(X86_FEATURE_IBPB) )
     {
-        opt_ibpb_entry_hvm = opt_ibpb_entry_pv = opt_ibpb_ctxt_switch = 0;
+        opt_ibpb_entry_hvm = opt_ibpb_entry_pv = 0;
+        opt_ibpb_mode_switch = opt_ibpb_ctxt_switch = 0;
         opt_ibpb_entry_dom0 = false;
         return;
     }
@@ -859,6 +866,18 @@ static void __init ibpb_calculations(voi
         setup_force_cpu_cap(X86_FEATURE_IBPB_EXIT_PV);
         setup_force_cpu_cap(X86_FEATURE_IBPB_EXIT_HVM);
     }
+
+#ifdef CONFIG_PV
+    /*
+     * If we're using IBPB-on-entry to protect against PV guests, then
+     * there's no need to also issue IBPB on a guest user->kernel switch.
+     */
+    if ( opt_ibpb_mode_switch == -1 )
+        opt_ibpb_mode_switch = !opt_ibpb_entry_pv ||
+                               (!opt_ibpb_entry_dom0 && !opt_dom0_pvh);
+    if ( opt_ibpb_mode_switch )
+        setup_force_cpu_cap(X86_FEATURE_IBPB_EXIT_PV);
+#endif
 }
 
 /* Calculate whether this CPU is vulnerable to L1TF. */
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -554,6 +554,16 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
  */
 #define VMASST_TYPE_m2p_strict           32
 
+/*
+ * x86-64 guests: Suppress IBPB on guest-user to guest-kernel mode switch.
+ *
+ * By default (on affected and capable hardware) as a safety measure Xen,
+ * to cover for the fact that guest-kernel and guest-user modes are both
+ * running in ring 3 (and hence share prediction context), would issue a
+ * barrier for user->kernel mode switches of PV guests.
+ */
+#define VMASST_TYPE_mode_switch_no_ibpb  33
+
 #if __XEN_INTERFACE_VERSION__ < 0x00040600
 #define MAX_VMASST_TYPE                  3
 #endif



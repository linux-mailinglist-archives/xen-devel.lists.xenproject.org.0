Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C491758F38
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 09:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565607.883890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM1lW-0000JP-0a; Wed, 19 Jul 2023 07:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565607.883890; Wed, 19 Jul 2023 07:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM1lV-0000Gq-Tt; Wed, 19 Jul 2023 07:38:29 +0000
Received: by outflank-mailman (input) for mailman id 565607;
 Wed, 19 Jul 2023 07:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM1lT-0000Gk-Ta
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 07:38:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f4a7a05-2607-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 09:38:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7205.eurprd04.prod.outlook.com (2603:10a6:10:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 07:38:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 07:38:24 +0000
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
X-Inumbo-ID: 3f4a7a05-2607-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ8nVvbL5RDd9X4iHrwCAsv7BdEfdWqFGlv1fJts5zqmOlzyyfyYGx7dkRdFk7uFS/1jzF2PvA1hFKFzw/1UsLsl7D8dFC5J8lcBeW5iZmzN66Zwt2LwPMjTaqZdH8quLuaptuhY2VI35s64mcqdMkdf48mxakNS3+pNMf9NALzfKYBpGYNPRfmrpSfXAFFCZQ9Go4oKatEc+FQq1tx9IUQMBJEgJkyqPmtp4yovfYq/HJ152KwkNdpLxHQbNYtyIRfgAaoj97a+FOp8HqgzHYhNi1RvIDodNYGvLS4Fs597O7qAkwE6LTy0FKfar6QomkhWbtHJqnn0GVIyxinVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXb4NC6XF0E0BgAu0gjiWqBFwYNC73u24iqA1zZv1OA=;
 b=lKG5DEZaIGw7mLCDrNG8qW4puVnI3mwG+KypYLaOJNiHv8oifDWa3fiyLTv/2Rbp9+nZfjWEaB0XLzt0u8uZa4oZispYS6tvEGZvEBPYpBTE9I6WQO8H3E++gfcYRA41EYHA0gVnS3RKDkz6Ew89erIWPo1NTvZP5cBUaIRRr0HytMkIA2nnUU67ciRTxZAhYyT8D6JCdwVrrkYwb7K5FEr6qAnri4GSjQDhaRNtAWXgEZ2l5UF/7eBgKAF8gRdhrhV3QXZm/xjTm1tDSJ9pH+ZVY+KCNIQAkgCUj2DmBY7AIOXpogEcJ1xy2ROK7vluxnmdtV+aJv33c7+K9dbw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXb4NC6XF0E0BgAu0gjiWqBFwYNC73u24iqA1zZv1OA=;
 b=PZM60Xy++uNWcU8Fsys2POBF/jOhBlk7DGQMltbhD5t0opSJO4mav17+mwT/aqUiZzAtuNu5CV5W4zTi1/gVhXt3pI16/ZfeOmroxrgdYyMNst/2Pi6YBg0CbmkamwsDuVoMvk3MKDppL5jH5raRGFr3JGI8TwhC9bkMZ7bQSYK5V2AGArN8Od0licaMnMyj3p6xRWSXuKXxxTDaYKh1Sc0Orc7nmSf3KSDmisQWvKTedQXQ/fTZgVchFDyMUl63u29lEgLTaM8LHbagRPF3gswq/xG8cjnwmbUKeAs8cM1KBRWYhXWIxBQh9pSIxs23yqnn+JIHTpxKbPfvmvbtwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3913c170-09c6-2baf-ed38-5614f8c6cb2e@suse.com>
Date: Wed, 19 Jul 2023 09:38:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: fix early boot output
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: dc18c008-b461-464a-e846-08db882b2258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BJ8OgDn/U+37P5Q5jGz5QYws7luNlQjW6/cRLptGqBVhzqRjQDg2qXzBUOrm7Q481UAKctZy2zTSILzg5G9Cktbn/fHiOOxFVvWcDLkSeE7fJ2p+wxTOBbj7hxUYtLy4qmFKnJbG/IQR8uUIF74g3sOpTeTTAcYgab57stWviOcTO+CDgduP5eKJYARYimjs63e1mbwYzRu1nKde41jfA0igCuS6g9Y+NY/vf8wF3MUmUaM7t+wUiAlDkXGOwOkEzfrLWyWjvmpwz3p49L4QeMvnTXfO/U8aI7Jfbfg9sxlQfN07K1yWdGrdNoUHwlrImRR5Z/oxJXD+iTPMyrtyK84mA+YTKoxGYeAgOdb3fGmT8X8DOwtYemoC2o4lKgy7mjN83ydDPxPg7QQBuilGd9sAPV65i/L0GnWhhBfX+cnxYOH3o7neAL4FqQJADWEkJHiXc+7jdqCF0bxQIsU79zmn4hgB8MYYky5je9pvvjUQbG1aoAOUAnQIMDmpbd8ixT6btP0aVJI4XFCpGkYMKRzKOt9pa8e+gTGFFUrvpuljqiw0hy4YXUyA13MDM4k1FwRvcy2Nj51m081jgYwPudzj+NOfFm39AVLi4vVIMqJRpc6cr/UxBNK3ub8wQLKbepHU/V/qsNPL/d7I6/0JJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(41300700001)(8936002)(31686004)(8676002)(316002)(5660300002)(54906003)(2906002)(478600001)(66476007)(6916009)(66946007)(66556008)(4326008)(6512007)(6506007)(26005)(6486002)(2616005)(38100700002)(186003)(83380400001)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGRUYTZneUJJeWpwdFdQVU0rK094M05raE5VR0xDOU9kY1FFTjJKeXYwL1lJ?=
 =?utf-8?B?YnZ4cWFFd21IVVpEbjVuVVkwU2t4ZTRkU0xIcG9EaGZpKzVrY29qNzR4M0Rh?=
 =?utf-8?B?NzVJMC9NVlZueUJ4TmRvTmc0Q2JiUjZrNTBBMmVhRHNrUWVSSmxpbVoxaCtB?=
 =?utf-8?B?NXJZQXRtc29KN1pHOVJQaC9MRXhxdS9ZSk1OQzdVL24veUx0T0U4T2NKbVNa?=
 =?utf-8?B?VUY3Ulh2d0RiNlRJVkxGTzRYR0gyRTQ3elQvSkV1QWZUdTBVdDl0dkxZamdl?=
 =?utf-8?B?MkZUTnM3ZDRWQlpVblFtTVh5MzhHQ1djNkJMa1dvbmc5cUdkR1B3WEtmc1RX?=
 =?utf-8?B?Ukd4ZDd4K0llZkpZaTJFTjNXMU9zWnM4aXp3ZHREdGk4UzFYc2liYitXc2U2?=
 =?utf-8?B?dGJPYXd6N00zaWtBcHlrSEZKZUdnVWFZR2dSaVFlTDBMY2dHMWdVTktuK00v?=
 =?utf-8?B?UzA2dEY2Yitac2lrazFDRnNHUDZUTG94ZE91dDIycFZWY2x1R2pkd1Q2V2h0?=
 =?utf-8?B?dldsT0lManVCckNZR3JpUi9Cei9mak1RbmE0by9RM0Rqc0EyZjJhSUtRNTRu?=
 =?utf-8?B?WHYrc0orS3NRb3FiRFRZU1FjQS8yVzFQaUorZlIyQzdpSjljWlltUHo5VUI2?=
 =?utf-8?B?Z3E0U2FSV0ZzTkVNTG1jeHdCby84a2wrZ2RnQktQbzZJYWlOdVpsU2J3dnJ3?=
 =?utf-8?B?bWNuSGIwLzg4SXB1ZlVUMXQ1WG41ZEZ1bVBvS0JQVzNlQWhLcEg5ZmN3SEV2?=
 =?utf-8?B?Um9PelNyVVBTbUpuY08vRDF6ZXZraUxDczc5WDByZjNjeXB6ZzkzWjJRMkpL?=
 =?utf-8?B?TURySmVIM2R4MFdrbTJ6UU1nY3BPM000bWN6RTc2NzdzVnF5ZDBpbWxTT3lG?=
 =?utf-8?B?UjNEVmpKMzNPVk1UelBVdGFrQ2Y3V1lKSVZuS1J4bXVqRUEyeFZhbG9udndr?=
 =?utf-8?B?eklLWTJFT2d0UTdaZ1BFMHZSZjJjZmhRUExFNDhKanFwMlhEOUR0VHlPdmg2?=
 =?utf-8?B?ZVFKTnEvUFQwMlRnM0JKOU1PR1ZCRDRNL1phdVJuSkJOTkVybk1zUENBR3pv?=
 =?utf-8?B?YnhwNXNnUG40S3hYSk1VRW9tZUowdTdyODdiRGd5QVJWZTlST2diMW16V0ls?=
 =?utf-8?B?YmRqZFAzeXIwMVVqcVVDNlRxMGJ6elpZTnViL3U3MG5DUlNibWpWd3d4c2FC?=
 =?utf-8?B?NDZxejVCckE1cHdXUzVuVjdtdkZwYzk3RDBpczlzYU5qT0p2cTFUeXpqcWUx?=
 =?utf-8?B?S3crSU1VSkR3UFpLTlFKRVZ6eHF2V21XRmFaVU1ZMlRmRHIwUHVPZWZ1Mk9l?=
 =?utf-8?B?ZEdMNDZkbTlQMEJBM0dOam1MakRMQUR2ZmNqWUtIbUdNRHFrcXZ6NW94ZnlE?=
 =?utf-8?B?V1FDVDlubGdhQVBXYTB3K1ZyeURSZER2Q2hQZndIZHRoOXd6Y2gyU0paeXNB?=
 =?utf-8?B?N1ZzZW9URzBQN0VXdjVzVUJDUk9UeElaZUh5OEVuVmNmK2Jid042d0lGbEsv?=
 =?utf-8?B?TXBXblZENGxNajFWS1FON29pQm9OSnZIdUdFa2NJcHVOZDJ6azJPTVAvd2Zs?=
 =?utf-8?B?cjdvQUVoT2lhOERWUE1LK1Y5SnNVRENidGlQZzhWRnlkYlUzUjJwNG1FRHEy?=
 =?utf-8?B?dXhBYnAzNS9XektRRjdPczNIYzZ3MHV6cVdXTllydi9mZXZMenJwWFEydlph?=
 =?utf-8?B?T2FZZndPcGNITzBXaEEzSXdPUHlkbkFoWjVYRkN2eloxY1NXUHQ5TWd6blJX?=
 =?utf-8?B?TW9NdmZ3YWRTR2pWSDkzdjNSeUVtVUNBMW5jZnJ4c1FrdDdCb2RpV0s4MnFs?=
 =?utf-8?B?eFBQMWlwUmxHazRWOHVUUnFuQVMvWVpvUlhkQk1oVHVLeFROeXdLNUZoeXRz?=
 =?utf-8?B?OVMyVjBDdzRLaDJDQzc2SG13MXFMTHBNblEzenRLSTR1ZE4xeFJTdnd6Ymw3?=
 =?utf-8?B?bTMrVkU4emF1OE8vUHlnQUJIdHdxWm45L0JFLzVRckVjNkp0anNJK3pNV1FN?=
 =?utf-8?B?ajN5Y1dNaHpTYW1lUy81L2lYaEtCNVRxVG1EaHpGNjh0UnZzTVZ0RkVGbCsr?=
 =?utf-8?B?T2JmdWo2N290VzUzNjJFN2x6Ti9IM1RocldJZmxaM2FlNzNqN0ZsZmxWT1Uy?=
 =?utf-8?Q?2+8qcJGQCwaoKNNx15h4vEiSx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc18c008-b461-464a-e846-08db882b2258
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 07:38:24.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2fP/l0cInEFE9dYmT/VZ4bs4t8u+sk4LNKSl1oX9hlT1uhiPjx3iQhiA9S2r0D4tbKcPVnZFKah/IDsV85pCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7205

Loading the VGA base address involves sym_esi(), i.e. %esi still needs
to hold the relocation base address. Therefore the address of the
message to output cannot be "passed" in %esi. Put the message offset in
%ecx instead, adding it into %esi _after_ its last use as base address.

Fixes: b28044226e1c ("x86: make Xen early boot code relocatable")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This also suggests that 78e693cc1232 ("x86/boot: fix early error
output") was only tested for the no-VGA case (i.e. EFI+MB2), and only
for one of the two paths which bypass the loading of %edi at .Lget_vtb
(or the offset load merely was lucky to pick up a zero).

Clearly when using "vga=current" with MB2 when the screen is already in
graphics mode, there will continue to be no visible output.

--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -146,17 +146,17 @@ efi_platform:
 early_error: /* Here to improve the disassembly. */
 
 .Lbad_cpu:
-        add     $sym_offs(.Lbad_cpu_msg), %esi
+        mov     $sym_offs(.Lbad_cpu_msg), %ecx
         jmp     .Lget_vtb
 .Lnot_multiboot:
-        add     $sym_offs(.Lbad_ldr_msg), %esi
+        mov     $sym_offs(.Lbad_ldr_msg), %ecx
         jmp     .Lget_vtb
 .Lnot_aligned:
-        add     $sym_offs(.Lbag_alg_msg), %esi
+        mov     $sym_offs(.Lbag_alg_msg), %ecx
         jmp     .Lget_vtb
 #ifdef CONFIG_REQUIRE_NX
 .Lno_nx:
-        add     $sym_offs(.Lno_nx_msg), %esi
+        mov     $sym_offs(.Lno_nx_msg), %ecx
         jmp     .Lget_vtb
 #endif
 .Lmb2_no_st:
@@ -164,11 +164,11 @@ early_error: /* Here to improve the disa
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
          * because there is pretty good chance that VGA is unavailable.
          */
-        add     $sym_offs(.Lbad_ldr_nst), %esi
+        mov     $sym_offs(.Lbad_ldr_nst), %ecx
         jmp     .Lget_vtb
 .Lmb2_no_ih:
         /* Ditto. */
-        add     $sym_offs(.Lbad_ldr_nih), %esi
+        mov     $sym_offs(.Lbad_ldr_nih), %ecx
         jmp     .Lget_vtb
 .Lmb2_no_bs:
         /*
@@ -176,7 +176,7 @@ early_error: /* Here to improve the disa
          * via start label. Then reliable vga_text_buffer zap is impossible
          * in Multiboot2 scanning loop and we have to zero %edi below.
          */
-        add     $sym_offs(.Lbad_ldr_nbs), %esi
+        mov     $sym_offs(.Lbad_ldr_nbs), %ecx
         xor     %edi,%edi                       # No VGA text buffer
         jmp     .Lprint_err
 .Lmb2_efi_ia_32:
@@ -184,12 +184,15 @@ early_error: /* Here to improve the disa
          * Here we are on EFI IA-32 platform. Then reliable vga_text_buffer zap is
          * impossible in Multiboot2 scanning loop and we have to zero %edi below.
          */
-        add     $sym_offs(.Lbad_efi_msg), %esi
+        mov     $sym_offs(.Lbad_efi_msg), %ecx
         xor     %edi,%edi                       # No VGA text buffer
         jmp     .Lprint_err
 .Lget_vtb:
         mov     sym_esi(vga_text_buffer), %edi
 .Lprint_err:
+        add     %ecx, %esi     # Add string offset to relocation base.
+        # NOTE: No further use of sym_esi() till the end of the "function"!
+1:
         lodsb
         test    %al,%al        # Terminate on '\0' sentinel
         je      .Lhalt
@@ -202,11 +205,11 @@ early_error: /* Here to improve the disa
         mov     %bl,%al
         out     %al,%dx        # Send a character over the serial line
         test    %edi,%edi      # Is the VGA text buffer available?
-        jz      .Lprint_err
+        jz      1b
         stosb                  # Write a character to the VGA text buffer
         mov     $7,%al
         stosb                  # Write an attribute to the VGA text buffer
-        jmp     .Lprint_err
+        jmp     1b
 .Lhalt: hlt
         jmp     .Lhalt
 


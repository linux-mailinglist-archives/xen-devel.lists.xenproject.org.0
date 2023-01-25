Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7977A67B5D8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 16:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484421.750991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhfE-0000Xi-Hj; Wed, 25 Jan 2023 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484421.750991; Wed, 25 Jan 2023 15:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhfE-0000Vl-EQ; Wed, 25 Jan 2023 15:26:16 +0000
Received: by outflank-mailman (input) for mailman id 484421;
 Wed, 25 Jan 2023 15:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKhfD-0008PB-9z
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 15:26:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99fbe8b4-9cc4-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 16:26:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:26:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 15:26:12 +0000
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
X-Inumbo-ID: 99fbe8b4-9cc4-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOm0XeuodWHgs+yabik/SXDquFfo4rfPyVOeBtdw8w8xF0BaWzVgBdm52r3V6MiZZStFNl9wE4/MQhvB7rNlkecyia03bpUw9KLlesyubv9nWYpFz/HkSlw1TveebEv/EyB0dM93stxRqMyIEUcZ36+9gZjFSYq3z9L2kZFcN8Y7gJP1H0bhcr7pbhGgKMufDlQLJHgtDI1TvLnoXhVDZ4DKT05vlpotPiZkeXEMy9I2T6WWL1cPejv7rfzrjqSwfEahe/aXFjRYZAFYGk9VDb49bgO+nf9Nk/CWFknlZofU8LTNjPUdClu5ZkwJD7SPqDfaA71iNIWvOxsMyFWAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hzT4IxLbkKQPfXvLmEol5is+s4A37v/BAV/NZrhc5o=;
 b=n7a4k7R3vTNQPKtW4XWZBNdVmouCUvLIEBnhCPHnRYy88NTSWxikVAb6ObhdMHH52Y6cAXlPfqSEYlWwyEhHsMnHB5qpJpelyHa2DLrVnTO6L1PR3oRYGUuGAn84srTGGjqawdBe6yengvrSI4awYGKDpBHTsjviAf9Kj8yZakf9sOlZA9ChYOjju2n99a9DOFD3xT11RL70tN0321baZ8ifHgfnPaijhdG9P1qmc3wG0aUEDRQlXcCjG2lFoSApKhJL68yEPSlTT33Cdtr7vNMfBtNdbcNDrw8RZlVC3G/qMMVB1/Eto+kj0K0TJBGdFeiPXbfCMYVPsM+NaE+ARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hzT4IxLbkKQPfXvLmEol5is+s4A37v/BAV/NZrhc5o=;
 b=2Bf0exAKq/Rrs7XRlyXUtBVgpaFBSwfnyt/Zp8g7AUi8vJNWcq+aw4J70UKviNetaUHpxWx3FL2x6AJbgAvWLs084DIMHEP3HrAnRbLTGTXCnKaEM22JK89fz/1hzofFR+7T/KwPuZAHkHOdKxjLKSSIl44wfczSLmjTKwSV5/IEYsOm/Jkyk4CvUEvMAWSGDSPaFCFbOdUIpc5ZkxslQL+LYc4uil3Ph3XL59Dy54WhYloWmM538aM+oCFOgQtG8tzxDJN8CqeVwM+crOEFaMDqnQvokFHOzK3iaIAUodmQ94vN6fGIA9LArLx+pTJlQuAEk4MBiwqx5hhjVh9aDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23ea08db-3b64-5d1a-6743-19abb7bd6529@suse.com>
Date: Wed, 25 Jan 2023 16:26:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v3 2/4] x86/spec-ctrl: defer context-switch IBPB until guest
 entry
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
In-Reply-To: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: c52ef015-6633-4f42-40ed-08dafee87d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dAZ259qQ1aY5wGjm3/NvDsMTezqLPgI9/jhGGMBEKngDQl7DSerJNPp9qwmZlXNw5Z8uGb5aqrf0TDkscENbOdoy997nskmlIm3SaqbB7XhxklLSeCbcieSEkvk7XDtGhAJyq9irU94QAjumF3jFK8LKEYQAtTSTO42frDI3TEs243gqQQa/9M2rjwUybFcssrFDNy43i93QIkpWkJMZWcc087Q3SbSke5yXkNVXHYvrhmhf5j1a4DSM6RvWWj6CThsJReoZ5tcYMEThgWKiOyDR2zJx3RLmbjXxiUTudAHA2CsuEK74YsiCU5UGfSSt4iM6K8SAMzc7QyLfdAxgqSWJEZemaFmBX3s6RT9/g0JLGKODFb/pZxgKyx4S0PjwKDSPaS5U3XTm2K9tVq0H3naK6aNsFUaDxtmZieC0eCaDxmoVrudd5nVWB7Tl26dOv9L4s4Nsf3NVawGTWRJ29gjngHZc99IefTMwl4VMwtZnyA0LXMCG8RRH5OUaW26NB4MoQvh7ESuJ0o3SvWb1P4on94Hzd9/RBAuFbKXVTm2j4yL0TjYYfcMdTOqcq5OfygKJEHF5KsRWNNjjJiLt40L1vramEodYsZ+bUDvhBkCvoGv7cKxvqUG0UM3L1TIrA65o0wJGyfdK/hf50ZBkOjq0fpCf1jhbO5h0y50alzuqqwx5328MSNVN8yr438OZxvEFnf2XAvb0Ptcqh1q56R0Qhu+g9wDH65I6T7j1I9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(83380400001)(38100700002)(26005)(5660300002)(2906002)(41300700001)(86362001)(8936002)(4326008)(6666004)(6512007)(316002)(6506007)(8676002)(186003)(66476007)(66556008)(2616005)(54906003)(478600001)(6916009)(66946007)(36756003)(31696002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk42K1QwWlluM1d1dFhKY2RKRC9BSkpkRzdCeGV2SEgwNEJ2TTlwOCtwUEF0?=
 =?utf-8?B?K1pEOTczUkdtRnMvelBjeXR0NndVYUl0clgvUWZydHZ3QnpTNWd4T1ZrU29i?=
 =?utf-8?B?SGFUbXNvbG1RM1BsVzlFcklINi9nOG9iNlVjT2Q1THI4TUFMc05mMEwyUW9D?=
 =?utf-8?B?NlJxOVlZdi9kTHVTaUJ1SjlmNitSckxvbGZDNHZSdUVhaS9xejR1Q0d3ZU5o?=
 =?utf-8?B?cUEveU1VOCtZOUdtaVRwNGN4NVJCK0VVcFlQeno4dW5aZ0ExTWFkaUZIZmVL?=
 =?utf-8?B?NGdpMVJMSFljU3J0UVNPVTNKWmtMY01nV1o0a2VyUzJZd2ovZmV6OHNpSnpE?=
 =?utf-8?B?UU9yN3pRcTlIS2JEM1BZZjMyMmQxUDVyZkNBYjVaWm1XSU5GckltVWFWRk1t?=
 =?utf-8?B?NWlMRnlidXc2Y3F4OERDU0MzQnRYTVZZUy9CT25FK3Juc21tbXdVb2VRN2pn?=
 =?utf-8?B?L29JUzlBZFRESXB4RmcwSTNZME53ejRTTFJxTTlPUEEzZUllUEQyZjZPYWI3?=
 =?utf-8?B?OXlZVWp6a0pQT2FjdWNZZ3pWZnpNZEZ6a0NGUTVNQk1DMGVqYVoyZ0pQMnVJ?=
 =?utf-8?B?ZThCbUhOWEJOTHlZRno4aGFsNVJyUVNOYXdremUxcU5xTzRuWVFkRmNoOUd3?=
 =?utf-8?B?VFhxMEdqQUgrU3gyS2ZNcTJ5eWlqUElCRHBNaGxDbmRpejRaVlBqbXNxdmc1?=
 =?utf-8?B?LzloYkt6NXljWEdNN1FhdUVoRm9Vd1ZuQkhDR1AvcHRTckpYaUxwS1JmZFV0?=
 =?utf-8?B?QU51VDBvZGN4QnBzOGVnYUFvc0dNWjVRa05HOUpCb1NPY2dMZ1NzOFpyNmEw?=
 =?utf-8?B?L2YrUFJtVVFqMHdSdGU2bFZWTzhyMG02SHF4bmhwcGo0eS9oSXkzUFF6VEZx?=
 =?utf-8?B?YXJ6Tys3WFczQWw5MXZ1K3NBOWNxSThkeXVtMVJJUUthVSs2N3BBSG9ZYjQ1?=
 =?utf-8?B?cS8wektrcmQzVWsvRFRuRUY3TDl0RmN2MHArTFNXR3RPd294VU5VQjBvMmJB?=
 =?utf-8?B?SjlOVCt1TEhqc21oL3dqQ2xCVldyang0Q2RUeVJPcnk2cnUzV2ZVN2VhL3JN?=
 =?utf-8?B?em1kQ0t2aUUvT2RsWXArZkJUSTE2SXVWaGxabXNsYmp4NWYwdHcxVUJnZlNZ?=
 =?utf-8?B?TDM2NWRIMEtNaTNqZ0Zsd1MvYnJwVG0xbzJyMEZGTDlTTlJEcGlyK2ZpbFRj?=
 =?utf-8?B?enJONVNLOERwREhjZ1hFZk1TLzZnRG44dmxPTWxGS0ZoR0tWdkcwUlFsR2tq?=
 =?utf-8?B?eXg4TTdQMlhhSWhINWphbDI2MGFNNVp5TnZhQzQ4R29EYnFZcVdtVHJwc25t?=
 =?utf-8?B?bktiNjRKVkNkREJwRjFpcWNEY0U3ZHVNa0JRS2RJcnJOMlhwTVg5MVNUS1c5?=
 =?utf-8?B?RXZaYUozWXdmcmhrWGVhQ3liSUpmYytISVNUVTNueGNDcUZ4TTJMLzg3eERo?=
 =?utf-8?B?cFV2R3BSMENQQVNQU3lGZWZKK0xKWjVQWGMrSmNTaWdKQkw3ZFA0cE9nVmNy?=
 =?utf-8?B?ejgyU2dRYUhaNDljaXBkOWEyYmRHbkFTbVlxZGsrY3dYZFFmY3RvN1ROWXc4?=
 =?utf-8?B?VTRCTldsZy9pT0dpLy94OEpCMktiTTFnZWJXbzBXdXNNK1NHc3dFdy8well3?=
 =?utf-8?B?L3E4bUVTMUZubU5CdWFwMjNPMkNYblVJK3dQbWw4T0Y0cmU5M3hYYm8vUVUr?=
 =?utf-8?B?bGtEdFQxMmxMajQyZGtScXh2SFR3dVBRZDhCU3RWaC9YWXpJb3haZDJLQ2wr?=
 =?utf-8?B?dG0zRmM0WkJVZGhBWEtydC90d3ZxTTdXTUR0UGxlV1B3aFBrL1RZKzhDWVRz?=
 =?utf-8?B?akJ4cWJBejdTcDJUR2pVblIvbFdPRVoxL2VpdkNQQzVvT293c2huTkNTcnNs?=
 =?utf-8?B?akh0d0F1Nmw4OGg4eU9FRTJsVzhDWHJhc2UxR2pYZU9jVTd1Q3lkSUdtK042?=
 =?utf-8?B?UFJDTWxKdGlIaDJkVzVCYWNHYWNuVEc4YlhoS2lYbE5MQXB6VzRtMGV5ckl2?=
 =?utf-8?B?OGdLelpEUDl1RWlGbmR1RDM4cE1GeHN3TnN4MndKS1JvV1JlRnZVQ04rMUZn?=
 =?utf-8?B?RUhEUkZncWk1YklsbVpCM2FlcTM2Vnpld1hyNjNwUFE2bkdGcHlsTnpDWGhT?=
 =?utf-8?Q?WXf+b8UVx/VCssxpedJvdoemP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52ef015-6633-4f42-40ed-08dafee87d77
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:26:11.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNOIvU6IDt41a0vuZYiCBYG+TcCTA9loUDmfyaG8tHSiVH8ToWZ8k/vM2V7AaKPOWBA9UZxBh6Y6jo8u0ow3AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948

In order to avoid clobbering Xen's own predictions, defer the barrier as
much as possible. Merely mark the CPU as needing a barrier issued the
next time we're exiting to guest context.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I couldn't find any sensible (central/unique) place where to move the
comment which is being deleted alongside spec_ctrl_new_guest_context().
---
v3: New.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2038,7 +2038,7 @@ void context_switch(struct vcpu *prev, s
              */
             if ( *last_id != next_id )
             {
-                spec_ctrl_new_guest_context();
+                info->spec_ctrl_flags |= SCF_exit_ibpb;
                 *last_id = next_id;
             }
         }
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -67,28 +67,6 @@
 void init_speculation_mitigations(void);
 void spec_ctrl_init_domain(struct domain *d);
 
-/*
- * Switch to a new guest prediction context.
- *
- * This flushes all indirect branch predictors (BTB, RSB/RAS), so guest code
- * which has previously run on this CPU can't attack subsequent guest code.
- *
- * As this flushes the RSB/RAS, it destroys the predictions of the calling
- * context.  For best performace, arrange for this to be used when we're going
- * to jump out of the current context, e.g. with reset_stack_and_jump().
- *
- * For hardware which mis-implements IBPB, fix up by flushing the RSB/RAS
- * manually.
- */
-static always_inline void spec_ctrl_new_guest_context(void)
-{
-    wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
-
-    /* (ab)use alternative_input() to specify clobbers. */
-    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
-                      : "rax", "rcx");
-}
-
 extern int8_t opt_ibpb_ctxt_switch;
 extern bool opt_ssbd;
 extern int8_t opt_eager_fpu;
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -854,6 +854,11 @@ static void __init ibpb_calculations(voi
      */
     if ( opt_ibpb_ctxt_switch == -1 )
         opt_ibpb_ctxt_switch = !(opt_ibpb_entry_hvm && opt_ibpb_entry_pv);
+    if ( opt_ibpb_ctxt_switch )
+    {
+        setup_force_cpu_cap(X86_FEATURE_IBPB_EXIT_PV);
+        setup_force_cpu_cap(X86_FEATURE_IBPB_EXIT_HVM);
+    }
 }
 
 /* Calculate whether this CPU is vulnerable to L1TF. */



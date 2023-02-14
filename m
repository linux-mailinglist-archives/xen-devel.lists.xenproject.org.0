Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6B6968E3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495283.765618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxuj-0004BQ-13; Tue, 14 Feb 2023 16:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495283.765618; Tue, 14 Feb 2023 16:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxui-000482-Tb; Tue, 14 Feb 2023 16:12:16 +0000
Received: by outflank-mailman (input) for mailman id 495283;
 Tue, 14 Feb 2023 16:12:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRxuh-00047a-HJ
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:12:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57902e97-ac82-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:12:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:12:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:12:10 +0000
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
X-Inumbo-ID: 57902e97-ac82-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbTV6KCWba1/xkE5SwMveZsXpKFdRmIfWVV5fihN92SKaucp6GS6eYC9Vse5qdutipfoDrj6JIWDUISxBV5P0o4lYmVQDtKiLTWK3PKfSSUbipe0iBPjyYRaben3/E8j5vAgknuB8nSDTyo2wy+PWheL9Oyqg6bmmhzu+Ir/mr79Pr7wkAEYdG52LelEfXOUoqca0hl91CeYQbgb1pXA0D36f/D0qXZCUT6R1HEx9LMYNiu5gYsTdoRM4oCMUib1jifT6AqCOxUTfPh2zbH+eGMUIzpc4jXk75byHpKf2SRsxB3s5+jk4zJfic6z4NHtFNB7N/aU1wtfBjaLG9XIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft+1MjxIGwj0woDLn2mSZmpetZATFnBGj51IVbzpCU8=;
 b=UEDQU7Rs29oAvn44b3icyDQ8RW/CV91enmVshkZYyncqsbaYGn3fc5WmVwhUCe2dm0b1bsRml/iCvTlpU1BxXL+ZYRAH2Z1V7nkHRPDS41MtbjMxwWHwJpt3fib4SjTs9RLEvn8fKNqZV9pSpc5sUWwIluxcFNcriCZ6M0YnhpCGYC2Iek0N1lDIiFwbQB0F6bswZaiujFSVxblc9vuj/DsGtfKhU8jWaLn8nYKMwV0ztho1NxOhSwPCfE9R52wvYVI6u+7m1wJTC6d251K8NAQRiS4kowCd2YAulpt9XMydpSRJJsFO3a1iAol/0vw6pLFx7VeFIZbzzksOxnZmhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft+1MjxIGwj0woDLn2mSZmpetZATFnBGj51IVbzpCU8=;
 b=4gv63e1zH66qsFB7yleVVihSsrFA98MDy78+MK6wfS6V7JTM0cdWFGlWYYSPz0JCitec8AmeQnQBSfczYr3cpKG4hbk1A8sV0PkhNogJ2WuQ0mT89LH1f3eRzNWZZ7XDKgCY0+GTmL157cvbDeVn61rlX3pDKd2tRoFnE+zfyyGVQH+dp5XbS0q88I9KOr77f1hVLBaJsS43Ep0huilEXYa+AVkFxxBbj0yl6stskU7irUQ8D/I2xkQow26FnAL6KVnF7WXqHbtFxawsYgRH4rETNPpFebMFA8dNNwwSwmoq0Lz70H5ldgHVJQJ6QaemBzJafwTQL+rEJWnOJfNgvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2863b0a9-ca7c-3cce-104d-0b6685b0b383@suse.com>
Date: Tue, 14 Feb 2023 17:12:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH v4 4/4] x86/PV: issue branch prediction barrier when switching
 64-bit guest to kernel mode
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
In-Reply-To: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 2176c0ae-0c2e-4a3d-d35b-08db0ea639d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tbGKjhmnIqOu372RLOhYa9HjsThRc1WYJAhwKWMSuevo5L8cRYpG7GjHwRP4Jqjffz1YNfGuqaiRFgg0WhblYzYNroOp4VH3464C8hz9UanJoYrSXX2DRnJp4By5bUVtvog3Y8OGZCSGpcU6OV2x1I2B1Z4VAIXwVKKJq18LrcAaC63LYd8XWY8cPVBqz42uIczxaB0zJizPepOArrH3uG3x8QDFHv6vsx3cgmWzjk0IJ8cDWX9iMz6ejHIWixwGCtmlcOETaQFnHs8+caQSKzh6gyNj3r78HmckuvQ4vaV11zvuLl/YDhWgq4DadJDEO2aHeI2YMOPOe0BAK69y15AZw3OEl/ABAs8wIwH4iLh3G0Wj1jTlh7NQxRvMEqS6Tt/GPgdw7yflrqaWZno6sJtFDPE2ogtY7BNItcjxL41kWd7n9VCtlm1OaDuFMJPq4gC+aRei+1T5tjw0o5CsI1ktBPfwFZ0t+fud5F/dh3A+Te9UPrzhp+n//6ejI5Zhs5Ohtgud9WLW7jdBYZxTklnM8g7P/6l08wwTuw0sugUXX0eV9jWyVDeoknXuR60zW0u5zt7/KLJseggX5KO3XaWT5yStRka8SbqmAwPH6sqtk5l2xxWA+oK8d3X+B12vhCYD8E6G2H9tnR+6efInLFTNdAJJgE2Y3ptcox7OviAwyOlKJfpW+wMAoASDW0RG9JldEXpLFeAqRPvQ7wqBXYbfHuKVdBj4RP+2N1fbhqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(6486002)(316002)(54906003)(83380400001)(4326008)(478600001)(8676002)(66556008)(2616005)(6916009)(66476007)(66946007)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(6506007)(6512007)(26005)(186003)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0RJN2VKTVpEYmd2d0l4a3VNSk1GU2JFR3plV2E3Y3Ivd3QrNk9yUWhha213?=
 =?utf-8?B?UEtHakRKaDlwa2hJSjExblN0OXdVdytRSzh6Y2FWL051b3VsVWp1Z1RlcDR5?=
 =?utf-8?B?TExUUVUwRUpyZVFsYlJCa0RXNmI4bnY2UGIrc0VMbGRRR2Nsd3BJaHY3d1Bl?=
 =?utf-8?B?VFgyOVFIYUJiQ0UzV2F5RlFYaUFuNWVyMnNsZ0VJVHR1KzlGdXU1R3ppWnND?=
 =?utf-8?B?OEVMdVdpRjV4Znk5VGhhd09aMm1hMmlmR1BIM2RvU0FYR0ZCZmg4V3FHWitH?=
 =?utf-8?B?Rm5IWEl1blFnbU4xaEVZUGc3QzdqNlJsM29ZL2U1N2txdEhLSkN0S2RTejIv?=
 =?utf-8?B?eGFBckN4TWM1aFBoc2FsdUFOSEozVzdTUWRyR0t0V2owQXhjQ1dTMVpUbTEr?=
 =?utf-8?B?dm1yb0hjOGtITWpmS3ExQ0paYkpZblpJZVFxRmpzd1dGYVRDajhmMnowUlhG?=
 =?utf-8?B?YVpSMzBnam51czJzRHozOWprN3Q1K3gvVTVTZHZHenpFVnM4cVI4Y1NyWTh3?=
 =?utf-8?B?QUxkWEpvak12ZTViRVZva2N6dnV3TTI4b3RvUHdSWDZRY2RxektJajlReVJP?=
 =?utf-8?B?ZkF0dkxSM1dEU0RCUnJyQnZnYlI1dEN1U092YUhmbGNaU3pQMEZNMUdwMWdK?=
 =?utf-8?B?OFI5UUo1U01ORHA4RWpSTXZKT1VNQnZjYXcvRkpMck9kYzZYelN1MWhZYzll?=
 =?utf-8?B?MnZ5UnN1NzMrYXJ1UEFBVTVYdXkwdUlXbWdSZzJBbkdLRHF0STVDRHpqK2pD?=
 =?utf-8?B?ZGpiY0pWM2ZjS0pLN2FmZG4xTzJrMXVMbzAySG1mTUFqaTViRlZTTFRqLzdQ?=
 =?utf-8?B?eDh0NVc4Tk5VeHFaVVRkQktYRXVNd1h5RSsyTCs3VTg2NEh5ZFZsbFAzbjkz?=
 =?utf-8?B?bzRvUXZqUnptQmNua2VEY0k2bmFXbzNzSUhnVVhZTW9hOXRqeHFQaDhrdE9j?=
 =?utf-8?B?c0hsdG5FeGNnZmZpUTZ4Y0VQQldWS1hQc3Q1NUs2SEQyUTVuMXlnZUlyWGpt?=
 =?utf-8?B?aEphOUs1L3NMSm9QY1orNDlidDRrYk5EdEs5YlIrcTkzMFJWdUdFZW13Y2FT?=
 =?utf-8?B?Rm9LVklUMmJlOTZLSG1zVHBYS2lJV0tyNDlXbTlyR0UveXBwaUNTbHZMZXRu?=
 =?utf-8?B?b0JPNkNEanpGWVcvaW1LSCsxbkxNWGVhMjAyYTRvdUMrclpwNDlUcDlKNUF6?=
 =?utf-8?B?cVB0S0FoMzdWWEs5Q3RhMGNLalNOaVV1eVpic3hOUS9obWVxNStBeklxUVV1?=
 =?utf-8?B?S09kMTFQVDYxZTFsUy9XNDVYdncxa3l2UUczSzB2R0hoTVNMUGpKYzVHYmli?=
 =?utf-8?B?aUxESDFBTHZsTWhoSEs0aDhHM3VHRitkZHg1OTBVcjRTdFFmL1lyOEpiMVdq?=
 =?utf-8?B?R3FqMXJpUE9MdnZsMlh4WGRuM3d0eUE3eHR1aDhoM2hxbFRpcEViNGRLeVFF?=
 =?utf-8?B?VHFxU2JIWEtnQ2lycjFuZ3lMYWo3WmVFb1liQlZTMzZNQUdrYUt3ZGZPcTdG?=
 =?utf-8?B?Sko4eXIraUt2ZmxONGdBNWhlcnlPQ3J0U2h6Wkhqck5rTjEzOWVMZlRmNGpN?=
 =?utf-8?B?ZFVJeG9XY0RIZkdQRWsrckdLRFRCT2hzbUp0SUN5U0pSalVwMkM3WmhrWHFx?=
 =?utf-8?B?cDJlcXU1MTd4VWxYUjg1Vit1SlNJUHl1OEUzQ2pYb3YzM3VoQU93NWNKZkRw?=
 =?utf-8?B?YWF3UUFWYXg4TjJZOWd2aHNQSjVyVm0zeGtSUnNyOFZUVnd1TlA2YTR5c1R1?=
 =?utf-8?B?R0FHMGxLcHFrZ0JuRzQrWlI2Y1NBT21mWnZRaVF2K3I2LzNFMUxobFYxSGZM?=
 =?utf-8?B?a0t3NmJBMzhyWUN1WTNsT1NmcEZLaFZCUisyYUR1S1F0UzRySUVoYTFPOHJC?=
 =?utf-8?B?NlJ1dDlpM0JaeTFNdnVsWGw5VG81S0IxQkJVb29XQkx5OEhDNFFYdkJ4WTlL?=
 =?utf-8?B?dzJLNVp2UytNNUhXL1R1ZWR2YmVpaStERkpMTjJ1Q0g0YW4zZWFMS3RrS29v?=
 =?utf-8?B?emVNckpjZE1JaCs5cUliN3Vyejl2bXFVYVhGYmFjR3VNMVVKTzljSElpMGc0?=
 =?utf-8?B?MnV3UUNCUXI3NUNKNC9vYTZsaE9nUUhWb0szVS85eU5uQTljVGVqQmtpT1No?=
 =?utf-8?Q?KzTdw4EfVSeNh6D5MdzJ3TyBx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2176c0ae-0c2e-4a3d-d35b-08db0ea639d4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:12:10.2072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQaQ8gsgz5RRf3j7I2XFAY7RACKAwUPovBIQWh+TpPEJ1JJPdr0pjek1lvNXogV4o2y8YXT+G9KRaBHcKuchkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802

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
v4: Correct the print_details() change. Re-base in particular over
    changes earlier in the series.
v3: Leverage exit-IBPB. Introduce separate command line control.
v2: Leverage entry-IBPB. Add VM assist. Re-base.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2320,8 +2320,8 @@ By default SSBD will be mitigated at run
 ### spec-ctrl (x86)
 > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
 >              {msr-sc,rsb,md-clear,ibpb-entry}=<bool>|{pv,hvm}=<bool>,
->              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
->              eager-fpu,l1d-flush,branch-harden,srb-lock,
+>              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ibpb-mode-switch,
+>              ssbd,psfd,eager-fpu,l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
@@ -2403,7 +2403,10 @@ default.
 
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
+            cpu_info->spec_ctrl_flags |= SCF_new_pred_ctxt;
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
@@ -527,16 +532,18 @@ static void __init print_details(enum in
 
 #endif
 #ifdef CONFIG_PV
-    printk("  Support for PV VMs:%s%s%s%s%s%s\n",
+    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
-            opt_eager_fpu || opt_md_clear_pv)        ? ""               : " None",
+            opt_eager_fpu || opt_md_clear_pv ||
+            opt_ibpb_mode_switch)                    ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_md_clear_pv                           ? " MD_CLEAR"      : "",
-           boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "");
+           boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
+           opt_ibpb_mode_switch                      ? " IBPB-mode-switch" : "");
 
     printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
            opt_xpti_hwdom ? "enabled" : "disabled",
@@ -804,7 +811,8 @@ static void __init ibpb_calculations(voi
     /* Check we have hardware IBPB support before using it... */
     if ( !boot_cpu_has(X86_FEATURE_IBRSB) && !boot_cpu_has(X86_FEATURE_IBPB) )
     {
-        opt_ibpb_entry_hvm = opt_ibpb_entry_pv = opt_ibpb_ctxt_switch = 0;
+        opt_ibpb_entry_hvm = opt_ibpb_entry_pv = 0;
+        opt_ibpb_mode_switch = opt_ibpb_ctxt_switch = 0;
         opt_ibpb_entry_dom0 = false;
         return;
     }
@@ -859,6 +867,18 @@ static void __init ibpb_calculations(voi
         setup_force_cpu_cap(X86_FEATURE_NEW_PRED_CTXT_PV);
         setup_force_cpu_cap(X86_FEATURE_NEW_PRED_CTXT_HVM);
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
+        setup_force_cpu_cap(X86_FEATURE_NEW_PRED_CTXT_PV);
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



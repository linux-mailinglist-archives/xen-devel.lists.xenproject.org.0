Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C884FD745
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303596.517961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDku-0004Qn-MM; Tue, 12 Apr 2022 10:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303596.517961; Tue, 12 Apr 2022 10:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDku-0004NR-H7; Tue, 12 Apr 2022 10:28:16 +0000
Received: by outflank-mailman (input) for mailman id 303596;
 Tue, 12 Apr 2022 10:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neDkt-0004Hl-6N
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:28:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42447106-ba4b-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 12:28:14 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-LrgdbbHaNCaZ7pPxBlKXAw-1; Tue, 12 Apr 2022 12:28:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4181.eurprd04.prod.outlook.com (2603:10a6:209:4c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 10:28:11 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 10:28:11 +0000
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
X-Inumbo-ID: 42447106-ba4b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649759293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hkQxPfO69f3ADg5a3PalCKGxVvlVBa32J4aqnLZzYs=;
	b=ToAZfHWfnIIuLkBnYTLN1XAHwv5WjLKYOqHPCyqDxusqh1A8NliRfie1IvBFpQa9irMSHB
	QdKvBZtcRiVL3KLE01tDMnNf9XXtfK8Z3EeBIPQOq1rXPmcBcF3fPx6JnzyLb7rfEqx1o4
	N7k1t6h9VN7H27Gi913GUj457C2fVos=
X-MC-Unique: LrgdbbHaNCaZ7pPxBlKXAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naitpdP60afQ9W4uXaTqCu2u+IUvv25b97of08TnyGP7s/uOjP+H9PiVf0GcU6A+oKjlRaY0VZNF6R/oGWHNcVwcd9VoYhrrQ67io6lyDEO6vK1gMSS+gegwDRVakivCyARKDy2mM51+9e0zVotW+sqc24fFBAIx+efNYj5abatoLt/Mbj9scHCBthj8v+tRbFlFgb8k6UIZhg/13kXwJkZ3zRIk8vRWAetTDpWfWmmuN7jGNcVWMJOLYNZ4/ucpXcMSD7iEO2awNfXtzGtZxfLwTMNRV1U8L4vI38Qw39MpUQvOSd7JuHaeSRjSNFVd4+FQHyY279kJLzNjxzpY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hkQxPfO69f3ADg5a3PalCKGxVvlVBa32J4aqnLZzYs=;
 b=AOJAtWB6Kji/B6PII2CxMrLu1fxW8DyQxUxyh8eqTgWHNR5KCSb15aTi4oWXbgpBhzpQsile3RjYH241yxn9UafO7MaGDCcfpsJbg0mcmEzDu7GVmhHEmr/ZWuZLpaPmEDY1BroDggB8bM0tBFaPtAqigEOEDKDl0mMS80+Ea8jbqqdxm98TTaby+kbDmUIPBUSqnhlPEUMvvG33/BFPY4T3SkHmVaWTJf8Q2DvudYEsl6ea+QzJMiwCI8k7t6UeYB1YW/OCov8CmSJ92kBTnaHyz/KcD5n74Bw4iXq86J5N2F3ikhJam6xA0DW+yeiAk8Vf4u6HdbAR0jqwBjLEdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <531ab7f7-ce5a-12b2-e7e7-528c26f9ff7f@suse.com>
Date: Tue, 12 Apr 2022 12:28:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 2/2] x86: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0059.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::36) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7e56a4-bdc0-43df-fdfa-08da1c6f2501
X-MS-TrafficTypeDiagnostic: AM6PR04MB4181:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4181BF600A93DD170DE98E40B3ED9@AM6PR04MB4181.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7lXFI0CxYBkwEMZJKSwHUM07X1tz4Hek4DKKWzVThgCFKFuPohMEA9qxTqIlxqMjyxHjWu9cCDC6ZIWK0WmgqKhjQEuFFRLf5lsDn9tqRuos7P5herCThcXC63iY7CAeFKkWn0bMWnDy5TbZUZNMuV9TnfhMXpww1+9dE8ApH2pzBUdwuk2d/o4fENtnepxM9D69JRmRykMDwtS/hjffkO/6xfC3m63OBdYXeGiSA10IoopRxRFMXfdU2umYlymAW7uhYRxT7zXHlpe2pDiaMg0tUy07Pq5WV0x66HgCdSD8c+CTe9uGXh9eQxZTbumLanO9WarE/PdygIJRkvF6kjBNsivfAdrufqtYYpcOpYt4x0NoX6fiotfIJPbVnN8roMBpbnT1lImsAofHa//GoSbscmNbG9wrVYX/xSC8ruk34kJjbmujwMXEYZhnYnBA+fEdq0oocGIh37QyvW7c/AI+SRkxCZNadJVnXNfdbokvm42ElZVSXvD03Jni7FczwMZF+PVs5e7Ur7mrr0ptdmOLTJqC3UqHB2oahMnssqAwVSKZhIPIqUX/NhStog7SFoK8pLSr9sUBITzyCPmk/JbQBFzHgnkkUxTeMyv4PiVUAEZGowxEiVud0H88uZvSdN8DriuC8lUlvIp3pRivMvK/iv1r8rVauPt8HKJ9hG1ZZhFuQqELsLQ+lM+R9TPRqSjLZ8KdWwSs92qRez9j43sUwPka9fwcWHOhZVbTSKL86wUmXJOjiLZHy6PdB4RJWUmfHbawVsx5ZCvjS1j1kilp2N8UkNg8OcHNlc7n1+ah8HmpWLiaTYJKCyDkGniJ8BrVxV8H0JLFpRo68MVz1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(83380400001)(6506007)(66476007)(66556008)(2616005)(508600001)(6486002)(31696002)(6666004)(26005)(186003)(5660300002)(86362001)(66946007)(36756003)(2906002)(8676002)(31686004)(6512007)(966005)(6916009)(4326008)(54906003)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjVvb1pDR2VleWppamVTS0tjL204Nk9NNjlaUmwyd0NCUG9sOWtVR1RFb2hN?=
 =?utf-8?B?Z3c2dUZWQnNPWVpJRW9aY1d4SmJHLzdueS9JTnpCRk5WTlFPZFVrYk5RUDNp?=
 =?utf-8?B?Y1h4U1ltcVRHaWFHS2NVUkVObkpXc2xSdUZuOHNyeE5oWmJoeE5lQmtJcmNn?=
 =?utf-8?B?REIweS9GV3pHQkxCdVJzRjJaK09Jb09QcFZxSDhHYms3aTZRWGREK1FmdjA0?=
 =?utf-8?B?eWQrRjlta2s4Q2FyQ0Z1dm1tK2Mzc3AxQUNoQXUwSnhPaXBHQWhpVzNhK2VC?=
 =?utf-8?B?K1JuZ3Z3MnFwR3BEVmdlVG5iUkZOV3cyRWtiYVptemFod3QwMXNtNUd4Z2th?=
 =?utf-8?B?aW5SR0lGQkxUSlF2YVhuRko3bmt4TVpxSjNySWgzWnNVZ2Q1UkRiNmk0RndO?=
 =?utf-8?B?UXZPZkdJdityVEdqWHFOVFcxT2VCaGNnZTBLN3lmM0x5Z1JhSndrQ3RKLzdh?=
 =?utf-8?B?SkJCMnJuMG81Q3lIeFErSy85WGJ4UDJkRTMycWU4YXp2V044TktSMDY3WnlM?=
 =?utf-8?B?OTZLNUdNM3pDR0laTjJyN1A2QUV6NWwzdnYvdFJQeXUyNFhCTkNob2ZCYWZh?=
 =?utf-8?B?Q3lUaXFQZzFmSDViSnBUZzZydy9JY2hEMDYzSkJZUko3eVpkRDlXeDdXSUVI?=
 =?utf-8?B?V3BrU1ZCZGRZdnJrUlRDdklUeEl2V2xjWTlFanBnbGJ6K2tWazdWclNRTkJk?=
 =?utf-8?B?K2FuRU9PRC9sWkhUUGU0b3Z6b0pSdEpJRldpdndmdE10b3hXbWxDdmdHVkFG?=
 =?utf-8?B?OGd3UjIyM0tRS2FnOFBzZUlZTWxvUlpvd0RnWFZnVmRwbGlJcFgzM2lVTm1q?=
 =?utf-8?B?YnlpdytwNlUwdHpSMlJVMVZUWUc5bHBRTFkrRmxQbjUvcU9tS3plSllwVUoz?=
 =?utf-8?B?MzFmblV1ZWRzQnc3Y25ic3B5UEc0b2NBWXBjSnBEdFRSbEZBVXlpV1ZsVGgx?=
 =?utf-8?B?cUNIVFFDZ0lXMEtIZ3daWElPUHl0NG1GMk1Ha1FHdFBLZVYwejVDRkFjYWRy?=
 =?utf-8?B?cU5FK3htUFg3dWlnVVI0SWRJSUdTWDNlMzBsSnRjdUtvTTA3V1BXeE0xNGlV?=
 =?utf-8?B?TnJxQ1pVTzl5b3VHT3Z2b0J6VlYyL3NRcFJRcXd0cG4rMnRITjJsS0pOQXY0?=
 =?utf-8?B?V3dURU1QQzRUQ0xUSERpUVJ2dVFUNitXTXpxSjVjUHgvbXd0SU54T3NJREN1?=
 =?utf-8?B?dHJaV2dQaFhGVGJkeFhEanhOYVhpQUk2ZkRwelNka1Y0TVBZc3FpM24wcXpV?=
 =?utf-8?B?NWhKMVBTQ0NHTkJFRU96NERZc25Ka2VaNnpPVjRCeHFWVnNieUpyS2F1eGJT?=
 =?utf-8?B?MTRpRTFBWmxnYnVnTW55UWYvSTI1UmlPYnhiWGg1My9ZMHh0aVkrSnVCSFVs?=
 =?utf-8?B?MTduWkhXTTQ4WVhURjFad2ZyREQ0OFIvOE14dGJOcjJSZTIzQWgzcXQwQWFz?=
 =?utf-8?B?UHBtYWVybWZHZHk2UW14UDM3MWZpSzJNbS9FamJuZUtieEI1eDFMbU1CUWx1?=
 =?utf-8?B?SU5PWFB5eElTZHNmOW5Ud1RQdjY0Zzh4VnhxOHhCU1phQUV1S0twaFByb0U2?=
 =?utf-8?B?aDY1LzVSSFI2d2VENGtDT0VBTE9HY2dOdENpb0VhLzQ5YkZ6N2NHSDRwazFB?=
 =?utf-8?B?VldVZjFFai9EVjRJQlEvT2FZOHNIRlRvS3NKS1ZnNnRwTW5FK3FFVGV0WWJn?=
 =?utf-8?B?ZE0xUXNtSGRnUk9SUThaS3BKWEY3R1JNNnVWRzdSV1ltVW0vUUdlRlVKVTBX?=
 =?utf-8?B?TVR1OUVuMVFGNTdsZ0dxWEdGdFBocGQzalRXUWZndXRHQzY0d2xzSUNOWFVK?=
 =?utf-8?B?c29FV1hZdVN3WEEzMFdCb3poNkY1K01WOFphOGlRUzN5SGNQaE5KMjhxVUdB?=
 =?utf-8?B?VEhERSs1aHdJT3RCM0xzcDhHUVE1dmhNd085OUg1ZjZLV2xWVjRUdnJHMkNW?=
 =?utf-8?B?UHZ4RGlGSnpxSGVkMDlrQVU1Y2xVNmlvUFVrMkpJMUlsY0wxUERaS3FMRVBO?=
 =?utf-8?B?eXMrZ3pqYmIxKy85UmR1b0hhWDJOZktneXZoKzdXODE1eXYzZk9tQ0pVb2U0?=
 =?utf-8?B?M2F1dk90OFJzU1I5dEhNMmc5UDBEeENRNkF1MFdpR0VQUUJyeWhlYVZaa1JW?=
 =?utf-8?B?SXBOdXlPa1U2YWR0dUU5cENiSUpVRW01U0o0OVMwUGgyQVlnZlQwOHAwYWhB?=
 =?utf-8?B?YWtCNnAraENOY1l6dlV3Q1poeGpRYVArYXNTUS9PZVJiMFQrTHUyYWN0YUZ5?=
 =?utf-8?B?eHNoREtkeXhHL1hCb2NOWEVtRE5CODgvTUVIYzhBby9BbHdpd2w2aGlhVldJ?=
 =?utf-8?B?anh2RDFqRHpiNVRBOFJjWUt6d2NodHFRMkdtcEsxQTBmQzBsQi94UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7e56a4-bdc0-43df-fdfa-08da1c6f2501
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:28:11.4962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrvREJ2x0VTq+NyyeFby8VXhIvqNmTr8+qZ9xUzkB6fepNSPV18nc5TYWy7ezxsCvZGJiXmQQy7Aw/0rqlOeOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4181

Future gas versions will generate minimalistic Dwarf debug info for
items annotated as functions and having their sizes specified [1].
"Borrow" Arm's END() and ENDPROC() to avoid open-coding (and perhaps
typo-ing) the respective directives.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28

--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -53,6 +53,11 @@
 #define GLOBAL(name)                            \
   .globl name;                                  \
   name:
+#define END(name)                               \
+  .size name, . - name
+#define ENDPROC(name)                           \
+  .type name, @function;                        \
+  END(name)
 #endif
 
 #define NR_hypercalls 64
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -27,6 +27,7 @@ ENTRY(entry_int82)
 
         mov   %rsp, %rdi
         call  do_entry_int82
+ENDPROC(entry_int82)
 
 /* %rbx: struct vcpu */
 ENTRY(compat_test_all_events)
@@ -116,6 +117,7 @@ compat_process_trap:
         leaq  VCPU_trap_bounce(%rbx),%rdx
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+ENDPROC(compat_test_all_events)
 
 /* %rbx: struct vcpu, interrupts disabled */
 ENTRY(compat_restore_all_guest)
@@ -161,6 +163,7 @@ ENTRY(compat_restore_all_guest)
         RESTORE_ALL adj=8 compat=1
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+ENDPROC(compat_restore_all_guest)
 
 /* This mustn't modify registers other than %rax. */
 ENTRY(cr4_pv32_restore)
@@ -193,6 +196,7 @@ ENTRY(cr4_pv32_restore)
         pop   %rdx
         xor   %eax, %eax
         ret
+ENDPROC(cr4_pv32_restore)
 
 ENTRY(compat_syscall)
         /* Fix up reported %cs/%ss for compat domains. */
@@ -222,6 +226,7 @@ UNLIKELY_END(compat_syscall_gpf)
         movw  %si,TRAPBOUNCE_cs(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         jmp   .Lcompat_bounce_exception
+ENDPROC(compat_syscall)
 
 ENTRY(compat_sysenter)
         CR4_PV32_RESTORE
@@ -236,11 +241,13 @@ ENTRY(compat_sysenter)
         movw  %ax,TRAPBOUNCE_cs(%rdx)
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+ENDPROC(compat_sysenter)
 
 ENTRY(compat_int80_direct_trap)
         CR4_PV32_RESTORE
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+ENDPROC(compat_int80_direct_trap)
 
 /* CREATE A BASIC EXCEPTION FRAME ON GUEST OS (RING-1) STACK:            */
 /*   {[ERRCODE,] EIP, CS, EFLAGS, [ESP, SS]}                             */
@@ -352,3 +359,4 @@ compat_crash_page_fault:
         jmp   .Lft14
 .previous
         _ASM_EXTABLE(.Lft14, .Lfx14)
+ENDPROC(compat_create_bounce_frame)
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -139,6 +139,7 @@ process_trap:
         leaq VCPU_trap_bounce(%rbx), %rdx
         call create_bounce_frame
         jmp  test_all_events
+ENDPROC(switch_to_kernel)
 
         .section .text.entry, "ax", @progbits
 
@@ -230,6 +231,7 @@ iret_exit_to_guest:
         addq  $8,%rsp
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+ENDPROC(restore_all_guest)
 
 /*
  * When entering SYSCALL from kernel mode:
@@ -281,6 +283,7 @@ ENTRY(lstar_enter)
         mov   %rsp, %rdi
         call  pv_hypercall
         jmp   test_all_events
+ENDPROC(lstar_enter)
 
 /* See lstar_enter for entry register state. */
 ENTRY(cstar_enter)
@@ -320,6 +323,7 @@ ENTRY(cstar_enter)
         jne   compat_syscall
 #endif
         jmp   switch_to_kernel
+ENDPROC(cstar_enter)
 
 ENTRY(sysenter_entry)
         ENDBR64
@@ -384,6 +388,7 @@ UNLIKELY_END(sysenter_gpf)
         jne   compat_sysenter
 #endif
         jmp   .Lbounce_exception
+ENDPROC(sysenter_entry)
 
 ENTRY(int80_direct_trap)
         ENDBR64
@@ -473,6 +478,7 @@ int80_slow_path:
          */
         GET_STACK_END(14)
         jmp   handle_exception_saved
+ENDPROC(int80_direct_trap)
 
         /* create_bounce_frame & helpers don't need to be in .text.entry */
         .text
@@ -617,6 +623,7 @@ ENTRY(dom_crash_sync_extable)
         xorl  %edi,%edi
         jmp   asm_domain_crash_synchronous /* Does not return */
         .popsection
+ENDPROC(create_bounce_frame)
 #endif /* CONFIG_PV */
 
 /* --- CODE BELOW THIS LINE (MOSTLY) NOT GUEST RELATED --- */
@@ -640,10 +647,12 @@ ret_from_intr:
 #else
         jmp   test_all_events
 #endif
+ENDPROC(continue_pv_domain)
 #else
 ret_from_intr:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
+ENDPROC(ret_from_intr)
 #endif
 
         .section .text.entry, "ax", @progbits
@@ -667,6 +676,7 @@ UNLIKELY_END(exit_cr3)
 
         RESTORE_ALL adj=8
         iretq
+ENDPROC(restore_all_xen)
 
 ENTRY(common_interrupt)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
@@ -697,10 +707,12 @@ ENTRY(common_interrupt)
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp ret_from_intr
+ENDPROC(common_interrupt)
 
 ENTRY(page_fault)
         ENDBR64
         movl  $TRAP_page_fault,4(%rsp)
+ENDPROC(page_fault)
 /* No special register assumptions. */
 GLOBAL(handle_exception)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
@@ -872,12 +884,14 @@ FATAL_exception_with_ints_disabled:
         movq  %rsp,%rdi
         call  fatal_trap
         BUG   /* fatal_trap() shouldn't return. */
+ENDPROC(handle_exception)
 
 ENTRY(divide_error)
         ENDBR64
         pushq $0
         movl  $TRAP_divide_error,4(%rsp)
         jmp   handle_exception
+ENDPROC(divide_error)
 
 ENTRY(coprocessor_error)
         ENDBR64
@@ -890,72 +904,85 @@ ENTRY(simd_coprocessor_error)
         pushq $0
         movl  $TRAP_simd_error,4(%rsp)
         jmp   handle_exception
+ENDPROC(coprocessor_error)
 
 ENTRY(device_not_available)
         ENDBR64
         pushq $0
         movl  $TRAP_no_device,4(%rsp)
         jmp   handle_exception
+ENDPROC(device_not_available)
 
 ENTRY(debug)
         ENDBR64
         pushq $0
         movl  $TRAP_debug,4(%rsp)
         jmp   handle_ist_exception
+ENDPROC(debug)
 
 ENTRY(int3)
         ENDBR64
         pushq $0
         movl  $TRAP_int3,4(%rsp)
         jmp   handle_exception
+ENDPROC(int3)
 
 ENTRY(overflow)
         ENDBR64
         pushq $0
         movl  $TRAP_overflow,4(%rsp)
         jmp   handle_exception
+ENDPROC(overflow)
 
 ENTRY(bounds)
         ENDBR64
         pushq $0
         movl  $TRAP_bounds,4(%rsp)
         jmp   handle_exception
+ENDPROC(bounds)
 
 ENTRY(invalid_op)
         ENDBR64
         pushq $0
         movl  $TRAP_invalid_op,4(%rsp)
         jmp   handle_exception
+ENDPROC(invalid_op)
 
 ENTRY(invalid_TSS)
         ENDBR64
         movl  $TRAP_invalid_tss,4(%rsp)
         jmp   handle_exception
+ENDPROC(invalid_TSS)
 
 ENTRY(segment_not_present)
         ENDBR64
         movl  $TRAP_no_segment,4(%rsp)
         jmp   handle_exception
+ENDPROC(segment_not_present)
 
 ENTRY(stack_segment)
         ENDBR64
         movl  $TRAP_stack_error,4(%rsp)
         jmp   handle_exception
+ENDPROC(stack_segment)
 
 ENTRY(general_protection)
         ENDBR64
         movl  $TRAP_gp_fault,4(%rsp)
         jmp   handle_exception
+ENDPROC(general_protection)
 
 ENTRY(alignment_check)
         ENDBR64
         movl  $TRAP_alignment_check,4(%rsp)
         jmp   handle_exception
+ENDPROC(alignment_check)
 
 ENTRY(entry_CP)
         ENDBR64
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
+ENDPROC(entry_CP)
 
 ENTRY(double_fault)
         ENDBR64
@@ -981,6 +1008,7 @@ ENTRY(double_fault)
         movq  %rsp,%rdi
         call  do_double_fault
         BUG   /* do_double_fault() shouldn't return. */
+ENDPROC(double_fault)
 
         .pushsection .init.text, "ax", @progbits
 ENTRY(early_page_fault)
@@ -990,6 +1018,7 @@ ENTRY(early_page_fault)
         movq  %rsp,%rdi
         call  do_early_page_fault
         jmp   restore_all_xen
+ENDPROC(early_page_fault)
         .popsection
 
 ENTRY(nmi)
@@ -1120,17 +1149,20 @@ handle_ist_exception:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
+ENDPROC(nmi)
 
 ENTRY(machine_check)
         ENDBR64
         pushq $0
         movl  $TRAP_machine_check,4(%rsp)
         jmp   handle_ist_exception
+ENDPROC(machine_check)
 
 /* No op trap handler.  Required for kexec crash path. */
 GLOBAL(trap_nop)
         ENDBR64
         iretq
+ENDPROC(trap_nop)
 
 /* Table of automatically generated entry points.  One per vector. */
         .pushsection .init.rodata, "a", @progbits
@@ -1187,6 +1219,7 @@ autogen_stubs: /* Automatically generate
 
         vec = vec + 1
         .endr
+ENDPROC(autogen_stubs)
 
         .section .init.rodata, "a", @progbits
-        .size autogen_entrypoints, . - autogen_entrypoints
+        END(autogen_entrypoints)



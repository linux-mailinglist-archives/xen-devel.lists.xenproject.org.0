Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C9954C549
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349834.576014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pol-00040z-Bw; Wed, 15 Jun 2022 10:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349834.576014; Wed, 15 Jun 2022 10:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pol-0003yF-5f; Wed, 15 Jun 2022 10:00:07 +0000
Received: by outflank-mailman (input) for mailman id 349834;
 Wed, 15 Jun 2022 10:00:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Poj-0002HV-L6
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:00:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec46377b-ec91-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:00:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8922.eurprd04.prod.outlook.com (2603:10a6:20b:409::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 09:59:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 09:59:58 +0000
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
X-Inumbo-ID: ec46377b-ec91-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvVLUB93lJqP67tt+FG0qR1da24LvLhH6KkTmXP44R0ogij6lVBeFvRHcIyNa3VowLtCCdxD3zyQ5AHURwU3Ps/joFbFKbKtDIVni/4Wp+kJY0gtUzaT7N2pIqd5dJo4jFurDD+PdC3Kr29sCCqMOoLbGublea/B3pJO8obhDOl0H2iNo/IBIxJnsbaRQW/W48bsmRIwiaRHA4BvxWvnH6gchPNGjdARQIj3lGdrIOoMyf7brHBzciV1Zbg+/jJuNf/A8ICJtS0FyokvVrk9BUEQoJ9tYsD1ofpS1na4lY3xG4JY8mScY1hlupcMHWb8+SA9sJcMet9CLDrPh7/a8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFeNkGoA7GVTPX3Ebz960vl8asOl7Mbo0PLrmJyer5I=;
 b=BpPn4N2ggntVAUYsMGlpu5dX4qJgGlBD3+JCI4tbIFVif4IgZtC+4Qeh5tSTTJHxNBXEsNBEFp1xdwYSH0sWiXYCirHkThSq2FU0or/hJ4Trw2zp5iS8+hqx9ZnUdf6XeGFamBLEHHvWWiDcuRtgG4wY4y6+1VO+GFkrXL6EHk1nkrkJUFNBMNF+EtnX0TjJmHfDycQjfFqCM3TTTdE/J3B/iv4SZuPCJOCjdbpARMFopRihFuyL0nMpclDs17N9gHv2eb4NFSeCp9J3o4e0T89CenqtAPnKMczcx6Jv6dI3XLr41JC862iZIR86bcX6TndTkX2VQY+g1djHyhoSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFeNkGoA7GVTPX3Ebz960vl8asOl7Mbo0PLrmJyer5I=;
 b=iI8nBZO/5KEq+ji0yhDsmEA7I4kJnBIDIX1+FuWN+quG1Mhgk1IG/F+JYwDZeRW8B85UYu51wTge86BVrT2iiXdvskUVo8aXY2Lgni1M0erg6kJCv3ymmDgUhSqRtMESsh7T3FfNtRwXi7FgiCt6pSc3DjdFbx9Am9Xl2Q2fCxvH4WAE1Jq6ADqr5Ktr2xkwg9iac5vB+w+f8SfjW0pBt0zeKjnk2mpCZ1Zl0uxvJ5A5jLUKGBi9VEj5eIAyMQxXWyXx+OypcTYt9BGdRrCGe8eZ6pNj1OO9eQY/Pj23ZwHoj413B7g5+FyvL3xNk0Ti9xV6s/MVVWMy0sEBOtFvEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d86448f-7bc1-245d-fc4f-18b1c816d728@suse.com>
Date: Wed, 15 Jun 2022 11:59:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 4/8] x86emul: split off FPU opcode handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0075.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3714297-3b7b-44fc-a887-08da4eb5ce3e
X-MS-TrafficTypeDiagnostic: AM9PR04MB8922:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB892229966B3E8BF47974D2D3B3AD9@AM9PR04MB8922.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3kjeu2/hcx5PbyejHVinabsfdYSBf/2zceK81FTCh4U2+r4JLKJGq3qPOOj9nWyniN3BQ8/M5uFFrEQ8v0Hvk70yhEMZiJuISVt+f3kngSWYmZ+urdWK4MKCORW3CuelMD6ZJwKnM5wmQlMrmD+s3dUlRrq3VJjHi/kPzNelabrIRqNsC6Dj6+vnzFdSDPUJSKOJ1eBKpUc8AiJ+RE5BbjtnJzhe2vJQv4KVQpoqYwuRjXWdn1SrJWNx4mY2EIDoLSRGX/HJ4VXQYZHKXaLDOIKa3ZfRhK2KZTAtLe+umppK904yrhS5lGMv5N2wtl1H8kqiUpI7kIzy9JRyr068kaB+i/gy0ieCmhmEHq/Z4wWyFSeJBdz7aoUEoXslWpE1pv8lCsROq5vW/0fSixKaUuTx6FC5YrRpO0MABs6zA29avzjx48tSboXT37Ho9FoPq/EX4CgGShthxpE9OYHETtZJHX7B3v0KaS/KQ6MzKJQqhDmYUfsgX9Gia5MfNOv+76dNIUpEu1oGTyl4Y2j/mdZbxiL0zfAj9cm+9rAifgPNRoTbYEBJqlS5duM79MTV43vbfTKxrM8N3hq8WThqvUB6OgiS25t5QqWJQu1l9DF43eNFmMoNwGuJ6yjUj6aRQ6YJcS0goESzi76jI/bQKU2JEaBKDHcbmvZtHM+VDPOktugiF1tjKh6alkgDhc6mCYFmfRrv9G22D219/xNEpw4jcNKO31ejxzvhtEKteXFgy9MCXYbWuqubj3+z9bd5AeXQ8iDpuCxNBaV57Cfwd+3nV3jGv61p8U6oV1dQnUruTFOXWdU/VXgWUtr2QavRU39p+O+Lnho/IH83S3Rt+PGXdYwvknkZp4Z6wiv+SZBjtkJxBb0x9262tKMsAJqL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(186003)(2616005)(31686004)(36756003)(38100700002)(2906002)(6512007)(316002)(6486002)(5660300002)(86362001)(6506007)(66556008)(26005)(6916009)(508600001)(8676002)(66946007)(4326008)(8936002)(66476007)(31696002)(54906003)(30864003)(2004002)(45980500001)(43740500002)(579004)(559001)(127564004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1BKQkxqOXhkTHIxSEJTN0MzOEo5bC9PZklxclRUdkVreXFTemRCV1A3YWVX?=
 =?utf-8?B?YlQyeHFPQW5NNExwS3VRSFp5Z3ZrR3B1ZnhXVHdScG9Wc3hzRjFyWFFNcUda?=
 =?utf-8?B?YnNERUhkTnBIczRYWlhleXc5VWcreEJ6Y09IWWludnQrVWVuK0E0bVIydDRN?=
 =?utf-8?B?SDhWUDVvU1J3TEYrTGQ4L1QzNXZpcGdWdExHZmVaZE9uMGI3RFN0MmdBSVpv?=
 =?utf-8?B?MGFnYVBQaTBXT2pIVzMxS1RrQVUwUCtveEdMbkJBaFYvc3VzU1lQZE5uZjht?=
 =?utf-8?B?UWZEK21ndUN4eFRXS1BuMllqdXhtbU9CZTBzLzhBWEMvOUNLUStZYm95Q00w?=
 =?utf-8?B?UkRBeEV1QVZySllzVnVmUG9vY1l2WGk1eTVoTlR2NUEwTkl0TkRPcm42VEdv?=
 =?utf-8?B?aFRvTzVNMENTVFRBazZXcUJYU3NzTldERG9CdnJQeCtUa2hpYnRmT04zK2c2?=
 =?utf-8?B?bzh5OWNLSmtjZnlwNFl1THBNRUM3OXEwbmtvZnRmODduTFNQVFVDcVE2OVIr?=
 =?utf-8?B?N0dHL2duc3pjOS9KRVFmT2w4UXlBblB4azF5OHBvQXFEdFM2RHdrcUUraVgy?=
 =?utf-8?B?Qk9GMTF1ay9ON3A3NG1TTDVhZ1lrQ2l4Z1QxWHhmdEYrTjlFWXVpSjFmd3la?=
 =?utf-8?B?c3hJbm9xNVh0YkVNMmdkblUzamlLZk5ReTNRVkNRWWRCcDZzanhSamJrTXIz?=
 =?utf-8?B?TlRRM2RmWko1MitsY295dHNBOTY5bXB6bGp1ZEp1VjVxUzN5RGE2NGhhOGd4?=
 =?utf-8?B?d3FoSlAvVU9NU1JnY1NMSHNJR1dXTXlaeHFaVUl4YWI0MnNCQkY1VldlVU1r?=
 =?utf-8?B?Y2hlZkJNMmVjckMxR2tUOFcyb3hEbVpxSXBGbk8wTjhpQVR3ZlpjeG5CRkJQ?=
 =?utf-8?B?SWhhbEl6SS9HVnp0K3dFVHNWaUFobkNTanFIYm1CSE5LQkJCQlZtK2Y0Qlgx?=
 =?utf-8?B?QUVIMitJVHFhM2V5Mm5IaFBtdm1zbkxRb3hXVFJnMzhKOTg0UmFMZlVQWUVQ?=
 =?utf-8?B?cVBPTUJidG1oZy8rNDBJcTRaYyt1YkhBRGM4MWl6K0sySHRNcHFYS2tjT1Nt?=
 =?utf-8?B?VUtib1JxT2VsdjBLaXZncU5telcvKzUzazRPK3pWNHFSVTBZNHdCRTU5Umg1?=
 =?utf-8?B?elhjUW1uV3pVV0RXdzkzRXgyVzBIQndVQng0Ty9IeFhLRVV2MVpaN1l1Ti9T?=
 =?utf-8?B?enNNMm4rRHZBS2s5RmZyNkVuVENMQ3FHYkxDOUxSOC9Wb3gvVHpmM1ppcEVs?=
 =?utf-8?B?V0QxblZQeHF2Q1ZMNVBjNzJmTzc0eTJNL09YZjRqOHZoKzFlbFFIMFRScGxB?=
 =?utf-8?B?T1NlYzQ1Wkh6M0pRcG91bzRqSnVHdkQvaStkWDl2NmNMZUptT3F0bkl4QjRP?=
 =?utf-8?B?NWV1SUIvQkQ0N1VtTEIvcEQvZDkxQTl4MWFocTdkYTZMQ3JKdkczMm12WG96?=
 =?utf-8?B?WnVIWjh2Rkc2bndrM1ZhbHRVTnlsUS9abkZqN053L1JhTEIwbDNWWkwyb0tZ?=
 =?utf-8?B?RnJZWGJtYkxzS0N2aGw5SUxTaitkeWU4M2lyMkFVd0I5M0dLNFdWUExsd2wy?=
 =?utf-8?B?SUlwaVZob0dYd3NlaFUwMkdSQkExNHFCV1J2TUtmdFJWdTkyYnd2ZEkzQ09Y?=
 =?utf-8?B?RVhEeEJWK1pGQThlZWhsN2RBc0w5aDdSLzhxemR6WS9qK0dKNHdMaUw4Z1dB?=
 =?utf-8?B?cnlvMzZDMjgrWWcvMGFiWm1YRGRiZUhoU1UyNm1lUFpTN0YwVlYyblZ1end0?=
 =?utf-8?B?eHRlTzJtc1R2NHM2c2pwSXhEdWVKai90S3prYnNYSnlmOWNTem4wNzhTUWda?=
 =?utf-8?B?VzR6NU1EQUJCTFNxRGhxK1NETWN1L21KbTlzQStIL1Jxb3JBdHNOLzJ5SHV4?=
 =?utf-8?B?ZTNYaGxTV040cGJ4Q2F2UGJWdGozd0Q1ZWloK3hpQ043c1Z3SlR2UU9Yb3VR?=
 =?utf-8?B?VHhER1dwQ2xNK3JYQmMrRDRJb1VWN2xNWWlTUVJFVGc1aWVkcm1peEhxek9l?=
 =?utf-8?B?dk0rMkROTjZZdUhPQnk3dUxadStBZnJsNEl0eFdCRVM4Q2J5ZXdDbHM0R2ZI?=
 =?utf-8?B?eTlkL2hnYWhHckVGb2hpa2x1M29TU1JJc1h6RW9jdEZBWEZXdFMyLy8ydTZB?=
 =?utf-8?B?UzlTcGphZ1diQjhqYmZpaEZEK2hQbTZmL1dWYjl1dTg2WWlEREg5ZFRnQVpo?=
 =?utf-8?B?Y2NueHQzRVFjbHdqQ2laZms0SkMrTzR2WVkyZzR6aFJRcldBRktva2hlOGg5?=
 =?utf-8?B?RHhTQndDSFVrNjc1RnNFRHI3UlQzZStKMzg0TThYdVZtd2hzTjBXS1hVN3Vx?=
 =?utf-8?B?Q0lvWHBERDVINkQ3cDEyYWxjVklKUzF3bEQvY1M3QjV6aUJ2TzlUZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3714297-3b7b-44fc-a887-08da4eb5ce3e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:59:58.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fa6NSS679gHg2RYKCt/o5jF99y3gHU+XzvYRyNACV3pB0rK98jsCNkg7V8QuPeUWINWTmCauTTJ5cX1SDCLHpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8922

Some of the helper functions/macros are needed only for this, and the
code is otherwise relatively independent of other parts of the emulator.

Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
by X86_EXC_* (such that EXC_* don't need to move as well; we want these
to be phased out anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base.

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -36,6 +36,7 @@ x86_emulate.h := x86-emulate.h x86_emula
 
 OBJS := fuzz-emul.o x86-emulate.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
+OBJS += x86_emulate/fpu.o
 
 # x86-emulate.c will be implicit for both
 x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(x86_emulate.h) x86_emulate/private.h
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -252,6 +252,7 @@ endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
+OBJS += x86_emulate/fpu.o
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -29,12 +29,6 @@
 # define __OP          "r"  /* Operand Prefix */
 #endif
 
-#define get_stub(stb) ({                         \
-    assert(!(stb).addr);                         \
-    (void *)((stb).addr = (uintptr_t)(stb).buf); \
-})
-#define put_stub(stb) ((stb).addr = 0)
-
 uint32_t mxcsr_mask = 0x0000ffbf;
 struct cpuid_policy cp;
 
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,3 +1,4 @@
 obj-y += 0f01.o
 obj-y += 0fae.o
 obj-y += 0fc7.o
+obj-$(CONFIG_HVM) += fpu.o
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -0,0 +1,491 @@
+/******************************************************************************
+ * x86_emulate.c
+ *
+ * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
+ *
+ * Copyright (c) 2005-2007 Keir Fraser
+ * Copyright (c) 2005-2007 XenSource Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "private.h"
+
+#ifdef __XEN__
+# include <asm/amd.h>
+# define cpu_has_amd_erratum(nr) \
+         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
+#else
+# define cpu_has_amd_erratum(nr) 0
+#endif
+
+/* Floating point status word definitions. */
+#define FSW_ES    (1U << 7)
+
+static inline bool fpu_check_write(void)
+{
+    uint16_t fsw;
+
+    asm ( "fnstsw %0" : "=am" (fsw) );
+
+    return !(fsw & FSW_ES);
+}
+
+#define emulate_fpu_insn_memdst(opc, ext, arg)                          \
+do {                                                                    \
+    /* ModRM: mod=0, reg=ext, rm=0, i.e. a (%rax) operand */            \
+    *insn_bytes = 2;                                                    \
+    memcpy(get_stub(stub),                                              \
+           ((uint8_t[]){ opc, ((ext) & 7) << 3, 0xc3 }), 3);            \
+    invoke_stub("", "", "+m" (arg) : "a" (&(arg)));                     \
+    put_stub(stub);                                                     \
+} while (0)
+
+#define emulate_fpu_insn_memsrc(opc, ext, arg)                          \
+do {                                                                    \
+    /* ModRM: mod=0, reg=ext, rm=0, i.e. a (%rax) operand */            \
+    memcpy(get_stub(stub),                                              \
+           ((uint8_t[]){ opc, ((ext) & 7) << 3, 0xc3 }), 3);            \
+    invoke_stub("", "", "=m" (dummy) : "m" (arg), "a" (&(arg)));        \
+    put_stub(stub);                                                     \
+} while (0)
+
+#define emulate_fpu_insn_stub(bytes...)                                 \
+do {                                                                    \
+    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
+    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
+    invoke_stub("", "", "=m" (dummy) : "i" (0));                        \
+    put_stub(stub);                                                     \
+} while (0)
+
+#define emulate_fpu_insn_stub_eflags(bytes...)                          \
+do {                                                                    \
+    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
+    unsigned long tmp_;                                                 \
+    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
+    invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),             \
+                _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),            \
+                [eflags] "+g" (regs->eflags), [tmp] "=&r" (tmp_)        \
+                : [mask] "i" (X86_EFLAGS_ZF|X86_EFLAGS_PF|X86_EFLAGS_CF)); \
+    put_stub(stub);                                                     \
+} while (0)
+
+int x86emul_fpu(struct x86_emulate_state *s,
+                struct cpu_user_regs *regs,
+                struct operand *dst,
+                struct operand *src,
+                struct x86_emulate_ctxt *ctxt,
+                const struct x86_emulate_ops *ops,
+                unsigned int *insn_bytes,
+                enum x86_emulate_fpu_type *fpu_type,
+#define fpu_type (*fpu_type) /* for get_fpu() */
+                struct stub_exn *stub_exn,
+#define stub_exn (*stub_exn) /* for invoke_stub() */
+                mmval_t *mmvalp)
+{
+    uint8_t b;
+    int rc;
+    struct x86_emulate_stub stub = {};
+
+    switch ( b = ctxt->opcode )
+    {
+        unsigned long dummy;
+
+    case 0x9b:  /* wait/fwait */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_wait);
+        emulate_fpu_insn_stub(b);
+        break;
+
+    case 0xd8: /* FPU 0xd8 */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* fadd %stN,%st */
+        case 0xc8 ... 0xcf: /* fmul %stN,%st */
+        case 0xd0 ... 0xd7: /* fcom %stN,%st */
+        case 0xd8 ... 0xdf: /* fcomp %stN,%st */
+        case 0xe0 ... 0xe7: /* fsub %stN,%st */
+        case 0xe8 ... 0xef: /* fsubr %stN,%st */
+        case 0xf0 ... 0xf7: /* fdiv %stN,%st */
+        case 0xf8 ... 0xff: /* fdivr %stN,%st */
+            emulate_fpu_insn_stub(0xd8, s->modrm);
+            break;
+        default:
+        fpu_memsrc32:
+            ASSERT(s->ea.type == OP_MEM);
+            if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, &src->val,
+                                 4, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, src->val);
+            break;
+        }
+        break;
+
+    case 0xd9: /* FPU 0xd9 */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xfb: /* fsincos */
+            fail_if(cpu_has_amd_erratum(573));
+            /* fall through */
+        case 0xc0 ... 0xc7: /* fld %stN */
+        case 0xc8 ... 0xcf: /* fxch %stN */
+        case 0xd0: /* fnop */
+        case 0xd8 ... 0xdf: /* fstp %stN (alternative encoding) */
+        case 0xe0: /* fchs */
+        case 0xe1: /* fabs */
+        case 0xe4: /* ftst */
+        case 0xe5: /* fxam */
+        case 0xe8: /* fld1 */
+        case 0xe9: /* fldl2t */
+        case 0xea: /* fldl2e */
+        case 0xeb: /* fldpi */
+        case 0xec: /* fldlg2 */
+        case 0xed: /* fldln2 */
+        case 0xee: /* fldz */
+        case 0xf0: /* f2xm1 */
+        case 0xf1: /* fyl2x */
+        case 0xf2: /* fptan */
+        case 0xf3: /* fpatan */
+        case 0xf4: /* fxtract */
+        case 0xf5: /* fprem1 */
+        case 0xf6: /* fdecstp */
+        case 0xf7: /* fincstp */
+        case 0xf8: /* fprem */
+        case 0xf9: /* fyl2xp1 */
+        case 0xfa: /* fsqrt */
+        case 0xfc: /* frndint */
+        case 0xfd: /* fscale */
+        case 0xfe: /* fsin */
+        case 0xff: /* fcos */
+            emulate_fpu_insn_stub(0xd9, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            switch ( s->modrm_reg & 7 )
+            {
+            case 0: /* fld m32fp */
+                goto fpu_memsrc32;
+            case 2: /* fst m32fp */
+            case 3: /* fstp m32fp */
+            fpu_memdst32:
+                *dst = s->ea;
+                dst->bytes = 4;
+                emulate_fpu_insn_memdst(b, s->modrm_reg & 7, dst->val);
+                break;
+            case 4: /* fldenv */
+                /* Raise #MF now if there are pending unmasked exceptions. */
+                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
+                /* fall through */
+            case 6: /* fnstenv */
+                fail_if(!ops->blk);
+                s->blk = s->modrm_reg & 2 ? blk_fst : blk_fld;
+                /*
+                 * REX is meaningless for these insns by this point - (ab)use
+                 * the field to communicate real vs protected mode to ->blk().
+                 */
+                s->rex_prefix = in_protmode(ctxt, ops);
+                if ( (rc = ops->blk(s->ea.mem.seg, s->ea.mem.off, NULL,
+                                    s->op_bytes > 2 ? sizeof(struct x87_env32)
+                                                    : sizeof(struct x87_env16),
+                                    &regs->eflags,
+                                    s, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                s->fpu_ctrl = true;
+                break;
+            case 5: /* fldcw m2byte */
+                s->fpu_ctrl = true;
+            fpu_memsrc16:
+                if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, &src->val,
+                                     2, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, src->val);
+                break;
+            case 7: /* fnstcw m2byte */
+                s->fpu_ctrl = true;
+            fpu_memdst16:
+                *dst = s->ea;
+                dst->bytes = 2;
+                emulate_fpu_insn_memdst(b, s->modrm_reg & 7, dst->val);
+                break;
+            default:
+                generate_exception(X86_EXC_UD);
+            }
+            /*
+             * Control instructions can't raise FPU exceptions, so we need
+             * to consider suppressing writes only for non-control ones.
+             */
+            if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
+                dst->type = OP_NONE;
+        }
+        break;
+
+    case 0xda: /* FPU 0xda */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* fcmovb %stN */
+        case 0xc8 ... 0xcf: /* fcmove %stN */
+        case 0xd0 ... 0xd7: /* fcmovbe %stN */
+        case 0xd8 ... 0xdf: /* fcmovu %stN */
+            vcpu_must_have(cmov);
+            emulate_fpu_insn_stub_eflags(0xda, s->modrm);
+            break;
+        case 0xe9:          /* fucompp */
+            emulate_fpu_insn_stub(0xda, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            goto fpu_memsrc32;
+        }
+        break;
+
+    case 0xdb: /* FPU 0xdb */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* fcmovnb %stN */
+        case 0xc8 ... 0xcf: /* fcmovne %stN */
+        case 0xd0 ... 0xd7: /* fcmovnbe %stN */
+        case 0xd8 ... 0xdf: /* fcmovnu %stN */
+        case 0xe8 ... 0xef: /* fucomi %stN */
+        case 0xf0 ... 0xf7: /* fcomi %stN */
+            vcpu_must_have(cmov);
+            emulate_fpu_insn_stub_eflags(0xdb, s->modrm);
+            break;
+        case 0xe0: /* fneni - 8087 only, ignored by 287 */
+        case 0xe1: /* fndisi - 8087 only, ignored by 287 */
+        case 0xe2: /* fnclex */
+        case 0xe3: /* fninit */
+        case 0xe4: /* fnsetpm - 287 only, ignored by 387 */
+        /* case 0xe5: frstpm - 287 only, #UD on 387 */
+            s->fpu_ctrl = true;
+            emulate_fpu_insn_stub(0xdb, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            switch ( s->modrm_reg & 7 )
+            {
+            case 0: /* fild m32i */
+                goto fpu_memsrc32;
+            case 1: /* fisttp m32i */
+                host_and_vcpu_must_have(sse3);
+                /* fall through */
+            case 2: /* fist m32i */
+            case 3: /* fistp m32i */
+                goto fpu_memdst32;
+            case 5: /* fld m80fp */
+            fpu_memsrc80:
+                if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, mmvalp,
+                                     10, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, *mmvalp);
+                break;
+            case 7: /* fstp m80fp */
+            fpu_memdst80:
+                fail_if(!ops->write);
+                emulate_fpu_insn_memdst(b, s->modrm_reg & 7, *mmvalp);
+                if ( fpu_check_write() &&
+                     (rc = ops->write(s->ea.mem.seg, s->ea.mem.off, mmvalp,
+                                      10, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                break;
+            default:
+                generate_exception(X86_EXC_UD);
+            }
+        }
+        break;
+
+    case 0xdc: /* FPU 0xdc */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* fadd %st,%stN */
+        case 0xc8 ... 0xcf: /* fmul %st,%stN */
+        case 0xd0 ... 0xd7: /* fcom %stN,%st (alternative encoding) */
+        case 0xd8 ... 0xdf: /* fcomp %stN,%st (alternative encoding) */
+        case 0xe0 ... 0xe7: /* fsubr %st,%stN */
+        case 0xe8 ... 0xef: /* fsub %st,%stN */
+        case 0xf0 ... 0xf7: /* fdivr %st,%stN */
+        case 0xf8 ... 0xff: /* fdiv %st,%stN */
+            emulate_fpu_insn_stub(0xdc, s->modrm);
+            break;
+        default:
+        fpu_memsrc64:
+            ASSERT(s->ea.type == OP_MEM);
+            if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, &src->val,
+                                 8, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, src->val);
+            break;
+        }
+        break;
+
+    case 0xdd: /* FPU 0xdd */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* ffree %stN */
+        case 0xc8 ... 0xcf: /* fxch %stN (alternative encoding) */
+        case 0xd0 ... 0xd7: /* fst %stN */
+        case 0xd8 ... 0xdf: /* fstp %stN */
+        case 0xe0 ... 0xe7: /* fucom %stN */
+        case 0xe8 ... 0xef: /* fucomp %stN */
+            emulate_fpu_insn_stub(0xdd, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            switch ( s->modrm_reg & 7 )
+            {
+            case 0: /* fld m64fp */;
+                goto fpu_memsrc64;
+            case 1: /* fisttp m64i */
+                host_and_vcpu_must_have(sse3);
+                /* fall through */
+            case 2: /* fst m64fp */
+            case 3: /* fstp m64fp */
+            fpu_memdst64:
+                *dst = s->ea;
+                dst->bytes = 8;
+                emulate_fpu_insn_memdst(b, s->modrm_reg & 7, dst->val);
+                break;
+            case 4: /* frstor */
+                /* Raise #MF now if there are pending unmasked exceptions. */
+                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
+                /* fall through */
+            case 6: /* fnsave */
+                fail_if(!ops->blk);
+                s->blk = s->modrm_reg & 2 ? blk_fst : blk_fld;
+                /*
+                 * REX is meaningless for these insns by this point - (ab)use
+                 * the field to communicate real vs protected mode to ->blk().
+                 */
+                s->rex_prefix = in_protmode(ctxt, ops);
+                if ( (rc = ops->blk(s->ea.mem.seg, s->ea.mem.off, NULL,
+                                    s->op_bytes > 2 ? sizeof(struct x87_env32) + 80
+                                                    : sizeof(struct x87_env16) + 80,
+                                    &regs->eflags,
+                                    s, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                s->fpu_ctrl = true;
+                break;
+            case 7: /* fnstsw m2byte */
+                s->fpu_ctrl = true;
+                goto fpu_memdst16;
+            default:
+                generate_exception(X86_EXC_UD);
+            }
+            /*
+             * Control instructions can't raise FPU exceptions, so we need
+             * to consider suppressing writes only for non-control ones.
+             */
+            if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
+                dst->type = OP_NONE;
+        }
+        break;
+
+    case 0xde: /* FPU 0xde */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* faddp %stN */
+        case 0xc8 ... 0xcf: /* fmulp %stN */
+        case 0xd0 ... 0xd7: /* fcomp %stN (alternative encoding) */
+        case 0xd9: /* fcompp */
+        case 0xe0 ... 0xe7: /* fsubrp %stN */
+        case 0xe8 ... 0xef: /* fsubp %stN */
+        case 0xf0 ... 0xf7: /* fdivrp %stN */
+        case 0xf8 ... 0xff: /* fdivp %stN */
+            emulate_fpu_insn_stub(0xde, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, src->val);
+            break;
+        }
+        break;
+
+    case 0xdf: /* FPU 0xdf */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xe0:
+            /* fnstsw %ax */
+            s->fpu_ctrl = true;
+            dst->bytes = 2;
+            dst->type = OP_REG;
+            dst->reg = (void *)&regs->ax;
+            emulate_fpu_insn_memdst(b, s->modrm_reg & 7, dst->val);
+            break;
+        case 0xe8 ... 0xef: /* fucomip %stN */
+        case 0xf0 ... 0xf7: /* fcomip %stN */
+            vcpu_must_have(cmov);
+            emulate_fpu_insn_stub_eflags(0xdf, s->modrm);
+            break;
+        case 0xc0 ... 0xc7: /* ffreep %stN */
+        case 0xc8 ... 0xcf: /* fxch %stN (alternative encoding) */
+        case 0xd0 ... 0xd7: /* fstp %stN (alternative encoding) */
+        case 0xd8 ... 0xdf: /* fstp %stN (alternative encoding) */
+            emulate_fpu_insn_stub(0xdf, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            switch ( s->modrm_reg & 7 )
+            {
+            case 0: /* fild m16i */
+                goto fpu_memsrc16;
+            case 1: /* fisttp m16i */
+                host_and_vcpu_must_have(sse3);
+                /* fall through */
+            case 2: /* fist m16i */
+            case 3: /* fistp m16i */
+                goto fpu_memdst16;
+            case 4: /* fbld m80dec */
+                goto fpu_memsrc80;
+            case 5: /* fild m64i */
+                dst->type = OP_NONE;
+                goto fpu_memsrc64;
+            case 6: /* fbstp packed bcd */
+                goto fpu_memdst80;
+            case 7: /* fistp m64i */
+                goto fpu_memdst64;
+            }
+        }
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+    rc = X86EMUL_OKAY;
+
+ done:
+    put_stub(stub);
+    return rc;
+
+#ifdef __XEN__
+ emulation_stub_failure:
+    return X86EMUL_stub_failure;
+#endif
+}
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -21,6 +21,7 @@
 #ifdef __XEN__
 
 # include <xen/kernel.h>
+# include <asm/endbr.h>
 # include <asm/msr-index.h>
 # include <asm/x86_emulate.h>
 
@@ -339,12 +340,57 @@ struct x86_fxsr {
     uint64_t avl[6];
 };
 
+#ifndef X86EMUL_NO_FPU
+struct x87_env16 {
+    uint16_t fcw;
+    uint16_t fsw;
+    uint16_t ftw;
+    union {
+        struct {
+            uint16_t fip_lo;
+            uint16_t fop:11, :1, fip_hi:4;
+            uint16_t fdp_lo;
+            uint16_t :12, fdp_hi:4;
+        } real;
+        struct {
+            uint16_t fip;
+            uint16_t fcs;
+            uint16_t fdp;
+            uint16_t fds;
+        } prot;
+    } mode;
+};
+
+struct x87_env32 {
+    uint32_t fcw:16, :16;
+    uint32_t fsw:16, :16;
+    uint32_t ftw:16, :16;
+    union {
+        struct {
+            /* some CPUs/FPUs also store the full FIP here */
+            uint32_t fip_lo:16, :16;
+            uint32_t fop:11, :1, fip_hi:16, :4;
+            /* some CPUs/FPUs also store the full FDP here */
+            uint32_t fdp_lo:16, :16;
+            uint32_t :12, fdp_hi:16, :4;
+        } real;
+        struct {
+            uint32_t fip;
+            uint32_t fcs:16, fop:11, :5;
+            uint32_t fdp;
+            uint32_t fds:16, :16;
+        } prot;
+    } mode;
+};
+#endif
+
 /*
  * Externally visible return codes from x86_emulate() are non-negative.
  * Use negative values for internal state change indicators from helpers
  * to the main function.
  */
 #define X86EMUL_rdtsc        (-1)
+#define X86EMUL_stub_failure (-2)
 
 /*
  * These EFLAGS bits are restored from saved value during emulation, and
@@ -541,6 +587,122 @@ amd_like(const struct x86_emulate_ctxt *
 # define host_and_vcpu_must_have(feat) vcpu_must_have(feat)
 #endif
 
+/*
+ * Instruction emulation:
+ * Most instructions are emulated directly via a fragment of inline assembly
+ * code. This allows us to save/restore EFLAGS and thus very easily pick up
+ * any modified flags.
+ */
+
+#if defined(__x86_64__)
+#define _LO32 "k"          /* force 32-bit operand */
+#define _STK  "%%rsp"      /* stack pointer */
+#define _BYTES_PER_LONG "8"
+#elif defined(__i386__)
+#define _LO32 ""           /* force 32-bit operand */
+#define _STK  "%%esp"      /* stack pointer */
+#define _BYTES_PER_LONG "4"
+#endif
+
+/* Before executing instruction: restore necessary bits in EFLAGS. */
+#define _PRE_EFLAGS(_sav, _msk, _tmp)                           \
+/* EFLAGS = (_sav & _msk) | (EFLAGS & ~_msk); _sav &= ~_msk; */ \
+"movl %"_LO32 _sav",%"_LO32 _tmp"; "                            \
+"push %"_tmp"; "                                                \
+"push %"_tmp"; "                                                \
+"movl %"_msk",%"_LO32 _tmp"; "                                  \
+"andl %"_LO32 _tmp",("_STK"); "                                 \
+"pushf; "                                                       \
+"notl %"_LO32 _tmp"; "                                          \
+"andl %"_LO32 _tmp",("_STK"); "                                 \
+"andl %"_LO32 _tmp",2*"_BYTES_PER_LONG"("_STK"); "              \
+"pop  %"_tmp"; "                                                \
+"orl  %"_LO32 _tmp",("_STK"); "                                 \
+"popf; "                                                        \
+"pop  %"_tmp"; "                                                \
+"movl %"_LO32 _tmp",%"_LO32 _sav"; "
+
+/* After executing instruction: write-back necessary bits in EFLAGS. */
+#define _POST_EFLAGS(_sav, _msk, _tmp)          \
+/* _sav |= EFLAGS & _msk; */                    \
+"pushf; "                                       \
+"pop  %"_tmp"; "                                \
+"andl %"_msk",%"_LO32 _tmp"; "                  \
+"orl  %"_LO32 _tmp",%"_LO32 _sav"; "
+
+#ifdef __XEN__
+
+# include <xen/domain_page.h>
+# include <asm/uaccess.h>
+
+# define get_stub(stb) ({                                    \
+    void *ptr;                                               \
+    BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX_INST_LEN + 1);      \
+    ASSERT(!(stb).ptr);                                      \
+    (stb).addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;   \
+    (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
+        ((stb).addr & ~PAGE_MASK);                           \
+    ptr = memset((stb).ptr, 0xcc, STUB_BUF_SIZE / 2);        \
+    if ( cpu_has_xen_ibt )                                   \
+    {                                                        \
+        place_endbr64(ptr);                                  \
+        ptr += 4;                                            \
+    }                                                        \
+    ptr;                                                     \
+})
+
+# define put_stub(stb) ({             \
+    if ( (stb).ptr )                  \
+    {                                 \
+        unmap_domain_page((stb).ptr); \
+        (stb).ptr = NULL;             \
+    }                                 \
+})
+
+
+struct stub_exn {
+    union stub_exception_token info;
+    unsigned int line;
+};
+
+# define invoke_stub(pre, post, constraints...) do {                    \
+    stub_exn.info = (union stub_exception_token) { .raw = ~0 };         \
+    stub_exn.line = __LINE__; /* Utility outweighs livepatching cost */ \
+    block_speculation(); /* SCSB */                                     \
+    asm volatile ( pre "\n\tINDIRECT_CALL %[stub]\n\t" post "\n"        \
+                   ".Lret%=:\n\t"                                       \
+                   ".pushsection .fixup,\"ax\"\n"                       \
+                   ".Lfix%=:\n\t"                                       \
+                   "pop %[exn]\n\t"                                     \
+                   "jmp .Lret%=\n\t"                                    \
+                   ".popsection\n\t"                                    \
+                   _ASM_EXTABLE(.Lret%=, .Lfix%=)                       \
+                   : [exn] "+g" (stub_exn.info) ASM_CALL_CONSTRAINT,    \
+                     constraints,                                       \
+                     [stub] "r" (stub.func),                            \
+                     "m" (*(uint8_t(*)[MAX_INST_LEN + 1])stub.ptr) );   \
+    if ( unlikely(~stub_exn.info.raw) )                                 \
+        goto emulation_stub_failure;                                    \
+} while (0)
+
+#else /* !__XEN__ */
+
+# define get_stub(stb) ({                        \
+    assert(!(stb).addr);                         \
+    (void *)((stb).addr = (uintptr_t)(stb).buf); \
+})
+
+# define put_stub(stb) ((stb).addr = 0)
+
+struct stub_exn {};
+
+# define invoke_stub(pre, post, constraints...)                         \
+    asm volatile ( pre "\n\tcall *%[stub]\n\t" post                     \
+                   : constraints, [stub] "rm" (stub.func),              \
+                     "m" (*(typeof(stub.buf) *)stub.addr) )
+
+#endif /* __XEN__ */
+
 int x86emul_get_cpl(struct x86_emulate_ctxt *ctxt,
                     const struct x86_emulate_ops *ops);
 
@@ -554,6 +716,16 @@ do {
     if ( rc ) goto done;                                        \
 } while (0)
 
+int x86emul_fpu(struct x86_emulate_state *s,
+                struct cpu_user_regs *regs,
+                struct operand *dst,
+                struct operand *src,
+                struct x86_emulate_ctxt *ctxt,
+                const struct x86_emulate_ops *ops,
+                unsigned int *insn_bytes,
+                enum x86_emulate_fpu_type *fpu_type,
+                struct stub_exn *stub_exn,
+                mmval_t *mmvalp);
 int x86emul_0f01(struct x86_emulate_state *s,
                  struct cpu_user_regs *regs,
                  struct operand *dst,
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -643,50 +643,6 @@ static const uint8_t sse_prefix[] = { 0x
 #define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
 #endif
 
-#ifndef X86EMUL_NO_FPU
-struct x87_env16 {
-    uint16_t fcw;
-    uint16_t fsw;
-    uint16_t ftw;
-    union {
-        struct {
-            uint16_t fip_lo;
-            uint16_t fop:11, :1, fip_hi:4;
-            uint16_t fdp_lo;
-            uint16_t :12, fdp_hi:4;
-        } real;
-        struct {
-            uint16_t fip;
-            uint16_t fcs;
-            uint16_t fdp;
-            uint16_t fds;
-        } prot;
-    } mode;
-};
-
-struct x87_env32 {
-    uint32_t fcw:16, :16;
-    uint32_t fsw:16, :16;
-    uint32_t ftw:16, :16;
-    union {
-        struct {
-            /* some CPUs/FPUs also store the full FIP here */
-            uint32_t fip_lo:16, :16;
-            uint32_t fop:11, :1, fip_hi:16, :4;
-            /* some CPUs/FPUs also store the full FDP here */
-            uint32_t fdp_lo:16, :16;
-            uint32_t :12, fdp_hi:16, :4;
-        } real;
-        struct {
-            uint32_t fip;
-            uint32_t fcs:16, fop:11, :5;
-            uint32_t fdp;
-            uint32_t fds:16, :16;
-        } prot;
-    } mode;
-};
-#endif
-
 /*
  * While proper alignment gets specified in mmval_t, this doesn't get honored
  * by the compiler for automatic variables. Use this helper to instantiate a
@@ -704,9 +660,6 @@ struct x87_env32 {
 # define ASM_FLAG_OUT(yes, no) no
 #endif
 
-/* Floating point status word definitions. */
-#define FSW_ES    (1U << 7)
-
 /* MXCSR bit definitions. */
 #define MXCSR_MM  (1U << 17)
 
@@ -737,49 +690,6 @@ struct x87_env32 {
 #define ECODE_IDT (1 << 1)
 #define ECODE_TI  (1 << 2)
 
-/*
- * Instruction emulation:
- * Most instructions are emulated directly via a fragment of inline assembly
- * code. This allows us to save/restore EFLAGS and thus very easily pick up
- * any modified flags.
- */
-
-#if defined(__x86_64__)
-#define _LO32 "k"          /* force 32-bit operand */
-#define _STK  "%%rsp"      /* stack pointer */
-#define _BYTES_PER_LONG "8"
-#elif defined(__i386__)
-#define _LO32 ""           /* force 32-bit operand */
-#define _STK  "%%esp"      /* stack pointer */
-#define _BYTES_PER_LONG "4"
-#endif
-
-/* Before executing instruction: restore necessary bits in EFLAGS. */
-#define _PRE_EFLAGS(_sav, _msk, _tmp)                           \
-/* EFLAGS = (_sav & _msk) | (EFLAGS & ~_msk); _sav &= ~_msk; */ \
-"movl %"_LO32 _sav",%"_LO32 _tmp"; "                            \
-"push %"_tmp"; "                                                \
-"push %"_tmp"; "                                                \
-"movl %"_msk",%"_LO32 _tmp"; "                                  \
-"andl %"_LO32 _tmp",("_STK"); "                                 \
-"pushf; "                                                       \
-"notl %"_LO32 _tmp"; "                                          \
-"andl %"_LO32 _tmp",("_STK"); "                                 \
-"andl %"_LO32 _tmp",2*"_BYTES_PER_LONG"("_STK"); "              \
-"pop  %"_tmp"; "                                                \
-"orl  %"_LO32 _tmp",("_STK"); "                                 \
-"popf; "                                                        \
-"pop  %"_tmp"; "                                                \
-"movl %"_LO32 _tmp",%"_LO32 _sav"; "
-
-/* After executing instruction: write-back necessary bits in EFLAGS. */
-#define _POST_EFLAGS(_sav, _msk, _tmp)          \
-/* _sav |= EFLAGS & _msk; */                    \
-"pushf; "                                       \
-"pop  %"_tmp"; "                                \
-"andl %"_msk",%"_LO32 _tmp"; "                  \
-"orl  %"_LO32 _tmp",%"_LO32 _sav"; "
-
 /* Raw emulation: instruction has two explicit operands. */
 #define __emulate_2op_nobyte(_op, src, dst, sz, eflags, wsx,wsy,wdx,wdy,   \
                              lsx,lsy,ldx,ldy, qsx,qsy,qdx,qdy, extra...)   \
@@ -913,33 +823,6 @@ do{ asm volatile (
 #define __emulate_1op_8byte(op, dst, eflags, extra...)
 #endif /* __i386__ */
 
-#ifdef __XEN__
-# define invoke_stub(pre, post, constraints...) do {                    \
-    stub_exn.info = (union stub_exception_token) { .raw = ~0 };         \
-    stub_exn.line = __LINE__; /* Utility outweighs livepatching cost */ \
-    block_speculation(); /* SCSB */                                     \
-    asm volatile ( pre "\n\tINDIRECT_CALL %[stub]\n\t" post "\n"        \
-                   ".Lret%=:\n\t"                                       \
-                   ".pushsection .fixup,\"ax\"\n"                       \
-                   ".Lfix%=:\n\t"                                       \
-                   "pop %[exn]\n\t"                                     \
-                   "jmp .Lret%=\n\t"                                    \
-                   ".popsection\n\t"                                    \
-                   _ASM_EXTABLE(.Lret%=, .Lfix%=)                       \
-                   : [exn] "+g" (stub_exn.info) ASM_CALL_CONSTRAINT,    \
-                     constraints,                                       \
-                     [stub] "r" (stub.func),                            \
-                     "m" (*(uint8_t(*)[MAX_INST_LEN + 1])stub.ptr) );   \
-    if ( unlikely(~stub_exn.info.raw) )                                 \
-        goto emulation_stub_failure;                                    \
-} while (0)
-#else
-# define invoke_stub(pre, post, constraints...)                         \
-    asm volatile ( pre "\n\tcall *%[stub]\n\t" post                     \
-                   : constraints, [stub] "rm" (stub.func),              \
-                     "m" (*(typeof(stub.buf) *)stub.addr) )
-#endif
-
 #define emulate_stub(dst, src...) do {                                  \
     unsigned long tmp;                                                  \
     invoke_stub(_PRE_EFLAGS("[efl]", "[msk]", "[tmp]"),                 \
@@ -1162,54 +1045,6 @@ static void put_fpu(
         ops->put_fpu(ctxt, X86EMUL_FPU_none, NULL);
 }
 
-static inline bool fpu_check_write(void)
-{
-    uint16_t fsw;
-
-    asm ( "fnstsw %0" : "=am" (fsw) );
-
-    return !(fsw & FSW_ES);
-}
-
-#define emulate_fpu_insn_memdst(opc, ext, arg)                          \
-do {                                                                    \
-    /* ModRM: mod=0, reg=ext, rm=0, i.e. a (%rax) operand */            \
-    insn_bytes = 2;                                                     \
-    memcpy(get_stub(stub),                                              \
-           ((uint8_t[]){ opc, ((ext) & 7) << 3, 0xc3 }), 3);            \
-    invoke_stub("", "", "+m" (arg) : "a" (&(arg)));                     \
-    put_stub(stub);                                                     \
-} while (0)
-
-#define emulate_fpu_insn_memsrc(opc, ext, arg)                          \
-do {                                                                    \
-    /* ModRM: mod=0, reg=ext, rm=0, i.e. a (%rax) operand */            \
-    memcpy(get_stub(stub),                                              \
-           ((uint8_t[]){ opc, ((ext) & 7) << 3, 0xc3 }), 3);            \
-    invoke_stub("", "", "=m" (dummy) : "m" (arg), "a" (&(arg)));        \
-    put_stub(stub);                                                     \
-} while (0)
-
-#define emulate_fpu_insn_stub(bytes...)                                 \
-do {                                                                    \
-    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
-    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
-    invoke_stub("", "", "=m" (dummy) : "i" (0));                        \
-    put_stub(stub);                                                     \
-} while (0)
-
-#define emulate_fpu_insn_stub_eflags(bytes...)                          \
-do {                                                                    \
-    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
-    unsigned long tmp_;                                                 \
-    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
-    invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),             \
-                _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),            \
-                [eflags] "+g" (_regs.eflags), [tmp] "=&r" (tmp_)        \
-                : [mask] "i" (X86_EFLAGS_ZF|X86_EFLAGS_PF|X86_EFLAGS_CF)); \
-    put_stub(stub);                                                     \
-} while (0)
-
 static inline unsigned long get_loop_count(
     const struct cpu_user_regs *regs,
     int ad_bytes)
@@ -3154,12 +2989,7 @@ x86_emulate(
     enum x86_emulate_fpu_type fpu_type = X86EMUL_FPU_none;
     struct x86_emulate_stub stub = {};
     DECLARE_ALIGNED(mmval_t, mmval);
-#ifdef __XEN__
-    struct {
-        union stub_exception_token info;
-        unsigned int line;
-    } stub_exn;
-#endif
+    struct stub_exn stub_exn = {};
 
     ASSERT(ops->read);
 
@@ -3950,10 +3780,10 @@ x86_emulate(
 
 #ifndef X86EMUL_NO_FPU
     case 0x9b:  /* wait/fwait */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_wait);
-        emulate_fpu_insn_stub(b);
-        break;
+    case 0xd8 ... 0xdf: /* FPU */
+        rc = x86emul_fpu(state, &_regs, &dst, &src, ctxt, ops,
+                         &insn_bytes, &fpu_type, &stub_exn, mmvalp);
+        goto dispatch_from_helper;
 #endif
 
     case 0x9c: /* pushf */
@@ -4364,373 +4194,6 @@ x86_emulate(
         break;
     }
 
-#ifndef X86EMUL_NO_FPU
-    case 0xd8: /* FPU 0xd8 */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* fadd %stN,%st */
-        case 0xc8 ... 0xcf: /* fmul %stN,%st */
-        case 0xd0 ... 0xd7: /* fcom %stN,%st */
-        case 0xd8 ... 0xdf: /* fcomp %stN,%st */
-        case 0xe0 ... 0xe7: /* fsub %stN,%st */
-        case 0xe8 ... 0xef: /* fsubr %stN,%st */
-        case 0xf0 ... 0xf7: /* fdiv %stN,%st */
-        case 0xf8 ... 0xff: /* fdivr %stN,%st */
-            emulate_fpu_insn_stub(0xd8, modrm);
-            break;
-        default:
-        fpu_memsrc32:
-            ASSERT(ea.type == OP_MEM);
-            if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
-                                 4, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-            break;
-        }
-        break;
-
-    case 0xd9: /* FPU 0xd9 */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xfb: /* fsincos */
-            fail_if(cpu_has_amd_erratum(573));
-            /* fall through */
-        case 0xc0 ... 0xc7: /* fld %stN */
-        case 0xc8 ... 0xcf: /* fxch %stN */
-        case 0xd0: /* fnop */
-        case 0xd8 ... 0xdf: /* fstp %stN (alternative encoding) */
-        case 0xe0: /* fchs */
-        case 0xe1: /* fabs */
-        case 0xe4: /* ftst */
-        case 0xe5: /* fxam */
-        case 0xe8: /* fld1 */
-        case 0xe9: /* fldl2t */
-        case 0xea: /* fldl2e */
-        case 0xeb: /* fldpi */
-        case 0xec: /* fldlg2 */
-        case 0xed: /* fldln2 */
-        case 0xee: /* fldz */
-        case 0xf0: /* f2xm1 */
-        case 0xf1: /* fyl2x */
-        case 0xf2: /* fptan */
-        case 0xf3: /* fpatan */
-        case 0xf4: /* fxtract */
-        case 0xf5: /* fprem1 */
-        case 0xf6: /* fdecstp */
-        case 0xf7: /* fincstp */
-        case 0xf8: /* fprem */
-        case 0xf9: /* fyl2xp1 */
-        case 0xfa: /* fsqrt */
-        case 0xfc: /* frndint */
-        case 0xfd: /* fscale */
-        case 0xfe: /* fsin */
-        case 0xff: /* fcos */
-            emulate_fpu_insn_stub(0xd9, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            switch ( modrm_reg & 7 )
-            {
-            case 0: /* fld m32fp */
-                goto fpu_memsrc32;
-            case 2: /* fst m32fp */
-            case 3: /* fstp m32fp */
-            fpu_memdst32:
-                dst = ea;
-                dst.bytes = 4;
-                emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
-                break;
-            case 4: /* fldenv */
-                /* Raise #MF now if there are pending unmasked exceptions. */
-                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
-                /* fall through */
-            case 6: /* fnstenv */
-                fail_if(!ops->blk);
-                state->blk = modrm_reg & 2 ? blk_fst : blk_fld;
-                /*
-                 * REX is meaningless for these insns by this point - (ab)use
-                 * the field to communicate real vs protected mode to ->blk().
-                 */
-                /*state->*/rex_prefix = in_protmode(ctxt, ops);
-                if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
-                                    op_bytes > 2 ? sizeof(struct x87_env32)
-                                                 : sizeof(struct x87_env16),
-                                    &_regs.eflags,
-                                    state, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                state->fpu_ctrl = true;
-                break;
-            case 5: /* fldcw m2byte */
-                state->fpu_ctrl = true;
-            fpu_memsrc16:
-                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
-                                     2, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-                break;
-            case 7: /* fnstcw m2byte */
-                state->fpu_ctrl = true;
-            fpu_memdst16:
-                dst = ea;
-                dst.bytes = 2;
-                emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
-                break;
-            default:
-                generate_exception(EXC_UD);
-            }
-            /*
-             * Control instructions can't raise FPU exceptions, so we need
-             * to consider suppressing writes only for non-control ones.
-             */
-            if ( dst.type == OP_MEM && !state->fpu_ctrl && !fpu_check_write() )
-                dst.type = OP_NONE;
-        }
-        break;
-
-    case 0xda: /* FPU 0xda */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* fcmovb %stN */
-        case 0xc8 ... 0xcf: /* fcmove %stN */
-        case 0xd0 ... 0xd7: /* fcmovbe %stN */
-        case 0xd8 ... 0xdf: /* fcmovu %stN */
-            vcpu_must_have(cmov);
-            emulate_fpu_insn_stub_eflags(0xda, modrm);
-            break;
-        case 0xe9:          /* fucompp */
-            emulate_fpu_insn_stub(0xda, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            goto fpu_memsrc32;
-        }
-        break;
-
-    case 0xdb: /* FPU 0xdb */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* fcmovnb %stN */
-        case 0xc8 ... 0xcf: /* fcmovne %stN */
-        case 0xd0 ... 0xd7: /* fcmovnbe %stN */
-        case 0xd8 ... 0xdf: /* fcmovnu %stN */
-        case 0xe8 ... 0xef: /* fucomi %stN */
-        case 0xf0 ... 0xf7: /* fcomi %stN */
-            vcpu_must_have(cmov);
-            emulate_fpu_insn_stub_eflags(0xdb, modrm);
-            break;
-        case 0xe0: /* fneni - 8087 only, ignored by 287 */
-        case 0xe1: /* fndisi - 8087 only, ignored by 287 */
-        case 0xe2: /* fnclex */
-        case 0xe3: /* fninit */
-        case 0xe4: /* fnsetpm - 287 only, ignored by 387 */
-        /* case 0xe5: frstpm - 287 only, #UD on 387 */
-            state->fpu_ctrl = true;
-            emulate_fpu_insn_stub(0xdb, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            switch ( modrm_reg & 7 )
-            {
-            case 0: /* fild m32i */
-                goto fpu_memsrc32;
-            case 1: /* fisttp m32i */
-                host_and_vcpu_must_have(sse3);
-                /* fall through */
-            case 2: /* fist m32i */
-            case 3: /* fistp m32i */
-                goto fpu_memdst32;
-            case 5: /* fld m80fp */
-            fpu_memsrc80:
-                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp,
-                                     10, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                emulate_fpu_insn_memsrc(b, modrm_reg & 7, *mmvalp);
-                break;
-            case 7: /* fstp m80fp */
-            fpu_memdst80:
-                fail_if(!ops->write);
-                emulate_fpu_insn_memdst(b, modrm_reg & 7, *mmvalp);
-                if ( fpu_check_write() &&
-                     (rc = ops->write(ea.mem.seg, ea.mem.off, mmvalp,
-                                      10, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                break;
-            default:
-                generate_exception(EXC_UD);
-            }
-        }
-        break;
-
-    case 0xdc: /* FPU 0xdc */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* fadd %st,%stN */
-        case 0xc8 ... 0xcf: /* fmul %st,%stN */
-        case 0xd0 ... 0xd7: /* fcom %stN,%st (alternative encoding) */
-        case 0xd8 ... 0xdf: /* fcomp %stN,%st (alternative encoding) */
-        case 0xe0 ... 0xe7: /* fsubr %st,%stN */
-        case 0xe8 ... 0xef: /* fsub %st,%stN */
-        case 0xf0 ... 0xf7: /* fdivr %st,%stN */
-        case 0xf8 ... 0xff: /* fdiv %st,%stN */
-            emulate_fpu_insn_stub(0xdc, modrm);
-            break;
-        default:
-        fpu_memsrc64:
-            ASSERT(ea.type == OP_MEM);
-            if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
-                                 8, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-            break;
-        }
-        break;
-
-    case 0xdd: /* FPU 0xdd */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* ffree %stN */
-        case 0xc8 ... 0xcf: /* fxch %stN (alternative encoding) */
-        case 0xd0 ... 0xd7: /* fst %stN */
-        case 0xd8 ... 0xdf: /* fstp %stN */
-        case 0xe0 ... 0xe7: /* fucom %stN */
-        case 0xe8 ... 0xef: /* fucomp %stN */
-            emulate_fpu_insn_stub(0xdd, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            switch ( modrm_reg & 7 )
-            {
-            case 0: /* fld m64fp */;
-                goto fpu_memsrc64;
-            case 1: /* fisttp m64i */
-                host_and_vcpu_must_have(sse3);
-                /* fall through */
-            case 2: /* fst m64fp */
-            case 3: /* fstp m64fp */
-            fpu_memdst64:
-                dst = ea;
-                dst.bytes = 8;
-                emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
-                break;
-            case 4: /* frstor */
-                /* Raise #MF now if there are pending unmasked exceptions. */
-                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
-                /* fall through */
-            case 6: /* fnsave */
-                fail_if(!ops->blk);
-                state->blk = modrm_reg & 2 ? blk_fst : blk_fld;
-                /*
-                 * REX is meaningless for these insns by this point - (ab)use
-                 * the field to communicate real vs protected mode to ->blk().
-                 */
-                /*state->*/rex_prefix = in_protmode(ctxt, ops);
-                if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
-                                    op_bytes > 2 ? sizeof(struct x87_env32) + 80
-                                                 : sizeof(struct x87_env16) + 80,
-                                    &_regs.eflags,
-                                    state, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                state->fpu_ctrl = true;
-                break;
-            case 7: /* fnstsw m2byte */
-                state->fpu_ctrl = true;
-                goto fpu_memdst16;
-            default:
-                generate_exception(EXC_UD);
-            }
-            /*
-             * Control instructions can't raise FPU exceptions, so we need
-             * to consider suppressing writes only for non-control ones.
-             */
-            if ( dst.type == OP_MEM && !state->fpu_ctrl && !fpu_check_write() )
-                dst.type = OP_NONE;
-        }
-        break;
-
-    case 0xde: /* FPU 0xde */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* faddp %stN */
-        case 0xc8 ... 0xcf: /* fmulp %stN */
-        case 0xd0 ... 0xd7: /* fcomp %stN (alternative encoding) */
-        case 0xd9: /* fcompp */
-        case 0xe0 ... 0xe7: /* fsubrp %stN */
-        case 0xe8 ... 0xef: /* fsubp %stN */
-        case 0xf0 ... 0xf7: /* fdivrp %stN */
-        case 0xf8 ... 0xff: /* fdivp %stN */
-            emulate_fpu_insn_stub(0xde, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-            break;
-        }
-        break;
-
-    case 0xdf: /* FPU 0xdf */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xe0:
-            /* fnstsw %ax */
-            state->fpu_ctrl = true;
-            dst.bytes = 2;
-            dst.type = OP_REG;
-            dst.reg = (void *)&_regs.ax;
-            emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
-            break;
-        case 0xe8 ... 0xef: /* fucomip %stN */
-        case 0xf0 ... 0xf7: /* fcomip %stN */
-            vcpu_must_have(cmov);
-            emulate_fpu_insn_stub_eflags(0xdf, modrm);
-            break;
-        case 0xc0 ... 0xc7: /* ffreep %stN */
-        case 0xc8 ... 0xcf: /* fxch %stN (alternative encoding) */
-        case 0xd0 ... 0xd7: /* fstp %stN (alternative encoding) */
-        case 0xd8 ... 0xdf: /* fstp %stN (alternative encoding) */
-            emulate_fpu_insn_stub(0xdf, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            switch ( modrm_reg & 7 )
-            {
-            case 0: /* fild m16i */
-                goto fpu_memsrc16;
-            case 1: /* fisttp m16i */
-                host_and_vcpu_must_have(sse3);
-                /* fall through */
-            case 2: /* fist m16i */
-            case 3: /* fistp m16i */
-                goto fpu_memdst16;
-            case 4: /* fbld m80dec */
-                goto fpu_memsrc80;
-            case 5: /* fild m64i */
-                dst.type = OP_NONE;
-                goto fpu_memsrc64;
-            case 6: /* fbstp packed bcd */
-                goto fpu_memdst80;
-            case 7: /* fistp m64i */
-                goto fpu_memdst64;
-            }
-        }
-        break;
-#endif /* !X86EMUL_NO_FPU */
-
     case 0xe0 ... 0xe2: /* loop{,z,nz} */ {
         unsigned long count = get_loop_count(&_regs, ad_bytes);
         int do_jmp = !(_regs.eflags & X86_EFLAGS_ZF); /* loopnz */
@@ -10157,6 +9620,11 @@ x86_emulate(
         {
         case X86EMUL_rdtsc:
             goto rdtsc;
+
+#ifdef __XEN__
+        case X86EMUL_stub_failure:
+            goto emulation_stub_failure;
+#endif
         }
 
         /* Internally used state change indicators may not make it here. */
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -9,7 +9,6 @@
  *    Keir Fraser <keir@xen.org>
  */
 
-#include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/event.h>
 #include <asm/x86_emulate.h>
@@ -17,7 +16,6 @@
 #include <asm/xstate.h>
 #include <asm/amd.h> /* cpu_has_amd_erratum() */
 #include <asm/debugreg.h>
-#include <asm/endbr.h>
 
 /* Avoid namespace pollution. */
 #undef cmpxchg
@@ -27,29 +25,6 @@
 #define cpu_has_amd_erratum(nr) \
         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
 
-#define get_stub(stb) ({                                        \
-    void *ptr;                                                  \
-    BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX_INST_LEN + 1);         \
-    ASSERT(!(stb).ptr);                                         \
-    (stb).addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;      \
-    (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) +    \
-        ((stb).addr & ~PAGE_MASK);                              \
-    ptr = memset((stb).ptr, 0xcc, STUB_BUF_SIZE / 2);           \
-    if ( cpu_has_xen_ibt )                                      \
-    {                                                           \
-        place_endbr64(ptr);                                     \
-        ptr += 4;                                               \
-    }                                                           \
-    ptr;                                                        \
-})
-#define put_stub(stb) ({                                   \
-    if ( (stb).ptr )                                       \
-    {                                                      \
-        unmap_domain_page((stb).ptr);                      \
-        (stb).ptr = NULL;                                  \
-    }                                                      \
-})
-
 #define FXSAVE_AREA current->arch.fpu_ctxt
 
 #include "x86_emulate/x86_emulate.c"



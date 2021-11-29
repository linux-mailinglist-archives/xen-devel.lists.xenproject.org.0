Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF64610C8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:05:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234345.406708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcaX-0007Er-7p; Mon, 29 Nov 2021 09:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234345.406708; Mon, 29 Nov 2021 09:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcaX-0007C3-4D; Mon, 29 Nov 2021 09:04:41 +0000
Received: by outflank-mailman (input) for mailman id 234345;
 Mon, 29 Nov 2021 09:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrcaV-0007Bx-If
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:04:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6104defc-50f3-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 10:04:38 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-i_kjeuFnNPe2quWCPw7kLg-1; Mon, 29 Nov 2021 10:04:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 09:04:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:04:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Mon, 29 Nov 2021 09:04:34 +0000
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
X-Inumbo-ID: 6104defc-50f3-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638176677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZU4b6F/SJ+CLMHpfkeTwOQjDDGFcSOYzdTSyelstsQc=;
	b=KAwhjz2lLI8K8gV2tIBFUQdWR2du7IYsHGcfZXNdwugOJusUEVkYN5GVMOe+TKrOlsay9m
	EJozeBa7qHyb4FScjyUZWM2k7tbC1CAKwRSXnnrnJjdK5bencKnOjl0AUw82aNj52Q+Xmj
	gRynLEB2pClxPQ6GXFl0JH/KBiKMts4=
X-MC-Unique: i_kjeuFnNPe2quWCPw7kLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1c6bEkhJoqnOC5vpOEo0YcCNW7sVm2FrJZKpiYc77HSt+8QxhUEE8XkwoHBxJD4/mWj+LsW5PJenucHlPTFtbHYeDXUGAmJkWV8QMwLVVQT3xtqKKJhEraarDJGRcDwS3M7aeevh2YAR0Gg3nXirFOOCEq+jxghyqJ9ghxxXxR/6v+N9lP/CY03F+A51H/zokoF1VYLVSL/UI5qx4gSPhpbDpEbYjNrGnqip9RcaQUi5FK0J3Mp4bkTi14hqOiaKIp3BLMYfor8ae1nHDEZLHXosH8p8F+3gh7+XLpbO2N6hIhg8WF/3Y9nb49ROWvYjsZNA7FuIhlEsd40bF3HUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZU4b6F/SJ+CLMHpfkeTwOQjDDGFcSOYzdTSyelstsQc=;
 b=WVcBDRxDwI79r+aI+70ErMW7HyC+ZWZxf2ZEZXJxBAO/4w08atQl8UjIMDR0/LwBOBw5atU0Dm9QNO9CWXZNdWJpx4fGmKpVs+cZCTzVK15GyrhZyZrjjxTce94rs98H7zNX2BFy+6X30ipL3Nw9i4N0mZ8VMKmGijBPiWV5kwdRSOtwQGva8CPw5OB1vF+wh4GFbfapKzdiwTtu7uTCd+HUyrudFnqQZdR0mGJCFJu9l7DHQFXumISgWhPdHu7YMCdlr6GBMXYFm2THWN+m1QxOHbJpGgeE5tYELB2zgTRTL+x5AW1kTbhvNq0EdcWRVP7QFJI/uQ+hPxGmyt7zXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9fd8ba19-9744-fa50-1afb-15fae8955cac@suse.com>
Date: Mon, 29 Nov 2021 10:04:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: convert most remaining hvm_funcs hook invocations to
 alt-call
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 688e8384-c1fc-425c-8a36-08d9b3174377
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71527A158A7E47D983527CA9B3669@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P9c3XkzzHJhpieSWodQgcMPUdRGYuGg7KE5mzrfBtNc0zILBMicZ2NP15tIPjvA/zZaG7oes+Qk+WGTMyWGVNT57EJfrcSjmwjivNEmhzXEN102j3P6F0XqRJ8QaI2ndmP66jnQasY3GHlsctgxUkKbPSDTws5dHNmCxs2ejg29h37zBBh6qZhg27gYNUyEKxGeAbLBJ1wnaMNshjzf1nycU0NLs+jjr9EqKdx7ph3KR628mKDCnfOhp22ki7LNF6o8MvQroWX1FbQxlonmJ63BUQZu82TyvGCpB33FkzC9oYtZG+vMBhRKHhRzKfofsuGNhG3OWO7JdLtYbZO1CGTzajeA/O3zHejruYoKtIIONVqvbVysJ9eRmIgtXFJcPwCEy9GScVwAfoKvulmzLxL5wOqSzU7ZHJ/L4OOCfrt+Z1IOAQQv2luhfEMcddZFlXz397d7t9eWuTr49C+WHkDsLWfg4WuZrrvZ9Yll2uDKVTt8Cyj7t96LanqtV6aQL5/ND/yBDh5bKFfMZM70GfrM8ClpgeJFkuX35pb+O2XQ4+CW+Qj3kGPgAQUqxUuO9vNVeAlgSAyalT0EfsK+M2DYBSNZFkh57D1dlRnEVknLPnPfkACbYhLHPKyhrWk99lJ8VQ5SyshiV7Jl4Z4ftj0KfkQeH93C/UKzrFoYHfAKUCOjIhXL2YOg+9QurUrjh5Z3JDA5hmdjB3bIOKpBHE/P3pjaCfO+niyEX7ieImCVuZwTPZtPXzkAFRhCYKTLQgYdPiMISyUCevlSWnvMz12JoeatCUS6J4yNDqM2752oGf4RiajI4fXobtVsY/lTm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(36756003)(8676002)(83380400001)(956004)(31686004)(4326008)(186003)(2616005)(8936002)(30864003)(5660300002)(54906003)(6486002)(316002)(16576012)(86362001)(6916009)(66946007)(508600001)(66556008)(66476007)(38100700002)(26005)(966005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWFnSy9mNndaUnhnN1E3VmF4bzNrcHA3d3lhbGx1cHJJVlRCQUw3K2I5a2E4?=
 =?utf-8?B?NmNJc1huUUI0RDNCOTVtc3FEOE5mOW93WGlyZkVoUFRmOC9uRXR2eE15MHU3?=
 =?utf-8?B?T2RNajF2cWRnUmp1NXFtWXFjUFFlN0w2aG5tZUxmVWdEZVAxTisxQis0eE9v?=
 =?utf-8?B?VmFUcHVFZ1BtUWhDeVVhZzVuM24raHhUODRwaXkvbnhCTWZHVThOZTR3a25L?=
 =?utf-8?B?UlhINzZEVnFVMXArTFNXd0UrSnBKa3dhdCtoWFE4ZXVTNE42VEE1b3hhNndj?=
 =?utf-8?B?OFlQSkFacy9UUktLZ2RHVDRzQ2NUSXkwVk53TWJyUWsxZzVrVDZBUmNrUFdp?=
 =?utf-8?B?YktZekJBaEE0T2hEWDJtQWg1ZU5kL1plTkExZ0lDZUQ0NzZPcjVYS0VZQkdK?=
 =?utf-8?B?M3JtRUEvVnRMZktFd1ZWMzlISVI2ZTQwZkVkTGtKM0loSjZSQVNNSU95OXpT?=
 =?utf-8?B?RXowTWhjcjgxOS9iQVA0WWRMMWtLTERtYnFqeVdtalI0TFVYUG5yQUZRUU04?=
 =?utf-8?B?THM0aVhIU3RSa1BHRVJGdUtEbFpnV01RdHAvcmpzb1ZQUkp6VnV1Vy9lRmZ1?=
 =?utf-8?B?QUdiVnNJQVNFejFHeHRFVXZXek5mR0xjT0l2NURseDZwclVkN0t0VFhlRXdk?=
 =?utf-8?B?SVJuZUxiMHpheENpL2N5MHB6OG5oV3NCSGMvS25QQVNJLzJjWVdkZzQranpB?=
 =?utf-8?B?VUpjWnh1dTEwTEJLWEhjNDU1QThQbUVMeGhKam5SZGQ4Q2IrTlYyZmVNMHdP?=
 =?utf-8?B?eU1jZjJsSjB5dVFQTnNBNU1XTFEzUndlRHVrMnh3bTlIdG1iOTBJMVpHYndw?=
 =?utf-8?B?UW95anB0Qys4dUw0SER5MmZrTWlwN2hLL2VtN0l2YkNIdTVhYXhMbnVaZ2Jp?=
 =?utf-8?B?K3pXTkxuQTFtcFNmeWlKVUFzZHNnSm1nWW13STJHQW9ibnNaanB6QWtVSmNh?=
 =?utf-8?B?SFJvZkNxTDFiK1BGakRWblp3YmJ2MVdqNnErSGU3c3RGRE1MYng3UGlVMlVM?=
 =?utf-8?B?SmpjK1dWQU0rOTl6SjhDSWZzOFFRRytNdUsyL3VrWSsxWitrUDAvMUxiQXdp?=
 =?utf-8?B?L3FUNkk3aktrbkhrKzVKY2JZM0FEaWZ1Z2dXSUx3TFhtTEY5dUpsNjd2Sngx?=
 =?utf-8?B?VGhLMTA2NWxweGlQNUhzMFN0czAzeUJwUFpqQSt2ZWIyL3FnNXFvYUY3QnRL?=
 =?utf-8?B?dTJ2ajl0OTg4bjRIUW5Cc0RhR3o4L2p6WWpPYmVFVkhSLzQ4WGp4NXR0NDlK?=
 =?utf-8?B?MWFjc1I0ais5aWpiVEUwdm9zZXVJOGowYWc3MDRVZ1lKenU3N2ZzSDA5SjdW?=
 =?utf-8?B?Qks0clBVcVhOeGpMdlVIQ3dXMGMrWHF4WmNKWnZyOXlzL1JCcnJJUk9URm9m?=
 =?utf-8?B?OVV4R2t1UHFBWkdOai9YRzNOY3JaSjhXZGJkMS9kL0RpbnRnaWpDcTNJS3ZR?=
 =?utf-8?B?TjVOSFVoRXFNQUZmOSsrNURlbTYxRm4wblBUdkkxMGpBeU0zaXhvQ0VQMVBX?=
 =?utf-8?B?bzBFWWx5dVREMlY2SnFpNHBoYWNlYUNKU1A3TW9na1RDcnJFSW01b0N6VWdu?=
 =?utf-8?B?dUtwOWduRHp6dW5hTTdWOE1CQWZYTGxqamwwR3ZDajAxQjNObkhrMGwxeTBM?=
 =?utf-8?B?UHJnVnRKM1BRUlVGaGtWcWR5cXM3UFYvcWFKanI5ZC9ZbWxzNlNRQWxRdUhQ?=
 =?utf-8?B?alQwTXR5d2pVQkVtM1UyOXhVd1VKV2NCNHRjVjBPaFR3a3YyVnRTd2VwaExD?=
 =?utf-8?B?ZEdmOGh6aytWMzZiVmlraGllaUJUTEozc3p4enNVcXZpQThxQ3dKQ0FvYTBq?=
 =?utf-8?B?a1ZwSGc3UGtuUDhOMGlVVHYxbGVVRTNueThVZmpkZXJVNkpwTXdMTDU4Tm1s?=
 =?utf-8?B?TU1zenNINTJ1T1VDSVVOMko4aE5xRkZwazZGdWUwQ3UvRjlJcXo5aHZMV0Mw?=
 =?utf-8?B?MkhOQ2tzemY5Qm1GNTUzY3VZRlFlTnZmTEZNdE5nUE9MYndYV3lvM1BUcmd0?=
 =?utf-8?B?bVNrMEVCQllxRlE1L1VtSy9hNkFpd01JOHV0Nmd4VHR4b0syQ3Z0dmUzd3Nq?=
 =?utf-8?B?WGFkRCt6MEwyL01BTGorMGtCV0hMWDBkaXhCMDF5Tmw1TjVIQUpuOFlsVU5P?=
 =?utf-8?B?QkJIaUwzU0NZNi8wZC9ZQlNhV2lxckRxNTZZYzR5bEdxdHlBbHQ5UVY1YzRY?=
 =?utf-8?Q?SElZ2y38ZecE59qGg5MKWpI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688e8384-c1fc-425c-8a36-08d9b3174377
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:04:34.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhQd792sWerAfYcOoGVQ8a2pv4IIX259Eh372iNmV/gpHPDFALP1zsDfalv3Y+XSoTp7cfHdgRz8uc4pg3y8Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

The aim being to have as few indirect calls as possible (see [1]),
whereas during initial conversion performance was the main aspect and
hence rarely used hooks didn't get converted. Apparently one use of
get_interrupt_shadow() was missed at the time.

While I've intentionally left alone the cpu_{up,down}() etc hooks for
not being guest reachable, the nhvm_hap_walk_L1_p2m() one can't
currently be converted as the framework supports only up to 6 arguments.
Down the road the three booleans perhaps want folding into a single
parameter/argument.

While doing this, drop NULL checks ahead of .nhvm_*() calls when the
hook is always present. Also convert the .nhvm_vcpu_reset() call to
alternative_vcall(), as the return value is unused and the caller has
currently no way of propagating it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://lists.xen.org/archives/html/xen-devel/2021-11/msg01822.html
---
Another candidate for dropping the conditional would be
.enable_msr_interception(), but this would then want the wrapper to also
return void (hence perhaps better done separately).

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2548,7 +2548,7 @@ static int hvmemul_vmfunc(
 
     if ( !hvm_funcs.altp2m_vcpu_emulate_vmfunc )
         return X86EMUL_UNHANDLEABLE;
-    rc = hvm_funcs.altp2m_vcpu_emulate_vmfunc(ctxt->regs);
+    rc = alternative_call(hvm_funcs.altp2m_vcpu_emulate_vmfunc, ctxt->regs);
     if ( rc == X86EMUL_EXCEPTION )
         x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
 
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -703,7 +703,7 @@ int hvm_domain_initialise(struct domain
     if ( rc )
         goto fail2;
 
-    rc = hvm_funcs.domain_initialise(d);
+    rc = alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc != 0 )
         goto fail2;
 
@@ -736,7 +736,7 @@ void hvm_domain_relinquish_resources(str
         alternative_vcall(hvm_funcs.domain_relinquish_resources, d);
 
     if ( hvm_funcs.nhvm_domain_relinquish_resources )
-        hvm_funcs.nhvm_domain_relinquish_resources(d);
+        alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
 
     viridian_domain_deinit(d);
 
@@ -866,7 +866,7 @@ static int hvm_save_cpu_ctxt(struct vcpu
         return 0;
 
     /* Architecture-specific vmcs/vmcb bits */
-    hvm_funcs.save_cpu_ctxt(v, &ctxt);
+    alternative_vcall(hvm_funcs.save_cpu_ctxt, v, &ctxt);
 
     hvm_get_segment_register(v, x86_seg_idtr, &seg);
     ctxt.idtr_limit = seg.limit;
@@ -1089,14 +1089,14 @@ static int hvm_load_cpu_ctxt(struct doma
 #undef UNFOLD_ARBYTES
 
     /* Architecture-specific vmcs/vmcb bits */
-    if ( hvm_funcs.load_cpu_ctxt(v, &ctxt) < 0 )
+    if ( alternative_call(hvm_funcs.load_cpu_ctxt, v, &ctxt) < 0 )
         return -EINVAL;
 
     v->arch.hvm.guest_cr[2] = ctxt.cr2;
     hvm_update_guest_cr(v, 2);
 
     if ( hvm_funcs.tsc_scaling.setup )
-        hvm_funcs.tsc_scaling.setup(v);
+        alternative_vcall(hvm_funcs.tsc_scaling.setup, v);
 
     v->arch.msrs->tsc_aux = ctxt.msr_tsc_aux;
 
@@ -1559,7 +1559,8 @@ int hvm_vcpu_initialise(struct vcpu *v)
     if ( rc != 0 ) /* teardown: vlapic_destroy */
         goto fail2;
 
-    if ( (rc = hvm_funcs.vcpu_initialise(v)) != 0 ) /* teardown: hvm_funcs.vcpu_destroy */
+    rc = alternative_call(hvm_funcs.vcpu_initialise, v);
+    if ( rc != 0 ) /* teardown: hvm_funcs.vcpu_destroy */
         goto fail3;
 
     softirq_tasklet_init(&v->arch.hvm.assert_evtchn_irq_tasklet,
@@ -1607,7 +1608,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     free_compat_arg_xlat(v);
  fail4:
     hvmemul_cache_destroy(v);
-    hvm_funcs.vcpu_destroy(v);
+    alternative_vcall(hvm_funcs.vcpu_destroy, v);
  fail3:
     vlapic_destroy(v);
  fail2:
@@ -1631,7 +1632,7 @@ void hvm_vcpu_destroy(struct vcpu *v)
     free_compat_arg_xlat(v);
 
     tasklet_kill(&v->arch.hvm.assert_evtchn_irq_tasklet);
-    hvm_funcs.vcpu_destroy(v);
+    alternative_vcall(hvm_funcs.vcpu_destroy, v);
 
     vlapic_destroy(v);
 
@@ -3863,7 +3864,7 @@ enum hvm_intblk hvm_interrupt_blocked(st
          !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
         return hvm_intblk_rflags_ie;
 
-    intr_shadow = hvm_funcs.get_interrupt_shadow(v);
+    intr_shadow = alternative_call(hvm_funcs.get_interrupt_shadow, v);
 
     if ( intr_shadow & (HVM_INTR_SHADOW_STI|HVM_INTR_SHADOW_MOV_SS) )
         return hvm_intblk_shadow;
@@ -3979,7 +3980,7 @@ void hvm_vcpu_reset_state(struct vcpu *v
     hvm_set_segment_register(v, x86_seg_idtr, &reg);
 
     if ( hvm_funcs.tsc_scaling.setup )
-        hvm_funcs.tsc_scaling.setup(v);
+        alternative_vcall(hvm_funcs.tsc_scaling.setup, v);
 
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -54,8 +54,7 @@ nestedhvm_vcpu_reset(struct vcpu *v)
 
     hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);
 
-    if ( hvm_funcs.nhvm_vcpu_reset )
-        hvm_funcs.nhvm_vcpu_reset(v);
+    alternative_vcall(hvm_funcs.nhvm_vcpu_reset, v);
 
     /* vcpu is in host mode */
     nestedhvm_vcpu_exit_guestmode(v);
@@ -64,14 +63,14 @@ nestedhvm_vcpu_reset(struct vcpu *v)
 int
 nestedhvm_vcpu_initialise(struct vcpu *v)
 {
-    int rc = -EOPNOTSUPP;
+    int rc;
 
     if ( !shadow_io_bitmap[0] )
         return -ENOMEM;
 
-    if ( !hvm_funcs.nhvm_vcpu_initialise ||
-         ((rc = hvm_funcs.nhvm_vcpu_initialise(v)) != 0) )
-         return rc;
+    rc = alternative_call(hvm_funcs.nhvm_vcpu_initialise, v);
+    if ( rc )
+        return rc;
 
     nestedhvm_vcpu_reset(v);
     return 0;
@@ -80,8 +79,7 @@ nestedhvm_vcpu_initialise(struct vcpu *v
 void
 nestedhvm_vcpu_destroy(struct vcpu *v)
 {
-    if ( hvm_funcs.nhvm_vcpu_destroy )
-        hvm_funcs.nhvm_vcpu_destroy(v);
+    alternative_vcall(hvm_funcs.nhvm_vcpu_destroy, v);
 }
 
 static void
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -270,7 +270,8 @@ int arch_monitor_domctl_event(struct dom
         ad->monitor.descriptor_access_enabled = requested_status;
 
         for_each_vcpu ( d, v )
-            hvm_funcs.set_descriptor_access_exiting(v, requested_status);
+            alternative_vcall(hvm_funcs.set_descriptor_access_exiting, v,
+                              requested_status);
 
         domain_unpause(d);
         break;
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -204,7 +204,7 @@ void vm_event_fill_regs(vm_event_request
     ASSERT(is_hvm_vcpu(curr));
 
     /* Architecture-specific vmcs/vmcb bits */
-    hvm_funcs.save_cpu_ctxt(curr, &ctxt);
+    alternative_vcall(hvm_funcs.save_cpu_ctxt, curr, &ctxt);
 
     req->data.regs.x86.rax = regs->rax;
     req->data.regs.x86.rcx = regs->rcx;
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -601,7 +601,7 @@ static inline void hvm_invalidate_regs_f
 static inline int nhvm_vcpu_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
-    return hvm_funcs.nhvm_vcpu_vmexit_event(v, event);
+    return alternative_call(hvm_funcs.nhvm_vcpu_vmexit_event, v, event);
 }
 
 /* returns l1 guest's cr3 that points to the page table used to
@@ -609,43 +609,44 @@ static inline int nhvm_vcpu_vmexit_event
  */
 static inline uint64_t nhvm_vcpu_p2m_base(struct vcpu *v)
 {
-    return hvm_funcs.nhvm_vcpu_p2m_base(v);
+    return alternative_call(hvm_funcs.nhvm_vcpu_p2m_base, v);
 }
 
 /* returns true, when l1 guest intercepts the specified trap */
 static inline bool_t nhvm_vmcx_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode)
 {
-    return hvm_funcs.nhvm_vmcx_guest_intercepts_event(v, vector, errcode);
+    return alternative_call(hvm_funcs.nhvm_vmcx_guest_intercepts_event, v,
+                            vector, errcode);
 }
 
 /* returns true when l1 guest wants to use hap to run l2 guest */
 static inline bool_t nhvm_vmcx_hap_enabled(struct vcpu *v)
 {
-    return hvm_funcs.nhvm_vmcx_hap_enabled(v);
+    return alternative_call(hvm_funcs.nhvm_vmcx_hap_enabled, v);
 }
 
 /* interrupt */
 static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
 {
-    return hvm_funcs.nhvm_intr_blocked(v);
+    return alternative_call(hvm_funcs.nhvm_intr_blocked, v);
 }
 
 static inline bool_t hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     if ( hvm_funcs.enable_msr_interception )
     {
-        hvm_funcs.enable_msr_interception(d, msr);
-        return 1;
+        alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
+        return true;
     }
 
-    return 0;
+    return false;
 }
 
 static inline bool_t hvm_is_singlestep_supported(void)
 {
     return (hvm_funcs.is_singlestep_supported &&
-            hvm_funcs.is_singlestep_supported());
+            alternative_call(hvm_funcs.is_singlestep_supported));
 }
 
 static inline bool hvm_hap_supported(void)
@@ -663,14 +664,14 @@ static inline bool hvm_altp2m_supported(
 static inline void altp2m_vcpu_update_p2m(struct vcpu *v)
 {
     if ( hvm_funcs.altp2m_vcpu_update_p2m )
-        hvm_funcs.altp2m_vcpu_update_p2m(v);
+        alternative_vcall(hvm_funcs.altp2m_vcpu_update_p2m, v);
 }
 
 /* updates VMCS fields related to VMFUNC and #VE */
 static inline void altp2m_vcpu_update_vmfunc_ve(struct vcpu *v)
 {
     if ( hvm_funcs.altp2m_vcpu_update_vmfunc_ve )
-        hvm_funcs.altp2m_vcpu_update_vmfunc_ve(v);
+        alternative_vcall(hvm_funcs.altp2m_vcpu_update_vmfunc_ve, v);
 }
 
 /* emulates #VE */
@@ -678,7 +679,7 @@ static inline bool altp2m_vcpu_emulate_v
 {
     if ( hvm_funcs.altp2m_vcpu_emulate_ve )
     {
-        hvm_funcs.altp2m_vcpu_emulate_ve(v);
+        alternative_vcall(hvm_funcs.altp2m_vcpu_emulate_ve, v);
         return true;
     }
     return false;
@@ -687,7 +688,7 @@ static inline bool altp2m_vcpu_emulate_v
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
     if ( hvm_funcs.vmtrace_control )
-        return hvm_funcs.vmtrace_control(v, enable, reset);
+        return alternative_call(hvm_funcs.vmtrace_control, v, enable, reset);
 
     return -EOPNOTSUPP;
 }
@@ -696,7 +697,7 @@ static inline int hvm_vmtrace_control(st
 static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 {
     if ( hvm_funcs.vmtrace_output_position )
-        return hvm_funcs.vmtrace_output_position(v, pos);
+        return alternative_call(hvm_funcs.vmtrace_output_position, v, pos);
 
     return -EOPNOTSUPP;
 }
@@ -705,7 +706,7 @@ static inline int hvm_vmtrace_set_option
     struct vcpu *v, uint64_t key, uint64_t value)
 {
     if ( hvm_funcs.vmtrace_set_option )
-        return hvm_funcs.vmtrace_set_option(v, key, value);
+        return alternative_call(hvm_funcs.vmtrace_set_option, v, key, value);
 
     return -EOPNOTSUPP;
 }
@@ -714,7 +715,7 @@ static inline int hvm_vmtrace_get_option
     struct vcpu *v, uint64_t key, uint64_t *value)
 {
     if ( hvm_funcs.vmtrace_get_option )
-        return hvm_funcs.vmtrace_get_option(v, key, value);
+        return alternative_call(hvm_funcs.vmtrace_get_option, v, key, value);
 
     return -EOPNOTSUPP;
 }
@@ -722,7 +723,7 @@ static inline int hvm_vmtrace_get_option
 static inline int hvm_vmtrace_reset(struct vcpu *v)
 {
     if ( hvm_funcs.vmtrace_reset )
-        return hvm_funcs.vmtrace_reset(v);
+        return alternative_call(hvm_funcs.vmtrace_reset, v);
 
     return -EOPNOTSUPP;
 }



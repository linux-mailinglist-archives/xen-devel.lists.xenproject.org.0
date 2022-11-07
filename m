Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5061F738
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 16:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439433.693480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os3kV-0007aH-8V; Mon, 07 Nov 2022 15:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439433.693480; Mon, 07 Nov 2022 15:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os3kV-0007X7-5e; Mon, 07 Nov 2022 15:09:19 +0000
Received: by outflank-mailman (input) for mailman id 439433;
 Mon, 07 Nov 2022 15:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1os3kT-0007X1-I6
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 15:09:17 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20063.outbound.protection.outlook.com [40.107.2.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2404e2da-5eae-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 16:09:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9316.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 15:09:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 15:09:12 +0000
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
X-Inumbo-ID: 2404e2da-5eae-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9LOfQ9iAiXbyXpsZXX2mI/4yLS3vss3npSMOyCXrrAlTPYLFmRYR0cZab2Ad83o4DTNqy+FXlDbiLaavJ8h4FUGGbxg34TXoEGs6AHXqPahs2tvAIX76y3W9gnOFdxHbI2GP3T7iwoBIl7pW+mh7MpSto02RI7cBpOELvefb7x2s0AH2XW+h/uccfSogb0mQ4i9Pp/ywGy+Ci7DEQN49SKwor0e7X3ya5t2gqvqxFWL7w+LwRI0lnA36u8QBAPt/d/lyzMpmdMQY5ZasA8QSu1AfoTTqV8DwU3O0WexpxrJQorqXTO2dIeLPfj8/uxhP/dwSTwV9ex55v2YhPkP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szw5kFsGTSOmjgpURbNvhhMr2iPPJJmIgQjLJijPsLE=;
 b=djpctp75vnNVXvTrv8wY4/uIYMa+dc/Gv3IfXXY2S2CatEGGtuBHEHt77EFvZSTDP1ICdnMdDu429LKXVxnYQpEzrrQfGLdmKpimoAS9b16PWEVexFpm14GE7cydig9vqmVjNJk1PZ1m4nTgXdaOEgEOvh2g0KXkBsbV9hEoIk3ixtiwvUvbCIFeT8/kDnljC6fsvvkAERyDTDBXHicYC02G3ElBybVIZPsfeYhdEontoJ0AWJ0TwP+LnjQrehIuzLoQTzdjTnHb1pDVz0z/EdgqXCDPZ6FFnrl3TR29NwsTcOtxW8YlluFa6XfymPZYT5C2cIMtLtBa6X/gEA94Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szw5kFsGTSOmjgpURbNvhhMr2iPPJJmIgQjLJijPsLE=;
 b=EDrtJSVTRI8OjlY/XsAz4xXRNX/WKpdLIEDkgWoRnyoVtz1QxkFcJvh6tDra7Ij441Yx//f4PZrWwWE376K+7LlR9V6fD3foOruGs/v17+kyaK3EyREeI6B6kLoGP1imogXQQUnwd/tpcTVXMfZDwm3Co7g0rG6mNRZjMC3K+QsYwJjNb2E0/fLADqNRuOf15AIqTkquNxJYvJhpdOVENeTnMEIKH4qhpBORNr+COvBDgH9uUTswWYLuSWkxfF/Sbk/w9/k7Fro2chy5VaUmtxoaNMjOShtRrGQjbuh46I79KOeAR1JSS+0GN3OpMYe7LcZFnc0ftlDRkWmrzzp/Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>
Date: Mon, 7 Nov 2022 16:09:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.17] kexec: restore hypercall 1st arg's type
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 20194bd2-9855-4e77-c911-08dac0d20734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P/X3+JUzXjQu+2xOxS3ik1H81v6auy0Ci/iBm8me25G137dH6d9K2S92pkfYHUojxr+olYutHQMrgTwrSy2S2f2dkTL/0ILkZPRhmzRP7x+yhSGWcp7MYjKmsFFso2YNOzkcnonrinaYj1jCpxrBRljZtrrMD6wMghmzBL+9fJp1Z3DO+FJRdjgd3EPfalq1fH9no4oSW3GeSBBsM7xgkPPu5HPC0h+lDpiq8zAOwJLcT/Rwm8efpy6IXh3yrepxzY/Wv30EOEADzd2TgiQdr7XxWcwNRlVPf991yLjLq3m37jxeSXs3HN9WXyZn1gVRLHH6Yj1gka4Jhs6/kug+FHddkLGNnYCSe3b2s1rkYmpj/Bd1yA9oIaE5FDqgRihao5ZuJL3AAIVQsdyiGke/etAVvfqubTV+JlkVkVVejKAckZVMXf2p6DL4BVyjOEWNkIDR5d7Jdgp8S28jGmrMsctlZK9BOSqUW1JAdUBEXWfHN4qTPdpvB+oJi1RaDjewG0xzq7MR2gjDivIXVLor+fgMIRaWVLWcLj92VpZpki9qC+Ttav454uUE8GeS8xVjUwlSzoHVWe8l7fzNATIDYb4zO1RH2e2I6vH8KdPbWBCvPAoS+YX/Bl0LXPfOBCEmq3tq13LRGx2ZSwCgPX/nch1BcFNLtC9eQ2j6KXdjpoiDvKvLSgFY51/mufJKBMm4Yy58xQO0vxxhl94tsxXryPhKBAtum+ckxShY8UuFEIfngn4JK/AGE9l1dkDMTV49aVhK9jcRgmvfhXAvPpRqe2EsOGAoyBS4DhYCmt+/Gi1MD+y085xRNfJa6mQEIUb/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(186003)(38100700002)(6506007)(6512007)(26005)(83380400001)(2906002)(316002)(478600001)(2616005)(54906003)(6916009)(6486002)(41300700001)(5660300002)(8936002)(66556008)(66946007)(66476007)(8676002)(4326008)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlZPb1JqdjVVZ0Z5RzY4Yy8xc2t5ODgvMlh6WnJmdlM1Mjd3MFhaMUNERHox?=
 =?utf-8?B?TmVqY2llN0U3WGJ1S1JKdjF3ZEpRRkIvTk9oTnA2M21laUVETEM5TUhBQlpo?=
 =?utf-8?B?cHJXV1VJTm1ZRlF4K2JZTTZVcHZPRXRMNG5pWmtNVTQ0S2tqT0lyRmZ4TlIx?=
 =?utf-8?B?UWhualNiRVhQcFhLMnBEc3ZGY0I0VkpJVSs1Q3NPNURuZWtRSFpXMnNUNVNu?=
 =?utf-8?B?VDFXaVI5dTNVZGpOSjE3WEIwWC8rTHBLOEhXZTBjeHJheVRhQVNidjRHSVEv?=
 =?utf-8?B?SUdmVGhSYm82ZXNUZDlKZCs4Y1FZbWVjejMybEZaNG1VaUoyUytreTRaS1cw?=
 =?utf-8?B?bGxSSTNVUlVKbHdLRjVOOXJmRFNQaUMvOHJ5U3FhdUdlUmtEYmNYVVk1cm1q?=
 =?utf-8?B?eVl6RUhvMENqUWdpUzdjNTl5R0lJbXBWMm5yN3hTeGl4aVV0NW9oUUV3Y29w?=
 =?utf-8?B?UzJ2bWZjQTJsNHRPQm9SMHBIVkNIQVY4QUJFdmJIU2t5YVYySHJKY3ZjWEdP?=
 =?utf-8?B?RHJ4Q3lnT05wS1VqallqQzhtSXBJSm9pRnNhdFVuckVWN0RSeGFRK3ZPSm5o?=
 =?utf-8?B?RlkwVGd3b0xpRkVLUmsyWnlaZzd4cmVhVzZ6UEo1NllLc2RwUG9LN2JlM0kw?=
 =?utf-8?B?TUFqV0RGaGRKWm5vVkdkUTF6TGt4c29mVUNZY2FUQkNnbHEzRk4vUzB1Vytv?=
 =?utf-8?B?SXZJaC85UDJWaDFacDVGR2F3anBCL1dnUE1iV1Q4QjU0OFNySm5sMEo0encx?=
 =?utf-8?B?c28rS25ISlhLYVV2QUR6T0thbUE2SkZDeUszaitXRENIY3A0TnhiYURUcGcy?=
 =?utf-8?B?Ym9vS0VUVDZjUlE3TzBSR1NDSkFGTmRzd2RRMG5KQzk1TTVIWmpiMVdNQWhs?=
 =?utf-8?B?QkVLMzJUb2lhTSs1QkVKQ2pMdlJ2ZDhvMFA2ZXdqeHJYc3h5bGlFNTI0Ny8y?=
 =?utf-8?B?eVV1VSt0V0pVNjJLaThaM1hmVW5jKzg4bHF3RUl1cE4zMWc5L3dTa1VnVVFB?=
 =?utf-8?B?dDk1eXhVbDQxUFlzanVmanZLNURXZjdoZjhoNzdmSkZLOUhOV2J6MmJxanZN?=
 =?utf-8?B?OXpMVVA0OU4zQ1hhcDJnSnRMeDlBUXlCZFpuL25UUFRRY0RJVDFFMVA4Yzdm?=
 =?utf-8?B?NXpZQll5Z1dPZXZ0TXFNRm8rSE91UmljbUIxc1pSc0daaHZDZ05ZSW9HNHJX?=
 =?utf-8?B?djh1TlVraE1GYm0xdDNtckpteE5NRzd6eEFUSHMxVGZIYzVFSCtuQWZQais2?=
 =?utf-8?B?UFp4bCtmdmxBWGNvNnByVGJUaWd4dmdGZStMMWExWGJPWVlZUEo4UU5WZExP?=
 =?utf-8?B?L1JxdDhnRFZwRUR4SkFaVW0yUk9KZE1QZmQvais2RXVvUWhoWWZ4aGh5OStK?=
 =?utf-8?B?TWZQR29ISm5qQTBzMjF6bDRmZDk0aDE5MXMxbDEzV0tzVGxjMENFMHByOE1L?=
 =?utf-8?B?aDAweU9NU2RiK1QzaDRWM1NNeTFrSi9aa25BaDFzTUlwT3JJNWVRNCtxMTUx?=
 =?utf-8?B?NDcyMjZFd3VSSnZOaVZITmlaN251QWtlczZUOEdJYjNsNEhkbnk4RVppT1BV?=
 =?utf-8?B?b2xndDFydkd1RzN2bHgwTDJCTTg0WCtPL01adzVydGk4bGQ4UUk4Uk05WHhY?=
 =?utf-8?B?cjZKSUc4YWpjVGU2U3ZhdFhqblYxYUVYSlBEdnE5eThuTzg3cXJ0RGJ5cStV?=
 =?utf-8?B?dTZtMU84VjdPNE9aV3lJSjI3MDE5Z1ZWQkdGOUwrY2NYUFUwWlFyTkxHVVNj?=
 =?utf-8?B?SmtaUFVubG12YjhhU2ROcllnRUlPZmpqbUNZYnBTQlhjSzdIR1VpaTdLOHpk?=
 =?utf-8?B?ZGNxK1VxalY3V3Mza0V6NDMzdWRRV1JlWXNJZXNTVXhRaVp3a0hnM2FxWjF6?=
 =?utf-8?B?cDFQVTl3Y2NOamFzalo0Sm81OWcxQUx5T3ordkN5YzUyRTkrUG1adC9hZTVh?=
 =?utf-8?B?akFlSDI4NDQ3eFc4blMxV2k1L2QvWGtBcDN6dWNRdmIyczJ5NXZsYmp6STQz?=
 =?utf-8?B?RnBIUXk0eDlVNS9OYWtqbFJzZjFVdUlpUG85alpnc2xXVmN5YWZYaGF4QzNU?=
 =?utf-8?B?TjRra2doSnFNYWZrR2VlcENXOEZ1d1pvdk1LZkxsU0w0NUYvaE9tM2V5bVZS?=
 =?utf-8?Q?M7FcZfQd7Woc4ALGs48aErdQD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20194bd2-9855-4e77-c911-08dac0d20734
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 15:09:12.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mTSHgBx4I3P92GV2NCdfhree2QVxDD2Zt+Y5xoC/FFpiAxsZ9b8ncWXAeF2LNYxpVh+qK/UyMoL8ynLEqj1OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9316

This reverts a small part of 7e21b25059ed ("xen: harmonize return types
of hypercall handlers"). The change from "unsigned long" to "unsigned
int" for the native handler function meant that previously invalid
values became valid. While perhaps not a significant issue, strictly
speaking that's still a change to the ABI. Don't go as far as restoring
the compat entry point's type though: That one can't have values passed
which don't fit in 32 bits.

Note that as a side effect this fixes the invocation of
hypercall_create_continuation(), which by mistake wasn't adjusted by the
earlier change.

Also take the opportunity and correct the respective comment in the
public header. (The way it was it really supports that it probably was
pointless to use "long", but that's the way the hypercall was
introduced.)

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -1213,7 +1213,7 @@ static int kexec_status(XEN_GUEST_HANDLE
     return !!test_bit(bit, &kexec_flags);
 }
 
-static int do_kexec_op_internal(unsigned int op,
+static int do_kexec_op_internal(unsigned long op,
                                 XEN_GUEST_HANDLE_PARAM(void) uarg,
                                 bool_t compat)
 {
@@ -1265,7 +1265,7 @@ static int do_kexec_op_internal(unsigned
     return ret;
 }
 
-long do_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
+long do_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     return do_kexec_op_internal(op, uarg, 0);
 }
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -117,9 +117,6 @@ callback_op(int cmd, const void *arg)
 #ifdef CONFIG_ARGO
 argo_op(unsigned int cmd, void *arg1, void *arg2, unsigned long arg3, unsigned long arg4)
 #endif
-#ifdef CONFIG_KEXEC
-kexec_op(unsigned int op, void *uarg)
-#endif
 #ifdef CONFIG_PV
 iret()
 nmi_op(unsigned int cmd, void *arg)
@@ -149,6 +146,9 @@ update_va_mapping_otherdomain(unsigned i
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(compat_platform_op_t *u_xenpf_op)
 #endif
+#ifdef CONFIG_KEXEC
+kexec_op(unsigned int op, void *uarg)
+#endif
 #endif /* CONFIG_COMPAT */
 
 #if defined(CONFIG_PV) || defined(CONFIG_ARM)
@@ -181,6 +181,9 @@ update_descriptor(uint64_t gaddr, seg_de
 update_va_mapping(unsigned long va, uint64_t val64, unsigned long flags)
 update_va_mapping_otherdomain(unsigned long va, uint64_t val64, unsigned long flags, domid_t domid)
 #endif
+#ifdef CONFIG_KEXEC
+kexec_op(unsigned long op, void *uarg)
+#endif
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -64,7 +64,7 @@
 
 /*
  * Prototype for this hypercall is:
- *  int kexec_op(int cmd, void *args)
+ *  int kexec_op(unsigned long cmd, void *args)
  * @cmd  == KEXEC_CMD_...
  *          KEXEC operation to perform
  * @args == Operation-specific extra arguments (NULL if none).


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F09467703
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237495.411901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Jb-0003l8-FJ; Fri, 03 Dec 2021 12:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237495.411901; Fri, 03 Dec 2021 12:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Jb-0003jL-Bm; Fri, 03 Dec 2021 12:05:23 +0000
Received: by outflank-mailman (input) for mailman id 237495;
 Fri, 03 Dec 2021 12:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7JZ-0002qC-OY
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:05:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49c332f6-5431-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 13:05:21 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-4aArlK__OeKx5HHZ9fkoig-1; Fri, 03 Dec 2021 13:05:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 3 Dec
 2021 12:05:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:05:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0106.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 12:05:18 +0000
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
X-Inumbo-ID: 49c332f6-5431-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638533120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xbkw59rq1m1qExzkUUzR8dD75QHb9SESG2q0qwJbyuw=;
	b=cnQoWFxtAl3GV3qYoaYb5hoR5esLESldkEhtGlnHValQH8yIwAfVIbCIT0HX+0o0Rc4abD
	KRc37Lav2nZqi1m03DRuEhpiTTNkXkXt696Krwk7DrKowb/H03jBYS1B7bvljUuqI12YKg
	7kjlqGaRhf+mT7D0l9a2SQQZUfX/zTc=
X-MC-Unique: 4aArlK__OeKx5HHZ9fkoig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFkB0amN2zbx4hCmnZpBuluRFwAgHLjdVsE1haljjVLPHyXNE0SQc9IimNGldHAZ9sleuEgAWdz75I9UndAO1lYAZGek9+nt+IxBycZoCoj5siv6GkqoYEDE+BmEj9UUoQqH7gVzw4gEGmAOT8iV654DmT/pXNrnwwkxqgAkUi085KeFx2V2yQtQLd8xPN05VzxZJphNZA0VYw1l6mL2ySQa+NugsNPUfTQ0WkFe76zQ/gOpGFn9SbYgGJmWjkU7jjpvfw5jYPA2OnE9IJwxOfPiuUY+Czb/FX37sT8EvwpQVmh0Ch5chwueoinIKbl4P0ziZPlsQbAwUWbQnMR2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xbkw59rq1m1qExzkUUzR8dD75QHb9SESG2q0qwJbyuw=;
 b=Jd9M4bL3YxbFrizf0YJAzMlT70UZzNabBtL1VyLnGBkLzvL9gqft1h/OR7EapE21PphuH1P3DiWBxgQJlVg7c7NzCoVifhMhVjMNGIkMe4VhH5PB6TRiIfnRNM2zZq1fxHfvLbiCWqifok3ghM7X6YYjKUF8yk1admlBvQ4NNKz2/oIQ8NYpIIruuexdD3yI2zunK0Arspuq+rg9dq75i4xx55qFNog/9Hi953MzsPNU5jubk1+8tpYiGU5velAjP3FurJGi3dFOGShIFakZuTi4Zm8MVVjk1xv66WJcibf9p5eoy++5x68LSVtXVtXWllpGyDq6bsG8Aj/kkv1cVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efb282e9-4ddd-22d1-a2e4-36a4d0964ada@suse.com>
Date: Fri, 3 Dec 2021 13:05:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 3/5] VMX: sync VM-exit perf counters with known VM-exit
 reasons
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
In-Reply-To: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0106.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b9a317e-6516-4be7-3bab-08d9b6552cbf
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29581486017F0D331CC845B2B36A9@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VQObLVjU2MPHfCKkf2NmKbKHhpe6yHq37qZIC4V62OHPt+OBX7fLD8sykMwzKLrWLmLdZEgmiD+Az16GvKKu5RwzfrUC3LmwXZ+O1YA6ll8PT/qapkxPAkk2ogDOG+YFyNTf23eCFevsdM244zdOhSfof54dQfkmeFoTnECjssZz62/lp5gW8GshAs+8Bfe68PljkxkBRGJx4C4fnaMgAwKz0YHOZcEpF2sqEAwsDxTrm5uyxZnpNSzv7znNCMNXoQl6zlYq3aHXWNClK8+sWanMv4dBCW0dzGzMwglQtgHdi8jZ+HtjXijd9Xk3/JgKDoY9Uc4Rtm8zHoUfkUu8O7uel94RbP+s2gMguM3qUvc0RTS1HQ/O+3e1Jl3PScIj0a0Y8WbJUtEJHiSalImaZlLsjXuEEvFu6JRRuoYDbT4jrarAm5guzeBemGkJvQD37Wz7kOp98Hs7wmJaqhD/LlUO9Ht6+YgN3SFADXnGFGoOw2H6T+4psWuvSN4Pn7me40XqwheE0io8A8/i9VXA8PyRi2O2BZ6UiyuTD26zds4Ti67Lxov34zZwcC7i1/r1AEOGwysr0s6SvfNC9yHdOqXOWlg7l7MfYqAWdf1eddoRZ9Zw7NVlb5SxMUZtp8zZjVWo1K3oOmkTWeb6J3kMWD6lnrdHzCIOOT7C/Xm5ZlSV8UMmPmI2SruUcRaB1O+qiS6LTSgxoswVlKM2rrVCtiTmEOQRAJJvn+uB6EaZzyDFMCoojbbrz1x04a/+x8sJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(8676002)(186003)(66556008)(956004)(36756003)(38100700002)(26005)(4326008)(8936002)(16576012)(31696002)(316002)(6916009)(508600001)(86362001)(31686004)(5660300002)(54906003)(2616005)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkRQZExmZE8ybDg4bFRLSHQydE55ekFvSUVtRHpUemVITVRXTkI5QnhnUWQ0?=
 =?utf-8?B?L1hwanNvdDZaTm5PWVJScVJOU0dOMTQrWW16WHpEdm4raTk0bk9QaFpRcUs2?=
 =?utf-8?B?Qk5rTlRZb1A0NEJCV2RpWVpzUXBJaDhZSDhIZUdMSXJPRmZGL2NuVTJZdkw2?=
 =?utf-8?B?M3dEeTc1Qm9EdzVJbVh5OVZBUEI0OHJzcWJVR2M3VlVOUUQ3Q0hKc2RuN090?=
 =?utf-8?B?MEVLWkZJSDNkUlZnM09XbVRiaGFkUkFqQXhLRkQ4UkNRYTNscThXVTd5bWEw?=
 =?utf-8?B?ZlpUYU9TMGhWelBnT0hkV0VIUmNRcHUzaXMyaHVXcko2Y2w1Rm1GZElMYXl1?=
 =?utf-8?B?amE2bm0wWWtMUUlEV09md3BMZ3l6R25aaTFXbFJ6T2VvK1hNWlRRbjZtc3JQ?=
 =?utf-8?B?VUtMcDA5N202VGc3M2dWeWd1NGlSaUx4VXRZM1Y3SlVpMi85VDhUeVVlNW1h?=
 =?utf-8?B?SEVFYllSTjJPUGczRllUUlZMcjZkVUw5b01XYW55bllxRS9taXBUL0tCNVNh?=
 =?utf-8?B?VWI0dzVIQ2tqTHdmUVJlMlBtK0hTb2RzY1daaEE0VkRVTWxlV3JvbFp5bFBi?=
 =?utf-8?B?NWMvK1l6TnZyQ3JiaEI2enJjckpKYjEvTWVMMGEzTHI2ZVB4dk4vci9tRExJ?=
 =?utf-8?B?MldNTDhmMjdpWFNjRUc0NGF5emtCcjludnc2Rk1HOGdqaEdSYlJteVRoUHlD?=
 =?utf-8?B?a1YraFFSM2ttQS8ySDRNekV2dnk0VVlKTTJsV2ZFL2JmY2psdWRpU09nKzlh?=
 =?utf-8?B?OFJPNm5oWkZ4eGR5d3R5UTM5QkRBczZNUVo2SFBhWHlBT01WWXE3L1R0bXVr?=
 =?utf-8?B?SlVCSEVsMVMyeVNFNkVPSEFVWHlmM01XaE1rOVp2VzdZOHBEYldJTzNwNzF3?=
 =?utf-8?B?QVpVQjlVOTJqWXRTLzV1YjEzcGFOeE85Wmh4eXZyMHRMaHk5a2FNMzRIZWZo?=
 =?utf-8?B?RERmVzhPYnViTWZuT2NjQXJFQ1ZtVUw2Q1pVMVdqdndwQUJXMHlUVWFMUUZQ?=
 =?utf-8?B?UVdCL0x2bzR2d2pJdVg5NVVTY2VKWU9MdEtsVkFpSWUxTllQdWJaRHZtbmEw?=
 =?utf-8?B?MUZzTndFWnhOeVBhaERpdkNlTzkyV3NkOUZ2MjJXdWVyS25iNSs3ZXcyQVgv?=
 =?utf-8?B?VTU2RGVTOTRLL1dmWWFteFFqaFFUMWkxYkdOQTZsSmdxRE5ZK2x1eG1vZ245?=
 =?utf-8?B?QXNFaHhWVVp4aWhnN21FRHRLaGJQUXVNaGh6bnkzcEpaVmVZYURUNjdLWHRZ?=
 =?utf-8?B?NXdSQU4vbVBNbzE2OFJEUFpEbEhnTHB1RjQveVZRNytrQXk3Q01sVGVwVzlV?=
 =?utf-8?B?TjlVYzhGb0ZzQUVvUytsTm9kWGNaa3hUcXFaRmVpbWxOUnY1U2NMQUNpWXRT?=
 =?utf-8?B?VFBlUWZ1SWs2RHVGcVRyanNpcm5FbDhBblhNVG1TR1NDZFBSaFZvQVVJUTNs?=
 =?utf-8?B?c1lPNy8xUFBiSG9OdTBDeXdWU1RrdE5XVWtqNGJoSGVNUGtBVUp6bnoyaklN?=
 =?utf-8?B?Tm56d2xkMDJLUFQweDJUL0ROTkdXaTV6andsSGhDWFlXdGhrV0RwRHRJNk5G?=
 =?utf-8?B?WHhZQTd0NjB2VDlmYm90WU5aOW9FbWtma2RIY0p5YWd6VXI2bFNOWUhCVFcv?=
 =?utf-8?B?OWptU3RSMFE3c1hyejU4NDdMZkpheWNEdlBmeVpwWGt1VVAzY0JjdUc5UW82?=
 =?utf-8?B?dWppaDRjSlFvclRId2M4cmQ5Uk5qQ1c4d3BEU2FFS3RNMkdpZmhLRmhpZTl2?=
 =?utf-8?B?OVFzTnJsQVN1NkQwTzdlN0RueTh5bmd1VEtlMncwUDhkeXZoUlh1bE5hclJo?=
 =?utf-8?B?Uys0K29zclZDaVp6cjlTNHgrL21xMkg3UjJrRXR3ZllBemVhTzF1YW13RHVJ?=
 =?utf-8?B?dHFUSUF4T2NZeXI0ZGFvUUxaRnhDcDZKb3pDeEx4L25nMHR0THp6cnZyMUZt?=
 =?utf-8?B?ZG5vVzdjeU1GaXRQUkhydHlZclZtenpRQmg2dG9ibFo5YW5LcG8zYUQrcE9E?=
 =?utf-8?B?NEV3UGc1VlBBTERYcmRjVnZ6L0lUMmVLQUdVQ0RiYzNVRGtDVlFxYlE4RFYr?=
 =?utf-8?B?cENaenNDME56NGZ1SnN2WDkrd2dIZkdud1lCRDFUcC84dXIwUGhqTTlBY2Vu?=
 =?utf-8?B?NTU3RUU4OStwT1FieHBYTThzQ3BEaE1KTkxuSVBxMk1RTE1oRTN2RFQvRmo0?=
 =?utf-8?Q?LGZwVCmF8pmffS8h64Dn2U8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9a317e-6516-4be7-3bab-08d9b6552cbf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:05:18.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTnF0JN7iTaZdOWRZ0IldTLjZ7T4brZhAPFgHhYYTduDHAEZP7mvRyFR8jW0iFpyxLESu1Pve/Ajo/2zID5Cpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

This has gone out of sync over time. Introduce a simplistic mechanism to
hopefully keep things in sync going forward.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't sure about the #ifdef: Using CONFIG_PERF_COUNTERS there would
seem slightly odd next to a construct which specifically abstracts away
this aspect.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3869,7 +3869,10 @@ void vmx_vmexit_handler(struct cpu_user_
     else
         HVMTRACE_ND(VMEXIT, 0, 1/*cycles*/, exit_reason, regs->eip);
 
-    perfc_incra(vmexits, exit_reason);
+#ifdef VMX_PERF_EXIT_REASON_SIZE
+    BUILD_BUG_ON(VMX_PERF_EXIT_REASON_SIZE != EXIT_REASON_LAST + 1);
+#endif
+    perfc_incra(vmexits, (uint16_t)exit_reason);
 
     /* Handle the interrupt we missed before allowing any more in. */
     switch ( (uint16_t)exit_reason )
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -220,6 +220,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
 
+#define EXIT_REASON_LAST                EXIT_REASON_XRSTORS
+
 /*
  * Interruption-information format
  */
--- a/xen/include/asm-x86/perfc_defn.h
+++ b/xen/include/asm-x86/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 56
+#define VMX_PERF_EXIT_REASON_SIZE 65
 #define VMX_PERF_VECTOR_SIZE 0x20
 PERFCOUNTER_ARRAY(vmexits,              "vmexits", VMX_PERF_EXIT_REASON_SIZE)
 PERFCOUNTER_ARRAY(cause_vector,         "cause vector", VMX_PERF_VECTOR_SIZE)



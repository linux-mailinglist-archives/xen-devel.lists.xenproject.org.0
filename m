Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF72B40DD88
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188531.337715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQsvr-0005aP-Np; Thu, 16 Sep 2021 15:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188531.337715; Thu, 16 Sep 2021 15:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQsvr-0005Yd-KU; Thu, 16 Sep 2021 15:04:11 +0000
Received: by outflank-mailman (input) for mailman id 188531;
 Thu, 16 Sep 2021 15:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQsvq-0005YX-Ex
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 15:04:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57cd548c-16ff-11ec-b60a-12813bfff9fa;
 Thu, 16 Sep 2021 15:04:09 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-53EVhdX0PkS0f6-hC2a2BA-2; Thu, 16 Sep 2021 17:04:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 15:04:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 15:04:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Thu, 16 Sep 2021 15:04:03 +0000
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
X-Inumbo-ID: 57cd548c-16ff-11ec-b60a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631804648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q6WgI46VbGAw65/T84e6H5PFsEF1GgiBtZusySz5miE=;
	b=SaE70UTQBMtPGbooQ4kyKw2N/jMJPyPDolTfEowJQlL6kGRksAej7kBE/jXFRbAFVRZVHX
	8v08PYbSaW2LhqEbDv5Jx9cup7+RgqLk0JJN08rCj0MM7l7Zy4f3NvJ/IuGnaaPPa7UOP+
	CQPFcxvGA8gxc6k1YoND72nXPvpUdtM=
X-MC-Unique: 53EVhdX0PkS0f6-hC2a2BA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNpbuhjPGqHbplYflYUAuqsphOBVrXRjWVcO59eVLqIx4q/xFFv7f9otMGiGsi5CHnKE97BHZcZlER5ICcm1XqDc/VnDOKpbG6t6yQgfWx6P4gvOcTU16sZfJ16oPybkbnxRfMo97YE0i1bmTMZFfVO07Ecp371ocFCFBnhxO/7b78NeBsLrvUu7stJY++h88oAtetboDZ+JEDhhw7v9nwh6VqIhtbevJ1HatDd1z+aNQhk2wwxryhFkCwaBPxPYajRxeLFXi/HoAUVp/nz0eaz8WhrXf0jQJZjB0VNhQz/hg96A++uip+Dg1xZXWFSm4JE9R85+MvcxEKwLOG1yNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q6WgI46VbGAw65/T84e6H5PFsEF1GgiBtZusySz5miE=;
 b=n9dGAdavGklA1FWLKWcnyhZFvEcicaePh3hWIxRGkyrIaBgADiGid0L5XtpznpCceppC8HfetT3KmpNoiVxXh/pnbTkZaNME+MqGHgMScOEBhn18B0lmv8rXb54vOjblXG++/7GspUFuYKrWgOl/f6VgEyVoXRHnox76PVAqAOUywR1HXBoOiuRguZr0BWhIKDVgLyUiqKQYfdDEa5/ZdlKurMqnLtP0yCU4tWfThxyc5ozP1LxLE0/9ZDlG/jCsR2KxBeCLaXdr76Wfd7Lg77MlhS3za9b+WvTrcwi4CZa65uSg9IIFeTYN/URdDwYF/naXlfdyoJ8SV+VU5ngZ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/x86: fix PV trap handling on secondary processors
Message-ID: <34898e9c-5883-a978-98ee-b81b22d8caed@suse.com>
Date: Thu, 16 Sep 2021 17:04:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27943df4-f1f7-4c9d-c43c-08d979233923
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37768C2B682C46C921F067B4B3DC9@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BAQeGepHg1/vtCcixej6RiVXYgnbDkMNfPb5LlT8RShXNSZWrC3l+DFvZRSTmWvGLIxgDEThvJT+vPBooAPvZnMYAplseKQXLNW6AWl4ey3hc06m6KmjPWojO0qDIKLB5KPeR+OrOW9VEUAPwWvu5bKX9NBDfRFOHBXNUiwRVNfG9mK/TUdMJK8Db4Do57Horf0ffED2CSADr5Fc2y49ehFpvmzyrpHSshBK/xdAs2PsvMjVd50gByzy1MwfL+dOFGMAd5fsODc1W3x/Ll9+WjIRl1LTqDGcbW6Lp+VioeeWBl/CJdPuIhHwXJN5Rbalb+D2hDIwM4ABR9yt+zePhynjmDN/z1SdMWDrRf7bDeVIh05LkBPFNztqUsLf9oA6BUEHPWyywZn8dFHSYazZwzjl9q5VvFPjEvURB3I+oFMOek+aokhuUS880/F3/vhU95SFD/Mt9vr6SQdCmOMGaK5oTGItGxAWc8dmaV+eP79dDVLIwPlNGVA8Lj42sqQsmuIgE/OHwkD4xR/e9iYJ2PHPITditbKPd2SFRGfy2rWgUD+8c4pFBSm9M6V4pNB5muEslx/qd1ybEAx9m/YvyOmqZWBaeRenwEnrlNGt0TAJ8JpRhj45w68DXo9rnjsZ5I0fiJ1ily1WxWNEMm4PB7XQB3BLHc1nAh7Oj6LgCajw2GgUEqAiidBjR4xV8uwlFm6VhSUoCPVXmdhYWb0UMB3ZKZ0/Q941A00bWikbXBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(346002)(396003)(366004)(66946007)(8936002)(36756003)(66476007)(66556008)(4326008)(2616005)(26005)(38100700002)(110136005)(956004)(31686004)(186003)(8676002)(16576012)(316002)(86362001)(2906002)(31696002)(6486002)(54906003)(478600001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERKK2JrcnVIVXhyRUsyb1JVdVRYaW1mV3drN05xMjJVU3h0bmhzNFFES0JH?=
 =?utf-8?B?ZWc4dUZPWWNYK2xoNXR2R0NGNmNiK1ZZQStHN056cEpNQUpsL1NKVnY2SnVD?=
 =?utf-8?B?aTk4UFg3ODZsc2lVcGNYNEVGa2puYXlwMmpjQ3J6UEozMGUwNWJGZDUzdEhH?=
 =?utf-8?B?ZDBXSmFON2VUeDZaeTNHbFY3MU9JUWM3cGZ2R1o2WjBTTGxQcmIwM1p4UlNq?=
 =?utf-8?B?UVMxeGpFZlF6THdZY2g3Mm1nUmovbVVVQ0JTRlBRUlpjczJham5UVGVBYk1t?=
 =?utf-8?B?bFkxcmJmQ2x2WUlJODdEMElUbm1XOWUxeG9GTjhMcVBoVFdsRGtyS3pIRjIw?=
 =?utf-8?B?RHVIdE1OYkRzWG04TE5ReW9YNytyVGF0cVpHZVB4R3RiVG1BV28xOVUrMFZD?=
 =?utf-8?B?TVcwZkJlQ3ZDQlRaRi9rakRzVVB4a0JEcWNNcGlVYjMramNwRWQrUC93ZTFC?=
 =?utf-8?B?Mm9JR2N3R014YzFHaHA4YTA2VVpjTk5zb3NqUWFGQWlvM25FQlpkQUVUTHNk?=
 =?utf-8?B?cG42Z1JHaFFRZGpFaXZpS0dYUkFRcHVtN1VUV0NSZWUzdUdvaEtBWkd3TW9K?=
 =?utf-8?B?TnBYdnpjdnd6M0dtLzJ2WjEzU29UNmVLa1EraWIyeUdTYVNSZ3NLNkNVTmZv?=
 =?utf-8?B?TDNwcmNUL01UWmI4TGN0UERydHNLREZHUTVldm5QOTAxWk5oYm16VTZkaC9z?=
 =?utf-8?B?cG05QW10TVoxNHUrK2pJYm9UVnp4RDBDanBYaFBhc29nMFE4OGwwbXltRXow?=
 =?utf-8?B?S21tOWUvVlMwUWRyTmdtRnJJM1pkeVdOSHBNemZxaGZUNGRlTHZwYnJHK2NW?=
 =?utf-8?B?d1BWMG04UkFxczY3cUs2Qzh2Z0l0NFBhUDZSUFNVTW9pa3dWNGpqcEtWL1B5?=
 =?utf-8?B?dmJRWVVaY2UwQ0tUT0JRT1JCZ3FqaWV1M2lhSHZ5bExLbFcwMDVzRGMvRDNU?=
 =?utf-8?B?VEFZZlYvempNR2NtdjN2a3dIQnF2NE84TkJ0eUdiZnI1NmxXc05zdlBJcm1M?=
 =?utf-8?B?YlJpbVp4OTF3dkdxKzlqUGtqcHpFUlEySjVTemt5YlJEaVpweGRndDFBNmND?=
 =?utf-8?B?MllVOURIRC9SQXVqMXBpb0J1Ykx6NHlCRXFSa0FPcmZHa01xZnFtNDRkbFV2?=
 =?utf-8?B?RnVzUkpBak5zSE9Lam56U0IrUkIrQzFKT0k1OURoWlp2eXEwbmt4bS9HSGpJ?=
 =?utf-8?B?WGtjUjVqckgvN29JMXRVZnNSbzh0cHR6WHBuL05paWRSRnUwN2dDM3l4bklw?=
 =?utf-8?B?N2FqY25jVURTdXF6V1ZIZnMvRDVpZkdhcXBDT0VKd1A4RUtxb3lEZHhIYVJr?=
 =?utf-8?B?ZFdUK2hJMThjOUl3czFhOXhQN0pMQ1BpM0dwek94bThKZmt2bml2ZWx5Rk1P?=
 =?utf-8?B?UWVQV3NpUW1SQVYzOUtmbmNNbEFyV1pMd2dpdnFTdDlieWpHYU9yT1ZOTHJv?=
 =?utf-8?B?ZkwrTmJLeTFEb1hkSG5xTWlZTzJTMnhIWFNpUzN6ckJnYjduQ2M0MkZzK3px?=
 =?utf-8?B?cjZuMTAvZU1MOVppbzA1VjRkNHB4Vlg4VG5MWm84clFDNkk3dUhFVWZkWFBs?=
 =?utf-8?B?Mk44VkNtcmRCbFpwU0RjN3cvMkJQd1RaUldqeXFpajdZZDZHRm1EeCtTYy9y?=
 =?utf-8?B?bVBYSDNKRURHRFR2c2poeWt0ZHU1dFZQdjl0NUcrTW5MaEFCOFZzY0JJdGRm?=
 =?utf-8?B?bWdiYVY2UUJTS1RrMDhTNWJqRkFMMHlXMG4xU2ZGZzJOWnhZalFEZHBFR0Vr?=
 =?utf-8?Q?KrnCgsNdrVIy4jno558XTCXR25HZbyyHnMzdrT3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27943df4-f1f7-4c9d-c43c-08d979233923
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 15:04:04.0076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBFEs8rEgWMPTukFLHsTNvSkxcujFMnG4RSnAG5Z0N6tvqA4Mi8XNVkaON8Y0dRRCUgq2Vf1Hdl8CIinT4kacg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

The initial observation was that in PV mode under Xen 32-bit user space
didn't work anymore. Attempts of system calls ended in #GP(0x402). All
of the sudden the vector 0x80 handler was not in place anymore. As it
turns out up to 5.13 redundant initialization did occur: Once from
cpu_initialize_context() (through its VCPUOP_initialise hypercall) and a
2nd time while each CPU was brought fully up. This 2nd initialization is
now gone, uncovering that the 1st one was flawed: Unlike for the
set_trap_table hypercall, a full virtual IDT needs to be specified here;
the "vector" fields of the individual entries are of no interest. With
many (kernel) IDT entries still(?) (i.e. at that point at least) empty,
the syscall vector 0x80 ended up in slot 0x20 of the virtual IDT, thus
becoming the domain's handler for vector 0x20.

Since xen_copy_trap_info() has just this single purpose, simply adjust
that function. xen_convert_trap_info() cannot be used here. Its use
would also have lead to a buffer overrun if all (kernel) IDT entries
were populated, due to the function setting a sentinel entry at the end.

(I didn't bother trying to identify the commit which uncovered the issue
in 5.14; the commit named below is the one which actually introduced the
bad code.)

Fixes: f87e4cac4f4e ("xen: SMP guest support")
Cc: stable@vger.kernel.org
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In how far it is correct to use the current CPU's IDT is unclear to me.
Looks at least like another latent trap.

--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -775,8 +775,15 @@ static void xen_convert_trap_info(const
 void xen_copy_trap_info(struct trap_info *traps)
 {
 	const struct desc_ptr *desc = this_cpu_ptr(&idt_desc);
+	unsigned i, count = (desc->size + 1) / sizeof(gate_desc);
 
-	xen_convert_trap_info(desc, traps);
+	BUG_ON(count > 256);
+
+	for (i = 0; i < count; ++i) {
+		const gate_desc *entry = (gate_desc *)desc->address + i;
+
+		cvt_gate_to_trap(i, entry, &traps[i]);
+	}
 }
 
 /* Load a new IDT into Xen.  In principle this can be per-CPU, so we



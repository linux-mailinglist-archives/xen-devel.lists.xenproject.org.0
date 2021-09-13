Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32454084AC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 08:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185419.334060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfQC-0005op-P5; Mon, 13 Sep 2021 06:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185419.334060; Mon, 13 Sep 2021 06:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfQC-0005m2-LQ; Mon, 13 Sep 2021 06:26:28 +0000
Received: by outflank-mailman (input) for mailman id 185419;
 Mon, 13 Sep 2021 06:26:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPfQA-0005lv-To
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 06:26:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85350ec0-145b-11ec-b39d-12813bfff9fa;
 Mon, 13 Sep 2021 06:26:25 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-oZOy0JpJNhOW8YRKhy-RoA-1;
 Mon, 13 Sep 2021 08:26:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 06:26:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:26:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Mon, 13 Sep 2021 06:26:21 +0000
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
X-Inumbo-ID: 85350ec0-145b-11ec-b39d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631514384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b56+p+h/+f3Lf2jWmYx6VT7RCUyvcBike6T9rfJgClA=;
	b=k0mySYbdTxdWrzY62ThhD/xGeEzjn8wyJjP4Eb8WwGxDenahRsl+oOtUC3c3s3VKgvnb/i
	C+bvnzq3cxciwKJqiu1gq7JyqxTNStNSGy5VsYAG2oUPb4os/Q5vT8LGmfmGxhZoyGivlL
	UtqmEY1laDeaNaTUSvUG/wRDY+/4c4Q=
X-MC-Unique: oZOy0JpJNhOW8YRKhy-RoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEYCO+yD7YhSXLCJ/zNBkiNfk7VflGHeAUIp3/20d50loDckfHm57V6xmeEfK+UvltIwE9tsQaZb1dALdJf1PkiB+2YeIdk3RrwnbbSbmjXO2YQmA3CAKQTopog4JHEcIehLJPYdgqGWBIAOlZaefInRRXJArVQXLkeREQgxnV4Q5wE7CIwYVmFzPNSERsnm2waY8i1+y8mqU/zskO+cW4OZJwWoT42KtmSV9awK/ikAmla5xLFwysGiGeqfy6m/lMlGaIdmw+2yaOS0W/lbHTU8qKEh/YiXxzTPtJbxN/ivsIUIJCS4nHfrTKduf7KybkEf1Bq9UzYn2tX7rvssGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=b56+p+h/+f3Lf2jWmYx6VT7RCUyvcBike6T9rfJgClA=;
 b=gV7ZxZx2OX3WkiLVjZdN/jgueFx5CwYny/V2HcXIkoWwq0+P9ev/JpZqz2mDRh/PTfTvW+02Fb12cQ0LGxJhLPysus44O8emyK8kZiYvAIPfxaTMw0LD6zfA5oYMX3kF/mjl/twUjw7njcCnxOZVFpIU/93Dd+uRdHKAiEpLyV1yGkr1c+BxDKXxDlaWcwvdLlPdBplEpvGGkW5W+eB2djS4yb5MP6DmQPBJGo3GiA9M5mfoFu6D6BYrPEfjZBCAE/fyiOOvnK4r25KRgkreZyY+4JaJ/37ITs6kyn4gTYxXBCN98LzfnqlfoT47ZnBk4VZtYSIoBOtUeDhzdK5c+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: correct asm() constraints when dealing with immediate
 selector values
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <2c04b2aa-d41f-0a2c-6045-2d37a6fac53e@suse.com>
Date: Mon, 13 Sep 2021 08:26:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5048bcd1-86d4-4b7b-c8fe-08d9767f6777
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165E7556D3092F1F4CAA512B3D99@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CKwtM066mlHuvjXjh8NxKVX5NjYRQECs2dl3kfCqk1TH8TIKVNvXk+7jGpHba3sCl0JV5ekrJKqxChU0IxhZZ5PnCMN37q/FbKcifWBWYeEFFr29pNowOKP8cEuPaZ9ho3IqnrREZO6YM3ghkX65o9lyfQXwDC186Hu2GvLkCkEHuk18tXOTctu67E1PxmgEPUwR9ufTICQO7tQHLSNMxRNvW1HF1HOmPIYkcGXQAupPnywRCJxGA80UmuteVdUhRjLiKlGjV89W7y/FOEgtdhmcOAy02dEWPvwwhZdhck8mpwh0OKVLcrjvwMVXq77v9yThDdqx4MLJycgnlhfbcEx+bjRGQeRSCjxAhim8QlAB0WJbBZL/QeWmHMJoKd2CH0IiiB+RLzn9Kx16DSCYrIkIjmc7cJRSI1u1JBZSqiiMrC9Tqu/RHEW59GvNTeVZJdGYreGO6/YIJ9pSeaIdeR2GmHU5pKXrXOE6IP4dStP0c3DSKZR9g3MdyiIBoqoKZ/kI/rfjmbzan5V+cGBDi8mSUAXJtGKE2oqq2JRLMgsRF1Palf8e+1V6EBWQE9j9Liasi7GC6Q/Ppd01mJPeEFMm0I90NNaex9c4fyVMDkqRwO4/C1ci1RufvXLPI1f9+nPydCIKDBFwdpPmmS3uFCxcgY1vqp2fMn28KPD7nkvxepRo/mmB/KPHKU+zZuNa13V6P18YBtMFoWGwg9QID9A8zteJ3KhP8qpAzVvxCnBmoF58V+bT6OkwaYjbB/P5uk4/dSy2D/md5AFRSdmLuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(39860400002)(396003)(376002)(2616005)(4326008)(66946007)(956004)(83380400001)(5660300002)(6916009)(36756003)(186003)(8936002)(8676002)(38100700002)(86362001)(31686004)(26005)(6486002)(31696002)(2906002)(54906003)(66556008)(66476007)(316002)(478600001)(16576012)(14773001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azhQV2ZxVEZXbzlHNHlEVXpydDllYStrVy9xRHBBb3J5bkRTSlpjaVlOR3Bw?=
 =?utf-8?B?ZDk3clFRaFZ3RXdVVCtqbDBpL2NTNU5nYUl4SldBR0MwdTBGbHU5Mi9nT0h5?=
 =?utf-8?B?WEVsV3lwS0tjbU1RRUtwbXJzV3RCZDlHVEhQYjNQRG96VUdTVS9tcnBNdHJH?=
 =?utf-8?B?eEN4blNjN1VYUkRId0g1eXJ5M0RMbWVjSEpHUWNra0pJOTBuTUxxTFNkZlNR?=
 =?utf-8?B?K3NZanIzNmN5QWVoL3VyZFdHcU9RMDUxQnVnZ2piMnV5NnZtd1htTkdocVhF?=
 =?utf-8?B?S0oyYjg4Z3hpRUY0RHp5aldIWkVLMzRNM005dkRKYm5EL1JFY3NCMDN4WWpT?=
 =?utf-8?B?M0tHM09WQWJVVDJ3ZkVGSHU3RzlTVVQ2alo0dDBpSW1PWnRjMm84NkFWTytQ?=
 =?utf-8?B?K3RicU81eEQrVjlRWDZvNEhzNjVOVmk5cGZNeW5oRm9nLzVreHYwVDZGNWtS?=
 =?utf-8?B?ZVVZN090TGVEN08rZnFVTjV3SVlyUDc5T1YrOXpKSjcvVzBuSVBFY3p6U0hs?=
 =?utf-8?B?ZDBwT21BOFpHZ3Q1K21IanlkYm04REtJbHdMNTBHNlJmWlZNN3pUaFVLOUxT?=
 =?utf-8?B?bkg1Q3N4VmhXS2NUOGJ3ditIZWxlQUFUbXRuQmJPRDB5YjBBdEc5SzFDRlBE?=
 =?utf-8?B?cDAxZEc3cGd3ZG9vcnJMTWxIZ3ZVU2ZDdExDbXN2M0xvMmxRaExjcjhUeWdK?=
 =?utf-8?B?U2hNMVBwQWVLQittZTcrR1ZmZTRhZlJQTXZWNjc0MzNCUmRlTjNsb0dTR0t3?=
 =?utf-8?B?Nkcrem40UTBiY2FTVDgrVFdObm9tYmt3cVRjSHVBLzhwUFE0Slh0NWFnREs5?=
 =?utf-8?B?eDEvNkQwaTRBdHNPc3NtcjRXL3RvNHJ0U3ZCSTJzcnRTd0xPZUNvaG0wZjVC?=
 =?utf-8?B?YVMwYitKcWJVU3lkYllTaGhxT0RyMU42ZjZSQkVZVUpSaHFJdEs0aXkybUJO?=
 =?utf-8?B?TWRVMW1neXZ1dDBEdkdVbzBOUThoWlJkZm5jNWVnMFBGUllQQ1p4cW5sbGNl?=
 =?utf-8?B?bzFhZHpiSW1QdkJybmpkdFlSbHBoOGdWQkU0TmZxQWM0VDdkQ25ML0YrN09z?=
 =?utf-8?B?eHdqME53b0pZNUQ2djdWQWQxUmVYTzNPd2xEUHg5YlhoT2tkQXFrMW1UY254?=
 =?utf-8?B?MFFwdHQ0dmg2ZHNaQmp4NVRMZHpxRHhQcTVxQjJ3elVrNFF4UUtLajY0K3dF?=
 =?utf-8?B?ZTNQSUV4MzNvVDdEdDhCQnFsa3RSc25BYVE4bmhFbHVwNHNuL1lRSS94amxE?=
 =?utf-8?B?c0JKbDBMZXhCT2FmQTVDbE1hK1h2TzJxM2pwS1JBblh3Ymh5YWR4S01LWlZj?=
 =?utf-8?B?QnpyUDhwTHpPREJmS2lOdWlLNUk4bTcrNUlUNHZuN1puNCtneU54TFNjd052?=
 =?utf-8?B?a0hqdmZKZHZiMjJaOWh2TFZBVjhTaXN5UDVlUTVtREkyMG1HendJL2NZd1VW?=
 =?utf-8?B?YXp5OU1OTVI2dS9QS2xUdW1HSGUrRE50aVIzVm9oYXNBTWk4cHJoYUdzamlh?=
 =?utf-8?B?b3V5TUsvTWgyNExmbCtMTno0SW8zR21TenpjYk5GRWFMVnl1Q3ppRUcwRjRl?=
 =?utf-8?B?ejBQK3JseUxsSFdNN2tVQllFVzJVNTU2SWU4MndrTElURU1kL1AzY0ZIYldl?=
 =?utf-8?B?TFE5bkxHUlhDQ3FPcVZUYzBmZlAzc21qdWIwQnczd3Q2Y2pESmRuR0Zkd0dm?=
 =?utf-8?B?cVRzdFlsVVpmYWdUOW9XSWVQZEVxazFIbVJlSU4rSzgvTXkrOHd3cTVieXJi?=
 =?utf-8?Q?nt6MKcadC8izx2KKQQujkvK0VNZ1yH3D/Uqy7dB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5048bcd1-86d4-4b7b-c8fe-08d9767f6777
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 06:26:21.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRqV+S5+kzQp6YY0Ucq3hq4cncMNhVAEPfNuEn91TES46jzN/HF4Fo4RBuHWqICHP+LAg9cs5VWamYZIcctxgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

asm() constraints need to fit both the intended insn(s) which the
respective operands are going to be used with as well as the actual kind
of value specified. "m" (alone) together with a constant, however, leads
to gcc saying

error: memory input <N> is not directly addressable

while clang complains

error: invalid lvalue in asm input for constraint 'm'

And rightly so - in order to access a memory operand, an address needs
to be specified to the insn. In some cases it might be possible for a
compiler to synthesize a memory operand holding the requested constant,
but I think any solution there would have sharp edges.

If "m" alone doesn't work with constants, it is at best pointless (and
perhaps misleading or even risky - the compiler might decide to actually
pick "m" and not try very hard to find a suitable register) to specify
it alongside "r". And indeed clang does, oddly enough despite its
objection to "m" alone. Which means there the change also improves the
generated code.

While there also switch the two operand case to using named operands.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use named operands in do_double_fault().

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -736,7 +736,7 @@ void __init detect_zen2_null_seg_behavio
 	uint64_t base;
 
 	wrmsrl(MSR_FS_BASE, 1);
-	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
+	asm volatile ( "mov %0, %%fs" :: "r" (0) );
 	rdmsrl(MSR_FS_BASE, base);
 
 	if (base == 0)
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -248,7 +248,8 @@ void do_double_fault(struct cpu_user_reg
 
     console_force_unlock();
 
-    asm ( "lsll %1, %0" : "=r" (cpu) : "rm" (PER_CPU_SELECTOR) );
+    asm ( "lsll %[sel], %[limit]" : [limit] "=r" (cpu)
+                                  : [sel] "r" (PER_CPU_SELECTOR) );
 
     /* Find information saved during fault and dump it to the console. */
     printk("*** DOUBLE FAULT ***\n");



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB029411979
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 18:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191016.340870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSLwt-0003yd-MF; Mon, 20 Sep 2021 16:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191016.340870; Mon, 20 Sep 2021 16:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSLwt-0003wq-JD; Mon, 20 Sep 2021 16:15:19 +0000
Received: by outflank-mailman (input) for mailman id 191016;
 Mon, 20 Sep 2021 16:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSLws-0003wk-Az
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 16:15:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1467fd6-1a2d-11ec-b878-12813bfff9fa;
 Mon, 20 Sep 2021 16:15:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-V1gM9exIMDKGjqoKRo1uDQ-2; Mon, 20 Sep 2021 18:15:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3534.eurprd04.prod.outlook.com (2603:10a6:803:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 20 Sep
 2021 16:15:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 16:15:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Mon, 20 Sep 2021 16:15:12 +0000
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
X-Inumbo-ID: f1467fd6-1a2d-11ec-b878-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632154516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WWTOVr6n18LVQWTFZ5IgrK+XEg6IjbR5yJNW3Rr67PA=;
	b=GSzwG1sRjmUWzNm3sJkrmFF0+JJzvWfraVBjnaGJ3oz/sCL5kht1+TzGYDNdzihzgX0fak
	xFdLcJ1z+fDe6hGr6fI1geNAWieB1qXam97xS+6ea5d8bTr2R5h2opAy6YJgeebONE4j4e
	HdA/hCvsRFCJ9q3T4WZHBAmf9PMaagg=
X-MC-Unique: V1gM9exIMDKGjqoKRo1uDQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnacVZSZLA6zNFiwykV0C43C/WgHxUJ9XeIxIy+upi30PoWB6o37wkrNvyS+z49GmrXR7zmw+qrL/Etcd9HNoXxobVQxJ9uMa8CO1up38Jhu+g++Yq1D48oLKw0SO+C7IC3EUs1i5cdfopZpPMw3ZlX1VRszixQYNWn1PJhIhDKn2hzalBl7zdvDhqkVbNF9gY5ML6L2y4Ss14z3KFIKdfewWLvzIl/fpkt30GRgOmDr9fnptW8aVJ5fCA5qKXU6t4z6OUhUNZZ2KJu9j5M1Ip8yFWSorUT6xZQLRnFUOvw5ue5mxLsfwVPUARgMZafZmbnG9wwb128ms1jrN7J1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WWTOVr6n18LVQWTFZ5IgrK+XEg6IjbR5yJNW3Rr67PA=;
 b=AVG841M2Mzt1tsK8PkNOGAtGxy2RtpQ1wN1/5zZDfCCbEJB2iEAYJtLrr7o6bxweDQuXU9rhV7p89grYMzaawnk+zX0dANA4er6eaBArFJdHyH4qU4SnHXwvb+4G5xrj5chDUXE/rCfaehaMOEcKZ8tt0j7ENv218Fwus84Fz1CMArClCUPnYNuleynZi5C7mQv2d64y78+j+ibu81DglHnJST6kwrlTThSnJ3Y0HM6ysUpkw8Mu70s2ilfwhc6xT7hQtJq6LtPPThAnuA/+Hqal6nECnYBaPEWCEt2B9b5zqO41Xsb0tcJNW2U15EM5btWk9qq/OUOtOdfzvsuocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] xen/x86: fix PV trap handling on secondary processors
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <7a266932-092e-b68f-f2bb-1473b61adc6e@suse.com>
Date: Mon, 20 Sep 2021 18:15:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 651d9b1d-876b-436e-cece-08d97c51d326
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3534:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35343DA76F38D518C40A3A68B3A09@VI1PR0402MB3534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UYw56eljep7LbKo7WpuJUD+P4hXiBK+59UCb8zKDcJYKHWw52dv+2z1JgfpLwlHvgYuCwC4vHn+oaLFqcTcSfh9kdM/v7y5Qvs7p355PhapGSHGMUTn2SQjkMNbk7AfYk/PRYVrmX0Kt2Ggmwi03t4znmiS1wka5Po57skqX92hOTvx0AuCJmdF5O/WKTmf+idy55XupVQN6ZsnPWSWfmxQImwkdD8CTJ8Sfq3NB9uUCTWmzOlujWlnJ3XpxCIpHdWQT7bZh/SVagDJpuQjnPRGk9hmuaRgQQm23RgpWAqIjTAF/c1Lt6v6Rd7XhZW/+dAhMpvY8DOIz5eXDKEtzsAeHc1VHdAuDCAOKlQTl93GHGqpOzjyLPglOlpcdqG2q07Byue+RCjW10CHCEge+o0NCIH4iuHySj5/Yh0eNdKpFCP5P0nOf2zQzGkRCZbgnlCQ9bsHuRahx3MG87k5d1lBL8Yza1t3lm86BISnIJ9oF0iLSra364MJAQQyZIP4wosuGDyQhsmk4/1650Yg28NcgsjYaaE7XZoWt7GCwS8RYfQvRTBPTu1pQsd8gOOqRoEawS61aqCIgsszlrIl1kzLpK7ZoDn1F0ci2L3u6TJlYsijJwlsW6DFaCfWz2IEpGepJz9c0IGbjdNpY0HMpLVQHbkDSlKhwVSROieOISEExVVQwshe1/hxUodDaApKca/JFisNQQpYUY3hS0YEI3R9sG5PH9uXCxllqH0jeHw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(39860400002)(136003)(376002)(2906002)(5660300002)(6486002)(31686004)(38100700002)(66946007)(2616005)(478600001)(956004)(316002)(8676002)(83380400001)(186003)(66476007)(8936002)(66556008)(16576012)(31696002)(26005)(4326008)(86362001)(110136005)(36756003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVpGczdNTENRM2pBa0F3SS8xL0szNkFyTUZQUG1PSnQvOVZ2VjdhakRkZ2JG?=
 =?utf-8?B?d0lPVFgrRVVvK1VZZFk2Q2x3cnNvZ2xzbmdySGZ2RjBWNVZ6cEJWM1dKaXlz?=
 =?utf-8?B?bWc0QzIrU25aZEpVMnBaV1RjaXRaRFUrYmlVTm00Ynl4Nk1KNkc3UU9Hc1dS?=
 =?utf-8?B?THRCeHZIR2tNQTl1cnZHZDZuZGlWakJyZ3QvK2ExVmY4Uk5Pd3ZpNUVuaTFm?=
 =?utf-8?B?TFZQMzlKV21iSEZXUW4reERScXoxemVabG40RUZWQktlSkdoYnVWVm4rQi9u?=
 =?utf-8?B?MlBYbEZER0lyRXZCejgrQU1BTHlxNDZkUE84bk41bk9selJ2RW1JUmdhSXhs?=
 =?utf-8?B?Q3dZUXdCSHNtMUpkY3hzYzVuL1ZWZDVlVjVBREFoTWxHQ3pKd2IrelI3MUM0?=
 =?utf-8?B?ejJKZDBMdWorY2xYSDJkWTNIYWJNWGVQemdnbkxBNWRRWFNBWFZ2WjBEMjlS?=
 =?utf-8?B?Wi90dVlORjhodjhSRk5WUHhub3JyWlZ3TDZxeU9mWEhxb2xjUG5rU0wwYXVh?=
 =?utf-8?B?eFE2UEpnWUI2c2NHUUJaR3ZqanpXdEVIWUxTUXFHTWRTUnhYMncwU24xbFk5?=
 =?utf-8?B?VzErZ24yelBaSHJ4ckJhMGFleWZVUWJ0WGFNOWI5UURQYTdkSXdEQzVVRkk0?=
 =?utf-8?B?dm1ua0djSGt6blllb3U4YVFWTVMyTDVkWmtONUVXTzRPNldIaGdkRGk2MzV1?=
 =?utf-8?B?cDdmOWsvSm5acmcrVVFob0FSR1VHMURmZG5ma2pub3NXeEFncTBXdjVNSUVS?=
 =?utf-8?B?NGxPaVAwTXk0NXp0WmZ6d2oxMy9ybytmbEVkcnJNOWtodGlIbHJBUXdZOWhj?=
 =?utf-8?B?aEEyb1NtaU1HeU5IM2J6TlVrbW9YeGtKQVpPTWx6b0lkbHpxUzJ0Y3NpcXhL?=
 =?utf-8?B?dXRUWDlpRGpXdUM5aUNLb0Ftb0lNTDBaeExvVEdiSnBXR2h1T3F4L2hmOG0x?=
 =?utf-8?B?SG9wM0szVm5TZ0N4UVhjNFVNUjFrVlAyS0h1SXhCZCtRR2dNOTJpZGVqbWY4?=
 =?utf-8?B?SXp6QklBMXBpMC9laXVTK3Z0b01SeFdnVFV3NnpRclVSNXAzeEVtMEluUXVQ?=
 =?utf-8?B?Y3dnQ09QT2l6ejlxdDU5alNJL2RVMlp5UTRHVXVHUnZLNkdjSmlHYXlCUFZR?=
 =?utf-8?B?dEFvcXNpTUh0TEc0dEFuZ3JNYmJBa3FNeEF6YVJ1Mk84cVNqOVpLZVpETmdi?=
 =?utf-8?B?bWlDUjJnam5SN1NyY0ZrTldVTlVWaDRIZHZqQWhHZGYvbkVVR082bGVrbzF6?=
 =?utf-8?B?YzBoYnVaNnJBMUQ4Y0JNcFIxbm13eDNWMlpBUFh0M0ZHa2NTaXFjanpHQmRS?=
 =?utf-8?B?bEFXOXpWRDMwRko5TkFSVlpRYlZ4SEUzN1N5SEc5Q3Q4dFNOTHNzeXgzUzVB?=
 =?utf-8?B?OGFaUGg1dFdQYU8yR0lZNU1uMVlPa3NnMG9qK3pWbmJ4eUdUVGZlRzh3aTA0?=
 =?utf-8?B?UUdxZVVUaTZTalBGa0VaWTlJdlZEdmQ1VHByY2lMMGJjUllSU2ZpVEQ5NkRt?=
 =?utf-8?B?VWZoU2FGOEFOWHcyYkhrSjBKVGlwNk1RQy91L2NiaDNsOUZLL0M1aHZpT2NI?=
 =?utf-8?B?ZEU2aFlqT2g3b3paZlhlcTVnTW9IaUs5NE9wMWNyL3BldjF0NW5xbm9CVFg2?=
 =?utf-8?B?NmU4cEFrdzh0M0pZMGhVTE5NVHpCOWk1dUFQS25YYmR0TU5wNHc4TG1HZHZy?=
 =?utf-8?B?SmIzNWFNR3duSCtsZHlUMDRLdmRkWm81ZEt5S0xEYzRyVmtiOUxKanNCZWVs?=
 =?utf-8?Q?5zhk5zkTCu1kRVXI7M02FM0R/3Tk/yZFftJmCWV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651d9b1d-876b-436e-cece-08d97c51d326
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 16:15:12.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKbQ9X1KldTfnMsBJAsLgyDk+0IeDyntYFJsBaQJQT5MSAzCvakUU4IJbStOXv46LCSiOxzWp3/SwLMzghDjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3534

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

Make xen_convert_trap_info() fit for either purpose, leveraging the fact
that on the xen_copy_trap_info() path the table starts out zero-filled.
This includes moving out the writing of the sentinel, which would also
have lead to a buffer overrun in the xen_copy_trap_info() case if all
(kernel) IDT entries were populated. Convert the writing of the sentinel
to clearing of the entire table entry rather than just the address
field.

(I didn't bother trying to identify the commit which uncovered the issue
in 5.14; the commit named below is the one which actually introduced the
bad code.)

Fixes: f87e4cac4f4e ("xen: SMP guest support")
Cc: stable@vger.kernel.org
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In how far it is correct to use the current CPU's IDT is unclear to me.
Looks at least like another latent trap.
---
v2: Switch back to using xen_convert_trap_info().

--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -755,8 +755,8 @@ static void xen_write_idt_entry(gate_des
 	preempt_enable();
 }
 
-static void xen_convert_trap_info(const struct desc_ptr *desc,
-				  struct trap_info *traps)
+static unsigned xen_convert_trap_info(const struct desc_ptr *desc,
+				      struct trap_info *traps, bool full)
 {
 	unsigned in, out, count;
 
@@ -766,17 +766,18 @@ static void xen_convert_trap_info(const
 	for (in = out = 0; in < count; in++) {
 		gate_desc *entry = (gate_desc *)(desc->address) + in;
 
-		if (cvt_gate_to_trap(in, entry, &traps[out]))
+		if (cvt_gate_to_trap(in, entry, &traps[out]) || full)
 			out++;
 	}
-	traps[out].address = 0;
+
+	return out;
 }
 
 void xen_copy_trap_info(struct trap_info *traps)
 {
 	const struct desc_ptr *desc = this_cpu_ptr(&idt_desc);
 
-	xen_convert_trap_info(desc, traps);
+	xen_convert_trap_info(desc, traps, true);
 }
 
 /* Load a new IDT into Xen.  In principle this can be per-CPU, so we
@@ -786,6 +787,7 @@ static void xen_load_idt(const struct de
 {
 	static DEFINE_SPINLOCK(lock);
 	static struct trap_info traps[257];
+	unsigned out;
 
 	trace_xen_cpu_load_idt(desc);
 
@@ -793,7 +795,8 @@ static void xen_load_idt(const struct de
 
 	memcpy(this_cpu_ptr(&idt_desc), desc, sizeof(idt_desc));
 
-	xen_convert_trap_info(desc, traps);
+	out = xen_convert_trap_info(desc, traps, false);
+	memset(&traps[out], 0, sizeof(traps[0]));
 
 	xen_mc_flush();
 	if (HYPERVISOR_set_trap_table(traps))



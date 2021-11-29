Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3F64610D9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234357.406731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcfq-0000pw-8U; Mon, 29 Nov 2021 09:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234357.406731; Mon, 29 Nov 2021 09:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcfq-0000o9-59; Mon, 29 Nov 2021 09:10:10 +0000
Received: by outflank-mailman (input) for mailman id 234357;
 Mon, 29 Nov 2021 09:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrcfp-0000jv-1c
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:10:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25903fcb-50f4-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 10:10:07 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-TyxLkeyRPVqHZn3K1tze_Q-1; Mon, 29 Nov 2021 10:10:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 09:10:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:10:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:20b:127::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Mon, 29 Nov 2021 09:10:04 +0000
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
X-Inumbo-ID: 25903fcb-50f4-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638177007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7QkaCIQzisRqxKoxe93GeFU157LBKSiuLUmcqzfECJc=;
	b=Bjs83jBs9Y08xxPJazotLLlYqEuUQpRz+kasJl5BW8TpWTLefNrhY1IoMIeytAAp4yfeV2
	BwEfm3xzivFNPHl6tVpacqngZ2DhgSAyBGyOueQd45r2+c9ubQVIaHAc6mozYeK+JFzvOr
	VgcoQfWIErHWhLwpV9Zzi5MgBaQBu+U=
X-MC-Unique: TyxLkeyRPVqHZn3K1tze_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBO98Z+12SbOgPZxGojMvPyDMrDkB9HPra82NDPo2R8c5bW04TbYGQIT/UBQN55IZbpIna7Ffs5G/9t/MVG/Hp4CW7u/fO8vyexsGTFME49NaqgX2qIEk83ADehqvTkxFskzk8ijhu/keH5CT/oc1Z30g+LCDvlmqy/lN+U3XUl+anG7xO9HDRn6wUMegvb32Ee7BOvbLTHhLaL42sos6aqNywG2nPyVvI6sr7KZquJo1UbeRiv8ELc3up4ex+4VTHcynfAXfgZGIkFKQviPZBwc8E7N1DN4mxaF/Ibnq8U8Jt6ub/oNCT76tauu+LE0gUq8eZov5LugFKYzCvqxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QkaCIQzisRqxKoxe93GeFU157LBKSiuLUmcqzfECJc=;
 b=f+XLDRzBWc6AfvumJqzAkqzDRiHe6NPYFzKnJ+coXdXEGrvLaRoQwTzXFR+J8G0ud2fRWBpzBgi1upX1+HXZV3loOlu1mYp49DLqXWzeFk4Fn+XbIED46yAk8nLOzuYy63jJLhQEix4J5/I8MZfpOXogfs2AeBwH7iDlnF9Nz6Ed3gv1MRIY965zneuzi5zjf5+qQkt69qt+uHdnP2GQuNS68jiJXUvUgAyll7uqyQhnXoFFqxYhCXA9EugWdC/4Ulqm3iqtjBhnlwtSxhJ1byPVOqBCPEzUE7rCwZ5D/yJKp0abnc3U+doZtU+bG2ms/bjaFtYL3/F2vsWbo4kXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa19f4cf-6f62-3bf8-7057-7dae1cf28162@suse.com>
Date: Mon, 29 Nov 2021 10:10:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/3] x86/vPMU: convert vendor hook invocations to altcall
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
In-Reply-To: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33472705-3384-4936-fce2-08d9b3180818
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54693209D8093C0677F09D56B3669@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SDQ+uVTQAN9IpUVMh1H/U8st9K+VnQ8yQRiOKWKjR+g/sxhf7f1dBFW8clCrW5/W7A+OyamL9HW/VEbINKulA6oLN9yOqLZGJEexB4LM/HbdXTukCfO77WTyTvMJF5eePq2hMXM69zDv9fSeX9x+oaLD38Nb5kyyc3zfby2bQC7NWVwWc87FmDgHFQc4snrjS6lTcXTpUgRjXVLO9YclAeqknmbmvplNK6w1sdmg19oVX9SVX6TIul2fjI8si0OqTkOha0L6zJ+BhQUUAkSvSHNC0Ala0otgYWi7SY6ueeKtz9vv6ifC0xSpfHkGsd7UQxF4dkFlEF1XHVkXQl5lSkG1CfM2ztt4QryGif/IaBunbAwpnot8cYAb5jtatssUPjkSneneollmQxQnHleFv8NSpnmEhkkjxNsrCRbyV/zZTz++xgFGV34jCNzKeMUppk20MTfe8H3qrKD6PkhL2nqlrDXLuO7EnlP4bMnLTyBedWdQkOVftMWqVjyMQnUnQByMDfP22RyL6Pb7A2Abw3evVr7oi4AHVoLYuwQ83107M5s/ZkCAZlKh6soFRStvjIlHfdSpDdMJfqXM0Ox8oRk9i+EnUqIIqk5/JnnOET750RQD5t4WZiOqRbMbCig/x1KszvEnBdJ1FNWrgfx5XNojq2j3T2QvAE2toKXcBbPKyj18erk80VqI1N24+OFxZYOb/Hlbh/ljBWTNEcOPAyjK2XVpkHdeynUkvn+Xh162yofNlJboV1+at5Nf/Ot7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(5660300002)(31696002)(956004)(2616005)(2906002)(186003)(316002)(36756003)(54906003)(16576012)(26005)(31686004)(8936002)(6486002)(38100700002)(508600001)(30864003)(4326008)(66556008)(66946007)(83380400001)(66476007)(86362001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGwrWlowVzc4SkhZa2JBT3dUamJPdGdBNUFVUUFlVkZ6SWh0K1dmcDVIOGJT?=
 =?utf-8?B?M1lUNWFGMWdEVVhLdVZETHlxUWJjaFRzeUxwcHVWR0tYeVpPL2FYRlNtaGVu?=
 =?utf-8?B?bkhwTUdnR2pvY0Zmekk0emZtUFhMWVJ3dFh1R0ZLeW5hRW1PQTh0bmRTQTVD?=
 =?utf-8?B?N2NHUGRDSFhYWXNZck9TcnF3N0k0VWM4dXZTMHV5aytSQkZBVk1FbTVSQWY4?=
 =?utf-8?B?VmFXNmZyRm11U3JYaUxMbzRXM0R1QW50VjJuMHRJSnNyUlpxRFVDT1M0UVN4?=
 =?utf-8?B?NG9PRzNIMkowRDZ1ZzB5L0VtMWZLU2pSUXhXaURsbDN0MkEyeXVkYlVnUEgx?=
 =?utf-8?B?ekNsSlpsamxrZE40b0pHdkg0c0NOMkUyYjBzRXJDSGNJb1pzem9OZFhIRTNZ?=
 =?utf-8?B?NFRKeW1lYW8wV0pIUWZENm9HOTRZWENNV2w2clNJMk5VWGs4Rmk4UkxuMW9m?=
 =?utf-8?B?TUJncHVkTmhjOFptTGxsZHpTOWxLZUhPZkpWemkvb1hxVUgxL2ZVVkYxZ1VO?=
 =?utf-8?B?cGZFY01ZdXhyODk1WlZua2h6SVRGTC9tZUh4WHZQdU9YWWoyWHg3cnBwUXhn?=
 =?utf-8?B?eTFmRGZ4c3RVQmpiQkJ2T2JQYlEzdjl0cnlyMzU5bVlCbkJoaTIxbUloTWJh?=
 =?utf-8?B?dkxWNFpvcnhLMis5UCs3azBtNGlKakpZa0c0SUZNUEk4Wk4xUStSS3ArOHZ4?=
 =?utf-8?B?TWllSDZZRTlOamFVQ3NYZEF6T0NsQi8vcnpWTStBS2Y2dDVwT0RON3lvWFpM?=
 =?utf-8?B?KzJ6VFdpT0N5aHB3Q2VXTWlJczBuQ3NiWEJPZElOTlFRL011SFA3QkxzNnA4?=
 =?utf-8?B?SHQ0OVUwN1ZIU2t5ME9tc1hVYlk5NUJYYktIQWswUTlMLy9yV3h3eWxKQ3U1?=
 =?utf-8?B?RXkyc01odGNPQUpXZ1B2OExEaGIyMCtYdlhXaFR4NDhNRjRPVytodURTQmhw?=
 =?utf-8?B?Q0ZWWXpmTFZJT05mWmlSbGJyNHFxUDNSQ0xFUFNTaXNWNWczOWwrbGkxTDVE?=
 =?utf-8?B?RFJSdWJ1U2tFa0hETWhiWVFUQlFZV0NUeGI4amdVREVLNXhBK3Nka29ST2Mz?=
 =?utf-8?B?VTd4MDZDVDNCUGRZWXV1RXhpbHJua0tHR21aRllkUFFaMzBOWU5RaTNFYUlW?=
 =?utf-8?B?cGp5RGFKMUdQRTNZWmlCK1dqc01CMzNrUFRFSUh3UTFtenZQSUk4bjdjcGVj?=
 =?utf-8?B?cDV6d0EySFVuaEZjWXBEVUhseG1OcGZMSVIwclZuM3dxOU9BWXpwejdkUXhI?=
 =?utf-8?B?TzYwNG5YZXY3ZHRsVDhPNEtEdlE2R1hwSFpycEQzVmRDaUtIWUR3em9hSGxh?=
 =?utf-8?B?c0tnekNvcnd0WWVBSElEa21RMVhJYkhoNWtXZEtSN2Z4aTE2N0Z2MDBEQVNt?=
 =?utf-8?B?SXpkNkttVVZKYnMzT2t1WTZXSzMzTWpQa1FnMXYxN3ZRSEpmaVZzdUtZMHNO?=
 =?utf-8?B?MGJldVRUbXN3Uk1la0FTZGpwRXdPZ2w5QmhCV3dOdnl4eU5FQUk1ZTBlODdK?=
 =?utf-8?B?Q0NySVZlQ3AxcTJQNEZSR0FqMkg2aDc4UEl2WTl3dS9Ra0FLMFhVaEFjN1hz?=
 =?utf-8?B?algzejkwZXNwVFJWN1NCRXB0cWVHcGtXdkZJaXRQYUtiZHMwU0VMYTcwTnJS?=
 =?utf-8?B?QlJaT3RWOU5YQTBlYWFaM0F1alR4dzg3dWJNOE1GMlBQSS9YRC9MUHVzR05N?=
 =?utf-8?B?dGtYT2l5NTE1dWVBKzM4Wkg5L1VhQzFvTzk0T1VBdjZvdGVjbW1yeTI3T0lC?=
 =?utf-8?B?VFZNclRiT1VjMTVmeWN0V3Vqcnp5WnNTcmZxdkJPcExkdjBmcTBUZjlVRHda?=
 =?utf-8?B?a3MxWWZrUmNIb2g0VUJ5N1l0dEZlYlY0d1BmRUdZQWpWTEE3TjE4SlFzemZ2?=
 =?utf-8?B?Q2haZmFrcmdMTEIyL2MyeEtkNU9mTXZ6Vjh6R2NwQmJsT21kSzlZUEc2QkMw?=
 =?utf-8?B?T3Mva3FtVkpOMzlaUVQ3Zm9YOStlbit4Wjlna09udjAxVTk3eW5WYXZuYjVK?=
 =?utf-8?B?T0haSERRRXdhUEVFMmEyOGxFZ1JNWUplTkJQdjZGd0tkd3hXQ3hSd3dqaGVQ?=
 =?utf-8?B?MFpNaktpWFNVcVdhaW1rQmhLaGlrRjk5elQ2c2tHM1V5RDVKSTVNSXpQQnR1?=
 =?utf-8?B?UkJvNThiSjlja2p4MjAzeU5HYnhBUmZYSjJXQ1ZKV2ozaVJrb1pHOE9PTGxy?=
 =?utf-8?Q?MBbje+XWbHN9UlJ4s7IXbTc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33472705-3384-4936-fce2-08d9b3180818
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:10:04.7927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzNQ63osYpsuATXUMZPaA6TGtkhFzLs3mF5k5/jkQhqp9gn6WD4PzGRmvxtgohoKXV26XvovWKAPrCtHPIkFDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

At least some vPMU functions will be invoked (and hence can further be
speculated into) even in the vPMU-disabled case. Convert vpmu_ops to
the standard single-instance model being a prerequisite to engaging the
alternative_call() machinery, and convert all respective calls. Note
that this requires vpmu_init() to become a pre-SMP initcall.

This change then also helps performance.

To replace a few vpmu->arch_vpmu_ops NULL checks, introduce a new
VPMU_INITIALIZED state, such that in the absence of any other suitable
vmpu_is_set() checks this state can be checked for.

While adding the inclusion of xen/err.h, also prune other xen/*.h
inclusions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -17,12 +17,12 @@
  *
  * Author: Haitao Shan <haitao.shan@intel.com>
  */
-#include <xen/sched.h>
-#include <xen/xenoprof.h>
-#include <xen/event.h>
-#include <xen/guest_access.h>
 #include <xen/cpu.h>
+#include <xen/err.h>
 #include <xen/param.h>
+#include <xen/event.h>
+#include <xen/guest_access.h>
+#include <xen/sched.h>
 #include <asm/regs.h>
 #include <asm/types.h>
 #include <asm/msr.h>
@@ -49,6 +49,7 @@ CHECK_pmu_params;
 static unsigned int __read_mostly opt_vpmu_enabled;
 unsigned int __read_mostly vpmu_mode = XENPMU_MODE_OFF;
 unsigned int __read_mostly vpmu_features = 0;
+static struct arch_vpmu_ops __read_mostly vpmu_ops;
 
 static DEFINE_SPINLOCK(vpmu_lock);
 static unsigned vpmu_count;
@@ -120,7 +121,6 @@ int vpmu_do_msr(unsigned int msr, uint64
 {
     struct vcpu *curr = current;
     struct vpmu_struct *vpmu;
-    const struct arch_vpmu_ops *ops;
     int ret = 0;
 
     /*
@@ -133,14 +133,13 @@ int vpmu_do_msr(unsigned int msr, uint64
          goto nop;
 
     vpmu = vcpu_vpmu(curr);
-    ops = vpmu->arch_vpmu_ops;
-    if ( !ops )
+    if ( !vpmu_is_set(vpmu, VPMU_INITIALIZED) )
         goto nop;
 
-    if ( is_write && ops->do_wrmsr )
-        ret = ops->do_wrmsr(msr, *msr_content, supported);
-    else if ( !is_write && ops->do_rdmsr )
-        ret = ops->do_rdmsr(msr, msr_content);
+    if ( is_write && vpmu_ops.do_wrmsr )
+        ret = alternative_call(vpmu_ops.do_wrmsr, msr, *msr_content, supported);
+    else if ( !is_write && vpmu_ops.do_rdmsr )
+        ret = alternative_call(vpmu_ops.do_rdmsr, msr, msr_content);
     else
         goto nop;
 
@@ -153,7 +152,7 @@ int vpmu_do_msr(unsigned int msr, uint64
         vpmu_is_set(vpmu, VPMU_CACHED) )
     {
         vpmu_set(vpmu, VPMU_CONTEXT_SAVE);
-        ops->arch_vpmu_save(curr, 0);
+        alternative_vcall(vpmu_ops.arch_vpmu_save, curr, 0);
         vpmu_reset(vpmu, VPMU_CONTEXT_SAVE | VPMU_CONTEXT_LOADED);
     }
 
@@ -202,7 +201,7 @@ void vpmu_do_interrupt(struct cpu_user_r
         sampling = sampled;
 
     vpmu = vcpu_vpmu(sampling);
-    if ( !vpmu->arch_vpmu_ops )
+    if ( !vpmu_is_set(vpmu, VPMU_INITIALIZED) )
         return;
 
     /* PV(H) guest */
@@ -220,7 +219,7 @@ void vpmu_do_interrupt(struct cpu_user_r
 
         /* PV guest will be reading PMU MSRs from xenpmu_data */
         vpmu_set(vpmu, VPMU_CONTEXT_SAVE | VPMU_CONTEXT_LOADED);
-        vpmu->arch_vpmu_ops->arch_vpmu_save(sampling, 1);
+        alternative_vcall(vpmu_ops.arch_vpmu_save, sampling, 1);
         vpmu_reset(vpmu, VPMU_CONTEXT_SAVE | VPMU_CONTEXT_LOADED);
 
         if ( is_hvm_vcpu(sampled) )
@@ -321,7 +320,7 @@ void vpmu_do_interrupt(struct cpu_user_r
     /* We don't support (yet) HVM dom0 */
     ASSERT(sampling == sampled);
 
-    if ( !vpmu->arch_vpmu_ops->do_interrupt(regs) ||
+    if ( !alternative_call(vpmu_ops.do_interrupt, regs) ||
          !is_vlapic_lvtpc_enabled(vlapic) )
         return;
 
@@ -349,8 +348,7 @@ static void vpmu_save_force(void *arg)
 
     vpmu_set(vpmu, VPMU_CONTEXT_SAVE);
 
-    if ( vpmu->arch_vpmu_ops )
-        (void)vpmu->arch_vpmu_ops->arch_vpmu_save(v, 0);
+    alternative_vcall(vpmu_ops.arch_vpmu_save, v, 0);
 
     vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
 
@@ -368,9 +366,8 @@ void vpmu_save(struct vcpu *v)
     vpmu->last_pcpu = pcpu;
     per_cpu(last_vcpu, pcpu) = v;
 
-    if ( vpmu->arch_vpmu_ops )
-        if ( vpmu->arch_vpmu_ops->arch_vpmu_save(v, 0) )
-            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
+    if ( alternative_call(vpmu_ops.arch_vpmu_save, v, 0) )
+        vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
 
     apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
 }
@@ -426,13 +423,13 @@ int vpmu_load(struct vcpu *v, bool_t fro
          vpmu_is_set(vpmu, VPMU_CACHED)) )
         return 0;
 
-    if ( vpmu->arch_vpmu_ops && vpmu->arch_vpmu_ops->arch_vpmu_load )
+    if ( vpmu_ops.arch_vpmu_load )
     {
         int ret;
 
         apic_write(APIC_LVTPC, vpmu->hw_lapic_lvtpc);
         /* Arch code needs to set VPMU_CONTEXT_LOADED */
-        ret = vpmu->arch_vpmu_ops->arch_vpmu_load(v, from_guest);
+        ret = alternative_call(vpmu_ops.arch_vpmu_load, v, from_guest);
         if ( ret )
         {
             apic_write(APIC_LVTPC, vpmu->hw_lapic_lvtpc | APIC_LVT_MASKED);
@@ -572,7 +569,7 @@ static void vpmu_arch_destroy(struct vcp
         on_selected_cpus(cpumask_of(vpmu->last_pcpu),
                          vpmu_clear_last, v, 1);
 
-    if ( vpmu->arch_vpmu_ops && vpmu->arch_vpmu_ops->arch_vpmu_destroy )
+    if ( vpmu_ops.arch_vpmu_destroy )
     {
         /*
          * Unload VPMU first if VPMU_CONTEXT_LOADED being set.
@@ -582,7 +579,7 @@ static void vpmu_arch_destroy(struct vcp
             on_selected_cpus(cpumask_of(vcpu_vpmu(v)->last_pcpu),
                              vpmu_save_force, v, 1);
 
-         vpmu->arch_vpmu_ops->arch_vpmu_destroy(v);
+         alternative_vcall(vpmu_ops.arch_vpmu_destroy, v);
     }
 
     vpmu_reset(vpmu, VPMU_CONTEXT_ALLOCATED);
@@ -689,10 +686,9 @@ static void pvpmu_finish(struct domain *
 /* Dump some vpmu information to console. Used in keyhandler dump_domains(). */
 void vpmu_dump(struct vcpu *v)
 {
-    struct vpmu_struct *vpmu = vcpu_vpmu(v);
-
-    if ( vpmu->arch_vpmu_ops && vpmu->arch_vpmu_ops->arch_vpmu_dump )
-        vpmu->arch_vpmu_ops->arch_vpmu_dump(v);
+    if ( vpmu_is_set(vcpu_vpmu(v), VPMU_INITIALIZED) &&
+         vpmu_ops.arch_vpmu_dump )
+        alternative_vcall(vpmu_ops.arch_vpmu_dump, v);
 }
 
 long do_xenpmu_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg)
@@ -870,6 +866,7 @@ static struct notifier_block cpu_nfb = {
 static int __init vpmu_init(void)
 {
     int vendor = current_cpu_data.x86_vendor;
+    const struct arch_vpmu_ops *ops = NULL;
 
     if ( !opt_vpmu_enabled )
         return 0;
@@ -886,36 +883,36 @@ static int __init vpmu_init(void)
     switch ( vendor )
     {
     case X86_VENDOR_AMD:
-        if ( amd_vpmu_init() )
-           vpmu_mode = XENPMU_MODE_OFF;
+        ops = amd_vpmu_init();
         break;
 
     case X86_VENDOR_HYGON:
-        if ( hygon_vpmu_init() )
-           vpmu_mode = XENPMU_MODE_OFF;
+        ops = hygon_vpmu_init();
         break;
 
     case X86_VENDOR_INTEL:
-        if ( core2_vpmu_init() )
-           vpmu_mode = XENPMU_MODE_OFF;
+        ops = core2_vpmu_init();
         break;
 
     default:
         printk(XENLOG_WARNING "VPMU: Unknown CPU vendor: %d. "
                "Turning VPMU off.\n", vendor);
-        vpmu_mode = XENPMU_MODE_OFF;
         break;
     }
 
-    if ( vpmu_mode != XENPMU_MODE_OFF )
+    if ( !IS_ERR_OR_NULL(ops) )
     {
+        vpmu_ops = *ops;
         register_cpu_notifier(&cpu_nfb);
         printk(XENLOG_INFO "VPMU: version " __stringify(XENPMU_VER_MAJ) "."
                __stringify(XENPMU_VER_MIN) "\n");
     }
     else
+    {
+        vpmu_mode = XENPMU_MODE_OFF;
         opt_vpmu_enabled = 0;
+    }
 
     return 0;
 }
-__initcall(vpmu_init);
+presmp_initcall(vpmu_init);
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -21,9 +21,9 @@
  *
  */
 
-#include <xen/xenoprof.h>
+#include <xen/err.h>
 #include <xen/sched.h>
-#include <xen/irq.h>
+#include <xen/xenoprof.h>
 #include <asm/apic.h>
 #include <asm/vpmu.h>
 #include <asm/hvm/save.h>
@@ -483,7 +483,7 @@ static void amd_vpmu_dump(const struct v
     }
 }
 
-static const struct arch_vpmu_ops amd_vpmu_ops = {
+static const struct arch_vpmu_ops __initconstrel amd_vpmu_ops = {
     .do_wrmsr = amd_vpmu_do_wrmsr,
     .do_rdmsr = amd_vpmu_do_rdmsr,
     .do_interrupt = amd_vpmu_do_interrupt,
@@ -529,13 +529,12 @@ int svm_vpmu_initialise(struct vcpu *v)
                offsetof(struct xen_pmu_amd_ctxt, regs));
     }
 
-    vpmu->arch_vpmu_ops = &amd_vpmu_ops;
+    vpmu_set(vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED);
 
-    vpmu_set(vpmu, VPMU_CONTEXT_ALLOCATED);
     return 0;
 }
 
-static int __init common_init(void)
+static const struct arch_vpmu_ops *__init common_init(void)
 {
     unsigned int i;
 
@@ -543,7 +542,7 @@ static int __init common_init(void)
     {
         printk(XENLOG_WARNING "VPMU: Unsupported CPU family %#x\n",
                current_cpu_data.x86);
-        return -EINVAL;
+        return ERR_PTR(-EINVAL);
     }
 
     if ( sizeof(struct xen_pmu_data) +
@@ -553,7 +552,7 @@ static int __init common_init(void)
                "VPMU: Register bank does not fit into VPMU shared page\n");
         counters = ctrls = NULL;
         num_counters = 0;
-        return -ENOSPC;
+        return ERR_PTR(-ENOSPC);
     }
 
     for ( i = 0; i < num_counters; i++ )
@@ -562,10 +561,10 @@ static int __init common_init(void)
         ctrl_rsvd[i] &= CTRL_RSVD_MASK;
     }
 
-    return 0;
+    return &amd_vpmu_ops;
 }
 
-int __init amd_vpmu_init(void)
+const struct arch_vpmu_ops *__init amd_vpmu_init(void)
 {
     switch ( current_cpu_data.x86 )
     {
@@ -592,7 +591,7 @@ int __init amd_vpmu_init(void)
     return common_init();
 }
 
-int __init hygon_vpmu_init(void)
+const struct arch_vpmu_ops *__init hygon_vpmu_init(void)
 {
     switch ( current_cpu_data.x86 )
     {
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -18,9 +18,9 @@
  * Author: Haitao Shan <haitao.shan@intel.com>
  */
 
+#include <xen/err.h>
 #include <xen/sched.h>
 #include <xen/xenoprof.h>
-#include <xen/irq.h>
 #include <asm/system.h>
 #include <asm/regs.h>
 #include <asm/types.h>
@@ -819,7 +819,7 @@ static void core2_vpmu_destroy(struct vc
     vpmu_clear(vpmu);
 }
 
-static const struct arch_vpmu_ops core2_vpmu_ops = {
+static const struct arch_vpmu_ops __initconstrel core2_vpmu_ops = {
     .do_wrmsr = core2_vpmu_do_wrmsr,
     .do_rdmsr = core2_vpmu_do_rdmsr,
     .do_interrupt = core2_vpmu_do_interrupt,
@@ -893,12 +893,12 @@ int vmx_vpmu_initialise(struct vcpu *v)
     if ( is_pv_vcpu(v) && !core2_vpmu_alloc_resource(v) )
         return -EIO;
 
-    vpmu->arch_vpmu_ops = &core2_vpmu_ops;
+    vpmu_set(vpmu, VPMU_INITIALIZED);
 
     return 0;
 }
 
-int __init core2_vpmu_init(void)
+const struct arch_vpmu_ops *__init core2_vpmu_init(void)
 {
     unsigned int version = 0;
     unsigned int i;
@@ -921,13 +921,13 @@ int __init core2_vpmu_init(void)
     default:
         printk(XENLOG_WARNING "VPMU: PMU version %u is not supported\n",
                version);
-        return -EINVAL;
+        return ERR_PTR(-EINVAL);
     }
 
     if ( current_cpu_data.x86 != 6 )
     {
         printk(XENLOG_WARNING "VPMU: only family 6 is supported\n");
-        return -EINVAL;
+        return ERR_PTR(-EINVAL);
     }
 
     arch_pmc_cnt = core2_get_arch_pmc_count();
@@ -972,9 +972,9 @@ int __init core2_vpmu_init(void)
         printk(XENLOG_WARNING
                "VPMU: Register bank does not fit into VPMU share page\n");
         arch_pmc_cnt = fixed_pmc_cnt = 0;
-        return -ENOSPC;
+        return ERR_PTR(-ENOSPC);
     }
 
-    return 0;
+    return &core2_vpmu_ops;
 }
 
--- a/xen/include/asm-x86/vpmu.h
+++ b/xen/include/asm-x86/vpmu.h
@@ -49,10 +49,10 @@ struct arch_vpmu_ops {
     void (*arch_vpmu_dump)(const struct vcpu *);
 };
 
-int core2_vpmu_init(void);
+const struct arch_vpmu_ops *core2_vpmu_init(void);
 int vmx_vpmu_initialise(struct vcpu *);
-int amd_vpmu_init(void);
-int hygon_vpmu_init(void);
+const struct arch_vpmu_ops *amd_vpmu_init(void);
+const struct arch_vpmu_ops *hygon_vpmu_init(void);
 int svm_vpmu_initialise(struct vcpu *);
 
 struct vpmu_struct {
@@ -61,25 +61,25 @@ struct vpmu_struct {
     u32 hw_lapic_lvtpc;
     void *context;      /* May be shared with PV guest */
     void *priv_context; /* hypervisor-only */
-    const struct arch_vpmu_ops *arch_vpmu_ops;
     struct xen_pmu_data *xenpmu_data;
     spinlock_t vpmu_lock;
 };
 
 /* VPMU states */
-#define VPMU_CONTEXT_ALLOCATED              0x1
-#define VPMU_CONTEXT_LOADED                 0x2
-#define VPMU_RUNNING                        0x4
-#define VPMU_CONTEXT_SAVE                   0x8   /* Force context save */
-#define VPMU_FROZEN                         0x10  /* Stop counters while VCPU is not running */
-#define VPMU_PASSIVE_DOMAIN_ALLOCATED       0x20
+#define VPMU_INITIALIZED                    0x1
+#define VPMU_CONTEXT_ALLOCATED              0x2
+#define VPMU_CONTEXT_LOADED                 0x4
+#define VPMU_RUNNING                        0x8
+#define VPMU_CONTEXT_SAVE                   0x10  /* Force context save */
+#define VPMU_FROZEN                         0x20  /* Stop counters while VCPU is not running */
+#define VPMU_PASSIVE_DOMAIN_ALLOCATED       0x40
 /* PV(H) guests: VPMU registers are accessed by guest from shared page */
-#define VPMU_CACHED                         0x40
-#define VPMU_AVAILABLE                      0x80
+#define VPMU_CACHED                         0x80
+#define VPMU_AVAILABLE                      0x100
 
 /* Intel-specific VPMU features */
-#define VPMU_CPU_HAS_DS                     0x100 /* Has Debug Store */
-#define VPMU_CPU_HAS_BTS                    0x200 /* Has Branch Trace Store */
+#define VPMU_CPU_HAS_DS                     0x1000 /* Has Debug Store */
+#define VPMU_CPU_HAS_BTS                    0x2000 /* Has Branch Trace Store */
 
 static inline void vpmu_set(struct vpmu_struct *vpmu, const u32 mask)
 {



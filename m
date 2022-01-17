Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3649060D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 11:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258100.444099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PMz-0001E0-DK; Mon, 17 Jan 2022 10:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258100.444099; Mon, 17 Jan 2022 10:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PMz-0001C6-8c; Mon, 17 Jan 2022 10:36:13 +0000
Received: by outflank-mailman (input) for mailman id 258100;
 Mon, 17 Jan 2022 10:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9PMy-0001By-2z
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 10:36:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4981181b-7781-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 11:36:11 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-RjcETjaGOl6sld1TqBAHcQ-1; Mon, 17 Jan 2022 11:36:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4397.eurprd04.prod.outlook.com (2603:10a6:803:74::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13; Mon, 17 Jan
 2022 10:36:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 10:36:08 +0000
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
X-Inumbo-ID: 4981181b-7781-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642415771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PuPpMRe4iBZJ2b9btJlh43iuryshFfSWWcyP6KkV9CQ=;
	b=Z7zxDaOyAm9rL7QENWCVw0tLc/tNFwWe8i8gXyHXtj9c/lpEcUk4S3NjaKe4O7/fQ3tXql
	JSrJhKKW8O5G40Ttf4MgNOGNR+rpMI6FFI5EFStlo8wE3EvC/VRgEbm/KivahYc56j8Ji5
	wCw9JZ/stzF1NDNPEGNNoTX9sF68xdE=
X-MC-Unique: RjcETjaGOl6sld1TqBAHcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICNRnE9A4BXNZ0GwKxmRYLZm6Odxj/jIxH0XVBn9v73GSqQlveSp4QEX8sV3yppevzrufTRm10LABViSx9V/xTWRb3/ucfVhuh4ahC7qLCHNbWUotguNd9A4jJCMouukRdsLng0IkQ9oe6ODgDpBkq09beOGvAU5shTfOQv0gY1PNka6cMsI0aLbj91XhuutA5r4N+T8+9mkfv5ClI+aWCzwnUHbhCMKsyHUCfoHKC0k2RdgPWKVqEKG9Wn/NyV3yRpluRPGT0ZxcUxcCUciBgsjttq2Fv7MKvd8bwbTOpWMa8/Ba9OcRaaCFpBzbNuwchqhf82SWKrf41//klzSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuPpMRe4iBZJ2b9btJlh43iuryshFfSWWcyP6KkV9CQ=;
 b=S3Qjxc2R+7Aq9Eyl7SF5PVxvCPHDkiQaoYslKnxSaFWHKltdNUQQn1JQ2/2DIWD/QUFcPbfuREILQsPJyywBzMgOdCz3hIaSgfBAVAQXWVeeHfb2397BTCN7p9iJSqmEKD+F9308DiXFa5ywENB8VottSxTaOtUSk99hRSTYgeoK7BanzjfhCGIQN+hdbwmYbHKS2ydYhojNDWfMO6/92VS+C7Xj0mzcCAlDjHYDeWKT+QamX4mbDHhyIIRpUrFIudrulGUxQO9XMfqx5KLJsbDCQvt8uCaIpFDE53THoKqWUJ3q5fOjdJ+M+Uh4KRGfnmoAxU5k18BULpQyqs/tMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08b293b3-e04a-9230-e7ec-dd7da9d198b1@suse.com>
Date: Mon, 17 Jan 2022 11:36:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/time: minor adjustments to init_pit()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1098370e-ace2-4863-eca0-08d9d9a52c16
X-MS-TrafficTypeDiagnostic: VI1PR04MB4397:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43974FF2056EC73C6A6BF4D3B3579@VI1PR04MB4397.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1jcQlTHvC2ls/v9tQbs4+cMIYGqEJFs6VlGfhXVQEsfgA70tFH9yRAS8G4pq2csdXl9cbKs1U6gWE/1RqOjn4G8om36LSqBhoKbCYALQdc8yskkpUsApepgZjREuFuFZGX0HE2UIOF22kFPrv7CeRAdvvzKcowEaWL4Eedlg4lssIXYWBEwlAy71ak38srRZxsjIFHIb4kza6Di6wpIOIaHv/l2EAYsav1WYyuNRkql0J8GQkN1ANYXgYZteLPc37LnoRFtqJ0c8s52+ABD6Y9uV/AgUADuO1XG2ggf9iV+jtr+s0hC7NUmupWRBBtcyOdecz7GR+85VctwMDRYkdi/WGP36Ak81B6QIVe8Y8WUjSzPDAM7AhjZnpR4nLu1j4/rNT2BN4UcWO9R1uN6wsnDSMMVBUG3Q5ov5gHq4zON0GomBkdeOopVs43+EDzGpcHFG5g40GOZ/JdyQLzpSOgaoaYXoD6NNqysuStUWEtXMEN5s0Y9LfC3YS7KpChNWtjGpmBV9GepSRdqCO6SYH42AV3+lo+kF2TkN1WkhZuX4eBxsoEYIAkEXDJ0zFTzVzId82QbtZTMx87vBciGr/vVRUAxytZt2ZoxGA1Xp7xqUcduK2y94vg2RjpS+dazcSgrPWTEB4rJ4v0YgB1LPYdCtS1pIzAGJIQu2NmwmpaXGv7t+CXnUsLimvMza8CIa9WPOXAAIhXZFc6jDeAyq+dvecR8kXg8Ys8UdHlXXbF+Gw2t4GzzuPhA0Fn25rPyA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(186003)(36756003)(2906002)(66946007)(66556008)(66476007)(316002)(8676002)(8936002)(26005)(6512007)(5660300002)(4326008)(6506007)(31696002)(508600001)(2616005)(31686004)(83380400001)(6486002)(86362001)(38100700002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekFZSk94VDJEZE9jZkZVUzFMWDJ5N3ljQVV1UmNVUWpabEQ5N2FwSzd6Wnor?=
 =?utf-8?B?Qlp0aGppV3BzWm8xUE5qUFRUWElURk9Ub0p5Q1EvZHhsOFUwOUpNUDRMaEM1?=
 =?utf-8?B?SjJBUWltV0RnNGNoMzNXdUR3eXZFVW5acUxiaUkyS1FlVFY2bHFkaE13R1hZ?=
 =?utf-8?B?OTYvSldnbUxDOXVXSm1nSU53a2FzQkJhQVR5MUU0RDcxcENTc21NcTNwOW4y?=
 =?utf-8?B?MmViYS9GaHlWdTlDZmNia1B6eXhWamcrWXZYSDVXd21FQlBDampqdkwwUXA3?=
 =?utf-8?B?NW5xQVp5UUVYbGc2TmNFanAzMWlWQVVYT2RWWUNTOXdvb3VscHl4dVRKSVNm?=
 =?utf-8?B?M21pRUM5MmNmc01LbjZTN3ZTUTNvWlZYWnJjTU5NSzZSUHkvNEx3RmlKdm1v?=
 =?utf-8?B?UStyQ2pESXcvVnZiYTNhVlRqVnZVVmhMSTRleEc5ZDFTcEMvajRSeVlEOENX?=
 =?utf-8?B?VkNYYTJsQTh4TGUzZW1xZkNhY2RWWjc1MmZRUEVmOU0rN25udG5tWnpwa1ZW?=
 =?utf-8?B?RlZuRGlwUWdZSXR5aWRzTWhDQ056UUNlNGdVQ2RsS21TWndZcnlkb2lXQzdQ?=
 =?utf-8?B?c01UTDMzOWRlMnlKUnF2eVhFblNWb29yRG5YSEFyUmVsSk8rRVR0K0NvaXVi?=
 =?utf-8?B?VEhrMGt3UTl6VWpxdjN2dFBqdGJIOFVzUXdEOHlNL0UvT09iaXI1VDMwZ1dv?=
 =?utf-8?B?NERqUFhQTGJtTm4wbUpsM1dVMmkwWG1iUWpKMHFYV2lHcDhPVVQxa3hydUha?=
 =?utf-8?B?bXFYTTZDTjg3UWRZODA4ZFVLYS9TN25xNlY5VG5mbncyNmYwbWFrcFZuWlMw?=
 =?utf-8?B?ekxITGlJSVZSN0liZHd4NnFlZ1dUSlFrQmlrc0Z3ZDFkTVo2bVNBMkNxZHEr?=
 =?utf-8?B?SncrM0MrWHhwWlhPQVFYbUVCNmtlUkZaTWpNa2czZTZNdndTMENwK0YzTEJU?=
 =?utf-8?B?d0ZscUZyR2ozV09pVDg1VzRodGU0c2RFNmg2U3d4RFNDK1hCWGE4a2VUdm5T?=
 =?utf-8?B?UVk1RDZYdWtYczU3R2RYdlRzL1ZMSFlpN0xHa1hLODFGWW1MdDhxM0UyZVFS?=
 =?utf-8?B?dzljODEzSDRwSXljYlhaMVZQelpMRGNHclBvWnlKTEhna2RDeEhVYW1VL0FI?=
 =?utf-8?B?M0FaUVlUMFg0UW42OG1tTXo2L2QyUTVCYWI2bHRXWlNoS1A4bDkxaUMxL0E3?=
 =?utf-8?B?bm9aamtHTTVpUkgvU1dMdTQ5ZSs3cGh1MDVMNVZPdzdkcTZUMHNadHI5c0NN?=
 =?utf-8?B?ZC9aWHlxN3BBeUdWTi9icXV3ckZOYnlHbXpPWG1zcUdSNGc0TW0wUFJTVXIw?=
 =?utf-8?B?aXRnNGFPdWJkendmbnphYlYrWlhHWGhXNXJGZUVWTHV0SThLNnpRdE9GeEtN?=
 =?utf-8?B?VUMrRTRja0VMc1BFbG9oeWdIRkxEb3BpaWl1QXBvMzFXdGV0YUhFSkpaOVEr?=
 =?utf-8?B?dWpkaXQvWmg0bFJ2N3lpY0lyNXZuZkV3UkN1NmlHR1NHZ3pYRXBsb05VanlF?=
 =?utf-8?B?Z2ZBRG0zSnBCYjNMMXBRdlJtVVFpV3prU0F2Rk94aGJEaVl2MVNQVXFieVVq?=
 =?utf-8?B?Y1VKWGN1c0JEbzVjRTZ4S2V2aXhPUDVuWG0zTzRDTUlBQisxRGU0Q0RkdzE0?=
 =?utf-8?B?K3MzczJjK3NaZHY4end6UkxxamxySEEySnpBVlVxWGNUb01MVVBMMFNtY1Ay?=
 =?utf-8?B?TnlHck5UVm0xUm4rTEFudTJna3ZkZzNQaHBwSHo2VEdqSTVYSzlCcVZGbFRh?=
 =?utf-8?B?SS9vam5lN1RGRHdpd2w5VmI4MW93Rkd6THhoalNpUDlNd2s1bWppTEthakVu?=
 =?utf-8?B?QldNYmxONzNCcTRQcTNOQTNFVHVXT2tYb00wYXZORTl0SXdiU3FFc0FmdDl6?=
 =?utf-8?B?SWNNUXlCaElsZU1rUWEvN0h3MzkyWmpDRHJvenlacm9mc2NtUm1vNHdVaFZO?=
 =?utf-8?B?Y0Uxc1ltbWZRRXg4SnJtUm9ac0UydkJ2emx0TUZGSFJQTjdmQ0NrQndtQ1U4?=
 =?utf-8?B?aEFtakJoTnZHY0tDazd6RnFkaEhvZnNOR0Mwdld2SisxdzBla3FnejlVSFpm?=
 =?utf-8?B?emtCWkVyMmVOeFd1dDI2bGRPbnNJWVVUbzRSb1E2RnFNNGhuYlZ2Ni9mN1di?=
 =?utf-8?B?TGM4VXBGN1lsbHhqQ3kveWJqWVVlY0M5V0FKRGNXaDFXS1poNThTYjlaSjU3?=
 =?utf-8?Q?WKPj6qfKMhQN/VpijPu+9GU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1098370e-ace2-4863-eca0-08d9d9a52c16
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 10:36:08.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QPzfe32id4icgfWEdXNV+oQp5DeKvTiJGRpie/lDQIBLnQaITlFv/mdmNELy6QsZeLFOgb/nwmzt5Ki90/tDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4397

For one, "using_pit" shouldn't be set ahead of the function's last
(for now: only) error path. Otherwise "clocksource=pit" on the command
line can lead to misbehavior when actually taking that error path.

And then make an implicit assumption explicit: CALIBRATE_FRAC cannot,
for example, simply be changed to 10. The way init_pit() works, the
upper bound on the calibration period is about 54ms.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really I've noticed this while considering what would happen if someone
specified  "clocksource=pit" on the shim's command line. Unlike "hpet"
and "acpi", "pit" presently wouldn't be (explicitly) ignored. While,
aiui, right now the only error path would be taken (due to port 0x61
reads being supposed to get back 0xff), I don't think we can build on
that longer term: Seeing what we use port 0x61 for in traps.c, I think
sooner or later we will need to have some form of emulation for it. Such
emulation is then not unlikely to continuously report 0 in the bit in
question. That would leed to an infinite loop here.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -333,8 +333,6 @@ static s64 __init init_pit(struct platfo
     u64 start, end;
     unsigned long count;
 
-    using_pit = true;
-
     /* Set the Gate high, disable speaker. */
     outb((portb & ~0x02) | 0x01, 0x61);
 
@@ -344,6 +342,7 @@ static s64 __init init_pit(struct platfo
      * (LSB and MSB) to begin countdown.
      */
 #define CALIBRATE_LATCH CALIBRATE_VALUE(CLOCK_TICK_RATE)
+    BUILD_BUG_ON(CALIBRATE_LATCH >> 16);
     outb(0xb0, PIT_MODE);                  /* binary, mode 0, LSB/MSB, Ch 2 */
     outb(CALIBRATE_LATCH & 0xff, PIT_CH2); /* LSB of count */
     outb(CALIBRATE_LATCH >> 8, PIT_CH2);   /* MSB of count */
@@ -361,6 +360,8 @@ static s64 __init init_pit(struct platfo
     if ( count == 0 )
         return 0;
 
+    using_pit = true;
+
     return (end - start) * CALIBRATE_FRAC;
 }
 



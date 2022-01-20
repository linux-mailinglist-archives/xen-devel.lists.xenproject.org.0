Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27146494FBB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259069.446805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY0g-0005l1-3Y; Thu, 20 Jan 2022 14:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259069.446805; Thu, 20 Jan 2022 14:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY0g-0005i5-0D; Thu, 20 Jan 2022 14:01:54 +0000
Received: by outflank-mailman (input) for mailman id 259069;
 Thu, 20 Jan 2022 14:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAY0e-0005h6-2w
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:01:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83ab6f8f-79f9-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 15:01:50 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-SYN7Nkm2PJWCzfBHQO-EaA-1; Thu, 20 Jan 2022 15:01:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 14:01:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:01:47 +0000
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
X-Inumbo-ID: 83ab6f8f-79f9-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642687310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0YsKdV6uZ18YqS08UEoyfFYI3+Qi3Lvp81hkT8LibU=;
	b=WFhDGRAMcvfJ/k9c+fCHm06a9jgHgeHoM1b2eRTz4Pc49S9f0DXkj7sgnAL1jxOA+gpy8I
	6j3Km/XbSda98HnSF05ZL76Disd26nqEFAcfzSLAOdPILuK5ZdvdJuavXL+vuciokAaPpn
	q4Tyn23HDLkUDX1oX1s2hHiS1ayXwB0=
X-MC-Unique: SYN7Nkm2PJWCzfBHQO-EaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJkIRTDdr9yTKKlRy4+aMI71fgNTuGzMQoypgdp+uaC8+BzWJldx15BwnoX1S3wnU16X0h+a8fbNWHWDjIU3hoDbTGQ2p3HUUddZTE9SMNGXQ4N4fELshJuVudV3e7JaaxoIkKTfh3QOtvQIQX/2L41uTHmD6fT5lGeyn96N54k9WxrqXRdxzoj2tgK2TzorwzHUVGz9fL7Wt81hhY8SFr2L/eXssjPomEsC/Q4uXo6nWStqxi/fC2Ql7UOvPHH+TebuMNNs728NF542ftJqXWhMJWzwGod1KsgPfxJAdH1RQDjb9dkwAxWPtEyFUIC1X+dYE/kpS0m+FQzfh/3d8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBVJF/blL7ivJrHo/Fn27+e07AgCpQ/eYBa2em1lgw8=;
 b=OuLJECBNq5s1nKFUzJuNvntvOFyltXQsJhfWQJtwSfYvYf+o87PtC2RF6yY5E4YGUTpvOR7NoGG/eT12MksJbnJMWmkiaHV6afAtK2xS73D+lBGB+eepZH39POTDPEfRa6bv8AUBdfDWcw1dIfyQoVh1gaQRwMeloFN0atmqKk4AWYkIh7+rjQy6wZkXLGh2BPC8gsPJ+Dqnn1mBjrqHHR0/JLK7bhwpBRBOUFbBYohZWSjXY+a5P0d++w6wug980AmAGFKErlwlFGluDiWhuwfRfQFUHClA/WbIUtaDYgI1yO2s9DUqaFFnCxTSJyBblOTrxvHvOiQ7dYIlJ8C4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39f83895-e01a-bfd8-708b-eedbb145d5fb@suse.com>
Date: Thu, 20 Jan 2022 15:01:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 1/5] x86/mwait-idle: stop exposing platform acronyms
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
In-Reply-To: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3d7a9b-d959-426c-e598-08d9dc1d65d8
X-MS-TrafficTypeDiagnostic: DBBPR04MB7643:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7643429200BD7DAA94723C28B35A9@DBBPR04MB7643.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EMnrL4LdkpRLnz7pxv/BOLzv95JsWGAQA2tfWERhhwW7k/32hA9Wkrmm8GKFN4RLRgh/STisCDNWXxhkpi3P7SZTR7YoC0tsz7RKsYoPEz4fiG8JXCzHEyC3whT3QY7RtxiGVAKJq8A/JwA2TlJV0Rt0Uu3WwtdzCQdrm/5B6cDzKgLks3LH9EM1zAgJy4xZU2bjLom2XrVq3nabLQ6sEP9cKCXsE4WHa2ZpgAAhsy2heOcoDuwaSI4l3IHim0DsqGx6KcgkkOiBpRuCfL6asAXNQ3HoGPmnRz/cz/yrtBg0ABdzLJr/rliV8Y2q1Fuj1dmDakUzTjfE1P69UNpCraB3P3KbWdENJjhbXh4nVTeTTMzGlnPw+ZbOw/L//rlxA9ppj27lIuVL9hHhyosw71OKNJmXELtIEqflYRSGy6f8FpiCRT+YYVZZBTVl06drE8u3hSbmkJNbYc8SRSQGIIW9O6/YhvaI7TBEuVXdCRU6NSvT5IlgzEtd8gg9UAk9PmPS7MwQCuKBRtcNUTLvpN2eeg61q6ru1WX+VhFgQB/tBqDa5mzHbIT2nlofzJ36awgQcHLXct138Vatwcnz9xOlBDiRjJNZ1VbE1I1rsJsV6jy0PTSlGiB2uQkujhyaOU56oD3402DKeOJpZyceCPDMYT7bNbhWY4/u/3PrxBgaO5KqrlpEH9Oh3eKMQL6HjnKfz0g5itOh3Jaj2+QyHrGDoWC5mafp0LEb4T+YhX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(31686004)(36756003)(30864003)(66476007)(508600001)(8676002)(31696002)(8936002)(38100700002)(6486002)(86362001)(186003)(2616005)(83380400001)(6916009)(66556008)(66946007)(316002)(2906002)(5660300002)(26005)(6512007)(54906003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l0+1Nf18YJRU2ATFHY/NPiYGcUmLYFlsLwK7g9f24wUF9xJWSX6iyanuqtne?=
 =?us-ascii?Q?U7ljTS7cM7uo72noHg1CQwMSS0WCNvXVC/D5K+jUj7Y8ds8Dgdh4aHclR8dJ?=
 =?us-ascii?Q?ka24AWokO6ttIxpC64Ye41/+/vJ3atLXVZCkRVxbtyN/gAPQmecWwAETZPXl?=
 =?us-ascii?Q?7RhOM7zRTGMyg2SPQeuTPGZ5zqCBwOPx3GRvP7pwK0MriUwW5/W3KUEwYuJW?=
 =?us-ascii?Q?G2yxiylMuraaq6kAA4qHGI9BSNF3+bpK0urUeZmN8SAOpdEbfWhham0Wk7ML?=
 =?us-ascii?Q?J5vxl79GPFISRbLqLWkcS2RmI3dfx8oUwSnJUsuRAimsKXlskieluAfCmBQv?=
 =?us-ascii?Q?9OwgZ/ZfYpmzWYU3D08Hy4xd0DvqnIoUzTvmX5pLHqZUIskfF1morp6kVe1F?=
 =?us-ascii?Q?ENOckHrPTcOEGw/OZPFpyZF+QRt9CrnpZc1LIBHy80dCRMLmEH0iFHXhTqFb?=
 =?us-ascii?Q?TOGQWiaylKINXAoyw8tS3L2LnohLwLoBryZPYPGdb//beGvEwJMwlQr5nzUO?=
 =?us-ascii?Q?LBKA7B+Uj9ZQKmjpkPTRd5BGdAmPjs27iSOS5dRF/fXHPRE4ZwN+ZsCVGXZb?=
 =?us-ascii?Q?LoAqkNZLrGmbZVIJNr9AivcDs3pXu1TnANtmYzwElHP3S7eGPSuxj0VjgnZr?=
 =?us-ascii?Q?yr89cA0jebGbFBdOWs/jIhwKZxsYRWDkmFbOfo4xXnMwe15WE5y382Ut/4aa?=
 =?us-ascii?Q?EmppIwxhZYCbLhUJqDAk18zwBZcuM/2j8OpUvlZyHRi0qAb+I22O0c2YgTQ/?=
 =?us-ascii?Q?+SEwMrmzZYLsdApp567Bqpvab3Tku8lVy09VTHP/eO3zw7FIrpL3IzgGmfAZ?=
 =?us-ascii?Q?vznDUowIbzVvjHYmwS2fPE5zpZxtXdpT/kQVSlG3mbeofvpYK53F319jHN17?=
 =?us-ascii?Q?9lxPqnNyzwSoEK0I6cWoWqb0ruiRl/AxMXVhQKke0JSoDGTO2BYqmhz7ebYQ?=
 =?us-ascii?Q?AlTQcttcr9XXRt69sNU2GJjsFevgY/qmVdGhhWaOg78grH/YhooM6jj+mgNJ?=
 =?us-ascii?Q?iQg4BWiM4xPqUueRrXeh/ptv77MgohDyAzhSzfXh+NFu7qY5GJ+Iz6idMyIz?=
 =?us-ascii?Q?nyMmJJd8GT/7Mx+PyoR9jA5eQO4diday1I3TyxHeousumg7oBhqJHwo4Fku3?=
 =?us-ascii?Q?NwpdAIqGrY1CCOeEOZqAlrOH+zShF6ZI7xFkbSaMDAMJXLRxzZxsJxrFko7z?=
 =?us-ascii?Q?ubroHrE+0eo3U79gv08UZcq/xnGul6zPNsWyUdxhpNSo99grhyDZeOO6geky?=
 =?us-ascii?Q?ir20X9o2sfLcxHRMTAeppkTSUqpnS12cMb6psspCXoBKrmqWbuz73WG5P5l/?=
 =?us-ascii?Q?sITh2MdK5Bp/OSOXSeGjTWeGEAlTAHjbVTz0d5s0osBRGpjq4HJI4BwokH3R?=
 =?us-ascii?Q?9wljZ+2ekjAT3yyDxeYaPVQNmMdmhXSLFcDuzsHCsElSDChVc2ZOJN1kM/w3?=
 =?us-ascii?Q?lCdWkFDBkkfxkmy+isI3xLi9KExDDIKY3Y3kSc7G1ySpIBlOKswHZ2XMhY6l?=
 =?us-ascii?Q?1H85BSkWwot+RJaAwTkd9c7w/opdl9a2TcS3AkNBX8e9uAP1gBjLE0ojlsHF?=
 =?us-ascii?Q?slzwzVdAIss0vNtfY+X35Kwx9AsxIk01oR8Fl+1s6vkaC6RBT4Txnj1DUQxu?=
 =?us-ascii?Q?KZdDJkcIVd6ysln7Hk0my9Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3d7a9b-d959-426c-e598-08d9dc1d65d8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:01:47.1990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFe1zjVDv13gpXjix8+osDLCj9Jgin8nhoIw+ROZFxOXTQ97A3rXx2GlEYFjcCDs3B5TJsUcJaXvrAHV7ZrGFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643

This follows Linux commit de09cdd09fa1 ("intel_idle: stop exposing
platform acronyms in sysfs"), but their main justifications (sysfs
exposure and similarity with acpi-idle) don't apply to us. The field is
only used in a single printk() right now, but having the platform tags
there isn't useful either.

Requested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -134,25 +134,25 @@ static const struct cpuidle_state {
  */
 static const struct cpuidle_state nehalem_cstates[] =3D {
 	{
-		.name =3D "C1-NHM",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 3,
 		.target_residency =3D 6,
 	},
 	{
-		.name =3D "C1E-NHM",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C3-NHM",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 20,
 		.target_residency =3D 80,
 	},
 	{
-		.name =3D "C6-NHM",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 200,
 		.target_residency =3D 800,
@@ -162,31 +162,31 @@ static const struct cpuidle_state nehale
=20
 static const struct cpuidle_state snb_cstates[] =3D {
 	{
-		.name =3D "C1-SNB",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 2,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C1E-SNB",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C3-SNB",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 80,
 		.target_residency =3D 211,
 	},
 	{
-		.name =3D "C6-SNB",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 104,
 		.target_residency =3D 345,
 	},
 	{
-		.name =3D "C7-SNB",
+		.name =3D "C7",
 		.flags =3D MWAIT2flg(0x30) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 109,
 		.target_residency =3D 345,
@@ -196,31 +196,31 @@ static const struct cpuidle_state snb_cs
=20
 static const struct cpuidle_state byt_cstates[] =3D {
 	{
-		.name =3D "C1-BYT",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 1,
 		.target_residency =3D 1,
 	},
 	{
-		.name =3D "C6N-BYT",
+		.name =3D "C6N",
 		.flags =3D MWAIT2flg(0x58) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 300,
 		.target_residency =3D 275,
 	},
 	{
-		.name =3D "C6S-BYT",
+		.name =3D "C6S",
 		.flags =3D MWAIT2flg(0x52) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 500,
 		.target_residency =3D 560,
 	},
 	{
-		.name =3D "C7-BYT",
+		.name =3D "C7",
 		.flags =3D MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 1200,
 		.target_residency =3D 4000,
 	},
 	{
-		.name =3D "C7S-BYT",
+		.name =3D "C7S",
 		.flags =3D MWAIT2flg(0x64) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 10000,
 		.target_residency =3D 20000,
@@ -230,31 +230,31 @@ static const struct cpuidle_state byt_cs
=20
 static const struct cpuidle_state cht_cstates[] =3D {
 	{
-		.name =3D "C1-CHT",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 1,
 		.target_residency =3D 1,
 	},
 	{
-		.name =3D "C6N-CHT",
+		.name =3D "C6N",
 		.flags =3D MWAIT2flg(0x58) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 80,
 		.target_residency =3D 275,
 	},
 	{
-		.name =3D "C6S-CHT",
+		.name =3D "C6S",
 		.flags =3D MWAIT2flg(0x52) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 200,
 		.target_residency =3D 560,
 	},
 	{
-		.name =3D "C7-CHT",
+		.name =3D "C7",
 		.flags =3D MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 1200,
 		.target_residency =3D 4000,
 	},
 	{
-		.name =3D "C7S-CHT",
+		.name =3D "C7S",
 		.flags =3D MWAIT2flg(0x64) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 10000,
 		.target_residency =3D 20000,
@@ -264,31 +264,31 @@ static const struct cpuidle_state cht_cs
=20
 static const struct cpuidle_state ivb_cstates[] =3D {
 	{
-		.name =3D "C1-IVB",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 1,
 		.target_residency =3D 1,
 	},
 	{
-		.name =3D "C1E-IVB",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C3-IVB",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 59,
 		.target_residency =3D 156,
 	},
 	{
-		.name =3D "C6-IVB",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 80,
 		.target_residency =3D 300,
 	},
 	{
-		.name =3D "C7-IVB",
+		.name =3D "C7",
 		.flags =3D MWAIT2flg(0x30) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 87,
 		.target_residency =3D 300,
@@ -298,25 +298,25 @@ static const struct cpuidle_state ivb_cs
=20
 static const struct cpuidle_state ivt_cstates[] =3D {
 	{
-		.name =3D "C1-IVT",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 1,
 		.target_residency =3D 1,
 	},
 	{
-		.name =3D "C1E-IVT",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 80,
 	},
 	{
-		.name =3D "C3-IVT",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 59,
 		.target_residency =3D 156,
 	},
 	{
-		.name =3D "C6-IVT",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 82,
 		.target_residency =3D 300,
@@ -326,25 +326,25 @@ static const struct cpuidle_state ivt_cs
=20
 static const struct cpuidle_state ivt_cstates_4s[] =3D {
 	{
-		.name =3D "C1-IVT-4S",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 1,
 		.target_residency =3D 1,
 	},
 	{
-		.name =3D "C1E-IVT-4S",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 250,
 	},
 	{
-		.name =3D "C3-IVT-4S",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 59,
 		.target_residency =3D 300,
 	},
 	{
-		.name =3D "C6-IVT-4S",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 84,
 		.target_residency =3D 400,
@@ -354,25 +354,25 @@ static const struct cpuidle_state ivt_cs
=20
 static const struct cpuidle_state ivt_cstates_8s[] =3D {
 	{
-		.name =3D "C1-IVT-8S",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 1,
 		.target_residency =3D 1,
 	},
 	{
-		.name =3D "C1E-IVT-8S",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 500,
 	},
 	{
-		.name =3D "C3-IVT-8S",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 59,
 		.target_residency =3D 600,
 	},
 	{
-		.name =3D "C6-IVT-8S",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 88,
 		.target_residency =3D 700,
@@ -382,49 +382,49 @@ static const struct cpuidle_state ivt_cs
=20
 static const struct cpuidle_state hsw_cstates[] =3D {
 	{
-		.name =3D "C1-HSW",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 2,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C1E-HSW",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C3-HSW",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 33,
 		.target_residency =3D 100,
 	},
 	{
-		.name =3D "C6-HSW",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 133,
 		.target_residency =3D 400,
 	},
 	{
-		.name =3D "C7s-HSW",
+		.name =3D "C7s",
 		.flags =3D MWAIT2flg(0x32) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 166,
 		.target_residency =3D 500,
 	},
  	{
-		.name =3D "C8-HSW",
+		.name =3D "C8",
 		.flags =3D MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 300,
 		.target_residency =3D 900,
 	},
 	{
-		.name =3D "C9-HSW",
+		.name =3D "C9",
 		.flags =3D MWAIT2flg(0x50) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 600,
 		.target_residency =3D 1800,
 	},
 	{
-		.name =3D "C10-HSW",
+		.name =3D "C10",
 		.flags =3D MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 2600,
 		.target_residency =3D 7700,
@@ -434,49 +434,49 @@ static const struct cpuidle_state hsw_cs
=20
 static const struct cpuidle_state bdw_cstates[] =3D {
 	{
-		.name =3D "C1-BDW",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 2,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C1E-BDW",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C3-BDW",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 40,
 		.target_residency =3D 100,
 	},
 	{
-		.name =3D "C6-BDW",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 133,
 		.target_residency =3D 400,
 	},
 	{
-		.name =3D "C7s-BDW",
+		.name =3D "C7s",
 		.flags =3D MWAIT2flg(0x32) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 166,
 		.target_residency =3D 500,
 	},
 	{
-		.name =3D "C8-BDW",
+		.name =3D "C8",
 		.flags =3D MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 300,
 		.target_residency =3D 900,
 	},
 	{
-		.name =3D "C9-BDW",
+		.name =3D "C9",
 		.flags =3D MWAIT2flg(0x50) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 600,
 		.target_residency =3D 1800,
 	},
 	{
-		.name =3D "C10-BDW",
+		.name =3D "C10",
 		.flags =3D MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 2600,
 		.target_residency =3D 7700,
@@ -486,49 +486,49 @@ static const struct cpuidle_state bdw_cs
=20
 static struct cpuidle_state __read_mostly skl_cstates[] =3D {
 	{
-		.name =3D "C1-SKL",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 2,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C1E-SKL",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C3-SKL",
+		.name =3D "C3",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 70,
 		.target_residency =3D 100,
 	},
 	{
-		.name =3D "C6-SKL",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 85,
 		.target_residency =3D 200,
 	},
 	{
-		.name =3D "C7s-SKL",
+		.name =3D "C7s",
 		.flags =3D MWAIT2flg(0x33) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 124,
 		.target_residency =3D 800,
 	},
 	{
-		.name =3D "C8-SKL",
+		.name =3D "C8",
 		.flags =3D MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 200,
 		.target_residency =3D 800,
 	},
 	{
-		.name =3D "C9-SKL",
+		.name =3D "C9",
 		.flags =3D MWAIT2flg(0x50) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 480,
 		.target_residency =3D 5000,
 	},
 	{
-		.name =3D "C10-SKL",
+		.name =3D "C10",
 		.flags =3D MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 890,
 		.target_residency =3D 5000,
@@ -538,19 +538,19 @@ static struct cpuidle_state __read_mostl
=20
 static struct cpuidle_state __read_mostly skx_cstates[] =3D {
 	{
-		.name =3D "C1-SKX",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 2,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C1E-SKX",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C6-SKX",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 133,
 		.target_residency =3D 600,
@@ -560,19 +560,19 @@ static struct cpuidle_state __read_mostl
=20
 static const struct cpuidle_state icx_cstates[] =3D {
        {
-               .name =3D "C1-ICX",
+               .name =3D "C1",
                .flags =3D MWAIT2flg(0x00),
                .exit_latency =3D 1,
                .target_residency =3D 1,
        },
        {
-               .name =3D "C1E-ICX",
+               .name =3D "C1E",
                .flags =3D MWAIT2flg(0x01),
                .exit_latency =3D 4,
                .target_residency =3D 4,
        },
        {
-               .name =3D "C6-ICX",
+               .name =3D "C6",
                .flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
                .exit_latency =3D 170,
                .target_residency =3D 600,
@@ -582,25 +582,25 @@ static const struct cpuidle_state icx_cs
=20
 static const struct cpuidle_state atom_cstates[] =3D {
 	{
-		.name =3D "C1E-ATM",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C2-ATM",
+		.name =3D "C2",
 		.flags =3D MWAIT2flg(0x10),
 		.exit_latency =3D 20,
 		.target_residency =3D 80,
 	},
 	{
-		.name =3D "C4-ATM",
+		.name =3D "C4",
 		.flags =3D MWAIT2flg(0x30) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 100,
 		.target_residency =3D 400,
 	},
 	{
-		.name =3D "C6-ATM",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x52) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 140,
 		.target_residency =3D 560,
@@ -610,31 +610,31 @@ static const struct cpuidle_state atom_c
=20
 static const struct cpuidle_state tangier_cstates[] =3D {
 	{
-		.name =3D "C1-TNG",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 1,
 		.target_residency =3D 4,
 	},
 	{
-		.name =3D "C4-TNG",
+		.name =3D "C4",
 		.flags =3D MWAIT2flg(0x30) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 100,
 		.target_residency =3D 400,
 	},
 	{
-		.name =3D "C6-TNG",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x52) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 140,
 		.target_residency =3D 560,
 	},
 	{
-		.name =3D "C7-TNG",
+		.name =3D "C7",
 		.flags =3D MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 1200,
 		.target_residency =3D 4000,
 	},
 	{
-		.name =3D "C9-TNG",
+		.name =3D "C9",
 		.flags =3D MWAIT2flg(0x64) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 10000,
 		.target_residency =3D 20000,
@@ -644,13 +644,13 @@ static const struct cpuidle_state tangie
=20
 static const struct cpuidle_state avn_cstates[] =3D {
 	{
-		.name =3D "C1-AVN",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 2,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C6-AVN",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x51) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 15,
 		.target_residency =3D 45,
@@ -660,13 +660,13 @@ static const struct cpuidle_state avn_cs
=20
 static const struct cpuidle_state knl_cstates[] =3D {
 	{
-		.name =3D "C1-KNL",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 1,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C6-KNL",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 120,
 		.target_residency =3D 500,
@@ -676,43 +676,43 @@ static const struct cpuidle_state knl_cs
=20
 static struct cpuidle_state __read_mostly bxt_cstates[] =3D {
 	{
-		.name =3D "C1-BXT",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 2,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C1E-BXT",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C6-BXT",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 133,
 		.target_residency =3D 133,
 	},
 	{
-		.name =3D "C7s-BXT",
+		.name =3D "C7s",
 		.flags =3D MWAIT2flg(0x31) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 155,
 		.target_residency =3D 155,
 	},
 	{
-		.name =3D "C8-BXT",
+		.name =3D "C8",
 		.flags =3D MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 1000,
 		.target_residency =3D 1000,
 	},
 	{
-		.name =3D "C9-BXT",
+		.name =3D "C9",
 		.flags =3D MWAIT2flg(0x50) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 2000,
 		.target_residency =3D 2000,
 	},
 	{
-		.name =3D "C10-BXT",
+		.name =3D "C10",
 		.flags =3D MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 10000,
 		.target_residency =3D 10000,
@@ -722,19 +722,19 @@ static struct cpuidle_state __read_mostl
=20
 static const struct cpuidle_state dnv_cstates[] =3D {
 	{
-		.name =3D "C1-DNV",
+		.name =3D "C1",
 		.flags =3D MWAIT2flg(0x00),
 		.exit_latency =3D 2,
 		.target_residency =3D 2,
 	},
 	{
-		.name =3D "C1E-DNV",
+		.name =3D "C1E",
 		.flags =3D MWAIT2flg(0x01),
 		.exit_latency =3D 10,
 		.target_residency =3D 20,
 	},
 	{
-		.name =3D "C6-DNV",
+		.name =3D "C6",
 		.flags =3D MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
 		.exit_latency =3D 50,
 		.target_residency =3D 500,



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BFC78E8F3
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593525.926514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdWu-0005xN-Lx; Thu, 31 Aug 2023 08:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593525.926514; Thu, 31 Aug 2023 08:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdWu-0005vb-JA; Thu, 31 Aug 2023 08:59:56 +0000
Received: by outflank-mailman (input) for mailman id 593525;
 Thu, 31 Aug 2023 08:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e8Cw=EQ=citrix.com=prvs=600b2b7ad=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qbdWs-0005vU-N1
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 08:59:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdedde11-47dc-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 10:59:52 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2023 04:59:48 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7516.namprd03.prod.outlook.com (2603:10b6:806:399::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 08:59:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::8a1b:5230:3575:dc68]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::8a1b:5230:3575:dc68%4]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 08:59:37 +0000
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
X-Inumbo-ID: bdedde11-47dc-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693472392;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hMyYzgCaDvJgf7HZZucsPL7sidOu00oCTmvIRdKMkfY=;
  b=YGYa6cDqIC54FXz3vD4V4Ukc4Lyp3LCGv9SkAvAWckGy0ztzp9u6WTbH
   8Jrz7AmyIjN3BZa4MMZi94dlRDMmFpZ1yYiE//QMH3Y1PYdq4yV9oVmBB
   UiDKybCGhPaojpN6shJoCvL1KDU51TshxmWDomBkWMhE7EqEz/hy8wxzL
   M=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 121654885
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pk3nPatfvT8oaaUZOnQUulS7u+fnVEVfMUV32f8akzHdYApBsoF/q
 tZmKT3QOvyPNzf2fd9xadnn900PupHVx99hSQZuqi40Rn4W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A+FziFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKmkiVBDcpuWP5p3gR+deoZUEKcvEFdZK0p1g5Wmx4fcOZ7nmG/+PyfoDmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv6xbLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhAdxPSO3oq5aGhnXO/z0DNS8OXGfiitDpi1S1X857B
 1cbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9dJ6G3rKdrDf3NS1OK2YHPXUAVVFdv4Wlp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjvNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:mFB8hqvsYfjv8ZqhyGSc9qhg7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: =?us-ascii?q?9a23=3AKdFuNGpXr/epdhmk+wmB89HmUcJ8XUfdk1bXGmm?=
 =?us-ascii?q?XUmtneprEblqS14oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A9nBVrw3sAQ0s55SyAmZko3ok2TUjvp3/GH0/iZw?=
 =?us-ascii?q?64uKtZS1qMDOBqBisTdpy?=
X-IronPort-AV: E=Sophos;i="6.02,216,1688443200"; 
   d="scan'208";a="121654885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yrliu4xMMKjPN4vzUyOTIvpSy0GHsY2/uendKD28WoXA0IZMETjs4SwPbZmaW/daqq+KOZJAgbcARw1exkeilV3HlUM1/uxQHbimSSj+6JSxsgQ4EjT3mvcSGgqpPLTbRvs3hXxpwl5Lr2JlhuU/Qpq6XmosrRDccDBG5EWYy4CrONE/hHkzCwIag80S60QzX7WiMIx5Od77DY95IPxLU1Ac0/PfqbYGVZjN5F2buA/xNEF4uSCGfLBGm1aVL2ZGwUskh+OL/7GTEn6OmrPR89Kg/yYxlRhRcHzGpb8F0xEMIDn1Op7ahd652+OYSjyaI3F6v7Ejquw8QWNC1vInoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SHvLegtqC+Auo3ugpZEW/aQN9sGY+Qj4PTNiezZYUE=;
 b=ix8aauu8aMrG+g05ehfiNRgrQqEDZbovDkI1UtbNOFI2ewO0xxWeBn2qe2Pl7C0dpSzrhJW9TC8AU81JDpmDzVMLUcv0Wzy8L2x/Z2gDWR3AvGNcujgR8nIGicmCs5SY9An10w19Detbm3S4aaZpu8B8Tk+mW0VERPbCSHjk9GPcQAUKh0/mxVMrg4LgFLKrfaVb6InhH9z2WYPHGPP7k/ToZFDZ9JmSxFOJGzonhLbmcKNvH3ZAc4Bsrqh56RjY6p+bAX9KcTJe3UW7a8LDz8EHHrfneWEx1Z97DjQrL+E+5bvChjVUwKRIQ7u8hItDO/VZY0Ik/6nzfXGq2WLYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SHvLegtqC+Auo3ugpZEW/aQN9sGY+Qj4PTNiezZYUE=;
 b=IzBPTuLS8qppsHo8S4QZmiW1bNCGJTo9UYpFo9Z0J/eY0IIIZVEwf1nru9UkIE/LkQhvlpfPLst3NZqYXm2qYHsSl67RyU8UXBry7tCKHi7kSIcYYoSpMQ5F2AA5B7GcxFXZJUEm0QDgi8bJ9A7b8DoZ3AHJrc3pxd5NbIdBQqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 31 Aug 2023 10:59:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul.durrant@citrix.com>
Subject: Re: [PATCH] x86/HVM: correct hvmemul_map_linear_addr() for
 multi-page case
Message-ID: <ZPBWcyL-nyHKV9zT@MacBook-MacBook-Pro-de-Roger.local>
References: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
 <ZO9Sj5YDjiKIh1G-@MacBook-Air-de-Roger.local>
 <93b3e5c4-19b7-9809-e322-f0973924eef8@citrix.com>
 <5b28f42f-be2d-b826-2bfe-434b0c1742e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b28f42f-be2d-b826-2bfe-434b0c1742e2@suse.com>
X-ClientProxiedBy: LO2P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::35) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 822793c4-7785-4a86-cc16-08dbaa009a73
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tTLaKUcWldzhCzGWZnD2HsZWcieOpH0uoGY0cbJ2M4utIZOBiMC62PElgGFyTndboNnBoOY8uvNxsfkTs9qosCHdyxw69iZBiHSo0zKhdxm5o9s+jxLUC0nkO1XPVbf3aiIcN4D2Z+BQDAgkacDwz6n1FCtHLioyJQjC5F7ECT83NW7yjqP7ekO6lItfBpYGPb24/XEQ3SkW7R2s0zeFsz0hSVVpF7CqNax5mFHVSV8sis7VstH1Rv76kRpXsD/j7P7REQl9QJYJoTFNLLhV6oIg+Y7QuTk0Efg2VSi61koo/whi2ISR0QcSruCZNmdW8CcHimCXt9DZtzaIwQBBl6bsCnOSYLhicZCQjiHR4+aBx9CrZqEq1JdEsofR5nBsCCAr/+cDVqoZPp4iVFXEe+mpdGZoH0S1NrkWkzg4GOJ3N3KTWj219KUXtLyH2h66itTcdx3YiTbmG9Yl5IGH+ED/J32Lgl0F0xIE3aPqk/Aao2svKxPfZnJqZSa0DVx0S7PeioR/xPb2bJIs6XfAcA1w/7Mj8KuZfKcxvSOC4/ozodCP3yrwrvR3awmY1+K7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(186009)(451199024)(1800799009)(85182001)(107886003)(83380400001)(4326008)(53546011)(41300700001)(86362001)(8936002)(5660300002)(8676002)(6506007)(26005)(6486002)(6666004)(6512007)(9686003)(66899024)(478600001)(38100700002)(82960400001)(2906002)(66946007)(6916009)(66556008)(66476007)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnZaaW9BM2FUbmk0bFZrV05CWEZ6RUVUZk5XOHpOcXBwaG5IOC9DQlhWL0pH?=
 =?utf-8?B?YWRDNSsvTTh2bGZQYnhxd09idGdTOWw5N3k4NXNkYzNGK3FWVmdLN3VxYUJm?=
 =?utf-8?B?NkpUbjlSdVFadDFacUdVYlkrekVDQWZsd1JGTTJUbDQzZEV3WWZBWkV5VDI2?=
 =?utf-8?B?V0VZWVdWbmlMbU1BYkI3NFBHT0NNWENUWDB3bW5xRzRnM2ExeFl2SEZrZHJM?=
 =?utf-8?B?Wmw4OE9VcURlSHZFdXczRTFnQ0NCbzFwYVZOUGJPVHV6ZmE1bFZlRU96Ymhm?=
 =?utf-8?B?N3hTeEJIYlBNWlRZSHFjSktYQmRUem5jMVpPS1ZOVXM2NFpPaGhlU3diZjJt?=
 =?utf-8?B?bTIrczdKREFiemVwR3VjRGVUam5YejFyZENCV0c1K2JvQVRacGJkTE5tczEz?=
 =?utf-8?B?YVgvd05WczFBOG5PU0lNVTVjaVZwdFJ0Vk9VU0swdlZMa3Q1cGdNUG1NTlhi?=
 =?utf-8?B?OUNwRjZBYVd5OHJQZGlJSC9pbjh2cGRiRXYxclN4dHltWHdSSWhIa0NWaEUr?=
 =?utf-8?B?cmpva3ZySXVZaXk5cDFKZ09CanhpVmlsTmVaQlVXeUtmbFN1TFRBK0NQZVlj?=
 =?utf-8?B?a3FYZ0lRLzIvM01KT0p0VmZHQTBjNDc1VHNkbHJKYmEwWndoTkk4SVhSOG5W?=
 =?utf-8?B?OGppQWh1UnRCQnNraVJ4WVFuKzh5bE01WHh5R1FhcVhXRU1sMGNBYVA4ZjBh?=
 =?utf-8?B?U2xxbTNzYm5sMXpRRUtXMmN3M2FKdEhwc2YrVFdzYkJoc3RGQ3hVMzBxbTc3?=
 =?utf-8?B?cjU0SUgwNTJtMFExb2R0aHY1Y2gzbXBlOVJIaHNoVUw5NUpPYzlaVkM4a04w?=
 =?utf-8?B?OGdlbWs1VEpEUlRFVXFpc1lZenduSUg2Z2JtUDNva2JUdHpFU0xGdUp0UDdN?=
 =?utf-8?B?bW5RVUZkdDNBVWZOOG9BNGR5UE5QeURpalJHR0ZpZ2ZaUWl4ZUw2SzllMGpw?=
 =?utf-8?B?T2lpb2UvRkFYbGhaOHUycHR6SGh5WXRVRjdWMmFwa09ML3Z2azBjRDZxd1U1?=
 =?utf-8?B?QzIxbVJPNGxaUTNvSlZZclBZSzA2eUlJRmtOQlBncjVXcnlYaU15VE40RUxh?=
 =?utf-8?B?VnR5aGdyRnNJdFQ2SDhNNDJRTWpFeGlWL3Q0ZWFFdUlUUEFvMEI3THBjaWVs?=
 =?utf-8?B?Zm92RVhVNVJRTFc2Mlp5Tkxzc0YxeDhWSzNVcDJVMmh4MW93YktnbzI3elF5?=
 =?utf-8?B?dnptL05yQnArMWdRVmVyQ2xSbjFrNTlBMFNWYm9MY2NkQzgvbVRvbFJoWFA0?=
 =?utf-8?B?dTN4dWpyUGJkR0JyelNETUYvNkxNN3dkY2ZJMTRGdWFiNWFsNXhUekRkeUda?=
 =?utf-8?B?Kzd3R0JNMEFOYko2clgvZlIwZnFHTFN4ZzlqZ1NXRmxZZnpzNlErckZRZ1hH?=
 =?utf-8?B?N0F2OFkwbnFjVVJpUmlxNG1KY0tPZ1NjaGJUaHVSM1lLMG9JK0pJenA0VkJG?=
 =?utf-8?B?ZDY1YUJJalBReHNvVDV3RjBlZ0ZvclVZK2swRC9XWEZiN1poTzdXMDJSOHpE?=
 =?utf-8?B?VEFIVVFsaHFzWWN1NnpTVENXcWkyRHgzWnp1eXpFNHREanRSM2o0MCtNQTlW?=
 =?utf-8?B?WHc5bG1FVE1oL3ZENWpqYXFBQ0hYWEZKbUE5Nk1OekdNbmVwL2lVMXVRbFJ0?=
 =?utf-8?B?dnozV29IUElqUUtCU2p4KzFlK1dKeTVsSEVtdHZZcjVLM0hMNzJEdGlPV1J5?=
 =?utf-8?B?RE41YmNlRDdaVkZUSFprUmNlc3V1V1FBeWtENXVCeDUzVVdQMEFaVlhCT2hM?=
 =?utf-8?B?dDMzTTdJRDVqTmZMNnBVeW95cGY0cHRueWtad0k3OUU3dnJManB2b1NJREN0?=
 =?utf-8?B?akE5Z2g5bVFKSGU2aWprUVlRUXczdGY4a0xXZFRxWGdYZFBnQlpZTVYwaEpr?=
 =?utf-8?B?TFJSWXNjbzYrVUlHWGJpQU9jV1F1bWNSSEtaTzVvRlpSOGk1dXBTVU90ak04?=
 =?utf-8?B?dmhqVXhzUDV4OElMVUNjRDBvRTNQRm5nZDI1WUZQaDNWVzNUOEpYcDFyWFNJ?=
 =?utf-8?B?NkV0R0lTRThPN21CVzBxT1ZFTmloU045aStlVXJuTUsxdTlSbmJBd3J0WmlO?=
 =?utf-8?B?L2xrcllLTFpFd0hiRVZzZXl4ZWtrRDNDU0o3UzNyTXFjbEgzbXFTYk45VUNt?=
 =?utf-8?B?djZkLzdTc2U5RHc4VVlUZGJDY0ptYU1uY1pXYk1uY1krSkUxaU51MzdYTC8y?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m/Xebpb0n9aKkyN7MofKy1rv3NirYAVLS6+Y11A4pWygj1d8izHXe8iQcPlQ3RZni22WKp+anc2LJ5lZn1Zzh8pJJHh41V+NgT8RB1uwXEcPl/rYu+OGHF10FwEpgqBx6NBe5Mt0s6hQbqIo0FLUEPT1OeRbYr2kncPxHjwI3fm9UwYz5nTWw5BrCiL8LxJE+Xg4OML12KaZkHHsoxAhXc7QKPvld+4bNxwokDHv0gq2+7c9ELtm7e5Disi9hKwgiwW8/zRn4/yy+ElcJ6y6ji53bqL55RyIEeMmB73inqXmdw2i0WVuyMOXtEiET8o8xQxyCsar6K+kzFWQTf0nrqTR5TdNKMQHRUAWkefAngr4QMZ1OYLBQ200OYEpSmPdwy5nUKtZrIIAcw2cLNeE46wAW/pYpLkKobrLeTjmOBaBbIRf+pFky6DieFI60k5SZ1zaG9BSK6ErJ/RF2UDHseTKPpIWDZwV2MdFM72qT0oBCCEUQ+3Wm77wUS13mhtmt5Fftc1VO0LkuzF34l/f37XQ/ey8mew7BGM1vQXDop7nCF986q779zu/EyrtA4dhv32qOnV75g7g2aXxIVpxXqSaYyt5EzLgDsJggaz8iZLOtobAYsxeN9Vv2IWIW4RMfUt+fFrNiaAZeLoAwr2EWhThtls5jcLMDPdHYGnpr7eznugvZhB6wFMiP9BRzzeA+MhYQN37jIJW+y5HUJxs2UYf4RODs2evbcfVpIfhPCCDpVRIO4T+99dkAFWlzjr1ls6YOHmF79xmWEJ9lWlsYxXBWuEymOmKhAR30OxQ+EY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822793c4-7785-4a86-cc16-08dbaa009a73
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 08:59:37.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ov8/reTTD6DZD+b9A6/xh+PJjGoDjltKmqrOVhQO1cJDxNX8JjvDRd24Dg7mwlfMu2WAJLz3VZGz5FzMXS7CzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7516

On Thu, Aug 31, 2023 at 09:03:18AM +0200, Jan Beulich wrote:
> On 30.08.2023 20:09, Andrew Cooper wrote:
> > On 30/08/2023 3:30 pm, Roger Pau Monné wrote:
> >> On Wed, Sep 12, 2018 at 03:09:35AM -0600, Jan Beulich wrote:
> >>> The function does two translations in one go for a single guest access.
> >>> Any failure of the first translation step (guest linear -> guest
> >>> physical), resulting in #PF, ought to take precedence over any failure
> >>> of the second step (guest physical -> host physical).
> > 
> > Erm... No?
> > 
> > There are up to 25 translations steps, assuming a memory operand
> > contained entirely within a cache-line.
> > 
> > They intermix between gla->gpa and gpa->spa in a strict order.
> 
> But we're talking about an access crossing a page boundary here.
> 
> > There not a point where the error is ambiguous, nor is there ever a
> > point where a pagewalk continues beyond a faulting condition.
> > 
> > Hardware certainly isn't wasting transistors to hold state just to see
> > could try to progress further in order to hand back a different error...
> > 
> > 
> > When the pipeline needs to split an access, it has to generate multiple
> > adjacent memory accesses, because the unit of memory access is a cache line.
> > 
> > There is a total order of accesses in the memory queue, so any faults
> > from first byte of the access will be delivered before any fault from
> > the first byte to move into the next cache line.
> 
> Looks like we're fundamentally disagreeing on what we try to emulate in
> Xen. My view is that the goal ought to be to match, as closely as
> possible, how code would behave on bare metal. IOW no considerations of
> of the GPA -> MA translation steps. Of course in a fully virtualized
> environment these necessarily have to occur for the page table accesses
> themselves, before the the actual memory access can be carried out. But
> that's different for the leaf access itself. (In fact I'm not even sure
> the architecture guarantees that the two split accesses, or their
> associated page walks, always occur in [address] order.)
> 
> I'd also like to expand on the "we're": Considering the two R-b I got
> already back at the time, both apparently agreed with my way of looking
> at things. With Roger's reply that you've responded to here, I'm
> getting the impression that he also shares that view.

Ideally the emulator should attempt to replicate the behavior a guests
gets when running on second-stage translation, so it's not possible to
differentiate the behavior of emulating an instruction vs
executing it in non-root mode. IOW: not only take the ordering of #PF
into account, but also the EPT_VIOLATION vmexits.

> Of course that still doesn't mean we're right and you're wrong, but if
> you think that's the case, it'll take you actually supplying arguments
> supporting your view. And since we're talking of an abstract concept
> here, resorting to how CPUs actually deal with the same situation
> isn't enough. It wouldn't be the first time that they got things
> wrong. Plus it may also require you potentially accepting that
> different views are possible, without either being strictly wrong and
> the other strictly right.

I don't really have an answer here, with the lack of a written down
specification by vendors I think we should just go with whatever is
easier for us to handle in the hypervisor.

Also, this is such a corner case, that I would think any guest
attempting this is likely hitting a BUG or attempting something fishy.

Thanks, Roger.


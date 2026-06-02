Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bSs1A5AJH2oFeAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:49:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704E6305F1
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:49:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=R2hGe+qP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325297.1590809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSIi-0003DN-DN; Tue, 02 Jun 2026 16:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325297.1590809; Tue, 02 Jun 2026 16:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSIi-0003Aj-AB; Tue, 02 Jun 2026 16:49:12 +0000
Received: by outflank-mailman (input) for mailman id 1325297;
 Tue, 02 Jun 2026 16:49:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wUSIg-0003AL-Gd
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:49:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUSIf-000Nsj-Tb
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:49:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a1f095f-bab6-0a2a0a5309dd-0a2a4503d05c-48
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:49:09 +0200
Received: from [40.107.200.54]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a1f0984-672d-0a2a45030019-286bc836bd99-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:49:09 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA1PR03MB6644.namprd03.prod.outlook.com (2603:10b6:806:1cf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 16:48:05 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 16:48:04 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5Ry7R6ulYVOKWroGYUGWdsrrL8Cd68eUSlsMOAB8D0axnjP11s6IV2SJ6AknDfSI1ihWEgtBXwWrAcShdfHh4ng3mRdPwgsTwC/97kYjJpPOlxpXY6Xt4J4klc5zL+YFZlDCbarWJLq2J/mG1u1mfxW022lTwW9bVmAiDqUAvd8ypwdIQTY+1JdLWrGezz0nH4JCHp79Rc9aZOj2uaMZ968xs6rc5i4IJrrhCW722ttvITDVwOdkMnK7QIi1ERlXY3d3+Ef6mRyKRrp0m3YSna3+xn/x6UUeQSLIJcOhJqQ9a1/3FEAesmq6RPP6GYhSSkf6eBAGVZMYZpncdmugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ao1A6TazqD3HAiyLKxm5Y6bvkJFT56da5zfk2wbE6g=;
 b=Krflo0yrzjUVULWIUuKpH/xLYGbH38jVH1Bw/EBrjKMYNsrcI3FrjOxJIU2nyElplen2vjWURKTvNRfCQ4RwEmIREWzrbSU1D5SQzwMcf27vh72fBSVPKgO9+GszhWechHeL/P1D29yNx4daezefK3tESeL2B1CkT3u9eReDmI6/1VlBlcUV+bM1nVKR/QBQ8eRIGd2CCo3cQb5eKJPPvXpHJenZytUztV6lLWhZ2Z0Qcxlic224FZ2o6b2zFR1/eChFdyVKQ6rDxKY4fxXqVLCm5vEBKb1HaXKBJtNu121vhLffKNzpjS0Gk7IxF6ohKoCjfhlEa84qdgWQ8+TVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ao1A6TazqD3HAiyLKxm5Y6bvkJFT56da5zfk2wbE6g=;
 b=R2hGe+qP3dr8XvRxMoU1PlevtZSTMsPbKO7FKNym21I54/KQ1GyB8/fz266ZS88ij3JjNSkqZvcJkJh7RGrAtWim5wRd8MA2O8YIpmCw7h962O0nBVx7Rpgai0p2NFqvAR5OrvIf/z3LByj1M4XHJkEw+OlHp2hwVPZ30Z5CodA=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 0/2] x86/kexec: Implement crash kexec for Secure Boot
Date: Tue,  2 Jun 2026 17:49:09 +0100
Message-ID: <20260602164911.2684471-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0538.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::8) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SA1PR03MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de8193a-2b68-4f9f-5344-08dec0c6b771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vs8mTa6UB7kEwgUKG+Fw3rGGi6u8gTBmJaRsV+jZCQicdHIxG+j9jOhNKUaEQNhTp8kRnUnf5joHbS+y6DLZZ6qTyBt7hOhKNGVARAIh8faQbzq/xCrXOweIW5fW/7g/puCPZAueu1NVkR96hFwNu7we86IYPKXyxBJ0uWetR8DxLiYj0f5spEQdq9OHUBFJPvSd1MedKG6QTd3vTNgWYCCMBOY63m6nSbhwY5vEJ9S0AViFJF+fpXmy54dI/0Gbuh0FHUcx4jS3ij+KZk6f+KLNvC49/krxfdeS+FIUuEKlpj5RLavFaUeQzWkOjrDzyou05EkcqEUqGWnNd0bnE9nDmdziDmWKGKO97iyPeRKxDnwFPVWUovc5kKD5jAwprtMtKxYSccNsw1Q/WqmE++pdpChckcYTN6LSoMbJZKIMjKXFIpADbh+OzotHNGXq7S7UCQhj0ePtDWgro8KZ5idTDBTKsozXpU6KE18MRU3ISafBfoI58RaJh7TO/nOtmYDM3cvEDJACIzwNc+fe9oIVDw5PlAX7F4yMBJBe5/rakh1a8NFzx5TFDL+9XhouvOaLRW1uwJsga9IWsLXt4iY1/ar1pBSqTyLdvbm1xY26iGAS+35BZ+Nk4vrXufo3utN1Ar3fZ4fH52VznY24s/8xk0suL9KYSabWYyBDDvbP9ol9q9IT/ZEV++DZsdy0Cg875/8XdB62X2LI2Z1hFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1XMi1nGmfOcjKkIna/KYnVwWarH/xIdRhvalGEKkkijzW/IdeVo70g6n4sO?=
 =?us-ascii?Q?9lWAxRWvIlikhcDk20vkBZab91qUXz7wxxrC6NTDDKcyu/qjSMaeM8aW7ZJ5?=
 =?us-ascii?Q?MQXKK0DA7SxiA190LA0IwXxuIa3x+JtXkwBVtIA5KC3ai542zi85Xt9FuNit?=
 =?us-ascii?Q?njM4uug0PvXLD2410wBC+mY00Ms6JWMdFt1MebxNU+l2MgT6ngNWdCC3yOBn?=
 =?us-ascii?Q?CrrZlrtW8MG3lssCVI8DqiEkljVf0CNsPWDS8i3e5XNVlgvVHKWJrl0te/PR?=
 =?us-ascii?Q?Bb0tX+NDvpqsxVf/I8n63CgmP8K8ULdGU9Kpug2adg73jXeF3A5WU1DBK2yH?=
 =?us-ascii?Q?9vQUYqyKQr9Xo7NXvGDPKz5kqa+dZK2id0GFPffKMl+sxhpTR81cVOOTk3G4?=
 =?us-ascii?Q?3fJx4GO2OXLgvoRFGlzHXGIeHTpYwsdQmQubnPmGSjYjVsm1+T3n+3Tzxwyi?=
 =?us-ascii?Q?Hyl1eodsRuAHiP+810a5Xnvf/ifDz+FAPcGByhRqLWGinnsj2l9FD7gFKXPk?=
 =?us-ascii?Q?XigNqbes+vuh+1+bkL/ej3rnPiT7SvrR9T7OIO0aPGB2PcsR5Pcc7H8//Edr?=
 =?us-ascii?Q?YZZNL2MJynrMcJizqRHTopDke2wrEAgy0H10pEff+jddfvZ/aYKV25cb98HY?=
 =?us-ascii?Q?/ykSIlQ458o3uB1Kr4M6JHR6QTNT3+khG1hSnVyJ8sCa5mCWskhC9z/Nd5A+?=
 =?us-ascii?Q?DWw9EBotLOeJnUu6vaH+zlDzVA9MKtboY3QYo9reB4B7jVvKrwVgXncS/nfv?=
 =?us-ascii?Q?0voLl6SuhpqDHcjgP8FjBPmbLFwWWOovSvwiAOoH4/fIA+vxzGKBzfcpuIIX?=
 =?us-ascii?Q?TPEbPbgSbe6AhTfcGhu+LO6fxIULADnTZXncm7WRWnwfM6/wOihYXOagMCTD?=
 =?us-ascii?Q?9As3KWgAtJ5C1X4hV02kj8kJzpGP3QGmiyMPfnw4K44Is0U+Nza56yTHLxR/?=
 =?us-ascii?Q?vnTQqaxGlxnYkeNFm+06FIwafmbxa6O+EuK5AvK6VAgtDTEq/bBzwEn4r1fF?=
 =?us-ascii?Q?KAgNsZGsUdHf78TgDfr6mF3DVLsDiYSBPgLH863w5iFj7EXa7LSw/KK/NCa0?=
 =?us-ascii?Q?uhQt6uWUG8vBpvRsVt3Y5Gl0uq8jFQwj5SScIjTi8QBOk9VIATPKBpL/1I+b?=
 =?us-ascii?Q?tAhmPCmJSsbZ8J4gDXS+EhoCxo6UVSvT9rYpjk1rBxGRDHBn3nrEAVTfD8pp?=
 =?us-ascii?Q?qbr5cCFx9LVCgIxGWXOaa03hLgmo4msk8koTRJIZZGR0cHP3ytzjLlMTU+jO?=
 =?us-ascii?Q?hcEhRLF2L9BG0ZMw0GTUqtl5JQVDZh4wvBKpbiL+m1e4V2+hvZQ1N0NMG0NG?=
 =?us-ascii?Q?e5UXsxOpdW2Ag3Y2gy3sx41TN2RjwcIhbws2FvsnUcKg5q4hITX+WiFQefJ5?=
 =?us-ascii?Q?13qt3NWAgOnL/D/qyCbHikGxLJ2tWGl67p3C5GVCipvkhJGOvdE7DbJ599sX?=
 =?us-ascii?Q?IMS3Vf/H/FxsQk5VoTIFeek18OLafboiaW63unyQGWCuuFr0CYanUJZ62yZa?=
 =?us-ascii?Q?4TSBjGW79GkSnCTir3FHePH43ZyT3fH+b+dqRoH2v8zMpEC4oyNqeny2hEOI?=
 =?us-ascii?Q?XM/Mmzea21w+yqdJhsi8PuCnZJ+2hvfO8d5vxFed5tZk9EL2KZJrGafjeuDu?=
 =?us-ascii?Q?icGnJNckCNs+GeBLADIAB/fa6CwmdwB8LUt2nMYAw7PSAsnT5KDoymENsm1W?=
 =?us-ascii?Q?enrx5qBk+KlS0TyUhh1LPC10ErYhffnqPNF5D+SxWw1n4TYDCLSTgnV0jTM/?=
 =?us-ascii?Q?xIgiQOjsAQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de8193a-2b68-4f9f-5344-08dec0c6b771
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:48:04.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRcvdtGHsOwA50XPLO5I112wn47/Ymywpcz1D+TeTma1RKO6RLQ9aePWXXKakYcxiq3KbCzCDu8+RD+RWjyCww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6644
X-purgate-ID: tlsNG-33051d/1780418949-3754F938-A8A4EBE7/0/0
X-purgate-type: clean
X-purgate-size: 1518
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6704E6305F1

This replaces the previous series
[PATCH v2 0/4] Allows Secure Boot for Kexec
https://lore.kernel.org/xen-devel/20250507094253.10395-1-freddy77@gmail.com/

The main feedback last time was that almost all the purgatory code could
be removed.
- The digest check is now done in machine_kexec() instead of purgatory
- GPRs are cleared in kexec_reloc.S which shouldn't affect non-EFI kexec

Kevin Lampis (1):
  x86: Implement crash kexec for EFI

Ross Lagerwall (1):
  Add lockdown mode

 xen/arch/x86/bzimage.c                   |  40 +---
 xen/arch/x86/include/asm/machine_kexec.h |   2 +-
 xen/arch/x86/machine_kexec.c             |  10 +-
 xen/arch/x86/setup.c                     |   1 +
 xen/arch/x86/x86_64/kexec_reloc.S        |  16 ++
 xen/common/Kconfig                       |   8 +
 xen/common/Makefile                      |   1 +
 xen/common/kernel.c                      |   4 +
 xen/common/kexec.c                       |  41 +++-
 xen/common/kimage.c                      | 264 +++++++++++++++++++----
 xen/common/lockdown.c                    |  56 +++++
 xen/include/public/kexec.h               |  23 +-
 xen/include/xen/kimage.h                 |  23 +-
 xen/include/xen/lockdown.h               |   9 +
 xen/include/xen/x86-linux.h              |  62 ++++++
 15 files changed, 460 insertions(+), 100 deletions(-)
 create mode 100644 xen/common/lockdown.c
 create mode 100644 xen/include/xen/lockdown.h
 create mode 100644 xen/include/xen/x86-linux.h

-- 
2.52.0



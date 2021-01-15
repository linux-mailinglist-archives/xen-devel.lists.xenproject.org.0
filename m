Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2342F7E28
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68147.121930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q5x-0000w7-Qd; Fri, 15 Jan 2021 14:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68147.121930; Fri, 15 Jan 2021 14:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q5x-0000u3-Me; Fri, 15 Jan 2021 14:28:57 +0000
Received: by outflank-mailman (input) for mailman id 68147;
 Fri, 15 Jan 2021 14:28:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Q5v-0000sK-IQ
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:28:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1e7d6d4-0fd2-4388-b1ed-e0d795e64495;
 Fri, 15 Jan 2021 14:28:54 +0000 (UTC)
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
X-Inumbo-ID: e1e7d6d4-0fd2-4388-b1ed-e0d795e64495
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610720934;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OnkPplYvFhLEyw/OpHmkJSItrPz8rRm1vu7Brh6+KYM=;
  b=O+0yVmBKcB+Dt6AVopxByZkNOTBpGg0Erd/gvQcS540aeZXmMBXuMbbr
   nN0RreyouMr6yOfePrSx7g5PpkD20kIHL9POPzdunGSgWB4geEhTp1vyU
   ecmNv3mP71ei9LymHgxbNYNo/2EejSjJp43U6eufFvkFS4pNqkyh2mNyZ
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JoZlehRoyqBWmLLp1bqGxM252AX3bxSwrfwA9pt+dR3g/TuNkMax8IK7ozJlao9aT3ynmBjHgd
 u+7zdZJKZwe7lv0V6ilGdaixtYYMNYYAy/P7Iq46vwzJex/2kC0WAII/Uf1G6jE98d4t2NTmZO
 cFCTeXNubGIMHM9iUGDf7VMZAnKvn9Y07F9SurQ8PXEzT474MFrFredu+u5nM2YGJtfG+hZKOu
 a/Q2ysTU492/EBomoHTHT1xQ5twBxx5uPi4jXHv3VjTF5nrHb1j7GjkDAN63ChT1L4kvqStIOf
 ypA=
X-SBRS: 5.2
X-MesageID: 36468941
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="36468941"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kidIuS8/xMmYzVRv6Vi7ycVls3PGG3KryfsE4+wSujexzxxnuY3+PCK0KvEg0Tf/NamyX0Z4qW50hustGp1PY+uSwr+BYCynfqyTozUDBkijkoA4K42vO3oXuVSkC5L2rJNVCrfIEGbfAKl7AyEsvMhtfLZyS3WQ38LAx4hrvFmtHjwmdDz/Qk7E1aR+ZeblbX82toNeyLikJ/EX7+1mt/fsBj/ML1H2WmqZwESl5JF5vAL0uwfvY/UQJsoD+aOssDfzPk4c/ejolsM2eBxzhxHEo3PzrGGV/vkolahzcxp4ruPClCplLF5EOtgAvXwGVtj0Tfmbp0n3xx+yfn7WrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAi4encjkLP3LlypbkVjVJWyr+I8zR85m/r5pmOXFOI=;
 b=JHOzQKvdBN5OeGot4UWq6MrhUdw4zKA5Tm9HpQ4cABVGbVBbyBjlSEAPDVM6iJ179SGENnDen9aU8ibQpDnLGMAAbhq5Nr5cGE3sYqN35dIpvYs6vPcXa+lZP8oWxUOLaiNv3QbEQ7xashAn1xUhY/ac5Sn5JoEvpw7ZTGkj5iO3VutSxD8ozrG9gnSUl2VbebLN3bJcpDkAi2zbu2bkFtyVF8CtTqSblFWF/XyEektUI3VdSTCMdAxodCE4mFjRRuQUuZdz9TiuRHzAJcYFdYK/xs6y3+lZ+7d9CaFJgQ+FM8yKPIQHE3QyDRiPmzrk6lnA5oiu0qZmcBcwSVkahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAi4encjkLP3LlypbkVjVJWyr+I8zR85m/r5pmOXFOI=;
 b=IV8MyWl5PJnaRPRTXBazt9kDGdkI5DSoY6iVl5EgHedWOUKabduK9dHIhfuSfIJc8RCe9AECb4E08ElLqvkAIdwi1dDjN+U8/gZgWiKLTsXOTxj4E++4Fc6kQ+YAHwarJV8L39rJ5L80OgO9wh7oKrUwr+CM7sLet/nt9SGCdhA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH v2 0/4] x86/intr: guest interrupt handling fixes/cleanup
Date: Fri, 15 Jan 2021 15:28:16 +0100
Message-ID: <20210115142820.35224-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0133.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc201b65-a2ea-4041-e6e8-08d8b961e19c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB314747D257557815C5512B338FA70@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7yXb3yRdoJ/g6Q67/nRSwAB53WNrvBdRZ2cOPzEyrazztwapHi3SHuMwLGSP8hX2vYVtqOVrRTqAUc0dnhsGyqIKrP6/DQTjpN0IbliSceii+4jLkzekjGIWsoLOjKQez4JnpV0p0wpTVeDZGEiLKG7y64hPsaD57iK6+HR0KrewJGc0dYQ+TakaZ81bHLQA9pK6bcE8tE3t2h78YGF7iWI1uLvLZoYEcD4fFzYuK6ClulnpaonxBhE3Fnna5GeHp5uiZO0PxIP59ZVGuHvxRlnMY2VDzWCSH0lrQuUgg2Li99EP0DWhsfvNbNw9TtQOYNUI63ER0lppbqqhRAusRha90oBUnoLBL60T5vW1lkz1mG6v9N+yjdNzYP1fMVxfEI/deY8bJmqTjtsxWIDFpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(6486002)(316002)(86362001)(83380400001)(4326008)(66946007)(6916009)(54906003)(1076003)(36756003)(6496006)(66476007)(66556008)(186003)(5660300002)(8936002)(2616005)(16526019)(478600001)(8676002)(956004)(2906002)(26005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UlBBVjlYazh3K201NHVucEF2MHMxQmVaNGtUOVNnV3lEaTBGZHVIbUJnckc1?=
 =?utf-8?B?U2N3SXdEcjBVcm5xOFZPdjI1TDcybGZKOFBPeXBOSGJyZHNtcGxqZ0RHNVZp?=
 =?utf-8?B?eE5yUnk4RWRhYWttK3VWdHhEazNEVDM0R1NjZXh2M0xReWVMOG5MZE1rQ29i?=
 =?utf-8?B?Nmp6T0dLNnhCZ2U2Tm4rYndaNUNjaURDN21pZWI1RmtKWFJyc09jRmkwVk9L?=
 =?utf-8?B?TGdLT21kRjFMeVhHMnlCOE1yNzlQZXFwTGcwSjRkQWl2RUx5TnlhZW1MdGFv?=
 =?utf-8?B?SHk1eDVkQUFtUEhPZk8xdWN3K3cwemdJb0FKb1FJVDM3VUpSUXdicGxqZjRh?=
 =?utf-8?B?bFBnZC9IQk4wSkRkU3NDWCt5TytCLzY4RlEyTkw4L2pDS1FhcUl3aUhFU1VF?=
 =?utf-8?B?WlBMNlRzSmNkVUxzNktVL2IrU1hRbjk0OHZSL01jeUtzaGNFZmtoR0Q2SmFh?=
 =?utf-8?B?L0dJRXNobXhiNDBnUzkyRWtudEM4UHN4aks2UU1LYUFQb2JveGp2UjczWm9i?=
 =?utf-8?B?Q2t3alg3WExrWTlQSU1SSlBya1JibUppdkV1eGJTREpsYU16RW1za0Z5azBa?=
 =?utf-8?B?L2xCNlo1RS9LaFg0cHFrR3JhM1NVSWQwS1JDS0FSc1FpbHlTd2QvZGxYSGJu?=
 =?utf-8?B?ZHROYlNOVXlxT0VXSDd1Rm1ZcE5UdXVQajZ6cjBLUnA4REVPeG5yT1BsRFVT?=
 =?utf-8?B?aVRyMnRneXdjU3lLZlBoSGI0WlI3elFvcWh4T1ZzUDFYQTFCc2RVV2IyK0Jk?=
 =?utf-8?B?OG1qMVVyT1hlbERNb3Vldjl0aFNLVWtITlpaNmJ0LzdvOGxQb2ljRDlqcFpL?=
 =?utf-8?B?VFRWZUtzSnV1YzRLNjdBVmwrVlVNaXhmZlhqeG1MOS9lYkpJbUE4K3dPZi9I?=
 =?utf-8?B?Rk55Q2RnVDdvWTJhZWk1UzZSYyt2NnJzUFBjK1ptbXFHQ2wvVStVYVd5MlBX?=
 =?utf-8?B?QXc1dXdsbUVib2F6WU9tRExGSUtCd3l2SHVkaDNLYTF0Wkd0bEtydThJWVdG?=
 =?utf-8?B?VUVvYjJGNmZqZDNXei94T28ybG5zUS9aTU9BQ1ZFWTV2aVc0WlVwTmMzcjBP?=
 =?utf-8?B?aWpSa0o5dUdyWlVWNExnR0QrM0RBb1hQaVk4QndtNmwwUU5xY2tFeGtPQm96?=
 =?utf-8?B?dGtuKzJBWHlCdFpwK094ZW4ySXdtVmk1Vy94U1oyWkVCL2FFYklWQkpkNHk0?=
 =?utf-8?B?SGN1T25Bejhza3gyalU4c1lFSE9yRnZPamxia2ZERWc5MDhnNkdKR25YOEFL?=
 =?utf-8?B?ZVNvdis1ZnMzL0RFdVZ2S0JRUzU3bmZqaVozQVpkZENuTGtLZkxmK2trWWo4?=
 =?utf-8?Q?y3AKsNarFXKpvQbKDn9l5LylzUAmyeqLvT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc201b65-a2ea-4041-e6e8-08d8b961e19c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:28:52.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFHgZ59Js26BWLFJG9ZbGr3QaUYFXMJ3lUNdushixntnsQiVV+bNmp6RbFx1srpiLrvdBWmTQJ8/HmiqioKOBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

Hello,

The following series aims to fix some shortcomings of guest interrupt
handling when using passthrough devices. The first 3 patches are
bugfixes, which I think should solve the issue(s) that caused the dpci
EOI timer to be introduced. However neither me nor others seem to be able
to reproduce the original issue, so it's hard to tell.

It's my opinion that we should remove the timer and see what explodes
(if anything). That's the only way we will be able to figure out what
the original issue was, and how to fix it without introducing yet
another per-guest-irq related timer.

Thanks, Roger.

Roger Pau Monne (4):
  x86/vioapic: check IRR before attempting to inject interrupt after EOI
  x86/vioapic: issue EOI to dpci when switching pin to edge trigger mode
  x86/vpic: issue dpci EOI for cleared pins at ICW1
  x86/dpci: remove the dpci EOI timer

 xen/arch/x86/hvm/vioapic.c            | 13 +++-
 xen/arch/x86/hvm/vpic.c               | 21 ++++++
 xen/drivers/passthrough/vtd/x86/hvm.c |  3 -
 xen/drivers/passthrough/x86/hvm.c     | 95 +--------------------------
 xen/include/asm-x86/hvm/irq.h         |  3 -
 xen/include/xen/iommu.h               |  5 --
 6 files changed, 35 insertions(+), 105 deletions(-)

-- 
2.29.2



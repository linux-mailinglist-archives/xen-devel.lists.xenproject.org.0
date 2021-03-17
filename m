Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A087633EF28
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98627.187145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMTzc-0008Te-OB; Wed, 17 Mar 2021 11:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98627.187145; Wed, 17 Mar 2021 11:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMTzc-0008TH-Kk; Wed, 17 Mar 2021 11:05:36 +0000
Received: by outflank-mailman (input) for mailman id 98627;
 Wed, 17 Mar 2021 11:05:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSUP=IP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMTzb-0008Rx-IQ
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:05:35 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b583e291-a162-4caa-9f71-64d8892872b2;
 Wed, 17 Mar 2021 11:05:33 +0000 (UTC)
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
X-Inumbo-ID: b583e291-a162-4caa-9f71-64d8892872b2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615979133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=wp0RccVI1tCqlieLeZR40m+vQPb4oS3BJx8bkuHZwN0=;
  b=XklvQePTUfA8fzYAEY23VNWeDIFALw/Oo54gWIvwANdKxfwdz/oPZk+U
   +X9zKEwTiEEyT6u0yCDNMQsyxoxmEXiv/OyImy/vhjJfYuB+58VChaKxn
   ur/KYc9HaaPrwJTDOcl6GmGH+LEfqzLU1pSyB1no2rqIYp8CASP89bxyd
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hoRtLp/ly252ADuLwJafpUylXwz4p4ZiwRc5U6scuqSgiki0SkUt7B0C2n88f8x2BDVlM26gDS
 URlQmWOOswm/gDLbd+UG94itg7FJZifMGkW5L4zLwojf1+rXQlE0yp2wxMg07AWJwTSoqrWRD2
 B40Lmfm5j7RBlx5P+tMg17quQ4/tTdsgjnDClMj7dqDJV4j8EjL/oRC0JxiE0Ya1L6jX7zzbI1
 G+MngiXMEdO7Y/UW0jlLWv7ND/OjI43EEuJuIRyLpdNDqzmQssmNBD9+2aL2DKQfVu+cW28n3T
 Cks=
X-SBRS: 5.2
X-MesageID: 39488646
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HKNhB6kcXwf/Yrolt1Uu+ZaU3ArpDfP2imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMWOqqvWxSjhXuwIOhZnO7f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf4LmRTSBNdDZQ0UL
 qwj/AmmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlBy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6aHc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3d2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3SfF6k3b/xsFr1/k1FOCjnPoraXCNU0HIvsEv611WF/9ySMbzbVB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zKJiEtnq8E/pThiS4cEAYUhyrA3zQduP7orOjn104wjGP
 kGNrCm2N9mNWmXaH3UpQBUsbqRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ4yK4A
X-IronPort-AV: E=Sophos;i="5.81,256,1610427600"; 
   d="scan'208";a="39488646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJpMJF05/FZw3BFa1guhmg91XypIA7XIg07QNSAWFG34jxaNVL3gezDeji69GhLJUlBizfzItd8pKzx0lPkOzTThBbhrga2lwhPpBnWWvFB8zV4+EIE/apjL9SzSTXDKbpazom+vzsClpOjv3Bs6NbahcNCm/34pK63u66SqBf6PaPZElWmDUF5b1a5PzMmi87CIzDnQITi4ISK9vayBaSeNSkIE+/NFB0UrfK8kbQR09PPqytOovuXWJeEHHnm2J+qM7LoynQI9c/Fat+PNt/Jq8lFYdMmujWz2by3CKRuC5aNgh53nnWsCsn7kybNaU+J5kkghBLGnrwrR/rBgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdo8EeuM+xU2F1GMX+fxj8Mg5M4tPEbvnO/5QsPd9n8=;
 b=DK1LMh3RYXcHu1wjCIupI8WWwcRMxusZNcmYEX0Zw2ATMNzs9pddkEoPtWHj2KvS24SodlEBFVyGjJKsJazHl6XtJkGXsHw8waSWWnnW54cCNzrUIxJMegO446YhkXEqMD8gNkixGALLP3WipiA+eJJL6WKYT/f4HDxJilVZblHJsz75HhZmf99HwbAn2jBn1ugua/r9jReMV7LZH94e/4BeSCJkE6TxcA4WSUX5/DCrDLCciYfPuCL7xthfpmFAvzgdzamdFvnMkSceHmeVWh2f2W5NGxPSV5jfQQAgRoz80ZiIDo4DxG6A6UN5KocEip+mifLbQrXrDD8JGenpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdo8EeuM+xU2F1GMX+fxj8Mg5M4tPEbvnO/5QsPd9n8=;
 b=xljdE8q/Cvv6vda3O5BEPtD3EnC3eh0OomAeMevvBgS2THxJg8iPQTETFpLhpzUpmdT7e0fz/rXfxhGjIavuZvpAmEnONPguO/lN2YEBqoDWoSg/vKH/NItKwdLfrhHe7HEzWL8/kq3vZaKkomWIx3Yi+ftMlmaldrFWJl8kdDE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH 1/2] xen/x86: make XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on MEMORY_HOTPLUG
Date: Wed, 17 Mar 2021 12:04:00 +0100
Message-ID: <20210317110401.46322-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317110401.46322-1-roger.pau@citrix.com>
References: <20210317110401.46322-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 171b86a0-9674-4c4c-cf25-08d8e9349471
X-MS-TrafficTypeDiagnostic: DM6PR03MB4137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4137B57C0925D16FB60C56E48F6A9@DM6PR03MB4137.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+9A5LLVZaOp20IHx3zrh37q0KdRAFLYT1Q6iAJ1KnB+Naxi4udSAuXmKuj6gUxF5qwR/udgkMsbbYeeQdEv8oibcKoXVbLJf4CnIQ4sqX+71k6f+Mv0co53uS6d6D+uPmixqjaB3UjX/H4uYdFWNt9Gsv7Nt0JUC1MrdGj4zS7q2v4R+chi8F8YOPNOmeo282MYB3JwL0I1/Ga9QedWfsBpNHrr0rKbBPfeOsPMXqR0c6BX6ELjN124Csg1QzcjDa/IwLU/E11FsV4TUtP6e5Ajhn8hRdGixQsH6ZYr4UAkTUgmom8ahMSoBlW0kWyUtMK4nObunweZ7DTiqW1lJyKHx0aSvALP0Wrxshv45YskX6LqZhPLoISWoNsB718aPyJtPt8mSYTm7U310uMpNolA6I7B6+wTwOGzk4EAHx46ebZMuVVAwy+zmoAWDgz+Ge2QRqg2WrnYlL41ru7YiClDZYiKK4pOD8PI7qoOidwinIYUtDoxRofRdlSWGIbh6fGrDKp5i5RnnGJsoYQTX5t+R+mog3FAwZvVH3+DtH7pyzJ041EpXVLPHyM/ZN2H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(36756003)(4326008)(2616005)(956004)(83380400001)(8676002)(8936002)(86362001)(5660300002)(66946007)(6486002)(66476007)(6496006)(478600001)(26005)(16526019)(186003)(66556008)(1076003)(6916009)(2906002)(6666004)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OWlRWkx4RkluZzVnclVBY0tjZTZDaHFWTEJpRENsNVNzVG1sYnNjMThBUFZm?=
 =?utf-8?B?d0JhNkUrdS9qWjhqZEduYm1SWWtES2ZRdE94ZHU0a2ZyY08xdnpwNFNwcWRT?=
 =?utf-8?B?U0xZYmdjTkpUSU9PUGNKRHE1OC80a2hKYkxRU21GKzY4MnNxZzd2blRnNUlT?=
 =?utf-8?B?T0FtcEFuZFpOSFJVUnplN3hjZ0lZeDI2ZzNuTnJPb1VRSVp2VzBnNXM4aDcr?=
 =?utf-8?B?ZWZnN1Vzb1BvM3llNkxjTnhTOGNSM2oyT1E3TWZkblVJelVPL0s1WU1zYjNH?=
 =?utf-8?B?V3ZOelQxbXExUzNSckNqU3pieGRYVHJ5dWNrazl0aDhuQklVYm82bDJEbVgr?=
 =?utf-8?B?cGs3M0JYSjloZXQxMW1Md1BpT2dhcU1JUHE5NVpxU1Qra3c5QVZrbDd4amp5?=
 =?utf-8?B?b212RkszZVZEMmZrcFQrRE1SZ01IVVcxMXRvdDJmSGhTRVpuTlZSR3I3UWQ3?=
 =?utf-8?B?UC95aXRJV3ZwYWR2c05BanNkSGwrUFprU0pkd3didlBPbmR2M2lQSHFwTVh5?=
 =?utf-8?B?RmF1ZzZOcEI0ZExBOEcwVGdzSCtWdWMvVUZpMnFhWmg0SjY1a3ZXZnk4YTM5?=
 =?utf-8?B?VStidTA5dFk2UjgxZW1BUlhKREluWmdnUjNHMGx4eUhPOW1uWHAvZVJ4Kzhk?=
 =?utf-8?B?NC9XLzRDTWNNSW04UlBkWWFua0NQR1Q2dlV4allrNUFMNWlwWmcrbVdhOVZs?=
 =?utf-8?B?b0d1bVFvcitGSWtQdUljSk0vTGlaTGV4ZkJwUWNlOFJiSnhtUjdXSXIvVm15?=
 =?utf-8?B?czdnWXRDdjZoRTcwcXpxQ0RQUlZYdHBJaldJM2sxYmVGV0ZKenY4a003S2lR?=
 =?utf-8?B?a0tXYm1FcHo1NnN5ME9Idzg2MzVvOWFpMkFGY2VxdnVJblZmVHBvbVBYb2s2?=
 =?utf-8?B?RE11c01hVW1DSnlNOHJuM2J5MzJaOWVDeDZRMWd1eklVbTlKZWxJc0o4S3Ns?=
 =?utf-8?B?eDlaVjJubG5vL0xoOTMwNzdma0dNbFY4Vnh2OVI0WUZwY2g1TlBKakpOc3R2?=
 =?utf-8?B?MWVHaTRad0F3RDNYa2NKT1JaZk1Mb1VlQTBxNmk2QW5Obm1VdnJIclFtaW92?=
 =?utf-8?B?ZTQzTU03R1BaRXB1akIzcnpNZnY3Tkxhc1VxZ0E0S01ITnJsSlhLTGJYeFBo?=
 =?utf-8?B?NFVqS3k5ZXlpbmVlNUZvaktTTmZ3bDhKTlArVG5OUVhja0dwdUpWU0VmTEZz?=
 =?utf-8?B?OVdDdkl4SkIvWk9tOFlTenNWaUpKMFBmT20wR1U0V2E3TEIrakVvUjB3cmdx?=
 =?utf-8?B?a0VOTWN1eklvSUt5d0RpRVllUGxQOEVBRnlQZ0M2N1phK0pPRnVKbTRxdXM5?=
 =?utf-8?B?UGg5N0t3QTF3SnZ5a0JGQVhoWHRCU1htUFVPYjQwRHEwQnV6aERlWGlNZE9z?=
 =?utf-8?B?TnhwODA3TWprWnhvODJQS2Fia0ZHVUM3YnpSRXVPVnREbVBWVWJYMVFrWkFp?=
 =?utf-8?B?VDAyWkJqa2FyakcxaXVxVW9jUlJ4WU9oekF3Vk91cFJDb1AvWmtMdkJLcGRK?=
 =?utf-8?B?bnhESk4vVlZLd2VXYnZnOHljNGZWZTZQcnZwcUtBRnFIdnJwa2l5NkR0SmxT?=
 =?utf-8?B?Q3hIdC93YUlacHhsejVxRG9sM0g3bysrSHQ0TlNMVElyYnVOd2xxWG9oQTA4?=
 =?utf-8?B?SVlzN2Y5Q25LWTRreUJ1d1Z2L2FCNWZhWGM3bDlPS2FWaC9RaWhzN0N6UU1t?=
 =?utf-8?B?UisxVnAxQTE4ZHZYenRIZmJxR2ZDMUtlYUZmeC9jbVFJV1crMHdPQjZCQUZJ?=
 =?utf-8?Q?VOSS21qhCKzPVdCe9/hKXRfj7YbpGl6miuccKhd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 171b86a0-9674-4c4c-cf25-08d8e9349471
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 11:05:31.3133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbYWaCZfLzd0baby1vWRHqeu+h7e3oJ82QAEm4XoAZG9HVkmnUWEM0i+KJkmeugMzVPJ3uw+IlCtaK5JQy6W5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4137
X-OriginatorOrg: citrix.com

The Xen memory hotplug limit should depend on the memory hotplug
generic option, rather than the Xen balloon configuration. It's
possible to have a kernel with generic memory hotplug enabled, but
without Xen balloon enabled, at which point memory hotplug won't work
correctly due to the size limitation of the p2m.

Rename the option to XEN_MEMORY_HOTPLUG_LIMIT since it's no longer
tied to ballooning.

Fixes: 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated memory")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
---
 arch/x86/xen/p2m.c  | 4 ++--
 drivers/xen/Kconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 17d80f751fcb..a33902d05e45 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -98,8 +98,8 @@ EXPORT_SYMBOL_GPL(xen_p2m_size);
 unsigned long xen_max_p2m_pfn __read_mostly;
 EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
 
-#ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG_LIMIT
-#define P2M_LIMIT CONFIG_XEN_BALLOON_MEMORY_HOTPLUG_LIMIT
+#ifdef CONFIG_XEN_MEMORY_HOTPLUG_LIMIT
+#define P2M_LIMIT CONFIG_XEN_MEMORY_HOTPLUG_LIMIT
 #else
 #define P2M_LIMIT 0
 #endif
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 41645fe6ad48..ea0efd290c37 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -50,11 +50,11 @@ config XEN_BALLOON_MEMORY_HOTPLUG
 
 	  SUBSYSTEM=="memory", ACTION=="add", RUN+="/bin/sh -c '[ -f /sys$devpath/state ] && echo online > /sys$devpath/state'"
 
-config XEN_BALLOON_MEMORY_HOTPLUG_LIMIT
+config XEN_MEMORY_HOTPLUG_LIMIT
 	int "Hotplugged memory limit (in GiB) for a PV guest"
 	default 512
 	depends on XEN_HAVE_PVMMU
-	depends on XEN_BALLOON_MEMORY_HOTPLUG
+	depends on MEMORY_HOTPLUG
 	help
 	  Maxmium amount of memory (in GiB) that a PV guest can be
 	  expanded to when using memory hotplug.
-- 
2.30.1



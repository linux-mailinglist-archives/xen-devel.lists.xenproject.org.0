Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC5415DBF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193814.345260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNRy-0005Mm-Ps; Thu, 23 Sep 2021 12:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193814.345260; Thu, 23 Sep 2021 12:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNRy-0005Ks-Lq; Thu, 23 Sep 2021 12:03:38 +0000
Received: by outflank-mailman (input) for mailman id 193814;
 Thu, 23 Sep 2021 12:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNRw-0005KP-VW
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:03:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e75bc9d-295c-4cf0-a32b-92e4388f63af;
 Thu, 23 Sep 2021 12:03:33 +0000 (UTC)
Received: from AS8PR04CA0191.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::16)
 by DB6PR0801MB1800.eurprd08.prod.outlook.com (2603:10a6:4:38::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 12:03:31 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::90) by AS8PR04CA0191.outlook.office365.com
 (2603:10a6:20b:2f3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:31 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:31 +0000
Received: ("Tessian outbound ac52c8afb262:v103");
 Thu, 23 Sep 2021 12:03:30 +0000
Received: from 7acd3800b8dd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D03D8F67-BB24-41A0-8CA2-6E79E5223F6E.1; 
 Thu, 23 Sep 2021 12:03:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7acd3800b8dd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:18 +0000
Received: from DU2PR04CA0176.eurprd04.prod.outlook.com (2603:10a6:10:2b0::31)
 by AS8PR08MB7157.eurprd08.prod.outlook.com (2603:10a6:20b:403::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:15 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::75) by DU2PR04CA0176.outlook.office365.com
 (2603:10a6:10:2b0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:15 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:15 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:08 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:06 +0000
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
X-Inumbo-ID: 4e75bc9d-295c-4cf0-a32b-92e4388f63af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd6qXBT8Cd52hi6+dwZJ9jVGH1R+o+wyTmNWceQv7m4=;
 b=smRq9tFRDx4zcXtuhm3+jk8TD675jdNpA7HmJcv5SkkKkdOWAAZXqzTsGoDDPegWKzce46X16sTMWII3nDwj2HrVub2lKLLItpu3NU9WbsIC5TvndgvqDQQYEZoaur4oBZk44aak66kZuQH0+m9+QSRcGFuZDV/WwC8A0dBflII=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba3dfc19ea7f442a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kz97nwnNcS4BreFpwo2paIkCIzmc8/k3fEI3KdrNlYirCr1fARKim5su2plyfDgaVM8XmtSknumGRA/4GL7WEsPkU0D8mEJxCF0fzeD+DtWHwbqY9tR/OD6N5WUCqP3oYc/Fr10xXIlj65Tz0sKZW2+LplCtFOiuk2jem6V9yZJxcxWoOapcViElta38ByTu5ayto90sG5CtaHnywTy6LLA/1aRNGPoT4v1AMHbFMh1IKkn1b+vWYxi1GDgHe58xD3tEcrQClttso3UFESwWuul32sEjpuomluXMOpaehB5a76Gzq4+b+fkNxYAiEkAzeW8Hu4B+5qAdvfmnP/1Ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qd6qXBT8Cd52hi6+dwZJ9jVGH1R+o+wyTmNWceQv7m4=;
 b=NGmBZ01Y+6f4TKAEA3zZ5/XdH2DtSQ4MiT+zdJNf1dRfXiqZVs6nfdklJY39n7cSrId/AMfZHUsKS3zP868RzGznariXn8YPGUpinLA70hZ/AoXvsGS5rl6KB2U7lXOSKXQpiz8Df4Q94E6DWQOtII+jJKBWqb2BJ0lwdgIq4LphRCTk+LZefSrx19dgmAxM9nlBv9I9xtAZ/gUO8uFhrpMxrg4mVegBAldIG4/kO0lBA2YNJJbhyAKtL0rRMzBHjU/7+hJxvfMK5N5phhNuRa2lTO3TVB75AvoCJ8DdC6jfMC5O6nMdyWLl3Nx0Uko9KpWKFXk21QOAT0mQQrd/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd6qXBT8Cd52hi6+dwZJ9jVGH1R+o+wyTmNWceQv7m4=;
 b=smRq9tFRDx4zcXtuhm3+jk8TD675jdNpA7HmJcv5SkkKkdOWAAZXqzTsGoDDPegWKzce46X16sTMWII3nDwj2HrVub2lKLLItpu3NU9WbsIC5TvndgvqDQQYEZoaur4oBZk44aak66kZuQH0+m9+QSRcGFuZDV/WwC8A0dBflII=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 00/37] Add device tree based NUMA support to Arm
Date: Thu, 23 Sep 2021 20:01:59 +0800
Message-ID: <20210923120236.3692135-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3c6d064-bacb-4cc4-16cb-08d97e8a2963
X-MS-TrafficTypeDiagnostic: AS8PR08MB7157:|DB6PR0801MB1800:
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1800D172EF6091FBDAFDBF239EA39@DB6PR0801MB1800.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Xj5lp4hs3g4hYukSFF/ti6WlY7cd5crhuaVPoIQRFR4Uw5xRmiOg23CRvZvVyihx8ac/xx8C0+ba+rFWCrPk5uu0Z975vsqBl/WETPB4mcTDmTdzj7/DIDfNjahFh8UopyQ5CLUKkqFeWNudkFYsHMWfuqYOWZ8hvEtaiixFJdmgRHnJUyHPgqWe5xPr6x/3G0rtASXPhcHkmJBhyj9B3WgqLQVWfTSoP+oIHeXh9Mldc/YuE0XR+VzIgjJkUQMwdd2n/wJU9PRu52k5vY9/rqUJnwHKacPobD635oRMRINX3kP3lEdVK5R+5AerW1g/THmkPaTLAnE8sye0OrpI+AFWrcsQa7ZqbWiwwvTq75n4z9gEJlW1rTH/RblFueA2+4vS/L5TQtvudoo6chQOr8okJPtLqm1G5PuAVcNHSdW8fFemR7DziYOY7czUtiuGVWR0bx6XUO+6pT6uNnGPdOUEYzHHR8IzkWhXkbslQJkHA+ZbRl+JWRdR+XOatB6Q9vMH4RsgiJjjpDT3b55Q10dGxRoErqALHAaWOEmg5TOzkpG0DLQsdticmRwpeH9sS8l4+QghRQ3regTfFyJBjZFoaXJ/yya/WATAGEsNtZJN0qiQyayXjADjOgqA8hyRfuXRvdBzrrXMqNzbG96u9linxZdzIxK0FAXk6Y2sCeIkfXq0B/q61l+ogDUBLrVZVcvV6b48/f5MFAaFdhlcfFlij16jHWfKI90VAvOaVJQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(2906002)(2616005)(36756003)(82310400003)(70206006)(316002)(426003)(4326008)(5660300002)(8936002)(1076003)(508600001)(6666004)(356005)(8676002)(70586007)(86362001)(36860700001)(7696005)(186003)(336012)(26005)(81166007)(83380400001)(44832011)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7157
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	56dae567-b150-424e-c4ee-08d97e8a1f98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Ay7lN5MjACwsaotyUbdmtUmfa4q7Xe3Olm/7Sh0LRPTMlnyy7+IF6zpfM2DusoGA4Bls8ZQ/cy8VZ0dXV4eeebOYpjz2TX2IMzcpYH8Ujs+GpmJf/JVehrUCSBGnQ4N19SnWG+nqnhmbds22Slfp20PJNKrQkgvjhfHsjeUmsdw2H9Q32JGb5nEfSQmbgT6SBJ1fhSBFDzwwOad+TZt2ZjnvaTmSoy7pWpzV9/mLHTsbIozpyhsKSyRFT1w6PXDY941Q1nAeHBfWfSvQy7YJgtLciCLy0fWTXez/YIUzRuqIWONOPVADHdphtvjRTHsbrV9RvECMEs2tCxqvEwxzrgc2Vu3ZLDci4c75gRZNqsmyEdyRiq20452Nch9RXm1qQa/6LLl3HYETsQN34Sd56z+2CvLmHNGU6mSuI87wi/rm+hZX01HtqgiLTJcbNbQxH+c81ow2OCASbSrHLvXRdPT6qCdB0itkZs4MCO+8elVZHqKxy8+jqyrE6ek4Hq2OFwQh/EDrSs3+LT2lH2VLIadCwNpEuja00sy0wemlmgZGZK+QXM8uqoJ8eQ3lthASC1D7euKPZH20NzQVRQL5EgPF0NuiLrZaNRiFzDGG8jxxDJaAU0bcNNvLpMYSMkuUncBp3TAWJH6JQaV+aORtpRaXBh4rToT/p6DSg2IJMEG4n9mNo5Jlc6xLSPJOKaAZBzDKoMKZksZQLgyvkSxqA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(2616005)(4326008)(426003)(47076005)(8676002)(36860700001)(81166007)(83380400001)(86362001)(82310400003)(8936002)(110136005)(186003)(36756003)(5660300002)(1076003)(70206006)(70586007)(508600001)(336012)(6666004)(7696005)(316002)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:31.3992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c6d064-bacb-4cc4-16cb-08d97e8a2963
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1800

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts. 

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

---
@Julien, about numa=noacpi option, I haven't remove it in this
patch series. I had tried, and this option is not easy to remove.
So I'm not going to think about doing that in this series  

rfc -> v1:
 1. Re-order the whole patch series to avoid temporary code
 2. Add detection of discontinous node memory range
 3. Fix typos in commit messages and code comments.
 4. For variables that are used in common code, we don't
    covert them to external any more. Instead, we export
    helpers to provide variable access.
 5. Revert memnodemap[0] to 0 when NUMA init failed. Change
    memnodemapsize from ARRAY_SIZE(_memnodemap) to 1 to reflect
    reality.
 6. Use arch_has_default_dmazone for page_alloc.c instead of
    changing code inside Arm
 7. Keep Kconfig options alphabetically sorted.
 8. Replace #if !defined by #ifndef
 9. Use paddr_t for addresses in NUMA node structures and function
    parameters
10. Use fw_numa to replace acpi_numa for neutrality
11. Change BIOS to Firmware in print message.
12. Promote VIRTUAL_BUG_ON to ASSERT
13. Introduce CONFIG_EFI to stub API for non-EFI architecture
14. Use EFI stub API to replace arch helper for efi_enabled
15. Use NR_MEM_BANKS for Arm's NR_NODE_MEMBLKS
16. Change matrix map default value from NUMA_REMOTE_DISTANCE to 0
17. Remove check in numa_set_node.
18. Follow the x86's method of adding CPU to NUMA
19. Use fdt prefix for all device tree NUMA parser's API
20. Check un-matched bi-direction distance in matrix map
21. Remove unless fdt type check function
22. Update doc to remove numa x86 spcific
23. Introduce Arm generic NUMA Kconfig option

Wei Chen (37):
  xen/arm: Print a 64-bit number in hex from early uart
  xen: introduce a Kconfig option to configure NUMA nodes number
  xen/x86: Initialize memnodemapsize while faking NUMA node
  xen: introduce an arch helper for default dma zone status
  xen: decouple NUMA from ACPI in Kconfig
  xen/arm: use !CONFIG_NUMA to keep fake NUMA API
  xen/x86: use paddr_t for addresses in NUMA node structure
  xen/x86: add detection of discontinous node memory range
  xen/x86: introduce two helpers to access memory hotplug end
  xen/x86: use helpers to access/update mem_hotplug
  xen/x86: abstract neutral code from acpi_numa_memory_affinity_init
  xen/x86: decouple nodes_cover_memory from E820 map
  xen/x86: decouple processor_nodes_parsed from acpi numa functions
  xen/x86: use name fw_numa to replace acpi_numa
  xen/x86: rename acpi_scan_nodes to numa_scan_nodes
  xen/x86: export srat_bad to external
  xen/x86: use CONFIG_NUMA to gate numa_scan_nodes
  xen: move NUMA common code from x86 to common
  xen/x86: promote VIRTUAL_BUG_ON to ASSERT in
  xen: introduce CONFIG_EFI to stub API for non-EFI architecture
  xen/arm: Keep memory nodes in dtb for NUMA when boot from EFI
  xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
  xen/arm: implement node distance helpers for Arm
  xen/arm: implement two arch helpers to get memory map info
  xen/arm: implement bad_srat for Arm NUMA initialization
  xen/arm: build NUMA cpu_to_node map in dt_smp_init_cpus
  xen/arm: Add boot and secondary CPU to NUMA system
  xen/arm: stub memory hotplug access helpers for Arm
  xen/arm: introduce a helper to parse device tree processor node
  xen/arm: introduce a helper to parse device tree memory node
  xen/arm: introduce a helper to parse device tree NUMA distance map
  xen/arm: unified entry to parse all NUMA data from device tree
  xen/arm: keep guest still be NUMA unware
  xen/arm: enable device tree based NUMA in system init
  xen/arm: use CONFIG_NUMA to gate node_online_map in smpboot
  xen/arm: Provide Kconfig options for Arm to enable NUMA
  docs: update numa command line to support Arm

 docs/misc/xen-command-line.pandoc |   2 +-
 xen/arch/Kconfig                  |  11 +
 xen/arch/arm/Kconfig              |  12 +
 xen/arch/arm/Makefile             |   4 +-
 xen/arch/arm/arm64/head.S         |   9 +-
 xen/arch/arm/bootfdt.c            |   8 +-
 xen/arch/arm/domain_build.c       |   6 +
 xen/arch/arm/efi/efi-boot.h       |  25 --
 xen/arch/arm/numa.c               | 155 ++++++++++
 xen/arch/arm/numa_device_tree.c   | 274 ++++++++++++++++++
 xen/arch/arm/setup.c              |  12 +
 xen/arch/arm/smpboot.c            |  39 ++-
 xen/arch/x86/Kconfig              |   3 +-
 xen/arch/x86/numa.c               | 449 ++---------------------------
 xen/arch/x86/setup.c              |   2 +-
 xen/arch/x86/srat.c               | 232 ++-------------
 xen/common/Kconfig                |  14 +
 xen/common/Makefile               |   2 +
 xen/common/numa.c                 | 450 ++++++++++++++++++++++++++++++
 xen/common/numa_srat.c            | 264 ++++++++++++++++++
 xen/common/page_alloc.c           |   2 +-
 xen/drivers/acpi/Kconfig          |   3 +-
 xen/drivers/acpi/Makefile         |   2 +-
 xen/include/asm-arm/mm.h          |  10 +
 xen/include/asm-arm/numa.h        |  50 ++++
 xen/include/asm-x86/acpi.h        |   4 -
 xen/include/asm-x86/config.h      |   1 -
 xen/include/asm-x86/mm.h          |  10 +
 xen/include/asm-x86/numa.h        |  65 +----
 xen/include/asm-x86/setup.h       |   1 -
 xen/include/xen/efi.h             |  11 +
 xen/include/xen/numa.h            |  94 ++++++-
 32 files changed, 1470 insertions(+), 756 deletions(-)
 create mode 100644 xen/arch/arm/numa.c
 create mode 100644 xen/arch/arm/numa_device_tree.c
 create mode 100644 xen/common/numa.c
 create mode 100644 xen/common/numa_srat.c

-- 
2.25.1



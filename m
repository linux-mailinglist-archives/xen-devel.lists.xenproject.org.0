Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2D326D23B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 06:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIlOy-0006Yy-HC; Thu, 17 Sep 2020 04:20:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iutg=CZ=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kIc1M-0006gT-5k
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:19:08 +0000
X-Inumbo-ID: 11ce2a58-3629-4259-be55-7d98e41c34a0
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11ce2a58-3629-4259-be55-7d98e41c34a0;
 Wed, 16 Sep 2020 18:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ZKLrKv5xvOStTUo/GBWmiePCEvJxPz6oMjmFu7HE9x3oqfzHwXgy+1kloj+R85V2XDgTWIqv5fVIRafXRSFUU6H7hHosLt6w3ZvjvArf6oHMccuyfQwBeBEzArqnFqjL6ufpHuCSMx3Hh2R9OnuBwfEwOpWe/MXHTRilpewt3F9QqTIdxPJd6jhzUDOYwebsTYBqUlCJ59l7gwvT5FxX4fUGsx6vjFJahn3ztUBQb+lOVAbV1n0jOwxN+qPl9sh8gytkN4jTk95Y5Hf1Y/8RAr+EJ6vlt5XYpJRmpus5irOVxLQdc+PFjecGs8pIRixh8BkYZj4P9b30MPryeCjTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOfMMvvELV9He2pXijuvgye5qEgPbeuNgQNwSo2vias=;
 b=JROw7Vci9SyusE/hR0YSUZIiWXWBVybjHRXaC7XSspw3613Zo7M7b3K+NH5Mzu8ocsUCBEzUFUgoEWiaD531piiZ2ptPKgSA8cuEw0pZ/K/wfZiPJlzfPmzrFL4KAjh5mqR1cln6qK6wGI1aeJXXAyjEIbNwu9DsEWFCwB/My4QQC0VrL6MY5nup2lFR2KQAt8NuH3EwqHEQd0cBkJqXMwiEr+NoW6KlXDW8C/Uxhmf5z1BdfMV3SOoYQhJz7/XogWH5qusL+Duzg3U38MzxNI12krSL/htScCvGIBIqCErmFqsSEF1WsJkbQugQZCtjmnTGK2Ypj5ItIH3nJ3YrTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=dornerworks.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOfMMvvELV9He2pXijuvgye5qEgPbeuNgQNwSo2vias=;
 b=brgRgtCmKJw5wPPvkssAi197ajKotG9pewbyDeZvBMfuxvaEBUGZHmiIAkkhdx7Ufz8Uijj8XSseThuFUFprIe4QNInB4oIcY67FVhAv9Os5/UUkpN/8k0FIOiMhct/2NZwhy4mIUw3gO2gNhWIfSolPiyYhsRB9Gzt5JkKtEXzvO1nrcyWkN4poKsAeBq2SGCs7pZYg9Gtcq/97IBUit8/1wqMWkiCM5oMqWgXKZK6OGO5CbXL6vW17uSW2UwPXzp0VnO+d6PeAYZW5gOPsa/RkkCXKDt5K7PkgS65K9uojOvQqen9DONL7OWr6T0qPgiT3pVN6Xq9i6OYNJ0suiA==
Received: from CY1P110CA0048.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::18)
 by DM3P110MB0538.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:414::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 18:19:00 +0000
Received: from BN3USG02FT003.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:4::209) by CY1P110CA0048.office365.us (2001:489a:200:400::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 16 Sep 2020 18:19:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 207.242.234.14)
 smtp.mailfrom=dornerworks.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=dornerworks.com;
Received-SPF: Pass (protection.outlook.com: domain of dornerworks.com
 designates 207.242.234.14 as permitted sender)
 receiver=protection.outlook.com; client-ip=207.242.234.14;
 helo=localhost.localdomain;
Received: from localhost.localdomain (207.242.234.14) by
 BN3USG02FT003.mail.protection.office365.us (10.97.24.77) with Microsoft SMTP
 Server id 15.20.3348.19 via Frontend Transport; Wed, 16 Sep 2020 18:18:59
 +0000
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>
Subject: [PATCH 0/5] Multicore support for ARINC653 scheduler
Date: Wed, 16 Sep 2020 14:18:49 -0400
Message-Id: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 76122b1a-8712-4b62-4f1c-08d85a6cfbc9
X-MS-TrafficTypeDiagnostic: DM3P110MB0538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM3P110MB0538229682F833017C94F7F3E9210@DM3P110MB0538.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:localhost.localdomain; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(6069001)(4636009)(346002)(46966005)(4326008)(956004)(1076003)(83380400001)(5660300002)(2616005)(8676002)(508600001)(82310400003)(81166007)(6666004)(44832011)(336012)(8936002)(33310700002)(26005)(86362001)(47076004)(107886003)(6916009)(2906002)(54906003)(186003)(70586007)(36756003)(70206006)(34070700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 18:18:59.5483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76122b1a-8712-4b62-4f1c-08d85a6cfbc9
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=097cf9aa-db69-4b12-aeab-ab5f513dbff9; Ip=[207.242.234.14];
 Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: BN3USG02FT003.eop-usg02.itar.protection.office365.us
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3P110MB0538
X-Mailman-Approved-At: Thu, 17 Sep 2020 04:20:06 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This patch set adds multicore capability to the ARINC653 scheduler, based on the
guidance presented in the CAST-32A position paper. This approach only allows for
a single domain to run at any given time, but that domain is now able to use
multiple vCPUs running across the available pCPUs.

There are 5 patches in this series. The first 4 patches are intended to tidy up
the arinc653 scheduler code, so that it more closely resembles the coding style
and structure found in the other schedulers (mainly credit). The last patch
implements multicore support.

I have tested this feature on both the Xilinx MPSoC/ ZCU102 development board
and with ARMv8 QEMU. I have a bash script that tests various edge cases such as
schedule changes, creation and destruction of domains in the cpupool, domain
migration across cpupools, vCPU pinning, and vCPU overprovisioning (more vCPUs
than pCPUs). In each of these cases, the scheduler either works as expected or
behaves in a sane manner. For the latter, any quirks that were identified are
documented in the source code.

This patch set has been sitting on the backburner for the better part of a year,
so I have rebased it to latest commit on master. The tests above were re-run and
no problems were identified. I'm looking for feedback on the patch set to so
that it may be accepted into the Xen code base.

Jeff Kubascik (5):
  sched/arinc653: Clean up comments
  sched/arinc653: Rename scheduler private structs
  sched/arinc653: Clean up function definitions
  sched/arinc653: Reorganize function definition order
  sched/arinc653: Implement CAST-32A multicore scheduling

 xen/common/sched/arinc653.c | 1190 ++++++++++++++++++++---------------
 1 file changed, 686 insertions(+), 504 deletions(-)

-- 
2.17.1



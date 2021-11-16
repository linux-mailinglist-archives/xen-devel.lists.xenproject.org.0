Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C66452B08
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226076.390591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms16-0002HS-5V; Tue, 16 Nov 2021 06:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226076.390591; Tue, 16 Nov 2021 06:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms16-0002Es-1V; Tue, 16 Nov 2021 06:32:28 +0000
Received: by outflank-mailman (input) for mailman id 226076;
 Tue, 16 Nov 2021 06:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms14-0001ym-MN
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f49e0120-46a6-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 07:32:23 +0100 (CET)
Received: from AM6PR0502CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::35) by DB8PR08MB5257.eurprd08.prod.outlook.com
 (2603:10a6:10:e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 06:32:19 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::f9) by AM6PR0502CA0058.outlook.office365.com
 (2603:10a6:20b:56::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:18 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Tue, 16 Nov 2021 06:32:18 +0000
Received: from 92d2bcac55f3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 29AD8B85-122D-41E9-84D9-382F88057E6D.1; 
 Tue, 16 Nov 2021 06:32:11 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92d2bcac55f3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:11 +0000
Received: from AM5PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:203:90::18) by AM9PR08MB6754.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 06:32:10 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::f2) by AM5PR0402CA0008.outlook.office365.com
 (2603:10a6:203:90::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:10 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:09 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Tue, 16
 Nov 2021 06:32:07 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:05 +0000
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
X-Inumbo-ID: f49e0120-46a6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPL/dvtIKqAB6NIBGXK4lzhSc8UgsEbwQ+a1Tu1jQgE=;
 b=gtpn9RA84nswMjGiHbXS+KlR6qbci1ZG2ec6wK0TzS4yyWI2bSqnYlQ28dRKGYyPQrOM4yTSZ/P10vRbGGCKhRfUBjMOTcI8dAXUg8RC3i05QxgdKOhAZikL2rWM8gqnZu6gpYTTJrWN7m169tHrh1i/5QzKsDJsKlVxDNIKR6s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53323a65f543df4c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpPPHFXcAQ5QWeBbciy9EcwzuiYfWTSndkTKwGb/yIVyRtxTlwjoCkegyf23oFbsAk6RgKnoQp2HQW3Bn1OCDWZCAeGIDLbdFK8clfBU6sYb6fXB3EMe+2blPZc7m/imyslZDNqhtj51fVAHkFwpJIHPHQsVMsfaCFs3YDGbANMjAagcZHTSyPQd+8FQaFBsJBGGzaG2VnqOxHgO9FbEo6iCPi8uQpcAQCFJncQklej4QGEVdHA5VTf7ttvRFpvXCNNa+r33pnL5Pmg7ze2qDVk71j6L+PGy8r+btSs5Kau5LUAs0yUhFaa+UNbah4NeeLwy1IDlWvsPBOloHynVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPL/dvtIKqAB6NIBGXK4lzhSc8UgsEbwQ+a1Tu1jQgE=;
 b=EQAKyUO5pORhsPWC1a0mkX9cletkjFTGnBn97HyNaOGL2md5BLUYyTRin+urS/SCMaLUjGG6Vh3JQZt+ZzY4oPSyMOZDR7dvrqJpmuUgbenNVzkhUhky/CUSavXLtTMZdlldTTQy7iF/H8nbAgIhU7VVIOGGzAkDoU8zfDmBkpwjWf2DSKLKh9mJ88s4c1QmCyc3RGPWVGohp1/OQZZHuxCyLBF4FLJ1ZnFoGfdZH7kZZzbzievogcNOiMihmyz7TJVJQ/RHSBNWf8RB7x1bvc1yE9FoYv26E3G6kwXL06e16ECLYqZAVm1do/PXUh41DC1QdPDHZpTwr9Y5zv93KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPL/dvtIKqAB6NIBGXK4lzhSc8UgsEbwQ+a1Tu1jQgE=;
 b=gtpn9RA84nswMjGiHbXS+KlR6qbci1ZG2ec6wK0TzS4yyWI2bSqnYlQ28dRKGYyPQrOM4yTSZ/P10vRbGGCKhRfUBjMOTcI8dAXUg8RC3i05QxgdKOhAZikL2rWM8gqnZu6gpYTTJrWN7m169tHrh1i/5QzKsDJsKlVxDNIKR6s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v3 00/10] direct-map memory map
Date: Tue, 16 Nov 2021 06:31:45 +0000
Message-ID: <20211116063155.901183-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b53e316-651f-40bd-21ce-08d9a8cad6bd
X-MS-TrafficTypeDiagnostic: AM9PR08MB6754:|DB8PR08MB5257:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5257441B6BAA12FEEF0C274AF7999@DB8PR08MB5257.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IDI/M6UPvnQYFfw36IpPBk4JaR+jYURPQ18nXkXAUYubnZEr7+igpTTmvvsVELE5bCtwRZgdN9VwHfRRJHfaz1fJ1atFoLeUwBkw/6wxhTsGRB7Sdsj4+Lub4+BH3pZFGYGU49oKhZDr4J+wlcT/1q4sGKKOQiSxg7S979PO0Bp0o6nk+RbfCMZVXA/MjjMqpiyPlBnf1citbuwf/PsdBoQDiVLrnjMYlnBLy/SaXE9AgsPdp5hTIYQf7BAaFMH9uaQHNRFLYPxjqUX6Bhzvpiq3gWuXoLwbskCvdOkeFB/cOgOD2tR+ZkvSKc7JOlN3mICIZ7AgKfYtZrSYTdIHQwyTfKJKzFUOmdtRMWopyecWp4i0rwfeKf/hDHxLoVc4ynEToeAU0QvJ/HARV/ejMC/E/eP1yLProhjMtQf8/jaxfzgjXidODA809Fa6OKmxxdrfj4uSZ/pF8/oS1g2Jxdd3W7Ixxb8XdMzDf013Fl1ndLlFT/O8KgIkfTqgnrLtj9cYjw3r/AGpWPaLJFt9/7o0bxj2f70wIHz1dIO45QzUwgwuplfHAkoUg5QS/BX4PvbE7CDZ9f0xWQFrPLdy6WiHXZwiD73qP0pMjv9m+vMQUOUuakb1GwElXyqDF2K6NyMTGjW+ajFebJv6eY81JvjnBhmOZ/fsKrmQJkp+PeNVKtTk+7iBp9fYJj5EWwFVqkUro3EB0VMl+4BiI9veAnQhiHcsW9s/W7lFN6CZDoTg5UDF9vvGuXLaVF1L/TpvepMZ8P0xRnv2/tQfe3rg0957sx4rPY46vdsTVk2Wo9MFU8xSFZyb+wanFzryxd346yJaZsf5OumWWpvp2DKNUVMp1CCEoNQLq2WxVnp3Qa6qUAbR1LKIBCjkwcePIalx
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(36756003)(7696005)(70206006)(2616005)(8676002)(186003)(5660300002)(81166007)(82310400003)(966005)(70586007)(336012)(4326008)(426003)(44832011)(508600001)(86362001)(8936002)(356005)(1076003)(316002)(6666004)(83380400001)(54906003)(36860700001)(2906002)(110136005)(47076005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6754
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f18e34e-1c50-4d92-eb0a-08d9a8cad13b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rFfSq2qrrLYxHIhXPkead9wcffkAH1rhk5rbMHUsKCeHK5GnWDFG6eK0aQu2gQqERW2sQ2cQfVHxOSjkTULZlblqOHuHZ0+IM+Tk9p6y+phaKVdnL0BHR7r3y3v/PNCXDKJlwZq3S8yqNQqx3Az1pPYL5Fb1x2xw9NF+/ju3oeApr28rr3qOlryPt1PCL29jXywAEstsQpCe1sU+/qxWduIOw+pR7egiDD3GNY2Wo6vhbSBpXcn5gwtrBHmSf066CLHvmdPz9QS3h//uM2LObTq9i+iRa79r/amDixRpw2jGnFDsQi6X3TI5gUkzOP6U7mWap7sJKG7LwPEc8a1mJ1rCSqHVmwwQi9/uatWMGV8/U7ZeJVf5KvTvda8kugJMRQ/ONyhXvrSrPanpI42rPj0nIrzVMar2cWFeszFjKH+X8emLIJ/OiX7RRnvZ2peZUDdAdPETWwYdGf0wx5ibsp5zEdZ0NTMq0maMYKe6H3strBbcVq8tJjfZEXx3BRmhl9mjnLzIJ6SxPODE+s0etMaeXMFmUIuN8sl3QpQ41slPTVHmaz+gagBPDVsjGIKhaIczX+9kjrIR8yDKXedEaEf7JZyUekLD6itffcjZloCoZgsJDTaVhGkqM/a0cL8uasIeEyFkJ2i4d7SS4OYV36lyNGUAWUVkcKBHAwmO70o7PSnd7UpaqebKN/ovcqHuPnYYUMBVSXfJhs7Gs+Va+GD3XH22+CpdQa5gUNfb7DmiGAietBxH2cMGX7iE5C/YbTYzs27cxzj6i4HZn07ctOSvlsA3x6sfNhZJxmMkdvIcwV2P6/PV/XG1oZUPLCKxZKMKnKjZX4UZKb5uaY6+IoNanNUsnhsaC/pZ39V7w40=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(2616005)(36756003)(82310400003)(54906003)(2906002)(110136005)(86362001)(5660300002)(26005)(426003)(6666004)(47076005)(508600001)(8676002)(966005)(44832011)(8936002)(83380400001)(7696005)(316002)(36860700001)(81166007)(70586007)(70206006)(186003)(1076003)(336012)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:18.8155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b53e316-651f-40bd-21ce-08d9a8cad6bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5257

Cases where domU needs direct-map memory map:
  * IOMMU not present in the system.
  * IOMMU disabled if it doesn't cover a specific device and all the guests
are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
a few without, then guest DMA security still could not be totally guaranteed.
So users may want to disable the IOMMU, to at least gain some performance
improvement from IOMMU disabled.
  * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
To be specific, in a few extreme situation, when multiple devices do DMA
concurrently, these requests may exceed IOMMU's transmission capacity.
  * IOMMU disabled when it adds too much latency on DMA. For example,
TLB may be missing in some IOMMU hardware, which may bring latency in DMA
progress, so users may want to disable it in some realtime scenario.
  * Guest OS relies on the host memory layout

"direct-map" property shall be added under the appropriate domain node,
when users requesting direct-map memory mapping for the domain.

Right now, direct-map is only supported when domain on Static Allocation,
that is, "xen,static-mem" is also necessary in the domain configuration.

Looking into related [design link](
https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
for more details.

The whole design is about Static Allocation and direct-map, and this
Patch Serie only covers parts of it, which are direct-map memory map.
Other features will be delievered through different patch series.

See https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00855.html
for Domain on Static Allocation.

This patch serie is based on
https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00822.html
---
v3 changes:
- move flag XEN_DOMCTL_CDF_INTERNAL_directmap back to xen/include/xen/domain.h,
to let it be only available for domain created by XEN.
- name it with extra "INTERNAL" and add comments to warn developers not
to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
- reject this flag in x86'es arch_sanitise_domain_config()
- add ASSERT_UNREACHABLE to catch any misuse in allocate_static_memory()
and allocate_static_memory_11()
- add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
when CONFIG_STATIC_MEMORY is set.
- simply map the CPU interface at the GPA vgic_v2_hw.cbase
- drop 'cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS)'
- rename 'is_domain_use_host_layout()' to 'domain_use_host_layout()'
---
v2 changes:
- remove the introduce of internal flag
- Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_directmap is set
- reword "1:1 direct-map" to just "direct-map"
- split the common codes into two helpers: parse_static_mem_prop and
acquire_static_memory_bank to deduce complexity.
- introduce a new helper allocate_static_memory_11 for allocating static
memory for direct-map guests
- remove panic action since it is fine to assign a non-DMA capable device when
IOMMU and direct-map both off
- remove redistributor accessor
- introduce new helper "is_domain_use_host_layout()"
- explain why vpl011 initialization before creating its device tree node
- error out if the domain is direct-mapped and the IRQ is not found
- harden the code and add a check/comment when the hardware UART region
is smaller than CUEST_VPL011_SIZE.

Penny Zheng (4):
  xen/arm: introduce new helper parse_static_mem_prop and ...
  xen/arm: introduce direct-map for domUs
  xen/arm: add ASSERT_UNREACHABLE in allocate_static_memory
  xen/arm: gate make_gicv3_domU_node with CONFIG_GICV3

Stefano Stabellini (6):
  xen: introduce XEN_DOMCTL_CDF_INTERNAL_directmap
  xen/arm: avoid setting XEN_DOMCTL_CDF_iommu when IOMMU off
  xen/arm: if direct-map domain use native addresses for GICv2
  xen/arm: if direct-map domain use native addresses for GICv3
  xen/arm: if direct-map domain use native UART address and IRQ ...
  xen/docs: Document how to do passthrough without IOMMU

 docs/misc/arm/device-tree/booting.txt |   6 +
 docs/misc/arm/passthrough-noiommu.txt |  52 +++++
 xen/arch/arm/domain.c                 |   3 +-
 xen/arch/arm/domain_build.c           | 310 +++++++++++++++++++++-----
 xen/arch/arm/vgic-v2.c                |  31 ++-
 xen/arch/arm/vgic-v3.c                |  29 ++-
 xen/arch/arm/vgic/vgic-v2.c           |  31 ++-
 xen/arch/arm/vpl011.c                 |  60 ++++-
 xen/arch/x86/domain.c                 |   6 +
 xen/common/domain.c                   |   3 +-
 xen/include/asm-arm/domain.h          |  11 +-
 xen/include/asm-arm/new_vgic.h        |  10 +
 xen/include/asm-arm/vgic.h            |  11 +
 xen/include/asm-arm/vpl011.h          |   2 +
 xen/include/public/domctl.h           |   4 +
 xen/include/xen/domain.h              |   3 +
 16 files changed, 471 insertions(+), 101 deletions(-)
 create mode 100644 docs/misc/arm/passthrough-noiommu.txt

-- 
2.25.1



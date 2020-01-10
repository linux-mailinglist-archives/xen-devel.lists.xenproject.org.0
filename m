Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB81364C5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 02:29:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipj4k-0006uv-S1; Fri, 10 Jan 2020 01:26:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eZRS=27=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1ipj4j-0006uq-KJ
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 01:26:57 +0000
X-Inumbo-ID: 4937f704-3348-11ea-bbc6-12813bfff9fa
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.220.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4937f704-3348-11ea-bbc6-12813bfff9fa;
 Fri, 10 Jan 2020 01:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP9PGxUuYuK81oHhP/cwoFJCm60q9xp9rPxbZpK2iYGd10f/nGxlulo17HCD5R1EGSxQsrco0XYRI38tQR76aNnX4qqdLoQBwnIsH4j2jUa6osM2Iuq/0jGPPAlUyxfufLvN2XsBAOgU86tJLdgkFPXjFz9AU20HJQ6qJROB2FgJoBiD6VUqP2oYGeLE/e1a/j9ZuYNYaAELSmc+Quh5Z6tPTsvMIDhWSDs3xfVEFz4fdLRKVtzWFsaFu/ftvR0hnfmBl1zmP3qL37abWBB1owookIbKdgtB6y4R2igG2XthZbYpKxyhPJb8/outQgqF3k6oOqqYTurDe+H6yAm7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ekJWvSyjNHOS7J5HTnDlsC67r1PwlxTGYHxP/NHX/8=;
 b=RGTRIfuXKaEx7Tl2wOHm7VL22l9V4MuoqpnkIf7qf+XUd8ibKyZ+MhvYA9Qg1iXQxIrKd9LSWb/TOnoTtfgKQ70uUx9dvd8iRnCdtHen9rC+/z+0ookPfEbKKnNPryDQkLkMWvlLo3e81GzKm+vZhNR8XJu0Ln5XRl7ofLAVzk8fgnxh22tLmijCRgHCqjsKckQLrmtZjYWCZ+zm0BQGNHdZMWpEy8stnyHC6LyYqX015LR3bVnCmSVpsZhgIxz4yUgmQLmpxG8c4HMwp+89h9FKTT+UQ0RPFtBWo+KwBxRMRlOi7gWm4coc1pGJuiVU6BqYGgmpweTLoq9nbvYvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ekJWvSyjNHOS7J5HTnDlsC67r1PwlxTGYHxP/NHX/8=;
 b=kRbx9zCg358VW5a5e+YXWLU8iFnM0uGGsI8Hjjs0ciTbg1EZemCkdMkhvgwvEasoZ9wCyEPwL5RMg7k3jIg3PybzVVgJiAEc72rFdJDlwtpHe/W60P2RcVZ0snprN+1BPl3gx7nEdsfyiXAUu96UlmbAtK+QRbRzPb4YrImOIMk=
Received: from BN7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:20::20)
 by BL0PR02MB3825.namprd02.prod.outlook.com (2603:10b6:207:49::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12; Fri, 10 Jan
 2020 01:26:54 +0000
Received: from BL2NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by BN7PR02CA0007.outlook.office365.com
 (2603:10b6:408:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Fri, 10 Jan 2020 01:26:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT030.mail.protection.outlook.com (10.152.77.172) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Fri, 10 Jan 2020 01:26:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1ipj4f-0003kz-18; Thu, 09 Jan 2020 17:26:53 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1ipj4Z-00008X-To; Thu, 09 Jan 2020 17:26:47 -0800
Received: from [172.19.2.62] (helo=xsjwoods50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1ipj4U-00008C-PX; Thu, 09 Jan 2020 17:26:42 -0800
From: Brian Woods <brian.woods@xilinx.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 Jan 2020 17:26:28 -0800
Message-Id: <1578619590-3661-1-git-send-email-brian.woods@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(189003)(199004)(9786002)(36756003)(44832011)(107886003)(2616005)(6916009)(8676002)(70586007)(316002)(478600001)(4326008)(8936002)(70206006)(86362001)(5660300002)(6666004)(54906003)(186003)(356004)(336012)(7696005)(81156014)(2906002)(426003)(4744005)(26005)(81166006)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB3825; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eacb28e-9531-4068-6b35-08d7956c2ce5
X-MS-TrafficTypeDiagnostic: BL0PR02MB3825:
X-Microsoft-Antispam-PRVS: <BL0PR02MB3825B7AAB65E5B16FA5572A1D7380@BL0PR02MB3825.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 02788FF38E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/sjpK5pLaF619je9ftvp3A40c2KE0maxX5CmY2/d7+fHENKngLYOVPb/lh4VfRvK1QjoIss4LGNLT4u3ORzKVYtdFsOHb8ZverkZ5Ynpe24GuYGsYZWlzBcG/kpwp7AJ74rHJlGHlyN62WcAGmtM8NMc59NJbouJJqPjX3jUXTIbBvaFyZHAGWufHp02yCRpmPFdj25eSyOfwJ3o+tdUmzGPXmuVS6E/tsNuYY4/jLei2jTBb8CGLxfJ8mQbdmP/AflANVocnf8OOUh1q7XddHy0NyHPi279NC6lZn8/z4ebwXmz7sjDeYg3jk3MUBwMZXfkDSFCoIwlQOh9JdCS2BwwwQ0VWCPFXay8YIGnU60dBoEkxE+gWMSSp+5f3sopkcLpCIiFa3pdAQYA3ZG83k+mAfLg6lL/h8hzV4JDbKhl08EsTMDYQMHIutVfzUEN8vBXoRr5XtWwnpt16NsYIlM2hit3mLcgpfHvZGD4NQiuELn/67hNTuWx8nHR8ir
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2020 01:26:53.6682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eacb28e-9531-4068-6b35-08d7956c2ce5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3825
Subject: [Xen-devel] [RFC 0/2] Generic DT Support for SMMU
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Brian Woods <brian.woods@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSdkIGxpa2Ugc29tZSBmZWVkYmFjayBvbiB0aGVzZSBwYXRjaGVzLiAgUGFydHMgSSBwYXJ0aWN1
bGFybHkgd2FudApmZWVkYmFjayBvbiBhcmUgbGlzdGVkIGJlbG93IGFuZCBlYWNoIHBhdGNoIHdp
bGwgaGF2ZSBhIGNvcHkgb2YgdGhlCnJlbGV2YW50IHBhcnRzIHJlcXVlc3RpbmcgZmVlZGJhY2su
ICBBbnkgZmVlZGJhY2sgaXMgd2VsY29tZWQgdGhvdWdoLgpBbHNvLCB0aGUgY29tbWl0IG1lc3Nh
Z2VzIGFyZSBhIGxpdHRsZSByb3VnaC4KClBhdGNoIDE6CiAgLSBDaGVjayBpbiBkZXZpY2VfdHJl
ZS5jLiAgVGhpcyBpcyBuZWVkZWQsIG90aGVyd2lzZSBpdCB3b24ndCBib290IGR1ZQogICAgdG8g
ZGV2X2lvbW11X2Z3c3BlY19nZXQoZGV2KSBiZWluZyB0cnVlIGFuZCByZXR1cm5pbmcgRUVYSVNU
LiAgSSdtCiAgICBub3QgY29tcGxldGVseSBzdXJlIHdoYXQgdHlwZSBvZiBjaGVjayBpcyBiZXN0
IGhlcmUuCgpQYXRjaCAyOgogICAtIENoZWNrcyBmb3IgdGhlOiBhcm1fc21tdV9kdF9hZGRfZGV2
aWNlKiBhbmQgYXJtX3NtbXVfZHRfeGxhdGUqCiAgICAgZnVuY3Rpb25zLgoKVGhlc2UgcGF0Y2hl
cyBoYXZlIGJlZW4gdGVzdGVkIHdpdGggZGV2aWNlIHBhc3N0aHJvdWdoIG9uIGEgWGlsaW54ClpD
VTEwMiB3aXRoIHBhc3NpbmcgdGhlIG9uIGJvYXJkIGV0aGVybmV0IHRvIGEgZ3Vlc3QgdmlhIHRo
ZSBTTU1VLgoKQnJpYW4gV29vZHMgKDIpOgogIGFybSxzbW11OiBhZGQgc3VwcG9ydCBmb3IgaW9t
bXVfZndzcGVjIGZ1bmN0aW9ucwogIHNtbXU6IGFkZCBzdXBwb3J0IGZvciBnZW5lcmljIERUIGJp
bmRpbmdzCgogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyAgICB8IDE1NiArKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9k
ZXZpY2VfdHJlZS5jIHwgIDIwICstLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDExOCBpbnNlcnRpb25z
KCspLCA1OCBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

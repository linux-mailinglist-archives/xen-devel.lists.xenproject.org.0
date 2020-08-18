Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF63248663
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:49:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81z2-0008MT-Tk; Tue, 18 Aug 2020 13:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k81z0-0008Lw-Kv
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:48:58 +0000
X-Inumbo-ID: a7b581ad-cfac-4244-a05e-511855eda4b9
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7b581ad-cfac-4244-a05e-511855eda4b9;
 Tue, 18 Aug 2020 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv1aF4S8eNfxKXAc0B1PXiY2lp90e82pn4gMcsbTfQI=;
 b=AkPvzaG7tzQm2ks5c7lLFk+rNv4yVPU5ta4LQEFzOMOKq2FpdXpY3az5L6Bd2vqboif7OT5lGIwBoG1ZmBUmiXF/S2P3Oxmbxvw7TfJQL/k0Yxa7+zWlR8SHRzfui68YVYfOxfhhtc3rIoQGm4iiRFFTbBVL8XjnBSbQbIG18gw=
Received: from MR2P264CA0077.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::17)
 by VE1PR08MB5661.eurprd08.prod.outlook.com (2603:10a6:800:1b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Tue, 18 Aug
 2020 13:48:55 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::f) by MR2P264CA0077.outlook.office365.com
 (2603:10a6:500:32::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 18 Aug 2020 13:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 13:48:54 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Tue, 18 Aug 2020 13:48:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5209d6ada8679ab6
X-CR-MTA-TID: 64aa7808
Received: from 563bd260e1f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC15AED3-A813-442A-8E50-BD4CA9677F50.1; 
 Tue, 18 Aug 2020 13:48:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 563bd260e1f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 13:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkSjMaClceogQSNjJfC2lq3Kw72SkCAHHoonSb2az+Rm0tTajHtv/8rfEuSCB9SuxfY+T4aAxvgRlI8pWkNlLbwP2wP5ovoGwEH/GWdlo3JWmGqXbofmesDSDgdFnLmOz7mkG8NUiGzffB9Xbtf2ftAuFXDHFtUNHuZ7R3ufzZ+MXSXfIJgXviATDntTyToJArhtvHiadDGInmobtmUJo1kvLELbR2xscT8TagCltwTRjxSDaPCsjA2z/JlbIY/M+w/rn+HbGu297y/XY/2/FnjpvojU4BFgxIep9H0fTD8Tao3Bcpj9r32sCBcjeXkIe7rDa7ztB9g3s26Gr/hm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv1aF4S8eNfxKXAc0B1PXiY2lp90e82pn4gMcsbTfQI=;
 b=UKv2CFjMyM3hSRY9bRkSZo8S8uEtrkJkvmvFuBUni1SX38mCY6mt/GeuC/0xQQD8yvmiHA0NtVOOR1fSPioJJ4zUf8ZMiVXNwh8OEeQNaCxZpSOqRrCMaEWPRKbTx05szEs0MM2C+lRsODPbrDSO2Iz9blp5M7Ap8aFFmh+kqkBhkLKqYJ4RW4eHh05CsH9IMBUXwrnIL+utr8uSJuQVIKgtLZA6GPYlQXbBTdDG6osj8WKSSV3ncZXXlMccTrs47gzcquMWK/OvFgprVqmTRcBH1saXDy2Mb1iHzk3oRNp981qlj81oSFWx0Vr3Las/DEoSVGHxAeuNJJoWKCd+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv1aF4S8eNfxKXAc0B1PXiY2lp90e82pn4gMcsbTfQI=;
 b=AkPvzaG7tzQm2ks5c7lLFk+rNv4yVPU5ta4LQEFzOMOKq2FpdXpY3az5L6Bd2vqboif7OT5lGIwBoG1ZmBUmiXF/S2P3Oxmbxvw7TfJQL/k0Yxa7+zWlR8SHRzfui68YVYfOxfhhtc3rIoQGm4iiRFFTbBVL8XjnBSbQbIG18gw=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5322.eurprd08.prod.outlook.com (2603:10a6:10:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 13:48:13 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 13:48:13 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Wei Chen <wei.chen@arm.com>, Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 0/2] Enable 1165522 Errata for Neovers
Date: Tue, 18 Aug 2020 14:47:37 +0100
Message-Id: <cover.1597740876.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: DM5PR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:4:ae::22) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by
 DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 18 Aug 2020 13:48:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5fef8f87-7aab-40a8-5fe2-08d8437d72b2
X-MS-TrafficTypeDiagnostic: DB8PR08MB5322:|VE1PR08MB5661:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5661879226E36B0E5E7312629D5C0@VE1PR08MB5661.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 6ae3JblmmANv4VRkKUDHs3yQAOmRWJ6Eib/6b1EHwUnIs7OL6OxzPnkRJBSgTpHIOHJdJo/Ixus5h1gxl5V0Zwa7q56CPQ3Dkut7g3Annkgl+E4EdcupLqkz4O9GNgqPDbv3krbYPIaf6RKbbffq6TlYG5TxG1zheE7aowStrLDy+Zi4naxx+X5zXG1P/7awHBC44sMijDtfctUxG3wHJ6UTHjzkgKXZ4M/TdsR3Z0ttrjFbxXf8Us4IVsgiiuAATBeAdFIIArJbi0gXMTzmAk7IfXS3svvjeSG5Q3XG5fC5n0Eqyd4rezYPmZfZukY8Aumyq2GVAQbSjdBmj46AomA0QC1Bvm0YnkqlO4RhNG/M2nLLirVYfzicfT1nIiaF
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(36756003)(54906003)(16526019)(316002)(26005)(6486002)(2906002)(4326008)(52116002)(7696005)(186003)(6916009)(478600001)(83380400001)(66476007)(86362001)(2616005)(44832011)(4744005)(6666004)(8676002)(66946007)(5660300002)(66556008)(956004)(8936002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 16X5OpeiT1Macs54bCT2pphi02ihv42DJtksZnG+ncAlXgpi607Tv/8E2F0mhR11u4ImzJw/6IEGjk+OiJYW/TqukXP85VVOwQk2CegDEQ+3s+u5Q8ZvIsCMVtiiM7Ewe5bft57NzBrhX/I+g3Cy6+j8Vp2OizFMCgYkuTNw5W48F3YegLG0wvIAObrO1MzygYRYb2EvG0kbq5M7gdCgcluBz4CIvi1xDB+OoYUkX2scX22nKSorW2m0UnwbmfoRvkG2LhAa5athMbvdhi9QOIF40LRiV9Vi/x0f+YhU+ZFLFoAgdJGLaceiE/X2JLIytBy3UbgJAgjkv6jLlzb4e7mCtVVRGstcdTTKDNfjNfqZfC36P9aBV75s0n1TksAHgUxkz7V+zxplT/u24rZuopcmTF9iVPhdUSxFK9OHzi/oi18Z4QPRr8n9fMuevlaf//g0CVA5rs7n2VSmBnAGlSQ+nr3AFQR7Dpf+GIr9ffZObwaUcA5nnVqXIH9A/WUKnpzHIK9nOeCQ8RnWNMcLgiRDP1m/QDuB0c4VqNkDjBjU8bKk26NRuOsZGZ9GZxhHxQ1IZGOS4IC/tzu65lTKlFRM5FfQTbUxGFPOn3UGA544iSNGBU7kgPzlzv/U1tVQ0AmakURpQzpDAW77nF2csw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5d290df5-dc1a-42aa-4fe1-08d8437d5a09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvo6V4gv9lgJUXj/EWp3fa0OPlSOJ63SWLdBPpEQgMSEBW+zBeMFqzjPOrx5nG9olMd+47XZ+V4YZHVZgHOdU5L0/LLqqFw4/UAL3E8VjyZIqGveD7Qd4bNFbR8iQJdsd07HkMzbzwDtMRrWFWVvg9Ma9DEhpJ3m1O5Z+2f280h0H8RxGc3XqBmrNjGJGqqSzfEwQZu30PLq2COENXvWPNzbwIil9woJ0NAmSZ9shUbAvuNT2JXSj7Y0zJZ0bU27s6xUVhJhcsS7Q4PvfKd6rh6XJfrQy5lttVenInrrKHez+i+I4ACl+u6GicvFYQsKuAJfGrwMxsuOPxI28GA89GYi1T/eXxSntiKY9ekrzE51dmOfzrLyHBb5CTmw4IQUbkjfbNfQwG6fARjHSA4608cIJR4HG14vXQYIKOZuble1QSdRAaEPF6bgnx/iXR1p
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(82740400003)(16526019)(83380400001)(4326008)(8676002)(478600001)(6916009)(5660300002)(54906003)(2906002)(186003)(336012)(956004)(4744005)(44832011)(2616005)(26005)(316002)(6486002)(82310400002)(36906005)(356005)(7696005)(6666004)(36756003)(81166007)(86362001)(47076004)(70586007)(8936002)(70206006)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 13:48:54.6051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fef8f87-7aab-40a8-5fe2-08d8437d72b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5661
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

This patch serie is adding Neoverse N1 processor identification and
enabling the processor errata 1165522 for Neoverse N1 processors.

Bertrand Marquis (2):
  arm: Add Neoverse N1 processor identifation
  xen/arm: Enable CPU Errata 1165522 for Neoverse

 xen/arch/arm/cpuerrata.c        | 8 +++++++-
 xen/include/asm-arm/processor.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.17.1



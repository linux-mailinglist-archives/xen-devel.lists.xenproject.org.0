Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF24EBDBF
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296117.504021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUlF-0008Ma-NC; Wed, 30 Mar 2022 09:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296117.504021; Wed, 30 Mar 2022 09:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUlF-0008Jz-KD; Wed, 30 Mar 2022 09:37:05 +0000
Received: by outflank-mailman (input) for mailman id 296117;
 Wed, 30 Mar 2022 09:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u124=UJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZUlE-0008Jt-B2
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:37:04 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3c5951e-b00c-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 11:37:02 +0200 (CEST)
Received: from AM6P192CA0054.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::31)
 by PR3PR08MB5707.eurprd08.prod.outlook.com (2603:10a6:102:8b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 09:36:53 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::ce) by AM6P192CA0054.outlook.office365.com
 (2603:10a6:209:82::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:36:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:36:53 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Wed, 30 Mar 2022 09:36:52 +0000
Received: from 57f9715aa7db.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F808D32E-6B8C-45A9-8F65-BFD7604A4058.1; 
 Wed, 30 Mar 2022 09:36:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57f9715aa7db.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Mar 2022 09:36:44 +0000
Received: from DB7PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:10:36::24)
 by VI1PR0801MB1872.eurprd08.prod.outlook.com (2603:10a6:800:86::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Wed, 30 Mar
 2022 09:36:41 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::74) by DB7PR05CA0011.outlook.office365.com
 (2603:10a6:10:36::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23 via Frontend
 Transport; Wed, 30 Mar 2022 09:36:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:36:41 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Wed, 30 Mar
 2022 09:36:43 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Wed, 30
 Mar 2022 09:36:38 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 30 Mar 2022 09:36:38 +0000
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
X-Inumbo-ID: f3c5951e-b00c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPjXwM6GeF4ktNtts2yB4XQmLeHHI2pEJS10Py2OAn4=;
 b=hD7tzKL/VZmqgLW9h3rJ0gLoFamat0qXyz4vtv7S8hGu0yF5pOmT2432xaZMQj6JpB2FxfCtr8SRboKBHsmmbEi1I6LGoRdL250zT6byY1SrxpibmSAqdFd3NVDggbh11Ul7RA+3t2wJ5GpIDC0jUzkNo8fuDinuL4BGSCbLv5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b56d90cfa43171e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkpr9FskLDfUqYDDAYfR3tAu9e/gibjC3F3r+yuAY01lWnIv4MGS2QvWpfgowXEVi8whXyDYhS3nxarkWsGt/6djZ1XA1ahdp1L414P968bF6DiYojxs6k+TIZwSZJamW+v2aabFxGbmkXEwXwhuhWHsLhO/M+8ZEITjdFwZxy/lmgOqX+XyctGnYIn6D6HTB3TeJ608JzXwHO0J+n152zOjyOPz2GXu9D6145n+A/UIfEWmEXLF6G8GTR4d6lLrstzfeid+kyl2GlkS0MlPh9NCXUgGFb7enMXdBoPDc/8EzaZHFbYYkHPrSxDJu8GK5ljOfaGIuLo+VCG8/9Zugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPjXwM6GeF4ktNtts2yB4XQmLeHHI2pEJS10Py2OAn4=;
 b=e6WAQN5BcfrKmJ1UNP99ZFnXVh6ZBaRY0R6nnDVdhnHQ0J2scZx655rAC04mzquP9CvZSbaz3fIT0zI7mJbvjMK2FpUx/qiT03FZAOdQUoK3k8SYRqWxh4dMLt9KiqTpJsAdUokhBW7UWw0Nw1vHD4piZk4oDy3kBsBwbX5rietmV/fZgvIc9H8pnEl2DNaZzsYxjK9zSac+oBOAnDBOZmHo0aq/EIzavwFUFYJ2hSNEFW9ppm8z4lz6P+LEZAerCDI7g1EO+fu8EkoXMAwhNOCotj2c7iee37pbxzvduk+rcOlm4NPUqdERS+hwGnLncte87BiCr4WX0/rQlLFW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPjXwM6GeF4ktNtts2yB4XQmLeHHI2pEJS10Py2OAn4=;
 b=hD7tzKL/VZmqgLW9h3rJ0gLoFamat0qXyz4vtv7S8hGu0yF5pOmT2432xaZMQj6JpB2FxfCtr8SRboKBHsmmbEi1I6LGoRdL250zT6byY1SrxpibmSAqdFd3NVDggbh11Ul7RA+3t2wJ5GpIDC0jUzkNo8fuDinuL4BGSCbLv5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/5] populate/unpopulate memory when domain on static
Date: Wed, 30 Mar 2022 17:36:12 +0800
Message-ID: <20220330093617.3870589-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: a61bb94d-58e2-4610-b20f-08da1230d2d5
X-MS-TrafficTypeDiagnostic:
	VI1PR0801MB1872:EE_|AM5EUR03FT035:EE_|PR3PR08MB5707:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB57077662A817DFB42F63E1FBF71F9@PR3PR08MB5707.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iKBix6pQFqtXZnXba75vd6GfFrPN1lyrqEu1ZXZyvMaJAfecvgBcWxGEqybLmyGNFKrPIK81nZLrKLE65fnLNsbj36xGawiGpn/RiBlvqSIJZtPoJU5rr8ccm6mzKOXm7K6vwep0pC/A/zmU4QktvZLW2dc/U3tQBG8BZRYnjj6SjmgUv2Zd0bUnN+yEkG36tGYA1R1/vX4QkMwrTqWYuecnaaTZNdejDjdsnbeFd72/EH85aj+epeW+ndc4V7U/pBs+C5qwOTF5/g+HAPqGcRY8EaVCYLlFSMaA6BCRkun52IsVjQifT9U3d3cpfde4sG/dEIJf+PBpDCLV9GmyJOw53bcQqccW9sQbb4g+8nFegOTh2jnUWNpJdldF23ZUon6zavwOx13uErxS6GLSlVl8JsCxhhS6yMForVj/RDAdmmyRBRvbOKQsrwHUl8dHLi1TEW6b5ADrBs2RlHUTP1fKrmdiQqRtzaUA64QoJu7udiU2SdhYo7ZdscTbt9f2Sytx7HSTfiiNWW4Q2MOb4e6gXYEK/jGJ1TC0jXVVAiiYOVVe9qy6dI1ibJ3cl859PpIbATomlA6ze8mLuIF6+ffhEdH72j6KbHtwh+GVp4lvq/g9HZEvDqFleIiy+wCNmbDrRPbjXE0rN6Ykq7Jdrqx+hvVz2VAmcXOUdViUHWPwMZExOrLJ/fGVBWFMvm8LLbxcyWBWooRJf5M9QRGGM2RqltSLX+Xln88iNmaq3iw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(83380400001)(6666004)(186003)(4326008)(8676002)(54906003)(336012)(26005)(40460700003)(6916009)(82310400004)(1076003)(2616005)(86362001)(426003)(70586007)(5660300002)(70206006)(47076005)(316002)(7696005)(8936002)(36860700001)(508600001)(2906002)(356005)(81166007)(36756003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1872
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8f9f316-1d36-4ecc-67b9-08da1230cbc1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/uLVXwPnvxpdNWVwmp2UWWzg8sD0Rydec7Z/ozYRuC1v1L5AxpbymCzSlelpoTKX5oh7USteaWpXEIyo8r2SaVocvhgRiuXTtH+B9Yd5BifGPuhkUeSFspsZ1CZGJibnsRrtOf9ziBb90FbTNA6srFXcZGMxGvbqmvVuR52WL16/OS2Wd7v6fkj8ii1nA+LdOO9NZCrZ0xJPBvH6WiA6qcP2zZPMzPcbi7DIxkJ+RmvxqGMmxPPOe2+Ag9IYz4DoBQA6NRYmefchksEt7CB6UndJshOWIavxUnN2eD1PIDU2RC2HTZb3siff34RY/0AvBpaOptoOCofErwhGTu2GxpZf8hrGOEuxLHfqIfXu0pMXeRjIw+oTqeMP+oEl8PU+KCukJjJq7P5KQGAiQLV3lA40q1ccgNOfvr0vGcm1q7mgdaeql+mOIA+L6prx1KsaXyptOv8W8QjfYSsNuoHEq1nv1SWQOWOVBnWegKQgB+TL1a8u+HDFzM8M81wnndaJU9R9a3nbr4McSQHWYfAKw3IXoOG2jSCU1i1o5uBq4Ta44WfTvKwzZehAM7xwrVQrZR3MsfKdEatwxzD1ydL0iTNAsH64VWi8nXvtmEJQZyM4IDOH0yCi490cOdi6dR4RNcsFHYU7pxbAiVPXIjFcecRGo/1R+GuNFKbiekO2dxbxPrxpypzt4MoSlTG+KeEWZtplXywynFyWKLlzAATTnA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6666004)(1076003)(186003)(2616005)(336012)(8936002)(316002)(86362001)(82310400004)(508600001)(54906003)(6916009)(7696005)(81166007)(26005)(426003)(2906002)(40460700003)(36860700001)(36756003)(47076005)(83380400001)(5660300002)(70206006)(70586007)(8676002)(4326008)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:36:53.0515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a61bb94d-58e2-4610-b20f-08da1230d2d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5707

Today when a domain unpopulates the memory on runtime, they will always
hand the memory over to the heap allocator. And it will be a problem if domain
on static allocation.Since guest RAM for domain on static allocation is
static memory, which is pre-reserved through domain congifuration, it shall
never go back to heap.

This patch serie intends to fix this issue, by keeping page allocated and
storing it in page list when unpopulating memory, and retrieving page from page
list when populating memory.

Penny Zheng (5):
  xen/arm: field "flags" to cover all internal CDF_XXX
  xen/arm: introduce CDF_staticmem
  xen/arm: unpopulate memory when domain on static allocation
  xen/arm: retrieve reserved pages on populate_physmap
  xen/arm: no need to store pages in resv_page_list when domain is
    directly mapped

 xen/arch/arm/domain.c             |  3 ++-
 xen/arch/arm/domain_build.c       |  5 +++-
 xen/arch/arm/include/asm/domain.h |  7 +++--
 xen/common/domain.c               |  4 +++
 xen/common/memory.c               | 45 ++++++++++++++++++++++++++++++-
 xen/include/xen/domain.h          |  2 ++
 xen/include/xen/sched.h           |  6 +++++
 7 files changed, 67 insertions(+), 5 deletions(-)

-- 
2.25.1



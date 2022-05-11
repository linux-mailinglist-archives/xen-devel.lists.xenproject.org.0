Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF1522926
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326079.548956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRr-000730-WD; Wed, 11 May 2022 01:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326079.548956; Wed, 11 May 2022 01:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRr-0006yZ-LZ; Wed, 11 May 2022 01:47:31 +0000
Received: by outflank-mailman (input) for mailman id 326079;
 Wed, 11 May 2022 01:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRp-0004GM-EM
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe05::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fdcd618-d0cc-11ec-a406-831a346695d4;
 Wed, 11 May 2022 03:47:27 +0200 (CEST)
Received: from DB6PR07CA0092.eurprd07.prod.outlook.com (2603:10a6:6:2b::30) by
 VE1PR08MB5789.eurprd08.prod.outlook.com (2603:10a6:800:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 01:47:26 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::2f) by DB6PR07CA0092.outlook.office365.com
 (2603:10a6:6:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 01:47:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:25 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Wed, 11 May 2022 01:47:25 +0000
Received: from 1f39ac0c3d01.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 79AF10E0-9FCA-40AD-8ABD-7DE9D9EA84FD.1; 
 Wed, 11 May 2022 01:47:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f39ac0c3d01.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:47:19 +0000
Received: from AS9PR06CA0370.eurprd06.prod.outlook.com (2603:10a6:20b:460::15)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 01:47:17 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::ce) by AS9PR06CA0370.outlook.office365.com
 (2603:10a6:20b:460::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Wed, 11 May 2022 01:47:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:17 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:47:22 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Wed, 11
 May 2022 01:47:15 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:47:19 +0000
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
X-Inumbo-ID: 4fdcd618-d0cc-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HM2OipmOnCOjWgMMQgGYgpmgHNlejHWELKxbOPQIrqsFPytkU8/K4Aw2LWUhF619CDMYTqRBQ2kVzDoDRzPmyJ8Z1uV684MWN0RxJuvvP4tboLL7bJqttyogYhqA3jyZNPA/RrXaiF+Mm8a3FCE1uibtkk6C62n8W+TUAnskJIvLcqdUX5KQesssMNV4aD/CLAk2TDmZA3EyLS4vIKkcnThjv1Q7kIv21/CGQoHaS0R1LAG+ilgdwCjz1no7aRyh+GPR7+I5fzwvaYn6s9DLrQbgh+tPIO8J2xwdFUOixurtvKsAzzzYPrrA6MeoGLA3LkmodaTn3HCACGnj6F1ycQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7OVqHhwVjBWoKRE8rvvrSizWLkRQ9oIBYHDB2p5Tfw=;
 b=Xcr6ihUznxNw4Aw+EBSRCsED2Bj6f/x0IZQBsT3j4KKBecghVu8Hc+6aZWU1d2eHqqKYu4M5jYmXNydSBvBT5defpjZ6kz2BX9vobfRjwIX+M34q46zeiTmjRhu+QSXeENy9rdskhowLfBw0qblLQDA1Glrym50ApSlyK4oLc4HrZDfuB2u0QAG+pMYLWCM5h/LNQToxsFMhUNmt0eNttvGPhTO4hexMmXmqYeaZHeC9+2zJ1hL2kao6u0RPcJWGiaGa9hB2qsE+vwefe+4yTbGMTdZbXZWJ0dFLlvWOyK4xpe2TaC03okDfqsMrE8GN/hxTZj1IxFKZH3hJcaWY8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7OVqHhwVjBWoKRE8rvvrSizWLkRQ9oIBYHDB2p5Tfw=;
 b=fHoe/tNqJo+WMZN8TFvPu5fZTN5EddyAXd9ChsG+7cFqlhJDVkkSzUkjqZiIU9aLNZTWqFfIpLlH8BddXzzZv3Wm1D6yDaX+/F01RTzWEsh2UpaVcg5YxJi4wfjTFvO//LVlfWLvhjhfGzupIzi4DaYQvIktwJbawAQGcxL9VW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18ade7002c5dfb26
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITV/SBZAa0kO5Ir92jUDuHJ29d9psI8uS/+PEHB+r3GznLByAGhc6YpOOSccxVCl7DEQXautzRyREtMWffQKal8/tkWdQsDbRjx3YTA+mEjJED3h531kL6i/xOzs1/DM90BW3BAmeDgKrSCcjq9BgMOWaJXIOlW14yjXf9/22agTOYn+8HggT80L44/r3Nh4CbIOUu5Xvd8TEi53IGHAGT0AWd5cd6J+Cz3TUH0uK4B5O9V55+dtazyfdSM736aOhufwO34xbZXrswJnnsxXWr8FTFpg15bJAerqLAj19zGMWDFmf9gyXhBmKgE3BxnNZfgIDPoZX5BBgw85xz1cYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7OVqHhwVjBWoKRE8rvvrSizWLkRQ9oIBYHDB2p5Tfw=;
 b=NFgIgtxBZsjucXbcFGT+2AZ8sdIn8s64/10GhuOPziZMa9qoZJM5hpA0bV+9KLi+PII91QORwJeAiSLhHtBS9REy7BwIsly/kNujmqgO6mN1xfI3uOYaETm9oAVgqGReSBj6yjY6Sx3GsLoX+5qCg6xtZhb+CexEJoVqD0C/ngvgR93hgun/737ZFeA83BQVx76XCmsZz4ZAbbqF1IOEF1W18ufcIoNxiE4n7MKHJp46ajCvJ4ejMp/qr8gMID6NASus9xdt58KAzBzcR6yyil03QEI6c3PJOIo0BQSugED7LBD/QGSnGETlxS3e6KMWQZdEHfzMpx9xdVKkw4llVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7OVqHhwVjBWoKRE8rvvrSizWLkRQ9oIBYHDB2p5Tfw=;
 b=fHoe/tNqJo+WMZN8TFvPu5fZTN5EddyAXd9ChsG+7cFqlhJDVkkSzUkjqZiIU9aLNZTWqFfIpLlH8BddXzzZv3Wm1D6yDaX+/F01RTzWEsh2UpaVcg5YxJi4wfjTFvO//LVlfWLvhjhfGzupIzi4DaYQvIktwJbawAQGcxL9VW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 9/9] xen/x86: use INFO level for node's without memory log message
Date: Wed, 11 May 2022 09:46:39 +0800
Message-ID: <20220511014639.197825-10-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 60aed4b5-6aab-4520-06ff-08da32f03312
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4024:EE_|DBAEUR03FT026:EE_|VE1PR08MB5789:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5789DE94DD8D7EE5B6E543FE9EC89@VE1PR08MB5789.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WjKq0H9vl9a1XgZI0TXbwApillIFwrzIinHvLkt6LCmyKhdEqMpg0y9bEfsRh25JSDOdtPvj0jNukvE1Ht2m/vhwSEmoLfx2sD9tYuyh1FBxSHJlb396smxaFLN4BEg2zi4PFim4LvMm6ugL3WUlb9vUa6C3oBv/zKjwndfXXaTbgAJQWv9l9/rUw0KRA3WbHhwP6/1yWdzlq+JXuhkF0f8xk0mDQEJANbb8C2qrVwpC6sIVW/j9MNLT7D5hWSlFuDKtZttOGdHiv/W3PLj9f0AFfA92E64BE6enBcXLyrKGOOZE+ckyvra8/4nP+baN7jR4YcNffqWdCBzuHMPgRcFcKoqtx8bUaXHdW7Sk6RCAPfzxQTrjCxWR5OU4hHvsos+oEk+uY4WNDsvkkPO01Estj3V6qyMuOnHR7tXiGYcsg8mZINlnxYux3yf4Hc8k7tVCn79W498PD+o77lZnJcoeaJVzQMYctg/oxN7NYCWmUhyWznwbzD0eOttoFdxwthFifYeLaocpLeYRq2s+V5Ho7Sc0jz7dTGfFzFqytvrSn+s5S1zH3iuIKhNDg5S6D20+/F2jeJu5qOJhch8wqqfn7TD+ApqbAoAj233t9APip1/zco/Rc6Wvhguty7Fc8+o0UhuaTOde8UXXhcEti+74yYtbmDCrZ3nY5EXudJkC7qMb3w7ov1q3RCD9UlattBf8rjk0sK5y5zPzaBRE2Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(508600001)(81166007)(40460700003)(8676002)(356005)(70586007)(86362001)(4326008)(70206006)(316002)(2616005)(26005)(54906003)(6916009)(5660300002)(6666004)(7696005)(426003)(15650500001)(186003)(2906002)(47076005)(336012)(83380400001)(1076003)(44832011)(82310400005)(36756003)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4024
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b135ac5-1ca6-43e6-5607-08da32f02e4e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YpvhhI6MGYAiRnuSma01PmyUj6hiSq93df6Vi9NdSj/z3WE33Tiu6MMFw5tVW8aUTpyhLX4mDH5grCUCaZ465gihZck50szHyspplFzABZbn0P2onV//MG/JllK0WS4/Y/4Cc0iXq5weGUuwhANH5NiB9Mw/sQGdOpjY+ekDkLZRTVlm8MbTeFonghhqG4TwRECkMY4kjS/atfhyouGW5U+IhXq+jqfD4+t2AHxh2+ZqP/2vi5fuZ1IIHssHuUjiK+1SsuZqGfA1z9AJw9g4ZTUhO6rTTGhkVLSlq4jSv6S+45s57aq6waPc9vPfU5EzIqF3iw05neMCFxvnG5lLZB4gXa5RP4VWY/7BPjJEX7tGUZFCYwzl+nmE2TRybh1UvLyRCLSEK3oNPDodjCMYFZDMad+cAVPKuGdU7KiexoEJG52+xpcHrmQrYs5G1ycq8m3XWrcbb6d8n3HzyTGTL0uglL1FQWm7ynemLqFqgCLdaC2oBYyf/hf9wllWpxhUOAs5+Ltw8WqpUHTwnQ7V3vmBASmhmPEsKTVf50xIzBurTDPWb0iCEbA/wa5WYroV9iCxrtZid2IZS73yYQ/3JuyTPgiuSvXN5juW3xPQD46XsLdeG9hkmQCF6sFXtMl0Pt8fhUdXUPxSFplWQeJzaxEUQaKvR5DbS4uBggpS/bYSBXLeI/aaR5h46lJzYZ1+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(15650500001)(1076003)(83380400001)(4326008)(6916009)(36860700001)(54906003)(336012)(316002)(426003)(186003)(8936002)(8676002)(6666004)(7696005)(36756003)(82310400005)(2906002)(81166007)(26005)(44832011)(70586007)(70206006)(2616005)(5660300002)(40460700003)(86362001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:25.6549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60aed4b5-6aab-4520-06ff-08da32f03312
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5789

In previous code, Xen was using KERN_WARNING for log message
when Xen found a node without memory. Xen will print this
warning message, and said that this may be an BIOS Bug or
mis-configured hardware. But actually, this warning is bogus,
because in an NUMA setting, nodes can only have processors,
and with 0 bytes memory. So it is unreasonable to warn about
BIOS or hardware corruption based on the detection of node
with 0 bytes memory.

So in this patch, we remove the warning messages, but just
keep an info message to info users that there is one or more
nodes with 0 bytes memory in the system.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v2 -> v3:
new commit.
---
 xen/arch/x86/srat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 53835ae3eb..acaebad2a2 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -549,8 +549,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 		uint64_t size = nodes[i].end - nodes[i].start;
 
 		if ( size == 0 )
-			printk(KERN_WARNING "SRAT: Node %u has no memory. "
-			       "BIOS Bug or mis-configured hardware?\n", i);
+			printk(KERN_INFO "SRAT: Node %u has no memory.\n", i);
 
 		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
 	}
-- 
2.25.1



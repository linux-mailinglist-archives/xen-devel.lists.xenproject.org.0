Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4F605736
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 08:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426168.674495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOqA-0004tB-KN; Thu, 20 Oct 2022 06:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426168.674495; Thu, 20 Oct 2022 06:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOqA-0004q8-Ed; Thu, 20 Oct 2022 06:15:38 +0000
Received: by outflank-mailman (input) for mailman id 426168;
 Thu, 20 Oct 2022 06:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=umfN=2V=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1olOq8-0002BJ-JW
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 06:15:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9be27929-503e-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 08:15:35 +0200 (CEST)
Received: from DB6PR0301CA0017.eurprd03.prod.outlook.com (2603:10a6:4:3e::27)
 by GV2PR08MB8294.eurprd08.prod.outlook.com (2603:10a6:150:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 20 Oct
 2022 06:15:31 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::c) by DB6PR0301CA0017.outlook.office365.com
 (2603:10a6:4:3e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 20 Oct 2022 06:15:30 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Thu, 20 Oct 2022 06:15:30 +0000
Received: from e59f6ae725df.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5079A3B4-1269-479B-8134-37C4D0C37CFE.1; 
 Thu, 20 Oct 2022 06:15:24 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e59f6ae725df.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 06:15:24 +0000
Received: from DB8PR06CA0053.eurprd06.prod.outlook.com (2603:10a6:10:120::27)
 by PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 06:15:15 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::62) by DB8PR06CA0053.outlook.office365.com
 (2603:10a6:10:120::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.26 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:14 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.32 via Frontend Transport; Thu, 20 Oct 2022 06:15:14 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 20 Oct
 2022 06:15:13 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:10 +0000
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
X-Inumbo-ID: 9be27929-503e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F86P+aXwKA5pAx/4g5fxD2k3+JQ+y8vSr2rZJFhHy+q909rD0UWfFGxs+WqDQHp6naD/CrDBPna+DfU3hwHILIvFd8NXiy8j/aXt7Rip6wn3lzcotKVsNO9ZkB3WWNkVyttF6h9lC/ZWnThsirHT4xkBTiUT86XRneHrC5uAnPIetE/44JaqlgnJ7eqg+56FFWo8nTR2Crg1B//JmTFe6YjrwtduMZ2dU26WIkPajHMWMDAHY6vz+Z01dgkWUaFxTe5EJYVkfI4y5Hajr35mpliW7eKmIr1VSrHBPlPpGFhY98Yp0g0PLTjaO/e+gonZa+juCNFQkCDUGLXB21Wh7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKlQzekOAy2bagSwndJhdrniq14Z6mxEvy636QOfYxI=;
 b=EouQ5+3tZFCePXMB37F50eisLfeuQzrZkeLGFai7NPi6vIkgzv2i8nhp1ahVIREdZ4vhcsv3F1248WMPE9gXBqQcWKSz8r9diHplB4Ps4cfhrYl5Voki5ETM7ynkzFxMG2wu87Oxus8xS9viy/RBmQ4VlTsZmxq6qG6UMIjjY6EqsQr4wpYmgAE6rHWKTjfp2Hg8sc/d+qe+Qpr08HH8ziMhc1M/xsAwaUjqoiOE9trxriUVPKUNMbM4i5/3ABEa4au4hUTD75Di9mPXNQKjBQc7lPMVsRAYdU5yF9hQA22lOpui9Hes4aWHhVC1ZIJdPJpjrCxJULhXP4bZ8nDMdQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKlQzekOAy2bagSwndJhdrniq14Z6mxEvy636QOfYxI=;
 b=B/aFMwQsvnR755a94r013Aoh7SsQtIW5U9BU43v5iElvaCi5bZhnRQkrP2EsJQGxfzBycWXZgNFs/vULlFCGwZztbDYzw0xbCZmrgMLv7SsUBKDjnPjxC+zsxozmOl+7+MG8avb7lJ8gYATyfugv8MANCRRZZFp/WZl+4mJHCnY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: daa77c44be242fcf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac6WMgSdYn3ArjqJQ+38eeMLWDcp8dwfvXTukB1xulfHo9Z2fskzp5bs97zke0/ge/tCI+FfUD1pM+ssllZEekAOmURMi9FU+R+6kh9l9sldZJxLeLkGjoF74AQgqpghBDNtTyC5788jgWPoYUXtDa4oUrX532orA+KUPTlgybYLsN/oGnAXH1WVLP/tDosspB1A9QRKfT/b69lFtrSsG6bI/Ttmf3CQC+bIwTM1MFJoCYrFWoiLZ/aFARn9SWFV533EsErJLoAqIgmmaeDv/qq/sQg8UYB9uyiYa+tTyLocdfuvmUv2nR1HRR8GBm77v8QwC63lvHNPhgpMSqWCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKlQzekOAy2bagSwndJhdrniq14Z6mxEvy636QOfYxI=;
 b=A4DIjfBUYPT76SBWDtZ1gOf9W0MRSmIyUqRj/9RDyU5hcwfZoW9aUwMVeXgstM/fx7hN82IYZS4RIA44Gp75p4qZKc2GK52HIiOxwLUkiU7jBuPC5cc2o8VkfadF9oVTui4t01/cLTbmi349c9EsXpRlWi2bJ1Dm4qPJhlQ64+pg5wciJ3wCsdzFvaJgzt7ojuEgj8zyhawvU/e0scgGn9jJqmhP0Eze7xk3FNH9MrPb0LYiaUuNIj2N8gCsDcaqaflngJi7NpQ/A/zSYtxxiqoZh3FDUGFIflyvybq3+mh0rtDuFDb43dsE2/Zh3sYvQ5pwb5HRnqBlqsWqKGcpaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKlQzekOAy2bagSwndJhdrniq14Z6mxEvy636QOfYxI=;
 b=B/aFMwQsvnR755a94r013Aoh7SsQtIW5U9BU43v5iElvaCi5bZhnRQkrP2EsJQGxfzBycWXZgNFs/vULlFCGwZztbDYzw0xbCZmrgMLv7SsUBKDjnPjxC+zsxozmOl+7+MG8avb7lJ8gYATyfugv8MANCRRZZFp/WZl+4mJHCnY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 6/6] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Thu, 20 Oct 2022 14:14:45 +0800
Message-ID: <20221020061445.288839-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020061445.288839-1-wei.chen@arm.com>
References: <20221020061445.288839-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT043:EE_|PR3PR08MB5836:EE_|DBAEUR03FT055:EE_|GV2PR08MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fa41ce-95d3-41b1-7639-08dab2627d97
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YWSwhB/g8a33ch7F4+tPT0ZFvK48E+Wi2RAj69ezdajYNP/1Mc5Y16xPvN5Bd5anvVj4DGeN5lWZepiv44OVel6FOLQigaGqZinQJTbs/tJ91LLTb4jShrvqUrhXjjLYwBi9hoz0TZBrrXaDol8Fq6a8RsEhRf5nMLsX0wGJwwdxuOFfRHsn+x2EGeTtLinGb1DsEOF0Jc3ZLQ6VMjlDBjzuua4d0kkUvIaaAlHkEwFqAD/Snv1hZ9/7fKsZfUQcMpcoRlD0RQ/xduQdOgQ1TQnOJ0MaC5jfsiLl5Y78jaGMAolt6Fvt+CbvnHBZ3JTrVCcHF5cX7borl47+QUJ23PGlANtJ8CWnhDurbbjDCI7xDS5NHIDb4yza9gAAJ9Ogz65qlCoAGVuANxPqqnDaQBpvBGOSjn8/8wId+3To/y6z3QU75Hvx2zodgQh2VNivsJkf/Tww8SOXURAj3DPHZFlDslArlkSx8oHMZ5qxmTZcWDSuVFyRMxbABluItk0OMMgkg9x3/pFSh+GPiV99HcmnrIBEo7OGflLm5fX+v1Ed5qSurP1q9joxLWt6g34XbErrezvR8OptqpQMY8GPyDrF3+4n1qs511SmK1hTo5AQrgXGo4bPVKorKL1XUQi9uyPrZ6sPkE8YklyJxjoxdhmvHLTKwCx0whmC7bD3q7haAO22GcEfNXMGmhgJqDJ029atZmJGNhhAD4gEK0mXVA/lEMcyhZrDJHQ1n3hApMbI755tBMNiv/sQzFYTFWXdisv27pdDJ5qJ0bbub0CPxJf9PqrQGq0tVFQv8761y6A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(186003)(2616005)(6666004)(1076003)(336012)(36860700001)(47076005)(426003)(7696005)(83380400001)(40460700003)(2906002)(40480700001)(5660300002)(26005)(44832011)(54906003)(316002)(478600001)(82310400005)(41300700001)(8936002)(8676002)(6916009)(70586007)(4326008)(70206006)(36756003)(86362001)(356005)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f20fbc68-9b4c-44b9-d0cc-08dab26273d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P4hH7y5oW8VsVrvJdtoCDddDsWTZaW+eSJM7tlFB1+KMplvEzrPTzJuAriBYKDIgQgn4CyV8+UZbZMv0WQkM6ew98QXGbhggR+EiDjicFVsv8jlIjWyrqpJ7IhEj1RUdNFlPpvzSnYBLy36CUeiCYi0oyVyfzaVrcgN1YpbruF9s2nyUa29yHKn0A0BKR8K+ex+F8oaFexj0lDUM1l8F+Ud4suK+FcMGSzyZZguwh/kvTOQVVCzq+/CfmlBNa5/0fYCwRQpGMScqv+9IlLWkwocrDfXyYT8FduMf85y1rBzpU3fFpZxOoWg7E16fQRJEfmNYQrX0RZUuPtXInOd2r269zE9oFxVgHpkV7Qq9EfKWHGNsTLw+++gm/YFgG1VhYG+1TMGlX4sZv4lh7DNWEPK/FqHf6jkMrTIUWbKfBX8rFU8LXM5zptOboKxlwa+zsDgtnPpl/ENZBq5GCMj2v40Jliu8VYZphL0TLTL3FlFgjKONB7HupEeWtn/MMVXCqF04UGsTixusocw8ZGcWaKAAuc9nT96bhtnBYEbwG8G2TzgzPWp0ibRUBTuNL1bC5kTPBBaDBehTlULx+/PnNOV1h72mljZoRkvU0x3iIhQvEyX0pQpqf7friyDE2rs2zIRWT7q+BKovFkPI56qZ/BZVGHAjLiRhz13ycc7dX4fAGrxF0bTX7wmXQNOikke6B1umEdJ61HOIh8e3dgrvD/sU3KSKhV+XEsEf8RfWIeKNDLlv7itCKzQ/APSAangp5rXm0yR2tFOJtIni51YLVO6O0gZ/dfGLzaaFd68HJBO/27DuW+/9Wa33Xf23KuMd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(8936002)(44832011)(41300700001)(2906002)(5660300002)(54906003)(4326008)(8676002)(36756003)(82740400003)(70206006)(86362001)(6666004)(36860700001)(6916009)(26005)(70586007)(7696005)(107886003)(316002)(2616005)(186003)(478600001)(83380400001)(40480700001)(82310400005)(426003)(1076003)(81166007)(336012)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 06:15:30.9807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fa41ce-95d3-41b1-7639-08dab2627d97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8294

Currently the maximum number of NUMA nodes is a hardcoded value.
This provides little flexibility unless changing the code.

Introduce a new Kconfig option to change the maximum number of
NUMA nodes conveniently. Also considering that not all
architectures support NUMA, this Kconfig option is only visible
on NUMA enabled architectures. Architectures not supporting NUMA
still use 1 for MAX_NUMNODES.

As NODES_SHIFT is currently unused, we're taking this
opportunity to remove it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v6 -> v7:
1. No change.
v5 -> v6:
1. No change.
v4 -> v5:
1. No change.
v3 -> v4:
1. Update the commit log to follow Jan's suggestion.
2. Add Ack-by.
v2 -> v3:
1. Fix indent.
2. Use 2-64 for node range.
v1 -> v2:
1. Add NODES_SHIFT remove message in commit log
2. Change NR_NUMA_NODES upper bound from 4095 to 255.
---
 xen/arch/Kconfig                | 11 +++++++++++
 xen/arch/x86/include/asm/numa.h |  2 --
 xen/include/xen/numa.h          | 11 ++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..7028f7b74f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 2 64
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes that the scheduler, memory allocation and
+	  other NUMA-aware components can handle.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 2ca3475271..7866afa408 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 04ecaf7769..71a5f837b3 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,15 @@
 
 #include <asm/numa.h>
 
-#ifndef NODES_SHIFT
-#define NODES_SHIFT     0
-#endif
-
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
-#define MAX_NUMNODES    (1 << NODES_SHIFT)
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES 1
+#endif
+
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C40453E044
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342301.567442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny448-0002Og-9p; Mon, 06 Jun 2022 04:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342301.567442; Mon, 06 Jun 2022 04:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny448-0002Iy-4l; Mon, 06 Jun 2022 04:10:08 +0000
Received: by outflank-mailman (input) for mailman id 342301;
 Mon, 06 Jun 2022 04:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny445-0000w0-Vn
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:10:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8acb4aea-e54e-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 06:10:04 +0200 (CEST)
Received: from AS9PR06CA0461.eurprd06.prod.outlook.com (2603:10a6:20b:49a::12)
 by DB9PR08MB6777.eurprd08.prod.outlook.com (2603:10a6:10:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:10:01 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::c3) by AS9PR06CA0461.outlook.office365.com
 (2603:10a6:20b:49a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Mon, 6 Jun 2022 04:10:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:10:00 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Mon, 06 Jun 2022 04:10:00 +0000
Received: from 3484997ec089.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C0F3D47B-AE65-4203-9233-9B3ADCB3A999.1; 
 Mon, 06 Jun 2022 04:09:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3484997ec089.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:54 +0000
Received: from AS9PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:20b:464::29)
 by AM8PR08MB5715.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 04:09:51 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::b3) by AS9PR06CA0076.outlook.office365.com
 (2603:10a6:20b:464::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.14 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:51 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:50 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:51 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:48 +0000
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
X-Inumbo-ID: 8acb4aea-e54e-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=McmPWhlSq6lWKHNeSOzWyidTNHMMj1MEIJ5WR5EbFdlldBAT6Qz+XQCZ8csMghcHLDqupPXGqrKPFEp6zLdZAlgtzpb/SmwOub/WZ5jyEhzfw5oAjLduEHnfURw4vi2LiCy2BTNL7AQIxXtKBCsTpi2j6nmuUBNIb0n6rolycxj4NWeuW1U1JPqFVnh1nUwWQuGwVyEK3jm7yLWOMltM+vCCFD91GCdNd1wZ9Intavtj0hpzRp2vrW9yznTpJYb1y30VCwwyNCoo+pMjHWENJiRmSJ+GbBkhjV3VFa9YKWDFfQ661c/7XXfkTvWkzMYAf9cibM820PtQGT52aRmNIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lmHKEnpMdOqTyUo5+1ssJ2WrW3qZKZlnI4Gu4KfwTE=;
 b=ZWFcK8So5MvYvkYjwAe8qnQFQPugyvUF8l5HXRerJoOVQgDcva4pSpVJlLEO2VJDy0Egf/sF3y+bY9jOXrm3JScE0jBF1cLeGG2ku+pTKJpwH6w/WDKcnCLyQE7NOLe3mSbXy0TU8iKNwJobSccnFzKA4DMXxeVZ19kxA3gRXDYQpWranuONJjKT4V36O4dvp8kN3YKpIolbwfpEd25wv1l5GYc24EXHiuq7tTgBG3pcO0yqnCSyJviJxG1oNHwXPS1Mf7cmgLSJzpmAUfRKo99iywn1Jr+PB+X7xvNnWVg6KL3izJ8Vmui70pJLYhoRc4wYi4nXJ3A+MBACL7/4/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lmHKEnpMdOqTyUo5+1ssJ2WrW3qZKZlnI4Gu4KfwTE=;
 b=pK8yxXSvzKbG+ckCOfnix8PSAfMVODEyKQ5MxFK/Qj89L6FwasfMb72//OQvyT3+RFxbOiFJU1CJnRsn+EJavLBuYCKgoHogM5A4+WfMUpYzE6ahUiWXPiTonyaPrawHbpiEes9pwakeobry56tFLUebicMfTCCRzNRrG6yyjKs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb62ea7806747b8e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xlco7QV7pMAHSwJ6nKlXvhaw2l1o5c1C0V82tcuoXQqqdJduZNiOtCqapSTU3zXSLjxVceq+n+7IwSSN3zEKaSIOZolj3Ufi78/lloQo4+Enia2kyzPVmVXucG65o8ojAQFpKxYybKL3lPuy5quwLl0J/q9X5Fo/xf+xb5PObjFPaAzXrcndBdfrdDMJzRyxuIhVxprNEEVp1Z6BLy7ZkMEWEDfqR910RA6lN6SSbn8LzuKvxbNcZ58U/n9ak7hJJbgHvgw5OpqP/vg1VLd2TFU1SDjriqYmNdO9+K9pD30foJdKY5N7G09qXFVNhFlLnawc75ozIX5kEjw7+Ki4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lmHKEnpMdOqTyUo5+1ssJ2WrW3qZKZlnI4Gu4KfwTE=;
 b=FE+qQz27ToaiHkJAj2DjUR7+cw5lBj9aJ7Vi/10hgpm+XSZ9MXHIEMP3dM+zFe/HTp+rAcDBTKwnwINgPOEefzvcGuJNe6d0d8j9KCxRcMG9epvYR2X9XJhhd8LgWsYZl3Munxd7yznw8VDYsFJYxQZz08gq+aYX1zpAMEDTNC7rjNz16elr+T1RZvO1aHxTOpZW6Kf7ahjyMkmpzJxYrGj2wilnghRrVddYv4o/Ubr1K9i5fHa9eSpnt+y/BFgS1UVAlDtva49lZYo7vOelwQKbdh4ZaXBw/4Nx4KhxeXV/s/CDW9xHXyaFTYoUQkOl3rgHiMY1hO58AubaRJT0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lmHKEnpMdOqTyUo5+1ssJ2WrW3qZKZlnI4Gu4KfwTE=;
 b=pK8yxXSvzKbG+ckCOfnix8PSAfMVODEyKQ5MxFK/Qj89L6FwasfMb72//OQvyT3+RFxbOiFJU1CJnRsn+EJavLBuYCKgoHogM5A4+WfMUpYzE6ahUiWXPiTonyaPrawHbpiEes9pwakeobry56tFLUebicMfTCCRzNRrG6yyjKs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v5 8/8] xen/x86: use INFO level for node's without memory log message
Date: Mon, 6 Jun 2022 12:09:16 +0800
Message-ID: <20220606040916.122184-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606040916.122184-1-wei.chen@arm.com>
References: <20220606040916.122184-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 66f69509-8db2-43bc-42e4-08da47726cdf
X-MS-TrafficTypeDiagnostic:
	AM8PR08MB5715:EE_|VE1EUR03FT022:EE_|DB9PR08MB6777:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB677761F767F027914980ED049EA29@DB9PR08MB6777.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FWC2x4tEu6SxTosykt9/VSzWl6pJ0mgCWsE0dDVTGSpeV9a5DGkmwJPG5KmrGTxAMNJf8o6MvIoXmBW22DgoHk8bJM5K5TyRGJyivWya1nl2XaI9VjDL8IgRIlS0H8gEQhhTu7Y2sgM+EXTNKPIo2z20F9H/7737Ogz2ePV7kBlt8tbPqmxpkuSPPt494hllcapVQc755hbHIsJE8G1W1+5WYKsPdgOccjxtZa5z/CxeYgChZxOI/iYT6gkMS/misRIPlXKN/eqzkv0X1ltlQZFsThA5QpKmUmVOpadSxTqXf+PjklOClQza1Xk28OuXylW3y5ezKpvuWgVv2426MzR7hwWshI3jakEMVcGVOBi1/rtJpBtkVymPeV8sweJJ/mHIImPvdC7q7h4rQ8Twb8/kL/LOwB860H6hEmXlfg1KtT/JmKVNTn+HpAVQ3K/MneZETVRAKe3TUcdom+ednHFsnQOecKxIetJDPzz4HCgEw2VpowCsFwzHgvJQC9s7ZnBcYBMIVdqNcrTQVo+gmwN9LcHu/NlusHVT9E0fOTfSyb1TvTq0HJ/xcJhYCNQGWFBmHJs7I7btVlxvIKmYJq/Kq09KMFMC1Cq5qeClOVnmgmbF+L9R9/EKUIxX5toVmlUMda+iuvYqSj/D9PT9klxa9iBFJUN9VamkZ8gzuNAK+WOhsMtXi/g9ANGQngwjgBxfWFHf6Cn9jzShLvNb1A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(4326008)(8676002)(356005)(316002)(15650500001)(86362001)(44832011)(5660300002)(40460700003)(2906002)(70206006)(70586007)(8936002)(81166007)(2616005)(26005)(426003)(47076005)(1076003)(336012)(186003)(508600001)(7696005)(6666004)(54906003)(82310400005)(83380400001)(36860700001)(6916009)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5715
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0979449-1c4f-4088-bfbd-08da4772672a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UkOAeq6FoH6NQtsCs2ZRmzyggNWShq1ZnUB8HbtvG36DzzwR0mTiL3IxCalFcaWXv/Bh612GGxBvpXNBz6728qh/9N57P/Dvp8j3zi7m7dfFgkkug5np5YffYIYnp2Zcg8n/C+QHIKkfhqhxm5caIzuDYRdf9hWG5pbC+6/IyxzAmOFUdbc6snyU+DL0f/qoYcLscTSUN6ldeqW1gNEwm7T+42M25FNgM8GrE5Q7137eVISZFlO7KcrNLd0zQlR/VjdfjBnff7xAEQn4neo11ukIM04Ba56ivsQzbzjhP1lRET0kbY3L4YLhmZrkFhkKUjsDssMwjoKhHwa8qhek8D32+PlctogM8VKij0GEiaWBy+n1ZrTlFeilfn3irgU7nQaemG+vANUcM07n6wE4CzLcqNqXb4+XPuuLpC6OvwbGVwxzgLzbUOS7dIZPQygb8E/ZdfcBL1ENw1uN0+XvUOUrfTJ9dTyyprig0ohBhCfdlsIyz87ntCy/vQAOIWUnQkR9j/OkvN+gh4EBue/OryG/dqwu16mvgPZ8+Mio+bi8FZ0uHZTuUMMzqv+3BjfilLdJGfbzCjn1oVzqsVTlvVxF+WWpbA7L1LRHclcj0vsnRpX1oBHgVaMGIcPj1vhfauM3yopY+lWIrlu1GUfGdA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(86362001)(8936002)(5660300002)(8676002)(4326008)(44832011)(6666004)(70586007)(70206006)(1076003)(7696005)(36860700001)(26005)(316002)(6916009)(54906003)(83380400001)(82310400005)(186003)(508600001)(2616005)(36756003)(81166007)(2906002)(336012)(47076005)(426003)(15650500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:10:00.3668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f69509-8db2-43bc-42e4-08da47726cdf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6777

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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Remove full stop and use lower-case for node.
2. Add Rb.
v2 -> v3:
new commit.
---
 xen/arch/x86/srat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index b145ccb847..c267d86c54 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -555,8 +555,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 		uint64_t size = nodes[i].end - nodes[i].start;
 
 		if ( size == 0 )
-			printk(KERN_WARNING "SRAT: Node %u has no memory. "
-			       "BIOS Bug or mis-configured hardware?\n", i);
+			printk(KERN_INFO "SRAT: node %u has no memory\n", i);
 
 		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
 	}
-- 
2.25.1



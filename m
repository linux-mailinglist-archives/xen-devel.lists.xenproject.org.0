Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C8853EC8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 23:34:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680153.1058061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1LM-0006oK-17; Tue, 13 Feb 2024 22:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680153.1058061; Tue, 13 Feb 2024 22:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1LL-0006lw-To; Tue, 13 Feb 2024 22:33:35 +0000
Received: by outflank-mailman (input) for mailman id 680153;
 Tue, 13 Feb 2024 22:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFBu=JW=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ra1LJ-0006lq-Ry
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 22:33:33 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea1af306-cabf-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 23:33:32 +0100 (CET)
Received: from BYAPR21CA0022.namprd21.prod.outlook.com (2603:10b6:a03:114::32)
 by SJ2PR12MB7919.namprd12.prod.outlook.com (2603:10b6:a03:4cc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.17; Tue, 13 Feb
 2024 22:33:29 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::7e) by BYAPR21CA0022.outlook.office365.com
 (2603:10b6:a03:114::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.9 via Frontend
 Transport; Tue, 13 Feb 2024 22:33:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 22:33:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 16:33:27 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 16:33:27 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 16:33:26 -0600
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
X-Inumbo-ID: ea1af306-cabf-11ee-8a4d-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSCe+JYEPgiprKCi3bFbNmeUzlMCwtW6FRSBzVVa1+f+q5/0+byzSyb4KW6obrZyY1v9BMkksFdwYnX8eGKf9+v+S14z1tHFQn2Zm1NN0udYSxJon38wBFtwMvQ9uPnI1IEoAJvl8jmQtW28RRuwvm10VFrSZI4JuCfP68MQyiEz2XvMTIUPwTE6EwsVAoUJBdjHgbyvb6pRdXChaFX9hZL+amkW+nZDprZKgc+Bw8WLRIcsvoXda/PSl/7EHpAETCRwhBSYLzRWZyo00690r0AM6RtvPdHA7PAYAH9TGLECz/ybPCyFgFM92zGcXK3Pcr4QhTn8FpBpxzx0mTzbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2EGIVFayJXte1/ifsz9IeqstFIZA97IZnNrIWiSUO8=;
 b=ffYN7oUEP/2JMO3/D4SKVIm8zGhQDCwVRP0hlCubxgkQsBrohtrcy9QVaa8eZ095EjJIMiBEVlyPw45j9QSBtvqpD67A8Sv2Gi1oezUHKk8D3QU+gjiO1Jq3lFC4wBhJtXmLOgCY1t1WCA5BEc4BkOqhhvWYzVNc3hxgW0Ka68VOu4dZYJou/MFWWXq31XsYO6BITbdqyeo4RtJjwn3Mm3Dt1lGFJ6S9ofaYtJiAl5Hd+1ER4FVdEFDPwXvuiBhr97R/HsdYh1/ihIEJK5SNZL8T66cEqBW2e9KJtynl15uksO2R3ZCknvfWIhKJfj6kyFE1MhZwTXbGBi+4AM29Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2EGIVFayJXte1/ifsz9IeqstFIZA97IZnNrIWiSUO8=;
 b=0zifFnoNG5qvh6Ho1qg6ASJAAoQvuGWWNbtHsr9810xy1wSREV/kJBmNQDq7jxbld0ReDaUoQMTbc6+yDfb4PlSgChXG3rvRkqkreZo0pP3hLgSI7KnVOglvH8P80AuW7Uw/wLBZXrrDPkVKUILaoxzhkVP3Dt3EhndHilTZIug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 13 Feb 2024 14:33:25 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <george.dunlap@citrix.com>, <julien@xen.org>,
	<bertrannd.marquis@arm.com>, <roger.pau@citrix.com>,
	<roberto.bagnara@bugseng.com>, <federico.serafini@bugseng.com>
Subject: [PATCH v2] docs/misra/rules.rst update
Message-ID: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|SJ2PR12MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 00aaf083-51bb-4d79-af24-08dc2ce3ccd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZiEO4KT4b13Zdt0wO0WEfb7hdyagyVn3c89Yuy3aspG892wVYyExd4/BjnCQ4rfS2HHaGCHgCvuQ2K7hTT/hW0h4SiUtqGdQ0nL6EykzNt4ciC97LORo1PxM6aCzHs6Kh/tqhHDPRgt3V++VxdCoXi5PVXmiXG+Ls9QjWlidm51aSVaXzhItIK6omBALnleMv0WlNj2paRUPBrNsjr/wMfoYOautU2z6S2C2Ad/JBX+ADTdmGSwm9sYvIlOZBceeeVbna00sEucI2K1neI26HGiuU4lk8hXp5gUoT4myKW9AnwuUr4nrV6rnWXkkl87fegXGZUkjY23cpOIZCSlgbmdwcCjE87tzNsRsNOFGxJP+IEoAfwjZuY8T+LBQiKuikUxk2ALY/s9AOrnkNh/x06kJKE8hQQHMvfDjUb8XeKfVhJU1ND5QTGvP74pXj76NE8uVdcjTsx0eG6k8DHpr8xhZmqrEkfmV1+EsB7OFemBMeqRVVVDVaG1v1y6uFX3qLtVsvgXiwOfgOl8IJtmUCnAFRaYcZOUcvb6KIr03OV0CRrHcux5Zm1WBT+EOpQp9WQHKaeZFsEQVZyU2FAwFNqr8S4kV+Xa/X22l68rPPIA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(7916004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799012)(46966006)(36840700001)(40470700004)(4326008)(8936002)(44832011)(8676002)(15650500001)(5660300002)(33716001)(336012)(426003)(83380400001)(81166007)(558084003)(26005)(356005)(70206006)(86362001)(82740400003)(6916009)(70586007)(316002)(54906003)(9686003)(2906002)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:33:28.3894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00aaf083-51bb-4d79-af24-08dc2ce3ccd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7919

Hi all,

Update docs/misra/rules.rst to reflect the MISRA C rules accepted in the
last couple of months.

Cheers,

Stefano


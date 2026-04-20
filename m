Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEiuBmua5mk+ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E84A4340AB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287549.1568030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9x-00060V-Ft; Mon, 20 Apr 2026 21:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287549.1568030; Mon, 20 Apr 2026 21:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9w-0005bJ-BV; Mon, 20 Apr 2026 21:28:00 +0000
Received: by outflank-mailman (input) for mailman id 1287549;
 Mon, 20 Apr 2026 21:27:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9r-00056Q-Nv
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9r-00CBiW-4R
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a14-e002-0a2a0a5209dd-0a2a4507df78-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:55 +0200
Received: from [40.107.201.88]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a59-229c-0a2a45070019-286bc958be9a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:54 +0200
Received: from CH2PR12CA0027.namprd12.prod.outlook.com (2603:10b6:610:57::37)
 by CO6PR08MB7723.namprd08.prod.outlook.com (2603:10b6:303:142::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:46 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::c3) by CH2PR12CA0027.outlook.office365.com
 (2603:10b6:610:57::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:46 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:45 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9D6tqLz1wdP; 
 Mon, 20 Apr 2026 14:27:44 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00105.outbound.protection.outlook.com [40.93.4.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:44 -0700 (PDT)
Received: from CH0PR03CA0400.namprd03.prod.outlook.com (2603:10b6:610:11b::20)
 by CO1PR08MB7658.namprd08.prod.outlook.com (2603:10b6:303:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:39 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::a7) by CH0PR03CA0400.outlook.office365.com
 (2603:10b6:610:11b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:39 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:38 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:36 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H7SV03f08kK2XzJkhid5Ds+IvVYoCGRbLDSYxI2H1k6DuzwNf1HYz/7GaNgDNoKNaDvwjK9i7MyFB34dLVEgUg+og9CRDHCSp1/KcS3x1NehZFU7B2idYLMEOjOZejbIMw5EARM5VAXp/aIDdwoJjKBrY0YWN7c09rtSZp8bUMmF9loaHBTGLMhXXH1Q76oLkLRWATlFtFHPAeM1CA4cWVMXc6MjAhVweMbsKpwaQWUAMcvfnZQAmamazlTj0lMZy0r0ZqL8SK/K6FMdlVv8QPDN+ssJ4h62g/8Uyh3/s1MMztthgCfyfxjZ+FgMrl6j21KysYNTH+xoUv6WqkDlLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyF2sek1Gl4M2bt+N59A0D5zPi4VE0N2VV6Dzby1vi0=;
 b=ZR7HK7/5eYB9cpyRO35Pv16yPIwIPuowG7fFbAtBlvbS9kNfBzp4jH0cY7scBw7P9Ib1YXKjoSuNOdxxH51CbyC+5bngyETgi+D9G8sJjP34Rnt3ZVmWbR5gvobDhvc8YjmhPF53gRgMtZnsrxqp25WZxbzV4KPFtIkDR0FM2xJlR+d/LV9Y7VLepz2nKigfxqzqqzjWxbLznJB4kXqNVfPyHvIGFOkZrBJ3jDakVeK9oRHIUCMTOlKZtFxnP1rPLp6dFoBNr02XJX4Ut5PzVnc0jGSYVPgqJJUjom4DvXD2wyq/Ydesk/GKOK3g0knGM4eLZ0qqmGqletmtRsy1sg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.5) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyF2sek1Gl4M2bt+N59A0D5zPi4VE0N2VV6Dzby1vi0=;
 b=fEXngpMFWyvPxa40MORkZ32aWI8IRzG1tFllkvDdBAVYLaJMmwFrXNsVO6NbSrz1O/XuvsMbFZ5DssD7uvxB6h/IfTCbz1RmIdg2vaW/QSJZUpfO1A3DeuNuYTlDbhbvdbgLwUoam2hJ3rcla/5javpVSMLkTG1q1DOF/SGn+YI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.5)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.5 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.5; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcyWoIfWdeUHJCx8PWiHh1LhwZLdR7qLVYhpiuJTcMZlVHDGonmDd4UUBrFaao0h5xnrRHy945zMDCkbSHO+RtB+xYdOWlMucT2oPjwS+Xefrj2UKIjuX7c3aCKPLqGGOYFQNwelIv7qzCdiKljv1MZA8+aykFNGyhpyBD2IPoMVzOyAHm+a4E5p+Voskjnz8vSxUCsPOdyXwMDTOZk7wD5eYhzV41EOaR9NTf2pedKxe/GLzMzvsJPJT1iO/mVGGOF1meKatlO6uPyv9S0U8BTLlza6s9TQxMRP1cHpQCtSVCUJqnSO+fzzSWSWKiiLAMvdbRfaCuOuZZ/3pRWiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyF2sek1Gl4M2bt+N59A0D5zPi4VE0N2VV6Dzby1vi0=;
 b=QIhG8FtQaXtxqV4rIqTnL5JlJgMAIqSM/0MixCPKXMtq19o1jqiM0ALTOKKpkOY+u2BwvmeOug9bYzl2G5M91NUaIm+h2DxSeDgefoeA3yhsBkRlBqrY4MQfkCQHHVHgTso7HWsB2z+unMkQXK5JmKW4p3yimSDQS8DAxIJtHNisWZlghDXvFIpZ5/5QyziWAeuMh7WVncF00x/HKUF0Pa/ndOI98BGIzMaZqJnfIyZ+JYZ05ZP92vR2T3W6POa3C8ZKQKNNiNFEwUlYU+BwQLE/9E6aNU77izlrzylJZNz6NWqMZnSwTjed4zxNP11cksRoNOi077M9+7Nk6YqImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyF2sek1Gl4M2bt+N59A0D5zPi4VE0N2VV6Dzby1vi0=;
 b=fEXngpMFWyvPxa40MORkZ32aWI8IRzG1tFllkvDdBAVYLaJMmwFrXNsVO6NbSrz1O/XuvsMbFZ5DssD7uvxB6h/IfTCbz1RmIdg2vaW/QSJZUpfO1A3DeuNuYTlDbhbvdbgLwUoam2hJ3rcla/5javpVSMLkTG1q1DOF/SGn+YI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Sergej Proskurin
	<proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 25/43] arm/altp2m: Add altp2m index to arch_vcpu
Date: Mon, 20 Apr 2026 17:26:30 -0400
Message-ID: <20260420212648.208640-18-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
References: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es013.ebgroup.elektrobit.com (10.243.160.141) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	CH2PEPF0000009E:EE_|CO1PR08MB7658:EE_|CH1PEPF0000A349:EE_|CO6PR08MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2a061c-4f8f-4b3a-4890-08de9f23aa2a
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?CSNHU8JPJoFKIzEefW8GBjHlk5fHFH2lK0p7TMno0Kue/SRkP1It5zC/zMtw?=
 =?us-ascii?Q?yuyIYHyhrchSWvVZX780RwfsFFz3RoVqs7RhwSj6bvhIDirjL06YXSpae5Pe?=
 =?us-ascii?Q?bwa2xMz6j/pHcYbw2lIRrt0rSRXQBtKsXL3NfosGMUI1780LdBeYPMy6As7D?=
 =?us-ascii?Q?1RsH32nHnz0OwbWZyb02hUeQtfUaWGsh7XKnEkLuZ9vx4z4mtxa78n63rB2p?=
 =?us-ascii?Q?3mOoxPgLyX5hdu3gmMzajz6ASDdsOmFIDZ/JLzexsp1pxUVTy+kGTAxUahyh?=
 =?us-ascii?Q?UOK/b4ZY4/kvwa4XyFBP4EZd4UQ9UybSMv0yxsuJhqmIaBKvYql9F86oVRwG?=
 =?us-ascii?Q?SpEs0du9FldNvE+HnhQchk96/k7q/PwdXUOP8CxRbgDxRDHERrKJybZ1tdMC?=
 =?us-ascii?Q?UN75bdXup0XKsfKVkHg7+dl+z1tSE29ILIkqoQ/4ps9q4eRWxGRm625J9TrJ?=
 =?us-ascii?Q?AZ4sZkeL6BX07Nf9fSJUGxZeNh4F9eTFwtjBavBprfPFDisMn57wO40KaVQ9?=
 =?us-ascii?Q?VvCZyuWcw1MuBZyeZs9L+irykMzTRw8APM35TRNWKQ9bGXk5Ubt9Da5G14Hv?=
 =?us-ascii?Q?dyFtwaBkhEMpNsrwbur/clv6u1Aa20a7ijnWGygLVnow244vWMGIZrow8MTA?=
 =?us-ascii?Q?QyNpP4DzJ1bS7q+4k7TVmSP8aGWTv96xBBkXOnDgaidz4SfgLI1wLMUznipY?=
 =?us-ascii?Q?88Z/u6gMY179xzgnqQmJLT8Z8u9hO0AGNZNzbaCO/JPlBYJHeRIdAViyMjHj?=
 =?us-ascii?Q?G6H4nStnNqU/VOxcqF2xFCaaEP/uG0E+wyErrz4788wT4vqY2Z4JD8zHcUa4?=
 =?us-ascii?Q?tVBfasnQnzUR8fYmIaUgq4ehU1qErqk+gC/SO/mgaJBSaGWWMJVUGu3Jp0yC?=
 =?us-ascii?Q?NbqZ5OdIgSgAqwm/kXVgUXwKzur8myuHTof0sZL1ZnF35kaJuBPF0BHXILMX?=
 =?us-ascii?Q?mWz0HR3Ep8+gPfma5/n0zQxK4bLlelfI6pOkPCyUOr2cWPXDTcJxmevzsCbA?=
 =?us-ascii?Q?jcu3qj7BlKRM+cJhoTPvUEKhtB19F+m2kL82ePWDxRnejYOUuy4KWmn8Ls9O?=
 =?us-ascii?Q?JrCqtnE7YTS3t3KYWiwlPmL6ItyMjju90y2z+Pz5ZX68gCp7T2DX7mtkz/pZ?=
 =?us-ascii?Q?8AdnR97Hzq+WpIEb8OM5OrRPf1vk5st9LisjtL0RZ8XWySN7vI/FNKjBv9Zq?=
 =?us-ascii?Q?X0VlXszLoAx9q9Dq?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 FfqmWgE+G+nA/ROA3h1ZWZDby43IsCtWoRY9Cr2SmCHPfB+C8DLO/FvnY9TUye+kKPeSgZCk2qNNLDzXlr7Du0aIE2dQvnQIlP2XGBoNT0s4Ts/X7lP5cWkEpovZcA6FvV+O0mV7mvypqUmlq9BK8Q4J1WnBo55Uce+R9lOCKo7EfA320s0X/qjPS5ji7o94UjLb3u5BRCgelG65F2rt10cyMHwoUTIYkzk8hlSO5orPvqGYyUinWzP6PnAIgd2ROywRPSY9Q6Ur+zWPIF+ytcZfhuy5kS1rT3hGQl7YP+SMy7JZUd5G/LzEWedp6BbEgVkuiFlYS2DvwY4q6Ddn+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB7658
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.5];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.5];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d2e84f16-91e5-4509-db6b-08de9f23a613
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NQ41/W//Y40oYtRTOd2oCqFkQNcBg9bXlSxfnFOBIHWFHL4ikDlewMfzmdI9?=
 =?us-ascii?Q?HtCqDfyB+R09zi6Zmpyokz3T8mQVYvgPM0VwsTi5IE90Cq1mL0OvSlOcsd3M?=
 =?us-ascii?Q?xGQa9eYYzCg/ha3qyLlnNmrEnkYqcPJjWf5trnxXXFgKJ51Sk/qQi+4qH3Ll?=
 =?us-ascii?Q?x5y1Ly58ZCa/GnR4yfek1vXystw1svSA3i7K/biPjzQ5KxQ+PKvMUi6OO2gi?=
 =?us-ascii?Q?h5ijtTMyWg9/8IDuSI+hFImmvHNGi2aMKLWzAEeggz2x7HtSlQEoBb/7CEon?=
 =?us-ascii?Q?+oLmQOEhjtf1TuHXLltdd7ts6krrsoC7kG+lKY+0zR1Pxaeul7zhYiiQztv8?=
 =?us-ascii?Q?FdbzQ6Spigf4zJJBV81uQoc+2K6uLLHcI9jiTOgo3uI4Oi8LxOdtrjCVWZRA?=
 =?us-ascii?Q?C8V0dc0QqClvx+w47fLoaqyJlt02Cl9wxEAY/cBtCky//MS6MTp7WRm3in3w?=
 =?us-ascii?Q?yx2R5vYSFsi5kphLGVNnFrVMTMCcmysHXrQo/TVGQ3VKSsjudLqbCC0rED3L?=
 =?us-ascii?Q?6urFRs43LVhxgihahjCCIM/eyons5FDFMefdY49Wdp1xRGxShDxKPJZkWjQ2?=
 =?us-ascii?Q?xPmtBejn9kP0Hcl0nl7iq0gjyXlxDHUzZkDVTrB6SFoQ1tqNYnxqTUp+ZWe9?=
 =?us-ascii?Q?DJsdiCLNOQXL6r7aHajoO9Ez97cOsROg4iNpwqS0tbRr4brnLpF+CHkbsEnU?=
 =?us-ascii?Q?nW47AYRm/KMkRi2XAhEeU/HbIuO4+O+w7UucY6IMHv4fmTTG+ti+OlNBHflL?=
 =?us-ascii?Q?m3TR0p3XJ+u4mT3U3QvPG1U7C7j7Rd/golQU8vOYkm04T2fDCNrAraeeJCov?=
 =?us-ascii?Q?e58YBow3cqq1NbZDFv4+ivEqV2J310zOtlKpkBjyvod2NxMkn2ZZk6w908jp?=
 =?us-ascii?Q?YUynxEXuk0PUvHQ5vSnUcn12lAt+0xET9wMe2rLWILg87ZOdHe4v3oiFCiZE?=
 =?us-ascii?Q?O1NuntYzJrVf4/m74XlOfrY8A4FysRU1YhHC0eGLHBb7sPnS1kL3XExgDGyX?=
 =?us-ascii?Q?543E9rZsvParzZOoNUztYfrL6cCbfKA4GQtvIudWOMVyZO1q6e7K1fP7bhrG?=
 =?us-ascii?Q?jWpdSZZ61QFd7U4eKr0iFf5RGEAGXpeUNgu11lWf9mNq3SID0wSQP29AbMj8?=
 =?us-ascii?Q?xjVkoXI0YBp35UT/3Pg7WRMKWrNCtBM7Kv5XSFOo1omzDFyKVEaozqZYVa1b?=
 =?us-ascii?Q?4iq+hTAYDnc+24jz?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00105.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4IpVoK0al/vOwkHOwhCZkLWZ/jXLkKHws39PqJA9hoVYHQw/weZ+ZbjBR2Fd0mOWuzkjU1J8jLSiIuWrekHN5+lsCJ86OV0hH+8FEDfexDSORqkR1GY57gQsE93rc31wGJuIwM7EE6LGjWEFkOU8BWewTQq27o84zexQ68ZKDUVWTznKcK3OT6dnLwD84iizes3Uu5brwYJVsLpWvQIu/4yAT5D1CoNMY0UPUZAGvZlS8/WU9AE+Ljui+S1wg1Mqi5sQRs1wBh5yJP0kkK42su4iRbTe9T48db/VmPHkzQdwGWLGHDQIK33BPaLVVKrjYO2PrdK1Pv8BmJniXuztExbR+BZDD1j5gUZNoZywq01iZuWj1eQ/G5e6XuTJJPfaMBs79HRTJqxCaG6cahjiTI9VWZ5rVPWrFDksi1S7XuwTa7gBMTLu0xX1wCeDsZ31
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:45.7294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2a061c-4f8f-4b3a-4890-08de9f23aa2a
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR08MB7723
X-purgate-ID: tlsNG-ef75cf/1776720475-14C54C48-8F61B725/0/0
X-purgate-type: clean
X-purgate-size: 1874
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.295];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email,elektrobit.com:email,elektrobit.com:dkim,elektrobit.com:mid]
X-Rspamd-Queue-Id: 7E84A4340AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds ap2m_idx to the VCPU struct on ARM. This makes it possible
to track the current altp2m view being used by a VCPU.

This is commit 2/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v6: This patch was originally part of the "arm/p2m: Add
    HVMOP_altp2m_set_domain_state" patch from the v4/v5 patch series.
    It has been extracted into its own commit to make the patch series
    easier to follow. If it would be preferred, this commit can be squashed
    into another commit.

    Added support for the CONFIG_ALTP2M option.
---
 xen/arch/arm/include/asm/altp2m.h | 4 +---
 xen/arch/arm/include/asm/domain.h | 5 +++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index 5a217f48b103..bc695018e62c 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -26,9 +26,7 @@ static inline bool altp2m_supported(void)
 /* Alternate p2m VCPU */
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
-    /* Not implemented yet */
-    BUG();
-    return 0;
+    return v->arch.ap2m_idx;
 }
 
 #else /* CONFIG_ALTP2M */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 9e69d62086cd..4d497a21b648 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -249,6 +249,11 @@ struct arch_vcpu
     struct vtimer virt_timer;
     bool   vtimer_initialized;
 
+#if CONFIG_ALTP2M
+    /* Alternate p2m index */
+    uint16_t ap2m_idx;
+#endif
+
     /*
      * The full P2M may require some cleaning (e.g when emulation
      * set/way). As the action can take a long time, it requires
-- 
2.34.1



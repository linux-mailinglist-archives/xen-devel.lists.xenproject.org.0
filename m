Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULmsMMab5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA14342C9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287896.1568346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFY-00008S-I7; Mon, 20 Apr 2026 21:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287896.1568346; Mon, 20 Apr 2026 21:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFW-0008HT-Va; Mon, 20 Apr 2026 21:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1287896;
 Mon, 20 Apr 2026 21:33:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFP-00078e-Lh
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFP-00CDCY-0z
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b8e-2eae-0a2a0a5409dd-0a2a45028f2e-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:39 +0200
Received: from [52.101.56.122]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bb1-af86-0a2a45020019-3465387a7c3a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:38 +0200
Received: from CH2PR08CA0010.namprd08.prod.outlook.com (2603:10b6:610:5a::20)
 by SA6PR08MB10353.namprd08.prod.outlook.com (2603:10b6:806:43f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:24 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::81) by CH2PR08CA0010.outlook.office365.com
 (2603:10b6:610:5a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 20 Apr 2026 21:33:24 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:23 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHl1x9dz1wdY; 
 Mon, 20 Apr 2026 14:33:23 -0700 (PDT)
Received: from BYAPR08CU003.outbound.protection.outlook.com
 (mail-byapr08cu00307.outbound.protection.outlook.com [40.93.1.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:22 -0700 (PDT)
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by SA1PR08MB7598.namprd08.prod.outlook.com (2603:10b6:806:1f1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:19 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::df) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:19 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:18 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:15 +0200
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
 b=e5pl8CFxhyEnttaqqbdBaksO+59n84eXJFOcJ2K14XUKXQ80tZqbeD2/aNvIg9jUxYm0hFA6dzQyL8rZGBBCa5t3JM0AxIrJF8iZlHrJT/qFjGWz0Ka4J6iH8EgJO7Qb8Bj+9WSEkMWoOU62tcoELqklmSBvexuai+Ri8K1GpfCeFQFOeR/MwlNG+OHVyQYrD+vcYXof9oXeneEKmicF683HE+RKn6jnHJHPh2fPStpLKaw3ISESxk8NcuFfWbjm6T4rHAEtHhlXhSUwkBqizmasmiSp49+cuDClqF9PJGpkO/AiOEgitUxW+559qehYMWPlDYJllGGmTB8BQzMNvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWkI4CPcpixx7LyAi9ppzVzvWNQPx579rpoBHNN/nAY=;
 b=QyF4Il5xqfphJB2IvIjyB8VdlUmdVN0ATrKdVRWhqGOGUm7gnNxo6yqhjHa+5Bb4AauBHVRr7Xb6XP5sb18jMwlkpGfXGmhb5OsskU5xwC459q4H3egVVp6OF9+KtidPNSEUW2d0REmrvxD05wTow3I+pLWqIMFiSZxu5Lf9Ux0O0mQgmUrAeYAsE1gAvoffijqFh42+XcZ+ACnLBJvY3p0NPI47wZDj0ngrURT3I9v8YvKsIh7+cSIVEQC0GL/kV7HaB3UiLOWJOOa1f1Fy+sGUTVEI7OHCSIjcsE5Onr3gsFBxdaGhk0Hx20/w1HPzI05cna9FvE1nfbouI2sCmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.111) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWkI4CPcpixx7LyAi9ppzVzvWNQPx579rpoBHNN/nAY=;
 b=iOFFLmcN5ZETdLWHBYvcikPpE+vZegdOjSgCRBHrzKeP9Xo1rG/tHov8tKlk3t4a4goZdhGoCGIeTWQjOysQ3BTdUzympIbuHlEmcjtUX33DxLZnsboskUOwXHkepDKqQyO/ekNksYW65CNBhqCzPv0pD9LZW3+a8MgtRp930vc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.111)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.111 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.111; helo=BYAPR08CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFw9ApWJQVmmEn5nGlEwiWoapzkXpDukMqJIZG86B02c4p2NK4ofTdHr0fZl9vvYmBQDwq8klvzmfjhTOFvXAimld2zmFkgRPz7kt29VWCPonkNXXdqosBotzTpWJ7100wymB55c4zWK4TweUKakZkgbYu9DlW791WcH/qelbXxU7tgiB0Z/X2bSVoCLOw/uSY8maybw5KYBOLLAYUzdQRZofMZOO1E9UOtUppznW73BzaB7QrXTnVzGtseSbqSQsbrOt2Jiu/EHBV2q56BqY0D10HtY7M6TduxeTeUtmsKRNfM8wHjdX37NW4WalwNFCi/r0TiYCTe+SMjdj6YnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWkI4CPcpixx7LyAi9ppzVzvWNQPx579rpoBHNN/nAY=;
 b=qUmVN5yJQWYUjfW3CWRBqjYbAqaAvHtgzN/0blOpixZD76ttmNX0XvJLOZUJVz4J5oTZg4gXuH2bgm5Jz/3Yeu2WCPORekoni3KKsWlvvA4Yn3izK3zZ0RMMVjptS8kazale1Nz1cWh/PyS9vM7Zp7rTuBoQs+iVHNQo8S76nBZP61jxPzPE3+pMfbG7+fkWkcPAvFotaV71qKhk31yS68qosl8Xb1uEHMs/XkgKYGVASgebisyQxCX/SXyaAmFJEan1iDKHPAAE+iV8R2rrcEH6k7+CR/gSGLZfWoO+fqK6ohRQjWWAsWSt/WjbBoR6A/PAi4F+5h3OX77lZxd0Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWkI4CPcpixx7LyAi9ppzVzvWNQPx579rpoBHNN/nAY=;
 b=iOFFLmcN5ZETdLWHBYvcikPpE+vZegdOjSgCRBHrzKeP9Xo1rG/tHov8tKlk3t4a4goZdhGoCGIeTWQjOysQ3BTdUzympIbuHlEmcjtUX33DxLZnsboskUOwXHkepDKqQyO/ekNksYW65CNBhqCzPv0pD9LZW3+a8MgtRp930vc=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, Aqib Javaid <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 31/43] altp2m: Add altp2m_view_is_{valid,visible}
Date: Mon, 20 Apr 2026 17:31:54 -0400
Message-ID: <20260420213206.208750-32-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es012.ebgroup.elektrobit.com (10.243.160.140) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	SJ1PEPF000026C9:EE_|SA1PR08MB7598:EE_|CH2PEPF00000142:EE_|SA6PR08MB10353:EE_
X-MS-Office365-Filtering-Correlation-Id: d20c053e-eac1-4249-ad6b-08de9f2473bb
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?zaCyPvIEwdFBdQcTz98hcKaIT4COeiZIsW5zd15KaY/ZE/pNTq8WhfaTFmj+?=
 =?us-ascii?Q?QtQbRGIODVx25JMHiZX+jfGZv4g7OLNPoblnGRaX3WmVPRlcxSI+pTV7dda2?=
 =?us-ascii?Q?qfwyJHcz5mBoOyPnzJIcV0yrvYbNyhAS7Kc7yB78oRXhQJs4vx1nhATrDLpl?=
 =?us-ascii?Q?zdpI7Ic8yVMiVvFgm0wi9IpTLcSALibeVPsdHoPhjZ7aClYI1Vzp116EKMbG?=
 =?us-ascii?Q?IrtStWCy2FJNWYc1eolAQFHVCr5abGwaN/3/II7IwYNqw8mn/vQbsMpMlaVs?=
 =?us-ascii?Q?j4M4OqS7xr5i7AgA8GzWCPMIjTcvjnDJ9BCPoXrHP4i0f8WHykgCXci2USMY?=
 =?us-ascii?Q?DjB8SJ9ojr28Ld9GVeZjXEfxXmUcp1sPF9N5RxylrbP3y5TCX0mYkteYTgZe?=
 =?us-ascii?Q?115iuvRzmxLSySlRXaLDHzV2jrt0cRfxQjNxPKRJr5FM69Tv07dMuALZVrv5?=
 =?us-ascii?Q?xv4LtBGBOsz0Vu+ihDL9k6aDj6JTEwrmr5W92hXqqqB7Wu5aJbUEE69F/tkq?=
 =?us-ascii?Q?TEp6Oe6ZZ7cN3vqjy48mxQETPyoa1/A+Rijj2JQlML3hYMchbFcd8JiEL+ki?=
 =?us-ascii?Q?TKCHRhC3rp44XqRjuXGaERO9MxX7NwzgK0b886KOrotTlKMuqHRAtEYZCkhT?=
 =?us-ascii?Q?kXpsYYSBdU8K18B7JcyAJSRADQLDwV6meVwweaWdYOiMKz/qnRqd8SgsZfdf?=
 =?us-ascii?Q?UWPO1kcbgotTXAtGoM28iQFfeoHhDEYKKXyrJFN2FBoLg2ykMqESqLVlQPyu?=
 =?us-ascii?Q?SYpbkV/31UYUgQwBvcHqAXXypHJL3oMqQwdo7XSUjPd7yYHfWi8UCoRX2wtV?=
 =?us-ascii?Q?mhn1t97xGIjuQAKtQw+D8TsUoJN4kzW+JZ1OLcTP3lgwXi79haRV2AHD/20q?=
 =?us-ascii?Q?Q7YntSSzY6cQPDKzZj1H/eX9AhQ6rZsnUjIS4wHa+PB5Ch/f3qq1SQwk7w0N?=
 =?us-ascii?Q?qx7xOIeKRniFN6Fw4fymO0c6kv6zl+5bHe1IDh9Kb3KRoh1GWqurMY26uJ0l?=
 =?us-ascii?Q?ok7QGSQT64CcKz9BRVhzJX3QDUwQMdYgBLBVl8SJmYRbUrCrjHOsCW+FFQ75?=
 =?us-ascii?Q?YsbOmHLRct/8givPyFjsqSoBwV7RnilXjlozpa3jVlFo6dnI++nuYpjmK7VH?=
 =?us-ascii?Q?nCsxJj8tVpEXUJNs+HpYVyn2/cAJSkzF4G2MmXOYzMI3qHyJbVGTSPi3vpV5?=
 =?us-ascii?Q?/8VQA3v5sNHcFKsA3AZVVvZyrBEzPsIPgMTP72I1c2Gi0WRkeT5Lf9TIgDjT?=
 =?us-ascii?Q?3LivYm/uQfan6M3mSrIbh79Zgrj67aqKL7w6c9HLtw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 bnwiBB+t/cwxNzPfHmjwZkARJP1jQRpbD69Ik4+flBM6hZCHYA3kDkyT6nchj72makfNVxHsZxRnRL/HOMgXT/EC2aaRDzRwX1eL2SpW3BdEdZXHqP74G9eeUZZ/FYhN1zjqzsgoFMpLm5y/JDmjSf5Rl1FN9U9FA8qXOt/SWslxrXk5OUTgztj2ZORXoYLurlkngxPsq2Y+drbqxVr5gnjkRXMICRWKV9hXIpkxSI1ZJ1U3ik7+SHrmHG7pu4qdzH0i5aSblpehj68bnfeVTKZ5UG4ok6IgAm+++LQ5LkESWV4IqJvJ91hR86osZvdjkGXN93PTl6pvoab1XLmPLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7598
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.111];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.111];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88449686-68c7-4618-5e8a-08de9f2470c2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NgRjUcgojgo4WxXh9i3RXfz+AYTQbmhx6sfQoP4Vl29GiXM3/ffCqJAJyexj?=
 =?us-ascii?Q?4CowkPPEmbWAtQ8NU8hU4daO4xpoMrh16wBugM3LdGFF00t4LBGIwdLf/M6g?=
 =?us-ascii?Q?etF8llXhhkI5W/xJo2f0RrUB70SyCQMcra2OH2I0377NTnF3zc/srMF+50/h?=
 =?us-ascii?Q?cLbpy73VccP4wrLjTTTQCW17CAVSTPXhgmG8uZ61aYtEpTeCLHBv6gLn8o2B?=
 =?us-ascii?Q?97CxOv2mvrM9BV30F0C1/FsmRV+BmXpE6GBJcMtkt6gJd2DMYbQOFTQpXf1u?=
 =?us-ascii?Q?4TtWHPfCqOvNz1/fLFjEd1axuYmjUEdOjvYfvN+7a2Koi2iZS8+d3RNOnfxe?=
 =?us-ascii?Q?55ADW5HsWKQK1y9lVcA26sskeYL1ANDT9vSNtSW4g466JTEOuhDLLtLeSzG9?=
 =?us-ascii?Q?ceURlCKhcEs5h1okSHVQTDsr1rKuS9DyOjH714u3fHoYJaNIyZU+LtoHXF5I?=
 =?us-ascii?Q?QAwisKyKSHlHnuBSskbpymfrFxyldP0MtW0Oe0J7sezX15j1+1+hSSJss4FK?=
 =?us-ascii?Q?BTkpocDCO6avJILQF6ZceWFZHGgIxEchbJa9YCAMqtQtjBSq6Lpo/nBz6FEC?=
 =?us-ascii?Q?3Krqg9uSZ5eOoZWl6DFj5m8I2CApS66E/Q4YEvl5nL+7eH6ofpXm5h4sb0W2?=
 =?us-ascii?Q?HHjFTQdHSlqankbmy+AG4yS7Dqm06+McZpuqOGr3hGtMan7kPzxQZV5eUYYK?=
 =?us-ascii?Q?ZqFdP1bROzcuOmbxySdEhZDkatiBOl+NwGuv5BPH+L7U61UOVYWAf6nMbKtT?=
 =?us-ascii?Q?xiwBvNYkaNDKtx+GQAE6thDKE5AwgAFOrvphAvLu/S5oJdiiCsXODU8VA6pa?=
 =?us-ascii?Q?xXlihTPNID66knPbOazKzl9FqYzohTNAmZDejEBj1tZhf7rgK9gpHvcRG3og?=
 =?us-ascii?Q?UbJJHf18tdXgCYEaYVrExEm/vmi3VvRmJ53GaRfoq9hMMjA+M95uHCpnvEYv?=
 =?us-ascii?Q?NK1fBzOtBL31NjUz+GXWo3VsZW6fBNu1viyQ+kkLAFOj+VO3QeIsPaG5ss23?=
 =?us-ascii?Q?KvAGsHSR0GDRmYG2X3i6cBO/yeHSYkuD1gXD+oX1+hzgM2vhInyxNIVTJZul?=
 =?us-ascii?Q?HJyfIGF7upxrUiMh5EnyZ5/2adCVh7e60D8DjpMpa4REsOrJ5dTHGpasjGGR?=
 =?us-ascii?Q?ICT/9GYu5YlLMdgbdpKhl8BvyBi63R6GhoxqakNQqfirKRMPZyqAAZHLcl8J?=
 =?us-ascii?Q?xhV2NwEQUkr4ny0+NE01FLDiW+bnDiz1yY+15xB66LruG3wO5bwRL05/GSup?=
 =?us-ascii?Q?WZTm7z+ImTMl2mI3OBKCh9JHUQsReBVIZWQqLI0kkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08CU003.outbound.protection.outlook.com;PTR:mail-byapr08cu00307.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OvvuozzQHNqqjIJeWcdp0QnIe9/kqM1WJCwMRXQseyFUahlOGYV7uyTrRpDuoPb8pxUU8vDniAi6wJtA2rqY0qYuM9cKMwZHBT7y83PShyxYc/QylGSn7coOaKzzLAKU5IpkaOqvrPaLNXX48GB8DP+WXFN8Uq9arrLAnVN8BwelimuTD3rkQozv2Y/MhYdpbrHDRV3w7zcIklYC+EnMC9KNHRteIk0y4U/vgu98LBMQ7OmSQrWnOW7JWju1VdMWVbfJESZbOiVyWx2/puuv9dJXO6/qzE03OhQsH+IV+c8tAi4r0x/JBkD8VGlvkTBax53FrKj7CyFqv5HCuLu2insFkOjnZz0Bknx/hf0+YH1aPX2gJbSw14Oir1InySugR25NANwTn4Dm2CaIsL8RqahSZJuwN3f0EtTF3j8iVivtkzraD4wHQ3DZyr3mBUJm
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:23.9523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d20c053e-eac1-4249-ad6b-08de9f2473bb
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB10353
X-purgate-ID: tlsNG-720697/1776720818-8057B161-3C65FB2F/0/0
X-purgate-type: clean
X-purgate-size: 3486
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.324];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5BAA14342C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds arch independent helper functions to determine whether a
view is valid or visible. This makes it possible to determine whether a
view is valid and/or visible in common altp2m routines (namely,
altp2m_init_by_id).

This is commit 2/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.

    These functions could be used to replace the equivalent calls in x86
    code if that would be preferred. For now, they are only used in common
    code.

    The altp2m_view_is_valid function also has overlap with the
    altp2m_is_ept_valid function, but that function has an additional
    ASSERT and check that idx < d->nr_altp2m, so I wasn't sure if that
    function should be repurposed for this. If renaming that function
    instead of introducing a new function on x86 would be preferred, then I
    can do that.

    Additionally, these functions don't have bounds checks since the
    functions are intended to replace code which don't have bounds checks
    currently. Bounds checks could be added here if that would be
    preferred.
---
 xen/arch/arm/altp2m.c             | 10 ++++++++++
 xen/arch/arm/include/asm/altp2m.h |  3 +++
 xen/arch/x86/include/asm/altp2m.h | 10 ++++++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index e741648ff5a1..0e19e197e826 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -27,6 +27,16 @@ void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
     v->arch.ap2m_idx = idx;
 }
 
+bool altp2m_view_is_valid(struct domain *d, unsigned int idx)
+{
+    return d->arch.altp2m_state[array_index_nospec(idx, d->nr_altp2m)] != ALTP2M_INVALID;
+}
+
+bool altp2m_view_is_visible(struct domain *d, unsigned int idx)
+{
+    return d->arch.altp2m_state[array_index_nospec(idx, d->nr_altp2m)] == ALTP2M_VISIBLE;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index 05beb7f698a7..fbe66ad5536d 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -30,6 +30,9 @@ static inline bool altp2m_supported(void)
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx);
 
+bool altp2m_view_is_valid(struct domain *d, unsigned int idx);
+bool altp2m_view_is_visible(struct domain *d, unsigned int idx);
+
 /* The current state of an altp2m view */
 enum altp2m_view_state {
     ALTP2M_INVALID,
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 43dd5d2acd9c..56ae19b24b42 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -65,6 +65,16 @@ static inline void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
     vcpu_altp2m(v).p2midx = idx;
 }
 
+static inline bool altp2m_view_is_valid(struct domain *d, unsigned int idx)
+{
+    return d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] != mfn_x(INVALID_MFN);
+}
+
+static inline bool altp2m_view_is_visible(struct domain *d, unsigned int idx)
+{
+    return d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] != mfn_x(INVALID_MFN);
+}
+
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
-- 
2.34.1



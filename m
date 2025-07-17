Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1332DB08FFA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 16:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046997.1417385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQ4e-0000VV-53; Thu, 17 Jul 2025 14:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046997.1417385; Thu, 17 Jul 2025 14:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQ4e-0000T7-1E; Thu, 17 Jul 2025 14:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1046997;
 Thu, 17 Jul 2025 14:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tNy=Z6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ucQ4c-0000QZ-Bx
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 14:59:02 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 921d0811-631e-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 16:59:00 +0200 (CEST)
Received: from DU2PR04CA0209.eurprd04.prod.outlook.com (2603:10a6:10:28d::34)
 by AS8PR08MB9598.eurprd08.prod.outlook.com (2603:10a6:20b:61a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:58:53 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::be) by DU2PR04CA0209.outlook.office365.com
 (2603:10a6:10:28d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 14:58:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Thu, 17 Jul 2025 14:58:53 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9842.eurprd08.prod.outlook.com (2603:10a6:102:31e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:57:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 14:57:35 +0000
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
X-Inumbo-ID: 921d0811-631e-11f0-a319-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wtrTV03/TtrfZD3DjVXCdsOKSkDbB+9bNE5G4yJByT9csTBHY4684Dymace4ESE67T6z3sz5KOc3t7Auf/QRf2FkbXVFEyl+tLmC85+W8lIsdK6pjbG4YRa3bf69GUbleZDFfMGrMk7pSW2NiwGv6VFR25gX82AkEFbDgEHflFTs4WvwUyy4Kmm3Q2YyMkL/F+dCiNYwqRhkTCfxHfqZraLZ4JfD64go/btUR+CX2iK1lqtDQ3zcPal+TE1xc8jKeEZHXK4/3CptLP7eovXhnrqjSTdm3UyS7+ePUBz9yi8nsD6ehEPKVy2nvBY4hjVyu73MHRQXOtDd7R/XZJ2h7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CELqq8N+YWNiI+jez+yFjyy7C59nj0OmfAU2Ll37/7s=;
 b=KgG/fSAcgtev9WgspqmDKti6y0ieu60RpNp6oSgVAQQPnqRQw02uVTBqtT4qskZnayIJbdp3dvdQGPXrmCXS5qotpLZNuHuyFSi57PBMrUg8OusDtuSF8O2czrB1my2CMytRsZ9wSt9w9ZuT6d8IZ+9KjaOAZvgWQ5T4ubnBZUnOAxxXuUzsUq+wH1Eu0h9iJpU/aAJkxfiQm1cRbNXrSMpj0495CKDC+OBYOTxr2sSk35d6oOFG7Sq8Sr23TSXSQpozvyezwive/ezFj8SfA5VolFK8TAP9iZnt1Qnvc51bY/vjL0zFPOG2PdM5tunAhf6Ubzp8L1eNRoYUhakHZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CELqq8N+YWNiI+jez+yFjyy7C59nj0OmfAU2Ll37/7s=;
 b=Bfuri+WSqtUHYPw7r9RDv/dv6V0Xb4yOkKbExiq6TNoAm2FhFXU2faHICx2op0TRpLqwRVivEzKP97ioFjSowj+62VOVc3h1bp1occBshgZpr1/EKBTd6bg9d4BeGPwr9h6RRt3/AUUW8SlXNQG1T7OeJeaYn8+aYHgOeDrO+NQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMoj1kfaNXU2i+VX6MQyhZjhShgzknAjM84FCs+mokLcyiueGdSH5KfTQ+M33KquCXYD9Jhg7tbNaVR5cccsIvosJZJg8vFspCXtjuSz5fExTzF6opJQ54EyFYNcmSBC2o7xvACRmHSHE0NkFnViz87aukhOXbLeT6+4rSstovBfKbq7WU5at4u6pPE05IcLBq4lK5zXMouakCFzVQewmBhVDaCMwxgwMjMZdAKRU36hAKcY+Qsk0TmFkuoG4zos8lDKTjvfzfOJzMVv91eqlI13MICZNWhgBgC0MVbn93Ub3cerSsVRl4YsG5AlRBXx7idsMGRYhO96+Oen73QgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CELqq8N+YWNiI+jez+yFjyy7C59nj0OmfAU2Ll37/7s=;
 b=LP+mJ+7gUfxlxoX9TtjSitWqq9WkRpMtkq1Aa4Pj20N/VUskJJiet1KVi6TwjyZfey6Nz6pDOhbc48aZ4xal+A0whIlxY8DiMLWmw2ISdz0dnk0sjXxQHHV9m9BzRHgZdC+CHaCgDX31G42vizoQ9kR1nMzCPqAvWNBBazEfLN6tIpuMhlyZLKFlxY7E36o63dIvHNjxAPjlG+emVbULL5MNnNg/cPD2LDRRv1nc6WtU2Ig+yZsujVEhl9AtizDOtFUrIw2+1jXB8m041adGbbHtJVmi9O3zajuNC8o+5a+ShsVnKBtvyoo9VPn/abOd0mZF2u+C83AaPB6MWHbvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CELqq8N+YWNiI+jez+yFjyy7C59nj0OmfAU2Ll37/7s=;
 b=Bfuri+WSqtUHYPw7r9RDv/dv6V0Xb4yOkKbExiq6TNoAm2FhFXU2faHICx2op0TRpLqwRVivEzKP97ioFjSowj+62VOVc3h1bp1occBshgZpr1/EKBTd6bg9d4BeGPwr9h6RRt3/AUUW8SlXNQG1T7OeJeaYn8+aYHgOeDrO+NQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v3 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v3 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHbwNT/SvCvWvdWh0CT9yLy3QlhobPdDqQAgBRQjQCARXVaAA==
Date: Thu, 17 Jul 2025 14:57:35 +0000
Message-ID: <860C740B-CE14-43D1-87BD-4C9137271103@arm.com>
References: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
 <2040B386-299A-4BC5-BC59-7D3F58835A2B@arm.com>
 <31594e99-d509-4081-852f-67ef2122149b@amd.com>
In-Reply-To: <31594e99-d509-4081-852f-67ef2122149b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9842:EE_|DB3PEPF0000885C:EE_|AS8PR08MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bc0a1b-b80e-4179-73e1-08ddc542725c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?cBH9ytr31LH6XsJkdNt7wUYOsSuxntzCPSbifBfeENG99CuJ+uIiFxVFkpgq?=
 =?us-ascii?Q?YgPztgiWfQFT4sLIsFV1FtHS9DubGuSUFLNnt0V4OGtUI9yAXEgkyuLmXfmw?=
 =?us-ascii?Q?RxuMRvZ9HPXgns6H+t5LLdZtUwiVqU+t7NCPuNXIQNCoO4mKWkTNzIw+oys0?=
 =?us-ascii?Q?l64hsS1NRMZQXM0JXiDCWd7WVBdrUbA8EcO/fbU5p/Zz5U8R4HzkbvsOFUk+?=
 =?us-ascii?Q?WgFpkKfewy5ojQu+CnxLsNicEdlmrlqBlB45/Iwp+vVi4x2dUs4jS8RFbQUK?=
 =?us-ascii?Q?LsX8In2Bc8wBND/VbqdNkJhgCs/bb2G/Q3Z4cb4VuQw4LGc5o38cHq0ZFHmZ?=
 =?us-ascii?Q?hn8O2rzoeoMSMc9dH5V/OpPi1fYCHw/RAKfnVxn+tosEYWkKItltTLciZb/Y?=
 =?us-ascii?Q?b9oenAQexL/UBGrM5ISNQFNzWZ2rh+QBF8gGkMsxd45War4YGTX97okY2wxN?=
 =?us-ascii?Q?tb9OfFbrySXj8TcREZpDrswvm0U8VUrJgg7ApRtOx1us1F6QTmBSG2vD1UsR?=
 =?us-ascii?Q?G0jIo9YTJ1eTcVNbWrZRTM7n2eLUPjEnTEphz4BIK8WOFXy9biWHjvaQr8bW?=
 =?us-ascii?Q?cNy/YC8c7VEgugbo1j0FjqQ9AyEsAbrqyBOZxMns4dM923afgFDsHM1CMdtL?=
 =?us-ascii?Q?WFho30AAyrVk4lXwYDAtKy50YVHwp2a+yGJD4qhWkGrtjYhyOJ/d3odPSV7c?=
 =?us-ascii?Q?ANWDgmZGRIcLM7b338eiqzF6rMneX/ZF+yFmi1d0jI4XDuCJH7F/xL2OMJW9?=
 =?us-ascii?Q?1BOMHOaXx/daQ4Iig9X6guGkZl2KaYJ8Kk1n615nJC80QKHpN+Y42xodla+6?=
 =?us-ascii?Q?byiQuP/MIc5pDLaLXb4fhvWiO6ep5kcxMmzd+J3aA55aNCDpmAt4jnrGt7Q5?=
 =?us-ascii?Q?VlZRChQiFNw/1hsIbcH3WpJ8mAdv64CV0PpyOkaMUI82vywgqAJg3HU4Y7nM?=
 =?us-ascii?Q?qSdi10PQOh7Kes6AMXNtKK5NIp5E8ZAvy7ReB9A/wCUUWD1KCDQlpYwmrXTY?=
 =?us-ascii?Q?LIp8wkOMP9EcUz9a7y5rs8U+JXAviCfdtvW2s4IeoN+bxKtsEWQhyiFN9HyQ?=
 =?us-ascii?Q?qjXlULW9S87mvQCGZUwNSlXuL27EO6jWOj7+xz3EJr2IQ5TG3iHJdW2deu95?=
 =?us-ascii?Q?q1V941gcAYjgJDIE3efTc/r/1HJOZfbQ2XHiB0OAx7tWYgOVWmMlsjXk5B84?=
 =?us-ascii?Q?8EeUMq9Pa/pShpZlxCZxt7G0xZvi615NjkwC990HwBFmfsvc4RPIEepBdOMp?=
 =?us-ascii?Q?emJyUFzs7Z8veCa3zuxgEBPwM329ljeXpuxytwQyfJKOsPgKOpHdbcX8zb+a?=
 =?us-ascii?Q?0EL0iZpfkvmQ67eRF8JyWwBmcoKjplS/N4frhSWc0KioYY8X+BMmV/xbn72L?=
 =?us-ascii?Q?xG5YB/h1rfFvusj/5GfCISkwI08R5NY+/airQsfT5s8Q2sWOcRU86S+RDNfL?=
 =?us-ascii?Q?PPMBNhyOcaW7V3PMtdH20fkLid57l1MaOgb5jAAYQCs8dm6BBwrK7g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8556721E2798CD47AEE7A9A3DCF43563@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9842
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ff47425-5928-45c0-a98c-08ddc54243ba
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GiP9X96PXlWFZAgQjB7VxvMgNMBsohRhDx6qJmSXbV6rFsiZEYVwlqyXV1dU?=
 =?us-ascii?Q?dRG+8A/PK/hxcUz4GV8s4afzb1AD5j6mGZDLTkJKf5WIc2Bh0R4OEaUazqOR?=
 =?us-ascii?Q?XH3qBqiGVY35RkceSSawoT6MqQHApMEy67XzGMKE1QrdNZVfe4vjrQ+I7zbS?=
 =?us-ascii?Q?Ij3yDcG7aX0/5d6IxcnAtzGWDrLdbNAX5b2uio8eh9peckbR1nZgUDgdnEHE?=
 =?us-ascii?Q?yenPNiDR4N7bnrFhnVdLB6jdB1nf40dRJVXIcGXITVDOSuiPSz8TY8rPd/98?=
 =?us-ascii?Q?wPi56aMLzmLaXP5QqDbt5t7h5dIeM7rhT+KKeittNZ48nU3cIWiZq9leRHq+?=
 =?us-ascii?Q?4azi2d/J9Le/gYdjm1hEV+h2ti2JgpwuGrJNVtttdPIrlzXgaFFwhLUB+dgD?=
 =?us-ascii?Q?jsBSyw9EXsNOvpIjVJxJYBFCnV60tQjjWGzRpDf6Wpkh64qQoPIp/+LYEonY?=
 =?us-ascii?Q?BRbP1P9TWhbSM6PhbKEOhbQJmOCUviXkuLx+Mtibs/AQXbbGaodaKb9us7TQ?=
 =?us-ascii?Q?31SPK/Xf7UEgjKBSzC01sb1/p4xKNp25BdVKY0Mh9J33Ao7QMbD2GK27dBZZ?=
 =?us-ascii?Q?UMAybQrbonlGOsTNcTb4ONeJSt+NMpfTIZuSL87zTdJCYSs0A5ySFLhp+GsX?=
 =?us-ascii?Q?I+FGAFhIqWCzs+fNiGdOP2yUjPYb5AgVrxb0cvOfMQIuK+qVE+/GwkvzZmBS?=
 =?us-ascii?Q?if0qPpIoftxp50PGZu578PhmDusWP202n7U8ZUydAd05VGdBC6COKbZUDIeW?=
 =?us-ascii?Q?reohbiDEfNeP/0SsAViN1St9WHlbbGNDbgUBIuN0hSJttk+BCo8Yec8KCJHl?=
 =?us-ascii?Q?kFqAFQjgVvWLkcawea1qNjwhe4iM2/dQHkOjaPkQDE9dGN21ykHsNH3YZbgu?=
 =?us-ascii?Q?gKZvb2FVVUkazUtZsVC2F+5WcmXZGe9wt/3i0Qpa1UeTihu3KII0EbP82DGp?=
 =?us-ascii?Q?gPFSPs47lTxNxFzY5tyG+GJlbpj/jkzNaIobIJKJqq+jtRwYwcxCoLcYey47?=
 =?us-ascii?Q?RxPQrnY2KUV7ZvM9092RurJFX8XPGgZ7l2DzMlajDueTJFBl4sHNM7lQODSY?=
 =?us-ascii?Q?1nYlEEWtXXodwseAxztdLaFEDHq1t+LEvlOcaYZ8ob3L3jCU52cznnuOmgir?=
 =?us-ascii?Q?oUWQxrBSd9coAUDQleirGDU34ACIMiBETcvxxUwpBzvG3F0jTHorpog1G3zc?=
 =?us-ascii?Q?Bwrx147MY+60+jHGLdRtClSxJh7bGsA28quusjNQZxK30nKemuBlZKxbmVgm?=
 =?us-ascii?Q?NWMevK56gickiYMtIwJzOHTV4xWQqnU4j9nxgVLDSWMk7vVdVe7XzZHa9L6n?=
 =?us-ascii?Q?PSfMtCerZgL5VQ7sC/lT0r4gjoxt8+LlRkF7yAupJXrSNoIzDFoL8/1eT87P?=
 =?us-ascii?Q?WD0i/Mg8ONbtZKW9iXZ7Falz671SNbfY3L7aK42hEdMAtqt1Rzr3bJUIBArX?=
 =?us-ascii?Q?G3wELygB46U4iYMJeq1FeIfzo63/VwinyRkEANYsEhi2scQmAvZiR7BAnxxU?=
 =?us-ascii?Q?Dlvy7SKxnGOlc1Psw5kB+6xtV1bJYmLBrfb6?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:58:53.2575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bc0a1b-b80e-4179-73e1-08ddc542725c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9598

Hi Ayan,

> On 3 Jun 2025, at 12:15, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 21/05/2025 13:02, Bertrand Marquis wrote:
>> Hi Ayan,
>=20
> Hi Bertrand,
>=20
>>=20
>>> On 9 May 2025, at 13:24, Ayan Kumar Halder <ayan.kumar.halder@amd.com> =
wrote:
>>>=20
>>> Define the requirements which are common for all the commands for XEN_V=
ERSION
>>> hypercall.
>>>=20
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>=20
>>> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does n=
ot return
>>> 0 for success in all the cases.
>>> 2. Reworded the requirements so as to write them from Xen's perspective=
 (not
>>> domain's perspective).
>>>=20
>>> v2 - 1. Specified the register details.
>>> 2. Specified the type of buffer.
>>>=20
>>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 58 +++++++++++++++++++
>>> docs/fusa/reqs/index.rst                      |  2 +
>>> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>>> .../reqs/product-reqs/version_hypercall.rst   | 43 ++++++++++++++
>>> 4 files changed, 119 insertions(+)
>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa=
/reqs/design-reqs/arm64/hypercall.rst
>>> new file mode 100644
>>> index 0000000000..f00b0b00f9
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> @@ -0,0 +1,58 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Hypercall
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Instruction
>>> +-----------
>>> +
>>> +`XenSwdgn~arm64_hyp_instr~1`
>>> +
>>> +Description:
>>> +Xen shall treat domain hypercall exception as hypercall requests.
>> This really reads weirdly.
>> Maybe: Xen shall treat domain hvc instruction execution as hypercall req=
uests.
>>=20
>> Then you can add a comment to explain that this is detected through a sp=
ecific exception.
>>=20
>> Also this is not completely true as hvc is also used in other scenarios:
>> - PSCI calls
>> - Firmware calls
>>=20
>> So i would put the 0xEA1 value as part of the requirement.
>=20
> Description:
>=20
> Xen shall treat domain hvc instruction execution (with 0xEA1) as hypercal=
l requests.
>=20
> Comments:
> The exception syndrome register should have the following values :-
> ESR_EL2.ISS should be 0xEA1.
> ESR_EL2.EC should be 0x16.

yes a lot better :-)

>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Hypercall is one of the communication mechanism between Xen and domain=
s.
>>> +Domains use hypercalls for various requests to Xen.
>>> +Domains use 'hvc #0xEA1' instruction to invoke hypercalls.
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> +
>>> +Parameters
>>> +----------
>>> +
>>> +`XenSwdgn~arm64_hyp_param~1`
>>> +
>>> +Description:
>>> +Xen shall use the first five cpu core registers to obtain the argument=
s for
>>> +domain hypercall requests.
>> Why not say x0 to x4 registers instead ? You use x16 after anyway
> Ack
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Xen shall read the first register for the first argument, second regis=
ter for
>>> +the second argument and so on.
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> +
>>> +Hypercall number
>>> +----------------
>>> +
>>> +`XenSwdgn~arm64_hyp_num~1`
>>> +
>>> +Description:
>>> +Xen shall read x16 to obtain the hypercall number.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>> index 1088a51d52..d8683edce7 100644
>>> --- a/docs/fusa/reqs/index.rst
>>> +++ b/docs/fusa/reqs/index.rst
>>> @@ -10,5 +10,7 @@ Requirements documentation
>>>    market-reqs/reqs
>>>    product-reqs/reqs
>>>    product-reqs/arm64/reqs
>>> +   product-reqs/version_hypercall
>>>    design-reqs/arm64/generic-timer
>>>    design-reqs/arm64/sbsa-uart
>>> +   design-reqs/arm64/hypercall
>>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/marke=
t-reqs/reqs.rst
>>> index 2d297ecc13..0e29fe5362 100644
>>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>>> @@ -79,3 +79,19 @@ Comments:
>>>=20
>>> Needs:
>>>  - XenProd
>>> +
>>> +Version hypercall
>>> +-----------------
>>> +
>>> +`XenMkt~version_hypercall~1`
>>> +
>>> +Description:
>>> +Xen shall provide an interface for the domains to retrieve Xen's versi=
on, type
>>> +and compilation information.
>> I would say hypercall instead of interface here
> Ack
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Needs:
>>> + - XenProd
>>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/f=
usa/reqs/product-reqs/version_hypercall.rst
>>> new file mode 100644
>>> index 0000000000..400d51bbeb
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>> @@ -0,0 +1,43 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Version hypercall
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +First Parameter
>>> +---------------
>>> +
>>> +`XenProd~version_hyp_first_param~1`
>>> +
>>> +Description:
>>> +Xen shall treat the first argument (as an integer) to denote the comma=
nd number
>>> +for the hypercall.
>> I would be more precise and say x0 value.
> Ack
>>=20
>> Also "integer" is unspecified, use a more specific type definition (32/6=
4 bit signed/unsigned integer).
>=20
> It is a signed integer. The size is not mentioned.
>=20
> ret =3D do_xen_version((int)(a1), (XEN_GUEST_HANDLE_PARAM(void)){ _p(a2) =
});

This is compiler dependent and architecture dependent so sounds weird.
I would expect this to be int32_t.
Maybe something to check here.

>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Second Parameter
>>> +----------------
>>> +
>>> +`XenProd~version_hyp_second_param~1`
>>> +
>>> +Description:
>>> +Xen shall treat the second argument as a virtual address (mapped as No=
rmal
>>> +Inner Write-Back Outer Write-Back Inner-Shareable) to buffer in domain=
's
>>> +memory.
>> You should say "guest virtual address" to be more precise.
>=20
> Ack
>=20
> s/guest/domain
>=20

yes

Cheers
Bertrand

> - Ayan
>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> --=20
>>> 2.25.1
>>>=20
>> Cheers
>> Bertrand




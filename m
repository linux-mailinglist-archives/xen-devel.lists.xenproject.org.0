Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFE1B08536
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046205.1416468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIMR-0000Zv-Kf; Thu, 17 Jul 2025 06:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046205.1416468; Thu, 17 Jul 2025 06:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIMR-0000Xe-H1; Thu, 17 Jul 2025 06:44:55 +0000
Received: by outflank-mailman (input) for mailman id 1046205;
 Thu, 17 Jul 2025 06:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tNy=Z6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ucIMP-0000XS-1p
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:44:53 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89743252-62d9-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:44:50 +0200 (CEST)
Received: from DB8PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:100::26)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 06:44:46 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::10) by DB8PR06CA0013.outlook.office365.com
 (2603:10a6:10:100::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.22 via Frontend Transport; Thu,
 17 Jul 2025 06:44:46 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Thu, 17 Jul 2025 06:44:45 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9102.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 06:44:12 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 06:44:12 +0000
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
X-Inumbo-ID: 89743252-62d9-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=c8XuE++LwlDIqOM53OCmbD4tsCiSZ0BE2aoerW2qvuO1i71DDjNRSslKWLfQ9MJXP2xBAzYOkcaAO1sX3l4MRKLJyB0GIZYn97pTK2G+auohYvPgFlnzLB0FkhC8FLR0AKidJvYTzSIV1b9blpsD7upbRK21B782Y0rxmj5eAM1Xaww1JmxsQBeXEWE8FPhnVxxUns8AwRO9ZKj4yGb0EPAUAWX6tassrAKtzGgtZARb0Y/sga3+3zBrrDKBsZM4IwgEHePKJM22+MBXxmGnC0QcjPgsF6MYH3lB5rLWd4twUyNknTF2Jt7bJdgCaclsE66hWw3/0iPau56MdvQfxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnDlBbd+7diMYQX+1Wt1klp0J1f7VthhhZhRbQeA2N0=;
 b=DxeGvEAIn5QLxqVp/jautYtYrBrTniE16o4UF93O+/EckFMPFsQZcatWgmCtCqvZFqi7iJGretNgIEfxhmjtp0CLK3UysPfxq5eSt6XG4B3OST3MlyFcYlOgKhzQnZPnF+uzQTI0nM73DUp0X6YSBSlzOnhu824RkbW8Mt6xyKEXq6RtXq6D9vezsrL33AAHgpiiWCFZcgqZtQBg8bietXW3PjTgWWbn6pUddHKZdazfQ2Md+3Md2n9xAKhZUA4ImrCYx7RuKt031UBFFVxCkWihIHVMDep+2blZUaAWCqCnEKWj+L4mqs84SQOWh9Yppic5ICCmheZTWitnlnI74g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnDlBbd+7diMYQX+1Wt1klp0J1f7VthhhZhRbQeA2N0=;
 b=jc/9XStWEOqULrlb8/GqI4RlsLZJCcysm8tMjXIOFP56HN7xQKitOvRAfGA4aacAwWic9vOMN3F4ycx1yB9SnvL6tpnzuUpzrTtnuHxIrBnCjhOmVGHJ+/+RCIiS+TowS1KopYLuTVi+SGYVWJeQcA+s/1CGgUfxMA4Tqxf1tws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SubL6ydbIVl6mYBWoeUc4I5+o+VPWzdrXDJ8ccauNnGJ2kpMpJsTyE4wMg9XfwACW7z+a5oCzgYdsjcXqNf45XykuWSuNgjVSM8JrMrnT7E5em9ncim6nWmLwKPcDAZe2FTWPf9vbUmXW8QvobtsVf8wIDluGQIjFKmRdx5eIgJNwQTvHNHolNm0/fIM2a/SV5LfpX2AKyivL6lm/RynW0fAZ/IGiPI12kDppW3zB3QKgx4AYMfII2Df4I/1D8V++/kn+LN2zC1anuGDjYa0BlYowxFPyYEUCL7Nt5EUQoHgQ7FvfN2Lk4FTYy09fM7EwLg00iZvryUkjTnohbQP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnDlBbd+7diMYQX+1Wt1klp0J1f7VthhhZhRbQeA2N0=;
 b=dG2LTfypof4SmJpv/oFZ1aIdu11HuYFWb9neNMYSQe7/mIul4JlDlTWN+flVKqThSXoZxIoBQWW8fvashukTg52IUSA5HJVpK5ZsqFIReNEaEbAoS7gzmew77spR8Vwqaj6+t++FTN9ptSilguxAMhW5wt5J1GsAC32ZYbNbUX/IVRKc9XxcnoqmJmv/MuXQPYtwnOxEapsAAkNzuWnT2wVoQYPmDW0b9Lj27XPrih+fHDKM0IhN66M/JRKL6VCTSdkLsHQ3VWfvIsurf+hmNpOKfobaUSA4RojwIaXwYT2iRwZVHaeX3+0tsFQQV0iyLaIOxbgFjj0T0U6nOHGr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnDlBbd+7diMYQX+1Wt1klp0J1f7VthhhZhRbQeA2N0=;
 b=jc/9XStWEOqULrlb8/GqI4RlsLZJCcysm8tMjXIOFP56HN7xQKitOvRAfGA4aacAwWic9vOMN3F4ycx1yB9SnvL6tpnzuUpzrTtnuHxIrBnCjhOmVGHJ+/+RCIiS+TowS1KopYLuTVi+SGYVWJeQcA+s/1CGgUfxMA4Tqxf1tws=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dmytro
 Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Subject: Re: [XEN PATCH v5] misra: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH v5] misra: address violation of MISRA C Rule 10.1
Thread-Index: AQHb9WtGauJBpc3EJkaPoqdZvIhy9LQ12xQAgAAGcYA=
Date: Thu, 17 Jul 2025 06:44:12 +0000
Message-ID: <2059BBD2-BC5C-417F-88B1-765A6C3DCAF4@arm.com>
References:
 <c5a035e0e6b3bd69bafbd3a0397a5924d942f995.1752571686.git.dmytro_prokopchuk1@epam.com>
 <31c768ce-d014-4d79-9e39-49e551867104@suse.com>
In-Reply-To: <31c768ce-d014-4d79-9e39-49e551867104@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9102:EE_|DB5PEPF00014B95:EE_|DB8PR08MB5482:EE_
X-MS-Office365-Filtering-Correlation-Id: 993cafb5-65b6-42f9-7bf7-08ddc4fd6ad0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?xbt+vELfzt7PjtQHn0N8f25X6bgaWjaw+3d07VTC/cmuMocMkESszGz03e?=
 =?iso-8859-1?Q?/FZ+BN2Zh20H8BtjBEeg2GMqVd73RZXKNQjgGopXA3FmmnhfZA37+HJsqP?=
 =?iso-8859-1?Q?567YNYitW7xWQKxviBroG9XmYt5XFVJW1U7OoADX+pLUGYjRXnQSQW9QTT?=
 =?iso-8859-1?Q?mRGuFLAQUDO5hIRxFmjOzBe4qHe1dUOjoOMNBSdp8bgJzIi1kAPE5mAZle?=
 =?iso-8859-1?Q?P2JrwgHbiuAwadkd26ZElTjb6Sbn61LvZGyrnWkO6FaZdQoddPEXZTE1Wv?=
 =?iso-8859-1?Q?pnfK4cJnH2/ahSssOTrDO6NlHHeMOVQ3unoFoz6bt1T1t93IUo6nJ+3mYT?=
 =?iso-8859-1?Q?Rql4341+Jkmu7Roi3DT1GbdI1cVaFGDrIkYRUYtLtrzAr7dPOBoIyhOAsk?=
 =?iso-8859-1?Q?leOB8OLbgi4XbQEwLKxL5eJjgUa0/SBayGA95ik9NaEZjqq534yrTEW6aA?=
 =?iso-8859-1?Q?zUYE3dxlN2ElATnDIeQbD3b6oAxuGGiHNDshZqHvJXJclRMFzAIPjC6+f+?=
 =?iso-8859-1?Q?8X2oqlGs/D1Sf9MFo76u8wn/vufZdaPjLCN+XqNjZm8Q/EaiIwDdRKPy3t?=
 =?iso-8859-1?Q?TIf+00oztiFPZYagmLChQcDbGW55EVijaBj8xv3p2Rgy3lWRbuTK0Ke7C+?=
 =?iso-8859-1?Q?5ONBTIEinXad8X9EomQQ6M1W20PoppNjwzzJDK2N7znNfdPUUTzpk/P+61?=
 =?iso-8859-1?Q?/gM67Ck99YrnhhHAYGuwNhC1mat8dUfIOqYJU9UcXvwMpWbLkAIHQL+TQY?=
 =?iso-8859-1?Q?84CtiuW8fmfK0H4BvWyhjrwAv5rG315GDSe/KZc1MhXijJAo22k3a5SLsq?=
 =?iso-8859-1?Q?kM3fuUXXLZ5Kn8jwRbRPBm9MmA+DzG16SdWGOJUdxTRWij6Z2O1TB03NJz?=
 =?iso-8859-1?Q?OqjTI5cHHRMkuMPmLtbZjrVnXh16HH4qiQlEI3HK3kb34nxQzs8BycLgyW?=
 =?iso-8859-1?Q?1G012OTRscRTDzpJ4Z/foUVs9Jx+ODxhWO+SSiWAaoEBHbB9JXGUOt4rW1?=
 =?iso-8859-1?Q?3bsemVmiqyWoV2P5mv/e8U9kzC2Sd5SLg1k/iZ6Zfm94c1MZGSnl3Dpthl?=
 =?iso-8859-1?Q?L0oVrPGcqOp7zjR+jiYgFDqJMNZ6uVs9pIRFAnn7zPemS/F5YlpmcJuHh3?=
 =?iso-8859-1?Q?T7ajXeE0QwyPcBV+lx3hDNJliin6/+KqS2ej9eqJz2iNbScCrPpgqACyWo?=
 =?iso-8859-1?Q?DZtNKXVNwmzZWscc0180Gd1SLXkuVdG4T7GgTTwGBRMIUMcxwtxGRRdUi3?=
 =?iso-8859-1?Q?mJmzW/DXVJTGt35p1ydE5RVtVVOiQUxFgKB4DOI8IegR5An5+Zw6+I/Tj5?=
 =?iso-8859-1?Q?dft7wEOKVSzO8q01EQl66XEHRT9BCr8JXiC0HQEAE5FqpYfzZw7aHmSo8M?=
 =?iso-8859-1?Q?JPTF0czb2DeLbj4ec6SA8lx78SG1STrHN8QLTyc63dR9stbZ518V6Rad4Q?=
 =?iso-8859-1?Q?/Rg/YkwBukbNDL/3iM/1s5NbmlR6MPpcTlyPbwE7Vk4WklQ5M9UxC/oGjC?=
 =?iso-8859-1?Q?2OKsZWgoNIE/uyeoW/SV+m1+Bq1+Djn0PZ85hjUmE9jw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9EF686565F4B5348A472B02DD4611029@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9102
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8df3c1bf-0bb2-497d-8598-08ddc4fd571a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?r1HgLqdzPdvj2GXy1VmWbgY/5t/JlL6zv1oEHVyszhCHsaATXa6LL3l9ci?=
 =?iso-8859-1?Q?pSaaq8YRsHKwH8GVKdvldUFj6Ib9j69TLPp4fw60Fb+Yl0pTV7ZIjdlXUV?=
 =?iso-8859-1?Q?LDOLKV9d97gtJvVxAxCoTr53xGhrnwhFGlKsDaoCzESCg3KaBIlnUdYFfW?=
 =?iso-8859-1?Q?EUG2eQlOZ1sUf4cChiy2Q9RdDtF7wWJe8vy2/hZcV5v9iJgKxgby0Yd8Ak?=
 =?iso-8859-1?Q?+sUvOIeoXUputStv34yX31q1tq/f1OQ8nePl/2R0pqJIsZbNTh4dgOieQY?=
 =?iso-8859-1?Q?jzTAuwavUM96iXqjeVHr2S389s3GW8ozzCnWzKuvZtgvApJTjnkFysXT/G?=
 =?iso-8859-1?Q?vZnQQfSMUkxv8jwxP3Dm+oUplsRMEzt9n3PgbKY6R6keW4l+U3uvPObTxW?=
 =?iso-8859-1?Q?r3uC44ndW3TUgoUCqH09xDM+qfBvPMXuigBqCTxX/YrXss7LtmiDchO1+p?=
 =?iso-8859-1?Q?0MgPXCCukVxZveJ6fHLL6ofvSBhIhPcFDeUzd78koFa6Juk0VwJt0XxWL6?=
 =?iso-8859-1?Q?noGZ2HQVRV8pmNbtXnbmEXN93sGQkP3Q2dPADrUDC6D9sKX6+8d+BHunB6?=
 =?iso-8859-1?Q?26vumZ/wWwhEXJnCFYArXvMtnG4e3+v5xBOU51eEysZ5lEx9hA/PlA701+?=
 =?iso-8859-1?Q?ISLxSWKmMzJi0dK/SZJOW4PeBs3RtRdtyfJCyxECAf50PDy/+JqRi6tmsT?=
 =?iso-8859-1?Q?X3IIziREMZnPyhCxA2Z5FlMO1/NifT7C4cHt9T9YUYuQkuCys2dSNNFq3t?=
 =?iso-8859-1?Q?w+cxXivD4PW09nhlkM6FJL54rsUvOVa1qQ54+WsmCHmVA8P9ANYU+Wn6e7?=
 =?iso-8859-1?Q?4d55aNgvQcRnxQa2lesnp9IMrM5kLLc7V9vR2H0rQDavRzzymcs01DBy6m?=
 =?iso-8859-1?Q?jGMuUvd73nv+oXHo5LuCnSfd2wHIiE4GUlzEsonTEutOAQpCq5Ftu+RBJq?=
 =?iso-8859-1?Q?RxYWtQebqC8ZVtfqxBkv9uqS6FhCdTA2oqOCH+pHQZ6f2RPtBAUh+aJCXV?=
 =?iso-8859-1?Q?/KPy0kao4OxAMtnfDhqYC+L8jv6IhtHhi2npNLUt6J1VYEnfmXRQdOjVdn?=
 =?iso-8859-1?Q?6lShpOzekUorsuRAqWx215pMfdEM5dUYSrUp5arvx4GaAVu2MMbhVHM3tW?=
 =?iso-8859-1?Q?vUOTj5G8RJlOEizI3ph6UlCIFtp1YdlLjL2rFGd+Gi/zZNrFPbTZWhghJs?=
 =?iso-8859-1?Q?WZeUbGYR0hxfNQRq199v9+q5HE3baCVyNII920YMg0Jnd7vn1KWbX3bmgQ?=
 =?iso-8859-1?Q?HhdNx8DaWOAh6GW6X+sdKOHdvBDd5p7teeW2sRDYnKI5mzTjC5SSx+ezWR?=
 =?iso-8859-1?Q?DT6aNC95XWNTqqG9rG7NeCDWRpLnq/eJ48nHNxuYm+8sLFonMexl1A3io9?=
 =?iso-8859-1?Q?QfnjM/nlbwbYSCnn/TJRwTRoeS3q+DTStTQFwpQeOJyOo702eVbDLZL5r6?=
 =?iso-8859-1?Q?bDYMwpCJYx85FVrhi24GHgo2Q3M293BEbCR2mzbPn0kyiDE1hJBSo7HSih?=
 =?iso-8859-1?Q?NpJbF8NgA9/piaK+2CT826nmowzyA8zcrhEsNIvLhRiJxeaWr0Zfruz2gt?=
 =?iso-8859-1?Q?UzKxLPMVJZm5b0KararSRxn5sWqt?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 06:44:45.3282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 993cafb5-65b6-42f9-7bf7-08ddc4fd6ad0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482

Hi,

> On 17 Jul 2025, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 15.07.2025 11:31, Dmytro Prokopchuk1 wrote:
>> Rule 10.1: Operands shall not be of an
>> inappropriate essential type
>>=20
>> The following are non-compliant:
>> - boolean used as a numeric value.
>>=20
>> The result of the '__isleap' macro is a boolean.
>> Suppress analyser tool finding.
>>=20
>> The result of 'NOW() > timeout' is a boolean,
>> which is compared to a numeric value. Fix this.
>> Regression was introdiced by commit:
>> be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen functions.=
)
>>=20
>> Remove pointless cast '(const unsigned short int *)'.
>> The source array and the destination pointer are both of the same type.
>>=20
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>=20
> I assume you put this in implicitly ...
>=20
>> ---
>> docs/misra/safe.json                  | 8 ++++++++
>> xen/common/time.c                     | 3 ++-
>> xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
>> 3 files changed, 11 insertions(+), 2 deletions(-)
>=20
> ... acking the Arm part? Except that it would have been Bertrand or Rahul
> to ack this?

This was definitely not meant to be like this in the code so the fix is rig=
ht:

For the SMMU part:
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> Jan



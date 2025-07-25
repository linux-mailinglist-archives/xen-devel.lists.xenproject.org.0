Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A35B11840
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057153.1425064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBhR-00078v-GV; Fri, 25 Jul 2025 06:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057153.1425064; Fri, 25 Jul 2025 06:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBhR-00077A-Br; Fri, 25 Jul 2025 06:14:33 +0000
Received: by outflank-mailman (input) for mailman id 1057153;
 Fri, 25 Jul 2025 06:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuZF=2G=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ufBhP-00076x-B7
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:14:31 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f3eac61-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:14:29 +0200 (CEST)
Received: from AM0PR03CA0038.eurprd03.prod.outlook.com (2603:10a6:208::15) by
 GVXPR08MB10810.eurprd08.prod.outlook.com (2603:10a6:150:150::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 06:14:23 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:208:0:cafe::98) by AM0PR03CA0038.outlook.office365.com
 (2603:10a6:208::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 06:14:23 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 06:14:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM8PR08MB5746.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 06:13:51 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 06:13:51 +0000
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
X-Inumbo-ID: 9f3eac61-691e-11f0-b895-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w7oFyYBf6Z6IwkEZwKldTLTEVX9rGctlljP7vhE/i0sAFKdYwUIVnyNsPUyPiZWZfV6J9x88qv1/xSfba+vWMJvnUzSEHK4iOAAZYM/iPz24zlNBj65GJJ1HlN1UpTlAgP4M80Cfs/Kw64jZSW1HN0o4Fq5cO+DBY1pGbRBgFaUd+JD5LSL6Rcsmg7kPT7lc8pCVYOKh+gr9grvMZPgWQ/iRWItqi8wqHqDBXhjM6/mjSS+O2uXkxj4/ifu4EYxwnOl5AOwaqGbJSsTNxcIPnwKGpencI9bz/ePm4eEfYeEj8dmsRtXFv/5qBQ6CUko/Zr7metefnX2Aaw6Zk0an1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BfLve+NA+DkN0U2pbbY41CdmbMK9qY+0/NG2CdNRS4=;
 b=Uoin+8l0lVjCByjjs7M9diYMTzD+sFemLtsTFDRO2saZ+rNiVs/UyF0VbCvJWOx3RUBO0/wtJCHC40T27DcCeWMM97JLgl6J+a+cbSrbtGq/dATAkdTyGWDAaTsS+y3kjJ8t0OoY6idsB4bipBLqfu3LHBWppxDAxHCnRLpoih0mIVtedPN6YWULKrdNzMfCUCc4n41ApNRhPaS3HHa+VaRaVjLBBSmqNYFx7Y71KnTxPOMtsrvZ9BQeOI+9wk9+kYHTAmpLFQV8eYWQzW6ZB/hrzCGQT8x76L+KIz+nfKco+0y9fq/9vOyyxWJyMzaGDIRxOjVO4qLq7fiiqZSK2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=proton.me smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BfLve+NA+DkN0U2pbbY41CdmbMK9qY+0/NG2CdNRS4=;
 b=OvBg1zjTyoRct1rZx8Jk+011lolvthsZzr21E0ccidHlTSOC+Om+JvySgALDN2teau8VCxQ3GiIzZNXkGIAHsJo0W8fe97UO0TibTCDH0ezl6G8ZchcHjaN/odzGNEsRjJnRA5NvtQH21Iy4fW8yLHzXN8ONzG0y9ON7NWtfGiY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn0iQk9aZcMYrQIPdNyd0tbxDz6Co4weWTrreGRKsNms8C6tXAzA771DTkZLhwh7dHaQAKay7kEpdhLcJbrNfcEUzG1UKQqJ/jbii9UwHI8KezHBCnn4aZ1H8QIkfc0Ut7T35oafOPtHlcyXo/OiTPc40OeQXFjbyddb64Jpfxn9VLLwjOZ8VjSJN768JSqKKpyiXjvMELv1oDIe3j03tRdtCSDUsiOCjvIE2/VrOB9ntvCSRLHnAEG/lqkOT48E+yj9g0cCfpzySVHvvolS5jWnmxcAXxhDLfh6EG1TPYgw7UsgYhF1zeS0kcY/lGEtKiDEcs3TEV9HSAJwpUYFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BfLve+NA+DkN0U2pbbY41CdmbMK9qY+0/NG2CdNRS4=;
 b=SOLcCmsCFIPhMYk3VbKjlr7umVsiJlKtclwjbkm9ckD7CPkpWN/7NZkwTS4evMulszfOlkIKqQmcOc9GeS5Z8qPUpqZUY/zwMgjNivtdlXPs94JLZWMPR8yMkcebZ3vFkE8GM19dRf8Nggdkr6/Opn20EPj1Ebbhcf0VCQKY4+QJR8+c8mgSzjvaHMYD3la64excQPdVlxPTI/606iAAhubcvA7gPyBCxo8eqnPPGQh9uLnQ9r5efeijrTI5VBKwPVGcq7klv0wGn/fYXa5Ab1PcQkSI35bOJFhuznlWiXwImj53p6Zsrcwvzj1uyye8NnzCNn6O9sggidmNaZDvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BfLve+NA+DkN0U2pbbY41CdmbMK9qY+0/NG2CdNRS4=;
 b=OvBg1zjTyoRct1rZx8Jk+011lolvthsZzr21E0ccidHlTSOC+Om+JvySgALDN2teau8VCxQ3GiIzZNXkGIAHsJo0W8fe97UO0TibTCDH0ezl6G8ZchcHjaN/odzGNEsRjJnRA5NvtQH21Iy4fW8yLHzXN8ONzG0y9ON7NWtfGiY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "dmkhn@proton.me" <dmkhn@proton.me>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: fix xl pci-assignable-remove
Thread-Topic: [PATCH 2/2] xen/arm: smmuv3: fix xl pci-assignable-remove
Thread-Index: AQHb/CTEwM+ofGaU5U6Z0S9DvRagM7RAdHSAgAHpygA=
Date: Fri, 25 Jul 2025 06:13:51 +0000
Message-ID: <49B99D6B-7323-47F8-BDF7-DD25B073E2EB@arm.com>
References: <20250723225422.116387-1-stewart.hildebrand@amd.com>
 <20250723225422.116387-2-stewart.hildebrand@amd.com>
 <aIGFsy88qvMj4bTB@kraken>
In-Reply-To: <aIGFsy88qvMj4bTB@kraken>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM8PR08MB5746:EE_|AMS0EPF0000019F:EE_|GVXPR08MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b837533-19dd-48ce-5c2a-08ddcb42803a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?OP7mdPZFy2P7/YzWP4js/83i6td7tDgSU063eBBOtSklbQJmzkv1+JbBsd9C?=
 =?us-ascii?Q?3Fx4aDkYLdVkOpWW7cBOb+bRLS58ZiXqZRtqlATqNuDkMETwIfsHEqcjtPU8?=
 =?us-ascii?Q?33crvHaO1WEOQKHHrKJkINJczL0BnU0AVuOU6HFVjDgwbXJU5nY2Ac/tLW4q?=
 =?us-ascii?Q?QeTbY5NEojILG7wBeBaWMJ3vNKfJmMa7RDDXTGpqhrsSukWHEeSDZ8pGFoCr?=
 =?us-ascii?Q?xiTZjL6ygpvUPaZ504GESyJ+RZKoIPXW+WKanZszzy6+LsS3bh/vfo806inX?=
 =?us-ascii?Q?UGss2Yy2F0ri1Cr9yz0enRmJE0MgPsNBuitiPW1W1jj20ufUyqhfF06/muyK?=
 =?us-ascii?Q?pQhvUVcNSeEQckWLKJCh4fX4zqYABp6s5YCjydPHhgCkTXS0p3jnUPnPZc1+?=
 =?us-ascii?Q?m9OWX35mHcLb9OJWLbp7qoHIVriK/zE50vk8X7NHZbfbtYZikhyf7EJSYdJ+?=
 =?us-ascii?Q?9p0MdSkdEIXeJZXVnQ1WbvJYI+zkakE5e6uTpQe7PQrHwvFCzZfcg3AKsQTH?=
 =?us-ascii?Q?QNHIcPKh8uGASRKHn/5od9CFYmw0EAe27dNYKDTwdF7Is8d3t35LREiJbe6v?=
 =?us-ascii?Q?PIhHOQpU9hjSekaxxnhkd0LAyiyirlP9qBLP/J0t6EckHOgVGsj3+Mmtnx36?=
 =?us-ascii?Q?J+CPGU8KCPMRRpBfW3EnYl4nAcWwf+0nTeSDPZmyGqzuOp5ZGsrP/g7Ez1v2?=
 =?us-ascii?Q?ptTGoFn9agMSTHcvlfcWE03VPT2tm+sL9WMb9r3/QQQ/nle2V8H+Kybo2oBm?=
 =?us-ascii?Q?m38wbA0Y1VHmtat7bhgjUEasnaw07glDX3MbA5KiUPFYd1ApSHwLEsmw3NrH?=
 =?us-ascii?Q?d9sg0mgopwoRXgO1VtFuzffvC6+ojMRzpJss6ScWVgVsG0I061oxBHz31YzP?=
 =?us-ascii?Q?6xPEjpqLz3wafB50CvBzwEEoP3Z5g72uFoUvmmCgiu2a2vTXwjiMoggvMAR7?=
 =?us-ascii?Q?jfxx5CGTPpD/W76aPmhWCYMPar5KUmH5tqqyOu3meP8f0tRTgxfrBVOIKPBi?=
 =?us-ascii?Q?H1kc76pjKnDxtBRkG7twxSmAsstQj6Z8de+zDRU8D0am5l1x1nmlFLN98zic?=
 =?us-ascii?Q?hVMiHqjQ2w7ZbwWhTaGI4FgRsB15cIXn569Cuzmr6+t/CttS+NIooBZ8wCwh?=
 =?us-ascii?Q?GKhNrh/jl9XPzevm/x6teiyIU3nE+94fpOJK7BrkQ6ZB9EN+NL0SyforvSy6?=
 =?us-ascii?Q?r6NA4DH23264RibVSB++yRI+5rF7RLiPEEqbleV8WvZRGDAXbIaCyyvXEElD?=
 =?us-ascii?Q?nGPXF+o9/sYg855tLjpJeWEW1AbnN/osULaw3DN00EKV6qS5KE7jbPeSbS+T?=
 =?us-ascii?Q?yDjs+eTUxdtzuD8nFv+0DDFBOH4U+qPyDAadJrkg9ENiIoECoAOOA6/ZRoKt?=
 =?us-ascii?Q?sPAjLSc8ogfZ06OHqsNByGIFrJ4hJHusfov06/0kijayAgwYLpw3W2d1+xxw?=
 =?us-ascii?Q?3Il3KP7YkVp6HJ6Ubht2Y+moii2IVH9wM828bdtEnpwYBAMpqysnzQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CDD3769838008F4884C84667630D32C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5746
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7760e4b-1d3b-4e53-5362-08ddcb426cdc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700013|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cb/+toyw0Ylegebz4OeUMmEEzDr/mVj+W4XqLCYEileKPmIfbWbsj3IxkqMT?=
 =?us-ascii?Q?eVqNqYq+syuFHuYAFMEfTW5q0IUX5myYANbhL5sjvb9KwFDePCIxecaUxwyJ?=
 =?us-ascii?Q?9fByO9VzI2BW9DZ7BCEQM7OK6KzuYVxiSk+geU6XqqYitrEo8mNQuGUBMCcj?=
 =?us-ascii?Q?w5ic4n4okkZkVHqxfOhfsktbESF32jk60jtVNtXDj8gJlegluhBoWrhJdMF2?=
 =?us-ascii?Q?XB6dq3Bs9mJtxmDI6bs1KWZK3TsjO+gjA0w2FZ1m/H1N24RvJpRMJIJwF8yE?=
 =?us-ascii?Q?KM4M/Zsgh3JUuHQ/BEkCOQUPXPIad4y88aY16VYcbJLEy8PPvgzYyUZJD8h2?=
 =?us-ascii?Q?uYEgSpllYNS/08OFcNOh5sVzQYtikIyB3YC4xIzr/dZTnZ6WBETDTwK7t4CM?=
 =?us-ascii?Q?WJubaorcK+YhUk6F5wkcoEZB/7ni8Z3hrbwCqfKbCVdb8nRK2ddoTpYps/OI?=
 =?us-ascii?Q?E4X854FuQBE33bt12gD7HY9i7SFDdcoHRuxhl6Wb/0LzHTgKxNmC0wG7zFkp?=
 =?us-ascii?Q?mrRJKMdbs7hFfCWglgmPerAqguQyuwOlCY03JeVhojemZ+2t7zR0rZ+1CBue?=
 =?us-ascii?Q?lNG8Coi17YgsWotXJ/AqZ052Ghot2Xz6enBvDkk4UCiYqmKidER+c9CaqeP1?=
 =?us-ascii?Q?4kqcbbV2ExhUYYfDNErFrUSvUw3lSfpD1kmjuv+L3vxnxLzB0FzUavZTdAE6?=
 =?us-ascii?Q?A/1M23J2785t/lXYxstOyVDB25TBt2PDXE9WpyTWvDzBKQesOH8BssVohqup?=
 =?us-ascii?Q?RvI7ZXhws+zxEmFKw3BzHcAOIIccYZkhse8vJsBJ71/ybpXJQdjBYQT7BtZI?=
 =?us-ascii?Q?qBdpK0sEWLyJiyx1K5kJyYDCs2aoHdpm0QtiNQE2U4I+VQOCPllZF4UMTqo+?=
 =?us-ascii?Q?8FbtNRSrwdu0S5dwzb0uqR5+vweAlgVIoB7AjLb8FYSndSh5dN+CFBmpucjD?=
 =?us-ascii?Q?TOOU63fdEGa3bWxTGugER1cGQONYzrOHsfqPKn+t7lXc+7ufwxC8DzFO/0qO?=
 =?us-ascii?Q?b1h9Y86IEE2BUBeqFTgv0sZkFlhzO3m0ZQyBMJ27wDiJbJWApQmxbkTUcoqN?=
 =?us-ascii?Q?CJIFnIDamXdNkAZRVSsT/72TfWyCbkn1WVzZgI8r+UZcqirRcoPQ7I4dORQ7?=
 =?us-ascii?Q?y2BqYsVPr3kfTPI813ms5C3Dbf2iNXnVrOAyCyxqLDXe7eL3J3foGLCsEa6E?=
 =?us-ascii?Q?OU6OeGBbKgmX2zEgIiwHof5Wii53Thd2f3FIM0hnp2fbtW/Ma+Hr6Mh/tfrM?=
 =?us-ascii?Q?Seg8W298qXVOl4IprfqbQAFFlw2SC3LQaKT+PDvlkVl0JAGJMJsQ1A9cx99z?=
 =?us-ascii?Q?jf3JMueFKjE0PeJH1KXWPy29gB/UPk9ed5fAf4Kp0J3hLD5ywukuo68kYAAF?=
 =?us-ascii?Q?TzJR2/uFVTyxQ9oxlbfIziWQ15gOWOr7mf5s/y23pFFNFXbr16GUAyf7sc6m?=
 =?us-ascii?Q?RjF5ZhRiGbFIolkzI2CS3B+uj8Rd8QJuuBhbW9qog9jgI3+uaf0K4n845iV6?=
 =?us-ascii?Q?cGvqGL/RQB4lPSC8pIJbXU6IxfI0OG9Oe2Bk?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700013)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:14:23.5073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b837533-19dd-48ce-5c2a-08ddcb42803a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10810



> On 24 Jul 2025, at 03:00, dmkhn@proton.me wrote:
>=20
> On Wed, Jul 23, 2025 at 06:54:20PM -0400, Stewart Hildebrand wrote:
>> When attempting to xl pci-assignable-remove a PCI device, we encounter:
>>=20
>> $ xl pci-assignable-remove 00:01.0
>> (XEN) SMMUv3: <no-node>:  not attached to domain 32753
>> (XEN) d[IO]: deassign (0000:00:01.0) failed (-3)
>> libxl: error: libxl_pci.c:910:libxl__device_pci_assignable_remove: faile=
d to de-quarantine 0000:00:01.0
>>=20
>> When a PCI device is being deassigned from domIO,
>> arm_smmu_deassign_dev() should return before checking the smmu domain.
>>=20
>> Fixes: 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv=
3")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> xen/drivers/passthrough/arm/smmu-v3.c | 10 +++++-----
>> 1 file changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index db08d3c04269..9312bb3c72d8 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -2747,11 +2747,6 @@ static int arm_smmu_deassign_dev(struct domain *d=
, uint8_t devfn, struct device
>> struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(io_domain);
>> struct arm_smmu_master *master =3D dev_iommu_priv_get(dev);
>>=20
>> - if (!smmu_domain || smmu_domain->d !=3D d) {
>> - dev_err(dev, " not attached to domain %d\n", d->domain_id);
>> - return -ESRCH;
>> - }
>> -
>> #ifdef CONFIG_HAS_PCI
>> if ( dev_is_pci(dev) )
>> {
>> @@ -2767,6 +2762,11 @@ static int arm_smmu_deassign_dev(struct domain *d=
, uint8_t devfn, struct device
>> }
>> #endif
>>=20
>> + if (!smmu_domain || smmu_domain->d !=3D d) {
>> + dev_err(dev, " not attached to domain %d\n", d->domain_id);
>=20
> Use %pd?
>=20
>        dev_err(dev, " not attached to %pd\n", d);

Agree.

With this fixed:
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
>> + return -ESRCH;
>> + }
>> +
>> spin_lock(&xen_domain->lock);
>>=20
>> arm_smmu_detach_dev(master);
>> --
>> 2.50.1
>>=20
>>=20
>=20



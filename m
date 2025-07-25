Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E401B1186B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057234.1425193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBng-0006cM-0F; Fri, 25 Jul 2025 06:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057234.1425193; Fri, 25 Jul 2025 06:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnf-0006ay-SA; Fri, 25 Jul 2025 06:20:59 +0000
Received: by outflank-mailman (input) for mailman id 1057234;
 Fri, 25 Jul 2025 06:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuZF=2G=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ufBjP-0007mf-KL
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:35 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea62fb2c-691e-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 08:16:35 +0200 (CEST)
Received: from AM0PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:208:55::39)
 by AS8PR08MB9431.eurprd08.prod.outlook.com (2603:10a6:20b:5ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 06:16:30 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:208:55:cafe::9d) by AM0PR04CA0134.outlook.office365.com
 (2603:10a6:208:55::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 06:16:29 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 06:16:28 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9390.eurprd08.prod.outlook.com (2603:10a6:20b:596::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:15:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 06:15:56 +0000
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
X-Inumbo-ID: ea62fb2c-691e-11f0-a31e-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O4wY9/AwkItQJ9/WXVSyYL5w+zkX7Gvh0UYv5ZMddrq/J1++gsGxK+PaHOQpwjT2E6cevg/8CbSC0ufB8MJ4T2Xzr7vxGV/fs1C7jMS7pwW/I92vPBcOZi5AOYtleZ9EApwCk+JajEDms5eBg8n984jAEoFoTkIUReIvgo3XVXszMIMgZGzoynfcjMbu34jC+gl0UUBKoxh3flK9ZYBrHtZT+quPdYjCyKWCHhUNktneT1nv6IukUUPvYlVsGi+q0LqkNn3A5xfVszur7AsHpVeYZBkizhe4901YG5q0c+gpYPeCv+986ZEGRmqOEGcvC1dc6MpgnDJac2T/Gzs0gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dbd7ADuE/9vpvNqD5fal8x0ZfY3Jn9bqL55FvEL/LJ0=;
 b=A0Im3hGwJPLIAq1+i8fTpUY2QBOEbm6iNI5ZcipsXo2Nb+J/+g8ZXRyq8ljU3UyasQG2c/Pm9l+XzL11WfTBOPh8CbdFpf56nYV0bVexixJ6dlDyDHxSRZc9d8XvwL/GlQWJ2JPK9ILtq+is0ICUgMBlOgT0WNks8xLEMSBNT7RJJt9QZ6q4ZdCbePmhXjG4PCSRdjLV5FjBFADC1DtAp50PVAlUViWwLSVqlY3tXhJNgsEBpWKXPW6Rlc8v3GXYO6oF3ppvUksrol+pSHU8JE/YwwvE5GUN/jupaCqYWAtoUnXb8uj29OHhl/5kyjym82gKw3v6Odbz8gPPBgN5Gg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=proton.me smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dbd7ADuE/9vpvNqD5fal8x0ZfY3Jn9bqL55FvEL/LJ0=;
 b=YId3ZfMVI32izCRmpgfcpZaw2HhByCHGFK9bOjeJMQKSDjPDExYNoFBlxAp4b6iXbXHxcdnD85AoQez045f7kdivv3TpAixXZ9E+2Vfu13JGOi6IMI4cMwpbb96CJaNju87Yx1MJZ99le7MbbEMw5UR8v834DDrGrnFctaTjl+w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meWSv2gQXe6uBJNDj+X7fty4aEZOQ/gX8V55LGMTYtXeyLuKrbhfvcRtfPrp2qVmbbQ+xqz3s9pzdBLB+ocTDqswXjCpTArR519b3Ewh119xVozElxeoVcUib+jv//egsLk4VzL73Ih4N2YUk/8NCQDwT+bZIZWlWN1j6PJ4Re9DeKrX5C+MfycobKsfJF3+CfX0+Wn+37Gi8k9hSNqHJH/A+7UBJbp39QYDjy4k5TqIOU8SgQqygchqVUaiPC3xWQGGJkYJtczZB4/sOCVB0rNBvHgAiILqA9XsPtqeL9DdKye3def4lwzXVYpIkmNknVn1lYt81K5L4H+IW2PlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dbd7ADuE/9vpvNqD5fal8x0ZfY3Jn9bqL55FvEL/LJ0=;
 b=XRJgwqmP98o6cC2dpZDrTnGYZWaj/OkeTO30ZQF53/FxR3UUiSi4BeSPsqI8vst/YbnhbnwS5e8Gu8C84msGIRtW7fkXr56LQoi1Qy1eoQM3idHMv4pImIyAlXAhws29Y31hDDVcR4BRDvPxJgmOWankxmEV3Y7jhMMtzc4oKG1DCiJdN2vEy76V7h9s9F6eY/ik7DHUfb3NEVLm5zmvvAdFVrTPdCC3go2p5M1+20GMGi1Zzoh+Z9EDkMv6UWRyuGUFAZ89AVfv3sDUQLxDW0j0ViUsOOxck5bIPyo5SYhkIsXvK/QOPvrOPgbflj9zHbyLs32GiIEIB7g0pSuihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dbd7ADuE/9vpvNqD5fal8x0ZfY3Jn9bqL55FvEL/LJ0=;
 b=YId3ZfMVI32izCRmpgfcpZaw2HhByCHGFK9bOjeJMQKSDjPDExYNoFBlxAp4b6iXbXHxcdnD85AoQez045f7kdivv3TpAixXZ9E+2Vfu13JGOi6IMI4cMwpbb96CJaNju87Yx1MJZ99le7MbbEMw5UR8v834DDrGrnFctaTjl+w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "dmkhn@proton.me" <dmkhn@proton.me>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: smmuv3: fix UB during deassign
Thread-Topic: [PATCH 1/2] xen/arm: smmuv3: fix UB during deassign
Thread-Index: AQHb/CTBUeABU74FEkyJ7zHVeZJ647RAdBmAgAHquoA=
Date: Fri, 25 Jul 2025 06:15:55 +0000
Message-ID: <64A944FC-5E11-400D-A315-7575A9439343@arm.com>
References: <20250723225422.116387-1-stewart.hildebrand@amd.com>
 <aIGFZb5k3fh5pK8m@kraken>
In-Reply-To: <aIGFZb5k3fh5pK8m@kraken>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9390:EE_|AMS0EPF0000019D:EE_|AS8PR08MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a07b4e7-d16c-4ec8-8989-08ddcb42cb01
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?73omZPJAdLrWRJ4n/ncxTHrZfW+dkEvDBz9vwFh4adOo+hyp4T+HL/NjP4qv?=
 =?us-ascii?Q?2arL6magKfTuP7CLra9YFSyx09KedVd4MUkM/OCavUVxsDZhl9BZ7wnptliE?=
 =?us-ascii?Q?rtXOgikHIUGpL7mY5WUvkTBZpgMI/DQnQhaQbn9o9QAn9prNMlWjqykfD43F?=
 =?us-ascii?Q?jhVdCMpPBDYFabu9uuOvZ17aTja2iV0R9FjhGiq5d/Qj42blJ0Bi6HiKHZt4?=
 =?us-ascii?Q?6HNwssGtRSMrTUdRbklVeGWQWpvjh7/RQ+IdTmOQY6zVV7xDi4xdCAM6g9e8?=
 =?us-ascii?Q?5F0Zh14+pCom+s/MjTwmoWMzmGKT41eeJNKptKKktP10693Qvw/oCu/KIoEn?=
 =?us-ascii?Q?hbcJ5quuYW6Ad0F35av6cHhEGNuQvvp+9FOlR7KJ5vdXilHL4PY8szG1Gevj?=
 =?us-ascii?Q?YyRvBQ8tyM+mHS3LZzSJyErsBpBrSoRkE0scDpozYmnOHLYYma+KHePY5q97?=
 =?us-ascii?Q?EmTBbRBFNX+aAxmuTIKCY2IezNRhQKmNA3rqY9IQWQBQOxIFq2bT6UZVj7uC?=
 =?us-ascii?Q?+2VLwebCPYowd7f/vrOnmfwfpC0mS6Cv9Yab2hTadfza/tDizZISz4JmZPz/?=
 =?us-ascii?Q?5fSGTOg0WRVuNCFMYnK2/FnFlj8eqn9SY67Z3uTdWqTfAmw0qcj8XDqccvt9?=
 =?us-ascii?Q?YpAHr/sWthlIRj3+eR3YhA4TMpgPPL/GET0Ir2ME7P0AidGx+DL31OTzmjas?=
 =?us-ascii?Q?D5G3kXoLbFOYh9XJzI1TdqxjuL7I4yql4QKnx7gzJlPs8BEc8B/mYN0Gk02q?=
 =?us-ascii?Q?a/+UL8R2sCIXruZXMUXE89fMoBmkoGsEgo3MhKrLqHhkNqqSPqkI0fP7APhc?=
 =?us-ascii?Q?6o5ufAbn0xO/mhVCQuLVoE2CvddtfKjM/6bMXlOPSpsos/d0+vS15o/HCU8T?=
 =?us-ascii?Q?0KxqD41uWVCwwctOEvL+7jsw3UaE7ChcEmMpFKGYP7XuuR5p+L5BhecvRVQ8?=
 =?us-ascii?Q?BBVTLlABkCcQgpJv4SMbO7aQb3LbZnlrFI5DtaKVNqEO3n/yT+s3SbCDp2jA?=
 =?us-ascii?Q?zHuSwbwKtjl2vk3DzsM+WG9JtMNmXXLZji0Qmq/Sl8sTBuocw/Kccd/tBVjM?=
 =?us-ascii?Q?Bk4gXo+OONiJN5uEZCs3tGqGHcZseXP2A8zQzOS6xA1KYn5Vkf7jIEEXTrZO?=
 =?us-ascii?Q?3AwxOn1nOOXEHzfQAIB1ZMcPJKjCHBRKsf9IEkN3AjIzdYvvCrrOXhObIBmb?=
 =?us-ascii?Q?RS8qqCJ6eYp2Z6aVQKA9mHtRc19jD9hf1FnynlQNh33Pzuj8FkQtj3ij49vV?=
 =?us-ascii?Q?VIvr4aun3iv3quHhcW+O9lzIufXDWcoLVwhU/n4q7R3oEFKhAG55lQ0JpboS?=
 =?us-ascii?Q?l1CXAcTReMIlb4b4lIltFwMYv/uNNSKdhqxqYDW7yzdP+TXQ7e/vgEVjyk1g?=
 =?us-ascii?Q?gPUjj2zSaaqAtnQKBC5pOtjWWXkgiZd7NoZycSvi2pKefmDc82TypX9Yj+iF?=
 =?us-ascii?Q?bLI7Y4i0f3XtLeqWuh/Vbr/i5QeXm0PAuKM7vVZeKWIFjXb+zlXowQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F6A636E4876844D995DB7579872A9F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9390
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e048c410-7eb4-4cdf-1a1f-08ddcb42b74b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ujC6++MMtP7oTwulArC5dVTt6nK0tDcRDDA1LiRmsQ+xh4hTWRP71TXh/e4J?=
 =?us-ascii?Q?KzYjuDcss12A7XFroHni5BneMmtb9iRjRSwDyDlrlTS+b2AlJc2miScHVaBV?=
 =?us-ascii?Q?TlfHxgWVd0BY7Tl4n2jU4XxLPsBm61B0iXIdKKuqvpqYNoPrm2gydVTYEuQX?=
 =?us-ascii?Q?eaJ0JmHctvdQvnYM4Mb2doRjX/dRa1mpnn40nKn7FR65vvEbLy/qc5GxM3h9?=
 =?us-ascii?Q?u+jyY0WRAQJy7u47pvXXlSjWxWK7Ya+2pAll4C2i4zXkEBYRN5vfuzhsH6FD?=
 =?us-ascii?Q?pTIxll/XEJRW7aIIAYApYlb/ztCDJvA2biqSlMJQtHoqJWQW4TZJ13vdi1Q8?=
 =?us-ascii?Q?IcjfgF1wiDurzDtDHycIi2lQXeH84R7+s2VCEHKgpY9AAOE461VNjgAZz+/f?=
 =?us-ascii?Q?rHLoUzOS2HVnNkt1c7NfBsTOGEzMO+JiZz5JYVLaeZ9BxVY8rcSpSaOnenu4?=
 =?us-ascii?Q?hj6qQQ6T+FIBt4xKlPN0TBXbP5JMbtcBNS74wj91o6NRXAXqoyJjCx+tG/hl?=
 =?us-ascii?Q?rS2oC/Q845TA86+6tomPo5S9kT8RXVWCa0jJfOT8Bc3rnPNcw+0C0ubso4Md?=
 =?us-ascii?Q?LVEGSfQ0Hh5d1BltiEjSVOgvkDfZI7VnJe+j6HNa4Ul1oD/D9q3Ck7MW5Xke?=
 =?us-ascii?Q?mlfIjVxGHy2kwR8fp8BmUGKW2EOTZ1/q3bCh4HPAAbP9WaK+QCBYVXlG+ixe?=
 =?us-ascii?Q?AHZ5r0UzhpF/Mf2fODIFcJws63oIJfpGOWc28X4g+vEY2ebq0Ektd+eZ4hTS?=
 =?us-ascii?Q?V/lBIW/psSOOSLU/farq68JPU1B4F43V+a9mEKC1snSGMPZEqLZkGQ0tqAB8?=
 =?us-ascii?Q?k+Z2sWD7BIF4ZyJUu6zeGObjW19eBcHXxDKfAIVBirXYIlG6Vo9RI+m5H/t9?=
 =?us-ascii?Q?m3Dg8eLhBvy2FcCA7UBC/5HSZwrJaeCQVOA+K9jjkhvHWtmMrBgxsusAJA9o?=
 =?us-ascii?Q?diglqddvYHRCt8FT0i2EJ1LkBAvHRUuxdUrWsav4BU+a5rWSSC7JrnPmBhTb?=
 =?us-ascii?Q?YeNt/WVNuHm33wr/yBc/ed4zOjwzyMMX46w3KRAtFi9Q/DtWsJDtQt+ZyTg/?=
 =?us-ascii?Q?qGgPwCBXjKK/lm6KBfd2auMM9kMDX8kz4fQCl5HWSszX2pv+53xmI2tIYJKb?=
 =?us-ascii?Q?VUh487S5ZqM2IGOUPGlukaJ2zcJWaSXWTofjkUAqolWzRhgGVvBm/eCm6Cvc?=
 =?us-ascii?Q?w19qi/cxWUCDyi35oRGeoVRE9JmGz4+AUg7a4Vro869pUxsLxUSoL5C5wa0E?=
 =?us-ascii?Q?+EIcuRUJvMQMX9F2y17t9WIIvXclCpTanVMF27NGTSaAwXXalx8REH13/Jn9?=
 =?us-ascii?Q?yUbsP8mwrlWMOnEpXztQoSIZItnmGoadYbaz4EfrjO+GUkuclXj4mFVkap40?=
 =?us-ascii?Q?hNc7CbF/2grhB+qpSFwVFMGAlj/1vgWY2On0jXzNgFbylMm2lhApU/lbMymK?=
 =?us-ascii?Q?nBR7KdxUbW1tTobcJc3EJuZwEI/c6iSrbqwunRcSKf5KCLex17M5ng+0WOQW?=
 =?us-ascii?Q?z90JkgmPNd+5jhu2krgNEe0WFfe9zsy5RlHM?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:16:28.9535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a07b4e7-d16c-4ec8-8989-08ddcb42cb01
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9431

Hi,

> On 24 Jul 2025, at 02:59, dmkhn@proton.me wrote:
>=20
> On Wed, Jul 23, 2025 at 06:54:19PM -0400, Stewart Hildebrand wrote:
>> In arm_smmu_deassign_dev(), the return value from to_smmu_domain() is
>> NULL-checked. However, the implementation of to_smmu_domain() is a
>> container_of lookup, so the return value is unlikely to ever be NULL. In
>> case of a NULL argument to to_smmu_domain(), we will attempt to
>> dereference the non-NULL return value and encounter undefined behavior
>> and a crash:
>>=20
>> $ xl pci-assignable-remove 00:01.0
>> (XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> (XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/smmu-v3.c:22=
1:9
>> (XEN) applying non-zero offset ffffffffffffffc0 to null pointer
>> (XEN) Xen WARN at common/ubsan/ubsan.c:174
>> (XEN) ----[ Xen-4.21-unstable  arm64  debug=3Dy ubsan=3Dy  Tainted:   C =
   ]----
>> ...
>> (XEN) Xen call trace:
>> (XEN)    [<00000a0000350b2c>] ubsan.c#ubsan_epilogue+0x14/0xf0 (PC)
>> (XEN)    [<00000a00003523e0>] __ubsan_handle_pointer_overflow+0x94/0x13c=
 (LR)
>> (XEN)    [<00000a00003523e0>] __ubsan_handle_pointer_overflow+0x94/0x13c
>> (XEN)    [<00000a0000392f9c>] smmu-v3.c#to_smmu_domain+0x3c/0x40
>> (XEN)    [<00000a000039e428>] smmu-v3.c#arm_smmu_deassign_dev+0x54/0x43c
>> (XEN)    [<00000a00003a0300>] smmu-v3.c#arm_smmu_reassign_dev+0x74/0xc8
>> (XEN)    [<00000a00003a7040>] pci.c#deassign_device+0x5fc/0xe0c
>> (XEN)    [<00000a00003ade7c>] iommu_do_pci_domctl+0x7b4/0x90c
>> (XEN)    [<00000a00003a34c0>] iommu_do_domctl+0x58/0xf4
>> (XEN)    [<00000a00002ca66c>] do_domctl+0x2690/0x2a04
>> (XEN)    [<00000a0000454d88>] traps.c#do_trap_hypercall+0xcf4/0x15b0
>> (XEN)    [<00000a0000458588>] do_trap_guest_sync+0xa88/0xdd8
>> (XEN)    [<00000a00003f8480>] entry.o#guest_sync_slowpath+0xa8/0xd8
>> (XEN)
>> (XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> (XEN) Data Abort Trap. Syndrome=3D0x4
>> (XEN) Walking Hypervisor VA 0xfffffffffffffff8 on CPU1 via TTBR 0x000000=
00406d0000
>> (XEN) 0TH[0x1ff] =3D 0x0
>> (XEN) CPU1: Unexpected Trap: Data Abort
>> (XEN) ----[ Xen-4.21-unstable  arm64  debug=3Dy ubsan=3Dy  Tainted:   C =
   ]----
>> ...
>> (XEN) Xen call trace:
>> (XEN)    [<00000a000039e494>] smmu-v3.c#arm_smmu_deassign_dev+0xc0/0x43c=
 (PC)
>> (XEN)    [<00000a000039e428>] smmu-v3.c#arm_smmu_deassign_dev+0x54/0x43c=
 (LR)
>> (XEN)    [<00000a00003a0300>] smmu-v3.c#arm_smmu_reassign_dev+0x74/0xc8
>> (XEN)    [<00000a00003a7040>] pci.c#deassign_device+0x5fc/0xe0c
>> (XEN)    [<00000a00003ade7c>] iommu_do_pci_domctl+0x7b4/0x90c
>> (XEN)    [<00000a00003a34c0>] iommu_do_domctl+0x58/0xf4
>> (XEN)    [<00000a00002ca66c>] do_domctl+0x2690/0x2a04
>> (XEN)    [<00000a0000454d88>] traps.c#do_trap_hypercall+0xcf4/0x15b0
>> (XEN)    [<00000a0000458588>] do_trap_guest_sync+0xa88/0xdd8
>> (XEN)    [<00000a00003f8480>] entry.o#guest_sync_slowpath+0xa8/0xd8
>>=20
>> Fix by changing to_smmu_domain() to return NULL in case of a NULL
>> argument.
>>=20
>> Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> I'm unsure if that's the right Fixes: tag since I'm not sure if it can
>> be triggered prior to 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices
>> support for SMMUv3").
>> ---
>> xen/drivers/passthrough/arm/smmu-v3.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 58f3331520df..db08d3c04269 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -218,6 +218,9 @@ static struct arm_smmu_option_prop arm_smmu_options[=
] =3D {
>>=20
>> static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
>> {
>> + if ( !dom )
>> + return NULL;
>> +
>> return container_of(dom, struct arm_smmu_domain, domain);
>=20
> I think positive case first will be more readable.
> E.g.:
>=20
> if ( dom )
>    return container_of(dom, struct arm_smmu_domain, domain);
>=20
> return NULL;
>=20

Exiting early on error case instead of doing the handling inside a if sound=
s cleaner
to me.

If more needs to be done inside the function then exiting early will make t=
hings
easier. It does not really matter now but might in the future hence why i a=
cked
the original version instead of your suggestion.

Regards
Bertrand

>> }
>>=20
>>=20
>> base-commit: 5c798ac8854af3528a78ca5a622c9ea68399809b
>> --
>> 2.50.1




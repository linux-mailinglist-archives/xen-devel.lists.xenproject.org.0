Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62617A93805
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 15:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959005.1351501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5lsR-0003o9-CU; Fri, 18 Apr 2025 13:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959005.1351501; Fri, 18 Apr 2025 13:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5lsR-0003lC-9h; Fri, 18 Apr 2025 13:35:31 +0000
Received: by outflank-mailman (input) for mailman id 959005;
 Fri, 18 Apr 2025 13:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DiI7=XE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1u5lsQ-0003l4-0S
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 13:35:30 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd6964e9-1c59-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 15:35:28 +0200 (CEST)
Received: from DU2PR04CA0236.eurprd04.prod.outlook.com (2603:10a6:10:2b1::31)
 by PAXPR08MB7317.eurprd08.prod.outlook.com (2603:10a6:102:230::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.24; Fri, 18 Apr
 2025 13:35:24 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::8c) by DU2PR04CA0236.outlook.office365.com
 (2603:10a6:10:2b1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Fri,
 18 Apr 2025 13:35:24 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 18 Apr 2025 13:35:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB8PR08MB5530.eurprd08.prod.outlook.com (2603:10a6:10:11f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Fri, 18 Apr
 2025 13:34:49 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 13:34:49 +0000
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
X-Inumbo-ID: fd6964e9-1c59-11f0-9eb0-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OOa4iraX8Xce0qpRsqBIZCkI9W51y8y88uCViNm0nzKSe70h8+lUd3hbZqWMdCSU3rC7atBsqe6nEcsKAo/zAzmponaIXckhOfxXmHLolE0DaxYTq7KaaBY5521iCgBdc2PM2GcrpLYKJHk4euXbh79gJJRdJLQi3cHUdjTGkTjMexH51jNoi/PGSwnPAQ4dXfNe1DnfcDWCd2948cp1ALZs4TASLepwcs7l57y4/0WOl2BnxqgC3ARjD2LCxTm22O5uQx3iEcr5Nh+cbDHiPjZjbuVfT3lTX0K2YcP0v2TC6Uu7DR0Q34K+wVszK7Cz2Wudo8lHBUKbcq18pbZkKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx1ti12BdbXOvhevioeL4nuvqku12e4JApiWQxZxE54=;
 b=r9VOZLT5t/rllwwAFoIR+pEY73RcoXeCo2Tno+UaAoSlpZSKreY8/7r4NdmMjbRaAo6Q9IPP92PdpcDr6BxDqBmRzQteekBbmkJxmtgux1tjKeW4jXXa1N7oUjoShk5Wavhj3Zkj4t20FaGWV2PxF/AGUiOguaLf8+jGZ74ZMt1tf4aiCjAGdCUO+yaPBfIWpl9K7NyMGY7EgYVTuHqFUu+wVhmg3OQ1UrC3vtqcF1PQo9l4l7e2sE4A/9m7NnfoSpFaGKX/g2T8XI7BpecVm2bPD+o1q45aHLF2xd5eES5ajLOvd54Onnyas4s5dhA5MFXPlHWuXnetEcYbXjiJeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx1ti12BdbXOvhevioeL4nuvqku12e4JApiWQxZxE54=;
 b=SNFZSjxRPT45QrOtzDcYmhMB5hzwxU0VJkCNl3n/Nk7mBrHw/iS2JKIUq2//xdiFqu6yA39KI7aHaDBPpFt0Tm9/17BJuNR7TcuKHbjRcYGSEdI7n38ZhRrCvXfBtQi6Boc8CyKT+YS1jKQB2T0W0xAAyQ2B/KAHFBs//GikVFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIC3GDty7CogDtdikRLw8AU2Iqn1kU/Fx2YaSYQlLPu6XLmO8z1BDhCE+/gmC77mhF+r33RCzYmhU8u6pZtCso/gMPgE9yM8sVsMTxnndGZpMHeORlEArEbKiucr8/W5Dy+hYX0hRfmqZORSNfbBA4OXkqYoUfpNGkH/0SAki0ELmNHGGLEWeO8+Z92EXjW8uWaVwgLSaM+jqicVfwzhrhnqkmnonBou/3tTgcmb0u88wIYcfUCsxNAd6sPTyyrsJIWFakuV/bVpxWfzLTPkaIU/+H7yHL5zk6r8yLWPDEVMDso09HVsak9DRvG39uLBIxm4IioO83sgMgsfZm8hkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx1ti12BdbXOvhevioeL4nuvqku12e4JApiWQxZxE54=;
 b=oNQk0mTp2jy5/0mQ5+1mHODDl0u5uwb4ekJ1TIXM+wYOaPC757s6bicKCWjTGPxKpCNqu/q8bJk/A7EOLlmPvCSIDPoPFhdkl2+UiQxKAg4iyUbbZVnl0qYvZ3fNzNzQChCf5+swUJ0/Bzt8boTWC/oTFhxZSNl8OyTBv9Vi7UHVDGZPVVwYxGAqCdn8rdehwPokkMbTx+bKLvoA3xqnzAA0Zvj1dBP+p7gWy9NWl4LYM8InMeA8P9Kzd8XQgGG/SGPN74gIAVFbV+vvkcE141ObRpHAiYRazjTnlHAWFyodWKGejUFj6GxkfO6oRRhh4zoyxSQQ1UFx85svi4ljSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx1ti12BdbXOvhevioeL4nuvqku12e4JApiWQxZxE54=;
 b=SNFZSjxRPT45QrOtzDcYmhMB5hzwxU0VJkCNl3n/Nk7mBrHw/iS2JKIUq2//xdiFqu6yA39KI7aHaDBPpFt0Tm9/17BJuNR7TcuKHbjRcYGSEdI7n38ZhRrCvXfBtQi6Boc8CyKT+YS1jKQB2T0W0xAAyQ2B/KAHFBs//GikVFg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Lin Liu <lin.liu@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 04/15] xen/device-tree: Remove use of *_to_cpup()
 helpers
Thread-Topic: [PATCH v6 04/15] xen/device-tree: Remove use of *_to_cpup()
 helpers
Thread-Index: AQHbrsb5yt9DQWBdUku9eDjw7081BrOpb7kA
Date: Fri, 18 Apr 2025 13:34:49 +0000
Message-ID: <3C3840F4-88C4-4353-AF86-92239921B5B6@arm.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
 <20250416115900.2491661-5-andrew.cooper3@citrix.com>
In-Reply-To: <20250416115900.2491661-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB8PR08MB5530:EE_|DB5PEPF00014B88:EE_|PAXPR08MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 397b3f96-3849-472c-bec1-08dd7e7ddf26
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|7416014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?9LGAGWFlyXGHlTBOlJmGQhRwS979z+z6Ick0rxS59vu2I0YX0FSy2lcyMO?=
 =?iso-8859-1?Q?sT/z3TN3u1O22Y62ZIlkr34osgg9Og9nSbnb7N/0kEKBuQeeiS27wpsI5E?=
 =?iso-8859-1?Q?PgWo3lH45TQgNxnNWEC4DyCxGV0GP4xugym4OtJxIhdscFJsB+F+mEu3rD?=
 =?iso-8859-1?Q?bono6HW8KeRUNk7EFGg706YTI48GMutEv65ecJ2sGtMrlkH+jfCVrcWTNv?=
 =?iso-8859-1?Q?TRkj1moWyimCYUVkNVhlIbowzrtpZkFB/CQwvr/9IGlRwIZ9TYbqg8XDAp?=
 =?iso-8859-1?Q?dNxUcuVcHeRj7RlgsSi7IU33YyGDtlgoGjMtJu+2PTvdfhXXQaG8ae8c7q?=
 =?iso-8859-1?Q?hCXtvrP1FAu/U+F6ijPBpKM62QiFLPHbahQncrjdxo3NdODU+E4APs3AqQ?=
 =?iso-8859-1?Q?QAqd4/4k/mICHXR0blYHdinBhx1/vdL/v7AlDEgLP7wyN2gYXoAdzT2beT?=
 =?iso-8859-1?Q?vgWcFrr6IydrEUeENVGdYGlKmAJ3W8pvaLqkdxKZNtyFgJQJJ5od/wyIVw?=
 =?iso-8859-1?Q?X55yRVfOrNdB7PkPrm2/5cLI6cY3NMjcKjsB2BBmwgiiqMmWE4rwhwiohL?=
 =?iso-8859-1?Q?UD+IYi4O+BArjoxEEccBo0yNx1CK6PkM8j/BLD3vzN5/hK7Po+nJMv0s5z?=
 =?iso-8859-1?Q?iphuOrn+sNiBxWY2d6rhl5EZUJhLaaD9jqcuWEcGJGmJ4y+uzLbBkkqe6A?=
 =?iso-8859-1?Q?TawFGbdLXqwUPk1iYm5z/KDKiXy4LFSKNfVRxUMxKgrKQM4mtHOtbG8hs5?=
 =?iso-8859-1?Q?58fEOz2o4DIuVrr9ulMDvVrRhZVIPp0SzHlGRmBm11QEpus/92ArX55rj2?=
 =?iso-8859-1?Q?DwBx2ZQ/9Gojfa4j0LcoZd0rgKtircsTyTTqNUhjHeMemuq+amYKJux0Ow?=
 =?iso-8859-1?Q?Wt4bMSmhlGu11+4P30/U+EPw6/ApDtoWFkzUbDUS5eo4Zh9jegFrpE60z0?=
 =?iso-8859-1?Q?0DvRlMmsa5Mmi0XZ1m6GRg7b3te83RMXfjzkK/YHG8DAy6JTQCevHMJIBO?=
 =?iso-8859-1?Q?kM1UR7RJJcfct+sSTozB6U5VRz0MRXrgs7CTOVk+QXDLMrH/isZlIu+3Ep?=
 =?iso-8859-1?Q?chCzt1P/aE+2atdnL6dpQgTl+g2bOTZQUS2gCxllX1OMgpKJgcJeSM87hr?=
 =?iso-8859-1?Q?dMZrL/IZNp3D7O1E8/LrMd7z4Ww7BR+i4m82UFDs9ASKmcjjirLmH6/vls?=
 =?iso-8859-1?Q?VCvCFsWDRmaQK1neDBCmPJN82StoWHWUlqxzNeuvG/WKbp0PFgvS5Nj8Jb?=
 =?iso-8859-1?Q?L9yMo4+GTT1wvu2a4b+PdlwQpgvzzHE5MI6GeUWLmC5qwQqNjnllVzDNO3?=
 =?iso-8859-1?Q?jOZqW3OKNN7WfQiaA8HLgX1D38K67D5g/k8MW1g9frplVoVi1DXENSYkXH?=
 =?iso-8859-1?Q?f7ammDiFi2tI04rqQ1MKMVkyj4CEI8Fz7LEj5gy6wk7akZg/F8LA/Vurf9?=
 =?iso-8859-1?Q?16SRB7jjyzVeaxCpBRcO3OfJGlQ10wwrgraNbI0CCy+QxWv3ojoLHLffUr?=
 =?iso-8859-1?Q?Qy0z1u+fPEec/+NYl9TmeIdttj5dgzcZ64M1B6bqxM0w1g2FSPhlEaXrWU?=
 =?iso-8859-1?Q?2A2tX/g=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DA93ADD7168B934EA635B1CDCC5B0458@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5530
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d9c4087-b2b2-4797-8d04-08dd7e7dcabf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|35042699022|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?m25fZiLIGmrL7AgKjlwYaJq/1u7o1i/qNz8Kp+2chFqoujSOCg4ExU+vx/?=
 =?iso-8859-1?Q?eGT415gqP7NEIDqaOPH/m8BqhKrPxKiYgcL99aQ2SN8Hg2N2RvsySkATUH?=
 =?iso-8859-1?Q?6eWsgKEGJvQLpJpjTn5c6G9+QjJK4qdcDqaycFRsyWyPKYlJVthmjzGfpH?=
 =?iso-8859-1?Q?gwMK2V3fv4qqsyLnxyHhU8RmIyl8Khlrth1bvurZ7vb7bbp/zeESexcf+z?=
 =?iso-8859-1?Q?/nq1MR0wh4Pz3OFNDgoF9BkKdD3OipS88lgskWBlrINgWJEpVY3qXS7HCo?=
 =?iso-8859-1?Q?0PqScS/Kxe7oPgq5NoIMVsL1h+GxracbDUxp8zktmJjKlQIZijlPV5DHwl?=
 =?iso-8859-1?Q?u+fKl6Bx+TWfHG65Ia3eVXHCUhYneKfQaWeRVsSdyPI4BDoRfNQowb0+6a?=
 =?iso-8859-1?Q?CCKdDUYSOFU7v7tc9RVL13omXX/eRUuF0FjqyNObc5eCyHt36fsUTZmaSa?=
 =?iso-8859-1?Q?wnh7RvQ9vNfws2cwEENunFM8OgWMe1/r2U+nvACm7+WuA3rv91ILU0iFdc?=
 =?iso-8859-1?Q?JpBgfsUtwMgr51p+Wtvp0F3mymLWaMehyCce2NeEhsLbf/NK1up5rhdprF?=
 =?iso-8859-1?Q?3tEoyBu4fQq5WXQWMrwYznN66NM4F3xaiRfNGjLZBiUomJDGBHneqx6ocO?=
 =?iso-8859-1?Q?lBSwCPKtSKgKqzcUiH0iAo3PbiCcn/iKqidFJWlgSa1up0tqSEerqWi1+r?=
 =?iso-8859-1?Q?tPAjS9zhcAhIQbKPFvTftXRhrL2y0tE/JS1sIHJpEHgtXZUdW7/yfTSotc?=
 =?iso-8859-1?Q?OgpdKwU8xBnHlCKvD+vyBtS15e3Q/AyR6iSt6s/h5+GtTieXNDru7On9pY?=
 =?iso-8859-1?Q?Whss5t1g/G8e8mDk3gYuLMxhINBS3LyvDFAtv3qGrg18y8/LS/BkoCsf4+?=
 =?iso-8859-1?Q?G7dB4z5m7d7e1WF2T80nEpUfjzL28fAex4GWAibJTkB/7T1BZIH0X+0V4/?=
 =?iso-8859-1?Q?vmijOMIi5CJL2mycVfWVVMcHVRaxPgn9BC3uOVvypwFXB1hxTqWgiLlx46?=
 =?iso-8859-1?Q?tmPGQd0PaCUY6TF+IYeVkfO4kGSX03NmRDRYaFvPCa+049DU8cu3bckB2H?=
 =?iso-8859-1?Q?Bfzrgvlj/vtdliKpnecvViS9J6MIdawqOkASjELAqLNYP/+qt48aijxjgE?=
 =?iso-8859-1?Q?OTWv/XkOVd+4BlcU4jxtUgQYuABt5PhBPGfusAu/mG7AzqA9j21LZs30TB?=
 =?iso-8859-1?Q?rkniPAQrI6seLwsMg6/NURL21N8sgfy645jL7+ox/0wH0mfLCuvZaVQgWp?=
 =?iso-8859-1?Q?Da+/SsTCcFepJrOmtokvEZLHcs0FoWwSEAXiq0k8g9PJUZrUMgI91y2hmF?=
 =?iso-8859-1?Q?/DqbUDHR5Vtn/RlLLgyLkMPBzI3sGTY1rzy8odysvKsL1Qra4pPNd8b0Jh?=
 =?iso-8859-1?Q?ih5NFSzg6brfuoBBIIvEtJ1qnnsj2/SOqcpAovpjxjTET68OieC1l99epb?=
 =?iso-8859-1?Q?uDXU4husNOpQKvG6zOWK4gwksT5KmC03YJ8ocUSvk0cj4bpxp099F+mvRn?=
 =?iso-8859-1?Q?3w42/xrMffb6Sx6gdYzJmVAFGiMZvrlOhfLp1Io49BywIIquBLY6Oirg+5?=
 =?iso-8859-1?Q?RJh73O246Y7TJyXJgvtjtdYgiGOI?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(35042699022)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 13:35:23.5376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 397b3f96-3849-472c-bec1-08dd7e7ddf26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7317

Hi Andrew,

> On 16 Apr 2025, at 13:58, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> From: Lin Liu <lin.liu@citrix.com>
>=20
> These wrappers simply hide a deference, which adds to the cognitive compl=
exity
> of reading the code.  As such, they're not going to be included in the ne=
w
> byteswap infrastructure.
>=20
> No functional change.
>=20
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand



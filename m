Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3715B914C9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 15:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127781.1468365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0gGv-0002JF-EE; Mon, 22 Sep 2025 13:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127781.1468365; Mon, 22 Sep 2025 13:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0gGv-0002Gg-BR; Mon, 22 Sep 2025 13:08:01 +0000
Received: by outflank-mailman (input) for mailman id 1127781;
 Mon, 22 Sep 2025 13:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n98p=4B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1v0gGt-0002Ga-9B
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 13:07:59 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2881d615-97b5-11f0-9d14-b5c5bf9af7f9;
 Mon, 22 Sep 2025 15:07:57 +0200 (CEST)
Received: from DUZPR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::24) by AS8PR08MB9885.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:07:52 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::b9) by DUZPR01CA0154.outlook.office365.com
 (2603:10a6:10:4bd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 13:08:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Mon, 22 Sep 2025 13:07:51 +0000
Received: from PAWPR08MB9005.eurprd08.prod.outlook.com (2603:10a6:102:33e::18)
 by VI0PR08MB11232.eurprd08.prod.outlook.com (2603:10a6:800:2c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:07:13 +0000
Received: from PAWPR08MB9005.eurprd08.prod.outlook.com
 ([fe80::d65b:a08:278:38e3]) by PAWPR08MB9005.eurprd08.prod.outlook.com
 ([fe80::d65b:a08:278:38e3%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 13:07:12 +0000
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
X-Inumbo-ID: 2881d615-97b5-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k9VbruogRqQKruUzGQgpuI30DxHrzD+6RsLf1oNOMUVb2nI7BItbbdJ716U9Q8PCXQByefEzLy2gdPESpWirSa3+UPLzCErs8UCJjQ0txtiAN00fown1DvZSPBjkDvdNCSgqYtGV7Rso4nUtBuWGQ+ZQ3LHv5cxWPQfx16x+CaHkxF0+XELCBGSLh5zaJqjGCdQaUhZ4AWjDgeTC2T6WKk4shwhwE52EHR6EklY+dpybzP6qSF89qhLVz7ZKpFxPkO59OgeBWk190emsBt8O1DdE9PaL2K6JUgvXenygGpHnF+lnW1at1wUASVhyIXxtAvnTnOxsHn5y1d8LVy1txg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixBSqbMwuWoOEI1qMiZBdWmBbeltSvl3nJZX70b5Vls=;
 b=oJOk+m9TMKK3yyeec2S7b+cN5lUVcCoHOnEoSzMqpeFE7qXCcxFtSyOYKQISQtITU8W/cjESZc8nOXTDxV1qxxn706EVyFhNGGNgje/qwD/s8CUwIMZ5lkBi+NM2TckpUA/qh814Bm1iSnLfVnlzD0w/Qp9G3BIy8BVOZ2wGk99U+DX+JzGQ0Yfw9mZ7f9JLjYNAVBBUvvCc4gxdUGu8NZJtbiVk5YUTuwM5zO6Lrr1dRq4PRhmxh2dPUhwBKjehc1qITto+vNdyrBQwO1o+WC65ZxQsqB/xVNNmruDqUEduLrzg/c7S6v8bd8JXd56nFFKUVmR2Yynf+FRVxB474Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixBSqbMwuWoOEI1qMiZBdWmBbeltSvl3nJZX70b5Vls=;
 b=HSzOFLPvOjUsGGtu8+aH9NJylq936a51oQpbayU1eyOCkuptWshatGYeNB5gCEJh+iKuXILVMxKlKc7YFVsaMxCZW/gaYD2Hmiosvob5SqNSbuPzNNcfEJrqcu8h4yZTMoo052EgSUXzLByO+PGn7dUqSASYf2UOv3u6OQ1x7Wo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GObu0iy09reVEheDS7OGDixC084QEbs0EKPfNPgkYLGUIKqXfTYTYdrD/ut7NqLTXYsIY06AbJvCdCMJfp0TizYkn16LXxcTVojK0dHWMVRhmfqUOBzl1gcZlW6dqbkjfvffUvJsUMBNAg93fK2bfpQN8DoStt0pjSsbLWPhATfEk44gYn7mFJCryoF0MfKG7wfIWWq3WqXv98NX8ptHcl9HNjoOid5woRsNdhIdGFEfPWHfYOTPwRT/pD8/1rTCe4aM2mDi4+1YtNEV0ubS6z5lEAMqwxFKnG/MAG3z6xyzq24WwOj87MUyFo0iURDTqhgbWUJxriLOG6Adg+5uZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixBSqbMwuWoOEI1qMiZBdWmBbeltSvl3nJZX70b5Vls=;
 b=syeEUH5EZK5oce9FDOljV4TQIbGXFo1icblAPIutGnpuPQPM1nRbo8wxKXxAYAzenQXoNLGOa+MpBEBRCOv+/YR1PTAbad9k1eUBg+YstUWawiTu2CujJXq3hCOb7fs3XSPDyDQkUJhi0Jy7R8ytnmq/M0bgrtK4sqQZltV6i5QoBIRDBRS59LGFiyZRGatbTWy3Hwix2d7rvNQjAtPK6V0M7RjHxK58CmMwJKLVedOkQ/StaU/pEVYN/VhL+lACqJQznaMlBNKP7PDdL0vIlzaL+R4bUahj1c4peI1HClIbuhaPNZq1AcFo/WnkNgJoMHTM9NJ/VlJxOLM1PYmLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixBSqbMwuWoOEI1qMiZBdWmBbeltSvl3nJZX70b5Vls=;
 b=HSzOFLPvOjUsGGtu8+aH9NJylq936a51oQpbayU1eyOCkuptWshatGYeNB5gCEJh+iKuXILVMxKlKc7YFVsaMxCZW/gaYD2Hmiosvob5SqNSbuPzNNcfEJrqcu8h4yZTMoo052EgSUXzLByO+PGn7dUqSASYf2UOv3u6OQ1x7Wo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v4 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Topic: [PATCH v4 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Index: AQHcEPw+jP/LO+G+sUGc0SEs/4ZL5bSfYZoA
Date: Mon, 22 Sep 2025 13:07:12 +0000
Message-ID: <AC190509-5E8D-449A-AE83-34CC924EF5F8@arm.com>
References: <20250819112709.3789987-1-ayan.kumar.halder@amd.com>
 <20250819112709.3789987-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250819112709.3789987-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAWPR08MB9005:EE_|VI0PR08MB11232:EE_|DU2PEPF00028D0F:EE_|AS8PR08MB9885:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a8ef7f-a61c-4e39-5925-08ddf9d90915
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700021|13003099007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3teFSv7bfkY7O8W3Usp79qHDZJRrQI1LRuA0hZf2fytOwyDD23nUaBRhxXsf?=
 =?us-ascii?Q?o+3YRJ2TfOxB4pfl0tmqvl2N8QkzLjUtYaMlPGywMEd/GeLHEP0b1cFUp8MD?=
 =?us-ascii?Q?uSf5VsC1VPV00PadVNyq3KTqOD7KRNdGYl4hLMDEjKqRPknIRFsr7D1Ij96y?=
 =?us-ascii?Q?VEcg/ioVb2M+faoL1pY8ZAGx97rlY0+P3nMvz45IqiDT5huFfDu6lS8Bm+m1?=
 =?us-ascii?Q?wajXge/rCC2FUT4UyPeFmzzVSWG47K2vsq6CqRB3kLlfVb2eRkRVTeO2xgbQ?=
 =?us-ascii?Q?ZUIVWFjELh/cAN4NJjmw23RpoLaxTyVcv8q7Rvx1b6/guXBw10mePDbRuQnF?=
 =?us-ascii?Q?cJIDb70b+bEVrw4H/6Ove/GhVCi5+GZi8nJ3xL0Cll71u1ZpeNRY2m6wFIZD?=
 =?us-ascii?Q?fIlXYDgvMIghUNOJZKC10slnY8+yalgraOlkiOKgOtaI4G7V5NgOda4NWtQK?=
 =?us-ascii?Q?DdqO5seeF8Hm72PdoxW+Wb5YuMuoAs0vaUZWJprsYMMXXsrjJ6S3hfH72l6q?=
 =?us-ascii?Q?49MHw+f697uoPPSl/z0D//LmiUyYMmk6hssUhhnR7DkpS6lBBt+JS0N6Iafg?=
 =?us-ascii?Q?0t+NpUXcSk6CtQ2Wd/WdkxyoYMGnflnCPEY8xY6bLE48eNBG9Ro9l7sgRzXZ?=
 =?us-ascii?Q?Dt4J5YdWZ8uLuqvrfY54flLJxBQ82VGWefmFbkpNXNjHbK8PFegJbbhYU5pY?=
 =?us-ascii?Q?uvcPXr8Rar6JWh9KgImla+uzk3tZN/KHscwsOW5L1cScKfehwS1fk5OfjXyz?=
 =?us-ascii?Q?lzqEsEbQn/cNcotHhbX5AF3VCEQkqJMlTGLOLEdsqihZe3VBejAZiMonh+qk?=
 =?us-ascii?Q?YAVCB2Yydk/i0voLLdmy/0n2z9QH1iURl4mTlNxRjczcCLe6NVyQBZA5B9y/?=
 =?us-ascii?Q?cU6ufU+y9FR5CF0NlIEmkHODJO2oCviZhqK/vT+pjNUkSMBXuUsS9z3K8M2B?=
 =?us-ascii?Q?ElMB7L2CdN79rE2SwdFxKOxfFtikEVfHOJl+r1X5fsdhmios2zcM6H21nIvm?=
 =?us-ascii?Q?wBr+2ebudQljy8WUv+5byJk2wPlL96P6KrXV7wOY2WBA6daWnDMwx5awIfi1?=
 =?us-ascii?Q?JM+Q7K1qotS0RH9UwCPOPxy1RSGfsoiRIpRCtClO7/DrcJ+/t2XZTS2bc3ZE?=
 =?us-ascii?Q?nkoF4T+BqMPp0/GJZ4TKyuzI6Hl+yUMzsgWt8oYzeVrKHDighxNI+NkmuXmp?=
 =?us-ascii?Q?3HZml59iJD9nwZ5RIK5zXrOe8ieHmC8+BzvD+LUgbL6RSKwYXC7oacZqoG9S?=
 =?us-ascii?Q?jnv43KW+uXsKfbTyjEFW+JF8HXjzpKtq9rl32R2Yqg28rwgEQyOhDMvysK8+?=
 =?us-ascii?Q?nFcYxYbTj6wC8eFct0jIH6wcab/jaUPdWn43PekSNCY2f33pP3gWarPS7niL?=
 =?us-ascii?Q?izENTKIdQxgXsb5p/Ta8NzSB5UY5hLgy1hv4fi1rFg2+9Y/YfS24OLlqz80q?=
 =?us-ascii?Q?PLkRV3me3Js=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9005.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A5539A5C457FCF4DB71A4125CC3C1379@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11232
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eeba0b2d-004c-4f53-fd93-08ddf9d8f240
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|36860700013|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eAoAGsJnxIkdKGfo8xS/OsG6be3Q+S8Z6Lci5DrLRDglaX2KefJcdAGi/0Ay?=
 =?us-ascii?Q?8W5UVCmu0v4BE5kwfAkYVhRZA5KsQsZ8MomqG1Bi/A8WthMYhKcw9Tr/uIXO?=
 =?us-ascii?Q?XsI8OdAJN9w+vTDMWHrevVLowQSbHWpzBUrkaWjO1DPTpsFUyyhgxe2aRl8O?=
 =?us-ascii?Q?kzdVdjkOhdqgy54hKMxRgMKAmM7nRguINyPJINoYFR1QHiNDMSjOzr31l6EB?=
 =?us-ascii?Q?30VsQDucSKTzvG5XWBLWTSZR4MgLXpfQRMJZMnUXoVgD3+POogFYBMkwMMGv?=
 =?us-ascii?Q?qGiUmh6vORp3Fc3EBiYQr7f6iaCIQy0z2x4CXkDN9iC0gIczluTyDaCrWNoA?=
 =?us-ascii?Q?mE8WJbNTu/YVS9x4BHNxvYexJYLndd+8H2QOXTpnBC5jW7GX38B7CppPLVr8?=
 =?us-ascii?Q?AeTGP1xZeOE9rJpMtBE/tZvxf7LrCXnJCv8oWRbi0nbDivlOBwkZjr2Rk3/Y?=
 =?us-ascii?Q?cGMX2jIS3k8nNS9oDbRuUlzlejyol1WZTUO0em3GHBIORk0G6yKs4wEocRkm?=
 =?us-ascii?Q?Ns2mjPFCNCozpZiJdE6jFXso8jH7uHGAGSlqkkiBbCkh8p9u+mtMK5/d8uD8?=
 =?us-ascii?Q?lNeYKrsQzzKLNxztjqiYXj5nHIjCgKReIVtulJUQKsZLvgfJhZlkk8xAT6TS?=
 =?us-ascii?Q?Q3pJGRKfKFbJhK3GmcAa1iw6sJ/C2NTZ7cFkMvC4iKuuv1iK2m9BqlkJG2O8?=
 =?us-ascii?Q?XwgBuPdwLe28KcFQCAITtWrjdnxKbjf2jFZzcv3JcB9J0Jt5zF4xjiyDX/1N?=
 =?us-ascii?Q?OknZT+TR/P1ok8YPnz7pL0pKihKb6JxnglKi+H//ar2FlVIiFlCOOjXoIZHl?=
 =?us-ascii?Q?m0ycwrkqAhixlvHaYJxkYsaPytEUqMvq2xQcH6/xgvD7exOTlE4VkwJ1ndR3?=
 =?us-ascii?Q?NZhep43G2DROeEuBgVADgP/dFE1BRivTHTgkVs4c+HvF8O6HBnZszOPS7yWC?=
 =?us-ascii?Q?RbELQjk+CHtpt6mtFb/nrp1J8bf7cZOTIFkGNv6VD4PiR1Ax8uT5rAZvUeID?=
 =?us-ascii?Q?4wfe6fpGJc4VU7ZdN67nDj7zUCmAuHr6nISJjybyHK4ieh8btq1Mgqk+H0Fm?=
 =?us-ascii?Q?aVo23JDz/KmHQZkxAQ+67pfumNZMcjnLsQwvJHZHBXeD95Zn4WvrgiYe/iRW?=
 =?us-ascii?Q?AkrC9wR89tqvKjYWzQaLhUzN9pr2XBwRwfkU/ubse/B9TLtoEiY1kw1NmcDz?=
 =?us-ascii?Q?bh0Hmaz6eqVHojt6DT3ZjkI7kUcVjhHQlRXZNlbabbIxBa+NiRcgc547IP+l?=
 =?us-ascii?Q?PT3UEBhOIm1kieQvT66y/iL+6SucW3DtDFiw5ejE8Xrk1TNPt9aaVpmTAZl2?=
 =?us-ascii?Q?ZDiHWX04TKpuy7APbTTErC8BNPOGmfzdwJDyIvTYpzBRrBv1JLeenMqKAo1S?=
 =?us-ascii?Q?iPHXQXz+oUL/R7ujWJgQF/bz/Po83Ubjo8uavGaYyW1VHySA0wVJBVIkmCZC?=
 =?us-ascii?Q?2cyh+qdIp3OL3PztC2gf72srBRVdKOxEhpfCAZaWnIaEEaqlZ4mMKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(36860700013)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:07:51.0965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a8ef7f-a61c-4e39-5925-08ddf9d90915
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9885

Hi Ayan,

> On 19 Aug 2025, at 13:27, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> We have written the requirements for some of the commands of the XEN_VERS=
ION
> hypercall.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Looks good to me.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from -
>=20
> v1 - 1. Reworded the requirement so as to avoid mentioining variable name=
s
> or hardcoded strings. Otherwise, one would need to change the requirement
> each time the code changes.
>=20
> v2 - 1. Moved few changes to previous patch.
>=20
> v3 - 1. Removed the internal implementation details from the design requi=
rements
> so that they can be verified by black box tests.
>=20
> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 15 ++++
> .../design-reqs/arm64/version_hypercall.rst   | 32 +++++++
> .../reqs/design-reqs/version_hypercall.rst    | 63 ++++++++++++++
> docs/fusa/reqs/index.rst                      |  3 +
> docs/fusa/reqs/product-reqs/hypercall.rst     | 20 +++++
> .../reqs/product-reqs/version_hypercall.rst   | 85 +++++++++++++++++++
> 6 files changed, 218 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
> create mode 100644 docs/fusa/reqs/product-reqs/hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/r=
eqs/design-reqs/arm64/hypercall.rst
> index 82ecf690a3..3b4af18323 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> @@ -58,3 +58,18 @@ Comments:
> Covers:
>  - `XenProd~version_hyp_first_param~1`
>  - `XenProd~version_hyp_second_param~1`
> +
> +Return value
> +------------
> +
> +`XenSwdgn~arm64_ret_val~1`
> +
> +Description:
> +Xen shall store the return value in x0.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~hyp_err_ret_val~1`
> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/doc=
s/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> new file mode 100644
> index 0000000000..ccfcb35a7a
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Capabilities
> +------------
> +
> +`XenSwdgn~arm64_capabilities~1`
> +
> +Description:
> +Xen shall return xen-3.0-aarch64 to denote that the cpu is running in ar=
m64 mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> +Capabilities AArch32
> +--------------------
> +
> +`XenSwdgn~arm64_capabilities_aarch32~1`
> +
> +Description:
> +Xen shall return xen-3.0-armv7l to denote that the cpu is running in arm=
32 mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fusa=
/reqs/design-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..b05481b9dc
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
> @@ -0,0 +1,63 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version
> +-------
> +
> +`XenSwdgn~version~1`
> +
> +Description:
> +Xen shall return its version when XENVER_version command is invoked.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Error copying buffer
> +--------------------
> +
> +`XenSwdgn~error_copy_buffer~1`
> +
> +Description:
> +Xen shall return -EFAULT if it is not able to copy data to domain's buff=
er.
> +
> +Rationale:
> +-EFAULT is one of the error code defined in
> +http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/publ=
ic/errno.h.
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~hyp_err_ret_val~1`
> +
> +Extraversion
> +------------
> +
> +`XenSwdgn~extraversion~1`
> +
> +Description:
> +Xen shall return its extraversion when XENVER_extraversion command is in=
voked.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_extraversion_cmd~1`
> +
> +Changeset
> +---------
> +
> +`XenSwdgn~changeset~1`
> +
> +Description:
> +Xen shall return its changeset when XENVER_changeset command is invoked.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_changeset_cmd~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index d8683edce7..de19b0cda2 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -11,6 +11,9 @@ Requirements documentation
>    product-reqs/reqs
>    product-reqs/arm64/reqs
>    product-reqs/version_hypercall
> +   product-reqs/hypercall
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
>    design-reqs/arm64/hypercall
> +   design-reqs/arm64/version_hypercall
> +   design-reqs/version_hypercall
> diff --git a/docs/fusa/reqs/product-reqs/hypercall.rst b/docs/fusa/reqs/p=
roduct-reqs/hypercall.rst
> new file mode 100644
> index 0000000000..9fb46cf451
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/hypercall.rst
> @@ -0,0 +1,20 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Error Return Value
> +------------------
> +
> +`XenProd~hyp_err_ret_val~1`
> +
> +Description:
> +In case any hypercall fails, Xen shall return one of the error codes def=
ined
> +in http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/p=
ublic/errno.h.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fus=
a/reqs/product-reqs/version_hypercall.rst
> index b824c539b0..466eb4108b 100644
> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -40,3 +40,88 @@ Covers:
>=20
> Needs:
>  - XenSwdgn
> +
> +Version command
> +---------------
> +
> +`XenProd~version_hyp_version_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve =
Xen's
> +version in the domain's register 0.
> +
> +Rationale:
> +
> +Comments:
> +Xen version is composed of major (ie version) and minor (ie subversion) =
number.
> +The minor number is encoded in the 16 least significant bits and the maj=
or number
> +is encoded in the top remaining bits.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Extraversion command
> +--------------------
> +
> +`XenProd~version_hyp_extraversion_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
> +extraversion in the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSION'=
 command
> +line parameter while building Xen.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Capabilities command
> +--------------------
> +
> +`XenProd~version_hyp_capabilities_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
> +capabilities to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Capabilities related information is represented by char[1024].
> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Changeset command
> +-----------------
> +
> +`XenProd~version_hyp_changeset_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 4) for hypercall (num 17) to copy chang=
eset
> +to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Changeset is string denoting the date, time and git hash of the last cha=
nge
> +made to Xen's codebase.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.25.1
>=20



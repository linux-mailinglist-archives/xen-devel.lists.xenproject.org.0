Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNk1NeKSvmnkTQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 21 Mar 2026 13:45:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04B2E554E
	for <lists+xen-devel@lfdr.de>; Sat, 21 Mar 2026 13:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258695.1552429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3vgd-0008Sf-FN; Sat, 21 Mar 2026 12:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258695.1552429; Sat, 21 Mar 2026 12:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3vgd-0008QU-C8; Sat, 21 Mar 2026 12:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1258695;
 Sat, 21 Mar 2026 12:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtZ5=BV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w3vgb-0008QO-Vv
 for xen-devel@lists.xenproject.org; Sat, 21 Mar 2026 12:44:14 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5a93e28-2523-11f1-b166-2bf370ae4941;
 Sat, 21 Mar 2026 13:44:05 +0100 (CET)
Received: from DUZPR01CA0330.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::26) by AM9PR08MB6049.eurprd08.prod.outlook.com
 (2603:10a6:20b:2de::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 12:44:01 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::49) by DUZPR01CA0330.outlook.office365.com
 (2603:10a6:10:4ba::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Sat,
 21 Mar 2026 12:44:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Sat, 21 Mar 2026 12:43:59 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB6571.eurprd08.prod.outlook.com (2603:10a6:10:25b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Sat, 21 Mar
 2026 12:42:57 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 12:42:56 +0000
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
X-Inumbo-ID: a5a93e28-2523-11f1-b166-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RLsjvEeA88v6x8MWPF9C80DyVjwiwfSs+qQfxa1JlrPoKUG+/pi1E+uuw2ezb72XQvy7ofOaz3l5IU9F8dcNB1KPhKL6o1fzkKs4ENCGv00YNAdRr/w1oP56vyDKFNq7ycbo17o2rAtjWfV0PxWdC7ETb7BO7936xD+W8ST/Td82KRkyzI5U4Gp27qHM2E/NaDv/cTfJiaOQ2ZbP+7WmNxH2HE9jpdTw5v7cvN6B55EEw3c43BqB8JFXHzwx2DA0/usDjH9oYlioooiyhzVfgHT7FkYXA4ikPx8I02uMSvrR9f8eqqOWQ3BHDHGOTuSzSXNjNYoVlimBw88RbTzGbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/8sgATuXLzlazUdIRJKRyTnhxXm7Z1HOy4lA+TMv3w=;
 b=ldpR9KZAvH5ROPU8HpAk8RLdDx8Boe3Wr3i46XTnwthGNds8c0Mo4UmXBNwyW626nNZj0+6d3Tc/ZzFmuTG63VzWvA/JRIM3T7hcN+EW/uLpqJxlh83xNTHPnKc5dmS5KyFXMeQc+S1h4KedlA5Z86fvrf4xtNyGthqoHEHCyHss7kEc2SZQ4IM/ucYLHHKAGuVxIkLUid80yndyEGt1HH6kRxbFHHz4nzEJVk6WvvRYlfitwu9gfV76v0VQtX/CzJ77JI8MP6e0S04tHGjx8OVT6jbLYvdTVe4+u/ZnzIjf6hJCWgrT0Z0R8/LKMCuO3JXWhAfHb9RcJxGZ/bDEDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/8sgATuXLzlazUdIRJKRyTnhxXm7Z1HOy4lA+TMv3w=;
 b=GsDFGSWP30bHGzUe+fHdJJM+hOcFBWjwtc56tO01+hV1aUcqEGBGtM9kzd4qYlYRIxOVEhpJ9h0H1Yw9E/pmE3f5ovBgfrPR8IiW8L2dmiREnUHq8EtZNiKZwOe4dueWQDZxNfakuzxBQu5tApzjFSrJ9cBttDdcZcBsR6ecQDQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/ambHP/XQrBTQVJtHEwj7RoSLj2nJBmUs+yOG9/6Pgs0SVonIO8nGr7AavAuGPE4Zu+3Kzj/rPGAKhVxwOd4+0TYUrc5N40L1eR2Dr68ERmoV1KGGLiUsEm64beIhxgUBoL4O32wNF3LAS58JKkUz8Z2ltbNBbBWKiK+b+cclKtEPK0OX0uIZR9qyMgFJaLkg9oZD4xMsVwX6Y9fA5mt7Yq5j/sfYGDoyIjaZFChAmzvXnsncObSzgIMlyO3/U6gFbJJ6AsgBvbu0OPAHErUDjlRB7gFhUqugYHYgoi/uFOA0NAmVnhHlmELG6KAVts32f77c8yHUDRzoZrUzShCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/8sgATuXLzlazUdIRJKRyTnhxXm7Z1HOy4lA+TMv3w=;
 b=iW6UYY0cXk3EVM/A/jYu8q0FmFFQ/XOKIb0qE5H4ZrdX+8Pz9P8KWd7PR0i/zjFixBlyVn7UyMQoDDzaO/5BMr2+Egp2Q05/bou6WYAKe+mL0cxU5SCAEDRlgty+h2fc+XQoQt6vXjQKo3/2tNn2ck8Ix23wvbEeh7VeQZuQMw9TbR4bfBN2CixSX1fxbVIFmtB9kK3VSwAjkh/ZRLAzcu4E7ZiSgfdM7Ug/V8iZsq2v5yTDtQR3TeHnEw4XnHvAGdtVfbN3N9FdljYagagH5nIQPlO4nH/ef0RWjf0AxWEO/T4/514q26zl5HalOplD8oNsndbZGcqiJNw3VqeQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/8sgATuXLzlazUdIRJKRyTnhxXm7Z1HOy4lA+TMv3w=;
 b=GsDFGSWP30bHGzUe+fHdJJM+hOcFBWjwtc56tO01+hV1aUcqEGBGtM9kzd4qYlYRIxOVEhpJ9h0H1Yw9E/pmE3f5ovBgfrPR8IiW8L2dmiREnUHq8EtZNiKZwOe4dueWQDZxNfakuzxBQu5tApzjFSrJ9cBttDdcZcBsR6ecQDQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Mykola Kvach <xakep.amatop@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Thread-Topic: [PATCH] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Thread-Index: AQHctwleCTTA2E8kAkG0JnS9VhefnrW1exAAgANTmYCAACOzAA==
Date: Sat, 21 Mar 2026 12:42:56 +0000
Message-ID: <68A08948-5683-46EA-B5F9-8C8E0C900F5A@arm.com>
References:
 <3a3180b0f77d815e92c0c232a8f854d34ab7c2ea.1773860069.git.mykola_kvach@epam.com>
 <F2AB3928-C65E-43DC-80F0-1F2F4DDC8037@arm.com>
 <91968fdb-e0fb-43aa-9f8c-994ed733de6e@xen.org>
In-Reply-To: <91968fdb-e0fb-43aa-9f8c-994ed733de6e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB6571:EE_|DB3PEPF0000885B:EE_|AM9PR08MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: dad29c3e-6cfa-4505-b5eb-08de8747863e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 4vv1xG5+lxL8QrT9km5AUwiB3kwqUy5QL8t5+qxgx0QERJ8069KPGiu4Hd6zzaqHfg3K0WgF7lxL1yKh08YWUdIrENpDvb5pDxb8nUBjy/Jh3R8Dm7GXWpaAyG+Ph+rRiUyd+i1wbFZZ96+pL+mSaexIxDjwp62sfLLDj4dOaqkIsr0O/Vw7Dl3xFqjdvLRUZNSh8Ssw5PpTpGctfGuB32tNCImi86Ukk9sODffEulCh0mSjXfdH4ZKtlMHF8yUyi78nb02cg33tSEl5ZQ5P4NRb9LZbIXzsq1QQjaQJFa97nI4q8OkO71DdyQr6MWLDyR/NdndP2+I4fv/pKAmG+MbRtT1K7Bx4oHW0eQpwkxWkxe3DJLqxX93qeBqzkwVGPUb3fSMt6FexAzylqsGB8t2o97T27jbjLxz9+FItD7M1cuOVtIGBqftw3zv1Qr3Pu7bk9XwTCpaSYTH9XkbT4Bs6SFWJ2uIPoac3WQAzHF8fMqb19KeHxNKQoQ0fY33KBkX45IGO7CKGCYZ34DWL9dcMXMbEimI6PqNGS6qCJ1bI//JkLQrE07i1t6rJaowzIku4OqEsLGsgl5Xo/kwuhnmpitmYMsRd3mdh+d3ARf7QBi0BSdqXOtaB0bxHOwiDsqS5Tq2Rj8yfVzIHFsHMncEXhI0fZRau/CQexDCz36iNz0p5/NuL4BdYl3KX90uciQ4XOhSZ/OyyqY8cntuJyruLWWtw+8U3BewlQOh/RKewycSQyrdy0ckaRRwiHc9v
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DE154F9666FD6B4DB37BDF6A9A235018@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 uzRV4OZtLvbt5f3YS216rjBHXbENbGfz4/WAEeVJ62U7QrDxb1YM41F/OOZMjBNyGbt71Y2FOYsMQ9+6G0d3Wvm0fWvk9/KLltZT7LB1Xne3FJG3BROEFcTHDkE7NODZQ7EM1dkrOvNtVhXIcvEr9P4ZWSaku+xPwtwaWv+63NKkNGfm24rp9JINokUDnyRh6D3U3XGhJSv1NJIfq/GJYbX1O7wiXfOIAVpLkaFJrp3SfuQuy1K11yqV2OQPEZDri4E1pCcmMVD1W7UXnboujoJTKsl5E+sUzlrQwW9HFN93u+olo8OD77GgAZvMUukptI0c3u7BSpu5KLNb3SiS5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6571
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e921f625-1f47-4228-02c4-08de8747609e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|14060799003|36860700016|35042699022|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XUYltx2Znu0kjEPbDvBuQaAki4IS+FkgbGT9RwgnwLElU9uyIdF2nO3IjaAtAmKzNzHbWoZcbssoiR8F6qAbx5ysrCI3YurzFrZNXR3S+7AafatWRhIMtdoM1L5gUkBCgKBhwwbXs5Wr+hwwMDxoiCZcQPv8UojLD0DS29FLnuhG0HIAa501ZN3D6Zes/T2LrIU2j4K1hAL6UT0fi9izL4HdZDYdraifs+h7J9n6F/2GjrBMHsGhBTbLgmM53dXbcPtZDsjuT0P+A34ATnqmlY64ULIGbq9uctrNjAavav9pWBE26TBQmKyIj57OyeVI5HuwrFLzwc+jO2qdBoVsMzkwLK4t9C5Sdv+ZvmbU33OwHRqUzaIWkaUP8eecGCbZoJ6W/F/7sVYmYtw/10hqOWgQK0VMcSVEjqe0b9QNRkGAs1Vqgz9j+cqn86UbO6TySz/z/hUiS5fv7G8WdpSkkC7oBUZwXlfDebeDrb7E0tCr5O9CLmBbJcK1F9Awh71Vo2Tcd7OuEr6BlGFhBVc7sLoiBRAEFHvPM/+bbP/yZGmLpyigUFBL+VUP0biXkBAhX52bSMdktXHvYwE2dVGj4Tbu6rYMmzQHbPXdbUuu1irFZbWCorL06vUSlYyvvL+3zjTlFntWyZo7rA2f8AByaABNuRuk6HKhDYVcHn3c1XtqLhetCl77vFZxr0dCU/4Ynp4JYvR4zzSA/ndlp6HM9bo0nrR2kDTAo1Ou/ihQ1PE=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(14060799003)(36860700016)(35042699022)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BNZCbDLDXHcoZmtbgncSvvWRbMkZixbWgUfCeQBsaT6xnoBVgycIOn4SofeCR7NwBvEwW2I5zT21jbg5Q1QyvT5vnD4Qmua8i4v8Czw73Ou+DakhGKXhFT8vBDY4qt0brScKPNdtK+nI8ZN9riTz98SspwMSg2cTw5UV0GDGO9Rk06WIUSXopH2PvI+LTHhee6ilFjt6PRyW9Y9iWiW6OAPNwrq0WGxX+cXUIsSGLO7jokjMXf/fCztOHABy+eobrFQjv5RHEhzUQJ0UcGIbEaXnhFdhzGX2IQpOP16c45MnIZHiIhMcBTx2T7U5yf9JR2R6GYfi3XmuXzvkhnfLuD1aEYpA8yUPnk+p+I/hQ0V8SeZl9jqiXOkykstxwFrCZ3YxLp+vqlltACWDzRNYS9FBV0+z+6pyGcdKc9lEadJxwwiiloCvMy+uOaFoxVTQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 12:43:59.6896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dad29c3e-6cfa-4505-b5eb-08de8747863e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6049
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,epam.com,kernel.org,amd.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,patchew.org:url,xen.org:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: DB04B2E554E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Julien

> On 21 Mar 2026, at 11:34, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 19/03/2026 07:47, Bertrand Marquis wrote:
>> Hi Mykola,
>>> On 18 Mar 2026, at 19:56, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>>=20
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>=20
>>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
>>> using Wn, only the least significant 32 bits are significant and the
>>> upper 32 bits must be ignored by the implementation.
>>>=20
>>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
>>> argument registers as an error. Instead, they should be discarded when
>>> decoding the arguments.
>>>=20
>>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
>>> implementation defined when entering from AArch32. Xen zeros them on
>>> entry, but that guarantee is only relevant for 32-bit domains.
>>>=20
>>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND and AFFINITY_INFO to read SMC32
>>> arguments via PSCI_ARG32(), while keeping the SMC64 handling unchanged.
>>>=20
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> Link to discussion: https://patchew.org/Xen/cover.1751020456.git.mykola=
._5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.=
mykola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
>>> ---
>>> xen/arch/arm/vpsci.c | 15 +++++++++------
>>> 1 file changed, 9 insertions(+), 6 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
>>> index 7ba9ccd94b..1e844ed571 100644
>>> --- a/xen/arch/arm/vpsci.c
>>> +++ b/xen/arch/arm/vpsci.c
>>> @@ -303,9 +303,10 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs,=
 uint32_t fid)
>>>     case PSCI_0_2_FN32_CPU_ON:
>>>     case PSCI_0_2_FN64_CPU_ON:
>>>     {
>>> -        register_t vcpuid =3D PSCI_ARG(regs, 1);
>>> -        register_t epoint =3D PSCI_ARG(regs, 2);
>>> -        register_t cid =3D PSCI_ARG(regs, 3);
>>> +        bool smc32 =3D (fid =3D=3D PSCI_0_2_FN32_CPU_ON);
>>> +        register_t vcpuid =3D smc32 ? PSCI_ARG32(regs, 1) : PSCI_ARG(r=
egs, 1);
>>> +        register_t epoint =3D smc32 ? PSCI_ARG32(regs, 2) : PSCI_ARG(r=
egs, 2);
>>> +        register_t cid =3D smc32 ? PSCI_ARG32(regs, 3) : PSCI_ARG(regs=
, 3);
>> It might be nicer to modify PSCI_ARG to take a convention argument inste=
ad of
>> redoing the same test everywhere, this would make the code nicer and ens=
ure no PSCI_ARG
>> would have been forgotten.
>=20
> I would definitely agree with that. But...
>=20
>> At the end all those conventions are coming from smccc so we could:
>> - use smccc_is_conv_64(fid) from smccc.h to get 32 vs 64
>> - use smccc_get_fn to get the function id without the convention and red=
uce the number of entries
>> in the switch
>=20
> I am not sure about this suggestion. Not all 32-bit call have a matching =
64-bit call (e.g. PSCI_VERSION).
>=20
> Also, it seems that so far the function ID is always matching between the=
 two convention, it is unclear whether this is guaranteed.

PSCI is an SMCCC spec and smccc defines the fid format with fast call or no=
t, 32 or 64 and function id and that is the same for 32
and 64 but there is no enforcement to provide both 32 and 64 versions (for =
example there are some ffa calls which are only available
in 32 bit mode so 64bit version would get an UNSUPPORTED back).

I am not suggesting we accept both versions when only one is supported here=
, we can still have the switch base on function id and
for specific one reject if it is not 32 bit format.

Anyway as said this was more a suggestion than a request so maybe better to=
 skip that for now.

Regards
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall




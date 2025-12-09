Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3010CCAF930
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:11:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181343.1504403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuh6-0005SV-7F; Tue, 09 Dec 2025 10:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181343.1504403; Tue, 09 Dec 2025 10:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuh6-0005QC-49; Tue, 09 Dec 2025 10:11:44 +0000
Received: by outflank-mailman (input) for mailman id 1181343;
 Tue, 09 Dec 2025 10:11:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rha=6P=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vSuh4-0005Q6-ES
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:11:42 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7484683d-d4e7-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 11:11:40 +0100 (CET)
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 10:11:32 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::d8) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 10:11:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Tue, 9 Dec 2025 10:11:31 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB8PR08MB5307.eurprd08.prod.outlook.com (2603:10a6:10:114::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 10:10:27 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 10:10:27 +0000
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
X-Inumbo-ID: 7484683d-d4e7-11f0-b15b-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ChRjUdj9IsJFySsK/IPpFnAisGWBwXnHoOkagBLe1nBSwAfG5xhLY5YoTuJNZ14wL584kuCW2deEpUF37mpywOrWm+G16iO62UNDsJ3PuLnVVAXSKVreQLHutDVSiJdp5gXR3+xxil4yomzHYSy9j6qTCpkyDDUQXygBYWVsocea3lBbooSrqcHqSyarLpntlRkp3UZSmisib+cq6xRyRpaoEgwX2J50mhzNEEcGj3CKfQXlEfWTIDMaA7Fh/QByTxUQ0EOxYKCgqOIAkJMxCpaLlehICJcEdtcxLHqLuzLzcQKtiTEaffxfErjIcWRrJ9mx4SMmoGj7SLmme8Op7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et+xaRsON/DM4yFtAoptGyCY3LG1XOk2ch8yrqMsHrQ=;
 b=LkmZQRDEh0iKAQ4/bH5AjsfFWPJ+TxSPh+SzZrqY8Xqa9RQPQ5wwYqgmlr3ddtnU9hdD/OBN0zCQT06JItGbVRlruNUd4uFQFna03GGm7an8nF4PPwy2eUDiQZ+GOT5IV/MZodPRHp+UyS7vSVbTsa3W1nah0Zt1/BTPCcvQ6gpDtLBsjrMDJyKUOdRlqa3YzS57q7O1BmWxXOxps+BwADQGF2MABp+OuOeW3moF/piAfoR0LHiQc8K1oAbdLyMkQq5+cvBKBwS5tBzdCKw9Q310HJnOnmEgXLLV0p0eCD7vtbMvzfkV/FiuS/O+98xsfkZkPDnL77lD2HF0DUM62Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et+xaRsON/DM4yFtAoptGyCY3LG1XOk2ch8yrqMsHrQ=;
 b=eOT/gNFA215I3nGBH7m6uygEip33mLZ7Ob+3jnL8RNUPz2IDojNLBEcFoc3PJOHSnCrPOC7gM8YAy6CpRNS2lNR7MDU/tlleqZ39SSFQM265SCR7xHzT7UtuGIrY80T8GIQYMNyWwVZf3PV01hejetate38aPnq6uyYT5yBBqM4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YB20o/HhlZCpzzZ5Az9QAA3aIoZj7PpRBJ5urnEg1/wi7tHlWQt8pUawKi35LorBtGDlzTtCm/vzCG7pAuhEvNgr0oKrCM//WoInu4ANIJyY2rHx2xMNVKuL5oLz/SEfZVPY7Jf1CVozZQbz4Hp3hlbDXEn0vW5HFCDRVmDdij/rQ7rlYGI/wOfqMDChbu2sDO+1fmvKmMYYgfDaL8gHaZ0vUxO2xZZoOFdeyH24RBMEy20Li2s1alo1Zdp7t5Q2GBOppdAiOka/7mWRnoOyO9oK/R1hyWtinFZJVdmDgI0rH5C+106BoFhdQe6tQAgDTjlHoX6Yq1HamgXcYr0mtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et+xaRsON/DM4yFtAoptGyCY3LG1XOk2ch8yrqMsHrQ=;
 b=GWIC4k174aKm3Jtpd3ip92Dne/6C9W8a3BN5kANWLQ+O8prHMSZRMndjSAgzpvagnUaaAhgDg6lzEBeNEhecKp8w3rjNNoAab6xJAFI+29Ex1O73xUUzUm4qDSgj9Tq+FYdl25skNtyQCQDIh9a9tqqD/5Pcf7eSaXNAWqMqa2XMkq6Ym9dWNFwiCD5Y+W80SI1/U/NYvVyuaHHeWgxKfiiXkoiYzq+9+IE5JpB57ZglvTH0PJjs/4JWQ78H0AXHmoVFvendPmKjYs/UW1wn86daVJ0tYRSgulW7WKL4ZqVnLaeWjEhtGSIIsdo1+UGkEZkV1yh4vJ7kH+JJK4NoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et+xaRsON/DM4yFtAoptGyCY3LG1XOk2ch8yrqMsHrQ=;
 b=eOT/gNFA215I3nGBH7m6uygEip33mLZ7Ob+3jnL8RNUPz2IDojNLBEcFoc3PJOHSnCrPOC7gM8YAy6CpRNS2lNR7MDU/tlleqZ39SSFQM265SCR7xHzT7UtuGIrY80T8GIQYMNyWwVZf3PV01hejetate38aPnq6uyYT5yBBqM4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v1 03/12] xen/arm: ffa: Fix is_64bit init
Thread-Topic: [PATCH v1 03/12] xen/arm: ffa: Fix is_64bit init
Thread-Index: AQHcZdM4PJInZ7Ib+k6qqA68hny4k7UZGx8AgAABQgA=
Date: Tue, 9 Dec 2025 10:10:27 +0000
Message-ID: <C518918D-1CAF-49D6-BC94-CACEF409E46A@arm.com>
References: <cover.1764930353.git.bertrand.marquis@arm.com>
 <697ab9880767b75c9964ae900a43fd4e065fc502.1764930353.git.bertrand.marquis@arm.com>
 <CAHUa44E+Cgs6WeuSyYi=r1BCzaYN+f9MBoSudyLxkU2LeGxzXg@mail.gmail.com>
In-Reply-To:
 <CAHUa44E+Cgs6WeuSyYi=r1BCzaYN+f9MBoSudyLxkU2LeGxzXg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB8PR08MB5307:EE_|DB5PEPF00014B9E:EE_|VE1PR08MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: f6120fff-ba32-4b8e-dade-08de370b53a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cjhYNjFOZlhWSEhwaFh4dy9iTGRrVGtoVzREVmUyUTdmL2JWbXBlQ2dJTnc1?=
 =?utf-8?B?eXJZblZaWmtJejRjK2dHS1pZcTZDdGRpTlZZRFBUZzk1M0J6S1BnRVNqK0xS?=
 =?utf-8?B?SGpJNUt0NWZuaW1ZQjlYRjdvYW9Yc0hJWjIwZkJ6Q05jTEc5clBLTjVIeFcv?=
 =?utf-8?B?dm9VWXBPcEU4THFFY0lLODVJWWROVkpOUW1QbFQ1c3pmMmpmWHFvR3hmNWNS?=
 =?utf-8?B?UUNVVDh6QXNZeFhwcVpZSGdGbExGbFZ1eW8wSjFNUUpyMUp6Vm53R0JGMm1E?=
 =?utf-8?B?L1kwRCswbUpNb1BsZFNLNllqSHVyNG9qUzJpSkZGQ0lRN1dqRit5MndJbUc3?=
 =?utf-8?B?Q0hlbE5XRVFaK0hGTVhsWUgzRHFFSmJIeEJ4K3ZDMWR1Vm5uazVrNlExTy9a?=
 =?utf-8?B?ZDVRa3BSOE1QcHFuZklkNlF1aTB3VFFxaFlVRy8vekkrSjVNQ05vTWk0dnd0?=
 =?utf-8?B?bE9IUWdVWC9pR1owOG9VOFZUUWlJR0lLUy9XcVFnWVNwb25JbFFyTmxQM2Yv?=
 =?utf-8?B?QWxUUDV3QTFhWGFoYVpmRDNOQlFwemdFNkZtek92QTc3bm8xRzJWcmh5Qlha?=
 =?utf-8?B?eFFxVHJmRDdGSEpOdmh3SVQ2SlIvWGpkVmRpVXpTVXhLUk1tV3NKenBsZVJG?=
 =?utf-8?B?azJCa3JaUG1NbVJReFRNYVFRbEZKclVMclhqNDUzRmN2ODBsb1NzSmhGMWpQ?=
 =?utf-8?B?T21lc3kxTUVQamk1RW9GY3hvZkNkcXVVSE9acHNSaTdzZTFQMVdrWDd3Rm0v?=
 =?utf-8?B?RHZBSTFmNXhubzVEMEFHcTlBREdOU0Y3ZmpwOEd5dWhCb3ZIMmZlTklURk5i?=
 =?utf-8?B?b1cyNzNXL0I3N2xBRGFQOEZUREVOR0gvT2g0bThRYzdMSXkrcEQvdjcraTRV?=
 =?utf-8?B?eVYybGhaY3lEWmVJbFg0VDE3eVFjL2QwM2RxWktCVUVMNzNJTkVkMnd5Yyth?=
 =?utf-8?B?QTV6eVBBSE5uU21PdjVQd3h1SXg4bnUrYlc0WTBIdjBWR0RxSjZLTjRBSEhw?=
 =?utf-8?B?dU42RUp5UitSZVVpZHVxdnhsR1dvV2pXTUdTSlNsYThueTUzNDBVSWo5SWtL?=
 =?utf-8?B?eFJoSitNQ2kybC9WdGdJdnQyQWpZSlU4KzVqcHVBUmd1ZGdVZkFjeGwzLzFJ?=
 =?utf-8?B?TGpiNk4rQWgxVWhGQm5pZ250R3BSYjd5U0VnNHE1QlVaMnBRMlVrb3JxR292?=
 =?utf-8?B?Y0lCak4wd2RyVVZReUphaFdRWFVoYTlSa2s5MURkcjNZd1VMRGp6UjIxRG5D?=
 =?utf-8?B?UlhhbWxvTW5QM2pBMzBVQjBtQzR1c1VjT2x2Y3kvcitZc0JsMVRvSEIvYzFs?=
 =?utf-8?B?d0hqSG9CVVN3NzQ1OEUrUHR0SkJtUEUxMk9Geit2OVZ0UUFlc2tMcTZOb0ZY?=
 =?utf-8?B?cWdGU0lQUDU0a3NMSW9SYzdSOEtwVldaditWZ0t3d3R4U1g1Vit1SURIMTdX?=
 =?utf-8?B?cFcvcXh3Q1hFY2FXSTI3UE0xdHgzd1g5UlVLSllaakIrd05oMWdob01wTXdR?=
 =?utf-8?B?RTVWRm10T0pTZytuc1dKa2dtOGNmYXkxd1JjMk9sRHlxazB2aG9rbktWUkJi?=
 =?utf-8?B?cHFHbHNJbHlBcVVob01Ic2MyMjdJOXZaQUduVmhFNFFvT2U3NDBTaG9zMmZ5?=
 =?utf-8?B?Ry90S3I0TkZkTjcrWUZtUm1adGFvNnNPeE1BV3ZOQWI3dWIyWDVrUHAyWldZ?=
 =?utf-8?B?YUIyVmVja1ZMSlBGSDBJRzNVWVBlVkZkN2pDbUhpbWJiV2xpb0gvaFNmd0xx?=
 =?utf-8?B?eXZiMmo5RW1PcjFUaFpESnd0RXNGMEkwU0psUzZtMU5TOUtUcXFuNEpUZkFh?=
 =?utf-8?B?SlcxZTc0ZkpZVEwyNFRLNXlIRmp4NUxVZThrUi9UL09oQlpHckR3dXU3RFVD?=
 =?utf-8?B?NnpReGtRMnpSS1REZWdwYTEyaE5YVWVKSkluUEI1SGdyYVc3L2dPQktMY2xz?=
 =?utf-8?B?RkxUSjhScE5XZW5PNHNxcmUxMkpIWkhpWVdQcE5hVkFyT2loN3VZbTNLVzN5?=
 =?utf-8?B?QkZ3TGtKWHYxeWlMMzNidEpxcUl1bXFKMnkzM1lwMlRhSUpEbjkxZHh3Z1hz?=
 =?utf-8?Q?4B9HRh?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BD59F1DA25F4F43A7218E6AB0819593@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5307
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4dfb9c7a-2408-4a6c-76e7-08de370b2d0c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|376014|35042699022|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHhpdHFGZjIyc0RjT1c0aU9zd25jUE1wWlZid014Yzk2SEQ2cXlwY1FwMW54?=
 =?utf-8?B?K3p1c1ptSFNVczlOUnc0NE83MDEwd0RHUjluVmt1WGIwMU5NTDFTci9NOWRw?=
 =?utf-8?B?RVRqK3hZQTJqcjhrN29VWWdmR0RaNHFjK0tpbHA1aXFFdzhHVFgvNzBBU2I4?=
 =?utf-8?B?ZUtDdnpDK2w5ZXdrMzNibCtxR3FRY0dyVFBJUEJWb29JTEhzd0tTVlg1VkNq?=
 =?utf-8?B?UVZZYjR0RHRoZ1pMSVJVU2lNRzZtbzBxRTdFb2VWbHJlMS9yZ3Y1dWlxZk44?=
 =?utf-8?B?VDk2eDJraGJXNEtwL21YUVZEWFBianZqaEhWTDF6bDZyWENpRXUvWURCNU4r?=
 =?utf-8?B?c2M1NG1zN3pCblVXS3EwWE5WOVAxK09oMnZVQkdxczJYUFlmMGM5Wml0OHk0?=
 =?utf-8?B?WHZDbCtxeW5uYld4TEtyNGdqeWVZcktPLzIrWkdKWEUrVmRob0hVZUFrNVFo?=
 =?utf-8?B?a1FUSTNoMW41TWpSVmJ0T1hxL0c2a1VLbWhqQVBHQXAzUlF6TndFcEo2bU45?=
 =?utf-8?B?RTJ6NW00NUdrcFIrVWJsdE84emhpcTVtcHJicGhhNTNHUzVQOWVsUklMMjN5?=
 =?utf-8?B?SjhuTGZiWW9YV3VjendZUUFCY1R3UzU1dVMrR3FUVHo5MkdJWllrUWRIdmI5?=
 =?utf-8?B?U2l4RW0wcnJhNVBtdHE3SlFuSnhzbEZZcjQxamkxVXlwTTJMYXA2RDd0aG8x?=
 =?utf-8?B?NkEwUm5GSGR3a255aWJKd0VCd3JwYVh3ajFOZ1RybE9GeDJxbkJRT25SblE0?=
 =?utf-8?B?QlM5emE2dmd4U3YwbjFSeko1d0hLWnFjWVNMTVdqVlpNMmIrWjVIdDFnWDFt?=
 =?utf-8?B?L2kzM2N6a0R5eWUwN05WZVFYS3Y0Rmc5OU1uMzF5TXppT3E1dUN5MXhwNGRL?=
 =?utf-8?B?V0ZqdmlsWU92SDUwS3ZvWG5UcTdoS1l3clZhNXVacWV1RG5OV0FFWkg3RGh1?=
 =?utf-8?B?VnlkNVNSdjYrbTViODNlaHdiMms3VlR3WE5rdFNUZnJqK294L1J1K0J5TmNC?=
 =?utf-8?B?UHBYOGIxMENrY2RlOGY2YzRaaDdDcml2N2NPNnJSWWxGN3gzd05hZlViY0Y2?=
 =?utf-8?B?TlA3Nlh4U3d3WEVhL0hvUEhQU2RZSU5xdTJDajdjUGpxcWhaejVlQW9FaXp0?=
 =?utf-8?B?c1cvQkhnQ05nblBKQUc0WC9xMnZrUUdPV0YzUHZPd0Y0ZmhkdXF3M1ArTDFh?=
 =?utf-8?B?elc3K1NnbmVmV0lXd1N4akg0Y05oM0hQSUlOcWc2SExkZmFFaC9vTG1hUy9q?=
 =?utf-8?B?TE9MY0llNk9zTmNDZXdxR0ZlR3ExZzlZaWNYa3k0TXRyYXRXMnY4ZkhTK2RT?=
 =?utf-8?B?SVVCQUErVzR4VTZMQTdCanpWQXR6UityZUdGbTNRWHI2NW8vTmFTQWE4UzNz?=
 =?utf-8?B?YVBHaGZuQTgzVFpFUWhFNDgvcHpKRElqTm96TVRmQnFNZG9lVzBlaXVSVTJG?=
 =?utf-8?B?OCtMZkkySGFOSUJNWklDVDdhRHhUWHgzWkE4QUZmUFA3b0o4QUtPWGNiQ2Nw?=
 =?utf-8?B?MHNTSFY0Tzc1ZXNFSktMc2xQS2laU2NEL1hZbzUxM1BYcGlHL0VuWlZLNnpT?=
 =?utf-8?B?cys0bE9yc0oyMGtqaW0zRTlPeE84YUdTQkM1WFpuQzQ1V1AxK2NaMW13Zit6?=
 =?utf-8?B?RWp3VUs2cDRtb1pkSWovb29uUXhZWUY3ckp3QXE1c2NmdzBMYVpoQWF4alVx?=
 =?utf-8?B?Z2Z5a1hySDFNMFZPOTU1SkY4UU9KcXFTQkpqeFVqQUJmc0F4c3I3aUZtY09R?=
 =?utf-8?B?MW5BM0xRdHFuM3B4QjhGa1hCd2tVbU1QZ1RZYmxBY0FNY1lDNXh0aVl1NkdY?=
 =?utf-8?B?dFhMWmVxQkc4b29GcE02dHZheUNrUXgrSHJrNi9ONEpxZzhCS0hnNUFuZmx2?=
 =?utf-8?B?SjIveDlSRmljODdKSm92cUZlMlEzV2xkcTNQajc1NWl5VlZBaDVCYTZwQXhr?=
 =?utf-8?B?d0tMMFVNMGZwUTJGSjA4VTdRUEMwLzk3K3lkU21Qb1N0NFhUU1Ftd2I1V2Jr?=
 =?utf-8?B?dkJhb2d0YmR5cTE1b1dmWG9KSDlWTVNSaHBhN04zd0xNc0ZGcHhsanBIMGl5?=
 =?utf-8?B?djRRZi9Yc29ZL1ppeXZsOXlRSEpwS0oxemdIRWlPTWZzM1QrT2xMTGRaWmQ3?=
 =?utf-8?Q?B0S4=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(35042699022)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:11:31.9158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6120fff-ba32-4b8e-dade-08de370b53a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5677

SGkgSmVucywNCg0KPiBPbiA5IERlYyAyMDI1LCBhdCAxMDowNSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBGcmksIERlYyA1LCAyMDI1IGF0IDExOjM34oCvQU0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gaXNfNjRiaXRfZG9tYWlu
KGQpIGlzIG5vdCBzZXQgZHVyaW5nIGRvbWFpbl9pbml0IGFzIHRoZSBkb21haW4gZmllbGQgaXMN
Cj4+IG9ubHkgc2V0IHdoZW4gbG9hZGluZyB0aGUgZG9tYWluIGltYWdlIHdoaWNoIGlzIGRvbmUg
YWZ0ZXIgZXhlY3V0aW5nDQo+PiBkb21haW5faW5pdC4NCj4+IA0KPj4gRml4IHRoZSBpbXBsZW1l
bnRhdGlvbiB0byBzZXQgaXNfNjRiaXQgd2hlbiB2ZXJzaW9uIGdldHMgbmVnb3RpYXRlZC4NCj4+
IGlzXzY0Yml0IGlzIG9ubHkgdXNlZCBkdXJpbmcgcGFydGl0aW9uX2luZm9fZ2V0IG9uY2UgYSBk
b21haW4gaXMgYWRkZWQNCj4+IGluIHRoZSBsaXN0IG9mIGRvbWFpbnMgaGF2aW5nIGZmYSBzdXBw
b3J0LiBJdCBtdXN0IG9ubHkgYmUgYWNjZXNzZWQgd2hlbg0KPj4gdGhlIHJ3bG9jayBpcyB0YWtl
biAod2hpY2ggaXMgdGhlIGNhc2UpLg0KPj4gDQo+PiBpc182NGJpdCBtdXN0IG5vdCBiZSB1c2Vk
IHdpdGhvdXQgdGhlIHJ3bG9jayB0YWtlbiBhbmQgb3RoZXIgcGxhY2VzIGluDQo+PiB0aGUgY29k
ZSBuZWVkaW5nIHRvIHRlc3QgNjRiaXQgc3VwcG9ydCBvZiB0aGUgY3VycmVudCBkb21haW4gd2ls
bCBoYXZlDQo+PiB0byB1c2UgY2FsbHMgdG8gaXNfNjRiaXRfZG9tYWluIGluc3RlYWQgb2YgdGhl
IGZpZWxkIGZyb20gbm93IG9uLg0KPj4gDQo+PiBGaXhlczogMDlhMjAxNjA1Zjk5ICgieGVuL2Fy
bTogZmZhOiBJbnRyb2R1Y2UgVk0gdG8gVk0gc3VwcG9ydCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBC
ZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IENo
YW5nZXMgaW4gdjE6DQo+PiAtIHBhdGNoIGludHJvZHVjZWQNCj4+IC0tLQ0KPj4geGVuL2FyY2gv
YXJtL3RlZS9mZmEuYyAgICAgICAgIHwgOSArKysrKysrKy0NCj4+IHhlbi9hcmNoL2FybS90ZWUv
ZmZhX3ByaXZhdGUuaCB8IDUgKysrKysNCj4+IDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Rl
ZS9mZmEuYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+IGluZGV4IGFhZGQ2YzIxZTdmMi4u
MGY2ZjgzNzM3OGNjIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4g
KysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4gQEAgLTE4MCw2ICsxODAsMTQgQEAgc3Rh
dGljIGJvb2wgZmZhX25lZ290aWF0ZV92ZXJzaW9uKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
KQ0KPj4gICAgICAgICAgICAgZ290byBvdXRfaGFuZGxlZDsNCj4+ICAgICAgICAgfQ0KPj4gDQo+
PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogV2UgY2Fubm90IHNldCBpc182NGJpdCBkdXJp
bmcgZG9tYWluIGluaXQgYmVjYXVzZSB0aGUgZmllbGQgaXMgbm90DQo+PiArICAgICAgICAgKiB5
ZXQgaW5pdGlhbGl6ZWQuDQo+PiArICAgICAgICAgKiBUaGlzIGZpZWxkIGlzIG9ubHkgdXNlZCBk
dXJpbmcgcGFydGluZm9fZ2V0IHdpdGggdGhlIHJ3bG9jayB0YWtlbg0KPj4gKyAgICAgICAgICog
c28gdGhlcmUgaXMgbm8gb3JkZXJpbmcgaXNzdWUgd2l0aCBndWVzdF92ZXJzLg0KPj4gKyAgICAg
ICAgICovDQo+PiArICAgICAgICBjdHgtPmlzXzY0Yml0ID0gaXNfNjRiaXRfZG9tYWluKGQpOw0K
PiANCj4gVGhpcyBzaG91bGQgb25seSBiZSBhc3NpZ25lZCB1bmRlciB0aGUgcndsb2NrLiBCdXQg
ZG8gd2UgbmVlZCB0aGUNCj4gaXNfNjRiaXQgZmllbGQgYXQgYWxsPyBXaHkgY2FuJ3Qgd2UgYWx3
YXlzIHVzZSBpc182NGJpdF9kb21haW4oKQ0KPiBpbnN0ZWFkPw0KDQpBcyB3ZSB0YWtlIGl0IGFm
dGVyIHdoZW4gbmVlZGVkLCBzZXR0aW5nIGl0IGhlcmUgc2hvdWxkIGJlIG9rIGJ1dCBpIGNhbiBt
b3ZlIHRoaXMNCmluc2lkZSB0aGUgcndsb2NrIHNlY3Rpb24gdG8gYmUgbW9yZSBjb2hlcmVudC4N
Cg0KVGhlIGZpZWxkIGlzIG5lZWRlZCB3aGVuIGNyZWF0aW5nIHRoZSBsaXN0IG9mIHBhcnRpdGlv
bnMuIFRvIHVzZSBpc182NGJpdF9kb21haW4sIEkNCndvdWxkIHRvIGdldCBhY2Nlc3MgdG8gdGhl
IGZvcmVpZ24gZG9tYWluIGRlc2NyaXB0aW9uIHdoaWNoIGkgdHJ5IHRvIHByZXZlbnQgdG8gbm90
DQpjcmVhdGUgYSB3YXkgZm9yIGEgZ3Vlc3QgdG8gYmxvY2sgb3RoZXIgZ3Vlc3RzIGJ5IGRvaW5n
IHBhcnRpbmZvX2dldC4gVGhpcyBpcyB3aHkNCmkgc3RvcmUgdGhlIGluZm9ybWF0aW9uIGkgbmVl
ZCBmb3IgZm9yZWlnbiBndWVzdHMgaW4gdGhlIGN0eCBpbnN0ZWFkIG9mIHVzaW5nIFJDVQ0KdG8g
Z2V0IGFjY2VzcyB0byB0aGUgZG9tYWluIGRlc2NyaXB0b3IuDQoNCkNoZWVycw0KQmVydHJhbmQN
Cg0KPiANCj4gQ2hlZXJzLA0KPiBKZW5zDQo+IA0KPj4gKw0KPj4gICAgICAgICAvKg0KPj4gICAg
ICAgICAgKiBBIHN1Y2Nlc3NmdWwgRkZBX1ZFUlNJT04gY2FsbCBkb2VzIG5vdCBmcmVlemUgbmVn
b3RpYXRpb24uIEd1ZXN0cw0KPj4gICAgICAgICAgKiBhcmUgYWxsb3dlZCB0byBpc3N1ZSBtdWx0
aXBsZSBGRkFfVkVSU0lPTiBhdHRlbXB0cyAoZS5nLiBwcm9iaW5nDQo+PiBAQCAtNDMzLDcgKzQ0
MSw2IEBAIHN0YXRpYyBpbnQgZmZhX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+PiAN
Cj4+ICAgICBjdHgtPmZmYV9pZCA9IGZmYV9nZXRfdm1faWQoZCk7DQo+PiAgICAgY3R4LT5udW1f
dmNwdXMgPSBkLT5tYXhfdmNwdXM7DQo+PiAtICAgIGN0eC0+aXNfNjRiaXQgPSBpc182NGJpdF9k
b21haW4oZCk7DQo+PiANCj4+ICAgICAvKg0KPj4gICAgICAqIGZmYV9kb21haW5fdGVhcmRvd24o
KSB3aWxsIGJlIGNhbGxlZCBpZiBmZmFfZG9tYWluX2luaXQoKSByZXR1cm5zIGFuDQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oIGIveGVuL2FyY2gvYXJtL3Rl
ZS9mZmFfcHJpdmF0ZS5oDQo+PiBpbmRleCA0ZTRhYzdmZDdiYzQuLjJkYWE0NTg5YTkzMCAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBAQCAtMzQ0LDYgKzM0NCwxMSBAQCBzdHJ1
Y3QgZmZhX2N0eCB7DQo+PiAgICAgLyogRkYtQSBFbmRwb2ludCBJRCAqLw0KPj4gICAgIHVpbnQx
Nl90IGZmYV9pZDsNCj4+ICAgICB1aW50MTZfdCBudW1fdmNwdXM7DQo+PiArICAgIC8qDQo+PiAr
ICAgICAqIE11c3Qgb25seSBiZSBhY2Nlc3NlZCB3aXRoIHRoZSBmZmFfY3R4X2xpc3Rfcndsb2Nr
IHRha2VuIGFzIGl0IHNldA0KPj4gKyAgICAgKiB3aGVuIGd1ZXN0X3ZlcnMgaXMgc2V0IGFuZCBv
dGhlciBhY2Nlc3NlcyBjb3VsZCBzZWUgYSBwYXJ0aWFsbHkgc2V0DQo+PiArICAgICAqIHZhbHVl
Lg0KPj4gKyAgICAgKi8NCj4+ICAgICBib29sIGlzXzY0Yml0Ow0KPj4gDQo+PiAgICAgLyoNCj4+
IC0tDQo+PiAyLjUxLjINCg0KDQo=


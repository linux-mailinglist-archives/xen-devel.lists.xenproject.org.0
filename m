Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C858CF70CC
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 08:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195826.1513722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd1ap-0007Zs-DP; Tue, 06 Jan 2026 07:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195826.1513722; Tue, 06 Jan 2026 07:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd1ap-0007XP-Ag; Tue, 06 Jan 2026 07:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1195826;
 Tue, 06 Jan 2026 07:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vd1ao-0007XJ-56
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 07:35:02 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d98d794-ead2-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 08:34:48 +0100 (CET)
Received: from DU2PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:10:234::27)
 by DB9PR08MB6569.eurprd08.prod.outlook.com (2603:10a6:10:261::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 07:34:44 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::ac) by DU2PR04CA0052.outlook.office365.com
 (2603:10a6:10:234::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 07:34:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Tue, 6 Jan 2026 07:34:44 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 by PAVPR08MB9625.eurprd08.prod.outlook.com (2603:10a6:102:310::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 07:33:41 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b]) by DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 07:33:41 +0000
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
X-Inumbo-ID: 2d98d794-ead2-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M4ldH6Ir/tZkp/7UNQD7JCsDJqbldxrySSwaUyqPr40fFcufKWmt4YpnAQQvQskBqPyFLuRIuH+/Jp1SSRZLEbOJ3ZBVuBwhb05wT+4bU5P8SFnjG5pUHfC+Z9aPabUhdbN36LIH55e7JIzobiRSky7OdpUwZcnBT5hS256h8sInqBY8bsyF/ajxVh7uR8ZI65j55UjJLa/7n3uWQrAqU5hyczLc+eZ5ywNatARlX/vJlU+6L9brlnF+zQv+60PrfIAtmOIJgnEI5ml4p2vy9J/FQ7VEKYAZM3UIG9AF4DXK+0rBDcvhtEmj6+jic7qcONCJBVw3nFmtMbmkStahiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRSbXfzzqUvu/4SAewuKbw/DWnOhJZsViMucTaOIFno=;
 b=UEeOMPZgq6KdXrBsfSRFj8qQK+Vkk08OVaXmy9rMvcCxTMHlczIqnrqtVfGTxDlW/XD1r2CenixldMLdvi/wGMFdZAUTOJzqUnwuGkZT9AZ1mqumaufFJ+faBW9JWo9/quWLVMvCKylukfmMh8P9HFHa/NPiODddBxttJgu2dAfzrFV14HVrkT6DuobaEOyUHCLmlG0079Ick50qx/6BXfhgq/ubrSbw0BavqG9uDgPH+z3wfYtq1l4Niwo5rx/5ZsyRzTJivOojiqaHiubzloNXIQ+d29HnmwmjvZYPM5cCC8XCdNePTfjCNuoBhbOJk4JpOV9BzIg/wqJtVeeuyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRSbXfzzqUvu/4SAewuKbw/DWnOhJZsViMucTaOIFno=;
 b=MN1FpV8L11xLlAHnFifqMiOJb0duyeugDF+GNjem3sj7D5nk8l6QrHozNjqISSWv4XrzYofa2UAbVi+bQeHIY5tXZfvzsOMWJ90HT4qbqLQVaxkANJ8g7z01bm1zd4q+9wXcj5tzi2Lw0Y8sTvy9jIi0v8vZWkuGpNTnnfooDp8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg5eolmfG7RTjZ1gW5ysfJ3ukRZjSP+/RsCRgBXtGv0WRFr8sZLPwplWuXBV4pmqGAvMA+YWlJxkklUfftBzd6sw5ov9qT1SNFQOxrmTaVYQu+AQhdUfIbQh7q4O1AYaYgktvtiBTjtm4Ra5tR4WEwWMPiH7K5Dbl1hfq8tb3MUwJZbLR6qmP+OtuqWoiGvq407cDagdybI+1zEN5Nsh+1C4+atCzu2RQaPOpsxQkrnjRzCdTzcShkr0Ygsg+xE26C3cIQxMqs3Sri9Z5MWpO9n7l8GMkbb2eDA8rjcqoWXyTZn9U46rvvdZ9NNhP4feCv6h1fMFxHhBYe1G3k9rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRSbXfzzqUvu/4SAewuKbw/DWnOhJZsViMucTaOIFno=;
 b=rvLMZCGVHJuwtJXDn3ekqVDsttYIaDJshfrKORRfYgDkObwO+lm0afAyRw5+jx5TW8JETioS9IrHngyf4TzHjmrPM5uN7FWyymRZTzg9fS2ydj1Y1oZnd22r9+Bq2HXywYlA34vnT2uA2YlbYiN2ZaiekABfX9JQI3ADXlDyBUcLki6SqJlHCQX+01FK6svFUioy5k+v+h7b7vO/MXl0GkxMKkH9URrC3K/T/IEpmaqE2EqbJr/CFAjg06hTe/UgV5sT/8Kkh8HtDIthmCcDP5zH9ATFAohaMerDpI/qnPKxaKxhwRQx+roBoblpGgE/WrzH6inH4BlJNZdipzm2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRSbXfzzqUvu/4SAewuKbw/DWnOhJZsViMucTaOIFno=;
 b=MN1FpV8L11xLlAHnFifqMiOJb0duyeugDF+GNjem3sj7D5nk8l6QrHozNjqISSWv4XrzYofa2UAbVi+bQeHIY5tXZfvzsOMWJ90HT4qbqLQVaxkANJ8g7z01bm1zd4q+9wXcj5tzi2Lw0Y8sTvy9jIi0v8vZWkuGpNTnnfooDp8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan
 Beulich <JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
Thread-Topic: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable
 as much as possible
Thread-Index: AQHcfj5G7fNp7PSkb0GiHPxZx0yorLVD4eGAgADfJYA=
Date: Tue, 6 Jan 2026 07:33:41 +0000
Message-ID: <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
In-Reply-To: <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5590:EE_|PAVPR08MB9625:EE_|DB1PEPF000509FB:EE_|DB9PR08MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f7711f-b581-4b58-4ffd-08de4cf60fef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?obsnU5WKvrUo7fAZc6GhmEa69/If3m8mOa2cvAKdBCpvIzsmPsoYcJD+/7?=
 =?iso-8859-1?Q?2CojQ5hze5bRWroXrhCtiwRkCz9Go81ZG9J7jKWCQH4IgkdjGcJMRGIgFS?=
 =?iso-8859-1?Q?PqjdId+c/Zva4v9DauYFUBogYoQ3RuREtBkTTREpaJghR4LcPktgRwa4W8?=
 =?iso-8859-1?Q?pCStFc8gK4jH97mYRkOdeEkYqtdPjcv9vztPN5NXlV6eOwUFdE5r0Xr3Le?=
 =?iso-8859-1?Q?6usLYoQMDTOZRmWRAyroTkMHy2uAB5rrTzgsdVdlzk02Fx5MhYos4ono9x?=
 =?iso-8859-1?Q?5GDjmZr8GdeB4pUfXmPP0WoClMrxWKuTIA5ew9MHLh+ANjhZ+DjlVTBaOb?=
 =?iso-8859-1?Q?72FsR308OP9IidXd66Lbi2uzJkjwqRRdK1pd8mUkViwgar0h3eW3AOJD/t?=
 =?iso-8859-1?Q?dlAtfhKxNBSu5GjOsPKmjgS+dk88li/81BmlDd4UcpryHkp4IqFxnFCTEk?=
 =?iso-8859-1?Q?d2DjQQEQSf3ln8F6QhWNbt9kTVbxqMz/nFVQHCPzlCqggJNvhKgsZyZSoX?=
 =?iso-8859-1?Q?5NbFsTQNlHSI3ECazqx3J1DLk41jUZ7CJr5WkQDZNmcOGdFkIt9tg/t4Ai?=
 =?iso-8859-1?Q?GzbxOyomaJkSjz+Aq7XbQ3DgvOA7SALN40cI9kD/uif2jocMW4PFEkQcj5?=
 =?iso-8859-1?Q?s3yNusu1Bn1XRIyTsbnbBquGmcYWTRV/010z94F+osq8Ws9BniWnV1vEPv?=
 =?iso-8859-1?Q?DC6sgRFTXODIhzEitHVWlYQvxLYpLDzffmGu/zw2fBucXhlAupAQg3LWdM?=
 =?iso-8859-1?Q?k6oTaWQ+dS8ffX155wsjO3ETgKUgm2rA2SCNs2kN7zn9l08N28bkVjYXCc?=
 =?iso-8859-1?Q?cZKxi2BnDc+vzEGGNGS50Exy864reNma27IggESTIQ0Qqm2byzcvH6b6tT?=
 =?iso-8859-1?Q?FENJZeW9PNIlRJHZt4UBEjkJzzzEOTd2RLS6ekl85KO8XJrjOHJ59SMSdF?=
 =?iso-8859-1?Q?NvXyd4i8xvi84SyCDSBocs5g6HQ3E8zpkJeDUZH+yfGn33KMuQr1K9l8Pn?=
 =?iso-8859-1?Q?nLNG2VmiXJlfZIpfdAjO235ZALDP690fzjJbTzvjE1x3XVbHM8Pz5tb/se?=
 =?iso-8859-1?Q?3UCale3UzovOhKFBqvfHmS/Y+yX+C4Jgx37y572UMGN6zxdytIIeruNNX/?=
 =?iso-8859-1?Q?PYZoUw0xDGEU7n2vuigOenur7gB7slA+p8iYQcp2rWUSSvQFiuM1Sgd5Gm?=
 =?iso-8859-1?Q?XU6WvjVIBPBVZYnYUAH0f4Uu0BQPba6Gdsxb673dBtnGj6x8xRq6iR8cSq?=
 =?iso-8859-1?Q?/Qc6g5WRVYUcna9mYWve6o8Z2DvJFmc/tivWEY69Sy7DLrBWpDDmvSUMv+?=
 =?iso-8859-1?Q?d8C1ZmUVvCe8FVNEtzWUWhnxwX0ca+a1mCxvrep0+hPILhMOHpzQSFmNb/?=
 =?iso-8859-1?Q?3L8OezFG5Hv252P9iuJE3SDEFSPi7TEozcaYaW6bT71qWu2M46PSn/omiS?=
 =?iso-8859-1?Q?5/FW8IuLZhvs4g7pe4rAve3G6YFJyygz4prxcziSiJ7Bix5hA0BLvzzknN?=
 =?iso-8859-1?Q?E1oQUSlfIy4GuMVxzit6eQwSYiyIc/GQGNf5CkSMqFe0TwAqLPG/+8B6mn?=
 =?iso-8859-1?Q?sJ79MVehCYph5d8uEroP3gsye8hJ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5590.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <48AE3827746C4D42BD37529AAF9FF18D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9625
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	099a91a1-2f31-4db3-310f-08de4cf5ea91
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|14060799003|82310400026|35042699022|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?UdASsxJQJ33NAiY9QlMk40yvxPH0ciW1SM8XqVLtO0/RZ+QxI1gqc9XkbF?=
 =?iso-8859-1?Q?X4tORGH1IPaQOJCRxtsi+g93BE7RJ+NqEKFkBHRVE0dwXZvA4F4xMAYvbX?=
 =?iso-8859-1?Q?wms1gtp4tT0gNdNDS1wrsj2BNdeAlRU1wjbei3K/RurUVGSbyXN0mG3rAb?=
 =?iso-8859-1?Q?2u9ekW4laacfzvpdq8Ly5ac4I/nOZ8X5B5EpNjit1sCQT8yLqRpX+CukOI?=
 =?iso-8859-1?Q?0LRBVZ/tm6RFG6FTr2VgTJ7w/pwiWX9LmkZNF1PBQgrLlOmCoJf4xdbQKc?=
 =?iso-8859-1?Q?VlCLf8LNukf1uu5mGU3G52H8WLlgwqxjbU4Kc8ZF8rvJOfIPvZLekSbva2?=
 =?iso-8859-1?Q?IGEvSQorHRHGx5NhF5g8f42kHUptPSjaIl0KCSaplfpc0h4Bf8/NxCSKqe?=
 =?iso-8859-1?Q?H69rjuM77nNk+/9GjJSR7OpDKRuzuEhL4uyU+oG1+5CE4ERdqe8NjScAGi?=
 =?iso-8859-1?Q?pdU4nrlgMFSUid79ja5R2G+lMWHTvREMnbFtike2Oz+FBV0nZsqvotsojN?=
 =?iso-8859-1?Q?iWxluW7OJqspgtWE3Gm89ANu6BoU9klwGjV/fnBrMM0L6EwzxyTTUWFCQw?=
 =?iso-8859-1?Q?N+a0pO02k0TsPK5UZPg1ZzKPDq1vxaf07zUAtNmvaquEwusMFtfxVNPuJ0?=
 =?iso-8859-1?Q?b029mKS8ou/adh6fYN8C+3wGAZXos95G4Ka8w1w76UMXHqVfeJGhSiLloF?=
 =?iso-8859-1?Q?KWkUMqs1zccQnnD6oYSP8JduPQL6jv0AjbPT7m1zeDEr25biJO8MZquKDZ?=
 =?iso-8859-1?Q?u9XjoJ3tXJ8t2DmWziNN/+3g4DRlMKikLqvzZhbx48JIJZEW1vENd0Ulrv?=
 =?iso-8859-1?Q?b27sa0kgI5C9jYWmOqtGl6lDR7w/U9MKuKN1UBWdqUCsmnEVxZoz+tgzrh?=
 =?iso-8859-1?Q?HL7dp7ENsnYMmLgZYIXbuoMI7BwLgwCnaLB0Huuh/y3vqtk/lE9PRGoQ8N?=
 =?iso-8859-1?Q?pyJR65r3ArrF+XIzeRduh5C9I3D7nHcikNzU9rw5ceVxE0t2axbAXuw6Rk?=
 =?iso-8859-1?Q?U9s/jOEZUMn87VsmvJs0xyH5wKwbHPJDiriSRdRuKvYDscqVp0mXe19I9I?=
 =?iso-8859-1?Q?Atkf+dzVkVKl6/5IhkOkdfUv5bqOuaLRjfG1Ae0Q3NESIhO4UW5dpxRfXi?=
 =?iso-8859-1?Q?nVqV5PMdg/q7DUrUz6OMxtM8ODnbbHz4k/8GO67+iUa1ie4SSmr1sJSBWN?=
 =?iso-8859-1?Q?UdwolhAo25A/qbwY0UaLm98ujCU3qtCIQv7xawRHKiE6srZrsAR+1y4yR9?=
 =?iso-8859-1?Q?y6gH4zmf+d3Hp0G8zTyTSO+5KiIdPADqQyZ53Slm4EbjzT3VzT8RHsJfh3?=
 =?iso-8859-1?Q?M+RyH8/Dyfh/hMbjxAr2iP1xUFFBwWJWwhmRyA9zCexVc8vK7atJMbZ3t2?=
 =?iso-8859-1?Q?BpkrsQc1xUyiHUozOSr+L8IPnrK4YaJzIqUDoH+g9eZPmA1IXm3MXU8ION?=
 =?iso-8859-1?Q?HvbaXSKEgHTVtUIg43AfelKomJn9g3kaqCW6QhVWwiQbloWcldsfriQ/F4?=
 =?iso-8859-1?Q?UWNnzKFF+Al53Uk32/1R+nD/mGEiM3M5ZpuBusHBjTe+9q+tzEv/4ylB7W?=
 =?iso-8859-1?Q?OFQe/03mvpvIn4h8lBv7GFMaBwLynYoq5XKpIS/lvuWhvpLOTCB7vVT7f7?=
 =?iso-8859-1?Q?uTtSIgz4yWW+k=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(14060799003)(82310400026)(35042699022)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 07:34:44.5218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f7711f-b581-4b58-4ffd-08de4cf60fef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6569

Hi Andrew,

> On 5 Jan 2026, at 19:14, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> On 05/01/2026 12:24 pm, Andrew Cooper wrote:
>> eclair-x86_64-testing:
>> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>>     LOGFILE: "eclair-ARM64.log"
>>     VARIANT: "ARM64"
>>     RULESET: "monitored"
>> +    EXTRA_XEN_CONFIG: |
>> +      CONFIG_ACPI=3Dy
>> +      CONFIG_ARGO=3Dy
>> +      CONFIG_ARM64_SVE=3Dy
>> +      CONFIG_ARM_SMMU_V3=3Dy
>> +      CONFIG_BOOT_TIME_CPUPOOLS=3Dy
>> +      CONFIG_DEBUG_LOCK_PROFILE=3Dy
>> +      CONFIG_DEBUG_TRACE=3Dy
>> +      CONFIG_DEVICE_TREE_DEBUG=3Dy
>> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=3Dy
>> +      CONFIG_EXPERT=3Dy
>> +      CONFIG_FFA=3Dy
>> +      CONFIG_FFA_VM_TO_VM=3Dy
>> +      CONFIG_GICV3_ESPI=3Dy
>> +      CONFIG_HAS_ITS=3Dy
>> +      CONFIG_IOREQ_SERVER=3Dy
>> +      CONFIG_IPMMU_VMSA=3Dy
>> +      CONFIG_LIVEPATCH=3Dy
>> +      CONFIG_LLC_COLORING=3Dy
>> +      CONFIG_OPTEE=3Dy
>> +      CONFIG_OVERLAY_DTB=3Dy
>> +      CONFIG_PCI_PASSTHROUGH=3Dy
>> +      CONFIG_PERF_ARRAYS=3Dy
>> +      CONFIG_PERF_COUNTERS=3Dy
>> +      CONFIG_STACK_PROTECTOR=3Dy
>> +      CONFIG_UNSUPPORTED=3Dy
>> +      CONFIG_VM_EVENT=3Dy
>>   allow_failure: true
>=20
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12604499722
> shows 122 failures in otherwise-clean guidelines.  Some observations:
>=20
> llc-colouring.c uses binary literals.  These are safe to use now since
> 4.21 with the updated toolchain baseline, but the Eclair config wants
> updating to allow this language extension.
>=20
> ipmmu-vmsa.c has a git:// url inside a block comment, which is
> considered to be a Rule 3.1 violation.  In principle this ought to fix it=
:
>=20
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automatio=
n/eclair_analysis/ECLAIR/deviations.ecl
> index 7dee4a488d45..8f5fc6c93bc5 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is negl=
igible."
> =20
>  -doc_begin=3D"Comments starting with '/*' and containing hyperlinks are =
safe as
>  they are not instances of commented-out code."
> --config=3DMC3A2.R3.1,reports+=3D{safe, "first_area(text(^.*https?://.*$)=
)"}
> +-config=3DMC3A2.R3.1,reports+=3D{safe, "first_area(text(^.*(https?|git):=
//.*$))"}
>  -doc_end
> =20
>  #
>=20
>=20
> but I've not tried it yet.
>=20
> There's a R8.4 violation against __stack_chk_guard.  I think this wants
> deviating locally, because it's a fairly magic construct.
>=20
> Other than that, there's a smattering of violations.  Some will be fixed
> by some work I've got pending for the x86 side of things, but most are
> specific to arch/arm/.
>=20

They are quite a lot of violations coming from ffa.
I have a pending serie on FF-A waiting to be reviewed/committed.
I can push something to fix the findings after it, if that is ok for you ?

I will retrigger the CI from the branch corresponding to my serie and work
from there.

In any case, very good thing to activate all those and check with the CI, t=
hanks a lot :-)

Cheers
Bertrand

> ~Andrew



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D5A9F0C4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 14:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970659.1359297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ne8-0002NX-2r; Mon, 28 Apr 2025 12:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970659.1359297; Mon, 28 Apr 2025 12:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ne7-0002Ly-W6; Mon, 28 Apr 2025 12:31:39 +0000
Received: by outflank-mailman (input) for mailman id 970659;
 Mon, 28 Apr 2025 12:31:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVu+=XO=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9Ne6-0001wv-5v
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 12:31:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f403:2612::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4fa0f9a-242c-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 14:31:28 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB7571.eurprd03.prod.outlook.com
 (2603:10a6:20b:34a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 12:31:26 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8678.027; Mon, 28 Apr 2025
 12:31:26 +0000
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
X-Inumbo-ID: b4fa0f9a-242c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIOoD2UFsRRgGS1K/hO4fYaKrBbE3kTMxSqp2+KX/ZoEhO3rfHVQVKkdpJbtVLbauqfd/yz+zMEkLu8Dhj/ZJGZx9nlP+GkTheE8qeh177sTiEWWFnFNp0TdoqGn1OCB528m1GFTOZe1DLaUoXWRHL8M08fWU6Dp3RROBqvlCaOzVuvegSO8TIVz7ZyFF4ojx4v8Pn18FuS1kPyCj/XsKKuLGduPlH/M2v+fSX1kjPmMI0NrW+GyaaunMG25N3Bs7epYTGuOsVatwyiyPvhD1MPNWIgO6MBtYegNVnLH6U0+2xX9MoiO0Zok4JrF8CHTKyhY3D4mqVovUxb+Fr3BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSfS/nSVwbcHXz+/paH3aLyOFemEgtrEVVHwb3u4g40=;
 b=bu5OJMb3979EHZ+2bnxarEAToRKU01xQoWv6DyNJFB35w8XGVqkoLSalsQSUVFg4dTaY5OHF9moMFepyXxx7uG3OsV/lxd1K6AcArkK0EkTWlyf6cbgdgtvw0UBwxl64pIFeSCwSvueh80g0HZeWUFaoxGd85ePQMH8a006lLsceqRvtQPZLwYpZgEgtSx9zE33apE4CJ0rijWBkfjY3pIZxU8Y10l4j1wzg5OvoylpDq8YkvKpiZnX5Vv/l4OfODyjTXjAJ8XtPeXYkS+mpEaoJWFqnFlXP16dbptnodQ2km08jWX/BHdTMymhTcK6CPlUlaCON7F0r6jHRpOShBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSfS/nSVwbcHXz+/paH3aLyOFemEgtrEVVHwb3u4g40=;
 b=dlWsfumkMFqByq4IzGo3ZF4/w2n5+nIXZpmIDrayG7BA8BQnBS26Hn0qAQgsx/8GeZ7FQbbwz8cKOZmHuLtTFNq4IOPFvQYDKz9BmfRH/1rQqoNzDyjlaBZlq6FHrEcH7e7iisB1zrfkHzwUPtlwjJbjV9SuTTpe3VVjjPGrY1V2pBIlOJBtoMUgeNNMHpzGuWgoirbRzHETdsGZ9g9ven5qiOsPIy+9aRjbFeQiAIetd8Dn7hMJvmPoEGO+EgKBi4piTAPO0BSg4F79eUlyCCCFsO3DYbmbGTvTGVbEIxT7hh4ioy8dK7LDSEUJxUACaohBkHWypXC9RD+i7fw/Sw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHblOXdxbIbbkNtn0WSg/9tW2OJ47O5DGKAgAA8u4A=
Date: Mon, 28 Apr 2025 12:31:26 +0000
Message-ID: <ae2c8d37-e350-4125-921f-3d320c28d6cd@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7d376741-ff23-4618-83bd-415c8d8fa24e@xen.org>
In-Reply-To: <7d376741-ff23-4618-83bd-415c8d8fa24e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB7571:EE_
x-ms-office365-filtering-correlation-id: bb048c86-afdb-4356-2c40-08dd86509821
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZkVvem5Pazh5R3JVZ2c3dHBMd3p6VnZUTUppL1lRU0l2akIyYjBRSTlEMldZ?=
 =?utf-8?B?YStRWkhHSE1xNVJzaHhkeUNQSVRsbGwwVjFoODRoaFA4QUJEbzc1YlJTL1JC?=
 =?utf-8?B?bW9TbE9SNjV1ODkzVGpiTVRVMjRUa21ydHRKNWJHdFoyWStIZkFKaXRaSE1s?=
 =?utf-8?B?VTRyc0VXaGJhWkhKSkJwZWRkbjY2N1JwSWlCQ3pOeVlEM0pURFVyNkpRMFl2?=
 =?utf-8?B?TllUenp6WmZiUFFYQXNPOWpzMkpFek5RcmwvaThpMWlSUUJac2VhRXNQOVpY?=
 =?utf-8?B?V2pVRUI1bmtCYzA2ZEtPV3piNnFncFRzb2NUN3NQM2FEZ0ptcUlELzlpalRO?=
 =?utf-8?B?YzE4RXpJcS8vY3FMN29ISXF3Q25lckdyZkNtV1VTd2U0cHFSeGFDcW45VGJV?=
 =?utf-8?B?ZktzQWZKaUpxY2RSQTVXdDJKY0VwRTlnWXcxSUcrdW5EdnhWc2dUNUNpaVQ0?=
 =?utf-8?B?UnVETkxjS0ZhT0pNdDJCQ0dONWRDOCtRRGw5UGN0aWpkRzJjMStVVW9KOE5C?=
 =?utf-8?B?WkltTTF6UjJtazZ3cmQ4TXIyVGUrMXlFUDFsOTdVL2xUR3BhbHIxNUJiemxP?=
 =?utf-8?B?UjdTM1MzbkUxYjY3YzlxVUNwUmE3em81RlB3OUN6Qk1qSVY1a0tZa3BFVHl0?=
 =?utf-8?B?M0s2ekdnS1JhWnI2d01HMHFqOHJ3UHdjbFRFdDlNL01HWVFvc0ZhY3JNQ1Y1?=
 =?utf-8?B?b1FUbDFtbURRUkVaK3pwWEM0N2U4VDY1S1BmZGU5b1RqS1p0Vk0zQ0dsNHAy?=
 =?utf-8?B?Qk9QUng3bnRZSEJsZ0R2T1FsckhyVmxQQUw5UGlKait2a21VNXZvVU1LMG5s?=
 =?utf-8?B?Mkk3TEhhNGVnUHhQeE5IeTdBNXN5dWk5cnlmaEFKMCs4VTRDMGJHbFA1cXVH?=
 =?utf-8?B?cWZzVUlqSEd1Qnh1eWVJWmx2MlhpUWt2dXNoNUNodUlpVUdtV0xYLzRaMUI5?=
 =?utf-8?B?RnliTWk1UlduRGJrbEM1c25nVmhOS1NHM2NtVkxEclRFSndySFNwcndtNThh?=
 =?utf-8?B?SWF1Ym9IMGRrYzJkR0tyaUdYeWREV0ZxdmhsOERQUUEzMVFGTFNlY3M0cGNR?=
 =?utf-8?B?YmdjQlZwVHdsVndocjZxSURTcjZYajh6WTZzUnhwMUcvNHlyeTRuVVhzNnQ5?=
 =?utf-8?B?TDJLSHczNmwrODkyNS9ZdWw0anpiV3IyaE91UElzRnkycnZNaGZkVDE2aloy?=
 =?utf-8?B?dE1aNldnN3lMTVZVRUJuUW91Z3VPZklQdkpTSm1IMlVKa0VxWWs3Q2FGZ0dj?=
 =?utf-8?B?aU1OdyswYU10RUdHWUpSNHkyVEZac0krNGpmRGV4UWV4bE5QN0wreHUwYXEv?=
 =?utf-8?B?czdJM3FKNVdmN1ZWZ243a25UTnFWYWt5QllFaUtmUGhUaTBzNlVTWG9MWU50?=
 =?utf-8?B?Q2xTMlhzanZVc0RqeVBhai9ycVR3ajlrSUd4cFo3TjdzNURaUGI3Z05NZk5a?=
 =?utf-8?B?djhQTzZBWlNEZlhHWm40NjFtTVA5aDNFeXVaUHgwYmhoMmNWQm5kMGhldDZn?=
 =?utf-8?B?UTQ2Z1poVmpzTlFWaGtOWHV6cTRQWFJiTkRHdDJsbXc0T3BaSmpqMExyZjFh?=
 =?utf-8?B?YXp0aXM2SDNrQVZPdDNkeTNOLzRXSFJBK1dFN2RoRTlaU3NPOFZJendETmc0?=
 =?utf-8?B?cmtOZjUxMnd1VjRKNlM2cUJsbGkzV0RGYWltWW8wc3ZsaFVEYTRvaDlad0s2?=
 =?utf-8?B?YmNTcDl3djFlOUNRWVlFV0hscG9OSkhZM2pVdzhzZmNUMVByeC9YczV4SFBu?=
 =?utf-8?B?UjV2T2NkNUtWVVFtSGpoNDg2Nmh4RXhvRVBTbGswaENkNHMyakFsNEE2bFdx?=
 =?utf-8?B?UE5VTUxvM0JWZG1MWDhubzlGVkFzQTJFeCtLL29UK2FPenMvajkzUElmaHNu?=
 =?utf-8?B?VXpVREF4bDluRkVubHA2MHVudmNKYlhaeUNqK1dEMEpWTjlMYjhTanNHemQ0?=
 =?utf-8?B?MmFLSXJPVEFTUjg2Qk5vck02NEZKR0wyQTZnTldobDRlbXA4Wk5seWd1N08x?=
 =?utf-8?B?b0dnMjFTU2l3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aE1haGVvQWZqRTZBYy93ZXJoWlRxYjViVkFGNVFDR093SGNaUG1HVjRLVmNr?=
 =?utf-8?B?TmRiVEZYUi9rcWF5aitWZ1c1TXdKU0hZRVZjM3UvblFoYm5GT2tSdVN5ZVEy?=
 =?utf-8?B?RFZPTm9OeE1QZVk5S1ZVNUd6R1IxRzhNd0tRRllYY1ZZTDVDRDMrQXF0V3Ev?=
 =?utf-8?B?aEFvbXRVTExIa1AwcTNyNDkvMzcxcU1XY2FUNi9RRDJpMGRNWFlJYmtNSldQ?=
 =?utf-8?B?UWpNczFqcUo1MmZOMUt1QnpDWnNCTFliNzJWQ2loTVIzZTJDUE1TQk1IL0NY?=
 =?utf-8?B?bjNCL0sxcUlzeTVzQkdoVE1LTHVVMzlESlBEdVZPZjVPczNBVWV1Y3pCS1Na?=
 =?utf-8?B?UUNCeDd1dTFDUTgvVkVyMDI5MURrOWRVYU5jald5YkoxYWd6MnB0bDIxZkxE?=
 =?utf-8?B?SDhyTnAvQUVFOGI1LzBYblFDSWRoYkNEN2g1eXNmM3BFNkRyOWpKdnNCK3NM?=
 =?utf-8?B?Y1BoV1V5ZXNWZ0p3a2lBaUpQa3JzZ3pJNFBoYzFwU0YrTG5ncmFUejRmNUpP?=
 =?utf-8?B?THdoTlZHTVRuU0Y5UlBzajg4N3lxV0R0bDA2Y2JUNXVqb1ExNWRXbjg5bUE3?=
 =?utf-8?B?TDNXTG14VUFGMkFoL2hiSXFvQWtmcFRSYnV0UG9aZHJuZS9OU0xvV1FKZVNH?=
 =?utf-8?B?QnIzQm0vaVh0ZlUzVFdCWk44aGhBRUsvNXBvYWRyTjNtVEdoRjAxNDFFNUkv?=
 =?utf-8?B?eVBzVlNYVmM4L0ZaeklhRFhpS1Qwa0liVEIyakJuTjZiZkZZYnVpMldUWXVu?=
 =?utf-8?B?ZjdIVjhnR2k4NDAzUVAvRVZQdGJ2cHcvVWFlem1PRzQrOEd2dVVETVR0eEFU?=
 =?utf-8?B?NmdKbG54OHFTRitqejQwemU5TStKcHQvK0hhMEEwenNYTnMwKzRmK1E0VnhG?=
 =?utf-8?B?VzFNVnBRUm10S0p1VVYwMmQyM0llRkxvQURpVWNlUlM5OTJ4NmM1TVluUnpJ?=
 =?utf-8?B?SjNPNGJEK2dZaWludzZGQUNrdG5DQjI4d1Jnb29MYkQ3MklPc2lVZ3hzS2NH?=
 =?utf-8?B?YzlaZUE5V0Z4eWxmSk1DUWUrL2E4YnFUY0t6QTZ5eEs4TEoxS3ZsMU5VQjFt?=
 =?utf-8?B?UktvT21FN0FnNkVjbi9TNW9yZU93dUJ4MWV0WE5yYzlTbndlK1I1bEc0aENM?=
 =?utf-8?B?Ylk5VmtNVE53Z1NDc1VRbXVVR1FBVUZYbkJ5aGVRaXNOVGZwRGRacS9tYlNN?=
 =?utf-8?B?NVhHdUNFdGtlM2MwUjFOSzMza3lNMDRUY2pyQm5ldGhVOEZvKzY2cDBCekxx?=
 =?utf-8?B?SjVCMnp0bzEvSzhBWUU3Sm5rcVcrb2J1MFdDVUpYUlFCWS9zODhDV08vNjAy?=
 =?utf-8?B?dzR4eFVqcjFmOGdkWEt0d1Fyc2YyQ2dqYXZ6aTNzT0JJdVJDbVhsVG9MMFNJ?=
 =?utf-8?B?MkZSNEs0UVdjZ0FDTjc0a01rNFNjMVVCTWdHNjIzSkdvd0NWbXE0azkrcjRU?=
 =?utf-8?B?YVl6TFp4VGxFNVI0dHNURUs0N2Vka2t3TVFERmNBREIrNVlHckRJTzlyS2Vo?=
 =?utf-8?B?TExKcHZFTzQyMkZtc3ZlOTdoRmg4V24vRXMzUDFWVi9ZWFBubkN6c2h0WmtO?=
 =?utf-8?B?a3hTVmw0cmoyeG9ZcnRiTTZFNmxDbFg3QitHcHlncHhSZ3NBNXlFSW1oRWRt?=
 =?utf-8?B?Ymg0aW4zWTFxYjB5RjdnNGd4K21uYzZpcldtU1V4MUFFcG1SMXgvUjUyNzFP?=
 =?utf-8?B?SHlJb0Zrd3A0UDJ4M21IWDh4L01YRS9NSVVFV0xyNkYrbmJGYzdNc0lrazBu?=
 =?utf-8?B?Wm41Ykg5U0hyT0JKOERERzA5Ymd4ODhINmZwbnFRTVpmWkhjR0twMjU2bE82?=
 =?utf-8?B?MlVoalROUWd1NGFMRVZMV2xKTEpEQnJMSHNsVnN1L1p2MDFld1hPM1RDNkg3?=
 =?utf-8?B?cDNPckRkSjM0alo1d3N1UTQxY2o5RDZxWWlxcmFCVHdUanVqdXZRZUYrSHJ0?=
 =?utf-8?B?cGRmajd2Y1JZdDdpT1BVMmhTY2xzTkRBN290WEoxVTBhN1NmNlQ0aVp5UjBV?=
 =?utf-8?B?ZTdydW5JL0lJR3lERkk1M2luQmZDYThvTUlaeExMYlVmSGZleEJhOTVjTjZ1?=
 =?utf-8?B?SWprSHNoVXVGVnlBV3k3bjVycDJod2Z1SCtWVkFENFdJVkZSODBxcmJaTUxW?=
 =?utf-8?B?Wk5vblltQVRUQ2k5VDlxQUJHcHg3aFR3ZUErK1YzNXNjN04yOVpycENnN1Zu?=
 =?utf-8?B?eHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09994C174DAC2440BF09F992DB9AA7D5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb048c86-afdb-4356-2c40-08dd86509821
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 12:31:26.3726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSx4sZnTSbRYyv4SpKISdHLfIegvz3QfaN5B0gG2uAxliK+jo246d9X9uaEv8crOiwRy8au2T+c1Ga7K4vPCJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7571

T24gMjguMDQuMjUgMTE6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgTXlreXRhLA0KPiAN
Cj4gT24gMTQvMDMvMjAyNSAxMzozNCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBGcm9tOiBT
dGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KPj4NCj4+IEVu
YWJsZSB0aGUgdXNlIG9mIElPTU1VICsgUENJIGluIGRvbTAgd2l0aG91dCBoYXZpbmcgdG8gc3Bl
Y2lmeQ0KPj4gInBjaS1wYXNzdGhyb3VnaD15ZXMiLiBXZSByZWx5IG9uIGRvbTAgdG8gaW5pdGlh
bGl6ZSB0aGUgUENJIGNvbnRyb2xsZXINCj4+IGFuZCBwZXJmb3JtIGEgUEhZU0RFVk9QX3BjaV9k
ZXZpY2VfYWRkIGNhbGwgdG8gYWRkIGVhY2ggZGV2aWNlIHRvIFNNTVUuDQo+IA0KPiBJdCB3b3Vs
ZCBiZSBnb29kIHRvIGV4cGxhaW4gd2h5IFhlbiBjYW5ub3QgaW5pdGlhbGl6ZSB0aGUgUENJIA0K
PiBjb250cm9sbGVyLiBBc2tpbmcsIGJlY2F1c2UgdGhlIHJlYXNvbiBpcyB0aGUgUENJIGNvbnRy
b2xsZXIgaXMgdG9vIA0KPiBjb21wbGV4LCB0aGVuIHlvdSB3aWxsIGxpa2VseSBuZWVkIHRoZSBz
YW1lIGFwcHJvYWNoIGZvciBQQ0kgcGFzc3Rocm91Z2guLi4NCg0KSSB0aGluayB0aGUgbWFpbiBy
ZWFzb24gZm9yIHRoaXMgaXMgY29tcGxleGl0eSBhbmQgdGhlIHBvc3NpYmlsaXR5IG9mIA0KYWRk
aXRpb25hbCBkZXBlbmRlbmNpZXM6IHRoZXJlIGNvdWxkIGJlIGV4dGVybmFsIGNsb2NrcyBvciBy
ZXNldCBwaW5zIA0KdGhhdCB0aGUgUENJIGhvc3QgZGVwZW5kcyBvbiBmb3Igd29ya2luZyBjb3Jy
ZWN0bHkuIEkgd2lsbCBhZGQgdGhpcyB0byANCnRoZSBjb21taXQgbWVzc2FnZS4gUmVnYXJkaW5n
IFBDSSBwYXNzdGhyb3VnaCwgaXQgaXMgYWxyZWFkeSB1c2luZyB0aGUgDQpzYW1lIGFwcHJvYWNo
IChhdCBsZWFzdCBvbiBBcm0pLiBUaGVyZSBhcmUgcGF0Y2hlcyBmb3IgZW5hYmxpbmcgWGVuIG9u
IA0KQXJtIHRvIHBlcmZvcm0gYnVzIGVudW1lcmF0aW9uIGJ5IGl0c2VsZiBieSBMdWNhIEZhbmNl
bGx1LCBidXQgSSBoYXZlbid0IA0KeWV0IGdvdCB0byB0ZXN0IHRoZW0gaW4gYSBtZWFuaW5nZnVs
IHdheS4NCg0KPj4NCj4+IEVuYWJsZSBwY2lfaW5pdCgpIGZvciBpbml0aWFsaXppbmcgWGVuJ3Mg
aW50ZXJuYWwgUENJIHN1YnN5c3RlbSwgYW5kDQo+PiBhbGxvdyBQSFlTREVWT1BfcGNpX2Rldmlj
ZV9hZGQgd2hlbiBwY2ktcGFzc3Rocm91Z2ggaXMgZGlzYWJsZWQuDQo+IA0KPiBFZmZlY3RpdmVs
eSwgd291bGRuJ3QgdGhpcyBtZWFuIGRvbTAgYWx3YXlzICpoYXZlKiB0byBjYWxsIA0KPiBQSFlT
REVWT1BfcGNpX2RldmljZV9hZGQ/IE90aGVyd2lzZSwgaG93IHdvdWxkIGRvbTAga25vdyB3aGV0
aGVyIGl0IA0KPiBuZWVkcyB0byBjYWxsIFBIU1lERVZPUF9wY2lfZGV2aWNlX2FkZD8NCj4gDQo+
IENoZWVycywNCj4gDQoNClllcywgSSBjYW4ndCBzYXkgZm9yIGV2ZXJ5IHN5c3RlbSBidXQgd2l0
aCBQQ0kgaG9zdCBiZWhpbmQgU01NVSB0aGUgDQpQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgY2Fs
bCBpcyByZXF1aXJlZCB0byB1c2UgRE1BLg0KDQotLSANCk15a3l0YQ==


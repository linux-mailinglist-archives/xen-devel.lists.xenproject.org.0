Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3CAA0B44
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972305.1360674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jot-0001gs-6x; Tue, 29 Apr 2025 12:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972305.1360674; Tue, 29 Apr 2025 12:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jot-0001eB-36; Tue, 29 Apr 2025 12:12:15 +0000
Received: by outflank-mailman (input) for mailman id 972305;
 Tue, 29 Apr 2025 12:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkRs=XP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u9joq-0001cY-TL
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:12:13 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c201::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ced8407-24f3-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:12:10 +0200 (CEST)
Received: from AM0PR10CA0092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::45)
 by DU5PR08MB10611.eurprd08.prod.outlook.com (2603:10a6:10:519::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 12:12:06 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:208:15:cafe::e8) by AM0PR10CA0092.outlook.office365.com
 (2603:10a6:208:15::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 12:12:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Tue, 29 Apr 2025 12:12:05 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 12:11:32 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 12:11:32 +0000
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
X-Inumbo-ID: 2ced8407-24f3-11f0-9eb4-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ii0rA+AdmgGnaCSvWw6vJMgWeMhzxs0ZRlKaUHanXZdl+NAtdi5ANq+ERNoSMCji7z7D4TCx72evTNaBuzjz6uAhkLAIEXMNvUDu50p1g9bUqZwMyC8rOqiwzuPbTx8mO2QhyKDAzRVfYT2ilwK5LS/uj2i+PIsGoq1emU6gOBR0h1Hec+A1Y8uqEerfvKI+gFxTpjUWZcaQ+Vfx6b0hRNS7zPm24LsAJpEwdn1b5VR0w+5TdLIE/Tih3a3MWApU0abUjpM3CBEoebNaXG+1V4B77dA/e1nRxa40ScYUqUnq2iRxe7r/9Dh0qNa7nlYJbtAyaop01yv+obQly/woKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mowOPD5oIW5OewRgMIrVTFCwYQi6n9pxGWenuRl0O8g=;
 b=U7WkCuMXdj7pmrLSPtPVmia4gyCFYW3SBcJp6H5GFggmNjs2iVZ7NRVFUcHDVwQThHn01gSbvZnHL9aqiVNmsPCgombd/MwfOGej4Gn9SxL/I1IOwf5h4BfUjbsAXI31HBLOZwxZ67fC+Evxca/uA9EOmiJYQkYOfo+DyMjphmbZkCHQUzNO060a3Kq+bIZBftmWD1QL+JM0UN3ZLsxotY2EIpcUfXvIvNdwdHUI0lE1F5alfARe5ZPHBxEshVGrYOElgNZ9dyQfjm8dYKbTdiaAh4R2jFduIHkvooBRop7gQqDhhz34cdmTMz7ygCr7Y/1XaKmfYZPq2BOdWLigxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mowOPD5oIW5OewRgMIrVTFCwYQi6n9pxGWenuRl0O8g=;
 b=SOdzIBcG5HiB1PdYlRhe59NtnYE6I+Y77zw5zzEL1/z4HiQ9aMb3pW/fAk4V8D11r8Vf2dEzxPffCHkgPy8yJqEQlXkub8GzkKIt+doIfjXjXWUpsG1KjHtGbHOOlNoPxgZ65ctV934n/5ac2Z1x4FDz5QT57Pf2p42ZtS5bQeo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaNv6qEx7vTZ1y2yYd9Bvsti/imAw/Hz/6jK0T1JEukF7iSzFPCKjSwu0OmezdPinGhwn+0KmtKEfpIM3Z59CInAyDjUS+CCJk+ocflOfToOhXOGkAjjsiRpwpmrNhwpa4z2k1nXxJdQovg28Ld6DYUZyBh/fZgAZVejUKq1rMK316Vu7Bk03U8bby2IZkpkbYL9esRzrpwsgp8+A5jjRx52YEZ4bi1DbhskqU2MNQEWw/D89I7/BuBs0QLvLpsUuXyDkAYvRHBw1kiyIPCIyAov/gui2Y+OtxNu6bsYYLc6xOKEXn2I0zBJmYT+gLmnSRPzUE2BtOaB7p6K9Eh9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mowOPD5oIW5OewRgMIrVTFCwYQi6n9pxGWenuRl0O8g=;
 b=nNGcTz6egwDsZ3OKJ0JTDzDQJ7JwAk4wJndW2aX1xQIq5DY+gvBGVohzpiS6q1oYzGZeyAMw3ryDiNpRyNUOd23ODUYNk5VgknTTlKeV/IpXvtsaebVvBbbsNnoI8nCuNjz8kUAu3Tz1Zv8twzu1JLVlpL16VRWYFK5ps4krCteTNh4gN805xt1aPYsZeNBW5vzUSXqh7MjMeKNPi/J7YyMDuil+U/1KKwrHCQZBgVruqz5JZp+kuSHrVMhSf8BSzE/bPO97Ma69bXVPODJoPRdEGHhZSNZ203hGSBWOFnFTtZ0PKduqTk6j870HzsPiuF1Pt3Fl2SNmlBnIwlrVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mowOPD5oIW5OewRgMIrVTFCwYQi6n9pxGWenuRl0O8g=;
 b=SOdzIBcG5HiB1PdYlRhe59NtnYE6I+Y77zw5zzEL1/z4HiQ9aMb3pW/fAk4V8D11r8Vf2dEzxPffCHkgPy8yJqEQlXkub8GzkKIt+doIfjXjXWUpsG1KjHtGbHOOlNoPxgZ65ctV934n/5ac2Z1x4FDz5QT57Pf2p42ZtS5bQeo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Thread-Topic: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Thread-Index: AQHbr7FEzJkzCX7IxEuG28e/+R7zurOo3KoAgAt3HYCABS1xgIABHSuAgAABxgA=
Date: Tue, 29 Apr 2025 12:11:32 +0000
Message-ID: <DD4D78CC-511F-4F72-B512-1DC181446E0F@arm.com>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
 <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
 <cebb0020-531f-467c-bc81-54d2ba1aa8e0@amd.com>
 <2697BC06-8A78-42B4-9977-07907BBBDC3D@arm.com>
 <388f39ad-6aa6-4b95-9941-334b434ff400@amd.com>
In-Reply-To: <388f39ad-6aa6-4b95-9941-334b434ff400@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB5877:EE_|AMS1EPF00000046:EE_|DU5PR08MB10611:EE_
X-MS-Office365-Filtering-Correlation-Id: e86de927-38be-490e-2b77-08dd87170e78
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NWRkTWEwSGVqazdFZGdMczNXQlJmSEh2K3BTai9QQU94NVdiWTdWVFlCVEx4?=
 =?utf-8?B?aWRxdk5qVjBCS01TR0xFU1R4OExjREFPZ0xONFV6bnVXMDRKakpUK0dVazl0?=
 =?utf-8?B?emdMZlJSLzE5dXlnV2VpR0V1YmNBSlFVVjZqVk0xWVU0RnB1QzdBbmlJeDQ3?=
 =?utf-8?B?RlZJaHFWV0RLc3lzOGJLbXVwVFdyeXpUcU1RYVdvUmVIVk1MaDBlN0hHL3NW?=
 =?utf-8?B?U1lFbHNyU1A5MEFZcGxlN3hPNFZkN09ES1RWaEFnRDFUY2hJclZEZUZ6OEZj?=
 =?utf-8?B?eisyc2RUUXZsMmJhbVFJVWVEVEorL1BXd1lab2JOQTNCVk5scFdkSjA1VEJH?=
 =?utf-8?B?KzdqNFZMdnpRVE5VeDJrOGtmV2hONjd4YWZ5WUtMcEZpK2dQdld4NjVkMlAy?=
 =?utf-8?B?cmtzT3gzVDBrT1dWRWRmS2tnRGcvT2hCb0ljZkttbW0zVGRTNDR1RnVTblY2?=
 =?utf-8?B?eHF2SXRsa1Z6cnlYQTFESVBzVVhLcGF6QStvYzl2anRBcTA1MmI4WVRQeG1S?=
 =?utf-8?B?Y1ZzdEFObmozT2x0anFyUDVzVFJMMXpiTUNsWW9GNjVnRnZoVXJ2SHVGMnJO?=
 =?utf-8?B?QmptdXYvSnJVUlZNUGJCVERNc256NHdjY2ltUm5pQkdjdGpLZVNaaHZoZFBp?=
 =?utf-8?B?Tk1IYmJ1ckovemxFeU15SEttaVVzR2tNOFVESWNZSzNUT3d5UGUyYnVOVC9t?=
 =?utf-8?B?Zk9UUlJaK2JFOUg1UUdXdjV0dzJzMkJIQUYxbCtjelFDL0t6SzhSS2xORC9M?=
 =?utf-8?B?VlY1RnNtVExKRTZud3czdDdIWXdnbUVGV1pVVmpndXNLcmpGYiszRUVxem80?=
 =?utf-8?B?WWYyYUdTSUpqYTFuZ2VIVXJqWGpjOFRPMXNucHQvNWI2T2pjbXBCdmZxbXZa?=
 =?utf-8?B?TndRbzdxbCtHOW55dTBlYldJdWFvZ0ltTUViS08zUENRREl0eDZBVG5hWlVT?=
 =?utf-8?B?SDVqSXVucGsxYWNLaSs5bDg0eU9uZGo2Q2tKOFFyTFlaMVM3QlByeHZSZ3FJ?=
 =?utf-8?B?K0s0MW9odk4vUlc5dzNUTnBXbUg4cEs4Qy9yYXdPeW9hVUVmL2Jkdi9hM3Nt?=
 =?utf-8?B?ajVuWkhPMnBVTGlEaCsyNEVDcWNOL1pZN0FZQ2cvZlAveW9QK2IzZmRsYUts?=
 =?utf-8?B?bWhUWUQvR1R1YUFFN3dPK3V5UWhrbC9ycVR2T3A5ckxRZDdrMFFHK09TSzBQ?=
 =?utf-8?B?dFhIdlRhNG5oRFlCYmRwNHRwWFBUTE96cXNyODhGbmZyN3UvUEdiTVRRMXZF?=
 =?utf-8?B?L2dyM0oyWENzblIxZVBpaENRVmNjVE1FWEZ3N09YZllqbXhjNTlCbU1jSllq?=
 =?utf-8?B?Y0pWVnRsSGtQcnJ6YU5wbVplTWI2WTg4cUtxTXpBK3gzMVN1a3VNd01jYmlV?=
 =?utf-8?B?Vk1ROVBPUy90dUtMTENKRFNoRjVDa0kxZ01TaXo3UjFFM210djhwcjd1dSsv?=
 =?utf-8?B?SlZ6TkdoamtaQk5kYThiVEEvb3h4T0habXpSd2JIdE9Bc1orKzQ0UkRvd3Jy?=
 =?utf-8?B?SmxMNmZZMll0ZHhmdFdnVVlGc2Q5NHZTcU5YdCtpNmdaVkNnTkRtOUZDV2R2?=
 =?utf-8?B?TWpjUXJPcTFkT1Y3K3VRUWtjejI4TlhaMVQ2azJqUzlyb0NuS1ZFWlZ5RWxC?=
 =?utf-8?B?Um9tWXgvZWpLQ0tuZ2xvanE1VUR1MDJqR1F2NjNUY1M0YmdwaG1abjkyQWFt?=
 =?utf-8?B?U3NYMTc0dmpkZHZVelNvQk9abGI4VlEvSTB1Z0FJY3c4S0trRy9OaGZ6bzEv?=
 =?utf-8?B?WGlTMmFyTFBNSkhjYWhBdXhBWFZ1MTIzUTBBSlB6UHFETWZlSGVBWmg5UllG?=
 =?utf-8?B?L05wU0hEb2JZWUJvL1lFWEhseE1UQ1p4RXk2N0lTbytnNHlhbkc3RHZPSXV5?=
 =?utf-8?B?ZldQNlZNRUM0UTVWckt3ZGlHbmdXOTlSazNsVEtvblFhWURnMGhkTzBzWUJa?=
 =?utf-8?B?SnRvdTdTbDZTSnJ3cDQzcGNITTgzWGhFV3NydTlZbmRHY3E0TjhSeFFQNEkv?=
 =?utf-8?B?Nml5ZjZveG93PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9D28F8791561C44BCA54BB1E57020EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c3f0bf7-25e8-43b9-8813-08dd8716faee
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TW9mRmY2UVF6a29PSDZwZmZveUtOT1F5T0p2SDFVZytMRWRrUGh1TU1JcTQv?=
 =?utf-8?B?N0Z1K2ZIcXJGYjYxai9nOGFxRjU2L1FoN3hRalV6alhBU21ZZmFLcWJkYU9k?=
 =?utf-8?B?OG1mYjl1eHgrZ1VJQkVrNEc3ejRoZ0lhSEU4cWQrYytZV0l4dWh6Z1ZEUzk3?=
 =?utf-8?B?bDNUSjQzNFdOQkQvOEpSV3pkUzdqZFhQVUdXc2cwZVEvUStKejJleStRYzNx?=
 =?utf-8?B?K3RRQ3hRZTEwWkptMmdsL0tzNG5ha2Fjc0NDV2FlOTdJUU5vWkd0ZUhVYWQ5?=
 =?utf-8?B?QzlTeTBQQ2tEVUgwbFlZWHF3RUhWVkNxNG11NXpacEFXSEJobHFDUVd2T2dX?=
 =?utf-8?B?dk8rUlZZNm8rT0JGMjRIaUxiQVRyYUhad2JrcFluOVE0cTl1YTZITWYrUnZO?=
 =?utf-8?B?SWpDV3NFWmRRRk1YNjVlaHp3dm9aOWNUc0xlYS9qS05oUmFPMUdCWWlNL0pR?=
 =?utf-8?B?TWhjN3VRaWtyMDZHYzJ6QXhqd2QySVllWkJtS0l4bVcvbGovdnFtdjJRNlRx?=
 =?utf-8?B?VStCTC9sTGY4clMvMlZSNWJlazAyVVlZZEk0dEJmelEvVFZycjVaTFFERFpW?=
 =?utf-8?B?QlZXa0U4YUZyWHprUExzbDI3aXlWeGRFOVFYNUhCU2tvUTNmT1RvQzNQRDZK?=
 =?utf-8?B?bHVNZjN6SXEvOHROb0JYZ0VsOWpvUVpYemxBcHBZUE1tYytjRWZwZHdUMjhE?=
 =?utf-8?B?QUNLV2lGR21nRzVCRSs0VWJQUXdsV0F3aS9xTTFtSXUrR21RUjF0YS9UaENx?=
 =?utf-8?B?enNlbUNWOHZGcGF0WVJPK2xacWVTWldtNzEySklkZk5heHBGSU1lYXlaNmw5?=
 =?utf-8?B?Tkc4WVhFYTJGMjdhcWt4aE1PQmYxYXJmNjNlYXc3RG1YeklJandvUllWMDFK?=
 =?utf-8?B?ekxSRFlZeTUwZ1FYa2JqQW1sSk1NdFVmM0tJSSsxMDhEYUQwWXBrZHFRYUhp?=
 =?utf-8?B?Vko1c2ZyeDB1bXNaNnU0blZTWkJxNGc1ckQvTVJRcHRxdEFvZUQ4a0VtSWpB?=
 =?utf-8?B?bnJTdk1yNzZvcjZaaVdTN2VVbkNWTmxSbVRRRmgwNEthSlpuYXVQdTl6dEFY?=
 =?utf-8?B?UWxiTmRVdXU1aG5xL2FPVXlRRHIrcXQ0dkJZVGZNeWh0b2FwYWFFa01JZTBM?=
 =?utf-8?B?Ly9BdmZ6NWxWRUNNVnJmSEFkbEIyYXR2djNJb3VWMExhZW0yeW1DcS9iMjk2?=
 =?utf-8?B?cE5ZSURrMGE4Z0dFNHFYUFJoa2NteFdpeW5rSnZIZzJnVWZWRTZvNXFaQ1Jx?=
 =?utf-8?B?QVRzOEpGQkN0ak8wQUM1d0dOYW1rVmdRYlpqK0J5TVZyWDU4aWt1a05jWGdG?=
 =?utf-8?B?KzZzaEV2UU4zblVuUW9vaWJMR0N2RnUxZ0pvZEFvSmE1ZURDUUphZlpxTDAw?=
 =?utf-8?B?YmZqTUltRXVscWlMbjg0VVU5YVBJUk5nbEZKVG0zMnFBcFRlUXI5R1pnYTBQ?=
 =?utf-8?B?VE8rTW1HSm4xTTJEbUNiVWxyZjN2Z3RHa0hIa0c1cm1jT0dSeTdUNElPa09j?=
 =?utf-8?B?N0YrRDJydnVDdGQ3STl0ZkVPZzMyZnAzaUhSLzRrNFp1YVhjUUxFaWlRQklp?=
 =?utf-8?B?OUpYVS9HL0hGN2UvQ1NKeGJJUlpGaTJNNi9HQ2JlL0FxSkZsK1lsbzZSSGVz?=
 =?utf-8?B?TVByOGFFeExOK1R6YVBDMVp1TjhYdlc0NFhSS3Q3endvUVRXV1c4SmRNTmNE?=
 =?utf-8?B?VmE2S2NDM1IvbWJIM3hOYm9aMGxlbXBsTmprV01IdVhvS2FDWXNDc1BYTUxr?=
 =?utf-8?B?VitHbWVkb2xncXFmdWNNSWNjSDI4VVo5NkZCSFhuQXRuS0JpRTBaRUpwcVRh?=
 =?utf-8?B?NHpVbUFBMWRlc3JZbDR0bWMzTUFqTkZ3eXlGQmVwZU5KZTlScjhqSHppWC85?=
 =?utf-8?B?S0VocVZDa1cxcVBFTXpqdDByNTd6SkxkT0U5VHJIRDY0T1VqQUM3R2dUQm55?=
 =?utf-8?B?ZCtacjJrR1ZWWmlUemVRVWpoMHFXTWZLR296STVsMUNTYkRGRnlNSmNxWndD?=
 =?utf-8?B?VkFUTjZDK2JONW5La01iUDhDYXRSQlA2VnM1NzROcjF2ZndtbzVVMSt4MGxV?=
 =?utf-8?Q?X361+d?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:12:05.2164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e86de927-38be-490e-2b77-08dd87170e78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10611

SGkgQXlhbiwNCg0KPj4+Pj4gKyAgICAgICAgLyoNCj4+Pj4+ICsgICAgICAgICAqIFRoZXJlIGlz
IG5vIGFjdHVhbCBucyBiaXQgaW4gaGFyZHdhcmUuIEl0IGlzIHVzZWQgaGVyZSBmb3INCj4+Pj4+
ICsgICAgICAgICAqIGNvbXBhdGliaWxpdHkgd2l0aCBBcm1yNjQgY29kZS4gVGh1cywgd2UgYXJl
IHJldXNpbmcgYSByZXMwIGJpdCBmb3IgbnMuDQo+Pj4+IHR5cG86IEFybTY0Lg0KPj4+IEFjaw0K
Pj4+Pj4gKyAgICAgICAgICovDQo+Pj4+IEhtbW1tLCB0aGlzIHdvdWxkIG1lYW4gc29tZW9uZSBt
YXkgbWlzdGFrZW5seSBzZXQgdGhlIGJpdCB0byAwIGJ5IG1pc3Rha2UuIElmIHRoZSBmaWVsZCBp
cyBhbHdheXMgbWVhbnQgdG8gYmUgMCBvbiBhcm02NCwgdGhlbiBJIHdvdWxkIGNvbnNpZGVyIHRv
IG5hbWUgaXMgcmVzMCBvbiBhcm02NCB3aXRoIGFuIGV4cGxhbmF0aW9uLg0KPj4+PiANCj4+Pj4g
VGhpcyB3b3VsZCBtYWtlIGNsZWFyIHRoZSBiaXQgaXMgbm90IHN1cHBvc2VkIHRvIGhhdmUgYSB2
YWx1ZSBvdGhlciB0aGFuIDAuDQo+Pj4gT24gQXJtNjQsIG5zID09IDAgYXMgaXQgY2FuIG9ubHkg
c3VwcG9ydCBzZWN1cmUgbW9kZS4NCj4+PiANCj4+PiBTbyB3ZSBjYW4gY2hhbmdlIHRoaXMgb24g
QXJtNjQgYXMgd2VsbCA6LQ0KPj4+IA0KPj4+IHVuc2lnbmVkIGludCByZXMwOjI7IC8qIG5zID09
IDAgYXMgb25seSBzZWN1cmUgbW9kZSBpcyBzdXBwb3J0ZWQgKi8NCj4+PiANCj4+PiBATHVjYSB0
byBjbGFyaWZ5DQo+PiBGcm9tIHRoZSBzcGVjaWZpY2F0aW9uczogIk5vbi1zZWN1cmUgYml0LiBT
cGVjaWZpZXMgd2hldGhlciB0aGUgb3V0cHV0IGFkZHJlc3MgaXMgaW4gdGhlIFNlY3VyZSBvciBO
b24tc2VjdXJlIG1lbW9yeeKAnSwgSeKAmW0gbm90IHN1cmUNCj4+IHRoYXQgd2Ugc2hvdWxkIHJl
bW92ZSBpdCBmcm9tIEFybTY0LCBzbyBJIGRvbuKAmXQgdGhpbmsgeW91IHNob3VsZCBoYXZlIHNv
bWV0aGluZyBvbmx5IGZvciBjb21wYXRpYmlsaXR5LCBtYXliZSB0aGUgY29kZSBhY2Nlc3Npbmcg
Lm5zDQo+PiBjYW4gYmUgY29tcGlsZWQgb3V0IGZvciBBcm0zMiBvciB3ZSBjYW4gaGF2ZSBhcmNo
LXNwZWNpZmljIGltcGxlbWVudGF0aW9uLiBJIHRoaW5rIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHBy
X29mX3hlbmFkZHIgd2hlbiB5b3Ugc2F5DQo+PiDigJxjb21wYXRpYmlsaXR5IHdpdGggQXJtNjQg
Y29kZSINCj4gDQo+IFllcywgdGhhdCBpcyBjb3JyZWN0LiBTbyBhcmUgeW91IHNheWluZyB0aGF0
IHdlIHNob3VsZCBoYXZlIGFuICJpZmRlZiIgaW4gdGhlIGZ1bmN0aW9uLg0KPiANCj4gKysrIGIv
eGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+IEBAIC0yMjEsNyArMjIxLDkgQEAgcHJfdCBwcl9vZl94
ZW5hZGRyKHBhZGRyX3QgYmFzZSwgcGFkZHJfdCBsaW1pdCwgdW5zaWduZWQgYXR0cikNCj4gICAg
ICAvKiBCdWlsZCB1cCB2YWx1ZSBmb3IgUFJMQVJfRUwyLiAqLw0KPiAgICAgIHBybGFyID0gKHBy
bGFyX3QpIHsNCj4gICAgICAgICAgLnJlZyA9IHsNCj4gKyNpZmRlZiBDT05GSUdfQVJNXzY0DQo+
ICAgICAgICAgICAgICAubnMgPSAwLCAgICAgICAgLyogSHlwIG1vZGUgaXMgaW4gc2VjdXJlIHdv
cmxkICovDQo+ICsjZW5kaWYNCj4gICAgICAgICAgICAgIC5haSA9IGF0dHIsDQo+ICAgICAgICAg
ICAgICAuZW4gPSAxLCAgICAgICAgLyogUmVnaW9uIGVuYWJsZWQgKi8NCj4gICAgICAgICAgfX07
DQo+IA0KPiBJIGFtIG9rIHdpdGggdGhpcy4gSSBqdXN0IHdhbnQgdG8ga25vdyBpZiB5b3UgYW5k
IEp1bGllbiBhcmUgYWxpZ25lZCBhcyB3ZWxsLg0KDQp0aGlzIGlzIG15IHByb3Bvc2FsLCB5ZXMN
Cg0KPj4+Pj4gDQo+Pj4+IE5JVDogSXMgdGhlcmUgYW55IHdheSB3ZSBjb3VsZCBnZW5lcmF0ZSB0
aGUgdmFsdWVzIHVzaW5nIG1hY3Jvcz8NCj4+PiBUaGlzIGxvb2tzIHRyaWNreS4gU28gSSB3aWxs
IHByZWZlciB0byBrZWVwIHRoaXMgYXMgaXQgaXMuDQo+Pj4+PiArDQo+Pj4+PiAgIC8qIEFsaWFz
ZXMgb2YgQUFyY2g2NCBuYW1lcyBmb3IgdXNlIGluIGNvbW1vbiBjb2RlICovDQo+Pj4+PiAgICNp
ZmRlZiBDT05GSUdfQVJNXzMyDQo+Pj4+PiAgIC8qIEFscGhhYmV0aWNhbGx5Li4uICovDQo+Pj4+
PiAgICNkZWZpbmUgTVBVSVJfRUwyICAgICAgIEhNUFVJUg0KPj4+Pj4gICAjZGVmaW5lIFBSQkFS
X0VMMiAgICAgICBIUFJCQVINCj4+Pj4+ICsjZGVmaW5lIFBSQkFSMF9FTDIgICAgICBIUFJCQVIw
DQo+Pj4+IEFGQUlVLCB0aGUgYWxpYXMgd2lsbCBiZSBtYWlubHkgdXNlZCBpbiB0aGUgbWFjcm8g
Z2VuZXJhdGUNCj4+Pj4gdGhlIHN3aXRjaC4gUmF0aGVyIHRoYW4gb3Blbi1jb2RpbmcgYWxsIHRo
ZSBQUipBUl9FTDIsIGNhbiB3ZQ0KPj4+PiBwcm92aWRlIHR3byBtYWNyb3MgUFJ7QiwgTH1BUl9O
IHRoYXQgd2lsbCBiZSBpbXBsZW1lbnRlZCBhcw0KPj4+PiBIUFJ7QixMfUFSIyNuIGZvciBhcm0z
MiBhbmQgUFJ7QixMfUFSIyNuIGZvciBhcm02ND8NCj4+PiBZZXMgLCB3ZSBjYW4gaGF2ZQ0KPj4+
IA0KPj4+ICNkZWZpbmUgUFJ7QixMfUFSX0VMMl8obikgICAgICAgICAgSFBSe0IsTH1BUiMjbiBm
b3IgYXJtMzINCj4+PiANCj4+PiAjZGVmaW5lIFBSe0IsTH1BUl9FTDJfKG4pICAgICAgICAgIFBS
e0IsTH1BUiMjbiMjX0VMMg0KPj4gd2UgY291bGQgaGF2ZSB0aGVtIGluIG1tLmMsIEkgc2VlIGlu
IHlvdXIgdjIgeW914oCZdmUgcHV0IHRoZW0gaW4gY3ByZWdzLmgsDQo+PiBidXQgc2luY2UgdGhl
eSBhcmUgb25seSB1c2VkIGJ5IHRoZSBnZW5lcmF0b3IsIEkgd291bGQgcHV0IHRoZW0gdGhlcmUu
DQo+IA0KPiBZb3UgbWVhbiB0aGUgYWJvdmUgdHdvIG1hY3JvcyBzaG91bGQgYmUgbW92ZWQgdG8g
bW0uYy4gSSBhbSBvayB3aXRoIHRoYXQuDQo+IA0KPiBKdXN0IDIgbW9yZSB0aGluZ3MgdG8gYmUg
YWxpZ25lZCA6LQ0KPiANCj4gMS4gQXJlIHdlIG9rIHRvIHVzZSBQUkJBUl9FTDJfKG51bSkgYW5k
IFBSTEFSX0VMMl8obnVtKSBpbiB0aGUgY29tbW9uIGNvZGUgKGllIG1wdS9tbS5jKSA/DQo+IA0K
PiAyLiBBcmUgeW91IG9rIHRvIGludHJvZHVjZSBpZmRlZiBpbiBwcmVwYXJlX3NlbGVjdG9yKCkg
Pw0KPiANCj4gUGxlYXNlIGhhdmUgYSBsb29rIGF0IG15IHYyIGZvciByZWZlcmVuY2UuDQoNCkkg
d2lsbCBjaGFuZ2UgbXkgaW1wbGVtZW50YXRpb24gdG8gaW50cm9kdWNlIG9uIEFybTY0IFBSe0Is
TH1BUl9FTDJfKG51bSkgLT4gUFJ7QixMfUFSIyNudW0jI19FTDIsDQpJIHdpbGwgdGhlbiBwcm90
ZWN0IGV2ZXJ5dGhpbmcgd2l0aCBDT05GSUdfQVJNXzY0LCB0aGlzIHdpbGwgZW5zdXJlIHByb3Bl
ciBjb21waWxhdGlvbiBvbiBib3RoIGFyY2hpdGVjdHVyZS4NCg0KV2hlbiB5b3Ugd2lsbCBpbnRy
b2R1Y2UgeW91ciBjaGFuZ2VzLCB5b3Ugd2lsbCBoYXZlIG9ubHkgdG8gcmV2ZXJ0IHRoZSAjaWZk
ZWYgQ09ORklHX0FSTV82NCB0aGF0IHByb3RlY3RzDQp0aGUgY29tbW9uIGNvZGUgYW5kIGltcGxl
bWVudCB0aGUgY2hhbmdlcyB0byBidWlsZCBvbiBBcm0zMi4NCg0KSSB0aGluayB0aGlzIGlzIHRo
ZSBiZXN0IHdheSB0byBlbnN1cmUgd2UgYXJlIG5vdCBibG9ja2VkIGJ5IGVhY2ggb3RoZXIgd2hp
bGUga2VlcGluZyB0aGUgY2h1cm4gYXMgbG93IGFzIHBvc3NpYmxlLg0KDQpQbGVhc2UgQGp1bGll
biBhbmQvb3Igb3RoZXIgbWFpbnRhaW5lcnMgbGV0IG1lIGtub3cgeW91ciBvcGluaW9uIG9uIHRo
aXMuDQoNCkNoZWVycywNCkx1Y2E=


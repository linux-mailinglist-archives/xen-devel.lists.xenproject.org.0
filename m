Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCF7AABE9F
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 11:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976907.1364016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCEKX-0000sr-JW; Tue, 06 May 2025 09:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976907.1364016; Tue, 06 May 2025 09:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCEKX-0000rH-FU; Tue, 06 May 2025 09:11:13 +0000
Received: by outflank-mailman (input) for mailman id 976907;
 Tue, 06 May 2025 09:11:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sc8A=XW=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCEKW-0000rB-2O
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 09:11:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0badb737-2a5a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 11:11:09 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 09:11:01 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 09:11:01 +0000
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
X-Inumbo-ID: 0badb737-2a5a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2EI/raqi3TkcuhY0jhHc6aGB4h4/ZSwUQAqTmQ22d1BMRbFrEXqLkv600GadQ9oppva4rPUQFFOUIHlFKHbndqG4SvLMzrK8AqdZT4L1ulXe+M5iszQgL1Pvc8A/2zb9NozfQfQJOSHa+wWIqgP9d8KuvLBX6uesKVLaWFUQzs8EwoleV+cQHRspcupkbt7XH+MdlvhkOV43Pw+wq3PGCxqySHqoVKtM0uQWAXX8aPYiJ0MoTAoiX6V6R9MbkRmUU54dSeI6LvphuGfqhMgRB+uh6zY1OMWJGZquVGtHP075PEEpOEm5TDQXjN5l+V0BIWp6PVKSluyowwdHh13kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A3uaH0VVPxzCGmuST5QWIYz6b0JbRau4C/+yRuexQo=;
 b=gTiRzxp2FRKpLYuwFpiANSS2gwJRFZsAUPM6segZiIdWmXWw+S3IuLvtfH7N+RFOgfTFqVVlSJGKbG23Y0Hzf048vObhRtik70cotv2On1c4bOQNtlch070um1PvhNVkGaIrcLGy1rra5Iwu5efyfrYV7KlOuVPEM+DgBJhiScCFQEWs/kxU7J3Gs7dfayf8fNKyUU8a23HLn5TliCN7Avhgcexi+70/ebVU27w3AqjNO2BGF5jDHeJHDUF6J5cBJwan1jr0Z/GUNpb2RbRnUnGsN/BFTaGjhx/Le4YEHFsvdx46geaaF6XBQ1dQIj2EtdK+jUEVym6vg/ZOh5T8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A3uaH0VVPxzCGmuST5QWIYz6b0JbRau4C/+yRuexQo=;
 b=x9zfV+F6L02LOtVdFyAAQWQwTZ7HSXQEfu/mjadCKcQFygpu3Dyc5UhBxa0RxKZaQiE42GYr4UE+lmvPyQivU7V0KrZ+Bd0awS1qccALZEilmCX2fxyDXJRedew4IQtRjPhs7ds5eKqFvfNqWpBNoqkothwy56F+fILSHdM4MiU=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHbrRCmWPNHyarMuUaK4nZ2TXIaALO5UliAgAwK3VA=
Date: Tue, 6 May 2025 09:11:01 +0000
Message-ID:
 <DM4PR12MB845170AAF569257173F73D18E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-4-Penny.Zheng@amd.com>
 <2e1de23f-cc79-4d37-8667-0afd07736db3@suse.com>
In-Reply-To: <2e1de23f-cc79-4d37-8667-0afd07736db3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=a2e2940d-15e5-4846-bbe2-5a87bdc763f5;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-06T09:10:54Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB7689:EE_
x-ms-office365-filtering-correlation-id: 88156d1d-a0d2-4e80-b036-08dd8c7dec10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eXBVMWUvemtPK1V3aXhvdHlUdXFYeVdRTlB0MWpJMFMxazc1aDRzQU9CQ2h3?=
 =?utf-8?B?RFdKeTFGSHd3UktuMEZMK2JKdnZwUGNsYWh3WUhYSXVIMElUbDdLVTVLbmdn?=
 =?utf-8?B?QjAveFRYSVEybGFqazhsYXdXcVRKNCtUVjFpbC9iTHFaYTdDYW55ZUhQVFp5?=
 =?utf-8?B?eDdoT2xLekg1NSt4VW9OZFR3L2ljeG5LbG12dU9ac0tQY2tEQ1pPaDFscVZ0?=
 =?utf-8?B?MWV0ajExN25teUtRWFI1VExsUFE5aENtOE1pbzNvYUkzVk9aaDlKbVhEMjlk?=
 =?utf-8?B?SFVDMWJxU1RHN0l5QWZtOUdDTGkzeUZWc25oeFNwYXFEWU9FZmx3eWtRQW54?=
 =?utf-8?B?SXkzTHhGdlNPUloxMjA2bHhhYkF3bTl2L3MxUjRWb0QvRUY1ZXZvNFg4aVlv?=
 =?utf-8?B?ZE0rMVdPeXpiVVNMaHcyNzNRVHU1VmxMV21qcEQ3WXpFeWcyR1lST2tzL1Vn?=
 =?utf-8?B?Y2xpRCswUWMwZlovbVEramlyOVdYNnJ1Ynl1TnFsV3ZuUS9ralh4TkxFUnlm?=
 =?utf-8?B?dVoxMG1CdXFoQW9YRzcxTnJDQkVZalZBdWo3S3h0c1l0KzN0NVVIMUJrQURR?=
 =?utf-8?B?SkpiSlpOdDdXbG5NbXVCaWJRczFBVDdSOWdYbUVTeS9ybUtzUXBlTFo5eFNm?=
 =?utf-8?B?aXQ1Ry9zMVd5Z0hLdlEzazg5TTJBMS92bjBONC9kYjJSYnpYSGJjbG4yTGN3?=
 =?utf-8?B?VzBQQURVdG42N1FPaGRYVXNGY0laT0l3RXJJWkFNMk5OUWpnZUFoTjV4Y2RQ?=
 =?utf-8?B?Q0RqRlZZL21SS2loNzYwU05TSjhLdVZzSmR3MTRjVTVpVkd3NzNjeTNkQ3Fk?=
 =?utf-8?B?REFKUDJjTDRzbXNEQndTRlg4VHRvMGZmTWx6Q3ZzSHNOeXBHNXY3dWZpc0dJ?=
 =?utf-8?B?NEhQbzVlN2JHdFNVYmZVS3ZKdDZnazFMQXpETE5wY0lqamlUMjIyUEViV1Rr?=
 =?utf-8?B?V3Z6ejNodDQ2ZVNEaDF4cVZhR256M0JDc2RsTGFXRzVTNHNwMTRObDdTQTFT?=
 =?utf-8?B?K2UzWTdENVRXV1NyUldSbnR1WkdwcGw2dXRMMjg5RDJWbWZCWHV4SnlZdFFG?=
 =?utf-8?B?K3FTbXZBbmEvUjV2YUNhQWpaOCtCcGM5R1JxbDNHai9qOWpVcDFpK3N6VVRa?=
 =?utf-8?B?RHRZZVhhcFFOWk85aXE5WVRVUEZXWkx1anhleUdKUE04Z2tnQXZnb0xLS2xD?=
 =?utf-8?B?M0tHTVVIRmFiRlZ0WDRGOHVFbjhRbnVNejNwQ2ZCek12Y0Fka2NsbG41cUxu?=
 =?utf-8?B?Vm1wNG9EaG11K2w0ZXBlREQ1SnVNMHhvcnc5Tk9ubEtnUmgwNllUUnpwTGFT?=
 =?utf-8?B?aklIbjJvQ3Nwbm5jQjJ3TlZQZFZRQ0JFZ1h0M2pkejEyOEZhck5EMWJpTzVG?=
 =?utf-8?B?SzdZaXJoUUd5dlI1TlIraEw1eFRDbWt6VCtIR2g4aU9xZ3pLbkdSbE02SFdx?=
 =?utf-8?B?MnM2SWhWOUcyVGJqZittQzZNTUJVdExjdy9BOG5VeFcvTXJ5ckNBaVdUY2Fi?=
 =?utf-8?B?Tm51a1VXRkxPaEdvTGFkSENiWVZnZm9lYW1lV1lxNmUxTmVwd0c4aE9aOXFG?=
 =?utf-8?B?N2ZXU1RYM0kvVTZOV1U4Qnh3VURvM1dGNHNEOVh2UnM5bzI2NXNEdUIwRjdk?=
 =?utf-8?B?NzIyd1NmTEVWOEFKRDh2WG5YL25IK0VnZ3NueXFkVDdmcFNkY0Fsb2RJd1k0?=
 =?utf-8?B?ZW9udFJCRnNaSkRlL0hJekhBY2xSaVFyTjFtUXhsTEpsOEEwNmJycFpKV1lB?=
 =?utf-8?B?Q0RyYkFtUjdFTVFvZ0Z1WDdlRzBhR0Zod2p5NHVwSW1Bc3VjTStkSFdKalc2?=
 =?utf-8?B?c0N3L1pPUVVCSkVrMlNCaUtqL2duUUtNNmI2ZThNcW92cWhWYUJWWmZRbHRR?=
 =?utf-8?B?cmtZSU82YlVuTGVialM1enFtcUtFcXNLcDJ2eDlVdU1uSDhxRmdOYlBHNUxB?=
 =?utf-8?Q?4rtPpvLTsEo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEJyN0MybFRXazlFMkFrdnZYenZuWFFuV3RYa015Q3VnQkVWNTJiV1QrYUZQ?=
 =?utf-8?B?d3VSNlpSVHJRYTIzRlpLTHliZ3ZVQ3hVdkRIMHpsWm5XbjJTUnpSTkV5bjlr?=
 =?utf-8?B?UUEzNEFXZVhvdW00NUVoZXRRUDdzMTVzbm1DOGF3eWZUVjZIbm9RSlNYN200?=
 =?utf-8?B?N0hXQ1A4NG90WmZQaW9vTzQxMzAyQjhGMHBMQmpnUEtNaWh5U01PaDAzc3BF?=
 =?utf-8?B?dkExQ0h4dFRiSU9ITGxWMUFCaGYrWDJDVXpWamdWYndZT0Qyb1ArcUZ0NnVD?=
 =?utf-8?B?SGVnbHFrbGtzT041a0RicVpjYXhpZlFOa00wWmViVjN2Q0hHdXZ5d1ZiNzJI?=
 =?utf-8?B?dzQyVnkwdi9JWFRYZ29tOVhwc3YzWFk5dDMzSEgrRS81b0pnTU9oQTcwcm1P?=
 =?utf-8?B?YnNvNEtLOXNXay9iVk1TQkQvQTZFUEwwZktVTWpRV2RtcTBOWnhvdk01Vy9k?=
 =?utf-8?B?N09BSzUzeHU4N21DdWZCV1A5aXFZWU90YUQ5dzFCNjEvM0FzOG5CaEpybUhu?=
 =?utf-8?B?cUx3cTJpTkhmbHNhdWU5NStHZHJiQm9ydEgwRk1sbGFCWUt6ai9yWWdzTnFT?=
 =?utf-8?B?bDhrM1ozdDFvbW1XS29ubWI2cE1waG9lM3plc0wrT2VLaUdrK2hkNHNpWUpm?=
 =?utf-8?B?c3A1aVNTbEVSZitUWlJzcUowUFFGcnNCekJzazNKOCttcERNTzk4R2kwYVRF?=
 =?utf-8?B?cFpzZjF4UmVTYlNpUG83bERJSXVrdVRQZ3RCeWtabVgyM2N3UWdGa1d0TUdW?=
 =?utf-8?B?MlJWeUUrVitzdmRVOWFQSXdSU3ZNZTdLYmc1azhyTisySmk0Tjc5OVBycGxj?=
 =?utf-8?B?aWxqSUhmY1prNjV2bjZNUFExYW5kT1lQOGZJaStKVy8zYXdVR3laRnNOdFB4?=
 =?utf-8?B?RlNveUR2eklCelp6YUo1dHNMZGZJa0xoRXlqYjlvdVdKRTNKNjFUNlRIbVNE?=
 =?utf-8?B?ZmtnNUNRRGg2TERKaGpKK3FmMnFnSkxhcE95TE4rMjI3c0ppR01kYzZURHFC?=
 =?utf-8?B?VTFzY3BLVE94ZjRLdUJhOVhnOUtMcVJNaytsVnlKSURjbUMyYlBMZ2RNVlND?=
 =?utf-8?B?aDd1cElLWTdNZjJqTkxNUHJHZFRqN0RaOEhERjRKa09OQ25jeE1OT1BFYzZk?=
 =?utf-8?B?UTRqMnZ6SWJFM3R6U3RqZWFvZGx2NFYrYjVIeitmclYvZlpuRDJTTlVFZlpv?=
 =?utf-8?B?a3hkcXdCWUl0bFRkOFNXNDR5QUJNVjZod2w5Z2RkeERkV1BlR2FaVzJEUFlU?=
 =?utf-8?B?cGx4dG4xSlFnNXF2UmxLbjZuaUE3SVZiVkJTRnFMeEJhUFZMd1hTT2pzTUFC?=
 =?utf-8?B?cUJzYzNlcFROeHdRZ1ZiUkw1VTZJcys1VzlKc2RMOHdkS0pnTlY2d1NiQlFN?=
 =?utf-8?B?S1MzaVdXRTE5cm5ZdThVUXkzcWFLck5DcHMzazRLSXl2cllWS1RVRVNCdDFS?=
 =?utf-8?B?YWZOSG4wSTB3aWN3c2EwRXo3L1BoUWt1Njd0SlRFUnRKaGxZaU1UTyswejV0?=
 =?utf-8?B?RmdOWjFGQkw1dXR3dGtrMCthMEpNYjJIQ0RGVEl4MlhranMvczJYdGJ0VURT?=
 =?utf-8?B?djdOTUhPczJZTUlPSFFhenYrZXRVOVNkUkx2NkVDdG9TUlpEam5xeFNSVm9W?=
 =?utf-8?B?QVB0dHA1K3U4NjlYb04xZGt6cXUrcFZmSkZSWHg2Y3Rsck5VUFdrYUZSMDRa?=
 =?utf-8?B?Y1Z1cG5oazNqR0h1MzZrTjQxMXJJMktaZjJXbXl3cHpxWExQTFFJaklpdnpK?=
 =?utf-8?B?bUxDY1dYRTFwamZ1ZDBSOUo2WHFwcVZzR09ObmhSdGV2amVjZVpyZG45K0tu?=
 =?utf-8?B?dCttQW9TM0NYVW40WW94cG1ocFhPbnozMEJsZUVLejY4Ym1zK2M3eVZ6YXU4?=
 =?utf-8?B?M09xYXdOSUhJNU90bVhGaEVvSm5nWVd3dFo1SkNBZzdYa093Qlh0V25ucVRD?=
 =?utf-8?B?elZFeUtpaVJWY2RHL1FjdE9BK1NqNCsvejBiZXJzeC8vMm4vbytKOVV6aWJS?=
 =?utf-8?B?OElEQ2ZMYUplVC8rRzFua1NZK1ViOTJKOUgrWjNJbGpkL09sdEw2NVBDLzVp?=
 =?utf-8?B?S3RMNHByZ1lLMU5lZlN4YzhxaG42WmQ2eTcrWUxtTnRQaFFoVTJXaEROUWVr?=
 =?utf-8?Q?d0A4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88156d1d-a0d2-4e80-b036-08dd8c7dec10
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 09:11:01.5469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogfTtX1l2xWS0iFbkkyNxbvBQjRmaQEe/FaENGAimnWSGTghef6mclKeJysUfMBRQkji95D5patAKFq1zVgCuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689

W1B1YmxpY10NCg0KSEkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMjgs
IDIwMjUgMTE6NTcgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
OyBPcnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NCAwMy8xNV0geGVuL3g4NjogaW50cm9kdWNlIG5ldyBzdWItaHlwZXJjYWxsIHRvIHBy
b3BhZ2F0ZQ0KPiBDUFBDIGRhdGENCj4NCj4gT24gMTQuMDQuMjAyNSAwOTo0MCwgUGVubnkgWmhl
bmcgd3JvdGU6DQo+ID4gKyAgICBpZiAoIGNwcGNfZGF0YS0+ZmxhZ3MgJiBYRU5fQ1BQQ19DUEMg
KQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGlmICggY3BwY19kYXRhLT5jcGMuaGlnaGVzdF9w
ZXJmID09IDAgfHwNCj4gPiArICAgICAgICAgICAgIGNwcGNfZGF0YS0+Y3BjLmhpZ2hlc3RfcGVy
ZiA+IFVJTlQ4X01BWCB8fA0KPiA+ICsgICAgICAgICAgICAgY3BwY19kYXRhLT5jcGMubm9taW5h
bF9wZXJmID09IDAgfHwNCj4gPiArICAgICAgICAgICAgIGNwcGNfZGF0YS0+Y3BjLm5vbWluYWxf
cGVyZiA+IFVJTlQ4X01BWCB8fA0KPiA+ICsgICAgICAgICAgICAgY3BwY19kYXRhLT5jcGMubG93
ZXN0X25vbmxpbmVhcl9wZXJmID09IDAgfHwNCj4gPiArICAgICAgICAgICAgIGNwcGNfZGF0YS0+
Y3BjLmxvd2VzdF9ub25saW5lYXJfcGVyZiA+IFVJTlQ4X01BWCB8fA0KPiA+ICsgICAgICAgICAg
ICAgY3BwY19kYXRhLT5jcGMubG93ZXN0X3BlcmYgPT0gMCB8fA0KPiA+ICsgICAgICAgICAgICAg
Y3BwY19kYXRhLT5jcGMubG93ZXN0X3BlcmYgPiBVSU5UOF9NQVggfHwNCj4gPiArICAgICAgICAg
ICAgIGNwcGNfZGF0YS0+Y3BjLmxvd2VzdF9wZXJmID4NCj4gPiArICAgICAgICAgICAgICAgIGNw
cGNfZGF0YS0+Y3BjLmxvd2VzdF9ub25saW5lYXJfcGVyZiB8fA0KPg0KPiBXaGVyZSdzIHRoaXMg
b3JkZXJpbmcgc3BlbGxlZCBvdXQgaW4gdGhlIHNwZWM/DQo+DQoNCkNsaXAgYSBzbmlwcGV0IGZy
b20gZGVzY3JpcHRpb24gb24gbG93ZXN0IHBlcmZvcm1hbmNlWzFdLCB3ZSBtYXkgZGVkdWNlIHRo
YXQNCmBgYA0KU2VsZWN0aW5nIGEgcGVyZm9ybWFuY2UgbGV2ZWwgbG93ZXIgdGhhbiB0aGUgbG93
ZXN0IG5vbmxpbmVhciBwZXJmb3JtYW5jZSBsZXZlbCBtYXkgYWN0dWFsbHkgY2F1c2UgYW4gZWZm
aWNpZW5jeSBwZW5hbHR5LA0KYnV0IHNob3VsZCByZWR1Y2UgdGhlIGluc3RhbnRhbmVvdXMgcG93
ZXIgY29uc3VtcHRpb24gb2YgdGhlIHByb2Nlc3Nvcg0KYGBgDQpsb3dlc3QgaXMgc21hbGxlciB0
aGFuIGxvd2VzdCBub25saW5lYXINCg0KPiA+ICsgICAgICAgICAgICAgY3BwY19kYXRhLT5jcGMu
bG93ZXN0X25vbmxpbmVhcl9wZXJmID4NCj4gPiArICAgICAgICAgICAgICAgIGNwcGNfZGF0YS0+
Y3BjLm5vbWluYWxfcGVyZiB8fA0KPiA+ICsgICAgICAgICAgICAgY3BwY19kYXRhLT5jcGMubm9t
aW5hbF9wZXJmID4gY3BwY19kYXRhLT5jcGMuaGlnaGVzdF9wZXJmICkNCj4gPiArICAgICAgICAg
ICAgLyoNCj4gPiArICAgICAgICAgICAgICogUmlnaHQgbm93LCBYZW4gZG9lc24ndCBhY3R1YWxs
eSB1c2UgcGVyZiB2YWx1ZXMNCj4gPiArICAgICAgICAgICAgICogaW4gQUNQSSBfQ1BDIHRhYmxl
LCB3YXJuaW5nIGlzIGVub3VnaC4NCj4gPiArICAgICAgICAgICAgICovDQo+ID4gKyAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIkJyb2tl
biBDUFBDIHBlcmYgdmFsdWVzOiBsb3dlc3QoJXUpLCBub25saW5lYXJfbG93ZXN0KCV1KSwNCj4g
bm9taW5hbCgldSksIGhpZ2hlc3QoJXUpXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgY3Bw
Y19kYXRhLT5jcGMubG93ZXN0X3BlcmYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICBjcHBjX2Rh
dGEtPmNwYy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICBj
cHBjX2RhdGEtPmNwYy5ub21pbmFsX3BlcmYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICBjcHBj
X2RhdGEtPmNwYy5oaWdoZXN0X3BlcmYpOw0KPg0KPiBJZiB0aGlzIHdhcm5pbmcgd2FzIHRvIGV2
ZXIgc3VyZmFjZSwgaXQgd291bGQgbGlrZWx5IHN1cmZhY2UgZm9yIGV2ZXJ5IENQVS4NCj4gVGhh
dCdzIHVubmVjZXNzYXJpbHkgdmVyYm9zZSwgSSBndWVzcy4gUGxlYXNlIGNvbnNpZGVyIHVzaW5n
IHByaW50a19vbmNlKCkgaGVyZS4NCj4NCg0KVW5kZXJzdG9vZA0KDQo+IEFsc28sIGlzICJyaWdo
dCBub3ciIChhcyB0aGUgY29tbWVudCBzYXlzKSBzdGlsbCBnb2luZyB0byBiZSB0cnVlIGJ5IHRo
ZSBlbmQgb2YgdGhlDQo+IHNlcmllcz8gRGlkbid0IEkgc2VlIHlvdSB1c2UgdGhlIHZhbHVlcyBp
biBlYXJsaWVyIHZlcnNpb25zPw0KPg0KDQpUaGUgcmVhc29uIHdoeSBJIGFkZGVkIHRoaXMgY29t
bWVudCBpcyB0aGF0IGluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHdlIGFjdHVhbGx5DQpkb24n
dCB1c2UgdmFsdWVzIHJlYWQgZnJvbSBBQ1BJIF9DUEMgdGFibGUgZm9yIGxvd2VzdF9wZXJmLCBs
b3dlc3Rfbm9ubGluZWFyX3BlcmYsDQpub21pbmFsX3BlcmYsIGFuZCBoaWdoZXN0X3BlcmYuDQpX
ZSByZWFkIENQUEMgY2FwYWJpbGl0eSBNU1IgdG8gZ2V0IHRoZXNlIGZvdXIgdmFsdWVzLg0KV2hh
dCB3ZSBhY3R1YWxseSB1c2UgaXMgdGhlIGZvbGxvd2luZyBvcHRpb25hbCBsb3dlc3RfbWh6IGFu
ZCBub21pbmFsX21oei4gV2UgcmVhZA0KdGhlc2UgdHdvIHZhbHVlcyBmb3IgcGVyZl90b19raHog
dHJhbnNpdGlvbi4NCg0KVGhlcmUgYXJlIHR3byB3YXlzIHRvIHJlYWQgQ1BQQyBjYXBhYmlsaXR5
IGluZm8sIG9uZSBpcyBmcm9tIE1TUiByZWdpc3RlciwgYW5kIHRoZSBvdGhlciBpcyBmcm9tDQpf
Q1BDIHRhYmxlLiBPbmx5IGluIHZlcnkgZmV3IGhhcmR3YXJlLCBNU1IgaXMgbm90IHN1cHBvcnRl
ZCwgYW5kIHdlIG11c3Qgc3dpdGNoIHRvIHVzZSBBQ1BJIF9DUEMNClN1Y2ggc2NlbmFyaW8gaXMg
bm90IGNvdmVyZWQgaW4gdGhpcyBwYXRjaCBzZXJpZS4gSSd2ZSBtZW50aW9uZWQgaXQgaW4gdGhl
IGNvdmVyIGxldHRlci4NClRoZSBkaWZmaWN1bHR5IGFjdHVhbGx5IGlzIHRoYXQgd2hlbiB3ZSB0
cnkgdG8gdXNlIEFDUEkgX0NQQyB0byBkbyBDUFBDIHBlcmZvcm1hbmNlIG1vbml0b3JpbmcsDQpz
b21lIGNvbnRyb2wgcmVnaXN0ZXJzIGFyZSBwcm9iYWJseSBpbXBsZW1lbnRlZCBpbiB0aGUgUGxh
dGZvcm0gQ29tbXVuaWNhdGlvbnMgQ2hhbm5lbCAoUENDKSBpbnRlcmZhY2UsIHdoaWNoDQppcyBu
b3Qgc3VwcG9ydGVkIGluIFhlbi4NCg0KPiA+ICsNCj4gPiArICAgIGlmICggY3BwY19kYXRhLT5m
bGFncyA9PSAoWEVOX0NQUENfUFNEIHwgWEVOX0NQUENfQ1BDKSApDQo+DQo+IElmIGVpdGhlciBm
bGFnIG1heSBiZSBjbGVhciwgLi4uDQo+DQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcG1faW5m
by0+Y3BwY19kYXRhID0gKmNwcGNfZGF0YTsNCj4gPiArICAgICAgICBpZiAoIGNwdWZyZXFfdmVy
Ym9zZSApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBwcmludF9QU0QoJnBtX2lu
Zm8tPmNwcGNfZGF0YS5kb21haW5faW5mbyk7DQo+ID4gKyAgICAgICAgICAgIHByaW50X0NQUEMo
JnBtX2luZm8tPmNwcGNfZGF0YSk7DQo+DQo+IC4uLiB3aHkgdW5jb25kaXRpb25hbGx5IGxvb2cg
Ym90aD8NCj4NCj4gPiArICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgIHBtX2luZm8tPmlu
aXQgPSBYRU5fQ1BQQ19JTklUOw0KPg0KPiBQbHVzIGlzIGl0IGNvcnJlY3QgdG8gc2V0IHRoaXMg
ZmxhZyBpZiBlaXRoZXIgb2YgdGhlIGluY29taW5nIGZsYWdzIHdhcyBjbGVhcj8NCj4NCg0KSG1t
LCBJIG1heSBub3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIGhlcmUuLi4NCkkgbG9nIGFuZCBz
ZXQgdGhpcyBmbGFnIG9ubHkgd2hlbiBib3RoIGZsYWdzIGFyZSBzZXQgKGNwcGNfZGF0YS0+Zmxh
Z3MgPT0gKFhFTl9DUFBDX1BTRCB8IFhFTl9DUFBDX0NQQykpDQpfUFNEIGVudHJ5IGFuZCBfQ1BD
IGVudHJ5IGFyZSBib3RoIG1hbmRhdG9yeQ0KRGlkIHlvdSBzdWdnZXN0IHRoYXQgd2Ugc2hhbGwg
Z2l2ZSB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiBlaXRoZXIgZmxhZyBpcyBjbGVhcj8NCg0KPiBKYW4N
Cg0KWzFdIGh0dHBzOi8vdWVmaS5vcmcvc3BlY3MvQUNQSS82LjUvMDhfUHJvY2Vzc29yX0NvbmZp
Z3VyYXRpb25fYW5kX0NvbnRyb2wuaHRtbD9oaWdobGlnaHQ9Y3BwYyNsb3dlc3QtcGVyZm9ybWFu
Y2UNCg==


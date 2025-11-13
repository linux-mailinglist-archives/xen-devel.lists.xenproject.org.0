Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D381C55A10
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 05:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160613.1488692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJOgO-00064L-Pz; Thu, 13 Nov 2025 04:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160613.1488692; Thu, 13 Nov 2025 04:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJOgO-00062u-NJ; Thu, 13 Nov 2025 04:11:40 +0000
Received: by outflank-mailman (input) for mailman id 1160613;
 Thu, 13 Nov 2025 04:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWJc=5V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJOgN-00062o-N8
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 04:11:39 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d812b7d3-c046-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 05:11:37 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 04:11:30 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%3]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 04:11:30 +0000
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
X-Inumbo-ID: d812b7d3-c046-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnQcWQmgpBZ37ObnrCYuzMzCIkUM1Cl0sRYcCUGJoPl0UE8a4yKXifonMcunzHJCQ/zDsz4dF+4nzyA13+umVmEujR5ZQyfb+714s2WWAgWNqKgHyQQKFq0FEEK/0fpX0BKeJvNeDlPmVuS/+pTyKNrc3Ml5byKLMMIOwDU3FWGYtDX4bCwI/1HtL5XzYwv5EeV4ft9UJg50ZucBBRdgWUb9BsUAYfx6Sj2yxD21U9CzEW7fuigY7eUevtJI9vl37t+4kP70+ytfxWw+gnl2glu67qyRcS0mzobFJ2YiZSg8x0KJ+wydvP3Klh+M3d8n52gufHXKBvDN1webZi/5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZX5mnDOYXjqReCfLrAek0so2UZhIy+M04R3URQAvRU=;
 b=qrNFYxyr2LzkoPll4t3nlHMlTBJXzamTYzisQpbYA18Mv7cD4HuKvjnEH0DgPnPQV/N5L2ah6VbDRDDoEWC37umsEBBswBTV/D/wyUlL9Gd9odZXxFjx1xIb4wvkNWyF64ur73KyfDpRpxt0xkYVUu/NhsPvfgIRmDipGqPAcPMs9ecvVZ+N6Uofv4IUBd9HWF1utBJoeHWRF+RQvitLKgFh5qtcNf6Lwj2VFTiV+bELxZvYoRXGSodUA3tIX7wOiRaaFPv9Xz1gD9NWe/pUiugXwLjPgnDws7zt/35OsGD14nxbkYdBPpMmLhDm/JZRKclnP3i+fOH0iT4cz3SkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZX5mnDOYXjqReCfLrAek0so2UZhIy+M04R3URQAvRU=;
 b=2pkecL3bvI6zphgWPOoAU1JHECaMbOPUK8amhiuV7rlEJJi1A1KxiC0RqThHSMvZhl8fvldnbPsd16R3vBJU8JYMZDsjFxEW5OvwKc75iGBuPtNNciMjNu1ZLVt7216B+eg/hMWx+Mq+QWOaawEnvPV2Z7E7GglWQfi31mMmUT8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcPCqOfEVt2Jk05kOchIzPOp9r0LTavU6AgBQtWvCAABPQAIABL62w
Date: Thu, 13 Nov 2025 04:11:30 +0000
Message-ID:
 <DM4PR12MB8451EDD8CB080ABBEE5902A7E1CDA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-16-Penny.Zheng@amd.com>
 <8c74774a-458b-4918-8d65-fcb3eacfe98b@suse.com>
 <DM4PR12MB845189415FBE1E8C250C81D2E1CCA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <58508638-ecff-4507-a11a-8dd7ac52e61f@suse.com>
In-Reply-To: <58508638-ecff-4507-a11a-8dd7ac52e61f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-13T04:11:21.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ1PR12MB6268:EE_
x-ms-office365-filtering-correlation-id: a258618a-2f0d-4038-e776-08de226ab967
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eDRJaVJEaVhNeXZVVldhcGJCL295NW5jWTU0TmVmSUVKb281MGhyemdRNU5X?=
 =?utf-8?B?VDM5bGxMeWZCNmhnV0ozaWNXYnpyV2h4dXBNNEdveWNVR3BTR1lKa1c5UUZ3?=
 =?utf-8?B?cS8ya0JYeVFmTXV1OXNlSnZsYVMyUDZhZXFycjE4OVNIRWdaVXZHRGZpMmNY?=
 =?utf-8?B?dTFvZXZCS3MzeHAxbUVNMkt1NjcvcDF5ZGk3ckhDSk5NT2ZuL0xudU50eFBv?=
 =?utf-8?B?MjZUcjFiWVIxUXVGeU5xaHlzQmxUSmt0ZTM1NERBR1h2dlpRSnNCZTh1SnhP?=
 =?utf-8?B?TVc4VGMxRlovWVJlTW94dUxjZWhnZWdiRVlhVkI4Tm8reEoyeTNjT0dwaE9I?=
 =?utf-8?B?aTMzcEt6cm4ySTVmUTkyT3lzRWxYcG82aG1JVEJad2lJYVVmY2ljMUN0QjdS?=
 =?utf-8?B?VFBxbEQySmVvaVhPZG0vbXJVQUF1dW9jU1hQUm9aakNvTlhTeEhCVU10Mkd4?=
 =?utf-8?B?NGFuNmxpcDl4Ky83QjNiL1Q1V0UyQTFFM2UyLzMxOGszN040Qm0xTGM3QWs3?=
 =?utf-8?B?MjFVaGpRb1ZlZ1FvcmJ4MVJPYmdWTVU0TmRQUCswY01vNTZaZlZId3NzdTdB?=
 =?utf-8?B?cUV1MjF2ZUJyRGlaeGo3NXpjbDQ0MS91eUV4ZjhpM1RqN3pJRm15alpVOXlB?=
 =?utf-8?B?RWZPbmh4RlcyRko5RWhvekFzVnJxbTJ0b1FOK2VFOUM1UEI4Qjk5a0RHSEs4?=
 =?utf-8?B?ZkZSTHRTVFdLelBaaHNROFZFeVYxbmNhRUxWckxkODRQWkUwOW1YajROdlYx?=
 =?utf-8?B?bU1PYm80RytsOU5DUHZzM1Z5dy91QWtwMlJTR2c4YWxINkR0dGUyNVMvdmh2?=
 =?utf-8?B?UStOZjZjeURNWmNWcUhGWDhVUnNXQkVOdFlXWGpoZ2VnbHF0TjRJOHZpU2xN?=
 =?utf-8?B?L0s5QzNIVVpDdHJVQkxDbnIybFRyYWQ2b001cDh1ZXNwa3ZVVGV3bGFHUVFq?=
 =?utf-8?B?dUp4UEJWNzRlZm42M3g0ZTlEYkZPNFBEMUhaeEgxNmExKzl5MllsbFU5YTZE?=
 =?utf-8?B?SUl4R3VQT3RkbExsdHh5WmtNVlZhdkM3a0ROaGNUeVF5cGNBVmV6OWp3ZkVT?=
 =?utf-8?B?NlNFODA2NDY3QTN0OC9nT1kwdzBPclU0N1EyQkRaVzQ0d3o1Q2kydVNqNS94?=
 =?utf-8?B?ZDhDQTRNb3JwZUZXaDZMUzgrQm5WL01aU0QzclJJZVdZNElYYXdUaGVFdFd4?=
 =?utf-8?B?b2x0LzN4UFBQc0hjVm01b0RocWtqUTdCTW51M3NZTTZIMUNMTXBPRTU3YmhR?=
 =?utf-8?B?ZHZnL2hWQk9oVWhuOHdhUWFSN2dieklCZHYrOC84Ukw0Q1NVNlY4VjNrVUFM?=
 =?utf-8?B?K0NnZ0FsNzk1K0loRmhEanQ0amM3QllFYWNLbGtJSGl5UHJoN2NSWG80TTI1?=
 =?utf-8?B?bFR6ZUlIaWJOcGJvdDJBUFpLNnpnSDZzbWM2VHk5cjB2bWpkTEs4MFpKMksz?=
 =?utf-8?B?ZWdJRXYxRnNSdWdSU2xyRnV0K0l4WnBUekpDbm1PYXM2ZEFOWml2RnA0YjQ2?=
 =?utf-8?B?R0VrZ2xtUU9wblFsM2UrVFdla2JZR0tFUHJGaU4wWVV5TEl1RnJ4Z3ZVaGQ2?=
 =?utf-8?B?QU9qQ00rRHNGQ2ZGK2F3TDVjY0dQMXhHL3gwRTdIa1BQbVh6cWtmTnRtK3VD?=
 =?utf-8?B?enEzOHVlM0dkVkhOR1A4Q2ZzZnBxRVZoV1RmcG1XSjNMbjcwTnRRVXN4S3pE?=
 =?utf-8?B?azBSWEc5cVdhT2p3Slp5ZldVVk9XV2kzSS9XVElYc05ueEJBVHM2aEt6N2hn?=
 =?utf-8?B?ci9RM3o2Y1pndVZsZVM2VXRaWnVSVGZIcGd1c1lvZ2xBNWdwU3JOUFFVTm5Y?=
 =?utf-8?B?QW1UOUx5UU91ei9ZdWxuVVBkaVFvY0d5S0hTdmg3WDYzZjZtb2kxZnBqSW03?=
 =?utf-8?B?bzh6RW0wMnA3N3RKRHZSeWFFcUdQM1V3WEI5bHdWOXBnWERoVGxOM2FkZzZK?=
 =?utf-8?B?eXlneERWYU5COHBSZEw0NUZkRzFzSm14cWhwdXJBeFpsWE1Jak5XS1REY0tp?=
 =?utf-8?B?SHBRdkxicWV4NUlybzB1cEU5T2kyeVU3WVNObTF3VjhNS2p2Q1NITEo2QVBN?=
 =?utf-8?Q?hjJcG9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUMrbmk5Ulgrb3V6ZHFRR2tPZUtkSlgxYTV5b0FlYlcyMzl6aXlkSXdLSmMr?=
 =?utf-8?B?N1hvVElPZW0rYTdRbG9nei9qR3kvRVFBOHJqd1BENUd3cDZhOXdkWXBDYmFi?=
 =?utf-8?B?MWJNczEwZFN1Q2MvTzYrUWxqd0wwckErb093RGYwTDFHamU4Z29RYjByMFJ2?=
 =?utf-8?B?NlBMRFNNY0ZGOXhmWGdYR0NVVnZnNGdMRDA1NjBZdk1rWEtHRjlhTTBKVWpO?=
 =?utf-8?B?MkpVemVMd0JOVDU1eXd2VUgwSmdxNWxnRDJLSkIzbElpaTVpUFBrRGFwN1VX?=
 =?utf-8?B?OG5hY0lieUF4K01HcUZBV2ROVFd5a21JMHpyakRTYm1oZTJJbk53Sk1JY3RR?=
 =?utf-8?B?RWNsY3JKcTY0SVpJalNsd1hXdGVLY25KbkhDTmk4UFhiVkcxNStjVm5nZTVW?=
 =?utf-8?B?dXk1TDNkTWI1T2F1aVZyQ0pzQkhDQyswSXRnUndhY1RtZXlHYkhMU3ZpNDJ5?=
 =?utf-8?B?Rno3V1Z6dzNraEphazRnbHU4aS9nZmRTdkRJY1ZuZVczcHc3NmdURlBqMmo3?=
 =?utf-8?B?TFVqb3RNTFE2RWdtK3RyblFZV2xsKyswSmt4S1FFMTdMTi9hOXozR0N5VGpH?=
 =?utf-8?B?QXhMT1NhRTBvOVMyUEhodzhMRkYwbU9vcGxMK1ZjdDl1RUJrNjUwc0tScGRz?=
 =?utf-8?B?SjFJZzMxVmVEWFhpUUdQS2J0em1ZeGpNZmhhcGZEQ2k1TVQ2NUR1OW4yTkRk?=
 =?utf-8?B?VVJja01uMkhWeU9vdDdCWDNQYUFwZjU0RWtKbWE4cG4vMnk5c1Q1M2k1YTRk?=
 =?utf-8?B?S3kzY2FIWUFuOTVTM3Q3MDB4czM3NUZMZkdJdC93UldzVWI1UW85ZXFBb2oz?=
 =?utf-8?B?cDlvV2d5RzVYQ1ZRbXJPQXhrSFV4OWNnS3BsRDQzZDNteXFYeWk0OG9nWkVl?=
 =?utf-8?B?dlhSUXVkTnU1ZnJPSGM5T1JlOE9EVlpKQjUzWHRGZWo5RXVlUlB0UTJTNThG?=
 =?utf-8?B?eVA2NFY4MytHVDlYVmtlVENFckxranQxK3puSE9sdC82WkJLQi9HUENSbFhE?=
 =?utf-8?B?SDVXMUhIbDRKOWdLVmhoM2VJdGNEckFxZG44MDF3NnBickNCVERZVVF5Sjho?=
 =?utf-8?B?dkUwdWpDdFNJQzhYN1pZdUpIc1QyVXd1ZExXZnpOSlEzNFM4MzR0ZEF4Z0Fh?=
 =?utf-8?B?SSsrT0lRaCtaVjVsaUdZbUlLa2FrWEp6NXNxeU1BVG43RWY1YjRWQStGVGp2?=
 =?utf-8?B?NFFVcmpjVFR5Wkp3SXFrbnR0UDlCRWNiZzBwYjVTWE9kTDBoL0p6aVozYWtN?=
 =?utf-8?B?RlhETjFBZUlpSU8zb0dha1VpS1N3L0NFMTc5YktBblNad3JWK1UyNkRPSjA5?=
 =?utf-8?B?V0p5NnBHZ2pDdmkyb2k0Y2pYUmYwK0gycGlrb1VNYlU4K21yOW1peWQrS0lJ?=
 =?utf-8?B?SmRGeFBST21iZjI2K0hWSnk0Nm9oUjh1NVZBbWl5MXBPYUNmaWVXSDczVFlq?=
 =?utf-8?B?c1RwWTdOM1RVd3U5UlVTTlhBUDZnalBIQVpkM3pTYUUyMTk5N09QTXBFWmdP?=
 =?utf-8?B?aDRKUDh4a2U5NXdJYlBBd0pWNVJ4alRQelRYUENIb0Z5aFNKVmlPYUgybS9D?=
 =?utf-8?B?VTJVWnRjUlFQUWd0VFUxVkY2eUdQWjA1RlRHUUZqejdRcG5JMmZab0d4Z3pU?=
 =?utf-8?B?RlFuL09UckJJS21ybVRuRXlJZzRJazBBR0p5T2lCTTZmS05VOHNRMXZ6b2tI?=
 =?utf-8?B?dmQ5cVVVUDFHT1R3bFQ4M3V3K3RUY0xUTis4WXhEMWdPWGdlVnJOR3pCZ1NJ?=
 =?utf-8?B?d2lQNWc0bVVLckZGL0Ivd1FGTzhueVJncldGS1FKM01sZy9kRFFJS0dlTGVh?=
 =?utf-8?B?b3dYa3pVZmY2dEJRZkJZb0tCRkpGTDd3TGo3cW44OHIvcnlMdndYcHdyVGNH?=
 =?utf-8?B?WnhJbG9NQVBZRDRKZ1VmQ3ZodnZaRVlkazdHbDJ1OGYvdGlsM1AvVmVVa08w?=
 =?utf-8?B?cVlpcVpmMVZTQVdKZ3JVdE1CVllMYmJZOXd1TmlOWHdIOGpQZHdEaFdKZnRJ?=
 =?utf-8?B?cXBmMFFENEhQS2M5NlcyRkJMdEttZ0UzV0gwb2k0ZG9UbDZoRVJpNEZoYWdh?=
 =?utf-8?B?OGJNZGpscFpHTTlZRDdid05hajZJS1N5ODZ6aTdoSmJQMDNJRHdhZVVVMjVR?=
 =?utf-8?Q?+fWo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a258618a-2f0d-4038-e776-08de226ab967
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 04:11:30.5585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAsHy+X2pgsXD3nGsMt2mW6MX9c9XDj+M10Koqm/lGSU6QMYgqL0405AUdcvXKBFRd8NMHXHX11i0fcCn+T9qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTIs
IDIwMjUgNjowMiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBvbGVrc2lpLmt1cm9jaGtvQGdt
YWlsLmNvbTsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPGJlcnRy
YW5kLm1hcnF1aXNAYXJtLmNvbT47IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29t
PjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJE
IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsNCj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+OyBTaGF3biBBbmFzdGFzaW8NCj4gPHNhbmFzdGFzaW9AcmFwdG9yZW5n
aW5lZXJpbmcuY29tPjsgQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
PjsNCj4gQm9iIEVzaGxlbWFuIDxib2JieWVzaGxlbWFuQGdtYWlsLmNvbT47IENvbm5vciBEYXZp
cw0KPiA8Y29ubm9qZGF2aXNAZ21haWwuY29tPjsgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDE1LzI4XSB4ZW4vZG9tY3RsOiB3cmFwIGRvbWFpbl9raWxsKCkgd2l0
aA0KPiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+DQo+IE9uIDEyLjExLjIwMjUgMDk6NTgsIFBl
bm55LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gPj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMzAsIDIwMjUgODo0NCBQTQ0KPiA+PiBUbzog
UGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+PiBDYzogSHVhbmcsIFJheSA8
UmF5Lkh1YW5nQGFtZC5jb20+OyBvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbTsNCj4gPj4gU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsDQo+
ID4+IDxqdWxpZW5AeGVuLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNA
YXJtLmNvbT47IE9yemVsLA0KPiA+PiBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgVm9s
b2R5bXlyIEJhYmNodWsNCj4gPj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3
IENvb3Blcg0KPiA+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJE
DQo+ID4+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Ow0KPiA+PiBTaGF3biBBbmFzdGFzaW8gPHNhbmFzdGFzaW9AcmFw
dG9yZW5naW5lZXJpbmcuY29tPjsgQWxpc3RhaXIgRnJhbmNpcw0KPiA+PiA8YWxpc3RhaXIuZnJh
bmNpc0B3ZGMuY29tPjsgQm9iIEVzaGxlbWFuIDxib2JieWVzaGxlbWFuQGdtYWlsLmNvbT47DQo+
ID4+IENvbm5vciBEYXZpcyA8Y29ubm9qZGF2aXNAZ21haWwuY29tPjsgVGFtYXMgSyBMZW5neWVs
DQo+ID4+IDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgeGVuLSBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDE1LzI4XSB4ZW4vZG9tY3RsOiB3cmFw
IGRvbWFpbl9raWxsKCkgd2l0aA0KPiA+PiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+ID4+DQo+
ID4+IE9uIDEzLjEwLjIwMjUgMTI6MTUsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gLS0tIGEv
eGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMNCj4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9tZW1fc2hhcmluZy5jDQo+ID4+PiBAQCAtMTM5Niw2ICsxMzk2LDcgQEAgaW50IF9fbWVtX3No
YXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4NCj4gKmQsDQo+ID4+PiAgICAgIHJldHVy
biByYzsNCj4gPj4+ICB9DQo+ID4+Pg0KPiA+Pj4gKyNpZmRlZiBDT05GSUdfTUdNVF9IWVBFUkNB
TExTDQo+ID4+PiAgaW50IHJlbGlucXVpc2hfc2hhcmVkX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQp
ICB7DQo+ID4+PiAgICAgIGludCByYyA9IDA7DQo+ID4+PiBAQCAtMTQ1Miw2ICsxNDUzLDcgQEAg
aW50IHJlbGlucXVpc2hfc2hhcmVkX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQpDQo+ID4+PiAgICAg
IHAybV91bmxvY2socDJtKTsNCj4gPj4+ICAgICAgcmV0dXJuIHJjOw0KPiA+Pj4gIH0NCj4gPj4+
ICsjZW5kaWYgLyogQ09ORklHX01HTVRfSFlQRVJDQUxMUyAqLw0KPiA+Pj4NCj4gPj4+ICBzdGF0
aWMgaW50IHJhbmdlX3NoYXJlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkb21haW4gKmNkLA0K
PiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG1lbV9zaGFyaW5nX29wX3Jhbmdl
ICpyYW5nZSkNCj4gPj4NCj4gPj4gSXMgdGhpcyBuZWNlc3Nhcnk/IFNob3VsZG4ndCBNRU1fU0hB
UklORyBhcyBhIHdob2xlIGJlY29tZSBkZXBlbmRlbnQNCj4gPj4gdXBvbiBNR01UX0hZUEVSQ0FM
TFMsIHRoZW4gYWxzbyBjb3ZlcmluZyBYRU5NRU1fc2hhcmluZ19vcD8gKFRoZQ0KPiBzYW1lDQo+
ID4+IHdpbGwgYWxyZWFkeSBpbXBsaWNpdGx5IGhhcHBlbiBmb3IgTUVNX1BBR0lORywgZHVlIHRv
IGl0cyBWTV9FVkVOVA0KPiA+PiBkZXBlbmRlbmN5LikNCj4gPj4NCj4gPg0KPiA+IFllcywgU2lu
Y2UgSSBkaWRuJ3Qgc2VlIFZNX0VWRU5UIGRlcGVuZGVuY3kgZm9yIE1FTV9TSEFSSU5HLiBJJ20g
bm90DQo+IDEwMCUgc3VyZSB0aGF0IHdoZXRoZXIgbWVtb3J5IHNoYXJpbmcgZmVhdHVyZSBpcyBk
ZXBlbmRlbnQgb24gVk1fRVZFTlQuIEFsc28NCj4gYXMgSSByb3VnaGx5IGxvb2sgdGhyb3VnaCB0
aGUgY29kZXMgaW4gbW0vbWVtX3NoYXJpbmcuYywgbWF5YmUgb25seQ0KPiBtZW1fc2hhcmluZ19u
b3RpZnlfZW5vbWVtKCkgdXRpbGl6ZXMgdm0gZXZlbnQgc3Vic3lzdGVtLg0KPg0KPiBSaWdodCwg
YSBsaXR0bGUgd2hpbGUgYWdvIChpaXJjIGluIHRoZSBjb250ZXh0IG9mIHlvdXIgd29yaykgVGFt
YXMgc2FpZCB0aGUgc2FtZS4NCj4gQnV0IEkgZGlkbid0IGFzayBhYm91dCBWTV9FVkVOVDsgSSBh
c2tlZCBhYm91dCBNR01UX0hZUEVSQ0FMTFMuDQo+DQoNCk9oLCBzb3JyeS4uLi4NClllcywgVGhl
IGVuYWJsaW5nIGJpdCAoZC0+YXJjaC5odm0ubWVtX3NoYXJpbmcuZW5hYmxlZCkgY291bGQgb25s
eSBiZSBlbmFibGVkIHZpYSBkb21jdGwtb3AuIEkgd2lsbCBtYWtlIGl0IGRlcGVuZCBvbiBNR01U
X0hZUEVSQ0FMTFMuDQoNCj4gSmFuDQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941AD9EC4A8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 07:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853791.1267146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLG3B-0004aU-4c; Wed, 11 Dec 2024 06:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853791.1267146; Wed, 11 Dec 2024 06:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLG3B-0004XN-1w; Wed, 11 Dec 2024 06:18:21 +0000
Received: by outflank-mailman (input) for mailman id 853791;
 Wed, 11 Dec 2024 06:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqCb=TE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLG39-0004XF-TU
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 06:18:20 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2416::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3180352-b787-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 07:18:16 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 06:18:09 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 06:18:09 +0000
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
X-Inumbo-ID: b3180352-b787-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLk616lIsirvVSDq6Erp3+h+mUd7VtYtcEF2mrjrID8OUQjDjva5Hz6t+q+ObMOxy51PbVodKVOvZNfmK3cRsqq5gHRmsE3y+mAkKQIT81WVJUOs+LZe6+oVmhg6umCHbXTrtGEx83iW3ooFvNH4Ae9kQdepJ4uxLuB28aiweApKlHiMm+UK87I/AxO4EmGK3UYhJwUF+AvkJciVV7jRt8iTzFvrCO7Xy1MO95nbYhS+XYltj7tp89QPl8O5f2PsPQ4Yqz70yDwUpx1wLGyepAtLzoK2is9f6C58qBKvTuPyCDc86sM5AW2M4JGBQ68RMBYOmDjypPIUf3dr8HVqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3cuRtZVFKQZhbCSadEnodG3ElAzkN+6o38Q8YwXpJQ=;
 b=TaCZppcA1wUzwtEaeEZMdZmxCaEy/6bDIM3oyxwZG+uSI/9lelVdzzxiTGjxWEoWZ4npYpbfYAcz42icRP3W7BXAPhdYhDu0UAGIlN5k7m8iNTl7YvgYD2ksKRUc2Vjsrs+MLjJ1LKi0dOQTnOQCH7Fyg04guYiAQjdrTm5q2A9UPYfVKWK3KtZvjY1xhFrmsdwSLj8+K/edwvoc9EW8CNJ+UpkBbYpDd7zv0WA8TjzXQEE4GcSmpJdax1fCFSRGCWBS8t8zDYT4DwqUx0xIYQRyFrAOM2W4rmsFkBz/+FCW69VuZcoWlJ+qVtRvqMcW0HUEdvtUZeWjEYqwU3/GnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3cuRtZVFKQZhbCSadEnodG3ElAzkN+6o38Q8YwXpJQ=;
 b=mU/ibUwcUu5lnWn1aiL34zi/N0yfuis6D9YFY7NDpn3/ezcjp/FEIFho7GPCAQ1RfXiA7oSEB4q7OzpCnf8vrQe1z2ah9MdFnB8wrqUbEtNgmC4zrnSgHk7onnZfW5Y+s/UeWQXZ4inxMuXIG9OYJ/5y7uCnPyFRefYYZl2ZN3Q=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index:
 AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAGXh4D//4qBgIAAiieA//+hwICAAdt2gA==
Date: Wed, 11 Dec 2024 06:18:09 +0000
Message-ID:
 <BL1PR12MB584995DD26230520757848C2E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
In-Reply-To: <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8230.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8119:EE_
x-ms-office365-filtering-correlation-id: 500ee935-bdc2-43f4-b46c-08dd19ab9542
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXl6UHA0SkZueEg3aUFURWQ4UmZCWkQrY2pqcUhnMDlMbkp2bUdsUS95aXVH?=
 =?utf-8?B?N0JHTzdFbHFTOFhCVTJneEZoaFJnMVlyL2VTbW5XbXVqQWIvTE9zeW51Y0ZG?=
 =?utf-8?B?OWNkbFY5dHo0Z1lUN3dOa0xRc3lJUXlMak03V0J3R1NCbDZBQ3czb1lPNlF2?=
 =?utf-8?B?UkxzMjltRlJ5emc1K1Erc1BKTTVFaHdxKzdpZ3ZnbW5QaDJkS2NyK1QwQWUx?=
 =?utf-8?B?bFNYVGNHbTFsWXIyRlA5YU1acFFtM2s4WVE0dUJIdG9Hd0djVmdWeHFlbGtm?=
 =?utf-8?B?Q2ZpYmZ6VXR3Q2QzWnB0QXAzdzlYNDZ3a0pSc2FJS0pNMEZNSnBOWi84M0dV?=
 =?utf-8?B?Zkk4ZlQrdHZMRDlIVnlkUXgzQWlhN0IrVnF3c3AwNWZhZUtXSG1jNmNLc2xB?=
 =?utf-8?B?NWo4Y1EyZ2NBNVptdUlRbjQ2TWZkdFY0NjZCS1VwelpuZXl5VGJjMnE3QTJK?=
 =?utf-8?B?SWJnOEFheS8zL1VtS2lHRGZ0aHZ1aDg5SkthWFhTclFrcU1iS3JCZmd0Z1pR?=
 =?utf-8?B?L2hEdHFwT3NXbEhRUG96Y2cxWjVJTGlYRG82ZkVxNVpuODUrMnYzeFZZK1R5?=
 =?utf-8?B?Q0NmaUFMT09LYW5ZSXpXTTUxQUQ3NzZ5RkZxMG9mVmc1Z1VadkcxVnlGMWZ3?=
 =?utf-8?B?WXp1elV4bXdIK3VFeDR6RUwwYW1Mc3p0ejhsdzBCaGd1TDZScktkVUUvQm1U?=
 =?utf-8?B?NHo5MEx6cnFyUXp6VHFEdWVkZTZySlJLRWo2Nkxwa3VhM1p2cEpERzh4UFpm?=
 =?utf-8?B?ekxKQW5iV3p0T290NWd5R3pQLzB5bXU0dmRzMEUvdnlVdnZ3NzhkbnhUUFkx?=
 =?utf-8?B?cnhUVW8zUmgzU1ZNVXZlZWwvWDVoSjh0ZmZmUGE1NFdsMUdxNUlEaDJGZWdu?=
 =?utf-8?B?dDRtbkdIallUblRpTlpHL01yWjJ1aGJaVThjcWcrS04yaU1GRUlLUGxOQVRH?=
 =?utf-8?B?Z2pWUVRsVlhZQWU2bzUyNlQydmJHeXdLSGxCSXJmdG1EampTbFlycFk4bzAr?=
 =?utf-8?B?V1BDYjB0ZkRjM0EzMU1sZkJFTlBQR1M2V09VdlYxNVBITWk4Q2J5MWdmZll1?=
 =?utf-8?B?ZlV1LysyWlFzTVF6RjJ1YmlnKyswS0o0Y1lZb2ZVYnVtTXRSZVlDc2Zha2ZO?=
 =?utf-8?B?OSs0Tlk1WnRobmI3c2Y0dERZZzlReUxPYjg0T0xUYUgvYks4d2o1d25pcG5l?=
 =?utf-8?B?TDBRQlludkFBeTh4dDhXby9GS0VUL1doWmRoVmR5UXVERlZkcmRTcEZ2M2lY?=
 =?utf-8?B?bjgrRHdxYVZaVjRtQ0MvcmZhNHkxakhVOVoxSlpEaThVLzZabGZyZVpjT09M?=
 =?utf-8?B?TTlpMkNJNjM1NjEvT1RpdlJPQk1UWkJYZEhwZTQ5ODRxbURyWmZtcEhZSkk3?=
 =?utf-8?B?cGI2L251WEQzaEhjWk5iVnMzc1RhYVQ1VGFDaHlkM0lGWU12RkdTZEYvc2lz?=
 =?utf-8?B?enRNc0hETUF1U1dKN1dlUjZSUDQ5QmFPMnVaUEI4Rk84OEpUVzE1SW5ONURq?=
 =?utf-8?B?THorb2EzMEllckZzRElJT2xweGlRZXRGZGdIUlBBZWRBUnFsT3lkbG1MeG9B?=
 =?utf-8?B?M1NUV1lva0RBaHFNS3BMR2tZc2JuclBlaDU3c2N5ajVQeGtFOEJJQXNzZWpK?=
 =?utf-8?B?UXpvT1lEQjF1WmJScnVrdnJyRVJ2bi9iS01MNVNRMWoxT3FDbCtRcUNLNlhL?=
 =?utf-8?B?NHpRK0c0dUZyYlIxZmhOUi9SdUJRWUF1NVRNOGJjb2xVZ2R6VllSRXBuQklr?=
 =?utf-8?B?ODVWUG02VTlzSnFCT3hLUEFaQ3g2L2hrem5aejVsemw4WUlDZ1pJN21OdHNO?=
 =?utf-8?B?Qlhidk1VeWk3cjhVUldDblRBaVRGMkpMc1NJL0pWMnNwbWdhbE4vTzJLcEll?=
 =?utf-8?B?dWJqbFEzQjNOQjdIam9zb1hCTXRBenV6TFFlQVFsUHcrUkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TitHVy8rTUdtKzYvazgrVmZpeGJiZjg2SkVsMEpxaFcxamg4RCtnREZmZGlo?=
 =?utf-8?B?ZmlIdnB4ZUdZQXFHc2ZHZW0vM0pKaWtFY09GL09wQlJCN0E1T2tQU21Oc3dO?=
 =?utf-8?B?TzJkUFJ1TUVKMU1jcEdCRVA3ZDlFWTJWc3pGU2J2NHhISEFnQnVuenN1cVBM?=
 =?utf-8?B?NnhOaUZoN0MxTUxCdndCeW5SWFdIZ0gvNlgxbHY2TWt3VUtaMXV1bDFSb0s0?=
 =?utf-8?B?VUswQnJuQTF0NkdBTWZPenRDRGdlN2JKSXZDcldOaksrc3RCM1ZrR1FVM1g2?=
 =?utf-8?B?T2ZIVHVrcnBSazN3RllhREdHMnA0RFJDei9yZ09Ld3dDbzl2MWg3eUNIa1do?=
 =?utf-8?B?a2lIckQvY2ZheUhRbi8wM3lKZmdzclZTU2xWZU4xMmtpTnZLZ0tUS0o0UTdh?=
 =?utf-8?B?MFo2N2ZKa2R1MUJiRlNkdHhDUWtUN21QT2tzZ1FVVkRTdzhYU0pJVVMxajlu?=
 =?utf-8?B?amM3MGh2L1h0SStlZFZidUw5NkhEQVp3OW9oUFFMUWpNbCs4ZE03U2ZoTUJV?=
 =?utf-8?B?QUQ2NkIxSks5bEhWNE1IcitUd24yclZrbDFBT2Q1L3VSRVdJMGRBWEJXVWcw?=
 =?utf-8?B?U1czUFBiU1dPZm0vWXFGcUtPL2c2cGkzZFEzMDdlbDVtKzU4dGY3S1FNLzRH?=
 =?utf-8?B?dUNvSFpEZUZTLzg5TVNaUmpsdjE5RlpHbzh4dzBOb053MFJFSjZRS2dBdnJP?=
 =?utf-8?B?eDlOR2h0R3RieUg0cFArRW03dnhraVZCaVZFS1NYSld4QWRPWVUrMGVDc0N2?=
 =?utf-8?B?Z0hVWHVxRFNiWlpyVWJIM1dQZUNsT0VGU2Q0WDVhZHJHZXJvS0t1ai9uQ0RU?=
 =?utf-8?B?WmJ3ODVuSTVnY2dKQUJWeWdtMnNJM1BaQUR4ZGROY0lZZ0hFZ096NENEN2lC?=
 =?utf-8?B?Mmpta05rV2dMK2tHRnBjMHN6aURsKzFSTUkraVk3Tk9FN2dXbmpoVFFNWkgv?=
 =?utf-8?B?NG9WVzNNZjZBYUNPSWZ1c0ZrdVo3L3NKZzc2SDZWVDZjYWpxK1o1R0xaQXZn?=
 =?utf-8?B?U01Pb1VtWU1xTVY1QUlISE9XeUs1UFdDNW52cjZIa01kaXdjeDN1a2xpSG9P?=
 =?utf-8?B?V3A0YlROaG5VUGRTRkRuaHZCcVRaNHBWTDZOYVIvTXUxMEJMRC9pSTRmL3VU?=
 =?utf-8?B?Z2lsN3NTVXBhMDFIdVMvN3lOcDc3OENVOERqVzcwYm9BWXdQcDBQUVBrcmda?=
 =?utf-8?B?dmtXTE83V3VDbmZpN2wyZTNWdjFCcWtnY2lXQWxielc2WTZReUYrMVZRb21v?=
 =?utf-8?B?cjlnWVk1YTl0VWIzNi9aNTgya1h6cnZRQW9MREJFZVB3aGhjQWtISGwyd2xo?=
 =?utf-8?B?Ylg2S2l4VUo3V1RIdkRNUnpQYytialc4S3lIZ2krdmd2RW95Vk1BWnRaanRh?=
 =?utf-8?B?dm5uK2JmV28yRU9wSG1DYUZwRWV5WDQ3QTZvZytLMERYam04dDk1MzdPN1pU?=
 =?utf-8?B?Z1dVUFkzbXdvdDYrQWFCMS95T0hxVDZHU0w5WVdsVkVCSE5kSmtXZm5KTWRt?=
 =?utf-8?B?em9jeWtsQklYWFJSQ3lmQlRhOTJxSmZ2MVZ2TkR0QUU2anhBSXMvYzNVZFJ2?=
 =?utf-8?B?bnRtUzRGb0ZJTSt0QW1Weks5UGU1c3kxU28xa3dXMzNRc0JHZWJGS1hMaVRw?=
 =?utf-8?B?eWdsREJUcnVyay8ydTdBSm4yWHF2NHRnM29PQjZrM2M2cHBvRkdvT0daVThO?=
 =?utf-8?B?ZmNVZTlQWHNBL2Z5TzBZa082c1pnYlRCZU15enVJeHQwUjBoQmtyMHNQUkpG?=
 =?utf-8?B?YS95Sm5JYnhrTTl0eDhFaE5KS0toczNxM1UvL0VmZVBIVmY3M2YwYzRibUJj?=
 =?utf-8?B?R0VMRGtpMXczSkR3TjJ3dldYOWRRbjFCbGNVdTYxQ0JmNFVDMmtqNXpTNjBV?=
 =?utf-8?B?OE5BMmR3RzM4bnd0KzY2T0J4REp1aFlNS05QY0c4OUgrenBMamRjSTFyTkxC?=
 =?utf-8?B?THovM2dIMmtzNE1MMFNZV1pNR3BEaXErY2hkbjd0Y2pUak1WU2lMaTM5Y0NS?=
 =?utf-8?B?Zm1SUmJ6U3p2US84bkkyWHduZVBDSkx1ZjcvSWF1R1owbURNUlN2UXNEUzRx?=
 =?utf-8?B?Q29aSER5blhJbnYvZXJHbUN6VVFRLzMrOGlqWS9BOTU2U1JCYzlYKzhDUlJK?=
 =?utf-8?Q?Fbak=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30ADA8F23712414F8A4AA8E8CD481F74@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500ee935-bdc2-43f4-b46c-08dd19ab9542
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 06:18:09.0207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7y/lY6/RqOmU+FGPBZdcfEUDhQqNtJjHsN9oR0/pleYMAqLNS9RBSKjportMik3JcSfKoHxLaWZpkpK481LIFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

T24gMjAyNC8xMi8xMCAxNzo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjEyLjIwMjQg
MDg6NTcsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjQvMTIvMTAgMTU6MTcsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEwLjEyLjIwMjQgMDg6MDcsIENoZW4sIEppcWlhbiB3cm90
ZToNCj4+Pj4gT24gMjAyNC8xMi85IDIxOjU5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9u
IDAyLjEyLjIwMjQgMDc6MDksIEppcWlhbiBDaGVuIHdyb3RlOiANCj4+Pj4+PiBAQCAtNTQxLDYg
KzU0MiwxNiBAQA0KPj4+Pj4+ICAjZGVmaW5lICBQQ0lfVk5EUl9IRUFERVJfUkVWKHgpCSgoKHgp
ID4+IDE2KSAmIDB4ZikNCj4+Pj4+PiAgI2RlZmluZSAgUENJX1ZORFJfSEVBREVSX0xFTih4KQko
KCh4KSA+PiAyMCkgJiAweGZmZikNCj4+Pj4+PiAgDQo+Pj4+Pj4gKy8qIFJlc2l6YWJsZSBCQVJz
ICovDQo+Pj4+Pj4gKyNkZWZpbmUgUENJX1JFQkFSX0NBUAkJNAkvKiBjYXBhYmlsaXR5IHJlZ2lz
dGVyICovDQo+Pj4+Pj4gKyNkZWZpbmUgIFBDSV9SRUJBUl9DQVBfU0laRVMJCTB4RkZGRkZGRjAg
IC8qIHN1cHBvcnRlZCBCQVIgc2l6ZXMgKi8NCj4+Pj4+DQo+Pj4+PiBNaXNyYSBkZW1hbmRzIHRo
YXQgdGhpcyBoYXZlIGEgVSBzdWZmaXguDQo+Pj4+IERvIGJlbG93IFBDSV9SRUJBUl9DVFJMX0JB
Ul9JRFgsIFBDSV9SRUJBUl9DVFJMX05CQVJfTUFTSyBhbmQgUENJX1JFQkFSX0NUUkxfQkFSX1NJ
WkUgYWxzbyBuZWVkIGEgVSBzdWZmaXg/DQo+Pj4NCj4+PiBUaGV5IG1heSB3YW50IHRvIGdhaW4g
dGhlbSBmb3IgY29uc2lzdGVuY3ksIGJ1dCB0aGV5IGRvbid0IHN0cmljdGx5IG5lZWQNCj4+PiB0
aGVtLiBJIHdhbnRlZCB0byBzYXkgIlNlZSB0aGUgcmVzdCBvZiB0aGUgZmlsZSIsIGJ1dCBpdCBs
b29rcyBsaWtlIHRoZQ0KPj4+IGZpbGUgd2Fzbid0IGNsZWFuZWQgdXAgeWV0IE1pc3JhLXdpc2Uu
DQo+PiBZZXMsIEkgbm90aWNlZCB0aGF0IHRoZSByZXN0IG9mIHRoZSBmaWxlIGRpZG4ndCBhZGQg
VSBzdWZmaXggdG9vLg0KPj4gU28sIEkganVzdCBuZWVkIHRvIGFkZCBVIHN1ZmZpeGVzIGZvciBt
eSBuZXcgbWFjcm9zPw0KPiANCj4gWW91IG9ubHkgc3RyaWN0bHkgbmVlZCB0byBhZGQgVSB0byB2
YWx1ZXMgd2l0aCB0aGUgdG9wIGJpdCBzZXQuDQpHb3QgaXQsIHRoYW5rcyENCg0KPiANCj4+Pj4+
PiArI2RlZmluZSBQQ0lfUkVCQVJfQ1RSTAkJOAkvKiBjb250cm9sIHJlZ2lzdGVyICovDQo+Pj4+
Pj4gKyNkZWZpbmUgIFBDSV9SRUJBUl9DVFJMX0JBUl9JRFgJMHgwMDAwMDAwNyAgLyogQkFSIGlu
ZGV4ICovDQo+Pj4+Pj4gKyNkZWZpbmUgIFBDSV9SRUJBUl9DVFJMX05CQVJfTUFTSwkweDAwMDAw
MEUwICAvKiAjIG9mIHJlc2l6YWJsZSBCQVJzICovDQo+Pj4+Pj4gKyNkZWZpbmUgIFBDSV9SRUJB
Ul9DVFJMX0JBUl9TSVpFCTB4MDAwMDFGMDAgIC8qIEJBUiBzaXplICovDQo+Pj4+Pj4gKyNkZWZp
bmUgIFBDSV9SRUJBUl9DVFJMX1NJWkUodikgXA0KPj4+Pj4+ICsgICAgICAgICAgICAoMVVMIDw8
IChNQVNLX0VYVFIodiwgUENJX1JFQkFSX0NUUkxfQkFSX1NJWkUpICsgMjApKQ0KPj4+Pj4NCj4+
Pj4+IFRoZSBsaXRlcmFsIDIwIChhcHBlYXJpbmcgaGVyZSB0aGUgMm5kIHRpbWUpIGFsc28gd2Fu
dHMgaGlkaW5nIGJlaGluZCBhDQo+Pj4+PiAjZGVmaW5lLg0KPj4+PiBPSywgd2lsbCBhZGQgIiAj
ZGVmaW5lIFBDSV9SRUJBUl9TSVpFX1VOSVRfQllURVNfTEVOIDIwIiB0byByZXBsYWNlIGFib3Zl
IHR3byAnMjAnIGNhc2UuDQo+Pj4NCj4+PiBXaGF0IGlzICJVTklUX0JZVEVTX0xFTiIgdGhlcmU/
IFRoZXJlJ3Mgbm90aGluZyBieXRlLWlzaCBoZXJlLCBJIGRvbid0DQo+Pj4gdGhpbmssIDIwIGlz
IHNpbXBseSB0aGUgc2hpZnQgYmlhcy4NCj4+IEl0J3MgYSBuYW1pbmcgcHJvYmxlbS4gV2hhdCBJ
IHdhbnQgdG8gZXhwcmVzcyBoZXJlIGlzIHRoYXQgdGhlIGJhc2ljIHVuaXQgaXMgMU1CLCB3aGlj
aCBpcyAyXjIwIG9mIGJ5dGVzLg0KPj4gU2luY2UgdGhlIHNwZWMgaGFzIHRoZSBkZWZpbml0aW9u
IGFib3V0IHRoZSB2YWx1ZSBvZiB0aGUgYmFyIHNpemUgYml0cyBvZiByZWdpc3RlcjoNCj4+IEJB
UiBTaXplIC0gVGhpcyBpcyBhbiBlbmNvZGVkIHZhbHVlLg0KPj4gMAkxIE1CICgyXjIwIGJ5dGVz
KQ0KPj4gMQkyIE1CICgyXjIxIGJ5dGVzKQ0KPj4gMgk0IE1CICgyXjIyIGJ5dGVzKQ0KPj4gMwk4
IE1CICgyXjIzIGJ5dGVzKQ0KPj4g4oCmDQo+PiA0Mwk4IEVCICgyXjYzIGJ5dGVzKQ0KPj4gRG8g
eW91IGhhdmUgc3VnZ2VzdGlvbiBhYm91dCB0aGlzIG1hY3JvIG5hbWU/DQo+IA0KPiBQQ0lfUkVC
QVJfU0laRV9CSUFTPyBQQ0lfUkVCQVJfU0laRV9TSElGVF9CSUFTPyBQQ0lfUkVCQVJfU0laRV9T
SElGVD8NCldpbGwgY2hhbmdlIHRvIFBDSV9SRUJBUl9TSVpFX0JJQVMsIHRoYW5rcy4NCg0KPiAN
Cj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


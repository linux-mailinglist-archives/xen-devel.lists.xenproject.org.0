Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D946BB1ACD4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 05:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069914.1433589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8Vr-0007Um-So; Tue, 05 Aug 2025 03:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069914.1433589; Tue, 05 Aug 2025 03:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8Vr-0007RE-Pt; Tue, 05 Aug 2025 03:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1069914;
 Tue, 05 Aug 2025 03:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KS29=2R=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uj8Vq-0007R8-AM
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 03:38:54 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2407::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3fd1e83-71ad-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 05:38:52 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 03:38:47 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:38:47 +0000
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
X-Inumbo-ID: b3fd1e83-71ad-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+P1l2skQb/+MPoHaDQ9E6iTp2YDdI6LlRXjWSMkfcH62k/zvW1YFdvbpWSaJgRj4rTQAb2T6gFsPeLCiEXOBElJALz7QgF6egm0zWX8AhyZGsiqYlYArp95Pg0kk3fppUaetIkKjE8vNJECg2ApAj/3CFestJ1Atmuiqf8nVXz0TVQOJ0snZhCccmZN/HsmO4ocyMM2VsckF1hSlUAwZE1mQBMTbJ0snG1FeJc2e9YyejG/R4QE4a26P0hZ7eKFdv8iiH5UWX2I7OwUOP+iEcnOKk5vm8XO87A4IepBA6cH0GE//Nhbf7PIpko0LNiMhOq+8mjt1/QtcAv6z7jSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86mT8uL4FvixMVJuXxW4Wj/wwv2wlMHOKFATAOBdTwQ=;
 b=hBhZn8EF3BPqexBNbif8mxhn1tABgxMM6CDrkZthgWG4G40bDL7dR9DvOXIV7PVQmpIlegT33Iftsa0oKoZH19LiuTPnB2lVcL46Bl1a8sn2qcFBIoSF9AoUC5xi8J5hiYprf1dp6ikDll2tiFxg4dE+AWBKUXo3BLo8nZ425hMxnArvt7wUNFYDtECQ4n72ZIb42I1RlidvNHzOpMFWSixIvsPanz6Y2mNlUo6nM4txRE1rYtpaAHdWN/OgjeQn/gFzyYZNkwU2C/c8ami2sttsKBq9N4EDyGsS3xLN0RHQjKiG9clXBjhtVuIlcjHm5wi8UBy8niOhPvXiP5cj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86mT8uL4FvixMVJuXxW4Wj/wwv2wlMHOKFATAOBdTwQ=;
 b=XZoJv3xM/Tq2EghgPlq3JItXbwFg1uHRZP4BoCTufxt1U8MWTfQ+5URO372/9C2JZmy5bqqaETaHttC6rVwcx59Qeavq98qTL0StuupjO0hfqVLdmE6QjCqmTIxbx8Hpmp2rIfSybn40jBMpr4KU8P7HXFZfIz6hibWQ/J5/b4g=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 01/25] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Thread-Topic: [PATCH v1 01/25] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Thread-Index: AQHcBFu8ZJDiUyPinUSx+WVIYPWedrRSHgaAgAAiBnA=
Date: Tue, 5 Aug 2025 03:38:46 +0000
Message-ID:
 <DM4PR12MB84510F1F89641B672916C055E122A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-2-Penny.Zheng@amd.com>
 <371bc812-acdb-41ef-950b-3c9e5feea48e@suse.com>
In-Reply-To: <371bc812-acdb-41ef-950b-3c9e5feea48e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-05T03:38:18.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH0PR12MB8530:EE_
x-ms-office365-filtering-correlation-id: d8991b83-a7d9-4829-4d64-08ddd3d195ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eGlEdmN3MWs4cVhDdkhvOFVPSlQ4ZXB4VUpqcGhHTnU0dXVNTC9kZTh3eDJ5?=
 =?utf-8?B?VHF3R25CdDBqZzNpSW5MQjRrMDZOMFZPYnFsYVZvNmpucU5HRUJqNFRPV3pB?=
 =?utf-8?B?TElSZVNRLzJiaVRuN3NXKzVUWi9wVmtkODBHRVljSUl3cVREdGtXVVBpeEk1?=
 =?utf-8?B?UGE5eHZDbFZ1bWM4MGwrd3VLRWRqVFpTdXlDZXdhcVUxajhiWUF6YmxBYzFu?=
 =?utf-8?B?TEd6bmFVWndFdERRb1BWeDQ2bzVKV3AzTHhVcWQ2RVpTZVpZTy9CKzRSYjBY?=
 =?utf-8?B?Z0NlTkxBQlluTkxEV1FmK3hDUFUvTHBERmw3eW9tVUx0Vmk0TzR1ZTlxT0R4?=
 =?utf-8?B?emNwNHBGNStJWW4yeDFpYk5HbEd1VkNLY0hvd01odmJxUTFaZXJCeVpycTNH?=
 =?utf-8?B?cDJyU1VhZGpqN09WUjh6TmJrZWhRRnJmbmZHdWU5dGZaUU03WUs2M05IUWky?=
 =?utf-8?B?RHpRQXdnekIxWGdyU2ZTYTBIa3QxeVcvenRYbXl4NVNXZjZqdm42QlJzY2tE?=
 =?utf-8?B?MmJESmJOZHBiQVVrMjN1U0cvTmdCN1dPWEcwVzhLZTNVRWlMd3U3YnZWU1NC?=
 =?utf-8?B?WXBrcWFvTGtzZHgrRGYwTjBNL0JtQmxXWFJ5WWcxSGQvbGlqUWtQUFFhT1JH?=
 =?utf-8?B?bDJtNHhVZjE5b1RmbXNKTGZ6R21BZmZ5MkpaOUUybDZZT2pjYS9xdk4xN0Vp?=
 =?utf-8?B?Q2VvazBYaXdwb004VExDUVJaeVczL1JDa3FDOENUalVWV1hEdUh3ZWVjVnpk?=
 =?utf-8?B?a29USDlHdWpBeVFPK0xDUGtVN01TRjRRQ0p4WFpqZDU5bWxlS29lajhGUlJh?=
 =?utf-8?B?cndpSUU1V0lxd3dFTWprczBpSC93bngvejhwTmlUaGQ2Uk9kb0hXWHJCK0Ru?=
 =?utf-8?B?cUpKUk8rTkovYlBtU0hIRjBLNFFjY2t1RjFaQkMwM0E4ZTljYXZtN1RLYUsr?=
 =?utf-8?B?YzVtbURpaE5sK2xESWxFVXpWTjBwb0ovdXRnbkNGMjB5d0R5ZlhiSVlaZ1hn?=
 =?utf-8?B?Ym84MHVheEFYcmlWTis4a1Y4VXpYSk1VbVlOc3hrVGR2ZU5jTnZhWnNPOFRB?=
 =?utf-8?B?Q2pFUlgrT2FmNzdjakdTc09acUlxZDQxTTk1emxxNEh5bW5oN2FyNS9ZTEgr?=
 =?utf-8?B?ZlpDbTBDL3pmei9FVDRUUjQ2OFovbzl2cWpYNXpRcUxETVhZc3NLeGY0T2pW?=
 =?utf-8?B?bmRkS2ZnYkt1eEdCYTRmZ2Z2MHdTbkxXRVhyWm95TlZqT3Q3RlF0QStWYVRG?=
 =?utf-8?B?c2pDR1d6T1J2dWJDSmlwQk5YU2M4OVl2bjNDUVJFa3lhWEJmWUVuRWw1STIv?=
 =?utf-8?B?UytYYkZJR2ZhRDFibXMvWUNJb0lZVVBieFh6TW1Ub0ZFUUdKZVJIWHVGaVJZ?=
 =?utf-8?B?S1hGUFN2eThQL1h2TXBUc3R4dGRPMkZZOFZ3dU4reDNPcDNXUXZGQVh6WStP?=
 =?utf-8?B?WTRVdVpyLzNtR1RRZzdKNGdhQ1I3ZG0wRTVjQTVBZWdSUXdxaGtIeWp5ZEI4?=
 =?utf-8?B?a21FVTI3RzdQV1V3OE9zTkFzTWVrckN5MSt3ZUJSblFGejI3dDRNb2RYc2RT?=
 =?utf-8?B?bzI2bGNUMHR0czdUZHU2OGNjcytvcW9yT2psTHJ0UzZqMW1scDhPeDhiRExX?=
 =?utf-8?B?UkZrR0QraE50bmFuS3VoeVR4QmFwTUNJTk0vNHVyUklQSlBDMVZnWEFnWkRK?=
 =?utf-8?B?V3pIZWg2UUIreStDTnU2aEw0cEp6L2ROaHltSVNPVEFiMUp1UG02b08xV245?=
 =?utf-8?B?dmdtN3lGNlZNZG5tYzhLMDhHNzdIUGdmR09PN0RTZVJoS01SWE4wVXg3MEVn?=
 =?utf-8?B?MkdkczFhWFBFb0FROUVUVlR0RE9XeE1iakMwOGVFQjlrSndYR3ROdWI1TUtv?=
 =?utf-8?B?RGplSFFEeGRtNEt0WFVJUUhIc2VINkI2ck5GMGhVOVV3R0FiaWYxNktDQlMw?=
 =?utf-8?B?aEFmbmNaaHNaeDZKUUF3bTJHVHRDeGw0SEpmNWljWWhhSDJZSVB0RXl4NXNM?=
 =?utf-8?B?dDUxYTgra2RBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1A0TU5wU3hmU2pPRm1hRFlDdWdERzg3NElRWEpWL0V1YVdrcHdoWjFZVVdh?=
 =?utf-8?B?eW85S3F1ajN3MkM2cmh6OU5pVWxYd1lTS2lMSDI3cGhuaEh2bUJhRytFR1k2?=
 =?utf-8?B?QmdQNjBYcGZTVnlxWE5kN1U3b0h2VlJPRzUvOTRiMVhWNlJYVkFXYjBBMEho?=
 =?utf-8?B?cEVWZENzbktLdFFrMlgrZldWVjFPaitDSWVJUHJ0OFlycXJrbCtVeDV4ZFNB?=
 =?utf-8?B?dWRKTG45bzVBdkZUekpDY00rT1V1cE1BOWR2cElxRis2bnJlbzBTRUdnMzM2?=
 =?utf-8?B?QXZFeHlXbnptSVhwcUp3OFJrMThVNjZ3Vjd5Mzd6cTB4Z0oyLzVVSTN0VkVv?=
 =?utf-8?B?UzE5M1l1L2lhemtoaEl6c2Z5U2NWWHBnVTBkaW9UbVRCUXZydUh3ZkRTbCtQ?=
 =?utf-8?B?MGkySzZNRi83NlZLVUk3ajF2ak5iMmxQSkRLRUxuRW5VWEYrNy9TZDJ6UzQ3?=
 =?utf-8?B?bGY5a0daT1NIMVdHYlpoUWJ0M0V4NllQNWxNYkNjcHZtMzBldWVjNkEvc2NI?=
 =?utf-8?B?V0hxT3p4ZGN3Wi9ZVElaOWhOWnU4MjVCQkJ3U2ExNExueW1UWjFNZGVoTzZJ?=
 =?utf-8?B?WnlHK2tSKzNBcks2YStDN2F0S3EzWmVYakxXYmEyTHBac0lLZW9JU3VLUWRs?=
 =?utf-8?B?RERqeTdGaHdCYWJEanR2ZFBOaFEzMGdjeG1uUlhsTWJOVFNrSkx2TkZHZytD?=
 =?utf-8?B?cXlhK0FIdFVsVU1sdTBhZ1h1VXcvWEQ2ZmZyUTVDRzJLOVF4c0tYQ0dvWGJD?=
 =?utf-8?B?dGRUUVIreUI1R2ZKWHhJTURJV0k4NDY5UzFGV3VBbVlST2Q0Rk1DNUZxWHRo?=
 =?utf-8?B?Y0EwM3J4SHZOUmZzV2h1T0V0cThLeG9SSEgvR3h1VXNFRGFxSTNGVTl1SWV6?=
 =?utf-8?B?T3gvdFN1VG1YNFM3RnlaeHpCa25iQ0dXN2l1R3JjQVQrVVhEV3hrZXJvNHZ0?=
 =?utf-8?B?M1hvaFF6NkNtOXJEbnhDaVg1T1k0Y1BIbzc5S1JQVThKM2YwU1I5Ui9jZEU5?=
 =?utf-8?B?VXZRRHBTb3dLNTNGWmlSeVg5K1gxMTIxVUVmVmVUUnVhanpNblJHL25kcW0y?=
 =?utf-8?B?Tm0yK1NhWmZ4L01pRFRRUU5DZkEwbzdSSklDclBjc3JwMjZDRUY2NURqN3h0?=
 =?utf-8?B?SlhzRHdOc1htUDBGV1hTMzMzWnIrTTR1WTJrRXhpQitkb0JHMTlhbElmSHBX?=
 =?utf-8?B?RExwTzRzbjI3eXhiSkk3ckZrKy9rT3dTT3doVTlTQ3MrRU8xdVN1R2JFWStH?=
 =?utf-8?B?blQ0a2JpQzFPUldEblBhU2J3RU9xTEdtZVZXbEVxOTE3bDA5WlZqa1hpa2Fo?=
 =?utf-8?B?RlNQQW9YNjV3V2lUcVdJN0s0OFhyTnY5ZC81T2VoYUhZY1Rmc2dZbzFheVdh?=
 =?utf-8?B?OUY3V0NRL3hIUS9QRlM1R3V4aHh4Q29xZFBJQU85aEJLdGF4dDBSZWNjaDNG?=
 =?utf-8?B?WHZwZ29vZVpubU5VSndxUk9kT0FIczBCcGpXUllEYVQvbTNHZ3BuenJWY3py?=
 =?utf-8?B?VXV0b1BDLzIyN1FLRm45SXRwMDVhTkdWajU2ZXh0NXoyYkpHRWx0V2F1b0FX?=
 =?utf-8?B?ZGFQZFIxL2libjhNeldGY2c5YUtTVVpzaDhKSlBnVUwvY3VYMVBvQWNsY1BJ?=
 =?utf-8?B?SEVXeE5OUGEzdXVOSDBNVXI0Y2ZQUElKVFhUZFM0aWJJSW5vNnhCWHJzcWl3?=
 =?utf-8?B?VlVHdnB1ZVJ4eGRvQWg4R1ZTVkhhS215cTZTcTFYYy95QWJ1NElOZ24zVGd4?=
 =?utf-8?B?VTc0K1VxWm0rSzA0Y1JGVTZqSS9OaGRkWU16RUFGeWxUUVlhSUJMNjlRdFFU?=
 =?utf-8?B?RHU4UUNvaXZjNUJQOTN3SnNiN2ZJcFFZREROZkpMaUVjNFlCSjRNdG5qSmZF?=
 =?utf-8?B?R1hrREJrSUQxa1pKTHdFSVBIZEZKZ2V4amZjYk9jK0hWSWdkQzlick9IS3FX?=
 =?utf-8?B?MktEaG9VbWZLVnJGd00veDJIK1JNc2hhRTVJcFZzMUpwbktYMmgrUVhyWTZs?=
 =?utf-8?B?WTVaVmdUbFZxM2hxRFdZV0ppV284VkhqMkpVMW9hQ3dKKzdkOVhvSmFuejhN?=
 =?utf-8?B?aUFpcUtFT1VWbTIreDhsL0s5VzcwWGJsbC96eHV3SjRSdXFJMVNBZGFOWC9p?=
 =?utf-8?Q?uvY8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8991b83-a7d9-4829-4d64-08ddd3d195ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 03:38:46.8561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkKofvJEmR5tkCaMVHoDwDHYO3Z3FzkIzCGm53KjHQPhnK6xhb1q08ubO5zsYM5Bt8+FsJ/UjVZPJgXSAzmfsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDQsIDIwMjUg
Mzo0MyBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVs
LCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYx
IDAxLzI1XSB4ZW4veDg2OiBtb3ZlIGRvbWN0bC5vIG91dCBvZg0KPiBQVl9TSElNX0VYQ0xVU0lW
RQ0KPg0KPiBPbiAwMy4wOC4yMDI1IDExOjQ3LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBJbiBv
cmRlciB0byBmaXggQ0kgZXJyb3Igb2YgYSByYW5kY29uZmlnIHBpY2tpbmcgYm90aA0KPiA+IFBW
X1NISU1fRVhDTFVTSVZFPXkgYW5kIEhWTT15IHJlc3VsdHMgaW4gaHZtLmMgYmVpbmcgYnVpbHQs
IGJ1dA0KPiA+IGRvbWN0bC5jIG5vdCBiZWluZyBidWlsdCwgd2hpY2ggbGVhdmVzIGEgZmV3IGZ1
bmN0aW9ucywgbGlrZQ0KPiA+IGRvbWN0bF9sb2NrX2FjcXVpcmUvcmVsZWFzZSgpIHVuZGVmaW5l
ZCwgY2F1c2luZyBsaW5raW5nIHRvIGZhaWwuDQo+ID4gVG8gZml4IHRoYXQsIHdlIGludGVuZCB0
byBtb3ZlIGRvbWN0bC5vIG91dCBvZiB0aGUgUFZfU0hJTV9FWENMVVNJVkUNCj4gPiBNYWtlZmls
ZSAvaHlwZXJjYWxsLWRlZnMgc2VjdGlvbiwgd2l0aCB0aGlzIGFkanVzdG1lbnQsIHdlIGFsc28g
bmVlZA0KPiA+IHRvIHJlbGVhc2UgcmVkdW5kYW50IHZudW1hX2Rlc3Ryb3koKSBzdHViIGRlZmlu
aXRpb24gYW5kIHBhZ2luZ19kb21jdGwNCj4gPiBoeXBlcmNhbGwtZGVmcyBmcm9tIFBWX1NISU1f
RVhDTFVTSVZFIGd1YXJkaWFuLCB0byBub3QgYnJlYWsNCj4gPiBjb21waWxhdGlvbiBBYm92ZSBj
aGFuZ2Ugd2lsbCBsZWF2ZSBkZWFkIGNvZGUgaW4gdGhlIHNoaW0gYmluYXJ5DQo+ID4gdGVtcG9y
YXJpbHkgYW5kIHdpbGwgYmUgZml4ZWQgd2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIENPTkZJR19E
T01DVEwuDQo+ID4NCj4gPiBGaXhlczogNTY4ZjgwNmNiYTRjICgieGVuL3g4NjogcmVtb3ZlICJk
ZXBlbmRzIG9uDQo+ID4gIVBWX1NISU1fRVhDTFVTSVZFIiIpDQo+ID4gUmVwb3J0ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZyA8UGVubnkuWmhlbmdAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiB2MSAtPiB2MjoNCj4gPiAt
IHJlbW92ZSBwYWdpbmdfZG9tY3RsIGh5cGVyY2FsbC1kZWZzDQo+DQo+IEFuZCB5b3UndmUgcnVu
IHRoaXMgdGhyb3VnaCBhIGZ1bGwgcm91bmQgb2YgdGVzdGluZyB0aGlzIHRpbWUsIGluIGlzb2xh
dGlvbj8NCj4NCg0KVGhpcyBjb21taXQgc2hhbGwgYmUgY29tbWl0dGVkIHRvZ2V0aGVyIHdpdGgg
Inhlbi94ODY6IGNvbXBsZW1lbnQgUEdfbG9nX2RpcnR5IHdyYXBwaW5nIiwgKEkndmUgYWRkZWQg
aW4gY2hhbmdlIGxvZywgaWRrIHdoeSBpdCBkaWRuJ3QgZ2V0IGRlbGl2ZXJlZCBpbiB0aGUgbWFp
bCBsaXN0IGluIHRoZSBsYXN0KS4NCkFzIFBHX2xvZ19kaXJ0eSBpcyBkaXNhYmxlZCBvbiBQViBt
b2RlLCBwYWdpbmdfZG9tY3RsKCkgd2lsbCBzdGlsbCBoYXZlICJ1bmRlZmluZWQgcmVmZXJlbmNl
IiBvbiBQViBtb2RlLCB3aGljaCBnZXRzIGZpeGVkIGluICJ4ZW4veDg2OiBjb21wbGVtZW50IFBH
X2xvZ19kaXJ0eSB3cmFwcGluZyIuICBJIHRob3VnaHQgaXQgYmV0dGVyIHNpdHMgdGhlcmUuDQpJ
ZiBpdCBkb2Vzbid0IGNvbXBseSB3aXRoIHRoZSBjb21taXQgcG9saWN5LCBJJ2xsIG1vdmUgYWNj
b3JkaW5nIGZpeCBoZXJlLg0KDQo+IEphbg0K


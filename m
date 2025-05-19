Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F8BABB552
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 08:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989534.1373554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuDr-0004bl-5e; Mon, 19 May 2025 06:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989534.1373554; Mon, 19 May 2025 06:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuDr-0004ZQ-2S; Mon, 19 May 2025 06:43:39 +0000
Received: by outflank-mailman (input) for mailman id 989534;
 Mon, 19 May 2025 06:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhbn=YD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uGuDp-0004ZK-6k
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 06:43:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:200a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95639ede-347c-11f0-9eb8-5ba50f476ded;
 Mon, 19 May 2025 08:43:35 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 06:43:30 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 06:43:30 +0000
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
X-Inumbo-ID: 95639ede-347c-11f0-9eb8-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEmNWwFHeMJwvXyLQEAod8lXSAUDjOZuv6QtxHrM+njh/R2X34MOs1dHusMgoeSSoHASMrFCq1WyDos+Xw2OKXKWk4GKWLRZ8nGNtPo/W/uQbKWl5XLB2clMcYgUNDbjGVg3tYWHJsay1Id25/EAXCe10qvpHvu5hbet0eBv4vs9vL0fAS6MsHS0I5ewAWH61hybeBLwjou0aVUAX+FswjfK8refcABfjba2/jjB4lTIkQg4Muc9lY6LUToOLhrAeADWpBUn0id4xYbqA69kzL5CwQ/zzjvYso9uaq3JP7NLdm7S/xyR4S+2Njktx/PGnY3pc5V2VlscIMs4qzh3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7PXkzJlOXDrW03fgMrk4mkgExt/e8dH/DsFJf7bY1E=;
 b=BLL4xpEcqxCu1JjqL8SLQzIGm4RkiZDzk/sjH5u7bOPoyhD903pp//Sdh3+2q3aWy92c/cqf/m5DT5B5Y6XQ6hKpbb4fz0KLwDQIObLfsLUpYQvDBhWrYEcuLe49GsIVZKkYdlk8hDy7UQ/CJP085IvGuUYxsBw65vZ3mZlJVI3OO2dB81BtCg00Xo5TG1i/jcyIdQcqyq5gfP1CN2zcZPoYstwX0lQi47cLnEX3cOZKivrCa1Uy9xCxS7P0cqXHiGmJmd/1fqoy0HpKJ+6Sz3h1oWcx01n+rb7xfAy7XFaaoYUly8llSKweGY8zTcw9LoAHeWeo7r0hR8UrFiaJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7PXkzJlOXDrW03fgMrk4mkgExt/e8dH/DsFJf7bY1E=;
 b=gzTZ1XFuyS+cL7OiV/3GGNGnQCGzyDG2Z30mFInnZAKmKgBAbs57p3I2hJiDFabZZFAJ0C0VOxfA3WyBkhLyOMqwNuthgZ7wI2K1F/snsdyX13O7z43p0KIQnBYZ3Hr27pqGoMzgh5jkMjwoc+bBDtNkHqmdhfXP6d7R6zaqJhU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Topic: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Index: AQHbwMGevTfR886wakahq6ntIeNmMrPYfnSAgAGVuQA=
Date: Mon, 19 May 2025 06:43:30 +0000
Message-ID:
 <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
 <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
In-Reply-To: <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB8977:EE_
x-ms-office365-filtering-correlation-id: 69ac9a9e-70d6-4db1-2cff-08dd96a077df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0JLblRkLzJLeldiQm51MDE0QWRndEZ1RjF5SXRaRjJBWUI3eCtVYnJDV1FQ?=
 =?utf-8?B?QUozQ0ExaUpMYy9YeFl5UDBneVkzaTQ4L0QyMjZhSm1iR2FVQTJnd2xIeWM2?=
 =?utf-8?B?S2JIRmFMQVY4MmpqZGNUelVnM2Y3bVJnNkZ6MjF0d1VpS3diTTNJVlQ1aUhX?=
 =?utf-8?B?U0tCYXd5LzVTN0NIRmNjMVZMZHJ0NTl6Y3QzMTZJbTJZd0xDd3BlSXU1YytJ?=
 =?utf-8?B?TEZRbGg2SkhHVUE5MDY2clJKRXU2OHNEUDJiTHhlYVJaSEZTaHFnTUlDWk1M?=
 =?utf-8?B?VXJSckZnYXl3NGhtVmE3U08zQzF1RnpIeG1IVUp0UkszMWNzS0F0NkhKa1BZ?=
 =?utf-8?B?b1B2MGNNa2tLR2cyM3Vaak9tZDNFc0V4RHZtZGNaN1kyRmczYVVhRGx2cmFr?=
 =?utf-8?B?aXpqSFo3eE9qV21CWnQxQkxiYXVhOFYwbXpnUm1ZVDJzRDhhSTIxQXNJMEpF?=
 =?utf-8?B?N1krUGJpaGFZVHdPMkJqR3ZxMi9FaDh2TStsdDlucVFTNzlYZHRhNng5aDlj?=
 =?utf-8?B?VDd2ejRUT3BlT1VVcFFyQzZ5L1JoWXJSZTB6U2Fpd0grNnFycWFEclB4UWk1?=
 =?utf-8?B?UXU2MkdDN0szRVRlUlExelJGRmRnQWp1eXVTM3FReVFEdTBiT2lmenpRaTZw?=
 =?utf-8?B?YVRlcHk1MnBxY25PTVVKcm5aNVd0R0U0aGZKaUFid0hwRUNESE1VWUVYYzA1?=
 =?utf-8?B?VDVTT2Y1LzIzT2NCaUkwOVR3c1ZWTEdQQWd6KzlCaDNQZFNnVjZHcU55Uzhu?=
 =?utf-8?B?N2ZZdXdXbitFODNDWFB0bDAxcDR6RFhYakdtR1luR2ZQaS92RmpOVzB0N2pF?=
 =?utf-8?B?OFZYcC9oOGR6aG9PWjhEdFJDSWdvYUdCZm8xaURnQ0VRdXU3Nlh2V081WVlq?=
 =?utf-8?B?OXZYUDcxK1VjVnBxY01FWHNIcjZJUGRNU3FnaHQzTmxCKzF4NC9veE1Samda?=
 =?utf-8?B?UmswNHJHRWZTK0dLQzNsSGhhamx4cDhHSFQ4OWlmQ1hQL2NuVDk3cWxMU0RO?=
 =?utf-8?B?bHIzRmE3dVdVVUJYUzcwODFpYisySDcrZk1qMCtCS1l6MGFUMXJGSXp6dWxL?=
 =?utf-8?B?dkpsL0UzRWxYaktCdnVBOEZOQlhLUkt6S0J1d25NVmRaWVlxVFFVUjhISDFu?=
 =?utf-8?B?M1NUODRRbUdhM0hybThJM1pvelFSdkpoWjI5MFNOQzJXb2ZWbzdkTzdNWUo2?=
 =?utf-8?B?QWpFOUxDcTh6dEExbjlvTVpEZXI0Rmp5T0txOFhZeUt4dDZsRWx4YndCUm0w?=
 =?utf-8?B?YVlCdnRJOHpURkRxL3JEWXFPN0t6d2p1SWZVbndpTHhOQlo5NzAwZE5yeGRX?=
 =?utf-8?B?UzY1K0cxUzh6d0ZGQmhPWWtObjNvaFk4N1VnU2FobVNxODVIdXd1ZDIzRjhI?=
 =?utf-8?B?azgzSVBuZ3oyM0d0RTVPWTdDMEJSWEF1N0VRVmhJclBMQ0ZtUjVsdVBYY09L?=
 =?utf-8?B?L3FmQ2I3TWhFclBRanQ2VytqVS9KSUtNNm1GMGxaU000dWhjU2FmRVREUzdo?=
 =?utf-8?B?QkZ1dFhaQ2NtR2pNSTY2ajZ2MFRsR3VDSTIwR2MwdmlkN3lickxMaXlGVzNT?=
 =?utf-8?B?bENjVHc1d0d6eGJDc2FhVjJGTnJQV0tzSDh6dzRiVzkzMkxUVm45NzIzYnZi?=
 =?utf-8?B?L1M1Z21CaEM3RVZXQlpJOUdxOWdFdG5acFVjSFp4ci9qbjhzb0V3M0hob0Jj?=
 =?utf-8?B?enArN1lyNlg4U3RVTkhORlVKV0s5TnhxR1paWmNtSDFlUEVicFdtQkZPOXBm?=
 =?utf-8?B?MitTY0ZwNFJHZ3RyQThwOW4xN1UzRzBCdTVaankwYUkxQ2wxUTF3WEF6K0Nu?=
 =?utf-8?B?OUd2NmFndVZSd1BOK2N0dms4SEJtK2JSM1MwWnlBVDYrNGcydHhvNW0wTEl2?=
 =?utf-8?B?cU00Q1NPRDcvSTFFMGp4T1hHZ2M5NEFzV1ZyL2tDSENPNDlOQjI1UzNSaU4y?=
 =?utf-8?B?M0dOZnVMZkRKeFBlbHVLZUh4djl5dGlITVpaT2IrOVNIaSt4S2tzRGJYdEJZ?=
 =?utf-8?Q?G7lw/eQNlraSxypABj3neeRlHAtFgE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkRyVUtqaWZwNHdGampFZmFkYzVKRDVJQlpqVlBodEIrZGtCYzRHak1HcTlG?=
 =?utf-8?B?VXpiQk9NVGpRVElXWHk3QTRMaDJxR0dyeFBONDIydUVYTW15ZGtQSlMrYWJw?=
 =?utf-8?B?cEhGY1hiaXVkN0dTbDF5alp5T2owZ01sT2NzZU1xWGRUQTdndEdrYVQ1bUE0?=
 =?utf-8?B?STQvNFB3ZGNmYUIwakNCcUF2cTcreUdKb0ZMWW5BWWd0NVdkMXJlbE1xNmx3?=
 =?utf-8?B?aVpFdnRVZ01MZ3VYVUdJVGF6R2xUQmZkdUxmNzdqVEFoNkVPVGVHNU9jY3Iy?=
 =?utf-8?B?cjU4MFpURGFDdFM0TFdJUlA3cFJ4TWtlTXozblc2WDRHUW8vbXVHbW9DNkhw?=
 =?utf-8?B?UG8zaWJUTStENEpqcGpNMlJaei84SWNKMkpwaFNGVjVzUngrT1JGVzBLTzdq?=
 =?utf-8?B?SXNWZmFxMU9tQzYyTXlXeEZxRUFKL1NjWk9SS2tmcGxTeDBId1lFMTZVWUwy?=
 =?utf-8?B?QkVuRC9hdGtHbGVsTzMraHdjZU9uc1hMTVN2MTdvRlFCTzgraDhTeG9udi9h?=
 =?utf-8?B?OG1oYUJPaGU4cmdwVmlzUjM2VUxTTlZPYUk0NUhKVGovWFNmTUNDZ0djUG1I?=
 =?utf-8?B?dXlabnBwRlpGUEE0dzBKd2pmNXdHZFo4T3AzNTNsTEYxZ2VENEloa3BIczJJ?=
 =?utf-8?B?bEFaRDBQcEV3VzA5TnpzcVFWdnpuY3V5MFlSVjk3TmZpamIvZXdIUzYrV2tF?=
 =?utf-8?B?OTRsL2pFczE2OFFad0NleUdkRk1XY21oNEg0SGdFdDhEMXBTK3lFNllvWHcz?=
 =?utf-8?B?M2UvZVJzS3JJZVVpSXpoWWFXR3dTVDhJK2Vyd1FMcUtqQWlWaHpCUEZjWG5t?=
 =?utf-8?B?bVhZWjRoUHhWd0grQmd0c3NYTXZOallTUXEvU3RZSjlubkh0dlBBRFRxcWtN?=
 =?utf-8?B?R2l6UTBQakpvSzhTMy9ieVF0TXVNQVVaL01KZENlUVNXOTBraU1SbW1TSFI5?=
 =?utf-8?B?ZER2Z3g1T0Z5c29QenlmbEpqTFdRRUwxZ29ZQ3c1Rk0yRFVtLzRNN0dreEI0?=
 =?utf-8?B?Y0VnQThXa1BzRGdOTkw2eEJMb2JVZnBiUzVDUExXelplU2l2cW5kQ0dLVmZ6?=
 =?utf-8?B?cUZzOHYyRFplSlNqVkhvdUsybjA2cUtCOVRXSG81dUs0Z1FGZW1rbFRCclJJ?=
 =?utf-8?B?WHhpR0FSMW9IaWErZ2Zid0puOVR0YW1OaXBEQ1phQk52ekhxaWgxdmNINFBD?=
 =?utf-8?B?OWhKcHk2SW9LMnRMdm10MU13eVBYY3FRNGRzenl3SlZ3M0pHejQ3SmJScWlN?=
 =?utf-8?B?Skh5UmtvQS9JdlhRM0lFenprNzZuUHg4UGVMZlV3Z0FTaE5pc2xndXIrblpT?=
 =?utf-8?B?d2pnLzZtdFJScGZuZlA4c245dzVzUlZHdFNsVU9xb3VMNVdMdlpqZklMTW1p?=
 =?utf-8?B?L2FyQm5CL0dWeTdOeGpaNDU3OXBkWlFTOVhjdDVaZU0wb2ZxNnB3S21MbzVM?=
 =?utf-8?B?TG9WeDhyT1VSMDZsY081T0Y2VHhsbmptU2RpVW1HUUNrWkdxaWVramJtVWtv?=
 =?utf-8?B?MUJoYkVhVjBaQ2djR3pTQXRubDhoV2JDL2V2WkxCczNCVmNJVHQ5ZDNpRVVF?=
 =?utf-8?B?MUdFN1ZFNzRvNVhwNU95SjdQb3VicUU5SWg5aWRBSEJrOE4vcktpWEdYRVQ3?=
 =?utf-8?B?L0hqYVdPbVRyaWd2YmV6eHpFUUlBVFRuSVA0NXFzcXVtWjBNdzFlYno1QlM2?=
 =?utf-8?B?c1N1b1NISjk4YitUWW0xNHhoSGI3OTJ4dUxnOXBwS1RZWHFvMnE0c25FcDJj?=
 =?utf-8?B?MTlyNFNxQ0xSQ2w0WjM3RTZQaGZuOERVNFVVQWV1Vi9kRVRXamhiZW9HUUFp?=
 =?utf-8?B?SFRjUkQ2NWVNTzM1U3UzNDBMQ1B2dGRrMzkwYVZQaVppbFBlTnpCSStrSURB?=
 =?utf-8?B?NklLWVR6MUM1S2lZcnRXMkN2aVNsQU12d2c0d3A4UFhiUzlnWkpBYmtQL0xX?=
 =?utf-8?B?VUhLS1FkQ2piZW1senpPQXdMWVdablJmMlp1VzJ0b1p5bm1DUXEyWmZ6b2Zw?=
 =?utf-8?B?TXBienh1Smg1THRuMHN0YTB2YTJkUHozVUlHdE1JbGJQY25nOXNyUlZiV3JX?=
 =?utf-8?B?NnZDWlRJQ3ZCWHRsNzdyK0NvbnFUSm1teG00TDNMNWltdGpQSkFYY2tYVDM5?=
 =?utf-8?Q?+lRU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F621A852E3B40A4DA61089AF6A8A8760@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ac9a9e-70d6-4db1-2cff-08dd96a077df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 06:43:30.6451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJooO3xux8skForNKY5rgIp3m+xNyIi6GmrIWm1R5XF1kboGv/TTlZUJR8bV9GSiHyDBfezp5sZIgZWVUOxDQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977

T24gMjAyNS81LzE4IDIyOjIwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDUuMjAyNSAx
MTowNSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBAQCAtODI3LDYgKzgyNywzNCBAQCBzdGF0aWMg
aW50IHZwY2lfaW5pdF9jYXBhYmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TVEFU
VVNfUlNWRFpfTUFTSyk7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgdnBjaV9pbml0X2V4
dF9jYXBhYmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICB1
bnNpZ25lZCBpbnQgcG9zID0gUENJX0NGR19TUEFDRV9TSVpFLCB0dGwgPSA0ODA7DQo+IA0KPiBU
aGUgdHRsIHZhbHVlIGV4aXN0cyAoaW4gdGhlIGZ1bmN0aW9uIHlvdSB0b29rIGl0IGZyb20pIHRv
IG1ha2Ugc3VyZQ0KPiB0aGUgbG9vcCBiZWxvdyBldmVudHVhbGx5IGVuZHMuIFRoYXQgaXMsIHRv
IGJlIGFibGUgdG8ga2luZCBvZg0KPiBncmFjZWZ1bGx5IGRlYWwgd2l0aCBsb29wcyBpbiB0aGUg
bGlua2VkIGxpc3QuIFN1Y2ggbG9vcHMsIGhvd2V2ZXIsDQo+IHdvdWxkIC4uLg0KPiANCj4+ICsg
ICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKHBkZXYtPmRvbWFpbikgKQ0KPj4gKyAgICAgICAg
LyogRXh0ZW5kZWQgY2FwYWJpbGl0aWVzIHJlYWQgYXMgemVybywgd3JpdGUgaWdub3JlIGZvciBn
dWVzdCAqLw0KPj4gKyAgICAgICAgcmV0dXJuIHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ks
IHZwY2lfcmVhZF92YWwsIE5VTEwsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG9zLCA0LCAodm9pZCAqKTApOw0KPj4gKw0KPj4gKyAgICB3aGlsZSAoIHBvcyA+PSBQQ0lf
Q0ZHX1NQQUNFX1NJWkUgJiYgdHRsLS0gKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICB1aW50MzJf
dCBoZWFkZXIgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcG9zKTsNCj4+ICsgICAgICAg
IGludCByYzsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggIWhlYWRlciApDQo+PiArICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBk
ZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIHZwY2lfaHdfd3JpdGUzMiwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcG9zLCA0LCAodm9pZCAqKSh1aW50cHRyX3QpaGVhZGVyKTsN
Cj4gDQo+IC4uLiBtZWFuIHdlIG1heSBpbnZva2UgdGhpcyB0d2ljZSBmb3IgdGhlIHNhbWUgY2Fw
YWJpbGl0eS4gU3VjaA0KPiBhIHNlY29uZGFyeSBpbnZvY2F0aW9uIHdvdWxkIGZhaWwgd2l0aCAt
RUVYSVNULCBjYXVzaW5nIGRldmljZSBpbml0DQo+IHRvIGZhaWwgYWx0b2dldGhlci4gV2hpY2gg
aXMga2luZCBvZiBhZ2FpbnN0IG91ciBhaW0gb2YgZXhwb3NpbmcNCj4gKGluIGEgY29udHJvbGxl
ZCBtYW5uZXIpIGFzIG11Y2ggb2YgdGhlIFBDSSBoYXJkd2FyZSBhcyBwb3NzaWJsZS4NCk1heSBJ
IGtub3cgd2hhdCBzaXR1YXRpb24gdGhhdCBjYW4gbWFrZSB0aGlzIHR3aWNlIGZvciBvbmUgY2Fw
YWJpbGl0eSB3aGVuIGluaXRpYWxpemF0aW9uPw0KRG9lcyBoYXJkd2FyZSBjYXBhYmlsaXR5IGxp
c3QgaGF2ZSBhIGN5Y2xlPw0KDQo+IA0KPiBJbW8gd2Ugb3VnaHQgdG8gYmUgdXNpbmcgYSBiaXRt
YXAgdG8gZGV0ZWN0IHRoZSBzaXR1YXRpb24gZWFybGllcg0KPiBhbmQgaGVuY2UgdG8gYmUgYWJs
ZSB0byBhdm9pZCByZWR1bmRhbnQgcmVnaXN0ZXIgYWRkaXRpb24uIFRob3VnaHRzPw0KQ2FuIHdl
IGp1c3QgbGV0IGl0IGdvIGZvcndhcmQgYW5kIGNvbnRpbnVlIHRvIGFkZCByZWdpc3RlciBmb3Ig
bmV4dCBjYXBhYmlsaXR5IHdoZW4gcmMgPT0gLUVYSVNULCBpbnN0ZWFkIG9mIHJldHVybmluZyBl
cnJvciA/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K


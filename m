Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16105B39BCE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 13:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098487.1452525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urb11-0000dq-US; Thu, 28 Aug 2025 11:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098487.1452525; Thu, 28 Aug 2025 11:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urb11-0000bu-Ql; Thu, 28 Aug 2025 11:42:03 +0000
Received: by outflank-mailman (input) for mailman id 1098487;
 Thu, 28 Aug 2025 11:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJR=3I=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urb10-0000bo-6Z
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 11:42:02 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02d22f1c-8404-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 13:42:01 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AM0PR03MB6292.eurprd03.prod.outlook.com (2603:10a6:20b:15e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 11:41:58 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 11:41:57 +0000
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
X-Inumbo-ID: 02d22f1c-8404-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFbUp/t636ZVfnqlOxU8KE1pKsmbyhmuwD8LKbO3rKgY5lGp/nLP8BQ1KKjfXNydCcFfhRPo0f7f7n2a0yjMkWEcRSS9+q7PH+6vD42lnt9cz3+/ZcmhFJtsORA88Zru95lvJli5DRS+mKpv0DOJ7cW676J3rdzbhmDKlLnVNd2+92jsrZ0E3WZPcJ+Wk3W78wiPkl4x2XPZ1c35Dw4EcIrlAk3WrvHFTjzQcRvXsUltPGna3ccUB6v2SVkx5k6YyEE7a8bb9MJwEdUb3Ok1V+ypBO8bS4EeS0J5j3jxwfSxPg2/3cSzNpyJAH/kch4xGrkHX+zeLiCDA8uj19gWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTzp5VISobobGwGhn9exeFnV0sYw1kkyUMhxzo6dQOM=;
 b=y84kK9oQvuq73DK6mNJwfBIhtvCkRUUml2L2bvBZNgwvBAmGgM7iQKN2W8oamA3ohZ5sTGaWUa+zghqZyDmN6C79/rUGff+Exqvj9Y6gWKpZ1Nl+YeCBrhxrGFCe9QtyjLhc+XMhw+2erorf1Jvu/70Ad0eswz7D7Fkvi2L0+NOwIBa8T0Ixdwaji8y+QxLXaNtzg+bB/gSmEze4GSQgdR3hV7avkPaw/QMl/u+pKEEyen4wzIejPOcYxdiV9jHvgUoq5wwxJi2xn3rtrDigjyQhu1SmdfRuU0ZqGab8NFUyCcm26odctbUv140XsKv3ItexGVpqYXoVt4UB9yGz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTzp5VISobobGwGhn9exeFnV0sYw1kkyUMhxzo6dQOM=;
 b=oeU97eBLJGYslGzXRGg2/KhYuH9dndoxWG//ePE+VZ0eZsBi2dLtecUNNfqzxyJRFpb+tLeKnRjP0PyCRWoOG1lzgFGyLECuNxmeeL0MoE0kQz5cSurgnM9UYDr5g8zLOqm5c3NFfY4z1/UpSkLXIphvXG/PHZYb2mdFjpDxXmLk+sMQadeohqTmMRDq5DcQmavPVNOFi615wYT4dQYQ9dYNCCAT4BKKWBDM0Int/2OuTFAzscXM7pmy9WfUhDtdTRAXLSukvjpSfYigtbCwSIM79biLRvWuiZmiNTdG/1OcGB5c5eKnz2rMiDQO9duLC6VrkgnlDq0pfyhtULcWnA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v4 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcF3/PMGQJ9ZKjmEOWPrVRdE59HbR38oSA
Date: Thu, 28 Aug 2025 11:41:57 +0000
Message-ID: <0c55c943-55f5-4033-8d82-f85338221465@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <6b312e1997da5abdf592f66d16067f4330431ded.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <6b312e1997da5abdf592f66d16067f4330431ded.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AM0PR03MB6292:EE_
x-ms-office365-filtering-correlation-id: f50ee0f0-4bbc-43bb-f098-08dde627e502
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzUwaTYxRWhsT05MNng0dktMckFCcXhtMGJXWVJJSjdRWFhwZ29VclN0dkFQ?=
 =?utf-8?B?TVhYb2lxa0J5QmxkeUd1QmRvMGF6VWticEdldFg4OTQxbEUzSjZ0ZWdVM09D?=
 =?utf-8?B?ZndjN1hQbVpMUllzWi9nVytTV0ZZZkZYNklkd0x5ZVUwR3JheGpKZ1VRdGps?=
 =?utf-8?B?b0N1cmdWc2FFbnFZalMvT205MExPY0Uwb3g0c29Ba1ZnRmdqbTFYcVNHQkox?=
 =?utf-8?B?Zy9mQk5DUWZ0VTYyWWV2ajgzSTRmZlk3dFlHbituNTlSVlA5OGppVkdicXhE?=
 =?utf-8?B?RW8rbEpOblZXeFJOS3d5b0lOMmlSdUZldGE5VktLQkxQYmFVT3ZKUUdPWHpT?=
 =?utf-8?B?dEFGbG9lMXF4NHJnb1ZoOWtuaFhRczFjajR1TXpNUVVvb3lpNXF2S3JkeGp6?=
 =?utf-8?B?MlYrTXVJMEwyd1BvcG9rcm1aaFhDcnVqbzl6aHdXMmZ3VzA0ZjhEWUlDbFVs?=
 =?utf-8?B?aVpYK2RKeDVsUVkweWpOYTNOUFh4WDdUamI1dUsvZU9oZVJUWER4YjhLVjdP?=
 =?utf-8?B?a0VBaEJMeGF6WVM1VHFVTlZtZW5JeFdWVEtkbmR0RzJ0OEF5bDdEUm04YXdy?=
 =?utf-8?B?a2wwR3pieEFFRkxMU2Q1a212OW1wSGUvMFRqcWNzMUVqc0gxajg2cm1CQmcy?=
 =?utf-8?B?VThrbUFWanZldkpOejdEVm5YaDVZVDhTYnAwbCt1NjVrMDR1SS84T2t3cEd4?=
 =?utf-8?B?QWpSVEhVTGZ4djY4bnZucm1DSFkxRk96d3NhMjdKb3RpbFhvN1ppTGtxS3kr?=
 =?utf-8?B?dVo5SjY4Nm9jdnJUQkFGdnhYZStOUzR4QTdVQmhMMWU5RzNwQnFYSnAxWmxN?=
 =?utf-8?B?S05xaG4vRDNUQzMzUzJ2eEp0WVoyOThRa2N1clBkK0N4VDVOYjl2Wlo2NDF4?=
 =?utf-8?B?RUtCZ3M1STBaMFhlckZ3b2JyWVJVU2RUZlFjSmJqSjEwd1ovY2llbWNzbW0v?=
 =?utf-8?B?SVJIOHhaMDVnMDRHZWNCb05EMFNKZTFtQW9tR3FGbUNISFFQT0ZPa1JZV3NM?=
 =?utf-8?B?Q0kxcUxjQzBEUFNYV2tIdUF3R1lWS0lQSXYrcGZhNEptK0VhMWlOb0RiM0lu?=
 =?utf-8?B?Y0JNVyt6WE9nczhpcXk1YlI3WVhGdHJqVEZ3eHlRVzcwVWtJUUpYbGprMjFp?=
 =?utf-8?B?MjVlNzY4ZzdVaE9JamJiQnBUdzRwQThqSDBkaFNOQzNNbjR6U1JMOVRJWGpF?=
 =?utf-8?B?UzVxNUE1d0hPd29qckJKMk1uVktKeXp1ZTh1UVVZUWk0SmYxcFFRZ2R1OU13?=
 =?utf-8?B?QThYZEJvb1dOcDVGeWkvVkQzY0hoNEhiNWJXTnRkc0FpNzBiRHZTaGljMkNW?=
 =?utf-8?B?WVFGeHNXM1JZRXhlR0sxWkZnYXRGNmRxT1ZYZmhKcGtIaDRuR1ZYTjl5em9G?=
 =?utf-8?B?MFRYbTJaTVlxMjVFYWhoMFF1eERjMXJXdlMxQU9aMkcxMWwrejRSanU3Z1ow?=
 =?utf-8?B?VU1lMmFTQUZsVHd6YmJkRlZub2VWeGtVa0V5WmNyb1NWWXQ0Um1sY0Vpcnli?=
 =?utf-8?B?cWEwMyswb2JseVRGVE9VRkNkaFZNcnY0RE1XSkpLNmJwWitLa2V4VFYxSktJ?=
 =?utf-8?B?V3kyd3pPeFFXMUIwdTZPWEJTb0loQjRyM3UvVHJNZGVqNVNPUThaam13VnQ4?=
 =?utf-8?B?UUY4Wk5RVlVRSHBBdktzQzN6RTNFZ0RvamFQc3EyTWlUWUk5Sy9OZytFaVJ2?=
 =?utf-8?B?TzhPNmRqb0xET0JtbkREeWU5QXdHbFVxeGErZ2FzNEVVZDh5emhVeFVYK0Nl?=
 =?utf-8?B?am1xWWxTUFFZT2FIQm5TWlZkK291clZ6SEIzQWFmbXZoNGdVMDNyWFRXcVox?=
 =?utf-8?B?a3hSY0tkdXJWR2FLR2JHWU9uZWRYa0ZMVHQrMXJxYUFhcmI2M2ZWVm12NjFF?=
 =?utf-8?B?eE5pcHJoUmhNNVZsdWdYR2Z4SVBqeER6QlAzcmsvRjI0cHFiK1Q2a29DVi90?=
 =?utf-8?Q?RV/P3qDJHJI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OE1DdmYzNmVyeE5XVGdyVXpsQ0Q4YkF3UE0zSHR1UGFQc0R1NEdhZnNTR21o?=
 =?utf-8?B?SVBxZE1DOGNoeW1oTWhES1I0YWR3Z2tWRDhwR25aNE9ZK0dnQVRhaTIxL2Ju?=
 =?utf-8?B?L29rY0JpbjFOeXZVTlI1M0lqbGx4UjZrZHYzZUE2dFJ0NHNrdzNoelJFRmpX?=
 =?utf-8?B?alRhWVFKVWN3aEVBUHFYUy9CTWtocm1DU0YyNTQxTThveEp0YzZodDlLYzV3?=
 =?utf-8?B?ODhKK3paQVEyQVJ2ZVVKdGllRDdleGl0aWRXaGJYSmhmekVTaEtwckY5VVVy?=
 =?utf-8?B?TEp4ZEhHaDVnRHQ1anZyOUFNUXAyNzMyOUFlYVlwOG1xM05nZ2RETGNHRlhu?=
 =?utf-8?B?dW9xNXB2NmQyWi9VWHByUHMrQkVUYTZ3OUpzQkk2MmpJNGZmbFBSN3BsYXZM?=
 =?utf-8?B?QTZTck1KRVRXNWtUQjlHcXoxUmJEV1pXVnUxOVZnenJrOE80aDVqbjB0M3lI?=
 =?utf-8?B?cExTZy8yWXorQ1FGeG1OUE9MYkgrZGNxb2QzQ2xyMVd2YVZlWE9HRjFzelJQ?=
 =?utf-8?B?ZTRaZzI4NDU2OEZxUFE3a1FrWHpuaFh4MDBrUzUxR3VGb2N6ODFGeFpSQ3Fq?=
 =?utf-8?B?RFl2RlNIT1BDNUQ5N0E4elZWenVvY2JGTDlVYTdBZHpEeDl1NTVtK2haUW04?=
 =?utf-8?B?dU91VE9ob1JrckxnZks1RWtFdVRycW5CTzhITzVkS1dVRDJza1FRUXZwdExO?=
 =?utf-8?B?b1dvbW9iRUxXOXE0cDBPMFdZb0FraklZU0UxK0g2bDlJc2pkRWE4UU5kTzZ5?=
 =?utf-8?B?ajJBaEhYdTdyQmhZYVJKWWppZkJRVFFhMkVscEVKNnVlTmdhN3NMS3VDcy8v?=
 =?utf-8?B?czdsSHFkZkd4S29pdlc1OG1Wc281SnpTditkcDg3QUtpTHJ6SkxmUlVmc1hp?=
 =?utf-8?B?dncycVdVMHdZWXZCL1Y3OHFNNVpCRTFEM2lMUWdYb3dRMEM2bllOSFpZVzJF?=
 =?utf-8?B?RnZkRHNsaUJybnhIN2RnZG5tb2hYOE12dFhlNC9rY1hmWmRXTGU2OWFmKytu?=
 =?utf-8?B?RGpoQXgvcyt0enU3R2hqVTV4V013eEYyUkVnTkhOU3FWK3dCeGcrd1RwUTQy?=
 =?utf-8?B?dDRqZkUvVWlsVTI0UC9MV3pnTDRNVElzWlBOZ3JPS0JCT0g1aEkvUDdzOWhX?=
 =?utf-8?B?RnJBdVEzdERoUjYxRWJmLzhrM0ZVeGd3T2dVWCtQKy9xeWlHWHBQQ0JLTDF4?=
 =?utf-8?B?MG9iT3ZNMFdBMHNLb2dSKzV1ZzVKWVhENWk3cnNaMkthUVQyYkVOVWtrTzc1?=
 =?utf-8?B?emdyMVpQMmozRHN4TkIxbFV4aUhCSVlWUGhkSWx5Z1pZNStsK2hWaThXVDZ2?=
 =?utf-8?B?SHg1MDJqTk4rOHZ6aWJ5TElqdzArcXJudWJqTUYweGttWitkaU9uVTJnODRv?=
 =?utf-8?B?OGhyYmZ4Y0FNNmV1MVZFTGUySXpFQjNkTllkeWtJMGYwMTFUTkIrdjZwcmJq?=
 =?utf-8?B?bXhiN2MvNDRFUS9aN1JvS1pjMjRoYzlIcmJieDkxR2d1T3VBVmxvSWd0b3lN?=
 =?utf-8?B?Z3JKT3hkU29FQnN3UHhCRUJrVXZBeGRiUDFkZSsvdG9kenZ3Y1VDeUZJeUE1?=
 =?utf-8?B?c2R6dUo1ZzRUeW9hcGw4M3dGSENaRlFaMlU5Z3dBZm9scWhlditVWG9ZKy9K?=
 =?utf-8?B?cVlqZFUyN3MvcVVCcHU3Mi9hYjE5MWZzTnRmV3dnTFVWU2k4SDdrZzNnSWtU?=
 =?utf-8?B?a1lSc2R1d3RCSytRbzV5MXFrMUlIYjdzZTd1Z1JSaWhkVFFNcXc3aUdkaEQ1?=
 =?utf-8?B?RWhNR0VUK0Jzd2NkZHFzeFBlZ0dVZVF4Mk9YNFpQd1dkZGZSU0c1WGtLR0c0?=
 =?utf-8?B?ekFtZmtmbkIxVmNLUG9kb3AvRE9yb1BGS1RnTE9LQ3lXT0dlSW9NcjVBcnZJ?=
 =?utf-8?B?QWtjNm8yMWVPQUprRzlobzFic21HZ3QzUnVpZ1pVNWk4RlQ5Y0RhU0F5SmQ2?=
 =?utf-8?B?eUlkdG9mV1QycjFTUityMzhaQlZUUjZ0NmliREVNditudVA5VVFqNytmUXJI?=
 =?utf-8?B?ZVIwV05VTVdhcHA2MHJqN2ZwVnZVMmJNc2V2eXRMVzRTemlHVWN5KzJhdzFk?=
 =?utf-8?B?bytHVGc3THRobGJkeTBSSXlwb3Y3MU16TFJ4V2tjNFBuZFpOYVkzK2NYWVpH?=
 =?utf-8?B?V0praGQwdFp5dUZERWlucVdVTVl3anBmeTBVL0llQ2hoSk9hL1ZGUmdaVldT?=
 =?utf-8?Q?VGBHLtX4cOU4m66ytxejlNI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06E659504BBB394B9B7C3360FBF0439E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50ee0f0-4bbc-43bb-f098-08dde627e502
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 11:41:57.6182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nsW5TaKC39mIE/Fwsic2CbUnt2BwsT7jBM4bA6HIxuJ5T7Q46sMzmED0wF3JiNMhOZW5uxeIX1TJfKY4kMOdznQQYaMLULCEpYgH8C0ZVw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6292

SGVsbG8gZXZlcnlvbmUsDQoNClNvcnJ5IGZvciBzcGFtbWluZywgYnV0IGFjY29yZGluZyB0byB0
aGUgY29tbWVudHMgb24gdGhlIDh0aCBwYXRjaCBvZiANCnRoZSBzZXJpZXM6DQpodHRwczovL3Bh
dGNoZXcub3JnL1hlbi9jb3Zlci4xNzU2MzE3NzAyLmdpdC5sZW9uaWQuXzVGa29tYXJpYW5za3lp
QGVwYW0uY29tLzllOGExMWIwMjQ4MzNjMWI5MWI4ODA2ZTc3MDhiZjM1YjA0YThmNmUuMTc1NjMx
NzcwMi5naXQubGVvbmlkLl81RmtvbWFyaWFuc2t5aUBlcGFtLmNvbS8NCg0KQXMgaGFzX2VzcGkg
ZmllbGQgd2lsbCBiZSByZW1vdmVkLCB0aGUgZm9sbG93aW5nOg0KDQpPbiAyNy4wOC4yNSAyMToy
NCwgTGVvbmlkIEtvbWFyaWFuc2t5aSB3cm90ZToNCj4gQEAgLTExODQsNiArMTM5NiwyMSBAQCBz
dGF0aWMgaW50IHZnaWNfdjNfZGlzdHJfbW1pb19yZWFkKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2lu
Zm9fdCAqaW5mbywNCj4gICAgICAgY2FzZSBWUkFOR0UzMigweDAwNUMsIDB4MDA3Qyk6DQo+ICAg
ICAgICAgICBnb3RvIHJlYWRfcmVzZXJ2ZWQ7DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX0dJQ1Yz
X0VTUEkNCj4gKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUdST1VQUm5FLCBHSUNEX0lHUk9VUFJu
RU4pOg0KPiArICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU0VOQUJMRVJuRSwgR0lDRF9JU0VOQUJM
RVJuRU4pOg0KPiArICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JQ0VOQUJMRVJuRSwgR0lDRF9JQ0VO
QUJMRVJuRU4pOg0KPiArICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU1BFTkRSbkUsIEdJQ0RfSVNQ
RU5EUm5FTik6DQo+ICsgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lDUEVORFJuRSwgR0lDRF9JQ1BF
TkRSbkVOKToNCj4gKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNBQ1RJVkVSbkUsIEdJQ0RfSVNB
Q1RJVkVSbkVOKToNCj4gKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSbkUsIEdJQ0Rf
SUNBQ1RJVkVSbkVOKToNCj4gKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVBSSU9SSVRZUm5FLCBH
SUNEX0lQUklPUklUWVJuRU4pOg0KPiArICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JQ0ZHUm5FLCBH
SUNEX0lDRkdSbkVOKToNCj4gKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUdSUE1PRFJuRSwgR0lD
RF9JR1JQTU9EUm5FTik6DQo+ICsgICAgICAgIGlmICggIXYtPmRvbWFpbi0+YXJjaC52Z2ljLmhh
c19lc3BpICkNCg0KLi4uYW5kIHNpbWlsYXIgY29kZSB3aWxsIGJlIGNoYW5nZWQgdG8gdGhlIG1h
Y3JvOg0KDQojZGVmaW5lIGhhc19lc3BpKHYpICgodiktPmRvbWFpbi0+YXJjaC52Z2ljLm5yX2Vz
cGlzICE9IDApDQoNCkl0IHdpbGwgYmVoYXZlIGluIGEgc2ltaWxhciB3YXksIHdpdGhvdXQgYW55
IGZ1bmN0aW9uYWwgY2hhbmdlcywgDQphc3N1bWluZyB0aGlzIHNvbHV0aW9uIGlzIGFjY2VwdGFi
bGUuDQoNCkJlc3QgcmVnYXJkcywNCkxlb25pZA==


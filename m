Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B26A99B016
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2024 04:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817435.1231454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szRm0-0003SP-VH; Sat, 12 Oct 2024 02:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817435.1231454; Sat, 12 Oct 2024 02:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szRm0-0003Pu-SJ; Sat, 12 Oct 2024 02:22:28 +0000
Received: by outflank-mailman (input) for mailman id 817435;
 Sat, 12 Oct 2024 02:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A068=RI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1szRlz-0003Po-Nx
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2024 02:22:27 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20627.outbound.protection.outlook.com
 [2a01:111:f403:2408::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1cbcf2a-8840-11ef-a0be-8be0dac302b0;
 Sat, 12 Oct 2024 04:22:26 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Sat, 12 Oct
 2024 02:22:22 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 02:22:21 +0000
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
X-Inumbo-ID: d1cbcf2a-8840-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzkVIOLACvLubqX/fnI8nytu84XhZrVqF+urq7uTEszGSya+a2SmuoR+Lr50CVoyYNR/mj9iGCdAuXshaMLW25HrX5t9SEMSdhsASt4jbq0fmU4k1iWHmIiUPVmDjFnd1Y6s3NorPBatLSIdkSq0NN5cJOyvwybrWTrXYQi3eqftoiFLSDAC6Yqf0VcjgtT2hfcr4s83yOj+V+syYL0Ty+ivQwynq2ifSaK/04d2jtwvrx4dz0lorOc1R9ZYUkc1SrMLpC9tODohHHLjHNHmZAZ0s0KALYbSURF9ggP3db42/7xJBevAzVVnjmye0GKi6ojeNehjokABAqOM6EoDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/HccyqieL9apBSbnYKkQ36X/2w9um2E3Mu9QZgBOaw=;
 b=mStUnjqbnYsjosQX+QtfWokYPXEOUFKWXvsxJ4L0F1DzZ9TkKpuLzeJZD4ta2pnHZwFrMPUNgMysRA9DgN7DSwtpGV3hwcoqWx0IsFac+Haowfbc+Vq1PY8Rk2uHL2JOUbOMLXMrt9Cs/APsbMkwTCPVvxsCR5DZB7z1+tU0m+9bcnQb61CMvz300zAeQzGZuQVnOPEy4oJVy0CoC6/qPUw1KiZjEaZ4D1Z+e9ybF7M1j/xf2yAWtvdMTjswG0hVyje3CpyF8LdqbFLLX8O/uAlnbgkS5uaDroShdbaBRc8DarRBrjGO3dCpvXF78FlQW9YI0FH11mYVshtWWt6V2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/HccyqieL9apBSbnYKkQ36X/2w9um2E3Mu9QZgBOaw=;
 b=Ha0Rj01mwU+CkByAYT6TXcHKNY1tlXsA+Dlc8S/ykUeLGpWWDcSZitbMEmknGf0tULBSTPcvY1m1BnffXKdFvp6JB6WQTHVfT+rrTSuMelpK8bBnZdX3wn6dwYYVjp7YokufvXSrOs8A4I2yrOkpBtD/0eOvnWtioUqAu0qdYDI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Topic: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Index: AQHbG4+3Lfp3cJlJ4UuqoaLQId+ES7KBdNAAgAF0qIA=
Date: Sat, 12 Oct 2024 02:22:21 +0000
Message-ID:
 <BL1PR12MB58499172314E76D9A9278746E77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <e6938fd7-2cb8-412f-b3e3-1943eeb271d8@suse.com>
In-Reply-To: <e6938fd7-2cb8-412f-b3e3-1943eeb271d8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8048.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL3PR12MB6524:EE_
x-ms-office365-filtering-correlation-id: eace6a69-6be7-4201-b4e3-08dcea64b404
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWE4bFdlajdKczlWZU0rcFVtS3JYRWNIOFJnVnUyelR3RVFJcVZMVkJCajU3?=
 =?utf-8?B?c3ZEb2Y5cGVKazJJd2tJeHBnUm9XNncrTEpOWTE0YUM1WnoyQml4UHh6OERq?=
 =?utf-8?B?L09XWTBLRlRneE96bVFYbnR2VXczRm1Od0JQeEs1ZEJRZ0ZaQVZ2K3NPekZ6?=
 =?utf-8?B?Q1FSY1l6dnpDRFM1TVhvZ1RVTlVIeHpRcTd4am9GdVpRV0cwQXRHRE9CVWpo?=
 =?utf-8?B?a0h6N2RCcHVvbUhoeHQ1T2x0ald2UXpobUZSTStKRWlSbk05MVlRNFVBb0Rp?=
 =?utf-8?B?UVdza3hGc0pkKys3NzFlRExXVytpYXZ1eG56akxIRjBKVTJjSXlkdHh6T3RT?=
 =?utf-8?B?czRGbm5DUFdNL1BqdlI5b1RhWDV6RlpxUzlMQk84c1ZUSGd2bUlLd0lBN3FF?=
 =?utf-8?B?M01LdTdSOFJVOTJRSTVobEdPTjFwRnFzZEJEVWVPR1J2MFh1S1FaSU9BSTVp?=
 =?utf-8?B?RTg4TkNZUlZuM0pKRzBlK2ZBM2NIL3UrbERJL2JJc0s5ZVQyMmwzSG5TMWxL?=
 =?utf-8?B?bmRxaGJ0S3orTWFVdll6RFRjWlQ4ZnVPREJ6UU9WZFo4WGpMUDdrSGMxNEdO?=
 =?utf-8?B?VHYrd3BvNUR2WkpPTEYvUGNLT1N0clI1TWN4bGNDVE9HVjgvU3NwZEpSOFV5?=
 =?utf-8?B?eVZuY21RcG8zTjlCSU1uL0FlVENROFU2MDFNR1Q5OGxVUGxGRXhHR25RaVkx?=
 =?utf-8?B?Ynd4VDZZRUJrdnFhMWFSMHUzQkFEM0tlZVAvRHYxS0JZL2JNQzJPeDBpdjBY?=
 =?utf-8?B?K09GNFZCeGl4aWNZdHJUN2JMeVlrWDhmZmJ5c0YxLzlqOVJCOUVOOHZNa1VX?=
 =?utf-8?B?Z1ZveWZCVS9SUU1EcklpZmVnZHRvclZlbmNnYTFaT29Sam1zM0ZZMlJFYjJY?=
 =?utf-8?B?Wm8zOGk4YVFHUG9PQWMrTU5vS3NWK0VnVFRNQ0lCL2NDSWZEMkpiSWZRdHNr?=
 =?utf-8?B?NjhNT0l6YThZbWZLTXZXVWN2dnhYOUhXZXhJeWdUdDJheHFtQy9JNTRTMWF1?=
 =?utf-8?B?VERzZW96VUJock03TWRKMmJIMTRhS29YbEdDL3M0VW9SclhERkRTS2VDMnlU?=
 =?utf-8?B?Y0tjeGNpOUUxQWcrOStSSHh0dTk1eUJVQTN5MFhTcnplVXpZUC9YQWVOcW9v?=
 =?utf-8?B?cmhUNVgrVjF5L24xdHVYcHdiQktIMWhFck90TGdPakxldmFHdTZRS2lvWG1T?=
 =?utf-8?B?aXQyZXEvcS9ZbGpUVVlIYnZFR0EyVmdQdVZaVFB0OW5iZS91M1RJMmFkd3F0?=
 =?utf-8?B?NHRxTnRDRUVHVEFobENiYTlxYXVpbXJvRmhkaEdUb2Y3SU91bittSlpzdFBw?=
 =?utf-8?B?Q3JjbWYrSk1yWEZ4OWRVS2xqZE1seW5WbUVhMW9iaVdOMlhJak5lUy9PVHFB?=
 =?utf-8?B?c296d0VMT1NrckhjQW9lSXRxaU1rbklnWk13YmpMRTAyUGNkZmJRazI0Sit4?=
 =?utf-8?B?amV6bE15WnoxUzdiNHl0S0pjTG5sRTVRSnVoLzdmcHVJYVRtelB2WkFqTXVa?=
 =?utf-8?B?NzVVQUtrSE5DcXZwVFRrcWFXVFlJS2dlbkI5ZTdvZ2Z3RWlvSUpmdDVvY1p2?=
 =?utf-8?B?RllHU1hXSThQblBTbExuM0N2RUN6U2VQNzBCRkJVRHBQUXhOR1ZZK1c2UGVV?=
 =?utf-8?B?NEptMnZUYUhMNXBZWjlBQzhUMXZZZGZGNjlUSTdKZlQzRWRvTHJBa2FoVi9B?=
 =?utf-8?B?MEZ0SW1XZ3hUa1hBaXl3RzdEbS8wMUdzY1Q0VUJ4QTZHTXZZY3FCVGhoL2ts?=
 =?utf-8?B?MU5QRFVJdzZHY3oyZ0RENGNiSlQ5U3VSTE8zRTUwOEZka0NJcUNGQldIaUJh?=
 =?utf-8?B?VWVGVk9hczVoTEloMHhLQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFJvMDgvU3dFSHArY3J5dlZkS3MvNEQremxUZkZiL2V5TUF6UjBlOThTQThE?=
 =?utf-8?B?M3JrY3lxUlcvakZ2OUZyNVR6d2tGbGlMWXhzZHNnTWc2b0dZcDBMWFlWbFpU?=
 =?utf-8?B?UlpRNmRMN09FN3VaK3VCVVhHMkc5QWhNVXI5am1KVWczb04weG5nU0RNMTBl?=
 =?utf-8?B?c0I1WkFhSnZ4UTRXeXFaSy9wOE9SeDJ1TFJOb2UxRlVxR09MajFJRjhRaFFl?=
 =?utf-8?B?UHNsbU8wWlR3QWR2SllpMUZuaVJWZFNnenVTRXRxRlRMRHRxV1NUbG0xQWl4?=
 =?utf-8?B?TFpDcHY5M2NleHF4TE9menJ5alV3dHJzWVVTREZObXpwV2tUYjJDV3JiQkRm?=
 =?utf-8?B?TjhlY25pbGJpdnd1cU1LR3hOZ3lQc1lSTE5LZnY3dlo1R3VKZWNIZjNoYUNh?=
 =?utf-8?B?TWM2QzdFTjJ6MWlPT1JNVFJ5OEg3NzNiQThuOE1jdVpyUWwraWZjOEV3SjBx?=
 =?utf-8?B?T0pLVC9zVmhyOXF6YVQyN3ZXeDlGNW5qSEp0M0s1ZytiaGxxSWZsUUU1MXJj?=
 =?utf-8?B?TjZQM1BJbEM1TkpOYTBSaFRzckx0SGJTQnk2bTNoWUlzZUNXMFBZcWEyWVh1?=
 =?utf-8?B?MXdNcklQdG9RUGZ3MXk2NE0xdzJkZEFnSjd1RlJXQ3RxLzc5NWcvZHBhT0JH?=
 =?utf-8?B?eFVtZUVsNDhaOEpGbExsR2pBQVo0R1ZMbG1GbW83REZIOVArTHlYK0prKzN6?=
 =?utf-8?B?bXcxeVRQb3Fqekt1dWFUQ1hOL3lURzdsWStqSEtNWFQwRzFLSlRKWEU5aDJE?=
 =?utf-8?B?VkxhS2dMK0pkVHdoK2xYUlIvWTV3TDkwTFdoQWYxTEphd0wyOGxpcUNMeHdp?=
 =?utf-8?B?MHY4NExIOHpOVmxaZ3FzTnNsazUwSEt4SVNNWUdBc29RV2xsa1NIeHRLMXlZ?=
 =?utf-8?B?WDJXOHRqTVRXUFVoVEF6aStkbFJZdDI4amFQR3FiVHZjZFdkV3luTXlZNnR1?=
 =?utf-8?B?bHZOcitLZzF3ZmN4amRlMVpEam1rYU5LSjRPWXZLL1d3bW5lZTFma1BjUFpz?=
 =?utf-8?B?WkdZWmFYT0NGM3RreUdPOUV1WWZlMk9TSUxiS1BJekI4bmpZQWpBR1JVODBK?=
 =?utf-8?B?VE95cTF3Sk5QZlgwak1oeTR1VFE1KzlXUTRMWktzYTZRUHY1Zmk4b0Fyb0NT?=
 =?utf-8?B?dTNzUWI5Yk5iVU5xKzdzNS84RVlaYUdMSEtjdVR3WTljRHJRenA0SVBiaVg2?=
 =?utf-8?B?c2UvVUw4YnV5V0FoRnRtbUNUNjNFcGVPamxzbEtRZjVXbWh4S1N6SXA1RVY0?=
 =?utf-8?B?WmtTWndsR3paLysrNmRYYUI1bTdES1VLR2VWbzNhTzkzV2JzVGRpOU9yVHU1?=
 =?utf-8?B?V0ZjcVRjWEIvb05Mb3dVQ2V3aEtxZk11K0xTb2JsdmFNQlZmUVphdWk3dGZM?=
 =?utf-8?B?L2lOYjZQN0FwVVowU3BHay83dFF4bkRlNE55aE9OdzkzdFJKVUMwN1dScDVL?=
 =?utf-8?B?VXNKeXRKV3RjdGlaZ0lGNGh2VnJkci9hUWpORmkrWGx0S1Y3RUpPR004Zita?=
 =?utf-8?B?dit4cE95bFhmZlVWczlHM1VlYVdBU3VjU3U3L1NmYlQ3NEg2aTNRL3hQbjEx?=
 =?utf-8?B?K21aRTFaWVptdXdaOTNOS3NwMXVnajJCSFRHK2NzNFhyeDVRTEprNTN4dUNG?=
 =?utf-8?B?dGR4UElIMzM0bFlpUS9UVE5PVk1rUWVEODZUZCt5cTgzN0Nvd0lkUEpxODZx?=
 =?utf-8?B?cG9LUk4xVzlEQmUwOXBhM0FHZXhDVUcySHQ2S3hMUmdyVk1PVUlCUEZuWlhG?=
 =?utf-8?B?NVVybTM5NElnK0RaZGxjVVUzQWVQZzNDNWp5VFpsVjU3ODZNUUZ3dTBDRzI2?=
 =?utf-8?B?ekQzRlRjaTRyaGdQMGpaY1lNMEY1bnY0ZFAzTUdEaiswbkFxb053S3RaNlJO?=
 =?utf-8?B?T3N4WnIvNUhVaEdhaXF1eVNtWThPTDVlSkc2eVRpL0dra3J5WE5ZSndtNWV6?=
 =?utf-8?B?WkZ5RW1kUnY1cW93Q2NhdXdaSkhKYVYwejdqeW4rSVFhTjIrZytreGNSSUlh?=
 =?utf-8?B?TkY0c28vUHlYRHd4ZjVSTlIraFZQMUVrdDYxdHBjRVlSUkowVDQ3eHBYNGVv?=
 =?utf-8?B?bHlmL3hrVkFyQWRjSTRrSDZSZk16eUk0NS9TNmFJdUVWLzJBUitKQUNuckxz?=
 =?utf-8?Q?hlnI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0518C61F00FDE54BBC4A52CEF943099E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eace6a69-6be7-4201-b4e3-08dcea64b404
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2024 02:22:21.7397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYINlYEo7S7vqpZ4DZeEHj4QFCUDMPCbltQuwnx/4a+Ts874F7u0rak20EsrVbC47VgN6/cdYTn7lIY0msHbYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524

T24gMjAyNC8xMC8xMSAyMDowNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMTEuMTAuMjQg
MDU6NDIsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gQ29tbWl0IDJmYWU2YmI3YmUzMiAoInhlbi9w
cml2Y21kOiBBZGQgbmV3IHN5c2NhbGwgdG8gZ2V0IGdzaSBmcm9tIGRldiIpDQo+PiBhZGRzIGEg
d2VhayByZXZlcnNlIGRlcGVuZGVuY3kgdG8gdGhlIGNvbmZpZyBYRU5fUFJJVkNNRCBkZWZpbml0
aW9uLCB0aGF0DQo+PiBkZXBlbmRlbmN5IGNhdXNlcyB4ZW4tcHJpdmNtZCBjYW4ndCBiZSBsb2Fk
ZWQgb24gZG9tVSwgYmVjYXVzZSBkZXBlbmRlbnQNCj4+IHhlbi1wY2liYWNrIGlzbid0IGFsd2F5
cyBiZSBsb2FkZWQgc3VjY2Vzc2Z1bGx5IG9uIGRvbVUuDQo+Pg0KPj4gVG8gc29sdmUgYWJvdmUg
cHJvYmxlbSwgcmVtb3ZlIHRoYXQgZGVwZW5kZW5jeSwgYW5kIGRvIG5vdCBjYWxsDQo+PiBwY2lz
dHViX2dldF9nc2lfZnJvbV9zYmRmKCkgZGlyZWN0bHksIGluc3RlYWQgYWRkIGEgaG9vayBpbg0K
Pj4gZHJpdmVycy94ZW4vYXBjaS5jLCB4ZW4tcGNpYmFjayByZWdpc3RlciB0aGUgcmVhbCBjYWxs
IGZ1bmN0aW9uLCB0aGVuIGluDQo+PiBwcml2Y21kX2lvY3RsX3BjaWRldl9nZXRfZ3NpIGNhbGwg
dGhhdCBob29rLg0KPj4NCj4+IEZpeGVzOiAyZmFlNmJiN2JlMzIgKCJ4ZW4vcHJpdmNtZDogQWRk
IG5ldyBzeXNjYWxsIHRvIGdldCBnc2kgZnJvbSBkZXYiKQ0KPj4gUmVwb3J0ZWQtYnk6IE1hcmVr
IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPiAN
Cj4gVW5mb3J0dW5hdGVseSBJJ20gc2VlaW5nIGEgYnVpbGQgYnJlYWthZ2UgZm9yIHRoZSAzMi1i
aXQgeDg2IGJ1aWxkLg0KPiANCj4gUmVhc29uIGlzIHRoYXQgZHJpdmVycy94ZW4vYWNwaS5jIGlz
IGJlaW5nIGJ1aWx0IGZvciBEb20wIG9ubHksIHNvIGhhdmluZw0KPiBDT05GSUdfWEVOX0FDUEkg
ZGVmaW5lZCBpcyBub3QgZW5vdWdoIGZvciBlbnN1cmluZyB0aGUgbmV3IGZ1bmN0aW9ucyBhcmUN
Cj4gcHJlc2VudC4NCj4gDQo+IEkgc3VnZ2VzdCB0byBhZGQgYSBuZXcgQ09ORklHIGl0ZW0gQ09O
RklHX1hFTl9ET00wX0FDUEkgbGlrZQ0KPiANCj4gY29uZmlnIFhFTl9ET00wX0FDUEkNCj4gwqDC
oMKgwqBkZWZfYm9vbCB5DQo+IMKgwqDCoMKgZGVwZW5kcyBvbiBYRU5fQUNQSSAmJiBYRU5fRE9N
MA0KPiANCj4gYW5kIHRoZW4gcmVwbGFjZSBhbGwgQ09ORklHX1hFTl9BQ1BJIGluc3RhbmNlcyBp
biB5b3VyIHBhdGNoIHdpdGgNCj4gQ09ORklHX1hFTl9ET00wX0FDUEkuIFRoaXMgaW5jbHVkZXMg
dGhlIHVzZSBjYXNlIGluDQo+IHByaXZjbWRfaW9jdGxfcGNpZGV2X2dldF9nc2koKS4NCg0KSG93
IGFib3V0IGFkZCBzdHVicyBmb3IgeGVuX2FjcGlfcmVnaXN0ZXJfZ2V0X2dzaV9mdW5jIGFuZCB4
ZW5fYWNwaV9nZXRfZ3NpX2Zyb21fc2JkZiB3aGVuICIhQ09ORklHX1hFTl9ET00wIiBpbiBhY3Bp
LmgsIGxpa2UgdGhlIG90aGVyIGZ1bmN0aW9ucyBpbiB0aGF0IGZpbGUgZG8uDQoNCj4gDQo+IA0K
PiBKdWVyZ2VuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


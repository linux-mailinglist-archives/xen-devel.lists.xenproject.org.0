Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A2A7783C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 11:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933820.1335659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzYMw-0005R3-UQ; Tue, 01 Apr 2025 09:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933820.1335659; Tue, 01 Apr 2025 09:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzYMw-0005PA-Qz; Tue, 01 Apr 2025 09:57:18 +0000
Received: by outflank-mailman (input) for mailman id 933820;
 Tue, 01 Apr 2025 09:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaGF=WT=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tzYMv-0005P4-M8
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 09:57:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2418::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b00fc322-0edf-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 11:57:15 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB7521.namprd12.prod.outlook.com (2603:10b6:610:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:57:11 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 09:57:11 +0000
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
X-Inumbo-ID: b00fc322-0edf-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNICqT42ez+Uz/hVaZNwWWwNW1ezMsv97GYXtkXxnHmTCPjq6VppQf9COzoJsJv0qN6MjRdHdLJlmoKoGNj3uhfMT5ofSPkNCDo5kQvbBn8tCX96/dVDcY7QR236cgGxUR9FeTlpTQvuQA8DWaq+6nR+YTmCSpxc+j7mOwL7wv7swJ1qLkZtxhjDya6ixSdxZnL3tAGaOKXjj1kqZTbFXbPUikNFyUi7dFG8jSL7p//IO64qaXO7cRosCxKIYxEbijlfBRF0xcN1hPAVjeHmS65gtPoLeZ2Ac21xNJ6eY5ypP7yA0L6Ju4ntyt2QFW79VU1jkSmzYeoKRf/+lARd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weTRQmvPingIvBy2VTNNNo8H2y0BgJl20cqZUcYQvIs=;
 b=W8QkcN8+X0eXzVdFZcrqZCu6iWNCfNlSDZGosAL+3TgtCMVui5FKBmBYmX1DQrz4XFnoETM9VX/XWd762tVlN5oeLFdR5BPb8kvDL+/u54zUTx0pnCGmCFTuqr5H+azVzAaXCvizmczUsSCYVUILSmw/D8nHO3mv9r/pa8K3+t0X2FonuEb94zmgVi+Vy4mPIFNR4o2mdpQeRGcsUr8Z2ry82AMxZ6+IUKBNcTCLOPzFH6uOfkShmtPamrKIKP/2HRUEPQN9e+7PXZ21VclF4/BG+zpKGTePnDYGuaaOlg39wU818oCyJxMZcUDSyfkraMoz3Ft5vKakDclVqw4NeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weTRQmvPingIvBy2VTNNNo8H2y0BgJl20cqZUcYQvIs=;
 b=JxT0xyCZ3OFttL/NJll0LSuQ436WQAeVG3gGA0Td7SKzF6EIj9rvrpbbNr0QVlaJNhgcbqvu0sVif7KySShd3Wl9H0utSWn1Xa5MuRZP2+BVkKzlyxKbwegJ9pdrWpG+7WW1FbH/2QPufxBUVhHQamaZ3NN+cTA872SO1Jzw84M=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH v2 01/19] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Topic: [PATCH v2 01/19] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Index: AQHbnhNmXaX6/9Ps5keSZ4aq1y0sz7OJPdwAgAOSgQCAAbXbAIAABxKAgAAOfPA=
Date: Tue, 1 Apr 2025 09:57:11 +0000
Message-ID:
 <DM4PR12MB845113FE3887BF22E2F28962E1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-2-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2503281655590.563920@ubuntu-linux-20-04-desktop>
 <6b3c3baa-331c-44fa-9085-9b0bf72c62a1@suse.com>
 <DM4PR12MB845170590A152B7AEF4D4153E1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a0148fb5-0b0f-4fe7-b31a-ea220965c662@suse.com>
In-Reply-To: <a0148fb5-0b0f-4fe7-b31a-ea220965c662@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=60ed6edb-84fc-45b8-91dc-cc6946e2457a;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-01T09:55:07Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB7521:EE_
x-ms-office365-filtering-correlation-id: 21233fc5-f60b-442c-a93b-08dd71039288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YzlDVnZ4UWt0SW5lWlA2MTU0aEIzeWlKZmsrdW9lcUxXTjFMcWIzbWhYYkRG?=
 =?utf-8?B?eG4xYzN2aEFSTlRoL1FJMXNMdjAyTHJvWWxZdG5jaHR4OWlTK1V5citESytX?=
 =?utf-8?B?VnVrOGZxVHdjMi8zR1plMG02VmkxVEFPYVU3ZUwyUktSME1GQk1RUHVxalA3?=
 =?utf-8?B?Z3VjaHFRMHJVSXFId3dQMEdJcFk5VDkxM21GaW94bktUdzVOdlZRcHlTVGMv?=
 =?utf-8?B?UldxTWMvWTVwRWp2azZxRnN0WnZwK09wd21KVUVQNW1FUUNUcm1HRStSQWdw?=
 =?utf-8?B?QVY4ckFFWGExVGxJNXE4QlNvT2lhUVl0ZHY4ZnFwMXNjdFlVbkFjaHArTCtD?=
 =?utf-8?B?RHdEaTVEOUdSUFlRVTRIazYrVGpHUzlFeVNEdVJCSjBINE9uQ3NyY1UyZkNa?=
 =?utf-8?B?M1AydStMUU54bFNKT2RrSmZyaVozdE4zRDVWeW5nMVRibDBTZE0zTVJuTEkv?=
 =?utf-8?B?QUpZekwyMW5NRHZyWXM2aklDbnBhZm82MjJqcTdEaWQ0VE1hS1V2T29GaDVL?=
 =?utf-8?B?YzF6dzFnT2xubm9PemxlMGhYeDM3Tmc4VWZndHFRdzFyUjRKbVQxeWNXVW1u?=
 =?utf-8?B?U0owWGpqMFc1NWhCenJNVENTTE50blo4NHBnT1dxN3NWWUVRZ3lnSHRWWW5L?=
 =?utf-8?B?ZGdxSm4zMDh3dGwvNlRpYUNmM0ZXWmpXdmJTclpiVU9mMXpRV3NwMlhILzY2?=
 =?utf-8?B?Zm1uWHFDVlo5SCtMRmdQRnlaUXFtUWVwQlFGNkRic29JT24xbjBtbnpRQWNM?=
 =?utf-8?B?cWVBdE9IVEJ3U2M3dzFXQjNKamVkdFJzelFsaWJuVWRpaHZ5aGxSWUlUVVBi?=
 =?utf-8?B?d284bHlKNTZvbzgwUlB3d3lVeTc3Mjh3SXhnRGhiekNrYmRlT2dzT1k3SlBo?=
 =?utf-8?B?Y3FqVFpxbWxzRWI1QkRlZlAyazNlNGduNm0rOUVUY3MxemIwaE1TYWpqUnR4?=
 =?utf-8?B?UUJTcUUveWdOalRNZ0hRL0JMdldQY0xDWGVyVTR5enk4WGNIbFh5eUl2OEpB?=
 =?utf-8?B?TVVrZTkrSUp5cjBidkxaZFZlTFMyNVFKbFBXSU5mU1oxZ0pqVE1IVXlTSlUv?=
 =?utf-8?B?OFZUVHM0d3FweUhWOG5TcDBYSU00NTl1Sm1kazVZdWFxQ215U0pXZFlJZjVo?=
 =?utf-8?B?NVFnKzlpSHpiUEIxZVJ2SENuRjkrZ01ndThSQjhDQk5mM2xlanh5aEZzS3pa?=
 =?utf-8?B?TG9FVGo3U1lsaXVpb0hwM3kvNUkvMENScW9WZXl4U3FEUXl1TmJNRFMzK0Rq?=
 =?utf-8?B?UlY0UjNsRjdZRTFiMVZiSXM4VWRjc1dCQWJVbGJib1RhNTY1VzI3Zm9uek5H?=
 =?utf-8?B?eXMwaGhpOXRGbFpaaHNYYUxNaHlpM213ekJ4RmpraHJtSXBzcGRoZ1ZSR0Mv?=
 =?utf-8?B?RFhady82TFpmcDhaNnB0OFFqcWtSWGNqZEw2cUlpSUZ0UExLcFVEMFZXdWJn?=
 =?utf-8?B?QWNUd0cyWVdCbFVHN0sxOGtZTTF6Uk9qTER5cktsQ2ZSd2xoQ05oREJDeFNI?=
 =?utf-8?B?eFVjSHpTV080em1FOVZKblZQb1NMeEdaL1pnTkNkUTRRd3FVc1hkMFZud1Na?=
 =?utf-8?B?L1dxVHNKblFnWko1WnFNbjY1T2tZOFFOVEgxVCsrSTgvSTRvcTBDWnRVOG8r?=
 =?utf-8?B?TUdjWWpMa0xVYW1oV2dRREJxVWhCbzZBelkzOHhHQjJqZnpSZzZheElVK1FR?=
 =?utf-8?B?WXgyUThmdFI4NWtreUxld3loQ1AxOVJ4bTFYMlRRUWQ3SDlTcWRMME1ua0dK?=
 =?utf-8?B?OFA5bDlzYWM3YkNYclV2YkF5by9XamVvQkZBbTArWGkrVTJqNm5lL0VYVWwz?=
 =?utf-8?B?L0xaTEoxQkkrUEVVOFhTRS9GMHhDMVZPdXRBV2VJdWZIVVdwWm9kS0k1eG1O?=
 =?utf-8?Q?Mk9TleojA4JEO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3BKZk12Z296UjRuRnlQNDVibzdvQjI1L0dZTXVSRyszZFRudTdEU3c1VC94?=
 =?utf-8?B?K1ZCWHJUeUVvbjJ2Z1I3STBxWkd6SXFXOXU0bTRMQXJESXFWUFdoU1BXZUIr?=
 =?utf-8?B?c2daY0FCTVIwcnRCMGEveERJcHpRSUEvbXMrVXd0UnlEV2tDVUM1dktNNmdU?=
 =?utf-8?B?Nmcwc3M4MjFiamJieUhCeHhWRmpVNkllUEZEMkhyZzgvL2dqT0Z2QUhLcU9r?=
 =?utf-8?B?aDZQMkY5eUliaE4zcGRhbVEwVlJlZmo4SEs5WjFPOWFRQnJTRGNoTTJYVnBB?=
 =?utf-8?B?dWl4azliWWdzMmdYaHFUcEFyM2I5cHJsQi9GNkwxSythT0g5cHJqNG9Mdnkz?=
 =?utf-8?B?NHZrdVVNdUZ3Y2Mvbld6SkdTTmhaMldUMnZDUG9QSFJoU2wwT2VpOHN5U3g3?=
 =?utf-8?B?eVQvTm1JbGYzZUhXYmJtanphaUZBYnFMOFdxdlJDNnJ2R05PNnBuU2todzFs?=
 =?utf-8?B?VnBlblY5bWdSSlhEWVR2SkN4Z0daOWF3ZlJYWlNoYUxxTllYMmk3SFBLY28r?=
 =?utf-8?B?RjJSbDIxZUUzQzUwNTU0Q1lwMkh4NGxIc2FCNHJtdzd4WWhxVUtNZTV1M3FX?=
 =?utf-8?B?Yzd5UU9FMDJLa2M5dkZxNjVFUUpOZVhxeHI4bTE2SmRraG9EcE9ORjV3TnA4?=
 =?utf-8?B?N3BEZzBuZ3hSWnRzVkxvV1I2alNWeG1NNXprbTRUNWRXUGFFM1RBZ2NEeTB0?=
 =?utf-8?B?NytqM3NsSUJrdmJBL3FJLzBPY2V6TVpKY0lVQXg0T050eWM4eVpjRndkYUFF?=
 =?utf-8?B?djhRTVZUakdUa1IyV1RmdkFaaERySDlKQTBwV0NmWitiL01PSGFOQnJIdERq?=
 =?utf-8?B?aUZlYlY3M2NTSE1TaFdiNytvN01DTzJvejZuRWt1VHE2ZU1mZy9yUU5yb2Fv?=
 =?utf-8?B?bUdXL0hNQjdwWGdmUUtIalRQdDg0VVF6cWw4YnFZTDNKRllpYXhHdDdRSUFE?=
 =?utf-8?B?UzM1NFpaU1Q1NG51SUdXNlltd0VocklGZnUwNC9rV2dtR3JtV002NHB6d2w4?=
 =?utf-8?B?b0FKT25pSkhkUDV0dVcvdy9iNlRpVkVlanluN2xJcVg5S3dLS05wNDBPZjNJ?=
 =?utf-8?B?UytFMmFESFIybVZQN3dvbzJwQmxlbU1QYkJua0tsbzBZeW13MEJacXB0RW9i?=
 =?utf-8?B?ZzJDbkpCdEFYRExaVWdFVEpFUStSR0hGQ2IrNHdwTzgrM2lobXNNMHI1cmQ3?=
 =?utf-8?B?ZnFRc3VXRUVMdm9DaFVWcVpxOVdRZlVyZzhlSDV3ZDNGUU1MR2dWNVltYm9O?=
 =?utf-8?B?TmhUTnU0TXRqOE5LcTVKT1ZZeFFHS1ZjRStNNVIxYkord25ZbmZ5OVFhTG9t?=
 =?utf-8?B?cEhTZ3pxam9VY0t1NXBnUDJhMmtZRTlUVEpVaU12d3c4S0FDRk1DaFVYYUo1?=
 =?utf-8?B?aVVid1U5YUhOTDF2VnVKZ0VtYVlMQmYrYy9WTkd2UDFYd1FjRlptRnlIVTdK?=
 =?utf-8?B?UTFCZnpFbW01dngvVTdKRUoxQ0VZUjlNWjE3QWhmNG9mcDgzcjVTY1NpUk1B?=
 =?utf-8?B?ekpKazh3b3JjV2dwVTRReWFCNUhFZjZSc0VMZG0vMjAzeGNKWWhKNVBhVUtL?=
 =?utf-8?B?QnREWjFrb1pQNy96b0E1WmpXQXVybXRNWEZmeXRGaFdqT096MHRPUDJCdnlZ?=
 =?utf-8?B?NGQvSktxQWVqYksyN3JUdHpsRkxhVlR2OE9tLzZOelYzWUUySWJrM3JKcVR4?=
 =?utf-8?B?ZzBvdlJDbW56akw2YTc0VlBzdmRReEYybmY4MDhyMzRhMS9WWTZmVTQ3djEv?=
 =?utf-8?B?RGdQdFJJQjBzQ1BCNzFTWkZaYXptWnR5WnBISWFIN0N6clZvWlZQQlZaekVI?=
 =?utf-8?B?NVEzeXJVb0pIMk4zMzUyRDNtYVdXbkQ0VWRSM05yR0xxcksvZUJwSk9YRUtT?=
 =?utf-8?B?NTAyR1FqZ09ibVJhSFlyMnJjMDJvNUFBSjk2V3NUUVFZdmdkcEZzdk5pOFZp?=
 =?utf-8?B?N2wvYnI0cTFvc25NNExKb0FiQzlhZHhYNDdrTURNZG1CM1JwVTE1d2c4eEJG?=
 =?utf-8?B?YlNwa0U1SXBOYVEzRSt3SGVtQWpKVWQrUnpmZnF3NXZCUlVhU2xSQ1dTSEtU?=
 =?utf-8?B?Kzd6Nnh2QWZDYkxLYW9rTHVnUDJCRE9QekFzVmE4emNsTndQNjJpaDN1Q3Zu?=
 =?utf-8?Q?yLog=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21233fc5-f60b-442c-a93b-08dd71039288
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 09:57:11.3508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yy8hUbrN17JNeRpIRZRoR9Okqe4hnHzTH0fFVosfyZe4J1AKEaPhXNAL7J3XbduwnTBJrOhP7eLKICaO17EXkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7521

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDEsIDIwMjUg
NTowMiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1k
LmNvbT47DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dl
ciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsDQo+IE1pY2hhbCA8TWljaGFsLk9yemVs
QGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
IDAxLzE5XSB4ZW4veDg2OiByZW1vdmUgImRlcGVuZHMNCj4gb24gIVBWX1NISU1fRVhDTFVTSVZF
Ig0KPg0KPiBPbiAwMS4wNC4yMDI1IDEwOjQxLCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBNYXJjaCAzMSwgMjAyNSAyOjMwIFBNDQo+
ID4+DQo+ID4+IE9uIDI5LjAzLjIwMjUgMDA6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToN
Cj4gPj4+IE9uIFdlZCwgMjYgTWFyIDIwMjUsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4+IFdl
IGludGVuZCB0byByZW1vdmUgYWxsICJkZXBlbmRzIG9uICFQVl9TSElNX0VYQ0xVU0lWRSIgKGFs
c28gdGhlDQo+ID4+Pj4gZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgImlmICEuLi4iKSBpbiBLY29u
ZmlnIGZpbGUsIHNpbmNlIG5lZ2F0aXZlDQo+ID4+Pj4gZGVwZW5kYW5jeSB3aWxsIGJhZGx5IGFm
ZmVjdCBhbGx5ZXNjb25maWcuDQo+ID4+Pj4gVGhpcyBjb21taXQgaXMgYmFzZWQgb24gIng4Njog
cHJvdmlkZSBhbiBpbnZlcnRlZCBLY29uZmlnIGNvbnRyb2wNCj4gPj4+PiBmb3Igc2hpbS1leGNs
dXNpdmUgbW9kZSJbMV0NCj4gPj4+Pg0KPiA+Pj4+IFsxXQ0KPiA+Pj4+IGh0dHBzOi8vbGlzdHMu
eGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIzLTAzL21zZzAwMDQwLmh0bWwNCj4g
Pj4+Pg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4NCj4gPj4gV2hlcmUncyB0aGlzIGNvbWluZyBmcm9tLCBpZiBJIG1heSBhc2s/DQo+
ID4NCj4gPiBJIHNhaWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCB0aGlzIGNvbW1pdCBpcyBiYXNl
ZCBvbiB5b3VyIGNvbW1pdA0KPiA+ICJ4ODY6IHByb3ZpZGUgYW4gaW52ZXJ0ZWQgS2NvbmZpZyBj
b250cm9sIGZvciBzaGltLWV4Y2x1c2l2ZSBtb2RlIlsxXS4NCj4NCj4gSSBkb24ndCB0aGluayB0
aGlzIGJlbG9uZ3MgdGhlcmUuIEFsc28gcmVjYWxsIHdoYXQgSSBzYWlkIGVsc2V3aGVyZSBhYm91
dCAiVGhpcw0KPiBjb21taXQgLi4uIiBhbmQgYWxpa2Ugbm90IGJlaW5nIGFwcHJvcHJpYXRlIHdv
cmRpbmcgZm9yIGNvbW1pdCBtZXNzYWdlcy4NCj4NCg0KVW5kZXJzdG9vZCwgSSdsbCByZW1vdmUg
IlRoaXMgY29tbWl0IGlzIGJhc2VkIG9uIHh4eCIuDQoNCj4gPiBTbyBJIHRoaW5rIEkgc2hhbGwg
YWRkLWluIHRoZSBvcmlnaW5hbCBhdXRob3IsIGlmIGl0IGlzIG5vdCB0aGUgcnVsZSwgSSdsbCBy
ZW1vdmUgaXQuDQo+DQo+IFBsZWFzZSByZW1vdmUgaXQuIFlvdSBuZWNlc3NhcmlseSB0b3VjaCBh
IGZldyBvZiB0aGUgc2FtZSBwbGFjZXMsIGJ1dCB0aGF0J3MgYWJvdXQNCj4gaXQuIEkgYWNjZXB0
IHRoaXMgcm91dGUgYmVpbmcgdGFrZW4sIGJ1dCBJIGRvbid0IGFncmVlIHdpdGggaXQuIEkgZG9u
J3Qgd2FudCB0byBiZSB2aWV3ZWQNCj4gYXMgYSBjby1hdXRob3IgaW4gc3VjaCBhIGNhc2UuDQo+
DQoNClVuZGVyc3Rvb2QsIEknbGwgcmVtb3ZlLg0KDQo+IEhvd2V2ZXIsIHlvdSBoYXZpbmcgZ29u
ZSBmcm9tIHRoYXQgcGF0Y2ggKHdoaWNoIGhhZCBhbiBlbnRpcmVseSBkaWZmZXJlbnQNCj4gaW50
ZW50aW9uKSwgaGFzIGxlYWQgdG8gdGhlIHBhdGNoIGhlcmUgYmVpbmcgaW5jb21wbGV0ZS4gQXQg
bGVhc3QgbXkgdW5kZXJzdGFuZGluZw0KPiBvZiBBbmRyZXcncyBvcmlnaW5hbCByZXF1ZXN0IHdh
cyB0byBub3Qgb25seSBwcnVuZSBLY29uZmlnLXMgb2YgdGhlIGRlcGVuZGVuY3ksDQo+IGJ1dCBh
bHNvIGUuZy4gdmFyaW91cyBNYWtlZmlsZS1zLiBQb3NzaWJseSBldmVuIC5jIGFuZCAuaCBvbmVz
LiBUaGF0IGNsZWFybHkgd2Fzbid0DQo+IG5lY2Vzc2FyeSB3aXRoIHRoZSBhcHByb2FjaCBJIGhh
ZCB0YWtlbi4gUGxlYXNlIGNvbnN1bHQgd2l0aCBBbmRyZXcgdG8gY29uZmlybS4NCj4NCj4gSmFu
DQo=


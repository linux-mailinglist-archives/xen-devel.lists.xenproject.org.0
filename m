Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D092A358C9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888572.1297923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqyD-0006i8-7D; Fri, 14 Feb 2025 08:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888572.1297923; Fri, 14 Feb 2025 08:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqyD-0006fW-4F; Fri, 14 Feb 2025 08:22:45 +0000
Received: by outflank-mailman (input) for mailman id 888572;
 Fri, 14 Feb 2025 08:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K06w=VF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tiqyC-0006fQ-7Q
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 08:22:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc87b7d6-eaac-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 09:22:42 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 08:22:39 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 08:22:39 +0000
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
X-Inumbo-ID: dc87b7d6-eaac-11ef-9aa4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3/ekrGllgoRvf/zAonOsFXwAhdfLm9KtgzzrI5y/a3JbSJegewY3xzeCuK6wGOnBRjy1laChckb2LuaMoDj2YkusWMhdancrS+DOQJeStoOu+d3+aAAjhQeQhEI3mRh517T6yR2pCnrN3aOhlB1hhszHS/0ioTruM/xGcKUVOL6jwuO0McT6FlVdOyw3lgdT2ALjzIXYW/PCUErKQHgTmw+k3jas0RMwTYKj3oHIYzVQ/DFP2vu0sd4000HkAkKuJ8qmZx47gPq6/V2R7/cPwFVmz28vIy9EjzuoUzJo2IdRu6jOnFYPIbtX/WvYb+bzBNDGBsRZu/y1z0YeS7uqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4odUrUD+4Lk+vyiBeVsxHvbeYQwWngnzbZb+0vclcc=;
 b=AuxnnxHdykz8FfBQhkbGQYzlZwVxZW/Kk7jddY2WD834U1EIjRfZA1AwXZspqBOHP2uFOhrotdAm9tr067jwE91wTNXPDLLlTD8hM8dTZt0dR2Ay6cZ7uFH23HL6rgt6gYUIu4SoMg19Gu/75jfhF7OtNUQIaWFSrn+tD/r0tiBEfWIfpDCN+5Fi5n/3HhZW5o8kX4OchnuZOKhzDa0QXsgYmfhvkg33+txOClAxePoNp291OPP1QccOhCfKPKUQjwCDrSu0k0Kkrw9/KW9DJNcCt5lxSnZFOMdMoGSq09TNUmynTixd0UNIsCiB4lM9h9tv8FZ7hOiqaNjzXVyI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4odUrUD+4Lk+vyiBeVsxHvbeYQwWngnzbZb+0vclcc=;
 b=3tMp7gIOBxZ+ZKkFffozwxn2oduE01QwSTmm/fyanOfU4CCTI5KydJl9owiY560Gt1kZwBzN9IrumVQqjhGaTKnY4CpypDrD8IeSwFGP9OOA2olyxN8fA+zgbhXpRbv2tYe+3Rp2vkW81Iscry7Qhpp7m5nCgVlYKxaZNkS8Ovk=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v8] vpci: Add resizable bar support
Thread-Topic: [PATCH v8] vpci: Add resizable bar support
Thread-Index: AQHbfCv1LhGDvDdYvUG/cVOOSigHrrNB1FUAgAGqhwCAAu7EAIAAC/MAgACG94A=
Date: Fri, 14 Feb 2025 08:22:39 +0000
Message-ID:
 <BL1PR12MB5849BDEC2A23731E9281A26FE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
 <Z6sWnK1BYxArBq--@macbook.local>
 <BL1PR12MB5849CF146DFA8BD2761D1F4EE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com>
 <2fcc37f5-20e5-4c52-9e8b-c24121c05e8b@gmail.com>
In-Reply-To: <2fcc37f5-20e5-4c52-9e8b-c24121c05e8b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8445.012)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB7777:EE_
x-ms-office365-filtering-correlation-id: 65f80f59-a9d8-446a-2a7a-08dd4cd0bec8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z1NpWGIvQW1IV0UzTC9oZEFvZWgxS3FQczBGNjlyRTM4Qk14TzlnR3lMK2NO?=
 =?utf-8?B?dXNQUWJOWVRmUGwvdytoZlhoampTd1E4ZDE2NE9MSjdtMVhtYWNrd0Jrc1Zq?=
 =?utf-8?B?TXVXTkdFRlI5VTNVMFFYSGhmSnJBRzIvejQ2MFZFbGpSeEhGTS9yNkRaVWZL?=
 =?utf-8?B?RnlyWmtsYXZQak5JZkdTd2taWk5FdGs2dDA2UE95R3BUbmlBSUJmcjRlaWQw?=
 =?utf-8?B?QzlDTFE3R2ZKMElsSElRTm4rQXNYaDZST3ZtUk8xZnU0QXkyQTFSYkh2VDh5?=
 =?utf-8?B?Ui9GY3ZrdEtxbHlNSUNSMVlRNGNaRHFVdE84OE81YlJ2c05vV1R3UVhyL05B?=
 =?utf-8?B?RHd6cUpLTGZORVhQQkQrRjBLdDVGbDZSWmIrSkJjK012bldaZ3dLK0ZCNnJY?=
 =?utf-8?B?YzRVWDdBdTB3Y3ZtTWlEZENkMGF4RzRtY0Z1TGZuakp4VW9VZGZDam9xSER1?=
 =?utf-8?B?b1ZIclU1dFE0L3hwSWxGa0ZFRWJpb21QdnF6L1FWT3pINHBJaDB4a1dWNmp2?=
 =?utf-8?B?ZWpicGc1K0lrdXdReHFoS1p3YjRyQ21CaEFMOFZGZ0ZFcHFxUFVKdGpsZkJz?=
 =?utf-8?B?V0ZIK2NCQUIxYkU1YUlzYXhaTVJzNWdsRytPd3c1eWpSTVRUaFNqUy8yT29E?=
 =?utf-8?B?c0lidWhVbEI0NFp0QmNpZHNNL3NVbDdEc0RpMnF6M1FQeEVVRWRvT0lhcllB?=
 =?utf-8?B?Z2JLcEdjVnIvMHpmQXlIUEFrNmE3R3BaS3BCcTB3bGFjcjlHTmFSOWdXemFX?=
 =?utf-8?B?b2FEOVQrVEkrVE5udVRLNG44cTNHelhUM2xJR2xOZ2U4RW1acjgxcXZFUm1r?=
 =?utf-8?B?RnE2cWJoellTV010WFFqWGtodVZ5UGVCSnZvc3ZWZ0xQWUM1TW5NS05sbXI1?=
 =?utf-8?B?bUdwdzUzWVNya05tQ0tUNlFIQnplOHhtK1JBMVhvQkxkMjlUKzFXbktvcmRl?=
 =?utf-8?B?d3VJWW9ZalZ3MXNxSGFuaTZPcHhkNEF6OE9mOFlEQ3VnWndNY0M2ekt6bUxl?=
 =?utf-8?B?TDdlRnd1dVBESnpucTZ3VUkvRkNhd2pDVmw2V3F0Rm5pZUl2RC95alI2c09w?=
 =?utf-8?B?U1YzYkxxMUZFWWhoUE9XTTVtVXJIekdxVWF0dVlrQ05zRHdtNk4zb1I4eE1z?=
 =?utf-8?B?aHJsSTBJamh0YTkyUStuNWkvN092VEVMRlY4N0JGR1N1UEhXRXN1Z1BXalVz?=
 =?utf-8?B?UzhGRkdjOVRFM1pGcEdpdS9Hc0hMR0Zjb0pIMUErYm1zWTRkTVl6c1ZBaWE2?=
 =?utf-8?B?V1FZbzdYNTBBaGVaTVFjNHJTT0l3WithaS9lQkF1WTl1a01mT3VVQXJrckMy?=
 =?utf-8?B?VXJaTlVCLzVjbUN1U1daNlR6VmVUZktFOTBOWHlOeVQrb0EyVUNkOHRydG1P?=
 =?utf-8?B?ckdrU2VsVFFLQ0RicHdnRkR6TGgzNGhhSzh5M0ZhYkVpUlFLdTA5MDlvM0NM?=
 =?utf-8?B?SGJnQTI2eXhnOHpsbTV3LytXQUdxMUFXZVY4d2ljZUFKRXBHQlJCZGEzTlFn?=
 =?utf-8?B?bkt0ME1QSTgrUVdmU2VOV2drMk5GejlJY2JiT0Z5M3NyQXZvOFlKVmJoR2lQ?=
 =?utf-8?B?OWlqNW9MRm0wNEI5ZmhFckQ0Vm44WXlVek52STdxekRvNU8zek9hNWJLYS9U?=
 =?utf-8?B?UG9IUWdrbFF1bEdJbHRlSGdneEFoTXd1ejE2WlcxT1Z0aW51dDJVVnQzWlhw?=
 =?utf-8?B?Snl3b25HOGFldWQ2Q1Y1NGxXaW5XTUpOQjhyQ0VmVlB5cVpmbkFCdDYwU1hs?=
 =?utf-8?B?SndBTloxK0FjOURGUWRxS0ljUC9MbVNodWIxQjFSU3dyaENra3FadGZFQitZ?=
 =?utf-8?B?Q3k3enR4VHhKV2ZhOWFVaHM0aWJVV0NPTkZReE5oVlVNdDFQSkNpWnpjTTMx?=
 =?utf-8?B?NGVtcThCa1kyeXlOdTFaR0djZkw2cUtJM3d0WGNzUXZqWHZLMkpua0Roc2p6?=
 =?utf-8?Q?Dvd66aqCQe6x0duvpLJnuVaJasCy/tzq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXBaNkZWNjcwWWZuaDlxeFZuVk11emplUXY3UHpkUVhRUC9zZjdoTXJNZHJz?=
 =?utf-8?B?UEpkTys3dEFuNE8rVk1BMFpJWHd5NEtwS3MvbS9IM01CUGMzUjcwb1luY2JQ?=
 =?utf-8?B?N2UvWFh0NTE1M2NpNDhNZTFGSTMveU5kcFlRVkxQeDBhdy9qSEdRQ2V5N3U4?=
 =?utf-8?B?M3haR0RrRm80enhqMVVWK0N4R212bnhDR0ZxeWV1UW1EaVdRaWNBeS8vWkQx?=
 =?utf-8?B?Um1KdHlDd1dPUGowRjJhYTgxd1VtZUNtTzN5Q3pidVBld1lndnFXQUZkUi96?=
 =?utf-8?B?MVZjNTIwaFBTVVkyQWFJamNuUHl1ZjRpdVhnTDRjVHZvNldBSlM3TzV1a0Rx?=
 =?utf-8?B?RlJPUEp2TThkZVRlUFBKdXh0M3dhWVUrdFVlLzNiZGdHTkxaQk1RU01LRFE1?=
 =?utf-8?B?RmZNMmk0ai82dTJDeGt3UkcrQnNGZENsNDJJTDJrMUdyZTFUNjRLY3BCY3l3?=
 =?utf-8?B?V3dPTkw0eXRvNkcxa1V1Z3Y0bW5pMVFOVFFmYWowK0hxYVlpb1pxM2w0emsx?=
 =?utf-8?B?VTZBMjRyL2RrUHk3ZUdxM2hwTTdQWkNjbjFTQ1NYMk1neVBPdnU1UTFma0xE?=
 =?utf-8?B?UktlQ0duZkxzM3RQcWVZenRGZWE4U3VYMWNXc1lWR0VPYkU1UWdoQ0g3cjgy?=
 =?utf-8?B?a2J2eHpSSDNZRVdJRnNzVmpBRmMrRy8wWUdmd3d0VVV1VzliVFpRV2dqQ2dS?=
 =?utf-8?B?QUlvaDluOTNLNk9QeWtlRU9kcFNrOVB1UHJDV0hMQjZJYm9oVlI1T21SU0ZW?=
 =?utf-8?B?S2JKRVhFT0Vpd3FtRTlGUmVHNVlPeWpZc0xOSVFaUmtMWmw3YlNEWjh6STlz?=
 =?utf-8?B?RU5FdXEyVTI4NWwvancrNTFBQmN6MTA2aVdvL3d2TkdkbzNWeDJUNjlzYVp5?=
 =?utf-8?B?N0ZHZjc0cFZ3c2JEdmw0V1VKb0hleUZEMFFKV2pEeVZNbTRJcnlaMy9Ddy93?=
 =?utf-8?B?YmdVUDcxVE04WWZtaEpQcEVxWEk3Yi9zNkMzcnM3Q1M1Yk5YaDU2K3BabTlP?=
 =?utf-8?B?d3M3ZGJaVGRFS3dzVnEzUXFCNE9qaWttTGE0VzY4aWt1NWVjUVpUUjFldHhL?=
 =?utf-8?B?VXVpdGpVVXAxeVhZNXZDRmVJTHE2dGpFejN5ejZ5RHUvWXNkZFdDTHBvZjhT?=
 =?utf-8?B?cXRVQXI0MWpWT2phOUJPWFdQOHg1NHNvbVFkd3VRcnlpRFRxeEprRW1pdXdh?=
 =?utf-8?B?YjgxUG5GUzBuNG9mUitlVWdKYkxKZmJvc1lnMFRhZ2RxYjR6eHJsazRFS2t1?=
 =?utf-8?B?SEExMFVQSW53VE1rUCtNSU5RcExEcnZHSm5zT0l4OHd3a3c3VmhoWHg2MnFy?=
 =?utf-8?B?SkQvK2lYVlhLWm1laTFOYVRBVWVLbmYyVWFvU1d5eWlBY2UxUkU5azR5MTVk?=
 =?utf-8?B?NUJFVG5DUUdEUmRhR1RZY3pDZFBiMGFrd2xPeGlwRVdyNURJWTlFTnZwOG1T?=
 =?utf-8?B?R3ZFWGJ6UkdBY3ZSaEtaZE9IT0ZSTC9oTFRxMmVaYTRLZ2puOVd5RW5FS0xK?=
 =?utf-8?B?aEtFS3ducXFvS2hxSStuV0pFSXJ1b1Jsc0ljeDl3cGNnTlRTS1FsTUpRc0t1?=
 =?utf-8?B?WEtWZmtYNC9Oc3pDOElnQzlZSjBPSEloVkcra05nN0JKU1ozWWkzNEJOamg4?=
 =?utf-8?B?dDRTWFB3WTB2WmtPMTlzaHpFSVRMbWNodkVycFYxcENSc1RtOE55QjlEdmxI?=
 =?utf-8?B?c2ZkdlBON25Uc0s4YnhQNUZkb1pNUXpBVC9JUzFRUXJycGduUWFxMHJSOHFn?=
 =?utf-8?B?L1JwMWxiWjNqMVNKK0ZOSXl3MUZYYlNzdXJ0SnRYbGV3UGVqdVdNSVVXRWli?=
 =?utf-8?B?eDJ6T3dEZ3JpRVBBNmxHZ0pZSGZWdkgrek10QTYraGhYc0Y2c3oycDA4RThE?=
 =?utf-8?B?SmczbkU0WU1aSEc4QWVNSDh4UHBkVnkweE80SlpaMlNRYUlkMm5IdUhndjk5?=
 =?utf-8?B?dVQzdTVrR3F3NnRmOEYyV05nTlN5VjVuUnBxTzhCZkRwTmc1RElGSlB4UGc3?=
 =?utf-8?B?SEsreWEvNHNqSkpkcW1MVDlkd2V1QXB6OHpKWWpYK0hZZEQ4RG5vc0RBZFNS?=
 =?utf-8?B?N2lHbldhbjhUbWFOVnN6bHNLVy9Mc3duQW1DV2VlNStadFF1Nnh4aFdmWHor?=
 =?utf-8?Q?i9gM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FE9BCD0C889A94F83FC5EF07329F1FE@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f80f59-a9d8-446a-2a7a-08dd4cd0bec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 08:22:39.3782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0/GqQMz0lXi5k3llTNuA9ihLNY5KhMLPezmi2gydKWFswktGK+kXbZzO4XqX8XDoBUJS/DaEYxD174rpiCQ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777

T24gMjAyNS8yLzE0IDE2OjE4LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiANCj4gT24gMi8x
NC8yNSA4OjM1IEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE0LjAyLjIwMjUgMDQ6MzIs
IENoZW4sIEppcWlhbiB3cm90ZToNCj4+PiBPbiAyMDI1LzIvMTEgMTc6MjEsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6DQo+Pj4+IE9uIFR1ZSwgRmViIDExLCAyMDI1IGF0IDEwOjIyOjU3QU0gKzA4
MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4gU29tZSBkZXZpY2VzLCBsaWtlIEFNREdQVSwg
c3VwcG9ydCByZXNpemFibGUgYmFyIGNhcGFiaWxpdHksDQo+Pj4+PiBidXQgdnBjaSBvZiBYZW4g
ZG9lc24ndCBzdXBwb3J0IHRoaXMgZmVhdHVyZSwgc28gdGhleSBmYWlsDQo+Pj4+PiB0byByZXNp
emUgYmFycyBhbmQgdGhlbiBjYXVzZSBwcm9iaW5nIGZhaWx1cmUuDQo+Pj4+Pg0KPj4+Pj4gQWNj
b3JkaW5nIHRvIFBDSWUgc3BlYywgZWFjaCBiYXIgdGhhdCBzdXBwb3J0cyByZXNpemluZyBoYXMN
Cj4+Pj4+IHR3byByZWdpc3RlcnMsIFBDSV9SRUJBUl9DQVAgYW5kIFBDSV9SRUJBUl9DVFJMLiBT
bywgYWRkDQo+Pj4+PiBoYW5kbGVycyB0byBzdXBwb3J0IHJlc2l6aW5nIHRoZSBzaXplIG9mIEJB
UnMuDQo+Pj4+Pg0KPj4+Pj4gTm90ZSB0aGF0IFhlbiB3aWxsIG9ubHkgdHJhcCBQQ0lfUkVCQVJf
Q1RSTCwgYXMgUENJX1JFQkFSX0NBUA0KPj4+Pj4gaXMgcmVhZC1vbmx5IHJlZ2lzdGVyIGFuZCB0
aGUgaGFyZHdhcmUgZG9tYWluIGFscmVhZHkgZ2V0cw0KPj4+Pj4gYWNjZXNzIHRvIGl0IHdpdGhv
dXQgbmVlZGluZyBhbnkgc2V0dXAuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFu
IENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+PiBUaGFuayB5b3UhDQo+Pj4gTWF5IEkg
a25vdyB3aGV0aGVyIHRoaXMgY2FuIGJlIG1lcmdlZCBpbiBYZW4gdmVyc2lvbiA0LjIwPw0KPiAN
Cj4gSXQgd291bGQgYmUgYmV0dGVyIHRvIG1lcmdlIGl0IGFmdGVyIHRoZSBYZW4gNC4yMCByZWxl
YXNlLg0KPiAoSXQgd2lsbCBoYXBwZW4gaW4gdGhlIG5leHQgMiB3ZWVrcykuDQpHb3QgaXQuIFRo
YW5rIHlvdSBmb3IgcmVwbHkuDQoNCj4gDQo+IFRoYW5rcy4NCj4gDQo+IH4gT2xla3NpaQ0KPiAN
Cj4+IFRoYXQncyBhIHF1ZXN0aW9uIE9sZWtzaWkgd291bGQgaGF2ZSB0byBhbnN3ZXIuIE15IHRh
a2UgaXMgdGhhdCBpdCdzIChmYXIpDQo+PiB0b28gbGF0ZSBpbiB0aGUgY3ljbGUgZm9yIGEgZmVh
dHVyZSBhZGRpdGlvbi4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==


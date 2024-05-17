Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123EF8C8490
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 12:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724000.1129175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uX9-00019Q-Ff; Fri, 17 May 2024 10:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724000.1129175; Fri, 17 May 2024 10:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uX9-00016r-Cm; Fri, 17 May 2024 10:09:51 +0000
Received: by outflank-mailman (input) for mailman id 724000;
 Fri, 17 May 2024 10:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7uX8-00016k-Cm
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 10:09:50 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97708af5-1435-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 12:09:49 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB8483.namprd12.prod.outlook.com (2603:10b6:610:15c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.54; Fri, 17 May
 2024 10:09:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 10:09:45 +0000
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
X-Inumbo-ID: 97708af5-1435-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nf/m7rDMbVVcUcs0LEJZR3B6nGDp5aqSqkZAjYI+n22w+09P7JIyb9hiaCJsPvhWIYF/nwx66KLxtY1zpoDJ3dGIhXwDZAArK7PXkR6MhVSXLvmwDKwuWGD8egOz5SMUG3Q4bgt9QgpMfw15/ifNbUvNUhsx2Z/DjtMiBt3ZHYQPWNx9vdykAxwTJ9LNA++ylNaVAAI+2ex4xmu31PrG7dQXMRVtI2bvO5nLRsPh8c4kEtslwUFtESsNo2fesCMrGkNx8k5ow/9QqNis+XgEkZ9XOBUzIMHHWJORiLtYYXdafSZeQ4MPTWR2mFwIxrz7Ef/N0GM8mX+tiGv71AMZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrBNDZm4NVDfTbuhqJBPUVkbLlFN+3+NAlARdffVE5I=;
 b=erZ+oGsvavOm12AWfMc/zOwC/8r0rtTBJS64mft+xl+EESgzGVrWM1xZjcWVTSS/q0OIkgR8AXRXWGZIHABJM261scTs5g4XwAvcYvVeM1l6CSbsi6YEjcOJ5zD4MgNWDy9PZRaJfzGMePqyFUfAydUBbIBep0Kl+7tfFAc02/6ILZHqjtKycgPWPn/sNeOq4g6J2MkTU+5Uct8mmnKfcXncLt8A6vYsncGEmzHTcDHKAu0du2MZUJvAtCfZL5tIg4ta2TS0xAKX3du8bfo1m62ytsm+Ai6+IaCgbUIk+7H80ZPppuhpZkC12E2K65ei2NEi6VHhHWS1BdKWcELHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrBNDZm4NVDfTbuhqJBPUVkbLlFN+3+NAlARdffVE5I=;
 b=gdzRKasrknd2vjHgZ9o2PSvrph/WzM4znbJaC1GcmsN4dTI5AeRuAdlQ360lDP4R6tY/Fn5ooPFr/ZcCy99r0dL7y5eXabpp+gl6qD1Tq7IXYm6GXAiztRcfyKYuMaPmfcANGwZ3zr41umV93eJxc8r9WQqHt9x8u5RpIK5LETw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Index:
 AQHap3bYcGtlWtrcpEyRLTK5fjq5SLGZ1UMAgAFwSAD//9GPgIAAlWQA//+DzoCAAAPIgIAAhyMA
Date: Fri, 17 May 2024 10:09:45 +0000
Message-ID:
 <BL1PR12MB58494E8AFFFC7ACE31C24DB0E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
 <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
 <3ef32fec-53e7-403c-81d6-9f3e89966e2c@suse.com>
In-Reply-To: <3ef32fec-53e7-403c-81d6-9f3e89966e2c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7587.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB8483:EE_
x-ms-office365-filtering-correlation-id: d27bcfaf-9cbd-4af1-89a8-08dc76597a35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|1800799015|7416005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?YXh3QzRWL2JlS3hjY2VrdVNjU0Ywd2RlaEtPSUZta3ZtUUJqbXhnQjFVU25t?=
 =?utf-8?B?cXFFWVZHSHpwcjNxS0pyYjhZcGF1QTVRK3pwamU1YnNETGwweXZuRWRQVmRP?=
 =?utf-8?B?TDJFRS9sMTB1K2FoZEZzTjlJVWZmNWdmQ3QycFRndDBZQjNGZjhRdUlhKzR4?=
 =?utf-8?B?YThzOUpZS2tFTkRpb0ZXMElJRVNXK1k3VzZWMXdGcVYvM0h0T2lpODdjN0Jh?=
 =?utf-8?B?cHFZS0YveFd0d3I1UG9qMDF5VWpjL2ZvNGVPZnBqQU41N2FKcmZJSFBtN00y?=
 =?utf-8?B?QnlCUEZOK2JhNXNTVk5Vay9EZ2NkZ05YZGJmMFd1Y1p0OE8zU0tIdWNvVS9H?=
 =?utf-8?B?TnM5UU9DMkU5S29jeDdFemJpV3pIRldkdUNQNTVBK2R3Y1JqMEMwaHJka1o2?=
 =?utf-8?B?NGZ3MEk0Y2liU0xtQ1czaXhJY2dQQXBSSlM5cWpYZ2M2MDQ3L05FNytKUk9S?=
 =?utf-8?B?aXliOWpZdVdRaTJIOE1oSUQwM213S3BydEFFMFgvalJhcEN5UkpNakxOSDE3?=
 =?utf-8?B?TGxrdHVQcmxLKzRiWktmSnZ1YSt4c0JIbURrNkhYNFBOU2k1T1lXR3hTSnl2?=
 =?utf-8?B?U0htR29UUjR0eE1wVG1PQlU3Qm14SnhJOWV1ZG1zSjdWZkNyTjhxUXh2MXUz?=
 =?utf-8?B?d3dGYWQxTzBGMzcybHNac3lSNm5vcURpQzdYOGVlakczVURWcW55dnVqSGpQ?=
 =?utf-8?B?c3NWNHlXa2Vpc0tDbDg1VU5vTFZGeFpodGRaN2pydkIvS0N1RnBJS0dSY1ln?=
 =?utf-8?B?elJXUFZtd3FMbVRNNjhvdW9HUlAvYXFMOEVMbEdCSGgzNnI0K1g5Z3R2dmtj?=
 =?utf-8?B?bGdWVVNsMnJrQVpabFFLdm1xOEQzZnc4NUpQTklsL1ZjbXhGa2xpaFRrS2lx?=
 =?utf-8?B?M0lIYkNRRUhXeVNnMGUwcG5wa0lFU1hsMHZMTXQ1VlQremJUS3lhVm5RT2t4?=
 =?utf-8?B?NUpZTkJFWUEyaEtPbW1nSGZqSXR4cVFwNERRc0g5VXg3L1BBMWVvZGdGNndk?=
 =?utf-8?B?WkhoRVlKcEJvVnE3b3FXT3AvK09yaUEyUTdES1RIZWRtMis1eCtwV0J4Mi9G?=
 =?utf-8?B?cXhiY24wdUEvRmhPTzdrSmVHZFRnMCtUanpadFc1dWxlL29Qc2gyZkNYdW1v?=
 =?utf-8?B?M2JaMVpSY0pHSm1mWktla0xOc0VhMHN2R0ZLc2d4b0R4OGp4LytNbzBKNEhN?=
 =?utf-8?B?VWxWMy8zQUVLMVRCRTU3MUpmREFUT3VZQ2VxdHV6QXRSbGFTL1BVeXZ5a05u?=
 =?utf-8?B?RFVHV0JaWU92NjIycFltY2ViQjdUU2xjVzV4ZW9ic2lISS9aZFQ3V2s0SkFM?=
 =?utf-8?B?T0hBcW9ZV2l4VHdqV2FmWUZDZklabzBNRmdmMEZlTGtCdGJGM2d5cW9mNzNX?=
 =?utf-8?B?dmUvMFRVaGhLc1h1dmlLL3N2dVVhOXJnbWN4NW00Y2YxZmFWT0lYbjVXUDBt?=
 =?utf-8?B?aW9zbFRHRWpDeC9qQXAwcS9peHBBWUhEdWc4Z3hBV2ZYKzRaZW50bSt1ZGlB?=
 =?utf-8?B?ZnlhbGwycTZHOGo1alVFZkNlbXNYRTA2aU1EWWFhbUo0bGxQRmlNT2pGWkdz?=
 =?utf-8?B?eEU3Rno2d3NDZWtheVhHeUc2dTQ1NFg2bkgxVUZHMkp3a0t2MG9QbXdhaG9n?=
 =?utf-8?B?ME9HK04zd1ozTlg4dWJiclB0cXFLRE5WV2pwWitoV3ArSUthUzJ4K0NGREJq?=
 =?utf-8?B?NkVja0FFTUNhemwwOTJ5bXNsWVlYSDlZd25KVFZTajlORllkWmZ4SDVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEtOZWplSmdSNktoajRMd0F2cVY4NG5qUXRXYUtjRUpRNjNHR0FOZkVmVmls?=
 =?utf-8?B?VlEwenNyU0o5bkxLQi9mUVNKOW9FS1pUNVRUOGtWTDFuOEwyZktPNWtoeGxC?=
 =?utf-8?B?MkZ3c2xOZW5jcGVjTzJnU0g3L3lsWFpBNXhRVW9sbXhZYzRhWUsrcE4veWp2?=
 =?utf-8?B?S0ZRNlRUUHpBalVlQUhtVDFTSGV4dHBGMnhpd2o3V0hWZDJjY1N5RHlKWURz?=
 =?utf-8?B?QnFQbUNnS2JQOXMyTjlHM1FNakE4aGVvcXg2QlJxdkFoQU1nZWdRVUE0bEtU?=
 =?utf-8?B?OXROa09hdWhsaVlXMll6a2lxUTV0TjdTaGxSQ050b1c3QWhROFpBblN5TStK?=
 =?utf-8?B?N29xbDZ2Vllxd3NuVFNjL2JnTnhoYW5DVWZQK0VHdklPMkpEMDcrMEc2NmxF?=
 =?utf-8?B?RXdqNzc4dDVpVnBLU0VCZmVCOGZhVVRkZWt2bzg1TW5NNkRnaktUeE9oTU03?=
 =?utf-8?B?Rmh1bTFIYUpEaEhFTkRZaVhvakFhOXFDRnI3UWJXc1l2ajJTSXpMZ0dGOFMx?=
 =?utf-8?B?MzNKQXl1U1hMcXNGNittdDluUFFScFlzQ1BmMWhhS3M0ZDc5aGZxcFJxakVh?=
 =?utf-8?B?b2NJdm4rVjJKaVRQQnZjUGlBMU9xNUFiN2hFZkMyTjlpVml2TjhpMUNLNkNP?=
 =?utf-8?B?Yno5eEduRnVvWWxTZGtrTVZZQThZUk9hdTU2cjk1TUQzUXJremlVWWV0MVV3?=
 =?utf-8?B?akNDdmM0RVg5RUJ4dUlaV3FZeEJ5SVJBaFo0cEE2a3h2Yk4wdFI2VGdocnAx?=
 =?utf-8?B?UXlvWjcvNEZORjU0MndRSTdxYlRYVCthS09DaTJyVmNMS2lOZk5RNWhYdEtO?=
 =?utf-8?B?YzVoa2VXVFlIVHViamY2SU9jS0ZhRStZOCtjOVpCS3BNUGNBZVV0RkNWeUxD?=
 =?utf-8?B?TnBYcWhDV2l4WFB6NEszSWx2dXJPeG53TWRxWTd3czhjVmJGWUZEWVl0T2ZY?=
 =?utf-8?B?bno3WktQeHk5Z0RvN21QQjVCVUxPOHVEV3ZRaUFRd0dNQTU3WXp0OVBSelNt?=
 =?utf-8?B?TXpsLzEvSEVSaVM2UjlOTk83QTJlZEtGekRLM0MwR1RRZVZScGErYUlIdTNw?=
 =?utf-8?B?ZExlZVlaR3o0ZnYvYkxKMDBrQkRwQ3hWdktmV1F3VnpmZWVlSzN5ZDB6bzYr?=
 =?utf-8?B?RVVNdlFrUTdzOXJwLzBFeThaeGRxVi84UktjOTlzLzdZUnl4VURhemN1QnBp?=
 =?utf-8?B?WUJEMDZkM1RTbWcrV0tKNkZSeGhvTHI5KzhSRWF1UzNKWW9mUWZlVTFWQzc2?=
 =?utf-8?B?Y2tEdHllV0dadGpYdG92c2VMdmlNK1l1WFpoSWN1b2lKa3NoS0FwUlY3MGs3?=
 =?utf-8?B?R3JLVmxzbE0rQjN0NlVoL0oxRWNxa0RFMEJrdDdxWWJhbWdsRU5CRE5YU0N1?=
 =?utf-8?B?Q20xZWFEbWFVUi9ndFdOQzZRMTlIbGZVOVNrc09DejN0WDZrMDhwcjkxbVRa?=
 =?utf-8?B?djRRb3NNUmVvYnlBbSsxWEhQS2ptaVlpRmUvRVVxd3ZIbi9SZ3VyNzVXdWVS?=
 =?utf-8?B?ckRCYUhDKzdUVWd5UDVncVJPZjRINHdCT2o0R3VPcmNKOXkwai8rUUdxOUkr?=
 =?utf-8?B?NmhoSVNaRk1RNG4rYVJwa1dwS3BtVWRBQW1Xc3hCL0lENzFtUTJ4UVdsSEE5?=
 =?utf-8?B?b1p0T3R3TUtQRVFNb0pkRTQ1aDJYSFFocXFtdlJoajFhZ2JOK2pKM20wdkVL?=
 =?utf-8?B?c0hUSm94RzdsRENzRFJyVXdWRkgrVjFuS1IwdFlLaDgzeWp5RG9vQ01qTTRD?=
 =?utf-8?B?SWZEbEIvcDlGTWpFSklFazdqK0VDU0M3MEJZUkZESW9XTHZtSG5jMzlIcXF0?=
 =?utf-8?B?c1RFN1U3eDRjYVVUNlFsL1pQK2ZLUC81REdZNEF4aitDalA4a1BtSGZLZGp0?=
 =?utf-8?B?TDlRbTlGVWp3ZkxSWFpHZWdwSlpDL0ZwWXovNy9LOW5CZk0vSFg1MDVrYm84?=
 =?utf-8?B?OVl2Z3RjNXlYRHVGWjBWTXJrK1BkZGRqRDFwaklVSXg3ZGdFcEUvdURPSDVh?=
 =?utf-8?B?VlhtRkt6ZnY4NmZaWXZOYzNBRy84QmZnZVVnYmdqTEtwdlYyditwVDk5UFkw?=
 =?utf-8?B?UndPaCtSK2NlUjZjZ0x6VzRFdzJzQURVa2lqQTBGVkZXMTRRR1VGS3Fzd0VL?=
 =?utf-8?Q?nOLQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49A5F14578F7D345B3024562BC40F8C2@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27bcfaf-9cbd-4af1-89a8-08dc76597a35
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 10:09:45.4174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /PJoFsw0jMjWsbsMX8UWWQ+Bp913WiAFHnQXvoxQk0N3HFdrDO67z56SpkhlNKcmS5th1IP9io+zAT5ioipxMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8483

SGkgSnVlcmdlbjoNCg0KT24gMjAyNC81LzE3IDE4OjAzLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
PiBPbiAxNy4wNS4yNCAxMTo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNy4wNS4yMDI0
IDExOjI4LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4gT24gMjAyNC81LzE3IDE2OjIwLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMTcuMDUuMjAyNCAxMDowOCwgQ2hlbiwgSmlxaWFuIHdy
b3RlOg0KPj4+Pj4gT24gMjAyNC81LzE2IDIxOjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
PiBPbiAxNi4wNS4yMDI0IDExOjUyLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+Pj4gwqAgc3Ry
dWN0IHBoeXNkZXZfcGNpX2RldmljZSB7DQo+Pj4+Pj4+IMKgwqDCoMKgwqAgLyogSU4gKi8NCj4+
Pj4+Pj4gwqDCoMKgwqDCoCB1aW50MTZfdCBzZWc7DQo+Pj4+Pj4NCj4+Pj4+PiBJcyByZS11c2lu
ZyB0aGlzIHN0cnVjdCBmb3IgdGhpcyBuZXcgc3ViLW9wIHN1ZmZpY2llbnQ/IElPVyBhcmUgYWxs
DQo+Pj4+Pj4gcG9zc2libGUgcmVzZXRzIGVxdWFsLCBhbmQgaGVuY2UgaXQgZG9lc24ndCBuZWVk
IHNwZWNpZnlpbmcgd2hhdCBraW5kIG9mDQo+Pj4+Pj4gcmVzZXQgd2FzIGRvbmU/IEZvciBleGFt
cGxlLCBvdGhlciB0aGFuIEZMUiBtb3N0IHJlc2V0IHZhcmlhbnRzIHJlc2V0IGFsbA0KPj4+Pj4+
IGZ1bmN0aW9ucyBpbiBvbmUgZ28gYWl1aS4gSW1vIHRoYXQgd291bGQgYmV0dGVyIHJlcXVpcmUg
b25seSBhIHNpbmdsZQ0KPj4+Pj4+IGh5cGVyY2FsbCwganVzdCB0byBhdm9pZCBwb3NzaWJsZSBj
b25mdXNpb24uIEl0IGFsc28gcmVhZHMgYXMgaWYgRkxSIHdvdWxkDQo+Pj4+Pj4gbm90IHJlc2V0
IGFzIG1hbnkgcmVnaXN0ZXJzIGFzIG90aGVyIHJlc2V0IHZhcmlhbnRzIHdvdWxkLg0KPj4+Pj4g
SWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseSB0aGF0IHlvdSBtZWFuIGluIHRoaXMgaHlwZXJjYWxs
IGl0IG5lZWRzIHRvIHN1cHBvcnQgcmVzZXR0aW5nIGJvdGggb25lIGZ1bmN0aW9uIGFuZCBhbGwg
ZnVuY3Rpb25zIG9mIGEgc2xvdChkZXYpPw0KPj4+Pj4gQnV0IGl0IGNhbiBiZSBkb25lIGZvciBj
YWxsZXIgdG8gdXNlIGEgY3ljbGUgdG8gY2FsbCB0aGlzIHJlc2V0IGh5cGVyY2FsbCBmb3IgZWFj
aCBzbG90IGZ1bmN0aW9uLg0KPj4+Pg0KPj4+PiBJdCBjb3VsZCwgeWVzLCBidXQgc2luY2UgKGFp
dWkpIHRoZXJlIG5lZWRzIHRvIGJlIGFuIGluZGljYXRpb24gb2YgdGhlDQo+Pj4+IGtpbmQgb2Yg
cmVzZXQgYW55d2F5LCB3ZSBjYW4gYXMgd2VsbCBhdm9pZCByZWx5aW5nIG9uIHRoZSBjYWxsZXIg
ZG9pbmcNCj4+Pj4gc28gKGFuZCBhdCB0aGUgc2FtZSB0aW1lIHNpbXBsaWZ5IHdoYXQgdGhlIGNh
bGxlciBuZWVkcyB0byBkbykuDQo+Pj4gU2luY2UgdGhlIGNvcnJlc3BvbmRpbmcga2VybmVsIHBh
dGNoIGhhcyBiZWVuIG1lcmdlZCBpbnRvIGxpbnV4X25leHQgYnJhbmNoDQo+Pj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0Lmdp
dC9jb21taXQvP2g9bmV4dC0yMDI0MDUxNSZpZD1iMjcyNzIyNTExZDVlOGFlNTgwZjAxODMwNjg3
YjhhNmIyNzE3ZjAxLA0KPj4+IGlmIGl0J3Mgbm90IHZlcnkgbWFuZGF0b3J5IGFuZCBuZWNlc3Nh
cnksIGp1c3QgbGV0IHRoZSBjYWxsZXIgaGFuZGxlIGl0IHRlbXBvcmFyaWx5Lg0KPj4NCj4+IEFz
IGFsc28gbWVudGlvbmVkIGZvciB0aGUgb3RoZXIgcGF0Y2ggaGF2aW5nIGEgY29ycmVzcG9uZGlu
ZyBrZXJuZWwgb25lOg0KPj4gVGhlIGtlcm5lbCBwYXRjaCB3b3VsZCBpbW8gYmV0dGVyIG5vdCBi
ZSBtZXJnZWQgdW50aWwgdGhlIG5ldyBzdWItb3AgaXMNCj4+IGFjdHVhbGx5IGZpbmFsaXplZC4N
Cj4gDQo+IE9oLCBzb3JyeSB0byBoYXZlIG92ZXJsb29rZWQgdGhhdCB0aGUgaW50ZXJmY2FlIGNo
YW5nZSBpc24ndCB5ZXQgY29tbWl0dGVkIG9uDQo+IFhlbiBzaWRlLg0KPiANCj4gSSdsbCBkcm9w
IHRoZSBwYXRjaCBmcm9tIG15IGxpbnV4LW5leHQgYnJhbmNoLg0KVGhhbmtzLiBJIHdpbGwgbW9k
aWZ5IG15IGNvZGUgYWNjb3JkaW5nIHRvIEphbidzIHJlcXVpcmVtZW50cyBhbmQgc2VuZCBhIG5l
dyB2ZXJzaW9uIHNvb24uDQoNCj4gDQo+IA0KPiBKdWVyZ2VuDQo+IA0KDQotLSANCkJlc3QgcmVn
YXJkcywNCkppcWlhbiBDaGVuLg0K


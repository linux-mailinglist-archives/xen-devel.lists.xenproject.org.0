Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5FEA3B43E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 09:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892456.1301427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfZD-00072G-AH; Wed, 19 Feb 2025 08:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892456.1301427; Wed, 19 Feb 2025 08:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfZD-0006zN-7J; Wed, 19 Feb 2025 08:36:27 +0000
Received: by outflank-mailman (input) for mailman id 892456;
 Wed, 19 Feb 2025 08:36:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ODj2=VK=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tkfZB-0006zE-24
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 08:36:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2413::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95e2bc46-ee9c-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 09:36:18 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB8003.namprd12.prod.outlook.com (2603:10b6:806:32a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 08:36:14 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 08:36:14 +0000
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
X-Inumbo-ID: 95e2bc46-ee9c-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqUGFYF+VCvmhiETahrfSCGVlQjyhYIWkNbxNcrkZ/C7JZ1a/L+xPf823c1AMW5W5boQHOvyhcD2OAesRkR2RWdkFjXrjuXINLjrYmPtU83eDZsBy6HQQpc8NVh08QD8vE+zBQzEVRdf68vxaMPAxNteajMG0/XIxXS73ALqSgTgZ6Q6MP1Fb9mBfsKScfSTagcIdSd9zKBqIQeAyq4wrxNAwdl3EJQTRy8W67f89qTIYE9pf+Fz6AlMPlan75/DXU8WTk9+bXGX8zp/93gm9oiQfc3zdTYPBhYOBLxNvu2fz5Kjj0vSa56vdHebQKkjfHtlYHo//bTyEIpVNodJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB/TA3OeBD8KhXeJNBobDTci58Uvfg/YEaXX3/Bg/UQ=;
 b=XzFeFFJrS8y4T4wq5KfcI1oEQZkhp6SMvSfKcQp096kjUPLi7Ri9kvrCcatqfBDkYHoLirK4L+FXC7V9ZPyYWdxGsnPkqSAtdPsj2VqJK9S9ungnC+szzUzIbrAclXkQhzx+nbI3My8F8GIBPm5RJf9VOPbedBzWl5C0cK8w0v67gWHqYRV96GX7SmI6E0y4ubuOALefj9cQFAnL21QWHIwlr7jq8i+YoV4vip16y78gfBGKXMYhBg96Ku8+GjdeRoDFcWGJD1X450lZWkdpwr9TQcG77BhCYigjIlInXwWkzvR61XmCsoyuwYSsBi7Uq0qV/nc8Bcljyk07+4JPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB/TA3OeBD8KhXeJNBobDTci58Uvfg/YEaXX3/Bg/UQ=;
 b=JdTsNQUvoob3jxkgVKHi7JThV4Rcz9oCXCRUCpUaTl27sT28RJ6mjsz183+T08APmd9UdGqGVUS7vJRlkZdOQfndLgtqDjtX1ONMYiIjOjTb4uAHroMWm/ZezlsBSGjKoiH/VXV6xuPUeGCN6jYudIC+M4BtjekkPgQjPH9FfpE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 02/11] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v2 02/11] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index:
 AQHbeHHLxWVIgPijWEedM19MLd/Q4rNB+imAgAj8gkCAADZUAIABdSLggACVbwCAASX4EA==
Date: Wed, 19 Feb 2025 08:36:14 +0000
Message-ID:
 <DM4PR12MB8451F9B2CDFB20783A3B78E7E1C52@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-3-Penny.Zheng@amd.com>
 <d3198e8c-2723-484c-b305-822a681d544b@suse.com>
 <DM4PR12MB8451A5DC8E389ECA2D8A3E1AE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <7a0d4cab-188d-41de-ac32-b307109cb0dc@suse.com>
 <DM4PR12MB8451E14BD7539A3A2C565C0DE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <8a5071fc-7948-43aa-82e1-9dde9b0fcc24@suse.com>
In-Reply-To: <8a5071fc-7948-43aa-82e1-9dde9b0fcc24@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=2ec6ee6b-a274-4804-be78-a86a8a9aeffc;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-19T08:21:01Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB8003:EE_
x-ms-office365-filtering-correlation-id: 5787ab8a-4f59-41e7-1817-08dd50c07874
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eEp4WlRXaTBVbHhBVk5jTzZiMlMvQ2ZnakNzVlJiUWNPOHdVUE9kMlk0cWd6?=
 =?utf-8?B?a3JEbU10c1lDY2t0a0tGSmVFeUZwRFdzak45ZW5Ub29wZ3pIelExNHVaUFR1?=
 =?utf-8?B?Wi8vYTFFYlh3V2ExYVczeDkrNkd5M0ZCUi94VWZOazQvalQyUlBGdTQvRGtB?=
 =?utf-8?B?VlM2OEZENlNlY05wVzl5NWpnZksyVW5IN2ZPOXQva3lMbWZkUkExc3h1SXY3?=
 =?utf-8?B?cFpPYU4zUklrZ2V5UFBQdE1idlRkUURDdEtHWWZxQk1pckUvUWtONi9BOE5L?=
 =?utf-8?B?bHEvd2ZCRklKVUY1NDNaemphUkQrM2NQZ0hhWWZ2bHJQcXpNY05IVnZCZlJw?=
 =?utf-8?B?d2NSV1ZWRys5YzFCeXozVkQ2V2VGa1BvMis4T1hQZDNscmEyeGs2QkpueXZH?=
 =?utf-8?B?V05OalEvQnhRdm0xSjhuK0wxNndrT3BMN2lwaE1vbDBVZ08wR2NTU1A4ZUI2?=
 =?utf-8?B?YzhIcjl6VEMyRmZtUFVLVTVUS0FBN0xJK1pMR3F4L0hiZHp1bXNsTHhlUVBP?=
 =?utf-8?B?eUQzU2JhK1ZURGtacHQzS1VTaVRSTGRzK3BCT3ZYdEkrYnYyUEdVekVRQ2tM?=
 =?utf-8?B?eGE2Z09La2U5MnZ6bFZaNlZBOG5Bakd6V2RINFNoTCtCR2F5c0RUa3R1VUFD?=
 =?utf-8?B?aHhmUTVmTTFYUzJkU1hzZEoreEMyZTRiaTlGMmdiaDJINUdIandReGZwN0lR?=
 =?utf-8?B?aGZreGc4YXBqZHg3aEJoYUwzYzRVekxXeFpYbkRZdmVtd2JoenJkazlzWWhh?=
 =?utf-8?B?Zm1pRmIvSTRSWjcxdVNvTGlMY0hNZnA3aFFTRHVBS2pYc3ZqZmpoTHpyK0tv?=
 =?utf-8?B?ZUhvNm53WFpWYlp4VkVJUUVKZFJXR3dhb3cyVHhoQzREeEptWnVTSC9qWkpR?=
 =?utf-8?B?d3I2SEhIazlHTlhyVm94S2oyempBSnBiL1oxK3pGajhUS0c1Q2JYbERrZXA3?=
 =?utf-8?B?RHpyT3lvU1JOLzg1dGM3YWM3eWx3M1NtR0Fkc3RUeVU3VXRqM3pqWEFJN1Y0?=
 =?utf-8?B?NHlCNWRzNk1OQVJsdDMrY0p3MUdTL01nZGxFTGJCOU12dWNLbUxKQ2MyZ3ov?=
 =?utf-8?B?M2h3VFpmRHNwOGhiYmxwb2tpTFdXQmNJWHh1Qko5ekV1RHJDQjQvVWtYbjl3?=
 =?utf-8?B?NDcyZVpUWUxMVDZKL1JhU0hqNGxUYUVNT05pbVU1Tkl3YkFxRGhMRnQvYXpi?=
 =?utf-8?B?UTZiUXQyd082dElNbWN6UVRZbW5rcjZyUmZvVHlpcXlydmhBejg3Qi83R1lC?=
 =?utf-8?B?YTFXTjlUTnRDcUpKTGZoZmZWVFUvRXprbjZNUTRaZVdoeit4WEM3aE1MVTdP?=
 =?utf-8?B?UEY2U0dKME9vNTYyVVo1TzNTSHI2WHJQRXAzTDBjZzM4Vk1BeXE5NlBJYjdG?=
 =?utf-8?B?WURRMkNyN2ZwZkQ4TlFEcEFKRHk3eWFOc2lyRkVoN1BoTHo0NHo4U1JzakEw?=
 =?utf-8?B?bGJUdU1ONGNxMUp4ZlRSTElRc09EOFRZOStoUmVpM0I3T1ZsYXl2SzJhSjBL?=
 =?utf-8?B?ck02VGdiYTlHYXE3bTNxRVZ6NzdCcW5JYjc2UDYyaHdPN0NlYk5qOXRmNFJp?=
 =?utf-8?B?bzU0MVlvL0ZFZTFWN0tFMHVweUdETit1Q3huTDdTWDUyRXNJd1NlaEJSK25y?=
 =?utf-8?B?MnQ1MW9RS3B6WWRkNHhxem5QelZ0WDZER210ZEVweVhremNRZXBSMnlZUlRJ?=
 =?utf-8?B?Y3pxT1hkSHJ3NjdWU1pCRk95MjVqdXB3ZFFzVmpKbGx0N3Bha3gyL0pGbVA5?=
 =?utf-8?B?ZmtxNE9URG5tS2lHQlZwN1NMK21nSCs5S1lqb25acTRnQTZZUitsYWd2eXBH?=
 =?utf-8?B?eS9qblNybC9sMHNGRVZrdWR1aFR5ZzRXT25vWXI4MjhmclBzRFFsbTVsb1JF?=
 =?utf-8?B?MGhzaUppU2VZUDhGOW1GVU5OcVIzaDREa3A1dVJORlFaeWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejJ0U1JEMkcyaE5uVkpCWFduUEdJSDYvQTN6Si8xWlJPZmRyRFVhbWVxODZy?=
 =?utf-8?B?VEpsOStHMTRhdGFDVWhGdlBzSVEzajdscjNqZTBjbFBncmhUdDl4QlVvR3Qy?=
 =?utf-8?B?dzBDUXQydU1XMkZVRUxhdGM0MDlzSTJ1OENFRDlwdzNTY0pJN01Pc3JXZWtK?=
 =?utf-8?B?RDJDcnNIT3VYNjkwUWhqSVUzNnBmcjVRQUhVR0t4N3NTY2xnc29MbFJGZXpI?=
 =?utf-8?B?Y01BV1hhY2lYVWhlWjdOMkxGTHBrMkRLU3dSMlkxdFQ2MkVSMnU5SEV2MW9Y?=
 =?utf-8?B?R3Vob2pZZGJGbkxvcnRVSFZHMSs5WWo5NEFjMDVvOEJId0pEdHBvdEM2a3J0?=
 =?utf-8?B?eEFaS21yS2hldDNhUWlNaXp2RVNFSWZWOU41QVB0dVM3TldhVXgyRzRXS3Nk?=
 =?utf-8?B?UmQxbGhRaWc0QVRkRnB1L2o1dnlURUZOTVZNTFVHVXZzMHlHcnhLMzdwclk1?=
 =?utf-8?B?NDNBZUFCY2xRbXBwM3FobEpKSHczTUlIbTFXbnFZYzNaTS9BNDEzUHBoYVBC?=
 =?utf-8?B?ZElHMWdYY0hzOE5MMGJGalJPVjlzdFc0YmFxQTB2SVh4VmhOVnFDL3paaWVP?=
 =?utf-8?B?N29WZUY4R1pRa1RMMDVuNkcxNitWOGpNaGJid0FtN0RRRGNHSTcwS2dJNTVD?=
 =?utf-8?B?UGNZQ2ZHVHBGVmFONTRkZ1lNUGxiRlhmVDF0S3M0cGNKdXllOHZ5TkNKaENj?=
 =?utf-8?B?T3hVV3EvTGJ6ZTRYWmtvc2N0RTlhc3l0NmRKQS9UUWV3SVVGbmZ2UEd6TGdt?=
 =?utf-8?B?K2xFWmdRemtyY2pKUFVjWi9FN2tNUFJvVG1ZdVY2OXV3Y2RKdmozRlYrUHF4?=
 =?utf-8?B?Z1pXV3A5TW1Mc3pTSkFxMFdoQlBsQncya0xva0lkNzZvaUxxYnQ5WEZmYUtT?=
 =?utf-8?B?WkJXa09MRVNzNnZpN2xNUnRwQnAvMWxQQTNBcjVBUU5ERTZiQ3p4bWpEN0ZI?=
 =?utf-8?B?bTFBckxOUGZrRENtQ0dFUkhxSFhDNFVRdDJEUXhTUHRRVUpqWWx2VFVzd2sz?=
 =?utf-8?B?OWhkQVcrTkkxbWt1NmhIbkk0SWJOd1RQVGNON1pqNlo2VGFrMHJuSUdqQm9X?=
 =?utf-8?B?cEVabURzNHdJZisxU1lCd3FHMW5MSTdISTlSbHM1Q2dpQlFPT3UzQUhwYzMx?=
 =?utf-8?B?RHdtRFYvOGFqNFhITjdjQXRBSWYwK2hmaDJlRDlzZ2lSVTN0M3pXdHBvVFZ4?=
 =?utf-8?B?WkdkR2pOSVc2WDBvOXloeEFiYlNuWlpzYXZQKzEvWUFBNUtGaDJzWTBrTDZR?=
 =?utf-8?B?MndTYU1rQkZBQVQ4S3pJOUw2TVRsR0tYTTNTdmNkL2d5ZC96M01ZU2hGYlo3?=
 =?utf-8?B?Q2IwUFRWWWZoVm1lVGdCZHAvbDJqaWx4cGwyVWdTbktZaU1CRks1MFZHRnNp?=
 =?utf-8?B?Sm5GY2dGTlhzZXB6bXJReGo4Ykw0RzFVWTlsZUg5OTNqeHc1a0VLa1dqeGZh?=
 =?utf-8?B?Skl1T1dIMytHbnVmWDBsdEt2bUYwOGZGUFkxSkZHYmI5bko4TlZRRUFUbDUy?=
 =?utf-8?B?ckVrZkJKUWNXSFVHMVVPMFA0LzBmK0NJZjdGWWZid0g0MHBwSVRqeStRdnZQ?=
 =?utf-8?B?eTZyb0lXaEh1UjRoTkVyRG45M0M3dXRwcHk4WmlBQU83TWVNNHV4Sk5jWTBs?=
 =?utf-8?B?QlZUd0pQZWM2bjdHajVsKytKRnpudEx2NDdVWk00L3I0TXh0UGN2TXFJdThw?=
 =?utf-8?B?YUs3VDBleEdxS2thdUFPZ2xvZ29raUQ4Qjc3RGlCNVZGQVZTWHhkSVFTaWY5?=
 =?utf-8?B?NmVQeUtCbDl0TmdEK0d4VzNVRFVFeFhBajdBRVF5R01yM0xwaklXdW1iMUlh?=
 =?utf-8?B?Skx5K3FidjY2ZDQzaUZRcDdPb3E2U2RReWdySmNhdERocWRZZnZwcHYydm93?=
 =?utf-8?B?UXhRNGc3aEhLS3B1TXE2MEpZb0V1bDZRRXZmU2lUdTE5T3RYMFUyUjVwNDBq?=
 =?utf-8?B?UFF6ZHpOOVRXREZBcDR5SitSYkJUSXZiRFdnOFNmMFcvNkNHZk1wR3BtWDZK?=
 =?utf-8?B?VGNjdStZSDU2akR6SkhoQ3Ztb0Y5Lyt5MkhLcVdyYktDQjlNQ2JkNVV3ZVM3?=
 =?utf-8?B?S2preDZFOEdWellQN0RBczY2NllpVGo5TlVhNUhHdVk3SzAySVNEZm55dTRZ?=
 =?utf-8?Q?FD3A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5787ab8a-4f59-41e7-1817-08dd50c07874
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 08:36:14.1143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+GRebjmv/v4vswYW4r1IntQkUC14FZT0A6c+wi9cQhOFJK856VLinbg+znvJRcPBVeZVrx5A8r0D9exOaC4Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8003

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxOCwgMjAy
NSAxMDo0OSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyeXVrLCBKYXNvbg0KPiA8SmFz
b24uQW5kcnl1a0BhbWQuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW50aG9u
eSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnplbCwgTWljaGFsIDxN
aWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbg0KPiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tDQo+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDIvMTFdIHhl
bi94ODY6IGludHJvZHVjZSBuZXcgc3ViLWh5cGVyY2FsbCB0byBwcm9wYWdhdGUNCj4gQ1BQQyBk
YXRhDQo+DQo+IE9uIDE4LjAyLjIwMjUgMDc6MDUsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDE3LCAyMDI1IDM6Mzkg
UE0NCj4gPj4NCj4gPj4gT24gMTcuMDIuMjAyNSAwODoyMCwgUGVubnksIFpoZW5nIHdyb3RlOg0K
PiA+Pj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24g
T25seV0NCj4gPj4NCj4gPj4gQnR3LCBib2lsZXIgcGxhdGVzIGxpa2UgdGhpcyBhcmVuJ3QgcmVh
bGx5IGxpa2VkIG9uIHB1YmxpYyBtYWlsaW5nDQo+ID4+IGxpc3RzLCBmb3IgYmVpbmcgY29udHJh
cnkgdG8gdGhlIHB1cnBvc2Ugb2Ygc3VjaCBsaXN0cy4NCj4NCj4gWW91IGRpZCByZWFkIHRoaXMs
IGRpZG4ndCB5b3U/IEkgYXNrIGJlY2F1c2UgdGhlIHNhbWUgYm9pbGVycGxhdGUga2VlcHMgYXBw
ZWFyaW5nIGluDQo+IHlvdXIgbWFpbHMuDQo+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+
Pj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMTEsIDIwMjUgNzoxMCBQTQ0KPiA+Pj4+DQo+ID4+
Pj4gT24gMDYuMDIuMjAyNSAwOTozMiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+Pj4+ICt7DQo+
ID4+Pj4+ICsgICAgaW50IHJldCA9IDAsIGNwdWlkOw0KPiA+Pj4+PiArICAgIHN0cnVjdCBwcm9j
ZXNzb3JfcG1pbmZvICpwbV9pbmZvOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgY3B1aWQgPSBn
ZXRfY3B1X2lkKGFjcGlfaWQpOw0KPiA+Pj4+PiArICAgIGlmICggY3B1aWQgPCAwIHx8ICFjcHBj
X2RhdGEgKQ0KPiA+Pj4+PiArICAgIHsNCj4gPj4+Pj4gKyAgICAgICAgcmV0ID0gLUVJTlZBTDsN
Cj4gPj4+Pj4gKyAgICAgICAgZ290byBvdXQ7DQo+ID4+Pj4+ICsgICAgfQ0KPiA+Pj4+PiArICAg
IGlmICggY3B1ZnJlcV92ZXJib3NlICkNCj4gPj4+Pj4gKyAgICAgICAgcHJpbnRrKCJTZXQgQ1BV
IGFjcGlfaWQoJWQpIGNwdWlkKCVkKSBDUFBDIFN0YXRlIGluZm86XG4iLA0KPiA+Pj4+PiArICAg
ICAgICAgICAgICAgYWNwaV9pZCwgY3B1aWQpOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgcG1f
aW5mbyA9IHByb2Nlc3Nvcl9wbWluZm9bY3B1aWRdOw0KPiA+Pj4+PiArICAgIGlmICggIXBtX2lu
Zm8gKQ0KPiA+Pj4+PiArICAgIHsNCj4gPj4+Pj4gKyAgICAgICAgcG1faW5mbyA9IHh2emFsbG9j
KHN0cnVjdCBwcm9jZXNzb3JfcG1pbmZvKTsNCj4gPj4+Pj4gKyAgICAgICAgaWYgKCAhcG1faW5m
byApDQo+ID4+Pj4+ICsgICAgICAgIHsNCj4gPj4+Pj4gKyAgICAgICAgICAgIHJldCA9IC1FTk9N
RU07DQo+ID4+Pj4+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4gPj4+Pj4gKyAgICAgICAgfQ0K
PiA+Pj4+PiArICAgICAgICBwcm9jZXNzb3JfcG1pbmZvW2NwdWlkXSA9IHBtX2luZm87DQo+ID4+
Pj4+ICsgICAgfQ0KPiA+Pj4+PiArICAgIHBtX2luZm8tPmFjcGlfaWQgPSBhY3BpX2lkOw0KPiA+
Pj4+PiArICAgIHBtX2luZm8tPmlkID0gY3B1aWQ7DQo+ID4+Pj4+ICsgICAgcG1faW5mby0+Y3Bw
Y19kYXRhID0gKmNwcGNfZGF0YTsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArICAgIGlmICggY3B1ZnJl
cV92ZXJib3NlICkNCj4gPj4+Pj4gKyAgICAgICAgcHJpbnRfQ1BQQygmcG1faW5mby0+Y3BwY19k
YXRhKTsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArIG91dDoNCj4gPj4+Pj4gKyAgICByZXR1cm4gcmV0
Ow0KPiA+Pj4+PiArfQ0KPiA+Pj4+DQo+ID4+Pj4gV2hhdCdzIHRoZSBpbnRlcmFjdGlvbiBiZXR3
ZWVuIHRoZSBkYXRhIHNldCBieSBzZXRfcHhfcG1pbmZvKCkgYW5kDQo+ID4+Pj4gdGhlIGRhdGEg
c2V0IGhlcmU/IEluIHBhcnRpY3VsYXIsIHdoYXQncyBnb2luZyB0byBoYXBwZW4gaWYgYm90aA0K
PiA+Pj4+IGZ1bmN0aW9ucyBjb21lIGludG8gcGxheSBmb3IgdGhlIHNhbWUgQ1BVPyBTaG91bGRu
J3QgdGhlcmUgYmUgc29tZQ0KPiA+Pj4+IHNhbml0eQ0KPiA+PiBjaGVja3M/DQo+ID4+Pg0KPiA+
Pj4gWWVzLCBJJ3ZlIGNvbnNpZGVyZWQgdGhpcyBhbmQgY2hlY2tlZCBBQ1BJIHNwZWMuIEknbGwg
cmVmZXIgdGhlbSBoZXJlOg0KPiA+Pj4gYGBgDQo+ID4+PiBJZiB0aGUgcGxhdGZvcm0gc3VwcG9y
dHMgQ1BQQywgdGhlIF9DUEMgb2JqZWN0IG11c3QgZXhpc3QgdW5kZXIgYWxsDQo+ID4+PiBwcm9j
ZXNzb3INCj4gPj4gb2JqZWN0cy4NCj4gPj4+IFRoYXQgaXMsIE9TUE0gaXMgbm90IGV4cGVjdGVk
IHRvIHN1cHBvcnQgbWl4ZWQgbW9kZSAoQ1BQQyAmIGxlZ2FjeQ0KPiA+Pj4gUFNTLA0KPiA+PiBf
UENULCBfUFBDKSBvcGVyYXRpb24uDQo+ID4+PiBgYGANCj4gPj4+IFNlZQ0KPiA+Pj4gaHR0cHM6
Ly91ZWZpLm9yZy9zcGVjcy9BQ1BJLzYuNS8wOF9Qcm9jZXNzb3JfQ29uZmlndXJhdGlvbl9hbmRf
Q29udHINCj4gPj4+IG9sDQo+ID4+PiAuaHRtbD9oaWdobGlnaHQ9Y3BwYyNwb3dlci1wZXJmb3Jt
YW5jZS1hbmQtdGhyb3R0bGluZy1zdGF0ZS1kZXBlbmRlbg0KPiA+Pj4gY2kgZXMgU28gQ1BVcyBj
b3VsZCBoYXZlIGJvdGggX0NQQyBhbmQgbGVnYWN5IFAtc3RhdGUgaW5mbyBpbiBBQ1BJDQo+ID4+
PiBmb3IgZWFjaCBlbnRyeSwgdGhleSBqdXN0IGNhbid0IGhhdmUgbWl4ZWQtbW9kZSBNYXliZSB3
ZSBzaGFsbCBhZGQNCj4gPj4+IHNhbml0eSBjaGVjayB0byBzZWUgaWYgX0NQQyBleGlzdHMsIGl0
IHNoYWxsIGV4aXN0IGZvciBhbGwgcGNwdXM/DQo+ID4+DQo+ID4+IE1heWJlLCBidXQgdGhhdCB3
YXNuJ3QgdGhlIHBvaW50IG9mIG15IHJlbWFyay4NCj4gPj4NCj4gPj4gUHJvcGVybHkgYmVoYXZp
bmcgRG9tMCBzaG91bGQgcHJvYmFibHkgYmUgcGFzc2luZyBvbmx5IG9uZSBvZiB0aGUgdHdvDQo+
ID4+IHBvc3NpYmxlIHBpZWNlcyBvZiBpbmZvcm1hdGlvbi4gWWV0IG1heWJlIHdlJ2QgYmV0dGVy
IHNhbml0eSBjaGVjayBfdGhhdF8/DQo+ID4+IChJIGRvbid0IHJlY2FsbCBzZWVpbmcgTGludXgg
a2VybmVsIHNpZGUgcGF0Y2hlcyB5ZXQ7IGlmIHRoZXkgd2VyZQ0KPiA+PiBwb3N0ZWQgc29tZXdo
ZXJlLCB0aGV5IG1heSBhdCBsZWFzdCBwYXJ0bHkgYWRkcmVzcyBteSBjb25jZXJuLikNCj4gPj4N
Cj4gPg0KPiA+IEluIG15IGxpbnV4IHBhdGNoLA0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAyNDEyMDQwODI0MzAuNDY5MDkyLTEtUGVubnkuWmhlbmdAYW1kLmMNCj4gPiBvbS9U
LyBJIG9ubHkgZGlkIHplcm8tdmFsdWUgY2hlY2sgaW4geGVuX3Byb2Nlc3Nvcl9nZXRfcGVyZl9j
YXBzKCksIERvDQo+ID4geW91IHRoaW5rIGluIHRoYXQgcGxhY2UsIEkgc2hhbGwgYWRkIG1vcmUg
c3RyaWN0IHNhbml0eSBjaGVjaywgbGlrZQ0KPiA+IHRoZSByZWdpc3RlciB2YWx1ZSBzaGFsbCBu
b3QgYmUgemVybyBhbmQgYWxzbyBtdXN0IHNtYWxsZXIgdGhhbiBVSU5UOF9UPw0KPiA+IE9yIHdl
IGp1c3QgZG8gdGhlIGFib3ZlIGNoZWNrIGluIFhlbiBwYXJ0IHdoZW4gcmVjZWl2aW5nIHRoZSBk
YXRhPw0KPg0KPiBWYWx1ZSByYW5nZSBjaGVja2luZyBpcyBuaWNlIHRvIGhhdmUgaW4gRG9tMCwg
YnV0IHRoZSBzYW1lIGNoZWNraW5nIG5lZWRzIGRvaW5nDQo+IGluIHRoZSBoeXBlcnZpc29yIGFu
eXdheS4gQnV0IHRoYXQgaXNuJ3Qgd2hhdCBteSBjb21tZW50IHdhcyBhYm91dC4gV2hhdCBJJ20N
Cj4gYXNraW5nIGlzIGhvdyBpdCBpcyBiZWluZyBtYWRlIHN1cmUgdGhhdCB3ZSB3b24ndCBoYXZl
IHRvIGRlYWwgd2l0aCBhIG1peCBvZg0KPiB0cmFkaXRpb25hbCBhbmQgQ1BQQyBkYXRhIGluIHRo
ZSBoeXBlcnZpc29yLg0KPg0KDQpBcmUgeW91IHN1Z2dlc3RpbmcgdGhhdCB3ZSBvbmx5IGRvIGVp
dGhlciBzZXRfY3BwY19wbWluZm8gb3Igc2V0X3B4X3BtaW5mbz8NCk9ubHkgb25lIHNpZGUgZGF0
YSBnZXQgc2V0IHRvIGF2b2lkIHRoZSBjb25zZXF1ZW5jZSBvZiBtaXh0dXJlLg0KDQo+IEphbg0K


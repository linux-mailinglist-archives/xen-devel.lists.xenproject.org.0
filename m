Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505FB11893
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057315.1425234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufC0O-0003HR-12; Fri, 25 Jul 2025 06:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057315.1425234; Fri, 25 Jul 2025 06:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufC0N-0003FL-UA; Fri, 25 Jul 2025 06:34:07 +0000
Received: by outflank-mailman (input) for mailman id 1057315;
 Fri, 25 Jul 2025 06:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuhP=2G=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ufC0M-0003FF-R0
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:34:06 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2413::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a1de564-6921-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:34:01 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB7226.namprd12.prod.outlook.com (2603:10b6:806:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 06:33:45 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 06:33:45 +0000
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
X-Inumbo-ID: 5a1de564-6921-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wzu7fNriTcBosARwUfMMPcvhXOrayn6M1FvZyv9M4MKLBO/vHUC6W1T/g96f0sGbqjgdd9ORfY+t/k3IwP1nn8tmGNdW3gZ0koWlxLVpFvEaX4IjrtjrqVxCqLA3d1hcZ9dwOhQLWVdrGLcU3V7BN0RZTIuK9qEfeV+GG2ukoxXCRvMqk44Bu9iJpW65KzV6rxuwZu/4uap/kJyVI8LjS1nh62z6iKoPLa7qQRxNuTufRN0WNPEyabz5z9VdDlMKT2HiFMjro6CRG5ZNHFGjLhM9zQ7JupI7CilSvnZypI6+JrI+zwp5/nGQ4R19Xd5CYG7J6Er5U8d1J7May5H96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Df2w9G4SsB1sSdX/TG3RVrtEfLDcY7cbyy5X7WlzD3c=;
 b=DqVUCdTFYJyPQ3XgmUXgKIfST6QRT6jZ/s1bd1YWZBdaKu37eBZsstW9YmAFTOLdF5/wHoOh3mN4mnYdwM5Wmw7xapyPrJwi84UAe8bchKY/t5c53LRITfVA7kINdmXU9W2GK7H1SWng8/7R0baVKhYjWUpfaf/+Z69DiWhk6HF1sWFjq2OFyR67gFuio+k1C2658MMgjVyCAkC3WT7JsAhRwqWl1Ow8s2pncoOfMCJJZoQZnYk9twR9i4vGEdcUq7llBCACm3Z6SpjaKny2w5E4xHZ7Bh+OlgrxIJ0yW+bgSROIVvx3wVfgnACazI3idMBcAUVDNWnS/DpDXHcDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Df2w9G4SsB1sSdX/TG3RVrtEfLDcY7cbyy5X7WlzD3c=;
 b=nhSIQ8bslbpYLXy4EHQvs107+vliv554VG8dCkmShsQRNajayyI87VWunHqUmJw8RT4EawADv1I2ouB2fl9+F9VghLTJF4+I5++f7AVp2f61mVx0EDr9Jg8x6Jy+Cu6YAA1/71wBBUae8+yvlx1LkHcmlBARBz3VFofZmaCcYxc=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1] xen: move getdomaininfo() to domain.c
Thread-Topic: [PATCH v1] xen: move getdomaininfo() to domain.c
Thread-Index:
 AQHb+sYi9F4sF9Jjy0ur9mCegpzXYLQ9u1eAgAEle4CAAFcTAIAA88oAgAC42YCAASrIAIAAR76AgAANF1A=
Date: Fri, 25 Jul 2025 06:33:45 +0000
Message-ID:
 <DM4PR12MB84513AD978001364B686DD3EE159A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250722050410.853783-1-Penny.Zheng@amd.com>
 <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
 <alpine.DEB.2.22.394.2507221738090.7043@ubuntu-linux-20-04-desktop>
 <f75df6d6-ede6-41a6-9412-1a9b073902b5@suse.com>
 <alpine.DEB.2.22.394.2507231327280.7043@ubuntu-linux-20-04-desktop>
 <89b615e1-3ed4-4cc9-9222-4149b5a27e2e@suse.com>
 <alpine.DEB.2.22.394.2507241820560.2549622@ubuntu-linux-20-04-desktop>
 <2800af03-8844-4e9d-a56b-121f52f60cc7@suse.com>
In-Reply-To: <2800af03-8844-4e9d-a56b-121f52f60cc7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-25T06:33:39.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB7226:EE_
x-ms-office365-filtering-correlation-id: b6508230-a74d-45fc-c39a-08ddcb4534ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dkdLZSt3NFRCSnNSeW1iakFOdlpuVm94RGtVcExtVGllUU5PVzhmMVFtTG9a?=
 =?utf-8?B?Wmo1MmdCUnI5aExHOEFZNitGeGh0R2VCWXlRWWVPSHNvZWhPN1VHbWh0RFEv?=
 =?utf-8?B?bDRIdjlnOTVrNHJ5aHdtMVRuQ1o5MUM0M0FjWThnbXlMODhuMDJxN3N6Nkdz?=
 =?utf-8?B?dGJWLytZajNRMFV4VkpPWVI0OGFZYWt6R1Rpb3Ywd1AzOWdvWDFwVWxUTmFN?=
 =?utf-8?B?d3F4djJFZC9ZamhwY29YVW1oTnFESjJOZmxwUkdmb1ZXSFNTMVJMcngzWWxx?=
 =?utf-8?B?NkNCVERPMjZEaHVhS2xJblJHWHMyUjRCRkd1L1N0Q2dFd3Bqa3ZCamJoRDgv?=
 =?utf-8?B?K3ZyeTloTk84dTRFaE9ub3BBRCtsUjlwZjJzYS9ZanB1VWQ4MjFPN1FVdVRw?=
 =?utf-8?B?anFLRnBIK2lRTWswOFdWeE9lWFg3QlVCWUJENjRpSVo2NDRnREV5MG8rdDky?=
 =?utf-8?B?ajFEb1lWbGllQXRPUC9lUjNxV0YxQVVxeElKN1pVOTM3Wmt0L1ByTExrRXRm?=
 =?utf-8?B?Y1hWbnpxdnQrMFcvOHY2blY4T3o5S2t1UXdkU2pLdVNnK1cvMVhZUmRCOXRq?=
 =?utf-8?B?VU1maEUrWUFOVXMyZ3JpVTdwZ2RYY0ErdGR4WWRTYTYxc3dmOTBFNlc1aE1T?=
 =?utf-8?B?Z05uYWhqSHN1MWZBV00rdWF1WHNQWTdDRmtGdnpwcEUxbVlRWTFuc0IyR1B3?=
 =?utf-8?B?Z2YxUDVmQmdvdzdrQ2JONFNDMkdXZ3c1cUo0MTB4cm5sKzlxdWRPRXVFcFVH?=
 =?utf-8?B?SThNZ1RmdmsvMVBZWlpycjFYQXd5Y2FJQStBdDRZa09BaWx0bXMzdzl1T2hu?=
 =?utf-8?B?ZzVSTnZPQ0Mra3B2SWluUTBmZDc3MXZHbStDZUpaUkc2M0lHUmxlT2JyRFo1?=
 =?utf-8?B?R2g0MlhVaFFNU0wvdUdHWFVQNlU0NGkrd0NrbmY4aDgxeW8yL20wWDc4d2N5?=
 =?utf-8?B?akxOZGROUE8vN0R2VU8zYmJBU0xGVklnNmVTUXpNWHlsL0dlcmRLN1ltaEI1?=
 =?utf-8?B?WmlOek44SEw3aWx0QlRrNUM5V2p1Z1ZWWkNhamhoRndyZVdrQjZwc3VTNHF2?=
 =?utf-8?B?S0ZucGViKzcyNHExS3FBM1JIYWNmVG1lc3hIMC9PbmRnVHpJTUhZNXBadE9M?=
 =?utf-8?B?ZkR5OFREQUN0cWF5a0dVaHJLQnN6ZWpYcUNoYldXVk5iY1ZwcjBUSVlzeUhz?=
 =?utf-8?B?THJvRTNWbDcrK2w0YzZyTjlOaEdVck9uKzh0NGFUWWNHWU1HTmFBL01DLzl6?=
 =?utf-8?B?LzA3QlJGMXhxTXZETkRqMERVcFNYSmZZTkJMZVlCaE1GcUNxd2duSDZKMkVj?=
 =?utf-8?B?Mk05aXp0Ykw1WkVJL25GZ3N1MUNxdUZ1UTI2czdQbUJIL25KeTdzSzRJZ3lK?=
 =?utf-8?B?RE5DaWl0NHIvdUx1WnpEM21oaXJVc0VwdGFHdEpucFRmQzRTRFR6aU9oZTYz?=
 =?utf-8?B?a1ZXVVF2V3JWUE16REd5M3VmMWhsK0tpOHlxdFhER2J4Rm5VNS9kU0U2R1hS?=
 =?utf-8?B?ckRDanF5ODlQdkxvaDVvNXM2VHJGOEt3ME50OWpDMkc3VktRa29leXRQb2g1?=
 =?utf-8?B?Y29lSU9kMzhpRks1TThMT3ZOOWVud3dzdGFOdUdBa09OYy9yZnNGSXVjV1Bn?=
 =?utf-8?B?czQxMlZHUXJDTldpNktDZnZTeTd3TVU3N0RoVm9xUDZBaWRUbzVnU2pScDVG?=
 =?utf-8?B?aFVWTFN5eXViQ09FRStERVRBeWVhMElSOXN2ck1maTRVSXdqQjFXMFlDazFD?=
 =?utf-8?B?SnNTbWZ6aU1QS053UnJaZFZmMFhNemhTZ2FGY3F4ZzZOUERqaGNpVVQwYjZG?=
 =?utf-8?B?SFIwRzRuU3JaZnM3T1hjdmNrN3ovckZaZ3hTQitnTWRJV3B2QWc4SktaZG5P?=
 =?utf-8?B?SEdQZjB1cVBhenpxUUJaQUZmL1JoVEJjVTZONUJGU1kyMTFCK2xzY3Bua0x3?=
 =?utf-8?B?bnFIcS8yVitQdUV0MHh2bUwyajR0QnZncVZJUU95WkZ1NnNHbllHREkzMTlm?=
 =?utf-8?Q?00P1H8Uxs9B0rrkLbGejT8FUDtYwSU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFBGWEVnNTRQS1RHUkhZdWRvMmFsWUdqZmVGQzhRU3R0YUllNldkRzhIdytK?=
 =?utf-8?B?MjBKcFhQZVBYc2FVbVdMYU5Ib2ZwSHJYMlNnZG1TbTZyZ0x3MDd2V0gwYkZD?=
 =?utf-8?B?akdZdkExS2IrMXpaSkpERzRML0IzTEZWSWt0Rk04N2ZKSlh6V1hlUkVodEZR?=
 =?utf-8?B?UlBIaEdrbStUZzVtMklHVFM5cXJEQ0Z3V2Zrek5QYy8zK1NtbElHb3p0TmRC?=
 =?utf-8?B?OTlxdjhmOVNiOFR2dnNvcGE1dW5VaEtHenpPVHdFdEkyWmFWdDF3ZjZQVDlW?=
 =?utf-8?B?ZUhmK2FzUnVkL1NTdWhqYkRLbFB4STlwUm1VcmlsVUNHcmNXZGlTN3g2L1V6?=
 =?utf-8?B?V053RGp2MkoxZnhZbGZJTDN0RWMrOGozZ21xanB6ckYwSyszdVRtSHZGallu?=
 =?utf-8?B?WTVsbXE4TDZuMldrc1FmZW1ZOWpCb0tWamlqY1hrS3J2aFFMNTdnVHJ5TFl2?=
 =?utf-8?B?bVo0TFdUdVF4SXkwQisxM1pZcm9HTk9Pc25lcmNwRGpkNGN4c3VZTHZxN2VL?=
 =?utf-8?B?QzRRckJRRlJkZjNzYWZndDdSdXFFSFBoK0JVcmNMWmwwajAwNVFKRUxITWFV?=
 =?utf-8?B?and2TWs3T252RFhjODJxSGowL1F3MnltUnV3T21JQ2tiRXhtK1hPK01TSjky?=
 =?utf-8?B?WWNWS05TWTFRTGtpaG9TTUFZTEh4TGlwR2Y4eEg1UXZmNmtxSC94YzNHMDJR?=
 =?utf-8?B?V2VSM3l2dlFwTld1V3E3MjRsNlRTMTgra2lhRmZMWkFjV3lzY1JxZC91eS9k?=
 =?utf-8?B?R1NOZ2R2WXloS2NETDk2ZnVodUJ0cytpOWVHNkhGZStKdzE4YUd3aUVhWE8v?=
 =?utf-8?B?dm9hSm1TTlEvTi83UG9Wcm1iTGNkMmtJcCtZc2pYNGRIMjhOUXpBQUFyZjRX?=
 =?utf-8?B?UFE1ZTYycmtsT3RlTjBmamppcUQ4dXQrd1BiSzJoZDJWdkJ1WEhEOHNwSGhY?=
 =?utf-8?B?aGZxMis3ajhSUWF0VWxaM3djZVZUZ0tyUWRVc2xqSVVVdEkvWnZpWWZFSjlM?=
 =?utf-8?B?R0RySUVoY2ZTWkJ0M3JIWTNHK1ZEVzl0Rmx3VWhuOXhyU2RZSEd6V2FjU2hi?=
 =?utf-8?B?STVIdzh4MEU2S1hBUWE5ZjdVR0VmSE1IZy84dzN0c1dMellnT2Y0Y2k2MFVh?=
 =?utf-8?B?V3U0VVR5OHJJa0ZkL0RUQ3BMZEJVeWsrVWNOLytaanRjV3JWQTFnQStyTHdX?=
 =?utf-8?B?bWZVd0V6ZWczUjJWeDdMYi94TWNIalovLzFCY2pQeE1NRnFQaFp1WlVzeGhS?=
 =?utf-8?B?TDNuWGk0eWNqZE82UERidTZRVUlGRFY0OWVpMDE2WTg1MnUwV0dtRko3VCs4?=
 =?utf-8?B?VFFxdEQ2TU1NckE2aStmQW1OcnJNQ29wdWY5QklUejZseGN6ZFNYSmsvTUo2?=
 =?utf-8?B?L3ovOVZQZGRiSldyUGFTOEJ6MGtidW4zKzBka1VyeGNaYWIzZGp4SGFiUDRV?=
 =?utf-8?B?N3FOSVF4TGxFa0VBWkZaLzUvVUNIeXU3bm95Wmg3OWlPRHAxUTdDMktmYVpX?=
 =?utf-8?B?YUhGUmtXZlZZRFdEQlVQNzhxL3hycllzZ2ZQQytybm1UK0lhRlo1UU9Gd3Z6?=
 =?utf-8?B?aFIrL0M0MkN3cy9oRmRKcjRxR2RocDd4dkk5ZXlnQjR1Q0Y2YmR1SE9zNnkr?=
 =?utf-8?B?NnYxc1hGL3Bua0ZYOU44cHFnUWRBWWJGdGdtcVRzWTBFaHk5L3M5bUpHZHZZ?=
 =?utf-8?B?MWFTdlZxVFRyOWZxalNHTE9iZ2NMN2FjcmFMRktoako0YUx6UDQxSkVQdFNy?=
 =?utf-8?B?R0Qvd1MxNVZHdlpsM0xNeGdwM2dXcE1qU2xFRm5MU2E5TzdpTW1zTnA4N1dJ?=
 =?utf-8?B?MGNNVU5LWWNhZ0UxVEJaUUFpVyt0RDk5Y3BocDM4bnE4MXZjMklhTEVHR014?=
 =?utf-8?B?VnlwZ2NxVG1KUytnZTNBMEdoVEZVQVZOMTFyVjlrd3lwRDVEWll6Y1c4RUFD?=
 =?utf-8?B?RWpJTmYvalJ0clk4ak5JRVFZWU1NZG8zVnhEVmxZdHBlMFM2STBmV1MvV3py?=
 =?utf-8?B?dFE4Lzh5WmNpNk15QUlkOFhOZStQMGpZRVBrL0NidkpsWms1SGdSUjBHOG43?=
 =?utf-8?B?ZHhpdFZibFVTOFVXS3RFZ2NqZjJTUUJ2RzNQTmh1WS9XNHNwL0RBYm42UVZC?=
 =?utf-8?Q?Fs2g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6508230-a74d-45fc-c39a-08ddcb4534ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 06:33:45.4029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClyuWGkMYQUCCpWj4z/NxlKTlCnVahscaZ8pXZMF/AGauk9jFVLjjN/gStiDsB7uSbM0gFSRfNs4CxwJ46z/dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7226

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVseSAyNSwgMjAyNSAx
OjM4IFBNDQo+IFRvOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
DQo+IENjOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+OyBIdWFuZywgUmF5DQo+
IDxSYXkuSHVhbmdAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0
cmFuZCBNYXJxdWlzDQo+IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+OyBPcnplbCwgTWljaGFs
IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47DQo+IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgRGFuaWVsIFAuIFNtaXRoDQo+
IDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIHhlbjogbW92ZSBnZXRkb21haW5pbmZv
KCkgdG8gZG9tYWluLmMNCj4NCj4gT24gMjUuMDcuMjAyNSAwMzoyMSwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOg0KPiA+IE9uIFRodSwgMjQgSnVsIDIwMjUsIEphbiBCZXVsaWNoIHdyb3RlOg0K
PiA+PiBPbiAyMy4wNy4yMDI1IDIyOjMwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4+
PiBPbiBXZWQsIDIzIEp1bCAyMDI1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+PiBPbiAyMy4w
Ny4yMDI1IDAyOjQ2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4+Pj4+IE9uIFR1ZSwg
MjIgSnVsIDIwMjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+Pj4gT24gMjIuMDcuMjAyNSAw
NzowNCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+Pj4+Pj4gRnVuY3Rpb24gZ2V0ZG9tYWluaW5m
bygpIGlzIG5vdCBvbmx5IGludm9rZWQgYnkgZG9tY3RsLW9wLCBidXQNCj4gPj4+Pj4+PiBhbHNv
IHN5c2N0bC1vcCwgc28gaXQgc2hhbGwgYmV0dGVyIGxpdmUgaW4gZG9tYWluLmMsIHJhdGhlciB0
aGFuDQo+ID4+Pj4+Pj4gZG9tY3RsLmMuIFdoaWNoIGlzIGFsc28gYXBwbGllZCBmb3IgYXJjaF9n
ZXRfZG9tYWluX2luZm8oKS4NCj4gPj4+Pj4+PiBTdHlsZSBjb3JyZWN0aW9ucyBzaGFsbCBiZSBh
cHBsaWVkIGF0IHRoZSBzYW1lIHRpbWUgd2hpbGUgbW92aW5nDQo+ID4+Pj4+Pj4gdGhlc2UgZnVu
Y3Rpb25zLCBzdWNoIGFzIGNvbnZlcnRpbmcgdTY0IHRvIHVpbnQ2NF90Lg0KPiA+Pj4+Pj4+DQo+
ID4+Pj4+Pj4gVGhlIG1vdmVtZW50IGNvdWxkIGFsc28gZml4IENJIGVycm9yIG9mIGEgcmFuZGNv
bmZpZyBwaWNraW5nDQo+ID4+Pj4+Pj4gYm90aCBTWVNDVEw9eSBhbmQgUFZfU0hJTV9FWENMVVNJ
VkU9eSByZXN1bHRzIGluIHN5c2N0bC5jIGJlaW5nDQo+ID4+Pj4+Pj4gYnVpbHQsIGJ1dCBkb21j
dGwuYyBub3QgYmVpbmcgYnVpbHQsIHdoaWNoIGxlYXZlcyBnZXRkb21haW5pbmZvKCkNCj4gdW5k
ZWZpbmVkLCBjYXVzaW5nIGxpbmtpbmcgdG8gZmFpbC4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IEZp
eGVzOiAzNDMxN2M1MDgyOTQgKCJ4ZW4vc3lzY3RsOiB3cmFwIGFyb3VuZCBzeXNjdGwgaHlwZXJj
YWxsIikNCj4gPj4+Pj4+PiBSZXBvcnRlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bh
bWQuY29tPg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEknbSBub3QgY29udmluY2VkIG9mIHRoaXMgYXBw
cm9hY2guIEluIHRoZSBsb25nZXIgcnVuIHRoaXMgd291bGQNCj4gPj4+Pj4+IG1lYW4gd3JhcHBp
bmcgZXZlcnl0aGluZyB5b3UgbW92ZSBpbiAiI2lmIGRlZmluZWQoQ09ORklHX1NZU0NUTCkNCj4g
Pj4+Pj4+IHx8IGRlZmluZWQoQ09ORklHX0RPTUNUTCkiLCB3aGljaCBJIGNvbnNpZGVyIHVuZGVz
aXJhYmxlLiBXaXRob3V0DQo+ID4+Pj4+PiBET01DVEwsIHRoZSB1c2VmdWxuZXNzIG9mIFhFTl9T
WVNDVExfZ2V0ZG9tYWluaW5mb2xpc3QgaXMgYXQNCj4gPj4+Pj4+IGxlYXN0IHF1ZXN0aW9uYWJs
ZS4gVGhlcmVmb3JlIGFkZGluZyBtb3JlIGlzb2xhdGVkICIjaWZkZWYNCj4gPj4+Pj4+IENPTkZJ
R19ET01DVEwiIGp1c3QgdGhlcmUgbWF5IGJlIGFuIG9wdGlvbi4gU2ltaWxhcmx5LCBhcw0KPiA+
Pj4+Pj4gbWVudGlvbmVkIG9uIHRoZSBvdGhlciB0aHJlYWQsIGhhdmluZyBTWVNDVEwgZGVwZW5k
IG9uIERPTUNUTCBpcyBhbg0KPiBhcHByb2FjaCB3aGljaCBpbW8gd2FudHMgYXQgbGVhc3QgY29u
c2lkZXJpbmcuIEFuZCB0aGVyZSBzdXJlbHkgYXJlIGZ1cnRoZXIgb3B0aW9ucy4NCj4gPj4+Pj4+
DQo+ID4+Pj4+PiBBcyBpbmRpY2F0ZWQgZWxzZXdoZXJlLCBteSBwcmVmZXJlbmNlIGdvZXMgdG93
YXJkcyByZXZlcnRpbmcgdGhlDQo+ID4+Pj4+PiBmaW5hbCBvbmUgb3IgdHdvIHBhdGNoZXMgb2Yg
dGhhdCBzZXJpZXMuIFRoZXkgY2FuIGJlIHJlLWFwcGxpZWQNCj4gPj4+Pj4+IG9uY2UgdGhlIGRl
cGVuZGVuY2llcyB3ZXJlIHByb3Blcmx5IHNvcnRlZCwgd2hpY2ggbWF5IChhcyBwZXINCj4gPj4+
Pj4+IGFib3ZlKSBpbnZvbHZlIHByb3Blcmx5IGludHJvZHVjaW5nIGEgRE9NQ1RMIEtjb25maWcg
c2V0dGluZyBmaXJzdC4NCj4gPj4+Pj4NCj4gPj4+Pj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGEg
Z29vZCBpZGVhLg0KPiA+Pj4+DQo+ID4+Pj4gQW5kIGltcGxpY2l0bHkgeW91IHNheSB0aGF0IHdo
YXQgSSBwdXQgdW5kZXIgcXVlc3Rpb24gaW4gdGhlIGZpcnN0DQo+ID4+Pj4gcGFyYWdyYXBoIGlz
IGEgZ29vZCB3YXkgZm9yd2FyZD8NCj4gPj4+DQo+ID4+PiBJIHRoaW5rIGl0IGlzIE9LLg0KPiA+
Pj4NCj4gPj4+IEkgYWxzbyB0aGluayAiaGF2aW5nIFNZU0NUTCBkZXBlbmQgb24gRE9NQ1RMIiBp
cyBjZXJ0YWlubHkgd29ydGgNCj4gPj4+IHRoaW5raW5nIGFib3V0LiBJbiB0ZXJtcyBvZiBwcml2
aWxlZ2UgYW5kIHBvdGVudGlhbCBmb3IgaW50ZXJmZXJlbmNlDQo+ID4+PiB3aXRoIG90aGVyIGRv
bWFpbnMgc3lzY3RsIGFuZCBkb21jdGwgZG9uJ3Qgc2VlbSBkaWZmZXJlbnQgc28gaXQgaXMNCj4g
Pj4+IHVubGlrZWx5IG9uZSB3b3VsZCB3YW50IHRvIGRpc2FibGUgb25lIGJ1dCBub3QgdGhlIG90
aGVyLg0KPiA+Pj4NCj4gPj4+IEFub3RoZXIgaWRlYSBpcyB0byBoYXZlIGEgc2luZ2xlIGtjb25m
aWcgZm9yIGJvdGggU1lTQ1RMIGFuZCBET01DVEw6DQo+ID4+PiB3ZSBkb24ndCBuZWNlc3Nhcmls
eSBuZWVkIHRvIG9mZmVyIGluZGl2aWR1YWwga2NvbmZpZyBmb3IgZXZlcnkgZmVhdHVyZS4NCj4g
Pj4+IEZyb20gYSBzYWZldHkgcG9pbnQgb2Ygdmlldywgd2Ugd2FudCB0byBkaXNhYmxlIHRoZW0g
Ym90aC4NCj4gPj4NCj4gPj4gVGhlbiBhZ2FpbiAoYW5kIGdvaW5nIGFnYWluc3QgdGhlIHRob3Vn
aHQgb2YgbWFraW5nIFNZU0NUTCBkZXBlbmQgb24NCj4gPj4gRE9NQ1RMKSB0aGVyZSBtYXkgYmUg
YSBkZXNpcmUgdG8gcXVlcnkgLyBhbHRlciBjZXJ0YWluIHByb3BlcnRpZXMgb2YNCj4gPj4gdGhl
IHN5c3RlbSBhcyBhIHdob2xlLCB3aXRob3V0IGFsc28gaGF2aW5nIHRoYXQgbmVlZCBmb3IgaW5k
aXZpZHVhbA0KPiA+PiBkb21haW5zLiBCdXQgeWVzLCBjb3ZlcmluZyBib3RoIHdpdGggYSBzaW5n
bGUgY29udHJvbCBhbHNvIGlzIGFuIG9wdGlvbiB0bw0KPiBjb25zaWRlci4NCj4gPg0KPiA+IElm
IG1ha2luZyBTWVNDVEwgZGVwZW5kIG9uIERPTUNUTCBhbmQvb3IgYSBzaW5nbGUga2NvbmZpZyBm
b3IgYm90aA0KPiA+IFNZU0NUTCBhbmQgRE9NQ1RMIGFyZSBib3RoIHdheSBmb3J3YXJkLCB0aGVu
IHdlIGNhbiB0YWtlIHRoaXMgcGF0Y2ggYXMNCj4gPiBpcz8NCj4NCj4gSW4gYm90aCBvZiB0aGUg
bmFtZWQgY2FzZXMgdGhpcyBwYXRjaCBzaW1wbHkgd291bGRuJ3QgYmUgbmVlZGVkLiBPbmNlIHRo
ZQ0KPiBjb252ZXJzaW9uIHdvcmsgd2FzIGRvbmUsIHRoYXQgaXMuIEFuZCB0byBiZSBmcmFuaywg
SSdtIG5vdCBoYXBweSB0byBzZWUgdGhlDQo+IGZ1bmN0aW9uIG1vdmUgb3V0IGFuZCB0aGVuIGJh
Y2sgaW4uDQo+DQoNCkkgdGhpbmsgdGhlIG5ldyBwYXRjaCAibW92ZSBkb21jdGwubyBvdXQgb2Yg
UFZfU0hJTV9FWENMVVNJVkUgIiBjb3VsZCBhbHNvIGZpeCBnZXRkb21haW5pbmZvKCkgbGlua2lu
ZyBlcnJvcg0KDQo+IEphbg0K


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D282DA71134
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 08:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927235.1329999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txL3s-0008Hr-8T; Wed, 26 Mar 2025 07:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927235.1329999; Wed, 26 Mar 2025 07:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txL3s-0008FJ-5b; Wed, 26 Mar 2025 07:20:28 +0000
Received: by outflank-mailman (input) for mailman id 927235;
 Wed, 26 Mar 2025 07:20:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txL3q-0008FD-TT
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 07:20:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:2418::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8327c7f-0a12-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 08:20:24 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 LV8PR12MB9357.namprd12.prod.outlook.com (2603:10b6:408:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 07:20:21 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 07:20:20 +0000
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
X-Inumbo-ID: c8327c7f-0a12-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRzVY2cSGppaEBq9LL1KxdhrKizGMgw9wXUzoJT2dtJeml9xymk3DxPrdYaekrPBeZriGaymaLWO2CbjVhdi11+EEYenoE58QXBA8srZDWF1WASY2LqoydLHFUXpD/vXwzCIWQDVC7uiQ2Mva3bBnM8AqwXI1iMOqCoiYyGDCpSo/TFg1U9cIIs+slobErxZrn5FK27Mp+gHgEuLwG+tcJlHvvaKZ8cHPxoned6D2fAp5EoOSLfnpjZHznVp8UAU9zR78lQZ/RxdvlCM9FEdFtIod1u/nCohhYB4g8q9/QKVuiOKEQcj323t8xzR0UM35iUajDzVo2jwGRFVi/VQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0cwQu4/dPKVtrbGHat3sN92/3SGSORK/kDXetrBkk8=;
 b=ce/7CVulLk6wN4Htq7KutzFlxkKHiihXQeZYuQu0zH4PoOFtktC9muHLfGVm4qL5qSWycs837tg4tds2tM0671ED8fforor2Wz31OVCVO1smIlTcaaDK/AmO5KrC84adM78ZzkaIu5QulHgQxN0ZhjzHSodOFPBbyoviVJrJ7TXeVW0GV38apCRb8HspCnMLJVJB/EyG2/TxA41wWe8bByiPifz3XPxjFGC6ktCMm/xG1QZLniX1zJaZedUm7KHpRR2/E/vdqxdnb5zF8ansmyCpLofaDE9xKbC+qsM7OzEjNvtm27PKeDhgm696MGIo2yw6bPJ1uifu0xuZmcLHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0cwQu4/dPKVtrbGHat3sN92/3SGSORK/kDXetrBkk8=;
 b=mnoI1xc1oTpVKpojYE4V+3zLZm174QUUAqw/emNWsGAVuBjHe9XwXBVDlPJwytIVOK2JHjXZvv8FHmbKdQdv5eVbTfqsOq9vL0H+Dta3Ya57Ga1AZm5nbOhgeOJLTX65rwdXkAShm8w7HynQgtWKRWypSoAVW4u0sAXy1I6ubaA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHbjnNpEkvZJyYnHka7avkYmH1MUrOCfisAgAKWJuA=
Date: Wed, 26 Mar 2025 07:20:20 +0000
Message-ID:
 <DM4PR12MB8451F07287ABC9BB683D7BD3E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-4-Penny.Zheng@amd.com>
 <80963bfa-a19e-49a7-8de2-0d8508af450f@suse.com>
In-Reply-To: <80963bfa-a19e-49a7-8de2-0d8508af450f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=0ebebc57-47ab-4935-8b26-85397151d6b8;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-26T07:19:37Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|LV8PR12MB9357:EE_
x-ms-office365-filtering-correlation-id: 301bee47-83bb-479c-a457-08dd6c36aaf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzZHTUU5ZWJLRDhFbUE3ejhaRzRjZzl6bGh0MjhFblZETzBqMEtCUXAyejRn?=
 =?utf-8?B?Mmx1UFBWeVoxZjNKbGhRd0p1TXM1RjJ4NGlZVlA4TXpzaUUvd3pnOE16cGMx?=
 =?utf-8?B?QVFnTjVDS244L1VHZGhITTZ0MjdpUGV5cGFTWmFMT2o3dS9RK1EyWEZYYm1u?=
 =?utf-8?B?RnRLdUtOUC9OaGZUeE5tWTVtc2NhelQyc3dDcVFCOEtRNG1NYVIvU3pnT3JN?=
 =?utf-8?B?TTNhaUtYS3JUbC9kazBxcGk3a2ROU2tOSGU0RlZxekR6NDlHamJvclZheGRC?=
 =?utf-8?B?SDh6SEpxTkliL09Td3VZWk1hbVMzdEN5c3NFdHZ4bXc4RUJ1M1JuMFR6L1Ry?=
 =?utf-8?B?aHA5d2pnYWpYbHhXeGplV0RBYjFwMzlQekJldWFjWmdvWkN1L0tybFRKZkZM?=
 =?utf-8?B?NXJOdWdaUzN5NWhqWDBZeVRGY1RQUlZDbzhtOWg5RVVWUXMzOEhSYVZmRlBN?=
 =?utf-8?B?OG1hMWI3NWNla3pNc2Qwdm13WDI4MkVRcEo4MS95dG95V25uME9STUZoUjRP?=
 =?utf-8?B?RHNXcDFVbWtjOTFtK2dGUytKVisrQjJ4Uk44MVhTSE44WjU2Nk1DWUQ4MWdD?=
 =?utf-8?B?Uk8rRm9HcmlZb1ZhakpKdlcxaDRiUTNxRnRwTkhpb3BPMS9FRHd5TlZ0aHhQ?=
 =?utf-8?B?M0RvN2VRdHhjNXhnY3l1S0E2UmkwUFR0bHhGSHlsa2N6blRpUXlCbXhXNE9r?=
 =?utf-8?B?Q3ZjQjZXNHlYT000T1l3L1NySGJ1UWpINWVVU2R2YUZLN0Q3Vi9nUmNjWFBm?=
 =?utf-8?B?YVc4NytFb3dYNkNEWVVYeWhvSW1lNFdpTUdZSzR6SUU5bzNERHFpWndOc1Zt?=
 =?utf-8?B?Vk1rb0NUNDBRNml1bllRVWptakVjYlpITUR2TGc0MlhicytiZGgrWTJIb09Y?=
 =?utf-8?B?VStKcDcvUlFPK1R5VGtPbldRK0lHZEsrZjRxUmJhUDk2QWZreVk1SEQvdTQz?=
 =?utf-8?B?RTlVQWE4c2g1b0VrN0JxVDhhek9wSWxoMy8yRFB4eGY0c3J3V2dmaVF1emRo?=
 =?utf-8?B?KzZwWjZnS1YvRW9OYzJHN0JKRGhkZlpLc0prUHM2MTZhZDk4Ly9EU2liMmVU?=
 =?utf-8?B?b1JNZE15b2s0SzMvSFdDMGtRNmtWS3R4VFpka29qTTFEaTMyNVB1akcvMUdp?=
 =?utf-8?B?QlVhZWdRbGkvRGFaNFZidTloVFhCQ2YvaHgxMzBESWY2aTY4TE9SbVZHMFd0?=
 =?utf-8?B?VjU4dTdRYVc0cHkzSnhiYitKeEkxZFhtZkFWUUZqTzdiUm00eEpPMVBWNDJj?=
 =?utf-8?B?UG1ia0hlajFUaGE5Vlo3cXJ3QlF3eVM3SHNjS3RkOEZzUjkxWjl1N0N5Y3Qv?=
 =?utf-8?B?NGJ0SVU5ZFJlVzd3b0Fac2o1bWZCYlFtT1ZQQzBvSlpqREJqZ3dBWGkvMjNn?=
 =?utf-8?B?OHVRa0RBMHdqdnA2RFNISVJvY1RiMDlkME9kekgwZ29lU3hzeUZ1ZytEc3ZO?=
 =?utf-8?B?QzVDcUtHeGY1UGlMSXJvRmhKaFNxTTRnNENJS0MyTDY5UGcxcFJidEplNGxo?=
 =?utf-8?B?WFExNFFBMUtjdUh5aVJGdG5wSkZndDZ3K1Z0c0xFS2ZYLzNQYlRLbmlPa1NO?=
 =?utf-8?B?RFVqZ3lzS01UNjFUOXhob1hQdS9PZ2Q4bG1sT3k3YXl6TFh2Rnd0dEJtbndK?=
 =?utf-8?B?d0xWdlZJZGFLSjJndzFWQ3hNbURwRHRGRW03OFdOTlYvZ2NnNlVLYWFRVkxO?=
 =?utf-8?B?UXdRS1N3Uks5NDlEdmRmeC8vYkFEYXN1clJBZUJjWUMxcS9xczhVQmpsQVhB?=
 =?utf-8?B?WEUwQ0JTcjlHMGkxT1pzUGRYY2lyUm10K25iRURzckYwYVJvYlVycXlFeEF5?=
 =?utf-8?B?L0JwK0RQNU5OSXpmdUJ3bi9VZWRaTVl5L0hkS2t4aDVSUkpWOVcvSnVzbTA1?=
 =?utf-8?B?YTJ3UzF2VjhjZkFtNUlpM0svN0hxWEpVcFRJbmtNUDYzdXFOQVdZVmdlYUtF?=
 =?utf-8?Q?OL0i1p/30KsgW8G/lPBqWqJhVUpmbKbG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0tzY3Rvb2ZnZlhtNHNxaG00NnNSM1ZoMCtOY1J2VnpKdU1YQ0JDV1ZNQUky?=
 =?utf-8?B?U2RXdFQvWnlGTWN3bE1kUkMvWTMyLzV5K0szYkdtYWdrL2s4UFd3N0xRZzdm?=
 =?utf-8?B?NDVRTklQMkwweVd2T2RUVjhta0xsY2NqNTZCK3VheWM5Q1M0U2RFdlRnTzFy?=
 =?utf-8?B?NFNkTUFPa1pPK2s3REQrK0pVSWxUekFQK3plbkJLS0Y5eWFQaWxHWnFNOTV6?=
 =?utf-8?B?MVpkUWEyMXFTc3lwMGdWdy9rZ3Q4VzY3dVRBRW9lcmR0M1F1ZmdTdUlpd1Mr?=
 =?utf-8?B?OWU3TkZKRE5xOHdtY215R3B6TGNNTmVOZkdhU2NVeVVVaVl2dEdoSDlJcjJX?=
 =?utf-8?B?Vkh2RlZ4ZmhwdUVSL01sQURheCt5cUM5OWtQM0h5dzBkekgyemkzTnRBVWti?=
 =?utf-8?B?YVJiWUxyTHg5YnJJekRXc0dZMXJCNHdPQzk4LzArSFE5ckZaK2NaenZiQ042?=
 =?utf-8?B?dFJseWN3NUhsZDJFSWZQRytjUjFnd0lBYklaTk8zWHd6bnlYUzlrZFZmZmRC?=
 =?utf-8?B?YklwdmU1MVVNS0JVQnVmcjB0cUVnb0NVQjBaNXdRc05sYm51QWJtMHpiTGov?=
 =?utf-8?B?ejEzSFh6aWZZa2R0cCs5SWM2eHhjZExQZWplNnJLdndUU3BzUmwrV25hZ0xr?=
 =?utf-8?B?RllQajJYSHF2aDZQMUhPcDFScHp4dHNrNFJpUnBrdG9PVHUrMGpuNFgrZ0JZ?=
 =?utf-8?B?VGd1NDd0d0FwQ3lNRlpWYXdEa3daK0U3YzdabjBzWDNFbUJuRkV6WWNtZGti?=
 =?utf-8?B?dDRLL2xDUlZUVmlNR2dsSUp1MUY4bzNpZWJXSU5hek9YNTNSTnJudmhwWW9G?=
 =?utf-8?B?dWoxVUtJUGptK0xXSHRGNCsvcG1haitzbzJLeHdqazhPblFvRHRBbTd3YmVO?=
 =?utf-8?B?ZkZtQ0RsblJIT2dXS0IrSGNscGs1T01nRTZJWTFOc3B1dHZjdEp3YkJFV1J0?=
 =?utf-8?B?eTk0VzY2Nit6MmlwVU12d2ducHdyRmMxS0xIZThndWhxdjFmV1grY0ljWk9W?=
 =?utf-8?B?Q0FGLzMwc1QxZTl2cUNGbFpyaTlQLzJhL1ZTUkx2NzEvTHpmSVVUNWpoU3NV?=
 =?utf-8?B?SkpkYXVFME4zVWtSN3Rka08rL2tPY0MvUXJtWG5YV0ZpSEJNUHJ4dUN4a3pN?=
 =?utf-8?B?M2orWVdUVEMrVnlNcVkxckNyUXZDUzFHSU1jc1YwNExNNHBmNEh1QkRrTC82?=
 =?utf-8?B?bndUSzQ0bWFpWFFJeUpxejJLT2h2a1ZCOWNCcEd4WFA0Q2czNG9tTnpCaGZG?=
 =?utf-8?B?WXNhTlZVcmJBRThaQms5eVltT3dVamlEY1BqNW9Ed2hSQmFFUWhqdTNPR2ly?=
 =?utf-8?B?N01TVzlIZy9uNnlJaHhhUjBmSStTZmY0dXQ5dCtUSmNDcXhWLzB5NnNiUGxB?=
 =?utf-8?B?QWZ6UzhST2lOOFJZOXBCY1ZtSVIrZEhrZHphUGMzUlBFbFZuM3FYdnZ4MzVE?=
 =?utf-8?B?RVdsTGVTakR5VUFIbXV2a1ovd3ZJNE81T2NQY2F2b204WEdwZVA2NFlKTk5K?=
 =?utf-8?B?YTQ0WmlVUlhvOXdnUlY2aXcxWVYrMGdRSy8wRktzREJlVGVUOXlOVk9PYVgz?=
 =?utf-8?B?TUpVZGNDTHhCSk54UTlMUDBHY0Q1SzNUbGpYd1N6V3lVajloWVpYc0NrWmlz?=
 =?utf-8?B?amdQczIxbXRmU3o3dHQvbnV5eGdYZUhlRCtuUURBZnlyZVVRREcvL0ppUGVi?=
 =?utf-8?B?U3JvNytLa2RFZDlpZnAwdUNEK1R1SmU1dGhNeGpZNFpTc051Mkd4RzE3amtO?=
 =?utf-8?B?bHhWZFgvN25vbk1rWVJqR1RkYVpWMFl5NTBiMndNU1orbXBNaGtFMHJpbkZI?=
 =?utf-8?B?MWJ5VmQvRVA0QVA4WjdldVZ6NlFNYkxkaWlHL1VzS3FPSnZDL2orNHFiN0tK?=
 =?utf-8?B?RS9Fa3lSU0Q2RkkzV2E3T1JoaStzOXZKSWxSTTdWUFdKNjZ3M3g3bXRjRm1k?=
 =?utf-8?B?bVNnbStEZUZyUkFMdVRTZzJsZ3VuTXRqYVlrNnU0TnlMbnROS294RnBRNDdB?=
 =?utf-8?B?dy9raW1RbEJJdkhpSWRjcVVrMEJzbjNvQ1RWWmc4bUdyRlk4eWFrbkdRU0VV?=
 =?utf-8?B?bkRwQ05QTytuU1phc2ZaMG9seTNyOTNHOTZHUk5URGc3dmxJYmNsaDJ0TE56?=
 =?utf-8?Q?Zd0Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301bee47-83bb-479c-a457-08dd6c36aaf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 07:20:20.8390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BsMtVgDOpcqSaCukA5dpxCdl0S7LAvGlzN1t7LrGcOY1ToE4Cafb/fKfivl2QOe3jA3G4vG9lHhCQM3hbemrtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9357

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDI0
LCAyMDI1IDExOjAxIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYzIDAzLzE1XSB4ZW4vY3B1ZnJlcTogcmVmYWN0b3IgY21kbGluZSAiY3B1ZnJlcT14
eHgiDQo+DQo+IE9uIDA2LjAzLjIwMjUgMDk6MzksIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IC0t
LSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPiA+ICsrKyBiL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPiA+IEBAIC01MzUsNyArNTM1LDggQEAgY2hvaWNl
IG9mIGBkb20wLWtlcm5lbGAgaXMgZGVwcmVjYXRlZCBhbmQgbm90IHN1cHBvcnRlZA0KPiBieSBh
bGwgRG9tMCBrZXJuZWxzLg0KPiA+ICAgIHByb2Nlc3NvciB0byBhdXRvbm9tb3VzbHkgZm9yY2Ug
cGh5c2ljYWwgcGFja2FnZSBjb21wb25lbnRzIGludG8gaWRsZSBzdGF0ZS4NCj4gPiAgICBUaGUg
ZGVmYXVsdCBpcyBlbmFibGVkLCBidXQgdGhlIG9wdGlvbiBvbmx5IGFwcGxpZXMgd2hlbiBgaHdw
YCBpcyBlbmFibGVkLg0KPiA+DQo+ID4gLVRoZXJlIGlzIGFsc28gc3VwcG9ydCBmb3IgYDtgLXNl
cGFyYXRlZCBmYWxsYmFjayBvcHRpb25zOg0KPiA+ICtVc2VyIGNvdWxkIHVzZSBgO2Atc2VwYXJh
dGVkIG9wdGlvbnMgdG8gc3VwcG9ydCB1bml2ZXJzYWwgb3B0aW9ucw0KPiA+ICt3aGljaCB0aGV5
IHdvdWxkIGxpa2UgdG8gdHJ5IG9uIGFueSBhZ25vc3RpYyBwbGF0Zm9ybSwgKmJ1dCogdW5kZXIN
Cj4gPiArcHJpb3JpdHkgb3JkZXIsIGxpa2UNCj4gPiAgYGNwdWZyZXE9aHdwO3hlbix2ZXJib3Nl
YC4gIFRoaXMgZmlyc3QgdHJpZXMgYGh3cGAgYW5kIGZhbGxzIGJhY2sgdG8NCj4gPiBgeGVuYCBp
ZiAgdW5hdmFpbGFibGUuICBOb3RlOiBUaGUgYHZlcmJvc2VgIHN1Ym9wdGlvbiBpcyBoYW5kbGVk
DQo+ID4gZ2xvYmFsbHkuICBTZXR0aW5nIGl0ICBmb3IgZWl0aGVyIHRoZSBwcmltYXJ5IG9yIGZh
bGxiYWNrIG9wdGlvbg0KPiA+IGFwcGxpZXMgdG8gYm90aCBpcnJlc3BlY3RpdmUgb2Ygd2hlcmUN
Cj4NCj4gV2hhdCBkb2VzICJzdXBwb3J0IiBoZXJlIG1lYW4/IEkgZmVhciBJIGNhbid0IGV2ZW4g
c3VnZ2VzdCB3aGF0IGVsc2UgdG8gdXNlLCBhcyBJDQo+IGRvbid0IGZvbGxvdyB3aGF0IGFkZGl0
aW9uYWwgaW5mb3JtYXRpb24geW91IG1lYW4gdG8gYWRkIGhlcmUuIElzIGEgY2hhbmdlIGhlcmUN
Cj4gcmVhbGx5IG5lZWRlZD8NCj4NCg0KVGhlcmUgYXJlIHR3byBjaGFuZ2VzIEknZCBsaWtlIHRv
IGFkZHJlc3M6DQoxKSAiOyIgaXMgbm90IGRlc2lnbmVkIGZvciBmYWxsYmFjayBvcHRpb25zIGFu
eW1vcmUsIGxpa2Ugd2UgZGlzY3Vzc2VkIGJlZm9yZSwgd2Ugd291bGQNCmxpa2UgdG8gc3VwcG9y
dCBzb21ldGhpbmcgbGlrZSAiY3B1ZnJlcT1od3A7YW1kLWNwcGM7eGVuIiBmb3IgdXNlcnMgdG8g
ZGVmaW5lIGFsbCB1bml2ZXJzYWwgb3B0aW9ucw0KdGhleSB3b3VsZCBsaWtlIHRvIHRyeS4NCjIp
IE11c3QgdW5kZXIgKnByaW9yaXR5KiBvcmRlci4gQXMgaW4gY3B1ZnJlcV9kcml2ZXJfaW5pdCgp
LCB3ZSBhcmUgdXNpbmcgbG9vcCB0byBkZWNpZGUgd2hpY2ggZHJpdmVyIHRvDQp0cnkgZmlyc3Rs
eS4gSWYgdXNlciBkZWZpbmVzICJjcHVmcmVxPXhlbjthbWQtY3BwYyIsIHdoaWNoIGxlYWRzIGxl
Z2FjeSBQLXN0YXRlIHNldCBiZWZvcmUgYW1kLWNwcGMgaW4gY3B1ZnJlcV94ZW5fb3B0c1tdLA0K
dGhlbiBpbiB0aGUgbG9vcCwgd2Ugd2lsbCB0cnkgdG8gcmVnaXN0ZXIgbGVnYWN5IFAtc3RhdGUg
Zmlyc3RseSwgb25jZSBpdCBnZXRzIHJlZ2lzdGVyZWQgc3VjY2Vzc2Z1bGx5LCB3ZSB3aWxsIG5v
dCB0cnkgdG8gcmVnaXN0ZXIgYW1kLWNwcGMgYXQgYWxsLg0KDQo+ID4gLS0tIGEveGVuL2RyaXZl
cnMvY3B1ZnJlcS9jcHVmcmVxLmMNCj4gPiArKysgYi94ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZy
ZXEuYw0KPiA+ICsgICAgaWYgKCBhcmdbMF0gJiYgYXJnWzFdICkNCj4gPiArICAgICAgICByZXQg
PSBjcHVmcmVxX2NtZGxpbmVfcGFyc2UoYXJnICsgMSwgZW5kKTsNCj4gPiArDQo+ID4gKyAgICBy
ZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBjcHVmcmVx
X2NtZGxpbmVfcGFyc2VfaHdwKGNvbnN0IGNoYXIgKmFyZywgY29uc3QNCj4gPiArY2hhciAqZW5k
KSB7DQo+ID4gKyAgICBpbnQgcmV0ID0gMDsNCj4gPiArDQo+ID4gKyAgICB4ZW5fcHJvY2Vzc29y
X3BtYml0cyB8PSBYRU5fUFJPQ0VTU09SX1BNX1BYOw0KPiA+ICsgICAgY3B1ZnJlcV9jb250cm9s
bGVyID0gRlJFUUNUTF94ZW47DQo+ID4gKyAgICBjcHVmcmVxX3hlbl9vcHRzW2NwdWZyZXFfeGVu
X2NudCsrXSA9IENQVUZSRVFfaHdwOw0KPiA+ICsgICAgaWYgKCBhcmdbMF0gJiYgYXJnWzFdICkN
Cj4gPiArICAgICAgICByZXQgPSBod3BfY21kbGluZV9wYXJzZShhcmcgKyAxLCBlbmQpOw0KPiA+
ICsNCj4gPiArICAgIHJldHVybiByZXQ7DQo+ID4gK30NCj4NCj4gRm9yIGJvdGggb2YgdGhlIGhl
bHBlcnMgbWF5IEkgc3VnZ2VzdCBzL3BhcnNlL3Byb2Nlc3MvIG9yIHNvbWUgc3VjaCAoImhhbmRs
ZSINCj4gbWlnaHQgYmUgYW5vdGhlciBwb3NzaWJsZSB0ZXJtIHRvIHVzZSksIGFzIHRoZW1zZWx2
ZXMgdGhleSBkb24ndCBkbyBhbnkgcGFyc2luZz8NCj4NCg0KTWF5YmUgSSBtaXMtdW5kZXJzdG9v
ZCB0aGUgcHJldmlvdXMgY29tbWVudCB5b3Ugc2FpZA0KYGBgDQogICAgICAgID4gICAgICAgICAg
ZWxzZSBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0lOVEVMKSAmJiBjaG9pY2UgPCAwICYmDQogICAg
ICAgID4gYGBgDQoNCiAgICAgICAgRm9yIHRoZSByZXN0IG9mIHRoaXMsIEkgZ3Vlc3MgSSdkIHBy
ZWZlciB0byBzZWUgdGhpcyBpbiBjb250ZXh0LiBBbHNvIHdpdGgNCiAgICAgICAgcmVnYXJkIHRv
IHRoZSBoZWxwZXIgZnVuY3Rpb24ncyBuYW1lLg0KYGBgDQpJIHRob3VnaHQgeW91IHN1Z2dlc3Rl
ZCB0byBpbnRyb2R1Y2UgaGVscGVyIGZ1bmN0aW9uIHRvIHdyYXAgdGhlIGNvbmRpdGlvbmFsIGNv
ZGVzLi4uDQpPciBtYXkgeW91IHdlcmUgc3VnZ2VzdGluZyBzb21ldGhpbmcgbGlrZToNCmBgYA0K
I2lmZGVmIENPTkZJR19JTlRFTA0KZWxzZSBpZiAoIGNob2ljZSA8IDAgJiYgIWNtZGxpbmVfc3Ry
Y21wKHN0ciwgImh3cCIpICkNCnsNCiAgICB4ZW5fcHJvY2Vzc29yX3BtYml0cyB8PSBYRU5fUFJP
Q0VTDQogICAgLi4uDQp9DQojZW5kaWYNCmBgYA0KDQo+IEluIHRoZSBlbmQgSSdtIGFsc28gbm90
IGVudGlyZWx5IGNvbnZpbmNlZCB0aGF0IHdlIG5lZWQgdGhlc2UgdHdvIGFsbW9zdCBpZGVudGlj
YWwNCj4gaGVscGVycyAod2l0aCBhIDNyZCBsaWtlbHkgYXBwZWFyaW5nIGluIGEgbGF0ZXIgcGF0
Y2gpLg0KPg0KDQo+IEphbg0K


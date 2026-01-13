Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48380D1A1A1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:10:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202015.1517620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgyS-00007V-2j; Tue, 13 Jan 2026 16:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202015.1517620; Tue, 13 Jan 2026 16:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgyR-00004y-W8; Tue, 13 Jan 2026 16:10:27 +0000
Received: by outflank-mailman (input) for mailman id 1202015;
 Tue, 13 Jan 2026 16:10:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pu67=7S=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vfgyQ-00004q-91
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:10:26 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bbff2f7-f09a-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 17:10:20 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI2PR03MB10666.eurprd03.prod.outlook.com (2603:10a6:800:27d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:10:17 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:10:17 +0000
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
X-Inumbo-ID: 5bbff2f7-f09a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5YnTkuMRMqBi1UyU/xVLoOsTHDWp0e8uTmsFqS448DMNYvKSDfngTvSsHeCSMQVLepLuUYtZ60w8t9Fi0XvLvnsXca67EDfybjpEBAVYcogBiiBBkoTjFmSOvTikza/PLz6kWFG9ztH8TbTKTzgqj/AebTpWQuCIy9w0ylUAKJ5F6KD+N4PfN90i/OupLFbqhTYb+j/BWElqfSJq03vRSW6BN2+3aKJujofyhYmDMLRBkrwjmHcJXlN5UjPq8FpFBUmE7HprQHiG34oIhenqbbzNaQt1rvmBgq/xA4N+er8x8F5oC97jYt2X1kH3RttyI/R22+Ns+mQqx8e/Tcg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6m8eW87yuYQZbQyAsea/G2lMKbjXSvEJZzdQaTxWZk=;
 b=WSw8qUERXeO7u0IEt0rVEyfKh8NVxwFr+QB/eiAEkVBEWNhy/n502jfHDuwXR0ENdxYAw/cTbCwR0wGxt/eZM/ba6/g8XQ8okWGtqGtOE+qIOUSwNLTtpeTHJYQCTy9HfBuGgEOJ3Zv/C6ErsHnsH5oUHn1XyES8e4tnpkPxEHkSQtAeBOgu0RvuK8kdXG33jpvoqFESP14OvL79CRW1I4zeevOPYFlyzUejAwfkxVa23EpwSeLNZQ51LGLC0nIghqpgF7CHarU/KcnAj32Ncc6PVwj6C7HjnYLUgv/abVlYDFliH9v8XDFTWWMBJxhpYnIkf7yx3WMBbLoYFSSaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6m8eW87yuYQZbQyAsea/G2lMKbjXSvEJZzdQaTxWZk=;
 b=C8CjESClvZxGdbZMg25QUO4IrfQw+PVYEhHOx20PnonN+ibtS5fpCD+r36HDRLWhxZKqVaWZc8/+l0SJn+Eflb4G2CHWDIDltCulf3OFiVf7/3/pX0piELmfHWrvinWKjPN2kgjEhIQPrdQnpNi0c0LfZ1W8cFo3OnHOueQ3eTVT+vVwsckNda2/25qrs0c8Oo4KnYaA8zPOHm/0mRzzoRYDCGrjieQDNt34FtY6fQQ2qyRMxp5AfOlD3uCB7cZHfIL0372l9fdrYYnHWjSvu21itTwS8wfUvEJHl70QJ0OeWcDrLrBNM2UXPGbfjH4fL7yn572zx1Mj+T+4yIQTfg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Index:
 AQHcSyafS16SOr0Uk0OkeRdy8jd8CrVPHVoAgAADtoCAAACtAIAAA/oAgAAAqoCAAYwTgIAABOMAgAAAkQA=
Date: Tue, 13 Jan 2026 16:10:17 +0000
Message-ID: <22477428-9eee-423a-9260-545154ffd007@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
 <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
 <5d8f55a6-7182-4e9d-a139-96fddb9450f8@epam.com>
 <98f5e8f0-070c-4be5-9baf-46278de8093d@suse.com>
 <99586f5c-d76b-4cbe-9fbd-c87e86bb236a@epam.com>
 <7cbda859-4257-499e-86e0-a0d001fd49c9@suse.com>
 <9631b854-2fc6-41aa-8b12-1e7283b22246@epam.com>
 <4807d2d3-fae7-45a4-b7c7-e101a95a6b58@suse.com>
 <87ba1c35-f1f3-4a52-ba76-306a538ad0c6@epam.com>
 <93cf250d-864d-4375-b05a-e48d3d56dac9@suse.com>
In-Reply-To: <93cf250d-864d-4375-b05a-e48d3d56dac9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI2PR03MB10666:EE_
x-ms-office365-filtering-correlation-id: 9f59ef5f-8d9b-458e-60f4-08de52be3e49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MGVMVUpZMm5rR1U0TDU5cDN0NUFSZ2gzb1Y0S2VxVlRkazY5Q0M4RTZucGxN?=
 =?utf-8?B?NmNLeWxPMml4TkJ3TVB2c0VVWXpiQTZNd2RSd0lkbGdwV09hNC9qa0hua1Zv?=
 =?utf-8?B?cllYUWpKU2pqd2RjeTdvUVI5RURXS2NYSjBMQjVONDA0bHFxNWJQZWxwczd2?=
 =?utf-8?B?YVVNWGx1bWZMVEhGWXJGclpmak1PR0dRZ1hPQ3Y0U3BVLzZtS3NEYkZOZm9i?=
 =?utf-8?B?MkY4SXFKSllWYmRtcm80QkhnUjdYSSsyUzB6K1ovRVQ0Mnl3dDl3VXNpbzda?=
 =?utf-8?B?azJCa05PMU9yUTdjSjFPa1BHU1Vua1dHTi9UVWI0bFdxRi9CQkhmMHFoM3hi?=
 =?utf-8?B?dkN4RTFmZTNwNlB2Vm5mc2NqV2xHTzdha3JmamdSRVVRVTZUYW5jVVorTkZy?=
 =?utf-8?B?M0p3ZnFZaE0wMkRQbzlpNkdvWThRbkNZNG9raThmdCttK3RkbE9oQTJoQm12?=
 =?utf-8?B?K21IZFRvU1pqd2xzb011MkdrdDY5RnB2c0drdlhEcTNvd2ZreUlvRmNXWmFM?=
 =?utf-8?B?Zk1NQVRZRDF3TVh2bWNYdzdQYnBYWVdWekFhbFl4N0dHd3pNTGRUbURuMEJD?=
 =?utf-8?B?ZXIwaG5aeXJBK0xHYlhDWi8wMFRKNXUyRnZ3aWRNaTljWXlYTUVHTEtUTFlV?=
 =?utf-8?B?SEhEWGVWQzQ0NW1RRVBEMHVSSEtBd3FlTy9LZnhGQ2xIUmQzdm5YUzk4RElu?=
 =?utf-8?B?YlAvdVNSU1VvZk5YRzFNKy9FN1lTblpKNG00ak9sTytsbFFyeUJHZ05XcjZF?=
 =?utf-8?B?MG94OHF0Vi9RajNaZU9ZaFlRNWZXT1ZxREp6YUZaK25RYkcyb1FYZlBobXNH?=
 =?utf-8?B?bVdmVnB2Y1Bra2dhbHh2WnRZczBNbWZ4MENhWHd4dXF1Y0VCa2pteUQwSjNS?=
 =?utf-8?B?M01kYlYvN25ud3BNZEdjZnRobzBPekZDZzlEaXVnclZ0UlpQb2RvbGVDTWtT?=
 =?utf-8?B?VHo3Q25GYXBkSkN1TEsvTlZCaTF3ckFLaFhmbXZDV3E5M0pYNXZya21maVZ3?=
 =?utf-8?B?R01uTDNTU3ZPbmFMOFlyVG1qd1d3RFNoOWxkQjB2MUhpT1ovdFFyc1RyR3A2?=
 =?utf-8?B?dnppcS93c3FpcHVqaFIzWmdyVEtGOVE5QXhmZUJVUG1SeC9tVE1od241SGt2?=
 =?utf-8?B?U3NKSytuZVAvVHZmcGtVSHV4WnZrOVVBbExqREwrT0tKTVlUUnlYcklENmZw?=
 =?utf-8?B?WVF3ZnA5MXgwT2VTTnV1R1NzYkhlb0k5ZGhCb3MwVVh3eTdnMkRNUEVUWWVa?=
 =?utf-8?B?OGxIR0h5bCtOZ09XVm9tRDRKNUhsblJyY2dEcDV6UUs0RmFSRmZ6MThvZVN1?=
 =?utf-8?B?Y1REVmZaL3BFQkkraVpCV1dycWRzQjhybmJKM0pxTEU2aUR0Q25RMGM1Ly9H?=
 =?utf-8?B?OHM1R3BlYzJaaVU1ZmNZQ3BQOXZqMzJaM1lTMi9QZllvMjVhZUxlK3ZCbEt4?=
 =?utf-8?B?MXh3dW56dDFjODVMeHNYZTJzTUJVSjVmZlVSUURKYUNIbk4yYnUraU5PL3dV?=
 =?utf-8?B?TUx0QUJBRE5rSmltZ242cDNGRkxKaDFSOU5BM2FteXptdXNSRFBpUW5qdlU3?=
 =?utf-8?B?L0JYT3pNaGRXczZ4UTNISkFZZzJTMExOakZxTm13SkxJTUZpemRqQUJqU3Nq?=
 =?utf-8?B?K3ZtdEw2ZHN2U3RjOVlOYmZVRWh5USt4dXR2Wjgwd3BWb1J0c2xYS3ltdzBH?=
 =?utf-8?B?OHY4d2t6RzVSeG1DT2xtLzl4QTFUQ3RqWllaRnptZTdXbjAwaEhEL2VRTjRo?=
 =?utf-8?B?SVJIZjFiNGpkQ3l4WllTelV6aTRmQXZzZlIwU2RWeWo2Y0NZc3NZZDdkQWpo?=
 =?utf-8?B?NWNsTHFVVVk4Q3N4UTVsWlg0S2QreG1pMHg2YXkvbG0yL0Z6cERWMVlHaytH?=
 =?utf-8?B?cWFONTFUVE94K29mTFlOMTdxb01lZjVqb1V2K3pxYzVYMHh1OCtjUHBkUVlu?=
 =?utf-8?B?cmw3cFRKcktRd2d2Mk8vQUU5bk8vRzN5L3NyVmNTNFdKaFcwS1lCV3hiM2tU?=
 =?utf-8?B?YndVbVhiTUFybEhTRWQrdzlETW10RnNJM2NsKzcwUlRXcXlFL2lMek5yNE9n?=
 =?utf-8?Q?5lh8PQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ak1vVlpmU1I3dmxIWTBvVVdZWmhqV3poRmoyaFhwRDZWS25KRFJMNEVTb0Fh?=
 =?utf-8?B?UThseGR5MkQ3V2xvbU1uTzdZa3ZEQ3RtU0xCVzlTY1F0VWg0V1VrYmp6U2tm?=
 =?utf-8?B?UWRiNlh3OWlMVzAwL001THBQQnBHNXRtQVBWOVhZejg2dWRPNmlKcktKcFJI?=
 =?utf-8?B?RUoraVNua09ra212STZYa3ZBVlNQcHlETGE0djRZbnhtaEhjTy8rSUliY0NK?=
 =?utf-8?B?amd2OXZvTXBtUHJZVTAxNHFBZTlWbEE5N3BCS2FmUHJVQVdEQlhZYlpyQTZR?=
 =?utf-8?B?SHhhVjQyZFJQdzV3NmNTNVU4ODZNMHBHeWJHUmRGcy90cmR0dWM3aExrREFv?=
 =?utf-8?B?ejNmRElFTkNSRnREaUpoMy9DcWx2eDRXZVhjbXJiVFNYVy85MVBPU0FIeVNG?=
 =?utf-8?B?VUkzM0xDWWNkTXpMOEhHaURsQTV1OWg0UG9xdkNjNnRaSE1NenVkNGpBZDRo?=
 =?utf-8?B?eGtITlNzYnZ6d3dEbVJpYXFYZExlTHh3cmFyeTh0cXRJMTR5dDdHNnB4aFp3?=
 =?utf-8?B?NUdrQTZvZkxmQ2dBM3psRkhnT3N0NUlJK2xtcmh1TThhOCszb0hOSUZ0MVU2?=
 =?utf-8?B?dndQZnR0cDB2Y3dBNzZXYjJMc3BzYWNwQXhUUXdWRVl6Zy92aVlEaXVsRUZJ?=
 =?utf-8?B?NTRja3I0VHdhVENsemtUSU5kem1ZYklMWGhlMHlUbk1WRjc3UkZLV1B4azlB?=
 =?utf-8?B?MWNrUU11ODJubUJsalp5dTFsaWRSTjZSUmpBZGRMdi9GT0FyY0dTdWdORThh?=
 =?utf-8?B?SWZxeEJxcHQvdlhGZGkxQVdSZXFBUUVFVjZTeks2Z1lmZ1E4NHNac1pDNDlW?=
 =?utf-8?B?VjVydkJLeHpJSzVYQVRvVElnWnVjRXJ6eUNRb0hmK0hFaWpjbk4rQTFpZmFJ?=
 =?utf-8?B?NlM1Z0hETW9hVVNOT3F0NmI3QVhTMnk0WHNtYmk4UFBrbERZTWNPcXZoZXNE?=
 =?utf-8?B?L0ZuZjFNUURPR3d5Z0xMb2xoU0FoeTJ1UTJERm92QnA2UHNuS3hlcHh5RCt1?=
 =?utf-8?B?eGgxT0lQNUozYmUzTHo4eEZSRW9STFFZdUQ2NGRKcVM4MTlkaC9IcWZyckZF?=
 =?utf-8?B?dkF6MzVhUE8rRitSN1lNSWZ3Tng4NTFaVXlSUzNVTDF1amV5TVdZOWVEQlFJ?=
 =?utf-8?B?S1VialZndUZFR3c2SzkwbEZHZzRmZVoyQVhiL1ZEVHEzTitFalo1MkFuZ09p?=
 =?utf-8?B?VC9YRlV5eDI2cTArU2gyaW1DYUMrM0FPc2NSUmdCY1QvNE5hV09rYnZWQXJt?=
 =?utf-8?B?VndPQ1Erbk1QanY0Q2hZaS9PelRwd2t5N0RucFJnRUxzQ0lWQ2d4ckxLQmgy?=
 =?utf-8?B?K3FWQnIybnNNcEhwZk9MZlBoNk9TRzlMTTg1Z28zNFduSU9yNGQ5VU5ubnRz?=
 =?utf-8?B?Y3dVZUpRbGNEMnlNVURra0RSOTRoZjJLclZsTE51NVVVbWExdkVHNU5tUFJ4?=
 =?utf-8?B?Yzdxam1SU0N0Q2V1S1FtZU5EMk80WjNUVEthWVV3NXcvaDlrTHdOQ1lFODlo?=
 =?utf-8?B?TksvVFhkcVM2RldSVnBPTDhJVFJPWGtsSzJ4YndFTjI4aGswOXBacEZ6MlhO?=
 =?utf-8?B?L3NsUzMzemVkSzVKSjA2MTdtczdzVENZVXdCei8xclYzdXdsZWYyTk5BcytY?=
 =?utf-8?B?RGZvOFA4SFVEWU8yYit4VGlTSnZOVE9qclhFd3h2NEVCQlBHR0lpaEkzU1hQ?=
 =?utf-8?B?dXNSWU43UGMvZlNzWTQvUXdrRktIQmNsT1AydlNWVm9yUmRoQ0pwd0RvSVdt?=
 =?utf-8?B?TmllSGtvWjZYalVyWE91MnE1aFZOVmo2WUQvaThRYmhJKzBxQndKTTVCR2xI?=
 =?utf-8?B?UHI5VnhnK3dwcFNWZnRLc2tLRnJXV2g3SFU0Q2ZFaTEvSmhwV1d1cmVBMlpE?=
 =?utf-8?B?Qy80UkdWSFdJLzZibUxIMkYzWmVXMFVETHc1NkdXcXdkaTBlbE12anN6VEIx?=
 =?utf-8?B?QkpCVE5NaTRqaTJ0bExzaHQ3TFNqSDljUWhqV3VhZ3dIR2MwREs0eUZMR1Ey?=
 =?utf-8?B?TC9iTXp5MFRzeFM0U0JTbDAyZlhTR1EzWkVpK3g2cVVNY2N0SFFSQ2ozdUVW?=
 =?utf-8?B?RDBUT3JCQmdIbDJmM0hST0NyYkZaUVFmeGtKQ0hSRjdYektsbm5rUkgvVXha?=
 =?utf-8?B?N0YveVBOcEJUSTdTY1JxakU0ZEYvSmhJVTVreGMveWJ4TTRFeFR1OHpzZDdy?=
 =?utf-8?B?Y04wUXRIOXJPVUpXek1hWlZJdXQvMzY1TE1wR3VoUWg5ODd1aWVabVZQMHhK?=
 =?utf-8?B?NkFqYk0raFkxZEFLdDQ4a0YxakJ4MjFmK0FwNHVPanBtdmkzenJ5V0lsdE8x?=
 =?utf-8?B?R016QzBJeW5Kcjhub3ZWaUZnbFk1RnRSTHRMZmozUVRIWEhTQ2hScTBXb2JG?=
 =?utf-8?Q?Gz1oz6p1ezuaNYSw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E9DA7570A6F1644941F43447179E58D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f59ef5f-8d9b-458e-60f4-08de52be3e49
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 16:10:17.4990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xCeC1nOSb25lAXWjm2Xzfq3vW0j44yNPovsveS3dsp9l7fTtPvMzltlHf05MUF/VJNZSJtSgO14t2YAcwV+JBtrOe3B23nZwfIogEl3dp/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10666

DQoNCk9uIDEzLzAxLzIwMjYgMTg6MDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4wMS4y
MDI2IDE2OjUwLCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+DQo+PiBPbiAxMi8wMS8yMDI2
IDE4OjEzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wMS4yMDI2IDE3OjEwLCBPbGVr
c2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4gT24gMTIvMDEvMjAyNiAxNzo1NiwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAxMi4wMS4yMDI2IDE2OjU0LCBPbGVrc2lpIE1vaXNpZWlldiB3
cm90ZToNCj4+Pj4+PiBPbiAxMi8wMS8yMDI2IDE3OjQwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4+Pj4gT24gMTIuMDEuMjAyNiAxNjoxNiwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+Pj4+
Pj4+PiBPbiAwNi8xMS8yMDI1IDEyOjA5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+PiBP
biAwMS4xMS4yMDI1IDEyOjU2LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4+Pj4+Pj4g
QEAgLTgyNyw3ICs4MjgsMzIgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQ0KPj4+Pj4+Pj4+PiAgICAgICAgICAgY2FzZSBYRU5f
RE9NQ1RMX3Rlc3RfYXNzaWduX2RldmljZToNCj4+Pj4+Pj4+Pj4gICAgICAgICAgIGNhc2UgWEVO
X0RPTUNUTF9kZWFzc2lnbl9kZXZpY2U6DQo+Pj4+Pj4+Pj4+ICAgICAgICAgICBjYXNlIFhFTl9E
T01DVExfZ2V0X2RldmljZV9ncm91cDoNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgaW50IHJldDE7DQo+
Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgLyoNCj4+Pj4+Pj4+Pj4gKyAgICAgICAg
ICogQWRkIGNoYWluZWQgaGFuZGxpbmcgb2YgYXNzaWduZWQgRFQgZGV2aWNlcyB0byBzdXBwb3J0
DQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAqIGFjY2Vzcy1jb250cm9sbGVyIGZ1bmN0aW9uYWxpdHkg
dGhyb3VnaCBTQ0kgZnJhbWV3b3JrLCBzbw0KPj4+Pj4+Pj4+PiArICAgICAgICAgKiBEVCBkZXZp
Y2UgYXNzaWduIHJlcXVlc3QgY2FuIGJlIHBhc3NlZCB0byBGVyBmb3IgcHJvY2Vzc2luZyBhbmQN
Cj4+Pj4+Pj4+Pj4gKyAgICAgICAgICogZW5hYmxpbmcgVk0gYWNjZXNzIHRvIHJlcXVlc3RlZCBk
ZXZpY2UuDQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAqIFRoZSBhY2Nlc3MtY29udHJvbGxlciBEVCBk
ZXZpY2UgcHJvY2Vzc2luZyBpcyBjaGFpbmVkIGJlZm9yZSBJT01NVQ0KPj4+Pj4+Pj4+PiArICAg
ICAgICAgKiBwcm9jZXNzaW5nIHByZXNlcnZpbmcgcmV0dXJuIGNvZGUgYW5kIGV4cGVjdGVkIHRv
IGJlIGV4ZWN1dGVkIGZvcg0KPj4+Pj4+Pj4+PiArICAgICAgICAgKiBhbnkgRFQgZGV2aWNlIHJl
Z2FyZGxlc3MgaWYgRFQgZGV2aWNlIGlzIHByb3RlY3RlZCBieSBJT01NVSBvcg0KPj4+Pj4+Pj4+
PiArICAgICAgICAgKiBub3QgKG9yIElPTU1VIGlzIGRpc2FibGVkKS4NCj4+Pj4+Pj4+Pj4gKyAg
ICAgICAgICovDQo+Pj4+Pj4+Pj4+ICsgICAgICAgIHJldDEgPSBzY2lfZG9fZG9tY3RsKG9wLCBk
LCB1X2RvbWN0bCk7DQo+Pj4+Pj4+Pj4gV2h5IHdvdWxkIHRoaXMgbm90IGJlIHRoZSBpbml0aWFs
aXplciBvZiB0aGUgbmV3IHZhcmlhYmxlPyAoSSBhbHNvIGRvbid0IHRoaW5rDQo+Pj4+Pj4+Pj4g
dGhhdCB3ZSd2ZSBkZWNpZGVkIHRvIHBlcm1pdCB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgYXQgb3Ro
ZXIgdGhhbiB0aGUgdG9wIG9mDQo+Pj4+Pj4+Pj4gc2NvcGVzIG9yIHdpdGhpbiBlLmcuIGEgZm9y
KCkgbG9vcCBjb250cm9sIGNvbnN0cnVjdC4pDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+ICsNCj4+Pj4+
Pj4+Pj4gICAgICAgICAgICAgICByZXQgPSBpb21tdV9kb19kb21jdGwob3AsIGQsIHVfZG9tY3Rs
KTsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgaWYgKCByZXQgPCAwICkNCj4+Pj4+Pj4+Pj4gKyAgICAg
ICAgICAgIHJldHVybiByZXQ7DQo+Pj4+Pj4+Pj4gV2h5IHdvdWxkIHlvdSBpbnZva2UgYm90aCBp
biBhbGwgY2FzZXM/IElmIHNjaV9kb19kb21jdGwoKSBoYW5kbGVkIHRoZSByZXF1ZXN0LA0KPj4+
Pj4+Pj4+IHRoZXJlIGlzbid0IGFueSBwb2ludCBpbiBhbHNvIGludm9raW5nIGlvbW11X2RvX2Rv
bWN0bCgpLCBpcyB0aGVyZT8gT3IgZWxzZSBpcw0KPj4+Pj4+Pj4+IHRoZXJlIG1heWJlIHNvbWUg
Y3J1Y2lhbCBhc3BlY3QgbWlzc2luZyBmcm9tIHRoZSBkZXNjcmlwdGlvbiAob3Igbm90IGV4cGxp
Y2l0DQo+Pj4+Pj4+Pj4gZW5vdWdoIHRoZXJlIGZvciBhIG5vbi1TQ0kgcGVyc29uIGxpa2UgbWUp
Pw0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gQWxzbyB0aGlzIGRvZXNuJ3QgbG9vayB0byBmaXQgdGhl
IGRlc2NyaXB0aW9uIHNheWluZyAiVGhlIFNDSSBhY2Nlc3MtY29udHJvbGxlcg0KPj4+Pj4+Pj4+
IERUIGRldmljZSBwcm9jZXNzaW5nIGlzIGNoYWluZWQgYWZ0ZXIgSU9NTVUgcHJvY2Vzc2luZyAu
Li4iDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+IFdlIGNhbGwgYm90aCBiZWNhdXNlIFNDSSBhbmQgSU9N
TVUgY292ZXIgZGlmZmVyZW50IGNvbmNlcm5zIGFuZCBhIERUDQo+Pj4+Pj4+PiBkZXZpY2UgbWF5
IG5lZWQNCj4+Pj4+Pj4+IGJvdGg6IFNDSSBmb3IgRlctbWVkaWF0ZWQgYWNjZXNzIGNvbnRyb2wg
KHBvd2VyL2Nsb2Nrcy9yZXNldCkgYW5kIElPTU1VDQo+Pj4+Pj4+PiBmb3IgRE1BIGlzb2xhdGlv
bi4NCj4+Pj4+Pj4+IFNDSSByZXR1cm5pbmcgc3VjY2VzcyBkb2VzIG5vdCBtZWFuIHRoZSBJT01N
VSB3b3JrIGlzIHJlZHVuZGFudC4NCj4+Pj4+Pj4gQ2FuIHRoZSBjb21tZW50IHRoZW4gcGxlYXNl
IGJlIHVwZGF0ZWQgdG8gcHJvcGVybHkgY2FsbCBvdXQgdGhpcyBkdWFsDQo+Pj4+Pj4+IHJlcXVp
cmVtZW50Pw0KPj4+Pj4+IFllcywgZm9yIHN1cmUuDQo+Pj4+Pj4+PiAtIHNjaV9kb19kb21jdGwo
KSByZXR1cm5zIC1FTlhJTyB3aGVuIGl0IGhhcyBub3RoaW5nIHRvIGRvIChub24tRFQsIG5vDQo+
Pj4+Pj4+PiBtZWRpYXRvciwgbWVkaWF0b3IgbGFja3MgYXNzaWduIGhvb2spLg0KPj4+Pj4+Pj4g
VGhhdCBpcyB0aGUg4oCcbm90IGhhbmRsZWQgYnkgU0NJ4oCdIHNlbnRpbmVsOyBpbiB0aGF0IGNh
c2UgdGhlIGNvZGUNCj4+Pj4+Pj4+IHByb2NlZWRzIHRvIElPTU1VIG5vcm1hbGx5Lg0KPj4+Pj4+
Pj4gLcKgIFdoZW4gc2NpX2RvX2RvbWN0bCgpIHN1Y2NlZWRzICgwKSwgdGhlIGRldmljZSBtYXkg
c3RpbGwgcmVxdWlyZSBJT01NVQ0KPj4+Pj4+Pj4gcHJvZ3JhbW1pbmcNCj4+Pj4+Pj4+IChlLmcu
LCBEVCBkZXZpY2UgaGFzIGFuIGlvbW11cyBwcm9wZXJ0eSkuIFNraXBwaW5nIGlvbW11X2RvX2Rv
bWN0bCgpDQo+Pj4+Pj4+PiB3b3VsZCBsZWF2ZSBETUEgaXNvbGF0aW9uIHVucHJvZ3JhbW1lZC4N
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBUaGUgZmluYWwgaWYgKHJldDEgIT0gLUVOWElPKSByZXQgPSBy
ZXQxOyBlbnN1cmVzIHRoYXQgaWYgYm90aCBwYXRocyByYW4NCj4+Pj4+Pj4+IGFuZCBJT01NVSBz
dWNjZWVkZWQsDQo+Pj4+Pj4+PiBhbiBTQ0kgZmFpbHVyZSBpcyBzdGlsbCByZXBvcnRlZCB0byB0
aGUgY2FsbGVyLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IERldmljZS10cmVlIGV4YW1wbGVzIHRvIGls
bHVzdHJhdGUgdGhlIGR1YWwgcm9sZXM6DQo+Pj4+Pj4+PiAxLiBBY2Nlc3MtY29udHJvbGxlZCBE
VCBkZXZpY2UgKG5vdCBuZWNlc3NhcmlseSBJT01NVS1wcm90ZWN0ZWQpOg0KPj4+Pj4+Pj4NCj4+
Pj4+Pj4+IGkyYzM6IGkyY0BlNjUwODAwMCB7DQo+Pj4+Pj4+PiAgICAgIMKgwqDCoCBjb21wYXRp
YmxlID0gInJlbmVzYXMscmNhci1nZW4zLWkyYyI7DQo+Pj4+Pj4+PiAgICAgIMKgwqDCoCByZWcg
PSA8MCAweGU2NTA4MDAwIDAgMHg0MD47DQo+Pj4+Pj4+PiAgICAgIMKgwqDCoCBwb3dlci1kb21h
aW5zID0gPCZzY21pX3BkIDU+O8KgwqDCoMKgwqAgLy8gRlctbWFuYWdlZCBwb3dlciBkb21haW4N
Cj4+Pj4+Pj4+ICAgICAgwqDCoMKgIGNsb2NrcyA9IDwmc2NtaV9jbGsgMTI+Ow0KPj4+Pj4+Pj4g
ICAgICDCoMKgwqAgY2xvY2stbmFtZXMgPSAiZmNrIjsNCj4+Pj4+Pj4+ICAgICAgwqDCoMKgIGFj
Y2Vzcy1jb250cm9sbGVycyA9IDwmc2NtaV94ZW4gMD47DQo+Pj4+Pj4+PiAgICAgIMKgwqDCoCAv
LyBubyBpb21tdXMgcHJvcGVydHk6IFNDSSBtYXkgbmVlZCB0byBhdXRob3JpemUvcG93ZXIgdGhp
cyBkZXZpY2U7DQo+Pj4+Pj4+PiBJT01NVSBoYXMgbm90aGluZyB0byBkbw0KPj4+Pj4+Pj4gfTsN
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAyLiBJT01NVS1wcm90ZWN0ZWQgRFQgZGV2aWNlIHRoYXQgc3Rp
bGwgbWF5IG5lZWQgU0NJIG1lZGlhdGlvbjoNCj4+Pj4+Pj4+IHZwdTogdmlkZW9AZTZlZjAwMDAg
ew0KPj4+Pj4+Pj4gICAgICDCoMKgwqAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJjYXItdnB1IjsN
Cj4+Pj4+Pj4+ICAgICAgwqDCoMKgIHJlZyA9IDwwIDB4ZTZlZjAwMDAgMCAweDEwMDAwPjsNCj4+
Pj4+Pj4+ICAgICAgwqDCoMKgIGlvbW11cyA9IDwmaXBtbXUgMCAwPjvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLy8gbmVlZHMgSU9NTVUgbWFwcGluZyBmb3IgRE1BDQo+Pj4+Pj4+PiBpc29sYXRp
b24NCj4+Pj4+Pj4+ICAgICAgwqDCoMKgIHBvd2VyLWRvbWFpbnMgPSA8JnNjbWlfcGQgNz47wqDC
oMKgwqDCoCAvLyBGVy1tYW5hZ2VkIHBvd2VyL2Nsb2NrL3Jlc2V0DQo+Pj4+Pj4+PiAgICAgIMKg
wqDCoCBjbG9ja3MgPSA8JnNjbWlfY2xrIDM0PjsNCj4+Pj4+Pj4+ICAgICAgwqAgwqAgYWNjZXNz
LWNvbnRyb2xsZXJzID0gPCZzY21pX3hlbiAwPjsNCj4+Pj4+Pj4+ICAgICAgwqDCoMKgIGNsb2Nr
LW5hbWVzID0gInZwdSI7DQo+Pj4+Pj4+PiB9Ow0KPj4+Pj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jDQo+Pj4+Pj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMNCj4+Pj4+Pj4+Pj4gQEAgLTM3OSw2ICszNzksMTIg
QEAgaW50IGlvbW11X2RvX2R0X2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1
Y3QgZG9tYWluICpkLA0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICBicmVhazsNCj4+Pj4+
Pj4+Pj4gICAgICAgICAgICAgICB9DQo+Pj4+Pj4+Pj4+ICAgICAgIA0KPj4+Pj4+Pj4+PiArICAg
ICAgICBpZiAoICFkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKGRldikgKQ0KPj4+Pj4+Pj4+PiArICAg
ICAgICB7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICByZXQgPSAwOw0KPj4+Pj4+Pj4+PiArICAg
ICAgICAgICAgYnJlYWs7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgIH0NCj4+Pj4+Pj4+Pj4gKw0KPj4+
Pj4+Pj4+PiAgICAgICAgICAgICAgIHJldCA9IGlvbW11X2Fzc2lnbl9kdF9kZXZpY2UoZCwgZGV2
KTsNCj4+Pj4+Pj4+Pj4gICAgICAgDQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgaWYgKCByZXQg
KQ0KPj4+Pj4+Pj4+IEhvdyBhcmUgRFQgYW5kIFBDSSBkaWZmZXJlbnQgaW4gdGhpcyByZWdhcmQ/
DQo+Pj4+Pj4+PiBQbGVhc2UgZmluZCBleGFtcGxlcyBhYm92ZS4NCj4+Pj4+Pj4gU29ycnksIGJ1
dCBJIGNhbid0IHNwb3QgYW55dGhpbmcgUENJLWlzaCBpbiB0aGUgZXhhbXBsZXMgYWJvdmUuIFRo
ZW4gYWdhaW4gSQ0KPj4+Pj4+PiBhbHNvIG5vIGxvbmdlciByZWNhbGwgd2h5IEkgY29tcGFyZWQg
d2l0aCBQQ0kgaGVyZS4gT2gsIHBlcmhhcHMgYmVjYXVzZSB0aGUNCj4+Pj4+Pj4gUENJIHNpZGUg
aXNuJ3QgYmVpbmcgbW9kaWZpZWQgYXQgYWxsLg0KPj4+Pj4+Pg0KPj4+Pj4+IENvcnJlY3QsIHBj
aSBjb2RlIHdhc24ndCB0b3VjaGVkIGJ5IHRoZXNlIGNoYW5nZXMuDQo+Pj4+PiBZZXQgbXkgcXVl
c3Rpb24gYm9pbHMgZG93biB0byAid2h5Iiwgbm90ICJ3aGV0aGVyIi4NCj4+Pj4+DQo+Pj4+IEkg
aGF2ZSByZXZpZXdlZCB0aGUgcHJldmlvdXMgdmVyc2lvbnMgb2YgdGhlIHBhdGNoIHNlcmllIGFu
ZCBjb3VsZCBub3QNCj4+Pj4gZmluZCBhbnkgcXVlc3Rpb25zIHJlbGF0ZWQgdG8gUENJIHByaW9y
IHRvIHRoaXMgc2VyaWVzLiBUaGVyZWZvcmUsICJIb3cNCj4+Pj4gYXJlIERUIGFuZCBQQ0kgZGlm
ZmVyZW50IGluIHRoaXMgcmVnYXJkPyIgYXBwZWFycyB0byBiZSB0aGUgZmlyc3QNCj4+Pj4gcXVl
c3Rpb24gY29uY2VybmluZyBQQ0kuDQo+Pj4gUXVpdGUgcG9zc2libGUsIHlldCBkb2VzIHRoYXQg
c29tZWhvdyBlbGltaW5hdGUgdGhlIG5lZWQgdG8gYWRkcmVzcyBpdD8gSSdtDQo+Pj4gdHJ5aW5n
IHRvIHVuZGVyc3RhbmQgd2h5IHRoZSByZXNwZWN0aXZlIFBDSSBjb2RlIGlzbid0IGJlaW5nIHRv
dWNoZWQuDQo+Pj4NCj4+IFhFTl9ET01DVExfYXNzaWduX2RldmljZSBkaXNwYXRjaDogd2Ugbm93
IGNoYWluIHNjaV9kb19kb21jdGwgZmlyc3QsDQo+PiB0aGVuIGlvbW11X2RvX2RvbWN0bC4NCj4+
IGlvbW11X2RvX2RvbWN0bCBmaXJzdCB0cmllcyBpb21tdV9kb19wY2lfZG9tY3RsICh3aGVuIENP
TkZJR19IQVNfUENJKQ0KPj4gYW5kIGZhbGxzIGJhY2sgdG8gaW9tbXVfZG9fZHRfZG9tY3RsIG9u
bHkgaWYgUENJIHJldHVybnMgLUVOT0RFVi4NCj4+IFRoZSBuZXcgZHRfZGV2aWNlX2lzX3Byb3Rl
Y3RlZCgpIGJ5cGFzcyBpbiBpb21tdV9kb19kdF9kb21jdGwgb25seQ0KPj4gYXBwbGllcyB0byBE
VC1kZXNjcmliZWQgZGV2aWNlczsgU0NJIHBhcmFtZXRlcnMgYXJlIGNhcnJpZWQgdmlhIERUIG5v
ZGVzLg0KPj4gUENJIGRldmljZXMgaGFuZGxlZCBieSBpb21tdV9kb19wY2lfZG9tY3RsIGRvIG5v
dCBjYXJyeSBEVC9TQ0kgbWV0YWRhdGENCj4+IGluIHRoaXMgcGF0aCwgc28gdGhlcmUgaXMgbm8g
bm90aW9uIG9mIOKAnFNDSSBwYXJhbWV0ZXJzIG9uIGENCj4+IG5vbi1JT01NVS1wcm90ZWN0ZWQg
UENJIGRldmljZeKAnSBmb3IgaXQgdG8gaW50ZXJwcmV0IG9yIHRvIHNraXAuIFRoZSBQQ0kNCj4+
IHBhdGggc2hvdWxkIGNvbnRpbnVlIHRvIHJlcG9ydCBlcnJvcnMgaWYgYXNzaWdubWVudCBjYW5u
b3QgYmUgcGVyZm9ybWVkDQo+PiBieSB0aGUgSU9NTVUgbGF5ZXIuDQo+PiBTbyB3ZSBzaG91bGQg
bGVhdmUgaW9tbXVfZG9fcGNpX2RvbWN0bCB1bmNoYW5nZWQ7IHRoZSBTQ0kvRFQtc3BlY2lmaWMN
Cj4+IHJlbGF4YXRpb25zIGJlbG9uZyBvbmx5IGluIHRoZSBEVCBwYXRoLg0KPj4gQWxzb8KgIFND
SSBoYW5kbGluZyBvbmx5IGV4aXN0cyB3aGVuIERUIGlzIHByZXNlbnQuDQo+IENhbiBhbiBhYnJp
ZGdlZCB2YXJpYW50IG9mIHRoaXMgcGxlYXNlIGJlIGFkZGVkIHRvIHRoZSBkZXNjcmlwdGlvbj8N
Cj4NCj4gSmFuDQpTdXJlLiBJIHdpbGwgYWRkIHRoaXMgdG8gY29tbWl0IGRlc2NyaXB0aW9uLg0K
DQpPbGVrc2lpLg0K


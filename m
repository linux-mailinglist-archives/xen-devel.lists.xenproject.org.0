Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91559B00E8B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 00:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039908.1411471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZzVB-0001d2-7T; Thu, 10 Jul 2025 22:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039908.1411471; Thu, 10 Jul 2025 22:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZzVB-0001bb-4c; Thu, 10 Jul 2025 22:12:25 +0000
Received: by outflank-mailman (input) for mailman id 1039908;
 Thu, 10 Jul 2025 22:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63eF=ZX=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZzV9-0001bP-7O
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 22:12:23 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f38cdffd-5dda-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 00:12:22 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM7PR03MB6564.eurprd03.prod.outlook.com (2603:10a6:20b:1c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 22:12:20 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 22:12:20 +0000
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
X-Inumbo-ID: f38cdffd-5dda-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1QMtmx3Eu1iMiREKd3Xr5LZPazWrjCMVQaswcVtj5zea2Mw2WLTyxv/UeKT/cvu3AJojcioLl5p+iRHfBLIT8y8kWYZZbHzM5LkEM9++YtRfIKyMfiIjeht1vlkOjZThcdraZyyVTPQnb7IJVXNtbRDrZTLJ30FLPiezWiCwVWuRbVyqrpp54HcJPAn/mcozZs5OnzM13twT/2i9Ir9CrNY/nJilbVTawYTAM3p9V1sI5FJ9vIJpv0zfKQUgmQGiHdU8ejEsXTNYFCA9dWVkoh57FDMJKoYV8wDXhXcrvzKSXeawH+rGsH/9K7PIWuCnNW8S69T48O/4mCmq2TOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzN/iZXMotiBI1KGgaypSDma7HaiMCyUBdyzS1vQ4es=;
 b=dDEUDTie5+1zfdq2Id1jKsH6r+25sJlmyF+RC92RcFuaEQqKq0J9XcTl7nxVIij8rF1tFQsfnre+2O17JppI7yjwnJQFvbI+gNmDVj0Iv6Lv5HOaqrXTXJBp80IRkFYE9/kyTg+Lra1gp0W/qSMM9MSDUGChIZ+S0yin7e6L6PUPAhl6EKfKXrv7vRAL9CfhYwwzFngmZAeJETE5EoFSV/veU8jt5v2RC07Bk2L1YZ49TVtLB67uE0VwY0PFzNcDL6Ocl8K/6GN1Otawk4Gz1AV/9bSc1uONHlTBMzx8XnssIKqD5bC5CmQmvTkT5uGp0rVxEfgRhyFugPTP6OW8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzN/iZXMotiBI1KGgaypSDma7HaiMCyUBdyzS1vQ4es=;
 b=uZdu5N3EvivRirq4oRvIcXcHHIeLjZLi6/QLlphTPH9SXohjNisfTk8lCym7ZstEv6nZb2VAl2SMhaTTsCxQoGrDhr0z92K+Kb+6jvlsO87gyt1bCB32WYWIgnym2cyFLbBoJgHIYvg7J2E1ZKToia01bV2IShypkBlcn53ufPZU4uv0+K9s03VxRBAegTzBqtOFM5oI2Sne2FL7SnkeF9TcwE3ld7oGCfAhDlEdqLm4Zn3h82k1iEowsPzT7Ozfi8g2cx5M4D6xqmOaFD6nxQ9XpnqeUrm8f4FrEI2YCJzOQn6bNJ9cW+nwJYHlpjU3oKlaXnurvyRRuSpGv6jwHA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [XEN PATCH] xen/arm: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH] xen/arm: address violation of MISRA C Rule 10.1
Thread-Index: AQHb8eeDdIb8PsAFg0eJMVAybu7FMbQr65iA
Date: Thu, 10 Jul 2025 22:12:20 +0000
Message-ID: <eda4ec66-d2cd-48d7-95a8-c8f5ee086448@epam.com>
References:
 <d92cf08a64d8197a1d1a45f901e59183105d3da5.1752183472.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <d92cf08a64d8197a1d1a45f901e59183105d3da5.1752183472.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM7PR03MB6564:EE_
x-ms-office365-filtering-correlation-id: b90fefcf-9474-4472-a944-08ddbffed6ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFM3dHRiMTBPSEJMS2tBTExGYU1xS2dBTFlZSVZ1Rk9oRHhBTU5pNFJTcXpT?=
 =?utf-8?B?bzlrVWlmS2Y4L2xScVNVUDhkZ0dockRRQ1dnTE5kUnYxWGNmc3I0T0k1bEc2?=
 =?utf-8?B?dHFuZHppTTdPNFVTWHp2RXpJMTZ2dHk0U0UvRzdSMlN2QkNDRVBXOWQ5Q21O?=
 =?utf-8?B?VkR0L01ZbHIxK0xlMytLTTNXeEh6c0d3MUtZR0ZrdVRCVitudDJNVE1pUmJH?=
 =?utf-8?B?V2E1eUNaTzJjNGNUdll0ZEFDNVprREJHNlNIM3BhUTg2VjNNWlUyK2JVdUsx?=
 =?utf-8?B?R0wzbVo5N1RwM2ZoTTZhSVo2Rm1zNklHOVowZk8zM1lCdUJ4cE5QKzdtblBV?=
 =?utf-8?B?OFRmZ0drRWRYdlJWd1ROMmRTWDZWN0tkTTFHYnZoOU8wQ2EvTWoxV1NoTStk?=
 =?utf-8?B?ZzRGQkFocXRwQmxESUxpSjhhSVRYa0gxWkNzMU05WW5pdVlQRUkwNHIxQjZY?=
 =?utf-8?B?TEQzemZ0VG02QjlMNlRsWjJaWFFVMER6cnNabWNjY3EwMDdnV1N2L291aElx?=
 =?utf-8?B?Q0NjTkNGVGovMVpiSml3bEQ3S2xDNjROeFl0cFg2cXVkTUUzYldKTFBOVFNV?=
 =?utf-8?B?QmtXelJyZGhzeWNZUDlMU2htVkIvTVR1eUtmV1BMQkhwNEhHb0o4MWVEamRN?=
 =?utf-8?B?VTA2VnRJRDFVdE1pV1RUaFJUcEs2YnNtWGxHNkU5aDdNWkg5L0FXSkRLVEE0?=
 =?utf-8?B?Sy9xOTZJL0xOWEtVWWFpbE51d09adjhPM0VBNVZwN3V0L1NlR3l4UmZNc2VI?=
 =?utf-8?B?UDNCRFVWdHBBZUtUNlpJbUhTZFN5OGZRT1pjaVowTW4yNDhpTVd3ZnJ2L3N6?=
 =?utf-8?B?OUp4bkt0UEFoMDZnWGxscnQ0M0Q2SzJWeWVUTjUzMlppM3ArQ29obklVcFAw?=
 =?utf-8?B?NGJjRkdyRWdzejNxd1gxR0Z0Y3RXc3FEV2VsSDA4Uk10c3pndjZ3QlNRMjdv?=
 =?utf-8?B?UTA2STlGNElFdzltNnlsL1NzcTVNY096S1ZHd2JJMlNsT1lxTHY1ZXhXS0hj?=
 =?utf-8?B?NWpFbWZWRmJBVFFuREhNQ3BCZW9qOWdzelQyWkxac1d0bzk1SUZPNFJaSGVy?=
 =?utf-8?B?SXJsaDFPUVFVOW1oRzdoMXFKOGtvbWtxVURMWkFWNWJqMnd6Rm9vL2JwSVRL?=
 =?utf-8?B?alhRbmJjS2RpbElZZ2VvS2daQ05STmNnWXdlalVGUzFRRlhxVHozYXVJN0NO?=
 =?utf-8?B?UzdoVGJ1WTNjMStTU3RGUi9CcHJaVWJCblpzVFVsQ2VyMzdDMkZQV2pUZ3ln?=
 =?utf-8?B?N0NtckYyTmYyMHVaZEd2ak5xWFVVN1NqaTF5ckhDNXdOTjY2SzhvRXdtdU4y?=
 =?utf-8?B?MTU4Uk53TWNEL2hBblV3bUlRMUpPR0RYS0JTUHlhUE5QdE1wM0Q0Yll6WnlB?=
 =?utf-8?B?RGVCVjE3NDFaOGRZV2ZuMnVYQlRxOUtBNXJDNDNqNHI3YUNqWk52eEdGM2h1?=
 =?utf-8?B?YVJCa1ZpMW01SlE0NGh0TFlXTTZwaEZSV0xwTTI0YlA1SEZpTkZNc045Ny9j?=
 =?utf-8?B?aHg3L1F6MXZ2RFgya0RCZmJrVWt0R3pQd2VhMGN6WW1TVXNsa1hHWGw3MStI?=
 =?utf-8?B?Q2t4Z1ZjOXNjZzFVV1V4bGhlaTV2U2lZeW9WSlZZVnB3eEwwOFV1ZXdZdFE1?=
 =?utf-8?B?YzJtMUhreGF4ZDYwQWxzTEdxZ2VuQ3JXZ3lKd09VU0tuMkZuMkJNeHpsS3Fr?=
 =?utf-8?B?TE1Oc0tYVlB0SlcwTERQRTVTZG9IMDNaMG5nbWFKWkpnL0xpTDdkcWlZM01M?=
 =?utf-8?B?dFVYNmpqVVA4bGx1NW1Ya2cxN2NVVFYwdVVKaTY3aytUek9WRTY1VWhiT3pF?=
 =?utf-8?B?dGo2aFVHUHd6bmZieHE5U3NMOTFjWXFqci8xeDhCbEJmTFZEM3o3M0ZKV3hu?=
 =?utf-8?B?QTIxdXUzS0RCS1NqZ24yUCtENWV1VC9ZNVlTZ2FYOEVxQjRZRkVETW1UVjZO?=
 =?utf-8?B?V2dLdEVITTdHOWQ1SjdHTzQ3Ymx0OHJrZmxubG5EL0ZKZzdqdk16MWlaSmsz?=
 =?utf-8?Q?n/kB5Lr8e7Zc6s4ti8RggYW/MndHpM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2RYeGk5TWl5Tkc4ejlJMkpPbERHWWo4NHAzSmpXZHZWd0FueDEzOHRZT3Fm?=
 =?utf-8?B?SWg4NlowdUx4ajJmSGdxbHA3eGp4Q2dKdjF2L3VnK1RSdmhwc0dtbVBjRWRN?=
 =?utf-8?B?dTRzVFRubU14dEx4Y21zd0N0OEdsN0EzTkwrSlZjRzE2dFJrbmdoOHJnbWNB?=
 =?utf-8?B?ZkZXQjZuTVcwZ0NJY1lROCtxT2NCYm9uOU1Fa21DN0JqNzhwWXhlOVhGSXl6?=
 =?utf-8?B?cDN2M0NUZmxjbGVwalA2VUdVYzJlam9OYmU4cW9ueVRvVU55NTA2c3Q3eDQ3?=
 =?utf-8?B?QzR6TjE5b0dLSldtUlVSc2FYVmpCbXN6OWtLWjU1aFdHb2Q4cko2YzU4S25E?=
 =?utf-8?B?b242bFNwVEpLNng1TWRTRUZtcWFvZ2NFcjU4dm15ZnRLeXMvd0xRbE1Fekx1?=
 =?utf-8?B?M2tNdm9oN3h1MFQzYTBKeUorLzdUTlJaTzMxM1NSNktGbGdoSTFBbWlMUkY5?=
 =?utf-8?B?MXZiUW9xZ2VUSDJibjY5ZExkSGVkMy85V0U2SVBpWXNtZEFpbUQ5blFidlR6?=
 =?utf-8?B?ZUYrdWFJRVlOY1NyQ3ZWNytRZHdqZDA5bVpuakM2Sk1iSVFsVENndnNIazU5?=
 =?utf-8?B?dTBvMUpoYzR0VWJVUytKZUk3bzYreTFka3JSdmZxVlpMN2pYRDJDc2JnSzZF?=
 =?utf-8?B?dVNDVzlySVpLMXVVSnFzdFdTUjRhYmJpeTJRY0Y1QVVEQUtyR00yTDFUbmlL?=
 =?utf-8?B?Z0pYb1B1UTNTdCs0WnpJazR3WEw3M3MwMDdCdHl0Vm1icUtJdkN5cUcrR3BS?=
 =?utf-8?B?bUNUZGNmenAzVmdVWmV1VktVNzZCdmIxZ1BNSnQrN3BWZXd6TkExTkE1YVl6?=
 =?utf-8?B?M2RJeW1uY3dlallGZ3RyVTh1aVNmcnkrVTR6cm5oeEd2aitubUZnbWpiejB5?=
 =?utf-8?B?MG91WVRxd0dqeG1SY0NzWElmMEg5d1kxQXc2dlBGTnVsODU2L1dHSVF0blB6?=
 =?utf-8?B?M3c1YkhSMkVjSEFRTSttZ0RwQldodi9zSE9YaHJ4K0lkMlNVaE9lVCtGelVJ?=
 =?utf-8?B?YkJCNkkxSllxdDRpZFZnMnBkbkoxTjRVN1BWTGVXRVgvczZ2NUtDRHUzVHRa?=
 =?utf-8?B?WXc1Y3R3OU1CTk5maFZrMDNiRXpLNENpQmwzK29EY2EweTBxdG1VOGFmSTFN?=
 =?utf-8?B?bE5yQmZqZTkzaXJtL3dTUVdnL0YxMTIxNnhjM01YVXJZQ1JlKzB3NkJiMEk3?=
 =?utf-8?B?SVRJdFY3TGRQRlhINHVMajdwcGlHV0pUaDJOblNsOHV2c1lDRzZKY2IvZUxX?=
 =?utf-8?B?d3REK3J4UU5zOUJKc3BuR2krRWxJRUxHYm5tSEtEUjB2M1Z1U1FxSU9HbFhs?=
 =?utf-8?B?NEs4MjRpWmk1MEo1SG83a1h2YXBHajZqQUhkdFpwK1ltRE1mMlRMcjFBMUFn?=
 =?utf-8?B?ZjQ3Wk9LYjBaUTlTcmtNMTBkVUhJdnhnZEU3NFBmbVo4WjVsdlk4ZVdVUkVU?=
 =?utf-8?B?Z2x6SGwxcy9BTUw5bzZKam1OOXJlTWwxR0o0Z04yS2tJR0l0OWVGcWxEb2V5?=
 =?utf-8?B?SjJ0cGkwcVlGRUd6MkxvMnhNYzMzdVdEeURibFZaZDYxZHUzRmxyTVJUUlpu?=
 =?utf-8?B?cklmMHpmRjVyMFlDeGU1V2s1SXRCeEl0WEMvbXVnQ1R5TGs4R2tmazdwRStz?=
 =?utf-8?B?TSt1M0xtNXdIb3ZkTjNDWG9oc0RkZ1dEWHdleGdFVHBCYUdFK080d0x3QmhD?=
 =?utf-8?B?bXozTjZCMDYxcHp1eWpzVU02bk9Ia1EwYnVLdVRNMjZvcUVYVjFrdnpGRVhH?=
 =?utf-8?B?SjE4bFZvY0FmZkNlTGpaNFkzekl6ZjFLNGZGMXhPcW1SNGpudjJWa1BhSTc3?=
 =?utf-8?B?bzYrQjM2SkFzK3F3V0tpeC9TRzJDS29NRkNwQ0tibnIvS0FpU1dCa21ZK1ho?=
 =?utf-8?B?Q1grRmx3RFltTm9lSkZlV1ZteUdnYnpmU1ArMGN6dXF2SEEyc3dreDZ6bEgr?=
 =?utf-8?B?OFo3TnNORlFlYUVGS3JobFlmdzVXbjJ5Si92MVFEWVZ5c294a2ZleXFlUDVa?=
 =?utf-8?B?eDdPK1FLVlF4R3RGTUpHemFnTTQ0T0NaMnc1Q3J2L1FXSUlhdTVmV3pVckJq?=
 =?utf-8?B?bHJxZ2tUOXVobW92aDVSUmkvbW1WSHBLR3JiZmRGcnlycnpnaG9tUitTZGdY?=
 =?utf-8?B?OUJJSzR0UVJhaG53SXRISmpkbFJUVjZ3WmRnVDJZcHJaVUNhM2xvZnk1djkz?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9891D74AABEAE459A6C0F570BD317F3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90fefcf-9474-4472-a944-08ddbffed6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 22:12:20.2532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxRFfIKgWAFpd22bW96BNSE9YvPivys23poSAHy1X6Uz1qvQy3qcTm1LthEJs1pvgO/NEDFrwsPVOYCAtMykK00xII/nqWPVlt0aeFeiIdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6564

Q0kgdGVzdHM6DQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtw
NGsveGVuLy0vcGlwZWxpbmVzLzE5MTk2ODc0OTYNCg0KT24gNy8xMS8yNSAwMToxMCwgRG15dHJv
IFByb2tvcGNodWsxIHdyb3RlOg0KPiBSdWxlIDEwLjE6IE9wZXJhbmRzIHNoYWxsIG5vdCBiZSBv
ZiBhbg0KPiBpbmFwcHJvcHJpYXRlIGVzc2VudGlhbCB0eXBlDQo+IA0KPiBUaGUgZm9sbG93aW5n
IGFyZSBub24tY29tcGxpYW50Og0KPiAtIHVuYXJ5IG1pbnVzIG9uIHVuc2lnbmVkIHR5cGU7DQo+
IC0gYm9vbGVhbiB1c2VkIGFzIGEgbnVtZXJpYyB2YWx1ZS4NCj4gDQo+IFJlcGxhY2UgdW5hcnkg
Jy0nIG9wZXJhdG9yIHdpdGggbXVsdGlwbHlpbmcgYnkgJy0xTCcgb3IgJy0xTEwnLg0KPiBSZXBs
YWNlIG51bWVyaWMgY29uc3RhbnQgJy0xVUwnIHdpdGggJ34wVUwnLg0KPiBSZXBsYWNlIG51bWVy
aWMgY29uc3RhbnQgJy0xVUxMJyB3aXRoICd+MFVMTCcuDQo+IENhc3QgYm9vbGVhbiB0byBudW1l
cmljIHZhbHVlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRy
b19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCj4gLS0tDQo+ICAgeGVuL2FyY2gvYXJtL2dpYy12Z2lj
LmMgICAgICAgICAgICAgICB8IDIgKy0NCj4gICB4ZW4vY29tbW9uL21lbW9yeS5jICAgICAgICAg
ICAgICAgICAgIHwgMiArLQ0KPiAgIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jICAgICAgICAgICAg
ICAgfCA2ICsrKy0tLQ0KPiAgIHhlbi9jb21tb24vdGltZS5jICAgICAgICAgICAgICAgICAgICAg
fCAyICstDQo+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYyB8IDIgKy0N
Cj4gICB4ZW4vbGliL3N0cnRvbC5jICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgIHhl
bi9saWIvc3RydG9sbC5jICAgICAgICAgICAgICAgICAgICAgfCAyICstDQo+ICAgNyBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYw0KPiBp
bmRleCBlYTQ4YzUzNzVhLi5hMzVmMzNjNWYyIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0v
Z2ljLXZnaWMuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYw0KPiBAQCAtMTcsNyAr
MTcsNyBAQA0KPiAgICNpbmNsdWRlIDxhc20vdmdpYy5oPg0KPiAgIA0KPiAgICNkZWZpbmUgbHJf
YWxsX2Z1bGwoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
IC0gICAgKHRoaXNfY3B1KGxyX21hc2spID09ICgtMVVMTCA+PiAoNjQgLSBnaWNfZ2V0X25yX2xy
cygpKSkpDQo+ICsgICAgKHRoaXNfY3B1KGxyX21hc2spID09ICh+MFVMTCA+PiAoNjQgLSBnaWNf
Z2V0X25yX2xycygpKSkpDQo+ICAgDQo+ICAgI3VuZGVmIEdJQ19ERUJVRw0KPiAgIA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9tZW1vcnkuYyBiL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gaW5k
ZXggNDY2MjBlZDgyNS4uOTYwODY3MDRjYiAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9tZW1v
cnkuYw0KPiArKysgYi94ZW4vY29tbW9uL21lbW9yeS5jDQo+IEBAIC03NzMsNyArNzczLDcgQEAg
c3RhdGljIGxvbmcgbWVtb3J5X2V4Y2hhbmdlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21l
bW9yeV9leGNoYW5nZV90KSBhcmcpDQo+ICAgDQo+ICAgICAgICAgICAgICAgICAgIG5yc3Bpbl9s
b2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOw0KPiAgICAgICAgICAgICAgICAgICBkcm9wX2RvbV9y
ZWYgPSAoZGVjX2NvdW50ICYmDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFk
b21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAtZGVjX2NvdW50KSk7DQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICFkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAoLTFMKSAqIGRl
Y19jb3VudCkpOw0KPiAgICAgICAgICAgICAgICAgICBucnNwaW5fdW5sb2NrKCZkLT5wYWdlX2Fs
bG9jX2xvY2spOw0KPiAgIA0KPiAgICAgICAgICAgICAgICAgICBpZiAoIGRyb3BfZG9tX3JlZiAp
DQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jDQo+IGluZGV4IDhmOTNhNGMzNTQuLmRhOGRkZGY5MzQgMTAwNjQ0DQo+IC0tLSBh
L3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
DQo+IEBAIC02OTEsNyArNjkxLDcgQEAgc2l6ZV9wYXJhbSgibG93X21lbV92aXJxX2xpbWl0Iiwg
b3B0X2xvd19tZW1fdmlycSk7DQo+ICAgLyogVGhyZXNob2xkcyB0byBjb250cm9sIGh5c3RlcmVz
aXMuIEluIHBhZ2VzICovDQo+ICAgLyogV2hlbiBtZW1vcnkgZ3Jvd3MgYWJvdmUgdGhpcyB0aHJl
c2hvbGQsIHJlc2V0IGh5c3RlcmVzaXMuDQo+ICAgICogLTEgaW5pdGlhbGx5IHRvIG5vdCByZXNl
dCB1bnRpbCBhdCBsZWFzdCBvbmUgdmlycSBpc3N1ZWQuICovDQo+IC1zdGF0aWMgdW5zaWduZWQg
bG9uZyBsb3dfbWVtX3ZpcnFfaGlnaCAgICAgID0gLTFVTDsNCj4gK3N0YXRpYyB1bnNpZ25lZCBs
b25nIGxvd19tZW1fdmlycV9oaWdoICAgICAgPSB+MFVMOw0KPiAgIC8qIFRocmVzaG9sZCBhdCB3
aGljaCB3ZSBpc3N1ZSB2aXJxICovDQo+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbG93X21lbV92
aXJxX3RoICAgICAgICA9IDA7DQo+ICAgLyogT3JpZ2luYWwgdGhyZXNob2xkIGFmdGVyIGFsbCBj
aGVja3MgY29tcGxldGVkICovDQo+IEBAIC03MTAsNyArNzEwLDcgQEAgc3RhdGljIHZvaWQgX19p
bml0IHNldHVwX2xvd19tZW1fdmlycSh2b2lkKQ0KPiAgICAgICAgKiB0byBldmVyIHRyaWdnZXIu
ICovDQo+ICAgICAgIGlmICggb3B0X2xvd19tZW1fdmlycSA9PSAwICkNCj4gICAgICAgew0KPiAt
ICAgICAgICBsb3dfbWVtX3ZpcnFfdGggPSAtMVVMOw0KPiArICAgICAgICBsb3dfbWVtX3ZpcnFf
dGggPSB+MFVMOw0KPiAgICAgICAgICAgcmV0dXJuOw0KPiAgICAgICB9DQo+ICAgDQo+IEBAIC03
NzgsNyArNzc4LDcgQEAgc3RhdGljIHZvaWQgY2hlY2tfbG93X21lbV92aXJxKHZvaWQpDQo+ICAg
ICAgICAgICBsb3dfbWVtX3ZpcnFfdGhfb3JkZXIrKzsNCj4gICAgICAgICAgIGxvd19tZW1fdmly
cV90aCA9IDFVTCA8PCBsb3dfbWVtX3ZpcnFfdGhfb3JkZXI7DQo+ICAgICAgICAgICBpZiAoIGxv
d19tZW1fdmlycV90aCA9PSBsb3dfbWVtX3ZpcnFfb3JpZyApDQo+IC0gICAgICAgICAgICBsb3df
bWVtX3ZpcnFfaGlnaCA9IC0xVUw7DQo+ICsgICAgICAgICAgICBsb3dfbWVtX3ZpcnFfaGlnaCA9
IH4wVUw7DQo+ICAgICAgICAgICBlbHNlDQo+ICAgICAgICAgICAgICAgbG93X21lbV92aXJxX2hp
Z2ggPSAxVUwgPDwgKGxvd19tZW1fdmlycV90aF9vcmRlciArIDIpOw0KPiAgICAgICB9DQo+IGRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL3RpbWUuYyBiL3hlbi9jb21tb24vdGltZS5jDQo+IGluZGV4
IDkyZjdiNzI0NjQuLmE2ZWRhODJmOGQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vdGltZS5j
DQo+ICsrKyBiL3hlbi9jb21tb24vdGltZS5jDQo+IEBAIC04NCw3ICs4NCw3IEBAIHN0cnVjdCB0
bSBnbXRpbWUodW5zaWduZWQgbG9uZyB0KQ0KPiAgICAgICB9DQo+ICAgICAgIHRidWYudG1feWVh
ciA9IHkgLSAxOTAwOw0KPiAgICAgICB0YnVmLnRtX3lkYXkgPSBkYXlzOw0KPiAtICAgIGlwID0g
KGNvbnN0IHVuc2lnbmVkIHNob3J0IGludCAqKV9fbW9uX2xlbmd0aHNbX19pc2xlYXAoeSldOw0K
PiArICAgIGlwID0gKGNvbnN0IHVuc2lnbmVkIHNob3J0IGludCAqKV9fbW9uX2xlbmd0aHNbKGlu
dClfX2lzbGVhcCh5KV07DQo+ICAgICAgIGZvciAoIHkgPSAwOyBkYXlzID49IGlwW3ldOyArK3kg
KQ0KPiAgICAgICAgICAgZGF5cyAtPSBpcFt5XTsNCj4gICAgICAgdGJ1Zi50bV9tb24gPSB5Ow0K
PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4gaW5kZXggZGYxNjIzNTA1Ny4u
NDA1OGIxOGYyYyAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3Nt
bXUtdjMuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQo+
IEBAIC0zMTUsNyArMzE1LDcgQEAgc3RhdGljIGludCBxdWV1ZV9wb2xsX2NvbnMoc3RydWN0IGFy
bV9zbW11X3F1ZXVlICpxLCBib29sIHN5bmMsIGJvb2wgd2ZlKQ0KPiAgIA0KPiAgIAl3aGlsZSAo
cXVldWVfc3luY19jb25zX2luKHEpLA0KPiAgIAkgICAgICAoc3luYyA/ICFxdWV1ZV9lbXB0eSgm
cS0+bGxxKSA6IHF1ZXVlX2Z1bGwoJnEtPmxscSkpKSB7DQo+IC0JCWlmICgoTk9XKCkgPiB0aW1l
b3V0KSA+IDApDQo+ICsJCWlmIChOT1coKSA+IHRpbWVvdXQpDQo+ICAgCQkJcmV0dXJuIC1FVElN
RURPVVQ7DQo+ICAgDQo+ICAgCQlpZiAod2ZlKSB7DQo+IGRpZmYgLS1naXQgYS94ZW4vbGliL3N0
cnRvbC5jIGIveGVuL2xpYi9zdHJ0b2wuYw0KPiBpbmRleCAzMGRjYTc3OWNmLi41ZjlkNjkxNzI3
IDEwMDY0NA0KPiAtLS0gYS94ZW4vbGliL3N0cnRvbC5jDQo+ICsrKyBiL3hlbi9saWIvc3RydG9s
LmMNCj4gQEAgLTEzLDcgKzEzLDcgQEANCj4gICBsb25nIHNpbXBsZV9zdHJ0b2woY29uc3QgY2hh
ciAqY3AsIGNvbnN0IGNoYXIgKiplbmRwLCB1bnNpZ25lZCBpbnQgYmFzZSkNCj4gICB7DQo+ICAg
ICAgIGlmICggKmNwID09ICctJyApDQo+IC0gICAgICAgIHJldHVybiAtc2ltcGxlX3N0cnRvdWwo
Y3AgKyAxLCBlbmRwLCBiYXNlKTsNCj4gKyAgICAgICAgcmV0dXJuICgtMUwpICogc2ltcGxlX3N0
cnRvdWwoY3AgKyAxLCBlbmRwLCBiYXNlKTsNCj4gICAgICAgcmV0dXJuIHNpbXBsZV9zdHJ0b3Vs
KGNwLCBlbmRwLCBiYXNlKTsNCj4gICB9DQo+ICAgDQo+IGRpZmYgLS1naXQgYS94ZW4vbGliL3N0
cnRvbGwuYyBiL3hlbi9saWIvc3RydG9sbC5jDQo+IGluZGV4IDVkMjNmZDgwZTguLmU4NzAwN2Vk
ZGQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9saWIvc3RydG9sbC5jDQo+ICsrKyBiL3hlbi9saWIvc3Ry
dG9sbC5jDQo+IEBAIC0xMyw3ICsxMyw3IEBADQo+ICAgbG9uZyBsb25nIHNpbXBsZV9zdHJ0b2xs
KGNvbnN0IGNoYXIgKmNwLCBjb25zdCBjaGFyICoqZW5kcCwgdW5zaWduZWQgaW50IGJhc2UpDQo+
ICAgew0KPiAgICAgICBpZiAoICpjcCA9PSAnLScgKQ0KPiAtICAgICAgICByZXR1cm4gLXNpbXBs
ZV9zdHJ0b3VsbChjcCArIDEsIGVuZHAsIGJhc2UpOw0KPiArICAgICAgICByZXR1cm4gKC0xTEwp
ICogc2ltcGxlX3N0cnRvdWxsKGNwICsgMSwgZW5kcCwgYmFzZSk7DQo+ICAgICAgIHJldHVybiBz
aW1wbGVfc3RydG91bGwoY3AsIGVuZHAsIGJhc2UpOw0KPiAgIH0NCj4gICANCg==


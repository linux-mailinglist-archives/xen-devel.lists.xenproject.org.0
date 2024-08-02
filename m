Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B994568A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 05:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770080.1180937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZijR-0000TW-6K; Fri, 02 Aug 2024 03:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770080.1180937; Fri, 02 Aug 2024 03:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZijR-0000Qx-2p; Fri, 02 Aug 2024 03:13:29 +0000
Received: by outflank-mailman (input) for mailman id 770080;
 Fri, 02 Aug 2024 03:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZijQ-0000Qm-9r
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 03:13:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f9c1c83-507d-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 05:13:27 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SN7PR12MB8026.namprd12.prod.outlook.com (2603:10b6:806:34b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 03:13:23 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 03:13:23 +0000
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
X-Inumbo-ID: 2f9c1c83-507d-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2bgCVDAgg9HNpd5EKv5Je3sT5TnEe4oRg+EqKfi8NZXWQs2sC+LtjuyBIBVk9erWX0gVuRH2BG8bGPL1pnE/kHV9PcAuXsYBmJhZgdWY1uVyZn3B4ShNYKs2sTCy0GzTyy6wxw3jZ1n8NPhBHJiGX4ugKa5G0JWqBvP8OqgnBAfxRWqdC6ns8qWZ1jCwvtUbCnNH0Jdu1B8aycWOMEM6RkkKg30vAq4zBA8MvxCMfjEcOzO+QgwqIUdEf9IM11qr5P9UEL7p807EaC3TLhlKIHQC5TkY5pgRqhzz1IvqNsgjIfAUoclm1lDRsnt/+OGAcACe1YP5nk1CyTmrYT4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jne1c/LYamYf3uMOAVOzbLaBG3g3ebmLok4WQEHYkB0=;
 b=QmKtgxg0GQtCeybW3zEKAAflbdt/TpmFltoI7Fz83pWsYW5OR86JDzhpkoh7xx3PborZaOXKdKbx/ZmHvBgSDZdGfq6KJT2S24c5gVQfBZv+fOIxsl8+4p3umkft8HOEFgZku/Wa0JlfCVpbA8+Uf3EdF8i3w1oaY1vH2T0OvFOP7YFCLbCxcSFbPUGfJel8fjIOflJPNmDgrNPUlQiHgHD8Xokkv63T4365gX0xPPdgzTGi8Ir6FtlsqYf75K/ioy+Q8F2KF/Wlr42JGuQJNjilc22bfTyG+o/jINoCKkVLWwMxmXUbyzQJGyiUA7eHsxMCpUosgOTCs+nYx5L9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jne1c/LYamYf3uMOAVOzbLaBG3g3ebmLok4WQEHYkB0=;
 b=uMcCUlKtDxhw1iLteT9levdE2THXtJnN7dxpjI97GIJyLWkW59e3b7fQmEyPT3QbfnGPNl+YuW/RKE1vnxPDgqXkV1KF/0F2/U07CefROqlGRNHDZke9iyhi3E/2CuAD57TjwpTRuOnD4n6kr84zBJlgprSb0zSn3QLYC/9HH1A=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v12 6/7] tools: Add new function to get gsi from
 dev
Thread-Topic: [RFC XEN PATCH v12 6/7] tools: Add new function to get gsi from
 dev
Thread-Index: AQHa0Svedv1p7hOYckC70HcmNEElN7ISg4+AgAFzygA=
Date: Fri, 2 Aug 2024 03:13:23 +0000
Message-ID:
 <BL1PR12MB584985B5FE36F37141CF3EB3E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-7-Jiqian.Chen@amd.com> <ZquHNURGoADdCy6y@macbook>
In-Reply-To: <ZquHNURGoADdCy6y@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7828.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SN7PR12MB8026:EE_
x-ms-office365-filtering-correlation-id: b8111c52-6ee2-413f-e866-08dcb2a111ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGE0dWZIeE5yVjNOL0dveHo0L1hmTzBqMWgwM2RqZFMraWhYczFKajN4YlNv?=
 =?utf-8?B?emc1VnBERUc0VXQzR1dZU09zemswbHhKR0dVOUs4SG1uU0prM3VsZjFLR2FS?=
 =?utf-8?B?bXBtTjVjdXlLdDM0ejhBZkNhMUVNbUxBNzJPbjJoSUI2QUp5eUxnTEZLcURm?=
 =?utf-8?B?dDBiQk5hblByNTNiaFI0bHlZaTh2K1hGazVoUUE0L01KVmFjbnNsSG01Y25B?=
 =?utf-8?B?ZW85a1YrZmJiYllFcW1ZVEpHSERaVHdMeGFKS0VUTDdEUkxmclcweFJaVVcx?=
 =?utf-8?B?T1ZEQjIwVmhtVWpqQ2ZhNVRmMVVManh4NGdYcjNtUFRoYkVuVmhWcG5KUWVZ?=
 =?utf-8?B?a1UrNnV1ejVSTS9UYTJjcGR1VXNMOEd1aFVNZFp5eGlVRW1HdmtLZUI3WUw4?=
 =?utf-8?B?ZGRPY3BUMmZkVTYwRVdwRG1BN1dVR3RkV0lpYmJIMFFoZDJJUnlKaCtET1R1?=
 =?utf-8?B?amZBYlpVUURpRnZuemMrbExWL1FYZ0RjRGVUZkVIaS9Cd2l3V3dZcE0vbXIx?=
 =?utf-8?B?QTdqTFJieE0ranZwcjBrMllsUWN3Nk45SThUUmg4M0VHYVBTdmMrNWxtQnhW?=
 =?utf-8?B?OUV4dzZlSks5dFp0WWdzbCtwTTEydzVVZnRKRnB6QisrdXBhdmhIeWtFNENh?=
 =?utf-8?B?YlNqUVllcWYxNWhMa1pReEoyZldrY2N5cDZsNDlVUmpEdkdpdE9ZVHpGWDlu?=
 =?utf-8?B?d2VIUWFCZEY2NWlpS0FsajBVbG5iQkdFWm54UXl1UUJHOEt1SzBHa0R4cStP?=
 =?utf-8?B?ZTB2YTR1eG1RSVdXay9EOS8zQTdqei9MbUhOWWtyWjhoTUFaOVltb1lERUpx?=
 =?utf-8?B?RlN4cU9aTzR3SUlLRWo2RnF6ZjNKelJDc1ltZmg3cjc2bitpdUZKczMyNHJM?=
 =?utf-8?B?aXR3T2Q1ei9jT3NvR1doMk14WjBkWGtacitKUE4rRy9FR3YzNWZUL3dTUXRw?=
 =?utf-8?B?cG1qR3JraE80Y0NtVWNhV24zZFp0ckplWkN6Z3FOTG90UjJpU2lLblFzYzho?=
 =?utf-8?B?aWFTeVJTODJqaWZCUXlxTjZwQWFMVTl2VVZLbm9UeWMyaDVwVnY5ako1YU83?=
 =?utf-8?B?cDc0c3V6eStXbW5hNk0zUmhQbk1JeUp1Tk4wQm1BL0tEWmEvbDExYWpKT1pn?=
 =?utf-8?B?dHpOMkpoZVNSd1BwVzdrMzAzdnIyRXQyb3JveHZ2UlNJek8xUjNYNmJvbjFU?=
 =?utf-8?B?THZxUVJjZnNtbjZ6QzlmdUVOdDNyVWpsWjlnUDhqUjlJMzhRVzl0M3NPRkFD?=
 =?utf-8?B?cFlia2VKNUVZK1hUN1dJcnpSSWJyZ3VacVAyNVhUbEljU3FUemdneEtKeXZU?=
 =?utf-8?B?OFRLNFQ1aThGNFRiaU1pVWNIeC9zOC8wUGcxQVMrWmpYbWNqdFZFZDRnTFlS?=
 =?utf-8?B?VzMxK0xaWG5temN5UklscS8wTDVjR2drRGRCSVJLVmw5U0ZVQW5mZzFwb01W?=
 =?utf-8?B?UXEzMGI2cXBPQS9MaERRc2ViSHJrZVhKY28yV0swU052RWRlTWlEdGdiVk9o?=
 =?utf-8?B?T3FOMkpXMURyYUNZbUl4VTdMaG14SmZjdVhwdXFqcjJzY2hLZU8rZnhsc1BM?=
 =?utf-8?B?ZHFYWUV0TXlJRjVuQVRkKzBhUHFqQk4xVyswWHJ2Q3NSR3NCYWt4SkVLa0ps?=
 =?utf-8?B?TWJ5TS9TTmlTWW1YbXlnRUVLeHB1ZGluRFc5dkxzQ1p4THBPdzRtRjFHcURq?=
 =?utf-8?B?TEhDNHZwRVJYT2tPSTRLZjBDSnNZOHhWbGJPYVhNNW1Kc2IvMWN1ZlVSaGJy?=
 =?utf-8?B?WlBCYWlQYjJXYnJXbThyR3liNWplU3hzZEd2dkpCb095TU1wdjhqaUpkd1Y1?=
 =?utf-8?Q?B4EVNxDUvfsS+shR9RW+u2jURliArXFLRHD18=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDNndXJmRFMzc3h6SmZHSTVjWHp0MUFFVXhRUzRxdkdpOWVyU3EvM2lsTjBP?=
 =?utf-8?B?TjN1Ym1UOTN0d2phZ0hzc2YwV05iS004TzlBazYrc0NrejRBTXZNaHpmR0F1?=
 =?utf-8?B?WndyUXBwS1h3SlRaa0FuMEtPKzErMWZnVGR1R1hXMHNBcFE3emNSUXNjQncv?=
 =?utf-8?B?Z1JFdTdKQTlmcU1mdEhEbGZRWXloRUF3elFpK1F0cXVSUXA1VUQ3cUlSbXBJ?=
 =?utf-8?B?Mjd0ZU9Bay9JM3pMOG93TkdEK3U4NmkvL29uazV0ODk2RzdIRUJSWlU3UzJw?=
 =?utf-8?B?MWpOcUs0anNrMEdkSE1MSnZwTkowTWUyaXNBekdvTTFkbllFanFsdkhkMk9q?=
 =?utf-8?B?MUVYWEVSbWRvSVVmS2pIcXNsWU5HbmlKQ1ladzd6TzFFMVd4VlFnYVBDZ1Ex?=
 =?utf-8?B?RlZlSmphSUI4b2duU0h3SzdlNzZ6RXFFU0pFR0xmVU45T0d0L2JZRXBVRWFh?=
 =?utf-8?B?d3U5UHdMbG5razJtaFMxa0djQTZvclVKSi84ZXJKZEN4YzN1UHpjZmZVb28w?=
 =?utf-8?B?bWpVVG1OdHdEeXFDY2JtbXprTWZPd05ORDRiWC84ZEpITnFYZDVNOHJUd3lu?=
 =?utf-8?B?ZENKcFhKZmR4YlJGZFBHTTVlREFpYlNlRkhISXMzbE9BeW1FWURaN3dFZDBI?=
 =?utf-8?B?L2lEY3drR0dhaFducnU0VFl6YTNIRnpRYnhqNElOSTdjR0k3bXpoS0pCczBT?=
 =?utf-8?B?UkFHN3pNZ3BmeTZQRTN6Z0ZHWDN1K3M1M1drNXhZWjhRREtKcWV6cjJ5OEVC?=
 =?utf-8?B?cC9FcEpKaUh2aHE4bWZ3TGk4VTNMQURJSDJqa1ROamhWSmRoNXZRd1MxYzhW?=
 =?utf-8?B?MnJ6eWdlaWJER1Vld2NtbXFUQmVLbzFWR0t1d0RBYXpUN1JhQlVhb09CUkd0?=
 =?utf-8?B?UU9CMnlsSUVDV1dXZ1ZlYlEzNXlxc2JRMmRpT2NlekhwUXA0N0MrT2c1QWdI?=
 =?utf-8?B?NUlzQmNqWnptSHhGQ0NlRGlLeDUrcHc5Nyt4bXRRVEFWUDI3bGVzazVUOVpO?=
 =?utf-8?B?VjkzNTZEWmlNZnF2L25VN3FNZ1I2UTBGcTdEWkYvNDdWR0U0Uzh6NHlyMDE5?=
 =?utf-8?B?c3IwbUpONlRnYktoa2tqR09IUUNqTFVpNW9XSkthTnQ2NitFRHFyaEhRcXcw?=
 =?utf-8?B?ZTJweVMxYXJ0L3c2VXhUL1lPL205OVZ1QUtvUmJpRjN5bEY4MHcwMnlBc0Js?=
 =?utf-8?B?V3hYVEpUbXNEVmx4NnRFUy9lWE43aXkwOE1vdnJqelNXS3h3dDFoMGdVQXVw?=
 =?utf-8?B?cEthSEk3QUZmd01IY0N4QUd4aUJIOVRCMkdhQW1mWld5Z0tHZ0h1UG95dUtM?=
 =?utf-8?B?cndhWXhaUTM0RnRiRndtVytjbVZUZ2xOVXdoVWxZZXVkdGx5d25nREZZamJz?=
 =?utf-8?B?VHpwREY2ak5pVUVFQ1l0aTZTdTQrYndkaXVORWdPbVMzVllKM3htR213TFpy?=
 =?utf-8?B?V2RSaVVEV0dHNk5kRDBzTDdCRkJPd2ExRHo3VXYyMlVYZi9tZkZkSS9jdVV0?=
 =?utf-8?B?TVgwMkYycmljSS9oL05BbHJZb2JPRnhGMlFaNXhUbEI1RFM5c0VvS0hibUZG?=
 =?utf-8?B?Zy9HZURUc0FvMjNnUW42c21IZkhGV2NKVGF0Q3B3YkV0bzBKc0lFU2lpeUV3?=
 =?utf-8?B?L2ZaWXhmR25Yb2JQdExSWVZiRmFLZHg3M3RNR2NqVW1IVHJFazR2bk9zejBU?=
 =?utf-8?B?WWZHTXJnblQ4RVBzRHJRdUZjczdTbEIvVEZHMUMrQTRzaCtHUDQ4eE9FbFZt?=
 =?utf-8?B?S2NVVjQxVDZZbHpHTE9RTTBZelh6ZzdVd0dvbjh4TTZtYit4SllBc1lDdG8z?=
 =?utf-8?B?dVhDQ3lHM0RHcy9xYm9IWXY2RGpmSkgwa1MxdTF1eDV1OHlMTklxc0E1TTYx?=
 =?utf-8?B?UHFRZUhuSkc0b2RrWlYzS1gxUDFkN2d2ZWErcFl4emdzMUh1MklRZmgzaHU1?=
 =?utf-8?B?L2dTVW90Z1ZLSlFLSXNtS1FERjZBbW8xb2hCOW1PY0p3WHQ0N0ZDeE1rZlEz?=
 =?utf-8?B?ZmNzc0pvU0ozNytmZ0VvYU9FSjBkVXU4ZEdBV0Q4WW52cmhOTVRqb1hweURC?=
 =?utf-8?B?Y3RaK1AyeSt6TGdKNDBFbXJVTmNLWXNpNlZZemdMOFJLWVloKzVCNy81SjE2?=
 =?utf-8?Q?TGUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2358FFA8B9B58498359C8DD2C2EC9B5@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8111c52-6ee2-413f-e866-08dcb2a111ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 03:13:23.5590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PET6+1WNmXTUEmdDVKF7tHLv1gr/TPeEQSI4ebctyEDeyCHgRUOeeL35sNorM2MSCO2BTs/ja88ZG034AZqiTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8026

T24gMjAyNC84LzEgMjE6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgSnVs
IDA4LCAyMDI0IGF0IDA3OjQxOjIzUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hl
biBwYXNzdGhyb3VnaCBhIGRldmljZSB0byBkb21VLCBRRU1VIGFuZCB4bCB0b29scyB1c2UgaXRz
IGdzaQ0KPj4gbnVtYmVyIHRvIGRvIHBpcnEgbWFwcGluZywgc2VlIFFFTVUgY29kZQ0KPj4geGVu
X3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3BpcnEsIGFuZCB4bCBjb2RlDQo+PiBwY2lfYWRk
X2RtX2RvbmUtPnhjX3BoeXNkZXZfbWFwX3BpcnEsIGJ1dCB0aGUgZ3NpIG51bWJlciBpcyBnb3QN
Cj4+IGZyb20gZmlsZSAvc3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxLCB0aGF0IGlzIHdy
b25nLCBiZWNhdXNlDQo+PiBpcnEgaXMgbm90IGVxdWFsIHdpdGggZ3NpLCB0aGV5IGFyZSBpbiBk
aWZmZXJlbnQgc3BhY2VzLCBzbyBwaXJxDQo+PiBtYXBwaW5nIGZhaWxzLg0KPj4NCj4+IEFuZCBp
biBjdXJyZW50IGNvZGVzLCB0aGVyZSBpcyBubyBtZXRob2QgdG8gZ2V0IGdzaSBmb3IgdXNlcnNw
YWNlLg0KPj4gRm9yIGFib3ZlIHB1cnBvc2UsIGFkZCBuZXcgZnVuY3Rpb24gdG8gZ2V0IGdzaSwg
YW5kIHRoZQ0KPj4gY29ycmVzcG9uZGluZyBpb2N0bCBpcyBpbXBsZW1lbnRlZCBvbiBsaW51eCBr
ZXJuZWwgc2lkZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNo
ZW5AYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5j
b20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIEppcWlhbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4N
Cj4+IC0tLQ0KPj4gUkZDOiBpdCBuZWVkcyB0byB3YWl0IGZvciB0aGUgY29ycmVzcG9uZGluZyB0
aGlyZCBwYXRjaCBvbiBsaW51eCBrZXJuZWwgc2lkZSB0byBiZSBtZXJnZWQuDQo+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyNDA2MDcwNzUxMDkuMTI2Mjc3LTQtSmlxaWFu
LkNoZW5AYW1kLmNvbS8NCj4+IFRoaXMgcGF0Y2ggbXVzdCBiZSBtZXJnZWQgYWZ0ZXIgdGhlIHBh
dGNoIG9uIGxpbnV4IGtlcm5lbCBzaWRlDQo+Pg0KPj4gQ0M6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255QHhlbnByb2plY3Qub3JnPg0KPj4gUmVtYWluaW5nIGNvbW1lbnQgQEFudGhvbnkgUEVSQVJE
Og0KPj4gRG8gSSBuZWVkIHRvIG1ha2UgIiBvcGVuaW5nIG9mIC9kZXYveGVuL3ByaXZjbWQgIiBh
cyBhIHNpbmdsZSBmdW5jdGlvbiwgdGhlbiB1c2UgaXQgaW4gdGhpcw0KPj4gcGF0Y2ggYW5kIG90
aGVyIGxpYnJhcmllcz8NCj4+IC0tLQ0KPj4gIHRvb2xzL2luY2x1ZGUveGVuLXN5cy9MaW51eC9w
cml2Y21kLmggfCAgNyArKysrKysNCj4+ICB0b29scy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgICAg
ICAgICAgIHwgIDIgKysNCj4+ICB0b29scy9saWJzL2N0cmwveGNfcGh5c2Rldi5jICAgICAgICAg
IHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0
NCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUveGVuLXN5
cy9MaW51eC9wcml2Y21kLmggYi90b29scy9pbmNsdWRlL3hlbi1zeXMvTGludXgvcHJpdmNtZC5o
DQo+PiBpbmRleCBiYzYwZThmZDU1ZWIuLjRjZjcxOTEwMjExNiAxMDA2NDQNCj4+IC0tLSBhL3Rv
b2xzL2luY2x1ZGUveGVuLXN5cy9MaW51eC9wcml2Y21kLmgNCj4+ICsrKyBiL3Rvb2xzL2luY2x1
ZGUveGVuLXN5cy9MaW51eC9wcml2Y21kLmgNCj4+IEBAIC05NSw2ICs5NSwxMSBAQCB0eXBlZGVm
IHN0cnVjdCBwcml2Y21kX21tYXBfcmVzb3VyY2Ugew0KPj4gIAlfX3U2NCBhZGRyOw0KPj4gIH0g
cHJpdmNtZF9tbWFwX3Jlc291cmNlX3Q7DQo+PiAgDQo+PiArdHlwZWRlZiBzdHJ1Y3QgcHJpdmNt
ZF9nc2lfZnJvbV9wY2lkZXYgew0KPj4gKwlfX3UzMiBzYmRmOw0KPj4gKwlfX3UzMiBnc2k7DQo+
PiArfSBwcml2Y21kX2dzaV9mcm9tX3BjaWRldl90Ow0KPj4gKw0KPj4gIC8qDQo+PiAgICogQGNt
ZDogSU9DVExfUFJJVkNNRF9IWVBFUkNBTEwNCj4+ICAgKiBAYXJnOiAmcHJpdmNtZF9oeXBlcmNh
bGxfdA0KPj4gQEAgLTExNCw2ICsxMTksOCBAQCB0eXBlZGVmIHN0cnVjdCBwcml2Y21kX21tYXBf
cmVzb3VyY2Ugew0KPj4gIAlfSU9DKF9JT0NfTk9ORSwgJ1AnLCA2LCBzaXplb2YoZG9taWRfdCkp
DQo+PiAgI2RlZmluZSBJT0NUTF9QUklWQ01EX01NQVBfUkVTT1VSQ0UJCQkJXA0KPj4gIAlfSU9D
KF9JT0NfTk9ORSwgJ1AnLCA3LCBzaXplb2YocHJpdmNtZF9tbWFwX3Jlc291cmNlX3QpKQ0KPj4g
KyNkZWZpbmUgSU9DVExfUFJJVkNNRF9HU0lfRlJPTV9QQ0lERVYJCQkJXA0KPj4gKwlfSU9DKF9J
T0NfTk9ORSwgJ1AnLCAxMCwgc2l6ZW9mKHByaXZjbWRfZ3NpX2Zyb21fcGNpZGV2X3QpKQ0KPj4g
ICNkZWZpbmUgSU9DVExfUFJJVkNNRF9VTklNUExFTUVOVEVECQkJCVwNCj4+ICAJX0lPQyhfSU9D
X05PTkUsICdQJywgMHhGRiwgMCkNCj4+ICANCj4+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRl
L3hlbmN0cmwuaCBiL3Rvb2xzL2luY2x1ZGUveGVuY3RybC5oDQo+PiBpbmRleCA5Y2VjYTBjZmZj
MmYuLjM3MjBlMjJiMzk5YSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2luY2x1ZGUveGVuY3RybC5o
DQo+PiArKysgYi90b29scy9pbmNsdWRlL3hlbmN0cmwuaA0KPj4gQEAgLTE2NDEsNiArMTY0MSw4
IEBAIGludCB4Y19waHlzZGV2X3VubWFwX3BpcnEoeGNfaW50ZXJmYWNlICp4Y2gsDQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZCwNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGludCBwaXJxKTsNCj4+ICANCj4+ICtpbnQgeGNfcGh5c2Rldl9nc2lfZnJv
bV9wY2lkZXYoeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IHNiZGYpOw0KPj4gKw0KPj4gIC8q
DQo+PiAgICogIExPR0dJTkcgQU5EIEVSUk9SIFJFUE9SVElORw0KPj4gICAqLw0KPj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnMvY3RybC94Y19waHlzZGV2LmMgYi90b29scy9saWJzL2N0cmwveGNf
cGh5c2Rldi5jDQo+PiBpbmRleCBlOWZjZDc1NWZhNjIuLjU0ZWRiMGYzYzBkYyAxMDA2NDQNCj4+
IC0tLSBhL3Rvb2xzL2xpYnMvY3RybC94Y19waHlzZGV2LmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMv
Y3RybC94Y19waHlzZGV2LmMNCj4+IEBAIC0xMTEsMyArMTExLDM4IEBAIGludCB4Y19waHlzZGV2
X3VubWFwX3BpcnEoeGNfaW50ZXJmYWNlICp4Y2gsDQo+PiAgICAgIHJldHVybiByYzsNCj4+ICB9
DQo+PiAgDQo+PiAraW50IHhjX3BoeXNkZXZfZ3NpX2Zyb21fcGNpZGV2KHhjX2ludGVyZmFjZSAq
eGNoLCB1aW50MzJfdCBzYmRmKQ0KPiANCj4gRldJVywgSSdtIG5vdCBzdXJlIGl0J3MgZmluZSB0
byB1c2UgdGhlIHhjX3BoeXNkZXYgcHJlZml4IGhlcmUsIGFzDQo+IHRoaXMgaXMgbm90IGEgUEhZ
U0RFVk9QIGh5cGVyY2FsbC4NCj4gDQo+IEFzIEFudGhvbnkgc3VnZ2VzdGVkLCBpdCB3b3VsZCBi
ZSBiZXR0ZXIgcGxhY2VkIGluIHhjX2xpbnV4LmMsIGFuZA0KPiBwb3NzaWJseSBuYW1lZCB4Y19w
Y2lkZXZfZ2V0X2dzaSgpIG9yIHNpbWlsYXIsIHRvIGF2b2lkIHBvbGx1dGluZyB0aGUNCj4geGNf
cGh5c2RldiBuYW1lc3BhY2UuDQpUaGFua3MsIHdpbGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4N
Cg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hl
bi4NCg==


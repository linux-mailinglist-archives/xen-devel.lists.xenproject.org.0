Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9D1AE8F0C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 21:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025534.1401058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUWEY-0002t4-Eh; Wed, 25 Jun 2025 19:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025534.1401058; Wed, 25 Jun 2025 19:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUWEY-0002qV-By; Wed, 25 Jun 2025 19:56:38 +0000
Received: by outflank-mailman (input) for mailman id 1025534;
 Wed, 25 Jun 2025 19:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzS6=ZI=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uUWEX-0002qP-57
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 19:56:37 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ff2f56c-51fe-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 21:56:36 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9510.eurprd03.prod.outlook.com (2603:10a6:20b:5a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 19:56:34 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 19:56:34 +0000
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
X-Inumbo-ID: 7ff2f56c-51fe-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b99ohGESLUWaDKisqo/DEmbL6i7TNOgYkZZrikSmy7Bi3B+5xVonyO19k1p2yDdoCUlm3moVnFCdxqJeWpxeh6rgb2mlz5hozSf3J/sSbNd3IDWdZGBgn0xthWrBobBLqP+fWRRnp682k2wZm3m3KxLC/hbKS9JJsBUvXiNUbmltwBwQFGb2FFkDy0tRjgeGTX/k3AOs6+NPL7K2oZJ9C7j/n2QeJ3CItH1zYDb4ZUbAr5JyPJCED9aFJrvS/hWcMwioGPQSr0YtmOd0J6C2Ypzgjp1nU1OXgaMctOB7mi06guIO94zLm6v59kVMDn1gHPK221rUiToIQcGR1So3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqS6g+CWXgeqBpi8r4n+GYpZYOddUpw/F9eMXxh0q3g=;
 b=KVDgiidMf2l95GrPhNHLNxr4IjaFXjvEuCLNXaowUAisYfgPo0+N12xgseU8s1kMabc/XcLiWHdap4b7eYJfmwc6GSPegOJDWAH7rS1q+eGyeVEYyGrqFMwRFw+sKPo5x50GtgWNX7Na1nTfPyBMuYXHP+zwKep6tPr5YrcgqThlB9r7xGxVVKQqJMgHm0noSAWXiQxKdtgZwCoemuPrbhLo9VTdmUrbE/nA33dlI6hnLUpYcf+UEl233LPZpu8xUPTXe5JUCKLCOaEe6hnh1xdgc0HH1+v781wglvn7kYpaAxDKiYczIsUm0nyE+vdV2XgWzCvaAt1/53J0argMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqS6g+CWXgeqBpi8r4n+GYpZYOddUpw/F9eMXxh0q3g=;
 b=RQc/6GCpLhu7NUigtrFjNZnoZdkrfD1xYuWaztQUsp5y7hXgSidY+fz9l1KrkgAKC5HQqV/uvA79CCxQQE+wy2zzvxXmncTmyHuff1tfpZ4UTLHRGzJwyEtmU9xeluP+39zj2/raT18gucojxk8Nzq/L+SqDyF+P3QZyzUBB+/tvm8BnY1Tdm+U6+FyXX8EmpypWhX2BdKdjbzQgsPkZvCkjZ8sSj5S2jE2NUaow91ukinen6CzbQwVvCt1Tu8msspF0829dLmEZZ+fmL9MW3fOrCZBbcM33vDtFpVo33CH30Ye2ieXM1uPh2HqMzLwd1v3wWY+MI4uUScOs0QuloQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index:
 AQHbyNXPDXt2FT3RV02cltfdm/Dd7rPdzmiAgCG+LgCACKrsAIACoXoAgAWykoCAA/lGgA==
Date: Wed, 25 Jun 2025 19:56:34 +0000
Message-ID: <3e190e60-74a4-4565-acae-3b8602a4c46e@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
 <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
 <1e116116-ddf7-4640-9809-2502203abe46@suse.com>
In-Reply-To: <1e116116-ddf7-4640-9809-2502203abe46@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9510:EE_
x-ms-office365-filtering-correlation-id: f44ec939-a175-4364-d186-08ddb4226320
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RnAxYjlzeGJpd1NpZDRvU1UrVlZaemJva3RLRUF0WE0vUVlOOWtUNzM0dmhv?=
 =?utf-8?B?d1JnUkVNd0w4OVYwSzFpUXE3TjRTcE9QTmtlb25RRXpNTlZRMWJBSW1aL1JL?=
 =?utf-8?B?akJqZXpQWG1mODJDK1FhNlpRR2ZQNHhTakM1TzBXNHdtVkNSeWlGQUZKL0Jy?=
 =?utf-8?B?bEtMK2FkL0FBV01WWjdoejJmRFVRZithQTFtQ2dNVXUxc2dhMEVLVzlJa2Jl?=
 =?utf-8?B?eXI2MGxwbnAxdTNRVWxEcHpTQ1l1VXRRQ25tSUhBSFFhYXNjc1ZkYnF5Q0J1?=
 =?utf-8?B?aW1UZTZ5SEtkeW9ydjR4YnRoOE5DSkZYOEJiUEV6ZmUrYVVaWFFhQkRGeEtM?=
 =?utf-8?B?N2xNbUV5TGNGMFp1RExiUDIvVXJYNU1QdXJuRFBXNjRhWHRIeFVRSEFyMkxt?=
 =?utf-8?B?VjFKRjRUUnFwRFN4bkVnYmJqMnZoMzR4SmVIMCtRekZSR0xzMXltd2dudGwv?=
 =?utf-8?B?V0tkcDh6bzhpN21XVFFzRTBsclNwTms2WDhJOHhoNm9za1gvUjZhM3BabU4r?=
 =?utf-8?B?b2hUUTR1amFWVFNFVE92QjQycnp2UEVDUkkvb3paYWpUeVduSENtbjFJc3h4?=
 =?utf-8?B?OE4yWFcvbTVxNnhNMDB2OW1SbWZ5M0lzcTN3bm1pRGhmVVp6NC82ajVXS2M3?=
 =?utf-8?B?Y3pVQTI0cGpWd3hDRXR5VUFidjV1VlMzK0N4RFYxNkpDQzk4Wkw4K0ZYR1FF?=
 =?utf-8?B?WVVyQnRhYW4rUnBTcVpxQnNnZnJVWGdXc2k0K1RGb2Nxb2Y4U2FYMVpiNms0?=
 =?utf-8?B?VE1OM25EQ0ZQUk81b3RyTkFYdjNoVHFSNE9oR2hjNFIyeVJGSlZtQlRxdXd1?=
 =?utf-8?B?QlJTazFDZkJTNlNjTkpzTnZBUkpmS3BnY2V1Snk5V3k0cmZOWlpUUytlblkw?=
 =?utf-8?B?ZTB2Skd3alRZTExUbm12cmZOVXppa1NtSWNLN1hlQUhKekFYTkFEalBaN0d1?=
 =?utf-8?B?dnpsaGducDNSaEFuRVpNcFhNZXhWQVBmSkF0bGpSZkppeFlIeVl4eUJWTitz?=
 =?utf-8?B?OWZCcXFIL0hiZEhCYTRsSTFQbm9JZmtteTl1ajBSbHFkTmVnY3U5Ym9TK2Ru?=
 =?utf-8?B?U2hzLzJScGl5SENKS01UYm9KUzV5RFZBWVVZNmJ1OC9LTkNDei9MV1Rpc2Mx?=
 =?utf-8?B?THZXbUVKd0dRR0RNMk85cUtzRnV2ZmFodEtYTnZIWGdwcVpJQWJIdU5mRjNE?=
 =?utf-8?B?V2cwSGlQckNqckxISmpFT0VnMEVzUnBkZlEwaUh2SmRCRXd1NU5ydVVqWDUz?=
 =?utf-8?B?MHlzcnF5R2JCZmFnTy8zeDFrSGZvQnJtdmJyN0V6alhxMFY4QWgrYkN6VCtH?=
 =?utf-8?B?dWduV0VEWXNUNk5YbC8zdEhLOEd1bVdpcVlLbzQwcjdzaC9ObUo4NEtVazNa?=
 =?utf-8?B?U01yMFB2SGRTdWJsWjVFY1ozRGFMaEgzMnBHNzFvZXNVcmUwdFlnRFdzUFJW?=
 =?utf-8?B?c2NJUDNMeHFkRFEydGwrbnd5N1lVOWZCK1c3WUtXbmk2YnQ0dStoREZuS1lw?=
 =?utf-8?B?NVJyQU8zSWR2ZkRmYjBKZWtreVJJcFNMeENIYTFGWk51aUhtR0FZclhBaVUw?=
 =?utf-8?B?bm0xNTVURGk3RWlsVHlOWnkyYk8zbk5ibzdOeVh3aUhod3lEUXdjWUw2cVJE?=
 =?utf-8?B?SjR6aW1SUFBGZm9yRnZCRkJqM0Y5b1JuTjZCd1ZsajI2V0ZvOFcyZFQrV0hD?=
 =?utf-8?B?cHZHMkVxaXRuckwwMnZQUkV2UUlnN0duTktZdjBLRGh4bDBGTm9QcjRQQjJS?=
 =?utf-8?B?ZW1aL1FUQkpSTE1MOG50YmdycXFiV0ljTnRKUkV6dFMwWG4wL0FlZ2ZsV3FW?=
 =?utf-8?B?SGs3aGpMalNPemt0RmtaeFd1dm5FeXgxUHJyZE1oNDA2N2xpN3Z4SXJYTWUy?=
 =?utf-8?B?NkdxR0NqcjJCSmloV2NoVjcydmJob2FtYjF2MUpaaG5iTXhJMURzRUhhMWE0?=
 =?utf-8?Q?Z2d/qi/h7I0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjVNNVE4QlZuc3llSDFQTDY4aTZjMzRTR1pudGtmZHE5MUVCQ20wdUJYMmZq?=
 =?utf-8?B?SVBXcUZ2bk4rbWdtRGVYUldCWGFFUTJ2WnVJcXRNbjh5NGh0QXY5N2ZFSHNS?=
 =?utf-8?B?bTZGMVUzU0Z5cGt5ZnhxVzRTN3hscU5yRUt3YzlablNlb3lWOVpURmdWbGZj?=
 =?utf-8?B?K3JrU0RwcXBjVGNra1RYNFBIQUZlVjZqaDhTaXhweHRtTTFITWpVTitHTTBo?=
 =?utf-8?B?alpPNXFkUGY4eE9TeGN0dHpqRHh1QkxMcGtUNm5Ec0V5REwzUXJqUjFJdGht?=
 =?utf-8?B?Nk13TWtSQ2NQbGNnc3p1aVNleElwQUxpYnRMSWt2SmcvYk5nM1hvVE14c29k?=
 =?utf-8?B?eXhnUE5xYjI2Rk1iVWpjTitCMEpwVjhGeWlnSFU3dHM2MHJlM0V1WU5wSTlJ?=
 =?utf-8?B?NVY0eUt3WGJCUkx4TUpiZUE4R1VxTWNTOHNoa0UyWlRrd0kyRHEvbERQVVF4?=
 =?utf-8?B?WjhqQWh0cDJNM3owOHQ5ZkZ4eGRFaDUyN08xNDZqT2x1TUJmODZPUEE3OThT?=
 =?utf-8?B?UlZndlhyajcxd0c5cklsdGt2Q2NEcmhpbFRVb1VOeW5LL2VEei82azRVblNV?=
 =?utf-8?B?cTNaK1o2NzdDZndoNkd5ZGRxbUJBZTdKaHRxdmVVbFM4c2tIVENSSjdkSmF1?=
 =?utf-8?B?Zlc5SnZ3cEQ4ZnRPRHdKSkZDOExxbDdkRlZTU1pkUW9EbmQxTU5kbmMxbXBG?=
 =?utf-8?B?L2YzOUJlUmx1WnU1NHQ4a09oYytvSUdOWXkzdUNlMHliSUJPcVRkOGk5UjQr?=
 =?utf-8?B?UlZ0QXlPRTZKZ1diT3gzMkcyakRSRWU5NGNtWm0zZFlwaXlMeEpEbU83akNl?=
 =?utf-8?B?V0MvNnBWb3pabUFwRG5QSUtweU1MSStjL2RHQ2ZqeXpaSDZWNjQxbXY0YUlo?=
 =?utf-8?B?YjhGS2Y0bGYzcVNwaDB6WTJ1UVVlaHBhcFJWWVpDajN3SHRLeVdpVGNhY3dq?=
 =?utf-8?B?MFFRdlVDbDZqdzNTeXdHcjB1cVFzUTh4aFl1RGtQV2Z3b3V2RWIrajVkTGd6?=
 =?utf-8?B?T1JpQUVGUHZaUWVkcmxDNEdNSUdYZ0N2L3F6V0t3Rkc3SXlNbytJN1lHRGpC?=
 =?utf-8?B?Mk9YU3lwL2dQMzloRGVkVHpDRHNXVWpNRjNnOHFvajNkRFhQTy9sV2M2QmJ5?=
 =?utf-8?B?dVV0V0QzRHpibThuWFRBVVdPanVxblFTdjlxdDVVS3FBVFU1VUxwQzZ0c3dh?=
 =?utf-8?B?QWNWMi9nS25nVExxbE4wcktUMUhLaldmVDhxS2JPK3NuUmwzakRXdlR0a1Vj?=
 =?utf-8?B?VmgzK2F5RU00bVZTN2tTQ3RLSmZETzJQTEtYd3I2bVVyK1BDN3BNa1dMcmN4?=
 =?utf-8?B?SkIwejZJalUrK0E1VUgrZGhtMkNEMldLb0VwRFl4Rm5qb2xVSDAyb2pzaTJB?=
 =?utf-8?B?aWpxZDdaWi93UlFRS3R6Y3RBRlFHd3pDQjJ2dW9MeXM2a2JObXo2U3JOSWNZ?=
 =?utf-8?B?REQydCtoSkhEaFBuMVhBdnV2ZHhndFZTNmwyMGQ0K1JMLzN3QXd4OVV4V3Ny?=
 =?utf-8?B?NXZUcGpRakpaR3ZPa1hMcEZEYXBZQUR5WmlQc2lUd00vaHllZWwwSDRUTG5w?=
 =?utf-8?B?VWhCRDJhTmU3NjJPZ1VPUXNOWVpVVTl4UjRoVUp5Q2wyYjMvZmxCb3RLYlVK?=
 =?utf-8?B?NFNyZ1dETkNCd0NrcXJBWXVrajVHRTRPVjBZZUtESE1ta3JuQzI0WGhjL0sw?=
 =?utf-8?B?bGp4UVFmU1E1Tlp5ODJoaTZRYmo1OFNOTFQzbGp5VktTdUdEbTlycXdHQXhN?=
 =?utf-8?B?eVpqNVBsZEJkcDZzMnlSVkRwY2V2MitGdDNSNXNCMlZaVWlXbjdla1VTVHdD?=
 =?utf-8?B?b0p1RExFWGlXcW80U2d3UnZiNTNPZktFMEoyOW5SaGNnbWlRSEFlWk04K2Zt?=
 =?utf-8?B?YnB6YjBXam1oSE9BcnRldnJJZ1JLN3hHMWRRaHp2R29MUVdFWFRzcVFEK0VW?=
 =?utf-8?B?SkFWaWN0WWFsSys3VkdSN1BNSGcxbHNwS1JlTWl3OW5QaWd3MXJoZTZHMHZP?=
 =?utf-8?B?MEpTdVgzdTFYY1g1WXM0QkhEMXY5TUdKV2xxbXpxSWlsOWw4S0hJeXE1NnBO?=
 =?utf-8?B?aEdvLzdmTUFWZmhsY01PZFlEai8vREZLaFByU2hjekJUT3NBRGtXcGl0Uzdq?=
 =?utf-8?B?NUJJbXVOSGlHc1FHcGVWY3lnS0NlajhNZ0hRcDdJMVFtTUNBMFRLSjhpMmEr?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <037DB2CE029CC140817AD88D83A656EF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44ec939-a175-4364-d186-08ddb4226320
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 19:56:34.1113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9VwstMyFnglf67C2RmVl05gSuNnt/YgAweYP65sKn/U3m00rICh+SYH1cgPxDAkDczVTRqsYo3oxleLDYSNrlRXgcy46XwGXMB3aZ7B1nn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9510

DQpPbiAyMy8wNi8yMDI1IDEwOjE1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMDYuMjAy
NSAxODoxNSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBPbiAxOC8wNi8yMDI1IDAzOjA0
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gT24gVGh1LCAxMiBKdW4gMjAyNSwgT2xl
a3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9m
aXJtd2FyZS9zY2kuYyBiL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYw0KPj4+Pj4+IGluZGV4
IGUxNTIyZTEwZTIuLjhlZmQ1NDFjNGYgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJt
L2Zpcm13YXJlL3NjaS5jDQo+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5j
DQo+Pj4+Pj4gQEAgLTEyNiw2ICsxMjYsNDMgQEAgaW50IHNjaV9hc3NpZ25fZHRfZGV2aWNlKHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KQ0KPj4+Pj4+ICAgICAg
ICAgcmV0dXJuIDA7DQo+Pj4+Pj4gICAgIH0NCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gK2ludCBzY2lf
ZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQsDQo+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0
bF90KSB1X2RvbWN0bCkNCj4+Pj4+PiArew0KPj4+Pj4+ICsgICAgc3RydWN0IGR0X2RldmljZV9u
b2RlICpkZXY7DQo+Pj4+Pj4gKyAgICBpbnQgcmV0ID0gMDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAg
ICBzd2l0Y2ggKCBkb21jdGwtPmNtZCApDQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAgICBjYXNl
IFhFTl9ET01DVExfYXNzaWduX2RldmljZToNCj4+Pj4+PiArICAgICAgICByZXQgPSAtRU9QTk9U
U1VQUDsNCj4+Pj4+IEFyZSB5b3Ugc3VyZSAtRU9QTk9UU1VQUCBpcyB0aGUgcmlnaHQgZXJyb3Ig
Y29kZSBmb3IgdGhlIDMgY2hlY2tzIGJlbG93Pw0KPj4+PiBUaGUgLUVPUE5PVFNVUFAgY29kZSBp
cyB1c2VkIGJlY2F1c2UgdGhpcyBpcyBwYXJ0IG9mIGEgY2hhaW5lZCBjYWxsIGFmdGVyDQo+Pj4+
IGlvbW11X2RvX2RvbWN0bCwgYXMgc3RhdGVkIGluIHhlbi9jb21tb24vZG9tY3RsLmM6ODU5LiBU
aGUNCj4+Pj4gWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlDQo+Pj4+IGNhbGwgaXMgZXhwZWN0ZWQg
dG8gaGFuZGxlIGFueSBEVCBkZXZpY2UsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGUgRFQNCj4+
Pj4gZGV2aWNlIGlzDQo+Pj4+IHByb3RlY3RlZCBieSBhbiBJT01NVSBvciBpZiB0aGUgSU9NTVUg
aXMgZGlzYWJsZWQuDQo+Pj4+IFRoZSBmb2xsb3dpbmcgY2FzZXMgYXJlIGNvbnNpZGVyZWQ6DQo+
Pj4+DQo+Pj4+IDEuIElPTU1VIFByb3RlY3RlZCBEZXZpY2UgKFN1Y2Nlc3MpDQo+Pj4+DQo+Pj4+
IElmIHRoZSBkZXZpY2UgaXMgcHJvdGVjdGVkIGJ5IHRoZSBJT01NVSBhbmQgaW9tbXVfZG9fZG9t
Y3RsIHJldHVybnMgMCwNCj4+Pj4gd2UgY29udGludWUNCj4+Pj4gcHJvY2Vzc2luZyB0aGUgRFQg
ZGV2aWNlIGJ5IGNhbGxpbmcgc2NpX2RvX2RvbWN0bC4NCj4+Pj4NCj4+Pj4gMi4gSU9NTVUgRGlz
YWJsZWQgKC1FT1BOT1RTVVBQIGZyb20gaW9tbXVfZG9fZG9tY3RsKQ0KPj4+Pg0KPj4+PiBJZiBp
b21tdV9kb19kb21jdGwgcmV0dXJucyAtRU9QTk9UU1VQUCwgaW5kaWNhdGluZyB0aGF0IHRoZSBJ
T01NVSBpcw0KPj4+PiBkaXNhYmxlZCwNCj4+Pj4gd2Ugc3RpbGwgcHJvY2VlZCB0byBjYWxsIHNj
aV9kb19kb21jdGwuDQo+Pj4gT0sgdGhpcyBtYWtlcyBzZW5zZS4gIEkgdGhpbmsgaXQgaXMgT0sg
dG8gaGF2ZSBhIHNwZWNpYWwgZXJyb3IgY29kZSB0bw0KPj4+IHNheSAidGhlIElPTU1VIGlzIGRp
c2FibGVkIiBidXQgSSBkb24ndCBrbm93IGlmIGl0IGlzIGEgZ29vZCBpZGVhIHRvIHRyeQ0KPj4+
IHRvIHVzZSAtRU9QTk9UU1VQUCBmb3IgdGhhdC4gLUVPUE5PVFNVUFAgY291bGQgbWVhbiBhIGh5
cGVydmlzb3INCj4+PiBjb25maWd1cmF0aW9uIHdpdGggZG9tY3RsIGRpc2FibGVkLCBmb3IgaW5z
dGFuY2UuDQo+Pj4NCj4+PiBJdCBtaWdodCBiZSB3aXNlciB0byB1c2UgYSBkaWZmZXJlbnQgZXJy
b3IgY29kZS4gTWF5YmUgRU5PRU5UPw0KPj4+DQo+PiBJIHNlZSB0aGF0IGluIHRoZSBmb2xsb3dp
bmcgY29tbWl0Og0KPj4NCj4+IDcxZTYxN2E2YjggKHVzZSBpc19pb21tdV9lbmFibGVkKCkgd2hl
cmUgYXBwcm9wcmlhdGUuLi4sIDIwMTktMDktMTcpDQo+Pg0KPj4gLUVOT1NZUyByZXR1cm4gY29k
ZSB3YXMgY2hhbmdlZCB0byAtRU9QTk9UU1VQUCBpbiBpb21tdV9kb19kb21jdGwuDQo+Pg0KPj4g
SXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHRoaXMgd2FzIGRvbmUgZnJvbSB0aGUgY29tbWl0IGRl
c2NyaXB0aW9uLg0KPiBUaGlzIGhhcyBiZWVuIGRpc2N1c3NlZCBtYW55IHRpbWVzIGVsc2V3aGVy
ZS4gTWFueSBvZiBvdXIgRU5PU1lTIHVzZXMgYXJlDQo+IHNpbXBseSB3cm9uZy4gRU5PU1lTIGhh
cyB2ZXJ5IGxpbWl0ZWQgYXBwbGljYWJpbGl0eTogVW5hdmFpbGFiaWxpdHkgb2YgYQ0KPiB0b3At
bGV2ZWwgaHlwZXJjYWxsIChvcmlnaW5hbGx5OiBzeXNjYWxsKS4NCj4NCldoYXQgaXMgeW91ciBv
cGluaW9uIGFib3V0IGNoYW5naW5nIGl0IHRvIC1FTk9FTlQgdG8gc2F5ICJ0aGUgSU9NTVUgaXMg
DQpkaXNhYmxlZCIgYXMgU3RlZmFubyBzdWdnZXN0ZWQgaW4gWzBdPw0KDQpbMF06IGh0dHBzOi8v
bGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDI1LTA2L21zZzAxMjMzLmh0
bWwNCg==


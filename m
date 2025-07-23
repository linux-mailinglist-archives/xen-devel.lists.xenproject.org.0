Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA5B0F55D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054261.1422996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaXc-0002Sl-1d; Wed, 23 Jul 2025 14:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054261.1422996; Wed, 23 Jul 2025 14:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaXb-0002QK-Uk; Wed, 23 Jul 2025 14:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1054261;
 Wed, 23 Jul 2025 14:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE//=2E=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueaXZ-0002Pv-Ra
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:33:53 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e389bfc-67d2-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:33:53 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DU4PR03MB10648.eurprd03.prod.outlook.com (2603:10a6:10:584::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 14:33:50 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Wed, 23 Jul 2025
 14:33:50 +0000
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
X-Inumbo-ID: 0e389bfc-67d2-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eh7/7qNvjKLviwLj71qdgZuA+cDpq+C1BOu/AB17k3RlWxT6hnvXhapqAmsT+1J5Oavn7DKkONdwEAUlo2I26qxQauCBTMgaBg2h6ZuL+1uYm3NRqKKqWdU4K5reWrO3VfeCEXGysu4u0C1pFQrclr+WFQJv+JmMKG7gYd4mC6/l/B2F+q8eizVCOW146giD0i2To6gRx6j/F+h6+IbFeIhvSLR/hXiLpaiwUkTBsRgORe+Z5FfHAPduChnF3JzxyM9DJM/+uilrBffPr1oR+ohoXj8JZEw93rgRGgZ0elvM6JzwITknFPLxrLQL0ia7/Yx1GGkUmTRTzMggJRm0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cplJ8Dy2Jv489wyd7vRJX/ac6dYwfqZnnqZJtQ4EZRA=;
 b=gk34UjrVWEpnuBbXkCISFmy+6wG5AzFp9PkdGZanPBBwoP5xruLo/g5r4XbREcDof3KGBmxfH0msnV6/tM4AD9FPwHwwB3+rgEDhznal6QtC/a7AR4l+krvGP7BnWZFXb6dJT1/E65PF5p/gz30tCB6XO2O1LPqf0Wvzcf2PqWNcU+d4YtmbnJURtf/ZESEXY2ApeTnsEFZyV1QBTnyD/T4RBnW/d8jLpOoD4gPMztmvKUTGtowekxLHcB/PkHlRea8GRBnKPmmnw3ateH2Q9hIx/mVHK00TSQkZ8hoeJPEIpGXrVgkUpX7Sgik0juyyiKMy4pcLS9JGXOSwrvelVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cplJ8Dy2Jv489wyd7vRJX/ac6dYwfqZnnqZJtQ4EZRA=;
 b=LUrMRrxYRj7JnquEH9KYuDACa9gQdsIWGpHv40bCKDYabOSLq1NVW7OifZtZwF0/AhgWZLb6G8e1Ervlx8m4KsI4Pel55pyVL8g+jz1E9SkJymh55bb4N+5O078F6WwHJdQod/DX65KH+53XlhPeGEYH2ZMJ59uggPBZLPtbwAfeZCVh8uYg3R84mou6lw/BcpF64fSGBSBw5OOBvof5pAuUQGQMD/hVWM9/8XJfUdo36tZgQllmMwbtpVb0pTcVeMJvOe6sQ0nkzGgeE3Hl7JrnEdIU/MZmrwco3Q0lWzrQMVd/zX1XfR1KFoctSazCWCwbd0GObZoyFEKAmfWFdQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, "amd-xen-safety@groups.io"
	<amd-xen-safety@groups.io>
Subject: Re: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Topic: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Index: AQHb+9rNCD0pdC1VhE+OyU7cYZL/l7Q/xA4AgAAB2AA=
Date: Wed, 23 Jul 2025 14:33:50 +0000
Message-ID: <f8d6e3b2-aca2-4a0e-8913-0f52f2016846@epam.com>
References:
 <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
 <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>
In-Reply-To: <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DU4PR03MB10648:EE_
x-ms-office365-filtering-correlation-id: 07f3aa6e-f9e5-41f4-a686-08ddc9f5f145
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0t1Mm9hUVVYa0dFeElOT2tQY0pQZXM2VHhiTnJUZGVTcmxhQ21kK3VoMjRY?=
 =?utf-8?B?WWd1MksyWXlFc1RKR1ppRTFjclQ5YTQ2R3FhRWRGM042Y1VaUWt1TEhIOURu?=
 =?utf-8?B?USsrM09TUFIvd1VZK1NOR1A2MlJHSCtFa2ZvTjVtN0RZTnhrUlExZ1RXb09x?=
 =?utf-8?B?aUY4Mk0zNERlUWNZOE94aGQ3WkxIY3ZNV0RkL3lZeGZkZFdLMld4azVMMGF3?=
 =?utf-8?B?a2k4VUk0MXZLaTNWK3RBWjNFbVY5OUttM2s0ZWZ1SExVM1MzTXdPbGI1aGNH?=
 =?utf-8?B?Z2RST0JZYnFDRk9uMThwSTA0ZVdSSnRidUd0UDFNVlNLbzRCZzVJVi9PdXZi?=
 =?utf-8?B?TUJqTjFQeURmT3lHMUYvOXJQR3o1WWtSWWczTzd1YVZld01vbEFiU0RuSXJT?=
 =?utf-8?B?WVlPcHRHcVNIS2pxOFZDaEt5VlhZMVRyOEZNVEp2MkdUQ3hpSEZCNXhmLzhV?=
 =?utf-8?B?NzVnKzJyMUdUNlZ1YWJKaXF1VTJXUi8zUEUvYnRzcTZKT1FjWUlIYWxsYmsz?=
 =?utf-8?B?SWtpVkM4RUdZU3VHZnRoMmtmTG9yVW15NHgrQTFvSnJaNXgyVDB1aHZCSGFw?=
 =?utf-8?B?Rk0vMU1meTlJSlhOZkZBVlpxbXpxYjZqenMzUlpweWZMS2RXV2pjZkh6aTk4?=
 =?utf-8?B?UWNNUnJkd0ZaWm9GQUVQc3NyMVlkTmdZN3VoNEpEVGZrbm01M05IeWw2QVhl?=
 =?utf-8?B?dzVNczY2SFNCRURpeU55TTVpWUt0MXZBQ1JRekhpbVlxOHQyakRybzZKQUpn?=
 =?utf-8?B?U2I5NVZhZklRTFdNaUEwN1M5YVVxRlhoV2lYa0FZZUlaVmhxTmJEeGtCTlpI?=
 =?utf-8?B?SmdjbTg2YWN1MXJkTEdUbisrQm9vbkFQNjVUNkpKNjVsVFpPbHJ3TjBPVlpF?=
 =?utf-8?B?eGRxaERwV01OSlp6dDdTQ2xmYzRTdDVjTmE5SmNUZll6QW85NEZ5UW1aUUVJ?=
 =?utf-8?B?Tkt1TWpvMkF0czB5QlVkdU9JWDdydHFERnIwd2phOVVvMFR4NG1LSWNCblVX?=
 =?utf-8?B?WjhMYVVwR1NVbUgvMngvMDIzdUYrOE8xVC9RZVRudjF2MWV2SmlaQ3ZSVjZw?=
 =?utf-8?B?cXVLZXEzY3EyeVppTUx6V2UyNlZYNExackdnRHF6aTh0d3owNWpRcWtpKzhs?=
 =?utf-8?B?MW9rSGlrYTdFVEI1R3pBQzlBUU80OGNyVVRqTE9STzExNTFRYURQNUFMaHdH?=
 =?utf-8?B?V3VIOHBmMjZMQUtxU3A0anBWZGNLNUg3YTRhZ1lzWWpxOVJ2cW9xa1FmTTUz?=
 =?utf-8?B?TWxMandkMjdUWXRqbXlTZTNrUGFHOC82eit0L2MrT2VjS1JGN0tXNFNjeUI5?=
 =?utf-8?B?UFdJNGVBWUFWSTFmWFNsUjZxc2phdCs1NlRjK1gzekNyVHZJOWs0MUVIMVBp?=
 =?utf-8?B?QkRFZTFpM0U2Z2pyaVNSNVkzV0FhZkV0cDJIdVE5dk1kcXRZRVV1MStuTElY?=
 =?utf-8?B?b3BVL1FIZkkyQVdGTjVhbSszRWswVUZaWFVjVnk2Nk9LTVFaNUNjQmdWbWJo?=
 =?utf-8?B?M0JEY0hNYWFCUjFXenc4enNWSUllY0xmVEtzNENGbXJyRy9VSEFEMzA2eXNF?=
 =?utf-8?B?VjBTRlcyWTE0Z0ZEYzJkaGE4WlBnUXNqc1FMS1dxTktjQUVZNFVxK0l2eDlH?=
 =?utf-8?B?SGV5eWVCSXExNG1mRTY5UHVtODcrMEtMLy9ORjZjeVRjY0d6VlRtY1VFQlV1?=
 =?utf-8?B?eWVwUTJUdTZCZjdhdmMxYmNtVGxlUGZSbVcwNG9ZeEZXMXZLcGhxM1lOaTNQ?=
 =?utf-8?B?MFN3SzFTbzV0RFNTbVE3SUsvdXA5M3pYeGJkR2hRQjVpdXJ6RzZCNW83ak5T?=
 =?utf-8?B?ajZXM2dHUUFxSWtCOVJnVXNMVWlleHV1WmtaTUkyMW5rdTNKeVB5V3VZdVFk?=
 =?utf-8?B?QmZRNkNDZkE1eG9uRk9YZndnallkSWswTDZWUmtOVUdWaUZRZ0E3Ylp2T0pN?=
 =?utf-8?B?Smk1MEpTOHY4cjJEYjYzYnJMYWFyb1pPdmtpMGhHeXZoc3dpam45YXJ5UnR1?=
 =?utf-8?B?WVhnKzQzTXFnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djJPcVpMYXFXUEZXQ29MOXEzMlZhcnpOREZiY3FwMU9BbVRMZTREb092RnB2?=
 =?utf-8?B?Tmk0UmRYS2w2K096cUQ0SkdNdzZIMkRqanRZTFhKZUtRMnlJakc4VjM0WElh?=
 =?utf-8?B?cWMyQzRBeHZKQXFSRjlRWnk3R0MrRWdLUk1QTWZHbGtOakxMRHFzMTZVeWFh?=
 =?utf-8?B?dEtRWUwxM0c2dkRRYjdEaFlvTFNRTENoRjNVQjhGdHFEOWVHWjBVVDcvNElE?=
 =?utf-8?B?UFVzQmpYQUJhdGJzMzVtY21DMWo0MFNnOHc1d0phbjdtZHpNWHZ2aG1SUHQy?=
 =?utf-8?B?SGZYakdRS1Fla2E4YmEyQ1ZsRGc1RHV3eU1kNHZLMmdTdGtFZVBPYkRwNTYr?=
 =?utf-8?B?S3FucFNWU1kwOXZXUVRuVEJZOUJSdlBabXlWa1h1MFZKcVFxbGIrMVF0WE9u?=
 =?utf-8?B?WENGQjZzYXhFc0RXdjQvWVM1NGM5RzJ3VjM1NE8vOEVwREpuUkZjYWxyMmZi?=
 =?utf-8?B?Nkx1dHI3RTl4b2hGakVHWkoxWTVVQzdWM2JvV0k4aXpPVXg5U1lrd3FXaEZ3?=
 =?utf-8?B?RTJ5ZEY4bDN5Vmd1ZHRtYkhmM2s3dHlGdllqajZ1RXdzODZZVVBOYSs3RjMy?=
 =?utf-8?B?d0JWOVlzQTd3UlREdG1Md3VKMzlHMVR5MGNHM3IzTlVqdEVVTHlobWt0c0Zw?=
 =?utf-8?B?U21tNERWMkwwRkxDODI4aUFEV093Wm1FUlVabUpaYzJsQUpnYVNBaWJGRDJq?=
 =?utf-8?B?VEJMend4MUpyajNQMXAxdklCV002UE5NM3RPeG1yRUJXc3dBdHBkU2xTK05H?=
 =?utf-8?B?Z293RmlDLzRuMWtodDF6cW5GTUg0Y092ZDZQb0tzQ0hmK2U2MkJjeDB1V3Ax?=
 =?utf-8?B?ZktIWVg0Q01abkUxOHZTZXA2RWFDSjhvK29sYVdQQUhudVVHbWl5VUQ4ajNp?=
 =?utf-8?B?YlJhYWx5bS9SVTZsZnYza0lPMGdnTndVSlpBT2pkQXdnRExPcVBhTzBta2dV?=
 =?utf-8?B?amR3TlVCakpua3dqOUMwWTBLS1RXejNwanFYSEZxQ1IyTHI2bXc1TFFZYTBW?=
 =?utf-8?B?N3BhVnJ4cktYNnhpMFE3QXhPMkpnbWdoWDFsZGtmU0lrVjNBaWt4YlB1Nk82?=
 =?utf-8?B?cnlRSldiSk9ZUFlmVDNDOVgwT2wyRmMzQ0dXNmg1THJuRXpHTHNMODl1STZw?=
 =?utf-8?B?M2JhSm1uaFY0eHA2MmNOaUt4R1E0WHZYeDJoSXVlSWNqQ2RrV1h6eUp6L2tx?=
 =?utf-8?B?ZzZ5R0lLdGFlY2p6cHdsRi9DMnVMTEdiOHJPanJnZk5vM1E5a1pVc3IveXZD?=
 =?utf-8?B?NEVneER6U0ZKTkRhK0JDYUpSSEovVS8zQkpreHJQSmR3R0RPTzlSdXZoYTVF?=
 =?utf-8?B?Ti9PdGlnU3RsdngxeFN1MVlyY2VaaE5WVkdURWxIN092bWxyYnM3UXpvTGVH?=
 =?utf-8?B?R2MvTXFKaExDRjR0TldXL0kybEc5T3BCck11d0FWWVlsaUhtM0NnN3pqODkw?=
 =?utf-8?B?WTIvWUhVVE1lYlNFTENMWDFzNTNodFBqQlJ6S3g3ajNUQUZBOWJZUlFhZ1c1?=
 =?utf-8?B?NGVVYmJIQ3NDeG1ocCtYakk4V01kRWRCREVPUlk3OVh2dTBmZTd0YXYyNVJ5?=
 =?utf-8?B?ZnFZd2FqOFNWT3BhWVgrVnhnTmp2VWJrRVdkcDBSQktkSHQwN0lDWlgzbTRa?=
 =?utf-8?B?Slg2Tjd0R29HVWdMQVY1UTFDMGEzQ0JabmhNYzVJVWVjWmMxS1drQ0dyaENX?=
 =?utf-8?B?c3J5T2lrOVVFWlRHMWlkeW1PNVlCYkxhRFRDcjRyVzkvMVdSWjNib2F6Mm5m?=
 =?utf-8?B?QmtHYnhPMy9mVDlSNmJIcFlsb2NkcjI5VFp1cm5ITjZtRVcvWm9DVS9yaVRE?=
 =?utf-8?B?NWFUY2w0YXBBRnl0NUdZaW4wLzhyMTJZZmxzRnNUYldjRnJoTXlUdGxKYnhZ?=
 =?utf-8?B?YkhsOFFWd1g0YVFhK1VhUTZ2eTd1djhjSTJ6QUlZZElXNlB2OWZBOENiQ2t1?=
 =?utf-8?B?d2g5TUFjLy9obFRrV2E2OE0rck9DT3RIanA5c0tZeEJobkhJU08vK3VlSEt0?=
 =?utf-8?B?eXRNY0phT3RJTVAycDQ5bm5McmNaRDVZUWs2V2NVVFF5UlVrN3pyWGZxcCtG?=
 =?utf-8?B?NEdkYkpIN2RJTThBOTV6NlRRYmJDbC90VVlkSXdNMzRnWjQrdFlqYS9oa0ZS?=
 =?utf-8?B?OGJGYnpOVVkzam8vM2twNFFOU24zQ0lwYTNDMndGV2w2K3hOWllPM0FNSnRr?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18D940B6F0826149B42B979F3F4ABAF1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f3aa6e-f9e5-41f4-a686-08ddc9f5f145
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 14:33:50.8324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2M0PsIHFJPVbPrglJDtW4j4EfDgL/+W3GMb2rcsy+joa/byXDVU0Ymvh+Qv8qh9XcUaPfmq0nzyJXxZcDKGkgZ1+K7bd+Hfbtpg/1D1nQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10648

SGkgSmFuLA0KDQpPbiAyMy8wNy8yMDI1IDE3OjI3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24g
MjMuMDcuMjAyNSAxNjowNSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vS2NvbmZpZw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+IEBAIC0x
OSw2ICsxOSw3IEBAIGNvbmZpZyBBUk0NCj4+ICAgCXNlbGVjdCBIQVNfQUxURVJOQVRJVkUgaWYg
SEFTX1ZNQVANCj4+ICAgCXNlbGVjdCBIQVNfREVWSUNFX1RSRUUNCj4+ICAgCXNlbGVjdCBIQVNf
RE9NMExFU1MNCj4+ICsJc2VsZWN0IEhBU19ET00wDQo+IFRoaXMgd2FudHMgdG8gbW92ZSBvbmUg
bGluZSB1cCwgZm9yIHRoZSBzZXQgdG8gcmVtYWluIHNvcnRlZC4gQnV0IHNlZSBiZWxvdy4NCj4N
Cj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmln
DQo+PiBAQCAtMjEsNiArMjEsMTQgQEAgY29uZmlnIERPTTBMRVNTX0JPT1QNCj4+ICAgCSAgWGVu
IGJvb3Qgd2l0aG91dCB0aGUgbmVlZCBvZiBhIGNvbnRyb2wgZG9tYWluIChEb20wKSwgd2hpY2gg
Y291bGQgYmUNCj4+ICAgCSAgcHJlc2VudCBhbnl3YXkuDQo+PiAgIA0KPj4gK2NvbmZpZyBET00w
X0JPT1QNCj4+ICsJYm9vbCAiRG9tMCBib290IHN1cHBvcnQiIGlmIEVYUEVSVA0KPj4gKwlkZXBl
bmRzIG9uIEhBU19ET00wICYmIEhBU19ERVZJQ0VfVFJFRSAmJiBET01BSU5fQlVJTERfSEVMUEVS
Uw0KPj4gKwlkZWZhdWx0IHkNCj4+ICsJaGVscA0KPj4gKwkgIERvbTAgYm9vdCBzdXBwb3J0IGVu
YWJsZXMgWGVuIHRvIGJvb3QgdG8gdGhlIGNvbnRyb2wgZG9tYWluIChEb20wKSBhbmQNCj4+ICsJ
ICBtYW5hZ2UgZG9tVSBndWVzdHMgdXNpbmcgdGhlIFhlbiB0b29sc3RhY2sgd2l0aCBwcm92aWRl
ZCBjb25maWd1cmF0aW9ucy4NCj4gV2hhdCBhYm91dCBub24tQXJtPyB4ODYgaGFzIGEgRG9tMCB0
b28sIGJ1dCBkb2Vzbid0IHNlbGVjdCBIQVNfRE9NMC4gSXQNCj4gYWN0dWFsbHkgcmVxdWlyZXMg
YSBEb20wIGZvciBub3csIHNvIHRvIG1lIEhBU19ET00wIGlzIGEgbWlzbm9tZXIuIE1heWJlDQo+
IEhBU19PUFRJT05BTF9ET00wPw0KUmlnaHQgbm93IERPTTBfQk9PVCBpcyB0aGUgb25seSBvcHRp
b24gZm9yIHg4NiBzbyBJJ3ZlIG1hZGUgdGhlIGNoYW5nZXMgDQpvbmx5IGZvciBhcm0uDQpCdXQg
SSdtIHN0aWxsIGxlYXZpbmcgdGhlc2Ugb3B0aW9ucyBpbiBjb21tb24gYmVjYXVzZSBJSVVDIGRv
bTBsZXNzIGZvciANCng4Ni9oeXBlcmxhdWNoIHN1cHBvcnQNCmlzIGluIG1lcmdlIHByb2Nlc3Mg
cmlnaHQgbm93LiBTbyBvbmNlIGl0IG1lcmdlZCB0aGlzIHBhcmFtZXRlciBjb3VsZCBiZSANCnVz
ZWQgZm9yIHg4NiBhcmNoLg0KPj4gQEAgLTkyLDYgKzEwMCw5IEBAIGNvbmZpZyBIQVNfREVWSUNF
X1RSRUUNCj4+ICAgY29uZmlnIEhBU19ET00wTEVTUw0KPj4gICAJYm9vbA0KPj4gICANCj4+ICtj
b25maWcgSEFTX0RPTTANCj4+ICsJYm9vbA0KPiBTYW1lIGhlcmUgYXMgdG8gc29ydGluZywgbm8g
bWF0dGVyIHRoYXQgLi4uDQo+DQorDQo+PiAgIGNvbmZpZyBIQVNfRElUICMgRGF0YSBJbmRlcGVu
ZGVudCBUaW1pbmcNCj4+ICAgCWJvb2wNCj4+ICAgDQo+IC4uLiBIQVNfRE9NMExFU1MgYW5kIHRo
aXMgb25lIGFyZSBtaXNwbGFjZWQgd2l0aCBvbmUgYW5vdGhlci4NCj4NCj4gSmFuDQo=


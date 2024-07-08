Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D96929AC4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 04:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754973.1163230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQe71-0004H2-5b; Mon, 08 Jul 2024 02:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754973.1163230; Mon, 08 Jul 2024 02:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQe71-0004Ed-2b; Mon, 08 Jul 2024 02:28:19 +0000
Received: by outflank-mailman (input) for mailman id 754973;
 Mon, 08 Jul 2024 02:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQe6z-0004EX-Lb
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 02:28:17 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba861ae3-3cd1-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 04:28:16 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 02:28:11 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 02:28:11 +0000
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
X-Inumbo-ID: ba861ae3-3cd1-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9xAoDcWZ/dwcyvm2pai29bNH2xSAnuH8xQX5m+OHCg1xPrYhsr8PPsYlgjmpF5SyajTHw2sr2ZMiuSSjarlciTlNC6kWRXoR9VSK1SjMDr6bP6kfU+c07dCl9gsJt3jwb2b4PAwO93z16pYeeDxwdPzA4uSbcVH5eyv9nUuH3E9Ba+MEqZAxaNhzbOD2Z6m44gd8Uyo0IMGzLgL7Fgp1EkkuBxYdzpqZgihYxn21b6dJk8Ww6G+/+M/R/bqXFk/BYxbHc0W+PNcYTNLgA8LtYdCdmEL8PSj/RhbHAT4iMlJPjz1MsJrFcbdQYzwixmROsmHN+Hkc/XI/VhAaeBBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7kOH/f8zIGlZ74zLRBOOpvH0VSBERzgYfBjAtmOQFA=;
 b=klYajPPVMcYYBtb1BvhOARFeWFbfTaq/ECT9GRPBAUK8XWvK3WKxFgdgSkdJ3wXrScN64kNkIFUsqkf7jDT08mLcdCq9mKsUWur3pOMcAjaLzCe4mm7O4zpOtDCi5FfzFptHna6XPqqZvN0LrJDjecRyfgbniStjm/8x4+m3mN49zPEbEOCkR8A1dx6FF/KYICKTCuxAQM7gHN94GkeSZQw+VGCh81Uz6Qb63h81318spLS0KJhmuCBu7h2TufsHJsk+Q0O074ffUjoAbM2UGxRNNrQbNCDRCquDp1yY+S6sFepa+rRl4li3PxdpCx6kjCOYKMoN1TqNBJGhgsC8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7kOH/f8zIGlZ74zLRBOOpvH0VSBERzgYfBjAtmOQFA=;
 b=DsY8bhmaU6j8dMl5uv7iJf9Y0UuC606hkvHHjrrsjiQg+tmhwxrtUR4YeAy0uqn+1m+mxzezDVQAKau4xcZ3+v9Sd7ybc7xj4V9/2af59QjwyxZAxYUPTr9upBDhDszw+nwLOAoqySfTkEnIM0rAhCmM/mw9z6y0LnMDkE7th0Y=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v11 5/8] x86/domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [XEN PATCH v11 5/8] x86/domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index: AQHayunXeOD/UI5IqEOcc1Zu6HQmVrHml5KAgAYS6IA=
Date: Mon, 8 Jul 2024 02:28:11 +0000
Message-ID:
 <BL1PR12MB5849DC624AE25635C4BFC417E7DA2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-6-Jiqian.Chen@amd.com>
 <a02cea93-b04b-484c-b3e0-dd5f6823196e@suse.com>
In-Reply-To: <a02cea93-b04b-484c-b3e0-dd5f6823196e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7741.016)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY5PR12MB6226:EE_
x-ms-office365-filtering-correlation-id: 26e4f521-9432-4bc5-d866-08dc9ef59ca9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0NreElTSVNQK1lIZUFZVDBUNWV3K3hWb3Bzb1R6ZjZlRHc4SHdyZnlQbWRF?=
 =?utf-8?B?bGFzMDA3VERldDlEM2lNUDk4VzMxNXh6eEoxb094WXhjYUJjOU1ucy9wQlQz?=
 =?utf-8?B?cjJKNVJkRHJ0UUZKWFMyaXk2WHhPZ1N5cVVvaXJaK05hQ0poT3cyWTBhNlkw?=
 =?utf-8?B?eXl6clhWYVlreEFKOENEcW4yNVdlZDdBZnkvY2ZDSXlNOGVCVFp4ciswcTB5?=
 =?utf-8?B?aDRiY1MwcmQwa2pOazJQS2NwU0s1TzVqN0xLR1pDSERsQUc1dEp0VFBCNXN2?=
 =?utf-8?B?UkhZYks4djEydXdZZmxiRFg1VUFoUUhudHMrWGJ1aEJoSGtSOHJVdkp3Vm5z?=
 =?utf-8?B?aGQ0NnlqV2ozajcwam84MFllZDVNUU8xS2VBblo0MTFib3FMOVZpc2pDM0J3?=
 =?utf-8?B?eGkzd1p1QldkazdjQlF6RVB5R05zVGtuOFZOUTZyL2xTMnpxTXFoQW1xWUZQ?=
 =?utf-8?B?cGtvQUp4NWlILzUzNmVzNy80SkFDRFp0allkTW1xc1Fqb0JlcUxTWkZsSG1u?=
 =?utf-8?B?dWFMZURjYlhMQ0dqQVp0ZG1tbVUrajc4V2FyRjd4S2VldUtVVU1TaGZMc1hH?=
 =?utf-8?B?R20yY3NiTWVvMzJ2R1RXeUtiL01VK3BJVjA5YkN3cXBXSng1VDU3Q3VJNS9R?=
 =?utf-8?B?c1hBUWpKa2hJRUtEWi9NMG16NEtTQ3BvM0dKN21PaDVvbHczbUluQndNVU5R?=
 =?utf-8?B?Q2lCaDh5WFc2VThKZERDWnI3eUVUb09UTXdIRnMrTCtMUUtndGcwdXdKZnFa?=
 =?utf-8?B?ZHVwY29uQ1Q5aGNkaFdUWVFramloV0NrMjlOS2dXYW9iRGc1OHF4V29qcStw?=
 =?utf-8?B?VGJHczRrL3MreWZualA4a1ZkbGVxV1BaRWlHMzU4N2ZIdDBjVmJVQlF1bW1M?=
 =?utf-8?B?YlhNSzdsS3dtSjJGUGRYYWRraFhrQ2Fjb05pbkVtS2tjWGxDRDlJQitFS3p0?=
 =?utf-8?B?eEt6UWF4b2hteGo3cEtpMWIvekI1ZnBpaWx0aTluZVAwZGRsRzU2NlQxelRY?=
 =?utf-8?B?VGVQUEN4YTBuRGNNWkVvRzdxVFVmY3psYm93SEhIUnF0RStRV1dLbXhPNkdS?=
 =?utf-8?B?SWpZN3VVM3FMU3d4d0dJN3h3eVhjOG9yU0xmOUdSd1Q2TnJzMjg5T0lMdHZZ?=
 =?utf-8?B?YWdsQ1V4MjNrTVFPL05GVWFZWUVzeHdYcTBGanJvQVg2dFVBU2dRbU81bWpE?=
 =?utf-8?B?OS9HclBDVTN5Vk05UzdwdDkyY3JNVk1seGJDM2ttc0hOYjNFVnNoRm9vQjBu?=
 =?utf-8?B?bjBuV2ttOWMyUjIrNFJSS09BRk1odGtRSC82bzBxWEgxbWMwSlNQOTFjbk1V?=
 =?utf-8?B?QTA5RTkwelRpRlZCYXVkR0Jhc203RzR3MnJMcU84RC85cGJYWUsrWmE1Zllv?=
 =?utf-8?B?Qk00VmNNNXR0V21xTHVrY2l2VVpiY25kQVJDSXJHYWU1bTRjM3U5bkl3bkRU?=
 =?utf-8?B?SzArUC8zZDk5b0UzVFJvM2NZLzV1SXpoak9UQzNyWHc3UE05blRWb1BVTjBs?=
 =?utf-8?B?bEZRKys2SjhCRzBELzF2emlwSzMyUHRBcHNKa3lmOGZsTjlBajNkeDZQcS9i?=
 =?utf-8?B?M3FCOWpIblMveHNxTWdJNWVHd0NvQzFFZUJFaVkxdWNvS0c1MWw4Nm8wSE5C?=
 =?utf-8?B?K0p6NFBrUEw3dW1SWnhkaytIcFVIR3ladnpWTlFoaUU4R0J1MW5qNXVhUFpl?=
 =?utf-8?B?ZTZybFkxd2x3Wmc5bVRhT0szSzRwcVNqUjRsc25zam90ZUZ2bHVWRTh0SVdY?=
 =?utf-8?B?YVk3bTF6Q1BXZDZPbWIrSG1hdzQyUlFTSytkdVVkY0VLTHY1OGNQNjdLbkpG?=
 =?utf-8?B?WmtLWkxwNlVZemJqMEFsdVVieHlTY0V6aWd3WFdPL0k4THFJdjRvUFNZdFQx?=
 =?utf-8?B?dHpNNU53d2pHdk5CbXNrbzB5aUpCb3pLY204UmNENSszRGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHZJUFNuUFZ6Z3BOR0ZwUlMxdmpsMncycThSdlg1aDNvUFpyS1BOTDkzcW9D?=
 =?utf-8?B?bmp6N3dNc2gzUUNUa1g0cHhXSmFmbjFxNkhvMVZyRmtVK0JZR2p5QkNKKzd2?=
 =?utf-8?B?ZWg3UnBoZUtaenFSbG9qeUpGcDJ4ZUI3cHNjbHVwc2xyMnpzeEtYWjRIS1dZ?=
 =?utf-8?B?MzM2bnd6ajRWUWFtOHp1bklwQlVYWDVCenEyRFpua2ttaFdyVzRaM2lmcnlX?=
 =?utf-8?B?dzU0ZXRCRWtHU2JUZkgreHVqSE1Ea1dWeHpKYVRmZ3hYUDlPUmYwM1ZLekR6?=
 =?utf-8?B?MlhIQjhVVHVGUU0zejU1NGpoeTE4eThydHlKQm15VzBtZFNmcVA2MFNoclJ1?=
 =?utf-8?B?ekNTZUlOdEd0ZGRVL0s4clZkaVdsREJwZkNzdHBhVHlFeXBidmVQd2xLaEo3?=
 =?utf-8?B?UHlPblM0L2xCeXNsN1J6ZHhoVzVPN0dackRpRDg0RlNyWjFmVFNCYmtWMWZV?=
 =?utf-8?B?VGxQNlRJRXZ1cGs0YWFLT2tmbFJmbDZ0U29xbkVWdEhnRE5meGt5M3diMVRY?=
 =?utf-8?B?dXBaRFBzNHVTdnQxOVE0dnNGUEt2VVZ5M0hqVXZtdFBoYXE3bWFLOEN1WHUx?=
 =?utf-8?B?ajg0SCtScnJUK0czN3RVa0FISWt3RUpVOXY4MVdUN1Mya1N5RFZGbTNFbll6?=
 =?utf-8?B?amo2THlyMDA4S0dpZXdva3dTQUYyVU42b3hyRVpmZ3l1V1A1R1ZUTkt6S2V5?=
 =?utf-8?B?MSsvOGthbkQ5SjFtZGRLdmZDZzFRNDJRd2xuTnR5ZEQ2Zm9rWTdHVGlrM1dk?=
 =?utf-8?B?RGZKajJYcFd3N3NBR2NVT3NvQXArbTk5M2srVGNOOE5XbWVqbU9tZlp6L2pM?=
 =?utf-8?B?OFk1UVAxNEs4WklnZ1ZXck4zR1cyNmtiSmJhL3F1bFowcHZZTXhVMFI0VUU5?=
 =?utf-8?B?V2p6M0FHY3dxbHhyaDBuM0x1d2FwaVlzcmVqMStxQitHVmtEQTBzakVNVmw1?=
 =?utf-8?B?RjYrbFg5VDlqTDFITnlUSlpXellEckFDNTE0eCtYYkN5VDBhSUh0Nit4czFB?=
 =?utf-8?B?OEczVmZIMFBvZ3Y4YTh4ekJ1OWxHRHBuWlJxd1BQWjcvek52UFZjL1ljcGNz?=
 =?utf-8?B?akpZRVRadXR5dy9XR0hWeWdSZzYwdS9GMXQvZVFXY3NnTGZSSXFCN2dDQ2RO?=
 =?utf-8?B?VGlaQXR2N0l6Q084bi8ycDQvakRkb0orQ3NJakVKM0Q1K0dpd0tQL0pWRXNJ?=
 =?utf-8?B?d3R2OUszTHliZ1NVUTJ1SHI3dmR2N1RRZjNwSlRRZU1ON0FTZUhVRlZXMG1S?=
 =?utf-8?B?YnN2WVFvUWVLRkpINHgzaEFaSVRQMHkxN0pYZ0lFTDhlUjZoUGo5K3BXeHR6?=
 =?utf-8?B?ODBPQ0ZsdnIyNENZcG5VWHV4SDVHT0RoZmJ2a3J2ZnIwRGhOVDhqZ3lXbmFu?=
 =?utf-8?B?dCtOREhFOGFQUWtPYlFNMXc2b3AydDR6dmVrMEFPVWpkS0JzSTdPdkE5aE5q?=
 =?utf-8?B?MFNmREUxZHplRDgvNSs1S21nOGZ1TEVoNUxQM2VMRUFuelNxSHdya2N4QlZr?=
 =?utf-8?B?eTBHdGlrRnVLL3oyR3lsVjk1Ulh3cWs1eVkzZUx3dzkwaG5saEZQZzV0S3Jj?=
 =?utf-8?B?OGV5L1BhWmRYUDg0djZmaU1FY0N2N3BydmpGRDZKOXVCZlJOVGdYWWxlaVNC?=
 =?utf-8?B?VGs5VXhJb2Q4V1dVRmp2UEFxUFQreXNZRWZBZXhaRENnT0ZEakYrUExISUFC?=
 =?utf-8?B?NVZqeHRMTFk3NmpDcjQ1OVdWdHhDd3pRU3d1YVVGblBIU3ZzSmR3LzNWK3lu?=
 =?utf-8?B?ZVdVSWh1L0NsQXlWRmtZa2cvTFg2ckY3Q3dRd280M0poaVFtUEJEYlUvZFJk?=
 =?utf-8?B?TGNsdlR6UFpEQStZMVdpOVNibWVNcS9yZmJXbUhqbHVRZ01LY3lNSWVkem85?=
 =?utf-8?B?aFdlQklXRGtxQ3NDVG5oZHArQm5kWS9ybUtUVkcyM0htNklxdEJCenRzUWlV?=
 =?utf-8?B?aTFZbXU5anlwcHJVUUFzRnVXQzdCdmYvdjZwYzV4WFFQWmNxWmxCMVhSVUIv?=
 =?utf-8?B?VEVTNDdHQXI2bG45aUdmaGJ6dTNNNHR3dFZoOGo2VmhGZi9JZzRZMjNXRUxq?=
 =?utf-8?B?anZOdkQ3ODN0MktXRTRyNTJVa21PRTFBUTlKYkpSVTNYNHUvTU1rTC9BTEk0?=
 =?utf-8?Q?PJA8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECC6FA85A557024FBF5836FF98DC9F88@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e4f521-9432-4bc5-d866-08dc9ef59ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 02:28:11.1740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2OgiVHMEkAwEA+Rke4OsED86wUuapHPX1nG4ErWViYSQGbalciIWwLtIPKKoHOaQqiVAWbPuEgtEPI6i3+1I+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226

T24gMjAyNC83LzQgMjE6MzMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNi4yMDI0IDE0
OjMzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IEBAIC0yMzcsNiArMjM4LDM4IEBAIGxvbmcgYXJj
aF9kb19kb21jdGwoDQo+PiAgICAgICAgICBicmVhazsNCj4+ICAgICAgfQ0KPj4gIA0KPj4gKyAg
ICBjYXNlIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb246DQo+PiArICAgIHsNCj4+ICsgICAgICAg
IGludCBpcnE7DQo+PiArICAgICAgICB1aW50OF90IG1hc2sgPSAxOw0KPj4gKyAgICAgICAgdW5z
aWduZWQgaW50IGdzaSA9IGRvbWN0bC0+dS5nc2lfcGVybWlzc2lvbi5nc2k7DQo+PiArICAgICAg
ICBib29sIGFsbG93ID0gZG9tY3RsLT51LmdzaV9wZXJtaXNzaW9uLmFsbG93X2FjY2VzczsNCj4+
ICsNCj4+ICsgICAgICAgIC8qIENoZWNrIGFsbCBiaXRzIGFuZCBwYWRzIGFyZSB6ZXJvIGV4Y2Vw
dCBsb3dlc3QgYml0ICovDQo+PiArICAgICAgICByZXQgPSAtRUlOVkFMOw0KPj4gKyAgICAgICAg
aWYgKCBkb21jdGwtPnUuZ3NpX3Blcm1pc3Npb24uYWxsb3dfYWNjZXNzICYgKCAhbWFzayApICkN
Cj4+ICsgICAgICAgICAgICBnb3RvIGdzaV9wZXJtaXNzaW9uX291dDsNCj4gDQo+IEknbSBwcmV0
dHkgc3VyZSB0aGF0IGlmIHlvdSBoYWQsIGFzIHdvdWxkIGhhdmUgYmVlbiBleHBlY3RlZCwgYWRk
ZWQgYQ0KPiAjZGVmaW5lIHRvIHRoZSBwdWJsaWMgaGVhZGVyIGZvciBqdXN0IHRoZSBsb3cgYml0
IHlvdSBhc3NpZ24gbWVhbmluZyB0bywNCj4geW91IHdvdWxkbid0IGhhdmUgY2F1c2VkIHlvdXJz
ZWxmIHByb2JsZW1zIGhlcmUuIEZvciBvbmUsIHRoZQ0KPiBpbml0aWFsaXplciBmb3IgImFsbG93
IiB3aWxsIGJlIGVhc3kgdG8gbWlzcyBpZiBtZWFuaW5nIGlzIGFzc2lnbmVkIHRvDQo+IGFub3Ro
ZXIgb2YgdGhlIGJpdHMuIEl0IHNhZGx5IF9zdGlsbF8gdGFrZXMgdGhlIGZ1bGwgOCBiaXRzIGFu
ZA0KPiBjb252ZXJ0cyB0aG9zZSB0byBhIGJvb2xlYW4uIEFuZCB0aGVuIHRoZSBjaGVjayBoZXJl
IHdvbid0IHdvcmsgZWl0aGVyLg0KPiBJIGRvbid0IHNlZSB3aGF0IHVzZSB0aGUgbG9jYWwgdmFy
aWFibGUgIm1hc2siIGlzLCBidXQgYXQgdGhlIHZlcnkNCj4gbGVhc3QgSSBleHBlY3QgaW4gcGxh
Y2Ugb2YgISB5b3UgbWVhbiB+IHJlYWxseS4NCj4gDQo+PiArICAgICAgICBmb3IgKCBpID0gMDsg
aSA8IEFSUkFZX1NJWkUoZG9tY3RsLT51LmdzaV9wZXJtaXNzaW9uLnBhZCk7ICsraSApDQo+PiAr
ICAgICAgICAgICAgaWYgKCBkb21jdGwtPnUuZ3NpX3Blcm1pc3Npb24ucGFkW2ldICkNCj4+ICsg
ICAgICAgICAgICAgICAgZ290byBnc2lfcGVybWlzc2lvbl9vdXQ7DQo+PiArDQo+PiArICAgICAg
ICBpZiAoIGdzaSA+PSBucl9pcnFzX2dzaSB8fCAoIGlycSA9IGdzaV8yX2lycShnc2kpICkgPCAw
ICkNCj4gDQo+IG5yX2lycXNfZ3NpIGlzIHRoZSB1cHBlciBib3VuZCBvbiBJUlFzIHJlcHJlc2Vu
dGluZyBhIEdTSTsgYXMgc2FpZCBiZWZvcmUsDQo+IEdTSXMgYW5kIElSUXMgYXJlIGRpZmZlcmVu
dCBudW1iZXIgc3BhY2VzLCBhbmQgaGVuY2UgeW91IGNhbid0IGNvbXBhcmUNCj4gZ3NpIGFnYWlu
c3QgbnJfaXJxc19nc2kuIFRoZSAoaW5jbHVzaXZlKSB1cHBlciBib3VuZCBvbiAodmFsaWQpIEdT
SXMgaXMNCj4gbXBfaW9hcGljX3JvdXRpbmdbbnJfaW9hcGljcyAtIDFdLmdzaV9lbmQsIG9yIHRo
ZSByZXR1cm4gdmFsdWUgb2YNCj4gaGlnaGVzdF9nc2koKS4NCldpbGwgY2hhbmdlIHRvIGhpZ2hl
c3RfZ3NpIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gQWxzbywgc3R5bGUgbml0OiBCbGFua3Mg
YmVsb25nIGltbWVkaWF0ZWx5IGluc2lkZSBwYXJlbnRoZXNlcyBvbmx5IGZvciB0aGUNCj4gb3V0
ZXIgcGFpciBvZiBjb250cm9sIHN0YXRlbWVudHM7IG5vIGlubmVyIGV4cHJlc3Npb25zIHNob3Vs
ZCBoYXZlIHRoZW0gdGhpcw0KPiB3YXkuDQo+IA0KPiBGaW5hbGx5IEknZCBsaWtlIHRvIGFzayB0
aGF0IHlvdSB1c2UgIjw9IDAiLCBhcyB3ZSBkbyBpbiB2YXJpb3VzIHBsYWNlcw0KPiBlbHNld2hl
cmUuIElSUTAgaXMgdGhlIHRpbWVyIGludGVycnVwdDsgd2UgbmV2ZXIgd2FudCB0byBoYXZlIHRo
YXQgdXNlZCBieQ0KPiBhbnkgZW50aXR5IG91dHNpZGUgb2YgWGVuIGl0c2VsZi4NCj4gDQo+PiAt
LS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy9kb21jdGwuaA0KPj4gQEAgLTQ2NCw2ICs0NjQsMTIgQEAgc3RydWN0IHhlbl9kb21jdGxf
aXJxX3Blcm1pc3Npb24gew0KPj4gICAgICB1aW50OF90IHBhZFszXTsNCj4+ICB9Ow0KPj4gIA0K
Pj4gKy8qIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24gKi8NCj4+ICtzdHJ1Y3QgeGVuX2RvbWN0
bF9nc2lfcGVybWlzc2lvbiB7DQo+PiArICAgIHVpbnQzMl90IGdzaTsNCj4+ICsgICAgdWludDhf
dCBhbGxvd19hY2Nlc3M7ICAgIC8qIGZsYWcgdG8gc3BlY2lmeSBlbmFibGUvZGlzYWJsZSBvZiB4
ODYgZ3NpIGFjY2VzcyAqLw0KPiANCj4gU2VlIGFib3ZlLiBJdCdzIG5vdCB0aGUgZmllbGQgdGhh
dCBzZXJ2ZXMgYXMgYSBmbGFnIGZvciB0aGUgcHVycG9zZSB5b3UNCj4gc3RhdGUsIGJ1dCBqdXN0
IHRoZSBsb3cgYml0LiBZb3Ugd2FudCB0byByZW5hbWUgdGhlIGZpZWxkIChmbGFncz8pIGFuZA0K
PiAjZGVmaW5lIGEgc3VpdGFibGUgY29uc3RhbnQuDQoNCllvdSBtZWFuPw0KDQpzdHJ1Y3QgeGVu
X2RvbWN0bF9nc2lfcGVybWlzc2lvbiB7DQogICAgdWludDMyX3QgZ3NpOw0KI2RlZmluZSBHU0lf
UEVSTUlTU0lPTl9NQVNLICAgIDENCiNkZWZpbmUgR1NJX1BFUk1JU1NJT05fRElTQUJMRSAwDQoj
ZGVmaW5lIEdTSV9QRVJNSVNTSU9OX0VOQUJMRSAgMQ0KICAgIHVpbnQ4X3QgYWNjZXNzX2ZsYWc7
ICAgIC8qIGZsYWcgdG8gc3BlY2lmeSBlbmFibGUvZGlzYWJsZSBvZiB4ODYgZ3NpIGFjY2VzcyAq
Lw0KICAgIHVpbnQ4X3QgcGFkWzNdOw0KfTsNCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdh
cmRzLA0KSmlxaWFuIENoZW4uDQo=


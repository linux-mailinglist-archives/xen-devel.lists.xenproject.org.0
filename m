Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18812929AB7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 04:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754965.1163220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQdwe-0002b0-3U; Mon, 08 Jul 2024 02:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754965.1163220; Mon, 08 Jul 2024 02:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQdwd-0002Xp-Vv; Mon, 08 Jul 2024 02:17:35 +0000
Received: by outflank-mailman (input) for mailman id 754965;
 Mon, 08 Jul 2024 02:17:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQdwc-0002Xg-0n
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 02:17:34 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a2f69e4-3cd0-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 04:17:31 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 02:17:26 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 02:17:26 +0000
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
X-Inumbo-ID: 3a2f69e4-3cd0-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXxx0m7RQziMm9UXW42/3e7WWwOUs0+TD3rZY1vDD4Q0tLDkBvCY4Ng8f7BChN1pu+9lujqgVDTP3lH7v5xVP1mzjLk/M3Z8E/5gonSxxUHLfVu9epQpCFc16eht+xXat9QZgj9jRhccO1IRb0kSDSZl74O/rYqXNPnJ1leBOTgBskQV2Mcd0TCLkTYYQIKeT5bnpyz4pZ+WZc5G4OZo+wFdkWJ4PPoK88Y2V3ZbwM9UjUO3VM7ee5eTTXK/pFHEJXTNiCRmfyE3VOdAB0bKAXWWjL/lwzqnLUdDhIwEfj405RkRxZue1FPavgh0gncsmOOvy0Cb0Cr21e0cJaUizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G2kJG1ubey1prHGg9S3gq7Kbltp9rBYFy6FIa7H78I=;
 b=fFwX6LYV3yg9LdqpdVo7IWKR9aXr2dp1F1XvdmwDRhKJ/HH4EE9NQE9LuX6g87svHxFjPSgpIKbfxNVa6n880nWMR3C1aDMHggeWWPpo9YHRVR87MScrmmeQmVTimlu7ILbdiKx788KT0ftxmsw7zi+6bttJ1Em7IqJmdUFQJrLjivC+AEeZx0zpmmQJ9uOXxvXdvsxcqF6sMjVd9TActxMwyknjZeb3UuQyDS5XhvVLojhOwbPvz65UsNR04ccDkloqlSVH04l0yvpRaE2Pn841ZWcvJM/Th8volSa/os8uIVgku/ILGuLotENjeZPhs0gVskpqI5PFHDrJMcVLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G2kJG1ubey1prHGg9S3gq7Kbltp9rBYFy6FIa7H78I=;
 b=nIsJ7tYI269ZflYcJ/Pi+DqwqpEiKJomOCBalrR9voAtgwdvVoPcYHPhyy3J8a39ZyZ7LknIFCOoYYpcYSyyr2hsPH5x2a/ctMUYRuSuImXVf9IE+Y1pP+k9X0sWzuoVxmkilrlrDeZloUrnEyUuJI3qgw2F3E4OcyoeHBJ87kQ=
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
Subject: Re: [XEN PATCH v11 4/8] x86/physdev: Return pirq that irq was already
 mapped to
Thread-Topic: [XEN PATCH v11 4/8] x86/physdev: Return pirq that irq was
 already mapped to
Thread-Index: AQHayunUrYgDYrs6yUuu722r8ryT1LHmiusAgAYeu4A=
Date: Mon, 8 Jul 2024 02:17:25 +0000
Message-ID:
 <BL1PR12MB58493580EE06C27D54B56CAEE7DA2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-5-Jiqian.Chen@amd.com>
 <9dc7f974-de7b-408a-915c-ee0724eaebcd@suse.com>
In-Reply-To: <9dc7f974-de7b-408a-915c-ee0724eaebcd@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7193:EE_
x-ms-office365-filtering-correlation-id: 07fe539b-95a6-44fd-ed8b-08dc9ef41c0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S2ZYK0piUUZrWFE4RVhJSTFxaldQa1JaM01oVitiTHZudC8wZzJKdmlLSTVk?=
 =?utf-8?B?bDdWU0lLTEFnVnZtLzJsT2dVMmtIVUxvK0JyVHlWQ3RxKzNRMkVoYVFwRDFq?=
 =?utf-8?B?UGpaZzR6dTdCcGE2WXNPU09IOVRhSTFtNGlVa3VYTnlvb3lObGVrZC83UGhR?=
 =?utf-8?B?a0puVGMyMElOQ01sSmtxaHFYMVh2SkloQjF2aDRFZUhXc3VxOE5ta0lEdVYy?=
 =?utf-8?B?KzdyS01PZGtjWTBOY292VWQzdk9nWWVvd3VGTGJKSUovU1JTNHp0MjMvcE94?=
 =?utf-8?B?QzNsVTJYUTVyMVVCVXE1WWcwdU9talJNL2pzMGEvY2tzb2xUZ21XR0dhVnN5?=
 =?utf-8?B?MDBVcmg4d3cySUxlMTllbVM5bkJ3Mk1kRmNFTXo1WnNTblh5V1J5aExiODlV?=
 =?utf-8?B?ZmN6WEp1R0FxbHJQc0tITko4bkJoSzdncklNZ1pxd2ZNSDNDRUU5cGZ1eCtt?=
 =?utf-8?B?bzBJNjhhZVlRdS9lYmx4M042TElxOW1VWHVGRjdsQVFQc28rUDQ5OG54Z0Jw?=
 =?utf-8?B?ZFM1blRQQlprY0JKOVlNK09iT3ozelEzckNpMHBiUHZFUmxoMUJmRjlPZE81?=
 =?utf-8?B?eVpLZEo2TDRCTHRKSkE1YlphSklwd1QrYjQrRFhwT1JiSk80T0pERUdxZkVZ?=
 =?utf-8?B?cUhCWFFVZTYrREMwV0tPSEtSaXJNRTl6QTJQajkzU010YTJ1TWhzQTFvMUk1?=
 =?utf-8?B?T3Q5b2JsVlIxR0djUEx0RHN2SlFoNjQ1bno5ZmZCUHVHbWFMNUNha3RYSkla?=
 =?utf-8?B?SEQ4K1gzQzBhUXlLMEVwcTlTVVNZMkdKQWVucEloa05BS0VsVkQ5QU1xdy9F?=
 =?utf-8?B?eVVOUmV0K0pTZnpjeDVlaXJrUHZOV0svUUQxK3FQRWtQeXNYQkc3MEhNYmpV?=
 =?utf-8?B?UktyN2JoMVNJanVLcm41SG55aytyQTFnY01qREdBUFhEVWdMY3V0TDBveVMx?=
 =?utf-8?B?REc1UEJia0ZlbDBoQnJEZ1BEOTg0Vnhab253Z0NKQnZQY1duWG1nSy90MEpj?=
 =?utf-8?B?NlFDZ2F5MGVjcmc5TlpIeGtsRGJlSExKMU9vU0ZiTXNJSUNBWkNUaDFqVml0?=
 =?utf-8?B?RFd5ZVdmZWtheGRBcWFtaENwcXVrWjlpckZQWmk4cE5lU0s2Ym5XZDZjZXZU?=
 =?utf-8?B?aXdZR0JhUkRTNlNOL3FNMTc0ZWFvRkxkSzdnYW5COW1GQUxRZGxXN3lQM2g1?=
 =?utf-8?B?RC9LN3IvMnFPb2FYOENyWkpjcWpVeFFPd0xoK0hHL0dxVkNtVk9WeEVzY2pp?=
 =?utf-8?B?R244U0VabWt6RlZZTGtycXZLb1ZxN01SQWg3R1VRZytyNmZMUE1MS3pxVTZv?=
 =?utf-8?B?WFlRdXJwa2sveHdIbFpQZDFYTS91MSs1bnVhZVB1ZkZ6cDZXaG1nM1hxdVBj?=
 =?utf-8?B?NlE1Mlk3ZThSaXBZUCtzZ3F6SWNMZXpMT0h0eDBQdmlYd0pkSW0va3pGaTRV?=
 =?utf-8?B?N0tTVHRsSGZCaVhiSXl3M2lXdGd1ZnltMkRrVlFEMkVwdXJ2K0VEVzhQVVpK?=
 =?utf-8?B?WXNIVFJWNHV3ZzIrb0ZzZDI3Qk9tYVY0enh2Y2ZBb2VGcGtjQ3RFV2NzVW0z?=
 =?utf-8?B?OUFQbDVHTGVHY3BNUkQ3VitrM2sxY0ZIR1NReHhaL09zR1pNTC8zenc2YkMz?=
 =?utf-8?B?YVZGVUlGN3BSdEN2WGp4MnR6d1BzRGJWaHVDOEpwV3BvV0E5aU9aeGd2UzJi?=
 =?utf-8?B?K0hFMzFSMTErbmpnU2VOUmRFOFVieWI5M1ZaYVl6aytibmx4MmU1aVlpeDVG?=
 =?utf-8?B?ejB5ZEFiRjEyOUVjNWt3M01OUCs2dkg1MndUWktqNkoranpPbTRrRnM2WDdM?=
 =?utf-8?B?TStDWTlIRW53clVRb1Yxd09wREhKb0VFQzJjOUxBcVZOMklBMjhEeVhieHNP?=
 =?utf-8?B?aFJRblRuRG04WGl4aTQyaGZaaENWRTdVZFlLbzFaZGhjeHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ek5neEhlVG5FVk14QjE5c0NvU2l1cEhLN1NRSjlMSUVoKzZxelVlUGw0YWw5?=
 =?utf-8?B?Y0RCaTNqdStBOHNhc00xMko2Tm1pd3IyelFHYUdKck8ydnJSNkdlNFlNR2Rn?=
 =?utf-8?B?TGUyczY1TjRENUtuWXV3L0JTMTN2bWlOYStTOUpPOEIzWlRaSXM2SlFBNDFJ?=
 =?utf-8?B?VW1Xay9ESE9EQWJDRG0wMW9zYmZKS2tKdXd2d0gzMmpTS1h3aXlsRnlrdVlN?=
 =?utf-8?B?aEVJQWtMcHFkTjM2TGFOTklxYzJWcmd1YmQ1MDBJTllYVjRMdG9vMVpEYTlW?=
 =?utf-8?B?WHZYK1o4UUJwWU5xT3Q1OGNiVHkxM0JydXlKSjlkemJWa3ZRUWZHRmdsSndV?=
 =?utf-8?B?alVCMVo0YnNEWldCUGtXcnIybmVxdE9sSVRiR1FEWFl0dWphMi8vNzlHSzVD?=
 =?utf-8?B?SDl3alJIN1ZETTBVU0c2L1RYRnZUbWhzK1lEKzVKQWhjREFTeGRtdFRsR2Ft?=
 =?utf-8?B?UmhLV3FqZkFGVkhOeldIL2xtVkdlb2F0c2ZQbGRGU3JJT09OSVV6aktNa090?=
 =?utf-8?B?dEJkaFllSk5kMUZqOHRKSFNWZWNqNTVYS1NFbUFqRnhyOUxvSnBYZ0JVT3pC?=
 =?utf-8?B?Z1RyOTBCYmZtOUljWGxRekd6Tm8xZGtIOE9GOXRlRzhaRWcxekYxVHBhRlJU?=
 =?utf-8?B?VWxXaDZaNTlBNkNCUEZEdk5GRjY0NEdsYVhSbnVpRXRkYkRyZDA4cUF3Uytv?=
 =?utf-8?B?OGR4a2VwNTREYk8zeCtMSWFmaFJqMWx0L0pIUGprY2JyaXU5LzNiSGdCMis2?=
 =?utf-8?B?enUxSEFRS2FiN2J0dytyUmRYd2RMK0RNTm9DVWRtMlZ3OFVBQTIzRTl5UDYy?=
 =?utf-8?B?U3E3SWlxM3dJem1RNFVHemx0ZTFMeTF6cDZoSm1uRUVwVE1YV2wyYXRlOEtY?=
 =?utf-8?B?VE92enBuazk2c3hYS1gvYlhUTUhDbnpXVFZIWVRVNHY1eDc2U29wTm1VY0R6?=
 =?utf-8?B?YW0rWkp3VjVPeU9JZ2dMZUhsSE9xc0NBUExyTEZ0UUg3TFlxbTZnMExZTXMw?=
 =?utf-8?B?TU9neHhBK1h0WWp1M1h6VUlMb3dJTmxhZklYRjZUZlpoZmRQeXpzL0NzVXBp?=
 =?utf-8?B?T1J3eHgyaDd2cTZESzdiTVd1ZXp3dnQraFRqeHlDY0djU29BcnhhcHNBOVJi?=
 =?utf-8?B?ZFI1WVdMbUpMS29FWml2OC9QZ0V0cmxvY1BFcWlwLzdLcy9oWWJxOXpyKzBG?=
 =?utf-8?B?MjBaUHpHaVlVY1RYbVQ5MHpndlNDYzRRZy8xR3g3d1ZKVE85K2QydU54KzNp?=
 =?utf-8?B?MDZ3OGw1bi9jSFBjaU90alpVT3Y1cmFPczBJYWlPL2tybWZhMXJPTHk2TWgv?=
 =?utf-8?B?QU5wN1V1WlRXN04xVEpndEN2a2ZwaDFRTGprQlc4cGR3aTZQL0d6VFpyZG9X?=
 =?utf-8?B?V3d6TWhZc1hCZnVvOEc4UXZFQUVvaTVuNGtvWU1yeE85ZENUeDM1MEpSVHVr?=
 =?utf-8?B?by9xQjFvbVVENUc3NzdpRllwRjRpWFA2OXRWRnU3VGk1TWc3dmFZS1NLclZZ?=
 =?utf-8?B?ZWFRT2R0UTc1MFFWekdteitidFA4b1J6Z2kzYXFObnZLdlZpb3FKM0ZFa0NH?=
 =?utf-8?B?YnBaLzBWeFdvb3I4NnNEM1FmMnJKeG1URW9nalFtaXdNd3NUQmNadmRwckw5?=
 =?utf-8?B?NkRMc0UyNkUxdWR0ZW1BWGVVUWtSemFSTXdHWkRNRG5qYjBEc2h5bjBQMlJG?=
 =?utf-8?B?aC9hc2JXOG5GRkZUU0hpYXBvVXV4aDZCNmlFRWpSb0hWUmlrQURNR3RNVlVY?=
 =?utf-8?B?NUJJWWtOQXZkSnJPZmR6bUhVWG9Ha2g0d29RcWw5Qk04bFhzNTVldkJFZjhB?=
 =?utf-8?B?U0VXVTBueUhGQTBLakYvSEJuSjFSYUdxS2tFUjdBbmFPRW1QYUlPYUtOZjZ4?=
 =?utf-8?B?eVJ1aTZhQW80Y0pOZHhaMmlhdFBsalJaZkZlczJVTlMwcVdaL0tFQld2VFFL?=
 =?utf-8?B?bGwxNHlZQWh1ZmpIQzVTTW5tdmtxVURsUkR1a0NrSDZ2di81TkpYSVVJQUdY?=
 =?utf-8?B?LzdQVVAvUXVEWG9mNXJjdGY5REVIUmhTczJuNHEySjFXdC9WWDZOWFVHZG1w?=
 =?utf-8?B?SU05OUE1Qk1PazltYWhJOFdqZnJGd09oSko3cDdCa1JlZTQ4QjlkZENVMHZs?=
 =?utf-8?Q?oqXE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <738623DFA21D214F8AC69A75EDF7DA76@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fe539b-95a6-44fd-ed8b-08dc9ef41c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 02:17:25.9495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QeL/L/Lq3I74m9B2yQsj4oANO9WZFObyZQ8CPwqMN/Eg1jYhHTUOnuzeCIX2bl3LdW+DEnTMdCtWyiN5RY1qZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193

T24gMjAyNC83LzQgMjA6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNi4yMDI0IDE0
OjMzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IGFsbG9jYXRlX3BpcnEgaXMgdG8gYWxsb2NhdGUg
YSBwaXJxIGZvciBhIGlycSwgYW5kIGl0IHN1cHBvcnRzIHRvDQo+PiBhbGxvY2F0ZSBhIGZyZWUg
cGlycShwaXJxIHBhcmFtZXRlciBpcyA8MCkgb3IgYSBzcGVjaWZpYyBwaXJxIChwaXJxDQo+PiBw
YXJhbWV0ZXIgaXMgPiAwKS4NCj4+DQo+PiBGb3IgY3VycmVudCBjb2RlLCBpdCBoYXMgZm91ciB1
c2VjYXNlcy4NCj4+DQo+PiBGaXJzdCwgcGlycT4wIGFuZCBjdXJyZW50X3BpcnE+MCwgKGN1cnJl
bnRfcGlycSBtZWFucyBpZiBpcnEgYWxyZWFkeQ0KPj4gaGFzIGEgbWFwcGVkIHBpcnEpLCBpZiBw
aXJxPT1jdXJyZW50X3BpcnEgbWVhbnMgdGhlIGlycSBhbHJlYWR5IGhhcw0KPj4gbWFwcGVkIHRv
IHRoZSBwaXJxIGV4cGVjdGVkIGJ5IHRoZSBjYWxsZXIsIGl0IHN1Y2Nlc3NlcywgaWYNCj4+IHBp
cnEhPWN1cnJlbnRfcGlycSBtZWFucyB0aGUgcGlycSBleHBlY3RlZCBieSB0aGUgY2FsbGVyIGhh
cyBiZWVuDQo+PiBtYXBwZWQgaW50byBvdGhlciBpcnEsIGl0IGZhaWxzLg0KPj4NCj4+IFNlY29u
ZCwgcGlycT4wIGFuZCBjdXJyZW50X3BpcnE8MCwgaXQgbWVhbnMgcGlycSBleHBlY3RlZCBieSB0
aGUNCj4+IGNhbGxlciBoYXMgbm90IGJlZW4gYWxsb2NhdGVkIHRvIGFueSBpcnFzLCBzbyBpdCBj
YW4gYmUgYWxsb2NhdGVkIHRvDQo+PiBjYWxsZXIsIGl0IHN1Y2Nlc3Nlcy4NCj4+DQo+PiBUaGly
ZCwgcGlycTwwIGFuZCBjdXJyZW50X3BpcnE8MCwgaXQgbWVhbnMgY2FsbGVyIHdhbnQgdG8gYWxs
b2NhdGUgYQ0KPj4gZnJlZSBwaXJxIGZvciBpcnEgYW5kIGlycSBoYXMgbm8gbWFwcGVkIHBpcnEs
IGl0IHN1Y2Nlc3Nlcy4NCj4+DQo+PiBGb3VydGgsIHBpcnE8MCBhbmQgY3VycmVudF9waXJxPjAs
IGl0IG1lYW5zIGNhbGxlciB3YW50IHRvIGFsbG9jYXRlDQo+PiBhIGZyZWUgcGlycSBmb3IgaXJx
IGJ1dCBpcnEgaGFzIGEgbWFwcGVkIHBpcnEsIHRoZW4gaXQgcmV0dXJucyB0aGUNCj4+IG5lZ2F0
aXZlIHBpcnEsIHNvIGl0IGZhaWxzLg0KPj4NCj4+IFRoZSBwcm9ibGVtIGlzIGluIEZvdXJ0aCwg
c2luY2UgdGhlIGlycSBoYXMgYSBtYXBwZWQgcGlycShjdXJyZW50X3BpcnEpLA0KPj4gYW5kIHRo
ZSBjYWxsZXIgZG9lc24ndCB3YW50IHRvIGFsbG9jYXRlIGEgc3BlY2lmaWVkIHBpcnEgdG8gdGhl
IGlycSwgc28NCj4+IHRoZSBjdXJyZW50X3BpcnEgc2hvdWxkIGJlIHJldHVybmVkIGRpcmVjdGx5
IGluIHRoaXMgY2FzZSwgaW5kaWNhdGluZw0KPj4gdGhhdCB0aGUgYWxsb2NhdGlvbiBpcyBzdWNj
ZXNzZnVsLiBUaGF0IGNhbiBoZWxwIGNhbGxlciB0byBzdWNjZXNzIHdoZW4NCj4+IGNhbGxlciBq
dXN0IHdhbnQgdG8gYWxsb2NhdGUgYSBmcmVlIHBpcnEgYnV0IGRvZXNuJ3Qga25vdyBpZiB0aGUg
aXJxDQo+PiBhbHJlYWR5IGhhcyBhIG1hcHBlZCBwaXJxIG9yIG5vdC4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFp
YW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4gDQo+IEkgdGhpbmsgdGhlIGNoYW5nZSBp
cyBjb3JyZWN0LCBhbmQgYWN0dWFsbHkgZml4ZXMgYSByZWdyZXNzaW9uLiBZb3Ugd2FudA0KPiAN
Cj4gRml4ZXM6IDA3NjJlMjUwMmYxZiAoIng4Ni9waHlzZGV2OiBmYWN0b3Igb3V0IHRoZSBjb2Rl
IHRvIGFsbG9jYXRlIGFuZCBtYXAgYSBwaXJxIikNCj4gDQo+IHdoaWNoIHdvdWxkIGFsc28gaGF2
ZSBoZWxwZWQgcmV2aWV3aW5nIHF1aXRlIGEgYml0LiBBbmQgaXQgbGlrZWx5IHdvdWxkDQo+IGFs
c28gaGF2ZSBoZWxwZWQgeW91IHdyaXRlIGEgZGVzY3JpcHRpb24gd2hpY2ggaXMgZWFzaWVyIHRv
IGZvbGxvdy4NCj4gRW51bWVyYXRpbmcgYWxsIHRoZSBjYXNlcyBpc24ndCByZWFsbHkgbmVlZGVk
IGhlcmU7IHdoYXQgaXMgbmVlZGVkIGlzDQo+IGFuIGV4cGxhbmF0aW9uIG9mIHdoYXQgd2VudCB3
cm9uZyBpbiB0aGF0IHJlLWZhY3RvcmluZy4NCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJx
LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0KPj4gQEAgLTI4OTcsNiArMjg5Nyw4IEBA
IHN0YXRpYyBpbnQgYWxsb2NhdGVfcGlycShzdHJ1Y3QgZG9tYWluICpkLCBpbnQgaW5kZXgsIGlu
dCBwaXJxLCBpbnQgaXJxLA0KPj4gICAgICAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBp
bmRleCwgcGlycSwgY3VycmVudF9waXJxKTsNCj4+ICAgICAgICAgICAgICBpZiAoIGN1cnJlbnRf
cGlycSA8IDAgKQ0KPj4gICAgICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KPj4gKyAgICAg
ICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIGN1cnJlbnRfcGlycTsNCj4g
DQo+IFBsZWFzZSBjYW4gdGhpcyBiZSBzaW1wbHkNCj4gDQo+ICAgICAgICAgICAgIHBpcnEgPSBj
dXJyZW50X3BpcnE7DQo+IA0KPiB3aXRob3V0IGFueSAiZWxzZSIsIGFuZCB0aGVuIHRha2luZyB0
aGUgbm9ybWFsIHJldHVybiBwYXRoLiBUaGF0IGFnYWluIGlzDQo+IChpbW8pIGNsb3NlciB0byB3
aGF0IHdhcyB0aGVyZSBiZWZvcmUuDQo+IA0KPiBJIHdvdWxkIGZ1cnRoZXIgc3VnZ2VzdCB0aGF0
IHlvdSBzcGxpdCB0aGlzIGZpeCBvdXQgb2YgdGhpcyBzZXJpZXMgYW5kDQo+IHJlLXN1Ym1pdCBz
b29uIHdpdGggYSBmb3ItNC4xOSB0YWcgYW5kIHdpdGggT2xla3NpaSBDYy1lZCwgc28gdGhhdCB0
aGlzDQo+IGNhbiBiZSBjb25zaWRlcmVkIGZvciBpbmNsdXNpb24gaW4gNC4xOS4NClRoYW5rcywg
d2lsbCBzcGxpdCBhbmQgc2VuZCB0b2RheS4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdh
cmRzLA0KSmlxaWFuIENoZW4uDQo=


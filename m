Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A049EA94A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 08:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851869.1265846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKuLo-0003ad-3f; Tue, 10 Dec 2024 07:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851869.1265846; Tue, 10 Dec 2024 07:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKuLn-0003YI-W4; Tue, 10 Dec 2024 07:08:07 +0000
Received: by outflank-mailman (input) for mailman id 851869;
 Tue, 10 Dec 2024 07:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ho5=TD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tKuLm-0003YC-7j
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 07:08:06 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2412::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f56a5f9-b6c5-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 08:08:04 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 07:07:59 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Tue, 10 Dec 2024
 07:07:59 +0000
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
X-Inumbo-ID: 7f56a5f9-b6c5-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmtUkGO2/0EwfOJ7cczLsETAPgW2WCvOyOnp0PaM6wJ8LTBAaqtFmwGRzT1/gVHMXK951SI0v7eTr745ULj5QFMSIBgEfUaUqjFRDzd7Z/wZJGWMNOhpjQ0t/XhFSg4w35k1Kz61HBitd0T3CeAcdRbsLnpDP2aF5sfugdQaf2ztWR2RZoO2wpbs3Pr1EgOMD8JRcKSnlG2EnWIsiR9sbhzi+FLDhLuHlGOVctt2I+K2c6txDDgRucfBHnGa0435ZQQuoLNjJ2UNWbC/gCAJxfR8GUUcIfrTUA8Yj9VSuSUc582/OQpU/uP0sLT9Fyl4ewCyTFU5nVRkkArTl++Sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBOBliRZGRZBOKFQQvycSboBBLwSj0hCe0qrusS684I=;
 b=CA3Clr0uNRvPqY73NGncZAcCE4ny7/h6jCn7hek2mPKIEUfXZQpqwOtTW3Wraasn7h3qQ4fn2L14wpo1oV/Ku1ytRrVLvHQx+97xLaplrW8b2BcJqwjQPnY3SdEac7JgU/Q/WliRRugbFMYLG+URh0XGHazfG2ot5xK/WfGwgWqhPtqVwaWJF2AGdM2Kf7MNvvE842rtKPatD59D54rqhR5yPlH9wrDimehBTJzqxuni4YV5v931LywjeVZZSmULBPdLUdY3BLDvRvYHfkD0ZJeZxBYsVN05G+OpRyqD06b2NaQmPhgDEfv42MPxERuV0GZ3e6KeXC7Qd/HS5mN6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBOBliRZGRZBOKFQQvycSboBBLwSj0hCe0qrusS684I=;
 b=BN9uR6kccPuyfjdkECoOvZkWe9o2QS8AYgA7Cw2Iua8DM/1L1c8Xzl6/RVNrc3hrtLQhxE1DtXfmhOiZ0gaBRAcuGpJ+QooKDaQreOLBkSY8cMfi6lZReVOo2w00XQPY6+/o+YGGyN7EZWmtA8Q7ymfg8L7J6xVo3PMliITeLnA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index: AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAGXh4A=
Date: Tue, 10 Dec 2024 07:07:59 +0000
Message-ID:
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
In-Reply-To: <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8230.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB6317:EE_
x-ms-office365-filtering-correlation-id: f58a2740-1e4b-48a2-284e-08dd18e96153
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a0FNQ09kUXBxOFhPTHg3R1puMWYwb0JLblcxUHdFTHVzUjVyYzhYUTJyMWJR?=
 =?utf-8?B?VVlkNHdpdjAxZWlTb1ZCTG4rWGF3WVhYQzNqZFdLOEZFMkVCY2g3alFQc01w?=
 =?utf-8?B?VFdzOXlhcmJqVGFWUG9vNENXTnFWY0ZTQ05temlXSHBxcWpzbFljc2NVYTJ0?=
 =?utf-8?B?VWR1VWt4SkRMVlJRZUFGQUtmcHRuL0NNQ05qeXJmc1dRaUZreVhTZ0RHRW9l?=
 =?utf-8?B?a0E0QmVWYkppeTFlbms5TksyZXBObWJSenVnbEFFZDFjNkdtQzhEWHJqMVBw?=
 =?utf-8?B?Ym5jZk5RRXp1SnpMZ0VqTnFTK3l4RHNURHo3RVV4eUJ2OExEQm9lbG1oVnFo?=
 =?utf-8?B?ZG1RUVN5dkRLMjRTckoyUHcyblBlVzJYV01Xb3IxYW4yTlRESjZ6aE5LMTVI?=
 =?utf-8?B?REhUVEdPaGFndnowUnRyUzRwT09rSUl0ME0xbGZTeVBGcU9jcnlOdnJ0RHdI?=
 =?utf-8?B?a0g2SklzZDNrZnNtcHNBTWRkbzAxQXBTYVFiaHJqRTZrMmd0eGZBVDBkaDI1?=
 =?utf-8?B?NDhNZlhuaXlKVnI2NWVmUTUzdVZ1OE5ZcGxQVjV3N1MrT0lCUEcwdk45SFV5?=
 =?utf-8?B?emZoSFZCM1NRaE1QTnFudnB2QVRsaCtMQkd4L2NmY29wM1IwS2thOVkxcWtZ?=
 =?utf-8?B?QVltQkFsZGN4Qk1TQXMrZ2plL2hGNVVnaWg2Yml4Y1Eyc0Y3VVFvTjBqeUFG?=
 =?utf-8?B?Zm8zQVJ6aElWUVRrY3U4Q2lDT3FZOTVjY3JUY0IwR0VURGlQbEVsUDlOYktX?=
 =?utf-8?B?T1JEWUVlQWRkTEliWDRkTDIvNm13ck9mVWYvZEExNGJqakw1VXlxY2FuaUJ5?=
 =?utf-8?B?SEFzK0xSWEdQeHA0RWtBVjlmblpBOFU5VzV6bkxYb1JpWjgrYjc4b0hWbVE0?=
 =?utf-8?B?cE1WOWxMREhGU1lnRUwyckxrUlg0S1hYNjE3OXB1Um5vekpTQ2Z3NkRNNGlk?=
 =?utf-8?B?Q1o2NGREdldPUHFmL2VId3IwVTVGdlRMWExNUHJ1V0kvaXd6Nzh2R05MbDQ4?=
 =?utf-8?B?dG1RVmFvSXF3aEN2ZkM5NnlXMWlJWnF1MFFsd3dydFlVN3hsaDY4MUxHeWcz?=
 =?utf-8?B?NU9lVkwzTktDdElFQTFqcldaODEvNFlmM0poSllaTDdIZlh1MWc4d0tKZ09V?=
 =?utf-8?B?S25VOUpDRnhUc0l3WTh6N285RFBVajhHWDkzZ2FuRjk4eWhWZlk4TnRJcFhi?=
 =?utf-8?B?RlpCR0ZLdEtoOVcyS0ZRRWxFQVhDNkxoRjVQcEl4eWNsWDRkT3hETVBPSjVU?=
 =?utf-8?B?N3Z1dmdQWm44ODRSbmpmWEl5U0d6Sy9kejlvTWtGQjNDKzM1Y1FCY25WUTRL?=
 =?utf-8?B?eXQxcndxdGVnWGhFU2VSQUtZekEzN0Zwamg2Vy9CRjQyMUJoVkF2MFFTN0x4?=
 =?utf-8?B?bERFaSt4MFczVjRSVTBvc0llbjV5aE1BeTJDeHV2cnlOYXBsY3JwVjZIa3RD?=
 =?utf-8?B?cGJab2RvWHNVNjhMZ09aLzZnNE9Laml2emNwai8welc3WHk1d09NTnVaemZa?=
 =?utf-8?B?dytHVFYxY3R2bHpnZFBqbnFyYy9qTkNLZmhMTjVEMDNxU1RQK3EvMjFRZVFk?=
 =?utf-8?B?WndDTFlselo0WnJseUlEaWJxdVZmQVZ6a1pwUFVQWGYyOUdNNitFOTRZckdw?=
 =?utf-8?B?bDJWUFllcmpTSFE3V3czSHFBaEx2Mm5JOUFsWEtLcUJJN1BTU2hOSE9kbWpP?=
 =?utf-8?B?eUhvOFVtd01DVk1iOVNUUTZHcUNtSkJiclBOSmlNT0E2MzRlMWhiWXNBQUdF?=
 =?utf-8?B?VEFyenlJTVhjWmFkd3Z4eWw5OExQSU9wS1ZUcjdJcFBpRHgzdktLbU1ZWFdv?=
 =?utf-8?B?aDdnNFNERUo5Vkdvc2FMa1VBRmZ5bks2amdlcE5kaE1nV2JZNk1WMzFvVkNi?=
 =?utf-8?B?TGJMSUdOUlNzWGNtMGdsQzE5aUhmK29LeW9JcXFVN0tVUmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXB5VU9ncEJMbnpQWlA4MGs2L3JjQml6NVROOFZUdjZsS1d5TWJodFc5S2lS?=
 =?utf-8?B?NUZOODMveVpJMU9PNjBlSm9oZDVHV0REeS9ycWlzUE05NFp1Q1ZFMmpCMElR?=
 =?utf-8?B?TTFGczBEZGNHVklVaXY0bkhKN2ZtS3lJSnNpZjRKVmpla3VxQ1MyMWlmSHhx?=
 =?utf-8?B?UkNYR0M2djN4MklEa0dpK2pJVHdOcVhGTlVoNkFJdVRrU2xTQjRpQmt2OVNj?=
 =?utf-8?B?VlJERUxnRVRxOU0vYnNJdVYxNUZxaUFsSGl0KzZHVnJBZjhDTExySVlTSGkr?=
 =?utf-8?B?ck9WZ3dpK0c4ZDFSMGJOVTFxRC9jSHRJeGVmYmdzS05xaGhIMkVUeEJPU2RE?=
 =?utf-8?B?LzRMaHFKdWlpMGRnMHZIOENod2JPQ3QrS2djdEt1MnJDOUN4TUJXOXl0c051?=
 =?utf-8?B?YkQ0VFlvc2hZcjBGc0tQaEMxc2ptRFZFem9TQjVwU3hWdXNabms5VzluYkln?=
 =?utf-8?B?REVzSGpLT1pMVjlLWWd1SUpFV0VqRGdnNytsM3d6eE1TUUtOK0lEUDl5YkIw?=
 =?utf-8?B?N1d0S0NISHdGdzBndmh2bnkrcEFFemxGdDBqc3EvZDVzQ3JGQURQNjRKRXZV?=
 =?utf-8?B?K2VpZ0NOVlVKVDhaTWU1dmRScTRyaFVSRWNuS3dkZW5VZDdqMmF6S0lpYlV0?=
 =?utf-8?B?cHlPT1grV2Q0cy9MMFFyS1JuL2tkaE1iazBCNzMxQ3M5b0hCaDRhQUNDb2sz?=
 =?utf-8?B?eWd6Y09GQVlGUnlaYVYwelFaY0VLY3d6SW16MGNBVDdtdDBLamU2anErOXZ2?=
 =?utf-8?B?MDgwTjAxSU9CM2k3eS9WeGtrQm5pQWk0RzhRdS9QcS9WTVBudlhwY3cvcElJ?=
 =?utf-8?B?clVYcmkwVkNqeHhzMlBmRDRNR3JVTWk5Z1h4YloxaDdtOEg1MEo3UlVPOHZ0?=
 =?utf-8?B?ak1OMzlISm5LS29OMVRaczVTWlpDR3F5WGYzQTRnSHRRWS9TM09HWTVOL2Vw?=
 =?utf-8?B?ZWtYZTZCWGFYWTNGZVRITnVtVVBIbDRQWTZPaEFsOEtxblJhM0ZGbWx5Ykxm?=
 =?utf-8?B?cWtNRjNGam1WRTlWcy9kNGhUTmRveTkwYXBHeEFPWkZHOUduRlhwbVhQci9J?=
 =?utf-8?B?RzRwd0VwNUlqRmtHai8wempmR25SOERzcUFVUjc3TUlDVXExRzZLTFJMQXkw?=
 =?utf-8?B?QndnVVpiUzNydmN2RFlpZFQwWjdqeGF5V1JNYWJoTnQxTWtuRzZkaVB3ZXA4?=
 =?utf-8?B?T0NBTzljOXNHdXFSbGo0UngrRis1b2NLTlErOXJKYTFKOTFTaUozUGVzWWEw?=
 =?utf-8?B?cHBtbVIvRDl2cXFadWY1bHE4S3QzNGdxVkc1aXI2aEZnS0VOVVIxYmsyVFc3?=
 =?utf-8?B?c3hWMUdzdW5hbEpMTzdUSmVxTU82am53Y1pJck9DTmdaQkVPVzdwM3V4VWJv?=
 =?utf-8?B?QWYrQ1ovMk1KekpQeHpzMlZBWVQ4YldMTFJKRmpSVWVpNlB6R2xuVlRMTCtv?=
 =?utf-8?B?RGNmUFI0TTlkK0JoU3pIWEV5bkpZWTN4NDVrVXVlSVllS2wyczBmcmdEdDd6?=
 =?utf-8?B?cXJwYzZMMkE1cEh2dE5VWXBzVEJ0WThWcFFBMmU4WVNvMjRqTENrRDRTeTl0?=
 =?utf-8?B?blBnTE5FSWJJNFRaMlg4bXQrakZ5MzVieWZjcGpGNkFOTFVTYytjQkYvY1hh?=
 =?utf-8?B?NnkvZFlaeFI1YnZhYksvQk5BZXhVUVFRbHI2bFo4MHNPWEpoK3RBZXRJRkZT?=
 =?utf-8?B?bHNacW5iL2FoazM4bSttZlBUeG9tcnBHeUNBQ1FnbnorTi9tNmhJOW1OemFm?=
 =?utf-8?B?U2d2QWxKZXM2SThyNlFOZWhqYStVN2RweXdZZU90N2pNY2oyVEVTdDB6a2Er?=
 =?utf-8?B?TzdJaU1QL2RqWkQ4OXorTU82eVFLZzNsTGgvbW1ybmZKb053enNRMUdzUHdE?=
 =?utf-8?B?SUY3aC8rRzY0eHI5RXAvVEZsM1BUZ0E5YW05Y2lTdFFzK2ZPNDFZS3IwN1RC?=
 =?utf-8?B?Nmh5T0dONTg4Z3JWdHVsNTF4di9Ja2Z5eEh0U0txWFJaNWNzcTZpb1d3eFlu?=
 =?utf-8?B?T1I4dVlER0NmZXU1ZFJzWElGdGFnWUc0QzkxV1Q3MVBPMkMyTVpkNUMvZFJE?=
 =?utf-8?B?a1FFMmNPSEEzeUd4VzVQUEdWeWRGQU1QZHNJOW5kK0dQR1FIaWFSNGF2QUZx?=
 =?utf-8?Q?uu28=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD7C0CA548B26D40A15401CE12A1A66C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58a2740-1e4b-48a2-284e-08dd18e96153
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 07:07:59.5741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vo9+x5KufLYLVJ2GP8ZWmwa+F2uLXNunUxdLc6sKUChy+F/UhFIgE6nVqczaLCziHfBx6CicYhQyPhy+FQrCag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317

T24gMjAyNC8xMi85IDIxOjU5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMTIuMjAyNCAw
NzowOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4v
ZHJpdmVycy92cGNpL3JlYmFyLmMNCj4+IEBAIC0wLDAgKzEsOTMgQEANCj4+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlciAqLw0KPiANCj4gV2FzIHRoaXMgYSBk
ZWxpYmVyYXRlIGRlY2lzaW9uPyBXZSBkZWZhdWx0IHRvIEdQTC0yLjAtb25seSwgSSB0aGluay4N
CldpbGwgY2hhbmdlIHRvIEdQTC0yLjAtb25seS4NCldoYXQncyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIEdQTC0yLjAtb25seSBhbmQgR1BMLTIuMC1vci1sYXRlcj8NCg0KPiANCj4+ICsvKg0KPj4g
KyAqIENvcHlyaWdodCAoQykgMjAyNCBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIEFsbCBS
aWdodHMgUmVzZXJ2ZWQuDQo+PiArICoNCj4+ICsgKiBBdXRob3I6IEppcWlhbiBDaGVuIDxKaXFp
YW4uQ2hlbkBhbWQuY29tPg0KPj4gKyAqLw0KPj4gKw0KPj4gKyNpbmNsdWRlIDx4ZW4vaHlwZXJj
YWxsLmg+DQo+PiArI2luY2x1ZGUgPHhlbi92cGNpLmg+DQo+PiArDQo+PiArc3RhdGljIHZvaWQg
Y2ZfY2hlY2sgcmViYXJfY3RybF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZWcs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWws
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQ0K
Pj4gK3sNCj4+ICsgICAgdWludDY0X3Qgc2l6ZTsNCj4+ICsgICAgdW5zaWduZWQgaW50IGluZGV4
Ow0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhcnMgPSBkYXRhOw0KPj4gKw0KPj4gKyAgICBp
ZiAoIHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCkgJiBQQ0lfQ09NTUFO
RF9NRU1PUlkgKQ0KPj4gKyAgICAgICAgcmV0dXJuOw0KPiANCj4gSSBkb24ndCB0aGluayBzb21l
dGhpbmcgbGlrZSB0aGlzIGNhbiBnbyB1bmNvbW1lbnRlZC4gSSBkb24ndCB0aGluayB0aGUNCj4g
c3BlYyBtYW5kYXRlcyB0byBkcm9wIHdyaXRlcyBpbiB0aGlzIHNpdHVhdGlvbj8NClNwZWMgc2F5
czogU29mdHdhcmUgbXVzdCBjbGVhciB0aGUgTWVtb3J5IFNwYWNlIEVuYWJsZSBiaXQgaW4gdGhl
IENvbW1hbmQgcmVnaXN0ZXIgYmVmb3JlIHdyaXRpbmcgdGhlIEJBUiBTaXplIGZpZWxkLg0KVGhp
cyBjaGVjayBpcyBzdWdnZXN0ZWQgYnkgUm9nZXIgYW5kIGl0IHJlYWxseSBoZWxwcyB0byBwcmV2
ZW50IGVycm9uZW91cyB3cml0ZXMgaW4gdGhpcyBjYXNlLA0Kc3VjaCBhcyB0aGUgcmVzdWx0IG9m
IGRlYnVnZ2luZyB3aXRoIFJvZ2VyIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uLg0KSSB3aWxsIGFk
ZCB0aGUgc3BlYydzIHNlbnRlbmNlcyBhcyBjb21tZW50cyBoZXJlIGluIG5leHQgdmVyc2lvbi4N
Cg0KPiANCj4+ICsgICAgaW5kZXggPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmVnKSAm
IFBDSV9SRUJBUl9DVFJMX0JBUl9JRFg7DQo+PiArICAgIGlmICggaW5kZXggPj0gUENJX0hFQURF
Ul9OT1JNQUxfTlJfQkFSUyApDQo+PiArICAgICAgICByZXR1cm47DQo+PiArDQo+PiArICAgIGlm
ICggYmFyc1tpbmRleF0udHlwZSAhPSBWUENJX0JBUl9NRU02NF9MTyAmJg0KPj4gKyAgICAgICAg
IGJhcnNbaW5kZXhdLnR5cGUgIT0gVlBDSV9CQVJfTUVNMzIgKQ0KPj4gKyAgICAgICAgcmV0dXJu
Ow0KPj4gKw0KPj4gKyAgICBzaXplID0gUENJX1JFQkFSX0NUUkxfU0laRSh2YWwpOw0KPj4gKyAg
ICBpZiAoICEoKHNpemUgPj4gMjApICYNCj4+ICsgICAgICAgICBNQVNLX0VYVFIocGNpX2NvbmZf
cmVhZDMyKHBkZXYtPnNiZGYsIHJlZyAtIDQpLCBQQ0lfUkVCQVJfQ0FQX1NJWkVTKSkgKQ0KPiAN
Cj4gTm8gc3VjaCBsaXRlcmFsIDQgcGxlYXNlLiBXaGF0IEkgdGhpbmsgeW91IG1lYW4gaXMgcmVn
IC0gUENJX1JFQkFSX0NUUkwgKw0KPiBQQ0lfUkVCQVJfQ0FQLg0KWWVzLCB3aWxsIGNoYW5nZSwg
dGhhbmtzLg0KDQo+IA0KPiBBbHNvIGluZGVudGF0aW9uIGlzIG9mZiAoYnkgMikgaGVyZS4NCj4g
DQo+PiArICAgICAgICBncHJpbnRrKFhFTkxPR19XQVJOSU5HLA0KPj4gKyAgICAgICAgICAgICAg
ICAiJXBwOiBuZXcgc2l6ZSAlI2x4IGZvciBCQVIldSBpc24ndCBzdXBwb3J0ZWRcbiIsDQo+PiAr
ICAgICAgICAgICAgICAgICZwZGV2LT5zYmRmLCBzaXplLCBpbmRleCk7DQo+PiArDQo+PiArICAg
IGJhcnNbaW5kZXhdLnNpemUgPSBzaXplOw0KPj4gKyAgICBiYXJzW2luZGV4XS5hZGRyID0gMDsN
Cj4+ICsgICAgYmFyc1tpbmRleF0uZ3Vlc3RfYWRkciA9IDA7DQo+PiArICAgIHBjaV9jb25mX3dy
aXRlMzIocGRldi0+c2JkZiwgcmVnLCB2YWwpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50
IGNmX2NoZWNrIGluaXRfcmViYXIoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAg
ICB1aW50MzJfdCBjdHJsOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgcmViYXJfb2Zmc2V0LCBuYmFy
czsNCj4+ICsNCj4+ICsgICAgcmViYXJfb2Zmc2V0ID0gcGNpX2ZpbmRfZXh0X2NhcGFiaWxpdHko
cGRldi0+c2JkZiwgUENJX0VYVF9DQVBfSURfUkVCQVIpOw0KPj4gKw0KPj4gKyAgICBpZiAoICFy
ZWJhcl9vZmZzZXQgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIGN0cmwg
PSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmViYXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NU
UkwpOw0KPj4gKyAgICBuYmFycyA9IE1BU0tfRVhUUihjdHJsLCBQQ0lfUkVCQVJfQ1RSTF9OQkFS
X01BU0spOw0KPj4gKw0KPj4gKyAgICBmb3IgKCB1bnNpZ25lZCBpbnQgaSA9IDA7IGkgPCBuYmFy
czsgaSsrLCByZWJhcl9vZmZzZXQgKz0gUENJX1JFQkFSX0NUUkwgKQ0KPj4gKyAgICB7DQo+PiAr
ICAgICAgICBpbnQgcmM7DQo+PiArDQo+PiArICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVy
KHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDMyLCB2cGNpX2h3X3dyaXRlMzIsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlYmFyX29mZnNldCArIFBDSV9SRUJBUl9DQVAsIDQs
IE5VTEwpOw0KPiANCj4gVGhlIGNhcGFiaWxpdHkgcmVnaXN0ZXIgaXMgci9vIGFpdWkuIFdoaWxl
IHBlcm1pdHRpbmcgaHdkb20gdG8gd3JpdGUgaXQgaXMNCj4gZmluZSwgRG9tVS1zIHNob3VsZG4n
dCBiZSBwZXJtaXR0ZWQgZG9pbmcgc28sIGp1c3QgaW4gY2FzZS4gKEFuIGFsdGVybmF0aXZlDQo+
IHRvIG1ha2luZyBoYW5kbGVyIHNlbGVjdGlvbiBjb25kaXRpb25hbCBoZXJlIHdvdWxkIGJlIHRv
IGJhaWwgZWFybHkgZm9yIHRoZQ0KPiAhaHdkb20gY2FzZSwgYWNjb21wYW5pZWQgYnkgYSBUT0RP
IGNvbW1lbnQuIFRoaXMgd291bGQgdGhlbiBhbHNvIGFkZHJlc3MNCj4gdGhlIGxhY2sgb2Ygdmly
dHVhbGl6YXRpb24gb2YgdGhlIGV4dGVuZGVkIGNhcGFiaWxpdHkgY2hhaW4sIGFzIHdlIG1heSBu
b3QNCj4gYmxpbmRseSBleHBvc2UgYWxsIGNhcGFiaWxpdGllcyB0byBEb21VLXMuKQ0KVGhhbmtz
LCB3aWxsIGFkZCBpc19od2RvbSBjaGVjayBhbmQgYWRkICJUT0RPIiBjb21tZW50IGhlcmUuDQoN
Cj4gDQo+PiArICAgICAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAg
ICBwcmludGsoIiVwcDogYWRkIHJlZ2lzdGVyIGZvciBQQ0lfUkVCQVJfQ0FQIGZhaWxlZCAocmM9
JWQpXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgICAmcGRldi0+c2JkZiwgcmMpOw0KPj4gKyAg
ICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgcmMgPSB2
cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQzMiwgcmViYXJfY3RybF93
cml0ZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmViYXJfb2Zmc2V0ICsg
UENJX1JFQkFSX0NUUkwsIDQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBk
ZXYtPnZwY2ktPmhlYWRlci5iYXJzKTsNCj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAg
ICAgew0KPj4gKyAgICAgICAgICAgIHByaW50aygiJXBwOiBhZGQgcmVnaXN0ZXIgZm9yIFBDSV9S
RUJBUl9DVFJMIGZhaWxlZCAlZFxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgJnBkZXYtPnNi
ZGYsIHJjKTsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4gDQo+IElzIGl0IGNvcnJlY3QgdG8g
a2VlcCB0aGUgb3RoZXIgaGFuZGxlciBpbnN0YWxsZWQ/IEFmdGVyIGFsbCAuLi4NCldpbGwgY2hh
bmdlIHRvICJyZXR1cm4gcmM7IiBoZXJlIGFuZCBhYm92ZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4g
DQo+PiArICAgICAgICB9DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+IA0K
PiAuLi4geW91IC0gaW1vIHNlbnNpYmx5IC0gYXJlbid0IGNvbW11bmljYXRpbmcgdGhlIGVycm9y
IGJhY2sgdXAgKHRvIGFsbG93DQo+IHRoZSBkZXZpY2UgdG8gYmUgdXNlZCB3aXRob3V0IEJBUiBy
ZXNpemluZy4NCj4gDQo+PiBAQCAtNTQxLDYgKzU0MiwxNiBAQA0KPj4gICNkZWZpbmUgIFBDSV9W
TkRSX0hFQURFUl9SRVYoeCkJKCgoeCkgPj4gMTYpICYgMHhmKQ0KPj4gICNkZWZpbmUgIFBDSV9W
TkRSX0hFQURFUl9MRU4oeCkJKCgoeCkgPj4gMjApICYgMHhmZmYpDQo+PiAgDQo+PiArLyogUmVz
aXphYmxlIEJBUnMgKi8NCj4+ICsjZGVmaW5lIFBDSV9SRUJBUl9DQVAJCTQJLyogY2FwYWJpbGl0
eSByZWdpc3RlciAqLw0KPj4gKyNkZWZpbmUgIFBDSV9SRUJBUl9DQVBfU0laRVMJCTB4RkZGRkZG
RjAgIC8qIHN1cHBvcnRlZCBCQVIgc2l6ZXMgKi8NCj4gDQo+IE1pc3JhIGRlbWFuZHMgdGhhdCB0
aGlzIGhhdmUgYSBVIHN1ZmZpeC4NCkRvIGJlbG93IFBDSV9SRUJBUl9DVFJMX0JBUl9JRFgsIFBD
SV9SRUJBUl9DVFJMX05CQVJfTUFTSyBhbmQgUENJX1JFQkFSX0NUUkxfQkFSX1NJWkUgYWxzbyBu
ZWVkIGEgVSBzdWZmaXg/DQoNCj4gDQo+PiArI2RlZmluZSBQQ0lfUkVCQVJfQ1RSTAkJOAkvKiBj
b250cm9sIHJlZ2lzdGVyICovDQo+PiArI2RlZmluZSAgUENJX1JFQkFSX0NUUkxfQkFSX0lEWAkw
eDAwMDAwMDA3ICAvKiBCQVIgaW5kZXggKi8NCj4+ICsjZGVmaW5lICBQQ0lfUkVCQVJfQ1RSTF9O
QkFSX01BU0sJMHgwMDAwMDBFMCAgLyogIyBvZiByZXNpemFibGUgQkFScyAqLw0KPj4gKyNkZWZp
bmUgIFBDSV9SRUJBUl9DVFJMX0JBUl9TSVpFCTB4MDAwMDFGMDAgIC8qIEJBUiBzaXplICovDQo+
PiArI2RlZmluZSAgUENJX1JFQkFSX0NUUkxfU0laRSh2KSBcDQo+PiArICAgICAgICAgICAgKDFV
TCA8PCAoTUFTS19FWFRSKHYsIFBDSV9SRUJBUl9DVFJMX0JBUl9TSVpFKSArIDIwKSkNCj4gDQo+
IFRoZSBsaXRlcmFsIDIwIChhcHBlYXJpbmcgaGVyZSB0aGUgMm5kIHRpbWUpIGFsc28gd2FudHMg
aGlkaW5nIGJlaGluZCBhDQo+ICNkZWZpbmUuDQpPSywgd2lsbCBhZGQgIiAjZGVmaW5lIFBDSV9S
RUJBUl9TSVpFX1VOSVRfQllURVNfTEVOIDIwIiB0byByZXBsYWNlIGFib3ZlIHR3byAnMjAnIGNh
c2UuDQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K


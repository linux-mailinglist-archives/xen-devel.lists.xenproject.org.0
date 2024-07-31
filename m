Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C806E942937
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 10:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768335.1179102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4kj-0008LK-Tq; Wed, 31 Jul 2024 08:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768335.1179102; Wed, 31 Jul 2024 08:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4kj-0008JJ-Pv; Wed, 31 Jul 2024 08:32:09 +0000
Received: by outflank-mailman (input) for mailman id 768335;
 Wed, 31 Jul 2024 08:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMgj=O7=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZ4kh-0008JB-Q3
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 08:32:07 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:200a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf466eb-4f17-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 10:32:05 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 08:31:59 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 08:31:59 +0000
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
X-Inumbo-ID: 5cf466eb-4f17-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRYMwxY5+P4dPJc+nEYHwk8sHTUbsjxMJCdMZKHYRGO9JE8RxRvs3ep6PFWe15W/LyfvuruUB4XkOBHlaHMFIIAiam56FQXnDCXgNWdUTlI1ZT2r19IFibRih7ayk7U24zeX9ex42mZGtBCdM95BL2UIB+/rmfrCB7bzitfYQFMm3A+jQZZIRIUGSJEblVKJMl28eg5JES7E4/A45Zl+gTjMrpiUatYQUjjhvOKzXJ/VY3dLBiGdtsD5WuHB4oQUIaQ5lPP5nsiDDnOA4vuUXrckax2U3irFmNJXQF0zMehIk2qL8b3vN2+tl1J/5L9TAfmryGeluXjphfvvqv0KNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USIo22zCjQIt4T+cOOzqhiUP0n8Gxbp9ZoO2bCwHbqE=;
 b=VsHC716e0VPuiiUpoBiG1kAxO5FrXtqYkUGdYsZ03hEJxUB4fQm9f7QqyzXlVmePFAlEDEytYOfhBa7RRBdYs06XdHWjvKUFj2pTzTDWgiSYbrElBLcbiWura9E9TE/pjxDTZurEc0yJzgaTCpDzBPdDYs1lcCaejXQjtGSGKCoLrkYKf6hEJu/8ZcgKjKQiiLQ3ZdbkU2/FBLOL5T12iLk4gJGXhDJ9XEhee7q0CUaIjCtikgp/x2CwRfldzcqbBqQZP85RcIsPMj1F+AOW7BQPCWZYZevA53X0Hx0ltlCf7InNu0glnkSu4GDnwnsdefivWZlaOgYgmX/ZSA7nsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USIo22zCjQIt4T+cOOzqhiUP0n8Gxbp9ZoO2bCwHbqE=;
 b=xXszlJjWyX1zBTyUSl1Jn6wjfrQcv0nH4cslHCwgG0DWUuTDXzcrHF7/bYEYASEJ198iCz+YhkF1Sm7yRFxbbOnoxW7pJlT+vr/W757B+o/Q2FNMtQut21XvrkrWvxXhsOl/kT0HtZh+Z/3l+TpAeJKw/Zokk4QAnyXm1HYNjq8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHa0SvUYCKIEvNO4Ei/mjm7Qit34LIPYP0AgAHFpIA=
Date: Wed, 31 Jul 2024 08:31:59 +0000
Message-ID:
 <BL1PR12MB584905C225BE759A633DEAAEE7B12@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
 <d08179b1-a114-4ae9-a6da-e907f2c027c3@citrix.com>
In-Reply-To: <d08179b1-a114-4ae9-a6da-e907f2c027c3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7807.009)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB5805:EE_
x-ms-office365-filtering-correlation-id: e351ae33-bb50-44e4-3245-08dcb13b3ed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0Z1T3JUOXpvclVRWnNzbEtpcGcrTHR0Q0RmbllsRmdYS281dVlnTzY1QnNm?=
 =?utf-8?B?Nk5lbFFoakJJcFB6K3htWEgxSzdCUkRNbktLYk81QXdqbGxXbHNEYXhQTjJa?=
 =?utf-8?B?RnNKdlVJcS9FcmF4MjhwZlA5ZjA2dUdYY09BcGJVR0hpSzh0N2lDQkl6dEUr?=
 =?utf-8?B?akFwamt1dGprYmJuenlZOTYzbDh1dWlEV1RiaVhtSjU2b1BpRHR1REx3dmkx?=
 =?utf-8?B?N3BEVzMvMDNxZ3dzRm5VL1JFRTFzSFNoVkdMbjllcXh6NEViQnBLUFJpYnM3?=
 =?utf-8?B?OGg2b1h3RXgxL1N6ZlA0MmdBUmQ1Vjg5T1E4dXY3YjYycktJT2tvMHYrVW5J?=
 =?utf-8?B?R0NNaWJFR0gwM21QbTJLczJwRlZra2xHbWxzSldONm1jWDBCZ0RXVEdLdW82?=
 =?utf-8?B?MWxZR3dDQ1FtV0hsb1VnM0VPTTV6UkpOVGRvUEpUb3krOEo1d05qcUlJY0w1?=
 =?utf-8?B?QWpMRkZTSjlTWXZiOWVGQW9wTHdoWkNNSlFrcnpaV2o4b1Q1MytOOFMwZHZj?=
 =?utf-8?B?MFBnNVI5SktTKytnR2JjakN1YUs3Y3JSTUwyeURlV2IwTkNPbkVRZWdZd3Fu?=
 =?utf-8?B?V1ZGSVU3UE1IOStzUEpXbjFXdDYyWXEyUGJjVUNsaWhTem9Jd3ZlSDZEeXRj?=
 =?utf-8?B?anpqY3BkMjZTVGt3NU9mejg4ZzRkV3ltb2xERHQvdU9kQ0p4dmdBYU9PeW05?=
 =?utf-8?B?ZzYyZ2xOKzFhZXFvbWJtY2s1TUx0MS80REdWZHh4ZW5TWFdhazRPek9iVXpn?=
 =?utf-8?B?Qm5VNnBhcEh2eGlXcGV5ZUtlMzNrUXMvYkNGRDR1VXAvUjJ0TjJTUHpqS0VI?=
 =?utf-8?B?MVJRZWJlakp0bzBJNU1CSDRQeTZzVTgwTTZCZzNVQ0NTOVU4U09BRDFiZWZB?=
 =?utf-8?B?L2RVMWdVMUZpODFseW9tRUQvMlc2TEtncDBacmhORERtMUt1WkUxSmRHTjFz?=
 =?utf-8?B?by9JejJZcU1GTEtManFGSU5sTHhtSDRKM25tTVhzc0FVSjIyWE9wZUc4em9r?=
 =?utf-8?B?RmRvRm9BYm5oOHg5MndjMW45UkN2OHZGM2FSY2QzT2VQRTdBNEpiODFQeGRE?=
 =?utf-8?B?K1duYXA4Zk13WTZ6UEs3RWNOVzRLSFZpSUNHc04yVk9tZGQ5T2hLbW9hamVl?=
 =?utf-8?B?SGxEdGltZE9Kd3pPckx0dXpJY09LTTRoVXpNaGVORW0zOHZteXFRbWlGZVNH?=
 =?utf-8?B?YzhTa2RjbDd6NmNlbXVQVW9JMmdPK0NodEJidWVZOHZQSFVpQy9UejNCZTNQ?=
 =?utf-8?B?eWZxYzZQK29wSnlLK08zWEVacFBpL2FDclQyUGJ6aFZ0SUxxQmpaVUJoTHVT?=
 =?utf-8?B?TUNyQ1hEWDFzeWxkTHhkTi9rVmlhVXluMHpWMmhwck1TaEZyK3N0L0tkaHFO?=
 =?utf-8?B?UUZBZ284MWY3UVNWYkorZU0wYjFnazVFTzFQbUh5d3FtQVdNcWFtaDVXc3R0?=
 =?utf-8?B?UHNBTHNScnJ2U25GZUczS0FmRlp0Wnl1YTRRaVFrZlBQSVZuS0tVeEEzeU1T?=
 =?utf-8?B?Z2dKTnE2aVJWa1o2ZjMyMHhNRWZPYk1SVE81VGJsRk1Tcjh1b1FXVUVSRTky?=
 =?utf-8?B?YjM3R3BOdVVYeDZaWmM1VEVzNnhFaTdQZUNobFZ6dHB1QWZvVU1oaGhENzN6?=
 =?utf-8?B?M2E5dFZsSXg0WXlMVFlPQ3VvUnlEK2F2bXVyc1pUNXg3Mys3WDBORjNEUlBs?=
 =?utf-8?B?NkFiNmFWMlc3QlNJdTRsSGpNbGRLU21CaTBCVUxBdkdQVUUxcE02bW96UmMr?=
 =?utf-8?B?Skd0WitXS1FKeEVjWHJZa2JQU0JJYlI4NHo2Ympqa0Jlb1ZHemREOG5XVTBO?=
 =?utf-8?Q?x8CjEWIRZBQXKEHowGzvWWbgtmn5ipqkQkl1E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTh5ZXFZOStjMWRZV0w3UzE4eEU3bEs2UXBsOUkrYSsva0I5UnROdmhyWFo2?=
 =?utf-8?B?K2tKeVBmOWtadmJXUW5yS2c4ZVNKamd4eGlhdmRqNDlkWUxuYU01WEVadHdV?=
 =?utf-8?B?dlFEMVVFS0dOSmdSV1luc0xhZzlucWU1SHBUN3NnQ08zZlVjbnF2djJBVkly?=
 =?utf-8?B?VFo1YVZzbE9MMldJMkpjZy80SmxKQ1o2NEJ3dzF6cGNzYmpFV2lsZHJxbWIx?=
 =?utf-8?B?Rk1maGtFc2dCWExram5YYWgwQnJNbUNDdDVaQWMxSEkranhjR2k3bWlNdm9h?=
 =?utf-8?B?cDZWT2lENWZZUWMxc2l6M0I2WFkraGI4aGpxUGZGOXV0TmJkWndCQ2tZem85?=
 =?utf-8?B?dmxTZXJDTFlTSzNJcGt0NG12SWRvUDZMTWdHVkJLZGM5WFdRZnJySVhSUExu?=
 =?utf-8?B?bzRsekFxck04QytJY2wybE1sYmZodjRiaG56aHhjVmRUSEZDNkJ0blNtZWlX?=
 =?utf-8?B?aDh3WGMyanAvN25LK2lZOU1FbjJ5Ry9PWjA4bkxsK2ZYMWh0VFNvMzVlTkt6?=
 =?utf-8?B?TmR2RHJnc20rdlpGcFl6NFVDUjdMeUdWbHBVNkY0ak4wTmllVVkrSG1tQkl0?=
 =?utf-8?B?d1ZlVEFpUVFIZEVNSWU0aEZLWHhQZkR3QSs4dVdFci9wcWRNbm1pdldMMjNO?=
 =?utf-8?B?dCs1amlFTG5FWFo2R3VIdzJZcE5wbk1kRjFNNHo2cXh2K3VsZWZRYkNjd3Aw?=
 =?utf-8?B?UlRuOGpJVkFYK1JJSUNOTjY0cDRmdEM3MnVUYjZmT2NUeCtJMXpmb2cxLzZS?=
 =?utf-8?B?eXpkYml5K2dmWkcxVzQ5QTM5NElrbkRISG0rZjBLTVFwM1d2V0JFVFB4eVVH?=
 =?utf-8?B?VkFVM1BaNnJRTWR6cDRldE43dGtPMjRodktleko2cVFhOTdDUWNnelQ4Zk1n?=
 =?utf-8?B?RllNclJ2Z3dMd2x4QUhQMFdDQXhQdVI5NWJrdnZEejk2VTAvcEhsVmFlL1I4?=
 =?utf-8?B?NUY0VU51UnRocFVvV3RWczZ6TXI2RHBFbHhtV0pxbGdKRzhiRDNyQ1lpcWF3?=
 =?utf-8?B?OFlsWWdvSldaZ29SYzNWdVB0TVBFenk4RDNsVlVjK0xOMXMyKy96MTJVY0FP?=
 =?utf-8?B?NGQ1RVdIWWtxT0hnTkhtZXFsRUJKMGRXY0JLVVVCVWx3VFlwTHMxNDJkMlVl?=
 =?utf-8?B?eS9PYytWbWJRcE5YcWltSTd0WG41ZTZZWHYvc2RQYWh1c0dJcGZVcVpmcVRn?=
 =?utf-8?B?aksyTnVEeFI0aE02MGpKYjNPQjdFdnZvdE9PTjNjWWRJWFRwSFpmYW1LUDJN?=
 =?utf-8?B?b0s5aUpVSXRSYXdnZmx2WS9mMG9mcGRvWmhDMzdWQ0hxWTRTRi81dit5SnY0?=
 =?utf-8?B?TXpVVXlESHdSdlVkalY4ZDVCdEpEUkNTV0tmV1ltNWloam1wVGdEUGZ1azFI?=
 =?utf-8?B?cnIxZ2tqQllZb2x4b216RnBHR0tqZHVGQzB5bzlUV1lyR1VRckxOS3h5bThv?=
 =?utf-8?B?dndRZ2x1YWVmdzhoTEZCSEhNbFdsbm1RVW5MTktmczJsTEI4N3lSSEpVYTd6?=
 =?utf-8?B?YlhNejN3N2t2WFFCTTdqdk5kZy9BazNUcVErb09RSTBmV0R5bjN2bk9HbjY4?=
 =?utf-8?B?RU1VYUZjSlU3SDdWZHhiMlNSbk9jMkdqcXNLTTg0bDZrekF1aEVpaElBVTdw?=
 =?utf-8?B?WGFOZ0tPUFFXcXJDMFcwUkx6Q205RkxRajA4aXMwZythYzdrblRLbXZxQUha?=
 =?utf-8?B?cE5zNUJOUFVJMTdwd0xvZlNlaXhFZzJMNXlUOUozcFFkSnpxbVdnNks0cEg5?=
 =?utf-8?B?SzUzajFKZEN0OVNLSDQzRDBaV0ExUkNCTUV0VW44VHhjUTRvc0F3djIwS01q?=
 =?utf-8?B?NmFiNzRreE1LNGxSUC9Iem1OZHh2MlRvTnk1N3AzellXb25Ldmx5YzhQQ1VL?=
 =?utf-8?B?YnZsR2EzeDlQZkE2T3NPMlZrNVViSng3YjVqaXN0Z3ZvMEVGOXhNN0pCWlJ6?=
 =?utf-8?B?SENjTWQwQkY2OUpEZ2NoQlBvTzlQek9kSnc5Ukd1N1lzVlg0cGltZGJpWUZP?=
 =?utf-8?B?MjhqU0ZHWFZFeWN5a3U2aEdCcTdtMGpGckRKeVhROFhVdGNXSEJZbTc1L3M4?=
 =?utf-8?B?MG9Ddys5ejBHTHNHUkFEVE14UnJCa2MyKzFSTDVmMVRpdEZ0WEpqYTcvNmZ3?=
 =?utf-8?Q?G6/M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C69EDBAB7AECC24D82E87BB3AD186DEC@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e351ae33-bb50-44e4-3245-08dcb13b3ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 08:31:59.4832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y81EKa/zo6NGbXLCHsKGowMbZ0qlij9WFQcyG/8/t2Lycq3YfqXNS7Olerj4UJ1p88BzPdQ+SSHqnRm1yVlyvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805

T24gMjAyNC83LzMwIDIxOjA5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiBPbiAwOC8wNy8yMDI0
IDEyOjQxIHBtLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IElmIHJ1biBYZW4gd2l0aCBQVkggZG9t
MCBhbmQgaHZtIGRvbVUsIGh2bSB3aWxsIG1hcCBhIHBpcnEgZm9yDQo+PiBhIHBhc3N0aHJvdWdo
IGRldmljZSBieSB1c2luZyBnc2ksIHNlZSBxZW11IGNvZGUNCj4+IHhlbl9wdF9yZWFsaXplLT54
Y19waHlzZGV2X21hcF9waXJxIGFuZCBsaWJ4bCBjb2RlDQo+PiBwY2lfYWRkX2RtX2RvbmUtPnhj
X3BoeXNkZXZfbWFwX3BpcnEuIFRoZW4geGNfcGh5c2Rldl9tYXBfcGlycQ0KPj4gd2lsbCBjYWxs
IGludG8gWGVuLCBidXQgaW4gaHZtX3BoeXNkZXZfb3AsIFBIWVNERVZPUF9tYXBfcGlycQ0KPj4g
aXMgbm90IGFsbG93ZWQgYmVjYXVzZSBjdXJyZCBpcyBQVkggZG9tMCBhbmQgUFZIIGhhcyBubw0K
Pj4gWDg2X0VNVV9VU0VfUElSUSBmbGFnLCBpdCB3aWxsIGZhaWwgYXQgaGFzX3BpcnEgY2hlY2su
DQo+Pg0KPj4gU28sIGFsbG93IFBIWVNERVZPUF9tYXBfcGlycSB3aGVuIGRvbTAgaXMgUFZIIGFu
ZCBhbHNvIGFsbG93DQo+PiBQSFlTREVWT1BfdW5tYXBfcGlycSBmb3IgdGhlIHJlbW92YWwgZGV2
aWNlIHBhdGggdG8gdW5tYXAgcGlycS4NCj4+IEFuZCBhZGQgYSBuZXcgY2hlY2sgdG8gcHJldmVu
dCAodW4pbWFwIHdoZW4gdGhlIHN1YmplY3QgZG9tYWluDQo+PiBkb2Vzbid0IGhhdmUgYSBub3Rp
b24gb2YgUElSUS4NCj4+DQo+PiBTbyB0aGF0IHRoZSBpbnRlcnJ1cHQgb2YgYSBwYXNzdGhyb3Vn
aCBkZXZpY2UgY2FuIGJlDQo+PiBzdWNjZXNzZnVsbHkgbWFwcGVkIHRvIHBpcnEgZm9yIGRvbVUg
d2l0aCBhIG5vdGlvbiBvZiBQSVJRDQo+PiB3aGVuIGRvbTAgaXMgUFZIDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmlx
aWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC94ODYv
aHZtL2h5cGVyY2FsbC5jIHwgIDYgKysrKysrDQo+PiAgeGVuL2FyY2gveDg2L3BoeXNkZXYuYyAg
ICAgICB8IDEyICsrKysrKysrKystLQ0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS9oeXBlcmNhbGwuYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+IGluZGV4IDBm
YWI2NzBhNDg3MS4uMDNhZGEzYzg4MGJkIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9oeXBlcmNhbGwuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4g
QEAgLTcxLDggKzcxLDE0IEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNU
X0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgDQo+PiAgICAgIHN3aXRjaCAoIGNtZCApDQo+
PiAgICAgIHsNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAqIE9ubHkgYmVpbmcgcGVybWl0
dGVkIGZvciBtYW5hZ2VtZW50IG9mIG90aGVyIGRvbWFpbnMuDQo+PiArICAgICAgICAqIEZ1cnRo
ZXIgcmVzdHJpY3Rpb25zIGFyZSBlbmZvcmNlZCBpbiBkb19waHlzZGV2X29wLg0KPj4gKyAgICAg
ICAgKi8NCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfbWFwX3BpcnE6DQo+PiAgICAgIGNhc2UgUEhZ
U0RFVk9QX3VubWFwX3BpcnE6DQo+PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICAgICAgY2Fz
ZSBQSFlTREVWT1BfZW9pOg0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9pcnFfc3RhdHVzX3F1ZXJ5
Og0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9nZXRfZnJlZV9waXJxOg0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMgYi94ZW4vYXJjaC94ODYvcGh5c2Rldi5jDQo+PiBpbmRl
eCBkNmRkNjIyOTUyYTkuLjlmMzBhOGM2M2EwNiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9waHlzZGV2LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMNCj4+IEBAIC0zMjMs
NyArMzIzLDExIEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICBpZiAoICFkICkNCj4+ICAgICAgICAgICAg
ICBicmVhazsNCj4+ICANCj4+IC0gICAgICAgIHJldCA9IHBoeXNkZXZfbWFwX3BpcnEoZCwgbWFw
LnR5cGUsICZtYXAuaW5kZXgsICZtYXAucGlycSwgJm1zaSk7DQo+PiArICAgICAgICAvKiBPbmx5
IG1hcHBpbmcgd2hlbiB0aGUgc3ViamVjdCBkb21haW4gaGFzIGEgbm90aW9uIG9mIFBJUlEgKi8N
Cj4+ICsgICAgICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkgfHwgaGFzX3BpcnEoZCkgKQ0KPj4g
KyAgICAgICAgICAgIHJldCA9IHBoeXNkZXZfbWFwX3BpcnEoZCwgbWFwLnR5cGUsICZtYXAuaW5k
ZXgsICZtYXAucGlycSwgJm1zaSk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAg
cmV0ID0gLUVPUE5PVFNVUFA7DQo+PiAgDQo+PiAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihk
KTsNCj4+ICANCj4+IEBAIC0zNDYsNyArMzUwLDExIEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50
IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICBpZiAo
ICFkICkNCj4+ICAgICAgICAgICAgICBicmVhazsNCj4+ICANCj4+IC0gICAgICAgIHJldCA9IHBo
eXNkZXZfdW5tYXBfcGlycShkLCB1bm1hcC5waXJxKTsNCj4+ICsgICAgICAgIC8qIE9ubHkgdW5t
YXBwaW5nIHdoZW4gdGhlIHN1YmplY3QgZG9tYWluIGhhcyBhIG5vdGlvbiBvZiBQSVJRICovDQo+
PiArICAgICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpIHx8IGhhc19waXJxKGQpICkNCj4+ICsg
ICAgICAgICAgICByZXQgPSBwaHlzZGV2X3VubWFwX3BpcnEoZCwgdW5tYXAucGlycSk7DQo+PiAr
ICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7DQo+PiAgDQo+
PiAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsNCj4+ICANCj4gDQo+IEdpdGxhYiBpcyBk
aXNwbGVhc2VkIHdpdGggeW91ciBvZmZlcmluZy4NCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94
ZW4tcHJvamVjdC94ZW4vLS9waXBlbGluZXMvMTM5MzQ1OTYyMg0KPiANCj4gVGhpcyBicmVha3Mg
Ym90aCB7YWRsLHplbjNwfS1wY2ktaHZtLXg4Ni02NC1nY2MtZGVidWcsIGFuZCBnaXZlbiB0aGU6
DQo+IA0KPiAoWEVOKSBbwqDCoMKgIDguMTUwMzA1XSBIVk0gcmVzdG9yZSBkMTogQ1BVIDANCj4g
bGlieGw6IGVycm9yOiBsaWJ4bF9wY2kuYzoxNDkxOnBjaV9hZGRfZG1fZG9uZTogRG9tYWluDQo+
IDE6eGNfcGh5c2Rldl9tYXBfcGlycSBpcnE9MTggKGVycm9yPS0xKTogTm90IHN1cHBvcnRlZA0K
PiBsaWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5jOjE4MDk6ZGV2aWNlX3BjaV9hZGRfZG9uZTogRG9t
YWluDQo+IDE6bGlieGxfX2RldmljZV9wY2lfYWRkIGZhaWxlZCBmb3IgUENJIGRldmljZSAwOjM6
MC4wIChyYyAtMykNCj4gbGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzoxOTYyOmRvbWNyZWF0
ZV9hdHRhY2hfZGV2aWNlczogRG9tYWluDQo+IDE6dW5hYmxlIHRvIGFkZCBwY2kgZGV2aWNlcw0K
PiBsaWJ4bDogZXJyb3I6IGxpYnhsX3hzaGVscC5jOjIwNjpsaWJ4bF9feHNfcmVhZF9tYW5kYXRv
cnk6IHhlbnN0b3JlIHJlYWQNCj4gZmFpbGVkOiBgL2xpYnhsLzEvdHlwZSc6IE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkNCj4gbGlieGw6IHdhcm5pbmc6IGxpYnhsX2RvbS5jOjQ5OmxpYnhsX19k
b21haW5fdHlwZTogdW5hYmxlIHRvIGdldCBkb21haW4NCj4gdHlwZSBmb3IgZG9taWQ9MSwgYXNz
dW1pbmcgSFZNDQo+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTYxNjpkb21haW5fZGVz
dHJveV9kb21pZF9jYjogRG9tYWluDQo+IDE6eGNfZG9tYWluX2Rlc3Ryb3kgZmFpbGVkOiBObyBz
dWNoIHByb2Nlc3MNCg0KU29ycnkgdG8gZm9yZ2V0IHRvIHZhbGlkYXRlIHRoZSBzY2VuYXJpbyBv
ZiAiaHZtX3BpcnE9MCIgZm9yIEhWTSBndWVzdCBzaW5jZSBWMTAtPlYxMShyZW1vdmUgdGhlIHNl
bGYtY2hlY2sgImQgPT0gY3VycmQiKS4NCg0KVjEwIHZlcnNpb246DQorICAgICAgICAvKiBQcmV2
ZW50IHNlbGYtbWFwIHdoZW4gY3VycmQgaGFzIG5vIFg4Nl9FTVVfVVNFX1BJUlEgZmxhZyAqLw0K
KyAgICAgICAgaWYgKCBpc19odm1fZG9tYWluKGQpICYmICFoYXNfcGlycShkKSAmJiBkID09IGN1
cnJkICkNCisgICAgICAgIHsNCisgICAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsNCisg
ICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQorICAgICAgICB9DQoNClYxMSB2ZXJzaW9u
Og0KKyAgICAgICAgLyogUHJldmVudCBtYXBwaW5nIHdoZW4gdGhlIHN1YmplY3QgZG9tYWluIGhh
cyBubyBYODZfRU1VX1VTRV9QSVJRICovDQorICAgICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkg
JiYgIWhhc19waXJxKGQpICkNCisgICAgICAgIHsNCisgICAgICAgICAgICByY3VfdW5sb2NrX2Rv
bWFpbihkKTsNCisgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQorICAgICAgICB9DQoN
ClYxMCBpcyBmaW5lIGZvciB3aGVuIGh2bV9waXJxIGlzIGVuYWJsZSBvciBkaXNhYmxlLiANClRo
aXMgaXNzdWUgaXMgZnJvbSBWMTEsIHRoZSBjYXVzZSBpcyB0aGF0IHdoZW4gcGFzcyAiaHZtX3Bp
cnE9MCIgdG8gSFZNIGd1ZXN0LCB0aGVuIGhhc19waXJxKCkgaXMgZmFsc2UsIGJ1dCBpdCBzdGls
bCB1c2VzIHRoZSBwaXJxIHRvIHJvdXRlIHRoZSBpbnRlcnJ1cHQgb2YgcGFzc3Rocm91Z2ggZGV2
aWNlcy4NClNvLCBpdCBzdGlsbCBkb2VzIHhjX3BoeXNkZXZfKHVuKW1hcF9waXJxLCB0aGVuIGZh
aWxzIGF0IHRoZSBoYXNfcGlycSgpIGNoZWNrLg0KDQpIaSBKYW4sDQpTaG91bGQgSSBuZWVkIHRv
IGNoYW5nZSB0byBWMTAgdG8gb25seSBwcmV2ZW50IHRoZSBzZWxmLW1hcHBpbmcgd2hlbiB0aGUg
c3ViamVjdCBkb21haW4gaGFzIG5vIFBJUlE/DQpTbyB0aGF0IGl0IGNhbiBhbGxvdyBQSFlTREVW
T1BfbWFwX3BpcnEgZm9yIGZvcmVpZ24gbWFwcGluZywgbm8gbWF0dGVyIHRoZSBkb20wIG9yIHRo
ZSBkb21VIGhhcyBQSVJRIG9yIG5vdD8NCg0KPiANCj4gSSdkIHNheSB0aGF0IHdlJ3JlIGhpdHRp
bmcgdGhlIG5ld2x5IGludHJvZHVjZWQgLUVPUE5PVFNVUFAgcGF0aC4NCj4gDQo+IEluIHRoZSB0
ZXN0IHNjZW5hcmlvLCBkb20wIGlzIFBWLCBhbmQgaXQncyBhbiBIVk0gZG9tVSB3aGljaCBpcyBi
cmVha2luZy4NCj4gDQo+IFRoZSBzaWJsaW5nICotcGNpLXB2LSogdGVzdHMgKGEgUFYgZG9tVSkg
YXJlIHdvcmtpbmcgZmluZS4NCj4gDQo+IEVpdGhlciB3YXksIEknbSBnb2luZyB0byByZXZlcnQg
dGhpcyBmb3Igbm93IGJlY2F1c2UgY2xlYXJseSB0aGUgInRoZQ0KPiBzdWJqZWN0IGRvbWFpbiBo
YXMgYSBub3Rpb24gb2YgUElSUSIgaGFzbid0IGJlZW4gcmVhc29uZWQgYWJvdXQNCj4gY29ycmVj
dGx5LCBhbmQgaXQncyBpbXBvcnRhbnQgdG8ga2VlcCBHaXRsYWIgQ0kgZ3JlZW4gYWNyb3NzIHRo
ZSBib2FyZC4NCj4gDQo+IH5BbmRyZXcNCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hl
bi4NCg==


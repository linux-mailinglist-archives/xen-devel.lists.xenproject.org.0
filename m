Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFAD91ED62
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 05:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751913.1160011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOTzC-0002KJ-7q; Tue, 02 Jul 2024 03:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751913.1160011; Tue, 02 Jul 2024 03:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOTzC-0002IM-58; Tue, 02 Jul 2024 03:15:18 +0000
Received: by outflank-mailman (input) for mailman id 751913;
 Tue, 02 Jul 2024 03:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMB5=OC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sOTzA-0002IG-LJ
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 03:15:16 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c96643a-3821-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 05:15:15 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 03:15:10 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 03:15:10 +0000
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
X-Inumbo-ID: 4c96643a-3821-11ef-958a-bbd156597b9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG+jCdwNrC46xRLOhFEHwFsARyfyD2PVrvwRzeNMlQD0cjj9ryqkZ4RqjZlHkZPVYDE40phMG9RdcKVo0giTopNU3Mg56eY0C5JB203wR7ZjPs73UGIgDXvRBeMz4bQXxYi46P8k0fXVCBBOOP2IuT5nla9fTlsBRv5BRSaHtueR7a5YJaH3AtEZ0+g15kpmyXYbRvhuzhY39xwEASxZcysre9RgVdD6p4FiZndsMymS6WLjmK1PejmzhUc4lB72KxtjRgJspBI867CcTYMPi3c5zWbcZCY9BC2hWLHd+5M2fm8tY+DgtIk1fgkIgX/NqSrOP3mgfbt1Dvq2U6EceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMi2Yu33QD6WkYPr8eFtjTL15W+yfB+/sJ1/MknNhT0=;
 b=gwtwDwsLzHVQmMhS4blKCTveOrGKlXbE6VHn1BDvfW5jFEexiAeeen0ZF/BJIe1EvVkPJogcUzgR30yrVg6icPhwomrCj65ictqxCV/oB+uk9NBwoxx7/i/rYLGC1CHWsmsvVUtvhT4yz/TLp8tYEM6pHvfOCrRC7vEVNDb6N6b4Y+O83K7vAZGNzpqJvzX1F1Y3s96msrjWHc9mFnOSo6FoPe4rYqY6aujz7mVUUHhvGe6sCxFPUoKyTPN6yQvXJ8sw8CiHNA632YdGDy4gCtizlcsi+ISx6O8g/uVdlp8R4lUKPI+TgAcWiEfZqGXava4ZAd/9ym7ar6OVzHI1kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMi2Yu33QD6WkYPr8eFtjTL15W+yfB+/sJ1/MknNhT0=;
 b=kutc5Vq3RYCSY+XJmtaLIPTOMndTBpf6ZvubR4ug4rzA0c1OdplbsVGNCUfxh2WGGgtxwuneYdCif0lpbx0YuQjldmP1Zi9xR84V2/EFx4v3dR5O2sQBU5RfQ1BVneX9nTNLuw/5ZD0FfVuIgW8QEQ5aM6MogrxOakSH1JTlSlw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHayunRhQS+lhfPgk6PWMYxsBafhLHhf0AAgAHJ+4A=
Date: Tue, 2 Jul 2024 03:15:10 +0000
Message-ID:
 <BL1PR12MB5849C3882D31620ADAC55ADAE7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-3-Jiqian.Chen@amd.com>
 <9a311ee0-dcf2-4609-aced-7f57b322da5f@suse.com>
In-Reply-To: <9a311ee0-dcf2-4609-aced-7f57b322da5f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7719.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB5958:EE_
x-ms-office365-filtering-correlation-id: 913c4559-1c78-4aed-b5c7-08dc9a452e87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eTZpY3RrN1RWZ3c4dDNuemIzUGZiaXF5WlcvTXo4TUhXZC9JWW1TYm5iQVBN?=
 =?utf-8?B?cWl1ZWNPQzNsRDJhblFxQ0xpYml3c0FnRDI4ZHNPZks0SGZORUFIdU1CSGVF?=
 =?utf-8?B?QjU0ZTdpSk1heXMvaUl4RkhEMGRSbXFBV0NxUkx0QklLeEcvMXZoOXBSaTlV?=
 =?utf-8?B?cHJhVERHZW85bmFRSytSV0oxcEJ6aE8xT0lLY2RHYW5mVU9SMFh3VUw0YWhL?=
 =?utf-8?B?NFJwNlRPemxzYmxKUGZIdWNTOGVpRVl3K2tUR01pdG9sMHNyZXZrbjhXY0Mw?=
 =?utf-8?B?L21vc0FMRTBJaHdxdjl6K1piSmRqbVhac3U5SzlTdERKQlMvQ003L2xZbmF5?=
 =?utf-8?B?UHRHS3NlcStpWXpQYlRvV1ZPdHFzUGlZWG5VUHlSYzUwTkwvNEN3M1ZneFlz?=
 =?utf-8?B?MHp1VjhnMDRPQkt2cm9rbS9tTEpESUdweVRYcGhPUGloUm03MEtVak9aeG9M?=
 =?utf-8?B?UzJOck51djB3ckV2SmlsekpBdzZjK29vRUIrS1dwdk42Q0FFQUplSUhpV0tU?=
 =?utf-8?B?cmViazNYZUg1bG5FaFBWQVdKM2xHdGJ1VEhzZTU1NlZ2LzhlbHhKVGRMWCtN?=
 =?utf-8?B?NDNMYWRhR0VzQ1pUL0liQTBQQll6YWg1dmNvR0ZzTSs2eGdKVWl5THE0Lzd5?=
 =?utf-8?B?OFBkeXQya3ZGMzdSVTNZdDBLREduOXo5bkgvN1MyTERYZUNabmg2cU5CaXhP?=
 =?utf-8?B?SmJtUlB5Z0wvRzFsNFNJVGlOL0MrcmNndzhEWWRVeVNXZ3IrRzdJV2JqUTJX?=
 =?utf-8?B?RGFtOXdhcG96eTIzUUJZbVNvalJhaTYzdGd5dDYvRE1tZndxdUhEdkpqVDZP?=
 =?utf-8?B?ek9DUWFJRW1ZSGY2VW9FRnlQN3VUMnZQMVllNlgzYml4aWpXbHh2WDEycjZY?=
 =?utf-8?B?UFRZemVqSXF4dEMwTDBleVl1dHVORkU4T3hKNStRU0twWTVWSTZ2Vzh6MFE3?=
 =?utf-8?B?SnBmR09tRjhXZGN0OVRxa2g2clFVV21BYXZRdndBelhuN2ZteXFkZnowT2xp?=
 =?utf-8?B?NnUwZTJxb1k5QnVZS2ZZbnR2a1Y5bTRHZGRlRmlYSFowMmJuT29SM0c5Uk9z?=
 =?utf-8?B?aXlYcTJxQlN4aEFVcmJFSU9CR1VndEJwRTQyckdyaUNjU3hJdWN2UVoydzYw?=
 =?utf-8?B?dDFRUGkya3A3WEhEZlNQVjhwTzFUY2V6cURQNHI4RUhibjNGcUswcm1WWmZ1?=
 =?utf-8?B?WHNHeGdGTGVYSDFtQVBsTTFjWDlCTVltZnV6Zkx4TGNIdTVLUi9YNDI3UURh?=
 =?utf-8?B?eTdzUTRRcDhpMmxIUTRWRnl3N1V1RGpySVJQZUhFSDN2MnZjT2NkdTJ5TnNM?=
 =?utf-8?B?cGJTWkRTdVhoUkZZK1oxTmh0Z3ZmYWQ4UDFyMndRSURraDRGRWpubVFza0JR?=
 =?utf-8?B?Q0t2VGNVd2MzUkFnWGRESVdOeS9PUEFmeVY5a3VtNVUzcDNNdThUV1N4MGdk?=
 =?utf-8?B?YThLekttS3dJaXBneWthc0RsT3JucUM2MGdIdUFMZlJZdlhxMHV5S2FNRXZY?=
 =?utf-8?B?a0RwWmNYSmVGUmZ2clQrVk1iWG9WSXJFRzJub1owTWFBNDJKTFR0bFFLZlY3?=
 =?utf-8?B?cHBia04xK0hEbENOMVRraFFQWktCUjRHVWlUSitDTExhaTg1Mmx1YmxETlZV?=
 =?utf-8?B?cXY0eFI0Zi9RaUlaTmp1MmtEMWUwTkpIS3ZYWnBSSTNieXNlbWJrTkQ4eCt5?=
 =?utf-8?B?VUdObXVQRUVhTnhtNkJtTXZOeHNudjN3OFZWVkd6Snh1OUkreS9BUVlHYm4r?=
 =?utf-8?B?em40c1hOR2pxL2lJWlQwaFRFOHdCSVFFakwyd0gydzFWUEw5bnBJU3p4Z2k3?=
 =?utf-8?B?eWZDeENLb0pCYTREU3lJZk5SaFZiUlU0WXRiNytrbFJ5bXk5ckhWVGV1dkFl?=
 =?utf-8?B?Y1FsNlRBc3ZSWU94Q09uaGhjcXJiK0NIWXZrc2RjWlNoTlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3ZrWG5hRVNoODB6QUdIbVR0TWttV0dad08rVVcxNzVaVFBLNUZwZGxIVEsy?=
 =?utf-8?B?UGlKTVVlRndXaGJHYzJLeTFkeVc1VlJTVVlDaXducWdoMkl1MkhpVnZsMU1v?=
 =?utf-8?B?NGpBRmoybXZqTlIyaFc5MTlsdFRrYUZxYUNQcHJxL3NEa0lZK1VVQnZDc1pL?=
 =?utf-8?B?QWNMWksyWE1jMlp5Wks4c3E2c1lLNitvTTVkT0owSmpDUUJHZ1lKSExWbURD?=
 =?utf-8?B?YWNVRHl4VU5iMGVQTEh4ZnhXcGhrSDJmOVVBUStIZlJucmJTUFZvanNLdURN?=
 =?utf-8?B?SFpnYzdyb3c0ZlVVeWlDUnpweUtBMTc3SzZLR2lKZE1CWU5tb29wVE1OM1Ry?=
 =?utf-8?B?bWJ0cGFzTzV1SUlMNGFpUTB0ajdndThoOFdWNG1KK3pUby9DakNvUXd3dUxG?=
 =?utf-8?B?NU5aY2RLZmJZMTV5WTdQcXgweDd5ZnlpSXhIMTJ0WXcwRStCb0tlOW41d3o4?=
 =?utf-8?B?R2o2OHlERnJpdElKUis5YTNLNkIvS0E2aFMrZ0JBcEJKKzdYc2RPc3pVS3Bx?=
 =?utf-8?B?RjFISFpLTjVnSkJUSURLUHo5TStDVTl6MTF3b2JPMFd0b3Z5OFZsUitmdVU5?=
 =?utf-8?B?UDcycHlSWnM4WWlqVDAxblVpOEd0VGw5eHo5akZxUWZFVDk1Q2NwWXU2cC9O?=
 =?utf-8?B?TW1vZkhlQ1ZwN0E5aTNCSFdEL3N4MUkvbDJtSCtjNXdwaGVnU0xjZXVGUTR4?=
 =?utf-8?B?RnM4OWM5Q2plOTNmK3pUT3I4WmFsNnpxd25BTHIwSmdFZTRMbW44YXRWZDM0?=
 =?utf-8?B?N1BGdHBSNmZZQW54cWNzUEFTK1NJYzhuby9oTlYwK1o5NndzOUFHVUF2bFov?=
 =?utf-8?B?cXp4YWttWXVIcmF1cmVhVmlEQWI4M2o2c2VhUStOeSsydnh1dnJ2YUZYd2dU?=
 =?utf-8?B?ZHo0SnY4T1R2bFNqZDVqUFI1ZEFrR244Um1Qa3N3Z1gwY3N4RWsyMnl4Rnh0?=
 =?utf-8?B?L3ROMzNsT2ZqTHZJZThFV2N2aGZ5c0NUYVhVcHQ1aFJIeTE4QXFMR1FuVFpD?=
 =?utf-8?B?UXlGK2h0VUJmL1IzckoxcUVZUFlrS3I3OGlLc1RWVGRrZVpvUmhQK2ZWazlJ?=
 =?utf-8?B?OWl5OEw5SG9tVkUxdVB6UEY0YlJNVy9HaW4vMFAyVVZST2xNemI3THc2TmRr?=
 =?utf-8?B?d2ZEUGJ5Uk5NbStvOWdHeDFldHlQUWpMcGVISlZndSt5aWdOSkxoUlhrdFlx?=
 =?utf-8?B?b202TlpZWDg4aWlQRHZrYk9oU3Q0R3Naam1QRjYybHlLK1R3ZFdpQlY5eUxk?=
 =?utf-8?B?dFkwNTV6MDNLZG5PeE9ka0JWTXF0MlRGQkxUcmJuVmlQQVowM0F5NEFVN0t2?=
 =?utf-8?B?YzhFTmxLMFAwUHFGVDVxTThrRkdwcnBHb0xaT09tL3R2bFA3TGNyT1hEd2k4?=
 =?utf-8?B?Wk1VVkVQZmVpN000YTBualBVRTByM09JeEk1OVEwUy8wK1pxRzQ2UHArZUFP?=
 =?utf-8?B?Skh4aGU4dGlKUis3N24yc1lrSE5MejltT0F0dDU0Y3lXeFRGcFdvK1NBTGVv?=
 =?utf-8?B?WVc5RzQ0Rk1RQjRxV0xremFXbUprSEhjOCtXQzJJd0YrTHFDRkR0QjJSWWls?=
 =?utf-8?B?TGUrSVhFdm92Y0xnMS9wZW0xeHhaWGIybHd2VmVScWdMb0VZS00vc3NOcGZj?=
 =?utf-8?B?eFhzZ240Q2k2ZEFFd1A0ZC9GSWNpOTJVcXNBMzlTdFdhL0Jka045UlQzWWl6?=
 =?utf-8?B?c3BhTEZHdlJVR1dJTTBpZnNxUmdaL05aTFhxMVFJR0pvV1NLVGtTZW1NbFJF?=
 =?utf-8?B?QjIrM1gxc3AwQXhRTzFVeTlNbUl1UVZyYXY2b2xmRlE5ZVdoa2cyTnE5SWsv?=
 =?utf-8?B?bUJocmpUakhHVVpJcFdLZGJWOHloZVQ5dC9uL25NNWtQM3pmY1NUR0xiNCtS?=
 =?utf-8?B?d0k0bmQxSHFnbWErVWNVQ09FY0dTM1NBN2dnalRxZFZoa1haZ0EwNzNraTAz?=
 =?utf-8?B?VFBFRzRkTWJScnNDdnZWeDR0d3RFS0NwRlB4THFaMGxORWp5eEtoWjVuTC9h?=
 =?utf-8?B?aGNZRzgzK0R2MGp2RWtuMmpJRVZJOFg2Y2JRNDVyRkMyQVRybDJvRVc5R1Nj?=
 =?utf-8?B?elRWZDhyK09nTUR1TFFlbWMwWjlaQU1iWjdvOXpFZXNBUTNKRFkvNlh3aFEw?=
 =?utf-8?Q?Pb9Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D80B69E0697BC1419440A9088C182B5D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913c4559-1c78-4aed-b5c7-08dc9a452e87
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 03:15:10.3214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBExDZtPVu8Yr4XaV60KX5lMPlkX2ew8ydDUBmMP2SNIx4PlKJpyk2D6f1w1EUrQcUsOvKJKV7/jSqH4z0mEzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958

T24gMjAyNC83LzEgMTU6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNi4yMDI0IDE0
OjMzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IElmIHJ1biBYZW4gd2l0aCBQVkggZG9tMCBhbmQg
aHZtIGRvbVUsIGh2bSB3aWxsIG1hcCBhIHBpcnEgZm9yDQo+PiBhIHBhc3N0aHJvdWdoIGRldmlj
ZSBieSB1c2luZyBnc2ksIHNlZSBxZW11IGNvZGUNCj4+IHhlbl9wdF9yZWFsaXplLT54Y19waHlz
ZGV2X21hcF9waXJxIGFuZCBsaWJ4bCBjb2RlDQo+PiBwY2lfYWRkX2RtX2RvbmUtPnhjX3BoeXNk
ZXZfbWFwX3BpcnEuIFRoZW4geGNfcGh5c2Rldl9tYXBfcGlycQ0KPj4gd2lsbCBjYWxsIGludG8g
WGVuLCBidXQgaW4gaHZtX3BoeXNkZXZfb3AsIFBIWVNERVZPUF9tYXBfcGlycQ0KPj4gaXMgbm90
IGFsbG93ZWQgYmVjYXVzZSBjdXJyZCBpcyBQVkggZG9tMCBhbmQgUFZIIGhhcyBubw0KPj4gWDg2
X0VNVV9VU0VfUElSUSBmbGFnLCBpdCB3aWxsIGZhaWwgYXQgaGFzX3BpcnEgY2hlY2suDQo+Pg0K
Pj4gU28sIGFsbG93IFBIWVNERVZPUF9tYXBfcGlycSB3aGVuIGRvbTAgaXMgUFZIIGFuZCBhbHNv
IGFsbG93DQo+PiBQSFlTREVWT1BfdW5tYXBfcGlycSBmb3IgdGhlIHJlbW92YWwgZGV2aWNlIHBh
dGggdG8gdW5tYXAgcGlycS4NCj4+IEFuZCBhZGQgYSBuZXcgY2hlY2sgdG8gcHJldmVudCAodW4p
bWFwIHdoZW4gdGhlIHN1YmplY3QgZG9tYWluDQo+PiBoYXMgbm8gWDg2X0VNVV9VU0VfUElSUSBm
bGFnLg0KPj4NCj4+IFNvIHRoYXQgdGhlIGludGVycnVwdCBvZiBhIHBhc3N0aHJvdWdoIGRldmlj
ZSBjYW4gYmUNCj4+IHN1Y2Nlc3NmdWxseSBtYXBwZWQgdG8gcGlycSBmb3IgZG9tVSB3aXRoIFg4
Nl9FTVVfVVNFX1BJUlEgZmxhZw0KPj4gd2hlbiBkb20wIGlzIFBWSA0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1i
eTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlh
biBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gDQo+IFlvdSBrZWVwIGNhcnJ5aW5n
IHRoaXMgUi1iLCBkZXNwaXRlIG1ha2luZyBmdW5jdGlvbmFsIGNoYW5nZXMuIFRoaXMgY2FuJ3Qg
YmUNCj4gcXVpdGUgcmlnaHQuDQpXaWxsIHJlbW92ZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+
IFdoaWxlIGZ1bmN0aW9uYWxseSBJJ20gbm93IG9rYXkgd2l0aCB0aGUgY2hhbmdlLCBJIHN0aWxs
IGhhdmUgYSBjb2RlIHN0cnVjdHVyZQ0KPiBjb25jZXJuOg0KPiANCj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9waHlzZGV2LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMNCj4+IEBAIC0z
MjMsNiArMzIzLDEzIEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICBpZiAoICFkICkNCj4+ICAgICAgICAg
ICAgICBicmVhazsNCj4+ICANCj4+ICsgICAgICAgIC8qIFByZXZlbnQgbWFwcGluZyB3aGVuIHRo
ZSBzdWJqZWN0IGRvbWFpbiBoYXMgbm8gWDg2X0VNVV9VU0VfUElSUSAqLw0KPj4gKyAgICAgICAg
aWYgKCBpc19odm1fZG9tYWluKGQpICYmICFoYXNfcGlycShkKSApDQo+PiArICAgICAgICB7DQo+
PiArICAgICAgICAgICAgcmN1X3VubG9ja19kb21haW4oZCk7DQo+PiArICAgICAgICAgICAgcmV0
dXJuIC1FT1BOT1RTVVBQOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4gICAgICAgICAgcmV0ID0g
cGh5c2Rldl9tYXBfcGlycShkLCBtYXAudHlwZSwgJm1hcC5pbmRleCwgJm1hcC5waXJxLCAmbXNp
KTsNCj4+ICANCj4+ICAgICAgICAgIHJjdV91bmxvY2tfZG9tYWluKGQpOw0KPj4gQEAgLTM0Niw2
ICszNTMsMTMgQEAgcmV0X3QgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHZvaWQpIGFyZykNCj4+ICAgICAgICAgIGlmICggIWQgKQ0KPj4gICAgICAgICAgICAg
IGJyZWFrOw0KPj4gIA0KPj4gKyAgICAgICAgLyogUHJldmVudCB1bm1hcHBpbmcgd2hlbiB0aGUg
c3ViamVjdCBkb21haW4gaGFzIG5vIFg4Nl9FTVVfVVNFX1BJUlEgKi8NCj4+ICsgICAgICAgIGlm
ICggaXNfaHZtX2RvbWFpbihkKSAmJiAhaGFzX3BpcnEoZCkgKQ0KPj4gKyAgICAgICAgew0KPj4g
KyAgICAgICAgICAgIHJjdV91bmxvY2tfZG9tYWluKGQpOw0KPj4gKyAgICAgICAgICAgIHJldHVy
biAtRU9QTk9UU1VQUDsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICAgICAgICAgIHJldCA9IHBo
eXNkZXZfdW5tYXBfcGlycShkLCB1bm1hcC5waXJxKTsNCj4+ICANCj4+ICAgICAgICAgIHJjdV91
bmxvY2tfZG9tYWluKGQpOw0KPiANCj4gSWYgeW91IGRpZCBnbyBsb29rLCB5b3Ugd2lsbCBoYXZl
IG5vdGljZWQgdGhhdCB3ZSB1c2UgInJldHVybiIgaW4gdGhlIG1pZGRsZQ0KPiBvZiB0aGlzIGZ1
bmN0aW9uIG9ubHkgdmVyeSBzcGFyaW5nbHkgKHdoZW4gYWx0ZXJuYXRpdmVzIHdvdWxkIHJlc3Vs
dCBpbiBtb3JlDQo+IGNvbXBsaWNhdGVkIGNvZGUgZWxzZXdoZXJlKS4gSSB0aGluayB5b3Ugd2Fu
dCB0byBhdm9pZCAicmV0dXJuIiBoZXJlLCB0b28sDQo+IGFuZCBwcm9iYWJseSBnbyBldmVuIGZ1
cnRoZXIgYW5kIGF2b2lkIHRoZSBleHRyYSByY3VfdW5sb2NrX2RvbWFpbigpIGFzIHdlbGwuDQo+
IFRoYXQncyBlYXNpbHkgcG9zc2libGUgdG8gYXJyYW5nZSBmb3IgKHRha2luZyB0aGUgbGF0dGVy
IGNhc2UgYXMgZXhhbXBsZSk6DQo+IA0KPiAgICAgICAgIC8qIFByZXZlbnQgdW5tYXBwaW5nIHdo
ZW4gdGhlIHN1YmplY3QgZG9tYWluIGhhcyBubyBYODZfRU1VX1VTRV9QSVJRICovDQo+ICAgICAg
ICAgaWYgKCAhaXNfaHZtX2RvbWFpbihkKSB8fCBoYXNfcGlycShkKSApDQo+ICAgICAgICAgICAg
IHJldCA9IHBoeXNkZXZfdW5tYXBfcGlycShkLCB1bm1hcC5waXJxKTsNCj4gICAgICAgICBlbHNl
DQo+ICAgICAgICAgICAgIHJldCA9IC1FT1BOT1RTVVBQOw0KPiANCj4gICAgICAgICByY3VfdW5s
b2NrX2RvbWFpbihkKTsNCj4gDQo+IFBlcnNvbmFsbHkgSSB3b3VsZCBldmVuIHVzZSBhIGNvbmRp
dGlvbmFsIG9wZXJhdG9yIGhlcmUsIGJ1dCBJIGJlbGlldmUNCj4gb3RoZXJzIG1pZ2h0IGRpc2xp
a2UgaXRzIHVzZSBpbiBzaXR1YXRpb25zIGxpa2UgdGhpcyBvbmUuDQo+IA0KPiBUaGUgcmUtYXJy
YW5nZW1lbnQgbWFrZSBhIGxpdHRsZSBtb3JlIG5vdGljZWFibGUgdGhvdWdoIHRoYXQgdGhlIGNv
bW1lbnQNCj4gaXNuJ3QgcXVpdGUgcmlnaHQgZWl0aGVyOiBQViBkb21haW5zIG5lY2Vzc2FyaWx5
IGhhdmUgbm8NCj4gWDg2X0VNVV9VU0VfUElSUS4gTWF5YmUgIi4uLiBoYXMgbm8gbm90aW9uIG9m
IHBJUlEiPw0KDQpPciBqdXN0IGxpa2UgYmVsb3c/DQoNCiAgICAgICAgLyoNCiAgICAgICAgICog
UHJldmVudCB1bm1hcHBpbmcgd2hlbiB0aGUgc3ViamVjdCBodm0gZG9tYWluIGhhcyBubw0KICAg
ICAgICAgKiBYODZfRU1VX1VTRV9QSVJRDQogICAgICAgICAqLw0KICAgICAgICBpZiAoIGlzX2h2
bV9kb21haW4oZCkgJiYgIWhhc19waXJxKGQpICkNCiAgICAgICAgICAgIHJldCA9IC1FT1BOT1RT
VVBQOw0KICAgICAgICBlbHNlDQogICAgICAgICAgICByZXQgPSBwaHlzZGV2X3VubWFwX3BpcnEo
ZCwgdW5tYXAucGlycSk7DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlh
biBDaGVuLg0K


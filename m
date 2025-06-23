Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166ABAE36C6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022057.1397764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbbk-0008TJ-Aq; Mon, 23 Jun 2025 07:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022057.1397764; Mon, 23 Jun 2025 07:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbbk-0008R1-76; Mon, 23 Jun 2025 07:28:48 +0000
Received: by outflank-mailman (input) for mailman id 1022057;
 Mon, 23 Jun 2025 07:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owQ/=ZG=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uTbbi-0008Qu-Bb
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:28:46 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a971695c-5003-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 09:28:30 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB7733.eurprd03.prod.outlook.com (2603:10a6:20b:403::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 07:28:26 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 07:28:26 +0000
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
X-Inumbo-ID: a971695c-5003-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWia61va8fUwwOk7bkVVGp9r574Dsh+xg5Cd+uVRTlydKMFg6+qmSHb9wN3egfWoQa8aoY5YlA0ec50nFWJgzuihAcb3Meczm5sCjmml/287WH+TEMVQT19j1RzWEiFA2QIOgx1CA9OzVOzd4wo1kcm4oKuAwuvirTyfYVWKoImwaJY/pQguPU//flCPS1jOODsyfPUcioyL1jsFeXvJ11isIwk+dhvlfOhKYgyPMTeEVxAck5oJMYHMKN5c9f3DSkrXWtWXmoRubigA6R0iPsSMMNTNCio0dwG3zSsI6P6e1vjuYkz76XVhyU3O8+kHfIZ2cYFxxyAA0zv3GtEnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjwyexvGQRekSgV4AhLeTrC3O2F1+TG4VA9dU2Rk5uI=;
 b=BsvYV9MHnD0/nvOC8/T9eiRMmPs6XGHnia6uKVKsVBIIHaqIORmWQ6dCCrzNImvqf2Pso2MwIkaf88pr8NAWMZS/KLDW4TGW30RNvudC8OZXJBHVF17RuovguwxiQf1TM/+JF8HifSdg6gcmx27Qixz994UPi+FqRTKSikeqNY7YrC7RR9BeTArH4nF/6F9qO1goWHAn6c5ac+Nw7UFPtArUquKy1PLLI9uZl4TweaQEXnFfBEyCIzf2nFfCUhWKJfPodcqkncDA4peQJctj7ztSyDiuL8ZqTzAY1JsGhFrBxilrQ1LWoiGwq12XEr4qrP7PcS6e6ISLiMTscK3Klg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjwyexvGQRekSgV4AhLeTrC3O2F1+TG4VA9dU2Rk5uI=;
 b=jznT4tvdFZPvTUfvUveVQpMUQDDkSL9WjuElHx+O3QKcrn9Cfb1ChZbGrArIfCkSBzGsZi0PTOnhCUGo1bCb/Bms9wk8IYs9GpUIoOISpsL3ek7pd86HuAXeL4Uy7MmGaAyYs/qRF+wTwF7VEjnJYU7UVv3WuGaPoUHhtbop5PT4tBaTwzQHPrZMuNNznGy0QV10GJYv25PlTQrgci0WyUHg2zoZXDmyVyA4c7elSr+G+LUIHhGYLKLaXEWIfW5m1toYW1iK7lmH6p5lsA671uANVL33DailXU/VBvjOZxjR6z2Ob69+f9kMZA9XbeC73el9LZMFn4VY4H/SkbQDmQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index:
 AQHbyNXPDXt2FT3RV02cltfdm/Dd7rPdzmiAgCG+LgCACKrsAIACoXoAgAWykoCAAAOUAA==
Date: Mon, 23 Jun 2025 07:28:26 +0000
Message-ID: <b64e1323-9055-48d7-b5c8-2645382e3c92@epam.com>
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
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB7733:EE_
x-ms-office365-filtering-correlation-id: a2f987c1-7a64-48da-066c-08ddb2278b12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mkx4aksrT1FuV0VDRVBpVXpmR2Q3Q3dkL2xoSjNKc0lGeXdoaWdKL1ArcVpq?=
 =?utf-8?B?bkxWdXI1R2ZOTHFaWkw5TENoaDkrc2c5UUFQREx0eTAxQ3ZYRTRSUG4vZUJN?=
 =?utf-8?B?NmkwQ0orZFFlYjZvZEhMYW13UHducFliaHBCUHBUWDByN3BvT0o3M1RLRURx?=
 =?utf-8?B?a2NvQXlHeWo1ZGltTWhrSEl1TVBVMSswemQrRHBvR01yZTdhZFREa1lONGNR?=
 =?utf-8?B?YklmL3l1K1dTYWVRRFNxYzI4c2U3d1dGVUFOcVBqYVNFS1ZXa2Noa29Qb1pE?=
 =?utf-8?B?bTRXYk1XTkNpdjBoQnVqc3VrdzFGUThmdER0TGkxUE9WOWhCWSs4ZEIwNGlv?=
 =?utf-8?B?eHVud3VpSWluQVFJWmUwQ1l5Nm5OV2tHRFI4Q0pTWTJDbkpmc3lUV2phQlp0?=
 =?utf-8?B?WDRMRzUwZWdzZm9BUmdETkRXRXNRbEt5aUdxWWI3UTBCbHVvaDRIeTdLNk9C?=
 =?utf-8?B?aWc4V203U1BLYlhaMis2dk5vd09GcGhTYUlyWjNIL2k4MFU0aHRnaFlVR3pC?=
 =?utf-8?B?ZGVBV29WUjhTRi96WHB0dDJ2cmNMYlhjUlpIWWliTXg2bXVsUUlBNDNCQXhn?=
 =?utf-8?B?NzRDa2g3YVV1dzgwV3VyWjc3MVZDNUFCSENSVnVOQWMwY0VzRmY2Y0dNWjJK?=
 =?utf-8?B?aUFhOEhxTFFUOUFkT01BdVNwbStmbk5ha21mRGZNUXdwZnN2UVJEaEJaaGs5?=
 =?utf-8?B?czBvUnNTdW1DRDZpQ2RYSWp1TEg5N2RjeTJxdHhHMzVyZGJhN1FuWFo5RERT?=
 =?utf-8?B?UTdpTGZhbm1QZEEzOTRmMGZTUmtNR2lEU0hJZWk5emZtWkVPVWVZRzJTa2JE?=
 =?utf-8?B?RFh2Rnl1aW0xK3BSMExCT2krWXdwcStQNGRqeWlFaVNrYUU1VDUyN3BDb2hx?=
 =?utf-8?B?R0xyT2NLN0duUC93ZWc0OTJFcTlHNHViWkhnenMzSndVWTRTQkdyZndEUTky?=
 =?utf-8?B?eU92bVlmQktIdUduM3g2R3ZHWmhEdXdtcDZ1WXZib2s4SnpBL2xYUS95OFhy?=
 =?utf-8?B?Z3lOQW0wOFFySDZoRlQ4bW5qdGI2bVR5V1BhaDNCTzIwNHYwdDBEd3ZKa2E3?=
 =?utf-8?B?cUllWFB3N01PcUtieHJoL3I3QjRwSXdpdTJkd3orclZCZzdSZ1JjSXdxMTZ5?=
 =?utf-8?B?NkowWktsSitGeFlZR0hZQ2xxelloR2lObkhPdSt6cm5HbDk3QTlEZUdYbjBD?=
 =?utf-8?B?WmFxTGlpY1NxOTE1Yzh4NmNoeXFFSGI1WTIwNkQyTVlNa0hDcjlWUlFqaWVq?=
 =?utf-8?B?dVBVUng3TEZhTmVDMHQwd29aUHQwZUdOdWlGMzU0RXlZR0U5K3dkOUdRbTJu?=
 =?utf-8?B?MTZvZXVsRWdsWmd1cnhGWDJlM3lXRjM1eFBndnRQVmtQdlNiTXZweXVpMUo3?=
 =?utf-8?B?andSZjlmRWdMNTZlWk9BRXJjQVFmWlVyN0pZUFNJdElhckhkdUV3bnphRTB3?=
 =?utf-8?B?UE5hU2xyK0ptb3Q2cXJITk9qVG1MV05LQWtpc0lEYi81N1hpVTA4a2duTjRq?=
 =?utf-8?B?eDRwSGZma05TZ1RXenF2UUFQNTVrKzhpRThvUXVRN0NxOGpjemJNcGR5VGpo?=
 =?utf-8?B?SHozQndzL1dLa3RWRmFtNENjYlF5QXJrS0twOU5sY1RWYTV6VU5hTHdSeGhz?=
 =?utf-8?B?a3ZGRWMrS3FuTERNc3hPWnFQbExnVERIZmhzb3hXeFEzOU5wQUxkTm55SEI4?=
 =?utf-8?B?cWtFUnUrQmQ3UHgzU0ViK3czT1VmRXhoUTY3cmxsQ2hPT1U3cjFTOG00Y3pr?=
 =?utf-8?B?YWhSUTBPakRWTExuM0RBQ2lRbnFCUUw1TXE0QXBzSlZBTitYanZNYzBoUUV0?=
 =?utf-8?B?V1VZTit3bWtzU3ZuSHp0WGpTS2VtKzNQKzVTTDhFUVoxV0tmQmdLQzlXYWww?=
 =?utf-8?B?eVptVzUzVnFCZmVVWXkzRlpCNGpZZFk1dUtONjJDb1REcTlkaWhOdHU0d3VQ?=
 =?utf-8?B?Mkt3RXJVRmlVQkw2TkthSnRGQ29ZN3Y4dGNmSjBTd2x1ZVVTWkN1WXB5c2t1?=
 =?utf-8?Q?pTZ4GJ0clEBIEhJpvXwgBVW2c2N9Z4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1RwUFQ1RmR1VEdUVVFPS01XN0lHUFJvNkxjU3Fqb1JQbC9pd0h3VDhDVVFF?=
 =?utf-8?B?eURzcjZwRnB6dnV5MkV3R0pINlpaOTBkK1ZaclBJYXNlYmN5OUluWnptaHhj?=
 =?utf-8?B?MHhQb21hMFc0SEVCVzhEd0QzYWlFMEZvN0pPQW1zZjd3akhNdHdSWWI2emFs?=
 =?utf-8?B?eGNRWGJySis0OWNMWmxXeFZ0RnJodHJjM2JsVEdRKzMxTWxaVzdldmZVb0I5?=
 =?utf-8?B?c1JHc3NUalRyaC8rR0xrZ3F4NHBiNTN2TGhPUVJIcjlJcmVrd205TU0wS1FT?=
 =?utf-8?B?Y0J3SXdRK1o0Vi9MMlBMZjJOejVEbUZyOXVQUXNzZ0k4dUNFZ3RwWWoxbjg0?=
 =?utf-8?B?UkRDSXJNc2d2ejYvcmU1cVYrK1VSWUVXdWJwQ2JjTC9PUjRpNkNYQkJoQTFO?=
 =?utf-8?B?UmcyU3l2cTJEaGdKTU9VMzQ1QXNISnU2Q0RLVWEyOExJSnFIaTFEVE1LR2JU?=
 =?utf-8?B?UUptUmNSc3NjMEZXSUQwWW1vd0VXcnEzd21aVjFnazhMQy9nU2VCK0tQcHBl?=
 =?utf-8?B?bjFwZmNaWmRwT2tHS0w3by82ZWxXMTJKZi9PNWUvUHptbjRCcEVOdUE3ZkJC?=
 =?utf-8?B?MlBtL0Vxc0pwNUVkRitucTVWNE5aZ3VmTlFjN3krUkRKaXRHVW9pQjlOUk1X?=
 =?utf-8?B?K0ZkeTB5dGJuSVgxY3VLTUt4am9JKzBkL01TOFdHdFBicmcvOE5FME8rY3JE?=
 =?utf-8?B?RDNubXJGcUIvTTBuTlN5dWM3U0xldlJQYituU2IzRUVKZXd1V1ZGbEhCTnRy?=
 =?utf-8?B?UjJOMEJScFI2eXl4VkRXUnNmekZKR2VGdjhHWUpGTW1hNU9MZm40blgvTita?=
 =?utf-8?B?cTA2TjdBT3ZnUXpINmM5U0xmeWgwM1FKdklzd05kT0s5Wjl3WXI1MU40V0Qx?=
 =?utf-8?B?TGtSSUZKZ0V2VEVkR1o3M1Q0OE9NSVlycTd3cE52dnRGaXB1TDZUVC9Lalkx?=
 =?utf-8?B?QjhDcTkvOHRhUVZic2FaK2I3eTNvbHBNejBibzJZY1JYM2gvZHZhWmREcm5E?=
 =?utf-8?B?YnlGTFZoL29idDc0Q2htbm5CeFB1cVlUSWQ4VWZWZFNFQmJuckpES1AwM2d3?=
 =?utf-8?B?blczcmdOUTd4V0JSeit5TVFQVXVNa3A0TVBaYm5SS3F5UDBTYmlVME9zU2s4?=
 =?utf-8?B?dUpKckc4SkQxc1NMbS9lVG5WeHZFWS9JaTl6UUJ0NFo1MGFPbE4xb3V1K3RZ?=
 =?utf-8?B?OXAwOC9MS21Bb09UMVFoYXRZb3hYZTFDOU9ZYnhpTDZQajZEdmo4bGU3MEZU?=
 =?utf-8?B?MWJSaHdqMno4VzlxU09TKzgxWjhWNXJpY1BNdG9WZkE1UE5OaGxBTkxmdTc1?=
 =?utf-8?B?T3B3UldGMjkyU3ZtSkRGaE5vclpGMHpEeGpqR3czMmhveVNEVE1uVFpsN0ZH?=
 =?utf-8?B?YjB2c0V4WFh4N21BNkFSQnFpRUZ3V0sxR0x6RTNYSkpVUk5jZllabUhhM1FU?=
 =?utf-8?B?M2s4aTV4NVQrRDVxTXV2azhnaUJmMHhhRGp2bEFtWDMyaXMxbDlqTk1ieDY5?=
 =?utf-8?B?WEdQb1o5eW5TZHNoZitJY3ZmQTY1SjZxQlcwSGpSU2dSV2lBSDB3dWFCY3FH?=
 =?utf-8?B?cHpLOVpYd0k1OW1wNm94THlVS1kwaElDUjdDOEI2WVR3d1AvRENSVVhQWGh2?=
 =?utf-8?B?TVNZdEkybmc0SlhkTlM4M0YwOWNtY05QeDJtZTNoTXFFa0x1YlM2Z1VNY1BG?=
 =?utf-8?B?Y2JHOGltK2E5bmNBQnRaRCtMTCtCWVdBQk51TXd2dng4ZGRzdkRGbHdYSVFP?=
 =?utf-8?B?ZUZOM2dlaGI2aVZsdnZ3K25Fb25ueWxxTVRSRGtxRXRRNEdSNFhGdWRtUG95?=
 =?utf-8?B?VEw5U3JpcldHTktrdTdGdU1sbFZVS04vbnJOZ0o0RHRkTVJvbHUyL205Tk8x?=
 =?utf-8?B?M0tOTHJXMHdZUGRWRERCNThBMkVsYVNaKzJtOG9YUGo4K2JsRW1OenpnaTlK?=
 =?utf-8?B?TlQzbFpDUjZhWkt0QnlXZ1ZKU2JRQzk1RzYxNkJvNGFLR2hTYVU2Njd2NzNt?=
 =?utf-8?B?dnhjNzhGMzlMaWp4Q21icklLMVUrMkVTb21ySVFWTVhvTTJFNGtDeHdtbWV3?=
 =?utf-8?B?d28zeFVwRWZQVTVzZXRuVGpLeHdPR3hyQkFxNURmNHEyMjFocFNwZGx0OXR0?=
 =?utf-8?B?UDJDMTRIcDQzbHVRMHUvMnFraEY2c2lzamVuSGpzR1VVck9hc0FRN0d5TklN?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <887EEF663D091F4E9F931F6D4D6565B7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f987c1-7a64-48da-066c-08ddb2278b12
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 07:28:26.2703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMnd0phA7flgpXznwHeDS76BTHRWi/TB2bvMLb2E4MoTe1POgy0M69eZ5121AsbtBXqzb0hrDLt2wPMFxpKwbLOsqm49dqtzzT18ZO6xRm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7733

QWRkaW5nIFBhdWwgdG8gdGhlIGNvbnZlcnNhdGlvbi4NCg0KDQpPbiAyMy8wNi8yMDI1IDEwOjE1
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMDYuMjAyNSAxODoxNSwgT2xla3NpaSBNb2lz
aWVpZXYgd3JvdGU6DQo+PiBPbiAxOC8wNi8yMDI1IDAzOjA0LCBTdGVmYW5vIFN0YWJlbGxpbmkg
d3JvdGU6DQo+Pj4gT24gVGh1LCAxMiBKdW4gMjAyNSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6
DQo+Pj4+IEhpIFN0ZWZhbm8sDQo+Pj4+DQo+Pj4+IEknbSB2ZXJ5IHNvcnJ5IGZvciBhIGxvbmcg
c2lsZW5jZS4gUGxlYXNlIHNlZSBteSBhbnN3ZXJzIGJlbG93Og0KPj4+Pg0KPj4+PiBPbiAyMi8w
NS8yMDI1IDAzOjI1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+PiBPbiBNb24sIDE5
IE1heSAyMDI1LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4+PiBGcm9tOiBHcnlnb3Jp
aSBTdHJhc2hrbzxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NCj4+Pj4+Pg0KPj4+Pj4+IEFk
ZCBjaGFpbmVkIGhhbmRsaW5nIG9mIGFzc2lnbmVkIERUIGRldmljZXMgdG8gc3VwcG9ydCBhY2Nl
c3MtY29udHJvbGxlcg0KPj4+Pj4+IGZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBTQ0kgZnJhbWV3b3Jr
LCBzbyBEVCBkZXZpY2UgYXNzaWduIHJlcXVlc3QgY2FuIGJlDQo+Pj4+Pj4gcGFzc2VkIHRvIEZX
IGZvciBwcm9jZXNzaW5nIGFuZCBlbmFibGluZyBWTSBhY2Nlc3MgdG8gcmVxdWVzdGVkIGRldmlj
ZQ0KPj4+Pj4+IChmb3IgZXhhbXBsZSwgZGV2aWNlIHBvd2VyIG1hbmFnZW1lbnQgdGhyb3VnaCBG
VyBpbnRlcmZhY2UgbGlrZSBTQ01JKS4NCj4+Pj4+Pg0KPj4+Pj4+IFRoZSBTQ0kgYWNjZXNzLWNv
bnRyb2xsZXIgRFQgZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2hhaW5lZCBhZnRlciBJT01NVQ0KPj4+
Pj4+IHByb2Nlc3NpbmcgYW5kIGV4cGVjdGVkIHRvIGJlIGV4ZWN1dGVkIGZvciBhbnkgRFQgZGV2
aWNlIHJlZ2FyZGxlc3Mgb2YgaXRzDQo+Pj4+Pj4gcHJvdGVjdGlvbiBieSBJT01NVSAob3IgaWYg
SU9NTVUgaXMgZGlzYWJsZWQpLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhpcyBhbGxvd3MgdG8gcGFzcyBu
b3Qgb25seSBJT01NVSBwcm90ZWN0ZWQgRFQgZGV2aWNlIHRocm91Z2gNCj4+Pj4+PiB4bC5jZmc6
ImR0ZGV2IiBwcm9wZXJ0eSBmb3IgcHJvY2Vzc2luZzoNCj4+Pj4+Pg0KPj4+Pj4+IGR0ZGV2ID0g
Ww0KPj4+Pj4+ICAgICAgICAiL3NvYy92aWRlb0BlNmVmMDAwMCIsIDwtIElPTU1VIHByb3RlY3Rl
ZCBkZXZpY2UNCj4+Pj4+PiAgICAgICAgIi9zb2MvaTJjQGU2NTA4MDAwIiwgPC0gbm90IElPTU1V
IHByb3RlY3RlZCBkZXZpY2UNCj4+Pj4+PiBdDQo+Pj4+Pj4NCj4+Pj4+PiBUaGUgY2hhbmdlIGlz
IGRvbmUgaW4gdHdvIHBhcnRzOg0KPj4+Pj4+IDEpIHVwZGF0ZSBpb21tdV9kb19kdF9kb21jdGwo
KSB0byBjaGVjayBmb3IgZHRfZGV2aWNlX2lzX3Byb3RlY3RlZCgpIGFuZA0KPj4+Pj4+IG5vdCBm
YWlsIGlmIERUIGRldmljZSBpcyBub3QgcHJvdGVjdGVkIGJ5IElPTU1VDQo+Pj4+Pj4gMikgYWRk
IGNoYWluZWQgY2FsbCB0byBzY2lfZG9fZG9tY3RsKCkgaW4gZG9fZG9tY3RsKCkNCj4+Pj4+Pg0K
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEdyeWdvcmlpIFN0cmFzaGtvPGdyeWdvcmlpX3N0cmFzaGtv
QGVwYW0uY29tPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2PG9sZWtz
aWlfbW9pc2llaWV2QGVwYW0uY29tPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+
Pg0KPj4+Pj4+ICAgICB4ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMgICAgICAgICAgICAgfCAz
NyArKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+Pj4gICAgIHhlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9maXJtd2FyZS9zY2kuaCB8IDE0ICsrKysrKysrKysNCj4+Pj4+PiAgICAgeGVuL2Nv
bW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKw0KPj4+
Pj4+ICAgICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jICAgfCAgNiArKysr
DQo+Pj4+Pj4gICAgIDQgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4+DQo+
Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYyBiL3hlbi9hcmNo
L2FybS9maXJtd2FyZS9zY2kuYw0KPj4+Pj4+IGluZGV4IGUxNTIyZTEwZTIuLjhlZmQ1NDFjNGYg
MTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jDQo+Pj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jDQo+Pj4+Pj4gQEAgLTEyNiw2ICsxMjYs
NDMgQEAgaW50IHNjaV9hc3NpZ25fZHRfZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBk
dF9kZXZpY2Vfbm9kZSAqZGV2KQ0KPj4+Pj4+ICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+Pj4gICAg
IH0NCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gK2ludCBzY2lfZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9t
Y3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkNCj4+Pj4+PiAr
ew0KPj4+Pj4+ICsgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXY7DQo+Pj4+Pj4gKyAgICBp
bnQgcmV0ID0gMDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBzd2l0Y2ggKCBkb21jdGwtPmNtZCAp
DQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAgICBjYXNlIFhFTl9ET01DVExfYXNzaWduX2Rldmlj
ZToNCj4+Pj4+PiArICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4+Pj4+IEFyZSB5b3Ugc3Vy
ZSAtRU9QTk9UU1VQUCBpcyB0aGUgcmlnaHQgZXJyb3IgY29kZSBmb3IgdGhlIDMgY2hlY2tzIGJl
bG93Pw0KPj4+PiBUaGUgLUVPUE5PVFNVUFAgY29kZSBpcyB1c2VkIGJlY2F1c2UgdGhpcyBpcyBw
YXJ0IG9mIGEgY2hhaW5lZCBjYWxsIGFmdGVyDQo+Pj4+IGlvbW11X2RvX2RvbWN0bCwgYXMgc3Rh
dGVkIGluIHhlbi9jb21tb24vZG9tY3RsLmM6ODU5LiBUaGUNCj4+Pj4gWEVOX0RPTUNUTF9hc3Np
Z25fZGV2aWNlDQo+Pj4+IGNhbGwgaXMgZXhwZWN0ZWQgdG8gaGFuZGxlIGFueSBEVCBkZXZpY2Us
IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGUgRFQNCj4+Pj4gZGV2aWNlIGlzDQo+Pj4+IHByb3Rl
Y3RlZCBieSBhbiBJT01NVSBvciBpZiB0aGUgSU9NTVUgaXMgZGlzYWJsZWQuDQo+Pj4+IFRoZSBm
b2xsb3dpbmcgY2FzZXMgYXJlIGNvbnNpZGVyZWQ6DQo+Pj4+DQo+Pj4+IDEuIElPTU1VIFByb3Rl
Y3RlZCBEZXZpY2UgKFN1Y2Nlc3MpDQo+Pj4+DQo+Pj4+IElmIHRoZSBkZXZpY2UgaXMgcHJvdGVj
dGVkIGJ5IHRoZSBJT01NVSBhbmQgaW9tbXVfZG9fZG9tY3RsIHJldHVybnMgMCwNCj4+Pj4gd2Ug
Y29udGludWUNCj4+Pj4gcHJvY2Vzc2luZyB0aGUgRFQgZGV2aWNlIGJ5IGNhbGxpbmcgc2NpX2Rv
X2RvbWN0bC4NCj4+Pj4NCj4+Pj4gMi4gSU9NTVUgRGlzYWJsZWQgKC1FT1BOT1RTVVBQIGZyb20g
aW9tbXVfZG9fZG9tY3RsKQ0KPj4+Pg0KPj4+PiBJZiBpb21tdV9kb19kb21jdGwgcmV0dXJucyAt
RU9QTk9UU1VQUCwgaW5kaWNhdGluZyB0aGF0IHRoZSBJT01NVSBpcw0KPj4+PiBkaXNhYmxlZCwN
Cj4+Pj4gd2Ugc3RpbGwgcHJvY2VlZCB0byBjYWxsIHNjaV9kb19kb21jdGwuDQo+Pj4gT0sgdGhp
cyBtYWtlcyBzZW5zZS4gIEkgdGhpbmsgaXQgaXMgT0sgdG8gaGF2ZSBhIHNwZWNpYWwgZXJyb3Ig
Y29kZSB0bw0KPj4+IHNheSAidGhlIElPTU1VIGlzIGRpc2FibGVkIiBidXQgSSBkb24ndCBrbm93
IGlmIGl0IGlzIGEgZ29vZCBpZGVhIHRvIHRyeQ0KPj4+IHRvIHVzZSAtRU9QTk9UU1VQUCBmb3Ig
dGhhdC4gLUVPUE5PVFNVUFAgY291bGQgbWVhbiBhIGh5cGVydmlzb3INCj4+PiBjb25maWd1cmF0
aW9uIHdpdGggZG9tY3RsIGRpc2FibGVkLCBmb3IgaW5zdGFuY2UuDQo+Pj4NCj4+PiBJdCBtaWdo
dCBiZSB3aXNlciB0byB1c2UgYSBkaWZmZXJlbnQgZXJyb3IgY29kZS4gTWF5YmUgRU5PRU5UPw0K
Pj4+DQo+PiBJIHNlZSB0aGF0IGluIHRoZSBmb2xsb3dpbmcgY29tbWl0Og0KPj4NCj4+IDcxZTYx
N2E2YjggKHVzZSBpc19pb21tdV9lbmFibGVkKCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4sIDIwMTkt
MDktMTcpDQo+Pg0KPj4gLUVOT1NZUyByZXR1cm4gY29kZSB3YXMgY2hhbmdlZCB0byAtRU9QTk9U
U1VQUCBpbiBpb21tdV9kb19kb21jdGwuDQo+Pg0KPj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2h5
IHRoaXMgd2FzIGRvbmUgZnJvbSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLg0KPiBUaGlzIGhhcyBi
ZWVuIGRpc2N1c3NlZCBtYW55IHRpbWVzIGVsc2V3aGVyZS4gTWFueSBvZiBvdXIgRU5PU1lTIHVz
ZXMgYXJlDQo+IHNpbXBseSB3cm9uZy4gRU5PU1lTIGhhcyB2ZXJ5IGxpbWl0ZWQgYXBwbGljYWJp
bGl0eTogVW5hdmFpbGFiaWxpdHkgb2YgYQ0KPiB0b3AtbGV2ZWwgaHlwZXJjYWxsIChvcmlnaW5h
bGx5OiBzeXNjYWxsKS4NCj4NCj4+IE1heWJlIHdlIHNob3VsZCBhZGQgY29tbWl0IGF1dGhvcj8N
Cj4gWW91IG1pZ2h0LCBidXQgUGF1bCBoYXNuJ3QgYmVlbiBhY3RpdmUgaW4gWGVuIGZvciBxdWl0
ZSBzb21lIHRpbWUgbm93Lg0KPg0KPiBKYW4=


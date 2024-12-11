Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF49EC4F8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 07:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853830.1267176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLGQq-0003bU-IH; Wed, 11 Dec 2024 06:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853830.1267176; Wed, 11 Dec 2024 06:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLGQq-0003ZB-Fc; Wed, 11 Dec 2024 06:42:48 +0000
Received: by outflank-mailman (input) for mailman id 853830;
 Wed, 11 Dec 2024 06:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqCb=TE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLGQo-0003Z4-KL
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 06:42:46 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2407::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 205342c6-b78b-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 07:42:44 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 06:42:40 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 06:42:40 +0000
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
X-Inumbo-ID: 205342c6-b78b-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FG89ccoHizAEj2RNBtj/9gibK/EtvsSVAXjvC/YfGix6Hs3cGAUZaRwTg1XmZ2OXzzQlWvFvdQZvoNutUMcubGWFqwah476Aqp2wHqjKVirIQjm7k4lDoZ9KTck2pCVMLy2B+xEDKqZHHOYHL57ymjzL33tWWhjlOY5AR9NYZmtGq6VyUQloBs59J1foY6/+cMmw/dRFzDSIRHATdEJugjZm6XdYmpbpQ4grXBlbkLXqYz+hn3kPr5IOZGEmFrFyIAM5UigR7eaQR6qzafR/ehrwrg08RWWCK0QxCLg/2OYzkgUsAm+QKwGsxg5DguXPmNqlZVE75O6w3Uzdnf+hXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OckdZyXq+hyEbVegF9sQo8GThKAZJ90kZa6yPpyH1yk=;
 b=xTwdeP9a39530VVj2/Lr4ldP98jiCzwlnp9R625dkKQz5xL0RuEGckNKncuEEs+XPRRw8dE0OJf6YKGWxzpqlIrRyQfhC0VWweCSqxlu5CdjlY3zo2AgxzYh+E0NG1ftf6kcHMxyMU2tsmzKl1wN2t7saXMkoyMUIhEOTiTNkncN/rHuJtNgrI51fvBZjYVDW8cwyRXJcAvH4zZudGRi0lNEsa+SOAh0WW+WoGsStyXIEdMEEp22QDAWp8LO0XyCni60wESwlG0rSn8TTBwbDs3Fk2coK7OrOGqvhuZtb31SpIYGViQEYjg1punATD/2wbUD/apapQ128tHyBpGVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OckdZyXq+hyEbVegF9sQo8GThKAZJ90kZa6yPpyH1yk=;
 b=1KlvX11dOq2xxR9Xo8FaeYqmf9iDzknV+QRJdluaJIYJWvRcFxyXdNXLLgHslvmKzLieTFbbycseSxu/XJS1A7VXNY0ROEbild74V4pzEtpY1dHvjP0OINeb2tOUyfmDaZHsDwtAKPab7VoJJfX0FhhSJ7fl/7locldIxqNZrFE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index: AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLfZMMAgAHH6IA=
Date: Wed, 11 Dec 2024 06:42:39 +0000
Message-ID:
 <BL1PR12MB5849DEFEFFBDED86941E3EDAE73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <Z1gmSPnkBz_Ob60b@macbook.local>
In-Reply-To: <Z1gmSPnkBz_Ob60b@macbook.local>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ0PR12MB8168:EE_
x-ms-office365-filtering-correlation-id: 4cca72c8-2f26-43c1-90fd-08dd19af0202
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mm01cXhodER4d0xJUndGNnB0VlNwMi9LSjRYMjhkeWxhTldTMUtjdnZGdFdW?=
 =?utf-8?B?YjVSNnZ5Qm5yb2ZtMCs3YVFaV2o0WUJSdXEyaVQrMnNudTRtVEttSlBxbmlG?=
 =?utf-8?B?WWduSWRSeVAxT2FmbXdvTElhaVdXMHdxdTk1ZlRGcENNdkcxNitmQVRaelJT?=
 =?utf-8?B?bGpwV0pjbHVRMUJCbFZLUHFqTlVHb3lNWDJNbkxlSndaeHJtcU05cGM1YnFH?=
 =?utf-8?B?RUNRd1ZrdG5XZksrVVNEYzFjNEpJVW82M0xzaXhZK2IwUENqZXhxOXdzRUJh?=
 =?utf-8?B?dklmQXRYQjJRaG1xRi90cFdwY09HT2dEL1JzNzdpL0djYTVhR1ZFSU9vc2dK?=
 =?utf-8?B?Q2orYzc4bEZEcWw1UllWTVczUzZhTkx2djRsbUFxTDNIT2NIV2JEREJ5YzVQ?=
 =?utf-8?B?Tnp2eEYwVlJOZG9YUzJRc040TUNCYmZSNkR5aXpETjZuZW8zRURBL3hPVmNn?=
 =?utf-8?B?TWhaN0VNRHJHTEpkNzh6NitGS3V6OUNKT0Y0Z3J5cElSSXdsUWtvSE5qOTNJ?=
 =?utf-8?B?a2RKSS9CS0N4NHVqdnpkZmFtb0VrNmpWTXJOUHpDM3c2YzdRcFpxM3lKQUw4?=
 =?utf-8?B?d0g4MnVJVzU2UEYvOVlZVlQ5S1lJVmhQc05RZVllYUJ2QjU1RjIvd3ZlL0JY?=
 =?utf-8?B?R3VOeHR0VjNpWldYUXFYSVN4WVpKM2JiYkc0aTZiN0RUNG1US2ptV1B4TzBB?=
 =?utf-8?B?bHdEMjV6cm9uMkZJa2FSMVdteksxNTljN0JjY3FGMzZXRW1lNW82WFlhN1BT?=
 =?utf-8?B?Q0s0NXMzWjZkZ3FSREpLQm5WSUt3UTh3MVI1b09tOUlQdExRdTRNNC9SemVk?=
 =?utf-8?B?SzFoVU9xdmRUelJ1UEhQbW9WWWxzZXlMWGxCZGdmMm9OUkxCWURxWTN6OEUx?=
 =?utf-8?B?Y0dlZmZLdWxjRkN1OEJkV21FZVVsR3F6QmxSQ0J6QmtHbC81RXE5VTlpUnB2?=
 =?utf-8?B?cHNVaTUyTXdhSnNSZGlnZkJ0REhZelJRMERRRzh5RnB6TDgzenF0MG5nbFdO?=
 =?utf-8?B?SmJlUDJsOWhpUXhpMExWdVVtK3hSRXhjNU53eFBlRUJmbk1kZksyS0d1bExr?=
 =?utf-8?B?TFdhZkg1MXpJNDIyOVdUcWJlMCtSYThxTFBxQ0N4QThNS1l6Y3pMNTlYKzlY?=
 =?utf-8?B?UFRCSFROeCtzSEU4U1BoNFJQbElUSnF1dWpvaGdzTW4za0xCaFZ6T09DWm1S?=
 =?utf-8?B?ZlVLNkpFK3FMNzZ6UWdPSGdmS3c3UllDQnF0bFNYUHJhN2xEWFRiZ1c4QmJw?=
 =?utf-8?B?Vk90NkM5MGhUaWF3RUhvR1B0SE05RUVWTFV4Tzc2VGZSc2ZpeGQ1NElYbi9a?=
 =?utf-8?B?WHc2aVo1dmg0ZlF5bk11Q3dWcUFSRVY5OERaUHBsbkFQYVhJemNJMjg3K1RT?=
 =?utf-8?B?N3FFZkVJOVhQK1JuZGlMTUJRNHBIcFN6b3pHbGpuRGhEK1hidFR4YW5ZOVI4?=
 =?utf-8?B?WTY1Nkd0OWZ1RjQvSStPSnNEeWJZR1dmbW1oSlc4aXRSRXlnK3N3b2NzeGU0?=
 =?utf-8?B?VWM0OGVnQUo3NnNnUGhiT3FJTGZXdjlkbzN5YkEwNStXNE9nNWJRSnlKbXNB?=
 =?utf-8?B?cE9EaUd4RTFIRmVMamd1YlZjczBUMGUwdGNBVTZPa21xRTRtVGdudHFjc2Ew?=
 =?utf-8?B?dFZtU0t5T0RxUFh0OTQzVThseE5EMy9CbzVGb3J4YUZsbTRlWjJQdzVLUHcr?=
 =?utf-8?B?UEovSFRpRVVwS3Fpby9kM29CdkVGKzVFY1EvRFJaVVRYdEFBVHFJS0ViNUox?=
 =?utf-8?B?NEZqMDcwTStCYTVtRm5sdG8zN09raE8zOFl6enordVY5NGVCR3V3OGdDZVB2?=
 =?utf-8?B?Yys2SzRyRTJJdC80S3k4ZnQ3SWp5dVBMM1NmWllJNWVUWDUwcW9SSHZIMGVr?=
 =?utf-8?B?TmNrRW9XVkZQeEkzWkFXU0NuM2NlMlJtYnZ3L1NFV01uRGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWdBaDF1by9tcjhXUVpSMFpVQ2ZtR0VmU2tRaUxmWFY5RnpNOXMwTW5QRy9s?=
 =?utf-8?B?RTJyOUxiRGQ4U1o1QmhCQVBYYWJLenlzbEFmOE5XQ1RIenpEWWhNQ2hvNUNo?=
 =?utf-8?B?YWFTcWhwUUFGOENQbVB1czl4VHNobG9aQTkrMmMzUTFXWDdwQlBRSU1xYW1r?=
 =?utf-8?B?Y2wzcWFwL0l6TWFqZzdUdWc1MVh3Wnh6Ky83UHQvY0s3dDFFc1ZGS2d1QlJt?=
 =?utf-8?B?SWZScC85TzZseVpVZm1uZExQWTVVeVkvaml3cm9Qa0lKd1pEemxpMHZac2Q0?=
 =?utf-8?B?djAzeDdnTTJ3ekMzQldIM1hpaWlVUzR4Y1MwN2Rmb3JGdkF2aGFHRzVjdUwy?=
 =?utf-8?B?VWdQTU9lYXQvc2s4QzRLb3VpM2FYQzVOd1VST05vakJyZlF6a1c4eEdLYlpM?=
 =?utf-8?B?UjRwbEd6T084bzRNeEprZlY1aS95VjV5L3ZwUngyMWxOSEFWSTRMbWR3cjZK?=
 =?utf-8?B?d3c2NjhhaTIwbmVhUGdsTmd0eW1XKzFOMGhTS1hrTFIxcmd5S3FTOThsQnJl?=
 =?utf-8?B?aG8vdWZCdkc4Z2ZDT3NOSFNGV0hHREhqL0xqbTNPS0Qrc1IvcUJBZDF4dDMr?=
 =?utf-8?B?ZVh2b3NkK3N2dkFGdEJLVU41eTlRSU5HT2ttazZENFgrZHppMzVIMFNoS3dB?=
 =?utf-8?B?cmFRSTVxbEhwdjBWRnlEc2N3eVB6ZkhVQ25tcXp2M05qdWpJZVhjVGpnRFZ5?=
 =?utf-8?B?Yk5wYnR4YzhBOUV1MnI5bjNyNFhaSHgzRTFpb2txSGNsTmpoRTZuMkdHSGk1?=
 =?utf-8?B?ejJoZkpNbXpFcmY0Z1NFcHBUaE8xYndTb3NSOEsrVzAvbW5hcFlwM1luV1lC?=
 =?utf-8?B?NjhyYkpxUnVac3UzMlZ0NG9HUGp1Tm55eTBDeWtYSFAvYTcvZWhhbWRXamxV?=
 =?utf-8?B?dmgzVC9lbkdmeGw3Mi8vN2lzNUI5Sm1OSGdOMmV3VFNObW9PY2VRUVJmUEZJ?=
 =?utf-8?B?aThFVXBiRzl2UlZpaWo2clVUTXo4VTUxa1ZOMlVOWGk5RmNkRHliSkdTdGJH?=
 =?utf-8?B?OVFDeHV2aGNRNmNJUmROVDcyTFBqSDdMQXpXSzkzS01iYzdZckpYSThxTGpW?=
 =?utf-8?B?SXZJdGRkemM4NFZ6dVdHSitwdGxZN1dJVnhDWXU0ZGNNUnMybGlkTjhPVkhn?=
 =?utf-8?B?WEp2RWY3VUJ4aURYY1l1SVl6bnVwcWJIMmFObEl6bmlpaHBKZVJFYVV3U0d0?=
 =?utf-8?B?M3crakRZTmxjUGdySkQ0ZlJxWGdTZzNOc1A2TFpyTDJvaC8vY0p2azQvdDJm?=
 =?utf-8?B?MmZ5TGhMWUpMNmlWb1duUDg2bFJPMjAzdjM5V3MwVEZJOWc5QWNtck9wWktQ?=
 =?utf-8?B?RnNVQmRreUZCaWpnZDFXT0Y1TnY1Tkp6NzlmcUgzdzgyYnoreUZVcm90em91?=
 =?utf-8?B?L1I4QWJyUEpXUVFjdlJPY2dZK2FyUzF3OXpGbXpKMXZ0S3ZZMUpvb1BOREww?=
 =?utf-8?B?S1dzY090bGRtdEFpbW5icXdBbnBHYi9lMnlEcm9CMHdQWmhNUWNyckVyZCtJ?=
 =?utf-8?B?OUU2OEUyclZhbFpKMnllVkdEcHZjd3VHeTZGb0IxS1VWSFNpdFplZThQajQ0?=
 =?utf-8?B?ZEZ6T05ra2l3QkVKUHNKSWVTSG1JUWh2RWJWRHhQVlNOVm9PcHl3T242L1RI?=
 =?utf-8?B?U0VmOW5JWi8yYWhXbGkyVldlVE4zcXlYOUJPMUJUNUhwclBZWUdhZzcxNm83?=
 =?utf-8?B?dDRBa2dpUnlRN3g5bGltZnpZVHhiWWlMSnpqQWtNSUY1NUx0Rkt4QUpocVNq?=
 =?utf-8?B?MS9MQU04V28vZjlIcHBqM3FQeFpDeFZKMUN5RVNLWlcyOUFMV0pvN2V5bUw5?=
 =?utf-8?B?amRIc3hJMndqbjJYRURtRUJESkUzTElwamlkVGZlc240b0c5SUJ5QVZNKzBW?=
 =?utf-8?B?eGNhd1VpdUdTTWVva0tpVFFTWXcwOUUrZkZSSDhLaGdzTmhsbTRBeUdTdFc3?=
 =?utf-8?B?Q1kvcmRuRVVOT3E2Y0poek51NmFGMHQ4TDdFNXY5QVZ5ZElQWml6MHc1M3Uy?=
 =?utf-8?B?SGUrSTN1OE9DTVk3R2JtdnNyTVdXRnFmYVN0cEFFZFdnZkQ0bFFtamQxQzNm?=
 =?utf-8?B?aXUzVjc3WHA1QmNIZkMrSU9zZVl3R3JlMStmajcyN0NUUmFBcWV3cEMwWDRC?=
 =?utf-8?Q?QSqE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F275B0AC93771D4F85B70E7D1E4F9C26@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cca72c8-2f26-43c1-90fd-08dd19af0202
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 06:42:39.9549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/Yqlx47vKunR0Evyox28ZEepPWALWFpqqZ+2KcDi0eO2UZgu5fjA/5nVv0OqCcifbBdjrh8d93CNvR5DeYG5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168

T24gMjAyNC8xMi8xMCAxOTozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBE
ZWMgMDIsIDIwMjQgYXQgMDI6MDk6NTZQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBT
b21lIGRldmljZXMsIGxpa2UgZGlzY3JldGUgR1BVIG9mIGFtZCwgc3VwcG9ydCByZXNpemFibGUg
YmFyDQo+PiBjYXBhYmlsaXR5LCBidXQgdnBjaSBvZiBYZW4gZG9lc24ndCBzdXBwb3J0IHRoaXMg
ZmVhdHVyZSwgc28NCj4+IHRoZXkgZmFpbCB0byByZXNpemUgYmFycyBhbmQgdGhlbiBjYXVzZSBw
cm9iaW5nIGZhaWx1cmUuDQo+Pg0KPj4gQWNjb3JkaW5nIHRvIFBDSWUgc3BlYywgZWFjaCBiYXIg
dGhhdCBzdXBwb3J0cyByZXNpemluZyBoYXMNCj4+IHR3byByZWdpc3RlcnMsIFBDSV9SRUJBUl9D
QVAgYW5kIFBDSV9SRUJBUl9DVFJMLiBTbywgYWRkDQo+PiBoYW5kbGVycyBmb3IgdGhlbSB0byBz
dXBwb3J0IHJlc2l6aW5nIHRoZSBzaXplIG9mIEJBUnMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+PiAtLS0NCj4+IEhpIGFsbCwNCj4+
DQo+PiB2Mi0+djEgY2hhbmdlczoNCj4+ICpJbiByZWJhcl9jdHJsX3dyaXRlLCB0byBjaGVjayBp
ZiBtZW1vcnkgZGVjb2RpbmcgaXMgZW5hYmxlZCwgYW5kIGFkZGVkDQo+PiBzb21lIGNoZWNrcyBm
b3IgdGhlIHR5cGUgb2YgQmFyLg0KPj4gKkFkZGVkIHZwY2lfaHdfd3JpdGUzMiB0byBoYW5kbGUg
UENJX1JFQkFSX0NBUCdzIHdyaXRlLCBzaW5jZSB0aGVyZSBpcw0KPj4gbm8gd3JpdGUgbGltaXRh
dGlvbiBvZiBkb20wLg0KPj4gKkFuZCBoYXMgbWFueSBvdGhlciBtaW5vciBtb2RpZmljYXRpb25z
IGFzIHdlbGwuDQo+Pg0KPj4gQmVzdCByZWdhcmRzLA0KPj4gSmlxaWFuIENoZW4uDQo+PiAtLS0N
Cj4+ICB4ZW4vZHJpdmVycy92cGNpL01ha2VmaWxlICB8ICAyICstDQo+PiAgeGVuL2RyaXZlcnMv
dnBjaS9yZWJhci5jICAgfCA5MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgIHwgIDYgKysrDQo+PiAgeGVuL2luY2x1
ZGUveGVuL3BjaV9yZWdzLmggfCAxMSArKysrKw0KPj4gIHhlbi9pbmNsdWRlL3hlbi92cGNpLmgg
ICAgIHwgIDIgKw0KPj4gIDUgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZlcnMvdnBjaS9yZWJhci5j
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvTWFrZWZpbGUgYi94ZW4vZHJp
dmVycy92cGNpL01ha2VmaWxlDQo+PiBpbmRleCAxYTE0MTNiOTNlNzYuLmE3YzhhMzBhODk1NiAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvTWFrZWZpbGUNCj4+ICsrKyBiL3hlbi9k
cml2ZXJzL3ZwY2kvTWFrZWZpbGUNCj4+IEBAIC0xLDIgKzEsMiBAQA0KPj4gLW9iai15ICs9IHZw
Y2kubyBoZWFkZXIubw0KPj4gK29iai15ICs9IHZwY2kubyBoZWFkZXIubyByZWJhci5vDQo+PiAg
b2JqLSQoQ09ORklHX0hBU19QQ0lfTVNJKSArPSBtc2kubyBtc2l4Lm8NCj4+IGRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMgYi94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMNCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjE1NmU4ZDMzNzQy
Ng0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9yZWJhci5jDQo+
PiBAQCAtMCwwICsxLDkzIEBADQo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb3ItbGF0ZXIgKi8NCj4+ICsvKg0KPj4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBBZHZhbmNl
ZCBNaWNybyBEZXZpY2VzLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuDQo+PiArICoNCj4+ICsg
KiBBdXRob3I6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gKyAqLw0KPj4g
Kw0KPj4gKyNpbmNsdWRlIDx4ZW4vaHlwZXJjYWxsLmg+DQo+PiArI2luY2x1ZGUgPHhlbi92cGNp
Lmg+DQo+PiArDQo+PiArc3RhdGljIHZvaWQgY2ZfY2hlY2sgcmViYXJfY3RybF93cml0ZShjb25z
dCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCByZWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsgICAgdWludDY0X3Qgc2l6ZTsN
Cj4+ICsgICAgdW5zaWduZWQgaW50IGluZGV4Ow0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJh
cnMgPSBkYXRhOw0KPj4gKw0KPj4gKyAgICBpZiAoIHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRm
LCBQQ0lfQ09NTUFORCkgJiBQQ0lfQ09NTUFORF9NRU1PUlkgKQ0KPj4gKyAgICAgICAgcmV0dXJu
Ow0KPj4gKw0KPj4gKyAgICBpbmRleCA9IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCByZWcp
ICYgUENJX1JFQkFSX0NUUkxfQkFSX0lEWDsNCj4+ICsgICAgaWYgKCBpbmRleCA+PSBQQ0lfSEVB
REVSX05PUk1BTF9OUl9CQVJTICkNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsNCj4+ICsgICAg
aWYgKCBiYXJzW2luZGV4XS50eXBlICE9IFZQQ0lfQkFSX01FTTY0X0xPICYmDQo+PiArICAgICAg
ICAgYmFyc1tpbmRleF0udHlwZSAhPSBWUENJX0JBUl9NRU0zMiApDQo+PiArICAgICAgICByZXR1
cm47DQo+IA0KPiBGb3IgdGhvc2UgZWFybHkgcmV0dXJucyB0aGF0IGRvbid0IHByb3BhZ2F0ZSB0
aGUgd3JpdGUgdG8gdGhlDQo+IHJlZ2lzdGVyLCB3ZSBuZWVkIHRvIGxvZyBhIG1lc3NhZ2UgdG8g
bm90aWNlIHRoZSB3cml0ZSBoYXMgYmVlbg0KPiBkcm9wcGVkLCBvdGhlcndpc2UgdGhlcmUncyBu
byB3YXkgdG8gaWRlbnRpZnkgc3VjaCBjYXNlcy4NCldpbGwgYWRkIHNvbWUgd2FybmluZyBsb2dz
IGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==


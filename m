Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F321A899AA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952541.1347961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dN7-0006oQ-N1; Tue, 15 Apr 2025 10:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952541.1347961; Tue, 15 Apr 2025 10:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dN7-0006lx-K2; Tue, 15 Apr 2025 10:18:29 +0000
Received: by outflank-mailman (input) for mailman id 952541;
 Tue, 15 Apr 2025 10:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QN48=XB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u4dN6-0006QM-CH
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:18:28 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2009::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f502d85f-19e2-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 12:18:22 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 10:18:14 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 10:18:13 +0000
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
X-Inumbo-ID: f502d85f-19e2-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZe3WBu596uuiNest2dlWUBctcmcVR8z0WraQgiMDmKAMGNXqxeHgzq41EvL0YZMigoePJyjkqwLnkHU4mMo1lKhy4YPPrZuqIMnWHBlyWXb6nNnsiszogCFoO047Llsn7ziKboZPYkXEC/jfRWRSgOWDEVLkrBBZ5qeFc+U2Rd67iJMU7qQc/ft4eKbCOM5euKSeaFMs+usc3U0A7vDwTWPQ8cZ7nK3pMkQMc5pu5ebTbJqnDq81kZJ2THJ4YMWjxPYqehtsuX1wnZwYw7QAwrwXC2tjy0EZJjuOB+ILygCfhgKsINsbO2rC4mU1QOYtczImDGmeNMsIuJXWGOKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6hJg+3qnJdwjTZv/XR2qzAqDEM7dahl/c/NPI0Ac5w=;
 b=KDbInL8moOmQQzUQ/R7GrfLK4vuU/UTxLZ/+nZQknVTdxsU+1Kz0anJr65tlCWyOzLk7wub2uUbI/IhOqBNdtWsEUdo6Wqsjj1hsFTFN1v0maMfln6PAmzEi9A+6Bdxmav+fR2z5gqOw9JGyPGe/E+7X/xcwxpXIvdGiDpg+UInPy/b7vmMQbh3eVdo7wfGWIuYitbBbTtdGZxEvYp4v+w4KlKe/tqC8fflmkijqFpcQ6ehIbM6ZqCCW0y0SArRPuDRuCJnxlEuhifKqC/pp6Xmpr/4UIBx7WTtb1CLROyvDPLngiAbbyfRZPeVPwBRlV9oMW2j8KnLh5cTTH2Fq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6hJg+3qnJdwjTZv/XR2qzAqDEM7dahl/c/NPI0Ac5w=;
 b=G+WZ8QjooHVL4C70Blhg/rVc4RyheUITCFYOqXekYC4EG2epQuP4X04IfhT8J5l938jrmZQ8HLPizY65/WUcuiKOAWoX5j6p0BtZSSIC3OCH/KDSIpjj3/4SFlXY3KSIfUhWwTpHCDGwRp+97glawBuVPI+CNGqkQdp4NIXA8/4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 3/8] vpci/header: Emulate extended capability list for
 host
Thread-Topic: [PATCH v2 3/8] vpci/header: Emulate extended capability list for
 host
Thread-Index: AQHbqRsbo3LVuEnuFEu9nspfZtmL8rOkhQ8AgACNiwA=
Date: Tue, 15 Apr 2025 10:18:13 +0000
Message-ID:
 <PH7PR12MB5854D4F8AB6F4E56E67DE757E7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-4-Jiqian.Chen@amd.com>
 <dd4dd741-b063-4619-a893-a9c02c0ca791@suse.com>
In-Reply-To: <dd4dd741-b063-4619-a893-a9c02c0ca791@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8632.030)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|CH3PR12MB8332:EE_
x-ms-office365-filtering-correlation-id: eb40a5f0-decb-4696-8a4b-08dd7c06d4da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UUhtZ0pCaHhKaEZyM1pWN0NLV1VOdlczRG1lTHhhOXN5Qy9lajVZY2I2a0Nz?=
 =?utf-8?B?d1hPelkrN01qZ1F3aThyRkppVi9VK255czAwWWozcHl2a0EvTm9HdWpxOHlt?=
 =?utf-8?B?S2hsd3RBUG5Xd3A1MDZwYVBSaE95UERZVjdpNEV2UDYrdkVpV3ZmNVZ0MjNt?=
 =?utf-8?B?TnhaRjhGdWpKd0pIRUNSMkdRV1dHRThrZjZQdFc4NWFVTHhJdHZqU2I0LzRY?=
 =?utf-8?B?WU9xNzJURVMxdkt5UXpJMHlhMDloTWVZRVJsb1ZQK25FUDF4MEVDUFEwZFEv?=
 =?utf-8?B?WGw3UURiWnFMb1drV1RVaXVlRTlNT2tVbEx3RjhaczIzWHRSVXdKS2J3NG0w?=
 =?utf-8?B?VzRKelROVExjS2psZVdxcVBiejVvZ1J4UzZLR3N5eVQrTWFVenJ6aWRiZmtC?=
 =?utf-8?B?V21scHBsOHJ3OGJNV0U4NWt1MU5OM3VEV2wva3lUb0VrL25pempHYS85VU9J?=
 =?utf-8?B?MmZzUnlxYmlxdVl5djM1MDJPWm5FclpVOEYvenpUMGFJMVpTVnZ2T2x6Qjdm?=
 =?utf-8?B?KzJ0dXQwdW8zdFl5NDA4YXh0Q2xsdTNNM1pndzVwMlc5UnNoa3l4Mlo5U2dI?=
 =?utf-8?B?WlRxTmFvUVQ5cXhsdE1UdVdVcDV5ZERNZEhVVlVQOEppZDB2OU45NW85c2o5?=
 =?utf-8?B?dG42UlRRbzRzZnY0a1NiNkNXNjJRbDMxTGJOUGJBYzJTcTI5OFRlWUxGSkxa?=
 =?utf-8?B?YmhzdW5rUEdwMlcxWHQ3dDJqS2JoV3ZVRmJJK2NRTjdTTyt1YThqZmg3YmpS?=
 =?utf-8?B?c0VFdjBqSGFXbm4yS3N6OXVhSWp0SW1OZC9GTVhQSHFVaEJhNWxzUitTaVFE?=
 =?utf-8?B?bUJ3OWtuVzl3bnJoNnBrbk1pcHV6WGxDbG1sbERIMitBVThyNnFrcGJxK3o1?=
 =?utf-8?B?d3lVaityR2M5ZGE1QWtKSkZ2ckQzQ0krQzZobUtneCtvWlF1Qjl5SXNPazNt?=
 =?utf-8?B?cVNWTVdFNFgycER4Y0V4YmdoNUk0cjkzbVpjZldwZjVNWWNhODdyS25VNHg1?=
 =?utf-8?B?WlNzeHFna001Yy9Gem1CWCt3R3p0SVZaTCtoV20xOGZLMEcxSDE2VTVjb3hT?=
 =?utf-8?B?RUZQWCtHZWFoU2FwNTkzVjFDZ1NOQVN0MGxNVE10ME9FMmlrRjIzeGZmeFFQ?=
 =?utf-8?B?ZUdtc2pBWmVab3NGemhlcTFtMndkQXZYcG5KaG9UNnkvSXJ5VG5lVkNvcUo1?=
 =?utf-8?B?dHZzanlJQ0xxN0lvem9ZMk9qa2lsZ283VDh3YmRKc25BaFNlNHV3T2lVSTh4?=
 =?utf-8?B?OFhPWmwzbGVCZUt3NWZDWE9TaHpFU0QvMVdOQVN0RmRsUTRTNmVLQWV1NUw3?=
 =?utf-8?B?dTZteHVMNmJkOUkzbEQ3V3pvT2pINXV3Q0hSeEc2dXZVMkMzTjNZdGNxSGYy?=
 =?utf-8?B?TE1hUm5hUzdBQXZpVXJkRlRPWkl4Tk9PVThZbXVtS3pzdmJBOUNNREx6S29N?=
 =?utf-8?B?MVo0czIzOEV6UXQzWmwyT3FjQlEzZjAvTmNyMUVtVFBva2UxcFRac296ZGNS?=
 =?utf-8?B?V1lMZ3plMzZjdTBZdHdqNlJ3TWlnblZ5VHR0dk9uWEVEU0Z0VUVUWXRKQW1T?=
 =?utf-8?B?MFZyVXRicUZRc0VSeFNjM1FxaW5wdTZrVEdmSTVENjZzTzF4eFdodjh2SDE1?=
 =?utf-8?B?MzdFbWFmcnBDLzlLQmNKamFOeExyc1FXSHgzcEw0ckVlK0cwSmVXWE9VWEY0?=
 =?utf-8?B?Nk5WbUJHRUlOSFA0djhvWk4xQXlZWm4yQ3NtZkZYYUQ4alA5YlhCK2x2V0pG?=
 =?utf-8?B?aVNINnQxclhiSk8veHIwdy93ZVROVXB5WWdHN0JOY05PYmx0L01HdW9zNmFR?=
 =?utf-8?B?SERZZFFybXRLODBobUpsZWxGZGw4LzU0OWhxQkcvSC9xMWRSdkZaUXoyUEk0?=
 =?utf-8?B?eWNyY0lFVXdockZQMFR4OG9zL0NGRDJIYkhqMTF2NldUK3lmNDhadVlGNnFk?=
 =?utf-8?B?aDNwU1VmcERBZGVTQXZsQ3dhN015RDZocXkycm5oYi9NNTlyd2Z5bS9OZW41?=
 =?utf-8?Q?xAB8S37eNIhdlG3k9hm75LMuTKQN4M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0FHNTBSOXhxcm1yUzZQZEFUOWl0M2dWT3F1TEl4YWt3N2p3Vy94ZFVTWFgr?=
 =?utf-8?B?aXBUMVIzMFBPcDYwUVNBa2krak1GRXJVZmVybVNGZDlscFZJN3J4Um55QnJv?=
 =?utf-8?B?MDVSdEJ3cVYzczBnU2RjZ2ppbWN0d0h6VDJtZy9xTldjcXRXQmdjKzFHdmww?=
 =?utf-8?B?b01BTzdKaTZzTlc3ZWpCTkYzZW1uak54SmcyemhmNlh5WVlqajVUSllzeWpy?=
 =?utf-8?B?MDJ5SDFMY3pIekg0bVJ0NThhdDNGTEgwQjJTOGZobm9BVWlLRFord3JvalhK?=
 =?utf-8?B?OHp2ek1Mbkt6aEZjd09acjUrUWozSENHVlNhZEhha2taR01jNHEyWjJ6Q2VE?=
 =?utf-8?B?c3hNRHRYL01XekFKM3JZTU9PeE1seEJFVmxqMjB0YWlLVk04Q0RnQlF3Rndt?=
 =?utf-8?B?Y1NIZTkweFF3OE5JWnhIUnNtZGJ0czZjRldqQVhacVBnbFYyVkZUbUpyUHNI?=
 =?utf-8?B?WUV1STV5dmg3ZFQxajIraVU1UnZWei9VWDNObHA0ODdjV2cxRllPMVhxUXNV?=
 =?utf-8?B?WDhIeTBKN0ZmV0VSTFMxLyt2bFhVdnBURWJPOXF1WWJjOVFtM3M5dENFYXIz?=
 =?utf-8?B?YW1rWWpPZHdnWmRQeWRyT1NCVm5tdmJMSUJDZkd4ekJiZUtPYUcrL25aalR2?=
 =?utf-8?B?SzlFYlVyS0FCbjUwd2NZZXV1N2VxY0JqZXozT3JGV2UwMmFoUHNiY2JwZWo5?=
 =?utf-8?B?a2NlalZKREZEMDhaYXhnUVlDbmZJakw4Tzkzbmc4aUhyUHB6ekZ3YnBjL0Za?=
 =?utf-8?B?ZVRuNHViUlBwVDVMQ0drMlAzVjU1V1VqOXZjdmlYS29LZXp5R0djTUpxSUVq?=
 =?utf-8?B?b3VkcHVxUi9RNlVnOGkxODd4TDBNSzRkNUk5UnpGb3kwUWZrcnF1WUhKVTMy?=
 =?utf-8?B?bmxWU04rZ3VleEQ4OGxXMWdzODNMZnV6ck02U24wQkp3ZHVLMG5ZZ1BISVAy?=
 =?utf-8?B?eFRkSE95UjJObXBtVjJvZC9kSmdnMkZQOWhPd1hXdW9XMmYxRk5DQS80TDVo?=
 =?utf-8?B?MUdCZjlDb20rRDlMSHhWZHVrMGd1Sk1nd0dzeng3eXFtMUlVOUVXaTNyWndq?=
 =?utf-8?B?cnFTWWdMSHVVSVg4dE5tSFpEbDVlTXhheUUwd3MxOXlQbHhTWVlBRW1HOE1F?=
 =?utf-8?B?VnlWeHVrazJHSlJLekxQdFJVQlRLQWRMS25TRUFSSG91R3BUV2J0YXBRbkZt?=
 =?utf-8?B?QTV6aEFaN1U2dkRKSmUvcHdoS2dVNVRIQVVFQ3J3SGx5TmRnNmVHZjNxQ2Ro?=
 =?utf-8?B?Mmd3bU15OENTTlBwSUxBU0hYM05KMi9BbVJzOWE3Rm8xWStnODkwSmFZTGNm?=
 =?utf-8?B?eGpoR2Foc0pLZ3RCcFNjTW42b3FsdzhhYncrcHdyL2xZWFZiL1dyOWJOOTBE?=
 =?utf-8?B?NTZIUHV2cW1mUXp2VTNYdExqQlNXQ0pUMTNpTHRCbEIvSkg5a1dhQnI1THU5?=
 =?utf-8?B?cXZ5YktoUE5lUk1RMGFsVTFwZldrWUEwQ1ZZcEp5TVJOblFNL3Q2WktKWjdE?=
 =?utf-8?B?NkwyWlFWODYzVXJtTC9lOTYvbGdKc0VEVWh5WW8wTVl3MDdrMDVEMkJBdVlV?=
 =?utf-8?B?aks3V3dkdWZFZEwzdzJDVUh2L2tOU2hxQ1VFL0w0S21zK0R2UUgyMEZ4WWdP?=
 =?utf-8?B?Y2gwU3pnK3RuU3M2RmY1eHlMSFEraVRKUjd1NFdScC9rSDNQT1VUei9iRXRa?=
 =?utf-8?B?MGwwTnB6VG9KUHEvVjJWN0dGOGZrNzRWY1NTc2ZvNTZ4b3lHTG12RWVTbVB3?=
 =?utf-8?B?YkM2Vll2dkl0c2FQZndydzZvL3hiOGI2bU5oSUNXK2tKZ2pHemFaMVpLZDFE?=
 =?utf-8?B?cy9qTzRkTlVaU3hYM3J0eVhnV2M2bS90MnZQNUVyZ1BxWWg0c28wRldjeWdu?=
 =?utf-8?B?emZyZEVoUFlnSml2SzR2dHY2c3lVbExLYjRCYzg0UWFMZkFTK0JiNTVOYVlF?=
 =?utf-8?B?Ym5yQ1ltNW1rM2lZRTB4Qm1Ba3MzTkJid2huYW05ZGd5eFJudlN4TmZ3OUJi?=
 =?utf-8?B?V0FCTGlyS284dDliQmtOQmcxYXUvMXJZVGxEeXZ2ckpMc3Y4MktmV3BGWng3?=
 =?utf-8?B?dFVhWWxWZ2lxMWpqWHVDQjk4cmh3OERCYXFxWHFoRmFWWUNwNW1OUGlaODRn?=
 =?utf-8?Q?mYRA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A712916451C14C42BB555A56429835AA@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb40a5f0-decb-4696-8a4b-08dd7c06d4da
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 10:18:13.8716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RqnV5NQi2Usn7/AmIc8kVBZiKbEyl2++1Lp+9gjKyodbEGBpxF9Y9XJPmisWoz8OUsDCCiFfHwlrDRlq58lFzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332

T24gMjAyNS80LzE1IDE3OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDQuMjAyNSAw
ODo0NSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRl
ci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBAQCAtODE1LDYgKzgx
NSwzOSBAQCBzdGF0aWMgaW50IHZwY2lfaW5pdF9jYXBhYmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpDQo+PiAgICAgIHJldHVybiByYzsNCj4+ICB9DQo+PiAgDQo+PiArc3RhdGljIGlu
dCB2cGNpX2luaXRfZXh0X2NhcGFiaWxpdHlfbGlzdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+
ICt7DQo+PiArICAgIGludCByYzsNCj4+ICsgICAgdTMyIGhlYWRlcjsNCj4+ICsgICAgdW5zaWdu
ZWQgaW50IHBvcyA9IDB4MTAwVSwgdHRsID0gNDgwOw0KPj4gKw0KPj4gKyAgICBpZiAoICFpc19o
YXJkd2FyZV9kb21haW4ocGRldi0+ZG9tYWluKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIC8q
IEV4dGVuZGVkIGNhcGFiaWxpdGllcyByZWFkIGFzIHplcm8sIHdyaXRlIGlnbm9yZSAqLw0KPj4g
KyAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFs
LCBOVUxMLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MsIDQsICh2b2lk
ICopMCk7DQo+PiArICAgICAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gcmM7
DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgd2hpbGUgKCBwb3MgJiYgdHRsLS0gKQ0KPj4gKyAg
ICB7DQo+PiArICAgICAgICBoZWFkZXIgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcG9z
KTsNCj4+ICsNCj4+ICsgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwg
dnBjaV9yZWFkX3ZhbCwgTlVMTCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cG9zLCA0LCAodm9pZCAqKSh1aW50cHRyX3QpaGVhZGVyKTsNCj4+ICsgICAgICAgIGlmICggcmMg
KQ0KPj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggKGhl
YWRlciA9PSAwKSB8fCAoaGVhZGVyID09IC0xKSApDQo+PiArICAgICAgICAgICAgcmV0dXJuIDA7
DQo+IA0KPiBJIHJlYWxpemUgcGNpX2ZpbmRfbmV4dF9leHRfY2FwYWJpbGl0eSgpIGFsc28gaGFz
IHN1Y2ggYSBjaGVjaywgYnV0IGV2ZW4NCj4gdGhlcmUgaXQncyBub3QgcmVhbGx5IGNsZWFyIHRv
IG1lIHdoeSBjb21wYXJlIG5vdCBvbmx5IGFnYWluc3QgMCwgYnV0IGFsc28NCj4gYWdhaW4gLTEg
KGFrYSB+MCkuDQpUaGFuayB5b3UgZm9yIHJhaXNpbmcgdGhpcyBxdWVzdGlvbi4NCldoZW4gSSBj
b2RlZCB0aGlzIHBhcnQsIEkgYWxzbyBoYWQgdGhpcyBjb25mdXNlIHNpbmNlIHBjaV9maW5kX25l
eHRfZXh0X2NhcGFiaWxpdHkoKSBoYXMgdGhpcyBjaGVjaywNCnNvIEkgY2hvc2UgdG8ga2VlcCB0
aGUgc2FtZSBjaGVjay4NCkRvIHlvdSB0aGluayBJIG5lZWQgdG8gcmVtb3ZlIHRoaXMgLTEgY2hl
Y2s/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K


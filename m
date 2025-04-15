Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B251A89991
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952519.1347941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dGZ-0005m6-Ni; Tue, 15 Apr 2025 10:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952519.1347941; Tue, 15 Apr 2025 10:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dGZ-0005j1-Jn; Tue, 15 Apr 2025 10:11:43 +0000
Received: by outflank-mailman (input) for mailman id 952519;
 Tue, 15 Apr 2025 10:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QN48=XB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u4dGX-0005it-ST
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:11:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0571aad1-19e2-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:11:40 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by DS7PR12MB8083.namprd12.prod.outlook.com (2603:10b6:8:e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 10:11:34 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 10:11:34 +0000
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
X-Inumbo-ID: 0571aad1-19e2-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqpN6pTWJqfMcRLIKrQG6VioiZiezGDd+nEQak+Q7sco80KuDNq56viiVZmOWDO7VpV3GqqHFeOoXtcKkH7bK690Fg4FWPOKyaKup6qnCUNyWM7gO9bpXuMBwDsdSgtyvcs/rufO6w4Ae4CwTuQRWsvDHQvvr3vbxydkfNowzQPRJUHKJ9oMOcYqliDpDuY8NO2a0HMzphr3gu/BCy2xvl59wpng40Y/GFsPhO+FfmTwAfuqoZzGI2EZVx1/FB6nZqaZcZ7ZAd4+PGcgkiRhc7Puz16ehs9Eqx6akE/ib5uHZnlX6Yu76Fdkms9+q+uFkAi/icbETPv6BVTGhEVrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4bC8xlr8ORFdCzjUXiyhyV6v1K44E4uc7nRO0M+M3g=;
 b=tdjCK8F/FUxLYrEkQ8z8kYFOefcon2fJDeKT0YxGhP1rbaclVcCDuU3rEXBP3yRMMK8Ftgfzg6/Ovkvy3UFPWSpFPWXJVeLwnnDz40XbZMpDVQdzwHzzVPfYpoGz/26zSCDnpAFQuAbA8hkL6W+3dUebj3SbUhKBkJLlf2SrgxJWnFvDFv6J0zq1Jao2JvgWgdWgEOIS8uqpJQH5tNq4UpmIUbIbE8VlskxQGyd0pv/pW1uQlpEIl+eb3Ht65IjbCtTyTgIiQO2gtaG4jPN3hChSNCLxDR8PW7RopbbFvH0I7BDcWaWXCf7SXeosln+yHBJItyOXDqpykm9TpiCi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4bC8xlr8ORFdCzjUXiyhyV6v1K44E4uc7nRO0M+M3g=;
 b=Rpn08KQ12uIL5lYG/4XtzAd0XX9tFms8iyhpExoCs7qSXg829v5ixQWm7meI3hwxQRmIriCBHUAqfF/oC28VL/B9rd8ZM7fvSpwi0QUmpCgyytyGNh8Y929ShcP2DNAXt2LrA4r6SPK/8xR3H3ROVP5K26fm4sMqhKnu0HYu2yg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 3/8] vpci/header: Emulate extended capability list for
 host
Thread-Topic: [PATCH v2 3/8] vpci/header: Emulate extended capability list for
 host
Thread-Index: AQHbqRsbo3LVuEnuFEu9nspfZtmL8rOkgzIAgACNGIA=
Date: Tue, 15 Apr 2025 10:11:34 +0000
Message-ID:
 <PH7PR12MB5854861A59ACA2E132EA5DF4E7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-4-Jiqian.Chen@amd.com> <Z_4qBjte-STlLIum@macbook.lan>
In-Reply-To: <Z_4qBjte-STlLIum@macbook.lan>
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
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|DS7PR12MB8083:EE_
x-ms-office365-filtering-correlation-id: 886df4f8-3b23-4822-a701-08dd7c05e6fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OEd1ZGFheUI4Yis0clN1Y09aUjZJeS8ySnhaaXpReWdZZ0pvU0VpaEQ5Qmxt?=
 =?utf-8?B?azZCMkY4YldaSnVKcUFTMWw5bXQyOHRmaHBxa04xcndYYlpTLzVFL2JWWmxk?=
 =?utf-8?B?Y3JLQ3c2eGpPeTZITkNHMTFrRTFpR0JtRlZncVREQkp0ZFBkUkhXeTN3Mmwz?=
 =?utf-8?B?MXd0NHN5THI0NTRPRzNmQ1BJVUFEaWZyUHZIZEQ4VXF3cXdHTUtKZU5xRU0x?=
 =?utf-8?B?L0lhTitQOUdQZEVtYzhOaXRjMTlIRkViVWRDTWthVWFYY0J1VlZNWFAraFpD?=
 =?utf-8?B?bng4TlQvODNwRklqRWMzK3NrU1Zna3Ivcm9NR2I0czhQZGdWZDUwc013d0R6?=
 =?utf-8?B?aEpTVFF5T0JRY2ZWbjN6U0d4VjlPVWpJUkt2Rm8xdFVQV0RjNzN5NGRiQlZD?=
 =?utf-8?B?L0h5Mm1rOXZFRGJGaU1qbitwaFZwcDlMMGNSMEdQSXpBT0lxV0k1VmtXYkwv?=
 =?utf-8?B?QVNROXdyYmh6TURMNnlxVk9kS0ozWUowSUNBZUx2TXVtbHRSdXFKSVdQYVNF?=
 =?utf-8?B?c0lBYlY1S25XL0VrMmErMkxtTUpEaW4xMzUrbGtta1lyTVl5cU1NQ3BucHpY?=
 =?utf-8?B?U1V2ZDJpMVlxQ3puVzRKeXNQVHArbWtzeVE1VHBpejltOWtCN1o3NGh6TXZP?=
 =?utf-8?B?bFZoZkJ3L1daNkptamJRcHVVc3EzenY3R1RvWERLNTFRZGEvcDl5aFo3VXdY?=
 =?utf-8?B?RFN6dEQwemUzTDhGZ2c1dnV5dENiNFM3MHBoVmFSOUpjUHVqc3FTL3RQMmw2?=
 =?utf-8?B?dm5kdjZlL1FaQjVXbk53NE9xaDRnL3BZSFBmdFhpTlQ5MGJiNkd3RTFMYy9Z?=
 =?utf-8?B?ZXBLazJyOW5UYm9xQis2OFc5Y3ErbmxGZTg2Z2RodDJvSyt5WmhCak1uT2V0?=
 =?utf-8?B?cXJTUTdaejFjT2F5dVlkbE9qSy9kRlFseDJERnBNek00TndsWVZuZVk5TmdI?=
 =?utf-8?B?WFNiSGIwVjdqQ05oek9kTmh6THJFTEUwUHZWUkFKaklUMEJzanpzRkYvVzkv?=
 =?utf-8?B?OU9Ed24yd3FkSHBUOEF0TEVtM2JjSXBzVmlBYURmWEFOQ3hJb2NQZWgyUnFh?=
 =?utf-8?B?S25GaW9MRHhmVzUvWTNQa3oxM25rR0JxNmVydkhSMVROL1dTbUU2dzNTTFhO?=
 =?utf-8?B?WXZBNGw1MUJiQ296NGxyQ3c5RFI4UzFRZkRCUitaOElZaDVPTURvcmhyMFVs?=
 =?utf-8?B?NjZzZzNWRnFmMXZSSE1ZQ0JWaElVenZlMi8wSTZ0ekpUNVFuTHJvdzQwK2Ro?=
 =?utf-8?B?QVhXUUpvYm9iNHFBKzIrcERkbkMvQnltU0hUTjQ0bmhYb0JueUt4cEZIUEdu?=
 =?utf-8?B?R1BsRktJbmRSWTNXemdENUZpejNwWmYzd3VvSGtzRkpDREt0L1RjbU9adjdz?=
 =?utf-8?B?MUF5eFM1ejlINHRTT1dvMmlxS2FtNTZ0VmQ1MU9JYWY3dXdGM0Z0N29XdGVW?=
 =?utf-8?B?WlhGOW5ycVNkSVZnS3JOaGtCTG53VTlIUWprdkxXNHozNmx1dTArVm9aUkpW?=
 =?utf-8?B?ZFp2WkhoYzRQWERPQXR2Q0V1TkEzQjErelRtaFAzdVF3SlgySlp5cHpPdTNN?=
 =?utf-8?B?cXpTSFhaVmo4b2VBUktSRUtoR3Y1alRCSWxnL0hCQnB2Nmh3YlNEeExlSEx4?=
 =?utf-8?B?TkJ6MDlPMjZ5cVNkb0tGSUcyeldsZ0RhdmNSUndHcmxENmtldlEzMkUxRkU0?=
 =?utf-8?B?UmtEcHgzbE4zek5rQWcxSHhVdDh0dTZERmhPdVhDVEd5NDdNdFFjSlJMaW5R?=
 =?utf-8?B?SC9PckF2QkFtUmNpQy90cWI5MVJINlkvQlJDeEE2WHJrRlFOdzNvZmRQRDBI?=
 =?utf-8?B?TXBQeXpmdVhWb2tDa2FxbnBiWW1ZY3V2dENwT3lXemVVY0hDM3FZQkVLNmZl?=
 =?utf-8?B?NUFXMkpIcTh3VzhPUjBic1lYbUpsUitkeVBsaVJwQ1owb3RsajE0Y2RSc29V?=
 =?utf-8?B?djFPS0gzbXEycVpJcnl6NjVva0FkM2JKc2hoNjVVVkZEeFRQYmVhRUl4NHkx?=
 =?utf-8?Q?3s2w8N76iq9q5opZiW031h6r2pDvA8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkVzeXlqemp1dEl1d3FreGhGWGRiS2o4NDVTVnd6dzZwYStrU2NDN2l0dUl3?=
 =?utf-8?B?NkZhVmgwWEdFdVBvWVQwNTh1QStzVXlDVnduVHU3TEU0UTJKNTRmZmhhcHpR?=
 =?utf-8?B?VG80Vzd5U3E2QzgvUEc2RURaOFVEVUtEVE1OTnRFYXRyK25vNENWK2cvMkxR?=
 =?utf-8?B?Sk5HM1RlY0JhUk9GTW9FVEZqUE5Kd3F0MzNyL0NRUWtjV3BiNG1LOW9haDBL?=
 =?utf-8?B?TDR6TUNhL2lvT2N1UkFIMDYxTnVrRStCTEJ6bFpEYzlqMTZFOHZNUEJzS08r?=
 =?utf-8?B?SkVsUy9wS21TWWp5QWZqZGowem9udlF2RDdSNWFkYStHWmdUaHIvR3M1MjZL?=
 =?utf-8?B?VTdscUU1WjNId3VheEpHTDVhdVA2T25OKzZucDkxUEdDdDY4Zm85WkpsNHJQ?=
 =?utf-8?B?Y0RLMmE3dklMUWJqNFJuTG1xNkI3YzhNSWo0NlBaeTZrTEdFQm5VWGhYUXlx?=
 =?utf-8?B?REVZeGhhNmpCK3dLa3phK1JEaTVkRkNncVg3VlhMSTJIZkR4MlBxTUgrNm1a?=
 =?utf-8?B?V3hMSmdRclpiOStJNVhYdDlqc2tqYktZLzkraFArYzJIRHdSODlkRDZOTXFk?=
 =?utf-8?B?M3d0L0NRMTRjaVY1RW5iZFFabnNBYncvUzQ5cWxkaHZVNldudUtab0ppT0d3?=
 =?utf-8?B?U0JOSDNVR0x5MjhHZS9mNDgrUVlwc2hRMlNnWTRFcFN6ZWhVQmFlZW1zR056?=
 =?utf-8?B?YU1Za1pSRHBzMFdWcXNtUDZ1aVFqN3IrQU5WN05xZTBQT3hUSHlWQTFhWUJo?=
 =?utf-8?B?OVlETGtzdzBTYkhjbkZXRU1NRkp2TW9JVjFSTVlaTHAvK2s2SExGVU5PRi8v?=
 =?utf-8?B?RmVkSU1WbyttTVAwamlrWXNUc0oxS3JoYkFlMVNmUjVnQ3FvUzJIbFNkaTJU?=
 =?utf-8?B?czZsRW1xeHZOUjlwUlFFTzhWZzNyOG05T0trTVVGNkZTcTZQVjNkTUR5ck1T?=
 =?utf-8?B?L05IR1VWREdQV1ArMUZTREJ5Nm9ROXRPU29HUnpvZWFUREpJRTY3aGJFUW5v?=
 =?utf-8?B?U3RNeFYyWFR5Kzd5ZDArNnN6ZityL3ZmT1dBTWNHREJYU2ZDWVFlQVVPeHhZ?=
 =?utf-8?B?U2VCRTlnMWtuVmQ5MWd3d2lKaVBTODdXd01LN1RHRXAyMCtRdkZqVGZUdVUw?=
 =?utf-8?B?QmxVb0RDR25vNjkzdFZMZGRva3lEaERER2NBalhxWE40NitMZThxbTAxenl1?=
 =?utf-8?B?cXNQZ2kvM2lxeFNiZzlheW9hQTBQYW9tQktIUUJMamh4amo0dUlzSitvV0Q5?=
 =?utf-8?B?Mk85MkRneGs0c3VUSGRWZjJNaERDY24wK29EbUZhd1dRV3U5aktPWVZxWDNQ?=
 =?utf-8?B?a3FVRytoUjZydEpxSW9CZ05QdFJNYW5aWWFKSk1YeFNxcENBOGJOZlhPR2lR?=
 =?utf-8?B?TkYrOG5yTE1SR3ZyRGd0djFQTGJTeHhOMjBsUUNweHEra2oxbk00TURDVFJi?=
 =?utf-8?B?bGhkTU9Zc1BheWF1amQxcFV6Q3lncjJpNURZMHdqMEE5UGtMVDlRZHlXb293?=
 =?utf-8?B?aE5LdTRmKzV4M01CaWpUTlFmcDc3dUt3dDNtWWIxOHRGWEVXSkQ1STNuZXZ5?=
 =?utf-8?B?UUJjN0k5MmtBcXAxVzlPamttNVh2Mk15UnRZaFEwQXpVR1RsdmRDYmJoQVB1?=
 =?utf-8?B?eDl2elE5ZG1yWHV6b3dkNHpuZGRkV0g5QVRjYzRNU0t0dmJweDFZZ0pJdVlQ?=
 =?utf-8?B?YkkrNGgvSExTTnBkZUZTaVJmRjBWMHZSYmlBMVRnZ3VoWXRYZjJmVjlJdllD?=
 =?utf-8?B?YjVRMzR0dC9vaVVkWWhvd1VoQ0hCcitLWHVXSDFENFpzaTJzOUFTTHc1V0U2?=
 =?utf-8?B?clBBdG5JWUorNU5zaTFxbnZZSXdNVk5ySTdYeFo3WStUUENQTjU4RTUvUFFz?=
 =?utf-8?B?RWJDVDY1U1lENjI4OHNsMmhSQXduZWQvT3ZOcUphZ3Zwc2MyMGt6VmEzVXJ3?=
 =?utf-8?B?bklReE9tVW1KdVRTQ2QyaGp5TjlFYUR0WlVRdzBtNTgwZUV4bE1oa0IxekVx?=
 =?utf-8?B?K0x1SkhUclBXcTVjQjFOZ1RNNkZIMU5Eajg3SHpGdXBJRHdlNytCS01uQUd4?=
 =?utf-8?B?LzQxQkYvQTJla3A0WEpqZmFKbmkzR2VzS1A0cnJqamNuUXM4S2xEMCsvcHFr?=
 =?utf-8?Q?o93Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFB5C070139C4E4E8B49A0B220F66C3C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886df4f8-3b23-4822-a701-08dd7c05e6fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 10:11:34.8180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKoDpoQbbFLzsbJYMRkjDF7JCrMti86GI+9h3uKEfeZpTXRk9RsI0aggg8DSKFvussPOrPAI/ZNcIgaUQUIcZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8083

T24gMjAyNS80LzE1IDE3OjQyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQsIEFw
ciAwOSwgMjAyNSBhdCAwMjo0NToyM1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IEFk
ZCBhIG5ldyBmdW5jdGlvbiB0byBlbXVsYXRlIGV4dGVuZGVkIGNhcGFiaWxpdHkgbGlzdCBmb3Ig
aG9zdCwNCj4+IGFuZCBjYWxsIGl0IGluIGluaXRfaGVhZGVyKCkuIFNvIHRoYXQsIGl0IHdpbGwg
YmUgZWFzeSB0byBoaWRlDQo+PiBhIGNhcGFiaWxpdHkgd2hvc2UgaW5pdGlhbGl6YXRpb24gZmFp
bHMuDQo+Pg0KPj4gQXMgZm9yIHRoZSBleHRlbmRlZCBjYXBhYmlsaXR5IGxpc3Qgb2YgZ3Vlc3Qs
IGtlZXAgaGlkaW5nIGl0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFp
YW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4+IC0tLQ0KPj4gdjEtPnYyIGNoYW5nZXM6DQo+PiBuZXcgcGF0
Y2gNCj4+DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBKaXFpYW4gQ2hlbi4NCj4+IC0tLQ0KPj4gIHhl
bi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBi
L3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IGluZGV4IDA5MTBlYjk0MGUyMy4uNjgzM2Q0
NTY1NjZiIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gKysr
IGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gQEAgLTgxNSw2ICs4MTUsMzkgQEAgc3Rh
dGljIGludCB2cGNpX2luaXRfY2FwYWJpbGl0eV9saXN0KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0K
Pj4gICAgICByZXR1cm4gcmM7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgdnBjaV9pbml0
X2V4dF9jYXBhYmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAg
ICBpbnQgcmM7DQo+PiArICAgIHUzMiBoZWFkZXI7DQo+IA0KPiB1aW50MzJfdCB3b3VsZCBiZSBw
cmVmZXJyZWQuDQo+IA0KPj4gKyAgICB1bnNpZ25lZCBpbnQgcG9zID0gMHgxMDBVLCB0dGwgPSA0
ODA7DQo+PiArDQo+PiArICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4p
ICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgLyogRXh0ZW5kZWQgY2FwYWJpbGl0aWVzIHJlYWQg
YXMgemVybywgd3JpdGUgaWdub3JlICovDQo+PiArICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lz
dGVyKHBkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIE5VTEwsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBvcywgNCwgKHZvaWQgKikwKTsNCj4+ICsgICAgICAgIGlmICggcmMg
KQ0KPj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4gDQo+IEkgdGhpbmsgeW91IHdhbnQgdG8g
dW5jb25kaXRpb25hbGx5IHJldHVybiBoZXJlLCBvdGhlcndpc2UgeW91IHdpbGwNCj4gbW9zdCBs
aWtlbHkgYWRkIGEgZHVwbGljYXRlZCBoYW5kbGVyIG92ZXIgInBvcyIgd2hlbiBnb2luZyBpbnNp
ZGUgdGhlDQo+IGxvb3AgYmVsb3c/DQpPaCwgaXQncyBteSBiYWQuDQpJIHNob3VsZCByZXR1cm4g
aGVyZSBmb3IgYW55IHJjLg0KDQo+IA0KPiBBbHNvIGZvciBkb21VIHdlIGRvbid0IHdhbnQgdG8g
ZXhwb3NlIGFueSBleHRlbmRlZCBjYXBhYmlsaXRpZXMgeWV0Lg0KPiANCj4+ICsgICAgfQ0KPj4g
Kw0KPj4gKyAgICB3aGlsZSAoIHBvcyAmJiB0dGwtLSApDQo+PiArICAgIHsNCj4+ICsgICAgICAg
IGhlYWRlciA9IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCBwb3MpOw0KPj4gKw0KPj4gKyAg
ICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFsLCBO
VUxMLA0KPiANCj4gWW91IGRvbid0IHdhbnQgdG8gcGFzcyBOVUxMIGhlcmUsIGFzIHRoYXQgd291
bGQgcHJldmVudCBkb20wIGZyb20NCj4gd3JpdGluZyB0byB0aGUgcmVnaXN0ZXIsIHlvdSBpbnN0
ZWFkIHdhbnQgdG8gcGFzcyB2cGNpX2h3X3dyaXRlMzIgSQ0KPiB0aGluay4NCldpbGwgY2hhbmdl
IGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG9zLCA0LCAodm9pZCAqKSh1aW50cHRyX3QpaGVhZGVyKTsNCj4+ICsgICAgICAgIGlmICgg
cmMgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4+ICsNCj4+ICsgICAgICAgIGlmICgg
KGhlYWRlciA9PSAwKSB8fCAoaGVhZGVyID09IC0xKSApDQo+PiArICAgICAgICAgICAgcmV0dXJu
IDA7DQo+PiArDQo+PiArICAgICAgICBwb3MgPSBQQ0lfRVhUX0NBUF9ORVhUKGhlYWRlcik7DQo+
IA0KPiBEb24ndCB5b3UgbmVlZCB0byBjaGVjayB0aGF0IHBvcyA+PSAweDEwMD8gIFBvc3NpYmx5
IGRvbmUgaW4gdGhlIHdoaWxlDQo+IGxvb3AgY29uZGl0aW9uOiB3aGlsZSAoIHBvcyA+PSAweDEw
MCAmJiAuLi4gKQ0KWWVzLCB3aWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IFRo
YW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC019EC4AD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 07:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853800.1267155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLG5e-0006M6-Gw; Wed, 11 Dec 2024 06:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853800.1267155; Wed, 11 Dec 2024 06:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLG5e-0006JX-Dy; Wed, 11 Dec 2024 06:20:54 +0000
Received: by outflank-mailman (input) for mailman id 853800;
 Wed, 11 Dec 2024 06:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqCb=TE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLG5c-0006JR-K4
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 06:20:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2415::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 104cec5f-b788-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 07:20:50 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 11 Dec
 2024 06:20:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 06:20:45 +0000
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
X-Inumbo-ID: 104cec5f-b788-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiNn6XWwFs4K5WNOKXIfvIn64ARBbRLHAOGvNEp9BAN7+I8PHUJUOaopDRzs76l5dn6RIPG9XjqnllwziHzBWKvfbhi3e8djh61M6T9+hR92aq3RzcybNZDYwamA0a35zKcGdqpX4Yxk86VnHudC+Lana1nB+eURCWwJuhpc1UzRvgGbzNrwuAxTWizBNjy+icySO4sCa72YvpnZEq2y76gNzKrXvVLSabRiMRflZE7C8ogyl8rdUyTxgHy0UFOl2tKZ9WvSxuE0zrYtORYTFnQg0P1FhIWy2UIl7xiSa5C5yywenrQ2OkmiPKfS75iaP2OzrEiJmSmhCqlN7KRwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVLQK9Pf9WHFE7oiO52yZyICFfodqAd77gyssO5JpEU=;
 b=ygpx+K+ZNhyv0rX8yJdrrXdrgAyYPknQDMwyPgPNP4sHcMC++eqd7F5c9hSu+0B1Q760668xgK3+DRLuKOJEVUp3Od1Ubj3z9aHtpv29W539BwmJUVkiS4nFjlGeLz0IESudgDOIujbwpGRhStnQfK1tscmafcyopLX+rZl5SVJVqV9lSB1NK8+zBsBeCJ1zQciCgXjaq7Li9CRwUhe1tey2jhSRRDCa/idBQ/SDeixcVcdyvFbHb/1jnniYP4QKZ8UiGDqW1PwsGHd3K1KiIN2udfkm2P7a0NVGthiXg1fxqsNmY41ckf59G90q+bfnexAtAcgP0vCyxghFfdUd1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVLQK9Pf9WHFE7oiO52yZyICFfodqAd77gyssO5JpEU=;
 b=ZScLXRMTs20Jf8Z/A/ABJfo7knO6CdjBG6Xye/g0sWHnDxOvjFIq2Z/d8COMK0EVYzV2gF0AwUL/6w+kGPAgd+gTU8zw3rf8mmcxz2Kg1GaP0wvE0r9ZxjOKOJRq/9VcahyE6PZs/r0OZCKVvfUfDpoEtHLV5uMYZ6eey9RipMw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index: AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAFgZ4CAAcmtAA==
Date: Wed, 11 Dec 2024 06:20:45 +0000
Message-ID:
 <BL1PR12MB58494BDE220F458EC1407B39E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <Z1gfYeJL-mgTn5Gj@macbook.local>
In-Reply-To: <Z1gfYeJL-mgTn5Gj@macbook.local>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH8PR12MB6746:EE_
x-ms-office365-filtering-correlation-id: 0a3021ec-7536-4394-4e42-08dd19abf2b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RGNPeTVRcHBpK29rOWZmbTdCd3Ywa0pyNklXSnRhajUzbGVMNjd2N0wrQUV5?=
 =?utf-8?B?eHBNRWpMSk9hUENyT2V5MElidFBseG9jYkx6SXZ4RXRNd2ZKNXNjb2JDOXI3?=
 =?utf-8?B?QWxBdGNTeks3UEQ3Qmx4MHgxTXZ4aENzaGF0NUorS3hpT2hVNHNQR3hqdHBl?=
 =?utf-8?B?SVhlWEc2T3kzWWR4aVBiUHRhRjBlZW9kMitmNWJIbGVjMGxJUDFmZ3IzbXAx?=
 =?utf-8?B?ZjFpSUxuTi94NkVGOXNPTjhnMk1mZ3dXdnJEbEt1dlpZZlJiUnRyeG5oa215?=
 =?utf-8?B?QUUrMldDNnpsVDBDYnlRaGJZekpxSzQwQ1NZSThvUk5pcjdIWEpFcFJwbGpZ?=
 =?utf-8?B?bXJIM29xWGVwWVI2Ym9Cbk9LdzRrdTA2SzRScFNHU2xUY1EvSHMzR3pPaXll?=
 =?utf-8?B?QldtZWlhc1RkRE1UbEVGMSs3YXM1bmpjUFhJS1pnTkR3NXcvZVFVb0swbUhn?=
 =?utf-8?B?b1BFZllXVEhyeGJKK1daV21YMi9UQWxkRnMwc3dUMjNKMENIeDROVjVBbEpk?=
 =?utf-8?B?enI5TkM3OE40dzZDMGcwcDRVMnFSYUt1SWNYd2w2RUllNFYzNkVzMXYycS9r?=
 =?utf-8?B?Z0IyeGh6R29ZQWZPek1pemlScGlqN2VGVkVYdTdMWG0wVnlja3poemtFNUx6?=
 =?utf-8?B?OVlTRE5paGlQVU0wOGZnS0hNZng3cXJ5OElqU0R4V2x6dUtQWDZsQ2IyM0FE?=
 =?utf-8?B?b1lYYWlmYjU4SFEzK3c3QWI0S1ZTWDA0SGx5WjIvZERMKzhVTG1ac0tCQ05z?=
 =?utf-8?B?ejR0dDRKcEZlWXFXTDhNWHczTE1mR3dzWXJ5V1NEODlXSzBNejRJODY1c2hI?=
 =?utf-8?B?UUJOOG1jck5TU1hpbkUvWXlDYktadjhpaHZidmhnTitLOE50V3ZoNTd3dnAz?=
 =?utf-8?B?a000RUhMdS9mY2VacmtLSGJGKzZrMUl1TXNlaDd5ei9LTmNGaGJTTXZ5RUd4?=
 =?utf-8?B?bjdkV1c4RVFmeUpIZS9BYzBUc0I5Yzh2b2V5Z2MzUDRCY2ZSSkJxVi9vcXlL?=
 =?utf-8?B?bnRIdldqd2UvNE9xd0xCbnZIQ0k1ZGgxa0N0QU1qV3JseFdKOU1qRFJHNk9y?=
 =?utf-8?B?ZytFRzh0VE1wUDdZUGFPYlpTZ3F5L1VVaGcyM3k2ODVsdUdyUUtNTkxNdGhG?=
 =?utf-8?B?VFVWQjAyYmVxL0lxSGVlOEhHODNKeWdYVHVUMWgyUUhIYzNLRmV5ZjIzOVdL?=
 =?utf-8?B?QkoybnNYcHlqVzFtMUxpT0xDa1NGMTMxUEtTWDhwSjc3NGo1UHFJb0YwSlEr?=
 =?utf-8?B?aTFvWVJNZjBCdWFmMXYrT3o4ZUhDakNBSEpGdVVqUnA0elpuOGhHaitvUStx?=
 =?utf-8?B?eTBCLzBmS3huc2RuUXNQaVp1OEhMQzVSRHhERDR5T2xhQmlEZkJjZGFyY0Ri?=
 =?utf-8?B?eHY3bWdVOVNJa3VmZHFNVzdNa3R5cVF1b3VHNlE4U0JvODJROUNBRisxcTJi?=
 =?utf-8?B?RE9Zazc4Z1lJd3RxTHVzQi9MSUZ4dDl6NlpHa1NtN1VsV0pVcGYvNStiaDFy?=
 =?utf-8?B?R1FqNmp3ZHUwRGt1ZjNTSE52THc4OTNSZFlLejd5blZRUEFxYXhhdTlZbVFS?=
 =?utf-8?B?MkE0MnpjMVRJSUViOVNTSDRZZXpOMW5uWFdPT1pBSlkwelp2aHJqbVVsaTRq?=
 =?utf-8?B?WGpITm5VaktDVGlWU3ZOeFhzdGF4K2p6cS9JZTVkVUdwTXJVKyswTW9OWXg3?=
 =?utf-8?B?a3ZsRStkcVJhaW9kQnZtRGlpTWRJZGFpQUNnMnJWQUhMZFZVRUxGTldWaXdv?=
 =?utf-8?B?NGNFNmthOGFwb3JLRHMvdlI0WjlPQlJzd2pBWU1Fd3lVemZQZmpFcFZmU2JY?=
 =?utf-8?B?dUgwc0F3TEQwTEJBRzNUZ3NpYzk1UlU1cXJTUWJkeWg0d0R6dkpSdWpGRWJv?=
 =?utf-8?B?VHhFdXlxTXJybk9IbWJ6bWFxOHVJdzZXS3B3V3Vzc3ozUmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WURWbVB2ZmdkZUNGdWEvK3VHZGQxVklPWWc5V0g0L1grNlltT21qcVFJNHRh?=
 =?utf-8?B?M0RLUjhjaE1xZXdWZm4vN01zZ1RZR09KZTN0RWtkbXNuSVB1VDFTYUwydUVm?=
 =?utf-8?B?dDRjaTE2ZDJqemxQc2NybUg3ZGpuUEk0Y0FkSjBlTXBLREVhTGc5UElrVFpU?=
 =?utf-8?B?dHg1c3RXZFB6M0M3YUo4VWpOeldQMG85blNzRU9QcnlyTHBFcWo3ajluYTdS?=
 =?utf-8?B?MFkvSDJSYjNFeDEyZWs4MWtpZkZuVERETVd0NzJlSDBjd2VjYzVycEhQenE0?=
 =?utf-8?B?eUdRWU9QS0VXL2JmYkNWcFNRb1NGSDJWbEsvZENEMVdZTHpTVzFMUjR4M0lC?=
 =?utf-8?B?S0l2bHNyWG0wZXFSVk5DQzZkZEVtVkdWekhmK3BmY2Rta21TQ3VQNEtjb29O?=
 =?utf-8?B?Ri9YamhESjFreXFoWnZ1YjVCbC9rNDJHNGp3UlU5NndzdzhMMlNvZU9MZ2Zy?=
 =?utf-8?B?VW5oV2dJbkxqZ0paaVhzZmRIMFlHNGtPaStJblg3M0J2cHhNbVptc0twSkxE?=
 =?utf-8?B?bXBMbnY2bUZsdkZwSHZQYTJaZERyUGpOcEZrMFBiYlYyWlZzbWpSQ20vNjQw?=
 =?utf-8?B?VlhFa01WVFFKLzN2ZllJaGN1emEyNTBRRCtTUXFaN2MzellhR1orQllNT2c1?=
 =?utf-8?B?Tlhoem42SzNhTTU2MDVneldLVndlTC9qalFMdzUzc09qRlZjUDVYN2gvSEJi?=
 =?utf-8?B?K3pNK21rd1JlSm5OZFkrNytKWWxQOGtMeEFBekdrRTZqOGNTeVdZa2F3bmxr?=
 =?utf-8?B?NFZIbXRRMElhOG1WQWZLb2xqdCs5aEo2YjZnUXpVN0Uzd2hVMXlkeFd1UVJW?=
 =?utf-8?B?NEpVd0FUMmhCSXVta0ZNZUNBR1llSGNLTGZsTy9TRkN6aTl1a2pEa3cyRGF4?=
 =?utf-8?B?bXp1VFFHcDc1MlcvcG1oajE1ZWQrZ2NSZU5mV0t5ZWtjeXpKY0lqRzFPYWRB?=
 =?utf-8?B?MWgvVEh1REdDTm9JdFNtWllyM0NIZ1E3TDFmd21WRXdqUDVGM3BSUnFkUVRo?=
 =?utf-8?B?LzZKR3hLelBFMnhWUkZPTGFWNXFXS1BHeUxQb0tIZ0hsQmJyUzR6MExTZVRk?=
 =?utf-8?B?MzEwMmoxbXpXSHVxT1ZlcVNya0lSMGFMZDF2YnpkZFJzWUd0Z3pmNUoyaDBx?=
 =?utf-8?B?M0UrRW9GdmZSU01Ib0d2N3NlWEJyYWNVTnhlUWoxRHVMdnZFWVZQeHJIUEZL?=
 =?utf-8?B?RDl1QXpzZDkrRTBTNGdvMzNkWGk0VTVMTG5qbm5pVTRYSFlLNTFtclA1d3BH?=
 =?utf-8?B?ZHpscWt1Nm9Ka1c3SU1Ma3FKSWVuQk5lY0NOTjF1TDBoTUpCOGVwdEFJb2dh?=
 =?utf-8?B?MHIrTVdVdU9XR0ttaUY4MlpvWFo3RXNNNGF2aUtvM3FjaWt1anhXMytyYTlS?=
 =?utf-8?B?bGhubGdoZmJKZUFnb3dFUlFmVGlseVJaWUFnWlNpTlh0b2JrSzQ2V0tQaHNs?=
 =?utf-8?B?UE1pcUZZNzNEQ04zclVwZXpFVVprbVVzakp0QWZ0NzBXVFBOanF4S3FEbzJC?=
 =?utf-8?B?Z0RRTTZvNkw1Y2ljRVZOTWFJMURPa2NCaHlmb05ZU29HeVdGSElqUGNxQVUv?=
 =?utf-8?B?U3BrWmt4ODVrY0NWNm82cnZXWUdtK2lwZW9CQWpWUjVjd25velZSUFUyNnRF?=
 =?utf-8?B?YXFjd25UVjVMMyt2bTNRdG9JNWxuRHV5cmZCT0dWOHZsV29WcmFuR3hydmlm?=
 =?utf-8?B?N1p1WFZPTkZxYkJkdWhLcVdNNmNHREM2bDZVK3Fud0lkeEdxZ1VjL3dqcTRh?=
 =?utf-8?B?N0xOYXBMZUtyV2NYbXBJYzhWOEtHUEUwVEk1RGZYSDVsbUtaVUl3WW1YcGtY?=
 =?utf-8?B?SVd4N0lOVW4wc2lyMHdLMXlQVVhzcnl4QnVHS3d1Q3hUQmhCVGZRcm1yYTBS?=
 =?utf-8?B?VFk3S3pUU21YVlVPRlg2SVVnZVl2OFB6eEhZVk1PaUk4SFRaZ2Q0M2JwWmlV?=
 =?utf-8?B?U2d1Yk5ZSXZEQ1BicGh0Y1dwbkMvWFRkR1EyeWs3YnNQMTRwSlZKWVZ0REhY?=
 =?utf-8?B?YklOZFNKZHc0dTB1S0dvN0JOWExuR0RodjhKR09NUjNJd0R3TS9GLzNxOHV5?=
 =?utf-8?B?Q2IxYTVlcHg0M09QbThCTEpCR3ExSmViUnpnUmlMUlQvaVBIbHhEWkthdkpo?=
 =?utf-8?Q?+Fr8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3D07104C33A134CBD90A753D543C513@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3021ec-7536-4394-4e42-08dd19abf2b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 06:20:45.8312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3fErXYxxWCyC0laqPlGUYuozj2hhd+eMIBzh6eIXLjAe4lqW3C3lQ26nmGAtqZyM0IQYl08I1xjxwNkSM1bkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746

T24gMjAyNC8xMi8xMCAxOTowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBE
ZWMgMDksIDIwMjQgYXQgMDI6NTk6MzFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBP
biAwMi4xMi4yMDI0IDA3OjA5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+PiArc3RhdGljIGludCBj
Zl9jaGVjayBpbml0X3JlYmFyKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+ICt7DQo+Pj4gKyAg
ICB1aW50MzJfdCBjdHJsOw0KPj4+ICsgICAgdW5zaWduZWQgaW50IHJlYmFyX29mZnNldCwgbmJh
cnM7DQo+Pj4gKw0KPj4+ICsgICAgcmViYXJfb2Zmc2V0ID0gcGNpX2ZpbmRfZXh0X2NhcGFiaWxp
dHkocGRldi0+c2JkZiwgUENJX0VYVF9DQVBfSURfUkVCQVIpOw0KPj4+ICsNCj4+PiArICAgIGlm
ICggIXJlYmFyX29mZnNldCApDQo+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4gKw0KPj4+ICsg
ICAgY3RybCA9IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCByZWJhcl9vZmZzZXQgKyBQQ0lf
UkVCQVJfQ1RSTCk7DQo+Pj4gKyAgICBuYmFycyA9IE1BU0tfRVhUUihjdHJsLCBQQ0lfUkVCQVJf
Q1RSTF9OQkFSX01BU0spOw0KPj4+ICsNCj4+PiArICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0g
MDsgaSA8IG5iYXJzOyBpKyssIHJlYmFyX29mZnNldCArPSBQQ0lfUkVCQVJfQ1RSTCApDQo+Pj4g
KyAgICB7DQo+Pj4gKyAgICAgICAgaW50IHJjOw0KPj4+ICsNCj4+PiArICAgICAgICByYyA9IHZw
Y2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDMyLCB2cGNpX2h3X3dyaXRl
MzIsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWJhcl9vZmZzZXQgKyBQ
Q0lfUkVCQVJfQ0FQLCA0LCBOVUxMKTsNCj4+DQo+PiBUaGUgY2FwYWJpbGl0eSByZWdpc3RlciBp
cyByL28gYWl1aS4gV2hpbGUgcGVybWl0dGluZyBod2RvbSB0byB3cml0ZSBpdCBpcw0KPj4gZmlu
ZSwgRG9tVS1zIHNob3VsZG4ndCBiZSBwZXJtaXR0ZWQgZG9pbmcgc28sIGp1c3QgaW4gY2FzZS4g
KEFuIGFsdGVybmF0aXZlDQo+PiB0byBtYWtpbmcgaGFuZGxlciBzZWxlY3Rpb24gY29uZGl0aW9u
YWwgaGVyZSB3b3VsZCBiZSB0byBiYWlsIGVhcmx5IGZvciB0aGUNCj4+ICFod2RvbSBjYXNlLCBh
Y2NvbXBhbmllZCBieSBhIFRPRE8gY29tbWVudC4gVGhpcyB3b3VsZCB0aGVuIGFsc28gYWRkcmVz
cw0KPj4gdGhlIGxhY2sgb2YgdmlydHVhbGl6YXRpb24gb2YgdGhlIGV4dGVuZGVkIGNhcGFiaWxp
dHkgY2hhaW4sIGFzIHdlIG1heSBub3QNCj4+IGJsaW5kbHkgZXhwb3NlIGFsbCBjYXBhYmlsaXRp
ZXMgdG8gRG9tVS1zLikNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIHNhZmVseSBleHBvc2Ug
dGhpcyBjYXBhYmlsaXR5IHRvIGRvbVVzIGJ5DQo+IGRlZmF1bHQsIHNvIG15IHByZWZlcmVuY2Ug
d291bGQgYmUgYSByZXR1cm5pbmcgYW4gZXJyb3IgaW4gdGhhdCBjYXNlDQo+IChhbmQgcHJpbnRp
bmcgYSBsb2cgbWVzc2FnZSBpbmRpY2F0aW5nIFJlQkFSIGlzIG5vdCBzdXBwb3J0ZWQgZm9yDQo+
IGRvbVVzKS4NCg0KSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS4NCkkgbmVlZCB0byBhZGQgYmVs
b3cgY2hlY2sgaW4gaW5pdF9yZWJhcigpOg0KICAgIC8qIFRPRE8gKi8NCiAgICBpZiAoICFpc19o
YXJkd2FyZV9kb21haW4ocGRldi0+ZG9tYWluKSApDQogICAgew0KICAgICAgICBwcmludGsoIlJl
QmFyIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIGRvbVVzXG4iKTsNCiAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOw0KICAgIH0NCg0KPiANCj4gTm90ZSBpdCdzIGFscmVhZHkgbm90IGV4cG9zZWQgdG8g
ZG9tVXMgYnkgbm90IGJlaW5nIHBhcnQgb2YNCj4gc3VwcG9ydGVkX2NhcHMgaW4gaW5pdF9oZWFk
ZXIoKS4NCj4gDQo+IFJlZ2FyZHMsIFJvZ2VyDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFu
IENoZW4uDQo=


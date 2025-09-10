Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF66B51357
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 11:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118062.1463978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHaC-000067-3T; Wed, 10 Sep 2025 09:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118062.1463978; Wed, 10 Sep 2025 09:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHaB-0008V4-Vo; Wed, 10 Sep 2025 09:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1118062;
 Wed, 10 Sep 2025 09:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=golU=3V=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uwHa9-0008Us-Mo
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 09:57:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:200a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9675f9f9-8e2c-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 11:57:40 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 09:57:36 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 09:57:36 +0000
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
X-Inumbo-ID: 9675f9f9-8e2c-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSDwXXx8EFNulbQ5NtkOcbVFtAbY3bG1gn/5GEtcJcowoHQv9SCUNinjq5hAvtSr02PgnV7RzYbB9QAeq09uBp1+9U6hmkZ0puGUkULrDvVh5bWjVude3y54Xl6RhKjPRitM3paC3IqkSCZxGJPiS7bHmF4sk2nfJttDbIDvjdLJHPDUEFvEG00wwA0QCuU+HVZ8+D0qehCfmSjhN+Bp6kOQu16xE7uf+yP9IMen+uYglAU+0wnc+tUAowbdQAO/oE3gWVUZ05K6tzje1KrkTfTHk7kW9ibNB06qCW+S3CzI6sENAliRgw0+wqippMv3dawc/jf5AwyR8iMXPnJL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODQXCuXg461oInvTUHNS3WYAgmtmhKu6nv6eHeRPYLk=;
 b=Z9uWxxOxY3KKYAdCm300MRVq93qTiSPP3RlC0ypAnnOPhvjGv+MJK93Wj7AHeDnoQWNiY9G/dKRAMz1m3L/4RarsGNdsy9mo0oGhwGmMzlF0N59v6HutbSaDh1BmCiZ/OUc6vzxoU7kw00zj4HhrwPmucZoQZjMlXfqKVKQE2X774n+n7YkroIc+BD4MG6X2fvg+i/YU9uywU3zHgjd6yiLPetOYWdx16H/0jQiwFJMX3bf8IqCsRu7CSIxgDKRemb+ctafRd6s0xV//CoF9NGio+0N59zL/FRPHY3MjUFQdjIcdHr+ehYVB4SslndMaXRo4wQRr3NC9JFMDBOpEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODQXCuXg461oInvTUHNS3WYAgmtmhKu6nv6eHeRPYLk=;
 b=S1yBEejKRORG2xJRSA9wGDyuvOgHype1h+XBJwcMfOJIIxfvxMSdIKpgjlnpwJRdVkRyAMXANKW2XwYDdGwrsNw82KlZeYUiHH6p/i9XljIMx517C6YPjmQEi6Rm2GqfX6bkm8iT0r4sGtM4GghBhow5Pxxrg0xv0T9Gw7awZck=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v11 4/5] vpci/msi: Implement cleanup function for MSI
Thread-Topic: [PATCH v11 4/5] vpci/msi: Implement cleanup function for MSI
Thread-Index: AQHcCDsBQje1Miq4QkCVUkMAlv2mX7R5kpQAgBNU3oA=
Date: Wed, 10 Sep 2025 09:57:36 +0000
Message-ID:
 <BL1PR12MB584979C70083E12A4D4273B2E70EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-5-Jiqian.Chen@amd.com> <aLGD7JKYiTUtSQ5h@Mac.lan>
In-Reply-To: <aLGD7JKYiTUtSQ5h@Mac.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9094.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB7215:EE_
x-ms-office365-filtering-correlation-id: dbd0899e-0484-4d57-6999-08ddf050783a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDFFM0ZZcUFZM0Z4QWVSK05iVHI3aHNmc0J3V1JKaHRtSzJycjlibFArOXhl?=
 =?utf-8?B?ODVqUHNvSWNaZFJFQnNYNklzMEVFZDhGQmhhRUpwZjB4aUVkUDBSWks2YVZl?=
 =?utf-8?B?WVZyVGI3c3I4YnRZUHR1bklscWZMQ0F5Y3Bsa3pFc0ZzNkp5d2N2aWJKOEZ2?=
 =?utf-8?B?U21uS1RXQzQ4SmdBMWphT2ZQUStWQzl2NXl6U1BhVGZOSytSYkd4eVY2aUJ6?=
 =?utf-8?B?Wi9WbFR0bTI1eHlJajJtR0k5Yk1GdnZqREg4ZncxUG9OWlcxMEpyaG1uQVlT?=
 =?utf-8?B?VHltVS9XaWlHbkxBNUdub0ZjQmUxYnhUWnM0WVZSeG10YXdiZU1WM2RSaGor?=
 =?utf-8?B?QmRjellySFgybFlhWmk4UWlOZUtwbnFwbzVQMzVkakZaNXpmUGFFUVRjOGFs?=
 =?utf-8?B?eHZKNTZ2RmRGeEJYTGpLd0JrTWY0NzZ4eU45TjZuSFFvZXNPZmxRL2JwRGNa?=
 =?utf-8?B?ckZFQWgxTCtpczlyWjIycTNGK2NUSnRFUStXY3lzMWdGWDc1Q1JCUTJSb3E5?=
 =?utf-8?B?Y3VpY2ptRkg4VHRRcUhFVzQ4KzM2MzJyaGVJNWlXZEcrcXB6V0ZpOEFNd09K?=
 =?utf-8?B?K3lBMTFwK21qM2djNVd4bFZHUTEyZDhOMjgvYXNpT1BNcE81UU1JV0lZcksy?=
 =?utf-8?B?c3JObHg3Q1VINWVJcS9jZmMrUEYvY3M5eUowY1ZUb0NHWjN5dGxvc0tzbTF0?=
 =?utf-8?B?NDlMOXZMMFpMWjVxUytjYUhDZ1hBWDFvYWliZFB5eUxsN1dWMmQ1YWUwT3hB?=
 =?utf-8?B?S3hTZlRDUSs2cCtIbFR6SW4xTmJBeGJZUTFCbUJicGEzUUFDRDF0SGE1N0tB?=
 =?utf-8?B?VDk5OWc3UUN3M05DSWUzRjhHWHpTdHpUT2xwMlkyL3BuN0tOSGdnQjRyUlpG?=
 =?utf-8?B?dHU5bmR0aEpFYWlxWDBreEF4cEhjcXJjblJlYnFuUEs5bVlhdXhLb25TU2dy?=
 =?utf-8?B?eGRBVFVGOTF1aXdpSXRVU3RwcEFHaHFLVjdhR3N0aDVDV1JKa3RtVHZSSmJL?=
 =?utf-8?B?V3ZUQkhUUVNyV0RGWGJ1M0tZbFNaOWpYVTRmLzhYZW1rU1pleFczVk5FL0lm?=
 =?utf-8?B?Vy9aK0Qzc1NEYW1wVERrVDBpU1dmMCtYdjkrRFpVNlVUNlRlZzN6V3FFcXNj?=
 =?utf-8?B?bTR0V1B4SVNnV2Fac2RGaWJIWHR3VlF4R0UyTEhyaXpORmdUd2ZDMG9sZm1V?=
 =?utf-8?B?ODdST1A2MjI4M2dZZ1IydlhSWWl6Qk9tUDBiY1ROTU1SeVdHYm8yU1FJZTRI?=
 =?utf-8?B?cTNhcTY4RFFPNzBEcEw0ejI5Zk85MmZ2UVNSenNkRGdMYjAvUVJERzFqSm5U?=
 =?utf-8?B?ZU1SUEtqZzFySUlFUzRhSHQ2U2pqajhOOHhTL2oySG9xQXorTW4zaGc0VlpQ?=
 =?utf-8?B?SjZaelRONXFDMWk1cXpRb2dNelBFcmhGR0ZnOGpCaFROdk50bzR0UmpSU0wv?=
 =?utf-8?B?dHJ5dkk1MldINEFNV1RpaWhGRHkwR2hhWW9YYmJtVlE2NDltc3NPS1RFb1FV?=
 =?utf-8?B?ZXZJRlBtN0Jnd0V5eU1vcDRzUW1GbzNoSGF5cFc0S1cyZDduNklwTzJwd1R1?=
 =?utf-8?B?Zmo1cDV2RE1NOWhFbS85ZUJ5aEQ1WmdJK3ZnTWFwUjhlK29zTGVHRWxVanJm?=
 =?utf-8?B?elVWWG9Ib0QwcXZYazVrS015K011TkVWU2orTFBHOElrV2c5bGEvQnBjQ1Zi?=
 =?utf-8?B?RDhQZ2ZqOFJOYVpqZmN6YVdSS0RLNWo5MzdGRE5CZzVNZVRJZkI0OFVHbi9k?=
 =?utf-8?B?cWFRTEVlU2hkMkZQaFM0dnp0OU1OZlUzY08wQS9NNDg4czN1dzNNbUJYcEE1?=
 =?utf-8?B?SkdXaFdFaVlOeTJmMzAxZVlGWmtGNUtHL01jRjhXZEIvSW9yOXJTekVFeTJC?=
 =?utf-8?B?enZoRTloM1hpM3FQQXRNLzk1a00rcEs2RmxkeTh0eEFMUVd4U2djTjZmNkNl?=
 =?utf-8?B?UHZzd2oxcS9YNTFQRWV5bzdudTZ4d1A2T2IzdndwMi80N3R2dmg5RkJhbDN4?=
 =?utf-8?Q?2ZI48jX/Na+EW/wBVU89p68T+EdvdU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVhsblY4U0tDb1FtVnFCTVJLSWZLWHhSNzJxTSs0eW92YVJObkoxeUJ6eEYw?=
 =?utf-8?B?bW1jaGdlaTN2dU5DRlB2YzJVZkx3aVhJYjdwQ3pkOStDY20vQndTM2xxYlNB?=
 =?utf-8?B?UENoSUE3S1UzUzJDaFVyRGZLbklXci9iSFVmVm0ySTJiRUdUZWpHWGJRbzdQ?=
 =?utf-8?B?c3RyNVZCK0UzTUx6Y1gzRjRIblV6TDRkaTBiM2ZRMGlUTU5STlJrdWcyQk0y?=
 =?utf-8?B?a2VRZ2lVY1lTQ2tmUy9ZcS80c250eXg4YVIzV2tsOExNdjl1U3pLUGFKM010?=
 =?utf-8?B?WWhlNU4yMnlLTW5EVVhKcDJ1ME0wSFR4VkJzMktSaTN1WlcvVVpXMjVGcmtU?=
 =?utf-8?B?YkdyazZoUFVNT2h0V05XYmpzZkJTbVpQK2hPSGJpNUlzYURXMlNnZk4yMEUz?=
 =?utf-8?B?TnJFTy9ORWt0cEVDYk1zd0lGSU01RkRxU1prdjUvYlFxKzVjOE9YdkhncVQr?=
 =?utf-8?B?dGFSTEpDQ3RQZVF6Y0FUY2dKc0c2WmlmOFc1V1Z6bnUzc2pqZGtEKzA1TkFp?=
 =?utf-8?B?NVNBQmJMVVp5TjI4SVRNcnRlWklpbXhaWTliUGoyd1lzMTkweGpGVmxNVFFx?=
 =?utf-8?B?Sy9LSTMxaDY5OGdXSENNKzN6aVVTTS9tamRZUVRoRWNrVGRUQTRDdExBazhn?=
 =?utf-8?B?MVZNRnRrRmV5OFNtVytodE9acmZ0c3doVjJTcmRRajUxSjlrQ3U3dTVOV1dv?=
 =?utf-8?B?YW9kcEp4U05RVzkrTko5U0p2V1lWWEYwT1VDMWJtcjI5UTZ0VWhRb0k2RUZ2?=
 =?utf-8?B?dkpqUGhTbHFXN094Kzltam12YXlrWE5hOFJNemxPYVM1THg0NXk3OFNPaHMy?=
 =?utf-8?B?V2xKblhzUU1vUWVUckQwTFZwczc5MXpLU1VuWW5FVEtqSGl6TElOY0FhK1Uw?=
 =?utf-8?B?T1lMYVlQazAvUGFBbklibmkrVU5MUlFwU2pzckkxRXF4aXEwL3MzRE9SRGlm?=
 =?utf-8?B?VVR0Z3hsTmowbU1LSkdvZ2FCSkJ1R2M5V1Z1UmhMdFdXMXNQb3RQL2hJSnU0?=
 =?utf-8?B?UE1SZTZhRDBGekhhQkRzRXBjTUxTaHB1OHVoOGY5RXRTM3l6VzRLZEdaNi9u?=
 =?utf-8?B?ZC9ERmcySVI3cythNXpHYkZhRzAvM3FQUUtXejZsSmh1OHo0a0hDazMxejk3?=
 =?utf-8?B?Q0t4ZlRCN3IzaDhVeUpnUDhkbWFVcEdhM2w2eTFvL0RBUmFvU0xHWjZ5ekZr?=
 =?utf-8?B?R0xpUFQzODVNaHN5WHA3cjhFYmRuQXMxcDJiTVNuUW9HRGk0V1lXbGJtdVNL?=
 =?utf-8?B?bUZKVmNVbldXY2l1MHJFM05aUG51bXJXeTBCT21OS1Q0c1MrcjR0WFd0ZHQy?=
 =?utf-8?B?RGMzYTFaelZZMmVtT2twRVh4VndXby83Wlh5a2wwTnF2WEtNSkJzVFkwUlVp?=
 =?utf-8?B?NDFDb0xvaDhydDVoWHNWdGRnTlFZbWJCNktJWTlEUUF3TWpta2xSZkt5dm43?=
 =?utf-8?B?azdjcVhWNHVGY3l1V2dmeFljS2tWcXVodEZpeXp5MklSS1c2UzlBNlMrcTRr?=
 =?utf-8?B?Q2VLbzRJNmJzK3hmTE5OcVViWGdCZy93V3Fvd2xQRVA4bUdCWGRDMlV4emNQ?=
 =?utf-8?B?cjhzQUY3azgxN1lUeFFuNmNWYTBTS3FuS1FNai90aGFLRnBudmRHNkYvbXNT?=
 =?utf-8?B?ZXFCbHcvRkVkNjJZVU5RYmZMbmQyTUhHaHE2bVNBZlhLVlEzSHQvNHlrVVZy?=
 =?utf-8?B?S3J3ODBad2x4VmJjcDlTaGdmT2xDSnJ0VjE0RlhZWUZoM1QremlCSSsyQWc1?=
 =?utf-8?B?RWNMcUpWY05aMFh3WTZCcGVFMVdlRzRrODJIZk1JQ01CL0puS3BxZ29UWm5V?=
 =?utf-8?B?SzRBM1NZZm40ektOMjBXK21oelFXbkllZmRsTFpnU2NFMlBNMGhRa2ZKbjVT?=
 =?utf-8?B?R0tFcmNFNnMzdUErZmN1cm1UWHkzOTBoVG1aUVZPY3luQTZyMkhKMDZJL0Zv?=
 =?utf-8?B?elplS3gzVVkySVhNM2dRVU1LdXJiWDBVN1JyWG84SDI0SUovRUxlZmgxa2xS?=
 =?utf-8?B?MFN5Qzl2VzdPWXZKQXFFY2VLaUtSNWg0b2Roa2s1TFlzQU52WUMxYzdEOXpI?=
 =?utf-8?B?STRleUFEVWp0Z2NZQ3c2cWNjd1l3WTQyWU9HK1pON1VqdzBTL3J4SUxNNmcy?=
 =?utf-8?Q?4za0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91C6D0246BF4924FB8608340EB64AB12@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd0899e-0484-4d57-6999-08ddf050783a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 09:57:36.1578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bAKlfk4Df/Zhy+cVzqG/CZrebMeMtSxbHNjFXB1rgACYTCRsBa1EMdUXN0rmhm8coJUY9VKfTRZQEh3an2loxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215

T24gMjAyNS84LzI5IDE4OjQxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmksIEF1
ZyAwOCwgMjAyNSBhdCAwNDowMzozNlBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gTVNJIGluaXRpYWxpemF0aW9uIGZhaWxzLCB2UENJIGhpZGVzIHRoZSBjYXBhYmlsaXR5LCBi
dXQNCj4+IHJlbW92aW5nIGhhbmRsZXJzIGFuZCBkYXRhcyB3b24ndCBiZSBwZXJmb3JtZWQgdW50
aWwgdGhlIGRldmljZSBpcw0KPj4gZGVhc3NpZ25lZC4gU28sIGltcGxlbWVudCBNU0kgY2xlYW51
cCBob29rIHRoYXQgd2lsbCBiZSBjYWxsZWQgdG8NCj4+IGNsZWFudXAgTVNJIHJlbGF0ZWQgaGFu
ZGxlcnMgYW5kIGZyZWUgaXQncyBhc3NvY2lhdGVkIGRhdGEgd2hlbg0KPj4gaW5pdGlhbGl6YXRp
b24gZmFpbHMuDQo+Pg0KPj4gU2luY2UgY2xlYW51cCBmdW5jdGlvbiBvZiBNU0kgaXMgaW1wbGVt
ZW50ZWQsIGRlbGV0ZSB0aGUgb3Blbi1jb2RlDQo+PiBpbiB2cGNpX2RlYXNzaWduX2RldmljZSgp
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29t
Pg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4NCj4+IC0tLQ0KPj4gdjEwLT52MTEgY2hhbmdlczoNCj4+ICogQWRkIGhpZGUgcGFyYXRlbWVy
IHRvIGNsZWFudXBfbXNpKCkuDQo+PiAqIENoZWNrIGhpZGUsIGlmIGZhbHNlIHJldHVybiBkaXJl
Y3RseSBpbnN0ZWFkIG9mIGxldHRpbmcgY3RybCBSTy4NCj4+ICogRGVsZXRlIHhmcmVlKHBkZXYt
PnZwY2ktPm1zaSk7IGluIHZwY2lfZGVhc3NpZ25fZGV2aWNlKCkuDQo+PiAqIFJlbW92ZSBSb2dl
cidzIFJldmlld2VkLWJ5IHNpbmNlIHBhdGNoIGNoYW5nZS4NCj4+DQo+PiB2OS0+djEwIGNoYW5n
ZXM6DQo+PiBOby4NCj4+DQo+PiB2OC0+djkgY2hhbmdlczoNCj4+ICogQWRkIFJvZ2VyJ3MgUmV2
aWV3ZWQtYnkuDQo+Pg0KPj4gdjctPnY4IGNoYW5nZXM6DQo+PiAqIEFkZCBhIGNvbW1lbnQgdG8g
ZGVzY3JpYmUgd2h5ICItMiIgaW4gY2xlYW51cF9tc2koKS4NCj4+ICogR2l2ZW4gdGhlIGNvZGUg
aW4gdnBjaV9yZW1vdmVfcmVnaXN0ZXJzKCkgYW4gZXJyb3IgaW4gdGhlIHJlbW92YWwgb2YNCj4+
ICAgcmVnaXN0ZXJzIHdvdWxkIGxpa2VseSBpbXBseSBtZW1vcnkgY29ycnVwdGlvbiwgYXQgd2hp
Y2ggcG9pbnQgaXQncw0KPj4gICBiZXN0IHRvIGZ1bGx5IGRpc2FibGUgdGhlIGRldmljZS4gU28s
IFJvbGxiYWNrIHRoZSBsYXN0IHR3byBtb2RpZmljYXRpb25zIG9mIHY3Lg0KPj4NCj4+IHY2LT52
NyBjaGFuZ2VzOg0KPj4gKiBDaGFuZ2UgdGhlIHBvaW50ZXIgcGFyYW1ldGVyIG9mIGNsZWFudXBf
bXNpKCkgdG8gYmUgY29uc3QuDQo+PiAqIFdoZW4gdnBjaV9yZW1vdmVfcmVnaXN0ZXJzKCkgaW4g
Y2xlYW51cF9tc2koKSBmYWlscywgbm90IHRvIHJldHVybg0KPj4gICBkaXJlY3RseSwgaW5zdGVh
ZCB0cnkgdG8gZnJlZSBtc2kgYW5kIHJlLWFkZCBjdHJsIGhhbmRsZXIuDQo+PiAqIFBhc3MgcGRl
di0+dnBjaSBpbnRvIHZwY2lfYWRkX3JlZ2lzdGVyKCkgaW5zdGVhZCBvZiBwZGV2LT52cGNpLT5t
c2kgaW4NCj4+ICAgaW5pdF9tc2koKSBzaW5jZSB3ZSBuZWVkIHRoYXQgZXZlcnkgaGFuZGxlciBy
ZWFsaXplIHRoYXQgbXNpIGlzIE5VTEwNCj4+ICAgd2hlbiBtc2kgaXMgZnJlZSBidXQgaGFuZGxl
cnMgYXJlIHN0aWxsIGluIHRoZXJlLg0KPj4NCj4+IHY1LT52NiBjaGFuZ2VzOg0KPj4gTm8uDQo+
Pg0KPj4gdjQtPnY1IGNoYW5nZXM6DQo+PiAqIENoYW5nZSBkZWZpbml0aW9uICJzdGF0aWMgdm9p
ZCBjbGVhbnVwX21zaSIgdG8gInN0YXRpYyBpbnQgY2ZfY2hlY2sgY2xlYW51cF9tc2kiDQo+PiAg
IHNpbmNlIGNsZWFudXAgaG9vayBpcyBjaGFuZ2VkIHRvIGJlIGludC4NCj4+ICogQWRkIGEgcmVh
ZC1vbmx5IHJlZ2lzdGVyIGZvciBNU0kgQ29udHJvbCBSZWdpc3RlciBpbiB0aGUgZW5kIG9mIGNs
ZWFudXBfbXNpLg0KPj4NCj4+IHYzLT52NCBjaGFuZ2VzOg0KPj4gKiBDaGFuZ2UgZnVuY3Rpb24g
bmFtZSBmcm9tIGZpbmlfbXNpKCkgdG8gY2xlYW51cF9tc2koKS4NCj4+ICogUmVtb3ZlIHVubmVj
ZXNzYXJ5IGNvbW1lbnQuDQo+PiAqIENoYW5nZSB0byB1c2UgWEZSRUUgdG8gZnJlZSB2cGNpLT5t
c2kuDQo+Pg0KPj4gdjItPnYzIGNoYW5nZXM6DQo+PiAqIFJlbW92ZSBhbGwgZmFpbCBwYXRoLCBh
bmQgdXNlIGZpbmlfbXNpKCkgaG9vayBpbnN0ZWFkLg0KPj4gKiBDaGFuZ2UgdGhlIG1ldGhvZCB0
byBjYWxjdWxhdGluZyB0aGUgc2l6ZSBvZiBtc2kgcmVnaXN0ZXJzLg0KPj4NCj4+IHYxLT52MiBj
aGFuZ2VzOg0KPj4gKiBBZGRlZCBhIG5ldyBmdW5jdGlvbiBmaW5pX21zaSB0byBmcmVlIGFsbCBN
U0kgcmVzb3VyY2VzIGluc3RlYWQgb2YgdXNpbmcgYW4gYXJyYXkNCj4+ICAgdG8gcmVjb3JkIHJl
Z2lzdGVyZWQgcmVnaXN0ZXJzLg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IEppcWlhbiBDaGVu
Lg0KPj4gLS0tDQo+PiAgeGVuL2RyaXZlcnMvdnBjaS9tc2kuYyAgfCA0OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5j
IHwgIDEgLQ0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9tc2kuYyBiL3hlbi9k
cml2ZXJzL3ZwY2kvbXNpLmMNCj4+IGluZGV4IGMzZWJhNGUxNDg3MC4uNmFiNDViOWJhNjU1IDEw
MDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9tc2kuYw0KPj4gKysrIGIveGVuL2RyaXZl
cnMvdnBjaS9tc2kuYw0KPj4gQEAgLTE5Myw2ICsxOTMsNTMgQEAgc3RhdGljIHZvaWQgY2ZfY2hl
Y2sgbWFza193cml0ZSgNCj4+ICAgICAgbXNpLT5tYXNrID0gdmFsOw0KPj4gIH0NCj4+ICANCj4+
ICtzdGF0aWMgaW50IGNmX2NoZWNrIGNsZWFudXBfbXNpKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCBib29sIGhpZGUpDQo+PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArICAgIHVuc2lnbmVk
IGludCBlbmQ7DQo+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+dnBjaTsNCj4+ICsg
ICAgY29uc3QgdW5zaWduZWQgaW50IG1zaV9wb3MgPSBwZGV2LT5tc2lfcG9zOw0KPj4gKyAgICBj
b25zdCB1bnNpZ25lZCBpbnQgY3RybCA9IG1zaV9jb250cm9sX3JlZyhtc2lfcG9zKTsNCj4+ICsN
Cj4+ICsgICAgaWYgKCAhbXNpX3BvcyB8fCAhdnBjaS0+bXNpICkNCj4+ICsgICAgICAgIHJldHVy
biAwOw0KPiANCj4gSSdtIGFmcmFpZCB0aGUgYWJvdmUgaXMgbm90IGNvcnJlY3QsIGV2ZW4gaWYg
dnBjaS0+bXNpID09IE5VTEwgd2UNCj4gc3RpbGwgd2FudCB0byBoaWRlIHRoZSBjYXBhYmlsaXR5
IHdoZW4gcmVxdWVzdGVkIHRvIGRvIHNvLCB0aGF0IHdvdWxkDQo+IGJlIHRoZSBjYXNlIGlmIHRo
ZSBtZW1vcnkgYWxsb2Mgb2YgdnBjaS0+bXNpIGZhaWxzIGluIGluaXRfbXNpKCkuDQo+IA0KPiBU
aGlzIHNob3VsZCBiZToNCj4gDQo+IGlmICggIW1zaV9wb3MgKQ0KPiB7DQo+ICAgICBBU1NFUlRf
VU5SRUFDSEFCTEUoKTsNCj4gICAgIHJldHVybiAwOw0KPiB9DQo+IA0KPiBpZiAoICFoaWRlICkN
Cj4gew0KPiAgICAgWEZSRUUodnBjaS0+bXNpKTsNCj4gICAgIHJldHVybiAwOw0KPiB9DQpXaWxs
IGNoYW5nZS4NCg0KPiANCj4gDQo+IA0KPj4gKw0KPj4gKyAgICBpZiAoIHZwY2ktPm1zaS0+bWFz
a2luZyApDQo+IA0KPiBZb3UgY2Fubm90IGFzc3VtZSB0aGF0IG1hc2tpbmcgaGFzIGJlZW4gY29y
cmVjdGx5IHNldCwgZGVwZW5kaW5nIG9uDQo+IHdoZXJlIGluaXRfbXNpKCkgZmFpbHMgbWFza2lu
ZyB3aWxsIGJlIHVuaW5pdGlhbGl6ZWQsIHNhbWUgd2l0aA0KPiBhZGRyZXNzNjQuDQo+IA0KPiBJ
IHRoaW5rIHRoZSBsb2dpYyB3b3VsZCBzdGlsbCBiZSBjb3JyZWN0LCBiZWNhdXNlIGlmIC0+bWFz
a2luZyBhbmQNCj4gLT5hZGRyZXNzNjQgaXMgbm90IGluaXRpYWxpemVkIHRoZSByZWdpc3RlciBo
YW5kbGVycyB3b24ndCBiZSBzZXR1cA0KPiBlaXRoZXIsIGJ1dCBmZWVscyBmcmFnaWxlLiAgSWRl
YWxseSBjbGVhbnVwX21zaSgpIHNob3VsZG4ndCB1c2UgdGhlDQo+IGNvbnRlbnRzIG9mIHZwY2kt
Pm1zaSwgYmVjYXVzZSB0aGV5IGFyZSBsaWtlbHkgbm90IHByb3Blcmx5DQo+IGluaXRpYWxpemVk
Lg0KV291bGQgaXQgYmV0dGVyIHRvIGNoYW5nZSB0byBnZXQgbWFzayBhbmQgYWRkcmVzczY0IGlu
Zm8gZnJvbSBoYXJkd2FyZSBjdHJsIHJlZ2lzdGVyIG9mIG1zaSB3aGVuIHZwY2ktPm1zaSBpcyBu
b3QgTlVMTD8NCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpK
aXFpYW4gQ2hlbi4NCg0K


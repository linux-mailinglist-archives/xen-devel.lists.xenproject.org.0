Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF463A601E4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 21:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913475.1319505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoor-0001Z6-7v; Thu, 13 Mar 2025 20:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913475.1319505; Thu, 13 Mar 2025 20:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoor-0001Wj-4t; Thu, 13 Mar 2025 20:06:17 +0000
Received: by outflank-mailman (input) for mailman id 913475;
 Thu, 13 Mar 2025 20:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfkQ=WA=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1tsoop-0001Wd-OW
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 20:06:15 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0613.outbound.protection.office365.us
 [2001:489a:2202:c::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b94e5c2-0046-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 21:06:12 +0100 (CET)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by SA1P110MB2265.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:167::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.37; Thu, 13 Mar
 2025 20:06:08 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%4]) with mapi id 15.20.8489.035; Thu, 13 Mar 2025
 20:06:07 +0000
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
X-Inumbo-ID: 9b94e5c2-0046-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=AdHSgkktNRtCObOWQqXJ7sIw7EaItlk/CMafoTEzGZGpO4+xKgT7i7UZrBMqURc9KE9lButrZENXx8RwLCUheNxIUWCn3Kfek9BCGnoAaPJ82J33IK6wFU7J+n4FczZvaNuxapnArvzZ4bXVpk3SEr/Yp7W20ROhStZBDvSYu+Fx4/9INHdfNl8TA5XsfaGpc5ZKtyJsyORYzwaC4XGdl2X9mEB/LZVVqMxWvhd0E2QLPFI+ErSnVeHUhlYb6DL+V4uqjwMrofi2+MS0BP84pE693vZW9AjqMRnpE7feK02+YEa6OYKo6YvhYGfJU8b9MHLsq2HfLUMXSpJFmO9S8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6HixeUQc8ew+vO1YJOtKqDcUNesmYML9qW6m1pm7YE=;
 b=J1UUfTWvehOe3QAe3LJwqDui/UMErcWbOBCB55iXkkvyMekhGp1nLuX6427/vxHH+UlkpIu5UNGd0WGByBl9FXwqffgeCHnWYf13C19BTO4E/Kzsm5ZKS0PdX/8+dNsxXFSzDdB8KFsMhTMl9hr6YLdkPIYBw+bbkheWe0xN/lsjAdS6y8M2Z0TUbLAmYpW5MbUQ9JX9irIbbsfmbcYlJWLF15zxyN1Tr+bQocOBqEmaK50YV2bffbd6MS1v6G8T2H764TMJDybclCsbHtvnDhJvH2ovTOFzxpXKUnrsGf475isOqC7hSKzhJ6/CQSQaw1wq1K9LVjjsg+aTacI8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6HixeUQc8ew+vO1YJOtKqDcUNesmYML9qW6m1pm7YE=;
 b=cAClS7HGObhEk2DiRzZSPradZAXMmNqKh4rpFx4A6N4fty1OmHCFJaI47SITmdz7oJ8xPRr97ChG21SeFndJbQPSYN68oks41wtN3Rb8n2n+f111VDhF/0renBttEexN6UwRRtx+9+LTJNjePfk7AjltnOozh09aKvLtraNdzI60r4uiMxZBOKQbO6twZ172UpRTNPDuWK/m1nfOD0qyMPWY/5uYPhCE2nBIT1l3Y/EaapEborZ5Njoz7/ZY6rvESueey/LpNaZAl6NeavORrkXatZ7SqY+tUAOIQBlPLHIW9UJmfg8T74bjSP/eryrjg6pHA3RjzkBRnP6hb46YCg==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, xen-devel <xen-devel@dornerworks.com>, Jeff
 Kubascik <Jeff.Kubascik@dornerworks.com>
CC: Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>, Choi Anderson <Anderson.Choi@boeing.com>
Subject: RE: [PATCH] xen/sched: fix arinc653 to not use variables across
 cpupools
Thread-Topic: [PATCH] xen/sched: fix arinc653 to not use variables across
 cpupools
Thread-Index: AQHbk/rJLC8kkmZ6m0etj3YPTyi7AbNw8nsAgACI0dA=
Date: Thu, 13 Mar 2025 20:06:07 +0000
Message-ID:
 <SA1P110MB1629ABA437E47DA887CA5FCEF4D3A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References: <20250313093157.30450-1-jgross@suse.com>
 <8655362d-4019-4dca-b232-5adeb13c3ac1@citrix.com>
In-Reply-To: <8655362d-4019-4dca-b232-5adeb13c3ac1@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|SA1P110MB2265:EE_
x-ms-office365-filtering-correlation-id: d89ba5c7-775e-4ee4-19fc-08dd626a7deb
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Znl5U05vMWpyeWt5UGJFQTNWUGxlQmVJRWx5ZHBwNVduSXdIeWhzYWRyK05J?=
 =?utf-8?B?a3dFdWpIWmI2bHl4ckJmeHR4Zk55K0JrNXBreU9LenY1WXFkK3dzK05CRlBy?=
 =?utf-8?B?SGF3YUR1Q1cyVkpWR3QwTUt3RzQ1cThhakhDMlZSYkVVQ0ZBR0llRk52dHdP?=
 =?utf-8?B?RmtjNjZSRjhmUXdMTmFzcVpvT0k0K1c3Y1BPMmoxSVl6Q2pqaVFlb0Nablpa?=
 =?utf-8?B?R2F2anJKMlc4bzdNanJnSitrTEdnUG9LT05RNzcyVXpjemt2OVk3S0VVWmhD?=
 =?utf-8?B?YUJVemQ4Tmp5eWcrbUFQazhseU9yeE5jbUdwS1c1MFVMeFZ5OHhwTFI1d0ps?=
 =?utf-8?B?VGlqcHhrT0JpK0tLckVWY05Rd01IN3VRVlg3TCtNL3BHVWNUL1RnQ1Ftdjc3?=
 =?utf-8?B?WkFJZUdTeVFHRkRRUXhSRU5DU29td1VNdE1tM0VrVmRlRVpGdVBDMmZrVmFY?=
 =?utf-8?B?UllLT09IME82NWl1Y2oxVEVYRnRYZXNRNFNPaGJYVXZoVDcrYkt2Qko5WjBX?=
 =?utf-8?B?L0N2d2RwcTJSaTRHSVVBSnRCT3dTSzhuSmpuWU9qZ2tlYy9jeWJybGJLNUw3?=
 =?utf-8?B?NmdvVklhdWFCZ2kwRXM4ZzhGMHQvbEswbVJyS0lRajVvWkhEOGVKaDVRS1Z5?=
 =?utf-8?B?eDA4akg2VGdOMDNyWUJPRFNPTEdpNmc2TE05d0xpdDBzVjhKWkh1SFlFVHg0?=
 =?utf-8?B?WitzSWRJLzR5VEh0bXRHdnZzSUJYcXgxL3hvR3dUNFBZYVM2MHl5azhzZkh4?=
 =?utf-8?B?QzQzcjB6UFVSVmZRbjVDTStoa1pFWnNtZm4wdFZSamlDYytWaFZMTDFqeThR?=
 =?utf-8?B?dU54S1dlY2pBOHFtR0VkMlc3Vk5TamZEajYzRWNoV3VicGtVT2hwWm1sSzVC?=
 =?utf-8?B?aWE2TW5TS2ZGWEVxU1RLQnlvZldJWW9ybEJ6bmpYTHM1SmhrZE5EM1pJM2pN?=
 =?utf-8?B?cXNtdTJML0FGek9uand5UGFraENITFQ3VWlJbGs4L3R1emZacjlKWXV3eFZq?=
 =?utf-8?B?ZFduTkJ6Ym10cThpb3BGSlAyeEhXWHc4WmljVTlOZENiT2Z6MDJUN0s2VFJz?=
 =?utf-8?B?OTNzbkk1eHhnYW9qalg5UTBDZm1iRFVpWE8rS0NXTkZGUVJSYzhDOHlaRlAv?=
 =?utf-8?B?N1NrVUx6NTVhUS91cFhJNnpKVWNJSDNqNkhxK2s3WWJCL29PNHd1YnBwd1VU?=
 =?utf-8?B?M1J0RFp3b09xeXFORWNvZkorck1tL2M5L29mZkFqNlV1UjlIV0drRE5wMHY5?=
 =?utf-8?B?Y0k0ZnFVeXVhcHBXOWk4SjA4bUFFWDV4dzB3Z1BucXo5YUhKYVMxUVFibCtF?=
 =?utf-8?B?bWpJeWJ2c0dEbkVycThaeU1zaE9vVStjQWtqVlVIcElGQmlJcWJYLzJLVG9w?=
 =?utf-8?B?VndxaG5zVXBUSEgrT3BVM2pIUE00T2RWN25GUVBHQXFiKzhzOTk1WFk5NkQ5?=
 =?utf-8?B?bFB4aHUybS9iUmRJdXp2MWVtZURLRXRMdWcvd2NpZXhGcGE4S2xrNFUramFr?=
 =?utf-8?B?VWhLYzZkSFJJeTd5QlJYa3lDMjludktCaEs2Y0F0aVdwaHRHQXg2TzJEUXkx?=
 =?utf-8?B?Q0VuQUdWd29ydWZEeGhRSHQ2YTg1NUFDU3RMNFdIT2swUlpOekQ5Y2toUzlY?=
 =?utf-8?B?QXdBUkFlQmdxVWIzMFNOWmZ2Y3lpSDFIeEwzL1hSaGZkWEhYdnIxQ3VCeHZn?=
 =?utf-8?B?djZHWkhrb0FUTnZiOU9xaEJnKzAzUG9XT21zYWlIL3lOT25DZWV2SlpURU85?=
 =?utf-8?B?UnBlWmc2VXBySXhuazJzeC8rcVhCaFVsbkJPM1U4TjU3SUliNkRTZE01QnVp?=
 =?utf-8?B?SzhveEpxQkl5aGdWSThPVUdPQk5BR1JDdFlqRVVIbE90NTZ0UHU3QVRFbkZi?=
 =?utf-8?B?OERQYk5CQW1KeURLYTFKR055WDUvT05pVmw5SHdWTE5IbFNKN3RzcGFnT0Fo?=
 =?utf-8?Q?9k+ce5uOUZl8FSEFQ8Xb1qElk8adws+G?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nmc5RjhLaHZReGtZTVF4YVgrcnZlVkZpdjl0RjcvYkZJK1ptTVVYYWZkMjg1?=
 =?utf-8?B?OVZySGszUWdxakxZSEY0SDJFelpabWZ2d2NmQ2JsdEZjbUFSaVA0TDFMcUx0?=
 =?utf-8?B?dnVoVlBFY2ZZNjFVbjRZS2diN2dFUjdGV0d2SGVXeHljdWhOMnVKd2RMNnk0?=
 =?utf-8?B?VUZVakpYTjBxYkVMeFU3N25hQ3FJTHV1ZEo0L0w1NC9JbFI4SHhFakkwZmZz?=
 =?utf-8?B?NTFZWnBBQmNMN0F1Z0J3UGlJTkxkZEZNeVYyZWVKam9HNC9EcFFmZ25UUzRq?=
 =?utf-8?B?RG1Vb0hMcGsrajhOc3hjRmMrUFBZZnZKVUhQeWZTNUI3MWF5ejNHbXV1Sk5M?=
 =?utf-8?B?QkNHVllaVlcxM0VXRmpXYTlONi9hZDF5Q25mdlgyWmJUcFI2cElJQTJlNFE1?=
 =?utf-8?B?Qm5XbjBna1B5UklIVng5VUhjVEdZdHg3WGZMUCsyelQ4R2VCY3lKdWRrY0Js?=
 =?utf-8?B?a0pKNm5XYStDcS9ZUEFtQllDTDhRUDhTYmpvMW1ZOUVKc3BId0JVNm1QS3RI?=
 =?utf-8?B?UkZaR0ZESHBaL01qL3JKUTFLVmtUQ1dqMUFkNjRUWFpwT3VpajhDdmYxK0Rx?=
 =?utf-8?B?ckw5TTUrY2pWZ3dDbER6SE9JRmIwN0lueEdlenJYT1hzUjJJTlphUzQ3cWll?=
 =?utf-8?B?NDdaeVJrYW84Yjg0eGhzdDhkbGdvd011QkltWnpMZHNFSHl3YlV6eFFobUdO?=
 =?utf-8?B?VTB3QWRQYm9lTVBVRU8vdGdiWktJOUljU3UvaU11NGZUMWxwZXBrc0loajBK?=
 =?utf-8?B?Q3k3MW5udi8ycEE4eTQrSHVaaW95QTZaVGNmckhpUk80c3p4dFFBaHR2U2lF?=
 =?utf-8?B?YzY3M2E0RXlDanlWMmZqWlAzd3FaNlJTenVrb3YvRGpPS1pFK3MvQmtQZlFE?=
 =?utf-8?B?NFg3ZStrenErZGFIbzEvZkxKQ3hBYUcybGxsQ1JjVDN6U2RCeitRVVl6UFBN?=
 =?utf-8?B?UVBtWDEwcjlIckxIdWM3cUFhSE1ZeGxGMm1tVVVpYVdON1pnMXg1N3k5YzEr?=
 =?utf-8?B?MExGNG1PKy9uZ0VTNzAwL3VDRzNiK3RZY3ZHb1RrNDl3L1pnMnpvYkRLYjF3?=
 =?utf-8?B?ZG1LVjBGcDBTanNORkYwdE5WUnY2OVBMV2k0YnFIajFVN3FJT3kxY3duWEcw?=
 =?utf-8?B?bERGbTJFbkVCcWNKdHlyWVZ1Tzc4WDJQMWZiazgzekxQSjZQbXVmaHpwUWhv?=
 =?utf-8?B?NHY2VDd2WkJMZGsrWE9kb09uZ2lzZUtTenpEaHFCbzJPVDZZMXpBek9wVlhI?=
 =?utf-8?B?VjVxU1AyS3lmZGxJWWRtWUQ4R0F2YWhsUmxvOGR4MC93MUViMitWQ1I0ZGFX?=
 =?utf-8?B?elp3M3FXTi9UQ0w4TGtMbHhYZ0xPZGxXeEtUT284YzJqRnEydFg3MDNZTWp3?=
 =?utf-8?B?dzRsUUtEbmtWbXFjRE05UW82WGRRMU1wYm1xM3E2MVk3S2hQRUdGU3pMTFF5?=
 =?utf-8?B?QUlEajVrbWVpbmw0cldMWUxDVFlrU0tncVZrUEkwcHZrMm9ZUUc5Smo5dnlO?=
 =?utf-8?B?bzZ1bHNiQTdOYXBhcm1renNTNUY0QUxSOWV1R3BZMTh6YVdoTG5tR3B3eHVK?=
 =?utf-8?B?STY2VDN6T05SNGtWMlZXNFQwOXV4Qk5pOXk0U0lpUG9rajJERmRJbTJFK2JJ?=
 =?utf-8?B?RHcwdlV2SmhGa0dYUmdsRjUvbUtlbE9zU2xXOTkvWXBxVU9MdldYTE8yRUcy?=
 =?utf-8?B?ZnRhbTVkMGVCK3VoNEZ3dWZ2eDFqb2FRNW1BdUdUOGg2d3Fjb2c3TmkrdXEz?=
 =?utf-8?B?KzZNaHhDT3ZlVStvVFMxNGhGY0RRbGFxSkpIMXVPa1V2THRnZnNLMSs0ZkJZ?=
 =?utf-8?B?NVFpbk80QUJhaG9haEswWkVMTitoMnlRYkVUSzFnODFJL01XSUpWanM5Ykdl?=
 =?utf-8?B?eEp2U3NUa0VIeDRtM1Azajh4UXNRMU1pSlF6NlJuRytNNjcrdDIyRGk2azgx?=
 =?utf-8?B?Tlh6OVVzTTRBOW96RTRNOVpFVTJKVnFNYXZyMDkxWExEWHVZUE5OOGNzalE4?=
 =?utf-8?B?NnhueXp4dXUxQ2J6dnIwSFBkajRQMXorL2kycVI2NkdqSzZBR0lvTEpSdHd2?=
 =?utf-8?Q?WWvEtm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d89ba5c7-775e-4ee4-19fc-08dd626a7deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 20:06:07.4836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB2265

K0plZmYNCg0KT24gMTMvMDMvMjUgMDc6NDQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEz
LzAzLzIwMjUgOTozMSBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gPiBhNjUzc2NoZWRfZG9f
c2NoZWR1bGUoKSBpcyB1c2luZyB0d28gZnVuY3Rpb24gbG9jYWwgc3RhdGljIHZhcmlhYmxlcywN
Cj4gPiB3aGljaCBpcyByZXN1bHRpbmcgaW4gYmFkIGJlaGF2aW9yIHdoZW4gdXNpbmcgbW9yZSB0
aGFuIG9uZSBjcHVwb29sDQo+ID4gd2l0aCB0aGUgYXJpbmM2NTMgc2NoZWR1bGVyLg0KPiA+DQo+
ID4gRml4IHRoYXQgYnkgbW92aW5nIHRob3NlIHZhcmlhYmxlcyB0byB0aGUgc2NoZWR1bGVyIHBy
aXZhdGUgZGF0YS4NCj4gPg0KPiA+IEZpeGVzOiAyMjc4N2YyZTEwN2MgKCJBUklOQyA2NTMgc2No
ZWR1bGVyIikNCj4gPiBSZXBvcnRlZC1ieTogQ2hvaSBBbmRlcnNvbiA8QW5kZXJzb24uQ2hvaUBi
b2VpbmcuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCj4gDQo+IE9oIGxvdmVseSwgdGhvc2Ugc3RhdGljcyBhcmUgbmljZWx5IGhpZGRlbiBp
biB0aGUgbG9jYWwgdmFyaWFibGUgbGlzdC4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpUaGlzIHdhcyBvbmUgb2YgdGhlIGlz
c3VlcyBKZWZmIGZpeGVkIGluIHRoaXMgcmVqZWN0ZWQgcGF0Y2gsIHdoaWNoIHdlIHNob3VsZCBo
YXZlIHNwbGl0IG91dCBhbmQgc3VibWl0dGVkIHNlcGFyYXRlbHkgdXBzdHJlYW06ICBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjAtMDkvbXNn
MDEzMTguaHRtbA0KDQpBY2tlZC1ieTogTmF0aGFuIFN0dWRlciA8bmF0aGFuLnN0dWRlckBkb3Ju
ZXJ3b3Jrcy5jb20+DQo=


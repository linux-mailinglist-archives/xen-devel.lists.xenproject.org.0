Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2814C65AA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 10:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280264.478138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcJS-0004Zc-5k; Mon, 28 Feb 2022 09:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280264.478138; Mon, 28 Feb 2022 09:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcJS-0004Xg-2M; Mon, 28 Feb 2022 09:27:26 +0000
Received: by outflank-mailman (input) for mailman id 280264;
 Mon, 28 Feb 2022 09:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oRDO=TL=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nOcJQ-0004Xa-KO
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 09:27:24 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe06::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a23f3363-9878-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 10:27:23 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8878.eurprd04.prod.outlook.com (2603:10a6:102:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 09:27:21 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Mon, 28 Feb 2022
 09:27:21 +0000
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
X-Inumbo-ID: a23f3363-9878-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKaB+L5xGNTzw+2XatZXHvvX42bz9+W49jqRjurSuhAzJlW7kv46njEYU41sxKtp1Tt5XLYa65LGFtWb9eZ3xspUZdJRnhCPQDXsscWNYg0v2KC2/YY1j0kF7y6LXbFX9hWwdvAlmSC/+BLcmGGcjR55Jl/mRhufh5Ye4StKB5I21U35Zz044GMBKGZByuKZHzF11clj+frULgTgqdshAoKA2sgjw0vOdFs+XJ5CwnZkcgJ37qSQYEXuRbsuIMGvgqlJ9R5fJK0RQNw1PdJEBBH0NfWdOv4zyZ9cZwXDpJeBo2Y1+q88/VinqrJm90HQX2oF2KYlW+UUMExxmxCWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkAF/lKm2202ZxLaHYCWL2EGRF1rrx+Yawu3jgIjuw8=;
 b=L6iAUOI3dyBJGd8uNQpCUUWI7G5KPFwGlrEobKzOdCQu7FSt0u3jtmHJKSyOaCO4y1rVYpzU005JJpdO8otag4wBkkg5Z3UHG0SshSBuMhfcY9jVVGtUSGRK883hUw67T9RyZYHweOEc9vRY+/J43x8ziUStfmqjhzELWoS1+a4gJu1knvVQUnUX0WED0ChUZYHfaX4ZMmtYjLXkMBAW9Ccb2EwCscNt1ntNOoO+jGTDFMqeODKeG8f5wFrSVfmZLtqQjBGR7VYJr+ZsV5MG6RXIZZmw2faWu0Czec3SLyojh0pwRzv618wuaKUg3SR6Iu0JuFNsgGKU2Qsy/vIvcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkAF/lKm2202ZxLaHYCWL2EGRF1rrx+Yawu3jgIjuw8=;
 b=KEkrNHKm2egh9q0taquRrfjLLHGyjLA8yeFqb+M4hA7YdILeIg5/2Jsj3OjoTLBRqJ8fWXn6ebHIiW4MSt9IS18htTD51ERlEaxp8VUa5hkycNz2qvF+REkzT+cmfXacfF6no0rkdJsn0Smw3DqgiuOjp+lukJqvngNBJfBQq1Q=
From: Peng Fan <peng.fan@nxp.com>
To: Julien Grall <julien@xen.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"van.freenix@gmail.com" <van.freenix@gmail.com>
Subject: RE: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
Thread-Topic: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
Thread-Index: AQHYLDnx328AZbWyq02DiYDlO7tvpKyosDCAgAAA+dA=
Date: Mon, 28 Feb 2022 09:27:21 +0000
Message-ID:
 <DU0PR04MB94177B6A7BC34EA6590FF37B88019@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-2-peng.fan@oss.nxp.com>
 <16bef21e-42b3-c271-81ab-1d87453a0fdb@xen.org>
In-Reply-To: <16bef21e-42b3-c271-81ab-1d87453a0fdb@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20c05cca-ee7d-48b4-3614-08d9fa9c85bd
x-ms-traffictypediagnostic: PAXPR04MB8878:EE_
x-microsoft-antispam-prvs:
 <PAXPR04MB8878F1DBA6656C92BC04E0C088019@PAXPR04MB8878.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 agCmE55MEYyk/+yYgR2QxgJ3BT59pNOhZGqEGreU6sve1hBXS7t2opLDjVfj+EtkrvRVrG/QclcnAz5cfq1x+ahyIv/Z4oTAbGytEDvEsVNGUIuZkLcf6Ab3RxcWlHKSZ/r002oQL7I37k/LQPTWugZsyw1jA1KtJVFOAxxnfnAkPbeEHrP/IdYrbLHHfFsXIaj5JHY5IXhCc546MYPp46saL3nuyVbhUeUy5AT5RDVmzDs4U457SA/PaW5SrjyDIBSltT7ISxmCzHsNxqKC7ZQIE1ojsMOvoWI5gjp1lJphgc3hqhx5tcnynApbL0dAtc/h/JYN4rcJgr9zAAbBHrtUlXGZ7jbVdyaY+cFXMnSNyqQYOnaSc4okR2uSPG1QWcRQh0uksEZWvi6Vfx6MW3DaATRFO7naLVc+FcGPQwuxbrmPGIbjx/kwsvZZJCIZRGgjGfgfvRHgEXokMI0CBfv/Lw4vOcDKiEV1vmiXUieLER+d5b9an8xBqVnFYOsPk/ZphIV7pAHw1iOgCPUznsYpGBaxVUs2YUTPzpxte7o2YPGeM48i69ovpqFUuC1FDgZ01dF9eL5R0vWvqyGnXHXfkj58iEGy8oEuJTGw8P2k/SLiGxg3pFANqgPo0shhHdKyMq/5KFk0xlphwIXeZSfaKKdhrvVMUdjYuDI5eAg9Xc4chuehQhe7HegfUBtS4breJQjZm909/BoHV6QEuwXVae6FhOxcJJTLzxsoQPNdn7dnFp71anqk52DxbzGpCzUBSpFean7tnmeZi/tn3nWI2K3zB1920NpDKZZw0Csv6mVc6IN13FMGtUc5KE99LLIz0US6akU8rXnud4wNPg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(64756008)(966005)(508600001)(71200400001)(55016003)(122000001)(8676002)(4326008)(38070700005)(76116006)(66476007)(54906003)(110136005)(53546011)(6506007)(26005)(2906002)(9686003)(7696005)(186003)(7416002)(86362001)(5660300002)(316002)(66446008)(38100700002)(8936002)(33656002)(44832011)(4744005)(83380400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVdmT1JYM1BZckJBQnBQdHlFZm56NC9qckd2dnV5NFVyWW80MGZZZGZGelE2?=
 =?utf-8?B?MU9VYlRkRGNmeGN2MStFMUt0VXJSZ2EwR3VZTEpwNUpqSXBKMVhRcWR6Y2FZ?=
 =?utf-8?B?RnlRWlA3QWtnd0dkV3lsUEhDaW9RQU5OY3ZCU1g4WHFJeVcwZGRhQ0FpRWF2?=
 =?utf-8?B?ZWE4NmU1RDY3QlNYbnI3SEdOOExOSzdZUWJ2MEpKZFBvRHNzcWxSN3I5aHNG?=
 =?utf-8?B?MCtEYndJeDZaMHREbVRXalp1Tk9wVzYwUUIwOVhEa1Zib2NCV1h5S0pzck9O?=
 =?utf-8?B?THY0YThYRGJFWlRwTHY5THBTRDVMTFB0VjNEVmVCZWlFeVkwTUpPZFAyb1Fz?=
 =?utf-8?B?Wnl0RmFmaGQ3UEFucHB3OXN4b0xEWXc1Ylp4bXR0Ykd0SFp0SHFoWjZDcHhk?=
 =?utf-8?B?NVZrU2lXblRoU1A4OUJMWko3a0pQcnEvUW5yRjh4SlRxNS96RHlWR0haeXRw?=
 =?utf-8?B?VThCdks4SnlZaVBwUHVmcW94bjJQaW9jamVxNnBZeDByUVFjd1poeFhDcmxo?=
 =?utf-8?B?c3A3dzM3Zkt3cEdHV3dZVlcwdkpkY2tMTzhnY0p2c2dzYjNGSFNMWHk1RWpW?=
 =?utf-8?B?cHRtL0Nndm9QQ0NwTHpzNnR0MWRBbXhkNGhKbHRVN0NtZmpWNk5GNWQ2VU5n?=
 =?utf-8?B?emY3dCtYN1JlRzMwMzB5YVdoTDJodENoOFlVNXRXeUZVZW5RZzhpdENQR2dh?=
 =?utf-8?B?T1lUSmpzc285SmU0RUxNd1FTVVJtV0orTzROUi9vVWQ3MVBWRUtUVzB1THVM?=
 =?utf-8?B?TVl4dmphVXY1ejBEcWhEY1FvUGt2dDNOaFhLVkN3TVJWdmJ1MzVDNzUyb3Y4?=
 =?utf-8?B?cTludUx5RSttclNGdmo4bmRsZlZLMEtRc0JHZHZoVHBGYmVhQUo1ck94Si9D?=
 =?utf-8?B?RWIvUU44Ymxua0R5UGF5R0RhL05XdTQySldpSWtraFdHMTBjN3JVUVoybGta?=
 =?utf-8?B?Z0dUOUNSQVkzVzRPWWNmK0hjczdmNUEvOHROeGh5alJuSHk4cWRKK09Rajda?=
 =?utf-8?B?S3VzYnh6cWREM0FIdDhIZU5SbUVOYUFSWlpLUkU1YXdsMUgvZGgrL1ZFY1cy?=
 =?utf-8?B?Zm02NkxIdXh0Y2EvRDhFcWducTRlWktQb3BVOUhlaHZBQStHZ1ZvVHNabnRW?=
 =?utf-8?B?WEo2T1pISFAwZzNWQmw4STN3UE50QlBVUk94UEdSUWZ3TlRweDdGT2VwM3cr?=
 =?utf-8?B?M29iLzVxS1Era0JoT2lnaEtWVGpKQ2xYREZ0VFNlYXdDK3UxMmplTDVNT1ZC?=
 =?utf-8?B?RzBNc1J1Z0Q5dmY0a21Sbi9RSHI2bEcwcER6OWYxc2lnTEM1Z29PWkQ2SDZ1?=
 =?utf-8?B?NFd5eDRiM0FmQy9PWjlrdktTd0dXNzlQK3NrY0VidVk1eFpoL3drbHhYZGxY?=
 =?utf-8?B?RE9rMXBzblM5VDlBMUd4SldVclN4SHhEcmpndWhHRnI3MlpWZjJkM21pSURT?=
 =?utf-8?B?ZXhhUWJSQXEvOURGeDBIL2QwUWEzM3Jma2o3Z3ViYTFhV09tSGJQOC9VWk9W?=
 =?utf-8?B?d2JjMGI4V2lXdSsxN3hFaCtPOUNnZ3IvbXlmVStIVUZtbVk3MzQ4b3pDZW03?=
 =?utf-8?B?Qi85YzV4SzBCUnB2T3ViT3BmZWd2VDRRK3FVQ2RRZ1hrVTlIdDBVeXJISks3?=
 =?utf-8?B?VVg3NjI5L1lGUjZSYldzYXhVTzBBc3luMm1US1ZSUko1enA1MlppUm1NeGFM?=
 =?utf-8?B?MjVIRndjZHM4NDNnNTJmSmxnNmJrOTRCVWFjVGVyUklVcjV4NWhuaVRmYkRk?=
 =?utf-8?B?QUhSSDVwTDFyYUlDcG90UlhHT1U5OFZ2VmJkRjBIcnJmemE4bERqd0g5eTBW?=
 =?utf-8?B?RVRIa2FJc0J3S2hXM01RK25MWng5NURubGJMQVZoL3pYKzNFWUVGQTc5ZjBO?=
 =?utf-8?B?VHRHcEl1elNSUnd2WjhncFU4S1lJV3BtUFcrVlhZbWJyTS9QcFU3eVpVT0lM?=
 =?utf-8?B?bTJ5Uk44ZzdTNUxNUklSVEJTUzNDN2NqVWpPSVFSdzZiNTJkQUkzUlNUb1NL?=
 =?utf-8?B?UXdtR1J6MmpkNDFwQjAxdEo4c3krVUNMK3JOVXdrUThaVEszeTkzeTNJWGpW?=
 =?utf-8?B?Y2RES1BqUkVSTXJ1Q0VDWnFkV3pVL2hVVmFublIrNEZSODBYVU9XRll1bkc0?=
 =?utf-8?B?UTJvMy9XNUdaL0Q0ZjBMQjYzVEhWY1BIQnNJVE1XdWs4UzhTbnlDUXh3WVJv?=
 =?utf-8?Q?fjsnxQi4hlTD1AP29UamG4c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c05cca-ee7d-48b4-3614-08d9fa9c85bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 09:27:21.4310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +HuHj2x3kHTZrx6BVOg0C65TTdUL7DO+w9FSQfUmEP15sSP+QljIk9MThX3n+HOggBeaCMTQbgssEZxGlPadKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8878

SGkgSnVsaWVuLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSB4ZW4vYXJtOiBBZGQgaS5N
WCBscHVhcnQgZHJpdmVyDQo+IA0KPiBIaSBQZW5nLA0KPiANCj4gT24gMjgvMDIvMjAyMiAwMTow
NywgUGVuZyBGYW4gKE9TUykgd3JvdGU6DQo+ID4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54
cC5jb20+DQo+IA0KPiBDYW4geW91IGdpdmUgbWUgYSBsaW5rIHRvIHRoZSBzcGVjaWZpY2F0aW9u
IGFuZC9vciBhIHNpbWlsYXIgZHJpdmVyIGluIExpbnV4Pw0KDQpodHRwczovL3d3dy5ueHAuY29t
L3dlYmFwcC9Eb3dubG9hZD9jb2xDb2RlPUlNWDhRTUlFQyANCkNoYXRwZXIgMTMuNiBMb3cgUG93
ZXIgVW5pdmVyc2FsIEFzeW5jaHJvbm91cyBSZWNlaXZlci8NClRyYW5zbWl0dGVyIChMUFVBUlQp
DQpCdXQgdGhpcyByZXF1aXJlcyByZWdpc3RyYXRpb24gdG8gYWNjZXNzLg0KDQpMaW51eCBkcml2
ZXI6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3R0eS9zZXJpYWwvZnNsX2xwdWFydC5jDQoNCg0K
VGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gVGhpcyB3b3VsZCBoZWxwIHRvIHJldmlldyB0aGlzIHBh
dGNoLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=


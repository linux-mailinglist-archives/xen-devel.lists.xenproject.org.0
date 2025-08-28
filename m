Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58DB3A6C3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099710.1453482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfkN-0008JJ-Pm; Thu, 28 Aug 2025 16:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099710.1453482; Thu, 28 Aug 2025 16:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfkN-0008GZ-N2; Thu, 28 Aug 2025 16:45:11 +0000
Received: by outflank-mailman (input) for mailman id 1099710;
 Thu, 28 Aug 2025 16:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJR=3I=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urfkM-0008GT-Bb
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:45:10 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a53074b-842e-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 18:45:06 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GVXPR03MB10577.eurprd03.prod.outlook.com (2603:10a6:150:14d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 16:45:04 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 16:45:03 +0000
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
X-Inumbo-ID: 5a53074b-842e-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEbZQl4JF6sCdLQVSzrYtoj58mxrttygij3BVtZWWI9mvUm1+1wWo2T+yRaW300+4utrV19Crq1D+zuQ+ax6SM4X0j7lP4y7gVxX+Msdh1cXKIi7dUJ3RKjrIx1L9St/FqiphxafaWfmQOq75iVI4/xT46a58fM55MbZ298o3nuk/DZJ3c0/5NHzQjMBVsdUYS5IiggQ2ACQb3KXIv1+An8v6YbUO9Eu74y3mvv9QP+Ns/YpOLfPRVROk1ZYFgsB8y3rM9J2wndyXEwJ1343RUZ7kZ1ETn5cCdrcKK1I8vWrnWVEOVYIcMNSdx0e0BDdd6GpZludV2yc5EOYicrz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lKqkXtvYHZH2i360Y63KHXnqCWVk5nEnbLNG8/tg7U=;
 b=XtzHAHSwUmyAn90w9C4B+eGCWKDtazfdPpFwM+OrOb1XfJv5W/yx1fQhBoptqafCQ936DL4gGoMfl5udlyRjC7/hlbNeofX5hHN16TlMBAJD80ELAgV9VFnVpSHReLu2LZMoCiflXv1R9mzUkTmWkP4Gm7pFq9pd7XJmiDxPbwEW0OJp9Uz2FpDQOpOzFG6kbkWtMj6+Tc6yMRGhBUXb7EfZPYgXF6emqGAYgH/VU78sOGPJu8bqkuvLNXSr63GBGc3jK3g6bdfRbDMFzb7ay489/QR1dM9YKLxK7UR1dT5mbwqfH4c70e46B7CbH0PpDqLnYJjAdGgYvNXv7e1Ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lKqkXtvYHZH2i360Y63KHXnqCWVk5nEnbLNG8/tg7U=;
 b=hp8cEEZMt2lnXQUB7NBNMhaLwMtMCGHJbUOsb6r+N3zakz/pXttlVderPeYhlqw6+FrnmSgO3E7R+7t1enGmIQ6Jce2ulSk/AioJmNYcQwf+b4zW8WouQGqv6svVgqe9FXeyNnWbVbdnaC6gmmvCu6UL999qxIYxXhJiokc9O5fnG14npAFWuHUk+iDuVw7/E4/phDTIuNAk6cyM0A2Vnd07LtvEGG3a9Tw9cOklDSY3whedUZlDbsP3MYFFXRo97m/2vldgaNrdZpGq++vNuKZTlEMzSB+39sdrnsjeljVnO6VXVG5PqKbX1cpk8qTsjsp05NvKI53U+DmqAuE7wQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH v3 11/11] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
Thread-Topic: [PATCH v3 11/11] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
Thread-Index: AQHcFpKAJEYb0CN0HkuGQwymf9ybDbR4FMcAgAA0R4A=
Date: Thu, 28 Aug 2025 16:45:03 +0000
Message-ID: <7078821a-5a6f-4797-b00c-c194365e3555@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <9dc68c29751aeacf37b51d3bd345e87e9a0f0ccf.1756216943.git.leonid_komarianskyi@epam.com>
 <bce5e07c-eee7-481b-a833-4d5d8bbce78f@gmail.com>
In-Reply-To: <bce5e07c-eee7-481b-a833-4d5d8bbce78f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GVXPR03MB10577:EE_
x-ms-office365-filtering-correlation-id: b9241551-1512-4f1a-8a96-08dde6523cd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QnFrRTRYUk8wK25mQ0ZoWm1NNS9nZ1c4RzFiSFN3RGxVTXJQNlpURGJFdENq?=
 =?utf-8?B?bTJHeUN6SVZCL3A2cFdrcVZiVDgyamVwQzdSdUowZUtvdEJLcXdTeFpDZlpl?=
 =?utf-8?B?aGF5S2ZtWEhuTGVwaXpUVkFiV0RNZWs3cDRrRGFKK2kwYVpuSVIvcUdjbHdV?=
 =?utf-8?B?M2ZtZVptT3ViRnhJak1tbmEySGFHUVQvLzVWL1pVNGt6S0E2TERpQTlOa05n?=
 =?utf-8?B?SlI3OHl5T2JlM1piQ0krcDJMN0dGek5zczdhZHdoYkhmSW14cHllSmhxN2VF?=
 =?utf-8?B?blZNUFRGcTFCcUlhaU5QQlB6K2xhSXVwUHlqdTEydVZwSXFoSWRNaUhMdnVU?=
 =?utf-8?B?cHpuRHkyRzJ5ZDdkOXB2TjBuOEdoSTVsNEgrR0tuWXRaUDZyWkdtY0pwUkJZ?=
 =?utf-8?B?MUh4cHl5RTJrTGFMd3l2dGdPczlMLy9mUlBoTFJGd1RCa0J1K25ubnRNcTMr?=
 =?utf-8?B?YVMyUmtOSnBKeEF4anRmMElpVVlvZDIyMkNmRGRYZkx6ZHZRTGNaTitHcnhR?=
 =?utf-8?B?dlRKZzA4cGxTU0ZvT2xiWnFrWml5S3hTL2dOYW5FeDR0dzFKbjlwdFFNWXNY?=
 =?utf-8?B?S2Y4WEhrL0dQYTBsWE41NXI5ZjFxL1dyNWhIWGdyVDJRaENKMFhjcWJLOU1O?=
 =?utf-8?B?R0VMKzhlc2psemRrc1UvRis5eDloQUxyMENiQmttMDRDWjBPQ1JvUUphSVVh?=
 =?utf-8?B?MjZUL1BtTTVHcklsNzUyaXZyekcraS8yOEtNMWFDTkxBM21zMEVxTmpFV1M0?=
 =?utf-8?B?VDZtUTIwYnFEcDRQRkRYdkV1Wlp5WHdIK2R0TEQ0M2VtN3hjVkJsK3Q4RFp5?=
 =?utf-8?B?L2tPWkpMTWhlcytTdnBzc1ZiSHU0RG52Z3BMakJiS3l4QVpMcUFKMmFYOVdK?=
 =?utf-8?B?QVlWZG1IM0labTdEOTBzaG96TThXRlNiZGYyMlQ1MEtTLzZmZUYrN0RRdXM5?=
 =?utf-8?B?aitKakM0enRPVHNnSEFhTFVBMjJLcTJPa0NvQXFCeUhNOGJVSEN5MzZlT3Fa?=
 =?utf-8?B?bHlBVEVqUzJyODdXTjkrR2Z4ZDIvbWU2UVdMRlZoMGlOanEzeTVZSDhkOGlO?=
 =?utf-8?B?UTI1Nys4YVVLbEh3d3ZOYmZEWldJTlBJcy9FOTc4cGl3UGY1YWs0SmN5d01M?=
 =?utf-8?B?cVlDb3RybVBHYXJrRkhMNEtFOU1ucUp2QXVqRkxkOEtQaU5CK2U5b0tQQi9h?=
 =?utf-8?B?emZURGtXbXR1UW9EaE5BZGdaVU9DWWlGcU1pRzA3UHl3UFBBN1NuRVU1bDF0?=
 =?utf-8?B?dUgzaHNnSmM2cWtnZkRrQ0ZYdHJIMVBjdXk4QVFRZ05oSGoycGRyM3FyMW41?=
 =?utf-8?B?RVczZlcySjYzN0wrR1B2dnJSUUlzdmVPYUpBclFZZnZKZUtkTlVGWEVUZlgy?=
 =?utf-8?B?WTRlNWl4YmU3dVdTUG80ek5XeDRCUW9xUHZBVmRGNXVYdnNsdy9icWZ0QWtE?=
 =?utf-8?B?eHZacmpKK0tlWXhrZFBBUDVSZTZjYWUrODdhbWcrdXNBcEtROXY1dGF1eXR5?=
 =?utf-8?B?SW55VXN4ODFRUjk3cFc3Q2ZtejcvSzAxS2QvQmdoakdReHZpcWlSUVVmekxJ?=
 =?utf-8?B?WmpubndNemVBL0NOdWVVcDlWbHhobU5YbENGZWxPSkNSTzNYLzN2N3M5bytT?=
 =?utf-8?B?cnRwZlA5aXJEVUxGZXNiaGMvbkhvT3JuZjIwT0xaaDM5eHBDY0w1SHRnT2dS?=
 =?utf-8?B?cUtyR09CRUpMOHk3L2xWaFFOWnRJQ01aQzBSR2FVM3pxVHVRb1Z4ejQrN05q?=
 =?utf-8?B?MVM1bXQySGtMSVdnS1puQnVVaDJtV0ZZVk5xbXUwNWpRNTdDTTVNcDFXQ0lR?=
 =?utf-8?B?dzVWamkrQVNSV0NtVzY2SlY1bkpTdlNTd2QweFJiUjVrNnBmN0M5ZVhkc2Rl?=
 =?utf-8?B?VVFYNEI4bmNoVkFRaFBtNHJXYjJjVEk2a1RlaktTbkNZSW41MkV5SG9hY2ls?=
 =?utf-8?Q?arTS3WRiJRQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2Qxbkg2cFZ0YlYvU2c0SGFvL3RaY25FZklRek5UTnY2aUJRTjdVVVB2bjYx?=
 =?utf-8?B?dGordHZHZklFMWNBWUJFVWIySVN4N09iTTJxbnhXaWhSbm1aZnlCeVQ4bWxJ?=
 =?utf-8?B?U2lUMDVCNFpPcndJZjViUHlxYWJ5TStvYUJiRGRXZFNKa2JCQWdFWjQ1RktV?=
 =?utf-8?B?Yi9TK1lGL1JBV3B0aEVyWlF5UHkvems1RjMzamtlRXhuSTJmSjhkNzJ2WlVX?=
 =?utf-8?B?cTEwSyt6eGUzaVJSdFM2anB4UE4vZmFUNFhjQ2hqNlp4dTUzSW50Q0tPc0Yz?=
 =?utf-8?B?cGNUZHdOTXExc2FudnZ5T0FvL1EwYlpBRk1nNnRJYmNZTjVEVmhjSVdZOTlL?=
 =?utf-8?B?NEhBUmV2YjlLLytpdkJOenFOaEFoQ1dFN0NNWTRjSFRLVWF5MjQ3V2ZUSU03?=
 =?utf-8?B?KzdKT1NNMlhkN050cWVlZXUwaEhnSXl3Zjh5NUdlVFpuaFRCYmlNT3NuZDJT?=
 =?utf-8?B?ODF6aFZCZCtlL0liZFRNVzdDV2g3MmVWQVl5Y1dibmZ1dDZ2L3dic0FJMUlX?=
 =?utf-8?B?MmV1OUI1M1U2bmZYYXNjV1ZuZGp2SEIrWnVkOEtxa2xONm1hclRYb3g2L3pJ?=
 =?utf-8?B?aDhlVXQ4NE44cnFkM2o0NHBaWVFMWmZXQTlJaGIvOHZ1R1UzbExLSVJrNHBr?=
 =?utf-8?B?V1FwRE9pM1ZIeFJDK2NDTDhrRkluYnpzeUlVSE9XMVIrRThqTTl6bGNEUjcv?=
 =?utf-8?B?NVh3UUZZRXl2SllyMG9oQlJSNVVRZ0dmZ09MMWY0d0lTWkVPYkJ3UkdxYnlB?=
 =?utf-8?B?ME1wUzhXbDE2TFVjVmtSckR2ckRaYnk5cTVRWG8rL2JRV2VFSXNLVDdzcENN?=
 =?utf-8?B?LytldHJyR05ORXVDU1lEWHJvYXE0N1MwVWRYM0E5YVZBL0tQV1c2N3NpSnhn?=
 =?utf-8?B?UUlaRDhieW5DTVFFbktPZG5kdnhpclpzYlk0MmRtN00rYnkvTFZQU3B4dytK?=
 =?utf-8?B?dm53WFYybTUvUHpWYk5nNlFSWFBIblFNVVJuMTh4YWJvaDVBK1RzWlp5bEli?=
 =?utf-8?B?My9yRUZXUmRidlFZZkNEV1FDb0QwNmlGWW1ZUEpKdXNiZ0VuQzhHVFRBWUpX?=
 =?utf-8?B?dnU0SHZjdUppSnphOHR0Nyt4Zlk4M2hRRXhySWF2M3BPZXVQMDdHaXpWc3JZ?=
 =?utf-8?B?MkdQejlvcnhrVlFCQmkramxCMVlLVzgyeWV0eVdtWUo3c05URGVBcWwxVEtw?=
 =?utf-8?B?L3BmSlpUMVMwRHV1enR0SWd5K3hrcXUzZFlwUVhNNEluczNFM3lOK0VmaU5z?=
 =?utf-8?B?cWtycVZuUW52eEo0UVhzTzRzL2MxbGs5UitkUUFNTjRlTmkvQzI5OTBoYUN4?=
 =?utf-8?B?OUIrVmo1cU56eUNPcG5pSFNEa3dKRFM3MHU2MkVRNmZxSFdPK1dIeXdkZDVS?=
 =?utf-8?B?bE11M0J6c1Z6SmxFVFpMdmdGZ0oyNncxSHN0SzMwVU0rSDBQMmJ0ZFladnlN?=
 =?utf-8?B?bWtuOGlMaklDblBkcmVtR0k0T0hFeTRERFByTVZpek45RHFBbjNkUitBbm8x?=
 =?utf-8?B?RllpS2IvOVhHbGIvTEovTXR6MU9LVHV5azh2dGVoSjAwckhuMmd4ckJwQ2lJ?=
 =?utf-8?B?R0lPVy90UmoxdUVhT1Fza2hLYU9ndjBPS1ZWYVlEZ3Y4aVlxejNQZThHMytu?=
 =?utf-8?B?bU13M0hsUnB1cXRXalR0dXQwZ0l4N0NiQnk5MUVYblE4QzJISU1TUXlvd2Jw?=
 =?utf-8?B?cUpldGxMdTJuaGl4M3I0RDFxUEdESk1Gbkk2WlArV0lXQ1R0RFZrRUdaK2o0?=
 =?utf-8?B?d2x0KzFNUDFoNlcvbTVkSWZPYWdRc3FXc2Zma2NDcWxwYStrNlordjNVTVpN?=
 =?utf-8?B?bDU4bmZ3SjNCTG16TE02ZmpyQzBKd3dXYkdObEZBazVYS3MrOCtwSUl1bHpj?=
 =?utf-8?B?K25mWm56TVorOHpWVHVLaGNQaU9HTDhyT2YrYUxrZTFhZlJkK3o1WEc4UXF2?=
 =?utf-8?B?Sm96ZHhYcjh0bWhCSVRLVCtlUGpzNFZsdm1VUVdOTXJoSmNIWDZyMzBTeFd3?=
 =?utf-8?B?N1M5aG1wU25TVTQ1dUVnc3dtK0xnblRJVmtVMEtrcFpLeURwdEQrU0VwQjlK?=
 =?utf-8?B?ZWw5Z29weWxlUGdRTEljK3p3YVg4SFBSYitJWnU5UERPSWVwemtxdjdYNEFS?=
 =?utf-8?B?MFY1aG5qOC9CRVRPS0c5ZWtrQ0JKSWNMUE1qVnlDQ2VkMFlka0twRHdqaWJq?=
 =?utf-8?Q?+0QBJ5eprwyBkOS2hWKG7ds=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <199479F87EFB8241AAEAAEAD2EC69E76@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9241551-1512-4f1a-8a96-08dde6523cd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:45:03.7972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2v2eYCej+cRR/ftzITAXY8HTZf/d5pT1tO6v4HH9rIbaROveFwbi8JVzhe2EvUCmPEuBe7LPZA17S+ASLCPZyTZJxsfKkkBVyLtfsI4xZkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10577

SGkgT2xla3NpaSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4NCg0KT24gMjguMDguMjUg
MTY6MzcsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+IA0KPiBPbiA4LzI2LzI1IDQ6MDUgUE0s
IExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6DQo+PiBUaGUgR0lDdjMuMSBlU1BJIChFeHRlbmRl
ZCBTaGFyZWQgUGVyaXBoZXJhbCBJbnRlcnJ1cHRzKSByYW5nZSBpcw0KPj4gYWxyZWFkeSBzdXBw
b3J0ZWQgd2l0aCBDT05GSUdfR0lDVjNfRVNQSSBlbmFibGVkLCBzbyB0aGlzIGZlYXR1cmUgc2hv
dWxkDQo+PiBiZSBtZW50aW9uZWQgaW4gQ0hBTkdFTE9HLm1kLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IExlb25pZCBLb21hcmlhbnNreWk8bGVvbmlkX2tvbWFyaWFuc2t5aUBlcGFtLmNvbT4NCj4+
DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gVjM6DQo+PiAtIGludHJvZHVjZWQgdGhpcyBwYXRjaA0K
Pj4gLS0tDQo+PiAgIENIQU5HRUxPRy5tZCB8IDEgKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdFTE9H
Lm1kDQo+PiBpbmRleCA1ZjMxY2EwOGZlLi5kYzM0ZDI5ZDk5IDEwMDY0NA0KPj4gLS0tIGEvQ0hB
TkdFTE9HLm1kDQo+PiArKysgYi9DSEFOR0VMT0cubWQNCj4+IEBAIC0yOSw2ICsyOSw3IEBAIFRo
ZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFu
Z2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+ICAgDQo+PiAgICAtIE9uIEFybToNCj4+ICAgICAgIC0g
QWJpbGl0eSB0byBlbmFibGUgc3RhY2sgcHJvdGVjdG9yDQo+PiArICAgIC0gR0lDdjMuMSBlU1BJ
IHN1cHBvcnQNCj4gDQo+IEZvciBjbGFyaXR5LCBJIHRoaW5rIGl0IHdvdWxkIGJlIGhlbHBmdWwg
dG8gYWRkIGEgYnJpZWYgZXhwbGFuYXRpb24gb2Ygd2hhdCBlU1BJIGlzDQo+IChhcyB5b3UgZGlk
IGluIHRoZSBjb21taXQgbWVzc2FnZSkgYW5kIGFsc28gbWVudGlvbiDigJxmb3IgWGVuIGFuZCBn
dWVzdCBkb21haW5z4oCdIG9yDQo+IHNvbWV0aGluZyBzaW1pbGFyLg0KPiANCj4gV2l0aCB0aGF0
Og0KPiAgIEFja2VkLWJ5OiBPbGVrc2lpIEt1cm9jaGtvPG9sZWtzaWkua3Vyb2Noa29AZ21haWwu
Y29tPg0KPiANCj4gVGhhbmtzLg0KPiANCj4gfiBPbGVrc2lpDQo+IA0KPiANCj4+ICAgDQo+PiAg
ICMjIyBSZW1vdmVkDQo+PiAgICAtIE9uIHg4NjoNCg0KWWVzLCBpdCB3aWxsIGJlIHVzZWZ1bC4g
SSB3aWxsIHVwZGF0ZSBpdCBpbiBWNSB0bzoNCidHSUN2My4xIGVTUEkgKEV4dGVuZGVkIFNoYXJl
ZCBQZXJpcGhlcmFsIEludGVycnVwdHMpIHN1cHBvcnQgZm9yIFhlbiANCmFuZCBndWVzdCBkb21h
aW5zLicNCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkLg0KDQo=


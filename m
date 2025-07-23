Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17CB0FC9E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 00:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054799.1423438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehoB-0008UL-9x; Wed, 23 Jul 2025 22:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054799.1423438; Wed, 23 Jul 2025 22:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehoB-0008Rq-6c; Wed, 23 Jul 2025 22:19:31 +0000
Received: by outflank-mailman (input) for mailman id 1054799;
 Wed, 23 Jul 2025 22:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uehoA-0008RX-35
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 22:19:30 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16e6aa40-6813-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 00:19:24 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9698.eurprd03.prod.outlook.com (2603:10a6:20b:61e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 22:19:23 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 22:19:22 +0000
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
X-Inumbo-ID: 16e6aa40-6813-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUX8vrLT0OUmm8ZTssZojTyf9Cme1aZ/FeRhX1S9MT7qEa3LOovzjifQGf4/KTk/BMOuF3i4+ziue4Jqy6BVYmi2+h5dULewCRhDY3GgXbxsz3CRWUn6REVT6oxuST8DliRP33prrY6oISVOuCd/tL/bDyU8XFsi1RjxKUe7KuXUXb0UU8QjJVf0/qjUVgMyuTOcPJa+W+fSzeBgwIJ+ybRU9Ylj4OrMQh7LDfOdxhpX71aZzXFU+xEMtkclzJ5jlg2PJqqQzr+7g2TSU/xX1CCsF/haxNKbT8Jqe5zZP0GRewROwTkpTHHGNs03o5vWeB7YC2d7pJqg5BGVs9z0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFbEZaHaN+M158T4j8gZ15zPlDROKFiBB0tpS+TN4D8=;
 b=SGOO4yY4evXZ4o22rmENfbc72VDPG3mogvEFLUp63Pqyx3lDKERw1x1l+9E/bTpZTXjviyS2VSfp2RK1Arkz8aK31eSi7utd3qICHZztfN7wgGq1Lv9NTDyIjQ5b4CUEmNW3s1PZBxcCy4wbw786hkltKMeKT6EKDZMo1SdDAIFOJMOcp2BBGZK8Xu1U8DpczQ3KfBNGijmhcjg9x0ZqZ+JbH+/VcnOP8Ydu834QuslMYfpwQQzsm06z9e8dR+EzzZDGsc/fnZaCggfHBgk26TVzuTXB2ikBHb5aaslfXWhQQeJKx9RzREbvW1uW+GCIK4lsldfmu6lABeMiiYqNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFbEZaHaN+M158T4j8gZ15zPlDROKFiBB0tpS+TN4D8=;
 b=mF3B4lptG/Q53JeONes8fAU3bRITgS9X4lXCbtd3cqbYOykCpyeGaQ0HgGxPLOIl9emBEuFoC/anBYLBvXFBjZMG+/js2eG3rNHW9O5oUJy4Qgy5u1E3QKSk29dqwolT3KmtHJlN9C1zYanviqXHvSccansssd6bYFGDa5Y3ne1XY9xki/fvtEQdnG7X2x6xyrZHqFlagxXs+b+KEKXKyBoDLV4rtxgrhFnxrjbdfnza7P8bStnAfWTvazzdVI7qYIKHuMOCZfvPfNTjtCoDMoWNasajZVLTXqWHyHCF8p97fxMo1nV/U0uCzaFc3DuMf0vLBRSyxMl0/T0TyzkKRQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation/eclair: tag guidelines D4.7, R21.18, R21.20 as
 clean
Thread-Topic: [PATCH] automation/eclair: tag guidelines D4.7, R21.18, R21.20
 as clean
Thread-Index: AQHb++HtBXKg7ZSI+06/W6//RSbTLLRAJ94AgAAgDAA=
Date: Wed, 23 Jul 2025 22:19:22 +0000
Message-ID: <f59636e1-c882-4aae-b2f2-4db707bfed13@epam.com>
References:
 <9045a2e3cae57995bb279f66de19e9a6beed3a5b.1753277988.git.dmytro_prokopchuk1@epam.com>
 <alpine.DEB.2.22.394.2507231324350.7043@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2507231324350.7043@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9698:EE_
x-ms-office365-filtering-correlation-id: 08aa2b26-81b7-4728-7f29-08ddca36fa11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RnBDU29YY2xreEFadnhXQ1pqME84SGM5YzZhamVOUG54VE91UlVCLzNMaXFS?=
 =?utf-8?B?MVB0ZnhUTGxTRzU5QnM0NkdrYUZtekpIcVplM2JzemlESVZRSlhDbjlqSkZQ?=
 =?utf-8?B?TnFJWTR3cU5aOEZNVW14VE00YllmMHlFUUtXc00xdGtzVUZPeWJLc0lXSE9K?=
 =?utf-8?B?NXpLWVJ2djVBM3IydS9zczBQazliOERJclpNSGtsZThjaWZxVjZOajd5US96?=
 =?utf-8?B?TWhFbythQlA1cUd0R3ZzWEFEa1l4VGdGbUNvelE0OElRaDFHcC85bEV6YjBY?=
 =?utf-8?B?b2cwOFRFZjdmd3lNYkc5UXE3M0dPZzYwc3VsT05ZakJsdWgrRW4yRGFxWGli?=
 =?utf-8?B?VGNHejh0RkJPTVgwMzhqSm5GZ3huSU9sb3lpUXlsbzBSbFJ2dW9RVE5YRXJo?=
 =?utf-8?B?aU9wdmlURVlueG8vYkxxVlZaL2pLRHN1bzg3cTFUcmxjNmUrd2tFTU1zNEx6?=
 =?utf-8?B?R0t1Q2tqM1VrOGV5OXBjYXBWMUJkdHVYRGRjK2hDM2wydjZ1RUUzME9YSWM5?=
 =?utf-8?B?YmpJVVhyTjgzbkJXeld3NkV0Y0pMNC9vTWozRDY0YlByTUNvdER2a2plYlVN?=
 =?utf-8?B?cTFUT2hoempnamhDY2lZcldpSng3d0NGTzNibGpRWmRhdWlpSGRyWFM5dStr?=
 =?utf-8?B?NGloZk9CS3drcDFTZzF2czYwTUF4NElDbEt0KzA4S3RZT29FS3pmZzBlNGtK?=
 =?utf-8?B?aDdxMm5Zd1B5blpsdlhvb0w2eUFVMXJDbm5sRVlvUFEvYXRhamQrSWcyVTd6?=
 =?utf-8?B?VmZ2cVZMZ3ZRVXJIZ053RmZkdURPQlFURW9kSTliS3p6UGozNHp6Q2VMWGdv?=
 =?utf-8?B?UG4yMDBHbXdSNi9vOFhHTHNGTE9nZ3BpSlVqdmRGMTBMOWZzK29nSUdZeVdW?=
 =?utf-8?B?dVhrMnUzQ3VTTGdtOE5BTkYrT2plbUs4dXN0Wmd0aVN0SUlmaTlkdndXeHR5?=
 =?utf-8?B?UzJDd2RqQ2pzbGNNZU9iVFVUUFZMUyt2L1V1M2NGU0NJdTNOWEltL3F6ZWs5?=
 =?utf-8?B?TUUxbmlKODR1Znk5dU00cjBsRkNNV3lZQ0QwbzZOTnB0MnJpMXp3dkNEb3Mx?=
 =?utf-8?B?aFB0L3lzcForMGFOd2Z2VnVtVm5RdmpyTm1nRlFER3B2MTJ6bEh1alpGSTJp?=
 =?utf-8?B?M1BZZElpVmhlcEExMytTOVhlZ0RpUC90dk5lQ2dpZ1hqNDNoampHbXJFY2Zl?=
 =?utf-8?B?T1ptK2lQNnNUNy9wWWJDbmJFSU5uWUo5bTdoUVliM3kvYVpVeW4yR1Q5ekJJ?=
 =?utf-8?B?SGhUWlBWUGM5VnVkN3hYQ2N1ZGhvQzF0cU9CYmxoakx5b2VhNks0Q041VGxo?=
 =?utf-8?B?anFhMG1mQjdNY3dIY0J2UUFhOXorTWxDNmFQNlJud3FaWW9vM1RCOENkL0RR?=
 =?utf-8?B?c21iczVUdUYrWjkwTlZrd3JycHM5ZHBBYmV4YlNqcFF4ajdJSHgvTUFnYmM4?=
 =?utf-8?B?RUNoK0xGN0dLcDQ1STc4aStuV2kvN3VFSExSeE9TV2RnMkZPL0VEQWVhQTh0?=
 =?utf-8?B?K3grRnoxQ2dxWDdqVHR3blBFbXZVZFRqc0NvMUhXZEVyY1MvbHRWOWQ0dGZv?=
 =?utf-8?B?ejRYLzlCUElDY1NuUkRpRitnQUlZODd6N2tKVmo4UEV0WFhqcmhzNFcrTkV0?=
 =?utf-8?B?NlNjWmRReEdUcXcvQi9WTEZsRnF2ZjNUSmQxS1pEdnhqQUY3YnFGWFR0M2Nm?=
 =?utf-8?B?akhTaDNVSHVxK21YOVFwclhCa0V1aUJ0T2w0NXhMeStTbnkvMVpsQTVsT0Jx?=
 =?utf-8?B?Zk9Ec24zaTJhQVpRYm1zdTdrSEVFYXU0d3U0ZUFTcHRycEZKdmdpdENCbG11?=
 =?utf-8?B?cE9JVnRmdjVtenZCUGgxU0dKbkF3SWVzdEEwNHRCR0VwZ2xneVFJdnV2YkVS?=
 =?utf-8?B?b2lndjNjczlLREsxZ2JrZ01IVE0wM0o1b2VYemN3UGorWUM3NG9wT3NuOTg2?=
 =?utf-8?B?dEdwQitEVVdkSDE5WWprK2lZeHJhckJLRkE5bEN5OFUzemhyQ1pUNlZTYndn?=
 =?utf-8?Q?J5ZZ9Ywq4Fy8kdYlxBdPfSU1X/sR+8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkR4WVptdzZhSnQ1YmNhSWtXMDdaZHVVQnpORFVlaXRIb0NOdUE3aVdWbkMw?=
 =?utf-8?B?RWVkbTRsV3Q2UHdtN0F1OG5UdnpMVnl5K3NoSlhhUXMzK0tDTVMxWWJ4dXkz?=
 =?utf-8?B?TlBqbFpTQ2paWjA3ZHJtZzdjZGNwUjhLY3J4N2FzbzNxZGcvTEo4RnNDYW9Q?=
 =?utf-8?B?TnlSNFJaQ1FMc21FWW0xUUYxTjBjdTZxNnNvV1U0dk14ZlJtVU9SN0lQNytv?=
 =?utf-8?B?NVNGNFhScmV0ekszR2FDZnpxYWpkQU9GWlI3UEpic011cUM3YVJnRklxN0Nl?=
 =?utf-8?B?WktkekUxaFpzVlFiVmY2V1BJaVRPejlWUG9GMHdXTWswVnZYaTREdEQwYzVp?=
 =?utf-8?B?RlZwRnZET0VrbXhIRFdjamRUckFwN2JUNU92cVZTZ29hcE5iVDQvNHp5RTJq?=
 =?utf-8?B?UjJMZW9CQTNCNWRIUEVTa0c3bk51eVdGQ1RoeXFyU1JaYy83NHR6OG81N2lK?=
 =?utf-8?B?UUYwOTJtamJSVnV0OVFsWWg4VkxyOGYydFA3TXNqMzlEb2FxVUZ4c3F6dndl?=
 =?utf-8?B?WC9HOEEzNnZtWWd5S3ZscUs2RFA1dklnTXdSZ1pTVlMrcXVZa2VkSDJBemtZ?=
 =?utf-8?B?RXhkVTZaRTFjZWVFaU10RTNtczhNTjhMT3o1TlJnQWVJUE1aOXVqdTgxODl5?=
 =?utf-8?B?TTVDeHZOcVg1WDh5NWNKMEhVd0Y4bmEzcHRlWDc1UWQ1UDFUVk5FRURSTE1H?=
 =?utf-8?B?NUJ5T1JUS2s0NU9ScEZlUHdjT2FtNEtYSzc2Z2F4UzhKVFNxRkNNZVJoZ3Rj?=
 =?utf-8?B?SXRoY1lzWlViVjR0SHdRaUpMR1ZQZGJteEp1UTJjRVY5SXN2L0lwQ1Yra3py?=
 =?utf-8?B?N1UyckhWam9HR0NoK05yRGdKTWlVbEtsNk1KUkxDSnZndTRMWkdlV1c4YUFB?=
 =?utf-8?B?bE1ZMHphcmloNmQ2TmRTMkR4V3N2dTV0WlVKclEvMXlKYWNMNno1YStwSEUz?=
 =?utf-8?B?LzB1eXcwMHVuQWFqSW10Q1o5bHhDSDI3bWVQbXo1ZW1qb1phNEVwb0ZpMWZs?=
 =?utf-8?B?dlovMkc5YjNnVXpTd09RK1dPOHpoZjE0UklkaVc2ODYvUk1Uc0xNeDcxKzUy?=
 =?utf-8?B?dEpJbWxMVDVadDAyNWlobGZqcTBWRkVFQk1xaEt6Ny9xemZZWTdYVk14M0lj?=
 =?utf-8?B?NlB0MHdNdDI2UzROUm5SelVGVG40bkVZcm9Gakh6eVkzT0dUMm9mdWJMQjhi?=
 =?utf-8?B?ekM3c1lZYzNSRXNLaENPQzJMdDl3ZWlqejJrZ0dEWTRJdjJkZnJ4Q1Q1OE80?=
 =?utf-8?B?Z09hNEd1MUt2RW5rVU53bkkrbFI4ZU5qU3NCemdpaWcxNzRqSDEweTdIV29p?=
 =?utf-8?B?RDdQTEl5YmE1MDJ1aXZvUFp0WFRyS1dmNTJWQ0dQT1dDZnAzNzBmbVV6NkRx?=
 =?utf-8?B?akY0am8ySXdmQ3N1dnBtRVBnZWdmMmQ5VGRBcU9aNEgxYWRKbVJFR2J0YjRk?=
 =?utf-8?B?WExkSFBMbkJNOG5sK3ZkZXY5QTAySGFRQnFsZVkraWlPMzE0UFFPYmE5Rmhv?=
 =?utf-8?B?Tnl1V051dlZsclNSRXNmWExybHFtMURjQmxqYVgxWlVNVWczR094b3RYbTFp?=
 =?utf-8?B?R2l5Y0VLV2hab0M0VjFzYnR3amJsZ2xhcEhMaW5Jd0I3NDUwdVRjT3h3Y0dn?=
 =?utf-8?B?VVo4bDNFSkxEd2RpQ1RFZHZTbWxDbjBkYlYyZmg4WmhmSjBsK0IyamllN0Ju?=
 =?utf-8?B?TjE3NXFBWGxEdmk1VWFPb290WGtTb3htMzdWS1dyek81ZnRGc2h6R09JOHM2?=
 =?utf-8?B?dEhTUWJOcm93aVF1VGFGTG1RVlhyaXdGckFkcTNKUlJCZDFXdFZma3lDbW41?=
 =?utf-8?B?aENibHB6NExrR0pNd1d0RlNlN2I5QkdvZFFOZXJkRk41MXUvaXNmMFRwL1No?=
 =?utf-8?B?MTNad2ZrZE1zWlJZRkdiUnRaZUpPNHJBTUsxZnZ6M0hkb1JBMVhBYjUzS25w?=
 =?utf-8?B?a2pKRWp1bVN4VjNNZFF5c3NBMFB6cUFxTUNnKzBWaXpHWWtUcHZNTmZBd3gx?=
 =?utf-8?B?OWM0N1FjYXhxd0tSSVlpZm9BMEhocDJrTDlFVXVmTWIybHBjOHByaWxpbUp1?=
 =?utf-8?B?dWRZUmFjUlcraUU2cHhzN0lqWElyeWdKaWlZU01Xb2lLLzh2cXFteWl6OUtm?=
 =?utf-8?B?bkR4SnFPVEcrYmlsYzVuUkovNDBQV3ZHdGU1K2FwT296QjYvOTd0OGtWSVRi?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD8CCFADDDEE8448BBF0672FEA498222@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08aa2b26-81b7-4728-7f29-08ddca36fa11
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 22:19:22.8342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZzus6CN0U0k8aaEMoCNkqvTcehrFxgo2FjcIJ18ca8CSwS1QpWTvuyjPfH8kQpgAbxrqf91X5MQwObnYWXjTu/vx478qRUkyeKwsyNucdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9698

DQoNCk9uIDcvMjMvMjUgMjM6MjQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gV2Vk
LCAyMyBKdWwgMjAyNSwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gVXBkYXRlIEVDTEFJ
UiBjb25maWd1cmF0aW9uIHRvIGNvbnNpZGVyIGd1aWRlbGluZXMgYXMgY2xlYW4NCj4+IHNvIGFz
IHRvIGF2b2lkIHJlZ3Jlc3Npb25zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9r
b3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+IA0KPiBQbGVhc2UgcHJvdmlk
ZSBhIGxpbmsgdG8gYSBjbGVhbiBwaXBlbGluZS4gQXNzdW1pbmcgeW91IGhhdmUgaXQ6DQo+IA0K
PiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0K
PiANClllcywgc3VyZS4NCkJlbG93IGlzIHRoZSBwaXBlbGluZSBsaW5rOg0KaHR0cHM6Ly9naXRs
YWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9kaW1hcHJrcDRrL3hlbi8tL3BpcGVsaW5lcy8xOTQz
ODIwNTEyDQoNCkRteXRybw0KPiANCj4+IC0tLQ0KPj4gICBhdXRvbWF0aW9uL2VjbGFpcl9hbmFs
eXNpcy9FQ0xBSVIvdGFnZ2luZy5lY2wgfCAzICsrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5
c2lzL0VDTEFJUi90YWdnaW5nLmVjbCBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJ
Ui90YWdnaW5nLmVjbA0KPj4gaW5kZXggODc5NDg1YjY4MC4uYzc5MzU4YmRhZSAxMDA2NDQNCj4+
IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi90YWdnaW5nLmVjbA0KPj4g
KysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL3RhZ2dpbmcuZWNsDQo+PiBA
QCAtMjMsNiArMjMsNyBAQA0KPj4gICAiTUMzQTIuRDEuMXx8DQo+PiAgIE1DM0EyLkQyLjF8fA0K
Pj4gICBNQzNBMi5ENC4xfHwNCj4+ICtNQzNBMi5ENC43fHwNCj4+ICAgTUMzQTIuRDQuMTB8fA0K
Pj4gICBNQzNBMi5ENC4xMXx8DQo+PiAgIE1DM0EyLkQ0LjE0fHwNCj4+IEBAIC0xMDMsNyArMTA0
LDkgQEAgTUMzQTIuUjIxLjEwfHwNCj4+ICAgTUMzQTIuUjIxLjExfHwNCj4+ICAgTUMzQTIuUjIx
LjEyfHwNCj4+ICAgTUMzQTIuUjIxLjEzfHwNCj4+ICtNQzNBMi5SMjEuMTh8fA0KPj4gICBNQzNB
Mi5SMjEuMTl8fA0KPj4gK01DM0EyLlIyMS4yMHx8DQo+PiAgIE1DM0EyLlIyMS4yMXx8DQo+PiAg
IE1DM0EyLlIyMi4xfHwNCj4+ICAgTUMzQTIuUjIyLjJ8fA0KPj4gLS0gDQo+PiAyLjQzLjANCj4+
DQo=


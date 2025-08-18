Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8359B29EE8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 12:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085887.1444156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwuq-0004QV-Cr; Mon, 18 Aug 2025 10:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085887.1444156; Mon, 18 Aug 2025 10:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwuq-0004Oi-9p; Mon, 18 Aug 2025 10:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1085887;
 Mon, 18 Aug 2025 10:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czvt=26=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1unwuo-0004OR-Ii
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 10:16:34 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67e4cb37-7c1c-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 12:16:29 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAVPR03MB9044.eurprd03.prod.outlook.com (2603:10a6:102:324::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Mon, 18 Aug
 2025 10:16:25 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 10:16:24 +0000
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
X-Inumbo-ID: 67e4cb37-7c1c-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD+O4wUNIKJzeLS4xH49y76plv/9yhqnV27lcT9AB6vvxl12btz4flDhFv+M+ijedWQVGChnCGE3GaEG0xf8Tqow3XzIyEmPEds5T5tZ49tD44ZLBCgFeI89vO9bsE3ExjfCl/gDjdz8YPHmHJSV65LZPJ92iVcOKpsuDIp7hdfxqhXWaqKqmEH1e1lqgukezHoTkbzRoobTLwfDGtfQpQH4xWMqfmffc5zZv+JSPz9a26grSuFwmY7xRANgx07UVYRbs1rTWHW+0ngydmL5sHCwf6MvXTC9tPLirc8Lf0jAoY4oNegla16V0bHoG6PXrEFfiQfM8mCBB7zzXF/pJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap9GNoXnMIJwuupLRKCKvuu9AyR4fxLS0C1yG+MuPwM=;
 b=ThRS7T51NmWtUpMbWLq9XmhbmQMdbhvqmx7ts+vewAUjaaXHkFgtCHj5fkxFB7EsMj1egkoavgVtZW8aRyZGDSvpCCmiYTlSYRHvNGyywkLZAZFOPT1W/PRgn6rFqhPAoZpsDQj0qiLkZOp6sE8d8uXR6HhHmPRk3DWcKoyVUxh2v1KVNNzfSYdP0qy/rNG1OgFqFENOz68r+QivxDS6ogKrMXLV6FHlhvORwMHZHTz1ltdfLeXlQP3OAXeSe/pgXrzuxJE/d2uxjPBYHW8MKL+ClV6fL2IUAdoLy3y6kp88HPkQ92u5oxZ3d7k0vnIeIb4xyK4MDqH9O3vcBW1saw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap9GNoXnMIJwuupLRKCKvuu9AyR4fxLS0C1yG+MuPwM=;
 b=lTuMIn1jaPpUu9E+CoR7zDsP9dr7ddk6IyaT9hem3HaLmAgYNovH+N5O7nSN6cAJ6aegPm/rLHW9bxa2hHWbZAelVhvfNllw4yJ4kuQZiha668HjEc63irshb5ACDHhdW5KPRmNDjOOoWiXRC7XO6nzv9ca4Z+mlZhrivkhuz7fXLiRwmBc8KOUtII8QSmcsENFliS/xKV9rXhKp5/Hn6e/6bYH2oeiCofDaLhXMTKM1jmS0Y0tkjItjaofVrNhCluRCOYg94hiMyms5NkDqf6lpi12j4sV7/bHcCGV7GVCyJaY1OgfSGEixSfA2uCwN9QI8WAApBsDfy17C4UpGuA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] misra: allow conversion from unsigned long to
 function pointer
Thread-Topic: [RFC PATCH] misra: allow conversion from unsigned long to
 function pointer
Thread-Index: AQHcDH/2fJv669AP80eUn9D9WGE5wrRh1CUAgADLEICABZoWgA==
Date: Mon, 18 Aug 2025 10:16:24 +0000
Message-ID: <c9ac9466-5f22-450b-9def-f79d2d4a6233@epam.com>
References:
 <8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168.git.dmytro_prokopchuk1@epam.com>
 <06120b08-7ce8-4d03-b3cd-cbb22547eca3@suse.com>
 <6990512dab007bfa51e4281dda3cc2f0@bugseng.com>
In-Reply-To: <6990512dab007bfa51e4281dda3cc2f0@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAVPR03MB9044:EE_
x-ms-office365-filtering-correlation-id: d895dc1f-3417-4d40-d5d8-08ddde40495f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OFVqY2o2RndpVUw0RU51b3owU1NibGpaNHNmdERCa2RweUEzWmNjdS9EQkJ3?=
 =?utf-8?B?TEpYbVY1dGtLdlphZjRvYXNyWW1IKytkaytHQlQrVFIrVjdmRFUvdXJtTGIw?=
 =?utf-8?B?SURWUkREWU9CWEdSUXRvNk5wdGpoRUhoWHRRekwwZCt0dnB5RlZmenlIRnFT?=
 =?utf-8?B?U0ExNGtNSFNFSmliMWZ6NkV5eGpVd0h2SDBBcFJRYjIwc0ZoenJnMmthNVZj?=
 =?utf-8?B?UGZSd3UvOWNCZ1ZZNDlLMnFuYkNwYzBmUkZKbW1vTjNQdzVVRGpJZW1nUzJj?=
 =?utf-8?B?bDNIL083dVBrcjZhdGJPNXZ2UHZyVGNuckxiWCtYaVprUFY4Z1p4NDFwejZz?=
 =?utf-8?B?S0VnbkRZcVA1MnF6Rzk0alNXSHVad0tHWUlLTjFoYWRBLzZvMlE1aEI3blZi?=
 =?utf-8?B?dytlZzVOT3czK25DYVc5bndJT2hiNmVhWktqTkdpLytHeHp3bGptQ0U2YW5V?=
 =?utf-8?B?Sy8vSDJ2U2Z0b2RsRzkrOEh2MWZUV3BvbmpORGNVaUdnTmE1TFMrT0svaWVm?=
 =?utf-8?B?NHpmSnJWWlRDdzlFNUNsd3prU1BMcWg4MHhkMU5wc3AwZ2E5b0xOQ0lHQ1p6?=
 =?utf-8?B?dmZVSVdIaWkrSEYxdXczeEVxN3MweGVGYi9IeXJkTE9zRldNdmZ1cklBeHdL?=
 =?utf-8?B?eGViOTNhbVZvbmZmOWZYY1NydHNDMGZZYlBwd2xnUjZlL2I1WEVLN0F6OWdY?=
 =?utf-8?B?d0hGeFYxc09EdkZiSWRCQ3JjOGE5RC9INnNjMjdIdGdTQjZhMHhGK1VTSjZE?=
 =?utf-8?B?SGNPb29nUmNUSUFTT28rQ3JSYlk1Y1ZuUXdMQ21FWWhQc2FaUVBpem5JZkl1?=
 =?utf-8?B?RXZSUnVUbm14Y0JERURoWC8yaCs3dGJLQmJNV0RUVWdVUGRieHN5R09kRStl?=
 =?utf-8?B?MDRjVElVWXl6U0JJS29DQ1hDd1hkck84Mm82ZkVZNjRMV0Znak1NQjlVVmN5?=
 =?utf-8?B?Q0JuVlZ2a2dUbVRvTGk0NUxFMDFPQTVmUWRrbmxnbVdNUVJhU3BCS2V2V3pY?=
 =?utf-8?B?a1FaNWQwOTJZMG9XNmVDZlVTR2ljM2FpSXh6bVQxUVBUbGNCY2RtSW5EV3pF?=
 =?utf-8?B?NHZZVlFQR2tqMDMxVlBYZWJwcTU0cWpjRXo4bVB3SkxkUm1jQUF0Nkd6cVZV?=
 =?utf-8?B?SlZHWi9NSGJFSlE4OGVsWEFTOHlERFJKM2JHa1ZBYi9RaExrKzhMbnhtSVRD?=
 =?utf-8?B?cDY5ZmJSS25GU3hsQ0lScEdiS0xxUG5ZVzIvd283WlZ1cFRmV3FoTGIzbHRj?=
 =?utf-8?B?V1BPcHpSNjZzTDY5aEkvaEFONDN5OEFER1U5WWFLY0tlbi9WVzRmUGVEVndY?=
 =?utf-8?B?RTUvbTAzWk5UNmhBeTZxenB5TEUrOEk5QXBjSklOREdvVWFtOEJjRGpWWGdD?=
 =?utf-8?B?ZjJoMWtmL1hxV2wxTytZMWVNSGxmTkQ3YTMrMUxLOUluTUVMOVBQRnFJYnY2?=
 =?utf-8?B?VGljNWNlVjJ0WjZNTTRKaUF3R1pzTjhTbG9odXJNTWNQbTdXQW05S0JJdkZh?=
 =?utf-8?B?SHlaa0RYaXlBTWg3MmJBZCtJcW1kZlB5RHlJejZIc254a3I5djUyaHg1a2Ft?=
 =?utf-8?B?aEZXN3VIZEg5dUNmQmpQYW8wTGY3SnNicFdMUlFSVm9MQ1FQTGlkTVJvV2ti?=
 =?utf-8?B?b2FnVUoxeUNJeHhQLzczZEZJRzZ4Z2xjTGwyLzROd2ZEc0ZaRTJXRXhwUjlB?=
 =?utf-8?B?THVXdUY5OWNZS2NzVkZLWEtCbmN6UUNVTUpUWUdwY21BMTk1NzJremFVZTVR?=
 =?utf-8?B?Zmc4Wk9HdHhzbHhhalNZUHNaMlRiaW9nVmMvZlBKZllTdWVGdjZlQmdFdlYy?=
 =?utf-8?B?OWNtQUo0djhPS0ZwMjlkT1B6TndOaVJNTWJHS20vVTZtM2lZQVVYci9FL043?=
 =?utf-8?B?bXVuZ3BJc1pudHBFTXdENGhSN0NiUEx0dE5BTEY1ZkVCQXBaUTZNdVdreFNo?=
 =?utf-8?B?Nk5CY1dWNElnMHFtbWMvaWdWVmprYkRuODVCU2IwZFMzNVZxcXVuUS9PT1JM?=
 =?utf-8?B?allGVEVUNXFBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGhFNXZVOTdnZVVyOUJPSlE4N0Jld1J0QTdLSHBmdWJLR290VkdYalJUMEY0?=
 =?utf-8?B?bDRGM2hXR2J5RjVaK0tzY09PSVRkbkxJd2tJeUhqMis1NkJueEoya0xaNlgv?=
 =?utf-8?B?Q2tNVUtGMG45MTVSK3VjaDJQeUtoL1pERnhyZVpHNURlUmNBTVNMOVRBUWVt?=
 =?utf-8?B?T1NJcG01UE9reURtT1kzaWhOQWdNSFdZSG5lWDdlazF4ckkyNjlqUStUTEpE?=
 =?utf-8?B?SVhmaFFZSEMxQTU0bjFBNk5CMkFIZURZbytUWUhNT2IyU3Z5UHcwYkwvVmtJ?=
 =?utf-8?B?aDc5bjYyVWRodSt2em9US0tPNXEyRlk0NDNickdla3VOblZEbUxxM2RzNDZU?=
 =?utf-8?B?Mnpvc2dFZW52VWt3Mkh2U25iY2x1RlNjREtLOTBURC95Q2NoQ3EyM1M5ZG5N?=
 =?utf-8?B?MWg5ZGduYnR2QThwemdtUkQ4c3Y3T0FEdTJYc2x4Z2phaEtRZDlteWNEcW85?=
 =?utf-8?B?YUdpZjlTdjJjcGRZVm92SWlSSU01elJTbXhlcWRNbEF3WW04K2c3UDV2VzlD?=
 =?utf-8?B?Sks5QmlHaVlDR2NMbmlaUE9QVi9DUXhEL0FYYXFOMjVxNTg0dUlaaEFpVGFZ?=
 =?utf-8?B?ZkFOVUZBUSsySlpzaDZVWW93bjZQMUtxY0JNaGV1L2JrNEZsa0dsR3lENXFM?=
 =?utf-8?B?RHBFRnNBYTJ1aVJVZmNQNWlNa0p4ZTgrUEIrV1pLa3c3a1ZxYnJDSEJZRUVL?=
 =?utf-8?B?R0ZtSW5UYjZMQWZKSnJDUFErYlNiVHFOYVliUDhGQ28zdlpOaitLUmlUdGtn?=
 =?utf-8?B?enZxR0hrWUZKeWw1SGUxOTd6YWcwVHlGWVV6ckFEZE4xckpVVUtOTTRhTStF?=
 =?utf-8?B?M3o5N2dQaU1CYTdUK1ByRkhsc0hHSjl4T3pQTFdLMUtadFZVeXpuVGRoc2tR?=
 =?utf-8?B?KzNFMm9EZnFkaHNrT2pnc1NMcm43bnE4c3M2emZRVFEzTHljSy9NenJhVWJq?=
 =?utf-8?B?UzMvRWYwOFdyOWlreVEvTGtORDRLUmlwSnFTT0c1WEpORlQ3V2NJRTNUVVBs?=
 =?utf-8?B?eTBONkpXNWNCdVhQd0hBY053Q21nSkhSUk9XYng4ZGM3Y0o5ekpmeHRGdlBY?=
 =?utf-8?B?dCszamRMdmJKaGZkNHRlNUNYZVBSN0d1YXcyVnZyTFRFMUVLZDkra1huNktL?=
 =?utf-8?B?OHNHYnFPS1RvZ09xSkVWOFg5RUZ4OUczQUpZeWYxWHVaaW5saU81ME1kMTVu?=
 =?utf-8?B?WU1UNkU1eFJXRmN4T3BPSkUyT2dLK0lNSnNjSFpvZmRqMG1RSUE1ekZEUGw3?=
 =?utf-8?B?eUlvTnJZQytyS0VKeUdiNkt5bldtb1JMY0Z5Q1pTK09uYnRONHg2T3RPYjZ2?=
 =?utf-8?B?U2d0YmpOYWF6QlRZZEdFTmcyNlVWbjU2M2JGb1ZiS09QcXJ0cFlKTHd1MWpw?=
 =?utf-8?B?MEtpOXJKRHM0aEtvamFXcWZZWWVRVE9QNXYvbTA4N2VkYmFIajVtaEovRWht?=
 =?utf-8?B?ODhUL01uemt0REtEbnI4bHRZcXZYT0RycEdEVHVFQkJtNFIxeFR3NFh1TEw0?=
 =?utf-8?B?ck5YZzNQYmNCKzI5TG5EZFd2K2E1SlVmTE5lZHdsQTcrN1VtYzZaejNQYjNK?=
 =?utf-8?B?SFNOTEtIdUVTbFdYa20vT2Fnai91NmJGWEtSOW5PTG1OU0hCU3hJcWhOell2?=
 =?utf-8?B?akJpU1d5cCtUZUVQd2svVVBpUlc1RkhnUjhObFB3bXJBYzVONDAxZ0NULzky?=
 =?utf-8?B?eXhJTjdqeTJsYTlzdk9jK3c5TFNlYVpUbUxlQkZZK0I1Znd6Ulc3bHQrc1NM?=
 =?utf-8?B?WGNFN0tYeFpsVWxZTFhLcnY0SERXTzBTellOK2dFdVkvWWVzbXNXV2drRytB?=
 =?utf-8?B?WStJekJRcm1oMFIxcjdZSlJaZFBxVEhhbGkxcDRVc0JLek55VFo5WmpOVGRS?=
 =?utf-8?B?STM0Zi93WXl0R3ZWQXpMOUZDTEN5USt5UTRRT1plczZ2czdUUzd0ekc1Q0c5?=
 =?utf-8?B?THB6MFcyaDQ2THNETGxETkpzTEVtK3VLTG0vOGpjbUhhVkpteWQwSVhGS3Fa?=
 =?utf-8?B?RHRlYUJlN2E5NWMxNFJwZnA5UXdwQjZVUkZDaUJDTmZkTkg3QWdXSFJVQUJu?=
 =?utf-8?B?QVdyYmhaM1laZkFScWZWRWdVVFAxQVo5ekt0YlM0Q1JFYnpKdnY0UFphOHFD?=
 =?utf-8?B?NEl0RHZJWldHNHhHT2FUMGEwdlZxN0lCclQ2dTFOTjMrWmEvZTdVQk94K2Ew?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24741589B0BAE24DAC310D33740D87EB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d895dc1f-3417-4d40-d5d8-08ddde40495f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 10:16:24.6700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c4srNc0TZga136kAN6dnKx3Fx2S339R/UUO9K4kfto8k6k42LgWcCLqrYFOWXUpk5Lr22fT7rGysAkW2rcRhqfNbUwnRcWEt5qzyL6vqZPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9044

DQoNCk9uIDgvMTQvMjUgMjM6NDMsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA4
LTE0IDEwOjM2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDEzLjA4LjIwMjUgMjA6MjcsIERt
eXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+PiAuLi4NCj4+Pg0KPj4+IGZyb20gYHZhZGRyX3Qn
ICh0aGF0IGlzIGB1bnNpZ25lZCBsb25nJykgdG8gYHN3aXRjaF90dGJyX2ZuKicgKHRoYXQgDQo+
Pj4gaXMgYHZvaWQoKikodW5zaWduZWQgbG9uZyknKQ0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTog
RG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCj4+PiAtLS0N
Cj4+PiBUaGlzIGlzIGp1c3QgYSBSRkMgcGF0Y2guDQo+Pj4gVGhlIGNvbW1pdCBtZXNzYWdlIGlz
IG5vdCBpbXBvcnRhbnQgYXQgdGhpcyBzdGFnZS4NCj4+Pg0KPj4+IEkgYW0gc2Vla2luZyBjb21t
ZW50cyByZWdhcmRpbmcgdGhpcyBjYXNlLg0KPj4+DQo+Pj4gVGhhbmtzLg0KPj4+IC0tLQ0KPj4+
IMKgYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsIHzCoCA4
ICsrKysrKysrDQo+Pj4gwqBkb2NzL21pc3JhL2RldmlhdGlvbnMucnN0wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEwICsrKysrKysrKysNCj4+PiDCoGRv
Y3MvbWlzcmEvcnVsZXMucnN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrKysrKy0NCj4+PiDCoHhlbi9hcmNoL2FybS9hcm02
NC9tbXUvbW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MiArKw0KPj4+IMKgNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNM
QUlSL2RldmlhdGlvbnMuZWNsIGIvIA0KPj4+IGF1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VD
TEFJUi9kZXZpYXRpb25zLmVjbA0KPj4+IGluZGV4IGViY2UxY2VhYjkuLmY5ZmQ2MDc2YjcgMTAw
NjQ0DQo+Pj4gLS0tIGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlv
bnMuZWNsDQo+Pj4gKysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2Rldmlh
dGlvbnMuZWNsDQo+Pj4gQEAgLTM2NSw2ICszNjUsMTQgQEAgY29uc3RhbnQgZXhwcmVzc2lvbnMg
YXJlIHJlcXVpcmVkLlwiIg0KPj4+IMKgfQ0KPj4+IMKgLWRvY19lbmQNCj4+Pg0KPj4+ICstZG9j
X2JlZ2luPSJUaGUgY29udmVyc2lvbiBmcm9tIHVuc2lnbmVkIGxvbmcgdG8gYSBmdW5jdGlvbiBw
b2ludGVyIA0KPj4+IGRvZXMgbm90IGxvc2UgYW55IGluZm9ybWF0aW9uLCBwcm92aWRlZCB0aGF0
IHRoZSBzb3VyY2UgdHlwZSBoYXMgDQo+Pj4gZW5vdWdoIGJpdHMgdG8gcmVzdG9yZSBpdC4iDQo+
Pj4gKy1jb25maWc9TUMzQTIuUjExLjEsY2FzdHMrPXtzYWZlLA0KPj4+ICvCoCAiZnJvbSh0eXBl
KGNhbm9uaWNhbChidWlsdGluKHVuc2lnbmVkIGxvbmcpKSkpDQo+Pj4gK8KgwqAgJiZ0byh0eXBl
KGNhbm9uaWNhbChfX2Z1bmN0aW9uX3BvaW50ZXJfdHlwZXMpKSkNCj4+PiArwqDCoCAmJnJlbGF0
aW9uKGRlZmluaXRlbHlfcHJlc2VydmVzX3ZhbHVlKSINCj4+PiArfQ0KPj4+ICstZG9jX2VuZA0K
Pj4+ICsNCj4gDQo+IFRoaXMgY2hlY2sgaXMgbm90IHF1aXRlIHRhcmdldGVkIGF0IHRoaXMgc2l0
dWF0aW9uLCBhcyB0aGUgYmVoYXZpb3VyIG9mIA0KPiBkaWZmZXJlbnQgY29tcGlsZXJzIGlzIGEg
Yml0IG9mIGEgZ3JleSBhcmVhIChldmVuIEdDQywgdGhvdWdoIHRoYXQgd29ya3MgDQo+IGluIHBy
YWN0aWNlKS4gVGhlIHJlbGF0aW9uIGlzIG1vc3RseSBhaW1lZCBhdCB0ZXN0aW5nIHdoZXRoZXIg
dGhlIA0KPiBwb2ludGVyIGFyZSByZXByZXNlbnRlZCB1c2luZyB0aGUgc2FtZSBudW1iZXIgb2Yg
Yml0cyBhcyB1bnNpZ25lZCBsb25nIA0KPiAod2hpY2ggaGFwcGVucyB0byBiZSB0aGUgY2FzZSBm
b3J0dW5hdGVseSkuDQoNCkhpIE5pY29sYS4NCg0KV2VsbCwgd2UncmUgdGVsbGluZyBFY2xhaXIg
dGhlIGNvbnZlcnNpb24gdHlwZXMgZnJvbSgpIGFuZCB0bygpLCBidXQgY2FuIA0KRWNsYWlyIGRl
dGVybWluZSB0aGVpciBzaXplcyAoaW4gYml0cykgZm9yIHBhcnRpY3VsYXIgYXJjaGl0ZWN0dXJl
Pw0KSSBtZWFuLCBpcyBpdCBwb3NzaWJsZSB0byBhdm9pZCB0aGlzICJzaXplb2YodW5zaWduZWQg
bG9uZykgPT0gDQpzaXplb2Yodm9pZCAoKikoKSkiIGluIHNvdXJjZSBjb2RlIHVzaW5nIG9ubHkg
RWNsYWlyIGNvbmZpZ3M/DQoNCkRteXRyby4NCg0KPiANCj4+PiDCoC1kb2NfYmVnaW49IlRoZSBj
b252ZXJzaW9uIGZyb20gYSBmdW5jdGlvbiBwb2ludGVyIHRvIGEgYm9vbGVhbiBoYXMgDQo+Pj4g
YSB3ZWxsLWtub3duIHNlbWFudGljcyB0aGF0IGRvIG5vdCBsZWFkIHRvIHVuZXhwZWN0ZWQgYmVo
YXZpb3VyLiINCj4+PiDCoC1jb25maWc9TUMzQTIuUjExLjEsY2FzdHMrPXtzYWZlLA0KPj4+IMKg
wqAgImZyb20odHlwZShjYW5vbmljYWwoX19mdW5jdGlvbl9wb2ludGVyX3R5cGVzKSkpDQo+Pj4g
ZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QgYi9kb2NzL21pc3JhL2Rldmlh
dGlvbnMucnN0DQo+Pj4gaW5kZXggM2M0NmExZTQ3YS4uMjc4NDg2MDJmNiAxMDA2NDQNCj4+PiAt
LS0gYS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4gKysrIGIvZG9jcy9taXNyYS9kZXZp
YXRpb25zLnJzdA0KPj4+IEBAIC0zNDgsNiArMzQ4LDE2IEBAIERldmlhdGlvbnMgcmVsYXRlZCB0
byBNSVNSQSBDOjIwMTIgUnVsZXM6DQo+Pj4gwqDCoMKgwqDCoMKgwqAgdG8gc3RvcmUgaXQuDQo+
Pj4gwqDCoMKgwqDCoCAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4NCj4+Pg0KPj4+ICvC
oMKgICogLSBSMTEuMQ0KPj4+ICvCoMKgwqDCoCAtIFRoZSBjb252ZXJzaW9uIGZyb20gdW5zaWdu
ZWQgbG9uZyB0byBhIGZ1bmN0aW9uIHBvaW50ZXIgZG9lcyANCj4+PiBub3QgbG9zZSBhbnkNCj4+
PiArwqDCoMKgwqDCoMKgIGluZm9ybWF0aW9uIG9yIHZpb2xhdGUgdHlwZSBzYWZldHkgYXNzdW1w
dGlvbnMgaWYgdGhlIA0KPj4+IHVuc2lnbmVkIGxvbmcgdHlwZQ0KPj4+ICvCoMKgwqDCoMKgwqAg
aXMgZ3VhcmFudGVlZCB0byBiZSBhdCBsZWFzdCBhcyBsYXJnZSBhcyBhIGZ1bmN0aW9uIHBvaW50
ZXIuIA0KPj4+IFRoaXMgZW5zdXJlcw0KPj4+ICvCoMKgwqDCoMKgwqAgdGhhdCB0aGUgZnVuY3Rp
b24gcG9pbnRlciBhZGRyZXNzIGNhbiBiZSBmdWxseSByZXByZXNlbnRlZCANCj4+PiB3aXRob3V0
DQo+Pj4gK8KgwqDCoMKgwqDCoCB0cnVuY2F0aW9uIG9yIGNvcnJ1cHRpb24uIE1hY3JvIEJVSUxE
X0JVR19PTiBjYW4gYmUgDQo+Pj4gaW50ZWdyYXRlZCBpbnRvIHRoZQ0KPj4+ICvCoMKgwqDCoMKg
wqAgYnVpbGQgc3lzdGVtIHRvIGNvbmZpcm0gdGhhdCAnc2l6ZW9mKHVuc2lnbmVkIGxvbmcpID49
IA0KPj4+IHNpemVvZih2b2lkICgqKSgpKScNCj4+PiArwqDCoMKgwqDCoMKgIG9uIGFsbCB0YXJn
ZXQgcGxhdGZvcm1zLg0KPj4NCj4+IElmIHNpemVvZih1bnNpZ25lZCBsb25nKSA+IHNpemVvZih2
b2lkICgqKSgpKSwgdGhlcmUgaXMgbG9zcyBvZiANCj4+IGluZm9ybWF0aW9uLg0KPj4gVW5sZXNz
IChub3Qgc2FpZCBoZXJlKSB0aGUgdW5zaWduZWQgbG9uZyB2YWx1ZSBpdHNlbGYgaXMgdGhlIHJl
c3VsdCBvZg0KPj4gY29udmVydGluZyBhIGZ1bmN0aW9uIHBvaW50ZXIgdG8gdW5zaWduZWQgbG9u
Zy4gV2hldGhlciBhbGwgb2YgdGhhdCANCj4+IHRvZ2V0aGVyDQo+PiBjYW4gYmUgcHJvcGVybHkg
ZXhwcmVzc2VkIHRvIEVjbGFpciBJIGRvbid0IGtub3cuIEhlbmNlLCBhcyBUZWRkeSBhbHJlYWR5
DQo+PiBzdWdnZXN0ZWQsID09IG1heSB3YW50IHNwZWNpZnlpbmcgaW5zdGVhZC4NCj4+DQo+IA0K
PiArMTsgaXQgbWlnaHQgYmUgd29ydGggdG8gYWRkIGJvdGggdGhlIGVjbGFpciBjb25maWcgYW5k
IHRoZSANCj4gQlVJTERfQlVHX09OLCBub3RpbmcgdGhhdCBuZWl0aGVyIGlzIHN1ZmZpY2llbnQg
b24gaXRzIG93bjogdW5sZXNzIHRoZSANCj4gY29tcGlsZXIgZ3VhcmFudGVlcyBub3QgdG8gZmlk
ZGxlIHdpdGggdGhlIHZhbHVlIGlzIHVuYWx0ZXJlZCB3aGVuIGNhc3QgDQo+IGJhY2sgYW5kIGZv
cnRoIGFsbCBjaGVja3Mgb24gdGhlIG51bWJlciBvZiBiaXRzIGFyZSBtb290Lg0KPiANCj4+PiAt
LS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvbW11L21tLmMNCj4+PiArKysgYi94ZW4vYXJjaC9hcm0v
YXJtNjQvbW11L21tLmMNCj4+PiBAQCAtMTUwLDYgKzE1MCw3IEBAIHZvaWQgX19pbml0IHJlbG9j
YXRlX2FuZF9zd2l0Y2hfdHRicih1aW50NjRfdCB0dGJyKQ0KPj4+IMKgwqDCoMKgIHZhZGRyX3Qg
aWRfYWRkciA9IHZpcnRfdG9fbWFkZHIocmVsb2NhdGVfeGVuKTsNCj4+PiDCoMKgwqDCoCByZWxv
Y2F0ZV94ZW5fZm4gKmZuID0gKHJlbG9jYXRlX3hlbl9mbiAqKWlkX2FkZHI7DQo+Pj4gwqDCoMKg
wqAgbHBhZV90IHB0ZTsNCj4+PiArwqDCoMKgIEJVSUxEX0JVR19PTihzaXplb2YodW5zaWduZWQg
bG9uZykgPCBzaXplb2YoZm4pKTsNCj4+Pg0KPj4+IMKgwqDCoMKgIC8qIEVuYWJsZSB0aGUgaWRl
bnRpdHkgbWFwcGluZyBpbiB0aGUgYm9vdCBwYWdlIHRhYmxlcyAqLw0KPj4+IMKgwqDCoMKgIHVw
ZGF0ZV9pZGVudGl0eV9tYXBwaW5nKHRydWUpOw0KPj4+IEBAIC0xNzgsNiArMTc5LDcgQEAgdm9p
ZCBfX2luaXQgc3dpdGNoX3R0YnIodWludDY0X3QgdHRicikNCj4+PiDCoMKgwqDCoCB2YWRkcl90
IGlkX2FkZHIgPSB2aXJ0X3RvX21hZGRyKHN3aXRjaF90dGJyX2lkKTsNCj4+PiDCoMKgwqDCoCBz
d2l0Y2hfdHRicl9mbiAqZm4gPSAoc3dpdGNoX3R0YnJfZm4gKilpZF9hZGRyOw0KPj4+IMKgwqDC
oMKgIGxwYWVfdCBwdGU7DQo+Pj4gK8KgwqDCoCBCVUlMRF9CVUdfT04oc2l6ZW9mKHVuc2lnbmVk
IGxvbmcpIDwgc2l6ZW9mKGZuKSk7DQo+Pj4NCj4+PiDCoMKgwqDCoCAvKiBFbmFibGUgdGhlIGlk
ZW50aXR5IG1hcHBpbmcgaW4gdGhlIGJvb3QgcGFnZSB0YWJsZXMgKi8NCj4+PiDCoMKgwqDCoCB1
cGRhdGVfaWRlbnRpdHlfbWFwcGluZyh0cnVlKTsNCj4+DQo+PiBCVUlMRF9CVUdfT04oKSBpcyBh
IHN0YXRlbWVudCwgbm90IGEgZGVjbGFyYXRpb24sIGFuZCBoZW5jZSB3YW50cyANCj4+IGdyb3Vw
aW5nDQo+PiBhcyBzdWNoLiBRdWVzdGlvbiBpcyB3aGV0aGVyIHdlIGluZGVlZCB3YW50IHRvIHNw
cmlua2xlIHN1Y2ggY2hlY2tzIGFsbA0KPj4gb3ZlciB0aGUgY29kZSBiYXNlLiAoSSBleHBlY3Qg
dGhlIHR3byBjYXNlcyBoZXJlIGFyZW4ndCBhbGwgd2UgaGF2ZS4pDQo+Pg0KPiANCj4gKzEgYXMg
d2VsbC4gSSB3b3VsZCBleHBlY3Qgc3VjaCBjaGVjayB0byBsaXZlIGUuZy4gaW4gY29tcGlsZXIu
aCBvciBhbnkgDQo+IHNpbWlsYXJseSBnZW5lcmFsIGhlYWRlciwgc2luY2UgdGhpcyBpcyBhIHdp
ZGVzcHJlYWQgYW5kIGxhcmdlbHkgYXJjaC0gDQo+IG5ldXRyYWwgcHJvcGVydHkgdGhhdCBYZW4g
d2FudHMgdG8gYmUgYWx3YXlzIHRydWUgSSBiZWxpZXZlLg0KPiANCg==


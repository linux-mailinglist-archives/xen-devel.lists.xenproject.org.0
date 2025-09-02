Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC3B405DC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106575.1457231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRYX-0007ui-1A; Tue, 02 Sep 2025 14:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106575.1457231; Tue, 02 Sep 2025 14:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRYW-0007rY-TX; Tue, 02 Sep 2025 14:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1106575;
 Tue, 02 Sep 2025 14:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Qz2=3N=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1utRYV-0007rQ-0X
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:00:15 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25165379-8805-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 16:00:13 +0200 (CEST)
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::20)
 by PA3PR03MB10986.eurprd03.prod.outlook.com (2603:10a6:102:4b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:00:07 +0000
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b]) by AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 14:00:04 +0000
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
X-Inumbo-ID: 25165379-8805-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmYtBpjo5bnDSBC39SHaefVtxAF/hIeh6zx9A06TuhHCSSLR28iaw/fRIC/3a9YrMh7SiVXabLxg0tI51GYmB2E6xlgNJWjh0qEhN5aDOrlSunuxlaz1CZz8RHqC3eeRw5DKQEr6BX+FIcUmhql2AZVWwCV1xL6fwNfr2wLV0v1WQFe0oLjG/k7hyXj97NZEwQyUA63QdDomutyJaOn8XP/5Nrkja41/pDbsf3bW10Z7gY3JLniuz6NAVIL8aQD4lIEHZtdgJge/5U/ps1Ljpkug6cxb25kgLkiWyMnF4poRtLku0D0jdbzv18m/SUVeC0OYAFPyKrRsEfTbG7Gvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKRwr53RkXkGRX1RJoB38hxDAO8hBpLydUe5unxQn8w=;
 b=X0aPgAsU5UwnQQBQ2FWrIgxjlmEKxqA5xM4WCBvua8gi5Rw0hf943mKyV0xwVh7TU4j4OjzwhEBrN7M0kjMZRij/pYb5LqGjrwa9j7tpGNZIdpPVpDqHKxq3vXvgiAnoOvkLWcRqjknyHtTg8Ppgw7FVqf5lIqGbm1gMolLsikuWxo9m+5QUpL9PFo7TgCwJ25XG8dxt18T2IfhkKULt6Tuxj2Aw1FLdaeMzusae6mCSi4b+KrJ0GkTKBrop1WJGybrFu+dsLdehgI8K4YUMT90xvEC4t22JMfGydHtzKg83Z9/J2fXzn09eLK5f/GdVCg3VcNLwrbDZ3+fl4G7XAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKRwr53RkXkGRX1RJoB38hxDAO8hBpLydUe5unxQn8w=;
 b=vnFU4se8kS6lMP56fxcwoqhyPOzJ9ubmYaxeyQ66jLGLaN1zXwOD3mf9QNam+RRdCY61KjgG5fA4WNCStnXmWBOgplGGjEDdrl09IchU+9QDauuRQMK3RoJnm0pBJFAUtf+MzrCVm48LMiDZgriwgFToIlLVt9I0S3KcsHLaC7dajm116hnuNVNtQ12T227Q684puK4dZhHXOhQuvnQ/QKTX/aGVh0J1Hp0hxaLDQ2w1jlMplBqDDSh2QuD+JbMchR3JslNPiUtdU0IO5w1Nq+O8wb/fUV2KpYgcJ0MJNZ7xkRNK7erzFZJ9HyJ9Oo7E92vLkJJ8N6MbqIM10BEmOA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Orzel, Michal"
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Thread-Topic: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Thread-Index: AQHcG+7h2TGQQIBGXEebyEy6VBbgNLR/rhaAgAAaygCAAARKgIAAAqcAgAAcDQA=
Date: Tue, 2 Sep 2025 14:00:04 +0000
Message-ID: <411d7b0f-01b8-46df-9bce-929eec366d2d@epam.com>
References: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
 <319c280a-535d-498a-b0ab-93882663e23b@amd.com>
 <b2968b50-3ca6-416b-86d9-c809ef87c567@xen.org>
 <4e01ed71-cdbb-4d41-8845-33449b08494b@amd.com>
 <8af7ca62-2f05-47d9-8604-170e7a40d8a0@xen.org>
In-Reply-To: <8af7ca62-2f05-47d9-8604-170e7a40d8a0@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7025:EE_|PA3PR03MB10986:EE_
x-ms-office365-filtering-correlation-id: 627a8e1c-a3ef-4869-3011-08ddea2904a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bGpjTHBOdWJkWHpZSTRzQWM0TzBoZ2s5VWZUV2MwcENBUzdjYVRxb3czbTAr?=
 =?utf-8?B?enNnY2RpNU9idkhCbFBFZ29md2lORkNZczQ1Ui8zNWV2ZW5kYTgxeXB3MWc2?=
 =?utf-8?B?VkZtaWE0WFFHOERVWFY2ZWpqOVhRMmNvTlAybm5WcnB5OWxkaW5BZkc0VkxW?=
 =?utf-8?B?djZSKysweDNvNlI4bDFsL3Z5RUdBc1VLREgxKzMrQ2VzRkpKTjJaUlpIbTNK?=
 =?utf-8?B?WDFhNWlFYm9mbDhjR3lLdlY2a3hGNVcvOWRpK0NUKzFTUklXYjYyejl0dy9R?=
 =?utf-8?B?WncyakVxZ0pCc3VWTTdjQUFXSkZPZTh2ZzlvM3M1cWJ4L2VpMFFZakpoS2J1?=
 =?utf-8?B?VTdHVlozemRhQjBwQTVtWm1VMTk0QkUxL0IrRDVqY3czNTliRFlZYWw5SHJZ?=
 =?utf-8?B?RmgvL0x0M09EMHg5M2VCdDFxM3NCRmU3ak5sRlNrZTgrelJaOG5odmE3M0JG?=
 =?utf-8?B?MWUyamdqcU5OVTI5YTFPOEZndHl6Y1FNay9yZFZnTjhGYXYrYXFNOHdvK3hi?=
 =?utf-8?B?cHdNMWdUbjVFR1BDUkxhaGxlQmhSck5vcE92MndFa0ZvR0ttRmFpN05JTXow?=
 =?utf-8?B?Q0lLOTRSZVVhaGxtZjExK0U0QUU5Z2VIK0lIM2RneGJLOHVGdkNKRjAwUlBw?=
 =?utf-8?B?OW4zTlUzaDNjN3NRTkZGMlhoTUt0bTNjU3JkOHV5K0J4ekRTU3c0R1lDdEZF?=
 =?utf-8?B?YXZpMnRIWXBjUEs3Y0IzWEFSV3NZZG84cGhhU2pwVWJOTEZMQldud05mZW1r?=
 =?utf-8?B?SGZxbVNHNm80b0lzTW5lL0tja2RjVmNZVWQ1Wk5tVEFpYld4SGdQcFprZFZj?=
 =?utf-8?B?TVo3OXN0ZU1GYzlZZkVpTzFPK0pDTjV2eU9hNDkzU24wTWFhMnJCZ2Jrb05j?=
 =?utf-8?B?cTgzNll6bWE1Y2tMamVUZzhtaTNKZVF3RW1MMVY3dEVZMnpQc05EeSthSVlU?=
 =?utf-8?B?SG9POEl2dlArZHBXM1FpeHMzNUtKNGNaY2xnZ2RyR1E1QTV6V2pxQzZYUkVX?=
 =?utf-8?B?RWgrU015eG1Tc1FwL3Jxc2U2bVYzQUZTNVY4MVhjYk8vU0I2cmNSaU10THp0?=
 =?utf-8?B?RzBFNWNGNzk3dTQvUDdickRRR05CWFphQ3NSajZETzNjdktTdTVLSnRqempM?=
 =?utf-8?B?bEtzRDI5cTBKQ1BxQmUrbFh0UTRQN2NXdXpQY2xMUDJVR05oSTQ4andTV1Bi?=
 =?utf-8?B?Z3JzQ0Fud0hNYWgwQXB4YUlEMURUTEZPQzdFbnJWNWl6WVBUWGxLbDhCblFq?=
 =?utf-8?B?ZWhPc0p6T004aVNXeXd2VHF6Y0RsT0psTWY1bjcrV0RUc1ZOQVFTNytNdTN1?=
 =?utf-8?B?NVNlZ2R3NnVuQmI1V1ZKOEhUcXhNcU1rTk1aNnNWRnZBOWREajVReWlsZloy?=
 =?utf-8?B?V0dwUUFaNEdJOHFuUnVieDZ3bGEwaGtjTGhzN2l4a2x6MXJlTFplZTJtU05U?=
 =?utf-8?B?MTdFaTJzTkx4RmRJT0lVYVhmRUlNL2RiUmJFanVvMlNQTk5LTEhrTm9zS3px?=
 =?utf-8?B?STNrbjh2VGdFcXhZa3FRKzMwRUFnRXU5K1JMOHAweEIyRlIvck83WURsMmhk?=
 =?utf-8?B?YVMxeVh5SXovNDJRSHRoVTd2NG9vVW9tVms1Rjk4S1VwQUg3eUlKZHNybG9o?=
 =?utf-8?B?UDdqSDR5R0xKZTNiS0d2TVhUL01uRGZrSTVOeFRNZm4vTmVkTFZ1VjYzUUVi?=
 =?utf-8?B?QXZBcTFGYVBsbFpvOUxNcjJGUWdLSVlFbE5nL1ppRTBLUHV4a0o3YjF0NXdu?=
 =?utf-8?B?N0J0bE94cmovdTdQUzc0VTZrMzFuTGZkNW1MMnZPWmFHd0xGVU9qTVpBQ1VN?=
 =?utf-8?B?WmpyLzhndVh6ZXhmQzJoZmdaSzFaNHdnVGFvMys3NmlJWlY2SnVnNGRUOGxl?=
 =?utf-8?B?NXVDSHRBYTEyNGVPQXorekNpa0h5RjRzY3ZMbXp6dXpzenY1b1d1b3ZkdjhU?=
 =?utf-8?Q?Vg13mL9EcrI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7025.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NjhKTGxkTXV1bWRyQ2M3YXpTTUhFaTdLRnlZbU9YVVlDM1NPV21DV3gvQUpK?=
 =?utf-8?B?dmlYeHZzbW9FMXJ4MTRyaEpqRHhFVHduNEltSHBIdmtzVXRGdnRIeDFlRGlx?=
 =?utf-8?B?bFRZTUtPNUUvUXNaZ0dVV1UvZDFCYVJEVEdvU0psTHRhNzNsMDZvcWUrUVhl?=
 =?utf-8?B?WVpOWmFXZSs3b1NhYkZpSlcvUHh5NjlqT1p2Z21GZHh2bUdvN0M0SlRQV044?=
 =?utf-8?B?aW9tb3R1TEMvSW1ScnNpb3B0WEx0a205cWsvMkdIS01NKy9VR3M4NGFvbDBW?=
 =?utf-8?B?b3RPUzZjSkFvNkpGTXBTTnlnanlmcytwelV0bytOdU00S1dPeG5FVDlMSldX?=
 =?utf-8?B?SndYb2tWQVVSQkJHQ0tnclZJREd6UVpLakZkc0RnOFk4Tzd1NGR5bjdsd3BN?=
 =?utf-8?B?aTJlTjc1T0d3ZnJ1MmxZMFoxUHVPSll0L1NkTVRrSHJ5eG9XTmRYNlRUYXMw?=
 =?utf-8?B?WDFNRzd0UlBtNlh2UkxjSkkxWmd1U0NLOGF6aGRta1hKZko4c0RqWkcxQ1JI?=
 =?utf-8?B?Y05tVkVzQzV2LzdCSVltYzNmNU01cVM3bTJsYndvc3dGYmdEYTg2ekNxVHpZ?=
 =?utf-8?B?VEUrWE52bktLVTVRKzFVYnhQdDkyRUpoZ0x5aldFN3RCNzVmMC9CaHMySmVp?=
 =?utf-8?B?R1lRV2ZhZEV4YWhydlI3c3lOb3JOR1BaSkc3Mk53ams1WjZ6MEhtNE9BSHJy?=
 =?utf-8?B?LzRuTnd2MVpLTWxPSTRyaC9RblkvSkM4Ui93eUMyaXA4TXlpS0JPWjNXLzBI?=
 =?utf-8?B?M1AvTkhjYnN2QkhoVzZaMUg2VS9CU2RIbS9rVnM0bnpxd1RPZW5heHZva2hO?=
 =?utf-8?B?N0h4R044SjkzWXQvVFBzWFZJd3M5dlUrYnFpcDRwcTNkUXNydjdZbTVBYkpB?=
 =?utf-8?B?SXVMYWRSeC9RY2FnNFZ6OHo0amlsNXZ1a2N0N2RwdmtsUEl1MFhjUGU3dWNs?=
 =?utf-8?B?ZDJOVFBWeTBqM0RHNTREOVUycytWVjR5RU1PSnJKS1IrbUpBcXpwcWZOOUxV?=
 =?utf-8?B?SlN5ZHZaUXdLZktWM0NpcVZKUzJ6M3REOEJtQStRT1EzK0wvWFFTOFBrUEcv?=
 =?utf-8?B?TWh1V0VYdjBIODJZemJxVUJKNnZmR0wza0NzRy9aMG9vTHhOdVhpMjYxRVVw?=
 =?utf-8?B?enNaNzA0dGlheUtDRStBRFU1Zmd6S2grQStWWlBqWTdMbGtvUFZhY2NoM0pY?=
 =?utf-8?B?VE1ON0V5NnplcXZpZFowY25NTXpDU2grM1V2cVN3NExmMERWanN1WDNUNGtk?=
 =?utf-8?B?NERSQlY5RHRnTXJjY0h5ajI4YUJrZUs4UGthOHdrR1B5WGVnZVlPM2RNcFp2?=
 =?utf-8?B?VnFjWk9EblNkc3NWL09tdnZkUFhyaGxLZStoRUZvUXJ0cFlGcU0rN0xYUWNW?=
 =?utf-8?B?NG9VWDRaNGhtMnVUZXBIUmFlN0daK0dscURpZFlGYVJUTTIwdXhVdjdmZHBa?=
 =?utf-8?B?THBWREo3NkxTUS9lRkcrNDA4OHJXTW4xdml5OXMzaGdMbnB3d1FCazd1L2tJ?=
 =?utf-8?B?KzZLMnYxOUwxYjRVZncvOHJuaE5qMjdKd0xMc25VcmlsQUtmbG5CZ3M1UWJh?=
 =?utf-8?B?RDQ5S2NiNHppOUs4Tmh5bDRlb2ptSERJbFN0QTFZNGdKUDRESXdNM2E5MERs?=
 =?utf-8?B?M1VDMk1tNDBZNEt0T1A0WFRzaXpZck9HVGY5UjUxdUN3bTF6Ly9NYkY1RGV1?=
 =?utf-8?B?TnltcDRJVjB1bkNQN0pZaS9SWHJQYWt1VnNkaDdub05hL0s3WmFJbzBIRk9w?=
 =?utf-8?B?TVVsOElUazJSTDFXWGlzSVlmMGxOTU92emtxSGlvaEk5Mm4yZ0R5MTR5czRD?=
 =?utf-8?B?UmVlK0hWMGtwQTBOMDBZbjdEZnA0dnFHYmVuSDVGa0VQNTNDLzd0OEdXazlQ?=
 =?utf-8?B?ZGEvN0NlZG81Szc0Q1FjRkVSVHVRWjR1UlFhanB2WlFGbkNXN3FNUTFUb0NG?=
 =?utf-8?B?VE9iZ3VnTnc3K1JsOGl1M29xWDVtUllpNzZRSlVDenRiLzFDWGtuYktBS0l1?=
 =?utf-8?B?MWNUeWthVWpFTUlIZE80aks0dGE1aVRNS09ocGhuTXlTK1Ruakl0WnVyNXBp?=
 =?utf-8?B?c1lSYlkvc1prOFQ5N3JHZDNyOTZSVG9NL3RuUFF0WkJlTTZYczZ5SWVOc0wx?=
 =?utf-8?B?Y29KU1NCd1JGcGUzdUsrR3BHVW5uYVZjTVMvVGZQTDhqRUJGbGZVdy9Id252?=
 =?utf-8?Q?3y6KXRHqInKHlg3ePF3fJJ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C91ACFDA969D9D4D90A9FEAB050507B0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7025.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627a8e1c-a3ef-4869-3011-08ddea2904a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 14:00:04.8569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xut7Sf7pZ3ZaTrThr4U9f8ZE4vNXYkUGmEvf4r09WzLXZDj2pSPgph6KAdLcW+FanlDXO2dp/Y/vFtcFBmEgFVwdhz94dus6N5nT8CePxmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10986

DQoNCk9uIDAyLjA5LjI1IDE1OjE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQoNCkhlbGxvIEp1bGll
bg0KDQo+IE9uIDAyLzA5LzIwMjUgMTM6MTAsIE9yemVsLCBNaWNoYWwgd3JvdGU6DQo+Pg0KPj4N
Cj4+IE9uIDAyLzA5LzIwMjUgMTM6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+
Pg0KPj4+IE9uIDAyLzA5LzIwMjUgMTE6MTgsIE9yemVsLCBNaWNoYWwgd3JvdGU6DQo+Pj4+DQo+
Pj4+DQo+Pj4+IE9uIDAyLzA5LzIwMjUgMTE6NDksIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4gVGhlIHNhaWQgc3ViLW9wIGlzIG5vdCBzdXBwb3J0ZWQgb24gQXJtLCBzaW5jZSBp
dDoNCj4+Pj4+IMKgwqAgLSBkb2VzIG5vdCBzdXBwb3J0IHRoZSBidWZmZXJlZCBlbXVsYXRpb24g
KHNvIGJ1ZmlvcmVxX3BvcnQvIA0KPj4+Pj4gYnVmaW9yZXFfZ2ZuDQo+Pj4+PiDCoMKgwqDCoCBj
YW5ub3QgYmUgcmV0dXJuZWQpLCBwbGVhc2UgcmVmZXIgdG8gaW9yZXFfc2VydmVyX2NyZWF0ZSgp
DQo+Pj4+PiDCoMKgIC0gZG9lcyBub3Qgc3VwcG9ydCAibGVnYWN5IiBtZWNoYW5pc20gb2YgbWFw
cGluZyBJT1JFUSBTZXJ2ZXINCj4+Pj4+IMKgwqDCoMKgIG1hZ2ljIHBhZ2VzIChzbyBpb3JlcV9n
Zm4vYnVmaW9yZXFfZ2ZuIGNhbm5vdCBiZSByZXR1cm5lZCksIA0KPj4+Pj4gcGxlYXNlDQo+Pj4+
PiDCoMKgwqDCoCByZWZlciB0byBhcmNoX2lvcmVxX3NlcnZlcl9tYXBfcGFnZXMoKS4gT24gQXJt
LCBvbmx5IHRoZSBBY3F1aXJlDQo+Pj4+PiDCoMKgwqDCoCBSZXNvdXJjZSBpbmZyYXN0cnVjdHVy
ZSBpcyB1c2VkIHRvIHF1ZXJ5IGFuZCBtYXAgdGhlIElPUkVRIA0KPj4+Pj4gU2VydmVyIHBhZ2Vz
Lg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVr
c2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnpl
bCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+Pj4+DQo+Pj4+IENvdWxkIHdlIHBlcmhhcHMgYWRk
IGEgRml4ZXMgdGFnIGhlcmUgcG9pbnRpbmcgdG8gdGhlIGNvbW1pdCANCj4+Pj4gaW50cm9kdWNp
bmcgdGhlc2UNCj4+Pj4gRE0gb3BzIGFuZCB0aHVzIGFkZCB0aGlzIHBhdGNoIGZvciB0aGlzIHJl
bGVhc2U/IE5vdCBzdXJlIHdoYXQgDQo+Pj4+IG90aGVycyB0aGluay4NCj4+Pg0KPj4+IEZpeGVz
IHVzdWFsbHkgaW1wbGllcyBhIGJ1ZyBhbmQgSSBkb24ndCBzZWUgd2hhdCBidWcgd2UgYXJlIHNv
bHZpbmcuIEluDQo+Pj4gZmFjdCwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB3ZSBhcmUgdHJ5aW5n
IHRvIHJlbW92ZSB0aGUgc3Vib3AuLi4NCj4+IEhtbSwgdGhlIGlzc3VlIGlzIHRoYXQgdGhlIHN1
Ym9wIHRoYXQgaXMgbm90IHN1cHBvcnRlZCBhdCB0aGUgbW9tZW50IA0KPj4gaXMgbGlzdGVkDQo+
PiBhcyBzdXBwb3J0ZWQgaW4gdGhlIHB1YmxpYyBoZWFkZXIuDQo+IA0KPiBbLi4uXQ0KPiANCj4+
IEFzIGZvciB0aGUgY29kZSwgZnJvbSBzYWZldHkgcGVyc3BlY3RpdmUgaWYgdGhpcyBzdWJvcCBp
cyBsaXN0ZWQgDQo+PiBleHBsaWNpbHR5IGluIEFybSdzDQo+PiBkbS5jLCB3ZSB3b3VsZCBuZWVk
IHRvIHdyaXRlIGEgc2VwYXJhdGUgdGVzdCBjYXNlIGFuZCB0ZXN0IHRvIGNvdmVyIGl0IA0KPj4g
dGhhdCBhdA0KPj4gdGhlIGVuZCwgc3RpbGwgcmV0dXJucyAtRU9QTk9UU1VQUC4NCj4gDQo+IFdo
eSBkbyB5b3UgdGhpbmsgaXQgaXMgbm90IHN1cHBvcnRlZD8gQUZBSUNULCBpdCBpcyBzdGlsbCBw
b3NzaWJsZSB0byANCj4gcGFzcyBYRU5fRE1PUF9ub2duZnMgdG8gZmlndXJlIG91dCB3aHdldGhl
ciBidWZpb3JlcSBpcyBjdXJyZW50bHkgDQo+IGF2YWlsYWJsZS4gVGhlIGVycm9yIGNvZGUgd291
bGQgYmUgMCBub3QgLUVPUE5PVFNVUFAuDQoNCg0KWWVzLCBieSBwYXNzaW5nIFhFTl9ETU9QX25v
X2dmbnMgd2Ugd2lsbCBieXBhc3MgDQphcmNoX2lvcmVxX3NlcnZlcl9tYXBfcGFnZXMoKSBjYWxs
LCBhbmQgeWVzLCBpb3JlcV9zZXJ2ZXJfZ2V0X2luZm8oKSANCndpbGwgcmV0dXJuIDAgaW4gdGhh
dCBjYXNlLg0KDQpCdXQsICJidWZpb3JlcV9wb3J0IiBmaWVsZCBpbiBzdHJ1Y3QgeGVuX2RtX29w
X2dldF9pb3JlcV9zZXJ2ZXJfaW5mbyANCihvdXQgcGFyYW0pIHdvbid0IGJlIHJlYWxseSB1cGRh
dGVkIChzaW5jZSB0aGUgSU9SRVEgU2VydmVyIHdhcyBjcmVhdGVkIA0Kd2l0aCBIVk1fSU9SRVFT
UlZfQlVGSU9SRVFfT0ZGIGJlZm9yZSB0aGF0KS4NCg0KU28sICJhdCB0aGUgbW9tZW50IiwgWEVO
X0RNT1BfZ2V0X2lvcmVxX3NlcnZlcl9pbmZvIHN1Yi1vcCBpcyANCm5vbi1mdW5jdGlvbmFsL3Vz
ZWxlc3Mgb24gQXJtICgidW5zdXBwb3J0ZWQiIGlzIHByb2JhYmx5IG5vdCBhIHByZWNpc2UgDQp3
b3JkIGluIHRoYXQgcGFydGljdWxhciBjYXNlKSwgdGhpcyBpcyBteSB1bmRlcnN0YW5kaW5nICh3
aGljaCBtaWdodCBiZSANCndyb25nKS4gVGhhdCBpcyB3aHkgSSBoYXZlIHNlbnQgYSBwYXRjaCB0
byByZW1vdmUgdGhlIG1lbnRpb24gZnJvbSB0aGUgDQpwdWJsaWMgaGVhZGVyLg0KDQoNCj4gDQo+
ICA+IEkgdGhpbmsgaWYgd2UgbWlzdGFrZW5seSBtZW50aW9uIHN0aCBhcz4gc3VwcG9ydGVkIGlu
IGUuZy4gU1VQUE9SVC5tZCANCj4gd2Ugd291bGQgaGF2ZSBubyBpc3N1ZXMgYWRkaW5nIGEgRml4
ZXMgdGFnLiBUaGVyZQ0KPiAgPiBhcmUgbWFueSBjYXNlcyB3aGVyZSBGaXhlcyB3YXMgdXNlZCBq
dXN0IHRvIGNoYW5nZSBzb21ldGhpbmcgaW4gYSANCj4gY29tbWVudCwgc28NCj4gID4gSSdtIGhh
dmluZyBhIGhhcmQgdGltZSByZWFzb25pbmcgYWJvdXQgd2hlbiBpdCdzIGFwcHJvcHJpYXRlIHRv
IHVzZSBpdC4NCj4gSSB0aGluayB3aGF0IHdlIHdvdWxkIHdhbnQgaXMgIkFtZW5kcyIuIFRoaXMg
aXMgY3VycmVudGx5IHByb3Bvc2VkIGJ5IFsxXS4NCg0KR29vZCBwb2ludC4NCg0KDQo+IA0KPiBb
MV0gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/IA0KPiB1
cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtlcm5lbC5vcmclMkZ4ZW4tZGV2ZWwlMkZlN2M5OTExNi1m
NmE5LTQzZTEtODBhZS0gDQo+IGIzYTRkNDQ4NTdiNyU0MGFtZC5jb20lMkZUJTJGJTIzdCZkYXRh
PTA1JTdDMDIlN0NPbGVrc2FuZHJfVHlzaGNoZW5rbyU0MGVwYW0uY29tJTdDMjcwMjQ5MDJiMTRj
NDJiN2VhZjYwOGRkZWExYjAxNzMlN0NiNDFiNzJkMDRlOWY0YzI2OGE2OWY5NDlmMzY3YzkxZCU3
QzElN0MwJTdDNjM4OTI0MTIzOTM0ODM1OTU3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZi
WEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lr
Rk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT03bzFDcE5r
WFB4SFFxcW5XQlBFVXkxUTElMkJqTCUyRk03Vm1Uck1UN2ZPdTRMdyUzRCZyZXNlcnZlZD0wDQo+
IA0KPj4NCj4+IH5NaWNoYWwNCj4+DQo+IA0K


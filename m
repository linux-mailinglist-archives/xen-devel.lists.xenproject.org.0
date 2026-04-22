Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMFJBhKL6Gk6LgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:47:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77986443A09
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290018.1569695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTEU-0007s8-AJ; Wed, 22 Apr 2026 08:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290018.1569695; Wed, 22 Apr 2026 08:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTEU-0007pU-6n; Wed, 22 Apr 2026 08:46:54 +0000
Received: by outflank-mailman (input) for mailman id 1290018;
 Wed, 22 Apr 2026 08:46:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wFTES-0007pM-Kk
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:46:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFTER-002Q7b-QV
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:46:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e88af1-bab6-0a2a0a5309dd-0a2a450b973e-18
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:46:51 +0200
Received: from [40.93.198.56]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e88afa-212f-0a2a450b0019-285dc6384d50-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:46:51 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by SA6PR03MB7735.namprd03.prod.outlook.com (2603:10b6:806:43c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 08:46:47 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 08:46:47 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6MG05fQmg/SiM7he6nm4Oo0GDTADvdGsUhJvocpkp5B0IYv5/3ljkK0CK/zzMP4fzmkAIgQkLoVM5vill6tpfr73VDd28NUSwdWxxqJJ2F+0YBNeZz8ZVh7ZYdWoC8sxpXbFcWw1xgThRoqADKrq3fqBnqRoNxMrN/SbhTG1bV4i5t2dOo/MImEmnUjzu6FseWVc83OWD3eRTVzZ4paqJ0fZzlGRk1q8XLQscA8hKhPLcNVx7weJFAoF5eV7suVhn2enOTJ/9OBvtyYD7/ss9b1I9HOmCQAweMGObo69laGvMXvbrf7GuUeMRMsmZwEbAdltneEkH8s0xIJ7XNBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8a1RXM1tQDcGMOWLsBO8l1ptl3QnA8qqh+dA2O0n26c=;
 b=b8kitPCN5s4Eh6h/soQpqUb1Joo7owVua7lke997wbHfEkzLe6usZSNcQnLifNRZVRhdQwULwJIkdvlco/PzPB4fBNvqaDuPSBUCKWl3I+jG70KTgxJ+SLXuuqzeIkU+3VONkfuRg2FiLF9/vuklzAlWN8KsPnpaaydgvIxhydYEZY2Z/7zS4QyIU231zXuoi5cnsI8izo7PFH6WfcsD1Nx6RnxS15lbjsS4ZebtTx5GA/wcGNVuW4pdLXoghsNuLdgOTKUbJh/luK2QUhWtaO/I6GD/IKeQiS8PooV5vW4wvH3qs23BIHuTbTPk5z8LEvQxQ/SJF98E0A7xL8zAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8a1RXM1tQDcGMOWLsBO8l1ptl3QnA8qqh+dA2O0n26c=;
 b=Hv6JvbklwON707Q0DasfYtezdDkBdel27aMZiTZIrL+gbMdlscKj+PhiFQmtyNhlIQzK16UgeTNO9aRR29OtKjIJ2jE9qSTcRXyxPiaB5vx0bK2+HdmoSWvF/ezRt7JCFjdirzMlEbPD3Z+2ldPCpGCZk44BGYHqzn/XtEL4gH8=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: RE: [PATCH 1/1] xen/efi: Config parsing: Free the same page count as
 allocated.
Thread-Topic: [PATCH 1/1] xen/efi: Config parsing: Free the same page count as
 allocated.
Thread-Index: AQHc0aotn+eeGsDBDUy6ubJIW0SdtbXqpN2AgAAZdoCAAAJOoA==
Date: Wed, 22 Apr 2026 08:46:47 +0000
Message-ID:
 <LV3PR03MB7707C25AD7EBF0118B2CAE65872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
References:
 <127e7a4e0bf360d7ffe8be94022840a353a307b2.1776787216.git.bernhard.kaindl@citrix.com>
 <170028cb-ce5c-4677-88e4-32f57f372fea@suse.com>
 <52c21d8a-f2ba-42e4-aa63-ddf65d460401@suse.com>
In-Reply-To: <52c21d8a-f2ba-42e4-aa63-ddf65d460401@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|SA6PR03MB7735:EE_
x-ms-office365-filtering-correlation-id: 39432b76-e61e-4b2d-e68f-08dea04bb06b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700021|56012099003|18002099003|17002099007|22082099003;
x-microsoft-antispam-message-info:
 mtuSuvj5dEG4qW/HwP1aKR6aogHVzGhglcLAbru9GNFbAbixnIBTdsqSnQ3e+xPp2QCeu8iwqwITiSzEz0edPsDrnv5Q965N069X9WKnwUx/EOMZeEFc0p1UsNlTueyf5io49/fzH6ltHJ1tQOeJNm4+Uvd21VpjDWmKS589iqmRwzF2nzD69jSDxZfrPLzqNyoRx1wx73MxZKOodv7W9yh37iQueHOsFFXO94zsqrs251Bu6skgJIXGWoxJKDoLk8UgcGyLsHEwFW/M7R2XYeTNXISb0AvAYeu/gHJQ7HVltfbmO3VjngfSo27KpM1Dd9cpzYzuRaLkTY638WefiTDd6qZY33vVCorLWhkgwgNMGJZoKPQaWMXMANeytJZYCT8SccmM/EKi4/3VKQW5CKWU9dFWjeGR/EzO99jwejg7VE9363TfppM3xmVFjlyK6GbJMVdixuuSsVhhN35fyvWdRVC8IfuNi9kwuaQu7AUjdHXJmiXZf17oM3fWRnuBh41QAorHJkn2fZW9cP54OdIAbnvnhq4Ub7lsw8XFfpCWpYiDP3SjuqrvwZSCGeAVVaiuoNdp6egrOA0+cpXfu9hNMGUXKundxseybpbbX1T+kaC6eS7rjkMCAwhI+hNr7PP+SwDTQ/upoa48qQtUqyhPa1L4kLa8dw3ATwRc/eOyl9/Zqb9oYPJVmBUY1NPKkUoq6bSsUG75+tnZveGTgHOaM6z2nS4RAqn6wB5q61McQzooIteTe0OBqsxDo8jEovE2DmOW0CtNm6wH7ji4iosWAxB8s9qCbfdQr0Kca0I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(17002099007)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RndJY1hTNzFUb2JLSENXYi9lYXEyL3hoU2dLTmNkNkMrZXlIdjZuMVJPampR?=
 =?utf-8?B?YjhmVXFmWm5nNS9mS0U1OEVJZG1PNWt4YU9LeXhtREFYODBhTkNyTm1XZlhL?=
 =?utf-8?B?aGR4MTlrTHJYcWVFMWNGQlk1bHhGcEZTOXJoZW4zTWhFTE1PTERGdnFZeXA2?=
 =?utf-8?B?enp0NzRFTG45UGtEb25KOURITENUS2tySWpwTnBjUm82WElhYlBtY3ppQzFu?=
 =?utf-8?B?T09zUW9WL2tnNGUvY2h5bG81bmhVYUxRemVLdnRKc3VXdUZVUWJFbjU3NEQ1?=
 =?utf-8?B?eUE3WllQS2VUb3VFbGhmWFlzUnVNblhmQlFudEIrOGVyRnFlMHJmWmVFVXpo?=
 =?utf-8?B?MlNNNFdTdzdJM1MxVVBMT0xONUNPVFhPWGZQSExaYkxHR0lMOFZJVDkvcXR1?=
 =?utf-8?B?dkZQUWFwaTgvTERtY2E5OHZtRDJ4YnM0cWNPNS9Hbmw0QXI1OVNib2hqK3Bl?=
 =?utf-8?B?OCs5MzNSL1JkTGtrR042c2ljQXdPai9tb1RweC9scm9jTWdRNU1yVWFwQVgv?=
 =?utf-8?B?SjhrQitpWkQyU2UreWlPcXlJakFmKzlFcGFlV0ZTNGxXR2YzWlZFbzVVcm9a?=
 =?utf-8?B?cEREMUV0MEUzZUovZ3ZOeG1wbjhFUHNwSlRVeXUzRU9ZSTRBNlhjK2ZpNHdJ?=
 =?utf-8?B?bUFsMm5SWXU5ZE4rUzk4OTJIQkEyUk9SVGVoT0RDWmdmTUgzYmVLb1luV0l3?=
 =?utf-8?B?VCtjd09mWitmczBMUnlGU2FyS1VQWW8vVURFTWlSSEsyZitrc1VBckxES3VN?=
 =?utf-8?B?Tko4Mi91a2lWbVhDTHJGc2g3cENHUTcwOFVFWEkyTTEzV1g4LzAva1NaT1pM?=
 =?utf-8?B?U1JTWTNPNmZkYVJ2cWZIQ2NMbkRCaWdFbGtTT0psQW1iRnAzeXpWRC9YWXVl?=
 =?utf-8?B?TTlBYVdZdC9zYk43OHl0dDNFcWRQcExkUjYzRU9ZQkIzRTUwYXBNZmlabnVZ?=
 =?utf-8?B?RnRQZVM3cDEzZXJXOVJuaTdMQ2pZYWErcElXRml3a0pDQTR2MlAyN00yaGhr?=
 =?utf-8?B?N3BiUDEwRU1Vcy9HVnh2WmNmcnFGb2thaVoxNkJFTVBFaEs1Y25kT2ZtZXJs?=
 =?utf-8?B?MHJRSFhpbEI1Z2xySmU1Z2pOQitveG9Qa2czdk4vUTU1T3JDUndaYzZsZlVT?=
 =?utf-8?B?ZW56ZHJWeEh6YlROdHJBcXB3L0tkQVF0eXEzekxKdjVVSXJqbkJvZlA5d3pF?=
 =?utf-8?B?U2ZxV09kdkI4eVVxTU5KRDRlU2RwR1N4Uyt5TGwzZmVNeDdBWExoT05US3gy?=
 =?utf-8?B?di9ORjd1cHdQZTZkSDRZTG1rblViV3UxOFBLRHVYa09RUzJmdG5vT3lXYTlT?=
 =?utf-8?B?SFBDTThLSll2cnIvei9TMmZUUWtvenJtUlNsVzAxWmo5N2NxaytJcm9leHJJ?=
 =?utf-8?B?MzRqN1hRS3VEaWtsN0ozaEVGRzlxZEtZeEE3QmJHazA4RWNOaXcyTzV6a2tJ?=
 =?utf-8?B?cVF3c0s4MUEvQzV5VGVXYVpjanVDUFRyT0dENmQza3pWaU4vNE04R1FHV0Yv?=
 =?utf-8?B?YlcwNTN0NEJtZ1Z3b0ZYemVIUmZxK05QSktqTDdlaEpPWDYwRW93VFR2emJ1?=
 =?utf-8?B?RW1xTTFJRTdNYjE2Vy9RUE1ZOHRwaWl2Q0NvQmM4N3QxT3ZoL0FEYXN3RDh2?=
 =?utf-8?B?aHVLTUU4QjZvTnEyK1d4VjBYdG4zeCtITGs1bVdFMXh6aWp6ZjRzUFAzZUJL?=
 =?utf-8?B?QzlNUDhidWwwZ2t1L3ZzZjlYalZmWWY3dURMNkVHUnN2T05FdHNGOEdEWUQx?=
 =?utf-8?B?S1RzM3NYN1lPc2pSem1icXpadEpRWkFJL2NLUWNGc2VpN2xDTnpod3pXSUY5?=
 =?utf-8?B?NEE2S0NXaHdhKzRwSFE4TG5CaTVNTEE5T0haMjNlQlhkYi9LSGMzRndOWEVi?=
 =?utf-8?B?aG1GZDMvNE9UbmJPaWhaLzZMLzNEbndZT1lmVkoxQ1pSYUJXQlRrTlh5bSsz?=
 =?utf-8?B?YVA4MkpINm5oQXBNV0JXcmlqY1gra2NGcXV1SkNBNzRmRjlid1V6TVh4TDdy?=
 =?utf-8?B?RmgwVXZoZ0srTjlRTUdmaWRVOWdIZVp3dzdrVThtNTY2Ymk2VUdlVGxYUVFZ?=
 =?utf-8?B?RWJvQmFkczJGakNUUmVHQm95Z0lnS2dlZ3ZSMFBPZ2ticFB6OFozRkc2UTNU?=
 =?utf-8?B?VlUycjVhbitYNjhaUzV2UWVaa0pIejJFUlp2aElkUGcwWVRUSFdkcVFCcVh1?=
 =?utf-8?B?azFkVFNJMERSUVA4UGNyZ2FoNlJNeTRNU2VRTjFzNEJnTWZMbU1mQnRNOFhp?=
 =?utf-8?B?eCtON3NrZHAwUTZ5L3VLcHVoTFFqOEN1QndqVGl6WnFxQnNnOGJNZjVMZ2Rk?=
 =?utf-8?B?QVFiM2JicWwybWZabGc3dFVObEgzYzNYeldWd1lBcDhYeWI4UUZZRGlVM01l?=
 =?utf-8?Q?iAUn3zD4LAdnCuTRE7gfupztCHJd3BsZPa2yGWsBlcu/8?=
x-ms-exchange-antispam-messagedata-1: k3GVLKoRxLGX9Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39432b76-e61e-4b2d-e68f-08dea04bb06b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 08:46:47.6019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6vwXu2uB5v9thrXgY1F5kuwzaBVtwPQN/uHR1UibjSFEjdxylVnnuwr28Pq53ixBi+wUxMLooejCEiwlma8vQ8cIOx+HoFitNly2s7ZnaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7735
X-purgate-ID: tlsNG-42698a/1776847611-05B68F3B-06185F3B/0/0
X-purgate-type: clean
X-purgate-size: 2000
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.693];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 77986443A09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SmFuIEJldWxpY2ggd3JvdGUgYXQgMTA6MjA6DQo+IE9uIDIyLjA0LjIwMjYgMDg6NDgsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPg0KPiA+IEFzIGluZGljYXRlZCBhYm92ZSwgSSdtIG5vdCBjb252aW5j
ZWQgdGhvdWdoIHRoYXQgd2UgcmVhbGx5IHdhbnQgdG8NCj4gPiBhbHRlciBmaWxlLT5zaXplLiBJ
J2QgaW5zdGVhZCBhZGQgMSBpbiB0aGUgZmV3IGluc3RhbmNlcyBvZg0KPiA+ICJlZmlfYnMtPkZy
ZWVQYWdlcyhjZmcuYWRkciwgUEZOX1VQKGNmZy5zaXplKSkiLiBTYWRseSB0aGUgYWRkaW5nIG9m
IDENCj4gPiBpcyBjb25kaXRpb25hbCBpbiByZWFkX3NlY3Rpb24oKSwgc28gbWF5YmUgYSAibmVl
ZF90b19pbmNyZW1lbnQiDQo+ID4gYm9vbGVhbiB3YW50cyBhZGRpbmcgbmV4dCB0byB0aGUgbmVl
ZF90b19mcmVlIG9uZT8gVGhlbiBhIHNtYWxsIGhlbHBlcg0KPiA+IGZ1bmN0aW9uIG1heSBiZSB3
YXJyYW50ZWQgZm9yIHRob3NlIGZldyBpbnN0YW5jZXMgb2YgZnJlZWluZyBjZmcuYWRkci4NCj4g
DQo+IEFjdHVhbGx5LCBubyBzZXBhcmF0ZSBmbGFnIGxvb2tzIHRvIGJlIG5lZWRlZC4gSWYgZm9y
IHRoZSBjZmcgZmlsZSB3ZSBzZXQNCj4gLT5uZWVkX3RvX2ZyZWUsIHdlIGtub3cgd2UgYWxsb2Nh
dGVkIHRoZSBvbmUgZXh0cmEgYnl0ZS4NCg0KTm8sIGFsc28gY2ZnLT5uZWVkX3RvX2ZyZWUgaXMg
YWx3YXlzIHNldCB3aGVuIEFsbG9jYXRlUGFnZXMgd2FzIHN1Y2Nlc3NmdWwsDQp4ZW4vY29tbW9u
L2VmaS9ib290LmMsIHJlYWRfZmlsZSgpLCBsaW5lcyA4NjIgdG8gODY3Og0KDQogICAgcmV0ID0g
ZWZpX2JzLT5BbGxvY2F0ZVBhZ2VzKEFsbG9jYXRlTWF4QWRkcmVzcywgRWZpTG9hZGVyRGF0YSwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEZOX1VQKHNpemUgKyAoZmlsZSA9PSAm
Y2ZnKSksICZmaWxlLT5hZGRyKTsNCiAgICBpZiAoIEVGSV9FUlJPUihyZXQpICkNCiAgICAgICAg
Z290byBmYWlsOw0KDQogICAgZmlsZS0+bmVlZF90b19mcmVlID0gdHJ1ZTsNCg0KR2l2ZW4gdGhh
dCwgSSB0aGluayB0aGUgRUZJIG1haW50YWluZXJzIHNob3VsZCBzdGF0ZSB0aGVpciBwcmVmZXJl
bmNlIG9uIGhvdw0KdG8gZnJlZSB0aGUgYWxsb2NhdGVkIHBhZ2VzLiBJdCBsb29rcyBzYWZlc3Qg
dG8gYWRkIGZpbGUtPm5yX2FsbG9jYXRlZF9wYWdlcy4NCg0KVGhlbiB3ZSBoYXZlIGEgY2xlYW4s
IGRlZGljYXRlZCB2YWx1ZS4gSSBjYW4gdXBkYXRlIGl0IGluIHRoaXMgd2F5LCBidXQgSSdsbA0K
cHJvYmFibHkgd2FpdCBmb3IgdGhlIG9waW5pb24gb2YgdGhlIEVGSSBtYWludGFpbmVycy4gSXQg
d291bGQgYmUgY2xlYW5lci4NCiANCkJlcm5oYXJkDQoNClBTOiBJJ20gbGVhdmluZyB0aGlzIGZv
ciB0aGUgRUZJIG1haW50YWluZXJzIGZvciBub3csIGFzIEkgbmVlZCB0byBmb2N1cyBvbg0KdGhl
IHJldmlldyBvZiB0aGUgTlVNQSBjbGFpbXMgc2VyaWVzLg0K


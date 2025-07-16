Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25EB07C7C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 20:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045566.1415715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc6U2-0002Vw-Vq; Wed, 16 Jul 2025 18:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045566.1415715; Wed, 16 Jul 2025 18:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc6U2-0002TG-Ss; Wed, 16 Jul 2025 18:03:58 +0000
Received: by outflank-mailman (input) for mailman id 1045566;
 Wed, 16 Jul 2025 18:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLWN=Z5=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uc6U1-0002TA-H3
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 18:03:57 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c2d63a7-626f-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 20:03:55 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7606.eurprd03.prod.outlook.com (2603:10a6:20b:41b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 16 Jul
 2025 18:03:51 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 18:03:51 +0000
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
X-Inumbo-ID: 3c2d63a7-626f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrS7S+dnWQETulRvpU2ug9qPsrTjww0VWh8i/H4rJfv83g02pAJ2lLejH64WRUneYPONayIJua1XcJxXdIjSCtVzkMUoY3Mje3Kbxoub8Hoinncek9jYfkw0TxxEw1jOeV1cdORSHBDLhcEOQTGyMaUgHQ4CevvdCQvWO5QkK9EGRBVuZe6u78akzZWQ3j+A607fdhNjKRWOuznfqleaCnUGuX2pdAk3Tudaw9ExNN/VwpvcGyUvDDv18Tv5QrY4KORvbiN6UZP7sy4/IzWmPWzearsUebina0bc8auD0Bw03PsTg7eEJYG4nRRPUqQOvQwmXYtvwoq3N+uJems3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wf0DQAwAbPGKQ9aihEsaL1AZZYBgEosVVO6ij4uMEw=;
 b=Mpam1tNKbPKtVmliAFPGxM2jvX4GTLib/FmcEmtkHDNgglWVUdUSY0thoOQhq2xE8jO6IBssHS4pOpLaFwVVq5rezCLumlU8PKOY+x/AWAAcscy0r4qEwIxawXRsUeDjAZliPL6uko7oqffzsmhGfAzKebOyzWWRMKu82QSQMKfMhnrOqav8SgVFy06HrV5UClZPU7FdqEk0+GLaOFwfy9G1CHp/YrXh7NpcU3YPCO8uazqObRnGyzz4a2MTGSkoaeHPoxKaqlgzKC8raAxvhvI6nDPsV++kP1/VshUdHf6O+zeikMtfPfghvJcS3egoC96HCgxmHOtLiLTlPPcD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wf0DQAwAbPGKQ9aihEsaL1AZZYBgEosVVO6ij4uMEw=;
 b=i3ZRCsdxEPZpVOch0rXM/bZs84eqTkFezhXrJvMi3a0N+F08vtwn6oOr72OMJORhoSUIX5GijMe8wlGqOlTPkytUK+EM761To40IcQWW7o4iWsY+yTnBYnhnsXpL7Xtw3To2Qmy1JiL0ergl/AKop0hiYJsIPOFq01bP4HLaVGSEH4N3fXEfAr7X9pMf3eYXcNVWcqDE8Yy0nzoRmpEYRv7DcRkHt6oNFI6euo+GHGtvxS3p11ZijXCPP3jGn9qwqnEB9tm8oZl9DsLzqqJ4JSu63syaP/S25aSOWAJIjmS2h1MDAdppqOi8XnP9MyInOTcyW6gRC5yNzvS/D++UFA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Index:
 AQHb8RnNNQ6jd6+ExkWCWY/+NTwtQ7QsmXCAgAEYpgCAA5T3AIABsXIAgAAERYCAAAGLAIAADAoAgAHqAYCAAA1wgIAAE/kA
Date: Wed, 16 Jul 2025 18:03:51 +0000
Message-ID: <480ca6d4-d512-4b22-9200-351377242d4a@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
 <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
 <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
 <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
 <e47fafa1-e02c-432b-84bc-44c48af66859@suse.com>
 <312509c2-fb06-4fef-b632-c4719264efb8@epam.com>
 <80937f707e07a9b0d248b5e1e67b5b52@bugseng.com>
In-Reply-To: <80937f707e07a9b0d248b5e1e67b5b52@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7606:EE_
x-ms-office365-filtering-correlation-id: 25cb2a05-f86e-46e8-5d6c-08ddc4931ed1
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXNFTEg5bGVmcFUvTWs1RUR3bmxmajdqLzRpNG9yYjFvOWxFU0pZQlhXQ3U0?=
 =?utf-8?B?dU1pYVAxV1RGR1lFMXg1dVpKZFgwOFovNVEzY1hycmhNd29jdXA0aGhQbnhs?=
 =?utf-8?B?OGM4NGlRdWZ6T0NWU0NGZWxMajJOYkNLdlJpNkV5ekRBNHovV3JpNnI2aEh4?=
 =?utf-8?B?TVNWaUVVNHZyQUlnVjJXQWc3elZwYWgvWXNnRjRRWU96UEZWaTNzVUpqc0Ns?=
 =?utf-8?B?UmsxZkZZQ1lyYzFxVlg2Sk9uRTJ0cnc0d2hYSmJpdDBoYWJUNmJqYXVSSFQy?=
 =?utf-8?B?dDNoNVRPRDhBZmhGazRiM1NiMjNYVDdmNXVGSU9VVTk3dkVXc3ZndVFuR2F4?=
 =?utf-8?B?b1h5ZmFERE9FTUR3eFJucndIdDNLUXhSaVhVUzdxQ29Udkkyei9hTWlhWGhC?=
 =?utf-8?B?WXZLU2xzenZWTlFDTzhqRGo1YmQ0S2tiOFB5LzZiSXAvR3g4Mm1wdGNJTXRy?=
 =?utf-8?B?VE5XZGRvM0ZVSjZWZ3BCM2VQOWgzMEtyMUhZeHlYcG51OXVQbk5UMThQZDZw?=
 =?utf-8?B?MFhZUmkrWU9QQkFZTk1KUWpiNlZXY0FJeVJSZnV3dTNCWE9aNkpPS003Sjkx?=
 =?utf-8?B?Tyt4Kytyb0xEcnRYMnJRT1J6b2dFQ3RiWGlrczA0c2hkMXZiWjVqSDRJRHR2?=
 =?utf-8?B?Q0tUSDR6Y0pRdTA0dStlQnNvTUpQMkZoSTYwenF3NHV5Tkt3RGZlT1dTN0Jv?=
 =?utf-8?B?SnRkWVA4Y1ByalVIZjIrM3J0ZEJreDRxUlFMZVVhUDh5d1pJbWRSMFlvTGNK?=
 =?utf-8?B?akNia3ZYdTNJSGxsKy9WemgyeElsMmdRMG15SHZkb1pqSE9JejVMeEx5VENX?=
 =?utf-8?B?cW9wK2pnK2JjOWJWTjMrQjBmeXJqUU9CRW1JckVBNzFNTy9PbVphZUtMYVp1?=
 =?utf-8?B?UmVjNWo2WHV2Kyt3OG1uTVFOQkJVZFptRVZCc2VicGxnclNScy9BZk5uWHln?=
 =?utf-8?B?eEh4Sjl2UkVWOFNZR1dkY2NVMCs5N1NJckkrcm9aNk5LTVFPeE1LREJQK09n?=
 =?utf-8?B?SnRmVzVYRnB2YVJ3RUlBN3NUK2cyUWdPY2JBSGpNdno5MzQyWnNrbXpCOS9F?=
 =?utf-8?B?TkM1REF5a0xDMUV1NlVmOUx1RWlyUUQwVEhxdnQrUEtyT0Y2TE1FeEM5am5u?=
 =?utf-8?B?cU5KanpoVThTU0I2cGlVd1FSRnFpYkZGc2NEeENQQnlOZ0ordDJoVURVbm1x?=
 =?utf-8?B?NGdvZitYV3dseXNLNUJ0c25BUktyU2lxVWlzQkxxNWs1RlBHNGNweUgwM3hm?=
 =?utf-8?B?Y0lwQTZROFlBSzh1TlBIMXh4RWxiNzFVbFRNZVB3eWlNcEc4dlFZNjlqNjNo?=
 =?utf-8?B?eEdWb05kaVJHODUxREtBMGN1Z0svaXpaVHd4VjVRZEUzR2NMRThKOXJJaG5k?=
 =?utf-8?B?OGE3WCtDSC9LeElKZnJEQWZpZk5oY1NwV3NzcGVrQUNpMFVibkFLcHRvY0dH?=
 =?utf-8?B?R01uRDBWSFRpQ0pNbHZwMWlSSUdLYmFqbWV5bUtMU3hPTW9ZZEdadUl3ZXdT?=
 =?utf-8?B?SjQrOXl5YzlmbFpzdCt6bVRNRjhJcjh3ZHNpRmhCNmRDN0pZNzF2bEg2ZHhy?=
 =?utf-8?B?TUJDcHBJdnROcm5UUElUTFo1ZlJ4VzRJV09reWVhSVNIS1JBTkhlMzFjd3Z0?=
 =?utf-8?B?cW5DUUhvY3hUNDBmUElnb0pjWkoxclpiWWhYSjNXbG5zTlhWeTQzSG52cUZN?=
 =?utf-8?B?MkZONWQ5UHZPY2J2cW13cVNlTUI3R3pHTVFNQ1ppek9tNmJOSWhKVlJ4MTRY?=
 =?utf-8?B?alg1UG9ZL1BJR0pBc2lWdkNKTis0NFY1NEN5SXhkaU43aXNBbGNUT1ZwVVhB?=
 =?utf-8?B?U1lXektjZUtKU0NhWmZiRTRWUkFtaFREaWp0b3ZLUXJKd0hwM0NJTmJERjlU?=
 =?utf-8?B?QkdHVnVXVTR6NDJseDdrQ2R2YlpxQlVkQ2FpTHhRWVRzLzBqNFdzZTdTYmVr?=
 =?utf-8?B?ZEkyS1NjTHZCZFIvUWlQTk1EZnU0emF3ZzdUSkFhZGg4V3pxd2V4clB3RHBE?=
 =?utf-8?B?VlRKY3VURUJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0JkTExEaXptZWxqWWo5cHM3dFNpU0d0aThkMFZUcjUrWUFIblZRU1ZUN21U?=
 =?utf-8?B?NDZPT1k3eTJlb1BSUm5PVFZrbFVlY2YzUHJlUDNGVVRmUUZ3WS9UblR4eUpE?=
 =?utf-8?B?ZWN1Q2N1eVZLM3lZS0JITzFVQTJRMFpjQncvMWF4VHpYSTBIRDRwa09LQlVO?=
 =?utf-8?B?NTVZeW0zSTJjUFhaY1lGOFZ0TitZYXhReWJJZVRQNUlsazVISTJ3TzYxYUNK?=
 =?utf-8?B?d1BoNVZIaUt3bUI1V2ptSHE5NU5mM25NS09XVkpPbXorY3hWVERvM2o5MW1t?=
 =?utf-8?B?OVprZ3BjMlBGNTZ6eEpDUkE1MzJUUkJGS0tjTzJrTjJOMVR1bmZyVlhOTHJJ?=
 =?utf-8?B?bE0vZWVTSzJ0MnFNeGh3Uzdzd1ZNS1Q0cmgxWU5nL1VUbHc0S0JBTm5ZWmNL?=
 =?utf-8?B?RXNCb2F4Vi9IWUxxNkZVK2s1VndaNXdNUWtsNEhwUUFJL29MZnh1STVVcDVF?=
 =?utf-8?B?VDhuLzJBSDFocnNUNEZobHp4ZjBITjV2cmhoNkVIRUpCTWQ1RzZnajZGMUFG?=
 =?utf-8?B?MHZlSnpSS3J4M05DZjlzZEI2cDB5eU83ZWtsV2d4NFJHRExaTW1MeFhmbEhN?=
 =?utf-8?B?T2dwYStRQ3pZOUxuOWloM1ptUmdhYi9yNGRBSkNhYmo4cnpaZzBYbEZiSmFS?=
 =?utf-8?B?STIyYnpLR0czZE5EeDY3K2lwRVEzK0c1RzIwRTVzNVJVZkZFTUZrWFd5WWFt?=
 =?utf-8?B?alJlcU1DcDJabUtqMDNnZ20vRyt3cVp3THdJeFVRcGV0dE5DVVNxcnJOd3Ji?=
 =?utf-8?B?dnp4Y1JhdDA4Z0ZtUHVIdUxPb0RkTW5ZNUliYk0rWmhEQmVpYzRlM0dtYjBC?=
 =?utf-8?B?Skxza0ZKZm10WVlVYUNCQ1hWS1YwV1JFMlp2aUpleEttN1VmSTRsU0k4WThH?=
 =?utf-8?B?WTNMbk9QMTBKQnVhYlhidFBDSkR0cVV0TC8rZklqaTRxMVNaL2tnbm1zOFRt?=
 =?utf-8?B?NHNZbUJTYWRXS2wyRXI4SUVkL2FNWFlvK0M3WGNSUnF3enh0aTNmZ1RCOGRr?=
 =?utf-8?B?VjdRN3l0ak1pMFRMNlE0a0labTF1OXVMZmdRTzBwRmVyN1BpaUJOZzlUR0NQ?=
 =?utf-8?B?cGZ6ektncDJSVmdGbno3YTZYR2xrY1F5eHI4V3JhcXluYldTMnJvUG1WYlgv?=
 =?utf-8?B?V2tNdmRTZUJIS0paSjNMYlNBK2hhV2J6dkphYStTbHJRMTNQR3dVc0RCaURQ?=
 =?utf-8?B?ajVBK01OQUl6THlCSG9CMFp4alFDbDluaSszTnpmSFE5dXNWUjdySE8zM0to?=
 =?utf-8?B?OElMREFjM3g3d0s5eTNiRU1rWlkxMHkwUmx0Y25KTysyQUwxSCs2UUtxL2dq?=
 =?utf-8?B?M2xjWWdGVS84ejB0dlFhZXk3V1YyY3lLY2VRYTgrVlAxU1A0MkdhQjBtNFVF?=
 =?utf-8?B?M08zQ2xpYlI1NjhYb0VsUDdnQ3BtWnRVWXVaZndkR1g2TVRyOGdpZ3VXNWVD?=
 =?utf-8?B?a2lxRUdRRVphaTI4cnFmZ0xUV3lCSkQxYnBER1lnd2JrNEZVbnVZaHRqVzhn?=
 =?utf-8?B?K21LM0RCUlVOeGZiYUZYY0t2d2Y2bVhkT1RPWGdzaFZTV2orQ2xTc2ZJSS96?=
 =?utf-8?B?M3ZYQTFBa2JuajBPUUtTNkprSnlIdWhFKzlobzdBcFdHYzVlY3JERi9Ga3Jn?=
 =?utf-8?B?NlpRYVNKaENocnZkTksyYk4vc21SZWMxQ3NwM0VpRTRnTnF1ZXBvQnNjU3Rw?=
 =?utf-8?B?ZCsvMERTOThNQzVUSnExWEY2eWx4UUtnYlZkVDI1QlpzVEduSVA1RG9vaFNU?=
 =?utf-8?B?blZvZkR1a2lnR3RaNU1zMnpVSG9nTFdzeVpOU0JrUFlkSndMbDNzZ2lCVFJH?=
 =?utf-8?B?Znl5WEU3b25jclQ3U1ZCMGJVODVVSFdXSE1CSUpBdUtKSGx0SVZTTE12djRa?=
 =?utf-8?B?d2s0M1d0RjdPVE9neTVNSlhpbUVVR1JuNGFGNlZKSmZVRjZDUStGQk8yR3pV?=
 =?utf-8?B?UCtLVkFmQUR2M3JyMFpEbXlwQkxKNDNyVFo0eTMrNEtEaTRIMTZYUzVYTHZz?=
 =?utf-8?B?VnpWMElpK3EyM0lRUTI4elVMWDJKZE1Bd0FuTFhZVlQ5eGtadm56OHhYZ0NE?=
 =?utf-8?B?UW1oQnFJNmhSdlovTGdDNjNhYTh5Z3orV3RkYlhsWDdHTUhNblRJVVRKMjBa?=
 =?utf-8?B?aXJEeXdEc21yVFNiOFM1L1RmSTNvUFlFRDU2MWJERzYrektsenZXeVpsNFdw?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EE458091E37F944B68FBDFB6BD1EBB2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cb2a05-f86e-46e8-5d6c-08ddc4931ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 18:03:51.2247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/dPkeM9b85jT/BsWJ0BkBGo0+SLPPhQUBAMbF4SSJbqcTM9FVSxdYtqHI+Fle0KrXSjPcrTIIQkOxvhmmFhkxgTedVaMCrJ5FnRH+yB0es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7606

DQoNCk9uIDcvMTYvMjUgMTk6NTIsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA3
LTE2IDE4OjA0LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBPbiA3LzE1LzI1IDEzOjUw
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNS4wNy4yMDI1IDEyOjA3LCBEbXl0cm8gUHJv
a29wY2h1azEgd3JvdGU6DQo+Pj4+IEFSTSBvbmx5IGFyZToNCj4+Pj4gLWNvbmZpZz1NQzNBMi5S
NS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLA0KPj4+PiAiYW55X2FyZWEoYWxsX2xvYyhmaWxlKF54
ZW4vaW5jbHVkZS94ZW4vYml0b3BzXFwuaCQpKSkifQ0KPj4+DQo+Pj4gVGhpcyBvbmUncyBwcm9i
YWJseSBmaW5lLg0KPj4+DQo+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJl
cmF0ZSwNCj4+Pj4gImFsbF9hcmVhKGRlY2wobmFtZShwYXJzZV9nbnR0YWJfbGltaXQpKXx8IA0K
Pj4+PiBtYWNybyhuYW1lKHBhcnNlX2dudHRhYl9saW1pdCkpKSJ9DQo+Pj4+IC1jb25maWc9TUMz
QTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwNCj4+Pj4gImFsbF9hcmVhKGRlY2wobmFtZSh1
cGRhdGVfZ250dGFiX3BhcikpfHwgDQo+Pj4+IG1hY3JvKG5hbWUodXBkYXRlX2dudHRhYl9wYXIp
KSkifQ0KPj4+DQo+Pj4gVGhlc2UgdHdvIGxvb2sgdG9vIGJyb2FkOiBUaGV5J3JlIGFmZmVjdGlu
ZyBjb21tb24vZ3JhbnRfdGFibGUuYyANCj4+PiBvbmx5LCBhcmVuJ3QNCj4+PiB0aGV5Pw0KPj4+
DQo+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwNCj4+Pj4gImFs
bF9hcmVhKGRlY2wobmFtZShwaXJxX2NsZWFudXBfY2hlY2spKXx8IA0KPj4+PiBtYWNybyhuYW1l
KHBpcnFfY2xlYW51cF9jaGVjaykpKSJ9DQo+Pj4NCj4+PiBUaGlzIG9uZSBhbHNvIGxvb2tzIG92
ZXJseSBicm9hZCwgYnV0IGl0J3MgcGVyaGFwcyB1bmF2b2lkYWJsZSB0byBiZSANCj4+PiB0aGF0
IHdheS4NCj4+Pg0KPj4+IEphbg0KPj4NCj4+IEhpIEphbi4NCj4+DQo+PiBUaG9zZSBkZXZpYXRp
b25zIGNhbiBiZSBuYXJyb3dlZCAoc3BlY2lmeWluZyBmaWxlIG5hbWUpOg0KPj4NCj4+IC1jb25m
aWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwNCj4+ICJhbnlfYXJlYShhbnlfbG9j
KGZpbGUoXnhlbi9pbmNsdWRlL3hlbi9iaXRvcHNcXC5oJCkpICYmDQo+PiBtYWNybyhuYW1lKF9f
dGVzdF9hbmRfc2V0X2JpdHx8X190ZXN0X2FuZF9jbGVhcl9iaXR8fCANCj4+IF9fdGVzdF9hbmRf
Y2hhbmdlX2JpdHx8dGVzdF9iaXQpKSkifQ0KPj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMr
PXtkZWxpYmVyYXRlLA0KPj4gImFueV9hcmVhKGFueV9sb2MoZmlsZSheeGVuL2NvbW1vbi9ncmFu
dF90YWJsZVwgDQo+PiBcLmMkKSkmJm1hY3JvKG5hbWUodXBkYXRlX2dudHRhYl9wYXJ8fHBhcnNl
X2dudHRhYl9saW1pdCkpKSJ9DQo+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGli
ZXJhdGUsDQo+PiAiYW55X2FyZWEoYW55X2xvYyhmaWxlKF54ZW4vaW5jbHVkZS94ZW4vaXJxXCAN
Cj4+IFwuaCQpKSYmbWFjcm8obmFtZShwaXJxX2NsZWFudXBfY2hlY2spKSkifQ0KPj4NCj4+IEFy
ZSB5b3UgT0sgd2l0aCBpdD8NCj4+DQo+IA0KPiBzL2FueV9sb2MvYWxsX2xvYy8gPyBJIGRvbid0
IGV4cGVjdCB0aGVzZSByZXBvcnRzIHRvIGhhdmUgbG9jYXRpb25zIA0KPiBvdXRzaWRlIHRob3Nl
IGhlYWRlciBmaWxlcywgc28gdGhpcyBzaG91bGQgaGF2ZSB0aGUgc2FtZSBlZmZlY3QgYnV0IHdp
dGggDQo+IGEgbmFycm93ZXIgZGV2aWF0aW9uLg0KDQpUaGFua3MsIE5pY29sYS4NCkkgdXBkYXRl
ZCBteSBwYXRjaC4NCg0KPiANCj4+IERteXRyby4NCj4gDQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A04AFNwnVWqFkgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:01:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E174E40C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:00:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=DDRgPYIP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361800.1613869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjKwa-0001RU-CK; Mon, 13 Jul 2026 17:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361800.1613869; Mon, 13 Jul 2026 17:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjKwa-0001Op-8m; Mon, 13 Jul 2026 17:59:52 +0000
Received: by outflank-mailman (input) for mailman id 1361800;
 Mon, 13 Jul 2026 17:59:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wjKwY-0001Oh-On
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 17:59:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjKwY-007nwQ-4Y
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 19:59:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a552767-5cb7-0a2a0a5109dd-0a2a4507a94e-34
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 19:59:50 +0200
Received: from [52.101.69.93]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a552795-ac46-0a2a45070019-3465455d299f-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 19:59:50 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GVXPR03MB10309.eurprd03.prod.outlook.com (2603:10a6:150:156::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:59:42 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 17:59:42 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nx+vPw44yxAYeAOlT+x55G5Go7dk2x/sdj3Ars37TX2/MIpMIHVM2BNSwhjoIjppI4p1YVGk4weaCSgzGzdoLN/6tF7HsXNn0AmD3+8k24Y4BBxuuPi/liGSWcJrKrQB84YtmmPRb/+kvNXcEUh9S6eiFtqk+auSVP3kGbtnYYxY0KAuGd7gVurAOylF/2XdYVM9mMm4t0RcIQG8fPXglD2zBOe2p3RIiDk+zFLO5b9dHGl/iOYzcbpJGcVPqZfso7Tsv4ZtdYn0kaCKHn6ewlCYJ9nfwjb2ni3cP0BaPJlbqZ37/KLAU3cNOU3PmiRcBcYsROhmO65TsGVr07br1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZxrmIVWqlRldH4npMLmAsYDah1qCYroYtIEtOvWWzQ=;
 b=L2Ob6AOoeyM+Y/IvMZhc4R7NkCSYV0UfEdSAJTkmspdcsi+CzlsIGLrwvGYwaxCeE8pB11ciSmaW3ql3EhnEc1XzogQUhhyyZxrXfplSqvKfpRMGDxRQom4QuIeiSQJTi1Pr02nI4A9ZFhWwhlItZsUoMN/HZzYenqewv8rus3hgjdzAZ1mxqHx7/nfEyXaOj8qiISkB+sm4fQc5iMQ4HXcvU9Avo9UUrvpuprFVmLIlHl6AHoROhg1IbMroJDjElsFVcf6JwBYBeznz+tpR1bU2JyzPizHTkT2qTjnYbzI2NDdH0h8e7lXiWoLjbIkPpFRfb7o7dVP5FIEbcoD+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZxrmIVWqlRldH4npMLmAsYDah1qCYroYtIEtOvWWzQ=;
 b=DDRgPYIPxdrMyUjNedhtiAmNarhyRcWOdZI8ktEthMVySzZ8BnYAuOWFHwQb6CxxVLsTtMAcQ8IT119wRiAYJgB3IIr4Kc2ifJy3DvdL8SK9CgbMaZKhGuCNYn2zUUjxmrgqQYgFvz5Hzgh9RkwWPK61iBa8ISrUDCxj9muoyKP6/2m/qATxezYER2P5BZkWNLchzt8itgkF5VJNtrl35nl2s39ssJHvidCyw7PM4p9MCTMLO4Ju69ZF22YcahxXxO/xUOQv0BnONJpIYb8i7iwxy3Uj1lJprz+zIp2IhdAxpCdnq1DuufiwhGbNLsRSOK9uihxCC2fvDSM1povQTg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/3] misra: deviate MISRA C Rule 5.5 for
 'request_irq()'
Thread-Topic: [PATCH v2 2/3] misra: deviate MISRA C Rule 5.5 for
 'request_irq()'
Thread-Index: AQHdEgdlLv7TI7G6yke6ZZX0wGJbm7ZrCSsAgAC1h4A=
Date: Mon, 13 Jul 2026 17:59:42 +0000
Message-ID: <a3f3d5dd-9e9f-43ad-80a6-3a2f8723cf21@epam.com>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
 <db38c988b728a52bd7a921201e44558e43c7ed2c.1783864426.git.dmytro_prokopchuk1@epam.com>
 <3fe4008c-3338-4830-b200-fe7d0f582303@suse.com>
In-Reply-To: <3fe4008c-3338-4830-b200-fe7d0f582303@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GVXPR03MB10309:EE_
x-ms-office365-filtering-correlation-id: 6bfdd29b-420c-46f5-2693-08dee1088412
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|42112799006|7416014|4143699003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 0A9KJu6qClLp1qxO+TQs8/Pz0u9DTfLH1Br4+/zQdQYIQD3XHzMk+oA+V7UZ1fM6SCyMrRpODkXPj8B9iNN2o5J90U/u1IW9g21TmYMMDhCw8IckVeLhG/W21TyQHvG1oCR2TrkAE7PYBzDKHxiOwdAbxS6bn7C//stvQB+EWMsbtsIkwyDJKevYffsMJTI4K3oXan/Kvj21YxTy+esdxhbPo/qOJ355/IoilqLfzyGIzXgyKGnx4G4ipQcNasWjv5YgrHs/q6oQm0vAArmmzPFuAIIRhFcKaWvQ7vziXGB1/DaSowxn+SSmVEGkLOI2VzFDfut/RJ0u/O+dw/3xK24s3STkj6rQ194Kl2wwBjslOzI7crxnbSEDiN/pKe1fj8m5OaCadRhzaX3g9BCNaATfNivmZ/2PTcAbS0iQZ7jh7Sr9cgtq1DxxSiqac7BhepNClqn+IMY1CqIbx6vyHhP4zpWDtlNyBTqJ2XgrXsMpGZ9xME6WJurUUC1ZLdh7DP0GH0GXKPlmewaZIlK/cD+1jsvicNDlAbwZEPcTLGqs4CHxwKo2SHKBUjRMIeqyepCQGejpdp+deq/HHJRh3Kq3QQhN0Vo/8wTjGo9qOqSVaANYK0cx3s4AlhJ47rljbGL0KuY9Mo2IYJRK5C705Ntu8OEOvRsB/xFlDiDv/6KH3RP14DUtA5X2APGwjoejBdZswV7g/n8I6ysu/ElQ0qkwxH4ozBIlQodIu7WLd9E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(42112799006)(7416014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmxyRU1xY3F0cEg5ck5oYUJjZjMycTRvcFk0SzFmV0RpRGdZaHRzWnJlVWo0?=
 =?utf-8?B?MzR3bnR4QXRTRFZiYjVDdVBXOGVMNEN1Y0dTRDUreWROdG5tb3JWU29XOFhY?=
 =?utf-8?B?dGZlTDFEbGhhVlhBOHhFL2c4Qyttd0NzM3NGc0pMK2xFV044OW1uWEVhQlRa?=
 =?utf-8?B?dVloejZHcFNhT01vVlM5Ri9GMEVlWEZRVVBrK3pnSTFUM0xYM3IySk5vaTRK?=
 =?utf-8?B?S2ZaQ3R6WDFna3JNNmpZVzNoTEVmVkpMWnA2LzFhWFl6MXh5NnN4aVExVXZj?=
 =?utf-8?B?a2JMdmRBYnQ5aUZscWxOY2VQaWlSUSt1MmlEbWkyRW03QWFsakF1dVN1MkRl?=
 =?utf-8?B?ZVpFOXlPUVl3SXhMMDYvdmNldFB1dHFtZHQ0QUUxUFBBNituV3BDR0MxeGh0?=
 =?utf-8?B?alFrNmx3RHRyVFBrYkFwbTJBelk2dkZJU2FOVldzdXFmQTVGVWthbUtSUlBl?=
 =?utf-8?B?aGlaMC9FMDhlWmtsZEVpd0xVNEFmZG9Ia1FBTDZaNmh6MXBwYUR5aXp5eTdj?=
 =?utf-8?B?MnJTMkJUbE5OWlBZbG02emNham50RGE4ODNBNGFwbkNsZ3AvQkNpMFVYT2hL?=
 =?utf-8?B?MlJueFNPZ2tQVjdlVTNuRVFJRG0zSEZyRU5LbUxVWDVvc3ZBNE51R3F1RGRN?=
 =?utf-8?B?ZVh4UWk4d2RaWnJhYUd5c0JwbXdqRitmTEZIUTFLM2l3NkhBdmVrQUtrd2t1?=
 =?utf-8?B?dUNNMlg2MTVyQnVJbnBOcXZJaTRMQTJBQy84TXo4N3BGQnZCZm1vRm0wd2p5?=
 =?utf-8?B?eVpjSm1yeXJSMHMrdHlaWXA5Vm9IaktzbWV2b1B6aGgydkM2QVFhTWsrU2RI?=
 =?utf-8?B?cHdOQWI2RnAxZkNRSkM2RFhYTkJXZE0reU1iWUp2V3MzV2hZekJsZC9pQzNz?=
 =?utf-8?B?UmNNMTllTUxOOXJUUnRTdEZWSGhQT1BJTjY3dENJZFFBcEZwbHI4c3RJSGYw?=
 =?utf-8?B?Y1F2WVZsdTZEN1FPV0d6TUhvMkUzUDE1UE41VmRSclkza0ZsdS9pOHlpWi9W?=
 =?utf-8?B?UGcwanVkanFZajBJRWEyOHA2ZU14Q0c1YVBiZnVjb0hKUXpNVktVYnNmWFpw?=
 =?utf-8?B?WVM0UDhuRmlsSERGbGV0MFhCb2JyOW50MnFyU2hsTFZLRmsydXhrckZyMVUy?=
 =?utf-8?B?eHY3SFIvekpzV0UzeHo2ZkNrRGx5b2hDdTBMYU1xSzEwU0hpQXQ0NktrVmgv?=
 =?utf-8?B?RkNlNmcwWTlzT0dQV3V6cnd2Y0o1eXoyZGtueXY3NkdVeGhBZUthK2FBdllW?=
 =?utf-8?B?Q2RhYVVCL0pONUpvMzNTMmJqbzduVmYxQi8zUFZxN3BmKytVZEUrcUkvc3Br?=
 =?utf-8?B?cVFaUExVK2xZdXlTbFRkMlVyT2N1L1JyaGRSWmlLbHBGcGRlcko0M2czT0NP?=
 =?utf-8?B?eTEvVDFQNGYzY3NkMkxxV0tLNjJ4R3RVTnpsajRjTzB5VjVYMHpHelIwVjNw?=
 =?utf-8?B?ZWY2dzk4Y3UwVnBaaG5XZVZ5WEZSWC9OcWFqallGYmVsQk9zbFhNYXp5MkZS?=
 =?utf-8?B?TENrVk5TRmFLZEhNRG53OGIxV3I2NzB2bkhmQjNocFF5dmwxU3BmY1N6cVBa?=
 =?utf-8?B?VTRSNmZoRXdlRVRuZmNVZllzSkx0YWljMnRvOFU2RzdNQnNjUVdCcjJMbWkr?=
 =?utf-8?B?WngzMTNRNWF2NU1lMzVlYVEvT2lORGtXMVVaTzlhREU0Q2ZOeXZGaGNVcXZt?=
 =?utf-8?B?SUZ3MWlwMzYzSG9PWGJ3OHVaMzMrTFRSeHQzRUFuNHVBU1d0eGxBQStiMGJT?=
 =?utf-8?B?dzZ3bld2RnJRVjZ0T0FzeGpyOVpZSGRnaGRiVW9ZdTdMOWxKbWVQREtweGlK?=
 =?utf-8?B?OFlseGdYNE9tS3NMSkdEMFZKRGdIWDBUT0JCMEsxeWEya0tldERRYWNvcTZq?=
 =?utf-8?B?YUhTYng1ZS9YdDFJK2h0WEJKWGtBWG5HU1FLYmkxQ1Jjd28wcDFFMEZicHBw?=
 =?utf-8?B?TzJhMU9RQ1JzcjhpYnFJdzhKQmlJa2lXYTZqQm5yWCt0aXRYb2J6bmtTQUxZ?=
 =?utf-8?B?TkwvejEvTGtpS2IxZm54SXZmdGhmSUMxU21nNFRQWG5CN3hKMkxKSWN0b2pR?=
 =?utf-8?B?L2VGd2I3V1hDZksxWElmeXUwQSs1a3N0SWhkNnlZZVJLSXd6SHlHQzZlRmFx?=
 =?utf-8?B?bjgvS2NTNnFlV1QxZmlFaE1HL0hlOWgrY3lxRmRVbk8wVnJDeU1EQlE2T3dD?=
 =?utf-8?B?NWJiNVQxOStGc1BRTU1SenlhZ1RZUGhsVmc5VjQ5aGxlTWZzTzlYWllDMlE4?=
 =?utf-8?B?RFRiOFdwOCtYVG02VldEbWh5QlFUcEIvZUpMNmxSYkRHZXRjdHNFd0tTQ1E1?=
 =?utf-8?B?YjVveWtTNVU3TE1ZY0xKcU52RXEzQ2o1blpVZU00dG1XMzJja2xBMUlsNlRK?=
 =?utf-8?Q?3NPPRvYrfAaS9+DE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63DB3FB546B57444B19F55B09FCCA166@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfdd29b-420c-46f5-2693-08dee1088412
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 17:59:42.4477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11RKqAy79z/ZrT5cmgBn9PF/0h2DGXFQq42GrikKpWg8jNz22B+PJZsf3uTdVadlVGQADqHXEReGipfKUuub2I0jDznhy48e67ffRtKzBYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10309
X-purgate-ID: tlsNG-ef75cf/1783965590-1F562201-E8B1DE52/0/0
X-purgate-type: clean
X-purgate-size: 3006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:dkim,epam.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 988E174E40C

SGVsbG8gSmFuLA0KDQpPbiA3LzEzLzI2IDEwOjA5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24g
MTIuMDcuMjAyNiAxNjowNCwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gLS0tIGEvYXV0
b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+PiArKysgYi9h
dXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+IEBAIC0x
MzYsNiArMTM2LDEwIEBAIFRoZXNlIG1hY3JvcyBhZGRyZXNzIGRpZmZlcmVuY2VzIGluIGFyZ3Vt
ZW50IGNvdW50IGR1cmluZyBjb21waWxlLXRpbWUsIGVmZmVjdGl2DQo+PiAgIC1jb25maWc9TUMz
QTIuUjUuNSxpZ25vcmVkX21hY3Jvcys9Im5hbWUoaHlwZnNfYWxsb2NfZHluZGF0YSkmJmxvYyhm
aWxlKF54ZW4vaW5jbHVkZS94ZW4vaHlwZnNcXC5oJCkpIg0KPj4gICAtZG9jX2VuZA0KPj4gICAN
Cj4+ICstZG9jX2JlZ2luPSJDbGFzaCBiZXR3ZWVuICdyZXF1ZXN0X2lycSgpJyBmdW5jdGlvbiBh
bmQgbWFjcm8gbmFtZSBpbiAneGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYycgaXMg
ZGVsaWJlcmF0ZS4iDQo+PiArLWNvbmZpZz1NQzNBMi5SNS41LGlnbm9yZWRfbWFjcm9zKz0ibmFt
ZShyZXF1ZXN0X2lycSkmJmxvYyhmaWxlKF54ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21t
dVxcLmMkKSkiDQo+PiArLWRvY19lbmQNCj4gDQo+IFRoaXMgc3VpdGFibHkgY29uc3RyYWlucyB0
aGluZ3MgdG8gYSBzaW5nbGUgZmlsZS4NCj4gDQo+PiAtLS0gYS9kb2NzL21pc3JhL2RldmlhdGlv
bnMucnN0DQo+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAtMTg1LDYg
KzE4NSwxMyBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4g
ICAgICAgICAgZnVuY3Rpb24sIHNvIHRoZSBuYW1lIGNsYXNoIGlzIGNvbnRyb2xsZWQuDQo+PiAg
ICAgICAgLSBFQ0xBSVIgaGFzIGJlZW4gY29uZmlndXJlZCB0byBpZ25vcmUgdGhpcyBtYWNyby4N
Cj4+ICAgDQo+PiArICAgKiAtIFI1LjUNCj4+ICsgICAgIC0gQ2xhc2ggYmV0d2VlbiB0aGUgJ3Jl
cXVlc3RfaXJxKCknIGZ1bmN0aW9uIGFuZCBtYWNybyBuYW1lIGlzIGRlbGliZXJhdGUuDQo+IA0K
PiBUaGlzIGRvZXNuJ3QsIGFuZCAuLi4NCj4gDQo+PiArICAgICAgIFRoZSBmdW5jdGlvbiB1c2Vz
IHRoZSBYZW4gJ3JlcXVlc3RfaXJxKCknIGFyZ3VtZW50IG9yZGVyLCB3aGlsZSB0aGUgbWFjcm8N
Cj4+ICsgICAgICAgaXMgYSBjb21wYXRpYmlsaXR5IHdyYXBwZXIgZm9yIHRoZSBBUk0gU01NVSBk
cml2ZXIgdGhhdCBhZGFwdHMgY2FsbHMgYnkNCj4+ICsgICAgICAgcmVvcmRlcmluZyB0aGUgaGFu
ZGxlciBhbmQgZmxhZ3MgYXJndW1lbnRzLg0KPj4gKyAgICAgLSBFQ0xBSVIgaGFzIGJlZW4gY29u
ZmlndXJlZCB0byBpZ25vcmUgdGhpcyBtYWNyby4NCj4gDQo+IC4uLiB0aGVyZSdzIHRoZW4gbm90
IGV2ZW4gYSBtZW50aW9uIG9mIHRoZSBmaWxlIG5hbWUgbGF0ZXIgKGZ0YW9kOiBldmVuIGlmDQo+
IHRoZXJlIHdhcywgdG8gbWUgYXQgbGVhc3QgdGhpcyB3b3VsZCBjb21lIHRvbyBsYXRlKS4NCj4g
DQo+PiAtLS0gYS9kb2NzL21pc3JhL3J1bGVzLnJzdA0KPj4gKysrIGIvZG9jcy9taXNyYS9ydWxl
cy5yc3QNCj4+IEBAIC0yMjYsNiArMjI2LDEwIEBAIG1haW50YWluZXJzIGlmIHlvdSB3YW50IHRv
IHN1Z2dlc3QgYSBjaGFuZ2UuDQo+PiAgICAgICAgICBiZWNhdXNlIHRoZSBtYWNybyBpcyBhIHR5
cGVkIGNvbnZlbmllbmNlIHdyYXBwZXIgYXJvdW5kIHRoZSBzaXplLWJhc2VkDQo+PiAgICAgICAg
ICBhbGxvY2F0aW9uIGZ1bmN0aW9uLg0KPj4gICANCj4+ICsgICAgICAgQ2xhc2ggYmV0d2VlbiBy
ZXF1ZXN0X2lycSgpIGZ1bmN0aW9uIGFuZCBtYWNybyBuYW1lcyBpcyBhbGxvd2VkIGJlY2F1c2UN
Cj4+ICsgICAgICAgdGhlIG1hY3JvIGlzIGEgbG9jYWwgY29tcGF0aWJpbGl0eSB3cmFwcGVyIHRo
YXQgYWRhcHRzIEFSTSBTTU1VIGRyaXZlcg0KPj4gKyAgICAgICBjYWxsIHRvIFhlbidzIHJlcXVl
c3RfaXJxKCkgYXJndW1lbnQgb3JkZXIuDQo+IA0KPiBTaW1pbGFybHkgaGVyZS4NCj4gDQo+IEph
bg0KDQpTb3VuZHMgcmVhc29uYWJsZS4gSSdsbCB1cGRhdGUgd29yZGluZyB3aXRoIHNwZWNpZnlp
bmcgZmlsZSBuYW1lLg0KDQpCUiwgRG15dHJvLg==


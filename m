Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHkpF4aezmnfowYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 18:51:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932B38C345
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 18:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272228.1560024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8LFb-0004SF-Hi; Thu, 02 Apr 2026 16:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272228.1560024; Thu, 02 Apr 2026 16:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8LFb-0004Pk-En; Thu, 02 Apr 2026 16:50:35 +0000
Received: by outflank-mailman (input) for mailman id 1272228;
 Thu, 02 Apr 2026 16:50:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1w8LFZ-0004Pe-HM
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 16:50:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8LFY-005i9M-Tt
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 18:50:32 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69ce9e4c-5cb7-0a2a0a5109dd-0a2a45059ad6-8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 18:50:32 +0200
Received: from [52.101.84.94]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69ce9e58-3760-0a2a45050019-3465545eae3a-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 18:50:32 +0200
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by VI0PR03MB10927.eurprd03.prod.outlook.com (2603:10a6:800:26b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 16:50:30 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::de05:9ff1:c370:ecc9]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::de05:9ff1:c370:ecc9%4]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 16:50:30 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OE32+BfIYnCTNmxXSyp1HnnXmHQ9JoEQ1kwXo05100v6h4Nw0YRH1XEmymy4tWanzIQLx/tv17ERQUqWG+dgBmOI3tNEvb0o8n4GfNagtLyFR6OEYBKW8t0zKTMVUORm6B1BThZghr9fvUIVgvsI5kBKMVXKkhWGWGgpqkr0959inPqhDE/JvuBGxpTV5TtvCDGucrwt0lnP54u/qZ1bSqxLfnVLJNbtF07AtLuxNpHeXnjuTKrIh7YxROkgFpZMljC/GfIwbK6I69YZCOhK2+23MvICilWPTYqU5LmtAESbGj+qcYHIT4TGF+Ga8KxL8bHRSyCMQW3jYSYjT/yeuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKwH9C469n0MZkNn5G71hkv/tIYCKSWoOrPW9Jr8RpU=;
 b=dYLQXeFvX7kPpnecqUO2XNwKhH+OOcrekenqw9/6fNTcVwqw0QOfREzr2YW8nss8aQmiHPphtu6SoHdnqhiG449aMCICcNuDR0O/BQABZMo4Hn0KhMmPF7TryQyIJto2kcmTJP1rCW5gBLcYXejAlafqJ45B0pVbtYlOrA1QkqeyeH5QFaOr8TLwbIx+vMEWzfm9utz4XEcXhLMlgn7zTyf3IajmOK5i9Xz1drFk0Xj3c1UCBq0/shkWMRZ9MieemJ2u2WO56K9OwdNrlbM9paqEG7laulsM366SBTuOre0WctfdGz6hFx6ldxQ8san8BPVIcZLIdLrPCpq2zNLgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKwH9C469n0MZkNn5G71hkv/tIYCKSWoOrPW9Jr8RpU=;
 b=qt1WbRn5YTQgxwJlQ3mKMdRyvQ78YT25279xSa2DOe+rJ7dNHTTo16F+I7JO4k4PnHfHeUXCqED4HINbBbaw/L+uoR88NqYZkN9HxpAZW3yooYd2AgWUhVeZp9YYDd+yuNSuzRp1n3J/1HbITr4lJpxcnQVBneTloFVuzjI7cMsda1BSRj1NP1y1DvE0ROfvMKg9oL/uP2PA9nMW6pqQ2/ZyBuYcIpMD+NMXlEwwUqx6w5lRJ5wWm/GlPbqBX/Fh1fguvbktzyeGZog4VPporRDKe+e/RWii5YpVx57DLEwLMN/8XEOnwjkAinFAoV0aHQiZ4i+xwULNnhumM2M0xQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/4] xen/arm: its: add platform match callback for ITS
 quirks
Thread-Topic: [PATCH 2/4] xen/arm: its: add platform match callback for ITS
 quirks
Thread-Index: AQHcvEPkvPnBPPoH7U6Wnzsnt2hLeg==
Date: Thu, 2 Apr 2026 16:50:29 +0000
Message-ID: <87jyuptigb.fsf@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
	<10da5cf38dded9c3373c4b0ba54d7f7a7b2fd98f.1774431311.git.mykola_kvach@epam.com>
	<87341ovugw.fsf@epam.com>
	<CAGeoDV_1Zzh8pxBe=Mf7Yu1OXfNhzH7aFpsT+ktM62DwK-ropg@mail.gmail.com>
	<87a4vovo7u.fsf@epam.com>
	<CAGeoDV_X8Opf4Hb9Kg43d-sR5WLK1ULHLZ_DZjcoE+U1VfPJvQ@mail.gmail.com>
In-Reply-To:
 <CAGeoDV_X8Opf4Hb9Kg43d-sR5WLK1ULHLZ_DZjcoE+U1VfPJvQ@mail.gmail.com>	(Mykola
 Kvach's message of "Tue, 31 Mar 2026 11:15:53 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|VI0PR03MB10927:EE_
x-ms-office365-filtering-correlation-id: 67c91901-3472-4c35-5580-08de90d7f2dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|22082099003|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 V7yr/TggMevtbMMGEG+ZrxIwQSy6OrOeTTy+vUP3/+EYwWT3gn1bUanXf9vbZ18n9SgvLt0rlzvgq7hOZmSOxCZ6+4ZbBdUUFx/jkoCY2thBkeFrM15Q2P3cjgCPFSyEM3EUBUa0CtGAIth4KZKGJzGwH4WYvmMTNw4FDj0HNH4niXmaNgjD33etYzh2bQpRwb6eBXaOCBM18sBkRx7SNeeYh1cUIW7GfJSj29MxGvAGYniNyJRp/S6xHXES8RPQ6zZ0xxBQhL7/bMVidoOAw5FyUsf9JEVuiP/ILZnKIgEVdaxvGotICVQgHM9A91VA9GEM96eIvRrx7q1zvsgsmmEpzs3872fdyhS5KnMV69Q1B+Uay92utM7Cl7Dw97ghpNvw+e7U9MiemcaDOqXUoQ5rK2DXSZCU93N4U6wDKxu3EKiVbuRYq8IpV7/ZeWAXXpqgFC4LroP7VAgzlstm0q7hyidSpjIAGVOA3JN5woIgwgsUdxH2TA/6nO7sR4Qt2Tf2b47BO8UV/m8ijCWcbmSikzYQ+IdQY7RUruT6cpe8aP8yR1TEe8xBe9GxeDasZT7Hc8CVR/yXCeAxSdWpwGrtkoNAsFcAJNryUAV7KvPQsi2FpIJ+ULNPoxRBSxXMKLje3b6u0JS8F26TrSuewShr2afxQ8dfVVedh3aNj1SVDnykgbpHicxPergW3jq6OM6h6OHDKt1hE8NJm2uARiyC97MMiQ5Odf3UVYOq+kA6a25/bV5bpPFxNOkngVl54kFujXAXnQDL+/G0W1ESzEfTScUQLtLPm0IOPQNJpeY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(22082099003)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3pZNG1qem5CS2liaEk1bGE0TUZtMk4yY0kySUtzd0t2SkFxbXYxaEZKOVRJ?=
 =?utf-8?B?cXhTbUxuckhud0dYWXBtZ0JrMWZvTVlQU0gwcjl1b0h4YlBJaHJxMWJhL1FT?=
 =?utf-8?B?WHFHeGR3dGxkVXgvQW43RDZ0VmpIOXkrdWhTeG1IMUQ3anIwR0dzeXNRR2ZE?=
 =?utf-8?B?aTZZbE9GRUM2c2ZPZFY1czhNTWRRZXNWVktiZ3B3YmpSdCt1MUJJTHhHaVNV?=
 =?utf-8?B?RThHSnpEeXdEaXhYQ3FLMWNqUnFRZGlNSmdET28wazZPRDIrVU9pdWhrVDJp?=
 =?utf-8?B?YXNobk1PczJrTTRONlVxVDhab3NXTTUzNjhnZ250QVY4S01rMGx2R0FlYStr?=
 =?utf-8?B?SjJsZ3VndHBYcE9EUFNkNHBsREVodEN4b1g0aEdjZVc0bFFNOUpybWZHbnd5?=
 =?utf-8?B?b1lmNHRSTVBXVGlMTGJTYXUvcHBTY2tMeFBjQ0wrdjFhMjdpeFNNdzBVZXRr?=
 =?utf-8?B?L2VyR2dDRXBKcXRKenhrWlo0MzJQSUdFNVFPSkdmMS9PM0NIL0hwYk1xKzBu?=
 =?utf-8?B?MHExSDZwaE16K1JucFNyM2h6WUo0MURRTDF1ZnBJanJ6VGgwdkpFQjlYOEhG?=
 =?utf-8?B?d0I5Y01WZ1BPdE9Fd1ZkWkNtajU1YTZUV1hXdTFSQVc2bkdTRW5PSzJqM1Nq?=
 =?utf-8?B?cXQwT0ltbU5veW1UNjF6ZG5uUUlMMUliaDRxeGlsZ0NQK3JzWGN5OFVlaTVW?=
 =?utf-8?B?L1JYN3hTZDRqMVhMNTVJWTd0WmEvalQ3anJiRFBQUkFzeG1VTHBoWmt2OThv?=
 =?utf-8?B?aUw3UUpjNjRkeVZFVjRvQTRtVkZVOGRwd1dNeGNBTWJ3MEcxNFJuUm8wbFhw?=
 =?utf-8?B?UFRoZzBqeTV2OHBUTUUwaFVhbEhKZ2NKVndrVG9kdjBheCtsWGQ2RXJnMGxp?=
 =?utf-8?B?R2Zvbk9CSnMvbVZvM2RwakpudEh6VWFYcTBoTEVaaUxYVWZOcTl6OVRrQlJB?=
 =?utf-8?B?amtGbTRRbTM1T0IzcGN2c292VHJ1WGdmazd5b3MvQW1ic0hjSUpuSk01NjJj?=
 =?utf-8?B?QWxyY09FbVAveVMxTWFhRFZ1NUdwVmtKbytIanhEM3liOHlZVGIrRmtUOGk0?=
 =?utf-8?B?ekRIVEVGWERFRkNMWFVUUWkydm0zbUdLMUcyRFFOTlVjZnU4UnhDNmVmYkE1?=
 =?utf-8?B?b2MxK3FQL2diN3FzaVowbklKU2J3c1JZZzhLbllySzJnNDZRYlk4SWJ1SVpT?=
 =?utf-8?B?K05MV1RrdzZlTlN6WU4wNjh6eXJvMFEyaXlmVVcvT2x1VTA4bDR4aDNyaEJM?=
 =?utf-8?B?TndmdGJqVnBmRHJ1bDYwYXNWN2dYRng2eldJYVRtWmpFNmovcmlvSlVscmhP?=
 =?utf-8?B?YnlhdVMzY1NxT0tUWFBybGdtM2FCakprVzhRUkNKU3l0eCtmTnlvTkR0V0dJ?=
 =?utf-8?B?MUkvOFNmTVpLSVFKamtOdTQyL25SYmdVNm9mK1M0M2xXS2lUZC9HL2RPbjZY?=
 =?utf-8?B?eWE2V05aZGlWU1JFYlNKcWJKMGR0K0diY3B5N2JHOURjdFkydlJZa1NoeGhZ?=
 =?utf-8?B?amJGai9HcWNzT0JGQS9vZEE2VnVNcXlPL2pvaWlhTWdEbEcxUHVaeXN2eGZQ?=
 =?utf-8?B?dEhxdmMyeFFSbnVnMThHOW90TTlNR1UwdC9zN2gzMTJwc3BXbVc3OWtjZFVy?=
 =?utf-8?B?eWlSa2o4UklFV1RsQ3NpY1lDLy9mYjlHVDd2S2h3YlRua0kxQndNUm8vczBn?=
 =?utf-8?B?YUVUWFVlMVBaQnpYYXNUdUZZMTFUdVh1ZGdaZysrQmJ4Q2YxOExoR3ZYNldX?=
 =?utf-8?B?MmJJbGZXTmc4dGV5aGd4QnQ1OHI0S0c0Y0JnNzlBN3QrVjNZOS9IanNzclNo?=
 =?utf-8?B?dEEvWnMwMjd3Zzg0dHpDUlduMGF0SlJLdE5XN09XUTJja1RFRWNlcnhPbitU?=
 =?utf-8?B?YnFsZWgrcWpVS1dmbzQwcmtaRktmME1GR1FQVEw2eVAxSlRwa3dpcXdvT0xt?=
 =?utf-8?B?V3hhWlpZRStld0FHQUoxa0VocTZzYm81VHBCUFpNbkRxWEhJTFR4ZmdxMGdq?=
 =?utf-8?B?UzNycGQ5OFROVjBvbkxKZjJkUERPK1oyOVVpdnEzRCtRaUUzL1VSYXhlYkFl?=
 =?utf-8?B?ZnlyMUlvTXg1NXAwb1Z3dFRXRmlWbUpseWhCVE16ZlBjZi80OTZkSzM4blpD?=
 =?utf-8?B?NWU2VllSMG1lUE1uWTZycUd4ZXZxdmdNU0xlVUJTdkMwU3ZESlZDbzBJZG5X?=
 =?utf-8?B?NFFTMnErNktaWm1hZUlwUlRocDRhWmpUQWowQXRlYTNsN2QyWExjTE1FRHEr?=
 =?utf-8?B?L29GVWlNaTVKeXJITUEwY0FuZ0dRNHhpYXJ2eW9xWkpBN0JFRTNVaWpzdGNZ?=
 =?utf-8?B?VndNZW01bFVyTkdmMWFRTTVVNDkxK1EvQSs0aktiMVNmUitKdkc1Zy9TYTJs?=
 =?utf-8?Q?k4XHnCm1l04ZXDzo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <331EC585FFDFDE43872AD17E8BE471D6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c91901-3472-4c35-5580-08de90d7f2dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 16:50:29.9973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B3oK+o0N9zZhWdHdMC6AgP4QCvYL79vqhq/VLHj6Qcu35KAPCWvSb1a6RXJk5gY1ZG7Rqub0qZZmdlEvcqhuatfJVv2tWwKYbus8Bzi55S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10927
X-purgate-ID: tlsNG-c201ff/1775148632-2332496F-250A185C/0/0
X-purgate-type: clean
X-purgate-size: 11956
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9932B38C345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlrb2xhLA0KDQpNeWtvbGEgS3ZhY2ggPHhha2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyaXRl
czoNCg0KPiBPbiBUdWUsIE1hciAzMSwgMjAyNiBhdCAzOjI24oCvQU0gVm9sb2R5bXlyIEJhYmNo
dWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPiB3cm90ZToNCj4+DQo+PiBIaSBNeWtv
bGEsDQo+Pg0KPj4gTXlrb2xhIEt2YWNoIDx4YWtlcC5hbWF0b3BAZ21haWwuY29tPiB3cml0ZXM6
DQo+Pg0KPj4gPiBIaSBWb2xvZHlteXIsDQo+PiA+DQo+PiA+IFRoYW5rIHlvdSBmb3IgdGhlIHJl
dmlldy4NCj4+ID4NCj4+ID4gT24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgNDo0NeKAr1BNIFZvbG9k
eW15ciBCYWJjaHVrDQo+PiA+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+
PiA+Pg0KPj4gPj4gSGkgTXlrb2xhLA0KPj4gPj4NCj4+ID4+IE15a29sYSBLdmFjaCA8eGFrZXAu
YW1hdG9wQGdtYWlsLmNvbT4gd3JpdGVzOg0KPj4gPj4NCj4+ID4+ID4gRnJvbTogTXlrb2xhIEt2
YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+PiA+PiA+DQo+PiA+PiA+IEV4dGVuZCBJVFMg
cXVpcmsgbG9va3VwIHdpdGggYW4gb3B0aW9uYWwgbWF0Y2ggY2FsbGJhY2sgc28gdGhhdA0KPj4g
Pj4gPiBwbGF0Zm9ybXMgc2hhcmluZyB0aGUgc2FtZSBJSURSIGNhbiBzdGlsbCBiZSBkaXN0aW5n
dWlzaGVkLg0KPj4gPj4gPg0KPj4gPj4gPiBVc2UgdGhlIGJvYXJkIGNvbXBhdGlibGUgc3RyaW5n
IHRvIHBvc2l0aXZlbHkgaWRlbnRpZnkgUmVuZXNhcyBSLUNhcg0KPj4gPj4gPiBHZW40IGJlZm9y
ZSBhcHBseWluZyBJVFMgd29ya2Fyb3VuZCBmbGFncywgcHJldmVudGluZyBmYWxzZSBtYXRjaGVz
DQo+PiA+PiA+IG9uIG90aGVyIFNvQ3MgdGhhdCBoYXBwZW4gdG8gdXNlIHRoZSBzYW1lIEdJQyBJ
UCBibG9jay4NCj4+ID4+ID4NCj4+ID4+ID4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxt
eWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+PiA+PiA+IC0tLQ0KPj4gPj4gPiAgeGVuL2FyY2gvYXJt
L2dpYy12My1pdHMuYyB8IDIyICsrKysrKysrKysrKysrKysrKystLS0NCj4+ID4+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4gPj4gPg0KPj4g
Pj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYyBiL3hlbi9hcmNoL2Fy
bS9naWMtdjMtaXRzLmMNCj4+ID4+ID4gaW5kZXggMDA1MjRiNDNhMy4uYzQwNjI5NzMxZiAxMDA2
NDQNCj4+ID4+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPj4gPj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jDQo+PiA+PiA+IEBAIC01Nyw2ICs1Nyw3IEBAIHN0
cnVjdCBpdHNfZGV2aWNlIHsNCj4+ID4+ID4gICAqLw0KPj4gPj4gPiAgc3RydWN0IGl0c19xdWly
ayB7DQo+PiA+PiA+ICAgICAgY29uc3QgY2hhciAqZGVzYzsNCj4+ID4+ID4gKyAgICBib29sICgq
bWF0Y2gpKGNvbnN0IHN0cnVjdCBob3N0X2l0cyAqaHdfaXRzKTsNCj4+ID4+DQo+PiA+PiBJZiB5
b3UgYXJlIGludHJvZHVjaW5nIG1hdGNoIHByZWRpY2F0ZSwgdGhlbiB3aHkgZG8geW91IG5lZWQu
Li4NCj4+ID4+DQo+PiA+PiA+ICAgICAgdWludDMyX3QgaWlkcjsNCj4+ID4+ID4gICAgICB1aW50
MzJfdCBtYXNrOw0KPj4gPj4gPiAgICAgIHVpbnQzMl90IGZsYWdzOw0KPj4gPj4NCj4+ID4+IHRo
ZXNlPyBZb3UgY2FuIHVzZSBhIHByZWRpY2F0ZSBmdW5jdGlvbiB0byBtYXRjaCBhZ2FpbnN0IGlp
ZHINCj4+ID4NCj4+ID4gVGhlIHJhdGlvbmFsZSBmb3Iga2VlcGluZyBpaWRyL21hc2sgd2hpbGUg
YWRkaW5nIG1hdGNoKCkgaXMgdG8ga2VlcA0KPj4gPiB0aGUgcXVpcmsgdGFibGUgZGVjbGFyYXRp
dmUgYW5kIGVhc3kgdG8gcmVhZC4gVGhlIG1hdGNoKCkgY2FsbGJhY2sgaXMNCj4+ID4gbWVhbnQg
b25seSBhcyBhbiBvcHRpb25hbCByZWZpbmVtZW50IGZvciBhbWJpZ3VvdXMgY2FzZXMgd2hlcmUg
SUlEUg0KPj4gPiBhbG9uZSBpcyBub3Qgc3VmZmljaWVudCB0byBpZGVudGlmeSB0aGUgcGxhdGZv
cm0uDQo+PiA+DQo+PiA+IEluIHRoaXMgZGVzaWduLCBpaWRyL21hc2sgcmVtYWlucyB0aGUgcHJp
bWFyeSBtYXRjaCBrZXkuIElmIG1hdGNoaW5nDQo+PiA+IHdlcmUgbWFkZSBlbnRpcmVseSBjYWxs
YmFjay1iYXNlZCwgdGhlIHN0YW5kYXJkIElJRFIgY29tcGFyaXNvbiB3b3VsZA0KPj4gPiBoYXZl
IHRvIG1vdmUgaW50byBjYWxsYmFjayBjb2RlIGFzIHdlbGwuIFRoYXQgd291bGQgbWFrZSBxdWly
ayBlbnRyaWVzDQo+PiA+IG1vcmUgb3Blbi1jb2RlZCBhbmQgbGVzcyBkYXRhLWRyaXZlbiwgd2hp
bGUgdGhlIGN1cnJlbnQgc3BsaXQga2VlcHMgdGhlDQo+PiA+IGNvbW1vbiBjYXNlIHNpbXBsZSBh
bmQgc3RydWN0dXJlZC4NCj4+ID4NCj4+ID4gVGhpcyBpcyBhbHNvIGNsb3NlIHRvIHdoYXQgTGlu
dXggZG9lczogSUlEUi1iYXNlZCBtYXRjaGluZyByZW1haW5zIHRoZQ0KPj4gPiBnZW5lcmljIGRl
Y2xhcmF0aXZlIG1lY2hhbmlzbSwgYW5kIHBsYXRmb3JtLXNwZWNpZmljIGNoZWNrcyBzdWNoIGFz
DQo+PiA+IGNvbXBhdGlibGUgc3RyaW5ncyBhcmUgYWRkZWQgb25seSB3aGVyZSBuZWVkZWQuDQo+
PiA+DQo+PiA+IFRoYXQgc2FpZCwgSSBhZ3JlZSB0aGF0IHRoZSBjYWxsYmFja3MgaW50cm9kdWNl
ZCBpbiB0aGlzIHNlcmllcyBhcmUgYWxsDQo+PiA+IGRvaW5nIHJvdWdobHkgdGhlIHNhbWUga2lu
ZCBvZiBwbGF0Zm9ybSBpZGVudGlmaWNhdGlvbi4gQSByZWFzb25hYmxlDQo+PiA+IGZvbGxvdy11
cCBjbGVhbnVwIHdvdWxkIGJlIHRvIG1vZGVsIHRoaXMgbW9yZSBnZW5lcmljYWxseSwgZm9yIGV4
YW1wbGUNCj4+ID4gYnkgYWRkaW5nIGFuIG9wdGlvbmFsIGNvbXBhdGlibGUgc3RyaW5nIGxpc3Qg
dG8gc3RydWN0IGl0c19xdWlyaywgYW5kDQo+PiA+IHJlc2VydmluZyBtYXRjaCgpIGZvciBjYXNl
cyB0aGF0IGNhbm5vdCBiZSBleHByZXNzZWQgdGhyb3VnaCBzdGF0aWMNCj4+ID4gZGF0YS4NCj4+
ID4NCj4+ID4gU28gdGhlIGludGVudCBoZXJlIHdhcyB0byBrZWVwIHRoZSB0YWJsZSBjbGVhbiwg
d2l0aCBtYXRjaGluZyBsb2dpYw0KPj4gPiBlZmZlY3RpdmVseSBiZWluZzoNCj4+ID4NCj4+ID4g
ICBxdWlya19tYXRjaCA9IElJRFIgbWF0Y2ggJiYgKG5vIGV4dHJhIG1hdGNoIHJ1bGUgfHwgZXh0
cmEgbWF0Y2ggcGFzc2VzKQ0KPj4gPg0KPj4gPiBJZiB5b3UgcHJlZmVyLCBJIGNhbiByZXdvcmsg
dGhpcyBlaXRoZXIgaW50byBhIGZ1bGx5IGNhbGxiYWNrLWJhc2VkDQo+PiA+IHNjaGVtZSwgb3Ig
aW50cm9kdWNlIGdlbmVyaWMgY29tcGF0aWJsZS1zdHJpbmcgbWF0Y2hpbmcgaW4gdGhpcyBzZXJp
ZXMNCj4+ID4gYW5kIGRyb3AgdGhlIG1hdGNoKCkgY2FsbGJhY2sgZm9yIG5vdy4NCj4+DQo+PiBX
ZWxsLCBJIGRvbid0IHRoaW5rIHRoYXQgaW50cm9kdWNpbmcgImNvbXBhdGlibGUiIHN0cmluZyBt
YXRjaGluZyB3aWxsDQo+PiBkbyBhbnkgZ29vZC4gQWN0dWFsbHksIEkgdGhpbmsgdGhhdCBpdCB3
aWxsIGludHJvZHVjZSBtb3JlIHByb2JsZW1zLg0KPj4NCj4+IFdoYXQgeW91IGNhbiBkbywgaXMg
dG8gaW50cm9kdWNlIGFuIGFkZGl0aW9uYWwgZGF0YToNCj4+DQo+PiBzdHJ1Y3QgaXRzX3F1aXJr
IHsNCj4+ICAgICAgICAgY29uc3QgY2hhciAqZGVzYzsNCj4+ICAgICAgICAgYm9vbCAoKm1hdGNo
KShjb25zdCBzdHJ1Y3QgaG9zdF9pdHMgKmh3X2l0cywgdm9pZCAqcHJpdik7DQo+PiAgICAgICAg
IHZvaWQgKnByaXY7DQo+PiAgICAgICAgIHVpbnQzMl90IGZsYWdzOw0KPj4gfTsNCj4+DQo+PiBz
dHJ1Y3QgaXRzX2lpZHJfbWF0Y2ggew0KPj4gICAgICAgICB1aW50MzJfdCBpaWRyOw0KPj4gICAg
ICAgICB1aW50MzJfdCBtYXNrOw0KPj4gfTsNCj4+DQo+PiBzdGF0aWMgYm9vbCBpaWRyX21hdGNo
KGNvbnN0IHN0cnVjdCBob3N0X2l0cyAqaHdfaXRzLCB2b2lkICpwcml2KTsNCj4+IHN0YXRpYyBi
b29sIHBsYXRmb3JtX2NvbXBhdGJpbGVfbWF0Y2goY29uc3Qgc3RydWN0IGhvc3RfaXRzICpod19p
dHMsIHZvaWQgKnByaXYpOw0KPj4NCj4+IHN0YXRpYyBzdHJ1Y3QgaXRzX3F1aXJrIHF1aXJrc1td
ID0gew0KPj4gICAgICAgICB7Lm1hdGNoID0gaWlkcl9tYXRjaCwNCj4+ICAgICAgICAgIC5wcml2
ID0gJihzdHJ1Y3QgaXRzX2lpZHJfbWF0Y2gpIHsuaWlkciA9IDB4YWFhYSwgLm1hc2sgPSAweGJi
YmJ9fSwNCj4+ICAgICAgICAgey5tYXRjaCA9IHBsYXRmb3JtX2NvbXBhdGJpbGVfbWF0Y2gsDQo+
PiAgICAgICAgICAucHJpdiA9ICJyZW5lc2FzLHI4YTc3OWcwIn0sDQo+PiB9Ow0KPj4NCj4+IFNv
bWV0aGluZyBsaWtlIHRoYXQuIEluIHRoaXMgd2F5IHlvdSBjYW4gdXNlIGVpdGhlciBhIGdlbmVy
aWMgcHJlZGljYXRlDQo+PiBmdW5jdGlvbiBvciBpbXBsZW1lbnQgeW91ciBvd24gZm9yIG1vcmUg
Y29tcGxleCBjYXNlcy4NCj4+DQo+PiA+DQo+PiA+Pg0KPj4gPj4gPiBAQCAtNjQsMTEgKzY1LDI0
IEBAIHN0cnVjdCBpdHNfcXVpcmsgew0KPj4gPj4gPg0KPj4gPj4gPiAgc3RhdGljIHVpbnQzMl90
IF9fcm9fYWZ0ZXJfaW5pdCBpdHNfcXVpcmtfZmxhZ3M7DQo+PiA+PiA+DQo+PiA+PiA+ICtzdGF0
aWMgYm9vbCBnaWN2M19pdHNfbWF0Y2hfcXVpcmtfZ2VuNChjb25zdCBzdHJ1Y3QgaG9zdF9pdHMg
Kmh3X2l0cykNCj4+ID4+ID4gK3sNCj4+ID4+ID4gKyAgICBpZiAoICFod19pdHMtPmR0X25vZGUg
KQ0KPj4gPj4gPiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiA+PiA+ICsNCj4+ID4+ID4gKyAg
ICBpZiAoICFkdF9tYWNoaW5lX2lzX2NvbXBhdGlibGUoInJlbmVzYXMscjhhNzc5ZjAiKSAmJg0K
Pj4gPj4gPiArICAgICAgICAgIWR0X21hY2hpbmVfaXNfY29tcGF0aWJsZSgicmVuZXNhcyxyOGE3
NzlnMCIpICkNCj4+ID4+ID4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gPj4gPiArDQo+PiA+
PiA+ICsgICAgcmV0dXJuIHRydWU7DQo+PiA+PiA+ICt9DQo+PiA+PiA+ICsNCj4+ID4+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaXRzX3F1aXJrIGl0c19xdWlya3NbXSA9IHsNCj4+ID4+ID4gICAg
ICB7DQo+PiA+PiA+ICAgICAgICAgIC5kZXNjICA9ICJSLUNhciBHZW40IiwNCj4+ID4+ID4gICAg
ICAgICAgLmlpZHIgID0gMHgwMjAxNzQzYiwNCj4+ID4+ID4gICAgICAgICAgLm1hc2sgID0gMHhm
ZmZmZmZmZlUsDQo+PiA+PiA+ICsgICAgICAgIC5tYXRjaCA9IGdpY3YzX2l0c19tYXRjaF9xdWly
a19nZW40LA0KPj4gPj4gPiAgICAgICAgICAuZmxhZ3MgPSBIT1NUX0lUU19XT1JLQVJPVU5EX05D
X05TIHwNCj4+ID4+ID4gICAgICAgICAgICAgICAgICAgSE9TVF9JVFNfV09SS0FST1VORF8zMkJJ
VF9BRERSLA0KPj4gPj4gPiAgICAgIH0sDQo+PiA+PiA+IEBAIC03Nyw3ICs5MSw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaXRzX3F1aXJrIGl0c19xdWlya3NbXSA9IHsNCj4+ID4+ID4gICAgICB9
DQo+PiA+PiA+ICB9Ow0KPj4gPj4gPg0KPj4gPj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBpdHNf
cXVpcmsgKmdpY3YzX2l0c19maW5kX3F1aXJrKHVpbnQzMl90IGlpZHIpDQo+PiA+PiA+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGl0c19xdWlyayAqZ2ljdjNfaXRzX2ZpbmRfcXVpcmsoDQo+PiA+PiA+
ICsgICAgY29uc3Qgc3RydWN0IGhvc3RfaXRzICpod19pdHMsIHVpbnQzMl90IGlpZHIpDQo+PiA+
PiA+ICB7DQo+PiA+PiA+ICAgICAgY29uc3Qgc3RydWN0IGl0c19xdWlyayAqcXVpcmsgPSBpdHNf
cXVpcmtzOw0KPj4gPj4gPg0KPj4gPj4gPiBAQCAtODYsNyArMTAxLDggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBpdHNfcXVpcmsgKmdpY3YzX2l0c19maW5kX3F1aXJrKHVpbnQzMl90IGlpZHIpDQo+
PiA+PiA+ICAgICAgICAgIGlmICggcXVpcmstPmlpZHIgIT0gKHF1aXJrLT5tYXNrICYgaWlkcikg
KQ0KPj4gPj4gPiAgICAgICAgICAgICAgY29udGludWU7DQo+PiA+PiA+DQo+PiA+PiA+IC0gICAg
ICAgIHJldHVybiBxdWlyazsNCj4+ID4+ID4gKyAgICAgICAgaWYgKCAhcXVpcmstPm1hdGNoIHx8
IHF1aXJrLT5tYXRjaChod19pdHMpICkNCj4+ID4+ID4gKyAgICAgICAgICAgIHJldHVybiBxdWly
azsNCj4+ID4NCj4+ID4gQWxzbywgd2hpbGUgcmV2aWV3aW5nIGdpY3YzX2l0c19maW5kX3F1aXJr
KCkgSSByZWFsaXplZCB0aGF0IHRoZQ0KPj4gPiBjdXJyZW50IGZpcnN0LW1hdGNoIHNlbWFudGlj
cyBtYXkgbm90IHNjYWxlIHdlbGwuIFNpbmNlIHRoZSB0YWJsZQ0KPj4gPiBzdXBwb3J0cyBwYXJ0
aWFsIElJRFIgbWFza3MsIHdlIGNvdWxkIGhhdmUgYSBicm9hZCBlbnRyeSBjb3ZlcmluZw0KPj4g
PiBhbiBlbnRpcmUgR0lDIGZhbWlseSBhbG9uZ3NpZGUgYSBuYXJyb3dlciBlbnRyeSBmb3IgYSBz
cGVjaWZpYw0KPj4gPiBwbGF0Zm9ybS4gV2l0aCBmaXJzdC1tYXRjaCwgb25seSBvbmUgb2YgdGhl
bSB3b3VsZCBldmVyIGFwcGx5LCBzbw0KPj4gPiB0aGVpciBmbGFncyBjb3VsZCBuZXZlciBiZSBj
b21iaW5lZC4gVGhlIHNhbWUgaXNzdWUgYXBwbGllcyB0byB0aGUNCj4+ID4gbWF0Y2goKSBjYWxs
YmFjazogaWYgYW4gZW50cnkgd2l0aCBtYXRjaCgpIGlzIGNoZWNrZWQgZmlyc3QgYW5kDQo+PiA+
IGZhaWxzLCB0aGUgbG9vcCBkb2VzIGNvbnRpbnVlLCBidXQgaWYgaXQgc3VjY2VlZHMsIGFsbCBz
dWJzZXF1ZW50DQo+PiA+IGVudHJpZXMgZm9yIHRoZSBzYW1lIElJRFIgLS0gd2hldGhlciB3aXRo
IGRpZmZlcmVudCBtYXNrcyBvciBkaWZmZXJlbnQNCj4+ID4gbWF0Y2goKSBwcmVkaWNhdGVzIC0t
IGFyZSBza2lwcGVkIGVudGlyZWx5Lg0KPj4gPg0KPj4gPiBJZiBvdGhlcnMgYWdyZWUsIEkgd2ls
bCBzd2l0Y2ggdG8gYWNjdW11bGF0aW5nIGZsYWdzIGZyb20gYWxsDQo+PiA+IG1hdGNoaW5nIGVu
dHJpZXMgaW4gdjIuDQo+Pg0KPj4gSSBkb24ndCB0aGluayB0aGF0IHRoZXJlIGlzIGEgZ29vZCB1
c2UgY2FzZSBmb3IgdGhpcyByaWdodCBub3csIHNvDQo+PiBwZXJzb25hbGx5IEknZCBza2lwIGZs
YWdzIGFjY3VtdWxhdGlvbi4gSnVzdCB3cml0ZSBhIGNvbW1lbnQgdGhhdCBjb2RlDQo+PiBzdG9w
cyBhbmQgZmlyc3QgbWF0Y2gsIHNvIG1vcmUgc3BlY2lmaWMgcXVpcmtzIHNob3VsZCBnbyBmaXJz
dC4NCj4NCj4gSSBzZWUgdGhlIHBvaW50IGFib3V0IG5vdCBtaXhpbmcgYW4gb3Blbi1jb2RlZCBE
VCBwcm9wZXJ0eSBjaGVjayB3aXRoDQo+IHRoZSBnZW5lcmljIHF1aXJrIG1hdGNoaW5nIHBhdGgg
aW4gdGhlIGZpcnN0IHBhdGNoIG9mIHRoaXMgc2VyaWVzLg0KPg0KPiBIb3dldmVyLCB0YWtlbiB0
b2dldGhlciB3aXRoIHlvdXIgY29tbWVudCBoZXJlLCB0aGF0IHNlZW1zIHRvIHB1bGwgdGhlDQo+
IGRlc2lnbiBpbiB0d28gZGlmZmVyZW50IGRpcmVjdGlvbnMuDQo+DQo+IE15IGNvbmNlcm4gaXMg
dGhhdCBkbWEtbm9uY29oZXJlbnQgaXMgbm90IHJlYWxseSBhbiBhbHRlcm5hdGl2ZQ0KPiBwbGF0
Zm9ybSBxdWlyaywgYnV0IGFuIG9ydGhvZ29uYWwgSVRTIHByb3BlcnR5IHRoYXQgbWF5IG5lZWQg
dG8NCj4gY29leGlzdCB3aXRoIG90aGVyIHF1aXJrcyBtYXRjaGVkIHZpYSBJSURSLCBtYWNoaW5l
IGNvbXBhdGlibGUsIG9yIGENCj4gY3VzdG9tIG1hdGNoKCkgY2FsbGJhY2suDQo+DQo+IFdpdGgg
dGhlIGN1cnJlbnQgZmlyc3QtbWF0Y2ggc2VtYW50aWNzLCBpZiBkbWEtbm9uY29oZXJlbnQgaXMg
cHJvbW90ZWQNCj4gdG8gYSByZWd1bGFyIHN0cnVjdCBpdHNfcXVpcmsgZW50cnksIHRoZW4gb25s
eSBvbmUgZW50cnkgd291bGQgYXBwbHksDQo+IGFuZCB3ZSBjb3VsZCBub3QgY29tYmluZSBpdCB3
aXRoIGFub3RoZXIgcGxhdGZvcm0tc3BlY2lmaWMgcXVpcmsgZm9yDQo+IHRoZSBzYW1lIElUUy4g
SW4gdGhhdCBtb2RlbCwgbW92aW5nIGRtYS1ub25jb2hlcmVudCBpbnRvIHRoZSB0YWJsZQ0KPiB3
b3VsZCBhY3R1YWxseSBtYWtlIHRoZSBiZWhhdmlvciBsZXNzIGdlbmVyaWMsIG5vdCBtb3JlLg0K
Pg0KPiBTbyBJIHRoaW5rIHRoZXJlIGFyZSB0d28gY29uc2lzdGVudCBvcHRpb25zOg0KPg0KPiAx
LiBrZWVwIGZpcnN0LW1hdGNoIHNlbWFudGljcyBhbmQgbGVhdmUgZG1hLW5vbmNvaGVyZW50IGFz
IGEgc2VwYXJhdGUNCj4gYWRkaXRpdmUgcHJvcGVydHksIG9yDQo+IDIuIG1vdmUgZG1hLW5vbmNv
aGVyZW50IGludG8gdGhlIHF1aXJrIHRhYmxlIGFuZCBzd2l0Y2ggdGhlIGxvb2t1cCB0bw0KPiBh
Y2N1bXVsYXRlIGZsYWdzIGZyb20gYWxsIG1hdGNoaW5nIGVudHJpZXMuDQo+DQo+IFRoYXQgaXMg
d2h5IEkgYnJvdWdodCB1cCBhY2N1bXVsYXRpb24gaW4gdGhlIGZpcnN0IHBsYWNlOg0KPiBkbWEt
bm9uY29oZXJlbnQgbG9va3MgbGlrZSBhIGNvbmNyZXRlIGNhc2Ugd2hlcmUgcXVpcmtzIGFyZQ0K
PiBjb21wb3NhYmxlIHJhdGhlciB0aGFuIG11dHVhbGx5IGV4Y2x1c2l2ZS4NCg0KT2theSwgSSBz
ZWUgeW91ciBwb2ludC4gQnV0LCBpZiB5b3UgYXJlIHNheWluZyB0aGF0IGRtYS1ub25jb2hlcmVu
dCBpcw0Kb3J0aG9nb25hbCB0byBxdWlya3MsIHdoeSBpdCBpcyBoYW5kbGVkIGJ5IHRoZSBxdWly
ayBjb2RlPyBJIGV4cGVjdA0KcXVpcmtzIHRvIGJlIGludGVybmFsbHkgY29oZXJlbnQgKG5vIHB1
biBpbnRlbmRlZCkuIFNvIHllcywgZm9yIG1lLCB0aGUNCmZpcnN0IG9wdGlvbiBzb3VuZHMgYmV0
dGVyLiBCdXQgbGV0J3Mgd2FpdCBmb3Igb3BpbmlvbiBmcm9tIG1haW50YWluZXJzLg0KDQotLSAN
CldCUiwgVm9sb2R5bXly


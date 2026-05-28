Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGyyN+T+F2oTYQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 10:37:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463165EEB57
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 10:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321014.1588051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSWF0-0006xN-16; Thu, 28 May 2026 08:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321014.1588051; Thu, 28 May 2026 08:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSWEz-0006ut-UA; Thu, 28 May 2026 08:37:21 +0000
Received: by outflank-mailman (input) for mailman id 1321014;
 Thu, 28 May 2026 08:37:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSWEy-0006ul-9l
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 08:37:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSWEx-00Fldb-7G
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 10:37:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a17feb5-bab6-0a2a0a5309dd-0a2a4507ea6c-34
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 10:37:18 +0200
Received: from [40.107.209.23]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a17febd-229c-0a2a45070019-286bd1179be2-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 10:37:18 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by PH8PR03MB989115.namprd03.prod.outlook.com (2603:10b6:510:3a9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 08:37:15 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 08:37:14 +0000
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
 b=MwfVBhLgUZ3qb0njt8y1I1qsYmz32k8nWCtBRjV8d/XwqwTWx6cvNDlZJiW45agjcC7RJnD0zjT9tkUO3yTM0XlCL2foKyT0huQh7tpMSmHCM9QvNXtwSbURz5ute2sww3oVBE0ihlL6Ij+fcaRxCIjW9mBTZXVaVsm0iP47wMo8PV3IqEu23YnPURyxvUmC+FNk4gbm1bT2GUE+I/nCBAhB5YoVje+yu2pGf0SbtohUGgOwHet+U3yxn1bL+o6U60ytleN06KpKNRdLPOBdda0qOQSdcqb6OXRXSTHmIJw/Hd439OwS2x0POjadTZh+IQlmxpL/yVUDuqJEGnxyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Wq5rWjUKBlnSSQtirvzS1PhtuEizuH1aUUrGvKtcdw=;
 b=EYjW59uNLv4Q2FRXYxAD2NVHO4J2swZAlcBzfFsyNSgMAhhNO6Rm9OdBBTZ+Flzpl43RUJy9AOqH8KVdazmhMJcYFv+UH4hyQKAChOh+96N6Id1pPis8/zssqdTiODBdv7vItGSHqwr1CROY9yLtUWfNXt6Vb+w7vwS/Z10gYVYsvLCYVD4omVq4k+avY7/vLui4g4162Cf1jFqL/uxRAS5e8pxLTn4VVFh/GSnHbm27mg8iAtWIz6cyIw/nQhx0B9lSrLdSGlam0VgWipelyA03tvl8HkKmeAUuWvZGjNm3UjpJohNMoDoHIgcI2X+i9zzb/fJ6dx3/fq3Ezb5UGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Wq5rWjUKBlnSSQtirvzS1PhtuEizuH1aUUrGvKtcdw=;
 b=oRLiAPOLnqWytJjGS4TBn+jrpCcPgCSOmLtkYvJdttpdtSpCeXcJUhqtTO76bzjtunx9sVBh5J+kILAMrLoOgoqHumGsRtRwn3s8hvslMgMUZJGEO9eefzyP4opDpZUAW69NomCoURQIDlh87hLgQ0Jch9BlRLGn2Qu94UjpzAI=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>, Christian
 Lindig <christian.lindig@cloud.com>, Andrew Cooper
	<andrew.cooper@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 3/3] tools/ocaml: Add OCaml binding for NUMA claim sets
Thread-Topic: [PATCH v7 3/3] tools/ocaml: Add OCaml binding for NUMA claim
 sets
Thread-Index: AQHc3yskZefH5Dcnuk2paHsViwIsPLYIlbSAgBqkjPA=
Date: Thu, 28 May 2026 08:37:14 +0000
Message-ID:
 <LV3PR03MB7707CEA80CEC74939A6E508187092@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
 <10726c7afb43856a1014c6b6e24700442ff8740e.1778272036.git.bernhard.kaindl@citrix.com>
 <b60c1209-fdaf-4e9a-b93a-878a3aeb64fc@suse.com>
In-Reply-To: <b60c1209-fdaf-4e9a-b93a-878a3aeb64fc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|PH8PR03MB989115:EE_
x-ms-office365-filtering-correlation-id: 0bb2bc9c-acfe-4b4b-3194-08debc9451dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|5023799004|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 1ge9km4HHhEw/1tDnio0I5Qojv+PqgED93o89J0VMU8zV8QDHt7025U9m7yk1MpMJshwprNlLECCWFo7G7WkoI2Wh+qfyltGj7UDbTgeyYoRdi8ew5hFavVjfwa4dVRLh7sVZHqFc3QNP8FdpaWgVpxVx8J6XFn8y1OytEJsknWNvQEVjIPsq+ZBro5jJo18ftwyfaJks7sWctMgNZFfrXW/48XTyaAw6J5a0Yh1srMBtiKPPLtMPWwBPtkBtKpmcxFmglrwQkrKnutfgUmaOg5h8aVw84f4XREhhzkgxpaW2Bxgt/xOMAf0b1RSdOHAVd33OsAX+ccTuPfZ/Fqm8G+jtVDjGRjbJJzzwNVFy5DV3TWyZxur/sAjr4vcL3+lL10CwGLpK3t2XMslJbcZO0O6os0dapGqQeezV4FGl4t9Yo2dYDE18FWsNm4BIzskTpMO9xIPK83RyxApH+tM6UxGOXf53Z5qcvNYJZLzjLx/CwjR4ydhZhRYbJdS3fOT343diHSrDmeRGrQgGUuLSHbNlphum4YGeQywoqdU1x83miKfcXqdaxNX4KZ9qtSGGoxlidzOcw6h0vjJ5hZhpCfin8ZFcSwO5D497ZwHZj3/5iScb2UX6xPxFV/tDixz5Wi25WBkBFnRbtn0IFlTU+9R7mCAOPS9eGdXFyY6lBaAMfs3sZk+ymZTa9XSnQb4tMsd6EQMQSP+wjSxueL/VAp/at4DzqWN3wPgVoeBNc5EgsweqMl1cOvk5Y8rlvFp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(5023799004)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXFtNFlteE9hU29xb2F1MVNLY2ZhUEp0Yk1zOXJnQkdTWlhxb21zQUtIaVhP?=
 =?utf-8?B?S2tGVkRPL092ZjFoemhOOW45WGJOcFJvdGgxQmdWT25XMEtQaVlkbTRMa2ow?=
 =?utf-8?B?M3UydmU0U1hvWi9FRHdSalQvVEVVcFg4TzM4MDZjSUh6dS8xWnEzb0xaMmp3?=
 =?utf-8?B?ZERzZUhqbGZZTU1NNjk2VkpoajFQUkNsUTRVK3Vzams5WlAzVE9EQ0k0UHI3?=
 =?utf-8?B?VVVPMkpQUk1IQUFwVVVPM0VMdy9zanFTMDgyNlhOTk15OUUrZUtTcGhweURE?=
 =?utf-8?B?T2pJTGtOMm9yTW16a1o2YmJjSjNsc3RXVUZ3aXRiMG9KOXhPY0ZQaDZ1ek1i?=
 =?utf-8?B?dVNCbTJ4KzJzWkVDSVFhZ2FRM0k2Z21LbEJVM1RYSFNudTRlTmZ5NDJTckdX?=
 =?utf-8?B?M084ZzY5UWdPMGk4cjl2UzRLUTF6WjN1MkN5UUx0ck9rd290c0VXTytpbDAy?=
 =?utf-8?B?dnVCcmRWNXNRZEo3U0pxMmVqNExnR05qY3VmNVB0V2o5WFV0OEplcXFTd2Jp?=
 =?utf-8?B?WFpJZTRYTU1vN0lCd2FUY0d0RUIrcmZ6VE5NZ2EzdTlsVi9DcVJmZDBMWlM5?=
 =?utf-8?B?VDRjRko1UHI5Rzd5dkZsb1hUU01ZdTFzYWZyQVNKbmxIajJnNUg3ZnJ6bU91?=
 =?utf-8?B?RVo3TGh0MExRTTFuS2NOcExyakFmTWc1dUs3ZG00R0U4Uk5hc1d2T0xyYVJ0?=
 =?utf-8?B?bzViVGUwTnpMZWZkRjUxNVI1Z0hEb1hZMk8vVXRDMXNZVGhRTWppY3VoUGFo?=
 =?utf-8?B?eUdiWEtGZlNHcXplQmU4eE1rMDZSREwrRE9uNmFEK2xtZGFPSUpxcU5mNXV0?=
 =?utf-8?B?YnFnRE1oR1grODljL044Q0xRTkh6UVhITmRXRVpLNUFUU1ZXNnlEZGFCbVRD?=
 =?utf-8?B?TzNCNExrWjZOQVAyMVk4U0J6TlJLS29mY0Y0blZEcm5wODB3Qy9vTHB1SFpn?=
 =?utf-8?B?MGExTE1oNkRmQkNPMzEzd2pxSXNoa01WYmFwZElzMW0yUjNzM2xwcUVsV093?=
 =?utf-8?B?aVVCSFR2dzBXQkNUN0Y4U2pmU3Bua3VlSTg4K3dsTHBjZ2R6MkdGd1JJQU5v?=
 =?utf-8?B?SDBrcmQxaFZPQTNyU0dLRWtNS0NPWXYzajJGTHRTRzZteWt6b3NGSFVwOElj?=
 =?utf-8?B?NUdHV3drQ1h5ZjduTWE3azVBSXRzNDI2ZC8zc3hQdzF0U0JYRjluZTdOb1RW?=
 =?utf-8?B?Q2syWTJVN0lEVzRra3hwVC9seG1lOUI0K293L2hYQW9mN1gwYkpDeTdhYTdC?=
 =?utf-8?B?RjZlMCt5Sm1HblI1S3Q1dUlseXhSTUIrUDVFQmFqSXAvaVR3dW1GRnlWZFZp?=
 =?utf-8?B?M0E3Y09QR202S0x6M3g4ZEpjUTZpSVFFTFRnNHE1dytOdVc4Nk5IMFdQMnJT?=
 =?utf-8?B?Q25KRmVFWWtaOWxUR2xITk81ekJzTWkrejJqdlVBQkZhdGxKaHVlVFMwYUM5?=
 =?utf-8?B?cFdoWmFyaEFWNkJuZlh3Q2ZEVU81cU93QSs1R3UwZ1V0YTZjcmdRWEcxdFJJ?=
 =?utf-8?B?SkJMeUEwdnFwUVR1S2lHeHVOMk9KcS91TlY4N3o4OHk4VjFzQjd1cVdXRnd4?=
 =?utf-8?B?Z2xnY2JSN1ZFL0c2ZnhDWGdqcVdmSDY5ZjZqcWl6TERZL2RJaTJqWkFtd284?=
 =?utf-8?B?ZnhXNlByWHJaODJLVnZSNnZzazZWM3hJbmVDQnlyL0pIUHJGNGFWYTE4MGJT?=
 =?utf-8?B?anRxajdUajlyY3BObDFsdHJLcWp4Y0gxREg4dUo1cGNaWkVSdlpmT3p1eXFX?=
 =?utf-8?B?b1ZoMnhoQ3BsM05tbE1XckNZWE1vOC9SUDZBdmRxVDc1SnhiMkp0QjJZK2FE?=
 =?utf-8?B?Ynd0MmNqUlJMeE5BZ2pveFoza3V3N0VJb0oyRWtPcWdiSWlzSUR6MlBEbDho?=
 =?utf-8?B?dXRvOHhIRDIzUVA4Mksxbm9QSFdjaXBLcW1LY3RveUJEOWt5anJ1MEUrV29w?=
 =?utf-8?B?OGplQ1RwcDdneis5aVVPTWNFODhhdzhZV0NMTzd3SytHNUYvbmxlMzVsVlNZ?=
 =?utf-8?B?NS9aeUZydHcyVUFVaDJITHhKcUVjd21mbVdEWVZLUnNYVkpCajFWS1hPMFJ1?=
 =?utf-8?B?NHNYT1p2NmJ1a2wxNnQ5ejFPR0FHd09ONk1SZkRoRkZqY1N5N0szVmJWTStC?=
 =?utf-8?B?OWZJOS9QRXhsYWpsZFFKaVRmRHA4dWgyK3RNZUR4ZmIyL2cvdG1Cc3pkR1Yr?=
 =?utf-8?B?NzdWR29Jb3ZVbS9CRXAyMmxUV3IveldMeTBjVFlYaHpULzQzK3BoT3RVTU5K?=
 =?utf-8?B?eHZaYnFDNnBydGk0UUwxMDhGSGhIclAybmIxVjkrSUdMN2pCZkZJZzQrWlpn?=
 =?utf-8?B?Y1gvbEJYS3VQZUk4cmE2NGZKVUlHTGdwZVBZZzVNSk11QmtjcENLQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb2bc9c-acfe-4b4b-3194-08debc9451dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 08:37:14.6826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0AFY/cjq67UdnWw9oR7drZ7LRwZU4VY4J2Fb3t2jzp5vXWtdtP4jdRve2MkVTz9RuOTpCcLuYeFls2Ww+igXVQRktM+13diCMCkqf+cYwto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989115
X-purgate-ID: tlsNG-ef75cf/1779957438-22D77C48-1F227F8B/0/0
X-purgate-type: clean
X-purgate-size: 1138
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:anthony.perard@vates.tech,m:christian.lindig@cloud.com,m:andrew.cooper@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 463165EEB57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEFja2VkLWJ5OiBDaHJpc3RpYW4gTGlu
ZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNsb3VkLmNvbT4NCj4gPiBSZXF1ZXN0ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QmVybmhhcmQgS2FpbmRsIDxiZXJuaGFyZC5rYWluZGxAY2l0cml4LmNvbT4NCj4gDQo+IE5pdDog
Q2hyb25vbG9naWNhbGx5IG9yZGVyIHRhZ3MsIHBsZWFzZTogQ2hyaXN0aWFuIGNhbid0IGhhdmUg
YWNrLWVkDQo+IHRoaXMgYmVmb3JlIHlvdSBzaWduZWQgb2ZmIG9uIGl0Lg0KPiANCj4gSmFuDQoN
CkhpIEphbiwgYXMgdGhpcyB3YXMgdGhlIGxhc3QgcGF0Y2ggaW4gdGhpcyBzZXJpZXMsDQoNCkkg
YXNzdW1lIHlvdSBmb3VuZCBubyByZWFzb24gd2hpY2ggY2FuJ3QgYmUgZml4ZWQgb24gbWVyZ2Ug
Zm9yIHRoaXMNCnNlcmllcyBhbmQgeW91IGNhbiBhY2sgaXQ/IChJIHRoaW5rIGl0ZW0gY291bGQg
YmUgZml4ZWQgb24gbWVyZ2UpDQoNCklmIHlvdSBjb3VsZCwgcGxlYXNlIGRvIHNvLCBvdGhlcndp
c2UgY291bGQgSSB5b3UgZXhwZWRpdGUgeW91ciByZXZpZXcNCm9mIGl0Pw0KDQpBdCBsb3Qgb2Yg
ZnVydGhlciBOVU1BIHdvcmsgZGVwZW5kcyBvbiBpdCwgYW5kIGl0IGFzIGl0IGhhcyBiZWVuIHBv
c3RlZA0KaW4gdGhpcyBvciB2ZXJ5IHNpbWlsYXIgZm9ybSBiZWZvcmUgdGhlIGRlYWRsaW5lcyBm
b3IgWGVuIDQuMjIsIGl0IHdvdWxkDQpiZSBuaWNlIGlmIGl0IGNvdWxkIGJlIGNvbnNpZGVyZWQg
Zm9yIG1lcmdlLg0KDQpUaGFua3MsDQpCZXJuaGFyZA0K


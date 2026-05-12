Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEKXOPQAA2rdzQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 12:29:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83451E8E9
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 12:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306684.1578512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMkLW-00036h-Ft; Tue, 12 May 2026 10:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306684.1578512; Tue, 12 May 2026 10:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMkLW-00033e-8s; Tue, 12 May 2026 10:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1306684;
 Tue, 12 May 2026 10:28:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wMkLU-00033W-2m
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 10:28:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMkLT-000aIq-Fu
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 12:28:11 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a0300ac-bab6-0a2a0a5309dd-0a2a45039c0c-38
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 12:28:11 +0200
Received: from [40.107.159.98]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a0300b9-672d-0a2a45030019-286b9f6286d5-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 12:28:09 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by VI1PR03MB10078.eurprd03.prod.outlook.com (2603:10a6:800:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:28:06 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 10:28:06 +0000
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
 b=b5CjJJ5VmvcEiygxMATkEfLNMjYT0m5YmbzuqaXUTmvjO0hYa2UWs1S3uOFzJxFbZ93rQf1kRbctiTTFsx69TgfhV1aYt9dfLcFEnw47TbvPyv/r33C4zoQ0spFbJReKEEUlvbFhNazYp1CnUP6RFbXLPm0nHkdz11/sqJUkvFGhd0iHzArd2c9Ic/tjusyYZkd6KuyGOBO3rDCmvXo+lJ6NbYEXIr/Bp1XjhzaP7k10F5K/HituZpZNEZ+pn76+CWuSo0z0QtlSCTE1LdrxE1SeHPlDMk4eANcDTOW+dCIf63bTaC9RQhTnsIOnPUmiogDZGtOvuMgzYkMVqhfVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iO3TnDT3jNgS1XIX49S5ps9lb9t8niIpRoBJCLC8eY=;
 b=Je7UM4FR9wwHmsAfoZgAICyxwsqtYpiRXMJmW7niHhj/qlSx58Nu3YTdp6ICvfzbVKeQLHjN0+C9ivzbO8welIVjtald9hr6OdtIS5H0NJIBjH11BaZafWH8qS/pgl0IGIPbWzwQAQWx0Daa0giws51ktKhJJUsI1FyuMXHwqqOucmeA3SCAzeRGT+h11m8g9nhnxhuRo9hif4gHUDHIAOZwvBOseHGTyYQAH+gra7wFeHj2OVuQtPr+VEJ4Eh9AiBFGrRWjYpCXX0qfW4vszCwhpUy39Pt1dqgoF8zFUNpbuJvzgZ0KKPHXcthD2xwHVj0zoHEy5nopaTHYHcVcPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iO3TnDT3jNgS1XIX49S5ps9lb9t8niIpRoBJCLC8eY=;
 b=VFccf7+SCRC2bI/foY8GNugjFRob3YnJ4Qcq6iynory4dkWBU402rq+dZ6Rh+iIDDb4Ox2EVIxhIxy+v/n5I/wmPQDtt5ATbZqkqxhDNhl+11NSTvdhGBxg2w5ugWhaPeDXPgVrLLv2XNSXWig1S8gQn7l+63/o/BmObLWPo/4+7RfWFP4KGff1Zy3hKG6smjbzF1g/k7TQcC7k3LN/1p1hXcIrcrANGcucB5AKYDY7A2fY9PCX39knrUpld65cKfsEpxNNva2GokCKE4RQ73M5vOKMkiEUvo6GdhzBywt6GKcFyzWe/iwEpzq9Ee7CwoZedIghMghK9PY8tnOYFBw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHcyClfuk/Yqk/9/E2oGahG1JP+sg==
Date: Tue, 12 May 2026 10:28:05 +0000
Message-ID: <87v7csrkgb.fsf@epam.com>
References: <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
	<5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
	<efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
	<d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
	<e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com>	<878q9vt0lg.fsf@epam.com>
	<e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com>	<877bparq9t.fsf@epam.com>
	<1d591ff7-599d-4dfa-b521-bfaded430a76@suse.com>
	<925f2076-f98b-4102-ba45-a85a83861c9f@epam.com>
	<agLruvURfBUb-VgF@macbook.local>
In-Reply-To: <agLruvURfBUb-VgF@macbook.local> ("Roger Pau =?utf-8?Q?Monn?=
 =?utf-8?Q?=C3=A9=22's?= message of	"Tue, 12 May 2026 10:58:34 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|VI1PR03MB10078:EE_
x-ms-office365-filtering-correlation-id: 4d34842f-41ae-4549-82b4-08deb01127a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|18002099003|22082099003|11063799003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 MR8xPLIeeiJEx9ZrVZXgh41wMcrBIaRPpyxz8MqrCYkxWx5tsyU6AE1aUg3pdX/2Ss7QXN+85MzV0yOy4QFrRlTkAvieh3KK+KHzUp10QKQFJZ75agTvvUeOdokZ36YEQeZjNnxyZ16CC+iKdEM6NR6/qjAf6147RQveKVNoSDFszNEymkvm/DD87C0WOMkTwlPNfUMESB+lMlEaA43i+r8+ZkjaODn+fRgFvtWoSQyZUxgR3ZHrGtz0o5VizY8w90JZtoqExrnyFuyfStX6JpEd8Jkkotdarap+xCCUR/dT/CpQ95D086UjgdNdOnasfCObydLbl6CTeSN8q54H68ob3Z6xrpQrpSyOZNxFVwh8xH6SqRBSu0v/E9rhEBPk7Q+UuQs/rC9ynx2SukMnN7Y2jO3dQQu5SX1gUTloiEYUFj9obkh9B83muDPSE3quS0+yRgmoW5wOlFlREV1W61Ey1PbWIT6HvJubnjnDLKecVaJTbJ9zhYL+zbaI0gxcLpGp3fnnBMEc1YufSP9LqfN/gQtdKAjEHr+o9J/LirAQ8A+DPN7YbJWeYu+uX2B+lXXTiaWn+O4FMxTxZwZswHg3OaMWPH7XVCrqp8S32wsvLZKs6LpygRNIJXa4mNM6A+dciMJHndEtt0gE+fqFcbR+LX8M0VpRtIK/Um85AaHbJ5KHO3p5yEleUwe7GJpQZNvAkYAU5+xpPFcB2LlBKg+y96FtMwU9q35n55HzJzkrD+P5Dp7FLPSa/5QHUwU+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(18002099003)(22082099003)(11063799003)(38070700021)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlZYYmlQNEowdVNZM3FubWZvbmJGYno2Qit6ZlZRQ2cvZG5Ldm1qWXNXdGpV?=
 =?utf-8?B?VDQ0OUkzVE42dk1XckREVGduYkFPL1l5U1dUeGN1dkl6SHJLQmt0czNmb0pS?=
 =?utf-8?B?NVpaaGJUQ2U3RG1rVjQzV1dOUWZhUDIwMXdKQVExUHlLWTIvdWlxaGtWWEo3?=
 =?utf-8?B?OTVnUnRFa1RnakFUTjlhdDAyaGFUN2pXR0FvMzl1a2RTdUVKRmdTdm1xQVBI?=
 =?utf-8?B?WUJnbnZPakErOWdKVmptWHlPa2dwZ29Vc0oyQ0ZleEdpQ3RSR0ZQb0F4MUNB?=
 =?utf-8?B?MTBuWjNUaXVaeVJDRnNZdXdCOUthYXVVZVU2cFVDMGpzd2cwMWNLTzVKSUhX?=
 =?utf-8?B?MnZBM3dleEViZXZsaXZ5dCtOV3oxRnU5OVhBK25qRWh2eno5RzArY3RVMXF4?=
 =?utf-8?B?bkZpd1ZFOE50RGhtbVdUS2c4MlRNS1gwTyt4MGhpT1hZM0FveGNiaVVHVW9n?=
 =?utf-8?B?VFdSUWZYTzBiRSsydzZtSW96dEZBYitTZlVMZk5wZ2M2VzNJcjBNS2g3WTc1?=
 =?utf-8?B?ZjVpWGwxV2twVSs2Ny9DMHZDN2Z3c1JEcWlsZkxZbGNqNEM1MVBXZjlCNVBH?=
 =?utf-8?B?OGRCSnlLWmVndk1CUXR0Vm1iS3cvMVlaMEtFZ2UrZHB6ZTRuMWVEejZxNG1y?=
 =?utf-8?B?RGxqYjdtTFYwUENXSGt0ZGJaVWRUSzZYVk1kcFV0bG9qVjNvcDF6UkZHUWdB?=
 =?utf-8?B?UmxsWUUzaGJrUjhKSGswY3BVOWdTS3FCZ0xNTzNPclNnVnhod0NDQ2RjUi9L?=
 =?utf-8?B?TGxidzFMVXVYMVRIOTVVQ1FMWlRla2tZUTJDZmlnalFacHYxZmxmL2FRN21u?=
 =?utf-8?B?RDFPdFVOKzg3QjhmL1VUTzNudTBxUTJod202Vm5OaERMaVlzTnMvb2Zyb1ZV?=
 =?utf-8?B?M0JhbFpudjZ3Skk0RkJtQzdsRjlrOU1ETkRQaE5nR2FwTWYvRW0xSXd3Y2dR?=
 =?utf-8?B?ZmRtUGJQQXRYWUNqU1FoOXVyM2toSS9JbmplLzdSS3RkZ1ZxSjk5Q093N3Nh?=
 =?utf-8?B?Mm95TUtockZIUUFEL3FONGExc2JweHF1MWhzeVF1UFVTaEo4MFJPZVh0RDRZ?=
 =?utf-8?B?REwzbE9BenJReEZHRmNjOVdsd2V2ZjhueExEdDRPTGdlQnNYTFVsc2g5WHFV?=
 =?utf-8?B?RHhWRHQ0UjlLWFFrK0dObnZVaWMzd2ZjMnVMM1dJczduS1laRU5jazIxV2JF?=
 =?utf-8?B?L0ovRVJCdHdocUxNQ3Q0N1pyS1IzVWhxbERQeFBMTnpCNCt1SEhIODF4Wmd3?=
 =?utf-8?B?REhvWGl2QktlbHNKWS9jc0Y4UVF1MTZaQ3dzWHVBeU5oaDFnWk9PVTdab2E5?=
 =?utf-8?B?VVI2d0krVHkwMHpyVUNPYS9ORVNPWE5jbDY3Vlk1ajdmY0tUWUZPUUZHSXJw?=
 =?utf-8?B?cmlxRGZHdS9oektSYTFiY3BTeTkzUTZ4V1pIRHhETXhLZU5MWWN3OUJzL2ht?=
 =?utf-8?B?MmdOeGxPYWFDRkw3N25jZ1FJRSs0eERDaEVJeEh6VG81dy84YzRBd29BaXZl?=
 =?utf-8?B?YmJmOGh6blZaWkhaeW5naHN3Q3hBcXIyMEhoUlVCdEQvYnYvN2JVT0lzYzhL?=
 =?utf-8?B?MEtmMG4wKzFNTHZIMW9WOUg1RHFadkt0dzE4ME5tc1FqOWlSOUdwOUkvYWRu?=
 =?utf-8?B?OG1XaUl1dHluN2lWZ3dueVlvRGJHemd6TlpqemJmL2lvRGlsTWZHOUtzSWJh?=
 =?utf-8?B?cEdXanRDZ2tUUkIzR0dwVjJyTzNaUkZqUE9NNytWMGFiWE9NbzIxMUFYVW92?=
 =?utf-8?B?M1dzUzJOcFJQVWE3eTUwWmNpdUlzell3b2dzV1NRR0Z3S2IxK0dVbnNSRklB?=
 =?utf-8?B?WXZrSithU2Z5eXlwazc1dlJLU3RKY0pvUmJpVzh3UjhFTDR2MEJnMTZqQWxm?=
 =?utf-8?B?SVpnNTJHN0J5Nm8zYzBTZFJjaXRTRDZrTWNjTmdiZnd3NGhDaWt2azFrOXFE?=
 =?utf-8?B?WmJPa2s1ZWd3cmJlZmliUE8wVlBIQzZtMXFoV2xpakUwM3c1OS9yaC9hbm5m?=
 =?utf-8?B?Nm5WREROM0x3bFJLQ0lwb29wd0pUNnRrbS83WHQ2V0RHc0UxSng2YUZISFM1?=
 =?utf-8?B?anByYXpQd2ZLV2pPeHdYZGRHMFFuUktCTFh6UDUvd251UXhKWW0vbmJLT0VF?=
 =?utf-8?B?S093ZTZSS2pLRjhxb1hhWnFuWHYzZ3hlcTRzTUFNYlJhQjVBNDRUR2tLaXFB?=
 =?utf-8?B?NThLWVJ4TG4rNVRKVWV5eEgwUVpCUFVkY09CY0lqNVFTbjVJLy9vZjZzeXc1?=
 =?utf-8?B?Ui9SWTB6TXc3N1VuZ0ZqZFNGREFHUHU3ZmJPOFNWQWR0SmlSVUc5WEIzTW05?=
 =?utf-8?B?RE53N0dqa1FnNEFvUjEwQk9ibDF3NWJJem1KOE9uOEY1YWVwb0RsSmtmdUhD?=
 =?utf-8?Q?bVH+gFI1aL5cAf4o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E84C96451658444AD2441BE1943FB32@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d34842f-41ae-4549-82b4-08deb01127a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 10:28:05.9120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzw9c7stkemNo7Prlx6oDFqyDT1MTi49KGrYNp5xmG9leRsQTYb2T9d22WNvipD3q0ZiddZnp6+wz1g8l3tBxhaHPVeKvHI2eQMYr+BD0WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10078
X-purgate-ID: tlsNG-33051d/1778581689-3794D938-42F253BC/0/0
X-purgate-type: clean
X-purgate-size: 10708
X-Rspamd-Queue-Id: 2D83451E8E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,citrix.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNClJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cml0
ZXM6DQoNCj4gT24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMDc6MzI6MjBBTSArMDAwMCwgTXlreXRh
IFBvdHVyYWkgd3JvdGU6DQo+PiANCj4+IA0KPj4gT24gNS8xMi8yNiAwOToyMCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+PiA+IE9uIDExLjA1LjIwMjYgMTY6MTAsIFZvbG9keW15ciBCYWJjaHVrIHdy
b3RlOg0KPj4gPj4gSGkgSmFuLA0KPj4gPj4NCj4+ID4+IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JpdGVzOg0KPj4gPj4NCj4+ID4+PiBPbiAwNy4wNS4yMDI2IDIyOjQwLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+ID4+Pj4gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cml0ZXM6DQo+PiA+Pj4+PiBPbiAwNi4wNS4yMDI2IDExOjM5LCBNeWt5dGEgUG90dXJh
aSB3cm90ZToNCj4+ID4+Pj4+PiBPbiA1LzQvMjYgMDg6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4gPj4+Pj4+PiBPbiAyMy4wNC4yMDI2IDEyOjEyLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+
ID4+Pj4+Pj4+IE9uIDQvMjEvMjYgMTc6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gPj4+Pj4+
Pj4+IE9uIDA5LjA0LjIwMjYgMTY6MDEsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gPj4+Pj4+
Pj4+PiBGcm9tOiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29t
Pg0KPj4gPj4+Pj4+Pj4+Pg0KPj4gPj4+Pj4+Pj4+PiBUaGlzIGNvZGUgaXMgZXhwZWN0ZWQgdG8g
b25seSBiZSB1c2VkIGJ5IHByaXZpbGVnZWQgZG9tYWlucywNCj4+ID4+Pj4+Pj4+Pj4gdW5wcml2
aWxlZ2VkIGRvbWFpbnMgc2hvdWxkIG5vdCBnZXQgYWNjZXNzIHRvIHRoZSBTUi1JT1YgY2FwYWJp
bGl0eS4NCj4+ID4+Pj4+Pj4+Pj4NCj4+ID4+Pj4+Pj4+Pj4gSW1wbGVtZW50IFJXIGhhbmRsZXJz
IGZvciBQQ0lfU1JJT1ZfQ1RSTCByZWdpc3RlciB0byBkeW5hbWljYWxseQ0KPj4gPj4+Pj4+Pj4+
PiBtYXAvdW5tYXAgVkYgQkFSUy4gUmVjYWxjdWxhdGUgQkFSIHNpemVzIGJlZm9yZSBtYXBwaW5n
IFZGcyB0byBhY2NvdW50DQo+PiA+Pj4+Pj4+Pj4+IGZvciBwb3NzaWJsZSBjaGFuZ2VzIGluIHRo
ZSBzeXN0ZW0gcGFnZSBzaXplIHJlZ2lzdGVyLiBBbHNvIGZvcmNlIFZGcyB0bw0KPj4gPj4+Pj4+
Pj4+PiBhbHdheXMgdXNlIGVtdWxhdGVkIHJlYWRzIGZvciBjb21tYW5kIHJlZ2lzdGVyLCB0aGlz
IGlzIG5lZWRlZCB0bw0KPj4gPj4+Pj4+Pj4+PiBwcmV2ZW50IHNvbWUgZHJpdmVycyBhY2NpZGVu
dGFsbHkgdW5tYXBwaW5nIEJBUnMuDQo+PiA+Pj4+Pj4+Pj4NCj4+ID4+Pj4+Pj4+PiBUaGlzIGFw
cGFyZW50bHkgcmVmZXJzIHRvIHRoZSBjaGFuZ2UgdG8gdnBjaV9pbml0X2hlYWRlcigpLiBXcml0
ZXMgYXJlDQo+PiA+Pj4+Pj4+Pj4gYWxyZWFkeSBpbnRlcmNlcHRlZC4gSG93IHdvdWxkIGEgcmVh
ZCBsZWFkIHRvIGFjY2lkZW50YWwgQkFSIHVubWFwPyBFdmVuDQo+PiA+Pj4+Pj4+Pj4gZm9yIHdy
aXRlcyBJIGRvbid0IHNlZSBob3cgYSBWRiBkcml2ZXIgY291bGQgYWNjaWRlbnRhbGx5IHVubWFw
IEJBUnMsIGFzDQo+PiA+Pj4+Pj4+Pj4gdGhlIG1lbW9yeSBkZWNvZGUgYml0IHRoZXJlIGlzIGhh
cmR3aXJlZCB0byAwLg0KPj4gPj4+Pj4+Pj4+DQo+PiA+Pj4+Pj4+Pj4+IERpc2NvdmVyeSBvZiBW
RnMgaXMNCj4+ID4+Pj4+Pj4+Pj4gZG9uZSBieSBEb20wLCB3aGljaCBtdXN0IHJlZ2lzdGVyIHRo
ZW0gd2l0aCBYZW4uDQo+PiA+Pj4+Pj4+Pj4NCj4+ID4+Pj4+Pj4+PiBJZiB3ZSBpbnRlcmNlcHQg
Y29udHJvbCByZWdpc3RlciB3cml0ZXMsIHdoeSB3b3VsZCB3ZSBzdGlsbCByZXF1aXJlDQo+PiA+
Pj4+Pj4+Pj4gRG9tMCB0byByZXBvcnQgdGhlIFZGcyB0aGF0IGFwcGVhcj8NCj4+ID4+Pj4+Pj4+
Pg0KPj4gPj4+Pj4+Pj4NCj4+ID4+Pj4+Pj4+IFNvcnJ5LCBJIGRvbid0IHVuZGVyc3RhbmQgdGhp
cyBxdWVzdGlvbi4gWW91IHNwZWNpZmljYWxseSByZXF1ZXN0ZWQgdGhpcw0KPj4gPj4+Pj4+Pj4g
dG8gYmUgZG9uZSB0aGlzIHdheSBpbiBWMi4gUXVvdGluZyB5b3VyIHJlcGx5IGZyb20gVjIgYmVs
b3cuDQo+PiA+Pj4+Pj4+Pg0KPj4gPj4+Pj4+Pj4gICAgPiBBcmVuJ3QgeW91IGVmZmVjdGl2ZWx5
IGJ1c3ktd2FpdGluZyBmb3IgdGhlc2UgMTAwbXMsIGJ5IHNpbXBseQ0KPj4gPj4+Pj4+Pj4gcmV0
dXJuaW5nICJ0cnVlIg0KPj4gPj4+Pj4+Pj4gICAgPiBmcm9tIHZwY2lfcHJvY2Vzc19wZW5kaW5n
KCkgdW50aWwgdGhlIHRpbWUgaGFzIHBhc3NlZD8gVGhpcyBpbW8gaXMgYQ0KPj4gPj4+Pj4+Pj4g
bm8tZ28uIFlvdQ0KPj4gPj4+Pj4+Pj4gICAgPiB3YW50IHRvIHNldCBhIHRpbWVyIGFuZCBwdXQg
dGhlIHZDUFUgdG8gc2xlZXAsIHRvIHdha2UgaXQgdXAgYWdhaW4NCj4+ID4+Pj4+Pj4+IHdoZW4g
dGhlDQo+PiA+Pj4+Pj4+PiAgICA+IHRpbWVyIGhhcyBleHBpcmVkLiBUaGF0J2xsIHRoZW4gZWxp
bWluYXRlIHRoZSBuZWVkIGZvciB0aGUNCj4+ID4+Pj4+Pj4+IG5vdC1zby1uaWNlIHBhdGNoIDQu
DQo+PiA+Pj4+Pj4+Pg0KPj4gPj4+Pj4+Pj4gICAgPiBRdWVzdGlvbiBpcyB3aGV0aGVyIHdlIG5l
ZWQgdG8gYWN0dWFsbHkgZ28gdGhpcyBmYXIgKHJpZ2h0IGF3YXkpLiBJDQo+PiA+Pj4+Pj4+PiBl
eHBlY3QgeW91DQo+PiA+Pj4+Pj4+PiAgICA+IGRvbid0IG1lYW4gdG8gaGFuZCBQRnMgdG8gRG9t
VS1zLiBBcyBsb25nIGFzIHdlIGtlZXAgdGhlbSBpbiB0aGUgaGFyZHdhcmUNCj4+ID4+Pj4+Pj4+
ICAgID4gZG9tYWluLCBjYW4ndCB3ZSB0cnVzdCBpdCB0byBzZXQgdGhpbmdzIHVwIGNvcnJlY3Rs
eSwganVzdCBsaWtlIHdlDQo+PiA+Pj4+Pj4+PiB0cnVzdCBpdCBpbg0KPj4gPj4+Pj4+Pj4gICAg
PiBhIG51bWJlciBvZiBvdGhlciBhc3BlY3RzPw0KPj4gPj4+Pj4+Pg0KPj4gPj4+Pj4+PiBIb3cn
cyBhbnkgb2YgdGhpcyByZWxhdGVkIHRvIHRoZSBxdWVzdGlvbiBJIHJhaXNlZCBoZXJlLCBvciB5
b3VyIHJlcGx5DQo+PiA+Pj4+Pj4+IHRoZXJldG8/IElmIHdlIGludGVyY2VwdCBQQ0lfU1JJT1Zf
Q1RSTCwgd2Uga25vdyB3aGVuIFZGcyBhcmUgY3JlYXRlZC4NCj4+ID4+Pj4+Pj4gV2h5IHN0aWxs
IGRlbWFuZCBEb20wIHRvIHJlcG9ydCB0aGVtIHRoZW4/DQo+PiA+Pj4+Pj4+DQo+PiA+Pj4+Pj4N
Cj4+ID4+Pj4+PiBUaGUgc3BlYyBzdGF0ZXMgdGhhdCBWRnMgY2FuIHRha2UgdXAgdG8gMTAwbXMg
YWZ0ZXIgdGhlIFZGX0VOQUJMRSBiaXQgaXMNCj4+ID4+Pj4+PiBzZXQgdG8gYmVjb21lIGFsaXZl
LiBXZSBkaXNjdXNzZWQgaW4gdGhlIFYyIHRoYXQgaXQgaXMgbm90IGFjY2VwdGFibGUgdG8NCj4+
ID4+Pj4+PiBkbyBhIHJlcXVpcmVkIDEwMG1zIHdhaXQgaW4gWGVuIHdoaWxlIGJsb2NraW5nIGEg
ZG9tYWluLiBBbmQgbm90IGRvaW5nDQo+PiA+Pj4+Pj4gdGhhdCBibG9ja2luZyB3b3VsZCByZXF1
aXJlIHNvbWUgbWVjaGFuaXNtIHRvIG9ubHkgYWxsb3cgYSBkb21haW4gdG8gcnVuDQo+PiA+Pj4+
Pj4gZm9yIHByZWNpc2VseSA5OShvciBtb3JlPyltcy4gWW91IHlvdXJzZWxmIHN1Z2dlc3RlZCB0
aGF0IHdlIGNhbiB0cnVzdA0KPj4gPj4+Pj4+IHRoZSBoYXJkd2FyZSBkb21haW4gd2l0aCByZWdp
c3RlcmluZyBWRnMgaWYgd2UgYWxyZWFkeSB0cnVzdCBpdCB3aXRoDQo+PiA+Pj4+Pj4gb3RoZXIg
UENJLXJlbGF0ZWQgc3R1ZmYuIERpZCB5b3UgY2hhbmdlIHlvdXIgbWluZCwgb3IgYW0gSSBjb21w
bGV0ZWx5DQo+PiA+Pj4+Pj4gbWlzdW5kZXJzdGFuZGluZyB0aGlzIHF1ZXN0aW9uPw0KPj4gPj4+
Pj4NCj4+ID4+Pj4+IE5vLCBJIHN0aWxsIHRoaW5rIHRoYXQgd2UgY2FuIHRydXN0IGh3ZG9tIGVu
b3VnaC4gTmV2ZXJ0aGVsZXNzIHdlIHNob3VsZA0KPj4gPj4+Pj4gYWltIGF0IGJlaW5nIGluZGVw
ZW5kZW50IG9mIGl0IHdoZXJlIHBvc3NpYmxlLiBBbmQgSSBzZWVtIHRvIHJlY2FsbCB0aGF0DQo+
PiA+Pj4+PiBJIGhhZCBhbHNvIG91dGxpbmVkIGFuIGFwcHJvYWNoIGhvdyB0byBhdm9pZCBzcGlu
LXdhaXRpbmcgZm9yIDEwMG1zIGluDQo+PiA+Pj4+PiB0aGUgaHlwZXJ2aXNvci4NCj4+ID4+Pj4N
Cj4+ID4+Pj4gSSB3YW50IHRvIGNsYXJpZnk6IHlvdSBhcmUgdGVsbGluZyB0aGF0IFhlbiBzaG91
bGQgbm90IHdhaXQgZm9yIGh3ZG9tIHRvDQo+PiA+Pj4+IHJlcG9ydCBWRnMgYW5kIGluc3RlYWQg
Y3JlYXRlIHRoZW0gYnkgaXRzZWxmLiBJcyB0aGlzIGNvcnJlY3Q/DQo+PiA+Pj4NCj4+ID4+PiBJ
ZiB0aGF0J3MgdGVjaG5pY2FsbHkgcG9zc2libGUsIHllcy4NCj4+ID4+DQo+PiA+PiBPa2F5LCBz
byBsZXQncyBjbGVhciB0aGlzLiBJZiBJIHJlbWVtYmVyIGNvcnJlY3QsIHlvdSBkaXNjdXNzZWQg
dGhpcw0KPj4gPj4gd2l0aCBNeWt5dGEgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gYW5kIHN1Z2dl
c3RlZCB0byBwdXQgdGhlIHZDUFUgdG8NCj4+ID4+IHNsZWVwIGZvciAxMDBtcy4NCj4+ID4gDQo+
PiA+IEkgZG9uJ3QgdGhpbmsgSSBkaWQgKGV4Y2VwdCBwZXJoYXBzIGZyb20gYSB2ZXJ5IGFic3Ry
YWN0IHBlcnNwZWN0aXZlKSwNCj4+ID4gcHJlY2lzZWx5IGJlY2F1c2Ugb2YgLi4uDQo+PiA+IA0K
Pj4gPj4gSSBkb24ndCB0aGluayB0aGF0IHRoaXMgaXMgYSBnb29kIGlkZWEsIGJlY2F1c2UgZ3Vl
c3QNCj4+ID4+IGtlcm5lbCB3aWxsIG5vdCBiZSBoYXBweSBhYm91dCB0aGF0Lg0KPj4gPiANCj4+
ID4gLi4uIHRoaXMuIEluc3RlYWQgaWlyYyBJIHN1Z2dlc3RlZCB0byByZWZ1c2UgKHNob3J0LWNp
cmN1aXQpIGhhbmRsaW5nDQo+PiA+IFZGIHJlZ2lzdGVyIGFjY2Vzc2VzIGZvciB0aGUgbmV4dCAx
MDBtcy4NCj4+ID4gDQo+PiA+IEphbg0KPj4gDQo+PiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlv
bnMgb24gaG93IHRvIGVuc3VyZSB0aGF0IHdlIGFjY3VyYXRlbHkgY2F0Y2ggDQo+PiB0aGUgd2lu
ZG93IHdoZXJlIDEwMG1zIGhhdmUgYWxyZWFkeSBwYXNzZWQsIGJ1dCBndWVzdHMgaGF2ZW7igJl0
IHRyaWVkIHRvIA0KPj4gcmVhZCBhbnl0aGluZyB5ZXQsIHRvIGZsaXAgdGhpcyBiYWNrPyBBcyBJ
IG1lbnRpb25lZCBpbiB0aGUgcHJldmlvdXMgDQo+PiB2ZXJzaW9uLCBMaW51eCwgZm9yIGV4YW1w
bGUsIGRvZXNu4oCZdCBhdHRlbXB0IHRvIHJlLXJlYWQgYW55dGhpbmcgaWYgdGhlIA0KPj4gZmly
c3QgcmVhZCBmYWlsZWQgYWZ0ZXIgMTAwbXMuIFNvIGl0IGFwcGVhcnMgdG8gbWUgdGhhdCB0aGlz
IGFwcHJvYWNoIA0KPj4gd291bGQgYmUgcHJvbmUgdG8gcmFjaW5nIHdpdGggdGhlIGd1ZXN0IGZv
ciBnZXR0aW5nIHRvIHRoZSBWRiBmaXJzdC4gT25lIA0KPj4gYXBwcm9hY2ggSSBjYW4gdGhpbmsg
b2YgaXMgdG8gc29tZWhvdyBzd2FwIHRoZSByZWdpc3RlciBoYW5kbGVycyBiYWNrIA0KPj4gaW4t
ZmxpZ2h0IGR1cmluZyB0aGUgZmlyc3QgcmVhZCBieSB0aGUgZ3Vlc3QgaWYgMTAwbXMgaGF2ZSBh
bHJlYWR5IA0KPj4gcGFzc2VkLiBIb3dldmVyLCB0aGlzIHdvdWxkIHN0aWxsIGRlcGVuZCBvbiBE
b20wIGZvciByZWdpc3RlcmluZyBWRnMsIA0KPj4gYnV0IGluIGEgbW9yZSBjb252b2x1dGVkIHdh
eS4gV2UgYWxzbyBjYW7igJl0IGFkZCB0aGUgVkZzIGJlZm9yZSAxMDBtcyANCj4+IGhhdmUgcGFz
c2VkIGFuZCBhZGQgdGltaW5nIGNoZWNrcyB0byBhbGwgcmVnaXN0ZXIgaGFuZGxlcnMsIGJlY2F1
c2UgDQo+PiBwY2lfYWRkX2RldmljZSBhbmQgZXZlcnl0aGluZyBiZWxvdyBpdCBleHBlY3RzIHRo
ZSBkZXZpY2UgdG8gYmUgDQo+PiBmdW5jdGlvbmFsIGF0IHRoZSBtb21lbnQgb2YgYWRkaXRpb24u
DQo+PiANCj4+IA0KPj4gDQo+PiBNYXliZSB5b3Ugc2VlIHNvbWUgb3RoZXIgd2F5IHRvIGF2b2lk
IHRoZXNlIHByb2JsZW1zIHRoYXQgSSBhbSBtaXNzaW5nPw0KPg0KPiBXZSBjb3VsZCBtYXliZSBk
byBzb21lIG1pZGRsZSBncm91bmQgaGVyZSwga2luZCBvZiBzaW1pbGFyIHRvIHdoYXQNCj4gTGlu
dXggZG9lcy4gIFRoZSBvdmVyYWxsIGlkZWEgd291bGQgYmUgdG8gcHV0IG9uIGhvbGQgYW55IGFj
Y2Vzc2VzIHRvDQo+IHRoZSBkZXZpY2UocykgUENJIGNvbmZpZyBzcGFjZSBmb3IgMTAwbXMsIHRo
YXQgd291bGQgaW5jbHVkZSB0aGUgUEYNCj4gYW5kIGFueSBWRnMuICBBdCB0aGUgcG9pbnQgd2hl
biBWRiBlbmFibGUgaXMgc2V0IFhlbiBhbHJlYWR5IGtub3dzIHRoZQ0KPiBwb3NpdGlvbiBvZiB0
aGUgVkZzIGluIHRoZSBQQ0kgY29uZmlnIHNwYWNlLg0KPg0KPiBBbnkgUENJIGNvbmZpZyBzcGFj
ZSBhY2Nlc3MgYXR0ZW1wdHMgdG8gdGhlIFBGIG9yIFZGcyBkdXJpbmcgdGhhdA0KPiAxMDBtcyB3
aW5kb3cgd291bGQgY2F1c2UgdGhlIGd1ZXN0IHZDUFUgdG8gYmUgcHV0IG9uIGhvbGQsIGFuZCB0
aGUNCj4gYWNjZXNzIHdvdWxkIG9ubHkgYmUgcmV0cmllZCBvbmNlIHRoZSAxMDBtcyB3aW5kb3cg
aGFzIHBhc3NlZCBhbmQgWGVuDQo+IGhhcyByZWdpc3RlcmVkIHRoZSBWRnMgd2l0aCB2UENJLiAg
VGhpcyBhcHByb2FjaCBuZWVkcyBleHRyYSBsb2dpYyB0bw0KPiBwdXQgdlBDSSBhY2Nlc3NlcyBv
biBob2xkLCBzaW1pbGFyIHRvIHdoYXQgWGVuIGRvZXMgd2hlbiBtYXBwaW5nIGEgQkFSDQo+IGlu
dG8gdGhlIHAybSwgYW5kIGEgdGltZXIgdG8gZGVmZXIgdGhlIGFkZGluZyBvZiB0aGUgVmZzIGFu
ZCB0aGUNCj4gdW5sb2NraW5nIG9mIHRoZSBhZmZlY3RlZCBQQ0kgY29uZmlnIHNwYWNlIHJlZ2lv
bi4NCj4NCj4gVGhhdCB3b3VsZCBiZSBhIG1pZGRsZSBncm91bmQgSU1PLCBhcyB0aGUgZ3Vlc3Qg
dkNQVXMgY291bGQgYmUgcnVubmluZw0KPiBmcmVlbHksIHVubGVzcyBhY2Nlc3NlcyB0byB0aGUg
YWZmZWN0ZWQgUENJIGNvbmZpZyBzcGFjZSB3YXMgYXR0ZW1wdGVkDQo+IGJlZm9yZSB0aGUgMTAw
bXMgd2luZG93LCBhdCB3aGljaCBwb2ludCB0aGV5IHdvdWxkIGJlIGJsb2NrZWQgd2FpdGluZw0K
PiBmb3IgdGhlIHRpbWVvdXQgdG8gZXhwaXJlLiAgQSB3ZWxsLWJlaGF2ZWQgZG9tYWluIHNob3Vs
ZG4ndCB0cnkgdG8NCj4gYWNjZXNzIHRoZSBQQ0kgY29uZmlnIHNwYWNlIGVpdGhlciBhaGVhZCB0
aGUgMTAwbXMgd2luZG93IGV4cGlyaW5nLg0KDQpUaGlzIGFwcHJvYWNoIHNlZW1zIHJlYXNvbmFi
bGUgZm9yIG1lLCBidXQgdGhpcyB3b3VsZCByZXF1aXJlIGJpZw0KY2hhbmdlcyBpbiB2UENJIGxv
Z2ljLCBhcyBub3cgcGNpX2FkZF9kZXZpY2UoKSBuZWVkcyBhYmlsaXR5IHRvIGRlZmVyDQphbGwg
Y29uZmlnIHNwYWNlIGFjY2Vzc2VzIHRpbGwgVkZzIGFyZSByZWFkeSBhbmQgaW4gbWVhbnRpbWUg
d2UnbGwgaGF2ZQ0KdG8gZGVhbCB3aXRoIGhhbGYtaW5pdGlhbGl6ZWQgcGRldi4gUENJL3ZQQ0kg
bG9naWMgaXMgYWxyZWFkeSBjb252b2x1dGVkDQplbm91Z2ggYW5kIGFkZGluZyBtb3JlIGludGVy
bWVkaWF0ZSBzdGF0ZXMsIHdoaWNoIG5lZWQgdG8gYmUgZGVhbHQgd2l0aA0KaW4gZGlmZmVyZW50
IHBsYWNlcyB3aWxsIG1ha2UgdGhpbmdzIGV2ZW4gd29yc2UuIFVubGVzcyBJIG1pc3Mgc29tZSBl
YXN5DQpmaXgsIG9mIGNvdXJzZS4uLg0KDQpXaGF0IEkgYW0gdHJ5aW5nIHRvIHNheSBpcyB0aGF0
IHlvdXIgc3VnZ2VzdGlvbiBpcyB0ZWNobmljYWxseSBkb2FibGUsDQpidXQgcmVxdWlyZXMgbG90
cyBvZiB3b3JrLCBhbmQgd2UgZG9uJ3QgbmVlZCByZXNvdXJjZXMgZm9yIHRoaXMgcmlnaHQNCm5v
dy4gU28sIHdoYXQncyB5b3VyIG9waW5pb24gb24gZXhpc3RpbmcgYXBwcm9hY2g/IElzIHJlbHlp
bmcgb24gYQ0KZG9tYWluIHRvIGludHJvZHVjZSBWRnMgc3VjaCBhIGJhZCBpZGVhPw0KDQotLSAN
CldCUiwgVm9sb2R5bXly


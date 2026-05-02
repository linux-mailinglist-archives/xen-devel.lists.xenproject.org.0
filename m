Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hpxIDiGu9WnqNwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 02 May 2026 09:56:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9164B153B
	for <lists+xen-devel@lfdr.de>; Sat, 02 May 2026 09:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298999.1573891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJ5Bq-00066C-PR; Sat, 02 May 2026 07:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298999.1573891; Sat, 02 May 2026 07:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJ5Bq-00064v-MU; Sat, 02 May 2026 07:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1298999;
 Sat, 02 May 2026 07:55:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wJ5Bp-00064p-24
 for xen-devel@lists.xenproject.org; Sat, 02 May 2026 07:55:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJ5Bo-002yog-E6
 for xen-devel@lists.xenproject.org; Sat, 02 May 2026 09:55:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f5ad62-5cb7-0a2a0a5109dd-0a2a4502ea30-26
 for <xen-devel@lists.xenproject.org>; Sat, 02 May 2026 09:55:04 +0200
Received: from [52.101.69.108]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f5add7-af86-0a2a45020019-3465456c91ae-3
 for <xen-devel@lists.xenproject.org>; Sat, 02 May 2026 09:55:04 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PA1PR03MB10747.eurprd03.prod.outlook.com (2603:10a6:102:48f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 07:55:01 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 07:55:00 +0000
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
 b=QasLJ0sAVJX0yCdy/VJO2ju4NwtMZUZCwc5GCXB7gulxgdt21NWUpdyF5JoMJXor2E+wdYC/Py9oUgK6RJdG2+Zy++O6XudhWh2gHcBd7+I3Au9T8dLsqztZY3GNSzWzUJFwsCN1cdFMbtJShcamHGa9AouRYpq6w8L1MITA/vJtNPnasoF8J4JH6j8eCihDY8VaVAJxXlSbxPa9Wuk4H0YJEZ6OxCT5YJful/RlS+sa86/ZBSANvAc1lM7cb6Wni7ABe4oyOFqLQOohqsxAjJI+0Ee9f0E1z2eqGNZcR2jYhZj0/DCNUfmLb4eLL/4rpzXAiO9QofAWkSXJ7UXLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBMnCU8HRfN7uFjeSa0ezCfezBIqszeeqV7olHwkzbM=;
 b=NJpln+C/A8V2OTCFuWuRuNBxYnHqNWCM0yEPGypKf/hNLzSz2gSOAdemFZ78in3WoTlhmwUc5CWUUeInrqr8OWCoRCL3FVAUYnmw12nXwGpgpR3bJSY14t83WrEo681tiUvUBANnSIHY9g2nM/5hoG7mYb6ysvuvU3rI1zF/a9s5oeA3jhn1qoBaCVeGrrOQWg1zpoK5aYtAcKeCqn4nIYnyI5D/lmG6TFbDBsr4/bbDWd7WO9Fv4oq/+pcVL0oGKa2KZsDeCwkEkjP8YP5lPQDsISVx32ex6l9EbvNEtD6EMWfQJ/NWB1VxCP30/oEYSHCac0ba3eTWyuxts3et5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBMnCU8HRfN7uFjeSa0ezCfezBIqszeeqV7olHwkzbM=;
 b=IgJIo9AWhck6tAVcv8lybhJPaa/+jGCDdsTAi4VsgIAVA003F8kanasWq8IBG6IN8avc/Ivcq2c/39kIQptzsUUUw1W5qpWrsyzhCPTAG25Np3rcrvnNp3l978fXRMBmNpZ5TymYGKmqQ/Jk90pRsvoNZLt/R9UUofpCg+7d+jBXNp5TwS8WZWOQYl0b1DfYI8fFa4zR6/WOns2a/lwoPFDswBj5wnZ/DOYhdu0KRiozMioaMOXAeBtSmzmZamMig4a/h3K3BTQB1hLPRpad090mYftbdYt0Qldt27Aq1+OxZGxZRjb0IxZOgyPdKtdVFpLKgyVtGyINiT75mJmLHg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xsm/flask: Fix undefined behaviour in avc_dump_av()
Thread-Topic: [PATCH] xsm/flask: Fix undefined behaviour in avc_dump_av()
Thread-Index: AQHc2XU4ZcEAsUoy1EuhfVMBY8DBF7X5OliAgAEkr4A=
Date: Sat, 2 May 2026 07:55:00 +0000
Message-ID: <4c4745e3-14bf-49e5-aa35-a525ae42bab7@epam.com>
References:
 <43fc4b4ed45858b2cebbc37bbbf3b70e664a0661.1777642449.git.dmytro_prokopchuk1@epam.com>
 <beadc1e6-a98b-40e0-85f4-dffc7b2945b2@citrix.com>
In-Reply-To: <beadc1e6-a98b-40e0-85f4-dffc7b2945b2@citrix.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PA1PR03MB10747:EE_
x-ms-office365-filtering-correlation-id: e99bed8d-61d7-4de5-8d75-08dea8201cc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 n3Pz3veY1B5hpu47k0ukZEHvmxe8xP/Jug4/A39iHhoF5xNphZG3jvz9opsTFswX7Wk5MknjS5ZId/C+5eodj7/kXoIS16iwwBLOyonGBwIgVp5tk8uwbFkfGB8jfxitqec0UqdbgNMvy0BcBXKIzWZGtpjNUxHm8sPCLA4wk/fnJz9puPSFblTAosC4ZizDhVfcQduiOI4HBjzgFcfHf22O4W9Gup/tq4ZlxO6YE4hxYiIA0AR8KK8XRcw9K265Q75dzrvyRZdknjBr05RWuRr52uNlLQP4jOkyMT6fDcAZRVsraCVVyxxR0UkzP0sht7Sv3lCgtb77e5M7N6+fZRxPgsB4KmzsOln0P3ZEnc1nXZMi1m/TZ7NVqP8Md/MahFQV2zQfQHHq8ne9kWKY2URQslvbP4iMpZKMsNGbHIbcR6ts1KOMVmuQK88IbUSIhUsvVD/dA8pXrTKFCsE8TcoPlvDFR1yLTaPcmtvrlTr//hJbZmFkJMqkmJd+SAUhtXb72FoxtxJGb36RNOeLxpq4Xhf6/nfYtFDZm8i34SHo6tvZyzdOhd/fNhZ6zYiic9uZUByG0o/VFv4XGXOnT/hSdUKbNLzFynHCQlQWhgPkkhKU0UjDDP3N6t5hjHoSqV/qZ3154/2mPt5uNrfXzxGyM/Aw1/jcIl8Z8/KEOu0ea7YOEOUBIWqPG6LWgIXv4cafeUIYjs99T07QL0bk60ni08+sUinnNAu0KjxHvT0OZRA7VTQcNJcRlGhynVFZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajNQOHNJMmVZcXRSV3FJMXl1KzB6bUdDdnpHSDJmRVpCek5vcFdRbmhlS2Y5?=
 =?utf-8?B?MmRuWURFVklqY0RhSmU0dVVhRFJyT3ZxalR5dElBdGFmcDdnbDVDWElwRENu?=
 =?utf-8?B?VHdRRlBmN2tEcWJlazdHNlk2VTNvalBmM3l0OWhYQXdJMkZOM1Jyekk2cXZs?=
 =?utf-8?B?OUtJVGhDT1ZtNHRDQjFUMGRpRi9LYmFnY04yQ1ZSNU5QK0xkS1Y2RWJtc09P?=
 =?utf-8?B?dUhrbkNTSzlodmd6OEpuY01IaEszSWhnUTkwU1NsenZuT0F2UjR6RUZ6VldF?=
 =?utf-8?B?ZEZpUllaNnVud05QalVIVVVMM0M5QUVkVVlyWmhINndHTHJ0cFE4TGl2elpE?=
 =?utf-8?B?b2R4d1BQNURsSVB6aHMyZUdHdnFycGp6anBEbytwR3d5czlGTDBhOFUyZlg5?=
 =?utf-8?B?NUhkYjVHYVpQUFNvbGNQL1lOc1JYc0tjZjV2dHpYL0lBeVhVeFp0Z3U0V0ZH?=
 =?utf-8?B?YjVHRDlYUkNreWpQam9PbVNrSGZPTEJaRFprYWwxL2cwaDNwZXF1WDduY1Nn?=
 =?utf-8?B?ckErWkJMOG9lelFuenZtM1VKMHBSYk1ZK3ZrVjgrZ1JXOWE1TkZDaXI2dnFa?=
 =?utf-8?B?dmQzNWJaUmsycGFyNWtRbXJDYmI4aStHa0dIUHRVMEttTXRQQ291UUhYMnM0?=
 =?utf-8?B?eElWQWgzSklXSmR4QUlYVmx4dmlnWlA4SWZmelFoV0NwVEZmbE56ZDdwTGdL?=
 =?utf-8?B?UjRPa0JYSEc4Z0hVSWVyaUR2b1JiVENvYnM1Uk5XNTZsMVRDV3h5cHdPaitO?=
 =?utf-8?B?SU9GSWpORGtWK2k3WUpzaW1tVzlBRHdOMGpPbjgwSVlEZC9KL3NnbnJ4Y292?=
 =?utf-8?B?ZmptK2huV1JRSzNjUmhYTHBTSExMNDB6UmFkSCtNZjdVbE81eW9BU1JwemQ0?=
 =?utf-8?B?ZlArVzlnWnE0ZFI2WUQ4R3k0bDRXVmFOazlyRHlhNnBCOVpxd0JkUitmSFNR?=
 =?utf-8?B?Wnc5clVXYm9ZbFV4ODR0S3F3Wk1MeGVhc2R4K3gxZG9oSWdPRDQ0UHVtaGxu?=
 =?utf-8?B?MUtMT3A0QWl2eG1vaHNBZUQzTTVrUnNWRHZFK2x1Uk9BSElkS1hVSnM4OGNM?=
 =?utf-8?B?a3FUKy9lNmNOam5KclZTd21QeXE1OG1xeUp2YXBUSllOZWN3R3FJQjVnQnlU?=
 =?utf-8?B?Nk5DSy9qcStIemNpbmVCalJJSmFqVVptM1NIZVdBaEJCeG92UGhLUHJaeTBJ?=
 =?utf-8?B?Z2VRNFRkVGZkbmN1aG1JOE9BL0dzczFMell2NDF3b1JZU3BhYnpUWkRaZ3pk?=
 =?utf-8?B?Q3lwQVBrd2d0cTdyK0U1S0lDV1A1QmdKZzZwczVqREZQNXA3U2NWTHlaMXhL?=
 =?utf-8?B?WGx3UVRLamZ2RW5DdGFXTTVRc2FaR2p0RHZkV3Q1SU1RNUdlQzd6b1paU05V?=
 =?utf-8?B?V2tJZEpONTBGL1JOeloxaHVpMkNPQThhRzNVcDFGQUp4SHJSWkR3ZWdEbmhN?=
 =?utf-8?B?QkhZd3RjNWlHZVJuQVhmMGx1ZjVHR2tRMWR4dE5Kazdwa3kzTmdmSEl0Qi9E?=
 =?utf-8?B?MmlXMWFaMDltMU9UdTVtMVFKeCtGYUNFc3UvWXFLcFF4Qm1DSEtyS29hZGJC?=
 =?utf-8?B?dEQ1NHBoWEFHS1NSZWFqeDRkU095NUpaejF3RStGd2d3RHY0OUNDL3NyOFRp?=
 =?utf-8?B?dUxtUEtuWTNIL29BMW5sT0pOajRZZmx3aEVBTnVsdmFoY1dCZTNnYTZJM2Rq?=
 =?utf-8?B?UW12UTY2WnFudkFTUzg1d1lLdEpGNFNQR2RVSVdXT3diVzhvckgyNzdmUjUr?=
 =?utf-8?B?NnFxTk1HNFR2VWg4ZDh2R201TW9GQ0w5TkVTb3l6UVFBL0N3Tmg2bmNFelNC?=
 =?utf-8?B?ZjdQTGhwcUgyOHR2NmhMREpxY0tvd2F6dzRBVXZ6N0xMdllsaUFFNlRheUxW?=
 =?utf-8?B?Y0g0akJFbk53WDhVY2haWHczdmJMV0hlWlZtR09zbXQ0bDFoTmx1eHlqWlla?=
 =?utf-8?B?RlNPeVBSZTJDRTB1eU5KLzk4OWFlYlFhVEtua0FncU1TblVnU2FyeDNGdFZt?=
 =?utf-8?B?aldqc0EybTg3bjVBSG8wSThQc3VidGxjdys0MmJnblc5bmM1M3hvelRWRjgv?=
 =?utf-8?B?dXdEMzdmK3M5Z3Rac3d4dnhRTEJvYi96WGlVM2xCN1JzY0hxcDIzWDZ0RkUy?=
 =?utf-8?B?UnB2Q0QwTzNScXZpWlJ1Lzc0cWQ5RFBiWmlzMGg1TE5JN3hkRDVPT3pEUlMx?=
 =?utf-8?B?UCtRcUtsRnlkV1dkQzJEVE5LMndGRE1RcmdJVGtNdWcyQVNIdURTZVc1SnR2?=
 =?utf-8?B?d05yeEtYbWFJR3ZjVmlzbzdETmNzMFBUeGgrcG1LWW4rc2xrNUc1Ry9nWDdy?=
 =?utf-8?B?WDdwMzRyb3gxNVI2Q1c4N3F5dnZRSUZRVktaeVNPMjJnb0t1dU9MRVB1Zzdq?=
 =?utf-8?Q?xWXp9OUKTK4+L6YI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A2E6EF0AF91BF4CB165149D33C5DC20@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99bed8d-61d7-4de5-8d75-08dea8201cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2026 07:55:00.8015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5V2BpPqS3P+HPyMRXh018An48fYEpy3MxX/l9qhQFFPcnPEncpSKh15VUJYR/dp6Cibb8cQh/zTYYRarXxcgvdoXgbHCi7IyghR96TWYyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10747
X-purgate-ID: tlsNG-720697/1777708504-892CE161-5B59AB30/0/0
X-purgate-type: clean
X-purgate-size: 3030
X-Rspamd-Queue-Id: 7F9164B153B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

DQoNCk9uIDUvMS8yNiAxNzoyNywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDUvMjAy
NiAzOjE3IHBtLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBXaGVuIGJvb3RpbmcgWGVu
IHdpdGggQ09ORklHX1VTQkFOPXkgYW5kIENPTkZJR19YU01fRkxBU0s9eSwNCj4+IFVCU0FOIHJl
cG9ydHMgdW5kZWZpbmVkIGJlaGF2aW91ciBpbiBhdmNfZHVtcF9hdigpIGR1ZSB0byBhIGxlZnQN
Cj4+IHNoaWZ0IG9uIGEgc2lnbmVkIGludDoNCj4+DQo+PiAoWEVOKSBbICAgIDEuMTA0MzQ4XSA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gKFhFTikgWyAgICAxLjEwNTA5Nl0gVUJTQU46IFVu
ZGVmaW5lZCBiZWhhdmlvdXIgaW4geHNtL2ZsYXNrL2F2Yy5jOjE4NDoxNA0KPj4gKFhFTikgWyAg
ICAxLjEwNjA1Ml0gbGVmdCBzaGlmdCBvZiAxMDczNzQxODI0IGJ5IDEgcGxhY2VzIGNhbm5vdCBi
ZSByZXByZXNlbnRlZCBpbiB0eXBlICdpbnQnDQo+PiAoWEVOKSBbICAgIDEuMTA3NTQ2XSBYZW4g
V0FSTiBhdCBjb21tb24vdWJzYW4vdWJzYW4uYzoxNzYNCj4+IChYRU4pIFsgICAgMS4xMDgyOTVd
IC0tLS1bIFhlbi00LjIxLjEgIGFybTY0ICBkZWJ1Zz15IHVic2FuPXkgIE5vdCB0YWludGVkIF0t
LS0tDQo+PiAoWEVOKSBbICAgIDEuMTA4ODQ4XSBDUFU6ICAgIDANCj4+IChYRU4pIFsgICAgMS4x
MDkxNDddIFBDOiAgICAgMDAwMDBhMDAwMDJmNjRmYyB1YnNhbi5jI3Vic2FuX2VwaWxvZ3VlKzB4
MTAvMHhkNA0KPj4gWy4uLl0NCj4+IChYRU4pIFsgICAgMS4xNDYzMjBdIFhlbiBjYWxsIHRyYWNl
Og0KPj4gKFhFTikgWyAgICAxLjE0NjY2M10gICAgWzwwMDAwMGEwMDAwMmY2NGZjPl0gdWJzYW4u
YyN1YnNhbl9lcGlsb2d1ZSsweDEwLzB4ZDQgKFBDKQ0KPj4gKFhFTikgWyAgICAxLjE0NzIyN10g
ICAgWzwwMDAwMGEwMDAwMmY3YmM0Pl0gX191YnNhbl9oYW5kbGVfc2hpZnRfb3V0X29mX2JvdW5k
cysweDFhMC8weDI5MCAoTFIpDQo+PiAoWEVOKSBbICAgIDEuMTQ3ODY4XQ0KPj4gKFhFTikgWyAg
ICAxLjE0ODE3N10gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+DQo+PiBUaGlzIGNhbiBiZSBz
b2x2ZWQgYnkgbWFraW5nICdwZXJtJyBhbiB1bnNpZ25lZCAzMi1iaXQgdHlwZSAodTMyKS4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsx
QGVwYW0uY29tPg0KPj4gLS0tDQo+PiBUZXN0IENJIHBpcGVsaW5lOg0KPj4gaHR0cHM6Ly9naXRs
YWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9kaW1hcHJrcDRrL3hlbi8tL3BpcGVsaW5lcy8yNDkz
NjQ5MTA5DQo+PiAtLS0NCj4+ICAgeGVuL3hzbS9mbGFzay9hdmMuYyB8IDMgKystDQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEveGVuL3hzbS9mbGFzay9hdmMuYyBiL3hlbi94c20vZmxhc2svYXZjLmMNCj4+IGlu
ZGV4IDNkMzllNTVjYWUuLjljM2ZmZGMwNzAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4veHNtL2ZsYXNr
L2F2Yy5jDQo+PiArKysgYi94ZW4veHNtL2ZsYXNrL2F2Yy5jDQo+PiBAQCAtMTUyLDcgKzE1Miw4
IEBAIHN0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18gKChmb3JtYXQgKHByaW50ZiwgMiwgMykpKQ0K
Pj4gICAgKi8NCj4+ICAgc3RhdGljIHZvaWQgYXZjX2R1bXBfYXYoc3RydWN0IGF2Y19kdW1wX2J1
ZiAqYnVmLCB1MTYgdGNsYXNzLCB1MzIgYXYpDQo+PiAgIHsNCj4+IC0gICAgaW50IGksIGkyLCBw
ZXJtOw0KPj4gKyAgICBpbnQgaSwgaTI7DQo+PiArICAgIHUzMiBwZXJtOw0KPj4NCj4+ICAgICAg
IGlmICggYXYgPT0gMCApDQo+PiAgICAgICB7DQo+DQo+IFRoZSBmaXggaXMgZmluZSwgYnV0IHdh
bnRzIHRvIGJlIHVpbnQzMl90LiAgKFRoZSBleGlzdGluZyBjb2RlIGlzDQo+IGFscmVhZHkgaW5j
b25zaXN0ZW50LCBhbmQgd2FudHMgZml4aW5nIHVwIHRvd2FyZHMgWGVuJ3MgcHJlZmVycmVkIHN0
eWxlLikNCj4NCj4gQ2FuIGJlIGZpeGVkIG9uIGNvbW1pdC4NCj4NCj4gfkFuZHJldw0KDQpIZWxs
bywNCg0KSSdtIGZpbmUgd2l0aCB0aGF0Lg0KDQpUaGFua3MsIERteXRyby4NCg==


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOvZLFzK6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:17:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DCA446995
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290515.1570084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXRQ-00060i-EM; Wed, 22 Apr 2026 13:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290515.1570084; Wed, 22 Apr 2026 13:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXRQ-0005xk-BL; Wed, 22 Apr 2026 13:16:32 +0000
Received: by outflank-mailman (input) for mailman id 1290515;
 Wed, 22 Apr 2026 13:16:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wFXRO-0005xe-D6
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:16:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXRN-00Fwo2-K4
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:16:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e8ca25-2eae-0a2a0a5409dd-0a2a4507ec60-48
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:16:29 +0200
Received: from [52.101.62.51]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e8ca2b-229c-0a2a45070019-34653e33a038-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:16:29 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by PH7PR03MB7512.namprd03.prod.outlook.com (2603:10b6:510:2ea::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 13:16:25 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 13:16:25 +0000
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
 b=TITNnOKI5BiWYZPELQm4sA5xSYh0FHrFDMnZFSmwWc+cnIEbQ9Fd/jd0lT2EZWJ//oT0fFFApl7S98yXJJ1QXsyYnAfPQ0kktpArLDNGBBhxb56dmmSfI0Looz/u0UQRKOn4sQqijOoyZnVMCfVB4R1OAeMlUUiF8QdUhab+bP2le6YX4My9cUgiJVzdy4IhPreH7Seu/4vyFP6lDzICX/1/A/jnsKXuo3ltNsbaapRsMunbg2gmIsVTrRH2pcwbKh6yKIIqPnCCOE7kYtR3KETWearyn0fwjizj0/iRtRI6OpC8XQQGHuv2IMe25xkwnp70Wp1bcd0e+7utSMDP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPKHL7ulMU68IHF/Gjux5C7Qbow/sNHcRqxsgC/+gKU=;
 b=L6uA3/G1hYACECaxK6Ipalof2x+GWapnzFbmBiwPbPcY+MPJPmmHF6A0vAEIN4EwlDP4JJ2na5qpcWERaQv46UvzFbFatUauam0DrVEqlNJ3QBSvLtNdAvJX1fGQaPoxow7JDoJfXLCjJtlJhZfAA9UlQUda74CQ2lc99i3Zzup+DIalzTpkERlurdkBXHgyj1NkSkrZV42OpGav8iSbz6PZPhr3RLvIit5MDgl1TZHIQ1Eg4+x9alutAgy320RbXOm2X72DcEIZ4MScphTFbHnnLS20lskEkMyNOXZkTN0nmftmyDRAwcyh4NyqN8dfb5BRwXeMkCBieTQdM325Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPKHL7ulMU68IHF/Gjux5C7Qbow/sNHcRqxsgC/+gKU=;
 b=FvOpQlsUL0JJPIsSozdxS5Fu9mfOTXIyepEjurLabzI0TO2YBxdkOAEtjcIZxb7TL6+UiuJhKXAqAkit+JwS6URaWSUYxROPAWmZQiiRmLOl0VazPwXV4yvN9rP0xMQynwMuMLO3UiMuitDrKvnfZStyRGh61E9Z6hUtzDRDLAk=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper@citrix.com>
CC: Marek Marczykowski <marmarek@invisiblethingslab.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] EFI: adjust cfg file buffer freeing
Thread-Topic: [PATCH] EFI: adjust cfg file buffer freeing
Thread-Index: AQHc0k5cFvUCG2dzRUObAr32ScQca7Xq+lCAgAAC34CAAAA1oA==
Date: Wed, 22 Apr 2026 13:16:24 +0000
Message-ID:
 <LV3PR03MB7707D62ACB8254123F4CB136872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
 <77234acb-4539-4efe-9c30-03cb7a389912@citrix.com>
 <f91fae0b-7d3b-4ca6-a5ed-72de50daee9c@suse.com>
In-Reply-To: <f91fae0b-7d3b-4ca6-a5ed-72de50daee9c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|PH7PR03MB7512:EE_
x-ms-office365-filtering-correlation-id: fd463b03-218f-460b-9c02-08dea0715af5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003|17002099007;
x-microsoft-antispam-message-info:
 Rk0ECydanqcW/7ACbeBGfUQ0yfR1uWJtQ3E6UMHY2H5ZmYXOfV6kQzIhn9yE/hqUSmN4nSR6MSmK4aumqX7BIpRQtFI/yvfT/Btz7muNIBAH0Ol1XrDHf/LkjhGuR6t47DKBcw8+UBW6p+4hYMBF35NKeqr8iWQQmWP/RnqhPnWBZmR3TS2IPAApoA9QARmWZNFKqw/W3/f4PvtrD2r8UMtx8gqLVRTeUGgF9kMViiCWYJ/JiUIotU8lNfvTgkTcGwUoWnueHpcZQ7QCx3FS62bgHu0QxwU864ZUXDNbAEc4I+4Z7lvHnNLkatCDL+iD6+OCmIT5YFCS8GQwtCg4zh5sKKlslaJNP3+9CyrTwi6SozFyUq65oNvK/4pxSNv2ETPHShxFWmxXi2SVT+1SiSM+TOC0yjNQc1f9OZHffRsNjphvW2UDcucQaSe/tVyZz2jnL2vk6w2xfUn3OMrkN5bZ4Ik2tc2jWYYptzg4S3umyOF4jLdap2X1V7P3xbmJ/vgFDAuWSYVIQgMcaaNLvtSjIRkhe6R6Upt1W9WItEtlUQnuceQ71hVdAhJcv0yiMCGaQLv9xeEaTY/5LiTo4tMc5/LCaIChUQZSVoEglJqFM84K/AdWIA6A5+BjBIx3SFh7DRYEKhBjWLFpFOUm8/avWAI6WFhNbT65DV7cRkNW4xk+H3Gw0QcwzQPGd23OBAAah0hqZux9cCM5L5dWOyRzvz5tvddyZVzR3JxZe2zJAIMfQ/SSnf4t48iLysRR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003)(17002099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmplZisrbjA5clJkYVhqN3o1SGVDYVRsLzFvbXlDei93RXVLZENjcmVJRHd3?=
 =?utf-8?B?QVc3cTNnVjVDRDl6K2JQWGlPdDJ5OTkxWjRPSU9XMG1ua3RsL1dTSmFVTjhD?=
 =?utf-8?B?c1hyRFNVbk9TOUVCQzJoSDNPczltc1hwUVNVcEp6Zk9mMFpReFJsZWpxZ3Vt?=
 =?utf-8?B?bUZHZGhMRU02d3EvL3k1YUpRM0k1bURQNklGZWFFaDk0Q1Voa2ZTeTdyNzJG?=
 =?utf-8?B?SElaVGl3WVBjaURncjNWWEZRcHRkaWZPU2dQTUlVQ0lEY0J3ZmljM0JwSHc4?=
 =?utf-8?B?dSsvazZua0JUL3Y4Y1hzQ3VkTndjd3QvM04rUjd6eVBFTEZ4SUJGbENOdWNK?=
 =?utf-8?B?bjgzMlJsMWxWZndZNGRmMnRWNzZlNzdicXU3b0M3ZmJXd21kRlBHNWp0WW1u?=
 =?utf-8?B?Q0V2MFFLMk5IRWc0cmg4azZybmZCNmxVZWF0c0JydndZSXZ1L2RuS2xtK3hX?=
 =?utf-8?B?cXVVaEx6QnF5N3o0dHM5RmhEZXlBellicHAwVEJVWEJWNkFmbStLRVlTYjR4?=
 =?utf-8?B?Szd0NjdQcWUzb3VjT2pzU0dhK0JHTm9uRDZ5emUwd3E2SDJwUy9LaGhDRUsy?=
 =?utf-8?B?STZmMW40UVZXZER3bUJoV3RnQWV3VEo1TFdSRnNuRUY5TUxoTWx5eUYvWlFU?=
 =?utf-8?B?aVNVdmk3TmMwQ053Nmx1eFErR3p4SGIvM2VuZVZ6alZPY21iOVZramdGb0tX?=
 =?utf-8?B?TGZEQUlPYlNlWkJFRDFpZld1MjRPdmxFc2pheE1DSm5sT3JmM0tQM3BDNzZC?=
 =?utf-8?B?amxZSWUzRHdlMisrYldPcTlmUGJUSmhsTDhnVDY3TVBaTjVqSUlrRW4zU2ZF?=
 =?utf-8?B?OThLWXo4WXhNL0V2NitvazNlQnZpRjdDd0dxWCtEd2U0SWFLUUNRSkt0NE1l?=
 =?utf-8?B?b2VFNVZ5UE9mZktKUjZMQzVzYTBPWVhaR3lDY2trb1JlVGhFWkxWNUhmb0Qx?=
 =?utf-8?B?QWxwSXZ3QVcyRThWZDlXU3N3SEtDVmZ4MUpwdFNveHRNWGlpUXp5NWoyR2pI?=
 =?utf-8?B?THI3RjdpYmpaSDF0ZmdRaE1CcDJlMkdHSjJKOEtjZW5FMjRtR1FZUkRqUDIv?=
 =?utf-8?B?aE5QRUJWSHlmbG9sK1RSaGxvUFpuRGJkMTJvZU5uNTNFQTdoeC9Pa1NvdU1p?=
 =?utf-8?B?WFp3ME40dkIzNEJUaWJqTk1uSkhYbDhiZjV2cWQza3l4T3pidmpEWjk5TWtX?=
 =?utf-8?B?dndUMG5WL0NiOGpqVzRNYzB4ckEwdTltK09rNm1DVUplZys5andPcEdWWkNo?=
 =?utf-8?B?RUE0NStKRkxaOHZzQ2FVclVMTFdESGpQUHNVYnN1QjFkS3kyalNYanRManMw?=
 =?utf-8?B?OWp4K1Y1U2VBUkVjemZVdUE1K1FZSHlvQXltWDByYWlzYWhuSnMzTGthQTQ2?=
 =?utf-8?B?c0E4SG1IaXdRL3RWdGhXNkw1MVMvYmJwZHhYaE9IbWdDNVJIN2tSd3Z0a3Y2?=
 =?utf-8?B?Tmc4QTFQYm1nbjJlZDVKM2RoMEo2d2FJeHd3Y08vZnVvRldPVThKVGV5OWFw?=
 =?utf-8?B?QStqQzR3VE5nSjBvSkYvWHVmN3NXUCthOGIvOXpjYnlPeWI3ajduQm9CSHRX?=
 =?utf-8?B?bE9SQWVnQ0puRm8yVzhjSlduSnBpVENMdGxmNW9oTkJLc2xQd1gxZk8yenA0?=
 =?utf-8?B?eHFnMFdDdFh4NGFxZXNsT2Vhc3ZZVWFCV05xd2piR1pzaFAwaktHMm5ZbUFS?=
 =?utf-8?B?cWdWRE9NRW5Hd01pSG4wMlA3b0R3Wi9wcjJWY21TWDhzbjQyR3ptWHNRWFRh?=
 =?utf-8?B?R2U1dDlTcG1GWC81SkFwbENuelFzMU1rbGRWb01BNmlNT0lSUm1sVVV3Tzc4?=
 =?utf-8?B?R25KdHZtZFVCdzZTTUxBQWUwSmZ5dnZteTM2VTVNWlNOSWxwTjFiV0VRdytx?=
 =?utf-8?B?V2NHQ3JwOVdIWU04dzh1VG5NeU9NRkYrVkZmWXFtSCtaTE1zVThmbnc2dE1P?=
 =?utf-8?B?YlJTcUdVZ3dURUdoYVpYRkNrSkdFb2pyOWdEZXlDNldGWUVrTmNmQ1VmRFpn?=
 =?utf-8?B?cERGYmFGQ3BOMWlXN1pLbnpSMy9mT2pWQmJaODZZK21NTmNIZXFyUDk3MEJm?=
 =?utf-8?B?cVR2QVJCRXV5akJBd0RQbXluRUFZeDdjMXZFWHJMUHdXWE9LSmNUT3kvQ3NN?=
 =?utf-8?B?aEhMRm04citQQ2JpblFCaTNMSkRJTCtnNWRZeHNFUlRNWllIN3RMUXdhdGdu?=
 =?utf-8?B?OXBTN05ySEpuYkVpTWVTZlZiM0RvVFJ1OGp0NTRxZ2tEZWJnZ0Rmd1hHajEz?=
 =?utf-8?B?REhDZzE2djRiOWQrL1lUTTk3MkF3eVdMMFMrbG5OaG9jWWxTd3NqWDZFN2tr?=
 =?utf-8?B?RitkNE5jMUhxK25ZWGFtek5Cbys0bGYweWlqRCtEOG8yMXFMQmFaOE1SOFUw?=
 =?utf-8?Q?eplRSByJi4sPW79hmVolI8SWiN/ShCfBDmbHEWHRNm+co?=
x-ms-exchange-antispam-messagedata-1: UX+0HFRg8tF7EQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd463b03-218f-460b-9c02-08dea0715af5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 13:16:24.9781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JenjTtB3oVYQ9GB/HeFQPVZ1KHUNcfvC57woPJzUD3Jq+oPekmJOzhzp8/B8lYtkPb15aHOH5TnxJ2Sq9rsOduUofOPv5EVaSclJ7JDRWw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7512
X-purgate-ID: tlsNG-ef75cf/1776863789-ADD6FC48-64EF9196/0/0
X-purgate-type: clean
X-purgate-size: 5728
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.098];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 16DCA446995
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjA0LjIwMjYgMTM6NTksIEFuZHJldyBDb29wZXIg
d3JvdGU6DQo+ID4gT24gMjIvMDQvMjAyNiAxMjo1MSBwbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
ID4+IFRoZSBib290IHNlcnZpY2VzIEZyZWVQYWdlcygpIG5lZWRzIHBhc3NpbmcgdGhlIHNpemUu
IFNpbmNlIHdlIGFsbG9jYXRlZA0KPiA+PiBvbmUgbW9yZSBieXRlIHRvIHB1dCBhIHRyYWlsaW5n
IG51bCB0aGVyZSwgd2UgYWxzbyBuZWVkIHRvIGJ1bXAgdGhlIHNpemUNCj4gPj4gcGFzc2VkIHRo
ZXJlLiBNYWtlIGEgc21hbGwgaGVscGVyIGZ1bmN0aW9uIHRvIGNlbnRyYWxpemUgdGhpcy4NCj4g
Pj4NCj4gPj4gTm90ZSB0aGF0IHRoZXJlJ3Mgbm8gcGVybWFuZW50IG1lbW9yeSBsZWFrIGJlY2F1
c2Ugb2YgdGhlIG92ZXJzaWdodDogVGhlDQo+ID4+IGFsbG9jYXRpb24gaXMgZG9uZSB1c2luZyBF
ZmlMb2FkZXJEYXRhLCBhbmQgYWxsIG1lbW9yeSBvZiB0aGF0IHR5cGUgaXMNCj4gPj4gbGF0ZXIg
cmVjbGFpbWVkIGFueXdheS4NCj4gPg0KPiA+IFRoaXMgZGVwZW5kcyBvbiAtbWFwYnMgYXQgYSBt
aW5pbXVtLg0KDQpUaGlzIG1lbW9yeSBpcyBhbGxvY2F0ZWQgYWxsb2NhdGVkIHVzaW5nIEVmaUxv
YWRlckRhdGEgYW5kICdtYXBfYnMnIGlzIGZvcg0KRWZpQm9vdFNlcnZpY2VzQ29kZSBhbmQgRGF0
YSwgc28gYXQgbGVhc3QgdGhpcyBjYXNlIGRvZXMgbm90IGFwcGx5IHRvIGl0Og0KDQogICAgICAg
IGNhc2UgRWZpQm9vdFNlcnZpY2VzQ29kZToNCiAgICAgICAgY2FzZSBFZmlCb290U2VydmljZXNE
YXRhOg0KICAgICAgICAgICAgaWYgKCBtYXBfYnMgKQ0KICAgICAgICAgICAgew0KICAgICAgICAg
ICAgICAgIHR5cGUgPSBFODIwX1JFU0VSVkVEOw0KICAgICAgICAgICAgICAgIGJyZWFrOw0KICAg
ICAgICAgICAgfQ0KDQo+IEJ1dCB0aGF0J3MgYWZmZWN0aW5nIG9ubHkgRWZpQm9vdFNlcnZpY2Vz
e0NvZGUsRGF0YX0sIGlzbid0IGl0Pw0KDQpBcyBhbGxvY2F0ZWQgdXNpbmcgRWZpTG9hZGVyRGF0
YSwgYWZ0ZXIgRXhpdEJvb3RTZXJ2aWNlcywgaXQgd2lsbCBzaG93IHVwDQphcyBFZmlMb2FkZXJE
YXRhLCBhbmQgd2lsbCBiZSBwcm9jZXNzZWQgd2hlbiBpdGVyYXRpbmcgb3ZlciB0aGUgbWVtb3J5
DQphcmVhcyBkdXJpbmcgYm9vdC4NCg0KT24geDg2LCBYZW4gdXNlcyBlZmlfYXJjaF9wcm9jZXNz
X21lbW9yeV9tYXAoKSBmb3IgdGhpcywgd2hpY2ggaGFuZGxlcyBpdA0KbGlrZSBFZmlDb252ZW50
aW9uYWxNZW1vcnksIHdoZXJlLCBpZiBpdCBoYXMgZGVzYy0+QXR0cmlidXRlICYgRUZJX01FTU9S
WV9XQiwNCih3aGljaCBpdCBzaG91bGQgYmUgYXMgaXQgaXMgcmVndWxhciBSQU0pIGl0IGlzIHNl
dCB0byB0eXBlIEU4MjBfUkFNIGJ5IFhlbi4NCg0KVW5sZXNzIG1lcmdlZCB3aXRoIGFkamFjZW50
IGFyZWFzIGl0IHdvdWxkIHNob3cgaW4gdGhlIEU4MjAgbWFwIGFzIFJBTS4NCkFGQUlDUywgaXQg
d291bGQgYmUgcmVjbGFpbWVkIGJ5IFhlbi94ODYgdGhpcyB3YXkuIE9uIEFSTSwgRWZpTG9hZGVy
RGF0YQ0KaXMgYWRkZWQgdXNpbmcgbWVtaW5mb19hZGRfYmFuaygpLCBzbyBpdCB3b3VsZCBiZSBh
ZGRlZCBhcyBhIG1lbW9yeSBiYW5rLg0KDQo+ID4+IEZpeGVzOiBkZjc1Zjc3MDkyYzEgKCJFRkk6
IGF2b2lkIE9PQiBjb25maWcgZmlsZSByZWFkcyIpDQo+ID4+IFJlcG9ydGVkLWJ5OiBCZXJuaGFy
ZCBLYWluZGwgPGJlcm5oYXJkLmthaW5kbEBjaXRyaXguY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IC0tLQ0KPiA+PiBUaGlzIGlz
IGFuIGFsdGVybmF0aXZlIHByb3Bvc2FsIHRvDQo+ID4+IGh0dHBzOi8vbGlzdHMueGVuLm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDI2LTA0L21zZzAxMDQ0Lmh0bWwuDQo+ID4NCj4gPiBP
bmUgdGhpbmcgdGhpcyBwYXRjaCBkb2VzIG5vdCBkbyBpcyBmaXggdGhlIGJvdW5kYXJ5IHBhc3Nl
ZCB0bw0KPiA+IGVmaV9hcmNoX2ZsdXNoX2RjYWNoZV9hcmVhKCkuDQo+IA0KPiBEZWxpYmVyYXRl
bHkgc28sIGFuZCBJIGNvbW1lbnRlZCB0byB0aGlzIGVmZmVjdCBpbiByZXBseSB0byBCZXJuaGFy
ZCdzDQo+IHBhdGNoLiBJIGRvIHRoaW5rIC4uLg0KPiANCj4gPiBJIGZpbmQgaXQgaGFyZCB0byBi
ZWxpZXZlIHRoYXQgY2FjaGUgbWFpbnRlbmFuY2UgaXMgYWN0dWFsbHkgbmVlZGVkLCBidXQNCj4g
PiBnaXZlbiBpdCBpcyBwcmVzZW50IGluIHRoZSBjb2RlIGN1cnJlbnRseSBpdCBuZWVkcyB0byBz
dGF5IGNvcnJlY3QuDQo+ID4NCj4gPiBPciwgaWYgaXQncyBub3QgbmVlZGVkLCBpdCBzaG91bGQg
YmUgZHJvcHBlZCBpbiBhIHNlcGFyYXRlIHBhdGNoLg0KPiANCj4gLi4uIHRoaXMgaXMgdGhlIHdh
eSB0byBnbywgYnV0IGl0J2xsIG5lZWQgaW5wdXQgZnJvbSBBcm0gZm9sa3MgKGFzDQo+IHJlcXVl
c3RlZCB0aGVyZSkuDQoNCklmIGluIGRvdWJ0LCB5b3UgbWF5IGNvbnN1bHQgdGhlIGdpdHdlYiBz
ZWFyY2ggKHNlZSBiZWxvdykgZm9yIHRoZSBmdW5jdGlvbg0KYW5kIHRha2UgdGhlIHNhZmUgcm91
dGUgb2Ygbm90IHJlbW92aW5nIGl0Lg0KDQpGbHVzaGluZyB0aGUgZGNhY2hlIG1heSBhbHNvIGJl
IG5lZWRlZCBvbiBDUFVzIHdpdGggYSBzcGxpdCBEL0ktY2FjaGUgYW5kDQp3aGVuIHVzaW5nIHNw
ZWNpYWwgY29kZSBvciBIVyBvbiB0aGUgU29DIG9yIGJvYXJkKGUuZy4gYSBETUEgZW5naW5lKSBv
cg0Kc29tZXRoaW5nIGVsc2UgZXh0ZXJuYWwgdG8gdGhlIGRjYWNoZSB0byBhY2Nlc3MgdGhlIGxv
YWRlZCBkYXRhLg0KDQpPcmRlcmluZyBlZmlfYXJjaF9mbHVzaF9kY2FjaGVfYXJlYSgpIGJlZm9y
ZSByZS1kaXJ0eWluZyB0aGUgZGNhY2hlIGxvb2tzDQpjb3VudGVyLWludHVpdGl2ZSB3aGljaCBp
cyB3aHkgSSB1cGRhdGVkIHRoZSBvcmRlciB0byBtYXRjaCB0aGUgbG9naWNhbCBmbG93DQpvZiBm
bHVzaGluZyB0aGUgZGNhY2hlIGFmdGVyIHRoZSBsYXN0IGNoYW5nZS4NCg0KUGVyIHRoZSBnaXQg
aGlzdG9yeSAoc2VlIGJlbG93KSwgaXQgd2FzIG5lZWRlZCBmb3IgY29weV9mcm9tX3BhZGRyKCkg
b24gQVJNLg0KDQpZb3UgbWlnaHQgc2tpcCBmaXhpbmcgdXAgdGhlIGNhY2hlIGZsdXNoaW5nIG9y
ZGVyLiBJdCB3YXMganVzdCBhICJ3aGlsZSBhdCBpdCINCnRvIGJlIHNhZmUuDQoNCkFzIHdlIGRv
bid0IHVzZSBjb3B5X2Zyb21fcGFkZHIoKSBvciBzaW1pbGFyIHRvIHJlYWQgb3IgY29weSB0aGUg
Y29uZmlnLiBIb3dldmVyLA0KaWYgY29weV9mcm9tX3BhZGRyKCkgd291bGQgYmUgdXNlZCBmb3Ig
dGhlIGNvbmZpZywgYXQgdGhpcyBwb2ludCwgdGhlIGRjYWNoZQ0KZmx1c2ggd291bGQgYmUgYSBm
YWN0b3IgdG8gYmUgZG9uZSByaWdodCAoYWNjb3JkaW5nIHRvIHRoZSBnaXQgaGlzdG9yeSkuDQoN
Ck1vdmluZyB0aGUgdHdvIGNhbGxzIHRvIEZyZWVQYWdlcygpIGZvciBjZmcgaXMgYSBnb29kIGNs
ZWFudXAgZm9yIG1lLCBzbzoNCg0KUmV2aWV3ZWQtYnk6IEJlcm5oYXJkIEthaW5kbCA8YmVybmhh
cmQua2FpbmRsQGNpdHJpeC5jb20+DQoNCkJlcm5oYXJkDQoNClBTOiBHaXR3ZWIgZmluZHMgdGhp
cyBjb21taXQgZm9yIGFkZGluZyB0aGUgZnVuY3Rpb246DQoNCmh0dHBzOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0O2g9MGQ2YTNjNzU1Mzc0ZjA0ZjZkZDI1Mzcz
ZGEyODI5MWE4ZjM1YmVkZQ0KDQplZmk6IGludHJvZHVjZSBlZmlfYXJjaF9mbHVzaF9kY2FjaGVf
YXJlYQ0KDQpPYmplY3RzIGxvYWRlZCBieSBGaWxlSGFuZGxlLT5SZWFkIG5lZWQgdG8gYmUgZmx1
c2hlZCBmcm9tIGRjYWNoZSwNCm90aGVyd2lzZSBjb3B5X2Zyb21fcGFkZHIgd2lsbCByZWFkIHN0
YWxlIGRhdGEgd2hlbiBjb3B5aW5nIHRoZSBrZXJuZWwsDQpjYXVzaW5nIGEgZmFpbHVyZSB0byBi
b290Lg0KDQpJbnRyb2R1Y2UgZWZpX2FyY2hfZmx1c2hfZGNhY2hlX2FyZWEgYW5kIGNhbGwgaXQg
ZnJvbSByZWFkX2ZpbGUuDQoNClRoaXMgY29tbWl0IGludHJvZHVjZXMgbm8gZnVuY3Rpb25hbCBj
aGFuZ2VzIG9uIHg4Ni4NCg0KUmVwb3J0ZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5k
QGFybS5jb20+DQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3Rh
YmVsbGluaUBldS5jaXRyaXguY29tPg0K


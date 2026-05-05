Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGvvIv8s+mlXKgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 19:46:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EBD4D2484
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 19:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300910.1575341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKJq1-0001rI-Vd; Tue, 05 May 2026 17:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300910.1575341; Tue, 05 May 2026 17:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKJq1-0001oq-Sn; Tue, 05 May 2026 17:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1300910;
 Tue, 05 May 2026 17:45:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wKJq1-0001ok-0L
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 17:45:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKJpz-006oAy-Ua
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 19:45:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa2ca7-bab6-0a2a0a5309dd-0a2a450ad224-36
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 19:45:39 +0200
Received: from [52.101.201.52]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa2cc1-56b3-0a2a450a0019-3465c934dedf-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 19:45:39 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by CO1PR03MB7841.namprd03.prod.outlook.com (2603:10b6:303:270::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 17:45:32 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 17:45:32 +0000
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
 b=S0BcjmfDCr0KmNIeoulI7RSPCNK9DBwKOWT6sKskgSQawlR8NhF6V4lrKNhC8Dugj66s4oOVPBiZQPnlSBSxUVgf/MWswzixMp+oiKhy717FbLF+GY5bTxUdRvfEOyZZtkSSuVvKbnbsOeLyurqFZxX/Q5JsG6f+NHdBPtjOsdvYvvmk2qfpRSCYXTDckBmztm6QgD57q0Fqd1NvLHOyKcCCdiqkDKtJfOZA45TIPmNeQou6q/y8um1gJL9kSCYVQl5KmfFFhonxHB43V7kYcEmiXFjdDLmqmCWJbHDGyCQjzSPpZnFo0fNolHmY6mdEeCBOXbsX2PLaWxY4ZqgjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEYMRP1h00mv2smG9vlcxtBuew6OyHcm7haVlj3O0C4=;
 b=BfAlBnbo9jVpdTQXUBcGGECEif6giVzSyb22LowOtYD7T8zWe/ImpzE5jd+IBrmxipAbR7r45N/Xwcc9AaFY3pH7W2wGz9tTQih0KYvxZe6DGqKuP1CHlK7Cfqrq6qxVb2hotgo18VwrMG+Wy0vAb1AdIleaMoB+rzfiNS9eEyXp/2f+bELiEi/PzWOMNeDac80UgcPN7DBs3N6LEASFv97v0boqJY1VYk78/JH78NFu/f+oSaMhs+ZddcjIfXqydQcnNX1e14DyTlUl/iasjIJDha0ql1q9Vwgjx2x/vTbXmjI4quzXS1soFC81QER9h34rOfH7SSxQmfKyoiZ6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEYMRP1h00mv2smG9vlcxtBuew6OyHcm7haVlj3O0C4=;
 b=QgtaLrTQ4xTY7eo48fDqaDuV+n7CtvjjNqr/h9TaUpvYcti+7YYVZyLkDMLe1eTT/ki9QkIJ2eCs4NJoQX5fnOn8dfgsvleUxgNIY3iGm7nn4V4MmBIAGlpcybeRWxy0EBVCCimRoACD2AotuT9rzBXVvciB0eqwoiq0CSRiJnU=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/1] xen/mm: normalize page count types to unsigned long
Thread-Topic: [PATCH 1/1] xen/mm: normalize page count types to unsigned long
Thread-Index: AQHc0m21xf3mZmlgYkSU6AzufCg/frX95EKAgAHUE0A=
Date: Tue, 5 May 2026 17:45:31 +0000
Message-ID:
 <LV3PR03MB7707477D453FE4B06F3AA470873E2@LV3PR03MB7707.namprd03.prod.outlook.com>
References:
 <6fd2be46d934688b19b5c84c53c745230cd345d6.1776871968.git.bernhard.kaindl@citrix.com>
 <5109e43f-168a-4522-ac24-bd334df129e0@suse.com>
In-Reply-To: <5109e43f-168a-4522-ac24-bd334df129e0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|CO1PR03MB7841:EE_
x-ms-office365-filtering-correlation-id: 1f7e99c9-9916-4173-057b-08deaace1aa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|18002099003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 h8oLhfKudZR9JhGutTzp7scu0LIConGBJg0row4hDF05Se+tA331iRyG13RePEPnd9qfEjXtjSR1nfRSsTc2tBbI84gNRMaFk7Jfdcoty6KoltGvpg44o3fSmNchwMt0NjK8fVKfzItUWtyIEMk0MfB2SUpvaVQnfI27cv/cOtsMAd+8kks7XqXxn3cJc7LhbrF9r5YgnQ6ksqNLF+ZlwdEFoyC6pznsvC64pDX+pYJ5uJfwA8f1Ylr1xpVy+HFlsEzTsiEOcjg5kFBWKcAlJz2C9PATls4HzXehHYNIo6t1uvHNsFk5y9v9+oiz1k+X1nsqA33Ebr5T6cAEEi/e+Ppt7GbZXuKH1HmFIl1Y+YvlM6itDs8AVpDoWSFyN9mYqEfV8PBoJYmcaE/w+JagzxiUxsTsLN/OfUz02oOzarkX0m3wc58h3NjaXHPX23+8975eN1tXxokZsClGKue4V1DoZ9QEGOlyE5wfOOK9j68bIv2jCVsQu56uRC4gPujwyQTGjvt2hENzxUl6/O9DZ8ccwmOFHBhmXntwHIGWcN+Hx283x0hPKR0ROxrEKoIHT3iRP/jAhhRqyy9sQJL8CbjLY3Bvt6koeBIzxk/lTX8ihp6SIkHyzW0pF5ltItyJA3JVU9F4UYDRvs5hSrhR6t8Z2PrCWrDkGQWzj3KXNN9fSjgOoepPq9JlGbxZ5CmwyQDPsevs9MC8++CG+8C9xOgDzwVEwfUGVFdlP31w6Wb531A4g5KRMfRPPC5fohiA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUZIeE0xQU1GT3ZsNDlFcnFUcDc5MWxQVUc4aVpmNWdISW5TeFpLMnR2Q1Jq?=
 =?utf-8?B?ajlTT2tiQXNDYytuRVdobWJSSGF1dkNrWS9rb2pKSnNoaTJxclhLS3FhZm9k?=
 =?utf-8?B?YXlaVXgrMXZEd2RHWUVsU3FLMmVRNnQzSHNYL1o4UVlMTTlqUnZxY2JKZW5Y?=
 =?utf-8?B?b1l4K01tTzZxcHJGeHVPRWdJejA1SUErY0dLVjdaZFkrQllyK0pVVHA5MWVU?=
 =?utf-8?B?ckpYSmcwUkJaN1l3am9HejBqdkJwMGVZNFJBdVRxUnYvVGIyVmtmRTF2cEY3?=
 =?utf-8?B?NitXaWM5M2kzNExFTEV6dzNTc3VBMEpvU21sSnhjTlhxdWFPblpyS2dubXhz?=
 =?utf-8?B?U1cyejRnb08vYnZMTURMVnY5M1QwM0oxSS9tZm1CdW1FMVo1MkYvaW5TaVJU?=
 =?utf-8?B?QUJGcGxvVWlEejNSUlpaWTFxMGZFb2lOL1I2dnhCa0RpRHNxVGRxM1ZrOU5Q?=
 =?utf-8?B?TnA1UVEzSDJzOXV3VWNhdXo5OUtDNXBHWHFYWG9jeERIaGlHS09UdGtqNjd4?=
 =?utf-8?B?ZXdDV014VVI0R21SKzVjLzE0Rzk0cy85dFRPYjJOSHFWR2NXNUNIVlVhbzk2?=
 =?utf-8?B?QlozZTUyYXo3WmNnVk5oOHMzbi9XMFE0OEkvUys5Z041eEE2aU9TckkzaFh0?=
 =?utf-8?B?R25UbW1kMG94TUIzVEM2Q2FYVkRjbWlBOWRKc3FhMUFZTUJGeUlUL2J5eXFy?=
 =?utf-8?B?WitlTW5QMVpKZ0puWWh2SUxTeXJuMHNqL240RUpkdTZsWWYvaW5ZVnM1eXNV?=
 =?utf-8?B?eU0xUlhKanExa2xCTG1KQkI5Vms0dVNsMmRaWUFUcFYvZ0NzLy9qMHFGWjQx?=
 =?utf-8?B?MkF4NjlBSUJneG40c0U3cUZSbzlXYmY0aE9ZQ0l0SEJrWC9WUU9WZ3NPaVNx?=
 =?utf-8?B?VjRNajR6cXRjczJNSXFmM3V3N0lKRCtOSndvM01nSnpQTW1UVHdKanlrT1Zy?=
 =?utf-8?B?WHQ0YjYxRU8yUmNyT2VCSGxlcHB5ZWoyOEY3c3p6Q3RxWGJOa0M0Y3RTWGY2?=
 =?utf-8?B?d0REWWluRGxEQUFHUDlVMVNBOUlRWC9Oa0Fmd1F6dlozUmRJMzNsa2hXUDBX?=
 =?utf-8?B?ZGEwbWtLYi9lRjByc1JtZlBoVnlPWXhuVEtDTXZ5aFFHNVJJWkJ3ckRJL1lI?=
 =?utf-8?B?ZUNMdlBYTHhBZUZmZ1VnMmRwRmg3dHBOU1pjNTNuMHZIbS9rZ3dTM01LMXhQ?=
 =?utf-8?B?WWVUVFFaajU5bXV5dzFvT2hIeUptdEV1MzBFYzN6UjhENUdvQTkwR0h3TlRZ?=
 =?utf-8?B?NlkyaW5wZExPM0VrQnJNc215czVvWkdGZzAraU5vTXhzNlZSNlZhbFUzY0pH?=
 =?utf-8?B?MjZUTW8rdjFEeFRFK0g3M3NtUnUxaDRHZStsVDFBcmwzZWhvU2RjMTgyL3VS?=
 =?utf-8?B?UnVJSlhEcjY5V3lCWEhDRlZTaHRLaUxCUnhYdFczMkF5MVBRZG9LeGNyM084?=
 =?utf-8?B?c1JTeDJZdDNncjZhT0o3ZWxTdkFaclZBTURneEpIWmhSMVZKdVNIOHVpV0pl?=
 =?utf-8?B?eEN5eGVCbTJGaFFnM3FISUFTb2hoei90N3I5cFpqUGZtTHhHUzN0UGxmaVdh?=
 =?utf-8?B?RitYMzdXem9oSGFrWEJvN2dYZVNhbHhYbzNJQUQ4NVJWYUxQTW9XZDFNYnN5?=
 =?utf-8?B?YVhiTU0rZzZNUE1KRXlhVjNNcmVoRi94c0dWeFJBM0gwblhWZ3REVThTM01E?=
 =?utf-8?B?UUMvREVheHl0VVhzRHdSeVFXWG5MUXB0eTNnWWtURnQrdVcyQVVZV1hJUTZT?=
 =?utf-8?B?Wk1JSHdKdFNZSDdXL2NSRUJJWGYrS3lRMms5MlpQcCtJNExQeDVUeGtUSzNv?=
 =?utf-8?B?aU1NSUJlWGNxU2RjbWRFREowUnFGK3VVY1ZSNk50ZlMwSVFvYWtISWpVVDJl?=
 =?utf-8?B?emViLzdWK2x5aTQzMG1wSHV3dHBHNSs1U1V3RkNYekxkQjMrYW1pZ3pHYnBj?=
 =?utf-8?B?QWFFSU11S2Y5aTVrWC9ickhZSUtPOXVjek5nRlZCeTRoei82ZDlZbHdNMlBL?=
 =?utf-8?B?cm1DcWFieksvYy9FaHlrMlZMa2xGUEd1R3JXaWNnTVFEeGlObWV6eHR4TkF4?=
 =?utf-8?B?WUNFdTZQejVobFVMbDVoUkg5cWtwclozN1AycDdjTWZlNktKdjdpTzJaNXNT?=
 =?utf-8?B?bUtTOU84TW8rdzV5VlowSkQ3Wm9aYkFCbkVwYnZrYWJtdEh4UUhNZnp6dEZS?=
 =?utf-8?B?b3Z2RFE0N3FpRVUrM0VBbGhzSnpLaENYTFZQMkNJSUw2L0ttbnFWa0oyM1Uv?=
 =?utf-8?B?NDU5b3lKeEJjOWt5anBsdlRtR0RhUUovUjA0bTJTMmlMaTIrNytnejNUd0RH?=
 =?utf-8?B?WGhBOEVVMW1YcXJwZm8yMVUxTTNGVG9YeUJ1THVQY1EyWVJYR2FlVjRFRlpv?=
 =?utf-8?Q?OoUusAV5u+hVo/2yzjEm5kbsgWE7mhP6l4xkfR60oKR22?=
x-ms-exchange-antispam-messagedata-1: 7p1cuP1j7qKngg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7e99c9-9916-4173-057b-08deaace1aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 17:45:31.9535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SiG/NzI6us0FamOG2EsK/2X6JKIshhbbZ8uNhhyuH9MZwd7zi7LH+1iMDrFUuaZNvlHqNbx9jAVIj2IOqJ1p8+Q+MJeyiXPbU/ux+KcsfNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7841
X-purgate-ID: tlsNG-4011c0/1778003139-44D608B7-F9646847/0/0
X-purgate-type: clean
X-purgate-size: 1680
X-Rspamd-Queue-Id: E1EBD4D2484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

SGkgSmFuLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcgYW5kIGZvciBtZXJnaW5nIHRoaXMg
Zmlyc3Qgc3RlcC4NCg0KSmFuIEJldWxpY2ggd3JvdGU6DQo+IEp1c3QgdG8gbWVudGlvbiAtIG15
IG9yaWdpbmFsIGNvbW1lbnQgd2FzIHF1aXRlIGEgYml0IHdpZGVyLiBJdCB3YXMNCj4gc3BlY2lm
aWNhbGx5IG1hZGUgaW4gY29udGV4dCBvZiBhIHVzZSBvZiBkLT5vdXRzdGFuZGluZ19wYWdlcy4g
WWV0IG9mDQo+IGNvdXJzZSBJIGRvbid0IG1pbmQgdGhpcyBhcyBhIDFzdCBzdGVwLg0KDQpUaGFu
a3MsIEkgYXBwcmVjaWF0ZSB5b3VyIGJyb2FkZXIgcGVyc3BlY3RpdmUgb24gdGhlIHVuc2lnbmVk
IGludCB0bw0KdW5zaWduZWQgbG9uZyBub3JtYWxpemF0aW9uICh3aGljaCBlbmFibGVzIHN1cHBv
cnRpbmcgbW9yZSB0aGFuIDE2VEINCnBlci1kb21haW4gYWZ0ZXIgdGhlIGhvc3Qgc3VwcG9ydHMg
YXMgbXVjaCkgYXMgeW91IGhpbnRlZCBhdCBlYXJsaWVyLg0KDQpJIGZ1bGx5IGludGVuZCB0byBm
b2xsb3cgdGhyb3VnaCBvbiB3aWRlbmluZyBhbGwgdGhlIHJlbGV2YW50IHBhZ2UNCmNvdW50ZXJz
IGluIHN0cnVjdCBkb21haW4gKHdoaWNoIGFyZSBjdXJyZW50bHkgdW5zaWduZWQgaW50LCBtYXRj
aGluZw0KZC0+b3V0c3RhbmRpbmdfcGFnZXMpIGFuZCBiZXlvbmQgaXQgaWYgbmVlZGVkIChmb3Ig
eDg2IHNoYWRvdy9wYWdpbmcNCnBhZ2UgY291bnRlcnMpIGxhdGVyLg0KDQpUaGlzIHdpbGwgbmF0
dXJhbGx5IHJlcXVpcmUgYSBjb29yZGluYXRlZCBzZXJpZXMgb2YgY2hhbmdlcywgYXMgdmFyaW91
cw0KcHJpbnRrIGZvcm1hdCBzdHJpbmdzIHdpbGwgYWxzbyBuZWVkIHRvIGJlIHVwZGF0ZWQgaW4g
c3luYy4gQmVjYXVzZSBvZg0KdGhpcywgaXQgd2lsbCBuZWVkIGZ1cnRoZXIgc3BsaXR0aW5nIGlu
dG8gc21hbGxlciwgbG9naWNhbCBwYXRjaGVzDQpiZWZvcmUgaXQgaXMgcmVhZHkgZm9yIHJldmll
dy4NCg0KV2l0aCByZXNwZWN0IHRvIHRoZSBYZW4gNC4yMiB0aW1lbGluZSwgbXkgaW1tZWRpYXRl
IGZvY3VzIGlzIG9uDQpzdWJtaXR0aW5nIHRoZSBuZXh0IE5VTUEgY2xhaW1zIHNlcmllcyBmb3Ig
cmV2aWV3Lg0KDQpPbmNlIHRoYXQgaXMgb3V0IG9mIHRoZSB3YXksIEkgd2lsbCBwaXZvdCBiYWNr
IHRvIHByZXBhcmUgdGhlIG5leHQNCnN0ZXBzIGZvciB0aGlzIG5vcm1hbGl6YXRpb24gd29yay4N
Cg0KQmVzdCByZWdhcmRzLA0KQmVybmhhcmQNCg==


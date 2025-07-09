Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7AAFEF6F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 19:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038503.1410921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZYHJ-00080n-1t; Wed, 09 Jul 2025 17:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038503.1410921; Wed, 09 Jul 2025 17:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZYHI-0007yM-TZ; Wed, 09 Jul 2025 17:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1038503;
 Wed, 09 Jul 2025 17:08:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLhY=ZW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uZYHH-0007xy-CI
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 17:08:15 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49ceff43-5ce7-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 19:08:09 +0200 (CEST)
Received: from DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) by AM8PR08MB5585.eurprd08.prod.outlook.com
 (2603:10a6:20b:1c5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 17:08:06 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::5f) by DUZPR01CA0007.outlook.office365.com
 (2603:10a6:10:3c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 17:08:14 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Wed, 9 Jul 2025 17:08:04 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB5PR08MB10191.eurprd08.prod.outlook.com (2603:10a6:10:4a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 17:07:32 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 17:07:32 +0000
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
X-Inumbo-ID: 49ceff43-5ce7-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DiX1A947Sbb21PAATAwxSbCu1Bzmval88FD35gLoSSydhiEmGc89a3q8opb2X/s8vaE0W5xuHD+x/9kxTVLzUgO4aBK8qhOqjxE6cybPCxjefTnWVpTW/28C0PixlMJ47g10WdxFs09VlKHUG18AQ5p8ziOsSP9W5pmeHA+MgL6/2eSNf5x5whNShh1gjdu2I4Dkdajf+K7mZvuPW5dieN+rgjiLFgCNJCirm5oYpHJQ8mPuoGdB6mWa1rgrnNkuC3uOL7JG3VKDZn46JxeCfckv+8pbXmv7KV+r15B4Pb/MEreZ7rQMKynHBo759aSjtxI413Xyx78wboZBPluMqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCwlIH8COZL1JQdKqYBF0FMWj6uSZrvmfFswrhZBnII=;
 b=HPesL8KsBFYjNjTMXAHENQonUwhPAzmpapaLAGYsXzI6ivrGwkwcFUbdQgA4A16q4MIloP4gPwAbVDF79R4/wKR7hAJlltckMFxXo48VHGscRfL6LaMJ+P6Y/Hj5zNg56I60s9iI6pwTtI262RBkW8/T2AXC0KSEZB/sSm5bDyk+m7s+DSj7WUtXFEGgIB7KI/Rpttj/GszVGxM/b02YGTNnmmRYBIMoRyleFe5KEKt5edCQF5cSjt+kmKxb12KFKs+C3ltJIHVEtj93BmrgQKTykG+Z/+QFTte+00booFyvhxvqII4xqLArGNwY2U/UhIrRbamLI5fSLQuDJAUBIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCwlIH8COZL1JQdKqYBF0FMWj6uSZrvmfFswrhZBnII=;
 b=er4hCwrT+HrdN0z2eBlcdRpnYTRO6SzXD5td9Bkcg/oCRmg8vz47wZcvACj+Jtpbk/c2VqMA/nQiVuqwbwA5D4AINFs6RNkbjinJvBJKhezFQUFCoagf9GSqc5/Gdj8lO3qICIMbF0jZNOCd2UwsGX7FFUUZqWgE2Qdcu4TbolE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yo6GqdsOD8VJN7oRIXvQzbxEle65YAJ9qWVKSMJtE4kJ42TFqLS//zifxkIy2sF4YYXkiVGVmribaB4NQtg2LX5z8YYWsFczaZCEvJQxks48Bml7sdp9NfwZrxdXw0luhKYqyyES5OoOkDc2YmXIf5PKSlf1e/zmnfy//YKLmGeK4xvN9kZSiJ/enWgcSApiZxrDEPMI/t6eXWUHB2uXVNYKC/7Nhjql0cl3HJybxKdYuNAjcZ6ZERhH7TBr+DHRkeRCX4erBl29OOtYnnEmu6q4u93rZ+i07TxtDrDtPIDCUUb4d5d0ZPRPomD6wzZyzdXUokox/GoD6xaHya3vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCwlIH8COZL1JQdKqYBF0FMWj6uSZrvmfFswrhZBnII=;
 b=iHIFH8xRhalShWHQqO6w31BEUZPERUAWfk/7glnFGjCH/gOyeOIM/ENAn9/a6lYM1ytqMYxuGskkSUs9KT/jKQxDWNq9L82G0jXZxeKVJ6wG7n8ZZv87uqogNCyzRmDtUZqm27g8+bG/K4G2QbUi+kGbqC0owHb0Z7tMfqCx8h0TUkMN82JnFdHKth4Ut2FlaBtx85Jr90iKNibVfGXw0WLoNgN/RAaRaStPWMCg5VTbb7o4cxzDm66iJ/TMUsNHHtAxu8CYRcdZeOeD1OcoqOLdluZeFP8ZdvSLg2yaXEJe1ABUZbvWMhOejomGcK4Z7fdVOkOSzs2uZEvjyxxWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCwlIH8COZL1JQdKqYBF0FMWj6uSZrvmfFswrhZBnII=;
 b=er4hCwrT+HrdN0z2eBlcdRpnYTRO6SzXD5td9Bkcg/oCRmg8vz47wZcvACj+Jtpbk/c2VqMA/nQiVuqwbwA5D4AINFs6RNkbjinJvBJKhezFQUFCoagf9GSqc5/Gdj8lO3qICIMbF0jZNOCd2UwsGX7FFUUZqWgE2Qdcu4TbolE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "victorm.lira@amd.com" <victorm.lira@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7Dg8Kp?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Federico
 Serafini <federico.serafini@bugseng.com>
Subject: Re: [PATCH 1/2] xen/arm: address violations of Rule 11.3
Thread-Topic: [PATCH 1/2] xen/arm: address violations of Rule 11.3
Thread-Index: AQHb5J3Pz2S+k9t5Ik+DkcjAkJZMKLQqHqGA
Date: Wed, 9 Jul 2025 17:07:32 +0000
Message-ID: <F69019FD-9ACA-485F-86A3-1F3526D37CD4@arm.com>
References: <20250624002018.4121819-1-victorm.lira@amd.com>
In-Reply-To: <20250624002018.4121819-1-victorm.lira@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB5PR08MB10191:EE_|DB1PEPF000509E9:EE_|AM8PR08MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b3fd2e-daec-4a52-d8d9-08ddbf0b2b09
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WFUvTVROSDhlNUpMaUd2dW9XNmllRTU4aS8zQ0ZpcDZJYnNIVGduL2NkaU9w?=
 =?utf-8?B?V3U3S2gwaTNDSmgwT0dIY2FqaDZTZGNiM1hQR1kvWSs3OXYxSkMzaHRSY2dK?=
 =?utf-8?B?YXo3Szl2VSszZnFGdmNpZGIyVFVCTGUzQjJvb0NsOGR3TlprQ3AwTlFJbnVO?=
 =?utf-8?B?eXJvRU1jRHlUVVN0ZlNpb0l4SGZwWXc4MmgxeDhUL1FmeEpaQWt5Z0I1djRL?=
 =?utf-8?B?dlNNSURack5vTUxoSjFxbDE0azhYRUhiZ0w1d0JDbnA2dHRJcXphK2FCSHlR?=
 =?utf-8?B?emxWYUxQTWduV0VqaEZ0REt6c1NoRFAwL0ZUSGdqY3RJV0pZdjErTEppRjU5?=
 =?utf-8?B?UUtRTkVNYnFLQ1FsbXVaS3lPN0Q4cUhVUmhLd1dsT0tWNHR2TmpwN2hEaUtR?=
 =?utf-8?B?eTZ0T2labzFqdmhub3VUdjdRZUhqTVczN3drV1JIS2tQc2ltZjRHa1NOWlEw?=
 =?utf-8?B?VURWU3JKa0F2NXYxb1JWc0paSlU3c2ljblZVN3FuM3hETTZrN0Z4NHZibUFa?=
 =?utf-8?B?dWJHUm5COEVIWk5qS1pwa2Ria1NlT2hZeEtDV3hxK0NuUXB2aXdEek9tOUlJ?=
 =?utf-8?B?RUlOaWp3WFQvRm9LOURXNlZnWENIeHhhdldEam9wbG5NLzlNYjZ3ZFhMK0V5?=
 =?utf-8?B?Nm9uc01VODJmMUJpOXVabUVqaE40NGxIVWtNNjNZVm9BazEraWNNaHh4VkZM?=
 =?utf-8?B?eTdkUnBNS2trblNKVDNUT1NUY2swdHNZSldDcXFBbzN6N0NrUjNGalAxN08y?=
 =?utf-8?B?dUN6S3B3N0dQenFaOXJlRDEyWk5QTkp3dzVYUGh0SldhdUtWN01SeGwra0x6?=
 =?utf-8?B?U3lHWkxUcFJpK3NMVHZ1Y1libTZWVFJJV1NKcXRnU3ZjcXZsemw2TzhGaVB6?=
 =?utf-8?B?eWFmZGJrR0cxTVBkSkJFZzR5Uzh1cG9TZjBud3pwa1J4Y3FnRnJVYjNveXly?=
 =?utf-8?B?RU93UkpwcmZJbWlmV01zeDhjd3pjMVJUM0d6OTRHS3NkWUd2bnhOMXZvb21t?=
 =?utf-8?B?T3g1VWxOWGJzWkJKVnhLUktHVjVub3cyK05iczdZaEFyb3V3OHdrMjcrcDM0?=
 =?utf-8?B?RktjSFB4ZnFmVGVvK2cxUkdjVEhHYm5BdmFWUWJEYzdyUWFYT3RGdS9vSGM4?=
 =?utf-8?B?blgyNk1MMTk1bEhRRzVTSFRBUjdYeG9KMHhaV1dnSmo4OWNubDVzOHdkUzdp?=
 =?utf-8?B?am81S25hVjNnZGpkVlROL2hNTlAwRkZleW15NWF0ZG9PZjRCdHJUVUU1Uzdt?=
 =?utf-8?B?WnU5dDlVVlNreHB3bnM0STVtR0N4Mmg5b080UGlwaDdmY05sZFBqT0FseEp3?=
 =?utf-8?B?Qys0cVNCNEhhUUNEejNMTGxhVFdINERIbTlyUktweUtiWEJRRXUrWHViMzRz?=
 =?utf-8?B?U2czWXpzdGFRTzRUODZzaGp5WDFtNWZlcFJpaGx2ZEZJNlNzemZmNEhNQnhZ?=
 =?utf-8?B?b2l4SkVBMWtWWWNpdElnRXUrakI1dWMwQnJvcVc1ZzNMMFN0cnpLR3FMQnhN?=
 =?utf-8?B?NWxxaU53UWNHWjc1ZlpQUjByK1hIVHVndVk0RWYzK1p3NVVKdkRod3NCakxs?=
 =?utf-8?B?YnhzUmxSQ0JMdjlkS1VaYnZUYU5YalFsdm8xWXR5L1IyUlJWYkVzYXZTZG91?=
 =?utf-8?B?SFN5TU9RSUR6R0pIZGxROFd5ODFGdUd0Y2RoaCtTelFJMHYzbEFoWnpyTEJ2?=
 =?utf-8?B?dkkyb1FJeHd5d3RvK0Fldms3eU5JV2ZibjBsZ29PQTVYcklIQUFwSmg4bjlj?=
 =?utf-8?B?bkRCQTRNVUdjaXBPVzdJRHlreWpNQmdzbU5tRjBUK1lHRm5YZFJJTTNBNXcz?=
 =?utf-8?B?dlNwVC9ONnVXTTZBMmttc3VjclUwbmNmNEZUVkZFK2J3cmZVR2ZnZ3QzZXoy?=
 =?utf-8?B?dWlFekd0MnBKNWJNVUE2Vks4Rld1TzNWMlJ1dC9jUE9SWGRhcktJN1RyVkNq?=
 =?utf-8?B?T0N0a2JKVzk0dlJ1Qm1Ic0hsT2hXMEdHV3k5bzdLSGFZL2R3R29wWkhSWEhm?=
 =?utf-8?B?VVZvT1V2VStBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E153C50C618934479E7339DDB4560CDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10191
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a704eefe-8577-4f99-1b7a-08ddbf0b17c6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700013|7416014|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXQzUkVxZjIwWmcrK0U4b29KWVRIS00xd0NLM0FwY2xlbXNHTXBZUEd0Y2JZ?=
 =?utf-8?B?Skt4a3VvWlRrNE1PMDNzRU1icUM3Z01HTCtXQnJYek9lQ0NDb2dqSTM0M3gw?=
 =?utf-8?B?bSsyWEJlY2F3R3NlSDhjbUVpNVU5a2QybUlaNGdhU3BBbHpndkl4QWd2b1hq?=
 =?utf-8?B?Smx6ODNTdDBtcUpuSytieHdGSnkyeDhnTHFXYTFZamRIdGZyc3BmSXh0c254?=
 =?utf-8?B?SzJ0dXdOVENiUTRrQStRUlhBaElTUzFROGRKNk82RTJvQlVUZW5Bb2Z6Nmhq?=
 =?utf-8?B?L1V1c2YvVUM3ako0bHB3SDhBblVFekY2TXBjS3FlSjVqa25hU3REMTl4Zmdx?=
 =?utf-8?B?OEpaeWpYQVVCbXBJRDQ5RHYyZGluZGRRUmdiRUJreGFOMmVKaCs5QW5LcGxC?=
 =?utf-8?B?blRMMkxDNThUNDZOd1hlNHJENlhBT2U4clRTcWZjTEUzblhVUzRQdDc2UmtY?=
 =?utf-8?B?ZEo0dGpiYkhpcDlGaTJYenkrb3JSZVJxdytTNUhqMm9Md1BRYyttWkplM0FX?=
 =?utf-8?B?ZlVEVnhEK3hlclF0Qm5Hbnlab3JvMHhqVEJRSFdxN0FaaFRpUHI1SGVyK1Zo?=
 =?utf-8?B?WHFDNjB3dkdNblZCZXB3V3dkQ3RMa1R6bHl3YmFqUTlPczBGZk9DaHU4b1V4?=
 =?utf-8?B?TEE5Sno4eFhxNmJWQnBDTm04em5QWXNVQUN3dlFFemV4c1NLTlFTNi9WckxM?=
 =?utf-8?B?N2pEamdrZDlWbmVPVEd1ZkswcDJnRUJ4UkpTOTRwdkppRWRLbXFXR0lvLysw?=
 =?utf-8?B?c0l6OWk1cjFReUljTFEzRUUyVnlJUFg4Qk9NL0lJcFBVdzNFSjl3WS9QaVhP?=
 =?utf-8?B?QlQ3SWZFeW5XYXdKUUtzWG1Sa2NocjRvK09rSkJ2RHZXSVVlMEJ0aVg1Szho?=
 =?utf-8?B?MURrV0l6K1hRTUxPc2VFblNHQWJneUROWmQzei9BYXNKd21IMDMrRVlXcUNG?=
 =?utf-8?B?ZkE2cDhZTndLMzlMcWpjd0lQaDhFbXZuSGdBV3VvQlhmOHpVK25lYkhDbGhW?=
 =?utf-8?B?MEVQYU92L1NVZGRaYjRBU3dYVGFHQnlKQlZwOUYva05aN2ZEdkVVRjVCSTMv?=
 =?utf-8?B?UTBDa0ZzQ3RDbk4rM3V0NXJtcG5BVWFvcUFpVnR1LzlDMHdFc3c5dU5yQVBB?=
 =?utf-8?B?TkxqMTVuSC90U0JRVE1yMHE0b21pU3hWRVhvQm1TSVFPbCs1NGZuT2laeWt2?=
 =?utf-8?B?a0pYbzhJNi9IYTZaUWxmbEFWS1RrejYvUkhING04T1phT3dZRXYvaUxPaE5O?=
 =?utf-8?B?bXBud3dlVWpaSE43cytJWlF5dzBLYWl0aVIwYnJZTWd3K29rMEl1OS8waytL?=
 =?utf-8?B?eEN0NjdSNlFOZUVRM29DWFhVTlhQVllXaEh3VHo1WGwzSmFpME9vRkduR3VL?=
 =?utf-8?B?b1ZTVVFZNWdHMVJabXU1SGZ2WEhlNVF0ZnpjRHR0T0JOYmluNHJlWUZLdEhI?=
 =?utf-8?B?QmNyRzdVbE9KcnhuTFZzeFR2VDZlQmw3YjFkZnNPSkZ4cFdrVzJ5ZEIxS21L?=
 =?utf-8?B?cmtIQ2k1RzBqeEF4cVE3WkFpRE16NUtYYjg1cUg5c0V1N082RUFYMXBLaWtF?=
 =?utf-8?B?bGpJbnRTU2VvZWltSU1xTVhpaUs3ekd4Y2p5dWEzaGYrWXhEWWJaMXR0YlVy?=
 =?utf-8?B?REdEelRiZDJOaDk3VmhiK1FwQ1RHNlBPVVR4VUx5MXZjci9YRTRnbHJrUjRQ?=
 =?utf-8?B?S0pKM3Z1RWZyZTd2dUpQV0c3aHFHS2hDalJHa1MvN29sbHJzS1hSNVhJYmkz?=
 =?utf-8?B?SE42RWJUVHJZMWdnZTNVZlFTekxOM2hvYzJ4VW1ZSXlPbkpkZHl5Q0xQOWUx?=
 =?utf-8?B?QUNaQ2pubUdGaERRb1c4aHAxNVRLajZPODNJU1NKcnRDU1EwODh0NDZzYnBU?=
 =?utf-8?B?Umh2b1JIU0V5T1F3M0ZlQlM5TWVON016a0Y5eS8vSDM2ZUg4Sk1ib2JidDg5?=
 =?utf-8?B?Y3FnbHpZSDFlOWlueVMwUXJySWxBbXNqZDR0VXl5NEpxeWdoZ1JmS1c3QWEz?=
 =?utf-8?B?TTNncjNOdTh0NlFWT3FUejNhQ0ZKcVNOcTNYRld4WlkwT0NSYkVjSDVsUE5u?=
 =?utf-8?Q?VgklpQ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700013)(7416014)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 17:08:04.2994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b3fd2e-daec-4a52-d8d9-08ddbf0b2b09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5585

SGkgTmljb2xhLA0KDQo+IE9uIDI0IEp1biAyMDI1LCBhdCAwMjoyMCwgdmljdG9ybS5saXJhQGFt
ZC5jb20gd3JvdGU6DQo+IA0KPiBGcm9tOiBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlA
YnVnc2VuZy5jb20+DQo+IA0KPiBVc2Uge2dldCxwdXR9X3VuYWxpZ25lZF90IHRvIGVuc3VyZSB0
aGF0IHJlYWRzIGFuZCB3cml0ZXMgYXJlDQo+IHNhZmUgdG8gcGVyZm9ybSBldmVuIG9uIHBvdGVu
dGlhbGx5IG1pc2FsaWduZWQgcG9pbnRlcnMuDQo+IA0KDQpNYWtlIHNlbnNlIGFzIHdlIGNvbnZl
cnQgYSB2b2lkKiB0byB1aW50MzJfdCAqIHNvIG1pZ2h0IGJlIG1pc2FsaWduZWQuDQoNCj4gU2ln
bmVkLW9mZi1ieTogTmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1Z3NlbmcuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBWaWN0b3IgTGlyYSA8dmljdG9ybS5saXJhQGFtZC5jb20+DQoNCkFj
a2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQoNCkNo
ZWVycw0KQmVydHJhbmQNCg0KPiAtLS0NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQo+IENjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0
ZXMudGVjaD4NCj4gQ2M6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IENj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPg0KPiBDYzogUm9nZXIgUGF1IE1vbm7Dg8KpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4N
Cj4gQ2M6IE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4gQ2M6
IEZlZGVyaWNvIFNlcmFmaW5pIDxmZWRlcmljby5zZXJhZmluaUBidWdzZW5nLmNvbT4NCj4gQ2M6
IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4gLS0tDQo+IHhl
bi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaCAgICAgIHwgOSArKysrKy0tLS0NCj4geGVuL2NvbW1v
bi9kZXZpY2UtdHJlZS9ib290ZmR0LmMgfCAzICsrLQ0KPiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgNCj4gaW5kZXgg
ZWU4MDU2MGUxMy4uMTJkYmI2OTYxZiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2VmaS9l
ZmktYm9vdC5oDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaA0KPiBAQCAtOSw2
ICs5LDcgQEANCj4gDQo+ICNpbmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4NCj4gI2luY2x1ZGUg
PHhlbi9saWJmZHQvbGliZmR0Lmg+DQo+ICsjaW5jbHVkZSA8eGVuL3VuYWxpZ25lZC5oPg0KPiAj
aW5jbHVkZSA8YXNtL3NldHVwLmg+DQo+ICNpbmNsdWRlIDxhc20vc21wLmg+DQo+IA0KPiBAQCAt
ODUsNyArODYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBzZXR1cF9jaG9zZW5fbm9kZSh2b2lkICpm
ZHQsIGludCAqYWRkcl9jZWxscywgaW50ICpzaXplX2NlbGxzKQ0KPiAgICAgICAgICphZGRyX2Nl
bGxzID0gMjsNCj4gICAgIH0NCj4gICAgIGVsc2UNCj4gLSAgICAgICAgKmFkZHJfY2VsbHMgPSBm
ZHQzMl90b19jcHUoKigodWludDMyX3QgKilwcm9wLT5kYXRhKSk7DQo+ICsgICAgICAgICphZGRy
X2NlbGxzID0gZmR0MzJfdG9fY3B1KGdldF91bmFsaWduZWRfdCh1aW50MzJfdCwgcHJvcC0+ZGF0
YSkpOw0KPiANCj4gICAgIHByb3AgPSBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgbm9kZSwgIiNzaXpl
LWNlbGxzIiwgJmxlbik7DQo+ICAgICBpZiAoICFwcm9wICkNCj4gQEAgLTk2LDcgKzk3LDcgQEAg
c3RhdGljIGludCBfX2luaXQgc2V0dXBfY2hvc2VuX25vZGUodm9pZCAqZmR0LCBpbnQgKmFkZHJf
Y2VsbHMsIGludCAqc2l6ZV9jZWxscykNCj4gICAgICAgICAqc2l6ZV9jZWxscyA9IDI7DQo+ICAg
ICB9DQo+ICAgICBlbHNlDQo+IC0gICAgICAgICpzaXplX2NlbGxzID0gZmR0MzJfdG9fY3B1KCoo
KHVpbnQzMl90ICopcHJvcC0+ZGF0YSkpOw0KPiArICAgICAgICAqc2l6ZV9jZWxscyA9IGZkdDMy
X3RvX2NwdShnZXRfdW5hbGlnbmVkX3QodWludDMyX3QsIHByb3AtPmRhdGEpKTsNCj4gDQo+ICAg
ICAvKg0KPiAgICAgICogTWFrZSBzdXJlIHJhbmdlcyBpcyBlbXB0eSBpZiBpdCBleGlzdHMsIG90
aGVyd2lzZSBjcmVhdGUgZW1wdHkgcmFuZ2VzDQo+IEBAIC04MjQsNyArODI1LDcgQEAgc3RhdGlj
IGludCBfX2luaXQgaGFuZGxlX2RvbTBsZXNzX2RvbWFpbl9ub2RlKGNvbnN0IEVGSV9MT0FERURf
SU1BR0UgKmxvYWRlZF9pbWENCj4gICAgICAgICByZXR1cm4gRVJST1JfTUlTU0lOR19EVF9QUk9Q
RVJUWTsNCj4gICAgIH0NCj4gDQo+IC0gICAgYWRkcl9jZWxscyA9IGZkdDMyX3RvX2NwdSgqKCh1
aW50MzJfdCAqKXByb3AtPmRhdGEpKTsNCj4gKyAgICBhZGRyX2NlbGxzID0gZmR0MzJfdG9fY3B1
KGdldF91bmFsaWduZWRfdCh1aW50MzJfdCwgcHJvcC0+ZGF0YSkpOw0KPiANCj4gICAgIHByb3Ag
PSBmZHRfZ2V0X3Byb3BlcnR5KGZkdF9lZmksIGRvbWFpbl9ub2RlLCAiI3NpemUtY2VsbHMiLCAm
bGVuKTsNCj4gICAgIGlmICggIXByb3AgKQ0KPiBAQCAtODMzLDcgKzgzNCw3IEBAIHN0YXRpYyBp
bnQgX19pbml0IGhhbmRsZV9kb20wbGVzc19kb21haW5fbm9kZShjb25zdCBFRklfTE9BREVEX0lN
QUdFICpsb2FkZWRfaW1hDQo+ICAgICAgICAgcmV0dXJuIEVSUk9SX01JU1NJTkdfRFRfUFJPUEVS
VFk7DQo+ICAgICB9DQo+IA0KPiAtICAgIHNpemVfY2VsbHMgPSBmZHQzMl90b19jcHUoKigodWlu
dDMyX3QgKilwcm9wLT5kYXRhKSk7DQo+ICsgICAgc2l6ZV9jZWxscyA9IGZkdDMyX3RvX2NwdShn
ZXRfdW5hbGlnbmVkX3QodWludDMyX3QsIHByb3AtPmRhdGEpKTsNCj4gDQo+ICAgICAvKiBDaGVj
ayBmb3Igbm9kZXMgY29tcGF0aWJsZSB3aXRoIG11bHRpYm9vdCxtb2R1bGUgaW5zaWRlIHRoaXMg
bm9kZSAqLw0KPiAgICAgZm9yICggbW9kdWxlX25vZGUgPSBmZHRfZmlyc3Rfc3Vibm9kZShmZHRf
ZWZpLCBkb21haW5fbm9kZSk7DQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZS10cmVl
L2Jvb3RmZHQuYyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvYm9vdGZkdC5jDQo+IGluZGV4IDUy
OWM5MWU2MDMuLjlmMjU1MDI3ZWEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vZGV2aWNlLXRy
ZWUvYm9vdGZkdC5jDQo+ICsrKyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvYm9vdGZkdC5jDQo+
IEBAIC0xMyw2ICsxMyw3IEBADQo+ICNpbmNsdWRlIDx4ZW4vbGliLmg+DQo+ICNpbmNsdWRlIDx4
ZW4vbGliZmR0L2xpYmZkdC14ZW4uaD4NCj4gI2luY2x1ZGUgPHhlbi9zb3J0Lmg+DQo+ICsjaW5j
bHVkZSA8eGVuL3VuYWxpZ25lZC5oPg0KPiAjaW5jbHVkZSA8eHNtL3hzbS5oPg0KPiAjaW5jbHVk
ZSA8YXNtL3NldHVwLmg+DQo+ICNpZmRlZiBDT05GSUdfU1RBVElDX1NITQ0KPiBAQCAtMjEzLDcg
KzIxNCw3IEBAIHUzMiBfX2luaXQgZGV2aWNlX3RyZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQs
IGludCBub2RlLA0KPiAgICAgaWYgKCAhcHJvcCB8fCBwcm9wLT5sZW4gPCBzaXplb2YodTMyKSAp
DQo+ICAgICAgICAgcmV0dXJuIGRmbHQ7DQo+IA0KPiAtICAgIHJldHVybiBmZHQzMl90b19jcHUo
Kih1aW50MzJfdCopcHJvcC0+ZGF0YSk7DQo+ICsgICAgcmV0dXJuIGZkdDMyX3RvX2NwdShnZXRf
dW5hbGlnbmVkX3QodWludDMyX3QsIHByb3AtPmRhdGEpKTsNCj4gfQ0KPiANCj4gLyoqDQo+IC0t
DQo+IDIuMjUuMQ0KDQo=


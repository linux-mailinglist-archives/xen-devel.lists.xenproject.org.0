Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3AAEB1E0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 11:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027419.1402074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4wR-0004e9-0I; Fri, 27 Jun 2025 09:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027419.1402074; Fri, 27 Jun 2025 09:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4wQ-0004bR-TT; Fri, 27 Jun 2025 09:00:14 +0000
Received: by outflank-mailman (input) for mailman id 1027419;
 Fri, 27 Jun 2025 09:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Eu8=ZK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uV4wP-0004bL-R5
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 09:00:14 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060a.outbound.protection.outlook.com
 [2a01:111:f403:240a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20c7dca8-5335-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 11:00:11 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 09:00:07 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 09:00:07 +0000
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
X-Inumbo-ID: 20c7dca8-5335-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAXVazLpoxyN50AYlogPPvvxNjCmH1mS90Y9TUykKDcz9KiuENIXqoM2GK2/j1EYvQTEwRaTkmNmP5ROO+HNCp4H5r1f3jOxz2lL1rB/SQkcdf0EaA1Wc8AoqGvw8mBQ7vbLvkQtO5OkaQmdE7pX8v2D8NkhG65uUO/OtnGFxD87XfutjoONhsA3HeF3VYg2g6agGxVBt1ZwN1KsuDbcc/GSIehpo/YKhryLmDESPvMaBy0rIJo2U/7F05Lity8fDjNVtiXPRs7MyTQSFLJ3SVh1meQ4k32kIsu1ZdqRe2mlTbIC75K1s3J5EoFvZHHv2R+NOHgFO/3mc0NBLRHcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng7bzFTycB91qXQHKOQ6Tum/xoMGMFl/6PBet7blNgg=;
 b=h1g8qld+MmX6/XNPX6X/CL+u/TklGk8f+gpsRcHjfwTu77LcP2PUtwmS8luQTAMcpnE78s6eO6gPLzpORo3Et8h4oU1bkOUGhOD3KydKFAWrQFNnepXU8Moyk+dtFG+AI36Lc5uEMMSm44q9SA+htZISX+UrHUuw1Bm6DC4o0hhVt/0ouQZ+Fm17j84tuIsEv3ndJnToNMk7nT0qtH8ofM2v7hEZGJFLueui2TtDiL056lWGq2Qz+QQcviF56ioBQLSxhP0DAcwo2MoNsvAsFHkPaaHuGJH+PooHP/33vUaMW7aVdYjrjcu3XZMY3lkHdSKGL7JVfLUc2bP/xTOLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng7bzFTycB91qXQHKOQ6Tum/xoMGMFl/6PBet7blNgg=;
 b=YJAG6HoiiaB6HjquJC/QltIdbYbBInik/z2hBdBSHPrCm5FDnco9r+Ms4lIo73rRfKKkLesAkklBdjNk7tkKyjSc0sq36NoPndK1AIXjF9A2+DmyMr/xzcUh4oya0CLmijwbMj9XPsIr4jB7I43TyDU9BOZMD0mnkHKlPkrSImA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAP//hioAgAHew4D//5oCgAASTfCA//+FrwCAAIi+gP//u5+AgAGwYID//8AMgIABfE8A//+xAYAAFslbAA==
Date: Fri, 27 Jun 2025 09:00:07 +0000
Message-ID:
 <BL1PR12MB58495B7B5DD5340037197B1BE745A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3638e73c-2a83-4164-9a84-839245245727@suse.com>
 <BL1PR12MB584988E00D0F4A4330B9B968E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
 <BL1PR12MB58492A16BFE80B49045AB936E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7753470a-efef-478a-bbe5-ae48d008cfdb@suse.com>
 <BL1PR12MB584979FA987CE2D6E242648FE77AA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cf41d703-dae1-42fd-86a2-aec32184adcc@suse.com>
 <BL1PR12MB5849302474B73599557CC1F2E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f50a5c04-73f8-42b6-bcaa-fd9b30088f21@suse.com>
In-Reply-To: <f50a5c04-73f8-42b6-bcaa-fd9b30088f21@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB6173:EE_
x-ms-office365-filtering-correlation-id: 2345102d-7096-48f5-bedc-08ddb5590375
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WGp0aE4wNUlZQVhuYldIbWtNcDNTL3NPRkM1dlhhZFdhaVVzbVJHMTFFdTA3?=
 =?utf-8?B?bUl4aTlQSmliZlNUWnp3dXluMENhYlRiTXVoazRvRjBNUC9ENUJ1c3VObXQ0?=
 =?utf-8?B?KzI4TWFGZG85c0ZrcGpJUTFZNWR5cTAwaGNqSCt0RjdDWXFNMWs5ZlVLellT?=
 =?utf-8?B?a0FJL2xLYUxiUWVaZ1BsMDRSQXJIU1FlRDc3bmsyWjJNSUZhR3loa3Z4ZlNt?=
 =?utf-8?B?bXJqWFNPVUtBeGRMTHVoSW1ENk9Lb1l1Q3RaL2F2NjJYcERvdWdaT3A4TDc2?=
 =?utf-8?B?SXdpbVVJMU5CNFdmQVhsNytqaVpQTHQ0bnBIcHJTSFd3UXE0Y2NaK0UwTTBm?=
 =?utf-8?B?WFZxbTJJMnBsckhMRmk0aVZNTFZYTHhJb05OdFllbmhzaVBpbEdZRXdUalc3?=
 =?utf-8?B?V3pmRHh1d1VvRjR5dmVPbVJPcDZWVEJyVTh4TEZFd215UjJ3RTlhamUxSHFL?=
 =?utf-8?B?RElqcEpiQWJhQzd2NHFFTTB1aUlhY3IyK2w2dkJQYXVWNlkrTGxWY1ZUOEVN?=
 =?utf-8?B?UXBJZElSUHdEMUhmOFcrTkN4MFI3T3lBQ3VxRDRSR2J4UlE5cGdVcjBsREls?=
 =?utf-8?B?Vkc3YUFoUFl0dHJjaDlFcHJMWVRQZ3d2S2dtVE93ZzdBeWRWNS9tZEtDVVAy?=
 =?utf-8?B?R1pkbjFJNGlQZTVBNUx5VlFlc0NhYjBZaEZweDdXUXJNa3VtOThleXcrRDFv?=
 =?utf-8?B?TGc1WmEvT1VYMHhxYVZNeDNESjVJdGN2Y1VrRW5wbTIwNWN5Q0c5Y2tmRjJz?=
 =?utf-8?B?VEplVGJoM2hyMXAzMVBrdnhQOTBoWnVaS3hSWTA3VnVLaVhESDR0djZwWUY5?=
 =?utf-8?B?WHpJVUgzR1ZGVHpad0tGQjNWN2RRQnNDNk51YVQvMllJL1I4VnFldzR4ZlZo?=
 =?utf-8?B?NWFqN3lERGVhZEpNelBFcHl1R1llaDRHMmpWeGJpWXZtaVlaU09pdmg2a2xq?=
 =?utf-8?B?OEZPMWRpWGRyMHF6SWlGWTV6UkdQdGsyQ3FKMW1aMS9xWW9oM2RJZ0grZ3p0?=
 =?utf-8?B?QURha0ZIUmRYR1lPYXM2dnMyRWpFN1ZzRVRXVWVBZy9tNVpUWEtrb3YveXp0?=
 =?utf-8?B?ZElKQVNydUtsVytzRHhHS3FRek95RXNmN3dTK0tEYVVMaUNZbFR4bmJEK0RT?=
 =?utf-8?B?Tis3d1ByUXN4Ri9TNkxpOWNEMXBTeHVGZFUzdGVJelNyZ01VdDU4Zk54aFU2?=
 =?utf-8?B?VXZGMC9rMkdndXR0S2ZEclRmcjdYeW54Y3hNNHdvZWZsVk05eW14dHE5WFBT?=
 =?utf-8?B?MkpvVzB3bHNkTUw3a3ByeTZRQVc3MG02cG0zcG9BRVY3OThjcHRsVDZTdmJ1?=
 =?utf-8?B?alFlbW1SOGpCWk04dnVHZmE4Y1lzYUdUZVJibE1oRkRGdnJEdm05aWRkbEtR?=
 =?utf-8?B?Y0xUUXBUdGFaV3gxZSs0NGtjUGJIdzR0WXpONFBNRnNZa3l6NDEycmpXU3kx?=
 =?utf-8?B?WDV0c2ZMRThtamhZRGNoSzRySHBZZE5TTWpaREFJNEtkbXdmOERTd1lET3ZG?=
 =?utf-8?B?TVpyUStIT0pRWndNOVFLUlVHZWJZVWJoRnpwOEZSM0xTZXE3WFZaRUxOaHlx?=
 =?utf-8?B?Y2JWdWlmUHNUQndmOTJ4WVdDd3BvVjg0RmZ5aGVBemhSeUg4TEdhTjNzRm4x?=
 =?utf-8?B?NU9ya2YrNEowcWtzWUhUNGxIS0w5azEvUWdKZTJmR3N5d3oxMUdQQUJRK1pj?=
 =?utf-8?B?cHhmekpGY05Mb3BQRHdNWnRKRjVWejl1WFpjTVBlVU1yTVdCT0NWekwrL1E4?=
 =?utf-8?B?MlVNb3d5VXUwVmduYWh3eUtsTFczek90UGZ3SCsreW1JblBZV21VTGVJZkpU?=
 =?utf-8?B?UW9WTmtWRFVlMTZTSGxkYnIxcUppM29Dd2FqREZOVU9rN2NaQVVheWRNbVRj?=
 =?utf-8?B?NXRSaHJQUk9xZ2tBaGdlYUN2S0tXMUVsQ2hlUTlMbUxhSmUyRVVXcm94c1JG?=
 =?utf-8?B?VXl1dXdPUHk2UXp6K3YrZ2duY3BvRmtlUFVxOG4zaE9JQmQyQTB2N0RkMGxs?=
 =?utf-8?B?cTV3NDE3MjV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0x2ZUFYZE55YXlkNDRmR0w4SXBqVnUwQkxZVXlOMk5MdXJDVnhkcEU1aDZ5?=
 =?utf-8?B?RlRmdE5WcExBenYwSWxpWDhjU3V5TTE3YTdINy9lR1BUSHU5SXUyZUMrQnh2?=
 =?utf-8?B?ZUhNMytsdGJjTkV4ZWdKdURvUU1ML0ZGRCt1dytkZ2ZTdVFaaVhQMFczTGhs?=
 =?utf-8?B?NkRBMHpLV0dYcWttc2RvZkVoZ3ZESUR4bFRNWmRIUXhPdlJ1VE9rT1VKck5H?=
 =?utf-8?B?SDFIMGlQSW1WQlVISGVBOE8wQVhyOUJrVDUwMmYyQUN1ZlFLNDJvUGpsTExp?=
 =?utf-8?B?aDA3VmpqTE8yWDlCL3pGMTMwaWdQWVlwQlBFSjJtRlpsbmVacC9GYWdOZGVS?=
 =?utf-8?B?RHRSUTdISThlWXBPWnMveldsZ3Q2TW1OS2I3eklYSnFZV3IxZHZkWU82Lzd3?=
 =?utf-8?B?N1pzWWpqT2Z0L1pjU293Z3VmQlh6dzd3N1NxZmZMUmhPNi9VWUVuMWZGWC92?=
 =?utf-8?B?Sm8zcEswU29IZ3pVQXNNcTNjUVcrWGxlTnhacWJIbWlycUhEWTJ2RUJwM1Zl?=
 =?utf-8?B?MzJUOE9WQ1ZLYWQzWjNoT3llYlZSVXhhMFBZdXdOWTAxY1VTYTRaUGRLQWVM?=
 =?utf-8?B?MVNLN24xRktqNkJLSStHREYweHdoUG0rU2FDSlR5ekVDYzREYXp5Q2xWSHF3?=
 =?utf-8?B?TUxXYmRUQ3hKaG9WWFdtNEZxajZoV3BzYXRyVlRSYXJsRUlkTzhNVC9WeHUy?=
 =?utf-8?B?QjRZNWt4N2xqalBlUThkRG1RR3pEekx5R0lDaHhkLzNUNjZGSmMwYkcrZWMw?=
 =?utf-8?B?US84TUZYK0dUTG1XWmdMczByNThoTkRJbFZaMk9Fb09BaldlNWVXODZEVlpq?=
 =?utf-8?B?OU5iTVVwS0lpOWZoQi93REovNjF0NngyRDJUU0hEQXU5Y2hVSlowM3U1ZFhI?=
 =?utf-8?B?ZmpPRkdpN1NWQmk3czNDcHJ2NGkxcTdkbjE3aU56MUQ0Mk9XZXpWaFAzczB5?=
 =?utf-8?B?RU5XbWpobjlmWTdvWlR4d05xcWZHcnFod2JZbDZOYVdNUUZWN0daSzRXdUZK?=
 =?utf-8?B?MTE3UWIwQXBwMWxRRERQZ3NlUVhPZk5jaUdqY0VDVU5XdkY3MnkxNXMyWng4?=
 =?utf-8?B?V3RPME5lMmh2WjkwVXMwWE5teVJZN2xhSmx2d0VSQlBDbHYxeVdqdVM5N1V6?=
 =?utf-8?B?VWxPNmJOVDU1S3FweUhIdWVKQUFoOVh0cWZGRUUwZDlOSmRKQkh5cDlocEZi?=
 =?utf-8?B?KzJGYXU2RzdoRDVlbTF4OXpzR2twcFRkRStuSUdPTmJWbTZ6YnVLY2NaZW5q?=
 =?utf-8?B?ZHpxV0R2dzV2dlVLRzZjRS9NcFdhWk9QalE5YlQwUC9uOTlyRWVCTWNQQzRn?=
 =?utf-8?B?MHZkM2FWeGdsM05BMkN1V0xYWTJaeWg2SVhtRnJsYS9mRUI5Qkt1bGRwY213?=
 =?utf-8?B?U2RnZVRTcDA3VzRTSUZFYzJ5cG42ZmNhclJwZ3QxSXh0MFNDUnBuWUdST0ZE?=
 =?utf-8?B?bXBEdTdpcFNtK1NycUJSejVmcmNVdzRxUkVDT3FhaVhsQWdVQk9iSFdJYlNo?=
 =?utf-8?B?c2lCdkdGb0o5dHVLVUJHcGo1b2p1OHI1THVuS1A2d1BvaTRsOWp0Z1YvemNv?=
 =?utf-8?B?eEw1dzdLN0J2WGR1cXE4aitSR1NZMkJIY05haVJyRWkyQXNlK1pVMXN4WDdj?=
 =?utf-8?B?bFAzUUJBdzNZSXlpdm1EekplZVdxOVd5UWEyUTE5NWYzcklYVExaa21TdDBK?=
 =?utf-8?B?enhabk9DQ25nL2syY3h0clFBSGhMVEtYd0Vpc0s2bGNObGFnQW5mQVNMcGdi?=
 =?utf-8?B?M3hjWlFqK3NnODFnM0VubEJYVWRVczNjMWRLdzlsMUZTdDc1dTQ1dnlDM3hN?=
 =?utf-8?B?djd4cmpyOTBXM3IyWjJMMmZmQ1dZcnU0eTZWalFMTFRwMkx6eEhFd2lPaHhv?=
 =?utf-8?B?TVBLRUUrajE3b2ZYQzJlTitnMXNwS2YwMU5PL0l5ZDVueDR1ZHlzRUtGaUw2?=
 =?utf-8?B?OUVQWmMrZ2JYdngxNUVRbXJzUkNYRXNZalQwNFh4Y29rQTQ1VFBUaFV5NWx0?=
 =?utf-8?B?QVpQdW5pMk1uNW44TzdjaUlaWlk2VHFBSWRpVzlXNGdndWlWRSthU1hoUm9z?=
 =?utf-8?B?ajVLQi9vVTMxMGpleDI2cklBUGFoeEl0WGlMMTdaMUhyNGFSVmJEc1hNR01t?=
 =?utf-8?Q?qw8k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FBCA76945856F42B3EC9A1B369353D2@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2345102d-7096-48f5-bedc-08ddb5590375
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 09:00:07.0712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3nfJvhcHLQv6AJ/b2mf9poOlvj1oAaKgyEEh5zoGogou81TICtTXZINjx8bj9AoswmWIbgVktzY3yuXs0g+W9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173

T24gMjAyNS82LzI3IDE0OjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjcuMDYuMjAyNSAw
NDo1OSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI2IDIwOjA2LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNi4wNi4yMDI1IDEwOjAzLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yNSAyMjowNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAy
NS4wNi4yMDI1IDEyOjE2LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNS82LzI1
IDE4OjAzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gQWxzbywgYXMgc2FpZCAtIHlvdSB3
aWxsIG5lZWQgdG8gY2hlY2sgd2hldGhlciBvdGhlciBhcmNoaXRlY3R1cmVzIGFyZQ0KPj4+Pj4+
PiBkaWZmZXJlbnQgZnJvbSB4ODYtNjQgaW4gdGhpcyByZWdhcmQuIFdlIGJldHRlciB3b3VsZG4n
dCBsZWF2ZSBhIHRyYXAgaGVyZSwNCj4+Pj4+Pj4gZm9yIHRoZW0gdG8gZmFsbCBpbnRvIHdoZW4g
dGhleSBlbmFibGUgdlBDSSBzdXBwb3J0LiBJLmUuIG15IHJlY29tbWVuZGF0aW9uDQo+Pj4+Pj4+
IHdvdWxkIGJlIHRoYXQgaWYgaW4gZG91YnQsIHdlIHB1dCB0aGUgX19hbGlnbmVkKCkgdGhlcmUg
dW5jb25kaXRpb25hbGx5Lg0KPj4+DQo+Pj4gTm90ZSBob3cgSSB1c2VkIF9fYWxpZ25lZCgpIGhl
cmUuIFdoeSB3b3VsZCB5b3UgLi4uDQo+Pj4NCj4+Pj4+PiBUaGF0J3MgZGlmZmljdWx0IGZvciBt
ZSB0byBjaGVjayBvbiBhbGwgZGlmZmVyZW50IHBsYXRmb3JtcyBzaW5jZSBJIGRvbid0IGhhdmUg
dGhlbSBhbGwuDQo+Pj4+Pg0KPj4+Pj4gWW91IGRvbid0IG5lZWQgdG8gaGF2ZSB0aGVtLiBZb3Un
ZCBuZWVkIHRvIGNhcmVmdWxseSBnbyB0aHJvdWdoIHRoZSByZXNwZWN0aXZlDQo+Pj4+PiBzZWN0
aW9uKHMpIG9mIHRoZWlyIHBzQUJJLXMuDQo+Pj4+Pg0KPj4+Pj4+IFNvIHlvdSBtZWFuIEkgc2hv
dWxkIHJlbW92ZSAiI2lmZGVmIENPTkZJR19YODYiPyBKdXN0IGxldCBfX2FsaWduZWQoMTYpIGZv
ciBhbGwgcGxhdGZvcm1zPw0KPj4+Pj4NCj4+Pj4+IFllcy4gQW5kLCBhcyBhbHNvIHNhaWQsIHdp
dGggYSBzdWl0YWJsZSBjb21tZW50IHBsZWFzZS4NCj4+Pj4gQWgsIG15IGNvbW1lbnQgZGVmaW5p
dGVseSBuZWVkcyB5b3VyIGNoYW5nZSBzdWdnZXN0aW9uLg0KPj4+PiBJIHdyb3RlIGEgZHJhZnQg
YXMgYmVsb3c6DQo+Pj4+DQo+Pj4+IC8qDQo+Pj4+ICAqIFNpemUgb2YgdnBjaV9jYXBhYmlsaXR5
IGlzIGxhZ2VyIHRoYW4gOCBieXRlcy4gV2hlbiBpdCBpcyB1c2VkIGFzIHRoZSBlbnRyeQ0KPj4+
PiAgKiBvZiBfX3N0YXJ0X3ZwY2lfYXJyYXkgaW4gc2VjdGlvbiwgaXQgaXMgMTYtYnl0ZSBhbGln
bmVkIGJ5IGFzc2VtYmxlciwgdGhhdA0KPj4+PiAgKiBjYXVzZXMgdGhlIGFycmF5IGxlbmd0aCAo
X19lbmRfdnBjaV9hcnJheSAtIF9fc3RhcnRfdnBjaV9hcnJheSkgd3JvbmcsIHNvDQo+Pj4+ICAq
IGZvcmNlIGl0cyBkZWZpbml0aW9uIHRvIHVzZSAxNi1ieXRlIGFsaWduZWQgaGVyZS4NCj4+Pj4g
ICovDQo+Pj4+IHN0cnVjdCB2cGNpX2NhcGFiaWxpdHkgew0KPj4+PiAgICAgdW5zaWduZWQgaW50
IGlkOw0KPj4+PiAgICAgYm9vbCBpc19leHQ7DQo+Pj4+ICAgICBpbnQgKCogaW5pdCkoY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4+PiAgICAgaW50ICgqIGNsZWFudXApKGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+Pj4gfSBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDE2KSkp
Ow0KPj4+DQo+Pj4gLi4uIG9wZW4tY29kZSB0aGF0IGhlcmU/DQo+PiBUaGF0IGJlY2F1c2Ugd2hl
biB1c2luZyBfX2FsaWduZWQoKSB3aXRob3V0IENPTkZJR19YODYsIEkgZ290IGNvbXBpbGUgZXJy
b3INCj4+IHZwY2kuaDoxODoxMzogZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0aW9uIHNwZWNpZmll
cnMgb3Ig4oCYLi4u4oCZIGJlZm9yZSBudW1lcmljIGNvbnN0YW50DQo+PiAgICAxOCB8IH0gX19h
bGlnbmVkKDE2KTsNCj4+ICAgICAgIHwgICAgICAgICAgICAgXn4NCj4+IEkgdHJpZWQgc29tZSBt
ZXRob2RzLCBvbmx5IG9wZW4tY29kZSBjYW4gZml4IGl0Lg0KPiANCj4gV2VsbCwgdGhhdCdzIG9k
ZC4gSW4gZS5nLiB4ZW4vc2NoZWQuaCB3ZSBoYXZlDQo+IA0KPiBzdHJ1Y3QgZG9tYWluDQo+IHsN
Cj4gICAgIC4uLg0KPiB9IF9fYWxpZ25lZChQQUdFX1NJWkUpOw0KPiANCj4gd2hpY2ggY2xlYXJs
eSBtdXN0IGJlIHdvcmtpbmcgZmluZS4gVGhlIGVycm9yIG1lc3NhZ2UgZnJvbSB0aGUgY29tcGls
ZXINCj4gZG9lc24ndCBzYXkgdmVyeSBtdWNoIGFsb25lLiBGb3IgaW5mb3JtYXRpb25hbCBkaWFn
bm9zdGljcyB0aGUgY29tcGlsZXINCj4gbm9ybWFsbHkgYWxzbyBlbWl0cyBtYXkgaGVscCwgb3Ig
ZWxzZSBpdCB3b3VsZCB0YWtlIGxvb2tpbmcgYXQgdGhlDQo+IHByZS1wcm9jZXNzZWQgb3V0cHV0
IHRvIHVuZGVyc3RhbmQgd2hhdCdzIGdvaW5nIG9uIGhlcmUuDQoNCkkgYWRkIHNvbWUgY29kZXMg
dG8gcHJpbnQgdGhlIG1hY3JvIF9fYWxpZ24sIHRoZSBjb2RlcyBhcmU6DQoNCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KaW5kZXgg
NTE1NzNiYWFiYy4uOGY2YWYxYzgyMiAxMDA2NDQNCi0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNp
LmgNCisrKyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCkBAIC0xMywxMiArMTMsMTYgQEAgdHlw
ZWRlZiB1aW50MzJfdCB2cGNpX3JlYWRfdChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5z
aWduZWQgaW50IHJlZywNCiB0eXBlZGVmIHZvaWQgdnBjaV93cml0ZV90KGNvbnN0IHN0cnVjdCBw
Y2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgdmFsLCB2b2lkICpkYXRhKTsNCg0KKyNkZWZpbmUgU1RSSU5HSUZZKHgpICN4
DQorI2RlZmluZSBUT1NUUklORyh4KSBTVFJJTkdJRlkoeCkNCisjcHJhZ21hIG1lc3NhZ2UoIl9f
YWxpZ25lZCgxNikgZXhwYW5kcyB0bzogIiBUT1NUUklORyhfX2FsaWduZWQoMTYpKSkNCisNCiBz
dHJ1Y3QgdnBjaV9jYXBhYmlsaXR5IHsNCiAgICAgdW5zaWduZWQgaW50IGlkOw0KICAgICBib29s
IGlzX2V4dDsNCiAgICAgaW50ICgqIGluaXQpKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsN
CiAgICAgaW50ICgqIGNsZWFudXApKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCn0gX19h
bGlnbmVkKDE2KTsNCg0KVGhlIHJlc3VsdCBhcmU6DQoNCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAu
L2luY2x1ZGUveGVuL3NjaGVkLmg6MjUsDQogICAgICAgICAgICAgICAgIGZyb20gYXJjaC94ODYv
eDg2XzY0L2FzbS1vZmZzZXRzLmM6MTE6DQouL2luY2x1ZGUveGVuL3ZwY2kuaDoxODo5OiBub3Rl
OiDigJgjcHJhZ21hIG1lc3NhZ2U6IF9fYWxpZ25lZCgxNikgZXhwYW5kcyB0bzogX19hdHRyaWJ1
dGVfXygoX19hbGlnbmVkX18oMTYpKSnigJkNCiAgIDE4IHwgI3ByYWdtYSBtZXNzYWdlKCJfX2Fs
aWduZWQoMTYpIGV4cGFuZHMgdG86ICIgVE9TVFJJTkcoX19hbGlnbmVkKDE2KSkpDQogICAgICB8
ICAgICAgICAgXn5+fn5+fg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS94ZW4vc2No
ZWQuaDoyNSwNCiAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL3ZwY2kvdnBjaS5jOjIwOg0K
Li9pbmNsdWRlL3hlbi92cGNpLmg6MTg6OTogbm90ZTog4oCYI3ByYWdtYSBtZXNzYWdlOiBfX2Fs
aWduZWQoMTYpIGV4cGFuZHMgdG86IF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZF9fKDE2KSkp4oCZ
DQogICAxOCB8ICNwcmFnbWEgbWVzc2FnZSgiX19hbGlnbmVkKDE2KSBleHBhbmRzIHRvOiAiIFRP
U1RSSU5HKF9fYWxpZ25lZCgxNikpKQ0KICAgICAgfCAgICAgICAgIF5+fn5+fn4NCkluIGZpbGUg
aW5jbHVkZWQgZnJvbSBlbXVsLmg6ODgsDQogICAgICAgICAgICAgICAgIGZyb20gdnBjaS5jOjE4
Og0KdnBjaS5oOjE1Ojk6IG5vdGU6IOKAmCNwcmFnbWEgbWVzc2FnZTogX19hbGlnbmVkKDE2KSBl
eHBhbmRzIHRvOiBfX2FsaWduZWQoMTYp4oCZDQogICAxNSB8ICNwcmFnbWEgbWVzc2FnZSgiX19h
bGlnbmVkKDE2KSBleHBhbmRzIHRvOiAiIFRPU1RSSU5HKF9fYWxpZ25lZCgxNikpKQ0KICAgICAg
fCAgICAgICAgIF5+fn5+fn4NCnZwY2kuaDoyMjoxMzogZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0
aW9uIHNwZWNpZmllcnMgb3Ig4oCYLi4u4oCZIGJlZm9yZSBudW1lcmljIGNvbnN0YW50DQogICAy
MiB8IH0gX19hbGlnbmVkKDE2KTsNCiAgICAgIHwgICAgICAgICAgICAgXn4NCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSBlbXVsLmg6ODgsDQogICAgICAgICAgICAgICAgIGZyb20gbWFpbi5jOjE5Og0K
dnBjaS5oOjE1Ojk6IG5vdGU6IOKAmCNwcmFnbWEgbWVzc2FnZTogX19hbGlnbmVkKDE2KSBleHBh
bmRzIHRvOiBfX2FsaWduZWQoMTYp4oCZDQogICAxNSB8ICNwcmFnbWEgbWVzc2FnZSgiX19hbGln
bmVkKDE2KSBleHBhbmRzIHRvOiAiIFRPU1RSSU5HKF9fYWxpZ25lZCgxNikpKQ0KICAgICAgfCAg
ICAgICAgIF5+fn5+fn4NCnZwY2kuaDoyMjoxMzogZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0aW9u
IHNwZWNpZmllcnMgb3Ig4oCYLi4u4oCZIGJlZm9yZSBudW1lcmljIGNvbnN0YW50DQogICAyMiB8
IH0gX19hbGlnbmVkKDE2KTsNCiAgICAgIHwgICAgICAgICAgICAgXn4NCm1ha2VbNl06ICoqKiBb
TWFrZWZpbGU6MTg6IHRlc3RfdnBjaV0gRXJyb3IgMQ0KbWFrZVs1XTogKioqIFsvaG9tZS9janEv
Y29kZS91cHN0cmVhbS94ZW4vdG9vbHMvdGVzdHMvLi4vLi4vdG9vbHMvUnVsZXMubWs6MTk0OiBz
dWJkaXItaW5zdGFsbC12cGNpXSBFcnJvciAyDQptYWtlWzRdOiAqKiogWy9ob21lL2NqcS9jb2Rl
L3Vwc3RyZWFtL3hlbi90b29scy90ZXN0cy8uLi8uLi90b29scy9SdWxlcy5tazoxODk6IHN1YmRp
cnMtaW5zdGFsbF0gRXJyb3IgMg0KbWFrZVszXTogKioqIFsvaG9tZS9janEvY29kZS91cHN0cmVh
bS94ZW4vdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MTk0OiBzdWJkaXItaW5zdGFsbC10ZXN0c10g
RXJyb3IgMg0KbWFrZVsyXTogKioqIFsvaG9tZS9janEvY29kZS91cHN0cmVhbS94ZW4vdG9vbHMv
Li4vdG9vbHMvUnVsZXMubWs6MTg5OiBzdWJkaXJzLWluc3RhbGxdIEVycm9yIDINCm1ha2VbMV06
ICoqKiBbTWFrZWZpbGU6NjQ6IGluc3RhbGxdIEVycm9yIDINCm1ha2U6ICoqKiBbTWFrZWZpbGU6
MTQ3OiBpbnN0YWxsLXRvb2xzXSBFcnJvciAyDQptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5p
c2hlZCBqb2JzLi4uLg0KDQo+IA0KPj4+IEFzIHRvIHRoZSBjb21tZW50OiBGaXJzdCwgaXQgd2Fu
dHMgdG8gYmUgYXMgY2xvc2UgdG8gd2hhdCBpcyBiZWluZyBjb21tZW50ZWQgYXMNCj4+PiBwb3Nz
aWJsZS4gSGVuY2UNCj4+Pg0KPj4+IHN0cnVjdCBfX2FsaWduZWQoMTYpIHZwY2lfY2FwYWJpbGl0
eSB7DQo+PiBUaGlzIGFsc28gZ290IHRoZSBjb21waWxlIGVycm9yLg0KPj4+DQo+Pj4gaXMgbGlr
ZWx5IHRoZSBiZXR0ZXIgcGxhY2VtZW50LiBTZWNvbmQsIHRoZXJlJ3Mgbm90aGluZyBoZXJlIHRo
ZSBhc3NlbWJsZXIgZG9lcw0KPj4+IG9uIGl0cyBvd24uIEl0J3MgdGhlIGNvbXBpbGVyIHdoaWNo
IGRvZXMgc29tZXRoaW5nIChpbnNlcnQgYWxpZ25tZW50IGRpcmVjdGl2ZXMpLA0KPj4+IGFuZCBv
bmx5IHRvIGZvbGxvdyBjZXJ0YWluIHJ1bGVzLiAoU2VlICJ4ODY6IGRvbid0IGhhdmUgZ2NjIG92
ZXItYWxpZ24gZGF0YSINCj4+PiB0aGF0IEkgQ2MtZWQgeW91IG9uIGZvciBzb21lIG9mIHRoZSBy
ZWxldmFudCBhc3BlY3RzLikgVGhhdCBpcywgeW91IGRvbid0IHdhbnQNCj4+PiB0byAiYmxhbWUi
IGFueSBwYXJ0IG9mIHRoZSB0b29sIGNoYWluLCBhdCBsZWFzdCBub3Qgd2hlcmUgaXQncyB0aGUg
dW5kZXJseWluZw0KPj4+IEFCSSB0aGF0IG1hbmRhdGVzIGNlcnRhaW4gYmVoYXZpb3IuIFRoZXJl
J3MgYWxzbyBubyBzdHJvbmcgbmVlZCB0byB0YWxrIGFib3V0DQo+Pj4gdGhlIHNwZWNpZmljIGVm
ZmVjdHMgdGhhdCBpdCB3b3VsZCBoYXZlIGlmIHdlIGRpZG4ndCBhcnJhbmdlIHRoaW5ncyBwcm9w
ZXJseS4NCj4+PiBUaGF0IGlzLCB0YWxraW5nIGFib3V0IHRoZSBlZmZlY3Qgb24gYXJyYXlzIGlu
IGdlbmVyYWwgaXMgZmluZSBhbmQgaGVscGZ1bC4NCj4+PiBUYWxraW5nIGFib3V0IF9fe3N0YXJ0
LGVuZH1fdnBjaV9hcnJheSBpbW8gaXMgbm90Lg0KPj4+DQo+Pj4gV2hpbGUgZnVydGhlciBwbGF5
aW5nIHdpdGggdGhlIGNvbXBpbGVyLCBJIG5vdGljZWQgdGhhdCBhZGRpbmcgX19hbGlnbmVkKDE2
KQ0KPj4+IGFjdHVhbGx5IGhhcyBhIG5lZ2F0aXZlIGVmZmVjdCBhcyBsb25nIGFzIHRoYXQgb3Ro
ZXIgcGF0Y2ggaXNuJ3QgaW4gdXNlOiBUaGUNCj4+PiBzdHJ1Y3QgaW5zdGFuY2VzIHRoZW4gYXJl
IGJlaW5nIGFsaWduZWQgdG8gZXZlbiAzMi1ieXRlIGJvdW5kYXJpZXMgKHdoaWNoIG1lYW5zDQo+
Pj4gX19zdGFydF92cGNpX2FycmF5IHdvdWxkIHRoZW4gYWxzbyBuZWVkIGFsaWduaW5nIGFzIG11
Y2gpLiBXaGVuIHRoYXQgb3RoZXINCj4+PiBwYXRjaCBpcyBpbiB1c2UsIHRoZSBfX2FsaWduZWQo
KSBiZWNvbWVzIHVubmVjZXNzYXJ5LiBUaGVyZWZvcmUgSSdtIG5vIGxvbmdlcg0KPj4+IGNvbnZp
bmNlZCB1c2luZyBfX2FsaWduZWQoKSBpcyB0aGUgYmVzdCBzb2x1dGlvbiBoZXJlLg0KPj4gRW0s
IGNoYW5naW5nIF9fc3RhcnRfdnBjaV9hcnJheSB0byBiZSBzdHJ1Y3QgdnBjaV9jYXBhYmlsaXR5
IGFycmF5IGNhdXNlIHRob3NlIGNvbmNlcm5zLCBtYXliZSBrZWVwaW5nIHVzaW5nIHN0cnVjdCBw
b2ludGVyIGlzIGEgY29tcHJvbWlzZSBtZXRob2QuDQo+IA0KPiBJdCB3b3VsZCBiZSBhIGxhc3Qg
cmVzb3J0LCB5ZXMsIGJ1dCBpbW8gKGEpIHdlIG91Z2h0IHRvIHN0cml2ZSB0byBhdm9pZA0KPiB1
bm5lY2Vzc2FyeSBpbmRpcmVjdGlvbiBhbmQgKGIpIHRoZSBzYW1lIHVuZGVybHlpbmcgaXNzdWUg
Y291bGQgYmVjb21lIGENCj4gcHJvYmxlbSBlbHNld2hlcmUgYXMgd2VsbC4NCj4gDQo+IEphbg0K
DQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K


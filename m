Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9EEC8A1CD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172818.1497914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOG0a-0003ai-SI; Wed, 26 Nov 2025 13:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172818.1497914; Wed, 26 Nov 2025 13:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOG0a-0003Yw-PK; Wed, 26 Nov 2025 13:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1172818;
 Wed, 26 Nov 2025 13:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOG0Z-0003Yq-E9
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:56:35 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b752ed3b-cacf-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:56:34 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM8PR03MB6216.namprd03.prod.outlook.com (2603:10b6:8:27::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.12; Wed, 26 Nov 2025 13:56:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 13:56:30 +0000
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
X-Inumbo-ID: b752ed3b-cacf-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhA8xLgzgHi/UBR8u4/uZgjzw7IjhKLI5rLuWzuil5rYs1xO+OdZQ5oOwaExYpRceQaowKTKPPp5yGAcSrgYilnyfTKy7sYEmlfhZS47nlZF77d7d8xSobXBuc7bpZk39JAoI75/P1oUJLpxyHjYZ0YTiQLqf0HqnSXA4Rxax9Y7wjVTqSuaqQ0EtzCXk33b5Hwi7PIOdzagi/9FxZs8Ir1aHMqkbF9/JNoLha7ZXexUlSVUDQejFJlXwfPeD0bMl0UzslEawzySkWY6ZEBPw/mSFZIqmMJPw24tD/07Mesq4J9IiEytMrQA8+HQC/aHh4JS9mwS4RdzKdl1BaHPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93VQO2cOhgeG8fPNlomfUuzlTmlapsYgyTp7wVTLIj0=;
 b=wwYwGP51vPmT4Ch4ybquSvYRtcmTaimqmccHzfDreEM3TjlLdZzbwTCYAih4yiTQpg41o0W/PP+x4vQRlaSQTf9IZKxgTDRTbAdWGlZwpPSp9xcjowm7VVzDQ2LV32Mg8dUBzKhOITi8lRNrv84S6NH0mUrwgxl1THdC7awUtn2gHY7r6+d93k2lVBh7bqIdZWdbYYDfuonwLGa9lL5jCoVZRB70630zEOFDSi/hcBtjDYLiGl8JVmBhpbhQH1dVVoIyUUH36WSuRJ61wx4JDbJJczZART/cupzXHSTCziEHkilFv4ez/bJ70eGxhL+1wD03P33zpgd84laCDcWgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93VQO2cOhgeG8fPNlomfUuzlTmlapsYgyTp7wVTLIj0=;
 b=OISPcv3MDHdhzCcxE+i5n7nOe3KJifzA/w9dRRP6mifnfEJ1sxBeYSVqq09oOHeSgs1aA1htnewnb6Ck5owJcAlLt8gbnjkuldU6Hb4baWHaJms3W1pEh+hOx38NLzNkUV9YfPwORELiHKbuunP7HyD9yQT8ligPDKJv+5jkI/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3c6af7e8-a295-4e80-b99c-075c21632cc2@citrix.com>
Date: Wed, 26 Nov 2025 13:56:27 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH 2/2] x86: move / split usercopy.c to / into arch-specific
 library
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
 <fd3609bd-6259-4336-905b-732a2f171996@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <fd3609bd-6259-4336-905b-732a2f171996@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0147.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM8PR03MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 166ae04d-890f-4351-7924-08de2cf399ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVMzRWNXdk9ESzdzTjZyejNqVk8rREtCK1p2VXhqMkczWS80VEpwdGQyQWNk?=
 =?utf-8?B?YWJsUjdyTWtsR01aSDJLTlRUNXB3SjFRWUhuY3R5Uzd3Z0xtWkRLeFlsRWdJ?=
 =?utf-8?B?MXI0VVExdTc3WDBTa1pweVJ0bjN3WnVJRUZKV2d0bXFpQng5V0wwTERRTmF5?=
 =?utf-8?B?cmFwdk9JSlpqOUJ6V21UdHFuNU9SWE9OUmNTTzRZZWxxNkd5QW0xTHZuV2VZ?=
 =?utf-8?B?L0RoYnV1MmI2RDk5dGF6MUdHNGFxc0JHMnE0bElwRHRVWStIWTgzbkozNVpU?=
 =?utf-8?B?TlY1RUgzV3dLZmdhMllUWlRqVVErUzIwYzhnK2NSd2FoMS9kazgrMVRDMVcv?=
 =?utf-8?B?Y09VQnFKdFB2R0c5WHFBbWppcTZ0T0VQd3FIbklrVnlBNnRjU2tDUzFpbnd0?=
 =?utf-8?B?eUk3UXFVK0tMa0VTS213Y28yU2l1a25SNXpvc1NySVhDYzNYK005TDZiMTl4?=
 =?utf-8?B?by9QOHlQeWZxWTdvMGFoa3pKQndGVmNtcDRoVHVCdm5yL3FVVDR2cWdVQTJk?=
 =?utf-8?B?WU9DUHZyRS8rRnFwVkwvdFNoSFFJVER2SU1aYW9vYUEvU2tlWFZ5a3VxeVFI?=
 =?utf-8?B?UUpYQzlRd21FRmNQZDEwZVNVc0l5Q2xUb1gvek1QczNKajdqTHdPRUtOdmpW?=
 =?utf-8?B?NzdFZGdCa2hYZU5WaGdZM3ZVTHprT1Rza3lpUXNFMXd3NVVZc3lVd1VwbDl0?=
 =?utf-8?B?TUdNVDk2U2hpL1ZIT0hEcE1Pbm4rTEJtRzI2ZHlBYVc4U3k2dVRGNmxxVU93?=
 =?utf-8?B?dmVvVlR5L2tuMkVyVG0vbkJVTHM2bnIxam0veTdlbTUyRzBycVpKd3J3U1hY?=
 =?utf-8?B?MitHT3B1MTRVdktBTGx4ZTVqYjlyRVdRYzVmYkh2VEdjSENrNXFJT1dFYjRK?=
 =?utf-8?B?TzNvYmV1WmxoTzZQNmZMSmZjN2xYTnhOVlJsSG54V2o3MkZBZ085VU9JbWxw?=
 =?utf-8?B?SEhCRVBDMkdlWkhKSzNYcHpFUHpEdUJRQm9FdjRkWXZXb0VGcGNCYjhCTnVE?=
 =?utf-8?B?SGRhckZTRWpLeVY1cXZsL0RUQVM1MGhoTHFiOUp0QUpVaTcrY29tOWVBY0RQ?=
 =?utf-8?B?dEhjTWZ4Sm9LV0JqRk8vMGZZaFFveHFORENmODBCRmZZdk9qM2Y0QkgrUEVQ?=
 =?utf-8?B?Vi9WZk92UkhoWDB4bGQrU0JsYlVOQUFjTmdrb1VGQkljdXhnVzhrNEFLUERT?=
 =?utf-8?B?aW1sMW1vRUlzbzZJaytBazJ2VTNiSDEwQVBqN0xYZ0JPMUlSTlhDcjVoZ25G?=
 =?utf-8?B?N09MdVoyQ0IrN1UyOUttbkJUUjA5K3d1RXJjRUZRYS8xSmlEc2hZWjZ2SFVa?=
 =?utf-8?B?eW9uWE1aM0N5Zkh6RVJCeDJRc1hTZjBDNUJJcEhqQmFHNlhBdzhmdVdtY2FT?=
 =?utf-8?B?cFBrMkYxL2pZS0FnT2lIV2hQSzNwVXQ1K2VPb3VZcElCRENLcUpET0RQaGEv?=
 =?utf-8?B?RHAzMm1VYlAxdE9PcmFtaFVxWllmM2kvZU90VVZKZjRKcUFRdXVKVVo4QmU5?=
 =?utf-8?B?b1hBVFo5Z054VnF0dWJHUXloNlV1KzJwcjBWTFYxeHhHc3ZhZnVnU0lvUDhk?=
 =?utf-8?B?cHJyMjlSdnEremtOWXFXbEJFOGt5OFk2N1lwZ3BBOG11ZE9nMTEzT0dRVEdu?=
 =?utf-8?B?aXNFdlZ5eXNnaVo3b2lMcEp5aThxbE11OCt2NkJTVFYrUDg1dDZCY0NiSE9N?=
 =?utf-8?B?aDZEY2JkaWZUMmNvZmNGbU01aFNwL09sM2JIS2NOSkNldTRkOFU3K2xRejhB?=
 =?utf-8?B?YkEvRFhyYW5KRmI2Zk9Tb2pkbXFWRUFNaGw5SHpuMmRCVTlnUTlRcTdBekxX?=
 =?utf-8?B?YWtoeG0ydmtHbWZONktENkZ3d3k0VlhpcFNXM3pqbmhLYVphU2N3YS85ZkVn?=
 =?utf-8?B?QnZ1cjZQK01EdG9JTXVUNjdjdG9PN2RYQi9EcmhmaitodFFnOHNjRkNaV1dn?=
 =?utf-8?Q?cnpnrBqMilYQ7X7rwFId2fKr8mh8r3iY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3FDb1pOSE9MQVNuS3RjcE1tVXFTSysvZUhqK04wcjZLRGIrcWxtdnAzeXo5?=
 =?utf-8?B?R0N3TWNDcmJPdzFqWXVNS3pRb1ZMajZ4NkxlSFp6MXg5eGU1TlpNZGI5bkh1?=
 =?utf-8?B?cVhUVnJEZEtHVVBtb0NReFhlNENCSWRCZzRxS2JodWE5eHRMMVpJT0lqa3Bl?=
 =?utf-8?B?c21EWGZKMDBLNjYrSVBtOHBLQXZZNlN3OTZYWGdNd0JOS2plazdqYUF1eTYr?=
 =?utf-8?B?TkZ0VW5FT1ZHUDQzbCttV3RtNGdNU2Q3amdJS29Gd0htdzI2cGcrOHBKbFV2?=
 =?utf-8?B?UjJ1d2RYOENxZ2Jza3ZIdEEvVzVTbWsyTURkODJSbkFSSnY4eHR1YStucW9L?=
 =?utf-8?B?QVBvZmlRMXFLTFRaK0RHcEtlZ2xXK2svOTlCVWhSdmM0RkJKMFVkWFpOd2hz?=
 =?utf-8?B?V1Z3Ym1KVDZ0bUttdXc0RXhQZlJCSFo4dmhidFV2SzZidVNCSWlMUnpJYk9w?=
 =?utf-8?B?ZGNNZDZGMmVXekJPUmhreUEzS05SZ1FXVm9PUTlzeVVSL3pWMG9Eb1VoY0ZY?=
 =?utf-8?B?a3RTVklBc2NEQ0Z1WmppUXhKTDdidGtlUzNnQTZTOU1TNndUZXJWZEFHN0JJ?=
 =?utf-8?B?b0d4Y0VvQkdVbVBGdVNmWWMxSWJoQXp1dlRpeTArNXJVU2xaN2NxT0hUWm8r?=
 =?utf-8?B?Vnp1Q3dxbWhEaXVPOEpWVW1QaUJ3V3lnMG1YaTg2ak02STBCQlN0clJWenBV?=
 =?utf-8?B?V2lUa01hNUhuQlM3K2hlaHd1V1Z0QXl6eUpXNUZlWThOWDlyWllQOTFXNStt?=
 =?utf-8?B?K2hqZ25mUlVkZGtTTWxnOU4wbllyblBJKzk4L3V1RStWczFBMHdib1NRTFFs?=
 =?utf-8?B?Mm9iR0o3OXhVT0grUHdIK3JQT3VHZk9ZbTBzK3NkUUNwOTFOQkVySit4VmVv?=
 =?utf-8?B?TjYrbExNTG44a0RITlhySDdxQjZqTlVZOHc3a2pScGU5RUR6clNmZlNhb2ZF?=
 =?utf-8?B?bzhZYkhqandWK3FEM3YxeHkrdE4xeFkySnZIcStRNjVCVTNSaGlqUEVYR3Q2?=
 =?utf-8?B?TW1nMnRKMjZLbTEwSEtaL3EzRkYzVjRzMTNTVzRKZ3BjcmE0MzdRcnlGSmtn?=
 =?utf-8?B?MEdJUWo3clBRR3U0YkdjK0Rwd0hxOU03czlqcFFmblpuWTBobllYczYzTHdo?=
 =?utf-8?B?TnhJcVdReXZuUWR5ZGt0VU9mYkRMc0FmM05ZNS9yRC94bDJLY2pQaE8rRkhk?=
 =?utf-8?B?bW1GaU4wRjB3b3kxVVY5Szc3YmFMK25aelJiZ3RYYzR4RTNJSi9RUVpMOHNh?=
 =?utf-8?B?TVJvSDVLdTVJVzBNTEQwMzEzM1dOM00rd09URytOMlZZaDZDaEZSNlFuL2tP?=
 =?utf-8?B?MlUzempxdnlkcnpzUmxlV3RJdVNmK3NxYW5RM2VEa1hDMXB3ZC9iSEpPVnhl?=
 =?utf-8?B?MXpNZzJhdC9GYlBkNnhKUHNBdmtJVE5iMXFBZjBDZ2tPSUFHci9EdE43ak9z?=
 =?utf-8?B?VzlaUHpYQWNZUU5vRC9CREx0Zjl2ZHAxQjFDcFRMRjY0byt4dnNObDJTcnVa?=
 =?utf-8?B?WElJZ2pCeTRvYlYrZUZWMS9laktrTnBtdE13NjE0all6TXdRQUEzcmE3NWVN?=
 =?utf-8?B?K2tDMVNBSVM0R3puU25yY0xsYnd4a1lRNWtrM3V2eUdtRjltVmlUTEgwVVZS?=
 =?utf-8?B?OGJjd1hkaVdxOWJqZU1EZ1I4ZmdRMEMxaEtvcWJvd0FKNHBqM3g3emJ2Q09V?=
 =?utf-8?B?dktVcmxOVWdvMFhTYVVpcjB6SlR1RXNhaXBFL2srNmpZdGYrcEJSUzhyQ21K?=
 =?utf-8?B?eVdYRnVuWm5xSFFoNzFmZm04OVJ2SnNzWHlyK2I5bDVQSkRBRFNnV05QSGRu?=
 =?utf-8?B?MFFta3dVV1J5dUp6T1hOeWc4UDJ1L3RLTFBSTS9ldG9JTit0N055cUlsQ2o5?=
 =?utf-8?B?T0YvdkJDeVJqMXhBMmxtOHUrMk1lYmJSUmlxTHkrbXZ5U251SHozQ0w1bG1H?=
 =?utf-8?B?bUhYRTRYaVhFMXNSbk9IL2ZONzAwYXc1M2pvUDR5R2Qyd0hYYXMxcjRLYnBY?=
 =?utf-8?B?REl0cnlhZ01rQXR2dXFscEtyYlFnMlBGTTNROXRxQ0hQdVlialRkNTlKbmh1?=
 =?utf-8?B?VTRTTkRicko5QldsREVLTHRKc1pycktxWDZGb1lGeFdsd2tjUGdFR3Y0RVd3?=
 =?utf-8?B?QlgrTkM4YUJhdUJKNlA3a1dmNXJJeURxMzZRZUdoOUs4TFhobzE3bElPYysy?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166ae04d-890f-4351-7924-08de2cf399ca
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:56:30.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJTp3ZYrvPn7iD1ADH6PcuV0KrxKO0L909dNKbjc5UcQYBamCnpn56G3NtV2uxztCx53ANX+0tRLrLTdBFmdzFAdT+z8mjsipwAQ8U3RDgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216

On 26/11/2025 1:24 pm, Jan Beulich wrote:
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 61e2293a467e..76540d77e55f 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -72,7 +72,6 @@ obj-y += time.o
>  obj-y += traps-setup.o
>  obj-y += traps.o
>  obj-$(CONFIG_INTEL) += tsx.o
> -obj-y += usercopy.o
>  obj-y += x86_emulate.o
>  obj-$(CONFIG_TBOOT) += tboot.o
>  obj-y += hpet.o

There's

# Allows usercopy.c to include itself
$(obj)/usercopy.o: CFLAGS-y += -iquote .

which looks like it wants moving too.

But, given that this presumably compiles, doesn't it mean we've got a
search path problem anyway?

~Andrew


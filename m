Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zwuZKD6HT2pliwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:34:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BA173067C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:34:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=Ev9lEgwG;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357995.1612295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whn0y-0005ZZ-BP; Thu, 09 Jul 2026 11:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357995.1612295; Thu, 09 Jul 2026 11:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whn0y-0005Y5-7C; Thu, 09 Jul 2026 11:34:00 +0000
Received: by outflank-mailman (input) for mailman id 1357995;
 Thu, 09 Jul 2026 11:33:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whn0x-0005Xy-0L
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:33:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whn0w-00DOmn-C5
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:33:58 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f8722-e002-0a2a0a5209dd-0a2a4507aba6-30
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:33:58 +0200
Received: from [52.101.83.103]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f8725-9c8e-0a2a45070019-3465536760b3-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:33:58 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS4PR03MB8460.eurprd03.prod.outlook.com (2603:10a6:20b:51b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:33:56 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 11:33:56 +0000
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
 b=oMFBaY9wN5ZuFpndd3fftTQd8O8gyNTvsx34lcZa71uViXg5OyjrWAUKG0CIzjV+9GQTAkO0zJs55P0A8eVx6Zez76aFeWX20+TCNGYz+LWO/YU7IW6WETobR2/SCJvZc+/C0DeTa7RwzQ62Riawz557R2a2gvADP1HyByH3ImwXen2o1hJtnmcx2e+2sM75sZOAMeNxiT8QZPXX3sB+Nbj5uBY8HXcMXMMg07sS3gFX7FuVM9kzCkFd1nzP/DnahIx1AkwsAqiWCqPpxj+PAmCqIY26f1U4s9Ui6isCwdpxin2eIkAif4mWlryp28VudKK3Cw7ECNR/1k46tx4QHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=On/+6T5e7fGEGXhL0HOug9LevHHShkMwKJfWSqo7x8w=;
 b=g8qUwwizT2dfKPnJLXPHwBDHJadR7+6fBsOV5spauOcan3SoCaNE/KsGeswNNhKmNj+p2d0kVXOejTMfkDz1D1Em+z9rn7jMYoyohcuVW4iNEjRUkuGcBk/8aIY/D/x4+KzJ7ySSJDPfBM8OQsKkKLpY6/3cds2vubV6DHcRk9GfQwE2kAeA9tPzSvYPyV2uprtImhCswjdDAR90/1rD7kr5EDfyrCQsLI9L+x7vGDI3SaZHjp9IWNk4H9VTZxjr6aKdeC44+/dUgsrY0KBeVamzAsnMkL1L2zmf6tZpr13UUFIpuuadYUOYF0LEhMwMXygANklMz3J4Ac0XFXJ4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On/+6T5e7fGEGXhL0HOug9LevHHShkMwKJfWSqo7x8w=;
 b=Ev9lEgwGD0P9mO8twqM2uGf1LtiCycGsH/x9GYKPQ6m8TSL9WCQAqclTeRSdIjFp6cqpdQjYuRgwPiQirZLxt9H8NWboWtzVU2v1D58uymqQwzPofFc5EF1R1CU6sGHHOL2L2lV0t6Vjd+Tuwbra2rQGrCHwEVvJXK0HFUmcL7HoVmzs7+9rwDVYyfmcQ2KLf+ezRpPjLFgmwH3vX3v9h+vS6ncz9+D9qV/H4PrhgBabdwyL8rHJNi5lcirfuMmyowvSul0vcgVvPKgGcDVW2u9WlQYpsMoZ3+iW7ZY6Do7I26bJVEq9pOb98eSIHfAc/gHg07nhU0e6ednIvWoIFg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Index: AQHcyEeH3FAPJgz8C0q4McY6u5ZElbXXzxqAgHMEWQCAGq9yAIAADjEAgAAMAIA=
Date: Thu, 9 Jul 2026 11:33:56 +0000
Message-ID: <3c6a807d-6c5f-483a-8887-e91c992139bd@epam.com>
References:
 <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
 <3b2daddd-9afc-4c75-92c0-f7c6ace3f735@suse.com>
 <d6dcde3d-99eb-4fa3-9078-a13e35c8a1b4@epam.com>
 <b0738b79-2a9f-4571-8465-bfb00123300f@epam.com>
 <fc7508e4-2170-4928-9fca-060d7c6f4863@suse.com>
In-Reply-To: <fc7508e4-2170-4928-9fca-060d7c6f4863@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS4PR03MB8460:EE_
x-ms-office365-filtering-correlation-id: b05c60dc-408b-4bbb-beca-08deddadf60d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|42112799006|1800799024|38070700021|22082099003|18002099003|4143699003|6133799003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 UWGzDmjONzpT3nmHBo4BHwvduoNFO3YPNlKOEDcDNGMiYvW+p4ZVwI+crcPxz337rc/l82liOmSZ3ttv6iQuem9NF/mSxeX5xfOVVq7Ay97POPLQp0WT1vweyy0tVAZinBeMCxVdZL0LgNjry+ki8XKPO/piSm+8ZpWuQg/aQV24DYalATKbQxEKZzSJUzcek3Fnv07EPcUXih0kPkMWpx1stHL557ugx/vc5Za5iRRJArIVEQ/cMKzHD5ZL5h6DFTiLkMHGZIjlmPJBiihsaonDr1SmAa9UUro6jggtcng0U04YDyGrD5MMmL+fUMMgML3VeCu1zipihugobMB1uzg+Iz+XRat517OKKESk1kBZov9GqskexDh8dsQKWr2QZ/xZA8Wxh1bTLYYJ20fk5PQCVIareGSXcMcqDbSZ9y95tV4cDnh8CA28axpWLx1cd00x1iNsmZZSvG4QBacCVLYR9l5qtpAg16A1XKT+Xkp+GsPB7VOl7Mxh8b/mzJqfyBQi3vYmLSGI6TfSY9JOnpeIa7D52J9jPAK+SR/SrIjPmrmkySwQD7q3jlLDigCQU7CKcqe4ohhxHN0EXCITQCvApOUsSVQ4oLui2YsLfJSkqXzjD6aSanWSME52pEmT9+z/IJTrU66yYa5Q/i71YVQrFL057oZ0PbqSaUPiaaTK7YixwEXikzUvVfbBEyodrdZSaBdqYa24wOriNKzeug==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(42112799006)(1800799024)(38070700021)(22082099003)(18002099003)(4143699003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjRMYUFENXRqQlZOMGNEOGx2TkxPMFZGUGJUZFJaVEdMRGdGbkFFWmVjZTFX?=
 =?utf-8?B?T3VpekxBTldwNm5FSUFVU1VZcktXdE5ybEhMTG5QbGY4ZEpEVkUweGg0RlRz?=
 =?utf-8?B?dERpQ0thdzc2ZkRWRFVjWU5WK3ZKV09ZSkZOWHAyNVVPanFyT21wczRJbFNT?=
 =?utf-8?B?a3VTeXllaTVtbEdhWGJacWZoSjNWdVJDdWRpeEJkclFvKy8wMjVwOVZHT3Yz?=
 =?utf-8?B?VnRsdEk2VTIwZ1RyRk9STjM4RzVBTnJCTVdDWmxaVWVKZ2FScEJWK2tnbEFS?=
 =?utf-8?B?dE1rVHVlVSs5TEQyRWtrZTM2b3dEL3JPVDJHY0NjL21xcHg4Yy9DRzJneEFW?=
 =?utf-8?B?MkRveEtnblA5cFVPa2ZtdmF1NG9NbWhqb294NkU4dXJGb01naGJUb2huTWVj?=
 =?utf-8?B?aWQ5Q3hCZmY3ZjRpSVF4NDNVeDBOQ2h0V1ZoVXVpL0xuaHZ3Vk5XWmhKK21N?=
 =?utf-8?B?cyszRHpBc1pJcWxQSWdsZ2puM0ExZzFtVWFhQ1hhVktnTmRHMmdvSG9MYTVI?=
 =?utf-8?B?ZkhNUHc1WGdpL0R6MXQ4M1dQV2tFZzR3VCtuMExNSEdjWVJXL1hBNjNhTWJn?=
 =?utf-8?B?RjU3a1Npb1B2VTdReHJDNFRHam1jNjVVRGhKKysxb2J3b241bndtUjVCMkkw?=
 =?utf-8?B?NjZBVHl1TGRBVDRlR1VZbzcxQ0QzZkRPWENyajhnbDBadjZFNHVyMkp4dXRC?=
 =?utf-8?B?Y3V1MEN5NEd6MzJMVEhxU0ZWS1RhTzlwbnFSdys0V1VtTkx5WGtyelJJU3U4?=
 =?utf-8?B?Qjl2dzZ4K095Q3B5ODBjN3d2VExRQ2dUeUhoWDlsQnh0Yk8yQkNqQWNta3FX?=
 =?utf-8?B?cHhlQjN1NWhWYnp6MlMvZ2N6dHJrR3p4S3V4elRBbUFqRmpoSktaV1BtL0xT?=
 =?utf-8?B?RWswZDFSWitRelZ1QVd5NFhqRXhaSEVZamVSWEFWaGFlTHlqd1FOM3RHemM5?=
 =?utf-8?B?S3Z1Q3B2ckUwQkgwVmQyMnZMZ1RzY0plK0ZxbVNwTFVEcXR1YTZUZm82RXQz?=
 =?utf-8?B?TEl4V3VCc3BDUUpQUVlaYlVqL01GbDZ3UnRsUWx5Q1dqcytFczQwUzhmRjAz?=
 =?utf-8?B?aEQveDVTWjN2dXhzaUVFdTcyYWJvT0hKTm8rdzN4Vmk0L0RnczlQdWJFbnkz?=
 =?utf-8?B?M3pGWUllSkhwZFB0OWtiRHNTd1M3bUEyWEFOT0tvcy9hc0xVck5wRVVlQjRK?=
 =?utf-8?B?S3czaEJlcmFDb3B6ZXdLbGpqUlhNTGJWaWFBUlRGN1JvemZHdnhXeGxGQm1a?=
 =?utf-8?B?TUVQNUpXdEVxY0ttR1B0WFhXdy83UGt2WjRQNTJRYlYwM2xXYm1QUGNYRG1H?=
 =?utf-8?B?d0UyTDdxbFI0YitMUitreXR2ZTlJQ2tnbG9jVllFR1hTeUVWeHhJM3N5aDJt?=
 =?utf-8?B?SHFmbm80TXQwaDVFV0hYVnQ3LzlYMWlHb24xOE43RjlObDBDeStOMzVxd1BK?=
 =?utf-8?B?aUxzWXFtVURoR0hJQ3preURoMzlWYkZ0c3VuV0trOXNkaHMyRjdYSURTMGVq?=
 =?utf-8?B?S0xRa0pnbzZqNDNZYzBJQy9wZGFteGFjdDExcmRMMGh2SXQyaCswbUgwU2dz?=
 =?utf-8?B?T1J6V2ZGeTkzTkQ4dnNjcWp1aUx5ZWlwNkVuTkZXOEcrb2d2bThkaUJIV01n?=
 =?utf-8?B?aU1tZ254UU01SHhtWWVJeGttT1M4TkxFL3JTVXFaYlZBTE1sVWsrcDRvcmFR?=
 =?utf-8?B?MEJPZUZDSXZ3M0pMZzl0dHhtUmxxWmxieXN5OXRkOENCSWFyTHlZZXoyeHRF?=
 =?utf-8?B?UVF6YUlrK0pRU0dad3V4Nm5kYnVDUk9BSklianJ5RHR4cDNQTUhLak9aU29p?=
 =?utf-8?B?RnZrQktPNXBVdXZ4QTk4ZU8xTFFzRGxIVnFMell5SG9Rdjk2dnVaSGlKb1pY?=
 =?utf-8?B?czRsREc1VDhpVVRUUTBGOWlTZzNMa3Q4dk9HUzNHMUY4VHMvTmpQUFNuNjg5?=
 =?utf-8?B?bDR3UFJFNGlDMElUZGcwYTRQVmtmblBSZTBoNEptclhNcE95Uk55ZFR6U1Qz?=
 =?utf-8?B?Qzl5ZjJpdk5MNzR5QlZTSmxSQjRyc1dQaUcvc1NyVmdPVmQ4Q3dpMHFQQlRG?=
 =?utf-8?B?Y1NrMHFJL1BaSUZnSFVHeWlIcjJPYzdvUm15SU9iNjAySUw4TUViLytuTEV6?=
 =?utf-8?B?TUFxZ3lGSkFCZmZ5TVRMQ2pjWEVFWUVTZ0FJY3RMbXVrRzJZNFQwckp2T0pF?=
 =?utf-8?B?MEEwYnYvNWoxR2FGZW5GeUxxN3MyU0Q5TEpTb3NJWmd5L3FGTGRsNlpqL2h2?=
 =?utf-8?B?RG9GRW9xYW5ROXhod1E4SnUvcFhOMnI4NXBxaXZsMWRwYnc5NndQWmtnMWp5?=
 =?utf-8?B?bUNyMlFlMnBOOE0rUzk0SjczMDNFY2FBcmtRTkc1Z2xtOGR0T2k0NEZUTWpl?=
 =?utf-8?Q?WderIK69xeLoqoHM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A68074EE4B07F4C84D3B483B2B8A555@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05c60dc-408b-4bbb-beca-08deddadf60d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 11:33:56.0302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KrOhJkR9xRGatTz+lXYPijfDjtujAqqczVzZ5jr8BZ+aldl2THj4jOs+WS7YphV6PuT6s3OcHfM9szkb+qHQ2+ErVaPrS5BccH+9TDoSiXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8460
X-purgate-ID: tlsNG-ef75cf/1783596838-7D92225E-79B2A72D/0/0
X-purgate-type: clean
X-purgate-size: 4188
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:from_mime,epam.com:dkim,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04BA173067C

DQoNCk9uIDcvOS8yNiAxMzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA3LjIwMjYg
MTI6MDAsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+IE9uIDYvMjIvMjYgMTM6MjksIERt
eXRybyBQcm9rb3BjaHVrIHdyb3RlOg0KPj4+IE9uIDQvMTAvMjYgMDk6MDQsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+PiBPbiAwOS4wNC4yMDI2IDE5OjM3LCBEbXl0cm8gUHJva29wY2h1azEgd3Jv
dGU6DQo+Pj4+PiBNSVNSQSBDIFJ1bGUgMi4xIHN0YXRlczogIkEgcHJvamVjdCBzaGFsbCBub3Qg
Y29udGFpbiB1bnJlYWNoYWJsZSBjb2RlIi4NCj4+Pj4+DQo+Pj4+PiBJbiBjZXJ0YWluIGJ1aWxk
IGNvbmZpZ3VyYXRpb25zLA0KPj4+Pg0KPj4+PiBDYW4geW91IGdpdmUgYW4gZXhhbXBsZSB3aGVy
ZSAuLi4NCj4+PiBJZiBDT05GSUdfVk1fRVZFTlQgaXMgZW5hYmxlZCBvbiBBUk0uDQo+Pj4+DQo+
Pj4+PiB0aGUgZnVuY3Rpb24gJ2FsdHAybV92Y3B1X2lkeCgpJyBpcyBkZWZpbmVkDQo+Pj4+PiBh
cyBhbiBpbmxpbmUgZnVuY3Rpb24gdGhhdCBjb250YWlucyB0aGUgJ0JVRygpJyBtYWNyby4gVGhp
cyByZXN1bHRlZA0KPj4+Pj4gaW4gYQ0KPj4+Pj4gdmlvbGF0aW9uIGJlY2F1c2UgdGhlICdCVUco
KScgbWFjcm8gbWFrZXMgdGhlIGZ1bmN0aW9uIG5vbi1yZXR1cm5pbmcuDQo+Pj4+Pg0KPj4+Pj4g
VG8gZW5zdXJlIGNvbXBsaWFuY2Ugd2l0aCBNSVNSQSBDIFJ1bGUgMi4xLCB0aGlzIHBhdGNoIHJl
bW92ZXMgdGhlDQo+Pj4+PiBpbmxpbmUNCj4+Pj4+IGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGFu
ZCBpdHMgQlVHKCktYmFzZWQgdW5yZWFjaGFibGUgY29kZS4gSXQgaXMNCj4+Pj4+IHJlcGxhY2Vk
DQo+Pj4+PiB3aXRoIGFuIHVuY29uZGl0aW9uYWwgZnVuY3Rpb24gZGVjbGFyYXRpb24gZm9yICdh
bHRwMm1fdmNwdV9pZHgoKScuDQo+Pj4+DQo+Pj4+IC4uLiBhIGRlY2xhcmF0aW9uIGlzIG5lZWRl
ZD8gVGhlIHNvbGUgbm9uLXg4NiByZWZlcmVuY2UgSSBzZWUgaXMgZnJvbQ0KPj4+IFllcywgZGVj
bGFyYXRpb24gaXMgbmVlZGVkLiBUaGUgZmlsZSAnY29tbW9uL21vbml0b3IuYycgY29udGFpbnMg
YSB1c2FnZQ0KPj4+IG9mIHRoZSAnYWx0cDJtX3ZjcHVfaWR4KCknIGFuZCBjb21waWxlciBtdXN0
IHNlZSBpdCB0byBhdm9pZCAiZXJyb3I6DQo+Pj4gaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24g4oCYYWx0cDJtX3ZjcHVfaWR44oCZIi4NCj4+Pj4gY29tbW9uL21vbml0b3IuYywgYW5k
IHRoZSBzb2xlIHJlbGV2YW50IEtjb25maWcgb3B0aW9uIEkgY2FuIHNwb3QgaXMNCj4+Pj4gVk1f
RVZFTlQuIFdoZW4gdGhhdCdzIG9mZiwgdGhlIGZpbGUgd29uJ3QgYmUgYnVpbHQgYXQgYWxsLg0K
Pj4+IEJ1dCB3aGVuICdDT05GSUdfVk1fRVZFTlQ9eScgdGhpcyBmaWxlIGlzIGNvbXBpbGVkIG9u
IEFSTS4NCj4+Pj4NCj4+Pj4gRnVydGhlciwgQlVHKCkgYW5kIGEgZmV3IG1vcmUgY29uc3RydWN0
cyBoYXZlIGEgZGVkaWNhdGVkIGRldmlhdGlvbg0KPj4+PiBhbHJlYWR5IGluIHBsYWNlLiBJIGRv
bid0IG1pbmQgYSB1c2VsZXNzIGZ1bmN0aW9uIHRvIGJlIHNocnVuayAob3IsIGFzDQo+Pj4+IHBl
ciBhYm92ZSwgcGVyaGFwcyBldmVuIGRyb3BwZWQpLCBidXQgdGhlIGp1c3RpZmljYXRpb24gdGhl
biBuZWVkcyB0bw0KPj4+PiBiZSBkaWZmZXJlbnQuDQo+Pj4gV2VsbCwgd2l0aCBTdGVmYW5vJ3Mg
Y29tbWVudCByZWdhcmRpbmcgcmV0dXJuIHR5cGUsIHRoZSBjb21taXQgc3ViamVjdA0KPj4+IGFu
ZCBtZXNzYWdlIGNvdWxkIGJlIHJld3JpdHRlbiBsaWtlOg0KPj4+DQo+Pj4gZ2VuZXJpYy9hbHRw
Mm06IGFsaWduIGFuZCBzaW1wbGlmeSBhbHRwMm1fdmNwdV9pZHgoKQ0KPj4+DQo+Pj4gVGhlIHJl
dHVybiB0eXBlIG9mICdhbHRwMm1fdmNwdV9pZHgoKScgaW4gdGhlIGdlbmVyaWMgYWx0cDJtLmgg
aGVhZGVyIGlzDQo+Pj4gY3VycmVudGx5ICd1bnNpZ25lZCBpbnQnLCB3aGljaCBpcyBpbmNvbnNp
c3RlbnQgd2l0aCBpdHMgJ3VpbnQxNl90Jw0KPj4+IHJldHVybiB0eXBlIG9uIHg4NiBhbmQgdGhl
ICdhbHRwMm1faWR4JyBtZW1iZXIgb2YgdGhlIG1vbml0b3Igc3RydWN0dXJlcy4NCj4+Pg0KPj4+
IFRvIGZpeCB0aGlzIHR5cGUgaW5jb25zaXN0ZW5jeSBhbmQgc2ltcGxpZnkgdGhlIGhlYWRlciwg
dGhpcyBwYXRjaA0KPj4+IHJlcGxhY2VzIHRoZSBzdGF0aWMgaW5saW5lIGltcGxlbWVudGF0aW9u
IG9mDQo+Pj4gJ2FsdHAybV92Y3B1X2lkeCgpJyAoY29udGFpbmVkIGEgQlVHKCkgc3R1Yikgd2l0
aCBhIHNpbXBsZSBmdW5jdGlvbg0KPj4+IGRlY2xhcmF0aW9uIHJldHVybmluZw0KPj4+IHVpbnQx
Nl90Lg0KPj4+DQo+Pj4gRm9yIGFyY2hpdGVjdHVyZXMgdXNpbmcgdGhlIGdlbmVyaWMgYWx0cDJt
LmggaGVhZGVyIChzdWNoIGFzIEFSTSB3aGVuDQo+Pj4gQ09ORklHX1ZNX0VWRU5UIGlzIGVuYWJs
ZWQpLCBjb21tb24gY29kZSBjYWxscyB0byAnYWx0cDJtX3ZjcHVfaWR4KCknIGluDQo+Pj4gY29t
bW9uL21vbml0b3IuYyBhcmUgZ3VhcmRlZCBieSAnYWx0cDJtX2FjdGl2ZSgpJywgd2hpY2gNCj4+
PiBzdGF0aWNhbGx5IHJldHVybnMgJ2ZhbHNlJy4gVGhlIGNvbXBpbGVyJ3MgRENFIHdpbGwgb3B0
aW1pemUgb3V0IHRoZXNlDQo+Pj4gY2FsbHMsIGF2b2lkaW5nIGFueSBsaW5rZXIgaXNzdWVzIGZv
ciB0aGUgbWlzc2luZyBkZWZpbml0aW9uLg0KPj4NCj4+IEhlbGxvIEphbiwNCj4+DQo+PiBraW5k
IHJlbWluZGVyLiBQbGVhc2UsIHRha2UgYSBsb29rLg0KPiANCj4gSSBkaWQsIGJhY2sgdGhlbiBh
bHJlYWR5LiBObyBzcGVjaWZpYyBxdWVzdGlvbiB3YXMgYXNrZWQgZm9yIG1lIHRvIGFuc3dlciwN
Cj4gc28gSSB3YXMgZXhwZWN0aW5nIGEgcmUtc3VibWlzc2lvbiwgYWxsb3dpbmcgdG8gc2VlIG5l
dyBkZXNjcmlwdGlvbiBhbmQNCj4gY29kZSBjaGFuZ2VzIHRvZ2V0aGVyLiBUaGF0J2xsIHRoZW4g
bWFrZSBpdCBlYXNpZXIgLyBtb3JlIG5hdHVyYWwgdG8NCj4gY29tbWVudCBvbi4NCj4gDQo+IEph
bg0KDQpBY2suDQpJJ2xsIHN1Ym1pdCBhIG5ldyB2ZXJzaW9uLg==


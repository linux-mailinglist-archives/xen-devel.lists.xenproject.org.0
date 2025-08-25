Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F05AB33BFB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092864.1448480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTwe-0000re-Ru; Mon, 25 Aug 2025 09:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092864.1448480; Mon, 25 Aug 2025 09:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTwe-0000pv-P3; Mon, 25 Aug 2025 09:56:56 +0000
Received: by outflank-mailman (input) for mailman id 1092864;
 Mon, 25 Aug 2025 09:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS3=3F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqTwd-0000pp-B0
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:56:55 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1790df3-8199-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 11:56:49 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM0PR03MB6146.eurprd03.prod.outlook.com (2603:10a6:20b:145::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 09:56:46 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 09:56:46 +0000
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
X-Inumbo-ID: d1790df3-8199-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtNE77vmLuJ0iBpbgAM2zNALkFg3JB6T8ah7kgmum86fiK0iRs+n1kR5nGxATkKh7nw+glhoSURgqldqxacJD//+lJJmQzmwnItKK3Z1icTcoZafBJFXA55n7avM14ndhd1XUE6fxxueFjxvVCE+RNRfHbVHOw4zW59Uec3YglA4BH0bz6wKUL59iywN4/wgKsvlteyZ463TQqK4a3PbCjmthFW6cQfe7IYZyLY2R4xImvCh9R3yueRXJH1xDsTt2zvv2D+jSlEnDU4cT5tgrYNqRc29uW0OfrnZw6xo7lpoYuBTTFDU8kvOgaRJWTdnJHJivluFOczUP6gGPgVgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7LHE8R+NRn6nA6086+NvLSBSdkIk3irEvPuc0vAdQ0=;
 b=ul+t2dlMugnaZI4/7DdhOmak/X6OjMVwApES40jq0uHkn6wPF5kmRAHFb2lNvTFizvFaN/VLJKZzy7iFvuLqO1yFavQuxDTKJ1+Yx/GOQ7Q2KHleKIyaUSY3Gr7RpdHSoXNY2/sLPmn9ZDO8mFdZb5i58vktCYRl5P7Fy8OAkIAZI1PcEEIgZO6DrKrbPGbGuBmf26n1KY6tODjE92aWrmlzTX9WL+21deuajbe/K9NWDXHSmMJzR3A1OU2avfOFrqOajR7nDzNkj+kTMttuqdIsApTUsPZ/H6RzNAeFh+cxuzav+Xam7ZcMdRLE0WnvS8R8NqFZN1WtszYVH+BJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7LHE8R+NRn6nA6086+NvLSBSdkIk3irEvPuc0vAdQ0=;
 b=GlioH/dC0tbHAbDuQcJyh70iuktG9yxu1A04ocOKGfhFJJ7Fdvml7QJkGJ/AcpiXL9616CitVG3QLckrczyJrXopI8dcxC4OPqFRT5EvA3JigxeUSMaX2DXPEbwmfta1GtF7wNj5HDV0H0GOe/uVx8H3Lr8OaULC8fRDkza4+2R2y/Ldu2GOtssMBDep8OtYKpMkLG5K7/+NYLHyJNNZhbvSzhq8PcCkoQDY8Ca/s2gAg4u4DiJpNCkszop4u3xmzjknccB42yugfSYiDqAzCirNbd0td9F6OYITRBKgX7ERy7XIpLhxwNyjrgjpmMtTgbcaCWIHImvEAYQpFwYKpQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index: AQHcFQc77bBOPokbA0m9oV6J6fEgkLRx7dcAgAE1O4A=
Date: Mon, 25 Aug 2025 09:56:46 +0000
Message-ID: <4f0a8c69-b801-4dd3-b706-bd9fb30d4cd0@epam.com>
References:
 <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
 <7d0b9e8e296ea07b966832b9a047baa7@bugseng.com>
In-Reply-To: <7d0b9e8e296ea07b966832b9a047baa7@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM0PR03MB6146:EE_
x-ms-office365-filtering-correlation-id: 33d5d8e8-17cc-4cdb-88dc-08dde3bdb3e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|42112799006|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dk5ydHFLSmtFREc0ZFcxcldTR2xSajhQU2I3TkJsNXd1U2thdTE1MTE0Q3px?=
 =?utf-8?B?N0o3a2g1N0hqNmp5bWNLN1IrbmpLVkVUOVRxZHFhcmg1MlY2cW5ySFoyRmwy?=
 =?utf-8?B?N0Z4Yjl2OFBGL2dOKzZmY0xzeHlsR1l1M010OGhyQ1VPVlZPM0hZbFowR0xF?=
 =?utf-8?B?aDlYZzhpYk40a0JRZ3BPdlkweGVJRENEUnJWUU1INEFjRGxOZmlqMk9zcHlD?=
 =?utf-8?B?dUZucEdyc3NCSTZYV3pnK3I0Z1kxb3ZFam45Si8wZmpMaWtCTEozclhrU2Fr?=
 =?utf-8?B?Y3BYWEZ4dmJiOTYwM2NkanlGVFlmMDBRTDllUlBpLzZGYkJ1R2I0MXcxZ3Rn?=
 =?utf-8?B?enV3azVGRG9XdHUzcFA4TS85aHVZVzZBVEpad054RlhmTExDS0ZpbXFXSGdm?=
 =?utf-8?B?eGJpcWR0VGl2QmtmREN5TnNHZDNIOXo2T0dkRENsY041NkJwV000Smt5UHRY?=
 =?utf-8?B?VWJ6a1RyWGxMYVh6dFRhdlIrZ0MwVDhzQlhNU0lQMVlMeUpPNHZjQW0rdFlw?=
 =?utf-8?B?Z09aeTNZb2dQbUhYY0dVT3NVb3VoNC9YZXZPc0JjY1U2c2d3R0RSMnpPbGRp?=
 =?utf-8?B?Yk1LQys1b3E1WFdtaGFWK3dpMWwwcnVCTUIyOGVsQzR2azgzS2lIMDUvbXoy?=
 =?utf-8?B?bm4zRW1MUXg5L2N1RElSRUNRSFNNWHQ1dS91SFNCTk5JS0l1enpDdXdCTWsr?=
 =?utf-8?B?dGNESHFHSHdzQlBxN3dlQW0rNjNEamtnL0J6S2ZWMXlsSEo5aFNxOUhXSUZi?=
 =?utf-8?B?Ny9DN2wraTM4REFTOWJndjQ2ZUJUWFJkSzloWVFET2Z3cXc5MVgyaStMZmox?=
 =?utf-8?B?Vk5HdHE0S0RjRWZySDhQN1RJOTdnWWRTbldpTUorV0tvWmhpN3lZaGxQbkRa?=
 =?utf-8?B?Zlc3cWV6eVhCUmFKQXgxUzlQV2htb25yeHJRQS9NY0d1eVpsT09JRGlLSzRn?=
 =?utf-8?B?S1R0OWpnYWlHd0Y4czUrQUxmemErT0Q1Mm5HTEVXc0ljMWRSN3dHMkxBVC9o?=
 =?utf-8?B?NFlxalBQYVdmSEJQS1hrNG5DOVVTNW5pOThsblBSd2J3VE45SzdWSUZLWW55?=
 =?utf-8?B?UDdJc0MyUDFvWUdOTzhLd0g1MzBZaHVrQm1NaXVjMGxhR2l6czZUTGVpNlJs?=
 =?utf-8?B?eGoyMDJWbllJYmxhNUxLU1VzcVhzODNvNEc0ZG42S0N0dVEyeVBTUGU4bGlT?=
 =?utf-8?B?c2xCZ1dZNVpSSHc0OVc3ekNIZkJLV0RCNERTUnZpVE02UVRkTzlGbTU1Rzd2?=
 =?utf-8?B?elluVTIxd3FPb3NmN0JkdkJMMXkwR1FtcSsxZWhYNGJwSFZEamxYZ1JlRlRM?=
 =?utf-8?B?N2FCejd4dlZOV1VYYTZvRTJYQTRFL3hXN2RDdDVyNEkxN2xuNzhjTWg4YmUw?=
 =?utf-8?B?d3lkNUI0ODhsNTk1eHVYQjVpZk14TkExWUUvN3lQNDlYQ0lkbkpTS0w0Zllz?=
 =?utf-8?B?cFNkU0s3dnowSHBldWxiTzNTc2ZwVWd0YWg1czJ4YmU4MVd6NUkrMXVoTThl?=
 =?utf-8?B?eUZvbEdRV0p5R2RvdUJmUW1UTm1nTmZrNHNpRDc3aktTVzFBTjFLZExhU1Qx?=
 =?utf-8?B?aElCNUJhYW92d2JQTTUvWWV4SXBaTDI2Z2hoU2I5Tzg0VnJsMmhRdFdQRmN1?=
 =?utf-8?B?eUlqWkJoTURaYVZjZlM4TGZNc2ljdHZvcCtaOTVTOWZhblNOazdzOHVvdmlv?=
 =?utf-8?B?VmNvWWtRNXBleHdvVExLWlVIUndaeS9uWU4rM1hWMzkySjVmTUlFcnMwbnhR?=
 =?utf-8?B?UFYrcWV5K3R3bHRaMVRxQzZ1QVZ0RU1ZTlh1Qk5rZWkrcGx2M09WUlo2YzJh?=
 =?utf-8?B?M3dRYTVLZ2M0bElnUTBxaUM4ZXVxWjFXZ1RGcTR6RWR5SDNpdGJNUU91WDgv?=
 =?utf-8?B?YlpmUzRnUWhGaytDSGEwbGpGZ0tYRkJNd0l1NXBOZ1E0VnFlK1VCRkZKQmFw?=
 =?utf-8?Q?TsyGRw3zAXo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(42112799006)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDk3ZlI4QVF1ZnZaYkhFUGZnWHA0dS90Ym4rTVlxVkV4VGcxVTRQdzJHY28w?=
 =?utf-8?B?elppN2d3Z0dvaFI5WThiUGNnUFQzM1pmNk5JN2s4WVV2REsya0hRTWpPRlZD?=
 =?utf-8?B?TDRlQkV0NW9BZWNFOGxZVitFUnA0M1F4OU0wd0dWelNIMm9QR056WE1OdjVi?=
 =?utf-8?B?bUV5UlhMTEJ0eTE3VHE2dEt5NUIwN0kxNjgvdVRmVXFlbUdxbW9SZ0RkSFBv?=
 =?utf-8?B?bFFCdUZURFd1WGpReDdWVElKLzVzUDdTTDBiSllra1Z5UlczYVVlUjJCcTk5?=
 =?utf-8?B?ZFA5dkNEV0Z0bHpCZC9ZeExMZ2F3c082THh4Ti96UW5hWHQxdjFsZ0Rld2p0?=
 =?utf-8?B?WDc5ZG8zNThhbGNEYjNYeFl1Qm95bkxuL2dPb3loeEJnMHBVT1BzR1dhZjVI?=
 =?utf-8?B?REQvcUNNMjkwdVE3cXpkakJmc2pKRGJZUERZZ0NPa1lmNXpVTzNMckxUOUZ1?=
 =?utf-8?B?cFFJcGd6U1hBSFV4bk1yVGF0U2NDOElkbm45V3NLQmhTNHBOTDY1SkFiK0po?=
 =?utf-8?B?eXdUb1hKYS9HdjRmOHozQU5NQVZLaXFjdG1IYm5HQWdoWEZ2N2lXdlJkYzlE?=
 =?utf-8?B?dm5ra0s5RTg3Sy9La1h5Z01CR0dVUFYybFN2WFZnNUJESkIxTTRvVnQxUHI1?=
 =?utf-8?B?UUZpSGJ1Wk9hWm9qUW9CRExMY0IzTnVIZzhBc0VZb1MxdHR6ZHZVd3Y0bkhl?=
 =?utf-8?B?M2RBU0tNN2RPTmc0QVVRWFYyV0hlL0ZHeEhzNTJLbnRPL0pqdXhFb3NOWFdt?=
 =?utf-8?B?K2k3am5Hdlp0M0NiREs5THhTUzVtbDJ3MVIycGt1Y3N6VEwyVUVyVmIwY1JE?=
 =?utf-8?B?cmRIdVE5S1ZDL3JRaUhKbVl6Z2dReVM5bTdyakVvdHRJNDJTa3FXQSt2dmd4?=
 =?utf-8?B?MlpZbHpxeG5VeE92MnAyMWhMRUxIU2hxczROTjg0V25LbFZuQUdoSUF6UGJ2?=
 =?utf-8?B?SU5naENLeXVhcWxuT242V0NiOGM1RmFGWWIwUC9RUVMrVjdYNXJiVlduSE1h?=
 =?utf-8?B?ekU1d0ZOQkVrQkRQbGV3TS9LcDFNWG91bFVYczE0MGdCcDN4c1ppb2NlbHlB?=
 =?utf-8?B?MTArdFpGQlVpK2lON2tDWEVSYXoya0NsOE5kNHk2QzA3VzlORVVzQk96aWln?=
 =?utf-8?B?a2hNbklxa3ZHTW1ZRGNDQWZrMDlQNVI1T3BCVVRLQjNoUkZMRUxIa2xuTmI4?=
 =?utf-8?B?Q2JaaGExdUdLbitDKzNBUW9Ud3RObys0U3BEQjBzVUVaeUJXL2M0MDhkQU9Q?=
 =?utf-8?B?amNoajF2ZG9UUFlFQ1c2S0wxc0NWOXRFVlhpRkxGY212MmZwbzJoU2Z0aFBo?=
 =?utf-8?B?eVFCOFlHQVJKaVNwTzFaV1FDdmFCSjgvWVVSMk4wUk91dUlIQkg3K1dCZ241?=
 =?utf-8?B?NEh6R2RVd1dOOWRNNElhOW9DaEVLZmhMVkdoUTNWMjI5Z2EvRjV3a0lJV0dt?=
 =?utf-8?B?TVBjMVg0YWw4T2M3T1cvTEVxWkg0T09LWml5ZS80VGJVcTRrS1BQeGpyM2tZ?=
 =?utf-8?B?TXBWeUpqSEdKeFBaYS9Ndm9NVWhFUUpjV1lpbTRBMi9xZDNISWdPN2kwZTNX?=
 =?utf-8?B?TXJuVjFQUFl0RUMrT25KN0FUd0xwK2h4Nmdya3FRdTkreGhKV05BYWZOVzN1?=
 =?utf-8?B?S1NFSzdDbmo4OXJpVktSK0xmQTlxaVFnYUZzcy9HOHhJSmcvK1FrNXJuVy9j?=
 =?utf-8?B?MHJDZjByRGFTa0xqZ3RBVkVSellSYjVzdjdmSVFSTG9WaCtXMHgrZXVuQXNR?=
 =?utf-8?B?YjRGU2Q5VklpRzVEdkZnWnMvMHRtWXM3ekpWd0N4WHhZMTlPVzNrYmM4NVlE?=
 =?utf-8?B?Rld5a0hlcjNXZHgwdStuME5lcElyLzVwZ2hJUTVXV3gzY3EyaVN5MVVnYnJN?=
 =?utf-8?B?aXpIWXRsNU52VWdodHhzOFRhd0RKRnNPbUpZVFhwWStxN1BzUDlvRWxabksw?=
 =?utf-8?B?RDBKSlRjK1k0QUZKWFVlVGYwT3BkeXgra0UzUjBLZEFpTVZhZ0k1d3BQV2hF?=
 =?utf-8?B?dlJwU1pWS1Y0S05XbW0vdmxxb0RSL1RSMVBnSDBxUkh3NlJQWDMvK1VaNzN4?=
 =?utf-8?B?aHliTnJqSHZwTEpJTFdLSHJWRDhQdDBla3lLZm53RG84T1JIVkU2Q3p0V0hr?=
 =?utf-8?B?R0ZqaXlXOTgyQUZiRFRmNFdjVFNKODBGNnVOTkRMcHpHVnVaZFVRTkliMk8z?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <145E7DDEFF5F534B81558D050C82393F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d5d8e8-17cc-4cdb-88dc-08dde3bdb3e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 09:56:46.2850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CxdYndt6Vyxg6MXzfOHWtmzBB2gSyEcYpe5OnRnO4LXRJG9rhTAmqzAOR6kG3fbyWFHc/lBjKe+Oy1+uLCwh69DP/pMLpnd9FU7QQ6OtymQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6146

DQoNCk9uIDgvMjQvMjUgMTg6MjksIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA4
LTI0IDE2OjU2LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBDIFJ1bGUgMi4x
IHN0YXRlczogIkEgcHJvamVjdCBzaGFsbCBub3QgY29udGFpbiB1bnJlYWNoYWJsZSBjb2RlIi4N
Cj4+IEZ1bmN0aW9ucyB0aGF0IGFyZSBub24tcmV0dXJuaW5nIGFuZCBhcmUgbm90IGV4cGxpY2l0
bHkgYW5ub3RhdGVkIHdpdGgNCj4+IHRoZSAnbm9yZXR1cm4nIGF0dHJpYnV0ZSBhcmUgY29uc2lk
ZXJlZCBhIHZpb2xhdGlvbiBvZiB0aGlzIHJ1bGUuDQo+Pg0KPj4gSW4gY2VydGFpbiBjYXNlcywg
c29tZSBmdW5jdGlvbnMgbWlnaHQgYmUgbm9uLXJldHVybmluZyBpbiBzcGVjaWZpYyBidWlsZA0K
Pj4gY29uZmlndXJhdGlvbnMgZHVlIHRvIGNhbGwgdG8gJ19fYnVpbHRpbl91bnJlYWNoYWJsZSgp
JyBpbiB0aGUgZXhwYW5zaW9uDQo+PiBvZiB0aGUgbWFjcm8gJ0JVRygpJzoNCj4+IMKgLSBmdW5j
dGlvbnMgJ2dpY3YzX2RvX0xQSSgpJyBhbmQgJ2dpY3YzX2l0c19zZXR1cF9jb2xsZWN0aW9uKCkn
IHdoZW4gdGhlDQo+PiBjb25maWcgQ09ORklHX0hBU19JVFMgaXMgbm90IGRlZmluZWQsIGl0IGlz
IGludGVudGlvbmFsbHkgdXNlZCB0byBjYXRjaA0KPj4gYW5kIHByZXZlbnQgYW55IHVuaW50ZW5k
ZWQgZXhlY3V0aW9uIG9mIGNvZGUgdGhhdCBzaG91bGQgb25seSBydW4gd2hlbg0KPj4gSVRTIGlz
IGF2YWlsYWJsZTsNCj4+IMKgLSBmdW5jdGlvbiAncHJlcGFyZV9hY3BpKCknIHdoZW4gdGhlIGNv
bmZpZyBDT05GSUdfQUNQSSBpcyBub3QgZGVmaW5lZCwNCj4+IHRvIHRyaWdnZXIgYW4gZXJyb3Ig
aWYgQUNQSS1yZWxhdGVkIGZlYXR1cmVzIGFyZSB1c2VkIGluY29ycmVjdGx5Lg0KPj4NCj4+IFRv
IGFjY291bnQgZm9yIHRoYXQgaW4gc3BlY2lmaWMgYnVpbGRzLCB1cGRhdGUgdGhlIEVDTEFJUiBj
b25maWd1cmF0aW9uDQo+PiB0byBkZXZpYXRlIHRoZXNlIHZpb2xhdGlvbnMuIFVwZGF0ZSBkZXZp
YXRpb25zLnJzdCBmaWxlIGFjY29yZGluZ2x5Lg0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1
azFAZXBhbS5jb20+DQo+PiAtLS0NCj4+IFRlc3QgQ0kgcGlwZWxpbmU6DQo+PiBodHRwczovL2V1
cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz8gDQo+PiB1cmw9aHR0cHMlM0El
MkYlMkZnaXRsYWIuY29tJTJGeGVuLSANCj4+IHByb2plY3QlMkZwZW9wbGUlMkZkaW1hcHJrcDRr
JTJGeGVuJTJGLSANCj4+ICUyRnBpcGVsaW5lcyUyRjIwMDA3Mzg2ODImZGF0YT0wNSU3QzAyJTdD
ZG15dHJvX3Byb2tvcGNodWsxJTQwZXBhbS5jb20lN0MwODQzN2EwNGY2OTA0MzZhYmNlMTA4ZGRl
MzIzMTYwZCU3Q2I0MWI3MmQwNGU5ZjRjMjY4YTY5Zjk0OWYzNjdjOTFkJTdDMSU3QzAlN0M2Mzg5
MTY0NjIwMjE5NDEwMjMlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9u
UnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJ
c0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPU1WNmx1VGV0aDNyb3NpczFkQzJr
dlZ2R0JFVlNrT3p5UUdlOUhEV2Z0YU0lM0QmcmVzZXJ2ZWQ9MA0KPj4gLS0tDQo+IA0KPiBodHRw
czovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz8gDQo+IHVybD1odHRw
cyUzQSUyRiUyRmdpdGxhYi5jb20lMkZ4ZW4tIA0KPiBwcm9qZWN0JTJGcGVvcGxlJTJGZGltYXBy
a3A0ayUyRnhlbiUyRi0gDQo+ICUyRmpvYnMlMkYxMTExOTIxMjk5NCZkYXRhPTA1JTdDMDIlN0Nk
bXl0cm9fcHJva29wY2h1azElNDBlcGFtLmNvbSU3QzA4NDM3YTA0ZjY5MDQzNmFiY2UxMDhkZGUz
MjMxNjBkJTdDYjQxYjcyZDA0ZTlmNGMyNjhhNjlmOTQ5ZjM2N2M5MWQlN0MxJTdDMCU3QzYzODkx
NjQ2MjAyMTk3Mjk2NSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25S
eWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lz
SWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9SjFHTmRySUcxQXBxSU9xc1N5eWdT
WmJVJTJCM0glMkJGdkhaS3h0Qk1nejJDWFklM0QmcmVzZXJ2ZWQ9MA0KPiANCj4gQnVpbGQgZmFp
bHVyZSBoZXJlDQoNClJlc3RhcnRlZCB0aGUgZmFpbGVkIGpvYi4gRmluaXNoZWQgc3VjY2Vzc2Z1
bGx5Lg0KDQpEbXl0cm8uDQo+IA0KPj4gwqBhdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xB
SVIvZGV2aWF0aW9ucy5lY2wgfCAxMSArKysrKysrKysrKw0KPj4gwqBkb2NzL21pc3JhL2Rldmlh
dGlvbnMucnN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDEzICsrKysrKysrKysrKysNCj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9k
ZXZpYXRpb25zLmVjbCBiLyANCj4+IGF1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9k
ZXZpYXRpb25zLmVjbA0KPj4gaW5kZXggN2YzZmQzNWEzMy4uMzM2YWVjNThjMiAxMDA2NDQNCj4+
IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0K
Pj4gKysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNs
DQo+PiBAQCAtNDEsNiArNDEsMTcgQEAgbm90IGV4ZWN1dGFibGUsIGFuZCB0aGVyZWZvcmUgaXQg
aXMgc2FmZSBmb3IgdGhlbSANCj4+IHRvIGJlIHVucmVhY2hhYmxlLiINCj4+DQo+PiAtIA0KPj4g
Y2FsbF9wcm9wZXJ0aWVzKz17Im5hbWUoX19idWlsdGluX3VucmVhY2hhYmxlKSYmc3RtdChiZWdp
bihhbnlfZXhwKG1hY3JvKG5hbWUoQVNTRVJUX1VOUkVBQ0hBQkxFKSkpKSkiLCB7Im5vcmV0dXJu
KGZhbHNlKSJ9fQ0KPj4gwqAtZG9jX2VuZA0KPj4NCj4+ICstZG9jX2JlZ2luPSJUaGUgJ0JVRygp
JyBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQgaW4gdGhlIA0KPj4gJ3ByZXBhcmVfYWNwaSgp
JyBmdW5jdGlvbiBpbiBzcGVjaWZpYyBidWlsZCBjb25maWd1cmF0aW9uDQo+PiArKHdoZW4gdGhl
IGNvbmZpZyBDT05GSUdfQUNQSSBpcyBub3QgZGVmaW5lZCkgdG8gdHJpZ2dlciBhbiBlcnJvciBp
ZiANCj4+IEFDUEktcmVsYXRlZCBmZWF0dXJlcyBhcmUgdXNlZCBpbmNvcnJlY3RseS4iDQo+PiAr
LWNvbmZpZz1NQzNBMi5SMi4xLHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYW55X2FyZWEoYW55X2xv
YyhmaWxlKF54ZW4vIA0KPj4gYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluX2J1aWxkXFwuaCQp
KSYmY29udGV4dChuYW1lKHByZXBhcmVfYWNwaSkpKSJ9DQo+PiArLWRvY19lbmQNCj4+ICsNCj4+
ICstZG9jX2JlZ2luPSJUaGUgJ0JVRygpJyBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQgaW4g
DQo+PiAnZ2ljdjNfZG9fTFBJJygpIGFuZCAnZ2ljdjNfaXRzX3NldHVwX2NvbGxlY3Rpb24oKScg
ZnVuY3Rpb25zDQo+PiAraW4gc3BlY2lmaWMgYnVpbGQgY29uZmlndXJhdGlvbiAod2hlbiB0aGUg
Y29uZmlnIENPTkZJR19IQVNfSVRTIGlzIA0KPj4gbm90IGRlZmluZWQpIHRvIGNhdGNoIGFuZCBw
cmV2ZW50IGFueSB1bmludGVuZGVkDQo+PiArZXhlY3V0aW9uIG9mIGNvZGUgdGhhdCBzaG91bGQg
b25seSBydW4gd2hlbiBJVFMgaXMgYXZhaWxhYmxlLiINCj4+ICstY29uZmlnPU1DM0EyLlIyLjEs
cmVwb3J0cys9e2RlbGliZXJhdGUsICJhbnlfYXJlYShhbnlfbG9jKGZpbGUoXnhlbi8gDQo+PiBh
cmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfaXRzXFwuaCQpKSYmY29udGV4dChuYW1lKGdpY3Yz
X2RvX0xQSXx8IA0KPj4gZ2ljdjNfaXRzX3NldHVwX2NvbGxlY3Rpb24pKSkifQ0KPj4gKy1kb2Nf
ZW5kDQo+PiArDQo+PiDCoC1kb2NfYmVnaW49IlByb3ZpbmcgY29tcGxpYW5jZSB3aXRoIHJlc3Bl
Y3QgdG8gUnVsZSAyLjIgaXMgZ2VuZXJhbGx5IA0KPj4gaW1wb3NzaWJsZToNCj4+IMKgc2VlIGh0
dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vPyANCj4+IHVybD1o
dHRwcyUzQSUyRiUyRmFyeGl2Lm9yZyUyRmFicyUyRjIyMTIuMTM5MzMmZGF0YT0wNSU3QzAyJTdD
ZG15dHJvX3Byb2tvcGNodWsxJTQwZXBhbS5jb20lN0MwODQzN2EwNGY2OTA0MzZhYmNlMTA4ZGRl
MzIzMTYwZCU3Q2I0MWI3MmQwNGU5ZjRjMjY4YTY5Zjk0OWYzNjdjOTFkJTdDMSU3QzAlN0M2Mzg5
MTY0NjIwMjE5ODk4MjElN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9u
UnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJ
c0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPU4yaTJ3aWdVM29sOE0yRHNZaGI4
RGN3ckl2eVlFaGxiUXJsYU1sWW9XSnclM0QmcmVzZXJ2ZWQ9MCBmb3IgZGV0YWlscy4gTW9yZW92
ZXIsIHBlZXIgcmV2aWV3IGdpdmVzIHVzDQo+PiDCoGNvbmZpZGVuY2UgdGhhdCBubyBldmlkZW5j
ZSBvZiBlcnJvcnMgaW4gdGhlIHByb2dyYW0ncyBsb2dpYyBoYXMgYmVlbiANCj4+IG1pc3NlZCBk
dWUNCj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0IGIvZG9jcy9taXNy
YS9kZXZpYXRpb25zLnJzdA0KPj4gaW5kZXggMjExOTA2NjUzMS4uOTZlYjIwMjUwMiAxMDA2NDQN
Cj4+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+ICsrKyBiL2RvY3MvbWlzcmEv
ZGV2aWF0aW9ucy5yc3QNCj4+IEBAIC05Nyw2ICs5NywxOSBAQCBEZXZpYXRpb25zIHJlbGF0ZWQg
dG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4gwqDCoMKgwqDCoMKgwqAgWGVuIGV4cGVjdHMgZGV2
ZWxvcGVycyB0byBlbnN1cmUgY29kZSByZW1haW5zIHNhZmUgYW5kIA0KPj4gcmVsaWFibGUgaW4g
YnVpbGRzLA0KPj4gwqDCoMKgwqDCoMKgwqAgZXZlbiB3aGVuIGRlYnVnLW9ubHkgYXNzZXJ0aW9u
cyBsaWtlIGBBU1NFUlRfVU5SRUFDSEFCTEUoKSBhcmUgDQo+PiByZW1vdmVkLg0KPj4NCj4+ICvC
oMKgICogLSBSMi4xDQo+PiArwqDCoMKgwqAgLSBUaGUgJ0JVRygpJyBtYWNybyBpcyBpbnRlbnRp
b25hbGx5IHVzZWQgaW4gdGhlIA0KPj4gJ3ByZXBhcmVfYWNwaSgpJyBmdW5jdGlvbg0KPj4gK8Kg
wqDCoMKgwqDCoCBpbiBzcGVjaWZpYyBidWlsZCBjb25maWd1cmF0aW9uICh3aGVuIHRoZSBjb25m
aWcgQ09ORklHX0FDUEkgDQo+PiBpcyBub3QNCj4+ICvCoMKgwqDCoMKgwqAgZGVmaW5lZCkgdG8g
dHJpZ2dlciBhbiBlcnJvciBpZiBBQ1BJLXJlbGF0ZWQgZmVhdHVyZXMgYXJlIHVzZWQgDQo+PiBp
bmNvcnJlY3RseS4NCj4+ICvCoMKgwqDCoCAtIFRhZ2dlZCBhcyBgZGVsaWJlcmF0ZWAgZm9yIEVD
TEFJUi4NCj4+ICsNCj4+ICvCoMKgICogLSBSMi4xDQo+PiArwqDCoMKgwqAgLSBUaGUgJ0JVRygp
JyBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQgaW4gJ2dpY3YzX2RvX0xQSScoKSBhbmQNCj4+
ICvCoMKgwqDCoMKgwqAgJ2dpY3YzX2l0c19zZXR1cF9jb2xsZWN0aW9uKCknIGZ1bmN0aW9ucyBp
biBzcGVjaWZpYyBidWlsZCANCj4+IGNvbmZpZ3VyYXRpb24NCj4+ICvCoMKgwqDCoMKgwqAgKHdo
ZW4gdGhlIGNvbmZpZyBDT05GSUdfSEFTX0lUUyBpcyBub3QgZGVmaW5lZCkgdG8gY2F0Y2ggYW5k
IA0KPj4gcHJldmVudCBhbnkNCj4+ICvCoMKgwqDCoMKgwqAgdW5pbnRlbmRlZCBleGVjdXRpb24g
b2YgY29kZSB0aGF0IHNob3VsZCBvbmx5IHJ1biB3aGVuIElUUyBpcyANCj4+IGF2YWlsYWJsZS4N
Cj4+ICvCoMKgwqDCoCAtIFRhZ2dlZCBhcyBgZGVsaWJlcmF0ZWAgZm9yIEVDTEFJUi4NCj4+ICsN
Cj4+IMKgwqDCoCAqIC0gUjIuMg0KPj4gwqDCoMKgwqDCoCAtIFByb3ZpbmcgY29tcGxpYW5jZSB3
aXRoIHJlc3BlY3QgdG8gUnVsZSAyLjIgaXMgZ2VuZXJhbGx5IA0KPj4gaW1wb3NzaWJsZToNCj4+
IMKgwqDCoMKgwqDCoMKgIHNlZSBgPGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vPyANCj4+IHVybD1odHRwcyUzQSUyRiUyRmFyeGl2Lm9yZyUyRmFicyUyRjIy
MTIuMTM5MzMmZGF0YT0wNSU3QzAyJTdDZG15dHJvX3Byb2tvcGNodWsxJTQwZXBhbS5jb20lN0Mw
ODQzN2EwNGY2OTA0MzZhYmNlMTA4ZGRlMzIzMTYwZCU3Q2I0MWI3MmQwNGU5ZjRjMjY4YTY5Zjk0
OWYzNjdjOTFkJTdDMSU3QzAlN0M2Mzg5MTY0NjIwMjIwMDY2NjYlN0NVbmtub3duJTdDVFdGcGJH
WnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lK
WGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNk
YXRhPWZUMUlNMGJuc3Q5JTJGa0oyckk3R2lNUmtiV0pWRyUyRiUyRkQlMkI4MnozUURWeUQ5cyUz
RCZyZXNlcnZlZD0wPmBfIGZvciBkZXRhaWxzLiBNb3Jlb3ZlciwgcGVlcg0KPiANCg==


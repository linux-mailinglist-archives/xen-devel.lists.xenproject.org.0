Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655EFC55ABA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 05:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160626.1488703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJP87-0001eE-VT; Thu, 13 Nov 2025 04:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160626.1488703; Thu, 13 Nov 2025 04:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJP87-0001bL-S4; Thu, 13 Nov 2025 04:40:19 +0000
Received: by outflank-mailman (input) for mailman id 1160626;
 Thu, 13 Nov 2025 04:40:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWJc=5V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJP86-0001aT-Dg
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 04:40:18 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d96fe2c9-c04a-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 05:40:16 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB9274.namprd12.prod.outlook.com (2603:10b6:8:1a9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 04:40:10 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%3]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 04:40:10 +0000
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
X-Inumbo-ID: d96fe2c9-c04a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQSUXrPs/TNqq4X2krFwKD0RzO2JtB8wusqMzF0qDc02sHDLltewy8TVeceRKYQtibCOlvWLa2DRgVfb4GtN4ozXLZDwpAbcOqEgwCe4WRWWg5NY2u6t5uSamtwzanE81g0kMqWJoFtOWkSL64cF6Kuy5ixiW70ttJKi5EYZvZAXFi6pfYlvsiccCnADnceXRGZewlEfqngqMRcKTXrrEnMuCvuLxQxNYiw5kEIHq2Qbhf++35WyBA330cRuFRXhQbNWygyvSFAXi6SZKxEaZfs40K/XoA215fmBDbkgEymuMTwYcMzlLmwAOObztZaQx9IOwwZfepIAdFevofgVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flpKEo+6p4kKoWbZSNSUB7qhP02KSIoHgKhxRIxqGgU=;
 b=ZyZ/+jDpvU8cd4bZ2jcuOrgOJzXUfcaOwGSVFArCiLXDsAe6P06Xgtktb14degM+2/kwBw2ajlGKGGKw8K0dsR1OBFWSoO8qSQwYPbMB41v6xkU+3Bb9KGDJv9C0OvgRn0VFQ7kKrJNsX3TUq1E1fspo9tpX7n+w/u39bQWyltGoEjCmijIUewpxyFaPwOWX6FXkoeCgSDmph1Xqb/hIpsu+fii2Vyto27QtqFycKmxhO4oCksbhVyh1EZ8zOwKPwwor3g1w/aeqGCWFdY6K+FpYMfaM0yzU4koz2d8Z9CAJ0AR4s4a5w/mFmB5GF+1RReNjVpVL1zYcrWLOb431dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flpKEo+6p4kKoWbZSNSUB7qhP02KSIoHgKhxRIxqGgU=;
 b=rnLqOovJzeorIh6ZQR8k6acBJGYzGjVAdlzFbQM6uGeyq2rlYJMx34LeIPYj4Lajj0LN8jCCfHhHJvO3UbgndCioXensXnOCPJjUM7Cngsfo9+lpYctMoapx6LSGco3ogqQNbFDMtVUTYvcuuyt7EJF5FqzDTjE0z1cywaaNyCU=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcPCqOfEVt2Jk05kOchIzPOp9r0LTavU6AgBVxtTA=
Date: Thu, 13 Nov 2025 04:40:10 +0000
Message-ID:
 <DM4PR12MB8451CF3CD3A8ED2D80B8275AE1CDA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-16-Penny.Zheng@amd.com>
 <8c74774a-458b-4918-8d65-fcb3eacfe98b@suse.com>
In-Reply-To: <8c74774a-458b-4918-8d65-fcb3eacfe98b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-13T04:39:44.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB9274:EE_
x-ms-office365-filtering-correlation-id: 239e164a-9958-4780-ccef-08de226ebac3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QnlnQkZhcVhPRGU3NHZDVDB3QlZoSHJiTkZyWUlIMllhdXJ1QmVlaG9tVHF5?=
 =?utf-8?B?L2tiQnk2Slc2R2w2R2JyU3liazhnRVhSV1cyNVNzQ0tCOWZPZE81b3RBMzFa?=
 =?utf-8?B?MzBLL1BYSGVuVzBPTUg4MXo2d3IzTzVhRmQvS1BYb1YrQWxGU21acW0zTmZL?=
 =?utf-8?B?aDNrTlk0NmpXdDdsVmptOUJyellOTW5aTDZMdnVLUkNoZnRQUGZMYytHY2Uw?=
 =?utf-8?B?MzhsMzBRYVhFeXlPRlo4RkxsUzRsZG5EOEwxWEZ2VmRram5id1ZvWnBJdmpE?=
 =?utf-8?B?UG1vdGIrbGtJK0NGdS8rd3hQdTIxNlVWaGFwVWw5Nmxidnd4bDRpd0haQXg3?=
 =?utf-8?B?LzZiblFoTnRWbjNKcHpuQWZyRFYzc1pnZXNGdm5POHA4M0xVa0hkZTNGT0lK?=
 =?utf-8?B?K1Y1UjNUL1FGcnFuL3ZXcmVvRmdLTE5kbXBFejh1ZURnbEd0Y09vaUIrQ2xa?=
 =?utf-8?B?c3lVM0FZOTlxQUdXcWxicmFwcjhOOFdxMW5JaDB3bTJ1aWRsRXVsN0taYlNG?=
 =?utf-8?B?aWltViszNVlYamFlNVlNZ3Z4NHdBWVRac005Y1lXdjBHK1NqK3J6RTdmRVZz?=
 =?utf-8?B?ZlpMeXNzUkxOWWhkSjE1NGhXRmNSVkR3b0F4OTVWWno4djBmaE9OeFFjNjhX?=
 =?utf-8?B?MUVZUmMvdjUyQ1BKbG04YlRpajd4c0FRQ21kdFRFYksraEJkdTJVYXhYQXN1?=
 =?utf-8?B?bVIzL0ZCeHF6dVhwaktzcGZGT0JFUlR3SWRONWpvNHNyd2ltbUZ6R3d0RWd1?=
 =?utf-8?B?Y1A5VmdmU1RXT3hUejJCV0dXZ2N0bGsyUXlxcHM2TDR5cnNmWjl6OXhCdjky?=
 =?utf-8?B?WTEyQmtBWElydVZBWStpZlg3VEN6cFVxRithazR4RVB0Y1RXZmtDMncyVFhJ?=
 =?utf-8?B?MUFlTHYyeStpbXRKYkUvYncyUjVDNFBqQnpwWEhxM3JQQlgrLzdmUkdzVVFn?=
 =?utf-8?B?akFFUjBJRnF4QjkzcWxPMU1DZmRLSGNpKzk1QVQ2dTNGOWZyUXVsM29LYTcv?=
 =?utf-8?B?R1FMaHJkTHlNWmJWTjJIVDljQ2RhaFVpSEhMSnV4UG5IVDVlRWxacDVSdWZQ?=
 =?utf-8?B?Nmdoc0tLcDFrQmR0MEtldGFoam1Id0Z6NzNmUlIrN0gxRzhBQUlhWEtIV21z?=
 =?utf-8?B?NW1wM2dKTitLL2lEVERNdjhHWlNGbjRmV1lFQm1UY0dtc0Vrb2R6V3JiekYv?=
 =?utf-8?B?cXNPZVZiL3F6dmFqYmd3QXdSWnNIbWN0NTVRd1hoWEQ1Mkp6b3AzV2ZDalFF?=
 =?utf-8?B?RFlZY0x3czZZa2d2UWlOTGJQem84aEhJQUd2KzBJUGdDcENOY3gxL01lbkk3?=
 =?utf-8?B?aWlrZlM4Ty9iQkQvTmYvVE5adHpIbE44dEsyVXBoVnk5ZlkrVEI5STA1SG1u?=
 =?utf-8?B?ZWRBK3ZUSkUxTHQ5Uis2Ui9pMVB6N2FsQWdtbkd4ek0rSzdnMzgxS0Fka3NC?=
 =?utf-8?B?ZlNXZEtMdzZYOXRnY0NsL2J2aVEwbVM1aU5aeHRQM3N1cUp6OVByVVIwZHY2?=
 =?utf-8?B?OUdrZTNhMDJaYkRrM1ZQQTNPd2c1SHBTdVlJOXQvMzNVdEIwSjh2Qml1eGE1?=
 =?utf-8?B?aTJLMWxSUHZFY1dsVklCV2dVTit5OUlIV0hKYnk5VVJWTE1tdEZhL0JWY2Ew?=
 =?utf-8?B?Smx4aDlwMGRWNjM3UmdZTFo5dlFCQnVvY0VrRUtsd1pEOEwwSTRzSHhBL1JR?=
 =?utf-8?B?TWdJR3M5QnJYd3kyUnBIS2o5Tk9idDB3UDhvYTdVclZweDRoN2psMjlJc2pv?=
 =?utf-8?B?cE53L3l6Y3h4SmIvWk5qVE5SVFhzZUtIbTd5aG5zOU45ampwOE1XMXlsUHhi?=
 =?utf-8?B?Wm1kb3l2NEU0TjFPSUprU0IwdnhVcEg4OUJVekduaFJzZllyM1owTEgyTDVC?=
 =?utf-8?B?ZnROWnFvMjJZMDR3M0ZlSGQ4WG4ydmZUcmJmTzA0aFArbERFclZCTkdqQjBO?=
 =?utf-8?B?N2xqdHBDaG9rbXkycHNaUDJoWWpUNXEzVlFvd3RwZlZwdEVhVS9rSHdnOUlU?=
 =?utf-8?Q?EIDRBd/dzGjBDjFthJZQ3yCuISmgB8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajkrb00yaENuUndsR0d2YXlwRlAxdzJuc3hBVGpacm5Cblp6WjFwb3JneVIr?=
 =?utf-8?B?VzIxMC8zTUE1V2JaMTVCTmtqdFlGc3c3MXdZSzRKdnZEM1Y5UWRpMmxXN050?=
 =?utf-8?B?TzYzSG42WU5pSksvWmgxNlJNbUJGUVhSNXlmNHowQkRCNzE2SjY1ZjdFSEZa?=
 =?utf-8?B?T3J3UVU1emd5SlJKWS9nUzdBZGZxWk14NnVjZGl6RTZwZ2U2bVgzYldMeXhB?=
 =?utf-8?B?YWRRZ2hCOE1teGFIaWJiWlU0YVhUZWNQY25QTWJ0SGh4OFFUa05BallCVis2?=
 =?utf-8?B?cGMvbnZUZm5qVGZibkg5SGhNbG9xWE10azNNUXpvWHQ2ajFVaVRxbEluV2Zw?=
 =?utf-8?B?dDJEcC9rWGY0WGR2ZjF6QTJTNi9FSlZvVEtrOTJsTzkzeHBYMndYVVhwbHZy?=
 =?utf-8?B?SXNJemhNLzRBT25PNE1uSnhTY3BJMHBpNU14eUwzcUlRVjM0RlpZKzMzU2Jp?=
 =?utf-8?B?cUZTQVpRZGc3NUtiR2dPZ1RqWnRXbkZXbWNZYTNrbFhTcTRxTUFBYVpIZlB5?=
 =?utf-8?B?Y21JbktWV1NvcGpyV0ZJMU5PYUxzaDRGQUtjNEIrbFVEcW42ZFV1L0NWSzBI?=
 =?utf-8?B?Q0cwTTlTcDliTmN2T2hCbWFsY1JBRTErNDRNVmlXZ2NoTVZWZGlyUW1sWU9Y?=
 =?utf-8?B?RTRiTzlnTmV3eGdFdlUxL2hGNWFPbnk1WG1lVm5jelZnaFV1b2l1dUN3MGJB?=
 =?utf-8?B?dnF3bjhkMGVmcS9KQVk5QXRWcFcvRXYzNEo5aDBSZ1hRODU2N1ZmOE5qUjlz?=
 =?utf-8?B?TVBnbjkxd2R1NHloUzhzeXBhODNvVVBUN2lpNGRvRHJxd2FwSDRVN3p4L1dH?=
 =?utf-8?B?YUdvb1AxWjRkLzRUWGFLamRVYjV3SEJDWGx4OEZzNkxyM05lbFh0RjVVTnZa?=
 =?utf-8?B?Y3o1Zi9Hb2tvaERCVDBCc0tFdmREcFo4aWUzUlIvcnRDOHFuQytYTDc2WGJw?=
 =?utf-8?B?R3hkK01TRDlZWWhHQWFMZlZmTC9MOEtUZTFCczRjK0xLVVBLNXBLTFQwbHdD?=
 =?utf-8?B?TkNPbldDcG9DN3d6MHVVOW9vMkxTNUYzY0htSW1ERzR4c2s0K01wTjVHUG5H?=
 =?utf-8?B?QmZ2U2NzYmVaclhSS2RFaXlaZWppWThaRkJQY3ZsQWhub2lXSnRWb1A1RkZN?=
 =?utf-8?B?dFEwRFI4bEpIY205WTZRWUdqdnE0dENJQ0JXQSswNElvb2wzdlNVUkVIbXhm?=
 =?utf-8?B?dDIzbXAxSjV2MmNjcXRQQy9BeWpvOURWVzJxUzJRZjMxTTk3aWxSeGlxTmJo?=
 =?utf-8?B?djhNdWM2eTdheGlnTEMybjZJYzEvUjlxaGVDbThDNHl1aTdkcFlha3hFdTlN?=
 =?utf-8?B?ZlhWVkoxeGRtSjFHQ3EvRFY5NmI2QkxpZEcrdEZHUXA4VEdhUFAxemdsTHZ3?=
 =?utf-8?B?L1hmWjFKU0l4Z00yTHNsbzRVSlJheUNBN1FWRXphRytUdFNjWE01UHUyQUNh?=
 =?utf-8?B?ZW0wcjNJWFBEdTRzbk1aTEM5bm52OHJpcXUwa2VFZ1dBcTkzQ3hkU0trRW1q?=
 =?utf-8?B?dGFTa2hQUXVQSkNUS1VpR0VaVm1yazNaK1hzVDY2K1l1ODZ4ZDNOWVZVbEtt?=
 =?utf-8?B?WkluUXFLVTdMcFBpMzBOanI5QjMybVhnelUxVzQvT0pGUjJoRWd3SytKMUw3?=
 =?utf-8?B?cDdsUHF0Z2ZTVlFqK1JrRVhLNUZNeCs2QmZ2TkFWa3lQT3U2S3NRSkxWcnJn?=
 =?utf-8?B?OWpqUXAyRENjblYxaXN5eVU5SW5qaFNjdDNQUUt5TE5MaGRvYXdaeENvWHk5?=
 =?utf-8?B?K0pnUlBJTDdzbjE1ckh2WERKNllCZ2FrcldZOTRUMEgwajJCUjlkcjVrYkpw?=
 =?utf-8?B?NC9ZVUt5ODlOV1BEU1M4eWtEbXJCRVJIK0FwdUdsenV6ajZXQ3BDMVVnTWFk?=
 =?utf-8?B?V0ZmUWN4TGdTZkZDTHdFTXFTaTh4dnlyYW9JODB0QUR5YW5CcVQrMU5yWndT?=
 =?utf-8?B?RFhGOVBPb1ZqNkZKVkFIVDhraURUZHRFVjVmM3pWK0gwM05WdlA2eGprT2pS?=
 =?utf-8?B?MkdxVmJmMGw4VjFmaEtPb2pyYWtnWmkrcERqdE9FUTFoWXRjRTVhZThwV3NX?=
 =?utf-8?B?UlUxbTVvL2c1MWQrMEo0ZnpSSEJUR3M0K3dQZTNremtjOWFrMVB0TlhwZVhL?=
 =?utf-8?Q?q+Y0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239e164a-9958-4780-ccef-08de226ebac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 04:40:10.7838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+4LptalonbuNuHUQsxWE+x4jVenWc6BcttjgCYk6ZaRvUoVVNZWNHjHNrMw1Tx+a+tqHEgpshdpZfukKjIN+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9274

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDMwLCAy
MDI1IDg6NDQgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgb2xla3NpaS5rdXJvY2hrb0BnbWFp
bC5jb207IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZA0KPiBNYXJxdWlzIDxiZXJ0cmFu
ZC5tYXJxdWlzQGFybS5jb20+OyBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47
DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJl
dyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgU2hhd24gQW5hc3Rhc2lvDQo+IDxzYW5hc3Rhc2lvQHJhcHRvcmVuZ2lu
ZWVyaW5nLmNvbT47IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47
DQo+IEJvYiBFc2hsZW1hbiA8Ym9iYnllc2hsZW1hbkBnbWFpbC5jb20+OyBDb25ub3IgRGF2aXMN
Cj4gPGNvbm5vamRhdmlzQGdtYWlsLmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyAxNS8yOF0geGVuL2RvbWN0bDogd3JhcCBkb21haW5fa2lsbCgpIHdpdGgN
Cj4gQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9w
YWdpbmcuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYw0KPiA+IEBAIC03Njgs
NiArNzY4LDcgQEAgdm9pZCBwYWdpbmdfdmNwdV90ZWFyZG93bihzdHJ1Y3QgdmNwdSAqdikNCj4g
PiAgICAgICAgICBzaGFkb3dfdmNwdV90ZWFyZG93bih2KTsNCj4gPiAgfQ0KPiA+DQo+ID4gKyNp
ZmRlZiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+ID4gIC8qIENhbGwgd2hlbiBkZXN0cm95aW5n
IGEgZG9tYWluICovDQo+ID4gIGludCBwYWdpbmdfdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkg
IHsgQEAgLTc5NCw2ICs3OTUsNyBAQCBpbnQNCj4gPiBwYWdpbmdfdGVhcmRvd24oc3RydWN0IGRv
bWFpbiAqZCkNCj4gPg0KPiA+ICAgICAgcmV0dXJuIHJjOw0KPiA+ICB9DQo+ID4gKyNlbmRpZiAv
KiBDT05GSUdfTUdNVF9IWVBFUkNBTExTICovDQo+ID4NCj4gPiAgLyogQ2FsbCBvbmNlIGFsbCBv
ZiB0aGUgcmVmZXJlbmNlcyB0byB0aGUgZG9tYWluIGhhdmUgZ29uZSBhd2F5ICovDQo+ID4gdm9p
ZCBwYWdpbmdfZmluYWxfdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkNCj4NCj4gVGhpcyBpcyBp
cnJpdGF0aW5nLCBhbmQgY291bGQgaGVuY2UgaGF2ZSBkb25lIHdpdGggc29tZSBjbGFyaWZpY2F0
aW9uIGluIHRoZQ0KPiBkZXNjcmlwdGlvbiAodG8gYWlkIHJldmlldywgaWYgbm90aGluZyBlbHNl
KTogT24gdGhlIHN1cmZhY2UsIHdoeSB3b3VsZA0KPiBwYWdpbmdfdGVhcmRvd24oKSBuZWVkIGV4
Y2x1ZGluZywgYnV0IHBhZ2luZ192Y3B1X3RlYXJkb3duKCkgYW5kDQo+IHBhZ2luZ19maW5hbF90
ZWFyZG93bigpIHdvdWxkIChuZWVkIHRvKSBzdGF5PyBZZXMsIHRoZSBsYXR0ZXIgdHdvIGFyZSB1
c2VkIG9uIGZhaWx1cmUNCj4gcGF0aHMgb2YgY2VydGFpbiBmdW5jdGlvbnMuIChTYW1lIGUuZy4g
Zm9yIGRvbWFpbl90ZWFyZG93bigpIGFuZCBoZW5jZQ0KPiBhcmNoX2RvbWFpbl90ZWFyZG93bigp
LikNCj4NCg0KVGhlIHJlYXNvbiBmb3IgZG9tYWluX3RlYXJkb3duKCkgaXMgdGhhdCBpdHMgYW5v
dGhlciB1c2FnZSBpcyBpbiB0aGUgZmFpbHVyZSBwYXRoIG9mIGRvbWFpbl9jcmVhdGUoKQ0KVGhl
IGV4Y2x1c2lvbiBvZiBwYWdpbmdfZmluYWxfdGVhcmRvd24oKSBpcyBibG9ja2VkIGJ5IGRvbWFp
bl9kZXN0cm95KCksIHdoaWNoIHdpbGwgYmUgdHJpZ2dlcmVkIHdoZW4gcmVmY250IGVxdWFscyB6
ZXJvLg0KDQo+IEphbg0K


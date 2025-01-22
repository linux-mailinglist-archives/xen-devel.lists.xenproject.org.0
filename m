Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F3BA18A3D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 03:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875762.1286184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taQpX-00082f-4H; Wed, 22 Jan 2025 02:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875762.1286184; Wed, 22 Jan 2025 02:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taQpX-0007zW-0k; Wed, 22 Jan 2025 02:50:59 +0000
Received: by outflank-mailman (input) for mailman id 875762;
 Wed, 22 Jan 2025 02:50:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gdw=UO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1taQpU-0007yy-Mr
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 02:50:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2412::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1d61bea-d86b-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 03:50:54 +0100 (CET)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by LV8PR12MB9408.namprd12.prod.outlook.com (2603:10b6:408:208::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 02:50:48 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%7]) with mapi id 15.20.8356.014; Wed, 22 Jan 2025
 02:50:48 +0000
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
X-Inumbo-ID: b1d61bea-d86b-11ef-a0e5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyunNs0zzgg72DXS1Z6Yrilx3ywn3ApSPAE7B2HQChBERMFqG8j5NfGBiNW87MuEwh9QcOw6kVXJjP2OTBII8mPSiNRFpxQDv40eX9DIHR8hoH7ws8YO5jZ/Wg3uS27VfL5fAuY8yW++wtxB3oftcUm4CuXxH7v62l4NSXnXzgKaLC4t0Fn5cICwiC4kU0dvML3TuyKbMbV2kkZjmiL69YFLUhir2Bk0uOoBPPvkfopNVbP9cwzvrBgMTrtLIP3exrm77ZptWVp/0ZyMg6ZiIrCXzE0K51FZUTkq5jHlQrUEa7LwxCx1dVO3Vh678qANmTdi39AM965wiYJyjeS1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wBsXJWENb6NtyWsyU6BabsVXTBN5XirCiQcIt5/C0E=;
 b=gLRlgTh97fP4bVE4L/rFvyj9PAYhgtN1Qn0zN8KJsx0Eeg0pjYrC5z5lCcv0qJ7HWrld9PeuTivySDTnzf+sHLJqbuA/ttn78J5ynmeYBd/A+d5XxPk3KaECNiUMVTBMmNaGYfdoKpg9gBnb9yHmOHwH8umME06QLXhhuN6CsK0fk80DFzWAEejC/AB24cp2iNd1mCqIcmQVCuqTL+BspXb3mvDI6mzOJeFizZ7Np9oayk/6xNKegKBxcoXmB4g3a6Zed6Xi7pVsYiuC567aGV0pZ0xzI8TUS7Qmx2OBXrs41yiJeVDqmmTQBdMQR4AicPlGHKKcM7mML3ZMeZ8eOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wBsXJWENb6NtyWsyU6BabsVXTBN5XirCiQcIt5/C0E=;
 b=uuQ030YwH6/B3w2n89axx7TmhDlzbzY2PwHB28vYiLgR5ilxZtKhfMVl61U6C9oL372YlMwBL8N3I0tHRVNVgjw/Iw4LpRYA29glodD5s3KoOOPMCIJWDFphbxsDIy7f8Xtc8UAxpygrs8IpDYMfcqz3kzRMHU9Hb/9FZIh3eyw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5] vpci: Add resizable bar support
Thread-Topic: [PATCH v5] vpci: Add resizable bar support
Thread-Index: AQHbZjRJ+4D0uojYEUmC9gRuRAux1rMg9ZEAgACK3YD//4D+AIAAEMqAgAGX2oA=
Date: Wed, 22 Jan 2025 02:50:48 +0000
Message-ID:
 <PH7PR12MB5854EEA40EEF51B3785BE9FBE7E12@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
 <Z49e8NmROzke-tYc@macbook.local>
 <BL1PR12MB58492016DDBB106A607F32CDE7E62@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z49o4iyY7vPhz2ow@macbook.local>
 <b65a4189-e643-45d3-ac62-25ccc1ffb39a@suse.com>
In-Reply-To: <b65a4189-e643-45d3-ac62-25ccc1ffb39a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8356.008)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|LV8PR12MB9408:EE_
x-ms-office365-filtering-correlation-id: 6b566115-0011-4fd6-79a3-08dd3a8f9371
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZUVlRm5jbUJKdi9xYkQzOHFmSmlDU3h1OVI2b1B1L0xWYlJpbmRMdVcyMjRH?=
 =?utf-8?B?d2VibDY3QkpGbm1rNFU2Tzl3RzJxTk9nVnZNMTg3NTc2WVlHMmpaNFRGaGU4?=
 =?utf-8?B?Ukw5TmhoeS9SL3I5UDZJdzJPN3VZSEs1b3NuS2twbm9CQmhoQ2pNWC9rdnNk?=
 =?utf-8?B?NUVJZXBzUlNXc2xmV0h4UjFERWVsZFU1MUpKVU9GY1VINzloNEJOV1BzOCsv?=
 =?utf-8?B?SEtyRW8yeGZLMllKZ0UzV09lTGU0RHhKQitnanE3MDNxQ201VTdXT2k1WnEr?=
 =?utf-8?B?Ynh4dnd3bDdSUnJBcFhVdnMvcm5La3RqWW9jc2ZvWlRSVEJObDJhdkc1NHln?=
 =?utf-8?B?K1BCd2dEcmtvU2xwZGZPMGViL1dHT0tLZi9MaE9JSWowNFJwQnIrL1FscU9K?=
 =?utf-8?B?STk2STVTb3d3WXpoOTdPanoxcmdWL0RRd0F1ekxJbkp2UWJCWFU0MFI3UXor?=
 =?utf-8?B?VTB2NVNCVWp1c0pTS0lpV2llMDUyUldCcDV4R0lGWXZ5cm5PT3RrZWEzaXV3?=
 =?utf-8?B?WGFUd2dRSHlaNEdBcTNZN0l1V0dMcFVzd1JCZjg2bFZYRzJZYnlSWlR3T080?=
 =?utf-8?B?ODl5aTloeklVNW51NzRIdFR6MTk5VkVRRFBOVjQzZjFhZkh5VmRacGdpdHgy?=
 =?utf-8?B?SEZWNTFYcHJ0b3MxaUVzOVVYMHFQUWFlVFNKMVdYWkZKSXl2OE5heEV0REtl?=
 =?utf-8?B?b2d0STRNQTVCTWVsMW5kUTNYdFBRQ1BZWjFVVVYzcnRuZUZxUnpKT1c2UjdO?=
 =?utf-8?B?QWFQL0lZVDRJbnNWZE51ajNYaWR1QnZMZjIxUjRRVHZNQUowaEF4dzJoQk9E?=
 =?utf-8?B?enZFWVcyMTFPL1FWSUkrSXVCTEErb2tyWG9lRnpCK2ovSGY1WWRjS0x5V0xF?=
 =?utf-8?B?TDhEMFJCbHZnOUtPWjNZbmlCNisrTituN244Zko1WFlpemZHL2FRUXZON0Ns?=
 =?utf-8?B?QzRvM2RkMTNodzB5Y2FxeldiTmVzU1p3U1BKWi9WMkF3eUU3ZG9RVnZadmFX?=
 =?utf-8?B?VjgxcXZ2MkhJVjE4cjNXRFFmMWZ5bllidjlsTU53cVIzSkxkdzJEdDJlWldE?=
 =?utf-8?B?UFNYSHVKT0pzNEhJMDNNYVpCcWNzSUZqVzBBRWpOb3pKMTRkUnpEZ3lxd0NK?=
 =?utf-8?B?UGlOUUswQ1hCNURqZkJNQUhWbUJDaWxiS2p6QjREeEdTS2ZlUGZieTNaMU9V?=
 =?utf-8?B?YTNIZ0xGSUZlNkNIcExVaU1qQlhiaGVaMjB0OWlUeEltODR0ZTR1aEhlOG5I?=
 =?utf-8?B?aGhaYVEvVnFXaVJsRkpFajIzRVNvVTdzeDJpMHlFZzdHWlZhaUVUS1d2bmRy?=
 =?utf-8?B?VFk3NzhVY1B3bTRIc0o0T2xxd3g1ckpyS0FqcE9zUmM2alNsRXdISkh3dHFx?=
 =?utf-8?B?bDhsZURjY2pEUkM5dk9kM2pqdHdZeEkxNkoxZ0JHQnpGcUVjaHY3UnBWL3RP?=
 =?utf-8?B?SklyOGVVNnpiMnFEV21tSmZnQmZUbVdjWHQyRnlWUW1UL296K3VRcnRBVnRS?=
 =?utf-8?B?TDBEZHVLNGFIQVZCck0zQ0llaFdha0JYaUFNSHlKS29sRCs2V3p6dlh1V2pK?=
 =?utf-8?B?R0FhOGZxLzg1ZEorQmIydkFReUgyV043UGxaTlhXT010YXJnSlRWYXFDd3B1?=
 =?utf-8?B?SEpNNXJXZkZTcGpBbXJGZ1d2cTV0VEpZNTZIeXhVNENqZ2tsaGF2MFBIY0dM?=
 =?utf-8?B?T2hIYzl3Yy9nVFp2bktpUXc5OGVUWXVnajc4cWYvNnpLbU44bGxVZkJaUDJO?=
 =?utf-8?B?VlZEajFjZWtNQXRoSG1CeG1QV0dDdWVoT09wSGlNS1BiaGg3OWNWSm5nVHVr?=
 =?utf-8?B?U0FLdzNKNzkvQS9jSjV0TXV5STZPQ3FXZzJFWGpBbWEzZVZlT2pub0VTdkxr?=
 =?utf-8?B?MlVuZ1JPcUZDclpLSVg0UzR3anc5bTdlRUcvU0R6cFk1RDNEbXlNSjNvcnNS?=
 =?utf-8?Q?M+IK/CZJGKAOvWxf0QSXKbvjDTDtu71r?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWpQSGhxbE9CbVd0RmZGKzFhbVA5OHpaeXdiWFMvQjlVWEY4aGJjNzlXbXQ0?=
 =?utf-8?B?bWowcFd3R0lpTFpGY3QwSnc5MEQ3SWZzanJGTnJVdWg2UStTVjRNYndwZ1o4?=
 =?utf-8?B?ZzMzZ3pML0RSL1RFOGdTdEhrd0xKN3g3dzhlMUVkRmNVYS9UbUZmaHlPYStL?=
 =?utf-8?B?Q3VLOUY4S0VCRHQ5Q2dveG9oZ2wzMzd1NlRWRDBSRXZ6ZHR2cWxwdGFCemRK?=
 =?utf-8?B?TUFBVm9XandxNDkvNEhxdnIycFZERWtXL25hY3ZJMGtBbDVKQnlaNHhhSFZ6?=
 =?utf-8?B?aFFJV1JUT3hDUENqOE83RkxPVVB2RjZCSXQxSHNzMWx4MFFWKzNqM3RpY1k3?=
 =?utf-8?B?bGZTcWVUOVdiODBRbE5vcFArUG94anZzQ2p0VzlSK09CQnlyeTRZRGRMQy96?=
 =?utf-8?B?dHZWSnpHM2pIYnBsRmlNK1BDNkMwZ3FDL0VmZ2lMZE0yMUQ0ano5UWpVU09J?=
 =?utf-8?B?Vkk3TzdXTEVmZ0s2K3NoV0tXTkw5WEN4T3ZkVWZMVVNJeFlHc25KWjl6YWN3?=
 =?utf-8?B?MTBXQWJPOWY0Skg5aTNDK3VXUnJiT0lRTmVsMUtad1IyUnhkNWcvUmluU3lE?=
 =?utf-8?B?cUFFekFhbzRlaExQaldKMFlOVG9qejk3bXllMHJCb3V1ek5GNVBEU2hyNDlT?=
 =?utf-8?B?dTArZWIyTGU2OHFTaHZ0YWJKQ2ttcENKa1FwTGN6QjVWZHV1ZHRFMDV2aWI0?=
 =?utf-8?B?SnVwcmJza1AvckE1cUMrK3gwZVhWWjZPVVdiUnI1dGZZRXdYdTlPUnVGYk51?=
 =?utf-8?B?Ym1MdS9PbU1JTjRuZjRIYVNpKzNhR2NRZm83MmRiVUtKeGM3aGxKOWlQNWtl?=
 =?utf-8?B?WjNKOGhLcFVvWFpBbU90dDJYNFRKS3BSdjNKaStiVWpsVWgxRlJTcVdRclZM?=
 =?utf-8?B?UTJUVFRDb2ZRd3h6QklaYW9Id0lpUFZlTCtPV3ZKeDRBLzlPQ2xLaTI5OE9Q?=
 =?utf-8?B?dGFEUEFKK0JxQVlvOTlJc1p0RlpGSFJmYmsvK0ZTeFZXVHRWOW5QVW4zbVpH?=
 =?utf-8?B?TWkxWmhEVXd2L1IzQ2FNQnlhZ3B5TytWNGpaa0lxL20yQXhGY1BnVUE1NGhi?=
 =?utf-8?B?V3k0bDh5TVZ1cE9yaEdqY20vb1pCRjFxVEF2REd5bXI5REphUitzbENUYlJD?=
 =?utf-8?B?TThpUmhxVFMxZEtOVmgrQ2Jmb0RtMytIVWJMbWFzK29uN3FqaHZOYzJTVVNP?=
 =?utf-8?B?UWhVaTdmMkZxZVJxT29CUENPQTdINS8wenVqR0NOcFlhL0JHTEM4WWQ5bWxp?=
 =?utf-8?B?bldIYkxiR3RxS2h0K0ZSQldadlRlaWplUGJYZTZUUnI4Z3lrd0M0TlNUVWpq?=
 =?utf-8?B?OFR3YjRNTXFnTzk3NVRCTU9RN2FxVnV2czBaZ050SnFGcHZqL2NjRFpEYi9u?=
 =?utf-8?B?SVJqZDlUbnRXbTJ4ZVpYNEVFVnpEOWJ5L3I5WjQvYm5HUXd6VXJCdFFOSUlZ?=
 =?utf-8?B?UCtFTG9mT3RhR1RYZi9OU0FxQ29RQjRNQXl1QU9ZL0wwNVpZYmxwbWlNZHkw?=
 =?utf-8?B?dkptUld1SHVOdUptVFpKYlZodUVtVjNDUGtnZS9zOUdQK1B1Z1NQYlpBN1pY?=
 =?utf-8?B?NVJZV3Ercmwxa1pJM0tWclRDRTVBUzBoTllNMFNzdmJXVG16ekUvY2JkNWxF?=
 =?utf-8?B?OVJlYVNQbjU5aHBXVmFtSVoySzBsQXVydVpKK2sxemV5MHpXT203MFloSlZB?=
 =?utf-8?B?Q1RVY0lkZW9hYVdaL2pGMXRuTExiRGZ6SStoMFN0bGowZzd1ZHRqNlhHY0gr?=
 =?utf-8?B?RkpMZmhiNGlQMkw0andQM2gvTXBTTTFXbVIyaitUbFhnN1ZYUUpjOEh4RDkr?=
 =?utf-8?B?ZlppLzQvaFBieDFGc2JqVDJiaFQ0RlN2MXdGSFNsOWdFdWl1aGR5NnhyL1Jj?=
 =?utf-8?B?UmVlTDNNQ2FCYllmL3NHZnVEMHo1dlFQQXhUSXVmSnJGVkp4QUFYQVFjSWFX?=
 =?utf-8?B?NmEwYVliU1BkaGFIamNJM0JodHFJT3ltZ0w5bWtLTFZBSENvNGx3dWdHNjVO?=
 =?utf-8?B?eGxCMmtmK0U0ajcrd3VZT3l4dTdYZml0Wk44SExRRTEzWk1ZVnVkMUV4T2hz?=
 =?utf-8?B?QS80T1piVjd1SHJOL01MR0xkbFJzTlhGQ0l0U2tuN0JhWlBzT3NwbVFaMnNq?=
 =?utf-8?Q?BhaI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDCDCDE0A253B8458F966B43097BBFC3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b566115-0011-4fd6-79a3-08dd3a8f9371
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 02:50:48.4834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XEM59LwlhCetMSjCsBU164FV+lXSbDnpLdUeaFlnOQkdVBeNFreGHDHew7A4exhlmZFvtU5LRRslW9j6mgE5gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9408

T24gMjAyNS8xLzIxIDE4OjI5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjEuMDEuMjAyNSAx
MDoyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0
IDA5OjEwOjI2QU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+PiBPbiAyMDI1LzEvMjEg
MTY6NDYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+IE9uIFR1ZSwgSmFuIDE0LCAyMDI1
IGF0IDExOjI2OjM2QU0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4gKyAgICBjdHJs
ID0gcGNpX2NvbmZfcmVhZDMyKHBkZXYtPnNiZGYsIHJlYmFyX29mZnNldCArIFBDSV9SRUJBUl9D
VFJMKDApKTsNCj4+Pj4+ICsgICAgbmJhcnMgPSBNQVNLX0VYVFIoY3RybCwgUENJX1JFQkFSX0NU
UkxfTkJBUl9NQVNLKTsNCj4+Pj4+ICsgICAgZm9yICggdW5zaWduZWQgaW50IGkgPSAwOyBpIDwg
bmJhcnM7IGkrKyApDQo+Pj4+PiArICAgIHsNCj4+Pj4+ICsgICAgICAgIGludCByYzsNCj4+Pj4+
ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyOw0KPj4+Pj4gKyAgICAgICAgdW5zaWduZWQg
aW50IGluZGV4Ow0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAgICAgY3RybCA9IHBjaV9jb25mX3JlYWQz
MihwZGV2LT5zYmRmLCByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RSTChpKSk7DQo+Pj4+PiAr
ICAgICAgICBpbmRleCA9IGN0cmwgJiBQQ0lfUkVCQVJfQ1RSTF9CQVJfSURYOw0KPj4+Pj4gKyAg
ICAgICAgaWYgKCBpbmRleCA+PSBQQ0lfSEVBREVSX05PUk1BTF9OUl9CQVJTICkNCj4+Pj4+ICsg
ICAgICAgIHsNCj4+Pj4+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBkICVwcDog
dG9vIGJpZyBCQVIgbnVtYmVyICV1IGluIFJFQkFSX0NUUkxcbiIsDQo+Pj4+PiArICAgICAgICAg
ICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIGluZGV4KTsNCj4+Pj4+ICsgICAg
ICAgICAgICBjb250aW51ZTsNCj4+Pj4+ICsgICAgICAgIH0NCj4+Pj4+ICsNCj4+Pj4+ICsgICAg
ICAgIGJhciA9ICZwZGV2LT52cGNpLT5oZWFkZXIuYmFyc1tpbmRleF07DQo+Pj4+PiArICAgICAg
ICBpZiAoIGJhci0+dHlwZSAhPSBWUENJX0JBUl9NRU02NF9MTyAmJiBiYXItPnR5cGUgIT0gVlBD
SV9CQVJfTUVNMzIgKQ0KPj4+Pj4gKyAgICAgICAgew0KPj4+Pj4gKyAgICAgICAgICAgIHByaW50
ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBCQVIldSBpcyBub3QgaW4gbWVtb3J5IHNwYWNlXG4iLA0K
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCBpbmRl
eCk7DQo+Pj4+PiArICAgICAgICAgICAgY29udGludWU7DQo+Pj4+PiArICAgICAgICB9DQo+Pj4+
PiArDQo+Pj4+PiArICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZw
Y2lfaHdfcmVhZDMyLCB2cGNpX2h3X3dyaXRlMzIsDQo+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlYmFyX29mZnNldCArIFBDSV9SRUJBUl9DQVAoaSksIDQsIE5VTEwpOw0K
Pj4+Pj4gKyAgICAgICAgaWYgKCByYyApDQo+Pj4+PiArICAgICAgICB7DQo+Pj4+PiArICAgICAg
ICAgICAgLyoNCj4+Pj4+ICsgICAgICAgICAgICAgKiBUT0RPOiBmb3IgZmFpbGVkIHBhdGhlcywg
bmVlZCB0byBoaWRlIFJlQmFyIGNhcGFiaWxpdHkNCj4+Pj4+ICsgICAgICAgICAgICAgKiBmcm9t
IGhhcmR3YXJlIGRvbWFpbiBpbnN0ZWFkIG9mIHJldHVybmluZyBhbiBlcnJvci4NCj4+Pj4+ICsg
ICAgICAgICAgICAgKi8NCj4+Pj4+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBk
ICVwcDogZmFpbCB0byBhZGQgcmVnIG9mIFJFQkFSX0NBUCByYz0lZFxuIiwNCj4+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgcmMpOw0KPj4+Pj4gKyAg
ICAgICAgICAgIHJldHVybiByYzsNCj4+Pj4+ICsgICAgICAgIH0NCj4+Pj4+ICsNCj4+Pj4+ICsg
ICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFkMzIs
IHJlYmFyX2N0cmxfd3JpdGUsDQo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlYmFyX29mZnNldCArIFBDSV9SRUJBUl9DVFJMKGkpLCA0LCBiYXIpOw0KPj4+Pj4gKyAgICAg
ICAgaWYgKCByYyApDQo+Pj4+PiArICAgICAgICB7DQo+Pj4+PiArICAgICAgICAgICAgcHJpbnRr
KFhFTkxPR19FUlIgIiVwZCAlcHA6IGZhaWwgdG8gYWRkIHJlZyBvZiBSRUJBUl9DVFJMIHJjPSVk
XG4iLA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRm
LCByYyk7DQo+Pj4+PiArICAgICAgICAgICAgcmV0dXJuIHJjOw0KPj4+Pg0KPj4+PiBJIHRoaW5r
IHdlIHNhaWQgd2Ugd2FudGVkIHRvIGF0dGVtcHQgdG8gY29udGludWUgaGVyZSwgcmF0aGVyIHRo
YW4NCj4+Pj4gcmV0dXJuaW5nIGFuIGVycm9yIGFuZCB0aHVzIHJlbW92aW5nIGFsbCB2UENJIGhh
bmRsZXJzIGZyb20gdGhlDQo+Pj4+IGRldmljZT8NCj4+PiBJIHRob3VnaHQgdGhlIHJlc3VsdCBv
ZiB5b3VyIGRpc2N1c3Npb24gd2l0aCBKYW4gd2FzIHRoYXQgSSBvbmx5IG5lZWRlZCB0byBjaGFu
Z2UgdGhlIGFib3ZlIHR3byBlcnJvciBwYXRocyB0byBiZSAiY29udGludWUiLg0KPj4+IElmIHRo
ZXNlIHR3byBhbHNvIG5lZWQgdG8gYmUgY2hhbmdlZCwgSSB3aWxsIG1vZGlmeSB0aGVtIGluIHRo
ZSBuZXh0IHZlcnNpb24uDQo+Pg0KPj4gSG0sIGxldCdzIHdhaXQgZm9yIEphbiB0byBjb25maXJt
LCBidXQgZXZlbiBpZiBoYW5kbGVyIGNhbm5vdCBiZSBzZXR1cA0KPj4gZm9yIHNvbWUgb2YgdGhl
IHJlZ2lzdGVycywgaXQncyBiZXR0ZXIgdGhhbiBqdXN0IGFsbG93aW5nIGRvbTANCj4+IHVubWVk
aWF0ZWQgYWNjZXNzIHRvIHRoZSBjYXBhYmlsaXR5Lg0KPiANCj4gSSByZW1haW5lZCBzaWxlbnQg
b24gdGhpcyBiZWNhdXNlIEkgYWNjZXB0ZWQgdGhpcyBtaWRkbGUgZ3JvdW5kIGFzIC4uLg0KPiAN
Cj4+IE5vbmUgb2YgdGhpcyBpcyBpZGVhbCwgYnV0IGl0IHNlZW1zIHRvIGJlIHRoZSBvcHRpb24g
dGhhdCBnaXZlcyBkb20wDQo+PiBtb3N0IG9wdGlvbnMgdG8gc3VjY2Vzc2Z1bGx5IGJvb3QuDQo+
IA0KPiAuLi4gcGVyaGFwcyB0aGUgbW9zdCByZWFzb25hYmxlIGNvbXByb21pc2UuDQpPSywgSSBz
ZWUuDQpJIHdpbGwgY2hhbmdlIHRvICJjb250aW51ZSIgaW4gbmV4dCB2ZXJzaW9uIGFuZCBzZW5k
IHY2IHNvb24uDQpUaGFuayB5b3UuDQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywN
CkppcWlhbiBDaGVuLg0K


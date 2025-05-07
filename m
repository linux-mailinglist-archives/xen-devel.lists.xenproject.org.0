Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5962AAD38A
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 04:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978102.1364964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCUoQ-0004n1-NL; Wed, 07 May 2025 02:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978102.1364964; Wed, 07 May 2025 02:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCUoQ-0004jw-IS; Wed, 07 May 2025 02:47:10 +0000
Received: by outflank-mailman (input) for mailman id 978102;
 Wed, 07 May 2025 02:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNVA=XX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCUoO-0004iI-G6
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 02:47:08 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:200a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d076160-2aed-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 04:47:01 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 02:46:53 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 02:46:52 +0000
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
X-Inumbo-ID: 8d076160-2aed-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6U1cFrCa9ozpoaGC4XOYP1XZAng2uGxHlFUszFlTUneLytR/Jfl0NdNbHatY8wuLKZmDFCWSd7zXyTp/uVYZox6xtHFBGC9UN/PyRlJtn22ZadMvH7URONA/KhB9sbjmuaZ1gUREUH7xVXq4i7uU5M/Gl5zzCY6VQDIzCASs3RcBxCt3VGfuTlOgDVjILdFw1Fj+AR6p0Ejwl9H4fM1KkMhO+Ny6Tigw6TYmtgiLQYxnBS0RhourFdjUZF0SJX5FjxtuC2LkYQXQK1GGCO5mHhlN0ngckagpN3iEh2ATXlt69+mOXdZSdX4G8wuSzcQxkNBCfpRGcI1lPjDXaHIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xMpg8qO/OoUMO6S7MPmOMUWW05RqrMsOrkvfCyrpvI=;
 b=aKJ+HtBGAz+vse8b/4Mrf4Ma9KZhlvPKfydxzoGP1miwNW2F86h1WOCKbHroeX8mYE+AKXqHjjeXEoWlOqxJBe/MJAveQlg/gD/SI8JtYXNhoK10bSztwK9lhu6TcIX+Nh1phl5jLdkrnHA+mAp94gMqVrlnrDXP+OQz3EPFgbcQTrJKoo7WZs5qep1PM/VTt7ZFlb1VgQ0eNANjQlpYRpfwI6N/LAH9PWHklZ45+FHWQH7qGQs09tsk1Za0TuD7gS+5r9Iky05Z5IxvDL5CP9Sbo3dLxWeQuerznN6CZqAC4/XZr/s67+kD3WrIYpDkMVkGWgfcSdZ/fQeFcvfyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xMpg8qO/OoUMO6S7MPmOMUWW05RqrMsOrkvfCyrpvI=;
 b=Qk6HY5FcGEpoCvUOadVCD2O4AWZWDfnEemxNTvYWbU5fQ3eIuMm/EKyP+DT4ApldVTwyqXGXNejs2HagTD451HEm1z6qKdtx+HxXt2abWQA7BQSGAlili2qelR4gt5HJGvvDkFBJS3cNWDuF0NWJwSuLW9h+susmopS/a1M3uCk=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Thread-Topic: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Thread-Index: AQHbsoVY0As/JNC0IkWc2g8aH+9wh7PFtqAAgAFbx4A=
Date: Wed, 7 May 2025 02:46:52 +0000
Message-ID:
 <BL1PR12MB5849A7D00734B43A38F14D10E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com> <aBoTqCf5y_LXzZdb@macbook.lan>
In-Reply-To: <aBoTqCf5y_LXzZdb@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8699.005)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM6PR12MB4404:EE_
x-ms-office365-filtering-correlation-id: 54bc5ffb-6f4b-4bea-53f5-08dd8d116c59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MFRkNXAxLytRQ3RyZm1TNzJSUTIwbEJ2aytvZXV1MGlPYzg2LzJDd0VycHE4?=
 =?utf-8?B?ejIzaUtQVVVFSTZoS0o4LzdLeW9wM0svbko2MEFOdkkwRHh0SWczREZqWkF0?=
 =?utf-8?B?aXdLb2VETGZ0TFJJQ1I2WDYwQlVNcW5DWXFyT0VjWkN5UzRjcUVMRVczcWh0?=
 =?utf-8?B?YlppaU1BT1VXaUE5OTl0STNIL3NZbHlINE5UbGxORlhXRFc2SWtxOUpRMVFF?=
 =?utf-8?B?VVNlWG0vK0VmU1h3bGt5clJSMzJWcEV3Q0huSWFXaWZ4ajNxVVZCYjRhOFVq?=
 =?utf-8?B?cW04M00wSmhHTm91S3B6aXp1cGJLVm1rNzNZM0Z5YWZlNTVobnlRdGhBSXhS?=
 =?utf-8?B?R3lyRXRlNWo1cHVrcVZlSTNxSm03eGg1ODkzb0JzUHRGQjFiVGtvdHJrdHVL?=
 =?utf-8?B?RDJDTFA1NjZKQm1SODQxSjlRTnhncEJRRnp2cG5EMVgvV013dHc3aERud3N1?=
 =?utf-8?B?MU4yTDlRTmpWNHhIWEoyWGNXS0NYbExOaS9aVithbFpjeExWbVl2TVZVYzBM?=
 =?utf-8?B?cVRFV1BQQ09rbE5iMXNKNjk5RWIwR0xGZ25uQUV6NDlkOXBDNnc0TTIrYUpm?=
 =?utf-8?B?M3NjQnNueUVoZmliV1prZHlpa2cvRTByem95NEhIdDF1L2RtRzA2QjBSSzRQ?=
 =?utf-8?B?ZGloTkNoVVZuQ1h3UTRUMFROZWEvUHF1bisrbnJLQkdtYlA2aUlPTFI4eER0?=
 =?utf-8?B?b0ZzM3dvVXM5OVFnSDlFQ3RYbTF1d2taQ09aTUxaVWVzaWNxcFhPWlBSZXlF?=
 =?utf-8?B?U2REK05uTFpzVUZIUXQrWVM4T1BtZFNTbWpOK2JWeVZCTk02WDZCYTJJZ2RV?=
 =?utf-8?B?VHVkYXhPcTM5YVh3dVY2bDFmL0k2cmZyQ1J0bUU4T1BTNXAzdi9lYWh4YWx1?=
 =?utf-8?B?bXozZGx5dGxkTzNPQkhYRnlTdHB5anFnYUVaaTQyZXQzeEZ4TjRTTVhNSkJa?=
 =?utf-8?B?WG94UXptdGNsUFdSMWVvMkhFci8veit0d1lhekpVU2w1T2ZjZGJ0VkNxbVo1?=
 =?utf-8?B?ZkZrZU5neDltTGdtMy9SeHMvWERzY21ZdStsYVduejhwNnFFODdPN0xoZ2JC?=
 =?utf-8?B?Mk9aL2l5Y3FYbWx6d0FDdkV4d1M4d1ZpVFZLdHF3a00wVk5xSk5mSzlKL0hQ?=
 =?utf-8?B?T0VIcyt4WENwSkxsRnRtem0yczI3b3BzQ1Q5NGt6S0d0R3c2VkY1UmRVbTIz?=
 =?utf-8?B?TFBUVE9nNEp5bDlSSktqQWZXaDBjd1cwMFR3dUprc2EvMFNZd3ZjYkpzYlBr?=
 =?utf-8?B?MjhFVkw0ZlNqb0IwMWJhNTVKQzhrWEJtRlBBVUZ6ZTYzQVRRa3JiZU1DTU9V?=
 =?utf-8?B?Z1RyalNHSlFsUVhWcjlxN3hzZnR6OVNHSEExd3pEVjhhcEVpelI1b09uRlMy?=
 =?utf-8?B?WkxwMEU0eFkyU0F1eHlKeEZ5K0p2VXhMbVBuNVRRRllCSUgyaE13OFZ2S215?=
 =?utf-8?B?ei8rZnNKS3dCNU94SzIyRXZvaUxIM3dqWEpnOXRyNkpSTjZidHoxRzk3MnBG?=
 =?utf-8?B?Zyt6eC9xZGIzT3BYZ05MK2FQV1paRzY5WTRMZVRYVzNka2x6THNUaUl6M3FE?=
 =?utf-8?B?TWp5K2EvOTk0K1ZJZVJKMjJrdldUSyt5N3lVY0o4QjVQRTB5d1YvaTMzc1k5?=
 =?utf-8?B?aVp3N3RZNHhZem1zOU4rSVR4YSs0RDZiVUM3aGp6N2ZDNXFNVW4zVVR3THhB?=
 =?utf-8?B?OC9oY2lmTDZDSG1rNEhsMjA3UWpsaGtFTGt2Ym9QMXdTV0RlbHlzcjhKbUFY?=
 =?utf-8?B?OFJwUEpWMjVPQ2x6eUdoc3BzWWR4RDg4SEFRMXF1TTFjYTdTeXZ3YXVhWHRz?=
 =?utf-8?B?b2FpdUVReEx1VU5IS2lVZWVpMEthWVBSbHV6Z1VRVis0SlloTWxuR1dFTGZy?=
 =?utf-8?B?QkRKM0NQQXFKZEozSzdmb2lKS3BRN09tVUZIMmF1QnpRM0w4d2g5WUd0dGR2?=
 =?utf-8?B?clJGYm4wWjBMUVFEVldnazBUSkwrTi83NGZrNTVZMTRZREJ3YjFPTGtXUEEv?=
 =?utf-8?Q?Z/88I1nK7Jv/5xklBYR0NOD3Gm1fTE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODJUYW9yUVFaUnBjOVE0VmorQ09nZ3JiU2duSlNrOWVYSkZFVURvQjc5bnB0?=
 =?utf-8?B?bi9mNkFEdXB5UE5IOGlrM29hMGhQRk12L1JNQXIxdkZSZmF4OTJ6bEp6RGtV?=
 =?utf-8?B?VE8zeXZnRCtEb2dGckI1NVRNeVZoVldzL0lGR29CMGdEd2ViRWxSaGZCeTBH?=
 =?utf-8?B?RUV1SjRZN3lBd1VKRnNob2kzWXJlZ0pnR3JKbWkzL20remJGM244eC8rcUI5?=
 =?utf-8?B?MW1KdnZyeXMyWXZkNGJUdEUrVEJQNElydllQQjZDRUxCWXJXdkExdW92TGVO?=
 =?utf-8?B?ZzFHWW1vOWZzVnFvbHAvajNkaGt3ajdyOHhBeWlRTGJLYTNKVjVYa09OZ0hX?=
 =?utf-8?B?QmJPVnJqcmJFSjA0aEJESWhZYTBZWTE2Wi9Mck5UM3dxYjk5UEpYZzUzTUQ0?=
 =?utf-8?B?YkhydWhndlNQQmVMMHZPbmV6cHQ2YTdWdlhpY2U3QzE1NC9sc0YwOXRZYjRR?=
 =?utf-8?B?MXRremNZQ1hhbk1Ka0tJK2tOZlhDc0w2U3Y0dG5abTBoVVRSQjRDOXEySjgy?=
 =?utf-8?B?NTFiQnFkRVdtRGxsVGhDYzJzQWYxNUJVS0xveUNubGRaeDFEVVRUeXVrOHdh?=
 =?utf-8?B?VDEzUERXWHU0N3pIZkdhcFcwR0FaamtEeVJVRG9pT3duNi9xSUQvK2xlbnc1?=
 =?utf-8?B?cWFPdVhRREZXZjdpWXpQdEs3dlVGQk5qU3lXdDMxdjFwU1RWZDhGVDdGWGk3?=
 =?utf-8?B?bnRHQmlxYkhNdTRUbmNuUFh2WEtWWSt3WHA5RENmSzlxcEYzZzFzUkZFb1cw?=
 =?utf-8?B?c3hwVk5kVDlpVHdJaGZxdWdaeG5IeFBwMVhHWHFhR0dOanVKMW9aNkV2MkRU?=
 =?utf-8?B?WGl4OGtSSlVzVEM0NXc3QjRhN2ZyR1lxUWRLeWl6QVo0K2FicE5KMFJZMnFw?=
 =?utf-8?B?L3BYT3hxenZ4WnJHeUVNQkROMWhrUGZTVmdJeVFlUmlwc0x0a1NEeHlLWXln?=
 =?utf-8?B?bXU4ZExNaTZsNlZlTTdtWnRlRmh4NVhvQVNMTkxzSi9ZVXphNGQxVDd1T1g2?=
 =?utf-8?B?d0RLcngrcUJkWHg2L3o5cjRPS2IyRDViWFMxcUNnRVplQ1cvMmVzRGgxalBj?=
 =?utf-8?B?MjdNYUthQzJ0Rk5SczhLNVN4ZWFIRHZld0N1WjRvOE0rUnRyVDlqVFZsSzVs?=
 =?utf-8?B?RStFZFRrazFPd0k1NHNOdXJKaWM4ZEExM0E3ZmlGbW5qSEdGYjFnRXFVaGl4?=
 =?utf-8?B?V004VmJrUzZCUWhGMVc1SUZIbS90ZTdvaGlGMnRnQklocExGU0R5R3c2akdh?=
 =?utf-8?B?TUJlTVpzOUlMS1lweTlTRWFVM2I4NTErTm1uS2h3cUpWV3FIU0pOTkF5VG1V?=
 =?utf-8?B?WFd1eGFxNEs0V3NmZXZoVm5RN0RsS2E5cXJ1clBDUmNMZDhQQXJJWUFMaWZi?=
 =?utf-8?B?aU1meTM4b08wWHBTWlhXUEdMS0U0WjVCb0llTFp5RmlKV3dUYXhRUHE5Qy9x?=
 =?utf-8?B?UFlBL3RCM1ZUYUh5MnFGa2QwUXhEWDZSbGd0UHc5a1BWbTV3cWZDNUUyaG5o?=
 =?utf-8?B?NWNMb2IrMWZNVTcyeE00NUFMaTNLOXVUeDhJK1RiSXhxb2xJSkQwTXFHZmcr?=
 =?utf-8?B?WnpiT0dxN1didnZ0Qml2eWI5Vit6azlVZzliZVBYdEJNS1Z2UncwQytIdnNG?=
 =?utf-8?B?aDlzbi8rb3ozS25tZGlBdnovOEpiMkhRWURUYW9lWUF2bzdKZVZUZ2hIVlRV?=
 =?utf-8?B?N1doWTVIancyQ014VENWeitkSGI5TnM1bXRTYlNWRGxXU1RKOVdVcklYQlhk?=
 =?utf-8?B?UExxcE9rMjV5QTR4QUw1a0RJM0hzQ3Q0K09mWVNWZ2VBVUxpTHBsUGlTTElm?=
 =?utf-8?B?NkI5UlpYMkMwaHdnNlhDcnVMeW9PZk5kUE4vMlRicDNWc29Bb0xXZitVeVFE?=
 =?utf-8?B?MmFjMjlxTVpmdDJtOHJJNURLMjBkTEdubStqTWFqa24xMUxaMXlCbml1c2t4?=
 =?utf-8?B?MExuVlhMWVVnSm5paG9wQUlac3ZmYWdKZ1N2czMvZjgyUWllU3c2YzVIRjNE?=
 =?utf-8?B?LzN0YllpY2UzR0UwczJvM2FxUDdIYjUxZUZXSDN1VTlqdXJNczEwZEpTRjBq?=
 =?utf-8?B?SStRZDY3Rk5ETUlkaXhaTm1oWThwWWRwY0g0cVZOdTdiVFlFc1VzaVIyWVV5?=
 =?utf-8?Q?tYfI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66265326C4D7624C82B6F82D40214E28@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bc5ffb-6f4b-4bea-53f5-08dd8d116c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 02:46:52.8059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+b3FheMaA7Do/OWthHznVzQwpgntj6uLmKKUkgA1uSk9ft3wHpokpxcTfv1biHive4Flq14veaBALo6Q9ftig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404

T24gMjAyNS81LzYgMjE6NTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE4OjU1UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gQ3Vy
cmVudCBsb2dpYyBvZiBlbXVsYXRpbmcgbGVnYWN5IGNhcGFiaWxpdHkgbGlzdCBpcyBvbmx5IGZv
ciBkb21VLg0KPj4gU28sIGV4cGFuZCBpdCB0byBlbXVsYXRlIGZvciBkb20wIHRvby4gVGhlbiBp
dCB3aWxsIGJlIGVhc3kgdG8gaGlkZQ0KPj4gYSBjYXBhYmlsaXR5IHdob3NlIGluaXRpYWxpemF0
aW9uIGZhaWxzIGluIGEgZnVuY3Rpb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENo
ZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+IA0KPiBTb3JyeSwgb25lIG5pdCBJJ3ZlIG5vdGlj
ZWQgd2hpbGUgbG9va2luZyBhdCB0aGUgbmV4dCBwYXRjaC4NCj4gDQo+PiBAQCAtNzg2LDEzICs3
ODcsMTUgQEAgc3RhdGljIGludCB2cGNpX2luaXRfY2FwYWJpbGl0eV9saXN0KHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQ0KPj4gIA0KPj4gICAgICAgICAgICAgIG5leHQgPSBwY2lfZmluZF9uZXh0X2Nh
cF90dGwocGRldi0+c2JkZiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBvcyArIFBDSV9DQVBfTElTVF9ORVhULA0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3VwcG9ydGVkX2NhcHMsDQo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKHN1cHBvcnRlZF9jYXBzKSwgJnR0
bCk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYXBzLCBu
LCAmdHRsKTsNCj4+ICANCj4+IC0gICAgICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBk
ZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDgsIE5VTEwsDQpUaGUgc2FtZSBoZXJlLCBOVUxMIC0+IHZw
Y2lfaHdfd3JpdGU4LCBJIHRoaW5rLg0KDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwb3MgKyBQQ0lfQ0FQX0xJU1RfSUQsIDEsIE5VTEwpOw0KPj4gLSAgICAgICAgICAg
IGlmICggcmMgKQ0KPj4gLSAgICAgICAgICAgICAgICByZXR1cm4gcmM7DQo+PiArICAgICAgICAg
ICAgaWYgKCAhaXNfaHdkb20gKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAg
ICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQ4LCBOVUxM
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcyArIFBDSV9D
QVBfTElTVF9JRCwgMSwgTlVMTCk7DQo+PiArICAgICAgICAgICAgICAgIGlmICggcmMgKQ0KPj4g
KyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOw0KPj4gKyAgICAgICAgICAgIH0NCj4+ICAN
Cj4+ICAgICAgICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lf
cmVhZF92YWwsIE5VTEwsDQo+IA0KPiBGb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiB0aGUgd3JpdGUg
aGFuZGxlciBzaG91bGQgYmUgdnBjaV9od193cml0ZTgNCj4gaW5zdGVhZCBvZiBOVUxMLg0KT0ss
IEkgdGhpbmsgSSBuZWVkIHRvIGFkZCBkZWZpbml0aW9uIG9mIHZwY2lfaHdfd3JpdGU4Lg0KQnV0
IEkgaGF2ZSBhIHF1ZXN0aW9uLCBpZiBoYXJkd2FyZSBkb21haW4gd3JpdGUgdGhpcyByZWdpc3Rl
ciB0aHJvdWdoIHZwY2lfaHdfd3JpdGU4LA0KdGhlbiB0aGUgIm5leHQgYWRkcmVzcyBkYXRhIiBv
ZiBoYXJkd2FyZSB3aWxsIGJlIGluIGNvbnNpc3RlbnQgd2l0aCB2cGNpLg0KSXMgaXQgZmluZT8g
T3Igc2hvdWxkIEkgdXBkYXRlIHZwY2kncyBjYWNoZT8NCg0KPiANCj4gVGhhbmtzLCBSb2dlci4N
Cg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==


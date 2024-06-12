Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53C90503A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739126.1146077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHL1R-0004im-CP; Wed, 12 Jun 2024 10:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739126.1146077; Wed, 12 Jun 2024 10:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHL1R-0004gH-8r; Wed, 12 Jun 2024 10:16:05 +0000
Received: by outflank-mailman (input) for mailman id 739126;
 Wed, 12 Jun 2024 10:16:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAc7=NO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sHL1P-0004fa-MI
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:16:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:200a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4ef25b7-28a4-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 12:16:02 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB7481.namprd12.prod.outlook.com (2603:10b6:303:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 10:15:58 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 10:15:58 +0000
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
X-Inumbo-ID: c4ef25b7-28a4-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga0G6YRXj16i4+m+3h6WdqQNWKvqm/QFxVLS+TI0cZb2OLQ7obBlVQaW7OWgx2xOSYd0O5n/7z3ff5UvgYLyxq3m7Tj327cY1ZjHVzOTiO2AG/BFeMAdStzXY3LjzYUG0aUxoMOSFMiJqMbLKkuwkCHwBHBYCilCryCadxMmWB9Ca+NjxemeeqSATL3sMyDOeUJGP9NJSD8k3HPFhj4s08/gcl0LCTy8qBR2yE/p75BYmmF2N2zaqWDLXBXewJSC/IhTzleijCiqfO3aucj/QyYqo5FdgMcu7wZnukls2wzmlsQ1i2Gt/ERCBp3NfwBTNbDDYM5rORJVWo49ZwcC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc/18CKA6D5qLuF90oPGG3kp6+92Km7slGuHcaPIoRA=;
 b=hfkgQGXNdwS8H00RWCC+57OC0uznQSJ2sGU1xXrwJ5VKIcOjGHtxvVAPkEAPCvnytXI6IV+h+3mTrnIGgxznfRVsH5DB8J6pkx1RCuLrvbbt18pDXyDOQmHEm5Mef0q8Xf3/Fveka5pm2XQXvmT54FH9F/TOkvZw5mDPjL3+MqZABf6TxzghrfLBPQmXy8D0Y4KybTYKaCTORnR2KdicI97p8s2YthUhKYsbTTEE7FSirUSIwXlKWsYCl0/SufIHwGKL2ayztkUC9xBE2elK6aI0m0HolEllWhL5zka7N9fl+AXmeRNMcCr6ChitUb5ud+G6UbDbrS8qPte28Ld20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc/18CKA6D5qLuF90oPGG3kp6+92Km7slGuHcaPIoRA=;
 b=Lx2Y6jcTUw0zTP8Ggsl0xiWn5IWGAG7/ntHI5OF74upXXQd121iTN4LwdMF5Rbw6xU+YyCZN7HELUleUzJUtfuWt7AatLPeVxHMuG9JUuK2en63vy0kpRsp1fTrrRbWceBFAHC8I9XTUiSuwlyuIF2FbB4gOwL+C7RxSaMp69WU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v9 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v9 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Index: AQHauLJiOTCaFyDADkao1O0TqexhE7HBLmwAgALLiIA=
Date: Wed, 12 Jun 2024 10:15:58 +0000
Message-ID:
 <BL1PR12MB58499C90372E8D5D1FA7F26AE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-4-Jiqian.Chen@amd.com>
 <38b5bf96-22fe-444c-824b-b4c2d6e107d0@suse.com>
In-Reply-To: <38b5bf96-22fe-444c-824b-b4c2d6e107d0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.034)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB7481:EE_
x-ms-office365-filtering-correlation-id: 723c8a6b-9336-4768-f036-08dc8ac8a76e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230032|1800799016|366008|376006|7416006|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGI2OUlaOUVMbkNOS0VhMS85UlNRVDVsUXlFaE1ic24xZEtXYUg5MUhEekhL?=
 =?utf-8?B?ZkxUUUtNdU1naWlDMHQ5MXUvd3o3M1RqTS9idVAwUnJ0dXpxZjBtU21wcVQz?=
 =?utf-8?B?UU1ONTJYZDFiRnlsVmI0a1hJNmsxbzZkZ3hXVUhFZExTQzRYaWFRZnJCZS90?=
 =?utf-8?B?cmJnOGNqZkFVSDNERzhmU25ndmNhTy9XRkhrM0NoZVBicktIeStHK0VnaFFU?=
 =?utf-8?B?YkF3MDFvU29FMDdGc1ZqeGhacWZVQmRQS2x2SGd3dE85b3l1N25Rb0dqWXJG?=
 =?utf-8?B?anVKN3RUaklXSlR3WGNtLzViM2RvUnlJYlBKeGpyMW42ZmxEMlR3S3N5WEFp?=
 =?utf-8?B?RGNtN2NBcVNpeXpFTEw3WlZOU2d6U09BNHQxWWMxb1VrNEZkNm5nZzM4Sjhi?=
 =?utf-8?B?WVhYWGNudVZOOUlGTjN0c29DQTRoMVQyMSttb1djZktOVExVS1J5OEpvV1hi?=
 =?utf-8?B?Mm9ZY0RZRDRoekRpOXRKeEVNK1MxUXlIM0ljanMzcGpBQS9PSSsycjhVcUtm?=
 =?utf-8?B?cG9jNEJmY1NWUTBhNDBWYm4vbVJaMkEyUFZKQ2ZWTVRoTzVZa3BKS3dVQW5F?=
 =?utf-8?B?aEJEbkhuVHZhM09nU3NXZmRuMGRoSkQvTDMzbjArd2JvaTF2QzF2djg4TjF1?=
 =?utf-8?B?R25jWVp4anViZG1oUUlURmd5TkUwZitzcWwxVjFIa3BFWGtDNmRJUjlOaHZL?=
 =?utf-8?B?NFVYTWpnZ2xoR1R5WGFWMlNjMVVOTDJzdFg0aFdaMFdoU2NaLzRMZFV1dXJo?=
 =?utf-8?B?alNVU2VMdGVVZHNpV0FWZWw5Uk5JbGU4N1NSVFpOWGcwRFp3NVVRMnFRYlQ3?=
 =?utf-8?B?VlRzSDNUNi9DaFlKWGJ5cFBoS0psOEsrN2tvUDFFMFl1bXhlTVhxc2Jwc1l2?=
 =?utf-8?B?QVZRUmwrQ1E0YXdHaVpoeTdKVFVBTkQycEZIMVgxSGZ5Smd5NmNUYmRaeGdY?=
 =?utf-8?B?SE1Pb1NOZEg1LytkYmhtQmVzRzRRZnd5QXVDQmlDekpBZnd3S0ZOc0xEekFD?=
 =?utf-8?B?ZXdIYUtDZkt6L2ZYeXk2K0syM1o5MEJXM1ZSb09xcWZVcmlmS2RKK0MyZ25t?=
 =?utf-8?B?WGM4c2dreWlZM2NXZmxTRjFwNU9EcEl3ZkVrbk0xUk93MVlNd09NL1BrZjRV?=
 =?utf-8?B?Z1YvWU1pdTFFczF6SitYLzZwazA0YW9JTDQxVmU5QklVdUxTcTduL1ZIU0pU?=
 =?utf-8?B?K2F0M3JzSzE2SEVwNng0T2dvK0RWUHc3NEVGVEsrRkF6VUw5SUhPZUVXQlhh?=
 =?utf-8?B?VGl0cmt5OW5vUUhNTWtSMk9sa1NKMXJvNTQ2eFIrRzFLcW9PVWxQRDhSNGVz?=
 =?utf-8?B?WE0rOWVsZytDZVBLN25XeWJRRXFTb1lPSWtteFRiRWh2NDVjOXFyeHBFSzJR?=
 =?utf-8?B?K3NhOHJ2MXhLOGVPWmJENlRFT2dOd0N3UUtDeXpod1BHYisvb0RHYzAwbTJh?=
 =?utf-8?B?eEs1TCs2OFN3KysrM1hHWU4vVHExOUJrZnVUU3pCRG9nVnFJeGdySE1QNjJ2?=
 =?utf-8?B?UkpWNkxwM1ZyREVSMXMyRUdMQ2VmRlR3dVQ3R3kzeElqLzJickZyaVJJVDlZ?=
 =?utf-8?B?NGpldTNweHhldUxBNTk3Z2RpdHdxWVVGRzBGRnJmdlhadDhzQ3BXU1NXR2xv?=
 =?utf-8?B?ekdYNStXVU5aN2c5L21HWU1LTEwwTkZYYmVuNGhJbUJTSWE0SlhMQytHaTNI?=
 =?utf-8?B?YTFsRERpbWZHd3RvbTFMd0dGdXpuNzc3SFMweWhsVnJuQ1lkbml0RHZXeWdx?=
 =?utf-8?Q?TDNrtVuwnnSh3CgV4yqQaVf3qyCjlL05frVG/gL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(7416006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QndVK0Z6dzNtL0ZsdVduR1lnY1BvWGJuc1Q0ZEM3RHJKZWdQQ2N2dEtucms2?=
 =?utf-8?B?ZVRHM2EzTzdLKzY2MFZFaHl2NmFKQXBvbU8xV0N0NlR0S1ZZQlFFTlNnNDJ4?=
 =?utf-8?B?bDYwVU1aSmx0Q1dpeW50TzVQYVc4dk1zRmlNT21VcnJwWkdqSHAza0ppUTBR?=
 =?utf-8?B?cmlVT055RVhsanp3OGtuQ2VSSnJPSzhhOU96anl6Y0kvMERSSWtNbmlYVUUr?=
 =?utf-8?B?Rit1Q2hHS1JpY0c3MCsyWjBtSVdDQjJLdVpDQzVWc0RiUHRuZHg2SXdDbzhq?=
 =?utf-8?B?YmhNL1dpRW5sV3lDWmNNYnphWWo0eWwrQ2IxNS9heHJGZVpRUTVHWDFJZm1w?=
 =?utf-8?B?SWs5anZ0cVlNNVlvTGRyQ3lXSkFSaTVXVC9KbHQ1REM2c0RsZWlZUmhjU1hD?=
 =?utf-8?B?cUY0Ui9pU3A2QWFodmVtNTJUeWNuV1RySU9JOGlIaDR0Z1ZjU0RMU1F3VGRJ?=
 =?utf-8?B?elJ6SFB1cCtaZjBydHYyZFZzdmxkMTRocFdDQ29FSjQzVFcweXZwalZRQXU0?=
 =?utf-8?B?R3hhaVRPcEtFZ2JmSmhNSm03U0dXM2lia2s0NDZEaFFnQ2czSW4wcEhoSmhv?=
 =?utf-8?B?Y3ZOYkNQWU93T3NpVUtNMzBHbUEwaWxFay9rSEU5VTE3bUdKQi9aUzFRbjBO?=
 =?utf-8?B?anA1OTBBWk9DSDVjaVdlYUczRmJyN3ZOdVZrbi9kaHhmS3pKcWlqK0hEakpl?=
 =?utf-8?B?SlVjSGhlYVBFR3R3YmlibUpUblV2UzdJRytBbTB0OGRjR2Y3S25DTmFvY3o1?=
 =?utf-8?B?ZVBzWlcvQVIvT1IwTUFza2pSRm42cGRFZjRrd09RTTBONGJQQ2FVZXFMb0hJ?=
 =?utf-8?B?U3hFQUJpT3dRK3FkZ0N4dytEZUlaMmk2M3R3SCtzUWR4MDlSWUFSL0ZnV0F6?=
 =?utf-8?B?a3l6ZUFpU2VTbUlUcEFRL3M1aDdFR1R3SjdoWVdJTEMrVktOYXQvMFRMYUYw?=
 =?utf-8?B?K1oxZENuZXlSdEpON1QvODdZZWlybHU4RTJrbWppOUZIeUdPNzhNZndteC9L?=
 =?utf-8?B?dHBpbzdLaWFicitubmR6TGNTTUROSUoyNWpxRm1JSlNqdkUyeVp5RWpkbkZ0?=
 =?utf-8?B?ckthRzZaVGFUazZURkdGTTY5TlVJZnp5dE9LSXFLTjhMdUI0VmZnL3VNaVc2?=
 =?utf-8?B?djR2ZkVPKzJyTHpRRU9HdmNTUHk5SmFBUnhOWTZ6WklLV3ljWDB3TzI2UXcv?=
 =?utf-8?B?QVRJYnZmeEVuZmIrdFZ0TWtxRlJPajZMTHBJRWRoWjZyU1YrdFRpYVNyUldC?=
 =?utf-8?B?dGNFaUloNzVoc2FWQkp5bUVmbm9lVytEQUIwN1JGbWRvKzY0ZCtteWthaXBK?=
 =?utf-8?B?OXdsSmRhekczNE90TFBwT0dpZCtOcGJlWEN0THRYT2dWQnBoc0JiNmRONzli?=
 =?utf-8?B?ZlNqZEJCUDBqYXdwcFc0b1ppUzRCcVFQUlBYUXRxOEh2VXBnY29sUjNDN0hP?=
 =?utf-8?B?cFVER3BmT2RZSjZzNi9RMi9lRVJXaWJTMG85R0MrWVp2OExjYlNhYVI4WXBq?=
 =?utf-8?B?cGEyL0JJQlRiS1B4VTVpRExWMEZ0cm4xTFo0ZzVDaDJLczBINmpzeGZ2ckp1?=
 =?utf-8?B?RnV5bUpLbFRRczNKbm5xdkF3ajdCRWdwTlY1K1FFd0UzNU1aU1FncGlHZERh?=
 =?utf-8?B?K1pNTlBNZWx6dlo1LzBVOGhGTThlWHhMSWVWVkxrQXdxUTZML01HL0daZHlX?=
 =?utf-8?B?TExBVlpXMy9hbnU5SUZ4Y1E4N1NRd1BUUlpSUzZUamk3NTN2N0RNbW0yQU56?=
 =?utf-8?B?dytFQ2JMUnVzK3NiVStXZ21aSUhxYzBTZ042Nk5hTWNCdCtUWWpsQVREbFBI?=
 =?utf-8?B?K0dobG00dVlmWTRhZUhCLzZ6N2Nlb0dZb3N6anRGTzdFT1hEQm9kWXNZWkJi?=
 =?utf-8?B?VDlFWHNMdVQ2YVRyWE0xaXUxanNEWGJ5d0ZUMFBTZDgya0U1SlZTNnFhdTRS?=
 =?utf-8?B?bnhRQWNUTU5nUE1semtUd3ZhUStMcUxudStOQTlBRW1qM3owQ1haV08wd0JY?=
 =?utf-8?B?VHpFcUFSK0dUUWJCK2k2TUZaT3ozUitTS0tidWJOSkFXb1oydldtZW85dlRx?=
 =?utf-8?B?US9HSUVFbmw0TjE2d2pvMFdnUFlOQm5iKy9ERGlYVjNhdjQ1QTNaaVB0M2hJ?=
 =?utf-8?Q?vWDc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0186C142DCB464EB7CFAD74E392C102@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723c8a6b-9336-4768-f036-08dc8ac8a76e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 10:15:58.6639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLsFz6PNCUd0p5PESbA1dgpDOA55NIOBHI37Mvsz0/wHv+5qcrW3xRj0YkAKJ2+rCGrAihnf7ApjaPJ/rHJNZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7481

T24gMjAyNC82LzExIDAwOjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDYuMjAyNCAx
MDoxMSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBPbiBQVkggZG9tMCwgdGhlIGdzaXMgZG9uJ3Qg
Z2V0IHJlZ2lzdGVyZWQsIGJ1dA0KPj4gdGhlIGdzaSBvZiBhIHBhc3N0aHJvdWdoIGRldmljZSBt
dXN0IGJlIGNvbmZpZ3VyZWQgZm9yIGl0IHRvDQo+PiBiZSBhYmxlIHRvIGJlIG1hcHBlZCBpbnRv
IGEgaHZtIGRvbVUuDQo+PiBPbiBMaW51eCBrZXJuZWwgc2lkZSwgaXQgY2FsbGVzIFBIWVNERVZP
UF9zZXR1cF9nc2kgZm9yDQo+PiBwYXNzdGhyb3VnaCBkZXZpY2VzIHRvIHJlZ2lzdGVyIGdzaSB3
aGVuIGRvbTAgaXMgUFZILg0KPiANCj4gIml0IGNhbGxzIiBpbXBsaWVzIHRoYXQgLi4uDQo+IA0K
Pj4gU28sIGFkZCBQSFlTREVWT1Bfc2V0dXBfZ3NpIGZvciBhYm92ZSBwdXJwb3NlLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IC0tLQ0KPj4gVGhl
IGNvZGUgbGluayB0aGF0IHdpbGwgY2FsbCB0aGlzIGh5cGVyY2FsbCBvbiBsaW51eCBrZXJuZWwg
c2lkZSBpcyBhcyBmb2xsb3dzDQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQw
NjA3MDc1MTA5LjEyNjI3Ny0zLUppcWlhbi5DaGVuQGFtZC5jb20vVC8jdQ0KPiANCj4gLi4uIHRo
ZSBjb2RlIG9ubHkgdG8gYmUgYWRkZWQgdGhlcmUgd291bGQgYWxyZWFkeSBiZSB1cHN0cmVhbS4g
QXMgSSB0aGluayB0aGUNCj4gaHlwZXJ2aXNvciBjaGFuZ2Ugd2FudHMgdG8gY29tZSBmaXJzdCwg
dGhpcyBwYXJ0IG9mIHRoZSBkZXNjcmlwdGlvbiB3aWxsIHdhbnQNCj4gcmUtd29yZGluZyB0byBh
bG9uZyB0aGUgbGluZXMgb2YgIndpbGwgbmVlZCB0byIgb3Igc29tZSBzdWNoLg0KVGhhbmtzLCBJ
IHdpbGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gQXMgdG8gR1NJcyBub3QgYmVp
bmcgcmVnaXN0ZXJlZDogSWYgdGhhdCdzIG5vdCBhIHByb2JsZW0gZm9yIERvbTAncyBvd24NCj4g
b3BlcmF0aW9uLCBJIHRoaW5rIGl0J2xsIGFsc28gd2FudC9uZWVkIGV4cGxhaW5pbmcgd2h5IHdo
YXQgaXMgc3VmZmljaWVudCBmb3INCj4gRG9tMCBhbG9uZSBpc24ndCBzdWZmaWNpZW50IHdoZW4g
cGFzcy10aHJvdWdoIGNvbWVzIGludG8gcGxheS4NCk9LLCBJIHdpbGwgYWRkIGluIG5leHQgdmVy
c2lvbi4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


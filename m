Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FF0B95FE0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 15:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128374.1468745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v12vt-0001OU-GM; Tue, 23 Sep 2025 13:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128374.1468745; Tue, 23 Sep 2025 13:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v12vt-0001N1-DR; Tue, 23 Sep 2025 13:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1128374;
 Tue, 23 Sep 2025 13:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+SkI=4C=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v12vr-0001Mv-Qt
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 13:19:47 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7e3596e-987f-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 15:19:45 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10354.eurprd03.prod.outlook.com
 (2603:10a6:800:209::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 13:19:38 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 13:19:38 +0000
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
X-Inumbo-ID: f7e3596e-987f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjAo23NzGev5Ab2JJnhHqF0W05quE4sHRKH9i7kjxeU0Exh9vCwC4fpWoObmvw1jFRQG2PqjA5u6MZDRtxiaBRAwIWB3fMThZjo4eFIfJZRDSPfN9h72QNRoKd+vGiaqTo5B9Q7GAAH20WsgFceQajQjBeuLvLshoNWFjIlHE5YAp5XPIhS3qxX++l3qZPzHpw1uash5fwxGDVAAkNfkKi1SQZZAK5IP+lx/pdIyRbY98a9s14VFaec6LQH+sYgZTpdAVTQ5aa+OZMdDx46ZWceiKCE2XP0MgacunyuCxVGphvXKX3SESiuWh/sWQbK6qk4vgJlz5bzDgj6R0148gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiyiYclPvxXuCdt4j8G3TCLnJRhWWiPszQ8is/PTa54=;
 b=YV1Rag6DfFxfXj5evb/+Iw8YYQsB74yJmdkoerHICLQUDpMTIdjWp9e1qajDr/JaMCJgx8imrrxn6ucXvKuITEZ8Wu7BBwEsKI8u9BP0MGjTtMELQgxsV6KDBICQqe33fq4E+gdlTqmAwGJbiYb8jd0plqNFMuMc4iHgXBWV5qwX347yLfaWARJP5Y3KdlEpZDsQ/cua9YrP3fv+9N7RxTm/wc7RASuOfFz6en3+uUbflmijo0BytnnZpUEL5JWdYjt2CiM0zf1XSAnzm88Uo6N6CXAYeK0plV3z2vpHLAFLmNiLsH4m0+MXyM1JpeZkBaq0POZr5YwrmtH7Aji7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiyiYclPvxXuCdt4j8G3TCLnJRhWWiPszQ8is/PTa54=;
 b=lUo1GESMLcLqXDtMQWuaDWIhQ4mxKmqZyvuqWjOje39cspZcxrYqwDPQOqJxbBC1Dy3YT/mdJT5eqMTESJmJaHM9HREvIjaC/90EbYxrvI8K+io2kYGQ4uGsu2VQaAjyICPyaLRKBN0PjJ6dF8JHwxjfiawtklm+yir/rImnCyyuhAydG1yBlsNSF9BR9xgUVH7tIPAJHuP5hsrNX9b4qOms5lIdhSMX7y3UNFSLUOzjfzs7SpUIScKawaYQQpjTs9tiVwAvbclTsUrMrO4b3Ko1bacIRdd3MNPgGOvIPKvm/bjCwyns543cdO150gKPgJVpEFGteu063wdBLEvC9w==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 4/4] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v1 4/4] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcKJYT9WcJIkqhZk6dQ6fXEj6SxLSZCGOAgAe/3QA=
Date: Tue, 23 Sep 2025 13:19:38 +0000
Message-ID: <e6c66b05-d6b7-4e26-8755-5aaaa872953f@epam.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <7d10f4d063a55920acbb8d477b885552379a6116.1758197507.git.mykyta_poturai@epam.com>
 <337596e3-e522-4770-a64b-6c8137134739@suse.com>
In-Reply-To: <337596e3-e522-4770-a64b-6c8137134739@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10354:EE_
x-ms-office365-filtering-correlation-id: 15354c46-3808-48c4-982c-08ddfaa3d93f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dzFlalhzaW9aSGxBYzkyUTQ0V0d6WFhXM05ucFpuNzVZZmxCMFlhTXZyb1Nx?=
 =?utf-8?B?MjBmZjExRGE1bnBEZFJvc2FzdnIwS0JlcjVxTjh6b2RXdG9MWElOUFVtd2N3?=
 =?utf-8?B?SXZLNlFLOUpielZOT0F3NEo0RVc2LzRKY2x2MnZ6Q1RkWTJmZGhvRzBLSHRG?=
 =?utf-8?B?c1NSVlp1TTM5L01wYWN1V3ZXOWRSQ1JZUldONFVCblhYc2EyUkZoSlFsRlo4?=
 =?utf-8?B?KzREYld5UXdKMTlBaTMwdzRIMGk4WkVnNXZscmF3Zmc3TGVZcFRjVUgvRUZo?=
 =?utf-8?B?QWhVQ0laUlRuaS9jVGlObm1lTCtuWDYzZnIvVHVZQzl5bXFiK21VS3drUy9W?=
 =?utf-8?B?bkRMeEtXMmpoZVVWajVUNU1mb2V0NUxqN0xKRUZHVnJCZjFsWlRNQmxXYmJ3?=
 =?utf-8?B?OGZHU05NblVBUkR1bjg4S1doNUFDZ1dqa2FQWVRzRVRlaUN3OEJCbjlxZVRr?=
 =?utf-8?B?SGJscmVFeStXdmlWNDBNemxDQyszU2hYZ3RPMStEU3duWWRGaVFmUmRCMGhD?=
 =?utf-8?B?cVNoUkxDK0pVc0VXM2gzMlAvWjZlajRDR1dzdGxHUEExdXVOYkczT1I2eWh6?=
 =?utf-8?B?TkNCejIrb3B5RUN0K1lZNFN5ZmZRQmx4SVJLRW5xV0xKeThYNE1ReEw4NUho?=
 =?utf-8?B?Y0g1SzVZMTkxVVY1M1VlcjBDWnFTU0F0cHQ4TWlOYU81R1hBM3diRGJpMHZo?=
 =?utf-8?B?TDhBS1BxdHhuZmMrcVpUUXF3bjdXMjMvbUwzVXRhelZhR0lhMmJRcS85bzVL?=
 =?utf-8?B?cExxbUNoMXVrY0Nnb3F6Zk1JMVVjU1NUaTdXSlJjaEU2clJPSjQ5WnJRU1Na?=
 =?utf-8?B?V3c2d1M4UENtazBVcUVjcXBDcDFtQ3ArTnVLWlFEbEZHbDBSY1QwN3pJUzdM?=
 =?utf-8?B?S2dVNFY3RDFiNTQySGxUTVZ4M2ROWDlmd29KRE1EWjlBY3NlQ3cwNzFlalpi?=
 =?utf-8?B?bFNZQm1ZSTVRVW9aZ3QvSmtzMmlrcllWVnhSaVhBTWdzSWdsSlNCVzFBbXpq?=
 =?utf-8?B?ZUYvaTJMaVlOYXF4TDZQUlR6NnJOa1FuY3J4SWVrNlovOHhjV1Z1aEp6QkNT?=
 =?utf-8?B?dmRCdFBQb3lVYS8weWREOE0rSHltcDVubUY1UnBDMEVNRHJvUWRlazY2c3JR?=
 =?utf-8?B?SlB3VGRiNWI3U3JyWkxSdHpLSGQxekQ0Z3lVUnVrY25aSWdYNUpNRGdHekR1?=
 =?utf-8?B?bmhlVGJvNkVGclhyakViSS94M1l5ZWpoQUkraGcvSmM4aDd6d2poVEdIbHkw?=
 =?utf-8?B?QklnQkhaakZsaGtJQ0t3R2NWWFVsbUovZnhPV21IZUdCTlJ3eDdDWUxMNUlI?=
 =?utf-8?B?cFRmQ2h4N1dBNGYxaGtkWlNBWDRDREtvRFFiVThEYzJ4R1ZTdktjclhmUnFH?=
 =?utf-8?B?TnpHM1gzWEU3M0d6UjRFajJRVGJ0WWxiMDhZN2pvaXU2eVlKeitvQjVoVGF6?=
 =?utf-8?B?K056OHhVYUtqUmhnQXF2TVVJV1l5Y1ZZM3hkUlZvSnhOdDVVMnNJQkcrTHhG?=
 =?utf-8?B?WnV6bEd2SXdDMnBVcnFSTXlxWkhHS0lCaW9ES0tuU3RvZW1hT1pZL1J3S255?=
 =?utf-8?B?cW0xSzNLSzZCNkoyWEoraHpVdHNwK0JrRkJYa2FaY1dlY2J1ZlpHUHFFeFZW?=
 =?utf-8?B?T2V4ZEVrbDB2U21EYmZMam93VTc5bzVBcXRPSk9OMEsvVmlOOEt2Y3RzSEly?=
 =?utf-8?B?TmExZmFOWU90UXN5bytUMGJjdVVXbUhpUXMzais3YmxBMmhPSndpdDN6eEdM?=
 =?utf-8?B?Y040a29mTXY5SE1yZVcvTGxxNU9ock96TGFxMmJ5bXBFWWV1UmFpM0NvTDF6?=
 =?utf-8?B?Y3ZpZnF1RUFxTFpNOGlqWTBuSHQ5V3VRUDdwdWFJbU5Dc2dkc3V5bnlSSUdH?=
 =?utf-8?B?dzFHS3Q5dEZiOFdYMzVqVFpXM2tHM3FmMGVrU2tPRnFjNm91cisxYXhFSGNr?=
 =?utf-8?B?ZmczRitsQ2drS1J6bVdkdzhhd2ZkTiswQjFrbUd1UTVWWEQrR1J2bTFpWllE?=
 =?utf-8?Q?FA+QL5H0Q+yaJ3ZNsQU4en6Ayfy4R4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzhGVHZOekNqdzFpS1Y1bkh2L0tLVEdXVEhMZ2trTHA0T1N6dDUrZ2dvbnJD?=
 =?utf-8?B?NituSjFMMXI0MldEeFVCdmpuVE9rWWxiMHlzT0NJMnZWdCtCb3U3ei90NktB?=
 =?utf-8?B?d2VKek1uemZ1YVBxZlExcXNmcGJPdUxrNUg4SlZoOGRtMXA0dVpCTzQ2MWhr?=
 =?utf-8?B?M2RlSmpFSzBYNmZoSVMyT2dHWXhIUXJJTlBTV0dvOWFrWUpEaXIxWmtLalNO?=
 =?utf-8?B?VEY0dVQ2QWpqUEVvU0tBaWkvcVcwK25LUXUwQlExd2xwNFdFQ1llcUhKd0Ez?=
 =?utf-8?B?YUtHaDcvUTJBVFkxcnpDOXJuOGNOL1lhMGg0L2c2QVpPNjdYRTFrN3BpY3JZ?=
 =?utf-8?B?WVNHZkQrWldxYkZXa3FjeE5GNGJKUTFLQ05Sb3VNMnpPUW1JanNuSkRtMFRF?=
 =?utf-8?B?SmRjVkh0aGloMGV0VzcyU09jdVc4aXdhbEVtd0lxRW85N3YzM0ZZL244M3hG?=
 =?utf-8?B?ZW94eEhyTllRcnNtS3VDaXBENjZmWVo5cmhacHo3Y1Q2T2hZdkV3YjlNc0dB?=
 =?utf-8?B?bXUwOFhQUUV5SkFvbkdLYWxCSWVDZHFyelRjdXZ4WFMrUE85VW8yaWo1bXJD?=
 =?utf-8?B?S2dZaVZOcEZRbjJVdzYvOUNlTUlBNEpzeFh4QVNpUndwM3BoWUI2a0NCNWlO?=
 =?utf-8?B?TCt2TVkwS3ZGQWtsakRqeWxxY1p6MWtLOEZnNllDbDMzWXQweHpkd0V1cXhn?=
 =?utf-8?B?MWFhY3dES1RTRUliY3FSeUhQWEpDN0JSaHR2Q3BkQTZZZkQxdkgyaUs5Z2pl?=
 =?utf-8?B?ZDJzNTZRRVd6anNoNVFMRFl2dWJUaitnTHN2ak9FbmtWVkRlTTJXNWtQREFW?=
 =?utf-8?B?NTRaa0czRDdtSWtHa3lNREkwYjAwSTM4aFJNY1lXVWVrd2trNnBWVG5rT1JO?=
 =?utf-8?B?TThTUFR5ZjFEWS9MQnoxSjRUK2xkT04zTFRYenlBdlhjSnpscUtzSjlRV0h4?=
 =?utf-8?B?cWN0bFA1YlBJSlNxejd0K0pMN3VudEl6VnJGMlk5dE95OThQdnlMMVd6MUFE?=
 =?utf-8?B?bFFWNW5IWEFIRHRpdXNFNFZtRW8wdHQyVlM3aXk2azNlb1RTUVVOWEtyWGlr?=
 =?utf-8?B?d2NxSE5raGRZRFFKdzNBbWJJYlV0R1lkaHA2dUpLYXhZd1BLNFBOWDhKNTg1?=
 =?utf-8?B?ekxvSi9LZHlHQVJrSmxmOHV1Z2FlVDc1MjZrUVV3S1lGUk0rUnZBTnVPN0F2?=
 =?utf-8?B?MlVERGdhNVJydjU1WXZQcGtadU50K2tSaGhnaWJWaDFXSG1SdGdFeG1qZTV2?=
 =?utf-8?B?Ym83UzE3OVBTeXc2R3lDekkzN2lHUU5WcVgrLzJtaURrOERISEE4RG9UbGxl?=
 =?utf-8?B?ekRkb0EyYmk1eU82UWN1N0liY2VNZVE3V0FqNlNORTNCeXBUZ0hxN2hudXQ5?=
 =?utf-8?B?Y2xnQ0hzaWcxYUo5bXNZWUxGYnlvU01SVXdoc3lBZjVsSldveU94WGhUb3ZC?=
 =?utf-8?B?ZXZ6d2tJUTZlcER6cy9wcmVmT2Iyc0dqRTNvRHpvZGhEMFp5NXNJc2N3R2RM?=
 =?utf-8?B?N2pqTE1xL2JTSDVsSEkzOUJNS2phZzRLRHpKWDA5cW1sNHQ5djdBZ0ZpR0RY?=
 =?utf-8?B?Q0RZdW5WV1B5cGg4N21UVFZoNmZLSUMxTm42dkhkSjBPcjlMN2dtdzFWa2Iz?=
 =?utf-8?B?aDg1a0QvR2RSdzBtdHoyZFk1NDAyU0NSd1FPdktIZXFxUHdqa0VDc1lBWGRK?=
 =?utf-8?B?YUxtMEtQeitOdUdxdHFjcy9ubHN1a0ZaQ0w3R3VVa0dwdlMzZFQ1YnNlbVRr?=
 =?utf-8?B?ekNQRVhiNUhnODEvKzVlZkdBanNFT1BhVG14ZUFRUkw0anFQYTczbCsrdzVQ?=
 =?utf-8?B?VGFqYnBzc0llQ0RUQ3k5bm9ycUdaaXB4NkFsWlptd3EraWNVNXUzY2Y1TTZa?=
 =?utf-8?B?aWRUR0YzVXlEZHp4VGkwZWExS0FsSWNyZjVOZzNtS3FsSEhDZHhibHNIM0h2?=
 =?utf-8?B?L0JUMitmS2lzZmNvSm14ejNlNGRnUEUzbjhyWEcvdm96T3JocWFwQmUza0dV?=
 =?utf-8?B?THBQc2xiZTFzcnFVVGJHWlBhdTRVNytza080ZVZiLzZGajVCSXJrdkk0ZE9z?=
 =?utf-8?B?eitNYmxUaVo2OFJCUUtDMjZNTXlodENIa0Y5TVpMWVFzYlNIZTFoRnprWXFO?=
 =?utf-8?B?OWVjWDdETjB1VkpNeGxmcjhBbVBZbWVMODNZb0JRMDNXamFvUk9HUjhRZDJo?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <512490C643F9B14399E7843F2D742D39@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15354c46-3808-48c4-982c-08ddfaa3d93f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 13:19:38.7109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocSYdT+t7aNqvALt1DBGHS2p65b34DFLXl4leurodFRCEsNG5YIA8VJv9DUasoXJOdx+f4QicU9ge8QBb6sWrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10354

T24gMTguMDkuMjUgMTc6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOC4wOS4yMDI1IDE0
OjE2LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IC0tLSBhL2NvbmZpZy9hcm02NC5taw0KPj4g
KysrIGIvY29uZmlnL2FybTY0Lm1rDQo+PiBAQCAtMSw1ICsxLDYgQEANCj4+ICAgQ09ORklHX0FS
TSA6PSB5DQo+PiAgIENPTkZJR19BUk1fNjQgOj0geQ0KPj4gK0NPTkZJR19IT1RQTFVHIDo9IHkN
Cj4+ICAgDQo+PiAgIENPTkZJR19YRU5fSU5TVEFMTF9TVUZGSVggOj0NCj4+ICAgDQo+PiAtLS0g
YS9jb25maWcveDg2XzMyLm1rDQo+PiArKysgYi9jb25maWcveDg2XzMyLm1rDQo+PiBAQCAtMyw2
ICszLDcgQEAgQ09ORklHX1g4Nl8zMiA6PSB5DQo+PiAgIA0KPj4gICBDT05GSUdfTUlHUkFURSA6
PSB5DQo+PiAgIENPTkZJR19YQ1VUSUxTIDo9IHkNCj4+ICtDT05GSUdfSE9UUExVRyA6PSB5DQo+
PiAgIA0KPj4gICBDRkxBR1MgKz0gLW0zMiAtbWFyY2g9aTY4Ng0KPj4gICANCj4+IC0tLSBhL2Nv
bmZpZy94ODZfNjQubWsNCj4+ICsrKyBiL2NvbmZpZy94ODZfNjQubWsNCj4+IEBAIC0zLDYgKzMs
NyBAQCBDT05GSUdfWDg2XzY0IDo9IHkNCj4+ICAgDQo+PiAgIENPTkZJR19NSUdSQVRFIDo9IHkN
Cj4+ICAgQ09ORklHX1hDVVRJTFMgOj0geQ0KPj4gK0NPTkZJR19IT1RQTFVHIDo9IHkNCj4+ICAg
DQo+PiAgIENPTkZJR19YRU5fSU5TVEFMTF9TVUZGSVggOj0gLmd6DQo+IA0KPiBJIHJlYWxpemUg
eW91IG9ubHkgZG8gd2hhdCBpcyBhbHJlYWR5IGJlaW5nIGRvbmUsIGJ1dCBJIHF1ZXN0aW9uIHRo
aXMNCj4gd2F5IG9mIGRvaW5nIHRoaW5ncyB3aGVuIHRoZSBzY29wZSBpcyB0b29scy1vbmx5LiBB
bnkgQ09ORklHXyogcHV0IGhlcmUNCj4gY2Fubm90IGhhdmUgYW4gaWRlbnRpY2FsbHkgbmFtZWQs
IGJ1dCBwb3RlbnRpYWxseSBzZXQgZGlmZmVyZW50bHkNCj4gS2NvbmZpZyBzZXR0aW5nIGluIHhl
bi86IEFueSB1c2Ugb2Ygc3VjaCBpbiBhIE1ha2VmaWxlIGNvdWxkIGVuZCB1cCBiZWluZw0KPiB3
cm9uZywgYW5kIHdvdWxkIHByZXR0eSBzdXJlbHkgZW5kIHVwIGJlaW5nIGNvbmZ1c2luZy4NCj4g
DQo+IEphbg0KDQpJIGhhdmUgY2hlY2tlZCB0aGUgd2hvbGUgY29kZWJhc2UgYW5kIGRpZG4ndCBm
aW5kIGFueSBvdGhlciANCkNPTkZJR19IT1RQTFVHLCB0aGUgb25seSBzaW1pbGFyIHRoaW5nIGlz
IENPTkZJR19IT1RQTFVHX0NQVS4gQW55d2F5LCBJIA0KY2FuIGNoYW5nZSBpdCB0byBzb21ldGhp
bmcgbW9yZSBzcGVjaWZpYyBsaWtlIENPTkZJR19IUFRPT0wgZm9yIGV4YW1wbGUuDQoNCi0tIA0K
TXlreXRh


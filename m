Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E2B51A29
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 16:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118378.1464174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwM8k-0001lH-4A; Wed, 10 Sep 2025 14:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118378.1464174; Wed, 10 Sep 2025 14:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwM8k-0001iW-0i; Wed, 10 Sep 2025 14:49:42 +0000
Received: by outflank-mailman (input) for mailman id 1118378;
 Wed, 10 Sep 2025 14:49:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pisp=3V=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uwM8j-0001iQ-30
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 14:49:41 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f701c97-8e55-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 16:49:37 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAXPR03MB7611.eurprd03.prod.outlook.com (2603:10a6:102:205::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:49:35 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:49:35 +0000
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
X-Inumbo-ID: 5f701c97-8e55-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDw+dv+3KAVp9Q6EJlUnS8077pxd20r64ka/2Hni4D4IG+r0zGpAbixmijj9LyDnaGEV+3vgyOb5W7uxRrbwg4K97juhwNQDst6EtnmlDLV4iZ0fCMx7OtNHW8QcR0YECgK2mGDGdVLfOfcF1bzUdvHQiwurGKF/I/164YdWkLb0SkTeTTz0GMBE8k47RRJ5DcU+dXylFqHWdJX1U3WGFH+wJ5ZF4J0amf4qBQS8Fv9Gx1cdAomlqvJEbrGClHjGrA8vsc24ztyU71ejLd48ve/ptlvzymiWcFvDiZuPgdJSpDmEofOitOwXuW9mJrwBMEgQGXS1zmmRwYh6izSqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRaxHGvw2BTA0vfQ5YtYv6Ce4yTniHnIe4jQcbb1m2c=;
 b=TQRtY6Fivz6WYQEnQbeRYkHIhumpEP78l26U/JepveIV7JqT+CFpJfuX+oDsnbccIJyQ8Z6VEZRhwND76LxXJ6jvhu+WaIfp2N2qhbU4Ezzr6cL1NeFufS+UqmdpGea0ov122W+TpuFZHq/4qVLfovkq/bL6v5Zg4WnavBr44t6bHZsB2m7tF+MSOWON67pEW8N18vdMOeCih9QP7/yJ1HcAuSfehktUYsW4O4uLvqqQKVl3UoMJLVkjmNDUxiYigQiQu7GFz4uG2GA/CC+vOH4RTA4ogq1PyLL6HkTn2fhlTjLxarHuVTX/jAQKXv5w6MTnbraF4pHXJhXTtaIYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRaxHGvw2BTA0vfQ5YtYv6Ce4yTniHnIe4jQcbb1m2c=;
 b=l2zzl+kQNtuE72aljgtgUREAobM/+JBPWG18TtFVhtrnTozOZWNVQMjOdGpuesANA28Sq1NjMCukoHirz1CH+lQaqN0UWJFjGN9dECweS6BaujOPJTXfqzDlNSFQZPdmSIFmQGS9+I3690hydVUjjYi+pyEGF5u/dyIOCTTJfky9a9PjYRTpRQx1H9NrKwGmHEZLGrlPTUYF2tk+rfFQDPxgy1fFE1mEtqlXM4ExP6HSU7oS2BU3HIq018D52gqHn1RkkbYb5MZhU/du3YO2Et2f+i9/G/78MJD6bZ2J4LhL33kexef3ralf/CYgnuYVEUpdPFeKKiVtIi//LMctyA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [PATCH v9 1/4] xen/arm: add generic SCI subsystem
Thread-Topic: [PATCH v9 1/4] xen/arm: add generic SCI subsystem
Thread-Index: AQHcHaczp/pn2jKXU0i48m8PFCAwNLSKpFGAgAHknYA=
Date: Wed, 10 Sep 2025 14:49:35 +0000
Message-ID: <e1291003-0738-4c42-83ae-1da575a00f9c@epam.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
 <3e237c5256054a88b1c099d85d8bd1a602bba230.1756995595.git.oleksii_moisieiev@epam.com>
 <c68f1d0e-8a0d-4d8e-a98e-7617c548337a@xen.org>
In-Reply-To: <c68f1d0e-8a0d-4d8e-a98e-7617c548337a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAXPR03MB7611:EE_
x-ms-office365-filtering-correlation-id: f828c17c-0920-4743-c7f1-08ddf0794250
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGJjYU1SdGVkMVFHUkxMQ1JpTVRWRmNtMEdISXVwbkRBNTNLN09sUStBcldn?=
 =?utf-8?B?T2pzQ3VCOW1sT081eWVVNVNjRFJRcVZXTU8xUXRxcEhrVDFlR0JERWdRUnVW?=
 =?utf-8?B?VjBOYUJOM3ptdFUrbUIxcWI3SVNHSVBkdUNJUVUvdWg5ZnZLUE5EZkw5bTFG?=
 =?utf-8?B?K1RvOTIrUWYvNU5ieU9Uais2cGdUUkd4dVlheG1aZy9zUGVsbStWazZPaEZh?=
 =?utf-8?B?UnRVTVg1MjNibEVhaWlhT09sTEF2OGgzS3VjUWVzbUhaZHRmZTk4UkhWUm4w?=
 =?utf-8?B?YmYxOXcxZ1VUdDMrSlpkQStobThkNGdNd0lFWHdRcUIwWWdJb2pmQlBoNVhi?=
 =?utf-8?B?VHRwS0Qva2VDRHJ1VXJhN1lZU0wzVzVTbVI5TlAyZDlqcE1HNHJpaVI2OStB?=
 =?utf-8?B?YWVQR21FZWlKYngxUzk4bnhmTGhFeUhMR0Jpb3krd0d3NlRUMnNPeVFJRlRX?=
 =?utf-8?B?T2RrWXdGL09sai9pN1ZwalpVR2RQaXFzMVk5dEJDMWxlcTFQZ2dTbDZGaTdP?=
 =?utf-8?B?S3Y0NlRpaStEc0JUYW5lT0lJdW8wVDlXWlNqRHNpMHl3NWludUQ0bjQ5Y3hH?=
 =?utf-8?B?N0Q4d2FJVlY1VjdXV1FoTDNJSFVTd1NCa1ZPZjhsV1BkM1grbUtuUEVieUQ0?=
 =?utf-8?B?TURlWTJJeGVpNmRvZjZrOTJMczNjclowRkdqS3NwZjVPbGJJRUlVSVkrSWtW?=
 =?utf-8?B?TFcvWVdkM0M0KzR0azdjSFFUQngyWDliQW5oTzdEMnYzOCs2QVFXV0pQeDVZ?=
 =?utf-8?B?SDBIQzluYlNVcWhIVXBkOU5USHZUcTBLOUJoa2FCbDZXNkhPaHdnWXBPMVEx?=
 =?utf-8?B?SWV4WVFFcUhBZUhOeDlIVERWRGJCUlQ1S2pMNFpsQkNpMVlmT2t0dDkyMjRR?=
 =?utf-8?B?dFpJRUJvRm4zcUk1bDBLS2YvNkgvalZMQ20rMVB3MHEydkwwS250NlRGN2xB?=
 =?utf-8?B?TTRxaW9mRG9XR3cxb3creTA4WkJiZTBKYTY5cXRkbXRIYXh6TGhSaGtMU0t3?=
 =?utf-8?B?cXUvN2ptcE4wNGZWelhkdEFRNWk3NWtNS0NJaFdRMTBkSG9QYTFqZCtUSW5n?=
 =?utf-8?B?L0J5OEluNkpXbXI5WEVIbkNQSkdZV0E2K09sTWxjblprMnByNTVxY0FnRmtO?=
 =?utf-8?B?VjhjNmhkTmtJUmtBdDlDQWhOMFJUR0ljRy82VyswR093MW0vUUhCWmFVUWRU?=
 =?utf-8?B?R3JkYU1IWHYwRlZrZzh0TEs4Z2NDeEZ0dUgxMTFlTW9PR1Z6bmN0bkdUUzhy?=
 =?utf-8?B?Vi9QUGMrN3BLRmpQZng0Lzk1ak8vT2JRV3BpMThEbTJoTDJnSllzRVU5S3Nw?=
 =?utf-8?B?M0NXem5SeE1hQndpSEFTMlF0aW5NSzRRV1VLa1VFVkxrYkIvOVVVaFcxYndC?=
 =?utf-8?B?TW1odXhWc3pWaVhRY3hTMm9hdlJiWXYwTTloV1MxMFlKSDVSS1hmcktRcmJC?=
 =?utf-8?B?R3ZIZk5kdE9Fd2Nsd1pvbzFOdkRBNzl1cm1ENW50eGZjbXcwN0dtWG1kclhq?=
 =?utf-8?B?aWJaUFNGUVZzWWhETkVzOFJqNFNuTkRodFNNNG9CcjBPVTY5elZ1bEkwTjNP?=
 =?utf-8?B?VDlaSVcxYTJiNm15R0VlQVZoU0FiY2FpVm5GODFmYXZFMi9Ic2xKYk5mVlVj?=
 =?utf-8?B?S0gwYzFHTTl4RDdqTnQ3Z2N1eFFsaUxPSzRWTXcrT094ZWNzMWgvTWUvZTho?=
 =?utf-8?B?NUwvazJ2a1MwZ25yUnBYOGxaN1FGdDBkLzlxQmpQUTc1Qzd5VW5xeUZuNCs0?=
 =?utf-8?B?KzdxYkhVZjRteGV6emovbHJTaWtmSUp3enc1SlBPRjQ5bXh4YmtMSDNsRDVz?=
 =?utf-8?B?L084bkZqZE5sWVAzMjdVZFRFTjNXd2FmeFZPc292djZ2RCtnTmF2bWF1WFEy?=
 =?utf-8?B?dkowZWY0RnR0SEM4QUU1SC84TkwxU2NvMmZ1YkZGblZLVElWbWJ3aTNPaDBE?=
 =?utf-8?B?aDhlaDc2T0pVKytSazNVWDJyZVRTZ3Y3K3NodVRYY1RlTCt0QUxCVTA5dXFE?=
 =?utf-8?Q?RGau3AMy7Kh4ybfhIwFjBPMLFKNRy4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnBTekVLRHBxd3pGYzRDWFEwVVpHTmNvYlpTblE2cXJmRG9vWGVoK0dtaVRz?=
 =?utf-8?B?eEZWbDN0dGlMS2FQd0Z3UUZNQ0w1MURUUHNyZG8rNFFTenJJdE95V1VoWGdu?=
 =?utf-8?B?QTFuRE1zTDJ4cjN3Q2J5ZGZIbmREQTMrRksrOFpZRE5nd0QwVFNHeldKYjlr?=
 =?utf-8?B?dDVNbVIxUkQvRFdKRStQNWFmZWdKR3F2UUl2R3ljdVd2eGNNQk5XYU5Id1cx?=
 =?utf-8?B?UG9RMWYybGQ0QmFBT2FSemdyYUxrT0xxOXl1Z0dlWUdQVGpOUnlxUnZHdjhX?=
 =?utf-8?B?cm8ycVd1bGhmWEpNQmdJUU1UcHBGLzN4T2RiaU80elRzNVhWbFc3ZzNCb1hm?=
 =?utf-8?B?RkFwT25xbTh3WHJEMXVRZjRpL25CTzE3K3BMV05Yc0dCeHM3b2Z2c2piWEVo?=
 =?utf-8?B?ZzJocFNEQUJlL1p4TXNnUytoTUJ6SElCNTdkMWRma0JMZGVTVUdNRkFNR3FF?=
 =?utf-8?B?RTdDTW84Yy8rSHQxRWgrN3lmWTFabENrMkNXV3hXRyt2RzE3ZjBYeUh1UmI4?=
 =?utf-8?B?V0IvUTlKZUNaSTlzNEUyR3V6RjdZU09VNDZ4UnNHd0J0L3JWRDJ3RkNsdmgv?=
 =?utf-8?B?aXhHNW1VQndMOFEvUnhFRktXZzduMEl2cXE0ODRrWUhZYzFUaGdzMFNxL3Zu?=
 =?utf-8?B?cnBvNlhGdGdHRmQvcVYrOUhwZG9uUDhBeXRacGt0a09DdmpqNGdwblRqV0lG?=
 =?utf-8?B?WTdwSEEwZUJ1SENlTmw5VWhzeWFuYVROTTlZUnRqbWhEU1BuNUwzNUZiR3dF?=
 =?utf-8?B?MGhXMm5UZU1LMEk0Yy8yd0RDTzZpMzVIMGtlTFNHcExETjhRejBEaWFqUFN5?=
 =?utf-8?B?OEVJMUZseHdXaG53RWZnc041QVhHajBQeld4T01DNlJtWVArYVVJYWN3blNv?=
 =?utf-8?B?Zk9ndlloWkNIbUFoK0k5UkNCMzlHa1ZoMWd3TCthSjI3Z3RVRGY2eEJyS2Rs?=
 =?utf-8?B?WE1kc3I4UGJMeEFQQTlhS3BTaFE4Y0tRbzZHWmRlRHBWNEJqL0FYak81RFNw?=
 =?utf-8?B?KzFtbFdxNjlpY21zQytIK2ZtVm1VL2ovVnVWOFdJNG1KaUxKQ3F0TU5uaDU4?=
 =?utf-8?B?OVRXOGhUSnc1RXZpeVlDYUZkSTRxcGZxRXdWZHJPUmx4WjhIZE9VdmZqclRC?=
 =?utf-8?B?QkRuTExPS2hDWWZQTGNQWTV6ZjBoMDM5T0xjeEpzdkVCNnJXamZZM2RpTXU5?=
 =?utf-8?B?cGxvazhEcEs2M0Y2S1dIcm4rRzlnS2wwQ1E2KytkSlphK2s0OHFFeEVXRmhy?=
 =?utf-8?B?UVMyNysrSHByQ2cxZUI2ZEFYbzZIaldsQW1yeG02UkVjRkx0cFMxTTd5VGF2?=
 =?utf-8?B?bzJiUENXSEpxTGVPUmsrZmJyLzZPRVYwdjJnY0pDNEVjNWNHb3pHR0lBNlhk?=
 =?utf-8?B?cE4xUU5VQk9oSWVNY2ViTXpLUGE1V0IrNlZYRXAzZjE4WVU2T3BDS21xU0lR?=
 =?utf-8?B?Z3RManNRaW44dWpXdTMzWC9wYlF5U1BOM0NoKzUxSElieFNmRmlmRTExMU5w?=
 =?utf-8?B?UStVRUpyaVJ4SXFKa2N3VEMrTUs3MFJDQnYwQS9QYnUxTE0rR2c5cW9QQmh3?=
 =?utf-8?B?V3k3eXh1ZUJxMzNaMHBwRVhKeXhHRUxHbXpCNks4QUdFMWF3VXRBMHpnRjRi?=
 =?utf-8?B?Mi9zVlJiNUlEN0t2OE5PalhjdmhDUmxBUGszUjJQZDBaT2JoWkZzMTQvUUVh?=
 =?utf-8?B?YUhjZ1JEZk9kK0VZeUZwV24yRlpUTXNTeFN3UVgrUFJ1MnZKUXRWb1NTMVM5?=
 =?utf-8?B?Q2JvSUxJejdhcGZZelhVbXhpMlNDSEI1YTY2NlFuZUUzSjlVYWIvT29rN3BM?=
 =?utf-8?B?RjduczFLcGxUTVBSRTYwSGFrZnBEVHhJYm5TQ2tWS3huS0hieEVvanZPdTZv?=
 =?utf-8?B?MEJUOTJUdXJDN3VXVEljYys2dzErM0VJdnRCUnNCY2dWL1MrSVhaZE1ET01I?=
 =?utf-8?B?eEI1elRLQnVvSmlKK0djSml1RnJKL0o5aXJpN24xbGxzOUc4QjhwTGRycnly?=
 =?utf-8?B?NmJkRGpNMlA4TGhaMm5OV2ovZ1ZGZWNtZDZDTkwyWjNXbm1ZMFhpcDEyMGs2?=
 =?utf-8?B?K0N6UFNhbGdRQmRwc01WTVJobEg0bVBUK3Y1S0VYWlR2eFNtK2dBNU9PNFNa?=
 =?utf-8?B?ZnNYZDhidWt6K2MzczZxSUZ1ZXRCSnF3QzFBWFR5a0taTjc3cVpmeXkvRG93?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23B2D5C239AEDC409CD5B4F1A358B0C9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f828c17c-0920-4743-c7f1-08ddf0794250
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 14:49:35.0376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 03c5O3sU0SbSX8Y+6xVR+tCq8Zbj/Cu2Xo0Nprzedk69fEbDuDNM+by52/XJMM+GRxgCmFwVMvldc6A8udhEs8ibzaK0qaOZ6Y0Ek2uJxug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7611

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgb2JzZXJ2YXRpb25zLiBZb3UncmUgYWJz
b2x1dGVseSByaWdodCBhYm91dCB0aGlzLg0KDQpDdXJyZW50bHksIHRoZSBzY2lfcmVsaW5xdWlz
aF9yZXNvdXJjZXMgY2FsbCBkb2Vzbid0IHBlcmZvcm0gYW55IG9wZXJhdGlvbnMNCmJlY2F1c2Ug
dGhlIHNpbmdsZS1hZ2VudCBkb2Vzbid0IGltcGxlbWVudCBhIGNhbGxiYWNrLg0KDQpJJ2xsIG1v
dmUgdGhlIHNjaSBpbXBsZW1lbnRhdGlvbiB0byBiZSBwb3NpdGlvbmVkIGFib3ZlIHRoZSB0ZWUg
DQppbXBsZW1lbnRhdGlvbg0KYW5kIHByZXBhcmUgYSBwYXRjaCBmb3IgdGhpcyBjaGFuZ2UuDQoN
Ci0tDQpPbGVrc2lpDQoNCk9uIDA5LzA5LzIwMjUgMTI6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4gSGkgT2xla3NpaSwNCj4NCj4gV2hpbGUgZ29pbmcgdGhyb3VnaCB0aGUgbGlzdCBvZiByZWNl
bnRseSBjb21taXR0ZWQgcGF0Y2hlcywgSSBub3RpY2VkIA0KPiBzb21lIGNoYW5nZXMgaW4gdGhl
IHJlbGlucXVpc2ggY29kZS4NCj4NCj4NCj4gT24gMDQvMDkvMjAyNSAxNToyMSwgT2xla3NpaSBN
b2lzaWVpZXYgd3JvdGU6DQo+PiBAQCAtMTEwMyw2ICsxMTA5LDEwIEBAIGludCBkb21haW5fcmVs
aW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXQgPSByZWxpbnF1aXNoX3AybV9tYXBwaW5nKGQpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICggcmV0ICkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+
DQo+IFN0eWxlOiBUaGVyZSBpcyBhIG1pc3NpbmcgbmV3bGluZS4NCj4NCj4+ICvCoMKgwqAgUFJP
R1JFU1Moc2NpKToNCj4NCj4gSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHdoeSB0aGUgc2NpIHJl
bGlucXVpc2ggd2FzIGFkZGVkIHJpZ2h0IGluIHRoZSANCj4gbWlkZGxlIG9mIHRoZSBQMk0gcmVs
aW5xdWlzaCBsb2dpYy4gQXQgbGVhc3QgdG8gbWUsIGl0IG1ha2VzIG1vcmUgDQo+IHNlbnNlIHRv
IGJlIGNsb3NlciB0byBURUUgKGJlY2F1c2UgdGhpcyBpcyBmaXJtd2FyZSBzdWJzeXN0ZW0pIGFu
ZCANCj4gcG9zc2libHkgZXZlbiBiZWZvcmUgcmVsZWFzaW5nIGFueSBkZXZpY2VzLg0KPg0KPiBD
YW4geW91IGNsYXJpZnkgd2h5IHlvdSBjaG9zZSB0aGlzIHBsYWNlbWVudD8NCj4NCj4gQ2hlZXJz
LA0KPg0K


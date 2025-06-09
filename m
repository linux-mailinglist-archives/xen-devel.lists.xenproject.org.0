Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA1AD1B68
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 12:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010205.1388364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZae-0000Kn-ET; Mon, 09 Jun 2025 10:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010205.1388364; Mon, 09 Jun 2025 10:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZae-0000Ij-Av; Mon, 09 Jun 2025 10:18:52 +0000
Received: by outflank-mailman (input) for mailman id 1010205;
 Mon, 09 Jun 2025 10:18:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLUs=YY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uOZac-0000Id-CC
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 10:18:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2418::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20ec48cb-451b-11f0-a304-13f23c93f187;
 Mon, 09 Jun 2025 12:18:48 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 10:18:43 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8792.034; Mon, 9 Jun 2025
 10:18:42 +0000
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
X-Inumbo-ID: 20ec48cb-451b-11f0-a304-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4e0Ef9Zh7Ol/bjgd+pEN13ymvSjPLwkUPudL5e1Y69o+SV1KukUzE84ycVmpX/kX0AAkc/c+s5gH9ixgsbYRUQRBzwu3jCUsdbda09xZUnPOZsGBpH6CRK1gpAmgGaZNljl6mtQ9gtdfps7elCRmp3ERqcoL6ILrT+7l1W+r5rlClJO9ahRKHYEG47BpnMHdW3nr4JbQVvfliiw5VYeQl9gqrIIbJ1PiCVbZ95zaG3sgp57m+8wOrF56pFW4njXpDzY+aeJ4U7k9ZpkegY8OwCXDbOlZRgsxv0+QLGQI1KPv5KbjKNE3oZp0LxdOPM9tVWL4FUhtpVxQdD9ZHP5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pX3k29XG7qCf8P+McK8CkVI178boXwL+wwstIqutPLo=;
 b=y9OMY1lBFt0LfNoEn+6tqJk/hBJCXmpiQn2+Y1YRnnXyz8NVh6V73w3LfhbFCV0UMLbOsIR/cz/WK4oOYw8hBLdqyDZElB5Iln8UWtRAt9kGaoyp6D/ZBtW5fTstcm8gSjhhab91mYxLKm105o8f2ztYlJYpfYzjvJOkPgBqarKit3svTrQB3zXX3rQu2EjZx2V77G69SRbF85L273cBGD9lHxh/D556pfLF3/F8LA7yCasyYqdSVGYgnVd9dsMSHeiUNN49ISrlt4SMnq6tBuLP1SajHoDfwLjuEA/BwLVhQKCBOgNaDWngbU5Ofy+eJG8x25KKs8ZV55ykCtOrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pX3k29XG7qCf8P+McK8CkVI178boXwL+wwstIqutPLo=;
 b=OOINODKaZQNuzSS/YhJcXWl/3Snsx0ZKzNM65TRObdsPY+21U6AVDXMvMpYCIioHxX+3/Jicpd6VOozCigFsbJ6d1xMKuO/y3arGlhJR/e0OXiVCv3R05a0huA0dmyylDGOJWG2xMcrC86DAf+lITcGk3tvkUE4H7UJidUw5ZZw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHbziMOHCuaHG697kCTYWoBETQpzrP0lKSAgAGsWwD//4WWAIAAI9IAgAUkMwD//5c1AIAAk1OA
Date: Mon, 9 Jun 2025 10:18:42 +0000
Message-ID:
 <BL1PR12MB5849102F05BD316C0BC20F9FE76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
 <aEKxWLdDDyzmNvGF@macbook.local>
 <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEapjHyBxHkkylkh@macbook.local>
In-Reply-To: <aEapjHyBxHkkylkh@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8792.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB7742:EE_
x-ms-office365-filtering-correlation-id: 1a055cb6-c60f-4e3e-1bda-08dda73f02b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bmdYQmJkS3FHZ0crMjBUSkZDamlFNUxEanY0VGNoZmhkMkJCQmNWYnRuZlc5?=
 =?utf-8?B?ZlROa2YvcUY4R0l5a3MxVVdTcFllM0RQUWt1MGUrNGdaMWhFQWNBemthVWRi?=
 =?utf-8?B?WDVaZi90ZmhTdVlCZEhDTjk3Y01ybkliTGoyZGo3N3JQVHNwb1hPZE9NTG93?=
 =?utf-8?B?YnZPajNrMXN6ZVArd3h2ZXZQYUs3ellsbmM0MGU2S2Y1YUsrMDNSaGhDQ3Yv?=
 =?utf-8?B?dEhsbkxXQ2RmV0lheUdUcjhYU0VaZXFVeWNnNkpzUXFaWkF1NVJScDRsc09Q?=
 =?utf-8?B?V2hEVWNrVVRsOXpnOXJ6ZzJTNnU5ZFNhOC9wN3ZZSzJjaUtEUHdWUGxtWU5l?=
 =?utf-8?B?alljb0xJQ1ZITE53MFB6S1VtZnFHSXRGdFA4VmNCd3VWMEhTK0x2WXptVDg1?=
 =?utf-8?B?eUxyNVNDTmFVSjhKekdXVmZwNlljNTUzdkpUVStOeWhQM3BOem9XLzdPMzBa?=
 =?utf-8?B?dmlQMnhmWW9SeUtGZWIzdVlualh0bWpla0NJbFZWWXNyL3pPL21SbVZ6VDE3?=
 =?utf-8?B?UzdCckxhaWN0T1N6NHVCWEhsa1hpTWpCWDhDaVdYV3lGVUhydFZqcXU0VjlL?=
 =?utf-8?B?UTRuSkI5dGJ0MUY5QTV2TEplQmJFYldrMlh5THkvRWNqR2RLVkVVaENnWlJ0?=
 =?utf-8?B?dU82L3pPdG5EV1l3MWNVUlVkYmFJSjBJTjRjYUVyUkFzSVZOWmZVeFQyUUtK?=
 =?utf-8?B?UGkzVWdSeFlhclNxRUU1V1FpKzVyTWxzUHVlWG1RSUdJZnI5Nzl2NStzSXlG?=
 =?utf-8?B?YUNIMHJUcHo3L3J6RkdWUzJ2eitoQW12U044Q1VsOEF1em5BdjcrR2E5NVpF?=
 =?utf-8?B?UjlFY0lWSnk2bERzTTAvNXJhK2lCWnY1RGRFTzZ1RWNSYm5NMW9tUlN5YlF3?=
 =?utf-8?B?VUs5SzhIcFppdzdsRUd3RWRzNmxDaVhiZjNyR1UrUUlQUVR4VHJpUTVQbllL?=
 =?utf-8?B?bHdmRWhoV3hEUDNydmdKODRCbWsvOXlpd09mOWVEL01jRmVTK2ViWGlUYkFV?=
 =?utf-8?B?WFVoUEpRV0ZGcmpkUWpta3RXOEFTSHpwNU9pc0NnSWIzZ0hQbUhDdnFRUTNs?=
 =?utf-8?B?SnU2ZkVVejQ4U0M3MmptdzdSWkFYOU4zNmpuT0pBaUlUaldzaGhRSWQraUF4?=
 =?utf-8?B?Qm1RWURTU1lkRmtxejh3d08zSk5mZkJsZFUvQm9QWUFrNGtvZGlBWlN3UDBP?=
 =?utf-8?B?U0l1MWZkR3dCVStaVE1udTlVTnlETWRVeHBKSDFmczZGeWpkOGZiV0xaakx1?=
 =?utf-8?B?elh2bmd4dkNNeUwvMXk5Z25LM3F3TkY1UmJhbEo4aHpOcXJ5QjcwTGlNNWlM?=
 =?utf-8?B?MVhtSFNpSEkya3Zsdk1IcEh1Y0t3ejBlMWpsZTI0YURSb1ZRb0xzYjRSMGFm?=
 =?utf-8?B?cWJ4NThLMTVYNENrVEZHR21qckNKbUZJaFJ4WGlpN2FDd0tsYm5TUDRNNVJS?=
 =?utf-8?B?UkZxMXhPTjQzdUVjRDNIYmtVdk54UzJKQzdIMy8xZUVNOHdPbUZSSWEzMC9s?=
 =?utf-8?B?SG1qK3k0YmVLTC9IZ0NNZjNzakNYbWhPN1hVcDMyaGxCNmlIMDEzbXdvd2NQ?=
 =?utf-8?B?SUNsNlJUV0NvVDNMTWZETE96Z0lVQWxRRHhIZjAyaU4xbENvaVl2OWRsaDZH?=
 =?utf-8?B?bVpHRkU2aU5TQU1WNFI0aXNLZW1NOXhqazZyRkV2SThqVWhWRHRyczhZd2Vo?=
 =?utf-8?B?LzBBSEx6RkVMTjBnMFRhSEZSRXJGaTUyVUlGMWNIUURtNUdSeXJtWkxvcDV2?=
 =?utf-8?B?WjhRQmpvOTdFVmJoZDFLVG1wLzhhQ29acThCYXNMS3gxTm03RW52eEpzL0hU?=
 =?utf-8?B?dWZwaUVGbkpHM2VvUW9nQmVhMHVSVGtoRzd3UGk3UjNNZHo0cWNQS2VEdmlO?=
 =?utf-8?B?UTRlUC9WNGlRbmJZc1FKMlk3TFUxRm5HdFJ0aFhTMmpoenI1YTNhZVZkeWc1?=
 =?utf-8?B?YmtlUE1XRmJVZThxRXVKelBUb1dCM2w2emlLQmhBY3NPd05KRE5sRUJRanNM?=
 =?utf-8?B?L3J3c3pvU1l3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VlJrV2FyWVhwMWQvN0VkU3o4QmNQVVRXOHZ3QTh6cHNOYmtOc0c4UGk5L1FP?=
 =?utf-8?B?V29icmFydlBBbDhGZWtnb1NxZFhob29qWjFhNGswTGc0bkl0enVWUjE2Qkp1?=
 =?utf-8?B?b0NaTEhFTlBQd1pFblBDRHN4YlI2NWR2SGJSZ2ZlbVpkRldIUmEwWmZ1VWxE?=
 =?utf-8?B?SUsyWjZpY1k2clhQQ1JobFB3ZGpnT0FFTDI2UlhEVlV5RVd3ZGdxZEdhYzFD?=
 =?utf-8?B?L2tyVzJhY2xUbWQyQmo3SlFyQ3Y4ZDVpU1dEZlM5ekVHS2RuY0lNWFBsZVc0?=
 =?utf-8?B?SFdwZXo2WGtkR0Zuc2gvejlIRWg2cWpOb2tZUTM1UTRzR2FIdW9FWjZBTWxH?=
 =?utf-8?B?TldtTXRQSHJjVEVwdHh6ZGZxQ1RnQjcyVmEzTVdGOTdaOWthS3hCRlE3ek92?=
 =?utf-8?B?YmJCdThuNWNQNzZTNXVlWkVhcU9nT3ZaelRzdGhvMVFxeExUUUtkNFFDR1ND?=
 =?utf-8?B?akp4dy83dktOR0xqR283OHNVdU52eGFsRXVjL0ZxTzBYa3U4VnU2ZGJQWGVM?=
 =?utf-8?B?aWJjbkkxZ1FEZ0ZOV2Jqb2NMT0JsR1YyUkdmbFpKZkVyaElKTzQ1ZmtZaVZv?=
 =?utf-8?B?N3YxRzJRUURKRW9jS3pxMlh3aG41VEEzRS9VbmxrVk50WmZnNG5YTnh2QnNZ?=
 =?utf-8?B?QVRJcmNDZ3BOWS9BbFZJd1E5Rk5adXROOG9QL0NsZFo1Rk5GRHFaQmxzbnV0?=
 =?utf-8?B?VmIrZmhFeVlJdGNLRFE2aUdYRWlBODcyWXlNN2ZlUUpVZEFRQjNxOTlYelVo?=
 =?utf-8?B?V3I5d0FIeGJ4d2d5Y3ovRWorL3VtVS9IcWs2R1B1QXNtNTJkVmdlSE5FbkJs?=
 =?utf-8?B?NmlZb1g5Y0FON0xTV1cvdjdsTVZCaGMvRnRTeVBGTDhITVQ1UW0xemJzUTN6?=
 =?utf-8?B?NEY0aTFKNVptT3RuTVZlYm1MTWhGcjQ2M2hvdUMweUZ1MDR0WDhCNHBoTytI?=
 =?utf-8?B?NEtvWHlOaHJ6Yk9rZ1RhSXBEaDVvMmhZWGFxWjRpOHRYTVVpNCtSWE9JWTVM?=
 =?utf-8?B?UVduWlBRUXA3Y3NiSkpYT0FMRGQ1blBTeUFmT1JZWGlVdVM3SEQzOWJ2Vy9S?=
 =?utf-8?B?dS9NUHlHZWRwV0JudCsrODZGVWNsVDEycVQvaVcvMkpqN2lJaW5DbXlIWnNv?=
 =?utf-8?B?U0tBOHJIRVZBVmxjNExaMDJvVmNDWmNCVEdZY0o2QU5OdXlvbTFveTl0OC9P?=
 =?utf-8?B?Q1czUVNnSjlJYTVSeUlFS2ZBY2p5WkFNMEw4S2NZNUh4Ykc1ZjRKSHYrd1Nh?=
 =?utf-8?B?cVRSS3JQRWEwMmhGSy9Xbm5EM281YXJaZmFCZkhSa0NlZ0VndnVOcytwTHd6?=
 =?utf-8?B?c0NCS1pSV3RMQzlhb2VpTjh3bndiVSt2cVljREU1emVkak9DcXB5bmZYSVFT?=
 =?utf-8?B?WkdWajhvRDVsR3JiOHVwblJCVHpRNnFzUzk0MEFqcHJSa21JS0Y1YTFndENi?=
 =?utf-8?B?OW1UL3cyN2FvN2xTZ21md000OFdEcmxxNG9pT21jaDZIU1RhVVJQNTN3bGc2?=
 =?utf-8?B?L3N3ZFdhSStHa2x6VVllcHJKSnUxWUJSQmx1TDYyaGhrbXN5dWhuREpvNisv?=
 =?utf-8?B?QmF0T2ZUWlh2Z1FxT2t2TjVpZVVTazRGQTM3U290TkZ2czhhSHNJRGNLMzVh?=
 =?utf-8?B?anpoWmRqbTZJaUdsVThHRkp6ZUh3eTZ2YnU3Q2pOcGh5dmV5RU9MdUpRR0to?=
 =?utf-8?B?RVVzTWtKUzNBL2hVSEhVU3A5VFNIcW5vT3JmZ3RjK2lRblBXOWw3aXdtL2FL?=
 =?utf-8?B?TFM5WFBTV2VCcjRkRzlTRWNURkhBeTJkUUZXbEM2a3NvQ01Ka253UzIyN0NF?=
 =?utf-8?B?czhrQU9ieUVFMnVQMlM0NFhjc1NKYXB1cHJlbUVJb2tCb0U2b2JnbTlEMWRE?=
 =?utf-8?B?NGJEMlNpSXVXcjF5NXgrK09wc1c5UzlNN2drYysrbmZubU5ZSTRSdjBhTkZ6?=
 =?utf-8?B?WncvdVdjY1o4Z0ZzZnJKdU92eTZnY0VXRnFVTms4bGZic3R6akVySkx6SlJ1?=
 =?utf-8?B?MFhTUlNtbVRxcU9KNU81aXB0ZlUvbVZ2Q2NMZDFubEg3T2FkYWVwcDQwdFJF?=
 =?utf-8?B?M1J3VFJ4cnh6aWo3WnNDUGRQc0ttbTJGeUN3UFhjbURIT1lXNm9YSHVUcXlj?=
 =?utf-8?Q?WBBY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7B613DB6E9BCB44920624A06A568D60@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a055cb6-c60f-4e3e-1bda-08dda73f02b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 10:18:42.6015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dXrp8BpomuU2rGm+FaqKfMafrfiBrDuuy21CHH53cHBNWgUv66vHvmk9g5Bg2BFnjIwjxxffMbM4rBSu8FU/3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742

T24gMjAyNS82LzkgMTc6MjksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgSnVu
IDA5LCAyMDI1IGF0IDA3OjUwOjIxQU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9u
IDIwMjUvNi82IDE3OjE0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIEZyaSwgSnVu
IDA2LCAyMDI1IGF0IDA5OjA1OjQ4QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBP
biAwNi4wNi4yMDI1IDA4OjI5LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+PiBPbiAyMDI1LzYv
NSAyMDo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+PiBPbiBNb24sIE1heSAyNiwg
MjAyNSBhdCAwNTo0NTo1M1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZTogDQo+Pj4+Pj4+ICsg
IH07IFwNCj4+Pj4+Pj4gKyAgc3RhdGljIHZwY2lfY2FwYWJpbGl0eV90ICpjb25zdCBmaW5pdCMj
X2VudHJ5ICBcDQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEu
dnBjaSIpID0gJmZpbml0IyNfdA0KPj4+Pj4+DQo+Pj4+Pj4gSU1PIHRoaXMgc2hvdWxkIGJldHRl
ciB1c2UgLnJvZGF0YSBpbnN0ZWFkIG9mIC5kYXRhLiANCj4+Pj4+IElzIGJlbG93IGNoYW5nZSBj
b3JyZWN0Pw0KPj4+Pj4NCj4+Pj4+ICsgICAgc3RhdGljIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90
ICpjb25zdCBmaW5pdCMjX2VudHJ5ICBcDQo+Pj4+PiArICAgICAgICBfX3VzZWRfc2VjdGlvbigi
LnJvZGF0YSIpID0gJmZpbml0IyNfdA0KPj4+Pg0KPj4+PiBObywgc3BlY2lmaWNhbGx5IGJlY2F1
c2UgLi4uDQo+Pj4+DQo+Pj4+Pj4gTm90IHRoYXQgaXQgbWF0dGVycyBtdWNoIGluIHByYWN0aWNl
LCBhcyB3ZSBwbGFjZSBpdCBpbiAucm9kYXRhIGFueXdheS4gIE5vdGUNCj4+Pj4+PiBob3dldmVy
IHlvdSB3aWxsIGhhdmUgdG8gbW92ZSB0aGUgcGxhY2VtZW50IG9mIHRoZSBWUENJX0FSUkFZIGlu
IHRoZQ0KPj4+Pj4+IGxpbmtlciBzY3JpcHQgYWhlYWQgb2YgKigucm9kYXRhLiopLCBvdGhlcndp
c2UgdGhhdCBzZWN0aW9uIG1hdGNoIHdpbGwNCj4+Pj4+PiBjb25zdW1lIHRoZSB2UENJIGRhdGEu
DQo+Pj4+PiBJIGFtIHNvcnJ5LCBob3cgdG8gbW92ZSBpdCBhaGVhZCBvZiAqKC5yb2RhdGEuKikg
Pw0KPj4+Pj4gSXMgYmVsb3cgY2hhbmdlIGNvcnJlY3Q/DQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmggYi94ZW4vaW5jbHVkZS94ZW4veGVuLmxkcy5o
DQo+Pj4+PiBpbmRleCA3OTNkMGUxMTQ1MGMuLjM4MTc2NDIxMzVhYSAxMDA2NDQNCj4+Pj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmgNCj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi94ZW4ubGRzLmgNCj4+Pj4+IEBAIC0xODgsNyArMTg4LDcgQEANCj4+Pj4+ICAjZGVmaW5lIFZQ
Q0lfQVJSQVkgICAgICAgICAgICAgICBcDQo+Pj4+PiAgICAgICAgIC4gPSBBTElHTihQT0lOVEVS
X0FMSUdOKTsgXA0KPj4+Pj4gICAgICAgICBfX3N0YXJ0X3ZwY2lfYXJyYXkgPSAuOyAgIFwNCj4+
Pj4+IC0gICAgICAgKihTT1JUKC5kYXRhLnZwY2kuKikpICAgICBcDQo+Pj4+PiArICAgICAgICoo
LnJvZGF0YSkgICAgICAgICAgICAgXA0KPj4+Pg0KPj4+PiAuLi4gdGhpcyBpc24ndCAtIHlvdSdk
IG1vdmUgX2FsbF8gb2YgLnJvZGF0YSBpbnRvIGhlcmUsIHdoaWNoIGRlZmluaXRlbHkNCj4+Pj4g
aXNuJ3Qgd2hhdCB5b3Ugd2FudC4gV2hhdCBJIHVuZGVyc3RhbmQgUm9nZXIgbWVhbnQgd2FzIGEg
LnJvZGF0YS1saWtlDQo+Pj4+IHNlY3Rpb24sIGUuZy4gLnJvZGF0YS52cGNpLiogKG11Y2ggbGlr
ZSBpdCB3YXMgLmRhdGEudnBjaS4qIGJlZm9yZSkuDQo+Pj4NCj4+PiBJbmRlZWQsIG15IHN1Z2dl
c3Rpb24gd2FzIG1lcmVseSB0byB1c2UgLnJvZGF0YSBpbnN0ZWFkIG9mIC5kYXRhLCBhcw0KPj4+
IHRoYXQncyBtb3JlIGFjY3VyYXRlIElNTy4gIEkgdGhpbmsgaXQgc2hvdWxkIGJlICooLnJvZGF0
YS52cGNpKSAoYW5kDQo+Pj4gc2FtZSBzZWN0aW9uIGNoYW5nZSBmb3IgdGhlIF9fdXNlZF9zZWN0
aW9uKCkgYXR0cmlidXRlLg0KPj4NCj4+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZSBu
ZXh0IHZlcnNpb24gd2lsbCBiZToNCj4+DQo+PiArICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFi
aWxpdHlfdCAqY29uc3QgZmluaXQjI19lbnRyeSAgXA0KPj4gKyAgICAgICAgX191c2VkX3NlY3Rp
b24oIi5yb2RhdGEudnBjaSIpID0gJmZpbml0IyNfdA0KPj4gKw0KPj4NCj4+IGFuZA0KPj4NCj4+
ICAjZGVmaW5lIFZQQ0lfQVJSQVkgICAgICAgICAgICAgICBcDQo+PiAgICAgICAgIC4gPSBBTElH
TihQT0lOVEVSX0FMSUdOKTsgXA0KPj4gICAgICAgICBfX3N0YXJ0X3ZwY2lfYXJyYXkgPSAuOyAg
IFwNCj4+IC0gICAgICAgKihTT1JUKC5kYXRhLnZwY2kuKikpICAgICBcDQo+PiArICAgICAgICoo
LnJvZGF0YS52cGNpKSAgICAgICAgICAgXA0KPj4gICAgICAgICBfX2VuZF92cGNpX2FycmF5ID0g
LjsNCj4gDQo+IERpZCB5b3UgYWxzbyBtb3ZlIHRoZSBpbnN0YW5jZXMgb2YgVlBDSV9BUlJBWSBp
biB0aGUgbGlua2VyIHNjcmlwdHMgc28NCj4gaXQncyBiZWZvcmUgdGhlIGNhdGNoLWFsbCAqKC5y
b2RhdGEuKik/DQo+IA0KPj4NCj4+IEJ1dCwgdGhhdCBlbmNvdW50ZXJlZCBhbiB3YXJuaW5nIHdo
ZW4gY29tcGlsaW5nLg0KPj4gIiB7c3RhbmRhcmQgaW5wdXR9OiBBc3NlbWJsZXIgbWVzc2FnZXM6
DQo+PiB7c3RhbmRhcmQgaW5wdXR9OjExNjA6IFdhcm5pbmc6IHNldHRpbmcgaW5jb3JyZWN0IHNl
Y3Rpb24gYXR0cmlidXRlcyBmb3IgLnJvZGF0YS52cGNpDQo+PiB7c3RhbmRhcmQgaW5wdXR9OiBB
c3NlbWJsZXIgbWVzc2FnZXM6DQo+PiB7c3RhbmRhcmQgaW5wdXR9OjMwMzQ6IFdhcm5pbmc6IHNl
dHRpbmcgaW5jb3JyZWN0IHNlY3Rpb24gYXR0cmlidXRlcyBmb3IgLnJvZGF0YS52cGNpDQo+PiB7
c3RhbmRhcmQgaW5wdXR9OiBBc3NlbWJsZXIgbWVzc2FnZXM6DQo+PiB7c3RhbmRhcmQgaW5wdXR9
OjY2ODY6IFdhcm5pbmc6IHNldHRpbmcgaW5jb3JyZWN0IHNlY3Rpb24gYXR0cmlidXRlcyBmb3Ig
LnJvZGF0YS52cGNpICINCj4gDQo+IFdoYXQgYXJlIHRoZSBhdHRyaWJ1dGVzIGZvciAucm9kYXRh
LnZwY2kgaW4gdGhlIG9iamVjdCBmaWxlcz8gIFlvdSBjYW4NCj4gZ2V0IHRob3NlIHVzaW5nIG9i
amR1bXAgb3IgcmVhZGVsZiwgZm9yIGV4YW1wbGU6DQo+IA0KPiAkIG9iamR1bXAgLWggeGVuL2Ry
aXZlcnMvdnBjaS9tc2kubw0KPiBbLi4uXQ0KPiAgMTcgLmRhdGEudnBjaS45ICAwMDAwMDAwOCAg
MDAwMDAwMDAwMDAwMDAwMCAgMDAwMDAwMDAwMDAwMDAwMCAgMDAwMDBhNTAgIDIqKjMNCj4gICAg
ICAgICAgICAgICAgICAgQ09OVEVOVFMsIEFMTE9DLCBMT0FELCBSRUxPQywgREFUQQ0KPiANCj4g
SXQgc2hvdWxkIGJlIFJFQURPTkxZLCBvdGhlcndpc2UgeW91IHdpbGwgZ2V0IHRob3NlIG1lc3Nh
Z2VzLg0KPiANCj4+IEFuZCwgZHVyaW5nIGJvb3RpbmcgWGVuLCBhbGwgdmFsdWUgb2YgX19zdGFy
dF92cGNpX2FycmF5IGlzIGluY29ycmVjdC4NCj4+IERvIEkgbWlzcyBhbnl0aGluZz8NCj4gDQo+
IEkgdGhpbmsgdGhhdCdzIGxpa2VseSBiZWNhdXNlIHlvdSBoYXZlbid0IG1vdmVkIHRoZSBpbnN0
YW5jZSBvZg0KPiBWUENJX0FSUkFZIGluIHRoZSBsaW5rZXIgc2NyaXB0Pw0KT2gsIHJpZ2h0LiBT
b3JyeSwgSSBmb3Jnb3QgdG8gbW92ZSBpdC4NCkFmdGVyIGNoYW5naW5nIHRoaXMsIGl0IHdvcmtz
IG5vdy4NCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94
ODYveGVuLmxkcy5TDQppbmRleCBiZjk1NmI2YzVmYzAuLmM4OGZkNjJmNGYwZCAxMDA2NDQNCi0t
LSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMN
CkBAIC0xMzQsNiArMTM0LDcgQEAgU0VDVElPTlMNCiAgICAgICAgQlVHRlJBTUVTDQoNCiAgICAg
ICAgKigucm9kYXRhKQ0KKyAgICAgICBWUENJX0FSUkFZDQogICAgICAgICooLnJvZGF0YS4qKQ0K
ICAgICAgICAqKC5kYXRhLnJlbC5ybykNCiAgICAgICAgKiguZGF0YS5yZWwucm8uKikNCkBAIC0x
NDgsNyArMTQ5LDYgQEAgU0VDVElPTlMNCiAgICAgICAgKigubm90ZS5nbnUuYnVpbGQtaWQpDQog
ICAgICAgIF9fbm90ZV9nbnVfYnVpbGRfaWRfZW5kID0gLjsNCiAjZW5kaWYNCi0gICAgICAgVlBD
SV9BUlJBWQ0KICAgfSBQSERSKHRleHQpDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0K
QmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


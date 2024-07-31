Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B9942956
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 10:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768343.1179111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4s2-0001GN-NY; Wed, 31 Jul 2024 08:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768343.1179111; Wed, 31 Jul 2024 08:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4s2-0001ER-Kt; Wed, 31 Jul 2024 08:39:42 +0000
Received: by outflank-mailman (input) for mailman id 768343;
 Wed, 31 Jul 2024 08:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMgj=O7=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZ4s0-0001EH-Mx
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 08:39:40 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20604.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc9a224-4f18-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 10:39:39 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 08:39:35 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 08:39:35 +0000
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
X-Inumbo-ID: 6cc9a224-4f18-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFIG7JIcJnv2BLLljkP0yfrYqSpuw8f97B6Io38y+UsXH3nO/FOYvllvKLK6TvmJDFDXE0cEDap8CsQRkVWaG+KH7ld9k6C3Z/OuUvowpCRSIuXaRECOmsB96uFI6k4/Ypk8IT+kByNiiq9gox09l4tkc6wqGPpzlhvxyXHUJ7Gu7Fa4VvMFkiPOAGIcG7x2+TKv6WP7Wexmz1h4QKSUxH49yzatouvSHO2WsRXtWpnt0XEyCd9fLjSvomaZVIS6nwE5qebxYZDYc06bUtX6uf60ljD2QGimtOSzJde67hUiTNHTH1l6in45gAG3ZC4ZF3pjowXDiakDL75/efWKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvSbUFtu1E3Q5FoKpksFbmD/nt1tE8MtC0SXFNBIjM4=;
 b=DVllcCqWvPuJot8kDSg9O8+nOyFyd3GAzQDRXgS97M48hSaaQ+Klh7Mke3iEi5Kf8wNeA9yJvV2M35xw8aMB1+nDFzUMbpIXRP6K8gIn++Ke5vDlALh/FFs/Bs9oMhLDa71bOaO76bx4kTQx/QJ9OZG7SLOJJSfTH+vEX3SZA/Spj0VTgXkc39r9NipMHSnhWx0NfZnCJUieGyRKv/+58X3DEVge/pW5AUR2Zqzuf3+5ARKb2BlJmkfpl/lUOBPvKvv84i7GREXKgYJA0qyBD/BpAwtKObHMDVYDrqcio8JyKp5BAu0jNmVIv0mH6GOARrw294h+fqYl5n0Fe63DhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvSbUFtu1E3Q5FoKpksFbmD/nt1tE8MtC0SXFNBIjM4=;
 b=ZcFT8vvZko3ETyfbsNRGWrrjKXI/yaOitfqafaotuN1KxN480Vun0XO4egkXQDUqonYmjL4S62j4ZymbK7tU0PdYJyodeY7qatYjrDhMpRJRHCALRAnXD9ZtOXnprvMqzCZJRls16gn4jgFNh9gzFfOpltt58j6sA5wvgKLpngo=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHa0SvUYCKIEvNO4Ei/mjm7Qit34LIQmkQAgACSt4A=
Date: Wed, 31 Jul 2024 08:39:35 +0000
Message-ID:
 <BL1PR12MB584963452314C3B6B8E8A5B7E7B12@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com> <Zqnswi7ihOhMxPsi@macbook>
In-Reply-To: <Zqnswi7ihOhMxPsi@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7807.009)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB6563:EE_
x-ms-office365-filtering-correlation-id: daf94622-2576-4795-4caf-08dcb13c4e82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OUZ5dERXUnNtd0NFdjRmTlZHdzhRSmFaaTd4R1BOdFFqYVk5SHJxYWFPdWxO?=
 =?utf-8?B?ZFA2K0M3cGFseitkRUcydG9BdzJxZTFqc0h4bTVHb3VyTFR1eVpjdTdvZlJv?=
 =?utf-8?B?YnVkbk5QeDZoWjhRYXEwQVhjU0hNNHN6OU9yV3BtS0ZxMnVpZ0F5MTNCR0ts?=
 =?utf-8?B?ODBGWU5hQlI4Y253Yk4wQ3EvMzRtZSt0eEdqUzJyYS8zNU1PUjJaTzdKWEM0?=
 =?utf-8?B?V0txa3VmVFJVRCttM2JvbXh4NmI0bjhlRGJoQjdHM0dsNFdZRU84eDhrLzYv?=
 =?utf-8?B?TmJaNHZOTy80RDZWWWVXUHRtdnBmTFlnak1Lelcya3liVGNuWkZjenpMZmw0?=
 =?utf-8?B?T3h0M2VvZHdhOGo0NUhBNkNVZWh3K3VQSzNram5qMFl1dm53RlB4NXdOMGxK?=
 =?utf-8?B?c0RjekplNEdxS3o5dUxvMEx4QWdnVmVBTG1KNXJSZWcvdytmcGF5VFppMVY2?=
 =?utf-8?B?SXU2aFJsSkhPZEplSnVhK1BnWDFxUUJ6MmQ5cnFsYWcwNFAwRDk3NW5ObzhL?=
 =?utf-8?B?SzdkbGorWi9jOGlhN0tWcUtRbGpxRHVteEpLdTJXY2lkWi9RK1IzQUIybkZ0?=
 =?utf-8?B?RFB2UGJ3LyttbHhndU41c1lhMWw4dXl5U09BWm9iVkRUL2pFTThlMFBjRy81?=
 =?utf-8?B?S25kWlhRTXhkWlU5QkZYMGZnZXpJVDF1clAvVEF1RnhqZExxMmw3NWdKdTdK?=
 =?utf-8?B?WURITFZJejNWUVZNYjQ0M3FxRWZQVjFTN3ptNnVpQTI2STM0Ylk0YkdDRFJE?=
 =?utf-8?B?YXJDaVFzcFJISE14M2Zha2lyeHJUeHJzTkxJOWw1REFGNjg0Vm4yclhPaVlq?=
 =?utf-8?B?SDgzRjY1bmJmTTBNbm13ZklRQ1ZSKzVxV3R1VmVJUHQvRkxTTkgyaHRhc0ZD?=
 =?utf-8?B?MjdvNzlJaFM0Qm0vUFZudi81azJDdXFqV3BKTCs5cXo0UHh4QVcvd1FuRnhP?=
 =?utf-8?B?UlZBQ2cwUXlrSzVpQTY2VW05b0Fwd24vZmJLSlA4TzhoaFRwem1ndUZBU2dG?=
 =?utf-8?B?ZUhJM3JJSUIvNG1VbFQvMU4rKzgzUzIwMjdQVyt6ZlQ2clNKUHhLU1RjMFN5?=
 =?utf-8?B?SDhVR1pvME5FaTlRcEJ0aE1MWlRWMmdnOFVTNWNuTytyT1hqVWIvKy9GNEx5?=
 =?utf-8?B?d0RhWCt6TU9PdERjdTdxTkpZUVcra1BwSVRFTnloMmtoT2JyTHVRVXBCdzhX?=
 =?utf-8?B?VjRSVnB1bkQ5WFhyRXdyOTU5TzROR05uMHNGOWZnSjBHUnVUZ0ZJMEpZN2J6?=
 =?utf-8?B?M3M3ZDJBOUs3L2hTZU40UnJ0UjZLSnRXMEFXaVp2Z2FrRHpSdTFqQ3FMajNl?=
 =?utf-8?B?M0NRZXYyUTRyaGN0ZEhYR0JVNnpNaWJ2WjZGaTlGa3Q2bGZEN09KZlpUQVdH?=
 =?utf-8?B?RFV5WWdOUlpYRmNJaWt6T2tXR0xzY3MraWlEanVTN3Z0M3YySE9rWGZIMUVP?=
 =?utf-8?B?MFZDVk1NNFJYV1NuekJ1M1RlY201WlFxVlA5QXJCNSs1VTZQeVhla3FYd25n?=
 =?utf-8?B?eExUYU4wQ1ZuQnZKbTEvdjRFdmJ4K0pNRlB1MXozZ2wweG0rZi9lMDVFMXFN?=
 =?utf-8?B?ejdBMVFBSjNIREl3OUVQK2VNWmVzempXcDBvTVpndDRiYVRWSDhxUXRrYlVP?=
 =?utf-8?B?UlhjYmoxeFR3VmgxS1M5KzJwSFlrcmUwdmdoYlAvdDd4Vy9LdUI5bHJQTncr?=
 =?utf-8?B?ZlQ1SXFxYVBZV0NORXZmL1ZQcFJGdW5kQTRVWXpaTFRsaGZJaWt2Sks5WHZF?=
 =?utf-8?B?NGhIVHV4Qm8rekVSdjh6OGNkTDJZbTliVVc4ZUQ5MmxnYTJSRXptOWViNEVO?=
 =?utf-8?B?dlgvN3R3T2dvZFpGdnhGWkdWV2M4MExTb0wvMkRUOW5aUFhWc3k1MTQ3QlBH?=
 =?utf-8?B?cm5HZXBGOEpaZFVheXAycXdURzBrWjZLK1A3N3Iwd0VuTHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXNzSnIrUStLMEpxUlF3M0wxMm5wWWNCT3dKczNCZ0NVOFJlYWlmOFdoQmhj?=
 =?utf-8?B?bzJFNUErdmJtSkxnMU96N1RBWjVhK1Nqd2VpZWpoTFkvUFJjeUVLS1ZJQndW?=
 =?utf-8?B?cVVscDQwN2JhZlFSV0ZYSWFIY09xY3k1Vk1aVFdBWG5Sa1BWdk5GZ2R1b2xY?=
 =?utf-8?B?UjhxdG5wdTJXNnkwZEZvWkkwdHRnSFVqSzVyLzd0Q2c4c21VWUJpcHQ2MkFR?=
 =?utf-8?B?Zk5icUI0bmRpQWZ1eHNuMFFtVnpDUW54MXc4N21qU0pONzY3Tk5QK0tzdmcw?=
 =?utf-8?B?YW43Z1NNQnUvOEJXV3ErTzFreXliSG9ENHgxVGRCZUJWKzgwNEl2R1MzTjJJ?=
 =?utf-8?B?SWF4dFp3V3NEaWFpdUcvYXhqZ2x1N1REMG9ML3JQeUdXL3Arc3ROV1ZSV0t1?=
 =?utf-8?B?TXN0eG00UTN1RmNDYXNTclVYdkZyRVhYazl2a3VCK1BBT3F3SGR0eGJYeWxP?=
 =?utf-8?B?bkIyNCtjMEMzNkJMTU1DRndFUk8xRkR6VlpKRjR2ZEpEMGl0TUl4akZIejZw?=
 =?utf-8?B?NzV0WXdETXFxdG5KRHR3MXF1NmQ2elBVcldESnVmYTBOdzJjUHVBTWQ0bk90?=
 =?utf-8?B?SHJEVVoyc1o3N0VqUFZoNHNwVDRSdzZNMDY2aU1VY1dSNEdQdE9OS1NjZnN3?=
 =?utf-8?B?eGtFL3pVdjQ4dkRsUnE3c0VXQnFOcm5lMnptTU5tZHp4VExUNHdYVmZOYk5q?=
 =?utf-8?B?NXFsSzEvem9KOWY5T0QvZytmYmNVRmdlVDZzY1FjOHd0d1RmTmQ0Z0RjUUl2?=
 =?utf-8?B?Mm1iWHpJYUpkR1dUR25udW8xZUFvVmtqaUpjZW52MWNJV1ZTVS9vbmtXdWNl?=
 =?utf-8?B?dTdFYU5DeXIvTU9DYlZpUFBPbkdkQnZjZDNwbmE5NDhCM1owNlptMC9TRTZJ?=
 =?utf-8?B?SlRsOU90c2NzdmFGTHBISEN2ZkFoYnRRSWV2V1hVRG1pWm45MHJZS3hjRlcx?=
 =?utf-8?B?d1g3NW9MUTJnZlZrc2c1K2d2bk5NS2Z5OG1IUm96Q3Brbm56L0krZVQ3L0p5?=
 =?utf-8?B?aGl2QXJqYmFQNG9RYW9keG96bEN4bnV3VHBtakJGcDRCaE43U08rRjhmcGMr?=
 =?utf-8?B?TmNCcTdZYk14dFBJbVkxWmR3a3NNZmF1cE1sRUhYMWsvZEVMRXFRU0w3S2tu?=
 =?utf-8?B?UHZYSUxNbGh4S1BlcWR4eFQwOVlmQUpyaCtaMzVlZk1JNWZGeXBPcVJ3OHpm?=
 =?utf-8?B?ZURndHRsVXI4dk1sNGwxV29FNE9GakYrSXlhbTd5Zk4zNC80VXVkbUlPQmI4?=
 =?utf-8?B?bWNSL2cvZExpbHVNSXUrclQ3b0QzNldFb2k1OHFQdVNqT29xZHlhbVpMcGZa?=
 =?utf-8?B?Mmh5YlBKeTFCUUFCS0o4Z0I2VFFjSFlWSU5UdkwybWxZRGxhQUh2REQ4cmxD?=
 =?utf-8?B?M1lyNzZ5STNwWC9BRzFtMVlNTG9SMlhTaHNaTzVHLzFtRlFXZjNtbjk5d0Y0?=
 =?utf-8?B?Nm43SHM2RnE4VWpJNTIrNFZBL0d5d01TM3k0MzFXNUtDaU5LUUgxMHZhZUhh?=
 =?utf-8?B?NWd0UkRNSVBZVzc2a3JEYjBhN3FGM1FoMWZ2cXBHVDR2Q0ViaWEvSkJSZmVY?=
 =?utf-8?B?VXZJVnIzZitxTmlocnNlVkgzMkx2R0d4Q0JiYVJQSFJBcytKbWUwTDJ4a2Nh?=
 =?utf-8?B?LzVvREZ3MUVYOEVyZWVrUXN2M1l0dmlpMnMrMUpvY2FnZzBlQ0ExT2hURXdl?=
 =?utf-8?B?RWFKc1dqcE1uNkcyTERQcjd0QllISytvd0M3U0ZaM3owZ2dzNHVLVW5Sa093?=
 =?utf-8?B?djdORDUvRHprb01GSzhpblE3d0JmQXNuTVFvNldOUVlnRmp1dGNQMVVXbDQ0?=
 =?utf-8?B?Yk9EMWE5UWRJT0dsckVlcWI3YytWV01PYUhoK1loNXJCVmVybERCRUkydHAv?=
 =?utf-8?B?SzJmZ3NoQmlXZzlacU9CdXFKZTVsV2x6Z1lUdjNyWG9nMjlnN3BobEh1U3Q3?=
 =?utf-8?B?eUIwM0FnajFKVkd0eDlJYkZCWldRUTFsNUY0SGRjMGlrbU9SdDd5YXQ4dDgw?=
 =?utf-8?B?clgyc1hFUXpPNVRrV2xwQk9NN3ZYWXpSS1BIN2dpU29UOGtUc08vaGM2T1Q5?=
 =?utf-8?B?aXdKRHgyanNveGNNRzhaSVRtRnl4N0J2NGt6dmozenZud1dWNUtKNjlRaFEv?=
 =?utf-8?Q?YpNc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A96C549BFD46A41B333E0077D24FA76@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf94622-2576-4795-4caf-08dcb13c4e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 08:39:35.3029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M7RHEqFKdeV9TSbsUbMDgKoQMpFCSddnrBLVvRTiaHI0J7BcvuTOlrVwCu8vwMmnco8Ls7U0ux1zPrVGT3yO4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563

T24gMjAyNC83LzMxIDE1OjUwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIEp1
bCAwOCwgMjAyNCBhdCAwNzo0MToxOVBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IElm
IHJ1biBYZW4gd2l0aCBQVkggZG9tMCBhbmQgaHZtIGRvbVUsIGh2bSB3aWxsIG1hcCBhIHBpcnEg
Zm9yDQo+PiBhIHBhc3N0aHJvdWdoIGRldmljZSBieSB1c2luZyBnc2ksIHNlZSBxZW11IGNvZGUN
Cj4+IHhlbl9wdF9yZWFsaXplLT54Y19waHlzZGV2X21hcF9waXJxIGFuZCBsaWJ4bCBjb2RlDQo+
PiBwY2lfYWRkX2RtX2RvbmUtPnhjX3BoeXNkZXZfbWFwX3BpcnEuIFRoZW4geGNfcGh5c2Rldl9t
YXBfcGlycQ0KPj4gd2lsbCBjYWxsIGludG8gWGVuLCBidXQgaW4gaHZtX3BoeXNkZXZfb3AsIFBI
WVNERVZPUF9tYXBfcGlycQ0KPj4gaXMgbm90IGFsbG93ZWQgYmVjYXVzZSBjdXJyZCBpcyBQVkgg
ZG9tMCBhbmQgUFZIIGhhcyBubw0KPj4gWDg2X0VNVV9VU0VfUElSUSBmbGFnLCBpdCB3aWxsIGZh
aWwgYXQgaGFzX3BpcnEgY2hlY2suDQo+Pg0KPj4gU28sIGFsbG93IFBIWVNERVZPUF9tYXBfcGly
cSB3aGVuIGRvbTAgaXMgUFZIIGFuZCBhbHNvIGFsbG93DQo+PiBQSFlTREVWT1BfdW5tYXBfcGly
cSBmb3IgdGhlIHJlbW92YWwgZGV2aWNlIHBhdGggdG8gdW5tYXAgcGlycS4NCj4+IEFuZCBhZGQg
YSBuZXcgY2hlY2sgdG8gcHJldmVudCAodW4pbWFwIHdoZW4gdGhlIHN1YmplY3QgZG9tYWluDQo+
PiBkb2Vzbid0IGhhdmUgYSBub3Rpb24gb2YgUElSUS4NCj4+DQo+PiBTbyB0aGF0IHRoZSBpbnRl
cnJ1cHQgb2YgYSBwYXNzdGhyb3VnaCBkZXZpY2UgY2FuIGJlDQo+PiBzdWNjZXNzZnVsbHkgbWFw
cGVkIHRvIHBpcnEgZm9yIGRvbVUgd2l0aCBhIG5vdGlvbiBvZiBQSVJRDQo+PiB3aGVuIGRvbTAg
aXMgUFZIDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFt
ZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+PiAt
LS0NCj4+ICB4ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jIHwgIDYgKysrKysrDQo+PiAgeGVu
L2FyY2gveDg2L3BoeXNkZXYuYyAgICAgICB8IDEyICsrKysrKysrKystLQ0KPj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlw
ZXJjYWxsLmMNCj4+IGluZGV4IDBmYWI2NzBhNDg3MS4uMDNhZGEzYzg4MGJkIDEwMDY0NA0KPj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9oeXBlcmNhbGwuYw0KPj4gQEAgLTcxLDggKzcxLDE0IEBAIGxvbmcgaHZtX3BoeXNkZXZf
b3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgDQo+PiAg
ICAgIHN3aXRjaCAoIGNtZCApDQo+PiAgICAgIHsNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAg
ICAqIE9ubHkgYmVpbmcgcGVybWl0dGVkIGZvciBtYW5hZ2VtZW50IG9mIG90aGVyIGRvbWFpbnMu
DQo+PiArICAgICAgICAqIEZ1cnRoZXIgcmVzdHJpY3Rpb25zIGFyZSBlbmZvcmNlZCBpbiBkb19w
aHlzZGV2X29wLg0KPj4gKyAgICAgICAgKi8NCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfbWFwX3Bp
cnE6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3VubWFwX3BpcnE6DQo+PiArICAgICAgICBicmVh
azsNCj4+ICsNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfZW9pOg0KPj4gICAgICBjYXNlIFBIWVNE
RVZPUF9pcnFfc3RhdHVzX3F1ZXJ5Og0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9nZXRfZnJlZV9w
aXJxOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMgYi94ZW4vYXJjaC94
ODYvcGh5c2Rldi5jDQo+PiBpbmRleCBkNmRkNjIyOTUyYTkuLjlmMzBhOGM2M2EwNiAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9w
aHlzZGV2LmMNCj4+IEBAIC0zMjMsNyArMzIzLDExIEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50
IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICBpZiAo
ICFkICkNCj4+ICAgICAgICAgICAgICBicmVhazsNCj4+ICANCj4+IC0gICAgICAgIHJldCA9IHBo
eXNkZXZfbWFwX3BpcnEoZCwgbWFwLnR5cGUsICZtYXAuaW5kZXgsICZtYXAucGlycSwgJm1zaSk7
DQo+PiArICAgICAgICAvKiBPbmx5IG1hcHBpbmcgd2hlbiB0aGUgc3ViamVjdCBkb21haW4gaGFz
IGEgbm90aW9uIG9mIFBJUlEgKi8NCj4+ICsgICAgICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkg
fHwgaGFzX3BpcnEoZCkgKQ0KPiANCj4gSSdtIGFmcmFpZCB0aGlzIGlzIG5vdCB0cnVlLiAgSXQn
cyBmaW5lIHRvIG1hcCBpbnRlcnJ1cHRzIHRvIEhWTQ0KPiBkb21haW5zIHRoYXQgZG9uJ3QgaGF2
ZSBYRU5GRUFUX2h2bV9waXJxcyBlbmFibGVkLiAgaGFzX3BpcnEoKSBzaW1wbHkNCj4gYWxsb3cg
SFZNIGRvbWFpbnMgdG8gcm91dGUgaW50ZXJydXB0cyBmcm9tIGRldmljZXMgKGVpdGhlciBlbXVs
YXRlZCBvcg0KPiBwYXNzZWQgdGhyb3VnaCkgb3ZlciBldmVudCBjaGFubmVscy4NCj4gDQo+IEl0
IG1pZ2h0IGhhdmUgd29ya2VkIGluIHRoZSBwYXN0ICh3aGVuIHVzaW5nIGEgdmVyc2lvbiBvZiBY
ZW4gPCA0LjE5KQ0KPiBiZWNhdXNlIFhFTkZFQVRfaHZtX3BpcnFzIHdhcyBlbmFibGVkIGJ5IGRl
ZmF1bHQgZm9yIEhWTSBndWVzdHMuDQo+IA0KPiBwaHlzZGV2X21hcF9waXJxKCkgd2lsbCB3b3Jr
IGZpbmUgd2hlbiB1c2VkIGFnYWluc3QgZG9tYWlucyB0aGF0IGRvbid0DQo+IGhhdmUgWEVORkVB
VF9odm1fcGlycXMgZW5hYmxlZCwgYW5kIGl0IG5lZWRzIHRvIGJlIGtlcHQgdGhpcyB3YXkuDQo+
IA0KPiBJIHRoaW5rIHlvdSB3YW50IHRvIGFsbG93IFBIWVNERVZPUF97LHVufW1hcF9waXJxIGZv
ciBIVk0gZG9tYWlucywgYnV0DQo+IGtlZXAgdGhlIGNvZGUgaW4gZG9fcGh5c2Rldl9vcCgpIGFz
LWlzLiAgWW91IHdpbGwgaGF2ZSB0byBjaGVjaw0KPiB3aGV0aGVyIHRoZSBjdXJyZW50IHBhdGhz
IGluIGRvX3BoeXNkZXZfb3AoKSBhcmUgbm90IG1ha2luZw0KPiBhc3N1bXB0aW9ucyBhYm91dCBY
RU5GRUFUX2h2bV9waXJxcyBiZWluZyBlbmFibGVkIHdoZW4gdGhlIGNhbGxpbmcNCj4gZG9tYWlu
IGlzIG9mIEhWTSB0eXBlLiAgSSBkb24ndCB0aGluayB0aGF0J3MgdGhlIGNhc2UsIGJ1dCBiZXR0
ZXINCj4gY2hlY2suDQpJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCB5b3UgYWxzbyB0YWxrZWQg
YWJvdXQgcHJldmVudGluZyBzZWxmLW1hcHBpbmcgd2hlbiB0aGUgZG9tYWluIGlzIEhWTSB0eXBl
IGFuZCBkb2Vzbid0IGhhcyBYRU5GRUFUX2h2bV9waXJxcy4NCkNoYW5nZSB0byB0aGlzPw0KICAg
ICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpIHx8IGhhc19waXJxKGQpIHx8IGQgIT0gY3VycmQg
KQ0KICAgICAgICAgICAgcmV0ID0gcGh5c2Rldl9tYXBfcGlycShkLCBtYXAudHlwZSwgJm1hcC5p
bmRleCwgJm1hcC5waXJxLCAmbXNpKTsNCiAgICAgICAgZWxzZQ0KICAgICAgICAgICAgcmV0ID0g
LUVPUE5PVFNVUFA7DQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KSmlxaWFuIENoZW4uDQo=


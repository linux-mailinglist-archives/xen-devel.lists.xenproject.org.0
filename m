Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB1EA7636C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 11:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932312.1334469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzBft-0003mT-Uj; Mon, 31 Mar 2025 09:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932312.1334469; Mon, 31 Mar 2025 09:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzBft-0003kf-RG; Mon, 31 Mar 2025 09:43:21 +0000
Received: by outflank-mailman (input) for mailman id 932312;
 Mon, 31 Mar 2025 09:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+FP=WS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tzBfs-0003P3-8l
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 09:43:20 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20605.outbound.protection.outlook.com
 [2a01:111:f403:240a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91f12af8-0e14-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 11:43:19 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA0PR12MB8228.namprd12.prod.outlook.com (2603:10b6:208:402::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 09:43:12 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 09:43:12 +0000
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
X-Inumbo-ID: 91f12af8-0e14-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ij3O87n2ApsfXv408FjSvlzg480KHWDFVUQYW3Z416Y6G72FGByF7liY8dGH7ygO3jghqB7MjhU6uUdDmChfS5PHEb6ux8nf0wELKwV9mVo3/kzTMgDPcgzZEoL6Ub+ZzXU6h8FVC+xGjDnqNsk6D3TsojTLYFk8tAq/atrm5KVkucYYcQzt+FKJlVzxqqEy7fMGQE01Tsqb/vYoZf4ITsInn0NHGe+5yc59pdRBf5rqwaKV/Elt7k2Zb88QXBmCQBOW9uH95oEZ6n3DlP+VEOcBbmkiKXy71uFAKVc0xfTRRh/KBjLvxTfNJugozKSQxzF83btipIS/d7cy+v2hHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeZ+Txou6XM64CbE1kf0KZZnD4drDcm6FvhOFTB4RjI=;
 b=CnIkHvzKhYAljYthjjGCeLuV8ujx004pGEHhB+cgZv8kgYG7b8+SMChWFL1gk4aGrSH6ky23Up9ZveSZRL5C7JoohTRLO93VzwcJTADKMMgrsZHuyhk4JvG8Uf49juGC/4+vkk+w3yY8C5vgcFSIbv+H1tpNXa38LeFd7mWj/zDmofPky0J23V5zgrHGOCEY1iBiWDiKR6XOmN7yqjC2xJDhifpAR75yByUtVvEdqKEGX1jledPoGlXxrSZdvqsqUITINdeGqi1a1Hk9rF53QDOaFhb7z84wKmKMjrNHjQSQ2DII5C7SSPJp94LC1AoeHUJyWjMgDJbDXd9TMfPVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeZ+Txou6XM64CbE1kf0KZZnD4drDcm6FvhOFTB4RjI=;
 b=PBZplwhb2xstbo8jvRESvFEJTkjgcfsa1mD7ZVhi0h3wJdDgPpcp5B6yI/Xap2ndbz2hZR7MaN3RfFK8077wszJd7kn/MSoRCx0NVGlHIo1J8iNaKGJKqOsIK+RKXvf69iibW7Sgy/YzfysOHkKF2lCaRrc6ZaIesVnW8ulf5HU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v1 3/3] vpci/msi: Remove registers when init_msi() fails
Thread-Topic: [PATCH v1 3/3] vpci/msi: Remove registers when init_msi() fails
Thread-Index: AQHbnup+4g7LdxtjbkeTZtpJleytN7OG7gUAgAZ9hYD//4t/AIAAkUuA
Date: Mon, 31 Mar 2025 09:43:11 +0000
Message-ID:
 <BL1PR12MB58497148061E1287CF9E24CDE7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <20250327073214.158210-3-Jiqian.Chen@amd.com>
 <Z-VIFo7q7-UNsLCt@macbook.local>
 <BL1PR12MB584905BC9966EF9742FF4472E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z-pYJNyGieUqkVvl@macbook.local>
In-Reply-To: <Z-pYJNyGieUqkVvl@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8534.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA0PR12MB8228:EE_
x-ms-office365-filtering-correlation-id: 2bac095f-33f5-46c5-b3c3-08dd703873cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tjljd1l1a2xsMDhKMXF2WVFpbU5LenNGS1BxZ2hRZWJ3WlpONU9TK3JIaDQz?=
 =?utf-8?B?RkdXeXpxdjVnemVodFBaMnpsWCtJZXFoSE8wZ25zdHR2a0dLQzloOUFFMS90?=
 =?utf-8?B?aGkrTE8xb2p4K00rZVQwelNraDMrY3dZWm1hNlBHYTZjYUt5b0QrNUhMSHVu?=
 =?utf-8?B?M1dseEdld00xcGIwZmF4Wng4NTFNa1kzSzlyNUZaYTgrUjlDaUp5R3RlcGJk?=
 =?utf-8?B?OEtMSXE5eCtGZkIvVXFpMlEyMUxmdlVCdUFNSWpCaVBLc3FOL0Q3eE1YRjRk?=
 =?utf-8?B?amZyVEtBdGhoelRVc2RqMjdFeHZEMEJjUlFaNFhkaGJ0UGhxOFE3YkQvVVcw?=
 =?utf-8?B?VWJYQWVnNjRSRGw5N2Z4ME5uY250RXdRY0QyMVdPdVdtQXcyYmVSSVNsNkl0?=
 =?utf-8?B?N0g5RjhzUjNTemlmb0g0cXZwd3BCVDl2VXhGck5teG9idzVMVVhWTUNhTXZi?=
 =?utf-8?B?M21EazUydU9BeHhxa2ZXaHE2V3A5OGowNElGVFB5WUdKTHZBWGRkcVFwNmc0?=
 =?utf-8?B?NXZJRXJIYVhHcDNVVG5GNU5JM0VhVzFQemFPdWJyT2laQnhPOHZjSXlxRFNa?=
 =?utf-8?B?aXJpcUpEL1lPR1UzdzZFd010ZG5SVkdHS0R0RGg5ZGMrWDdFZEViZ2tXSEcv?=
 =?utf-8?B?YXBQKy9MUW5PWFZWbVNmK081RkduL3hLcWx5Q2U1KzlNUGFwcXNvbUNQZ0JK?=
 =?utf-8?B?N1pOL0ltNnJyRjhUTTVTYTZFQzA0d0dNMUZ2TTFQNTZrbXNITGtVL3ZCZXp5?=
 =?utf-8?B?QUl1d2svMmN2cE44ekgrNVdDM1pLOEo2NFloQWJkV2dBdW1OVmgwaHg3SDFU?=
 =?utf-8?B?ZWhIMi9IOEJ3SUVxVS9pWWk0aGF0U041clRsK1FoNE9FUmF5SFFCV1czbG9v?=
 =?utf-8?B?RytQbEVldHJ4WktuS1ZHU3FNUDR6OW1UaEdjcXVnQ3QrQ283M09kd1AwQ2tm?=
 =?utf-8?B?QWR0bnNSaldZSlFhWFN3QVUxMC9wTGR1VkhTQitDL2JLeVRsZTRoaGpoTGFC?=
 =?utf-8?B?ZXNYbHZPRTVLWWVseUlJcVRBTGdVcU4vTEdkaGNtYmNTRmtOQ3p2V0R5amMr?=
 =?utf-8?B?VFNWQWNBV01URGFWN0ZvVXJuTUxpdysybHRjckREQ0wyMmQ4SFRzenBEYitw?=
 =?utf-8?B?YXplQXdxYkVKUW1IaVJ5U1ZMajU2YThmWW9KQXpDNkQ5UGlCZmttcHAybzhX?=
 =?utf-8?B?M2tBTGV2MWs5SEVnR2VBRnN6anFNK1JUcG5Mc0I5M2RrMGcxOHE2SjlOdlBV?=
 =?utf-8?B?bHpjUHQxckplTW85YWhWVy9xVDFnWUFuQTE4R0VjOVd3dEliT1oxUWhSeEZW?=
 =?utf-8?B?Z01jYmNsN1Q1TGoyQkQ5dHA3ZHR5bFRmcFFUYnFUdFZ4V0pZaHZwYk8xNWVC?=
 =?utf-8?B?UURFSTNGOHJXV3Y2SHhwTXp6VGpRSDRMbDBUc0RZQi9yaGdsSE5RTUtqNEMv?=
 =?utf-8?B?Wk9OTFliZTJwWFk3U2hUYjlNRWZtZ1QzNG91MDlDbmRWQlFWNHB5anRjeWRk?=
 =?utf-8?B?MlZ5YVZOU0N4Y2hiYW5xN3RHUER1Y0cySlFianVnRHNlbG83L2dONERMQ3I4?=
 =?utf-8?B?dGcvdElRT0RCSXNCSC9FbHkyV2NFSlVtTi9BZ0hoSnB6VjhiUWN5Tlo5RlpW?=
 =?utf-8?B?akxzdHNHTUNIbkFaa1BRYmVMOVJxVnpvUW1qWnpobmlSVTAzZ3laTm9mR1FW?=
 =?utf-8?B?b0gzSFlTRy95Vjg2RXlOQWR6bG0zeXVQbDJXYjNrS2tJUFQyemduNnF5NGRw?=
 =?utf-8?B?bm90TzVCdUh5REdnTmNwT2NsK09kbmQ2dnZtb1MyTFpwdHFZa1lMeThraDFj?=
 =?utf-8?B?YW94WUt1V1JKWDNrejc4RXhuUEVZcUJxWjBEbldjTjlmUktKUEZ3dytGM2h1?=
 =?utf-8?B?UHJPMENtK2tNVkQwdmZEOWhTcjZYYWpHMTExL1R4bUJjdGFUdTM4eSthWE1v?=
 =?utf-8?Q?jszrJzNiJmFQkkA9RxilN5Pjslv2xvK9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MElVSmtMOTZmdit6UHFHc3RFcllkU0dHdGZtdWtmV0haVjJGVSsvK0paTnJU?=
 =?utf-8?B?eUpmbzVuNFdwVzlyd0JoUXpUS24rTnN2YVVLanVOR1lVZkhTcGdyQVRPVndW?=
 =?utf-8?B?cDN0Sy9IL3laeGtlVUE5cFR2bFJnbEo0L0ZnTmNGS3FpOHg5QjBFSWNqcm9W?=
 =?utf-8?B?TTVoNHEybml1VGVqZzhDcUJPeEp6VkoxTWFtb25Lc1MvaG1SSThGU1FyeHlD?=
 =?utf-8?B?MllUeWEvemUzM3o3czI5aEVwL25heDQzWDFJam9HUWJVeXllTU1kVGlHa0cz?=
 =?utf-8?B?QTY0ZkV4bGFwVGZIcUV6VWZqMExMRUlpOFNZS1FkOVI5S0NmaDhNbmhZRDFZ?=
 =?utf-8?B?NmZvbTM3S0VRbWkzUUxEejdLS2d0SzhXTDNkQWt5aFR4NGVhcndGbWVWMUxI?=
 =?utf-8?B?VUo0R3dHbGNBSnl3R2RrenRkZmZxcTZUNUZ0ck9UKzFJWXdoeW9waXoweTM3?=
 =?utf-8?B?ckNCaVpTdjJDTm1BNGVQZWJTYTNEbitRVENMdmdodklSTmxRNG1PQmpsSWwv?=
 =?utf-8?B?VGx1MnJ4L3Rld2dGMkg2dFp0d2hDVlRVNlFKSzVVbHFnU0Z5STBNWk9pVVFp?=
 =?utf-8?B?NDFTWU51QjJmRWlHcFVOeXRSWURxeHZGTWlpMXVKWlBlR1NKdzFxNXYxR3Zo?=
 =?utf-8?B?bk10NFdKQ2UzalE5WjlwSEJveEh4Mm1JZUc3ZjRadVRsQmhjd1dEK3NDSFd2?=
 =?utf-8?B?dDhWSks0MUR2SVE0ZFBSdWtQNUFSc2ttZ1d6MUdYdFRQblRJUTFBWHhjalVF?=
 =?utf-8?B?bEVrZzMzc3JKbEdmVWljaW1aeU4weDl6dHFkbmNLZnZQa1VMODA5NHJlTktw?=
 =?utf-8?B?bTJ6d0FNcmNRRDI5dWVrd2ovU2RtSnJwOXhRekNFVTdteG0zUFNpN1lqM0t0?=
 =?utf-8?B?K0RVNkR0VXZQVm52V2I5RDlBTWlRcTdHRytScm9pYm9MRHRMeG1EZ05PS3pj?=
 =?utf-8?B?VXM2S1dRNGp3S05PcVZGTXpSVG1yeXJKQSs5amVYTXJkRmJJQnAra3hvaDBm?=
 =?utf-8?B?WVE1YmVPdW9RaTV4N1A3c3NBNjdXZjNKbzJYL3NMc0RYNWx4YXRHMmMvV3k0?=
 =?utf-8?B?NUI2dmtCV0VnTzdjK3gwK1NXckZZTnlwczRvbkVGb0duWHpFMjVDa2RwVVM0?=
 =?utf-8?B?Z0MzS0sweThzVEJld2RQZ3Y0ZmZuN25RTW80MnZUS1JzY20wd0YzTndETG9n?=
 =?utf-8?B?RGJXaGppMDBRNGhHNzBHOGp6ZzJvQlJtWDlWaXozc0NjUG4vbmQwWU1uWnZn?=
 =?utf-8?B?aURZYUVkMXhOeC9kNXA1b0YwaHZIQ2p0RjhJMmlpazZZdUNSZE1NdFdZK2Rp?=
 =?utf-8?B?TGNZY3BSSGxVanQxU1JLemV4M1B6amVWNlB2NWRLSWwwTmtvaFRxQXQ3aElV?=
 =?utf-8?B?ejcvTlNLZ1J0M01SeGMxTXVPV25lRUlMYnl1VktsZmFzTFp3SUZiNWJWVGxz?=
 =?utf-8?B?MUwvWmw2NDZMb1lVaDRGWDVyM2VRM3Q0eGpXRTgyL0l0OUpwekE3T0ZmWmw0?=
 =?utf-8?B?SUx0RHJjMUlNM3pzZmdsVUJFSHQwU25MK2hOcERFRHQxblBZaHB6RVowT0N4?=
 =?utf-8?B?L2UxOEJZQVFCUzBhOTlUZUdhUDJTZnlad3B1MkV6TnNRbzdua2p5eSs0ZnZk?=
 =?utf-8?B?SDlsYTdhV2dWbGtUNytlUU9IYkNUQUhvWUNTZm5HcmVIL0hjaHg0MGdlaG93?=
 =?utf-8?B?L1RiQUxkWTR4RDhaRmRrU1I1UGxYdHBzS1RWeWU4NkFEZ1VDcERQNW1QQXh0?=
 =?utf-8?B?d2c3ZDc0QWJFWGRKM1QySFV0QXJqME9NcHlOUHFNMDA2aDkyZDhmUmZpK1FF?=
 =?utf-8?B?anNldU5aLzNBeTFaZUNnbGZvZk5jb2VDNHVnSndOa2RhQ2VhMWJPZEVkZGtv?=
 =?utf-8?B?RitVNjl1NW02enNEOGQvbnNtREhTK25KNlE4eE81bGZhU1prUlk0YVUvMWlX?=
 =?utf-8?B?bGdSdFh2NHBaZkFNMXBNM0U3TktuaHJVV1RMblN3cWd1SU9yVFQyOE9sYll2?=
 =?utf-8?B?dFA5VkQwdHZZWTRhZXVHbmQvMS95NG5QWEFIUnMvMENaQitRRjBIeGtmekYv?=
 =?utf-8?B?NmVrWG5LZzQ2SFY3VEk4ZWdIOWJ3WStJeEFjOEJKUzRVb3dXZ1dqOHRNNDVL?=
 =?utf-8?Q?jplY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56BFB20AFD84524693111D6C257934E0@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bac095f-33f5-46c5-b3c3-08dd703873cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 09:43:11.9267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2k9tWBobBB1xlWEBGkWE6j1e8fOCV17F91GOxiDhiu9SNslIXcdEbQIsxWOPIzK1HVFXp/uMzQzhHt3nMHZWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8228

T24gMjAyNS8zLzMxIDE2OjUzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIE1h
ciAzMSwgMjAyNSBhdCAwODoxMzo1MEFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBP
biAyMDI1LzMvMjcgMjA6NDQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gVGh1LCBN
YXIgMjcsIDIwMjUgYXQgMDM6MzI6MTRQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+
IFdoZW4gaW5pdF9tc2koKSBmYWlscywgdGhlIG5ldyBjb2RlcyB3aWxsIHRyeSB0byBoaWRlIE1T
SQ0KPj4+PiBjYXBhYmlsaXR5LCBzbyBpdCBjYW4ndCByZWx5IG9uIHZwY2lfZGVhc3NpZ25fZGV2
aWNlKCkgdG8NCj4+Pj4gcmVtb3ZlIGFsbCBNU0kgcmVsYXRlZCByZWdpc3RlcnMgYW55bW9yZSwg
dGhvc2UgcmVnaXN0ZXJzDQo+Pj4+IG11c3QgYmUgY2xlYW5lZCB1cCBpbiBmYWlsdXJlIHBhdGgg
b2YgaW5pdF9tc2kuDQo+Pj4+DQo+Pj4+IFRvIGRvIHRoYXQsIHVzZSBhIHZwY2lfcmVnaXN0ZXIg
YXJyYXkgdG8gcmVjb3JkIGFsbCBNU0kNCj4+Pj4gcmVnaXN0ZXJzIGFuZCBjYWxsIHZwY2lfcmVt
b3ZlX3JlZ2lzdGVyKCkgdG8gcmVtb3ZlIHJlZ2lzdGVycy4NCj4+Pg0KPj4+IEFzIEknbSBqdXN0
IHNlZWluZyAzIHBhdGNoZXMgb24gdGhlIHNlcmllcywgaXNuJ3QgdGhlcmUgb25lIG1pc3NpbmcN
Cj4+PiBmb3IgTVNJLVggYXQgbGVhc3Q/DQo+PiBObywgYmVjYXVzZSBpbml0X21zaXggb25seSBj
YWxsIHZwY2lfYWRkX3JlZ2lzdGVyIG9uY2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gcmVtb3ZlIHJl
Z2lzdGVycyB3aGVuIGl0IGZhaWxzLg0KPiANCj4gU2VlbXMgYSBiaXQgZnJhZ2lsZSwgd2hhdCBh
Ym91dCBpZiB0aGVyZSdzIGZ1cnRoZXIgY29kZSBhZGRlZCB0bw0KPiBpbml0X21zaXgoKSB0aGF0
IGNvdWxkIHJldHVybiBhbiBlcnJvciBhZnRlciB0aGUgdnBjaV9hZGRfcmVnaXN0ZXIoKQ0KPiBj
YWxsPyAgSXQgd291bGQgYmUgc2FmZXIgdG8gaGF2ZSBhIGNsZWFudXAgZnVuY3Rpb24gdGhhdCBy
ZW1vdmVzIHRoZQ0KPiBjb25maWcgc3BhY2UgaGFuZGxlcnMsIHBsdXMgdGhlIE1NSU8gb25lIChz
ZWUgdGhlIGNhbGwgdG8NCj4gcmVnaXN0ZXJfbW1pb19oYW5kbGVyKCkpLCBhbmQgdGhlIGFkZGl0
aW9uIHRvIHRoZQ0KPiBkLT5hcmNoLmh2bS5tc2l4X3RhYmxlcyBsaXN0Lg0KSSBhbSBvbmx5IHRh
bGtpbmcgYWJvdXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaW5pdF9tc2l4KCksIHdo
aWNoIGRvZXMgbm90IG5lZWQgYSBjbGVhbnVwIGZ1bmN0aW9uLg0KQnV0IGlmIHlvdSB3YW50IHN1
Y2ggYSBmdW5jdGlvbiwgZXZlbiBpZiBpdCBpcyBub3QgbmVlZGVkIG5vdywgSSB3aWxsIGFkZCBp
dCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEpp
cWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+PiAgDQo+Pj4+ICAgICAgaWYgKCBw
ZGV2LT52cGNpLT5tc2ktPm1hc2tpbmcgKQ0KPj4+PiAgICAgIHsNCj4+Pj4gKyAgICAgICAgb2Zm
c2V0ID0gbXNpX21hc2tfYml0c19yZWcocG9zLCBwZGV2LT52cGNpLT5tc2ktPmFkZHJlc3M2NCk7
DQo+Pj4+ICAgICAgICAgIHJldCA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIG1hc2tf
cmVhZCwgbWFza193cml0ZSwNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bXNpX21hc2tfYml0c19yZWcocG9zLA0KPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwZGV2LT52cGNpLT5tc2ktPmFkZHJlc3M2NCksDQo+Pj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQsIHBkZXYtPnZwY2ktPm1zaSk7DQo+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldCwgNCwgcGRldi0+dnBj
aS0+bXNpKTsNCj4+Pj4gICAgICAgICAgaWYgKCByZXQgKQ0KPj4+PiAtICAgICAgICAgICAgcmV0
dXJuIHJldDsNCj4+Pj4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+Pj4gKyAgICAgICAgcmVn
aXN0ZXJzW3JlZ19pbmRleF0ub2Zmc2V0ID0gb2Zmc2V0Ow0KPj4+PiArICAgICAgICByZWdpc3Rl
cnNbcmVnX2luZGV4KytdLnNpemUgPSA0Ow0KPj4+DQo+Pj4gQXMgY29tbWVudGVkIG9uIHRoZSBw
cmV2aW91cyBwYXRjaCwgSSBkb24ndCBsaWtlIG11Y2ggdGhlIHVzYWdlIG9mDQo+Pj4gdGhpcyBy
ZWdpc3RlcnMgYXJyYXkgdG8gc3RvcmUgd2hpY2ggaGFuZGxlcnMgaGF2ZSBiZWVuIGFkZGVkLiAg
SXQNCj4+PiB3b3VsZCBiZSBiZXN0IGlmIHlvdSBqdXN0IHJlbW92ZWQgZXZlcnkgcG9zc2libGUg
aGFuZGxlciB0aGF0IGNvdWxkIGJlDQo+Pj4gYWRkZWQsIHdpdGhvdXQga2VlcGluZyB0cmFjayBv
ZiB0aGVtLg0KPj4gTWFrZSBzZW5zZSwgaXQgd2lsbCBpbmRlZWQgYmUgc2ltcGxlciBpZiBpdCBp
cyBmaW5lIHRvIHJlbW92ZSBhbGwgcG9zc2libGUgcmVnaXN0ZXJzLg0KPj4NCj4+Pg0KPj4+IFRo
aW5raW5nIGFib3V0IGl0LCBkbyB3ZSBtYXliZSBuZWVkIGEgaGVscGVyIHZjcGkgZnVuY3Rpb24g
dGhhdCB3aXBlcw0KPj4+IGFsbCBoYW5kbGVycyBmcm9tIGEgc3BlY2lmaWMgcmFuZ2U/ICBJIHRo
aW5rIGl0IGNvdWxkIGJlIGhlbHBmdWwgaGVyZSwNCj4+PiBhcyB0aGUgc2l6ZSBvZiB0aGUgY2Fw
YWJpbGl0aWVzIGlzIHdlbGwta25vd24sIHNvIG9uIGVycm9yIGl0IHdvdWxkIGJlDQo+Pj4gZWFz
aWVyIHRvIGp1c3QgY2FsbCBzdWNoIGEgZ2VuZXJpYyBoYW5kbGVyIHRvIHdpcGUgYWxsIGhvb2tz
IGFkZGVkIHRvDQo+Pj4gdGhlIHJlZ2lvbiBjb3ZlcmVkIGJ5IHRoZSBmYWlsaW5nIGNhcGFiaWxp
dHkuDQo+PiBCdXQgSSBhbSBub3Qgc3VyZSBpZiB0aGF0IGhlbHBlciBmdW5jdGlvbiBpcyBzdWl0
YWJsZSBmb3IgYWxsIGNhcGFiaWxpdGllcy4NCj4+IExpa2UgUmViYXIsIGl0cyBzdHJ1Y3R1cmUg
Y2FuIHJhbmdlIGZyb20gMTIgYnl0ZXMgbG9uZyhmb3IgYSBzaW5nbGUgQkFSKSB0byA1MiBieXRl
cyBsb25nKGZvciBhbGwgc2l4IEJBUnMpLg0KPj4gSWYgYSBkZXZpY2Ugc3VwcG9ydHMgUmViYXIg
YW5kIG9ubHkgaGFzIGEgc2luZ2xlIHJlc2l6YWJsZSBCQVIsIGRvZXMgaGFyZHdhcmUgc3RpbGwg
cmVzZXJ2ZWQgdGhlIHJhbmdlIGZyb20gMTMgYnl0ZXMgdG8gNTIgYnl0ZXMgZm9yIHRoYXQgZGV2
aWNlPw0KPiANCj4gTm8sIHdlIHdvdWxkIG5lZWQgdG8gZmV0Y2ggdGhlIHNpemUgb2YgdGhlIGNh
cGFiaWxpdHkgaW4gdGhlIGNsZWFudXANCj4gZnVuY3Rpb24sIG9yIGZpZ3VyZSBpdCBvdGhlcndp
c2UuICBOb3RlIHRoZSBzYW1lIGFwcGxpZXMgdG8gTVNJDQo+IGNhcGFiaWxpdHksIHdoaWNoIGhh
cyBhIHZhcmlhYmxlIHNpemUgZGVwZW5kaW5nIG9uIHdoZXRoZXIgNjRiaXQNCj4gYWRkcmVzc2Vz
IGFuZCBtYXNraW5nIGlzIHN1cHBvcnRlZC4NCkdvdCBpdCwgSSBvcmlnaW5hbGx5IHRob3VnaHQg
eW91IHdhbnRlZCBhIGdlbmVyYWwgaGVscGVyIGZ1bmN0aW9uLg0KQnV0IGl0IHNlZW1zIHRoZSBj
YXNlIGlzIGVhY2ggY2FwYWJpbGl0eSB3b3VsZCBoYXZlIGl0cyBvd24gc2VwYXJhdGUgY2xlYW51
cCBmdW5jdGlvbiBpbnN0ZWFkLg0KDQo+IA0KPj4gSSBtZWFuIGlmIEkgcmVtb3ZlIHRoZSByZWdp
c3RlcnMod2l0aCByYW5nZSAxMyB0byA1MiksIGlzIGl0IHBvc3NpYmxlIHRoYXQgSSBkZWxldGVk
IHJlZ2lzdGVycyBiZWxvbmdpbmcgdG8gb3RoZXIgYWJpbGl0aWVzPw0KPiANCj4gSXQgaXMsIGlu
ZGVlZC4gIFlvdSBuZWVkIHRvIGtub3cgb3IgY2FsY3VsYXRlIHRoZSBzaXplIG9mIHRoZQ0KPiBj
YXBhYmlsaXR5IHRvIGJlIHJlbW92ZWQsIGJ1dCB0aGF0J3MgbGlrZWx5IGVhc2llciBhbmQgbW9y
ZSByb2J1c3QNCj4gdGhhdCBrZWVwaW5nIGFuIGFycmF5IHdpdGggdGhlIGxpc3Qgb2YgYWRkZWQg
cmVnaXN0ZXJzPw0KUmlnaHQuDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


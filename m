Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4F92AE4C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 04:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755687.1164117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR0ti-0001Oq-2o; Tue, 09 Jul 2024 02:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755687.1164117; Tue, 09 Jul 2024 02:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR0th-0001N6-Vv; Tue, 09 Jul 2024 02:48:05 +0000
Received: by outflank-mailman (input) for mailman id 755687;
 Tue, 09 Jul 2024 02:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h7MY=OJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sR0tg-0001N0-73
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 02:48:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7942da4-3d9d-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 04:48:01 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 02:47:56 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 02:47:56 +0000
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
X-Inumbo-ID: a7942da4-3d9d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwdTJK3GcHxWsgEVYZRblpR+62JVabSaMYcNHC7dyuqAmVGxoSNqkWjJJV4EypgAQ+o7WZMGxK/akqrnkkZag1S4OENncX8ZR1p/aQoIt8w0qffhxkyGQ/sjE7KXhD+4AKXv+lPtxekRiOg1iC4hc6ZUXDRhWn4hCcj1E+KZrD5kkCfUfVF1NPBwwR5okg0bMd/fMzbyrA4FxVHBx86PjTB4T0yGGqiD8xnYezEtqaqX+Xc5wTH7G+pr/nUCCsCwcOchfiGDHmYrn1HczD7QucvtN95ZW6C51hrWlRPM8hOM8lanW69BhHR2DqwE8GDCYwTUE/Sph+ZLZjoMqLfSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDeXQlZdtdTtDFp20XkyKFDkUUWQhZWhBvYvHgoUDgQ=;
 b=ERdQiORR1rjqqnACp8Df9Bo7nPoeN5Avp+GiQ+sK7KA5EHS+RLvR6bPoacO3vN+HdtVD9XRUs6tpJbhdNFyzmMDRtJzi9CgVDJKZPBSU6oaWYZhBtg4ddYvZ1c1414CGNJZPeUESLfk0HB+5bFYp3al86wSiSy9yZzU+7m5VuKeojGhL7fOq+o/7A09XV9vVGJhe+plrJ74Gm2roaoqAv3eg4NyyYMdKbjs13FxN7AgcfOfaDhlBigna/Q00RrhgrnGsVlORBz3yigCM9yk+VQPwv73H43U65nsp8GI//KlFh0WqtqBb+ek797hna4BmjlB7smweNPEFBOhO4uJ16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDeXQlZdtdTtDFp20XkyKFDkUUWQhZWhBvYvHgoUDgQ=;
 b=Psk11Bo2b7Gc0Jh1G+iUYSbz9zyk6sRCruYQv7bzQRxI+WtCxUriLJVMdTW26+gvSkq2Z2Vxy30PHiXdwdSDVoe9V55eqX4nUx11DpRYXiuxeaY9VE3+UtHR28u+qHsobFvrgFdK8aMiWOk8CByoxs9mLAGEGnsx1Q4A18jsRSk=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Topic: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Index: AQHa0SvTLcqHcyv10kCa3wxjMJYih7Hs67IAgAFMAYA=
Date: Tue, 9 Jul 2024 02:47:56 +0000
Message-ID:
 <BL1PR12MB5849A3D071213C5CA8BE5F1AE7DB2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com>
 <3b2c9019-b907-44d0-b767-315f7d42a2a1@suse.com>
In-Reply-To: <3b2c9019-b907-44d0-b767-315f7d42a2a1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7741.016)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY5PR12MB6526:EE_
x-ms-office365-filtering-correlation-id: 5accd469-bea2-4775-834a-08dc9fc18995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VWpmQzRTYlFXZGltMUhaY3dxdFdaeUgwUW1FUU13Zy84bVpRQzFlYjlndVA5?=
 =?utf-8?B?Rzh1NVU2ZUxiZWFZOWZ1cndhRW44YkovMkFSYkEyUmJZWDJpREFkY0VFU0oz?=
 =?utf-8?B?MVgxcm45VnNyUkRHR3RCSnhIS25yU3pySTVkaGdGc1RBT3ZWYlJFN3VSZGtN?=
 =?utf-8?B?U0NiTElQcEtxLzZkT0F6dzdGOXZuNG9PSFFXV2swNTdsQkkyY3JQYWZ5UnRO?=
 =?utf-8?B?aTh6TE42ZG1nVjJPVFZuRmFyK3ZKY015Z2xlMDd5bEFIY1o3U3MvUjc0Ti9I?=
 =?utf-8?B?MmVrRVJ0QklNZzhML3EzL2RmTFd5U3kydlQrSmdBaWFYNUlCdzVSU3VJYit0?=
 =?utf-8?B?MEFmaG93NGI0OUQzYUVob3djbW03VGRVMHBDSEl1MUtycFZ0elJ6Q2NtWVVa?=
 =?utf-8?B?M3dkaldlb05wK21XY1NGNGNBRDczaWlEeWNiTVMxeksyd3RmamdsVlhveHM2?=
 =?utf-8?B?aW5IWFBvNXZYdnNFdzF2Yk9NR3Q4RmU1ZEdRMERJZm94TlBPanJNbWhHbHBC?=
 =?utf-8?B?Tnp6OENiOXVZUzUzaU5xMEFJVExvVm9zblZTSHVWUDUzZExQV1lXQjVUL0ty?=
 =?utf-8?B?R1E0SVFzQ3Z5eFVmbXBvQWY5NUdPbDhJeDZIdm5CZHdHZ2kvZzhtZkVjZVJD?=
 =?utf-8?B?Z0VobmZuL2dnQU9Ba2NSWjdlVUxUQzl3b0JpWE91QVQzQ1JRYklQbEFCd3hH?=
 =?utf-8?B?MXY5OCttSzVjUTU1eFdURHlnYXh6VE5Mei9DdG8xUUJQSFhUZUpESjZFQm5Y?=
 =?utf-8?B?Nk0xbWFOYjFHT2JjclhMNWdta2FEaGJSZk5yMHZlUGZGWjMwQ0prZHhFYVhY?=
 =?utf-8?B?YUZkTG9TWkhSbkJNcnpwNGdZR3RnMlpJSzJoZGlYT1FubCtFbzhYMW01R3px?=
 =?utf-8?B?TEFWNHoyMFFPcmg3V2wwWnRxUlcrZktQSnZ0V1lOdHBjTVh0TUY5cGRteTIv?=
 =?utf-8?B?dkRVblk0R1hUVDdmTVE4S1BBTWJkeGo1VCs1Mm03R0orZldMbW1nTnQwTEFu?=
 =?utf-8?B?ZEdyQm9MMjQwakVMVmtJdlpsa2F6TDBkZjh3dVBjSFM4akhyRlhyeWh4eHNv?=
 =?utf-8?B?SGtxNCtrWkhhQTFkNytxU0FZZmlIeUw0Mnk4RzJVNW04cXU4ODVCUEFtMXgv?=
 =?utf-8?B?UmhGYStBc2lCbE01TnRDMHBvdUF4c25oanZtekdvWWYvMmIzUVp3cVBjdlhL?=
 =?utf-8?B?SThTVHpOSmVOdVVhVi9aRmczZXZ3bHZKOWk2T2dGdzJTMDdvN0dBQ0g0YWpw?=
 =?utf-8?B?UkNYWFc4U3NjSkwvTkJRTWJOY2hRSmZseTdCamNBYllFMFJkNk9tRmIxMmdj?=
 =?utf-8?B?SHdiWk9uTjNZVXRkZmRVMjlpaitGMkdPcTdwb0lDQ213OFhxVmE0NEdRSkRB?=
 =?utf-8?B?WVFucFliSEVwZ2orWGtwb2FlN2ZBUU9qZTFud1JIVlZlaGxRcVQrcVBrRHF6?=
 =?utf-8?B?aE5xWWd1ZFdtb1Y5RDlKa3pOaE1uSHI4amlLVGZzNklxZ210dEN6cnk5Ym9Z?=
 =?utf-8?B?dmVpNmdhKzFseFZEdExzUXZXYXhwZFZnaG90U0wyK1h4WGZpb2dYQ0RHcEMx?=
 =?utf-8?B?UTVmOEkzUytsY2tLRE0rQkR2cnN4VzZrSm16L0ZCTk42RHRXS3d3MjBMVWZW?=
 =?utf-8?B?WS9UYlhLYS9yeHBWZ1FYYWhGQkZlR2pWNk5JRWZ1Vk1iR2JKNFc3R1FkQ2hw?=
 =?utf-8?B?VVpzYWFrRTZzZXhCSVhLSCtuYmhPZC83WUI5UnRvL3htYUZDSjU1ajdaS2tq?=
 =?utf-8?B?NnY0V3JsaGFQU29Ba1daUkdTYVlQZmdDdVI0UmNnSzRjOWZyeWFhK0grZGhp?=
 =?utf-8?B?dXRwUTRFeVBsdm1pZ0diZk9sRW04UTk4ZFVRUit2VXFRNHhLQW02T2lKUWE0?=
 =?utf-8?B?OFRoV2lnOEh6RDR3YVlnd1dITmEwZnJJOWgvY3h4N2ZRMVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEZyVG5KSXo5di8vMlR5aXhFaVdiZ1U1LytqWFJ1TzN1SVB4cFo2Z3FyWEY1?=
 =?utf-8?B?TmF3c2NJNFlzcGdUZ3greWsrOCtqdmpRaXZkaXdqa3VkY3lZRyt5b0Z6TjVw?=
 =?utf-8?B?VzBueWNycU5TaE1TOTRaQ2x2VlEzbS9vOFFBSTJ4elRPOUR3T1UyTjRySzF4?=
 =?utf-8?B?TzRDZWFQL3dLN0UvdHU5MTQyK3A0OE1mdmp5SysvOTRYcktvMlYxQ2lIRDNZ?=
 =?utf-8?B?LzVoeWNLVDI2Mm1FVDJnTlJsME1oeE1MUU5nQndIWk9PZ0p6KzdUd3lsQ3kr?=
 =?utf-8?B?ejJzbWZydEw3Y2c2UDFCVXdOMkkxMXRHRnBPQzJjWmFBOHE2emErYU5VUjYz?=
 =?utf-8?B?Mm5QWERzTWdqZVV6Wll1YXZHRzIxUUlSdkNDR0lCR3ZCOWx0cFhuNzg4bEdP?=
 =?utf-8?B?VERlbHAvaXliMWpTNTVNUXNrY2V4V2JYTUk3R1c1aGRaRkxib1FxNlBhc0M1?=
 =?utf-8?B?Zzc1ajdGVGFNQTFkTTRsQzhqaEgvdWtueDB5UnFjQnltNjZYMWVoRzRFdFBT?=
 =?utf-8?B?bUJ0dnJhVjNxZHNiNUgxWVV4L2xSZUdFNUs1bFBzalNBWUc4SURnOHBZM0Vs?=
 =?utf-8?B?cG1nOWVVbTdUMDhvbkZqR0g1V000MEZDYWlXaFZ5L0s4MEhIZHFxdks4cVho?=
 =?utf-8?B?MkI5WmpIRVhjRVNlcWZxUDVlVjJvZ3I1UGtDc05acTlkZGdJb0xaMytuSFhV?=
 =?utf-8?B?WUhCSitqM0duQU5YZkN5M0t4UU9GeXFOQURqZTNOd0l5U0hZRGRSMVBUeE41?=
 =?utf-8?B?bmR6QVJPMjdrZXFUTGJjNEhwSFljWHZVNzVRelJ1Z1A4YmFMSUNQY3FSU0NE?=
 =?utf-8?B?WTdiVy93Nk1acEx5RTNza0tJNXpJWktjS0NRTHZyYlR2NHR4K0twWWZESkZM?=
 =?utf-8?B?RWVNQTViSDRhWVZGRWRuVkFZWUFIaFpFK1BFZTlFa2JOaHNhN0Z5bW41Yldj?=
 =?utf-8?B?YUF3TDYyOUpGQjJDRzZaTVRCMFZPdVB0S21zSVNnNi94L3pCYU1pckRkU3o1?=
 =?utf-8?B?Z01vVjRvOU9HS3VaejNZYy9MSUZaREZtTCtlblRrU1h2cks3UU9sSWFrMW92?=
 =?utf-8?B?MmJKMHJMODNKa1hVQUNQNG5lZSthS2xIcnlyZXk0UmZ5YncvZDRkc0xvVzZG?=
 =?utf-8?B?TnRqZisrSjgxTkU2RDUrcTFrTi9YdlgzOXRtVGhKTzlUME4xd1lVRUlMalM3?=
 =?utf-8?B?Q1NsODh6enFtclJMb3NSQ0lnTkpJdU45Sm0rd2w5UXFPemI5NXZZMW9HZnVW?=
 =?utf-8?B?VUZMNVhHeENoWHI1UG1Bc2pSU1gwcVlsWVdFSDBPQlc5VGZPNUZJOEsrOXl3?=
 =?utf-8?B?NEUvTHU5WktybVdONWI2OTk2TTJ3Y2dCeDhoM01DMmRXQXQ2aGdzWmN1bDZq?=
 =?utf-8?B?WWRJRStRTDNuTnRlZFhWbzhmcTI3T0pUdDR6OTMvNGtMbmlrSGwwY2pnb1cr?=
 =?utf-8?B?RXd2TXNudjNYaVVqQVhuMkxHaWQwM0pOZFJmRGhZN0FGM3ZRc29jeWQ2dmRG?=
 =?utf-8?B?VGMwazlwb0ZRUFVhaWVxUVd0TjFJVGxLbU5Hc3J0Znc3Mm1NdE9aMzYrWEo2?=
 =?utf-8?B?ekV1OUx1WWdMYVBZMkZxS1hwQk9SMFhONlU1SWRtaFZGRDhpSEpESSt0ekdN?=
 =?utf-8?B?MlJGZWFjZjZkZG41NVBTbGpadHFXOVcrQkxHQWVrSUh3ZExoU0tGYUVGZXc1?=
 =?utf-8?B?V2VxeldXK2VNS3c5ZXRaSzB2SkYzTzdzQ3kwL2JOTldtVnBFeFBQaEd0NEN0?=
 =?utf-8?B?VmF2TTRYMEsrMGJBMlVETGxuTTd2c1FkVlBiQnJaUDhtNStSVEJoTmp4WElz?=
 =?utf-8?B?d1lPbmdneWlGS283WjNPQ2ZTK2FSSGdjTGg5dElTZ2lFMWZmTkNpOU8rR0dX?=
 =?utf-8?B?NlBQY0NuY0dIdWNyTjFuR0RvOTBvUjZPMlNwdG9hMmRINTFVdUlBQ2xEd3dS?=
 =?utf-8?B?eGE5aWtwRHFpdlU2SXNjMzF0cDNRSUEzYm5OZU5mcnZQeXdRTWxxN3V4em92?=
 =?utf-8?B?Zkt4T2xta3JLUHdYNkE5dlY1SmRBQmhMQmNXT3FiMW5aTUN6SHg0Z1BBek5x?=
 =?utf-8?B?UDd5WkdmLzhZdFVWSnZmMGkvNVZLdEJnVGkxcENHY3pTL1RSVU1HVzNhYjRO?=
 =?utf-8?Q?+KX4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <369C4C92EA04434F9489F778BE733F26@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5accd469-bea2-4775-834a-08dc9fc18995
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 02:47:56.5514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +3omHLEUZJhxdrSd1K4LMuX/dGluoTplo8PAQn9+yf3vaHlARk0t0jUsMDB50FxWzQPuHgqABPW4KItLU/jAeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526

T24gMjAyNC83LzggMjI6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wNy4yMDI0IDEz
OjQxLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdoZW4gYSBkZXZpY2UgaGFzIGJlZW4gcmVzZXQg
b24gZG9tMCBzaWRlLCB0aGUgWGVuIGh5cGVydmlzb3INCj4+IGRvZXNuJ3QgZ2V0IG5vdGlmaWNh
dGlvbiwgc28gdGhlIGNhY2hlZCBzdGF0ZSBpbiB2cGNpIGlzIGFsbA0KPj4gb3V0IG9mIGRhdGUg
Y29tcGFyZSB3aXRoIHRoZSByZWFsIGRldmljZSBzdGF0ZS4NCj4+DQo+PiBUbyBzb2x2ZSB0aGF0
IHByb2JsZW0sIGFkZCBhIG5ldyBoeXBlcmNhbGwgdG8gc3VwcG9ydCB0aGUgcmVzZXQNCj4+IG9m
IHBjaWRldiBhbmQgY2xlYXIgdGhlIHZwY2kgc3RhdGUgb2YgZGV2aWNlLiBTbyB0aGF0IG9uY2Ug
dGhlDQo+PiBzdGF0ZSBvZiBkZXZpY2UgaXMgcmVzZXQgb24gZG9tMCBzaWRlLCBkb20wIGNhbiBj
YWxsIHRoaXMNCj4+IGh5cGVyY2FsbCB0byBub3RpZnkgaHlwZXJ2aXNvci4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
aXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBTdGV3YXJ0
IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KPj4gUmV2aWV3ZWQtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gDQo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpUaGFuayB5b3UgdmVyeSBt
dWNoIQ0KDQo+IA0KPiBKdXN0IHRvIGRvdWJsZSBjaGVjazogWW91J3JlIHN1cmUgdGhlIG90aGVy
IHR3byBSLWIgYXJlIHN0aWxsIGFwcGxpY2FibGUsDQo+IGRlc3BpdGUgdGhlIHZhcmlvdXMgY2hh
bmdlcyB0aGF0IGhhdmUgYmVlbiBtYWRlPw0KV2lsbCByZW1vdmUgaW4gbmV4dCB2ZXJzaW9uLg0K
DQo+IA0KPiBBcyBhIHB1cmVseSBjb3NtZXRpYyByZW1hcms6IEkgdGhpbmsgSSB3b3VsZCBoYXZl
IHByZWZlcnJlZCBpZiB0aGUgbmV3DQo+IGlkZW50aWZpZXJzIGRpZG4ndCBoYXZlICJzdGF0ZSIg
YXMgYSBwYXJ0OyBJIHNpbXBseSBkb24ndCB0aGluayB0aGlzIGFkZHMNCj4gbXVjaCB2YWx1ZSwg
d2hpbGUgYXQgdGhlIHNhbWUgdGltZSBtYWtpbmcgdGhlc2UgcHJldHR5IGxvbmcuDQpEbyB5b3Ug
bWVhbjogcmVtb3ZlICJzdGF0ZSIgaWRlbnRpZmllciBvbiBhbGwgdGhlIG5ldyBjb2Rlcz8NCg0K
PiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


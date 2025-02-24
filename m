Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEFFA419D8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895061.1303662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmVE0-0005DC-TL; Mon, 24 Feb 2025 09:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895061.1303662; Mon, 24 Feb 2025 09:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmVE0-0005Ar-Q8; Mon, 24 Feb 2025 09:58:08 +0000
Received: by outflank-mailman (input) for mailman id 895061;
 Mon, 24 Feb 2025 09:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bXv=VP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tmVDz-0005Ak-W3
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:58:08 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d74b3500-f295-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:58:06 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 09:57:58 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:57:58 +0000
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
X-Inumbo-ID: d74b3500-f295-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jw5P9GkJHZ0/h1F/aFj6zkELyUApfidDn+YP0ktg5BsRl9QlaLkMxbHzvdSDSKhD4ZwB40SJeIVoieO2ccIKGXGKnfdCkTifChY+hT8c2FtwnCH/0TZU1Zy7hS18JO2/cnK9tVAtodr2glH8BI/eCgpxWy4tCO7kHs3J+4u+bAWTetPwakGQ/xGky2ScXsZPFbxxtqfc/++ClYkMKvXKsHu3LyXOwaPx8VIiaHirekl0+2zJLJb8nGAkrnWr+SHggkRaiVD+zre1XUxWUwUS0HE882WIr2QWmb/8Ff8fi+blxGC8bERpcCWgrpq2aOJuCSEl/lxb/JmBDqAHXENnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwAXadfIdE8XTjN3Bcp3nX/OZSfAPWa0U5tDv/bbkHo=;
 b=vlMivHq9X49Gsqk7coJNOyqVUXe0axlOe3cz3ZMkg4wpWgYjIH+A6S6pWX1qbxOeLz2O8qgmM/yLGEkBXc0E/jViRJrMWIiZpc9OIZ1+MblEYWMpjblO+r314WTcHo7SXh9NOJNR5G35zhTm99tPKwGw0+FD9XsRcGjLfMigosq1YMjK9/satbhFaXMxItsKXZkJpadY/Y25XgUPXBXlJ/Tt0xDY1JZxwcAef89MhrXPlrRIaCz98Z8EP2LT/nuKvUYvafinU+D1kBBVNbhT6IlgdJL5bTMExwgaEdf/XCBixnT4lKXpQfSmiUSldMPKGLss7+Uv0xE4wJzFPZ1Ysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwAXadfIdE8XTjN3Bcp3nX/OZSfAPWa0U5tDv/bbkHo=;
 b=OjpVGeye87hMBYbETCiREGXWyYClXObOwKYSWQ3xSb61CnwhUHnYqwBOYjcfIR92dGKvT/7OXQnpD3ZqI56+arVmKIoY0U4D98bYc+EOJ4lPqfeRCoDmxjo2r836Gzi+ENSrEMRSpmWeaeX5RS4/uGHp+urAHET/avZkgThkJCA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony@xenproject.org>
CC: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Topic: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Index: AQHbMBN9zgKXu6QHp0mudGAMtCr+w7K9RysAgCKFMICAAyspgIB0b8GA
Date: Mon, 24 Feb 2025 09:57:58 +0000
Message-ID:
 <BL1PR12MB58491271C360CE4345A915AFE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241106061418.3655304-1-Jiqian.Chen@amd.com>
 <Zztlvl0m-Oi2XGXq@l14>
 <BL1PR12MB58491C9D1CCC1880C442AF73E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z1sDXYATWad0Rbyf@l14>
In-Reply-To: <Z1sDXYATWad0Rbyf@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8466.015)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB6342:EE_
x-ms-office365-filtering-correlation-id: cc5cf4f4-f05f-427e-365c-08dd54b9b7d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFlsRG53N1FPdzVpM1BvRFpyN2JHa3NVdnVnR25lUXRXQ1VOVzExcDNHclRU?=
 =?utf-8?B?MCs0aUovM3MxRUhnL0FFdE52L0trT2hKbkhGTE00Q2E0VlgrRC91V3Q1RW5N?=
 =?utf-8?B?OW9vTkVDeWptMXJ5TEdyWWVNc2kwWHNhQ1pTNmlZMTdDbmp5MU5aU1Q4a0t1?=
 =?utf-8?B?YTl1RmRFM3pzRlZoK0taK2NRdWxsM1I2eGd6d1c4b24vdkN2Smt3THlkT1ln?=
 =?utf-8?B?UFNHQThGRU45UE5sUTU0RzQ0LzVrdTZFbXNya0h3TWxob3RYdUUrc2dHNjVE?=
 =?utf-8?B?NCsxWFArekNueG8yNG9UaEhabmp5YlZSMVhGUUplUlJJTVJvZVlkYm1uQnRU?=
 =?utf-8?B?a3NibVdIbkNqeitqdnljWjc1Z3VId2EwSHArTGpXTHBBVFM5YUhlbTAxZGZ6?=
 =?utf-8?B?SW9UUHEyTk5RQ1dsN0NLMWFTYSt6Q0F4K0ZuTXZZUG9hbXZFK2FGaW41Rlho?=
 =?utf-8?B?ZDdpTG00czRxc2U5UVUxN2VtTjlMM1NHSklQSUQ5bWpyV1V6MUZTYVd1b3Qz?=
 =?utf-8?B?TVVnbEd3Nmxpem0wekZNbHdwdlpDZ3dsUUxDVVQvUmRYVE5rVzZMWXlGMzlo?=
 =?utf-8?B?K0JrQ0xRN0huUEVCalpLVk54L1NuVFpaZStMT1NGMkVob0l1Y3VtZHhoVHFR?=
 =?utf-8?B?Q0ttT0dlcEcwNkdsODgrU09HTUlhL1ZDK3hJTEMrek1xdThHZ0pVTXp5c1di?=
 =?utf-8?B?c2lNayttUGRldUFWbENOTG9HaVZtbHE3QU4rSENQenRQUEl1OUJWWHpiN0tU?=
 =?utf-8?B?SGx4RnVPa2lDMStJbU9jR2MveXc3eWlRY1cvV2JTNHpHb0YxZDhSZENTQkFU?=
 =?utf-8?B?dEdqTGF3dkJpcC8rSEVFQi9xNjRhbUs3RVEvMzgvZWsxdXhUaFFubWFOZGNa?=
 =?utf-8?B?Wjg2TXl6ZFJUbSthdnpuRWFmRlJrNGlxeXlNWGt4NFFETk1uNEtBdlM5bkhL?=
 =?utf-8?B?WGUyVWwzdmRsN0V1YmNvMXM5Mk1ia1lNWmZmMkVTK3dvN2diYUI2M2FNYlpE?=
 =?utf-8?B?YStiNlBSL2xDTmNZY05vZ0l0TVNqdkZKR1BCOTZmQWhGeFg1czhxTkN3Vzlw?=
 =?utf-8?B?cTRoSUROTDBMQ1RQb2xFN1ZBM1J6L2RKRStidnEzOGZNblNPZ296Kys0RDFl?=
 =?utf-8?B?a0dNQ1ZuN2Y1TUlLRHl4dnZvRmNjVkRDQlIyZC9vZXpUaEZDb3lheVNLTThH?=
 =?utf-8?B?Y3hwNXRtRHU5V1QwWG53NlA0SFA1Y1dyWmtmUTBXa2M1NXZWclppak5MNVQ5?=
 =?utf-8?B?azRTL0hyYUIxQzZuMFdrMGFWVDNyU3FMemthSFF2OXRKVG1wdWNBalFrVlJ4?=
 =?utf-8?B?UUxLWEUrZEhoeFdLWnlQWUlwejQ1a3pyVEZvOTVTZ2t0dkdQWEw5U3licHRK?=
 =?utf-8?B?ejkyUlR6cXpCK2swVUJNMmNSbUtRT0pIYWlKVFZRRVBwNjBCenNkMHBRelZw?=
 =?utf-8?B?cllZbVQ4aThZdnZtdGJOaTB0YTBrVVZYN1I5YjBDVVRuSGtSa1dXcEdHTDFW?=
 =?utf-8?B?WlcwVDZxZnFzUjlka29GZTV0RHZPaXV2azlGOXIxMmNnNEtzWUxrZzZhSkdi?=
 =?utf-8?B?UVBzTkUzZVJSQnF5QnR6SGJFeE1Jb1RTTEhYUjJOTlRvdEp6aVJqb2NRdWt4?=
 =?utf-8?B?RXA4bExDRSt5SS9nbHlqODhPWFRvM1hiTnZkM2JvNVc4dWlBMGlYcnBycWRG?=
 =?utf-8?B?YnpYenY0QjZRdVphMmJlbGlScnhOVndTT1ZxSCt0ejdDSmxhTi9nT1owNGlv?=
 =?utf-8?B?alNZaXFZNW1Cem01M0R6ekNvZHFZcDZzdHdnL2VhK2MvNUk5OGxndExJekdI?=
 =?utf-8?B?S2tPdmM4VXFEYjFIdTlFMko5cGR4bUM5eXdBUStJNFFaVVpGTU56TElaL2pU?=
 =?utf-8?B?SVFGN2t5YjNNbUZYQzMvUUY0eDE4M3d3QWpkWVc3ZTVGZU5WaFgwd201SG9l?=
 =?utf-8?Q?kmVsycN1HyMjUUuzFviFCDaOEeEpo32C?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGMzLzRaUml5WG9zVVllQTJQZzNZb3ZpZUMveEM3bWo0TXBTYkRFRlAvbGFq?=
 =?utf-8?B?d3RqelA0d2Q0bmsxNFNTQnNGaVVyQ2hIL2NWOTBDUUJ6YTFpQ3FwOStybUcv?=
 =?utf-8?B?N09STXhxNDlGR1ZHMkxCcmpJQWU0UlZsL2h4YVkvbHJ1ZVpIR01JaW0rS0VU?=
 =?utf-8?B?dE5MZG5VS01SUTFlK21jQjhKM3Y5THNmbU9DM1plbkpSdFYyN1ZaM1NTVVAz?=
 =?utf-8?B?NU5uNDJqbGpjZnlrR2dSUmYxWTlmWTNYUDBWeFlMdmZncWowdTN4S0RHSWVi?=
 =?utf-8?B?dFBCdVl4bmEyY24yVFBMSmZYYmIwUHZlQ2ltUXlGUnJwMWtjY2pwaWlXMzNw?=
 =?utf-8?B?cGt6N2lRS0Y1bDFSMGR4VVI5MjRjKzlGU3QwaUNxSEhsVHJwNy9lZTc4cUZw?=
 =?utf-8?B?TXNjRk80WFpqZXFhYXMrOG9RS3k5UDhvbjFkTnhJZkdqUWI2TlEyNzk4Z1ov?=
 =?utf-8?B?TVhKQWdOa1VVRzE1eGVMNW4vY3dBY3ZGeFVKaTJkVXYrTlZjd3pZcGp2R0hY?=
 =?utf-8?B?bTJobi9ZbGwxWnBTa3l3UXp6S0dmRWliQTdpVE5PVkYvNjUvRzU2aVVUcURC?=
 =?utf-8?B?bEFEbnpRTEVKVndjQVByZ2lxeFJYdllPS2dHUlNoRXNtTDZtekJjdnZoZmhF?=
 =?utf-8?B?VDJmeXFpeTJkZ0ZPNFdFN3lsemkyR2M0LzZneFVzM1pvUHpwbi9UZ0lpdkRH?=
 =?utf-8?B?YkZYNTJSMjRzWk1QeENGTHRNS0pJWUR1a2dWYlBJckIzUm5hYkVZQ3ZTVlln?=
 =?utf-8?B?U01xWGk2ZmNaZnpKQTJOL1p0dnVwZU02dmNZcnFnNWNleFFCUWlmSlYyNXhP?=
 =?utf-8?B?UFZGN1R0Ujk1czhTQXhrbVpRd0JlOVFhMzNXcUxDNmh0UW1tVzdCL1BrVlhu?=
 =?utf-8?B?Qk10c0x6QjVydEhtQVNMd3NQM1dzRGJVUXFxMitPWFg1RktYMGtjMFdCYUN2?=
 =?utf-8?B?S2w5T1ZWcDRVLzdQZDNmWlF6WXZkSEp4YjlSc1ZzcUgzZXk0YUdXMWJsSFR4?=
 =?utf-8?B?NFpCV1krY2JBYkVGQUlDQ0F2cXJrMzJwSW5SY0h4ZGV0bE5pYnV3MUNGdUZS?=
 =?utf-8?B?SUZ1cXhxTWxNdDQxblRvOTZLdk82L0ZpVHFnUi8wb29XQ1lkVUtSdlhkTCtR?=
 =?utf-8?B?bGU0dTFucmtnK05seDZPTWt6R3FHZGRBQW9RUHBoeUN2WGhucFhqUkp6Mi9Q?=
 =?utf-8?B?RldDdUdWd3lDZFpHSVR2TVNBQjdDMXEvZGVvKzJ4T1ZVcitIV0lyTG1uTEFG?=
 =?utf-8?B?UlVPUkdiL2lYSlA3bWtiQkxOeUZXSlZPSHQxSkdhS3VidnpSKzFWNXA1Wng4?=
 =?utf-8?B?UFVycERnQjQza3Q2NVJ6L1FiMW1rMnZWNkdmZG4zNzAwbC8xeEZ0UFhLS1Bu?=
 =?utf-8?B?bFNONi9hRy9SSVVZcWo0aDhjWXRTVGMrMHhVZ3owMHdqcDUxcnhqam5SOGJY?=
 =?utf-8?B?Y1RKWVhiZ3FhTWM2Q0NOb2dtTDlDSjRUWm1rOFFqSU9jR3pUWGJRanFSSzVE?=
 =?utf-8?B?NU1jWDVuUHRudjZvK2VjYlRFRWR4VDhYYzdJaFlGS3B4MkhHa1RsR1RaVWxX?=
 =?utf-8?B?ZFZvY0IxbHM4dndCQTlLVWZWZUtRcU1JZmsydmtiTzN5NDNJZlRhZnJKUEt3?=
 =?utf-8?B?Wm1zZHJTWW1QaDhLRWEzSmNsMW02cnJFSS9VUVVyMi9udGtwSHRINUczN2RV?=
 =?utf-8?B?L254b0JGTzM1ZE9YWjh1UmRhWUtpYlBqdkdjbkhOek5iRzhkYnhwT2V3TFc3?=
 =?utf-8?B?aURuZzI2VmF2SklMSys3ODNLbEIxeHcxR09sbjZiMFhVZmpSWG9ZK3JaMFUv?=
 =?utf-8?B?bFFwTkx0Z0JoUHZVcUZidHpjUCtSa3hQUmIzRkJqVm43QnhGTkdFRTR6ZG96?=
 =?utf-8?B?SEhQbjNxa3pPcHdnVFVDMnZ1V1ROR0ZvelhjQytnYUdaaCs0WTIrVFRoM0VO?=
 =?utf-8?B?UjdVck43U1laSlhwdXJ5NmdTVXZxNUdHd2JlVFhlaFFpRlM3ZjJJbjJ5QkRU?=
 =?utf-8?B?YkRxcHhxbHpleUtSajV2a3c1d1dWdzBrcENtNCtVb2QzN0pFUXFWT08ybUhO?=
 =?utf-8?B?N0dmS0xwMnJYS1FyVDFrd1ZHZ1dVang5cTNpMlN6azZKeWQyOHVFUFNZdFdk?=
 =?utf-8?Q?8vnc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEC7BCB09AB6394AAD7DF3A5047E49B9@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5cf4f4-f05f-427e-365c-08dd54b9b7d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:57:58.5766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3xiKzhxlEAecgwe7YZBYt44pMs036vFNsyejVf36PKJuHIWGkgxT/Hz2kNarYOTyuUBnvNLU/3oxpOP1yOVO4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342

SGkgQW50aG9ueSwNCg0KT24gMjAyNC8xMi8xMiAyMzozOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6
DQo+IE9uIFR1ZSwgRGVjIDEwLCAyMDI0IGF0IDA3OjE3OjMwQU0gKzAwMDAsIENoZW4sIEppcWlh
biB3cm90ZToNCj4+IE9uIDIwMjQvMTEvMTkgMDA6MDUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0K
Pj4+IE9uIFdlZCwgTm92IDA2LCAyMDI0IGF0IDAyOjE0OjE4UE0gKzA4MDAsIEppcWlhbiBDaGVu
IHdyb3RlOg0KPj4+PiBJbiBQVkggZG9tMCwgd2hlbiBwYXNzdGhyb3VnaCBhIGRldmljZSB0byBk
b21VLCBRRU1VIGNvZGUNCj4+Pj4geGVuX3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3BpcnEg
d2FudHMgdG8gdXNlIGdzaSwgYnV0IGluIGN1cnJlbnQgY29kZXMNCj4+Pj4gdGhlIGdzaSBudW1i
ZXIgaXMgZ290IGZyb20gZmlsZSAvc3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxLCB0aGF0
IGlzDQo+Pj4+IHdyb25nLCBiZWNhdXNlIGlycSBpcyBub3QgZXF1YWwgd2l0aCBnc2ksIHRoZXkg
YXJlIGluIGRpZmZlcmVudCBzcGFjZXMsIHNvDQo+Pj4+IHBpcnEgbWFwcGluZyBmYWlscy4NCj4+
Pj4NCj4+Pj4gVG8gc29sdmUgYWJvdmUgcHJvYmxlbSwgdXNlIG5ldyBpbnRlcmZhY2Ugb2YgWGVu
LCB4Y19wY2lkZXZfZ2V0X2dzaSB0byBnZXQNCj4+Pj4gZ3NpIGFuZCB1c2UgeGNfcGh5c2Rldl9t
YXBfcGlycV9nc2kgdG8gbWFwIHBpcnEgd2hlbiBkb20wIGlzIFBWSC4NCj4+Pj4NCj4+Pj4gU2ln
bmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+DQo+Pj4gQWNrZWQtYnk6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255QHhlbnByb2plY3Qub3JnPg0KPj4+DQo+Pj4gQnV0LCB0
aGlzIGZvbGxvd2luZyBjaGFuZ2UgcHJvYmFibHkgbmVlZHMgYW4gYWNrIGZyb20gUENJIG1haW50
YW5lcnMsDQo+Pj4gQ0NlZC4NCj4+IEFzIFBDSSBtYWludGFpbmVycyBkaWRuJ3QgcmVzcG9uc2Ug
Zm9yIHdlZWtzLA0KPj4gY2FuIEkganVzdCBtb3ZlIHRoZSBkZWZpbml0aW9uIG9mIHRoZSBtYWNy
byBiYWNrIHRvIHhlbl9wdC5jIGZpbGUgPw0KPiANCj4gTm8sIHRoYXQncyBmaW5lLiBJIHNob3Vs
ZCBiZSBhYmxlIHRvIHNlbmQgYSBwdWxsLXJlcXVlc3Qgd2l0aCB0aGlzDQo+IGNoYW5nZSB3aXRo
b3V0IHRvbyBtdWNoIHRyb3VibGUuDQpObyBtZWFuaW5nIHRvIHVyZ2UgeW91Lg0KTWF5IEkga25v
dyB0aGUgc3RhdHVzIG9mIHlvdXIgcHVsbC1yZXF1ZXN0Pw0KDQo+IA0KPiBDaGVlcnMsDQo+IA0K
Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9wY2kvcGNpLmggYi9pbmNsdWRlL2h3L3BjaS9w
Y2kuaA0KPj4+PiBpbmRleCBlYjI2Y2FjODEwOTguLjA3ODA1YWE4YTVmMyAxMDA2NDQNCj4+Pj4g
LS0tIGEvaW5jbHVkZS9ody9wY2kvcGNpLmgNCj4+Pj4gKysrIGIvaW5jbHVkZS9ody9wY2kvcGNp
LmgNCj4+Pj4gQEAgLTIzLDYgKzIzLDEwIEBAIGV4dGVybiBib29sIHBjaV9hdmFpbGFibGU7DQo+
Pj4+ICAjZGVmaW5lIFBDSV9TTE9UX01BWCAgICAgICAgICAgIDMyDQo+Pj4+ICAjZGVmaW5lIFBD
SV9GVU5DX01BWCAgICAgICAgICAgIDgNCj4+Pj4gIA0KPj4+PiArI2RlZmluZSBQQ0lfU0JERihz
ZWcsIGJ1cywgZGV2LCBmdW5jKSBcDQo+Pj4+ICsgICAgICAgICAgICAoKCgodWludDMyX3QpKHNl
ZykpIDw8IDE2KSB8IFwNCj4+Pj4gKyAgICAgICAgICAgIChQQ0lfQlVJTERfQkRGKGJ1cywgUENJ
X0RFVkZOKGRldiwgZnVuYykpKSkNCj4+Pj4gKw0KPj4+PiAgLyogQ2xhc3MsIFZlbmRvciBhbmQg
RGV2aWNlIElEcyBmcm9tIExpbnV4J3MgcGNpX2lkcy5oICovDQo+Pj4+ICAjaW5jbHVkZSAiaHcv
cGNpL3BjaV9pZHMuaCINCj4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


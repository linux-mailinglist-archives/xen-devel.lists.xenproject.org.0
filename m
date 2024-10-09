Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D2995E3C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 05:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813683.1226683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syNaM-00073E-8k; Wed, 09 Oct 2024 03:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813683.1226683; Wed, 09 Oct 2024 03:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syNaM-00071P-5h; Wed, 09 Oct 2024 03:42:02 +0000
Received: by outflank-mailman (input) for mailman id 813683;
 Wed, 09 Oct 2024 03:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3in=RF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1syNaK-00071I-U7
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 03:42:01 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2409::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f6e6b82-85f0-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 05:41:59 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 03:41:55 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 03:41:55 +0000
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
X-Inumbo-ID: 6f6e6b82-85f0-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s20HgENfdfOEmZZxIR5QXgSVRz3UT6oTC8yX/jcqg/IAbkSW4F4ZXX0+l5es+iNF6ZISrNkAKcUI2LK93YgW1hFVq/KhZRQ8KIZtiAKWCWetXbjWuyMhtRi8fmDv+C3m3QSMKWqNZaR47+SQ2yWsDNXIISyPoHZapPoh6HlQ48EDyojIPuBLQcn7p1szOTVwgboVe9K6Hzx7uhMchajdr9bgIrBQ6LimIYaNGU/Hcz7HtTeJp+jNl+wb1zBZQrXUe3g7+2dlEtokn0GlykpqNnkzrxZhwm2BViYf27NDPJ9lD9kEHxWOIgiTEeBUC1B5cBlZ36vG0awwUAwcfJCGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f50rXRPHpiEQHUOITFL7rhPgpJrUGW/bC8TjM9O8YMk=;
 b=EjXmTVv1eN80f2cnwk830vRzThyvI7C/AE3b7AwtbV6DT8JSTqSsxrGSzWifmLuJzWQJf6XAPE9ZhCsQaK9L50xJKHZrtoyxJLB//V0uLpmYks1Sou7BFWCdhRrs+29tXgGCLsglmXOgnog8Q4B7t5CXO/HngUQUDg1YTu70jLyDUVlHSTy4kcldjC0GuRf1T0BUr7Wq8ruZJ1eXTPt1ztyhUqLhSusV25SMk4BheQk6MKZoeH2iKa/EgRfyblEafaiWl4c6cCOHDyCAx/k5LntdO7IWiLgkZeqm6D01GNYvIfPFcEuDCHqAa4fCVq7bQn+izwdO3eImUHIneLVhWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f50rXRPHpiEQHUOITFL7rhPgpJrUGW/bC8TjM9O8YMk=;
 b=KINEZ/1zkqYmlGDM+hpsRLmTpmAK67+PM+Wv9N9GZCCpaa555AKhuwBlp/FbD0mHKrfp01HXDkhkjej400HNMWxXXlbDAKAh7XnjtTNEfHv0MJJ2sls0hOcRgJFfpSLUxqK/mo+qCOvTT3wbKNT7CgLvjBfdsV8uC6tcowTFUEM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: Linux 6.12-rc2: xen-privcmd cannot be loaded in domU anymore
Thread-Topic: Linux 6.12-rc2: xen-privcmd cannot be loaded in domU anymore
Thread-Index: AQHbGeNgnDbabu8lHkipFVKSzhoZJrJ+SluA
Date: Wed, 9 Oct 2024 03:41:55 +0000
Message-ID:
 <BL1PR12MB58498966A7308B5CB6CBE86DE77F2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <ZwXQKzubX9Dj_vhc@mail-itl>
In-Reply-To: <ZwXQKzubX9Dj_vhc@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8026.020)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV2PR12MB5989:EE_
x-ms-office365-filtering-correlation-id: bf75d1f0-0e3a-4fb4-ac1d-08dce814524e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGJmM2k5T2JKbTRlY0JxNFdQQkl2NmlZb3JDRzZTU0F4WW9ZdWhCc3ZqeVFp?=
 =?utf-8?B?Z1diMzFiUGdpd1VIamt3eEl0cDNwZkkwTDQxSTNOelZ5THFaSW5qeHd1T3I2?=
 =?utf-8?B?NWcwN1p5bTluM3E5b2NCNXBFK1QwaExZSlpaUkd1NXk1enNSK1FRYWpuekJM?=
 =?utf-8?B?ZnBxTUJVWnl4cHJpUVBJbXQrUllqczhQT1VoWHV4d0N4OWEreXhDWnhCVFM4?=
 =?utf-8?B?MDhOcTJSZW40Vi8rY24rbC9MN0o0MW1YTGdURlNXTUVoZ3dYdjVPcHBzTDNL?=
 =?utf-8?B?TzB1L2NwWHF3YTA5c1Q0QkRPaitSZGRwRlhieVZGN1pycXpneHFMUWl5V1c0?=
 =?utf-8?B?ZHhUZG05aXVwMnFXNWJaU0hjQUJsL2xLWGZ2M1lnMWYxN1ZPc0MxdnFVRnla?=
 =?utf-8?B?S2tCNTZjeU9RUXU5b0JMV2U3cTU3YmJTYS8ybGQrUThrNEpQSkhROU9pNFph?=
 =?utf-8?B?dHNJRzdzUDhCcEhEbzBQSjdPcEthazNGSkR3YXd4eGFnamxlM2xjWXB5anAz?=
 =?utf-8?B?TTdFWTJjdW9RamlxTm1DbmhhQjZiVFRKVXVxcmtMdUtTcnlXVTh4N1NURmJT?=
 =?utf-8?B?ZmxlQjgxSURUMnkwZVJBbjNuWW8rR1VZbzU0WjhFTmxLUDQ2WkhkU1U1cit5?=
 =?utf-8?B?aEYrNTluRnIzWVE4K0dyTEhxRTk5bjZKYzJacXlUd2JkSU5uM1RINUR4MzdQ?=
 =?utf-8?B?ZGRjaVFiNmgvZzIzeVdtRVE3a080TXdiL2xmM3IxaXVZUVJPWWVpSnBmRTR2?=
 =?utf-8?B?TzRxakUxcllyQUFWY1FiWE5uZFFDR0lmbEFGVXpLcjh0OVorUkhWWlpSMnNJ?=
 =?utf-8?B?dE95Nis1Uk1UOXdkbWUyVlA0SkJVd0RCZ2o1RWt2Ni9MejF2TjdJa2lwM0V6?=
 =?utf-8?B?WGU0RVdnMGZjVVkxaCtibncrcEx6OE80OEYrcFQ1VU5hQlJZZUFsV0d4a1Vo?=
 =?utf-8?B?azJVeXZHclE3aWtRZjBvdWFzSjE3ZVpOaC9SeWRKUS9rT0FYdmNzb0lTYVpB?=
 =?utf-8?B?Y2lNZnBETmxySnVVZVJNeGpQemQvTCtqVStTMVloL2x6L3dEV3R5MXZPSnZ2?=
 =?utf-8?B?R0pMYlR3RG9hTXVORHNHN2V0QitHYy9RU2JPVFAvVGlXdUxEVk92eWRsS2lE?=
 =?utf-8?B?NUdsaFlWWUNGY2dzM0llTGVxREhVMlMrc2hKelV6WlZiWENPY0lJeUc0dFpU?=
 =?utf-8?B?QzNGcFVuaWZJd05CR3JybzV0VjV4M0FzRisyT2I5SFUxTFR1OTh5SFZiNTNO?=
 =?utf-8?B?Sk92SHQ2SmxDTzcwUzAxYktSbW9CRGU5MDB0UHJ3eThweXpFRnhOaExVMXFv?=
 =?utf-8?B?dWgyUjg2Z0FVNHQvOWFVVThMSklXK2FqdXU2dHBUOW81RHBxOG1BU3Z4SExF?=
 =?utf-8?B?ZXBwdXliY2tsWjdMbWc3czZrMmpVVnRGZEF6bzZJYysvU2JSZURzekpMVy8v?=
 =?utf-8?B?b3BveVNKTkNjQWNtdFdYQzQrdEtwVElTVDdMSklJaSs5bnh0OHlxd2ZvOFY1?=
 =?utf-8?B?UURZdTJDVXdzL3BQamlJZWNUSnFPWGptczQrQ3VLd2hwTWwrbndSY3laOS9l?=
 =?utf-8?B?aDkrQmdZTWkrM01MekZCaTBXNk1kRTkwN3pwK2N6TU4xRW42RVlWcm1uRzRV?=
 =?utf-8?B?citwOXlXTW4xYlZtU1IvaXBDVFg4WGVYNUlPNlozYTEvZ0VlUVpaQlAyT2ov?=
 =?utf-8?B?eWlFQWpRcmYrOElCMjJxVUozZVlPWlN5SUU0dmhxNklKeEVNYlNzSmZiODhI?=
 =?utf-8?B?aWhwVHBKNnEyRy9vYjNUOUNwdzMyLzBVT1ZhanJaWlF3UEdST2JwckNmZWtw?=
 =?utf-8?B?Zi9YRnE2ZUdDY0pYWkNEQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDVLQm5KZEpML24vbzFjZ084d0c1a09QUFczQjRCS29GYzVXcWQ1V0wvK0Vi?=
 =?utf-8?B?ZXNZVFZUaFF1M1owaFVsalBJYjV5N2g4VGFHOWJJSDdJdERTd1M2R3RMTFZw?=
 =?utf-8?B?dk1tVE0xTkROdGlkTGRPVmlpaDA3N0dRdjYyTUtvM1Y1RE9KQUIxYktUWEU1?=
 =?utf-8?B?MTNqZGk4VVNhZ2xMK0tZNC9hcVJPVmYrRkJJQkJ6UlhHTUY2eG5HSklzcU5F?=
 =?utf-8?B?R3hEZHJJUmhja3RoQUx1REhHOURMeVQ2cDNRN1ZwaWQzSTZpMjF4U215UFpt?=
 =?utf-8?B?b2pzQmYyVTJPaTVNam8wUW1TTFFzN1MwbHgyMTNKY1ZaaThSTVlmTmhyUS9N?=
 =?utf-8?B?dlhibVdMQURNMW9jaUtUMnBmOEF2UkVqVzJ4T3Rvang0clF2UE9KVFZHa2xW?=
 =?utf-8?B?WjltaUsrNkFSUVlUcTJUVndOdkdxdXZqblMwUDF3RmdUK1drSWxWSTN2a1cr?=
 =?utf-8?B?L0VNemFXUGJvZXJTaFBHYVdGaFZTbnljOTQxZDZjY0x2L3NZZHhsQUZQVEYz?=
 =?utf-8?B?RjdRbGwxUWZ2T21mN0RubmJ4eGRZYzYxN1NHWkcxR3R0bFVVMGxaZE5UdjVS?=
 =?utf-8?B?U0s5NUJXdURsUi9PLy94cVZJSXFVblhONkhuZXF0VjdmNmdmT3A3aVB5UGhD?=
 =?utf-8?B?YWhlNHUrL2k3ZVFkaEx1VTkyREtPbUNLZlUwcHRRNW9TZHRGenk2QkZtY0o4?=
 =?utf-8?B?bFlyQlNCTUZMZWNFNDQrMXc4R25Nc0ZZeHEyWmdoZ1hQSGdSdnVyc2VkanpP?=
 =?utf-8?B?OUVzaXFZUDR2VjJvR2pQTXlYR0tkcW1waWRBSWkxejV0bnVmQUlyRGRPYmdM?=
 =?utf-8?B?WktLVmdjeVZBdXN3VHFSRUdhUVdkSlNrQXUrQVBpZXBCMTJ5Ukg5clkzak50?=
 =?utf-8?B?TjY0VWlnRmlFNWZLWEVNbHpNOVhEM2hiR2NXTmxSd2xiYnV3aVdLWHZSS2RH?=
 =?utf-8?B?dFNaeGc0b01LT0N5THAveFlURmR6QVI5MjBwMTc0UjhQaC8zVG1jTVp0ZzNQ?=
 =?utf-8?B?VnNPMzZjY3diSXpwTURRa3gxaFRUSUh0ak1MYUdCTW5xOFRHUEtUeEZOSEZ5?=
 =?utf-8?B?Zzk5SDFCbkRqK0RFMFB1bE9vSUVUUGc2NE5vZVZZeTJqMDFnT1owTkFTL011?=
 =?utf-8?B?eTdJUjhHK2dQcTZ0RGx6QVVFdHo3S2trbExkTVN1QnR6d1JYN0lBbWRDNHMy?=
 =?utf-8?B?Nk9rN3Ryd3ZpTkZ2aWJYVnp4dUgyQ0lxVThKdnVRQjRGU2RqT24xWlpuUlZU?=
 =?utf-8?B?MFlubzlvOG1odjdGOHdnb0Z1Yk9tVld4Q2t5ZGtGYVNIc3VpVEpmUkE0REtx?=
 =?utf-8?B?VTN4UDhQR0I2ejJOV1NHT2E4ay9Xc1p1N0hIWS9wcDBuMlloalJrVEova0dZ?=
 =?utf-8?B?SWROZ2gwcndWaXF0a0poVWx0eWVIRHRrbENJVTljZmpacmVtL1JtMThub1Y2?=
 =?utf-8?B?OXBXUUVtaHNLdlZsb2M1cVdja3BNSHU2cjJzdUkyeDVwMzJveWdBa1IyZjBN?=
 =?utf-8?B?RkJUeXh1Z1ZpMDh3ZW5WaUVZd0N2RlFvSDBCVGg1azk2b0lDMzVYaUFERXpo?=
 =?utf-8?B?NXBtaVZ5UG5tL2xzWmJ3em9TMU9HZkRUeDBKYzQwcTlxSW5WNnlORTJITFJ6?=
 =?utf-8?B?REQyQlVMMGJlcmlkckVTUzdSQnd5SDRVZXM3RDRxb0NBTys4cEVHR3lOZWF1?=
 =?utf-8?B?dXJRUE95Q1JHeEt5VVU4U3p4c29LTTVlTEFzQkdrZ0Y1Q1dHK2V1eUpjV2Vj?=
 =?utf-8?B?bjVPZ1FkRlRiTmxRUU1ERXNNdDVOV1A4eC9TSEE0NzdQbjJkUEhsYi95VElJ?=
 =?utf-8?B?a1czSEJmUGtEY1UrSWYzeG9aSUtXTzgrMHZrcUh3bUdTeGl1QmFaS2REdlpC?=
 =?utf-8?B?ZkRpbmhWN0U1TnE1Lyt0TWkxVlBEOXNiRmx3M1ZEdXdjVnowaDVnYWFZVmtR?=
 =?utf-8?B?ODRMNHJJYlJyaTFnbGVKa05DNHVjREh1Ylk0TGlDQWNDRVJKSEQwUTE0SUNm?=
 =?utf-8?B?S0taTWx0M0ZqdGF5S2FnYkhLanNkWUgzUmt6bGpWQU1paW9OYWt2aFJTeDRv?=
 =?utf-8?B?M2M5KzlDS1hBVWY2ZnJOZGd4SXVvWHQwaTE3UUFpbGFYWSsrVDZMOXk3aWZm?=
 =?utf-8?Q?HFWI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14C673AD95F73243B29275384E723915@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf75d1f0-0e3a-4fb4-ac1d-08dce814524e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 03:41:55.7387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ok9pRiUYLrXDgIj9whW5hsccA0xCzEstmW5qhoG1PgXIHgMli7fZDwS6vIJgPjRgBcD/eIFRy83ocYo5nZOErA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989

T24gMjAyNC8xMC85IDA4OjM2LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+
IEhpLA0KPiANCj4gSXQgbG9va3MgbGlrZSB4ZW4tcHJpdmNtZCBub3cgZGVwZW5kcyBvbiB4ZW4t
cGNpYmFjaywgYW5kIHRoZSBsYXR0ZXINCj4gKGV4cGVjdGVkbHkpIGZhaWxzIHRvIGxvYWQgaW4g
ZG9tVSB3aXRoIC1FTk9ERVYuIEJ1dCB0aGF0IHByZXZlbnRzDQo+IGxvYWRpbmcgeGVuLXByaXZj
bWQgdG9vLiBBbmQgdGhhdCdzIGJhZC4NClNvcnJ5IGZvciBpbnRyb2R1Y2luZyB0aGF0IGFuZCB0
aGFuayB5b3UgZm9yIHJlcG9ydGluZyBpdC4NCg0KTWF5YmUgdGhhdCBkZXBlbmRlbmN5IGNhbiBi
ZSByZW1vdmVkLg0KSSB1c2VkIGl0IHRvIHBhc3MgdGhlIGNvbWJpbmF0aW9uIG9mIGNvbXBpbGF0
aW9uKENPTkZJR19YRU5fUFJJVkNNRD15ICYmIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQ9bSku
DQpCdXQgZnJvbSBteSBwYXRjaCwgIklTX1JFQUNIQUJMRShDT05GSUdfWEVOX1BDSURFVl9CQUNL
RU5EKSIgaXMgZW5vdWdoLiBBbmQgSSBoYXZlIHRlc3RlZCBsb2NhbGx5IGp1c3Qgbm93Lg0KSnVl
cmdlbiBhbmQgU3RlZmFubywgd2hhdCdzIHlvdXIgb3Bpbmlvbj8NCg0KPiANCj4gVGhlIGRlcGVu
ZGVuY3kgbG9va3MgdG8gYmUgaW50cm9kdWNlZCBieSB0aGlzIGNvbW1pdDoNCj4gDQo+IGNvbW1p
dCAyZmFlNmJiN2JlMzIwMjcwODAxYjNjM2IwNDAxODliZDdkYWE4MDU2DQo+IEF1dGhvcjogSmlx
aWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+IERhdGU6ICAgVHVlIFNlcCAyNCAxNDox
NDozNyAyMDI0ICswODAwDQo+IA0KPiAgICAgeGVuL3ByaXZjbWQ6IEFkZCBuZXcgc3lzY2FsbCB0
byBnZXQgZ3NpIGZyb20gZGV2DQo+ICAgICANCj4gICAgIE9uIFBWSCBkb20wLCB3aGVuIHBhc3N0
aHJvdWdoIGEgZGV2aWNlIHRvIGRvbVUsIFFFTVUgYW5kIHhsIHRvb2xzDQo+ICAgICB3YW50IHRv
IHVzZSBnc2kgbnVtYmVyIHRvIGRvIHBpcnEgbWFwcGluZywgc2VlIFFFTVUgY29kZQ0KPiAgICAg
eGVuX3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3BpcnEsIGFuZCB4bCBjb2RlDQo+ICAgICBw
Y2lfYWRkX2RtX2RvbmUtPnhjX3BoeXNkZXZfbWFwX3BpcnEsIGJ1dCBpbiBjdXJyZW50IGNvZGVz
LCB0aGUgZ3NpDQo+ICAgICBudW1iZXIgaXMgZ290IGZyb20gZmlsZSAvc3lzL2J1cy9wY2kvZGV2
aWNlcy88c2JkZj4vaXJxLCB0aGF0IGlzDQo+ICAgICB3cm9uZywgYmVjYXVzZSBpcnEgaXMgbm90
IGVxdWFsIHdpdGggZ3NpLCB0aGV5IGFyZSBpbiBkaWZmZXJlbnQNCj4gICAgIHNwYWNlcywgc28g
cGlycSBtYXBwaW5nIGZhaWxzLg0KPiAgICAgQW5kIGluIGN1cnJlbnQgbGludXggY29kZXMsIHRo
ZXJlIGlzIG5vIG1ldGhvZCB0byBnZXQgZ3NpDQo+ICAgICBmb3IgdXNlcnNwYWNlLg0KPiAgICAg
DQo+ICAgICBGb3IgYWJvdmUgcHVycG9zZSwgcmVjb3JkIGdzaSBvZiBwY2lzdHViIGRldmljZXMg
d2hlbiBpbml0DQo+ICAgICBwY2lzdHViIGFuZCBhZGQgYSBuZXcgc3lzY2FsbCBpbnRvIHByaXZj
bWQgdG8gbGV0IHVzZXJzcGFjZQ0KPiAgICAgY2FuIGdldCBnc2kgd2hlbiB0aGV5IGhhdmUgYSBu
ZWVkLg0KPiAgICAgDQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNo
ZW5AYW1kLmNvbT4NCj4gICAgIFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFt
ZC5jb20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1k
LmNvbT4NCj4gICAgIFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+DQo+ICAgICBNZXNzYWdlLUlEOiA8MjAyNDA5MjQwNjE0MzcuMjYzNjc2Ni00
LUppcWlhbi5DaGVuQGFtZC5jb20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4g
Q2hlbi4NCg==


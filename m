Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4A9ECA39
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854395.1267619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJrE-0003Gn-FA; Wed, 11 Dec 2024 10:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854395.1267619; Wed, 11 Dec 2024 10:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJrE-0003EE-CJ; Wed, 11 Dec 2024 10:22:16 +0000
Received: by outflank-mailman (input) for mailman id 854395;
 Wed, 11 Dec 2024 10:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqCb=TE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLJoN-00076S-JK
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:19:19 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2405::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d9cbd3d-b7a9-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:19:13 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 10:19:13 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 10:19:13 +0000
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
X-Inumbo-ID: 5d9cbd3d-b7a9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9ARRE1n+10RkBCpvHLylg82sJOWHG3OmwcIQ14pxiw6/2syn+ISaoqLfkVsy6+eOfnkZ7h7VZ2jDSmTnroqV6n/gbJffZ6jTjrsSaCpJjdVRY2hMqvSiAmBLyuzaLGQ4GaCabdgNeChDXC+wGMmN0hSKbkeqR+vNT6L48Sv5xt+6e4/vkRzR2iiVyAyvZA+Y7PR5TBH7s4e7X0vqRv8WhCqMRX0+iGenLXDm+AsDBHh6nbbV6D1RmowiqmESZuCLa9vCL94WYmodbks/q/pCOVDBMZhEakSVicCFWfEZPl0G2WN1W9r9y08d69naEPUTSN47q5/6Np8bcukZ6GC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rePncN1oKWiZgGBMICaWrgUjE3bUSDg2tNc8amZb7zM=;
 b=iYOXeNkHwPSKXtIhVGwc5kGbtbURRhbS13vCh2ISxfmKDInB9ic8hEju1xv4ZHpdoQBKK+CtrVkNMlNUt780mA1qZyNCabj+tOepIBjbVhmktp5ncKiVaaYaCIv2+Atf+J5XIA9mOcmJIeHDb8O3yfhmZsSrPcSsJLb19l3s+XyWIFkntrQzk0XZ8APFO1bMP6HwqDvhIKfpjmmzLAYB8teeQt2Ceo4B+RJC6t+Cwwd2VFguWnVbD6GWkJ/lgdjrBv5y8kIfQvbs0rZhIo/CI11gHX/OKBbt2UJPZw5kN/dim1KwD3EeaB/xVR3Gm26TOZIBgcgCxCb8egB1ZkEKOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rePncN1oKWiZgGBMICaWrgUjE3bUSDg2tNc8amZb7zM=;
 b=UcYJ+g5mX+iJv+7KokDYeW5plwAfvYmuqK5xnCKfRlvLXpAW85ES9CVO7NtH+me5d+MUfMmAcbefroXYxuCgP5hWkVy596pJRwDfp17mwXlW2Y8WS6rp+R26a50Bgfyt5spe9kp3D12ki1BgBFlZw5lwXm9wQP1xvlAb1SDQ3A4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index:
 AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAGXh4D//4qBgIAAiieA//+hwICAABlHgIAB3TaA//+C2gAAAJ7NgAAAXBeAABKP+4A=
Date: Wed, 11 Dec 2024 10:19:13 +0000
Message-ID:
 <BL1PR12MB584926B40E0D4A93449C7C7BE73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <328c3bb6-1adf-4c64-81d4-40704ea1f19e@suse.com>
 <Z1lQlVx_p_nvdLHG@macbook.local>
 <d16e0c56-759f-4184-88c7-1b147de625f7@suse.com>
In-Reply-To: <d16e0c56-759f-4184-88c7-1b147de625f7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8230.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL1PR12MB5972:EE_
x-ms-office365-filtering-correlation-id: 51f41514-c393-4e3f-448b-08dd19cd42f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXNPQVZndnJmcTZmM2twdi91YkgzVGNRTk02ZFpwcWZEYjcxdElNcEZzbXF3?=
 =?utf-8?B?bUZUNTFGNEptOE1abzVNNkVDc1BiQy9VSEdGVGg2b1B4cmRrOW1IQmhjanlq?=
 =?utf-8?B?U1FhZEVHaS8xNytGaWpQcmRPU2FFdFdrYStpK3Q0TG5HNUxJdVkwaFVyUkhm?=
 =?utf-8?B?WERqVFI0aTBBWHY0VUt5cVRGNlRUOExnQ0orQ1I2RmoxM3NZajBjVzVRZkd4?=
 =?utf-8?B?YjJDQndvb1d0ekt0ejlmNG5Uck8yV3VDOFdxTFVPcU9CSE5JZnRtZXdoWHJJ?=
 =?utf-8?B?MVg0d3NRRlBhQWljcWczUkxIY2l0eTUycW83QjJVcktSaFQvSDM1VGc4VlY3?=
 =?utf-8?B?MnIyc0sxNmVNcHFiQ28zQ21rNU52QlU2TGNZU3BLTmM5WkJmZGlqMzhJWjkv?=
 =?utf-8?B?QVRUZmNDbzU4MVROTldLY3hFdDFRT3ZLQVlHOGJHQzZiRWFVekZQZGdZRjVM?=
 =?utf-8?B?N3NmaGNjRDBwM1k2b2xmRFBtcW1hVkI3Njlvb0x5bytIWmFrZGQ0amhiYlNX?=
 =?utf-8?B?MGFXVFhBSG1DZUZJWmt6ZVN4ajRHNVg0SW10Y3dKRVpHMHZwbFJDMVA0eHRN?=
 =?utf-8?B?VW9PVS9FUDhnQjJoSmxET1RZK0FoNkpUQUdMNXhpTjZGWUtGd1B5SExlS1lK?=
 =?utf-8?B?SXRUb3dYM0hUNldYZ1cyWElPc1d6MkFidFJkYy8vY3kvOGNIZ1dndHhycGtq?=
 =?utf-8?B?M0JKNVJ4SW1kWEcxWVM3SkJHZnpEa2czRkVTa0JkVkhNdmFOSWtBajNBYW5j?=
 =?utf-8?B?M1EvVUpEUWVBWDlwNWM2NXhrNlNueUNFdXR1dVkwMklmOC9BTGhyRElMMThC?=
 =?utf-8?B?dTRCeVhJMm1uNUJSc1ZuWkdXV3ViTm5ya2VOd0hZd0w5WXZRMUR6YnNHVEhN?=
 =?utf-8?B?OTlYZ1lob2J0bGdudnV3NmpFOXVRY3RDSmViak5sY1BHbTdQb2FyVjJYaFE3?=
 =?utf-8?B?c1JDa1VNVVYyUThTZDV5U3o5VlM2K0tCSW5hMHovb0Vwd2pxMEJtL1hoUk9F?=
 =?utf-8?B?bklQWXovS1c4cGdRbkJLKzJmaHNxU1hielo0K1VrM0lZQXp1QjBkYStkREdn?=
 =?utf-8?B?NFU0bkk3YUhuU1RyRTh6WDZHeDh5T1NFZktWNHRUTUdKd1hmZzB5YytMT25W?=
 =?utf-8?B?QWZpa1pkZFBSb0VpKzRRd0JSRDEwSTBQY3U2YzNmRkZaejVpR0luV01maXB0?=
 =?utf-8?B?Tnp1RlFTTFl3MlNKR3BVeUVXTmZaWWlIRis2cTJiVk1JaTFrU2NqMnJYdVJR?=
 =?utf-8?B?V0NoRWtkT2dlRDFhY0wrUWdKVE8zbkVvTzg1YzcvN1pBMjc4empBeStrNUpl?=
 =?utf-8?B?UmVyRUw4YlE3R2lsdXUydzR0WlFNOEZmMDdXNEMrTU9nNWx6NnRtUkFrem9w?=
 =?utf-8?B?N2dQNUJpVWpYNDFTdWhUandid3FBTGJadjhKRHM5MmxCNXJPMjgvdmZGcmhi?=
 =?utf-8?B?UDhhNTB0b1pBTC9ZSnFoeXdLOTN6OGVqTFpRcTg3Vy81K2VmclZjQWN2WVRl?=
 =?utf-8?B?a0Y0MWtibVMrUVNLOG1nemU2Y3hXbXRQNTlkZ3NFeWZGOXpSVFhpeWo4Nmh3?=
 =?utf-8?B?ZFhkeW12Q3Q2U3dsZGFxSTVmUXN2SC9tQkVKdGxzWEVrc2QrSFpheVdGSkFp?=
 =?utf-8?B?eDZNcDh5SnVETzMremZCSFM1NUhWT3crVUZjMjc3RW1xbDVKQkEwYjJPMFNj?=
 =?utf-8?B?Wml6ekQyNWJDY2JJMlVVUjlJRHVSa05WREpBdnhMeU5RQUQxQnA5dWJpWmQ5?=
 =?utf-8?B?Y2RVWldNdkJjWjZoSWE1TUtXd1J3RG94UnA5aFJNWkhzdThWWVBRRUtmNld4?=
 =?utf-8?B?bCtFb05ndGUzUmIwSVE1aUVHZ1J0RytRQVRvMCszTzNpMWwrMVE2YlJmTzM5?=
 =?utf-8?B?Vi92ZFdUSGRYd2lrbWZUTU9RNmFuSFpBWmExRlFtWWlZbEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlFLWERJMCsrL0RwYXZOWWFQN1liWXc3L1p3WjNLUnlZTkxIQmdoSE42ZGQ3?=
 =?utf-8?B?UVhRbU9icmpHVG1KZTZvamFWZ1JmK0Uvem1jUWoremxydktQTHprbDY4MFFP?=
 =?utf-8?B?TGNNZ0lsS2xXVkpTYkZIcnQyRmtRK3VESTNXWEhOWFk5dnFTaURPRGdCNERY?=
 =?utf-8?B?WCsvTjRiM0N4YWh1ektMTUhhS2ZueDR4N0xIeHJvNHJ0S2Z0ZG1EbXNVbFFQ?=
 =?utf-8?B?QVp6Sm9oWU9DM0h4TEZwVzVDWFFQUlEvc2t3VVplZHlCaWQvN01uaktzMjA5?=
 =?utf-8?B?OEc1bXhUcmhCSWRsd3hpT0RhSWt5ODF2MjZSRFlVaDlueFV3RVV5MkliMTdj?=
 =?utf-8?B?VFIvY2U4aWRjTmFDY3lTblRZOXRBWjFXK29BYlFEbFFwSUw1NDVxWVVxQ1pW?=
 =?utf-8?B?V0thWE15MTJLV09yN3pXT25SMkVuaitJTzhzTFN0VUN3RmxOSVhtaWdaLzEz?=
 =?utf-8?B?dElMK0Zac3U5bVRmdnJtS01uazcrRFQxSEdSZkMzcHVIYXBDeWxVWWI3Z1Ja?=
 =?utf-8?B?MWd6c29qREgrOWRaaEQrNW5CaVBldXNGb0x0dllTMjl2TmN5d2xnMHM3L3Q5?=
 =?utf-8?B?QVZQRWNqYzEvVUVvejJSSmZiLzliRUIwcFA2bVBvS2dvSkxPYTV1QTlvcjI3?=
 =?utf-8?B?UzR3T1RhaXduQU1uV0QyWVowUDFKMHFlUTlmM2h4Y1FkWkFyNkpwTHRqdG9F?=
 =?utf-8?B?SnhUYkZmdWZUMVhhVzNkK3NtOTIwY0MyZU9ZdEpGVm9OaWNxQ3RFd1VnNmdy?=
 =?utf-8?B?cGpOajVZak5OSlhKbVZHaWxoUERUajB0M1BieVlKZEJiam5yZFczejFFUEo3?=
 =?utf-8?B?RkhwaC9BcmhTSUwrL2s4L2RqZEFrdXFrVmRqaDYwRFRtbTJNdUJoNGNvemx6?=
 =?utf-8?B?bnFaTUtLNkpjTzhiWm51VzZYZE1ORU1yS013SnQ4U0Q3QzlHRlRsS0ZPanA3?=
 =?utf-8?B?U3doNlk0WWx4YWFaLzFXY2J3TnlVeVp6M0Zrdkd3Zk91NEZsWmcxR0NCOUZy?=
 =?utf-8?B?bWVtRmlEQnhVMFBUMHJYdWJGM1gyQzFSNjE2SkUyY2hzdm1DNURLZHUyaGh0?=
 =?utf-8?B?QmZPQmpkMjRlUXh5TlRncHJFWngxUldYYnd3TDRKVlkxWGc4allqTEI4ZGpq?=
 =?utf-8?B?YUN1MEVnOEFMTTdzdUVxSGhBOTdqZVFDZm1IOE1VR1ZualN2aFRpN3ZmVzB3?=
 =?utf-8?B?VE41VUVvUi9WeG94endJbFBPUXNBbnZmZjZmaExnQ3hhUDAzeVp4bExDandL?=
 =?utf-8?B?eXluUVA4bzZqT1U4VjJMbHd1Nno4WUtHRFg0R2dqY2xSdjNGcXhRVm4zS0pp?=
 =?utf-8?B?ZHRjdUl3cUJzWEZDelk1eE44dmc5c2xEZ3Z6Z2ZTWFFQUTFudGZEdWtMRkUx?=
 =?utf-8?B?UjErc2pFczBON3c3ZURqNCtDRmlrR25YbUZpUEpKM0pNdkhWVjhoRldZV1JY?=
 =?utf-8?B?Z2tvM2dSS1BWV3FTcVBsVldzNDJWVTlPZktKUW5ubmJ4S3JCcS9ia1d0UDc4?=
 =?utf-8?B?eHB0cmY2Qk02NWhzNWpMK3l1WHloTE5NMW05UytYaU4zdEY4eGx1bDhJZ3Zw?=
 =?utf-8?B?RElueWtuUk5pR3N6U215T0xqWkhVRmpQNzRwSlMzZFVjQ0dYMXZwd2hMTXUv?=
 =?utf-8?B?KzlPT0lXeEtKaUZvMExWU2tNcGloK1VPa0U3RVFzNy9ZY09hZ2Zld2JzWDNX?=
 =?utf-8?B?Wkw0WXNXd0EveUY0RkQ1QzZFTitveDVwWnBUNW51R2ZlNEVjeUYydUJUN3gy?=
 =?utf-8?B?L1huczQ5WFh6MnlubWJONTZMTkllay9adDFuQkZZY0dFM2VOZE1sTUc2b2d5?=
 =?utf-8?B?M0wvYW54Unh3b1EvYUJ0RkVPR0UvSTNycCszVGlNZlNEbkVxQ0xVaU83MGM4?=
 =?utf-8?B?SjhoZFlyeXQ2Ry96YVJiajJpWXpyT2hXT21jVVlNNVU2NW9jUWxNZ0ZpdGJn?=
 =?utf-8?B?aFd4SmpUQ25lMzUzWUFqdVNyOUhXRmE0NW9lUDRybllYVngvNmI4RUJ3am95?=
 =?utf-8?B?akJOQ2VDTDdGZUppQ2hhNkQxaTZ3dlgrT1VLN3U5ZnRTWERWZGdNZ0JPNlpk?=
 =?utf-8?B?aHRDUUF1bU5GY3ZmTG5DTVM5OWpaeTFEaFVpbGp0MHlVOVNaQ3JodWRGYlBM?=
 =?utf-8?Q?9+IY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD5AEE97DF75014E9971476C761F6763@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f41514-c393-4e3f-448b-08dd19cd42f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 10:19:13.8624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlcYqsU9DfEDY9ZvxnjNC0MWl7lu90RM3h3DNZoffbTzsKV5aGATg+Ts9FQkZHrCV6j2OcSb96CkyAoP3lGQgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972

T24gMjAyNC8xMi8xMSAxNjo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDExLjEyLjIwMjQg
MDk6NDMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBXZWQsIERlYyAxMSwgMjAyNCBh
dCAwOToyNToxNkFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMS4xMi4yMDI0
IDA4OjU3LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+IE9uIDIwMjQvMTIvMTAgMTk6MjUsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBTbyB5b3Ugc3VnZ2VzdCB0aGF0IHRoZSBjYXBh
YmlsaXR5IHNob3VsZCBiZSBoaWRkZW4gaW4gdGhhdCBjYXNlPyAgV2UNCj4+Pj4+IGhhdmUgbG9n
aWMgdG8gaGlkZSBjYXBhYmlsaXRpZXMsIGp1c3Qgbm90IHVzZWQgZm9yIHRoZSBoYXJkd2FyZQ0K
Pj4+Pj4gZG9tYWluLiAgSXQgd291bGQgbmVlZCBzb21lIGV4dHJhIHdpcmluZyB0byBiZSBjYXBh
YmxlIG9mIGhpZGluZw0KPj4+Pj4gZmFpbGVkIGNhcGFiaWxpdGllcy4NCj4+Pj4gQ2FuIHlvdSBn
aXZlIG1lIGEgZ3VpZGFuY2Ugb24gaG93IHRvIGhpZGUgYSBmYWlsZWQgY2FwYWJpbGl0eT8NCj4+
Pj4gV2hhdCBjb2RlcyBhcmUgY3VycmVudCBsb2dpYyB0byBoaWRlIGNhcGFiaWxpdGllcz8NCj4+
Pj4gVGhlbiBtYXliZSBJIGNhbiBhZGQgYSBwYXRjaCB0byBpbXBsZW1lbnQgaXQuDQo+Pj4NCj4+
PiBJdCdzIHJlYWxseSB0aGUgb3RoZXIgd2F5IGFyb3VuZCByaWdodCBub3cgZm9yICJub3JtYWwi
IGNhcGFiaWxpdGllczoNCj4+PiBXZSB3aGl0ZWxpc3Qgd2hhdCB3ZSBleHBvc2UuIFNlZSBpbml0
X2hlYWRlcigpJ3MgbG9naWMgYWZ0ZXIgY2hlY2tpbmcNCj4+PiB0aGUgUENJX1NUQVRVU19DQVBf
TElTVCBiaXQuIEFjdHVhbGx5IHBhc3QgdGhhdCBibG9jayB0aGVyZSdzDQo+Pj4NCj4+PiAgICAg
ICAgIC8qIEV4dGVuZGVkIGNhcGFiaWxpdGllcyByZWFkIGFzIHplcm8sIHdyaXRlIGlnbm9yZSAq
Lw0KPj4+ICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3Jl
YWRfdmFsLCBOVUxMLCAweDEwMCwgNCwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKHZvaWQgKikwKTsNCj4+Pg0KPj4+IEkuZS4gbm8gZXh0ZW5kZWQgY2FwYWJpbGl0aWVzIGFy
ZSBleHBvc2VkIGF0IGFsbCByaWdodCBub3cgdG8gRG9tVS1zLg0KPj4+IEZvciBEb20wIEkgZ3Vl
c3Mgd2Ugc2hvdWxkbid0IHVzZSB3aGl0ZWxpc3RpbmcsIGJ1dCB0aGUgKGV4dGVuZGVkKQ0KPj4+
IGNhcGFiaWxpdHkgbGlzdChzKSB3b3VsZCBuZWVkIHNpbWlsYXJseSB2aXJ0dWFsaXppbmcgdG8g
YmUgYWJsZSB0bw0KPj4+IGhpZGUgc29tZS4NCj4+DQo+PiBHaXZlbiB0aGlzIGNhcGFiaWxpdHkg
aXMgb25seSB0byBiZSBleHBvc2VkIHRvIHRoZSBodyBkb21haW4gKGF0IGxlYXN0DQo+PiBmb3Ig
bm93KSwgSSdtIG5vdCBzdXJlIGl0J3MgZmFpciB0byBhc2sgdG8gYWRkIGFsbCB0aGlzDQo+PiBp
bmZyYXN0cnVjdHVyZSBhcyBwYXJ0IG9mIGFkZGluZyB0aGUgbmV3IGNhcGFiaWxpdHkuICBJdCB3
b3VsZCBiZSBncmVhdA0KPj4gdG8gaGF2ZSBpdCwgYnV0IGRvZXNuJ3Qgc2VlbSBmYWlyIHdoZW4g
dGhlcmUncyBhbHJlYWR5IE1TSSBhbmQgTVNJLVgNCj4+IGltcGxlbWVudGVkIHdpdGhvdXQgc3Vj
aCBzdXBwb3J0Lg0KPiANCj4gV2VsbCwgb2YgY291cnNlIHRoaXMgY2FuIGFsc28gYmUgbW9kZWxl
ZCBhZnRlciBNU0kvTVNJLVgsIGZhaWxpbmcNCj4gYXNzaWdubWVudCB3aGVuIGluaXRpYWxpemF0
aW9uIGZvciBhIGNhcGFiaWxpdHkgZmFpbHMuIFlldCB3aGlsZSBmb3INCj4gTVNJIC8gTVNJLVgg
dGhpcyBmZWVscyBva2F5LWlzaCAoY29uc2lkZXJpbmcgdGhhdCBtYW55IGRldmljZXMgbm93DQo+
IGNhbid0IGV2ZW4gb3BlcmF0ZSB2ZXJ5IHdlbGwgd2l0aG91dCBlaXRoZXIgb2YgdGhlIHR3byks
IEknZCBleHBlY3QNCj4gQkFSIHJlc2l6aW5nIHRvIG5vdCBiZSBzb21ldGhpbmcgdGhhdCBkcml2
ZXJzICh0eXBpY2FsbHkpIHJlbHkgb24uDQo+ICJUeXBpY2FsbHkiIGJlY2F1c2UgaWlyYyBKaXFp
YW4gc2FpZCB0aGUgQU1EIGRpc3BsYXkgZHJpdmVyIGFjdHVhbGx5DQo+IGRvZXMuDQpZb3UgbWVh
biB3aGF0IEkgc2FpZCBpbiBsYXN0IHZlcnNpb24/IEl0IGlzICJhbWRncHUgZHJpdmVyIHNhdmVz
IGFuZCByZXN0b3JlcyB0aGUgc2FtZSBwY2kgc3RhdGUgZHVyaW5nIGluaXRpYXphdGlvbiB3aXRo
b3V0IGRpc2FibGluZyBtZW1vcnkgZGVjb2RpbmcsIHRoYXQgY2F1c2VkIFJvZ2VyJ3MgbWV0aG9k
IG5vdCB3b3JrIi4NCkFuZCBjdXJyZW50bHkgcnVubmluZyBhbWRncHUgb24gWGVuIGh5cGVydmlz
b3IgaGFzIHR3byBzY2VuYXJpb3MsIA0KMS4gQVBVIGRvZXMgbm90IHJlbHkgb24gUmVCYXIgY2Fw
YWJpbGl0eSwgYmVjYXVzZSBBUFUncyB2cmFtIGFyZSBhbGwgQ1BVIGFjY2Vzc2libGUuDQoyLiBC
dXQgZm9yIGRpc2NyZXRlIEdQVSwgdGhleSBjYW4ndCB3b3JrIGJhc2VkIG9uIGN1cnJlbnQgWGVu
IGNvZGVzLCBpdCBuZWVkcyByZXNpemUgQmFyIHRvIG1ha2UgYWxsIHZyYW0gQ1BVIGFjY2Vzc2li
bGUuIFRoYXQgaXMgd2h5IEkgc2VudCB0aGlzIHBhdGNoIHRvIGFkZCBSZWJhciBzdXBwb3J0IGlu
IFhlbi4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


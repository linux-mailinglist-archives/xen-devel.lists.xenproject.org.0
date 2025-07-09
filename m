Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E071EAFDFD2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 08:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037703.1410256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZO0z-0001np-Ag; Wed, 09 Jul 2025 06:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037703.1410256; Wed, 09 Jul 2025 06:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZO0z-0001jM-7A; Wed, 09 Jul 2025 06:10:45 +0000
Received: by outflank-mailman (input) for mailman id 1037703;
 Wed, 09 Jul 2025 06:10:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJyx=ZW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uZO0w-0001ig-Tm
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 06:10:43 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2009::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 703b79c0-5c8b-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 08:10:41 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 06:10:35 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 06:10:35 +0000
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
X-Inumbo-ID: 703b79c0-5c8b-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSAJZaChGN1mZlI06jy15oyrD9htB31sO7yLlpl5rOpouMHaTdvc7jb0VFJ6YHYQ3slZeiejaGAcG/3BRLMfQJmhIC6bBXaquSQZcltWgbnOQ5IJ5yLfBzeVHk1dYh39qXXja5cNC0oy7WayNnn4HTwkDAaifqPMBtmh94k61VumnWDgj8FUDBS4ZZwiPqnKD0ZotgfQBi5418iWuIgDHT0A2iUY0vkG/lL5GwjEQapO/U1h/DTw4pOk9WpSxiP8gCZHR/WtQSgFaxFpfkAUVFie+89p05NMFqQII+BmF/BWQ267dtO20KsNDep/JT5leCAm9U9Q0ogyAN5crEHOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1vR90PklkLE6Q/66HJ2QHQ5TvbjQ/gOzlPHN9IDzbw=;
 b=J7dcSCFVeBypJiLxZStH9U9qATY6vbMaYNfujaflHgyq+z49I7/0k9x752MpAnvU3+3WfVFrhJJmtSO2tViggwfY5sWV4mJ0o+kodA6kWpXzAHq47P35lbryq676lD8QF1tng62gdnUAqIOY7fd1M8hQRkmOYOygvkpWSymw39CtY27YRvbeA40YT6ks078kKENMaa6H9FlOB/DoDlElhRLN3u1qgIPRuQOP/3ccVrJ9Pu8w5U7VLLvwbj6/6gUwuoB7uiZcrb5ImQivzH0uBm9wrzRXyYdUapvAQ3BUvbYmDVhpmrTUshW+IpEA7s31uHaUcS+dsQJQXb5qJj+wbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1vR90PklkLE6Q/66HJ2QHQ5TvbjQ/gOzlPHN9IDzbw=;
 b=VUdhphRCCeOrXaT3ic3SEIfB8NO12beFGe2+P4QJ1U0F7Dh/hQeAFMfb4zqFGsudlxPoDsdgFavWSYUlqV/xxfJxyX/pMgvj8TdkJK67kjciUetGRlHZmTaHmyR9M4jrRnruX3hj8+Du+NsecWfwanblahyi+ffmZtruwtCw41k=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 7/8] vpci/msi: Free MSI resources when init_msi() fails
Thread-Topic: [PATCH v7 7/8] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index: AQHb7LJ3j2C9JyD0LUKFMd0W1xBaJrQoXECAgAF/AAA=
Date: Wed, 9 Jul 2025 06:10:35 +0000
Message-ID:
 <BL1PR12MB5849A2910BE0460175413EDBE749A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-8-Jiqian.Chen@amd.com>
 <83abcd7b-e742-4a0e-814f-1f2b801eaff9@suse.com>
In-Reply-To: <83abcd7b-e742-4a0e-814f-1f2b801eaff9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8901.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB6835:EE_
x-ms-office365-filtering-correlation-id: 8749d630-f58f-4818-6e3c-08ddbeaf516a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ODJLcU9ReEVWMnk4K3lWdTgzMmlvWHEzTkROcWVNR1VURTBEUVNINHY3Z0Jm?=
 =?utf-8?B?ZEVqeHZiRkh0amhFV0NZRGVoZmdoYUFPMkpQV3VqODhRZnpPQW4vcVEwQmQr?=
 =?utf-8?B?ODY4WlhXOVU4Q09sb21lTXZkL3YzUW5sNHZFOU44d2I5dDd0YzJhQzRtbmdJ?=
 =?utf-8?B?dStuZyt3SWc5Q0dxN1VtYnM2ejEvVUg4Wm1GRmdoYkF4LytDSWU3VFR3emMr?=
 =?utf-8?B?Z2ZTWUVDY0R1M2dhaFZSb0pDQSsvc3pac1RUbTVZWFMyNCswQitiaW9iYUlz?=
 =?utf-8?B?ZmVpQVE1Q1dYOGNXMmlTT0dIVW84ZXd0UVBsY296MFlTVklBTkFuaDQ5dkpy?=
 =?utf-8?B?ZWlhN25rTGpQaGxQdFNHT0kwWnhZREVMSVBBMFM4dFRwM0JuNFZrY3YzeG1H?=
 =?utf-8?B?RHRLbnREV2tsY3ZFSnlSTjh0bU5KT0pQUzhFNGEyM2graVozdy91RWZkNTVj?=
 =?utf-8?B?eFJsSnJYSWFGSkxXTjZvWUJYdCtWSjA0VjUvdUl6akVGTEFEdzNtT0o3b01q?=
 =?utf-8?B?Y1ZPbmFyZFNHTXpOSjNYNVc0VjVnOE1ZMThFSTU3MTErUFB0V29xRCsvdzdP?=
 =?utf-8?B?aGRJend0Ui9XQlNqc0REWi9HRUZtWWlhU3F1UDZIcnVldHBNQUVONHVhRTJv?=
 =?utf-8?B?QWtGUkREYnBmV0swc0dRQ1Qzc1pHNXE4WXY5aHhzSFBEcy9RdlZkY21SSEIw?=
 =?utf-8?B?bEZXZU11TjZCOUM1R3d4a0l4RUtYdlg2ZDlvZ2VnWS90aUp4YVRSNDJQVVNU?=
 =?utf-8?B?UXNTSHRTVHN6d21xdm1sdXZac1FvMzQyZnYrd09TZ2dPK2FSOTVLRTJXSlhr?=
 =?utf-8?B?dDFzMUhBamVJQjBzV0NvWUVGejZoUzZOSDFTeWsrRmNIMkpZOCs0eng4ZU1m?=
 =?utf-8?B?RElNNzhrZFpTOGlTcHA1ZjVKQUVNVFF1c2NvZEl4cEhNa25qbzJhS1VNSXQ0?=
 =?utf-8?B?bU5CU0FRVWNWZ2RoOE9kTEU1QzVLWWVSK3pkM2I1VEpSQ1FRS0xKUjNFeG9X?=
 =?utf-8?B?R0lTTGxVc0hPclZmOVVPQnJOTXU2OCtZL2c4b3RscEtTZXJ5SkRmaW1HVWYr?=
 =?utf-8?B?WjJiTGdMa1d3YUpRNDFyQXlNZG5tL1FtdW9LYks3VCtzQ2U2SHQ2Wnc1VENH?=
 =?utf-8?B?a0poRVBXSzZlSURtSW9xa1gzUXdsbU5vMVdxdEJGaUlDNnpjcGFlbE5WMDVT?=
 =?utf-8?B?MW1zaURhU2hWdWNJSkVzcFBLQVowcEtwNm9NN2NkTVFmZ0YzQjhDOUM5Sm52?=
 =?utf-8?B?VVcydGhmc010UVhmMjhGUG9KSkdSUjFHTHBMbDhNeHVxOTdvUWtJbitBWkdq?=
 =?utf-8?B?OTZyT25kL3JHaTVSdVcyWDluc0lLOThKclRCSHFTZ0N4cnc1WW5xWG13dW5u?=
 =?utf-8?B?bm1qcXAyeTRLTWU0WmhBM1VFUGRQNU9naUVRR3lNbDV3TEFXUDNDSTZBUzFO?=
 =?utf-8?B?MkEzcHhwQ2pBZ2IzbUttTC9wUzBJbTNRWnpMcE11aUlmdWZKWlR3NW5YSnNK?=
 =?utf-8?B?TlpMbW10cnhsajdHcVBXR0daazRMTVhmcmp0bk5NZkJtNFRBQ3dqUFJvZjZC?=
 =?utf-8?B?MEY4QndhSEMrVHlURmRXOWRaOUtlWUxMdDljVWRRdE1reHJQbTFITmlHY2VY?=
 =?utf-8?B?WjE2UWppNWNxaUpWMFU1dm1KV3ZveFZEbDFXK010RXBFdHZvbUhVdXRtTDQ0?=
 =?utf-8?B?VENDSnpXaDVkOEtOQmtrencvdW4vMXBMR2ovVmV1Q2h5R3lONlBpSU1IUURk?=
 =?utf-8?B?MjVlaEs0d1BibFJrYjlITkpyVjRSRTUrQmpYdGpTSm0rYmxjdEVSVUtrNGFT?=
 =?utf-8?B?Q28yUDRKbmcyMEdWWjQwaWdEelNlejNmQzN3bUx5QlI0ODVaYmVLS2haOGVn?=
 =?utf-8?B?TTV1d1pyMHJJV1dzT05CcHN5akJLeXlVKzV4VUxKQ0NsQ3pBZGlSRnovNFkz?=
 =?utf-8?B?UExseWh3di9JUWxNaHdzZmJEMUpiME9yZFRQcE9tT3FzMmVZQlRUK1ZXT2Fy?=
 =?utf-8?B?YXhaVGNvVk9nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUFtTURnUHN1THhOVmsvSUdUV3ZraFdaTC8xWG16TFNYZ2U5L05rdEs5Mmxm?=
 =?utf-8?B?SGtlRlVRM21NNXAyczJhUm1hOVEweENGRGl6OW9IU01NaHVqL1p1a3Yzd1E3?=
 =?utf-8?B?N1ozUDlZbDN1TE5LQ0t3MUw2Q1BHQVZ4eG5vUjRmOEpCamcyRFBKbjN0VGd2?=
 =?utf-8?B?YWNna0UwMFBnd0trRnJoalpuTXVtVk8weE11UC95YXlLeDlVZkZjdXZmMWFB?=
 =?utf-8?B?UUkxNUx1dmJpOG9CSzJpWWFpNjNuVklBQ011STRvbEdGUG52UkxORlRCaElr?=
 =?utf-8?B?WWFQa2NadUd4OGNvSEhQMEFYVlhBU25aREtkUGN4OHByZHRZY2tJdTNUekVw?=
 =?utf-8?B?T3h3aXFxTDgxU1FwZFpLWEk2ZFh0VlJ3TzJyQWRvVVhHd3NuZWhieUdQRlh4?=
 =?utf-8?B?VVNzTmYzN3FFOSsrUC9mT3ppK25GeVp2VHpjbFl2S09aSWV5VStueWpPcHIz?=
 =?utf-8?B?YTJRK1dlc0ZOTkZuWiswS0pwbzRJVHpwKzNVajY1ZFp5ZkVkUVdlVVk0R0FJ?=
 =?utf-8?B?YjZFL3h4VlNML0FvTTlDMmh2SHo4U1BPOUxWeTFEVVZhb0lyS2pEYm9rb3Yx?=
 =?utf-8?B?TjRsanFWRXpWQ3pQS29WMUdVYXYraFlXZE83WEhnWnZQa1A0eEMzdkR3eEpH?=
 =?utf-8?B?N1NYMDdiTFNkQitWL09oWGFRZ2h4eTlwbXlIWHo3T0huMUQrN1FYUUtRc090?=
 =?utf-8?B?anlJUkszK1JFNXRtUDZqa2ZRdVZiM0o3S3RkdzBwVG1JcGFNVm9SU2pYVVhn?=
 =?utf-8?B?akhzMGRQbFcxQ0JCbVBoc0hoUjVFMlpuSlVhVE5kS2dWVGhZQklFQTU5dUlE?=
 =?utf-8?B?V0JOb0lmRkh3dWF5cm1OQ2NrUUJIdGF1a0NHMzFNVHVBMVU3VU9TQk9XTGEv?=
 =?utf-8?B?V3dZUTc2Z2pVanJXZ09pTWZZNFByRk5zWE96QkhlbWI2cWJla1FLYk9jVU9B?=
 =?utf-8?B?MDJlUE1yWC9YR1VLZkRNRE5UUS9RcVJORWRQS3JNam5WYWVDN2RLbkJGUDFx?=
 =?utf-8?B?Y3kzaSs0SWROK0NOTVhISDBxWFJNRDhXV1BVcXYwanNUMVJEWjUzdzNERHZG?=
 =?utf-8?B?ZndacE00R1dkekx1bFdjbW9aNGVIYlR4ZFFnM1VsYlBDTFJVYXl0K0U1bVJR?=
 =?utf-8?B?VnhkbnhuRTc0UzBKYlFJUUhveTFmUHVJcG5OaklWbGs3MWl2cGgzd3BReTZ4?=
 =?utf-8?B?L3ZjZFEvV0NMY0xKS2xRdC9qbFgvSVRTNFlWNFZqeXJ1eU82SkVjdkFIYUpQ?=
 =?utf-8?B?WG0weUVPY3BYL3JuS0N2WjRPZm4zNmVvcUVGR1JvclJrTkpOQ3NSR0RSRUVL?=
 =?utf-8?B?RXdWQTFoTW04K1RiUGNhYVJmODNxNUc0RHd2c1BkVlpOQkVZVCtvcHFYVENk?=
 =?utf-8?B?WS8xV2V0U2VBU0Fsb1BKNkFZZEZrVlVXcVZRbFc1eTZjQWhkUGM4M05uOGJS?=
 =?utf-8?B?OUF1ZEltMm8zU3QrQ3Y3VW8yR3NudzVLYVlPT2JQNEZxWlZyT2swN0NIUDVY?=
 =?utf-8?B?N2NBRmIvUU1PemlweEJoZ2diK1kvRVQxN3RLcUlKVFVkZWU0QkYxclpPZjg4?=
 =?utf-8?B?dG91RWwwQlZqS1J3RUNNdk5yYUcvYm03NXZON3FUakNNRVhVYm9tYTU2azRt?=
 =?utf-8?B?VkhiNkRKL216SnI1QmpSZkJhRFdCKzVnY3ZZY3FuRkVFdnlubEJXNTQvN2g0?=
 =?utf-8?B?REdRNTNoZFFjYTh2eGpSRG8xVVcvREU3emN4MVkxNzd1bE1hcEM4Y3pydEc5?=
 =?utf-8?B?ZUxiT1kvV1EyVklEdzlQQXU2TWxtNm9PN2NiNmozTS9peXpvWTYxVUMwM2hp?=
 =?utf-8?B?cEdVM21DTkVHTklhT01KMVFlT1NvTzVZTUZGVDQ0MUo2aXZScmg0amozNVdz?=
 =?utf-8?B?MU13eVVlMWJHaDFpZkxCNy9wOWY3WXZObXZuWEdWNHpNN1pldjhNanBuaHFT?=
 =?utf-8?B?MThKdTcrb0wvWmhlcEpiWUFSRE8zOVFBeVFoWUNJeXExTVJYeWpUbGZ0clhE?=
 =?utf-8?B?bDRtYXZMZHRMTTduQy9BL284cUVicU9QYm1sWXI1TDNpSjhGN09IR252Sko1?=
 =?utf-8?B?b0FnV1RpdytHM2xzUGVuWk1XZWlRRHFtdzdmUlByQ0EvVWEwVE1SUCtiblhn?=
 =?utf-8?Q?27kg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A5223D570DD524AB8194134E9EB2548@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8749d630-f58f-4818-6e3c-08ddbeaf516a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 06:10:35.0379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UdU3CxgcfGaCSQSEfgTkzjuKEQsb1BjdLAREvYml1BVL+ZJoxbfXKaxhvOTh/y0IONCLCYvwCOAl4z2nxKK3rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835

T24gMjAyNS83LzggMjM6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wNy4yMDI1IDA5
OjA4LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IC0tLQ0KPj4gdjYtPnY3IGNoYW5nZXM6DQo+PiAq
IENoYW5nZSB0aGUgcG9pbnRlciBwYXJhbWV0ZXIgb2YgY2xlYW51cF9tc2koKSB0byBiZSBjb25z
dC4NCj4+ICogV2hlbiB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKSBpbiBjbGVhbnVwX21zaSgpIGZh
aWxzLCBub3QgdG8gcmV0dXJuDQo+PiAgIGRpcmVjdGx5LCBpbnN0ZWFkIHRyeSB0byBmcmVlIG1z
aSBhbmQgcmUtYWRkIGN0cmwgaGFuZGxlci4NCj4+ICogUGFzcyBwZGV2LT52cGNpIGludG8gdnBj
aV9hZGRfcmVnaXN0ZXIoKSBpbnN0ZWFkIG9mIHBkZXYtPnZwY2ktPm1zaSBpbg0KPj4gICBpbml0
X21zaSgpIHNpbmNlIHdlIG5lZWQgdGhhdCBldmVyeSBoYW5kbGVyIHJlYWxpemUgdGhhdCBtc2kg
aXMgTlVMTA0KPj4gICB3aGVuIG1zaSBpcyBmcmVlIGJ1dCBoYW5kbGVycyBhcmUgc3RpbGwgaW4g
dGhlcmUuDQo+IA0KPiBJbW8gdGhpcyBsYXR0ZXIgY2hhbmdlIHdvdWxkIGJldHRlciBoYXZlIGJl
ZW4gYSBzZXBhcmF0ZSBwYXRjaC4gSSdtIG5vdA0KPiBnb2luZyB0byBpbnNpc3QgdGhvdWdoIChh
bHNvIEkgcmVhbGx5IGNhbid0LCBmb3Igbm90IGJlaW5nIGEgbWFpbnRhaW5lcg0KPiBvZiB0aGlz
IGZpbGUpLg0KVGhhbmtzLiBJIFdpbGwgZG8gaWYgUm9nZXIgaGFzIHRoZSBzYW1lIG9waW5pb24u
DQoNCj4gDQo+PiBAQCAtMTkzLDYgKzIzNCw0MiBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBtYXNr
X3dyaXRlKA0KPj4gICAgICBtc2ktPm1hc2sgPSB2YWw7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRp
YyBpbnQgY2ZfY2hlY2sgY2xlYW51cF9tc2koY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+
PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArICAgIHVuc2lnbmVkIGludCBlbmQ7DQo+PiArICAg
IHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+dnBjaTsNCj4+ICsgICAgY29uc3QgdW5zaWduZWQg
aW50IG1zaV9wb3MgPSBwZGV2LT5tc2lfcG9zOw0KPj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQg
Y3RybCA9IG1zaV9jb250cm9sX3JlZyhtc2lfcG9zKTsNCj4+ICsNCj4+ICsgICAgaWYgKCAhbXNp
X3BvcyB8fCAhdnBjaS0+bXNpICkNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKw0KPj4gKyAg
ICBpZiAoIHZwY2ktPm1zaS0+bWFza2luZyApDQo+PiArICAgICAgICBlbmQgPSBtc2lfcGVuZGlu
Z19iaXRzX3JlZyhtc2lfcG9zLCB2cGNpLT5tc2ktPmFkZHJlc3M2NCk7DQo+PiArICAgIGVsc2UN
Cj4+ICsgICAgICAgIGVuZCA9IG1zaV9tYXNrX2JpdHNfcmVnKG1zaV9wb3MsIHZwY2ktPm1zaS0+
YWRkcmVzczY0KSAtIDI7DQo+IA0KPiBXaGF0J3MgdGhpcyAiLSAyIiBmb3I/IElmIHRoZXJlJ3Mg
bm8gbWFza2luZyBzdXBwb3J0LCB5b3Ugd2FudCB0byBjdXQgb2ZmDQo+IF9hdF8gdGhlIG1hc2sg
cmVnaXN0ZXIsIG5vdCAyIGJ5dGVzIGFoZWFkIG9mIGl0PyBKdXN0IGxpa2UgeW91IGN1dCBvZmYg
YXQNCj4gdGhlIHBlbmRpbmcgYml0cyByZWdpc3RlciB3aGVuIHRoZXJlIGlzIG1hc2tpbmcgc3Vw
cG9ydC4NCiItMiIgaGVyZSBpcyB0byBjdXQgdGhlIHJlc2VydmVkIDIgYnl0ZXMgb2YgTWVzc2Fn
ZSBEYXRhIGlmIHRoZXJlIGlzIG5vIG1hc2tpbmcgc3VwcG9ydC4NCg0KPiANCj4+ICsgICAgcmMg
PSB2cGNpX3JlbW92ZV9yZWdpc3RlcnModnBjaSwgY3RybCwgZW5kIC0gY3RybCk7DQo+PiArICAg
IGlmICggcmMgKQ0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICIlcGQgJXBwOiBm
YWlsIHRvIHJlbW92ZSBNU0kgaGFuZGxlcnMgcmM9JWRcbiIsDQo+PiArICAgICAgICAgICAgICAg
cGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgcmMpOw0KPj4gKw0KPj4gKyAgICBYRlJFRSh2cGNp
LT5tc2kpOw0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBUaGUgZHJpdmVyIG1heSBub3Qg
dHJhdmVyc2UgdGhlIGNhcGFiaWxpdHkgbGlzdCBhbmQgdGhpbmsgZGV2aWNlDQo+PiArICAgICAq
IHN1cHBvcnRzIE1TSSBieSBkZWZhdWx0LiBTbyBoZXJlIGxldCB0aGUgY29udHJvbCByZWdpc3Rl
ciBvZiBNU0kNCj4+ICsgICAgICogYmUgUmVhZC1Pbmx5IGlzIHRvIGVuc3VyZSBNU0kgZGlzYWJs
ZWQuDQo+PiArICAgICAqLw0KPj4gKyAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHZwY2ksIHZw
Y2lfaHdfcmVhZDE2LCBOVUxMLCBjdHJsLCAyLCBOVUxMKTsNCj4+ICsgICAgaWYgKCByYyApDQo+
PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBkICVwcDogZmFpbCB0byBhZGQgTVNJIGN0
cmwgaGFuZGxlciByYz0lZFxuIiwNCj4+ICsgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZw
ZGV2LT5zYmRmLCByYyk7DQo+IA0KPiBJbW8gdGhlIHVzZXMgb2YgWEVOTE9HX0VSUiBhbmQgWEVO
TE9HX1dBUk5JTkcgd2FudCB0byBjaGFuZ2UgcGxhY2VzLiBUaGUgbGF0dGVyDQo+IGlzIGV4dHJl
bWVseSBsaWtlbHkgdG8gYmUgYSBmb2xsb3ctb24gZmFpbHVyZSBmcm9tIHRoZSBmaXJzdCBvbmUg
ZmFpbGluZy4gUGx1cw0KPiB0aGUgbGF0dGVyIGZhaWxpbmcgaXMgY292ZXJlZCBieSB3aGF0IHlv
dSBhZGQgdG8gY29udHJvbF9yZWFkKCkuIFdoaWNoIGxlYXZlcw0KPiBhcyB0aGUgb25seSBjYXNl
IHdoZXJlIHRoaXMgaXMgcmVhbGx5IGFuIGVycm9yIChhbmQgWEVOTE9HX0VSUiBtaWdodCB0aGVu
IGJlDQo+IHdhcnJhbnRlZCBpbiBib3RoIHBsYWNlcykgaWYgdGhlIGZvcm1lciBzdWNjZWVkcyBh
bmQgb25seSB0aGUgbGF0dGVyIGZhaWxzLg0KPiANCj4gSG1tLCB0aGVuIGFnYWluIHZwY2lfaW5p
dF9jYXBhYmlsaXRpZXMoKSB3b3VsZCB0b28gaXNzdWUgYW4gZXJyb3IgbWVzc2FnZSBpbg0KPiB0
aGF0IGNhc2UuIFBlcmhhcHMga2VlcCBhcyBpcyB0aGVuLg0KSSBhbSB0aGlua2luZyBtYXliZSBJ
IG5lZWQgdG8gYWRkIGEgY2hlY2sgdGhhdCAiaWYgKCByYyA9PSAtRUVYSVNUICkgcmV0dXJuIDA7
IiBoZXJlLg0KU2luY2UgaW4gdGhhdCBjYXNlLCB0aGUgZmFpbHVyZSBpcyBiZWNhdXNlIHZwY2lf
cmVtb3ZlX3JlZ2lzdGVyIGZhaWxzIHRvIHJlbW92ZSBjb250cm9sIGhhbmRsZXIgYW5kIGl0IGNh
biBkbyB0aGUgc2FtZSB0aGluZyB3ZSBuZWVkIGhlcmUsIHNvIHNob3VsZCByZXR1cm4gc3VjY2Vz
cy4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=


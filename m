Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513CABCF0A4
	for <lists+xen-devel@lfdr.de>; Sat, 11 Oct 2025 08:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141387.1475817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7TLm-0006Ub-AS; Sat, 11 Oct 2025 06:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141387.1475817; Sat, 11 Oct 2025 06:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7TLm-0006SH-75; Sat, 11 Oct 2025 06:45:06 +0000
Received: by outflank-mailman (input) for mailman id 1141387;
 Sat, 11 Oct 2025 06:45:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Aqd=4U=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v7TLk-0006SB-G3
 for xen-devel@lists.xenproject.org; Sat, 11 Oct 2025 06:45:04 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf64b14d-a66d-11f0-9809-7dc792cee155;
 Sat, 11 Oct 2025 08:45:01 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.10; Sat, 11 Oct 2025 06:44:56 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%3]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 06:44:56 +0000
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
X-Inumbo-ID: cf64b14d-a66d-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZum0C5rBqQ1A2UE+JPI6ye8WJmlKzj0KBj1aSFiX5907Z17VsA8W30fniC8o9TYROjv2lqy8RdXdrXbzSWwGx4qPGhrYD7gf93WH3iziTGBguUTMuAjTM0awwC+OENzwMblGgBnCboGkOr7kmWuK9K8o+m2XQFWmEE3ume16kHj5uqXbhfgodInA2nt8hJbKTBxukuThJy9A6ZRvvhzn1qVc1MZ7ml1YNHywIWhdmT5KOTbECqdCNiVK1CJ251OfXbL/Q06hjCuWmL5S973fV+2cRCGNTSuiPK8NEqDEAoZeSQeAZfaxzNeT1JzxFTIpqbNml17XJcW3rD+HyiTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afz391nsnA4VwQeebJ/eQISZMTKzPV8PBOyAXsjYIvo=;
 b=VZ6vQb9hKOz0beKh5VplQsIqgJYgfTwdQ2/qLW753d9WDmJj5YECaINVLCidantkO5vgAHXwvmbaFjV/XRaekdCTL1Py3qBvUjgDUS1ame0ZmtDUzthvDoY57LpL00wisFti9zkTV1tiZGRuz9Od8oSfagcgzqdjsYjN1mKJXcl1Mfm3AMNkq+yiUIr8SKaEVMZWxXz1shGB+C1t/p5v0JlMmPSZMeoNbXVA/hf/qluDFcl9N1a8yX3ghm8jW1D0Mun2nE9sWDTyLkvfhKwGFAaMyIdQSQjfrhe9HfLLsI8vqubHEiPZBE8Ah9HoTamIeSFY6pSVYBFZOMxK+LfriA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afz391nsnA4VwQeebJ/eQISZMTKzPV8PBOyAXsjYIvo=;
 b=1M9EXGk81WWpDb6TTKwtG7q97xO2HBHWyvesaa299O6Bd0kN1h4+14XqVMWqwkpvBB6x24WtHKd+feSIUihONiNHBBuXTXxrcIgf3vqq80jW+mfpYO0q6FyjiJcyWCLcqSPF3hIEDaqPMvz8j8pNqLtfWYZ+QDuVpgaO4BQo1pI=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 24/26] xen/domctl: wrap arch-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 24/26] xen/domctl: wrap arch-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcIiYjKV/PcPIAQEuJ6TZ/Q8rQNrSN9F6AgC6RCYA=
Date: Sat, 11 Oct 2025 06:44:56 +0000
Message-ID:
 <DM4PR12MB845153811FA7748CA058EB9AE1ECA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-25-Penny.Zheng@amd.com>
 <56024eb0-b30f-43fd-84b7-6070a1d79cf0@suse.com>
In-Reply-To: <56024eb0-b30f-43fd-84b7-6070a1d79cf0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-10-11T06:44:33.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB6413:EE_
x-ms-office365-filtering-correlation-id: 27b6bc8b-9f23-4189-0351-08de0891b0fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dE1ZL2p1U0xGMFAyWlNKZXdXaS9EcjB1VVYyaWVKZ1dYcm5BNjRUdjI4Q1dy?=
 =?utf-8?B?NGluOTh1a3NHcmNMMTNxbE5BdDJxc0RlQnBiampKQTVHaUMyOEx6UlZER2Nk?=
 =?utf-8?B?cURmemI2N21NNHZWeE5ramFyamRrL0M2MUhKNWlHSXpOcGhPOWp2QUNGQTh5?=
 =?utf-8?B?dDlacHJKbnNIR2FLb1haZ3pveks3b1pleDJyam51MXdVV3M5WmlRNm5RdEdS?=
 =?utf-8?B?UEFxMlFVWEF6amZTNkJMMU9YejRaNmhPcGVHVDMwYUNnS1dzZEJCNFV3TWJD?=
 =?utf-8?B?VGZuUHVFcTBmYlF1T3NpRytzcGlSNzdYQzdkTW9ERTE3YW4xQUhBWVlMUnVC?=
 =?utf-8?B?OFJZMTF5emVrbTM3d05TQ1BodG05UzlObGVWY1lFMmdST3I4Z2U5RFB4YWww?=
 =?utf-8?B?ODRPUlNHMm1LeUwrbFhhOFpPTDMvQjRFRlAybmd0SXJKY2pkd1VkMFVHQWph?=
 =?utf-8?B?c2xhYkpvYVRSWi9RK3lZUWdMMHlUZ1RvSDNUZjdWbEZzazYzUnVINS8ra01T?=
 =?utf-8?B?S1dkZS9ZRllCaS83bk9aMU1WejhMeUkxQ0RsbGtBSE9FVTVZaHlzV3BzOVVl?=
 =?utf-8?B?bkg5SjNBdENlaGp5MCtuUHlpZ2N1UHpibHUzNGhmS0ZDTklORWRMUXdrWTI0?=
 =?utf-8?B?S3R6Ujd2c21aS2tIcVZpNUo4ajl5bGlseHB3bkhNV0RrMS9LeW8yUEhzQ3Vs?=
 =?utf-8?B?TzBPTmdiVEJDUU9CVWZsMUo4RVkrLzF0UllWcHFlQ1ROTTVjQzVCQ0FVRFRJ?=
 =?utf-8?B?c2NCcFExM0x0SW5vYW9VMGRrTVFDVDJzc1hZRFZTNnkxOVFnVmNIUWRxYnd3?=
 =?utf-8?B?Zk00d1k0ZE9uZlY2S0dwZzFmcXJKN3JCYUpUMm5jeHlkWnhsdW5IQ00xMytn?=
 =?utf-8?B?UTcxTG43YkVkMGpoNHR6NDIvTUcxeXdnRHBGSzRsM0RjRUx1YjFEeER0aFU5?=
 =?utf-8?B?dVZBbUFHVlhvK2R6bm9XVWVKMmI2ZkVoSlhOYlNHUmxGZmt6d2tHMWlnZDBq?=
 =?utf-8?B?c3ZEMndDajBGNUJkU0w2VVU1ekFsT0VNNmlnVVJmd2ZnbnRyTXhGWklVZ0l3?=
 =?utf-8?B?cnJhS3RGcDB4dFNENks3QkwydWNXcW5IUi80Mi83dVhWT0ZXR0ZTZi9TbnNh?=
 =?utf-8?B?REkzSEh3YnhnOUFzUFVaN2J2ZzRYeWpxR0QrOVVnQ2MrZFNhVm8yK0JERklq?=
 =?utf-8?B?R2dHeGVnS3ZaMzVJMXduaEE0SHdNejhWNnlIY3RJeE5zY3YzTDdReDNiaDdY?=
 =?utf-8?B?cXRsejljSjNQRFI0bG0raEd3UndSNWlKeHE4a3VHUmE3Q3dtckMyRFV3WVZE?=
 =?utf-8?B?MW1WV1VyTmY3Yzc2OWZOaTNGMEZmbUY5aElKSFhDRFczc1UrQk5kWm9UNFJt?=
 =?utf-8?B?a1JGaFNySDZ2bzkwQjVRbVlKRE5MTDBEYlJxMHROM0MrUTdZQWpSK0g0VzBk?=
 =?utf-8?B?L1NubzJTeEk2YWE0aEpNNDJKYTdMUDkrK3o5ZnV4a2w1N1hmcUdGeTUxeUNS?=
 =?utf-8?B?SEc4SmtKTy9UUk5OVE9ROHVuenRSVkZ3MDliVlBmZ0luenpTdkRXZkZqU0hu?=
 =?utf-8?B?YWF4T2pBRHhJdUp3dytWWG9zaThhNUNVRFJPa2VodmJNNHFqaDNNZnplZU5W?=
 =?utf-8?B?d1FtNnMzOE1wVnhVMStwR2lRVSs0RlBsYmVxL1hBTVRUS3EwYXp5MldmRUtY?=
 =?utf-8?B?YWNiUThwbGQwbUZoZE4zalBKWFVjbFFmNnczQ1pueUxKOXB5R3JLYzhGTEl3?=
 =?utf-8?B?NnE5RS93UmJDS3B0Z01HUDFid0Z1aWZnWVJSbXp6dkVhb1RkMlo1TkRRU1ZW?=
 =?utf-8?B?L1VDZExTR3liWmEwTXNlK1JVYms1YjBPTmRPOUVqY2RkUXFXMmY4YmQ1em4v?=
 =?utf-8?B?R2tKeWZhaDNsbU41RGo1SXAydVIrVStDU1hMUVh2S21kRnVRLzA3M0doeE9T?=
 =?utf-8?B?bWswS2NiNW1nYjRFTUFRcTFJcC9sOUpoNWYzaFlhd0FpWHQxeFg3OW12MTVk?=
 =?utf-8?B?eWc3aFpEUXNzbG1oM1NvZS9LWE9UYXVFY2lRekVqbFA3UHoxK3dUcEs0NHFO?=
 =?utf-8?Q?ZxQ41v?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1BMeU05OHp6anFMYmp5VE9HMGtVQnJxMHR4WGNacFFielNCZzVVWXFCbzNl?=
 =?utf-8?B?S3hJd1BCN1VyUWdsYTkzYk1HNFc4Nk9CRTNrTDJ3SXBVc2tuZGpFVDVEb0JC?=
 =?utf-8?B?SjMwYUt1SzRHTWYvZ0swVnp2M1F0RUZ0K3ZBME9YYjduT1AwMUh0OWpZT2U0?=
 =?utf-8?B?OVlVaHFmcFBkWVFtaXVVVW9tbW1leFZvY1JsWldmbCtSeFhtcGQySzFwM21x?=
 =?utf-8?B?cTludmNuOWhLSEdYclZFMytDMkJoZGI0TGZ1ZFdCVmUwY3ppY0dMTlczWDZu?=
 =?utf-8?B?QVFaZTlCOWtad3lvS0hneldhNlR5T0thOVVZT1RyVjlFbHEzUjRBRXJSbDJu?=
 =?utf-8?B?UmEwN3NvR2JPQ0dyRGY2cUpqdS8yQUQwcG92VTROQ1BZTEhSbDBrYTJuS3Bs?=
 =?utf-8?B?YldZVHd0T0xhWVI0amZUalpXWnRkb3lHTDlPcGZTd0RvcGRBUkV0Mmp3OTdl?=
 =?utf-8?B?WC9qclJtTGpVNWdxOUp3aGE2bXdxMUtDMGpPTWxsTWovZ3ZaNStQbWg0aGw5?=
 =?utf-8?B?STREbGJYTVVBZnAyMk0zYjBWUGl0N3ZwcTdPMEJEc3J5QStnZlU4YjhZV29I?=
 =?utf-8?B?cVJuSERiVTMrNjV4S2x2bVBNR1ExN1Zyd3hVZUYxRDYzN3NhdVBmWEFlM3lU?=
 =?utf-8?B?citwT2tOenpFSHZEcUdodWtNRXIvd3RqY2svYlJSaDVHOXBGTDYxdGRtVFZv?=
 =?utf-8?B?c2ZHelhBVTJieUZUeHlIT2xCUjBQUk5PL2FpSHNKdnhnRnZKN2dacjdwU0tx?=
 =?utf-8?B?UTl2ZGQrbkpKWnBQVzdoeXlBbTFGSzNnUEhRejdqejJDelVxbzR6VXdmQzhZ?=
 =?utf-8?B?N05VWXBCcUNIMEtHRjFqdlhkQUE4OURRenE4dm1UNDIyUnpuM21NOVg0YWZ2?=
 =?utf-8?B?WjJDakZBV0I5dHpDNjVrazhnOHp5cW1Mb3ZrYS80ZURsY21sd2RHTDVPa3lB?=
 =?utf-8?B?NzRHUmRYcm5qRkhoMUU4bDR0d1h5M0szaW9VbVlpMHNVZy8wdUpyZEdFUFZ0?=
 =?utf-8?B?am11SHBWeUlrY1o5L0RVOURQeXZFNVlEbkE0bW5pT1VCcGF6Wks5T3A5RFh0?=
 =?utf-8?B?b2RVQlVnT2Vrc3pFSGZta0dZQU1oRTMyWU5FYktIZFM1c0kzQ2Y4N3NJWmpm?=
 =?utf-8?B?Si9Qb1F5QlltY2wzTjJzRmgwcUJIc1V1dE9GeW1IMWNXVDlzQmt2TUlKNXVV?=
 =?utf-8?B?eFkzZzBsd1RBNVZXM2JDcDcvR3VwTWl6aXpOeHZyZjNJSVhSTEJKdmFNcU05?=
 =?utf-8?B?Ykpzc0JkTlR5LzBVeHBleXVqem04RndpRTZmK2pmREk2aFJNblFGWEsvampk?=
 =?utf-8?B?UjEvemMxOFh3TlhoNitiU09EbkNyWEFBS3gxYU5Bb1NYNnlyb09OZHdQMWhk?=
 =?utf-8?B?UTlzRWtyWXlLSmpqR1NOa0d6UkhpM3lFelZLWjEzZ2d4aG5ONEpXTWYwL0Y5?=
 =?utf-8?B?M3gvYkZMOXFLVEtrTldUZzM2VWZpRTVsTmlpcmRlbXQyOW5QUm85R1NBZzEz?=
 =?utf-8?B?MHl6aTQ3UllLN1paTGt6QzdWU2tVeVFLSWt4cVY1VEFvdW8zUWdKM2ZxWlVV?=
 =?utf-8?B?cTd0anl5NkZLdXQ5eVZPaVErbnYvR2lYSDZOR3hNeTlJNVhUeVV2MzJQTGtv?=
 =?utf-8?B?YnZQVGZBRVNTOUpxTWp6a1JLU2ZBMWZHOW54bms1Tm1neW1oenpOSUs1RVlH?=
 =?utf-8?B?UGVTdDdFbXB3NHBhTWZZc0szWnpPN1dobWNCdy9FbHZ0c2NwVmFCaGUyVXBD?=
 =?utf-8?B?d2JFQnFLNldUdzRvUk8yY3o2bkZsOWl3eDl4MjFySS81QzBuRll3TFRnMmVD?=
 =?utf-8?B?djNac3RvMGMyUGwzVGwwWXF2dkYxZzhGUHdoZUQ1SktEM081RSsvNWljNy90?=
 =?utf-8?B?RmFZMWNvSDNBMHZYUk1MSHd2ZjgrOW5pcVJjN05YR0VtUmNlcGRHWEpPSlB3?=
 =?utf-8?B?TkFLb1VIQmtVNW1SMHhMSDYzZHVQL3dwT0s1TG1wQ0xybk9pc3dFbWR2MWRD?=
 =?utf-8?B?YytTd0JGZVBHeFBNODF2RUVYVlFYQWtHRkJ2WURUK0tyOFNkOWg2WG93UkIx?=
 =?utf-8?B?N1RiNWlPWTFvR3VraFY0czdiV3RCcmZKTFpNY3UweGx6Q3pqY1ZtSEx2Zm5U?=
 =?utf-8?Q?IiXE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b6bc8b-9f23-4189-0351-08de0891b0fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2025 06:44:56.5127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rcRTj7da5AL7ZtPtV0n2ZMX3oKE0HYoATtO36Mf1P5rTAbswSaJTe2LxcPOHtIzGCNmugkCsIUFjhH3vHGymgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6413

W1B1YmxpY10NCg0KSGksDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4gSnVzdCBjb21lIGJh
Y2sgZnJvbSBuYXRpb25hbCBob2xpZGF5Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciAxMSwgMjAyNSA5OjAzIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55
LnpoZW5nQGFtZC5jb20+DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFu
ZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5P
cnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyDQo+IFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsNCj4gQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVp
c0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPjsgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsNCj4gRGFuaWVsIFAu
IFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDI0LzI2XSB4ZW4vZG9t
Y3RsOiB3cmFwIGFyY2gtc3BlY2lmaWMgZG9tY3RsLW9wIHdpdGgNCj4gQ09ORklHX01HTVRfSFlQ
RVJDQUxMUw0KPg0KPiA+IC0tLSBhL3hlbi9saWIveDg2L01ha2VmaWxlDQo+ID4gKysrIGIveGVu
L2xpYi94ODYvTWFrZWZpbGUNCj4gPiBAQCAtMSwzICsxLDMgQEANCj4gPiAgb2JqLXkgKz0gY3B1
aWQubw0KPiA+ICBvYmoteSArPSBtc3Iubw0KPiA+IC1vYmoteSArPSBwb2xpY3kubw0KPiA+ICtv
YmotJChDT05GSUdfTUdNVF9IWVBFUkNBTExTKSArPSBwb2xpY3kubw0KPg0KPiBGYWlyIHBhcnRz
IG9mIGNwdWlkLmMgYWxzbyBiZWNvbWUgdW5yZWFjaGFibGUuIEFuZCBhbGwgb2YgbXNyLmMgYWZh
aWNzLg0KPg0KDQpJIGp1c3QgZm91bmQgdGhhdCB0aGUgZnVuY3Rpb25zIGRlZmluZWQgaGVyZSwg
YXMgaGVscGVycy9saWJyYXJpZXMsIGFyZSB1c2VkIGluIHRvb2xzL2xpYnMvZ3Vlc3QveGdfY3B1
aWRfeDg2LmMgdG9vLiBFbW1tLCB0byBtYWtlIGNvbXBpbGVyIGhhcHB5LCBJIHN0aWxsIG5lZWQg
dG8gcHJvdmlkZSBzdHVicyBmb3IgdGhlbSB3aGVuIE1HTVRfSFlQRVJDQUxMUz1uLiBPciBhbnkg
YmV0dGVyIHN1Z2dlc3Rpb24/DQoNCj4gSmFuDQo=


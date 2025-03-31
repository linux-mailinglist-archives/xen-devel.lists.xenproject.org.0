Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54353A76333
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 11:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932289.1334448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzBV9-0006dB-Ld; Mon, 31 Mar 2025 09:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932289.1334448; Mon, 31 Mar 2025 09:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzBV9-0006aF-Ig; Mon, 31 Mar 2025 09:32:15 +0000
Received: by outflank-mailman (input) for mailman id 932289;
 Mon, 31 Mar 2025 09:32:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+FP=WS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tzBV8-0006a9-7E
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 09:32:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2413::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02f9aef3-0e13-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 11:32:07 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ1PR12MB6193.namprd12.prod.outlook.com (2603:10b6:a03:459::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 09:32:03 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 09:32:03 +0000
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
X-Inumbo-ID: 02f9aef3-0e13-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNtfbIp15Vh+mjLibTDJfw116JCDyCxSZgYJ/a5bH2U13gEGcrGv5rq+3y++sVtE5G72EMRGDOS4/7IwWsEg5mm2ebCL5c/FsYtc69HC46rDFFcawduM1eYLCUqGUhdORwAjATRjsxcqQr+3Qzzq07L7MdmLmMfmcMQJ0S8JQ5hj0/edtnp3iAbPAUU4Z5aHXfvuSmvEac6fA6iOZ83ZDJwYkqDcDT2tVYMwl5ngbT/8OxRSLLmTCp8QGOQErdsDPbgqG1kZaUStieLKkt2eUWgzibAqg21csIjY7IjpVDQ2SxipjK6OyF/LXpzbNAZxOcejte/AERM0hxXczzCu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXDaiXj9AidEvHHZ88Stk0XA8gf07TpaVfEjCLqjMp8=;
 b=D/5VhZXMthJaSDvvKH/eDJ82V4gXAweu+22cWroGKKR7j6E4qFTPPjsA73UlwCCJzUoimGkxqwPLcbxcEiHAUd2XKNsrrnkXLVRKli7UNI4z1g9NFpbYWKpv2yGthuqdioGMUxzJeUewpGaRa16c6h5FY2HuQ3gIuP88LaMMjxVd7+qWyz5uPsqFsJwk+1NUrDIyu/b+ZNeXWZbBXH2/OmbaDdivQzFFmzgdIT2c+oLyxRjc7unP7UoTGueCkufeNE0H+KhfW0C3RwCzZX0JTgyVna4JDMc+VPTtA7erckkngz4HOFK9uEJe80kjbUxSTYk/UGCBnpsBs+Dua7Pa8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXDaiXj9AidEvHHZ88Stk0XA8gf07TpaVfEjCLqjMp8=;
 b=txa26SMFegBHHt5Zvtr37JgwqoA0Ao8LBHWtWxvr6iSMFy1mO2/JSvikXWC2UvmwCXFdgwuzmc797AfPi9/t6yat8mtgWU7zXDsIz3VnnViN6i93lIs4oA4R43D1gD590OkI4eL0c8KIHoYuDrlZGn0oAXqlsJ/jwNbCpbiEWv0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
Thread-Topic: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
Thread-Index: AQHbnup9DfRmpRg4a0apmzEwGKAL0LOGtpyAgAamp4D//5bVAIAAjtkA
Date: Mon, 31 Mar 2025 09:32:02 +0000
Message-ID:
 <BL1PR12MB5849783E854628DC49F9A609E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <Z-UZm5sTIz4nOt4-@macbook.local>
 <BL1PR12MB5849F1134D9E51E6A0F7B4A7E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z-pVrGLZTCk1ZXb1@macbook.local>
In-Reply-To: <Z-pVrGLZTCk1ZXb1@macbook.local>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ1PR12MB6193:EE_
x-ms-office365-filtering-correlation-id: 99ccd438-98e1-4f44-d5fe-08dd7036e515
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGxRT20zdGlpM21aUlZKaEh4Zi9CblpmU1d4dkhHMk02RGlaQ2d6RDF0Tk1p?=
 =?utf-8?B?S1I4MGtnaE5KMkpmYlU5ejRaTmNJblMvcGhpMkVUV011cHhmS25QbC9KMkFn?=
 =?utf-8?B?RndCeHZ2cmFBbHR0L1Fad2xST3Q5TDlMdEJMMXF1MTZBSjkrWnlIMm5nOXpH?=
 =?utf-8?B?TXgvZEdPOWp0RlU5K3lHTnpJc2txa0puU0lRV25sNmZVbmZtWFB0bUZENXE4?=
 =?utf-8?B?NEdJRUI5ZmVnRmxrSk5DaXF1eSs1RHBONWNjdkJYNDNFaGJnZkpFYWVlYlIw?=
 =?utf-8?B?Vm9DL0lydmVCMGVrWm5BaERXWnh3UkFFQmtlc21pdllkSEk5Y0Jmck93WDg2?=
 =?utf-8?B?OWF3aGVjL1FsYUlsbjNKcjRMWDhFN0tTekdnMUYvN3NWSXpTZ0VKSC9zN0Ny?=
 =?utf-8?B?amJNK3hkR3I0ZXVxZEcwNStwZ2VLWVZpSk94Nk5QVzh5a1ZKSVVyQWVvQTdk?=
 =?utf-8?B?QWlkRnRkY1VyZXJSM25yZXZBMHg2cUpOZEdoaGlMU01pU1p0QURUQ3hMa3F2?=
 =?utf-8?B?Yi9TTEtmbFZENlA3WU1BZDUwa05NZEZMRmJLOEM5Y29icGJVc2NMbTFub1Jw?=
 =?utf-8?B?SGQzWDU1ZVZsZDRVcUcwaXVlZ3J2K25Ia3c1dTJlUStYeGJNbEpmOGZ5bktK?=
 =?utf-8?B?RVExbGlnaFlnWE5JZlpkU0pPSTlhNlRORytWcWNvZ1VZUCttQXRHWWs5cGNU?=
 =?utf-8?B?RUJyMFcyMUNjZE1XYzQvRUxKa3ZKZjc4RHNhdDlrcFM1aG82NXFpV2xoZzFK?=
 =?utf-8?B?Nldqb3lYdWE3dDdZRExUKytDaHpJc2ttTXlsTi80bVpXVGFuYkVRZklXTEtw?=
 =?utf-8?B?V3FHb1I2YStpMGlxK0gvRHdXVTRhaUxidEFNNUc0U2JEVUlhVUU4ZzJsZjh4?=
 =?utf-8?B?dTBuSTY1QVU0NHhLVlZldXp3akZtbE92OUlsRmxIcUp1eFYzZmpLaDJKTzdn?=
 =?utf-8?B?L2RmMWkxcU1VRUNYeWZhVjg4SFZ0c3daTkxCaGk0VWFWL0MzcTJPdzArQWF1?=
 =?utf-8?B?aWxiZEIzQ2MrWlZmYVVIbUJDRmovTEMwU0JMMndDZTZLRzVKT0NUak0xWDhK?=
 =?utf-8?B?eGVyakxNT3h0YWhnT0I0WmFSNDhQZ2NsZlh5Vi85U283WDczRmZlQy84bDhI?=
 =?utf-8?B?NEhRUHNVNUtUcXl5R0JEblhKcGw4djdZK25CN0pCV1MwSWMwZ254VGM0VVI2?=
 =?utf-8?B?Tm1td3ZjVldLOFBLZ2duVG9rZnk4dk53WGR3UnNpTUMrVi8weHhlYlFDMWoy?=
 =?utf-8?B?Sy82dDBYYzYvd0lvME1JMjcvSDhFRkpCNEtIZ1Ywc05mOHlYWEgvNjRlSFds?=
 =?utf-8?B?KzRvY1lnTXFHUWxGR3R0enJHY1E5TXN6LzRubTJ2WUhlY3J3MmRjdGtzVTcr?=
 =?utf-8?B?WnlUK1JDV1MrS0sxb21ML3RuWVBkUmRtd2JHc3phdDVXSlk3REZ2MGJQZVdP?=
 =?utf-8?B?eDJXYjEvV1JPWFdDNXRHWVNwckFLdndzUGlkQk9neFpXMmkwSjJJWXJDeVJ0?=
 =?utf-8?B?ai9qemVDdUZXWENmYTZ0K0ZZTnp5aVdVbm92bFg2YkJrbWRyajE5Rkp1SUxN?=
 =?utf-8?B?TE1JRG1DK2xyOURkeUNoeGpLdjRJMWZwNEhoKzl6bXllSkQ0Y2hkVzV2Sy8v?=
 =?utf-8?B?SXpQa1drZ2JvSVZ0Qy9RTUF5M1pJcUphTVJ6bDNYSW9CSlZpcm9UazlXc29H?=
 =?utf-8?B?SkRaRU5zUURTNElFVDFFTGJ5MzVmTUwwS1pmUmpJQ0dxWkhwMDNTUHBaQm5W?=
 =?utf-8?B?aE04c3E5WU9MNmpCYmJLc1BoR2p1L3gycEYxM2M1Z1R1NXovRngwU1c4Qkxy?=
 =?utf-8?B?ZnRpdmhtU2lRYkNmSVFEdHpHcWpvc1hXYlFJclpiTW10dVBZZ001SS9YSlJt?=
 =?utf-8?B?SlBUVlRlVWlLTFdpdkJtaXdEYm5SMmVKOGFXVVNsNjd3ZXBpWDJoOEE5Tlk4?=
 =?utf-8?Q?wxm/5J93FbRDNoRLbyd++XtqEc25T4KW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWFKdWdvc0VGcVpoc04vdlpOVUp5RkRrd3BUajFvdUN5Z3o1QnUvcnRUNEIz?=
 =?utf-8?B?MW5mSmxiaHY0ZEVYbnE1RWdFZTdZSWdKa0dSMVZrUEtyRDR2UUdtLzE1cDhC?=
 =?utf-8?B?dlRhQVBMZlJLZFZtaC8zY3NLbkhWbW9QMkZ4U3QvTWxjS0JkN2xrVnRJM3Nn?=
 =?utf-8?B?MndlK3gzOGVVb2p0TjU0TzF1UzEyQXVWckgwYlRBM2owU1ZiMmVyemtJdnFk?=
 =?utf-8?B?VVc1QVBMUDF0WTJSKytrNDBISnFVWlBtVm5WZ0d2NEsrSThnRWdveG9xUVdo?=
 =?utf-8?B?eFFzbUpzOXA4SUgrM0p6czlVQ3I3cHV1bGlWZ29MaDZ6cEN5N0VTUFNNYUdr?=
 =?utf-8?B?Wm1taVg2SWZTaXdDdFE4L1FuWCtuRWRFaCtxSk9GRGthOEVOQU8vbTFJd21s?=
 =?utf-8?B?VmlhdGtPS1h2d1hOZGk1Snp2eU5VazlucEY4V2xhR25OQzAvOEo1ZDlaRmJ5?=
 =?utf-8?B?YTA3aEd3S0xwTFYwL000NzhiV0VzVHhsVFlUSVBiR1QzRFhSQnF2OVltUmRp?=
 =?utf-8?B?Ykg1bi9wQTFiWVFuWkxrUER6cVVMYjh2REM3OVFiR2s3NnNJWjg5dkNRRDVH?=
 =?utf-8?B?Vk8veGpIWGczcDhqblZOUmRLVFgwVzJLRFM3Y0k1ZXZPZlpqMWhxOVhsNktP?=
 =?utf-8?B?dTRabHRVTTh4M3dudUpwRHJaZmJLL3hyYS9aOENUS1huVVZnd0EzV1N1cEFj?=
 =?utf-8?B?YkZ5bG5WN3Bwb1BLMGd1Z2tiWlFjMEd1OXk0aGxKQWp3ek41S08vVFBGZW0y?=
 =?utf-8?B?eWZEbzNjUURmOXJFdXdObHNQcWZPeHM4d2loRm56UTQrUjUxSHVDQkx1VkM0?=
 =?utf-8?B?M21RMG8vTGNvVk1pQ1JyYzJid3hqODBoek9DTnBzNHFMaTFwbG1tNDlQWC9u?=
 =?utf-8?B?d25VRVJlTU9LUm1wN1NONTJlUDlnMWdWN3loT3FqMWFtcGpHZ3V0WWQ5T3ZC?=
 =?utf-8?B?R0NMbGs2WGVzZFY3WE9wNnJkSnFwWEQ4eDJEWlNEWmUvak5mVnJEZVAxTk9i?=
 =?utf-8?B?WjR2ekwzYVRNOUFGaXhBbndwV3NjdURxTEdYdy9NdDArTGFQdjJMdjBLbW8y?=
 =?utf-8?B?NTBUcjd1dnBEeDdlc2ErYklFQU1oT2pSUUZFQjEyN0U0RkMxQTA2Y2hiRXZY?=
 =?utf-8?B?cGZucEgzMDhBR0lvODNReUhjSU54SGt6bE9pTG1UdXRNTFlZSnZleHBvTlZl?=
 =?utf-8?B?TWthdGQ3WGM0a3BBSC9FWUc4bXpOZC8xWmJ6Y1hhM1pyVEo2SFEwWlpDZVdF?=
 =?utf-8?B?ek90WHdnNVdtYjhaamhWNGJ5QzBpNytCZnhhOWlyeUo2SGpBaE0yb2NlUlZw?=
 =?utf-8?B?KzZnb0NRZkRZSXk1dmFxa3k4WDZEaTA4c2pqQW9jSHdJdnREeFg0a0JEbDRn?=
 =?utf-8?B?QTU2SVpsWGF6T2J5Q2lCRlZzVFN0U2tnR1lEa0gwN0N6VTFGVjJJVnhyUzZx?=
 =?utf-8?B?ZFhlSkRjdStQUWdrS0VBckRCTlhEUHQ2Tk9tRFB2YjcydklXd1FJS25mSitw?=
 =?utf-8?B?Z3ZyY1FKaXBZZEdFSWptZXd5MWg3aC9DTS9lS1JrSTROQ1lPdkFlakdpMUNI?=
 =?utf-8?B?cUtCWTRwbGhGRDREMG9KNzhwdjFBM3Z5cThRdkxCU0NjU1czL1IxWnJBaURU?=
 =?utf-8?B?VVJETmpFMFVwQURUTnRTdW1nTFlibFNrazYyaDNzTkNJbTdYRm5lUUxIK2JJ?=
 =?utf-8?B?eDlmL3hrbExBTXVOU242SGlWUHpXS2QwVm52U3c4Wm14Z215RmVORmVvaWtU?=
 =?utf-8?B?NjBQbDVKT2xkbjhhVGtmUDhnYnIrZmNJMFk3RjRXcGNCRytjc013UGtBNFR3?=
 =?utf-8?B?N3A1cTYvdTNhS01hVVVGNHlOdFdGM2xWV0JnTzVhRjN2V284YXBVeEloclFG?=
 =?utf-8?B?N3VXbHIxTmtkc0RLT1dNU1d5UmRzZXF2ck9RT1VES21hVE9vd2laTzIwKzlv?=
 =?utf-8?B?R2s5c2xaSmVTcFp4Si9GQWtqTGhSMDg4RnB3MU9HWTJUcDd3M21IVGM1YlV3?=
 =?utf-8?B?Y3pKQ1o4a0F6aXJCVmErZXVUTU5VeUtWSVZvWGc3UUNGNlBydGV5d293YVVi?=
 =?utf-8?B?bzQ4cDNwaGh0TkxkZGl6TWY3UkdMVWJ4andHTEFsRmdJbGxYZm9QTGJDNzZ3?=
 =?utf-8?Q?FfQ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53D4FEAA38E13C42976404ED499C13B7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ccd438-98e1-4f44-d5fe-08dd7036e515
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 09:32:03.0278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdKc925OPQLl2a+JcrtKbeoc9ICTKfH4Z/wh8aucPHscUR38A7DOso6nlEe7egOa86HDEJ8qJy+CX2KQ6Mi/og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6193

T24gMjAyNS8zLzMxIDE2OjQzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIE1h
ciAzMSwgMjAyNSBhdCAwNzoyNjoyMEFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBP
biAyMDI1LzMvMjcgMTc6MjUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gVGh1LCBN
YXIgMjcsIDIwMjUgYXQgMDM6MzI6MTJQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6IA0KPj4+
PiAgI2VuZGlmIC8qIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUICovDQo+Pj4+ICANCj4+
Pj4gK3N0YXRpYyBpbnQgdnBjaV9pbml0X2NhcF93aXRoX3ByaW9yaXR5KHN0cnVjdCBwY2lfZGV2
ICpwZGV2LA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqcHJpb3JpdHkpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgZm9yICggdW5zaWduZWQgaW50
IGkgPSAwOyBpIDwgTlVNX1ZQQ0lfSU5JVDsgaSsrICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAg
ICAgIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90ICpjYXBhYmlsaXR5ID0gX19zdGFydF92cGNpX2Fy
cmF5W2ldOw0KPj4+PiArICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgY2FwX2lkID0gY2FwYWJp
bGl0eS0+aWQ7DQo+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBwb3M7DQo+Pj4+ICsgICAgICAg
IGludCByYzsNCj4+Pj4gKw0KPj4+PiArICAgICAgICBpZiAoICooY2FwYWJpbGl0eS0+cHJpb3Jp
dHkpICE9ICpwcmlvcml0eSApDQo+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4gKw0K
Pj4+PiArICAgICAgICBpZiAoICFjYXBhYmlsaXR5LT5pc19leHQgKQ0KPj4+PiArICAgICAgICAg
ICAgcG9zID0gcGNpX2ZpbmRfY2FwX29mZnNldChwZGV2LT5zYmRmLCBjYXBfaWQpOw0KPj4+PiAr
ICAgICAgICBlbHNlDQo+Pj4+ICsgICAgICAgICAgICBwb3MgPSBwY2lfZmluZF9leHRfY2FwYWJp
bGl0eShwZGV2LT5zYmRmLCBjYXBfaWQpOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGlmICggIXBv
cyApDQo+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4gKw0KPj4+PiArICAgICAgICBy
YyA9IGNhcGFiaWxpdHktPmluaXQocGRldik7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgaWYgKCBy
YyApDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FS
TklORyAiJXBkICVwcDogY2FwIGluaXQgZmFpbCByYz0lZCwgdHJ5IHRvIGhpZGVcbiIsDQo+Pj4+
ICsgICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgcmMpOw0KPj4+
PiArICAgICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3Jl
YWRfdmFsLCBOVUxMLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
b3MsIGNhcGFiaWxpdHktPmlzX2V4dCA/IDQgOiAxLCBOVUxMKTsNCj4+Pg0KPj4+IEFyZSB5b3Ug
c3VyZSB0aGlzIHdvcmtzIGFzIGludGVuZGVkPyANCj4+IFllcywgSSB1c2VkIGZhaWx1cmUgdGVz
dCBjYXNlcyBvZiBpbml0X21zaS9yZWJhci4NCj4+IEZyb20gdGhlICJsc3BjaSIgcmVzdWx0LCB0
aGV5IHdlcmUgaGlkZWQgZnJvbSB0aGUgZG9tMC4NCj4+IEJ1dCBJIGZvcmdvdCB0byB0ZXN0IGZv
ciBkb21Vcy4NCj4gDQo+IEkgYXNzdW1lIHRoYXQncyBvbmx5IHRlc3RlZCB3aXRoIExpbnV4PyAg
U2VlIG15IGNvbW1lbnQgYmVsb3cgYWJvdXQNCj4gY2FwYWJpbGl0eSBJRCAwIGJlaW5nIHJlc2Vy
dmVkLCBhbmQgaGVuY2UgSSB0aGluayB3ZSBzaG91bGQgbm90IGtlZXANCj4gY2FwYWJpbGl0aWVz
IHdpdGggSUQgMCBvbiB0aGUgbGlzdCwgYXMgaXQgbWlnaHQgY2F1c2UgbWFsZnVuY3Rpb25zIHRv
DQo+IE9TZXMuDQo+IA0KPj4+IFRoZSBjYXBhYmlsaXR5IElEIDAgaXMgbWFya2VkIGFzICJyZXNl
cnZlZCIgaW4gdGhlIHNwZWMsIHNvIGl0J3MgdW5jbGVhciB0byBtZSBob3cgT1NlcyB3b3VsZCBo
YW5kbGUNCj4+PiBmaW5kaW5nIHN1Y2ggY2FwYWJpbGl0eSBvbiB0aGUgbGlzdCAtIEkgd29uJ3Qg
YmUgc3VycHJpc2VkIGlmIHNvbWUNCj4+PiBpbXBsZW1lbnRhdGlvbnMgZGVjaWRlIHRvIHRlcm1p
bmF0ZSB0aGUgd2Fsay4gIEl0J3MgZmluZSB0byBtYXNrIHRoZQ0KPj4+IGNhcGFiaWxpdHkgSUQg
Zm9yIHRoZSBvbmVzIHRoYXQgd2UgZG9uJ3Qgd2FudCB0byBleHBvc2UsIGJ1dCB0aGVyZSdzDQo+
Pj4gZnVydGhlciB3b3JrIHRvIGRvIElNTy4NCj4+Pg0KPj4+IFRoZSB1c3VhbCB3YXkgdG8gZGVh
bCB3aXRoIG1hc2tpbmcgY2FwYWJpbGl0aWVzIGlzIHRvIHNob3J0IGNpcmN1aXQNCj4+PiB0aGUg
Y2FwYWJpbGl0eSBmcm9tIHRoZSBsaW5rZWQgbGlzdCwgYnkgbWFraW5nIHRoZSBwcmV2aW91cyBj
YXBhYmlsaXR5DQo+Pj4gIk5leHQgQ2FwYWJpbGl0eSBPZmZzZXQiIHBvaW50IHRvIHRoZSBuZXh0
IGNhcGFiaWxpdHkgaW4gdGhlIGxpc3QsDQo+Pj4gdGh1cyBza2lwcGluZyB0aGUgY3VycmVudCBv
bmUuIFNvOg0KPj4+DQo+Pj4gY2FwYWJpbGl0eVtuIC0gMV0ubmV4dF9jYXAgPSBjYXBhYmlsaXR5
W25dLm5leHRfY2FwDQo+Pj4NCj4+PiBJT1c6IHlvdSB3aWxsIG5lZWQgdG8gYWRkIHRoZSBoYW5k
bGVyIHRvIHRoZSBwcmV2aW91cyBjYXBhYmlsaXR5IG9uDQo+Pj4gdGhlIGxpc3QuICBUaGF0J3Mg
aG93IGl0J3MgYWxyZWFkeSBkb25lIGluIGluaXRfaGVhZGVyKCkuDQo+PiBPaCwgSSBnb3QgeW91
ciBvcGluaW9uLg0KPj4gQnV0IHdlIG1heSBuZWVkIHRvIGRpc2N1c3MgdGhpcyBtb3JlLg0KPj4g
SW4gbXkgb3BpbmlvbiwgdGhlcmUgc2hvdWxkIGJlIHR3byBzaXR1YXRpb25zOg0KPj4gRmlyc3Qs
IGlmIGRldmljZSBiZWxvbmdzIHRvIGhhcmR3YXJlIGRvbWFpbiwgdGhlcmUgaXMgbm8gZW11bGF0
aW9uIG9mIGxlZ2FjeSBvciBleHRlbmRlZCBjYXBhYmlsaXRpZXMgbGlua2VkIGxpc3QgaWYgSSB1
bmRlcnN0YW5kIGNvZGVzIHJpZ2h0Lg0KPiANCj4gWWVzLCBidXQgdGhhdCBuZWVkcyB0byBiZSBm
aXhlZCwgd2UgbmVlZCB0byBoYXZlIHRoaXMga2luZCBvZg0KPiBlbXVsYXRpb24gdW5pZm9ybWx5
Lg0KPiANCj4+IFNvLCBmb3IgdGhpcyBzaXR1YXRpb24sIEkgdGhpbmsgY3VycmVudCBpbXBsZW1l
bnRhdGlvbiBvZiBteSBwYXRjaCBpcyBlbm91Z2ggZm9yIGhpZGluZyBsZWdhY3kgb3IgZXh0ZW5k
ZWQgY2FwYWJpbGl0aWVzLg0KPiANCj4gSXQgd29ya3MgZ2l2ZW4gdGhlIGN1cnJlbnQgY29kZSBp
biBMaW51eC4gIEFzIHNhaWQgYWJvdmUsIEkgZG9uJ3QNCj4gdGhpbmsgdGhpcyBpcyBmdWxseSBj
b3JyZWN0IGFjY29yZGluZyB0byB0aGUgUENJIHNwZWMuDQo+IA0KPj4gU2Vjb25kLCBpZiBkZXZp
Y2UgYmVsb25ncyB0byBjb21tb24gZG9tYWluLCB3ZSBqdXN0IG5lZWQgdG8gY29uc2lkZXIgbGVn
YWN5IGNhcGFiaWxpdGllcyBzaW5jZSBhbGwgZXh0ZW5kZWQgY2FwYWJpbGl0aWVzIGFyZSBoaWRl
ZCBpbiBpbml0X2hlYWRlcigpLg0KPj4gU28sIGZvciB0aGlzIHNpdHVhdGlvbiwgSSBuZWVkIHRv
IHdoYXQgeW91IHNhaWQgIiBjYXBhYmlsaXR5W24gLSAxXS5uZXh0X2NhcCA9IGNhcGFiaWxpdHlb
bl0ubmV4dF9jYXAgIg0KPiANCj4gSSdtIG5vdCBzdXJlIHdoeSB3b3VsZCB3YW50IHRvIGhhbmRs
ZSB0aGUgaGFyZHdhcmUgZG9tYWluIHZzDQo+IHVucHJpdmlsZWdlZCBkb21haW5zIGRpZmZlcmVu
dGx5IGhlcmUuICBUaGUgd2F5IHRvIGhpZGUgdGhlDQo+IGNhcGFiaWxpdGllcyBzaG91bGQgYWx3
YXlzIGJlIHRoZSBzYW1lLCBsaWtlIGl0J3MgY3VycmVudGx5IGRvbmUgZm9yDQo+IGRvbVVzLg0K
U28sIEkgbmVlZCB0byByZWZhY3RvciB0aGUgZW11bGF0aW5nIFBDSSBjYXBhYmlsaXR5IGxpc3Qg
Y29kZXMgb2YgaW5pdF9oZWFkZXIoKSB0byBzZXJ2ZQ0KZm9yIGFsbCBkb21haW4oZG9tMCtkb21V
cykgZmlyc3RseSwgc2luY2UgY3VycmVudCBjb2RlcyBvbmx5IGVtdWxhdGUgUENJIGNhcGFiaWxp
dHkgbGlzdCBmb3IgZG9tVXMsIHJpZ2h0Pw0KDQo+IA0KPj4gSSBhbSBub3Qgc3VyZSBpZiBhYm92
ZSBhcmUgcmlnaHQuDQo+Pj4NCj4+Pj4gKyAgICAgICAgICAgIGlmICggcmMgKQ0KPj4+PiArICAg
ICAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIlcGQg
JXBwOiBmYWlsIHRvIGhpZGUgY2FwIHJjPSVkXG4iLA0KPj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCByYyk7DQo+Pj4+ICsgICAgICAgICAgICAg
ICAgcmV0dXJuIHJjOw0KPj4+PiArICAgICAgICAgICAgfQ0KPj4+PiArICAgICAgICB9DQo+Pj4+
ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgcmV0dXJuIDA7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+
Pj4gIHZvaWQgdnBjaV9kZWFzc2lnbl9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+
ICB7DQo+Pj4+ICAgICAgdW5zaWduZWQgaW50IGk7DQo+Pj4+IEBAIC0xMjgsNyArMTY5LDYgQEAg
dm9pZCB2cGNpX2RlYXNzaWduX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gIA0K
Pj4+PiAgaW50IHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4g
IHsNCj4+Pj4gLSAgICB1bnNpZ25lZCBpbnQgaTsNCj4+Pj4gICAgICBjb25zdCB1bnNpZ25lZCBs
b25nICpyb19tYXA7DQo+Pj4+ICAgICAgaW50IHJjID0gMDsNCj4+Pj4gIA0KPj4+PiBAQCAtMTU5
LDEyICsxOTksMTkgQEAgaW50IHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCj4+Pj4gICAgICAgICAgZ290byBvdXQ7DQo+Pj4+ICAjZW5kaWYNCj4+Pj4gIA0KPj4+PiAt
ICAgIGZvciAoIGkgPSAwOyBpIDwgTlVNX1ZQQ0lfSU5JVDsgaSsrICkNCj4+Pj4gLSAgICB7DQo+
Pj4+IC0gICAgICAgIHJjID0gX19zdGFydF92cGNpX2FycmF5W2ldKHBkZXYpOw0KPj4+PiAtICAg
ICAgICBpZiAoIHJjICkNCj4+Pj4gLSAgICAgICAgICAgIGJyZWFrOw0KPj4+PiAtICAgIH0NCj4+
Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIENhcGFiaWxpdGllcyB3aXRoIGhpZ2ggcHJpb3JpdHkg
bGlrZSBNU0ktWCBuZWVkIHRvDQo+Pj4+ICsgICAgICogYmUgaW5pdGlhbGl6ZWQgYmVmb3JlIGhl
YWRlcg0KPj4+PiArICAgICAqLw0KPj4+PiArICAgIHJjID0gdnBjaV9pbml0X2NhcF93aXRoX3By
aW9yaXR5KHBkZXYsIFZQQ0lfUFJJT1JJVFlfSElHSCk7DQo+Pj4+ICsgICAgaWYgKCByYyApDQo+
Pj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4+DQo+Pj4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgbm90
IGludHJvZHVjZWQgYnkgdGhpcyBjaGFuZ2UsIGJ1dCBJIHdvbmRlciBpZg0KPj4+IHRoZXJlIGNv
dWxkIGJlIGEgd2F5IHRvIGRpdGNoIHRoZSBwcmlvcml0eSBzdHVmZiBmb3IgY2FwYWJpbGl0aWVz
LA0KPj4+IHNwZWNpYWxseSBub3cgdGhhdCB3ZSBvbmx5IGhhdmUgdHdvICJwcmlvcml0aWVzIjog
YmVmb3JlIG9yIGFmdGVyIFBDSQ0KPj4+IGhlYWRlciBpbml0aWFsaXphdGlvbi4NCj4+IEkgaGF2
ZSBhbiBpZGVhLCBidXQgaXQgc2VlbXMgbGlrZSBhIGhha2UuDQo+PiBDYW4gd2UgYWRkIGEgZmxh
ZyhtYXliZSBuYW1lIGl0ICJtc2l4X2luaXRpYWxpemVkIikgdG8gc3RydWN0IHZwY2l7fT8NCj4+
IFRoZW4gaW4gdnBjaV9tYWtlX21zaXhfaG9sZSgpLCB3ZSBjYW4gZmlyc3QgY2hlY2sgdGhhdCBm
bGFnLCBpZiBpdCBpcyBmYWxzZSwgd2UgcmV0dXJuIGFuIGVycm9yIHRvIGxldCBtb2RpZnlfZGVj
b2RpbmcoKSBkaXJlY3RseSByZXR1cm4gaW4gdGhlIHByb2Nlc3Mgb2YgaW5pdF9oZWFkZXIuDQo+
PiBBbmQgaW4gdGhlIHN0YXJ0IG9mIGluaXRfbXNpeCgpLCB0byBzZXQgbXNpeF9pbml0aWFsaXpl
ZD10cnVlLCBpbiB0aGUgZW5kIG9mIGluaXRfbXNpeCgpLCB0byBjYWxsIG1vZGlmeV9kZWNvZGlu
ZygpIHRvIHNldHVwIHAybS4NCj4+IFRoZW4gd2UgY2FuIHJlbW92ZSB0aGUgcHJpb3JpdGllcy4N
Cj4gDQo+IE1heWJlIHRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgTVNJLVggY2FwYWJpbGl0eSBj
b3VsZCBiZSBkb25lIGFmdGVyDQo+IHRoZSBoZWFkZXIsIGFuZCBjYWxsIHZwY2lfbWFrZV9tc2l4
X2hvbGUoKT8gIFRoZXJlJ3MgYSBiaXQgb2YNCj4gcmVkdW5kYW5jeSBoZXJlIGluIHRoYXQgdGhl
IEJBUiBpcyBmaXJzdCBmdWxseSBtYXBwZWQsIGFuZCB0aGVuIGEgaG9sZQ0KPiBpcyBwdW5jaGVk
IGluIHBsYWNlIG9mIHRoZSBNU0ktWCByZWxhdGVkIHRhYmxlcy4gIFNlZW1zIGxpa2UgdGhlDQo+
IGVhc2llciBvcHRpb24gdG8gYnJlYWsgdGhlIGRlcGVkZW5jeSBvZiBpbml0X21zaXgoKSBpbiBi
ZWluZyBjYWxsZWQNCj4gYWhlYWQgb2YgaW5pdF9oZWFkZXIoKS4NCllvdSBtZWFuIHRoZSBzZXF1
ZW5jZSBzaG91bGQgYmU6DQp2cGNpX2luaXRfaGVhZGVyKCkNCnZwY2lfaW5pdF9jYXBhYmlsaXR5
KCkgLy8gYWxsIGNhcGFiaWxpdGllcw0KdnBjaV9tYWtlX21zaXhfaG9sZSgpDQoNClJpZ2h0Pw0K
DQo+IA0KPiBDb21wbGV0ZWx5IHVucmVsYXRlZDogbG9va2luZyBhdCB2cGNpX21ha2VfbXNpeF9o
b2xlKCkgSSBzZWUgdGhlIGNhbGwNCj4gaW4gbW9kaWZ5X2RlY29kaW5nKCkgaXMgcmVkdW5kYW50
LCBhcyBtb2RpZnlfYmFycygpIGFscmVhZHkgY3JhdmVzIHRoZQ0KPiBNU0ktWCByZWdpb25zIG91
dCBvZiB0aGUgQkFScy4NCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KSmlxaWFuIENoZW4uDQo=


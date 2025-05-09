Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A5AB0F5E
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980009.1366503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDKFA-0000vf-EB; Fri, 09 May 2025 09:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980009.1366503; Fri, 09 May 2025 09:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDKFA-0000sX-BQ; Fri, 09 May 2025 09:42:12 +0000
Received: by outflank-mailman (input) for mailman id 980009;
 Fri, 09 May 2025 09:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yxiy=XZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uDKF7-0000sB-Ny
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:42:09 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:200a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df9ad671-2cb9-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:42:08 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 09:42:03 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Fri, 9 May 2025
 09:42:03 +0000
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
X-Inumbo-ID: df9ad671-2cb9-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5vL3n2upgPyXr1n6t7U2hGKnSglVzW8MyPtmzApCZS76F6dpFNx144NySG34T17C2s3U6B8IHjj+PY8D5N4T3xfMPSieZ8nYxPwFYJ9GG4RhiZX/fmedj/PIR+yBkQQ7xOTDFrbyIJ4sB1ejsVpd+XYTD7Hw+bFHFhaQvbZ3r/KeJv1L2d37eozWmCf9ikSxZ07zR1XaRAb6MeK2CFEZC26hMMHZUJPPtzlpz4+cwPr/rbEdnGnq4zc1Tlk3QQ8MUvrWneW2qO8SERSmkAH2AnCOCFUgEQJhJczzhoyOzu3jdVH/geqBX/mLUppKBHKmb529h1JAFw85PJhYNnwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYSwX0z5vHJ7EBrQ+cgJhSYFa1CQdP9Dpe5U7d9W0EM=;
 b=FVfJOpd7WknYeoqUP9M3+UXosCTUQlj+L0Dz7bm8ywdqVsaBKpsLMqykpBRKQsfpRBYDqRBHpxoILuGJsLHHiG1kl+lpTEGBricdeuAhTfLr1yo7BP+6Hyl5TjcwPKzKt6AZpB0P6YM+umRqkIO6VxdjXYM00rALzQ8N4Nio6RztdLShhXXai0nHVC7g/d3EczupYhe7Vo5K3grk6Q3DwZquOJj5q+T4cv3ko0s0YgZrWX/B+iyEw9sRrC2/+PMTTjFdXlIory5HWaUAQGfFX4zFG9HP2WGyo4bWlmpckkfsERUsozTFzAp/0S68UO2bKCy8giki3Hu30cf07yBOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYSwX0z5vHJ7EBrQ+cgJhSYFa1CQdP9Dpe5U7d9W0EM=;
 b=BTz9FHBPDC43axwq8QMG1SRkDnf9l+GPqw2xqIZtdibvJWFAboBlXENyVgLtFFhPDWstCePn0j8RFGWeWH3k08b7rHQ0ckm8Zl5adlMxneOeXTtEPPCWktVKkyIHDNCOrFSpg14kUooGv1gahSaOVJMD2DdPrr8bAjUj2vm2F4w=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 14/15] tools/xenpm: remove px_cap dependency check for
 average frequency
Thread-Topic: [PATCH v4 14/15] tools/xenpm: remove px_cap dependency check for
 average frequency
Thread-Index: AQHbrRCwc1yeGpZzL0W02M9xuQGFIrO8Yf+AgA3L4uA=
Date: Fri, 9 May 2025 09:42:03 +0000
Message-ID:
 <DM4PR12MB8451B23EEE574FDECBA96107E18AA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-15-Penny.Zheng@amd.com>
 <0bc47af9-ea09-40ba-8a81-933a10b58435@suse.com>
In-Reply-To: <0bc47af9-ea09-40ba-8a81-933a10b58435@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=3c63a98c-63b4-450e-a222-8b4287b10989;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-09T09:41:56Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BY5PR12MB4258:EE_
x-ms-office365-filtering-correlation-id: 7e29bc7f-1170-47df-e775-08dd8eddc0fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R3pOZDl4UlJqS3ZVa2dUcUQrWS80Q3JXRVN3Uk9XV3dQSkxjdzY4OFJ4YTlL?=
 =?utf-8?B?VXYyWEhUR2tSdDVmbnVQWFEydU5wVHpHdVM3aURod2hBb3Nsa2VvdVRTUGp1?=
 =?utf-8?B?QThrTDdHSkl0WGZUWTMvK0ZFWG1UTmNKZDU5R3dIWWR4K3dLUU9uTktpWDFR?=
 =?utf-8?B?ZE5oWkVaVno0blRFMTQzVDFkaFp0ZlVyUlJxL296T2N1WEg4WDJ4SllrYTY2?=
 =?utf-8?B?ZTFKUWVHaGt3OUR6cUtRVmlTaEhRbHhBMlhUZnRQSkZjRzZpRmhaTHpQV3ZI?=
 =?utf-8?B?OWZwN3RlSlp1V1cza3orcUFSTjJOc0FtV1JvQUJHbEgrZlVETW1FL25naDNY?=
 =?utf-8?B?WkcvUHIyZXJtelFCTnFWcVVheENpc3dlYUsvZlNvckM1RkJjZFczNGgzR2ZS?=
 =?utf-8?B?VFlXczFkQld2WHFlejMxZVNsUjYzQlJiOWpLazlwMW0waVI1UnZVK2dSYWpp?=
 =?utf-8?B?VkFGMklDbkRadWd2U3hFcTdiU1d0Y2VScTlBalZnQmZkZVNnTVpPUmtBVExy?=
 =?utf-8?B?cHl2dkZpKzdjdHdObzFTazBPOHdpLzVZaUxnTmdjZ3g1dVpLRk1EbjJOb2pS?=
 =?utf-8?B?YmZ2WnFKNTJGQUFnV2Y1WnowQ1doTXo2U2kxVjBNRmsxSTRmWTVUSlNqTFBY?=
 =?utf-8?B?UkswZlJGamJTSFp5a2FQcU5zeVAycG1IMzFXU0Y1Vkx3M2RiWUVjU2VIdE94?=
 =?utf-8?B?MkRwdzJqcC9NT1ZKZnhSQ295eHJEcXpJTlN6TlgxOHh1M1FndTdSODI4Y3dn?=
 =?utf-8?B?TGhFTjFYWW1DdEhHcTd5cHozQUVtNURVbWVXL2ZkNTYyU0FHeit1SG5FRTRt?=
 =?utf-8?B?VnFldm9tZDJmRnZvMWN1KzF5Y0swWWtXOEcrcE41UzNBNE1Jd0pxaE1nUjhj?=
 =?utf-8?B?bzdmZENXM0wrZXpzSC9zRlJ0dXlrNEMyUU5ud1NiMjFUVllrVzVxa1NqVWZw?=
 =?utf-8?B?ek83bFNoR2JBYzVWVnkyMG9lNStmSy9jZHZld3ZqMWVYbFpUYlpPQnVmMU0v?=
 =?utf-8?B?REpSTUV0V0NzZWRlb1NFaXJBSnFYT1RiMFFpU3BHTHNVS09wYkdWQ2VPRElK?=
 =?utf-8?B?cC93dGhIT3FCWFczU0s3WFI2R3haSWNDUjJOdVR6NTFhVkN5L1pIeEQ3Z1ZO?=
 =?utf-8?B?N1JHSVNZN2RpYWtzTWFwWlR0QWxUTGExek1YU3JrQ2xrOGh5R21aM0x3Zzd5?=
 =?utf-8?B?TDhjb0RWVHhGK0g4MzJtczhvQ0FvZ25mWTV0Q3lCQlBFNEpSYTd0VUNIakhY?=
 =?utf-8?B?eTVTQ01GLzRieUZiTzdWaXVqclpuRit1cytydFBqc253NndXV2ZnRFhFd29n?=
 =?utf-8?B?Z29VL2k5bFF1UFVUNjNQRkpoVFZNYjd5UFFnNjBHNU4zTXdrTlZ3ZXY2cTJZ?=
 =?utf-8?B?M2owUDFnV3Y1bHpXOWdpVkR5M2k3VmRqLzRoMkY4MW4rTzlpK2RiWDFSTUpu?=
 =?utf-8?B?VjZvbDV0OFQzUlNnRDBrUEtHUm5BTWFXSHVIc3NUditwZ0FTMUxQK25pWGRS?=
 =?utf-8?B?ZVVLbDNhNGQrMFRXWXBBcXRyZ0kvY1EvM2hoaDNyeFhaV1I2cFJoZGxOUjJl?=
 =?utf-8?B?RWNaK0xpSDBNdVFTOEFENGJtQkdXUFd0bjVhQVBjM1lnK3RvbWpkc3AvL2Ja?=
 =?utf-8?B?eXlZVk8vSEVqUkZZdzdhWEVieXN2MEJ0aHhhVUVCK0E5ZCtUMUhKdWUxOGFj?=
 =?utf-8?B?WnN0M2FITzdoSlhpS08zLytYczRMck5vTHM0K0NuMXB4VGh1OFZlazFkUWhD?=
 =?utf-8?B?NEpJdUtBMktIYXJIWUdlbWdJak1iRVBPZXUvQUU3MnA1d1ZLVU9sZXRWNUl3?=
 =?utf-8?B?Mzl0ajFyVVA5ejMwaWhUaVZrMklVQkVJQU1LVFdaZUR1TDJ6QnpHYmcyMk03?=
 =?utf-8?B?cnErZEx1UGE1SFI5NFVHa0ZaU2JtMFdjS0tYbTFwR3hLeEhEM0xNNlBKdG53?=
 =?utf-8?B?T0RHdEQxMStZOWlaSFFtWFhZZTNFc3RYTlpIWXJuMG0xbUxIVUQ2bmlwaGYv?=
 =?utf-8?Q?moupbBar37R5qBgBMEZgoso/9FIhNI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MnNWVGN0ZFFLVVo5ZGN4aXYxZWJsSnlMSHdiU0FwQkhJUnlIQTJ2ZWIvb0I1?=
 =?utf-8?B?dzAzaVBwMGtMOGFMemdtbnpUam4yQUU1aVhVMmRwVWNpaW05T3dFWmg3RW8y?=
 =?utf-8?B?enE0Um5ZNUhPR3ZiN3MrR2lmeG8vUjVKdkRiQnR5akdxamwvT3U3eDdSdzM1?=
 =?utf-8?B?RmZ5S0lHS0xtMWFiclArMjNQdi94V0U1cGtJTEVHUWNaMThtQ0JSb09Gektk?=
 =?utf-8?B?VHVDTTVFekdOOTh0bG5RNHZIUHhKbjZ6aEpoQVNUNkhRVlo1RHcrY2xTTnVw?=
 =?utf-8?B?cThWK2dRcHdjWGpXaHZMUGhwTkROTDh0c3FodzFrVng5ajJmRWpZdzlQTjkv?=
 =?utf-8?B?NmZpbXVvNDVvbTdxODhobHRZTU9iQ2h5SjRoYUdiQlQ4bGI2RDd3KzZQYlBH?=
 =?utf-8?B?US92d2hIOEdISWhmMWF3U3VaMVFUNEczZnJybi9YMllJVjgyVHZsMGNoMWRs?=
 =?utf-8?B?Zmh3U0RsbXFDdXV5N1lZa1FPNm91c0NBc25mQ0dUY05EVytoNzVSUE1qdWpD?=
 =?utf-8?B?enBSOU1EbEtyUTE4eTJuTmNvYnRMRkg4Z1lVbDg2dkJjb2JJSGdVZmJHUndC?=
 =?utf-8?B?SE90WGpiN1BTQXRaYStBTWlDaXJVK1ZIbjcwVUpkUmYzVzROQ3VBZFJNZy9s?=
 =?utf-8?B?eCtPcHY2SUZSRG9lYlp5a2ppNFRMMFZqNkN2bkJMZmQwU0JIUzhNSDc2KzUv?=
 =?utf-8?B?ckZJZkdXL0tQOXNuaWc5Nkd0TlBkTThGOEl1ZVhISEN4ZkRxYS9ibGNmRWU1?=
 =?utf-8?B?TUU1L2dUYmZpZU9PazhnMXJFTDZlc2N3eFBhV1loMEM0dnNVR1ZOTlRCNVBj?=
 =?utf-8?B?V0llajN5RXd1Z1JSWFMvSkkxa3U5NGNjUmh4cmdJTnFRVHNVOG1nb2cwRVRP?=
 =?utf-8?B?T3pBSmdQdzNWOFJuU3UxdHl1NmpaRXpJcFhzdzR4c3IrLzBwV05tOUFzbkZB?=
 =?utf-8?B?ZW5RcldZV2dweW1sY3J4Y3ZRNjFnYVdIRm55MHM4eU5OZTh2dXpJemtxV2hP?=
 =?utf-8?B?ZEtqVmR4OVF1bkxXS3BoSjNGcTUyc2JueThhSU4vWHc1Q3NjUjU1YlFheHZ1?=
 =?utf-8?B?YmVCZStLQ1dSNjdoNDUxWGpBUm9Ka1p3WFh3NW5HMlh4Qk9BNnFjVEtSd01X?=
 =?utf-8?B?ZGpIdGlYckttMThiVUg5TUFuNkV3TUp6bzZIYnFJVFZNUWk2TE5VU1lMbkhE?=
 =?utf-8?B?NmJyU21ocE13dzRxODdTZlB5YXg3ZzY1dURNUXMvaWdWc3QwR0hxeUlpZnBa?=
 =?utf-8?B?WHNIckVhc3VNTmw0TUlCRUJPSkZhVUo2Y0MyckVNMmVKdXd0R3VHNXAwSkow?=
 =?utf-8?B?YzlVak5HZ0NERjlRRmlyM204clZIRm9wKzBUZzI3anJkajBSUEJlWGRtcUx4?=
 =?utf-8?B?RmdadEIvMVFUdGsydDBaQU5DRWUrQ3VyY3Iwa1lwUUxNMUFIbnQ2VUNzWmQx?=
 =?utf-8?B?aS9nSmNzaHhrQ0pIL2RmVjN5TnMxZXNIazR6bGFQRWE1c0dBWWcwNTNyb3RM?=
 =?utf-8?B?THFJUFlraFRaZTNWM0pmVEtvQmNmV0RiNnlBNHh6c2w4ZnE5SnFNNHhnU0p1?=
 =?utf-8?B?cFdENWlMOURhWG52VFdKUWxwWFRtNER2MW5BN0ViVURiRkRmdnNoZTZENk9M?=
 =?utf-8?B?YlFCSGNUU3A2cnduQzhJakd6WXlNOS83NmtmTWh3NE9KS1VGWkcvZHZTejBJ?=
 =?utf-8?B?WFFoenJmVVVTTnJ0cEZNS0NoTVJ3dUcxaG9FL3V3dlV1R2p3dHRnSDV5SHMr?=
 =?utf-8?B?Tm5kQXFrUUQ0VGsxdUlTTlRCcjFhOWJtSnBkK3BhTmRKMDRhdEh0MmFpU0Rh?=
 =?utf-8?B?clJmeVNjcDNPVzlrbU1QTkJGZU4yYnVVb0lOY1ZzbG0rQUdFaEJZSEt6UGls?=
 =?utf-8?B?THVSRldTKzhtdjRvVmRuc2pQQXg0WG9WNnM0K05DNnNiQ2hYUUY5OG1oWXB6?=
 =?utf-8?B?eFYrM1JXTTRrN2o4cVovL1lSZHZtUlZQM2kzS0tBeFY5SUNTRXFKVm9JWWdV?=
 =?utf-8?B?UUljakowY2tWaUJOU0lTTjE5UEhYbTh1c3cvLzhZb1djM1k1eEZTbmp1bldt?=
 =?utf-8?B?ZUxIMnI0N3lBaElyczRuVWdVaTJHNlh2aGlhbEdpMnhGYm5jM1VQL2w0bHpM?=
 =?utf-8?Q?rkOA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e29bc7f-1170-47df-e775-08dd8eddc0fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 09:42:03.3096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1MHRbnf7BxS2XZxh27Tcw2AiJGLJnwv2xR+ccKs7dHgOUYFmby0hL0iApEpUubvCjUDq2kq/ZFKcZNSmiP+NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmls
IDMwLCAyMDI1IDEwOjQyIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5j
b20+DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJE
DQo+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTQvMTVdIHRvb2xzL3hlbnBtOiByZW1v
dmUgcHhfY2FwIGRlcGVuZGVuY3kgY2hlY2sNCj4gZm9yIGF2ZXJhZ2UgZnJlcXVlbmN5DQo+DQo+
IE9uIDE0LjA0LjIwMjUgMDk6NDAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEluIGB4ZW5wbSBz
dGFydGAgY29tbWFuZCwgdGhlIG1vbml0b3Igb2YgYXZlcmFnZSBmcmVxdWVuY3kgc2hhbGwgbm90
DQo+ID4gZGVwZW5kIG9uIHRoZSBleGlzdGVuY2Ugb2YgbGVnYWN5IFAtc3RhdGVzLCBzbyByZW1v
dmluZyAicHhfY2FwIg0KPiA+IGRlcGVuZGFuY3kgY2hlY2suDQo+DQo+IFdlbGwsIHllcywgSSBh
Z3JlZSB0aGVyZS4gQnV0IGNhbiB5b3UgZXhwbGFpbiB0byBtZSB3aGF0IHRoZSBmaWxlIHNjb3Bl
ICJhdmdmcmVxIiBpcw0KPiBnb29kIGZvcj8gU2hvdWxkbid0IHdlIGdvIGZhcnRoZXIgYW5kIHRp
ZHkgdGhpbmdzIG1vcmUgdGhvcm91Z2hseT8gTXVjaCBsaWtlDQo+IHNob3dfY3B1ZnJlcV9ieV9j
cHVpZCgpLCB3ZSBjb3VsZCBjYWxsDQo+IGdldF9hdmdmcmVxX2J5X2NwdWlkKCkgcmlnaHQgYmVm
b3JlIHByaW50aW5nLiAoSXQgZXNjYXBlcyBtZSBhbHRvZ2V0aGVyIHdoeQ0KPiBzdGFydF9nYXRo
ZXJfZnVuYygpIHdvdWxkIHByZS1maWxsIHRoZSBhcnJheS4gVW5saWtlIGN4c3RhdF9zdGFydFtd
IGFuZCBweHN0YXRfc3RhcnRbXQ0KPiB0aGF0J3Mgbm90IGluY3JlbWVudGFsbHkgb3IgZGlmZmVy
ZW50aWFsbHkgdXNlZCBkYXRhLikNCj4NCg0KUmlnaHQsIEkgdGhpbmsgYXZnZnJlcVtdIHNoYWxs
IGJlIGp1c3QgbGlrZSBjeHN0YXRfc3RhcnRbXSBhbmQgcHhzdGF0X3N0YXJ0W10sIGdldHRpbmcg
cHJlLWZpbGxlZCBpbg0Kc3RhcnRfZ2F0aGVyX2Z1bmMoKSB0b28sIG1heWJlIHdlIGRvbid0IG5l
ZWQgYSBhdmdmcmVxX3N0YXJ0W10gdG8gYWN0dWFsbHkgcmVjb3JkIHRoZSBudW1iZXJzLg0KV2hh
dCB3ZSBhY2hpZXZlIHRoZXJlIGlzIHRoYXQgaW4gZ2V0X21lc3N1cmVkX3BlcmYoKSwgd2UgY291
bGQgbGV0IHBlcl9jcHUodXNyX3BlcmZfcGFpciwgY3B1KQ0Kc2F2ZSBBUEVSRi9NUEVSRiB2YWx1
ZSBhdCAgc3RhcnRfZ2F0aGVyX2Z1bmMoKSBwb2ludC4NCg0KVGhlbiwgbGF0ZXIsIGluIHNpZ25h
bF9pbnRfaGFuZGxlcigpLCBydW5uaW5nIGdldF9hdmdmcmVxX2J5X2NwdWlkKCkgYWdhaW4gY291
bGQgYWN0dWFsbHkgbGV0IGdldF9tZXNzdXJlZF9wZXJmKCkNCmNhbGN1bGF0ZSBBUEVSRi9NUEVS
RiBpbmNyZW1lbnRhdGlvbiBoYXBwZW5lZCBiZXR3ZWVuIGB4ZW5wbSBzdGFydGAgZHVyYXRpb24u
IFJpZ2h0IG5vdywgd2UgYXJlDQpjYWxjdWxhdGluZyBpbmNyZW1lbnRhdGlvbiBiZXR3ZWVuIGJv
b3QgdGltZSwgb3IgbGFzdCBgeGVucG0gc3RhcnRgIGNvbW1hbmQgdGlsbCBub3cNCg0KPiBEb2lu
ZyB0aGF0IHdvdWxkIG1ha2UgeWV0IG1vcmUgb2J2aW91cyB0aGF0IHRoZSBweF9jYXAgcGFydCBv
ZiB0aGUgY29uZGl0aW9uIHdhcw0KPiBib2d1cyBwcmVzdW1hYmx5IGZyb20gdGhlIHZlcnkgc3Rh
cnQuIChJJ20gZnVydGhlciBpbmNsaW5lZCB0byBzYXkgdGhhdCB0aGlzIGNoYW5nZQ0KPiBzaG91
bGQgYWxzbyBoYXZlIGEgRml4ZXM6IHRhZy4pDQo+DQo+IEphbg0K


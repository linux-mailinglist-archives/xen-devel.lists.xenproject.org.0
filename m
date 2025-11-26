Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52BC8B368
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 18:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173316.1498376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJP9-0000Y2-2y; Wed, 26 Nov 2025 17:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173316.1498376; Wed, 26 Nov 2025 17:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJP8-0000Uy-W4; Wed, 26 Nov 2025 17:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1173316;
 Wed, 26 Nov 2025 17:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOJP7-0000Us-JS
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 17:34:09 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18c80e0f-caee-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 18:34:02 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 17:33:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 17:33:58 +0000
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
X-Inumbo-ID: 18c80e0f-caee-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdzhabnKbnF7venKgjJwql9Avp56ATm9Ulv9QFZYUVF13Sq4tUYazyv7aiEDyxvBtcqmrcQvZY8VmPGVIUPVMuSP30Fec+K3c529KV8iE7hgE9mgm32uvdyOoH+psQsd0u/PAgPvRLPxX9Ub1iJTyFkR2z5vzYEXtRXdG6svJHIvgvlPJ5nWKN2VRqwb39IeFDSW73r7afyziz9rvRFEN5ZyM0YZyPcCSKlvclRh93PMVYlh4pLl/szjOs+5JpRyy6NdmpdJ0K3KrDIEOkdOB3E6HoRbaLrMDHwnYcQdn1aKtbg/GyeGzth+i92ISKCa6ghysHhFjNkH/1yF5yhDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Two5c6uhFvZRoK3rhOU1MDJG9JWsowpw9m/Y7g6xws=;
 b=XOtObOLHqQfg1dGWlCeiogbTDNyKH0sJtkVeMSiAQFIMDwyU3QGF9G3WMr5YA+arCzIOd8RF0MX6TARx2Hj9EthfZFSHX4dHjfvyMrb5vrcPUBQEs5n9IgNAwoMapw07qzDy0TyFxXYkC2zKhCbiXlRfv4VogeFksZUqkx/5w4iqNGU10Qy+7s/33IoENpNMAF37K5GRmIcbJ1IOnc8W8IQ3/O7dC1Z5jcIGIHt3Kcevx0LjEm8sJd6z1B31mxF5Fa3McUpXFYdKzcYpPQStCLZjo9wB6aomeVlVJDPuIK2W7HV6SRjiBv7FCs88K02BBI8rni+7oLPO736EeXiT8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Two5c6uhFvZRoK3rhOU1MDJG9JWsowpw9m/Y7g6xws=;
 b=pj+4yfEhB4RIWRYhCJ5i7kwo9J9gotLDMXh8duUKy2a2XMjJ+4tEEcdb3512NO3sTulPzbMOzByYE81UgXPA6DcUwxil2c767EAvxQEEvPN/C4PX0oy0/MbxcSrpvedWKfcairdNGq9Ej0Yr8ke1/wMDiumrVxdrc+I1TFGrJ+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8fa28870-61e2-475f-9e97-43e7a03b5c6b@citrix.com>
Date: Wed, 26 Nov 2025 17:33:55 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/amd: Stop updating the Zenbleed mitigation
 dynamically
To: Jan Beulich <jbeulich@suse.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-3-andrew.cooper3@citrix.com>
 <175cb547-02d7-435b-93e5-51d643ca1cf0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <175cb547-02d7-435b-93e5-51d643ca1cf0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: ace51118-08aa-478d-ccd8-08de2d11fb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXdzUWNxNm56TVhLWXJUc1UxRzdsNDJTaG9wZXQ5WCswSUpMK3VYdGNKSC9P?=
 =?utf-8?B?T3o5Q0wwS0RQcE1scUJqUVU2MHprdnIzWXlDaXAyMDJ6TEZleUk2d0RiaWFa?=
 =?utf-8?B?SGVBN1JLQzZTRDA3dmQzNURwWGdGS2tGcG9uYWZrVXBrVURTcHdSNlk0cEZX?=
 =?utf-8?B?eUltT3NBUUt4WXBUS3h1bktrSm1ydStRTXBSMDBpZWNjRnFvbjRuUGgrY0FZ?=
 =?utf-8?B?Zm4yTCtzQjA2SkdTbkdrNHk3bXNGMHo3bUlnT0s3cEpjUytIRklGRFJSelhB?=
 =?utf-8?B?eG8zZlpLT2dIMXQzMFhKeUtveEh4QkFFNnJITlV4Nm1sQk9DTllJRHE5MVFV?=
 =?utf-8?B?U2I2MjVEeFBwYUl5bUJ4NUcwdmVwVHMyN1pSRUdPZDhncndhQ0RqQm1xdlFv?=
 =?utf-8?B?ZG9zbzZQZzVuUHR3NmVQMVkyUW9GWWZvZVdWUVFMNTAyN1pzSU9QQkF4UkNa?=
 =?utf-8?B?Y0pBZ1JLL1lLNWhFRTQ1WlQ4ZXV1WlFoZXd0MTRCSHR5MGtPK0lrOVducnNP?=
 =?utf-8?B?OCtycGVNbk1QTmk2N25uUFFVMEY2dnhpQmlXa2ZORllvaWdBVUVtc1VDNFcw?=
 =?utf-8?B?MU9XWTNQMm9nWnBNK29uc1JGMmdpS3hZUWw4ZDRoYXFFMmo5LzRBS2U2MDgr?=
 =?utf-8?B?czBKL2VxQnpOcVR5ekZLN3p4WSt3REQ2RFlwalozUHZrcWVDdXptamVNaDZ0?=
 =?utf-8?B?Ymxrc2hZOHllV1c4RHRGVVplVU1pdFpLYTBVZGtTa1FKVGxlVFFlL2QxNVNv?=
 =?utf-8?B?dE53YkRNcEs1TlhrN3d6TFp2eVhwYXEyUURNZlYyQXlCdVNwTEorcVk1bCtL?=
 =?utf-8?B?Q0d6cWVhTTNzbUJwa1dyQ3NzQ3NodkVydGc3bWVJQ3NJMTZVTlB5NENCSi9C?=
 =?utf-8?B?SHRuelFzem05MFZldEpkbXVoY0ZPcXNSNXEvZ3dFdDdVS1kwWFczWFZJWldG?=
 =?utf-8?B?MXpzd1I5WVVzUjBGbzZvSHEvUzRuYnhkdUdQU1VRZERBK1VRQlhnbGNNZ1Qx?=
 =?utf-8?B?QTBUNHV4a3VkOVd2L1VhZ2NrUURpZUdTTTdKd0hyeGUxVmZ4TnJNWTFOMTZN?=
 =?utf-8?B?TmpuTGdxRjVJQzNiZm5rTmFDNWJISk1OdW0xTVZXZlBTQ2dxck1iRXFyUk9Z?=
 =?utf-8?B?Y1hZU1ByU2RES1U1QUNXTnNnUXYwU0VmVXd1S3k0NDcrNVBhb2tpLzdyamZJ?=
 =?utf-8?B?TGgrSTZnQWpnUXdGTlowQUVQUzg0T29yZUgvYVVjeWx0dlY0cHg0V0dlcUlN?=
 =?utf-8?B?N0twbEpNeG53ZG9FTVdFT1ZWamFjelk0eVNMdnpYbW50ZDV3MnhwRjUxem0v?=
 =?utf-8?B?cEZwZ1lBYjBzTEhwUFBmaks0R1pKNlhSNWlKWWhyZHkrTFo1Rm85NmtGY2M1?=
 =?utf-8?B?OTIyV29iZU5SaGdzSStBVUdUbHE3VzBQbjhhNVJaWmZGbzhkSHJPb00wQVVs?=
 =?utf-8?B?ZWxIRFFTaGQyYVhzcUQrNEViVWJyYVdkY0J5WnVjMUJkeGdFMStTVGJHQVBE?=
 =?utf-8?B?UXorQlEwUUZ5UzJrSWF2YnZOeEthUEZIYVZscU1sMFJJZGtVWHQ4RURQeGsw?=
 =?utf-8?B?WVdMRWFZTUowbkNIenJDYVRqKy92T1pMSmY3aERQa3lGcVhNNDNHdkRYRVpy?=
 =?utf-8?B?WEx0ZCtlaGFpeU9DNkhBdVVISGc1S21DZ3Y3ckNaZDFpcHFzZjRjWS9iSnZI?=
 =?utf-8?B?MVlJQU1wVnpXcUlSQ1JlaFNkemNYTlpaUzAyN3d6b0J2R2p0cnlHb0dNQVND?=
 =?utf-8?B?ZnNWdEdDdW1JaGFnRWxXQ1p0SEYyN3hsY1pyWFZSZ2tWVjd4RnZzRGc4aEhP?=
 =?utf-8?B?bWZzVVNqakZFbGpJeUlhbjFCT3B5QUt3M09TL2J3UDVVNWsyd2dNTzJFRUp3?=
 =?utf-8?B?YmIrYjRtWllDRGw5aTZLaE16V293Z2Fkakl5VWs2NjIyRzlCV2p3enRKL0hW?=
 =?utf-8?Q?lh4svkOTkfVqQGyQNTleq/nW70LexzfX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2FJa1ZrRVh1VjhGdjlMcVUzTXlYbU1EK3J1ck9IOE0weDVWN01EaXhrZ09W?=
 =?utf-8?B?Nk96VHJzRFNkZVFtVm1zZnhNZW9NVnBWVS81ZlhsQStEcHZLV3lVTUlVTUJR?=
 =?utf-8?B?aTNha28rV2N3enExYTU2Yno3eG4vZlZQeVBTZzNleXJQcXdDZGhyb0FkaWNp?=
 =?utf-8?B?a25rbFRibTFjYlZoY3NZcjJVa0xxdlEwMHFydzBVRHpnOXRqRVI2QWN0Nzky?=
 =?utf-8?B?K2VSZStKTythTWFpNEZ5VjExc2ZsQkNxbkRFR1NoSXUxS1ZndEp2L1R5b3Fq?=
 =?utf-8?B?UDNyKzZHTlczOThIZXlOYnlXY09aeXM3ZTJUTDZlbHJMRW5hYVNHbjlmdDNV?=
 =?utf-8?B?SkdMNlF5VnRyS2VXTU9vK1pmcFR4RlJsMVNqclZZZ2JyeFR5K1Q2elEzYWhD?=
 =?utf-8?B?ZUk4NElSUmJKSlFQZTJOMXI5RmtjcG4yWUhoMXJsazBJQi8zNGtIZWJNV0hX?=
 =?utf-8?B?dGI4dzhhVUhjU042aFJtNzBOdUdUZDNXZ1NEUjlKa2NjRUZnR1B4dXVsV0hT?=
 =?utf-8?B?N2ZtbUVEUTBicyt2cjJMN0p1OG5EMlhVVnY2T3NXZFkyMjZPTnk0bUViTjZ5?=
 =?utf-8?B?aGtIN01GK3I3UWw5V1hQS29MeW9qUHNrU2x5dER3VVVoaWIvOWdZWWFOdW1a?=
 =?utf-8?B?Q2UweVo3WUFDNTZET0pvT3pzd1hrNDVWR0V5Y3dHZXE1YWtTSTh5dHFZd0hL?=
 =?utf-8?B?VTNvbzBPSXNMeU8rbU0xYVZEeXVCN2xvSlFlL1FVMlpudTBWUFgvZ05OdEt1?=
 =?utf-8?B?YmdkaG1yL2lJZDI4WWFocXhOenNGR0Fqcmx2K0JubU1sNnJvQTZyTnl2L0hk?=
 =?utf-8?B?NXNZeGp2Si8zMFVxUnUvTjFWMWp1RnlLYW9aUCtTUVFFaTdqa1JiVWhyOGR4?=
 =?utf-8?B?SWRPd1FhaDQvVlpEUGRaOWdURk9sOExMQjRObTVSSytRcUowNDIzdnlTekdC?=
 =?utf-8?B?ODhVbkw5Tmo3cjRHR2l1NWZNSVlTOTdiY2JYbnZhaTk1Z3Jpd2FnczZrenVh?=
 =?utf-8?B?aGNQNWdvTWNRYkNlRngxVUZITURTeFhXdTUzMjM1Y3VLU1YwcHNBY2VCMGJ3?=
 =?utf-8?B?a2tVdWJFa2NLSTZ2Rkp2eEc3VmNjZFB1cWIrbEJkWnl2MmxTMWFUblptTkhr?=
 =?utf-8?B?NnhYTzd0SU95TEZVbU5HMGhuWWJVT2xwUFdBOUxiZDRheVRUeklPWnJlaGtW?=
 =?utf-8?B?OEU0WnpneEVRZkYzaGtlVzlkc280cWhNY01ra0d1ajBWSTJvVERhSkRiYXB5?=
 =?utf-8?B?VndmVmR0L0FRRFVmZTZrZW5DRUhaZnVOTlFRSGxmTXVKb1hPUmVDU0RZQkZD?=
 =?utf-8?B?MEU2SVdDeUJmZXpTS1FrUmYvUThxUGswR2JQSDh0cHJrRXFsZ3pVcHRYY3RD?=
 =?utf-8?B?WHFtY1haTlh5aHVpUGlSWm1ucGsxbWJNNHJJNWpSem1lY0lDU2pyMG8wM0J2?=
 =?utf-8?B?dC9DSGUvUzJCcUxaMG1XRHY1Vlo1NjdGWnFFbEZzclI0VDdreG9oZTZQVHpk?=
 =?utf-8?B?YVNpQndCUG1paE9SVG9BNDFPVkxnYm82OWQrL05xTWxkaG8rSXZrQmhFcExn?=
 =?utf-8?B?L2dkMWpaYXFocnMyTzZrMnVmVTd4RUU2MUVVY0pDbExqQnJ5VnRtdFZ5TG5V?=
 =?utf-8?B?bC9NRHhXb0ZJcFhJV0NvdnNsMjZQeGpiWGdQanM3Z2FwZXNqdFF1T003dDNm?=
 =?utf-8?B?YkZxMHJaRWsvTmVmd3VTbm84WUduM25yeGkyYkp4ekVuQktEVmNXOEZ6bklP?=
 =?utf-8?B?d2psYTRBd3ZLQ3pKNm80a3c4R1ZyVnduUko0V2xVS1ViaEx1aURiTGRMMnpX?=
 =?utf-8?B?bGRzK0RRczh3aC9wK0cxQ01YVHZjdmJ0VkJFUEVRV2ZpSHdOOTQySGlyZlU1?=
 =?utf-8?B?Sm9XdHJhNXNONmRFZUdKWnpaUDc5TldndFNEN1k2akNYNjJtWHlkTzVsWS9H?=
 =?utf-8?B?aUtRbVhNL2FOQjU5cUlNU1M3Z1dqaEpERkFTcGVxZlJVSXRSck5Jb1VGWTFy?=
 =?utf-8?B?ZmczVXFkc21xNFM1aFlXV29JcWxYanVienorUk9sOFZ3TG5XOWJ1WG94VnlN?=
 =?utf-8?B?cVRmRjM5WCtpek1pd2orUXlBZjY5ckxiVklpa3BVT1N5SHFnNUdaYVl5NkZN?=
 =?utf-8?B?Y3UyUk1HOFZDSW4rQXZnZVNjRlFhVFp4SkU3Z2tGM2xFdkZyVmg0SDJFYVls?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace51118-08aa-478d-ccd8-08de2d11fb3a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 17:33:58.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roP6BO+5aB/iVcx8dG6v93+m4zFaCCC+I4zx7bwmfAzwb+Adhgpc7FTUZjIhyrieVqCcfFDV+RRtJeOYgxQkx24boN//N+ZHlcbbncci1/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

On 26/11/2025 2:49 pm, Jan Beulich wrote:
> On 26.11.2025 14:22, Andrew Cooper wrote:
>> This was potentially helpful when the chickenbit was the only mitigation and
>> microcode had not been released, but that was two years ago.
>>
>> Zenbleed microcode has been avaialble since December 2023, and the subsequent
>> Entrysign signature vulnerability means that firmware updates block OS-loading
>> and more OS-loadable microcode will be produced for Zen2.
>>
>> i.e. the Zenbleed fix is not going to appear at runtime these days.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> on the basis that people unwilling to update their firmware already accept
> being vulnerable. To them this might be a perceived regression, i.e. not
> exactly "No practical change", but we kind of accept that possibility.

It's not quite that easy.  There are plenty of Zen2 systems without a
firmware update.

But, a user who cares about their security will have a more up-to-date
microcode than 2 years old, and will get the Zenbleed fix at boot time.

What I'm trying to say is that the "old ucode at boot, new at runtime"
case doesn't sensibly exist any more.

~Andrew


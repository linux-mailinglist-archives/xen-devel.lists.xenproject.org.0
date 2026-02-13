Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNgbGPARj2nAHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:58:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B6135E93
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230792.1536215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqroO-0005Z0-T1; Fri, 13 Feb 2026 11:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230792.1536215; Fri, 13 Feb 2026 11:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqroO-0005Vx-QB; Fri, 13 Feb 2026 11:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1230792;
 Fri, 13 Feb 2026 11:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8h/=AR=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqroN-0005Vr-En
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:58:15 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 462085b9-08d3-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:58:14 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7264.namprd03.prod.outlook.com (2603:10b6:a03:524::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 11:58:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 11:58:09 +0000
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
X-Inumbo-ID: 462085b9-08d3-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc0Ujpqc1MJBsZA+VHpBdp17UWQT4qWzvM5ROIvr0Fdq1NGjqZKE6ezsDr7Pza2t97XQ4gaIjyEq8Co8QDW1f8SJOEHq4PfcgR0pJ3BXQaSlCljx3gaiqyGPDQbXWJBaH8WPUHNGPLjAcL0NbooUOyqtYPgoLaOcOe/MI2MmVhPVH+HIJym9QOVPo3+odRA2dbnsRqzqNH95lruRQd8nxp7gmzmU/KIo/ZCYinDUfyubAh8pEVKmrNMCFziXzmhl2h3IreZmJpR+yb3Uo1fBGl9ws2qjMt0LXpCbsHAILFatYySy7ubqwjXIpQTDfQD2uHfjdRAqAtkM3+TMII/nXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPJZaV7SexPrpxCoY92LjoZDMc/je4U139Q2UO8WbXQ=;
 b=uOia21KtwGqiDR9kkjz1YfTcunkgAy+K8PUgOR2LEAn4L4tP9hv3GBgFlbMYhGA36EkffBjzMgvgEFFtQyfG/b4F3pRmmx44MAyEM7WyrnYD2RfQNKcmWOHbjmxQt80sqXnLZHQNwm58frg4xeffS4tMO1kUEUbHiiPzaQgNQIhBJ263uCiJtl2apBU+0ybtfBj3uLKoiOm9reaM4hi+mUdWzzZSzm6XWjRYcwfAVvY4WFyjL18P1hFRVjd3hZBSMG16Tg0+qub7UstUjmnZKm+w7V+ZCNd/SJdWppx4h6JclX6DLAgEz4d1KiBNMzQwnO3+Wqa6mYWha/iTmIe7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPJZaV7SexPrpxCoY92LjoZDMc/je4U139Q2UO8WbXQ=;
 b=Xt6EVLkSNPgzKHRja73ro/J7C6OlswjS/vrZDDO0TzGvqbvmjZUhYIkE+LGve3SRFUSneJkVh5i6l7k2NWEOJ+mIm+LQaOXGLyxQvGbwujBcXVe36OikbLa34W5TUsx3Fa218Hngm3zSkzLuoJc8Swjb8sH09zrCG8KryLluAyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ee38a161-80fc-49b3-9e73-af26ffd35fb7@citrix.com>
Date: Fri, 13 Feb 2026 11:58:06 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Remove `brctl` from Arch Linux container
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260213101921.61888-1-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260213101921.61888-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 5498bfd5-0116-4231-aba2-08de6af72835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGUySTdKYWJ5V1RlZENoaXZTbWlYdGNIdGljcnRlSWJqQS9XWXprSmFWdHEy?=
 =?utf-8?B?QWxQUWRVTWN4ZlpoOEFXZ3pUMkI3RUk3MGNFRGR2SERaYyt5VTl5SlVVK1lD?=
 =?utf-8?B?NkNiZEM1Y0theGV5cUgxb2FDSlZDb0ZSYjJVZHJEY0tLUkdZVlYxdnVrMFFy?=
 =?utf-8?B?cGJmZmc0WXNFYmtqRlROTERESVNqQVA1WXlkc2RYa2Y3eVhoSE11MEFibURG?=
 =?utf-8?B?bG9iVUlQMFRCdmRUUEVCSVZFc0N5cDU4bGxDSXB2d2d0MHRzVUVzbXgrR0Rm?=
 =?utf-8?B?QjBLSXA5SE1Fd2VhS1lhMGZ2RmRzdDFOWEhXZWduTCtMaTR0T2hjejYvY2s1?=
 =?utf-8?B?RERqZURBK01wY0ZhdXRJSjVncEtNeW8reVNPbWJQWHNmQk1Kd2QxaTRWaCs0?=
 =?utf-8?B?VDVjVWdmbWcxekp4eVlGVnJFeWc0andwbjFtQzliYXQzTjlZUHJXTWswWjJk?=
 =?utf-8?B?dzFwOVZ0blk5SlVUWmdZRm5VTWNRaHlOM3FQbzNITTh4Rk92TWNDKzM0ek1X?=
 =?utf-8?B?NXpmY25WejBna1FDZ0tFTW1udEZ3TEJPTERNZVdlTE5PWVErNFIvUVNPbmN6?=
 =?utf-8?B?MjNyTjQ1RWJsS1V3MzRYWjdFYVBVNTEzTW8ySzNlR3VtSWpZbkp3TU5GZElW?=
 =?utf-8?B?RGdRWjlDWkwvZDJ6dTVWcWd3V2ZxYWlleE4rS0NvRDhtQk9jNkttNGlFdTlt?=
 =?utf-8?B?d3c4aXhZbjlxeXN6a0NxVDlXbVFVS3FYWU9qanhoaEZ0U2xId21UandEWTYx?=
 =?utf-8?B?M3FKSEZaakVINjJaZUVtbEFVc0NLbk5RUlRpeUR4bnAwRDNrbmV2U3Y3aVVF?=
 =?utf-8?B?cGZYMmFFYXhuWUh6VnltSUR5MjgwSXd0NWU0STBDSUlLZ0lETCtPY241WFJH?=
 =?utf-8?B?ZnJaWldVQ0lWaE5NT2s0L0FxZmZZQ2RtS01aYzNXRWNjb2hxeUIvakI0dXZk?=
 =?utf-8?B?TlpVOGFzMVBrWW9oZkJ6OHlLN0J3ZmVaaTJWZGViVXh2bkFlMXU4U3BuMVdL?=
 =?utf-8?B?VTA4V1Z5T1FuYnkxRUVQS3ZrUE5kUlR3OTZMZ0J4WmR2MEZMZy9qVjV4RE9l?=
 =?utf-8?B?NXBrU3FoWW16S3hOV01KRXdYMnpYTnlNYUpKY1BRZUFVTllxQnRZS2M5MVJG?=
 =?utf-8?B?anNkUWVJdXpMSW93dVNyRXBtQUdNbUI1Vm9hYU93SFk1SUd2bHk0REhvL251?=
 =?utf-8?B?ZnRGVEJOcjhmUDJNY3dWakVxZVM0NS8vYWtidzFKU1hKdGxPdXBZdDRxQXVs?=
 =?utf-8?B?QWVLeTVYN3QydEd3anczWHNLQ3EycDB4cExzK2RwVE5PT0Q5VUhYWG1Sdk13?=
 =?utf-8?B?TCtuV1QxZml4ckNCTkRGRndKdkdYeHkwTmdiMnJta256OFRSak0wS0pwcXpU?=
 =?utf-8?B?djVBYUxQMEdldEV6cFA3YkVONGRmUnU5Y21weU1vekRVZ09keERDc0ZBdTdY?=
 =?utf-8?B?SVpEVDZ4L1k3bExJaEJ3VzVoVHFKRU12Ym1wZWRmdm5heStkRXdtcUdIUGxG?=
 =?utf-8?B?Z1Q2RzdLc25Zc01BWFp2RWtidEFkenZvSU1kUUxLTTZHL0hUYndRKzQwYmNI?=
 =?utf-8?B?SmpuVEYxaHBydVpiV0w2clcyY1VNdzl1R05uNkQrWFZIK21pY2ZObDkzRFd3?=
 =?utf-8?B?bnpPRXRVMmdERFhES3VQVjdOd0NCQXRyRkRJSURVTjc0ekZDR25uRlhmcG03?=
 =?utf-8?B?NDhJangvT201czdaL1A5ZnRhSU5xM0JIVTdlYm91MmpwSFYraGVtSW8wakI3?=
 =?utf-8?B?M3B1Ui9ldzgyS3FXbEFtalJUV0VVM0pOamlRNGxQMkhZbWJDYkxuMjVYY2ph?=
 =?utf-8?B?QTVCQTNXUkM1b0lnOFYzT1o5OU9xNGtrYWtVcUlVRGh4UnR2SFB3YkpBblBI?=
 =?utf-8?B?WCtPQ1I5b3psZ3FNNSswN3JEcHg2ekZ2dU44UUw4L0swRjZaZHVZbm1LZWtk?=
 =?utf-8?B?YklQVXBmK2RzZ25OVmY5VGdWMHlTNnlWUFVTUzhCRTQraTZwZVp4MXo3YVEr?=
 =?utf-8?B?clRyamVTYWN4b3VnTFQ3SFpSTUtGWU9tQWc1WVZVNGNjRzJ5U3EraGR3bjFX?=
 =?utf-8?B?bTVBMThFWEtsUGZKS21uNmphY3l2WHlRMGFUTWE4eHRlME0wUHMveXNleHRW?=
 =?utf-8?Q?EGgg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkhJdXJJWUpCTG9BQTRDLzhsZjhqWlRPN2pWazVua2MzNHNlRmpsTmU2a1Jh?=
 =?utf-8?B?SXFqWUVoSmZTMXZVSk9qdnlveUVTaWNRQ3BsYnRNSVAvWDI2TDdQRmJwNFZX?=
 =?utf-8?B?QWw3Zk1obzEzWGlQTE90bkFWTS9JUi9NYnBJeU9sNENqUTdaclRVa2VhV0hZ?=
 =?utf-8?B?R2JjRzBtSEtyc2FTMHpwVURvdWRhM3VCSThwREUzODRac3lRc25oanRqM2h4?=
 =?utf-8?B?S2lDTG5QR25kMGZSaVNQSXJCb1NuSzJBdS91dmo1ckUxRnJXWlU2UGpIOXlr?=
 =?utf-8?B?ZWNDbGNSc0hVanFaU2pyQzZaMU8yZG5zdzNRN3ltcnpVZ1UzanYvYXFIdW5R?=
 =?utf-8?B?Z082ajJCSFc0L3pHN0NSS3ZFcUpSZk1aMUNoVCtKUWVNN1JWZWQ2VGhvaldZ?=
 =?utf-8?B?bzduUVRFY1o3L01HeHdXM1VZeUFERDgrd2JPUFRFTnpMMk5DUGE3K2d6akRv?=
 =?utf-8?B?LytESlpXRnFqc0xMaExhVGIzUjFsVWY2UExDdHhERFdTcDVhU0kvUHk1V2NC?=
 =?utf-8?B?RlZTNVQzK0lCaURHU2Fsc0V3WmF2M1dJWFpFWCtkNnE1MzcxMmJEYUJQR0hn?=
 =?utf-8?B?QnlnOFRtaDVWZ0VvZXVOU2d3UXRmTkk3VkJ6UjBLSENpNU1QVDQ0bDFyNWpF?=
 =?utf-8?B?QkNKcEZ3TXZKaXVidnVseEh5dkpsdW5lMFJNRlNTT2hPVThaMU82SWJyTzFE?=
 =?utf-8?B?UEVJLzJSOHl6OEFDMHhQUExaU2lNVmZ3dU9WZGp6ZnJ5Q2pMOUszNnlDd3I4?=
 =?utf-8?B?RVM5NHJEaDltakF5U3R5ZFA0NTRmM2VraFMxNSszSS9KY3ZMVzdXdVNBTFFa?=
 =?utf-8?B?dkpXSkNwNWhOQUJ2SUphWHFVanBmWThMang4MExaMVNITDJKMVhjcUdla3Qz?=
 =?utf-8?B?bjJTQjlRWGxQRVZPWElrb0NaNi9IVjF4UjMwL2VmamJrWmF6V1k5Vlp5eHlk?=
 =?utf-8?B?VEhOMjA3NGxsd21Hd2s3L3Q2NDZQSWV2Um1xd3ZUaVVQcU5KakllV3cyTFV2?=
 =?utf-8?B?YmN0d2RFMEpzdjdKSWtSakdKRlA2SkxWL2tpN3hlampndWFIT0NqQnVla042?=
 =?utf-8?B?NmJXTzJZNEpYTW1MSTUwdHZaNWxDY0Rud3hhUlkxaDhPTDlGUDQxaHNRNTc5?=
 =?utf-8?B?eFNLV1ZTT2NuY0dkb1cvM3ZsdUQ4NHV2RE5hcGlwRFdyS2Q0a0lPMFhvMWI2?=
 =?utf-8?B?Z1lZekozZkMrcXFLS0dvSTJoRTQ4L2NzZlQ3VHpXS1pvUGJwZ29pd0RmWlVn?=
 =?utf-8?B?WWFvRzNkeXFYbHhsWkhuanNrQzl2ODRyL0JtRlYrQldxbUkxNnFTWTBNeHBO?=
 =?utf-8?B?WDdQV3VlVkJqVDUwTTY1ZGd0dWlvM2pZcUEvand2N1RaQzdkcGxoNExJUzkv?=
 =?utf-8?B?bXdCVG9NK1dMQVluWU9SUVJkWFg3aGVyRlk5MzhLM2FRNjg0NVNWeFFKWkRq?=
 =?utf-8?B?ZmJPRUovdzA3MTROMUhUd21IOC9yWDRhUmMycFByWVpCRmt4eWNVZFEwUEZm?=
 =?utf-8?B?enJGK2pvdkI4UklKWE55ZER1SWpDT0ZSN01KOGlOZStYUWE2cFFuWnFHYndl?=
 =?utf-8?B?ZjN5NmdHY08vbGlmL1hzNG5KWlIzOWRpQVZWWmRVeWtOV3VzTGkzRWZjY3U1?=
 =?utf-8?B?aTJXL1YvajFjM1IyejJhajAxN29WNnZwR3B1RVRDWlhTMU04Tm95dmdOb0lv?=
 =?utf-8?B?YnRKRDM5ZkVpVEw2U0p0NUNJSXRWVGI2M2pwS1lwSmgzaFQrNTVBV0dPSWJt?=
 =?utf-8?B?WWN0ZlgwRGFtQU1vRzBzOG13Q1pBdW01UDJ2U3VjMFVlM0JSY3ZrUkl4TTMx?=
 =?utf-8?B?WHh3L2ptSXBVdjBxYkVlTkUvbHBMTmFmclBrcVRKdXcxNXNqeE5ZZFVGYXhq?=
 =?utf-8?B?U1BEMDFJYk80MmJNYURrcVhLZkRBcTNJeE16d1hDSnJIaElRMG5md3hRMCtu?=
 =?utf-8?B?eXcvOTkrNWQrWDVFRmF5UzhKVHZ2ZU9CakFZRnNEK3B6bldVMElYaURndjJ0?=
 =?utf-8?B?RHhyaTZqLzc3Qi8xeko5RDJiWUUxK0pKUGxKMzdWL3FRRXRoOFZjRjc4alBn?=
 =?utf-8?B?K1FFZDdsWTduekxuODkvcDRYdjBuRWpKVmI2ZkI4T3Y5dTkzcHd1N2lrZXhX?=
 =?utf-8?B?MHJTbHpQVm1PMGNmOFZZV05GNzhpR01TNGs2ZC9QNTRLVUIzaVpUK0tsRENr?=
 =?utf-8?B?UEp6TERwNzI3WFQrdkVPWjFmYjdtWkVFb3VsVmtCdjFBNG9XeHJLWEVvKzB3?=
 =?utf-8?B?WVNOamlodmRYODNHVExBQXRBbkVMeURuZzVnWjlmNW9RN1V1djNVaTdpZGFp?=
 =?utf-8?B?eWxER3JIRk1XWVg2Mk4vdFREcGlDNk54Y1MybDJudnlEd2xkRmg4UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5498bfd5-0116-4231-aba2-08de6af72835
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 11:58:09.8858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uA4Q5p/AX6VqrrFmw+3SlEPpK1TxcmrUoQ0OQRrzTo06F2OnKV8lqB3oZOttYR0IIF0+gU4oB7S/rirH1j0B2m1nnmFfA+8XM9iWk1g0EV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7264
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AB2B6135E93
X-Rspamd-Action: no action

On 13/02/2026 10:19 am, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Package "bridge-utils" have been removed from the official repos, it
> contained `brctl`. That utility is used by network hotplug scripts,
> but they already check if it is available and switch to use "iproute2"
> (`ip`) when not.
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Right now, README lists bridge-utils as a hard prereq, and this is not
true any longer.

iproute is also listed as a hard prereq.  Should we merge these two
lines with a logical or?

> ---
>  automation/build/archlinux/current.dockerfile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
> index 4e53c835fa..a257027772 100644
> --- a/automation/build/archlinux/current.dockerfile
> +++ b/automation/build/archlinux/current.dockerfile
> @@ -6,7 +6,6 @@ LABEL maintainer.name="The Xen Project" \
>  RUN pacman-key --init
>  
>  RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
> -        bridge-utils \
>          bzip2 \
>          cpio \
>          discount \

If you're making this change, I'd like to dust off patch to convert to
heredoc and get both submitted together.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2CC53C01
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 18:43:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160427.1488573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJEsZ-0008WE-6M; Wed, 12 Nov 2025 17:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160427.1488573; Wed, 12 Nov 2025 17:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJEsZ-0008To-3K; Wed, 12 Nov 2025 17:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1160427;
 Wed, 12 Nov 2025 17:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiA8=5U=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJEsX-0008Ti-Dh
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 17:43:33 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ad5a67f-bfef-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 18:43:32 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7092.eurprd03.prod.outlook.com (2603:10a6:20b:2da::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 17:43:28 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 17:43:28 +0000
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
X-Inumbo-ID: 1ad5a67f-bfef-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EI/2DnmMa07WqBfFT3nXpVxDqc2mdp9alat+poPT4hGcYSSZCBukt/6F6c6Cs9HRUn9ilwivcpQeTXFq2hfRWED9NjTbnT5kqxn2BMjuR60u6kGM6RUW1v0bHBSv/pA9Wk5UW+47hgK1YmxsXFTcwkWx3mOveei9ldDWPHInW4vPwnyvDd4J9f63/9eDXp9tRFXsS+/PNfD86bPUHyHPtr3CSzzfCT//B1OuOWFH9OYQ/kLcJFw+WVhU0F56Nt6Bl1Co7INTNXf5+bNwog76WxGNsBBrzOt2UMOpdD/17cXalYL33nTYM7wURNF66sMoZj24BIE+tiYVpby05zAavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgXVSZKXyuLA2RhHH8YGNr86VFo+6JSzHJCAS2d3nYc=;
 b=FCy6ODgeZx9r3vCDdnxSF1tnAi3JEGcHBO/7IgP0OXP3TbG3tkStKKhgSeFf78CgjDZlh5/IS+B6b0/q+6I7Pd+d/Ow70TEAe4ppJnp+fSyH2hZhbmCU/uuyWMLpKARk7cPmLtJYngCm2KKH/biyXwgBCneaic03hDd4AQa7X3YMKYmxfiV9MO8YICdk+nRsP7C/3720ndIQ4k7GXtGufrqUjt3W8U5W4V8tI4UbDSg2QrTDv6C2fQgcsD7ZyZbqQijS82ByFYMEBWSW9QXZvSc/1hxJI2GQO4Rn2nPxsSjruPK2saXSscjHBDDqSOsCuhrgIHjYoa61om4/rsEU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgXVSZKXyuLA2RhHH8YGNr86VFo+6JSzHJCAS2d3nYc=;
 b=I03BWNy1FNCzDHGfdxCw2yJZHhrnS1pYp5FXVVrIn5dSipKM44/y1OhlaM4th9Finu4CotIQ/ctv3gAS8/AyA03mNirTOd47EO/L2z0YlZWINgCrKFi7RLoXive2lPNrAiNMDhZjCX9kTyHqlkwxv5mCx7/MkzmIDSZ9hj543cxXnv5CdfxRR+SBLN10wQ5PoqGf32y9MTgV4tq36g/4U+Vrto2HXz0lYtzUtC7hDsyU32SLcIFGG8c1WymIAxrPiM+W6Tm5gKzlYYW0nfzvyyNLuYGEcCcupuAbg1CveMKYb1JTRX3DSql1CDUuChMUgBJuPwsiOprpQfdVekx2MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <51f5ea06-96aa-45f7-a90b-50d7be1c10cd@epam.com>
Date: Wed, 12 Nov 2025 19:43:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Lira, Victor M" <victlira@amd.com>
References: <20251107181739.3034098-1-grygorii_strashko@epam.com>
 <47f86a44-007f-4b90-9656-b2440238b2ba@suse.com>
 <f0a5a939-7d66-417d-8a88-34cc172623e6@epam.com>
 <faab050f-677f-469c-8bca-93c55a53165c@suse.com>
 <a858cfd2-c6cc-4ed1-bb12-8cad488f4542@epam.com>
 <be5586a8-bb32-448f-b249-538d1b65f626@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <be5586a8-bb32-448f-b249-538d1b65f626@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f520de-2d3e-4976-02e5-08de2212fccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0xoUjJ0aXZUamsxbFBoK01hUlQvUnovUTVpc0R0MlJrT1FEUHR1aEtBM295?=
 =?utf-8?B?aTFGU3NwQ0NzeUFCNmRreE50V2FmVHRxWStLNllDdWFWVG12c1FNcFkyZ081?=
 =?utf-8?B?KzRzcWtYbFA5VCs5OGZ2Uy84Q05uODJxeTBFSUJ4aDlCZzVzVHhVTVNWMDRX?=
 =?utf-8?B?Zi9TOVZQbXAvY3h1WG5IK3I5QlFaNzh2MU9LU3FLUW1DNlI1TGh3TDFaTk52?=
 =?utf-8?B?bVc3KzJaSkNUUVVkOHJqVFltc1BHOCtab1dhZ2RQbndRYlRPeTBtalo0OUlk?=
 =?utf-8?B?aXNGaXlVMDZ0NWlhblRXTlloVDJFdzUrS0hDUDFxbFpGc3UyNjNXOGh2citR?=
 =?utf-8?B?YzM5ajhIUi9XTFN6VTR0SERXQnE3SXdKSFJaQWk0dituK0VQVUc2RDZlOVZF?=
 =?utf-8?B?WXRvUVpERTV6blpuVC9tRngzUFBwZURBdnNVOCt0eFpPWldmREpjbHhTYVJt?=
 =?utf-8?B?aHNNM2lZVGlvTVNxTmdma2M3SkxkYk1JT3NGU2pGNkV6NE5namt3S2Y0S0Mr?=
 =?utf-8?B?NjVWSEtRcmVsRFFGYVdOYzNUaVdIemh6UnN4cjJpUWY1OXlxS00wTlF4aSt1?=
 =?utf-8?B?d2dISW5QMEFKeVdIR3NMSXl5WVVydmFDMGZFYWVzVUI0bmE5UEptTnhOL29H?=
 =?utf-8?B?TlFtNUxUdFhtTE5sSVpBMWNqdlVWcGo4Tk5NSDVCaHEvVmVrS1NkWFR6YlNa?=
 =?utf-8?B?YXFxckJGcHdPb0xRUDE1MExBakxjWFcrZWk1V1A3cmNubjl2cGZSZ2xneFhy?=
 =?utf-8?B?cjMxN203cnJFMi9nWlN6OTVwWDhad24xN2dNK3FvakNDM2FReDhqS2pHWnNs?=
 =?utf-8?B?bnJKcW4xV0lZSlA3TG1ZaFUzYXJ6Wi9rdkt5NUhnYWxTU2M3VldZN1hyK2JF?=
 =?utf-8?B?dkFDK3kzb2ZQaCtwWEV0M2lwQ0liYnBNWmZNaWZzTUdURHJvL2NWZDZlWmg3?=
 =?utf-8?B?L2NEVS9SOXhrdHJxTzE5ZDJnbzBsYXlMUnBIZlNpdCtaLytNQUI0WFhJRDE1?=
 =?utf-8?B?T1dIODhYR2p1OEF0SWRJR3JXanhId1JYQW02RkpVTzQ0Zzh5UjlIUy9zNG5X?=
 =?utf-8?B?QlJ5RXJPdTlLcUt1bldUZGs1akpEbG42ZHA5YlhEUmJ0cGNFVCs4R2l1aGZY?=
 =?utf-8?B?YUNQZFIvaXFmVHJTWXpoZkV5R09OdkVVdG1PbTc0aExBbmkwQVl5R0szUkJn?=
 =?utf-8?B?RG1jQlhrR3FWblpUU1lzSDhPcFViWUFCNW9ES0N1QisxaWxFU2c3SWdmNDc0?=
 =?utf-8?B?UGVmWVFUcGltNlA2Wk5kTyt0R2NEOEZvQkdmeE1BU3NnbWgxMnkvOVRGamRi?=
 =?utf-8?B?bys1dXY5cUdKUUlFam50ZXNvd2hHU3U2Q2tYSGxzaDdzaXU5ZkJlek9TeXFn?=
 =?utf-8?B?UnNkcEhnYmorK3FaT1laRHB6UGRBZGVYQ0NNcHZVcTFrU2NKazdXRWthMUxq?=
 =?utf-8?B?a2wydHRDNEdwWUgzZmRNcTFsdndrcmIzR0tPeklGK2JQL3Q4czU5VmlPUXlC?=
 =?utf-8?B?UnEzOGRxMldNV0tReWpGaUlxWFBQem1LR2R6VVVUSmRzNitjN0pnRlk4SXFh?=
 =?utf-8?B?Ry8xTGVPYTA1L2EvMFhXci92WnkzaUlYS1lhNnM5bmZoaUNXZUc5QThCN0Rz?=
 =?utf-8?B?cGJqVGhJejRicE02S0toVWZXOGtzN01mN296MGtISkE1NWkrdkMySE4relBE?=
 =?utf-8?B?RTZSMVdKTEpkQTQ0VHlQcGQwelRZZWtuY243enNqR0xsYmJWRTdVaFpnZWZK?=
 =?utf-8?B?ZHhLdjBLbWtXN25hUjdJVWpKazBTOUcwVS8yODU4aURlL3JxMDM1T0lOeE9F?=
 =?utf-8?B?dUtGQnR0eWlrMXlIYjBHcXdlKzB1VW1EUEJqOE01VTd1TUd0MVNiZU9wQUY3?=
 =?utf-8?B?QWFXa3dyYlZSdkhkbXp4YUVLbDNnazdXMHZveXp6bCtQZGtGVXFXNDRwSHVL?=
 =?utf-8?Q?FDwVE4DUvlpPbJGNDjJLQtj2uJmG7bWd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTh4ZGE2MTZjMjZGVFNoOHJTY2EwSDFwOVJIMk11ZUo4OHNmRC9qNVpSaEo0?=
 =?utf-8?B?c3VhMCtwbUF5bzllVEsxOTBXNHdENzZBZE1UanNSK0tNM2YzbTRUdmtVc1l5?=
 =?utf-8?B?SXA5em1YQWFhZlFIMXJuYUhYTmE2amk1a2hRNlZFV2UxZTIraEVOV01DbGRn?=
 =?utf-8?B?dHphVEhTRlVYQUpDZFRvQ1dzN0hKdXNZWEEwL09RSXlMbUVuTWNTTSs3WHpX?=
 =?utf-8?B?U2EvQk5TVVdhSVM3cENwK0psL2FRL0RrU1hlMTRYWUpiWCt5dkMvUUdCM2ZS?=
 =?utf-8?B?Z1g5VzZ4YitjODNXM2RVaTNKY1VBWmF0aE9yNlAyMzg1bTAxV1p0NzhRdmtz?=
 =?utf-8?B?WXltc3kyMXYxd280Z2VnSzkvZHpBRlNEOURlUXZMQUNXTVpDVTFCV2laRitZ?=
 =?utf-8?B?QVcySEl3VjdrWnViTWdKZjlIZ0tyQTJvOHZrWTNQcDNoRThCSVZhcTN5TUd4?=
 =?utf-8?B?ZGRjVldDT3pnVWFweDdjMUZNSXlWcEFBV2tWSHVscXc4Wmt4aFE5Y0w3SzVj?=
 =?utf-8?B?dlVOMFhKNkpMNEhwdUhYLzFJdFAzTzhWb25JMkJlNzgrbmRabDZpMVU2TzBI?=
 =?utf-8?B?SGdSck4wcHB5NDduVldMaGdzY1h0azBYT3MvZ2VBYS9KMjZieTE3NGxoZGZY?=
 =?utf-8?B?VjVoSW1KNVB3eDFCZFNIemZPVlRpL21iem9EcmxPZTdMcFZUelo4T2t2dW9x?=
 =?utf-8?B?bkNaNEQ1RFpxRjltQWJhRGVlS1JuOVNKZE1OcGRqNWlubjZyQ1hUTC9CYXV3?=
 =?utf-8?B?YVVxblp4cWJiTXBadVdDSk51NnRDVWtnOUk5UWdYYlNxcEFDM21hWVpMSXdo?=
 =?utf-8?B?MUUrSVMrbVMwOGcrZDNVVm5VR3U2VDFCM3IvZzBpbE5mQUIxYUlBRmttSlhh?=
 =?utf-8?B?NTJwT2swQXhlZDRkSk9uQUFnMlczYUE0dm8wSW5sLzZhNjJodGwvQ1BkRWV0?=
 =?utf-8?B?bHc1SDhkMXA2NzhIZ0swb0FpNU4zeExZenhWQnJyVEY2VVZoREJ0RzhUSTNt?=
 =?utf-8?B?SzhnbzlacitYeWpXckxOR2J5aDNsL0YrOTdTM2FLcVo1UmRUVXUwSzUwZVFj?=
 =?utf-8?B?d3dPM0xXWDVtYkJGSEhwMUI1UWZlc3FBbms5N0paQzF4OXJuMWdPcEUrVVJm?=
 =?utf-8?B?OEVqQUk5emc2bU5oT0M4OTJkUjQyTVVLclFvb2l1Z05xMzBKM1hRMkVOcnhM?=
 =?utf-8?B?Q3ltT1h1OG52S3lXaExBR2FjWDNRdnJkZGk4cTFHNld0cGFnSUFCOUVvdkdN?=
 =?utf-8?B?cjBlNlJVamtveXlMV2RMeCtOUGE4VzEzYUdEeDBhR1dIeFErUlN2N3g3NlBx?=
 =?utf-8?B?N3hvaGxSdmJ3S1BTMDRkOHZqd0hWT2UzSGtrMm5STDluY1RhdCsxYW1DQUV3?=
 =?utf-8?B?aXRkVytFQS9wSE42OEtHb1NTT0xBL2RMdXhCV0prTkVpMGI0dTh1UEFER2E5?=
 =?utf-8?B?eFl3Q0RXbXFzK25hOU9uWWJ5WXdWT3lTWHpaeDBLZEJicXQwN0R3bjJ3UjhX?=
 =?utf-8?B?TE1VNjRWYURlQUtEV2k4cUFITUxDZ2EweXhPS0xPSS9OT0NzdjdxWEZLcFBo?=
 =?utf-8?B?ZWRLRHZVbGFtWno1TzRaTm9NZStTWFlRSzB5MDdMUlZMK3N6MDVHNlVNVUVz?=
 =?utf-8?B?WWJjOHp5d2cxM3RtUUZsb3NtNHl3N0dZNWNIK21lMFQvaTl0OVU1VkJVYS9w?=
 =?utf-8?B?ajBrSDRSZVlZeVgvM3EzN2dOMHdvdUV6alFSUEJSRjRKbTh2M2Ezcy83dFpK?=
 =?utf-8?B?aDJpVWdBSkFGQ296bGVVM00yMDFTQlRsZ3lmOUN6VG1DRzdrdWVMOUF5L0xn?=
 =?utf-8?B?d0FnbWlCV3ZTZmdXN2taSXdWWFl0OHRiYlRpY3NLQVgrTDUwSWJBbXFQNzV3?=
 =?utf-8?B?NHE2RWlMOUZDNEVaYjhtTWVyQkZrdVhSd0I5OWF2MEM3UndUNUMyQXUyNkpw?=
 =?utf-8?B?Y2JnL28xdlhvVzBiWDdTSGx2cGVaTjErVjJrWURaK2w1T0JsamRoRy9wU3dV?=
 =?utf-8?B?MUloNVYvZGp1dXNBRCtPdWZvbkZTcEc2M3UrdFBEMEQ3eE1EQnVab2RpSlRs?=
 =?utf-8?B?TUdhajhaSTFoUFFmNnRtZno5Yjcxb1EzcVE1c0FIS3d2NWJHRWE2eEkzNnVO?=
 =?utf-8?B?ZGVwQlR5L3N4aGxrKzB5ZFpXTTh5eU9TL21OVFVuWjdWUUdXSVNnbVlTTEwz?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f520de-2d3e-4976-02e5-08de2212fccc
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:43:28.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY4lcNdzTsR5DimLeT4Mwh5QP2ZR/wYHZF+/ste0U6qNrBwm8vERFjXVSTIyeClnYMs8W+FsWaYsactLesrFkc4bWHI2CxL9ImtA0USWM8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7092



On 12.11.25 15:07, Jan Beulich wrote:
> On 12.11.2025 12:27, Grygorii Strashko wrote:
>>
>>
>> On 12.11.25 08:38, Jan Beulich wrote:
>>> On 11.11.2025 18:52, Grygorii Strashko wrote:
>>>> On 10.11.25 09:11, Jan Beulich wrote:
>>>>> On 07.11.2025 19:17, Grygorii Strashko wrote:
>>>>>> --- a/xen/arch/x86/include/asm/guest_access.h
>>>>>> +++ b/xen/arch/x86/include/asm/guest_access.h
>>>>>> @@ -13,26 +13,64 @@
>>>>>>     #include <asm/hvm/guest_access.h>
>>>>>>       /* Raw access functions: no type checking. */
>>>>>> -#define raw_copy_to_guest(dst, src, len)        \
>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>>>>> -     copy_to_guest_pv(dst, src, len))
>>>>>> -#define raw_copy_from_guest(dst, src, len)      \
>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>>>>> -     copy_from_guest_pv(dst, src, len))
>>>>>> -#define raw_clear_guest(dst,  len)              \
>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>> -     clear_user_hvm((dst), (len)) :             \
>>>>>> -     clear_guest_pv(dst, len))
>>>>>> -#define __raw_copy_to_guest(dst, src, len)      \
>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>>>>> -     __copy_to_guest_pv(dst, src, len))
>>>>>> -#define __raw_copy_from_guest(dst, src, len)    \
>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>>>>> -     __copy_from_guest_pv(dst, src, len))
>>>>>> +static inline bool raw_use_hvm_access(const struct vcpu *v)
>>>>>> +{
>>>>>> +    return IS_ENABLED(CONFIG_HVM) && (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(v));
>>>>>> +}
>>>>>
>>>>> Without a full audit (likely tedious and error prone) this still is a
>>>>> behavioral change for some (likely unintended) use against a system domain
>>>>> (likely the idle one): With HVM=y PV=n we'd suddenly use the HVM accessor
>>>>> there. IOW imo the "system domains are implicitly PV" aspect wants
>>>>> retaining, even if only "just in case". It's okay not to invoke the PV
>>>>> accessor (but return "len" instead), but it's not okay to invoke the HVM
>>>>> one.
>>>>
>>>> This patch is subset of "constify is_hvm_domain() for PV=n case" attempts.
>>>>
>>>> It was made under assumption that:
>>>> "System domains do not have Guests running, so can't initiate hypecalls and
>>>>    can not be users of copy_to/from_user() routines. There are no Guest and no user memory".
>>>> [IDLE, COW, IO, XEN]
>>>>
>>>> If above assumption is correct - this patch was assumed safe.
>>>>
>>>> if not - it all make no sense, probably.
>>>
>>> I wouldn't go as far as saying that. It can be arranged to avid the corner
>>> case I mentioned, I think.
>>
>> do you mean adding "&& !is_system_domain(v->domain)" in raw_use_hvm_access()?
> 
> No, we want to avoid adding any new any runtime checks.
> 
>> Hm, I see that vcpu(s) are not even created for system domains in domain_create().
>> So seems !is_system_domain(v->domain) == true always here.
> 
> "always" in what sense? It _should_ be always true, but in the unlikely event we
> have a path where it isn't (which we could be sure of only after a full audit),
> behavior there shouldn't change in the described problematic way.
> 
>> Am I missing smth?
>> Or you meant smth. else?
> 
> I was thinking of something along the lines of
> 
>      if ( is_hvm_vcpu(current) )

this condition will not be constified any more for HVM=y and PV=n

>          return ..._hvm();
> 
>      if ( !IS_ENABLED(CONFIG_PV) )
>          return len;
> 
>      return ..._pv();

Possible benefit will be reduced from:
   add/remove: 2/9 grow/shrink: 2/90 up/down: 1678/-32560 (-30882)

to:
   add/remove: 3/8 grow/shrink: 3/89 up/down: 1018/-12087 (-11069)

Any way it is smth.

-- 
Best regards,
-grygorii



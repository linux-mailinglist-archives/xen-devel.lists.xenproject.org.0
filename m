Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qETuKcjAc2mjyQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:41:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287579BAA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212503.1523607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjM5b-00025r-RK; Fri, 23 Jan 2026 18:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212503.1523607; Fri, 23 Jan 2026 18:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjM5b-00024Q-OA; Fri, 23 Jan 2026 18:40:59 +0000
Received: by outflank-mailman (input) for mailman id 1212503;
 Fri, 23 Jan 2026 18:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sxq=74=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vjM5a-0001v9-3R
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 18:40:58 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b1d0bab-f88b-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 19:40:53 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5000.namprd03.prod.outlook.com (2603:10b6:a03:1ee::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:40:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Fri, 23 Jan 2026
 18:40:47 +0000
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
X-Inumbo-ID: 0b1d0bab-f88b-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf4f1qZx9qNm4ZAu0cshiSmFJCQlX23NpZZFNI4Jc6PYnrVbqT/3q1oJzz/TO5G543AYaVGZLjfJ/SAbAia0s4CO2bRACPmOB8W/dLHmHsz6lunAx908KjFbN23RMff16xdW4dlxawXOkc0aA4EZQFyG/FbAm+n9/8jbPw8NrCCSK2dNIlphKFvDGlDpZat2NT/qokJewSY+NBh2Z2XvgtXL+h49pZ1YLF6MvC+gjqREjoOKI7Fr6ILQqWDa+31rJc+kfWMtCDiG/1yzvdCG8vD8J6Joal0+pOrEYI4pKEQqLs8lpPVLQMuRCMMM3nrf/BFPojTas5lDvEm4vRnqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fz4wPS5udrYlnYBDJTD1OiXCF+tx0Wx0BbqzQz+xd4=;
 b=laepI447sqaNfyn/vW9l1B8YHAk8LFFt78CmfJVZHI9qVPzseUJ5G22CpB8Zp6hA1PWiwkwJjCNptWW7uCTcawaANytjU3QQe/0LGeUXNiUhqYmN/Acrd7nAXTR8iZPDkPe08WDeb5bMPRzNcCkYcdw8dHqRHBJzfie2iHpSUvq6wPCq42OXUQ/9yGFPAj8RTaYgoNJH/Tfki0J/DT/sV0o9n9G2aLO+PhlaQJbPZbqiW7hu57skvf9Q/7ZqqJ8veGyq2eJchPPFy18U4LMre3ZyFvVL6EZXlFBdamvPqFD0/FwfxiazlRa8wYkdnya78NOrfivagIloDhaBRynHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fz4wPS5udrYlnYBDJTD1OiXCF+tx0Wx0BbqzQz+xd4=;
 b=p8hAaxqSvb32JUFHsL7espaIRmYWpAGD+8wDeeuTchsWCAbLlq3O8b5gM2CLOImNzyjnxXvHkFXdj9xWBR4OabkmJSh22qB2LIO2bsWA78rcLjtEEKafL9PukeScDK0AOOj/QXwtmDgpltm8hQXmsDNCpmGU3NmjwJUkk78FEqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a7778440-ef82-4c4d-b89a-86d8af3ad89a@citrix.com>
Date: Fri, 23 Jan 2026 18:40:43 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 2/4] x86/hvm: Disable non-FEP cross-vendor handling in #UD
 handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eababa8-628a-42f5-6b37-08de5aaeec3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWtvSno3VG94aGxYY1d5Wmt1cnlvaCtmSENBYnR2dEdrMjFtcjdtaWRkeStt?=
 =?utf-8?B?WmRuN1VYSytRUXVSN2h3Zlpndk8wbkJuRzhMM0tjVTd5NkE5UlNKck5kSkd4?=
 =?utf-8?B?OS93NnVwQmIvVGVGbTFLQk1YdU5QTkRaZm9sNXdNWjRCQjZ4NzJPK1FjSlpo?=
 =?utf-8?B?djJOZkRtN3YxSmptRXYxYWNPQUpnVVk3dlBSaTh5M1BoSFh0RFNZRjBKaUFa?=
 =?utf-8?B?bXJRM2w0U1JVcDhhVEszajJwa3NTMUdta1h3bXB5SE42aTNLcHN5VGtSVStj?=
 =?utf-8?B?TVIzUkliMGUzdE4xUEdDLzZtTmlaZjNNS05tdkQ5WlRRNk9WT0N3eE9mTWha?=
 =?utf-8?B?Q3I3Q29KQ2wyQU16NU9aMFNjN1JZaFlhSWlMVVJNc2tXZkUvMDB0RGMzQVBw?=
 =?utf-8?B?YzdvTys2TGtlK2hMb3g2bFV4VTJzY2RkRTYyRUZ0RWZPYitIME0vZS9UVUkx?=
 =?utf-8?B?QUFsbi8wR2x1Qlpxd2lLdlpYQkJGNWhkSmlyNGVLRTBEeU5RMVZ0YUNDRkdY?=
 =?utf-8?B?aVp1YXBsY214WGduWUVyVFRLeC9BLzhZRTRSbWZKbnFaVDRlbjRNWHlaZGti?=
 =?utf-8?B?dnZ3OGg0bXMrRG1YVXp1anYxZXBERFBNOHBiSU5pNkZENVoyQXEreWpYNUdj?=
 =?utf-8?B?MmYrS3F0ZWQyd1NaZWtaWUJ2RHl2enVIUEppdFc4T1lmS0xBTloyZ3E3aU9K?=
 =?utf-8?B?TEVWYkVjNEZFT09Nc05EWXR4aldVKzdYRVJ5UjFZNGhTVVQ1ZzlqRGU2WGFE?=
 =?utf-8?B?K0tiWVAwT3IzVHErVDAzUHozUitpQjM2eU1nUHMxR3VSKzh4a1lKV0EwTXl3?=
 =?utf-8?B?eEpyN0l0R1V1L202WVc3MEVoVGNRenB6SnpvbnNORVdTU1JSM25tVUN3T0dD?=
 =?utf-8?B?bEhFUUl3Y0VEcmdZbm5DSUlEaXVJUFJvcFF0bEZ2TGRzclJQc0kzL2t6N0Fu?=
 =?utf-8?B?VGFhT0t0aVp0MTJXbUNMbFM0TFRDS3hPeUI0aWdHYTVTQ0FoTW13OHJNdGxD?=
 =?utf-8?B?czQ4K0UwY0xQcDRYbkN0Ry9lT3JTdFJrUHNLR1FOeDhZMWFJK01yazJ4aEt5?=
 =?utf-8?B?cmwrTjd5RGg5LzZGNTBKcmgyc0NTYVNaQXR3M2syT2FFYlMxY3AvSmFOYUpI?=
 =?utf-8?B?K09uMXl6aFNZZTdoOWpSNE1VOThTRlpFMnRQMWUxUlhxM2pzR3hMSEgxRjIx?=
 =?utf-8?B?a0llMEw2aFRqUXJwMjRPZTdVckhzcVp0Q0FaSTJFVkR3eTlzMm93eXRld05y?=
 =?utf-8?B?aEJmS2VLRHoxUkk2N2pmT1l4WENENUN2Smx2QkYwT092RlZPWnc4T2EwSDRn?=
 =?utf-8?B?N01ZSEFBTERUaEhXUTZEZWVCek1IVkdOSGV5UDNlMFZDZitHMFBoSFdrbEZY?=
 =?utf-8?B?Z1N6Vzc3MkdTSUVoazlhNURtcWNPZXo1aVZYcmF3VWhmbG9xUnAyZjlzRHFV?=
 =?utf-8?B?QWllWWUxUnZvMVNBckhsNnNKYTRuc3ZOWjBHRHI4R0Juc1JNekludzhFMTVn?=
 =?utf-8?B?b0dxYVR5SGFZaTUzZ2QxM2IyZFZsRHJpcHhaSmdmTkxteW5LaWZod3JsUUMz?=
 =?utf-8?B?NkwvWU02SkcwZHFISFRvaEJENHpYMjJKU0lZSkF1Q1BPcG5OaXgrZ3RxRTZ4?=
 =?utf-8?B?cnhFWEgrVmJZRzlQRXRaYWFreTBVMlFiTE9Jbk5vaDBnTW1KMlptRExKRXU5?=
 =?utf-8?B?dHZDa29RZktCS0xHNXFZd28rVUV5bjdINUN3ZHluOElTcW1uZDBOb1BDOG1C?=
 =?utf-8?B?TzArY2x2ODIzUldMUEVHK3ZveHdMKzhvMkpFZklYWDhvS2RmbEduaDZqeDZM?=
 =?utf-8?B?TDJWWHRTYTdac1owNE1QeXlqVVlaRGNYcDVEeWJjMDZCRFhKeXdRWGdHMVRp?=
 =?utf-8?B?eEpSSUZDQ3ZlK2t2LzZLUUZyV1FaOWhmSVlvRXBQU0lXdUlqY2VrMUxPaGxz?=
 =?utf-8?B?ZXNxRVFzT2hTNGRsbGtrbW04bWUzc3JzUkV2blNjUCtlVURxZ1lkOFpzNGEx?=
 =?utf-8?B?Rk5TcnRReFBZOFIzTysyN1R3VTNUNlJFNE5YUnpDeHJ0TlJ2cVBxbFh1aDZ3?=
 =?utf-8?B?dHdPYkFvYVNMUkV2QTJ5bWowZzBrSGRJY1RRT09LVUJoZVNaWmFrZnRodWdv?=
 =?utf-8?Q?3B9k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3l4YzBaQklUaXhFRG5UbVBWRFNIWjM5Qlg5ZmRBVDJnRkVhMFN3K1B4ZkVM?=
 =?utf-8?B?OE91T2tPZmsrZjAzRjBKd2EyNzVwMm5Na1hYVGRnejRLZTQzZkVoZkNuZ1ZX?=
 =?utf-8?B?dUoyNW4vdURsZDBDdTNEVFU5RXIrOC9zMXpSL3pqMDhzOVpPT3Y5eEFlT2xW?=
 =?utf-8?B?bE8xWWhya2NGcGJ2SElHTjZHcTIyT3hRclRabnM0NEplK253TzN6T3JmVC9i?=
 =?utf-8?B?VzRXbE1KVHN6TTNwOHl5bUxaZzJUTWRBbGE3ZndCVFh4Yk51TjgwOGxvNE4v?=
 =?utf-8?B?TzBYbHVjRE1WdjJFUW5TamdpVDIyYk53dGhEbVlrcUF2Zk9jTzdLR0lkQlEy?=
 =?utf-8?B?TWExcCtiUUtuaTJjM1hISThQNDk0RUx6ai9qTGNVVXAzWlVDUUlZM25QazZN?=
 =?utf-8?B?Tm15WGtjemtmV2pBRzlaVGpwSHN5eXdhZHJMeXUxaFdqSEdmMlhuZWNoU0hL?=
 =?utf-8?B?ek5HaWJ3RVludDZxamxQR0huVm9vMDQwV2lVQmE5ZFFqTHFMeDlIeUIvWDhO?=
 =?utf-8?B?UDJ2d3BPeUx0bVZ1ZGQxalpiTWZFRkVlWDBEZ3Z1di93UUVjeVRNZG01aC9Y?=
 =?utf-8?B?dHEzOFdpdHZOZVQ1Qm9OUXlad0dUdVh6UHQ2T2N1ZXIxMFowTm9xcHY4b0ky?=
 =?utf-8?B?dUFrVWdwZ1UxR3o2dUozY2RXSFJpdHhoQTlCN2FpbU9LQVBpZ0M0SWFCd2J5?=
 =?utf-8?B?T3VpZ25yS0ZVNGM0bVdmNFp4bTNlaVloY0dtenBUV3M2UUtESlVjV1FGYmUx?=
 =?utf-8?B?eHRqNHgzK0VSa2hwdlZ6Wng4Ynd0U08yY1cwMXRKSWpOMDZmZEVsSTFvemtu?=
 =?utf-8?B?VFlZRGo3UDBDWThOUC84WkpkaXozK1hUd0RWRmFHc21IY1FoNXRJWEVjUVRT?=
 =?utf-8?B?U2ZVTExjYjgrc05ScUpWU2FQQnFTTEdIWjNUUWNycG9ieVJ3ZnAxUWQ1M0JV?=
 =?utf-8?B?UkI4dHNWdlJ2ZEszQXlmY2hwUjhlZ2wyQW94UG9TOXpyYkJ5dE5uVjVDbHdq?=
 =?utf-8?B?MUN3dkFNbXluWUhsVXNscnZBRFBWUGJYWCs5bndnbW80dmlpSWthc1JXdjlV?=
 =?utf-8?B?S0hUWEdnckNqYlVYRCtETW9WYVE1Qml0OHZsL3RFb2UzMFBaMWh5SjZBdHRU?=
 =?utf-8?B?WEg3VDRvSmdyRitLUWlCTnRvMGdibnhSUzZrMTN3SEZuR3dwYXEvQTVCVWRZ?=
 =?utf-8?B?Wm9OT3dISFJFNVVpdkF6RUwwS2c0N2ZXRFpxR1JtQ1cwdG5PR2hWOHNZWGFI?=
 =?utf-8?B?VEpRcG8wb2RJYmRkNGwxTnA5a3RXMlgrWGllUHVsQ1pBUUlyejdJTDVKeHFB?=
 =?utf-8?B?N0l6Zjd4b3Z3ZVNSTURDNXduTURaQ2lDVXF4dVh1Qy8rdjEzdnBLRHlLTncr?=
 =?utf-8?B?b1c0ZGYyYm1zVExFQ1NtN2xReWsvNC9hUU1NeVpPOTdvTzlNUS9OVTlUU29w?=
 =?utf-8?B?N1BJcFlNTUk0WTI2K1paY2dBN2M5Zi9HQStnOXNuQXkrcU5SMDY5eTcrTEE0?=
 =?utf-8?B?SkNJSHNndTlpNUpabGs5a1pwUXJSa2dhQ1FpMm1YQUZmdXptUExDclRNRUxm?=
 =?utf-8?B?MDJ2eDNjNWdHUUtNYlhoYjBEWUtnWEJlUVE0aFR5c25NS1dWVVQvL1JjSmZL?=
 =?utf-8?B?RG9abEVjMkVib3VmRDlVVGJnQ1VuVU9lSjRocXhFWTFRTytoRXMyMVU4WTVn?=
 =?utf-8?B?SXpYQzNnVy9VaFhWeTFmcC95dXRiSm9wcEVEcWd1NzdKMmxYMWppSWYwS0p0?=
 =?utf-8?B?NDBXc28yaUZnVVBySmowZ2F0aFlaV0VwSmdTdnNYWW1KWWZVeElVdmpSa2VY?=
 =?utf-8?B?NkFrUE9lWVZseWRCYmQ5VUxXYjBIWXM5dWNzRTRuaWJ0TlNvNGR4V1Y5aHBT?=
 =?utf-8?B?OC9QNXVxV3liY1Y4aldVN1lDTGh6RGhVSkhYVXVReDJuV244WUJITTFIWSt5?=
 =?utf-8?B?dHk5Z2dycm9Ka0NEZ05CRG1hOVBDUisvbEtIYWtwcUJybjFpN25iVEg2YnhE?=
 =?utf-8?B?L2JzMGpFREJ0Zm5xZnhMZUFtNnF5dytTRzJmdVpTSGcxRzdJV0loeGZaK3F3?=
 =?utf-8?B?OStEQkxNVlFFa0V1azFhOU1oMk1mM3dhYWZ6dTJWejF4ZENzaW0wMXMyaEFl?=
 =?utf-8?B?RkxLS0puWEsyU1pJWUxpVWJ0WTVneVBVOUllS25MMWxGMHFMYTdKcTJLa2dG?=
 =?utf-8?B?N3FRS21jNDVmTFRXUzUyYVVjN0tQenkzNFh4anF4SjhHMTdGUkhScHNuaWw5?=
 =?utf-8?B?T29qQmZlZTBQN3ZETS9Xd05SVFpESnpQaXdEMWxaVmd2V1NRc2RpQ0ovaDR0?=
 =?utf-8?B?NTlSYnU3SThMSmhHTHQ0L1FqSnpoYjkrc1hCRU1PNGt6ZS9YL0hJQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eababa8-628a-42f5-6b37-08de5aaeec3e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:40:46.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3buUlXEJCVLHCFmSt/d8rHZ/+vIbp1YweEINhujSH597olPR41uKSFgad9sKnswZlYBL8tRlCG4dA5Q9TBO1RwxZ1HcXU1W55iBXr+y05g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.898];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3287579BAA
X-Rspamd-Action: no action

On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 40e4c71244..34e988ee61 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -797,8 +797,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
>      const struct cpu_policy *cp = v->domain->arch.cpu_policy;
>      int rc = 0;
>  
> -    if ( opt_hvm_fep ||
> -         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
> +    if ( opt_hvm_fep )
>          v->arch.hvm.vmx.exception_bitmap |= (1U << X86_EXC_UD);
>      else
>          v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_UD);
> @@ -4576,6 +4575,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>              /* Already handled above. */
>              break;
>          case X86_EXC_UD:
> +            BUG_ON(!IS_ENABLED(CONFIG_HVM_FEP));
>              TRACE(TRC_HVM_TRAP, vector);
>              hvm_ud_intercept(regs);
>              break;

Again, nested virt makes this more complicated than to simply believe it
doesn't happen.

Also, more often than I'd like, I enable #UD interception for other
reasons, and I'd prefer that that doesn't get any harder than it does
right now.

In an ideal world I'd have already upstreamed the logic to decompose
double/triple faults...

~Andrew


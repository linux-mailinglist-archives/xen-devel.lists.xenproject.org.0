Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJbKNC1nnWlgPQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:54:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9A184097
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239532.1540936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoAO-000197-0f; Tue, 24 Feb 2026 08:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239532.1540936; Tue, 24 Feb 2026 08:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoAN-000165-UE; Tue, 24 Feb 2026 08:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1239532;
 Tue, 24 Feb 2026 08:53:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vuoAM-00015z-Bw
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 08:53:14 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eebbad5-115e-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 09:53:11 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7816.namprd03.prod.outlook.com (2603:10b6:610:210::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 08:53:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:53:08 +0000
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
X-Inumbo-ID: 3eebbad5-115e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuHYKq8m1i2xEdIqa43Q4wFgzpaPH9iRQ5z4W2l0oEBYQohrxWHBX+s+NMkGSxz14cCpHOj2oX+Gt9aGTlx1HyW2JLulgp6sJ/3AiJfSFZBxo3G+UE/FKI/rZhlyXtrek3+69kHdhO/nU0/u0WKf+/yEONYMzxJCpOXxpCfIca/vMbMgZUG/a+aBXFzjf5KJjh0tkG9A7g6UP+K34w5xP/QKqJDIuqntk4BHBzFFum4ppTsCfCvUJrySBEUTD3/detEHi0L86BGjFVw/rN6C1yuX+uiclz9xm++TbrmLbSiYnxKo6Xxj4wX5Y8i+2a83B04fSpzdmWv43bgWGP2HUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaK/nnNJWzHaNc7e1YCLZ0K2DDioy2q+G1cdmPzMmTM=;
 b=fbAv9qXcl5gMpqafii5uL69483JV6eI0A3iy8SBRlhWe+WhPTKc1lpt7Nq6AUBbL/CoGbS1zv234qUbMfEL8G8mmWNgClA3juB2cZPgH7A9mznfhypeoT4or+SqIPSDxaNVfJL2EHDth/z0Zkbphvx9/bHsyz14dIgdWOLqID7qqbzv+TusZ9109BOk+ig1N8SS+wuvWJakFsAwb+ZSg1rAIQVcMY+elgn8WFErRvtgBNqdv3MlvtGQKaFPYkLwhlqWxxb2wfLYSGZrsiJ5xR3SZN0P1qFpF7g1ITmh/p44PRKzS6S9TXkdeJ6u07FjHlLlmlnlxByYTrvg0kEBI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaK/nnNJWzHaNc7e1YCLZ0K2DDioy2q+G1cdmPzMmTM=;
 b=xRFzRxjbpOW8Bjky80IGRwlWAaKK43sRCj0QEv7RMImlJXIvzgAxUae+zT8aDpHM8fKfdzE0nCx/bfJ6pgVkDjxbwmIVIsiQiVMDsmOAG6Q2D9tMlRlbkrd51mHmSOthphgYp7Jv7GMsECa4BrLlJHtKAP+60z/iZaeUnsO/ug0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Feb 2026 09:53:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] x86/cpu-policy: move CPU policy library code
Message-ID: <aZ1m8ZcXyiEBk1Sf@macbook.local>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
 <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
 <d8eb4220-da82-43b3-b0e0-9d006f68877c@citrix.com>
 <e5e75e36-a383-4506-8e59-288faeffb614@suse.com>
 <1d85f83d-45c9-444e-8db4-3e0962aad0a6@citrix.com>
 <11c2f97e-efa8-46ea-8605-4ce6cffb9683@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11c2f97e-efa8-46ea-8605-4ce6cffb9683@suse.com>
X-ClientProxiedBy: MA3P292CA0061.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 667cd41c-38c3-4d92-efa2-08de738221c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkhuSzRGYU9aSERTZzA4RHd2c0VFbjJOa0dKMkZ3R1EwaTVmZ3Fwek5jeE5F?=
 =?utf-8?B?NlhmbkFEOU5iNGVoa0xpeWw4Y1VKRmZqWEtEY0dPcFdSaVYwSGNNbHlubEk5?=
 =?utf-8?B?MWlRTUR5WW9EVVJseVRMYkhBRUJKL1d4OGhsNDZ1VVZ5NTVNV0xSM2VqdmtP?=
 =?utf-8?B?VDN0OWtFRlp2cWxLUG1SZk5RZGVHTzJsMmZUUktSOExzY2V4bG5UTzkwMmhI?=
 =?utf-8?B?aUV3YXhCanVHcXJ6L2lVeElrc1EweTYwczBaS2FwZEJIdExwYkJHeFhmZmxs?=
 =?utf-8?B?azlWTDNHeURFektrc1lpZkwxN3Bzdkk3L3F2Q0NUZ3ZZdkJ2c212bGRpTlF2?=
 =?utf-8?B?dVJyeTI2Q2JiS0RkUEVaMklNb1YrOEhURVY4d2VvRGMyWkovb2o0RkdZbGE3?=
 =?utf-8?B?M3BjV0Nmd1g4U3FXOHE2Zi9GNXpFaG5LNVl1OVhKNHpQSXQvRVF5enU2R1cw?=
 =?utf-8?B?SUphL0JwaTlQVG9qekFnMFc3TXFOd0Z0ajBLRXc2aHYwTnNTSUJBRjFUYjNC?=
 =?utf-8?B?RHBacEJraTAwdkpxUTViMzZiMVJWd3BKZlJIYld2MmQwdTVoOHB4dGRzR1Jt?=
 =?utf-8?B?NFlaZWxLM3B4NU5uR0h2WEhXQkEwMEVqQThxdFcvOGpOVFphNzNBeEtUNmJB?=
 =?utf-8?B?L1I5bTNrMGw4cC90QW96SGpWeStUZUdlQUlDRnJ4dTVHc1lEN1IzVFhjMDVp?=
 =?utf-8?B?K2Jtazlpc3RjS2V3d21IYlV3TFVmZFFlcWYrQ1RWeCtJSE1nanZKM3R4ZTk2?=
 =?utf-8?B?cjdMUG1jU3lCMU1DWkU3MExtWGtKZVdKMldrbEJvanNqVk9OaXN5RkVYVU9h?=
 =?utf-8?B?OGRkdUgyQXBxckxxK2hzT0pmN1I3eEhPdm1KdGdDdjc1bjdyL1RqbnJGcER3?=
 =?utf-8?B?OEJkbGg1dGlVNHRnd1ludWVWcGcveXpldGZTQlVsTklvWmJ2SnBIMWh5bTJQ?=
 =?utf-8?B?MHRWT2dkRWU2N002bnlRNjN5bVhnS2xsclNjei9FUDI3SVE4RTFwS1pHWDAr?=
 =?utf-8?B?QzlpWTlKUk9RSW10WGVIRTBxc0lueEZOSEM5UHQ3UXBnZkxKS3ZSdVN4WEZt?=
 =?utf-8?B?bVkrRC9IMXRJMkxiUTV6b1p3TmQ1WmNyeXFWbE5JWFozandwR0Y1YndVNEd2?=
 =?utf-8?B?MWNNUjVWMVJjbHIvZVFHNTAvVktsQUpoKzR4Y3ppYjdteWhTYTZ5dmVrSU1Q?=
 =?utf-8?B?WFE2MnNoZHdYbWtPQ29sclgwMVl0dUh5MWVVS2JLOUs3VnJKako5UEZ6Ymx1?=
 =?utf-8?B?T0pmdmxwUXRoMHNkYjc1WlFZSTE1bVBucHRXcDNFTUtaYnkxa2F3WllJYS82?=
 =?utf-8?B?OEtZL09zMUtyMThMakFNNGpUM2NIOTd4bGNublVPeStjZ0M1c3lpT0pxSlRa?=
 =?utf-8?B?M09jYTRlV3ZTUDBSL01pRmpEdmdGbHUxUzNES0R6MFREajVYOEVxOFFpMmJq?=
 =?utf-8?B?OTVBd1lNM0VWOHFKb2EyOTBnbGp4bGNzbHd6a3pBbzJMNUlmMVhwdno4VHRy?=
 =?utf-8?B?ZDFvU0I4VTZiU2w5Tk5xazArd0U3RGlvZHJnQ3E4K0g1RXAyMEx2S2tVb2lX?=
 =?utf-8?B?WW1yRldza0M0RGhTci95d2VneEFlSmlHa0hadHBvT0NsZU5CZXV4MHIrbC92?=
 =?utf-8?B?OFY3Tk9wbkwyZ2diWW5DNzlIcFBueGtBRlZwTk9jSjVKQ3JIQzd1aVRzVEk5?=
 =?utf-8?B?Wm5Bc1RqUWhTWkg1WnRQWHRhOCtxdjdOc2lJMW5vWEQ5QytaVlZ2TUJNb29U?=
 =?utf-8?B?dUtDUTNZYmd0K1p4REE1SU9ERkNnN1BmWC9oSVVWWnRLMUpkanVnQ1NvRnJQ?=
 =?utf-8?B?TDk5cG9zbzBIVzhScThuY1YvOHdDWHh3K0hFTTQ0NW94SUxxayticzF0eUUw?=
 =?utf-8?B?T0xmbGJnK3doT1pST0svY0RHRGljTmcrU1lBNWN1RUoxMkIydmZ2VnJEeHIw?=
 =?utf-8?B?UGVKdTBpMEdDckxDc1NITjRYQjVpbjQrQkU2ckJIc2N0NjRlSDladndVamUr?=
 =?utf-8?B?a0dySEdpS2QwNWxSa3RaZVBRemI0L3c1Q3ZhVUp3QXV4UTh4WFIwSkpnUmZj?=
 =?utf-8?B?QllCOXJmbmQwcFdoUzFEWVltOFZGcFh6TDJPMThlTHFrL00raEZWa3VkNFR0?=
 =?utf-8?Q?S2jw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTJxZ1NkZHJpZ2NNZTFmMmluYW10MkRYaC9pZHJDUlpXeWpaSXNFN1VFaUVG?=
 =?utf-8?B?eGV4clFMN21WUnRBYzdaakZiYjdXb2k4NVdLNEZ6em12Mjl3TnRMaWcxcnpj?=
 =?utf-8?B?M21kaDkwcnRCRGJTTjFSMjZTMG9PdVF6MWhISitXWDZJYUtpd05OSkxTNGYx?=
 =?utf-8?B?dUU0Q3J2SGFyanNkTDV5Qy9zMzkwY29RL2ZEdnRGU3F4Ty9uYWtCcFFNTnNQ?=
 =?utf-8?B?NDU0QUxiMFY4NjEvRkJiS2dvN3U0S0VYV0FOdVVPWThrSkltdmNJTWhvVTgz?=
 =?utf-8?B?UEJ1aGpOM2p4KzdhZm5QOG1iS2FvcTJHa3pJY1VHZDMzNWNhSTBTWHVtdDJx?=
 =?utf-8?B?bVc3bmdpT3I2SUZkNkNjUzJhdW9ZQkdHZnM0RG9ESEdHbVpXeUdyb0hmc2JS?=
 =?utf-8?B?M2d3eUdNTDFWajJScVZrY1U3Tlc1VHN6b3VFSmVnL3RMOCtiYkpJemM1T2l4?=
 =?utf-8?B?UW1YZHc5QjBPdnZjWlZtWitYSmpvWmp1WGJ4NWY1OStWc3VuZnFaMzBFMEZR?=
 =?utf-8?B?bjhNZjJXQm5SOUN4Um5Ud29qSDArV29odzBvQ3NBUVNYbzRQazZFYjRSWHZi?=
 =?utf-8?B?cjVvYWFidDMrQW0rbFU2eXFsdEhrejVhbVBtc09kRit4bmY1L2hTbkViQXZR?=
 =?utf-8?B?SmxEM0RXTi82MEhwcmxmZjhuMFhJMTE5cGxub0pPekhiWE1Jd3ZDWlkvdUFR?=
 =?utf-8?B?ckliTy9iVXRNSmJyRjRTR25MZlljemg4TmRHME5lS2Zkc1J3MHN4YnBHVzhp?=
 =?utf-8?B?RzEzRmxWb2Q4OVBJSVZPOWtadzM0RDdJNVN1ODBkWC92SGNWMnRJWGd6Z2s1?=
 =?utf-8?B?NTkwWHE3QUdnTHhoZ0xKNWx2OEVwRDc5ZUtVL3p3UEhCaldGRm1kUjBGVWdM?=
 =?utf-8?B?cXp5Y0lKUWtZR0RiRTFDeDhqM2VrVjFZc2Rvd0NmeFNXVTJXMDNWUW5TY2FS?=
 =?utf-8?B?eHVqbzRHMVg2YmJEYkk4NjdYdzl0YTI3Mm9GYmE2T2lrNHFwaDI1YldTY3dN?=
 =?utf-8?B?aitVODZJbkpWQTJuUkp0d3BONXlrWHJuTGdhTjhvN2JJUDh5cTJqZUlpYStk?=
 =?utf-8?B?a2Zxa0YveU1hR3cvZTRMdDlyTjVQVWZLREtab01WUXhRWUdyMURlOCs3L3ZX?=
 =?utf-8?B?MXBYbkhkb1dpU29DampaTnpYaHBpaCsyU3JtYm1qdmpqWmtlbC96cU1XcXd3?=
 =?utf-8?B?ajhaYi9LbHNJa1NkVHh4VTB2eVl2VGdXc2tLVWthZi92ckFIc3VEWkxsTnN0?=
 =?utf-8?B?SmxpUTZUNDR3N0NFaG9UeFM0QXRsaW9TY2w4aE5NV1QzZXM3UkhQRFl0Q2Fz?=
 =?utf-8?B?OXVCSHZTKy90cUFNVnJidFBjWE1VY0Yxd1hQN0pRZHg4dVEzbk9ueDJCdjdB?=
 =?utf-8?B?U2prQUE5S0owNmlGSTFqT1orWkpaUnRNci9DNm93ZEJDd2lQWmFFNE9iNkdX?=
 =?utf-8?B?YXVWblVNeXFFVllRb3JWeFI1UzEyaytqNVVvNU0zdGlKZjVabTl1dHJHc0ti?=
 =?utf-8?B?QnJnd09aYmhzcHl6S3hNS1M4KzFCSUZHdktGZWZWUWphMG9ZdTVFNVNMUEVn?=
 =?utf-8?B?Tm9ST3l1WUVnbS9RbjVqQVNsNGYyVTcyeFVPL3pES0tacCtOUU84N3ZsRkdK?=
 =?utf-8?B?UW9wdHV6RXVkd1ZFb1BKN0tNd2d1WGNDT2g4YlMzbUZlaHNVczhzM1pnZHJ6?=
 =?utf-8?B?RmwwcU54eS9uZGphSmxscUtZc2krZHpIOS9QaU5GVi9ZeHRNcE96UDBUWVdi?=
 =?utf-8?B?UWVEUmJqU2VxU0laQ01hWDRTV0NSOElsNXRoWUh6RWdrVnRSaE9jSVRIdncz?=
 =?utf-8?B?djJMUXNwRnB3QVEvdUNkNXRjOWE3S3dGUkp6dEtTeXRqMEJnUzZkb0F3Z2Fx?=
 =?utf-8?B?eUVOWkhlZytpTmpzSmJNeTBaeEZxZFpOcVhkdWtINDZTa1R5R05vaC82b1Nu?=
 =?utf-8?B?LzFodnIyWjFsL1Ywa0FYQ1AzUFhDaTUyNkJnbGVmQjRuaW9OMWdwQTJIVGZF?=
 =?utf-8?B?MEs0KytGa2hlbHA2OEFXUy9HRkV1NHd2ZXd2ZTVaamhhelhIanMxVytvblRO?=
 =?utf-8?B?M0NFeGdjbjA4eFo3N1B2YU03aFNlRUpreHVOMHFQU0ZyMTZZWTVQN3laYkNH?=
 =?utf-8?B?UXNJbEthRm5lQTltKzdtZTBrT2JBSFdrcGV6N3haOEtzOWJ6YUpndTMyT1hF?=
 =?utf-8?B?SmROTkNsaUd1emZVQVhPcTFhcUhJUk11WE9xUzJUTlVuOFhHU0VCN0JMYUhC?=
 =?utf-8?B?OFlLckpiMlZ5aFp0UWJlTDZ3ZG9nWDUrRVlsd3JkQ21zZzJ4bGhnTUlnMWVS?=
 =?utf-8?B?R0E5WGRlblQwUjI4SmV0T2ttOGdQNFdUamt6S2lnUkNPU1pmZHd0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667cd41c-38c3-4d92-efa2-08de738221c7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 08:53:08.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sD0sAxkhGT2jM2mOHKXoQwCXKGgZSqzDVBM+EJTRTeZUtdLrMFgA8BeVwmYnV6gPi2+hAPoebasq6eX37WUWdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7816
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 38B9A184097
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 07:54:29AM +0100, Jan Beulich wrote:
> On 23.02.2026 20:00, Andrew Cooper wrote:
> > On 02/02/2026 4:26 pm, Jan Beulich wrote:
> >> On 02.02.2026 16:47, Andrew Cooper wrote:
> >>> On 07/01/2026 2:17 pm, Jan Beulich wrote:
> >>>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> >>>> index 0203138a819a..be6c76d2934b 100644
> >>>> --- a/xen/arch/x86/arch.mk
> >>>> +++ b/xen/arch/x86/arch.mk
> >>>> @@ -4,6 +4,7 @@
> >>>>  export XEN_IMG_OFFSET := 0x200000
> >>>>  
> >>>>  ARCH_LIBS-y += arch/x86/lib/lib.a
> >>>> +ALL_LIBS-y += arch/x86/lib/cpu-policy/lib.a
> >>> This wants to extend ARCH_LIBS-y surely?  Is this a rebasing oversight?
> >> No, this was deliberate. The functions here are different from those in
> >> arch/x86/lib/lib.a. We don't need to fear collision with "common code"
> >> ones. Hence I preferred to use the more "normal" placement into what's
> >> passed to the linker.
> > 
> > I agree that we don't have the explicit ordering requirement that we
> > have with arch/x86/lib/lib.a.
> > 
> > But, it still reads as bogus to be putting arch/x86/lib/cpu-policy/lib.a
> > in the non-ARCH list.
> > 
> > What difference is there having this a little earlier in the linker
> > arguments?  Nothing AFAICT.
> 
> Indeed. The sole reason why I'd prefer things as presented is that putting
> stuff in ARCH_LIBS should imo be the special case (i.e. requiring a special
> reason), while putting things in ALL_LIBS should be the default.

I agree with Andrew that it feels weird that arch/x86/lib/lib.a is
placed in ARCH_LIBS-y and arch/x86/lib/cpu-policy/lib.a is placed in
ALL_LIBS-y.  If we want to do it that way it needs a comment
explaining why they are placed in different list, otherwise it seems
like a typo on first sight, and it's likely to confuse people in the
future.

Thanks, Roger.


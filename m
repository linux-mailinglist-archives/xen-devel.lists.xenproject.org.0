Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41415BDA7A9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 17:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142915.1476815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8hGU-0004t8-S3; Tue, 14 Oct 2025 15:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142915.1476815; Tue, 14 Oct 2025 15:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8hGU-0004rQ-PF; Tue, 14 Oct 2025 15:48:42 +0000
Received: by outflank-mailman (input) for mailman id 1142915;
 Tue, 14 Oct 2025 15:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBX0=4X=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v8hGT-0004rK-AT
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 15:48:41 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39645d6e-a915-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 17:48:27 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA1PR03MB10724.eurprd03.prod.outlook.com (2603:10a6:102:488::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 15:48:25 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:48:25 +0000
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
X-Inumbo-ID: 39645d6e-a915-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrJGi6JpUBDGErrudzLEmoQQ0iwUgFNLl6qYa0CfjtYVT/a7pPnTODwz/hOncXcR3zF3V4WOaV7h+h3q5W2EMQH/H947Du9RoLRATtQxICKAintoly9yzdGdRnXu0C0eMIKrH+vJczsOQzCpeDWydbtSfH5oijkeqhNdbIVfl7vJqeTMcRqsVCbPkvafbiT1IxMan2vedWfhfztmO3wwXPVn6DreROt16Tqu2YHCFFvKPRsEg8tel8TefBabKw7GgjXtnACqWYIpum+q0yqzaswgXCK4B4rJ5YxOgCVl5Xy3Es50qHXasO1HR0kYJyrYTp4kgkBO3G+1jT+pm4CX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFliYkyxy7jR4KvWLtZD9U8bP0pMYRey5pz6rLuBzHU=;
 b=uNovnUfhBpabjgNmy4HLzWBG5QeIhn4T+itKuCZoue+fropWpblx6iKWuyZdo6ucD32QDZDda/FlFY3tAQJcNIYxx5pVWtIZHlWYQ72jnfz07kyLMrnuwZPRMbgWUIoJKHHVH5mGUoIFl+eVd8HiUTp0gaSQ88LkHCcJh5TzXZ4RZKPibRIUuAg4AyI+0BS9RdduigU22tQ3YwUeX84lLa7lXJdRdr41VQVxx9L3YeUVBlVxcogwazaoQU5mQNaZk9Dduy//4wGLzrntsBS7TpRbvCSOF3Ypiw/PpQrwRHuvnN0cd8gkxgqItw/eG2tItbUIKBFVd8Fzo6q6YFIYzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFliYkyxy7jR4KvWLtZD9U8bP0pMYRey5pz6rLuBzHU=;
 b=RH/Dg7Vvs51OIhA4JP3GDddnzu7D/C3Hu+HO4tfrfqHMu4Z06lrtVaR0ngicj4OvA0D1LZOqmOXSeI4mw64pTzQSz9SmYjFP+I4OpAXtxvQKyxV/X1dRw2ggHsH3/c7i8ZZwLz2l43jZCMbQrh3QenEyINhANtCGFBZHd2fhdca8IX5GHTcZRsd+GwsV9fRCxojYSy0DqYMMTg9SSojStYUJ2IyM0y1xks8xx86xd0Tc7arp5/fWsK1sFrevxr/eT24fJlD7YPlIkoCFccJt8mdbl9U8sptJw/WHM588dzegnVZ2L6ZahwbIefGyi1V5BnX5hejLxzVPpGqSNFnXoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
Date: Tue, 14 Oct 2025 18:48:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan> <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aO5gdh6C_uQoFHPH@Mac.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA1PR03MB10724:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a677729-fcb5-45f0-7b46-08de0b391c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWpuWEp0Vmx5LzJ6QVNCSitjWXVRSWh4QVZsb0dnY2RiRkJSRlhWQ0x3TnBO?=
 =?utf-8?B?Sk5xbkNqc0krOUVhV1pWQVJzQVBlckVMaEQxVFlQbFlqNVd0bXYvRmhPYWl2?=
 =?utf-8?B?QUVFRHJNNEFhNEdoeVF5OFZ2TVdqYm1RY1RVcXZqU1RqVUN6UUtjUUZ1U01M?=
 =?utf-8?B?dXlGNEJPRDdYNHB0elJoOFpsK2F6bTZLUUdyN3QvWmE0cXJmU2hCZjdVUmtr?=
 =?utf-8?B?eXliZGp0RUhVTTMzRFVJRUZRb1liU0VTSzRpTk9XR2g4UlFNY2tlbEsrTkpD?=
 =?utf-8?B?aTZYZWplSzNOeDhXQURCVWFuSE84U0VwNUxXTTlUdWp6Z0EwdlZaVmNTVUJF?=
 =?utf-8?B?L0dRRThGalJjZGxvSS9GMG1QVDc3K3VtbUlnUkFrRGx4cWE4OHBxWk9qOU14?=
 =?utf-8?B?UC90U0Y0ZXBkRi9kdVVsNGtWVWVYL1VJMmJwdzN2VnRxbnJjQkxXTURrZURj?=
 =?utf-8?B?bWo2anZJbi9LSGwwQzdzL3JVZ2QyZjFvTC9SZHlPd0Q4dnR4eGtUemtHTDZ4?=
 =?utf-8?B?djlZYW95Zldjb1htUHI4Nkg0ZmcxUWRlNnZxU21PVDVzMGJjSkVackt4OWlv?=
 =?utf-8?B?VEcvQ2w2S2g0TDlJc2NFYkdiZ3VCeGRZMUdnSXhvemJwWCt3V242d3V2dUJ2?=
 =?utf-8?B?dEtoVXNyTDRtQVB3dDZ1bEZNejgzdWUxR1VWRERQNUMwZy9TKy9HRjg4VGlS?=
 =?utf-8?B?VzBpay9HbHczR25KbnAwQXoybVhXOHJIQ1BCSTB4dDBqbEY2WDFGZUIva3JE?=
 =?utf-8?B?OENOcVVmOGlOVFpBRUlqOXVwRjg3dHIzWGpnV2d6VEhFd0JUZ0xJdHI0SjlV?=
 =?utf-8?B?VXF0a0w5MFpmWHlEY2FuaE1xbzgzZFNSaWZFb3B5ZXFVOVVWSHBnZnRvUklz?=
 =?utf-8?B?Ri8reS9yYzJnanRQTExOL0pEb2RjU1ZCdk9MZDd6dExKR3lVSjZCOTY0a0pz?=
 =?utf-8?B?L2tiN1BMbUlNbEhNdVpmaHVDS3lCbERiSXI5NDl2UU84RlcvdHNNTW5mOFMz?=
 =?utf-8?B?NXpzNm5KOFVRQ01PbVF1QUhGdDgvYzdmVnVEeGMxTmhGTEhma0FoRUtvK2tv?=
 =?utf-8?B?NmdndStuN2pQWjhZcnpITzRrWTdSMy91bnNKSHlDbFVmRWRDMGF3MFdhSHlF?=
 =?utf-8?B?bVBPWTE0WXNSZzNHSVFBVFQ3Vmd1K3pxREJ0b0FCRVlyYWJ2cEROODZXNzN3?=
 =?utf-8?B?ZXVtNmlldmJWaXEvN1VxU2orNjRiQllNQi9pK0NlUkpCT094bGhlVmRSTWJi?=
 =?utf-8?B?cFdoL0ovQmx1Q05XamUxYlZTT082bDI1WXg1Rmh6UlQyaitnUTlKOVdmdXZz?=
 =?utf-8?B?R05aVUQxQjlYb1NUUkEwUkVWMVM4WndVMGVaRUV6cnBQRVRhQnRod3hJN0c1?=
 =?utf-8?B?dlptRkhCSVlhRDI4ck1qMklIc3AvdFVuTXN3aitsQ1JzNlg5MFVzR1FjMDM3?=
 =?utf-8?B?SmhONDlNTGFlZDZDUlExaEYyYXNybHl1SWhKVnY4aldkNmdLYTFNQVFEdG9I?=
 =?utf-8?B?Z0dJVjl0dUIyNUFROURqZ3ROamZsU01uOCt1aE1STTdUVlBGYm1OWDNIRlFY?=
 =?utf-8?B?QjZNc0hYTjRxTVdZOE8vdy9MUkRvS1R1VUtVMUZ5QWorRmVnKzJhaDdocmhX?=
 =?utf-8?B?bk9RcU9idlRZMGR3SVNDaVY2NWxRcGxwa3J6bjBJUGpnZE9kYmNkOUdjUWRs?=
 =?utf-8?B?SGhsd3lOQjZNQUwydWxTRk5ueXJvQzFMSjc3MjVHenIrYWRuTTZMekRhdDRN?=
 =?utf-8?B?djdzZWVlV0V3eTk1UmdJUTUvT1V1cHJBcWVyM1dUaFI2bC9LbGNhU3k1UVFk?=
 =?utf-8?B?T2ErbWdINmszVzBveHpSNy9zdEVPRjZRUXpJcGFKUXpkczlaUzlSczR3dTZW?=
 =?utf-8?B?Qys1dmJKQmkxWEU5NlRuUUhRRW03L1cwaGZ0QUdWNHJOWG9XWUlMRnRwV0Yv?=
 =?utf-8?Q?jujt2G4vVKWWuW+OrDNiRg8/kd4TcBs0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWFaUzdEWldIWDhjbUF2TThXQXBxQUpjdnBXTEU0UDlSZkg2bk53NmZFZlhL?=
 =?utf-8?B?NTc4V0lyRjI1bE4ydFJJZEZ0cFRKaGZOeVo1VHBOMEtjdVhZdWJYSUFNVTZO?=
 =?utf-8?B?K1FDM2d2bXg2UjRpaEpxOUZ1b1BLMTd0K0hUanZhSElGWWxJTWxRU2ZwYW9E?=
 =?utf-8?B?TzJLdGJTNHkreW1tOTBWVkV4T24vUWkyVS9HaUlvTDBrOHJucGRwSjJhajN6?=
 =?utf-8?B?YjdlRHFWZVFoT3o2VVZWMnA5U2pIbDNvdXlKczR2TmJKWjF0Vm9pL1lEblJL?=
 =?utf-8?B?Nm5xZUlEWWFxUXVlL0czWGtlSHBKdVIwUW9nRFVRbWkxUzE0VDlmcVI2aHhu?=
 =?utf-8?B?cTdIVUt3bjhBR1UyYzJJT0FWelNVV1hIVVRvZW1Gb21OQm93dnRyakpWRE9L?=
 =?utf-8?B?YUtFS2xBZGhSRkl3TFV0WUdPdGMyTE9rNG9GajZBYk1xSy9MSGU2SWtzRmtO?=
 =?utf-8?B?TTdWWHZNZXZteHdFekc0SlprNDJsNGduRzA5R3A5UUVoMnRqRUNLWG9PUnQ0?=
 =?utf-8?B?UWt1aVAyTnh0c0VnYk5BczFlU0ZJSGNPZ2N2cWJZZy9wYTJOaVB0QUI4NEhy?=
 =?utf-8?B?cU9qOHA0Yno4aVROYnFBL1hCcnpQSjE5eXhjV0JXWURpZEw0bmNMU0UwTDVo?=
 =?utf-8?B?UUZJUnRaNmQzRGpvSDRjUW8yck1JMzBQQm1KdEQ5WndKcEpUQ3l2b1dvRGlh?=
 =?utf-8?B?c2IwbmVTSXZhY1Rsalg1ek1ZUndJWG5VK3d5VjZIM2xaQUJwNTAweDIyaEVt?=
 =?utf-8?B?Z2VBRHFQOGVWQUVsUWkraGhNZG40N2hGV1d6eWJLbTd2UTBTaitZMHVHbEJz?=
 =?utf-8?B?RlFyWGdXRnFqYmhDbzBHaTAzS1UxWHQzY2JlaHRodERjWmV3WmRTVU1QZCtw?=
 =?utf-8?B?N0tkRTRhUmpNTyt1ajY0NG4vWXoxaGs1a0ovcWNHR1dUaFUxNWQvVVVlWEdj?=
 =?utf-8?B?NjRTckpHT0c0NnFlNWxNK2tvcXhFMEg1TlMxRDRzRExzeXdLL1BWLzczaHYv?=
 =?utf-8?B?eVVKeHlXYWFtV3pvVTU1ZmpxWUprRTdqdXB3M3lnckt5WXRsQzhMdXdPdEx4?=
 =?utf-8?B?ZW1FQ09EeVBOdThmOUIwdUtTUWdIM0dBcXB5M2IrejNZKzZXVGFIZ0F6WEZt?=
 =?utf-8?B?ZHpxanJVL1pFbHNFTTc2cFUweHJDM1gwUkk4azdLblJabVdVSW84QXBTeTZo?=
 =?utf-8?B?eTNMeWxUQzBVV0xmL0ZNdkZGZU1NU2dxYkJtOEQ3ZnRCaEd3S1BtK0tXL2VC?=
 =?utf-8?B?NThOTE1mL0NKQnZGN20xeUF2V29DcWVoRWcvQnlZa3ROdlRmaFJxNGlxMGFp?=
 =?utf-8?B?eGU5dy9Bbi9FUnNVRjloV0l1L1hqUVBlcElPdVhnY0lRZUIrbHE0WXlRc2tt?=
 =?utf-8?B?enZVUWdCNTlPdkdZcmltekQ0OEVYdDA3MkxPR2ZCZGVSQ2kwZ0dkWklDdnZm?=
 =?utf-8?B?ajN0V1Q0cHF4OHczMkh1VTlRL2tTendaaG5ZNGVmTmtwL0h0cE9aczB0NU94?=
 =?utf-8?B?RlFvajZyRmo1QUFBaVk3S2JNTm9SZVZYQnl5ZEQrY1I4L2huZC94aXJEY3R0?=
 =?utf-8?B?ZGg5NzlJOE1WQ0o0cFBYN3VoTHVUVTNBaUJETXJlS0szTjJJaFU1WkxlY21n?=
 =?utf-8?B?MWFYZHdVSGF1Ym5WVklsSE5NQnEvTnM5MFhXL3dpclRvVzF1L3lFZWdWN0Qr?=
 =?utf-8?B?NENNNzQyZk45L3NqdnVhNHphREhBb1piTUpqNkZEc3F2cXkzRVpoK0pzalRW?=
 =?utf-8?B?SjhyMFdvVHFXa1NQWENINjZQcDJCVTVrRENxSnNrWHV1TW1GaSt0UDQyNmtx?=
 =?utf-8?B?bjZ5SWhQbXZSTUl1eVVVQjdYOFVhd2RXVVJTK3pTRk9BQk0zNy9laWFZV0kw?=
 =?utf-8?B?UVVmWEhjRmVlQ3VYZVhjcU9vMEpQK3lYdHBCTWxGMDkvMVRHQmQ4UytXM25W?=
 =?utf-8?B?b29YL0QzdkkzMWcxODZIckUrM0VLcXdHZVI0UVBKKzJtY1JLTVNtcjM0eWdu?=
 =?utf-8?B?UkUva3E2OTRsbFVpbmRkME9tMTlJUHBUOHcxRWxCNXphdEp0ZDE0M2lPcVhR?=
 =?utf-8?B?UTVhQUZqc0hhNlVSWXFTTkxmTjdPMVN0RTVnZ0ZrN3hSWEt2NDhRWGkxM2w4?=
 =?utf-8?B?cU04Q0syZmlYcmhqMUQ3YXprZmgwTUdSVE92bTBYK1puOFF4TGdwdmd6dHNY?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a677729-fcb5-45f0-7b46-08de0b391c6a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:48:25.2270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGo13s+sphSGT8B68DA5nmWPzsjDcifiAhiZQclNZe0cdV+uFiRuxB6PQKM1sr7ZLKfpL21LyuD701scRmNUDevotX5TDYz84WGgi/CklDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10724



On 14.10.25 17:38, Roger Pau Monné wrote:
> On Tue, Oct 14, 2025 at 04:24:53PM +0300, Grygorii Strashko wrote:
>> On 13.10.25 15:17, Roger Pau Monné wrote:
>>> On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
>>>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>> +
>>>> +	  If unsure, say Y.
>>>> +
>>>>    config MEM_PAGING
>>>>    	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
>>>>    	depends on VM_EVENT
>>>> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
>>>> index 6ec2c8f2db56..736eb3f966e9 100644
>>>> --- a/xen/arch/x86/hvm/Makefile
>>>> +++ b/xen/arch/x86/hvm/Makefile
>>>> @@ -1,6 +1,6 @@
>>>>    obj-$(CONFIG_AMD_SVM) += svm/
>>>>    obj-$(CONFIG_INTEL_VMX) += vmx/
>>>> -obj-y += viridian/
>>>> +obj-$(CONFIG_VIRIDIAN) += viridian/
>>>>    obj-y += asid.o
>>>>    obj-y += dm.o
>>>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>>>> index 23bd7f078a1d..95a80369b9b8 100644
>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>>>>        if ( hvm_tsc_scaling_supported )
>>>>            d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>>>> -    rc = viridian_domain_init(d);
>>>> -    if ( rc )
>>>> -        goto fail2;
>>>> +    if ( is_viridian_domain(d) )
>>>> +    {
>>>> +        rc = viridian_domain_init(d);
>>>> +        if ( rc )
>>>> +            goto fail2;
>>>> +    }
>>>
>>> Are you sure this works as expected?
>>>
>>> The viridian_feature_mask() check is implemented using an HVM param,
>>> and hence can only be possibly set after the domain object is created.
>>> AFAICT is_viridian_domain(d) will unconditionally return false when
>>> called from domain_create() context, because the HVM params cannot
>>> possibly be set ahead of the domain being created.
>>
>> You are right. Thanks for the this catch.
>>
>> Taking above into account above, it seems Jan's proposal to convert below
>> viridian APIs into wrappers for VIRIDIAN=n case is right way to move forward:
>>
>> int viridian_vcpu_init(struct vcpu *v);
>> int viridian_domain_init(struct domain *d);
>> void viridian_vcpu_deinit(struct vcpu *v);
>> void viridian_domain_deinit(struct domain *d);
>>
>> Right?
> 
> Possibly. If you don't want to introduce a XEN_DOMCTL_createdomain
> flag you need to exclusively use the Kconfig option to decide whether
> the Viridian related structs must be allocated.  IOW: you could also
> solve it by using IS_ENABLED(CONFIG_VIRIDIAN) instead of
> is_viridian_domain() for most of the calls here.
> 
> The wrapper option might be better IMO, rather than adding
> IS_ENABLED(CONFIG_VIRIDIAN) around.

I'll do wrappers - less if(s) in common HVM code.

> 
>> [1] https://patchwork.kernel.org/comment/26595213/
>>
>>>
>>> If you want to do anything like this you will possibly need to
>>> introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
>>> domain has Viridian extensions are enabled or not, so that it's know
>>> in the context where domain_create() gets called.
>>
>> In my opinion, it might be good not to go so far within this submission.
>> - It's not intended  to change existing behavior of neither Xen nor toolstack
>>    for VIRIDIAN=y (default)
>> - just optout Viridian support when not needed.
> 
> OK, that's fine.
> 
> On further request though: if Viridian is build-time disabled in
> Kconfig, setting or fetching HVM_PARAM_VIRIDIAN should return -ENODEV
> or similar error.  I don't think this is done as part of this patch.

Sure. Just have to ask for clarification what to return:
-EOPNOTSUPP (my choise) vs -EINVAL.

?

> 
>>>
>>> Given that HyperV is available on arm64 also it should be a global
>>> flag, as opposed to a per-arch one in xen_arch_domainconfig IMO.
>>>>        rc = alternative_call(hvm_funcs.domain_initialise, d);
>>>>        if ( rc != 0 )
>>>> @@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>>>>        if ( hvm_funcs.nhvm_domain_relinquish_resources )
>>>>            alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
>>>> -    viridian_domain_deinit(d);
>>>> +    if ( is_viridian_domain(d) )
>>>> +        viridian_domain_deinit(d);
>>>>        ioreq_server_destroy_all(d);
>>>> @@ -1643,9 +1647,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>>>             && (rc = nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: nestedhvm_vcpu_destroy */
>>>>            goto fail5;
>>>> -    rc = viridian_vcpu_init(v);
>>>> -    if ( rc )
>>>> -        goto fail6;
>>>> +    if ( is_viridian_domain(d) )
>>>> +    {
>>>> +        rc = viridian_vcpu_init(v);
>>>> +        if ( rc )
>>>> +            goto fail6;
>>>> +    }
>>>>        rc = ioreq_server_add_vcpu_all(d, v);
>>>>        if ( rc != 0 )
>>>> @@ -1675,13 +1682,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>>>     fail2:
>>>>        hvm_vcpu_cacheattr_destroy(v);
>>>>     fail1:
>>>> -    viridian_vcpu_deinit(v);
>>>> +    if ( is_viridian_domain(d) )
>>>> +        viridian_vcpu_deinit(v);
>>>>        return rc;
>>>>    }
>>>>    void hvm_vcpu_destroy(struct vcpu *v)
>>>>    {
>>>> -    viridian_vcpu_deinit(v);
>>>> +    if ( is_viridian_domain(v->domain) )
>>>> +        viridian_vcpu_deinit(v);
>>>>        ioreq_server_remove_vcpu_all(v->domain, v);
>>>> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
>>>> index c0be24bd2210..1212cc418728 100644
>>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>>> @@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
>>>>    {
>>>>        const struct domain *d = v->domain;
>>>>        const struct viridian_domain *vd = d->arch.hvm.viridian;
>>>> -    struct hvm_viridian_domain_context ctxt = {
>>>> -        .hypercall_gpa = vd->hypercall_gpa.raw,
>>>> -        .guest_os_id = vd->guest_os_id.raw,
>>>> -    };
>>>> +    struct hvm_viridian_domain_context ctxt = {};
>>>>        if ( !is_viridian_domain(d) )
>>>>            return 0;
>>>> +    ctxt.hypercall_gpa = vd->hypercall_gpa.raw;
>>>> +    ctxt.guest_os_id = vd->guest_os_id.raw,
>>>> +
>>>>        viridian_time_save_domain_ctxt(d, &ctxt);
>>>>        viridian_synic_save_domain_ctxt(d, &ctxt);
>>>> @@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
>>>>        struct viridian_domain *vd = d->arch.hvm.viridian;
>>>>        struct hvm_viridian_domain_context ctxt;
>>>> +    if ( !is_viridian_domain(d) )
>>>> +        return -EILSEQ;
>>>> +
>>>>        if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) != 0 )
>>>>            return -EINVAL;
>>>> @@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>>>>        struct vcpu *v;
>>>>        struct hvm_viridian_vcpu_context ctxt;
>>>> +    if ( !is_viridian_domain(d) )
>>>> +        return -EILSEQ;
>>>
>>> Nit: we usually use EILSEQ for unreachable conditions, but here it's a
>>> toolstack controlled input.  Maybe we could instead use ENODEV here?
>>>
>>> As it's not really an illegal restore stream, but the selected guest
>>> configuration doesn't match what's then loaded.
>>
>> I'm a "working bee" here and can change it once again her to -ENODEV here.
>> But It will be really cool if it will be agreed on Maintainers level somehow.
>>
>> EILSEQ was used as per [2]
> 
> Didn't know it was explicitly requested, then leave it like that and
> ignore this comment.
> 
> Thanks, Roger.

-- 
Best regards,
-grygorii



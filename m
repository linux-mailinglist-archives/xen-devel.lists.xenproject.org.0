Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLxdBP4wl2kcvgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:49:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4681605BF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236504.1539196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6H2-0008CW-8p; Thu, 19 Feb 2026 15:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236504.1539196; Thu, 19 Feb 2026 15:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6H2-0008AN-5x; Thu, 19 Feb 2026 15:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1236504;
 Thu, 19 Feb 2026 15:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=erNG=AX=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vt6H0-0008AH-Je
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 15:49:02 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81f9b2fa-0daa-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 16:49:01 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BL1PR03MB5989.namprd03.prod.outlook.com (2603:10b6:208:310::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 15:48:56 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:48:56 +0000
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
X-Inumbo-ID: 81f9b2fa-0daa-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hV2MPhEs6XglaQ4OHllAdvNY6zZXj+PlS1JqM4CtCr97nAThkYTQUxb/GW3Uy2W4crmTLb6RHky3wP7DVNqLUG0+9aXPy6FC3NyVbCCGBY/2WU3LhlnkWdWwVDIk9k5XZFOXn6AvwsrFpiTleeWMuE7ujNmj4Pq3Z4Ev1OpK4b+PlAgq2pYEzaQQehQLg3Qk/IKOe9JNxh/7NJCJCMIFTqUUpftw3aJemcPpftYqjsAe1iuMxfhjjTlwFTJMB+0Dm+7LyCfTgso416hC1+WPR/P6PL1KTMl0Qb2ScIxdxcu11O+A1fVzkNq3pyDts0Woo4CAK3ATWS6gMIzdSsSnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyjrtDo9AUUHIM3v5wCgL2KMCGQ4WXnlCVyWZaI5os0=;
 b=uUmrNTN3dAqIG2Rvdme4wl6hw4BzohsnOzvdOMdwl4fAbS1BmszRJJyUesdY1o1TV/d2H998ksJB78X/8f7nXpsztm71rJ+9Hnu0DXpcCACVCQ0sqreKM68kxhXljLKQLlTOZgR/VTQE3rvyJzFx2YTJ9UhD4Ne/M+XZ1U8OGRzDEc4+1qCX7KKssg7dj9zRUxxlpZG7v353x1XZVKUQ6imts9TtvZGQBIoY2ihJPDowt6KrNExlGN36bFBPTmNGxb2gT+00NnilgjwmF0cH47BC+DKoJdwC411g0RTVnmvmbCHfswWC04BLEhfAF+txEMitxFm+LzJo50mMWy4IqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyjrtDo9AUUHIM3v5wCgL2KMCGQ4WXnlCVyWZaI5os0=;
 b=tV1qJahILN4jY+xgEmZ37eLTpBlGNpzheofsxIdzEv7bp4NzmiLgCeN7+3cyMNBfBLTJsWX/iDerjMI2G9oJKXb07rcLVVTFGFBVz04FSQhC+laartLiOXCtgHVG1qAUYTSKdH1STPPpxwmR1q4qn53iZWNO2SbUAnyS/LW04MY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d9b08489-e544-4e2b-9a38-a495e91f5d88@citrix.com>
Date: Thu, 19 Feb 2026 15:48:53 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/bitops: drop redundant casts from
 find_next{,_zero}_bit()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0cd3f675-e310-4434-aa95-cb0cc86e3569@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0cd3f675-e310-4434-aa95-cb0cc86e3569@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BL1PR03MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d6a5a2-b51a-4ea9-d342-08de6fce640e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVdDek1ISHpqbTkvTk1IQVNJYThWb0s4eHdVUTJDRHJrMk5Pd2Vsa1gzMlVn?=
 =?utf-8?B?bmVyZWFhOWhQOElPRzNoM2pvRU1WdWpBNmRuM05Bdy9ySFd1TDV4ZWlPck9S?=
 =?utf-8?B?N0prV1BMVWtLYkJabkNyWWJaVDlBSmtva0RvaUx6YTZraVdoRHliRitnb2Fr?=
 =?utf-8?B?V3ROU3R4MFREa2FhL2FRT0N2L05xOWtmblhFamM3NXF4aTg5NVNXQ3ltdnBh?=
 =?utf-8?B?MDdXeUhPT3ZaWWlhUmpvVjJXSC9UTSt6NlVvSFBxQ0VzWEtvSXpYTldpMUR1?=
 =?utf-8?B?RGdGbW5BYStVTTlVZjFnZEhEUTlqYjJVcmtPOEUycnhyT0hpRndGSGhSOTFZ?=
 =?utf-8?B?aWQ4eCtXeVFTOTFwbnZ2bXR3Yys2VGdDT2RVMzBFdjU4NW5OK0U1cDVTejZU?=
 =?utf-8?B?SExYbW5UQ1gyVUx6RWtRVzh2Ky9MaTlQY2YxTkp6d3BtdWhRcG5XRnQ3Z05s?=
 =?utf-8?B?L2lpbDUrVlRLdFpSRGR1WUQzbExYSnVSclJzUXRSVWNaK1VVWENMaHlGN3B5?=
 =?utf-8?B?QlBrR1hhNHIwMFJ4V2ZuQUMvNkRkb3Jzb0prb1J4NGlWbDE0azAzOWFTVGkv?=
 =?utf-8?B?eW1UZTRBVlZrUldZT1BlQXcwZmxZR1BZbHFXRGtHZU12MURmWTBCc3VjblV1?=
 =?utf-8?B?dC8vVXU2N3pBb3crNXhONUtUZ0N6bS8zRHBENlRZcEhuY3htZjZKN3ZOVmNh?=
 =?utf-8?B?bitqOVh4aklFRjBybXZnelpYcXIzTU5HQ1BTQ0xkczN3bWhzVkE2K0FWYzgx?=
 =?utf-8?B?emdrc3loMjdlMFdYVXhuM0ZqVjRvZFVVYXNleWdkaDdZK2pyeUN5dWhXM0hW?=
 =?utf-8?B?K1AyQmxOZzF5cW55aHR1SWs1NVQzQjF2WS82MWtoeEZCOFlOb0FMeTZ2cHlO?=
 =?utf-8?B?QVdid3RyTmg4dUJ2QW9xdjRmSmNEK0Myc0greEcxSzM3ekl5dzk4ZFZxUG1W?=
 =?utf-8?B?RkdQcUFqdGVUUEJYblFQNnpiY3BhVm9JTHBUUm5DNGVwWHFkM2QyZ3dURDZa?=
 =?utf-8?B?Qlg2UWZRdnRKY3BMSUw5WHJpc295YUFYd1M2bjQ4L1VBOHVkbEZJbTNEUmta?=
 =?utf-8?B?eGJ2ZC95MTkwSzA0NmZQVzZjNGpLQlM5UkRyVHFvdUVyNzh6RzBZTUwwdTJK?=
 =?utf-8?B?d3lGeEpadmpWa2hNQWxQTjluOW9pQlpRTGd6aDluK3JBTktwZmo1cjhKWW1C?=
 =?utf-8?B?Z1BWMFJCNG5yQWZxZDgvUzZGa2RRS2ZhSUpEb2I3bTlwaDBWSk5pS0xBRG93?=
 =?utf-8?B?YldoUnJ6SGN4Qm1oa3lTUmh1ZWJOYnhYaFVwZFJTRzFCRGpXUnQ2eHdMZGVu?=
 =?utf-8?B?L0lhTm1Vem9nNVlldkpMbVlqN3hRSWptU2VmZ3YySjF3VlNSSVBaSXBTbjBG?=
 =?utf-8?B?T3JIOW9yTG5LRHh4Y0I4K1NIcHJNbGhFd2M5aUtkY2N4ZUlIOXRZMnl2bG5z?=
 =?utf-8?B?dUhORnZTTi80dzRZNkZoa3Y1Q3lIZVM2dTBzTnkwQ2pIelhDRXM0QUJ0ejZq?=
 =?utf-8?B?SG04dzE3QndFSkhMQS9oNnZyN2FWMGNrOGdzUDFFUC9pVS9acXdidkFUbnRh?=
 =?utf-8?B?dFBUVkdnNjBaeFUxQUdDTEQvc0dnc1N6ZGhndW9FaDYrYTJ0cEJEL3JwSUtS?=
 =?utf-8?B?M2RkSkV4RUdNMWU5ejlBVUljaWNDelVkdkhIRGUvQWVBZ0ZUc3kxaHlxYmwr?=
 =?utf-8?B?Y2FnckZLQXZFWmNQYXprNjVVazRnaVMzeUc3RGs2MkhtRmlZWlR5WHdjZ3pG?=
 =?utf-8?B?aEQyTHc5aWxVRURPTVRKRnpaZThPMjFvdEZmUStJRmhWOEtaVWlqcE1FdEUy?=
 =?utf-8?B?ZW1mUDJKNFNwajVTdVNjNG0rV3ZYVzVtb2YveTVHdXBrVER4cVA2SjRGNERo?=
 =?utf-8?B?Y05zcmo1MHFKdGxOeFd5UlNlTXFJNEJlREwwSDJVYk9NSmVjWEpGZHVOWVRT?=
 =?utf-8?B?VDJDWEVEMGpXekFQdW41bEF2bVNuN2JmdUt4eTZsZ3JnOGZnZTc0cFViQi9q?=
 =?utf-8?B?eUFBNHE4cTRBK0QwRi9tS3ovR09qNXliOHB4YWFyUTlSQ1l0dmk5WGFHa0ln?=
 =?utf-8?B?d2l3SG56R0RBam9GckdIK1Y1ZEhxZHdxUHZDbGgxVWx1OXBLL0dPYmp2Rm12?=
 =?utf-8?Q?OWGE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXVGWnRTMHZiTGd1WXJxeVJnUjhFVXhDT2toR2sya2VHWWpIQ2c2eVJOUXVI?=
 =?utf-8?B?VWhrMUdMZlNWY3ZCZ3hHRkxueUdvVGhHajk4Y2hqNHNPUG9IbFdpY1NDZzY5?=
 =?utf-8?B?UUNORTVwazRRMlYyZlRmd2w2enIvMFFUMGgyNHdYTk9vWXZiN0t2Q29tNFNh?=
 =?utf-8?B?Qmh0dVVwYTdXbkxBM2FZL201czZGVU05RzlnZXRHMXBib0Q4QlBTWS9BYlgr?=
 =?utf-8?B?VWR0VkI5ckx3Ujk4Tmo3SzFYTnNGRTY3S1RpaWxPMmtiTWVyZy84dEljc2xV?=
 =?utf-8?B?RFNzSHBUOEtzeFZHZStUT0NkMEFUdXRpVUpOQzRFRXYrQVpDeGZ4VitOUkU3?=
 =?utf-8?B?SStwNzY1WjF3VGo4UFpIa2ROMnhjelR6ZXZoTkM5aHc1Ry9tU0RnT1lwYjNp?=
 =?utf-8?B?ZzR6NlNzR2ZqaHo0cno1V3lDUXJSb2ZSdzZQUlM2UVBGSnp6SHRtdEcrUG5D?=
 =?utf-8?B?cW9Ba1dWUjgwRXg4NFB2Qm5iSmdMRmZkNVg4VENBRXI2b3FGVE9xQ0c1eVJR?=
 =?utf-8?B?Wmw5SVpmb2VRUUU0T3lwZFUzcDlTU29pK1VtWU1yVWwycnpaeENIMVJUM1k2?=
 =?utf-8?B?aTMzNkYrSWNMdWcwYjUyWjBvNnlUWWE3YmZOVTBhTHRtc1FuTStXL2NESkpo?=
 =?utf-8?B?TWFGOHYxWHlZeWpGeHU2VWlDOUZtZ0V3OGhlcCtzRXYxbEZWb2doQy9halpW?=
 =?utf-8?B?R2h6OWlZREVQTENEL2hWbzBlQmdncE9OVmhtYnVmMFBIVWhBdDdiVldPTG9l?=
 =?utf-8?B?S3NFd2FiVEJaanNFSXc4SVJKUGxlMWt0Zlc3Ri9VS3gyalZwUXVtUmRVSHdV?=
 =?utf-8?B?eUtDZ3I2bllkMXNxTmg0cU5kQ3NvM1RwZkk4SnVvUFFJVzRyTEFSTTFpTEk0?=
 =?utf-8?B?ZkNRbk1FWlJiRkcyZGNvYXlFZHpqOTZBRWNVT0wzWWVIblBVZWVqSjNiaC9m?=
 =?utf-8?B?d0RLdFAxdUZpNWZoVzRZbFRPdnVEOGpERTJpR3ZOSjBhTVhqOXBFMDFQcXNK?=
 =?utf-8?B?TERNV284eUhYWW4yQ05EYllaNXQ1QlZPTjJFZEE2ZUVraXNJa21LTGJOemFF?=
 =?utf-8?B?aHJzSmw3T2M0QkRlR01SWmpNd3N2QjU1S3lQc2xKSGtobWZtQk54SXArR1FS?=
 =?utf-8?B?YnZZRWtLczJqaVpSSGgybXNIRVBMcjhoMEJ0ZUFHaE9aTnNzOFcxM0Jxakow?=
 =?utf-8?B?ejVBMDNNT0dxRFZaMy80a29WaWQ2bjg0VWNJbUcxLzljMnUrU202NUVvenpv?=
 =?utf-8?B?VVdjQi9HUnNOSmo0MFVJcVNtTXF6VEx1M1MzNVVXVWt4eUUvMUlIbitrVFo1?=
 =?utf-8?B?TEUyR2NWTWZENVYySW9UbGVoMGJTeTU0QnBIZjhMdzMzS1pCZVh3NGx6bFNR?=
 =?utf-8?B?NzJCd2hZZ1g0dm1nWExkNW10dTNzMmYxMUdvRVlMMUt5bjE2U2F3YUpINVJ4?=
 =?utf-8?B?OTZMSTdWYnVwRktYUFlXeXJYZFhHNkdQYXphYmVqOWt1QXpuclNhK3lDVGRH?=
 =?utf-8?B?T0o0VVdyMGpFTFhNa2w1aVpnVDY5MGh6eEdaZlJsN2Z0QkVaN3BsOG5IOU9R?=
 =?utf-8?B?ZE42RTVmdDk3Z3liSURMc3RrREkxVE5xQTNMWWM5Mkp2U1doUWlKeUdJaG5n?=
 =?utf-8?B?RHBsVGRtV05RU2dNdW5YaW5GR1k5eWpTbE1WZUkyVzdLOUdpRzg4bzUxNDRk?=
 =?utf-8?B?cDZEZEYxbjR2VENxcmY1dnFnU213d0U2UkNUMUVSMzU5TVhGajBYWXpGeUdB?=
 =?utf-8?B?L2w5S0dsdkhIZ0hIc2lEd1Y5K0VUWFJaeVZKdUYwNzVqejc5YkNiMUVoamtQ?=
 =?utf-8?B?aVBFdVpVSTE0OEl1T082WktNbzkwMnpkZzFGT0xxblgxcEFlSVZoNnRGbFkr?=
 =?utf-8?B?SUxxaUFrQ0VMSC9SL3BoWklwL3cvVGVIckJRTEFVVFRYUkE5WllURHpoSFh2?=
 =?utf-8?B?c3NCdkpJOGM3Y09VRzBJZm16ekY4d0ZmcVk1YmNtcHROa1oyWjNPUTdpT0lv?=
 =?utf-8?B?UXl6dDQwSjcybC9taEM2Wm1lUFUyaHlENUtrbWM3QlhFcTg2bXNUeGJtZXhR?=
 =?utf-8?B?VWZEOGJKakZ2MEpTdFJ0bmV1c2NYVlJLUEhSS3pGZHZuUmJsV0J6SXhycEJn?=
 =?utf-8?B?YW5YMDN4OW9OWEJTenFqS0lhYStOR3VLK1RGNDFqZldTQWc1Vkx4VlpDNmdT?=
 =?utf-8?B?TTEwUXRhc1FFNS9ZaTRuZFhlSm1EZjRGWHpYdFdsU2YzZG9kM2U4RjNTZXdO?=
 =?utf-8?B?anJYLzhQMndwS3d0QjFCZXhMWVQ5elZyOCtiNzFLbzY1akh3M2NlU1N3dHhB?=
 =?utf-8?B?WmFtZGIycGgrUWRVVXprQ0NJV1NWQURjbldFKyt2Q25uYlNhWHBNQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d6a5a2-b51a-4ea9-d342-08de6fce640e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:48:56.6503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZFUAa0fuhmSiEyWtofcYpIZ/ezptVz9V3QBYAa7vlBLyZYr8tDBFvwdY1nA//7xxDzP9vE6qxXwRLDzgLAPPOOyEQYTGLS1CNWPE4kg5kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5989
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5A4681605BF
X-Rspamd-Action: no action

On 19/02/2026 3:43 pm, Jan Beulich wrote:
> It's not clear why they were put in place - a__ is of the very type
> already.
>
> No change in generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I recall this monstrosity requiring many edits to get right.  I expect
it's stale from an older form.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -343,7 +343,7 @@ static always_inline unsigned int __scan
>      if ( o__ >= s__ )                                                       \
>          r__ = s__;                                                          \
>      else if ( __builtin_constant_p(size) && s__ <= BITS_PER_LONG )          \
> -        r__ = o__ + __scanbit(*(const unsigned long *)(a__) >> o__, s__);   \
> +        r__ = o__ + __scanbit(*a__ >> o__, s__);                            \
>      else if ( __builtin_constant_p(off) && !o__ )                           \
>          r__ = __find_first_bit(a__, s__);                                   \
>      else                                                                    \
> @@ -375,7 +375,7 @@ static always_inline unsigned int __scan
>      if ( o__ >= s__ )                                                       \
>          r__ = s__;                                                          \
>      else if ( __builtin_constant_p(size) && s__ <= BITS_PER_LONG )          \
> -        r__ = o__ + __scanbit(~*(const unsigned long *)(a__) >> o__, s__);  \
> +        r__ = o__ + __scanbit(~*a__ >> o__, s__);                           \
>      else if ( __builtin_constant_p(off) && !o__ )                           \
>          r__ = __find_first_zero_bit(a__, s__);                              \
>      else                                                                    \



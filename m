Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31764CAFF80
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181619.1504644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSx8c-0003pl-Eo; Tue, 09 Dec 2025 12:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181619.1504644; Tue, 09 Dec 2025 12:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSx8c-0003oH-Bt; Tue, 09 Dec 2025 12:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1181619;
 Tue, 09 Dec 2025 12:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2qC9=6P=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vSx8a-0003iL-PP
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:48:16 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53c27550-d4fd-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 13:48:14 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by GV2PR03MB9404.eurprd03.prod.outlook.com (2603:10a6:150:d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:48:07 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 12:48:07 +0000
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
X-Inumbo-ID: 53c27550-d4fd-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCXQOkIbOaVQ1VDTLWt6XjTEtxDjRx/CGpUM5SLWFZJx8r5v1X7sWcdrR1E2T8LGnV+wzJb+vr+DEJA2KUErcKFFsnARHHGWpJQgr5rErK0I3yGSfMI449KW9Lp9QGn8kBULznX8gWzlVxb0n3kCsRhA/hNesJ037oQQzJ2Yn4t/JVcpp+yAWL5NYOpB0N8aYxJjxui/l/5AOZjCe7oHBhpRg7+BUYCkL7B8zXkc0Qv1nCgdKcwIMt9+9Wi7t2LfkOISqSEu8L+kbs3BQwd/mQM/CHTy4SMnuebff0Hnock+ilPSTMprD1sJhGqGsF4IuumJy3qcAx421SMc5Qzimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjOF1jGeG5tmY5uUcGwJW9qBoJ67+psJtHnPGaetGqM=;
 b=c+pphwG566AysaO5UHSXpFqpc3rbftd3W+eVUV7+Fh5DG2py9/BWOkynJ7hNKeyoUb/c3OFXIRz4W+n1O1iTAppZW6HCWW97ean3y7DtBbWxdcNz3EnK/DE4Ho6UhL8vx61PPjQr8S+i1q/WEVNxRMAuXLvu64O4Gn1B9avcm03KwHdi6bscx2Kr4XT5hiS/kqqalenjhyugPK8can4wI4HIjqvrOHVXY0kP1b/krnhW+IfJRESNLyDVYIkRlXcVcOzo+aufjuQQ3F6sekX/bphzDQizYaxQpWjEUFqZLmXG2UtKCpfKwXZvlHSAv575tueRJKdNAdQkqUZt79flHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjOF1jGeG5tmY5uUcGwJW9qBoJ67+psJtHnPGaetGqM=;
 b=oOe3PgxQJ4Qe4phwb9v5IgM/kFBOXdq9HTa77vSI66kZ7kdGv2hp3BGal70VsFzNtld5+eo4WO0Aglnlw1A0hqYpyh4GlH8b+BwwQbMg2fNUa5aV07TiEDN5QgZvPOH7bzJ/D3rZYP9bC2gne9Y1WYIIac+Iy7GBhO1z4Upw4nwbHZsRlVEU7iKY80MFtK2fLdmmkUjqyp12TrlR5/OKelnDARGUSRG9mmcwSM25lDIjshJ5J9EbLlsDfh/0ZAov4dvBGp0sOC/WegvJmQtFUeofF2F5qPW5AEWRTUsN7rhw463H7B5A8lY7TMwitxvuYAReigdb2HfDgVkQSpORNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c2749a60-daa0-40d7-9d98-27868d37a560@epam.com>
Date: Tue, 9 Dec 2025 13:48:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] domctl: Provide appropriate error code when PIRQs are
 not supported
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <b38b7b65630d1f167d1589d21556be1493c180be.1764961645.git.milan_djokic@epam.com>
 <88ab7d88-9b25-418c-bc5a-fc080c5e78ff@suse.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <88ab7d88-9b25-418c-bc5a-fc080c5e78ff@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::14) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|GV2PR03MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 18fdc7ed-412f-4914-044e-08de37213367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUo5Q0E3N2FXa0FXV21LbnkrVXVjRGpSMUNFMFVqaEJzRWZ2UytNWTAzVWJS?=
 =?utf-8?B?NDZFQjVCVCtqOVloeXkwRjA1NWxMN2FiNGxrTGx5RzhhUCtaUzFNQzA2TXJY?=
 =?utf-8?B?aXJsSHgwZHFSelR2WFk3N1lJUTNmOEVWVDR3MnYvbzdyR0k3dFJQaTdYcCtn?=
 =?utf-8?B?V1U2TmhSbnJzQ3loNjU5UVNpUVdOU1BkK01uS1RYVGU2amFwcmJjM1k5VW5r?=
 =?utf-8?B?NTE2U2dERUM3WTg3Y1FwRWdxbXkweGppbDFISEw5RENCY1BPUjJDZUl3bTlF?=
 =?utf-8?B?QlBjcEE5QXpQYmFrOUNxb2FlTHBUbjNST0tMOWNVMXZJZ3g4MXpGb3I5czZL?=
 =?utf-8?B?b2JObVdFRWdFd21xeTc1Nm1YUlNhT0ttSCtoVzk0a0UxaVRPK1FYb0NHQjd6?=
 =?utf-8?B?UG5Ob1g2c05oSy84V2RuTE1nNXJWQ2ZGaHNVNHk3aGhMM0RPRThlb1VkaGlJ?=
 =?utf-8?B?Y1ovbmNxc3EzaHJzc1QzTUlDdXplSC82K3F4T1M3QVkrRk0xZzdBWnRwY0Jn?=
 =?utf-8?B?TFpKOEZocE9xRTQ1YnZxNXZxeTFrVkVKNEtMZXpuTENWcDRscG1seUxNeHFT?=
 =?utf-8?B?QVVtRktUZTBmWWRHY3ByK3hmaTdINkVkQUo0Vm5NdGNmRm4vRTFad05Od0gz?=
 =?utf-8?B?MjlQMDVwb0ptR3ZDTmwvM0FIQkhERUpRN2FTNVBEdjZsOUVTR3JUVDlZZEE0?=
 =?utf-8?B?RjRXR0VQOFA4dmUxYUhxNmM0QTJESVVYdEt2b3g1UmVieEFPTGk0ZmlYU0lo?=
 =?utf-8?B?ZkdVejR5OTFDdmJCVEFQempZdUkyTjRkcU9SS1U5RS9sT09lbCtBMzNxYmdB?=
 =?utf-8?B?RlA3VkxMUDNOMTBrbTh1THBSTmI1VS82c3dISlh3c1lwdFJkV3V0dFM4MHJ4?=
 =?utf-8?B?VHljeGphS0M4cm5TMlZWVjRZTFJpdzdwUGlMclc0eDdvSVNJVVY4TVBFam40?=
 =?utf-8?B?V0ZuMmFZNmpETDRlNXkycWE2SU84MEIvQWgyZFdQbEpaQklRNUlhTUQ4dHVI?=
 =?utf-8?B?a3I1ZGZpSk0rQWoyU1F6V1NGaUZZK2hhRWtNNzJVWVJFYjU0cGFuVGNQYThh?=
 =?utf-8?B?VlNYSDQ0K0RUKzMzSHMrRE5yaHRrbmc5K013WW1MdmxVZ2kwdGxKNDZpem85?=
 =?utf-8?B?ZFlYMStvVjlTelJPQTRtcnlzNHBjN0lGekVCRXZPTHpuUFFKOTNZZ2NTNDNY?=
 =?utf-8?B?RFBMUnFMU3I0RFRsU1ViL1FPRXNuNkkveE1DQUNPd2VSbXRsTmVzZ0UrU1hx?=
 =?utf-8?B?bkNEaTBVcjZidWkrZnd1Ykd3NXRUYWFwc3dLM3dwN053Uk5KNHpxUVJwcCtO?=
 =?utf-8?B?c3pOUFlWa1NyclJBM3dFS0d6TytNY0FDK2NJVFJNV1ZzT05PdWRIbmxyQUF5?=
 =?utf-8?B?NXZPUFRHN1E0NmhuY3lpU3o1NTRvb0pyOUc2ZzNaK3NyQ2pzbVhaeVF5Rnpx?=
 =?utf-8?B?blcyWDBMQ0lhZUp4NUpBSjJIVEk4c1NMTmFFQjBYcFY3a0QyQmY1eUNkQVRX?=
 =?utf-8?B?blVmaWlSemZQL0ZsVVdudlZXY1pkNmJURm5mOEdGY0sxY2VOZDBWTld2UlVL?=
 =?utf-8?B?SXVMUzQ5cXhMZHFxSnRVMXhzTnFMSVJzYXU4cE8xb3pZR1Z3RzZQdDFLb3cx?=
 =?utf-8?B?bG92UXhRbjZvdk1mOHUvSlNmWjhNMW1ITVB0TVUyLzNhMzdEN21UTXVzNVNB?=
 =?utf-8?B?TGxmdlhpUFdJNzZKekFSRkpCUy9ucXZWQVVSV0RxdzE4RnN5bkFjZUxFKzFN?=
 =?utf-8?B?NzhlaWMxRlJHOGVlWFppRERYU3hOS3EzV3RhMk8xUUtIM1hyTTlOb1V0NWJu?=
 =?utf-8?B?TmQ1MmZMMkhPOFhsc09EYXJ4QXZISjh6aU52a1NyajNaUDc2bW5LZXZrLzlk?=
 =?utf-8?B?M3UyMEpQL3RTT094eVZ5a2VFMHJRMUpSRExBdUVWQ1pSRVhWREMvajlLR2cw?=
 =?utf-8?Q?z/AWVb1ZFVNo3YIlutyiTLkH1wvR03lA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0c1K2hPeGtsTExjeDZVaGxIdVZUVC9YNjlSby9RZUxWeitpbnNOd3FLaEEy?=
 =?utf-8?B?bldROXZaTVlSTjVPQWYxSjJyRjdJUVJPalZLM2ZwS1dsME5BcGNuZHVnbkZH?=
 =?utf-8?B?QTZGU0h4aWY1R1RWblgzS3ptOUF4WEJ5MmZqMFdzZEVabjk0Z214NUJJeUJR?=
 =?utf-8?B?VXdzTHkvUWdDU3BVOURUNGRuTHhnYS9nYmxmcDhNZ0pQNk83S0Zxd2llRVRp?=
 =?utf-8?B?bGxDdEFvQThXY1pNNmxBYlJoUkZxZElwRy9BNVVxMkt0Q0J6T2tGL3lVWlho?=
 =?utf-8?B?cHh1SHlNRUc5Yno0ck9WL0I5RG1GQWJFcERzeFRTNzNQamN2Uk5peHozWENN?=
 =?utf-8?B?NHROZUZwQlhRZHVDL24zQWpVNUltSUtYTWpyR1NBWjNiY0ZpWTl4MStLYnd6?=
 =?utf-8?B?ajdJZDFPVW5GekFhTGt3a1NTMFFUUGVYenhxcHpWOVVadHoyYklXQ1NCcldR?=
 =?utf-8?B?bGxrWDZ0bXpRYS9Sand0NGVZQkhBZlNTdzBDNlF0WHBvOXNQWlVrcFNwWTJ0?=
 =?utf-8?B?NjdnanN1MzZHK3h0dHE4TmJDbnVDOUtIN25oamh2aFNEbmxnUzc1ZW52UUVo?=
 =?utf-8?B?aTYyMkJ0bG9KcXYzYWdSVU1wWEJueXNiWjMvSW5Gd3JMRGNOWStoZ2U2UTl4?=
 =?utf-8?B?eFRiMDlaVU1ycmJxOGxqZDNFMGRzdlFQcU1LYU9seXlibUNxSG1SbHYrRzRw?=
 =?utf-8?B?ZlNUYmZIWmpLWGlCdnQ3cHlWMWY3L1pFUkV5REhxbG93Vm5QQm5ZbHNVd2tS?=
 =?utf-8?B?c0lJT1JNVnViRHdmSkUvOW1VZnpUVnpKZG5vMG9VYjdITTQ5dGN2ZjJQc00z?=
 =?utf-8?B?dDdWRVp6c3hUdDZLY2I2T0d5akhhZ1J2L2FwMUxOYTFkblZ5S0ZaOGd3NHdz?=
 =?utf-8?B?SnplenhnN3RYV3o2WlF3NVZ2MmhneTBDaDAwbGRQcU5SMHQ1UGl2bGQ0WFRz?=
 =?utf-8?B?RzZUSWNBalM1cDYzNlBsRVpDWjVsQTlwb0dxYXB4dU9yREtPUDByMHFmdVQ1?=
 =?utf-8?B?SklYMWRjMVM4dmhVMVpXRUNldFdlRDVSMHBXdmxkRE9VUDZYTENZT0lrR2NT?=
 =?utf-8?B?ZjRnNkYxRTJOa0JCaDZqdWVFd2Jhd01sekVodE50YnR4cG8rSXp5dkJJb2p6?=
 =?utf-8?B?dzI4S2lqVDF5RmJCZ2VDd3RTSHo1ZDBWUEQ3bXhkaGcxZzExaDdHTE50OXNK?=
 =?utf-8?B?ZmpnVXA2ekZEekFVNUs3MnpKTFBzUFV2dW9LNmRaNHJDRjFKSmZIblBCajBE?=
 =?utf-8?B?Uy9iOXFzMytnVXZKTUd2TWp6akdNQ1dKR0NVckxaejhJR2ZlT2hkYTRzd3hL?=
 =?utf-8?B?Nmt0QXNScXpaTjVqN1RWRzJLd1pNNjZsTExud2xWN09Tbi9iSmVwQkE4aFRu?=
 =?utf-8?B?L1pZL2RrVkNDWUh3UzBodWZycnJWSEUrRU9FVHNNcFdXbjI5NEQvRDRFbnFQ?=
 =?utf-8?B?WHFTQ1dTekJNYlBoNW90QkQwY3ZUSVFOMzJ5ZVh3Ym8wcDRlUm5HeHhSSFZH?=
 =?utf-8?B?VDJwcXo3NXZJOTJnT3VSc09kSXFJbzF4eGluMmduSkV5aXFEQkU4a2VCMjBH?=
 =?utf-8?B?TDZNd3JKRjZrNDJBc2lWcTJJWDFPK0xRTXlYczJhNDY1R285N0c2MmJzcjZ2?=
 =?utf-8?B?MjU0VFB5Rm5UU3dUa1JCSEdsWUJyVGM3TlM5cy93L25KQnZCR2pEekxyMDl4?=
 =?utf-8?B?ZWRVaWlhbjdyL3pnWGdicEIvaVpHUjBQUEpzSzJGN1NqaEdONzRHYzQ2clZm?=
 =?utf-8?B?dEkwSWRzOE16WlhrUURSOWtpYkFCOEM2YlVVZkp0V0FwbDNFWFZ2aXdlTTZR?=
 =?utf-8?B?NktjZys1MlJFT3QxQjJYTWkra1UxSkdSb0FyaUhsNGowQktkdGxKQ3QxTkFO?=
 =?utf-8?B?K09oanNHYWdsZHBTbWtpNHUzVVZUMjhxbklNUWFUK0tCcUd3bUV2elduVi9I?=
 =?utf-8?B?WXozTkgxcUhjeTgyeUVBWWVVRmxIa253R1FvaC9EdHg1M1JtM1Z4b0RVVWxi?=
 =?utf-8?B?eHROZmJsSzk0Kzk2elJRclBNR1ZZRWtMUnNFZTRiSzZIRkJsR3cxaTVpZmpI?=
 =?utf-8?B?dHNibnNqYmE3Q3VXODBMT0w1S1ZRNjFURFdnMXNvRmllVGhSNHZWQys4dFZq?=
 =?utf-8?Q?IIdnSr/s3U2lO97oJTNYpQXqK?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fdc7ed-412f-4914-044e-08de37213367
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:48:07.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u86Sh6y5jTlM4fnrlHHGewegdS9cFBK5USkHYRFOeHhVddf7xioSabjgmvkApWrzs885gItHI2ko6xh5X6f67g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9404

On 12/8/25 14:08, Jan Beulich wrote:
> On 05.12.2025 21:36, Milan Djokic wrote:
>> When PIRQs are not supported (e.g. for arm), XEN_DOMCTL_irq_permission
>> command is not handled.
>> This results with default (-ENOSYS) error code returned to control domain.
>> Update command handling to return -EOPNOTSUPP if control domain
>> invokes it by mistake when PIRQs are not supported.
> 
> Did you consider simply replacing the bogus ENOSYS by EOPNOTSUPP? (Assuming
> the difference in error code really makes a difference to callers.)
> 

Yes, this is the simplest approach. I didn’t do it because I wanted to 
keep a distinction between commands that are part of the Xen interface 
but not supported on the current configuration/platform, and commands 
that don’t exist at all. I also tried to follow the existing pattern, 
where unsupported commands are handled explicitly rather than falling 
through to the default case (e.g. set_llc_colors, soft_reset, etc).
If this distinction isn’t useful, then yes, I can definitely just rely 
on a default-case error.

>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -555,14 +555,14 @@ static XSM_INLINE int cf_check xsm_unmap_domain_irq(
>>       XSM_ASSERT_ACTION(XSM_HOOK);
>>       return xsm_default_action(action, current->domain, d);
>>   }
>> -
>> +#ifdef CONFIG_HAS_PIRQ
>>   static XSM_INLINE int cf_check xsm_irq_permission(
>>       XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
>>   {
>>       XSM_ASSERT_ACTION(XSM_HOOK);
>>       return xsm_default_action(action, current->domain, d);
>>   }
>> -
>> +#endif
>>   static XSM_INLINE int cf_check xsm_iomem_permission(
>>       XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
>>   {
> 
> Why would you zap blank lines like this (also elsewhere)?


Will fix this.


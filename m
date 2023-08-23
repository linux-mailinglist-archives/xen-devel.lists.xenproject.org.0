Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB3B7859D6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 15:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589276.921123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoIY-00085N-W0; Wed, 23 Aug 2023 13:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589276.921123; Wed, 23 Aug 2023 13:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoIY-00083A-TO; Wed, 23 Aug 2023 13:53:26 +0000
Received: by outflank-mailman (input) for mailman id 589276;
 Wed, 23 Aug 2023 13:53:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYoIW-000830-Oh
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 13:53:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c7e4e92-41bc-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 15:53:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Wed, 23 Aug
 2023 13:53:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 13:53:20 +0000
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
X-Inumbo-ID: 6c7e4e92-41bc-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqDOD82FTeBW8qDageJ4VX71Dgr46X043stpng7/C4wKOmlAaP0iH4qASfhxCRyLe64UGW5ngoMtWpcKj5tvriSixYqMP61fHNeZ7rwnPYPqbcNS6nxcEM1HV4n1IXFsrGaI6e51QT+QTiTWW34BuvWur/IKZpEOcA1ek6TNQ9J1ZmbnwDfCXQSxWnVyD6CmpdauznTuQ0QPxyrwIfZp1M3eOxiGXwkwkvvZiRs5cbV/GOwLfVNmuybfJPMriPrZNP/c+VzyMZDhYskqYSI8qGnKIKqAsAoptgIsUGLg5/rDSX1CgoNu3ESD05i6kWJNsrT06OyUDMc/MucZBLcgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U38fg8lBM8azfpzS7TxC4bRSqxC3VNBO7YVE0qdvwU=;
 b=E0w1PHLQ5LLu81GYr1cPcrmpvSvBGmcey+JNg0kerBHsCBh+yp6f7xnhdbjBRJ42KCNoBzmHHk7eyNA9BDqZCbk0VKdSsjkpltf69eHDQ2yKSIMEIXNrW90FwG0JupiWyC6BBssM9775SIRonfpE8nQ8xmYt0JA4plCBXgq2L3b1ozfoSaIME4Vl1PSagko+fxnsnguZr4nwAP5kMRq4jfz19q7WIjuwXcCvXIpb0u/YpcusJIlhb8BqMcYDxwjaG2WYj8NKISHhHgyyo7dhWkQ0Ye92DKGJlsdeLQOC+0dXsc7I8hL/LXRHjVV9Szdnuhwb5mPFXq/RXyU05QikAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U38fg8lBM8azfpzS7TxC4bRSqxC3VNBO7YVE0qdvwU=;
 b=R3YJ6HtMEX9tP35ye+USKiLmO3V8+A9yqfPlJ5WjlGHAvpCqzKGLUklzXn5krQpZ2cvMo7nPFbBITAIj/6aQUU8rF9S3Uf0QkPF6Rnk+tExJeYFrffJ2wMOfg0rwZ7WhOPj1jOgW78KBalF7vGuZzhrmJ84HNm8261xtO9d8TpPMNMlZk980givtzE6QwpQgtH9zcN2OLrA48r1V3GwQUPm8wnJ1XYmUKzSNq79i9CjwihtcWYH8/NAXI79BUnd6ilwHgcMAStN+iVE3sG6/bwUZMMdweiW2ClC/XP5maxtkP5NiiwnaGunF/MF3OdX+N87gq0M7WaoKjfaX00svQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <523312fd-1be4-c184-8b4d-d8817a183291@suse.com>
Date: Wed, 23 Aug 2023 15:53:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] libxl/CPUID: drop two more feature flag table entries
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1517da3b-7d39-47b9-2714-d97dac217678@suse.com>
 <0fec10d1-b56f-416e-a417-b887a3219fea@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0fec10d1-b56f-416e-a417-b887a3219fea@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3863bc-0714-4d64-c383-08dba3e04f77
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QD8NhzbWbF1+UEkmLWPHSafRIxHi5KN9MrHQiUQki9rQ27fWDph/alyyWOYGK/K9zqeFPe6dvpB0f0d6Sleikote3WQHUtYAnAkDqXvX+BBh6F6LdUxu+pCngO/qQ8yuUlA5E2QRnewUv1rSYFCH/hJYDd5WYDYIGEc1k5fmxIcBqjU18up74ptMRsOfJbyN5a4GUImk2zmMoEeK+bzMsC0y9VZwhrbeKe6c73kBF8XEhHaRz/IzU9DHCzp717+6rB6cCqVSB39a3v+0qI4freqEJRLTrNHwertXQBNJmKnIK35km3W74MyjXyG5ryYj2YRf0cyZ++dZdKDHHZKe3G4uN1gzoLVJA5aVH1BR3EHuQXev0i0wIxhZq9SjOJVjJ5dqMJzxuXnn2pD/Ca1voHFR13Y662SjqIjuys8PUCBqykrnqpCGF7j2cNkLqXl4Tkj8wNIdDdsj+s9iv/W60V6HSdDvSDkL3UtPvZggrruQrTdpjJVSdXMBTXeQJR9VdXhg6Y72RUGNBqSVYkUfZfjWylFL0TdiXbN+L6n85Bb4jjN3kJmvsbhZTWuz9I7/ilpl8xCEEATv/LI627kd3QIgCEghP/1MEBH12Lje52AmJMKnZeDw5ZNWvERWrjbH4v2gipGKPAju+RAEQfOhmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(1800799009)(451199024)(186009)(8676002)(66899024)(2906002)(6506007)(83380400001)(53546011)(66476007)(66556008)(8936002)(6916009)(6486002)(5660300002)(26005)(66946007)(2616005)(478600001)(4326008)(41300700001)(316002)(54906003)(6512007)(31696002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGRsdyt1UjVhS01lem1Kc3B2aXN1NWNKNUJDaFJCd3RUeHowTElaRUkyWm9t?=
 =?utf-8?B?UkVaTjJzVUEwSG1KMWtRakQ2YklVdmhGempWV0dlMlEzRXRqLzk0RG9wTGgy?=
 =?utf-8?B?TEdmMHMwTnJ3UWVRaDNCMDJ4Uk91V3J1RHlBdzcvNmRFRVl1YUI1MUMxNlky?=
 =?utf-8?B?dkd5SEU2RGFJVWpIR05aZEdTY2ttSHJhcHpMcFp1REpzOVhSMS9BK2hseTBi?=
 =?utf-8?B?SUtUN2RsK1FubCs1WWVKbkVreG90WVpTczZuVURVTERnM2VYZnFzb1dtZEN0?=
 =?utf-8?B?R2tzOGtwSkZiSGFhSU83Zk93emFxdWxnK1RseEJGNjhZQmRZdWNvRnBjcnpT?=
 =?utf-8?B?bWg1dTJtZzQvUEtlOVBKVVEwN1h4bW1SM0d4OCtZbzhNRU8wN3B6WWtMMVYy?=
 =?utf-8?B?NFY3Vm1CNFQ3eDQ2TTdLdGNrNmVjZzh3WEMxRXAxS3Jzbmkra3o5OW9ZYnVp?=
 =?utf-8?B?NThCWXNrWUROM2NtMk1MVGhKOFdDQmxmcFExSm0wdmJqRFp0SkFOMTE0b2Mz?=
 =?utf-8?B?RXVoYkZNdURnVmdOV2xhdTZnVWxzOHI1ZlQza0dzNmUxMUpaVXZaU1FiMTNT?=
 =?utf-8?B?MEtPWURYd3Ztc2FiWUM5cGx1ZTZ4ZnhyM2k4TlBhLzQ3U0puRFNNNDdVOWJM?=
 =?utf-8?B?d0RCVWZWUEhjcjFPdEs0dTVXVDc3MUZxZjRMeG5pWGJLY1o4QUxzc0E4RWhN?=
 =?utf-8?B?T1dLYVdtYi9QcUY5TnVnTkFqS2dDU1JjNUNxVE5TVzNMcTBvS095ZkZjbFlT?=
 =?utf-8?B?RlgyNTVyVVd2ZnpvdG1nYWpRd0pOS1NDOTQyMFZjZjF6M09uT3BIdVk1ZHZj?=
 =?utf-8?B?L3BNYldYLzFBQUxRWWViZVhhMk4zV0hsZEVhOVM3VWNJbjFHRDRIaUljSlhW?=
 =?utf-8?B?dThOdmlDYyt0TEpsNnBVd0cxSHc5Vmo1ZVRjVHJIaGZOSFdBZVZwaDNsTlBZ?=
 =?utf-8?B?WWZBRjJIdGN5QmtzVjV3djR4aGU3VHZkbW1BY3NoZi9oTTMrU1lmQ0czREhh?=
 =?utf-8?B?NWF5Lzh2T3dDTHdoNXhwSlpuUEVISzhuLzBVSlJpUXZZYWJBR1NhclVQZ01m?=
 =?utf-8?B?T3ZCQkdtQ0s5NVUrY3FnQTZZT0xOell2VTlEN3l4UTJLVzNKb3hEbHlsQVF1?=
 =?utf-8?B?VkdQc2RFUTFqODh4MU1kazJCeis5a1MvQ1hzWnhNR1JUMG9mTnBNM1N0QUpN?=
 =?utf-8?B?Mjd4WXU5QXdzNFRDK05oU0NYVFBGRUp6YytNVThUOFF0ajJnNUxQQStyYUc4?=
 =?utf-8?B?cHhQeEtDWmlYSXFJK3IwdFJKeXNhaFk5OGVTR0NVRWwxME5ZSGNJTDJnWnpq?=
 =?utf-8?B?SUN4NWlhZXl0aUZYeTdiWGw0U3A0RDJ1Z1dzdk9PSi9RTFBIL1BRa1BrL2d2?=
 =?utf-8?B?cllnVzdLKzN1SHVEbndkMU1zWWFHVGFDUUk4MzhzTGpBUnJ3ZElSL3o3R1M0?=
 =?utf-8?B?WGpWNEpHUGluYWpvQmdCWS9vZUYvdFBaM2MyYlNMVE1WQ3dyTmhneC9QMG8x?=
 =?utf-8?B?SzErS2JHUGlHdTNHMDZCSnVvUGlpRnZuWjRUQnM5bGpzdnlhdnBlbHVSQ1lL?=
 =?utf-8?B?Wnk2blRwWmJrcXhHRWtta1k3VDVxM1VwSXpIL09zY3BjWklSOUI2MHp1THpQ?=
 =?utf-8?B?anZFMGpRSFdaZ2QyellOampmenRrZkxrZndIWmdSK2E1blRmakRiSmFOTWMx?=
 =?utf-8?B?dHZHeFp5QStpTldQTmFTWHdreDh4Qkt3M1lUUUV2UDVuek4xTTZQY1JlL0g2?=
 =?utf-8?B?WFpGaFpCS3Q1clpRTFY4YzUzeXljTVFuTEJ5VGpiQ1JBRlZCdzJHUUh1NzVP?=
 =?utf-8?B?OXBnWUlreDZZOGFLTGZub3FOUkNSMm5XOGRsc1JYTW1Sd1A0Q2k5OXlkbGJJ?=
 =?utf-8?B?K1c0c3BtV3RQUHAxeGNINFF3V1c5RlJKeC9xc0gxVFJmVGZvcG84c1lqTW1v?=
 =?utf-8?B?TTNTRGxGaW1DNncvSGxaQ0NQblh4ZmF6bHdheklBN2liZmpnYVhFTUxYRzlB?=
 =?utf-8?B?dkpjM1o3TzRhRGRwNHNKeG9xUGVTMllFSThVT3NBbjBZbHg2SktiRkU2eTRI?=
 =?utf-8?B?QWhpRFRpL0JkZFQzWnZ0SW10THNMVWhVVGlPaithSHlBc0p5bnpheDQ3dUg1?=
 =?utf-8?Q?lWid/BoiMuiGfftCl19YUw8Ii?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3863bc-0714-4d64-c383-08dba3e04f77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 13:53:20.5446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNl2aBi8feiqkcznY31TIY61PivPTxkiLHomJ5QuhzbnjHiNpeuH0oRyG0l0lzf82zixbvOQTpc/wfCR1nUQpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948

On 23.08.2023 15:45, Anthony PERARD wrote:
> On Wed, Aug 23, 2023 at 09:21:26AM +0200, Jan Beulich wrote:
>> Two entries were left in place by d638fe233cb3 ("libxl: use the cpuid
>> feature names from cpufeatureset.h"), despite matching the generated
>> names.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

>> ---
>> Permitting "psn", "ia64, "cntxid", and "perfctr_*" when the hypervisor
>> doesn't even know of the bits (perhaps wrongly so) is kind of odd as
>> well. Permitting bits like "est", which the hypervisor knows of but
>> doesn't expose to guests, is also questionable.
> 
> I think those are just aliases, to a specific bit in a bitmap. Even if
> we remove those aliases, it is still possible to instruct libxl to do
> something with those bits. So there presence isn't permission, I don't
> think.

It's not permission, but recognizing the field name when its use then
(in the best case) doesn't do anything is at least misleading.

> Looks like "est" is just an alias for "eist", so it doesn't seems useful
> to remove it either.

Well, I'm effectively also questioning the exposure of "eist". Using
INIT_FEATURE_NAMES here was likely okay as a quick first approach, but
I think we want to limit what is recognized to what actually is useful
in at least some cases (yet better would of course be to also not
recognize e.g. HVM-only options when we're dealing with a PV guest).

Jan


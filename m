Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246CA7257DB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544502.850329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ocz-0003sv-Vn; Wed, 07 Jun 2023 08:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544502.850329; Wed, 07 Jun 2023 08:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ocz-0003qA-Sk; Wed, 07 Jun 2023 08:34:49 +0000
Received: by outflank-mailman (input) for mailman id 544502;
 Wed, 07 Jun 2023 08:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6ocy-0003q4-So
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:34:48 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2978dc2c-050e-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 10:34:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9746.eurprd04.prod.outlook.com (2603:10a6:10:4b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 08:34:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:34:46 +0000
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
X-Inumbo-ID: 2978dc2c-050e-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIyFxZeQ7jcu4aGfn/X71UbDZv/lLb/d4H73IxABiR8PypygBdtyKxAd9S6fNuT/93DDeQ8FSuV+OBh1g807HqYkGfymT2de4+48Dt7IAnI/75wbE2xzONwbUMr6kegdxSw/ZLHecX99ORsONeE0sDdTwS0TukQKHF/yAToJ3gWzVHDkCnDlmBHap8N0CfFjiGstX1PMjZ8VDEWOiM5psk0t1hD5Fg6l4nmo8xrDrIWITODMzRNFBaOoUA+ICsmrgvlrTCKu+VpUGdUbmrR7V+QHBhZ9qSl8mZR/TIic89xeGUOBuU1YOpESUjqMdUuNjUKPwbJMu4QGsqFWZRE3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqXVfS8dWoGA292OdjFTJPjsT5FSP3irJhSO3rnyOCc=;
 b=Hr/2xqiYf8YK1/FvOsj68x2SilGDyG3KttZBuiMbrEeEByPYeVprIgEvopGzxrEu6+IEgoQ4Y7iMz5Nsh5Gsn5+T4Xnc6uB7vIDCEGRVUfQS1N/VyOICnaQH3NLTV4WQvVV8ysCOgVMN6K4QrOBpIK29pe9TIOettibhD7KXUTPEVHcgEJW+jCdhMXw3QD3Fp8aDrPhp7teR5O7tnqiUsMTnLQtmtcpvaziBGbS0SdN/fBHN0B6bWAqPLmCNwHN/tN2Q9L5j+RsrQ9UJzXrVAbmbHZsAt+2TaxqAZ7H5sHDFT8c8JPLCgNJhOEA07+NvWcZnQPc3BW6MaF2zsRpcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqXVfS8dWoGA292OdjFTJPjsT5FSP3irJhSO3rnyOCc=;
 b=hYbrw30O7aboAMOR5nFoTlWQUFoZ7LLXRHyw6C941UVlanOj38CQUl/KkN6h5Nq+NeemJuVVfP/nhCy/L+EnRCyOfG78NSCwOVTzc3E1ORs9MW8wCUtZQ1vkGCgM08jZmnwDGiM0fKzWDQSFBWxTFc2Narc6vMn/aIB9fXCjbbGH7gdbifrY2gcobROP5MBo495UdQfH/yDJq9O/LwNTFTkGgyNWAZhe1VrKfWi+d/yIGMNYdldZzmjFwJX+alJIeonlcEGIeIzMKWdVlsFsSkqqg7yddJsx8Q/cxeM62IPEs7siod3lxNZBXAcPmnFB+AHSJlb8a/SuDyJzFGkEEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5f334c6-530b-cda8-8107-5d2f14af4d0e@suse.com>
Date: Wed, 7 Jun 2023 10:34:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] xen: Fix incorrect taint constant
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
 <1f356d3b-7068-088a-a59b-eadbfb3f59cd@suse.com>
 <C695B8A5-52E9-4809-89A3-65B028BC5834@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C695B8A5-52E9-4809-89A3-65B028BC5834@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: 4756faa5-fe18-4f6b-a7dd-08db67320c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jvVWq957In2EkrKzwiMRnDm+CIcWDx9zt5Zc4XBFWMTTq/ztsNa9YvmT7i6hI3zGRe5PnYu7LpF0UjXnoTVsZ7qlwuPw4C8/W9hlyYcuS5xH1DEHuwMxCU+8hWetdE6p6m7enBtz8ScEi0n4JBd3i2GcnTS2oM0guMXQRG2bO/ybIVvPE5Bw9qsSRVGRtLH0Aw8O052bVz2ij7zAqd0q25KE7tP/8PkpCkKs2L7JLhaQ6HYHMXYwg1ucJHHgQbvZuf7suFNd0HxJmcgiU5qj648HTrTMQzlFAhhRgjygZTH4fCK3WFSheBbOXmKHd3J3q9Sx4EF3UUSox2Y+dgOrxhSGYL+CbvnN3TdORyhTknpXDJ5HIwVr72/n7X7g7Y9avGZESIFCbj06Khz2xgjBX43wBLATS3YAirTkUntVVbFrahVCdIivrgeqey14XmMACi9ad/AssI2BlDN9rljTWNTbzF7SmZQT8I0CpfIXyvAywArep2ND+oL5urWTTh2YN0iAKLmLmk335PaoODNKQQgWOemIUOPOq1a0xy1ByK0ZNMqdNnfg4muV8+lz3qJyJuS70PMbszQr+R4qPCSxDLuuXgGsMR9Jo+YtzdAnYYcqN+y4rMrmluGWiKjvWzGJmtV2SpwZMQWKCqc5Qml8Bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(6486002)(36756003)(2616005)(83380400001)(31696002)(86362001)(26005)(38100700002)(6506007)(6512007)(53546011)(186003)(8936002)(5660300002)(8676002)(41300700001)(316002)(4744005)(2906002)(31686004)(54906003)(478600001)(66946007)(66556008)(6916009)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STFTM01lcEJEUzBlTTNwTFNJRUk4bjhDWFZiTk1iTTZRYlB2V092UjBsT1Nk?=
 =?utf-8?B?RGNwbGt3WVFUNGtrNC9IUnY0QVNrYTB6eVdRbEJaM2dLcHExVW0zMFBndDdF?=
 =?utf-8?B?U0tLTkFYUjJxbmJsKzZkdGMvQ1ZDdzJVUExtMDd5VVkwMDg5YnJUdXdkNGNM?=
 =?utf-8?B?YmZrTCtZRnFEKzhVMmFta1NxbXFiUXlBSzRybFZ5RGpIZUNVYTJmcFVFYlh1?=
 =?utf-8?B?dFBKWmtOQW1vR0MvZUVIMzBlMTRDTFRKQUNoMzdKRGVuQ2dPOGRaMC9TcUZl?=
 =?utf-8?B?dE96SHFHQm9IUFMvcFlpMndPRmpTWCsvNEI0dk9WRUxtNml0OEpHK1VMYzVU?=
 =?utf-8?B?QzlLd3FrMThFQnpmSjY0eXRIeU1JWEl1ZS92anhnd01WTll4ZzdNYzhvVUhD?=
 =?utf-8?B?Vkd5UjdDWEp2RmFQSVlIN2FnaVMvRDFrOFNGTXVFVTR3dDNCNkxONE5DQ1Jp?=
 =?utf-8?B?dXRFMG9pTEluQVo2Qmc1cEw2d2FDSFJDMHJodTFuUHRIWE5kRGFYSnVEdWl3?=
 =?utf-8?B?VmtHVTQyR0F1TDVCdTZieGZDSXNCcDIrUVA0ZDZ3OTlLbGFGZGZramVOL1dL?=
 =?utf-8?B?QnZnSHlLSnc4R0Q0c1Fqdjh0L3laZ29vYlR1ZVVIN1gwZ2hLYkNhNkU0MDh4?=
 =?utf-8?B?RlhEUm5LVTVUWUhUMXovVjc0NGRCSEhJd2F3NVhrQ1hlQ29UbEo4T01FSnNF?=
 =?utf-8?B?NG4vNEZmanVHbkZhWTJmdUFQMTJUWEQrVHVaSjJzL2lZSElrZGltZCtVUFFT?=
 =?utf-8?B?VTNOUFBJTGU3c096ek5JSVFvejhqbSsvSFVJQ3ZXMzF0ZjhuTWdNeGQ5R1lE?=
 =?utf-8?B?V1lWMW8wTTMrZDU4NXQzT3FTT29NbTRaR0pueTdyblo5alBlMy9wMGc5NGk0?=
 =?utf-8?B?Vk0xMjNoZDl2K1FOcWZpL2haNjJtZDduWTNTVG9yRTVJeG5EQVBjSUNpeUc3?=
 =?utf-8?B?UWdZbm40dFljN1RXemhmcGRsUEw2d2ZpUVQ0Mm9GaWVSTWo3REphd2kyNXA5?=
 =?utf-8?B?REh2NDJSaUx1WDFlZi9Obnc1V1M1UzlrL21DeDd5S04xeHNUSkZCS1NFT1Ex?=
 =?utf-8?B?SmFqak80ZWd1c2lnay9WMHc4ZWZzVG1lcEJFbGZnWWRWTHVUL3QyNUNjaEFq?=
 =?utf-8?B?ZkNNMzVDYmRjdDIzMDhyTk1hT3IyQno0S00wMVFXMGJVeGNFT2JWdG13MG1L?=
 =?utf-8?B?RWYrTVlOVWd6NUwrbXVsc0R3M0tIYVgySnNENHMvenkxaXYvTHl1aTF4YTlL?=
 =?utf-8?B?YXgwR0xoSmhZY1VodG41azVkL3NVWDJsY3duSHV0S2NNQ1FMcVRyRXYvcUxw?=
 =?utf-8?B?WGpSOUNjbDNLNHdyL1BFQmo0Q3o2dVROeXNvbEd2czc3bkQxcWZ6RDdDS0Nx?=
 =?utf-8?B?OHRKaHJNeFpITU9PNm1xU2FGdTJIRW1RL3poUkxLSHI1QWU4My9mRjNNNjZZ?=
 =?utf-8?B?WDFEeXViZm0rNWVqdy92eUZSYjNtS1FqeVZqN24yeVdqOXh0OFdBTU14SDBQ?=
 =?utf-8?B?QisyOFlpRmhVQUxnRlA1T1BqZEtMRUNGcXFCQ1FOQ0xuZzMvVGNhZmhGeEZi?=
 =?utf-8?B?NmN4Ly9wZXhpaUU1cnRPYlhOM3JITjFJZ3JUOFdwa0dYL3BSQk9ucitqN3ps?=
 =?utf-8?B?ZUp3akliVnA1VDJXRHNMT0htTm5oUVZoT1NYOFdicmNCdUhwRFZCWVJ1K3Bh?=
 =?utf-8?B?RWdhM3NsUVhzUkc3d0VTSjIzbUhmdlpuaGVGQXVpc3hUUDRIQVhTN1l1cjRm?=
 =?utf-8?B?RE9oVWtLN2ZRMlYwOTlQTGFtVm8zZnBJOGh0SVo2T0YwUUZKaUpHZjFaaS9C?=
 =?utf-8?B?c20vYlhySDFVTXRNZ3ZXUkhPdGxneWRlYVhnNmFhbk82U3pIVmpZTkpkYitz?=
 =?utf-8?B?MjlZWkgrUUdQK2VoOUhPRnBNOE5rbm5xN25SNmZKbzBzRjV6SDRiOWtqUEk3?=
 =?utf-8?B?dXFrbnNOVFIxcUlMMGc3YVBZM2hncWQ4bmV2SGZaenJMVGVSd3NaQXJkSWdp?=
 =?utf-8?B?b0c4NjhRcXZMclFZd1I5RVFpc1RBMUxsVEhZaFpjSWEwaDhQemRDbGlhaURC?=
 =?utf-8?B?eC9jek04c0VwMkYzU2NQVE5aYmNhTWxQcER2T2owb2ZTOG9laTVtdWdKMUdO?=
 =?utf-8?Q?fgR5i4Z/Jsw8NMUHVxxh+mg+4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4756faa5-fe18-4f6b-a7dd-08db67320c84
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:34:46.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7cD3HoAHCRPXGvvbE1E6niqexuAP3jGuR7wVL22PvZAL0My9lxaZldEBV+vC2aJIk711MVCBYktO6fYB/8+gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9746

On 07.06.2023 10:20, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 7 Jun 2023, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.06.2023 13:23, Andrew Cooper wrote:
>>> v2:
>>> * Fix commmit message
>>> * Update comment ahead of print_tainted()
>>> * Change the emitted char from 'U' to 'I'
>>
>> Just to mention it: With this additional change I'm no longer
>> considering this applicable to stable trees. I realize that one could
>> argue that by taking it we could accelerate learning that we broke
>> someone (if anyone), but I'm not inclined to follow this line of
>> thinking. If Arm maintainers (seeing that only Arm uses this right
>> now) think they want the change nevertheless, I'd include it,
>> though.
>>
> 
> Not sure if it is what you mean here, but this is not a candidate for 
> backports definitely.
> 
> Or do you mean something else here ?

No, you got me right - I was asking whether to backport this.

Jan


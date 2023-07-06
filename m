Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136627497A2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559796.875118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKaM-0000gj-58; Thu, 06 Jul 2023 08:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559796.875118; Thu, 06 Jul 2023 08:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKaM-0000dn-1u; Thu, 06 Jul 2023 08:43:34 +0000
Received: by outflank-mailman (input) for mailman id 559796;
 Thu, 06 Jul 2023 08:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHKaL-0000dh-85
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:43:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f13da59-1bd9-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 10:43:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:43:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:43:28 +0000
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
X-Inumbo-ID: 2f13da59-1bd9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KL6ruDbBCGmYXCpfKUhwAPXlnYLtFKs9dLLc7umR+8N5p73zy3G5ujwdkkY1Im1ehOBxBnUYQle/wknpGnXst4lES57XWZI08wtGLGgPeMcq0SIe6G8nTHgpNFuMoJQOrPuLu9vPjP8OqhvxKgCcaaxTXN5ZxSdWBwBOyGwHZUZp6uNinwMSQlUD2V5zoGXmidLYvYWfErJccjNU+R7q7/G6/nU3NpnU/GVOgtarsZOrn1PavRc4azEedB9UJsuSHHErL/RPlJOSQoSKcN01rrARheWZmOxPXeMK6WWt2pbE8JsFQrJKghJ0C4T79xpWDoqCuaQBn6N1JVhf6p40RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6qKOx1wn4Cf7fVZBAez4dodxwvH4ey9Fihm5FBMGno=;
 b=kMxG4Z9wxA5IzLLWb7Gq0vC2hY5f8taJL5VLY8UlbLhl9UKKoPsXEPyErEaUJB8vkmjcDxaFmKWBMO+0ndcpAcHi2qgJ5zks7YuU23EksX0maSyFmba2lb2T0Jc5qbES0BoULSF/+IUuFkZ5r1vbGAc7oUcDncHlMK3/tCL5YRXWgqNKOMljjOk0lBwzs9zKegWJ3bBA0TMLg5jZpg02P4dFuGiRPIYr3JOMC8ASNPvVDY2fx9lEk2FCjZUufuDi20Qx0aYFehTiSc0b5dggj74tHqlarPHmvPQXR0yBxFSs1vRAv9Um7hV8VhSExdzRpxLpd00YtjOGVaooWZKIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6qKOx1wn4Cf7fVZBAez4dodxwvH4ey9Fihm5FBMGno=;
 b=ynCkkK7eevzYdkQ7IreNvq3io9woi4BN28KLoiKFCJ9lD1n2v8TMvzmF7HQMFEpS+Fx2rwV78pjKCt/r4W6muh8Cyex/OwOpiW8P4DNqc4sbNFX/KAIEaAQyHJcxPoQ601TQf22ZhUAeN2BQEF+3E7wVUvE+vTcKiljjRY4CZdlYY4W0JGThEc+vs7TieIPGTW5vJqfxIzOcbAm40ccKwvcIiNhKnkmBO0uAPKSOPeTroHbuUTw/rMzSUZaD0HD9pVRIPExPQ+GsoH7nq1IWXYRMiQYhU4LIA14LkpZ4qAszbNWUh5FJXcjCYyMvSwmxwH0vGB9w4VXATo4QzKwn6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <763fdbb2-d63b-906a-7432-f3b1e14cbb3e@suse.com>
Date: Thu, 6 Jul 2023 10:43:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
 <290e4dbf-c9c9-49c9-29ea-6fc9b9a5a4fc@suse.com>
 <a55021d5-39d9-a928-4b82-6bc6a02b42ef@suse.com>
 <006e528d-8955-8324-ed58-bb0bc0e72acc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <006e528d-8955-8324-ed58-bb0bc0e72acc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 853e1f17-1025-4336-eb58-08db7dfd1201
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iibGL/UPMrDQ2roUx4+aFMq1x8Dd7fvkTwG9BKQuR+Us0zfdH0y9z0sqIKViBQuNpqhFIsGhXg8Zl67peYV/IHoM9C/WiHU9YhodIatlUrtN+ntHHaQSo3DZFvN92/wafkl9dCKeFvjnTQ3xlo7cogCpjQOHftCjg7GT3mUIpx1Aig1ylYUsjGjv3eQq9Srb4SbdZt8SoBlPFA0Vz4NDfG7ob8A9AIv2eakAydR/jla7ACWof/COpEsXCXW+dCeozJ8Lcwuqx/Pu2sN/BKXvWCvGAKy7BGt7xNFJx2aHKleDUzAxBP2CmZfieMprDbym9ERFK7vd0YSfXnval8xEmv3W/3Fs4vE+/uD/ECswfVs36bT3vitsXOCEsZlW39qfAgpq7T68G8A0k2ZusrmPnQAryT+xLd0QQjy6ATl+XChXTEkd+oEicFLRIM6/PSAyuLt/BM/TL3buDN9O62Og3UiAhDA0LVYuRwQyRZJkrZjsNn93IgYm6aatUVSznjc48v6GT+U14nWR9rBuHZ8M49ADAyZjicT8j55M1I/TaFyLghaHkisf7q9jwonL1FutP/YjHsXolq6JV5sVFumtWABpz/rx3rg/gYTI40D5kHInYby/lRr+vf+xpWrZYwZg029h7eyp/84jR7S0rOxDAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(37006003)(54906003)(6486002)(478600001)(66476007)(66946007)(6862004)(41300700001)(8936002)(8676002)(66556008)(38100700002)(4326008)(2616005)(6636002)(316002)(186003)(83380400001)(6512007)(53546011)(26005)(6506007)(31696002)(86362001)(5660300002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmtCcTI0UTAyM2N5TkJtaCt4aWlqUnczd2VRMGM3VVAxQlRwaElocjR0NUtJ?=
 =?utf-8?B?RHNKS2xPdDlzem5HdWppOHVBMGJ6N2VCc0VURDluRTZ5YjlZbnV5MWw1UFJR?=
 =?utf-8?B?NUNkcWx5bGJxWnZpaC9CcUg1MTlRM3k4WVVVVXZKWWIxYXdtdVVibVZPb2Vx?=
 =?utf-8?B?eDkvY2JFZSsyYWVIdU5KNW5pYVBpbmgxS3pFYTJoWlJ4ZW1Tb0Z5MzhUUlVK?=
 =?utf-8?B?RnZYNTNUUVhuaXhzVDQ4UGNRRWpqWHpnSm1SemQ3T25QQTMrZ1lOdnlvV01n?=
 =?utf-8?B?Zm01ak03REtJZWZLQ2Q0bkdBZHJlRko2b3llZ01FQlJyNkZkU0JBR08wUXZh?=
 =?utf-8?B?bGtCcyszZTdJeTFnbXNjSHpZSDBuM0ViR0RpbGdGQXRKTWNrQThLYlE1MTYy?=
 =?utf-8?B?cmZTU1lWWDlaYUJ0ZWw4TnhuTGVmU2pIMXBNZm1pK3dkSXJTbjUwbGJLZk9P?=
 =?utf-8?B?Mm43NWZnL1ZCK09RMTk1U0ZOSjI1R3R3ZlFaVUVjZzJxcTFSNkxzcWorcXpC?=
 =?utf-8?B?OGdGNUF3dFdGTytXYXdsTGVNV0pwbjRXcGY0R3prYTJRMTYyYkNOYWFDb283?=
 =?utf-8?B?R3FLbWhENTVaREJaaHR2cnJUQTdYRXJuMldEZDFUODVwMC94bENYdzJtcWE2?=
 =?utf-8?B?TFpMbGVBaGd1cFdQT3lRT0tZWWFUMWFWeUNBdXhqaFU4WGIrbDEreVBrQWlR?=
 =?utf-8?B?cTdCczVjL1J6NDZ6eWZMZmJBK3FBUTFkcEhUYjlueFlCTGZ6MUJYeFB1dVlN?=
 =?utf-8?B?bkJBSDJydG0rL2U4RHkzcnp6N1MvMk5rOUhGRUx3UmhkUzQzR1E3TDd1T3VK?=
 =?utf-8?B?ZlB0WC9sUGdxQlJjTXJJSEFuOEk4bG5CNDJibnIrcUo4cURJamYyWWRkTkVE?=
 =?utf-8?B?SCs4VGdUa3hKRFlXQlBpVyswK3pRd2Jjd0FmeVhyTW8zMy83cjZ5dFdTdWlq?=
 =?utf-8?B?SzJYY0VyeEM1ZWJIYXVGQnhibEFyWEVtMHJQM3RNNkhvUEl2Y21ZUWlyRS9p?=
 =?utf-8?B?OGl2Qk9YREtUQ2lQZTFSU1FaS1AzL2V1WVZRVGhPSS8yVFpkbVBJL0J0c1dt?=
 =?utf-8?B?UXhEKytLU1FGQnpTN0NTMVdWNzRsdFZXTEI0dE1Dc0lYQkwvNGI1VzJvbitC?=
 =?utf-8?B?Q3p6VmxXdzl3ZWYyQ1lrcjEyY1dWZlBDQVdiN2ZKNkRsenA5bUNmcFRVTndB?=
 =?utf-8?B?UkRVeFNtcjFtSytlNVhxNkdoTlFkYS9oODJsWHJNZC9pZlJudEErWDI4VW9U?=
 =?utf-8?B?S0pzaFdiMjlRM01FS2FDNHh3Vm1NQXF1dDBCWXBtcG1Pdk1vbUJoR2JmMXQ3?=
 =?utf-8?B?SUwrTjZNZ0ZwZVN2N0hXc2ZOc1UwL1VUSmMxb20veU9wVEVaSmVwTE5rTzUz?=
 =?utf-8?B?aFFTODhXeFFxMWVRZExqSzNFbkZncGVKM29QeFMxR0hkRUNPTTFYd3A4Y0pT?=
 =?utf-8?B?VmI1YlAzMWJDQnZhamQ1L2NLZlFjbkxyVDI4VlhYNTg5ZjI2MFNqMGRwRVVv?=
 =?utf-8?B?RVBiL0NpalNRZE5CU2dzYitvcjQyNmRPelplM0NyektkbGJ4dnVnZmhzVHQw?=
 =?utf-8?B?dlhlU0plK3VyZjA1N3pOem85M0lpNG1vQlpTOXo2V283VkJyK1RmMFdUUnlR?=
 =?utf-8?B?MzhVd2tuV2xDbnZQZGVwdktZU0cxbGhzdUpuTFBDU21RenJTK1lXZ1FqcXF3?=
 =?utf-8?B?ajJVNjlIZlM3cExZZFBOQkxTMHFqSzZ5Z2Q4V0xOR3E1ZFBIRXJTNVZrc0tm?=
 =?utf-8?B?VmozNkxSaWhwNVE4NGFnWmNSbzlXSFZnMHJIKzhHem5hWXdhb1VnczNUUEc1?=
 =?utf-8?B?QmtHM0drbXNhaHg1ZW1USE1tdXMrZTU0eC95MFZVeVBwUFRDc2RCZ2VLcEpn?=
 =?utf-8?B?MUJ6WkhPOGc5N2Z6dFFDL0dMMXFKR05mY09mUlJjN01jK09RZmlaY1pVa0hL?=
 =?utf-8?B?bHU4bkhDNGFVQmxLVzROQ25zcEJDT3dpUXJsVzgzaWZjSUoxMFA4aWtXeFNz?=
 =?utf-8?B?Z0c1a2hhdDhCVk00T2FGSkRMS25UbURCS0N3STNUUEhIbHBwcTNyZ1JLMnJo?=
 =?utf-8?B?TEEzY3kwbmd5K2ExN1Y1QUhVenNuSmpNalBnd1hMY2xTN0cyNXhPQ2RxNkd1?=
 =?utf-8?Q?bfNWaGiNpKe6+RagjHWdGAYvV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853e1f17-1025-4336-eb58-08db7dfd1201
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:43:28.6456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKP2LdfRN26DpxEx7sli4RZe3FA1/qSV3oBTTpNLJ6UHz5WSmbDl3jWRX028hcgQW0zi4Qrst1QBY/NQqLD/NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967

On 06.07.2023 09:57, Juergen Gross wrote:
> On 06.07.23 09:43, Jan Beulich wrote:
>> On 05.07.2023 17:33, Juergen Gross wrote:
>>> On 05.07.23 17:26, Simone Ballarin wrote:
>>>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>>>
>>>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
>>>> headline states:
>>>> "A 'u' or 'U' suffix shall be applied to all integer constants
>>>> that are represented in an unsigned type".
>>>>
>>>> Add the 'U' suffix to integers literals with unsigned type and also to other
>>>> literals used in the same contexts or near violations, when their positive
>>>> nature is immediately clear. The latter changes are done for the sake of
>>>> uniformity.
>>>>
>>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>>> ---
>>>> Changes in v2:
>>>> - minor change to commit title
>>>> - change commit message
>>>> - correct macros code style
>>>> ---
>>>>    xen/include/public/io/ring.h | 10 +++++-----
>>>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
>>>> index 025939278b..0cae4367be 100644
>>>> --- a/xen/include/public/io/ring.h
>>>> +++ b/xen/include/public/io/ring.h
>>>> @@ -36,11 +36,11 @@
>>>>    typedef unsigned int RING_IDX;
>>>>    
>>>>    /* Round a 32-bit unsigned constant down to the nearest power of two. */
>>>> -#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x) & 0x1))
>>>> -#define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    : __RD2(_x))
>>>> -#define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    : __RD4(_x))
>>>> -#define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    : __RD8(_x))
>>>> -#define __RD32(_x) (((_x) & 0xffff0000) ? __RD16((_x)>>16)<<16 : __RD16(_x))
>>>> +#define __RD2(x)  (((x) & 0x00000002U) ? 0x2                     : ((x) & 0x1))
>>>
>>> Shouldn't this be rather:
>>>
>>> +#define __RD2(x)  (((x) & 0x00000002U) ? 0x2U                   : ((x) & 0x1U))
>>
>> I don't think it matters much (as the comment says, the input is expected
>> to be unsigned anyway), and I expect even the one U that was added here
>> was only added for consistency. The sole one that really matter is imo ...
>>
>>>> +#define __RD4(x)  (((x) & 0x0000000cU) ? __RD2((x) >> 2) << 2    : __RD2(x))
>>>> +#define __RD8(x)  (((x) & 0x000000f0U) ? __RD4((x) >> 4) << 4    : __RD4(x))
>>>> +#define __RD16(x) (((x) & 0x0000ff00U) ? __RD8((x) >> 8) << 8    : __RD8(x))
>>>> +#define __RD32(x) (((x) & 0xffff0000U) ? __RD16((x) >> 16) << 16 : __RD16(x))
>>
>> ... this single one.
> 
> I agree that only the last one is really needed.
> 
> But for consistency reasons I'd expect all optional "U"s to be either dropped or
> specified, instead of a mixture.

Funny you should say this. Shift counts also aren't allowed to be negative
... For this reason, the pattern I see here is to have U uniformly on the
lhs of the ?: operator, and nowhere else.

Jan


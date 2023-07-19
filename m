Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F84758DBD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 08:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565590.883858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0bn-00074A-29; Wed, 19 Jul 2023 06:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565590.883858; Wed, 19 Jul 2023 06:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0bm-00072D-UG; Wed, 19 Jul 2023 06:24:22 +0000
Received: by outflank-mailman (input) for mailman id 565590;
 Wed, 19 Jul 2023 06:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM0bk-000724-V7
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 06:24:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4e3768b-25fc-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 08:24:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9227.eurprd04.prod.outlook.com (2603:10a6:10:352::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 06:24:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:24:17 +0000
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
X-Inumbo-ID: e4e3768b-25fc-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtmFgYwZkhz18qJ8jr8wBBirtjB24kJSGBhRCp8jT2LluersSh6JpCo6lyoDltmcbGEPy6A9l34OGJnBxNrC4CnG3J+h7nz7fXF096Yslw6vrptE0h6J4R35YXAiW492d6JVS9VHmgWQ9ZnRsH9DyDhivH1Y281H70tSb+MYjRRF3MYPRIYcjWyiggILEeBkcChazDfHmOSQDESnpZ14SbSTW9EKHbK7feBTJKSzk+BVrua+4pB8Zoeho5SSCflzfzhELtmIVoyrEV5kd/X17eHMTovwF2TVfL4syVDzg+kGila7sCKuA8BfzbUlydvwNd5yK2XE7gShpchVTng2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k7Al9sV22UZjN+ji+a6fYKudxpophtIgISnqoxdZAU=;
 b=GGWKkjCXvkm0v0mU8oDIrB9Gf8l29QWg1TyCcvsiVYFXxSuuA8Q/JZ2oSbvveJBrA0mXPnn4UKCvaSSP2+9dQ8bvxmuBhArkbFJiGj7y5QAfryyK2GAlTQUWtUY8dPH/zNDy0Pr2JgRlOdTZcl39saeREe+qiIMhDtt41OETIOTPm5aRS7DEOGzOPjyJGQAUT53DWlr+VdmcNnOUSanhET5a+KeuX9DVFgOtTrCpRVYUsA9Ob3frI84N8SGuYURrY/0F2iILvJR9gRj+w9a022g8eioyr9ZtfQ3wickdwYJVlbJnG9t8OmvoLSeYsJAx+tf3LiKdPu9xhi0tWMnu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k7Al9sV22UZjN+ji+a6fYKudxpophtIgISnqoxdZAU=;
 b=pkxYSlMTPMfLliIFwNVxyHdK6rq8xH4+2iiY0XLB3CTWKOcUPvcVVN+oxMfJ/C6Yn6Uj5kRhSh06i3eWOyCb+MLLWxqUgeMHVtbFqbMeQds37FEDajB27AegkQiYAoVEof7shpwcH930JQsNXM+a7FEhXQ0zhZfXbFAnhpk+TLU2UtfymWi5W7ZLdy9YitJvn025f+iQPMPUsI1mI0Nm2EEz98tVW9Eqgb/O5+VSpdOwUWshpFGv0KUewPBzJMPx8oF+TarLvLU4tlcl6X7KsYdj8+ZIcMqevAH82+/TBWXDZMFTFzKfoNgX7zWQ9XCWnCuk8TnN1ah19S2hmWMKqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98422c1d-ce7f-7700-20f7-54b5e68b63ff@suse.com>
Date: Wed, 19 Jul 2023 08:24:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] docs/xen-tscmode: remove mention of numeric tsc_mode=
 values
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <a8223a339a0b8ff3c0d04fb4ee2913c7558cc131.1689294071.git.ehem+xen@m5p.com>
 <ZLCj62XMBbspMWbY@mail-itl> <ZLDErKk8ziBuh1ZJ@mattapan.m5p.com>
 <b3db9387-8139-e7f8-d250-9933e288f9fc@suse.com>
 <ZLb9AhaoJDixR7Nf@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLb9AhaoJDixR7Nf@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: ea13cf5b-c30d-4de9-94e7-08db8820c7a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4UTR0JEG/3yqgop1fDx45d2+tN+Uj0dUVsslXIUmmf5cjrytKhbMXRnV8cMM2nvVInr+PhEQNhvp130hpdVF63zSmimcsJRh6ZmrR2OeYUjGRW4lCQCdqYNhkFeTe8i4vg+hDmxNz3xdk/oW2sVCoq0Hl9CfDg4qE423Wvw6DD/NPud2V+vQP7XXQT4hd8jr2GrDfZ1aN9SbaEarSCKXk8ylU2Ea7Ij8j9nteo28C+SV6aUSmEjoKZ1lHaWCD93uOVRuq+RgCB8OVMOR5iUQfVFHJjIZZWFo3iWGPruQh3OSGSNjRgnhk9voB2hyGd6rDJgZcxcoUh2Du75r+UDst2jabFxjoUz4FbMwHQpq3BsuHDsiguL/wrhz1x3WGJJnkKuisdZuJt1BZiL2XaCYQFk96tLWY4VXV9z4WU/ekfcB8+wbuH/K6wPxs5l3PQD3Zp+AdGJjIiGM3QAotxl0MxzOMpq8cm94k1QOMS48FGpAD4Ov+96XWVfQreluNV6rNszS/lKkx4/m/9VaYF9cqvMyJlyLStf6mRJjfekAgw3XYv/l/SSXWK6gb8MRIWGqKca95KpK9RpAHJq4+dBNsJL35UCpmDExWm65LL171PJcvDEGMRzIM8G23Qys0ViNyWVS5ScrfvhIapd1o37M9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(54906003)(38100700002)(6486002)(5660300002)(478600001)(8936002)(8676002)(41300700001)(316002)(66556008)(66946007)(4326008)(66476007)(186003)(83380400001)(2616005)(6506007)(6512007)(26005)(53546011)(66574015)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlYrc1ZzZVg5M2lsdEQyNnNkWGxFS29BaklBR0FmTXdIMHRISTV2a2dXQWc5?=
 =?utf-8?B?eStsVS9jOE1oVlVKajRXUTMzdkoyY3lueG1Pem1TS2pORnoyQmVNTXhrK1Vx?=
 =?utf-8?B?VTRVcVc0OGlyVGQwVFJidEhWMEdUNVZZMHViZEYweEJINWQ4eHhkdXE3cm92?=
 =?utf-8?B?Vno3QU9MZmJPWWkwR2xNMFkvbnl4M2Q2MStoRFZuOTA4S1VpTlZyNi8rWEQx?=
 =?utf-8?B?Y0NlN0ErOGREMTJEejUwc2VTZFJ3b3RJU1FJUE5saHZ4NEtGUlY2cUhYemFr?=
 =?utf-8?B?a291dlVZeFVnZUFYemJ1dVdKS1U0eThJTEV6cktiUStGeVZNWkw1alJkQUhD?=
 =?utf-8?B?ZnZjamlJT0orbU40cXJpeWdpdUN2YVVIRlJGQTlyUEtzYmhxWDV0d2R3aC9U?=
 =?utf-8?B?Nm1zTyszallUbjcvZzFlTW14UVU1SFhJYUd1WjlVeUtXdWVjaitsZ2xKdHJ6?=
 =?utf-8?B?U1dGTlc4MlBWbjlDQ3lSbEVYVHdTNjBWSE9wOFdnaGk1aEFrTXpXUzFYTHNu?=
 =?utf-8?B?RnR3OS9TMzJVdVQzdFRPaExKem0xYkkydXFrNkdqOG5GMEZlWTBnNlZJeENK?=
 =?utf-8?B?dUN2anVhb1pyTDRDMWlDYk1VazR1MGxRODZIWmwvd0NhUk1NS0dpUkxKeUtm?=
 =?utf-8?B?ajBQQi9jSlhSRC9ZTUxkbkw3SDlFUVF5ZVRqRHFVMEZHbE1ET3VQbGVyUXlx?=
 =?utf-8?B?Zmh1U2tOY1hCWFRjb0ZvV1J5MXRSdHhzeXk4WGNOUmVPdHo1N1pUTEdmcWNO?=
 =?utf-8?B?ODdoMHArRCt1TEFLRUhjRStIenF4UTZqdXV5aVBoSkdBODlmUWVFQ0pzeTdq?=
 =?utf-8?B?YzBxN1BQNS9xaVlpZDltRDJBRWVLV0UzNU5qQmpCNEN0QVR4RFhFVU9iZWVO?=
 =?utf-8?B?dGwzcWRlSEtFcXJxRXJyL255aW9RdDk5WU8wMnRuTGtNdkdHVlBJNTF5OVZi?=
 =?utf-8?B?UVdCbVhZeG9lbkNPOVFIMEpWYkZEdEZTN0cyUFB4MEs3L1V6aitSQ0dUZWg0?=
 =?utf-8?B?MEE3akxzWW5mVFdqSmFjWGN2WGVrRGUrVSsyUEJLOVl2TWtSOEhtN2FrdUEr?=
 =?utf-8?B?TWZCaFhLM3l1ZXJkRlNRR1RqSzF2Y243bkxDTzJ2am1Qc3pSaG81aHM4Q3kv?=
 =?utf-8?B?NHVNS1NqakJEYXZaMFlZa3J6RWVhMFNMVDZpZ3Z2QTl0L0h5VmdabHhvakJt?=
 =?utf-8?B?UzQzUFAvMXVnWE9aOFV3OWxZTktncDdIU2RqU1VlNmcvRmp6cnFnYitnOVJo?=
 =?utf-8?B?dmNDaDlVUFRlVWZNbmpNL2dGTDBkNUtablQzTEVzMm1oM2c2MUF6YkFWT0VW?=
 =?utf-8?B?SVAvL2FSdnN4aVdvM2FkeHJZYVlRTmlXZTgzVEFYclhOdFZkSTJhbTgzYkpU?=
 =?utf-8?B?eXl5dE42NVk4SnBwZVNCLzR6MUU5WUJyQ2RXN0YxY2FadTVYSktQRllvdkkx?=
 =?utf-8?B?Tno3dXg3M3lWOC94MHcrSHhsd0Z4V3BDeDlkaHFQV28wQTBGT3VaUnYxZ2lT?=
 =?utf-8?B?T0tZR2pIY254T2s2T3dMemVDRm9XRzg0N1ZVNERGclJzYlJKME1LWCt5Ri9N?=
 =?utf-8?B?a1VCd3lDMlU5R1FKZEVqN0wwZ0xabWwyb3M0V0VUelFBWWkrTmZMNHVudHlO?=
 =?utf-8?B?RlVUTWlxTUYzSTBQeldoVXdEK253RDBKbUM4RFppK0w3QmIxbkNLUXlWNUJx?=
 =?utf-8?B?aDkzbFpPWDFIZTVZRTNqM28zMyt5NmRXNktCVFlsVmx0clpHRUtsaE9RN2tU?=
 =?utf-8?B?M0lPUmVSUnA5bnNaT2d6VVN0VURNL3Q2QjFVaDZUUHpZOGFZYmZPeGxnSFJJ?=
 =?utf-8?B?aUp6MjRUWEcxN21NcmlIS20vZGtCaFhJWkdNNXgxYkRPc21uSmlBZ1hSTnVa?=
 =?utf-8?B?NnhkbER5dU1JSTNQTDZyQm1weGRDNkczMGtBWUdXUlNTS0VHVFdiN3I0ZXk5?=
 =?utf-8?B?aXZEcm5LR28vejhYSHNwL1pBUWNvUndwMzZpTkp2UXlHcWdNN2R2Z1RENjVP?=
 =?utf-8?B?Z3FLUHRVYitxZmljTThyOGRwKzBiYjNPdFg4RzllQU9heENnRjF0bHdTb3h6?=
 =?utf-8?B?MUcvUUtsa1lrZEUwWFk2WkV3bTl2WGJBT042dnU0ZEN0K0gzZlBzWFZTd2Y1?=
 =?utf-8?Q?vD3FkwWjens2XZa5bUyFU8Kul?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea13cf5b-c30d-4de9-94e7-08db8820c7a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 06:24:17.4277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geQExuisqGVuOzR5I/6QeJskg+7JPoe0YuDK4SSXWwUEA2r8CaIOtdpDk3hVZuKXOFzyOuru501rs3x2i0Y7/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9227

On 18.07.2023 22:58, Elliott Mitchell wrote:
> On Fri, Jul 14, 2023 at 09:21:59AM +0200, Jan Beulich wrote:
>> On 14.07.2023 05:44, Elliott Mitchell wrote:
>>> On Fri, Jul 14, 2023 at 03:24:59AM +0200, Marek Marczykowski-Górecki wrote:
>>>> On Thu, Jul 13, 2023 at 05:16:40PM -0700, Elliott Mitchell wrote:
>>>>> The better to encourage moving to setting via string mode names.
>>>>
>>>> The numeric values needs to remain documented, otherwise interpreting
>>>> pre-existing configs (that may use them) will be tricky.
>>>
>>> Problem is the way it is documented tends to encourage continued use of
>>> the numeric values (notice how reports irt Zen 4 mention "tsc_mode=1").
>>>
>>> `parse_config_data()` suggests the appropriate string value, so nominally
>>> that should take care of older configurations.  If "xen-tscmode" really
>>> needs to continue mentioning the numeric value, it should be in
>>> parentheses and with "old value" to suggest moving away from that.
>>
>> I'm not sure about "old" (we can't change the values without breaking
>> backwards compatibility), but the numeric values will want mentioning
>> alongside their spelled out names.
> 
> Then why is there a warning message about numeric tsc_mode in
> `parse_config_data()`?

I'm afraid this question can only be answered by whoever was involved
in adding the warning.

Jan

> "WARNING: specifying \"tsc_mode\" as an integer is deprecated. "
> "Please use the named parameter variant. %s%s%s\n"
> 
> Declaring them deprecated suggests it could be removed at some future
> point.  This message was added at af3b530c03, over a decade ago.
> 
> Though I suspect `tsc_mode` hasn't been heavily used since no one ever
> bothered to remove the debugging message.
> 
> 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D327A66A8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 16:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604806.942335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibgn-0002AZ-Qk; Tue, 19 Sep 2023 14:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604806.942335; Tue, 19 Sep 2023 14:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibgn-00028N-Nk; Tue, 19 Sep 2023 14:26:57 +0000
Received: by outflank-mailman (input) for mailman id 604806;
 Tue, 19 Sep 2023 14:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qibgl-00025h-O3
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 14:26:55 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94f55382-56f8-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 16:26:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7882.eurprd04.prod.outlook.com (2603:10a6:10:1e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:26:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:26:53 +0000
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
X-Inumbo-ID: 94f55382-56f8-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHLbt3PtoOMah0cUsaS/SGePOUIpA0JJNmB5NkCjgnI2o9e8XerRmZpePgnjHztaU4d5W/5hcUqp0VKVtQTsCj8yuTfo4BXS4KZ033vhrzFZqvLVW5xDi2dyV8F+/MOruB2Y30s894qUyOq2XeDOtXYe+i2mKOayQS70EUjf8InOddNrgLM1A/usM5jbQiUyzcRV+P32/czauJ/Mqgh+7d75apxeTVc2NjcTagVlU998OIQJWzz2y+NpPLkHDC45fwpcJ75GzaDnJf+7+vV/z3CVTnsV2UQNItD3tSHL+jbWf7CDGBCco889Tfpqcf0xuccO+r9V0dsz9t9hynkptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GbH8bWOJJa1yFfE45qKdFl1iSuGi8m0vptsYPig3aA=;
 b=Pj+dL8YgoyDOW5Pf3sDARZX8JK+Ar0hp4f8hqL3CaIi018M3svRn1CQFLK/g4NdZCg+wB2djt0sXTOq2f1CyoV88sMhshktGTzYqjHzfiNdq+CQ8o8+qWQQo0ktDfbYRaf41O+sZj757/RK3NV/9G20nWEKIkcfF8Ye/ivexIMBl1HfeE7wChtU0PysVJ6DE3omJwyDah72wu4Y6UHSZQ4lH2J0Bzf33nggalexyKNZ87prcCoW5R1HvNMPGRT8T4z2uD3vDthTs75hTa/ZXzK1CtJuNYduizvmQKRKSGMjZ/NNlYVuXqAp5TG02vYOSSMkID5zvNfTBpfSJwrhrBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GbH8bWOJJa1yFfE45qKdFl1iSuGi8m0vptsYPig3aA=;
 b=obS3Mz4tZg0dsyTycMQe8fvlwUm2nwU5vbJ3h3FLLdClIaNT/0NgdMmwV65BZDuFFrpadYMEmw27YCZWKNhF/ToiNOZ4ux48VrnZzlDRwTqlUuJ8bFA0/VuNlcElZdPXUkeBETD4LZf62NxlLhcWt2FWezisaRQ47YT5yjN4DxKXU4JAlPuwWLoi5tXdN7f0QlS5O+kL5BeHI+VLpqxRoSQin+N23gpE6JMOdDe7YrKxbteGlGRiC56p3Oc2Iyn7ysluv5xTW93JFYBkwf4agOvAHRQwbr6BwfvinOpUmdzaAKIptugXnKLHQBQPvovzaGxenrQ4qENQrvyPp27F3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d5d4e74-5e3e-bdd5-a37f-c4dc9f418ab3@suse.com>
Date: Tue, 19 Sep 2023 16:26:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] console/serial: bump buffer from 16K to 128K
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230919125118.12657-1-roger.pau@citrix.com>
 <46b0b9e0-29b2-d526-d32f-d03415e621fb@suse.com>
 <ZQms01Wq62yMzGDg@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQms01Wq62yMzGDg@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: b00546c2-074f-498e-958c-08dbb91c782a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRUJGpXLJpL/SbrQFnWTQ1V14MSgjlIjjtqABTRNHY0tJA6rEsV/bottaCgc1YvIQ5ppeydbcEur/vaLfW2Hy2OWiTgXF2NNXD5VGrV/p3qTvA8iH4PONtyFDuKkrGxjiDVvVzSF97fVll+sl1v6aIlvR2GioajAfzI1Minazjbi98HmrhGGhMdy5WikQgDOaoVqo+I7G4UlcDwwL7Kgz5PyWibBaG3ydzEpilHgkR0Q4/BAScybeBPRWECrWj3c0nKLAxGCEd/o2X+vAODFQCmiYPha0OfR2ZEK0WZ4LAiYnIu/3B9X297rLGrIwOKTUtyAu5UGpT1ccXX9m1GxE9wFPmX8zo5OkyanunhaiQCs4lR4KSG5AC1nk5iCbASd4z06ssENnd+EG//tgFVAp2ZnLq9dYnA/w/YimPYkENVqMbSn1OuTDP7hSy6Qd/cTXvoj/gb69dAcUni6zXN+Zs27QKTAfNTocg8JF4KaIvfhvR8Su6U1TOf+vtUk+LJLzURdGd5i93Lh2BNCbk/gj5G5Hg+RK1CySBZtKNvvM0KLdO/1HGM9CiqKOeFo3FoN46CR6NIOizSRj4paQqXZrWEq9OSjKXnfalQrySLCkrqq0nfIlyqo1uHTcq3QfG+MffNUpcesDtkB3qz3Km3NtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199024)(186009)(1800799009)(31686004)(36756003)(38100700002)(86362001)(31696002)(6506007)(53546011)(2906002)(478600001)(66946007)(66556008)(54906003)(5660300002)(66476007)(8936002)(4326008)(8676002)(6512007)(83380400001)(316002)(41300700001)(6486002)(6916009)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2o0cXZRemVtckZGRjlJSFM3NVFIZGdUTno1K0VBbnQ2T0YxcXkxRTErbXJQ?=
 =?utf-8?B?ME40SlZ5dWlUbzRTU1V3K3lPZlJnaEZ4TFF0cE52eWg0N2R4cVpFdEtHcm5u?=
 =?utf-8?B?ZGRrcFdJN1hJSGtKMGhGZzJucXVuWjJHdHFNMnpTSDBiMDVwTkFua05yOW96?=
 =?utf-8?B?czFRY09PWXRtRXF2RVBnRDRUQm5HQS9sbDZZUUZsTnZwN2swZ29jc3MraUts?=
 =?utf-8?B?TFFQQ2Q4S21Dbm1kMUhuNzhkRDlaNEhEL2F5UEdvZnQ0ZUthdHA0YnNjWWJp?=
 =?utf-8?B?Rm05VWpHcmFVZnZPZDVuRkdpZ1UyNHZmc2xzSk1SRVk1YVhwS2lnalRtazlX?=
 =?utf-8?B?U3N4elp3QUlhZXNQZDVacThWN01CN2t4MWRiZDZDOXg1TDZsNHU3UUlnN2Nq?=
 =?utf-8?B?aXk2dVlKakZ0bEorR0RMN29xNVFPdldJNFVwems1OCtoTkZ3UnVzYjA4OHJn?=
 =?utf-8?B?TTg1OUttSE4yMzBwTVBHVnAxakhyT29LdEdGZ3kyS1ZpdGlOSk5LZTdTWGlX?=
 =?utf-8?B?SDlnTGE3dUxNalVGbjBPemNDekFiU2JWcUZkaTNxWkZrUkJ3QjFPOTFUb3U3?=
 =?utf-8?B?Y1dlZzVzc3JielFyOGUvSHE5WFpJZ1YrU0tIWnF0c2hsOUw4L3l0VFFXQ1VY?=
 =?utf-8?B?eG03WG9BYW5yYnNwemZUVzdZL2RqeTdQWlkrMXFYb2dkTU0zN1RsYWNVdjdG?=
 =?utf-8?B?cjR0eUtzUmZMTmdvNkNyQjV2c1M5WmtNRmtFWmlKbW1NRFQxWUpKa2JIWTRI?=
 =?utf-8?B?a2R1YWhnZ1dML0twejRmZ2hPN3dhVGp6ZnlTUkJsTXlBSjllb2VJSTFGZU5R?=
 =?utf-8?B?WjlndlFzQTM1aUJWQ1RoOUt6b1pEUHFWcVJvTllNV0J6YXEyeXVOQjVGWng2?=
 =?utf-8?B?S296cUJNdWFpbzV4ZDEvYnZLL2VWK2dteGkrUkRmMXd6OURNYi9XclpjT09T?=
 =?utf-8?B?cTgrTW51ZmlITHUxQUVyYTFjaktja1FRUHFncGp3SjZFNDAwVkI5dkFQdHBn?=
 =?utf-8?B?SW5CUFR3WlowdXFFUjN5bTh3cFlYSTdIc3FKbWxMc3BiS2VCQTdDMTQ1YUEy?=
 =?utf-8?B?WWJRK0pUY2M4UkYzRFI2cndLemo4M2o0U3FVeWRaSkhnWUxDTzNJZkY4dHoz?=
 =?utf-8?B?bmM2RFk2RUxKVUwxc2VReXpFZEhHQkM5NnNMd2JydWNCR1YxcHZUTnhmZVE4?=
 =?utf-8?B?VEdTOTl6aExoY0wxeElLYkNQemIrTHZ6Z2dZTVhuejJMTjNvbXJGRm1TRng3?=
 =?utf-8?B?RXBTbU54c1JrOUszbTM4elRUNkpIVzFZai9uUjJ6eDFYN08zVHJLZTBaYVRW?=
 =?utf-8?B?Mmp1Wm8xKzVUMXVZdDllL3FldXZJWktlUWNHb2t3eUpGSk1Ra0Z0UEg4djhY?=
 =?utf-8?B?UVBlTE8xOXFWWnYwYVUrT25wSlg4Q09JN1ZBTjVJMEVQQ29mM0V5OFNEMVcv?=
 =?utf-8?B?NGNWM0tQZllNM1RBZlFNbGlZY0wxYk12a1NaQmRqVHp1eFJvM3RKTHlrWWdV?=
 =?utf-8?B?NUw1aTdZKysxdWV0RTg3MStCVWFOTk9KOFQ4aTVRQ2JoNkovdEhmcFdpTWxX?=
 =?utf-8?B?U20zZ1ZwZGZadEZqK3JZbmQzcUZSUURnSitEL0d0V2lxNkRHN0J6bEZndlZm?=
 =?utf-8?B?Vk1QU2JOdlA4R2RFdVBTOGErb0RpYkY5eHZrbVVMMkJybW9hemw1bkplVXNU?=
 =?utf-8?B?NVhlN1pubkMzeS9DTTg4b2ZRNHIwWXl6VzRER2NweFVlR3F1YWpnTXNQVU9i?=
 =?utf-8?B?NDgxSlNxSHIzSnZOWWptTVZJUUViamF3UnlpOC9MbWtyUUJZZjZFbGJJaEJH?=
 =?utf-8?B?UTdGbXZTdDBTMlpVblpvbmlYV3RsQVFvcFV6RVFHVGQxL1RnYUlySFFudk5o?=
 =?utf-8?B?M3F4Wis5bFhNdE9sVnR1UDN3aWR1N2N6ZjVLUk14bXMxblI2ajJONy9iaU9h?=
 =?utf-8?B?WnhvMy8vdHUyZ0pSNWI5bFlLd3Q0WVNzM3FtRXZDQXdmVE9qSWhlQnA4dS9E?=
 =?utf-8?B?MWhaWmtSbDdiUDhVWmNnWWcydnZLZ0VLaEs5aHZmVnNNemh1emFtcEhFRUxJ?=
 =?utf-8?B?NXNITDVLNHZsZHJQTUR4Rm4zMnRHZm9Wc2ZHeFJyWHBEVWhQaHV6THhGWTRr?=
 =?utf-8?Q?BH8Pe712e6d8byC+GONDDP74U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b00546c2-074f-498e-958c-08dbb91c782a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:53.0607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygvk4viXhPHck3Z8xWByxtEJJ0529TIJ3dfjhYGFSw6mVUUPYPEvaE7NbK+uC8Xl3e82MgSXPLZVpWV7GfVY8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7882

On 19.09.2023 16:14, Roger Pau Monné wrote:
> On Tue, Sep 19, 2023 at 03:06:45PM +0200, Jan Beulich wrote:
>> On 19.09.2023 14:51, Roger Pau Monne wrote:
>>> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
>>> being filled halfway during dom0 boot, and thus a non-trivial chunk of
>>> Linux boot messages are dropped.
>>>
>>> Increasing the buffer to 128K does fix the issue and Linux boot
>>> messages are no longer dropped.  There's no justification either on
>>> why 16K was chosen, and hence bumping to 128K in order to cope with
>>> current systems generating output faster does seem appropriate to have
>>> a better user experience with the provided defaults.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> --
>>> Changes since v2:
>>>  - Bump to 128K.
>>
>> Wow, I was hesitant about 32k, and now we're going all the way up to 128?
>> Even the recent report indicated 24k would be fine there ...
> 
> 24k would be rounded to 32k anyway.
> 
> I don't think 32k vs 128k makes that much difference, it's still an
> infinitesimal part of the memory on any modern computer.  Simply the
> risk of loosing output is IMO not worth us being conservative with
> the amount here, specially if we are speaking about KiB, not even MiB.

Well, I've voiced my view on the underlying principle of this before. I
don't mean to block the increase, but I wanted to express that when I
was halfway okay with 32k, I find 128k excessive.

Jan


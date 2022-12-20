Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B24651E3D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 11:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466891.725859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZPm-0001oI-Lt; Tue, 20 Dec 2022 10:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466891.725859; Tue, 20 Dec 2022 10:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZPm-0001kC-IY; Tue, 20 Dec 2022 10:00:02 +0000
Received: by outflank-mailman (input) for mailman id 466891;
 Tue, 20 Dec 2022 10:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ZPl-0001bQ-9t
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 10:00:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10e210f4-804d-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 11:00:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9427.eurprd04.prod.outlook.com (2603:10a6:10:369::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:59:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 09:59:58 +0000
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
X-Inumbo-ID: 10e210f4-804d-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLxRZG3w+Em6AWfskBDcFF9VzfgQrYiPvJsf5lVkmWvqU24W5S8uFJuLEVjTwmJBYQE6CRBP+fYYxll3Lbgpu60Z+1tCjG9MYkrIzFtorIKtucIU4DmOecKkGLCD5Y6xHn7BVj+yjLa3NWLbaX+DKvgW0z2Hig4WNZLnoZ7Xcc6XAkbL+vtaoYderSa3zIuibUyKK3Tn/sz+6nBD7Wf/UTrNzOpihsrTbY+nOwBR1I23iOXt+K6EB+IM2TkVks5I74WPJ4ZXteWn17Ia2vGfynwa9W9AkFwaTU4IQE7xD6ysxAIzBIh9eo0Nj9NEkP+R5DjWpXqKXlAJ52sH6Qsisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7jZ9za7zMXof99zuDFjFhypdN1lRLElNh62eQ8L9+c=;
 b=L7RqUG2oHgOA+I2WCrqXYL6J1zy2c7iN2YIX+v5te39GndN/LfiU5yG8QIexZSLzfvlkj3akZHiQ4T+5FcdPtAS4EEXTSmcbN73tZH0IysLHc1UtdXuPoKhUTnY1EWqQ/uNmrQcGQqedcjStGLXYOLovYs7sT2E37xhWcGXvZwDO5hNLcCm7IQ6ZkIlrOUeZXxzfliO7m7MkXt1KXl9PWp2MXE+4HzFNCLOgFbB1sU+Rx7q2ye1sjoy7lnnWp7/GdJgNK57X1e8D/00zgeTbL7XpIbsmqJsPVH9DdzdvXpC0PY1xzQazm5ZerSB7Lbq9tU/4t/MgYs9AvM2V2FpgYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7jZ9za7zMXof99zuDFjFhypdN1lRLElNh62eQ8L9+c=;
 b=Gz7Ju3XstHZYIkj1byXbi0jFibETrNCXseh0oTjrDb5g9m9ksrnWe4R5LSIohxmpQPB89NYE6LknFajnp4l4Oe0EZ2aSNVurxjSmbXVqltB15px7CdghAQM9FeOjd/RlwtZuc4saZYzykTAQLHcY3xR4WN82s3CBpZ+iic6jdtOJDH3C63a5xS8xnpbWnTr0JM08gTj4W0Dlb7DNyeoHyMRuzzMJwZnyrVIU6ExnZpgvNUyUsMo56U5NmlXMlrg/ARS30TlHzJRVEPAujh8/Wty28U7NnyLhvkpUXDZ8H2q34mQmFx4ym+zZ61OccY6bwybvHsAHAq8fN0ihhHLDng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ea24e81-4697-90cb-a7c9-68ee022b529f@suse.com>
Date: Tue, 20 Dec 2022 10:59:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 04/10] domain: update GADDR based runstate guest area
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <22422a1c-1cfa-95d0-c1fa-99150a8f2a32@suse.com>
 <33a84c2a-0c94-a62d-3754-4a61aa951c83@xen.org>
 <417c72f4-e9a0-e3cc-1c36-544967d73e34@suse.com>
 <45781a58-61cb-bc8c-c18d-35d054b4b06c@xen.org>
 <a9779d15-2f53-87c1-c4c4-745ac709430a@suse.com>
 <f633b729-e422-9fd3-a635-b8617eb6bfb2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f633b729-e422-9fd3-a635-b8617eb6bfb2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd29c3d-5b61-4d25-6c72-08dae270f430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bDFf6SiYRiM+GBxJ2SqrUdr28Zpu2dJADxOVEOa6BazPwj686U299/7uqB+TFXDKfl9VP2WO2GQcOqZ1eZeg2CjXkUR0WtSRaYz7LJSSTqolEeLjhSv8G4dd+XiLQbcfbhRGn96bRHPBLOKwyDKqrJ/HT0ZBd4TTRRgflQSz9aKr/xcCg9UISzByC8Kti5U5BNzShmc3PyG8ZN2uhsTJMZjv8V4FKPddJ/Gqan6ncxsor65B2BX68WCafibREAzFM60UmT3wVy4ndhaMqgBns4zQS6TAuNxjskLBEUPpTx4tS2BzmoOlDXbWMSOpEwrGQq7onC+qV/FYmjH8CVa7cKyXxNCv1UoxNsk/FZqvOktLKlx7jYVBSTI8iHBg54Hppr6n8lgnwM3Rlkf4ZrKKcLt1QxrntNbbpv9K3dLKKxPEnUEdelQDKTqiPo47sU1H7lTzAiLi8G3Tlq12tGo0w2sHFL1aafwMmfjvrhSxaMlxVNKxkjpCEeUVrw6yJXakLQFScewa236TM93i09L4ShjnoI45ynj0J8raXOC5IWTCaLQeIS8BvXVqXnL4Db7JH8CuD4I5xJojy5AGUcYHd7ihWDP/TPr5wst3sJCUWjnVxMvB6kMOzfJjHBTjT/Swj3ZLJtXuexpdAKauMZvt77q7eIs1pU7ePLQ2RAFcudrXo/vNPii9udad+FwXuFwWJyynW9KE/yIO9pXfuYvpeu8yWlx6Pa72eL00H+OXXsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(38100700002)(53546011)(6506007)(6512007)(186003)(26005)(478600001)(6486002)(36756003)(31686004)(2616005)(41300700001)(66476007)(316002)(8936002)(2906002)(66946007)(66556008)(4326008)(54906003)(5660300002)(86362001)(31696002)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0pwZG4rWmc4b2hpMWpORUREOE5NRmZzL3Nyb01uSWRkZk5VTkxPOEtIMnpz?=
 =?utf-8?B?Njc2Z3M0ajk3ZHg1NG53VE9Vdms4dG9wSmNIcWJwZFRQb2U0TE1uenVoZWN4?=
 =?utf-8?B?bGR1N3haOVNvMVU5Q2RidGUxYWtzdUdaV0JPMEdlVll0OG9xbjJQNzdGRk0z?=
 =?utf-8?B?S2txTmFOVy9rR09sZWZHVCtTMEFOd2p2S1BzM2xUV3VTQU1HRVJZY0ZDTy9p?=
 =?utf-8?B?Si9rQSs2cXJTK0F0ZVRsdFJMcko1SUVzVHBxUk5tK0JUNlRKS3FYWnBERW42?=
 =?utf-8?B?bFlnUGFQaWcrOUt1QTYzejFySXVIY2lNdFlIOTBWUGRvUU5hOThkcXNLdlJp?=
 =?utf-8?B?amRUekxmTFJybk9ZTWFSYmlBNjVuU29DQnYzVFZJQ3RpaGlra0VubFo5NGVv?=
 =?utf-8?B?TmpBYWNFWDhGc1pqZVdhSVQ4TThkdHBCTC81T29rU2N6Z2J3VTYvNzljVE4r?=
 =?utf-8?B?MGkrS1lkSzVFb3FrcjByREJuQ2liaEFVSnMwbmh1VU1RcHpWR1J0ZUFYTSsz?=
 =?utf-8?B?TGpvTmpkb01SSjl3bUJqbHVnYVB0UkxPUmRObXMwb1FxUjQxQjVzVVdxUTR6?=
 =?utf-8?B?ZHB1RmVJU2lRb2NXY3ZER1BYMU5HTnpZZkFDOTRCcjhnUXNKMW5hcEN4aDg1?=
 =?utf-8?B?Y2s5SUtwWkRGdTFiNnBlWG5mWUM5NVZjREVmQlFGL1ZPMmFtaXBNck9BSlZE?=
 =?utf-8?B?eG1sYTZuc2dKekJhS2d5Q3VIWGd1QW5Db0ZtR05Nb3ZpbGxwcmFYSDU5dlUv?=
 =?utf-8?B?QTBEQ2ZuSGFFQk5Cd2dVQXJlWEdMa3NKZm1xYkFNZ1pOSzRaT0tqZlUwbFhZ?=
 =?utf-8?B?N0xsRi9qd0tpTnRZZVNHdWwzRGxabW9FbndCK3dpdlViMithcDV0dHozZ1la?=
 =?utf-8?B?bFN1UEVYU3ZUSndNU1RnRVI5WXJaZy91REVZaUk4a3V1Q1Rmc1JUNmdBWkpt?=
 =?utf-8?B?eEZSNGZRRXdRZTJiVnhUZEZUanFTQ2JNR3QwZzEwNFl3ZVFvWFZyKzM3M1la?=
 =?utf-8?B?eHdhSThKMEZiRHNHNkdxMkR4TDNpK0F2R2ZRbjJxeVJqZ0cxdnE4bUJSZ2Iz?=
 =?utf-8?B?Zm5UOGtLVlZkTC9KUXNtUHNsU1FXdll3bXdKTXk3dWlwQk9HK0NZUzBucXRS?=
 =?utf-8?B?TXkwN2FsZnVCODk3SEJ1ck0xQW1DbnhDZThPek9EazBpTVJmQTU3M1pVQ2lr?=
 =?utf-8?B?M29MNG93dVdpZkpFdDZrRkJwdi85aGRXdEhrZUYrZGdQWHRNNGpxVnhXaDRF?=
 =?utf-8?B?TVhacEJHdVNLZnZ4WUZ3WndpQ3cwbjJFVVAxUnJKZGZoOUdJRjV5MGNkK2J2?=
 =?utf-8?B?RUxsc09kcUx3ZlR6b0hhY3hkbFVwYWwxdjJYNGdGenZqSnpaWEd5VkVXVEFZ?=
 =?utf-8?B?cGpiYmxYeHBxY1paTURKYU43eWphaHpIR2pzNU9LT0pEVlVjcC9lajJqMHRx?=
 =?utf-8?B?dzI3UjRFbDROcUN4K29pS2VEVU11MTlRMkQreGh0bDc2Unp4MjZodnBCWllx?=
 =?utf-8?B?eDZHdDFBc3ZkVFR0ekRTckN0TzZiVXIwcWlJRDQ2NTRXMlRxN0pXZGxKSEdC?=
 =?utf-8?B?UXhBT01FaHppN2lFcTREVVVETHZWaEUrNS9nWXdTOGoydmFDcVZZbEtDSWJX?=
 =?utf-8?B?dFB0Qnd3NG9BbkJkWDA1Tlh6M2xVSnV1ZHlnRGU1NWwrUXdqdjRjZmVheWdp?=
 =?utf-8?B?bGZzMm05Z281N1VMazhUUUVZYkxMQS9CYkYwd0dUTDIzUVpJTHIzaTRWNWhS?=
 =?utf-8?B?N25EU0xkSW1ma0g4QkVwd0FpaWo3aXpUem16T2RDUUc1dUdXOEduZXN2ZTdC?=
 =?utf-8?B?M2trU1pSZ2Y1WkRlVlgzUmR6ZUdpSGZ4bzV4K1h6UzZDOTJ6cCswV2E1MVVC?=
 =?utf-8?B?VS9FRE9haXhBNFY4bzlsbXBzK0ZCamxvbUg2QWxkM2xoZW00RnJHcFc1c0hI?=
 =?utf-8?B?TmV4TEw0VWZnSktHYXJhbmFDQ0xKWG5xUmdzdElKTmlzeTlrRlAvajhBc0pp?=
 =?utf-8?B?WVFINUNmUlY4RE1vcmczMUdmNGdOUG9jN25mYUIwVUlXN2xkcHpURkYvSGFr?=
 =?utf-8?B?VU5CVmdvSkpSZHJaaUZndjZ6dDE0ckJabHhWWDlZeDdURmUyT3BWU0ZLU0t3?=
 =?utf-8?Q?WM36KHpnccr3VCzy2RTxaNsne?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd29c3d-5b61-4d25-6c72-08dae270f430
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:59:58.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeGN9ssQjz+hul1SS4k1jFiegXR/aixGZGWlTO0bWS4OvjmJgQmpkV4woBXwvaDQeCi+02FOXN1HxlA/OV5/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9427

On 20.12.2022 09:48, Julien Grall wrote:
> Hi Jan,
> 
> On 20/12/2022 08:45, Jan Beulich wrote:
>> On 20.12.2022 09:40, Julien Grall wrote:
>>> On 19/12/2022 12:48, Jan Beulich wrote:
>>>> On 16.12.2022 13:26, Julien Grall wrote:
>>>>> On 19/10/2022 08:41, Jan Beulich wrote:
>>>>>> RFC: HVM guests (on x86) can change bitness and hence layout (and size!
>>>>>>         and alignment) of the runstate area. I don't think it is an option
>>>>>>         to require 32-bit code to pass a range such that even the 64-bit
>>>>>>         layout wouldn't cross a page boundary (and be suitably aligned). I
>>>>>>         also don't see any other good solution, so for now a crude approach
>>>>>>         with an extra boolean is used (using has_32bit_shinfo() isn't race
>>>>>>         free and could hence lead to overrunning the mapped space).
>>>>>
>>>>> I think the extra check for 32-bit code to pass the check for 64-bit
>>>>> layout would be better.
>>>>
>>>> I'm afraid I can't derive from your reply what it is you actually want.
>>>
>>> I think for 32-bit call, we also want to check the address provide will
>>> also pass the 64-bit check (i.e. if used as a 64-bit layout, the area
>>> would not cross a page boundary and be suitably aligned).
>>
>> But that's specifically what I say I don't think is an option. First and
>> foremost because of the implication on 32-bit callers: They're need to
>> use magic to get hold of the size of the 64-bit variant of the struct.
> 
> I understand that. But I am not aware of any other (simple) approach 
> where you could have race free code.

My reference to using has_32bit_shinfo() not being race free was to avoid
suggestions in that direction. There's no use of this function in the
patch here, nor in the one where the new boolean field is actually written
to. The solution as presented is, afaict, both simple and race free. It
merely isn't very nice.

Jan

> So between a non-race free code and exposing the restriction to the 
> guest, I would chose the latter.
> 
> Cheers,
> 



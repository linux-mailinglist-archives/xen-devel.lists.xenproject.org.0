Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C187A750BE8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 17:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562594.879349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJbSz-0005j9-BN; Wed, 12 Jul 2023 15:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562594.879349; Wed, 12 Jul 2023 15:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJbSz-0005h4-75; Wed, 12 Jul 2023 15:09:21 +0000
Received: by outflank-mailman (input) for mailman id 562594;
 Wed, 12 Jul 2023 15:09:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJbSx-0005gy-60
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 15:09:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124ca65b-20c6-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 17:09:18 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 15:09:16 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 15:09:16 +0000
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
X-Inumbo-ID: 124ca65b-20c6-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBPmDsZzX+DSJUC/QwnX5jJok1095aEuOiuBf9RcrJWTiYpxrnYrrG86VhivrwXVLZoZYW7k3AH5e9F19wrZWzOkcFT3Cgka/5ZkF/4wOwBpsUuHzH8aRXv9llCkT9ytvTjnX9Vc2cy/uyXYyRhEngfbFmlZjYaAVQNg1Nwm0+7Z2jvHIn4a84L4DA5oi5ajPow476a06IgfpKZTi2x1Fo7p5ernPNNjai4aVcmX7fDESvj4warGJ46nKz13KrnzGggyUAgJx/aYl0hQboI97aNMw7+DmdISF++2sCCjw+EMm1xnLwF4fesCpQUcNYvum3DB9nDcvXrtIvJPTFWvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wm70FUsX5KjiAsWaedna3TwjjujG0aJ9RtEpykIh6i4=;
 b=fiPhUIHJ3NxIU8Vg4JF8GdHXsrw/dLlsWx6CLeNbkjW4xFhatUW09uTd1JgogDDrf9k8bYpK1PDMwsdussXaTsCei8dO9/XqLlaOz4NaC6Xb+1YMe8afkRcozuDOpWTv2u0lQw1wrJStfNxzTRi0l+slmFWBJQh2L50zOCAkkcXxDgjhrbQ/V7ofKvSsGYyDbROHZocTTPWOv5f4zG/ETFQ081S9qGVK+ntC81CLeUVOU5Z7TQICFuP8tTGN7mOZhR2r0UbEbicUzRUwy73jHC7Mp93SMVigrCeSrHxO5DzArjb6sTdixcTKcn0bbbtyDB6vkCdevAfklH1fTJLRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wm70FUsX5KjiAsWaedna3TwjjujG0aJ9RtEpykIh6i4=;
 b=3F8gzg7M42zB0NcEdlMRple25Sq7UwraKo7P+Zg27TFsf/oHCXKDGA9EXfRBo6RMvEsxPplnNRYbEWF1smJJZOEeWNL0Xq5J7KUrFg5Z6LFnPEMDEjBIBvcetBmtKBNrTlNqPBQkWlW5ZqVdRey5pj4HhqLtKbNKDdy3QGb4Qtuvl1idVLEf0LtKreJkrFPdkByBowT1oRNfDEdEk3t5A7tie6nXUN7jZRT9sDzND3AjRr30yqw+Y1UXI9hV0jmabqUCZNy4ZBMUduGqco6g4FPHgfAfaK+hCgkHvmRyxoMZRqMVaxNoI+X1lhcaArejhHc3J7g6XSFPdVPBwPzxVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <561ec830-d3cb-3f47-00ed-219cc03108d0@suse.com>
Date: Wed, 12 Jul 2023 17:09:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 429ee0f3-7c28-4d19-f3ac-08db82e9f58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d65LMXgyMhocHiiehtXRroqo5RJTh8DqRb/iMnhSJgmBV3V6sTLk+SkMtfh28Gpv7JCF5MKUNEI3qTT3vQSkFOL3DPdUQ50ThAmSwIBb6PFMDw0/tPWTmpLKq9GXYzdx9dP8zVtLob1j9aWfY7VXWgAQKho9iD5FO5j1q+G7QMMCkD2zIa7xCIY+/aXnb8wHQxy+NQM7VumYkPxb0Q5RFdBPzOgH6i3WQjSHS2U1DXp+UDKeczsx9cJAYqXtDSlvjhoZAMkz3U4SQbd9ivdBrOddG3ASV24W30DkmxJ2wzzhsDtf2S0a1sR7+GkVYF98X/e4liXT0hq9KvPcRgPJJDbvnlDDr5VCeDivGjyF5ZJzGDIKrLqW43HVMKlC+pm3V35JGHbhM1SFnvdMt+eZXUBPM8z2Z5UeTi8KbDe1U8BxvhByGJ1sfILs+BDa4FYde1UdEY4x5K/3BdZeLRiQ2kItSHWKwEBqZqCOa1pOtib/k0Et4Fpz1PuXZ/HoCVNEsHSWK6LBCIFAWAIPVuyPdx1JWp7JqY/vgFxn3liDNUxXrcNXhTgs4qv5F28dNMoKiHvImkCFMXq50lysZ1E7WzysV+JH1aO4uJXbd2A/GessWQzSNvjSQggzOy/mt5ai
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(186003)(66899021)(41300700001)(26005)(5660300002)(6506007)(478600001)(53546011)(8936002)(54906003)(66556008)(2906002)(6486002)(2616005)(4326008)(36756003)(6916009)(66946007)(66476007)(8676002)(31696002)(86362001)(31686004)(316002)(6512007)(966005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXZRZ3ZUU1RmV3UwRjlPeHVLV0dscGhvbFNHanVhMFlDcTlZTTduYTJ1bW9F?=
 =?utf-8?B?MDVvVC9QeGRhSGVCRWpvK3QyaGlsM1kxbUVwWXdVTTdrQWVGb3FiUUJUNlBU?=
 =?utf-8?B?cC91bG1yRDZsbWtOTU1sMG5QM3ZrYlV5d1ZGTWlHVkIyN2VZK05SS0k0WHcv?=
 =?utf-8?B?UGVHVSt3aS9oUW5jc2pCTlBYSkdVYlVWRWR3SXBGTjRMYU9LbVdHM0tsd2lS?=
 =?utf-8?B?aGVmenFSVzBEM3R5Q216SGdNUmwxeGNxRHB2RlFIRkhQN3YwdHROajhPS3V1?=
 =?utf-8?B?anRvM3FUYWxQZnNRYTJxaDR0Q3o2WmxGL0xxY1ZQcU5HTlVtSFhjS2xYK1Zh?=
 =?utf-8?B?WHFJUGV6bG5DZ0p2czNMd1RETXM4N2xUcERNT042aWNhK0RnODc0UFc1ckU3?=
 =?utf-8?B?TTR3Mi96QXlnL0Q2am9KdU1mQndYU0dWUTBpM1lEMXIyN0MxTERoTmtzMi9D?=
 =?utf-8?B?aVhhd2NoWXR5YmdseVFKMW9nUFVGRlp5RjlaNzI2UGRkaFZLb2ZFTUdKVVRs?=
 =?utf-8?B?Y2lJYmpOcWhpYU1QbTVrNUp5RkYyL0xGUGhacHRIY2hEbDNtMlpXem1kYkpq?=
 =?utf-8?B?WXZPQm1ZZmJ5SStlL212VTdnUmw4WW9HVUxUaVFGcWtvVnp0dWVTWW85eFJr?=
 =?utf-8?B?TWRUOHd1N3pEb3ZUUmxjNlk0YlFjVzVyQ0UySWl0ZGpRWmFOWjdnUTI3azVE?=
 =?utf-8?B?bGwyU1g4Q0dxb1hEMUY0RmxKWmM3clZiT3NlQmNsUzYyMmltaEZmT3dNTDV3?=
 =?utf-8?B?bG5sV0dqZ0txQStDbmcyc0hKOW9RNkd4dk5Ic0xmSXBkR0IrVnpVQVlkL1hj?=
 =?utf-8?B?YlIzSDBHNmpJeTZnYm9tOERhcUwxNE53MkQ4Zkw2cUd5UjFuZ21GcXNKR1Nq?=
 =?utf-8?B?bHkxNWdGMUxCM09QQVlRdWpGaEdwQmxxL0VCTE1yNnFUVG9mRmFJZEYwTDhM?=
 =?utf-8?B?ajhjWGRoU2VLKy9DRWhDUWkxKzhQU01kQ280dlhGYUpmWmlsYktWdjYrOVZk?=
 =?utf-8?B?TjIvdURmNmdsS3YyUWpVcWUvUnJkZHhNdDlmdFZzTyszblBESEd3OStOOFlt?=
 =?utf-8?B?WUV3MTBJRitqc2JrMWNZbUxjYVZDa2x0TjBrVklnMXdZbXFXdVppQ2l5eFZu?=
 =?utf-8?B?eE1jd0ZpNjlobWUyMG0xMTBpdEowTzE5WEtkMk9pTkQ3cWlMMSsyUzYwV2I2?=
 =?utf-8?B?N205RnZnaHdiL0h3ZVJmUXNPQmtrRFJSOTgwOFdCeXZneXljd1U3NGtINmdw?=
 =?utf-8?B?RXNSOXJDRGlSMUd0N25FcTVnNVkzZENneXNiZi9yOHFNcXBsUFFCQjV5RWxp?=
 =?utf-8?B?NUllT3lnQ1cyMm1kcjZnVTN4bDNIcjJqakVWU0x6TU1rMmhmL1RURkF2RVIv?=
 =?utf-8?B?M2pkc2puWCthcjd4R0E0elY3QktMYXFVdUZDQUZHV3hVV1dzRHdoRU0vb2ZP?=
 =?utf-8?B?anlZallpRno1b3dmKzA3cncxejFNK1l0emVCN0dQU0dCWTg2cU9oelhManVJ?=
 =?utf-8?B?eFdGbjZ6ZWFuT0RWbTFETjFlVktZdGxPSkVHUFA3OFFwN1UxVjhmb21YUXVi?=
 =?utf-8?B?MnhVZWh1VmgxaUMvTjVuSDliRWtXcGtOdHZGK1NnS1Z6L0JmZEdyU2VkdC9p?=
 =?utf-8?B?Ykg0c3Q5NUZRa0lvZlZYR2ZxK0FQcVNmaGhGNC9lelIwZy9OeEdodW92LzV0?=
 =?utf-8?B?eDF5eUpNWG90cHFaclBXYUtUQ0lFVFhmcDI4NjJYTjVWL0JhZHgrZW5MWmFm?=
 =?utf-8?B?SmZCOUZqMk5yWW11a2hXOHFKd2U3WkR3dlRIT3QraDNpcnk3MWdMTHlwSHhY?=
 =?utf-8?B?aWhLRUZ1eHRGaWxnRHErck1EQjFFQUR5aFY1ZXg5TWl1S1ZKaC83VHFwLzV4?=
 =?utf-8?B?cHBpdWZ5Q1IyVUw1bWJybUVpWTQzV0JQL2haMGMrRUJDQnU1ekNLV2Yza3JP?=
 =?utf-8?B?UVZjRG1FWGNOSXUvcEoyMWVpSWRidmYvZFR2WlI2dFFhWE5URDVWY0tVaWR5?=
 =?utf-8?B?UkJPdERnMWtJS3ppeU9vcVpSZHhRTnlyRnQ2cCtxL1E4dnVzdXFLYWNlZkdo?=
 =?utf-8?B?NDZCdGw4ZnVGQzJhWkpOVU5jRGRZM0w2Q3g2YTBuWnRzY24xU0pEZ25BZVpm?=
 =?utf-8?Q?hHZV0Ixi5/Yw9UQt3Cpq6fHNr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429ee0f3-7c28-4d19-f3ac-08db82e9f58e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 15:09:16.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8e2K85rV8+Pb6wkBMB49REyjmUX1xuIwHpBY6nM3ItDYcYEFynliQul/bqeND/rhpMT1iPsntWKvx3C2bspd9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575

On 11.07.2023 18:40, Roberto Bagnara wrote:
> Mandatory Rule 19.1 (An object shall not be assigned or copied to an
> overlapping object) is directly targeted at two undefined behaviors,
> one of which is the subject of 6.5.16.1p3, namely:
> 
>    If the value being stored in an object is read from another object
>    that overlaps in any way the storage of the first object, then the
>    overlap shall be exact and the two objects shall have qualified or
>    unqualified versions of a compatible type; otherwise, the behavior
>    is undefined.
> 
> You can see a number of definite violations in the X86_64 build
> at this link:
> 
>    https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/149/PROJECT.ecd;/by_service/MC3R1.R19.1.html

Just to summarize: Except for one instance, all follow the same pattern
of extending in-place a (guest) register value. Sometimes in straight
line code (typically eip -> rip), otherwise in get_rep_prefix() (esi ->
rsi and edi -> rdi). I continue to think that the way we have it is the
best way for it to be written; as per an earlier reply I also can't see
how even a "malicious" compiler (still aiming at generating correct
code, just not necessarily doing things the "obvious" way) could break
those cases. (I understand none of this is going to help, yet I'd like
to clarify that sometimes overly strict rules are getting in the way,
like here forcing use to e.g. switch to using casts when we'd like to
avoid doing so.)

The one other instance is in compat multicall handling. There I guess
the compiler could indeed do things "the wrong way". Any solution there
that I can think of would involve an auxiliary on-stack array, to first
copy into and then out of. That's not very efficient, so I wonder what
your suggestion would be how to deal with such a case.

Jan


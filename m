Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D372762BE0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 08:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570074.891382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYJk-0001Bd-Jp; Wed, 26 Jul 2023 06:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570074.891382; Wed, 26 Jul 2023 06:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYJk-00019c-Go; Wed, 26 Jul 2023 06:48:16 +0000
Received: by outflank-mailman (input) for mailman id 570074;
 Wed, 26 Jul 2023 06:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOYJj-00019W-8H
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 06:48:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 648f41fa-2b80-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 08:48:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 06:47:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:47:44 +0000
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
X-Inumbo-ID: 648f41fa-2b80-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGwU1C5EO+btJtuGOQd4koBobG9bWW+iPIcxeTPJjYCR05SrOv1Tx7pB2d8p/xXEw8EXFmopo+mYg4OT3RvfHqV+pZcSY8oLJa68tpx2jDTwCMQlEq16QOp9a2S93bh2ICMaaelz6a2S7QWygKLr99+kzeM4DLaVhxsLjvlGb6SVy5SHxwFaez4GA/L3cmdh/6QMa5pu9JX0GTWJumLQbBxSMPfcJNjiuWGLKckDjGXkUWgM5HAIv+pMP/08kgoW3WOsy6f2mknRi420Pw5LvTIBnK+xK6dU7d8lc/R+XGRfXH6IZurfPZ31xLxJ7yzUHIf+X459bzYEyUia9RhwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv/S8H7VBVCXw65UxxrbNttfmXrKo98kPc4TNsom7Ns=;
 b=JKnFP6sVwefppiMuVGrp5bGprP5/q+gkI9rz0YfIDdCOTxt1dLk6WHFxazR0OUMgsoUdG+n9RkcZJU7D1MJtpblOtNpjrtWt0ezErwhjypYG6XrCdZ6erpEeVbWL3E56Q3PqR3CQ+ZcA/mzEp5QB8qFcBr7DsRGbCvWla7ChIk/CDiPJhQdaKWsu9vECXRRmy6mBw8XRWwKdbxTPK1g4dqPad7l7/7LmVWXKRfPpIpoDCeAlYxQcRKANXEkZftVVvWuEy3HtD8jINjZR5ADscrIHjyvy1BMeNOkcZQ7fG+UUZrFIlOgYPTtClqHLcs23htK1Q2zhGDUn0YHNx6hf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv/S8H7VBVCXw65UxxrbNttfmXrKo98kPc4TNsom7Ns=;
 b=y+FJRB6xUfx06G5zETY1+4S/lz5fGnL4T2KVCv/kjFMvUcRBtJOA5LlUf4kGTDwD7tEMGVx64Xm2BWwDu/fgZ/d3Ci8XHA8M+CAJRWMqR8XytCvMKNuRsNefzVeLoSbaKnBTQnbHy84hvjBGO0sA9A8QP/gM0zI3JiijxVhZkPya1iB1sOt9BN83JVYCm0cLrFszUxn+gVbOEgNaULdeSQ6S1LJi8C3uouX43I9HzfhG4suCLmeET/+fNNxbRLIQ8XXqGjQLekvh6I/2XqIgeOGSwkSgbH9dtFrB3Wxnas9oG/Mt9c3L1ZGhZxuvMlsyKxy9RB4fQEqVPSsxf1AgYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8914bf47-c4ca-4a14-6a92-b5b23ee739a0@suse.com>
Date: Wed, 26 Jul 2023 08:47:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com>
 <11a3ae18-508b-cf08-2803-bc4aaeec7353@suse.com>
 <f424fc5b-6266-3d04-b494-0448fa453b75@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f424fc5b-6266-3d04-b494-0448fa453b75@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: f73f085b-dd7e-4935-8886-08db8da43740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	twxlW7kvJFfdy3HKFGlikCsyvCACZ4B2DwVV3NaW6C2BC0Z8s3dhTx5hopFLOeHzq3x04zYn2QFGWZzdAKLZkihmjfnom9kZe5zTw0hEOxDI377WF7Wx1ektmKAKKQnXejRaG0BdJKe8M9VzSbYWxbLWnh28nwoIResYdRsr1gC3WjtkGAw445McqjugJYfcHB50irQhQmJ/EXt8OI7sPflqsTRItl+dNgYAi0ItCu4sjkrXYoZzkMkvmoFc6u/4DQqm9QxKyDovJ7KKPlz0lRgTY+jBinnBZFx+FlUpCO0H4PYxjt28B1sFX+G3xBt2gpz8NNOjwNjaBtm2V2sLIP+xzvXX8E0ywi1butgEWGe6dkIek95jizq5KHFRyz3nu03fVwYfkZX6d7cgQiAWuaASLVLHlPb9yuPlzQH0ZARijA2ivKSxcE0bd256dWd80oXd4QjbK6lqjhOYIYFjABGogM9x7WWmQ1j7VlGmNurfk3QQm86qE8HryVdCQfkSQ8wHXMZaES028JgMNCIAhOM/h3lS3Ku0+6imf+1Doq0q0Tpfgby5I1Snc706a7B7QhzFKoO3n74+zxKh8z+lGpvonWpnOkjh9llbml7uTuNNoLhQSgK1e06u9jn08o0qaPVPdqPZx6BqnRQYFqEegw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(6512007)(6486002)(54906003)(478600001)(2616005)(26005)(53546011)(186003)(6506007)(2906002)(66556008)(66476007)(66946007)(6916009)(4326008)(316002)(8936002)(8676002)(7416002)(5660300002)(41300700001)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDFDQU93ZkZzZGorZ0VsRFFTbVc5bEF6ME4xdVVUdU4zL3BlSTJDbllJY0s2?=
 =?utf-8?B?dFo1QmY4L01aY1ZkSWlLbHhzZUNyOVNob05NdzBZSG1rcU1tU1NsVUMyWkhR?=
 =?utf-8?B?U0JBcENQYW5NZ0RCdjVRUXFaTkdNSlFGMkdxOG1tZ0NiamFkWXg5Q3FGdk8w?=
 =?utf-8?B?Y0pVY09wbEVyeGVON0NsaWxiSUVZNTVwajR0WXljODBaUlJPYTRhM083ZDNT?=
 =?utf-8?B?cy9OWnEvVHlUaTRHWFRmYjhXRGJHWjB5WEN3NlJObFpqQkJ6TFNHMDhFS0s2?=
 =?utf-8?B?WmY4a1lQSE5ZVnZBK0U5U2JyNEtwN2FING9HaEg0ekVjMDg2WUU5TFBLWWZM?=
 =?utf-8?B?dDV6empPZHA4TEpTUHNaTUtZNXNKakpldEpGalpIa3VsQjF3eVpsaFU4YldX?=
 =?utf-8?B?bENEQk16RzVMejZMMjVEYnBmZVVGb3E2L3UrNElRM1BSLzlPYVVRVlp3NnNC?=
 =?utf-8?B?MTY3bllmMTAyZVdVazFRVmg5eEtoYVpoSm8wa0NzMWpZNWlUVjVWSWg3Nmpm?=
 =?utf-8?B?SGV1Yk8wRjdYelhWTFRZNWEvQUUvRTVCYTQ2Tmp3R2xEcGdiOVJqempud1ZW?=
 =?utf-8?B?ZXZKaVAyS2NBRjNsWVUzRnpaNEl2djdwU09iY09jRjlxYVVQUnVnbW8yNmQw?=
 =?utf-8?B?Mm5uejZSUDFxRUIxMExtaVhhdksxd3RqWC9xbHRxYldnV2RWWndEZlRnMHR4?=
 =?utf-8?B?ZlVQdjYzUGFRci9UcmNQRlRXbXNScGtKVnNFTTNPY3g0ZEtYa0tyRnNnRGt4?=
 =?utf-8?B?WDBlOEZHOTdYVWFDV1loN0MrM1BPcG9kS3hUTDErUkc1SkNxYTBtcDdlWjBO?=
 =?utf-8?B?NWtvdjZDaVQ4WlFnb2VHWTR5eDEwSVp6VDZnZGp0bFVocHU4aE4zeDd5QkNE?=
 =?utf-8?B?cTFnZDB0YXFKaXlpam1xVDV2YWpjOExIMjJON25sOVRkR21tRFVIa0lyVHVw?=
 =?utf-8?B?aW55aVoxYTN2WG5XakkxZHFRUFIxdU16L1JKT3BYNlZ0NzVNTDlYcXlyZ29y?=
 =?utf-8?B?Q0dLOHV4M09qVDltU2lwMXhMdlNDdWRVTUl6aWFOYU96cGc5d1BwSmlLcWxl?=
 =?utf-8?B?cVRzbGttRDZHZXdQQXh2UE1TdURxTk8wZGg1c1M1Y3dIQU05aExDNTdvbDdq?=
 =?utf-8?B?czF0RHFpMU94YjNVWDRhdjAvUWxxY3RHZ2tSOGZHSnNUM2JCRG5nb0FhQWt3?=
 =?utf-8?B?OEJteTNUak9wakhhenhZejI1bDEvckVaMW84eFpCdUovK3YzcFpYclNmaDVZ?=
 =?utf-8?B?eEVBczhQS1VIWmFBWEVKOXpzdG92QktRNEQzQ0NaS2lWUFBKUU0vYUdGaEd0?=
 =?utf-8?B?S2hidEdVWGI1OTI0c25TKzVWZnozZ2R4cStDU0wxaDdrT08wT0ZSdW0vYW5Z?=
 =?utf-8?B?dURvWXJkSG5aenNnQ1l3NUpKeWYxZnpWUlprQ3l5L0sxL2VMeTNaUEJFQ0pF?=
 =?utf-8?B?LzA4azZwa3BzWm9wMTFxREVmZXRRU3JOcUFaNTNDSCtNQjR3TlFmb3MvY1Jv?=
 =?utf-8?B?S1RzbmwxdG5KS0c0MlViU1MyeVNGRDB6bDNaTmxsZmJWeU1NbHF2dUZvMjlL?=
 =?utf-8?B?aUF1K1F6N2tud2puOHpiNUkvOERDckk4cE5nVEZ5VG93TEg5OWhRRjNiT0V5?=
 =?utf-8?B?aFJuZFFMWlBFRWVxbDE4R0hiL3UvVzN2YXl6Y2pDSHVaekVVY2l2eWE1VVFz?=
 =?utf-8?B?aDViUnlWNjFXelIvWlpzSGVLeVorY3dpaUI4aEpPam1NU3RETDljZ0xaNlAz?=
 =?utf-8?B?Q2MwK1NsTGhLT2J6dFNZSG9wMjdwT0x3THB4TWo2ZmRlSHp5dWtNYWZYWG1r?=
 =?utf-8?B?czdQM0VvUnpWUDNRMzRqRVNsNTdRMUhESERqSTlqNklCU1ZlemVuRnJiaVVo?=
 =?utf-8?B?WTJWdXJZYk9MTGxuaklXUUJ4ZDJVUERXV2UwMkRycFpPT1dCZ1NHRFZQZ0cr?=
 =?utf-8?B?ajlpUTZKYU41YnJuRkQ1dUVzOGRTZHJ5N1UzbzdZeEtHcHJQSVJzemRHZTBv?=
 =?utf-8?B?TkRWQUNsK3hJUjRuTWdwZG1CelcxYkpxQTJEemRydnovajVtTTFBN2hRTEhk?=
 =?utf-8?B?dE9RU0tQWU4vMjZVdllVcDVhUk4wVGdSMEt6WTZ5QVVMS3N5UWhoeEZhMFZp?=
 =?utf-8?Q?79bQajz+AI4H+6X/FS92qJBu3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73f085b-dd7e-4935-8886-08db8da43740
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:47:44.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGqESEMYkJzpoowWoO/smYs89aP/bXB5MtDXuDy6jzmOzONNiCmILjLLcAIRpr+WWaht/cLAvzPxVPnXk50wFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612

On 26.07.2023 08:42, Nicola Vetrini wrote:
> On 26/07/23 08:34, Jan Beulich wrote:
>> On 25.07.2023 22:45, Nicola Vetrini wrote:
>>> Rule 5.3 has the following headline:
>>> "An identifier declared in an inner scope shall not hide an
>>> identifier declared in an outer scope"
>>>
>>> To avoid any confusion resulting from the parameter 'debug'
>>> hiding the homonymous function declared at
>>> 'xen/arch/x86/include/asm/processor.h:428'
>>> the rename of parameters s/debug/lkdbg/ is performed.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Changes in v2:
>>> - s/dbg/lkdbg/
>>> Changes in v3:
>>> - Added missing renames for consistency
>>
>> Hmm, you asked whether to send v3, but then you didn't wait for an
>> answer. So to repeat what I said there: I'd prefer if we could first
>> settle whether to rename the conflicting x86 symbol.
>>
> 
> Stefano replied asking for a v3 [1] before I had a chance to read your 
> message this morning.

Right, sorry, I spotted his reply only after seeing the v3.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9955B95E1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 10:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407275.649712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYjoD-0001j3-9A; Thu, 15 Sep 2022 08:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407275.649712; Thu, 15 Sep 2022 08:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYjoD-0001h0-5b; Thu, 15 Sep 2022 08:01:17 +0000
Received: by outflank-mailman (input) for mailman id 407275;
 Thu, 15 Sep 2022 08:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYjoC-0001gu-4E
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 08:01:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 919d376a-34cc-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 10:01:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8654.eurprd04.prod.outlook.com (2603:10a6:102:21d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 08:01:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 08:01:13 +0000
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
X-Inumbo-ID: 919d376a-34cc-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gD0wsQpRo/iCpELJojLLe92xQcQ8T7MxLuuzpWRQ1wmAOmDZUTeuwKttdATYNRPBBb2DcCr9lCKUknn+QRKGdr2Bh+3grxhTxvxwHFWrYbceUQfQPvSvMW4eOp7rcRiff/kMdQxYCyPt2hLoy+HGn5p97ZQjShBqQm6L2JL1SXh/Ak+CENAKQcXj5TF2fZZ9kCZ1mJ1yodw87a0il247BTi2j3HMUfB/ROrrlnUhniBMbwBvLMAoq8clC+TyMw3TfWWZya0w2z7oQlUjV45OXayGvKbNWa4MHIMRRWxHm02r+rD9Vt+lsGTWyxd2qbiSBx7Rzag0ixsYfe6EyxUo7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2LgxLd5d+p++ENnAU5rvHkmCcSw+f/z9x7e8kBgz48=;
 b=FzfiDdrphWqSRgF/x0JHCg+kdJc6Os39zLkcwD+YiWbhOtZ7hZAyH3cNOYGi5Ku9/Bm0CS7LmLPnLwj50FHe11wimTZonsvw4+FPGqzY0xtcVnKCXTf8xbQ2sNYY/S4a4Uy59QoYWiDN6PDTVDNYguHfjY3kHghNlfNNL9hQrn6Ssiyuzgl8GE53s1no//Bh+q5n2hzrk6m4zbIdHa6fUExDo0OQ2lpqIeJDrcLuFn7GquIG/siSa9rE7e2QBays+79tOEATbMpEYfobMarMaejjImtCQRVqS4U5699iCtgin+RydHQGyuPzkKnG83F+neTLORIphF4ElovVhzsrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2LgxLd5d+p++ENnAU5rvHkmCcSw+f/z9x7e8kBgz48=;
 b=apNz8kzHIjec01hJMMHiyYZu2MfNzMYYq3zjse6KipUaFDXWFu+zzy/TjhzMGL/vYz92qE12EiY7/YGgRdVZiwEBX69hymi41jvvEQ+Ooq9pc4Nuhtilb1Nn1fXETOaqhd+S1YqK5rq74NDiAcFNzigMYA852Zm2e3V4H5vWuW76czBuN3gt/CaXIHXZUlQASigppBfoDkbkhlP245nqgwyfEKaO5hbdb4u0NCSxvWrKVQdYmn3bOyMRGcw7IvyVUOD2CTwl57BCJk/qsP55BTQqiOvvmxEskHouyz+HZs6qCJK7QM64fg+4GG/+olFcwUn8zdX0W5mA+GhSjg6WTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52cb5a00-83fb-8a35-4670-8dde87585f9d@suse.com>
Date: Thu, 15 Sep 2022 10:01:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
 <74fcfb7c-a699-03d5-c8aa-5f654515c566@suse.com>
 <0ccfe125-9455-8f40-430e-cfa1347b0aed@suse.com>
 <YyGbTIwaO+a2KVFW@MacBook-Air-de-Roger.local>
 <d232013d-aa21-afe8-ae71-5580ff4d679d@suse.com>
 <YyHjyzXfScvSWyK2@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyHjyzXfScvSWyK2@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb0a159-72da-4f97-c4d1-08da96f07567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C22RmNytmuz8cqdF5OqewZwqEThug2OoJWVQkiYrx8q3XSIBkCwL0awlFviaQCZyYQ6nDQWQ8dw1eiUpsEXdt99XNOAEmI4gpYD/01HBWIizfhMdyBG+IdV/ggfydXzsAb+3WSxCuODhVuMMkIp03Fea6kVr0xIHFTYB0IiAZRbgy6mEvPLD6XykljuFytxOzci4ni0SGaMPtoIziqjc/ZrlbDQ06dGfAG8OdevzzZJVohp6V11+klCMPKuZWTniU/U0DDloVZTUgAQHzF4YTYHtGwyMgEI4hpBxynjJvtoVaNTOTGlxkndQQTwZCP+tP5uX32Q15b3j3Bka+uuasKehzu4A5Q9IeaAWZMqRX9kqTwVZQGIOpFeWA8RPOXWKA6su7WRi0PCRvhwsF3orY2FqMhiejgQRRS93aGqqTPTe8/b8F49oInBdvLZQftatagMkyZxiliZs0t0foHeqlS9JcY90Qul2a41gxVJ5sz8+EVvLrSpxf5+/pC6qHbaPi7qiGDxxPjJBoXY/sfstIy5aLf0BO8g7PX9bO8S+MqmIB7l2MaX2N6Zj9MSdhNruUmhqUaqzK/oUXD+KDb98CvENZJm0jkMq7IlGC9Qncp6xkv7YY+7UX5OXccX3JZSjGYKOISh4mt3/1tKpDmaiJAuXS+UnkhI4YxtnHrBZhdsMVoPSe63ZEtOaAhpayJ4hs/B0rVIJbLM55jvnJDCgQn/C0rsCzmaEAsW2TurG8vCgmu7oqQIVKDfzDnjvrIh2vWqK9gQMQagd6hg/NukeCNnxxUoKTt/DXIs94Y8dVJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(31686004)(8936002)(5660300002)(66556008)(478600001)(83380400001)(4326008)(66946007)(186003)(8676002)(66476007)(2906002)(2616005)(316002)(86362001)(26005)(6512007)(31696002)(6506007)(53546011)(41300700001)(54906003)(6916009)(36756003)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWVaTDV4cnJDS2pxNHJYaFM2aVp4TXlSdXUvU2UrZ3gzZVpPalBTT3NsM210?=
 =?utf-8?B?Q2IwNjBFUW9QSWI0L2xhY1JFL1VkUW1ocndaTS9vcmlabkdYYlZoWTBQbGlX?=
 =?utf-8?B?TGtnVWQyMWtrRVNGZjZ3dXNRMlUzWFNDQUhNRmVNMEpNeHVqT2E5end1Y1Jr?=
 =?utf-8?B?TkYzTzJFZHVsMFN5UHlBV0FFSHpsdlpKTDZya0VQUU9JSWlrV08wWkxDQTNk?=
 =?utf-8?B?clFKa3pkbDVYaWhvMTVGUU1lM1k4RG5hWUxSWE0wNDVweTUwOG9YS2hEU1ZY?=
 =?utf-8?B?elRyRjU1WXBuWDRuMnlpY0lSV0FSa3NSV1JpRFZTZjBDQm9JVFNGY1VwcTBr?=
 =?utf-8?B?QU5qMGdOSkxrZm5HSVZUMS9YRmhQZy9POVVxUllhaGtZYlF5bTFOZW1ucG9W?=
 =?utf-8?B?eG02VHgzVjUyNjJ0N2JFM0NYclM1TkFVL0ZqOExJZjZDdVRIb1AvNENOSDRE?=
 =?utf-8?B?b1JvWFRQaEEyNGE3MkJZYk5adUZsd0llT29mSkh2VUdNT3l3UXZXTlRneldQ?=
 =?utf-8?B?T2RXSkNCalhJUGk4NzVWd0tzQmtkNmZ6K3lhekhVT1EzcEtFMnllVTN6WG14?=
 =?utf-8?B?T2xkNlZnV0hLdCt1OGtxcmhFU3J6Rk1zaEdrS1c4aEIzWGtRQ2NkRUxhUWQw?=
 =?utf-8?B?ZGxnUkNiM2FrRHNXN2dDdWpCNytJUzZMVUNiOFRnM3F3c2EwL0UyLzFiODFu?=
 =?utf-8?B?Wjg3SkRVdHpkSFB6OXE5RU1MOXVaMWV1UktyMkVJcGdZWlNBaWJJZUwybU1E?=
 =?utf-8?B?VzBEdXh0MWJKSDlzL1g5UFhOVExCOGs2Q08yVEVjbEM0Z1JKR1JEL1M0eEw5?=
 =?utf-8?B?OHRDSFgzS2xraGZoTFo0UEVrQVdKU3NhcFBCVjFJaGdldVcwenJRS21sblFI?=
 =?utf-8?B?YURGV3hTQkFsTmttOWJHOHRwNWM2L2hpdWZkYUhLWjBmcWJBSWkzdG5teTBU?=
 =?utf-8?B?VVBlbTB2TGNTZEZ5ODNWdnBRZWRZSGpZSFlGRytVaGpvOVVMZlhXbjdrbnUz?=
 =?utf-8?B?RVovbTlqNUlDSzZCTjN1QkNkanI0RmxLQUhEZ29xVnJJTW4rSEc2U2dJUUxV?=
 =?utf-8?B?aXdRZlE3YmdodlUvOWQranN6eXFHTjFJQnVHeTJVOFpZTTBjWExzMFYzZ1RJ?=
 =?utf-8?B?S0pXa3B1YW4rT3ZMUTV5cll4WjhsalFEQjAvTjQwS3MxOWplK0NHSC9sQ1NB?=
 =?utf-8?B?aVVhUTl1RGdqdlNGY2F5S1lqKzdHaFQ2cHJGN3c5Vk1rMHorTW5YV0RVRmhF?=
 =?utf-8?B?TXAxbTA1eHQ0dFo4cTBRRW0zcGVMbnJWWHcrc1JpMnRCT01pQURFL2tPenBF?=
 =?utf-8?B?SStoUk13NU9GQktiNzhqaWZ2VUhuSXIxM2d5TFJKSnJyVDlnVWw3dzQ2QnhG?=
 =?utf-8?B?RWcxK1JIMjgrN2FmNTZ6YnJyT3BLclh1ZUg3RXkwd0hBYTR2RXJua1pzUVdD?=
 =?utf-8?B?emJLek5uODV1SHJ5TmZMYlU5MkRoWmRiMHpERmZRTElORFFja0pBc045Rkly?=
 =?utf-8?B?TnlUdlVPSnI2b21IZkFwTmlQd0ZoejVlY1FPaXZFd3ZCcDZEdWlGNktXbWQx?=
 =?utf-8?B?WE9mTkE1Zkw4MTlmdUJoaWNoM0VKK0F6ODBCTjcyYTZLSGF1WjBjL2piNGtw?=
 =?utf-8?B?eG5xOUVvclF0WlRoNysrMGRPaFlIaHdzaml5OU9mQlh3aG5RampkVUtXdWRR?=
 =?utf-8?B?S2lGejBSb0NEOVBiRWpZSUd6L3JiSXlqS00wd3pNZVo4VDQycTFaekt5c0d3?=
 =?utf-8?B?Q1JQdkVIZFQ2Ulhla0VHK2ppZE4vbFZuOElZSlo5N3JONFBiYmh0OHJYeXVZ?=
 =?utf-8?B?ZzFrWnJJY2JKQ1k1NzloZ29NMFlSRzRhNDhZbmlQTGhjaVlrWFVxdDh0ajBN?=
 =?utf-8?B?ZEE2VllLa3VtV0R3RkFQYVhaTDRhakpRSmNTZndPWk9HYVlrM0htVnhWYk16?=
 =?utf-8?B?RHptZWU0MHZUSytrOXR5bE9kSWtHV2ZFdE43N08zalJQb2NNYzNyTVNZeno3?=
 =?utf-8?B?ZzdQeVV0YlQ5bTRnVW1IVmNtWTRLMlRLbWZuTGkrRnN0ZFd6NlREZlE4OFhm?=
 =?utf-8?B?RmlYZk94SkRlRm1LUzhGT0lQU1g5SU5aZHV4cFNjSmxIZEF1YVdueGFtRkNn?=
 =?utf-8?Q?iZNhORPc8r0aCMG91SG7CULqo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb0a159-72da-4f97-c4d1-08da96f07567
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 08:01:13.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5IN8sVj0/QTNDasR+U3t8YqEr8dz09wU0IV384PmUPKim6E8r49fxvKFlryeBfwYJtCnlvJkMWn3wxIMBFiOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8654

On 14.09.2022 16:23, Roger Pau Monné wrote:
> On Wed, Sep 14, 2022 at 12:13:49PM +0200, Jan Beulich wrote:
>> On 14.09.2022 11:13, Roger Pau Monné wrote:
>>> On Wed, Sep 14, 2022 at 10:31:34AM +0200, Jan Beulich wrote:
>>>> On 14.09.2022 10:14, Jan Beulich wrote:
>>>>> On 13.09.2022 16:50, Roger Pau Monné wrote:
>>>>>> On Mon, Dec 13, 2021 at 04:12:55PM +0100, Jan Beulich wrote:
>>>>>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>>>>>>> the consistency check in check_lock() for the p2m lock. To do so in
>>>>>>> spurious_interrupt() requires adding reentrancy protection / handling
>>>>>>> there.
>>>>>>
>>>>>> There's also an ASSERT(!in_irq()) in _percpu_write_lock() that will
>>>>>> trigger when trying to acquire the p2m lock from spurious_interrupt()
>>>>>> context, as p2m_lock() -> mm_write_lock() -> _mm_write_lock ->
>>>>>> percpu_write_lock().
>>>>>
>>>>> s/will/may/ since spurious_interrupt() doesn't itself use irq_enter(),
>>>
>>> do_IRQ() does call irq_enter(), and that's the caller of
>>> spurious_interrupt() AFAICT.
>>
>> Hmm, you're right. I was mislead by smp_call_function_interrupt()
>> explicitly using irq_{enter,exit}(). I guess that should have been
>> removed in b57458c1d02b ("x86: All vectored interrupts go through
>> do_IRQ()"). I guess I need to either open-code the variant of in_irq()
>> I'd need, or (perhaps better for overall state) explicitly irq_exit()
>> before the check and irq_enter() after the call. Thoughts?
> 
> Well, it's ugly but it's likely the easier way to get this working.

Just to clarify - the first of the options I did name is (of course) not
viable: If we open-coded a local_irq_count() == 1 check here, the
assertion you named would still trigger.

>>>>> but yes - we could nest inside a lower priority interrupt. I'll make
>>>>> local_irq_enable() depend on !in_irq().
>>>>
>>>> Upon further thought I guess more precautions are necessary: We might
>>>> have interrupted code holding the P2M lock already, and we might also
>>>> have interrupted code holding another MM lock precluding acquiring of
>>>> the P2M lock. All of this probably plays into Andrew's concerns, yet
>>>> still I don't view it as a viable route to omit the stack dump for HVM
>>>> domains, and in particular for PVH Dom0. Sadly I can't think of any
>>>> better approach ...
>>>
>>> Yes, I also had those concerns.  The mm locks are recursive, but
>>> spurious_interrupt() hitting in the middle of code already holding any
>>> mm lock is likely to end up triggering the mm lock order checker.
>>
>> Guarding against this is possible, while ...
>>
>>> One (likely very risky option ATM) is to introduce a per pCPU flag
>>> that when set will turn all mm locks into noops, and use it here in
>>> order to avoid any locking issues.  This could introduce two issues at
>>> least: first one is how resilient page walking routines are against
>>> page tables changing under their feet.  The second one is that any
>>> page table walker p2m helper should avoid doing modifications to the
>>> p2m, so no P2M_ALLOC or P2M_UNSHARE flags could be used.
>>
>> ... personally I view this as too risky.
> 
> Is the dump of the stack only used for the debug key handler, or there
> are other places this is also used?

It's called from show_execution_state(), which also dumps state for e.g.
crashes or WARN_ON()s.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB07497AC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559800.875127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKfS-0001I9-NG; Thu, 06 Jul 2023 08:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559800.875127; Thu, 06 Jul 2023 08:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKfS-0001Fk-KT; Thu, 06 Jul 2023 08:48:50 +0000
Received: by outflank-mailman (input) for mailman id 559800;
 Thu, 06 Jul 2023 08:48:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHKfR-0001Fe-2m
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:48:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb3ee3ad-1bd9-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 10:48:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:48:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:48:44 +0000
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
X-Inumbo-ID: eb3ee3ad-1bd9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I06ve9Xufops2hqhRfmKnB6qQN6/bol2iaIbANoqKWo/Z4gelENEKTjxMnHcwJ1lnFV96eAcLL9LBKrCCWhk/ECC66g3S6CpLXWdJ+BFQPYewzOYE1aVvMvPP3WCfKJcMu8Y6layNwEID5qNRE4aJVLPJRVN9dX3i6I/yvvOVqZBWFZ1z9jLYZ6WUwczysHUITPac5InhkVu7zVZUNMKAnKc/2v23uOE81Sgeg1nTohefVpum4WBzE3kvFN7ibgKlFddzsC5a5gQoPPjIDZJ0oJI/ZbmdLi93Ah5GIvR/guJH6VH1sGT0tZvL2g/ZJk1xuQ0ZlqnCk8apl38GZlr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twSSBAZPFkmYgt52ZhxD0l0oayTHv+lwpr3fYUXWvpE=;
 b=i+HZCMGjvNyEtNsENdinfrtCNZZqHKAE1yZ6mPOZT3fG6YzgYv1E/3LvDvILBVEXErlCLokJgmJ2UWPr7hg3GTMlSXun+VzwBNICJoKR+rm18RqxWov3t9EXLdXeA1uzZJp91fuisac4ncj/IkH1qeeCPLzlsbEZkh4BJd5aSolPNrvIbdj9v55lN7/Imwu7g0XOtJ/WagcbbCnI0wU8bjCAKEMdEq0M2TM2BV+t3cT2p0D1URPg6aFNcsGDvLtt5+kdpH3t7yMbiTmTRDmMx6e/jeGhKWd0YevI6YWihCxlQqBfyyfCzGnm7FU/VuB9uuHHMplK+1yCVpYSGPey9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twSSBAZPFkmYgt52ZhxD0l0oayTHv+lwpr3fYUXWvpE=;
 b=2dnRNRZZco+xWvxIDwC/UT7V0xJWs+Qctt6sSK/zVNXqGKY6BN8MfhVdOk9xJu1PAKrXZC9/H2KJTea2nvR32U+LBHaubb9xkXbmLH2BqOnoibBf0uNwGkpl71y4ITRzX/Pl7yjvBvO+2KkfQBWuCFk3GbySGYPCyjyzKmpkOLD022N+Z6Ia3eu9QH4UQ/pgYRTrzNIIF0m0w0Uo5/oafn9ygsefXTFOi4mYFzYM01/b9tn9sn5/3tIbUspGMIkPiMvkUoWBWnwfj/tl50E2RhCU3EAKrilFB36mDhhr0y/q5PYvGhcTJ/I7rkvu/1A2EPn0fMBUkaiXJgs3ggE4tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <536f3049-41f7-b127-ba94-81925e34ea0f@suse.com>
Date: Thu, 6 Jul 2023 10:48:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, "julien@xen.org"
 <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <c9ff72160539cda49e726ac6ee1486be0d645180.1688032865.git.nicola.vetrini@bugseng.com>
 <771A1A80-0FC6-4D20-84FE-DA0A2DCFF14B@arm.com>
 <alpine.DEB.2.22.394.2306291218350.3936094@ubuntu-linux-20-04-desktop>
 <ff1a6435-d7ef-eb10-afe2-0fee33788924@suse.com>
 <8d730008-f7ab-20d3-69b1-52a83282e2a7@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8d730008-f7ab-20d3-69b1-52a83282e2a7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dfcc17b-3698-4b33-9829-08db7dfdce12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tpNy11IF3efqht9iSfoZeb3gPkMKoB34MqO3ahfCz4MZ1PCGdiq585hLCOiOSHM9O4jyduYsMcEpmYeHqIBDxU9vgEdhCPD1MnedxaxjUo1gsMtwVUbU7hTc8ZFySGyeS2GkbikcJ17WbNuHpjAR02o7/DkfS05lFLb9rAYSUE3mZksT1KAORLp5mS+cyGVIET7JHkTaP+zFtNeh1sLSZaUylhymMO1tLPfG5bVH8PPwBul0j7dtWJ3ybZKPwi9UDSIBV8hoO5q7EQu87rNWJU2hSCvsngWim0MBbZZ3XqmT95r2/KP2tbeoRV9+rhW7oRSqv+wmkEQVsurxiwUqyv7jAFemAV1Ix/lwl7GDdOfZpazibVLvy+cC+yQXcqpgSExWd7TSitarBL+GXNvf2A5w6teUjSZKT6RyDY+CQSvgx3SyEd/gk0Zi4Y/RlQSpwj0QF4ETd5n2lnU5TiV8mEGGISrkcFInG1eEmtnkmKepFUm1gmq2MOpU7XQERPRuFWkg2yo73O/ny+zvuWMY4/7LZMhOSTxGaWXKKfC4g2MqQGAD1sz7JVs3Xt7BL+SnRsAsCDhmfCWn++G1Nmg3e2uuE262Ra7NRFJX38edER6gtQRd7W/vkEj4fJYEhrSk6P47dSlexXTuXyrXT02CdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(31686004)(7416002)(8936002)(8676002)(5660300002)(41300700001)(83380400001)(316002)(2906002)(2616005)(66946007)(38100700002)(6916009)(4326008)(66556008)(66476007)(86362001)(186003)(54906003)(53546011)(26005)(478600001)(6506007)(31696002)(6486002)(36756003)(6512007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qy96Z0ZJWHNmMDIzM3RzQURVYTF1SjNLQlF1WFFMWmRnQmRtdVNza0MwaHNE?=
 =?utf-8?B?bCtzSkczU0ZFVm1uMWlpcE1NVlkzcEIrUVcxbVZmNjJHMHlpU1BTakFXS2RX?=
 =?utf-8?B?OUptS1NqR0JaUjBpVy9zVGYxWjhpTThPREhsSnpIUElmUHBIMXRDMStCMktn?=
 =?utf-8?B?Wnovc2dtL01hWFhQY1VCVnFuVDl4ZTQ0ZHFVeUY3LzhMclZYaW1LRXFrZUJR?=
 =?utf-8?B?bThBUHM3VHE2cmNCZVFYdFhtN2t4R21MTDZrYXJhenlyaWNGaHVXcWVXb0FP?=
 =?utf-8?B?cHFQOFlwemlmTERFN3NzL0JCVFV1VFBxY3lWRjY0SjYyTlZSTzZQOXhiMmZZ?=
 =?utf-8?B?RVFkSlZrUndTUWtYWGtzSDRJejQ4d3F6RkFNSGJkRCtuS2R5bzR6b0JTTU1i?=
 =?utf-8?B?TWNiajJTK2tkSkVWWncxbldQMmg4djZCMVpwamd1b0lub2ZUcVZiSjlNbmFx?=
 =?utf-8?B?U3oyNHYrQ3pTaDVkbXFNcVBEekFVR2xOeFFES2ZEUlAxdVEvL1orZWV3eVVN?=
 =?utf-8?B?MVJ5UDBvd2xCSEJmQUVLelJQM0hlNnpVbEoxc1JTQys0RzhNUmJ0eDcwUXhY?=
 =?utf-8?B?TXRzeEJ2YjdTL1JwcjVHWXVyMUZkS1dNZmlDNTh5VS96aG9ON2VHZnhUaVht?=
 =?utf-8?B?WjBDVkhCNlExcXZVdUZDTitmWjNqdmRsY0s1SXVBcjNTYmxyaXhUWVBuQUM4?=
 =?utf-8?B?dldqMTgrNktQOGJJTWZ0WVZPdFFJZ0EyQytmd3FCSlVIK2t6azVkOVhtNnVW?=
 =?utf-8?B?WkptWlpla3RNenoxc241bzBnOWRIY1dnRkdFQTQ1RlRsK25FQkdVYWMvNi9k?=
 =?utf-8?B?NjIzaE5oT2ZuMjNXOFBjT01lSnBjZW5veU1uUTNGd0JjTWxRczkwZkt2eFZZ?=
 =?utf-8?B?VERGVHBlSGRoaEdFNlZQSDdEbU1IcTNTV3ZqZ1IrOFFpMS9tYlZNMVR1d09E?=
 =?utf-8?B?VHZraVlSRW50M21hMmZ4L05hQ3RDb0E5YUJVc3V1Nk04NG5Nck4rMkRFNURu?=
 =?utf-8?B?K1hnZHZTRkF5ZWZOTkdwLzRGSTZ2WDVVVkJtYUYzVThsZ1JwY1A3WFYyZnBQ?=
 =?utf-8?B?emlSb0tIVzFycXNFSFhUbU1vT0tTdG5sMm5wMCsyRW9RbGZEVnNUUFo1RmRE?=
 =?utf-8?B?bGJzQnc4djN5MVNZYlhneUM3bnU2dWdvVDRmVmcwQTdaN0dTSWlld0ZVc3Z6?=
 =?utf-8?B?N0krVUdzMHM5b2tSN3hYVlA4YVF3WjNWd05MUkdLN1BYQWw3UUJPaHhUbHE4?=
 =?utf-8?B?WUF1WDJra2ZqUnFiNG11cUt6Tkp3R1NPQW9XeVBhbm1SM1BQZlJZa2NTUFJ2?=
 =?utf-8?B?SFVxd0lyTWV0TlpZUndmM1VVVnVSYUZhTFVGNHRKWDhwNmNWRkROaTZnTmQx?=
 =?utf-8?B?ZXFRZTBzN2hIRFRjWURjUnM1YTl5TDRzbFN6ekIyZFh3azI5Y1phR3ErK3I0?=
 =?utf-8?B?dkJnYlgzUStLYUZzK2ZseTU1dFdNUFo3U2tud0NGamZ0SVFOdStGcDdKVVlx?=
 =?utf-8?B?eFRobHJlNnBDeWdhWHRXKzFMa04wUFdFek1aVWpHR1NybFJMdUJaVTIwVld1?=
 =?utf-8?B?VVFzQkZNM0xTV0hjRGFvMFpORzM2VFd0cjMwTWxJZGw4Ym9VcVArbXlVWXll?=
 =?utf-8?B?NURSUzRNRWZjdUFQVGhiWFYyT0Y4L2tqMmJyQU8yVWpLN2J2SmN6cDZhakNK?=
 =?utf-8?B?VWUvN1lEdVJST211d2pNbk1VVUpZdGhsSW9zaWhwazZaN3MyYW95MjZ3b3pq?=
 =?utf-8?B?WkRKemlmalFweWNjRDJSZjI2aDdHTU4yc2pQMVNuSkNXZDdxenV2UTB4Tk9W?=
 =?utf-8?B?Z3NtNGJZWjVXZW0veHpub0pCQWZKSmdOUFlWa2Vwd2JRWFJIVzNmYzk2TGN6?=
 =?utf-8?B?alF1R2xMeW5uODdpTkZWbEc3MU84enBPaFQzc1JZM2xpckRZSjc1dXhaZHk4?=
 =?utf-8?B?anF2aktHUVdnSFlid0srWDZNMFBtdG4rQjJpMENUdjlwL21DWDFBK0x5UXBk?=
 =?utf-8?B?Qk9Sc2VQd2FweTlNa2FORVhqenE2djZPbnFjNjJ0K2pjRmFoNGZDeDlGSnY4?=
 =?utf-8?B?RkYzSTNMN0RQY0hmS1V0T2czcVpCZEdFenUxZFpJU1ZSQkRHUXBqekEwQll6?=
 =?utf-8?Q?rHaC0ET8ZB69D2vTif6YCQkOL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfcc17b-3698-4b33-9829-08db7dfdce12
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:48:44.1599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7eJzM8p8HNKxtilO9vDJdUYoWtzc3886ZOPUj8KXJSPi8YKvU69ASTdPfem51ds8pQ6yO3xxs1DVLllYrAChQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227

On 06.07.2023 10:23, Nicola Vetrini wrote:
> On 04/07/23 17:57, Jan Beulich wrote:
>> On 29.06.2023 21:20, Stefano Stabellini wrote:
>>> On Thu, 29 Jun 2023, Luca Fancellu wrote:
>>>>> On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>>>> --- a/xen/common/xmalloc_tlsf.c
>>>>> +++ b/xen/common/xmalloc_tlsf.c
>>>>> @@ -140,9 +140,7 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>>>>>          *fl = flsl(*r) - 1;
>>>>>          *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>>>>          *fl -= FLI_OFFSET;
>>>>> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>>>>> -         *fl = *sl = 0;
>>>>> -         */
>>>>> +        ASSERT( *fl >= 0 );
>>>>
>>>> I’ve checked the codebase for usage of ASSERT, but I’ve not seen use of it with spaces
>>>> before and after the condition (like our if conditions) so I think they can be dropped.
>>>
>>> Yes, that's right. I am OK with this patch but I think we should wait
>>> for Jan's ack to be sure.
>>>
>>> An alternative that I feel more comfortable in Acking myself because it
>>> doesn't change the semantics of this code would be to change the 3 lines
>>> of code above with this:
>>>
>>> /*
>>>   * ; FL will be always >0!
>>>   * if ((*fl -= FLI_OFFSET) < 0)
>>>   *     fl = *sl = 0;
>>>   */
>>
>> While I'd be okay with this form, as Luca says it'll get us a different
>> violation, which we ought to avoid. While I was the one to suggest the
>> conversion to ASSERT(), having thought about it yet once more I'm now
>> of the opinion that _any_ transformation of this commented out piece of
>> code needs first understanding what was originally meant. Or
>> alternatively, while converting to #if form, to add a comment making
>> crystal clear that it's simply uncertain what was meant.
>>
> 
> About the violation of D4.4: the Directive was never considered for 
> compliance because it's an advisory directive, and hence considerably 
> less urgent.
> 
> Having looked a bit at the surrounding code, since *fl and *sl are used
> as array indices later in 'FIND_SUITABLE_BLOCK', I suggest using 
> something along the lines of "If *fl ever becomes < 0, reset it to a 
> safe value." (either using the form suggested by Stefano or an #if 0).

The main issue I see with any such transformation is how the
immediately preceding "*fl -= FLI_OFFSET;" is intended to interact
with the commented out code. My gut feeling (but nothing else) says
that what was meant would have been

#if 1
        *fl -= FLI_OFFSET;
#else
        if ((*fl -= FLI_OFFSET) < 0) /* FL will be always >0! */
            *fl = *sl = 0;
#endif

But of course without properly understanding the logic it might
also have been

        *fl -= FLI_OFFSET;
#if 0
        if ((*fl -= FLI_OFFSET) < 0) /* FL will be always >0! */
            *fl = *sl = 0;
#endif

> In any case this should become a standalone patch, right?

Preferably, yes.

Jan


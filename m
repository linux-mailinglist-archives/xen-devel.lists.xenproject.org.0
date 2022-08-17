Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2CF596CC6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 12:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388819.625578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOGDe-0007uH-V7; Wed, 17 Aug 2022 10:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388819.625578; Wed, 17 Aug 2022 10:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOGDe-0007rY-Ru; Wed, 17 Aug 2022 10:24:14 +0000
Received: by outflank-mailman (input) for mailman id 388819;
 Wed, 17 Aug 2022 10:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOGDd-0007rS-LH
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 10:24:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcbe96b3-1e16-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 12:24:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5253.eurprd04.prod.outlook.com (2603:10a6:20b:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Wed, 17 Aug
 2022 10:24:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 10:24:10 +0000
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
X-Inumbo-ID: bcbe96b3-1e16-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0PijLLs/krXMHPsWRBl2mFHMz7GlUarbOUkDnujGAMcdjTn5MptIA3JwsusJB9UjIf5v6fYZfQPPvAYuyZypGgBKt4QQHDWnusWACB+qSa5Snr8kbnfICO5QhcJNkPu64xD7S/Kf6wiaRNqRv7ZdD1ZJ37p0jf++sTuahT2xnRrNqmYjDjuyJNix4NiJkoYxieqnmzigwCpK9XNi00oK4c8JCi1nwC+rZhgWQ4Hc6WJUvwoSzWFiZK8tl+9M4rFHGZ09m/hRGGAVQQZJvHcj/mHlQcGgc8KF0rbp+pwq2EQBLkGsVOOvmYQYgPhnx5l8wK6g7qRVvRNoecg14V4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5lMmkgg8X1yWWmuln4bjG2Gm1lljen7hrUX0ZvamTA=;
 b=hEVMS+z3sq3qKpRpdREnZLg3iITNzSI/fzBRPuJ0n0miKFd0J2D8E0uS1tUdfg/oTP2OUQWZS4IikPuOgInh3bXP15Nuqm+euZqaa2Dhhukw/wbpGEtZFL4GLKvrN+Gl+AmIIm5pT4ZmUemAr9xn9EC7OItox5woHgBALMwkkA+VqrCDXm2tZ/b/Iwg6PGJv+qFoRD681E2bqWSKib8ZBi0ZpnOfvDhqtt6YB91YREbeZoARa5KGwuPOz/EEqFLzMyNes94E/TqzMekXuJOgYvd5S+jUmu3pSDP846gO2R2vR/KA0JGvNMYHgY8iXHs2fN38PZMb/PNGlOwpEe7HKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5lMmkgg8X1yWWmuln4bjG2Gm1lljen7hrUX0ZvamTA=;
 b=nl+kYOYbnigqkPp1APho4D1pmwEKZNzV2f1Z8Rw48My06SLVCGM/+pzfjXkTWuemeF8v7Ynhe9DXnAZkEpeyS+Tfa59mG10P4/YtV1TCjpvQ7E6XUF915xIKT6dw/Pzp69AxEISgH5GpLH/K2UWQKk315dAmg+u/XYvOBr+9d15bqqfJuss0rUCvTGWDVskTK/qulp1zai+Gh3Iqz53NzDThVZIk5PLA4HKyImGKyXgmw8R8OOSKOfWOLN7ReoNZVzqayPXvagMpVOqZr9r70c6CSNtL21SfjwxWTgfwe5bLyPY0C1WNrwNpQCstf52h4Gz8WV4Hr1syf/NgwkjtPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6fa4c7c-2a99-37ee-6f5a-bf31908b3048@suse.com>
Date: Wed, 17 Aug 2022 12:24:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] xen: Port linkage.h from kernel code
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-3-jane.malalane@citrix.com>
 <2bd30d03-1918-02c7-02b2-cff8d58c99b0@suse.com>
 <a9a16f4f-a891-0801-69f9-5ce66acbc672@citrix.com>
 <effeed44-afa4-a172-5365-4a7007274957@suse.com>
 <becf6ce1-8432-496c-be3d-3e756841d865@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <becf6ce1-8432-496c-be3d-3e756841d865@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0261.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a9a8d13-f7fe-46db-da8d-08da803a9fd3
X-MS-TrafficTypeDiagnostic: AM6PR04MB5253:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0dd/VSFqwZacNXnpbvkTOdrtpuZQqEYma8TpbAkPEkD2b6sy9KR/7r0HqGgzVTbnM5Y4Hvn1Uvxq0bnV6r/qN7akBjrnwCVW5xDnH2sOi9gM0AzxfAwYy1uqRgILeoJ14OTIg6ZJdZ7k6T6NCJsPZuz+jAvbVARLngHbq+RgDlaI7mICER1jzLatdgmehm8i4LEBrMqoGqI1YaWDREpUrR+1hG6IC6hhtRvxRXJ1cYEtXukZ5FGa2iyLE/MEIksAFGdHj9LdSaA2C9rGoGDUtSWicT7XQzKXY6hSOZDK7CWqaMdPlKICoV4Dh8WvXLEzBmhd8BQjP9QfOgM5ugCnxAOwXds9fGnPh3aVttrI3P8zHAIKvk0USBkdO9fw0OhsEHpc5U6Ea8AuunsZa4Z/37LqJusdOMNz33ERNe9rLwVS7HMtAQOPgGSUT3nSAp1kNGGva5Awivn57LLVHM0vNzrl4hLoWSLNMWdKwTq1xzMy2rydMe6a7crOIMpepwAisLwCQkwqiRREv7P87YvZkQ3OfcZ+nTVrYlSj8nPMDUF5xPfhOPbJT+JVvNEi44qnXGq2itxKHy8ZOjPU0Griepy1KRRA60pzmiaQAdIR1qb9EyBgozTtDvi31bMdnx5/5Ep5J9nAOdseA6EbI8QfU6wIdp7h4a99zehdizKdLJsJGYpLZkG5xQKHUca9znOUZ95amQQElBJOocXAeQDoSIiV4hasksnTpxaagpxtH1X6gj11pMHuG7o8i6llY6Gqdt+pKzQKA1KKmD8eaauyXUFElbL2IeG+x4TLn31zpeGgX8VWeNagvvRXnD2z89wuVh/YVyI/1F6LyYo40bEu2Ym/MxLHE0V+YAmipK74lrkCqmz5dPet7mjqgbbKEf5V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(366004)(376002)(346002)(136003)(31686004)(8936002)(36756003)(2616005)(186003)(6506007)(38100700002)(6512007)(53546011)(26005)(316002)(86362001)(54906003)(2906002)(8676002)(41300700001)(66476007)(4326008)(31696002)(66946007)(5660300002)(66556008)(6486002)(966005)(478600001)(6916009)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1d1eFI2MzNBNzV4NVJodmZjYXpwQXpCSSsrUk5OTm1VUGlXdGFnNFJ2OHFV?=
 =?utf-8?B?blVITEhhanZRZG83UWF3cUVhZnhLckp3N1BicUJyQjk4NTI5UUZxczlaMTQ2?=
 =?utf-8?B?Y2c4R0hwUUxqa0Z6TUtJYVpBR25yOUN5N3pRUEpGdFV3QzlQVndpSml2NGYw?=
 =?utf-8?B?dVZON3Bpak11eldWNU5FelVyeWxBOVJPdE1CTGVTOTlVSkNzcyswWUZOUUlQ?=
 =?utf-8?B?QzlXakhOc0pIZ2Q0Zy9ndml3RWZnVGk4OGVDeWVXNkg3a21kZ0laNG5USzNp?=
 =?utf-8?B?M09pZGxFSnNpTW9FcUJhMHVMOUdxSmNvZXQvQWZjQlY1VW94WFh5MXYrUFV0?=
 =?utf-8?B?N1RCOEpLNXZPVG03cmUvZkUwQjA3bHJycXNaeFJ6K0JGU3djQ1FIYWErMlRE?=
 =?utf-8?B?NVNWTmc2b1BkSzJzY1ovL0ZGRzlZaWU4bTZPOHBpU0lHZVo3Q21GOGNuZ2Jm?=
 =?utf-8?B?ZmRvbkQxN2hjbEpOMzZ6Q3hMMUNDZjI2cGtKU2NCMWxXOHZ5WW9LSlpoMkwx?=
 =?utf-8?B?RUhJSzE0Zk9HT2NjbXpyRENkTldOTHQ5RVRBaHB1N1lXS2dhaHBTTlJKN21W?=
 =?utf-8?B?VTBSdFJzTm05R0RkQUtZTU1MMUw5UXQ5R281L1N1bEprOWF4eHEycGUxemQ3?=
 =?utf-8?B?b1k4QkRZR2hiaW54MmVHemlWYmsyYXkxbHBGV3JFK1VHU2NROXJWMHlHSHdR?=
 =?utf-8?B?ams0Y1RGR3E0cXhXbDYyTXUyTlNYaVRuSkE4d2RpMkpzYVZJdStJQXEzQzVx?=
 =?utf-8?B?Mmg5L0I0eXRQZ3VxOEFZNlhaZWV3c3hHM0N3enR2dXVKa0xLSklwQzhPcktr?=
 =?utf-8?B?Rkc1aGYxaW03VUIwZGcvWktCQ0FrR1ZGVFVYMk1idEdTRGhNRGI1dWJFSmlx?=
 =?utf-8?B?eDJkbCtJcncwRi9iNmtqOUdDZGtUaE1YNDlLUHV4YUIrRFRUaXd3YnpBT2lq?=
 =?utf-8?B?bjN4YTI1elVjcWV4RC9aSXkvRjA1OHp6bStrMDVIeTh3TG9uQW5rNDkwWHZ6?=
 =?utf-8?B?c05PczVOc1ZUZTVCRUxYUTJKbEtuTkhjbWljVERZVVpEdWdZMC8yaTNUamU5?=
 =?utf-8?B?WE52ekV0ODZCZVlQWEFBNHMwdTZia0ZmdTVodElQTWJEYVpnQkg3ZEtzZkli?=
 =?utf-8?B?b1FBZEFBS1MxSkZ5M3BwVFlBSHB2UFRLWVFQNjVtY0Q0S3R0emRaNmsxSXR1?=
 =?utf-8?B?RHZYMHRqMnRLRXIrYkVWSFp4aDBTdzdYTWZJdFJVcDN3a1FWd2Q4a2FXMCtn?=
 =?utf-8?B?em9NMG03T21LOVdadkR6dWRPNXVhUHVmSXVlamJGcStaSUFGdzYvWmV2djhl?=
 =?utf-8?B?ZllIVEhoejcrRDA1UXlLb3I0bVN6V3NIL1BlS3lzcnhGZFJLYlN6Uzg5S3g4?=
 =?utf-8?B?WFpkV0lRekRQL0dsYVZ1TFdPbDUvRzRtSms3TVZVRGRGS2N3WHhEczI5dm5W?=
 =?utf-8?B?Z3NBalVOYjNtSXlwcHhBMklZVVdTNSs1a1MzbS94a0hIVHpIV0RlS1JFUk5F?=
 =?utf-8?B?SDhYOHVXaENPOU1UNWlST201aXF1NHd1ZTFuZUhpcWYvTzdvOGNPaFphSVli?=
 =?utf-8?B?OGJGNE54MDI4RVA0eGZDbWZCUHc4YU9LN0N2cXpGVVA3UVozWXNtL3ArTmxE?=
 =?utf-8?B?bmdmSFdGTzFvdjRiQVVGc0Z3UUR4ZXREYkdEaUxFT3pSQUZ1eGxqelhLYyta?=
 =?utf-8?B?NW1qL05SMHFFaXRYYkJQRkgvNm5wN3FsTUVLNlEyRXpyWGhUd3pSNlNHVFpt?=
 =?utf-8?B?ZGtyODZGUEZBMG9GVTFBNExkY3d4K2VmMjJoZ1RLRWt6Zm4vUXFWTGxmaTVo?=
 =?utf-8?B?TlVLZU1QV0I2emhoQkJseGczYnBsa0JaNERFZFJmR21aR0JRMW1sRnZ6NHZB?=
 =?utf-8?B?YU1xcFcweUxVZVptckYrcktoRFlQV0REUkJINTlCYlp4bVNQTEJ0S1VMVWhD?=
 =?utf-8?B?MWNhTGJWZWNPSG5OZlpNWDVyY0xKRDVBNVlNUUxrWjNxS05RWExuR2FFNm9o?=
 =?utf-8?B?a2ZGZUJQWVg5ZFVwbTF3WC94dFFCOWthQXh0ajlSWk92d2dsczBBN0xmZ0lY?=
 =?utf-8?B?SjZ0a3lERENiZng1TWtUN0VJdlB3emlCM3BOellQQ2FSRkNUeDIwOWh6YmJk?=
 =?utf-8?Q?nV2x3osQXqX1rsnNXrEYsv/gm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9a8d13-f7fe-46db-da8d-08da803a9fd3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 10:24:10.5828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77gET90NYX3RTxHSjsy0qBgbpCtRLLYVeNPa4Ja+aqmsnhnP+fSpzPRX5P9B96RnjblbKks0HI1kti2bE15DLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5253

On 17.08.2022 10:56, Jane Malalane wrote:
> On 16/08/2022 14:06, Jan Beulich wrote:
>> On 16.08.2022 12:16, Jane Malalane wrote:
>>> On 05/08/2022 10:24, Jan Beulich wrote:
>>>> On 04.08.2022 17:04, Jane Malalane wrote:
>>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>>>
>>>> In the title you say "port", but then you don't say what customization
>>>> you've done beyond the obvious adjustment of inclusion guard and
>>>> adjustment (actually removal) of #include-s. How much customization we
>>>> want to do is important here, after all. I notice you did, for example,
>>>> add new flavors of SYM_INNER_LABEL, but then you didn't add anything to
>>>> use .hidden (which I have queued as a new patch on top of a supposed v2
>>>> of "x86: annotate entry points with type and size"). At the same time
>>>> you've left in objtool related commentary, when we don't use that tool
>>>> (and no-one knows if we ever will).
>>>>
>>>> I'm further not sure I agree with the naming of some of your additions,
>>>> as they appear to not really fit with the naming model used elsewhere.
>>>> Your additions also look to not always match style used elsewhere in
>>>> this file.
>>>>
>>>> You further want to mention what Linux version this was derived from,
>>>> to make it easier to determine what incremental changes to port over
>>>> subsequently.
>>>>
>>>> Overall I'm not convinced this is a model we want to go with, first
>>>> and foremost because the commonly used macro names are too long for
>>>> my taste. What's wrong with ENTRY() and ENDPROC() / ENDDATA()?
>>> Hi Jan,
>>>
>>> Since I have no particular opinion on this I went through the discussion
>>> that took place before those macros were introduced in Linux. One of the
>>> points made was that PROC was an ambiguous term to use, since C
>>> functions are not actually procedures, at least not all.
>>
>> Just one remark here: We're talking about assembly code here, so what's
>> a procedure or function isn't well defined anyway. I wouldn't, btw, mind
>> ENDFUNC() if that's deemed better than ENDPROC().
> Do you then propose that we use ENTRY() and ENDFUNC() and that for inner 
> labels we keep them as is (so just "name:"), since using ENTRY() without 
> a closing END() for some "functions" and not for others could get a bit 
> confusing?

Almost - I don't see anything wrong with using ENTRY() without any END*()
for inner labels, if the implied alignment is wanted. If no alignment nor
type / size are wanted, we have GLOBAL(). And recall that I already did
post a patch adding various ENDPROC() (which could be converted to
ENDFUNC() if that name is indeed liked better, and which could easily
have ENDDATA() or some such added), see
https://lists.xen.org/archives/html/xen-devel/2022-04/msg00876.html .
With Andrew's odd reply I didn't see fit to post a v2 so far, where I'm
now having a further patch adding .hidden directives into GLOBAL() and
(indirectly) ENTRY(). Not the least because my reply (where I did already
indicate that Linux'es machinery looks a little too involved to me)
didn't have any further responses, which would at least have helped
clarify what - if anything - I had "rejected" long ago.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE856F44DE
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528608.821987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptps0-0002oE-ER; Tue, 02 May 2023 13:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528608.821987; Tue, 02 May 2023 13:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptps0-0002m7-Bh; Tue, 02 May 2023 13:16:40 +0000
Received: by outflank-mailman (input) for mailman id 528608;
 Tue, 02 May 2023 13:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptprz-0002m1-Bm
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:16:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91b309a9-e8eb-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:16:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB10003.eurprd04.prod.outlook.com (2603:10a6:800:1e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Tue, 2 May
 2023 13:16:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 13:16:35 +0000
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
X-Inumbo-ID: 91b309a9-e8eb-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJ3KZvBf2B0vzXhiefkVsiNqMULOUpmn95OoBoia67ruP+Ji+PhhfKA/heo0di5174WmeR6Yg1ge3tjYk1FxjogCWZ/410pWGc8rV0Vs/a+Rlodd/GCfasScrDnW3ueP0O+63CN1wzka+/Vv8PRKDQttMdbBfO19dFByORJqpAATQONzJXFdp/+NBsceZMOQWi9/l66rr+FF4w2wEVzTXADHKQiVNiu6gq5KZ0cI66EJeW4c0bTBr6+FEOJn38Gm+RWMls6zd/pN5plbwttdinbBY6PJguyiaty4oKC+Zrh2SQoKNl33cniWIqLE7gMJUKxLLOJpOwFCq/yU/PCPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5vUR8qPbyRvK1zt8gvDOYqVk5VfhmNIvpXaUejS8Ok=;
 b=VMRsT2GByfe+lvGQGNB0sj/MLzfz16+VUKjPX4xKtKtgk/Co5mgiUtpB158NkxAg91lYhpwd8NRg6fkTAxLxn+toZb4P7w3OEh0VSVVfbS7B6XysKngo/5o2Kc0ymuiHgeFKUyva2GvV+CYYHO1AbcN/KOp3sd2ibnyvS5O95T2y+ujL6/CfvXqhXEk0fkyDdakqxvfawHdYOflpdkozgl8KEAA7eGAbPSwCalPKdXgRvRBZkNLKpneo08USGa403GrzpSJ2pCTdgFTm5I4Sq94xn/syHiPWoBSpK8EZF1d7lTNe+sUPD6YsXFu3PhIAGKb8qCF2euzC5ZdsPd8jpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5vUR8qPbyRvK1zt8gvDOYqVk5VfhmNIvpXaUejS8Ok=;
 b=TMebciRVbRZObZ9wzvnqmmsJAN9gzXXoUlQNc03ajjlduqv4x1lDjDiO9gj7cAK6l2i/U3BM66Yvb31Xz+7BgOnmJN67s7Vsedwy4hXHhrzYbiNLpcesuocYADHkTBcPjwbv09JnNUYaQ5lKZbEH0Jpa6Jmvq4qRfxCMx3PiQpQk4ah4EIPkOimxmhjuNpyG9XVYOUKab7Rr+P7NyqRIhsO//NgN+hWaJZsO5gvQ+ll4gRM6QD4+LzpBuEaiIEwcnbphmy031c9XQHp1cee9v1iuN2MyBU0v/utfmhHsXrJrwshIOh5O3V63jTrnmGvCOodTJ/ziPgkNSVBKhxCBDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ff2af4f-db6a-71b9-649c-028bf4148eb2@suse.com>
Date: Tue, 2 May 2023 15:16:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
 <22b2e03c-ac5e-915a-78a2-0a632b09a53a@suse.com>
 <c333f02e-0655-50ec-aee8-7c1449ca267f@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c333f02e-0655-50ec-aee8-7c1449ca267f@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB10003:EE_
X-MS-Office365-Filtering-Correlation-Id: 042848df-5c30-4928-9fd0-08db4b0f7457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HFM6EyUMNIVOfETbZzVPcLUJTv48AUYr2JZR6UAbV+ggX9+dd/OQCyH624oj81dnXAbC8MGl5jXGV0TsZsg/irgKvMFHdNZJQPlFdVPjqIdT2GDxsr7SN0N0mmDZaFWm9GfNygzrh8EVrsgJde3PI0GfMx5NiU8qTQXXSClaVuGhA9wRN4u1lPT/+mpFpR4IkPVRXyUCgvmuHwqJnE4lXcCWgpi7Ffsb7I46+WYkQCRJ1tdLKKkS9mxNB9r+fnr96fgpO/LnffzsTPc6/K/hzrR+5/NcIbsAMeiHV6l5XRNbVQKZhhc5KFZYFMPjsqtbHlbAGCsCsGiSxxiOHxsK51Fq+9W8mNe50vKKi00GtECMkoOYJREup5M8Fkfehc/lT9B7E/vedIjWOkm/emccw3GkJaglowKGHv0O2vC/hxeZYX7rnfG2Pe8IkRYq0jFzMMgkI2TbgoHGTWAQ+ZoDwMsVrU+tLYiMUJ75dgzUD6itiA4odtT6479GkuuV47X/AaR6laQQ/UsVrdgc2D5wJfAANtxtUM4dQStAdOmh4nvZefx5HHcvXbGWe/i+/kJbKgAG0lLv9w8w7lI7nvkud0QOfqC5lQpk1Qz5zoKBLN+ihwJ79SUETCbBN3sEGGG3IWc3eWSzk4GOIVNE7y2GDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(136003)(346002)(376002)(396003)(366004)(451199021)(2616005)(6916009)(66946007)(66556008)(316002)(66476007)(41300700001)(4326008)(83380400001)(6486002)(54906003)(478600001)(8936002)(8676002)(38100700002)(5660300002)(2906002)(31686004)(186003)(6512007)(6506007)(53546011)(26005)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXNCWEJmenVKUzE2UFpkVVVUWGlsdnB3Z2VtN045OEpqRFNXVURDR0p1YmNi?=
 =?utf-8?B?T0hhRXNRanMzL2RCSkt0b0ptL3hxYlFVb3NJNDFpWTBzLys2NEliSWZWOGNZ?=
 =?utf-8?B?dlhlMXhNNWFxTGdvWHB5T0pVYUhUOUxwaGNoU2NQelRNa2hnRksweE1DNFNW?=
 =?utf-8?B?ZzR6SlUrUStMOFJNMXZFdE1VTjY4VlZuRFgrQnBVdkQxZXBTTmEyOTJidjlO?=
 =?utf-8?B?aHorZGNDU0hIRUlKM1lud2JmZytHeGtnZklwQnE2cS85UlVtT0VmVmR3b2hU?=
 =?utf-8?B?ZmhTSkcxZ3ZaZVVxYXB0S3F0WEQ3UDludXlpL3FwSFErbW5LdmRLcjlhSGhz?=
 =?utf-8?B?TGtSc2hsVURxbkhZTkp3a2J1aGhYeWorWXJuUUF2NFpPekVUTGR1eW0rbnBr?=
 =?utf-8?B?MnRjUVV1U092VGlJNDFNZ1ZtSjJ2Y3A3dXBSczU2cUtQT0FkalRzeXlNZCta?=
 =?utf-8?B?SHlRR2VpcWc4elhTaHoyWlZrVFYxdkN2b3NqZU1XZ203c3hIZE11Nm04cVRj?=
 =?utf-8?B?S2trcUx6Q01MYlFBWGVVNE1qNmlrOG8vS0IyZ05Zb1Q4TEg3YzlWditjcG5D?=
 =?utf-8?B?QlRUQ1Q5dGFrV1RFUkNrZDllM0N2Smh1U1NuNlN5Y1JlaTc3bG1HaE9XV3pN?=
 =?utf-8?B?WW5UOHJWV3NSNlhtYU56anBPVjBKNVAxb2o3VDh1WDM2MzdmMjUxblltaERt?=
 =?utf-8?B?SGlkdDIrSnRnTVJhVU9rZW5hbkZDWUg2OWt6VVpMbDMxZUVUMXZQVFQwTmVL?=
 =?utf-8?B?SWl5NWtkOWdvL25sK3Q1QVgxRTFzWld0QVhLRzNRbUU0dnhnMWY3aEE1YlNa?=
 =?utf-8?B?bUN0MGxaWnVZVDRDcnBaRWRKRDlSbkZzRkJPTVVpZlVUeVlRQUFQNk5lcnlT?=
 =?utf-8?B?ajBoMEhLeGxvZ1BQZ1FPTjRIaDR5b3Zua2NDcVcxd1BtMEpaNTQwNlh1U2k3?=
 =?utf-8?B?dlI5VGVGN1NYZ25vZ1dOSGkvbGNCSG05OWEzdlI0OHc4dUdrMFcrOEhXT3Vh?=
 =?utf-8?B?Tk1pcHZyenVueFNqdGxTd2gyRU5KVTVQQUVQV1BtOG1EWDRlODZNMmt1MjJ3?=
 =?utf-8?B?RDY4ZVVQSmtDcHFyL2pqZDZCSjB3dmFoWlBsNEI0cUpDbldBR0pIcTYwTGxt?=
 =?utf-8?B?clhmREpUd3FJcThUaDdVQWVHTlNFbDcxNzB3bk9SejQ5L0h5Vmh6ZXhDeCtt?=
 =?utf-8?B?RStOTDhLVEU1dnFrUEZlUHJBUE4zNCtNN3dIbHVZYzNLQlZlNTQvVGpYdGIy?=
 =?utf-8?B?OS8yRElMQW1CSnIwbkEzcWpKelBMaFpiU2RpS1dDT0N5MDlpMUJmOEJQTFhU?=
 =?utf-8?B?THhWUlQyZ0VseS9PK2FrSkFQc2pzb2lnM3hhenJ5Nkg0cWhpaG5ya08wN1Zk?=
 =?utf-8?B?N2RseVJaQjBadnRtVXBHZ0NhZmtyOWVLVk1hMHUrUk93VGpzY1dUR2dQV1JI?=
 =?utf-8?B?YjNqNVZpejJENEJzQ3YyOWlLaytYV0VwTXBwRFU1Ulc1Y0g3ZFVyeEJ3SUdD?=
 =?utf-8?B?aFF2d0Z3dDJJaFN3SEpQMTRQTzArODlkVzJJV3QvRHQzcGJPdzRWWWFxUkxm?=
 =?utf-8?B?SkxMSjh0Z0tQMDg1aW9VRjdMZTduNDAydUZSNkRyM0tyRzR5djVsaWh5VzJ1?=
 =?utf-8?B?S3hiZ2haaVBzbDZnR3FnWUFzWm1kWGJ2QlNCOXJLaGlFUDhEN2J4MkIyZVlC?=
 =?utf-8?B?Rjc3aEE5dVNZc1IvbDM2anVCZm5TZDVuZ1NtdnN5V0tXLzEwTmhQZVhGT0hW?=
 =?utf-8?B?RnA4dlFiNlFuRjFGYkl6MzVKZVJiUnhrcm10TzMzbW1HRmx6K294SnBDKzlF?=
 =?utf-8?B?TXZROG4rMlc3RWJiQzlkSzFlcWo5dW80Lzk1L2dENGswclhlOEdMa2xRVnF3?=
 =?utf-8?B?V00wRjdkRzVJZDJMWDFnWUI5KzFkTHZVL2VDNktVSlNJUEF6N1RYMVM2S2JI?=
 =?utf-8?B?T0J4QUtrYXpkSUVjbys5K3NLMjk3Y256VEVFMDRJM2ViSGNvQnZOYzM2OEVu?=
 =?utf-8?B?L09qZmZmc1NaVkFWSTltcEFINmlMSjA3c3RYTndPWGJ3cWY0MkJEZUZ5dThC?=
 =?utf-8?B?Z1F0UnVJbTgrOG5hY21DK0s5YTB3aXZnSFZXRDBQZ1dBSjdTNWwxN3hWRkQ4?=
 =?utf-8?Q?iWAAAhQg+i0W23rNGK5J/1tmG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042848df-5c30-4928-9fd0-08db4b0f7457
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:16:35.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZW6ReGWRh6w8qzEM9N4Hfi+rF6PLzaNHEoFkB/eyTML0s/7RtJR3IuUxFeGVQIilTynLc0H2qaFve29am9wjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10003

On 02.05.2023 14:54, Daniel P. Smith wrote:
> On 5/2/23 06:59, Jan Beulich wrote:
>> On 02.05.2023 12:43, Daniel P. Smith wrote:
>>> On 5/2/23 03:17, Jan Beulich wrote:
>>>> Unlike for XEN_DOMCTL_getdomaininfo, where the XSM check is intended to
>>>> cause the operation to fail, in the loop here it ought to merely
>>>> determine whether information for the domain at hand may be reported
>>>> back. Therefore if on the last iteration the hook results in denial,
>>>> this should not affect the sub-op's return value.
>>>>
>>>> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> The hook being able to deny access to data for certain domains means
>>>> that no caller can assume to have a system-wide picture when holding the
>>>> results.
>>>>
>>>> Wouldn't it make sense to permit the function to merely "count" domains?
>>>> While racy in general (including in its present, "normal" mode of
>>>> operation), within a tool stack this could be used as long as creation
>>>> of new domains is suppressed between obtaining the count and then using
>>>> it.
>>>>
>>>> In XEN_DOMCTL_getpageframeinfo2 said commit had introduced a 2nd such
>>>> issue, but luckily that sub-op and xsm_getpageframeinfo() are long gone.
>>>>
>>>
>>> I understand there is a larger issue at play here but neutering the
>>> security control/XSM check is not the answer. This literally changes the
>>> way a FLASK policy that people currently have would be enforced, as well
>>> as contrary to how they understand the access control that it provides.
>>> Even though the code path does not fall under XSM maintainer, I would
>>> NACK this patch. IMHO, it is better to find a solution that does not
>>> abuse, misuse, or invalidate the purpose of the XSM calls.
>>>
>>> On a side note, I am a little concern that only one person thought to
>>> include the XSM maintainer, or any of the XSM reviewers, onto a patch
>>> and the discussion around a patch that clearly relates to XSM for us to
>>> gauge the consequences of the patch. I am not assuming intentions here,
>>> only wanting to raise the concern.
>>
>> Well, yes, for the discussion items I could have remembered to include
>> you. The code change itself, otoh, doesn't require your ack, even if it
>> is the return value of an XSM function which was used wrongly here.
> 
> I beg to disagree, not that you could have, but that you should have. 
> This is now the second XSM issue, that I am aware of at least, that 
> myself and the XSM reviewers have been left out of. How and where the 
> XSM hooks are deployed are critical to how XSM function, regardless of 
> how mundane the change may be. By your logic, as the XSM maintainer I 
> can make changes to the XSM code that changes how the system behaves for 
> x86 and claim you have no Ack/Nack authority since it is XSM code. These 
> subsystems are symbiotic, and we owe each other the due respect to 
> include to the other when these systems touch or influence each other.

No, that's not a proper representation of "my logic". Everyone can comment
on any patch, and pending objections will prevent it from going in. Still
not everyone needs to be Cc-ed on every patch. If you want to get to see
ones you're not Cc-ed on, you'll need to be subscribed to the list, to
look at (and perhaps comment on) all the ones of interest to you.

Jan


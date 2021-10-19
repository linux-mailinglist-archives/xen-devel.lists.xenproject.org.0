Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D20433046
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 09:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212834.370866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjyk-0004CR-TL; Tue, 19 Oct 2021 07:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212834.370866; Tue, 19 Oct 2021 07:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjyk-0004A2-PV; Tue, 19 Oct 2021 07:56:10 +0000
Received: by outflank-mailman (input) for mailman id 212834;
 Tue, 19 Oct 2021 07:56:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcjyj-00049w-1O
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 07:56:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54f774bd-0fbd-4e46-8be1-71a8c4b81afe;
 Tue, 19 Oct 2021 07:56:05 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-X3EdQ8QhPy2SzI0MkVf5QQ-1; Tue, 19 Oct 2021 09:56:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 07:56:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 07:56:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 CWLP265CA0413.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Tue, 19 Oct 2021 07:56:01 +0000
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
X-Inumbo-ID: 54f774bd-0fbd-4e46-8be1-71a8c4b81afe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634630164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0oQ4ASkT19buSsEkCIuyMxR9FGf/D3eiJozGaAgNrf0=;
	b=DPf+yBXWLE8mKNUGqPuSgXC8WKJkFmXLsT6iiAWsJPan2q6JJNdm+FT5hhN8FkjBtkd40v
	jhQpNoNMRGiiLVlJjlVKD6kUa+dgo9iHI7K6cmxLS7WYgeD74D9ELE4UkGTqxQ37YPvEK1
	ECBmyK4r3GJ+mQLCSoMyKfXi6IuBkFo=
X-MC-Unique: X3EdQ8QhPy2SzI0MkVf5QQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4Ob9U4H0rniGHlPsKOP3FHf4+h3HjyimIDCIDtQ2ak9WPPmVrlCnSty0yNfTQW50giO9eIjrjjxJtdlpy0zdKuEAGVKubDYSH6zArGyNi3DP1Jh3Rp9yP41HVU8MSyLxDVcs4T+0EUTSjLD5zagltGySTyt2TqLHkH1ZFH2I9WoWzMjQdv7lBmPwUXabcolcuMHp15ZOmaEKSkztfHKNosWBqq1x+1/nIfHrohWQuYlu0Hd/ThNp0yqfqvq92ZKJ7ZwgoaKFmeEAfneASPgINQw326PuWP8OMaUOIqfbmBQdXARcmiX5Xn7h+Qmnl04mX6hENkYZpFrxy4XJrwBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oQ4ASkT19buSsEkCIuyMxR9FGf/D3eiJozGaAgNrf0=;
 b=PfNbqBCXR17Di38f27JQ3DZ+Lk42IcLko5iuYR52bPe3n/PwHhwEXs0MFBw7YbmAAXzjP5E0MwOF2rw6x6lymHyTlo5ZGAyjxRc/+rSt5HG0H3R877Qa/uWKSur2PfPr+Os9zz8XLFoCFI6FFxJCXSq2F+luJGZB4Jqi8VrgoIddcZ79hPFbapwSQIhBEFpJx8UxiX8jcp/gC+0i+Ns8cV4CtImueS4zti/SzQPOoPeiGpO9jb/ad7lA9BkftAjG9Gr53Xd1KykMPwGNNF+JIaI/Ggwo4ASjLD4oIrvs0Wc490a46RhT5lSwtTKyzBSJGOTKAkTRtP1doqIqneSFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools: fix oom setting of xenstored
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211019044123.29648-1-jgross@suse.com>
 <0c93abe3-3908-009f-efca-08000092cd4d@suse.com>
 <c486ebb9-7cda-da67-7122-bceb291805b3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <912b03a3-90df-e94e-77a9-5c673acfef04@suse.com>
Date: Tue, 19 Oct 2021 09:55:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c486ebb9-7cda-da67-7122-bceb291805b3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP265CA0413.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1b6::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 024ebaf8-608f-4422-b166-08d992d5e4ca
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71499DCDE05E4357123F05B6B3BD9@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mwnJheP0HXvbKEBD2Yt2RJhsUqxp7owv4tW3DCQ4Jdkc5fY/WSXbom2614C4HNwz0Ok4zNRxARQjppZVBHrRRid9pmhGmMIEdA7oSxn0SYtOWHgjTCxMPTHjnbA18kaSjucrpE9/jNhoE9vmvmyj0hz3bzKty+Iqv22qJKurDBzW+V6wf6BzLgTtYwaiqJquOybC1A40jJZHQS178gWTzxwFqMuHwio2BL0Z3DwDl26QPBCvxsrD/NFGFj039VMTIokw/cXOytmrbTjBET9ZLyZWe+kjW22H0UnriSEWAq9qpwottSXh2jz2A0nTyuLynQwV6AcYErKLi6mJ66fw9Xf2lY3N9Ft/LvkDTmFKCPu0Dlt8P/Mn8rKdjxu9G+bWN2MpOp2nDcgFYthaHm7UcoMmdIkscLtyxVPobyQYgGW3FvHAoD2r6EI1s6y7lMMGpkLr8pM/5MBAhsDLu7qlOgVVkHh4K5gASdZkx3sSRz4Vuc61kfCBvoTX6MTbVWBimjvQKGkaRqmaou+6uz8l7pXJrN9aSimX4tdQTTtWQ5J+vG4oTtcDGBztpzNsZ6QDy73pQRf/ekQ1O05sS11RPaYJS1wPQXxiyA7w4GGCPXasEGu3hABtAv/C3uKbGs7qe6W6D1Bmr1M8tibVQeE3gzxhKuqyaQMlIXu15wrbIwRwJi95rS2O7WIZIMVBRtjKw3PfQ3g/WWNbqdIMgGzU9s7VFxcWKG4+5xTncuga1ZipO/w+80zWWJiID8OXk9ktIenlK/gVKWXO+vG5akYMCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(53546011)(6666004)(6636002)(38100700002)(6862004)(956004)(2616005)(8676002)(4326008)(16576012)(54906003)(83380400001)(316002)(26005)(31686004)(6486002)(186003)(31696002)(66476007)(66556008)(86362001)(5660300002)(66946007)(8936002)(37006003)(2906002)(36756003)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eURRNEZGMk1WOFNpZ1dtUE9ZVTJ4ZW9LUHducmxheHg5Vk5BQVQ0UEdoeDdy?=
 =?utf-8?B?KzY5R3dnUTk0V1NxbDgvY1Vjd0plYjRFVEVFL2ptcjk2VnRKNWVLeGdrUGRO?=
 =?utf-8?B?dXVFU3lUYWdSNzAxcVZOazFHYlNWRlhpbmJDeDlaYzRYTkZvWDFhYTR6YlFF?=
 =?utf-8?B?ZElFOVFoY0tnaGhwVmZNUVpJVDJoNGc4SDBhZ2Vmc1d3cmtUc1FTUXZBWVBK?=
 =?utf-8?B?ZHhkK1NpYVlES0VGUldyZkdTMUlyVUFMY2pqQjgzN29HdHB6RnhlNGpEOCtJ?=
 =?utf-8?B?aFgvbUE1RHQ1ZytTamxhZHNBUDBzK1JtS1VOTTZYaXNmU0dydEZsVE1zaXV0?=
 =?utf-8?B?ZGdLQWhDUGgxL1gxRWgwSWJjaUVLYXZVV2gzRmVrSUJScnFjY3RhK2VYL2V2?=
 =?utf-8?B?OTA1aVNBRVhENmJHUW5aQVM2S1l2QVZhb1l4R1h5enpkWUdjd2RjRzlmYVpU?=
 =?utf-8?B?bDcvaDYwZ0lHelhCbUdvbDRkMkZtdjJqOENsSVg0VXlDbTdodWdHODRndGFu?=
 =?utf-8?B?NGREUmVlMDJtb3krSEQ5cU11bHJQU2NmT1FvZ3hsaXd2WnUvMzg2Y2VZTVVx?=
 =?utf-8?B?YmYvclVYd21PY0ZqaWY3K3UzRVVyWEROOXl2WXkrNXhVSmZhV0Via0Uwa0hq?=
 =?utf-8?B?WHZWaFJTblhFeFhaellGcXZlVWlzM2hVNndJL0ZXYXFRd3J1WkhDbmlhc0dV?=
 =?utf-8?B?TjVxR1hBMGxtRkZQaWVXdXEzVXFjRlNZbjZ5MTZKN3hjdDlKMmYrNXBLY1dz?=
 =?utf-8?B?ZDBsRk52MkZIUnpWdm9KRnFPV0pQay9aTjdtdWY0UU5pWWE1VUVyY2M0N29T?=
 =?utf-8?B?ZEp4Z0FPZVJYalhqSEFMcU42Qng1RTFyb0tnNmFMbVh2ZzRNUkorOUVjcFM5?=
 =?utf-8?B?enpiNldENGlNMGRveml0UWxGNkUwbjkrT1BCN2hwRkg2VDBiYWFXQjRoUGgz?=
 =?utf-8?B?UmtXaU5yNFoyd09jVVlOR0w1ZytiNGdNelNYQ1VXMjZKaU5JOXBVelhuWmE4?=
 =?utf-8?B?eHhSTTIweGNlQzY4d2JVOXQrQWRQc09ldUxlY042cGNYaUVoMm1MNU1Paml2?=
 =?utf-8?B?bTJmOUgyYTBNOGkvVExXT1daY3Z1T2gwdzdHNkE5OERsdWVSOVBXTTl4WDRF?=
 =?utf-8?B?Ty96a2cwZ2V1NlJ4QWJ1QS9uUmVGK2YxdkpvUFZKR1oxUGVXay9aMGRVdEow?=
 =?utf-8?B?UUp1RnNIcXJqVTFTNEZxZU01ekZOZlhnZ0lHeldINnptT1FKaXM1V3FMNThE?=
 =?utf-8?B?dGZ0a2h4Yk1ZTUFseUxEYmttdWtzazNYdWgzMUk1TlNoNCszVkw5SG9nSDF5?=
 =?utf-8?B?LzAxWGtHQWVLa0x0Njh5cHZTZWJrS2tYbHNRdVVuRlhSZHpvekpIeUdsYlV6?=
 =?utf-8?B?Z1FYTm5NR2F4bnZ5ZUNjdU54R3hGa1BMTm90Q3FtVGVOYkZWV3h1ZCtQU0Fz?=
 =?utf-8?B?S0V5VTB6R3VleXg4cnFJM3VpL1FKRWEySkd4cDBoWnJyMzBFNEswUWVja0ZY?=
 =?utf-8?B?SCtnUFBzYSs3UGc0MGtBL3JYSWJtMGloZE1RUzNweWluQWtMQ2ZDWEpobWtC?=
 =?utf-8?B?NW5sZmdZTytIN1hzT0ZrMDAxOTdCVDAyVWtqeE44ZUVjU1IzN3BiRUhCUmU0?=
 =?utf-8?B?Q1Q4Q2xESmZJNGpBV01xdWxzVVd4YkFEQ0FvcmNCKzJpbDVsR3M1T0s1V0Fo?=
 =?utf-8?B?cHQ4Wm83Um1IN2IxSzJHbkh2RE91Q1lmSHJoYzR6S0llL0dmVHBIWHNvWGF1?=
 =?utf-8?Q?2lSfRh3AF68kqmHoRwTciOlf2AlDCearDwR7JUD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024ebaf8-608f-4422-b166-08d992d5e4ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:56:01.5073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sx+sNMfjWCbYeelc6MdJvM8EwJRXkThYJXaWi6TVo/OnnuxWLXBAtrpZlE0Rng8C88LRvCAPrbYhP9yUEcLywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 19.10.2021 09:31, Juergen Gross wrote:
> On 19.10.21 08:54, Jan Beulich wrote:
>> On 19.10.2021 06:41, Juergen Gross wrote:
>>> --- a/tools/hotplug/Linux/launch-xenstore.in
>>> +++ b/tools/hotplug/Linux/launch-xenstore.in
>>> @@ -60,7 +60,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
>>>   		echo "No xenstored found"
>>>   		exit 1
>>>   	}
>>> -	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50
>>> +	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] && XENSTORED_OOM_MEM_THRESHOLD=50
>>
>> Is resilience against "set -e" being in effect of interest? If so I
>> think this would want to be
> 
> I don't think set -e would have a negative effect on above line. The
> bash man-page tells me that:
> 
>    The shell does not exit if the command that fails is part of the
>    command list immediately following a while or until keyword, part of
>    the test following the if, ...
> 
> And I believe that "[ ... ]" is treated like an "if".

I don't think so - "[ ... ]" is an equivalent of "test ...", i.e.
unrelated to whether that's an operand of "if". The question is
what effect && has, i.e. the behavior is due to what you've
hidden by using ... in your quotation: "..., and is not a part of
an AND or OR list, ...".

I think I recall constructs like the one you use not working with
"set -e" on at least some bash versions, though. Apparently this
was due to a bash bug then (or I'm misremembering, but that's not
overly likely since some of my long used scripts specifically
avoid using && in such situations).

> A short test
> showed that bash indeed does not exit in this case:
> 
>    ( set -e; [ -z "" ] && xx=okay; echo $xx; )
> 
> This will print "okay", so bash didn't exit.

Of course, because the left side of && succeeds. You'd need

   ( set -e; [ -z "xxx" ] && xx=okay; echo xx=$xx; )

and observe "xx=" getting printed. Which indeed I do observe on
the one bash version I've tried to double check. But that one's
surely newer than what I think I saw such problems on.

Jan



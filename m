Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4BD698E83
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 09:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496408.767135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSZUK-0002r6-7v; Thu, 16 Feb 2023 08:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496408.767135; Thu, 16 Feb 2023 08:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSZUK-0002oo-4h; Thu, 16 Feb 2023 08:19:32 +0000
Received: by outflank-mailman (input) for mailman id 496408;
 Thu, 16 Feb 2023 08:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSZUI-0002oi-Ny
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 08:19:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2325ce7-add2-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 09:19:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6865.eurprd04.prod.outlook.com (2603:10a6:208:181::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 08:19:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 08:19:27 +0000
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
X-Inumbo-ID: a2325ce7-add2-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkfQJiNuFbRUn0lX5s+lDOYdjitcIzX/d3iBtZpnCLBXaz/BPDUBZIx0CdUecUMsSgKkrV1HPkuI5tWlOEt7MRt6aFtDc0oTyOwk8HjvU6WIxdhSrnrkG2CykKBmFJZYN2fAydTqfOvEJKcY4gnmOL0BKgcdyRDilrdLRgp2vRwSZ6iWesFnwDKnKnpUXPucV/5gvFLZkU+ZB8hH9DM+IPIr18T7ykye2HfSKn/EIbPwLSjhVqBtgjCh9Zg3xjKSh073F/k3jav+C/dqZNbfk4xestTSa5CYQHoshhUHT0CCw/MzgZEnkZxiCLYabzjjhBhwY+0bzcd50SRxsSdrXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8raGTr4cPQ3xqEcVtwLlyww1rc4+7cK41BCWp5RU16Q=;
 b=DII7gydDcZRLhwCqH0mBPtqCdrBpekm5Fwqc66Zfu8GH0ri3DTa7gEX9beQNTnzDdWdp6HKTC+6fZjFdL0x62kZxfg5GGgGCkVspJuxmxiBs4pk7Rhpm/pathVz9812ajC75R7Iwrt4XKPn4x7jDLQQmEb78diVJEdxwe1Rszp9OKf4UY6RJkgCNzkerAryWRKNqBGLvko46KhL7PrYCABlENwAB4XhhIKMfY7qVdma6cbyBOpt9Sm0EwJzWwNahEZQlxGYX4GSf1YN8mdbZSSYKq/YGtDXcdOfY7oCGetgn8JsjE+dV6LsKnfJnto70W7I6Xc5/X+Ds+vGRxJWDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8raGTr4cPQ3xqEcVtwLlyww1rc4+7cK41BCWp5RU16Q=;
 b=RchW6vV+UeZyF4nblTSWNFxv0qF0XyFnUIANUQ5JSQbSzJdgFXSUvs4IZnvD5QTdxaP6/uRJDqVmDrrfS6j+guXAIYptgnk/LgFoCj6saTBz2q43R6V+CMwZOI0VsWFOp/txkekSlpX8GOg7voPfEOHE2UKDGW0Fl1lLNssCgIIMz8NG8AJ6Zsbd67bAK5ywMyBU8o7XLSlVYH7O8ZpjBpiE0+MEcDIuaCxassGU822WROOkK6yz/6QoGTNfjujvnQquJmMF8MbrgLcptChLMZEc1VuFDUB+HJo/v1HmVhPtZ0kgahN8HTPLL00rW+X8Txc4/0ONqHtkCwVNYmdMWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14a4bccd-f316-fca9-a04d-5bd639307e9b@suse.com>
Date: Thu, 16 Feb 2023 09:19:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/2] xen/misra: add entries to exclude-list.json
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, wei.chen@arm.com,
 bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Michal Orzel
 <michal.orzel@amd.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20230214085635.3170962-1-luca.fancellu@arm.com>
 <20230214085635.3170962-3-luca.fancellu@arm.com>
 <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com>
 <alpine.DEB.2.22.394.2302141415520.2025117@ubuntu-linux-20-04-desktop>
 <cd1fc5e2-7af6-3945-2d64-8bf2f728f633@xen.org>
 <alpine.DEB.2.22.394.2302151438040.2127160@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2302151438040.2127160@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c2c761-9070-430a-47a1-08db0ff6851d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4bNWYH5E//4qrkbXVno6VbKES36AKu1RtMaYzWhZvAKPF16EHNYHQSGCgz6LBq/0QyJ1Zq3gYKvEUCJg0Z1JqK2R2ApQxR4nm1TIg7wvw/2CKX9AamipgLtW9KeUk9a3emVUhNfLmeCn6DV5ZOzIk5v1dPm+QjHRK/sBeFKQqvRGtix+K3dFv+0rT+sEcl253yA/hytui3SmIOZgs+SBpcXNXLm6kOaWt+6HW0BpExq1phI2hKJ5614DQs3PiobcY2rGnB6xKiYZjavqZYRYv9sbolWTqSdYc71LOrE+r0gfP/QIbeXWOsHDVe8/QGlj6kJzq9vv8UYiiatQd8+5NTCozS5QFvJACZqSE/7xxnbkjjRkX269gObEOwMI5PPg4Wr/OQZ67SRzNm/KPBB6jFjJRPmIcaVUXvvIgshizQYeCTcaWz1MtpknlRIwSIxlpVfsliBT2o99KFj9x8ttHttKkeZcownZOSnu3qbfNTLFXhFt3abptSatMdvMPVfwnB6XhQWTI7SpGlG506K/V62bWLPhJ5AFV6K2rVk5BE+DtcdXHQMxIEijgfoVvIpZkBZBkLbomQ5GfyHxYlnknsYyPZXUlmvKNCoJq/jVLOGw2HxxcSk2JCPxSPVS45VBqpkyj7g7MSq97ewAlGgP89g/GPEdDNopY05k41rNSHSMMatJH0dqcgj0fggEpLKdXGbrVDGwhohAiayqoFwGnlrLkPRVJ7zKeh54as3336U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199018)(66899018)(31686004)(36756003)(31696002)(86362001)(66476007)(2906002)(4326008)(8676002)(6916009)(8936002)(41300700001)(66946007)(66556008)(5660300002)(7416002)(38100700002)(478600001)(6486002)(54906003)(316002)(6506007)(83380400001)(2616005)(6512007)(53546011)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWlDaXFQaU45bDlsRC8zV2dKV1MyVytoVDJFTnFZY2pMMzZqa0pxL0U4dTR5?=
 =?utf-8?B?a0pjVmNUN0czTXVPdkJhY2JpSDExQ21zQzFYd28ySmlRR09pUkxXbUxPWmYy?=
 =?utf-8?B?Y1NVblpwOW5Xd0hXSThXQWlML2s2VHRlcW1uNlZhaStHNm9JTy9SZ2lRaWNP?=
 =?utf-8?B?djkzd0M3UkFncEpvSCtxUXR4VU01RWd6OE5HNnFMdDdyZ05lV1lHWXk3MXZt?=
 =?utf-8?B?RDkremh1UVVJUjNTU3poMGRuSDd5WDZYeTg1Y2FTK3VSOUQ5WTFqUFNBUWxV?=
 =?utf-8?B?T2NDNWp0MVBOL1MvTVpHRDFLcmRRYy9rQU44dkhJSWl1c2xuZ3ZWWFNQK1FL?=
 =?utf-8?B?T0xnNjR5bS92bU03OWc1UHpDVFJ2WlNrQWs3aU9UWEdVblFYMkpSc1VjV3ZR?=
 =?utf-8?B?TStOS0xrTktqSThwRUVDOTI3Zy9BOEZvNXNTVnM4TXhMR2o0RW15aWpteHFa?=
 =?utf-8?B?NjhrdDFyT3p0UFcyckFqYnQ3aXdWKzZ5RzJsSU1obUtkL1U3MEl0ZGRuOEtT?=
 =?utf-8?B?SUR1REg0aUJMa3BQTU5FRUlMa1VlKzByQlJRcjNhSXE2QmxyM1c1SGF3MTZF?=
 =?utf-8?B?TnlGdnZIS0lDeW1yVUw5elZkZEZ2L3dlbjRzQlNKTW10ZlcvRkdvUm1DUlMv?=
 =?utf-8?B?Tjlob09JOUI2dC9ZckszVXhWbnUxQUZ6M0dNM2p5NVFzaU1seU9WUDExZVp2?=
 =?utf-8?B?ZHcwVmc5VGgraE9mQ0xXclVxbjFaMkRRYWRXRHNHM3pGMm96eVFXYUF6YllB?=
 =?utf-8?B?RlBkUy8zUDFqMThTdU9ndmc3SWZqeHhvZXZuRTFQMERCYU9uNDNHaVh1ejIw?=
 =?utf-8?B?UkQwRFpFb3JZY04xWDFpVno2Qk5rdHVYUVFVOEU0OWMwY1ozOXNwTW9uZVh4?=
 =?utf-8?B?UVpndzRaNFdTWXloZndpWTlWRHB6VzVmaGZtSDRMNWdIVVl5V0RYZkJYcERz?=
 =?utf-8?B?dXh3UTNnRGtOaDNCbldSVnFNZ0VnZThHcWh4bWFjWVpKQ09WaDRNQUl5K1Bl?=
 =?utf-8?B?OWswOUVnZzQ1QmUzZUt6dmpxRVByTDFXWitTdWZyK2hqSWpWYUFUWDR0bFlF?=
 =?utf-8?B?YTdQeDA5TU5LUDhNK2tiQXBwcWt0UTB2Y01BR05RV0JtUEEwTTMvemswNGJG?=
 =?utf-8?B?RytvWW1BS2xWckdveEdUQy9pUW1NM004a2xjelVRSFJ0ZEJBZC9FcGlzUkxK?=
 =?utf-8?B?VGk1M0NvSVNCaWU1VzBWK2o5N29VaGxpbUlGRDgwQk02MlpPY3kwRGkxNk90?=
 =?utf-8?B?cXcrNndIMVJGTXo4UjQ5VDh5RG10ZWZKaXpxRDlWdkM2a0NDVVJia3YyVHU5?=
 =?utf-8?B?U3JiTkxXRDIxRkZpVGR4YzFrSmFuMEJITXQ2RWh6T096WFJuaUJKVElGV2Fr?=
 =?utf-8?B?OUJmQ0djRFFiUUlnT1Y1WTRYTXAxOXR4cEJ2ZjRCa2VlNzVSNnNLbjNNN1dF?=
 =?utf-8?B?RGFPcjNxeFBGRDZXbG94bkg2TmErTmtKNXJaZElXT1A0OGJadFNyZ09NQ05W?=
 =?utf-8?B?OHZOcjdoWGdLTjZhdzFDd3F3cmJvZzFlc3RhUmcwTkNHbi8vR3BRRW1VNEhi?=
 =?utf-8?B?ZWJpZXI3R3pPTXJrN0tzNnUyZzFQd1BocnJJSytoYXhhZGZzTnZJdEcwRXd4?=
 =?utf-8?B?SXVoWDNwTlNVV2hPM3BaK25xNDJhcWc4cTBpZjJZWlg2MkJ4TmNvUVJtVzc4?=
 =?utf-8?B?dWJGMjVyUUJZZFRxdm5tM04rWnVUSXFxbDhBbWd4bGxSSFhLRFF2MzhYRkV2?=
 =?utf-8?B?US8yWHF3YUdLNUdyL2VCMzZ1dWlXSmp4NzUwTS9td1V0R0srakxDNEpwRU8z?=
 =?utf-8?B?U0doSWRUd2o4cWdEWE9xZWFVT2k2MmZQb0NPZ3QwZkxrOE5kT1FVYzFMcVBF?=
 =?utf-8?B?UjY4SE9CU28yMmFMMDBHRTdkbUZrSlJ6OURvb09UNHZXZ1RoSzFVVlE5ZDdV?=
 =?utf-8?B?RDRUTEt0Q1VTbjNVekhBcmo4L253NDVPbXVWZ3pIQ3hSYUwzdXJzdlROYWkx?=
 =?utf-8?B?aUFWT2FJZlFmWFF2ZjR4akVzRDE1b0xFNmNYTlVrQzdtb1lISWJLWkNQSlI0?=
 =?utf-8?B?OWw5SXdwaGp2TW04MFNUSUJHMGNsbHNibXlwREtlK1AxdldFdjAwaE50YjNs?=
 =?utf-8?Q?5WrsPXKs0MopjVhJSwdCHvLj2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c2c761-9070-430a-47a1-08db0ff6851d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 08:19:27.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9h92Mua3/pUnciKLwg7RwF+PrtF7vv/q9mv4GOjD8UUlMaibWXwoJVlla1IXjW7jvcem7EUE7/P7hT6xAlwr7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6865

On 16.02.2023 00:49, Stefano Stabellini wrote:
> On Wed, 15 Feb 2023, Julien Grall wrote:
>> On 14/02/2023 22:25, Stefano Stabellini wrote:
>>>> Patch 1's example has a "comment" field, which no entry makes use of.
>>>> Without that, how does it become clear _why_ a particular file is to
>>>> be excluded? The patch description here also doesn't provide any
>>>> justification ...
>>>
>>> It would be good to have a couple of pre-canned justifications as the
>>> reason for excluding one file could be different from the reason for
>>> excluding another file. Some of the reasons:
>>
>> I think the reasons should be ambiguous. This is ...
>>
>>> - imported from Linux
>>
>> ... the case here but...
>>
>> This reason is pretty clear to me but...
>>
>>> - too many false positives
>>
>> ... not here. What is too many?
>>
>>> That said, we don't necessarily need to know the exact reason for
>>> excluding one file to be able to start scanning xen with cppcheck
>>> automatically. If someone wants to remove a file from the exclude list
>>> in the future they just need to show that cppcheck does a good job at
>>> scanning the file and we can handle the number of violations.
>>
>> I disagree. A good reasoning from the start will be helpful to decide when we
>> can remove a file from the list. Furthermore, we need to set good example for
>> any new file we want to exclude.
>>
>> Furthermore, if we exclude some files, then it will be difficult for the
>> reviewers to know when they can be removed from the list. What if this is fine
>> with CPPCheck but not EClair (or any other)?
> 
> Yes, the reason would help. In previous incarnations of this work, there
> was a request for detailed information on external files, such as:
> - where this file is coming from
> - if coming from Linux, which version of Linux
> - maintenance status
> - coding style
> 
> But this is not what you are asking. You are only asking for a reason
> and "imported from Linux" would be good enough. Please correct me if I
> am wrong.

I guess you mean s/would/could/. Personally I find "imported from Linux"
as an entirely unacceptable justification: Why would the origin of a file
matter on whether it has violations? Dealing with the violations may be
more cumbersome (because preferably the adjustments would go to the
original files first). Yet not dealing with them - especially if there
are many - reduces the benefit of the work we do quite a bit, because it
may leave much more work for downstreams to do to actually be able to do
any certification. That may go to the extent of questioning why we would
bother dealing with a few dozen violations if hundreds remain but are
hidden.

Jan


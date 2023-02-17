Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85469A5F8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 08:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496881.767818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSuyB-00077j-HQ; Fri, 17 Feb 2023 07:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496881.767818; Fri, 17 Feb 2023 07:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSuyB-00075D-D5; Fri, 17 Feb 2023 07:15:47 +0000
Received: by outflank-mailman (input) for mailman id 496881;
 Fri, 17 Feb 2023 07:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSuy9-000757-9I
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 07:15:45 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe16::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2866646-ae92-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 08:15:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7356.eurprd04.prod.outlook.com (2603:10a6:102:8d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.14; Fri, 17 Feb
 2023 07:15:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 07:15:38 +0000
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
X-Inumbo-ID: e2866646-ae92-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNuGkbyhqsJNGFZJAhGTc9rqKPl/zpYTrP2j7CD+XhzcTok2p73B6K5oK6fm5YgB2ImZGSKhuOT4v932Ek2UgLIjsqP+LOE4ilRemZndvwPjo0WU/qVdIcShflDURFoxRoVU8nzAbCc70JMOUXflyqRpqrFWntum7oZ2kZ72coLEB1JhUmX8LgJdI9AvPepisvwwpwlKkpxbMKqJ1zdeBne+tULfbonIK78J3qsUWkjb7bf2iOC1yMp/ARW7J39lKCzUJgZTRS2kAJyWZavu1+QruJkhMhrYBQ9l7td0JwyqhTvdBQmV2jJ34+RTCZivjZrnx5CmzIL7hZhkQ4QmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qd0OgP0V0UZhanYfKU6Nl5IoQZcuoL71qjJ3ABuoLY=;
 b=nNGVtdhOFgTX+aIIpH5QO3/cLWPcMPkz9UMVIpNnoI/XvfbXKrldJ1gtag/U+RjbazdzaPngrndx38sDzXCFpzNpkQuglKodCM4hDzA2uyj1gn7HdFS5DBzV9wRwMvQg/iQin9lRV9ia7O6JYHcORqTNgjfNy4UMTB6lh+rziVt+8J1UNk7+d/2YOtZo1DvqDyruH/KmWCq3WF0EEzwyx3oPUBcbnKvKziprLvnjPcvF6W0HsXSmAmyXhax2jvsaING9dtLZmnqkELddZm8QuCJR8nM/3VxV7kJ7J8IptxYmnwr5GjbbCJzpxf92HLNH/u1KItTc67jaujV3MesCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qd0OgP0V0UZhanYfKU6Nl5IoQZcuoL71qjJ3ABuoLY=;
 b=mY4Lwp3CMk2qUoA2OUEbRQ9LpI+hBOHMIpDNjJmUy+yhhYVgBdY/IwLTGG8zpfDqQputQt9THoHJZnospW0F35bW+RJAjXCNgg6mvlohlfkGzU8meBnqFx+iGoOl1TSg1oCXJKaEs8KV6eKREZo+WYX0Eu1Jfx8ykZa7QYm/SCKty2/dJnG8nUATwBPebIGi/iQlO4L3i7LnWSwtKGAXtxoedE65gDpAzwgBsK0LREKC5EaMJ7wYy4tqFgCG0nr1pMTIUrfxJ/0vRdJmupIW8dZlxmUjKVol82jhls+8R0NCvv9qssfNb+1hOIpS/rsAXl6Hol9eUpIb7COmdLrqAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2de58bf-d0a3-245b-12ad-d04ab9c4ee8c@suse.com>
Date: Fri, 17 Feb 2023 08:15:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/2] xen/misra: add entries to exclude-list.json
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Michal Orzel
 <michal.orzel@amd.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20230214085635.3170962-1-luca.fancellu@arm.com>
 <20230214085635.3170962-3-luca.fancellu@arm.com>
 <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com>
 <alpine.DEB.2.22.394.2302141415520.2025117@ubuntu-linux-20-04-desktop>
 <cd1fc5e2-7af6-3945-2d64-8bf2f728f633@xen.org>
 <alpine.DEB.2.22.394.2302151438040.2127160@ubuntu-linux-20-04-desktop>
 <14a4bccd-f316-fca9-a04d-5bd639307e9b@suse.com>
 <340CAA3C-DC15-4826-9022-0348BB3CE6C9@arm.com>
 <alpine.DEB.2.22.394.2302161732490.2127160@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2302161732490.2127160@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 98145a6d-9a3c-4299-1218-08db10b6c583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h2tHgn2ucp36aU6tqeNuxt/GnZnzoRCghl/WDZFYSghM7ZcVrYc3VnswydxVV7mE1pAQDvJ+R5pMTtUJHtcW4Xcifh8oY6nJiDmYhKbZsvN065x4tXMGPqBzJkvW+lje6ithIy2Ulj5p5gZmcYonIWig+PX9GoKVKeB8ajXfOlRF24XdD7vEKx1vF5nSmnxR3pbxIGrRl1zWzzqwAegrIImTspJdXblUhPNd1bL+ey1lMAWERIoI5q2SOJWmzOFUZ2Lb1cxeweQoXe8VFngLX2+hUKUsCsJuIjmz1ikpb+rTJZ1NM11n6SAeS3tj0esxBN3IvpJOAPP4KZaVHouKZ21yRmzzszlAAfl5ItF4Z3J4R+Xz4wEs0i81EkME/FuutI5r7g6pzeFANfAbDIU26K2C9l5kNeHKKaKC0khN2vjmwXmDl43mS8p8crIPv2g2tZFLCad3xF2j9li46M1L8Z4ipyZG/9CIQImur3XU5956+CSY5yVpRxDAkUwO1z0dUGUEFsY2WyjzlGxwAPu54YAyjTS/G1L+hiyOBYcdzROa0ih519r6FiE0TK86b91qTtJ9LykHsMTrgKUgP1QdJZIRq1j8CboFGZLP1/2D5qV3QQjq+BF4ptX1WcNaB7N8bbA/9upx2n/nSmuAuj1z0GglVooroS1b3BA2ulrK0jF4XiPOJnXZEPDTfCwF6Ub3VbgFuhRs1V3dpN774pcZzFdUY4g2avxW0hSCKCh8bx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199018)(66899018)(36756003)(4326008)(8936002)(2906002)(66476007)(66946007)(8676002)(66556008)(6506007)(7416002)(5660300002)(86362001)(38100700002)(31696002)(478600001)(6486002)(54906003)(31686004)(316002)(110136005)(83380400001)(41300700001)(186003)(2616005)(26005)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEUvYmFGZDRTTFFIYitZMExobXRUU042SHJ2R3ZvRW5qeVI5Zk9FTWhRQTJv?=
 =?utf-8?B?V1BoZXYvcndxQlJualJnTENZMHpDeTBMWjErVm8rNThiZ3E3akJVSUpQanBh?=
 =?utf-8?B?YmpFZ0N0RS9VcUU2U01hY0NoRXNEbWVvbHZmazNvbDQzVkZlUkxtMTd6Q3Nn?=
 =?utf-8?B?Y042QWJNbVlLalN0YWovT0N6ZVI3OHd6SWl1MHRadTJqSVhsbWQ4Nk4wS1Rl?=
 =?utf-8?B?eHVYWkhjdFhQYkFadUdZc1E5WDJIS01KVWJYMGdtNXNsVUI5U1dUcTRISUZ2?=
 =?utf-8?B?Mkh4WjFkU24xZkFGN2Y3eVl3dFJFVWIwb2NsSHlRaXYxOHQ3VTB5YXZ3NzFV?=
 =?utf-8?B?Z3BBNnlEdmI4SEFvZlJZSnhvZnJJVk5aYVJBckJQZjlBejZVZEl6TnAveGZ2?=
 =?utf-8?B?NG1pWVpDRms3VEkyV1QzbkNzMjUydEF1akozQjJaSGRJRTB3eWR2WlpvcCt0?=
 =?utf-8?B?d1I5cDYvRStxQTZEbkR4UExmYUsyR3dZRlVxOFJQR2FWQm5WSDdlQitybS9E?=
 =?utf-8?B?NnE2TjdsRWJPeUVaZ1RUUW80bzdBYStSbUFEdDVacE1SMVYwRlFmNEg3a25v?=
 =?utf-8?B?bjlqc1N2WVJmSUdFYkRrN0pBRW9qMjdvbnJjMmhKQ0ZLOGVEcTRBaTJIVWVX?=
 =?utf-8?B?TnQ4VTRJQ1IrWUI3Y29jdjlESGQxUnJHM2ozSGZzVUU2VFFZUTQrK2FuRHV3?=
 =?utf-8?B?a1lTVjZTTGpodG8zZzY4dVhicVkxRktyWkhWR1Ztdi9iRXd4MDBGQmJUK3Zx?=
 =?utf-8?B?R3NVL0tXV0xrTWdwTzFjWFN5SmdZRGtSY0xXRTM5b25iVEplcFBnV2pCclZP?=
 =?utf-8?B?VzRVSlY1V3dYS2JaaFJyUm5ESGRvVlIraTNKcVJxYVB4bmdPWGcyOUt4Zmg1?=
 =?utf-8?B?T1F6OEd1TlpoVHFaRy82SWF2U3ZsYkdpd1UrWktDZmxOLzVQbkhMZnBmTUwv?=
 =?utf-8?B?c25ESWptSS9SRzlyNnZBcldNOWhzdy9weGt0T1ZJOEZnV1pJM2J5ZG13MkJv?=
 =?utf-8?B?ZE5uTXhkSUhpUm5ZeGFoK3lCK3k0S0dyZEtRU3hiQnlKNi9FUldpYkNTVFhj?=
 =?utf-8?B?MnVjd0ExUy81NWNjZC93bFBhMW15VzNhQkowRlBXbDc3ZDdNQlNkbnA3ZGVQ?=
 =?utf-8?B?NitHTTFyb3pXTUhBN3lHSnZaNVd1R3h1SG1WalFKc2xpdW80QjZaOW95eHdG?=
 =?utf-8?B?Tlg5M0swNzF3bXhCRlFkM1U5U2FaaDIrM3ZOajJTKzJ0dEVLSTVqZi9WQ2hv?=
 =?utf-8?B?Ky9iRGp0aHlqaE5IYXo4UUJkSlhNd01NRHVrSzczSUZqdHEzekZGZExjeW1l?=
 =?utf-8?B?bFhQZktnK1NKcjkxRGttcjFxci8rZlBSWXlLOTYwTlZIT3pmQ1RsZVN3eXhq?=
 =?utf-8?B?WVRsbm1Mc2pwcVo5SHg2VFdDOThlS2dVSU5JSU9kYWlPY3hTN1dLci9uTkdY?=
 =?utf-8?B?ZVJWbVQ0ZVRmdmtQa1l1YytRZDZQaUx2NWwwbFIrOFJHN0M4KzVrR2xLQnFo?=
 =?utf-8?B?OWZGZjVadkprNnVKRkVIRVFkZmtIVzV1S3YvQ0R0cEdMZHNqcjRZem1MbC9B?=
 =?utf-8?B?eitMNUlJWXBCM2UrTjJTc2dSWW5Tc1hyNXZpdU93MGNSVXFZVk0yTURLVHow?=
 =?utf-8?B?K0cwcnhiNmgxZU9UTXcyRVhwWE9KTWVDdEVlc0FZNFU1R2ZFV0ovenY0eDhI?=
 =?utf-8?B?ZVdSdDlkekhOM1RmS1JiZGlzeWs0Y050SVZiVDFZWnpaZk9UaFM5TEl2MFpH?=
 =?utf-8?B?TUlxUy9zSFdjTjlrR2JpREozRTdRYUN5NjFZbG1ZTm8rV1hFYks4bVZNSURx?=
 =?utf-8?B?aHJKNEpkSHMvK2xVUFc2TFp5WHpscThIS015UTdhUDB1WVlEaE81NE8ra2ls?=
 =?utf-8?B?S0ZMblBGdDgrR1ZwREhaMW9kMUZTNFNzV09tM3I2V1NuTit4N2ZVWE02Q2F5?=
 =?utf-8?B?UDNMK0w5L1RUblk2eFBMa3ZaRnc5UmRRTDlNMUl1UU5CQmk2d05EVkRXOXZH?=
 =?utf-8?B?L21WZmxOVnZRVXZsOFJnNXdOM09NR05TY2wzWjBkWnRydG9ld3c3UlZhZnVH?=
 =?utf-8?B?RE81NjZiK3g4NWR2TzBiWHoyOXJxREwyVXZ5MHU0N0xEVW9uQU1mclZ1ZGU0?=
 =?utf-8?Q?jTgeCTql+bmSUCm2oXRMQxeEb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98145a6d-9a3c-4299-1218-08db10b6c583
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 07:15:38.8569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZA9Busv95SoEd+lLzV4bKXCRVZys0WG256pO32cZZuUtNRJziubjFRJy6R7uCN7oxKYe2tTlIPtsES2CvwIsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7356

On 17.02.2023 02:44, Stefano Stabellini wrote:
> On Thu, 16 Feb 2023, Luca Fancellu wrote:
>>> On 16 Feb 2023, at 08:19, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 16.02.2023 00:49, Stefano Stabellini wrote:
>>>> On Wed, 15 Feb 2023, Julien Grall wrote:
>>>>> On 14/02/2023 22:25, Stefano Stabellini wrote:
>>>>>>> Patch 1's example has a "comment" field, which no entry makes use of.
>>>>>>> Without that, how does it become clear _why_ a particular file is to
>>>>>>> be excluded? The patch description here also doesn't provide any
>>>>>>> justification ...
>>>>>>
>>>>>> It would be good to have a couple of pre-canned justifications as the
>>>>>> reason for excluding one file could be different from the reason for
>>>>>> excluding another file. Some of the reasons:
>>>>>
>>>>> I think the reasons should be ambiguous. This is ...
>>>>>
>>>>>> - imported from Linux
>>>>>
>>>>> ... the case here but...
>>>>>
>>>>> This reason is pretty clear to me but...
>>>>>
>>>>>> - too many false positives
>>>>>
>>>>> ... not here. What is too many?
>>>>>
>>>>>> That said, we don't necessarily need to know the exact reason for
>>>>>> excluding one file to be able to start scanning xen with cppcheck
>>>>>> automatically. If someone wants to remove a file from the exclude list
>>>>>> in the future they just need to show that cppcheck does a good job at
>>>>>> scanning the file and we can handle the number of violations.
>>>>>
>>>>> I disagree. A good reasoning from the start will be helpful to decide when we
>>>>> can remove a file from the list. Furthermore, we need to set good example for
>>>>> any new file we want to exclude.
>>>>>
>>>>> Furthermore, if we exclude some files, then it will be difficult for the
>>>>> reviewers to know when they can be removed from the list. What if this is fine
>>>>> with CPPCheck but not EClair (or any other)?
>>>>
>>>> Yes, the reason would help. In previous incarnations of this work, there
>>>> was a request for detailed information on external files, such as:
>>>> - where this file is coming from
>>>> - if coming from Linux, which version of Linux
>>>> - maintenance status
>>>> - coding style
>>>>
>>>> But this is not what you are asking. You are only asking for a reason
>>>> and "imported from Linux" would be good enough. Please correct me if I
>>>> am wrong.
>>>
>>> I guess you mean s/would/could/. Personally I find "imported from Linux"
>>> as an entirely unacceptable justification: Why would the origin of a file
>>> matter on whether it has violations? Dealing with the violations may be
>>> more cumbersome (because preferably the adjustments would go to the
>>> original files first). Yet not dealing with them - especially if there
>>> are many - reduces the benefit of the work we do quite a bit, because it
>>> may leave much more work for downstreams to do to actually be able to do
>>> any certification. That may go to the extent of questioning why we would
>>> bother dealing with a few dozen violations if hundreds remain but are
>>> hidden.
> 
> Yes, we need to figure out a way to deal with these files. However, at
> the moment they are getting in the way of easier low hanging fruits.
> 
> One "easy" low hanging fruit is to use cppcheck to scan new patches for
> new MISRA violations. That would give immediate benefits to the
> community. It is not easy to "diff" results with cppcheck and in any
> case it would help a lot if we had a cleaner baseline because it would
> make it far easier to read the results and make sense of them.
> 
> The goal of this exclusion list is to give us that: a cleaner baseline
> so that we can make progress faster on low hanging fruits. This list is
> not meant to be fixed and stay unchanged for a long time. In fact, it
> could even live under automation/ as part of the gitlab-ci test that
> triggers cppcheck, if we prefer.

Okay, that sounds reasonable to me as an intermediate goal. But then
description of the change and justifications should also state so imo
(for the latter e.g. "from Linux, ignore for now").

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4566BEBD0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 15:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511140.790028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBTJ-0003PT-Ki; Fri, 17 Mar 2023 14:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511140.790028; Fri, 17 Mar 2023 14:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBTJ-0003N2-Hs; Fri, 17 Mar 2023 14:54:21 +0000
Received: by outflank-mailman (input) for mailman id 511140;
 Fri, 17 Mar 2023 14:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pdBTH-0003Mu-RJ
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 14:54:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 979d665f-c4d3-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 15:54:18 +0100 (CET)
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com (2603:10a6:10:10a::28)
 by PAXPR04MB8734.eurprd04.prod.outlook.com (2603:10a6:102:21e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 14:54:15 +0000
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498]) by DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 14:54:14 +0000
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
X-Inumbo-ID: 979d665f-c4d3-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ+GZyd9wjxJLL7UB14E6091bTFeLwEBB8EYlrKvpBmTh8neEKlYJc+Gl5w4jkTnOMBqDFzCdBOWSBfeTGbXx2M2LkBswPGQ3EIjtxUpVrbeOkOZpSt1rMs+tbf5CyC9PQlfQkrUtpJc4qtXCHyPx7qPwFyqGvdKZ9qZ3ZBItPR+ZXCsQjYv79SUghpt6de3eo8U46JL5rpiIucKInNG0Q7+6tCK3aiYldhwOT5oTUErktyzNkhNPZ+nzgHhSRwH8QRvCjbjPVqFs4XEjgguoc0lIL9/S6xiXh7ysdgjBCdpDWxXBwABPbxvlMChgb7Wv9+GvWVemgJ3n1ynVP07pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS1dvBeOOcd7lzRgdcoYi/U+zZ5MXRNupzZbv7bS+h4=;
 b=I3lJRbHlSs61VfuNs29Zx1gVpxBKKtzTQBeB7kj6xNvRDkxKONiYSocgv87iIbDIQKXFiVPKXTvx7UWCSyNBIDrPdfmi9CSLsKl94MVvBQ8YCgPlq/3h7ZeP2NlJReF3wE8D/0NV1Ao1xEOYbBfsS5iEYg+9F3EMw1IDZqHYYV/BPfDIcr3Qi1Z8Fo585W+CCtNV9ghDvTYPgf0UM7otWb5ZrkhYRhI9jZiN8t4iIt//ZnPIE7aEjogLqDOBwPy8as+PKJ6LTubLK4Vjv5NZDxR1foH07rUL4oG8pPMLB/QOrdu4XriVdMF/k8SNwoN6/hd3m/YmFycqLBZ6zzEgVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FS1dvBeOOcd7lzRgdcoYi/U+zZ5MXRNupzZbv7bS+h4=;
 b=VD2oyNWYVRu6v8xEnvettQOUYRlBGhKfMDH+9hAIMUdJCN/75THBWqpOxT8x1mDqBlMs7Xom/lryPMP1kZZlJbXDytXR4qGkjSC/Q4PRyemaKX23mXGHAMei7ZswI3X36pG+wVwZczPBfSPA0ih7tgKkgIxMC2P50TWdCUxVNbcyxLyXsjjsCq77C72IW9If+033+JrylwVwDky3FM7n0tsPg/B6MKAjx8nTM8QcxIyBh38Y8pwhPUndI0+pzkyMjiqJgaKkq8XTjmNXW+U6Jk57PHUiSq+K/mU0bXS7Pf3/MmVgwdutVQrzRSxT07vIIiYDJ+fENECcrhStO8O1Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e4a7b1f-cad2-e2bb-bc91-00a208bcfe94@suse.com>
Date: Fri, 17 Mar 2023 15:54:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] Update README to state Python3 requirement
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
 <20230316171634.320626-4-marmarek@invisiblethingslab.com>
 <afe67927-0f62-511b-012f-2f2deedbf4e6@suse.com>
 <CA+zSX=bHyn-v77shA9xGaacjXcQ0U0tTg2V0U2t0FVML7WFJqw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=bHyn-v77shA9xGaacjXcQ0U0tTg2V0U2t0FVML7WFJqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To DB8PR04MB6554.eurprd04.prod.outlook.com
 (2603:10a6:10:10a::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6554:EE_|PAXPR04MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 6548bd30-4e2d-4e1c-d73f-08db26f779c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Y+UgGzy0Zx13d+SbgTVtap5GHoQdU9LmdNWwyOy1ZVGbkKdVRXvEOOg99vTuGOL8tfSGlgaGmW1Izo2j7xl6HJdE7WSJH1sbVUU72KItnGy1x9leX0hLrEbMxeUPTOsvln8bhTzaeAsb5YtSAnHOygRHowgQnaAvSTPqhchIlNx3oo9/om1Dh3qvLhxUQIzl6Prw9LUgV2iY0ydpDwJTA3kkF77FQehwvE7GNJjoPIQTlVovHQDARam9qC5zjKfpPHE14OxC2Ztj8hLwWRtxkNPv0ytNhXGofbkmeinq/uvSbByacldsQfXKsaNwdasM7tmeHozFk53//D1EpI6jNdlxIbIWKcEvD9eYq9EmnKONxQ6yBswcEel327awe56FlaLvkjrCh6fC8W71L/gru0zc/ABuOR+bXhOh/+k3mDzQTgejc/RIaRn42A1QpMlgRo4Jmzfqja486GoBfh6nrgUgmvgTJetrnU56YqCzvbAqH6MS9a7vNQovGnnc8tvRTR40w3MKbKyHufUzYkGxZ8RHrXho7d9v9otFYjmGEYTmW8g0xoA2rAVTiXTvjwsUUBijfmZJNH5rDC1DMfQGmS/ALYxdvmv+UI2a2B6EBZr3CffGJyZv1uuhG0ZJp2NcFN4pnvcupL9LRIAYQR4Dpr59ZBczPjVPOZ2+mvIXkJuvky7SbhioWeCr5ci80AgpgqpzJupvCc6CHbZr9VqNmXGMSJpK5cLmiK4LdPs6kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6554.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199018)(26005)(53546011)(6512007)(6506007)(2616005)(83380400001)(86362001)(186003)(31686004)(6486002)(54906003)(36756003)(4326008)(38100700002)(316002)(478600001)(2906002)(66574015)(66946007)(66476007)(66556008)(31696002)(8676002)(6916009)(5660300002)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC9ndDFKNU9XQ2pRa3BrbE1zT3M2YWN4NzJDRTFua08xNllQSEJweGxJQTRB?=
 =?utf-8?B?Wk0zZTAwZWdERnVFQVlJSUNxQkVqZW5XeWRhUGlxMUtGRnQ5S09LNGVqM05F?=
 =?utf-8?B?dlhuRTJaaG9SNFVhNStzYjhvb1lpeGtkSlZ3bnMvT2xSeW9GdUNYVHJqVE0x?=
 =?utf-8?B?SFloWXkvblUveHh3Z3NCbUh6aGlYdVRFclN6c3dUM0JnSkpISzRYWEFLeVNq?=
 =?utf-8?B?Zk1uVU5uemlKTndobEpXd05ab2UyZjhTa0VsNGpLYW5vaFBTcUZoNEdNZWp1?=
 =?utf-8?B?WUZaMTVacEF2dnIrMm8xUWlYcnhqcTZpb0VQVG5NcTUrVUZYRTFYYng3cCtt?=
 =?utf-8?B?eXljcnBmbVVGU2JOYUJRaUtyWkljeTZBZ2RFYWhzOC9oMEdzWTdzU2ppbHZV?=
 =?utf-8?B?SDZNcEltb3lSQ1FudWRua2FPRDFvdXNqTFZuVUlDeWFZeUJ2NmFyeFB5MFpt?=
 =?utf-8?B?a1M5L2hwYjNnOUpaeGxEcFlxdys0QkZtY0hGMnI1UWFYSitaOEcyYTY3UC9V?=
 =?utf-8?B?dms4K0Y0L21aQlNUK1RzY2gxWHNIOFFySU1tbXpCdW9mR2RZa2U3SGFKaUFB?=
 =?utf-8?B?YzJNMFBGT3Fvd2JTZDU0Z0JqSjBHNEVCa25IcUtzT3JCQ0FZYW9BRXQ5UEF6?=
 =?utf-8?B?d0oyeUVHVHN1VDUzVVkvK3pmZnNFTmMweTBPMjJzcHBVSTJqdk9YODk5dmZT?=
 =?utf-8?B?TEdNTTE3S1JlTWdKRGhNOHYzMjNqenFIWEt5K2J1dDdycFRXWWlLK3RCWWJt?=
 =?utf-8?B?Tyt0enFhSzM1YndWb1BPTmdNOWF1dkVJanNPNjVhRGFBWThlSTVZc0laY3lB?=
 =?utf-8?B?Znl1NFJlQmxDSkpRNmN1Mm8zbFlCdmFxSGYvV1dUSkh2czB5OVp5dUtZLzdV?=
 =?utf-8?B?UVBxcVhzaUhMVmdUbmhnQTFnMmFpU3dwVkZWbG9Ub1dwU2hFVDRXZ2o2RUdZ?=
 =?utf-8?B?dGJHK1ZjbEVLcTdVYWxQK0hFWFYxSG5LeFNDVlZ2ODBLNDBTTG9wdHNoV2Rx?=
 =?utf-8?B?YXBQU0QwWHdkTHY1b1E4T3diVkQ3T0Y0R2JJd25oRnpvQks1emxvN3hMb0pP?=
 =?utf-8?B?azg3Uk42TnRCWmNVUVRLYThRNUJKS0dhZThGbW53TVJkcnFGSUdCMDlyL0ZK?=
 =?utf-8?B?VDRYZkM5aDR0TzA4bVlmMzViWW9YOVNCK3NwVEJWNkxPWWxhTXpHRDhKLy9l?=
 =?utf-8?B?MmJvMzFYRnJPZitpd0Z4OUtHbGZUM3hRYkovMXJEdXNhajFXZiszblZxWWR3?=
 =?utf-8?B?dndjeXcyZnRac1lkK2IyREdZcWtQVUlKUW5tNWp4R21BMGdHd2h2V1pVSlQv?=
 =?utf-8?B?c3VhNDU3OUJXWDZ2ZU41blZWcVU5ejUyU2p6TTQ2M3JWcmx1ZUhyckRxSkMx?=
 =?utf-8?B?NGRxa2trQk9YcTQ5Vk92MkxERVlYbjlYdEdqUjZTdzNLT3JWRzdpRFFSSEtC?=
 =?utf-8?B?SCtjTzVzN2s4NjF6bDM3Y0RIaXZzdFZ2dStzMXlFTVVRQnZKd3Zqc2Z4YlZv?=
 =?utf-8?B?NjRnbExTZ0dDUmVjNTZOYTREeWhHY1hJcEswN1ZKN242dnMyUG81SzlJQ2lz?=
 =?utf-8?B?M3lOeWkwMnllUWVyd1BUSHFTZ2s1bTFXd0s4Skt6MlhPNHRRMFdkczdMcFhy?=
 =?utf-8?B?Ny9TMXNGdHZzc0lZVHVUUUY0bnV4cmJjdGlXbjlDRFdIMjlsMmt5RnNvYi9J?=
 =?utf-8?B?SXphVzM2NUErVVB5eXlhSkxZb243Yk9IT1E0T0RZUnV4UGh1dUF6KzRpMVdt?=
 =?utf-8?B?MkVtdmUzdkh1c2tOa3JuSHVBZDZhNkhBU01WUjJCSzN4eTl4andmZmVNTTda?=
 =?utf-8?B?MEdUVmFoYTZMN1YvOC9PZlBYaXpuV2Zld2VIY2phOUEwZzlzWGxHZnJlVW9F?=
 =?utf-8?B?WjYwcWk0c1cwWlBzSk83WFhHLzB1UVh3cU5HeE9IeDRhZzFpbWRVRFVEZFE3?=
 =?utf-8?B?V0tmazc0cWM4YVc1R1VYRWdMZXllNzdITzBYOVNpcUJJN2lBY0ZJOFl2NGFh?=
 =?utf-8?B?RFo4Y3lUSUdoWkNxc0E3TE1UNnpUOXNVNDBZNk5PTkxHNVNWOW5EMGxkZUph?=
 =?utf-8?B?cGh4RVpxdVYxeU01VERrQ08yTWJ5dUpucUNyTWQ0Q3R3SUFjUmpZS3lETFNq?=
 =?utf-8?Q?fQSZbtn+twmU2OmDRdIatXGp6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6548bd30-4e2d-4e1c-d73f-08db26f779c7
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6554.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 14:54:14.6693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWupDlkNUPW0gCCy5hqT80XLes+zceiH8Yt+XDUBJ7fyDVWAUDHZ/M+tM/6+gRDuP8n7g+okPlgHnorzxYHjzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8734

On 17.03.2023 13:37, George Dunlap wrote:
> On Fri, Mar 17, 2023 at 8:46 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 16.03.2023 18:16, Marek Marczykowski-Górecki wrote:
>>> Python2 is not supported anymore.
>>
>> There are two things here which concern me: For one, how come this is
>> at the end of a series? You want to keep in mind that any series may
>> be committed piecemeal (unless an indication to the contrary is in
>> the cover letter, but there's none here in the first place).
>>
>> The other aspect is that there's no indication here of it being
>> consensus that we raise the baseline requirement for Python, and for
>> Python alone. A decision towards the wider topic of raising baseline
>> requirements is, as you may recall from the meeting in Cambridge,
>> still pending.
>>
> 
> To me, the idea behind that discussion was that if we agree on a policy --
> or at least general principles -- then we can avoid having to have
> discussions on a case-by-case basis.  The fact that the discussion is still
> open isn't a reason not to deprecate features; it just means that we still
> need to discuss each one on its merits.
> 
> Given that Python 2 was announced unsupported years ago now, it seems
> obvious to me that we should stop trying to support it.
> 
> Are you arguing that we *should* continue to support Python2?  Do you think
> anyone will?

I think we really need basics of a policy first. Otherwise what can or
cannot be proposed to no longer be supported is just too arbitrary. Here
as well as elsewhere my fear is that thing would stop building on rather
old distros, where so far things have been building fine. (For Py3 in
particular that's no _that_ much of a concern, because quite some time
ago qemu already started requiring it. But it would still be a change in
how I would need to invoke builds on such old systems that I try Xen out
on every once in a while, because I'd then need to override the Python
to use not just for qemu, but globally.)

Jan


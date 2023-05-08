Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A86FA90D
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 12:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531370.826978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvyOg-0004z5-MD; Mon, 08 May 2023 10:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531370.826978; Mon, 08 May 2023 10:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvyOg-0004wB-J8; Mon, 08 May 2023 10:47:14 +0000
Received: by outflank-mailman (input) for mailman id 531370;
 Mon, 08 May 2023 10:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvyOf-0004w5-U2
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 10:47:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aff92e3e-ed8d-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 12:47:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 10:47:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 10:47:08 +0000
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
X-Inumbo-ID: aff92e3e-ed8d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLIr+16dX+1jZG6XvZ6yCRWHYMvDnuDI9QrOyhWtgBN0G2thX8qdXVs8UHipgXAOzD01vhtn0lyOg0922CmobgnFKFj6/gkn0EIOA2M+2VoJnVpQ4IeW7lus7ewwfBczEC2+PyB4zPNLgInA3ilzAgK5TNEEJGbVYI2QJBTwzazJrLeqsDhLJmAg6kzFO2gzn7KkN6g+KqpcHQ1mqVG/FSgOXo1WXYOArZg6W1kw6gf49eob2Rf1chxkitYnFKbW3vD6Ph+r+NZpU3Z42b7x5CGb7qZ/YxQfX9UJFoVVumOqIzFL4i5PQoR0ghsTyfyJqYtKXyC6ZjZTkjarzuLExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Kbj56+TveSb8xyuNr5L5tBwkr4DcPGmlHwHBe74nP4=;
 b=cnOIc0qBpjpZIFPj6f662s+MUfLUHzpcK7jFVdQReAUfn5VSkP7vQe1TC2xRPbo4gUTNMhivfYMKDjsDvsybD2jTilRlY+ITdRFViIq9mzsIV4OROgML4IujaRaLC55VFv4Ot1FgX3VMyEf8Wmirk9ZsILFKE5Km8Q5KJEaVmZvhgaI5YoJpZQ/4Pr09QrXWolTtz5zoM/aoc0BNpaLiU27HzSLpRKALTrrsR9EvZsr1N4XZcG7I3LMB194zDltJnsBcSTb+GUoVJXNV3KMGnnCy/i6osyOAYCjeZd38GPiPoLO4089aFvZazA66uRjW2cRB+gMIpoMP0U8Kap0YRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Kbj56+TveSb8xyuNr5L5tBwkr4DcPGmlHwHBe74nP4=;
 b=t6C5y6x9uCega+2hV4KmSkVpCrs/QF/lMGPnd1Ch/9eOMreLU9K5fyAcMIKrkWSY+ErJ2hx5yNdz+DIa2afrHC7PJbofAtzLBOG3SWTX4yuWklEgmoHEF5mSuJrLCIxOo025pxGHzU7E3eNggjqrU1cKv3LSHu+w77cepE0d2i/nPc982AjxFZRV2MYOlgnhWpJ9zUn8raiAGyxRSeqgF9ykXbYyFzlvzNmSwNTIhOwkabBbmLdtNVrhRkAiWOjbNv2qbc5P74tPej27DoSy6IAK0D4g1/d4kziOTlvZ6c9RowGQmca/SSvD6EltdgfQhZQYeQJ+OZNdaWqCiEK/WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cf71407-6209-296a-489a-9732b1928246@suse.com>
Date: Mon, 8 May 2023 12:46:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to
 userspace
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-8-jandryuk@gmail.com>
 <7db38688-1233-bc16-03f3-7afdc3394054@suse.com>
In-Reply-To: <7db38688-1233-bc16-03f3-7afdc3394054@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0135.eurprd07.prod.outlook.com
 (2603:10a6:207:8::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9d2bfc-b34b-4ad5-8d05-08db4fb1924a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F1iUrSBeA6vGRW32HBZvCze9jZbl9KXLddW9oVmtTlB2ozTGEJnqDHaOzrJ+OJu6eUZuh4Fm2oVeEUJnyp78KmkK9gK19JvCzaDSl8cWDny7WRXYsGT7snP3ZHr0so5sbzdBch4nAvgIzz71S5N6rCWjhEZpXUmW2oH/7QxLad79mI0dI0luLEA2ea5pXoXWddvJjeom9QUWY+9/78+LxYjVeHpIuF3oQB9AWo55F71Vdhba0/zi7GBc9FSkH3fwP4SYQ9xfXu8kE5o45XJTBxu9RgvPq1/o1J90mhi1k/2YFKOzlhtpsUXzuM8cFey6XbJIU4WJfmCg/0U5WeWDj8r6rL67YupUWQpKnVUZz+vmGWaLcAtCRR7Ep6W0PlW3FxqLj4bBi5/xqvKhkHGwph0Lea/ssZn1DpySnnohRfN633+g16dGhhxnSH2r1Khfo3cxBRYL7fpog2d5xn/GE5BsQmCBH3j33vY4n00izePnylfaelRDMa6k6/4RUQyLrjjsq9041L4nS066i5UzPLvw/41JWv/n2Fa7nrmavwDSYuaI/l2dI7Terv28FqgpLclFR6seaxDxiIMifzZJsDdABDS3G91f5EK2XcUDaMs9jQoxsy4t7etzvPFVylCPJpe5xi9YW1mg6NwzioKUTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(83380400001)(6486002)(478600001)(6666004)(54906003)(2616005)(6512007)(6506007)(26005)(186003)(53546011)(2906002)(38100700002)(36756003)(6916009)(66946007)(66476007)(4326008)(66556008)(41300700001)(8936002)(8676002)(31696002)(86362001)(5660300002)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTRMYjd6Z3llcTR2ZXRqRlJWL1FWMThOWm1PRm5vejJ3ZFdlRGthYzJmcTZO?=
 =?utf-8?B?Ty9zRGRWaytXN3VPNkVHalhLWjlobUhyMFY0bFhha2N5cTNZa2hYVTNVNDJU?=
 =?utf-8?B?NHdZYURCZHBncFhiamtudUhTREFpdGU2TFNZeStvSGhpS2NnSU82Sk9ybXgr?=
 =?utf-8?B?OEdsdEV2Nk9LcTluaG8xTGlBSkFqQ1V0OUZpYkZVbVBtcmkrMXVoRXhFQTlx?=
 =?utf-8?B?TkU2Z2RrdTVmUk5RUWRRUVI5OENQWXIzajlzUW9va211WjYwdUFvNEJoT0t0?=
 =?utf-8?B?MlFRUjRhUHBJakRnV1V1WWRValp5SHVjbEpoRVR6bFkrZTcxa3ZNRWZvb3Nt?=
 =?utf-8?B?MnRhMGJFMW1KR3ppa0J2QW9VUkl0OWNSTFpNSnJoWVpaOTdNWmpRUU1OWmpT?=
 =?utf-8?B?MWhycnFERWd2V0VuaVFCaGZpWm1PVVV5U00xVnBLU1NYWG42VG82VnFRLzZT?=
 =?utf-8?B?SkxNT1V3bThxclU0WnZ4M09SLzdKenFDcUZEQWJ2RllYcFB6VDJKblJ1Vy9p?=
 =?utf-8?B?SUV3ejdRVFNNUXQvV01FK3lBYjNiQzR2bTNxQzlkd1VtVXViRHZzQURaZDNL?=
 =?utf-8?B?S1ZNT3BlanVkTnpLUHJNR0JHdWhHRzJZZHJ0em16Y1hGdmpYc3lpUFIwMnpD?=
 =?utf-8?B?ODZTZHBBWG9QVVZvSENoN29Xdjk3cExXRnIrU1pmWWRVTTJSQndoWkMwR3FU?=
 =?utf-8?B?SG1Hb244cVJKOEMyeS9iYWw5Q3RwSnBaR3Q0bmlsUXRwS0ZJT3k0dmExam41?=
 =?utf-8?B?dVJXVXE4K0UzK2JXZUhSY0J6ejJ6TlhtbWZXcXlpbmZEV3puOWtMNXJ2bDJ5?=
 =?utf-8?B?bUp3TUpsV0orS1JrU3FvTllzSXVmb2Fld1hUT2hCU0hjRzFUeml4UEttR2VG?=
 =?utf-8?B?aDVDVENid2wzWlR0MVRrUjF4eTd3dHdhenFTWnlySSs5QXFGU001SjB4UkFN?=
 =?utf-8?B?M2ZEc0xVQ2Z0REdZdGRJc01DR2M1WGNoU3NoNGhha2x6eG42c2lDYlppSnhw?=
 =?utf-8?B?NWI3MXdMQ0dBZUJGSThXZ2ljdWZySlZKbzVIR1JCOXIzZFp0YXJqMksva3hD?=
 =?utf-8?B?UWd5bVorL2M5U3E3VjBvNDdDQWVYdTRHRGdEdkRIYVRBcGZaZXU3VWJLajRq?=
 =?utf-8?B?WGEzUG5lQ3BKK0xsUlRSa3N5V1JqSUh3ajR0TGREQWpRTHVmcG9Ea3JZZm5Q?=
 =?utf-8?B?TlVTOS80UWluVWpvVndNNVJqcWprY1F0WEF2a3B3bkNZSXQ4MDkyRjhlK2dE?=
 =?utf-8?B?VHZyRDBvK1AwZ2I2bmZvWktlUzlCOHcwS09RditnZzE5SXhBbnhDSjBLNlFM?=
 =?utf-8?B?T1pNOGtlZWFEYU1PTUNHeGs0OWlvQkFuZVZaQTRLeGJJN0RtU3BLd01McXpM?=
 =?utf-8?B?ektCdk9xRDN2Y2x0RWZQUXVPdFFNZllPUC9VbWY2clVsWllpSnlod0o1aWxD?=
 =?utf-8?B?cjRFUWVXSkp6K0RJUVB2UTBJYTV4N0IwWk91Mnd6RllLZ0puTmpJVWJmcFNZ?=
 =?utf-8?B?cWdmK0RZUC9mRUUxOHpoT2MyL0h1WGFWSzRxeFBKZmt5bWlzWXN4K2Nucm9u?=
 =?utf-8?B?NzBPOTVRNzAwWGtSNHFGU0UxR0Q5ZERseVRGdHlmaDJKdno1bG1uKzNWeWZu?=
 =?utf-8?B?TXFsSWJEN1lHYzJ4T0dteTc2THBsa2Y3bTVJQ3dBaFhvNnBSZGV2UU1qT3hs?=
 =?utf-8?B?ZkNuN0txWjJhSkZ3cDNzem5VZzVQdWhzWk8zTWR6T3A1L1JzN2dOMStDandL?=
 =?utf-8?B?YlhFUC8rOW43MjY5dWNkQkNUam1mSzlsMkNvYTNPOXRGNkFWUEgrT2FVdUk5?=
 =?utf-8?B?VjMvdHBYYWF2aHY1YkJGVi9pTEFsdU1jYWRRU3AyRUJOT2ZuMUJHOHdqQWkz?=
 =?utf-8?B?Rzd1TStBVis5VnBDK0tEYi9Tc2pDTjRrNW1QMzFkRENUcU5Ub0FaeDBqSWFJ?=
 =?utf-8?B?aWVLQ3hUSjNNTjVrL004Z1FUaFBkd2xuekdCZW03Q0VPbHUrMTNpVTJUWlk2?=
 =?utf-8?B?VVo2SkNDRW5OUGhvSlNMa2lFRnVtN0RlbDBhRDJSb3Q4L01lRlZaR0Q0b1lV?=
 =?utf-8?B?UzZtS0lTZ3hlYWZyajkrb20xRzFyTUlaZ1FWSFdHVHhwUU1VQVUwcDhyS1hJ?=
 =?utf-8?Q?AhASMWBdUUsvWNaC7QVN11CAb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9d2bfc-b34b-4ad5-8d05-08db4fb1924a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 10:47:08.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJ1m/iz1Ue1+VGlu/huyDtlF7ZvzQTS6l6q1mJrivHoTqYysK8O3cEuqtVlpsOMYiZ7YdrCQj/Z6kYlnHBbMNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688

On 08.05.2023 12:25, Jan Beulich wrote:
> On 01.05.2023 21:30, Jason Andryuk wrote:
>> Extend xen_get_cpufreq_para to return hwp parameters.  These match the
>> hardware rather closely.
>>
>> We need the features bitmask to indicated fields supported by the actual
>> hardware.
>>
>> The use of uint8_t parameters matches the hardware size.  uint32_t
>> entries grows the sysctl_t past the build assertion in setup.c.  The
>> uint8_t ranges are supported across multiple generations, so hopefully
>> they won't change.
> 
> Still it feels a little odd for values to be this narrow. Aiui the
> scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
> used by HWP. So you could widen the union in struct
> xen_get_cpufreq_para (in a binary but not necessarily source compatible
> manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddly
> placed scaling_cur_freq could be included as well ...

Having seen patch 9 now as well, I wonder whether here (or in a separate
patch) you don't want to limit providing inapplicable data (for example
not filling *scaling_available_governors would even avoid an allocation,
thus removing a possible reason for failure), while there (or again in a
separate patch) you'd also limit what the tool reports (inapplicable
output causes confusion / questions at best).

Jan


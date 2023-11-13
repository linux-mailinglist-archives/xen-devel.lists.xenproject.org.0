Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0D87E9AD1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 12:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631521.984903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Usj-0001dr-NZ; Mon, 13 Nov 2023 11:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631521.984903; Mon, 13 Nov 2023 11:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Usj-0001aW-Ka; Mon, 13 Nov 2023 11:13:29 +0000
Received: by outflank-mailman (input) for mailman id 631521;
 Mon, 13 Nov 2023 11:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2Usi-0001aQ-2H
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 11:13:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aad8ff60-8215-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 12:13:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8888.eurprd04.prod.outlook.com (2603:10a6:10:2e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 11:13:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 11:13:25 +0000
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
X-Inumbo-ID: aad8ff60-8215-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3mrUQTdDgzDjXx5CefNIxswnrSXBMF/ukbZJqHOUPl2Gc/+qcSYil8Ojgi9eDitmptdXjhUEU2K5K4MnsCHhJsJZO6HaKIvWJtzhDgfQIT2sDIUpiTGaPBhtUqLitdEQqZvIqI2iEZZIqqU4h5FGb7rW5ENAYir/fAox41WndFUiif7vj2moTCEsTzHmx5frEw3bW8hUTp5lZObqmyCiFoZyp/LJ8hx9eJC/dzD2jbBmcTuQLSx7D7MaBZBX+RNgIh7UVcqulS+Kz3OPAq1h4smSOwRtwNrWcEuJKIKsvn6yx0GKcQQVZmKqDTiIVyLtJ76iOqUd8NjUPzoCFZjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NIxvI68OBI+BinQfxJUw3l8uCq83sfsVdxIWNixNg4=;
 b=A8e3vBdwoFwxVI50P8s/13Nh8QQX0x1x5QTT0czQHTFSw2/X42GLpPUsBlrqRX+Z002bqnuz8aSAnzOV394pXOajtcF3TRNp3Ak6LQgMqdq84vPKfJJ7LV877hIo+YcJcSUEDWt8Nn9mtDcNH8VuRZxQe2KwK4Hhl08xlFtpOLpBV3qHLyvgnxdlNHfL+WaHtCXjIeNuVfvtjdHoQv0mknfeB/Oihn2o4RnQigGLB7gSZ8dMmIkGJ+S19jx3p+vkSj8KyvE2dFngAzGLZRSPz7P6ltId4gyydDg5apqTUEkgeAfik3xYXl/yPxL5TPGMj3sVwluTi2BC+UDj0lPJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NIxvI68OBI+BinQfxJUw3l8uCq83sfsVdxIWNixNg4=;
 b=nmwF1FFUk3L5M391IwocklhnoiX48iffx/hfzieZ12o/wwfz1DIrMlSQiVt/KsvQqGVqDyp+f5HnPpiL1sfsWG9lArT3Ckqxd2P/WOCqbbmCuESuRMeKL64lLYoZH7GoA22bFWsA760BEg5wRrT/RcJP2iRDKKqXwJ3IrMkpJJCYxgYhi/iFqILIv4jB4ro5bu/sducs40OPUg/PTrNzU8DSf899CkH6m15ryBjhnYVMv9afn4IezflxqJjop9l86FuwxcokT86NIri579R1c3eVd2r8VyFMjscb7ruJWPGcTZJX9Ks+i+CZGQUUoh8rrW8L5MNlq000BCZpWuSb5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96df2df9-b295-6334-d45c-183d116fff88@suse.com>
Date: Mon, 13 Nov 2023 12:13:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Informal voting proposal
Content-Language: en-US
To: Kelly Choi <kelly.choi@cloud.com>
References: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e358f53-1413-44c1-b684-08dbe4398e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OWomNR5vUDMF8hJvHoPqE5G6wpHtVFF12HIX5t3u8Z/XOUnG9jKkTkLuC+M4Hiav6/k7+xvZzuxpnMc30AWyQJCxHZjybvuF+xg1VWkRpZGho0K1aPkzZlcqQU0Qa1roIBacr+rYqsYpBEKjtN426Tq7T0PpMt7eng7UHSO7cCUPgPzE7ucnmBwxpdqQGD5Jm6wkT7h2Y4X3ye8p0YAuv+D4Ed9ye0kJqO8v1QaICLtJxCH3U32HWQcDPQIB5JVkXhcVhaOJljlfe+6/rMhsx9SfA3Scv53qTR5J+6xAE46SM1TEWMARCww2PlQKECyaY7disbqyE0WxokguYI4FaCa7/3mcpseRAxySik1gU/3ccv5CvkKkn//zwd15MIKciW6ubvC6PLXm/ZYCb5MhHFQNX791F7rjL3cr1C8MpnenKTsI/I3wKEwb1sCxstjkr4gzWDpz0n85wBl5RgERhBXjbyUrmmNxZm4is1IiUxEZiWK1svOJ3LQoJtePRLMBDaC3s2Z9wSMDje8i28Ao2wUFy1obZbx+WFzYvhY74RgtBuAepDkOLexpd7Q0KAyC+ETEq/6XmKZGpX9QggpWHNKhvq/uNJd3gMg8oJUJ3xUPMzQl5xPmehNmTaZCjbJTQmZsmOpxpBAngonGpdnPYaoPycehCvyimYf58hdo7xaYdNdDIlkWEUD23XdGF5fe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(396003)(346002)(376002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66899024)(66476007)(66556008)(66946007)(316002)(6916009)(478600001)(6486002)(86362001)(5660300002)(3613699003)(31696002)(41300700001)(36756003)(2906002)(4326008)(8676002)(8936002)(7116003)(26005)(31686004)(2616005)(38100700002)(83380400001)(3480700007)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFNiN1phdDVFZXR3enM4c29vcHBzQ3k4WXpkUjNPQTdPNkhTVW1UczduTXpZ?=
 =?utf-8?B?ckp2WmJjV0gwWGhyb0xyNVhsTHJWMTZhZktBTVFMNC93aE5BV3pQRjJPZ01m?=
 =?utf-8?B?R0tkQ3NyUWJScEhnLzFZSzljNjY2YlZ5ZEgxbm8xL082b3lPVmtvQkNQcGVW?=
 =?utf-8?B?dVhJZTlFQ2JkU243UlQ5N3BZTmdsSkg2M0JBdUVGendQckhHOHdpeWlFZXJO?=
 =?utf-8?B?TXJLR0czT0lEcVhnRlFBa0s1c2UwVGFWSFhxTzJjdytYUTZ4Z2VNdE1FaWlo?=
 =?utf-8?B?WmltUy9DZnN2MS9uVHE2ZHhEOTBYUUhDZmNoM3NUM1YyZmFUc21yT0x6am9u?=
 =?utf-8?B?eG0zc24zSHZPeFZjSlpIa3NFVkVCOGNoTlV6dFhFNnZCdjFnRHFxOHZtSC83?=
 =?utf-8?B?TWJvb1NRQkxwZU4vb2w5My95R1pGbW1yNWxFdVFpemU5QURSUnpsTG9peVUy?=
 =?utf-8?B?V1JpQW1WMFp4T1NHMFRobjJkaUFJeFc4NUFIRGlzdEhwZ01wV2ZWZzBjRDla?=
 =?utf-8?B?R2lQaTVYdEpaYXpKUUJUNk16bitLeXdKaFI0UmVBS3lnMmkyOGhwL01iM0tE?=
 =?utf-8?B?eWt0U2syVXprWVdvck5FNTRLdVIwdnRNcExKWjhYOUVpKzlmUTlJYmtnZ3lh?=
 =?utf-8?B?NHVMMGltZFVsTWxMcnhOTU50ZmV1czRNRy9Db0l3emNYRTRtd2IrOWxFVXVo?=
 =?utf-8?B?dEdwOXI3Q29EN1FZWmJJTEFsNjV1emJmZmZGbUQ1Y1pJSjBqTHQ5SWVmL0hG?=
 =?utf-8?B?clBvM2FqQWU0YmhhNFdEL0Q5eFdQNU9RMnY0OXBJZk1CTnVTS3I0RTFnd1FJ?=
 =?utf-8?B?MktXRlEvWEQyaU5VN0ZHSWRPK2ZjZ2Q3NXA1Z3k3aWJrc1VyejIzL0RyK0xE?=
 =?utf-8?B?OE9UUlZmY3BHU2xTTU8vblFGeVVvT0VNb3ZhdzdBMDFFT25HSEYyK3NzYlhl?=
 =?utf-8?B?Q2dTNHNEZGtKVDVKbmtXeStHeWlac2xGeUJWKzNoVFB5Yk5zSHBsdEUxYjBn?=
 =?utf-8?B?dTdlTlBJOHBSNzY5WmFWeWpaWS9DUEJycEZJT3JaQ1FzWkFrdk9QWVh5NEti?=
 =?utf-8?B?SWs5VGhEbHd4Zjg4NnoyaE9KR211TzJMWUNzSFZhU3RjQXFBOEFrKys0MzBC?=
 =?utf-8?B?TSttR0p1blgxaG9PVmthdlY5UnZTT3RnRmZLOURKWGFSZVc1RS9CZ2o1Z0lh?=
 =?utf-8?B?dmhkWHlBRzRSUGZQQ1hodm52bmx3RGl5enlOQ0srZUQ2djM4RnNtWWR0VnBN?=
 =?utf-8?B?enZ3VFRoS1dPblcvTy9pbk5KeUVPSTZIRE5KU1RYZDBVK0MySTVmNFBMNkhi?=
 =?utf-8?B?SlBFcDBwSXBKbkttMnhvTWk5WlVObkVCQVhmUW9yWFZ5TzNUaWJTRFI0WG0w?=
 =?utf-8?B?VWErRXkxT01sTFM5SDdjYVVhV05kRHFlNFE4eElCR0hGdFEzZ2RFVE5UaVQ2?=
 =?utf-8?B?V0pmdnl6cXhHaVZlZjhXVXBFQ0NKT3RLUUl6YW1FSm9RcXZVNE9TWjNWL3da?=
 =?utf-8?B?NkZSTVNjNXBUKzN0bm56WnZ0b1QybHVyWDYxajN6WTdJSGltYkxvbGZ2ZjN6?=
 =?utf-8?B?cEVCV3Q0Z0xnek5HNjE5WjlkYXNFUVRxVldWUkhRb2U4dFpIc3ZTYmxCR0p0?=
 =?utf-8?B?MTdQSnd4VGw1bnFOMUpURk5IdGxaMlR0MlRrSitnMW56b2dkaE1FUFVOZjk4?=
 =?utf-8?B?bE5zc0U3bklUcm12YURZaExHOG5RZHZXb3ZnSklha0UyOW5iOWx4UEF0M2hD?=
 =?utf-8?B?aVdydmdDazZYUWJ1LytJMGNpNUlNbk5LRmVFT3FFdXFNaVJYeDI1azVzSmhw?=
 =?utf-8?B?SU9PenFFNlpJaDRrajZsZlNjTnBlQy9SN0FFQ1hGM3J3NDZUcVRTcGVIcWxF?=
 =?utf-8?B?Q0RaSWpRS05kVjFLa2ZyNGE3VVVpSkZRQWhUb1ExZE5QUHZYbnR5djNDSmR4?=
 =?utf-8?B?ZnVWQXVZMnNXMFkwdkg3YXJZNTB6dHpGdnpFeURHUyt6d3BiVy9vT0c2QUwx?=
 =?utf-8?B?bExoMk4yWFhVOWRXVTVLZWRjZTBmaktwWFNERnZINUVtdnovWVMzRW9VQ1Rl?=
 =?utf-8?B?eVJzdldWUXNuVlZ1U094MVNITDVnUTdFR3ZzSG8yUWM0azFDcjV2S0lGb0xx?=
 =?utf-8?Q?NdFDuBsvgI0vd9Nxlo5EUI5D+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e358f53-1413-44c1-b684-08dbe4398e23
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 11:13:25.3203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4DH4ML7BnXh3iaNS8dkfEyB+llhB+Pchdum6cNNAL2Gz0Nks5lMVPkwjS5N/a9G8Qa+YNDxHWSOnvDYLDRnuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8888

On 06.11.2023 17:40, Kelly Choi wrote:
> Hi all,
> 
> As an open-source community, there will always be differences of opinion in
> approaches and the way we think. It is imperative, however, that we view
> this diversity as a source of strength rather than a hindrance.
> 
> Recent deliberations within our project have led to certain matters being
> put on hold due to an inability to reach a consensus. While formal voting
> procedures serve their purpose, they can be time-consuming and may not
> always lead to meaningful progress.
> 
> Having received agreement from a few maintainers already, I would like to
> propose the following:
> 
> *Informal voting method:*
> 
>    1. Each project should ideally have more than 2 maintainers to
>    facilitate impartial discussions. Projects lacking this configuration will
>    be addressed at a later stage.

Terminology question: What is "project" here? Considering how ./MAINTAINERS
is structured, is it perhaps more "component"?

>    2. Anyone in the community is welcome to voice their opinions, ideas,
>    and concerns about any patch or contribution.
>    3. If members cannot agree, the majority informal vote of the
>    maintainers will be the decision that stands. For instance, if, after
>    careful consideration of all suggestions and concerns, 2 out of 3
>    maintainers endorse a solution within the x86 subsystem, it shall be the
>    decision we move forward with.

In a later reply you make explicit what can only be guessed here: There
you suggest that out of a range of possible options, up front two are
picked to then choose between. However, when there is a range options
available, and when those can be viewed as points on a scale (rather
than, to take Stefano's earlier example of SAF-* naming, cases where
it's hard to view choices as being on a linear scale), picking two
"points" up front may already pose a problem. (See also another reply
mentioning how to ensure that the various possible options were even
taken into consideration.)

Not only in such situations, but in general, to me a prereq to even
coming to the point of needing an informal vote is the willingness of
everyone involved to find a compromise. When there's a range of views,
and when "knowing" what's going to be best for the project would require
a crystal ball, experience suggests to me that chances for an optimal
choice are better when picking a "point" not at the far ends of the scale.
(Such a result then would also much better reflect your named goal of
seeing diversity as a strength.)

With such willingness I think even informal votes could be avoided most
of the time, at which point it becomes questionable whether for the few
remaining cases informal and formal votes really need specifying
separately.

>    4. Naturally, there may be exceptional circumstances, as such, a formal
>    vote may be warranted but should happen only a few times a year for serious
>    cases only.
>    5. Informal votes can be as easy as 2 out of 3 maintainers providing
>    their Acked-by/Reviewed-by tag. Alternatively, Maintainers can call an
>    informal vote by simply emailing the thread with "informal vote proposed,
>    option 1 and option 2."

I find this difficult. Both A-b and R-b assert that the person offering
the tag endorses the presented solution to the indicated degree. It does
not say anything on possible alternative solutions. As a result taking
such tags as votes is (once again, and once again in my personal view)
reasonable only when there's a black-and-white decision to be taken.

>    6. *All maintainers should reply with their vote within 5 working days.*
> 
>    7. Please note that with any new process, there will always be room for
>    improvement and we will reiterate where needed.
> 
> Ultimately our goal here is to prevent the project coming to a standstill
> while deliberating decisions that we all cannot agree on. This may mean
> compromising in the short term but I am sure the long-term benefits will
> stand for themselves.
> 
> *If you have any strong objections to the informal voting, please let me
> know by 30th November 2023. *

Just FTAOD none of the above is meant to be a "strong objection". Despite
being unconvinced of the proposal (including the need for one, not the
least also considering what has triggered this sudden effort, when there
are - imo - worse problems of "standstill"), I'll try to be a good citizen
and play by what's going to be put in place.

Jan

PS: I can't help the impression that our differing views here are somewhat
rooted in different election systems in the countries we live in. They're
imo different enough that I consider it troublesome to see how all of them
can at the same time be considered democratic.


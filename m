Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C7574AE5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367415.598497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwFU-00029r-0A; Thu, 14 Jul 2022 10:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367415.598497; Thu, 14 Jul 2022 10:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwFT-00026N-TV; Thu, 14 Jul 2022 10:39:11 +0000
Received: by outflank-mailman (input) for mailman id 367415;
 Thu, 14 Jul 2022 10:39:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBwFS-000252-9p
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:39:10 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30042.outbound.protection.outlook.com [40.107.3.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3155f03c-0361-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 12:39:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB6591.eurprd04.prod.outlook.com (2603:10a6:803:123::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 10:39:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 10:39:08 +0000
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
X-Inumbo-ID: 3155f03c-0361-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGqOzbNlD+CvV1UHGkmqegQWzu3doVpnJPU1jtvRdK3Uu0In+hQwprF8Q8X4YcfSqm1AJoXmz6qHqbMWjWFg+z4xb2jIbKYjFpYeCgTyamntk/3MmsRyp7EqicFNuKYh32nN0nd9NNO/pNtvIaat+weia15xFyIhbV+czi4W8VdxGuBq/j8bUBqWYXfKGoHJeYmWrpoHI6zpZzkGIqfTfr2O5oE4DBhNUmEAcbKvdyv1ZpGD+y6e1XasrLHfBvdJms1dM7pdcNhu+rvxeG+rchtHX9ODfOjLBizXgSPjb0Ox5brmfqCIVaJt7joC+1Spw9sVBpbmgDOtzDjYB08PlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJcJljgLHXd3rWvovq7m0uFmd//a+EvxQqGvBRRbhUE=;
 b=C5pHMNJspS6KX7zuilx1WRt9fnHXepyAmcwRoc0TlEtEkNNSkOf0QIfSxKp3NHwNpomURxOghWOipW2LM1zXqAxGJjNseZknYnKgSU0M2X3LrVnf9E6rMDc6mskwRKRxx+LpjVl6GDfPnd0GmdgpYl6x1A1ORq33oHPupzg2GiRG+giU3bgk/nj8mNkGCURGzAGPh6jjNm7psQaPEv2em59YN0maBau0wW5nHHeBHhTo47CVs5KT8TQmhaq1Qd1/n2CeSjLqSHskpYr1jf9qauoSQwLu4vDbKchPSxeqz9G1DTZ+LewLackeXS0d+kqWfqAtrabHfJqD7V9DdtK6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJcJljgLHXd3rWvovq7m0uFmd//a+EvxQqGvBRRbhUE=;
 b=PND3StzMRCslz9z3nD6j2IO5hksaBBp/eW6ppeszKYBVGdgwh8JMe4kBorlAo9ITt62KOcXtGGkPajeSt4ogWL1nY9JwO/AhOE8ScKX3uWzV89nfuwSmXkI3uvI4qVasAKaf92SyvK9RPPRRYVV42pYYdfMibJ669zO+WtCgno8wDNK0r7I9RcT14GH4/23ygDgKjhM7x0etRFYBeXU2YKI4MUK7umr36UkK3GwpZ7XOlcz2q2Yrpg7dIbqptFtFtJBdCvfG9WpNbTe0xRz+cCh6JzpIIiZGWUpO5b/MkcT+CzDvJ/nH+9/MPMjJ9YvAp3bYYH/5Y7KWJhMh3cBPUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2fad8072-e5f1-2302-f01d-82f744606d9b@suse.com>
Date: Thu, 14 Jul 2022 12:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-users <xen-users@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>
References: <okFlqhJjn071_UXGT4dzMfI03eqFRtlDcnSyS_QtHFu3vZVCdTTKkvZS1ApPFXEN65mcnhOc2g-9HjZmTGYMyV1OOzrv_PkCzdo4KNKICf4=@protonmail.com>
 <5952497A-CB6F-4C66-8FA9-8EF9A1A08B5E@arm.com>
 <9gC8biTj2pIJoXJRy4N2I6nsOUEUjYsbIAj0XZsWdAwiwzXpgBBeBrLFB0bAC7LjVmKwPvzufWHPSVYaWuMl33lKHKbzChEgW4R9QBwJZJk=@protonmail.com>
 <F18A101C-ED4C-44DA-AB2C-15E79620A692@arm.com>
 <13TmiNmQ9iXXKyshVeCbt4ul_jYjdNejXrqhIJK7CioLQRgpSITJX1Ik0jNEZZDTUIXs9OvM0qjZJeqRhQl1oKU9IdiZ3W-Ajsqp3sYgt6Y=@protonmail.com>
 <F1773D90-2760-4098-BF08-4D4125D349DF@arm.com>
 <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17e7a3d4-50ca-44dd-ffee-08da658514be
X-MS-TrafficTypeDiagnostic: VE1PR04MB6591:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1vOY7d+SG0T+jvSVkKrE70SHq25YXID5ywcOQ+CxRrHQpuY9YbuyUSQYgjjrKA005C689OVFFVf1UL0J8VYb/Uy/wxu+SnNxVnIIBVtI9oJ5DwjQ8H4W6ayHRF7EYlHXohadq5oWmiqy1EBQtlRiW/mOaL7SeUykyWdgvcMFbehwmc/8yexc8XCjiVNwgEDvG1ERZgUBNL2ysbJ7YyJFw7vkNxCgZLs8lkQVwzafjEWx01L2YsLB701OakTqx8QCuSmDjAscefwgra5NzwbkiaIHpzK3p+Bvn1ntOq2b31jWqK9O+hfbdDOnuGptmudj0YLvRfkT7G81+/U9Fh6tQDecnGi9PKBciRQ+JRNqtpx6CGYaK356Y1MVxAfxEhFCey61KxWr9MCM+zPMcM4tv2ZorspNst9RaWh7IzISfV34gy8BWdgzdezSC5byOinQskbUMBy/jlG/fe5leo70biPlVQLlEaI1FMQb+jigulw77DDjRfl359vN3nfFaW4verg9gSro3N9bWIImH0vwv1a0FSRc4C7VrkgsRZsK2BD3y9514WcFQDTk1kGJhNL7OUYJUA2f+eglDn+M15S9F16f2atBtRylIJ+jAVQiVPQW2HRqr7EbBdy4E08L+rD7rinh86xCX+ujZB/1oHYIos15hDwxmNneU5asPMGhSwNcyBc2np+RM+e2+M5ZDOwrAG8n3/M36fW2vhyZuuMlB5BQw0IADpmHilak23pnQG1uFVvPl7AHJsLr61cQUJrjqqzXIf6YV/hO4QoiFYn7tzKrfSc/3AtLXmwoouA5rihCGtZMmz3F3gr/iTikIWMWMt/OVrMne0oYLe0c3+BMJdpJYWCaFHDWe0ISUlxCiYupjwUFWcvaDfFqF8e8wVoAYxKiL9hQu5/cYiqNdsWy2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(376002)(136003)(346002)(2906002)(5660300002)(53546011)(8936002)(83380400001)(86362001)(31696002)(36756003)(6486002)(6506007)(38100700002)(966005)(478600001)(66556008)(66946007)(8676002)(316002)(6916009)(186003)(54906003)(2616005)(6512007)(41300700001)(4326008)(26005)(31686004)(66476007)(547064002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1lpVTgzQXRKTVExbGo1S2dhd2w4TjI5UXkxVWQzN3hPMGlteEpFMXpXc3V2?=
 =?utf-8?B?bEFya0ZjRURzU0M0ZU5wK1Q3NC9EL3dDcVZsNTN6RnNkeUdvQjFHOHp6VmZs?=
 =?utf-8?B?eGtHMGRDR0dWanpQNnRUWnFZOU8zTVg2RmxwSHFjV2wwZWJXcmZBS1gra1BG?=
 =?utf-8?B?cy9ncXY1VjBBMjZrS2JJd1dqNVEwMFU5T2p5RlhBWkZEempqZ256Q1VDVkhz?=
 =?utf-8?B?dGlkTE1GTlpHMjJtazBpRm1FbXczSVNkdU02VnlPcGtDVGZRd0ZjZmsxUFBY?=
 =?utf-8?B?UGpldDNnMXd1YVkrS0FnK0l0VVlTbUwzUGJTRDBWdUtNMVkzdU9NL21CanNj?=
 =?utf-8?B?RVpMWlc5NVFVU0s0WS9LZjdxQ0hOWElpMEc4Zy9FVW4vZjJISVBqN21CUTRC?=
 =?utf-8?B?MHlEYjF5dEJIVm05d1RjZzhTaGVPNjJKRGNlNkcxOVc4dnllKzlKVSthbmFi?=
 =?utf-8?B?V3dESFU0V3k2OGoxbGpiRWdJVHVyU0NHdTVXRW9KQndBTmFUdkw2b1JDY0s5?=
 =?utf-8?B?dzRGMWtka2RtKzVQdUlwL3UxanovM2htU2xRVXhiT3l1SHZIbWNjeE1mS0Nh?=
 =?utf-8?B?WGxsTnRMaEpLY3l6RUo2S3B5dWp3ejJsTkV1ZTFHZEp0anJzOE1Dc0ZrVWR5?=
 =?utf-8?B?RjNWZTM4dzBTQnpiQjc5aG1ac2g0SmF4MUJHQmNxNjlMazkwem8rZk0yUEtO?=
 =?utf-8?B?ajdSUlgyNDlvczcrUFVkZnVLSEFHU1F3Y1gxaUxSbmVjSk13OERhMGZHTTdV?=
 =?utf-8?B?dDRoTGJ0ajBFUnVMMThYT1o2Z0NTQ0hjVXdTUkU1Z0xlZXJGU3hzZDhtT2hk?=
 =?utf-8?B?UFhMOVVmVytvVDkrdlB1ek5MVTlQMXo5TzZGSXJXTkgzcllCalJGem04Y1g2?=
 =?utf-8?B?QS9GTFFGUUFrd2xQTVlQSVIrdEF4bXoxTGwyUHByK1BnNEhjaFBGZGdJYVM2?=
 =?utf-8?B?ODhhMEdna2VWNlpCWkxZcWYzYkNja1N0NXBzd0tNNGw4dEl3QkJPTWxVSjZ3?=
 =?utf-8?B?RENycWtFVnlWaVJ2QTQ3UWpqbGEyOCtOOVNLSDByRXNLazFQVzJhMkZUVFJx?=
 =?utf-8?B?VERrK1l4UjhrTXdUcnArNjRiY2VrRVZ0VHpJWTFZOWJ5b0VnMkdHL3FuV1dy?=
 =?utf-8?B?b0JKSGpZNk1XU3N1emsyVWZNeU1Na3ZSRWNlbkFuRVozbzNwVFJOWFFTV1N2?=
 =?utf-8?B?aHZGZWlib01aUDRNK2R2amRiRzV3VnFmdDBFcEVwWWRJbGNXTmdsMzJxWC9U?=
 =?utf-8?B?RlA0bFpHbGVBVXRYekkyM2Q4V1ZwakxlTWp0eGVCYkJjWjZtMGMva21aOVNC?=
 =?utf-8?B?M1ljL2xMUy9NUXRaeEFzdURUbk5MNWhZVHJhMzljS29zaGMrSjBIcW5kWFFa?=
 =?utf-8?B?UGh5MjN0Z0FKQklGS2Z6S0o1RnlVRVBCNHY2ek16M1F4b2EzRDBnOGVEMEwr?=
 =?utf-8?B?VmtVcmtRZmRUUXJoTndHK1VLRzRra3RJL1FoRTZlWHgxRlFvbXJnakpLUFdk?=
 =?utf-8?B?dGkzaS81TDlkSGtDZS9NbHhtWFFkbWJWNDdTcXNJd3g2NW1MaVZwSWEzN3Fh?=
 =?utf-8?B?a08wWkVpd3h0bVRDTWxscTFKTlBTNVFSVm8vRldWS2FQM2ZlMHdDOElaZ0xG?=
 =?utf-8?B?bHNVWHNlRXpNaFphN2owbm1iZDhDNVNXUmViVEFVTDNWOURWTUthejNwTEhG?=
 =?utf-8?B?VmM2dkZSckdLckNyNXVIL25uakdXWDFUSGNGNEFTK2o4ODN6L0dYVnA5bG9P?=
 =?utf-8?B?WEJKRHR5c3NhZGs4bk85RlFpMHF2TTlGNE9KTnpxWmtoaEVjTUdQMTB4YXlF?=
 =?utf-8?B?anpoN3Z3TDFBRVdqU05ZdHBwQ21rY0NrdVlHSkIxbWcyUmxqeE1hUnNPbTNF?=
 =?utf-8?B?a1ZHbW9ySFFjMzYvam15WWlsSnU5T2RDWUtZMGpHUXZjdFk3aVZtdWFwcUlS?=
 =?utf-8?B?WVJ0dHNDeU9xZlBzS1hpekcwbmtmNmpveE9HK2IyQ0Z3ZDl4NDlsR05BTlo2?=
 =?utf-8?B?MWdpWFNFY3F6bFU3UWNaSjdGZGtpMXhhMGEvTXZleEtITEFQWkJ5SWorUTdC?=
 =?utf-8?B?ZGxSSEJnZ09vdWFWREFBL3pld0wrVEFXclNQeW0yNi94cXp3V0IzS3Z5QzFI?=
 =?utf-8?Q?fV9AsLM4De+XGTLarBxpCeuhT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e7a3d4-50ca-44dd-ffee-08da658514be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:39:08.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lQpCByB6phA7Gm9gefpWplUWlgRfMGBl0NMjojtPk2VPUiY9pta8o+/bdPp4rWwoMSR9DGGbupa01TF5G8few==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6591

On 14.07.2022 12:33, Andrew Cooper wrote:
> On 14/07/2022 11:12, Luca Fancellu wrote:
>> + CC x86 maintainers
>>
>>> On 14 Jul 2022, at 10:40, Mathieu Tarral <mathieu.tarral@protonmail.com> wrote:
>>>
>>> Hi Luca,
>>>
>>>> Hi Mathieu,
>>>>
>>>> You are missing wget in your packages.
>>> Indeed, installing wget solved the issue and I was able to generate
>>> a debian package.
>>>
>>> Still, we have a build system that silently depends on gawk and wget, and there is no check in the configure script to ensure these tools are installed.
>>>
>>> And the errors in the build system are quite obscure, it's hard to understand that you were missing gawk or wget in the first place.
>>>
>>> What do you think about this ?
>> Hi Mathieu,
>>
>> I’ve CC the x86 maintainer, probably they know better the reasons.
> 
> These are two different problems.
> 
> The configure script does check for WGET (or more generally FETCHER) and
> will object if something is not present.  This is only relevant for
> tools/ which you should have been forced to run configure for anyway, so
> I'm really not sure what went on there.
> 
> For valid-addrs vs all-addrs, that's come up on xen-devel before.  I
> think the general consensus is that we don't want to silently depend on
> gawk.
> 
> (We're trying some new project management tools.) Can you try opening a
> bug here: https://gitlab.com/xen-project/xen/-/issues about the
> check-endbr.sh issue?
> 
> This ought to be a 4.17 release blocker seeing as its a regression from
> 4.16.  (CC'ing Henry as release manager.)

Except that 4.16 and older then already have regressed as well, due to
the backports they've received.

Jan


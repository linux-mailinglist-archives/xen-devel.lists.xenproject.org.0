Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D6678267
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483147.749121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK09g-0002hj-DL; Mon, 23 Jan 2023 16:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483147.749121; Mon, 23 Jan 2023 16:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK09g-0002fB-9r; Mon, 23 Jan 2023 16:58:48 +0000
Received: by outflank-mailman (input) for mailman id 483147;
 Mon, 23 Jan 2023 16:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pK09e-0002f5-Mo
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:58:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2081.outbound.protection.outlook.com [40.107.15.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32a3b535-9b3f-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 17:58:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8208.eurprd04.prod.outlook.com (2603:10a6:102:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:58:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:58:44 +0000
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
X-Inumbo-ID: 32a3b535-9b3f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHeA42YueRqNfTfix+huWZ91uayUiqEYKjij3TTxZsj0OgFl521zI0LPTHPzeafaZ6l9wvOhi22d0jUe9xZkxBV3FtFv0ZDS9rz5Ff8E+1fo+aqpj72QPmH5Lsu2cdDQoQ8fZLCmZ43IdP7WRKQ4FYg3c936yQrL1048zJloAUYds4k+iFWoJeeyP5UO02MNQsakE18LPK7ELrgw2UgLAZuonQoG/razSe6DCmrYCYNqRS1skZWbsZOI785iVE3Ll6j3PMuG1mfatrSN1UCp46d+XYFbOBpC7Jg9RJ27TgrWAOvFFwpO97UFYA2yOsKXuF+0ULq1ttkOIxxu4SqScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yHRVQxuv4tZGsOTtvADB08XHjyedRpuCMjpilpE5Nw=;
 b=Da3AfREpsmoC5mf5SC56I3+20W/kt4jYKx2wW3ub0yOe4qlyHiTiD9DmayIZOnbaor594F5ABk9i1WNvsxlrM3gQWQQhOmc7C461EPtUNHmIyo6KslUdXS/SwJ4eiLbV+xzzuWwZ/pVR36Rbi0ajGoC4/EFxnKuWWSj2nyUigAncjvL64bI0bJEmGhtXNeF/jEdah8GLKoF+u21FL4MouwdWTHdnbZtAzBmnN8XMlUn8DttOgW4EFSNjhZiuuXXrgOL7w8ocB+GK6x8q+IDw6cq/T1wrpM6ZJtWUS+lkTlczywFJNRJocIku2xrytC5tOkrDxnYQ2VbjAp6mAlEujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yHRVQxuv4tZGsOTtvADB08XHjyedRpuCMjpilpE5Nw=;
 b=cWQ+4CecHQeYQViXgbBP9kculCMDRgT/EtJ6xt+AzxGvx4u6oq2EbdFWxTUFKm63tO+6/L2YVFFwA1ohDBTbvEKfOQikNEF1Ggy9OoEdphLd69+NfdCnmW+WF+Z+yUxpna28b57N+KyQqJiZ6eq6REiJ0MMyeRZ2cOpmTidSGOHovJKyDJv7Ano4sVaMOIFK2UbTgFgIcawtfKTNLQXTYSIixed7D2nP0uxgsrMUDaWOsuDKG1fHZCx+Kv/BKLtlbbVQ4WaKvFsPxq/ypBr59MsOgu5RgI4dIJTwBhMJoctBg6EX+V4gw+cpAp7GCthlmfGiMxWRYdXgbIX6bivjng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f13acc85-3cc3-d685-2e32-e47bcbed893d@suse.com>
Date: Mon, 23 Jan 2023 17:58:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when
 HVM+PV32
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <942e1164-5ed0-bdda-424f-90134b0e22c5@suse.com>
 <79420a4f-358a-f404-7965-e5f215234ba9@citrix.com>
 <2ec2a36e-4264-6c12-c2e6-1af85c91f1f6@suse.com>
 <04f5c9ba-24aa-c9be-e8de-a867c897835a@citrix.com>
 <12bcdc9b-52bf-ad10-a3ec-286d00372be0@suse.com>
 <e9073354-cc8f-8496-1fb6-d53ff5879ccf@suse.com>
In-Reply-To: <e9073354-cc8f-8496-1fb6-d53ff5879ccf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: d3caec77-1802-4d8e-c6a9-08dafd6315fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qCHerRxpbs4xUMZTCeWuANf6/Lyc+s9jcugjDHaNmWe0OFIQf8eNLW7gdB6f/2qrlYEicwYYe3KPMzQ60LIic2jEISriuqfHw4t269PI/vWaW42LmsgEm4d+yRXqUkXEgsbSnWGXVYOxRVjfqxC4PQKFyKe0J9mmy/DR/+Mz+584ZtvQ7/AIiPs99NX8VnaTRxKRK8q92lqTr5llOeORHvJK+uM+GGnB007+zr/Ex4dRgPIR4NCzYAAl/FcWE1RrFcgfQJe6Yr4bb8A7YWxVaya+LiZh70JCS8de0yZB2/UQLk+tdjbQ5ijXqO5gWc8Ea0KokQB2wKOieToIPNddhYeqpr/DlNWFocNjdRveCMWS1ehquWOKinoK8+8G+59S62qgYw5XQeVOb9SO6kz4bU1af+R+FyrO/Y4g7Wxa3YfkSj8BBcsHcGKPqqBId1T/5AdvbV0mviZbK8H0FCUW2SjRVSRHfVajft7n+WmtfV82FIWeVo4erw7G5ZvVfQoapyljdUL4eP+z2GDY15noIa/UrNhQR8QP17jXCWC6KGqBIw0D5H1NtRNy5H1tSmzaFPlQjAwZWcMv861nJt2WPyqXQVj7FxqtmRHS97NSKpp8Z/bYD8gv1W70Z7SUrhLym7p36mehPC5+axdthk0TYQh4qcnk5d/qipARXcrxrpe9t/mOY19PfqQsBy+Rp+ScQNVQgTFTMYpVhoUy4wf2O8ePAFUjCP5UViSe8GBw0w4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39850400004)(136003)(376002)(396003)(451199015)(36756003)(2906002)(5660300002)(38100700002)(8936002)(4326008)(41300700001)(31696002)(86362001)(66476007)(6486002)(478600001)(31686004)(6916009)(6512007)(6506007)(53546011)(186003)(26005)(8676002)(2616005)(316002)(66946007)(66556008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFVGOVNSeUlpOVpUOXJaU0ZibXVNYWRyRVloWFo1YXVHRUVsaWhqV0kwZHIv?=
 =?utf-8?B?YW5TYnBXcWV0U0lFSTlaUjNBVkMzK0FNZjJ1TVlQcm1INzhBdW1RYXV0N3lS?=
 =?utf-8?B?Yk5FUUhSU0drR3NNOW5mdTNEZ0RwOThyQXhvK3haK0VkT0ZabUt3aHM2UlFK?=
 =?utf-8?B?VUJMMCtPbXRUdDg5WExhYnVZUUY2d0JkREVZSVdNSkR4WEU4d2U1TVM0aVRs?=
 =?utf-8?B?cmk3bFN5TjZQeE1HVWlGV2ZiQktMa2tVR3ZmT0dMczE0cVdHYzF5aG9QNmFB?=
 =?utf-8?B?NFBlQkZDWXhvcWNqT2JCcUg1WGMzdkVYNlBqUkFITWJjUXRvZUNDdFRzbHJ2?=
 =?utf-8?B?bXk3c2h2SUJhTVNVOEd5Z2tyZjd1S09aMUZZSG40STMyVmRsMzg0T2dMZ2pq?=
 =?utf-8?B?RW0zYzVCbmhuSTdsTkpqbTBPTHZVeWs4d29iTWpNUlhPbWVucHhUNUprcUV6?=
 =?utf-8?B?RXU3ZHBmb0RnQWZMc3p2Z1RMOFRIUHQ5ZXkxOURXdXRCZFN3YzlnNndORC81?=
 =?utf-8?B?aHBNY1pBQWt6c2JJbDk4cHRPSHU5YkZTVFdzUW4yTG1qRU40R0FkQi8raGJW?=
 =?utf-8?B?Y20xaUJudjZVeEJpQ1A4NXpDOWZDS3g4U2tOMTJuR3JPZDRlSGlaVzBZMmY1?=
 =?utf-8?B?RUNBQ0ZNbmdSOVFwazlZNkxBUzlmckE2MzRZbjMvTXNOREc0Zk1xbm1pYlI0?=
 =?utf-8?B?MXFTNVdrVEdjODdscU94YlU5TU5KeGVwSmFSbDFuWmprS2JieVBmU2xJelZP?=
 =?utf-8?B?NGFtNTZEOHQrbEYrczlaZkthZUJvVzh2ZHVuWW81bXlUZUFNZG4rMmhpUFFt?=
 =?utf-8?B?d2tqTldoWXlpWjFFT05jczhrTFc4MjJtMTNGNUlsWTdqVWdXUWRoUmlxT1Rr?=
 =?utf-8?B?TnoxbW11TUFXU2FZNGpQRTJCVmFNVmhoMTVtNDh1cEd4U3RiYTVlVTNORzRz?=
 =?utf-8?B?WFVOM25QanczUWNVbEdpQ2Y1SWdsOW5VMkNxOVZEdDZabExIbjZvV3dBZ0xh?=
 =?utf-8?B?NVMzclhtUS84Y2QrY1ZIM085dUgzM3BZLzdidGNkcU5wb3lLLytNdWFxNXEx?=
 =?utf-8?B?ajlBdlJQYjhEVnRhTkJOUk11ZU5IbXU3WDAxUGNXWFVEN043ckVmVExNQXVC?=
 =?utf-8?B?eldIQWMvOUdOOExVNTkyR1B0c2d5Y1BBdTNsbGlQa3BQcVUwTHlqRXZWM2hJ?=
 =?utf-8?B?SmtubXNNWHJaekpQMm9TaDR3WElyQkx4NE1VdFdrSlh5NXp6OXFMOXRUNDJm?=
 =?utf-8?B?WGdFMGlQWHVGNmpzTnZEVER2SEpxZ3kwN1Yyak5IeUtHU1A5RFFISDI1MFJR?=
 =?utf-8?B?dWhsVDNudUtkWUI3MU52NzgxOCt1YmV3MCtPTFMyR1BZditKQnNnSGpwTE1t?=
 =?utf-8?B?MDNIUHRGaTh0TTFRL08zaURWSllQamwyWWd1aVdaN25mNGtwVFVaRTBDSEJt?=
 =?utf-8?B?S2VqSm1HUm5IcVNlUktINWs4MkM2VmFGZmM1NXNkaVdqUjdEdnpCbG5jNXo1?=
 =?utf-8?B?dWJ4ZUhybnp1czl3LzJSc0wwNGZMdUYwa2hTSy9maGV3S29uRXVRRUJYSCto?=
 =?utf-8?B?T1BmTU1nQnBHVUt1RUNWbjBkNHU3SFV2ejR3TmVxWGRJZzVGYnBmNWZ6N0s4?=
 =?utf-8?B?VnZ3VEpxNWE0aVBId3pqQlh0QnFVT096dUhpeFlFZ3FuRlUvU2dUNmI4T3pO?=
 =?utf-8?B?Y2svaDlYc05WTXhCNkZsdE0rMHhWK215MjgwZ0pBSDBsZ3hlZHpuQjJWNGVZ?=
 =?utf-8?B?UXFvSU00TlRBdEhWc1FUZGswR09iUHdDQlMrWDEyeWF4UzVEeDQ0bk9BMG1t?=
 =?utf-8?B?S2pBU1BxKzBHM29PYk5MMXpFNEprNVRJL3plRnpPaVZHNU1ETGRoQ1lHMXdI?=
 =?utf-8?B?dHgxTUJ1M3kyU0VOckMxMnpHZG55MXdFL29WaHVEaFpnRDJYVzZLL2tIZ1FW?=
 =?utf-8?B?WExWSDV6c1RKN0pFSGF6Q20wQ3BPaTRYbTQrT01BbjVyTVhQbFJhcmZkUTVR?=
 =?utf-8?B?dFR3QlNCYVE0cWMvLzNsT2FZWEhjTnNTcnlrR1I1YXVjUCt4azRMNVRGQjl0?=
 =?utf-8?B?MStpbzU3eUUzdTNSeE1mN2lmZ0dVaUhJeW4ySVBCUnB5amIyeVd0c3VFbHJL?=
 =?utf-8?Q?iy5Cfmf1UM2zUlO2aF+1Y4N0I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3caec77-1802-4d8e-c6a9-08dafd6315fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:58:44.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtFAwhwpz1FATcJ7Ufd9RB11aAmDIBDiWaRpwZtFJ/atW7epiIn0dk08K8MIrY+hpHsANfERCPxcqLKlERaGHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8208

On 23.01.2023 17:56, Jan Beulich wrote:
> On 23.01.2023 13:49, Jan Beulich wrote:
>> On 23.01.2023 13:30, Andrew Cooper wrote:
>>> This is a layering violation which has successfully tricked you into
>>> making a buggy patch.
>>>
>>> I'm unwilling to bet this will be the final time either...  "this file
>>> is HVM-only, therefore no PV paths enter it" is a reasonable
>>> expectation, and should be true.
>>
>> Nice abstract consideration, but would mind pointing out how you envision
>> shadow_size() to look like meeting your constraints _and_ meeting my
>> demand of no excess #ifdef-ary? The way I'm reading your reply is that
>> you ask to special case L2H _right in_ shadow_size(). Then again see also
>> my remark in the original (now known faulty) patch regarding such special
>> casing. I could of course follow that route, regardless of HVM (i.e.
>> unlike said there not just for the #else part) ...
> 
> Actually no, that remark was about the opposite (!PV32) case, so if I
> took both together, this would result:
> 
> static inline unsigned int
> shadow_size(unsigned int shadow_type)
> {
> #ifdef CONFIG_HVM
> #ifdef CONFIG_PV32
>     if ( shadow_type == SH_type_l2h_64_shadow )
>         return 1;
> #endif
>     ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
>     return sh_type_to_size[shadow_type];
> #else
> #ifndef CONFIG_PV32
>     if ( shadow_type == SH_type_l2h_64_shadow )
>         return 0;
> #endif
>     ASSERT(shadow_type < SH_type_unused);
>     return shadow_type != SH_type_none;
> #endif
> }
> 
> I think that's quite a bit worse than using sh_type_to_size[] for all
> kinds of guest uniformly when HVM=y. This
> 
> static inline unsigned int
> shadow_size(unsigned int shadow_type)
> {
>     if ( shadow_type == SH_type_l2h_64_shadow )
>         return IS_ENABLED(CONFIG_PV32);

Which might better use opt_pv32 instead, if we really were to go this route.

Jan

> #ifdef CONFIG_HVM
>     ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
>     return sh_type_to_size[shadow_type];
> #else
>     ASSERT(shadow_type < SH_type_unused);
>     return shadow_type != SH_type_none;
> #endif
> }
> 
> is also only marginally better, as we really would better avoid any
> such open-coding.
> 
> Jan
> 



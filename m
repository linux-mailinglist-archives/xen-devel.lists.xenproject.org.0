Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D3A7DB9E6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 13:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625071.973953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxRKE-00086g-Vv; Mon, 30 Oct 2023 12:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625071.973953; Mon, 30 Oct 2023 12:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxRKE-00084v-T6; Mon, 30 Oct 2023 12:24:58 +0000
Received: by outflank-mailman (input) for mailman id 625071;
 Mon, 30 Oct 2023 12:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxRKD-00084l-MI
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 12:24:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539ebc85-771f-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 13:24:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9098.eurprd04.prod.outlook.com (2603:10a6:10:2f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.15; Mon, 30 Oct
 2023 12:24:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 12:24:51 +0000
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
X-Inumbo-ID: 539ebc85-771f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br7LOpeyhcU+Qtj+6g4heXvZJjzjxXQN5SRCGg9xE3AJk3GCdPGeF7I+q7YI0K8+7mujaktstH4q0TuW2H5lqitUOQtAon/t8N2dcIiDAmEX4V2X1I8EavEB8Nrob7RVW1g/077wrDvn0HAt2aEWulfH81zT4uK5BORC0MPF1xUjY5CQV4pi9xfPh/glH6Nd3+tjk9GYrSNqWVmoNB896hRUVFvWejrKfxgWgUugtNCRbcEgkxjs1zFK3kqbX5eZ4IRLukWHyRT2KirZIwgk98TzzO2IWamcVt4SwQBiB8ynMjKMLytaX8oUobC/VWPuCYoIRAcs/of5c+Lwp+Tn4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDX9Isc5XNdumdrqiDILuxRZgB8aCLmIm5fofT8spr4=;
 b=WxjGmFt8Rgy1u0mZjEdaKTINESU7sl5c5lvvDuniFIrPJ2uQr723SJsVqWpW+bhnGraNfgxpZAYVH9rA3P5sH2qgDr5N6/KT1XEqOEFeJrwhoi47A59Uy5YhUsEdsFdx7IFDr+whnWtI+iFwTSiAw+KGf8I31NJk0/PGvDEYH0KXX4sw3CrPkgW+u8N8bwiIX/cbnT6FCtN6mkDajF+2Z/DeTUuLptQXa26IfsL7J2MMwAaJsFighvPmpLa3ARLG7jP33yRv7EdG36B1Em/Wnaw0cqntOpkESbnk9eBsdvRki18jSnmXHu2BcfJy7MnMfwnvcbgwtRwt7u+qKHMdCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDX9Isc5XNdumdrqiDILuxRZgB8aCLmIm5fofT8spr4=;
 b=c8M9kRel5NSmjtzwoFg2fHRT65COKcnliu6S7VJ2PjpCwgTtcd9cFwzSwXRmDo8IkBFhoZIFCfxiy5f65SH/3As9XActLCWx5PKcvUnCdyAshJnoYaK2Dt2NHAJziF88CyeRXfZ1/ftoCTA689qxxmVIRdsW3y+8DIytH0mPMk3gborGl0xEXnqATjqV/r/FtQpcAr6XuSsoPOMWxs24Gr+ZgdjZSA/K0S9f1qKIb3RUcMotAalDG5C700rPDGH6fOqc+mqzD9eT3VglzoOxpMgBG+KwRZKC3ie7JjMOTqyXW/2HwJfeHnL5XsNoO2jdYg357F005QHrhQLb7mh99Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3da9300-781f-9abb-158b-0c82d36228f5@suse.com>
Date: Mon, 30 Oct 2023 13:24:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com> <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com> <ZTponIYDYDWRZhzi@macbook>
 <75026813-03fe-3a46-2274-b93e98f62f89@suse.com> <ZTqDjNSBmXeblsud@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTqDjNSBmXeblsud@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4ecde6-b635-4c9c-f081-08dbd94336a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GsAbMPhCmQW3Hsy4DDdIAlg5tDvxnX9TnleTqT55jd5GvQDdFWza99L+fySC3aXzc8EvGMOnhO5c5QJxtKp79593Mjr8nrIs0W+yVprAt7Y+z2B1eZzeXzeYVly5fVjsuG+qa7rh3Q4uAKRgryHyr1S7Dl6I3l0oqUxdZTs/qg+K0xjeQ8fqD6A/jJWFSi47avTS9P4d6SRtYNdOjQtUgyKcAgfDs4++efpy7SUyedOA3VVlR14gLb75nUxzaGTaUbOxDu12+6vngEv4usyU6Q8brljLubujXeHO/V2JWUrqCjR8RArX408YufhjS0QN04aSijW5KuJa7y22vhFJUemu8U1q6ABoqHKJo30lPN2Dpa0QIEv/m4MV9WfJp8XKPUfiRbGrsQ2hNPfw0UtcnGuLJsIiVt6cnY7MK7Ok7FTAO4Qun3c7Gg/TTK65KhPY2kKnul3vw5S6vllvBHHC7urKUx9EFhoS83MiBFu1Q/3h4HmLSATR7HKCTsf9XhvTQo2E+7WRdNoHEPDlh8FOWjTkyMDfGro43WyY2/wMhunqOYAqKMDAo2mKpsRnW4D//ReCyLxhztrUZ3a67Vqh+Ui2T4fGhhSd2K0oq/1DK4RYNx2pk57YzOaYIfGUTpqMOBfjzyxSZcfm+ImxWAV+WQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(316002)(66476007)(6916009)(66556008)(54906003)(38100700002)(53546011)(6506007)(2616005)(478600001)(966005)(6486002)(66946007)(83380400001)(5660300002)(6512007)(26005)(41300700001)(4326008)(8936002)(8676002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXZuN1llWllmbkpuT0VxdE8veVNuRm4ybFVQVTBrNnpoZXZCZmwydGt4VWtQ?=
 =?utf-8?B?QmI5bHgwN0k5N01JYzJEb1hsbTRwNjdpc2NUdFQxaG83UlVnamEyN2tWM29x?=
 =?utf-8?B?TUIvWklvdCtZRGlRK1BtbWJTQ1Q2ZkdpR21ZbXgzemxITCtoUzNtbXFTaGxn?=
 =?utf-8?B?V292Sm9UYVI5dzhUNVVxak1VYXZ1dEV0aFVlM0llckZ0bUdJbC9ndUh5all4?=
 =?utf-8?B?QTFIT2gyNFZjYWVpQlRGYy9qVllzOEQxMmZTSzFZemlMR2w5TEhIT0F3bmUv?=
 =?utf-8?B?VTV3TjAwOVh0eC9hSkdwTWgvQnZRb1M2RmFvbkNHZnBIY040TGlFNDF0TVhx?=
 =?utf-8?B?Y0FNOXdxRHVyNW9Jbjd4ZlZvWDZIbXQ2am83eGhIZjZ6dElHaktINm1VSmF3?=
 =?utf-8?B?dnVpNkYrWmNzWVkrd08zMXlmUmNQVmIxbTdIdHdnSFBEV1BSME96cGNCdU1L?=
 =?utf-8?B?dDZMQVNHR2x2R2QvWi9EY0wrMDR2SXFKUklTbTZNc0s5eGRqU05VM29OeGF3?=
 =?utf-8?B?WnVPNGxHWmVhdUllMXAreHcvVkVvdnA2WFUxY3ZCa21ySURwOFFJNUJqUVN3?=
 =?utf-8?B?ajVUZ1BuVUQvZ05kckR1aTFWclNoZkV5bWRBTjh3Tit3VlV3OHBwQlJKWEFJ?=
 =?utf-8?B?ZWJIbjV5UlFsTjYrUE9Kd3BPS0xsWjVsMDQvd3p2NkhDM0xjMWRhNkZFc3Ro?=
 =?utf-8?B?SDl6eGhzZ3UycThiVnMwK0QycmVyc1MwZmtDbDBuamNSLzhBdWpnZjZHTWJt?=
 =?utf-8?B?L3VSNjdleW9VanJxZGF3QU5BbFR5ZG9ZV0xJalVaeWtub3NLYUY1RzhYbktv?=
 =?utf-8?B?TWRBQ05Sc05DYjFwR21pYkN4OXkwWmZ5QmdKNENjcVVoYUJtL1VpRkd0QXVE?=
 =?utf-8?B?V3RVL0tFVUZtWC9Pcldyc0lRNWJSVWxxcmljSks2TFduM09kdkIzeWJLZWd5?=
 =?utf-8?B?SitDM0JiN2JJemtkRVA4SkNyaXhLVEVSSjhkZXNWWUN2aTFBR1BURFB3U21B?=
 =?utf-8?B?VlZHWUlDOXZGZXVnVzdQTjFCT3RQWkc4eDdRWG9odUtMNTFmdWcrOXlzUDdk?=
 =?utf-8?B?dXZCSUhkeXFLeUtFNXZWV3ZvRkpzbTlKTkhHc2lJM1EvcWlQcStON2VGYk0y?=
 =?utf-8?B?OGFiU29EaFpUbGlZR2ppbEtIbWwxM0JOSmlwSjVBMU1GY1UvbDBObCtLV0sw?=
 =?utf-8?B?Q2ZPT2U0NG15UzJzekZacHI3cWl2MkJvNTgzM3JBNlhHS2toRm9nR2Y4Nk5G?=
 =?utf-8?B?ZE9HZTgybzRVbUsyOFZGQ0s5WC9OcTVaNHIvR0RVOXQwb2hqeXJnVTEydUpD?=
 =?utf-8?B?Qnd6dWl1VHRsTlJFRGJGZ0RWVjRUcjhvRW1seSs5ZWU0QkZoMHovbDdOMmRI?=
 =?utf-8?B?RUpvTjhOeEF0Z1FGd0l1MlhES3duVk9aYXMyT1VTeFNBSzExcGliWlVkRVJk?=
 =?utf-8?B?ZDFqZko5OVRmaVFDR0ZZNC95d282Z1Bla3p3MW1Cd2w5S3BLN29nVUdCdEU1?=
 =?utf-8?B?VklJN3VHb050Mmc5ZFN5SllJYzdnZElTRklFWXBOOHAyQ0ZaaEJ0OU5ER2tH?=
 =?utf-8?B?VVlUYmtoampzdGNJOUZXYlA4TkFNSUptaXNJZWdTM0NDOHdTWEMxTFVkNjg4?=
 =?utf-8?B?VkZXQlBQNVg0emxSbERhdGd6MHc3S1g2QldkZ2ZJUS90Y0xNRDNLM2ViVHlC?=
 =?utf-8?B?bmFsWitqQWY4L0NQLzNvK240QTRyTXJhazRFTHBQTW5JTnlJMEptYW9KMlVs?=
 =?utf-8?B?Si9VeHJuRHFhZlg1YThMY0NPYjViSFhIMG1WVy80SzBFeGlHUXJqOVF0UENU?=
 =?utf-8?B?Mk9LeStLWlJaZHJQd0d2cFF4dkNxMk00MDdZYmhzWnBxSUlhMVBVazVpODBv?=
 =?utf-8?B?S2pjUWhoamQraGw2b0ZOcXdXMTlzdDl6bjRnRWY3U0Zpb1ZBMXlaZk5FaFBK?=
 =?utf-8?B?NS9sS0ZrTFg5QnVuMldsQzRRWDN0ZG5rbXdYVzVwcS9QMm9qYkFSTXRwRGJL?=
 =?utf-8?B?b1lmVS80dWU1SXh5cTBFdnRyMU5pL0Y5akxmSFN6aUxOR3ozeWZTS0ZrUDNM?=
 =?utf-8?B?Z1AreFRwNmFTYUtIM0ozY2xleGFTUlZEOU1FMU9GQ0dDRUdZL2o1RWhaZ25R?=
 =?utf-8?Q?xOeHsohqY8pxYFRqEGeccWOzD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4ecde6-b635-4c9c-f081-08dbd94336a2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 12:24:50.9765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ua4EzjYSh2Kd5B4PB282B+J6VmJJ4a4Um7qgFOjK6EtTeYyLp7S8EU1WX3TqneE7/TinApP1Uh6i8gEHTBCSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9098

On 26.10.2023 17:19, Roger Pau Monné wrote:
> On Thu, Oct 26, 2023 at 05:07:18PM +0200, Jan Beulich wrote:
>> On 26.10.2023 15:24, Roger Pau Monné wrote:
>>> On Thu, Oct 26, 2023 at 11:03:42AM +0200, Jan Beulich wrote:
>>>> On 26.10.2023 10:34, Roger Pau Monné wrote:
>>>>> On Thu, May 11, 2023 at 02:06:46PM +0200, Jan Beulich wrote:
>>>>>> ... in order to also deny Dom0 access through the alias ports. Without
>>>>>> this it is only giving the impression of denying access to both PICs.
>>>>>> Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
>>>>>> operation later on.
>>>>>>
>>>>>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
>>>>>> from the probed alias port won't have side effects in case it does not
>>>>>> alias the respective PIC's one.
>>>>>
>>>>> I'm slightly concerned about this probing.
>>>>>
>>>>> Also I'm unsure we can fully isolate the hardware domain like this.
>>>>> Preventing access to the non-aliased ports is IMO helpful for domains
>>>>> to realize the PIT is not available, but in any case such accesses
>>>>> shouldn't happen in the first place, as dom0 must be modified to run
>>>>> in such mode.
>>>>
>>>> That's true for PV Dom0, but not necessarily for PVH. Plus by denying
>>>> access to the aliases we also guard against bugs in Dom0, if some
>>>> component thinks there's something else at those ports (as they
>>>> indeed were used for other purposes by various vendors).
>>>
>>> I think it would be safe to add a command line option to disable the
>>> probing, as we would at least like to avoid it in pvshim mode.  Maybe
>>> ut would be interesting to make it a Kconfig option so that exclusive
>>> pvshim Kconfig can avoid all this?
>>>
>>> Otherwise it will just make booting the pvshim slower.
>>
>> I've taken note to introduce such an option (not sure yet whether just
>> cmdline or also Kconfig). Still
>> - Shouldn't we already be bypassing related init logic in shim mode?
> 
> Not sure what we bypass in pvshim mode, would be good to double
> check.
> 
>> - A Kconfig option interfacing with PV_SHIM_EXCLUSIVE will collide with
>>   my patch inverting that option's sense (and renaming it), so it would
>>   be nice to have that sorted/accepted first (see
>>   https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html).
> 
> It being Andrew the one that made the request, I would like to get his
> opinion on it.  UNCONSTRAINED does seem a bit weird.

I agree that the name is odd; I couldn't think of any better one (and
this already is the result of 3 or 4 rounds of renaming). I'll be more
than happy to consider other naming suggestions. The main issue with the
present option is, just to re-state it here, that we have grown negative
dependencies on it, which is a problem.

However, meanwhile I've realized that we don't really want to tie anything
here to PV_SHIM_EXCLUSIVE, at least not directly. What we care about is
whether we _actually_ run in shim mode, i.e. also when a full-fledged
hypervisor is in use. My plan is now to have said new command line option,
which - if not specified on the command line - I'd default to !pv_shim.

> Maybe the issue is that PV_SHIM_EXCLUSIVE shouldn't have been a
> Kconfig option in the first place, and instead a specific Kconfig
> config file?
> 
> Maybe it's not possible to achieve the same using just a Kconfig
> config file.

I'm afraid I don't understand what you mean by "Kconfig config file". It
can't really be just another .../Kconfig file somewhere in the tree, as
it doesn't really matter where an option like this would be defined.

Jan


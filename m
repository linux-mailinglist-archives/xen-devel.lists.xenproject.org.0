Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF56FEBB0
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 08:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533117.829498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwzgY-0002mv-Ot; Thu, 11 May 2023 06:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533117.829498; Thu, 11 May 2023 06:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwzgY-0002kL-M5; Thu, 11 May 2023 06:21:54 +0000
Received: by outflank-mailman (input) for mailman id 533117;
 Thu, 11 May 2023 06:21:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwzgX-0002kF-KK
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 06:21:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d9be1cf-efc4-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 08:21:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9095.eurprd04.prod.outlook.com (2603:10a6:20b:446::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 06:21:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 06:21:49 +0000
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
X-Inumbo-ID: 1d9be1cf-efc4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7W+Ky0+DMEP/Kw5xz5ZplkQUaFrHyIIwyx8aTTgawe3vSvcFz/qRrjQX5X3Bed+oJHjD3u3enPLQDkbTnDIxjaxe0yIjfI4JBNAlCGpCDJ+mkwUTDYAvqqlUl1DboV1lOAWjMSAQKxB9WNvcO+aZ3Y1tQOKUluJRwgJV+sBkW1uPSKOYTIEpFaJboACYk0Zq2K2zdtnU/K6/B7BkWf4UksTax3I0lPaoYwhgJEXwrBzzYWQg+3Oqi8efg0JrocUjuQTvVtR7AdL/x6zIA48QnVdrs2Y/l6kYYrHdk/e1PSrDx75tBO7wwAKoC+q2q5x3VrW0IVcKOH5FJlihkgOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xSy4r1ApRa2RujTA9D3qOzby21+mZcddGWct3F7Ou8=;
 b=KK0Vg/QIEIQiZoBSnu2h+zYxypmjdnjkwGcUd30R3pJKOECOEa1tbg1R201Md/LPmCmD8A0lNPOXC+Y4pJG7/xo3mGVTZt7uGEU3bLoofEWpiXxBhszzVDGlTKif5Bdpk7OdPHOUWvsPbx5ZTGg+MM8mNoIS6MzNNGLmeMORY2fq+0l/QMKTFs8wJypyik3fhAh4eKsVZEpxexIHI62FuviWukefp3WEtZlfeHLmj6clj9tBGMM5yUnuEyycGETbcu8ZdyPPXeJLbo4MOUWbjoh/0cq/slW+hhv4EwTx9okBA5Ok3CpNRTUb7mNg8iuzfj4ymWDJFi7m9JVEnWIUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xSy4r1ApRa2RujTA9D3qOzby21+mZcddGWct3F7Ou8=;
 b=Nc7W6c1soEgsLv6VSTJCaQIHrzqp/YYmrPM6/QzvzdTI90LgztyL/Q58GfZKbPSsyVQUYanx3V65EhcDn+SsU8461D2qeArF6cL4RQeKLyMwmmpwoCIYv6RU16EUwbDWsSVcDKgN5JKsuaKcu0+3gv/nv0mTWsoY3GoIqehbneIyI6XKGCp+4f6608qM3Z1CKwJnfmYKK9o0/4gDsB7n6bqcqDXoV3lcuWfDU8uUDZblLDosWugfo+u4rs8wf7Www48g4/g39pI+C6Jp7A3kCEJBc/87mfxxnnmI0opkUiSh500x6ZxCuEKE5WNDfepnJKeP85xrmf+tRg5ub3aGRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80ccf9c7-5d22-b368-dac6-01fe6cec7add@suse.com>
Date: Thu, 11 May 2023 08:21:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to
 userspace
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-8-jandryuk@gmail.com>
 <7db38688-1233-bc16-03f3-7afdc3394054@suse.com>
 <9cf71407-6209-296a-489a-9732b1928246@suse.com>
 <CAKf6xptOf7eSzstzjfbbSU0tMBpNjtPEwt2uNzj=2TucrgFRiA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xptOf7eSzstzjfbbSU0tMBpNjtPEwt2uNzj=2TucrgFRiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: a376ab8f-a4e9-41a0-ae9c-08db51e800c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8wKG5l3kFI3mcwdriiCCbJpM42EaF9DwyragNL9iu7fPIJ7pmk5cQnh52UxlbP2FOUhngWBVkW3tu6sJ8mc0WHHmHNSerU4iC0pJJ96H5zSA7JbADXsR3/7Yd5Z09oh4t5XnWT6Xh3MDLZJowcMAOTn/qRsysmeWsRNRG9hTqM1ueoKfZ5Sa5vZUduSNs6WMY+uGT0Ajpa707f8Fga2cxHmyvS2S3eaTqbR87n9+xf215eZS/48pf0kqgfWEXAgTCjGzxJBaEMn2tkJjxFmFD0KIKZvP5FhqGcM4lFsXBWaPqH1tPrNQ0q+lBt2BtNwPi1Xyy3IBS+YL/eV+Iz28+0r+Re++PniUHhMvO0b+Zdn/m0jaFQWS1v24xQCi98io/sZ22RGFLRf8mEK0byqx1rJ7AeIlRSlVEQl/21XWTux6J+ZqzgVHUSYgIEaQcxAjWPNIWpGfxy+VEvKmOaVdKE+P8RUO0CnI9Vx3JGkS91XY/mHsTT5U9QFhTaoQcoDgxfuOaSYM38546lH+NgGbdKDxfLbP/teyjG8naLZuZj7ApWAI/8eO/4GM+o4Hkjrn8Ep93MQHSykIKy5qCPKPIygZZ0xq5PHxLluCosg5emQB/sV3zISVksDXhRGmMxkB5/WAh2miBCWYLS+YGfp72w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(31686004)(66899021)(66556008)(66946007)(6916009)(66476007)(478600001)(6486002)(6666004)(54906003)(316002)(86362001)(36756003)(4326008)(31696002)(83380400001)(2616005)(6506007)(2906002)(6512007)(53546011)(26005)(8936002)(8676002)(5660300002)(41300700001)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzBMT3IycDBtQlVlc2g2NDZ3czZkZGNuK1ViUHdJRmlaajFtSEJPTXIwcS9u?=
 =?utf-8?B?aVZucGNkQ3M4RkVtallNNFgvRTdWdC8zYkR0eTJZVVpoNS9CZng3MTBFMHcz?=
 =?utf-8?B?REluR09sZnIrMjJxMzRGRmZJcVBwOTR0aTJGaWlnMGw5a0xWVmdYaXFqdEds?=
 =?utf-8?B?L2llZURKKy9OMFpDUXFzcldCRzRDM2J3YjZVUEdPcGVic0o0ekZra04yMGY5?=
 =?utf-8?B?ZFRhUDFYOVpJRHBiUUtsa2Z1d1F4VkkzYkNYZ3JIekJ1UTJZRmo5TjdKcEFV?=
 =?utf-8?B?b1g1Y3hUQ21IZzNVK2RzcUo5RFhOQ1NhQ2ZJaEphUHNtWlNFUUUwVmVaUndp?=
 =?utf-8?B?ZHNHTkxpT1VkM0lnUTQrU2JwUWY2YVJ6aTR0ajlNUlUzSnFGT0M4YTFEQkxn?=
 =?utf-8?B?cFp2TlBzcnNQSXJJRVhmNGl5RXRha3FYOW5oQjVFZ2MwYzlmZFJET25oVCtq?=
 =?utf-8?B?M05xZHhSd1lEQmJWQU9YalpxUGJsMDI5YytNenlYTG1BTFlzV01YOHpieG9a?=
 =?utf-8?B?SC9RWlFUM0lnREdZOWF4QytVSlhKS3lXemswdUZlaHZtTlM5alFQalFuMXlo?=
 =?utf-8?B?dVRPdCtjdXg1aCtYVGJsWmNhZjVJY0c4eEVicUs4SVBLcEwxdE05dmhybHc2?=
 =?utf-8?B?cmVPdlBoNXkrQkpHMjNXbFZOZmhnOXRnQTlSTWtUR3dhQm9PUG1HRU9kYmly?=
 =?utf-8?B?dFRpRHlFN0hpb3A5UWlENVNrMW91dFZ6RmpqVWtIU21TSWg5Q3U3b2Z3MEdE?=
 =?utf-8?B?dVRubEk2QmNCKzh6ZzJMTFhGa3dUbXVlWDMyRmpkQXdid3J0Wm9jdWFaOG5k?=
 =?utf-8?B?NjJUTVhQdTlZSDlCbTI4LzlsVVc0MkdXcjgxc2RvSDVrTTdNRXI5RzdFcTNz?=
 =?utf-8?B?T0JueHJzWVVmdFJnRmdxQ1pTcTg4dFYvSFR5cm82Y2NTQnkyNFlTcExHejRK?=
 =?utf-8?B?eHZkL0EvbXZ3Wm1RdzJsVXMzaXdLTWk5cDdmQnRJeGhPdWpjRytNMzVFdDJx?=
 =?utf-8?B?REVPaG5GSWo1VEtid0ZxQ3lkNGUrcHVRZFZEdFlzOW9aQVh4Z2tGNDVtYlQv?=
 =?utf-8?B?MXVGMUJlQmEyNlI4cktvRDUvaE5BYjhWQkg2ZmJBWDdSM2JnWTFpUkxhbDhm?=
 =?utf-8?B?OGtkODFIS0dtVXRTMWdRZWVqL3lhbXVXSzhVejA0MHh2M2NNaU1rZldrV3F5?=
 =?utf-8?B?UjJRVEU4VWt6VU8zVTZrMDFPRm9tL04xdFkwN1BNNEdlQkVVTTF1V3g0ekpT?=
 =?utf-8?B?dEpQTmVlVnY4RTBHOHE0WldUVEhDSUNvY0EyWTJpcThvWVVOakxweStPQjBF?=
 =?utf-8?B?amZBVkpaSFB3azd6M0IxTHlPNHZYaGxMNDhUdGZSSzJNVHVRNXdKMGhSRS9l?=
 =?utf-8?B?REg3YnF4YW5kQUhiaXNzOVpzZnhrc3NwemdzYWlTNzhsMXgvOEJzaEtpeXQ0?=
 =?utf-8?B?dzZ5S2trN25nQlBhUnlTY2VaNFF3UTBKdmlZcm1oS01qeVExbThzSEUxRFJR?=
 =?utf-8?B?OWJac2t6TGFQNnhXM25DbVJnNTcwUy9jUysxNzhGQUZoNTdDVU1sVFcwcHZs?=
 =?utf-8?B?RXczN1FRcmZ6SFpaeU9JR2R3UXNnQ2ZpbnRrMGRGNTZlaEVOS1lBMnc2RTJZ?=
 =?utf-8?B?b0FSVlZBY1VNd3NZdk91MkU4andLSy9HS0M1Ty9lck1MMUtLdWJnbVkwMWhl?=
 =?utf-8?B?eDVUYlI0d3F1KzgwdjgrU2FDeFlCMmduQVVtQmFGQnFJOFNPNER4UzFqSTNo?=
 =?utf-8?B?b05jZy9UTkRIY2tRTTBra2N3MVgxY1ZwcXpucng4MHBwQTIyWHFvVDNVMEto?=
 =?utf-8?B?Mnc3QzVzamEvNjJaUzNhbnJ4WnZIYkRnY09vY09NYm1JLzBoS0J5ZTh5UEkr?=
 =?utf-8?B?OWtvaFB4TzZZNjNIdFh1VGdBSVZsWTRnRlBWeGdaYlRPdDkwbjUvNFNLVGdP?=
 =?utf-8?B?TmxqUmMzSGdBaDJpUEdIblFPZUh6ZkIyY2NWQldXNkppMzgzOW5FRHlpN2pC?=
 =?utf-8?B?LzFvTkxaMkV5T05SK0VUeG5SZkhNclVsankvZU1SNHNRQlUveW1wMUhFdll3?=
 =?utf-8?B?Mkp6VCtSNFRyczl2anl6VGoxRmNrWDJvKzBrVnVvTjZHSHhXMmx3MXU1WHFv?=
 =?utf-8?Q?QIRiUhyEPV+i8eLfYBZ7EGwQP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a376ab8f-a4e9-41a0-ae9c-08db51e800c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 06:21:49.1588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQJRbL11fruAqd9F0wXM4hCtSJXRHj/bzPb1S0R+NxPbuOzELH9p2Kl6JAPGc1PxyG/vqT/7npbQDFkWDkAlXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9095

On 10.05.2023 19:49, Jason Andryuk wrote:
> On Mon, May 8, 2023 at 6:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>> Extend xen_get_cpufreq_para to return hwp parameters.  These match the
>>> hardware rather closely.
>>>
>>> We need the features bitmask to indicated fields supported by the actual
>>> hardware.
>>>
>>> The use of uint8_t parameters matches the hardware size.  uint32_t
>>> entries grows the sysctl_t past the build assertion in setup.c.  The
>>> uint8_t ranges are supported across multiple generations, so hopefully
>>> they won't change.
>>
>> Still it feels a little odd for values to be this narrow. Aiui the
>> scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
>> used by HWP. So you could widen the union in struct
>> xen_get_cpufreq_para (in a binary but not necessarily source compatible
>> manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddly
>> placed scaling_cur_freq could be included as well ...
> 
> The values are narrow, but they match the hardware.  It works for HWP,
> so there is no need to change at this time AFAICT.
> 
> Do you want me to make this change?

Well, much depends on what these 8-bit values actually express (I did
raise this question in one of the replies to your patches, as I wasn't
able to find anything in the SDM). That'll then hopefully allow to
make some educated prediction on on how likely it is that a future
variant of hwp would want to widen them. (Was it energy_perf that went
from 4 to 8 bits at some point, which you even comment upon in the
public header?)

> On Mon, May 8, 2023 at 6:47 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.05.2023 12:25, Jan Beulich wrote:
>>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>>> Extend xen_get_cpufreq_para to return hwp parameters.  These match the
>>>> hardware rather closely.
>>>>
>>>> We need the features bitmask to indicated fields supported by the actual
>>>> hardware.
>>>>
>>>> The use of uint8_t parameters matches the hardware size.  uint32_t
>>>> entries grows the sysctl_t past the build assertion in setup.c.  The
>>>> uint8_t ranges are supported across multiple generations, so hopefully
>>>> they won't change.
>>>
>>> Still it feels a little odd for values to be this narrow. Aiui the
>>> scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
>>> used by HWP. So you could widen the union in struct
>>> xen_get_cpufreq_para (in a binary but not necessarily source compatible
>>> manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddly
>>> placed scaling_cur_freq could be included as well ...
>>
>> Having seen patch 9 now as well, I wonder whether here (or in a separate
>> patch) you don't want to limit providing inapplicable data (for example
>> not filling *scaling_available_governors would even avoid an allocation,
>> thus removing a possible reason for failure), while there (or again in a
>> separate patch) you'd also limit what the tool reports (inapplicable
>> output causes confusion / questions at best).
> 
> The xenpm output only shows relevant information:
> 
> # xenpm get-cpufreq-para 11
> cpu id               : 11
> affected_cpus        : 11
> cpuinfo frequency    : base [1600000] max [4900000]
> scaling_driver       : hwp-cpufreq
> scaling_avail_gov    : hwp
> current_governor     : hwp
> hwp variables        :
>   hardware limits    : lowest [1] most_efficient [11]
>                      : guaranteed [11] highest [49]
>   configured limits  : min [1] max [255] energy_perf [128]
>                      : activity_window [0 hardware selected]
>                      : desired [0 hw autonomous]
> turbo mode           : enabled
> 
> The scaling_*_freq values, policy->{min,max,cur} are filled in with
> base, max and 0 in hwp_get_cpu_speeds(), so it's not totally invalid
> values being returned.  The governor registration restricting to only
> internal governors when HWP is active means it only has the single
> governor.  I think it's okay as-is, but let me know if you want
> something changed.

Well, the main connection here was to the possible overloading of
space in the sysctl struct, by widening what the union covers. That
can of course only be done for fields which don't convey useful data.
If we go without the further overloading, I guess we can for now leave
the tool as you have it, and deal with possible tidying later on.

Jan


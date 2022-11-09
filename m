Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8346227CB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 10:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440787.694969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshqa-0007Oo-Al; Wed, 09 Nov 2022 09:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440787.694969; Wed, 09 Nov 2022 09:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshqa-0007Lx-6h; Wed, 09 Nov 2022 09:58:16 +0000
Received: by outflank-mailman (input) for mailman id 440787;
 Wed, 09 Nov 2022 09:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oshqY-0007Lq-Jq
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 09:58:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e41db74a-6014-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 10:57:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7650.eurprd04.prod.outlook.com (2603:10a6:20b:281::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 9 Nov
 2022 09:58:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 09:58:11 +0000
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
X-Inumbo-ID: e41db74a-6014-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLfYGIdTNKwgRpN6o1fEyYCIRrN3McCYqbAvUlE/cz7X3ZjRwvT3s2XHBseKtfpgMMdBKQ+K4zAl3bneSEo8wawd3ijhiiUUOzNFscfgDKzw6lNcP8gmOWYp2ut7otpRHt1GYbqi2n+OJYihRwSHtSifnulaV//+XMTgjXLgmc7IsqEAhnlVeFh/oUWoZI/TbDN633Z8SWznWq7VwN6gHRfNomJRjsYwyNREe5Z/pKNipBpWA7XdqQ93mQWecrmOoFZTuyIeT5yy81mhS/MOrb+/BiEveN+rIMyZnRdanCagJlx2ISWr+FpFnsiCjOlZndV/WoYs4SgCxiaENGyNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzCST69uBHrwmMjnwqRwykHt4WvodA0N+auO43+NDAg=;
 b=k8gbVXEnigynhGz7LFUPLecJNoEX6F+5VszUErLXJu5aIwYrH5Zg6qSLzTPIkCp7MGb4rPVSQgd2CaLnwFu13w/KWs1nrtlfIcbeHB21NKZcOeK6k69LPhW2BlR8RuBoxWJeOerZWsiHaBdJrM8eF9hWofnZq2g/TaKsJLHW9gh7KvVCkovVsJd89JItTjFoOyKyqwVLOOJNr92TuxoQ/2rEj5DCsZRvZR2l1FI1bol78IKzbH0rn6Xwebot4qtfkbMHIdRxN6kf6g5ZQjUvz6D4w9Bj7UZ6zQa6GuPdrIsm3xbyk02pkPN5k2PRKNqF1XtjxCDdC9YvZdG2FJcq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzCST69uBHrwmMjnwqRwykHt4WvodA0N+auO43+NDAg=;
 b=Y/gbFKFB/KtTDwDJgwJkJxZTc1q2HKS9jSfa/DqDH5aAkJYybHM1TjIeaTgRnzRkfkKigCDymBLm5aQl0aboyynaU0yRYFfalMbnX0cqox+QpxFBMCnW25LuBQxXAp5S4Q+qa6s5ZB40823agaLOeaU632AMX8qEeHOTVe/uRGSuiB+ZKjd8Bf8IYfxLrTF5wNs4Pr/7u+gDEppLEnH4qxKME9gV8EXkE+P7GAKfjXveXvPMVrejr6f0ceJ6/MPWehFfdt1uzKl/OsQyGVwMhgMvky+mkr2kUmE8bNkGtyFUPY7PGt/1OxytrHbU+eXQ1hmf7BZoYWgFjquJdgn/MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c99778b-d1c4-d714-de61-dc6b7bea27f3@suse.com>
Date: Wed, 9 Nov 2022 10:58:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Content-Language: en-US
To: Edwin Torok <edvin.torok@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
 <Y2qOtSyuM43RfwAx@Air-de-Roger>
 <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
 <66BC7155-FDCC-4095-9F4B-278ECF2DE7CF@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66BC7155-FDCC-4095-9F4B-278ECF2DE7CF@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5deba1-a3b6-45e6-f96e-08dac238e8fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	txxLyvVJL+bxqGM5P6tL2f/C2qhqKn3TQnwKkbt3Ywp8p48FXNk3VRWO5UZHM9UXcu/vtrhY19X1/eJQUKRw6meZhjVCmVYi2zcp2gFFrZ0ZgJpnBNY0AD3hf9uOy8VW/s5onUEj72CG7xmXZ7Q+K3LJTSrhYxPGKcoYGR7Qzvjdh/BwbV0sB7uHlpTz+cGgtG6IkCnFECQwp33MQb2Ktwo59auUlBfde7CGA3xbPgUo7DP+t30xRjrqeBf5JZnrwIodMSfWVnsLVFLsSNqX2agauJ0SxQmqlU7/3u523pKjHF9LjUbvwagNRahqNFLGSF2QuM1zRFGThnzPwquJmcbBhDunCdu8DC0IN5oh1nDGdBcHI4Nj8iW//CPeM2KtHOSbIBMLXAKm7aKmtlBwTCI45Fzm9+1hXCJrvApUwc5GTQueTeArd06ZZHGF2R/L2N21DC2FVCsQhDlEIXS7ym3yd8nyTEwZ2NwCXKa/r1TNyvzMjz4DQNc/ztqp/DuPvatGANYxBGpIOsefuJ1xZES9o01qkqCta9U03TVGcphx/HhPrxD5/b2jiS2hO0sV8GYoMGnrRq29j0tgbWG9S6R2wk3VUBbOVFLt9ZBDJ1z2lkB9CGkAVWzaqMj1GQj2PJEMC/vBy/bQ8dHj8DlYRWp0I4BD/5+NwqEB3LxhrSP7DQG+fEl0zW0P1Tpf+2kDR4OVcJckJuPqMtVy6nFJNcDA84zpsqPgTcz0qGRMm8xWEGfg5tNK3+Z9M6DHvjzp2IK+6WWFNPiWphtVQelrf/2p0pmvsvTorA7R2OPUQsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199015)(31686004)(86362001)(26005)(41300700001)(6512007)(478600001)(38100700002)(6506007)(2906002)(36756003)(2616005)(186003)(8936002)(8676002)(5660300002)(4326008)(31696002)(54906003)(66476007)(6486002)(6916009)(316002)(66556008)(83380400001)(53546011)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXJiMDJpQXJDbjZucmhJcTNaWTNpWWY2Mm5lZllTSDl2NDJiV1hNNkE3STNx?=
 =?utf-8?B?cElsNm85OE1pT2tYQTFDNEMyVXUvTC9vZjgyaWpuVmtMWGV3MkNaT3Vub0NX?=
 =?utf-8?B?OEdlVW9FR1UvRkhCUnFDRFdYRjVDVG91bXRvVlQ3cnBkSVo5MnYrUG9DNlVG?=
 =?utf-8?B?V09XWVErRHl3MW1wYmJQeGdmR2l1OXFvdk51d2c5emRUV1RyV2ZhMCt2bFFn?=
 =?utf-8?B?Ylg3TXJBVlJtazJaNEtLeDk2KzZ5S29sc2hJRHZwcFRXMFQ2ZkxpZEdMdm9j?=
 =?utf-8?B?bU5EMFp5ejRDODJFNEFCRDNTcDVVemo4aWF1QTBhUkdEN2IvbVhYWnBxRHQz?=
 =?utf-8?B?K3ptVVovSzFabzNkRGJzSllQUmp4ZHNhWkpDdGRkb094WGZoRG9Belc4bjZz?=
 =?utf-8?B?YmRLOWx4U241ZGNsREtBemhkMGxwS3VITUFYZDNWM3BHMXZzSG1FMHowZ0JR?=
 =?utf-8?B?Y0NHQndGTVc1UjNZZjIxZG5uRVpLRzgyZXVhSG92ZkVGK24wQmorM0dGT01W?=
 =?utf-8?B?QWY0elQ5QUpoT29HUUtFWmU4THVMNFBuYmFqZGNJZ0xsdGhZUjhjc0NrbEpY?=
 =?utf-8?B?TEE3dHdWRTIrOGZaY05IWkI5Q1o3SmFBNnpOY2NzT0JxMVZJcGs2Z1BJelJD?=
 =?utf-8?B?UTJ2UnQ0dHozOW40c01MekkwK3pYbXlod0lTc28xMFF0UTlvSDFrY0xuZG5v?=
 =?utf-8?B?TzlMWldjOXNLK2dPeEFkQ3FUYVZwZ0VlWVlmYXgzOVA5QksySDgwSkxwM0U5?=
 =?utf-8?B?YTBwcHVaMk1kK0tOdG9KY0YvTk83WEYvbTVvdlFPL1VtWWxhMEx2Vis0S1JL?=
 =?utf-8?B?bytrNkJTbzNLR1lWenVKR3NqSUdLVlZZTERaakhyMkkrVExHUUhnNWlmN3pV?=
 =?utf-8?B?RG1sYUNOQlptUllmWUxWYmRsVGZOUmovNHUwcnFicDAzeEsyRHJBK21LeDU2?=
 =?utf-8?B?Qm9PWmJ0MDhDbXpQb0NuOHkrTnlYNmdIQXErRitISk90ZzNGQ1FZc0NNVW13?=
 =?utf-8?B?MU9wRUxNY1pWaTdOTnZEZXlGbG9YeG5TVFNHTnJtTm1Id3h5elQ0NVUvQkVQ?=
 =?utf-8?B?d3NGZDlKUjhTVlZkb0VxM1V5ajZrbkloUzc4cmkyS3NxWDVEZGErWFl1UmtD?=
 =?utf-8?B?dk9UVWo5V2I1UTNoNnJzUEphbVBmYnd4WXNyT3pKRjUySm9yUnFEcjJuSkZx?=
 =?utf-8?B?bDVRUHNOaExBaFk5WWQyMHZkSm1GbDBkdzlqSEV1QkZLY3oxWUFQeERHRkFU?=
 =?utf-8?B?Z2lialFMR0lEd2tueGRGZGlVeW81RGxNYUZxNDYxcE9JQisvQU9QemQySjZs?=
 =?utf-8?B?bDFrQTZvM3VDUURabjJweThpUU9Zb1M5Q3RpMUZqQ3hIRHo5c0VzbzNCWEs2?=
 =?utf-8?B?b0Y1eExId3Z0Q2RCM0Y2RVlibmNrRXF1R0JEQkR6WmpYTjJSVWVWZE9rNStw?=
 =?utf-8?B?SXBCYmFWaTZ2azVQL0NkeUk2UW5ONzRDT2pTSmVRTzR5R3VBR1hDVkFLdDNH?=
 =?utf-8?B?MXVLUGVjYXhoam1sZVpsc3hseDdIWGZxRUQvNk53QTd2T2pJM09DVFF2SHpm?=
 =?utf-8?B?R24xNCt5cVlIRjdRdjlPZHNhYzVXR1Nobm1iSW0zQlBUa3F2VVdCQktnaDFZ?=
 =?utf-8?B?citIL0RiNmRVUHZDMjUrMUV6ZnNrNnJPZ3p6Q0FmNVAzU2FSNlJuVkFqTU1I?=
 =?utf-8?B?c2NtcEphTzloQ2MxZFRCZGZrT3dxRGxhZksvejNaT3FoWUtrenl3emhDVGs4?=
 =?utf-8?B?c1JjU3k1VzhEZUM0STB2bDFZNzhReUU5MW9GZkcwTzd2VnMwbzYwTE1GNWZD?=
 =?utf-8?B?U1ZCbWlId3lRb2RGRlRLcWUwcHJPbjc3VGhlblVaSXJ6OFVDSUFpbXpBd082?=
 =?utf-8?B?SGVPWWl4UWVpS1ZsOVpjdTBQR2hJNXlNOTNxem9vMzd0MGtKMlNjblExVXZw?=
 =?utf-8?B?S0JqUlBRTTNsSmlwRDNCTEUvWjAzcndLa1ZSQ0x5cVR4MHpiemNvWkhjNGJ3?=
 =?utf-8?B?TUZORmV5M0trKzZSWFd1c1lPSno1bmV2RTJlVEZtOGJUVS9DWUpBNUZyVHI1?=
 =?utf-8?B?Mys2dzRJQWRlNUx1dVlGWEkyRWlWR3F3aGF6LzZoVlB2eDAzZFVVdDhDVDUw?=
 =?utf-8?Q?acxsnSVYI3k56qIuTJd3mCf11?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5deba1-a3b6-45e6-f96e-08dac238e8fa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 09:58:11.1252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBWw4ttQohoLbvW1QqY1mG6zV4xVnkbubwNC67iri24ur2hX0K67HbV5wwEosTfcEQYuM2DEOUDiYxDZcWEVmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7650

On 09.11.2022 10:45, Edwin Torok wrote:
>> On 9 Nov 2022, at 07:48, Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.11.2022 18:15, Roger Pau Monné wrote:
>>> On Tue, Nov 08, 2022 at 06:03:54PM +0100, Jan Beulich wrote:
>>>> On 08.11.2022 17:43, Roger Pau Monné wrote:
>>>>> On Tue, Nov 08, 2022 at 05:14:40PM +0100, Jan Beulich wrote:
>>>>>> On 08.11.2022 12:38, Roger Pau Monne wrote:
>>>>>>> Like on the Arm side, return -EINVAL when attempting to do a p2m
>>>>>>> operation on dying domains.
>>>>>>>
>>>>>>> The current logic returns 0 and leaves the domctl parameter
>>>>>>> uninitialized for any parameter fetching operations (like the
>>>>>>> GET_ALLOCATION operation), which is not helpful from a toolstack point
>>>>>>> of view, because there's no indication that the data hasn't been
>>>>>>> fetched.
>>>>>>
>>>>>> While I can see how the present behavior is problematic when it comes
>>>>>> to consuming supposedly returned data, ...
>>>>>>
>>>>>>> --- a/xen/arch/x86/mm/paging.c
>>>>>>> +++ b/xen/arch/x86/mm/paging.c
>>>>>>> @@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
>>>>>>>
>>>>>>>     if ( unlikely(d->is_dying) )
>>>>>>>     {
>>>>>>> -        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n",
>>>>>>> +        gdprintk(XENLOG_INFO,
>>>>>>> +                 "Tried to do a paging domctl op on dying domain %u\n",
>>>>>>>                  d->domain_id);
>>>>>>> -        return 0;
>>>>>>> +        return -EINVAL;
>>>>>>>     }
>>>>>>
>>>>>> ... going from "success" to "failure" here has a meaningful risk of
>>>>>> regressing callers. It is my understanding that it was deliberate to
>>>>>> mimic success in this case (without meaning to assign "good" or "bad"
>>>>>> to that decision).
>>>>>
>>>>> I would assume that was the original intention, yes, albeit the commit
>>>>> message doesn't go into details about why mimicking success is
>>>>> required, it's very well possible the code relying on this was xend.
>>>>
>>>> Quite possible, but you never know who else has cloned code from there.
>>>>
>>>>>> Can you instead fill the data to be returned in
>>>>>> some simple enough way? I assume a mere memset() isn't going to be
>>>>>> good enough, though (albeit public/domctl.h doesn't explicitly name
>>>>>> any input-only fields, so it may not be necessary to preserve
>>>>>> anything). Maybe zeroing ->mb and ->stats would do?
>>>>>
>>>>> Hm, it still feels kind of wrong.  We do return errors elsewhere for
>>>>> operations attempted against dying domains, and that seems all fine,
>>>>> not sure why paging operations need to be different in this regard.
>>>>> Arm does also return -EINVAL in that case.
>>>>>
>>>>> So what about postponing this change to 4.18 in order to avoid
>>>>> surprises, but then taking it in its current form at the start of the
>>>>> development window, as to have time to detect any issues?
>>>>
>>>> Maybe, but to be honest I'm not convinced. Arm can't really be taken
>>>> for comparison, since the op is pretty new there iirc.
>>>
>>> Indeed, but the tools code paths are likely shared between x86 and
>>> Arm, as the hypercalls are the same.
>>
>> On x86 we have both xc_shadow_control() and (functional)
>> xc_logdirty_control(); on Arm only the former is used, while the latter
>> would also be impacted by your change. Plus you're not accounting for
>> external tool stacks (like xend would be if anyone had cared to forward
>> port it, when - as you said earlier - the suspicion is that the original
>> change was made to "please" xend).
> 
> I don't see how returning random uninitialised data (current behaviour) or wrong data (all zeroes) is better than returning an explicit error code.

I didn't say anything like that. What I did say is that we cannot lightly
move from "success" to "failure".

> And even this change happens to break some code, it'd do so with a clear error code and in a reproducible way, and then such breakage can be easily fixed in the affected piece of code
> (e.g. a toolstack other than XAPI which was not looking for errors from this domctl call)

My experience with error messages (including the conveying of error codes)
by the tool stack is rather poor. I also dare to question the
"reproducible" aspect: The main risk I see here is with a multi-threaded
tool stack where one thread hasn't become / been made properly aware of
another one being in the process of cleaning up after a domain. Its racy
issuing of further domctl-s may very well not be nicely reproducible.

> AFAICT XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION is only used in the OCaml C stubs (i.e. used XAPI/xenopsd) which always checks return value
> and raises OCaml exception and in python lowlevel libs, which checks return value and raises python exception.

But XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION isn't the only sub-op affected here,
is it?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55287CBFF7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 11:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618179.961520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgmz-0007Pr-N9; Tue, 17 Oct 2023 09:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618179.961520; Tue, 17 Oct 2023 09:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgmz-0007ND-KJ; Tue, 17 Oct 2023 09:55:01 +0000
Received: by outflank-mailman (input) for mailman id 618179;
 Tue, 17 Oct 2023 09:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsgmy-0007N7-BL
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 09:55:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ad4a61d-6cd3-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 11:54:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9673.eurprd04.prod.outlook.com (2603:10a6:10:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 09:54:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 09:54:55 +0000
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
X-Inumbo-ID: 3ad4a61d-6cd3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXvfdLDvy5Ps9qVtSQidTp0XM+ffj2Cq3XvcPrrGDTTsirBmuVT/cK7kbmD5yQ0bOGWX/5tvd2NamSGoi65KnDSIIBmsU9sG7m+HrcOHkz4SV8yQnjewL8QW00dFJFXJOZGlvF604UewghDlJElv8V0a8Or0e002aOjj65cUNoFi/phztiHVfSW5idawyE3ABK/Va3lUN9K4E08kUH1Tvi14iBgR9GLMHUlBNQjDjMkj8CM5Qlpj3D0LMiGg4Gk8xWrMpvP0qvUkJqgSxOExMi2zuUEDYrafHQIp2ztbhxet2yVZ4Wh9r079fa+AhMMJwN840Ajd6Jm9d7ZzFqNZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1QI2Vb1VDClnBA7T2LPT5pPhFqqW4bRTgWouuRdCc0=;
 b=eD+XvZtuOLMMyCzeF0fmPKc7lLxxr8CWQvS6A9h9g/IkFCUfAl8JAdfrpNLpmGhD+D6jlCHFfzlVavJn8mXHomcQxgcrwbXnOeNg3aN696IYoLI+pabpRt5skUeURFvWPg+xX88XArO4RIMs/cwMwHG64x4HjGV0Ztf8lxBB60pWD7HP0ys9uDvarShD+5pbDQI0Cx3cZYhGq1DaPmJDZ7ai0C6eM2upGAXUyUL8hrTgg9T0XW50X7lqh3Npw/3s2HVSXhSaKVLlzDkbLreZfxgwDNA+CnWNcZUMlaID9K+RuNnoSTNCZyErwdrA/tMRUUTTTtZNY8J7JZm9AslSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1QI2Vb1VDClnBA7T2LPT5pPhFqqW4bRTgWouuRdCc0=;
 b=nsYbF8ADkInSx40MuUiSPUQShjrnOhq7EsflRXt06Zrt2+n43S59ITXfh5CWDxrNH76zNcnsOGTDWEULlK0vFf6HtNasG+5U9+MGkWrplAdfE4jNayDDYS4FBgq6YHppFpvBC87TXZMhFCWjdzWidtFqZX4v61UstM1OQnIMKHlzdDV8FBPTQ8lpdZzGxmNMnosWY/H3xfBvTFWL/ynYtTUY1rRSd1KL/vv+Zwrxpzr334PQ6fsirdPxTxvSjNecLXXEFEDGf7UcqOBzDpnlSC40d6d5hNeb2oShVXvSWuj1fiZHvUw5lOi0dzvb6bEwwxRfBrkRfYrYmt7RIpxt5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26c5caa2-fe17-e107-7732-e4221861d804@suse.com>
Date: Tue, 17 Oct 2023 11:54:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next v2 6/8] x86/mce: Move MC_NCLASSES into the
 enum mctelem_class
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
 <f1f0fc3c-0eb2-81d6-132c-d6b2ed2d7308@suse.com>
 <d417da49a926fec385c95774035dc4cb@bugseng.com>
 <172b1f70-bffb-125f-3181-38ce5989daec@suse.com>
 <831edadc894659a79f7689dfe384ba97@bugseng.com>
 <59692ac7-8b68-5913-8e51-0a68feb2a1bc@suse.com>
 <b9177bf523d36df16b9fc3d116e0e89d@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b9177bf523d36df16b9fc3d116e0e89d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 52da0d01-9a8a-44ff-b650-08dbcef71d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E2PX83WwA6+ohP50t31zh2HcS23rZ4X7ucZzeF8+ZiGWzW7NdigJ5jLUIsyblYu7ewt59QzzIuaFTzuHDnigm7ngv9F8bh6XEY2ah8DQMv3u6nltKJGUhFgywB6UUkRI6xkC12ZquDhvEKZW1deE+IEIAOLDv7sFLAPr+afb5RWZEywfEq/WYhbaphmZzeHmHkO+6l6QYSEedfzkl3lxXHu0gkupHsCWeMHfmxtCpcJMLfZIPUXxZ9ZSAQJZxtVLHLT4pqcuUKLmT31sy6ci0ehc+aNLpaja8NxtMkCsfqqEGvkHMA1ENYogDt3hEtmARRo+RGw83pvlvm7K/iwgroDU9k7x+qJdEQwCy3hskcU0Xs3/gNQipQTjf5PmT3SsVrFznewoQaj/APzoiNk49N4Wld+Q4BSC8v3RyZGfI0LEHxKM9c55ciR5Rzgz1/RTLMMhzOe3EoGP3EWv0X2r9GM2bLRELW3k24pJ/pmJY2Db4GPxHuWtSp+A5ZZMut6e2gJaqtcHKdwRd0uVRVYACR0am+7ytcyu3p8PKL8tb/uQafkXAhXTRpnyClHJAOgLHpd6XBnjeEcdjxWLiS4gTvaER8LPfKEj23UeqtgnIK1I0gX/GPXDF1WeRCUUM+9nYz1ilMpoP/F1PF22JAwYYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(66899024)(6512007)(53546011)(6666004)(478600001)(6506007)(6486002)(86362001)(38100700002)(31696002)(36756003)(2906002)(7416002)(54906003)(83380400001)(26005)(2616005)(8676002)(66476007)(66556008)(8936002)(5660300002)(66946007)(4326008)(316002)(41300700001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0dXR09OOTU2L0RCVmVMWFVSblY1YUpXWU44UjArRGVrQmpJSVhOaE94R0hC?=
 =?utf-8?B?YWN3U251bk5kUUdJR0dIWXY3WjVGanRpSzcxUTM2M3E5cllTbUl4S2ZnM2Mw?=
 =?utf-8?B?NnpMRHgwMDBZZk1LeE16c2dNSjJkbmY4QVFmSmZZZXpHcUEvd2xxblRvVCtm?=
 =?utf-8?B?V3ptK2wwK1ova3BUbmtMRzF5ME0xM1gzQ0IzNThldDZtOUpWWlVtLzN2dU9M?=
 =?utf-8?B?T0lVZm51ck1Qakt0c21jQk1YSXlKU1ZhdTNTYnp1UndubGRsVTNQS3hDYkkv?=
 =?utf-8?B?ejZvMDlMZGE0TFJHZDUyNFMrVVcwRE15U0tDbnFjOU9ZTU1pYVdWcjFzaTZQ?=
 =?utf-8?B?YWlTelNXQTlJaDA0cG5COE10d2R4K3FLS2xHTU1xcGd6OE5XY1AxdXNka0JP?=
 =?utf-8?B?bEE3NTZhS1NJYUJRcHhKUThkWGNHUzU3aWs0RXp3ajJ4T1VReGpralZuKzRn?=
 =?utf-8?B?OXhWVnJZamQzQjViL2RRai80aE0xeUZMMVVwMDZKMVUyQ0N1M0IzTlBwZk5x?=
 =?utf-8?B?TURxRVRnMG9PUko3VlZOb3RDNFZsNGhVRkw3T05TYUtaeGR3U1pja3E0Z1hE?=
 =?utf-8?B?eENUZXhXdzNnMUtrRE1ZMVNNT0gycWZ3ZU9Mdjk0c2xyV1NXR3ZpKzN0RUJi?=
 =?utf-8?B?MUN3Z2xTZGhQR1pqcDNDMFZ5NmNuWW8wVmhOUDBUUTJ4VmlKMEtHa1ErZE1k?=
 =?utf-8?B?bWFrVWhXVGgwSFhEYVF6anUzbkJaYVB5Zk14dEJzcFBzcUtyRGE4L1JHVlpk?=
 =?utf-8?B?Y2drWmo5OTBMMlg0bjlMZ1pLcVd5UDVJKy9relFneElubzIzejZDSDVLZ2xB?=
 =?utf-8?B?eGc0dzJnZ3hoeW9SZU1ONy83aDIvTEFMemNqeGV0dlRTbjJRQ0IreUJLYWR3?=
 =?utf-8?B?N25jR2NkTlZUK3JUeTl3M2R0MmFuQXl1RUF1MG5OM21MaEkxcWRxUG1tYUcw?=
 =?utf-8?B?K1NmMkVDTkdyMXhhK0NSdE1XMTRXOGJJeGltMWFhd3dJTEdPUU5zUHc1UTV4?=
 =?utf-8?B?WGQrblVkNSsrektMYk0vUGNvWWJhazljVHdsalNMdGhVbDBvekFBUERrY2lP?=
 =?utf-8?B?N0t6UC9sMEpqUEsySVR0ejJtOU5zcGdhM3BmZ05UNW9aRFpsREFrOWtpUUVP?=
 =?utf-8?B?Wmh2SlJrQ0gyVmE0V3hydGdPU3NZOUdKdVE1ck9VMHVrNFlWdlVZdHBWRVlm?=
 =?utf-8?B?RzlwMUJOQ0pEZGtRd0FMM25PL1N0L0RpNitFVm45NmliNlp0ZmdBOXdWM3Va?=
 =?utf-8?B?N1M3cVlDVHUzMWtldk9jVUpxZCs0MFA0eUFYMi9lV2ZFQXpSQ0pKUHBYa2k3?=
 =?utf-8?B?Wmc1L3FxcXhQR3pGamZzUENHb3ZQN0hQQ04ybTRrMFBpWWRIck0vZmMzRnF4?=
 =?utf-8?B?b2Z0NWFsYUxDY0MyMWxmSWsxNXF4V3hFdHcxS3U0VHdvQWlndDFKaDJhU0ZS?=
 =?utf-8?B?UzVUMGtLQUZCcEtZRTNLVGtndkNoZWhTMGZPV2hIc0RVOGtNUklIeGNrVE44?=
 =?utf-8?B?UjMzN3p1YXE1dlRvQ1JsV082ME9hUmZLeGFlQkdyT241SlVnUzFxSE1aWUI0?=
 =?utf-8?B?aENXMUZlaVNCSnFIbXFqaVNkY1diZ1VDMkZyRHZxVU8yMlJhbmREeWxlMklB?=
 =?utf-8?B?VFFGT0VKanpzRW5uSGVWT0hQdHQ0MHNKR05DSk91UmtHd2lHMEQ5cjUrZGV0?=
 =?utf-8?B?Yk8yVXlodStSS2dmVEJqbGRSV2FsM0p2MWRnOGo0SlhCWnRDekQ3UFoxMFlm?=
 =?utf-8?B?VmtpeHpManovZzRXay9uajl5bmJZYnZmK3VzYlBnbjVLQTZXQzZhQkJqeDVn?=
 =?utf-8?B?WWdvSXBqU3oxdjZNMTNJWVpYeTVYTDRkZmJpMUc1ZXN0L1lrMXlUUm9FV1A3?=
 =?utf-8?B?dnlGTG41NTNpZENuWGhyVDAwbnRxTXhWaFFURGlEUTRSMW5nd3NOQTVGWUVm?=
 =?utf-8?B?UEMzWjNqTTQ2WkJUeXFXRHVvd3ZxdFI0K2o1aE1XbVYrZSt3bUlkejhZWW9m?=
 =?utf-8?B?OXdZOFZxa3A3UEpSSnhOME5qRlhEME9XQSsyclJBelBmamw3STNXeU1WUm9V?=
 =?utf-8?B?QXZUQ0tOZGM2RUd1b3VGMTRqZWdheFJlOXVET20rcTUyS1NEaDZYcGtVQ3lL?=
 =?utf-8?Q?De2GsdvKCNOIULgOZ18WwTTD1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52da0d01-9a8a-44ff-b650-08dbcef71d80
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 09:54:55.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mip/A+DZz+BrJWxy7hRp4hey4+huU5Q6K7k1Wm9U1K5R9n80XCUetez4Luv4HN/pRsT8wMr4pLwykQRpFO99A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9673

On 17.10.2023 11:43, Nicola Vetrini wrote:
> On 17/10/2023 10:26, Jan Beulich wrote:
>> On 17.10.2023 10:12, Nicola Vetrini wrote:
>>> On 17/10/2023 09:02, Jan Beulich wrote:
>>>> On 16.10.2023 18:05, Nicola Vetrini wrote:
>>>>> On 16/10/2023 17:45, Jan Beulich wrote:
>>>>>> On 12.10.2023 17:28, Nicola Vetrini wrote:
>>>>>>> The definition of MC_NCLASSES contained a violation of MISRA 
>>>>>>> C:2012
>>>>>>> Rule 10.1, therefore by moving it as an enumeration constant
>>>>>>> resolves
>>>>>>> the
>>>>>>> violation and makes it more resilient to possible additions to 
>>>>>>> that
>>>>>>> enum.
>>>>>>
>>>>>> And using an enumerator as array dimension specifier is okay for
>>>>>> Misra?
>>>>>> That would be odd when elsewhere named enums are treated specially.
>>>>>
>>>>> Yes, the array subscript operator is one of the few places where an
>>>>> enum
>>>>> can be used as
>>>>> an operand (also because negative values wouldn't compile), as 
>>>>> opposed
>>>>> to mixing them
>>>>> with ordinary integers.
>>>>
>>>> When saying "odd" I didn't even think of negative values. May I
>>>> therefore
>>>> ask for the reasoning of why this specific case is deemed non-risky? 
>>>> To
>>>> me there looks to be a fair risk of creating undersized arrays, 
>>>> leading
>>>> to out-of-bounds accesses.
>>>
>>> Two reasons: MC_NCLASSES is the last value of the enum, and a pattern
>>> I've spot in various
>>> other places in Xen, so I assumed it was a fairly common pattern for 
>>> the
>>> community.
>>> The other reason is that since the value of an enum constant can be
>>> derived statically, there
>>> is little risk of it being the wrong value, because no arithmetic is
>>> done on it in its use
>>> as an array's size (and besides, the enum changed the last time ~15
>>> years ago, so I think
>>> it's unlikely to change much in the near future).
>>
>> You focus on the specific instance, yet my question was on the general
>> principle.
> 
> A couple of reasons why this is allowed:
> - associating values to set of symbols is typical and makes sense in 
> some contexts
> - out-of-bounds operations on arrays are dealt with by a host of other 
> guidelines
>    (Series 18, mainly)
> - this rule is about which kinds of operands makes sense to use with 
> certain operators.
>    It was deemed unlikely by MISRA that risky behaviour may arise by 
> using symbolic indices
>    as subscripts, given the rest of the other guidelines and the 
> unspecified and undefined
>    associated with Rule 10.1. It's not impossible that problems will 
> arise, but far less
>    likely than using enums with no restrictions at all (such as those 
> caused by an enum of
>    and implementation-defined type used in an arithmetic operation, that 
> could give
>    unexpected results).

Now you appear to focus on uses of arrays, not their definition. Yet even
there I wonder: array[idx] is nothing else than *(array + idx). Adding
integer types and enums is disallowed. Nothing is said about arithmetic
on pointers throughout the description of the type model and its rules.
So despite the restriction on integer types, adding enums to pointers is
permitted?

Jan


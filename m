Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D27AFAD5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 08:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608665.947288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlNqh-0006Bz-Dh; Wed, 27 Sep 2023 06:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608665.947288; Wed, 27 Sep 2023 06:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlNqh-000699-B2; Wed, 27 Sep 2023 06:16:39 +0000
Received: by outflank-mailman (input) for mailman id 608665;
 Wed, 27 Sep 2023 06:16:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlNqg-000693-Ba
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 06:16:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7d00::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67ad0390-5cfd-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 08:16:33 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DU2PR04MB8838.eurprd04.prod.outlook.com (2603:10a6:10:2e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 06:16:30 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 06:16:30 +0000
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
X-Inumbo-ID: 67ad0390-5cfd-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erHqGZQiB8MhX5bwjGVcg3ArktMAt3KRoWCWlziw5Tky/cT4t/+Y/g5L6Nw9K4iDyltRBiKARI3LJEp5OVT1ucVwjP3AIMLoh4M4iLXdXGwMTFyuGoS7feT78FAUxiaatyjNaEUh7lKuEAVD5O/mEkjyMQ6A2ELucKvUue+iO4TWq5+mlOoyAXETebLO8MHeNz7SDkhc5P0F1D/3dNWLzueSJjgCypVmOM8UcoaKjGkfjkzPqFwOIHlWarC4oGEEEN0ScQ56xvKuWj2n2tDizg1adw6MPmUczCxMhzcbf8kivMM/UGDgJJXxro+5Q6SJ/DSlafAZXs8ML/6a8NZPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQcFF5yUrTnIf1gLPQhTE003gu23yOWXsg3CscYaaqo=;
 b=JZJrqSMT+w3S7QcaJojWoqdXhdyhZNTdVzv/IcAkxW3H/nMPX+7Lte+UMaQMWAiWZ2zQT43n/8lDpFU2TmhMSp9Wlw9ICQEZd3a4IuXAQVwxAVDmLiPd9jHqVrEZWgD6vflAMNHAQrcZ9oj2KmEwzo6wTRjoOFUMAeo+Qi50o81cFoKg0W/OeHpBX0KUBq/hMrvrcNTaURW49VIWxzBj889S0b7Dn5v41Ue4ZvrjkBUWlBJrGMhLGUued/G2lZ+jSqrghd2sIhdCNBVia6KNFTn6nO4s5NWouJ5obdAVi0OI14Gy7j7B6NgLlIDu89f9+evf0PELg4JzdOycXd0llQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQcFF5yUrTnIf1gLPQhTE003gu23yOWXsg3CscYaaqo=;
 b=5NY6I+ZjkB+SbT01+mFG/zgCaBS292j5Jy1GzB9//DnLocaT+7hZ411QLI88jwR4382+r1SLQE2xoGDWwFzmsWe2Ij12ezHdPE02HnlPJVy9303+yt7cu3Y3Cx5V/keq5Q8o3jJUktQ0Ad05vlCv7dlR/R0QtXk8xexAaCfzGR9dD1d0KEnc02LamvjFtLUzziTbcc2whPOqeher328XpJlcjmexUpH86lmBjzbgVKsn2ujsGv/D4gm+MuLIpVkschwPLxRSfmchKLpBhUjZmjJRy7340OcT1sFgjO5tG+RKVKvMy7iiThEoPAUcxJV0VwqyLKjeKry0LonDJ2dHNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <535e10f2-fa2a-bb6e-6db3-025743e07a77@suse.com>
Date: Wed, 27 Sep 2023 08:16:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] automation: Change build script to use arch defconfig
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <beb83dd70b15ee6bd896fb26532f5debf955cd48.1695681330.git.sanastasio@raptorengineering.com>
 <alpine.DEB.2.22.394.2309251609330.1403502@ubuntu-linux-20-04-desktop>
 <59f73c32-bde9-b0a4-00e8-24db1fea2d87@suse.com>
 <2f348eb1-1e66-22d4-dafe-20ada835155f@raptorengineering.com>
 <4919dd70-92c2-b62c-baa7-1733b039a621@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4919dd70-92c2-b62c-baa7-1733b039a621@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DU2PR04MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 55820474-5af9-40f0-3922-08dbbf214a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h1p68uGCagJ8HKKSzn1QqGmj6dmejYpaAQbP/qp3nSzXfxS55+EMouHkZSVcI1c8EbdDO6aHcEyszCypjhedNYz06EZG0Oy5rR1/Z7ntYbQmU336sV3cGs3YqQ/cCPUyqVowG72XnlZijxf16U58p5xN7WmW9GUFal2AD+7wKXKqzv69PoJI/c+67xmY3tJ3/8os/6AG5jh3KfsYL8/D5g3RPQSIkaS9WtYyJ05uRhqyd6Kc4ZDPLGFdaCJ9e5sTG80lnTgOZdSylP80G/DAp7eezFVHa43EfKdBD7CgFi+5RkIbMiGHceJ5D9uvLV2yOyecuO/e2JPknjI9AqHRwyuyFxvFzwNlwy8z+u16v+G1qt451LNXrRq8NFGT0f5mvW3f+KSoeG7+l7BN9XeKtSEN53imKwag52ruQ8eWexs1t0YRQM9dR+32FHu6Tl8b4CmkzN2LgRDCcrG1VNT0RIjP3P0vJ62exZPpPlHewSasCxeehD1nfPnJfMiP1Dl0FRZhLqfufB1dfqiX2f3zu5clXodL46VYEb4/T4ZKc+AgYJctB1rkSDp4A2fmtZG6+Wj1PNYk5EjW71sNU0VwxbrXGmT0xpOM5WaKuAkorJr7qgV+X7fQV3bHS8yf8ZtZwPwNnBlVhvg0lVLvZhTTyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(1800799009)(451199024)(26005)(6506007)(478600001)(53546011)(6486002)(31696002)(2616005)(86362001)(6512007)(110136005)(66556008)(38100700002)(83380400001)(54906003)(316002)(2906002)(8936002)(8676002)(66476007)(66946007)(41300700001)(4326008)(5660300002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3ZxTkdQSUFYSUJ2dW5JejFVT0xQMmQvc1NxWHpIaGZNd09GQkR1VCtsYUEr?=
 =?utf-8?B?S3k2bFVhazcyL2dsNmNuZlBndVBFamZaeTlDWElZeXhVcktDMEpzUU5qK2lm?=
 =?utf-8?B?T2JTRnV1TlFrSkc3NlowTVpXR2J4SEZxZC9naXJqZ2xJRndrdkszMXNhRmlS?=
 =?utf-8?B?eEx1a0s1dHZRQnBBOGx3a1E4d3FicVAvR01VT2o0dzJyNkVzejg4aXE5UGRp?=
 =?utf-8?B?OXdTSHhYdjE2NjRQYXNEUEt2WTBpNkFGdUhSQjQzcFpyZkdXZkhoRTdrbFN4?=
 =?utf-8?B?ME8vejlyZng0RXBxNVVnMmxvQndncnlIZVNJNTQvZVFEYkNycFVwK3pjVlFD?=
 =?utf-8?B?M0hEZU5NY0FCWWd0RXkyYW5LY293dlREcjRqMGIrRm15WlBWcWE5UXdwQXN3?=
 =?utf-8?B?WEhlUkNZVWJ3RktUQysyc0tMdG5INlVKZDhIQy9iNTQ3VlFVWkJoZlZISDJM?=
 =?utf-8?B?UVRUZDlIYUVkWjVrZkxkeklUb1U2TlpWbk9aYkJhTWhOUUkrTGRmSm1ybGRC?=
 =?utf-8?B?NkdLWnMwb0dzdm50TVBwRU12WndVTDBib1Q3YVNlTXVOSDRLWGgrZytCb3Uz?=
 =?utf-8?B?SDl3Q2lWamNLTE8zeVVkd0lMSWZhU2V1MVNHVkkrYktrcFBwQ3RXT0RZa1Ni?=
 =?utf-8?B?MzlqL2cvUWhlUFp2YTVselhnNTQ1c255NnpBTnVHQ1E4SE51cGR3NmFCWjUz?=
 =?utf-8?B?SFloaHFlZXk2YjUvdFdVcjdQNzBQZEdRNktRVHpiYU9YZ2tKUmNzaWRpRTZ2?=
 =?utf-8?B?clZFNlpCeWgyVE5QRzNLT1ZUTjZwQndkdjlqdXltaFp1RUV5TmdKVjVKM3o5?=
 =?utf-8?B?aGptVTc2NFh1SDRRY3pxNnZ5U1VEQy81dWE2b1pXcE9VMUpUQnJzUmhjcUM1?=
 =?utf-8?B?QmtLQ2p4alk4SU9ERkJnR21FMWdLbGpCcEJWYkd1L3o1UjFKQXVua0g5b0pX?=
 =?utf-8?B?WWRWQ2FmL3BvU1JvKzNZbld2WitheE1INUxCQXBPSlZHYW9PenZRN05yR0Mr?=
 =?utf-8?B?Z2cwbUxMQ1k1WnYycEMvVEJTekp6Y1VtNkpEbFhoMDhGZGdsK3pPRnFoL1lH?=
 =?utf-8?B?dmhmNGlROFM1UjJLaVVhdHdVWDdPWW1Gd2NJbkljbUxSbENPKy9XVGhLQjBM?=
 =?utf-8?B?MWJFNitUNGlQRktmQktIYzc3VERYdGxhY0M0UjV4L3BEMzlXcnpxcHlSTDM0?=
 =?utf-8?B?emxEOGg5bVVmRjBZcDdET0lwc2NJd1kxbmo2N1UzeVduci9UMDBJeEVEN09X?=
 =?utf-8?B?bEdhOGVpdGErWVBCamxiYVQ1bERsNFdGRzNwMHhpMUpMakprZmoyOGV4Ry9z?=
 =?utf-8?B?ZnpsSm9TNDBtbzlNaFR5enhNTVlpbS9uVXBqcllVSUl6VFFLNll4ZGFIbHgy?=
 =?utf-8?B?amdlNVdWSnBGZU5NZUNrRzVXSi8velJOUlBsSGE5emk3LzJXWFdxUjlLWVph?=
 =?utf-8?B?YmlPZWwwNmlYMjZBTVdiZ3FmQ1NydC9RbWVFeHRiOUg1L1NtOEVGWmwxWk8v?=
 =?utf-8?B?Tnl5UjkyTHlxRjFaLzkvNzNpYUNCeUFHV1VEVVlBZXVGVHZ3aktmcVJmRjg4?=
 =?utf-8?B?S0pjWU9IeXRHdkl1RVAwdHFPTyt6OU5zY1pudkZSODZjWjVud21MdUlIU0Nr?=
 =?utf-8?B?WmQ2aTJwMXdycklrRUVVbVNyczg1b2VoSnhsT3VFL1FPQVRDRkxqTXVQbmhj?=
 =?utf-8?B?M3RjQXFHVERldFMwRjByRkllRVV1VGtYTjlkRmpDRzUxRjFoN1V1RW5HVVV4?=
 =?utf-8?B?UW9WTWF2aGRGdGZYOWdEUmFkNGozZ2hFVUVjdnQyWTh2LzF0M0VzT1Rnb0R2?=
 =?utf-8?B?VFpXU00yY0lhZ1dyOWFlTlNOT2JmSVQ2L1pybHFMcnVPa0ZMcHZZQk1VYUdM?=
 =?utf-8?B?RXRIdmcrMnVITGloQytIZGo0ZFlEU1pWa1ZOT2lKSmlKcFE3OW9uVS9QOVJi?=
 =?utf-8?B?RTBEaUJQY2dOd3hVeGYrdjBsRzJPaUpIbjBOOUMydklpWERiVnVnRjRCTkpa?=
 =?utf-8?B?cFdWall1R24vcUk3NXVNeVZyQkQ0R25scGFZSFFVMG04VnBSSU53em9Ia3pn?=
 =?utf-8?B?NC9VeHg5aEx3Q0VZVXNFZVVvMWd3REJEclJvUm9UcDdUZDdrZzNpdC9xM2tP?=
 =?utf-8?Q?+IBmBZv9vW2b+ecmFYueKmp2s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55820474-5af9-40f0-3922-08dbbf214a6e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 06:16:30.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIK+7zfkamMWS6/u5Sl4Y9ezUe3wLkQUzVgF/ZV6j1xobA4cAMGFFR2dQtODbm9AT29K+sRuqzxgMuqg0E44qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8838

On 26.09.2023 20:35, Shawn Anastasio wrote:
> On 9/26/23 12:43 PM, Shawn Anastasio wrote:
>> On 9/26/23 2:19 AM, Jan Beulich wrote:
>>> On 26.09.2023 01:12, Stefano Stabellini wrote:
>>>> On Mon, 25 Sep 2023, Shawn Anastasio wrote:
>>>>> Change automation build script to call the make defconfig target before
>>>>> setting CONFIG_DEBUG and extra options. This fixes issues on Power where
>>>>> the build fails without using the ppc64_defconfig.
>>>>>
>>>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Nit: Tags in chronological order please (also affects patch 1).
>>>
>> Will fix.
>>
>>>> What is the problem specifically? Is the issue that CONFIG_DEBUG enabled
>>>> before make olddefconfig causes certain DEBUG options also to default to
>>>> yes, and these additional options don't work well on Power?
>>>
>>> No, the issue is that "make olddefconfig" takes the existing .config
>>> without even considering the arch's default configuration that was
>>> specified (KBUILD_DEFCONFIG).
>>>
>>>>> --- a/automation/scripts/build
>>>>> +++ b/automation/scripts/build
>>>>> @@ -22,7 +22,12 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>>>>>      # RANDCONFIG implies HYPERVISOR_ONLY
>>>>>      HYPERVISOR_ONLY="y"
>>>>>  else
>>>>> -    echo "CONFIG_DEBUG=${debug}" > xen/.config
>>>>> +    # Start off with arch's defconfig
>>>>> +    make -C xen defconfig
>>>>> +
>>>>> +    # Drop existing CONFIG_DEBUG and replace with value of ${debug}
>>>>> +    sed -i 's/^CONFIG_DEBUG=[yn]//g' xen/.config
>>>>> +    echo "CONFIG_DEBUG=${debug}" >> xen/.config
>>>>>
>>>>>      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
>>>>>          echo "${EXTRA_XEN_CONFIG}" >> xen/.config
>>>
>>> It never really became clear to me whether kconfig honors the first,
>>> last, or any random setting in a .config that it takes as input, when
>>> a certain option appears there more than once. The change you make
>>> implies it's consistently "last" - can you confirm that's the actual
>>> behavior of kconfig?
>>>
>>
>> I actually tried to avoid this issue alltogether with the sed command I
>> added before the echo to drop any existing CONFIG_DEBUG= line.
>>
> 
> Just realized that options in $EXTRA_XEN_CONFIG would also be subject to
> this which is likely what you meant to point out -- my apologies.
> 
> I've tested locally and Kconfig does indeed seem to honor the last
> setting. It throws some warnings about the overridden symbol but the
> build continues with the latest value, e.g:
> 
> .config:94:warning: override: reassigning to symbol DEBUG
> .config:95:warning: override: reassigning to symbol DEBUG

I might guess such warnings are okay to appear, but this needs confirming
by one of the people more familiar with how the CI works and what output
is or is not okay to appear. I can see upsides and downsides to such
warnings ...

Jan



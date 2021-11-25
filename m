Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9CE45D698
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 09:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230735.398873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAZX-0003qT-By; Thu, 25 Nov 2021 08:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230735.398873; Thu, 25 Nov 2021 08:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAZX-0003oS-8k; Thu, 25 Nov 2021 08:57:39 +0000
Received: by outflank-mailman (input) for mailman id 230735;
 Thu, 25 Nov 2021 08:57:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqAZV-0003oM-Rl
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 08:57:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc565b12-4dcd-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 09:57:36 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-oAd0EFXZOG2SKOTnPbjXlg-1; Thu, 25 Nov 2021 09:57:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 25 Nov
 2021 08:57:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 08:57:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:313::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 08:57:32 +0000
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
X-Inumbo-ID: bc565b12-4dcd-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637830656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZugTODvumOoUEH0iwV7P16SieULvvvYTObxq/PhdKQ=;
	b=MWnzCAQBRoaq3Z9vBxJZvWWRd04O4OM+padRU8lNV7jcuy6Q4qoMus2LR2nk8buVjv7KSf
	TtsKzfV8GZYOXaexqBt6HtnJG5sFQNUZyLgN2Wt9FyUXRRehkusTYQeg45YoLBHtAd2ZV6
	VnuvSQLonX+rUVbA8Zl1+LcKH837N40=
X-MC-Unique: oAd0EFXZOG2SKOTnPbjXlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVJyUKarxjUS+6HYylEKTLnTo/5zWhSAFo/AmnQu2YDrbtk23sTCLMkdn/9U2du9LadYTCVSzU0CB3AO4cDSSC3ZKB4ZiChmRVCRyeLqXu6q06ok8NwzF8+79o/OvsdKEKC7nZwkAE7vFTRUCH/8lgFLax8fhJ7CtEIsgah5gBdgZfiOAH1KQNOOGeCgwTAEn6b2wsxvmkOTi0MkxjckC1GDGzKlYUG+654oS94I76V5IL8j5ydViW9hQr0PsR6SC9fWOrkQiWWGjWX4qWFvEJFgq8Aqgj5GkDp5reLCvz9FCHBGCgitD9+kLTwstOKumpJ+h97dPbbiu72HEGiGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZugTODvumOoUEH0iwV7P16SieULvvvYTObxq/PhdKQ=;
 b=WWwJTNHtfZnSwSSMlO1WjiOUqVZxjcJjI93yNCpUO/05NHTnqjsnRjridyyeQhPE3uyGym0Jj2Eavns/6w7GWVqrtqebNA/krwYLJxD+vxaAEhk40TLwyGngGfK8vxG35DpGAtMPwf/czWQwyTD8IniYzrceDY0u/OZTbmZfqIYTO+vTq+lHh0pS4/wwGqGiqYGIjxVnXmtgBiEwruiNqI3eHNoejUp2EOqa+uzbfTwjhntZt9siOdEY3bYNsr8uCBU7N7XxcdBq1nTIssbpDDILWucU7ROXgZ6QOd8csirQo/ZB4fyJkKPkPfJUjsKSKQj6jLtF/oKti5DOlEcwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cbe791cc-848f-8511-6974-2c9e300ea66b@suse.com>
Date: Thu, 25 Nov 2021 09:57:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211124211152.1142-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0070.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf52585e-f8da-4177-290f-08d9aff19e4c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6303E73BE1C0E43618B67C8BB3629@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dPZxmBvrnp7pOG0Xg4FhI24rkcvZjDZWZyqtUKyMJ7XEubD3OaPOnrde6gkv/fNocBkPXJRhYSAnH6n91A+0WDJqbX7o6LFEWQEIDlu5VNVSw60CZar06dnwRplZGX3Bz9hkRfSNj/os3MWL94snmMD8Msj7OnLNuZZRPJ/FZGnFqcQnkmL9g1MLlEoigpSLFCJGsd7PI6Aik4W6711WwNSz27kd42v3Fy2qmQ4e9/dgxalyhkhyQenYJJBbRFYf1qniyyLWvxLpvzkxgpQ63XAfIDj2tLETyp+iNbJJQjzfjG6UiUd8817WN6yzgN+yYeenPSwYtbBYSH+HlnSmADJse9ocrfpnutZIOOH0yX2RwWeq4USXupTnwBn1QiYbFMvjrHSyHq72KoigQxiI8e503H0PfSgJkdKaCozpUQclnPPSU0S+8uM+AZT1wQHCUo/F4f0D7Qr8bQC2CmTh3g0TRygujMtjiZwQbIM0LjylNrJqtjPmYJAdUiwxNfO+Q4YTTZuKaf0pefDdpef75R3aZDsagXSe7PoSPWH4r13O6s2aoxaEBJebstZjHw63sPej5w6a90b5GEg6Dtbfu5KbblazZWRTdBI1p6j0JWKgoVjwkSnem2qsWD9OUc3JjEwTc2QrlpmhddHtkAGHHZx/Z7lwoi9IiN0RevRQz6Zey2hPjhdi5O2Bc585vNFhuJbFY+DnqeDa4px5e7pQ6SPk6lqbFqAEYtCVvzZSWjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(86362001)(31686004)(54906003)(2906002)(53546011)(36756003)(6916009)(83380400001)(508600001)(2616005)(186003)(8676002)(956004)(8936002)(26005)(5660300002)(4326008)(66476007)(66556008)(66946007)(31696002)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDJVN2VuY01JR1QxRE1YaGtKL1czNlJnT2ZIK2s5Um9nMTIrV2JGc1V3VU1N?=
 =?utf-8?B?Mmp2R2IyNnNlbm5INk5ldWtXamgwMy9vVWtqTTBhdURRaEJTeldvbjRPdWR4?=
 =?utf-8?B?UnpoTEpzNG9uZHJBZ212RWVxRFJOOUU1NUxhK3IxdHZlMGh1OGtvVmJkNnBj?=
 =?utf-8?B?Vnc3V0ViMFhLamtxYm11L1orQkVpaWtWbGZ3QytPT0xIUkgydjVQSVBaS2xa?=
 =?utf-8?B?YXhXbzZZZ1crY2JKNzlYWVF2Vlk0aVltSk51bkk2d3R1WTVja1lucDR1dms2?=
 =?utf-8?B?RE9RbS8wSGpUUkNRNTl3eWozUGtqemtrd1p2Y3hJQWxTTEh4QS9xbzVWZFYz?=
 =?utf-8?B?RThMVFllL1BjVTk1TEFqZzg0Z0lIamJWNTlYUjVYSHhjOWhOWWowNlhWUFdp?=
 =?utf-8?B?dWVUWXVBNEJJaGt5bFMyRzNYaGJaK09VbUpITWQ4MTJsSng2NUJFM0w1LzJL?=
 =?utf-8?B?WHQ3dXJjMG5QeXd1d0gyQlg0VGVwek8wNk5xOTFWZkJKQVpvWE56RXM5WFY1?=
 =?utf-8?B?M2l1NmVBVFBKRGN4cG01WGZMdUIzT2V5MkZvWEdHeXdQeElySjRtTEd4ZndS?=
 =?utf-8?B?bGRYN2NiOTNzTVVaRjM0MDdsZUpWNTBvbVJEZTMyVGtQWWl5bnVjL1pseStS?=
 =?utf-8?B?QmREWUxWaVhwSGlCTlp0cWpZUWVQQkJFOCtvWXRtTmU1cSt3SmQ1QnYzZ3Vm?=
 =?utf-8?B?eER6VUdVV2xQN2I1WjZoZlFLUVhnaldabEpEYWhYL3RySkExZ0V2VHNibzNW?=
 =?utf-8?B?cjBGTVpwVE8yZEtnOGI5TG9GaFZ4SDVOL2wzT0c5VWlKL1A4TU1OWFdtczN0?=
 =?utf-8?B?SkwvZVo5Q0FiTDNmQW83UjQ1bmFrRmVpR0I4R0FLZVJZTVdwaTg1STY3Rng1?=
 =?utf-8?B?bEluYnQ1bVpIeDNGekIxSklSOHRXOFljMXBUM056bUhucnAwUnZwd1NrLzFm?=
 =?utf-8?B?M3pxWGZJR2JJS0tmZ2dKVmQ5QU5YdHBZaXk4U0RrdU1qVVBGTTBrdzlkWWFv?=
 =?utf-8?B?U0dVd1dYUzRSc1JUTWFqZENOQURrMlF6UTJLQmMyRk5xdE1VT1JqNTI4OXRk?=
 =?utf-8?B?Q29qZmJFMy93ZEtrd3BFNENjajN3NTZZR1p1cVdDTG92UDRUWDBBWUtDN1Qw?=
 =?utf-8?B?MUF4ZzlWcU1ma1FvcTN6M1Q5eXd3UzZlcTBQa1FYeVBjakFOZlozT1FPOXMv?=
 =?utf-8?B?V0t3dEtvT256ZFVtcUVpSXE0RWlRWElkcGNJU2QwQ3M2YU9VTEFIM2VUMXlD?=
 =?utf-8?B?b0Z4dmNTSEhmTFBkQVlDQlFSMnM3cG8xVitNWHR5UVlSazFPcnQvU0VqRmxV?=
 =?utf-8?B?UWo1WE1EOEF4aDhkQ2RpWUJNS0RhcG5zbjhJU1VxcGdwQlE1WmJCWStLMzVw?=
 =?utf-8?B?Q3NPc21TS3FBT2dDSFByd2FSNDVxWTFSUExKcXZ4K0xOVDhPTlgxYVFCTXZl?=
 =?utf-8?B?dmxWMHNXSVlrUWYvTlJZNzJJME13KzFnQ1diUHh3cmpTS2poRzdXQ0NJRGsv?=
 =?utf-8?B?WDdldmxMSlNWVC9Ha3ZPbnZlRHpVeUFMWGdUeVUyY3BteHZkbEdFQXRzVlFs?=
 =?utf-8?B?QTg3b1cxZmIzekZ5bWI5MXhQbnF3bm8zWTZNSXFGSEx0OG5QZXd4eFMrdjVr?=
 =?utf-8?B?V29ZYitaS2NLQ2hTVTBaa0krNHdZVUJ4VTRLeWF0Lzgvd1Q5S24vTWg0d0hN?=
 =?utf-8?B?R2dGeVNQd2hVcVdOVmhNMkM3VXBuSFRiWHo4OFc2YzJ5MWpHV0gvNXpVMXZt?=
 =?utf-8?B?dE90OEQyY2VWZytDdW11NlN6cWFmWDlHSXFja3Z2N3pOdGI3eHBZUlBGTTdN?=
 =?utf-8?B?UE9PT0p0K2d2dGlYTkF0aTdMemlsVEtERjNpUXI5Ni95WE9VNC95b3JiQzgr?=
 =?utf-8?B?Y2pmTlJEaGlKMzlkOVJ5clJHUEdTamxEbHZJcllvYU9YS0FCZlliTzIxSU1F?=
 =?utf-8?B?c1N6b04xV2EzTzFsTE16Nm50VHRNMkV1TTFqM3NnbDB4RnBwTUg3cmZOVkM4?=
 =?utf-8?B?SVRjb1VOYWtIYlg1Zm9FcHVtREh0b3BGZm5PYUg5dDVxS0E0RS8yQzFjLzF4?=
 =?utf-8?B?RittdkZDQy9DdDBMZFpmNldDOFBLOUMyRktRdWZkRzhyalhRUFFhSmNRKyta?=
 =?utf-8?B?LzVoTG9wQkxKNHpWSUZLWE9rYlllRDd1djZsaGZDSk95UW9pS2FWVnpLeEFl?=
 =?utf-8?Q?AZVAwOmAcL1fqjsVu/lWXP8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf52585e-f8da-4177-290f-08d9aff19e4c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 08:57:32.9275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgablN2iIzJVdIpkK6VSZdgwXMWMUCxHzAQfmB6rqTRFs0ebchEDUxKVe/+eYJ80uCsMdPOohALT4yapqexPRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

On 24.11.2021 22:11, Andrew Cooper wrote:
> OSSTest has identified a 3rd regression caused by this change.  Migration
> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
> fails with:
> 
>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
>   xc: error: Restore failed (22 = Invalid argument): Internal error
> 
> which is a safety check to prevent resuming the guest when the CPUID data has
> been truncated.  The problem is caused by shrinking of the max policies, which
> is an ABI that needs handling compatibly between different versions of Xen.

Would you mind pointing me to the flight which has hit this problem? I
don't think I've seen any respective failure. I also don't think I've
seen any respective discussion on irc, so I really wonder where all
this is coming from all of the sudden. It's not like the change in
question would have gone in just yesterday.

> Furthermore, shrinking of the default policies also breaks things in some
> cases, because certain cpuid= settings in a VM config file which used to have
> an effect will now be silently discarded.

I'm afraid I don't see what you're talking about here. Could you give
an example? Is this about features the flags of which live in the
higher leaves, which would have got stripped from the default policies?
Which would mean the stripping really should happen on the max policies
only (where it may not have much of an effect).

> This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well as the
> partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which added
> one new case where cpuid= settings might not apply correctly) and restores the
> same behaviour as Xen 4.15.
> 
> Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents")
> Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies max leaves")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll be okay ack-ing this revert, but I'd really like to fully
understand things first.

Jan



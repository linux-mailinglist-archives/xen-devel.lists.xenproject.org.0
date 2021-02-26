Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1EE3265A0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 17:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90448.171221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFg6v-0000j1-Mo; Fri, 26 Feb 2021 16:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90448.171221; Fri, 26 Feb 2021 16:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFg6v-0000ic-JA; Fri, 26 Feb 2021 16:37:01 +0000
Received: by outflank-mailman (input) for mailman id 90448;
 Fri, 26 Feb 2021 16:37:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFg6t-0000iX-Of
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 16:37:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b417ec2-1421-4f29-b858-3663f43cebf2;
 Fri, 26 Feb 2021 16:36:58 +0000 (UTC)
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
X-Inumbo-ID: 5b417ec2-1421-4f29-b858-3663f43cebf2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614357418;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gPNexwi3Ur13MGfs0iK96Zeq0N1BIGNczxMkxehweq0=;
  b=Kg7u+cHY/30VLfdc4WXHNAE0ElrkVKw7QH9wy7xUdfnKxsKidQE8yJQY
   48wPnQNAIgTf/a8IgrcdgOERDUE5C2l5ZCxcBIu1k4Uml81uu7s+uzV4L
   rP4AEoVk0gHxqREO+d3rE24aL3lx9qvQV6KNNgWq25rDJST9M8ytmCR1n
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: h5jnTRInna0nAd0dqfqk+vbGeCtvRC6Tl6n6JcEGwY1xv4LpIrRW46x3wrNRCDvAG3uHK+M5kM
 jhrvoXiKyQ5bmreKuz5lp6ESTOIpx/UWBAZsFX4an1qnOCFgtRTBDn9AXpXFpu/KxTZ386Y9KD
 n5vQB2qSKl/zMZaAxzVaavBhNRZomRX/avYLslA0ANgAbfY6AAgK1PKpONd4gEntt4clSnBNdX
 uFrKnfsgcHs6lZsIlgkGZcq3lwn2v17HTrn0o+YzA1lsHL+dMnAl7sGea9zBqq0N58Um3KMLR9
 Ohs=
X-SBRS: 5.2
X-MesageID: 38116201
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,209,1610427600"; 
   d="scan'208";a="38116201"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPFBHUbQcpal9OL5LL3E7WoocFnEv/toOh8WvXhAqq+vpjVUZsOk2jiN2cvxsV2Zhvrirz6XoekjMsIIOY5Lr1zLCzZYREw2dx9yDDPb5IV0zHMeRVb8m9nTCD87/0SzMrG/8H6z0m9pZ2Boqt9mXgxKnqoPP1NVTDeXUjeSQYH6WE+CsxJ2j36rZ+Q557mn0HHk6p7jCuvYEdxPEvDorGxx/6zgDxqEVDP1MZ8UllU62Vffqk7Wp0L0vmJlzZB/F+f+vUoxhxApnRe9ZbGnCOBMmisHdGm1N/WEyoz9CFsqe8TyntOW085hYx4gRRA2silPf3iWAthxsje6FiQ3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKTOPBg5EvSWekL0yTFJthgB0zqsdnNIaXAiTwnAC/E=;
 b=ESqVMxSaHlpgQ9vJOtqGzKM5gTrf8U6qFiraR1SaaeE4cqiOSB2EwtRXVJyC2XZq04FVMBJxUCZIMrD2RYNU75lBoWnHYsdKlkL2pCp+YrHrCPnm6Q8M0o6fr8ZiFvDm99+XHIdgIeDPKCDHbgyYdyx//qJChQHGJlWwj4P1vST0PSFxZcmKpCljgOQZuz0aDUYZd9epe8pzIudpwYylpnKLawL0QQ5al9r5VfAAS2hNDLvS9fsRy5gF+zWpT3+D33JgNl3eAJ2mw7/MkBdTDaqUicDPLKENus8+XMu+BrASRqbGBHBg1alCtX+ERBAQw7NmAc58C04AZKQWX+pCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKTOPBg5EvSWekL0yTFJthgB0zqsdnNIaXAiTwnAC/E=;
 b=s6CkHLNI3wF7qHK24TU2H3AYqMBgzMgZl9QxV7qud2sT6PDR93cpoz+vPzqM5lxUFH6YGdV/i8Pl1p1IWckaCL6PhX1La9B06pvV6uiVDIwohDj5sB6xglNgifgjFCXrx+Lmh0wn8KKLN1Sfd5n1+QFxP6nqghvH0AAX+Q+Tu7Q=
Subject: Re: [xen-unstable-smoke test] 159709: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <iwj@xenproject.org>
References: <osstest-159709-mainreport@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a33d2c9a-00e3-caf2-afa6-48f70ef1202c@citrix.com>
Date: Fri, 26 Feb 2021 16:36:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <osstest-159709-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c83722b-4a9c-45aa-65a5-08d8da74b2a8
X-MS-TrafficTypeDiagnostic: BYAPR03MB3736:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3736F2DEEC88F265DFA57276BA9D9@BYAPR03MB3736.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xijWg6lczJyNF8HcjRT6mZlu8E5xvkHLf6A3TgvAjWcRjKO6GkPj2RJqRXF0YZd/ke6PmZmNpzNRZWGc0C043YMtV+9NWu+39mQuG9XoH7Q07UZDdTYYoOQssTQwGeLIOiWjFvl1g0WM6yrE8PqnRoQOzrbmckJHABeo1wLWHe3625cyoJyrl+tW1+cEIlkjDuvliBgEvnyFGHw2aLIwlFQVTfuP3ZrfkBADDWEZfjpHXHW5sJ1myyZfG0FLPH4VEaA4pY132nMmcu6Iq0EAiQuDX7fbGP82a0BXupllad/hSmFycGDozHqf+2OaJK+sfrYVhR7qvgPrGwTWC64C6wWhBkyH0x3gjX+Bm9CvpZpVerAhgQm0OK7cRN5ARMm86yQDIasU9Ns/h4FotgCj0+ziwE49YCfOv0vgHqAf/eeZ8HC/v/EaU+kh1KnU4qKRZXdKiYxS/IrzAJXzEEbuEDaFKsN7oiRQ1BLWcXaP5YCASjGM+ZbVDsihMOqQCi18CxeUb4S20HePGR2mRMZB4bDeSX4p/W748NMTwJYr07ikQJOc7/3fhmyWtu9lfsRX39Gjb2xbDF8LQGVqeuq2Zb2t1kx9yh5qWc4mFxS47BtjCSBWcG8aMKstRF/1Blh0rbsC19NmZxv5ebjD96cxGzD62sD5/MTFpASepYXOqZy35ED9pmXGnUVsoAZ1bYIq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(6666004)(86362001)(31686004)(110136005)(36756003)(8936002)(8676002)(478600001)(5660300002)(66946007)(53546011)(966005)(66556008)(16576012)(66476007)(2906002)(316002)(956004)(186003)(83380400001)(26005)(2616005)(16526019)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2x1RVdWWHQxVTRyaHpkOHFYalc3bDJsUENaNzBBYXkwbDN0QzRUK2QxNVYz?=
 =?utf-8?B?YVJhRXExeENOTGF3NUQ0c3dMWElPVHpscVJKdW03WC9pazBFblRhWXJadGlL?=
 =?utf-8?B?VjMzUlRuL05yQ3d2YlFlbXV4SnlnT0ZxempjbEpuVWttelFBdUdzb2Zua2ht?=
 =?utf-8?B?ajJpM2c2R3lnTkJybEd2Qzh2eXQ2S1Zkb2JiWExrdXR3d2tYT1NkcERSV0Rm?=
 =?utf-8?B?OElBVjM5SDZHS0FZVnNRNE0vdFFJYjNtZE9tY1FpdkZhOCtuN2xFb0hkSXlx?=
 =?utf-8?B?eXY2N29FUTZkb2oxL2JUa2w3UUNLT2ZQallRWU90dlBYNC9XMGlGRGE5UDZz?=
 =?utf-8?B?MVZNOHlMMmpBMk9OS0pLQlpxTTJqbWRDYnpmWWxGYkZrVDRLSU9VOXJoZ0pU?=
 =?utf-8?B?T1NURmpVMGVFVVgzWnB5cnpKMWR2MlJBOFV0SXdleXNiWFV5bk9KUWtBUHRG?=
 =?utf-8?B?Wk5UdThWUE9wV2pUcCtJZTM1OVl0NjJqdkRvdVFFbGJvanJPalpPczQ5TDlH?=
 =?utf-8?B?NHFhZFQreVU0eVhKcmRicEtmQmdObzAzOXFVYnJzbkFLZkR3aG5LbGF6eHkv?=
 =?utf-8?B?MUF6V2hFbGcwZmF3YUo3OUpjTkJoTHhhRVUrNE82NnVxTXBqZHRVUXo1Q2pQ?=
 =?utf-8?B?MkVnMEZvYkVCZHl6aXJmeGwwM3hxZlRlNjNIWFB3RGo5L1lqeFZSS2Ivekdm?=
 =?utf-8?B?UVJzdHNuQmRWWk1kTDBXT2JZRGY0b1dMWFZXNHdIdm1La1lGdzZXRVlvcVFo?=
 =?utf-8?B?ZmZwZUFKaFh1bWdrUFJudks4N2hwSVA0NzFFMTk5VklmNzVWb05WRUJUNEFa?=
 =?utf-8?B?R0VNck9DdmZtNjRFN1Q4Mk1VdGVnYnU3KzRTbWNWQ3RZQVZKNUR0WVAvQW52?=
 =?utf-8?B?TjZsTWt6azdFdEJJQWRCL05ZeEVZT2FZY2FWdGU1aUVDVTdDMEtjenpqNjJJ?=
 =?utf-8?B?bitWdFVOaW9WS0Rha0hIM1JyT3VHcVg2ZktJRGFIOXcyUnlqR1VyRFZ2eW1o?=
 =?utf-8?B?cjBoRllmd3Q3aldQbk5Jazh6VVRtczh5Q2h6eVRaWlM0Y2JpT3V0TUR5RTUy?=
 =?utf-8?B?eWl4RGpNTm1oOStaK3BMaEdwSTdmd3c3NGJlcEQ3Zmx1NVkxVTZOS1lJTEl5?=
 =?utf-8?B?cnIwRlU2S2FxVFd6RHh6R3B1aDdxLzIySy9pbmpHUE5SbHllbk1FVlBNZzR0?=
 =?utf-8?B?cXNHa0R1bjlBS2ZUSWhzQS85ampKNm5ldXZYTkROZ09MeGwzZ1F2L00wa1Vz?=
 =?utf-8?B?Y2ZhdlNieTVlczBZSC9mVUx2K2ZvSjArZlh1ekRHV2taRmh3cFk1NzBzNktN?=
 =?utf-8?B?NE0zZHlEc2xHeXF6cStybFpSNi9RWGNiRllCUUt5ZU80Z0NYWTR4bTRnZmZ1?=
 =?utf-8?B?NEJ3akM5cFBUZ0IyZzc0dDFtenpaQnk3T1BxUVh1SjZVOWVsdkZQZmRPTmZ1?=
 =?utf-8?B?N2tPUHVHUzRGMTI4ZWJmR2ROSytxdWloVGhjMFdUOFVIbnF4QnlZVTRDcVlD?=
 =?utf-8?B?OW5jMEpBdDk5cjhyMUxxa0dXeGhLSEJYTFMrR2dkdExJT0ZMUDdkTXZtYjdV?=
 =?utf-8?B?VHlkamlDVXlhbERLd2RBaDhnYWFQazZtZnRDV1pnWEFxYlRmVC9DM2JTTEE3?=
 =?utf-8?B?ZnRUU2Mxb1J1N2tQZFg2ME1iekZna2RQbVRxM2duSi9sMm1hQzgyMWN1ZjJI?=
 =?utf-8?B?OU1sOExnNld2NnBBRThVeVFjM0oxTVljMHJjWVV1aGo0WmxmWlJHclQ1dFlz?=
 =?utf-8?Q?Fb7o1VC2AMOHIsp5UJL+o460VDVCiNEnBPY+F6r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c83722b-4a9c-45aa-65a5-08d8da74b2a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 16:36:42.4705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m15ETNEUOWVBgoJToBlAwl38YyQaA5tYAgcxorPLkImmmfwCrGt6letCsSVEmm17+xPJXD5fDHtsfF7khHOARRZqdch6bL5bZQ6+3YWLqpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3736
X-OriginatorOrg: citrix.com

On 26/02/2021 16:34, osstest service owner wrote:
> flight 159709 xen-unstable-smoke real [real]
> flight 159713 xen-unstable-smoke real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/159709/
> http://logs.test-lab.xenproject.org/osstest/logs/159713/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 159704

Well - there's only one possibility here...

> commit 615367b5275a5b0123f1f1ee86c985fab234a5a4
> Author: Andrew Cooper <andrew.cooper3@citrix.com>
> Date:   Thu Feb 25 16:54:17 2021 +0000
>
>     x86/dmop: Properly fail for PV guests
>     
>     The current code has an early exit for PV guests, but it returns 0 having done
>     nothing.
>     
>     Fixes: 524a98c2ac5 ("public / x86: introduce __HYPERCALL_dm_op...")
>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>     Reviewed-by: Ian Jackson <iwj@xenproject.org>
>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
>     Release-Acked-by: Ian Jackson <iwj@xenproject.org>

which means we've something very wonky going on somewhere.

~Andrew


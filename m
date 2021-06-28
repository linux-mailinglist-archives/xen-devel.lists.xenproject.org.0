Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859DF3B6770
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 19:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147932.273145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxuq2-0008Bb-8Z; Mon, 28 Jun 2021 17:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147932.273145; Mon, 28 Jun 2021 17:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxuq2-00089l-4I; Mon, 28 Jun 2021 17:14:26 +0000
Received: by outflank-mailman (input) for mailman id 147932;
 Mon, 28 Jun 2021 17:14:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HW7=LW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lxuq0-00089P-5y
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 17:14:24 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e6c05fc-553d-41d7-aaec-2e1dcc98dc83;
 Mon, 28 Jun 2021 17:14:22 +0000 (UTC)
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
X-Inumbo-ID: 3e6c05fc-553d-41d7-aaec-2e1dcc98dc83
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624900462;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sx6ZyCIyCG4Gn4+QvvhHoxti4R2150zKzNSmihQKkQY=;
  b=XdTrCTfZQKDe+n7P2wd4yo7Jbz/1f2qZCLUlo9nBBuclx0FFT1l53OOy
   qzD/8HQ9rNFmoYPGcYPMFiB4L2rZZhRqHkLbbQFvP9UcG8UEPey4Rl/+E
   XFcH6hQ6gAWeRuICd9g6Z4Gnkkg0nc/eXIexyNQdIEmA62+CBVC1UIerk
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: //brKe2+Q44CV3Ulmk7QOh7UbeIuvP8u+SMcEBhB3qODbKEExiwm3qVdcwSJY6aWzNVLbopfZf
 cSUV46Jm8xEOA9Y+/T8wYhd3hfNo+Oc2hDMume67zcBXcW61eHSKnmywm5mTX5v2JdOc4Djlp7
 ZXQD+gYqa2Ksd4fhsClm3edmANf9NXHUDRehXxmgq6z4lrotBQNiC3GqrMlIJVJwOVtr6mgJ5t
 nwHboE0aKZ3HKeG+ojShIHj5tFNA+dghU5SAnCxnBh9l8zPUshV+WYzmrpFcOB19sugXGKBLST
 Po0=
X-SBRS: 5.1
X-MesageID: 47185225
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wypO46uaBFoIBLy9WkNE8qIX7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK4yXcH2/hvAV7EZnibhILIFvAe0WKG+VPd8kLFh5ZgPM
 tbAs9D4ZjLfCJHZKXBkXqF+rQbsaC6GcmT7I+0pRcdLnAeV0gj1XYcNu/yKDwHeOAsP+teKH
 Pz3Lskm9PtQwVtUiztbUN1LtQr6ue7267OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpU/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqa12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pcVFZol/1awKppKuZGIMqjg7pXVt
 WGTfuspMq+SGnqKkww5QJUsYWRth1ZJGb1fqAA0vblmQS+0koJl3fxaaQk7z49HakGOu55Dt
 L/Q+9VfYF1P7srhJ1GdZE8qOuMeyHwqEH3QS6vyWqOLtBOB5ubke+I3Fxy3pDwRKA1
X-IronPort-AV: E=Sophos;i="5.83,306,1616472000"; 
   d="scan'208";a="47185225"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmlxCzG5XQHUI0eKQy8g448AbzU+XrpY0d3gUuIgDipX9UcbjBaRYvoMkwgl8wb3lVR627hF+fSatJK5PVOpTIFlwEsjCaNmKlDS9D9eb7RFD+guZ7ATPrDVRlpRwA3MMP7VgTKP3MVonO8wUZBbK9l9YrSkpsxgcx3Tz4DTTZ2BVwTr9DRQJwpPd2VGe6aI7m23OrQbK6nvnUtNX+xzV5lGgM0/4fc/XfAxPnvGe2XtF8DkSX2tc5bdgKDL08K9Kt5zkI8kskX7RvRP7ujh4IhwQJoWNO7AtXYcfXIjqeEyMkb1mHE6pWavl6vXzClW6aUDsDe69PczIYhOh57a5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BczKiF5MWHmpKlEjrCxziHQlmGDkA7m92trEKv3gdzw=;
 b=WU6P4gZQr4ZnLtr9bQOkYHyxkLmcnzS+HyaRm36Rz3C6vbJxSy0MaxVl52Oe2ZP08t+hAL70qcJPe5HODV6spGKUUthA3ETkSmEwt/Ys4BwJf0XPKNEBd/On4V85Mh8i8bj43bArM+2SCdDaB3wLbaVaHXY/O20/A75uDGN43mpS1zWbF0vsh4lXIcXBmE+B4x56VlF09oirmBAMXyCeg5Ff1ae8Z/03VsJouN0knu3nTDt4odUMYea8PaNKpHhjNoloo1+Rzma6UGL9u/gex49qVEwfWmTVE9TQNRb0cK65hF818jsjpZDu1BO4tCrP2wZ95ZmT3j6kre7gH4vGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BczKiF5MWHmpKlEjrCxziHQlmGDkA7m92trEKv3gdzw=;
 b=vJ3N4ttas70KbaWP/K31PW3noRNPtaW2rfc5nKLffNjb7+oy9ocnwghI63wq7oUPyoDbLYmn/pbEuYbsFy+3YPqXFWBbEtwUpaBMCmyicd3l9Mr4rDeBq/5lNWcBoV+BvbK6ULK+M0ivdr38kE++ZdKWroK6tIN32+Qc3d4ng7o=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <9285f566-e352-9265-e9e3-e9a1e15ce7d5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: avoid using _PRE_EFLAGS() in a few cases
Message-ID: <4362c5af-64d4-ef13-dd84-1c885616afc8@citrix.com>
Date: Mon, 28 Jun 2021 18:14:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9285f566-e352-9265-e9e3-e9a1e15ce7d5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dedc71d-8c70-4e65-943d-08d93a582a60
X-MS-TrafficTypeDiagnostic: BY5PR03MB5045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50457E85C37187F1EED845C6BA039@BY5PR03MB5045.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UMW18UWHRiYCvrDy5T6upGtboDX5/U8jDgIWkCgHkDWXCtZ2JMZL834jEQLds+8wPseFV/JG5feameLyYsABxIUdMtK/T4ZOchf8eNES2JXA2jsfBv6X3HNFkgwW2dCM+AzDTKvp6Hxr3JbwoWf6zpfOlX3y9HHIvKuURoxP607FlnN9PzBMBjd5s3H+OzrQYUkTAUp0OaLj4/tCcZJ3ckOBlNO86iNFG4KrzeoqI0oiLMH+OEJQSYY/MXznheCyvbPtwCoC8ElLKW1fVHo0T8LrpDQBuuvE3koJGWjVxAe94nY6R+agLko97JL6oLhARlpCBix5wF6F6Scg/nYMjyS4FvDeppTge5Qn+XX5Zw0o025z5cSxBLFlVqG9g+tIUJTeTaG4hFy0byTQzmVrtDvDZnz4Cl9VdTKkEuJQA/1aecsOXrh40qL76ZE7kWstxtXAoZTs0VZShHdBWIKHzsOqL9VqXia+nHImrPX2V/3Kaoyid8+D1yvCfzsPAPiiryszwDpssvj10OwmGDmaJiRGSRzfQHcaOD3p7qwQjknHjpkPuruUyiX7jtXZAnXafivtwm/YCmu/STyAFD4A9q6He+eZAYPjdnAE9jFybqacAQl5/xTNVfMe+loMbsnyYfjALQx9UZDLD0rsGZdHiCxQmzrV+RktFvJkwmQU+tvmSmaW02Atww805+hMWbEKSAYbGp85zQD9Z8D0o3z+5Ted03xV1IVVCeEXnccFNOPj0h39NLz/rykcRhtH6VAG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(31686004)(2906002)(8676002)(110136005)(2616005)(83380400001)(66476007)(31696002)(4326008)(956004)(478600001)(5660300002)(66556008)(54906003)(38100700002)(53546011)(107886003)(16526019)(186003)(8936002)(6486002)(86362001)(66946007)(316002)(6666004)(16576012)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTNLeU9CVmVLQ0dUUmVXNVpEUXIzcndvVW1TcnFFQ0JVWTk0WTBORjNoZ0tL?=
 =?utf-8?B?UkFFNE85MjFrbW1Pd2FUQ0xISHEyeGttYkJyb25VcThtcjUzYk14cnJDbldh?=
 =?utf-8?B?RHozci9oMTZlSURwRWJkdGJUcERzVTlzajk0ZzVoTnh2bjFrb2FGUzRCdDV2?=
 =?utf-8?B?L0kvdm9rNHpBdUdVSXdFSk5FMjlpRGE3NkNCL1dJYm9YUU9XcVBlcnIyYmVP?=
 =?utf-8?B?RVcxSHBtRGdZcExBdmhLR2lzbVJGeXhLeDRxUTJaT1BkOGpJNlEzL0p6Y08y?=
 =?utf-8?B?VE9NT3J0emQ4Q2xCVjJVd0I1eU5MeGxraCtZbllGNityb0Z4MGtkVFhlejRC?=
 =?utf-8?B?cGVjeGdYcHgvMkpmOTFBN0FVUVQvV0Z0QnIwZTdWemk5K3Fqc1Y0NkJ6TzNW?=
 =?utf-8?B?b3RSWDRKL053SzVpdnNFSkdkbGVIOTZqdU9rcTlvSlhsR2NEMEc4ZmJiUEVX?=
 =?utf-8?B?T3JSNFlML0JsZlRlYS9HYlhyUDdmdC84S1Z0L1JqRS8zbmRzaE14OE50bzFs?=
 =?utf-8?B?enV4VHdBTFFDZmdPV2RJUGd0RXBJUDV3SWg2NWRrNTdWMy9ieE9HRGY1Unh4?=
 =?utf-8?B?ZXo0SjZjQkg2cHIwa0RXZEg0MmlrbFNuSWpsd2ZGbFFOSVNXY3ErNFc4YWVo?=
 =?utf-8?B?T2U0a1UybDZjRmJRMzN4TDJHbGJzK0x6WTJOSk5WeHlSUlRJYlNMR2JUd0hN?=
 =?utf-8?B?Y0ZsM0VaMXFiN0l2d01UY2JLNmJ5N3pZSGZYT3BDWXVjMFY5NTliNjRvUThz?=
 =?utf-8?B?Y2EwNjQ3ZnJ3dE4wREI3b0VpLzRIeWlKMldOWkpBUUpkQTBCODQranZ2dS9C?=
 =?utf-8?B?cml3dFBMcXB5UC9nVDZWSkVQbk9aTlljSXI1MmREVFRoeDBlVEg3TlU2K1lF?=
 =?utf-8?B?YVFnL2dDcUJkM1RYc0NEOEZPWElOREgxRjN1a2o0dTRrcnNHMEl2TGw1ZUYr?=
 =?utf-8?B?bnQ3WlVGazZYUjB5a21Ca29Fem9NK1dzM0V3TkVjQ2ozb1ZGdlBEd1VFMWVB?=
 =?utf-8?B?Yndsd1g0dXJZc3BnenFhWGd4L3JIWDhpcXQ3NjFXTkYwNWxuSzN0Y04zcUl5?=
 =?utf-8?B?RHZheTVSUHBrMVFHaGUxZEowNDREVnArK2VFMEJhSUlPTGNxRDNOYU5KTlFO?=
 =?utf-8?B?VndVQVNIQ0FxU0Z6RTRwVW5nU2wzMlgraG9ZN1N1NXhrbjBUV29xTjRsWThT?=
 =?utf-8?B?SUJ2dFFIbzBnVDRRYTBEVkhpZ0xUdkljeU12c1RxOHVsbm0vZzllSFVEejF2?=
 =?utf-8?B?UGhnbmREd0xKdDZTTG9Db2c2Mmk1cXJlYVhOVkd1TnljRnJhL1dJc3FjV1N6?=
 =?utf-8?B?UnhJb1J3VndqZFJaZ3VEYlhlVms2M3JVRUFYRUgxMzVQaEx2a0VXR2xoWTd4?=
 =?utf-8?B?RFFNdXR4bTBrd082TUpZT1ZzSUJaZytCUVZMZytteGFnZTRRaVliaUpuZWtz?=
 =?utf-8?B?aXh2NHVaQVBhM0xqVWVkTFUxVGs3QlpKNkpQeEhITzlteHdRTFNwMmdmcW43?=
 =?utf-8?B?Zk15cGRyYlZXRFhvcTNJWWRZd3dlcitHY3V2WGliQ2RTZEFraXYvNkRUajAw?=
 =?utf-8?B?MDU5Mkt1K1FxQXoxQ0dDdE43N1RBU0ZBaFBZVUZXYVJ0MG1QSnhUWGMzb0J3?=
 =?utf-8?B?TnZTUG52S1dsQ0FaTFlwN2tOcHlVZTJNeGJLSzlWR2VNdlRSQ1BxdmxFeWdx?=
 =?utf-8?B?VHdYU05RcVZGTzJneHRWQXhvNjBjVXlvU1BVZkdKcXhRUVVoSTFXVWxSMUlW?=
 =?utf-8?Q?+dIr0kcs+eyoptOPeTJIZDnS6dRjFuw7YwlwqKT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dedc71d-8c70-4e65-943d-08d93a582a60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 17:14:19.3790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLOUld8U3akBVCc/jpzhMKNQfHw1ec8eb1QhWK3z3ABQTzpn5gjbmE32bYghHjfT6JlmAcebMKjqiuSbUHIqPaSORl7u/dq8ylUCIiLwjYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5045
X-OriginatorOrg: citrix.com

On 02/06/2021 15:37, Jan Beulich wrote:
> The macro expanding to quite a few insns, replace its use by simply
> clearing the status flags when the to be executed insn doesn't depend
> on their initial state, in cases where this is easily possible. (There
> are more cases where the uses are hidden inside macros, and where some
> of the users of the macros want guest flags put in place before running
> the insn, i.e. the macros can't be updated as easily.)
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Honestly, this is the first time I've looked into _PRE/_POST_EFLAGS() in
detail.=C2=A0 Why is most of this not in C to begin with?

The only bits which need to be in asm are the popf to establish the
stub's flags context, and the pushf to save the resulting state.=C2=A0
Everything else is better off done by the compiler especially as it
would remove a load of work on temporaries from the stack.

Nevertheless, ...

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -6863,7 +6863,8 @@ x86_emulate(
>          }
>          opc[2] =3D 0xc3;
> =20
> -        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
> +        _regs.eflags &=3D ~EFLAGS_MASK;
> +        invoke_stub("",
>                      _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>                      [eflags] "+g" (_regs.eflags),
>                      [tmp] "=3D&r" (dummy), "+m" (*mmvalp)
> @@ -8111,7 +8112,8 @@ x86_emulate(
>          opc[2] =3D 0xc3;
> =20
>          copy_VEX(opc, vex);
> -        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
> +        _regs.eflags &=3D ~EFLAGS_MASK;
> +        invoke_stub("",
>                      _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>                      [eflags] "+g" (_regs.eflags),
>                      "=3Da" (dst.val), [tmp] "=3D&r" (dummy)

... this hunk is k{,or}test, which only modified ZF and CF according to
the SDM.

The other flags are not listed as modified, which means they're
preserved, unless you're planning to have Intel issue a correction to
the SDM.

The flags logic for both instructions is custom, so it wouldn't be a
surprise to me if it really did deviate from the normal behaviour of a
test operation.

~Andrew

> @@ -11698,13 +11700,14 @@ int x86_emul_rmw(
>          break;
> =20
>      case rmw_xadd:
> +        *eflags &=3D ~EFLAGS_MASK;
>          switch ( state->op_bytes )
>          {
>              unsigned long dummy;
> =20
>  #define XADD(sz, cst, mod) \
>          case sz: \
> -            asm ( _PRE_EFLAGS("[efl]", "[msk]", "[tmp]") \
> +            asm ( "" \
>                    COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
>                    _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \
>                    : [reg] "+" #cst (state->ea.val), \
>




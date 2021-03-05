Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F132DE3E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 01:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93424.176397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHxzf-0007d2-QP; Fri, 05 Mar 2021 00:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93424.176397; Fri, 05 Mar 2021 00:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHxzf-0007cd-NG; Fri, 05 Mar 2021 00:06:59 +0000
Received: by outflank-mailman (input) for mailman id 93424;
 Fri, 05 Mar 2021 00:06:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHxzd-0007cY-JH
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 00:06:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e61f5b4-f5b3-4e59-8fd5-082bc97b6337;
 Fri, 05 Mar 2021 00:06:56 +0000 (UTC)
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
X-Inumbo-ID: 8e61f5b4-f5b3-4e59-8fd5-082bc97b6337
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614902816;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PY43vUwecCeP9YiG4TSdlc8XR1NZxFwuqVyMsUR19kA=;
  b=bqhBrasVpRsLF4ppT0kGfj7B7rdquhy0kQM1bycen3r13ymAmaSm3dkG
   11V8kUzypXcLz4poXa7GGBd1uI7PB4VNK5D4s01WHK2NRu9kBpvDotgJe
   pl3ym2Ie/PGpMo3wd2Mwuv5XVegtAtUaDW8b07vD7oRnx9yDm0syP0TMh
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oVpAzfuWutzUkIEMDvCTipAWhI+/oTfvzFvHAJ39fHIrLb493IYhpx41dSE6LCpOX9Q7yoAPsI
 5Z16uZH/TnirIEFEPvpxZ/ZH7etiVL5WV6ZBrXjAPDHJ4s5CC3W9gJY1uGxWqbgZIKt497/gck
 swR7BTiWvgw95XAcnY+ud0fP9pLXc5b43doeAPslHENMhCPuDG7nQUfxf7KaOPtLuUcA/nk/Uw
 MAxh7rkPn/niT4H3KmRJhJamjB3jt8m6vlmTCgxlGP/7ntYnPIjdqHkbXYx2gpZk0CqWsrOFUp
 J5w=
X-SBRS: 5.2
X-MesageID: 40005099
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="40005099"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3xhbTxRlYfbtHzPzHpUTmYAM4c0geuTPwuawhzb7++Yb/oNk2COXL3jGXYLuNw9XO+SKWemIf8rtjxyR+5c5MktbMCZ7wwM8pW0hi6YWlAKmjCV4scsBEFnO0TZOLtyvCE6RO77JMecwR6fuHBd1s5qcVbP1ezVRp1idHMPWIH7iJMl2Tpq77ifnMLaivAzg22nZw2vSj6XBI5rmaenkj39uoqP5zvyWhQR+D0X8iE833u2PQ1ZbqpNnojz1C4rQM/gEeDstJe7abvoL/744Xw9QC8IGgBf0mi/SH41Jxrf8tFjK2e2ijyhfMIkc2sg1QsW3jwf2IZGFB+btUEFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLjNMZl5t8bw5dTdYDW/rfKTMbrOEUz/q6D5PT9dd0U=;
 b=BpAcCnyFtU85AQ2kWMxWnrbGKBHpLMC36GQPJXl+d0vZbm+C303vbi9WzL6hTae/Tom/UGspzqDzhrlWVMJ7vMGpBR1SRPFS0A+kBJJOJI/xmzp2L+Hy1dfydTiFPHooEMK3LiakfQnEd7WNyO86MzTsXKSmFuhxQdmLfzs5Vt7IpKLEPdxmOMb9kD2MR2BV5SreiLaemm/uxx2xEXTL0QnJIkGWLH9/bUtdqj07acvapCft4You9lGuFqywt1yt8KCCdJfjdwaLIX8Z2oBiLygGyJEHrDIx8Heb6sSgc5rAHCz2CTJopz3exR9CMOxC1IahdaDx7JWxX+gRNFjRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLjNMZl5t8bw5dTdYDW/rfKTMbrOEUz/q6D5PT9dd0U=;
 b=pIw6Y5N/k74I/rik7lqRdTrB2nerrtMGHKSShPlcAf3I7hGV0yp1KUjOZFcGYVJPaVUbJx+3APiocEQKFV/uZzytT0eklYvKx3A5jdZr5Dg76iqWAGr2zacV3fFsQQfEoqgtlopIZ/s65/ZI4J/7qNZ0mb14Da3dN8hIjnRHau8=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
References: <20210304144755.35891-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
Message-ID: <4cb7e1f3-0593-6d06-281a-e3bf06843221@citrix.com>
Date: Fri, 5 Mar 2021 00:06:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304144755.35891-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 302039d4-925e-4489-65b7-08d8df6a852a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3861:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3861474135AB0409F6E3E6FFBA969@BYAPR03MB3861.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: moA61SqhrTSkqwSZb8mmIAU10AbY4neO1JKw2y/MTiOplMrjv4q1tkeNlxInoZ4/NMrXyBqh3RT5SYM8uNGGxONfUMGve8r2NWNEajcVM0WlyEIaJhm3ruoRQRasNKzIPxuy9MkqPRGV7qqP/f+dRnJW8cKWsBAENgQn6J+p1B204x/mkXThfZnYWycuQsI1ie0MPqKSSQLiEiH5YqzbeArw52ZogYxZSrIdoIZZDh9+HpYRz4s5KGp9WgKrt3ipn3Vv0pP8W2LQnao20g266GSQvcQ+L55I0zP3m9PLeUAtNXKGS+4KBoqJmDhFUXehkh5J6yefIl9YoOpPcc/CLQbMHY5joYfEDlV1dA7Fc9wT4RKHiGlBD9RcOfr8TDlc5ptjiVVUgg8Iax8rxH8JThCnsgC0Ru7nBdQTcsH4qRgYlzZkwgKMHUBe3VO9zBKyNwUp0Jko5g/2qigyDgRYWQFLDnFVjXpnFJzyI5y4mVhaoAzRHe888VFbMtNVFoe9n9JBBLYrfupdvQ4Y14VtbYOZ0WPv3FgVxyXbdLHVL6EKvatmT/SwHYU7WJgLFsMGbiehXFWEFuGLuAp1/wlw4MFpB0O9oEWw4KfHGC7IccI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(8676002)(2616005)(26005)(31686004)(5660300002)(16526019)(86362001)(8936002)(31696002)(36756003)(6486002)(66946007)(186003)(66476007)(83380400001)(66556008)(478600001)(6666004)(316002)(54906003)(2906002)(16576012)(53546011)(4326008)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZVJxdGtjRjhwdFcxbmtNdWJrWFNhM0g1VGlGdkVGTE1WTGhQOFF1NHlQMUZv?=
 =?utf-8?B?aXFUNkVZaEZLeGtYTGI0dFgzZDJQK2Y1VStYQVNkaWVhcVN0RW1ZQ0lkVTJ0?=
 =?utf-8?B?d3pONjZsd25ZVTdUUnZ2dzlPcWlTajVUUXgxZzE1dlBBcXd6WUlEZDN5QnFD?=
 =?utf-8?B?K2FkaHpiMytSM0VBNm42ZEdlZWVLc2FmTlgvejNGN28zeTlybGVCWSs3Zkk1?=
 =?utf-8?B?eThjNEJJWHFHZzg1bDhiOU1lMGlJeGNXQ2ttTkFUK1Jud0UxdkYvN3B5UjdY?=
 =?utf-8?B?SE0yMEpmblg4eUpsS1RURy9FK2g3NFVDN2g5bEdrOEtEbjBTK0RETWdhRUZi?=
 =?utf-8?B?Y3hNMENobUNkV1FuWGFwckFZZzRYcndMejRaTlJHM3c4ZzkwWXNDVldma2Ns?=
 =?utf-8?B?S0RpRXB4SEVkNVBRQXFSRVBRQmR0RlhqVVpkeHc2RnplZmdGRFhBRHNLSGZ5?=
 =?utf-8?B?MzRINklDRmJUSDJVdGxlNlo5ZE92ZUxKeEYxM1FXdnd3L2VWcE1kTVhjZjFI?=
 =?utf-8?B?b2xmN3dTSE40YlY4V1BNSUlqOVhsOW1BejBXVUxQWGZnamhpZ0RQQjFMVUZZ?=
 =?utf-8?B?a2pVK2RPdlNsMlBZN2EzVERvUjdOZ2QzV1RHb2ZpdFlPcjhabElFUFQ1M1du?=
 =?utf-8?B?eG1iNWkrS2xRWDF2UUpyM0w4My80MDIxUCt6OHNJV0luTDhjVnFjcUpSRjRG?=
 =?utf-8?B?WXA5LzdlQjZwNldFS1NucisrakR1aVZJa2JPM1I1NFltMnJEN1lldDVtOUpU?=
 =?utf-8?B?c3hUc1VsZ3dPUWd0UVNuZXhsc3ExZzdQbmNPZHpxSW8xVzJLNkpBeGRVWUE1?=
 =?utf-8?B?bFlicExyVUI2Z2M2ZTNKd2hiZG1RRkxteUFRcUoyMTQ4NGNObjQzOWxGT1lV?=
 =?utf-8?B?WFV6c2daU3o1YmNzWnFmQ2FwWU8wNnk0ZVdnNVlqOExSTjMydmJtQ2tDNHpv?=
 =?utf-8?B?UTJlN2JHdnIwcGswbDE2Rk4vMVN3eml2Vk9BUkNiRWo2Y00rTWQ2ZVRkUDZm?=
 =?utf-8?B?VkVwZjdBZ0xZYU1FT0ZJQ0dmQ0xGYm0rdTFXa2d1eTNDb1JjTVE0UXBVemhr?=
 =?utf-8?B?SW8xQXdta1ZqQkVqaU1nNTNFd1gyM0x5cTV3bC9IN0k4QjlCY1pQbFFDYTB3?=
 =?utf-8?B?eTV6cXRLdURvSDVnaEI2Q1R5V2t0eDU2dm5LQUF5NHlmb09wYk5CbjFFR0JX?=
 =?utf-8?B?Slp4cVFNbXBmRi85cHhlTEp0TXpMbldjUnkzcklDTlpldDZqdENkZlB0azdW?=
 =?utf-8?B?MWFraElYNTBGQTRKejkzaTR6Vm9HRm1LSVprY2lRYWkzVGVqVStDZENySzBI?=
 =?utf-8?B?MnN6VmJPUDg2SEtaaUFNZVNLaE50Rm1vNkRNeHQxZDVzYVYrSnltM2xFYi9U?=
 =?utf-8?B?aG9vbEErTC96VE9obC9vU3ZFVEphUlIvT1I0QzJEWEhrT1F3UWZBSjhxQ2VZ?=
 =?utf-8?B?TWdrOTFtM3h0cGJuLytMZHdnWXFFYXRLT3B0MlB1aW9lejkzNndPWW15cDdp?=
 =?utf-8?B?aEhXejE4N256Qjl2SE1EdXFBR2dia2lWSGw5VWhZc1RYbHdyek1zVk91TWM1?=
 =?utf-8?B?UmF5YnBXcldPVUxaZjJsdU1oNXl3TThDY3NodnpBNVRwUWRJWDdDZ1RmTzUy?=
 =?utf-8?B?LzY1MytnM3hBNjdjcW5sU2ZYdVBnRHlvL2F4V1ZlT1h0ZVoxa3o2MUgvbTBR?=
 =?utf-8?B?N2Z2V1dxQVFzSXFWMmNlb3JXUnZuVGNUUllQdVZYWS9xQVVXYVlmMmJHcUxk?=
 =?utf-8?Q?HkJXEbx9CoG4wPBjubCrW/KqnzMHGZ3htPaLqlW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 302039d4-925e-4489-65b7-08d8df6a852a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 00:06:27.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4VBW4tq88zg28E49O3PHgLndJcr0MEb0bMJx6WFTnccYMsOkd+XdvW1ZfnzsPfTAxX9jCN2PEAZUKyMrW1jd8GauokpEcmYcOz5pbNr8wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3861
X-OriginatorOrg: citrix.com

On 04/03/2021 14:47, Roger Pau Monne wrote:
> Introduce an option to allow selecting a less strict behaviour for
> rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
> commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
> Xen result in the injection of a #GP to the guest. This is a behavior
> change since previously a #GP was only injected if accessing the MSR
> on the real hardware will also trigger a #GP.
>
> This commit attempts to offer a fallback option similar to the
> previous behavior. Note however that the value of the underlying MSR
> is never leaked to the guest, as the newly introduced option only
> changes whether a #GP is injected or not.
>
> Long term the plan is to properly handle all the MSRs, so the option
> introduced here should be considered a temporary resort for OSes that
> don't work properly with the new MSR policy. Any OS that requires this
> option to be enabled should be reported to
> xen-devel@lists.xenproject.org.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Only apply the option to HVM guests.
>  - Only apply the special handling to MSR reads.
>  - Sanitize the newly introduced flags field.
>  - Print a warning message when the option is used.
> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
> Boris, could you please test with Solaris to see if this fixes the
> issue?
>
> I wonder whether we need to to enable this option by default for
> guests being migrated from previous Xen versions? Maybe that's not
> required as the option is helpful mostly for early boot I would
> assume, afterwards an OS should already have the #GP handler setup
> when accessing MSRs.

We know when building a domain whether it is a migrate or not, but don't
recall any version information existing at an appropriate point in the
migration stream to do this easily.

We can buffer the stream forward and peek at the libxc domain header,
which does have the source hypervisor version, but that is going to be
very invasive to implement.

>
> From a release PoV the biggest risk would be breaking some of the
> existing MSR functionality. I think that's a necessary risk in order
> to offer such fallback option, or else we might discover after the
> release that guests that worked on Xen 4.14 don't work anymore in Xen
> 4.15.

Much as I'd prefer not to have this, I agree with the sentiment that we
should have an "emergency undo" which people can use, and carry it for
at least a short while.

However, to be useful for the purpose of unbreaking VMs, it must change
both the read and write behaviour, because both are potential
compatibility concerns (without reintroducing the information leak).

> ---
>  docs/man/xl.cfg.5.pod.in          | 17 +++++++++++++++++
>  tools/include/libxl.h             |  8 ++++++++
>  tools/libs/light/libxl_types.idl  |  2 ++
>  tools/libs/light/libxl_x86.c      |  4 ++++
>  tools/xl/xl_parse.c               |  7 +++++++
>  xen/arch/x86/domain.c             | 10 ++++++++++
>  xen/arch/x86/hvm/svm/svm.c        |  6 ++++++
>  xen/arch/x86/hvm/vmx/vmx.c        |  7 +++++++
>  xen/include/asm-x86/hvm/domain.h  |  3 +++
>  xen/include/public/arch-x86/xen.h |  8 ++++++++

This needs changes to the Ocaml bindings as well.=C2=A0 I guess I'll add th=
at
to the todo list.

~Andrew



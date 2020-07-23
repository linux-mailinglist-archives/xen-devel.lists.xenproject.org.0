Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F23822B0E2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 16:00:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyblU-0003jv-SL; Thu, 23 Jul 2020 14:00:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyblT-0003eT-5G
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 14:00:03 +0000
X-Inumbo-ID: cd1a5f4a-ccec-11ea-a2a8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd1a5f4a-ccec-11ea-a2a8-12813bfff9fa;
 Thu, 23 Jul 2020 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595512802;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tUxcXp+XsAThP5KE63cViOLa120K/x7jswjVAvp32SA=;
 b=EPKF1zInyHNAO4iRyB1mWDdznjEy7/5C2jbKwNCIQz8drG2Ux/hHAEoc
 OdhpzGXiH2CFIJAkV+Z0NtWCMXNgDvgpsVmMRhOqdmybWv0JQRFGJXRzo
 h9CsPTeL8Zcu8N5daWOtyJy4XGO9OcuvAAbtr2kDr3nmk68jgMwilS6ih k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +QVIcrGkzDbY1sC1JXGCJhALYgzzGqzN1o4PQCMi4Sf16hIF/SFhWylvazzkbu5Yt0pGABQiua
 acRDUA/6J2viG8z1rTsmk4aQ0I4EWAYja/7p9s8UKTMg4/OSZW32lg688RDD/3MCJw2iQJpnbJ
 D6+wnRqNU20jCo5Le9/piLYvZ7A+D7JIkouwmCalDGqwf7BUthM4i2DXAlDgWGBeiDs/5DMP4P
 rnw2OGcJwGV0uG5/zqnAdN8AB1pbcRRkdc1DL8SZdQVg5RT1gT+V+hCVWGcEX3cYCU3ofJP605
 Sc8=
X-SBRS: 2.7
X-MesageID: 23040644
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23040644"
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
Date: Thu, 23 Jul 2020 14:59:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, Wei
 Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 14:22, Julien Grall wrote:
> Hi Jan,
>
> On 23/07/2020 12:23, Jan Beulich wrote:
>> On 22.07.2020 18:53, Julien Grall wrote:
>>> --- a/xen/arch/x86/irq.c
>>> +++ b/xen/arch/x86/irq.c
>>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>>>         for ( ; ; )
>>>       {
>>> -        int irq = pirq->arch.irq;
>>> +        int irq = read_atomic(&pirq->arch.irq);
>>
>> There we go - I'd be fine this way, but I'm pretty sure Andrew
>> would want this to be ACCESS_ONCE(). So I guess now is the time
>> to settle which one to prefer in new code (or which criteria
>> there are to prefer one over the other).
>
> I would prefer if we have a single way to force the compiler to do a
> single access (read/write).

Unlikely to happen, I'd expect.

But I would really like to get rid of (or at least rename)
read_atomic()/write_atomic() specifically because they've got nothing to
do with atomic_t's and the set of functionality who's namespace they share.

>
> The existing implementation of ACCESS_ONCE() can only work on scalar
> type. The implementation is based on a Linux, although we have an
> extra check. Looking through the Linux history, it looks like it is
> not possible to make ACCESS_ONCE() work with non-scalar types:
>
>     ACCESS_ONCE does not work reliably on non-scalar types. For
>     example gcc 4.6 and 4.7 might remove the volatile tag for such
>     accesses during the SRA (scalar replacement of aggregates) step
>     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145)
>
> I understand that our implementation of read_atomic(), write_atomic()
> would lead to less optimized code.

There are cases where read_atomic()/write_atomic() prevent optimisations
which ACCESS_ONCE() would allow, but it is only for code of the form:

ACCESS_ONCE(ptr) |= val;

Which a sufficiently clever compiler could convert to a single `or $val,
ptr` instruction on x86, while read_atomic()/write_atomic() would force
it to be `mov ptr, %reg; or $val, %reg; mov %reg, ptr`.

That said - your note about GCC treating the pointed-to object as
volatile probably means it won't make the above optimisation, even
though it would be appropriate to do so.

> So maybe we want to import READ_ONCE() and WRITE_ONCE() from Linux?

There is no point.  Linux has taken a massive detour through wildly
different READ/WRITE_ONCE() functions (to fix the above GCC bugs), and
are now back to something very similar to ACCESS_ONCE().

~Andrew


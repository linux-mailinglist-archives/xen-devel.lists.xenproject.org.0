Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0492338D6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Dz7-0000S6-Cd; Thu, 30 Jul 2020 19:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZLI=BJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1Dz5-0000S1-L9
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:12:55 +0000
X-Inumbo-ID: ab34def8-d298-11ea-8dbe-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab34def8-d298-11ea-8dbe-bc764e2007e4;
 Thu, 30 Jul 2020 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596136374;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BoaBywZ5Q7aeJleDVmT69vyw13PTTVnrTp+Lzs+SSjA=;
 b=U7bwUoXoLG9/SwOh0XYh4fKEKOhqpOCQ6JBYmTWe+NZNq/y8iOfTg0+f
 IxA6lZkRLz2yKilCbi+xzphIRtw2hB5E2DJELzVKzuXGPMLR3DeiSuIkm
 ucoUtfAnJeKjHfoHvSmm2BATRFBzK7onkhUeyToAw1hpZ9ZUQI7Bns9Gt o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3NyI0uIfPXpMpFW3/ZGZJx9CWqmeiTDrCW+wvcWvzWwWcHNEFhkV2YlUGDO75dFgUxOp70LT2O
 3P/sNoWUNC2LEdowbuwqCmNcYE3sHA6qYR04fEKaPJNB0h+w9R+/u+VngBLfmS/FaYywSn1GEK
 ZDdyTZuCneBVObqPqD7HNH5gaZtC7Fbj2NWw0Dj7QmNiJhLWpiWAKrk0vsbugfzlS11EPebXKE
 6cYU16V7z9c+ex5oo/j207NqmHcsuEidkQUxvBSc1bCjIqs/rMeKOf9B8qcZzyIcVIRybFeJ2j
 /fY=
X-SBRS: 2.7
X-MesageID: 23907082
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,415,1589256000"; d="scan'208";a="23907082"
Subject: Re: [PATCH 3/5] xen/memory: Fix compat XENMEM_acquire_resource for
 size requests
To: Jan Beulich <jbeulich@suse.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-4-andrew.cooper3@citrix.com>
 <0c275cb5-55ec-b0b0-6ba8-cfa7ca23978b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d3c31bea-0c31-5822-15cb-226402c4ae75@citrix.com>
Date: Thu, 30 Jul 2020 20:12:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0c275cb5-55ec-b0b0-6ba8-cfa7ca23978b@suse.com>
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/07/2020 21:09, Jan Beulich wrote:
> On 28.07.2020 13:37, Andrew Cooper wrote:
>> Copy the nr_frames from the correct structure, so the caller doesn't
>> unconditionally receive 0.
>
> Well, no - it does get copied from the correct structure. It's just
> that the field doesn't get set properly up front.

You appear to be objecting to my use of the term "correct".

There are two structures.  One contains the correct value, and one
contains the wrong value, which happens to always be 0.

I stand by sentence as currently written.

> Otherwise you'll
> (a) build in an unchecked assumption that the native and compat
> fields match in type

Did you actually check?  Because I did before embarking on this course
of action.

In file included from /local/xen.git/xen/include/xen/guest_access.h:10:0,
                 from compat/memory.c:5:
/local/xen.git/xen/include/asm/guest_access.h:152:28: error: comparison
of distinct pointer types lacks a cast [-Werror]
     (void)(&(hnd).p->field == _s);                      \
                            ^
compat/memory.c:628:22: note: in expansion of macro ‘__copy_field_to_guest’
                 if ( __copy_field_to_guest(
                      ^~~~~~~~~~~~~~~~~~~~~

This is what the compiler thinks of the code, when nr_frames is changed
from uint32_t to unsigned long.


> and (b) set a bad example for people looking
> here

This entire function is a massive set of bad examples; the worst IMO
being the fact that there isn't a single useful comment anywhere in it
concerning how the higher level loop structure works.

I'm constantly annoyed that I need to reverse engineer it from scratch
every time I look at it, despite having a better-than-most understanding
of what it is trying to achieve, and how it is supposed to work.

I realise this is noones fault in particular, but it is not
fair/reasonable to claim that this change is the thing setting a bad
example in this file.

> and then cloning this code in perhaps a case where (a) is not
> even true. If you agree, the alternative change of setting
> cmp.mar.nr_frames from nat.mar->nr_frames before the call is

Is there more to this sentence?

While this example could be implemented (at even higher overhead) by
copying nat back to cmp before passing it back to the guest, the same is
not true for the changes required to fix batching (which is another
series the same size as this).

~Andrew


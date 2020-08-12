Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB396242EE7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 21:07:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5w4n-0006gd-Qq; Wed, 12 Aug 2020 19:06:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFni=BW=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k5w4n-0006gY-1Z
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 19:06:17 +0000
X-Inumbo-ID: ac6aa626-3b2f-49d1-ad00-0296771c3136
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac6aa626-3b2f-49d1-ad00-0296771c3136;
 Wed, 12 Aug 2020 19:06:15 +0000 (UTC)
Date: Wed, 12 Aug 2020 19:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1597259174;
 bh=PMownsmUwbuFOlyPi5dhIVFzFQCkS0K9oxg7k6T8eO0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=C5phErcGsqb+3G+J9KwBuEePspvsgK8/h/mIwOJHG/WDRr/XXlBKZNo9fQIjAwFCT
 0jXyOM7S9iON/mXnLVXsBjeEaVHW604PyPh0ANp49jFTdL0nMLPe8V+cOeCruQUs5J
 RhJVCU9iCicBjK1jLqGhiAOVzacyHRG8gKIkT6bM=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] arch/x86/setup.c: Ignore early boot parameters like
 no-real-mode
Message-ID: <iEyldvHWFXZA_7Xpgqaa_FADQCBGEu--Ab6oj2vDM3rLGKbCYcCWFl5q_GfZBHRN3IP77IQLLPzEFqupHvVwurwLMVQeBScoabJtROhiMbw=@trmm.net>
In-Reply-To: <c7afab8c-291c-df0d-7269-084093975ea0@citrix.com>
References: <On7D3GbE8WWWH3f-1bSvUFQDxFcHP3yg6NdfvffgKqPRjQmJKsPBKsPgCCEEHbt9r2A3yxvf3gARonkKF9M_n1f3UfLEFpnZ29J2-Jc35ls=@trmm.net>
 <c7afab8c-291c-df0d-7269-084093975ea0@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wednesday, August 12, 2020 8:16 PM, Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:

> However, the use of LINE creates problems for livepatch builds, as
> it causes the binary diffing tools to believe these changed, based on a
> change earlier in the file.

Ah, I hadn't considered that.  Makes sense that the
deterministic __COUNTER__ would be better for many uses.
However...

One concern is that the __COUNTER__ is per compilation unit,
which I think would mean that every file would conflict by
creating __setup_str_ign_0 for the first one, __setup_str_ign_1
for the next, etc.  Unless they are static scoped or have a
variable-name-friendly unique prefix, they aren't
suitable for globals that share a namespace.

Another is that each evaluation increments it, so the macro
would need some tricks to avoid double-evaluation since it
both defines __setup_str_ign_XYZ and references it in the
__kparam structure.  This is in contrast to __LINE__,
which is constant in the macro and based on the line where
it was invoked so the double evaluation is not a problem.

> Instead of opencoding TEMP_NAME(), can we borrow Linux's __UNIQUE_ID()
> infrastructure?=C2=A0 COUNTER appears to have existed for ages, and
> exists in all of our supported compilers.

I'm definitely in favor of borrowing it from Linux, although
subject to those two caveats.

> If you want, I can sort that out as a prereq patch, and rebase this one
> on top?

That sounds fine to me. They really are two separate patches.

--
Trammell



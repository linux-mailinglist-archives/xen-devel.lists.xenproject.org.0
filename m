Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0BF7B3812
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 18:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610634.950092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmGZS-0005VW-0y; Fri, 29 Sep 2023 16:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610634.950092; Fri, 29 Sep 2023 16:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmGZR-0005TD-Ug; Fri, 29 Sep 2023 16:42:29 +0000
Received: by outflank-mailman (input) for mailman id 610634;
 Fri, 29 Sep 2023 16:42:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LkXg=FN=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qmGZR-0005T7-9S
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 16:42:29 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d1607bb-5ee7-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 18:42:28 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bffa8578feso235825351fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Sep 2023 09:42:28 -0700 (PDT)
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
X-Inumbo-ID: 2d1607bb-5ee7-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696005747; x=1696610547; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z3RayBwtucIeYOJBYJcU44qYWWgYdJyFKw1GhJhGYEo=;
        b=jabxkHFCVpJ9VfypNWXDaQ5QQTPhS07vLir7lILltOnifWUG2ReCupfG2RnpHMRgJA
         hD77vUePWOmkbbi37ushze1xGAcRvvxjcyiZl4HKZIqHVYsb2Hdmp+kGQbofrgV2fTTV
         xjYAOoakH7eyuQ51ZruYXQOMzXT1ktFlqCk6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696005747; x=1696610547;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3RayBwtucIeYOJBYJcU44qYWWgYdJyFKw1GhJhGYEo=;
        b=nZ7tvSrcVcbOcxrAcQOH1PKdB7/cANLdhFONREVdmtkYTe+040PJ+heGfR9Ea266oF
         nAVUuGTIWKFIL2PD0L/macTqqFZyM5vt3QqrQ2PxiHcolVZKmNU4ba8UvKJVn6HOwd48
         ra+oauz1+ZQmrs8I0LJWWush8INlxcfz7ploiWJ7BEvDc7YfCc7x9sdesogM+jzty86t
         b8zU5OjuoQWAMmWJM9d1/2163YTtqbg98lA6rktquD+Jom00ycWzxdrNWPywmmQeLCTt
         BACA4+cy8OGsg7tOGIfWc+z6GoSlmFA6/8iZ95+RzKwjFdbeA3rUXJPvIOzzjCbXKEn2
         9wfQ==
X-Gm-Message-State: AOJu0YyHTrwWIHddhEBSg9hVVtI/gXFAg8beBYVYI0dymwjwbMYGkCd1
	bRsw4d7NBc4yIX0+V6TxU29Gp7C7gWuuNqw+chTmwcXbtsP5SmKsiIk=
X-Google-Smtp-Source: AGHT+IFuZ1OovX6uWjpk/NwTAun5kAwS1EZVURByyXM17qFdCIfGIkU/uS3BjHy6BgAJP2N9uE5yBDym6nTWTgZoOF0=
X-Received: by 2002:ac2:4898:0:b0:503:3816:c42c with SMTP id
 x24-20020ac24898000000b005033816c42cmr3839036lfc.41.1696005747157; Fri, 29
 Sep 2023 09:42:27 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 29 Sep 2023 17:42:16 +0100
Message-ID: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
Subject: Sketch of an idea for handling the "mixed workload" problem
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Demi Marie Obenour <demi@invisiblethingslab.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

The basic credit2 algorithm goes something like this:

1. All vcpus start with the same number of credits; about 10ms worth
if everyone has the same weight

2. vcpus burn credits as they consume cpu, based on the relative
weights: higher weights burn slower, lower weights burn faster

3. At any given point in time, the runnable vcpu with the highest
credit is allowed to run

4. When the "next runnable vcpu" on a runqueue is negative, credit is
reset: everyone gets another 10ms, and can carry over at most 2ms of
credit over the reset.

Generally speaking, vcpus that use less than their quota and have lots
of interrupts are scheduled immediately, since when they wake up they
always have more credit than the vcpus who are burning through their
slices.

But what about a situation as described recently on Matrix, where a VM
uses a non-negligible amount of cpu doing un-accelerated encryption
and decryption, which can be delayed by a few MS, as well as handling
audio events?  How can we make sure that:

1. We can run whenever interrupts happen
2. We get no more than our fair share of the cpu?

The counter-intuitive key here is that in order to achieve the above,
you need to *deschedule or preempt early*, so that when the interrupt
comes, you have spare credit to run the interrupt handler.  How do we
manage that?

The idea I'm working out comes from a phrase I used in the Matrix
discussion, about a vcpu that "foolishly burned all its credits".
Naturally the thing you want to do to have credits available is to
save them up.

So the idea would be this.  Each vcpu would have a "boost credit
ratio" and a "default boost interval"; there would be sensible
defaults based on typical workloads, but these could be tweaked for
individual VMs.

When credit is assigned, all VMs would get the same amount of credit,
but divided into two "buckets", according to the boost credit ratio.

Under certain conditions, a vcpu would be considered "boosted"; this
state would last either until the default boost interval, or until
some other event (such as a de-boost yield).

The queue would be sorted thus:

* Boosted vcpus, by boost credit available
* Non-boosted vcpus, by non-boost credit available

Getting more boost credit means having lower priority when not
boosted; and burning through your boost credit means not being
scheduled when you need to be.

Other ways we could consider putting a vcpu into a boosted state (some
discussed on Matrix or emails linked from Matrix):
* Xen is about to preempt, but finds that the vcpu interrupts are
blocked (this sort of overlaps with the "when we deliver an interrupt"
one)
* Xen is about to preempt, but finds that the (currently out-of-tree)
"dont_desched" bit has been set in the shared memory area

Other ways to consider de-boosting:
* There's a way to trigger a VMEXIT when interrupts have been
re-enabled; setting this up when the VM is in the boost state

Getting the defaults right might take some thinking.  If you set the
default "boost credit ratio" to 25% and the "default boost interval"
to 500ms, then you'd basically have five "boosts" per scheduling
window.  The window depends on how active other vcpus are, but if it's
longer than 20ms your system is too overloaded.

Thoughts?  Demi, what kinds of interrupt counts are you getting for your VM?

 -George


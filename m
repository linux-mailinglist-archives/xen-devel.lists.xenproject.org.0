Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A24D6C3E
	for <lists+xen-devel@lfdr.de>; Sat, 12 Mar 2022 04:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289320.490874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSsOE-0002ME-D3; Sat, 12 Mar 2022 03:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289320.490874; Sat, 12 Mar 2022 03:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSsOE-0002JT-9q; Sat, 12 Mar 2022 03:25:58 +0000
Received: by outflank-mailman (input) for mailman id 289320;
 Sat, 12 Mar 2022 03:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jeav=TX=freebsd.org=cperciva@srs-se1.protection.inumbo.net>)
 id 1nSsOC-0002JN-Ow
 for xen-devel@lists.xenproject.org; Sat, 12 Mar 2022 03:25:56 +0000
Received: from mail.tarsnap.com (mail.tarsnap.com [54.86.246.204])
 by se1-gles-flk1.inumbo.com (Halon) with SMTP
 id 1eb29636-a1b4-11ec-853a-5f4723681683;
 Sat, 12 Mar 2022 04:25:52 +0100 (CET)
Received: (qmail 87537 invoked from network); 12 Mar 2022 03:25:51 -0000
Received: from unknown (HELO dell7390.daemonology.net) (127.0.0.1)
 by mail.tarsnap.com with SMTP; 12 Mar 2022 03:25:51 -0000
Received: (qmail 88480 invoked from network); 12 Mar 2022 03:25:51 -0000
Received: from unknown (HELO ?127.0.0.1?) (127.0.0.1)
 by localhost with SMTP; 12 Mar 2022 03:25:51 -0000
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
X-Inumbo-ID: 1eb29636-a1b4-11ec-853a-5f4723681683
Message-ID: <3a0e1abd-678d-e01b-6949-02bb52e9c740@freebsd.org>
Date: Fri, 11 Mar 2022 19:25:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: statistical time calibration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <1ea5815b-df22-7884-d28b-bdcc1741e349@suse.com>
 <YitqvQxsJ1/hqfrg@Air-de-Roger>
From: Colin Percival <cperciva@freebsd.org>
In-Reply-To: <YitqvQxsJ1/hqfrg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone,

On 3/11/22 07:29, Roger Pau Monné wrote:
> On Tue, Jan 18, 2022 at 04:03:56PM +0100, Jan Beulich wrote:
>> 1) When deciding whether to increment "passes", both variance values have
>> an arbitrary value of 4 added to them. There's a sentence about this in
>> the earlier (big) comment, but it lacks any justification as to the chosen
>> value. What's worse, variance is not a plain number, but a quantity in the
>> same units as the base values. Since typically both clocks will run at
>> very difference frequencies, using the same (constant) value here has much
>> more of an effect on the lower frequency clock's value than on the higher
>> frequency one's.

This additional variance arises from the quantization, and so it scales with
the timing quantum.  It makes sense that it has a larger effect on a lower
frequency clock -- if you imagine trying to calibrate against a clock which
runs at 1 Hz, without this term you would read several identical values from
that clock and conclude that your clock runs at infinity Hz.

>> 2) The second of the "important formulas" is nothing I could recall or was
>> able to look up. All I could find are somewhat similar, but still
>> sufficiently different ones. Perhaps my "introductory statistics" have
>> meanwhile been too long ago ... (In this context I'd like to also mention
>> that it took me quite a while to prove to myself that the degenerate case
>> of, in particular, the first iteration wouldn't lead to an early exit
>> from the function.)

Most statistics courses present a formula for the absolute uncertainty in the
slope rather than the relative uncertainty.  But it's easy to derive one from
the other.

>> 3) At the bottom of the loop there is some delaying logic, leading to
>> later data points coming in closer succession than earlier ones. I'm
>> afraid I don't understand the "theoretical risk of aliasing", and hence
>> I'm seeing more risks than benefits from this construct.

Suppose it takes exactly 1 us to run through the loop but one of the clocks
runs at exactly 1000001 Hz.  Without the extra delay, we'll probably observe
the clock incrementing by 1 every time through the loop (since it would only
increment by 2 once a second) and end up computing the wrong frequency.  The
"noise" introduced by adding small (variable) delays eliminates any chance
of this scenario and makes the data points behave like the *random* data
points which the statistical analysis needs.

> Might be easier to just add Colin, he did the original commit and can
> likely answer those questions much better than me. He has also done a
> bunch of work for FreeBSD/Xen.

You're too generous... I think the only real Xen work I did was adding support
for indirect segment I/Os to blkfront.  Mostly I was just packaging things up
for EC2 (back when EC2 used Xen).

>> My main concern is with the goal of reaching accuracy of 1PPM, and the
>> loop ending only after a full second (if I got that right) if that
>> accuracy cannot be reached. Afaict there's no guarantee that 1PPM is
>> reachable. My recent observations suggest that with HPET that's
>> feasible (but only barely), but with PMTMR it might be more like 3 or
>> more.

The "give up after 1 second" thing is just "fall back to historical FreeBSD
behaviour".  In my experiments I found that calibrating against the i8254
we would get 1PPM in about 50 ms while HPET was 2-3 ms.

>> The other slight concern I have, as previously voiced on IRC, is the use
>> of floating point here.

FWIW, my first version of this code (about 5 years ago) used fixed-point
arithmetic.  It was far uglier so I was happy when the FreeBSD kernel became
able to use the FPU this early in the boot process.

-- 
Colin Percival
Security Officer Emeritus, FreeBSD | The power to serve
Founder, Tarsnap | www.tarsnap.com | Online backups for the truly paranoid


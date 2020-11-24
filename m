Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A92C227A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 11:05:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35682.67312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khVCG-0005BH-Ak; Tue, 24 Nov 2020 10:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35682.67312; Tue, 24 Nov 2020 10:05:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khVCG-0005As-7O; Tue, 24 Nov 2020 10:05:16 +0000
Received: by outflank-mailman (input) for mailman id 35682;
 Tue, 24 Nov 2020 10:05:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khVCE-0005An-Pr
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 10:05:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ddcddfa-1bc2-40b9-966e-0ecadce09127;
 Tue, 24 Nov 2020 10:05:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CCEFAC48;
 Tue, 24 Nov 2020 10:05:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khVCE-0005An-Pr
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 10:05:14 +0000
X-Inumbo-ID: 5ddcddfa-1bc2-40b9-966e-0ecadce09127
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5ddcddfa-1bc2-40b9-966e-0ecadce09127;
	Tue, 24 Nov 2020 10:05:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606212312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1LEu8xjN8h2skGlFztJ38qpXkl5P+Ns3SftVKPcF1U=;
	b=R397AY4KqBGf9JOsISTTJqS9QCQbMco58pPEWGSBB0Mm1O65V0WGArhNhV9JS2Ol83ns+Y
	pBMZTqIok3Xdk53RYR8M2j1IsvByYP9l2LihZWNRq0UjVp3Hcw95mgOsSkSed0hpx1Hhzn
	2+pp5xPEBPuDjy5SbqPORKQAy7rKWqQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8CCEFAC48;
	Tue, 24 Nov 2020 10:05:12 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
Date: Tue, 24 Nov 2020 11:05:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123173925.GG4662@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.11.2020 18:39, Manuel Bouyer wrote:
> On Mon, Nov 23, 2020 at 06:06:10PM +0100, Roger Pau Monné wrote:
>> OK, I'm afraid this is likely too verbose and messes with the timings.
>>
>> I've been looking (again) into the code, and I found something weird
>> that I think could be related to the issue you are seeing, but haven't
>> managed to try to boot the NetBSD kernel provided in order to assert
>> whether it solves the issue or not (or even whether I'm able to
>> repro it). Would you mind giving the patch below a try?
> 
> With this, I get the same hang but XEN outputs don't wake up the interrupt
> any more. The NetBSD counter shows only one interrupt for ioapic2 pin 2,
> while I would have about 8 at the time of the hang.
> 
> So, now it looks like interrupts are blocked forever.

Which may be a good thing for debugging purposes, because now we have
a way to investigate what is actually blocking the interrupt's
delivery without having to worry about more output screwing the
overall picture.

> At
> http://www-soc.lip6.fr/~bouyer/xen-log5.txt
> you'll find the output of the 'i' key.

(XEN)    IRQ:  34 vec:59 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=1 d0: 34(-MM)

(XEN)     IRQ 34 Vec 89:
(XEN)       Apic 0x02, Pin  2: vec=59 delivery=LoPri dest=L status=1 polarity=1 irr=1 trig=L mask=0 dest_id:00000001

(XEN) ioapic 2 pin 2 gsi 34 vector 0x67
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 0 dest id 0

IOW from guest pov the interrupt is entirely idle (mask and irr clear),
while Xen sees it as both in-flight and irr also already having become
set again. I continue to suspect the EOI timer not doing its job. Yet
as said before, for it to have to do anything in the first place the
"guest" (really Dom0 here) would need to fail to EOI the IRQ within
the timeout period. Which in turn, given your description of how you
handle interrupts, cannot be excluded (i.e. the handling may simply
take "slightly" too long).

What we're missing is LAPIC information, since the masked status logged
is unclear: (-MM) isn't fully matching up with "mask=0". But of course
the former is just a software representation, while the latter is what
the RTE holds. IOW for the interrupt to not get delivered, there needs
to be this or a higher ISR bit set (considering we don't use the TPR),
or (I think we can pretty much exclude this) we'd need to be running
with IRQs off for extended periods of time.

Jan


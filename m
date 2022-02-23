Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C94C170A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277436.473930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtjM-00057e-1Y; Wed, 23 Feb 2022 15:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277436.473930; Wed, 23 Feb 2022 15:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtjL-00055V-U2; Wed, 23 Feb 2022 15:39:03 +0000
Received: by outflank-mailman (input) for mailman id 277436;
 Wed, 23 Feb 2022 15:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qKPW=TG=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nMtjJ-00055L-W7
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:39:02 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a8b0b7-94be-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 16:38:59 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id fc19so8898112qvb.7
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 07:38:59 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254])
 by smtp.gmail.com with ESMTPSA id 69sm549784qkd.91.2022.02.23.07.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 07:38:57 -0800 (PST)
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
X-Inumbo-ID: b7a8b0b7-94be-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UrgR76SYCaiOabtaLMgHsrffACqxzmT9Cz1A/iSOws4=;
        b=NqPNRTaESp+kt20APAkd1YiBzthR7DTT5aUkuYgY/UsS8l8loKsgQvDNPGFex15QCG
         ChQsLJbkR0nIoVwhvkvrhG0AU+IebID2MKUSt3heoE5Rtgk8051jqMT9TfDI5sgvj6EJ
         tQu5BJO/J4dGTv9Lw96ybfaDi/yxjYxK31AZPMTw1PZWd+zgL/XB3lfR6boXoY/zQEI2
         Irx4nGXOAMf1kmfapHC253NNolB2gmnvHzMg9bIyiNIYfan3u7iUyEXKMONpHV2SIg5L
         t6yqRst5Egbzfqdyi3t6W+byS8ce/96Czk6h12YiEJta+AQNHS4Vg6HqHMM3Etxxz8Eb
         9tvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UrgR76SYCaiOabtaLMgHsrffACqxzmT9Cz1A/iSOws4=;
        b=W4jzYCX3N0KDnBMknfMGxlTm0tEZC19+VWGVnJ6wZhEmsZ0xUPcsJkHa6cBQwTP4mE
         3FH9mFh6yEBK6hsnEvGN4ZgafqZ0DOqfhR0Vb9T8D1gTa2wsyIKCIKv4A/hYWIVzvaFm
         JMCvNmRiXuXpHtR1MGEM6MOJdl3F48Rct9eTGaMA40JRXlL7y1ilUi7Qw2Dr/RsGXu3E
         hBOPb3ScxCIi+lvhdPLZEWH1epeTKnC7TPakOtZzEx2QoG1mZtfnY11+HKg6RoEpsyHQ
         GcMlWx4QkLzc0AkVp7Jsu6i1LtBSWeIEPiVdtRrQAphXvk/rxrxyb5bN/4Jyl3Z6V3Ra
         gPHw==
X-Gm-Message-State: AOAM5331jq0LWixq1OPkfnZl4+Xub0n939W4U9LABX5odOqwd0pInD29
	5xp1mwa1fwOXx6ogQvq5nWU=
X-Google-Smtp-Source: ABdhPJy4h6ut5/pesPAU0gGiA3QyeE5sDpE4nuMu3vn4F5jmMm0MHOUSxsXRH2fpUIRFltanNt8vCA==
X-Received: by 2002:ac8:5853:0:b0:2d6:8a16:753c with SMTP id h19-20020ac85853000000b002d68a16753cmr235274qth.401.1645630738212;
        Wed, 23 Feb 2022 07:38:58 -0800 (PST)
Message-ID: <d11e54d47776008c17762458e6abbd44ab0beed5.camel@gmail.com>
Subject: Re: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
From: Alex Olson <this.is.a0lson@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Date: Wed, 23 Feb 2022 09:38:56 -0600
In-Reply-To: <a1099ae9-9e0d-cf54-e786-835c13f2ba40@citrix.com>
References: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
	 <a1099ae9-9e0d-cf54-e786-835c13f2ba40@citrix.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I appreciate your interest, apologies for not replying right away. I've been
digging deeper to have a more meaningful resposne.

I had attempted to instrument the MSR reads, but only saw a small number reads
being blocked by the code change. They appear to be the list below and the
others seem fairly harmless:

0x00000034	MSR_SMI_COUNT
0x0000019a	IA32_CLOCK_MODULATION/MSR_IA32_THERM_CONTROL MSR
0x000003f8	MSR_PKG_C3_RESIDENCY
0x000003f9	MSR_PKG_C6_RESIDENCY
0x000003fa	MSR_PKG_C7_RESIDENCY
0x00000606	MSR_RAPL_POWER_UNIT
0x0000060d	MSR_PKG_C2_RESIDENCY
0x00000611	MSR_PKG_ENERGY_STATUS
0x00000619	MSR_DRAM_ENERGY_STATUS
0x00000630	MSR_PKG_C8_RESIDENCY
0x00000631	MSR_PKG_C9_RESIDENCY
0x00000632	MSR_PKG_C10_RESIDENCY
0x00000639	MSR_PP0_ENERGY_STATUS
0x00000641	MSR_PP1_ENERGY_STATUS

As for my test program, it is just a crude loop compiled with "gcc -O3",
normally takes about 10 seconds to execute:
int main()
{
    for (volatile int i=1; i!=0; ++i){}
    return 0;
}

The relative changes in execution time of the test program and also that  HVM
guest startup time (associated with the "qemu" process being busy) completely
agreed.  I also observed the same changes under a PVH guest for the test
program.

Thus, it seemed like the CPU was somehow operating a different frequency than
expected, rather than faults consuming execution time.

-- (after a lot more investigation) --

Further instrumentation showed that the
IA32_CLOCK_MODULATION/MSR_IA32_THERM_CONTROL MSR initially had value
"0x10"  which appears to be invalid both in the Intel Software Developer's
manual and what I think I'm seeing in the ACPI tables.

In dom0 Linux 5.2.38,  this value seems to have caused the
acpi_processor_get_throttling_ptc() function to see an invalid result from
acpi_get_throttling_state() and thus execute __acpi_processor_set_throttling()
which wrote the MSR with a value of zero and had the side effect of disabling
throttling (restoring normal performance).  (This all happened as the CPUs were
detected).

When the unknown MSR reads are blocked, the call to
__acpi_processor_set_throttling() did not occur since the MSR read did not
result in the invalid value -- thus the CPU remained in a throttling state.

So far, this seems to explain the dom0 performance issues I saw.

The domU observation was related... In some of my testing, dom0 was limited (via
Xen command-line) to a small number of cores so that the others could be
dedicated to other domains.  When a domU VM was launched on the others (not used
by dom0), its MSR remained at the original value resulting in low performance
since dom0 hadn't a chance to rewrite it...   Thus, I saw different domU
behavior based on the number of cores allocated to dom0.


-- summary --

In desparation, I ended up resetting BIOS settings to defaults and mysteriously
this issue doesn't occur anymore.  Not sure what could have gone wrong before as
the original settings were not far from defaults.  It seems my issues stemmed
from the server's BIOS setting the throttling MSR to an invalid value but it had
illuminated some unusual behaviors under Xen...

It seems to me there are a few findings useful to the Xen developers from
venturing down this rabbithole:

1) For conditions in which MSR registers are writeable from PV guests (such as
dom0),  they should probably be readable well, looks like MSR_IA32_THERM_CONTROL
is currently one of a small number of "unreadable" but writeable
MSRs.  Otherwise seemingly valid read-(check/modify)-write operations will
behave incorrectly under Xen.

2) As Xen controls CPU frequency and c-states,  might there be benefit to it
being extended to manage Clock Modulation / Throttling? (I wasn't expecting dom0
to be able to influence this!)

3) Perhaps PV domains (such as dom0) should not be allowed to modify such MSRs
at all since it would result in unintended effects depending on how CPU pools
and dom0 are managed?

Regards,

-Alex



On Thu, 2022-02-10 at 18:27 +0000, Andrew Cooper wrote:
> On 10/02/2022 17:27, Alex Olson wrote:
> > I'm seeing strange performance issues under Xen on a Supermicro server with
> > a Xeon D-1541 CPU caused by an MSR-related commit.
> > 
> > Commit 322ec7c89f6640ee2a99d1040b6f786cf04872cf 'x86/pv: disallow access to
> > unknown MSRs'
> > surprisingly introduces a severe performance penality where dom0 has about
> > 1/8th
> > the normal CPU performance. Even even when 'xenpm' is used to select the
> > performance governor and operate the CPU at maximum frequency, actual CPU
> > performance is still 1/2 of normal (as well as using
> > "cpufreq=xen,performance").
> > 
> > The patch below fixes it but I don't fully understand why.
> > 
> > Basically, when *reads* of MSR_IA32_THERM_CONTROL are blocked, dom0 and
> > guests (pinned to other CPUs) see the performance issues.
> > 
> > For benchmarking purposes, I built a small C program that runs a "for
> > loop" 
> > 4Billion iterations and timed its execution. In dom0, the
> > performance issues
> > also cause HVM guest startup time to go from 9-10
> > seconds to almost 80 seconds.
> > 
> > I assumed Xen was managing CPU frequency and thus blocking related MSR
> > access by dom0 (or any other domain). However,  clearly something else
> > is happening and I don't understand why.
> > 
> > I initially attempted to copy the same logic as the write MSR case. This
> > was effective at fixing the dom0 performance issue, but still left other
> > domains running at 1/2 speed. Hence, the change below has no access control.
> > 
> > 
> > If anyone has any insight as to what is really happening, I would be all
> > ears
> > as I am unsure if the change below is a proper solution.
> 
> Well that's especially entertaining...
> 
> So your patch edits pv/emul-priv-op.c#read_msr(), so is only changing
> the behaviour for PV dom0.
> 
> What exactly is your small C program doing?
> 
> 
> The change that that patch made was to turn a read which previously
> succeeded into a #GP fault.
> 
> The read has already been bogus, even if they appeared to work before. 
> When dom0 is scheduled around, it no longer knows which MSR it is
> actually reading, so at the best, the data being read is racy as to
> which CPU you're instantaneously scheduled on.
> 
> 
> At a guess, something in Linux is doing something especially dumb when
> given #GP and is falling into a tight loop of trying to read the MSR. 
> Do you happen to know which of those two is the more dominating factor?
> 
> ~Andrew





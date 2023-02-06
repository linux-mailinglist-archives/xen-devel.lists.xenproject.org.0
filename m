Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA5A68C7AB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 21:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490719.759540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP88M-0004tH-6S; Mon, 06 Feb 2023 20:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490719.759540; Mon, 06 Feb 2023 20:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP88M-0004r2-3f; Mon, 06 Feb 2023 20:30:38 +0000
Received: by outflank-mailman (input) for mailman id 490719;
 Mon, 06 Feb 2023 20:30:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=blJ1=6C=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pP88K-0004qw-K5
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 20:30:36 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19a5403b-a65d-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 21:30:32 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 316KUAaZ049716
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 6 Feb 2023 15:30:16 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 316KU9o2049715;
 Mon, 6 Feb 2023 12:30:09 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 19a5403b-a65d-11ed-93b5-47a8fe42b414
Date: Mon, 6 Feb 2023 12:30:09 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
Message-ID: <Y+FjUTXdcoy3W9th@mattapan.m5p.com>
References: <202302031801.313I1SdK033264@m5p.com>
 <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
 <15b88500-89b0-507a-601c-84a8102bb550@xen.org>
 <Y+EmIHDyvSCHjEo+@mattapan.m5p.com>
 <1d685b34-940b-b8ca-e689-b5a42eaccea1@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d685b34-940b-b8ca-e689-b5a42eaccea1@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Feb 06, 2023 at 05:07:50PM +0000, Julien Grall wrote:
> 
> On 06/02/2023 16:09, Elliott Mitchell wrote:
> > On Mon, Feb 06, 2023 at 10:38:32AM +0000, Julien Grall wrote:
> >>
> >> On 06/02/2023 07:29, Jan Beulich wrote:
> >>> On 22.07.2020 19:43, Elliott Mitchell wrote:
> >>>> Unlike other unsupportted options, ACPI support is required to *boot*
> >>>> for a number of platforms.  Users on these platforms are unable to use
> >>>> distribution builds and must rebuild from source to use Xen.
> >>>>
> >>>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> >>>
> >>> A general question first: How come this mail dates back to July 2020? I
> >>> had almost missed it as "new".
> >>
> >> I can't even find the Elliott's email in my inbox so reply here. But
> >> this sounds like a rehash of [1].
> > 
> > The date on Git patches is meant as an indicator for author date.  Since
> > this is a cherry-pick of a patch which was written >2 years ago
> > `git format-patch` indicates when it was written.  This IS how these
> > systems work.
> 
> Hmmm... I am a bit surprised to what you say. I have sent several 
> patches in the past with an old author date and they always showed as 
> the date sent in my inbox.

Dunno, but it was straight out of `git format-patch`.  I'm not using
`git send-email` though (that requires a setup distinct from what I'm
aiming for).


> >>   >> Unlike other unsupportted options, ACPI support is required to *boot*
> >>   >> for a number of platforms.  Users on these platforms are unable to use
> >>   >> distribution builds and must rebuild from source to use Xen.
> >>
> >> What platforms are you testing on? I know that this is working-ish on
> >> RPI4 and QEMU. But this will likely blow up on one of the server we
> >> support in OSSTest because we don't have proper support to hide SMMUs in
> >> dom0.
> > 
> > I've been doing RPI4 w/EDK2.  Which works for my purpose, the remaining
> > trouble spot for my purpose is needing a final resolution of the EFIFB
> > situation.
> 
> I have had no feedback from the relevant person on EFIFB patch and I am 
> not planning to purse the work in the near future.

Okay, thanks for the news.  Hopefully efifb on Xen support gets into
kernels closer to the Linux HEAD.


> >>>> --- a/xen/arch/arm/Kconfig
> >>>> +++ b/xen/arch/arm/Kconfig
> >>>> @@ -29,13 +29,18 @@ menu "Architecture Features"
> >>>>    source "arch/Kconfig"
> >>>>    
> >>>>    config ACPI
> >>>> -	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
> >>>> +	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"
> >>
> >> The concerns I raised in [1] still stand. Most of the ACPI platform will
> >> also have support for IOMMUs. If we have support for IORT in Xen, then I
> >> would be a lot more amenable to remove the "UNSUPPORTED". And without
> >> that support we are going to do more harm and than good.
> > 
> > Okay, this has been a known issue for *years* and yet remains unresolved
> > despite being a major issue.
> 
> Right, the situation hasn't changed much since you last sent your patch 
> to drop EXPERT/UNSUPPORTED.
> 
> Unless you fancy working on ACPI, I don't really see the situation 
> changing soon.

The situation is changing in large entities are pushing ACPI for ARM.  If
they succeed (likely) then it will be a case of Xen/ARM MUST support
ACPI, or else the project will die.  There is always a chance I might end
up going after this, but that doesn't seem too likely in the near future.

> >  Might be an abomination, but would it work
> > to find the string "IORT" and change it to "iort", "RTIO" or "IOXN" to
> > prevent Dom0 from finding it?
> 
> Unfortunately no because there IORT is used to describing mapping for 
> the GICv3 ITS which is currently working when ACPI is enabled in Xen.

The original advantage of Xen was paravirtualization.  Might this
be a case where it is better to have Domain 0 compensate and know the
SMMU is unusable with current versions of Xen?

> > This ends up turning into a question of what are the cases and which are
> > more common?
> > 
> > Case1: DT-only: Unchanged
> > 
> > Case2: Switchable between DT and ACPI, w/o SMMU: Starts working with ACPI
> > 
> > Case3: Switchable between DT and ACPI, w/SMMU: Unchanged, ACPI mode still
> > doesn't work, but the failure is different.
> > 
> > Case4: Concurrent DT and ACPI support, w/o SMMU: Unchanged
> 
> So Xen would start using ACPI rather than DT.I think we should default 
> DT it until we have the ACPI support completed.

Isn't this precisely what the proposed change does?  Are you suggesting,
if both DT and ACPI are present, prevent Dom0 from seeing ACPI?  If
you're suggesting doing futher masking, perhaps only if SMMU is present?

> > Case5: Concurrent DT and ACPI support, w/SMMU: Breaks if Dom0 tries to
> > use ACPI
> > 
> > Case6: ACPI-only, w/o SMMU: Starts working out-of-box
> > 
> > Case7: ACPI-only, w/SMMU: Unchanged (still broken)
> 
> To clarify, this will boot but then start to break in very subtle way.

Which suggests a need to provide warnings the situation is known to be
broken.

> > So case 5 is a problem, but cases 2 and 6 are positive.  Does the classic
> > workaround of "acpi=off" work for Linux as Dom0?  If that is "yes", then
> > publicizing that workaround (should be detectable by Xen) seems a likely
> > short-term solution.
> > 
> > My impression is ACPI is getting increasing support in on ARM.  The
> > number of mentions suggests if they keep going it looks likely to win.
> > The EDK2 project has been providing an image for RPI4 and the
> > functionality is impressive.
> 
> AFAIK, the push is drove by Arm Server and Windows on Arm. Does EDK2 on 
> RPI4 still provide both DT and ACPI?

Some time back I had tried enabling that, but it appeared rather broken.
Might well be I was using a kernel which didn't match their DT and thus
it was quite broken (which is the major advantage of ACPI).

> > Ultimately this is more a decision for Xen Project management, than the
> > technical side.  Are things in shape where they can be rolled out?
> 
> No. But as I wrote before, I don't believe the gap is very big.
> 
> >  Is
> > ACPI support important enough to need rolling out now?
> > 
> > I'm unsure about the former, but the latter seems a distinct "yes" since
> > ACPI appears to be the future.
> 
> ACPI is indeed picking up the pace on Arm Server and platform where 
> Windows on Arm is supported. But that should not only be the reason to 
> remove UNSUPPORTED.

Well good news is I'm not proposing removing the unsupported marking.
I'm proposing to enable ACPI by default.  I think it is reasonable to
add more warnings at runtime of the setup not being supported.

> You are right that enabling ACPI by default will draw more users. But I 
> also expect those users to be less familiar with Xen and therefore not 
> very interested to fix bugs. So removing EXPERT/UNSUPPORTED is probably 
> going to still make them unhappy as I don't think the help (including 
> writing patch) for ACPI on Arm will change very much in the near future 
> (from the community call I was under the impression you could not commit 
> time for it).

The average level of technical competence may be lower, but the larger
pool of people should yield enough to get additional problems fixed.

> So I am not convinced this is really making Xen in a better position 
> right now.

Right now the present situation is *actively* pushing people who want to
use Xen on ACPI-only ARM boards away.  If virtualization is important for
them, they are likely to instead opt for KVM, VMWare, Hyper-V, or Bhyve.
Suppressing mindshare will destroy the future of Xen on ARM.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




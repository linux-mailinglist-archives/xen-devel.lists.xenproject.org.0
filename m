Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CA2CF803
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 01:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45147.80647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klLZP-00084h-42; Sat, 05 Dec 2020 00:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45147.80647; Sat, 05 Dec 2020 00:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klLZP-00084I-0y; Sat, 05 Dec 2020 00:37:03 +0000
Received: by outflank-mailman (input) for mailman id 45147;
 Sat, 05 Dec 2020 00:37:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iti=FJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klLZO-00084D-8K
 for xen-devel@lists.xenproject.org; Sat, 05 Dec 2020 00:37:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59733e19-0468-4028-8d44-c1f968e60e5b;
 Sat, 05 Dec 2020 00:37:01 +0000 (UTC)
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
X-Inumbo-ID: 59733e19-0468-4028-8d44-c1f968e60e5b
Date: Fri, 4 Dec 2020 16:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607128620;
	bh=yma7yq/yKCuI+pjFvNwOtQ17RgOO/1A/Xl2Ety3bIsQ=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=T5HBmsUzCbCKSu/uyQqcx8KeKgurIwq9LaXufHrrLzzKW5QZEOvz3P4HwpkvHuN/K
	 ZygOloC/XJFCke5dsLpqkekTjbHRlToYgEPg9S6zEk06VoGgH8WHsV/o7/23J3ypRw
	 i9ZBXoyHzAZjd57hbcjtZOEXXGtKIkRSq8rPdOAQGG1j21jd4VuI8s4dqaMzeFh7eb
	 ZQdRW77MD0GZWTxwbl7UYSs22GN2tQ/BT/5WxTwaQnEABuz5drM/8g9Knze1wKdIuH
	 6Zkz6tMx1KEKMpgE9EaopOqqywNwEeKvSrGCnjK+ZxhZNlIoc52ZcpQDFTwnxZdUKA
	 BcjIUgWzMzT6A==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
In-Reply-To: <2F7BDAAC-4253-4D92-A995-12AA1361AE35@arm.com>
Message-ID: <alpine.DEB.2.21.2012041636340.32240@sstabellini-ThinkPad-T480s>
References: <cover.1606742184.git.bertrand.marquis@arm.com> <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com> <87lfei7fj5.fsf@epam.com> <AB32AAFF-DD1D-4B13-ABC0-06F460E95E1C@arm.com> <87sg8p687j.fsf@epam.com>
 <87243486-2A58-4497-B566-5FDE4158D18E@arm.com> <87h7p55uwj.fsf@epam.com> <80D814EA-B0FC-4975-BB08-4D7DAE8C8B56@arm.com> <2F7BDAAC-4253-4D92-A995-12AA1361AE35@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-128729673-1607128620=:32240"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-128729673-1607128620=:32240
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 2 Dec 2020, Bertrand Marquis wrote:
> > On 2 Dec 2020, at 11:12, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
> > 
> > HI Volodymyr,
> > 
> >> On 1 Dec 2020, at 16:54, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:
> >> 
> >> 
> >> Hi,
> >> 
> >> Bertrand Marquis writes:
> >> 
> >>> Hi Volodymyr,
> >>> 
> >>>> On 1 Dec 2020, at 12:07, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:
> >>>> 
> >>>> 
> >>>> Hi,
> >>>> 
> >>>> Bertrand Marquis writes:
> >>>> 
> >>>>> Hi,
> >>>>> 
> >>>>>> On 30 Nov 2020, at 20:31, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:
> >>>>>> 
> >>>>>> 
> >>>>>> Bertrand Marquis writes:
> >>>>>> 
> >>>>>>> Add support for emulation of cp15 based ID registers (on arm32 or when
> >>>>>>> running a 32bit guest on arm64).
> >>>>>>> The handlers are returning the values stored in the guest_cpuinfo
> >>>>>>> structure.
> >>>>>>> In the current status the MVFR registers are no supported.
> >>>>>> 
> >>>>>> It is unclear what will happen with registers that are not covered by
> >>>>>> guest_cpuinfo structure. According to ARM ARM, it is implementation
> >>>>>> defined if such accesses will be trapped. On other hand, there are many
> >>>>>> registers which are RAZ. So, good behaving guest can try to read one of
> >>>>>> that registers and it will get undefined instruction exception, instead
> >>>>>> of just reading all zeroes.
> >>>>> 
> >>>>> This is true in the status of this patch but this is solved by the next patch
> >>>>> which is adding proper handling of those registers (add CP10 exception
> >>>>> support), at least for MVFR ones.
> >>>>> 
> >>>>> From ARM ARM point of view, I did handle all registers listed I think.
> >>>>> If you think some are missing please point me to them as O do not
> >>>>> completely understand what are the “registers not covered” unless
> >>>>> you mean the MVFR ones.
> >>>> 
> >>>> Well, I may be wrong for aarch32 case, but for aarch64, there are number
> >>>> of reserved registers in IDs range. Those registers should read as
> >>>> zero. You can find them in the section "C5.1.6 op0==0b11, Moves to and
> >>>> from non-debug System registers and Special-purpose registers" of ARM
> >>>> DDI 0487B.a. Check out "Table C5-6 System instruction encodings for
> >>>> non-Debug System register accesses".
> >>> 
> >>> The point of the serie is to handle all registers trapped due to TID3 bit in HCR_EL2.
> >>> 
> >>> And i think I handled all of them but I might be wrong.
> >>> 
> >>> Handling all registers for op0==0b11 will cover a lot more things.
> >>> This can be done of course but this was not the point of this serie.
> >>> 
> >>> The listing in HCR_EL2 documentation is pretty complete and if I miss any register
> >>> there please tell me but I do no understand from the documentation that all registers
> >>> with op0 3 are trapped by TID3.
> >> 
> >> My concern is that the same code may observe different effects when
> >> running in baremetal mode and as VM.
> >> 
> >> For example, we are trying to run a newer version of a kernel, that
> >> supports some hypothetical ARMv8.9. And it tries to read a new ID
> >> register which is absent in ARMv8.2. There are possible cases:
> >> 
> >> 0. It runs as a baremetal code on a compatible architecture. So it just
> >> accesses this register and all is fine.
> >> 
> >> 1. It runs as baremetal code on older ARM8 architecture. Current
> >> reference manual states that those registers should read as zero, so
> >> all is fine, as well.
> >> 
> >> 2. It runs as VM on an older architecture. It is IMPLEMENTATION DEFINED
> >> if HCR.ID3 will cause traps when access to unassigned registers:
> >> 
> >> 2a. Platform does not cause traps and software reads zeros directly from
> >> real registers. This is a good outcome.
> >> 
> >> 2b. Platform causes trap, and your code injects the undefined
> >> instruction exception. This is a case that bothers me. Well written code
> >> that is tries to be compatible with different versions of architecture
> >> will fail there.
> >> 
> >> 3. It runs as VM on a never architecture. I can only speculate there,
> >> but I think, that list of registers trapped by HCR.ID3 will be extended
> >> when new features are added. At least, this does not contradict with the
> >> current IMPLEMENTATION DEFINED constraint. In this case, hypervisor will
> >> inject exception when guest tries to access a valid register.
> >> 
> >> 
> >> So, in my opinion and to be compatible with the reference manual, we
> >> should allow guests to read "Reserved, RAZ" registers.
> > 
> > Thanks for the very detailed explanation, I know better understand what you
> > mean here.
> > 
> > I will try to check if we could return RAZ for “other” op0=3 registers and what
> > should be done on cp15 registers to have something equivalent.
> > 
> 
> In fact I need to add handling for other registers mentionned by the TID3
> description in the armv8 architecture manual:
> "This field traps all MRS accesses to registers in the following range that are not
> already mentioned in this field description: Op0 == 3, op1 == 0, CRn == c0,
>  CRm == {c1-c7}, op2 == {0-7}.”
> "This field traps all MRC accesses to encodings in the following range that are not
> already mentioned in this field description: coproc == p15, opc1 == 0, CRn == c0,
> CRm == {c2-c7}, opc2 == {0-7}.”
> 
> I will check how i can do that.
> 
> Thanks a lot for the review.

Well spotted Volodymyr!
--8323329-128729673-1607128620=:32240--


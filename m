Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A767491C9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 01:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559547.874607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBpK-00053c-Di; Wed, 05 Jul 2023 23:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559547.874607; Wed, 05 Jul 2023 23:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBpK-00051Y-B4; Wed, 05 Jul 2023 23:22:26 +0000
Received: by outflank-mailman (input) for mailman id 559547;
 Wed, 05 Jul 2023 23:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHBpI-00051S-JW
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 23:22:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c93d90d6-1b8a-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 01:22:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A82361873;
 Wed,  5 Jul 2023 23:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E5FC433C8;
 Wed,  5 Jul 2023 23:22:15 +0000 (UTC)
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
X-Inumbo-ID: c93d90d6-1b8a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688599338;
	bh=2FUWcLyefO4K9IhiYR9eAWGie4xg0l1+Lv4GPuBDxDI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XCRgiQsctdiMTB0BOIIY5cEdiQs9G1DAImGgYwWwTTFo3VUGWZnrWoXdexG1+SjfT
	 ILZglbYVr2lcDBt3BS4CTfa0XFcVBMHrDgCa/A3+fsjDA0+z/+PKTTJkbETgEaOUM3
	 O7QGsUpCfy1geqxvkUWxi2GiHqQ2sHrWUmF/4SIugx1zmbqDOcZW21d/3weEx+mAlF
	 MpTdI6PsoEL5u4TxYkQD7bgoUbY0GUMew3VIol9Sy7sLoYM18Lkt5I3d+4gYf8F2e6
	 SYsrpoGKb+SA3V+CUw2mxmF6Rq7cX2jH718pgh/RAyVSj6BqOk8lM1MtPZe9tqyK4o
	 MT5gIKVQEMjbw==
Date: Wed, 5 Jul 2023 16:22:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] x86: make function declarations consistent with
 definitions
In-Reply-To: <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307051604380.761183@ubuntu-linux-20-04-desktop>
References: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com> <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Jul 2023, Jan Beulich wrote:
> On 04.07.2023 12:23, Federico Serafini wrote:
> > Change mechanically the parameter names and types of function
> > declarations to be consistent with the ones used in the corresponding
> > definitions so as to fix violations of MISRA C:2012 Rule 8.3 ("All
> > declarations of an object or function shall use the same names and type
> > qualifiers") and MISRA C:2012 Rule 8.2 ("Function types shall be in
> > prototype form with named parameters").
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> On top of my earlier remark (when this was part of a series):

Hi Jan,

I am not addressing specifically this comment. I am trying to build a
common understanding on how to do things so that we can go faster in the
future.

In general, as discussed at Xen Summit, in order to successfully merge
large numbers of changes in the coming weeks we should try to keep
mechanical changes mechanical. Separate non-mechanical changes into
different patches.

This patch is large but mechanical. If I understand you correctly, you
are asking:
1) to split the patch into smaller patches
2) make a couple of non-mechanical changes described below


For 1), in my opinion it is not necessary as long as all changes remain
mechanical. If some changes are not mechanical they should be split out.
So if you are asking non-mechanical changes in 2), then 2) should be
split out but everything else could stay in the same patch.

If you'd still like the patch to be split, OK but then you might want to
suggest exactly how it should be split because it is not obvious: all
changes are similar, local, and mechanical. I for one wouldn't know how
you would like this patch to be split.


For 2), I would encourage you to consider the advantage of keeping the
changes as-is in this patch, then send out a patch on top the way you
prefer. That is because it costs you more time to describe how you
would like these lines to be changed in English and review the full
patch a second time, than change them yourself and anyone could ack them
(feel free to CC me).

For clarity: I think it is totally fine that you have better suggestions
on parameter names. I am only pointing out that providing those
suggestions as feedback in an email reply is not a very efficient way to
get it done.


> > --- a/xen/arch/x86/cpu/mcheck/x86_mca.h
> > +++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
> > @@ -113,7 +113,7 @@ static inline int mcabanks_test(int bit, struct mca_banks* banks)
> >      return test_bit(bit, banks->bank_map);
> >  }
> >  
> > -struct mca_banks *mcabanks_alloc(unsigned int nr);
> > +struct mca_banks *mcabanks_alloc(unsigned int nr_mce_banks);
> 
> I'm not convinced here.
> 
> > --- a/xen/arch/x86/hvm/rtc.c
> > +++ b/xen/arch/x86/hvm/rtc.c
> > @@ -59,7 +59,7 @@ enum rtc_mode {
> >  static void rtc_copy_date(RTCState *s);
> >  static void rtc_set_time(RTCState *s);
> >  static inline int from_bcd(RTCState *s, int a);
> > -static inline int convert_hour(RTCState *s, int hour);
> > +static inline int convert_hour(RTCState *s, int raw);
> 
> Nor here.
> 
> > --- a/xen/arch/x86/include/asm/guest_pt.h
> > +++ b/xen/arch/x86/include/asm/guest_pt.h
> > @@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
> >  
> >  bool
> >  guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
> > -                  unsigned long va, walk_t *gw, uint32_t pfec,
> > +                  unsigned long va, walk_t *gw, uint32_t walk,
> >                    gfn_t top_gfn, mfn_t top_mfn, void *top_map);
> 
> While the definition's use of "walk" makes clear why the variable is
> named the way it is despite being used with PFEC_* constants, not
> naming it "pfec" here will add confusion, as the connection to those
> constants will be lost. One will then be forced to go look at the
> definition, when looking at the declaration ought to be sufficient.
> 
> I'm not going to look further, but instead repeat my suggestion to
> split this patch. Besides reducing the Cc list(s), that'll also
> help getting in parts which are uncontroversial (like e.g. the
> change to xen/arch/x86/hvm/vioapic.c).


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A031E7B70BC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 20:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612311.952186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnk1l-0001Qp-OS; Tue, 03 Oct 2023 18:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612311.952186; Tue, 03 Oct 2023 18:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnk1l-0001OZ-Ld; Tue, 03 Oct 2023 18:21:49 +0000
Received: by outflank-mailman (input) for mailman id 612311;
 Tue, 03 Oct 2023 18:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPao=FR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnk1k-0001OT-AU
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 18:21:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b50fce46-6219-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 20:21:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0D431B81BC3;
 Tue,  3 Oct 2023 18:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E67C433C8;
 Tue,  3 Oct 2023 18:21:41 +0000 (UTC)
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
X-Inumbo-ID: b50fce46-6219-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696357303;
	bh=1J7nQ/gIvvrAldmrmlmfxKo2sAUEHuJ+z3hF1KA+kxo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dHoqFzV9QZIQU7Y9XtkOx5A3+uhctqtx/jS/19Tz8G5Yp/323TK4KfBPtEeUQXoKa
	 nwe/QsVEJZvlRoLSneMoOq3ef9awDVzQA6M79tSNAaqz0+OOwGQIUaNX+iltskVICH
	 xKsmKg5c8fuAjXWuTJcgGdFEijMZcSXmklTqmpTaYqWQgPqbNSRi7o75GdkMQg+22V
	 OfPWIuHgZaWE+w5PgKujw0DxmlbEIj+T+zqMlCjkmbKsvPSAkz7mpKgdvj4I86YJcA
	 kD8M4B+4TUdMOttWsb4x+iAyF8xyhBkJLPPx2hGMQ9T7f1tecYjpzPbPCstPkp/IEy
	 GLPtTBwwzYZZQ==
Date: Tue, 3 Oct 2023 11:21:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
In-Reply-To: <2ff3ae18-0064-42ac-88fd-a46c4332a5dc@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2310031113420.2348112@ubuntu-linux-20-04-desktop>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com> <1f271e93-7409-4a8d-9841-368722d6aa43@citrix.com> <58213BE0-ADC4-47A0-B169-2E2E3B76D9C3@arm.com> <2ff3ae18-0064-42ac-88fd-a46c4332a5dc@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-682720270-1696357122=:2348112"
Content-ID: <alpine.DEB.2.22.394.2310031118450.2348112@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-682720270-1696357122=:2348112
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310031118451.2348112@ubuntu-linux-20-04-desktop>

On Tue, 3 Oct 2023, Andrew Cooper wrote:
> On 03/10/2023 6:14 pm, Luca Fancellu wrote:
> >
> >> On 3 Oct 2023, at 17:17, andrew.cooper3@citrix.com wrote:
> >>
> >> On 03/10/2023 4:37 pm, Nicola Vetrini wrote:
> >>> As specified in rules.rst, these constants can be used
> >>> in the code.
> >>> Their deviation is now accomplished by using a SAF comment,
> >>> rather than an ECLAIR configuration.
> >>>
> >>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>> ---
> >>> automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ------
> >>> docs/misra/safe.json                             | 8 ++++++++
> >>> xen/arch/x86/hvm/svm/emulate.c                   | 6 +++---
> >>> xen/arch/x86/hvm/svm/svm.h                       | 9 +++++++++
> >>> xen/common/inflate.c                             | 4 ++--
> >>> 5 files changed, 22 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> index d8170106b449..fbb806a75d73 100644
> >>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> @@ -132,12 +132,6 @@ safe."
> >>> # Series 7.
> >>> #
> >>>
> >>> --doc_begin="Usage of the following constants is safe, since they are given as-is
> >>> -in the inflate algorithm specification and there is therefore no risk of them
> >>> -being interpreted as decimal constants."
> >>> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
> >>> --doc_end
> >>> -
> >>> -doc_begin="Violations in files that maintainers have asked to not modify in the
> >>> context of R7.2."
> >>> -file_tag+={adopted_r7_2,"^xen/include/xen/libfdt/.*$"}
> >>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> >>> index 39c5c056c7d4..7ea47344ffcc 100644
> >>> --- a/docs/misra/safe.json
> >>> +++ b/docs/misra/safe.json
> >>> @@ -20,6 +20,14 @@
> >>>         },
> >>>         {
> >>>             "id": "SAF-2-safe",
> >>> +            "analyser": {
> >>> +                "eclair": "MC3R1.R7.1"
> >>> +            },
> >>> +            "name": "Rule 7.1: constants defined in specifications, manuals, and algorithm descriptions",
> >>> +            "text": "It is safe to use certain octal constants the way they are defined in specifications, manuals, and algorithm descriptions."
> >>> +        },
> >>> +        {
> >>> +            "id": "SAF-3-safe",
> >>>             "analyser": {},
> >>>             "name": "Sentinel",
> >>>             "text": "Next ID to be used"
> >>> diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
> >>> index aa2c61c433b3..c5e3341c6316 100644
> >>> --- a/xen/arch/x86/hvm/svm/emulate.c
> >>> +++ b/xen/arch/x86/hvm/svm/emulate.c
> >>> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
> >>>         if ( !instr_modrm )
> >>>             return emul_len;
> >>>
> >>> -        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &&
> >>> -             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
> >>> -             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )
> >>> +        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* SAF-2-safe */
> >>> +             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* SAF-2-safe */
> >>> +             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* SAF-2-safe */
> >>>             return emul_len;
> >>>     }
> > Hi Andrew,
> >
> >> This is line noise, and later examples are even worse.
> >>
> >> What does SAF mean?  It's presumably not the Scalable Agile Framework.
> > Please have a look on docs/misra/documenting-violations.rst, you will find all the
> > info about it.
> 
> Thankyou for proving my point perfectly.
> 
> The comment in the source code needs to be *far* clearer than it
> currently is.
> 
> Even s/SAF/ANALYSIS/ would be an improvement, because it makes the
> comment very clear that it's about code analysis.  An unknown initialism
> like SAF does not convey enough meaning to be useful.

Hi Andrew,

I am OK with a rename of the "SAF" tag.

The number of instances is still small enough that a rename can be done
at this point in time. Given that the SAF framework was reviewed by
multiple people, and we already have a few SAF tags in the code base and
even more in my for-4.19 branch, I suggest to start a separate thread on
the topic.

A new thread with a clear subject like "rename SAF to BLAH" and CCing
all the maintainers in the MISRA C working group to make sure everyone
is aware.

Ideally the email should also have a couple of good suggestions for new
tags. I don't have a strong opinion on the name. ANALYSIS is not great
because the tag is meant to say that the line below is safe even if some
MISRA C scanners might find an issue with it. SAF is meant to remind us
of "SAFE". So I would prefer to add the letter "E" and call it "SAFE".

If we can come up with 3-5 options then we can have a doodle poll or
something.

Cheers,

Stefano
--8323329-682720270-1696357122=:2348112--


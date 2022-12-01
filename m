Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096263F383
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450832.708300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lIA-0003sd-JE; Thu, 01 Dec 2022 15:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450832.708300; Thu, 01 Dec 2022 15:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lIA-0003pL-GA; Thu, 01 Dec 2022 15:16:02 +0000
Received: by outflank-mailman (input) for mailman id 450832;
 Thu, 01 Dec 2022 15:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAsL=37=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0lI9-0003pF-0w
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:16:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f884cf1-718b-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 16:15:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2541B81F0A;
 Thu,  1 Dec 2022 15:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D68C433C1;
 Thu,  1 Dec 2022 15:15:55 +0000 (UTC)
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
X-Inumbo-ID: 0f884cf1-718b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669907757;
	bh=aKOtdImn76rXlhrOQiWVcgLyFe3FcoSd7xOxRfIZcvo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=so0TaHM28hfvw5oggxWxMaX7w+gXE0XvX5Hwna6nLaMvuiyWIEklRnc1ChMoeWzgf
	 pEOkvBASff+r5wYCi3e93Ze34eyPO7XC3CKEf29H7Hd4gleipLJOqgsigioqzarbJ2
	 gyw/QR8jbu4Hjt8ro48N9Q68c8eq7EeCbAAxGBriIX2H/pzVkbO4AFFXw+AWp8LLm4
	 AMDtvPdyIbptjL9d7NKr/Gavdeq0re1RCcKiPZ69D2JxyfZkssHjQpWXO46WOLkTno
	 AshKzAFf9Fv9ocWUN3txMXszBOfNJ9+v/6PkmnnzSbiGlgbb0RAx7KXBVZFncgKIZ0
	 pL3y/MssYmQ7Q==
Date: Thu, 1 Dec 2022 07:15:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
In-Reply-To: <e5aacddc-1149-6a8d-4840-836edb3ad0c0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2212010715190.4039@ubuntu-linux-20-04-desktop>
References: <20221128141006.8719-1-luca.fancellu@arm.com> <20221128141006.8719-3-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2211291607280.4039@ubuntu-linux-20-04-desktop> <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com> <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
 <471b6470-b0b7-a97d-2114-a1871e237a89@suse.com> <3FE8EBB1-B565-4257-B966-BD1E97E32451@arm.com> <e5aacddc-1149-6a8d-4840-836edb3ad0c0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Dec 2022, Jan Beulich wrote:
> On 01.12.2022 12:18, Luca Fancellu wrote:
> >> On 1 Dec 2022, at 08:33, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 30.11.2022 21:26, Stefano Stabellini wrote:
> >>> On Wed, 30 Nov 2022, Luca Fancellu wrote:
> >>>>> I think the revert of the cppcheck integration in xen/Makefile and
> >>>>> xen/tools/merge_cppcheck_reports.py could be a separate patch. There is
> >>>>> no need to make sure cppcheck support in the xen Makefile is
> >>>>> "bisectable". That patch could have my acked-by already.
> >>>>
> >>>> Ok I will split these changes in a following patch
> >>>>
> >>>>>
> >>>>> Also the document changes introduced in this patch have my reviewed-by:
> >>>>> - docs/misra/cppcheck.txt
> >>>>> - docs/misra/documenting-violations.rst
> >>>>> - docs/misra/false-positive-cppcheck.json
> >>>>> - docs/misra/xen-static-analysis.rst
> >>>>
> >>>> Thank you, should I put those files in a separate patch with your rev-by before
> >>>> this patch or this is just a comment for you to remember which file you already
> >>>> reviewed?
> >>>
> >>> If Jan and the other reviewers are OK, I think you could split them out
> >>> in a separate patch and add my reviewed-by. If Jan prefers to keep it
> >>> all together in one patch, then I wrote it down so that I remember what
> >>> I have already acked :-)
> >>
> >> Docs changes being split off and going in first is okay as long as what
> >> is being documented is present behavior. If other changes are needed to
> >> make (parts of) new documentation actually correct, then it should imo
> >> go together. If new documentation describes future behavior (e.g.
> >> design docs), then of course it's fine as well to go in early, as then
> >> there simply is no code anywhere which this would (temporarily) not
> >> describe correctly.
> > 
> > Yeah I thought so, I would prefer to keep these files here otherwise I would need to
> > change them somehow and I would lose the r-by anyway.
> > 
> > Regarding the revert of cppcheck from makefile and xen/tools/merge_cppcheck_reports.py,
> > are you ok if I send a patch with only those changes? Would it be ok for you if the new patch
> > is after this one?
> 
> I don't mind you doing so, but I guess the question is mainly to people
> actually / possibly making use of those make goals.

I think it is OK -- we are not at the stage where cppcheck is used in
production-worthy pipelines yet.


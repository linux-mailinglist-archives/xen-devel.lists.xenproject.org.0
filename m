Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842B7C7A49
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616177.957986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4vc-0001ag-Tt; Thu, 12 Oct 2023 23:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616177.957986; Thu, 12 Oct 2023 23:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4vc-0001XK-RM; Thu, 12 Oct 2023 23:17:16 +0000
Received: by outflank-mailman (input) for mailman id 616177;
 Thu, 12 Oct 2023 23:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr4vb-0001XC-9A
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:17:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79cb066c-6955-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 01:17:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9635361F64;
 Thu, 12 Oct 2023 23:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45852C433C8;
 Thu, 12 Oct 2023 23:17:10 +0000 (UTC)
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
X-Inumbo-ID: 79cb066c-6955-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697152632;
	bh=CYWYl0GyWGMWS6nUM84V8Eu6VUIq+xI0E3AURP2rmVo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZFSElH5YIwfPBJBkpjhkjFAg8NDL7J87ZjkIwq6OYBuhYwDRse6T5IjgPqWwa8bln
	 gt8RkwzKNHO7GgZywNFxYZpsZc8ZWWQ1kp6w1eTmi48/UlYdxhewQbK5btSgKOCVYQ
	 WLZGtJfFJTTyem1UtwEdXm/ar+/gjyGkGbkNDdaXzONYKUQI8Odgyc9dBdw35JfyoJ
	 Z2ktwmj1GvjjI/xpR2brl4aHSS7w4r6f2FOlpeVLzip+iXx1AtkFwNeyHNzGNnxByq
	 z+vuhcDfFKH2jhmryxQ0a0JQSdtNAEHNfFgUzYwFZ5wscmJVlENUnKaHvQnO9k7piO
	 zsLJ5wb/h3XqA==
Date: Thu, 12 Oct 2023 16:17:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
In-Reply-To: <66ac185e-eace-4933-b48a-e2fe035fcb8b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310121616020.3431292@ubuntu-linux-20-04-desktop>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com> <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com> <2894008e8f612296da84267346ae4240@bugseng.com> <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop> <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com> <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop> <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop> <1ceb5aa0-d374-4357-964f-1341468d542e@xen.org> <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop> <8c3d7933-c139-49dd-8c62-2d4543176f8f@xen.org>
 <alpine.DEB.2.22.394.2310101635280.3431292@ubuntu-linux-20-04-desktop> <80f4df2b-a8b2-4494-94e0-47de55c01597@xen.org> <1766b5f3-490c-4bbe-902c-3970c28041a7@xen.org> <6BB62AEF-FCE1-412C-87DD-479319623092@arm.com>
 <66ac185e-eace-4933-b48a-e2fe035fcb8b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-211779268-1697152632=:3431292"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-211779268-1697152632=:3431292
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 11 Oct 2023, Julien Grall wrote:
> On 11/10/2023 11:53, Luca Fancellu wrote:
> > 
> > > > > 
> > > > > Luca answered to a similar, more generic, question a few days ago
> > > > > about
> > > > > Coverity: https://marc.info/?l=xen-devel&m=169657904027210
> > > > Interesting.
> > > > > 
> > > > > So even if we get cppcheck to work like that, we would lose Coverity
> > > > > support.
> > > > I think my suggestion was probably misunderstood. So let me clarify it.
> > > > To cover multi-line, we could write the following in Xen:
> > > > /* cppcheck tag next-3-lines */
> > > > line 1
> > > > line 2
> > > > line 3
> > > > AFAIU Eclair supports multi-line, so the tag would be transformed to
> > > > there internal solution. For CPPCheck, this could be transformed to:
> > > > /* cppcheck tag next-3 lines */
> > > > line 1 /* generated cppcheck tag */
> > > > line 2 /* generated cppcheck tag */
> > > > line 3 /* generated cppcheck tag */
> > > > Now, I understand that coverity doesn't support any of the two format.
> > > > So the only solution would be to add the comment before each line which
> > > > would impact the line numbers. This is not great, but I think this is
> > > > acceptable as the context would likely help to find where this is coming
> > > > from.
> > > 
> > > Just to clarify, here I meant that for coverity, a script before the scan
> > > could convert to the multi-line version. So the line change only impact
> > > Coverity.
> > 
> > Hi Julien,
> > 
> > We’ve tried to avoid that because when the tool insert lines, the resultant
> > report would give wrong lines numbers if any violation is reported after the
> > insertion points. So there will be a mismatch between the codebase and the
> > report findings from some point on in the file.
> 
> I know. Stefano already pointed that out. But as I wrote, I don't think this
> is a big problem as it only affecte one tool (Coverity) and one would still be
> able to find the exact place based on the context.

Yeah I think we could consider going that way if it only affects 1 tool
out of 3.

We might still have to patch cppcheck to add the functionality but it
might not be that difficult.
--8323329-211779268-1697152632=:3431292--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797CC7B3BFE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 23:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610744.950278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmL8C-0005sM-0n; Fri, 29 Sep 2023 21:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610744.950278; Fri, 29 Sep 2023 21:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmL8B-0005p6-UL; Fri, 29 Sep 2023 21:34:39 +0000
Received: by outflank-mailman (input) for mailman id 610744;
 Fri, 29 Sep 2023 21:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmL8A-0005p0-LI
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 21:34:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc4ffdfc-5f0f-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 23:34:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7595BB82147;
 Fri, 29 Sep 2023 21:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68422C433C7;
 Fri, 29 Sep 2023 21:34:33 +0000 (UTC)
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
X-Inumbo-ID: fc4ffdfc-5f0f-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696023274;
	bh=CKiMOv7w+H9l7zOQwP0JdQ1knLqx21NOxcB2PP1TQi4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NQyXYjZqhtu0QJArRLxlsy3ywIsMnBe78fcLXNx/skJFOfdpoG2BCwf4XumVva+yH
	 OviMCoXdvc4+1xPh3tn90Mh8uMGEwThJ9UiopdiVN5rYm/CiclIr3vqiX8Fv+/YOne
	 OTxSmil8uPAyJg7Je2Lr+DnO/jPWQiPhnqJY5N4Pkh6mtsg3t4UR/+CkKeg/QkrUpY
	 +saMaiOIEXuJ/5gZAb78zz7W4mHopQ5rHqI6T6Wm6rVopeoKVDh08keg/229zWjN0F
	 aIw8cwRuE+wseiAivnKqrKy84FRhnyx2Zf9ESmEcTjgMjBctGIk0hqaBErubPk4VVW
	 m9f2A6fbsxhmA==
Date: Fri, 29 Sep 2023 14:34:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "wl@xen.org" <wl@xen.org>, sanastasio@raptorengineering.com
Subject: Re: [PATCH] cpumask: fix integer type in cpumask_first
In-Reply-To: <DD5A5A95-82B2-4886-8B5F-BC75C64CC7FC@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309291432050.2348112@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2309281629360.1996340@ubuntu-linux-20-04-desktop> <e5815f93-80a4-4628-9eae-98c431c70dcc@xen.org> <DD5A5A95-82B2-4886-8B5F-BC75C64CC7FC@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1404774899-1696023215=:2348112"
Content-ID: <alpine.DEB.2.22.394.2309291433400.2348112@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1404774899-1696023215=:2348112
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309291433401.2348112@ubuntu-linux-20-04-desktop>

On Fri, 29 Sep 2023, Luca Fancellu wrote:
> > On 29 Sep 2023, at 08:31, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Stefano,
> > 
> > On 29/09/2023 00:32, Stefano Stabellini wrote:
> >> nr_cpu_ids is unsigned int, but find_first_bit returns unsigned long (at
> >> least on arm).
> > 
> > find_* are meant to be used by common code. So I think the first step is to correct the return type so it is consistent across all architectures.
> > 
> > I don't have a strong opinion on whether they should all return 'unsigned long'.
> > 
> > Then we can discuss if the MISRA rule is still violated.
> > 
> >> Use the larger type for min_t to avoid larger-to-smaller
> >> type assignments. This address 141 MISRA C 10.3 violations.
> > 
> > I find interesting you are saying this given that...
> >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >> ---
> >> diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
> >> index 9826707909..a6ed6a28e8 100644
> >> --- a/xen/include/xen/cpumask.h
> >> +++ b/xen/include/xen/cpumask.h
> >> @@ -208,7 +208,7 @@ static inline void cpumask_copy(cpumask_t *dstp, const cpumask_t *srcp)
> >>    static inline int cpumask_first(const cpumask_t *srcp)
> >>  {
> >> - return min_t(int, nr_cpu_ids, find_first_bit(srcp->bits, nr_cpu_ids));
> >> + return min_t(unsigned long, nr_cpu_ids, find_first_bit(srcp->bits, nr_cpu_ids));
> > 
> > ... cpumask_first() is return 'int'. So rather than fixing it, you seem to have just moved the violation.
> > 
> >>  }
> >>    static inline int cpumask_next(int n, const cpumask_t *srcp)
> 
> I’ve also found that find_first_bit returns:
> 
>  - unsigned int on x86
>  - unsigned long on ppc
>  - unsigned long on arm64
>  - int on arm32 (seems that value is always >= 0
> 
> So maybe they can be all unsigned int, and cpumask_first can be as well unsigned int?

I am OK with that. Julien, Shawn do you agree? If so, I can make the
change to find_first_bit so that it returns unsigned int on all arches.
--8323329-1404774899-1696023215=:2348112--


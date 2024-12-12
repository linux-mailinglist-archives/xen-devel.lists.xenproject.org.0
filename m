Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F79EE64F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855942.1268719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhyt-0004oF-8N; Thu, 12 Dec 2024 12:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855942.1268719; Thu, 12 Dec 2024 12:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhyt-0004mi-5I; Thu, 12 Dec 2024 12:07:47 +0000
Received: by outflank-mailman (input) for mailman id 855942;
 Thu, 12 Dec 2024 12:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CAaf=TF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tLhys-0004mA-0Q
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:07:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b17d787e-b881-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 13:07:44 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso78469566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:07:44 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa657abb2fbsm808291566b.128.2024.12.12.04.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 04:07:43 -0800 (PST)
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
X-Inumbo-ID: b17d787e-b881-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734005263; x=1734610063; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEH3svm+ODWbKyLiOHf4AvTgW1h4RyA0BCxw3M+F/jI=;
        b=WF9cf7uRP/kEFdeS2U7lJzmyYI2/I8tR8XgP09vSN7HTSIt//+cVruVx/cwAGJ/WnJ
         G0iLkSsfGm7YpDm2VT7QmtTM/e4W7wSgm7Fgyy6i6eTQNm0tN+a7QP817xu4N2Fc2oY8
         uBUTF/BVCzeZucT7cZ5TjbfwQu5thzdHdljak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005263; x=1734610063;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aEH3svm+ODWbKyLiOHf4AvTgW1h4RyA0BCxw3M+F/jI=;
        b=CrcLNgpZjUivI0trCBz5eUtdc9sjDlbhlnPaM2jF2eZVL3bQeKyGX66v54RXPT/Xuy
         eIYUE/4h3OFO0Jxv1jRGZ8SuPcW4bcg5TmOdH6CpmUTUA0kvbR9zqJwdxaCLD8/ZN2Im
         DOWhlgm1+f1wxflJkIevVqDKO2uVmXvsQbhiZVxmYHRO7h/oCbIunepQTOJC+4mqNTMk
         PgJrKCaS4DXwPiN/d4QEJzLvk+j45oOoIi3hibK0jBsdbGWO5P6Zkqah5MIZ1l+OUjOj
         lBP5gYPFvY7kKVjOjTbgOBoVJ5rgGYBInp6Sn+WIxAP4yvkgDEBMDuo2ZKn6im4HiT7t
         L0VA==
X-Forwarded-Encrypted: i=1; AJvYcCWoCNFAbBJR721fYkC3zkE91dChibmSbhgv8rK1p2x4gWtXnPFtTv2lka1tk4OPzLVoU7Y6qfDGTLo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/NnUDs5XoMfjUKScrQm1excOBI6Wzqy3neu/E2bkcSpWTSaL/
	omTa7gHIpFAfwAVBck2KGoO3mWuvJWksJWFY/CvYiCdVMMBiRpQ0DpAH3kRK6tI=
X-Gm-Gg: ASbGnctRq25RluGnDHjdaWqtT3nr6hPgYlNSNrYzTSGXlCWy9rt7XDnV7W1o/kizWaX
	XtqPFoCGU6HAN5YnGWQqNdc2yYp2+WGlWhJ1SZ6jE0+HQLlrMb96cFrNVSMNb6d2xu17XNsYOSD
	4QQhVVf6Rg0+s7FXnzqy6Wix0p8NA1ld2lPTcRF7lC4YLFKGzeL+oydNXWZF/1cBcW8lR+oEUBy
	WCBRngJCAEi9ZKxdwskfcwgTIhp8R4WZrcOzjLA5zyHDvL0BruAAmkOnFNnBV1uZQ==
X-Google-Smtp-Source: AGHT+IEzcs/KZs9ruRThh9nAbTayuQY11/6Aagz+I9L4zkKMIZvQLKQli236EywdsNn2d5ObrnuoXw==
X-Received: by 2002:a17:907:3faa:b0:aa6:824c:4ae6 with SMTP id a640c23a62f3a-aa6c1d02adamr470024366b.56.1734005263562;
        Thu, 12 Dec 2024 04:07:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Dec 2024 12:07:42 +0000
Message-Id: <D69PKCNPN727.C9ME0XWS17RL@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Bernhard Kaindl"
 <bernhard.kaindl@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall"
 <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] SYSCTL_numainfo.memsize: Switch spanned to present
 memory
X-Mailer: aerc 0.18.2
References: <10466e8c29b5f69774915bcf6562985c75e98bb7.1733224306.git.bernhard.kaindl@cloud.com> <0299582c-7261-4947-a2ac-bf3d62ccac14@suse.com> <3f527685-e1bf-4a87-8986-2b9620d14646@cloud.com> <c8990ecc-fdee-4b52-b247-246fade7b2c9@suse.com>
In-Reply-To: <c8990ecc-fdee-4b52-b247-246fade7b2c9@suse.com>

On Mon Dec 9, 2024 at 8:23 AM GMT, Jan Beulich wrote:
> On 05.12.2024 11:55, Bernhard Kaindl wrote:
> > On 03/12/2024 12:37, Jan Beulich wrote:
> >> On 03.12.2024 12:12, Bernhard Kaindl wrote:
> >>> This the 2nd part of my submission to fix the NUMA node memsize
> >>> retured in xen_sysctl_meminfo[].memsize by the XEN_SYSCTL_numainfo
> >>> hypercall to not count MMIO memory holes etc but only memory pages.
> >>>
> >>> For this, we introduced NODE_DATA->node_present_pages as a prereq.
> >>> With the prereq merged in master, I send this 2nd part for review:
> >>>
> >>> This RFC is for changing the value of xen_sysctl_meminfo[]->memsize
> >>> from NODE_DATA->node_spanned_pages << PAGE_SHIFT
> >>>    to NODE_DATA->node_present_pages << PAGE_SHIFT
> >>> for returing total present NUMA node memory instead of spanned range.
> >>>
> >>> Sample of struct xen_sysctl_meminfo[].* as presented by in xl info -n=
:
> >>>
> >>> xl info -n:
> >>> [...]
> >>> node:    memsize    memfree    distances
> >>>     0:  -> 67584 <-   60672      10,21
> >>>     1:     65536      60958      21,10
> >>>
> >>> The -> memsize <- marked here is the value that we'd like to fix:
> >>> The current value based node_spanned_pages is often 2TB too large.
> >>>
> >>> We're currently not using these often false memsize values in XenServ=
er
> >>> according to my code review and and Andrew seemed to confirm this as =
well.
> >>>
> >>> I think that the same is likely true for other Xen toolstacks, but of=
 course
> >>> to review this change or propose an alternaive is the purpose of this=
 RFC.
> >>>
> >>> Thanks,
> >>> Bernhard
> >>
> >> All of the above reads like a cover letter. What's missing is a patch
> >> description, part of which would be to clarify whether the field is
> >> indeed unused except for display purposes, or why respective users wou=
ld
> >> at least not regress from this change. What's also unclear is what
> >> comments you're actually after (i.e. what question(s) you want to have
> >> answered), seeing this is tagged RFC.
> > [...]
> >> Jan
> >=20
> > Hi Jan!
> >=20
> > The answer I'm looking for is which users to check, or to check with.
> >=20
> > For example, I know that Xapi can use xen_sysctl_meminfo[].memfree to
> > get a preference about the NUMA node use use when creating a domain
> > (when the new mode `numa_affinity_policy.best_effort` is enabled):
> > https://xapi-project.github.io/new-docs/toolstack/features/NUMA/
> >=20
> > A potential use of xen_sysctl_meminfo.memsize in Xen toolstacks is
> > less clear to me:
> >=20
> > The only potential use would be if some Xen toolstack would not like
> > to solely rely on [nid].memfree for NUMA placement.
> >=20
> > The question is if there are other NUMA aware toolstacks besides Xapi,
> > that would try to use it for e.g. planning the placement of domains.
> >=20
> > My in the Xapi and Xen repos only turned up a debug printf() in
> > xen-api's xen-api/xenopsd and in xen only the output of xl info -n.
> >=20
> > It seems questionable to me that any other toolstacks would rely on it,
> > especially as the value it returns currently is offset even 2GB on some
> > machines. I'd expect that this bug would have affected code using it.
> >=20
> > The answers I am looking for are acknowledgements of that or references=
=20
> > which users might use .memsize currently (that could be affected).
>
> IOW all questions to respective toolstack people.
>
> > Alternatively, I'd hope to get an idea what would be the method to=20
> > create a new revision of the numainfo hypercall:
> >=20
> > I guess it would be to add a new #define XEN_SYSCTL_numainfo_v2,
> > and if v2 is called, return [].memsize using [nid].node_present_pages=
=20
> > instead?
>
> That's a last resort, yes. Since sysctls aren't stable (yet), changing
> existing interfaces generally is an option. We merely want to figure
> how careful we need to be. It may be fine to do the change "silently",
> as you do now. A middle option might be to rename the field which has
> its meaning changed, such that anyone using the field will notice that
> they need to update their code, hopefully resulting in them checking
> what changed and hence what they may need to change.
>
> Jan

The biggest unknown is libvirt, I think. They use libxl and do use
libxl_get_numainfo(). I suspect they rely on this new semantic rather than =
the
old one, but didn't dig hard enough to find out. It may very well be just
informative, just as `xl info`.

  https://gitlab.com/libvirt/libvirt

If they don't rely on memsize meaning "node span" then this patch is best a=
s it
is now. Might be worth either checking their code or pinging them in their
mailing list or IRC to confirm.

If they do rely on the current semantics, adding a new field to
xen_sysctl_meminfo ought to be fine as long as you bump the interface versi=
on
on top of sysctl.h as well.

Cheers,
Alejandro

P.S: If going down the "new field" route, I'd also like to suggest replacin=
g
     uint64_t with uint64_aligned_t in xen_sysctl_meminfo while at it.


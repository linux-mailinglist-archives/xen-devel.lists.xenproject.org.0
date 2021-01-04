Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113292E92F3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 10:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61051.107129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMYl-0005sA-SZ; Mon, 04 Jan 2021 09:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61051.107129; Mon, 04 Jan 2021 09:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMYl-0005ro-PI; Mon, 04 Jan 2021 09:53:55 +0000
Received: by outflank-mailman (input) for mailman id 61051;
 Mon, 04 Jan 2021 09:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAMM=GH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kwMYk-0005rj-At
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 09:53:54 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4adad60-0245-4df3-bed8-1cb5c85077a3;
 Mon, 04 Jan 2021 09:53:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i9so31523215wrc.4
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jan 2021 01:53:53 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id 67sm35029883wmb.47.2021.01.04.01.53.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 01:53:52 -0800 (PST)
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
X-Inumbo-ID: f4adad60-0245-4df3-bed8-1cb5c85077a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=Xo7AzGpRafwNCCKJQLVwUB6UUbCFv1N0pG4mzHom90c=;
        b=uWKCQ2U/4AOjcBAcoHwP0knItaO7GIYrRWU0CFP8ZigBTV91/X1koakZf3N1YsU8JN
         dm88pov9YOtQDudlCWhkFFrM+Z8XG/rjtlPwJx4ENKi6Gvc/QjC9MCYUnYu+GGVChdt4
         NIDBcQqDgasH3Z8h1Npc2EFSoU+3Z0oBbhyZOBC/d+BlKWVVboBWgEKVn9Zn5Vtx96b1
         VxW+mKQI7LskQgTqIqCTEQV2o7oDwWWfu58xa+45cLwkY7TI9lA6e0Wnv8FjZo/oluaC
         6jJ8WNOarZUg0CFmR5wLPNR6e2qj3G636kVYUF4+c4U9gQopVsEEowpBv6a+dpNHQUIy
         L75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=Xo7AzGpRafwNCCKJQLVwUB6UUbCFv1N0pG4mzHom90c=;
        b=caLCFSunK7oYXXh/Zi+vpwLdizZ9CQ60NPaPQaCGI/0BykgT3HDpML30XURbdlP3jr
         2lOTpYMQCdTmo4QKFwDNV84aXurK2aF+84bl0q6EBTZ8gMGMbQmJWhl1lVMSBUsJRLdE
         nbp81J38yqoQUW9MD8IzqH/LhruzcoPuC8jIZUm+vUMqq0l2onfPOnYwVx7fKpFja5bJ
         39zDZPxzPb8wmWp6we650VHHE9efLTWZm7Ik5WtOimKao9xpGx42InFeYDyal+CbrgPk
         3IA7Ty4MA+tTh3iNeNSQaUhaaEmT20NN0RtEZk69wtvulnxhhYdkSvcMb6DLAimin16u
         ocxw==
X-Gm-Message-State: AOAM53207GTG8RDnqLhck0tZpUGpt5inPLkvjwAhD8d3KERmNwi1yfMk
	ZK9gW82uR3ZWUMCsxMUz9C4=
X-Google-Smtp-Source: ABdhPJxj3Z9BBd2M4NpVEUAytiEexe6cYRgqhk/DhnJ7OjIwaVgJ71bP9KNFnP6BsO9UwOQbz9RtFw==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr78604638wrm.90.1609754032523;
        Mon, 04 Jan 2021 01:53:52 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>
Cc: <hongyxia@amazon.co.uk>,
	"'Julien Grall'" <jgrall@amazon.com>,
	<xen-devel@lists.xenproject.org>
References: <20201222154338.9459-1-julien@xen.org> <20201222154338.9459-4-julien@xen.org> <499e6d5a-e8ac-56db-1af9-70469b6a06b9@suse.com> <8b394c44-5bdb-9d82-b211-5a4ee3473568@xen.org> <19e92d90-ed9a-4bd6-79f4-b761b5a039c6@suse.com> <96ce1b10-9764-b71e-ac26-982ba8dcc34d@xen.org> <092e5199-7eab-2722-7f0b-43fb3c8b2065@suse.com> <281188a0-f632-c0a1-4591-0a66ef0068f5@xen.org> <d7b866b6-118a-f873-f8df-eb112b708fe3@suse.com> <0699ad7a-7c3b-e1e8-c7f7-0bfb54d03c78@xen.org> <63091edf-a870-cac1-587a-59cb9d0f8d8d@suse.com>
In-Reply-To: <63091edf-a870-cac1-587a-59cb9d0f8d8d@suse.com>
Subject: RE: [PATCH for-4.15 3/4] [RFC] xen/iommu: x86: Clear the root page-table before freeing the page-tables
Date: Mon, 4 Jan 2021 09:53:51 -0000
Message-ID: <002901d6e27f$81c6c620$85545260$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH2TO5SqTDQ1dUiy31gxFMl+4NKXAJRtd9kAZN9zcoBuMopHAEWIIwmAUOJbvwBS1S7hACq5AzNAmaFULYB31UpcAGqcL/sqVluxFA=

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 23 December 2020 16:46
> To: Julien Grall <julien@xen.org>; Paul Durrant <paul@xen.org>
> Cc: hongyxia@amazon.co.uk; Julien Grall <jgrall@amazon.com>; =
xen-devel@lists.xenproject.org
> Subject: Re: [PATCH for-4.15 3/4] [RFC] xen/iommu: x86: Clear the root =
page-table before freeing the
> page-tables
>=20
> On 23.12.2020 17:29, Julien Grall wrote:
> > On 23/12/2020 16:24, Jan Beulich wrote:
> >> On 23.12.2020 17:16, Julien Grall wrote:
> >>> On 23/12/2020 16:11, Jan Beulich wrote:
> >>>> On 23.12.2020 16:16, Julien Grall wrote:
> >>>>> On 23/12/2020 15:00, Jan Beulich wrote:
> >>>>>> On 23.12.2020 15:56, Julien Grall wrote:
> >>>>>>> On 23/12/2020 14:12, Jan Beulich wrote:
> >>>>>>>> On 22.12.2020 16:43, Julien Grall wrote:
> >>>>>>>>> This is an RFC because it would break AMD IOMMU driver. One =
option would
> >>>>>>>>> be to move the call to the teardown callback earlier on. Any =
opinions?
> >>
> >> Please note this (in your original submission). I simply ...
> >>
> >>>>>>>> We already have
> >>>>>>>>
> >>>>>>>> static void amd_iommu_domain_destroy(struct domain *d)
> >>>>>>>> {
> >>>>>>>>         dom_iommu(d)->arch.amd.root_table =3D NULL;
> >>>>>>>> }
> >>>>>>>>
> >>>>>>>> and this function is AMD's teardown handler. Hence I suppose
> >>>>>>>> doing the same for VT-d would be quite reasonable. And really
> >>>>>>>> VT-d's iommu_domain_teardown() also already has
> >>>>>>>>
> >>>>>>>>         hd->arch.vtd.pgd_maddr =3D 0;
> >>>>>>>
> >>>>>>> Let me have a look if that works.
> >>>>>>>
> >>>>>>>>
> >>>>>>>> I guess what's missing is prevention of the root table
> >>>>>>>> getting re-setup.
> >>>>>>>
> >>>>>>> This is taken care in the follow-up patch by forbidding =
page-table
> >>>>>>> allocation. I can mention it in the commit message.
> >>>>>>
> >>>>>> My expectation is that with that subsequent change the change =
here
> >>>>>> (or any variant of it) would become unnecessary.
> >>>>>
> >>>>> I am not be sure. iommu_unmap() would still get called from =
put_page().
> >>>>> Are you suggesting to gate the code if d->is_dying as well?
> >>>>
> >>>> Unmap shouldn't be allocating any memory right now, as in
> >>>> non-shared-page-table mode we don't install any superpages
> >>>> (unless I misremember).
> >>>
> >>> It doesn't allocate memory, but it will try to access the IOMMU
> >>> page-tables (see more below).
> >>>
> >>>>
> >>>>> Even if this patch is deemed to be unecessary to fix the issue.
> >>>>> This issue was quite hard to chase/reproduce.
> >>>>>
> >>>>> I think it would still be good to harden the code by zeroing
> >>>>> hd->arch.vtd.pgd_maddr to avoid anyone else wasting 2 days =
because the
> >>>>> pointer was still "valid".
> >>>>
> >>>> But my point was that this zeroing already happens.
> >>>> What I
> >>>> suspect is that it gets re-populated after it was zeroed,
> >>>> because of page table manipulation that shouldn't be
> >>>> occurring anymore for a dying domain.
> >>>
> >>> AFAICT, the zeroing is happening in ->teardown() helper.
> >>>
> >>> It is only called when the domain is fully destroyed (see call in
> >>> arch_domain_destroy()). This will happen much after relinquishing =
the code.
> >>>
> >>> Could you clarify why you think it is already zeroed and by who?
> >>
> >> ... trusted you on what you stated there. But perhaps I somehow
> >> misunderstood that sentence to mean you want to put your addition
> >> into the teardown functions, when apparently you meant to invoke
> >> them earlier in the process. Without clearly identifying why this
> >> would be a safe thing to do, I couldn't imagine that's what you
> >> suggest as alternative.
> >
> > This was a wording issue. I meant moving ->teardown() before (or =
calling
> > from) iommu_free_pgtables().
> >
> > Shall I introduce a new callback then?
>=20
> Earlier zeroing won't help unless you prevent re-population, or
> unless you make the code capable of telling "still zero" from
> "already zero". But I have to admit I'd like to also have Paul's
> opinion on the matter.
>=20

I have a pending series to dynamically unshare IOMMU mappings (to allow =
logdirty to be enabled on domains with currently-shared EPT) which gets =
rid of the lazy allocation of the root table and uses pgd_maddr =3D=3D =
NULL as a test of whether EPT is shared or not. Therefore it would seem =
best, to fix this immediate problem, to also stop lazy allocation of =
pgd_maddr, and re-introduce a per-implementation free_pgtables() =
callback which zeroes pgd_maddr and then calls the common function.

  Paul



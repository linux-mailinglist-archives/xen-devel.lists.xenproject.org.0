Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303AE20B387
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 16:28:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jopKr-0008SB-Fu; Fri, 26 Jun 2020 14:28:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jopKq-0008S4-6F
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 14:28:08 +0000
X-Inumbo-ID: 409b1912-b7b9-11ea-8496-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 409b1912-b7b9-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 14:28:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q15so9014834wmj.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 07:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=OoeejaLMxncODdjhoeVUGrwaLbu1DfR66opU0iNtCIg=;
 b=BvEUCHlg9h/89/ZVp8+2mOA7gWTsngnGn+y2TucQdEv1j9wP6MDjqfM7qOy6+djPmE
 QnGnfYs/hZS0NgPotHJj+kT8Kxpi2Jutl6PLO7CMT15TAZcKVXSo8HCNF8dzF64H2TBO
 j98GBoCRjYWZAvqhNNNU1RkzmS581M3/ZCpk7hIDqANoevEncxvFQjn2aQHyqAUVAvO7
 4kYSU30AGbhztgphC7or1/ew6h7RWQiqpy5SYtMNi9aAal2zQEizOSdbNDefTp+fXsjR
 9xhjtt3/n1vzO/lJOQXbHmI7hOAu9hkG9cGzT1CqOW8eZgOsKQ5Y1DitU9Bz5DKWrkwV
 DEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=OoeejaLMxncODdjhoeVUGrwaLbu1DfR66opU0iNtCIg=;
 b=VOBb3uZAC5RV6sgDFXXe1FNKr9x4OjR6Vo2JmRckb78WpOnhimr/jUIJ1dptM999P+
 uS4e0VkC+jwvY7BBzjJILRP36ijnVJWcmCsZk85enXPSQK60u1cP5YKqe4QzBCpv/L8d
 NyithOygl+rZRub1xPx3zLrCpkqdYFzMNf3ZkkogfR6KYcZ3uYvFx676TTNO/J0KQKro
 hKSqbhGeo4iCVD4uhgXkPDQCpFEOT/KjAUNRL2ltWSYkGb8wqs1NolrVYFOslk3va5kr
 E6Z9hnGCy9NpNnojO+50vkCl5/YKhRvly77VMCAMwgB/B3gEJbCc1pnODcR3Wn/Deiam
 0Myw==
X-Gm-Message-State: AOAM5302LfpcH86xcVjiy0rIMeuPRf7eqibFJmxigWhZtF4sFiQf8UPR
 +1U2vwvdBjPf2SBPhA+Ufl4=
X-Google-Smtp-Source: ABdhPJx+6HFP0WgHunbKIM5pbcRyn4kpp0KXi4A3Px66JXiYPiJ09A84QG6iztIFjOyJ6NY8tmKLyA==
X-Received: by 2002:a05:600c:c1:: with SMTP id u1mr3881281wmm.48.1593181686560; 
 Fri, 26 Jun 2020 07:28:06 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id m10sm17892773wru.4.2020.06.26.07.28.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 07:28:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Julien Grall'" <julien@xen.org>
References: <20200625113041.81507-1-roger.pau@citrix.com>
 <551387c6-f45d-bf6c-a41e-b0920425db9f@xen.org>
 <20200626100745.GB735@Air-de-Roger>
 <5586cae5-8929-0c53-7a35-5dd6116c77c2@suse.com>
 <000b01d64bbc$a7822f30$f6868d90$@xen.org>
 <e8ec0350-af43-70a4-568d-5f19ff93d84b@xen.org>
 <20200626141656.GC735@Air-de-Roger>
In-Reply-To: <20200626141656.GC735@Air-de-Roger>
Subject: RE: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
Date: Fri, 26 Jun 2020 15:28:04 +0100
Message-ID: <000d01d64bc6$01dbacf0$059306d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQNtfAT0oM7SsXX048OvW1r6oGCP7gGm0OfKAaiO/jIBsc/uaAIhC8ICAv8Ymn8CUdcdGqVY+olw
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 26 June 2020 15:17
> To: Julien Grall <julien@xen.org>
> Cc: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; xen-
> devel@lists.xenproject.org; 'Wei Liu' <wl@xen.org>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian
> Jackson' <ian.jackson@eu.citrix.com>; 'Stefano Stabellini' =
<sstabellini@kernel.org>; 'Volodymyr
> Babchuk' <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
>=20
> On Fri, Jun 26, 2020 at 02:58:21PM +0100, Julien Grall wrote:
> > On 26/06/2020 14:21, Paul Durrant wrote:
> > > > -----Original Message-----
> > > > From: Jan Beulich <jbeulich@suse.com>
> > > > Sent: 26 June 2020 14:11
> > > > To: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; paul@xen.org; =
Andrew Cooper
> <andrew.cooper3@citrix.com>
> > > > Cc: Julien Grall <julien@xen.org>; =
xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; George
> Dunlap
> > > > <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Stefano Stabellini
> > > > <sstabellini@kernel.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>
> > > > Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush =
usage
> > > >
> > > > On 26.06.2020 12:07, Roger Pau Monn=C3=A9 wrote:
> > > > > On Fri, Jun 26, 2020 at 10:38:11AM +0100, Julien Grall wrote:
> > > > > > Hi Roger,
> > > > > >
> > > > > > Sorry I didn't manage to answer to your question before you =
sent v3.
> > > > > >
> > > > > > On 25/06/2020 12:30, Roger Pau Monne wrote:
> > > > > > > diff --git a/xen/include/asm-arm/flushtlb.h =
b/xen/include/asm-arm/flushtlb.h
> > > > > > > index ab1aae5c90..7ae0543885 100644
> > > > > > > --- a/xen/include/asm-arm/flushtlb.h
> > > > > > > +++ b/xen/include/asm-arm/flushtlb.h
> > > > > > > @@ -27,6 +27,7 @@ static inline void =
page_set_tlbflush_timestamp(struct page_info *page)
> > > > > > >    /* Flush specified CPUs' TLBs */
> > > > > > >    void flush_tlb_mask(const cpumask_t *mask);
> > > > > > > +#define flush_tlb_mask_sync flush_tlb_mask
> > > > > >
> > > > > > Dropping the parameter 'sync' from filtered_flush_tlb_mask() =
is a nice
> > > > > > improvement, but it unfortunately doesn't fully address my =
concern.
> > > > > >
> > > > > > After this patch there is exactly one use of =
flush_tlb_mask() in common code
> > > > > > (see grant_table.c). But without looking at the x86 code, it =
is not clear
> > > > > > why this requires a different flush compare to the two other =
sites.
> > > > >
> > > > > It's not dealing with page allocation or page type changes =
directly,
> > > > > and hence doesn't need to use an IPI in order to prevent races =
with
> > > > > spurious_page_fault.
> > > > >
> > > > > > IOW, if I want to modify the common code in the future, how =
do I know which
> > > > > > flush to call?
> > > > >
> > > > > Unless you modify one of the specific areas mentioned above =
(page
> > > > > allocation or page type changes) you should use =
flush_tlb_mask.
> > > > >
> > > > > This is not ideal, and my aim will be to be able to use the =
assisted
> > > > > flush everywhere if possible, so I would really like to get =
rid of the
> > > > > interrupt disabling done in spurious_page_fault and this model =
where
> > > > > x86 relies on blocking interrupts in order to prevent page =
type
> > > > > changes or page freeing.
> > > > >
> > > > > Such change however doesn't feel appropriate for a release =
freeze
> > > > > period, and hence went with something smaller that restores =
the
> > > > > previous behavior. Another option is to just disable assisted =
flushes
> > > > > for the time being and re-enable them when a suitable solution =
is
> > > > > found.
> > > >
> > > > As I can understand Julien's concern, maybe this would indeed be
> > > > the better approach for now? Andrew, Paul - thoughts?
> > > >
> > >
> > > Julien's concern seems to be about long term usage whereas IIUC =
this patch does fix the issue at
> hand, so can we put this patch in now on the basis that Roger will do =
the re-work described after 4.14
> (which I think will address Julien's concern)?
> > Bear in mind that while this may be properly fixed in the next =
release, the
> > hack will stay forever in Xen 4.14.
> >
> > While I understand that disabling assisted flush is going to have a
> > performance impact, we also need to make sure the interface make =
senses.
> >
> > From a generic perspective, a TLB flush should have the exact same =
guarantee
> > regardless where we call it in common/. So I would still strongly =
prefer if
> > we have a single helper.
> >
> > Is it possible to consider to replace all the flush_tlb_mask() in =
common
> > code by arch_flush_tlb_mask()? On Arm, this would just be a rename. =
On x86,
> > this would be an alias to flush_tlb_mask_sync()?
>=20
> The TLB flush call in grant_table.c could still use a flush_tlb_mask,
> but it will also work fine with a flush_tlb_mask_sync.
>=20
> I can prepare a patch if that's acceptable, I guess it would be
> slightly better than fully disabling assisted flush.
>=20

Sounds like a reasonable plan.

  Paul

> Roger.



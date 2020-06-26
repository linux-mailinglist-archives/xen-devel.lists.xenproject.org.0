Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379420B25D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 15:21:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jooI4-0002bD-ST; Fri, 26 Jun 2020 13:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jooI3-0002b8-3c
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:21:11 +0000
X-Inumbo-ID: e644d10a-b7af-11ea-8496-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e644d10a-b7af-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 13:21:10 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id w6so9358561ejq.6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 06:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=/glpYqJjB3H2gbyEz5BKgq+AYHbboaAwV4vLceAFtB4=;
 b=vAGlhYEvJ7e7GUl4o+gtTlD/9/x9CXnRaO34qvwE7B+SEMDFHxP+w/5wJPHP1etBaG
 TL/5rQkf0CTPZygYItAjWYNKzG9ETo1fjcn6LPHc8igHNBn+fjzXVxc09oFc4x0JVBVf
 IhkKyyHdbe5Q1vaTv3e/0KAA+fWkZX1PjJHiNE+ipQKX39YdUuDxiB7eyLYsHtsVri3V
 D5hRvYztim6i6yHpwJdTqwNPC2cKfqpvx9ETS57aO+tji0HA68M6we7eEnE0GLtCpZ9X
 TivDy3ly+fr88iQAn6l2lpjBJLp/LbnfQAsWgo5r4sgcoL6Vsf5B8sIKuwzN84K5zV5G
 Wkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=/glpYqJjB3H2gbyEz5BKgq+AYHbboaAwV4vLceAFtB4=;
 b=ZWCIt8YxfhdzEuG3qsnRXZex5vnRzS3+gOmqbrPkRc3ncaAvVqLgOUp7yLLJuAlmca
 0VIB7Gz4+xqPedoZY6vh4A4U/XkpItJ/UbaaANu/9CfLBSdsWkslsktdLk4MSpqygWoX
 US3+eV9v4RaiKR6cyNIMLk/yK0ztLbbW+eLndb95dGR0TnuQbbatGy5YKEZSjEci44iU
 8Zhz3L/wwDualLEiHyMedzGjq0vju20PbLdOv3nn7QnL+x0W78Isq5HOSUyP6ofWLLvZ
 892ZIKBsr7ZVUjIzo72ptxu1IDjwqWRx9RRyHWZcE+Lj4d7hjagmXXQxMHA0IhH38b6p
 pZew==
X-Gm-Message-State: AOAM530Ue+dHiducBX/IllBStdj6OPUlUum5eINskh4s9g7DgTwiQWYF
 78BDPLTanBQY3khuWTq5u+s=
X-Google-Smtp-Source: ABdhPJytLH5i9SYvmviv3AECVdSnQPng3uZgGMAFtlWiHOD3uqyTvmxsscxR6SW1SzoYh74iSM9+Lg==
X-Received: by 2002:a17:906:c53:: with SMTP id
 t19mr2677866ejf.143.1593177669527; 
 Fri, 26 Jun 2020 06:21:09 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id f17sm6806116ejr.71.2020.06.26.06.21.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 06:21:09 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200625113041.81507-1-roger.pau@citrix.com>
 <551387c6-f45d-bf6c-a41e-b0920425db9f@xen.org>
 <20200626100745.GB735@Air-de-Roger>
 <5586cae5-8929-0c53-7a35-5dd6116c77c2@suse.com>
In-Reply-To: <5586cae5-8929-0c53-7a35-5dd6116c77c2@suse.com>
Subject: RE: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
Date: Fri, 26 Jun 2020 14:21:07 +0100
Message-ID: <000b01d64bbc$a7822f30$f6868d90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQNtfAT0oM7SsXX048OvW1r6oGCP7gGm0OfKAaiO/jIBsc/uaKWUdwhA
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 26 June 2020 14:11
> To: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; paul@xen.org; Andrew =
Cooper <andrew.cooper3@citrix.com>
> Cc: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org; Wei =
Liu <wl@xen.org>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Stefano Stabellini
> <sstabellini@kernel.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
>=20
> On 26.06.2020 12:07, Roger Pau Monn=C3=A9 wrote:
> > On Fri, Jun 26, 2020 at 10:38:11AM +0100, Julien Grall wrote:
> >> Hi Roger,
> >>
> >> Sorry I didn't manage to answer to your question before you sent =
v3.
> >>
> >> On 25/06/2020 12:30, Roger Pau Monne wrote:
> >>> diff --git a/xen/include/asm-arm/flushtlb.h =
b/xen/include/asm-arm/flushtlb.h
> >>> index ab1aae5c90..7ae0543885 100644
> >>> --- a/xen/include/asm-arm/flushtlb.h
> >>> +++ b/xen/include/asm-arm/flushtlb.h
> >>> @@ -27,6 +27,7 @@ static inline void =
page_set_tlbflush_timestamp(struct page_info *page)
> >>>   /* Flush specified CPUs' TLBs */
> >>>   void flush_tlb_mask(const cpumask_t *mask);
> >>> +#define flush_tlb_mask_sync flush_tlb_mask
> >>
> >> Dropping the parameter 'sync' from filtered_flush_tlb_mask() is a =
nice
> >> improvement, but it unfortunately doesn't fully address my concern.
> >>
> >> After this patch there is exactly one use of flush_tlb_mask() in =
common code
> >> (see grant_table.c). But without looking at the x86 code, it is not =
clear
> >> why this requires a different flush compare to the two other sites.
> >
> > It's not dealing with page allocation or page type changes directly,
> > and hence doesn't need to use an IPI in order to prevent races with
> > spurious_page_fault.
> >
> >> IOW, if I want to modify the common code in the future, how do I =
know which
> >> flush to call?
> >
> > Unless you modify one of the specific areas mentioned above (page
> > allocation or page type changes) you should use flush_tlb_mask.
> >
> > This is not ideal, and my aim will be to be able to use the assisted
> > flush everywhere if possible, so I would really like to get rid of =
the
> > interrupt disabling done in spurious_page_fault and this model where
> > x86 relies on blocking interrupts in order to prevent page type
> > changes or page freeing.
> >
> > Such change however doesn't feel appropriate for a release freeze
> > period, and hence went with something smaller that restores the
> > previous behavior. Another option is to just disable assisted =
flushes
> > for the time being and re-enable them when a suitable solution is
> > found.
>=20
> As I can understand Julien's concern, maybe this would indeed be
> the better approach for now? Andrew, Paul - thoughts?
>=20

Julien's concern seems to be about long term usage whereas IIUC this =
patch does fix the issue at hand, so can we put this patch in now on the =
basis that Roger will do the re-work described after 4.14 (which I think =
will address Julien's concern)?

  Paul

> Jan



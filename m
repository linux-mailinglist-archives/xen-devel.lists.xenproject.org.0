Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F6C1ECE5B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 13:28:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgRZQ-0008Ud-NJ; Wed, 03 Jun 2020 11:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NKV=7Q=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgRZP-0008UY-Q1
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 11:28:31 +0000
X-Inumbo-ID: 599abc8a-a58d-11ea-81bc-bc764e2007e4
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 599abc8a-a58d-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 11:28:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w7so1447973edt.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=kgayONtgpl++/r/ziuQqKKOQ09tlFEGVK58WaG5UvPI=;
 b=p8ZAxBbIoOj4W5OiB8EQyNNX4z7nA9PpL9Mf+Vs8Ohd23JT9zJyHMrs1SEBgUqlyvz
 0duEc4G2Rid84dqt5kzP8HiAqAXvk4Ct1Ip25othuhEvTQ9+wwvY7aYNhLqCKCGLY8QV
 UAlfJ9sGDX+INtQDL0FEmcyNPxpCW5UL4c7jgckP2wVtla1EUvXYZtJr2pSmpGOKhPjA
 keMq34laikkChpMvGD++cuSn+Cg1SmbxZC0KAKt02to/5z4JQ1/Qy2TuzuajBPqBROEm
 x0ZCIxitCwujcFvsY//l0b0LV5Q1QCJdgoIC3uFz0nKc1eRTbdd+htXXMjJgzITmb0xU
 WJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=kgayONtgpl++/r/ziuQqKKOQ09tlFEGVK58WaG5UvPI=;
 b=GlSvgUR/EWUmNwOMExxMTFTuqch6AFTFKcOTtnz0Sc5wZIajxzoMaU83tg4XMiDuxE
 lvXn/3KxTDbilq2zhU1dVQD7La1UK388s9xF/xQ/Lah/8zXbNAxf+lehckgjXlZXd6IA
 Dy7ujqJsCD9SmzAutB+kGvCQSLh+ERhSZYrFPmsOwRPi1Dxtg85/eLSLBHcOfCqxT6xt
 jvh4MezfY7ft9IKAgzbbkvg7a8xG3pgEEJV/9/A6ReJc15RGoJj3IrNtigRzQmzG4wi7
 N6SNwVJJFqyw7sDtob6GPzO0/yosLQuAFfqgCcsw/G5nw4LcymRksLcNx10s0VqdCf83
 d14A==
X-Gm-Message-State: AOAM532sKw7ocDBfYFUZVBOIeJIB/rZGzITLdz1d3MV9an3NLbxsRZrG
 74cRP0Jd5gI3rglFWBqT17c=
X-Google-Smtp-Source: ABdhPJz+X0NFQB3B6Cq7BopG/QKpUpBbhEosDWPtc/b7ZfuFTPQIMy4R0mvE//sgmN75YaYZbY2mkg==
X-Received: by 2002:a50:d7d1:: with SMTP id m17mr31946110edj.126.1591183709642; 
 Wed, 03 Jun 2020 04:28:29 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id 93sm1044740edy.49.2020.06.03.04.28.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 04:28:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <1591116981-30162-1-git-send-email-igor.druzhinin@citrix.com>
 <37e6e543-564d-2625-b8d9-ccca6106efd2@suse.com>
 <000f01d63991$717b5e80$54721b80$@xen.org>
 <f1157af8-dd61-d9c2-a405-1e7d13615980@suse.com>
In-Reply-To: <f1157af8-dd61-d9c2-a405-1e7d13615980@suse.com>
Subject: RE: [PATCH v2] x86/svm: do not try to handle recalc NPT faults
 immediately
Date: Wed, 3 Jun 2020 12:28:27 +0100
Message-ID: <001e01d6399a$1ac56820$50503860$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGQ4llbDaBtW772ehRPn2nRu43DNwHKaT0mAbXxiPcBOYrBC6krn8XA
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
Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 03 June 2020 12:22
> To: paul@xen.org
> Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>; =
xen-devel@lists.xenproject.org;
> andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com; =
george.dunlap@citrix.com
> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT =
faults immediately
>=20
> On 03.06.2020 12:26, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 03 June 2020 11:03
> >> To: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Cc: xen-devel@lists.xenproject.org; andrew.cooper3@citrix.com; =
wl@xen.org; roger.pau@citrix.com;
> >> george.dunlap@citrix.com; Paul Durrant <paul@xen.org>
> >> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT =
faults immediately
> >>
> >> On 02.06.2020 18:56, Igor Druzhinin wrote:
> >>> A recalculation NPT fault doesn't always require additional =
handling
> >>> in hvm_hap_nested_page_fault(), moreover in general case if there =
is no
> >>> explicit handling done there - the fault is wrongly considered =
fatal.
> >>>
> >>> This covers a specific case of migration with vGPU assigned on =
AMD:
> >>> at a moment log-dirty is enabled globally, recalculation is =
requested
> >>> for the whole guest memory including directly mapped MMIO regions =
of vGPU
> >>> which causes a page fault being raised at the first access to =
those;
> >>> but due to MMIO P2M type not having any explicit handling in
> >>> hvm_hap_nested_page_fault() a domain is erroneously crashed with =
unhandled
> >>> SVM violation.
> >>>
> >>> Instead of trying to be opportunistic - use safer approach and =
handle
> >>> P2M recalculation in a separate NPT fault by attempting to retry =
after
> >>> making the necessary adjustments. This is aligned with Intel =
behavior
> >>> where there are separate VMEXITs for recalculation and EPT =
violations
> >>> (faults) and only faults are handled in =
hvm_hap_nested_page_fault().
> >>> Do it by also unifying do_recalc return code with Intel =
implementation
> >>> where returning 1 means P2M was actually changed.
> >>>
> >>> Since there was no case previously where =
p2m_pt_handle_deferred_changes()
> >>> could return a positive value - it's safe to replace ">=3D 0" with =
just "=3D=3D 0"
> >>> in VMEXIT_NPF handler. finish_type_change() is also not affected =
by the
> >>> change as being able to deal with >0 return value of p2m->recalc =
from
> >>> EPT implementation.
> >>>
> >>> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> albeit preferably with ...
> >>
> >>> @@ -448,12 +451,14 @@ static int do_recalc(struct p2m_domain *p2m, =
unsigned long gfn)
> >>>              clear_recalc(l1, e);
> >>>          err =3D p2m->write_p2m_entry(p2m, gfn, pent, e, level + =
1);
> >>>          ASSERT(!err);
> >>> +
> >>> +        recalc_done =3D true;
> >>>      }
> >>>
> >>>   out:
> >>>      unmap_domain_page(table);
> >>>
> >>> -    return err;
> >>> +    return err ?: (recalc_done ? 1 : 0);
> >>
> >> ... this shrunk to
> >>
> >>     return err ?: recalc_done;
> >>
> >> (easily doable while committing).
> >>
> >> Also Cc Paul.
> >>
> >
> > paging_log_dirty_enable() still fails global enable if =
has_arch_pdevs()
> > is true, so presumably there's no desperate need for this to go in =
4.14?
>=20
> The MMIO case is just the particular situation here. Aiui the same =
issue
> could potentially surface with other p2m types. Also given I'd =
consider
> this a backporting candidate, while it may not be desperately needed =
for
> the release, I think it deserves considering beyond the specific =
aspect
> you mention.
>=20

In which case I think the commit message probably ought to be rephrased, =
since it appears to focus on a case that cannot currently happen.

  Paul



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B91ECEEC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 13:48:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgRsx-0002Uq-Jj; Wed, 03 Jun 2020 11:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NKV=7Q=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgRsv-0002Ue-RR
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 11:48:41 +0000
X-Inumbo-ID: 2b16b226-a590-11ea-9dbe-bc764e2007e4
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b16b226-a590-11ea-9dbe-bc764e2007e4;
 Wed, 03 Jun 2020 11:48:41 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x14so2042006wrp.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 04:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=wxlEp7b8EAjlLU05U12sz2OC14B8X0NELJbXvi3+0HU=;
 b=Udtt7A10MsR+gT9+OIPvbjd7g+iHgOyhWwYi7wkhvzmFY/J50WrH/n5u4DLTqhklbB
 Glt00yvO9mY4XNDRNJhjn22qqZd0oE4Rh9N0zN1VmjbYx2pwL1iaHXuRTnwEjzJ12ZKr
 Ei+x5Qn+S2dsYkwc/3jZShlsvXMqaDRmlsuD996q/SuIdYKcB9tR7XCW3hjclqcgsrM7
 b3aqNylrDXR9zQvXkIRhDg0T3rhz3KWZ0vZXG2Hie6jilRnQfxZFuw7xuKdJH/j5VssM
 Dpx6WiRXDT6jVjHfb9TXRL2j42HxWOMfOSSUNnZedVJ1NxBp9iXi3qIgne5hoga2VbG7
 QC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=wxlEp7b8EAjlLU05U12sz2OC14B8X0NELJbXvi3+0HU=;
 b=ieutdAWoMJNP3x+ItQin9Y/vIasQDM571VtFY7eILAcVDM1Za1t/EaSBs/7YTrM4Va
 5jo1kWKe9LIcrwOo2+GucALJRzSS+BwUfWaxtAos3pTaZiEiK1P7rg+yzKwqB4rQsCVD
 PdK9ImDZdqqU/xW5dFFuVLP9wKa3dfn9hjOjr6lBAXGVzr+auTGVL9oXWDxukRFUDSN/
 tB2V8qgIOMWmGN/yCOSkPKnJkqSvhveZanwa0xOYKWuigeQwI4v83c+IeS2GVd65yfzp
 WQIULYhD1F0STcknfjABmGDNDHoA8gf6sXJU1nzjFYEoE0nUyCFOiob6SRMqPpIYsx6x
 my1Q==
X-Gm-Message-State: AOAM530lLk66qirtmS5InHA4IGMKW9TOjfyuXCCYm2/FIPMmtJoa+Nsi
 7L1xKojW0XBaEZegLHcrJj8=
X-Google-Smtp-Source: ABdhPJy/q07+vd7ladIVpOFjlOjN88C6Y++gEMTK7K8wvunjn+WC6Q8/17UxdiVkfTtzAG1noWWazQ==
X-Received: by 2002:adf:97cb:: with SMTP id t11mr20758570wrb.314.1591184920029; 
 Wed, 03 Jun 2020 04:48:40 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id q5sm3033250wrm.62.2020.06.03.04.48.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 04:48:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <1591116981-30162-1-git-send-email-igor.druzhinin@citrix.com>
 <37e6e543-564d-2625-b8d9-ccca6106efd2@suse.com>
 <000f01d63991$717b5e80$54721b80$@xen.org>
 <f1157af8-dd61-d9c2-a405-1e7d13615980@suse.com>
 <001e01d6399a$1ac56820$50503860$@xen.org>
 <ee50db9a-3d73-2ed4-579d-983882d13ef3@citrix.com>
In-Reply-To: <ee50db9a-3d73-2ed4-579d-983882d13ef3@citrix.com>
Subject: RE: [PATCH v2] x86/svm: do not try to handle recalc NPT faults
 immediately
Date: Wed, 3 Jun 2020 12:48:37 +0100
Message-ID: <002d01d6399c$ec115a90$c4340fb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGQ4llbDaBtW772ehRPn2nRu43DNwHKaT0mAbXxiPcBOYrBCwMrk2dKAi+np2+pAMulwA==
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 george.dunlap@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 03 June 2020 12:45
> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>
> Cc: xen-devel@lists.xenproject.org; andrew.cooper3@citrix.com; =
wl@xen.org; roger.pau@citrix.com;
> george.dunlap@citrix.com
> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT =
faults immediately
>=20
> On 03/06/2020 12:28, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 03 June 2020 12:22
> >> To: paul@xen.org
> >> Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>; =
xen-devel@lists.xenproject.org;
> >> andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com; =
george.dunlap@citrix.com
> >> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT =
faults immediately
> >>
> >> On 03.06.2020 12:26, Paul Durrant wrote:
> >>>> -----Original Message-----
> >>>> From: Jan Beulich <jbeulich@suse.com>
> >>>> Sent: 03 June 2020 11:03
> >>>> To: Igor Druzhinin <igor.druzhinin@citrix.com>
> >>>> Cc: xen-devel@lists.xenproject.org; andrew.cooper3@citrix.com; =
wl@xen.org; roger.pau@citrix.com;
> >>>> george.dunlap@citrix.com; Paul Durrant <paul@xen.org>
> >>>> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT =
faults immediately
> >>>>
> >>>> On 02.06.2020 18:56, Igor Druzhinin wrote:
> >>>>> A recalculation NPT fault doesn't always require additional =
handling
> >>>>> in hvm_hap_nested_page_fault(), moreover in general case if =
there is no
> >>>>> explicit handling done there - the fault is wrongly considered =
fatal.
> >>>>>
> >>>>> This covers a specific case of migration with vGPU assigned on =
AMD:
> >>>>> at a moment log-dirty is enabled globally, recalculation is =
requested
> >>>>> for the whole guest memory including directly mapped MMIO =
regions of vGPU
> >>>>> which causes a page fault being raised at the first access to =
those;
> >>>>> but due to MMIO P2M type not having any explicit handling in
> >>>>> hvm_hap_nested_page_fault() a domain is erroneously crashed with =
unhandled
> >>>>> SVM violation.
> >>>>>
> >>>>> Instead of trying to be opportunistic - use safer approach and =
handle
> >>>>> P2M recalculation in a separate NPT fault by attempting to retry =
after
> >>>>> making the necessary adjustments. This is aligned with Intel =
behavior
> >>>>> where there are separate VMEXITs for recalculation and EPT =
violations
> >>>>> (faults) and only faults are handled in =
hvm_hap_nested_page_fault().
> >>>>> Do it by also unifying do_recalc return code with Intel =
implementation
> >>>>> where returning 1 means P2M was actually changed.
> >>>>>
> >>>>> Since there was no case previously where =
p2m_pt_handle_deferred_changes()
> >>>>> could return a positive value - it's safe to replace ">=3D 0" =
with just "=3D=3D 0"
> >>>>> in VMEXIT_NPF handler. finish_type_change() is also not affected =
by the
> >>>>> change as being able to deal with >0 return value of p2m->recalc =
from
> >>>>> EPT implementation.
> >>>>>
> >>>>> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> >>>>
> >>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>> albeit preferably with ...
> >>>>
> >>>>> @@ -448,12 +451,14 @@ static int do_recalc(struct p2m_domain =
*p2m, unsigned long gfn)
> >>>>>              clear_recalc(l1, e);
> >>>>>          err =3D p2m->write_p2m_entry(p2m, gfn, pent, e, level + =
1);
> >>>>>          ASSERT(!err);
> >>>>> +
> >>>>> +        recalc_done =3D true;
> >>>>>      }
> >>>>>
> >>>>>   out:
> >>>>>      unmap_domain_page(table);
> >>>>>
> >>>>> -    return err;
> >>>>> +    return err ?: (recalc_done ? 1 : 0);
> >>>>
> >>>> ... this shrunk to
> >>>>
> >>>>     return err ?: recalc_done;
> >>>>
> >>>> (easily doable while committing).
> >>>>
> >>>> Also Cc Paul.
> >>>>
> >>>
> >>> paging_log_dirty_enable() still fails global enable if =
has_arch_pdevs()
> >>> is true, so presumably there's no desperate need for this to go in =
4.14?
> >>
> >> The MMIO case is just the particular situation here. Aiui the same =
issue
> >> could potentially surface with other p2m types. Also given I'd =
consider
> >> this a backporting candidate, while it may not be desperately =
needed for
> >> the release, I think it deserves considering beyond the specific =
aspect
> >> you mention.
> >>
> >
> > In which case I think the commit message probably ought to be =
rephrased, since it appears to focus
> on a case that cannot currently happen.
>=20
> This can happen without has_arch_pdevs() being true. It's enough to =
just
> directly map some physical memory into a guest to get p2m_direct_mmio
> type present in the page tables.

OK, that's fine, but when will that happen without pass-through? If we =
can have a commit message justifying the change based on what can =
actually happen now, then I would not be opposed to it going in 4.14.

  Paul

>=20
> Igor



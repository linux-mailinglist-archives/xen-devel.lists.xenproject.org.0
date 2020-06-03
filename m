Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B19A1ECD81
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 12:27:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgQbQ-0002H6-1A; Wed, 03 Jun 2020 10:26:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NKV=7Q=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgQbP-0002H1-60
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 10:26:31 +0000
X-Inumbo-ID: b055b9d4-a584-11ea-8993-bc764e2007e4
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b055b9d4-a584-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 10:26:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v19so1387331wmj.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=N8FbJHJO1QHHYhzbzBEwMk+G+iLLSzH6Hh+aqkR54q0=;
 b=LDZXNgZXrRc7xLsN1ig1XK86LUXAwXZ8blvSpl/ov8/HEWelEhNcEiPX+R0ZCZp2WI
 ibxLjCfylSlwiwiI5OM7NJ5aH5E6gahbFsNow5hioP6wgZGazFERiCF3QUbzlWXwFN0t
 k+uzqiQfH3J6n1vfSRYapMA15I29dit4L8IF4ijIjeWrFSr/mWGzmD+RtObNYJqTLi8J
 H5BdIG55v8v8d/GgZR+3nMXWGHtCVKsf7yha+SMnRHI4bhTTnAa1K132Xry24rBWyfZk
 5JITkh+3tDnkhHEg2pjFbk8TGuhQqmUBeJTS1+RXaPv+y82B9wbatfHAgtycLWFqw6AK
 o+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=N8FbJHJO1QHHYhzbzBEwMk+G+iLLSzH6Hh+aqkR54q0=;
 b=NELJ+R9EcicA3cnrjqrHsRTrkMpRGWEZlPL68v5PwUo7YSw2MWKl86ut9QurlY1/FZ
 k55qQjCIZ64RMMq2VoeD+E0rvI9EV3LpbY3cIPZy/xAkTmG2NGY6/AZg27HaltuZDuko
 Id1TdRb7AaNZ/JGYQ6UjCjG67Ew24lUkqOChrJjdyjHj48Z5Cr63wesVjOzPHMFFYJT/
 IoVovOjbXx1Wv6z/apy9az2QNKzLZKd4QVhtZp+dKV6qGAqsMvcgevyzsU4iqlpvi8Br
 RfSxJHHFeVSzkkTn4fvMfpuCPtMakzmTAxSLwGAY6gKvqLwA1l7KS3cN37CQdx29+wO4
 8LOA==
X-Gm-Message-State: AOAM531kggBDpfZ20uBE7IvpkDwWYkTiv7FDh/l5qP2SVI4edMjx3hjr
 7TgS6kAgauZR9qT+GK/QTZs=
X-Google-Smtp-Source: ABdhPJyM/J6a5Sm752fgnA+7iBOfx/lZjzYotSG9dNGE+6DxuwTUomfNZ6pcJuiPupW9NZ28PHAGXA==
X-Received: by 2002:a1c:8048:: with SMTP id b69mr7768316wmd.169.1591179989754; 
 Wed, 03 Jun 2020 03:26:29 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id q1sm2192126wmc.12.2020.06.03.03.26.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 03:26:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Igor Druzhinin'" <igor.druzhinin@citrix.com>
References: <1591116981-30162-1-git-send-email-igor.druzhinin@citrix.com>
 <37e6e543-564d-2625-b8d9-ccca6106efd2@suse.com>
In-Reply-To: <37e6e543-564d-2625-b8d9-ccca6106efd2@suse.com>
Subject: RE: [PATCH v2] x86/svm: do not try to handle recalc NPT faults
 immediately
Date: Wed, 3 Jun 2020 11:26:27 +0100
Message-ID: <000f01d63991$717b5e80$54721b80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGQ4llbDaBtW772ehRPn2nRu43DNwHKaT0mqUMJt2A=
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
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 03 June 2020 11:03
> To: Igor Druzhinin <igor.druzhinin@citrix.com>
> Cc: xen-devel@lists.xenproject.org; andrew.cooper3@citrix.com; =
wl@xen.org; roger.pau@citrix.com;
> george.dunlap@citrix.com; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT =
faults immediately
>=20
> On 02.06.2020 18:56, Igor Druzhinin wrote:
> > A recalculation NPT fault doesn't always require additional handling
> > in hvm_hap_nested_page_fault(), moreover in general case if there is =
no
> > explicit handling done there - the fault is wrongly considered =
fatal.
> >
> > This covers a specific case of migration with vGPU assigned on AMD:
> > at a moment log-dirty is enabled globally, recalculation is =
requested
> > for the whole guest memory including directly mapped MMIO regions of =
vGPU
> > which causes a page fault being raised at the first access to those;
> > but due to MMIO P2M type not having any explicit handling in
> > hvm_hap_nested_page_fault() a domain is erroneously crashed with =
unhandled
> > SVM violation.
> >
> > Instead of trying to be opportunistic - use safer approach and =
handle
> > P2M recalculation in a separate NPT fault by attempting to retry =
after
> > making the necessary adjustments. This is aligned with Intel =
behavior
> > where there are separate VMEXITs for recalculation and EPT =
violations
> > (faults) and only faults are handled in hvm_hap_nested_page_fault().
> > Do it by also unifying do_recalc return code with Intel =
implementation
> > where returning 1 means P2M was actually changed.
> >
> > Since there was no case previously where =
p2m_pt_handle_deferred_changes()
> > could return a positive value - it's safe to replace ">=3D 0" with =
just "=3D=3D 0"
> > in VMEXIT_NPF handler. finish_type_change() is also not affected by =
the
> > change as being able to deal with >0 return value of p2m->recalc =
from
> > EPT implementation.
> >
> > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit preferably with ...
>=20
> > @@ -448,12 +451,14 @@ static int do_recalc(struct p2m_domain *p2m, =
unsigned long gfn)
> >              clear_recalc(l1, e);
> >          err =3D p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
> >          ASSERT(!err);
> > +
> > +        recalc_done =3D true;
> >      }
> >
> >   out:
> >      unmap_domain_page(table);
> >
> > -    return err;
> > +    return err ?: (recalc_done ? 1 : 0);
>=20
> ... this shrunk to
>=20
>     return err ?: recalc_done;
>=20
> (easily doable while committing).
>=20
> Also Cc Paul.
>=20

paging_log_dirty_enable() still fails global enable if has_arch_pdevs() =
is true, so presumably there's no desperate need for this to go in 4.14?

  Paul

> Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E28234742
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VZe-0000s2-Lw; Fri, 31 Jul 2020 13:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fae6=BK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k1VZc-0000rw-OX
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:59:48 +0000
X-Inumbo-ID: 177957e0-d336-11ea-8e40-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 177957e0-d336-11ea-8e40-bc764e2007e4;
 Fri, 31 Jul 2020 13:59:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 184so9351716wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=YrGJFmvM9W3vLd6xyCKqsjUN4BdSFENjQYcqnSOmoT8=;
 b=FxOrwDbDDbzual7ruPoViixfSNLKMiSu3pyFMNc8qm05hI6NhmzIzABAQY6DxAH1gR
 LPbGqNJeoUvh/S+6ZpChyJF7tC1Ecx/suTy5EEOl+kJWqC2W+nXzZpuucv+0wN0V+GWq
 HpTcdcQBP2a7gN+P/+bmXAYJLXQTnqQfqY/cfplyhAOdPrHvg9GaoAP+FbCksZCJsNRk
 iA7lDcRqsG5gmKxaIlR6F7fjvYq8mtVEnEEKnuqTVJnWfKhlPna/oWmFkPTYmy2dfwLL
 sZbWS+mHX5RxH57R6k+TwnF+7TNmpehxwrYH+Lb7m7UA0fn8p5mju+2eVrUh2k8orIqt
 aXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=YrGJFmvM9W3vLd6xyCKqsjUN4BdSFENjQYcqnSOmoT8=;
 b=HUtZccvryA0+CHi/+Q4Bj+MOdOxFo+Wu5vIDNzvNQVC2rBDVGZyILXbAIscskxjzS5
 66En2fglJd+e07miCIgaxq59wZ3OsXZz17rRkKvb8PXAp2wPjwFkzT2y+p1rAQJsGwRn
 qXPXPWXmTlsemk6jggDJqnmse3DKMJlaNfhLOD96uoJ5TB3OvfvhsPkOHJQUiQuQIWlf
 RwKCMtZ3pyu44pX+R9kKGEnBZt1ttjZmzvVTNC4sOLVRMQLW3YV1daFCNYGctBTzSza0
 ABxUfkH5OGNkOGlDCpWLy7Ocm6TayF/tEkuJGgKxY6lzaHxBtrqXrz++xnszcyP9D4Vj
 qYLg==
X-Gm-Message-State: AOAM530Xrs+Etu+V90bZwHXHiTpjTSANYU5jBl7NxlFr0hRCfFmJtl6x
 Ir9A15Pu+A8GKys/kIRL0tY=
X-Google-Smtp-Source: ABdhPJyMcWgvjVv666IE1Ji5VhV6mo67kEyfu+uhXPQwWV/ia/AbTcouC/ErnMNd6UWDX0LNrFLPRg==
X-Received: by 2002:a05:600c:230e:: with SMTP id
 14mr3831247wmo.3.1596203986036; 
 Fri, 31 Jul 2020 06:59:46 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id b2sm11652468wmj.47.2020.07.31.06.59.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Jul 2020 06:59:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <paul@xen.org>,
	"'Jan Beulich'" <jbeulich@suse.com>
References: <20200731123926.28970-1-paul@xen.org>
 <20200731123926.28970-3-paul@xen.org>
 <a4856c33-8bb0-4afa-cc71-3af4c229bc27@suse.com>
 <004501d6673b$9adffbf0$d09ff3d0$@xen.org>
 <84cdd5b8-5149-a240-8bad-be8d67dca0d8@suse.com>
 <004601d66740$9661ad80$c3250880$@xen.org>
In-Reply-To: <004601d66740$9661ad80$c3250880$@xen.org>
Subject: RE: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()
Date: Fri, 31 Jul 2020 14:54:33 +0100
Message-ID: <004701d66742$1ef678a0$5ce369e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLlfQu00pWfsofZfQkBPK3LKKgwygFbp5BqArgsBgQC0uj+iQMLOy2gApabDZmmn0USEA==
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Paul Durrant <xadimgnik@gmail.com>
> Sent: 31 July 2020 14:44
> To: 'Jan Beulich' <jbeulich@suse.com>
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' =
<pdurrant@amazon.com>; 'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Roger Pau =
Monn=C3=A9' <roger.pau@citrix.com>
> Subject: RE: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in =
epte_get_entry_emt()
>=20
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: 31 July 2020 14:41
> > To: paul@xen.org
> > Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' =
<pdurrant@amazon.com>; 'Andrew Cooper'
> > <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Roger Pau =
Monn=C3=A9' <roger.pau@citrix.com>
> > Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in =
epte_get_entry_emt()
> >
> > On 31.07.2020 15:07, Paul Durrant wrote:
> > >> -----Original Message-----
> > >> From: Jan Beulich <jbeulich@suse.com>
> > >> Sent: 31 July 2020 13:58
> > >> To: Paul Durrant <paul@xen.org>
> > >> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Andrew Cooper
> > >> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>
> > >> Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check =
in epte_get_entry_emt()
> > >>
> > >> On 31.07.2020 14:39, Paul Durrant wrote:
> > >>> From: Paul Durrant <pdurrant@amazon.com>
> > >>>
> > >>> Re-factor the code to take advantage of the fact that the APIC =
access page is
> > >>> a 'special' page.
> > >>
> > >> Hmm, that's going quite as far as I was thinking to go: In
> > >> particular, you leave in place the set_mmio_p2m_entry() use
> > >> in vmx_alloc_vlapic_mapping(). With that replaced, the
> > >> re-ordering in epte_get_entry_emt() that you do shouldn't
> > >> be necessary; you'd simple drop the checking of the
> > >> specific MFN.
> > >
> > > Ok, it still needs to go in the p2m though so are you suggesting
> > > just calling p2m_set_entry() directly?
> >
> > Yes, if this works. The main question really is whether there are
> > any hidden assumptions elsewhere that this page gets mapped as an
> > MMIO one.
> >
>=20
> Actually, it occurs to me that logdirty is going to be an issue if I =
use p2m_ram_rw. If I'm not going
> to use p2m_mmio_direct then do you have another suggestion?
>=20

Looking further I'm uneasy to move away from setting that APIC access =
page to anything other than mmio_direct so I'd rather leave the VMX code =
alone and re-order things here.

  Paul




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72D1B1742
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 22:39:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQdBy-0006I7-UO; Mon, 20 Apr 2020 20:38:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WKP3=6E=gmail.com=jaromir.dolecek@srs-us1.protection.inumbo.net>)
 id 1jQdBx-0006I2-9o
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 20:38:57 +0000
X-Inumbo-ID: f4cc390e-8346-11ea-b58d-bc764e2007e4
Received: from mail-vs1-xe33.google.com (unknown [2607:f8b0:4864:20::e33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4cc390e-8346-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 20:38:56 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id h30so6547828vsr.5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bQALrf3WcH8i6SO2fmMGShb4DZzX8afESIzHnyOClcA=;
 b=Vy1sGPMtxUT2w0bicMiM2oc16xPxx/dg68oqkE08sWMfgk8sNw3aL6Y9cidFwdh6/E
 JQvG9nFyF5WrU+jZaxoIbvFYFFiGHd6OPTR+1DCC8CzPcdBZdd3C2qN7HsJJo1SdmGut
 G/srvqP4rL9Dzb92vT62eqxNTnMuGduK4fhQhqiUH2bozamuST1ccdL8ufktcQ78sAC9
 O6Kzd2ZSZ98RgWLBZSOOucdtrv50+lNppVqAnDVsZYeEcxkhMWxlrvAZn3mar8hC/YNI
 51kz0wzPtKiLmYSYSP+QeFzTNsBcg/DUMcCagX5iHFeNC7qxnyrPPh7r3+K36hHcsk2/
 GMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bQALrf3WcH8i6SO2fmMGShb4DZzX8afESIzHnyOClcA=;
 b=q8jFfKWTLBT4oncEQvuNgcBEhXPfd/VNV9CR1OJV5ytpY0bneWNml4/8IyILgmPKKT
 svGTww6z0EHsozRWItLErxsikzITfD2yXri9bi1TVpU0Rv9jB3cJcpKXMLm+cP9fr4Fp
 m+q6i1/DA7qBxF5sVuhxL+46U5kXAETGhdB3cUy6GPQWuoU83OGbiBu2MaUrp3LpAi8p
 HXw2jKWIr5lKJQ+5Lm2HFaiKEQ839SJlCAiPA+RxSGdtW+2Ks6JWx4P/cXm9DNR/TSBk
 L5AHOGSwPUEVaBP9FUR/IdRRxwfp+ZPsG2OciJeRy1nBdU03ahHsnxtWchVYdpezH+Yh
 fb2A==
X-Gm-Message-State: AGi0PuYXoMqfrAmCpRFnE5ATDApIl7shIhYD5wBLCSjMWfT5mft7B988
 31wyy+MwAB4ZTUZNsftOjZa677sglhazfphVdtJsz+7/
X-Google-Smtp-Source: APiQypLgZ6P1Tc5MY6wmwxSX+XvdxtiEZVp38a3PkdijPAJ0wDPEEGmzINyxGpbllRAXVaA3H3YlC1kiVYIdd7KszZs=
X-Received: by 2002:a05:6102:104b:: with SMTP id
 h11mr13286523vsq.182.1587415136054; 
 Mon, 20 Apr 2020 13:38:56 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?SmFyb23DrXIgRG9sZcSNZWs=?= <jaromir.dolecek@gmail.com>
Date: Mon, 20 Apr 2020 22:38:45 +0200
Message-ID: <CAMnsW57Kn05TyDiVmZLaiYBdVZwy_7LazvLvR_AG0KHEYJ-z0Q@mail.gmail.com>
Subject: grant_table_op v2 support for HVM?
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

I'm working on NetBSD Xen support.

Recently, we've switched to grant version 2 mainly for the improved
status handling, and eventually for copy-only subpage grant support,
which I'd like to experiment with in our netback driver. Currently we
don't need the 64-bit frame, which I found was reason to Linux was
switched over to v2 a while ago.

However, later found out that HVM doesn't actually seem to support the
GNTTABOP_get_status_frames hypercall, so had to fall back to v1 for
HVM. Code in xen/arch/x86/hvm/hypercall.c, which doesn't have any
handling in GNTTABOP_get_status_frames neither in Xen 4.11/4.12/4.13.

Can you advise which version should be used by Dom0/DomU kernels?

Is there some way to still use v2 with HVM? Possibly instead of using
the status frames, still use the old cmpxchg16 method on hdr.flags,
but as I understand hdr.flags is not used for GTF_reading and
GTF_writing in v2. I also see the set_version and get_version calls
are still supported even for HVM.

Understandably, we'd prefer to use same version for PV and HVM kernels.

Thanks.

Jaromir


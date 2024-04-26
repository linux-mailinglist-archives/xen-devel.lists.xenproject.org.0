Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C18B3B71
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 17:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712937.1113854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NVw-0001m9-4H; Fri, 26 Apr 2024 15:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712937.1113854; Fri, 26 Apr 2024 15:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NVw-0001kV-1Y; Fri, 26 Apr 2024 15:29:28 +0000
Received: by outflank-mailman (input) for mailman id 712937;
 Fri, 26 Apr 2024 15:29:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duI6=L7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s0NVu-0001kP-Rp
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 15:29:26 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2398ba0-03e1-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 17:29:24 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-233e41de0caso1213044fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 08:29:24 -0700 (PDT)
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
X-Inumbo-ID: c2398ba0-03e1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714145363; x=1714750163; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0t5p+WWSt9ikrabmyJauB3WDMG6W/CXTcCeLaYJVYs=;
        b=XKLmnwnvTvKgoNtx4AH2JyoviSmsGJ9xSKwrz8YL0FopCIpfJsm/N1XZTb0dwu9Tg6
         cAzIRFzKNleaFEi3DbymcZlRljV9E/KxV2DBKkVSFkfZ9W0/6CeViBpEwY3ERLbBxH4F
         dJQ28zCoHbb06tvyKbzOEV7w0Lqb9CTdEyGZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145363; x=1714750163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0t5p+WWSt9ikrabmyJauB3WDMG6W/CXTcCeLaYJVYs=;
        b=f9Hw3ZMzEPtkhYHDN/BNqp57yxf/WKs9Fqtt84DagOxOanS8uZ8RQfCDC18mnCLPsX
         QbuAMN/oFZHurM4xWoSfuBkE9TAc46n1Fma8ZFXM9AI5gFMPD4KKdwP5D+9nJhK+omg0
         tWu+aKWHr2PKpovBGb+FH9mBhpp0DWbgu14pOVpr0TKEARSO+lhfM1aVCH/pjVWXDGsu
         BWfNplqOkhGuWkxubfrMNpLOcvjVVe9vKqAvyyR25eKUUqUjrhmfvwaCrQBYMO3POg0T
         PoYThX/K/7t8ie2UBknonwlNB70OjrRLyKwZ2T2SV0E8XvpMy6+Hhkz0zTsKr4fAv2/0
         0ahw==
X-Gm-Message-State: AOJu0YwqhASw2/0wQsiKhpnIWEX7Hq6BG24k09a0KGMaAg0VhSoquQ2c
	fGzX1ucjy8k0Cax3NaJKgLKUh2JNycTE4/uuDDU3OeEutq6nb4z3eLYFzEBjxh8MUZGlA/Ocwtf
	/iKAJJIh6+6W9hdEj8GWdjV5GxQI1YXd68Q1J8w==
X-Google-Smtp-Source: AGHT+IHv3jAJVR6+fcVJf0KShUbpeOaSoiIuCkuNZoBDZwfIQ3o/2TtaJ+wF0g6owar51D0t4Es8XKYiJoy34CMcPSg=
X-Received: by 2002:a05:6871:e014:b0:229:e422:4ff9 with SMTP id
 by20-20020a056871e01400b00229e4224ff9mr2946046oac.18.1714145362842; Fri, 26
 Apr 2024 08:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
 <20240426143231.4007671-2-george.dunlap@cloud.com> <aecae47b-eba6-4544-a566-8eb259d11a41@citrix.com>
In-Reply-To: <aecae47b-eba6-4544-a566-8eb259d11a41@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 26 Apr 2024 16:29:12 +0100
Message-ID: <CA+zSX=b40xNSX2yNcnESW3ev3ZG5Esyp_+-9ADaWuLEmzpvr5A@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/hvm/trace: Use a different trace type for AMD processors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau Monne <roger.pau@cloud.com>, Anthony Perard <anthony.perard@cloud.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 4:18=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 26/04/2024 3:32 pm, George Dunlap wrote:
> > A long-standing usability sub-optimality with xenalyze is the
> > necessity to specify `--svm-mode` when analyzing AMD processors.  This
> > fundamentally comes about because the same trace event ID is used for
> > both VMX and SVM, but the contents of the trace must be interpreted
> > differently.
> >
> > Instead, allocate separate trace events for VMX and SVM vmexits in
> > Xen; this will allow all readers to properly intrepret the meaning of
>
> interpret ?

Oops, yes.

> > In xenalyze, first remove the redundant call to init_hvm_data();
> > there's no way to get to hvm_vmexit_process() without it being already
> > initialized by the set_vcpu_type call in hvm_process().
> >
> > Replace this with set_hvm_exit_reson_data(), and move setting of
> > hvm->exit_reason_* into that function.
> >
> > Modify hvm_process and hvm_vmexit_process to handle all four potential
> > values appropriately.
> >
> > If SVM entries are encountered, set opt.svm_mode so that other
> > SVM-specific functionality is triggered.
>
> Given that xenalyze is now closely tied to Xen, and that we're
> technically changing the ABI here, is there any point keeping `--svm-mode=
` ?
>
> I'm unsure of the utility of reading the buggy trace records from an
> older version of Xen.

Yeah, I thought about that.  If nobody argues to keep it, I guess I'll
rip it out for v2.

> > Also add lines in `formats` for xentrace_format.
>
> Personally I'd have put patch 3 first, and reduced the churn here.

I actually meant to add an `RFC` to the third patch.  I'd already
implemented this by the time you suggested ripping it out.  Doing it
this way doesn't add much overhead if we do end up ripping out
xentrace_format, and does save time if we don't.

> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> > ---
> > NB that this patch goes on top of Andrew's trace cleanup series:
> >
> > https://lore.kernel.org/xen-devel/20240318163552.3808695-1-andrew.coope=
r3@citrix.com/
>
> The delta in Xen is trivial.  I'm happy if you want to commit this, and
> I can rebase over it.

It's trivial in part *because of* your series.  Without your series I
would have had to do a bunch of munging around with DO_TRC_BLAH_BLAH
to make it compile.  In fact, I started doing it directly on staging,
but quickly moved onto your series to save myself some time. :-)

Since I'm planning on re-submitting your series if you don't (unless
you really object), this way should minimize churn.

I'm happy to post a branch to gitlab if anyone wants to see the combined re=
sult.

 -George


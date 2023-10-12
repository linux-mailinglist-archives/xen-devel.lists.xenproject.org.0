Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A927D7C760E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 20:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615970.957566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr0bO-0008DC-WF; Thu, 12 Oct 2023 18:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615970.957566; Thu, 12 Oct 2023 18:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr0bO-0008AQ-TS; Thu, 12 Oct 2023 18:40:06 +0000
Received: by outflank-mailman (input) for mailman id 615970;
 Thu, 12 Oct 2023 18:40:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr0bN-00080g-T7
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 18:40:05 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c210cc6d-692e-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 20:40:04 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53d9b94731aso2449492a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 11:40:04 -0700 (PDT)
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
X-Inumbo-ID: c210cc6d-692e-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697136003; x=1697740803; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1aZVXohRge+v3Vv/6fsNhXCZ7AScOuTNQZ+ekrGnkw=;
        b=KbrkIvvdGCzuKg2UkvQixrq3/pCdyCyBjSJtKao3PugH1wRLOyA4Kbw3dlb1hlbK/t
         EKllvS/5s8u2P7gmPv9QhoYhGgMhu6fof6GEDZrC6JzZKDCNW1vRT+aHYXLU28WRKFA0
         fzzZ+bgmxVmVd/ol7xvVSQqo+16gWLu3xspF2CAetYUpAmp2vmHtQDveczVQNICpnxP+
         z0JEpJm/fUHrwEk2KssUsPs/UIaHrzCUFKQvtGP4rOQeOtO1d3LNhqBtbydq2BvMXIjt
         h++YkIIMJfl+ZxIjA1PG+m8aTW+0krHAWK+0AFd/wezA8/+BwqHSNSnylw38muIj5/ZN
         NtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697136003; x=1697740803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1aZVXohRge+v3Vv/6fsNhXCZ7AScOuTNQZ+ekrGnkw=;
        b=k3f3uQVYL4uuBnKvKyUHdHqHHtrRLBTm7BXWpVxstCtb2cqsKLLuSljAcaELTXvy+2
         9VNDuXS0279kWEulVzMzRTzyQ0+CgIIrUUgorURiAiYlsG2OOXt/WeDh/mjIFqubSpOQ
         XuIEUHD5XrdsmDMsXq1Yp3t6X7OlxMOQCncqWk2GMJO64dedya7Vx3sUJBbWTKkX67lG
         4Y75WWTM8RA4bBMceKEEifJHYX+wke9OSfIOvKPqanqc/CpFQjIW99CaIlVmUuJpUIuk
         sab4kD++mAllTSf28RPxxPNrqILaBIVBOIrOCZnmrukPWhqVOqaPx40j9nd9Il+G4eM0
         QGhw==
X-Gm-Message-State: AOJu0YxbKpKjDG1mg1MXIIqECUgNdtwnIWCvEigDLXERNTUthx9bQpLj
	8+6hA/EeiDCarJl3zYmPoV2fM7aFM1cNUXpf9cc=
X-Google-Smtp-Source: AGHT+IEHHumjNQpn73kXZqpk0T02To9UzO7onfeg6sqCjti4bWA6fBS/ptoScbdqZYxE54CRPouSH8kbA0BFawhRjIw=
X-Received: by 2002:a05:6402:510a:b0:53e:3584:d394 with SMTP id
 m10-20020a056402510a00b0053e3584d394mr169774edd.33.1697136003595; Thu, 12 Oct
 2023 11:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231012161237.114733-1-ubizjak@gmail.com> <20231012161237.114733-2-ubizjak@gmail.com>
 <CAMzpN2ii5qMr36PSw8RzNuVB-9KhoQgyfet=FpPtT5F3hOmLmQ@mail.gmail.com> <CAFULd4ZVvRvssyj--un6vrLU5M816ysEkc4xpXnGSN=hyhTTFQ@mail.gmail.com>
In-Reply-To: <CAFULd4ZVvRvssyj--un6vrLU5M816ysEkc4xpXnGSN=hyhTTFQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 12 Oct 2023 20:39:52 +0200
Message-ID: <CAFULd4b=S09YvHoJ3UkY=DbJRS+xqhFwrP50YEYomntxy6JtnQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] x86/percpu: Use explicit segment registers in lib/cmpxchg{8,16}b_emu.S
To: Brian Gerst <brgerst@gmail.com>
Cc: x86@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 7:54=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
> > This will break on !SMP builds, where per-cpu variables are just
> > regular data and not accessed with a segment prefix.
>
> Ugh, indeed. Let me rethink this a bit.

Something like this:

#ifdef CONFIG_SMP
#define PER_CPU_ARG(arg)    %__percpu_seg:arg
#define PER_CPU_VAR(var)    %__percpu_seg:(var)##__percpu_rel
#else /* ! SMP */
#define PER_CPU_ARG(arg)    arg
#define PER_CPU_VAR(var)    (var)##__percpu_rel
#endif    /* SMP */

and using the above PER_CPU_ARG in /lib/cmpxchg{8,16}b_emu.S will
solve the issue.

I will prepare a v2.

Thanks,
Uros.


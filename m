Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4CF8A0387
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 00:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703693.1099496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruggG-0005zA-9B; Wed, 10 Apr 2024 22:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703693.1099496; Wed, 10 Apr 2024 22:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruggG-0005wv-5p; Wed, 10 Apr 2024 22:44:36 +0000
Received: by outflank-mailman (input) for mailman id 703693;
 Wed, 10 Apr 2024 22:44:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a91P=LP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ruggE-0005vW-F6
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 22:44:34 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c330d1-f78b-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 00:44:32 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e6646d78bso4048781a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 15:44:32 -0700 (PDT)
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
X-Inumbo-ID: e5c330d1-f78b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712789072; x=1713393872; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMizZl+Vqp5JNwp1YMb5ta7Uk1RvNa2X4SM4hK/B6PI=;
        b=O5dQ1Yb2YW8lg1Ouk75DpRYKnbPT0nLF5rx2CRpjDmVB10EdchrUjgEJGxoPZWLXvJ
         0MIEHwnEFg/ClVKaSglLn76kG2xUcBvut+24zHqziLDebmVRUbLFCDzsws2ilt2qCOGS
         qfpNvpqO/FvFkIkThE8Cke6bEUfNXzuR8ZgvzMSqN/k0jCD3JzajLnarSKplAT8KY+bd
         Y/SN/a97x3t6u6h/TRw+uNY40UMLdeNUSjg7Rv05K/DA7DXNdLBH/nt5OXHxvfCTVq6F
         dfIcpzHthpTxsnyB3v43plyKYAazwhLm8mnVPcKoh2i6eqpmWuuMLivfdPOokE7iNMcF
         vmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712789072; x=1713393872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMizZl+Vqp5JNwp1YMb5ta7Uk1RvNa2X4SM4hK/B6PI=;
        b=up40fx+FCIPcKX1n36tB+G0JzGOdxcoJ/MuSor5QtYL52yrlohZwuHarD1PxNMWKps
         nzKJYLd5ieb2hJaSedb8flhJuBkGrwc20I+Fly40adiSLgrhR/QinbzEyXa1Uun5GgiU
         40TPREPASuI54V1/EXLgoZgebi22THVS8g95ZQ+NlM626ac4QZe8SR5oxcIwa3JHneW9
         7JxBGF9eA2gQGNp+U1BPtFRsTxGYWdWkd3Nu1VPoH0Os6J1cysUORIzEvOmggNvhxgNM
         v+gK2/0nkbzMnY9fGUSpmJPj8f1yjEZDoEPTVhuwMrruPerxPD1nMJ0HEcwVGhE6q1bA
         WPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0a9BS+QK8w8bKtWKttaIU/y5QHM0AEulVovA3TuY82ooHqf5DQz2EQ+xfbLwAVPr2xpkeJgMEerlU7q/z/QjC9n1OWslxH2/kRG63k4c=
X-Gm-Message-State: AOJu0Yw7+mCKxZEiktvlPJr3B1NISzNlVm5ToYhwzXWnYDvvgff6zgPh
	6BSS5dmnk+utbY/3kEeKasV9AKZn59O1Mic5tu33J1JMwLH4QY7RQ37fr6mort3JCF1aICOKC+o
	y6q+n7C/pHljzQ/uq70ZMfb4Ao2A=
X-Google-Smtp-Source: AGHT+IHUb2kSqmQGoyf/pmBPVmanUCKY1ukJu0Hjls0xlJbsF3+yQNgx6yhmq+jquYJQb7UKAKsU2zKca4hxGXn8sEU=
X-Received: by 2002:a50:875a:0:b0:56e:359d:fcea with SMTP id
 26-20020a50875a000000b0056e359dfceamr2534639edv.34.1712789071572; Wed, 10 Apr
 2024 15:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240409094712.21285-1-jgross@suse.com>
In-Reply-To: <20240409094712.21285-1-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 Apr 2024 18:44:19 -0400
Message-ID: <CAKf6xptBEksXYaPg55fEHAvPLuCkW+h4iWerofxzu1GdLcrPBg@mail.gmail.com>
Subject: Re: [PATCH] x86/pat: fix W^X violation false-positives when running
 as Xen PV guest
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Juergen,

On Tue, Apr 9, 2024 at 5:47=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> When running as Xen PV guest in some cases W^X violation WARN()s have
> been observed. Those WARN()s are produced by verify_rwx(), which looks
> into the PTE to verify that writable kernel pages have the NX bit set
> in order to avoid code modifications of the kernel by rogue code.
>
> As the NX bits of all levels of translation entries are or-ed and the
> RW bits of all levels are and-ed, looking just into the PTE isn't enough
> for the decision that a writable page is executable, too. When running
> as a Xen PV guest, kernel initialization will set the NX bit in PMD
> entries of the initial page tables covering the .data segment.

I think this is a more accurate description of what I investigated:
"When running as a Xen PV guest, the direct map PMDs and kernel high
map PMDs share the same set of PTEs.  Kernel initialization will set
the NX bit in the direct map PMD entries, and not the shared PTEs."

The WARN()s I saw were with direct map addresses.

Thanks,
Jason


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3724B20C0B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 16:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077695.1438726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulTcx-0007F7-W1; Mon, 11 Aug 2025 14:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077695.1438726; Mon, 11 Aug 2025 14:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulTcx-0007Dg-Sb; Mon, 11 Aug 2025 14:35:55 +0000
Received: by outflank-mailman (input) for mailman id 1077695;
 Mon, 11 Aug 2025 14:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8H9H=2X=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ulTcw-0007DC-00
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 14:35:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b61603d-76c0-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 16:35:53 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-459e20ec1d9so44250905e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 07:35:52 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e587d378sm255047825e9.23.2025.08.11.07.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 07:35:51 -0700 (PDT)
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
X-Inumbo-ID: 7b61603d-76c0-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754922952; x=1755527752; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GTUev54ZcTfpbtj0slFOAhsdQHUK4EUNpAEgpCcOuvE=;
        b=k45mmMiJw7QHUvmJ8l5ZZtsWmJVM67seTDo96RxFwMjQnwN9TiVYEL7dDJdnAIEvjd
         gIdoSTse6/tk3/AEJHrg9Lqm1/qp7jsFG7rhGG2gs9LbAcIBYPKqtS6SE9ykdSfHKjSA
         LqzwJnS7MG69R1BTxZaZ9r1WagHhDMuz1Eo3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754922952; x=1755527752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTUev54ZcTfpbtj0slFOAhsdQHUK4EUNpAEgpCcOuvE=;
        b=lPAUM9h2uDpnKYL9D2sZrIe+sU+tGjXj4rtHTQEf2g1c3s16WuOTtQOwush1bm2Sn+
         mZVAHQN+sadDv1lWpiI5w7McCxByZN4w2W96vBwkJB2c9bYegt1F6esYsEbYG919boj8
         kKSKVh+CPL7jddTwsVvzw6jZU6PM5vVJYpH9ayoLJE7/cINHH9mH8FePLNarZyEMUtOe
         PIayFNIhj220GS3bzCRYEegXlHl3sVzG2TdtsZ4SZA3X2K9PEGkCMljZRp9CVtF0tzu/
         QzctObL3L5JK9jQ0mapaGcIEWZWGXmtEbcPOrv20MZALDH53CBLpzRUAmkDR5yMyEbW8
         RaRA==
X-Forwarded-Encrypted: i=1; AJvYcCUPz6a1YRhgTRy+LzsM9h8DPt8LRWif92IRv10RbgsCzQNUzKrXv/MIukHOrEHNl5ZbLkM0ELyso4A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHqSIvRWr0XQFyPEeC9ttDtuXjupsyo8vWEB7ybGiPfB9AVV5A
	71Zptw78vV2vbe8dZDBE3m2Sl+1vIn6yA508wczk+cRmhUBWOHHFrCd7O1kwO9bErx0=
X-Gm-Gg: ASbGncvr2A1iS9TyUMMwBgNhsjEUIYdo3Jya+Zann7NPrpR1dlZWvIL0ibL0zZii4LJ
	9rRxX7uveNd5rVLnWD9zASs6Q87obsV7i0XT3vyGbN8YT6oMapOWfZeltTGSz/5ifnCEErOyc4F
	QDz+8E4Jli3f29+UMfhUIjekMdbHszwxNQDAf+gFew+TUu1vIJ5kT8JaH6fQJoPbthjKtjV35mh
	H/D6M475m9NbTj0evFk3AG++FDZEZ3/ON1RFSfL/9KvhX5IRpJ/YOSEUftw1MEdLdBTlsUfhiIi
	uL+23PgBqQxLV87MSc42NPzhIVkNOj9kDFFd1BASDYXifK0R0duPc1I8VKruYJl/g3yOZs8W2Oc
	D/UIGjEPghQKzvy03hoQRC6FUG0fOz20iDQDAKwWQ6AfS5ELiTyPZN2hgR+BK7qlwTwql1uZOnT
	VQ
X-Google-Smtp-Source: AGHT+IFLT/Dy8tcf/vsaSHC663m+mEX+vX5uYQIc1kukmhi8UimxCTzELxuGhOEn9DNofrW+WR5YTA==
X-Received: by 2002:a05:600c:3b99:b0:458:bbed:a827 with SMTP id 5b1f17b1804b1-459f4f3dc39mr100977145e9.1.1754922951809;
        Mon, 11 Aug 2025 07:35:51 -0700 (PDT)
Date: Mon, 11 Aug 2025 16:35:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen: Drop logic for old clang versions.
Message-ID: <aJn_xi5dVD3-imnz@macbook.local>
References: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
 <aJmgCv4wgl-IHupn@macbook.local>
 <2ca7082120df5e1ad6a29582d6dfb215@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ca7082120df5e1ad6a29582d6dfb215@bugseng.com>

On Mon, Aug 11, 2025 at 11:37:46AM +0200, Nicola Vetrini wrote:
> On 2025-08-11 09:47, Roger Pau Monné wrote:
> > On Sun, Aug 10, 2025 at 03:03:53PM +0200, nicola.vetrini@gmail.com
> > wrote:
> > > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > 
> > > The enforced toolchain baseline for clang is version 11,
> > > therefore this logic is effectively dead code.
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > > ---
> > > Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
> > > ---
> > >  xen/common/coverage/llvm.c   | 4 ----
> > >  xen/include/xen/self-tests.h | 9 +--------
> > >  2 files changed, 1 insertion(+), 12 deletions(-)
> > > 
> > > diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> > > index 50d7a3c5d301..517b2aa8c202 100644
> > > --- a/xen/common/coverage/llvm.c
> > > +++ b/xen/common/coverage/llvm.c
> > > @@ -44,12 +44,8 @@
> > >      ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
> > >  #endif
> > > 
> > > -#if __clang_major__ >= 4 || (__clang_major__ == 3 &&
> > > __clang_minor__ >= 9)
> > >  #define LLVM_PROFILE_VERSION    4
> > >  #define LLVM_PROFILE_NUM_KINDS  2
> > > -#else
> > > -#error "clang version not supported with coverage"
> > > -#endif
> > 
> > Rant: most of the LLVM coverage stuff is already kind of dead code, as
> > the format of the data changes between versions and there's no way for
> > LLVM to generate the blob itself using a builtin function or
> > similar.  We haven't kept up with new formats, and now it's not
> > possible to parse the output coverage data when using newish LLVM
> > versions.
> > 
> > Linux converts it's LLVM coverage data to gcov format (which AFAIK is
> > way more stable), and exports it in gcov format.  We should consider
> > importing that from Linux.
> > 
> > Thanks, Roger.
> 
> Fair point. Generally I found coverage reports generated using LLVM tooling
> a bit more informative than gcov's, but I don't know how much work would it
> be to adapt Xen for newer versions of LLVM.

It's a pain because they keep changing the blob format between
versions, so we would basically need code in Xen to be able to
generate the right blob for each possible clang version.

It would be helpful if clang provided the helpers to generate the
coverage data in a version agnostic way, but so far I haven't found a
way to do it.  I've raised a question with upstream LLVM project, but
no replies:

https://github.com/llvm/llvm-project/issues/123034

Regards, Roger.


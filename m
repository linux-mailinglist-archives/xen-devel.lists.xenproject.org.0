Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D94873CF9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689412.1074355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhumh-0006yu-1u; Wed, 06 Mar 2024 17:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689412.1074355; Wed, 06 Mar 2024 17:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhumg-0006wn-UU; Wed, 06 Mar 2024 17:10:26 +0000
Received: by outflank-mailman (input) for mailman id 689412;
 Wed, 06 Mar 2024 17:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xNx=KM=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rhumf-0006wT-UJ
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:10:25 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c400776-dbdc-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 18:10:25 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33d118a181fso4565998f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 09:10:25 -0800 (PST)
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
X-Inumbo-ID: 6c400776-dbdc-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709745025; x=1710349825; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OBT5bXPkoyKLfYbddxD+ROvxBpl2W6PqRGiln/kPZA=;
        b=NwVumK0/Qw8Hq6ldQfJBVNojI9QnOfjhiHLT4PEbIJnxWnmIuapRiBD7NIKrk4EQ7V
         33J+4fD1bcEPwF+4lrHhn2mw7UV3lOwBfdHs9YJpYv4EOwSwC17M2wpKpTMZwjGAFHwr
         5Gi+n5rw1FtDEHwzGhz/4hKnd1Aa4O3jGOutf9wuXv15DkBnh7ukA3KAHcw/i0EXsl9/
         M0b2NkHiIi+0mdq9906yTCTHIV/N2jLR2r3oikRe2nhtSECUjRd56j9NM34jnZxRvPct
         rnu47ivGIN4mcoCxZy1+uejeBKvvP05M9YyOINAY+qDw3KKWI5xlQmTRmtMidg/wcuBP
         x51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745025; x=1710349825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OBT5bXPkoyKLfYbddxD+ROvxBpl2W6PqRGiln/kPZA=;
        b=rnAZ5n+cL/kAvAMfusABYI3hyCbnF74iHtrzjWEYO05Fa8thZyaaY+mf9w+3I/xYsk
         LwCAHkiEFE7Sav5v3mT6ZjPSgvxPJ7ucIH+H95kBkjSMjf6MPtix+RAOI08XYsj/fn/2
         orrOhnGj/Pd5vMVOod/mWYkIMTcuGF1E5J0XJIdN90+vYJg+cVOLOWb9pP1czCGNq5cN
         CwTfjCC2lAXgf5O+Q45GWvEnSNsfQGQ9hfX2iYhm0b/yKf5lgNOVGGy5Y1EgSKguDWtU
         FgZ8mk/Og2bX+EC1RRyQjmCA0A3wqKjwxMCwnAOAykck4iQ/eohYrrh3YYjLN9s1yY+B
         38Hg==
X-Forwarded-Encrypted: i=1; AJvYcCV4hy7BnlzkKGJR5QM3jHKdg0VzBB0Eo7xs4sDDIaUsvkU7JqF97gDeF4SRCCTggQJrTZsse1IoEVcNS3BN8hkzpzvppjNLcpNx+7l7fOk=
X-Gm-Message-State: AOJu0Yz3kcPShIeHHfKzIgVLny7z84uSAFaf2NJ7q4AFkyQZ3P7sWMDA
	MxRBB8zo7YVJKQEzpOd5HNf7+jVatTKpKTKQM6mis9kObeGvRz2f6Bxm+ic8lCUAucQXn+WhKdy
	67lHesiXyyZjoZEearUrY1RyKEWc=
X-Google-Smtp-Source: AGHT+IHaHVgqaJ3Ya0z3ySAjTfGHID85e3oHDABmYYIqlhem3rnxGpjGokEsyeU7EVdhOrO/Ul5MOUMj1O2grGSJe8Q=
X-Received: by 2002:adf:f74d:0:b0:33e:cc6:a998 with SMTP id
 z13-20020adff74d000000b0033e0cc6a998mr10007258wrp.6.1709745024405; Wed, 06
 Mar 2024 09:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
 <20240305030516.41519-3-alexei.starovoitov@gmail.com> <Zeh7bTYotfaKoCVD@infradead.org>
In-Reply-To: <Zeh7bTYotfaKoCVD@infradead.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 6 Mar 2024 09:10:13 -0800
Message-ID: <CAADnVQ+-+LHbNgKv_MTOkM307BD0U2OfnjqAnKCL7wFiGuge9g@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/2] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
To: Christoph Hellwig <hch@infradead.org>
Cc: bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Barret Rhoden <brho@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, sstabellini@kernel.org, 
	Juergen Gross <jgross@suse.com>, linux-mm <linux-mm@kvack.org>, xen-devel@lists.xenproject.org, 
	Kernel Team <kernel-team@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 6:19=E2=80=AFAM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> I'd still prefer to hide the vm_area, but for now:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thank you.
I will think of a way to move get_vm_area() to mm/internal.h and
propose a plan by lsf/mm/bpf in May.


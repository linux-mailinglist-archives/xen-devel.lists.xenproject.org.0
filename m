Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66050987ABC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 23:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805898.1217140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stw90-0008NC-Th; Thu, 26 Sep 2024 21:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805898.1217140; Thu, 26 Sep 2024 21:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stw90-0008Ku-QE; Thu, 26 Sep 2024 21:35:26 +0000
Received: by outflank-mailman (input) for mailman id 805898;
 Thu, 26 Sep 2024 21:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R2vN=QY=gmail.com=miguel.ojeda.sandonis@srs-se1.protection.inumbo.net>)
 id 1stw8z-0008Kn-TK
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 21:35:25 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cfac669-7c4f-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 23:35:24 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2e0b467da03so91495a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 14:35:24 -0700 (PDT)
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
X-Inumbo-ID: 3cfac669-7c4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727386523; x=1727991323; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN3ZIl0AHdW2Pc3ccHhFRbQ1ihSm5IEdT9WChsNSY6k=;
        b=i6ARKOdHjLjOqQc/WymtfY3d9XwpG9RphVdk6QS2wtlrY356bqu7iADE/YX4m4yRr5
         lPoMKNWiP67QXOwK702nPutJlU7vrIm8mIO/gI/NwOiD53IgOYPccQJXcobjxkQnvN6q
         j+TmVP6qfjiZBP3nzwl+xogOo8P78tubuoUW3frQkkB/nz1SVCTApfQyYQ1y82GGNAEf
         gHssI/W9/9YSmb6inBJeBpRqGfxaj7OrhnhVn+6A+DhEQbL2gNR0mQejgc8YjYD/JWSp
         qeFT2ZBzvlCa3uDDSeNm9In0HnaM3/U5j4KsUQbO4GIlnIJWbuqcLmmK3mGtqTFUHA9y
         Gb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727386523; x=1727991323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN3ZIl0AHdW2Pc3ccHhFRbQ1ihSm5IEdT9WChsNSY6k=;
        b=JE2tVz9QDFxKLItKvADOCYXpW9IjqlmP1N6ALgs3mNkHHlmhzuZ+aDLDipc3wJNHRz
         1OboUUWHqAPc65/IOYavA860SyVAIe/Fsg9YFrb4Qpm2tmMbGvFlII2w2l1OoDhqShY7
         6TvwbvJEZm4Sxp2g6oUlX/0KtAfWkj9FYTmms4CpGm6Ht+XzTZL4lIpSJhMNOABB6Vrt
         kojih4oJm7bnIwlWaBftol625r/gn9UOWh1i6UPio5JEukf34BGN57znHZZwLSWxyFH6
         xnxWHSlSAFsNoChcS3+FzrcZFCjnqLHh51aap3lG8nPl6OMn//y0LZzgHc/SC9/Ofric
         w04Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhkzYWi4pvKRobZzwHBei5BHrHNhztZ38qBLUuFyXvC7AMLtsoYD+IB/57nTgbtGW+hiU5vAFWGOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLq5xfOXykkhb7TNteF3KXl6Ry6QLFiILGIpJS6rDm8Z7TKS3z
	9koQPd/codbM1zpOdwGHtdwZy3QFWxDoYoljPDluR6HXv9+SAPKecT/wBSPoWUkYMf+vyawHgF5
	w5o77t4oPVfL3gQIxwQudKBCpvCc=
X-Google-Smtp-Source: AGHT+IFP+qclc+DwNk0VcbiLZGtyseD1sfEmeyqBVla3e/ZDfuly9waYm3g7wRqfrKuy03nGqriwsOXLp8FvWSa4ibk=
X-Received: by 2002:a17:90b:3698:b0:2db:60b:eee with SMTP id
 98e67ed59e1d1-2e0b8ed348emr498104a91.9.1727386523117; Thu, 26 Sep 2024
 14:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-32-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-32-ardb+git@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 23:35:10 +0200
Message-ID: <CANiq72=z6A=50QO3V0S3Kgx6XQT93GxbB_LN6PFAQCmNgy370A@mail.gmail.com>
Subject: Re: [RFC PATCH 02/28] Documentation: Bump minimum GCC version to 8.1
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 5:10=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
>  Documentation/admin-guide/README.rst | 2 +-
>  Documentation/process/changes.rst    | 2 +-

This should update scripts/min-tool-version.sh too. With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

As Arnd says, the cleanups can be done afterwards.

Cheers,
Miguel


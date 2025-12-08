Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D67CAD546
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:49:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180605.1503764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbbb-00032j-K6; Mon, 08 Dec 2025 13:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180605.1503764; Mon, 08 Dec 2025 13:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbbb-000305-HN; Mon, 08 Dec 2025 13:48:47 +0000
Received: by outflank-mailman (input) for mailman id 1180605;
 Mon, 08 Dec 2025 13:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLQx=6O=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vSbbZ-0002zz-Kp
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:48:45 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9be8e685-d43c-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 14:48:43 +0100 (CET)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-78c4d112cd8so8909307b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:48:43 -0800 (PST)
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
X-Inumbo-ID: 9be8e685-d43c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765201722; x=1765806522; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4IRqgUE0hYGjyq/BNmNALrWR/diAhfUkpgLiI2YmPA=;
        b=hBv7GHXZ+582TH3OPBdrpboJbArJtxsorSWRj9E+LYaD+MgStSa8BBl1GQbQKHYZO4
         aylDpykDiTnsHs8j+FTiDCqEt153wLXF2eqhIpOeAvNFl+8nCp09DBWCJStl2JCWNxty
         HYUXmfvTZqt5ZYRmuBEBzOgqb6/Dvdyz+vYfKcXRF2XRoNL6e6iCH2SSAEA3b8zrprOO
         eyQH8PMCvEv/mFzq/+fGyCc4ZACcsGpRncoYD2OJ9XTiVvJldEoijTt8JR/BeOg9p8Ix
         jEdhHeAN7wL/ZwB3RmBmcoGCkxkxlSzrQAQhVG8+Ae6m3wf9z+YHqrOiaVCHljussKWW
         siqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765201722; x=1765806522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4IRqgUE0hYGjyq/BNmNALrWR/diAhfUkpgLiI2YmPA=;
        b=lVcK/zUtVQ50RpSZpibIVxfC1iNyV78b24cOKbXubUKq+EJ0goK4aAn8qeNVVboZIQ
         eYLEEF9zBhLtfizPgbid7dHhO/JojG0Lrkjz0ORW5XtzGbAu/kUFaJ/S53iDOkpwdTUC
         jbvJoLDB0VwvNdgooYjaWzlLta4BH8xiaV2TEOZghldv4/1IUiuWerI+6Ns1HU89vii/
         HUarzWNchMiF+zLzpr60NXHeE+qf+6TwxzQcS2cGPc8EzMqptpHV5jvfNihWt76tS+Dg
         dGkKELQ2Vmf0oLtAd9ZJpCWYpML5d5RXG9ebQ6wzvqdJeqHqbTS2AoKpO3RTyf5+YiEr
         YafA==
X-Forwarded-Encrypted: i=1; AJvYcCX4wgDtUyRetoEb12oB39L+dtlCk26Ygqk+acgoSukdVJpNLXgg1NSUjlbYA1xMYijLz61e50JRKYI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMXflB27rehOoZsFfqOeGuxeVbcg9Dd9EbUYCwnKsbsdvNxtza
	YG1M1a1kBbn5IDvcesOadbdt0U6nIRNrnJN6VaL/66yQpCtES7f7XLbgNTbPRWLrtUUOUkJIsyH
	lK16qo5E4hAzBK5PAueDMwLquiehFQ1o=
X-Gm-Gg: ASbGncuhZxlK53MkIz/d4oek32/s4t4RvnjJlUlITNJVmAburLAvQ/hRseyq5Npu4U1
	WfG99gaUCtvufew7+j6frwdEp5xBTkk1ul9pXLcZ8WV1fC4HFneOkOvVEuRSy4fSijUano5c+yl
	ZdOpdHR07joJdCEPqgXM0Q4nzKFDW3DutdKKVdSohJ7CBnl3fJKhETX4d60zxUeN6EzAMgsPDMv
	uZKnE2dl8zZ4PBDnkLDWCBOontAZCvzddzKck0WKEzk4aqqVuvZQQrgD7fdbhJytHM50XpkGnGk
	FeFxYw==
X-Google-Smtp-Source: AGHT+IFybKBPyX7SKsuLKXq5LIs8/ub0af9rwdGywJorXNc9R8YTPPP/WcbxQlsMntaUP/jD9ApDcQvwgnJNkUJS2Lg=
X-Received: by 2002:a05:690c:338c:b0:78a:77ca:b2b7 with SMTP id
 00721157ae682-78c33b5062dmr134836027b3.18.1765201722166; Mon, 08 Dec 2025
 05:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-3-frediano.ziglio@citrix.com> <4fb15575-cbfc-4842-b48b-4113fe658137@suse.com>
 <CAHt6W4e=7nCH=owhGEAjh+tjTo3j0KptW-y9WuDRYTDWsNyWEw@mail.gmail.com> <15416ebe-9bff-4930-bb23-166070fa8598@suse.com>
In-Reply-To: <15416ebe-9bff-4930-bb23-166070fa8598@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 8 Dec 2025 13:48:30 +0000
X-Gm-Features: AQt7F2rAny4hjBUzb8zEppnqAy3KHYWfu1x1LcgdhYkR1Xe_ALgvYPw5-yA6tiY
Message-ID: <CAHt6W4efr3V_hXKZkH6asjz2wiJfKK0XkRU+JLEW+aE5QgMXew@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Dec 2025 at 13:38, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 08.12.2025 14:31, Frediano Ziglio wrote:
> > On Mon, 8 Dec 2025 at 08:25, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 05.12.2025 17:09, Frediano Ziglio wrote:
> >>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>
> >>> For xen.gz file we strip all symbols and have an additional
> >>> xen-syms.efi file version with all symbols.
> >>> Make xen.efi more coherent stripping all symbols too.
> >>> xen-syms.efi can be used for debugging.
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>> ---
> >>> Changes since v1:
> >>> - avoid leaving target if some command fails.
> >>>
> >>> Changes since v2:
> >>> - do not convert type but retain PE format;
> >>> - use xen-syms.efi for new file name, more consistent with ELF.
> >>>
> >>> Changes since v3:
> >>> - update documentation;
> >>> - do not remove xen.efi.elf;
> >>> - check endbr instruction before generating final target.
> >>>
> >>> Changes since v4:
> >>> - simplify condition check;
> >>> - avoid reuse of $@.tmp file.
> >>>
> >>> Changes since v5:
> >>> - avoid creation of temporary file.
> >>>
> >>> Changes since v6:
> >>> - install xen-syms.efi;
> >>> - always strip xen.efi;
> >>> - restore EFI_LDFLAGS check during rule execution;
> >>> - update CHANGELOG.md;
> >>> - added xen-syms.efi to .gitignore.
> >>>
> >>> Changes since v7:
> >>> - move and improve CHANGELOG.md changes.
> >>>
> >>> Changes since v8:
> >>> - rebase on master;
> >>> - clean xen-syms.efi file.
> >>
> >> I.e. not addressing my prior, more fundamental comments.
> >
> >   In version 8 you commented that code should not double linking, and
> > the current version does not double link.
>
> That was the reply directly to you. There was also a reply to Marek's comments,
> as to extending the probing of the toolchain that we do to figure out how well
> the PE/COFF linking actually works.
>
> Jan

Surely it would be good to have, but it looks out of scope here, we
already agreed that the current build produces artifacts with issues
and we already agree that this change should be integrated to solve
such issues.

On checking linking one simple thing would be to check that objdump
has no complaints (like a line like "objdump -x xen.efi > /dev/null"
in the Makefile).
I have a patch that does not tweak and checks on the xen.efi file and
there was a similar code posted a while ago but that's surely out of
scope.

Frediano


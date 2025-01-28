Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D2A20D49
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 16:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878585.1288768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnkN-00036N-0D; Tue, 28 Jan 2025 15:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878585.1288768; Tue, 28 Jan 2025 15:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnkM-000348-TI; Tue, 28 Jan 2025 15:43:26 +0000
Received: by outflank-mailman (input) for mailman id 878585;
 Tue, 28 Jan 2025 15:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wG0=UU=paul-moore.com=paul@srs-se1.protection.inumbo.net>)
 id 1tcnkK-0002ae-Re
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 15:43:25 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a8e03d1-dd8e-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 16:43:22 +0100 (CET)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e39f43344c5so8249675276.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 07:43:22 -0800 (PST)
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
X-Inumbo-ID: 9a8e03d1-dd8e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738079001; x=1738683801; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
        b=VrVsTabigcT32TG4OyJwzU3eSuRJu20abiT4E3Tv0o44roLmLzypv6zUGULe1/TEow
         mfo3vmJVIZUqdjCJQxkhoGadf0nZC2V76pCmRCykz0qfzc8rXIcCKBJoMeSrlJuTrpY3
         mk0EE6mmCUTx2auEmXMm2F2Nnbot4+hIO0xzixw8efiNGgfXO2RmGCK2ZtsSW9UI6/dN
         qiq1fcXKqH9BRzFcaHjCaCPgpVQSOw8TVYToREbnr+V9lUj2gZtEt6Vkq2fWZ73phRbv
         bm76fvE1jsAzJP5MGHoiKaT24w2gzeLx2AjQuG1KUc8gSg0sIJWW8WSvMatX8a4/xzMm
         +XAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079001; x=1738683801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
        b=lrgHJfVr5D+PivwW35fCO4AeLRcpb+gXFVblfg23qX8yec0HWv3JdkINzpbFzsS42J
         LBVhOi6PPMPCXS6hvGIibsQmHekUbPaPEaXvUnpwZ5ROsgEtdVl0RrempuJtMdvQBE+x
         jLSftsJ8c4KkW61jvLgDiqoyVU3NxE3FN1rXxu4q6nBeoiU5LPx8HMYTEmK8bEOLIxeE
         o/TlfEsxgjLUWC92hnPjUPrr2hQlyNSerzYa3zZVMuCy1Rq1QgyYxtOJj4nMSwki2zjT
         hTU3fQUrncORpjG0Lr9bbz1Bvp49buS2bPj2GBl75OEORjpdo1D/HjiTBlUN/YBAc3SJ
         SAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC3UIjvXVlhd9dAg4zGncxpLXlEzW1KIVct3uKqPP+ofujkyr/WMbQLGZzYCQKVwlb9XtA7/o+16E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8zaHr8AKx3632ADXxyBlWrosDySIR6F2yAo2QewtCCERJpcIe
	lovA7VfU+zUWO4A/uqwxBjbj9KONDi4n1hRxJr894/WtOBwhM76X7YwHZMkwcyaVtyZveax4exI
	AEIrI8nbL7+GSHfzWt0nf+Xx9PQJIbDzlyDWO
X-Gm-Gg: ASbGncuzR+f/6JO+O8XoGicoGzxHVwmyvzBufdo5+vfPEf2aqsjI3gXvBO/ig1Ez6w5
	YhNx2PriZOs2fhMswyj4HCIjg5kCxTOyjK18K7WkPRx9HFIrZfOiIIbEhhi1mMVUoEUZh9/A=
X-Google-Smtp-Source: AGHT+IGuLqrmdoXiE8apV7tzhOJZ5Xm1OF/NxWm8Kjkh7RMoG05FR1MdO9WMx2ebniwyt0o5rEC0Jv+xP432BtVJDY0=
X-Received: by 2002:a05:690c:4d02:b0:6ef:6646:b50a with SMTP id
 00721157ae682-6f6eb6b2881mr361409457b3.20.1738079001445; Tue, 28 Jan 2025
 07:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com> <Z5epb86xkHQ3BLhp@casper.infradead.org> <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
In-Reply-To: <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Jan 2025 10:43:10 -0500
X-Gm-Features: AWEUYZkHRaUuCTQsu1U9C5jhigmIE9c2_8OmkE_i2Qv7ILXtAaTfDLC5EcLBZNk
Message-ID: <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, 
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, 
	Song Liu <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 6:22=E2=80=AFAM Joel Granados <joel.granados@kernel=
.org> wrote:
> On Mon, Jan 27, 2025 at 03:42:39PM +0000, Matthew Wilcox wrote:
> > On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> > > You could have static const within functions too. You get the rodata
> > > protection and function local scope, best of both worlds?
> >
> > timer_active is on the stack, so it can't be static const.
> >
> > Does this really need to be cc'd to such a wide distribution list?
> That is a very good question. I removed 160 people from the original
> e-mail and left the ones that where previously involved with this patch
> and left all the lists for good measure. But it seems I can reduce it
> even more.
>
> How about this: For these treewide efforts I just leave the people that
> are/were involved in the series and add two lists: linux-kernel and
> linux-hardening.
>
> Unless someone screams, I'll try this out on my next treewide.

I'm not screaming about it :) but anything that touches the LSM,
SELinux, or audit code (or matches the regex in MAINTAINERS) I would
prefer to see on the associated mailing list.

--=20
paul-moore.com


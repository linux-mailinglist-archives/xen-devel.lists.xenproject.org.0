Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0B587CC2E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693802.1082384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5a6-00056t-Dr; Fri, 15 Mar 2024 11:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693802.1082384; Fri, 15 Mar 2024 11:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5a6-00054G-Ab; Fri, 15 Mar 2024 11:18:34 +0000
Received: by outflank-mailman (input) for mailman id 693802;
 Fri, 15 Mar 2024 11:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A35=KV=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rl5I7-0000aQ-Mk
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:59 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c19788-e2bb-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:59:59 +0100 (CET)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5a4790ff899so234563eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:58 -0700 (PDT)
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
X-Inumbo-ID: 29c19788-e2bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710500397; x=1711105197; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jd9T79YYURQmVc9LQO/y4cA05WDxZJjl6Yw0m2Srx00=;
        b=dEXjQIaG6qdj4ot3JdDTp7kEzIuAvNQ512itNRSDdGJsNqb2LhVh+VBvg8z6LCt/qk
         R+j2pYnq5tFkHUcGVysEQMqr5vEvVPRmml3wYSC/iqTA+wiXcCbkCis6nJhnIP4idSnn
         HwH14LT+C4LUMZ2YpcgtvDZEg75780o/Msteo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500397; x=1711105197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jd9T79YYURQmVc9LQO/y4cA05WDxZJjl6Yw0m2Srx00=;
        b=iQRvyE3ueo5dgGNK0nPX+Di6hOP6Qv/56uSxMyTXBJB5LMDJuQp8ugK3wfA10mxXI1
         GXNghtVtiuB4UV7kfKHRwUw0XQgwV+ZhyKDLMLdgOQ1v4osda4tb3Zm3xsJ8gkJ3svyv
         WySyjENE0BpovHMK9BDrQVdTGDEw41h7sjpfPZpkEWxwXr0lYZ3GajCCn9ntzUAb0RLo
         ah0CgHUxUBTbqFwQS9QIS9RxxXv7VNWdl7at73sQ0WHrErXxxI8HL9kU0TZ2FWuYcskw
         Q02gvH8ecDqiqNjqklKs4/czmVTfh7E44axxbBrEZFXazWSXoHmJ7gTiM3mKyT6uq3fd
         OwYA==
X-Forwarded-Encrypted: i=1; AJvYcCXi4d2nLnBLS/sEio/NKx72vsxqj/l5mvOCdsQ+llpRlHTj06bqoyahFBu0GHJv4mQ5S0aVMfZxid69a0iWyV7wO7XkAukIbpFuyVE8Xxo=
X-Gm-Message-State: AOJu0YzWYgVDuqfZ1+PeMfbCgMgJ4ptKxW2PwX4p9/m7kYNBKz+wzOu7
	cqRNb7N0EJBZLAjeiSnyX0Nz6q9Azuf2wLGx5GdqBaLUR6Az7Nya7c6ZGUsZkOSzh9MjSmjSNKJ
	V6http83AQC7s8kBdGOEAPASxh+Pd7A9ik2rKV8rnwjoUNPDLh5Y=
X-Google-Smtp-Source: AGHT+IFmoLot8oumfNqwdoZw1nIoU6wewM4fjGNGBZHxxD232wRZspJQoBwBuKAmtDBf2hCLr7vUsKsxQcyAxtDcb6A=
X-Received: by 2002:a05:6871:340d:b0:222:6b21:3816 with SMTP id
 nh13-20020a056871340d00b002226b213816mr1627435oac.23.1710500397515; Fri, 15
 Mar 2024 03:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com> <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org> <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com>
In-Reply-To: <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 15 Mar 2024 10:59:46 +0000
Message-ID: <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, federico.serafini@bugseng.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org, 
	michal.orzel@amd.com, julien@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 6:54=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 01:21, Stefano Stabellini wrote:
> > On Mon, 11 Mar 2024, Julien Grall wrote:
> >> On 11/03/2024 11:32, George Dunlap wrote:
> >>> On Sat, Mar 9, 2024 at 1:59=E2=80=AFAM Stefano Stabellini
> >>> <sstabellini@kernel.org> wrote:
> >>>>
> >>>> I would like to resurrect this thread and ask other opinions.
> >>>>
> >>>>
> >>>> On Thu, 23 Nov 2023, Jan Beulich wrote:
> >>>>> On 22.11.2023 22:46, Stefano Stabellini wrote:
> >>>>>> Two out of three do_multicall definitions/declarations use uint32_=
t as
> >>>>>> type for the "nr_calls" parameters. Change the third one to be
> >>>>>> consistent with the other two.
> >>>>>>
> >>>>>> Link:
> >>>>>> https://lore.kernel.org/xen-devel/7e3abd4c0ef5127a07a60de1bf090a8a=
efac8e5c.1692717906.git.federico.serafini@bugseng.com/
> >>>>>> Link:
> >>>>>> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.230825150243=
0.6458@ubuntu-linux-20-04-desktop/
> >>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>>>>> ---
> >>>>>> Note that a previous discussion showed disagreement between
> >>>>>> maintainers
> >>>>>> on this topic. The source of disagreements are that we don't want =
to
> >>>>>> change a guest-visible ABI and we haven't properly documented how =
to
> >>>>>> use
> >>>>>> types for guest ABIs.
> >>>>>>
> >>>>>> As an example, fixed-width types have the advantage of being expli=
cit
> >>>>>> about their size but sometimes register-size types are required (e=
.g.
> >>>>>> unsigned long). The C specification says little about the size of
> >>>>>> unsigned long and today, and we even use unsigned int in guest ABI=
s
> >>>>>> without specifying the expected width of unsigned int on the vario=
us
> >>>>>> arches. As Jan pointed out, in Xen we assume sizeof(int) >=3D 4, b=
ut
> >>>>>> that's not written anywhere as far as I can tell.
> >>>>>>
> >>>>>> I think the appropriate solution would be to document properly our
> >>>>>> expectations of both fixed-width and non-fixed-width types, and ho=
w to
> >>>>>> use them for guest-visible ABIs.
> >>>>>>
> >>>>>> In this patch I used uint32_t for a couple of reasons:
> >>>>>> - until we have better documentation, I feel more confident in usi=
ng
> >>>>>>    explicitly-sized integers in guest-visible ABIs
> >>>>>
> >>>>> I disagree with this way of looking at it. Guests don't invoke thes=
e
> >>>>> functions directly, and our assembly code sitting in between alread=
y is
> >>>>> expected to (and does) guarantee that (in the case here) unsigned i=
nt
> >>>>> would be okay to use (as would be unsigned long, but at least on x8=
6
> >>>>> that's slightly less efficient), in line with what ./CODING_STYLE s=
ays.
> >>>>>
> >>>>> Otoh structure definitions in the public interface of course need t=
o
> >>>>> use fixed with types (and still doesn't properly do so in a few cas=
es).
> >>>
> >>> You didn't address the other argument, which was that all the other
> >>> definitions have uint32_t; in particular,
> >>> common/multicall.c:do_multicall() takes uint32_t.  Surely that should
> >>> match the non-compat definition in include/hypercall-defs.c?
> >>>
> >>> Whether they should both be `unsigned int` or `uint32_t` I don't
> >>> really feel like I have a good enough grasp of the situation to form =
a
> >>> strong opinion.
> >>
> >> FWIW +1. We at least need some consistency.
> >
> > Consistency is my top concern. Let's put the "unsigned int" vs
> > "uint32_t" argument aside.
> >
> > do_multicall is not consistent with itself. We need
> > hypercall-defs.c:do_multicall and multicall.c:do_multicall to match.
> >
> > Option1) We can change hypercall-defs.c:do_multicall to use uint32_t.
> >
> > Option2) Or we can change multicall.c:do_multicall to use unsigned int.
> >
> > I went with Option1. Andrew expressed his strong preference toward
> > Option1 in the past. George seems to prefer Option1.
> >
> > Jan, can you accept Option1 and move on?
>
> Counter question: Why do we have the opposite of what you all want stated
> in ./CODING_STYLE?

Indeed, that's what I wanted to ask at the committer's meeting on
Wednesday, but we ran out of time.

> Looking at the commit, it was actually George who ack-ed
> it. I can accept option 1 if ./CODING_STYLE is first changed / amended.

That change was added in 2019, but I certainly remember discussions
along these lines going on long before then.  Presumably there was a
long unwritten tradition of avoiding explicitly-sized types unless
necessary, and someone said, "that's not in the CODING_STYLE", and so
you added it.  Having the expectation written down is certainly worth
having, even if I don't personally care that much about it.

I will note that when I gave my Ack, I said that it probably wanted an
Ack from then ARM maintainers as well [1]; that doesn't seem to have
happened, so there's an argument that it was checked in improperly.

The coding style says, "Fixed width types should only be used when a
fixed width quantity is meant".  In the discussion on v2 of the patch,
I went through some uses of uint32_t, and regarding instances "Inside
headers for public interfaces", you said [2]:

> Here fixed width types are definitely the right choice.

It sounds like Andy and Stefano feel like this is a situation where "a
fixed width quantity is meant"; absent any further guidance from the
CODING_STYLE about when fixed widths should or should not be used, I
don't think this change would be a violation of CODING_STYLE.

 -George

[1] https://lore.kernel.org/xen-devel/0a8031c0-b668-eeb1-a9a2-659b52aaf98d@=
citrix.com/
[2] https://lore.kernel.org/xen-devel/72580391-d34e-aaf9-2e41-ab1df5967408@=
suse.com/


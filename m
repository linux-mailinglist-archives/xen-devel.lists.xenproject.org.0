Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7EF4E31ED
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 21:38:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293212.498037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWOmf-0005Ew-9W; Mon, 21 Mar 2022 20:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293212.498037; Mon, 21 Mar 2022 20:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWOmf-0005C1-5Z; Mon, 21 Mar 2022 20:37:45 +0000
Received: by outflank-mailman (input) for mailman id 293212;
 Mon, 21 Mar 2022 20:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XmvP=UA=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nWOmd-0005Bs-5L
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 20:37:43 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c10fa1fe-a956-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 21:37:42 +0100 (CET)
Received: by mail-oo1-xc36.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so20523732oos.9
 for <xen-devel@lists.xenproject.org>; Mon, 21 Mar 2022 13:37:42 -0700 (PDT)
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
X-Inumbo-ID: c10fa1fe-a956-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZVa7+ukVQ3gxnLwaLzGzoruMYL9hEreMELRJFbxTyco=;
        b=DU1XZiaRhgnJLNlFYCT5kqs27JaVCLGsQVjXAnr0+8b/fZdZnUsS5jgLORiMiJNQb0
         XBBAqC6VmzfUuIbNTVkTn/oMPQpb6mEx/a7LS0Vsi7x0Z30IwxhVJ7CWL1U1MgeBK9cb
         kM3stPKlE0nKdEacnFnM1lci8cH8d6+r01sHeArVuBVQFfM6p+MgDu0OD/P3zRmAa1mP
         9ypS0537sCP2BcjifYF08OrS5YINpStSAUf4tlD2Y3OWjygP6bkjJldrEMS8QhNc4xHz
         3GZnF2m1Eez/c0h1TO00oaU4MqFwWabJQ6MWGQcih2iDvNzpMXjJVW1IynqTF3ZptAe7
         aRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZVa7+ukVQ3gxnLwaLzGzoruMYL9hEreMELRJFbxTyco=;
        b=JB4v7b5T63mSD+x9y2butVzZmxIyYemifT4wyaqlPhB+1XDvU5dQ/0klJmr4CnmEOV
         13w0G7Z6SgJnb53ZS8tjrxHbLqB0LYpGMlzxnP8MJVh3vSiuTi4Js+0LC+yJlMYr4T9R
         zbP/wAPSZgo7XTldp+y1zdQEa6XvjX+LfqnZXGX5JMJs6b+DoapYIWYpbUxfNKkiBJL+
         4HWfre3bbf8crWoRQoloum1eXXEoVmVV8Vi2rYxLVQGKBGto2pGtlB9JaTnpa4W5SqgY
         RvHZSgQEZ+RW5Hv69FY6keyzWiZlKSKI/OBwocmhAW8TFGckYjomv+osd+P3It6jI6hP
         H9cw==
X-Gm-Message-State: AOAM5331zNbdIe37Jk2AxAr1lQNPbbhAtgPcW4+LzoM/tVvQ5yRd6tFX
	h18AHljLx/lyYA4HoRADS+EQIP7Iwt7IS/NYVYA=
X-Google-Smtp-Source: ABdhPJywKQMWwVgGwKlzy8HFA/o+mcfb0KDxn14VEf15/Uyn7chsDs3chgCmhffooMRwG1OZQ6NlnStE0PgDzPjwJ8c=
X-Received: by 2002:a05:6870:ea81:b0:db:3e68:7ae0 with SMTP id
 s1-20020a056870ea8100b000db3e687ae0mr382261oap.9.1647895060787; Mon, 21 Mar
 2022 13:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <84f15b2e1bef6c901bbdf29a07c7904cb365c0b2.1647879687.git.tamas.lengyel@intel.com>
 <90cf10b5-b0de-4589-f1a6-f8c392c924f1@suse.com>
In-Reply-To: <90cf10b5-b0de-4589-f1a6-f8c392c924f1@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 21 Mar 2022 16:37:29 -0400
Message-ID: <CABfawhncAqNFz+aCogYpshHWNR+-_nw8yLJrBjThii2LK1FaOQ@mail.gmail.com>
Subject: Re: [PATCH v3] x86/vmx: save guest non-register state in hvm_hw_cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000b9be2b05dac077df"

--000000000000b9be2b05dac077df
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022, 12:41 PM Jan Beulich <jbeulich@suse.com> wrote:

> On 21.03.2022 17:26, Tamas K Lengyel wrote:
> > During VM forking and resetting a failed vmentry has been observed due
> > to the guest non-register state going out-of-sync with the guest register
> > state. For example, a VM fork reset right after a STI instruction can
> trigger
> > the failed entry. This is due to the guest non-register state not being
> saved
> > from the parent VM, thus the reset operation only copies the register
> state.
> >
> > Fix this by including the guest non-register state in hvm_hw_cpu so that
> when
> > its copied from the parent VM the vCPU state remains in sync.
> >
> > SVM is not currently wired-in as VM forking is VMX only and saving
> non-register
> > state during normal save/restore/migration operation hasn't been needed.
> If
> > deemed necessary in the future it can be wired in by adding a
> svm-substructure
> > to hvm_hw_cpu.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

Thanks, will send v4 shortly, will need a couple fixes still.

Tamas

>

--000000000000b9be2b05dac077df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Mar 21, 2022, 12:41 PM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 21.03.2022 17:26, Tamas K Lengyel wrote:<br>
&gt; During VM forking and resetting a failed vmentry has been observed due=
<br>
&gt; to the guest non-register state going out-of-sync with the guest regis=
ter<br>
&gt; state. For example, a VM fork reset right after a STI instruction can =
trigger<br>
&gt; the failed entry. This is due to the guest non-register state not bein=
g saved<br>
&gt; from the parent VM, thus the reset operation only copies the register =
state.<br>
&gt; <br>
&gt; Fix this by including the guest non-register state in hvm_hw_cpu so th=
at when<br>
&gt; its copied from the parent VM the vCPU state remains in sync.<br>
&gt; <br>
&gt; SVM is not currently wired-in as VM forking is VMX only and saving non=
-register<br>
&gt; state during normal save/restore/migration operation hasn&#39;t been n=
eeded. If<br>
&gt; deemed necessary in the future it can be wired in by adding a svm-subs=
tructure<br>
&gt; to hvm_hw_cpu.<br>
&gt; <br>
&gt; Signed-off-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas.lengyel@int=
el.com" target=3D"_blank" rel=3D"noreferrer">tamas.lengyel@intel.com</a>&gt=
;<br>
<br>
Reviewed-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D=
"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks, will send v4 s=
hortly, will need a couple fixes still.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Tamas</div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"></blockquote></div></div></div>

--000000000000b9be2b05dac077df--


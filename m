Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523F765729
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571183.894435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2iZ-0002cl-Qs; Thu, 27 Jul 2023 15:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571183.894435; Thu, 27 Jul 2023 15:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2iZ-0002b0-N7; Thu, 27 Jul 2023 15:15:55 +0000
Received: by outflank-mailman (input) for mailman id 571183;
 Thu, 27 Jul 2023 15:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8wl5=DN=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qP2iY-0002au-Hd
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:15:54 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a355963-2c90-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:15:53 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe07f0636bso1923763e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 08:15:53 -0700 (PDT)
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
X-Inumbo-ID: 7a355963-2c90-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690470953; x=1691075753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=76hZ0dWC8yqIRQ+XjGC+2YGmrx6Bg16ia8/p1f6PXrY=;
        b=NUnz6bkT4rI+fWiCLYqkqlWVU68ltZqwVu8o/J16VF19aaEc1+DcLC8a5/oiksYoqD
         Q6HaRWNXfT65byTKid6lgZ25erEJnyf7r6zNfDpv5rmoUublAm9phw25Up6Ov6uCRwpu
         PqAiV+JGTPv0MP+ctIcJaWtxaNpqa9Vu1sMa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690470953; x=1691075753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76hZ0dWC8yqIRQ+XjGC+2YGmrx6Bg16ia8/p1f6PXrY=;
        b=gGlPFSkV94ZA9Smhq9UlJqOkzdmLcWL6ENevvmZvnuyQtowHOBiHbYF4IGfL4VXgWe
         cHQcogzHUFOvR6YGAHkci8vf3rviXZqghXsikj+ZgdxCYekXcZmptnoEJKQh7M62s9rb
         EII9Ked7nRDJBaIN1xRRTUeAFzBEcJad7CUE69dbL8m1AtngFZzevEwsoeH/PDLYdcpD
         wKiEkIGwtHg7QwZ0uoxn7uSw4gXfcFsNtxr9sE/As6T4vpi+VYnFLmOL7Yj7S8+PCcFM
         YCxhfhh4XtUxVtfFBJeVoI5K0v5DgFIz+1Iby6WhoqtwbmIIRULIHdQrC1lLAA/BpdoX
         IxgQ==
X-Gm-Message-State: ABy/qLb2L1v7yzXC08viae/Xu3PeOGsebheuA+IiYtBWcLTtC++0uPbG
	319p8HzRgeLMnHpuRPo3wR6E4lmYpqAdCLFAMDeygA==
X-Google-Smtp-Source: APBJJlF6I0xhvzADi2x4QJ86TlGc6kOwxcOf6Qa5jfKGw+2Jc3619ICU79H028gsAKFTBMb2WqAyMhcqE/BpTmgEgdQ=
X-Received: by 2002:a19:6d1d:0:b0:4f8:bfb4:e4c4 with SMTP id
 i29-20020a196d1d000000b004f8bfb4e4c4mr1637238lfc.19.1690470952800; Thu, 27
 Jul 2023 08:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
 <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com> <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com>
 <ca85fd2e-45a5-32c3-cb4b-1042be6c6915@suse.com> <32a22c57-1333-47b0-c61d-abff8d7df112@apertussolutions.com>
 <7ab3c4ae-3903-29de-ba32-d328b426d104@suse.com> <19bb355f-576c-b8d7-b6da-fa2dd8ff2228@apertussolutions.com>
 <63979074-42c3-83dd-cf0a-8f0cd0294a5d@suse.com>
In-Reply-To: <63979074-42c3-83dd-cf0a-8f0cd0294a5d@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 27 Jul 2023 16:15:41 +0100
Message-ID: <CA+zSX=ZFjWWnzx8vt3afywaiJiju1N5hNJqKzVkg956T-t-kwg@mail.gmail.com>
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org, 
	stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rich Persaud <persaur@gmail.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a52bd106017970aa"

--000000000000a52bd106017970aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 3:42=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 27.07.2023 15:26, Daniel P. Smith wrote:
> > Let's bring this back to the actual implementation instead of the
> > theoretical. Your position is that Xen's paddr_t is desired because it
> > can store larger values than that of size_t. Now if you look in Xen
> > proper (main 64bit code on x86), paddr_t is a typedef for a 64bit
> > unsigned integer. And if you look at size_t, it is also a typedef to a
> > 64bit unsigned integer, they are literally a couple of lines apart in
> > types.h. Thus they are the same size and can only represent the same
> > maximum size.
>
> What about 32-bit Arm, or any other 32-bit architecture that we might
> see Xen ported to, with wider than 32-bit physical address space?
>

To be more concrete here:

Suppose that you had a machine with 32-bit virtual address spaces (i.e.,
going up to 4GiB), and 36-bit physical address spaces (i.e., going up to
64GiB).  And suppose you had a system with 16GiB of physical ram.  And you
wanted to use Hyperlaunch to create VMs using some sort of memory image
that was 5GiB (presumably of some kind of static data, not, say, a kernel
or initramfs).  You wouldn't be able to do it if the "size" parameter of
the boot modules was limited to 4GiB (without some kind of hack where you
string multiple boot modules together).

I guess part of the question is whether we think that's an important use
case; on the whole if you're populating 5GiB of RAM, it seems like it would
be better to have the VM load it itself from disk.

I do see the logic behind wanting to avoid "paddr_t" for a size; I'm sure
Jan that you would nack any patch that used "size_t" as a memory address
(instead of, say, uintptr_t).  In that case, "psize_t" is the obvious
solution.

 -George

--000000000000a52bd106017970aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 27, 2023 at 3:42=E2=80=AF=
PM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 27.07.2023 15:26, Daniel P. Smith wrote:<br>
&gt; Let&#39;s bring this back to the actual implementation instead of the =
<br>
&gt; theoretical. Your position is that Xen&#39;s paddr_t is desired becaus=
e it <br>
&gt; can store larger values than that of size_t. Now if you look in Xen <b=
r>
&gt; proper (main 64bit code on x86), paddr_t is a typedef for a 64bit <br>
&gt; unsigned integer. And if you look at size_t, it is also a typedef to a=
 <br>
&gt; 64bit unsigned integer, they are literally a couple of lines apart in =
<br>
&gt; types.h. Thus they are the same size and can only represent the same <=
br>
&gt; maximum size.<br>
<br>
What about 32-bit Arm, or any other 32-bit architecture that we might<br>
see Xen ported to, with wider than 32-bit physical address space?<br></bloc=
kquote><div><br></div><div>To be more concrete here:</div><div><br></div><d=
iv>Suppose that you had a machine with 32-bit virtual address spaces (i.e.,=
 going up to 4GiB), and 36-bit physical address spaces (i.e., going up to 6=
4GiB).=C2=A0 And suppose you had a system with 16GiB of physical ram.=C2=A0=
 And you wanted to use Hyperlaunch to create=C2=A0VMs using some sort of me=
mory image that was 5GiB (presumably of some kind of static data, not, say,=
 a kernel or initramfs).=C2=A0 You wouldn&#39;t be able to do it if the &qu=
ot;size&quot; parameter of the boot modules was limited to 4GiB (without so=
me kind of hack where you string multiple boot modules together).</div><div=
><br></div><div>I guess part of the question is whether we think that&#39;s=
 an important use case; on the whole if you&#39;re populating 5GiB of RAM, =
it seems like it would be better to have the VM load it itself from disk.</=
div><div><br></div><div>I do see the logic behind wanting to avoid &quot;pa=
ddr_t&quot; for a size; I&#39;m sure Jan that you would nack any patch that=
 used &quot;size_t&quot; as a memory address (instead of, say, uintptr_t).=
=C2=A0 In that case, &quot;psize_t&quot; is the obvious solution.</div><div=
><br></div><div>=C2=A0-George</div></div></div>

--000000000000a52bd106017970aa--


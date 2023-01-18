Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882DA672005
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 15:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480717.745254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI9hd-0002fY-Hf; Wed, 18 Jan 2023 14:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480717.745254; Wed, 18 Jan 2023 14:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI9hd-0002do-Eu; Wed, 18 Jan 2023 14:46:13 +0000
Received: by outflank-mailman (input) for mailman id 480717;
 Wed, 18 Jan 2023 14:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVew=5P=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pI9hc-0002di-D2
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 14:46:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8bd9827-973e-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 15:46:10 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id kt14so24892289ejc.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jan 2023 06:46:10 -0800 (PST)
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
X-Inumbo-ID: d8bd9827-973e-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kv6Z+netYSSwHRMmwgIwtDxfzjTdUYqAafZvFP9orlw=;
        b=RPwIjXElJ3iwfHDjOm3wx5CniIhTiTZuBrU0X9nRhx8k2uDgnnsQ0d+RjhZdt2JVcP
         NNrE3cJS3K5U3aKnEGTsGuH3dJtFECYminungJYeeL8nl9KbdJcuTf+FuYqgBkZ3sfnA
         tfwbu5bfcJ/XfpVRBAW8q0zT+yGYwvV1l2bOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kv6Z+netYSSwHRMmwgIwtDxfzjTdUYqAafZvFP9orlw=;
        b=1u9tH/B6QQ5XGISiwc4mudPXZQS/yvRVjIW8+T8MZVQfmSKBcjXKj8a4yP5bin4jgL
         MC15MxndDCJYZG+VEKZ9jh2jcgF1lK+Z5oYoVWfhR7MzGbpJZEyIQvelehIhkNP+LRs2
         PaI1Y8VIm5S/5WG/rEzTwFMCybmNXbyFQ+V99ixKBGTI86MFb09XFL7PK+OaoM328cFU
         rRq9HMB52u/Hl1Yq7FC8j3QoaJ5zzTqtfmCGPZiZ09pft7Bl4gGkUmkwJVsTQyGCG9Av
         byoHmQMORvvxFxxINQx/moEqF3RR9uJtlUTtrD7qMibcHpXi9WgLaORYQaSsEwWMBaEX
         rABw==
X-Gm-Message-State: AFqh2koXVUaA+gVaqoDwJU9RFgJ4Oxq1JjZA1zaPtLDFYEN558VbL9tS
	OFXcrJ6NIwTnTs5Mo5Gzc/EDMk0Cu+J/YaViqhT13g==
X-Google-Smtp-Source: AMrXdXvLv8IldrZX4Gqk7vJIHOPHggMcbgORV6JS5ow8bBTjUr8oR1oKUPP5kFO8ANDP9Wmxvgoa6/EkQbxImzucJYs=
X-Received: by 2002:a17:907:9959:b0:83e:6a85:33d9 with SMTP id
 kl25-20020a170907995900b0083e6a8533d9mr970630ejc.704.1674053167551; Wed, 18
 Jan 2023 06:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com> <926307d3-a354-be87-3885-90681dc5ae24@suse.com>
 <37719b71-8405-eefd-3bf5-95c7c8639e82@amd.com> <7e9db781-47a8-719a-d9b1-88de9c503732@suse.com>
 <CA+zSX=a4hfFKGJfTM5BDenRo=T3kvEbkGhRs=7oh4GgOxDk0+Q@mail.gmail.com> <60628f62-c9fd-c29b-5c08-f3f746201f01@suse.com>
In-Reply-To: <60628f62-c9fd-c29b-5c08-f3f746201f01@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 18 Jan 2023 14:45:56 +0000
Message-ID: <CA+zSX=aAMEhqXYDF+LdyqDvnXxbUBrNZmjKcadQXpNn_vP_qfA@mail.gmail.com>
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size
To: Jan Beulich <jbeulich@suse.com>
Cc: Ayan Kumar Halder <ayankuma@amd.com>, sstabellini@kernel.org, stefano.stabellini@amd.com, 
	Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>, 
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>, julien@xen.org, Wei Xu <xuwei5@hisilicon.com>
Content-Type: multipart/alternative; boundary="0000000000006341c005f28ae05e"

--0000000000006341c005f28ae05e
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 1:58 PM Jan Beulich <jbeulich@suse.com> wrote:

> On 18.01.2023 14:34, George Dunlap wrote:
> > On Wed, Jan 18, 2023 at 1:15 PM Jan Beulich <jbeulich@suse.com> wrote:
> >
> >> On 18.01.2023 12:15, Ayan Kumar Halder wrote:
> >>> On 18/01/2023 08:40, Jan Beulich wrote:
> >>>> On 17.01.2023 18:43, Ayan Kumar Halder wrote:
> >>>>> @@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst
> >> uart_config[] =
> >>>>>   static int __init
> >>>>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int
> >> idx)
> >>>>>   {
> >>>>> -    u64 orig_base = uart->io_base;
> >>>>> +    paddr_t orig_base = uart->io_base;
> >>>>>       unsigned int b, d, f, nextf, i;
> >>>>>
> >>>>>       /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on
> >> bus 0. */
> >>>>> @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t
> >> skip_amt, unsigned int idx)
> >>>>>                       else
> >>>>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
> >>>>>
> >>>>> -                    uart->io_base = ((u64)bar_64 << 32) |
> >>>>> +                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
> >>>>>                                       (bar &
> >> PCI_BASE_ADDRESS_MEM_MASK);
> >>>>>                   }
> >>>> This looks wrong to me: You shouldn't blindly truncate to 32 bits. You
> >> need
> >>>> to refuse acting on 64-bit BARs with the upper address bits non-zero.
> >>>
> >>> Yes, I was treating this like others (where Xen does not detect for
> >>> truncation while getting the address/size from device-tree and
> >>> typecasting it to paddr_t).
> >>>
> >>> However in this case, as Xen is reading from PCI registers, so it needs
> >>> to check for truncation.
> >>>
> >>> I think the following change should do good.
> >>>
> >>> @@ -1180,6 +1180,7 @@ pci_uart_config(struct ns16550 *uart, bool_t
> >>> skip_amt, unsigned int idx)
> >>>                   unsigned int bar_idx = 0, port_idx = idx;
> >>>                   uint32_t bar, bar_64 = 0, len, len_64;
> >>>                   u64 size = 0;
> >>> +                uint64_t io_base = 0;
> >>>                   const struct ns16550_config_param *param =
> uart_param;
> >>>
> >>>                   nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
> >>> @@ -1260,8 +1261,11 @@ pci_uart_config(struct ns16550 *uart, bool_t
> >>> skip_amt, unsigned int idx)
> >>>                       else
> >>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
> >>>
> >>> -                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
> >>> +                    io_base = ((u64)bar_64 << 32) |
> >>>                                       (bar &
> PCI_BASE_ADDRESS_MEM_MASK);
> >>> +
> >>> +                    uart->io_base = (paddr_t) io_base;
> >>> +                    ASSERT(uart->io_base == io_base); /* Detect
> >>> truncation */
> >>>                   }
> >>>                   /* IO based */
> >>>                   else if ( !param->mmio && (bar &
> >>> PCI_BASE_ADDRESS_SPACE_IO) )
> >>
> >> An assertion can only ever check assumption on behavior elsewhere in
> Xen.
> >> Anything external needs handling properly, including in non-debug
> builds.
> >>
> >
> > Except in this case, it's detecting the result of the compiler cast just
> > above it, isn't it?
>
> Not really, no - it checks whether there was truncation, but the
> absence (or presence) thereof is still a property of the underlying
> system, not one in Xen.
>

Ah, gotcha.  Ayan, it might be helpful to take a look at the 'Handling
unexpected conditions' section of our CODING_STYLE [1] for a discussion of
when (and when not) to use ASSERT().

 -George

[1] https://github.com/xen-project/xen/blob/master/CODING_STYLE

--0000000000006341c005f28ae05e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 18, 2023 at 1:58 PM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 18.01.2=
023 14:34, George Dunlap wrote:<br>
&gt; On Wed, Jan 18, 2023 at 1:15 PM Jan Beulich &lt;<a href=3D"mailto:jbeu=
lich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 18.01.2023 12:15, Ayan Kumar Halder wrote:<br>
&gt;&gt;&gt; On 18/01/2023 08:40, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt; On 17.01.2023 18:43, Ayan Kumar Halder wrote:<br>
&gt;&gt;&gt;&gt;&gt; @@ -1166,7 +1166,7 @@ static const struct ns16550_conf=
ig __initconst<br>
&gt;&gt; uart_config[] =3D<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0static int __init<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0pci_uart_config(struct ns16550 *uart, bool=
_t skip_amt, unsigned int<br>
&gt;&gt; idx)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 u64 orig_base =3D uart-&gt;io_base;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 paddr_t orig_base =3D uart-&gt;io_base;=
<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int b, d, f, nextf,=
 i;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* NB. Start at bus 1 to avo=
id AMT: a plug-in card cannot be on<br>
&gt;&gt; bus 0. */<br>
&gt;&gt;&gt;&gt;&gt; @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *=
uart, bool_t<br>
&gt;&gt; skip_amt, unsigned int idx)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D len &amp; PCI_BASE_ADDRE=
SS_MEM_MASK;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uart-&gt;io_base =3D ((u64)bar_64 &lt;&lt; 32) |<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uart-&gt;io_base =3D (paddr_t) ((u64)bar_64 &lt;&lt; 32) =
|<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(bar &amp;<br>
&gt;&gt; PCI_BASE_ADDRESS_MEM_MASK);<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt; This looks wrong to me: You shouldn&#39;t blindly truncate=
 to 32 bits. You<br>
&gt;&gt; need<br>
&gt;&gt;&gt;&gt; to refuse acting on 64-bit BARs with the upper address bit=
s non-zero.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Yes, I was treating this like others (where Xen does not detec=
t for<br>
&gt;&gt;&gt; truncation while getting the address/size from device-tree and=
<br>
&gt;&gt;&gt; typecasting it to paddr_t).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; However in this case, as Xen is reading from PCI registers, so=
 it needs<br>
&gt;&gt;&gt; to check for truncation.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think the following change should do good.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; @@ -1180,6 +1180,7 @@ pci_uart_config(struct ns16550 *uart, bo=
ol_t<br>
&gt;&gt;&gt; skip_amt, unsigned int idx)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0unsigned int bar_idx =3D 0, port_idx =3D idx;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t bar, bar_64 =3D 0, len, len_64;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0u64 size =3D 0;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint6=
4_t io_base =3D 0;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const struct ns16550_config_param *param =3D uart_param;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0nextf =3D (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),<br>
&gt;&gt;&gt; @@ -1260,8 +1261,11 @@ pci_uart_config(struct ns16550 *uart, b=
ool_t<br>
&gt;&gt;&gt; skip_amt, unsigned int idx)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D len &amp; PCI_BASE_ADDRESS_MEM_M=
ASK;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uart-&gt;io_base =3D (paddr_t) ((u64)bar_64 &lt;&lt; 32) |<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 io_base =3D ((u64)bar_64 &lt;&lt; 32) |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(bar &amp; PCI_BASE_ADDRESS_MEM_MASK);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uart-&gt;io_base =3D (paddr_t) io_base;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ASSERT(uart-&gt;io_base =3D=3D io_base); /* Detect<br>
&gt;&gt;&gt; truncation */<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* IO based */<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0else if ( !param-&gt;mmio &amp;&amp; (bar &amp;<br>
&gt;&gt;&gt; PCI_BASE_ADDRESS_SPACE_IO) )<br>
&gt;&gt;<br>
&gt;&gt; An assertion can only ever check assumption on behavior elsewhere =
in Xen.<br>
&gt;&gt; Anything external needs handling properly, including in non-debug =
builds.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Except in this case, it&#39;s detecting the result of the compiler cas=
t just<br>
&gt; above it, isn&#39;t it?<br>
<br>
Not really, no - it checks whether there was truncation, but the<br>
absence (or presence) thereof is still a property of the underlying<br>
system, not one in Xen.<br></blockquote><div><br></div><div>Ah, gotcha.=C2=
=A0 Ayan, it might be helpful to take a look at the &#39;Handling unexpecte=
d conditions&#39; section of our CODING_STYLE [1] for a discussion of when =
(and when not) to use ASSERT().</div><div><br></div><div>=C2=A0-George</div=
><div><br></div><div>[1]=C2=A0<a href=3D"https://github.com/xen-project/xen=
/blob/master/CODING_STYLE">https://github.com/xen-project/xen/blob/master/C=
ODING_STYLE</a></div></div></div>

--0000000000006341c005f28ae05e--


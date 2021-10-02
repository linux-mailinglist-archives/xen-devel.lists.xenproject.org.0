Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C6B41FA50
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 09:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201056.355474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWZZ7-0003XE-IR; Sat, 02 Oct 2021 07:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201056.355474; Sat, 02 Oct 2021 07:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWZZ7-0003VJ-EU; Sat, 02 Oct 2021 07:36:13 +0000
Received: by outflank-mailman (input) for mailman id 201056;
 Sat, 02 Oct 2021 07:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLOl=OW=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mWZZ6-0003VD-Aa
 for xen-devel@lists.xenproject.org; Sat, 02 Oct 2021 07:36:12 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 536a1f1d-9bb5-4e73-a590-c3f50ae51405;
 Sat, 02 Oct 2021 07:36:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id s17so42205132edd.8
 for <xen-devel@lists.xenproject.org>; Sat, 02 Oct 2021 00:36:09 -0700 (PDT)
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
X-Inumbo-ID: 536a1f1d-9bb5-4e73-a590-c3f50ae51405
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O7ubnJ+U+MIePACuBV8RqRT2/S4lsdDFm7w1PbFmvTE=;
        b=LzKWw7uP4WimDNvuftM2YZ4G7ZOd6VhBJiSXX0WMIO/gdxor+/ZuM33GMWdFcMGrxO
         RjVFb59s4m065xBodECjwWVaH+D7j+kw+jVmSo+/Xu429AG7YoWHv6W6/PEurDS0M2Pa
         DUTQRSwLCLqTUbLSkGCMOyLyoPkDEP8dI4m905esSkJkurM1WBpBEZF4ehBrNj9qva5q
         jVZ03bZmC2IHuDfeeNv+IGa/PeA4tSCwIB7ybpvi39hzjTsg74Ofa12Qrf/7PP9RiN7A
         bZAm/PQkxg23kQPlB7xltGGD0re5eL9NpZctFhC1DxFc0XmMNOHjczjqO0CwK/r1xF4x
         c62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7ubnJ+U+MIePACuBV8RqRT2/S4lsdDFm7w1PbFmvTE=;
        b=EYF4EdqmLPwQN2+xBpSur8vdhu/3ZXTI4rFJaHkLZmGm4ZhblLDNF4L3f4yT+pGKS8
         Rvmbu7vHjw3+n5DaxVEwjdUjEfTJo8o5PnRxaRUOvuQ1UJtDW3ZDK7GcC769zz5Y9xML
         E+b4dY3OJQOn9YSrd1n3d+ecARwA2CVeqWiAWvEKxGFmWLc+mkcsUWKjEeRpaRsvuN2j
         plTgXK/qqCkBGC2z7Kn0XXWavNvdDpb9UIIkP5zqrjCCm1jhzeqmei+35Z7iTTZu3Ynb
         oN8Qm3bCk23IVGHGItArhTp245QwTAcA83/ymmdnLYFQXWZGERGF9MPfyHda10pYh/NL
         oNqw==
X-Gm-Message-State: AOAM533RIKV4twdYCQkJF5A558Iv++9FaXkaZRZk/xyK4YRnUlr2zw79
	wScz/Va7AMvPNrmGNnW9oFPk/zTGpHcTbDvPFsM=
X-Google-Smtp-Source: ABdhPJyutU+ibK0Cgqqz3JYUqYEET9/84iAEz6jJ8cWEkpAjRo53gCs5Ugw0FfYWsFrH6dFI6HxAJO+nC6Lne28RE4Q=
X-Received: by 2002:aa7:c2d3:: with SMTP id m19mr2444179edp.267.1633160168922;
 Sat, 02 Oct 2021 00:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-2-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2109301600060.3209@sstabellini-ThinkPad-T480s>
 <05b040b0-a069-47a1-1f5e-85be62fa35f3@suse.com> <bbbceae1-c382-5e48-0c6b-fbb23fc720f5@gmail.com>
 <alpine.DEB.2.21.2110011244000.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110011244000.3209@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 2 Oct 2021 09:35:54 +0200
Message-ID: <CAJ=z9a2bT4tMn2argJzePUMR2Ke4bmabj+j5QevvwpfnA9ST_w@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000bae1fc05cd59bbf6"

--000000000000bae1fc05cd59bbf6
Content-Type: text/plain; charset="UTF-8"

Hi

On Sat, 2 Oct 2021, 01:24 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> Bertrand, see comment on ID_AA64MMFR0_EL1 below, any ideas?
>
>
> On Fri, 1 Oct 2021, Oleksandr wrote:
> > On 01.10.21 10:50, Jan Beulich wrote:
> > > On 01.10.2021 01:00, Stefano Stabellini wrote:
> > > > On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
> > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > >
> > > > > We need to pass info about maximum supported guest address
> > > > > space size to the toolstack on Arm in order to properly
> > > > > calculate the base and size of the extended region (safe range)
> > > > > for the guest. The extended region is unused address space which
> > > > > could be safely used by domain for foreign/grant mappings on Arm.
> > > > > The extended region itself will be handled by the subsequents
> > > > > patch.
> > > > >
> > > > > Use p2m_ipa_bits variable on Arm, the x86 equivalent is
> > > > > hap_paddr_bits.
> > > > >
> > > > > As we change the size of structure bump the interface version.
> > > > >
> > > > > Suggested-by: Julien Grall <jgrall@amazon.com>
> > > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com
> >
> > > > > Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > I have to admit that I'm a little puzzled to see these R-b-s when ...
> > >
> > > > > Please note, that review comments for the RFC version [1] haven't
> been
> > > > > addressed yet.
> > > > > It is not forgotten, some clarification is needed. It will be
> addressed
> > > > > for the next version.
> > > > >
> > > > > [1]
> > > > >
> https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/
> > > ... Oleksandr makes clear this patch isn't really ready yet.
> >
> > Unfortunately, this is true. I am still waiting for the clarification [1]
>
> Although I was aware of comments to older versions, this is actually the
> first version of this patch that I reviewed with any level of details; I
> didn't read previous comments very closely. I tried to find any bugs or
> problems with it and I couldn't see any, so I gave my reviewed-by. I
> should have clarified that was meant for the ARM part as I don't have a
> full understanding of the implications of using hap_paddr_bits on x86
> for VM migration.


>
> But let me take this opportunity to say that although I think the
> hypercall is OK, I wish we didn't need this patch at all: it is
> problematic because it touches tools, x86 and ARM hypervisor code all
> together. It needs at least three acks/reviewed-by to get accepted: from
> an x86 maintainer, an arm maintainer and from a tools maintainer. I
> don't say this to criticize the patch acceptance process: this patch
> makes changes to an existing hypercall so it is only fair that it needs
> to go through extra levels of scrutiny. For the sake of simplicity and
> decoupling (reducing dependencies between patches and between
> components), I think it would be best to introduce an #define for the
> minimum value of gpaddr_bits and then move this patch at the end of the
> series; that way it becomes optional.


It depends what you mean by optional. Yes we can add hack to avoid the
hypercall... But the more scalable solution is the hypercall.

I am slightly concerned that if we don't push for the hypercall now, then
there will be no incentive to do it afterwards...

So I went through Andrew's e-mail to understand what's the request. I
understand that there are some problem with migration. But it doesn't look
like we need to solve them now. Instead,  AFAICT, his main ask for this
series is to switch to a domctl.

It seems the conversation is simply stuck on waiting for Andrew to provide
details on what would look like. Did we ping Andrew on IRC?

Unfortunately the minimum value
> is 32 (in practice I have never seen less than 40 but the architecture
> supports 32 as minimum).


>
> Actually, the info we are looking for is already exposed via
> ID_AA64MMFR0_EL1. ID_AA64MMFR0_EL1 can be read from a virtual machine,
> and Linux let userspace read it [1]. Regardless of this patch series, we
> should make sure that Xen exposes the right mm64.pa_range value to guest
> virtual machines. If that is done right, then you can just add support
> for reading ID_AA64MMFR0_EL1 in libxl/libxc and then we don't need any
> hypercall modifications changes.


From my understanding, from a VM PoV "pa_range" should represent the size
of the guest physical address space.

Today, it happens that every VM is using the same P2M size. However, I
would rather not make such assumption in the userspace.


> So, in theory we already have all the interfaces we need, but in
> practice they don't work: unfortunaly both Xen and Linux mark
> ID_AA64MMFR0_EL1 as FTR_HIDDEN in cpufeature.c so neither Linux from
> Xen, not userspace from Linux can actually read the real value :-/
> They always read zero.
>
> (Also I think we have an issue today with p2m_restrict_ipa_bits not
> updating the mm64.pa_range value. I think that it should be fixed.)


It looks like it. That should be handled in a separate patch though.


> Bertrand, do you have any ideas in regards to ID_AA64MMFR0_EL1?
>
> If not, maybe we could just go with
> #define MIN_GPADDR_BITS 32.


The toolstack would have to consider it as the "maximum" because it may not
be safe to expose anything above.

With 32, we are going to be limited in term of space we can find.

We could potentially use 40 bits as a minimum. Although it still feels a
bit of a hack to me given that the IOMMU may restrict it further and the
architecture can in theory support less.

Overall, I still strongly prefer the hypercall approach. If a common one is
difficult to achieve, then we can extend the domctl to create a domain to
provide the p2m_bits (in the same way as we deal for the GIC version) in an
arch specific way.

Cheers,


>
> [1]
> https://01.org/linuxgraphics/gfx-docs/drm/arm64/cpu-feature-registers.html
>

--000000000000bae1fc05cd59bbf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sat, 2 Oct 2021, 01:24 Stefano Stabellini, &lt;<a=
 href=3D"mailto:sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer=
">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Bertrand, see comment on ID_AA64MMFR0_EL1 below, any ideas?<br>
<br>
<br>
On Fri, 1 Oct 2021, Oleksandr wrote:<br>
&gt; On 01.10.21 10:50, Jan Beulich wrote:<br>
&gt; &gt; On 01.10.2021 01:00, Stefano Stabellini wrote:<br>
&gt; &gt; &gt; On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:<br>
&gt; &gt; &gt; &gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksa=
ndr_tyshchenko@epam.com" rel=3D"noreferrer noreferrer" target=3D"_blank">ol=
eksandr_tyshchenko@epam.com</a>&gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; We need to pass info about maximum supported guest addr=
ess<br>
&gt; &gt; &gt; &gt; space size to the toolstack on Arm in order to properly=
<br>
&gt; &gt; &gt; &gt; calculate the base and size of the extended region (saf=
e range)<br>
&gt; &gt; &gt; &gt; for the guest. The extended region is unused address sp=
ace which<br>
&gt; &gt; &gt; &gt; could be safely used by domain for foreign/grant mappin=
gs on Arm.<br>
&gt; &gt; &gt; &gt; The extended region itself will be handled by the subse=
quents<br>
&gt; &gt; &gt; &gt; patch.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Use p2m_ipa_bits variable on Arm, the x86 equivalent is=
<br>
&gt; &gt; &gt; &gt; hap_paddr_bits.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; As we change the size of structure bump the interface v=
ersion.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Suggested-by: Julien Grall &lt;<a href=3D"mailto:jgrall=
@amazon.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jgrall@amazon.=
com</a>&gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Oleksandr Tyshchenko &lt;<a href=3D"mail=
to:oleksandr_tyshchenko@epam.com" rel=3D"noreferrer noreferrer" target=3D"_=
blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Reviewed-by: Michal Orzel &lt;<a href=3D"mailto:michal.=
orzel@arm.com" rel=3D"noreferrer noreferrer" target=3D"_blank">michal.orzel=
@arm.com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabe=
llini@kernel.org" rel=3D"noreferrer noreferrer" target=3D"_blank">sstabelli=
ni@kernel.org</a>&gt;<br>
&gt; &gt; I have to admit that I&#39;m a little puzzled to see these R-b-s =
when ...<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; Please note, that review comments for the RFC version [=
1] haven&#39;t been<br>
&gt; &gt; &gt; &gt; addressed yet.<br>
&gt; &gt; &gt; &gt; It is not forgotten, some clarification is needed. It w=
ill be addressed<br>
&gt; &gt; &gt; &gt; for the next version.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; [1]<br>
&gt; &gt; &gt; &gt; <a href=3D"https://lore.kernel.org/xen-devel/973f5344-a=
a10-3ad6-ff02-ad5f358ad279@citrix.com/" rel=3D"noreferrer noreferrer norefe=
rrer" target=3D"_blank">https://lore.kernel.org/xen-devel/973f5344-aa10-3ad=
6-ff02-ad5f358ad279@citrix.com/</a><br>
&gt; &gt; ... Oleksandr makes clear this patch isn&#39;t really ready yet.<=
br>
&gt; <br>
&gt; Unfortunately, this is true. I am still waiting for the clarification =
[1]<br>
<br>
Although I was aware of comments to older versions, this is actually the<br=
>
first version of this patch that I reviewed with any level of details; I<br=
>
didn&#39;t read previous comments very closely. I tried to find any bugs or=
<br>
problems with it and I couldn&#39;t see any, so I gave my reviewed-by. I<br=
>
should have clarified that was meant for the ARM part as I don&#39;t have a=
<br>
full understanding of the implications of using hap_paddr_bits on x86<br>
for VM migration.</blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
But let me take this opportunity to say that although I think the<br>
hypercall is OK, I wish we didn&#39;t need this patch at all: it is<br>
problematic because it touches tools, x86 and ARM hypervisor code all<br>
together. It needs at least three acks/reviewed-by to get accepted: from<br=
>
an x86 maintainer, an arm maintainer and from a tools maintainer. I<br>
don&#39;t say this to criticize the patch acceptance process: this patch<br=
>
makes changes to an existing hypercall so it is only fair that it needs<br>
to go through extra levels of scrutiny. For the sake of simplicity and<br>
decoupling (reducing dependencies between patches and between<br>
components), I think it would be best to introduce an #define for the<br>
minimum value of gpaddr_bits and then move this patch at the end of the<br>
series; that way it becomes optional.</blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">It depends what you mean by optional. Yes =
we can add hack to avoid the hypercall... But the more scalable solution is=
 the hypercall.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I am sli=
ghtly concerned that if we don&#39;t push for the hypercall now, then there=
 will be no incentive to do it afterwards...</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">So I went through Andrew&#39;s e-mail to understand wh=
at&#39;s the request. I understand that there are some problem with migrati=
on. But it doesn&#39;t look like we need to solve them now. Instead,=C2=A0 =
AFAICT, his main ask for this series is to switch to a domctl.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">It seems the conversation is simply =
stuck on waiting for Andrew to provide details on what would look like. Did=
 we ping Andrew on IRC?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> Unfortunately th=
e minimum value<br>
is 32 (in practice I have never seen less than 40 but the architecture<br>
supports 32 as minimum).</blockquote></div></div><div dir=3D"auto"></div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
Actually, the info we are looking for is already exposed via<br>
ID_AA64MMFR0_EL1. ID_AA64MMFR0_EL1 can be read from a virtual machine,<br>
and Linux let userspace read it [1]. Regardless of this patch series, we<br=
>
should make sure that Xen exposes the right mm64.pa_range value to guest<br=
>
virtual machines. If that is done right, then you can just add support<br>
for reading ID_AA64MMFR0_EL1 in libxl/libxc and then we don&#39;t need any<=
br>
hypercall modifications changes.</blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">From my understanding, from a VM PoV &quot;pa_r=
ange&quot; should represent the size of the guest physical address space.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Today, it happens that ev=
ery VM is using the same P2M size. However, I would rather not make such as=
sumption in the userspace.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
So, in theory we already have all the interfaces we need, but in<br>
practice they don&#39;t work: unfortunaly both Xen and Linux mark<br>
ID_AA64MMFR0_EL1 as FTR_HIDDEN in cpufeature.c so neither Linux from<br>
Xen, not userspace from Linux can actually read the real value :-/<br>
They always read zero.<br>
<br>
(Also I think we have an issue today with p2m_restrict_ipa_bits not<br>
updating the mm64.pa_range value. I think that it should be fixed.)</blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It looks lik=
e it. That should be handled in a separate patch though.</div><div dir=3D"a=
uto"></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Bertrand, do you have any ideas in regards to ID_AA64MMFR0_EL1?<br>
<br>
If not, maybe we could just go with<br>
#define MIN_GPADDR_BITS 32.</blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">The toolstack would have to consider it as the &quot=
;maximum&quot; because it may not be safe to expose anything above.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">With 32, we are going to be lim=
ited in term of space we can find.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">We could potentially use 40 bits as a minimum. Although it still=
 feels a bit of a hack to me given that the IOMMU may restrict it further a=
nd the architecture can in theory support less.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Overall, I still strongly prefer the hypercall appr=
oach. If a common one is difficult to achieve, then we can extend the domct=
l to create a domain to provide the p2m_bits (in the same way as we deal fo=
r the GIC version) in an arch specific way.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
<br>
[1] <a href=3D"https://01.org/linuxgraphics/gfx-docs/drm/arm64/cpu-feature-=
registers.html" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">=
https://01.org/linuxgraphics/gfx-docs/drm/arm64/cpu-feature-registers.html<=
/a><br>
</blockquote></div></div></div>

--000000000000bae1fc05cd59bbf6--


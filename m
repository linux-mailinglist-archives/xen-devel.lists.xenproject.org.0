Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB507360BBC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111269.212805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2tl-0008FV-TI; Thu, 15 Apr 2021 14:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111269.212805; Thu, 15 Apr 2021 14:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2tl-0008F5-PT; Thu, 15 Apr 2021 14:23:13 +0000
Received: by outflank-mailman (input) for mailman id 111269;
 Thu, 15 Apr 2021 14:23:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRZF=JM=edu.unito.it=giuseppe.eletto@srs-us1.protection.inumbo.net>)
 id 1lX2tj-0008DP-Gh
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:23:12 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34b13bb7-bd72-43f1-90ca-058c8960a5cd;
 Thu, 15 Apr 2021 14:23:08 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id w8so31022436lfr.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Apr 2021 07:23:08 -0700 (PDT)
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
X-Inumbo-ID: 34b13bb7-bd72-43f1-90ca-058c8960a5cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edu.unito.it; s=edugoogle;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z0ZvhMxQ5AxilYloOQntOhFVKwyvNhhQ1tS5K+D4F0A=;
        b=Go9FiogcWjc/ReFrPzeUL9+l1xpfzjOKSyhQrhkcI5dkmPYU3DCRKXnv/MQ+7ZGKQy
         vuJHi5ddG6Np9jhKHr7ph2RXgRtllkBvWIapJfbb54iromcUaQC/0Xzzu3ZyGh3dfc3Q
         gsOZnwwiudChPWj9/9anjxKeMdjSqpPK3Gxd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0ZvhMxQ5AxilYloOQntOhFVKwyvNhhQ1tS5K+D4F0A=;
        b=PrtabqM0/JHO9AT5EX60x8dHFBxeDYFXvIK7USIaspvG+aNiekPJvusfw3ZhpofRXv
         vBCLPQPqtCxHdeWOHM0yB9RNlOzdtloPuPwD366O9UWz0OEFvyf8ofL9sw1K2OBKHKAA
         7VPTP4zmejvfediD79X2VRRz0d3zR2eItnOhhZzSmi+vIxtYnssEoJv7MgHE80UqRcOz
         gNT0Oy3nVUkJU7SDvLd7sTzElF7nmlE6IYboXjFb+1nOELNHlVUg6rwbW1hM6k6C/cfI
         nAcqCuX/PsQ0Db23f+Yair+7SrYG7nJwq209alMkdtewGMkGAaI/0CLaMgGrlNTQiuYx
         KLug==
X-Gm-Message-State: AOAM53164YvCjJXM53lRaly9O5rOObp8pNuMGtbX3bpvxytC8PIO5JTk
	tT7q9XV19P1PvWsgVLhKlM4Md5xtr3oseIjfPPdjeL1d3pHw2hgBk69wid5TRwXo35gUSY7LUCP
	Eel6cXbUgns3pyA8O9vxZ0V95AyhIu4SmGr7z
X-Google-Smtp-Source: ABdhPJwZDmkgbf/X3L18Zed483uV4EvC/L/YkfRpHI49oSOVA4yNF3lGy256ROaJuKV7hQwz+yLSXfQaDWpspHUj73o=
X-Received: by 2002:ac2:55ba:: with SMTP id y26mr2668880lfg.590.1618496587259;
 Thu, 15 Apr 2021 07:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
 <8b43ae47-9d7e-a95c-4573-852d09f99662@gmail.com>
In-Reply-To: <8b43ae47-9d7e-a95c-4573-852d09f99662@gmail.com>
From: Giuseppe Eletto <giuseppe.eletto@edu.unito.it>
Date: Thu, 15 Apr 2021 16:22:30 +0200
Message-ID: <CALTQNB7-cj8x1y5Xy_xJf-wYfQVFsYZkqwCmM-MAHt19Gy-9xQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_A_KernelShark_plugin_for_Xen_traces_analysis_=E2=80=8B?=
To: "Yordan Karadzhov (VMware)" <y.karadz@gmail.com>, xen-devel@lists.xenproject.org, 
	linux-trace-devel@vger.kernel.org
Cc: Dario Faggioli <dfaggioli@suse.com>, Enrico Bini <enrico.bini@unito.it>
Content-Type: multipart/alternative; boundary="0000000000002779b605c0039afe"

--0000000000002779b605c0039afe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

As Dario already said, the plugin seems to work well with all the traces we
fed to it.
The largest trace was nearly 500MB, but still it had no trouble showing it.

The only minor troubles I encountered writing the plugin is with the
different data
types between KShark and XenTrace: for example regarding the "event_id"
field of
the "struct kshark_entry" structure which in KShark has type "int16_t"
while XenTrace
has events of the type "uint32_t" at 28 bits.
But since there are functions like "get_event_id" these differences can be
bypassed without seemingly creating problems.

So yes, the plugin is still a prototype. The main purpose so far was to
create
something that works: in fact, as mr. @Andrew_Cooper pointed out, the
couple
"dom:vcpu" is still displayed as a HEX number without any kind of
formatting.
This is because at the moment I have copied the same formatting as the
"xentrace_format" tool.
So a future plan for updating this plugin could be to improve its output.

As for the tutorial, I wouldn't mind trying, but right now I'm busy writing
the thesis for the graduation...

Kind regards,
Giuseppe Eletto.

Il giorno mer 14 apr 2021 alle ore 11:26 Yordan Karadzhov (VMware) <
y.karadz@gmail.com> ha scritto:

> Hi Giuseppe,
>
> It is great to see such progress in the development of the Xen plugin.
>
> Can you share with us what are your plans for continuing this work. Is
> this a first prototype of the plugin, or it is an almost final version?
>
> I was also thinking that maybe you can prepare a short tutorial on
> writing KernelShark plugins for data inputs. You have the best
> experience for this task, since you are the first to develop an external
> plugin. Ideally, this can even turn into a talk that you can give at
> some open source event.
> What do you think?
>
> Best,
> Yordan
>
>
> On 13.04.21 =D0=B3. 17:28, Giuseppe Eletto wrote:
> > Hello,
> > I want to share with you a new plugin developed by me, under the
> > supervision of Dario Faggioli, which allows the new version of
> KernelShark
> > (the v2-beta) to open and view the Xen traces created using the
> "xentrace" tool.
> >
> > In fact, KernelShark is a well known tool for graphical visualization
> > Linux kernel traces, obtained via "ftrace" and "trace-cmd". Anyway than=
ks
> > to its modular architecture, it is now possible to implement plugins
> which
> > open and display traces with arbitrary format, for example, as in in
> > this case, traces of the Xen hypervisor.
> >
> > For more information on how to build the plugin and/or
> > to view the source code I leave the repository below:
> > https://github.com/giuseppe998e/kernelshark-xentrace-plugin
> >
> >
> > In short:
> >
> > $ sudo apt install git build-essential libjson-c-dev
> > $ git clone --recurse-submodules
> > https://github.com/giuseppe998e/kernelshark-xentrace-plugin.git
> > $ cd kernelshark-xentrace-plugin/
> > $ make
> >
> > $ export XEN_CPUHZ=3D3G # Sets the CPU frequency ((G)hz/(M)hz/(K)hz/hz)
> > $ kernelshark -p out/ks-xentrace.so trace.xen
> >
> >
> > You will need the development version of KernelShark, available here:
> > https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git
> >
> > A screenshot of the plugin in action is available here:
> >
> https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/.g=
ithub/img/ks-xentrace.png
> >
> > I'm happy to receive whatever feedback you may have about it,
> > and to answer any question.
> >
> > Kind regards,
> > Giuseppe Eletto.
> >
>

--=20
------------------------



Indirizzo istituzionale di posta elettronica=20
degli studenti e dei laureati dell'Universit=C3=A0 degli Studi di TorinoOff=
icial=C2=A0
University of Turin=C2=A0email address=C2=A0for students and graduates=C2=
=A0

--0000000000002779b605c0039afe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br></div><div>As Dario already said, the plug=
in seems to work well with all the traces we fed to it.<br></div><div>The l=
argest trace was nearly 500MB, but still it had no trouble showing it.</div=
><div><br></div><div>The only minor troubles I encountered writing the plug=
in is with the different data</div><div> types between KShark and XenTrace:=
 for example regarding the &quot;event_id&quot; field of</div><div> the &qu=
ot;struct kshark_entry&quot; structure which in KShark has type &quot;int16=
_t&quot; while XenTrace</div><div>has events of the type &quot;uint32_t&quo=
t; at 28 bits.</div><div><span class=3D"gmail-VIiyi" lang=3D"en"><span clas=
s=3D"gmail-JLqJ4b gmail-ChMk0b"><span>But since there are functions like &q=
uot;get_event_id&quot; these differences can be</span></span></span></div><=
div><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gma=
il-ChMk0b"><span>bypassed without seemingly creating problems.</span></span=
></span></div><div><br></div><div>So yes, the plugin is still a prototype. =
The main purpose so far was to create</div><div>something that works: in fa=
ct, as mr. @Andrew_Cooper pointed out, the couple <br></div><div>&quot;dom:=
vcpu&quot; is still displayed as a HEX number without any kind of formattin=
g.</div><div>This is because at the moment I have copied the same formattin=
g as the</div><div>&quot;xentrace_format&quot; tool.</div><div>So a future =
plan for updating this plugin could be to improve its output.</div><div><br=
></div><div>As for the tutorial, I wouldn&#39;t mind trying, but right now =
I&#39;m busy writing the thesis for the graduation...</div><br> Kind regard=
s,<br>Giuseppe Eletto.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Il giorno mer 14 apr 2021 alle ore 11:26 Yordan Karadzh=
ov (VMware) &lt;<a href=3D"mailto:y.karadz@gmail.com">y.karadz@gmail.com</a=
>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Giuseppe,<br>
<br>
It is great to see such progress in the development of the Xen plugin.<br>
<br>
Can you share with us what are your plans for continuing this work. Is <br>
this a first prototype of the plugin, or it is an almost final version?<br>
<br>
I was also thinking that maybe you can prepare a short tutorial on <br>
writing KernelShark plugins for data inputs. You have the best <br>
experience for this task, since you are the first to develop an external <b=
r>
plugin. Ideally, this can even turn into a talk that you can give at <br>
some open source event.<br>
What do you think?<br>
<br>
Best,<br>
Yordan<br>
<br>
<br>
On 13.04.21 =D0=B3. 17:28, Giuseppe Eletto wrote:<br>
&gt; Hello,<br>
&gt; I want to share with you a new plugin developed by me, under the<br>
&gt; supervision of Dario Faggioli, which allows the new version of KernelS=
hark<br>
&gt; (the v2-beta) to open and view the Xen traces created using the &quot;=
xentrace&quot; tool.<br>
&gt; <br>
&gt; In fact, KernelShark is a well known tool for graphical visualization<=
br>
&gt; Linux kernel traces, obtained via &quot;ftrace&quot; and &quot;trace-c=
md&quot;. Anyway thanks<br>
&gt; to its modular architecture, it is now possible to implement plugins w=
hich<br>
&gt; open and display traces with arbitrary format, for example, as in in<b=
r>
&gt; this case, traces of the Xen hypervisor.<br>
&gt; <br>
&gt; For more information on how to build the plugin and/or<br>
&gt; to view the source code I leave the repository below:<br>
&gt; <a href=3D"https://github.com/giuseppe998e/kernelshark-xentrace-plugin=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/giuseppe998e/kern=
elshark-xentrace-plugin</a><br>
&gt; <br>
&gt; <br>
&gt; In short:<br>
&gt; <br>
&gt; $ sudo apt install git build-essential libjson-c-dev<br>
&gt; $ git clone --recurse-submodules<br>
&gt; <a href=3D"https://github.com/giuseppe998e/kernelshark-xentrace-plugin=
.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/giuseppe998e/=
kernelshark-xentrace-plugin.git</a><br>
&gt; $ cd kernelshark-xentrace-plugin/<br>
&gt; $ make<br>
&gt; <br>
&gt; $ export XEN_CPUHZ=3D3G # Sets the CPU frequency ((G)hz/(M)hz/(K)hz/hz=
)<br>
&gt; $ kernelshark -p out/ks-xentrace.so trace.xen<br>
&gt; <br>
&gt; <br>
&gt; You will need the development version of KernelShark, available here:<=
br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark=
.git" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/u=
tils/trace-cmd/kernel-shark.git</a><br>
&gt; <br>
&gt; A screenshot of the plugin in action is available here:<br>
&gt; <a href=3D"https://github.com/giuseppe998e/kernelshark-xentrace-plugin=
/raw/master/.github/img/ks-xentrace.png" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/.=
github/img/ks-xentrace.png</a><br>
&gt; <br>
&gt; I&#39;m happy to receive whatever feedback you may have about it,<br>
&gt; and to answer any question.<br>
&gt; <br>
&gt; Kind regards,<br>
&gt; Giuseppe Eletto.<br>
&gt; <br>
</blockquote></div></div>

<br>
<div style=3D"font-size:1.3em">------------------------</div><span style=3D=
"font-size:small"><div><img src=3D"http://www.unito.it/sites/default/files/=
logounito.png"></div><div><span style=3D"font-size:small"><br></span></div>=
Indirizzo istituzionale di posta elettronica degli studenti e dei laureati =
dell&#39;Universit=C3=A0 degli Studi di Torino</span><div><font size=3D"2">=
Official=C2=A0University of Turin=C2=A0email address=C2=A0for students and =
graduates=C2=A0</font></div>
--0000000000002779b605c0039afe--


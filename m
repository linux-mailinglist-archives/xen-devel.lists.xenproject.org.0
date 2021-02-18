Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1723831E551
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 06:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86484.162424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCbkt-0004FS-8q; Thu, 18 Feb 2021 05:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86484.162424; Thu, 18 Feb 2021 05:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCbkt-0004F5-5i; Thu, 18 Feb 2021 05:21:35 +0000
Received: by outflank-mailman (input) for mailman id 86484;
 Thu, 18 Feb 2021 05:21:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0cV5=HU=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lCbkr-0004Ey-Ki
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 05:21:34 +0000
Received: from mail-qv1-xf33.google.com (unknown [2607:f8b0:4864:20::f33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f57f9047-4b19-4c3d-8dcf-675fab17a18f;
 Thu, 18 Feb 2021 05:21:32 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id a1so401858qvd.13
 for <xen-devel@lists.xenproject.org>; Wed, 17 Feb 2021 21:21:32 -0800 (PST)
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
X-Inumbo-ID: f57f9047-4b19-4c3d-8dcf-675fab17a18f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1aGb/J92Mb3UQqgHwhGKXT1nP4FiVjOT1qjd79sU3k4=;
        b=Pp1+Mt82q6+hCnorlaQaoh/Us1KLXpzFpd5sfB1DAqqSkNuDbNe5YM7A4iyVZm0dn/
         nYFnxG1J7kiwI4wxJ/+KPSol6Nytn9gLNdpB/9h9qhk8X4yfMSaFLpSuiz/bGzmXNpMN
         K2eYP999AMzmFDkYOTMlSnlumLXtGM0CygPDQfoKcMVzqiSEmz93OptpDBuBgVxp3cMx
         NiNp06Np5JdL6Od/AqDQrIH+eJ+7x7k3+i9jmcFnpLtjQ2n6rAUd9Y6IY+aXkV2tcy/w
         qKkHcVoDHGUfdncujo1IlwBRsTJGdopsY4tS1VOgtKycMt/mKp3VkQmuxEU/cOoA1eCz
         5m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1aGb/J92Mb3UQqgHwhGKXT1nP4FiVjOT1qjd79sU3k4=;
        b=shEb7toKHTZwVuZc5apAlgcT0jWFSjP5EDqvSaqXtJkqPU7zjcGcUaKc/pzJlcs2d0
         Cn+m5kUUKTkQ75nYaUPYOYzmua5onMirTy0sFtI/R50afOIlEuQNpBLcUhvwAoy9rGy8
         RKp/35oSIR/z9ZGQF1+FlmY/IkxK+25LyDbyqWQMZT86lmpu7UMsJmpno+WGumiawA5b
         eF71o9SOeOcoNNKh8UYC8i22bHBKfZWHoB9OF9km5XgxCOw3Cwxp/Ltc5GqmbYKQwVVt
         B+Deu2x5cg2VFmNiav3CT+BEe36kpav+rdb0hli3SbHv638s/nU5Q5VYok3soclxsgqD
         0h3A==
X-Gm-Message-State: AOAM531xN+4hv3XKgbA99VmKpum2LRew1wkWssJNfsTt/gxKuitjIr0k
	bqzNDFQx4/XYED56dICOjsrfnQgZ3Lg2SNJ1W5MpUA==
X-Google-Smtp-Source: ABdhPJw8B0Ch3knZDj5DCyDYJolQTNPl2596yRXZJe5rbaeDsacvV/YoEug1L9bakztRYWQmSqyjLCmo0CTSCxRZR0c=
X-Received: by 2002:a0c:fa90:: with SMTP id o16mr2677614qvn.55.1613625692210;
 Wed, 17 Feb 2021 21:21:32 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com> <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
In-Reply-To: <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 17 Feb 2021 21:21:21 -0800
Message-ID: <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000002f50b305bb95827a"

--0000000000002f50b305bb95827a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 12:29 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wr=
ote:

> On 17.02.21 09:12, Roman Shaposhnik wrote:
> > Hi J=C3=BCrgen, thanks for taking a look at this. A few comments below:
> >
> > On Tue, Feb 16, 2021 at 10:47 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com=
> wrote:
> >>
> >> On 16.02.21 21:34, Stefano Stabellini wrote:
> >>> + x86 maintainers
> >>>
> >>> It looks like the tlbflush is getting stuck?
> >>
> >> I have seen this case multiple times on customer systems now, but
> >> reproducing it reliably seems to be very hard.
> >
> > It is reliably reproducible under my workload but it take a long time
> > (~3 days of the workload running in the lab).
>
> This is by far the best reproduction rate I have seen up to now.
>
> The next best reproducer seems to be a huge installation with several
> hundred hosts and thousands of VMs with about 1 crash each week.
>
> >
> >> I suspected fifo events to be blamed, but just yesterday I've been
> >> informed of another case with fifo events disabled in the guest.
> >>
> >> One common pattern seems to be that up to now I have seen this effect
> >> only on systems with Intel Gold cpus. Can it be confirmed to be true
> >> in this case, too?
> >
> > I am pretty sure mine isn't -- I can get you full CPU specs if that's
> useful.
>
> Just the output of "grep model /proc/cpuinfo" should be enough.
>

processor : 3
vendor_id : GenuineIntel
cpu family : 6
model : 77
model name : Intel(R) Atom(TM) CPU  C2550  @ 2.40GHz
stepping : 8
microcode : 0x12d
cpu MHz : 1200.070
cache size : 1024 KB
physical id : 0
siblings : 4
core id : 3
cpu cores : 4
apicid : 6
initial apicid : 6
fpu : yes
fpu_exception : yes
cpuid level : 11
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm
constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc
cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16
xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_timer aes rdrand lahf_lm
3dnowprefetch cpuid_fault epb pti ibrs ibpb stibp tpr_shadow vnmi
flexpriority ept vpid tsc_adjust smep erms dtherm ida arat md_clear
vmx flags : vnmi preemption_timer invvpid ept_x_only flexpriority
tsc_offset vtpr mtf vapic ept vpid unrestricted_guest
bugs : cpu_meltdown spectre_v1 spectre_v2 mds msbds_only
bogomips : 4800.19
clflush size : 64
cache_alignment : 64
address sizes : 36 bits physical, 48 bits virtual
power management:


> >
> >> In case anybody has a reproducer (either in a guest or dom0) with a
> >> setup where a diagnostic kernel can be used, I'd be _very_ interested!
> >
> > I can easily add things to Dom0 and DomU. Whether that will disrupt the
> > experiment is, of course, another matter. Still please let me know what
> > would be helpful to do.
>
> Is there a chance to switch to an upstream kernel in the guest? I'd like
> to add some diagnostic code to the kernel and creating the patches will
> be easier this way.
>

That's a bit tough -- the VM is based on stock Ubuntu and if I upgrade the
kernel I'll have fiddle with a lot things to make workload functional again=
.

However, I can install debug kernel (from Ubuntu, etc. etc.)

Of course, if patching the kernel is the only way to make progress -- lets
try that -- please let me know.

Thanks,
Roman.

--0000000000002f50b305bb95827a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 17, 2021 at =
12:29 AM J=C3=BCrgen Gro=C3=9F &lt;<a href=3D"mailto:jgross@suse.com">jgros=
s@suse.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1=
ex">On 17.02.21 09:12, Roman Shaposhnik wrote:<br>
&gt; Hi J=C3=BCrgen, thanks for taking a look at this. A few comments below=
:<br>
&gt; <br>
&gt; On Tue, Feb 16, 2021 at 10:47 PM J=C3=BCrgen Gro=C3=9F &lt;<a href=3D"=
mailto:jgross@suse.com" target=3D"_blank">jgross@suse.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; On 16.02.21 21:34, Stefano Stabellini wrote:<br>
&gt;&gt;&gt; + x86 maintainers<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It looks like the tlbflush is getting stuck?<br>
&gt;&gt;<br>
&gt;&gt; I have seen this case multiple times on customer systems now, but<=
br>
&gt;&gt; reproducing it reliably seems to be very hard.<br>
&gt; <br>
&gt; It is reliably reproducible under my workload but it take a long time<=
br>
&gt; (~3 days of the workload running in the lab).<br>
<br>
This is by far the best reproduction rate I have seen up to now.<br>
<br>
The next best reproducer seems to be a huge installation with several<br>
hundred hosts and thousands of VMs with about 1 crash each week.<br>
<br>
&gt; <br>
&gt;&gt; I suspected fifo events to be blamed, but just yesterday I&#39;ve =
been<br>
&gt;&gt; informed of another case with fifo events disabled in the guest.<b=
r>
&gt;&gt;<br>
&gt;&gt; One common pattern seems to be that up to now I have seen this eff=
ect<br>
&gt;&gt; only on systems with Intel Gold cpus. Can it be confirmed to be tr=
ue<br>
&gt;&gt; in this case, too?<br>
&gt; <br>
&gt; I am pretty sure mine isn&#39;t -- I can get you full CPU specs if tha=
t&#39;s useful.<br>
<br>
Just the output of &quot;grep model /proc/cpuinfo&quot; should be enough.<b=
r></blockquote><div><br></div><div><div>processor<span class=3D"gmail-Apple=
-tab-span" style=3D"white-space:pre">	</span>: 3</div><div>vendor_id<span c=
lass=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>: GenuineIn=
tel</div><div>cpu family<span class=3D"gmail-Apple-tab-span" style=3D"white=
-space:pre">	</span>: 6</div><div>model<span class=3D"gmail-Apple-tab-span"=
 style=3D"white-space:pre">		</span>: 77</div><div>model name<span class=3D=
"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>: Intel(R) Atom(TM=
) CPU =C2=A0C2550 =C2=A0@ 2.40GHz</div><div>stepping<span class=3D"gmail-Ap=
ple-tab-span" style=3D"white-space:pre">	</span>: 8</div><div>microcode<spa=
n class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>: 0x12d<=
/div><div>cpu MHz<span class=3D"gmail-Apple-tab-span" style=3D"white-space:=
pre">		</span>: 1200.070</div><div>cache size<span class=3D"gmail-Apple-tab=
-span" style=3D"white-space:pre">	</span>: 1024 KB</div><div>physical id<sp=
an class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>: 0</di=
v><div>siblings<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pr=
e">	</span>: 4</div><div>core id<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">		</span>: 3</div><div>cpu cores<span class=3D"gmail-A=
pple-tab-span" style=3D"white-space:pre">	</span>: 4</div><div>apicid<span =
class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>: 6</div>=
<div>initial apicid<span class=3D"gmail-Apple-tab-span" style=3D"white-spac=
e:pre">	</span>: 6</div><div>fpu<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">		</span>: yes</div><div>fpu_exception<span class=3D"g=
mail-Apple-tab-span" style=3D"white-space:pre">	</span>: yes</div><div>cpui=
d level<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>: 11</div><div>wp<span class=3D"gmail-Apple-tab-span" style=3D"white-spa=
ce:pre">		</span>: yes</div><div>flags<span class=3D"gmail-Apple-tab-span" =
style=3D"white-space:pre">		</span>: fpu vme de pse tsc msr pae mce cx8 api=
c sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht =
tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nop=
l xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cp=
l vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_=
timer aes rdrand lahf_lm 3dnowprefetch cpuid_fault epb pti ibrs ibpb stibp =
tpr_shadow vnmi flexpriority ept vpid tsc_adjust smep erms dtherm ida arat =
md_clear</div><div>vmx flags<span class=3D"gmail-Apple-tab-span" style=3D"w=
hite-space:pre">	</span>: vnmi preemption_timer invvpid ept_x_only flexprio=
rity tsc_offset vtpr mtf vapic ept vpid unrestricted_guest</div><div>bugs<s=
pan class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>: cpu=
_meltdown spectre_v1 spectre_v2 mds msbds_only</div><div>bogomips<span clas=
s=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>: 4800.19</div=
><div>clflush size<span class=3D"gmail-Apple-tab-span" style=3D"white-space=
:pre">	</span>: 64</div><div>cache_alignment<span class=3D"gmail-Apple-tab-=
span" style=3D"white-space:pre">	</span>: 64</div><div>address sizes<span c=
lass=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>: 36 bits p=
hysical, 48 bits virtual</div><div>power management:</div></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex">&gt; <br>
&gt;&gt; In case anybody has a reproducer (either in a guest or dom0) with =
a<br>
&gt;&gt; setup where a diagnostic kernel can be used, I&#39;d be _very_ int=
erested!<br>
&gt; <br>
&gt; I can easily add things to Dom0 and DomU. Whether that will disrupt th=
e<br>
&gt; experiment is, of course, another matter. Still please let me know wha=
t<br>
&gt; would be helpful to do.<br>
<br>
Is there a chance to switch to an upstream kernel in the guest? I&#39;d lik=
e<br>
to add some diagnostic code to the kernel and creating the patches will<br>
be easier this way.<br></blockquote><div><br></div><div>That&#39;s a bit to=
ugh -- the VM is based on stock Ubuntu and if I upgrade the kernel I&#39;ll=
 have fiddle with a lot things to make workload functional again.</div><div=
><br></div><div>However, I can install debug kernel (from Ubuntu, etc. etc.=
)</div><div><br></div><div>Of course, if patching the kernel is the only wa=
y to make progress -- lets try that -- please let me know.</div><div><br></=
div><div>Thanks,</div><div>Roman.=C2=A0</div></div></div></div>

--0000000000002f50b305bb95827a--


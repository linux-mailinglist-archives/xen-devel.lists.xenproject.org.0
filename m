Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717212E2221
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 22:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58600.103221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksBjr-0003YE-Ql; Wed, 23 Dec 2020 21:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58600.103221; Wed, 23 Dec 2020 21:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksBjr-0003Xp-N8; Wed, 23 Dec 2020 21:32:07 +0000
Received: by outflank-mailman (input) for mailman id 58600;
 Wed, 23 Dec 2020 21:32:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GNZT=F3=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1ksBjp-0003Xk-C9
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 21:32:05 +0000
Received: from mail-qv1-xf35.google.com (unknown [2607:f8b0:4864:20::f35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 047fbef8-d796-49e9-a86f-6644070ac8df;
 Wed, 23 Dec 2020 21:32:03 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id a13so450880qvv.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Dec 2020 13:32:03 -0800 (PST)
Received: from ?IPv6:2607:fb90:2490:9cc4:2476:fb1f:29f7:9ad4?
 ([2607:fb90:2490:9cc4:2476:fb1f:29f7:9ad4])
 by smtp.gmail.com with ESMTPSA id a5sm16395870qtn.57.2020.12.23.13.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 13:32:02 -0800 (PST)
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
X-Inumbo-ID: 047fbef8-d796-49e9-a86f-6644070ac8df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:message-id:date
         :cc:to;
        bh=IF1Fi9WNO+Q0ToX2Z2DXtCfABhDvr6W+0befsdetbaI=;
        b=lZH3bozJ52vLj99A3hrkj1uiy+EB3Kd2JmD8SDAgC3njxg/4b/IF7IqdXN+O4vsxkq
         BhR7y8dZr82iPGimKOcnK7Ct5jBTUNUul+3geuwgDzYcv616tkH2k94bJn3jX9i5vSuK
         fhbXIQv1/SN2aHmEc73RjS+3IwDGuhfpifr0119xEg+wse4QxCajw7od9RpdU7W4miHF
         Q9+AFUJtBZJPXrkhImRwIxm7zGhiOsOedKZOkJ2nuv4A20orFH6JkU6WXaWDk9XizmIu
         vlDukYb/wrb/vx6Ct+HCLEVpvMb4kWiA+5gJ3KE6lqWAggmsrNYY2ybVhGYuBPkHAyaj
         lFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:message-id:date:cc:to;
        bh=IF1Fi9WNO+Q0ToX2Z2DXtCfABhDvr6W+0befsdetbaI=;
        b=JAdcBauZBTFpZCkiX3GF0AQ2hyKf2l0qWudWYawduKLwaGodg1tMBCo7WulKERWWpA
         CAEwC945qUJRPf/zfBFDwAq2gXLlCaKVwIeCenAYx/sJ0I9368l6Qg0BqG1RiNAAZUsK
         ifETgxhDhB6ch2awIcRBBatlXJaryznsqCPW+m8zv51dcX5cTxX5O90snDLG0hJH1xPw
         GAipTfDg9y73WQnUkzLj8+s8enqbvY16ruloEpRZIhlki8LR77pfNUiw2uiszMnEqxdF
         vJu3PGLYEf2VM7e40rrKW9k9mNxpJwFD8tpza5eLY/Lr4ixmzkO67megbfjNrqbLNavJ
         NxRg==
X-Gm-Message-State: AOAM533NxpRp/PsvEjJTGPeUFhn4NBfBuSj/+n7M7PkwQuTOsMyYVt3Z
	Tg9dVOvCYbD9u7oi4Eh0FBE=
X-Google-Smtp-Source: ABdhPJwZci8g2Fb/fio8uJCdyyOvKcgrANAPQwLXQtOKtle9eyks701oNx/oQqbT8YwTR3m0oDIivg==
X-Received: by 2002:a0c:b21e:: with SMTP id x30mr28485289qvd.21.1608759122814;
        Wed, 23 Dec 2020 13:32:02 -0800 (PST)
Content-Type: multipart/alternative; boundary=Apple-Mail-1EDF01CF-DC35-4301-BB7C-E7B738FFF897
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
Message-Id: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com>
Date: Wed, 23 Dec 2020 16:32:01 -0500
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 openxt <openxt@googlegroups.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, roger.pau@citrix.com,
 Julien Grall <jgrall@amazon.com>, James McKenzie <james@bromium.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.co.uk>
To: Jean-Philippe Ouellet <jpo@vt.edu>
X-Mailer: iPhone Mail (18C66)


--Apple-Mail-1EDF01CF-DC35-4301-BB7C-E7B738FFF897
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn Dec 17, 2020, at 07:13, Jean-Philippe Ouellet <jpo@vt.edu> wrote=
:
> =EF=BB=BFOn Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>> Hi all,
>>=20
>> I have written a page for the OpenXT wiki describing a proposal for
>> initial development towards the VirtIO-Argo transport driver, and the
>> related system components to support it, destined for OpenXT and
>> upstream projects:
>>=20
>> https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-=
Argo+Development+Phase+1
>>=20
>> Please review ahead of tomorrow's OpenXT Community Call.
>>=20
>> I would draw your attention to the Comparison of Argo interface options s=
ection:
>>=20
>> https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-=
Argo+Development+Phase+1#Comparison-of-Argo-interface-options
>>=20
>> where further input to the table would be valuable;
>> and would also appreciate input on the IOREQ project section:
>>=20
>> https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-=
Argo+Development+Phase+1#Project:-IOREQ-for-VirtIO-Argo
>>=20
>> in particular, whether an IOREQ implementation to support the
>> provision of devices to the frontends can replace the need for any
>> userspace software to interact with an Argo kernel interface for the
>> VirtIO-Argo implementation.
>>=20
>> thanks,
>> Christopher
>=20
> Hi,
>=20
> Really excited to see this happening, and disappointed that I'm not
> able to contribute at this time. I don't think I'll be able to join
> the call, but wanted to share some initial thoughts from my
> middle-of-the-night review anyway.
>=20
> Super rough notes in raw unedited notes-to-self form:
>=20
> main point of feedback is: I love the desire to get a non-shared-mem
> transport backend for virtio standardized. It moves us closer to an
> HMX-only world. BUT: virtio is relevant to many hypervisors beyond
> Xen, not all of which have the same views on how policy enforcement
> should be done, namely some have a preference for capability-oriented
> models over type-enforcement / MAC models. It would be nice if any
> labeling encoded into the actual specs / guest-boundary protocols
> would be strictly a mechanism, and be policy-agnostic, in particular
> not making implicit assumptions about XSM / SELinux / similar. I don't
> have specific suggestions at this point, but would love to discuss.
>=20
> thoughts on how to handle device enumeration? hotplug notifications?
> - can't rely on xenstore
> - need some internal argo messaging for this?
> - name service w/ well-known names? starts to look like xenstore
> pretty quickly...
> - granular disaggregation of backend device-model providers desirable
>=20
> how does resource accounting work? each side pays for their own delivery r=
ing?
> - init in already-guest-mapped mem & simply register?
> - how does it compare to grant tables?
>  - do you need to go through linux driver to alloc (e.g. xengntalloc)
> or has way to share arbitrary otherwise not-special userspace pages
> (e.g. u2mfn, with all its issues (pinning, reloc, etc.))?
>=20
> ioreq is tangled with grant refs, evt chans, generic vmexit
> dispatcher, instruction decoder, etc. none of which seems desirable if
> trying to move towards world with strictly safer guest interfaces
> exposed (e.g. HMX-only)
> - there's no io to trap/decode here, it's explicitly exclusively via
> hypercall to HMX, no?
> - also, do we want argo sendv hypercall to be always blocking & synchronou=
s?
>  - or perhaps async notify & background copy to other vm addr space?
>  - possibly better scaling?
>  - accounting of in-flight io requests to handle gets complicated
> (see recent XSA)
>  - PCI-like completion request semantics? (argo as cross-domain
> software dma engine w/ some basic protocol enforcement?)
>=20
> "port" v4v driver =3D> argo:
> - yes please! something without all the confidence-inspiring
> DEBUG_{APPLE,ORANGE,BANANA} indicators of production-worthy code would
> be great ;)
> - seems like you may want to redo argo hypercall interface too? (at
> least the syscall interface...)
>  - targeting synchronous blocking sendv()?
>  - or some async queue/completion thing too? (like PF_RING, but with
> *iov entries?)
>  - both could count as HMX, both could enforce no double-write racing
> games at dest ring, etc.
>=20
> re v4vchar & doing similar for argo:
> - we may prefer "can write N bytes? -> yes/no" or "how many bytes can
> write? -> N" over "try to write N bytes -> only wrote M, EAGAIN"
> - the latter can be implemented over the former, but not the other way aro=
und
> - starts to matter when you want to be able to implement in userspace
> & provide backpressure to peer userspace without additional buffering
> & potential lying about durability of writes
> - breaks cross-domain EPIPE boundary correctness
> - Qubes ran into same issues when porting vchan from Xen to KVM
> initially via vsock
>=20
> some virtio drivers explicitly use shared mem for more than just
> communication rings:
> - e.g. virtio-fs, which can map pages as DAX-like fs backing to share page=
 cache
> - e.g. virtio-gpu, virtio-wayland, virtio-video, which deal in framebuffer=
s
> - needs thought about how best to map semantics to (or at least
> interoperate cleanly & safely with) HMX-{only,mostly} world
>  - the performance of shared mem actually can meaningfully matter for
> e.g. large framebuffers in particular due to fundamental memory
> bandwidth constraints
>=20
> what is mentioned PX hypervisor? presumably short for PicoXen? any
> public information?

Not much at the moment, but there is prior public work.  PX is an OSS L0 "Pr=
otection Hypervisor" in the Hardened Access Terminal (HAT) architecture pres=
ented by Daniel Smith at the 2020 Xen Summit: https://youtube.com/watch?v=3D=
Wt-SBhFnDZY&t=3D3m48s

PX is intended to build on lessons learned from IBM Ultravisor, HP/Bromium A=
X and AIS Bareflank L0 hypervisors:

IBM: https://www.platformsecuritysummit.com/2019/speaker/hunt/

HP/Bromium: https://www.platformsecuritysummit.com/2018/speaker/pratt/
Dec 2019 meeting in Cambridge, Day2 discussion included L0 nesting hyperviso=
r, UUID semantics, Argo, communication between nested hypervisors: https://l=
ists.archive.carbon60.com/xen/devel/577800

Bareflank: https://youtube.com/channel/UCH-7Pw96K5V1RHAPn5-cmYA
Xen Summit 2020 design session notes: https://lists.archive.carbon60.com/xen=
/devel/591509

In the long-term, efficient hypervisor nesting will require close cooperatio=
n with silicon and firmware vendors. Note that Intel is introducing TDX (Tru=
st Domain Extensions):

https://software.intel.com/content/www/us/en/develop/articles/intel-trust-do=
main-extensions.html
https://www.brighttalk.com/webcast/18206/453600

There are also a couple of recent papers from Shanghai Jiao Tong University,=
 on using hardware instructions to accelerate inter-domain HMX.

March 2019: https://ipads.se.sjtu.edu.cn/_media/publications/skybridge-euros=
ys19.pdf

> we present SkyBridge, a new communication facility designed and optimized f=
or synchronous IPC in microkernels. SkyBridge requires no involvement of ker=
nels during communication and allows a process to directly switch to the vir=
tual address space of the target process and invoke the target function. Sky=
Bridge retains the traditional virtual address space isolation and thus can b=
e easily integrated into existing microkernels. The key idea of SkyBridge is=
 to leverage a commodity hardware feature for virtualization (i.e., [Intel E=
PT] VMFUNC) to achieve efficient IPC. To leverage the hardware feature, SkyB=
ridge inserts a tiny virtualization layer (Rootkernel) beneath the original m=
icrokernel (Subkernel). The Rootkernel is carefully designed to eliminate mo=
st virtualization overheads. SkyBridge also integrates a series of technique=
s to guarantee the security properties of IPC. We have implemented SkyBridge=
 on three popular open-source microkernels (seL4, Fiasco.OC, and Google Zirc=
on). The evaluation results show that SkyBridge improves the speed of IPC by=
 1.49x to 19.6x for microbenchmarks. For real-world applications (e.g., SQLi=
te3 database), SkyBridge improves the throughput by 81.9%, 1.44x and 9.59x f=
or the three microkernels on average.

July 2020: https://ipads.se.sjtu.edu.cn/_media/publications/guatc20.pdf

> a redesign of traditional microkernel OSes to harmonize the tension betwee=
n messaging performance and isolation. UnderBridge moves the OS components o=
f a microkernel between user space and kernel space at runtime while enforci=
ng consistent isolation. It retrofits Intel Memory Protection Key for Usersp=
ace (PKU) in kernel space to achieve such isolation efficiently and design a=
 fast IPC mechanism across those OS components. Thanks to PKU=E2=80=99s extr=
emely low overhead, the inter-process communication (IPC) roundtrip cost in U=
nderBridge can be as low as 109 cycles. We have designed and implemented a n=
ew microkernel called ChCore based on UnderBridge and have also ported Under=
Bridge to three mainstream microkernels, i.e., seL4, Google Zircon, and Fias=
co.OC. Evaluations show that UnderBridge speeds up the IPC by 3.0=C3=97 comp=
ared with the state-of-the-art (e.g., SkyBridge) and improves the performanc=
e of IPC-intensive applications by up to 13.1=C3=97 for the above three micr=
okernels



For those interested in Argo and VirtIO, there will be a conference call on T=
hursday, Jan 14th 2021, at 1600 UTC.

Rich=

--Apple-Mail-1EDF01CF-DC35-4301-BB7C-E7B738FFF897
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BFOn Dec 17, 2020, a=
t 07:13, Jean-Philippe Ouellet &lt;jpo@vt.edu&gt; wrote:<div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><blockquote type=3D"cite"><b=
r></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<sp=
an>On Wed, Dec 16, 2020 at 2:37 PM Christopher Clark</span><br><span>&lt;chr=
istopher.w.clark@gmail.com&gt; wrote:</span><br><blockquote type=3D"cite"><s=
pan>Hi all,</span><br></blockquote><blockquote type=3D"cite"><span></span><b=
r></blockquote><blockquote type=3D"cite"><span>I have written a page for the=
 OpenXT wiki describing a proposal for</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>initial development towards the VirtIO-Argo transport driv=
er, and the</span><br></blockquote><blockquote type=3D"cite"><span>related s=
ystem components to support it, destined for OpenXT and</span><br></blockquo=
te><blockquote type=3D"cite"><span>upstream projects:</span><br></blockquote=
><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>https://openxt.atlassian.net/wiki/spaces/~cclark/pages/16961699=
85/VirtIO-Argo+Development+Phase+1</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Please r=
eview ahead of tomorrow's OpenXT Community Call.</span><br></blockquote><blo=
ckquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite=
"><span>I would draw your attention to the Comparison of Argo interface opti=
ons section:</span><br></blockquote><blockquote type=3D"cite"><span></span><=
br></blockquote><blockquote type=3D"cite"><span>https://openxt.atlassian.net=
/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1#Compar=
ison-of-Argo-interface-options</span><br></blockquote><blockquote type=3D"ci=
te"><span></span><br></blockquote><blockquote type=3D"cite"><span>where furt=
her input to the table would be valuable;</span><br></blockquote><blockquote=
 type=3D"cite"><span>and would also appreciate input on the IOREQ project se=
ction:</span><br></blockquote><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span>https://openxt.atlassian.net/wiki/=
spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1#Project:-IOR=
EQ-for-VirtIO-Argo</span><br></blockquote><blockquote type=3D"cite"><span></=
span><br></blockquote><blockquote type=3D"cite"><span>in particular, whether=
 an IOREQ implementation to support the</span><br></blockquote><blockquote t=
ype=3D"cite"><span>provision of devices to the frontends can replace the nee=
d for any</span><br></blockquote><blockquote type=3D"cite"><span>userspace s=
oftware to interact with an Argo kernel interface for the</span><br></blockq=
uote><blockquote type=3D"cite"><span>VirtIO-Argo implementation.</span><br><=
/blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockqu=
ote type=3D"cite"><span>thanks,</span><br></blockquote><blockquote type=3D"c=
ite"><span>Christopher</span><br></blockquote><span></span><br><span>Hi,</sp=
an><br><span></span><br><span>Really excited to see this happening, and disa=
ppointed that I'm not</span><br><span>able to contribute at this time. I don=
't think I'll be able to join</span><br><span>the call, but wanted to share s=
ome initial thoughts from my</span><br><span>middle-of-the-night review anyw=
ay.</span><br><span></span><br><span>Super rough notes in raw unedited notes=
-to-self form:</span><br><span></span><br><span>main point of feedback is: I=
 love the desire to get a non-shared-mem</span><br><span>transport backend f=
or virtio standardized. It moves us closer to an</span><br><span>HMX-only wo=
rld. BUT: virtio is relevant to many hypervisors beyond</span><br><span>Xen,=
 not all of which have the same views on how policy enforcement</span><br><s=
pan>should be done, namely some have a preference for capability-oriented</s=
pan><br><span>models over type-enforcement / MAC models. It would be nice if=
 any</span><br><span>labeling encoded into the actual specs / guest-boundary=
 protocols</span><br><span>would be strictly a mechanism, and be policy-agno=
stic, in particular</span><br><span>not making implicit assumptions about XS=
M / SELinux / similar. I don't</span><br><span>have specific suggestions at t=
his point, but would love to discuss.</span><br><span></span><br><span>thoug=
hts on how to handle device enumeration? hotplug notifications?</span><br><s=
pan>- can't rely on xenstore</span><br><span>- need some internal argo messa=
ging for this?</span><br><span>- name service w/ well-known names? starts to=
 look like xenstore</span><br><span>pretty quickly...</span><br><span>- gran=
ular disaggregation of backend device-model providers desirable</span><br><s=
pan></span><br><span>how does resource accounting work? each side pays for t=
heir own delivery ring?</span><br><span>- init in already-guest-mapped mem &=
amp; simply register?</span><br><span>- how does it compare to grant tables?=
</span><br><span> &nbsp;- do you need to go through linux driver to alloc (e=
.g. xengntalloc)</span><br><span>or has way to share arbitrary otherwise not=
-special userspace pages</span><br><span>(e.g. u2mfn, with all its issues (p=
inning, reloc, etc.))?</span><br><span></span><br><span>ioreq is tangled wit=
h grant refs, evt chans, generic vmexit</span><br><span>dispatcher, instruct=
ion decoder, etc. none of which seems desirable if</span><br><span>trying to=
 move towards world with strictly safer guest interfaces</span><br><span>exp=
osed (e.g. HMX-only)</span><br><span>- there's no io to trap/decode here, it=
's explicitly exclusively via</span><br><span>hypercall to HMX, no?</span><b=
r><span>- also, do we want argo sendv hypercall to be always blocking &amp; s=
ynchronous?</span><br><span> &nbsp;- or perhaps async notify &amp; backgroun=
d copy to other vm addr space?</span><br><span> &nbsp;- possibly better scal=
ing?</span><br><span> &nbsp;- accounting of in-flight io requests to handle g=
ets complicated</span><br><span>(see recent XSA)</span><br><span> &nbsp;- PC=
I-like completion request semantics? (argo as cross-domain</span><br><span>s=
oftware dma engine w/ some basic protocol enforcement?)</span><br><span></sp=
an><br><span>"port" v4v driver =3D&gt; argo:</span><br><span>- yes please! s=
omething without all the confidence-inspiring</span><br><span>DEBUG_{APPLE,O=
RANGE,BANANA} indicators of production-worthy code would</span><br><span>be g=
reat ;)</span><br><span>- seems like you may want to redo argo hypercall int=
erface too? (at</span><br><span>least the syscall interface...)</span><br><s=
pan> &nbsp;- targeting synchronous blocking sendv()?</span><br><span> &nbsp;=
- or some async queue/completion thing too? (like PF_RING, but with</span><b=
r><span>*iov entries?)</span><br><span> &nbsp;- both could count as HMX, bot=
h could enforce no double-write racing</span><br><span>games at dest ring, e=
tc.</span><br><span></span><br><span>re v4vchar &amp; doing similar for argo=
:</span><br><span>- we may prefer "can write N bytes? -&gt; yes/no" or "how m=
any bytes can</span><br><span>write? -&gt; N" over "try to write N bytes -&g=
t; only wrote M, EAGAIN"</span><br><span>- the latter can be implemented ove=
r the former, but not the other way around</span><br><span>- starts to matte=
r when you want to be able to implement in userspace</span><br><span>&amp; p=
rovide backpressure to peer userspace without additional buffering</span><br=
><span>&amp; potential lying about durability of writes</span><br><span>- br=
eaks cross-domain EPIPE boundary correctness</span><br><span>- Qubes ran int=
o same issues when porting vchan from Xen to KVM</span><br><span>initially v=
ia vsock</span><br><span></span><br><span>some virtio drivers explicitly use=
 shared mem for more than just</span><br><span>communication rings:</span><b=
r><span>- e.g. virtio-fs, which can map pages as DAX-like fs backing to shar=
e page cache</span><br><span>- e.g. virtio-gpu, virtio-wayland, virtio-video=
, which deal in framebuffers</span><br><span>- needs thought about how best t=
o map semantics to (or at least</span><br><span>interoperate cleanly &amp; s=
afely with) HMX-{only,mostly} world</span><br><span> &nbsp;- the performance=
 of shared mem actually can meaningfully matter for</span><br><span>e.g. lar=
ge framebuffers in particular due to fundamental memory</span><br><span>band=
width constraints</span><br><span></span><br><span>what is mentioned PX hype=
rvisor? presumably short for PicoXen? any</span><br><span>public information=
?</span><br></div></blockquote><br><div>Not much at the moment, but there is=
 prior public work. &nbsp;PX is an OSS L0 "Protection Hypervisor" in the Har=
dened Access Terminal (HAT) architecture presented by Daniel Smith at the 20=
20 Xen Summit:&nbsp;<a href=3D"https://m.youtube.com/watch?v=3DWt-SBhFnDZY&a=
mp;t=3D3m48s">https://youtube.com/watch?v=3DWt-SBhFnDZY&amp;t=3D3m48s</a></d=
iv><div><br></div><div>PX is intended to build on lessons learned from IBM U=
ltravisor, HP/Bromium AX and AIS Bareflank L0 hypervisors:</div><div><br></d=
iv><div>IBM:&nbsp;<a href=3D"https://www.platformsecuritysummit.com/2019/spe=
aker/hunt/">https://www.platformsecuritysummit.com/2019/speaker/hunt/</a></d=
iv><div><br></div><div>HP/Bromium:&nbsp;<a href=3D"https://www.platformsecur=
itysummit.com/2018/speaker/pratt/">https://www.platformsecuritysummit.com/20=
18/speaker/pratt/</a></div><div>Dec 2019 meeting in Cambridge, Day2 discussi=
on included L0 nesting hypervisor, UUID semantics, Argo, communication betwe=
en nested hypervisors:&nbsp;<a href=3D"https://lists.archive.carbon60.com/xe=
n/devel/577800?search_string=3Ddecember%20f2f;#577800">https://lists.archive=
.carbon60.com/xen/devel/577800</a></div><div><br></div><div>Bareflank:&nbsp;=
<a href=3D"https://m.youtube.com/channel/UCH-7Pw96K5V1RHAPn5-cmYA">https://<=
/a><a href=3D"https://m.youtube.com/channel/UCH-7Pw96K5V1RHAPn5-cmYA">youtub=
e.com/channel/UCH-7Pw96K5V1RHAPn5-cmYA</a></div><div>Xen Summit 2020 design s=
ession notes:&nbsp;<a href=3D"https://lists.archive.carbon60.com/xen/devel/5=
91509?search_string=3Dbareflank;#591509">https://lists.archive.carbon60.com/=
xen/devel/591509</a></div><div><br></div><div>In the long-term, efficient hy=
pervisor nesting will require close cooperation with silicon and firmware ve=
ndors. Note that Intel is introducing TDX (Trust Domain Extensions):</div><d=
iv><br></div><div><a href=3D"https://software.intel.com/content/www/us/en/de=
velop/articles/intel-trust-domain-extensions.html">https://software.intel.co=
m/content/www/us/en/develop/articles/intel-trust-domain-extensions.html</a><=
/div><div><a href=3D"https://www.brighttalk.com/webcast/18206/453600">https:=
//www.brighttalk.com/webcast/18206/453600</a></div><div><br></div><div>There=
 are also a couple of recent papers from Shanghai Jiao Tong University, on u=
sing hardware instructions to accelerate inter-domain HMX.</div><div><br></d=
iv><div><div>March 2019: https://ipads.se.sjtu.edu.cn/_media/publications/sk=
ybridge-eurosys19.pdf</div><div><br></div><div>&gt; we present SkyBridge, a n=
ew communication facility designed and optimized for synchronous IPC in micr=
okernels. SkyBridge requires no involvement of kernels during communication a=
nd allows a process to directly switch to the virtual address space of the t=
arget process and invoke the target function. SkyBridge retains the traditio=
nal virtual address space isolation and thus can be easily integrated into e=
xisting microkernels. The key idea of SkyBridge is to leverage a commodity h=
ardware feature for virtualization (i.e., [Intel EPT] VMFUNC) to achieve eff=
icient IPC. To leverage the hardware feature, SkyBridge inserts a tiny virtu=
alization layer (Rootkernel) beneath the original microkernel (Subkernel). T=
he Rootkernel is carefully designed to eliminate most virtualization overhea=
ds. SkyBridge also integrates a series of techniques to guarantee the securi=
ty properties of IPC. We have implemented SkyBridge on three popular open-so=
urce microkernels (seL4, Fiasco.OC, and Google Zircon). The evaluation resul=
ts show that SkyBridge improves the speed of IPC by 1.49x to 19.6x for micro=
benchmarks. For real-world applications (e.g., SQLite3 database), SkyBridge i=
mproves the throughput by 81.9%, 1.44x and 9.59x for the three microkernels o=
n average.</div></div><div><br></div><div><div>July 2020: https://ipads.se.s=
jtu.edu.cn/_media/publications/guatc20.pdf</div><div><br></div><div>&gt; a r=
edesign of traditional microkernel OSes to harmonize the tension between mes=
saging performance and isolation. UnderBridge moves the OS components of a m=
icrokernel between user space and kernel space at runtime while enforcing co=
nsistent isolation. It retrofits Intel Memory Protection Key for Userspace (=
PKU) in kernel space to achieve such isolation efficiently and design a fast=
 IPC mechanism across those OS components. Thanks to PKU=E2=80=99s extremely=
 low overhead, the inter-process communication (IPC) roundtrip cost in Under=
Bridge can be as low as 109 cycles. We have designed and implemented a new m=
icrokernel called ChCore based on UnderBridge and have also ported UnderBrid=
ge to three mainstream microkernels, i.e., seL4, Google Zircon, and Fiasco.O=
C. Evaluations show that UnderBridge speeds up the IPC by 3.0=C3=97 compared=
 with the state-of-the-art (e.g., SkyBridge) and improves the performance of=
 IPC-intensive applications by up to 13.1=C3=97 for the above three microker=
nels</div></div><div><br></div><div><br></div><div><br></div><div>For those i=
nterested in Argo and VirtIO, there will be a conference call on Thursday, J=
an 14th 2021, at 1600 UTC.</div><div><br></div><div>Rich</div></div></div></=
div></div></body></html>=

--Apple-Mail-1EDF01CF-DC35-4301-BB7C-E7B738FFF897--


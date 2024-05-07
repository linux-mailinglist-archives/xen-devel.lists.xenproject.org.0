Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034918BE889
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 18:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718297.1120886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4NUC-0008EU-QH; Tue, 07 May 2024 16:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718297.1120886; Tue, 07 May 2024 16:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4NUC-0008C8-Mt; Tue, 07 May 2024 16:16:12 +0000
Received: by outflank-mailman (input) for mailman id 718297;
 Tue, 07 May 2024 16:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cCq=MK=flex--seanjc.bounces.google.com=3x1M6ZgYKCZACyu73w08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@srs-se1.protection.inumbo.net>)
 id 1s4NUA-0008C2-Uc
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 16:16:10 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ceca4df-0c8d-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 18:16:09 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-de59ff8af0bso5147616276.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 09:16:09 -0700 (PDT)
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
X-Inumbo-ID: 1ceca4df-0c8d-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715098568; x=1715703368; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWxS0mCdKrqU6bVOz4n3NTmQy0CRO7Urzkw5a/fWZlQ=;
        b=AZOcz3z8AQqXNYWVb7Qf+KlHCB/MUVXVgKcNyqEJ5QtrLEmHvwRmqiz5x7YZ8Fe63U
         Fjzvut1HibbXzGBAFhGVDfn9iM1XMfc0RmCUKY4xI5ESKKMLurOcV7lzQG/3M0cSy5oU
         RnIM2MpfCh3k0Ntu09ZgL3pCP4OCoOVKVv4/NsFQWZbjJKZjK4XVM/609NMuR2E6JIx1
         TncTFU1KNSizpokwTHV/w1dfQUqlfE9f74mLfEvHymGfnmKxOi8l3n5/MD+TIPI2C4c4
         Mrd3lio5topPsRPO67WCvGEhLZiDd2DWxzKypiSOjQGk7Lt6aJiAxH17E6Bf2DkNi1q4
         fyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715098568; x=1715703368;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IWxS0mCdKrqU6bVOz4n3NTmQy0CRO7Urzkw5a/fWZlQ=;
        b=PmvyweHrkk7bJA6M/jiiRZGnYrGjzA520BcnTj3EQt0IRU6k87euYc4ihqzK8rPvRJ
         xlSjumEviayM7f4AzjvfU7GiQnoaX6Xzg0P/FrFtnc0ROCH6jcDlgEabM3FA9sx/INzy
         1Am+eI0Vpd2rbDeSkGAQFEHNgJK4SqWqsej2ERleyw6GOzFutgwSLpSiDQjPYydoQhop
         qs+DwB6jb6tgOAMYsdmCiujOJ4d/3pVpHkT8BvF/M6Gupg+l7QOVz+hsFEyYDQ1nOpte
         J2qvFCz03Rlila1J8NB/V6P9Si4v3KcUs7NAQFWEQnZXTQuYJsENpEbymTu+Uw6DLeCd
         XAHg==
X-Forwarded-Encrypted: i=1; AJvYcCXZjnV4dt26998G9XB7klDNu4gbL1hlwtQDtuyTgpu1yw2MUIPuLdpjottBEsy9ReZJWDIAvwfc7USLFEehSuowWSWZkcj6lRfBUjx6Yis=
X-Gm-Message-State: AOJu0Yy5MYzuy+Xh1rpiJmSf3+JkSnpxRNfXRAvO5lSfIEqB4agKbcDz
	5cLXfcJ1InWny2gbdK5sVbbFc3A5X+N3lbaUyZKW71aW7UZ1btWCos3KrC5jON+HOJ+VIM6KM8n
	kog==
X-Google-Smtp-Source: AGHT+IEEPkTwPJaOTGouRKDc7DVHMnqTRjb0yesgQ4YUUdFhPv8WpJzXBwRvcXmUBR39ssSE6I5KsNiqYrA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:707:b0:dbe:30cd:8fcb with SMTP id
 3f1490d57ef6-debb9c0032emr11950276.0.1715098567940; Tue, 07 May 2024 09:16:07
 -0700 (PDT)
Date: Tue, 7 May 2024 09:16:06 -0700
In-Reply-To: <20240507.ieghomae0UoC@digikod.net>
Mime-Version: 1.0
References: <20240503131910.307630-1-mic@digikod.net> <20240503131910.307630-4-mic@digikod.net>
 <ZjTuqV-AxQQRWwUW@google.com> <20240506.ohwe7eewu0oB@digikod.net>
 <ZjmFPZd5q_hEBdBz@google.com> <20240507.ieghomae0UoC@digikod.net>
Message-ID: <ZjpTxt-Bxia3bRwB@google.com>
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Alexander Graf <graf@amazon.com>, 
	Angelina Vu <angelinavu@linux.microsoft.com>, 
	Anna Trikalinou <atrikalinou@microsoft.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Forrest Yuan Yu <yuanyu@google.com>, James Gowans <jgowans@amazon.com>, 
	James Morris <jamorris@linux.microsoft.com>, John Andersen <john.s.andersen@intel.com>, 
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>, 
	"Mihai =?utf-8?B?RG9uyJt1?=" <mdontu@bitdefender.com>, 
	"=?utf-8?B?TmljdciZb3IgQ8OuyJt1?=" <nicu.citu@icloud.com>, Thara Gopinath <tgopinath@microsoft.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Wei Liu <wei.liu@kernel.org>, 
	Will Deacon <will@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	"=?utf-8?Q?=C8=98tefan_=C8=98icleru?=" <ssicleru@bitdefender.com>, dev@lists.cloudhypervisor.org, 
	kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, 
	virtualization@lists.linux-foundation.org, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024, Micka=C3=ABl Sala=C3=BCn wrote:
> > Actually, potential bad/crazy idea.  Why does the _host_ need to define=
 policy?
> > Linux already knows what assets it wants to (un)protect and when.  What=
's missing
> > is a way for the guest kernel to effectively deprivilege and re-authent=
icate
> > itself as needed.  We've been tossing around the idea of paired VMs+vCP=
Us to
> > support VTLs and SEV's VMPLs, what if we usurped/piggybacked those idea=
s, with a
> > bit of pKVM mixed in?
> >=20
> > Borrowing VTL terminology, where VTL0 is the least privileged, userspac=
e launches
> > the VM at VTL0.  At some point, the guest triggers the deprivileging se=
quence and
> > userspace creates VTL1.  Userpace also provides a way for VTL0 restrict=
 access to
> > its memory, e.g. to effectively make the page tables for the kernel's d=
irect map
> > writable only from VTL1, to make kernel text RO (or XO), etc.  And VTL0=
 could then
> > also completely remove its access to code that changes CR0/CR4.
> >=20
> > It would obviously require a _lot_ more upfront work, e.g. to isolate t=
he kernel
> > text that modifies CR0/CR4 so that it can be removed from VTL0, but tha=
t should
> > be doable with annotations, e.g. tag relevant functions with __magic or=
 whatever,
> > throw them in a dedicated section, and then free/protect the section(s)=
 at the
> > appropriate time.
> >=20
> > KVM would likely need to provide the ability to switch VTLs (or whateve=
r they get
> > called), and host userspace would need to provide a decent amount of th=
e backend
> > mechanisms and "core" policies, e.g. to manage VTL0 memory, teardown (t=
urn off?)
> > VTL1 on kexec(), etc.  But everything else could live in the guest kern=
el itself.
> > E.g. to have CR pinning play nice with kexec(), toss the relevant kexec=
() code into
> > VTL1.  That way VTL1 can verify the kexec() target and tear itself down=
 before
> > jumping into the new kernel.=20
> >=20
> > This is very off the cuff and have-wavy, e.g. I don't have much of an i=
dea what
> > it would take to harden kernel text patching, but keeping the policy in=
 the guest
> > seems like it'd make everything more tractable than trying to define an=
 ABI
> > between Linux and a VMM that is rich and flexible enough to support all=
 the
> > fancy things Linux does (and will do in the future).
>=20
> Yes, we agree that the guest needs to manage its own policy.  That's why
> we implemented Heki for KVM this way, but without VTLs because KVM
> doesn't support them.
>=20
> To sum up, is the VTL approach the only one that would be acceptable for
> KVM? =20

Heh, that's not a question you want to be asking.  You're effectively askin=
g me
to make an authorative, "final" decision on a topic which I am only passing=
ly
familiar with.

But since you asked it... :-)  Probably?

I see a lot of advantages to a VTL/VSM-like approach:

 1. Provides Linux-as-a guest the flexibility it needs to meaningfully adva=
nce
    its security, with the least amount of policy built into the guest/host=
 ABI.

 2. Largely decouples guest policy from the host, i.e. should allow the gue=
st to
    evolve/update it's policy without needing to coordinate changes with th=
e host.

 3. The KVM implementation can be generic enough to be reusable for other f=
eatures.

 4. Other groups are already working on VTL-like support in KVM, e.g. for V=
SM
    itself, and potentially for VMPL/SVSM support.

IMO, #2 is a *huge* selling point.  Not having to coordinate changes across
multiple code bases and/or organizations and/or maintainers is a big win fo=
r
velocity, long term maintenance, and probably the very viability of HEKI.

Providing the guest with the tools to define and implement its own policy m=
eans
end users don't have to way for some third party, e.g. CSPs, to deploy the
accompanying host-side changes, because there are no host-side changes.

And encapsulating everything in the guest drastically reduces the friction =
with
changes in the kernel that interact with hardening, both from a technical a=
nd a
social perspective.  I.e. giving the kernel (near) complete control over it=
s
destiny minimizes the number of moving parts, and will be far, far easier t=
o sell
to maintainers.  I would expect maintainers to react much more favorably to=
 being
handed tools to harden the kernel, as opposed to being presented a set of A=
PIs
that can be used to make the kernel compliant with _someone else's_ vision =
of
what kernel hardening should look like.

E.g. imagine a new feature comes along that requires overriding CR0/CR4 pin=
ning
in a way that doesn't fit into existing policy.  If the VMM is involved in
defining/enforcing the CR pinning policy, then supporting said new feature =
would
require new guest/host ABI and an updated host VMM in order to make the new
feature compatible with HEKI.  Inevitably, even if everything goes smoothly=
 from
an upstreaming perspective, that will result in guests that have to choose =
between
HEKI and new feature X, because there is zero chance that all hosts that ru=
n Linux
as a guest will be updated in advance of new feature X being deployed.

And if/when things don't go smoothly, odds are very good that kernel mainta=
iners
will eventually tire of having to coordinate and negotiate with QEMU and ot=
her
VMMs, and will become resistant to continuing to support/extend HEKI.

> If yes, that would indeed require a *lot* of work for something we're not
> sure will be accepted later on.

Yes and no.  The AWS folks are pursuing VSM support in KVM+QEMU, and SVSM s=
upport
is trending toward the paired VM+vCPU model.  IMO, it's entirely feasible t=
o
design KVM support such that much of the development load can be shared bet=
ween
the projects.  And having 2+ use cases for a feature (set) makes it _much_ =
more
likely that the feature(s) will be accepted.

And similar to what Paolo said regarding HEKI not having a complete story, =
I
don't see a clear line of sight for landing host-defined policy enforcement=
, as
there are many open, non-trivial questions that need answers. I.e. upstream=
ing
HEKI in its current form is also far from a done deal, and isn't guaranteed=
 to
be substantially less work when all is said and done.


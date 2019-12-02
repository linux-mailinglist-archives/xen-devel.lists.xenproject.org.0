Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72510ECF0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 17:19:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iboOJ-0001QO-FD; Mon, 02 Dec 2019 16:17:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PMC0=ZY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iboOI-0001QH-Lm
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 16:17:38 +0000
X-Inumbo-ID: 41923ca2-151f-11ea-a55d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41923ca2-151f-11ea-a55d-bc764e2007e4;
 Mon, 02 Dec 2019 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575303457;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=jLMcKOsCF1PEOuaCPeTWXYvZ2g9+vG4XzFRyUpm3KGU=;
 b=PrQHHv+K1bMAwiGacpAvAH35NTqzj0Tk/FqMRE7NDFtCv8N2LHjq2fnR
 YAD51G9gbfLR/R/ERDmMcJoQaAkbLiJcSdgnyzx4Pe5R8PsZNMtIFEogS
 kZA1BlatR4wUu4GVMc3xk7iSKHqqEUczrW6DaPbhaNCkPhNIYSqQqruhD A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vt6GNCrtaKRKpsgYlC432dlAcqte4BhXKmWL+JaKxxH9trg9q5Y8OUQpjEZBkxBfSPII12r7vz
 oZ+RVr81Ei6MGsRVXkopvrdUfCTC4+KsDQxLsKEXwgUztUC5B2p6Sr38d+pVUqIWyEw0bokv1i
 kiPYMpf0dWCR/gQzX7ggWuNMeY2wdDZk8OF+5uQ0uMoibmg9Ttm4Quvr3ygjpOTds85R8ncEiH
 nJWXAHVdCLRld66za9f2QBJAUsmEpvChiSyjm2xRtkUILdEZXjkTG+RI7mH7t1IXVc83he019k
 C9w=
X-SBRS: 2.7
X-MesageID: 9476591
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,268,1571716800"; d="scan'208,217";a="9476591"
To: Julien Grall <julien.grall.oss@gmail.com>
References: <20191031192804.19928-1-andrew.cooper3@citrix.com>
 <7bd1d625-d501-6ca7-f951-9f42066436bd@arm.com>
 <ebfea524-2ae1-8e83-3217-bc0d84ab902c@citrix.com>
 <CAJ=z9a2p1Pjm5Oadq+eP6YjNpCh6WK-aWosuf-7Z0wqSw6KAag@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <553d989d-7337-f5e3-44d8-a08fde6dac07@citrix.com>
Date: Mon, 2 Dec 2019 16:17:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a2p1Pjm5Oadq+eP6YjNpCh6WK-aWosuf-7Z0wqSw6KAag@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/vcpu: Sanitise VCPUOP_initialise call
 hierachy
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7657412552341354846=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7657412552341354846==
Content-Type: multipart/alternative;
	boundary="------------DE1FC7B0EFB23B83C781D82D"
Content-Language: en-GB

--------------DE1FC7B0EFB23B83C781D82D
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 15/11/2019 15:24, Julien Grall wrote:
> On Fri, 15 Nov 2019, 18:13 Andrew Cooper, <andrew.cooper3@citrix.com
> <mailto:andrew.cooper3@citrix.com>> wrote:
>
>     On 31/10/2019 21:25, Julien Grall wrote:
>     > Hi,
>     >
>     > On 31/10/2019 19:28, Andrew Cooper wrote:
>     >> This code is especially tangled.  VCPUOP_initialise calls into
>     >> arch_initialise_vcpu() which calls back into
>     default_initialise_vcpu() which
>     >> is common code.
>     >>
>     >> This path is actually dead code on ARM, because
>     VCPUOP_initialise is filtered
>     >> out by do_arm_vcpu_op().
>     >>
>     >> The only valid way to start a secondary CPU on ARM is via the
>     PSCI interface.
>     >> The same could in principle be said about INIT-SIPI-SIPI for
>     x86 HVM, if HVM
>     >> guests hadn't already interited a paravirt way of starting CPUs.
>     >>
>     >> Either way, it is quite likely that no future architectures
>     implemented in Xen
>     >> are going to want to use a PV interface, as some standardised
>     (v)CPU bringup
>     >> mechanism will already exist.
>     > I am not sure I agree here. Looking at Linux RISCv code (see [1]
>     and
>     > [2]), it looks like the kernel has to deal with selecting one
>     "lucky"
>     > CPU/hart to deal with the boot and park all the others.
>     >
>     > So it looks like to me there are nothing at the moment on RISCv
>     to do
>     > (v)CPU bring-up. We might be able to use PSCI (although this is
>     an ARM
>     > specific way), but would rather wait and see what RISCv folks
>     come up
>     > with before deciding PV is never going to be used.
>
>     Nothing here prohibits other architectures from using a PV
>     interface if
>     they wish.
>
>
> Well, your commit message and the code movement implies that nobody
> will ever use it.
>
>
>     However, your examples prove my point.  There is an already-agreed way
>     to start RISCv CPUs which is not a PV interface, and therefore is very
>     unlikely to adopted to run differently under Xen.
>
>
> I would not call that a way to start CPUs because AFAICT all CPUs have
> to be brought up together and you can't offline them. This is fairly
> restrictive for a guest so I don't think reusing it would sustainable
> long term.
>
> FWIW, this is exactly what Arm used to have before PSCI.

This reply is not helpful with progressing the patch.

I'm not arguing whether the current RISCV behaviour is great or not.  It
is what it is.

The question at hand is: In some theoretical future where Xen gains
RISCV support, how likely are the Linux RISCV maintainers to take a Xen
specific paravirt startup sequence which does things differently to the
existing sequence which is hypervisor agnostic?

The answer is tantamount to 0, because what does it actually gain you? 
An extra boot protocol to support, which is hypervisor specific, with no
added functionality over the existing hypervisor-neutral one.

I still don't see any convincing argument to suggest that future
architectures may choose to use a Xen specific paravirt start mechanism,
but as already stated, this patch doesn't rule such an interface out.

~Andrew

--------------DE1FC7B0EFB23B83C781D82D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 15/11/2019 15:24, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJ=z9a2p1Pjm5Oadq+eP6YjNpCh6WK-aWosuf-7Z0wqSw6KAag@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div>On Fri, 15 Nov 2019, 18:13 Andrew Cooper, &lt;<a
            href="mailto:andrew.cooper3@citrix.com"
            moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;
          wrote:<br>
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">On
              31/10/2019 21:25, Julien Grall wrote:<br>
              &gt; Hi,<br>
              &gt;<br>
              &gt; On 31/10/2019 19:28, Andrew Cooper wrote:<br>
              &gt;&gt; This code is especially tangled. 
              VCPUOP_initialise calls into<br>
              &gt;&gt; arch_initialise_vcpu() which calls back into
              default_initialise_vcpu() which<br>
              &gt;&gt; is common code.<br>
              &gt;&gt;<br>
              &gt;&gt; This path is actually dead code on ARM, because
              VCPUOP_initialise is filtered<br>
              &gt;&gt; out by do_arm_vcpu_op().<br>
              &gt;&gt;<br>
              &gt;&gt; The only valid way to start a secondary CPU on
              ARM is via the PSCI interface.<br>
              &gt;&gt; The same could in principle be said about
              INIT-SIPI-SIPI for x86 HVM, if HVM<br>
              &gt;&gt; guests hadn't already interited a paravirt way of
              starting CPUs.<br>
              &gt;&gt;<br>
              &gt;&gt; Either way, it is quite likely that no future
              architectures implemented in Xen<br>
              &gt;&gt; are going to want to use a PV interface, as some
              standardised (v)CPU bringup<br>
              &gt;&gt; mechanism will already exist.<br>
              &gt; I am not sure I agree here. Looking at Linux RISCv
              code (see [1] and <br>
              &gt; [2]), it looks like the kernel has to deal with
              selecting one "lucky" <br>
              &gt; CPU/hart to deal with the boot and park all the
              others.<br>
              &gt;<br>
              &gt; So it looks like to me there are nothing at the
              moment on RISCv to do <br>
              &gt; (v)CPU bring-up. We might be able to use PSCI
              (although this is an ARM <br>
              &gt; specific way), but would rather wait and see what
              RISCv folks come up <br>
              &gt; with before deciding PV is never going to be used.<br>
              <br>
              Nothing here prohibits other architectures from using a PV
              interface if<br>
              they wish.<br>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Well, your commit message and the code movement
          implies that nobody will ever use it.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              However, your examples prove my point.  There is an
              already-agreed way<br>
              to start RISCv CPUs which is not a PV interface, and
              therefore is very<br>
              unlikely to adopted to run differently under Xen.</blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">I would not call that a way to start CPUs
          because AFAICT all CPUs have to be brought up together and you
          can't offline them. This is fairly restrictive for a guest so
          I don't think reusing it would sustainable long term.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">FWIW, this is exactly what Arm used to have
          before PSCI.</div>
      </div>
    </blockquote>
    <br>
    This reply is not helpful with progressing the patch.<br>
    <br>
    I'm not arguing whether the current RISCV behaviour is great or
    not.  It is what it is.<br>
    <br>
    The question at hand is: In some theoretical future where Xen gains
    RISCV support, how likely are the Linux RISCV maintainers to take a
    Xen specific paravirt startup sequence which does things differently
    to the existing sequence which is hypervisor agnostic?<br>
    <br>
    The answer is tantamount to 0, because what does it actually gain
    you?  An extra boot protocol to support, which is hypervisor
    specific, with no added functionality over the existing
    hypervisor-neutral one.<br>
    <br>
    I still don't see any convincing argument to suggest that future
    architectures may choose to use a Xen specific paravirt start
    mechanism, but as already stated, this patch doesn't rule such an
    interface out.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------DE1FC7B0EFB23B83C781D82D--


--===============7657412552341354846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7657412552341354846==--


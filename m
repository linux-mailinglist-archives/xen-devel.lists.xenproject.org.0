Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA3C9022
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:44:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFidA-0003Bl-6j; Wed, 02 Oct 2019 17:41:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G8yu=X3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFid8-0003Bg-SB
 for xen-devel@lists.xen.org; Wed, 02 Oct 2019 17:41:38 +0000
X-Inumbo-ID: e1d4d012-e53b-11e9-971c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id e1d4d012-e53b-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570038098;
 h=subject:to:references:from:cc:message-id:date:
 mime-version:in-reply-to;
 bh=m2dH3N0rauDdWBe/u4i1ApnbSIVqobp+Va7UxJJIXjM=;
 b=dstwm94lTqNF8oouTWjX9T+PCBijtChhyu9C85fCUD2yaDMHbQBM/vo7
 HQZbej+50O/E1aJq4cw2k7x/I+FdMpvpCy7k/fS4qVF/JDctYdqjiArLj
 Vb7dusL54K8MclXiRNWL51oUR8pCKSQRTCEzOkXYQpQkUcyo0kt/KkCNw Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4ElSUsRLt+p88LlNWOqmKjDwUU26Z8dDyf2kgqH3HSfD+TWmckDyoqNKL8dGnModmNKo9StRyP
 isgAdQxtkWEgxO/s9VRM76FHokUXHg73TMy36Fm2mJX32EG14xa8DjkC+VkcWYWz7bMZNWKTop
 n/UbdVZDuK2Rim0OvLJt74PP0MpeHo1hlyne/tx2uiFf+TOhNFyRW6qU/YasqEQAaofpJAFtZl
 /9FcGBJTke0KIg5kstAajSiPN4i55+YUVVbUrGuJZl1Au5msmAVHCwFszH1h49zn+SR+lO6N+B
 d0k=
X-SBRS: 2.7
X-MesageID: 6383698
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,249,1566878400"; d="scan'208,217";a="6383698"
To: Chris Brannon <cmb@prgmr.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
References: <aecc7e18-40ff-8bb8-467c-24bfe99ee8f1@prgmr.com>
 <470f5ce1-d43f-a5dd-a00d-e2ec339b06c0@suse.com>
 <8736gb5by4.fsf@cmbmachine.messageid.invalid>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e05593f6-f223-2c7d-d607-ea76c9204f17@citrix.com>
Date: Wed, 2 Oct 2019 18:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8736gb5by4.fsf@cmbmachine.messageid.invalid>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Crash with nested HVM and Linux v5.1+
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
Cc: Jan Beulich <JBeulich@suse.com>, Sarah Newman <srn@prgmr.com>
Content-Type: multipart/mixed; boundary="===============3850887349750647139=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3850887349750647139==
Content-Type: multipart/alternative;
	boundary="------------5BAFB504C136C3FBABE6C437"
Content-Language: en-GB

--------------5BAFB504C136C3FBABE6C437
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 02/10/2019 17:50, Chris Brannon wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>
>> On 21.09.2019 01:14, Sarah Newman wrote:
>>> With nestedhvm=1, the L2 HVM guest is either hanging (Xen 4.8) or
>>> crashing (Xen 4.12.1) the L1 Xen hypervisor with recent versions of
>>> Linux. We
>>> isolated the commit to:
>>>
>>> commit 093ae8f9a86a974c920b613860f1f7fd5bbd70ab
>>> Author: Borislav Petkov <bp@suse.de>
>>> Date:   Thu Apr 12 13:11:36 2018 +0200
>> Thanks for doing the bisection on the Linux side. Would you please also
>> provide the actual data about the L1 Xen crash (i.e. a maximum
>> verbosity L1 log of a debug build of Xen)? It might also turn out
>> helpful if you could provide the corresponding L0 Xen log, assuming you
>> have host access.
> Typescripts are attached.
> typescript-l1.txt contains the log of domain creation on the L1.
> typescript-l0.txt contains both the log of domain creation on the L0,
> and xl dmesg output from the L0.
>
> Both the L0 and L1 are running debug builds of Xen 4.12.1.
>
> -- Chris
> (XEN) traps.c:1576: GPF (0000): ffff82d08031a80f [vmx.c#vmx_msr_read_intercept+0x387/0x3fd] -> ffff82d08037c9f2
> (XEN) traps.c:1576: GPF (0000): ffff82d08031a80f [vmx.c#vmx_msr_read_intercept+0x387/0x3fd] -> ffff82d08037c9f2
> (d2) xs_write(/vm/95f11fc0-b9e7-47ff-8523-bacab35b96b6/rtc/timeoffset): EACCES
> (XEN) d1v1 Unhandled nested vmexit: reason 51
> (XEN) domain_crash called from vvmx.c:2671
> (XEN) Domain 1 (vcpu#1) crashed on cpu#2:

51 is the RDTSCP intercept.  It seems that noone has ever tried
executing a RDTSCP instruction in nested virt yet... which goes to show
how untested this all is.

Can you see about giving this patch a spin?

~Andrew

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index fdf449bfd1..6696bd6240 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2491,6 +2491,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
             nvcpu->nv_vmexit_pending = 1;
         break;
     case EXIT_REASON_RDTSC:
+    case EXIT_REASON_RDTSCP:
         ctrl = __n2_exec_control(v);
         if ( ctrl & CPU_BASED_RDTSC_EXITING )
             nvcpu->nv_vmexit_pending = 1;
@@ -2501,6 +2502,8 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
              * avoiding changing guest_tsc and messing up timekeeping in L1
              */
             msr_split(regs, hvm_get_guest_tsc(v) + get_vvmcs(v,
TSC_OFFSET));
+            if ( exit_reason == EXIT_REASON_RDTSCP )
+                regs->rcx = v->arch.msrs->tsc_aux;
             update_guest_eip();
 
             return 1;


--------------5BAFB504C136C3FBABE6C437
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 02/10/2019 17:50, Chris Brannon
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8736gb5by4.fsf@cmbmachine.messageid.invalid">
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-western">
        <pre class="moz-quote-pre" wrap="">Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com" moz-do-not-send="true">&lt;jbeulich@suse.com&gt;</a> writes:

</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">On 21.09.2019 01:14, Sarah Newman wrote:
</pre>
          <blockquote type="cite" style="color: #000000;">
            <pre class="moz-quote-pre" wrap="">With nestedhvm=1, the L2 HVM guest is either hanging (Xen 4.8) or
crashing (Xen 4.12.1) the L1 Xen hypervisor with recent versions of
Linux. We
isolated the commit to:

commit 093ae8f9a86a974c920b613860f1f7fd5bbd70ab
Author: Borislav Petkov <a class="moz-txt-link-rfc2396E" href="mailto:bp@suse.de" moz-do-not-send="true">&lt;bp@suse.de&gt;</a>
Date:   Thu Apr 12 13:11:36 2018 +0200
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Thanks for doing the bisection on the Linux side. Would you please also
provide the actual data about the L1 Xen crash (i.e. a maximum
verbosity L1 log of a debug build of Xen)? It might also turn out
helpful if you could provide the corresponding L0 Xen log, assuming you
have host access.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Typescripts are attached.
typescript-l1.txt contains the log of domain creation on the L1.
typescript-l0.txt contains both the log of domain creation on the L0,
and xl dmesg output from the L0.

Both the L0 and L1 are running debug builds of Xen 4.12.1.

-- Chris
</pre>
      </div>
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-western">
        <pre class="moz-quote-pre" wrap="">(XEN) traps.c:1576: GPF (0000): ffff82d08031a80f [vmx.c#vmx_msr_read_intercept+0x387/0x3fd] -&gt; ffff82d08037c9f2
(XEN) traps.c:1576: GPF (0000): ffff82d08031a80f [vmx.c#vmx_msr_read_intercept+0x387/0x3fd] -&gt; ffff82d08037c9f2
(d2) xs_write(/vm/95f11fc0-b9e7-47ff-8523-bacab35b96b6/rtc/timeoffset): EACCES
(XEN) d1v1 Unhandled nested vmexit: reason 51
(XEN) domain_crash called from vvmx.c:2671
(XEN) Domain 1 (vcpu#1) crashed on cpu#2:</pre>
      </div>
    </blockquote>
    <br>
    51 is the RDTSCP intercept.  It seems that noone has ever tried
    executing a RDTSCP instruction in nested virt yet... which goes to
    show how untested this all is.<br>
    <br>
    Can you see about giving this patch a spin?<br>
    <br>
    ~Andrew<br>
    <br>
    diff --git a/xen/arch/x86/hvm/vmx/vvmx.c
    b/xen/arch/x86/hvm/vmx/vvmx.c<br>
    index fdf449bfd1..6696bd6240 100644<br>
    --- a/xen/arch/x86/hvm/vmx/vvmx.c<br>
    +++ b/xen/arch/x86/hvm/vmx/vvmx.c<br>
    @@ -2491,6 +2491,7 @@ int nvmx_n2_vmexit_handler(struct
    cpu_user_regs *regs,<br>
                 nvcpu-&gt;nv_vmexit_pending = 1;<br>
             break;<br>
         case EXIT_REASON_RDTSC:<br>
    +    case EXIT_REASON_RDTSCP:<br>
             ctrl = __n2_exec_control(v);<br>
             if ( ctrl &amp; CPU_BASED_RDTSC_EXITING )<br>
                 nvcpu-&gt;nv_vmexit_pending = 1;<br>
    @@ -2501,6 +2502,8 @@ int nvmx_n2_vmexit_handler(struct
    cpu_user_regs *regs,<br>
                  * avoiding changing guest_tsc and messing up
    timekeeping in L1<br>
                  */<br>
                 msr_split(regs, hvm_get_guest_tsc(v) + get_vvmcs(v,
    TSC_OFFSET));<br>
    +            if ( exit_reason == EXIT_REASON_RDTSCP )<br>
    +                regs-&gt;rcx = v-&gt;arch.msrs-&gt;tsc_aux;<br>
                 update_guest_eip();<br>
     <br>
                 return 1;<br>
    <br>
  </body>
</html>

--------------5BAFB504C136C3FBABE6C437--


--===============3850887349750647139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3850887349750647139==--


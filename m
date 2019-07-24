Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2073679
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 20:23:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqLrj-0002Ge-8Y; Wed, 24 Jul 2019 18:19:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ItzJ=VV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hqLri-0002GZ-5F
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 18:19:50 +0000
X-Inumbo-ID: 9de38da4-ae3f-11e9-af47-cb6a43dcc524
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9de38da4-ae3f-11e9-af47-cb6a43dcc524;
 Wed, 24 Jul 2019 18:19:47 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oiS75J2GfS6Xm4GIlO4QUFseu+m9qJdgDZX3WS2DzK9Dfh2EfgBf3jmq+FRd7lB1mFY79H8Ui5
 VMIKvzu/VMJ73qrkEEGvS0krdFD685Wt1gomNTxhguzDG3CmUTcPTAH34Xyleg+KM47zbGQF5J
 ML5UEO0Mu+khf1SlJcRvpkysNuGxLst7np58My0u+X30FvtOjrOPqSUg04DKk9z4gzJlgFe7lR
 4NhFOlCsruwVjkGQdmJK7kAKidu17bgtigu+nU2qytJjpr09nQnvWzkkQiadaoF2cceaBXuNIY
 0ho=
X-SBRS: 2.7
X-MesageID: 3385539
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; d="scan'208,217";a="3385539"
To: Oleg Ginzburg <olevole@olevole.ru>, <xen-devel@lists.xenproject.org>
References: <CAMsb+mYokgvaRip3UBbrcXM0XYC9XqYo5x8Ag5zW-FL4We+PAA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <22f8894a-1064-8386-ca3a-c29ddbff16d8@citrix.com>
Date: Wed, 24 Jul 2019 19:19:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMsb+mYokgvaRip3UBbrcXM0XYC9XqYo5x8Ag5zW-FL4We+PAA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] XenDom0/FreeBSD: guest crash when nested
 virtualization is used
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
Cc: Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5252119532342135637=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5252119532342135637==
Content-Type: multipart/alternative;
	boundary="------------97FDB0FCB771B4A25D9769DE"
Content-Language: en-GB

--------------97FDB0FCB771B4A25D9769DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 24/07/2019 19:02, Oleg Ginzburg wrote:
> Hello maillist,
>
> I use XEN on the FreeBSD platform. Everything worked fine until I
> needed to use nested virtualization (for testing purposes).
>
> After some communication with Roger Pau Monné, maintainer of XEN port
> in FreeBSD ( https://www.freshports.org/emulators/xen-kernel )  it was
> suggested that this might be a common Xen problem and not related to
> FreeBSD.

So nested virt under Xen is in an "almost completely broken and
unusable" state.

Your mileage won't vary very much.  It will tend to be 0.

>
> (d2) Booting from Hard Disk...
> (d2) Booting from 0000:7c00
> (XEN) d2v0 VMLAUNCH error: 0x7
> (XEN) *** Guest State ***
> (XEN) CR0: actual=0x0000000080050033, shadow=0x0000000060000010, gh_mask=ffffffffffffffff
> (XEN) CR4: actual=0x0000000000002050, shadow=0x0000000000000000, gh_mask=fffffffffffff871
> (XEN) CR3 = 0x00000000feffc000
> (XEN) RSP = 0x0000000000000000 (0x0000000000000000)  RIP = 0x000000000000fff0 (0x000000000000fff0)
> (XEN) RFLAGS=0x00010002 (0x00010002)  DR7 = 0x0000000000000400
> (XEN) Sysenter RSP=0000000000000000 CS:RIP=0000:0000000000000000
> (XEN)        sel  attr  limit   base
> (XEN)   CS: f000 0009b 0000ffff 00000000ffff0000
> (XEN)   DS: 0000 00093 0000ffff 0000000000000000
> (XEN)   SS: 0000 00093 0000ffff 0000000000000000
> (XEN)   ES: 0000 00093 0000ffff 0000000000000000
> (XEN)   FS: 0000 00093 0000ffff 0000000000000000
> (XEN)   GS: 0000 00093 0000ffff 0000000000000000
> (XEN) GDTR:            0000ffff 0000000000000000
> (XEN) LDTR: 0000 00082 0000ffff 0000000000000000
> (XEN) IDTR:            0000ffff 0000000000000000
> (XEN)   TR: 0000 0008b 0000ffff 0000000000000000
> (XEN) EFER(VMCS) = 0x0000000000000000  PAT = 0x0000050100070406
> (XEN) PreemptionTimer = 0x00000000  SM Base = 0x00000000
> (XEN) DebugCtl = 0x0000000000000000  DebugExceptions = 0x0000000000000000
> (XEN) Interruptibility = 00000000  ActivityState = 00000000
> (XEN) InterruptStatus = 0000
> (XEN) *** Host State ***
> (XEN) RIP = 0xffff82d08030f8b0 (vmac.c#vmx_asm_vmexit_handler)  RSP = 0xffff8320259bff70

Something is definitely strange in your build of Xen.  vmac.c doesn't
contain the vmexit handler.

> (XEN) CS=e008 SS=0000 DS=0000 ES=0000 FS=0000 GS=0000 TR=e040
> (XEN) FSBase=0000000000000000 GSBase=0000000000000000 TRBase=ffff8320259c2c00
> (XEN) GDTBase=ffff8320259b2000 IDTBase=ffff8320259b6000
> (XEN) CR0=0000000080050033 CR3=000000201bc45000 CR4=00000000003526e0
> (XEN) Sysenter RSP=ffff8320259bffa0 CS:RIP=e008:ffff82d080354420
> (XEN) EFER = 0x0000000000000d01  PAT = 0x0000050100070406
> (XEN) *** Control State ***
> (XEN) PinBased=0000003f CPUBased=b6a1edfa SecondaryExec=000214eb
> (XEN) EntryControls=000011ff ExitControls=002fefff
> (XEN) ExceptionBitmap=00060042 PFECmask=00000000 PFECmatch=00000000
> (XEN) VMEntry: intr_info=8000030d errcode=00000000 ilen=00000000
> (XEN) VMExit: intr_info=00000000 errcode=00000000 ilen=00000005
> (XEN)         reason=00000030 qualification=0000000000000181
> (XEN) IDTVectoring: info=80000b0d errcode=0000f000

The IDTVectoring and VMEntry fields look like we intercepted a page
fault, but are trying to re-inject it without an error code, which is
possibly what hardware is complaining about.

Are you able to instrument the virtual vmentry/exit code to see if this
is the case?

~Andrew

> (XEN) TSC Offset = 0xfff9d10bc60f4ad6  TSC Multiplier = 0x0000000000000000
> (XEN) TPR Threshold = 0x00  PostedIntrVec = 0xf4
> (XEN) EPT pointer = 0x000000207dd3b01e  EPTP index = 0x0000
> (XEN) PLE Gap=00000080 Window=00001000
> (XEN) Virtual processor ID = 0x3540 VMfunc controls = 0000000000000000
> (XEN) domain_crash called from vmcs.c:1777
> (XEN) Domain 2 (vcpu#0) crashed on cpu#6:
> (XEN) ----[ Xen-4.12.0  x86_64  debug=n   Not tainted ]----
> (XEN) CPU:    6
> (XEN) RIP:    f000:[<000000000000fff0>]
> (XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d2v0)
> (XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx: 0000000000000000
> (XEN) rdx: 00000000000206c1   rsi: 0000000000000000   rdi: 0000000000000000
> (XEN) rbp: 0000000000000000   rsp: 0000000000000000   r8:  0000000000000000
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000002050
> (XEN) cr3: 00000000feffc000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: ffff90e74ec00000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: f000
>


--------------97FDB0FCB771B4A25D9769DE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 24/07/2019 19:02, Oleg Ginzburg
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMsb+mYokgvaRip3UBbrcXM0XYC9XqYo5x8Ag5zW-FL4We+PAA@mail.gmail.com">
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-unicode">
        <pre class="moz-quote-pre" wrap="">Hello maillist,

I use XEN on the FreeBSD platform. Everything worked fine until I
needed to use nested virtualization (for testing purposes).

After some communication with Roger Pau Monné, maintainer of XEN port
in FreeBSD ( <a class="moz-txt-link-freetext" href="https://www.freshports.org/emulators/xen-kernel" moz-do-not-send="true">https://www.freshports.org/emulators/xen-kernel</a> )  it was
suggested that this might be a common Xen problem and not related to
FreeBSD.</pre>
      </div>
    </blockquote>
    <br>
    So nested virt under Xen is in an "almost completely broken and
    unusable" state.<br>
    <br>
    Your mileage won't vary very much.  It will tend to be 0.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAMsb+mYokgvaRip3UBbrcXM0XYC9XqYo5x8Ag5zW-FL4We+PAA@mail.gmail.com">
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-unicode">
        <pre class="moz-quote-pre" wrap="">

(d2) Booting from Hard Disk...
(d2) Booting from 0000:7c00
(XEN) d2v0 VMLAUNCH error: 0x7
(XEN) *** Guest State ***
(XEN) CR0: actual=0x0000000080050033, shadow=0x0000000060000010, gh_mask=ffffffffffffffff
(XEN) CR4: actual=0x0000000000002050, shadow=0x0000000000000000, gh_mask=fffffffffffff871
(XEN) CR3 = 0x00000000feffc000
(XEN) RSP = 0x0000000000000000 (0x0000000000000000)  RIP = 0x000000000000fff0 (0x000000000000fff0)
(XEN) RFLAGS=0x00010002 (0x00010002)  DR7 = 0x0000000000000400
(XEN) Sysenter RSP=0000000000000000 CS:RIP=0000:0000000000000000
(XEN)        sel  attr  limit   base
(XEN)   CS: f000 0009b 0000ffff 00000000ffff0000
(XEN)   DS: 0000 00093 0000ffff 0000000000000000
(XEN)   SS: 0000 00093 0000ffff 0000000000000000
(XEN)   ES: 0000 00093 0000ffff 0000000000000000
(XEN)   FS: 0000 00093 0000ffff 0000000000000000
(XEN)   GS: 0000 00093 0000ffff 0000000000000000
(XEN) GDTR:            0000ffff 0000000000000000
(XEN) LDTR: 0000 00082 0000ffff 0000000000000000
(XEN) IDTR:            0000ffff 0000000000000000
(XEN)   TR: 0000 0008b 0000ffff 0000000000000000
(XEN) EFER(VMCS) = 0x0000000000000000  PAT = 0x0000050100070406
(XEN) PreemptionTimer = 0x00000000  SM Base = 0x00000000
(XEN) DebugCtl = 0x0000000000000000  DebugExceptions = 0x0000000000000000
(XEN) Interruptibility = 00000000  ActivityState = 00000000
(XEN) InterruptStatus = 0000
(XEN) *** Host State ***
(XEN) RIP = 0xffff82d08030f8b0 (vmac.c#vmx_asm_vmexit_handler)  RSP = 0xffff8320259bff70</pre>
      </div>
    </blockquote>
    <br>
    Something is definitely strange in your build of Xen.  vmac.c
    doesn't contain the vmexit handler.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAMsb+mYokgvaRip3UBbrcXM0XYC9XqYo5x8Ag5zW-FL4We+PAA@mail.gmail.com">
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-unicode">
        <pre class="moz-quote-pre" wrap="">
(XEN) CS=e008 SS=0000 DS=0000 ES=0000 FS=0000 GS=0000 TR=e040
(XEN) FSBase=0000000000000000 GSBase=0000000000000000 TRBase=ffff8320259c2c00
(XEN) GDTBase=ffff8320259b2000 IDTBase=ffff8320259b6000
(XEN) CR0=0000000080050033 CR3=000000201bc45000 CR4=00000000003526e0
(XEN) Sysenter RSP=ffff8320259bffa0 CS:RIP=e008:ffff82d080354420
(XEN) EFER = 0x0000000000000d01  PAT = 0x0000050100070406
(XEN) *** Control State ***
(XEN) PinBased=0000003f CPUBased=b6a1edfa SecondaryExec=000214eb
(XEN) EntryControls=000011ff ExitControls=002fefff
(XEN) ExceptionBitmap=00060042 PFECmask=00000000 PFECmatch=00000000
(XEN) VMEntry: intr_info=8000030d errcode=00000000 ilen=00000000
(XEN) VMExit: intr_info=00000000 errcode=00000000 ilen=00000005
(XEN)         reason=00000030 qualification=0000000000000181
(XEN) IDTVectoring: info=80000b0d errcode=0000f000</pre>
      </div>
    </blockquote>
    <br>
    The IDTVectoring and VMEntry fields look like we intercepted a page
    fault, but are trying to re-inject it without an error code, which
    is possibly what hardware is complaining about.<br>
    <br>
    Are you able to instrument the virtual vmentry/exit code to see if
    this is the case?<br>
    <br>
    ~Andrew<br>
    <br>
    <blockquote type="cite"
cite="mid:CAMsb+mYokgvaRip3UBbrcXM0XYC9XqYo5x8Ag5zW-FL4We+PAA@mail.gmail.com">
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-unicode">
        <pre class="moz-quote-pre" wrap="">
(XEN) TSC Offset = 0xfff9d10bc60f4ad6  TSC Multiplier = 0x0000000000000000
(XEN) TPR Threshold = 0x00  PostedIntrVec = 0xf4
(XEN) EPT pointer = 0x000000207dd3b01e  EPTP index = 0x0000
(XEN) PLE Gap=00000080 Window=00001000
(XEN) Virtual processor ID = 0x3540 VMfunc controls = 0000000000000000
(XEN) domain_crash called from vmcs.c:1777
(XEN) Domain 2 (vcpu#0) crashed on cpu#6:
(XEN) ----[ Xen-4.12.0  x86_64  debug=n   Not tainted ]----
(XEN) CPU:    6
(XEN) RIP:    f000:[&lt;000000000000fff0&gt;]
(XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d2v0)
(XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx: 0000000000000000
(XEN) rdx: 00000000000206c1   rsi: 0000000000000000   rdi: 0000000000000000
(XEN) rbp: 0000000000000000   rsp: 0000000000000000   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000002050
(XEN) cr3: 00000000feffc000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: ffff90e74ec00000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: f000

</pre>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------97FDB0FCB771B4A25D9769DE--


--===============5252119532342135637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5252119532342135637==--


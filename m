Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDC36F010
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jul 2019 18:44:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hosOZ-0001gW-C9; Sat, 20 Jul 2019 16:39:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RKsO=VR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hosOY-0001gR-6e
 for xen-devel@lists.xenproject.org; Sat, 20 Jul 2019 16:39:38 +0000
X-Inumbo-ID: f40853c6-ab0c-11e9-9894-47104334f88b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f40853c6-ab0c-11e9-9894-47104334f88b;
 Sat, 20 Jul 2019 16:39:34 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GP7T8pwSlhcrPlrzfH61BLkQtekBDmFqk552quVmfJ542erLUspKCfHBmxsYTlXkCZ1BUyYewO
 oskvZEG0rg9m1XDMr9X0Oam1qW2FogV9qZdUU6PS+laVl9HyxjyYNQJ2198yFrwuBWfHVmTUTx
 F7XSSbHNL3+dKXcEqUPefb4nW9ccS04acry+kRsR3XsKu8pydRclbtv7hUsgtuEjXmvIqzxCV8
 xTaXtdz/H9QUpij+/iQZu77Lkfg91EpFmcf75QiL2KJfaO38BbM4WuRRa2U9nOicNXpHqGjW5c
 9p0=
X-SBRS: 2.7
X-MesageID: 3315232
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,287,1559534400"; d="scan'208,217";a="3315232"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>, <xen-devel@lists.xenproject.org>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8afa7ab1-f5cf-e954-f4de-744de851229e@citrix.com>
Date: Sat, 20 Jul 2019 17:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6566594344913505582=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6566594344913505582==
Content-Type: multipart/alternative;
	boundary="------------B69C5BBFEF481DEB30F94167"
Content-Language: en-GB

--------------B69C5BBFEF481DEB30F94167
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 19/07/2019 20:31, Roman Shaposhnik wrote:
> Hi!
>
> we're using Xen on Advantech ARK-2250 Embedded Box PC:
>     https://www.elmark.com.pl/web/uploaded/karty_produktow/advantech/ark-2250l/ark-2250l_instrukcja-uzytkownika.pdf
>
> After upgrading to Xen 4.12.0 from 4.11.0 we now have to utilize  iommu=no-igfx
> workaround as per:
>      https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#iommu
>
> Without the workaround the screen appears to be garbled with colored
> static noise and the following message keeps showing up:
> (XEN) printk: 26235 messages suppressed.
> (XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault addr
> 8e43c000, iommu reg = ffff82c00021d000
> (XEN) printk: 26303 messages suppressed.
> (XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault addr
> 8e2c6000, iommu reg = ffff82c00021d000
>
> Once iommu=no-igfx is applied the box can boot fine.
>
> At the end of this email, you can see a full log of the box booting
> all the way into Dom0 with iommu=no-igfx applied. I am also attaching
> similar log without no-igfx
>
> Please let me know if you need any more information to help us diagnose this.

This will be a consequence of trying to remove various pieces of
stupidity with the preexisting IOMMU logic, in an attempt to unify the
PV and PVH paths.

As for the symptoms you're seeing, that is because the GPU is not being
given access to the RAM stolen for graphics purposes.

Picking the log apart:

(XEN) EFI RAM map:
(XEN)  0000000000000000 - 0000000000058000 (usable)
(XEN)  0000000000058000 - 0000000000059000 (reserved)
(XEN)  0000000000059000 - 000000000009f000 (usable)
(XEN)  000000000009f000 - 00000000000a0000 (reserved)
(XEN)  0000000000100000 - 000000008648a000 (usable)
(XEN)  000000008648a000 - 000000008648b000 (ACPI NVS)
(XEN)  000000008648b000 - 00000000864b5000 (reserved)
(XEN)  00000000864b5000 - 000000008c224000 (usable)
(XEN)  000000008c224000 - 000000008c528000 (reserved)
(XEN)  000000008c528000 - 000000008c736000 (usable)
(XEN)  000000008c736000 - 000000008cea7000 (ACPI NVS)
(XEN)  000000008cea7000 - 000000008d2ff000 (reserved)
(XEN)  000000008d2ff000 - 000000008d300000 (usable)
(XEN)  000000008d300000 - 000000008d400000 (reserved)
(XEN)  00000000e0000000 - 00000000f0000000 (reserved)
(XEN)  00000000fe000000 - 00000000fe011000 (reserved)
(XEN)  00000000fec00000 - 00000000fec01000 (reserved)
(XEN)  00000000fee00000 - 00000000fee01000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 000000016e000000 (usable)
...
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) [VT-D]  RMRR address range 8d800000..8fffffff not in reserved memory; need "iommu_inclusive_mapping=1"?
(XEN) Switched to APIC driver x2apic_cluster.
...
(XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault addr 8e480000, iommu reg = ffff82c00021d000
(XEN) [VT-D]DMAR: reason 06 - PTE Read access is not set
(XEN) [VT-D]INTR-REMAP: Request device [0000:f0:1f.0] fault index 0, iommu reg = ffff82c00021f000
(XEN) [VT-D]INTR-REMAP: reason 22 - Present field in the IRTE entry is clear


The RMRR identified is a hole in the e820, and the range which is
causing IOMMU faults.  Clearly it isn't being set up correctly.

First of all, can you check what effect booting with
iommu_inclusive_mapping=1 has please?  While at it, iommu=debug would
also be helpful.

Back to the log.  Strictly speaking, this is a violation of the VT-d
spec.  Section 8.4 Reserved Memory Region Reporting Structure says:

"BIOS must report the RMRR reported memory addresses as reserved (or as
EFI runtime) in the system memory map returned through methods such as
INT15, EFI GetMemoryMap etc."

However, Xen's logic here is very broken, and in need of fixing.

For that message, it only checks the first and last address for being
reserved, not the entire region, which will give it plenty of false
negatives.

For RMRRs themselves, system firmware is well known for abiding by the
spec [citation needed], but an RMRR must be honoured, because the entire
purpose of them is to state "this device won't function without access
to this area".

An RMRR in a hole, while a violation of the spec, is obviously fine to
use in practice, so we should just accept it and stop complaining.

OTOH, RMRRs which hit other memory (particularly RAM) need more care,
and probably want to force override the e820 to reserved.  Nothing good
will come from trusting the e820 over the DMAR table here, seeing as
there is clearly an error somewhere in the firmware-provided information.

However - I'm struggling to locate anywhere which actually walks dom0's
RMRR list and inserts them into the IOMMU.  Anyone got any hints?

~Andrew

--------------B69C5BBFEF481DEB30F94167
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 19/07/2019 20:31, Roman Shaposhnik
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi!

we're using Xen on Advantech ARK-2250 Embedded Box PC:
    <a class="moz-txt-link-freetext" href="https://www.elmark.com.pl/web/uploaded/karty_produktow/advantech/ark-2250l/ark-2250l_instrukcja-uzytkownika.pdf">https://www.elmark.com.pl/web/uploaded/karty_produktow/advantech/ark-2250l/ark-2250l_instrukcja-uzytkownika.pdf</a>

After upgrading to Xen 4.12.0 from 4.11.0 we now have to utilize  iommu=no-igfx
workaround as per:
     <a class="moz-txt-link-freetext" href="https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#iommu">https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#iommu</a>

Without the workaround the screen appears to be garbled with colored
static noise and the following message keeps showing up:
(XEN) printk: 26235 messages suppressed.
(XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault addr
8e43c000, iommu reg = ffff82c00021d000
(XEN) printk: 26303 messages suppressed.
(XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault addr
8e2c6000, iommu reg = ffff82c00021d000

Once iommu=no-igfx is applied the box can boot fine.

At the end of this email, you can see a full log of the box booting
all the way into Dom0 with iommu=no-igfx applied. I am also attaching
similar log without no-igfx

Please let me know if you need any more information to help us diagnose this.</pre>
    </blockquote>
    <br>
    This will be a consequence of trying to remove various pieces of
    stupidity with the preexisting IOMMU logic, in an attempt to unify
    the PV and PVH paths.<br>
    <br>
    As for the symptoms you're seeing, that is because the GPU is not
    being given access to the RAM stolen for graphics purposes.<br>
    <br>
    Picking the log apart:<br>
    <br>
    <pre>(XEN) EFI RAM map:
(XEN)  0000000000000000 - 0000000000058000 (usable)
(XEN)  0000000000058000 - 0000000000059000 (reserved)
(XEN)  0000000000059000 - 000000000009f000 (usable)
(XEN)  000000000009f000 - 00000000000a0000 (reserved)
(XEN)  0000000000100000 - 000000008648a000 (usable)
(XEN)  000000008648a000 - 000000008648b000 (ACPI NVS)
(XEN)  000000008648b000 - 00000000864b5000 (reserved)
(XEN)  00000000864b5000 - 000000008c224000 (usable)
(XEN)  000000008c224000 - 000000008c528000 (reserved)
(XEN)  000000008c528000 - 000000008c736000 (usable)
(XEN)  000000008c736000 - 000000008cea7000 (ACPI NVS)
(XEN)  000000008cea7000 - 000000008d2ff000 (reserved)
(XEN)  000000008d2ff000 - 000000008d300000 (usable)
(XEN)  000000008d300000 - 000000008d400000 (reserved)
(XEN)  00000000e0000000 - 00000000f0000000 (reserved)
(XEN)  00000000fe000000 - 00000000fe011000 (reserved)
(XEN)  00000000fec00000 - 00000000fec01000 (reserved)
(XEN)  00000000fee00000 - 00000000fee01000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 000000016e000000 (usable)
...
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) [VT-D]  RMRR address range 8d800000..8fffffff not in reserved memory; need "iommu_inclusive_mapping=1"?
(XEN) Switched to APIC driver x2apic_cluster.
...
(XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault addr 8e480000, iommu reg = ffff82c00021d000
(XEN) [VT-D]DMAR: reason 06 - PTE Read access is not set
(XEN) [VT-D]INTR-REMAP: Request device [0000:f0:1f.0] fault index 0, iommu reg = ffff82c00021f000
(XEN) [VT-D]INTR-REMAP: reason 22 - Present field in the IRTE entry is clear
</pre>
    <br>
    The RMRR identified is a hole in the e820, and the range which is
    causing IOMMU faults.  Clearly it isn't being set up correctly.<br>
    <br>
    First of all, can you check what effect booting with
    iommu_inclusive_mapping=1 has please?  While at it, iommu=debug
    would also be helpful.<br>
    <br>
    Back to the log.  Strictly speaking, this is a violation of the VT-d
    spec.  Section 8.4 Reserved Memory Region Reporting Structure says:<br>
    <br>
    "BIOS must report the RMRR reported memory addresses as reserved (or
    as EFI runtime) in the system memory map returned through methods
    such as INT15, EFI GetMemoryMap etc."<br>
    <br>
    However, Xen's logic here is very broken, and in need of fixing.<br>
    <br>
    For that message, it only checks the first and last address for
    being reserved, not the entire region, which will give it plenty of
    false negatives.<br>
    <br>
    For RMRRs themselves, system firmware is well known for abiding by
    the spec [citation needed], but an RMRR must be honoured, because
    the entire purpose of them is to state "this device won't function
    without access to this area".<br>
    <br>
    An RMRR in a hole, while a violation of the spec, is obviously fine
    to use in practice, so we should just accept it and stop
    complaining.<br>
    <br>
    OTOH, RMRRs which hit other memory (particularly RAM) need more
    care, and probably want to force override the e820 to reserved. 
    Nothing good will come from trusting the e820 over the DMAR table
    here, seeing as there is clearly an error somewhere in the
    firmware-provided information.<br>
    <br>
    However - I'm struggling to locate anywhere which actually walks
    dom0's RMRR list and inserts them into the IOMMU.  Anyone got any
    hints?<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------B69C5BBFEF481DEB30F94167--


--===============6566594344913505582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6566594344913505582==--


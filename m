Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDMMFLPEgmkpaAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 05:01:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F268E172F
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 05:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219825.1528678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnU4b-000777-K4; Wed, 04 Feb 2026 04:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219825.1528678; Wed, 04 Feb 2026 04:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnU4b-000757-HM; Wed, 04 Feb 2026 04:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1219825;
 Wed, 04 Feb 2026 04:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=juaX=AI=gmail.com=alumulti@srs-se1.protection.inumbo.net>)
 id 1vnU4Z-000751-Qh
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 04:01:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b78d884-017e-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 05:00:57 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-65939428896so2143346a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 20:00:56 -0800 (PST)
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
X-Inumbo-ID: 1b78d884-017e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770177655; cv=none;
        d=google.com; s=arc-20240605;
        b=J+dQagZSghVKGtnE5vPrzZJG4pkk/Ab0Np/ntz76IHSeTQ32Yc2L6dpmqmAPWWbBny
         Ql12xpbVX1fFn97wIgRJyLaT0PyDZoNjiiKye1fxqsnQF70S763LWHUJhvCzXS1Tnfrl
         GQUktvpwAJpJtKH7CVA+xEpqQfkbCEa1C9PMUxF3+j+u1N29dEMY/yHpIUh930lQpxVM
         EgxtxnN2cixl+stFqWE5zjolMIe4haasyrlZgIj978bAS8DeV85hMO5KbWjA3pj5shs4
         FH+7nWmRsTUX+x3Dzas8EJWmhScnkWAq3gw6H5q5P0TzBvjrMqldP8ZciR6gXNcbgr5T
         QLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VWe18zpsOHVAr/iJ0qLTiACj+H5WdI14QteHDAWXGx4=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=Jl57dmtScmI8RBBqGOy46NWTwBYLTdoVYpMhVh2S1MVRFE2svXwAotw+Gp0oXm2IJV
         kmO1AurZvrS7DmFhcc1qG4EafkUeALUFD3wcuDF3c3fv/xMCmDXdoE9rXeZHd+STcXVV
         OIgQ2bDMuG0UupEqPNjB34YCMbLlbKmdKSx2/MfJ2c8ArRl0Bw1q7zpnVnNR66zHMJyn
         Moi5IbCo+mhs+XceWUYiJZppx+BnOZ6nyFSdp5GDr7SqtyJdfBtUjNDvW2M7RjaW+pl5
         VS/fBw+xChJsjR0OrzKEtxgcMo1nuvTMOA95OntYKg1XRtwwqF2dYXC1U2RjaHdczGlz
         M4QQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770177655; x=1770782455; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VWe18zpsOHVAr/iJ0qLTiACj+H5WdI14QteHDAWXGx4=;
        b=TozS26AqSZ/V0x5jAl2onlVZrCm2wiYSGx0shx/FLa5FxOIExjUKYeAEvSxvnmdEeT
         DtRMckrQ/oche/thfq7AK3sVjTYE2i2vv04UfYIPov1Ca6hySpIBnRDhSeE4C3mvBNct
         Bao6B2pxlJ6wCq3gUUeIRL2A619SGoszeN0XBo3S6lKjgJ9G/OCJ7QFbhCRVeLdPmN7A
         iIO2rMzAevHpMA57j9hhszGIHfqF5OKsrXcbEJ1kaj57PwlniZFOAdnM0mzL8lT5J3WE
         c/8hojzO+er+5kUt2OAwjXzDe7t4gCBd1I4JDJ10LqIC5NHjMqKBVSH+zHXG1vOhZsu0
         gNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177655; x=1770782455;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWe18zpsOHVAr/iJ0qLTiACj+H5WdI14QteHDAWXGx4=;
        b=Xndp7Dt94mpgsUavZjslYOpxWsvAs1dGBnDjBniczCIxIU4HlEwnKtTGFOHA4T5azK
         XVu+YLVabC4lhDm8ocpnLNqCJsoH5GIa1B0pD5h0NhR4BmeBg8TqdvF6MwmGAjBTNUcH
         oKAUziNmkPVHvZwU0mwFRYq2kQQvp36UzSzjOf6b1f1b3CTtHI1DWPo7OffSGoWxIdMW
         mZzYN5qhoRSr/wcuiDfUbqwk3tPRSFO8oeIRDhtgkQ70aZDDNKHzYKrTaaNZi4nA2Rub
         5So3nH0Uh2PSgkwaYjUgkDc6gagxst4qmBhU2uzLzUXqyCq2QY2bczrwCD6+eGrDnwAK
         5XXA==
X-Gm-Message-State: AOJu0Yz4FqHMamS05fMDDQKI9dHeP7cZb/Yj6q0g9nrvFVcbTjAhU/Lj
	J8mZJ2RULHBt9oBImS1g4NJl6qcGoJsfJ0M+Gc6DLvOPnsS4SQpmn/s97B6xbZJ/U7eaxlqD/rK
	vQ+B2jxabJ7NQK/dEle4ecx799yjknK0OgQDm
X-Gm-Gg: AZuq6aJ9wPW2vorBbq5SnqWD/VbftQofhzCuN83w2jPwGGrIc1YvTbRWtMp/mDYpXAz
	GPWjPm86y9EZflxAwXmmOrmETC6iK7NbRp+n14U6XTL0I7UBu9d9m6M40K5SExAO7BJbpht1fyP
	Jioc8wbO51kg6GNOi+h8t2HUZ75Z6dLsiRtsyZDht9/Sk93s14rUIxQexe7DFTm7wZmN8MuxnHs
	w8k7+Hk1amojE1KnFMcOwWOoDahdpUgy0Y3NdVuBIXG3LTwrJo8XPdY3x5yjFfff2kDsX3+5A==
X-Received: by 2002:a17:907:2d94:b0:b7f:f862:df26 with SMTP id
 a640c23a62f3a-b8e9f054a77mr117457366b.14.1770177655347; Tue, 03 Feb 2026
 20:00:55 -0800 (PST)
MIME-Version: 1.0
From: Alap A <alumulti@gmail.com>
Date: Wed, 4 Feb 2026 09:30:44 +0530
X-Gm-Features: AZwV_QhihaT8AEYZE7eUZXyEljIfxWUVK9gMryDJ8aUy0r_CvnTJ_H1WbZLHD0g
Message-ID: <CAE16M+jp_9JXJVX4QLqNL_-FDO-HvSdT=eZR6ZhJNrF0OX2sVg@mail.gmail.com>
Subject: [ARM64][Raspberry Pi 5][RP1] Dom0 firmware clocks + RP1 OF node
 missing under Xen, VC4/DRM never probes
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000561ecf0649f79aea"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alumulti@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,107c000000:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,59.156.158.192:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alumulti@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F268E172F
X-Rspamd-Action: no action

--000000000000561ecf0649f79aea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Xen Developers,

I am working on Xen bring-up on a Raspberry Pi 5 (BCM2712 + RP1 over PCIe)
and am stuck with Dom0 firmware clocks, RP1, and VC4/DRM not probing
correctly. I am hoping for guidance on the *intended DT/Xen model for RP1
and Raspberry Pi firmware devices under Xen*.
Setup

   -

   Board: Raspberry Pi 5 (BCM2712, RP1 southbridge over PCIe)
   -

   Xen: 4.17.0 (xen-troops build)
   -

   Dom0 kernel:
   -

      Linux 6.19.0-rc5 (mainline)
      -

      Also tested Raspberry Pi downstream 6.6
      -

   Bootloader: U-Boot
   -

   Goal: Dom0 owns display/graphics; DomU gets a virtual display

Problem Summary

Dom0 never gets /dev/dri. The VC4/V3D/HVS DRM stack fails due to missing
clocks/firmware and RP1 not binding.

Key Dom0 dmesg errors:

raspberrypi-clk soc@107c000000:firmware:clocks: probe with driver
raspberrypi-clk failed with error -22
platform 1002000000.v3d: deferred probe pending: platform: supplier
soc@107c000000:firmware:clocks not ready
vc4_hvs 107c580000.hvs: Couldn't get core clock
vc4-drm axi:gpu: failed to bind 107c580000.hvs (ops vc4_hvs_ops): -2
rp1_pci 0002:01:00.0: Missing of_node for device
rp1_pci 0002:01:00.0: probe with driver rp1_pci failed with error -22

As a result:

   -

   raspberrypi-clk never binds
   -

   firmware clock/reset providers don=E2=80=99t come up
   -

   RP1 PCI device has no OF node
   -

   VC4 DRM never probes =E2=86=92 no /dev/dri

Device Tree / Overlay DetailsXen DT Overlay

I am using a Xen DT overlay based on xen-troops that enables HDMI, V3D,
firmware, clocks, reset, vcio, and assigns devices without IOMMU. This
overlay relies heavily on symbol fixups (__fixups__) and target =3D
<0xffffffff> fragments.

Excerpt:

   -

   Enables:
   -

      hdmi0, hdmi1, v3d, vc4, hvs, pixelvalve*
      -

      firmware, firmware_clocks, reset, vcio
      -

      rp1_clocks, bcm_reset, pcie_rescal
      -

   Uses xen,force-assign-without-iommu on most nodes

(Full file: bcm2712-raspberrypi5-xen.dtso)
HDMI / Dom0 Passthrough Overlay

This overlay sets up /chosen multiboot nodes, UART for Xen console, and
forces PCIe assignment.

Key parts:

dom0 {
  compatible =3D "multiboot,kernel\0multiboot,module";
  reg =3D <0x8000000 0x20000000 0x00 0x2000000>;
};

(Full file: hdmi-passthrough-dom0.dtso)
Boot Logs

Full Xen + Dom0 boot logs showing:

   -

   raspberrypi-clk failing with -EINVAL
   -

   rp1_pci missing of_node
   -

   VC4/HVS/V3D deferring and timing out

(Full log: bootlogs3.txt)
Observations

   1.

   Firmware node exists and is enabled in the DT passed to Dom0:

   /soc@107c000000/firmware {
       compatible =3D "raspberrypi,bcm2835-firmware", "simple-mfd";
       clocks { compatible =3D "raspberrypi,firmware-clocks"; status =3D "o=
kay"; };
       reset  { compatible =3D "raspberrypi,firmware-reset";  status =3D "o=
kay"; };
       vcio   { compatible =3D "raspberrypi,vcio";            status =3D "o=
kay"; };
   };

   Despite this, raspberrypi-clk fails probing very early with -22.
   2.

   RP1 enumerates correctly on PCIe:

   0002:01:00.0 Ethernet controller: Raspberry Pi Ltd RP1 PCIe 2.0
South Bridge [1de4:0001]

   But Linux reports:

   rp1_pci ... Missing of_node for device

   Which prevents:
   -

      rp1-clk
      -

      GPIO
      -

      reset
      -

      HDMI PHY
      -

      downstream display pipeline
      3.

   I attempted U-Boot DT overlays to attach an OF node at:

   /axi/pcie@1000120000/pci@0,0/dev@0,0

   but overlays frequently fail with:

   FDT_ERR_NOTFOUND

   unless I rely on symbol-based fixups.

Questions

   1.

   *What is the intended DT model for RP1 under Xen on Raspberry Pi 5?*
   -

      Should RP1 be represented as a proper OF node under the PCI endpoint
      in the Xen DT?
      -

      Or is Xen expected to synthesize this mapping internally?
      2.

   *Is raspberrypi,firmware-clocks supported in Dom0 under Xen on Pi 5?*
   -

      The driver probes but returns -EINVAL even when the DT node exists
      and is enabled.
      3.

   *Are there known patches/branches for Xen or DT that enable VC4/DRM on
   Pi 5?*
   -

      Specifically for firmware clocks, RP1, and HVS/V3D dependencies.

Reproduction Summary

Boot flow:

   1.

   U-Boot loads bcm2712-rpi-5-b.dtb
   2.

   Applies bcm2712-raspberrypi5-xen.dtbo
   3.

   Applies hdmi-passthrough-dom0.dtbo
   4.

   Boots Xen
   5.

   Loads Dom0 kernel as multiboot module

Result: Dom0 boots, but RP1 and firmware clocks do not bind, so VC4/DRM
never comes up.
------------------------------

Any guidance on the *correct DT/Xen integration model for BCM2712/RP1*
would be greatly appreciated. If there is a reference DT, patch series, or
recommended branch, I=E2=80=99d be happy to test and report back.

Best regards,
Alap

--000000000000561ecf0649f79aea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hello Xen Developers,</p><p>I am working on Xen bring-u=
p on a Raspberry Pi 5 (BCM2712 + RP1 over PCIe) and am stuck with Dom0 firm=
ware clocks, RP1, and VC4/DRM not probing correctly. I am hoping for guidan=
ce on the <strong>intended DT/Xen model for RP1 and Raspberry Pi firmware d=
evices under Xen</strong>.</p><h2>Setup</h2><ul><li><p>Board: Raspberry Pi =
5 (BCM2712, RP1 southbridge over PCIe)</p></li><li><p>Xen: 4.17.0 (xen-troo=
ps build)</p></li><li><p>Dom0 kernel:</p><ul><li><p>Linux 6.19.0-rc5 (mainl=
ine)</p></li><li><p>Also tested Raspberry Pi downstream 6.6</p></li></ul></=
li><li><p>Bootloader: U-Boot</p></li><li><p>Goal: Dom0 owns display/graphic=
s; DomU gets a virtual display</p></li></ul><h2>Problem Summary</h2><p>Dom0=
 never gets <code>/dev/dri</code>. The VC4/V3D/HVS DRM stack fails due to m=
issing clocks/firmware and RP1 not binding.</p><p>Key Dom0 dmesg errors:</p=
><pre><code>raspberrypi-clk soc@107c000000:firmware:clocks: probe with driv=
er raspberrypi-clk failed with error -22
platform 1002000000.v3d: deferred probe pending: platform: supplier soc@107=
c000000:firmware:clocks not ready
vc4_hvs 107c580000.hvs: Couldn&#39;t get core clock
vc4-drm axi:gpu: failed to bind 107c580000.hvs (ops vc4_hvs_ops): -2
rp1_pci 0002:01:00.0: Missing of_node for device
rp1_pci 0002:01:00.0: probe with driver rp1_pci failed with error -22
</code></pre><p>As a result:</p><ul><li><p><code>raspberrypi-clk</code> nev=
er binds</p></li><li><p>firmware clock/reset providers don=E2=80=99t come u=
p</p></li><li><p>RP1 PCI device has no OF node</p></li><li><p>VC4 DRM never=
 probes =E2=86=92 no <code>/dev/dri</code></p></li></ul><h2>Device Tree / O=
verlay Details</h2><h3>Xen DT Overlay</h3><p>I am using a Xen DT overlay ba=
sed on xen-troops that enables HDMI, V3D, firmware, clocks, reset, vcio, an=
d assigns devices without IOMMU. This overlay relies heavily on symbol fixu=
ps (<code>__fixups__</code>) and <code>target =3D &lt;0xffffffff&gt;</code>=
 fragments.</p><p>Excerpt:</p><ul><li><p>Enables:</p><ul><li><p><code>hdmi0=
</code>, <code>hdmi1</code>, <code>v3d</code>, <code>vc4</code>, <code>hvs<=
/code>, <code>pixelvalve*</code></p></li><li><p><code>firmware</code>, <cod=
e>firmware_clocks</code>, <code>reset</code>, <code>vcio</code></p></li><li=
><p><code>rp1_clocks</code>, <code>bcm_reset</code>, <code>pcie_rescal</cod=
e></p></li></ul></li><li><p>Uses <code>xen,force-assign-without-iommu</code=
> on most nodes</p></li></ul><p>(Full file: <code>bcm2712-raspberrypi5-xen.=
dtso</code>)</p><h3>HDMI / Dom0 Passthrough Overlay</h3><p>This overlay set=
s up <code>/chosen</code> multiboot nodes, UART for Xen console, and forces=
 PCIe assignment.</p><p>Key parts:</p><pre><code>dom0 {
  compatible =3D &quot;multiboot,kernel\0multiboot,module&quot;;
  reg =3D &lt;0x8000000 0x20000000 0x00 0x2000000&gt;;
};
</code></pre><p>(Full file: <code>hdmi-passthrough-dom0.dtso</code>)</p><h3=
>Boot Logs</h3><p>Full Xen + Dom0 boot logs showing:</p><ul><li><p><code>ra=
spberrypi-clk</code> failing with <code>-EINVAL</code></p></li><li><p><code=
>rp1_pci</code> missing <code>of_node</code></p></li><li><p>VC4/HVS/V3D def=
erring and timing out</p></li></ul><p>(Full log: <code>bootlogs3.txt</code>=
)</p><h2>Observations</h2><ol><li><p>Firmware node exists and is enabled in=
 the DT passed to Dom0:</p><pre><code>/soc@107c000000/firmware {
    compatible =3D &quot;raspberrypi,bcm2835-firmware&quot;, &quot;simple-m=
fd&quot;;
    clocks { compatible =3D &quot;raspberrypi,firmware-clocks&quot;; status=
 =3D &quot;okay&quot;; };
    reset  { compatible =3D &quot;raspberrypi,firmware-reset&quot;;  status=
 =3D &quot;okay&quot;; };
    vcio   { compatible =3D &quot;raspberrypi,vcio&quot;;            status=
 =3D &quot;okay&quot;; };
};
</code></pre><p>Despite this, <code>raspberrypi-clk</code> fails probing ve=
ry early with <code>-22</code>.</p></li><li><p>RP1 enumerates correctly on =
PCIe:</p><pre><code>0002:01:00.0 Ethernet controller: Raspberry Pi Ltd RP1 =
PCIe 2.0 South Bridge [1de4:0001]
</code></pre><p>But Linux reports:</p><pre><code>rp1_pci ... Missing of_nod=
e for device
</code></pre><p>Which prevents:</p><ul><li><p>rp1-clk</p></li><li><p>GPIO</=
p></li><li><p>reset</p></li><li><p>HDMI PHY</p></li><li><p>downstream displ=
ay pipeline</p></li></ul></li><li><p>I attempted U-Boot DT overlays to atta=
ch an OF node at:</p><pre><code>/axi/pcie@1000120000/pci@0,0/dev@0,0
</code></pre><p>but overlays frequently fail with:</p><pre><code>FDT_ERR_NO=
TFOUND
</code></pre><p>unless I rely on symbol-based fixups.</p></li></ol><h2>Ques=
tions</h2><ol><li><p><strong>What is the intended DT model for RP1 under Xe=
n on Raspberry Pi 5?</strong></p><ul><li><p>Should RP1 be represented as a =
proper OF node under the PCI endpoint in the Xen DT?</p></li><li><p>Or is X=
en expected to synthesize this mapping internally?</p></li></ul></li><li><p=
><strong>Is <code>raspberrypi,firmware-clocks</code> supported in Dom0 unde=
r Xen on Pi 5?</strong></p><ul><li><p>The driver probes but returns <code>-=
EINVAL</code> even when the DT node exists and is enabled.</p></li></ul></l=
i><li><p><strong>Are there known patches/branches for Xen or DT that enable=
 VC4/DRM on Pi 5?</strong></p><ul><li><p>Specifically for firmware clocks, =
RP1, and HVS/V3D dependencies.</p></li></ul></li></ol><h2>Reproduction Summ=
ary</h2><p>Boot flow:</p><ol><li><p>U-Boot loads <code>bcm2712-rpi-5-b.dtb<=
/code></p></li><li><p>Applies <code>bcm2712-raspberrypi5-xen.dtbo</code></p=
></li><li><p>Applies <code>hdmi-passthrough-dom0.dtbo</code></p></li><li><p=
>Boots Xen</p></li><li><p>Loads Dom0 kernel as multiboot module</p></li></o=
l><p>Result: Dom0 boots, but RP1 and firmware clocks do not bind, so VC4/DR=
M never comes up.</p><hr><p>Any guidance on the <strong>correct DT/Xen inte=
gration model for BCM2712/RP1</strong> would be greatly appreciated. If the=
re is a reference DT, patch series, or recommended branch, I=E2=80=99d be h=
appy to test and report back.</p><p>Best regards,<br>Alap</p></div>

--000000000000561ecf0649f79aea--


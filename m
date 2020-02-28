Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E57174150
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 22:12:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7msA-0007Bb-8J; Fri, 28 Feb 2020 21:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sa46=4Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7ms8-0007BW-49
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 21:08:36 +0000
X-Inumbo-ID: 7a8e83b4-5a6e-11ea-b472-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a8e83b4-5a6e-11ea-b472-bc764e2007e4;
 Fri, 28 Feb 2020 21:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582924114;
 h=to:from:subject:cc:message-id:date:mime-version;
 bh=/43vGK7HgdlABF7dH5mzQjXrhXhVbCYiJ5Cfot1rUKc=;
 b=LknMvu325R93oDWFhoen73u3rP0EkjZP+idj9c/3H97KDd23/MOgn9W2
 e7mYOMAdZ4ZhAXWtGv4HH1C3D/w6gyYJmpmgIiv8AH1lanIxDXsBNKhi/
 ok7/FKIf18mZHYfV6OPQFfoHxzWU16/dkb4XIzXTl7BJAWWJYdWVjfQ2q s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /2tl9NASF/Fvm/Mwx8YewdpOEeb3JdN9vAncwUBGX7RhJCfwjbH9v/mt66a1j+ifvnwIeNUNSI
 qbI+DCy6XaBZudnynf6WH+5bwkQDvd5iakKRX1qfV3Omu/A5TbIc5X8/tboqSFH5l7aJvkb+g7
 5irbW+YwmtbgddA2MTaE9UN4Gm9JCE6E2FMMdWybj15+3N1ANmmU3ztmKHVhhBF7gkAVhnf768
 lpS59PPDQ8QWVNmtzkVLeyx9aKBJNXaTytJXeShO4M3T9h+sKokSlJSTzr/MzgctFlRFAQ/rdF
 brA=
X-SBRS: 2.7
X-MesageID: 13823952
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,497,1574139600"; d="scan'208,217";a="13823952"
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f189462f-702f-0726-9b3c-c6fd1fec8407@citrix.com>
Date: Fri, 28 Feb 2020 21:08:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: [Xen-devel] PVH dom0 construction timeout
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8707818123073687485=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8707818123073687485==
Content-Type: multipart/alternative;
	boundary="------------708376CD82EC3A973D0815E9"
Content-Language: en-GB

--------------708376CD82EC3A973D0815E9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

It turns out that PVH dom0 construction doesn't work so well on a
2-socket Rome system...

(XEN) NX (Execute Disable) protection active

(XEN) *** Building a PVH Dom0 ***

(XEN) Watchdog timer detects that CPU0 is stuck!

(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----

(XEN) CPU:    0

(XEN) RIP:    e008:[<ffff82d08029a8fd>] page_get_ram_type+0x58/0xb6

(XEN) RFLAGS: 0000000000000206   CONTEXT: hypervisor

(XEN) rax: ffff82d080948fe0   rbx: 0000000002b73db9   rcx: 0000000000000000

(XEN) rdx: 0000000004000000   rsi: 0000000004000000   rdi: 0000002b73db9000

(XEN) rbp: ffff82d080827be0   rsp: ffff82d080827ba0   r8:  ffff82d080948fcc

(XEN) r9:  0000002b73dba000   r10: ffff82d0809491fc   r11: 8000000000000000

(XEN) r12: 0000000002b73db9   r13: ffff8320341bc000   r14: 000000000404fc00

(XEN) r15: ffff82d08046f209   cr0: 000000008005003b   cr4: 00000000001506e0

(XEN) cr3: 00000000a0414000   cr2: 0000000000000000

(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000

(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008

(XEN) Xen code around <ffff82d08029a8fd> (page_get_ram_type+0x58/0xb6):

(XEN)  4c 39 d0 74 4d 49 39 d1 <76> 0b 89 ca 83 ca 10 48 39 38 0f 47 ca 49 89 c0

(XEN) Xen stack trace from rsp=ffff82d080827ba0:

(XEN)    ffff82d08061ee91 ffff82d080827bb4 00000000000b2403 ffff82d080804340

(XEN)    ffff8320341bc000 ffff82d080804340 ffff83000003df90 ffff8320341bc000

(XEN)    ffff82d080827c08 ffff82d08061c38c ffff8320341bc000 ffff82d080827ca8

(XEN)    ffff82d080648750 ffff82d080827c20 ffff82d08061852c 0000000000200000

(XEN)    ffff82d080827d60 ffff82d080638abe ffff82d080232854 ffff82d080930c60

(XEN)    ffff82d080930280 ffff82d080674800 ffff83000003df90 0000000001a40000

(XEN)    ffff83000003df80 ffff82d080827c80 0000000000000206 ffff8320341bc000

(XEN)    ffff82d080827cb8 ffff82d080827ca8 ffff82d080232854 ffff82d080961780

(XEN)    ffff82d080930280 ffff82d080827c00 0000000000000002 ffff82d08022f9a0

(XEN)    00000000010a4bb0 ffff82d080827ce0 0000000000000206 000000000381b66d

(XEN)    ffff82d080827d00 ffff82d0802b1e87 ffff82d080936900 ffff82d080936900

(XEN)    ffff82d080827d18 ffff82d0802b30d0 ffff82d080936900 ffff82d080827d50

(XEN)    ffff82d08022ef5e ffff8320341bc000 ffff83000003df80 ffff8320341bc000

(XEN)    ffff83000003df80 0000000001a40000 ffff83000003df90 ffff82d080674800

(XEN)    ffff82d080827d98 ffff82d08063cd06 0000000000000001 ffff82d080674800

(XEN)    ffff82d080931050 0000000000000100 ffff82d080950c80 ffff82d080827ee8

(XEN)    ffff82d08062eae7 0000000001a40fff 0000000000000000 000ffff82d080e00

(XEN)    ffffffff00000000 0000000000000005 0000000000000004 0000000000000004

(XEN)    0000000000000003 0000000000000003 0000000000000002 0000000000000002

(XEN)    0000000002050000 0000000000000000 ffff82d080674c20 ffff82d080674ea0

(XEN) Xen call trace:

(XEN)    [<ffff82d08029a8fd>] R page_get_ram_type+0x58/0xb6

(XEN)    [<ffff82d08061ee91>] S arch_iommu_hwdom_init+0x239/0x2b7

(XEN)    [<ffff82d08061c38c>] F drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0x85/0x9f

(XEN)    [<ffff82d08061852c>] F iommu_hwdom_init+0x44/0x4b

(XEN)    [<ffff82d080638abe>] F dom0_construct_pvh+0x160/0x1233

(XEN)    [<ffff82d08063cd06>] F construct_dom0+0x5c/0x280e

(XEN)    [<ffff82d08062eae7>] F __start_xen+0x25db/0x2860

(XEN)    [<ffff82d0802000ec>] F __high_start+0x4c/0x4e

(XEN)

(XEN) CPU1 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)

(XEN) CPU31 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)

(XEN) CPU30 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)

(XEN) CPU27 @ e008:ffff82d08022ad5a (scrub_one_page+0x6d/0x7b)

(XEN) CPU26 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)

(XEN) CPU244 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)

(XEN) CPU245 @ e008:ffff82d08022ad5a (scrub_one_page+0x6d/0x7b)

(XEN) CPU247 @ e008:ffff82d080256e3f (drivers/char/ns16550.c#ns_read_reg+0x2d/0x35)

(XEN) CPU246 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)

<snip rather a large number of cpus, all idle>


This stack trace is the same on several boots, and in particular,
page_get_ram_type() being the %rip which took the timeout.  For an
equivalent PV dom0 build, it takes perceptibly 0 time, based on how
quickly the next line is printed.

I haven't diagnosed the exact issue, but some observations:

The arch_iommu_hwdom_init() loop's positioning of
process_pending_softirqs() looks problematic, because it is short
circuited conditionally by hwdom_iommu_map().

page_get_ram_type() is definitely suboptimal here.  We have an linear
search over a (large-ish) sorted list, and a caller which has every MFN
in the system passed into it, which makes the total runtime of
arch_iommu_hwdom_init() quadratic with the size of the system.

~Andrew

--------------708376CD82EC3A973D0815E9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    It turns out that PVH dom0 construction doesn't work so well on a
    2-socket Rome system...<br>
    <pre>
(XEN) NX (Execute Disable) protection active</pre>
    <pre>(XEN) *** Building a PVH Dom0 ***</pre>
    <pre>(XEN) Watchdog timer detects that CPU0 is stuck!</pre>
    <pre>(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----</pre>
    <pre>(XEN) CPU:    0</pre>
    <pre>(XEN) RIP:    e008:[&lt;ffff82d08029a8fd&gt;] page_get_ram_type+0x58/0xb6</pre>
    <pre>(XEN) RFLAGS: 0000000000000206   CONTEXT: hypervisor</pre>
    <pre>(XEN) rax: ffff82d080948fe0   rbx: 0000000002b73db9   rcx: 0000000000000000</pre>
    <pre>(XEN) rdx: 0000000004000000   rsi: 0000000004000000   rdi: 0000002b73db9000</pre>
    <pre>(XEN) rbp: ffff82d080827be0   rsp: ffff82d080827ba0   r8:  ffff82d080948fcc</pre>
    <pre>(XEN) r9:  0000002b73dba000   r10: ffff82d0809491fc   r11: 8000000000000000</pre>
    <pre>(XEN) r12: 0000000002b73db9   r13: ffff8320341bc000   r14: 000000000404fc00</pre>
    <pre>(XEN) r15: ffff82d08046f209   cr0: 000000008005003b   cr4: 00000000001506e0</pre>
    <pre>(XEN) cr3: 00000000a0414000   cr2: 0000000000000000</pre>
    <pre>(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000</pre>
    <pre>(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008</pre>
    <pre>(XEN) Xen code around &lt;ffff82d08029a8fd&gt; (page_get_ram_type+0x58/0xb6):</pre>
    <pre>(XEN)  4c 39 d0 74 4d 49 39 d1 &lt;76&gt; 0b 89 ca 83 ca 10 48 39 38 0f 47 ca 49 89 c0</pre>
    <pre>(XEN) Xen stack trace from rsp=ffff82d080827ba0:</pre>
    <pre>(XEN)    ffff82d08061ee91 ffff82d080827bb4 00000000000b2403 ffff82d080804340</pre>
    <pre>(XEN)    ffff8320341bc000 ffff82d080804340 ffff83000003df90 ffff8320341bc000</pre>
    <pre>(XEN)    ffff82d080827c08 ffff82d08061c38c ffff8320341bc000 ffff82d080827ca8</pre>
    <pre>(XEN)    ffff82d080648750 ffff82d080827c20 ffff82d08061852c 0000000000200000</pre>
    <pre>(XEN)    ffff82d080827d60 ffff82d080638abe ffff82d080232854 ffff82d080930c60</pre>
    <pre>(XEN)    ffff82d080930280 ffff82d080674800 ffff83000003df90 0000000001a40000</pre>
    <pre>(XEN)    ffff83000003df80 ffff82d080827c80 0000000000000206 ffff8320341bc000</pre>
    <pre>(XEN)    ffff82d080827cb8 ffff82d080827ca8 ffff82d080232854 ffff82d080961780</pre>
    <pre>(XEN)    ffff82d080930280 ffff82d080827c00 0000000000000002 ffff82d08022f9a0</pre>
    <pre>(XEN)    00000000010a4bb0 ffff82d080827ce0 0000000000000206 000000000381b66d</pre>
    <pre>(XEN)    ffff82d080827d00 ffff82d0802b1e87 ffff82d080936900 ffff82d080936900</pre>
    <pre>(XEN)    ffff82d080827d18 ffff82d0802b30d0 ffff82d080936900 ffff82d080827d50</pre>
    <pre>(XEN)    ffff82d08022ef5e ffff8320341bc000 ffff83000003df80 ffff8320341bc000</pre>
    <pre>(XEN)    ffff83000003df80 0000000001a40000 ffff83000003df90 ffff82d080674800</pre>
    <pre>(XEN)    ffff82d080827d98 ffff82d08063cd06 0000000000000001 ffff82d080674800</pre>
    <pre>(XEN)    ffff82d080931050 0000000000000100 ffff82d080950c80 ffff82d080827ee8</pre>
    <pre>(XEN)    ffff82d08062eae7 0000000001a40fff 0000000000000000 000ffff82d080e00</pre>
    <pre>(XEN)    ffffffff00000000 0000000000000005 0000000000000004 0000000000000004</pre>
    <pre>(XEN)    0000000000000003 0000000000000003 0000000000000002 0000000000000002</pre>
    <pre>(XEN)    0000000002050000 0000000000000000 ffff82d080674c20 ffff82d080674ea0</pre>
    <pre>(XEN) Xen call trace:</pre>
    <pre>(XEN)    [&lt;ffff82d08029a8fd&gt;] R page_get_ram_type+0x58/0xb6</pre>
    <pre>(XEN)    [&lt;ffff82d08061ee91&gt;] S arch_iommu_hwdom_init+0x239/0x2b7</pre>
    <pre>(XEN)    [&lt;ffff82d08061c38c&gt;] F drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0x85/0x9f</pre>
    <pre>(XEN)    [&lt;ffff82d08061852c&gt;] F iommu_hwdom_init+0x44/0x4b</pre>
    <pre>(XEN)    [&lt;ffff82d080638abe&gt;] F dom0_construct_pvh+0x160/0x1233</pre>
    <pre>(XEN)    [&lt;ffff82d08063cd06&gt;] F construct_dom0+0x5c/0x280e</pre>
    <pre>(XEN)    [&lt;ffff82d08062eae7&gt;] F __start_xen+0x25db/0x2860</pre>
    <pre>(XEN)    [&lt;ffff82d0802000ec&gt;] F __high_start+0x4c/0x4e</pre>
    <pre>(XEN)</pre>
    <pre>(XEN) CPU1 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)</pre>
    <pre>(XEN) CPU31 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)</pre>
    <pre>(XEN) CPU30 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)</pre>
    <pre>(XEN) CPU27 @ e008:ffff82d08022ad5a (scrub_one_page+0x6d/0x7b)</pre>
    <pre>(XEN) CPU26 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)</pre>
    <pre>(XEN) CPU244 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)</pre>
    <pre>(XEN) CPU245 @ e008:ffff82d08022ad5a (scrub_one_page+0x6d/0x7b)</pre>
    <pre>(XEN) CPU247 @ e008:ffff82d080256e3f (drivers/char/ns16550.c#ns_read_reg+0x2d/0x35)</pre>
    <pre>(XEN) CPU246 @ e008:ffff82d0802f203f (arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0xa9/0xbf)</pre>
    <pre>&lt;snip rather a large number of cpus, all idle&gt;
</pre>
    <br>
    This stack trace is the same on several boots, and in particular,
    page_get_ram_type() being the %rip which took the timeout.  For an
    equivalent PV dom0 build, it takes perceptibly 0 time, based on how
    quickly the next line is printed.<br>
    <br>
    I haven't diagnosed the exact issue, but some observations:<br>
    <br>
    The arch_iommu_hwdom_init() loop's positioning of
    process_pending_softirqs() looks problematic, because it is short
    circuited conditionally by hwdom_iommu_map().<br>
    <br>
    page_get_ram_type() is definitely suboptimal here.  We have an
    linear search over a (large-ish) sorted list, and a caller which has
    every MFN in the system passed into it, which makes the total
    runtime of arch_iommu_hwdom_init() quadratic with the size of the
    system.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------708376CD82EC3A973D0815E9--


--===============8707818123073687485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8707818123073687485==--


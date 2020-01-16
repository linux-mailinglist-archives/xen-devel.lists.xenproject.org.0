Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81114004B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 00:58:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isEza-00089Z-W9; Thu, 16 Jan 2020 23:56:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kpql=3F=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1isEzZ-00089U-8D
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 23:56:01 +0000
X-Inumbo-ID: bf11023e-38bb-11ea-a2eb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf11023e-38bb-11ea-a2eb-bc764e2007e4;
 Thu, 16 Jan 2020 23:56:00 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7216206D7;
 Thu, 16 Jan 2020 23:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579218960;
 bh=tmbcyC8TG8OxYvdHMofSIM/PLePSfqtUGz94KAqRbzM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Xv4m2HClN4iibCHKdSgeqY6zBrT8YYUsins8AgBBQEOrcf5Kq8TZvBWt0pp60Xa0k
 n1wFhFIbylSZO/EOaktrDIAbMQCvCeCPNhRyOg+9vlBE72WbW/w2mWoZfPq9AbWQW1
 VdpDKmbHHUg6Gh0JeV6z4hsAu4U7evq3Ld/CiUCo=
Date: Thu, 16 Jan 2020 15:55:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <358f2e6e-d4ff-7e4a-08c7-5be1c9c20ab6@xen.org>
Message-ID: <alpine.DEB.2.21.2001161508120.13984@sstabellini-ThinkPad-T480s>
References: <AM6PR04MB5094DE81655072BDA67F7922F0340@AM6PR04MB5094.eurprd04.prod.outlook.com>
 <358f2e6e-d4ff-7e4a-08c7-5be1c9c20ab6@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2052975472-1579217057=:13984"
Content-ID: <alpine.DEB.2.21.2001161524200.13984@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
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
Cc: Jorge Pereira <jorge.pereira@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2052975472-1579217057=:13984
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2001161524201.13984@sstabellini-ThinkPad-T480s>

On Wed, 15 Jan 2020, Julien Grall wrote:
> On 14/01/2020 21:39, Jorge Pereira wrote:
> > Hi Guys,
> 
> Hello,
> 
> > 
> > I’m currently using XEN in order to run side-by-side a DOM-0 with a DOM-U
> > guest. My use-case scenario requires in the DOM-U direct access to some
> > dma-capable devices such ethernet and some GPUs.
> > 
> > Since our target platform (i.MX8MM) does not support IOMMU, we can’t assign
> > dma-capable devices to the DOM-U guest because XEN does not create 1:1
> > mapping for that guest in the 2^nd stage MMU. So, guest-virtual addresses
> > are different than the physical ones.
> 
> Bear in mind this setup is going to be insecure unless you have another way to
> prevent your passthrough-ed device to access memory it should not (e.g an
> MPU).
> 
> > Is it possible to have 1:1 mapping for DOM-U guests?

I have a patch that enables 1:1 mapping of memory for dom0-less DomUs,
see attached. It introduces a new option called "direct-map" in the domU
specific device tree section. When direct-map is found, the memory gets
allocated 1:1 for the DomU. direct-map can be used in conjuction with
the existing xen,force-assign-without-iommu parameter to enable device
assignment to domUs without a SMMU.

Note that direct-map is supposed to go under /chosen in the main device
tree, while xen,force-assign-without-iommu is supposed to go under
/passthrough in the partial device tree for device assignment.


The patch is only lightly tested and might not work on your platform.
Also, in addition to the security concerns Julien pointed out, it is
very possible to run into trouble with other static addresses.
Currently, we have a number of resources with fixed addresses in the
DomU address space. Give a look at xen/include/public/arch-arm.h: the
domU GICD is fixed at 0x03001000 for example. If the 1:1 memory
allocation selects a memory region that conflicts with any of those
fixed addresses, you are going to have a problem. I am not even sure
that Xen will be able to detect the error and fail explicitly: it could
just silently fail to boot.



> It is not possible at the moment. There are been various effort to try to do
> it, but I have always push back as this is actively defeating the purposing of
> an hypervisor.
> 
> This would be a different story if we had support for MPU in Xen.

A MPU is a requirement to make 1:1 secure, however, it would be
difficult to add support for it in Xen: on Xilinx platforms, the MPU is
not only for VM/VM protection but also for Cortex-Rs/Cortex-As
protection so it is typically programmed beforehand by somebody with a
system wide view (Xen has only a Cortex-A view of the system.) Xen might
not be the right place to configure the MPU at least on Xilinx boards.

This makes me realize that maybe we need to be able to allow the user to
specify not just that she wants direct mapping (like I did in the
attached patch), but also that she wants a specific range of memory for
each DomU, so that she can go and configure the MPU herself.
--8323329-2052975472-1579217057=:13984
Content-Type: text/plain; CHARSET=US-ASCII; NAME=direct-map
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.21.2001161524170.13984@sstabellini-ThinkPad-T480s>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=direct-map

ZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gtbm9pb21t
dS50eHQgYi9kb2NzL21pc2MvYXJtL3Bhc3N0aHJvdWdoLW5vaW9tbXUudHh0
DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMC4uZDli
N2E5YjEwOQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZG9jcy9taXNjL2FybS9w
YXNzdGhyb3VnaC1ub2lvbW11LnR4dA0KQEAgLTAsMCArMSwyOSBAQA0KK0Rp
c2FibGUgSU9NTVUNCis9PT09PT09PT09PT09DQorDQorQWRkIHN0YXR1cyA9
ICJkaXNhYmxlZCI7IHVuZGVyIHRoZSBzbW11IG5vZGU6DQorDQorCQlzbW11
QGZkODAwMDAwIHsNCisJCQljb21wYXRpYmxlID0gImFybSxtbXUtNTAwIjsN
CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKw0KKw0KK1JlcXVlc3QgRGV2
aWNlIEFzc2lnbm1lbnQgd2l0aG91dCBJT01NVSBzdXBwb3J0DQorPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCisN
CitBZGQgeGVuLGZvcmNlLWFzc2lnbi13aXRob3V0LWlvbW11OyB0byB0aGUg
ZGV2aWNlIHRyZWUgc25pcHBldA0KKw0KKwkJZXRoZXJuZXQ6IGV0aGVybmV0
QGZmMGUwMDAwIHsNCisJCQljb21wYXRpYmxlID0gImNkbnMsenlucW1wLWdl
bSI7DQorCQkJeGVuLHBhdGggPSAiL2FtYmEvZXRoZXJuZXRAZmYwZTAwMDAi
Ow0KKwkJCXhlbixyZWcgPSA8MHgwIDB4ZmYwZTAwMDAgMHgxMDAwIDB4MCAw
eGZmMGUwMDAwPjsNCisJCQl4ZW4sZm9yY2UtYXNzaWduLXdpdGhvdXQtaW9t
bXU7DQorDQorDQorUmVxdWVzdCAxOjEgbWVtb3J5IG1hcHBpbmcgZm9yIHRo
ZSBkb21haW4NCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KKw0KK0FkZCBkaXJlY3QtbWFwIHVuZGVyIHRoZSBhcHByb3By
aWF0ZSAvY2hvc2VuL2RvbVUgbm9kZS4NCitJZiB0aGUgdXNlciBpcyB1c2lu
ZyBpbWFnZWJ1aWxkZXIsIHlvdSBjYW4gYWRkIHRvIGJvb3Quc291cmNlOg0K
Kw0KK2ZkdCBzZXQgL2Nob3Nlbi9kb21VMCBkaXJlY3QtbWFwIDwweDE+DQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQppbmRleCBkZDljM2I3M2JhLi41
MWVjN2Q3NmRiIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jDQorKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCkBA
IC0yNjksOSArMjY5LDkgQEAgc3RhdGljIHZvaWQgX19pbml0IGFsbG9jYXRl
X21lbW9yeV8xMShzdHJ1Y3QgZG9tYWluICpkLA0KICAgICAgKi8NCiAgICAg
QlVHX09OKCFpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSk7DQogDQotICAg
IHByaW50aygiQWxsb2NhdGluZyAxOjEgbWFwcGluZ3MgdG90YWxsaW5nICVs
ZE1CIGZvciBkb20wOlxuIiwNCisgICAgcHJpbnRrKCJBbGxvY2F0aW5nIDE6
MSBtYXBwaW5ncyB0b3RhbGxpbmcgJWxkTUIgZm9yIGRvbSV1OlxuIiwNCiAg
ICAgICAgICAgIC8qIERvbid0IHdhbnQgZm9ybWF0IHRoaXMgYXMgUFJJcGFk
ZHIgKDE2IGRpZ2l0IGhleCkgKi8NCi0gICAgICAgICAgICh1bnNpZ25lZCBs
b25nKShraW5mby0+dW5hc3NpZ25lZF9tZW0gPj4gMjApKTsNCisgICAgICAg
ICAgICh1bnNpZ25lZCBsb25nKShraW5mby0+dW5hc3NpZ25lZF9tZW0gPj4g
MjApLCBkLT5kb21haW5faWQpOw0KIA0KICAgICBraW5mby0+bWVtLm5yX2Jh
bmtzID0gMDsNCiANCkBAIC0yNDM0LDcgKzI0MzQsMTEgQEAgc3RhdGljIGlu
dCBfX2luaXQgY29uc3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCiAg
ICAgLyogdHlwZSBtdXN0IGJlIHNldCBiZWZvcmUgYWxsb2NhdGUgbWVtb3J5
ICovDQogICAgIGQtPmFyY2gudHlwZSA9IGtpbmZvLnR5cGU7DQogI2VuZGlm
DQotICAgIGFsbG9jYXRlX21lbW9yeShkLCAma2luZm8pOw0KKw0KKyAgICBp
ZiAoICFpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSApDQorICAgICAgICBh
bGxvY2F0ZV9tZW1vcnkoZCwgJmtpbmZvKTsNCisgICAgZWxzZQ0KKyAgICAg
ICAgYWxsb2NhdGVfbWVtb3J5XzExKGQsICZraW5mbyk7DQogDQogICAgIHJj
ID0gcHJlcGFyZV9kdGJfZG9tVShkLCAma2luZm8pOw0KICAgICBpZiAoIHJj
IDwgMCApDQpAQCAtMjQ1NCw2ICsyNDU4LDggQEAgdm9pZCBfX2luaXQgY3Jl
YXRlX2RvbVVzKHZvaWQpDQogew0KICAgICBzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUgKm5vZGU7DQogICAgIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAq
Y2hvc2VuID0gZHRfZmluZF9ub2RlX2J5X3BhdGgoIi9jaG9zZW4iKTsNCisg
ICAgaW50IHJjOw0KKyAgICB1MzIgZGlyZWN0X21hcCA9IDA7DQogDQogICAg
IEJVR19PTihjaG9zZW4gPT0gTlVMTCk7DQogICAgIGR0X2Zvcl9lYWNoX2No
aWxkX25vZGUoY2hvc2VuLCBub2RlKQ0KQEAgLTI0NzQsNyArMjQ4MCw5IEBA
IHZvaWQgX19pbml0IGNyZWF0ZV9kb21Vcyh2b2lkKQ0KICAgICAgICAgICAg
IHBhbmljKCJNaXNzaW5nIHByb3BlcnR5ICdjcHVzJyBmb3IgZG9tYWluICVz
XG4iLA0KICAgICAgICAgICAgICAgICAgIGR0X25vZGVfbmFtZShub2RlKSk7
DQogDQotICAgICAgICBpZiAoIGR0X2ZpbmRfY29tcGF0aWJsZV9ub2RlKG5v
ZGUsIE5VTEwsICJtdWx0aWJvb3QsZGV2aWNlLXRyZWUiKSApDQorICAgICAg
ICByYyA9IGR0X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJkaXJlY3QtbWFw
IiwgJmRpcmVjdF9tYXApOw0KKyAgICAgICAgaWYgKCBkdF9maW5kX2NvbXBh
dGlibGVfbm9kZShub2RlLCBOVUxMLCAibXVsdGlib290LGRldmljZS10cmVl
IikgJiYNCisgICAgICAgICAgICAgKCFyYyB8fCAhZGlyZWN0X21hcCkgKQ0K
ICAgICAgICAgICAgIGRfY2ZnLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX2lv
bW11Ow0KIA0KICAgICAgICAgaWYgKCAhZHRfcHJvcGVydHlfcmVhZF91MzIo
bm9kZSwgIm5yX3NwaXMiLCAmZF9jZmcuYXJjaC5ucl9zcGlzKSApDQpAQCAt
MjQ5NSw2ICsyNTAzLDcgQEAgdm9pZCBfX2luaXQgY3JlYXRlX2RvbVVzKHZv
aWQpDQogICAgICAgICAgICAgcGFuaWMoIkVycm9yIGNyZWF0aW5nIGRvbWFp
biAlc1xuIiwgZHRfbm9kZV9uYW1lKG5vZGUpKTsNCiANCiAgICAgICAgIGQt
PmlzX2NvbnNvbGUgPSB0cnVlOw0KKyAgICAgICAgZC0+YXJjaC5kaXJlY3Rf
bWFwID0gKHJjICYmIGRpcmVjdF9tYXAgIT0gMCk7DQogDQogICAgICAgICBp
ZiAoIGNvbnN0cnVjdF9kb21VKGQsIG5vZGUpICE9IDAgKQ0KICAgICAgICAg
ICAgIHBhbmljKCJDb3VsZCBub3Qgc2V0IHVwIGRvbWFpbiAlc1xuIiwgZHRf
bm9kZV9uYW1lKG5vZGUpKTsNCkBAIC0yNTI0LDYgKzI1MzMsNyBAQCBpbnQg
X19pbml0IGNvbnN0cnVjdF9kb20wKHN0cnVjdCBkb21haW4gKmQpDQogDQog
ICAgIGlvbW11X2h3ZG9tX2luaXQoZCk7DQogDQorICAgIGQtPmFyY2guZGly
ZWN0X21hcCA9IHRydWU7DQogICAgIGQtPm1heF9wYWdlcyA9IH4wVTsNCiAN
CiAgICAga2luZm8udW5hc3NpZ25lZF9tZW0gPSBkb20wX21lbTsNCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9kb21haW4uaA0KaW5kZXggZjNmM2ZiN2Q3Zi4uOGI1
ZTE1NDJlNSAxMDA2NDQNCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9t
YWluLmgNCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmgNCkBA
IC0zMiw3ICszMiw3IEBAIGVudW0gZG9tYWluX3R5cGUgew0KICNlbmRpZg0K
IA0KIC8qIFRoZSBoYXJkd2FyZSBkb21haW4gaGFzIGFsd2F5cyBpdHMgbWVt
b3J5IGRpcmVjdCBtYXBwZWQuICovDQotI2RlZmluZSBpc19kb21haW5fZGly
ZWN0X21hcHBlZChkKSAoKGQpID09IGhhcmR3YXJlX2RvbWFpbikNCisjZGVm
aW5lIGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICgoZCktPmFyY2guZGly
ZWN0X21hcCAhPSBmYWxzZSkNCiANCiBzdHJ1Y3QgdnRpbWVyIHsNCiAgICAg
c3RydWN0IHZjcHUgKnY7DQpAQCAtMTAxLDYgKzEwMSw4IEBAIHN0cnVjdCBh
cmNoX2RvbWFpbg0KICNpZmRlZiBDT05GSUdfVEVFDQogICAgIHZvaWQgKnRl
ZTsNCiAjZW5kaWYNCisNCisgICAgYm9vbCBkaXJlY3RfbWFwOw0KIH0gIF9f
Y2FjaGVsaW5lX2FsaWduZWQ7DQogDQogc3RydWN0IGFyY2hfdmNwdQ0K

--8323329-2052975472-1579217057=:13984
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2052975472-1579217057=:13984--


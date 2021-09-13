Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F940A100
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 00:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185979.334726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPueG-0005h9-GI; Mon, 13 Sep 2021 22:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185979.334726; Mon, 13 Sep 2021 22:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPueG-0005dg-CA; Mon, 13 Sep 2021 22:42:00 +0000
Received: by outflank-mailman (input) for mailman id 185979;
 Mon, 13 Sep 2021 22:41:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+zYr=OD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mPueF-0005da-JS
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 22:41:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a117f107-84ac-475c-b895-4fad6ab2bda8;
 Mon, 13 Sep 2021 22:41:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BC8560EE5;
 Mon, 13 Sep 2021 22:41:57 +0000 (UTC)
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
X-Inumbo-ID: a117f107-84ac-475c-b895-4fad6ab2bda8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631572917;
	bh=i4LeucUZLkdN7pXKmEjyTssQ6r/JJQqxLWYz7r6pC3k=;
	h=Date:From:To:cc:Subject:From;
	b=JsNe0fliB/whyFslve9Un8WbgWFs0Wm2ZlE/vynYnDzdvoEm6Mtx82r65EFEtGs94
	 k6f/Hd79mdwZDDALsTtoj0SHwPlYXM6/9QWc2w6EuMeoQmm4ZE1I7kJRVhwcRPRxdw
	 7HkVH5ffMuu8MVL+oyoK9FFkoZAZ2PD3+26ljnGqQYxpNnbOcgh8edcsNdNjqZ6JXi
	 KGnclL7NLMRtz8M9qMOm1ArQudtRghefiD3lcroIJ65DiduS1RmyoveOkUeCPM4LZC
	 c06gE+EvtrcpHFGRpetEoFGFa+uwqN0Qyna5q1yG+AsRm1oL/LWBpXpsrP74VWZ0oA
	 8e3d+1NsgOtfA==
Date: Mon, 13 Sep 2021 15:41:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Bertrand.Marquis@arm.com, 
    Alec.Kwapis@dornerworks.com, christopher.w.clark@gmail.com
Subject: Dom0less + Argo enablement
Message-ID: <alpine.DEB.2.21.2109131441520.10523@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-587971660-1631570062=:10523"
Content-ID: <alpine.DEB.2.21.2109131454340.10523@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-587971660-1631570062=:10523
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.21.2109131454341.10523@sstabellini-ThinkPad-T480s>

Hi all,

This email is for anybody interested in using Argo with Dom0less setups
for domain-to-domain communications.

Argo is a secure VM-to-VM communication mechanism based on hypercalls
[1]. It is a good fit for Dom0less setups because Argo is lightweight
and doesn't make use of PV frontends, backends, and xenstore. Thus, it
is easier to enable in simple Dom0less setups where VMs are booting in
parallel, backends cannot be assumed to be already up and running, and
the goal is just to get two VMs to talk to each others.

Argo makes use of event channels for notifications. Dom0less VMs don't
have event channels support yet, although it is work-in-progress. The
attached patch for Linux (not ready for upstreaming) enables the
necessary event channels initialization.

In addition, you also need to add the following to the DomU device tree
(see xen/arch/arm/domain_build.c:prepare_dtb_domU):

event-channel {
        compatible = "xen,xen-4.15", "xen,xen";
        interrupts = <0x01 0x0f 0xf08>;
        interrupt-parent = <0xfde8>;
};


The final pieces to enable Argo are:
- CONFIG_ARGO in the Xen build
- the Argo Linux kernel module
  https://github.com/OpenXT/linux-xen-argo
- the Yocto recipe was based on
  https://github.com/dozylynx/meta-argo-linux
- pass dom0less_domU to the domU kernel command line


Then you are good to go for using Argo in your Dom0less VMs, e.g.:

From receiver domain: streamTest -domid 5 -port 8022 -file test.txt -receive 
From sender domain: streamTest -domid 4 -port 8022 -file test.txt -send -connect

Many thanks to Alec Kwapis from DornerWorks for all the information and
the patch!

Cheers,

Stefano


[1] https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen
--8323329-587971660-1631570062=:10523
Content-Type: text/x-diff; name=0001-Perform-Xen-Initialization-in-Dom0less.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.21.2109131541560.10523@sstabellini-ThinkPad-T480s>
Content-Description: 
Content-Disposition: attachment; filename=0001-Perform-Xen-Initialization-in-Dom0less.patch

RnJvbSA2NDg2YTBkNzNkM2Q0MjJmNTRmOGI1NzlhMzU1MDE2MDA5OGZjYzkz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogQWxlYyBLd2FwaXMg
PGFsZWMua3dhcGlzQGRvcm5lcndvcmtzLmNvbT4NCkRhdGU6IFdlZCwgOCBT
ZXAgMjAyMSAwOTowMTo0NiAtMDQwMA0KU3ViamVjdDogW1BBVENIXSBQZXJm
b3JtIFhlbiBJbml0aWFsaXphdGlvbiBpbiBEb20wbGVzcw0KDQpUaGlzIHBh
dGNoIGFsbG93cyBzb21lIFhlbiBpbml0aWFsaXphdGlvbiB0byBvY2N1ciBk
dXJpbmcgdGhlIGJvb3QgcHJvY2Vzcw0Kb2YgdGhlIExpbnV4IGtlcm5lbC4g
VGhpcyBhbHJlYWR5IG9jY3VycyBmb3IgZ3Vlc3RzIGluIGEgRG9tMC1tYW5h
Z2VkDQpjb25maWd1cmF0aW9uLCBob3dldmVyLCB0aGUgeGVuX2RvbWFpbigp
IEFQSSB3aWxsIGV2YWx1YXRlIHRvIGZhbHNlDQpmb3IgZ3Vlc3RzIGluIGEg
RG9tMGxlc3MgY29uZmlndXJhdGlvbi4NCg0KVGhlcmVmb3JlLCBhIExpbnV4
IGtlcm5lbCBjb21tYW5kIGxpbmUgYXJndW1lbnQgd2FzIGFkZGVkICgiZG9t
MGxlc3NfZG9tVSIpDQp3aGljaCBzaWduaWZpZXMgdGhhdCBMaW51eCBpcyBi
ZWluZyBib290ZWQgYXMgYSBndWVzdCBpbiBEb20wbGVzcy4gVGhpcw0KYWxs
b3dzIGNlcnRhaW4gaW5pdGlhbGl6YXRpb24gdG8gb2NjdXIsIHN1Y2ggYXMg
ZXZlbnQgY2hhbm5lbHMgYW5kIHRoZSBzaGFyZWQNCmluZm8gcGFnZS4gVGhp
cyBkb2VzIG5vdCBpbmNsdWRlIGdyYW50IHRhYmxlIGluaXRpYWxpemF0aW9u
Lg0KDQpUaGlzIHBhdGNoIGlzIG5lY2Vzc2FyeSBpbiBnZXR0aW5nIEFyZ28g
dG8gd29yayBpbiBEb20wbGVzcywgd2hpY2ggcmVxdWlyZXMNCmJvdGggWGVu
IGV2ZW50IGNoYW5uZWxzIGZvciB0aGUgQXJnbyB2aXJ0dWFsIGludGVycnVw
dCwgYW5kIHRoZSBzaGFyZWQgaW5mbyBwYWdlLg0KDQpTaWduZWQtb2ZmLWJ5
OiBBbGVjIEt3YXBpcyA8YWxlYy5rd2FwaXNAZG9ybmVyd29ya3MuY29tPg0K
LS0tDQogYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jIHwgMjUgKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQ0KIGluaXQvbWFpbi5jICAgICAgICAgICAgICB8
IDE4ICsrKysrKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9hcmNoL2FybS94ZW4vZW5saWdodGVuLmMgYi9hcmNoL2FybS94ZW4vZW5s
aWdodGVuLmMNCmluZGV4IGRkNjgwNGE2NGYxYS4uMGMyMTZiMWZmMjc5IDEw
MDY0NA0KLS0tIGEvYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jDQorKysgYi9h
cmNoL2FybS94ZW4vZW5saWdodGVuLmMNCkBAIC0zNiw2ICszNiw4IEBADQog
DQogI2luY2x1ZGUgPGxpbnV4L21tLmg+DQogDQorZXh0ZXJuIGJvb2wgZG9t
MGxlc3NfZG9tVTsNCisNCiBzdHJ1Y3Qgc3RhcnRfaW5mbyBfeGVuX3N0YXJ0
X2luZm87DQogc3RydWN0IHN0YXJ0X2luZm8gKnhlbl9zdGFydF9pbmZvID0g
Jl94ZW5fc3RhcnRfaW5mbzsNCiBFWFBPUlRfU1lNQk9MKHhlbl9zdGFydF9p
bmZvKTsNCkBAIC0zMTEsNyArMzEzLDcgQEAgc3RhdGljIGludCBfX2luaXQg
eGVuX2d1ZXN0X2luaXQodm9pZCkNCiAJc3RydWN0IHNoYXJlZF9pbmZvICpz
aGFyZWRfaW5mb19wYWdlID0gTlVMTDsNCiAJaW50IGNwdTsNCiANCi0JaWYg
KCF4ZW5fZG9tYWluKCkpDQorCWlmICgheGVuX2RvbWFpbigpICYmICFkb20w
bGVzc19kb21VKQ0KIAkJcmV0dXJuIDA7DQogDQogCWlmICghYWNwaV9kaXNh
YmxlZCkNCkBAIC0zNjIsMTYgKzM2NCwxOSBAQCBzdGF0aWMgaW50IF9faW5p
dCB4ZW5fZ3Vlc3RfaW5pdCh2b2lkKQ0KIAlmb3JfZWFjaF9wb3NzaWJsZV9j
cHUoY3B1KQ0KIAkJcGVyX2NwdSh4ZW5fdmNwdV9pZCwgY3B1KSA9IGNwdTsN
CiANCi0JeGVuX2F1dG9feGxhdF9ncmFudF9mcmFtZXMuY291bnQgPSBnbnR0
YWJfbWF4X2dyYW50X2ZyYW1lcygpOw0KLQlpZiAoeGVuX3hsYXRlX21hcF9i
YWxsb29uZWRfcGFnZXMoJnhlbl9hdXRvX3hsYXRfZ3JhbnRfZnJhbWVzLnBm
biwNCi0JCQkJCSAgJnhlbl9hdXRvX3hsYXRfZ3JhbnRfZnJhbWVzLnZhZGRy
LA0KLQkJCQkJICB4ZW5fYXV0b194bGF0X2dyYW50X2ZyYW1lcy5jb3VudCkp
IHsNCi0JCWZyZWVfcGVyY3B1KHhlbl92Y3B1X2luZm8pOw0KLQkJcmV0dXJu
IC1FTk9NRU07DQorCWlmICh4ZW5fZG9tYWluKCkgJiYgIWRvbTBsZXNzX2Rv
bVUpDQorCXsNCisJCXhlbl9hdXRvX3hsYXRfZ3JhbnRfZnJhbWVzLmNvdW50
ID0gZ250dGFiX21heF9ncmFudF9mcmFtZXMoKTsNCisJCWlmICh4ZW5feGxh
dGVfbWFwX2JhbGxvb25lZF9wYWdlcygmeGVuX2F1dG9feGxhdF9ncmFudF9m
cmFtZXMucGZuLA0KKwkJCQkJCSAgJnhlbl9hdXRvX3hsYXRfZ3JhbnRfZnJh
bWVzLnZhZGRyLA0KKwkJCQkJCSAgeGVuX2F1dG9feGxhdF9ncmFudF9mcmFt
ZXMuY291bnQpKSB7DQorCQkJZnJlZV9wZXJjcHUoeGVuX3ZjcHVfaW5mbyk7
DQorCQkJcmV0dXJuIC1FTk9NRU07DQorCQl9DQorCQlnbnR0YWJfaW5pdCgp
Ow0KKwkJaWYgKCF4ZW5faW5pdGlhbF9kb21haW4oKSkNCisJCQl4ZW5idXNf
cHJvYmUoTlVMTCk7DQogCX0NCi0JZ250dGFiX2luaXQoKTsNCi0JaWYgKCF4
ZW5faW5pdGlhbF9kb21haW4oKSkNCi0JCXhlbmJ1c19wcm9iZShOVUxMKTsN
CiANCiAJLyoNCiAJICogTWFraW5nIHN1cmUgYm9hcmQgc3BlY2lmaWMgY29k
ZSB3aWxsIG5vdCBzZXQgdXAgb3BzIGZvcg0KZGlmZiAtLWdpdCBhL2luaXQv
bWFpbi5jIGIvaW5pdC9tYWluLmMNCmluZGV4IDkxZjZlYmIzMGVmMC4uOTE3
Y2Q2MGE4OTk3IDEwMDY0NA0KLS0tIGEvaW5pdC9tYWluLmMNCisrKyBiL2lu
aXQvbWFpbi5jDQpAQCAtMTQ5LDYgKzE0OSwyNCBAQCBzdGF0aWMgY2hhciAq
cmFtZGlza19leGVjdXRlX2NvbW1hbmQ7DQogYm9vbCBzdGF0aWNfa2V5X2lu
aXRpYWxpemVkIF9fcmVhZF9tb3N0bHk7DQogRVhQT1JUX1NZTUJPTF9HUEwo
c3RhdGljX2tleV9pbml0aWFsaXplZCk7DQogDQorLyoNCisgKiBJZiBzZXQs
IHRoaXMgaXMgYW4gaW5kaWNhdGlvbiB0aGF0IExpbnV4IHdpbGwgYmUgYm9v
dGVkIGluIGEgWGVuIGRvbTBsZXNzDQorICogY29uZmlndXJhdGlvbi4gVGhp
cyBpcyBuZWNlc3NhcnkgYmVjYXVzZSB0aGUgY3VycmVudCB4ZW5fZG9tYWlu
KCkgQVBJIGV2YWx1YXRlcw0KKyAqIHRvIGZhbHNlIGZvciBkb20wbGVzcyBk
b21haW5zIG9uIEFSTSwgYnV0IHRoZSBMaW51eCBrZXJuZWwgc3RpbGwgbmVl
ZHMgdG8ga25vdw0KKyAqIHRoYXQgaXQgaXMgYmVpbmcgYm9vdGVkIGluIFhl
biB0byBzZXR1cCBYZW4gZmVhdHVyZXMgc3VjaCBhcyBldmVudCBjaGFubmVs
cyBhbmQNCisgKiB0aGUgc2hhcmVkIGluZm8gcGFnZS4NCisgKi8NCitib29s
IGRvbTBsZXNzX2RvbVUgPSBmYWxzZTsNCitFWFBPUlRfU1lNQk9MKGRvbTBs
ZXNzX2RvbVUpOw0KKw0KK3N0YXRpYyBpbnQgX19pbml0IHNldF9kb20wbGVz
c19kb21VKGNoYXIgKnN0cikNCit7DQorCWRvbTBsZXNzX2RvbVUgPSB0cnVl
Ow0KKwlyZXR1cm4gMTsNCit9DQorDQorX19zZXR1cCgiZG9tMGxlc3NfZG9t
VSIsIHNldF9kb20wbGVzc19kb21VKTsNCisNCiAvKg0KICAqIElmIHNldCwg
dGhpcyBpcyBhbiBpbmRpY2F0aW9uIHRvIHRoZSBkcml2ZXJzIHRoYXQgcmVz
ZXQgdGhlIHVuZGVybHlpbmcNCiAgKiBkZXZpY2UgYmVmb3JlIGdvaW5nIGFo
ZWFkIHdpdGggdGhlIGluaXRpYWxpemF0aW9uIG90aGVyd2lzZSBkcml2ZXIg
bWlnaHQNCi0tIA0KMi4yNS4xDQoNCg==

--8323329-587971660-1631570062=:10523--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EEE4EE2A9
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 22:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297088.505951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na1Qy-0005AU-D1; Thu, 31 Mar 2022 20:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297088.505951; Thu, 31 Mar 2022 20:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na1Qy-000580-A8; Thu, 31 Mar 2022 20:30:20 +0000
Received: by outflank-mailman (input) for mailman id 297088;
 Thu, 31 Mar 2022 20:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Cq/=UK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na1Qw-00057u-A2
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 20:30:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f824fa5-b131-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 22:30:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02BDB61B14;
 Thu, 31 Mar 2022 20:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FD1C340ED;
 Thu, 31 Mar 2022 20:30:14 +0000 (UTC)
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
X-Inumbo-ID: 5f824fa5-b131-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648758614;
	bh=alLNeF+S4k4m2T49yVE8U4BLjfV7gBvIRvXGKneeoSA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OPl5AdUGOYHYQq0gO6zixswHC5heDi5M8KoPV0J6NPX+Hze6JHD4/dR2tsbOj1kcm
	 UaZ436mc7+ncvZmfnf5maPpJpREJY8mzLbGo2aRH5fIH0IeYIn/AbQD4rUw5KnIdCM
	 MQL0gkwvHVO1lEE7nggsncHWy3AiqyOVI0S00D6ieDwCVHftRWGPFdLfXewGlizx0h
	 d1X/QpXXXzh9eNq16fXAwiMa7pR9rGOufG9GxRDX9U2xLrYAA/razqXYlYyM3br52V
	 vrrlgL/23kHsGE96l7U2EeY1xlhx40DO1Zhw4dYxCGTprKvFQ8Pz6trfsC1V6b4yBR
	 q5DnZCoHhHS6w==
Date: Thu, 31 Mar 2022 13:30:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org, scott.davis@starlab.io, jandryuk@gmail.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] arch: ensure idle domain is not left privileged
In-Reply-To: <bb93b930-8287-6e8f-98b5-4b3f3c8e6eaf@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203311325420.2910984@ubuntu-linux-20-04-desktop>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com> <20220330230549.26074-3-dpsmith@apertussolutions.com> <YkWijXX9P1FSs61W@Air-de-Roger> <bb93b930-8287-6e8f-98b5-4b3f3c8e6eaf@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-641972864-1648758615=:2910984"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-641972864-1648758615=:2910984
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 31 Mar 2022, Julien Grall wrote:
> On 31/03/2022 13:46, Roger Pau Monné wrote:
> > On Wed, Mar 30, 2022 at 07:05:49PM -0400, Daniel P. Smith wrote:
> > > It is now possible to promote the idle domain to privileged during setup.
> > > It
> > > is not desirable for the idle domain to still be privileged when moving
> > > into a
> > > running state. If the idle domain was elevated and not properly demoted,
> > > it is
> > > desirable to fail at this point. This commit adds an assert for both x86
> > > and
> > > Arm just before transitioning to a running state that ensures the idle is
> > > not
> > > privileged.
> > > 
> > > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > > ---
> > >   xen/arch/arm/setup.c | 3 +++
> > >   xen/arch/x86/setup.c | 3 +++
> > >   2 files changed, 6 insertions(+)
> > > 
> > > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > > index 7968cee47d..3de394e946 100644
> > > --- a/xen/arch/arm/setup.c
> > > +++ b/xen/arch/arm/setup.c
> > > @@ -973,6 +973,9 @@ void __init start_xen(unsigned long boot_phys_offset,
> > >       /* Hide UART from DOM0 if we're using it */
> > >       serial_endboot();
> > >   +    /* Ensure idle domain was not left privileged */
> > > +    ASSERT(current->domain->is_privileged == false) ;
> > > +
> > >       system_state = SYS_STATE_active;
> > >         create_domUs();
> > 
> > Hm, I think you want to use the permission promotion of the idle
> > domain in create_domUs() likely?
> > 
> > At which point the check should be after create_domUs, and it would
> > seem that logically SYS_STATE_active should be set after creating the
> > domUs.
> > 
> > Also, FWIW, I'm not seeing this create_domUs() call in my context,
> > maybe you have other patches on your queue?
> I think the code is based on an old version of Xen (looks like 4.14). In newer
> version create_domUs() is called before just before discard_initial_modules()
> (see XSA-372 for the rationale).
> 
> Daniel, can you please rebase this series to the latest staging?

Yeah they should be rebased. I have done it so that I could test this
approach as well, see attached.

I also added a patch that calls:

  xsm_elevate_priv(current->domain);

at the beginning of create_domUs, then calls:

  xsm_demote_priv(current->domain);

at the end of create_domUs.

With all that in place, dom0less+PV drivers works fine.

Note that I don't know if we want to do this within create_domUs of if
there is a better place, I was just trying to make sure everything works
as expected.
--8323329-641972864-1648758615=:2910984
Content-Type: text/x-diff; name=0001-xsm-add-ability-to-elevate-a-domain-to-privileged.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2203311330130.2910984@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: attachment; filename=0001-xsm-add-ability-to-elevate-a-domain-to-privileged.patch

RnJvbSBhNTI1YzVhMDRhODQ4M2VlOTIxN2IwYmU2ZGViMTJkNjY1ZTNmZDcy
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogIkRhbmllbCBQLiBT
bWl0aCIgPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+DQpEYXRlOiBU
aHUsIDMxIE1hciAyMDIyIDEzOjIwOjE0IC0wNzAwDQpTdWJqZWN0OiBbUEFU
Q0ggMS8zXSB4c206IGFkZCBhYmlsaXR5IHRvIGVsZXZhdGUgYSBkb21haW4g
dG8gcHJpdmlsZWdlZA0KDQpUaGVyZSBhcmUgbm93IGluc3RhbmNlcyB3aGVy
ZSBpbnRlcm5hbCBoeXBlcnZpc29yIGxvZ2ljIG5lZWRzIHRvIG1ha2UgcmVz
b3VyY2UNCmFsbG9jYXRpb24gY2FsbHMgdGhhdCBhcmUgcHJvdGVjdGVkIGJ5
IFhTTSBjaGVja3MuIFRoZSBpbnRlcm5hbCBoeXBlcnZpc29yIGxvZ2ljDQpp
cyByZXByZXNlbnRlZCBhIG51bWJlciBvZiBzeXN0ZW0gZG9tYWlucyB3aGlj
aCBieSBkZXNpZ25lZCBhcmUgcmVwcmVzZW50ZWQgYnkNCm5vbi1wcml2aWxl
Z2VkIHN0cnVjdCBkb21haW4gaW5zdGFuY2VzLiBUbyBlbmFibGUgdGhlc2Ug
bG9naWMgYmxvY2tzIHRvDQpmdW5jdGlvbiBjb3JyZWN0bHkgYnV0IGluIGEg
Y29udHJvbGxlZCBtYW5uZXIsIHRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBw
YWlyDQpvZiBwcml2aWxlZ2UgZXNjYWxhdGlvbiBhbmQgZGVtb3Rpb24gZnVu
Y3Rpb25zIHRoYXQgd2lsbCBtYWtlIGEgc3lzdGVtIGRvbWFpbg0KcHJpdmls
ZWdlZCBhbmQgdGhlbiByZW1vdmUgdGhhdCBwcml2aWxlZ2UuDQoNClNpZ25l
ZC1vZmYtYnk6IERhbmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29s
dXRpb25zLmNvbT4NCg0KLS0tDQogeGVuL2luY2x1ZGUveHNtL3hzbS5oIHwg
MjIgKysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94
c20veHNtLmggYi94ZW4vaW5jbHVkZS94c20veHNtLmgNCmluZGV4IDNlMmI3
ZmUzZGIuLjUwNWRmZDgzMDggMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS94
c20veHNtLmgNCisrKyBiL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KQEAgLTIw
Miw2ICsyMDIsMjggQEAgc3RydWN0IHhzbV9vcHMgew0KICNlbmRpZg0KIH07
DQogDQorc3RhdGljIGFsd2F5c19pbmxpbmUgaW50IHhzbV9lbGV2YXRlX3By
aXYoc3RydWN0IGRvbWFpbiAqZCkNCit7DQorICAgIGlmICggaXNfc3lzdGVt
X2RvbWFpbihkKSApDQorICAgIHsNCisgICAgICAgIGQtPmlzX3ByaXZpbGVn
ZWQgPSB0cnVlOw0KKyAgICAgICAgcmV0dXJuIDA7DQorICAgIH0NCisNCisg
ICAgcmV0dXJuIC1FUEVSTTsNCit9DQorDQorc3RhdGljIGFsd2F5c19pbmxp
bmUgaW50IHhzbV9kZW1vdGVfcHJpdihzdHJ1Y3QgZG9tYWluICpkKQ0KK3sN
CisgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpICkNCisgICAgew0KKyAg
ICAgICAgZC0+aXNfcHJpdmlsZWdlZCA9IGZhbHNlOw0KKyAgICAgICAgcmV0
dXJuIDA7DQorICAgIH0NCisNCisgICAgcmV0dXJuIC1FUEVSTTsNCit9DQor
DQogI2lmZGVmIENPTkZJR19YU00NCiANCiBleHRlcm4gc3RydWN0IHhzbV9v
cHMgeHNtX29wczsNCi0tIA0KMi4yNS4xDQoNCg==

--8323329-641972864-1648758615=:2910984
Content-Type: text/x-diff; name=0002-arch-ensure-idle-domain-is-not-left-privileged.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2203311330131.2910984@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: attachment; filename=0002-arch-ensure-idle-domain-is-not-left-privileged.patch

RnJvbSA1NjhhOTRhMGIzZmU4ZGU4ZjY5ZmRhNGEyNGQ4ODU2MjcyMTcyZGZi
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogIkRhbmllbCBQLiBT
bWl0aCIgPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+DQpEYXRlOiBU
aHUsIDMxIE1hciAyMDIyIDEzOjIwOjQ0IC0wNzAwDQpTdWJqZWN0OiBbUEFU
Q0ggMi8zXSBhcmNoOiBlbnN1cmUgaWRsZSBkb21haW4gaXMgbm90IGxlZnQg
cHJpdmlsZWdlZA0KDQpJdCBpcyBub3cgcG9zc2libGUgdG8gcHJvbW90ZSB0
aGUgaWRsZSBkb21haW4gdG8gcHJpdmlsZWdlZCBkdXJpbmcgc2V0dXAuICBJ
dA0KaXMgbm90IGRlc2lyYWJsZSBmb3IgdGhlIGlkbGUgZG9tYWluIHRvIHN0
aWxsIGJlIHByaXZpbGVnZWQgd2hlbiBtb3ZpbmcgaW50byBhDQpydW5uaW5n
IHN0YXRlLiBJZiB0aGUgaWRsZSBkb21haW4gd2FzIGVsZXZhdGVkIGFuZCBu
b3QgcHJvcGVybHkgZGVtb3RlZCwgaXQgaXMNCmRlc2lyYWJsZSB0byBmYWls
IGF0IHRoaXMgcG9pbnQuIFRoaXMgY29tbWl0IGFkZHMgYW4gYXNzZXJ0IGZv
ciBib3RoIHg4NiBhbmQNCkFybSBqdXN0IGJlZm9yZSB0cmFuc2l0aW9uaW5n
IHRvIGEgcnVubmluZyBzdGF0ZSB0aGF0IGVuc3VyZXMgdGhlIGlkbGUgaXMg
bm90DQpwcml2aWxlZ2VkLg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgUC4g
U21pdGggPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+DQotLS0NCiB4
ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDMgKysrDQogeGVuL2FyY2gveDg2L3Nl
dHVwLmMgfCAzICsrKw0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hl
bi9hcmNoL2FybS9zZXR1cC5jDQppbmRleCBkNWQwNzkyZWQ0Li44YjllZGY1
ZmYzIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMNCisrKyBi
L3hlbi9hcmNoL2FybS9zZXR1cC5jDQpAQCAtMTA0OCw2ICsxMDQ4LDkgQEAg
dm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlz
X29mZnNldCwNCiAgICAgLyogSGlkZSBVQVJUIGZyb20gRE9NMCBpZiB3ZSdy
ZSB1c2luZyBpdCAqLw0KICAgICBzZXJpYWxfZW5kYm9vdCgpOw0KIA0KKyAg
ICAvKiBFbnN1cmUgaWRsZSBkb21haW4gd2FzIG5vdCBsZWZ0IHByaXZpbGVn
ZWQgKi8NCisgICAgQVNTRVJUKGN1cnJlbnQtPmRvbWFpbi0+aXNfcHJpdmls
ZWdlZCA9PSBmYWxzZSkgOw0KKw0KICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNf
U1RBVEVfYWN0aXZlOw0KIA0KICAgICBmb3JfZWFjaF9kb21haW4oIGQgKQ0K
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gv
eDg2L3NldHVwLmMNCmluZGV4IGEwZWU4ZDIwNmYuLmFhYjYxZTUzYTkgMTAw
NjQ0DQotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYw0KKysrIGIveGVuL2Fy
Y2gveDg2L3NldHVwLmMNCkBAIC02NDksNiArNjQ5LDkgQEAgc3RhdGljIHZv
aWQgbm9yZXR1cm4gaW5pdF9kb25lKHZvaWQpDQogICAgIHZvaWQgKnZhOw0K
ICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCBlbmQ7DQogDQorICAgIC8qIEVu
c3VyZSBpZGxlIGRvbWFpbiB3YXMgbm90IGxlZnQgcHJpdmlsZWdlZCAqLw0K
KyAgICBBU1NFUlQoY3VycmVudC0+ZG9tYWluLT5pc19wcml2aWxlZ2VkID09
IGZhbHNlKSA7DQorDQogICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9h
Y3RpdmU7DQogDQogICAgIGRvbWFpbl91bnBhdXNlX2J5X3N5c3RlbWNvbnRy
b2xsZXIoZG9tMCk7DQotLSANCjIuMjUuMQ0KDQo=

--8323329-641972864-1648758615=:2910984
Content-Type: text/x-diff; name=0003-xen-arm-temporarily-elevate-idle_domain-privileged-d.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2203311330132.2910984@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: attachment; filename=0003-xen-arm-temporarily-elevate-idle_domain-privileged-d.patch

RnJvbSA4ODdhODNkODhkNWRjNjMzMWM5Mjk2YjFmNTEzZTNiZGExYWU3NWU4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCkRhdGU6
IFRodSwgMzEgTWFyIDIwMjIgMTM6MjM6MTcgLTA3MDANClN1YmplY3Q6IFtQ
QVRDSCAzLzNdIHhlbi9hcm06IHRlbXBvcmFyaWx5IGVsZXZhdGUgaWRsZV9k
b21haW4gcHJpdmlsZWdlZA0KIGR1cmluZyBjcmVhdGVfZG9tVXMNCg0KY3Jl
YXRlX2RvbVVzIG1pZ2h0IGNhbGwgZnVuY3Rpb25zIHRoYXQgcGVyZm9ybSBY
U00gY2hlY2tzIG9uIHRoZSBjdXJyZW50DQpkb21haW4sIHdoaWNoIGlzIGlk
bGVfZG9tYWluIGF0IHRoaXMgdGltZS4gVGVtcG9yYXJpbHkgZWxldmF0ZQ0K
aWRsZV9kb21haW4gcHJpdmlsZWdlcyBpbiBjcmVhdGVfZG9tVXMuDQoNClNp
Z25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFi
ZWxsaW5pQHhpbGlueC5jb20+DQotLS0NCiB4ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMgfCA1ICsrKysrDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQppbmRleCAw
M2MwMjM0NDBkLi45YTQ5ZWU3ZGNiIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jDQorKysgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMNCkBAIC0yOCw2ICsyOCw3IEBADQogI2luY2x1ZGUgPGFzbS9j
cHVmZWF0dXJlLmg+DQogI2luY2x1ZGUgPGFzbS9kb21haW5fYnVpbGQuaD4N
CiAjaW5jbHVkZSA8eGVuL2V2ZW50Lmg+DQorI2luY2x1ZGUgPHhzbS94c20u
aD4NCiANCiAjaW5jbHVkZSA8eGVuL2lycS5oPg0KICNpbmNsdWRlIDx4ZW4v
Z3JhbnRfdGFibGUuaD4NCkBAIC0zMjU0LDYgKzMyNTUsOCBAQCB2b2lkIF9f
aW5pdCBjcmVhdGVfZG9tVXModm9pZCkNCiAgICAgc3RydWN0IGR0X2Rldmlj
ZV9ub2RlICpub2RlOw0KICAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUgKmNob3NlbiA9IGR0X2ZpbmRfbm9kZV9ieV9wYXRoKCIvY2hvc2VuIik7
DQogDQorICAgIHhzbV9lbGV2YXRlX3ByaXYoY3VycmVudC0+ZG9tYWluKTsN
CisNCiAgICAgQlVHX09OKGNob3NlbiA9PSBOVUxMKTsNCiAgICAgZHRfZm9y
X2VhY2hfY2hpbGRfbm9kZShjaG9zZW4sIG5vZGUpDQogICAgIHsNCkBAIC0z
MzM1LDYgKzMzMzgsOCBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tVXModm9p
ZCkNCiAgICAgICAgIGlmICggY29uc3RydWN0X2RvbVUoZCwgbm9kZSkgIT0g
MCApDQogICAgICAgICAgICAgcGFuaWMoIkNvdWxkIG5vdCBzZXQgdXAgZG9t
YWluICVzXG4iLCBkdF9ub2RlX25hbWUobm9kZSkpOw0KICAgICB9DQorDQor
ICAgIHhzbV9kZW1vdGVfcHJpdihjdXJyZW50LT5kb21haW4pOw0KIH0NCiAN
CiBzdGF0aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tMChzdHJ1Y3QgZG9t
YWluICpkKQ0KLS0gDQoyLjI1LjENCg0K

--8323329-641972864-1648758615=:2910984--


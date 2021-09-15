Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B124F40CE1A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 22:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187897.336914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQbb4-00039V-4K; Wed, 15 Sep 2021 20:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187897.336914; Wed, 15 Sep 2021 20:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQbb4-00037A-0l; Wed, 15 Sep 2021 20:33:34 +0000
Received: by outflank-mailman (input) for mailman id 187897;
 Wed, 15 Sep 2021 20:33:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQbb2-00036F-DL
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 20:33:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30875760-1664-11ec-b57e-12813bfff9fa;
 Wed, 15 Sep 2021 20:33:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2465961101;
 Wed, 15 Sep 2021 20:33:30 +0000 (UTC)
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
X-Inumbo-ID: 30875760-1664-11ec-b57e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631738010;
	bh=DpsoCGwx9doLkCvTqKb9xgdJte7ZqWArXatW0OT7fMQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P9v51plvOBKNC6AS+fA843HA/eCsoUqzDgMkb30BlNjOCnw7EvAmHOg+NF1eZYKEe
	 d8sSkGsgWPZSqp+JF6uCWB4o5Z5QNewylZ+WlYch2ZGCGKpSykPnswt0XN/mgfeheG
	 1J1EsItXZyoDHjWC+KirRbgPknQe8X+KqfEDQYPXkhui1sxBFYlBR/lfv8PvzR+f/Q
	 En9VB+/tvqURWbgiHOtDiu9fitMIh5bDx1TEZSw1cz+M2uyIa4zVXuMbqZtme+hTtd
	 W9NrmnYX0H5WiVBM0HqqfCYCaKTHebdDQFJ12Blxra8G/sy36heDW7x3FXS4q3M9DG
	 UNmz4w2fehb2Q==
Date: Wed, 15 Sep 2021 13:33:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for hardware
 domain
In-Reply-To: <6EA9A8EE-8101-4679-832C-A912819891BC@arm.com>
Message-ID: <alpine.DEB.2.21.2109151321030.21985@sstabellini-ThinkPad-T480s>
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-10-andr2000@gmail.com> <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s> <6a4e6a1d-12c9-09bb-442d-ce7f6586ef89@epam.com> <20b0a8c0-10dc-7473-3c56-a9baeaa43e62@epam.com>
 <6EA9A8EE-8101-4679-832C-A912819891BC@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-579779311-1631738010=:21985"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-579779311-1631738010=:21985
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Sep 2021, Rahul Singh wrote:
> Hi Oleksandr, Stefano,
> 
> > On 15 Sep 2021, at 6:30 am, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com> wrote:
> > 
> > Hi, Rahul!
> > 
> > On 14.09.21 17:24, Oleksandr Andrushchenko wrote:
> >> 
> >> }
> >>>>   +static int pci_ecam_register_mmio_handler(struct domain *d,
> >>>> +                                          struct pci_host_bridge *bridge,
> >>>> +                                          const struct mmio_handler_ops *ops)
> >>>> +{
> >>>> +    struct pci_config_window *cfg = bridge->sysdata;
> >>>> +
> >>>> +    register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL);
> >>>> +    return 0;
> >>>> +}
> >>> Given that struct pci_config_window is generic (it is not specific to
> >>> one bridge), I wonder if we even need the .register_mmio_handler
> >>> callback here.
> >>> 
> >>> In fact,pci_host_bridge->sysdata doesn't even need to be a void*, it
> >>> could be a struct pci_config_window*, right?
> >> 
> >> Rahul, this actually may change your series.
> >> 
> >> Do you think we can do that?
> >> 
> > This is the only change requested that left unanswered by now.
> > 
> > Will it be possible that you change the API accordingly, so I can
> > 
> > implement as Stefano suggests?
> 
> We need pci_host_bridge->sysdata as void* in case we need to implement the new non-ecam PCI controller in XEN.
> Please have a look once in Linux code[1] how bridge->sysdata will be used. struct pci_config_window is used only for 
> ecam supported host controller. Different PCI host controller will have different PCI interface to access the PCI controller.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-rcar-host.c#n309
> 
> I think we need bridge->sysdata in future to implement the new PCI controller.

In my opinion the pci_config_window is too important of an information
to be left inside an opaque pointer, especially when the info under
pci_config_window is both critical and vendor-neutral.

My preference would be something like this:


diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 9c28a4bdc4..c80d846da3 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -55,7 +55,6 @@ struct pci_config_window {
     uint8_t         busn_start;
     uint8_t         busn_end;
     void __iomem    *win;
-    const struct    pci_ecam_ops *ops;
 };
 
 /*
@@ -68,7 +67,8 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     u8 bus_start;                    /* Bus start of this bridge. */
     u8 bus_end;                      /* Bus end of this bridge. */
-    void *sysdata;                   /* Pointer to the config space window*/
+    struct pci_config_window* cfg;   /* Pointer to the bridge config window */
+    void *sysdata;                   /* Pointer to bridge private data */
     const struct pci_ops *ops;
 };


As a reference the attached patch builds. However, I had to remove const
where struct pci_ecam_ops *ops is used.
--8323329-579779311-1631738010=:21985
Content-Type: text/x-diff; name=cfg.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.21.2109151333290.21985@sstabellini-ThinkPad-T480s>
Content-Description: 
Content-Disposition: attachment; filename=cfg.patch

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gv
YXJtL0tjb25maWcNCmluZGV4IGVjZmE2ODIyZTQuLmY5ZDU3Y2EwZmEgMTAw
NjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KKysrIGIveGVuL2Fy
Y2gvYXJtL0tjb25maWcNCkBAIC03LDYgKzcsNyBAQCBjb25maWcgQVJNXzY0
DQogCWRlcGVuZHMgb24gIUFSTV8zMg0KIAlzZWxlY3QgNjRCSVQNCiAJc2Vs
ZWN0IEhBU19GQVNUX01VTFRJUExZDQorCXNlbGVjdCBIQVNfUENJDQogDQog
Y29uZmlnIEFSTQ0KIAlkZWZfYm9vbCB5DQpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3BjaS9lY2FtLmMgYi94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0K
aW5kZXggZDMyZWZiN2ZjYi4uZjZkMGQwMGMxYiAxMDA2NDQNCi0tLSBhL3hl
bi9hcmNoL2FybS9wY2kvZWNhbS5jDQorKysgYi94ZW4vYXJjaC9hcm0vcGNp
L2VjYW0uYw0KQEAgLTI2LDggKzI2LDkgQEANCiB2b2lkIF9faW9tZW0gKnBj
aV9lY2FtX21hcF9idXMoc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdl
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3Qgc2JkZiwgdWludDMyX3Qgd2hlcmUpDQogew0KLSAgICBjb25zdCBz
dHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgKmNmZyA9IGJyaWRnZS0+c3lzZGF0
YTsNCi0gICAgdW5zaWduZWQgaW50IGRldmZuX3NoaWZ0ID0gY2ZnLT5vcHMt
PmJ1c19zaGlmdCAtIDg7DQorICAgIGNvbnN0IHN0cnVjdCBwY2lfZWNhbV9v
cHMgKm9wcyA9IGJyaWRnZS0+c3lzZGF0YTsNCisgICAgY29uc3Qgc3RydWN0
IHBjaV9jb25maWdfd2luZG93ICpjZmcgPSBicmlkZ2UtPmNmZzsNCisgICAg
dW5zaWduZWQgaW50IGRldmZuX3NoaWZ0ID0gb3BzLT5idXNfc2hpZnQgLSA4
Ow0KICAgICB2b2lkIF9faW9tZW0gKmJhc2U7DQogDQogICAgIHBjaV9zYmRm
X3Qgc2JkZl90ID0gKHBjaV9zYmRmX3QpIHNiZGYgOw0KQEAgLTM3LDcgKzM4
LDcgQEAgdm9pZCBfX2lvbWVtICpwY2lfZWNhbV9tYXBfYnVzKHN0cnVjdCBw
Y2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwNCiAgICAgICAgIHJldHVybiBOVUxM
Ow0KIA0KICAgICBidXNuIC09IGNmZy0+YnVzbl9zdGFydDsNCi0gICAgYmFz
ZSA9IGNmZy0+d2luICsgKGJ1c24gPDwgY2ZnLT5vcHMtPmJ1c19zaGlmdCk7
DQorICAgIGJhc2UgPSBjZmctPndpbiArIChidXNuIDw8IG9wcy0+YnVzX3No
aWZ0KTsNCiANCiAgICAgcmV0dXJuIGJhc2UgKyAoUENJX0RFVkZOKHNiZGZf
dC5kZXYsIHNiZGZfdC5mbikgPDwgZGV2Zm5fc2hpZnQpICsgd2hlcmU7DQog
fQ0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29t
bW9uLmMgYi94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQpp
bmRleCBjMDRiZTYzNjQ1Li40MWE1NDU3ZTgwIDEwMDY0NA0KLS0tIGEveGVu
L2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYw0KKysrIGIveGVuL2Fy
Y2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYw0KQEAgLTk3LDcgKzk3LDYg
QEAgc3RhdGljIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyAqZ2VuX3BjaV9p
bml0KHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LA0KIA0KICAgICBjZmct
PnBoeXNfYWRkciA9IGFkZHI7DQogICAgIGNmZy0+c2l6ZSA9IHNpemU7DQot
ICAgIGNmZy0+b3BzID0gb3BzOw0KIA0KICAgICAvKg0KICAgICAgKiBPbiA2
NC1iaXQgc3lzdGVtcywgd2UgZG8gYSBzaW5nbGUgaW9yZW1hcCBmb3IgdGhl
IHdob2xlIGNvbmZpZyBzcGFjZQ0KQEAgLTIyNSw3ICsyMjQsNyBAQCBzdGF0
aWMgaW50IHBjaV9idXNfZmluZF9kb21haW5fbnIoc3RydWN0IGR0X2Rldmlj
ZV9ub2RlICpkZXYpDQogfQ0KIA0KIGludCBwY2lfaG9zdF9jb21tb25fcHJv
YmUoc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsDQotICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1fb3BzICpvcHMs
DQorICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGNpX2VjYW1f
b3BzICpvcHMsDQogICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZWNh
bV9yZWdfaWR4KQ0KIHsNCiAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAq
YnJpZGdlOw0KQEAgLTI0NSw3ICsyNDQsOCBAQCBpbnQgcGNpX2hvc3RfY29t
bW9uX3Byb2JlKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LA0KICAgICB9
DQogDQogICAgIGJyaWRnZS0+ZHRfbm9kZSA9IGRldjsNCi0gICAgYnJpZGdl
LT5zeXNkYXRhID0gY2ZnOw0KKyAgICBicmlkZ2UtPmNmZyA9IGNmZzsNCisg
ICAgYnJpZGdlLT5zeXNkYXRhID0gb3BzOw0KICAgICBicmlkZ2UtPm9wcyA9
ICZvcHMtPnBjaV9vcHM7DQogICAgIGJyaWRnZS0+YnVzX3N0YXJ0ID0gY2Zn
LT5idXNuX3N0YXJ0Ow0KICAgICBicmlkZ2UtPmJ1c19lbmQgPSBjZmctPmJ1
c25fZW5kOw0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhv
c3QtZ2VuZXJpYy5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1nZW5l
cmljLmMNCmluZGV4IDJkNjUyZTg5MTAuLjY2MTc2Zjk2NTggMTAwNjQ0DQot
LS0gYS94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWdlbmVyaWMuYw0KKysr
IGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1nZW5lcmljLmMNCkBAIC0z
Miw3ICszMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21h
dGNoIGdlbl9wY2lfZHRfbWF0Y2hbXSA9IHsNCiBzdGF0aWMgaW50IGdlbl9w
Y2lfZHRfaW5pdChzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwgY29uc3Qg
dm9pZCAqZGF0YSkNCiB7DQogICAgIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vf
bWF0Y2ggKm9mX2lkOw0KLSAgICBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1fb3Bz
ICpvcHM7DQorICAgIHN0cnVjdCBwY2lfZWNhbV9vcHMgKm9wczsNCiANCiAg
ICAgb2ZfaWQgPSBkdF9tYXRjaF9ub2RlKGdlbl9wY2lfZHRfbWF0Y2gsIGRl
di0+ZGV2Lm9mX25vZGUpOw0KICAgICBvcHMgPSAoc3RydWN0IHBjaV9lY2Ft
X29wcyAqKSBvZl9pZC0+ZGF0YTsNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vcGNpL3BjaS1ob3N0LXp5bnFtcC5jIGIveGVuL2FyY2gvYXJtL3BjaS9w
Y2ktaG9zdC16eW5xbXAuYw0KaW5kZXggZmUxMDNlMzg1NS4uYjQxNzBjM2Jk
ZCAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3Qtenlu
cW1wLmMNCisrKyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtenlucW1w
LmMNCkBAIC0zMiw3ICszMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHRf
ZGV2aWNlX21hdGNoIGdlbl9wY2lfZHRfbWF0Y2hbXSA9IHsNCiBzdGF0aWMg
aW50IGdlbl9wY2lfZHRfaW5pdChzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRl
diwgY29uc3Qgdm9pZCAqZGF0YSkNCiB7DQogICAgIGNvbnN0IHN0cnVjdCBk
dF9kZXZpY2VfbWF0Y2ggKm9mX2lkOw0KLSAgICBjb25zdCBzdHJ1Y3QgcGNp
X2VjYW1fb3BzICpvcHM7DQorICAgIHN0cnVjdCBwY2lfZWNhbV9vcHMgKm9w
czsNCiANCiAgICAgb2ZfaWQgPSBkdF9tYXRjaF9ub2RlKGdlbl9wY2lfZHRf
bWF0Y2gsIGRldi0+ZGV2Lm9mX25vZGUpOw0KICAgICBvcHMgPSAoc3RydWN0
IHBjaV9lY2FtX29wcyAqKSBvZl9pZC0+ZGF0YTsNCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL3BjaS5oIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9wY2kuaA0KaW5kZXggOWMyOGE0YmRjNC4uYzgwZDg0NmRhMyAxMDA2NDQN
Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmgNCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vcGNpLmgNCkBAIC01NSw3ICs1NSw2IEBAIHN0cnVj
dCBwY2lfY29uZmlnX3dpbmRvdyB7DQogICAgIHVpbnQ4X3QgICAgICAgICBi
dXNuX3N0YXJ0Ow0KICAgICB1aW50OF90ICAgICAgICAgYnVzbl9lbmQ7DQog
ICAgIHZvaWQgX19pb21lbSAgICAqd2luOw0KLSAgICBjb25zdCBzdHJ1Y3Qg
ICAgcGNpX2VjYW1fb3BzICpvcHM7DQogfTsNCiANCiAvKg0KQEAgLTY4LDcg
KzY3LDggQEAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSB7DQogICAgIHVpbnQx
Nl90IHNlZ21lbnQ7ICAgICAgICAgICAgICAgIC8qIFNlZ21lbnQgbnVtYmVy
ICovDQogICAgIHU4IGJ1c19zdGFydDsgICAgICAgICAgICAgICAgICAgIC8q
IEJ1cyBzdGFydCBvZiB0aGlzIGJyaWRnZS4gKi8NCiAgICAgdTggYnVzX2Vu
ZDsgICAgICAgICAgICAgICAgICAgICAgLyogQnVzIGVuZCBvZiB0aGlzIGJy
aWRnZS4gKi8NCi0gICAgdm9pZCAqc3lzZGF0YTsgICAgICAgICAgICAgICAg
ICAgLyogUG9pbnRlciB0byB0aGUgY29uZmlnIHNwYWNlIHdpbmRvdyovDQor
ICAgIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyogY2ZnOyAgIC8qIFBvaW50
ZXIgdG8gdGhlIGJyaWRnZSBjb25maWcgd2luZG93ICovDQorICAgIHZvaWQg
KnN5c2RhdGE7ICAgICAgICAgICAgICAgICAgIC8qIFBvaW50ZXIgdG8gYnJp
ZGdlIHByaXZhdGUgZGF0YSAqLw0KICAgICBjb25zdCBzdHJ1Y3QgcGNpX29w
cyAqb3BzOw0KIH07DQogDQpAQCAtMTAwLDcgKzEwMCw3IEBAIHN0cnVjdCBw
Y2lfZWNhbV9vcHMgew0KIGV4dGVybiBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1f
b3BzIHBjaV9nZW5lcmljX2VjYW1fb3BzOw0KIA0KIGludCBwY2lfaG9zdF9j
b21tb25fcHJvYmUoc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsDQotICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1f
b3BzICpvcHMsDQorICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
cGNpX2VjYW1fb3BzICpvcHMsDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgZWNhbV9yZWdfaWR4KTsNCiBpbnQgcGNpX2dlbmVyaWNfY29uZmln
X3JlYWQoc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlLCB1aW50MzJf
dCBzYmRmLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJf
dCByZWcsIHVpbnQzMl90IGxlbiwgdWludDMyX3QgKnZhbHVlKTsNCg==

--8323329-579779311-1631738010=:21985--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E12C470
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:36:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQF-0004sa-66; Tue, 28 May 2019 10:33:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQ6-0004dr-OU
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:26 +0000
X-Inumbo-ID: 0528ab92-8134-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0528ab92-8134-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 10:33:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9EE50B040;
 Tue, 28 May 2019 10:33:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:37 +0200
Message-Id: <20190528103313.1343-25-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 24/60] xen/sched: make arinc653 scheduler vcpu
 agnostic.
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3dpdGNoIGFyaW5jNjUzIHNjaGVkdWxlciBjb21wbGV0ZWx5IGZyb20gdmNwdSB0byBzY2hlZF91
bml0IHVzYWdlLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KIHhlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYyB8IDIwOCArKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwMSBpbnNlcnRp
b25zKCspLCAxMDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9h
cmluYzY1My5jIGIveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1My5jCmluZGV4IDBjNzU0NDBiZDAu
LjIxM2JjOTYwZWYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYworKysg
Yi94ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKQEAgLTQ1LDE1ICs0NSwxNSBAQAogI2RlZmlu
ZSBERUZBVUxUX1RJTUVTTElDRSBNSUxMSVNFQ1MoMTApCiAKIC8qKgotICogUmV0cmlldmUgdGhl
IGlkbGUgVkNQVSBmb3IgYSBnaXZlbiBwaHlzaWNhbCBDUFUKKyAqIFJldHJpZXZlIHRoZSBpZGxl
IFVOSVQgZm9yIGEgZ2l2ZW4gcGh5c2ljYWwgQ1BVCiAgKi8KLSNkZWZpbmUgSURMRVRBU0soY3B1
KSAgKGlkbGVfdmNwdVtjcHVdKQorI2RlZmluZSBJRExFVEFTSyhjcHUpICAoc2NoZWRfaWRsZV91
bml0KGNwdSkpCiAKIC8qKgogICogUmV0dXJuIGEgcG9pbnRlciB0byB0aGUgQVJJTkMgNjUzLXNw
ZWNpZmljIHNjaGVkdWxlciBkYXRhIGluZm9ybWF0aW9uCi0gKiBhc3NvY2lhdGVkIHdpdGggdGhl
IGdpdmVuIFZDUFUgKHZjKQorICogYXNzb2NpYXRlZCB3aXRoIHRoZSBnaXZlbiBVTklUICh1bml0
KQogICovCi0jZGVmaW5lIEFWQ1BVKHZjKSAoKGFyaW5jNjUzX3ZjcHVfdCAqKSh2YyktPnNjaGVk
X3VuaXQtPnByaXYpCisjZGVmaW5lIEFVTklUKHVuaXQpICgoYXJpbmM2NTNfdW5pdF90ICopKHVu
aXQpLT5wcml2KQogCiAvKioKICAqIFJldHVybiB0aGUgZ2xvYmFsIHNjaGVkdWxlciBwcml2YXRl
IGRhdGEgZ2l2ZW4gdGhlIHNjaGVkdWxlciBvcHMgcG9pbnRlcgpAQCAtNjUsMjAgKzY1LDIwIEBA
CiAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKiovCiAKIC8qKgotICogVGhlIGFyaW5jNjUzX3ZjcHVfdCBzdHJ1
Y3R1cmUgaG9sZHMgQVJJTkMgNjUzLXNjaGVkdWxlci1zcGVjaWZpYwotICogaW5mb3JtYXRpb24g
Zm9yIGFsbCBub24taWRsZSBWQ1BVcworICogVGhlIGFyaW5jNjUzX3VuaXRfdCBzdHJ1Y3R1cmUg
aG9sZHMgQVJJTkMgNjUzLXNjaGVkdWxlci1zcGVjaWZpYworICogaW5mb3JtYXRpb24gZm9yIGFs
bCBub24taWRsZSBVTklUcwogICovCi10eXBlZGVmIHN0cnVjdCBhcmluYzY1M192Y3B1X3MKK3R5
cGVkZWYgc3RydWN0IGFyaW5jNjUzX3VuaXRfcwogewotICAgIC8qIHZjIHBvaW50cyB0byBYZW4n
cyBzdHJ1Y3QgdmNwdSBzbyB3ZSBjYW4gZ2V0IHRvIGl0IGZyb20gYW4KLSAgICAgKiBhcmluYzY1
M192Y3B1X3QgcG9pbnRlci4gKi8KLSAgICBzdHJ1Y3QgdmNwdSAqICAgICAgIHZjOwotICAgIC8q
IGF3YWtlIGhvbGRzIHdoZXRoZXIgdGhlIFZDUFUgaGFzIGJlZW4gd29rZW4gd2l0aCB2Y3B1X3dh
a2UoKSAqLworICAgIC8qIHVuaXQgcG9pbnRzIHRvIFhlbidzIHN0cnVjdCBzY2hlZF91bml0IHNv
IHdlIGNhbiBnZXQgdG8gaXQgZnJvbSBhbgorICAgICAqIGFyaW5jNjUzX3VuaXRfdCBwb2ludGVy
LiAqLworICAgIHN0cnVjdCBzY2hlZF91bml0ICogdW5pdDsKKyAgICAvKiBhd2FrZSBob2xkcyB3
aGV0aGVyIHRoZSBVTklUIGhhcyBiZWVuIHdva2VuIHdpdGggdmNwdV93YWtlKCkgKi8KICAgICBi
b29sX3QgICAgICAgICAgICAgIGF3YWtlOwotICAgIC8qIGxpc3QgaG9sZHMgdGhlIGxpbmtlZCBs
aXN0IGluZm9ybWF0aW9uIGZvciB0aGUgbGlzdCB0aGlzIFZDUFUKKyAgICAvKiBsaXN0IGhvbGRz
IHRoZSBsaW5rZWQgbGlzdCBpbmZvcm1hdGlvbiBmb3IgdGhlIGxpc3QgdGhpcyBVTklUCiAgICAg
ICogaXMgc3RvcmVkIGluICovCiAgICAgc3RydWN0IGxpc3RfaGVhZCAgICBsaXN0OwotfSBhcmlu
YzY1M192Y3B1X3Q7Cit9IGFyaW5jNjUzX3VuaXRfdDsKIAogLyoqCiAgKiBUaGUgc2NoZWRfZW50
cnlfdCBzdHJ1Y3R1cmUgaG9sZHMgYSBzaW5nbGUgZW50cnkgb2YgdGhlCkBAIC04OSwxNCArODks
MTQgQEAgdHlwZWRlZiBzdHJ1Y3Qgc2NoZWRfZW50cnlfcwogICAgIC8qIGRvbV9oYW5kbGUgaG9s
ZHMgdGhlIGhhbmRsZSAoIlVVSUQiKSBmb3IgdGhlIGRvbWFpbiB0aGF0IHRoaXMKICAgICAgKiBz
Y2hlZHVsZSBlbnRyeSByZWZlcnMgdG8uICovCiAgICAgeGVuX2RvbWFpbl9oYW5kbGVfdCBkb21f
aGFuZGxlOwotICAgIC8qIHZjcHVfaWQgaG9sZHMgdGhlIFZDUFUgbnVtYmVyIGZvciB0aGUgVkNQ
VSB0aGF0IHRoaXMgc2NoZWR1bGUKKyAgICAvKiB1bml0X2lkIGhvbGRzIHRoZSBVTklUIG51bWJl
ciBmb3IgdGhlIFVOSVQgdGhhdCB0aGlzIHNjaGVkdWxlCiAgICAgICogZW50cnkgcmVmZXJzIHRv
LiAqLwotICAgIGludCAgICAgICAgICAgICAgICAgdmNwdV9pZDsKLSAgICAvKiBydW50aW1lIGhv
bGRzIHRoZSBudW1iZXIgb2YgbmFub3NlY29uZHMgdGhhdCB0aGUgVkNQVSBmb3IgdGhpcworICAg
IGludCAgICAgICAgICAgICAgICAgdW5pdF9pZDsKKyAgICAvKiBydW50aW1lIGhvbGRzIHRoZSBu
dW1iZXIgb2YgbmFub3NlY29uZHMgdGhhdCB0aGUgVU5JVCBmb3IgdGhpcwogICAgICAqIHNjaGVk
dWxlIGVudHJ5IHNob3VsZCBiZSBhbGxvd2VkIHRvIHJ1biBwZXIgbWFqb3IgZnJhbWUuICovCiAg
ICAgc190aW1lX3QgICAgICAgICAgICBydW50aW1lOwotICAgIC8qIHZjIGhvbGRzIGEgcG9pbnRl
ciB0byB0aGUgWGVuIFZDUFUgc3RydWN0dXJlICovCi0gICAgc3RydWN0IHZjcHUgKiAgICAgICB2
YzsKKyAgICAvKiB1bml0IGhvbGRzIGEgcG9pbnRlciB0byB0aGUgWGVuIHNjaGVkX3VuaXQgc3Ry
dWN0dXJlICovCisgICAgc3RydWN0IHNjaGVkX3VuaXQgKiB1bml0OwogfSBzY2hlZF9lbnRyeV90
OwogCiAvKioKQEAgLTExMCw5ICsxMTAsOSBAQCB0eXBlZGVmIHN0cnVjdCBhNjUzc2NoZWRfcHJp
dl9zCiAgICAgLyoqCiAgICAgICogVGhpcyBhcnJheSBob2xkcyB0aGUgYWN0aXZlIEFSSU5DIDY1
MyBzY2hlZHVsZS4KICAgICAgKgotICAgICAqIFdoZW4gdGhlIHN5c3RlbSB0cmllcyB0byBzdGFy
dCBhIG5ldyBWQ1BVLCB0aGlzIHNjaGVkdWxlIGlzIHNjYW5uZWQKLSAgICAgKiB0byBsb29rIGZv
ciBhIG1hdGNoaW5nIChoYW5kbGUsIFZDUFUgIykgcGFpci4gSWYgYm90aCB0aGUgaGFuZGxlIChV
VUlEKQotICAgICAqIGFuZCBWQ1BVIG51bWJlciBtYXRjaCwgdGhlbiB0aGUgVkNQVSBpcyBhbGxv
d2VkIHRvIHJ1bi4gSXRzIHJ1biB0aW1lCisgICAgICogV2hlbiB0aGUgc3lzdGVtIHRyaWVzIHRv
IHN0YXJ0IGEgbmV3IFVOSVQsIHRoaXMgc2NoZWR1bGUgaXMgc2Nhbm5lZAorICAgICAqIHRvIGxv
b2sgZm9yIGEgbWF0Y2hpbmcgKGhhbmRsZSwgVU5JVCAjKSBwYWlyLiBJZiBib3RoIHRoZSBoYW5k
bGUgKFVVSUQpCisgICAgICogYW5kIFVOSVQgbnVtYmVyIG1hdGNoLCB0aGVuIHRoZSBVTklUIGlz
IGFsbG93ZWQgdG8gcnVuLiBJdHMgcnVuIHRpbWUKICAgICAgKiAocGVyIG1ham9yIGZyYW1lKSBp
cyBnaXZlbiBpbiB0aGUgdGhpcmQgZW50cnkgb2YgdGhlIHNjaGVkdWxlLgogICAgICAqLwogICAg
IHNjaGVkX2VudHJ5X3Qgc2NoZWR1bGVbQVJJTkM2NTNfTUFYX0RPTUFJTlNfUEVSX1NDSEVEVUxF
XTsKQEAgLTEyMyw4ICsxMjMsOCBAQCB0eXBlZGVmIHN0cnVjdCBhNjUzc2NoZWRfcHJpdl9zCiAg
ICAgICoKICAgICAgKiBUaGlzIGlzIG5vdCBuZWNlc3NhcmlseSB0aGUgc2FtZSBhcyB0aGUgbnVt
YmVyIG9mIGRvbWFpbnMgaW4gdGhlCiAgICAgICogc2NoZWR1bGUuIEEgZG9tYWluIGNvdWxkIGJl
IGxpc3RlZCBtdWx0aXBsZSB0aW1lcyB3aXRoaW4gdGhlIHNjaGVkdWxlLAotICAgICAqIG9yIGEg
ZG9tYWluIHdpdGggbXVsdGlwbGUgVkNQVXMgY291bGQgaGF2ZSBhIGRpZmZlcmVudAotICAgICAq
IHNjaGVkdWxlIGVudHJ5IGZvciBlYWNoIFZDUFUuCisgICAgICogb3IgYSBkb21haW4gd2l0aCBt
dWx0aXBsZSBVTklUcyBjb3VsZCBoYXZlIGEgZGlmZmVyZW50CisgICAgICogc2NoZWR1bGUgZW50
cnkgZm9yIGVhY2ggVU5JVC4KICAgICAgKi8KICAgICB1bnNpZ25lZCBpbnQgbnVtX3NjaGVkdWxl
X2VudHJpZXM7CiAKQEAgLTEzOSw5ICsxMzksOSBAQCB0eXBlZGVmIHN0cnVjdCBhNjUzc2NoZWRf
cHJpdl9zCiAgICAgc190aW1lX3QgbmV4dF9tYWpvcl9mcmFtZTsKIAogICAgIC8qKgotICAgICAq
IHBvaW50ZXJzIHRvIGFsbCBYZW4gVkNQVSBzdHJ1Y3R1cmVzIGZvciBpdGVyYXRpbmcgdGhyb3Vn
aAorICAgICAqIHBvaW50ZXJzIHRvIGFsbCBYZW4gVU5JVCBzdHJ1Y3R1cmVzIGZvciBpdGVyYXRp
bmcgdGhyb3VnaAogICAgICAqLwotICAgIHN0cnVjdCBsaXN0X2hlYWQgdmNwdV9saXN0OworICAg
IHN0cnVjdCBsaXN0X2hlYWQgdW5pdF9saXN0OwogfSBhNjUzc2NoZWRfcHJpdl90OwogCiAvKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKQEAgLTE2Nyw1MCArMTY3LDUwIEBAIHN0YXRpYyBpbnQgZG9tX2hhbmRs
ZV9jbXAoY29uc3QgeGVuX2RvbWFpbl9oYW5kbGVfdCBoMSwKIH0KIAogLyoqCi0gKiBUaGlzIGZ1
bmN0aW9uIHNlYXJjaGVzIHRoZSB2Y3B1IGxpc3QgdG8gZmluZCBhIFZDUFUgdGhhdCBtYXRjaGVz
Ci0gKiB0aGUgZG9tYWluIGhhbmRsZSBhbmQgVkNQVSBJRCBzcGVjaWZpZWQuCisgKiBUaGlzIGZ1
bmN0aW9uIHNlYXJjaGVzIHRoZSB1bml0IGxpc3QgdG8gZmluZCBhIFVOSVQgdGhhdCBtYXRjaGVz
CisgKiB0aGUgZG9tYWluIGhhbmRsZSBhbmQgVU5JVCBJRCBzcGVjaWZpZWQuCiAgKgogICogQHBh
cmFtIG9wcyAgICAgICBQb2ludGVyIHRvIHRoaXMgaW5zdGFuY2Ugb2YgdGhlIHNjaGVkdWxlciBz
dHJ1Y3R1cmUKICAqIEBwYXJhbSBoYW5kbGUgICAgUG9pbnRlciB0byBoYW5kbGVyCi0gKiBAcGFy
YW0gdmNwdV9pZCAgIFZDUFUgSUQKKyAqIEBwYXJhbSB1bml0X2lkICAgVU5JVCBJRAogICoKICAq
IEByZXR1cm4gICAgICAgICAgPHVsPgotICogICAgICAgICAgICAgICAgICA8bGk+IFBvaW50ZXIg
dG8gdGhlIG1hdGNoaW5nIFZDUFUgaWYgb25lIGlzIGZvdW5kCisgKiAgICAgICAgICAgICAgICAg
IDxsaT4gUG9pbnRlciB0byB0aGUgbWF0Y2hpbmcgVU5JVCBpZiBvbmUgaXMgZm91bmQKICAqICAg
ICAgICAgICAgICAgICAgPGxpPiBOVUxMIG90aGVyd2lzZQogICogICAgICAgICAgICAgICAgICA8
L3VsPgogICovCi1zdGF0aWMgc3RydWN0IHZjcHUgKmZpbmRfdmNwdSgKK3N0YXRpYyBzdHJ1Y3Qg
c2NoZWRfdW5pdCAqZmluZF91bml0KAogICAgIGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywK
ICAgICB4ZW5fZG9tYWluX2hhbmRsZV90IGhhbmRsZSwKLSAgICBpbnQgdmNwdV9pZCkKKyAgICBp
bnQgdW5pdF9pZCkKIHsKLSAgICBhcmluYzY1M192Y3B1X3QgKmF2Y3B1OworICAgIGFyaW5jNjUz
X3VuaXRfdCAqYXVuaXQ7CiAKLSAgICAvKiBsb29wIHRocm91Z2ggdGhlIHZjcHVfbGlzdCBsb29r
aW5nIGZvciB0aGUgc3BlY2lmaWVkIFZDUFUgKi8KLSAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICgg
YXZjcHUsICZTQ0hFRF9QUklWKG9wcyktPnZjcHVfbGlzdCwgbGlzdCApCi0gICAgICAgIGlmICgg
KGRvbV9oYW5kbGVfY21wKGF2Y3B1LT52Yy0+ZG9tYWluLT5oYW5kbGUsIGhhbmRsZSkgPT0gMCkK
LSAgICAgICAgICAgICAmJiAodmNwdV9pZCA9PSBhdmNwdS0+dmMtPnZjcHVfaWQpICkKLSAgICAg
ICAgICAgIHJldHVybiBhdmNwdS0+dmM7CisgICAgLyogbG9vcCB0aHJvdWdoIHRoZSB1bml0X2xp
c3QgbG9va2luZyBmb3IgdGhlIHNwZWNpZmllZCBVTklUICovCisgICAgbGlzdF9mb3JfZWFjaF9l
bnRyeSAoIGF1bml0LCAmU0NIRURfUFJJVihvcHMpLT51bml0X2xpc3QsIGxpc3QgKQorICAgICAg
ICBpZiAoIChkb21faGFuZGxlX2NtcChhdW5pdC0+dW5pdC0+ZG9tYWluLT5oYW5kbGUsIGhhbmRs
ZSkgPT0gMCkKKyAgICAgICAgICAgICAmJiAodW5pdF9pZCA9PSBhdW5pdC0+dW5pdC0+dW5pdF9p
ZCkgKQorICAgICAgICAgICAgcmV0dXJuIGF1bml0LT51bml0OwogCiAgICAgcmV0dXJuIE5VTEw7
CiB9CiAKIC8qKgotICogVGhpcyBmdW5jdGlvbiB1cGRhdGVzIHRoZSBwb2ludGVyIHRvIHRoZSBY
ZW4gVkNQVSBzdHJ1Y3R1cmUgZm9yIGVhY2ggZW50cnkKKyAqIFRoaXMgZnVuY3Rpb24gdXBkYXRl
cyB0aGUgcG9pbnRlciB0byB0aGUgWGVuIFVOSVQgc3RydWN0dXJlIGZvciBlYWNoIGVudHJ5CiAg
KiBpbiB0aGUgQVJJTkMgNjUzIHNjaGVkdWxlLgogICoKICAqIEBwYXJhbSBvcHMgICAgICAgUG9p
bnRlciB0byB0aGlzIGluc3RhbmNlIG9mIHRoZSBzY2hlZHVsZXIgc3RydWN0dXJlCiAgKiBAcmV0
dXJuICAgICAgICAgIDxOb25lPgogICovCi1zdGF0aWMgdm9pZCB1cGRhdGVfc2NoZWR1bGVfdmNw
dXMoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzKQorc3RhdGljIHZvaWQgdXBkYXRlX3NjaGVk
dWxlX3VuaXRzKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcykKIHsKICAgICB1bnNpZ25lZCBp
bnQgaSwgbl9lbnRyaWVzID0gU0NIRURfUFJJVihvcHMpLT5udW1fc2NoZWR1bGVfZW50cmllczsK
IAogICAgIGZvciAoIGkgPSAwOyBpIDwgbl9lbnRyaWVzOyBpKysgKQotICAgICAgICBTQ0hFRF9Q
UklWKG9wcyktPnNjaGVkdWxlW2ldLnZjID0KLSAgICAgICAgICAgIGZpbmRfdmNwdShvcHMsCisg
ICAgICAgIFNDSEVEX1BSSVYob3BzKS0+c2NoZWR1bGVbaV0udW5pdCA9CisgICAgICAgICAgICBm
aW5kX3VuaXQob3BzLAogICAgICAgICAgICAgICAgICAgICAgIFNDSEVEX1BSSVYob3BzKS0+c2No
ZWR1bGVbaV0uZG9tX2hhbmRsZSwKLSAgICAgICAgICAgICAgICAgICAgICBTQ0hFRF9QUklWKG9w
cyktPnNjaGVkdWxlW2ldLnZjcHVfaWQpOworICAgICAgICAgICAgICAgICAgICAgIFNDSEVEX1BS
SVYob3BzKS0+c2NoZWR1bGVbaV0udW5pdF9pZCk7CiB9CiAKIC8qKgpAQCAtMjY4LDEyICsyNjgs
MTIgQEAgYXJpbmM2NTNfc2NoZWRfc2V0KAogICAgICAgICBtZW1jcHkoc2NoZWRfcHJpdi0+c2No
ZWR1bGVbaV0uZG9tX2hhbmRsZSwKICAgICAgICAgICAgICAgIHNjaGVkdWxlLT5zY2hlZF9lbnRy
aWVzW2ldLmRvbV9oYW5kbGUsCiAgICAgICAgICAgICAgICBzaXplb2Yoc2NoZWRfcHJpdi0+c2No
ZWR1bGVbaV0uZG9tX2hhbmRsZSkpOwotICAgICAgICBzY2hlZF9wcml2LT5zY2hlZHVsZVtpXS52
Y3B1X2lkID0KKyAgICAgICAgc2NoZWRfcHJpdi0+c2NoZWR1bGVbaV0udW5pdF9pZCA9CiAgICAg
ICAgICAgICBzY2hlZHVsZS0+c2NoZWRfZW50cmllc1tpXS52Y3B1X2lkOwogICAgICAgICBzY2hl
ZF9wcml2LT5zY2hlZHVsZVtpXS5ydW50aW1lID0KICAgICAgICAgICAgIHNjaGVkdWxlLT5zY2hl
ZF9lbnRyaWVzW2ldLnJ1bnRpbWU7CiAgICAgfQotICAgIHVwZGF0ZV9zY2hlZHVsZV92Y3B1cyhv
cHMpOworICAgIHVwZGF0ZV9zY2hlZHVsZV91bml0cyhvcHMpOwogCiAgICAgLyoKICAgICAgKiBU
aGUgbmV3bHktaW5zdGFsbGVkIHNjaGVkdWxlIHRha2VzIGVmZmVjdCBpbW1lZGlhdGVseS4gV2Ug
ZG8gbm90IGV2ZW4KQEAgLTMxOSw3ICszMTksNyBAQCBhcmluYzY1M19zY2hlZF9nZXQoCiAgICAg
ICAgIG1lbWNweShzY2hlZHVsZS0+c2NoZWRfZW50cmllc1tpXS5kb21faGFuZGxlLAogICAgICAg
ICAgICAgICAgc2NoZWRfcHJpdi0+c2NoZWR1bGVbaV0uZG9tX2hhbmRsZSwKICAgICAgICAgICAg
ICAgIHNpemVvZihzY2hlZF9wcml2LT5zY2hlZHVsZVtpXS5kb21faGFuZGxlKSk7Ci0gICAgICAg
IHNjaGVkdWxlLT5zY2hlZF9lbnRyaWVzW2ldLnZjcHVfaWQgPSBzY2hlZF9wcml2LT5zY2hlZHVs
ZVtpXS52Y3B1X2lkOworICAgICAgICBzY2hlZHVsZS0+c2NoZWRfZW50cmllc1tpXS52Y3B1X2lk
ID0gc2NoZWRfcHJpdi0+c2NoZWR1bGVbaV0udW5pdF9pZDsKICAgICAgICAgc2NoZWR1bGUtPnNj
aGVkX2VudHJpZXNbaV0ucnVudGltZSA9IHNjaGVkX3ByaXYtPnNjaGVkdWxlW2ldLnJ1bnRpbWU7
CiAgICAgfQogCkBAIC0zNTUsNyArMzU1LDcgQEAgYTY1M3NjaGVkX2luaXQoc3RydWN0IHNjaGVk
dWxlciAqb3BzKQogCiAgICAgcHJ2LT5uZXh0X21ham9yX2ZyYW1lID0gMDsKICAgICBzcGluX2xv
Y2tfaW5pdCgmcHJ2LT5sb2NrKTsKLSAgICBJTklUX0xJU1RfSEVBRCgmcHJ2LT52Y3B1X2xpc3Qp
OworICAgIElOSVRfTElTVF9IRUFEKCZwcnYtPnVuaXRfbGlzdCk7CiAKICAgICByZXR1cm4gMDsK
IH0KQEAgLTM3Myw3ICszNzMsNyBAQCBhNjUzc2NoZWRfZGVpbml0KHN0cnVjdCBzY2hlZHVsZXIg
Km9wcykKIH0KIAogLyoqCi0gKiBUaGlzIGZ1bmN0aW9uIGFsbG9jYXRlcyBzY2hlZHVsZXItc3Bl
Y2lmaWMgZGF0YSBmb3IgYSBWQ1BVCisgKiBUaGlzIGZ1bmN0aW9uIGFsbG9jYXRlcyBzY2hlZHVs
ZXItc3BlY2lmaWMgZGF0YSBmb3IgYSBVTklUCiAgKgogICogQHBhcmFtIG9wcyAgICAgICBQb2lu
dGVyIHRvIHRoaXMgaW5zdGFuY2Ugb2YgdGhlIHNjaGVkdWxlciBzdHJ1Y3R1cmUKICAqIEBwYXJh
bSB1bml0ICAgICAgUG9pbnRlciB0byBzdHJ1Y3Qgc2NoZWRfdW5pdApAQCAtMzg1LDM1ICszODUs
MzQgQEAgYTY1M3NjaGVkX2FsbG9jX3ZkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsCiAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGQp
CiB7CiAgICAgYTY1M3NjaGVkX3ByaXZfdCAqc2NoZWRfcHJpdiA9IFNDSEVEX1BSSVYob3BzKTsK
LSAgICBzdHJ1Y3QgdmNwdSAqdmMgPSB1bml0LT52Y3B1OwotICAgIGFyaW5jNjUzX3ZjcHVfdCAq
c3ZjOworICAgIGFyaW5jNjUzX3VuaXRfdCAqc3ZjOwogICAgIHVuc2lnbmVkIGludCBlbnRyeTsK
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwogCiAgICAgLyoKICAgICAgKiBBbGxvY2F0ZSBtZW1v
cnkgZm9yIHRoZSBBUklOQyA2NTMtc3BlY2lmaWMgc2NoZWR1bGVyIGRhdGEgaW5mb3JtYXRpb24K
LSAgICAgKiBhc3NvY2lhdGVkIHdpdGggdGhlIGdpdmVuIFZDUFUgKHZjKS4KKyAgICAgKiBhc3Nv
Y2lhdGVkIHdpdGggdGhlIGdpdmVuIFVOSVQgKHVuaXQpLgogICAgICAqLwotICAgIHN2YyA9IHht
YWxsb2MoYXJpbmM2NTNfdmNwdV90KTsKKyAgICBzdmMgPSB4bWFsbG9jKGFyaW5jNjUzX3VuaXRf
dCk7CiAgICAgaWYgKCBzdmMgPT0gTlVMTCApCiAgICAgICAgIHJldHVybiBOVUxMOwogCiAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkX3ByaXYtPmxvY2ssIGZsYWdzKTsKIAotICAgIC8qIAot
ICAgICAqIEFkZCBldmVyeSBvbmUgb2YgZG9tMCdzIHZjcHVzIHRvIHRoZSBzY2hlZHVsZSwgYXMg
bG9uZyBhcyB0aGVyZSBhcmUKKyAgICAvKgorICAgICAqIEFkZCBldmVyeSBvbmUgb2YgZG9tMCdz
IHVuaXRzIHRvIHRoZSBzY2hlZHVsZSwgYXMgbG9uZyBhcyB0aGVyZSBhcmUKICAgICAgKiBzbG90
cyBhdmFpbGFibGUuCiAgICAgICovCi0gICAgaWYgKCB2Yy0+ZG9tYWluLT5kb21haW5faWQgPT0g
MCApCisgICAgaWYgKCB1bml0LT5kb21haW4tPmRvbWFpbl9pZCA9PSAwICkKICAgICB7CiAgICAg
ICAgIGVudHJ5ID0gc2NoZWRfcHJpdi0+bnVtX3NjaGVkdWxlX2VudHJpZXM7CiAKICAgICAgICAg
aWYgKCBlbnRyeSA8IEFSSU5DNjUzX01BWF9ET01BSU5TX1BFUl9TQ0hFRFVMRSApCiAgICAgICAg
IHsKICAgICAgICAgICAgIHNjaGVkX3ByaXYtPnNjaGVkdWxlW2VudHJ5XS5kb21faGFuZGxlWzBd
ID0gJ1wwJzsKLSAgICAgICAgICAgIHNjaGVkX3ByaXYtPnNjaGVkdWxlW2VudHJ5XS52Y3B1X2lk
ID0gdmMtPnZjcHVfaWQ7CisgICAgICAgICAgICBzY2hlZF9wcml2LT5zY2hlZHVsZVtlbnRyeV0u
dW5pdF9pZCA9IHVuaXQtPnVuaXRfaWQ7CiAgICAgICAgICAgICBzY2hlZF9wcml2LT5zY2hlZHVs
ZVtlbnRyeV0ucnVudGltZSA9IERFRkFVTFRfVElNRVNMSUNFOwotICAgICAgICAgICAgc2NoZWRf
cHJpdi0+c2NoZWR1bGVbZW50cnldLnZjID0gdmM7CisgICAgICAgICAgICBzY2hlZF9wcml2LT5z
Y2hlZHVsZVtlbnRyeV0udW5pdCA9IHVuaXQ7CiAKICAgICAgICAgICAgIHNjaGVkX3ByaXYtPm1h
am9yX2ZyYW1lICs9IERFRkFVTFRfVElNRVNMSUNFOwogICAgICAgICAgICAgKytzY2hlZF9wcml2
LT5udW1fc2NoZWR1bGVfZW50cmllczsKQEAgLTQyMSwxNiArNDIwLDE2IEBAIGE2NTNzY2hlZF9h
bGxvY192ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0
ICp1bml0LAogICAgIH0KIAogICAgIC8qCi0gICAgICogSW5pdGlhbGl6ZSBvdXIgQVJJTkMgNjUz
IHNjaGVkdWxlci1zcGVjaWZpYyBpbmZvcm1hdGlvbiBmb3IgdGhlIFZDUFUuCi0gICAgICogVGhl
IFZDUFUgc3RhcnRzICJhc2xlZXAuIiBXaGVuIFhlbiBpcyByZWFkeSBmb3IgdGhlIFZDUFUgdG8g
cnVuLCBpdAorICAgICAqIEluaXRpYWxpemUgb3VyIEFSSU5DIDY1MyBzY2hlZHVsZXItc3BlY2lm
aWMgaW5mb3JtYXRpb24gZm9yIHRoZSBVTklULgorICAgICAqIFRoZSBVTklUIHN0YXJ0cyAiYXNs
ZWVwLiIgV2hlbiBYZW4gaXMgcmVhZHkgZm9yIHRoZSBVTklUIHRvIHJ1biwgaXQKICAgICAgKiB3
aWxsIGNhbGwgdGhlIHZjcHVfd2FrZSBzY2hlZHVsZXIgY2FsbGJhY2sgZnVuY3Rpb24gYW5kIG91
ciBzY2hlZHVsZXIKLSAgICAgKiB3aWxsIG1hcmsgdGhlIFZDUFUgYXdha2UuCisgICAgICogd2ls
bCBtYXJrIHRoZSBVTklUIGF3YWtlLgogICAgICAqLwotICAgIHN2Yy0+dmMgPSB2YzsKKyAgICBz
dmMtPnVuaXQgPSB1bml0OwogICAgIHN2Yy0+YXdha2UgPSAwOwotICAgIGlmICggIWlzX2lkbGVf
dmNwdSh2YykgKQotICAgICAgICBsaXN0X2FkZCgmc3ZjLT5saXN0LCAmU0NIRURfUFJJVihvcHMp
LT52Y3B1X2xpc3QpOwotICAgIHVwZGF0ZV9zY2hlZHVsZV92Y3B1cyhvcHMpOworICAgIGlmICgg
IWlzX2lkbGVfdW5pdCh1bml0KSApCisgICAgICAgIGxpc3RfYWRkKCZzdmMtPmxpc3QsICZTQ0hF
RF9QUklWKG9wcyktPnVuaXRfbGlzdCk7CisgICAgdXBkYXRlX3NjaGVkdWxlX3VuaXRzKG9wcyk7
CiAKICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZF9wcml2LT5sb2NrLCBmbGFncyk7
CiAKQEAgLTQzOCwyNyArNDM3LDI3IEBAIGE2NTNzY2hlZF9hbGxvY192ZGF0YShjb25zdCBzdHJ1
Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0LAogfQogCiAvKioKLSAq
IFRoaXMgZnVuY3Rpb24gZnJlZXMgc2NoZWR1bGVyLXNwZWNpZmljIFZDUFUgZGF0YQorICogVGhp
cyBmdW5jdGlvbiBmcmVlcyBzY2hlZHVsZXItc3BlY2lmaWMgVU5JVCBkYXRhCiAgKgogICogQHBh
cmFtIG9wcyAgICAgICBQb2ludGVyIHRvIHRoaXMgaW5zdGFuY2Ugb2YgdGhlIHNjaGVkdWxlciBz
dHJ1Y3R1cmUKICAqLwogc3RhdGljIHZvaWQKIGE2NTNzY2hlZF9mcmVlX3ZkYXRhKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKm9wcywgdm9pZCAqcHJpdikKIHsKLSAgICBhcmluYzY1M192Y3B1X3Qg
KmF2ID0gcHJpdjsKKyAgICBhcmluYzY1M191bml0X3QgKmF2ID0gcHJpdjsKIAogICAgIGlmIChh
diA9PSBOVUxMKQogICAgICAgICByZXR1cm47CiAKLSAgICBpZiAoICFpc19pZGxlX3ZjcHUoYXYt
PnZjKSApCisgICAgaWYgKCAhaXNfaWRsZV91bml0KGF2LT51bml0KSApCiAgICAgICAgIGxpc3Rf
ZGVsKCZhdi0+bGlzdCk7CiAKICAgICB4ZnJlZShhdik7Ci0gICAgdXBkYXRlX3NjaGVkdWxlX3Zj
cHVzKG9wcyk7CisgICAgdXBkYXRlX3NjaGVkdWxlX3VuaXRzKG9wcyk7CiB9CiAKIC8qKgotICog
WGVuIHNjaGVkdWxlciBjYWxsYmFjayBmdW5jdGlvbiB0byBzbGVlcCBhIFZDUFUKKyAqIFhlbiBz
Y2hlZHVsZXIgY2FsbGJhY2sgZnVuY3Rpb24gdG8gc2xlZXAgYSBVTklUCiAgKgogICogQHBhcmFt
IG9wcyAgICAgICBQb2ludGVyIHRvIHRoaXMgaW5zdGFuY2Ugb2YgdGhlIHNjaGVkdWxlciBzdHJ1
Y3R1cmUKICAqIEBwYXJhbSB1bml0ICAgICAgUG9pbnRlciB0byBzdHJ1Y3Qgc2NoZWRfdW5pdApA
QCAtNDY2LDIxICs0NjUsMTkgQEAgYTY1M3NjaGVkX2ZyZWVfdmRhdGEoY29uc3Qgc3RydWN0IHNj
aGVkdWxlciAqb3BzLCB2b2lkICpwcml2KQogc3RhdGljIHZvaWQKIGE2NTNzY2hlZF91bml0X3Ns
ZWVwKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQp
CiB7Ci0gICAgc3RydWN0IHZjcHUgKnZjID0gdW5pdC0+dmNwdTsKLQotICAgIGlmICggQVZDUFUo
dmMpICE9IE5VTEwgKQotICAgICAgICBBVkNQVSh2YyktPmF3YWtlID0gMDsKKyAgICBpZiAoIEFV
TklUKHVuaXQpICE9IE5VTEwgKQorICAgICAgICBBVU5JVCh1bml0KS0+YXdha2UgPSAwOwogCiAg
ICAgLyoKLSAgICAgKiBJZiB0aGUgVkNQVSBiZWluZyBwdXQgdG8gc2xlZXAgaXMgdGhlIHNhbWUg
b25lIHRoYXQgaXMgY3VycmVudGx5CisgICAgICogSWYgdGhlIFVOSVQgYmVpbmcgcHV0IHRvIHNs
ZWVwIGlzIHRoZSBzYW1lIG9uZSB0aGF0IGlzIGN1cnJlbnRseQogICAgICAqIHJ1bm5pbmcsIHJh
aXNlIGEgc29mdGlycSB0byBpbnZva2UgdGhlIHNjaGVkdWxlciB0byBzd2l0Y2ggZG9tYWlucy4K
ICAgICAgKi8KLSAgICBpZiAoIGdldF9zY2hlZF9yZXModmMtPnByb2Nlc3NvciktPmN1cnIgPT0g
dW5pdCApCi0gICAgICAgIGNwdV9yYWlzZV9zb2Z0aXJxKHZjLT5wcm9jZXNzb3IsIFNDSEVEVUxF
X1NPRlRJUlEpOworICAgIGlmICggZ2V0X3NjaGVkX3JlcyhzY2hlZF91bml0X2NwdSh1bml0KSkt
PmN1cnIgPT0gdW5pdCApCisgICAgICAgIGNwdV9yYWlzZV9zb2Z0aXJxKHNjaGVkX3VuaXRfY3B1
KHVuaXQpLCBTQ0hFRFVMRV9TT0ZUSVJRKTsKIH0KIAogLyoqCi0gKiBYZW4gc2NoZWR1bGVyIGNh
bGxiYWNrIGZ1bmN0aW9uIHRvIHdha2UgdXAgYSBWQ1BVCisgKiBYZW4gc2NoZWR1bGVyIGNhbGxi
YWNrIGZ1bmN0aW9uIHRvIHdha2UgdXAgYSBVTklUCiAgKgogICogQHBhcmFtIG9wcyAgICAgICBQ
b2ludGVyIHRvIHRoaXMgaW5zdGFuY2Ugb2YgdGhlIHNjaGVkdWxlciBzdHJ1Y3R1cmUKICAqIEBw
YXJhbSB1bml0ICAgICAgUG9pbnRlciB0byBzdHJ1Y3Qgc2NoZWRfdW5pdApAQCAtNDg4LDI0ICs0
ODUsMjIgQEAgYTY1M3NjaGVkX3VuaXRfc2xlZXAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3Bz
LCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKIHN0YXRpYyB2b2lkCiBhNjUzc2NoZWRfdW5pdF93
YWtlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQp
CiB7Ci0gICAgc3RydWN0IHZjcHUgKnZjID0gdW5pdC0+dmNwdTsKKyAgICBpZiAoIEFVTklUKHVu
aXQpICE9IE5VTEwgKQorICAgICAgICBBVU5JVCh1bml0KS0+YXdha2UgPSAxOwogCi0gICAgaWYg
KCBBVkNQVSh2YykgIT0gTlVMTCApCi0gICAgICAgIEFWQ1BVKHZjKS0+YXdha2UgPSAxOwotCi0g
ICAgY3B1X3JhaXNlX3NvZnRpcnEodmMtPnByb2Nlc3NvciwgU0NIRURVTEVfU09GVElSUSk7Cisg
ICAgY3B1X3JhaXNlX3NvZnRpcnEoc2NoZWRfdW5pdF9jcHUodW5pdCksIFNDSEVEVUxFX1NPRlRJ
UlEpOwogfQogCiAvKioKLSAqIFhlbiBzY2hlZHVsZXIgY2FsbGJhY2sgZnVuY3Rpb24gdG8gc2Vs
ZWN0IGEgVkNQVSB0byBydW4uCisgKiBYZW4gc2NoZWR1bGVyIGNhbGxiYWNrIGZ1bmN0aW9uIHRv
IHNlbGVjdCBhIFVOSVQgdG8gcnVuLgogICogVGhpcyBpcyB0aGUgbWFpbiBzY2hlZHVsZXIgcm91
dGluZS4KICAqCiAgKiBAcGFyYW0gb3BzICAgICAgIFBvaW50ZXIgdG8gdGhpcyBpbnN0YW5jZSBv
ZiB0aGUgc2NoZWR1bGVyIHN0cnVjdHVyZQogICogQHBhcmFtIG5vdyAgICAgICBDdXJyZW50IHRp
bWUKICAqCi0gKiBAcmV0dXJuICAgICAgICAgIEFkZHJlc3Mgb2YgdGhlIFZDUFUgc3RydWN0dXJl
IHNjaGVkdWxlZCB0byBiZSBydW4gbmV4dAotICogICAgICAgICAgICAgICAgICBBbW91bnQgb2Yg
dGltZSB0byBleGVjdXRlIHRoZSByZXR1cm5lZCBWQ1BVCi0gKiAgICAgICAgICAgICAgICAgIEZs
YWcgZm9yIHdoZXRoZXIgdGhlIFZDUFUgd2FzIG1pZ3JhdGVkCisgKiBAcmV0dXJuICAgICAgICAg
IEFkZHJlc3Mgb2YgdGhlIFVOSVQgc3RydWN0dXJlIHNjaGVkdWxlZCB0byBiZSBydW4gbmV4dAor
ICogICAgICAgICAgICAgICAgICBBbW91bnQgb2YgdGltZSB0byBleGVjdXRlIHRoZSByZXR1cm5l
ZCBVTklUCisgKiAgICAgICAgICAgICAgICAgIEZsYWcgZm9yIHdoZXRoZXIgdGhlIFVOSVQgd2Fz
IG1pZ3JhdGVkCiAgKi8KIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZQogYTY1M3NjaGVkX2RvX3Nj
aGVkdWxlKApAQCAtNTE0LDcgKzUwOSw3IEBAIGE2NTNzY2hlZF9kb19zY2hlZHVsZSgKICAgICBi
b29sX3QgdGFza2xldF93b3JrX3NjaGVkdWxlZCkKIHsKICAgICBzdHJ1Y3QgdGFza19zbGljZSBy
ZXQ7ICAgICAgICAgICAgICAgICAgICAgIC8qIGhvbGQgdGhlIGNob3NlbiBkb21haW4gKi8KLSAg
ICBzdHJ1Y3QgdmNwdSAqIG5ld190YXNrID0gTlVMTDsKKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAq
bmV3X3Rhc2sgPSBOVUxMOwogICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgc2NoZWRfaW5kZXggPSAw
OwogICAgIHN0YXRpYyBzX3RpbWVfdCBuZXh0X3N3aXRjaF90aW1lOwogICAgIGE2NTNzY2hlZF9w
cml2X3QgKnNjaGVkX3ByaXYgPSBTQ0hFRF9QUklWKG9wcyk7CkBAIC01NTksMTQgKzU1NCwxNCBA
QCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiAgICAgICogc2NoZWRfdW5pdCBzdHJ1Y3R1cmUuCiAg
ICAgICovCiAgICAgbmV3X3Rhc2sgPSAoc2NoZWRfaW5kZXggPCBzY2hlZF9wcml2LT5udW1fc2No
ZWR1bGVfZW50cmllcykKLSAgICAgICAgPyBzY2hlZF9wcml2LT5zY2hlZHVsZVtzY2hlZF9pbmRl
eF0udmMKKyAgICAgICAgPyBzY2hlZF9wcml2LT5zY2hlZHVsZVtzY2hlZF9pbmRleF0udW5pdAog
ICAgICAgICA6IElETEVUQVNLKGNwdSk7CiAKICAgICAvKiBDaGVjayB0byBzZWUgaWYgdGhlIG5l
dyB0YXNrIGNhbiBiZSBydW4gKGF3YWtlICYgcnVubmFibGUpLiAqLwogICAgIGlmICggISgobmV3
X3Rhc2sgIT0gTlVMTCkKLSAgICAgICAgICAgJiYgKEFWQ1BVKG5ld190YXNrKSAhPSBOVUxMKQot
ICAgICAgICAgICAmJiBBVkNQVShuZXdfdGFzayktPmF3YWtlCi0gICAgICAgICAgICYmIHZjcHVf
cnVubmFibGUobmV3X3Rhc2spKSApCisgICAgICAgICAgICYmIChBVU5JVChuZXdfdGFzaykgIT0g
TlVMTCkKKyAgICAgICAgICAgJiYgQVVOSVQobmV3X3Rhc2spLT5hd2FrZQorICAgICAgICAgICAm
JiB1bml0X3J1bm5hYmxlKG5ld190YXNrKSkgKQogICAgICAgICBuZXdfdGFzayA9IElETEVUQVNL
KGNwdSk7CiAgICAgQlVHX09OKG5ld190YXNrID09IE5VTEwpOwogCkBAIC01NzgsMjEgKzU3Mywy
MSBAQCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiAKICAgICBzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZzY2hlZF9wcml2LT5sb2NrLCBmbGFncyk7CiAKLSAgICAvKiBUYXNrbGV0IHdvcmsgKHdoaWNo
IHJ1bnMgaW4gaWRsZSBWQ1BVIGNvbnRleHQpIG92ZXJyaWRlcyBhbGwgZWxzZS4gKi8KKyAgICAv
KiBUYXNrbGV0IHdvcmsgKHdoaWNoIHJ1bnMgaW4gaWRsZSBVTklUIGNvbnRleHQpIG92ZXJyaWRl
cyBhbGwgZWxzZS4gKi8KICAgICBpZiAoIHRhc2tsZXRfd29ya19zY2hlZHVsZWQgKQogICAgICAg
ICBuZXdfdGFzayA9IElETEVUQVNLKGNwdSk7CiAKICAgICAvKiBSdW5uaW5nIHRoaXMgdGFzayB3
b3VsZCByZXN1bHQgaW4gYSBtaWdyYXRpb24gKi8KLSAgICBpZiAoICFpc19pZGxlX3ZjcHUobmV3
X3Rhc2spCi0gICAgICAgICAmJiAobmV3X3Rhc2stPnByb2Nlc3NvciAhPSBjcHUpICkKKyAgICBp
ZiAoICFpc19pZGxlX3VuaXQobmV3X3Rhc2spCisgICAgICAgICAmJiAoc2NoZWRfdW5pdF9jcHUo
bmV3X3Rhc2spICE9IGNwdSkgKQogICAgICAgICBuZXdfdGFzayA9IElETEVUQVNLKGNwdSk7CiAK
ICAgICAvKgogICAgICAqIFJldHVybiB0aGUgYW1vdW50IG9mIHRpbWUgdGhlIG5leHQgZG9tYWlu
IGhhcyB0byBydW4gYW5kIHRoZSBhZGRyZXNzCi0gICAgICogb2YgdGhlIHNlbGVjdGVkIHRhc2sn
cyBWQ1BVIHN0cnVjdHVyZS4KKyAgICAgKiBvZiB0aGUgc2VsZWN0ZWQgdGFzaydzIFVOSVQgc3Ry
dWN0dXJlLgogICAgICAqLwogICAgIHJldC50aW1lID0gbmV4dF9zd2l0Y2hfdGltZSAtIG5vdzsK
LSAgICByZXQudGFzayA9IG5ld190YXNrLT5zY2hlZF91bml0OworICAgIHJldC50YXNrID0gbmV3
X3Rhc2s7CiAgICAgcmV0Lm1pZ3JhdGVkID0gMDsKIAogICAgIEJVR19PTihyZXQudGltZSA8PSAw
KTsKQEAgLTYwMSw3ICs1OTYsNyBAQCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiB9CiAKIC8qKgot
ICogWGVuIHNjaGVkdWxlciBjYWxsYmFjayBmdW5jdGlvbiB0byBzZWxlY3QgYSByZXNvdXJjZSBm
b3IgdGhlIFZDUFUgdG8gcnVuIG9uCisgKiBYZW4gc2NoZWR1bGVyIGNhbGxiYWNrIGZ1bmN0aW9u
IHRvIHNlbGVjdCBhIHJlc291cmNlIGZvciB0aGUgVU5JVCB0byBydW4gb24KICAqCiAgKiBAcGFy
YW0gb3BzICAgICAgIFBvaW50ZXIgdG8gdGhpcyBpbnN0YW5jZSBvZiB0aGUgc2NoZWR1bGVyIHN0
cnVjdHVyZQogICogQHBhcmFtIHVuaXQgICAgICBQb2ludGVyIHRvIHN0cnVjdCBzY2hlZF91bml0
CkBAIC02MTEsMjEgKzYwNiwyMCBAQCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiBzdGF0aWMgc3Ry
dWN0IHNjaGVkX3Jlc291cmNlICoKIGE2NTNzY2hlZF9waWNrX3Jlc291cmNlKGNvbnN0IHN0cnVj
dCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiB7Ci0gICAgc3RydWN0
IHZjcHUgKnZjID0gdW5pdC0+dmNwdTsKICAgICBjcHVtYXNrX3QgKm9ubGluZTsKICAgICB1bnNp
Z25lZCBpbnQgY3B1OwogCi0gICAgLyogCi0gICAgICogSWYgcHJlc2VudCwgcHJlZmVyIHZjJ3Mg
Y3VycmVudCBwcm9jZXNzb3IsIGVsc2UKLSAgICAgKiBqdXN0IGZpbmQgdGhlIGZpcnN0IHZhbGlk
IHZjcHUgLgorICAgIC8qCisgICAgICogSWYgcHJlc2VudCwgcHJlZmVyIHVuaXQncyBjdXJyZW50
IHByb2Nlc3NvciwgZWxzZQorICAgICAqIGp1c3QgZmluZCB0aGUgZmlyc3QgdmFsaWQgdW5pdC4K
ICAgICAgKi8KLSAgICBvbmxpbmUgPSBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHZjLT5kb21haW4p
OworICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWluX2NwdW1hc2sodW5pdC0+ZG9tYWluKTsKIAog
ICAgIGNwdSA9IGNwdW1hc2tfZmlyc3Qob25saW5lKTsKIAotICAgIGlmICggY3B1bWFza190ZXN0
X2NwdSh2Yy0+cHJvY2Vzc29yLCBvbmxpbmUpCisgICAgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KHNj
aGVkX3VuaXRfY3B1KHVuaXQpLCBvbmxpbmUpCiAgICAgICAgICB8fCAoY3B1ID49IG5yX2NwdV9p
ZHMpICkKLSAgICAgICAgY3B1ID0gdmMtPnByb2Nlc3NvcjsKKyAgICAgICAgY3B1ID0gc2NoZWRf
dW5pdF9jcHUodW5pdCk7CiAKICAgICByZXR1cm4gZ2V0X3NjaGVkX3JlcyhjcHUpOwogfQpAQCAt
NjM2LDE4ICs2MzAsMTggQEAgYTY1M3NjaGVkX3BpY2tfcmVzb3VyY2UoY29uc3Qgc3RydWN0IHNj
aGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKICAqIEBwYXJhbSBuZXdfb3Bz
ICAgUG9pbnRlciB0byB0aGlzIGluc3RhbmNlIG9mIHRoZSBzY2hlZHVsZXIgc3RydWN0dXJlCiAg
KiBAcGFyYW0gY3B1ICAgICAgIFRoZSBjcHUgdGhhdCBpcyBjaGFuZ2luZyBzY2hlZHVsZXIKICAq
IEBwYXJhbSBwZGF0YSAgICAgc2NoZWR1bGVyIHNwZWNpZmljIFBDUFUgZGF0YSAod2UgZG9uJ3Qg
aGF2ZSBhbnkpCi0gKiBAcGFyYW0gdmRhdGEgICAgIHNjaGVkdWxlciBzcGVjaWZpYyBWQ1BVIGRh
dGEgb2YgdGhlIGlkbGUgdmNwdQorICogQHBhcmFtIHZkYXRhICAgICBzY2hlZHVsZXIgc3BlY2lm
aWMgVU5JVCBkYXRhIG9mIHRoZSBpZGxlIHVuaXQKICAqLwogc3RhdGljIHNwaW5sb2NrX3QgKgog
YTY1M19zd2l0Y2hfc2NoZWQoc3RydWN0IHNjaGVkdWxlciAqbmV3X29wcywgdW5zaWduZWQgaW50
IGNwdSwKICAgICAgICAgICAgICAgICAgIHZvaWQgKnBkYXRhLCB2b2lkICp2ZGF0YSkKIHsKICAg
ICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkID0gZ2V0X3NjaGVkX3JlcyhjcHUpOwotICAgIGFy
aW5jNjUzX3ZjcHVfdCAqc3ZjID0gdmRhdGE7CisgICAgYXJpbmM2NTNfdW5pdF90ICpzdmMgPSB2
ZGF0YTsKIAotICAgIEFTU0VSVCghcGRhdGEgJiYgc3ZjICYmIGlzX2lkbGVfdmNwdShzdmMtPnZj
KSk7CisgICAgQVNTRVJUKCFwZGF0YSAmJiBzdmMgJiYgaXNfaWRsZV91bml0KHN2Yy0+dW5pdCkp
OwogCi0gICAgaWRsZV92Y3B1W2NwdV0tPnNjaGVkX3VuaXQtPnByaXYgPSB2ZGF0YTsKKyAgICBz
Y2hlZF9pZGxlX3VuaXQoY3B1KS0+cHJpdiA9IHZkYXRhOwogCiAgICAgcmV0dXJuICZzZC0+X2xv
Y2s7CiB9Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

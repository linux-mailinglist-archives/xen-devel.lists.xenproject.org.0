Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90395B0961
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 09:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8JNE-0001Oo-4R; Thu, 12 Sep 2019 07:18:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+knL=XH=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i8JNC-0001Oj-8H
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 07:18:34 +0000
X-Inumbo-ID: 85e3e018-d52d-11e9-b299-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85e3e018-d52d-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 07:18:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 00:18:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="189906183"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 00:18:27 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 15:22:13 +0800
Message-Id: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v10 00/16] improve late microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Chao Gao <chao.gao@intel.com>, Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFqb3IgY2hhbmdlcyBpbiB2ZXJzaW9uIDEwOgogLSBhZGQgYmFjayB0aGUgcGF0Y2ggdG8gY2Fs
bCB3YmludmQoKSBjb25kaXRpb25hbGx5CiAtIGFkZCBhIHBhdGNoIHRvIGRpc2FibGUgbGF0ZSBs
b2FkaW5nIGR1ZSB0byBCREY5MAogLSByZW5kZXp2b3VzIENQVXMgaW4gTk1JIGhhbmRsZXIgYW5k
IGxvYWQgdWNvZGUuIEJ1dCBwcm92aWRlIGFuIG9wdGlvbgogdG8gZGlzYWJsZSB0aGlzIGJlaGF2
aW9yLgogLSBhdm9pZCB0aGUgY2FsbCBvZiBzZWxmX25taSgpIG9uIHRoZSBjb250cm9sIHRocmVh
ZCBiZWNhdXNlIGl0IG1heQogdHJpZ2dlciB0aGUgdW5rbm93bl9ubWlfZXJyb3IoKSBpbiBkb19u
bWkoKS4KIC0gZW5zdXJlIC0+c3RhcnRfdXBkYXRlIGlzIGNhbGxlZCBkdXJpbmcgc3lzdGVtIHJl
c3VtaW5nIGZyb20KIHN1c3BlbnNpb24KClNlcmdleSwgY291bGQgeW91IGhlbHAgdG8gdGVzdCB0
aGlzIHNlcmllcyBvbiBhbiBBTUQgbWFjaGluZT8KUmVnYXJkaW5nIGNoYW5nZXMgdG8gQU1EIHNp
ZGUsIEkgZGlkbid0IGRvIGFueSB0ZXN0IGZvciB0aGVtIGR1ZSB0bwpsYWNrIG9mIGhhcmR3YXJl
LiBBdCBsZWFzdCwgdHdvIGJhc2ljIHRlc3RzIGFyZSBuZWVkZWQ6CiogZG8gYSBtaWNyb2NvZGUg
dXBkYXRlIGFmdGVyIHN5c3RlbSBib290dXAKKiBkb24ndCBicmluZyBhbGwgcENQVXMgdXAgYXQg
Ym9vdHVwIGJ5IHNwZWNpZnlpbmcgbWF4Y3B1cyBvcHRpb24gaW4geGVuCiAgY29tbWFuZCBsaW5l
IGFuZCB0aGVuIGRvIGEgbWljcm9jb2RlIHVwZGF0ZSBhbmQgb25saW5lIGFsbCBvZmZsaW5lZAog
IENQVXMgdmlhICd4ZW4taHB0b29sJy4KClRoZSBpbnRlbnRpb24gb2YgdGhpcyBzZXJpZXMgaXMg
dG8gbWFrZSB0aGUgbGF0ZSBtaWNyb2NvZGUgbG9hZGluZwptb3JlIHJlbGlhYmxlIGJ5IHJlbmRl
enZvdXNpbmcgYWxsIGNwdXMgaW4gc3RvcF9tYWNoaW5lIGNvbnRleHQuClRoaXMgaWRlYSBjb21l
cyBmcm9tIEFzaG9rLiBJIGFtIHBvcnRpbmcgaGlzIGxpbnV4IHBhdGNoIHRvIFhlbgooc2VlIHBh
dGNoIDEyIG1vcmUgZGV0YWlscykuCgpUaGlzIHNlcmllcyBpbmNsdWRlcyBiZWxvdyBjaGFuZ2Vz
OgogMS4gUGF0Y2ggMS0xMTogaW50cm9kdWNlIGEgZ2xvYmFsIG1pY3JvY29kZSBjYWNoZSBhbmQg
c29tZSBjbGVhbnVwCiAyLiBQYXRjaCAxMjogc3luY2hyb25pemUgbGF0ZSBtaWNyb2NvZGUgbG9h
ZGluZwogMy4gUGF0Y2ggMTM6IHN1cHBvcnQgcGFyYWxsZWwgbWljcm9jb2RlcyB1cGRhdGUgb24g
ZGlmZmVyZW50IGNvcmVzCiA0LiBQYXRjaCAxNDogYmxvY2sgI05NSSBoYW5kbGluZyBkdXJpbmcg
bWljcm9jb2RlIGxvYWRpbmcKIDUuIFBhdGNoIDE1OiBkaXNhYmxlIGxhdGUgdWNvZGUgbG9hZGlu
ZyBkdWUgdG8gQkRGOTAKIDYuIFBhdGNoIDE2OiBjYWxsIHdiaW52ZCgpIGNvbmRpdGlvbmFsbHkK
CkN1cnJlbnRseSwgbGF0ZSBtaWNyb2NvZGUgbG9hZGluZyBkb2VzIGEgbG90IG9mIHRoaW5ncyBp
bmNsdWRpbmcKcGFyc2luZyBtaWNyb2NvZGUgYmxvYiwgY2hlY2tpbmcgdGhlIHNpZ25hdHVyZS9y
ZXZpc2lvbiBhbmQgcGVyZm9ybWluZwp1cGRhdGUuIFB1dHRpbmcgYWxsIG9mIHRoZW0gaW50byBz
dG9wX21hY2hpbmUgY29udGV4dCBpcyBhIGJhZCBpZGVhCmJlY2F1c2Ugb2YgY29tcGxleGl0eSAo
b25lIGlzc3VlIEkgb2JzZXJ2ZWQgaXMgbWVtb3J5IGFsbG9jYXRpb24KdHJpZ2dlcmVkIG9uZSBh
c3NlcnRpb24gaW4gc3RvcF9tYWNoaW5lIGNvbnRleHQpLiBUbyBzaW1wbGlmeSB0aGUKbG9hZCBw
cm9jZXNzLCBwYXJzaW5nIG1pY3JvY29kZSBpcyBtb3ZlZCBvdXQgb2YgdGhlIGxvYWQgcHJvY2Vz
cy4KUmVtYWluaW5nIHBhcnRzIG9mIGxvYWQgcHJvY2VzcyBpcyBwdXQgdG8gc3RvcF9tYWNoaW5l
IGNvbnRleHQuCgpQcmV2aW91cyBjaGFuZ2UgbG9nOgpDaGFuZ2VzIGluIHZlcnNpb24gOToKIC0g
YWRkIEphbidzIFJldmlld2VkLWJ5CiAtIHJlbmRldnpvdXMgdGhyZWFkcyBpbiBOTUkgaGFuZGxl
ciB0byBkaXNhYmxlIE5NSS4gTm90ZSB0aGF0IE5NSSBjYW4KIGJlIHNlcnZlZCBhcyB1c3VhbCBv
biB0aHJlYWRzIHRoYXQgYXJlIGNob3NlbiB0byBpbml0aWF0ZSB1Y29kZSBsb2FkaW5nCiBvbiBl
YWNoIGNvcmUuCiAtIGF2b2lkIHVubmVjZXNzYXJ5IG1lbW9yeSBhbGxvY2F0aW9uIG9yIGNvcHkg
d2hlbiBjcmVhdGluZyBhIG1pY3JvY29kZQogcGF0Y2ggKHBhdGNoIDEyKQogLSByZXdvcmsgcGF0
Y2ggMSB0byBhdm9pZCBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCkgYmVpbmcgdXNlZCB0bwogY29t
cGFyZSB0d28gYXJiaXRyYXJ5IHVwZGF0ZXMuCiAtIGNhbGwgLmVuZF91cGRhdGUgaW4gZWFybHkg
bG9hZGluZyBwYXRoLgoKQ2hhbmdlcyBpbiB2ZXJzaW9uIDg6CiAtIGJsb2NrICNOTUkgaGFuZGxp
bmcgZHVyaW5nIG1pY3JvY29kZSBsb2FkaW5nIChQYXRjaCAxNikKIC0gRG9uJ3QgYXNzdW1lIHRo
YXQgYWxsIENQVXMgaW4gdGhlIHN5c3RlbSBoYXZlIGxvYWRlZCBhIHNhbWUgdWNvZGUuCiBTbyB3
aGVuIHBhcnNpbmcgYSBibG9iLCB3ZSBhdHRlbXB0IHRvIHNhdmUgYSBwYXRjaCBhcyBsb25nIGFz
IGl0IG1hdGNoZXMKIHdpdGggY3VycmVudCBjcHUgc2lnbmF0dXJlIHJlZ2FyZGxlc3Mgb2YgdGhl
IHJldmlzaW9uIG9mIHRoZSBwYXRjaC4KIEFuZCBhbHNvIGZvciBsb2FkaW5nLCB3ZSBvbmx5IHJl
cXVpcmUgdGhlIHBhdGNoIHRvIGJlIGxvYWRlZCBpc24ndCBvbGQKIHRoYW4gdGhlIGNhY2hlZCBv
bmUuCiAtIHN0b3JlIGFuIHVwZGF0ZSBhZnRlciB0aGUgZmlyc3Qgc3VjY2Vzc2Z1bCBsb2FkaW5n
IG9uIGEgQ1BVCiAtIHJlbW92ZSB0aGUgcGF0Y2ggdGhhdCBjYWxscyB3YmludmQoKSB1bmNvbmRp
dGlvbmFsbHkgYmVmb3JlIG1pY3JvY29kZQogbG9hZGluZy4gSXQgaXMgdW5kZXIgaW50ZXJuYWwg
ZGlzY3Vzc2lvbi4KIC0gZGl2aWRlIHR3byBiaWcgcGF0Y2hlcyBpbnRvIHNldmVyYWwgcGF0Y2hl
cyB0byBpbXByb3ZlIHJlYWRhYmlsaXR5LgoKQ2hhbmdlcyBpbiB2ZXJzaW9uIDc6CiAtIGNhY2hl
IG9uZSBtaWNyb2NvZGUgdXBkYXRlIHJhdGhlciB0aGFuIGEgbGlzdCBvZiBpdC4gQXNzdW1pbmcg
dGhhdCBhbGwgQ1BVcwogKGluY2x1ZGluZyB0aG9zZSB3aWxsIGJlIHBsdWdnZWQgaW4gbGF0ZXIp
IGluIHRoZSBzeXN0ZW0gaGF2ZSB0aGUgc2FtZQogc2lnbmF0dXJlLCBvbmUgdXBkYXRlIG1hdGNo
ZXMgd2l0aCBvbmUgQ1BVIHNob3VsZCBtYXRjaCB3aXRoIG90aGVycy4gVGh1cywgb25lCiB1cGRh
dGUgaXMgZW5vdWdoIGZvciBtaWNyb2NvZGUgdXBkYXRpbmcgZHVyaW5nIENQVSBob3QtcGx1ZyBh
bmQgcmVzdW1pbmcuCiAtIFRvIGhhbmRsZSBsb2FkIGZhaWx1cmUsIG1pY3JvY29kZSB1cGRhdGUg
aXMgY2FjaGVkIGFmdGVyIGl0IGlzIGFwcGxpZWQgdG8KIGF2b2lkIGEgYnJva2VuIHVwZGF0ZSBv
dmVycmlkaW5nIGEgdmFsaWRhdGVkIG9uZS4gVW52YWxpZGF0ZWQgbWljcm9jb2RlIHVwZGF0ZXMK
IGFyZSBwYXNzZWQgYnkgYXJndW1lbnRzIHJhdGhlciB0aGFuIGFub3RoZXIgZ2xvYmFsIHZhcmlh
YmxlLCB3aGVyZSB0aGlzIHNlcmllcwogc2xpZ2h0bHkgZGlmZmVycyBmcm9tIFJvZ2VyJ3Mgc3Vn
Z2VzdGlvbiBpbjoKIGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE5LTAzL21zZzAwNzc2Lmh0bWwKIC0gaW5jb3Jwb3JhdGUgU2VyZ2V5J3MgcGF0Y2ggKHBh
dGNoIDEwKSB0byBmaXggYSBidWc6IHdlIG1haW50YWluIGEgdmFyaWFibGUKIHRvIHJlZmxlY3Qg
Y3VycmVudCBtaWNyb2NvZGUgcmV2aXNpb24uIEJ1dCBpbiBzb21lIGNhc2VzLCB0aGlzIHZhcmlh
YmxlIGlzbid0CiBpbml0aWFsaXplZCBkdXJpbmcgc3lzdGVtIGJvb3QgdGltZSwgd2hpY2ggcmVz
dWx0cyBpbiBmYWxzZWx5IHJlcG9ydGluZyB0aGF0CiBwcm9jZXNzb3IgaXMgc3VzY2VwdGlibGUg
dG8gc29tZSBrbm93biB2dWxuZXJhYmlsaXRpZXMuCiAtIGZpeCBpc3N1ZXMgcmVwb3J0ZWQgYnkg
U2VyZ2V5OgogaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE5LTAzL21zZzAwOTAxLmh0bWwKIC0gUmVzcG9uc2VzIHRvIFNlcmdleS9Sb2dlci9X
ZWkvQXNob2sncyBvdGhlciBjb21tZW50cy4KCk1ham9yIGNoYW5nZXMgaW4gdmVyc2lvbiA2Ogog
LSBydW4gd2JpbnZkIGJlZm9yZSB1cGRhdGluZyBtaWNyb2NvZGUgKHBhdGNoIDEwKQogLSBhZGQg
YW4gdXNlcnNwYWNlIHRvb2wgZm9yIGxhdGUgbWljcm9jb2RlIHVwZGF0ZSAocGF0Y2ggMSkKIC0g
c2NhbGUgdGltZSB0byB3YWl0IGJ5IHRoZSBudW1iZXIgb2YgcmVtYWluaW5nIENQVXMgdG8gcmVz
cG9uZCAKIC0gcmVtb3ZlICdjcHUnIHBhcmFtZXRlcnMgZnJvbSBzb21lIHJlbGF0ZWQgY2FsbGJh
Y2tzIGFuZCBmdW5jdGlucwogLSBzYXZlIGFuIHVjb2RlIHBhdGNoIG9ubHkgaWYgaXRzIHN1cHBv
cnRlZCBDUFUgaXMgYWxsb3dlZCB0byBtaXggd2l0aAogICBjdXJyZW50IGNwdS4KCkNoYW5nZXMg
aW4gdmVyc2lvbiA1OgogLSBzdXBwb3J0IHBhcmFsbGVsIG1pY3JvY29kZSB1cGRhdGVzIGZvciBh
bGwgY29yZXMgKHNlZSBwYXRjaCA4KQogLSBBZGRyZXNzIFJvZ2VyJ3MgY29tbWVudHMgb24gdGhl
IGxhc3QgdmVyc2lvbi4KCkNoYW8gR2FvICgxNik6CiAgbWljcm9jb2RlL2ludGVsOiBleHRlbmQg
bWljcm9jb2RlX3VwZGF0ZV9tYXRjaCgpCiAgbWljcm9jb2RlL2FtZDogZGlzdGluZ3Vpc2ggb2xk
IGFuZCBtaXNtYXRjaGVkIHVjb2RlIGluCiAgICBtaWNyb2NvZGVfZml0cygpCiAgbWljcm9jb2Rl
OiBpbnRyb2R1Y2UgYSBnbG9iYWwgY2FjaGUgb2YgdWNvZGUgcGF0Y2gKICBtaWNyb2NvZGU6IGNs
ZWFuIHVwIG1pY3JvY29kZV9yZXN1bWVfY3B1CiAgbWljcm9jb2RlOiByZW1vdmUgc3RydWN0IHVj
b2RlX2NwdV9pbmZvCiAgbWljcm9jb2RlOiByZW1vdmUgcG9pbnRsZXNzICdjcHUnIHBhcmFtZXRl
cgogIG1pY3JvY29kZS9hbWQ6IGNhbGwgc3ZtX2hvc3Rfb3N2d19pbml0KCkgaW4gY29tbW9uIGNv
ZGUKICBtaWNyb2NvZGU6IHBhc3MgYSBwYXRjaCBwb2ludGVyIHRvIGFwcGx5X21pY3JvY29kZSgp
CiAgbWljcm9jb2RlOiBzcGxpdCBvdXQgYXBwbHlfbWljcm9jb2RlKCkgZnJvbSBjcHVfcmVxdWVz
dF9taWNyb2NvZGUoKQogIG1pY3JvY29kZTogdW5pZnkgdWNvZGUgbG9hZGluZyBkdXJpbmcgc3lz
dGVtIGJvb3R1cCBhbmQgcmVzdW1pbmcKICBtaWNyb2NvZGU6IHJlZHVjZSBtZW1vcnkgYWxsb2Nh
dGlvbiBhbmQgY29weSB3aGVuIGNyZWF0aW5nIGEgcGF0Y2gKICB4ODYvbWljcm9jb2RlOiBTeW5j
aHJvbml6ZSBsYXRlIG1pY3JvY29kZSBsb2FkaW5nCiAgbWljcm9jb2RlOiByZW1vdmUgbWljcm9j
b2RlX3VwZGF0ZV9sb2NrCiAgbWljcm9jb2RlOiByZW5kZXp2b3VzIENQVXMgaW4gTk1JIGhhbmRs
ZXIgYW5kIGxvYWQgdWNvZGUKICBtaWNyb2NvZGU6IGRpc2FibGUgbGF0ZSBsb2FkaW5nIGlmIENQ
VXMgYXJlIGFmZmVjdGVkIGJ5IEJERjkwCiAgbWljcm9jb2RlL2ludGVsOiB3cml0ZWJhY2sgYW5k
IGludmFsaWRhdGUgY2FjaGUgY29uZGl0aW9uYWxseQoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1s
aW5lLnBhbmRvYyB8ICAxMCArCiB4ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jICAgICAgICAgfCAg
IDIgKy0KIHhlbi9hcmNoL3g4Ni9hcGljLmMgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jICAgICAgICAgIHwgNTY5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jICAgICAgfCAyODIg
KysrKysrKysrLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jICAgIHwg
MjY5ICsrKysrKysrKysrLS0tLS0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyAgICAgICAgICAg
IHwgICA1ICstCiB4ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMgICAgICAgICAgfCAgIDIgKy0KIHhl
bi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9taWNyb2NvZGUuaCAgIHwgIDQzICstLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ubWkuaCAg
ICAgICAgIHwgICAzICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmggICB8ICAgNCAr
LQogMTIgZmlsZXMgY2hhbmdlZCwgNzg4IGluc2VydGlvbnMoKyksIDQwOSBkZWxldGlvbnMoLSkK
Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

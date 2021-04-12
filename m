Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8EF35C7B0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 15:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109090.208183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVwdm-0008TD-S5; Mon, 12 Apr 2021 13:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109090.208183; Mon, 12 Apr 2021 13:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVwdm-0008So-NG; Mon, 12 Apr 2021 13:30:10 +0000
Received: by outflank-mailman (input) for mailman id 109090;
 Mon, 12 Apr 2021 13:30:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OvXO=JJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lVwdl-0008Sj-Pv
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 13:30:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07fc2fe3-f9ad-4395-8bb5-1e20967ca581;
 Mon, 12 Apr 2021 13:30:08 +0000 (UTC)
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
X-Inumbo-ID: 07fc2fe3-f9ad-4395-8bb5-1e20967ca581
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618234208;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SEhjqU5Fjs4qWLmiy+foXvDMNT/NhTSiDpRYi7ybHoQ=;
  b=TrXN0cpcPpNRnFpWjBqQadncQ/basvSQe/VJtx2j7U8RLrMWko/0vKMf
   72Eg7GvlkAc1z6Lkxz2dyouxKj8M0Y0BiD2dmTbrU/cBGPBxVjwjihUx8
   4U9Uby4qhJAURqN73FPAyxuQnU/+NCW+Cr+EStmIUGZt8fuHzWVkpevqG
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: J9wtclQeZNsFoPL8LnC9yUg/SiCbWXdfGqT0dR75vVERw3Aot+DbaiA/4mwF2f3y27u7UsSaEh
 PsMyMlxlUxjyfmcSCwICLNYWZwf6h+6ElRAZAMWbCLnR02ZCuHhQOugOGJGLcN3H/nmEz9AuL0
 N5jU8AUQpbZI9K3kxmrhiok7yvaHXZDx/nUrVgoT50xMXyJCyJs1diKhrllCi5ZuInH7Ina35P
 6b3uG78qYgtoshMCw0q/lhUHrYK7hX0s917sy/X47efrs4PJuqpzZOHMBhnpnk+8noMkPBQW/V
 oZ0=
X-SBRS: 4.0
X-MesageID: 41232825
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41232825"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
CC: Laszlo Ersek <lersek@redhat.com>, Jordan Justen
	<jordan.l.justen@intel.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>,
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 0/7] OvmfXen: Set PcdFSBClock at runtime
Date: Mon, 12 Apr 2021 14:29:56 +0100
Message-ID: <20210412133003.146438-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6CmdpdDovL3hlbmJpdHMu
eGVuLm9yZy9wZW9wbGUvYXBlcmFyZC9vdm1mLmdpdCBici5hcGljLXRpbWVyLWZyZXEtdjMKCkNo
YW5nZXMgaW4gdjM6Ci0gdHlwb3MgYW5kIGNvZHlpbmcgc3R5bGUKCkNoYW5nZXMgaW4gdjI6Ci0g
bWFpbiBjaGFuZ2UgaXMgdG8gYWxsb3cgbWFwcGluZyBvZiBYZW4gcGFnZXMgb3V0c2lkZSBvZiB0
aGUgUkFNCiAgc2VlIHBhdGNoOiAiT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaTogTWFwIGV4dHJhIHBo
eXNpY2FsIGFkZHJlc3MiCi0gdGhhdCBuZXcgZnVuY3Rpb24gYWxsb3dzIHRvIG1hcCB0aGUgWGVu
IHNoYXJlZCBpbmZvIHBhZ2UgKHdoZXJlIHdlIGNhbiBmaW5kCiAgaW5mb3JtYXRpb24gYWJvdXQg
dHNjIGZyZXF1ZW5jeSkgYXQgdGhlIGhpZ2hlc3QgcGh5c2ljYWwgYWRkcmVzcyBhbGxvd2VkLgoK
SGksCgpPdm1mWGVuIHVzZXMgdGhlIEFQSUMgdGltZXIsIGJ1dCB3aXRoIGFuIGhhcmQtY29kZWQg
ZnJlcXVlbmN5IHRoYXQgbWF5IGNoYW5nZQphcyBwb2ludGVkIG91dCBoZXJlOgogIGh0dHBzOi8v
ZWRrMi5ncm91cHMuaW8vZy9kZXZlbC9tZXNzYWdlLzQ1MTg1CiAgPDIwMTkwODA4MTM0NDIzLnli
cWczcWtwdzV1Y2Z6azRAQWlyLWRlLVJvZ2VyPgoKVGhpcyBzZXJpZXMgY2hhbmdlcyB0aGF0IHNv
IHRoZSBmcmVxdWVuY3kgaXMgY2FsY3VsYXRlZCBhdCBydW50aW1lLgoKUmVmOiBodHRwczovL2J1
Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTI0OTAKClRoZXJlIGlzIGFsc28g
b25lIGNsZWFudXAgcGF0Y2ggdGhhdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZSByZXN0LgoK
Q2hlZXJzLAoKQW50aG9ueSBQRVJBUkQgKDcpOgogIE92bWZQa2cvWGVuUmVzZXRWZWN0b3I6IFNp
bGVudCBhIHdhcm5pbmcgZnJvbSBuYXNtCiAgTWRlUGtnOiBBbGxvdyBQY2RGU0JDbG9jayB0byBi
eSBEeW5hbWljCiAgT3ZtZlBrZy9JbmR1c3RyeVN0YW5kYXJkL1hlbjogQXBwbHkgRURLMiBjb2Rp
bmcgc3R5bGUgdG8KICAgIFhFTl9WQ1BVX1RJTUVfSU5GTwogIE92bWZQa2cvSW5kdXN0cnlTdGFu
ZGFyZDogSW50cm9kdWNlIFBhZ2VUYWJsZS5oCiAgT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaTogTWFw
IGV4dHJhIHBoeXNpY2FsIGFkZHJlc3MKICBPdm1mUGtnL1hlblBsYXRmb3JtUGVpOiBDYWxpYnJh
dGUgQVBJQyB0aW1lciBmcmVxdWVuY3kKICBPdm1mUGtnL092bWZYZW46IFNldCBQY2RGU0JDbG9j
awoKIE1kZVBrZy9NZGVQa2cuZGVjICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCAr
LQogT3ZtZlBrZy9Pdm1mWGVuLmRzYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICst
CiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZiAgICAgfCAgIDQgKwog
Li4uL0luZHVzdHJ5U3RhbmRhcmQvUGFnZVRhYmxlLmh9ICAgICAgICAgICAgIHwgMTE3ICstLS0t
LS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4veGVuLmggICAgfCAgMTcg
Ky0KIC4uLi9CYXNlTWVtRW5jcnlwdFNldkxpYi9YNjQvVmlydHVhbE1lbW9yeS5oICB8IDE0MyAr
LS0tLS0tLS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmggICAgICAgICAgICAg
fCAgMTAgKwogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jICAgICAgICAgICAgIHwg
ICAxICsKIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgICAgICAgICAgICAgICAgICB8IDI1
MiArKysrKysrKysrKysrKysrKysKIE92bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhN
YWluLmFzbSAgICB8ICAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwgMjg3IGluc2VydGlvbnMoKyks
IDI3MSBkZWxldGlvbnMoLSkKIGNvcHkgT3ZtZlBrZy97TGlicmFyeS9CYXNlTWVtRW5jcnlwdFNl
dkxpYi9YNjQvVmlydHVhbE1lbW9yeS5oID0+IEluY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9QYWdl
VGFibGUuaH0gKDYwJSkKCi0tIApBbnRob255IFBFUkFSRAoK


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA711275F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:30:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQwW-0001rf-MX; Wed, 04 Dec 2019 09:27:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fd9d=Z2=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1icQwV-0001r5-5P
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:27:31 +0000
X-Inumbo-ID: 47705d2a-1678-11ea-81fe-12813bfff9fa
Received: from know-smtprelay-omc-3.server.virginmedia.net (unknown
 [80.0.253.67]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47705d2a-1678-11ea-81fe-12813bfff9fa;
 Wed, 04 Dec 2019 09:27:24 +0000 (UTC)
Received: from mail0.xen.dingwall.me.uk ([82.47.84.47]) by cmsmtp with ESMTPA
 id cQwNilTneMk4gcQwNiUugr; Wed, 04 Dec 2019 09:27:23 +0000
X-Originating-IP: [82.47.84.47]
X-Authenticated-User: james.dingwall@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.3 cv=Rfa+9Wlv c=1 sm=1 tr=0 a=0bfgdX8EJi0Cr9X0x0jFDA==:117
 a=0bfgdX8EJi0Cr9X0x0jFDA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=xqWC_Br6kY4A:10 a=pxVhFHJ0LMsA:10 a=5IRWAbXhAAAA:8 a=VF6w29W6N5P4AWm6VDUA:9
 a=AJ2fcQ_F1HIVBPS0:21 a=KZYNt8ff4v5rtnoV:21 a=xo7gz2vLY8DhO4BdlxfM:22
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id C373315941D;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id 4vHU23Vkuy3M; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk [192.168.1.5])
 by dingwall.me.uk (Postfix) with ESMTP id 8AD7C159414;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 862E5140E17; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
From: james-xen@dingwall.me.uk
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Dec 2019 09:27:36 +0000
Message-Id: <20191204092739.18177-2-james-xen@dingwall.me.uk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204092739.18177-1-james-xen@dingwall.me.uk>
References: <20191204092739.18177-1-james-xen@dingwall.me.uk>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMwp32QxQOJTLzY+MwLbkx+8ze7848ZeIpY21eg5iEbuT67dRWEDzBIZz+j+umI7w76y5rxBfu856CrHgxa/YOXRtUSORrITzE+v19eq5q76WJKpaTjQ
 /Pgitv451uww3oLLDbyDux7EtEXLFuyAuTfMdUyvcFYX3wXP/A6B+BWqqvQWxWnL2mo1qNVEPEoe2F8xZOStrT5vwPvGiyidTC1kPgtVHfQGxKC9V4F2jW/Z
 dVDu2Hl5Z/wcpKyVSwziTxnfUeiMinxW83EYh/C2+40=
Subject: [Xen-devel] [PATCH 1/4] xenstored logging: introduce -Y /
 --trace-syslog option
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
Cc: wei.liu2@citrix.com, ian.jackson@eu.citrix.com,
 James Dingwall <james@dingwall.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFtZXMgRGluZ3dhbGwgPGphbWVzQGRpbmd3YWxsLm1lLnVrPgoKQWRkIGEgbmV3IGNv
bW1hbmQgbGluZSBhcmd1bWVudCAtWSAvIC0tdHJhY2Utc3lzbG9nIHdoaWNoIHRvZ2dsZXMgdGhl
CmJvb2xlYW4gdHJhY2VzeXNsb2cgdmFyaWFibGUuCi0tLQogdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX2NvcmUuYyB8IDEwICsrKysrKysrLS0KIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3Jl
LmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIGIvdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYwppbmRleCBjOGU0MjM3MDBkLi5kMGIzODNiZWNjIDEw
MDY0NAotLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jCisrKyBiL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMKQEAgLTc5LDYgKzc5LDcgQEAgc3RhdGljIGJvb2wgcmVj
b3ZlcnkgPSB0cnVlOwogc3RhdGljIGludCByZW9wZW5fbG9nX3BpcGVbMl07CiBzdGF0aWMgaW50
IHJlb3Blbl9sb2dfcGlwZTBfcG9sbGZkX2lkeCA9IC0xOwogY2hhciAqdHJhY2VmaWxlID0gTlVM
TDsKK2Jvb2wgdHJhY2VzeXNsb2cgPSBmYWxzZTsKIFREQl9DT05URVhUICp0ZGJfY3R4ID0gTlVM
TDsKIAogc3RhdGljIGNvbnN0IGNoYXIgKnNvY2ttc2dfc3RyaW5nKGVudW0geHNkX3NvY2ttc2df
dHlwZSB0eXBlKTsKQEAgLTE4NzEsNyArMTg3Miw4IEBAIHN0YXRpYyB2b2lkIHVzYWdlKHZvaWQp
CiAiICAtSCwgLS1oZWxwICAgICAgICAgICAgICB0byBvdXRwdXQgdGhpcyBtZXNzYWdlLFxuIgog
IiAgLU4sIC0tbm8tZm9yayAgICAgICAgICAgdG8gcmVxdWVzdCB0aGF0IHRoZSBkYWVtb24gZG9l
cyBub3QgZm9yayxcbiIKICIgIC1QLCAtLW91dHB1dC1waWQgICAgICAgIHRvIHJlcXVlc3QgdGhh
dCB0aGUgcGlkIG9mIHRoZSBkYWVtb24gaXMgb3V0cHV0LFxuIgotIiAgLVQsIC0tdHJhY2UtZmls
ZSA8ZmlsZT4gZ2l2aW5nIHRoZSBmaWxlIGZvciBsb2dnaW5nLCBhbmRcbiIKKyIgIC1ULCAtLXRy
YWNlLWZpbGUgPGZpbGU+IGdpdmluZyB0aGUgZmlsZSBmb3IgbG9nZ2luZywgYW5kL29yXG4iCisi
ICAtWSwgLS10cmFjZS1zeXNsb2cgd3JpdGluZyB0cmFjZSBtZXNzYWdlIHRvIHN5c2xvZyxcbiIK
ICIgIC1FLCAtLWVudHJ5LW5iIDxuYj4gICAgIGxpbWl0IHRoZSBudW1iZXIgb2YgZW50cmllcyBw
ZXIgZG9tYWluLFxuIgogIiAgLVMsIC0tZW50cnktc2l6ZSA8c2l6ZT4gbGltaXQgdGhlIHNpemUg
b2YgZW50cnkgcGVyIGRvbWFpbiwgYW5kXG4iCiAiICAtVywgLS13YXRjaC1uYiA8bmI+ICAgICBs
aW1pdCB0aGUgbnVtYmVyIG9mIHdhdGNoZXMgcGVyIGRvbWFpbixcbiIKQEAgLTE4OTUsNiArMTg5
Nyw3IEBAIHN0YXRpYyBzdHJ1Y3Qgb3B0aW9uIG9wdGlvbnNbXSA9IHsKIAl7ICJvdXRwdXQtcGlk
IiwgMCwgTlVMTCwgJ1AnIH0sCiAJeyAiZW50cnktc2l6ZSIsIDEsIE5VTEwsICdTJyB9LAogCXsg
InRyYWNlLWZpbGUiLCAxLCBOVUxMLCAnVCcgfSwKKwl7ICJ0cmFjZS1zeXNsb2ciLCAwLCBOVUxM
LCAnWScgfSwKIAl7ICJ0cmFuc2FjdGlvbiIsIDEsIE5VTEwsICd0JyB9LAogCXsgIm5vLXJlY292
ZXJ5IiwgMCwgTlVMTCwgJ1InIH0sCiAJeyAiaW50ZXJuYWwtZGIiLCAwLCBOVUxMLCAnSScgfSwK
QEAgLTE5MTgsNyArMTkyMSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJ
aW50IHRpbWVvdXQ7CiAKIAotCXdoaWxlICgob3B0ID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwg
IkRFOkY6SE5QUzp0OlQ6UlZXOiIsIG9wdGlvbnMsCisJd2hpbGUgKChvcHQgPSBnZXRvcHRfbG9u
ZyhhcmdjLCBhcmd2LCAiREU6RjpITlBTOnQ6VDpSVlc6WSIsIG9wdGlvbnMsCiAJCQkJICBOVUxM
KSkgIT0gLTEpIHsKIAkJc3dpdGNoIChvcHQpIHsKIAkJY2FzZSAnRCc6CkBAIC0xOTYwLDYgKzE5
NjMsOSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCQljYXNlICdXJzoKIAkJ
CXF1b3RhX25iX3dhdGNoX3Blcl9kb21haW4gPSBzdHJ0b2wob3B0YXJnLCBOVUxMLCAxMCk7CiAJ
CQlicmVhazsKKwkJY2FzZSAnWSc6CisJCQl0cmFjZXN5c2xvZyA9IHRydWU7CisJCQlicmVhazsK
IAkJY2FzZSAnZSc6CiAJCQlkb20wX2V2ZW50ID0gc3RydG9sKG9wdGFyZywgTlVMTCwgMTApOwog
CQkJYnJlYWs7CmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oIGIv
dG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaAppbmRleCAzZDdlYjkxMjU0Li5mNWIwZDcw
ZGE0IDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oCisrKyBiL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgKQEAgLTE3NCw2ICsxNzQsNyBAQCB2b2lkIGR0
cmFjZV9pbyhjb25zdCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgY29uc3Qgc3RydWN0IGJ1ZmZl
cmVkX2RhdGEgKmRhdGEsCiB2b2lkIHJlb3Blbl9sb2codm9pZCk7CiB2b2lkIGNsb3NlX2xvZyh2
b2lkKTsKIAorZXh0ZXJuIGJvb2wgdHJhY2VzeXNsb2c7CiBleHRlcm4gY2hhciAqdHJhY2VmaWxl
OwogZXh0ZXJuIGludCB0cmFjZWZkOwogCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF13BF136
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:24:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRpp-0008Pv-R1; Thu, 26 Sep 2019 11:21:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDRpn-0008O3-VI
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:21:19 +0000
X-Inumbo-ID: b6a54ffc-e04f-11e9-8628-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by localhost (Halon) with ESMTPS
 id b6a54ffc-e04f-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 11:20:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m13so1729609ljj.11
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dAXIdOzd5atuBvsXDzswi8p3w2Qe44gCP0DnzcVW2iI=;
 b=qvERueVUWGcvRjU9PHVaWcsnxxOxknWatng+s3KqSo26O+qAYin25nioWtvm0DmdHk
 V4yF7vI+z6G+nZY1DHG12ql4Ebanf90ooSgJd7EOO178byZi1R0L26E+Sl5oa69w0loq
 +CAvPdB9j4Xm7sWeXr9C8BH/rFEFiMGvnlQGua3nNnzlrzmjIiXPOFCoM9hEIESy7NGQ
 diXjqNpxE5Q6wJMtgmBLBXU4u3CLS7C0rpDwXLLKHrjOoAcr0qMzmfDoI4aZZoSM+d77
 xIddAw+FCrEQSEZkjVra6/qw1VOm8Ur399G58574SiRpVVjIrZk13f7lCGsesdCZvZrO
 fEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dAXIdOzd5atuBvsXDzswi8p3w2Qe44gCP0DnzcVW2iI=;
 b=MpKF8OqfAxUPCIReBcTJ3BEnG+HN+W8M0IY8rH49tS3lsrQhGR6+V+wHPQrmJdFIdn
 DIsNcORnlxQp0CCy1WTc/+LzoiHonwIX7lVyeIs5BV/wZCv3t/IBuROUySruu6Pv+OrK
 vfKw64UP6YRQ69dZ72xTOZXvZZbs+hCzshUpPX7TAXpLrnGTMOYOx1t1C6v8wxnBaxPM
 YcuP3E0gpuWpNnSheuLPqzA9RegwnRva+Oe3ij2duNRoYn+l+vnm3OdoB7SgmlAZpY3Q
 UfODaSev0kW95ANz8Euh9ZUGN+6ew4FL52nEQunflCpWVbibfEf1rVD+RAKmsv7hRsYZ
 NV0A==
X-Gm-Message-State: APjAAAUTN/hhkqOsLwBVI1hHREbS4Q9Dkc5799w8V1h6QUlbTSc7L2Jz
 vt7CPPFIycKQ4Z1/kd/No/dSJcXT++0=
X-Google-Smtp-Source: APXvYqzsvs6tapShkjo34DjDboU6SSqraxPjEWYzvfEeupYOqPTZAWd/NIoG3eRsdvTIeaKDg7RW8w==
X-Received: by 2002:a2e:2e17:: with SMTP id u23mr522736lju.26.1569496857662;
 Thu, 26 Sep 2019 04:20:57 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id n4sm526810lfi.63.2019.09.26.04.20.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 26 Sep 2019 04:20:57 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 14:20:30 +0300
Message-Id: <1569496834-7796-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V6 4/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Jan Beulich <jbeulich@suse.com>, volodymyr_babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIHR5cGUtc2FmZSBoZWxwZXIgbWFjcm9zIHRvIHJlLWFs
bG9jYXRlIHNwYWNlCmZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgdHlw
ZWQgb2JqZWN0cy4KCkZvciBleGFtcGxlLCBpZiB3ZSBuZWVkIHRvIHJlLXNpemUgdGhlICJkYXRh
IiBhcnJheToKCiAgIHN0cnVjdCBhcnJsZW4KICAgewogICAgICBzaXplX3QgbGVuOwogICAgICBp
bnQgZGF0YVtdOwogICB9OwoKV2UgY2FuIHVzZSB0aGUgcHJvcG9zZWQgbWFjcm9zIGluIHRoZSBm
b2xsb3dpbmcgd2F5OgoKICAgbmV3X3B0ciA9IHJlYWxsb2NfZmxleF9zdHJ1Y3Qob2xkX3B0ciwg
ZGF0YSwgbnJfZWxlbSk7Cgp3aGVyZSBucl9lbGVtIGlzIHRoZSBkZXNpcmVkIG51bWJlciBvZiBl
bGVtZW50cy4KClN1YnNlcXVlbnQgcGF0Y2ggd2lsbCB1c2UgdGhpcyBtYWNyb3MuCgpBbHNvLCB3
aGlsZSBoZXJlLCBpbnRyb2R1Y2UgeG1hbGxvYyh4emFsbG9jKV9mbGV4X3N0cnVjdCgpIHRvCmFs
bG9jYXRlIHNwYWNlIGZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgdHlw
ZWQgb2JqZWN0cy4KClN1Z2dlc3RlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9C
YWJjaHVrQGVwYW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xl
a3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDQzog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNDOiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgpDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgoKLS0tCkNoYW5nZXMgVjQgLT4gVjU6CiAgICAtIGNsYXJpZmllZCBwYXRjaCBkZXNjcmlw
dGlvbiAoZGF0YVtdIGluc3RlYWQgb2YgZGF0YVsxXSkKICAgIC0gaW50cm9kdWNlZCB4emFsbG9j
X2ZsZXhfc3RydWN0KCkKICAgIC0gYWRkZWQgSmFuJ3MgUi1iCiAgICAtIGFkZGVkIG1pc3Npbmcg
cGFyZW50aGVzZXMgYXJvdW5kIHRoZSBlbnRpcmUgY29uc3RydWN0cwoKQ2hhbmdlcyBWMyAtPiBW
NDoKICAgIC0gY2xhcmlmaWVkIHBhdGNoIGRlc2NyaXB0aW9uCiAgICAtIG1vZGlmaWVkIHRvIG5v
dCB1c2UgbGVhZGluZyB1bmRlcnNjb3JlcwogICAgLSByZW1vdmVkIHVubmVjZXNzYXJ5IHBhaXIg
b2Ygb3V0ZXJtb3N0IHBhcmVudGhlc2VzCiAgICAtIG1vZGlmaWVkIHRvIHVzZSAibnIiIGluc3Rl
YWQgb2YgImxlbiIKICAgIC0gcGxhY2VkIHhtYWxsb2NfZmxleF9zdHJ1Y3QgYmVmb3JlIHhyZWFs
bG9jX2ZsZXhfc3RydWN0CiAgICAtIHNpbXBsaWZpZWQgeHJlYWxsb2NfZmxleF9zdHJ1Y3QgbWFj
cm9zCi0tLQogeGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaCB8IDEyICsrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94
ZW4veG1hbGxvYy5oIGIveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAppbmRleCA4MzExNTJmLi5m
NTE1Y2VlIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCisrKyBiL3hlbi9p
bmNsdWRlL3hlbi94bWFsbG9jLmgKQEAgLTM1LDYgKzM1LDE4IEBACiAjZGVmaW5lIHh6YWxsb2Nf
YXJyYXkoX3R5cGUsIF9udW0pIFwKICAgICAoKF90eXBlICopX3h6YWxsb2NfYXJyYXkoc2l6ZW9m
KF90eXBlKSwgX19hbGlnbm9mX18oX3R5cGUpLCBfbnVtKSkKIAorLyogQWxsb2NhdGUgc3BhY2Ug
Zm9yIGEgc3RydWN0dXJlIHdpdGggYSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCBvYmplY3RzLiAq
LworI2RlZmluZSB4emFsbG9jX2ZsZXhfc3RydWN0KHR5cGUsIGZpZWxkLCBucikgXAorICAgICgo
dHlwZSAqKV94emFsbG9jKG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksIF9fYWxpZ25vZl9fKHR5
cGUpKSkKKworI2RlZmluZSB4bWFsbG9jX2ZsZXhfc3RydWN0KHR5cGUsIGZpZWxkLCBucikgXAor
ICAgICgodHlwZSAqKV94bWFsbG9jKG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksIF9fYWxpZ25v
Zl9fKHR5cGUpKSkKKworLyogUmUtYWxsb2NhdGUgc3BhY2UgZm9yIGEgc3RydWN0dXJlIHdpdGgg
YSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCBvYmplY3RzLiAqLworI2RlZmluZSB4cmVhbGxvY19m
bGV4X3N0cnVjdChwdHIsIGZpZWxkLCBucikgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisg
ICAgKCh0eXBlb2YocHRyKSlfeHJlYWxsb2MocHRyLCBvZmZzZXRvZih0eXBlb2YoKihwdHIpKSwg
ZmllbGRbbnJdKSwgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2FsaWdub2ZfXyh0
eXBlb2YoKihwdHIpKSkpKQorCiAvKiBBbGxvY2F0ZSB1bnR5cGVkIHN0b3JhZ2UuICovCiAjZGVm
aW5lIHhtYWxsb2NfYnl0ZXMoX2J5dGVzKSBfeG1hbGxvYyhfYnl0ZXMsIFNNUF9DQUNIRV9CWVRF
UykKICNkZWZpbmUgeHphbGxvY19ieXRlcyhfYnl0ZXMpIF94emFsbG9jKF9ieXRlcywgU01QX0NB
Q0hFX0JZVEVTKQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

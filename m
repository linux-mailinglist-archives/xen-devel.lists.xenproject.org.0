Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AFBCB7A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:33:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmmW-0007ts-5s; Tue, 24 Sep 2019 15:31:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7zL=XT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCmmU-0007tR-Vr
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:31:11 +0000
X-Inumbo-ID: 4c5337d8-dee0-11e9-97fb-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by localhost (Halon) with ESMTPS
 id 4c5337d8-dee0-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 15:30:55 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id q11so1739458lfc.11
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 08:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dAXIdOzd5atuBvsXDzswi8p3w2Qe44gCP0DnzcVW2iI=;
 b=c9rxzKKSk0cCCaf04TMT7q8FmKtllw9FcvMS0MsrP2lO/cH92sh3wuI4ogVvd8fntN
 g+eKwqaDkxNnPUBPvQHu8MhtP4LgmF5Wp7wTaWC8uHf39Wu21KzoKm4Rt9IubIQ4mfpS
 M7Kt+v1UVA1m6pzDWPt1HXxPWs25rybA1BHtYiB+JHRHB9fmWRnqUdOW8fTboa5nQ6Dl
 5Wp86FTv7tMefJ8sAGHRSpAnIE692bzk5Ia0+IxY25oR9pOa9lTl8mLj+4rsA+TW08i+
 4U6HrsGLbdNn0Ybv9zrYLjBYOteQsUo1oGn4eQ3ZvC7Ba1dKzh/nHjvPie9ysAPCUoU1
 TuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dAXIdOzd5atuBvsXDzswi8p3w2Qe44gCP0DnzcVW2iI=;
 b=m4znBmj0gSML6a+PtX1qAClpufr48L73rR6EJ0ZaURVOgmmbuyfaaizQc2J+JXZECr
 SPpApIiJUoI95sawUEizattpMzRBhPaChctPjP8mO+8d9NJzhDbAAiS/E6u02L1Vj81x
 7SV6dilBoAAc+dxET4A6UXawibbqiSDtzaRGX+zw3k+whe6H//afYpIxIMp5+/wFz+Cu
 8lTpw/IaIR1VqKbgXCfg5gpTMOdTXleuaE5ryT3WZ4KnmRGT6IEqaulet/b9nDTGUDw9
 Tz1S2Yr77EJCGpjlhcT8e0jwz/E3a1EXy6wFfprG8DdVrzV+MQIRyhTHdI0IBrX8g3ZN
 o4NQ==
X-Gm-Message-State: APjAAAVpkClwLE4QhHlKmJjiurTE2lei/N9r7OQISFHZdgTu+odV0RC2
 ZIpEzOK9u1smtxQZGAZwIX6zERlS28s=
X-Google-Smtp-Source: APXvYqyTopsiIiak5OUxOOlpbxeMPwSJ/QGpMYAc5YuXNte2/WoJY0PWJEINJqb+/gUKPk3/I7pfpg==
X-Received: by 2002:ac2:5dd0:: with SMTP id x16mr2354993lfq.38.1569339053076; 
 Tue, 24 Sep 2019 08:30:53 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id z128sm525818lfa.1.2019.09.24.08.30.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 24 Sep 2019 08:30:52 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 18:30:23 +0300
Message-Id: <1569339027-19484-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V5 4/8] xen/common: Introduce
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

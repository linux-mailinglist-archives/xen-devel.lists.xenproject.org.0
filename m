Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47718EA32
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:17:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3FJ-0004ba-Dw; Sun, 22 Mar 2020 16:14:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3FI-0004b4-EL
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:14:40 +0000
X-Inumbo-ID: 36de31cc-6c58-11ea-92cf-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36de31cc-6c58-11ea-92cf-bc764e2007e4;
 Sun, 22 Mar 2020 16:14:32 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id b21so13476193edy.9
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q0DjDcTGZuLAgG9ZdNmzRZsu9N7ZM1zKIaO4GQDqQOw=;
 b=HspJf153GXap7dOlACvUhnceLxDiisfXHVeB6BUMTRFM2aOnvEfp46zKISbtfITmEH
 27GofipwIvqNDBKqhcd7ra/+kCwaPNtSc4FqSyBJ6uq7Nft1fo8bJPu3qbbaCvI6Yqn0
 M0LT5fhMrg/Y/NILn+kDuDgsZadVg6DoqJwNSReSPp5iRtNtAQMkMtGrO9ZNRevEiddw
 FcWoBGaKLbFgRSbXEY40tdd9oGVZtXLhH/KdtKBFjBxS03q3mX6VUCkrvL6mTM3tP8JX
 iOX8K0SQ6EFWoT/BfeA1/0vr82ELVTW2oABwewvxxuDedi9AzRKtfNz17FEnMYWEWS8q
 uuVQ==
X-Gm-Message-State: ANhLgQ1lr1jPznOxsFRR/qgZF9i0Gg2rTNoI+G4tZ1NBoamQa515LwLr
 oyjGfQZ7c7sXKmWt1PIzKv2hzSzl4eB8Cg==
X-Google-Smtp-Source: ADFU+vvgTgEpJ8ob/YW7qtJesBCrWJv3xoArKcCEXeWNlhIZ+k+dpM4FZTqO0NuHdQDUFNqaMCt7Xg==
X-Received: by 2002:a17:906:4e81:: with SMTP id
 v1mr5182103eju.259.1584893671540; 
 Sun, 22 Mar 2020 09:14:31 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:30 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:08 +0000
Message-Id: <20200322161418.31606-8-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 07/17] xen/x86: traps: Convert
 __page_fault_type() to use typesafe MFN
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCk5vdGUgdGhhdCB0aGUgY29k
ZSBpcyBub3cgdXNpbmcgY3IzX3RvX21mbigpIHRvIGdldCB0aGUgTUZOLiBUaGlzIGlzCnNsaWdo
dGx5IGRpZmZlcmVudCBhcyB0aGUgdG9wIDEyLWJpdHMgd2lsbCBub3cgYmUgbWFza2VkLgoKTm8g
ZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqZ3JhbGxAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvdHJhcHMuYyB8IDIxICsrKysr
KysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jIGIveGVuL2FyY2gv
eDg2L3RyYXBzLmMKaW5kZXggMDRhM2ViYzBhMi4uNGY1MjRkYzcxZSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L3RyYXBzLmMKKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKQEAgLTEyMzIsNyAr
MTIzMiw4IEBAIGVudW0gcGZfdHlwZSB7CiBzdGF0aWMgZW51bSBwZl90eXBlIF9fcGFnZV9mYXVs
dF90eXBlKHVuc2lnbmVkIGxvbmcgYWRkciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiB7Ci0gICAgdW5zaWdu
ZWQgbG9uZyBtZm4sIGNyMyA9IHJlYWRfY3IzKCk7CisgICAgbWZuX3QgbWZuOworICAgIHVuc2ln
bmVkIGxvbmcgY3IzID0gcmVhZF9jcjMoKTsKICAgICBsNF9wZ2VudHJ5X3QgbDRlLCAqbDR0Owog
ICAgIGwzX3BnZW50cnlfdCBsM2UsICpsM3Q7CiAgICAgbDJfcGdlbnRyeV90IGwyZSwgKmwydDsK
QEAgLTEyNjQsMjAgKzEyNjUsMjAgQEAgc3RhdGljIGVudW0gcGZfdHlwZSBfX3BhZ2VfZmF1bHRf
dHlwZSh1bnNpZ25lZCBsb25nIGFkZHIsCiAKICAgICBwYWdlX3VzZXIgPSBfUEFHRV9VU0VSOwog
Ci0gICAgbWZuID0gY3IzID4+IFBBR0VfU0hJRlQ7CisgICAgbWZuID0gY3IzX3RvX21mbihjcjMp
OwogCi0gICAgbDR0ID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4obWZuKSk7CisgICAgbDR0ID0gbWFw
X2RvbWFpbl9wYWdlKG1mbik7CiAgICAgbDRlID0gbDRlX3JlYWRfYXRvbWljKCZsNHRbbDRfdGFi
bGVfb2Zmc2V0KGFkZHIpXSk7Ci0gICAgbWZuID0gbDRlX2dldF9wZm4obDRlKTsKKyAgICBtZm4g
PSBsNGVfZ2V0X21mbihsNGUpOwogICAgIHVubWFwX2RvbWFpbl9wYWdlKGw0dCk7CiAgICAgaWYg
KCAoKGw0ZV9nZXRfZmxhZ3MobDRlKSAmIHJlcXVpcmVkX2ZsYWdzKSAhPSByZXF1aXJlZF9mbGFn
cykgfHwKICAgICAgICAgIChsNGVfZ2V0X2ZsYWdzKGw0ZSkgJiBkaXNhbGxvd2VkX2ZsYWdzKSAp
CiAgICAgICAgIHJldHVybiByZWFsX2ZhdWx0OwogICAgIHBhZ2VfdXNlciAmPSBsNGVfZ2V0X2Zs
YWdzKGw0ZSk7CiAKLSAgICBsM3QgID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4obWZuKSk7CisgICAg
bDN0ICA9IG1hcF9kb21haW5fcGFnZShtZm4pOwogICAgIGwzZSA9IGwzZV9yZWFkX2F0b21pYygm
bDN0W2wzX3RhYmxlX29mZnNldChhZGRyKV0pOwotICAgIG1mbiA9IGwzZV9nZXRfcGZuKGwzZSk7
CisgICAgbWZuID0gbDNlX2dldF9tZm4obDNlKTsKICAgICB1bm1hcF9kb21haW5fcGFnZShsM3Qp
OwogICAgIGlmICggKChsM2VfZ2V0X2ZsYWdzKGwzZSkgJiByZXF1aXJlZF9mbGFncykgIT0gcmVx
dWlyZWRfZmxhZ3MpIHx8CiAgICAgICAgICAobDNlX2dldF9mbGFncyhsM2UpICYgZGlzYWxsb3dl
ZF9mbGFncykgKQpAQCAtMTI4Niw5ICsxMjg3LDkgQEAgc3RhdGljIGVudW0gcGZfdHlwZSBfX3Bh
Z2VfZmF1bHRfdHlwZSh1bnNpZ25lZCBsb25nIGFkZHIsCiAgICAgaWYgKCBsM2VfZ2V0X2ZsYWdz
KGwzZSkgJiBfUEFHRV9QU0UgKQogICAgICAgICBnb3RvIGxlYWY7CiAKLSAgICBsMnQgPSBtYXBf
ZG9tYWluX3BhZ2UoX21mbihtZm4pKTsKKyAgICBsMnQgPSBtYXBfZG9tYWluX3BhZ2UobWZuKTsK
ICAgICBsMmUgPSBsMmVfcmVhZF9hdG9taWMoJmwydFtsMl90YWJsZV9vZmZzZXQoYWRkcildKTsK
LSAgICBtZm4gPSBsMmVfZ2V0X3BmbihsMmUpOworICAgIG1mbiA9IGwyZV9nZXRfbWZuKGwyZSk7
CiAgICAgdW5tYXBfZG9tYWluX3BhZ2UobDJ0KTsKICAgICBpZiAoICgobDJlX2dldF9mbGFncyhs
MmUpICYgcmVxdWlyZWRfZmxhZ3MpICE9IHJlcXVpcmVkX2ZsYWdzKSB8fAogICAgICAgICAgKGwy
ZV9nZXRfZmxhZ3MobDJlKSAmIGRpc2FsbG93ZWRfZmxhZ3MpICkKQEAgLTEyOTcsOSArMTI5OCw5
IEBAIHN0YXRpYyBlbnVtIHBmX3R5cGUgX19wYWdlX2ZhdWx0X3R5cGUodW5zaWduZWQgbG9uZyBh
ZGRyLAogICAgIGlmICggbDJlX2dldF9mbGFncyhsMmUpICYgX1BBR0VfUFNFICkKICAgICAgICAg
Z290byBsZWFmOwogCi0gICAgbDF0ID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4obWZuKSk7CisgICAg
bDF0ID0gbWFwX2RvbWFpbl9wYWdlKG1mbik7CiAgICAgbDFlID0gbDFlX3JlYWRfYXRvbWljKCZs
MXRbbDFfdGFibGVfb2Zmc2V0KGFkZHIpXSk7Ci0gICAgbWZuID0gbDFlX2dldF9wZm4obDFlKTsK
KyAgICBtZm4gPSBsMWVfZ2V0X21mbihsMWUpOwogICAgIHVubWFwX2RvbWFpbl9wYWdlKGwxdCk7
CiAgICAgaWYgKCAoKGwxZV9nZXRfZmxhZ3MobDFlKSAmIHJlcXVpcmVkX2ZsYWdzKSAhPSByZXF1
aXJlZF9mbGFncykgfHwKICAgICAgICAgIChsMWVfZ2V0X2ZsYWdzKGwxZSkgJiBkaXNhbGxvd2Vk
X2ZsYWdzKSApCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

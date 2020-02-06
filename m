Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49283154209
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 11:42:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izeYP-00049y-Lb; Thu, 06 Feb 2020 10:38:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSBF=32=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izeYO-00049t-U7
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 10:38:36 +0000
X-Inumbo-ID: d419a0a2-48cc-11ea-8952-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d419a0a2-48cc-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 10:38:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b17so6416452wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 02:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=e7qnaz6GkiY6pKmtiP2RmOD3xGUmtWPxz/kMf2Nt2rY=;
 b=F68MrAOTpDdNrfl4ln3JPGc1rlBel3GsfZCgmk/sG7qwNN8XAbzvVp5dIEUiN0KzoB
 1UKoJ6TzS1Xr8BX1wEWGPdBDgqQOe5kcSE1UiUsqmJE9PdrGBVaSxhgsHNQLw11FF5DU
 ZseiRzRPPi8ZZjWPUW2iZEGcY5QBK8h4OIGs5B30dL1la7BEd/oumLnElCa9oAOPHyQQ
 AO2wwZrU7O1IBQJdYpSjo3rFL9X49w1Vd4wjxnfeazZGKs1XTxU1vf4j/4sGifmJTl3k
 Dq6hWfRdKUMD9ruBHoyUIIraeo6AeO3KSbPLEwf87MwzYrF51/4BEsNE8nHcpbp4unpu
 A6cQ==
X-Gm-Message-State: APjAAAXitnKk3aim90o4nOCySEIbd4qVsFopSn2FCBGocRiD6mrkhnit
 +7EcQnjBuRAhB1i2DHAREEH9SYWz
X-Google-Smtp-Source: APXvYqzMT+SVjc8loVg+B4bOqgDZnfLuy/9QJn6+pELS2JYeaAAkLIj+FA4bnQ35NgUFli4PrxvQ2g==
X-Received: by 2002:a1c:a584:: with SMTP id o126mr3642558wme.163.1580985515179; 
 Thu, 06 Feb 2020 02:38:35 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id i3sm331904wrc.6.2020.02.06.02.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 02:38:34 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Thu,  6 Feb 2020 10:38:33 +0000
Message-Id: <20200206103833.15355-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2] xen/mm: Avoid assuming the page is inuse in
 assign_pages()
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
Cc: pdurrant@amazon.com, julien@xen.org, Julien Grall <jgrall@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCkF0IHRoZSBtb21lbnQsIGFz
c2lnbl9wYWdlcygpIG9uIHRoZSBwYWdlIHRvIGJlIGludXNlIChQR0Nfc3RhdGVfaW51c2UpCmFu
ZCB0aGUgc3RhdGUgdmFsdWUgdG8gYmUgMC4KCkhvd2V2ZXIsIHRoZSBjb2RlIG1heSByYWNlIHdp
dGggdGhlIHBhZ2Ugb2ZmbGluaW5nIGNvZGUgKHNlZQpvZmZsaW5lX3BhZ2UoKSkuIERlcGVuZGlu
ZyBvbiB0aGUgb3JkZXJpbmcsIHRoZSBwYWdlIG1heSBiZSBpbiBvZmZsaW5pbmcKc3RhdGUgKFBH
Q19zdGF0ZV9vZmZsaW5pbmcpIGJlZm9yZSBpdCBpcyBhc3NpZ25lZCB0byBhIGRvbWFpbi4KCk9u
IGRlYnVnIGJ1aWxkLCB0aGlzIG1heSByZXN1bHQgdG8gaGl0IHRoZSBhc3NlcnQgb3IganVzdCBj
bG9iYmVyIHRoZQpzdGF0ZS4gT24gbm9uLWRlYnVnIGJ1aWxkLCB0aGUgc3RhdGUgd2lsbCBnZXQg
Y2xvYmJlcmVkLgoKSW5jaWRlbnRhbGx5IHRoZSBmbGFnIFBHQ19icm9rZW4gd2lsbCBnZXQgY2xv
YmJlcmVkIGFzIHdlbGwuCgpHcmFiIHRoZSBoZWFwX2xvY2sgdG8gcHJldmVudCBhIHJhY2Ugd2l0
aCBvZmZsaW5lX3BhZ2UoKSBhbmQga2VlcCB0aGUKc3RhdGUgYW5kIGJyb2tlbiBmbGFnIGFyb3Vu
ZC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgotLS0K
ICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBTdXBlcnNlZWQgPDIwMjAwMjA0MTMzMzU3LjMy
MTAxLTEtanVsaWVuQHhlbi5vcmc+CiAgICAgICAgLSBGaXggdGhlIHJhY2Ugd2l0aCBvZmZsaW5l
X3BhZ2UoKQotLS0KIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jIHwgMTYgKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2Mu
YwppbmRleCA5NzkwMmQ0MmMxLi5hNjg0ZGJmMzdjIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Bh
Z2VfYWxsb2MuYworKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwpAQCAtMjI4MywxNSArMjI4
MywyNyBAQCBpbnQgYXNzaWduX3BhZ2VzKAogICAgICAgICAgICAgZ2V0X2tub3duYWxpdmVfZG9t
YWluKGQpOwogICAgIH0KIAorICAgIHNwaW5fbG9jaygmaGVhcF9sb2NrKTsKICAgICBmb3IgKCBp
ID0gMDsgaSA8ICgxIDw8IG9yZGVyKTsgaSsrICkKICAgICB7CisgICAgICAgIC8qCisgICAgICAg
ICAqIFdlIHNob3VsZCBvbmx5IGJlIGhlcmUgaWYgdGhlIHBhZ2UgaXMgaW51c2Ugb3Igb2ZmbGlu
aW5nLgorICAgICAgICAgKiBUaGUgbGF0dGVyIGhhcHBlbiBpZiB3ZSByYWNlIHdpdGggbWFya19w
YWdlX29mZmxpbmUoKSBhcyB3ZQorICAgICAgICAgKiBkb24ndCBob2xkIHRoZSBoZWFwX2xvY2su
CisgICAgICAgICAqLworICAgICAgICBBU1NFUlQocGFnZV9zdGF0ZV9pcygmcGdbaV0sIGludXNl
KSB8fAorICAgICAgICAgICAgICAgcGFnZV9zdGF0ZV9pcygmcGdbaV0sIG9mZmxpbmluZykpOwor
ICAgICAgICBBU1NFUlQoIShwZ1tpXS5jb3VudF9pbmZvICYgfihQR0Nfc3RhdGUgfCBQR0NfYnJv
a2VuKSkpOwogICAgICAgICBBU1NFUlQocGFnZV9nZXRfb3duZXIoJnBnW2ldKSA9PSBOVUxMKTsK
LSAgICAgICAgQVNTRVJUKCFwZ1tpXS5jb3VudF9pbmZvKTsKICAgICAgICAgcGFnZV9zZXRfb3du
ZXIoJnBnW2ldLCBkKTsKICAgICAgICAgc21wX3dtYigpOyAvKiBEb21haW4gcG9pbnRlciBtdXN0
IGJlIHZpc2libGUgYmVmb3JlIHVwZGF0aW5nIHJlZmNudC4gKi8KLSAgICAgICAgcGdbaV0uY291
bnRfaW5mbyA9IFBHQ19hbGxvY2F0ZWQgfCAxOworCisgICAgICAgIHBnW2ldLmNvdW50X2luZm8g
Jj0gUEdDX3N0YXRlIHwgUEdDX2Jyb2tlbjsKKyAgICAgICAgcGdbaV0uY291bnRfaW5mbyB8PSBQ
R0NfYWxsb2NhdGVkIHwgMTsKKwogICAgICAgICBwYWdlX2xpc3RfYWRkX3RhaWwoJnBnW2ldLCAm
ZC0+cGFnZV9saXN0KTsKICAgICB9CisgICAgc3Bpbl91bmxvY2soJmhlYXBfbG9jayk7CiAKICBv
dXQ6CiAgICAgc3Bpbl91bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7Ci0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

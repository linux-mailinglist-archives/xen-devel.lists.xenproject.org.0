Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5711A36D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 05:29:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ietaj-0004w5-QY; Wed, 11 Dec 2019 04:27:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qa45=2B=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ietai-0004vx-2I
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 04:27:12 +0000
X-Inumbo-ID: 7fe0f902-1bce-11ea-88e7-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fe0f902-1bce-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 04:27:11 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id v93so8400821pjb.6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 20:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s7ypUOuVnqBd5be1hKp8bDLVVBRRPeaRQV9mQbkGU3s=;
 b=gTENeTiCkWr99yApgh/4VAIyoKDT3J7JznhYgYA4yoRd3lIV7Jm+5BL8ZWoTvA7zRp
 z9pynE4SbT7H+qeti2O+huH/QLAOHUl79cPlwnOC8jDVV7lx8IoXTxHIGs3rhJvAAMQa
 Yc6x1Rvg1pAjEwIvVGdP7984KVM3/BVxsgQNuP6LZ7fkAqAkavw1uX8LJtV2j+Zp6Lb5
 1awdDwCJI3o1m3td6EweC4s2Bl/AsVBEc+qxdVSUDqSpEWAbA3tf9WnGg8pegcAPS9R4
 5PjvVVq/2M5E9jWv0ThPdLHenPImUhlT90qLM1HLA+JaSUhSUgxpC8QDPSSX8C4XEFZT
 Jocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s7ypUOuVnqBd5be1hKp8bDLVVBRRPeaRQV9mQbkGU3s=;
 b=c/3ZEeDyqXO0ICD1dWe8be7IVNMHDdj7l7qyPnfEeXIWCcMHIqveGbQOOt9syDot1f
 sLJH/Ne6Shug8w7GOr/tqQhhat2P+2GyYzOpdpxfuqnu+RsEeGSykXI8tTiVFfmqnvfe
 EezsPopzFIMVNxrLD5rzmDReu5IbwUNBuAO71QotjGtT7cUm2F9n2HC5XDwvjGMKBBVC
 arziOCV4liAGMPOpClhlQ3waAuXeBDwfYnAOFPNnK0gNR4qaTwllZTEGNJVwqHxWWPmJ
 MH8Fx+3sNKz0Gk+TliSr1upRF0nhxRWN/e1c61tvC0ETwWiLLsZ0B1mtdasePnqqBp44
 RHiQ==
X-Gm-Message-State: APjAAAXnrXiQE+JdjSgsKgVu6ivuyWow7sOXnuoidrom54KCUzN3aVoh
 4RVQMqR94O8bmOMPE2OJinY=
X-Google-Smtp-Source: APXvYqxmdkRJdHXU4kf3uFrsdx5z19XOW4pKdUEplSPaVl+4BRm2wt+R0nQkpS14IKgOpvMW5oYY+g==
X-Received: by 2002:a17:90a:1955:: with SMTP id
 21mr1200544pjh.105.1576038430640; 
 Tue, 10 Dec 2019 20:27:10 -0800 (PST)
Received: from localhost.localdomain ([12.176.148.120])
 by smtp.gmail.com with ESMTPSA id r62sm692916pfc.89.2019.12.10.20.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 20:27:09 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Date: Wed, 11 Dec 2019 04:26:57 +0000
Message-Id: <20191211042657.6037-1-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211042428.5961-1-sjpark@amazon.de>
References: <20191211042428.5961-1-sjpark@amazon.de>
Subject: [Xen-devel] [PATCH v6 1/3] xenbus/backend: Add memory pressure
 handler callback
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
Cc: sjpark@amazon.com, pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3JhbnRpbmcgcGFnZXMgY29uc3VtZXMgYmFja2VuZCBzeXN0ZW0gbWVtb3J5LiAgSW4gc3lzdGVt
cyBjb25maWd1cmVkCndpdGggaW5zdWZmaWNpZW50IHNwYXJlIG1lbW9yeSBmb3IgdGhvc2UgcGFn
ZXMsIGl0IGNhbiBjYXVzZSBhIG1lbW9yeQpwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVyLCBm
aW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKbWVtb3J5IGlzIGNoYWxsZW5n
aW5nIGZvciBsYXJnZSBzeXN0ZW1zIGhhdmluZyBkeW5hbWljIHJlc291cmNlCnV0aWxpemF0aW9u
IHBhdHRlcm5zLiAgQWxzbywgc3VjaCBhIHN0YXRpYyBjb25maWd1cmF0aW9uIG1pZ2h0IGxhY2sK
ZmxleGliaWxpdHkuCgpUbyBtaXRpZ2F0ZSBzdWNoIHByb2JsZW1zLCB0aGlzIGNvbW1pdCBhZGRz
IGEgbWVtb3J5IHJlY2xhaW0gY2FsbGJhY2sgdG8KJ3hlbmJ1c19kcml2ZXInLiAgSWYgYSBtZW1v
cnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQsICd4ZW5idXMnIHJlcXVlc3RzCmV2ZXJ5IGJhY2tlbmQg
ZHJpdmVyIHRvIHZvbHVuYXJpbHkgcmVsZWFzZSBpdHMgbWVtb3J5LgoKTm90ZSB0aGF0IGl0IHdv
dWxkIGJlIGFibGUgdG8gaW1wcm92ZSB0aGUgY2FsbGJhY2sgZmFjaWxpdHkgZm9yIG1vcmUKc29w
aGlzdGljYXRlZCBoYW5kbGluZ3Mgb2YgZ2VuZXJhbCBwcmVzc3VyZXMuICBGb3IgZXhhbXBsZSwg
aXQgd291bGQgYmUKcG9zc2libGUgdG8gbW9uaXRvciB0aGUgbWVtb3J5IGNvbnN1bXB0aW9uIG9m
IGVhY2ggZGV2aWNlIGFuZCBpc3N1ZSB0aGUKcmVsZWFzZSByZXF1ZXN0cyB0byBvbmx5IGRldmlj
ZXMgd2hpY2ggY2F1c2luZyB0aGUgcHJlc3N1cmUuICBBbHNvLCB0aGUKY2FsbGJhY2sgY291bGQg
YmUgZXh0ZW5kZWQgdG8gaGFuZGxlIG5vdCBvbmx5IG1lbW9yeSwgYnV0IGdlbmVyYWwKcmVzb3Vy
Y2VzLiAgTmV2ZXJ0aGVsZXNzLCB0aGlzIHZlcnNpb24gb2YgdGhlIGltcGxlbWVudGF0aW9uIGRl
ZmVycyBzdWNoCnNvcGhpc3RpY2F0ZWQgZ29hbHMgYXMgYSBmdXR1cmUgd29yay4KClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IFNlb25n
SmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+Ci0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1
c19wcm9iZV9iYWNrZW5kLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS94
ZW4veGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQs
IDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVz
X3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2Vu
ZC5jCmluZGV4IGIwYmVkNGZhZjQ0Yy4uYWVkYmUyMTk4ZGU1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYworKysgYi9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwpAQCAtMjQ4LDYgKzI0OCwzNSBAQCBzdGF0aWMgaW50
IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNoKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIs
CiAJcmV0dXJuIE5PVElGWV9ET05FOwogfQogCitzdGF0aWMgaW50IHhlbmJ1c19iYWNrZW5kX3Jl
Y2xhaW0oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQoreworCXN0cnVjdCB4ZW5idXNf
ZHJpdmVyICpkcnY7CisKKwlpZiAoIWRldi0+ZHJpdmVyKQorCQlyZXR1cm4gMDsKKwlkcnYgPSB0
b194ZW5idXNfZHJpdmVyKGRldi0+ZHJpdmVyKTsKKwlpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbSkK
KwkJZHJ2LT5yZWNsYWltKHRvX3hlbmJ1c19kZXZpY2UoZGV2KSk7CisJcmV0dXJuIDA7Cit9CisK
Ky8qCisgKiBSZXR1cm5zIDAgYWx3YXlzIGJlY2F1c2Ugd2UgYXJlIHVzaW5nIHNocmlua2VyIHRv
IG9ubHkgZGV0ZWN0IG1lbW9yeQorICogcHJlc3N1cmUuCisgKi8KK3N0YXRpYyB1bnNpZ25lZCBs
b25nIHhlbmJ1c19iYWNrZW5kX3Nocmlua19jb3VudChzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2Vy
LAorCQkJCXN0cnVjdCBzaHJpbmtfY29udHJvbCAqc2MpCit7CisJYnVzX2Zvcl9lYWNoX2Rldigm
eGVuYnVzX2JhY2tlbmQuYnVzLCBOVUxMLCBOVUxMLAorCQkJeGVuYnVzX2JhY2tlbmRfcmVjbGFp
bSk7CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBzdHJ1Y3Qgc2hyaW5rZXIgeGVuYnVzX2JhY2tl
bmRfc2hyaW5rZXIgPSB7CisJLmNvdW50X29iamVjdHMgPSB4ZW5idXNfYmFja2VuZF9zaHJpbmtf
Y291bnQsCisJLnNlZWtzID0gREVGQVVMVF9TRUVLUywKK307CisKIHN0YXRpYyBpbnQgX19pbml0
IHhlbmJ1c19wcm9iZV9iYWNrZW5kX2luaXQodm9pZCkKIHsKIAlzdGF0aWMgc3RydWN0IG5vdGlm
aWVyX2Jsb2NrIHhlbnN0b3JlX25vdGlmaWVyID0gewpAQCAtMjY0LDYgKzI5Myw5IEBAIHN0YXRp
YyBpbnQgX19pbml0IHhlbmJ1c19wcm9iZV9iYWNrZW5kX2luaXQodm9pZCkKIAogCXJlZ2lzdGVy
X3hlbnN0b3JlX25vdGlmaWVyKCZ4ZW5zdG9yZV9ub3RpZmllcik7CiAKKwlpZiAocmVnaXN0ZXJf
c2hyaW5rZXIoJnhlbmJ1c19iYWNrZW5kX3Nocmlua2VyKSkKKwkJcHJfd2Fybigic2hyaW5rZXIg
cmVnaXN0cmF0aW9uIGZhaWxlZFxuIik7CisKIAlyZXR1cm4gMDsKIH0KIHN1YnN5c19pbml0Y2Fs
bCh4ZW5idXNfcHJvYmVfYmFja2VuZF9pbml0KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hl
bmJ1cy5oIGIvaW5jbHVkZS94ZW4veGVuYnVzLmgKaW5kZXggODY5YzgxNmQ1ZjhjLi4xOTYyNjAw
MTc2NjYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUveGVuL3hlbmJ1cy5oCisrKyBiL2luY2x1ZGUveGVu
L3hlbmJ1cy5oCkBAIC0xMDQsNiArMTA0LDcgQEAgc3RydWN0IHhlbmJ1c19kcml2ZXIgewogCXN0
cnVjdCBkZXZpY2VfZHJpdmVyIGRyaXZlcjsKIAlpbnQgKCpyZWFkX290aGVyZW5kX2RldGFpbHMp
KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpOwogCWludCAoKmlzX3JlYWR5KShzdHJ1Y3QgeGVu
YnVzX2RldmljZSAqZGV2KTsKKwl2b2lkICgqcmVjbGFpbSkoc3RydWN0IHhlbmJ1c19kZXZpY2Ug
KmRldik7CiB9OwogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZW5idXNfZHJpdmVyICp0b194ZW5i
dXNfZHJpdmVyKHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYpCi0tIAoyLjE3LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

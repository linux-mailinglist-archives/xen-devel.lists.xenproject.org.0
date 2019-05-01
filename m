Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E4011072
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 02:01:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLz6q-0002Ht-JT; Wed, 01 May 2019 23:57:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9NrI=TB=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hLz6p-0002Ho-OE
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 23:57:55 +0000
X-Inumbo-ID: eb48e13a-6c6c-11e9-92bd-7b42fef032fb
Received: from mail-io1-f65.google.com (unknown [209.85.166.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb48e13a-6c6c-11e9-92bd-7b42fef032fb;
 Wed, 01 May 2019 23:57:47 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c3so493039iok.6
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 16:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F1EFwmjRejkSVIk6M9h9XXs2tmKYOLzDlJ5HmptljIQ=;
 b=N+HkyBPB43EPtY4jJLrOm45s1i4YV81ZuBJLlyCIyVlkZr/GP6Ux2yHtoGoYPcvob6
 XWym1XxOZTjbZMkCrPzY1W+OaIpvc9kPOvB04mYaKoXxicOk1WzRiob2fQ16F84hx+/L
 zj7FWEZK2IYXy940Pc0cx/loW7PujMsmkfzpUxySqDz+DZsNZm5jpLhGLtEAm1+rnpgO
 ExybsFsFXqSzcqYHVFSxCbzu9b6mW0CBEI2Qn+5trX7I+tueVYprmjluW6yWWMdd43Mt
 epMCjbPvy5prpIplZsLRfcPXSBp8v5dtxhN62MFLQ6FCocomvNkzt1FpoU704FGwxa3m
 of9Q==
X-Gm-Message-State: APjAAAVnPJXwcpC6ihHH9N1KSdg6g8MybpHu8lMyja/VJItPlITebnb1
 D0bGi2fHErK9t4J24RX/+8XEX9dQ
X-Google-Smtp-Source: APXvYqzRP3TikTsUVibuWiEYHaKqIRSyJMoUXO4gP3p0DMDTZLsmANvT+5Hv9KdHe8TawY15/aWCGw==
X-Received: by 2002:a5d:9397:: with SMTP id c23mr109791iol.206.1556755066538; 
 Wed, 01 May 2019 16:57:46 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id t191sm3907455itt.17.2019.05.01.16.57.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 16:57:45 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 17:57:31 -0600
Message-Id: <20190501235731.1486-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVjZWl2aW5nIHRoaXMgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBpbnRyb3NwZWN0aW5nIDMyLWJp
dCBXaW5kb3dzIHdoZW4gdGhlCmV2ZW50IGJlaW5nIHRyYXBwZWQgaGFwcGVuZWQgd2hpbGUgaW4g
cmluZzMuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5j
b20+CkNjOiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CkNjOiBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ2M6IFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMgICAg
ICAgfCA1ICsrKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaCB8IDMgKystCiAyIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKaW5kZXgg
NTFjMzQ5M2IxZC4uODczNzg4ZTMyZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50
LmMKKysrIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKQEAgLTE3OSw2ICsxNzksMTAgQEAgc3Rh
dGljIHZvaWQgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyKGVudW0geDg2X3NlZ21lbnQg
c2VnbWVudCwKICAgICAgICAgcmVnLT5lc19zZWwgPSBzZWcuc2VsOwogICAgICAgICBicmVhazsK
IAorICAgIGNhc2UgeDg2X3NlZ19nZHRyOgorICAgICAgICByZWctPmdkdHJfYmFzZSA9IHNlZy5i
YXNlOworICAgICAgICBicmVhazsKKwogICAgIGRlZmF1bHQ6CiAgICAgICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOwogICAgIH0KQEAgLTIzOCw2ICsyNDIsNyBAQCB2b2lkIHZtX2V2ZW50X2ZpbGxf
cmVncyh2bV9ldmVudF9yZXF1ZXN0X3QgKnJlcSkKICAgICB2bV9ldmVudF9wYWNrX3NlZ21lbnRf
cmVnaXN0ZXIoeDg2X3NlZ19zcywgJnJlcS0+ZGF0YS5yZWdzLng4Nik7CiAgICAgdm1fZXZlbnRf
cGFja19zZWdtZW50X3JlZ2lzdGVyKHg4Nl9zZWdfZHMsICZyZXEtPmRhdGEucmVncy54ODYpOwog
ICAgIHZtX2V2ZW50X3BhY2tfc2VnbWVudF9yZWdpc3Rlcih4ODZfc2VnX2VzLCAmcmVxLT5kYXRh
LnJlZ3MueDg2KTsKKyAgICB2bV9ldmVudF9wYWNrX3NlZ21lbnRfcmVnaXN0ZXIoeDg2X3NlZ19n
ZHRyLCAmcmVxLT5kYXRhLnJlZ3MueDg2KTsKIAogICAgIHJlcS0+ZGF0YS5yZWdzLng4Ni5zaGFk
b3dfZ3MgPSBjdHh0LnNoYWRvd19nczsKICAgICByZXEtPmRhdGEucmVncy54ODYuZHI2ID0gY3R4
dC5kcjY7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaCBiL3hlbi9p
bmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCmluZGV4IGIyYmFmYzBkNzcuLmZkMDIwYzVlYTcgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCisrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy92bV9ldmVudC5oCkBAIC0yOSw3ICsyOSw3IEBACiAKICNpbmNsdWRlICJ4ZW4uaCIK
IAotI2RlZmluZSBWTV9FVkVOVF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDA0CisjZGVmaW5l
IFZNX0VWRU5UX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMDUKIAogI2lmIGRlZmluZWQoX19Y
RU5fXykgfHwgZGVmaW5lZChfX1hFTl9UT09MU19fKQogCkBAIC0xOTgsNiArMTk4LDcgQEAgc3Ry
dWN0IHZtX2V2ZW50X3JlZ3NfeDg2IHsKICAgICB1aW50NjRfdCBtc3JfZWZlcjsKICAgICB1aW50
NjRfdCBtc3Jfc3RhcjsKICAgICB1aW50NjRfdCBtc3JfbHN0YXI7CisgICAgdWludDY0X3QgZ2R0
cl9iYXNlOwogICAgIHVpbnQzMl90IGNzX2Jhc2U7CiAgICAgdWludDMyX3Qgc3NfYmFzZTsKICAg
ICB1aW50MzJfdCBkc19iYXNlOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

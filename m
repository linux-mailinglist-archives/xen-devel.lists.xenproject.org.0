Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AF13C891
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 16:59:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irl29-00014f-Gw; Wed, 15 Jan 2020 15:56:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FWRo=3E=gmail.com=madhuparnabhowmik04@srs-us1.protection.inumbo.net>)
 id 1irl27-00014a-C5
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 15:56:39 +0000
X-Inumbo-ID: 9d23ef90-37af-11ea-b89f-bc764e2007e4
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d23ef90-37af-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 15:56:38 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w62so8712102pfw.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HwV9sGACUDknSqn3rZRjdfv8PQfY2jtJrBDpPLg25bE=;
 b=pfZQgYjBcjyCtn6E2E//UIWWV7YF8uAjc6ggh4p5mbPc/GNDh/t8TClwCoKqEY9iKm
 31WcNv/TU4fwcs85/hvITBoBQwLVXKXc/pq1wY9AFtXF2yclNcKLougfpxo4Rk7HthPf
 JKGNTLguhyvB97/Am9L/CUP3MrCj/46w4fxjcRfkXO25T4sy6vMUxLTAtfX+DvZ+ztaN
 0TJinWp2KwiFxkOa5ztbYrQZYs73Hv1EuT6dgymCzvzr+fdm6LEZUH2G+6yYELu7EAOO
 KM6yEegZ79mbzuNRVufVKJ2z4+wCZyjhs7MRMvV9HWkgyOvBGAQgQiMD9SVbFGb4EqZn
 upRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HwV9sGACUDknSqn3rZRjdfv8PQfY2jtJrBDpPLg25bE=;
 b=FSwen/eE0jIsoCBDlP7QVB+d2Q3exsL723sTA5nVezBsjU5/RXTxK4HyCOKPuvD+Fk
 2pklKs+LsJz7fRGbEBtt+cFbeDCFUWLih75SC/UCIxg9G7Dr5gRSi97jEZq6ICPcQY/1
 3oiAd8JOOD87f1AdxvMXEEq6HEI0qahBO8TQXiv9THTbkF0pJQ9iO0EUUwPOB5dI0Un7
 3sdi7ZmrojkiIKHWJHtPht/8e+982E8DqaS6dQBhD7JnFYIDmg1S5pd37hRixVd8e7AX
 RLKUIHfpUdC9XYqDf+Zx9BgWAKD5vOrfa41/WW2Ts7Yyyz7/qb/lpQidfqdrp2uH+2df
 FnSQ==
X-Gm-Message-State: APjAAAVzNKwo10zWny8vKUBPshM2A6Cia6Idj8q/kbl5KoI4yatiNtOL
 0uI+i2EJrwFPoe+zVWefI48=
X-Google-Smtp-Source: APXvYqwfBfFNxEYPBk1P4r0u33EcwZqChtsYsDBcPVXmULzU6XIoKIK5xPGRQ8bZGAylr4brUje92g==
X-Received: by 2002:a63:4b50:: with SMTP id k16mr34152524pgl.386.1579103797712; 
 Wed, 15 Jan 2020 07:56:37 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee8:ed72:75ba:e01f:bdbc:c547])
 by smtp.gmail.com with ESMTPSA id b8sm22755599pfr.64.2020.01.15.07.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:56:37 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: wei.liu@kernel.org,
	paul@xen.org
Date: Wed, 15 Jan 2020 21:25:53 +0530
Message-Id: <20200115155553.13471-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] net: xen-netback: hash.c: Use built-in RCU list
 checking
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
Cc: paulmck@kernel.org, frextrite@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhvd21pazA0QGdtYWlsLmNvbT4K
Cmxpc3RfZm9yX2VhY2hfZW50cnlfcmN1IGhhcyBidWlsdC1pbiBSQ1UgYW5kIGxvY2sgY2hlY2tp
bmcuClBhc3MgY29uZCBhcmd1bWVudCB0byBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdS4KClNpZ25l
ZC1vZmYtYnk6IE1hZGh1cGFybmEgQmhvd21payA8bWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaGFzaC5jIHwgNiArKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaGFzaC5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aGFzaC5jCmluZGV4IDEwZDU4MGMzZGVhMy4uNmI3NTMyZjdjOTM2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC94ZW4tbmV0YmFjay9oYXNoLmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aGFzaC5jCkBAIC01MSw3ICs1MSw4IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9hZGRfaGFzaChzdHJ1
Y3QgeGVudmlmICp2aWYsIGNvbnN0IHU4ICp0YWcsCiAKIAlmb3VuZCA9IGZhbHNlOwogCW9sZGVz
dCA9IE5VTEw7Ci0JbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoZW50cnksICZ2aWYtPmhhc2guY2Fj
aGUubGlzdCwgbGluaykgeworCWxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KGVudHJ5LCAmdmlmLT5o
YXNoLmNhY2hlLmxpc3QsIGxpbmssCisJCQkJbG9ja2RlcF9pc19oZWxkKCZ2aWYtPmhhc2guY2Fj
aGUubG9jaykpIHsKIAkJLyogTWFrZSBzdXJlIHdlIGRvbid0IGFkZCBkdXBsaWNhdGUgZW50cmll
cyAqLwogCQlpZiAoZW50cnktPmxlbiA9PSBsZW4gJiYKIAkJICAgIG1lbWNtcChlbnRyeS0+dGFn
LCB0YWcsIGxlbikgPT0gMCkKQEAgLTEwMiw3ICsxMDMsOCBAQCBzdGF0aWMgdm9pZCB4ZW52aWZf
Zmx1c2hfaGFzaChzdHJ1Y3QgeGVudmlmICp2aWYpCiAKIAlzcGluX2xvY2tfaXJxc2F2ZSgmdmlm
LT5oYXNoLmNhY2hlLmxvY2ssIGZsYWdzKTsKIAotCWxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KGVu
dHJ5LCAmdmlmLT5oYXNoLmNhY2hlLmxpc3QsIGxpbmspIHsKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5
X3JjdShlbnRyeSwgJnZpZi0+aGFzaC5jYWNoZS5saXN0LCBsaW5rLAorCQkJCWxvY2tkZXBfaXNf
aGVsZCgmdmlmLT5oYXNoLmNhY2hlLmxvY2spKSB7CiAJCWxpc3RfZGVsX3JjdSgmZW50cnktPmxp
bmspOwogCQl2aWYtPmhhc2guY2FjaGUuY291bnQtLTsKIAkJa2ZyZWVfcmN1KGVudHJ5LCByY3Up
OwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C168315F834
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 21:53:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2hui-00046H-Qa; Fri, 14 Feb 2020 20:50:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ulQC=4C=gmail.com=jbi.octave@srs-us1.protection.inumbo.net>)
 id 1j2htL-0003Nn-7R
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 20:48:51 +0000
X-Inumbo-ID: 673fe87e-4f6b-11ea-ade5-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 673fe87e-4f6b-11ea-ade5-bc764e2007e4;
 Fri, 14 Feb 2020 20:48:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g3so12446073wrs.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2020 12:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zGVQl5tfhTgXtZcPGr0AgAgQcAWmtrINLrUVSPJZyMM=;
 b=XlgwllhOKgfzsr9S3lg1Ff1Wd7uyV74DxaYnxsTNNvOrV5deKNYHp+Cvx6C7idGDmS
 DG6hQlVKZSy5QI6PWgaZuo/ptdri2lO7Fa2VmEh7Hkst04+zyjvdZaoq+MHy8Qy/eguM
 f238TfG4UVpMk397bZ3Mh4bY/6r6YCRFA4zDE7E5eT6PU5mUF5iNbKCUgT30MgJwbPFS
 D+wouZLWmm30eehaMnaPP54fPZCN7KHGbK1fxwlAEbp6p1rk0JAlCvuu4daMVmEhpver
 bBtZmb6tF+1OyAssHqL+foYdcJf3LcCbvMBTj+45YIX5hDWPoqD2ETjAGgUfxWrH4qcS
 eu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGVQl5tfhTgXtZcPGr0AgAgQcAWmtrINLrUVSPJZyMM=;
 b=XfcMeYcEmorFZGCNZLKg4end4nqBE63fkyn3KTWFaRrvC9nsFZMod+rzxErXqm4Zcp
 8zJZ8cmPIzopKPuBtKezojbcBrL2a1L6nghAoY5DMEPaNfcf95d/B4FiCZCQCw4vkBrU
 4QubJgsSpRJT6cREuetslj9dgjZnm2Kl8Ed35j23xXU9GKbmeXVALBU4SCnpVtz2BHP4
 e+Sq2K/Uaa+GwcUsUjOVkBMrHbZwN31KUYvHpiwKJtMsjV/q61jc7vxItdrmjywMf+TS
 OT7yvKJD3OZvU2GxotPFS5MoznpmCSpxBjcDN1wMS8Z6ZgCImcuIJoXcfC6GptTXoMSR
 +FVA==
X-Gm-Message-State: APjAAAWGfJrgRHH6Cq8AwBzlDKvzRgzbq+25xgnrZN1QRn+mrXjPCyyl
 2r0GHaO8DNBxgQ7e7Xv1mg==
X-Google-Smtp-Source: APXvYqxCWIonj6ZpkqM3+TVFvnnbQxOmoFF6Pnc+18/k25klv+xtWHpbOGzTuoRN1TgTK4pO8Bg+Pw==
X-Received: by 2002:adf:ed0c:: with SMTP id a12mr5804592wro.368.1581713329510; 
 Fri, 14 Feb 2020 12:48:49 -0800 (PST)
Received: from ninjahost.lan (host-2-102-13-223.as13285.net. [2.102.13.223])
 by smtp.googlemail.com with ESMTPSA id y12sm8660782wmj.6.2020.02.14.12.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 12:48:49 -0800 (PST)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 14 Feb 2020 20:47:25 +0000
Message-Id: <20200214204741.94112-15-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214204741.94112-1-jbi.octave@gmail.com>
References: <0/30>
 <20200214204741.94112-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 20:50:15 +0000
Subject: [Xen-devel] [PATCH 14/30] x86/xen: Add missing annotation for
 xen_pte_lock()
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
Cc: Juergen Gross <jgross@suse.com>, Jules Irenge <jbi.octave@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, boqun.feng@gmail.com,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3BhcnNlIHJlcG9ydHMgd2FybmluZyBhdCB4ZW5fcHRlX2xvY2soKQoKd2FybmluZzogY29udGV4
dCBpbWJhbGFuY2UgaW4geGVuX3B0ZV9sb2NrKCkgLSB3cm9uZyBjb3VudCBhdCBleGl0CgpUaGUg
cm9vdCBjYXVzZSBpcyB0aGUgbWlzc2luZyBhbm5vdGF0aW9uIGF0IHhlbl9wdGVfbG9jaygpCkFk
ZCB0aGUgbWlzc2luZyBfX2FjcXVpcmVzKHB0bCkgYW5ub3RhdGlvbgoKU2lnbmVkLW9mZi1ieTog
SnVsZXMgSXJlbmdlIDxqYmkub2N0YXZlQGdtYWlsLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4vbW11
X3B2LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L3hlbi9tbXVfcHYuYyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwppbmRleCBiYmJh
OGIxNzgyOWEuLjM1MmYwYzgwY2ZjZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5j
CisrKyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwpAQCAtNjk1LDYgKzY5NSw3IEBAIHN0YXRpYyBp
bnQgeGVuX3BnZF93YWxrKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogLyogSWYgd2UncmUgdXNpbmcg
c3BsaXQgcHRlIGxvY2tzLCB0aGVuIHRha2UgdGhlIHBhZ2UncyBsb2NrIGFuZAogICAgcmV0dXJu
IGEgcG9pbnRlciB0byBpdC4gIE90aGVyd2lzZSByZXR1cm4gTlVMTC4gKi8KIHN0YXRpYyBzcGlu
bG9ja190ICp4ZW5fcHRlX2xvY2soc3RydWN0IHBhZ2UgKnBhZ2UsIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tKQorCV9fYWNxdWlyZXMocHRsKQogewogCXNwaW5sb2NrX3QgKnB0bCA9IE5VTEw7CiAKLS0g
CjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

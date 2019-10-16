Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79405D8D72
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:12:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgEG-0006Xa-Tz; Wed, 16 Oct 2019 10:08:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jgHM=YJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iKgEE-0006XV-K8
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:08:26 +0000
X-Inumbo-ID: e419fd68-effc-11e9-beca-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e419fd68-effc-11e9-beca-bc764e2007e4;
 Wed, 16 Oct 2019 10:08:25 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d1so23306305ljl.13
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2019 03:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ey0gJAWT8ZHXWHmoB9yq8/ELLpfh8IwG0AKsCTAprZA=;
 b=JmNPddfFfv5pCC+/lAcIzqQnkTjpWlv4W8wL7oOf/auYQxxC+kkHsm9Z4/V3LhIMPU
 e7fjyGdFk8y1GI0Cr+q6H3YfQk2WOn3kbAdwJXl1SHtWLIQVeGB4EA0pdxm38jVUoOsE
 hHgM1c1mzJdUrBNY4t0D0s/vcSwCfp4qEDjFNC1GVFX5lzUcY/q3BA9irx85ms7tk3CI
 OFmq56mmlmCYKhAW9NkJuYPn3aUiCSon0b5Pqt7PWZoC2MZzXz3kMj1ohAeNHVvxkpd6
 QhfUZ03B5B9JWdu4pPsaR512YLSV1NCUTpmqxIbMNQjDGQ4YDs537g+BjQytaRlA8n1p
 KHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ey0gJAWT8ZHXWHmoB9yq8/ELLpfh8IwG0AKsCTAprZA=;
 b=GRTUr/n7WttRH0smhGWUbfhPns3W7LhoMN73cmwfJ4bWCsoHyuPMRq7zXiGiBn4dQ1
 gZ3Ioe01bY4FxeymxIEg0E3/DK2M3/r7Aff+rr/AVod1l11wW7RsZR490o6KNtfz4TIg
 RMAyA6V3rCZvN5B8MdeggfOczf7JmQ059sfcn7GFgaLPp9qL4Y/NtGxopF2+TksjxuQ3
 qhyK+sMzNa7E89koyFyteJs/wgcNJpx3tuK3WLQ22NHWZpErBHjFiGPCw5HBCQ0fAMKL
 g7HGfvS10JJGqk3PbMpteCbNnG5BX38aeBanU7cW3fuhgQs78lUTTfm+keRQOU20lHFX
 Sa8w==
X-Gm-Message-State: APjAAAWz8+PNU7Y8FNibPO7ty4CRH1T/Y7ZZEIehfMl7+ZT34r8h4UYL
 4PsK1VAjCs5qU7UZ66P2NbdbI7NZhQc=
X-Google-Smtp-Source: APXvYqzHyfI3OGKzeRz4S0M5sUsa4ScSrntLphRHvDCcuAcss99g8jbSAOa/uwmg8oRFVbEFElSjgA==
X-Received: by 2002:a2e:a166:: with SMTP id u6mr25419005ljl.209.1571220504183; 
 Wed, 16 Oct 2019 03:08:24 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id v21sm1317853lfi.22.2019.10.16.03.08.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Oct 2019 03:08:23 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 16 Oct 2019 13:08:07 +0300
Message-Id: <1571220487-6582-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH for-4.13 v3] xen/arm: domain_build: Don't expose
 IOMMU specific properties to hwdom
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
Cc: jgross@suse.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 julien.grall@arm.com, sstabellini@kernel.org, volodymyr_babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKV2UgYWx3YXlzIHNraXAgdGhlIElPTU1VIGRldmljZSB3aGVuIGNyZWF0aW5nIERUIGZvciBo
d2RvbSBpZiB0aGVyZSBpcwphbiBhcHByb3ByaWF0ZSBkcml2ZXIgZm9yIGl0IGluIFhlbiAoZGV2
aWNlX2dldF9jbGFzcyhpb21tdV9ub2RlKQpyZXR1cm5zIERFVklDRV9JT01NVSkuIFNvLCBldmVu
IGlmIGl0IGlzIG5vdCB1c2VkIGJ5IFhlbiBpdCB3aWxsIGJlIHNraXBwZWQuCgpXZSBzaG91bGQg
YWxzbyBza2lwIHRoZSBJT01NVSBzcGVjaWZpYyBwcm9wZXJ0aWVzIG9mIHRoZSBtYXN0ZXIgZGV2
aWNlCmJlaGluZCB0aGF0IElPTU1VIGluIG9yZGVyIHRvIGF2b2lkIGV4cG9zaW5nIGFuIGhhbGYg
Y29tcGxldGUgSU9NTVUKYmluZGluZ3MgdG8gaHdkb20uCgpBY2NvcmRpbmcgdG8gdGhlIExpbnV4
J3MgZG9jczoKMS4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2lvbW11
LnR4dAoyLiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3BjaS1pb21tdS50
eHQKClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNo
ZW5rb0BlcGFtLmNvbT4KCi0tLQpDaGFuZ2VzIFYyIFsyXSAtPiBWMzoKICAgLSBHYXRoZXIgdHdv
IGNvbmRpdGlvbnMgaW4gb25lICJpZiIKICAgLSBDbGFyaWZ5IHBhdGNoIHN1YmplY3QvY29tbWVu
dCBpbiBjb2RlCgpDaGFuZ2VzIFYxIFsxXSAtPiBWMjoKICAgLSBPbmx5IHNraXAgSU9NTVUgc3Bl
Y2lmaWMgcHJvcGVydGllcyBvZiB0aGUgbWFzdGVyIGRldmljZSBpZiB3ZQogICAgIHNraXAgdGhl
IGNvcnJlc3BvbmRpbmcgSU9NTVUgZGV2aWNlCiAgIC0gVXNlICJod2RvbSIgb3ZlciAiRG9tMCIK
ClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTktMTAvbXNnMDAxMDQuaHRtbApbMl0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTEwL21zZzAwNjczLmh0bWwKLS0tCiB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCAxZDVl
YWM5Li42ZTg1ZWY0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysr
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC00ODAsMTAgKzQ4MCwyNSBAQCBzdGF0
aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBr
ZXJuZWxfaW5mbyAqa2luZm8sCiAgICAgY29uc3Qgc3RydWN0IGR0X3Byb3BlcnR5ICpwcm9wLCAq
c3RhdHVzID0gTlVMTDsKICAgICBpbnQgcmVzID0gMDsKICAgICBpbnQgaGFkX2RvbTBfYm9vdGFy
Z3MgPSAwOworICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqaW9tbXVfbm9kZTsKIAogICAgIGlm
ICgga2luZm8tPmNtZGxpbmUgJiYga2luZm8tPmNtZGxpbmVbMF0gKQogICAgICAgICBib290YXJn
cyA9ICZraW5mby0+Y21kbGluZVswXTsKIAorICAgIC8qCisgICAgICogV2UgYWx3YXlzIHNraXAg
dGhlIElPTU1VIGRldmljZSB3aGVuIGNyZWF0aW5nIERUIGZvciBod2RvbSBpZiB0aGVyZSBpcwor
ICAgICAqIGFuIGFwcHJvcHJpYXRlIGRyaXZlciBmb3IgaXQgaW4gWGVuIChkZXZpY2VfZ2V0X2Ns
YXNzKGlvbW11X25vZGUpCisgICAgICogcmV0dXJucyBERVZJQ0VfSU9NTVUpLgorICAgICAqIFdl
IHNob3VsZCBhbHNvIHNraXAgdGhlIElPTU1VIHNwZWNpZmljIHByb3BlcnRpZXMgb2YgdGhlIG1h
c3RlciBkZXZpY2UKKyAgICAgKiBiZWhpbmQgdGhhdCBJT01NVSBpbiBvcmRlciB0byBhdm9pZCBl
eHBvc2luZyBhbiBoYWxmIGNvbXBsZXRlIElPTU1VCisgICAgICogYmluZGluZ3MgdG8gaHdkb20u
CisgICAgICogVXNlICJpb21tdV9ub2RlIiBhcyBhbiBpbmRpY2F0b3Igb2YgdGhlIG1hc3RlciBk
ZXZpY2Ugd2hpY2ggcHJvcGVydGllcworICAgICAqIHNob3VsZCBiZSBza2lwcGVkLgorICAgICAq
LworICAgIGlvbW11X25vZGUgPSBkdF9wYXJzZV9waGFuZGxlKG5vZGUsICJpb21tdXMiLCAwKTsK
KyAgICBpZiAoIGlvbW11X25vZGUgJiYgZGV2aWNlX2dldF9jbGFzcyhpb21tdV9ub2RlKSAhPSBE
RVZJQ0VfSU9NTVUgKQorICAgICAgICBpb21tdV9ub2RlID0gTlVMTDsKKwogICAgIGR0X2Zvcl9l
YWNoX3Byb3BlcnR5X25vZGUgKG5vZGUsIHByb3ApCiAgICAgewogICAgICAgICBjb25zdCB2b2lk
ICpwcm9wX2RhdGEgPSBwcm9wLT52YWx1ZTsKQEAgLTU0MCw2ICs1NTUsMTkgQEAgc3RhdGljIGlu
dCBfX2luaXQgd3JpdGVfcHJvcGVydGllcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVs
X2luZm8gKmtpbmZvLAogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIH0KIAorICAgICAg
ICBpZiAoIGlvbW11X25vZGUgKQorICAgICAgICB7CisgICAgICAgICAgICAvKiBEb24ndCBleHBv
c2UgSU9NTVUgc3BlY2lmaWMgcHJvcGVydGllcyB0byBod2RvbSAqLworICAgICAgICAgICAgaWYg
KCBkdF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3AsICJpb21tdXMiKSApCisgICAgICAgICAg
ICAgICAgY29udGludWU7CisKKyAgICAgICAgICAgIGlmICggZHRfcHJvcGVydHlfbmFtZV9pc19l
cXVhbChwcm9wLCAiaW9tbXUtbWFwIikgKQorICAgICAgICAgICAgICAgIGNvbnRpbnVlOworCisg
ICAgICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X25hbWVfaXNfZXF1YWwocHJvcCwgImlvbW11LW1h
cC1tYXNrIikgKQorICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICB9CisKICAgICAg
ICAgcmVzID0gZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsIHByb3AtPm5hbWUsIHByb3BfZGF0YSwg
cHJvcF9sZW4pOwogCiAgICAgICAgIGlmICggcmVzICkKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

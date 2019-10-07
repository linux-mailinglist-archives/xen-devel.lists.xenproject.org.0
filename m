Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34061CE70F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUiN-0007C3-Cn; Mon, 07 Oct 2019 15:14:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUiL-0007B2-O3
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:14:21 +0000
X-Inumbo-ID: 05e3b6e4-e915-11e9-8c93-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05e3b6e4-e915-11e9-8c93-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:31 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w2so12924996qkf.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2htTM68zxP0j1foVUJTAU8c3I7wf8QEtD5IUSCOUF2w=;
 b=XpawqHaOGMZrPEdiqmvvu6Ip2+9JMcXN8U45lfBeZCG15vItXP8B6eZgxYADpyStHQ
 jRyd0Gb+jHZhqY5p52UrXQhYm8wMeYml1ekyfEEeuw7d/MzqMz+tdpPoRDnNK70lob4g
 1XxuFWyOP12Y485P0nZ6DIwBoWfBQseb9eG+EaGvepSJDzewglzZshhGE2Li0F33Jw0s
 v8MeHRR+OhgM6L80oDxhMseCmn/ebNIoOiSpnS8yj3IkjMIgR+3OO6K2EFWy0c22aNry
 P+Bq8cAqk00M9OnfpECusmApohOO4QU912rAQysIFW0d9YFSTPSN/pn4ClTLf/EBUewa
 x8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2htTM68zxP0j1foVUJTAU8c3I7wf8QEtD5IUSCOUF2w=;
 b=Tf0JwyDjRNyO5xjIgzaNb+jeaF3+qplJismUkS3sFwRfHxt1U27UZZEBm0pJZ8OQOk
 L/tKkyFNX3h+P57b9URmVK6f8dlnjTYHrZgHO5xlOIXcj20216KRxwGi+Ylia1DdFrKO
 DLcB0NMbu7Ku6fjMDjyjkvbx9NHCdNgc9OAe70A3dhONhIsEmWDuqiFIMZAqHvecaetQ
 yfCAeQHUkYZjW+PXm6uaA5v8nnqxPAYC96xrgnTjkpcRB1YbXRI7wiBb3J+83zGvQOke
 lw4L3LAfObAsLgVcK41MudyGVH+FNYT/41WKal/NdXQy73K488u3FdF4oypO/b5iNXqm
 BnEA==
X-Gm-Message-State: APjAAAV4xVMEVjmMGHYhO13PqiKvzPL7K6NZH262vm1SRiNnISLaOzdK
 fb7hCXepR8PsUU+D3SnmKnsTPz/Q
X-Google-Smtp-Source: APXvYqweIcEUUWwSORHvAEcZd/08vp6vrZlvlcZpod6RdYz23iHYY0feR6N4KM9CiiVRz4RCg1IcAQ==
X-Received: by 2002:a37:66c8:: with SMTP id
 a191mr24153146qkc.108.1570461210702; 
 Mon, 07 Oct 2019 08:13:30 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:30 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:13:00 -0400
Message-Id: <6dbe8bb54d634e7ebe4eb12245255c75ce22fbce.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 13/24] golang/xenlight: re-factor Hwcap type
 implementation
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClJlLWRlZmluZSBI
d2NhcCBhcyBbOF11aW50MzIsIGFuZCBpbXBsZW1lbnQgdG9DIGZ1bmN0aW9uLiBBbHNvLCByZS1u
YW1lIGFuZAptb2RpZnkgc2lnbmF0dXJlIG9mIHRvR28gZnVuY3Rpb24gdG8gZnJvbUMuCgpTaWdu
ZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgotLS0KQ2M6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KCiB0
b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAyOSArKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rv
b2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCAzZTM3NTNmOTJlLi44ZDUyMGJi
ZDk4IDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIv
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC0zMDcsMjAgKzMwNywyOSBAQCB0
eXBlIENvbnRleHQgc3RydWN0IHsKIAlsb2dnZXIgKkMueGVudG9vbGxvZ19sb2dnZXJfc3RkaW9z
dHJlYW0KIH0KIAotdHlwZSBId2NhcCBbXUMudWludDMyX3QKLQotZnVuYyAoY2h3Y2FwIEMubGli
eGxfaHdjYXApIHRvR28oKSAoZ2h3Y2FwIEh3Y2FwKSB7Ci0JLy8gQWxsb2MgYSBHbyBzbGljZSBm
b3IgdGhlIGJ5dGVzCi0Jc2l6ZSA6PSA4Ci0JZ2h3Y2FwID0gbWFrZShbXUMudWludDMyX3QsIHNp
emUpCisvLyBId2NhcCByZXByZXNlbnRzIGEgbGlieGxfaHdjYXAuCit0eXBlIEh3Y2FwIFs4XXVp
bnQzMgogCitmdW5jIChod2NhcCAqSHdjYXApIGZyb21DKGNod2NhcCAqQy5saWJ4bF9od2NhcCkg
ZXJyb3IgewogCS8vIE1ha2UgYSBzbGljZSBwb2ludGluZyB0byB0aGUgQyBhcnJheQotCW1hcHNs
aWNlIDo9ICgqWzEgPDwgMzBdQy51aW50MzJfdCkodW5zYWZlLlBvaW50ZXIoJmNod2NhcFswXSkp
WzpzaXplOnNpemVdCisJbWFwc2xpY2UgOj0gKCpbOF1DLnVpbnQzMl90KSh1bnNhZmUuUG9pbnRl
cihjaHdjYXApKQogCiAJLy8gQW5kIGNvcHkgdGhlIEMgYXJyYXkgaW50byB0aGUgR28gYXJyYXkK
LQljb3B5KGdod2NhcCwgbWFwc2xpY2UpCisJZm9yIGksIHYgOj0gcmFuZ2UgbWFwc2xpY2Ugewor
CQlod2NhcFtpXSA9IHVpbnQzMih2KQorCX0KIAotCXJldHVybgorCXJldHVybiBuaWwKK30KKwor
ZnVuYyAoaHdjYXAgKkh3Y2FwKSB0b0MoKSAoQy5saWJ4bF9od2NhcCwgZXJyb3IpIHsKKwl2YXIg
Y2h3Y2FwIEMubGlieGxfaHdjYXAKKworCWZvciBpLCB2IDo9IHJhbmdlIGh3Y2FwIHsKKwkJY2h3
Y2FwW2ldID0gQy51aW50MzJfdCh2KQorCX0KKworCXJldHVybiBjaHdjYXAsIG5pbAogfQogCiAv
LyBLZXlWYWx1ZUxpc3QgcmVwcmVzZW50cyBhIGxpYnhsX2tleV92YWx1ZV9saXN0LgpAQCAtNDY1
LDcgKzQ3NCw3IEBAIGZ1bmMgKGNwaHlzICpDLmxpYnhsX3BoeXNpbmZvKSB0b0dvKCkgKHBoeXNp
bmZvICpQaHlzaW5mbykgewogCXBoeXNpbmZvLlNoYXJpbmdGcmVlZFBhZ2VzID0gdWludDY0KGNw
aHlzLnNoYXJpbmdfZnJlZWRfcGFnZXMpCiAJcGh5c2luZm8uU2hhcmluZ1VzZWRGcmFtZXMgPSB1
aW50NjQoY3BoeXMuc2hhcmluZ191c2VkX2ZyYW1lcykKIAlwaHlzaW5mby5Ock5vZGVzID0gdWlu
dDMyKGNwaHlzLm5yX25vZGVzKQotCXBoeXNpbmZvLkh3Q2FwID0gY3BoeXMuaHdfY2FwLnRvR28o
KQorCXBoeXNpbmZvLkh3Q2FwLmZyb21DKCZjcGh5cy5od19jYXApCiAJcGh5c2luZm8uQ2FwSHZt
ID0gYm9vbChjcGh5cy5jYXBfaHZtKQogCXBoeXNpbmZvLkNhcEh2bURpcmVjdGlvID0gYm9vbChj
cGh5cy5jYXBfaHZtX2RpcmVjdGlvKQogCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

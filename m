Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA8E11B2F
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:18:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCTx-0001VN-Le; Thu, 02 May 2019 14:14:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f+J5=TC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hMCTv-0001V5-J6
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:14:39 +0000
X-Inumbo-ID: 9e8fce8e-6ce4-11e9-843c-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e8fce8e-6ce4-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 14:14:38 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h21so2291458ljk.13
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=czcrQJ4ZOkigVhUXJ1PqpCqEbSt+PWnfNBwK7rAOIVo=;
 b=HggtKAWincswp8O2AwNnv0IVbVU+lVSKShIk/+ZJ2A0UTcX0jEe6Vhm0LjSN+pLA+6
 fIaiIsxyTfR3npN1xPsqALFShEJkMz0KnlsF7rPVPspQ5rMrScdnmB/Dchi1Vh7pFRTU
 R1et7HwuOCihJm9kH60eAHq3H9/n00o6bb04GmwMAw7ECj4Sx2EC5JxJ3UbmVKPQSWaH
 9ucgdRQ0wsANIQDArMgdZNxFk5YuOod015U5nJEQyxkIK/yb0VdVkmivFgpxyDeke/3j
 d82w55+qdb2KejIfP/SEOc0P8wwVrFnZf9pmOsGqjjNBlXtmMSqRzOBny1oROHqXHwj2
 rphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=czcrQJ4ZOkigVhUXJ1PqpCqEbSt+PWnfNBwK7rAOIVo=;
 b=DLptbDWtA79EExGtI6XH2PFzDntwMY1Gfe9TZ41E45PK3DM8O7SsOf83e9jDYZkqOq
 lNRL15mce7U2dTkJWgsxahVf78KEPAaCxwj7H9XBLjsM9V4xVSyFZS8aUHmWxDIWqEo/
 pKkW6gdrAPOvAvZXgnKCa7096hWVPq0n7osJarHURlQXB0b4H4zAvNRug9Ayh3riL4Z0
 rmSWicQkWEkhJkR89JIcfNqIB4bBDwn1kYSOLqsjv+ZUljSzgTE+eDsAgTT9u2IdUmK/
 X5caeiTIseDW7ucTvazMyRKnK+KN8kmMOA/rlmmEj5NvfioInMm/j/7cZ9X32uHrGX6P
 AYTg==
X-Gm-Message-State: APjAAAU/56npV+qTGLAFgT7csiNefy0/AxbBSTog7N8+6EuUVbU+WL4R
 UYdHg+lapkYcp9onoPP1jlSFKq21DqA=
X-Google-Smtp-Source: APXvYqxwvUq+coxxlISjHlNCZ3dkTi2eTt9o3LlhLai1hthYE5COmHJ43XZFMVCDMJTuwrIKKi55Yg==
X-Received: by 2002:a2e:5c49:: with SMTP id q70mr2092746ljb.16.1556806477373; 
 Thu, 02 May 2019 07:14:37 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id v11sm9447761lfb.68.2019.05.02.07.14.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 02 May 2019 07:14:36 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 17:13:55 +0300
Message-Id: <1556806436-26283-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [RFC PATCH 1/2] xen/device-tree: Add
 dt_count_phandle_with_args helper
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKUG9ydCBMaW51eCBoZWxwZXIgb2ZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MgZm9yIGNvdW50
aW5nCm51bWJlciBvZiBwaGFuZGxlcyBpbiBhIHByb3BlcnR5LgoKU2lnbmVkLW9mZi1ieTogT2xl
a3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgotLS0KIHhl
bi9jb21tb24vZGV2aWNlX3RyZWUuYyAgICAgIHwgIDcgKysrKysrKwogeGVuL2luY2x1ZGUveGVu
L2RldmljZV90cmVlLmggfCAxOSArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZV90cmVlLmMg
Yi94ZW4vY29tbW9uL2RldmljZV90cmVlLmMKaW5kZXggOGZjNDAxZC4uNjU4NjJiNSAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jCisrKyBiL3hlbi9jb21tb24vZGV2aWNlX3Ry
ZWUuYwpAQCAtMTY2Myw2ICsxNjYzLDEzIEBAIGludCBkdF9wYXJzZV9waGFuZGxlX3dpdGhfYXJn
cyhjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGluZGV4LCBvdXRfYXJncyk7CiB9CiAKK2ludCBkdF9jb3VudF9w
aGFuZGxlX3dpdGhfYXJncyhjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmxpc3RfbmFtZSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpjZWxsc19uYW1lKQoreworICAgIHJl
dHVybiBfX2R0X3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKG5wLCBsaXN0X25hbWUsIGNlbGxzX25h
bWUsIDAsIC0xLCBOVUxMKTsKK30KKwogLyoqCiAgKiB1bmZsYXR0ZW5fZHRfbm9kZSAtIEFsbG9j
IGFuZCBwb3B1bGF0ZSBhIGRldmljZV9ub2RlIGZyb20gdGhlIGZsYXQgdHJlZQogICogQGZkdDog
VGhlIHBhcmVudCBkZXZpY2UgdHJlZSBibG9iCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
ZGV2aWNlX3RyZWUuaCBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCmluZGV4IDc0MDhh
NmMuLjgzMTU2MjkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCisr
KyBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCkBAIC03MzgsNiArNzM4LDI1IEBAIGlu
dCBkdF9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUg
Km5wLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmNlbGxzX25h
bWUsIGludCBpbmRleCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHRf
cGhhbmRsZV9hcmdzICpvdXRfYXJncyk7CiAKKy8qKgorICogZHRfY291bnRfcGhhbmRsZV93aXRo
X2FyZ3MoKSAtIEZpbmQgdGhlIG51bWJlciBvZiBwaGFuZGxlcyByZWZlcmVuY2VzIGluIGEgcHJv
cGVydHkKKyAqIEBucDogcG9pbnRlciB0byBhIGRldmljZSB0cmVlIG5vZGUgY29udGFpbmluZyBh
IGxpc3QKKyAqIEBsaXN0X25hbWU6IHByb3BlcnR5IG5hbWUgdGhhdCBjb250YWlucyBhIGxpc3QK
KyAqIEBjZWxsc19uYW1lOiBwcm9wZXJ0eSBuYW1lIHRoYXQgc3BlY2lmaWVzIHBoYW5kbGVzJyBh
cmd1bWVudHMgY291bnQKKyAqCisgKiBSZXR1cm5zIHRoZSBudW1iZXIgb2YgcGhhbmRsZSArIGFy
Z3VtZW50IHR1cGxlcyB3aXRoaW4gYSBwcm9wZXJ0eS4gSXQKKyAqIGlzIGEgdHlwaWNhbCBwYXR0
ZXJuIHRvIGVuY29kZSBhIGxpc3Qgb2YgcGhhbmRsZSBhbmQgdmFyaWFibGUKKyAqIGFyZ3VtZW50
cyBpbnRvIGEgc2luZ2xlIHByb3BlcnR5LiBUaGUgbnVtYmVyIG9mIGFyZ3VtZW50cyBpcyBlbmNv
ZGVkCisgKiBieSBhIHByb3BlcnR5IGluIHRoZSBwaGFuZGxlLXRhcmdldCBub2RlLiBGb3IgZXhh
bXBsZSwgYSBncGlvcworICogcHJvcGVydHkgd291bGQgY29udGFpbiBhIGxpc3Qgb2YgR1BJTyBz
cGVjaWZpZXMgY29uc2lzdGluZyBvZiBhCisgKiBwaGFuZGxlIGFuZCAxIG9yIG1vcmUgYXJndW1l
bnRzLiBUaGUgbnVtYmVyIG9mIGFyZ3VtZW50cyBhcmUKKyAqIGRldGVybWluZWQgYnkgdGhlICNn
cGlvLWNlbGxzIHByb3BlcnR5IGluIHRoZSBub2RlIHBvaW50ZWQgdG8gYnkgdGhlCisgKiBwaGFu
ZGxlLgorICovCitpbnQgZHRfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MoY29uc3Qgc3RydWN0IGR0
X2RldmljZV9ub2RlICpucCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBj
aGFyICpsaXN0X25hbWUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hh
ciAqY2VsbHNfbmFtZSk7CisKICNpZmRlZiBDT05GSUdfREVWSUNFX1RSRUVfREVCVUcKICNkZWZp
bmUgZHRfZHByaW50ayhmbXQsIGFyZ3MuLi4pICBcCiAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyBm
bXQsICMjIGFyZ3MpCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

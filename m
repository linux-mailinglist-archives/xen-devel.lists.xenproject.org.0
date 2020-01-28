Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F214B118
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 09:49:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwMVD-00052Z-3Q; Tue, 28 Jan 2020 08:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ny+q=3R=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1iwMVB-00052U-Bh
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 08:45:41 +0000
X-Inumbo-ID: 8f9f5b20-41aa-11ea-b211-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f9f5b20-41aa-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 08:45:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so15014526wrq.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 00:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZiJpFN94MSyG47xBSvQeytBQe8iQsMhkMYCkPjFrIs8=;
 b=mQzCCvJLAnB63Nzl3dSl5THWqiJOSpxSPDbZEF9d4mIasVlXcl06lI0GHATg/mi/L9
 dnclcnWrge/q/QnBi9ZterPOWk8mAVMP066ZKE3SP7MrlgUu3NdLvSAbVxTdLMvTGMvX
 89n8v/4BddMwstJjNhBAag7WbUhDPOG7f7+wBIiPKsObi3Gh2iVcPq3aWxDuXxhTQ022
 1UMKL2T78qG73H9aVMyaLB4M5EDnPeMGlVt3cj6BIoKjzOR3J22pA3QBGwFNb07sbjQv
 7nxGP+uTl4RFZUMjc4+kSm3vCO/qO6Q0MUk7ue2Pi/qT0qnP0/KbdzKM2ByP1Ewc5iMm
 ji/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZiJpFN94MSyG47xBSvQeytBQe8iQsMhkMYCkPjFrIs8=;
 b=uBQtM4wuejeJ6UK5o+Nn+5TNarVo3fEOdl7Au92d8pHw7cb59Gx3+RYydkU4xrkQNV
 50CODEoLgihoHPOiES4LOU+YL92KhJ7c629Ac09k27l3W+POsEJM7C8mGTo3QXAJ9qqa
 Irjjf2iM3a644+eD5jSKd9wxmmAlzve8I105RmT8DUKl2oXFt7BlxXXbmCP05Joa9EL5
 Kt3RAOirQvrrqG/0Q+VGRBg8qshBbRqgIjlWKOrq1TEVzVUxis7puuLszRn3JdQaiF8K
 cB6W8awN7gmoWImY0r9ijx29fcwcLiD2Wblz5eQ/bgI5EkPJhjo6EjYKDF/BUfjHWSDP
 Ibuw==
X-Gm-Message-State: APjAAAVSqnCN84u6B2bCZJz6eDkEasykRJ5z6ie/+LvyXGmx2hQYE9/D
 Mi/8RSQa+7zz14oUN+bPetmKLN889x+ohsX/Bdk=
X-Google-Smtp-Source: APXvYqyW0veXcIETCH7oZrBV+Ma5QY7XS/O5c11MW07Schqq5LgWYmGYrNM043iahKfGPCQTGdTy5nWtBquvYNm/6O4=
X-Received: by 2002:adf:8150:: with SMTP id 74mr27946301wrm.114.1580201139391; 
 Tue, 28 Jan 2020 00:45:39 -0800 (PST)
MIME-Version: 1.0
References: <CABwOO=cX5N3j_To+YHqKyfR4jxnqgQxmLKCbcijwNOgJvjPpiQ@mail.gmail.com>
 <646e9468-99da-cb4f-b169-e3ca9486c225@citrix.com>
In-Reply-To: <646e9468-99da-cb4f-b169-e3ca9486c225@citrix.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Tue, 28 Jan 2020 16:45:28 +0800
Message-ID: <CABwOO=dFMD=Q3SivSv-RA4CgMBb=OowHDwrrSfdcGrmF7KG_hA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Pry Mar <pryorm09@gmail.com>
Subject: Re: [Xen-devel] Xen Release 4.12.2 and Python 3: M4 python_devel
 module and mkheader.py issues
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMiBKYW4gMjAyMCBhdCAyMDozNiwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxOS8wMS8yMDIwIDA2OjE3LCBLZXZpbiBCdWNr
bGV5IHdyb3RlOgo+ID4gQW55IGNsdWVzIHRoZW4sIGFzIHRvIHdoZXRoZXIgdGhpcyBpcyBhbm90
aGVyIFB5dGhvbjMgaGFuZ292ZXIgZm9yIFhlbiA/Cj4KPiBYZW4gNC4xMyAobm93IHJlbGVhc2Vk
KSBpcyB0aGUgZmlyc3QgdmVyc2lvbiBvZiBYZW4gd2l0aCBhbnkgc2VyaW91cwo+IGZvcm0gUHl0
aG9uIDMgY29tcGF0aWJpbGl0eSAoYW5kIGV2ZW4gdGhlbiwgd2UgbWlzc2VkIGEgZmV3IGNvcm5l
ciBjYXNlcykuCj4KPiBFYXJsaWVyIHZlcnNpb25zIG9mIFhlbiBhcmUgc2ltcGx5IG5vdCBnb2lu
ZyB0byB3b3JrIHdpdGhvdXQgUHkgMi4KPgo+IH5BbmRyZXcKCmFuZAoKT24gTW9uLCAyMCBKYW4g
MjAyMCBhdCAwMzoyNywgUHJ5IE1hciA8cHJ5b3JtMDlAZ21haWwuY29tPiB3cm90ZToKPgo+IE9u
bHkgeGVuLTQuMTMgaGFzIGJlZW4gcGF0Y2hlZCBmb3IgcHl0aG9uMyBzdXBwb3J0LiBUbyBnZXQg
eGVuLTQuMTIgdG8KPiB3b3JrIHdpdGggcHl0aG9uMyBJIHVzZSB0aGUgOSBwYXRjaGVzIGFib3Zl
LiBUaGV5IGFyZSBwYXN0ZWQgZnJvbSB0aGUKPiBEZWJpYW4gZGVsdGEgdXNlZCB0byBidWlsZCBp
biBCdXN0ZXIuCj4KCkp1c3QgdG8gc2F5IHRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLCBhbmQgdG8g
c2F5IHRoYXQgSSBoYXZlIG1hbmFnZWQgdG8KZGVwbG95IGEgWGVuIDQuMTMuMCBvbiBhbiBMRlMg
OS4wIHN5c3RlbSB0aGF0CgphKSBvbmx5IGhhZCBQeXRob24zIGluc3RhbGxlZApiKSBkaWRuJ3Qg
ZXZlbiBoYXZlIGEgbGluayBmcm9tIHB5dGhvbjMgLT4gcHl0aG9uLgoKVGhlcmUncyBhbiB1cGRh
dGVkIHZlcnNpb24gb2YgbXkgb3duICJMRlMgYm9vayIKCmh0dHA6Ly95b3V2ZWdvdGJ1Y2tsZXlz
Lm9yZy5uei9MRlMvTEZTLUJPT0suaHRtbAoKdGhhdCBkZXRhaWxzIHRoZSBjaGFuZ2VzIEkgbmVl
ZGVkIHRvIGFwcGx5IGJ1dCwgYmFzaWNhbGx5LAoodGhvdWdoIEkgYW0gc3VyZSB0aGVzZSB3aWxs
IGhhdmUgYmVlbiBjYXVnaHQgYW5kL29yIGZpeGVkCmluIHRoZSBYZW4gY29kZSBieSBub3cpCgox
KSB0aGVyZSB3ZXJlIHRocmVlCgotV25vLXNvbWUtd2FybmluZy10aGF0LWNhdXNlcy10cmVhdC1h
bGwtd2FybmluZ3MtYXMtZXJyb3JzLXRvLWJlLWluLWVycm9yCgphZGRpdGlvbnMgdG8gWGVuJ3Mg
dG9vbHMvTWFrZWZpbGUsIHZpczoKCi1Xbm8tbm9ubnVsbAotV25vLXN0cmluZ29wLXRydW5jYXRp
b24KLVduby1mb3JtYXQtdHJ1bmNhdGlvbgoKYWxvbmcgd2l0aAoKMikgdGhlIHN3YXAsIGluIHRo
ZSBzYW1lIE1ha2VmaWxlLCBmcm9tCgogIC1JJChYRU5fUk9PVCkvdG9vbHMveGVuc3RvcmUvY29t
cGF0L2luY2x1ZGUKCnRvCgogLUkkKFhFTl9ST09UKS90b29scy94ZW5zdG9yZS9pbmNsdWRlL2Nv
bXBhdAoKYW5kCgozKSBzaW1wbHkgYXBwbHlpbmcgYSBzZWQgYWtpbiB0byB0aGlzIG9uZQoKc2Vk
IC1pIC1lICdzfC91c3IvYmluL2VudiBweXRob258L3Vzci9iaW4vZW52IHB5dGhvbjN8JwphbmFs
eXNlLTlwLXNpbXBsZXRyYWNlLnB5Cgp0byBhbGwgb2YgdGhlIHB5dGhvbiBzY3JpcHRzICBpbiB0
aGUKCnFlbXUteGVuLWRpci1yZW1vdGUvc2NyaXB0cwoKZGlyZWN0b3J5LgoKUXVpdGUgc3VycHJp
c2VkIGF0IGhvdyBmZXcgY2hhbmdlcyBJIG5lZWRlZCB0byBtYWtlLgoKCkFtIHRlbXB0ZWQgdG8g
c3VnZ2VzdCB0aGF0IHRoZSBxZW11LXhlbiBzY3JpcHRzIHNob3VsZApyZXNwZWN0IHRoZSBhcmd1
bWVudCB0byB0aGVpciAvdXNyL2Jpbi9lbnYgZnJvbSB0aGUgYmFyZSBuYW1lCm9mIHRoZQoKUFlU
SE9OPS9wYXRoL3RvL3NvbWUtcHl0aG9uLWludGVycHJldGVyCgpkZWZpbmUgdGhhdCBjYW4gYmUg
c3VwcGxpZWQgdG8gWGVuJ3MgY29uZmlndXJlIGFuZCBtYWtlCmludm9jYXRpb25zLCBidXQgd291
bGQgYWNjZXB0IHRoYXQgZmV3IHN5c3RlbXMgd2lsbCBub3QgaGF2ZQphdCBsZWFzdCBhIGxpbmsg
dG8gYSBiYXJlICJweXRob24iCgpUaGFua3MgYWdhaW4gZm9yIHRoZSBmZWVkYmFjayBhbmQgcG9p
bnRlcnMsCktldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

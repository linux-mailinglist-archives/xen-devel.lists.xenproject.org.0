Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA329DD5
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 20:16:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUEgl-00077o-RM; Fri, 24 May 2019 18:13:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qNey=TY=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hUEgk-00077Y-KS
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 18:13:06 +0000
X-Inumbo-ID: 929f0f4a-7e4f-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 929f0f4a-7e4f-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 18:13:04 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l26so7783107lfh.13
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2019 11:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Nma/HzubMSn9kAbioA18ofFMMXC6mknTfGYSIso2iDQ=;
 b=KBjAUgh2IV9CD4bvrOqZRxZv9Z1YK5jvuCZO8+zG/WtQXBGrCfirX6/dNKbZVXK0L/
 cE3YEc/fRrnYxR+fyKN37A/LQjz6G5HuqxbIZlXvxnInIeRXDECIESHUA+buJboLFSPP
 Xg4y7IR5PrNVj4IdNHcN9ehZww65xmSix5st5NhiCYmpaUdPgQvEedT9ERikvDB/DWm0
 8PlpQD9SFLMlgVt5/mmb86AqX/do1RsHFO3nNT4bbhDlx/hRt8lx2J+lKIbFXewkrZ0g
 kV0W1d8Dv1jdzji0XPBJ8dlJG/ZFCTkqafZl7WhlDHUuShL7z4/I513I8PuMwDy3hSIw
 s7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Nma/HzubMSn9kAbioA18ofFMMXC6mknTfGYSIso2iDQ=;
 b=SIBBTUFsj98x7mrsfPBS37vYZdP5MkwIm5a2B9rzTnTpxFRx+zc6lq0IjZvQx8coRm
 9oXkxhW3HtOb1qENuGGrWfsGEtXG+uZ5tbpdveKByzhxFI6aIQSIBVm4eqvdaWJ/sziN
 /4ix6NoOwiSyK1WZcFcP56E7mHIcekVJgUNi1p3lHU7BAswcB4ektmCyNAjOQv0AzIch
 jgzH5x1cQtdvD7eTOV1Ase/0phe/iTJNPcVLRmAavMmwKFjKtMU+erEEVZf+xy+cXNnI
 r5QqQ+zuLfLS8tVVeGQVY310jVphyKs7l8RAXTl6rYN/QaCqZYRE2tKt/thLxQWYnsja
 XAyw==
X-Gm-Message-State: APjAAAWna5BbhQLTJBvm03IqAJIGKIm2yxzE7frXbfH0/bAeNpIYx36x
 PD39Lo4QSP3sbafckVIrrnB/3uv9PRM=
X-Google-Smtp-Source: APXvYqzm/Hn8Sa7cSSX9bBeH1g+DnikQLmbX8FjVExcRfcA34JTCJmCWgJmQp2506L8HoRFLG+bq/w==
X-Received: by 2002:a19:ca0e:: with SMTP id a14mr14546861lfg.3.1558721582888; 
 Fri, 24 May 2019 11:13:02 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m25sm629438ljj.92.2019.05.24.11.13.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 24 May 2019 11:13:01 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 24 May 2019 21:12:55 +0300
Message-Id: <1558721577-13958-2-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [PATCH v3] Introduce runstate area registration with
 phys address
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
Cc: Julien Grall <julien.grall@arm.com>, Andrii Anisov <andrii_anisov@epam.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkZvbGxvd2luZyBk
aXNjdXNzaW9uIFsxXSBpdCBpcyBpbnRyb2R1Y2VkIGFuZCBpbXBsZW1lbnRlZCBhIHJ1bnN0YXRl
CnJlZ2lzdHJhdGlvbiBpbnRlcmZhY2Ugd2hpY2ggdXNlcyBndWVzdCdzIHBoeXMgYWRkcmVzcyBp
bnN0ZWFkIG9mIGEgdmlydHVhbCBvbmUuClRoZSBuZXcgaHlwZXJjYWxsIGVtcGxveWVzIHRoZSBz
YW1lIGRhdGEgc3RydWN0dXJlcyBhcyBhIHByZWRlY2Vzc29yLCBidXQKZXhwZWN0cyB0aGUgdmNw
dV9ydW5zdGF0ZV9pbmZvIHN0cnVjdHVyZSB0byBub3QgY3Jvc3MgYSBwYWdlIGJvdW5kYXJ5LgpU
aGUgaW50ZXJmYWNlIGlzIGltcGxlbWVudGVkIGluIGEgd2F5IHZjcHVfcnVuc3RhdGVfaW5mbyBz
dHJ1Y3R1cmUgaXMgbWFwcGVkIHRvCnRoZSBoeXBlcnZpc29yIG9uIHRoZSBoeXBlcmNhbGwgcHJv
Y2Vzc2luZyBhbmQgaXMgZGlyZWN0bHkgYWNjZXNzZWQgZHVyaW5nIGl0cwp1cGRhdGVzLiBUaGlz
IHJ1bnN0YXRlIGFyZWEgbWFwcGluZyBmb2xsb3dzIHZjcHVfaW5mbyBzdHJ1Y3R1cmUgcmVnaXN0
cmF0aW9uLgoKUGVybWFuZW50IG1hcHBpbmcgb2YgcnVuc3RhdGUgYXJlYSB3b3VsZCBjb25zdW1l
IHZtYXAgYXJlYSBvbiBhcm0zMiB3aGF0IGlzCmxpbWl0ZWQgdG8gMUcuIFRob3VnaCBpdCBtaWdo
dCBiZSBPSyBiZWNhdXNlIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGluY3JlYXNlIAp0aGUgQVJN
MzIgdmlydHVhbCBhZGRyZXNzIGFyZWEgYnkgcmV3b3JraW5nIHRoZSBhZGRyZXNzIHNwYWNlLiAK
ClRoZSBzZXJpZXMgaXMgdGVzdGVkIGZvciBBUk02NC4gQnVpbGQgdGVzdGVkIGZvciB4ODYuIEkn
ZCBhcHByZWNpYXRlIGlmIHNvbWVvbmUKY291bGQgY2hlY2sgaXQgd2l0aCB4ODYuClRoZSBMaW51
eCBrZXJuZWwgcGF0Y2ggaXMgaGVyZSBbMl0uIFRob3VnaCBpdCBpcyBmb3IgNC4xNC4gSXQgaXMg
bm90IHN0aWxsCmNvbnZpbmNlZCB0aGUgYWJzb2x1dGUgY29ycmVjdG5lc3Mgb2YgdGhhdCBwYXRj
aCwgeWV0IHRoaXMgc2hvdWxkIGJlIGJldHRlcgphbGlnbmVkIHdpdGggbGludXggY29tbXVuaXR5
LgoKQ2hhbmdlcyBpbjoKCiAgdjM6IFRoaXMgdmVyc2lvbiBhZ2FpbiBpbXBsZW1lbnRzIHJ1bnN0
YXRlIG1hcHBpbmcgb24gaW5pdCBhcHByb2FjaC4KICAgICAgUGF0Y2hlcyBhcmUgc3F1YXNoZWQg
YW5kIHJlZmFjdG9yZWQgaW4gb3JkZXIgdG8gbm90IGFsbG93IHZpcnQgYW5kIHBoeXMKICAgICAg
aW50ZXJmYWNlcyBmdW5jdGlvbiBzaW11bHRhbmVvdXNseSBidXQgcmVwbGFjZSBvbmUgYW5vdGhl
ciBvbiBpbml0LgogICAgICBJbiBvcmRlciB0byBtZWFzdXJlIHBlcmZvcm1hbmNlIGltcGFjdCBv
ZiBwZXJtYW5lbnQgbWFwcGluZyB2cyBtYXBwaW5nIG9uCiAgICAgIGFjY2VzcyB0aGVyZSB3cml0
dGVuIHR3byBSRkMgcGF0Y2hlcyB3aGljaCBmb2xsb3cgbWFwcGluZyBvbiBhY2Nlc3MKICAgICAg
YXBwcm9hY2ggd2l0aCB0aGUgbGl0dGxlIGRpZmZlcmVuY2U6IAogICAgICAgLSBSRkMgMSAtIHVz
aW5nIGNvcHlfdG9fZ3Vlc3RfcGh5c19mbHVzaF9kY2FjaGUoKSBmb3IgZWFjaCBhY2Nlc3MgdG8K
ICAgICAgICAgcnVuc3RhdGUgYXJlYS4KICAgICAgIC0gUkZDIDIgLSBtYXBwaW5nIHJ1bnN0YXRl
IGFyZWEgYmVmb3JlIGFsbCB1cGRhdGUgbWFuaXB1bGF0aW9ucyBhbmQgdW5tYXAKICAgICAgICAg
YWZ0ZXIuCgogICAgICBSRkMgcGF0Y2hlcyB3ZXJlIGltcGxlbWVudGVkIGZvciBBUk0gb25seSwg
YmVjYXVzZSBwZXJmb3JtYW5jZSBtZWFzdXJlbWVudHMKICAgICAgd2VyZSBkb25lIG9uIEFSTTY0
IG1hY2hpbmUuCgogICAgICBUaGVyZSB3ZXJlIG1hZGUgcGVyZm9ybWFuY2UgbWVhc3VyZW1lbnRz
IG9mIGFwcHJvYWNoZXMgKHJ1bnN0YXRlIG1hcHBlZCBvbgogICAgICBhY2Nlc3MgdnMgbWFwcGVk
IG9uIHJlZ2lzdHJhdGlvbikuIFRoZSB0ZXN0IHNldHVwcyBhcmUgYXMgZm9sbG93aW5nOgogICAg
IAogICAgICBUaGluIERvbTAgKExpbnV4IHdpdGggaW50aXJhbWZzKSB3aXRoIERvbUQgcnVubmlu
ZyByaWNoIFlvY3RvIExpbnV4LiBJbgogICAgICBEb21EIDNkIGJlbmNobWFyayBudW1iZXJzIGFy
ZSBjb21wYXJlZC4gVGhlIGJlbmNobWFyayBpcyBHbE1hcmsyLiBHTE1hcmsyCiAgICAgIGlzIHJh
biB3aXRoIGRpZmZlcmVudCByZXNvbHV0aW9ucyBpbiBvcmRlciB0byBlbWl0IGRpZmZlcmVudCBp
cnEgbG9hZCwgCiAgICAgIHdoZXJlIDMyMHgyNDAgZW1pdHMgaGlnaCBJUlEgbG9hZCwgYnV0IDE5
MjB4MTA4MCBlbWl0cyBsb3cgaXJxIGxvYWQuCiAgICAgIFNlcGFyYXRlbHkgdGVzdGVkIGJha2lu
ZyBEb21EIGJlbmNobWFyayBydW4gd2l0aCBwcmltaXRpdmUgRG9tMCBDUFUgYnVybgogICAgICAo
ZGQpLCBpbiBvcmRlciB0byBzdGltdWxhdGUgVkNQVShkWCktPlZDUFUoZFkpIHN3aXRjaGVzIHJh
dGhlciB0aGFuCiAgICAgIFZDUFUoZFgpLT5pZGxlLT5WQ1BVKGRYKS4KICAgICAgd2l0aCBmb2xs
b3dpbmcgcmVzdWx0czoKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXBwZWQgICAgICAg
ICBtYXBwZWQgICAgICAgICBtYXBwZWQKICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9uIGlu
aXQgICAgICAgIG9uIGFjY2VzcyAgICAgIG9uIHVwZGF0ZQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUkZDIDEgICAgICAgICAgUkZDIDIKICAgICAgR0xNYXJrMiAz
MjB4MjQwICAgICAgIDI5MDYgICAgICAgICAgIDI4NTYgKC0yJSkgICAgIDI5MDMgKDApCiAgICAg
ICAgICArRG9tMCBDUFVCdXJuICAgICAyMTY2ICAgICAgICAgICAyMTA2ICgtMyUpICAgICAyMTM0
ICgxJSkKICAgICAgR0xNYXJrMiA4MDB4NjAwICAgICAgIDIzOTYgICAgICAgICAgIDIzNjcgKC0x
JSkgICAgIDIzOTMgKDAlKQogICAgICAgICAgK0RvbTAgQ1BVQnVybiAgICAgMTk1OCAgICAgICAg
ICAgMTkxMSAoLTIlKSAgICAgMTk0MiAoLTElKQogICAgICBHTE1hcmsyIDE5MjB4MTA4MCAgICAg
OTM5ICAgICAgICAgICAgOTM2ICAoMCUpICAgICAgOTM1ICAoMCUpCiAgICAgICAgICArRG9tMCBD
UFVCdXJuICAgICA5MDkgICAgICAgICAgICA5MDEgICgtMSUpICAgICA5MDcgICgwJSkKCiAgICAg
IEFsc28gaXQgd2FzIGNoZWNrZWQgSVJRIGxhdGVuY3kgZGlmZmVyZW5jZSB1c2luZyBUQk0gaW4g
YSBzZXR1cCBzaW1pbGFyIHRvCiAgICAgIFs1XS4gUGxlYXNlIG5vdGUgdGhhdCB0aGUgSVJRIHJh
dGUgaXMgb25lIGluIDMwIHNlY29uZHMsIGFuZCBvbmx5CiAgICAgIFZDUFUtPmlkbGUtPlZDUFUg
dXNlLWNhc2UgaXMgY29uc2lkZXJlZC4gV2l0aCBmb2xsb3dpbmcgcmVzdWx0cyAoaW4gbnMsCiAg
ICAgIHRoZSB0aW1lciBncmFudWxhcml0eSAxMjBucyk6CgogICAgICBtYXBwZWQgb24gaW5pdDoK
ICAgICAgICAgIG1heD0xMDA4MCB3YXJtX21heD04NzYwIG1pbj02NjAwIGF2Zz02Njk5CiAgICAg
IG1hcHBlZCBvbiB1cGRhdGUgKFJGQzEpOgogICAgICAgICAgbWF4PTEwNDQwIHdhcm1fbWF4PTc1
NjAgbWluPTczMjAgYXZnPTc0MTkKICAgICAgbWFwcGVkIG9uIGFjY2VzcyAoUkZDMikKICAgICAg
ICAgIG1heD0xMTUyMCB3YXJtX21heD03OTIwIG1pbj03MjAwIGF2Zz03Mjk5CgogIHYyOiBJdCB3
YXMgcmVjb25zaWRlcmVkIHRoZSBuZXcgcnVuc3RhdGUgaW50ZXJmYWNlIGltcGxlbWVudGF0aW9u
LiBUaGUgbmV3IAogICAgICBpbnRlcmZhY2UgaXMgbWFkZSBpbmRlcGVuZGVudCBvZiB0aGUgb2xk
IG9uZS4gRG8gbm90IHNoYXJlIHJ1bnN0YXRlX2FyZWEKICAgICAgZmllbGQsIGFuZCBjb25zZXF1
ZW50bHkgYXZvaWQgZXhjZXNzaXZlIGNvbmN1cnJlbmN5IHdpdGggdGhlIG9sZCBydW5zdGF0ZQog
ICAgICBpbnRlcmZhY2UgdXNhZ2UuCiAgICAgIEludHJvZHVjZWQgbG9ja3MgaW4gb3JkZXIgdG8g
cmVzb2x2ZSBwb3NzaWJsZSBjb25jdXJyZW5jeSBiZXR3ZWVuIHJ1bnN0YXRlCiAgICAgIGFyZWEg
cmVnaXN0cmF0aW9uIGFuZCB1c2FnZS4gCiAgICAgIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIEph
biBCZXVsaWNoIFszXVs0XSBhYm91dCBjb2Rpbmcgc3R5bGUgbml0cy4gVGhvdWdoCiAgICAgIHNv
bWUgb2YgdGhlbSBiZWNvbWUgb2Jzb2xldGUgd2l0aCByZWZhY3RvcmluZyBhbmQgZmV3IGFyZSBw
aWNrZWQgaW50byB0aGlzCiAgICAgIHRocmVhZCBmb3IgZnVydGhlciBkaXNjdXNzaW9uLgoKICAg
ICAgVGhlcmUgd2VyZSBtYWRlIHBlcmZvcm1hbmNlIG1lYXN1cmVtZW50cyBvZiBhcHByb2FjaGVz
IChydW5zdGF0ZSBtYXBwZWQgb24KICAgICAgYWNjZXNzIHZzIG1hcHBlZCBvbiByZWdpc3RyYXRp
b24pLiBUaGUgdGVzdCBzZXR1cHMgYXJlIGFzIGZvbGxvd2luZzoKICAgICAKICAgICAgVGhpbiBE
b20wIChMaW51eCB3aXRoIGludGlyYW1mcykgd2l0aCBEb21EIHJ1bm5pbmcgcmljaCBZb2N0byBM
aW51eC4gSW4KICAgICAgRG9tRCAzZCBiZW5jaG1hcmsgbnVtYmVycyBhcmUgY29tcGFyZWQuIFRo
ZSBiZW5jaG1hcmsgaXMgR2xNYXJrMi4gR0xNYXJrMgogICAgICBpcyByYW4gd2l0aCBkaWZmZXJl
bnQgcmVzb2x1dGlvbnMgaW4gb3JkZXIgdG8gZW1pdCBkaWZmZXJlbnQgaXJxIGxvYWQsIAogICAg
ICB3aGVyZSAzMjB4MjQwIGVtaXRzIGhpZ2ggSVJRIGxvYWQsIGJ1dCAxOTIweDEwODAgZW1pdHMg
bG93IGlycSBsb2FkLgogICAgICBTZXBhcmF0ZWx5IHRlc3RlZCBiYWtpbmcgRG9tRCBiZW5jaG1h
cmsgcnVuIHdpdGggcHJpbWl0aXZlIERvbTAgQ1BVIGJ1cm4KICAgICAgKGRkKSwgaW4gb3JkZXIg
dG8gc3RpbXVsYXRlIFZDUFUoZFgpLT5WQ1BVKGRZKSBzd2l0Y2hlcyByYXRoZXIgdGhhbgogICAg
ICBWQ1BVKGRYKS0+aWRsZS0+VkNQVShkWCkuCiAgICAgIHdpdGggZm9sbG93aW5nIHJlc3VsdHM6
CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFwcGVkICAgICAgICAgICAgICAgbWFwcGVk
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbiBhY2Nlc3MgICAgICAgICAgICBvbiBpbml0
CiAgICAgIEdMTWFyazIgMzIweDI0MCAgICAgICAyODUyICAgICAgICAgICAgICAgICAyODc3ICAg
ICAgICAgICswLjglCiAgICAgICAgICArRG9tMCBDUFVCdXJuICAgICAyMDg4ICAgICAgICAgICAg
ICAgICAyMDk0ICAgICAgICAgICswLjIlCiAgICAgIEdMTWFyazIgODAweDYwMCAgICAgICAyMzY4
ICAgICAgICAgICAgICAgICAyMzc1ICAgICAgICAgICswLjMlCiAgICAgICAgICArRG9tMCBDUFVC
dXJuICAgICAxODY4ICAgICAgICAgICAgICAgICAxOTIxICAgICAgICAgICsyLjglCiAgICAgIEdM
TWFyazIgMTkyMHgxMDgwICAgICA5MzEgICAgICAgICAgICAgICAgICA5MzEgICAgICAgICAgICAw
JQogICAgICAgICAgK0RvbTAgQ1BVQnVybiAgICAgODkyICAgICAgICAgICAgICAgICAgODk0ICAg
ICAgICAgICArMC4yJQoKICAgICAgUGxlYXNlIG5vdGUgdGhhdCAibWFwcGVkIG9uIGFjY2VzcyIg
bWVhbnMgdXNpbmcgdGhlIG9sZCBydW5zdGF0ZQogICAgICByZWdpc3RlcmluZyBpbnRlcmZhY2Uu
IEFuZCBydW5zdGF0ZSB1cGRhdGUgaW4gdGhpcyBjYXNlIHN0aWxsIG9mdGVuIGZhaWxzCiAgICAg
IHRvIG1hcCBydW5zdGF0ZSBhcmVhIGxpa2UgWzVdLCBkZXNwaXRlIHRoZSBmYWN0IHRoYXQgb3Vy
IExpbnV4IGtlcm5lbAogICAgICBkb2VzIG5vdCBoYXZlIEtQVEkgZW5hYmxlZC4gU28gcnVuc3Rh
dGUgYXJlYSB1cGRhdGUsIGluIHRoaXMgY2FzZSwgaXMKICAgICAgcmVhbGx5IHNob3J0ZW5lZC4K
CgogICAgICBBbHNvIGl0IHdhcyBjaGVja2VkIElSUSBsYXRlbmN5IGRpZmZlcmVuY2UgdXNpbmcg
VEJNIGluIGEgc2V0dXAgc2ltaWxhciB0bwogICAgICBbNV0uIFBsZWFzZSBub3RlIHRoYXQgdGhl
IElSUSByYXRlIGlzIG9uZSBpbiAzMCBzZWNvbmRzLCBhbmQgb25seQogICAgICBWQ1BVLT5pZGxl
LT5WQ1BVIHVzZS1jYXNlIGlzIGNvbnNpZGVyZWQuIFdpdGggZm9sbG93aW5nIHJlc3VsdHMgKGlu
IG5zLAogICAgICB0aGUgdGltZXIgZ3JhbnVsYXJpdHkgMTIwbnMpOgoKICAgICAgbWFwcGVkIG9u
IGFjY2VzczoKICAgICAgICAgIG1heD05OTYwIHdhcm1fbWF4PTg2NDAgbWluPTcyMDAgYXZnPTc2
MjYKICAgICAgbWFwcGVkIG9uIGluaXQ6CiAgICAgICAgICBtYXg9OTQ4MCB3YXJtX21heD04NDAw
IG1pbj03MDgwIGF2Zz03MzQxCgogICAgICBVbmZvcnR1bmF0ZWx5IHRoZXJlIGFyZSBubyBjb25z
aXRlbnQgcmVzdWx0cyB5ZXQgZnJvbSBwcm9maWxpbmcgdXNpbmcKICAgICAgTGF1dGVyYmFjaCBQ
b3dlclRyYWNlLiBTdGlsbCBpbiBjb21tdW5pY2F0aW9uIHdpdGggdGhlIHRyYWNlciB2ZW5kb3Ig
aW4KICAgICAgb3JkZXIgdG8gc2V0dXAgdGhlIHByb3BlciBjb25maWd1cmF0aW9uLgoKCgpbMV0g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5
LTAyL21zZzAwNDE2Lmh0bWwKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9hYW5pc292L2xpbnV4L2Nv
bW1pdC9iYTM0ZDI3ODBmNTdlYTQzZjgxODEwY2Q2OTVhYWNlN2I1NWMwZjI5ClszXSBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDMvbXNn
MDA5MzYuaHRtbApbNF0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE5LTAzL21zZzAwOTM0Lmh0bWwKWzVdIGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wMS9tc2cwMjM2OS5odG1sCls2
XSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTgtMTIvbXNnMDIyOTcuaHRtbAoKCkFuZHJpaSBBbmlzb3YgKDEpOgogIHhlbjogaW50cm9kdWNl
IFZDUFVPUF9yZWdpc3Rlcl9ydW5zdGF0ZV9waHlzX21lbW9yeV9hcmVhIGh5cGVyY2FsbAoKIHhl
bi9hcmNoL2FybS9kb21haW4uYyAgICAgICAgfCAgNTggKysrKysrKysrKysrKysrKysrLS0tCiB4
ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgIHwgIDk5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L2RvbWFpbi5jIHwgIDE2ICsrKysrLQog
eGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICB8IDEyMSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvdmNwdS5oICAgIHwgIDE1
ICsrKysrKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICB8ICAyOCArKysrKysrLS0tCiA2
IGZpbGVzIGNoYW5nZWQsIDMwNiBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKCi0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

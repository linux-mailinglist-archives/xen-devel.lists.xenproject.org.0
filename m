Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768412CA69
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:36:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildOQ-0008TC-Gu; Sun, 29 Dec 2019 18:34:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildOP-0008Sd-3s
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:34:21 +0000
X-Inumbo-ID: c73e166e-2a69-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c73e166e-2a69-11ea-a1e1-bc764e2007e4;
 Sun, 29 Dec 2019 18:33:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u2so12582280wmc.3
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asb9o+xNQOO3u3ZzsBKwpRrK8IPM5jQNg7xWqM9F3KI=;
 b=JgLyZz0TTlhU4o9sVht7VWWxB4MwDi78qPrKGJnxkdr84WHBeGEzsRQZ3n2vC+enLl
 3A2yLT0aTPK8EUhUT1rer7u8iCyYG79xvZvq5DcoiRMsx7wAuYHbDyRJBmuaWcSIHdom
 TITyQMSlhqyECseyN4dbX3SJzK+leuMLzNKp9UiUAk0X3S6ptqBJ8wKZn6Q7XblVPnE1
 zHFWeZIh8IUZGvmtxNWj7ZH9NdEKr8U6MsPy1QQhmTnuinOBFgKbPl1QOUqEGttQUwkE
 hhsOPHNcKyFrlBsD6kdJ6G7BI30ftu5J75l40nyK0bD1eTX2PZZ+LibszBKLR2wns0yV
 KPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=asb9o+xNQOO3u3ZzsBKwpRrK8IPM5jQNg7xWqM9F3KI=;
 b=IefAebYaNMN58zBdYtUjXW8tVRfjNv4UO/G/sNqs9Tb5L+QqglaUvP/J89mS2Ftsiv
 9Drz753tf4FuXqVotXm0l/FcZqvs86zMmhh56rUTGG5Wt29edjmVqxFEuMDimDzKp7Y+
 fzGFGl9rIy9yoVdmUH98Yw4GYFSRbRbtTztt9bWvEfkl5SC5d4ulTL+G6IQP3lrV6ZtB
 jt3+SjjU5TN7BoZya6INrs2Ga+1ETzPHQnT4lbPTkFNTODKKDQfW98T1cUq5RcpIYxGy
 DSO9tL/lm3VbYmpFdZ1/c9IsNrLCxvSUjjGI0pmGxt1kNfY7ZsITXiRXhtkWSaxDzFf7
 NqVg==
X-Gm-Message-State: APjAAAWWAlIZALjFxnYUfknEFAaqIS9WzHtttg4xwxIIfrvUF6wrL3c+
 0ULdWzyY8TrO0knPqQs+t8eYuIUOm74=
X-Google-Smtp-Source: APXvYqxK16Szy+NwFppVU3dxWcnXH2X9+bWRzo14fFbTnWTN3tHw1swQbWvNuMmBQJqcKyb4HC023w==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr29792019wmh.94.1577644438582; 
 Sun, 29 Dec 2019 10:33:58 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:33:58 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:38 +0000
Message-Id: <20191229183341.14877-6-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183341.14877-1-liuwe@microsoft.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/8] x86/hyperv: provide Hyper-V hypercall
 functions
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgZnVuY3Rpb25zIHdpbGwgYmUgdXNlZCBsYXRlciB0byBtYWtlIGh5cGVyY2FsbHMgdG8g
SHlwZXItVi4KCkkgY291bGRuJ3QgZmluZCByZWZlcmVuY2UgaW4gVExGUyB0aGF0IEh5cGVyLVYg
Y2xvYmJlcnMgZmxhZ3MgYW5kCnI5LXIxMSwgYnV0IExpbnV4J3MgY29tbWl0IG1lc3NhZ2Ugc2F5
cyBpdCBkb2VzLiBFcnIgb24gdGhlIHNhZmUgc2lkZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBl
cnYtaHlwZXJjYWxsLmggfCAxMDUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDEwNSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcnYtaHlwZXJjYWxsLmgKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydi1oeXBlcmNhbGwuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
aHlwZXJ2LWh5cGVyY2FsbC5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjYwMTcxMjNiZTUKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVydi1oeXBlcmNhbGwuaApAQCAtMCwwICsxLDEwNSBAQAorLyoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgorICogYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaHlwZXJjYWxsLmgKKyAqCisgKiBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisg
KiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMKKyAqIExpY2Vuc2UsIHZlcnNpb24gMiwgYXMgcHVibGlzaGVkIGJ5IHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiBidXQgV0lUSE9VVCBB
TlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogTUVS
Q0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRo
ZSBHTlUKKyAqIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisg
KiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMKKyAqIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRw
Oi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqCisgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWlj
cm9zb2Z0LgorICovCisKKyNpZm5kZWYgX19YODZfSFlQRVJWX0hZUEVSQ0FMTF9IX18KKyNkZWZp
bmUgX19YODZfSFlQRVJWX0hZUEVSQ0FMTF9IX18KKworI2luY2x1ZGUgPHhlbi90eXBlcy5oPgor
CisjaW5jbHVkZSA8YXNtL2FzbV9kZWZucy5oPgorI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYt
dGxmcy5oPgorI2luY2x1ZGUgPGFzbS9wYWdlLmg+CisKK2V4dGVybiB2b2lkICpodl9oeXBlcmNh
bGw7CisKK3N0YXRpYyBpbmxpbmUgdWludDY0X3QgaHZfZG9faHlwZXJjYWxsKHVpbnQ2NF90IGNv
bnRyb2wsIHBhZGRyX3QgaW5wdXQsIHBhZGRyX3Qgb3V0cHV0KQoreworICAgIHVpbnQ2NF90IHN0
YXR1czsKKworICAgIGlmICggIWh2X2h5cGVyY2FsbCApCisgICAgICAgIHJldHVybiB+MFVMTDsK
KworICAgIGFzbSB2b2xhdGlsZSAoIm1vdiAlW291dHB1dF0sICUlcjhcbiIKKyAgICAgICAgICAg
ICAgICAgICJjYWxsIColW2h5cGVyY2FsbF9wYWdlXSIKKyAgICAgICAgICAgICAgICAgIDogIj1h
IiAoc3RhdHVzKSwgIitjIiAoY29udHJvbCksCisgICAgICAgICAgICAgICAgICAgICIrZCIgKGlu
cHV0KSBBU01fQ0FMTF9DT05TVFJBSU5UCisgICAgICAgICAgICAgICAgICA6IFtvdXRwdXRdICJy
bSIgKG91dHB1dCksCisgICAgICAgICAgICAgICAgICAgIFtoeXBlcmNhbGxfcGFnZV0gIm0iICho
dl9oeXBlcmNhbGwpCisgICAgICAgICAgICAgICAgICA6ICJjYyIsICJtZW1vcnkiLCAicjgiLCAi
cjkiLCAicjEwIiwgInIxMSIpOworCisgICAgcmV0dXJuIHN0YXR1czsKK30KKworc3RhdGljIGlu
bGluZSB1aW50NjRfdCBodl9kb19mYXN0X2h5cGVyY2FsbCh1aW50MTZfdCBjb2RlLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBpbnB1dDEsIHVp
bnQ2NF90IGlucHV0MikKK3sKKyAgICB1aW50NjRfdCBzdGF0dXM7CisgICAgdWludDY0X3QgY29u
dHJvbCA9ICh1aW50NjRfdCljb2RlIHwgSFZfSFlQRVJDQUxMX0ZBU1RfQklUOworCisgICAgaWYg
KCAhaHZfaHlwZXJjYWxsICkKKyAgICAgICAgcmV0dXJuIH4wVUxMOworCisgICAgYXNtIHZvbGF0
aWxlICgibW92ICVbaW5wdXQyXSwgJSVyOFxuIgorICAgICAgICAgICAgICAgICAgImNhbGwgKiVb
aHlwZXJjYWxsX3BhZ2VdIgorICAgICAgICAgICAgICAgICAgOiAiPWEiIChzdGF0dXMpLCAiK2Mi
IChjb250cm9sKSwKKyAgICAgICAgICAgICAgICAgICAgIitkIiAoaW5wdXQxKSBBU01fQ0FMTF9D
T05TVFJBSU5UCisgICAgICAgICAgICAgICAgICA6IFtpbnB1dDJdICJybSIgKGlucHV0MiksCisg
ICAgICAgICAgICAgICAgICAgIFtoeXBlcmNhbGxfcGFnZV0gIm0iIChodl9oeXBlcmNhbGwpCisg
ICAgICAgICAgICAgICAgICA6ICJjYyIsICJyOCIsICJyOSIsICJyMTAiLCAicjExIik7CisKKyAg
ICByZXR1cm4gc3RhdHVzOworfQorCitzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX3JlcF9o
eXBlcmNhbGwodWludDE2X3QgY29kZSwgdWludDE2X3QgcmVwX2NvdW50LAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZhcmhlYWRfc2l6ZSwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IGlucHV0LCBw
YWRkcl90IG91dHB1dCkKK3sKKyAgICB1aW50NjRfdCBjb250cm9sID0gY29kZTsKKyAgICB1aW50
NjRfdCBzdGF0dXM7CisgICAgdWludDE2X3QgcmVwX2NvbXA7CisKKyAgICBjb250cm9sIHw9ICh1
aW50NjRfdCl2YXJoZWFkX3NpemUgPDwgSFZfSFlQRVJDQUxMX1ZBUkhFQURfT0ZGU0VUOworICAg
IGNvbnRyb2wgfD0gKHVpbnQ2NF90KXJlcF9jb3VudCA8PCBIVl9IWVBFUkNBTExfUkVQX0NPTVBf
T0ZGU0VUOworCisgICAgZG8geworICAgICAgICBzdGF0dXMgPSBodl9kb19oeXBlcmNhbGwoY29u
dHJvbCwgaW5wdXQsIG91dHB1dCk7CisgICAgICAgIGlmICggKHN0YXR1cyAmIEhWX0hZUEVSQ0FM
TF9SRVNVTFRfTUFTSykgIT0gSFZfU1RBVFVTX1NVQ0NFU1MgKQorICAgICAgICAgICAgYnJlYWs7
CisKKyAgICAgICAgcmVwX2NvbXAgPSAoc3RhdHVzICYgSFZfSFlQRVJDQUxMX1JFUF9DT01QX01B
U0spID4+CisgICAgICAgICAgICBIVl9IWVBFUkNBTExfUkVQX0NPTVBfT0ZGU0VUOworCisgICAg
ICAgIGNvbnRyb2wgJj0gfkhWX0hZUEVSQ0FMTF9SRVBfU1RBUlRfTUFTSzsKKyAgICAgICAgY29u
dHJvbCB8PSAodWludDY0X3QpcmVwX2NvbXAgPDwgSFZfSFlQRVJDQUxMX1JFUF9DT01QX09GRlNF
VDsKKworICAgIH0gd2hpbGUgKCByZXBfY29tcCA8IHJlcF9jb3VudCApOworCisgICAgcmV0dXJu
IHN0YXR1czsKK30KKworI2VuZGlmIC8qIF9fWDg2X0hZUEVSVl9IWVBFUkNBTExfSF9fICovCisK
Ky8qCisgKiBMb2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJC
U0QiCisgKiBjLWJhc2ljLW9mZnNldDogNAorICogdGFiLXdpZHRoOiA0CisgKiBpbmRlbnQtdGFi
cy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAqLwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

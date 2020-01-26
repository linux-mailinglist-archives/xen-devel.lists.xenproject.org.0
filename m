Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDA149D28
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2020 23:09:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivq2T-0002LR-V9; Sun, 26 Jan 2020 22:05:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8F/7=3P=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1ivq2S-0002LJ-8u
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2020 22:05:52 +0000
X-Inumbo-ID: 03e717d0-4088-11ea-aecd-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03e717d0-4088-11ea-aecd-bc764e2007e4;
 Sun, 26 Jan 2020 22:05:51 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n11so7891458iom.9
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2020 14:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=rB9/aLh1IaUtBGs4hD896zb0OiE0+oy+5Uq7OSrf0zw=;
 b=QjUBtswySZijPK4DXjqgR540RUI1dhJrESzIQEkReHcSoMAU2sm0+PHWNMKH/sVECL
 wVa88q5A5jSCNjQMeV+/jlUulKg0EzzAAXTzdJv8aj+IO7+6vaO5fjE/GSWpXoiWkvOO
 ratbjUMZe/SwurLNuJTphkhrGiMRb8S8070ib+31S5dYtaQe0RIvmJFz/CZwoX4Yiwuc
 XNDLG54oQqSn2tuyoq+A7R9X5JtDp2BdpfeF9mKtjBdpABjTG92HCf4jc5JpkX2i9vQX
 xKM68qI9gMpyWtuxtVe6WLKBzpSyddVLyEuSwofm4s1VyfLGNqk3258vfN6jOv0PkwKw
 bl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=rB9/aLh1IaUtBGs4hD896zb0OiE0+oy+5Uq7OSrf0zw=;
 b=GQEvNfkkTVnWY/0x0iGn2xQOX/inJsbAHFTaKqVNG8Q3PwOAsyf9O6D8z3l0UjD66o
 k2pvn91pE5v5Yw/JQckUffCCA0RCj3NjargdhV6Bc5XQhXyMopBM6hiR1yTfarFpsFsv
 G4aZt1tIZIdw83J9iE/U+RJ6eUrKq+20M0ofh0l7vxhKxRjwYnLDOLBg/5E3AeOENdqU
 Eja+YdMAe1zyVNWhhSkfkjEffds4Ci5wm2HO6zyELDGLyjFzVGFeLbyzqSXW9mvINXbG
 fwVIMb9JXDLcbF65CScDYUOMECpYly58KwAXjP3peYieWaX6n+uaT1WZEHZYmLkDluTx
 vgug==
X-Gm-Message-State: APjAAAUHmbqk5wCQUBjWaBS4VNRyGEIfLbZsldwKvsvQqXwFa1Mik/03
 abZCZXvIFL2nNeU4xI//raw=
X-Google-Smtp-Source: APXvYqyfL7RFyG9Dkz8EQQqOm3d4XqLtnPVc52pTCwcEemG71OxhUR+ob9/xJKZDIq9/iH2IsU9apg==
X-Received: by 2002:a02:7a59:: with SMTP id z25mr11353038jad.90.1580076351026; 
 Sun, 26 Jan 2020 14:05:51 -0800 (PST)
Received: from [100.64.72.6] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id t2sm3786011ild.34.2020.01.26.14.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2020 14:05:50 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 26 Jan 2020 17:05:49 -0500
Message-Id: <66250848-8C98-4A7E-BA33-986A892BFD31@gmail.com>
References: <20200121084330.18309-1-jgross@suse.com>
In-Reply-To: <20200121084330.18309-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: iPad Mail (17C54)
Subject: Re: [Xen-devel] [PATCH v3 0/9] Add hypervisor sysfs-like support
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
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org, Lars Kurth <lars.kurth@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gSmFuIDIxLCAyMDIwLCBhdCAwMzo0NSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToKPiAKPiDvu79PbiB0aGUgMjAxOSBYZW4gZGV2ZWxvcGVyIHN1bW1pdCB0aGVyZSB3
YXMgYWdyZWVtZW50IHRoYXQgdGhlIFhlbgo+IGh5cGVydmlzb3Igc2hvdWxkIGdhaW4gc3VwcG9y
dCBmb3IgYSBoaWVyYXJjaGljYWwgbmFtZS12YWx1ZSBzdG9yZQo+IHNpbWlsYXIgdG8gdGhlIExp
bnV4IGtlcm5lbCdzIHN5c2ZzLgoKSXMgdGhlcmUgYSBzaG9ydCBzdW1tYXJ5IG9mIHRoZSBtb3N0
IHJlY2VudCB1c2UgY2FzZXMgZm9yIHRoaXMgZmVhdHVyZSBhbmQgZXhwZWN0ZWQgaW50ZXJhY3Rp
b25zIHdpdGggb3RoZXIgWGVuIGZlYXR1cmVzIChlLmcuIFBhbm9wdGljb24gWGVuLCBzZWN1cml0
eSBjb250cm9scyBvbiBpbmZvcm1hdGlvbiB0aGF0IGlzIHZpc2libGUgdG8gZ3Vlc3RzLCBlLmcu
IHJlY2VudCBkaXNjdXNzaW9uIG9uIHZlcnNpb24gbnVtYmVyIGhpZGluZykuIFRoaXMgd291bGQg
aW1wYWN0IG1hbnkgc3Vic3lzdGVtcy4KClByZXN1bWFibHkgS2NvbmZpZyBjb3VsZCBlbmFibGUv
ZGlzYWJsZSB0aGlzIG9wdGlvbmFsIGZlYXR1cmUgYW5kIGFsbCBkZXBlbmRlbmNpZXMsIGFuZCB0
aGUgWGVuIHRvb2xzdGFjayB3b3VsZCBjb250aW51ZSB0byBmdW5jdGlvbiBub3JtYWxseSBpbiBp
dHMgYWJzZW5jZS4KClJpY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

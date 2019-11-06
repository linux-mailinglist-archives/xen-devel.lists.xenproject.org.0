Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00415F14AA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 12:10:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSJAF-00080G-4m; Wed, 06 Nov 2019 11:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOxY=Y6=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iSJAD-000809-MW
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 11:07:49 +0000
X-Inumbo-ID: aa921f32-0085-11ea-a1a9-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa921f32-0085-11ea-a1a9-12813bfff9fa;
 Wed, 06 Nov 2019 11:07:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a11so25209588wra.6
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 03:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ro1HHSDiTAIKJLQyo76CorU3J4kqZuTh67GHHeYuJ1Y=;
 b=JSI8EJBr8Im+Ksxy0sT6sFAqTIEour6A851uJdM3pukfufedS5u9tC8RA8sOiGdnHz
 jMlX1HdLCd0J+pCS5xQtg2oPPBd8xEDvtbOcc3c1uxKLluNDzVGv0ghlVzN0b8fNIIoJ
 XDddm4TJVus/reuvjYXsxptnXXHDw3v1dpOoCOKdFBElD2gNBfF/7D96PGG+bU51733C
 Qsj1/HwbldzCHdByZI/gNq6btTxjvQ/fmUYDxXbjt42c3wR1oVmqk72y7mtkrO8MzDGw
 SdAruEDDRIIek3zIsMcQ7ZtwMV/XEZVWtPzkfoiUBAzd+tA3c7lytvXibbriPUaZbnZo
 gF8A==
X-Gm-Message-State: APjAAAV8MbHrcktyepSUmo3agybxpAs0fFRtBajRV6hk7cRVU6AWyOJ/
 fzbU4XqLdetY/xk+qbzdGwA=
X-Google-Smtp-Source: APXvYqycQc0Xac7bWXO5tbP5rBWGj0KAF28ABpkuKTNJu1mP3QN+SVUmGFeymo5Fj9vLfpTm+rbhsQ==
X-Received: by 2002:adf:8123:: with SMTP id 32mr2201096wrm.300.1573038467739; 
 Wed, 06 Nov 2019 03:07:47 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id m16sm2269672wml.47.2019.11.06.03.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 03:07:47 -0800 (PST)
Date: Wed, 6 Nov 2019 11:07:45 +0000
From: Wei Liu <wl@xen.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <20191106110745.6jdbhrefdnibj5hc@debian>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-2-git-send-email-andrii.anisov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573031953-12894-2-git-send-email-andrii.anisov@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC 1/7] xen: clang: Support correctly
 cross-compile
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTE6MTk6MDdBTSArMDIwMCwgQW5kcmlpIEFuaXNvdiB3
cm90ZToKPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IENs
YW5nIHVzZXMgIi10YXJnZXQiIG9wdGlvbiBmb3IgY3Jvc3MtY29tcGlsYXRpb24uCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAg
Y29uZmlnL1N0ZEdOVS5tayB8IDkgKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZy9TdGRHTlUu
bWsgYi9jb25maWcvU3RkR05VLm1rCj4gaW5kZXggMDM5Mjc0ZS4uNDhjNTBiNSAxMDA2NDQKPiAt
LS0gYS9jb25maWcvU3RkR05VLm1rCj4gKysrIGIvY29uZmlnL1N0ZEdOVS5tawo+IEBAIC0xLDgg
KzEsMTMgQEAKPiAgQVMgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlhcwo+ICBMRCAgICAgICAg
ID0gJChDUk9TU19DT01QSUxFKWxkCj4gIGlmZXEgKCQoY2xhbmcpLHkpCj4gLUNDICAgICAgICAg
PSAkKENST1NTX0NPTVBJTEUpY2xhbmcKPiAtQ1hYICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlj
bGFuZysrCj4gK2lmbmVxICgkKENST1NTX0NPTVBJTEUpLCkKPiArQ0MgICAgICAgICA9IGNsYW5n
IC10YXJnZXQgJChDUk9TU19DT01QSUxFOi09KQo+ICtDWFggICAgICAgID0gY2xhbmcrKyAtdGFy
Z2V0ICQoQ1JPU1NfQ09NUElMRTotPSkKPiArZWxzZQo+ICtDQyAgICAgICAgID0gY2xhbmcKPiAr
Q1hYICAgICAgICA9IGNsYW5nKysKPiArZW5kaWYKPiAgTERfTFRPICAgICA9ICQoQ1JPU1NfQ09N
UElMRSlsbHZtLWxkCgpEbyB5b3Ugbm90IG5lZWQgdG8gZml4IGxsdm0tbGQgdG9vPyBJIF90aGlu
a18gdGhlIHJlbGV2YW50IG9wdGlvbiBpcwotbWFyY2guCgpXZWkuCgo+ICBlbHNlCj4gIENDICAg
ICAgICAgPSAkKENST1NTX0NPTVBJTEUpZ2NjCj4gLS0gCj4gMi43LjQKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

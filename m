Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFAEC8A15
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 15:46:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFevg-00054j-V4; Wed, 02 Oct 2019 13:44:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uMoo=X3=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iFevf-00054X-UC
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 13:44:31 +0000
X-Inumbo-ID: c26e12a4-e51a-11e9-9717-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by localhost (Halon) with ESMTPS
 id c26e12a4-e51a-11e9-9717-12813bfff9fa;
 Wed, 02 Oct 2019 13:44:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v8so19766153wrt.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 06:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=pHygYKm+xasmUUk98SD+5hZcOO910V7+MRuID1DV96o=;
 b=BO4phmVIstfiJ0pvPBeeAw2LXndKkAHUyyKH+yeyJujlsyFBaY2+UtBJNc1hOvnBYQ
 yWnaGYDrR/WHMPiASxhT6t7YMyfKARnpDyYVcUVFeUB+lGMElNEZ4GBRMiVRXbHBSVJT
 0JvEAzVNByT+HmxEmbMiRCNsQeqKO2r5CT8ICSBB6+Tmd82C8plkEeskqOiacEGLaOEZ
 8EtNb/zbbBrRXPIV7ssI85HzYZOh2GQ1KELFgVpysFHHJBSboceZ026RXSH4S6AAspev
 ag1oWjr+goA983NrPET8BzwoFaJ5fSEYQJMwoFKACOPUCqJ/BmaDm7Dp6H60A3iT8pme
 owUQ==
X-Gm-Message-State: APjAAAX8SLHp2mRVR2iDkVVVhfamned+tHT9q8arKxX0XZDT9DlIyaQ4
 +6gGdDuNrVQw+b6rUfBeJtfb6jzq
X-Google-Smtp-Source: APXvYqxl4T5it8yZbqstj405z+iCNzeQ3zl4TS3tHQQgk62hSfmMWpW+s1US+UuOTRwO8HqfwK/bZQ==
X-Received: by 2002:a05:6000:43:: with SMTP id k3mr3071719wrx.84.1570023870291; 
 Wed, 02 Oct 2019 06:44:30 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id g24sm17874803wrb.35.2019.10.02.06.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 06:44:29 -0700 (PDT)
Date: Wed, 2 Oct 2019 14:44:28 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20191002134428.7wvv3qie3l77lwkg@debian>
References: <20191001152233.55491-1-roger.pau@citrix.com>
 <20191001152734.ttikfrtxk3jemlb5@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001152734.ttikfrtxk3jemlb5@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] libxl: wait for the ack when issuing
 power control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDU6Mjc6NTNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIE9jdCAwMSwgMjAxOSBhdCAwNToyMjozM1BNICswMjAwLCBSb2dl
ciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiAraW50IGxpYnhsX2RvbWFpbl9yZWJvb3QobGlieGxfY3R4
ICpjdHgsIHVpbnQzMl90IGRvbWlkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IGxpYnhsX2FzeW5jb3BfaG93ICphb19ob3cpCj4gPiAgewo+ID4gLSAgICBHQ19JTklUKGN0eCk7
Cj4gPiArICAgIEFPX0NSRUFURShjdHgsIGRvbWlkLCBhb19ob3cpOwo+ID4gKyAgICBsaWJ4bF9f
eHN3YWl0X3N0YXRlICpwdmNvbnRyb2w7Cj4gPiAgICAgIGludCByZXQ7Cj4gCj4gRm9yZ290IHRv
IGBzdGcgcmVmcmVzaGAgYmVmb3JlIHNlbmRpbmcgYW5kIHRoaXMgZGlkbid0IGdldCBjaGFuZ2Vk
IHRvCj4gcmMuIEkgY2FuIHNlbmQgYSBuZXcgdmVyc2lvbiBvciB0aGlzIGNhbiBiZSBmaXhlZCBv
biBjb21taXQgSSBndWVzcyBpZgo+IGV2ZXJ5dGhpbmcgZWxzZSBpcyBmaW5lLgoKRml4ZWQgYW5k
IHB1c2hlZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

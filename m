Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4B1596E3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:52:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Zf3-0003Y3-FG; Tue, 11 Feb 2020 17:49:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPZQ=37=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1Zf1-0003Xx-Qj
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 17:49:23 +0000
X-Inumbo-ID: d63554ac-4cf6-11ea-b5ff-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d63554ac-4cf6-11ea-b5ff-12813bfff9fa;
 Tue, 11 Feb 2020 17:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581443363;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=HS7QLCKp/7pqzfNucyhfcZU+cycyKSoCw2mF8Vsk57M=;
 b=YnzlDNmdWy+w/fjDeoFoH1Rw2YGsPD4BbIxxI/ltFl2cYu1PFcWu2DNF
 QonGlZVrh0xI4cN6w4owZW5N8azcXDuWyA833o1hhy2+608/hjf5ZPyG8
 pozszd7tDe3Z/F/sl5QzRY/EA1+hnnqgBcpZam7KluVah6WXKO+Rklf2L 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ov+4y+UCMK41VjVQBQ8G0f0o5kzoV1aubTxPk8FPnaRW3FgiqzlWJrAYiYEs08NENHD6WvYoo+
 aBirYXAHmPFXx5RlJQ4pMXT5tb2TtvxHbx8+fZZKmvLrQuUGO2IzetIll+5n2dVycD9zUuZ24m
 9+Lv8e+/O9NubLOcE9CKsC5HrCKacJ8ZzkHy1HWdYevO0CMW1QNRg7MHi5qudwCtNQbDM6ckM+
 +tyuDURcQD9Q+X3Wzd05q9V/EWebR6I4J3yXPq7JVYO0Sh9+Af04fK3YodJtAOStYWB22sbBLc
 mDg=
X-SBRS: 2.7
X-MesageID: 12656273
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12656273"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24130.59674.874067.120358@mariner.uk.xensource.com>
Date: Tue, 11 Feb 2020 17:49:14 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200205165056.11734-7-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-7-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 6/6] xen/public: Obsolete
 HVM_PARAM_PAE_ENABLED
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggNi82XSB4ZW4vcHVibGljOiBPYnNvbGV0ZSBI
Vk1fUEFSQU1fUEFFX0VOQUJMRUQiKToKPiBIVk1fUEFSQU1fUEFFX0VOQUJMRUQgaXMgdW5kb2N1
bWVudGVkIGFuZCBYZW4gaGFzIG5ldmVyIGFjdGVkIHVwb24gaXRzIHZhbHVlLAo+IGNvbnRyYXJ5
IHBlcmhhcHMgdG8gZXhwZWN0YXRpb25zIGJhc2VkIG9uIGhvdyBvdGhlciBib29sZWFuIGZpZWxk
cyB3b3JrLgo+IAo+IEl0IHdhcyBvbmx5IGV2ZXIgdXNlZCBhcyBhIG5vbi1zdGFuZGFyZCBjYWxs
aW5nIGNvbnZlbnRpb24gZm9yCj4geGNfY3B1aWRfYXBwbHlfcG9saWN5KCkgYnV0IHRoYXQgaGFz
IGJlZW4gZml4ZWQgbm93Lgo+IAo+IFB1cmdlIGl0cyB1c2UsIGFuZCBhbnkgcG9zc2libGUgY29u
ZnVzaW9uIG92ZXIgaXRzIGJlaGF2aW91ciwgYnkgaGF2aW5nIFhlbgo+IHJlamVjdCBhbnkgYXR0
ZW1wdHMgdG8gdXNlIGl0LiAgRm9yZ28gc2V0dGluZyBpdCB1cCBpbiBsaWJ4bCdzCj4gaHZtX3Nl
dF9jb25mX3BhcmFtcygpLiAgVGhlIG9ubHkgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgbmVjZXNz
YXJ5IGlzIHRvIGhhdmUKPiB0aGUgSFZNIHJlc3RvcmUgc3RyZWFtIGRpc2NhcmQgaXQgaWYgZm91
bmQuCgpUaGlzIGxvb2tzIHBsYXVzaWJsZSB0b28uICBCdXQgbWF5YmUgSSBzaG91bGQgYmUgcmVh
ZGluZyB0aGlzIHBhdGNoCmFuZCB0aGUgcHJldmlvdXMgb25lIHRvZ2V0aGVyID8gIE9yIG1heWJl
IHRoZXkgd291bGQgYmUgYmV0dGVyCnNxdWFzaGVkID8KCklmIHlvdSB0aGluayB0aGF0IGlzIGxp
a2VseSB0byBtYWtlIG1lIGxlc3MgY29uZnVzZWQgSSdtIGhhcHB5IHRvIHRyeQpzcXVhc2hpbmcg
dGhlbSBsb2NhbGx5IGFuZCByZWFkaW5nIHRoZSByZXN1bHQuLi4KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

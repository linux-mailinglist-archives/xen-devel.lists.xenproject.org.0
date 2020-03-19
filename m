Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BC518BF14
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 19:10:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEzZo-0002Br-PO; Thu, 19 Mar 2020 18:07:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UtS+=5E=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jEzZm-0002Bi-Pl
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 18:07:26 +0000
X-Inumbo-ID: 7d0b426e-6a0c-11ea-bc50-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d0b426e-6a0c-11ea-bc50-12813bfff9fa;
 Thu, 19 Mar 2020 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=7s9hQNvI+/LFiy82pTxBLbGzIHSyoH0ucXj2jeZb0Qw=; b=AqZYU6JUjiq3QSMxdTCnFUPy+e
 sIdhPjIkRZKHq8fRT5PCERKKc6HNDSrg627AFperiUOpScEZkvERxWtvsFQXExe+TeWYpsNpCFIJM
 RE5nWb+ZKOekzkKqpihTzAoJQX54AbZQAiiYTS78twxFPaMgy7QIWsHdAqPlVnY4Hf/A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jEzZa-0006yB-Fd; Thu, 19 Mar 2020 18:07:14 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jEzZa-0005Th-5w; Thu, 19 Mar 2020 18:07:14 +0000
Date: Thu, 19 Mar 2020 18:07:11 +0000
From: Wei Liu <wl@xen.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20200319180711.rfcepcakdmrpmcp4@debian>
References: <916bbc82cafac74f0a203b48eebfbc711bd33a70.camel@infradead.org>
 <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/2] x86/setup: simplify handling of
 initrdidx when no initrd present
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <xadimgnik@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMTgsIDIwMjAgYXQgMTE6NDY6MDZBTSArMDAwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4g
UmVtb3ZlIGEgdGVybmFyeSBvcGVyYXRvciB0aGF0IG1hZGUgbXkgYnJhaW4gaHVydC4KPiAKPiBS
ZXBsYWNlIGl0IHdpdGggc29tZXRoaW5nIHNpbXBsZXIgdGhhdCBtYWtlcyBpdCBzb21ld2hhdCBj
bGVhcmVyIHRoYXQKPiB0aGUgY2hlY2sgZm9yIGluaXRyZGlkeCA8IG1iaS0+bW9kc19jb3VudCBp
cyBiZWNhdXNlIGxhcmdlciB2YWx1ZXMgYXJlCj4gd2hhdCBmaW5kX2ZpcnN0X2JpdCgpIHdpbGwg
cmV0dXJuIHdoZW4gaXQgZG9lc24ndCBmaW5kIGFueXRoaW5nLgo+IAo+IEFsc28gZHJvcCB0aGUg
ZXhwbGljaXQgY2hlY2sgZm9yIG1vZHVsZSAjMCBzaW5jZSB0aGF0IHdvdWxkIGJlIHRoZQo+IGRv
bTAga2VybmVsIGFuZCB0aGUgY29ycmVzcG9uZGluZyBiaXQgaXMgYWx3YXlzIGNsZWFyIGluIG1v
ZHVsZV9tYXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpv
bi5jby51az4KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KClJldmll
d2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKSSB0aGluayB0aGlzIGlzIGEgZmluZSBpbXBy
b3ZlbWVudC4gSXQgaXMgbW9yZSBzdHJhaWdodGZvcndhcmQgdG8KZm9sbG93LgoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

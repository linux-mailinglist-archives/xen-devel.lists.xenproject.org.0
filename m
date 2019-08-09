Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F087454
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 10:37:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw0M4-00016N-HN; Fri, 09 Aug 2019 08:34:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7QoQ=WF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hw0M2-00016I-QQ
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 08:34:30 +0000
X-Inumbo-ID: 7ffeb14a-ba80-11e9-b03e-8f49c76fffaa
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ffeb14a-ba80-11e9-b03e-8f49c76fffaa;
 Fri, 09 Aug 2019 08:34:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 01:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="175100435"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2019 01:34:26 -0700
Date: Fri, 9 Aug 2019 16:38:33 +0800
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20190809083831.GA30839@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [Xen-devel] Reset pass-thru devices in a VM
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgZXZlcnlvbmUsCgpJIGhhdmUgYSBkZXZpY2Ugd2hpY2ggb25seSBzdXBwb3J0cyBzZWNvbmRh
cnkgYnVzIHJlc2V0LiBBZnRlciBiZWluZwphc3NpZ25lZCB0byBhIFZNLCBpdCB3b3VsZCBiZSBw
bGFjZWQgdW5kZXIgaG9zdCBicmlkZ2UuIEZvciBkZXZpY2VzCnVuZGVyIGhvc3QgYnJpZGdlLCBz
ZWNvbmRhcnkgYnVzIHJlc2V0IGlzIG5vdCBhcHBsaWNhYmxlLiBUaHVzLCBhIFZNCmhhcyBubyB3
YXkgdG8gcmVzZXQgdGhpcyBkZXZpY2UuCgpUaGlzIGRldmljZSdzIHVzYWdlIHdvdWxkIGJlIGxp
bWl0ZWQgd2l0aG91dCBQQ0kgcmVzZXQgKGZvciBleGFtcGxlLCBpdHMKZHJpdmVyIGNhbm5vdCBy
ZS1pbml0aWFsaXplIHRoZSBkZXZpY2UgcHJvcGVybHkgd2l0aG91dCBQQ0kgcmVzZXQsIHdoaWNo
Cm1lYW5zIGluIFZNIGRldmljZSB3b24ndCBiZSB1c2FibGUgYWZ0ZXIgdW5sb2FkaW5nIHRoZSBk
cml2ZXIpLCBpdCB3b3VsZApiZSBtdWNoIGJldHRlciBpZiB0aGVyZSBpcyBhIHdheSBhdmFpbGFi
bGUgdG8gVk1zIHRvIHJlc2V0IHRoZSBkZXZpY2UuCgpJbiBteSBtaW5kLCBhIHN0cmFpZ2h0Zm93
YXJkIHNvbHV0aW9uIGlzIHRvIGNyZWF0ZSBhIHZpcnR1YWwgYnJpZGdlCmZvciBhIFZNIGFuZCBw
bGFjZSB0aGUgcGFzcy10aHJ1IGRldmljZSB1bmRlciBhIHZpcnR1YWwgYnJpZGdlLiBCdXQgaXQK
aXNuJ3Qgc3VwcG9ydGVkIGluIFhlbiAoS1ZNL1FFTVUgc3VwcG9ydHMpIGFuZCBlbmFibGluZyBp
dCBsb29rcyBuZWVkCmEgbG90IG9mIGVmZm9ydHMuIEFsdGVybmF0aXZlbHksIGVtdWxhdGluZyBG
TFIgKEZ1bmN0aW9uIExldmVsIFJlc2V0KQpjYXBhYmlsaXR5IGZvciB0aGlzIGRldmljZSBtaWdo
dCBiZSBhIGZlYXNpYmxlIHdheSBhbmQgb25seSBuZWVkcwpyZWxhdGl2ZWx5IGZldyBjaGFuZ2Vz
LiBJIGFtIHBsYW5uaW5nIHRvIGVuYWJsZSBhbiBvcHQtaW4gZmVhdHVyZQoobGlrZSAncGVybWlz
c2l2ZScpIHRvIGFsbG93IHFlbXUgdG8gZXhwb3NlIEZMUiBjYXBhYmlsaXR5IHRvIGd1ZXN0IGZv
cgpwYXNzLXRocnUgZGV2aWNlcyBhcyBsb25nIGFzIHRoaXMgZGV2aWNlIGlzIHJlc2V0YWJsZSBv
biBkb20wIChpLmUuIHRoZQpkZXZpY2UgaGFzICdyZXNldCcgYXR0cmlidXRlIHVuZGVyIGl0cyBz
eXNmcykuIEFuZCB3aGVuIGd1ZXN0IGluaXRpYXRlcwphbiBGTFIsIHFlbXUganVzdCBlY2hvIDEg
dG8gdGhlICdyZXNldCcgYXR0cmlidXRlIG9uIGRvbTAuCgpEbyB5b3UgdGhpbmsgZW11bGF0aW5n
IEZMUiBjYXBhYmlsaXR5IGlzIGRvYWJsZT8KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

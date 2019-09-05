Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE293A9A6F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 08:17:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5l20-0003YQ-L2; Thu, 05 Sep 2019 06:14:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5l1z-0003YL-5I
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 06:14:07 +0000
X-Inumbo-ID: 5cc73358-cfa4-11e9-abc0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cc73358-cfa4-11e9-abc0-12813bfff9fa;
 Thu, 05 Sep 2019 06:14:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53EC4ABCB;
 Thu,  5 Sep 2019 06:14:04 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81569b49-5121-89b2-1002-0a9b14b9d1dd@suse.com>
Date: Thu, 5 Sep 2019 08:14:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/cpu-policy: work around bogus warning in
 test harness
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVzcGl0ZSAlLjEycyBwcm9wZXJseSBsaW1pdGluZyB0aGUgbnVtYmVyIG9mIGNoYXJhY3RlcnMg
cmVhZCBmcm9tCmlkZW50W10sIGdjYyA5IChhdCBsZWFzdCB1cCB0byA5LjIuMCkgd2FybnMgYWJv
dXQgdGhlIHN0cmluZ3Mgbm90CmJlaW5nIG51bC10ZXJtaW5hdGVkOgoKdGVzdC1jcHUtcG9saWN5
LmM6NjQ6MTg6IGVycm9yOiAnJS4xMnMnIGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBub3QgYSBudWwt
dGVybWluYXRlZCBzdHJpbmcgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0KICAgNjQgfCAgICAg
ICAgICAgICBmYWlsKCIgIFRlc3QgJyUuMTJzJywgZXhwZWN0ZWQgdmVuZG9yICV1LCBnb3QgJXVc
biIsCiAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CnRlc3QtY3B1LXBvbGljeS5jOjIwOjEyOiBub3RlOiBpbiBkZWZp
bml0aW9uIG9mIG1hY3JvICdmYWlsJwogICAyMCB8ICAgICBwcmludGYoZm10LCAjI19fVkFfQVJH
U19fKTsgICAgICAgICAgICAgICAgIFwKICAgICAgfCAgICAgICAgICAgIF5+fgp0ZXN0LWNwdS1w
b2xpY3kuYzo2NDoyNzogbm90ZTogZm9ybWF0IHN0cmluZyBpcyBkZWZpbmVkIGhlcmUKICAgNjQg
fCAgICAgICAgICAgICBmYWlsKCIgIFRlc3QgJyUuMTJzJywgZXhwZWN0ZWQgdmVuZG9yICV1LCBn
b3QgJXVcbiIsCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fgp0ZXN0LWNw
dS1wb2xpY3kuYzo0NDo3OiBub3RlOiByZWZlcmVuY2VkIGFyZ3VtZW50IGRlY2xhcmVkIGhlcmUK
ICAgNDQgfCAgICAgfSB0ZXN0c1tdID0gewogICAgICB8ICAgICAgIF5+fn5+CgpUaGUgaXNzdWUg
d2FzIHJlcG9ydGVkIGFnYWluc3QgZ2NjIGluIHRoZWlyIGJ1Z3ppbGxhIChidWcgOTE2NjcpLgoK
UmUtb3JkZXIgYXJyYXkgZW50cmllcywgb2RkbHkgZW5vdWdoIHN1cHByZXNzaW5nIHRoZSB3YXJu
aW5nLgoKUmVwb3J0ZWQtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJr
QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYworKysgYi90
b29scy90ZXN0cy9jcHUtcG9saWN5L3Rlc3QtY3B1LXBvbGljeS5jCkBAIC00MiwxNSArNDIsMTYg
QEAgc3RhdGljIHZvaWQgdGVzdF92ZW5kb3JfaWRlbnRpZmljYXRpb24odgogICAgICAgICB9Owog
ICAgICAgICB1bnNpZ25lZCBpbnQgdmVuZG9yOwogICAgIH0gdGVzdHNbXSA9IHsKKyAgICAgICAg
LyogVGhlIDFzdCBlbnRyeSBzaG91bGQgcmVtYWluIGhlcmUgdG8gd29yayBhcm91bmQgZ2NjIGJ1
ZyA5MTY2Ny4gKi8KKyAgICAgICAgeyB7ICIiICAgICAgICAgICAgIH0sIFg4Nl9WRU5ET1JfVU5L
Tk9XTiB9LAorICAgICAgICB7IHsgIiAgICAgICAgICAgICIgfSwgWDg2X1ZFTkRPUl9VTktOT1dO
IH0sCisgICAgICAgIHsgeyAieHh4eHh4eHh4eHh4IiB9LCBYODZfVkVORE9SX1VOS05PV04gfSwK
KwogICAgICAgICB7IHsgIkdlbnVpbmVJbnRlbCIgfSwgWDg2X1ZFTkRPUl9JTlRFTCB9LAogICAg
ICAgICB7IHsgIkF1dGhlbnRpY0FNRCIgfSwgWDg2X1ZFTkRPUl9BTUQgfSwKICAgICAgICAgeyB7
ICJDZW50YXVySGF1bHMiIH0sIFg4Nl9WRU5ET1JfQ0VOVEFVUiB9LAogICAgICAgICB7IHsgIiAg
U2hhbmdoYWkgICIgfSwgWDg2X1ZFTkRPUl9TSEFOR0hBSSB9LAogICAgICAgICB7IHsgIkh5Z29u
R2VudWluZSIgfSwgWDg2X1ZFTkRPUl9IWUdPTiB9LAotCi0gICAgICAgIHsgeyAiIiAgICAgICAg
ICAgICB9LCBYODZfVkVORE9SX1VOS05PV04gfSwKLSAgICAgICAgeyB7ICIgICAgICAgICAgICAi
IH0sIFg4Nl9WRU5ET1JfVU5LTk9XTiB9LAotICAgICAgICB7IHsgInh4eHh4eHh4eHh4eCIgfSwg
WDg2X1ZFTkRPUl9VTktOT1dOIH0sCiAgICAgfTsKIAogICAgIHByaW50ZigiVGVzdGluZyBDUFUg
dmVuZG9yIGlkZW50aWZpY2F0aW9uOlxuIik7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

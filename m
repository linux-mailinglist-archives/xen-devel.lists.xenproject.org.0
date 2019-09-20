Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F1AB99FD
	for <lists+xen-devel@lfdr.de>; Sat, 21 Sep 2019 01:17:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBS6i-0006Qv-7F; Fri, 20 Sep 2019 23:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1IS6=XP=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1iBS6g-0006Qm-DQ
 for xen-devel@lists.xen.org; Fri, 20 Sep 2019 23:14:30 +0000
X-Inumbo-ID: 64c16ca4-dbfc-11e9-b299-bc764e2007e4
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64c16ca4-dbfc-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 23:14:28 +0000 (UTC)
Received: from [192.168.2.33] (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id A693372008B
 for <xen-devel@lists.xen.org>; Sat, 21 Sep 2019 00:09:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com A693372008B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1569038981;
 bh=L6f26OqhUlH291cNgExC/phm1zquflutn/tXNRjEV7o=;
 h=To:From:Subject:Date:From;
 b=TMClu26n5x0LPLmnLV/xTs0WEd480OcM5RYDQnm1Zw85F8jLrpzebOPz1E5ZYOId/
 jRs71jDmAqWrNVFlzxk+ZJxOh40v3DwMd2c1omiXtHuxuM5NfHky1AB53onejI1HS1
 DVm7OBMLZJNeC0OUNBqej1tDPzgT9N3P3PIX6Sic=
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <aecc7e18-40ff-8bb8-467c-24bfe99ee8f1@prgmr.com>
Date: Fri, 20 Sep 2019 16:14:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Crash with nested HVM and Linux v5.1+
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBuZXN0ZWRodm09MSwgdGhlIEwyIEhWTSBndWVzdCBpcyBlaXRoZXIgaGFuZ2luZyAoWGVu
IDQuOCkgb3IgY3Jhc2hpbmcgKFhlbiA0LjEyLjEpIHRoZSBMMSBYZW4gaHlwZXJ2aXNvciB3aXRo
IHJlY2VudCB2ZXJzaW9ucyBvZiBMaW51eC4gV2UgCmlzb2xhdGVkIHRoZSBjb21taXQgdG86Cgpj
b21taXQgMDkzYWU4ZjlhODZhOTc0YzkyMGI2MTM4NjBmMWY3ZmQ1YmJkNzBhYgpBdXRob3I6IEJv
cmlzbGF2IFBldGtvdiA8YnBAc3VzZS5kZT4KRGF0ZTogICBUaHUgQXByIDEyIDEzOjExOjM2IDIw
MTggKzAyMDAKCiAgICAgeDg2L1RTQzogVXNlIFJEVFNDUAoKICAgICBDdXJyZW50bHksIHRoZSBr
ZXJuZWwgdXNlcwoKICAgICAgIFtMTV1GRU5DRTsgUkRUU0MKCiAgICAgaW4gdGhlIHRpbWVrZWVw
aW5nIGNvZGUsIHRvIGd1YXJhbnRlZSBtb25vdG9uaWNpdHkgb2YgdGltZSB3aGVyZSB0aGUKICAg
ICAqRkVOQ0UgaXMgc2VsZWN0ZWQgYmFzZWQgb24gdmVuZG9yLgoKICAgICBSZXBsYWNlIHRoYXQg
c2VxdWVuY2Ugd2l0aCBSRFRTQ1Agd2hpY2ggaXMgZmFzdGVyIG9yIG9uLXBhciBhbmQgZ2l2ZXMK
ICAgICB0aGUgc2FtZSBndWFyYW50ZWVzLgoKICAgICBBIG1pY3JvYmVuY2htYXJrIG9uIEludGVs
IHNob3dzIHRoYXQgdGhlIGNoYW5nZSBpcyBvbi1wYXIuCgogICAgIE9uIEFNRCwgdGhlIGNoYW5n
ZSBpcyBlaXRoZXIgb24tcGFyIHdpdGggdGhlIGN1cnJlbnQgTEZFTkNFLXByZWZpeGVkCiAgICAg
UkRUU0Mgb3Igc2xpZ2h0bHkgYmV0dGVyIHdpdGggUkRUU0NQLgoKICAgICBUaGUgY29tcGFyaXNv
biBpcyBkb25lIHdpdGggdGhlIExGRU5DRS1wcmVmaXhlZCBSRFRTQyAoYW5kIG5vdCB3aXRoIHRo
ZQogICAgIE1GRU5DRS1wcmVmaXhlZCBvbmUsIGFzIG9uZSB3b3VsZCBub3JtYWxseSBleHBlY3Qp
IGJlY2F1c2UgYWxsIG1vZGVybgogICAgIEFNRCBmYW1pbGllcyBtYWtlIExGRU5DRSBzZXJpYWxp
emluZyBhbmQgdGh1cyBhdm9pZCB0aGUgaGVhdnkgTUZFTkNFIGJ5CiAgICAgZWZmZWN0aXZlbHkg
ZW5hYmxpbmcgWDg2X0ZFQVRVUkVfTEZFTkNFX1JEVFNDLgoKSSBjb3VsZCBub3QgZmluZCBSRFRT
Q1AgaW5zdHJ1Y3Rpb24gYmVpbmcgdXNlZCBieSBMaW51eCBiZWZvcmUgdGhlIGdpdmVuIGNvbW1p
dCwgd2hpY2ggaXMgcHJlc2VudCBpbiBMaW51eCB2NS4xIGFuZCBuZXdlci4gQXMgZXhwZWN0ZWQs
IG1hc2tpbmcgb2ZmIAp0aGUgUkRUU0NQIGNwdWlkIGZsYWcgaW4gbGVhZiAweDgwMDAwMDAxIHBy
ZXZlbnRzIGEgY29vcGVyYXRpdmUgZ3Vlc3QgZnJvbSB1c2luZyB0aGF0IGluc3RydWN0aW9uIGFu
ZCB0aGVyZWZvcmUgcHJldmVudHMgdGhlIGNyYXNoLgoKLS1TYXJhaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

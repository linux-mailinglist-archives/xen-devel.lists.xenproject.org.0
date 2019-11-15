Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F74FDBBC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 11:50:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZ9Q-0004KG-C3; Fri, 15 Nov 2019 10:48:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVZ9P-0004KB-6H
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 10:48:27 +0000
X-Inumbo-ID: 7381803e-0795-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7381803e-0795-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 10:48:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59976AFD4;
 Fri, 15 Nov 2019 10:48:25 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
Message-ID: <6e634af2-23b2-9385-8c56-d8c0a031041f@suse.com>
Date: Fri, 15 Nov 2019 11:48:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 2/2] x86/clang: move and fix .skip check
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgouc2tpcCBpcyBv
bmx5IHVzZWQgYnkgeDg2IGNvZGUsIHNvIHBsYWNlIHRoZSBjbGFuZyAuc2tpcCB3aXRoIGxhYmVs
cwpjaGVjayBpbiB4ODYvUnVsZXMubWsgaW5zdGVhZCBvZiB0aGUgdG9wIGxldmVsIFJ1bGVzLm1r
LiBXaGlsZSB0aGVyZQphbHNvIGZpeCBhbiBpc3N1ZSB3aXRoIGl0IGJ5IHJlbW92aW5nIHRoZSAn
XG4nIHdoaWNoIHRyaWdnZXJzIHRoZQpmb2xsb3dpbmcgZXJyb3I6Cgo8c3RkaW4+OjE6MzE6IGVy
cm9yOiBtaXNzaW5nIHRlcm1pbmF0aW5nICciJyBjaGFyYWN0ZXIgWy1XZXJyb3IsLVdpbnZhbGlk
LXBwLXRva2VuXQp2b2lkIF8odm9pZCkgeyBhc20gdm9sYXRpbGUgKCAiLkwwOgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCjxzdGRpbj46MTozMTogZXJyb3I6IGV4cGVjdGVkIHN0cmlu
ZyBsaXRlcmFsIGluICdhc20nCjxzdGRpbj46MzoxODogZXJyb3I6IG1pc3NpbmcgdGVybWluYXRp
bmcgJyInIGNoYXJhY3RlciBbLVdlcnJvciwtV2ludmFsaWQtcHAtdG9rZW5dCi5za2lwICguTDEg
LSAuTDApIiApOyB9CiAgICAgICAgICAgICAgICAgXgo8c3RkaW4+OjM6MjQ6IGVycm9yOiBleHBl
Y3RlZCAnKScKLnNraXAgKC5MMSAtIC5MMCkiICk7IH0KICAgICAgICAgICAgICAgICAgICAgICBe
CjxzdGRpbj46MToyOTogbm90ZTogdG8gbWF0Y2ggdGhpcyAnKCcKdm9pZCBfKHZvaWQpIHsgYXNt
IHZvbGF0aWxlICggIi5MMDoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPHN0ZGluPjoz
OjI0OiBlcnJvcjogZXhwZWN0ZWQgJ30nCi5za2lwICguTDEgLSAuTDApIiApOyB9CiAgICAgICAg
ICAgICAgICAgICAgICAgXgo8c3RkaW4+OjE6MTQ6IG5vdGU6IHRvIG1hdGNoIHRoaXMgJ3snCnZv
aWQgXyh2b2lkKSB7IGFzbSB2b2xhdGlsZSAoICIuTDA6CiAgICAgICAgICAgICBeCjUgZXJyb3Jz
IGdlbmVyYXRlZC4KClN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IFB1
dCBtb3ZlZCBjaGVjayAxc3QgaW4gaWZlcSgpIGJsb2NrLgoKLS0tIGEveGVuL1J1bGVzLm1rCisr
KyBiL3hlbi9SdWxlcy5tawpAQCAtNzYsMTMgKzc2LDYgQEAgZW5kaWYKIAogQUZMQUdTLXkgICAg
ICAgICAgICAgICAgKz0gLURfX0FTU0VNQkxZX18KIAotIyBPbGRlciBjbGFuZydzIGJ1aWx0LWlu
IGFzc2VtYmxlciBkb2Vzbid0IHVuZGVyc3RhbmQgLnNraXAgd2l0aCBsYWJlbHM6Ci0jIGh0dHBz
Oi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjczNjkKLWlmZXEgKCQoY2xhbmcpLHkp
Ci0kKGNhbGwgYXMtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsIi5MMDpcbi5MMTpcbi5za2lwICguTDEg
LSAuTDApIiwsXAotICAgICAgICAgICAgICAgICAgICAgLW5vLWludGVncmF0ZWQtYXMpCi1lbmRp
ZgotCiBBTExfT0JKUyA6PSAkKEFMTF9PQkpTLXkpCiAKICMgR2V0IGdjYyB0byBnZW5lcmF0ZSB0
aGUgZGVwZW5kZW5jaWVzIGZvciB1cy4KLS0tIGEveGVuL2FyY2gveDg2L1J1bGVzLm1rCisrKyBi
L3hlbi9hcmNoL3g4Ni9SdWxlcy5tawpAQCAtNzQsNiArNzQsMTEgQEAgaWZlcSAoJChjbGFuZyks
eSkKICMgTm90ZTogQW55IHRlc3Qgd2hpY2ggYWRkcyAtbm8taW50ZWdyYXRlZC1hcyB3aWxsIGNh
dXNlIHN1YnNlcXVlbnQgdGVzdHMgdG8KICMgc3VjY2VlZCwgYW5kIG5vdCB0cmlnZ2VyIGZ1cnRo
ZXIgYWRkaXRpb25zLgogCisjIE9sZGVyIGNsYW5nJ3MgYnVpbHQtaW4gYXNzZW1ibGVyIGRvZXNu
J3QgdW5kZXJzdGFuZCAuc2tpcCB3aXRoIGxhYmVsczoKKyMgaHR0cHM6Ly9idWdzLmxsdm0ub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yNzM2OQorJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLCIu
TDA6IC5MMTogLnNraXAgKC5MMSAtIC5MMCkiLCxcCisgICAgICAgICAgICAgICAgICAgICAtbm8t
aW50ZWdyYXRlZC1hcykKKwogIyBDaGVjayB3aGV0aGVyIGNsYW5nIGFzbSgpLXMgc3VwcG9ydCAu
aW5jbHVkZS4KICQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQywiLmluY2x1ZGUgXCJhc20v
aW5kaXJlY3RfdGh1bmtfYXNtLmhcIiIsLFwKICAgICAgICAgICAgICAgICAgICAgIC1uby1pbnRl
Z3JhdGVkLWFzKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8F140E78
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:00:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isU0S-0002WO-U4; Fri, 17 Jan 2020 15:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V5CB=3G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1isU0R-0002W7-Ax
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:57:55 +0000
X-Inumbo-ID: 182e0138-3942-11ea-9fd7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 182e0138-3942-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579276662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=41jiLhUK+rJBShbXoF53s8BPT3orNgLEoRhZmZrUAMg=;
 b=gR7PqKvOdaZ2PETPcICU9FtyDCN+p4zuoa1EVmoAOMJCG3HxLtMkMYuH
 c8WM5WGasF2YMRCNZBSw9MYu1qksvRy+jXgOJXRaftLXfkCBRuQrN7HVg
 DfvYxsuQBSugNHCcfi0m+Cc68XnVw7oDRwGuE8/qWIYV0kMR6wa6ft9WJ I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gr6POZZBnx/sUyvQ15FK3IQNdfDc3Eu7uCDYfE+ffs8kKDDX8boNs3YS5bYSieVCYmpDm1mlNU
 9U3PhCN5cCpZqlM3TyR0/iLB3UMUT3vIN/uOnMJPjDhru31grI5SpnSS3YtYgcU6QN3JJhKTr9
 ahye6xg8ggOoGEyNNzhSGQUom1H9HO5ybJYasUIjQKHNfccvqngawaqUsANQRXvKMStRRv79c7
 fmRn+93r3D4KeKbOCgoW4YBcu+bHhJys36+R5kQasbt8PZhUqhGp69TGM7ewLOBik7C48kSEJB
 A7c=
X-SBRS: 2.7
X-MesageID: 11674360
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11674360"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 15:57:30 +0000
Message-ID: <20200117155734.1067550-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117155734.1067550-1-george.dunlap@citrix.com>
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 4/8] golang/xenlight: Errors are negative
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDg3MWU1MWQyZDQgY2hhbmdlZCB0aGUgc2lnbiBvbiB0aGUgeGVubGlnaHQgZXJyb3Ig
dHlwZXMgKG1ha2luZwp0aGUgdmFsdWVzIG5lZ2F0aXZlLCBzYW1lIGFzIHRoZSBDLWdlbmVyYXRl
ZCBjb25zdGFudHMpLCBidXQgZmFpbGVkIHRvCmZsaXAgdGhlIHNpZ24gaW4gdGhlIEVycm9yKCkg
c3RyaW5nIGZ1bmN0aW9uLiAgVGhlIHJlc3VsdCBpcyB0aGF0CkVycm9yTm9uc3BlY2lmaWMuU3Ry
aW5nKCkgcHJpbnRzICJsaWJ4bCBlcnJvcjogMSIgcmF0aGVyIHRoYW4gdGhlCmh1bWFuLXJlYWRh
YmxlIGVycm9yIG1lc3NhZ2UuCgpHZXQgcmlkIG9mIHRoZSB3aG9sZSBpc3N1ZSBieSBtYWtpbmcg
bGlieGxFcnJvcnMgYSBtYXAsIGFuZCBtYXBwaW5nCmFjdHVhbCBlcnJvciB2YWx1ZXMgdG8gc3Ry
aW5nLCBmYWxsaW5nIGJhY2sgdG8gcHJpbnRpbmcgdGhlIGFjdHVhbAp2YWx1ZSBvZiB0aGUgRXJy
b3IgdHlwZSBpZiBpdCdzIG5vdCBwcmVzZW50LgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KdjI6Ci0gQ29udmVydCBsaWJ4bEVycm9y
cyB0byBhIG1hcC4KCkNDOiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgot
LS0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDYyICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAzMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQu
Z28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggMTI5OTk4MTcxMy4u
YWExZTYzYTYxYSAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0Lmdv
CisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtMzYsNDIgKzM2LDQw
IEBAIGltcG9ydCAoCiAJInVuc2FmZSIKICkKIAotdmFyIGxpYnhsRXJyb3JzID0gWy4uLl1zdHJp
bmd7Ci0JLUVycm9yTm9uc3BlY2lmaWM6ICAgICAgICAgICAgICAgICAgIk5vbi1zcGVjaWZpYyBl
cnJvciIsCi0JLUVycm9yVmVyc2lvbjogICAgICAgICAgICAgICAgICAgICAgIldyb25nIHZlcnNp
b24iLAotCS1FcnJvckZhaWw6ICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQiLAotCS1F
cnJvck5pOiAgICAgICAgICAgICAgICAgICAgICAgICAgICJOb3QgSW1wbGVtZW50ZWQiLAotCS1F
cnJvck5vbWVtOiAgICAgICAgICAgICAgICAgICAgICAgICJObyBtZW1vcnkiLAotCS1FcnJvcklu
dmFsOiAgICAgICAgICAgICAgICAgICAgICAgICJJbnZhbGlkIGFyZ3VtZW50IiwKLQktRXJyb3JC
YWRmYWlsOiAgICAgICAgICAgICAgICAgICAgICAiQmFkIEZhaWwiLAotCS1FcnJvckd1ZXN0VGlt
ZWRvdXQ6ICAgICAgICAgICAgICAgICJHdWVzdCB0aW1lZCBvdXQiLAotCS1FcnJvclRpbWVkb3V0
OiAgICAgICAgICAgICAgICAgICAgICJUaW1lZCBvdXQiLAotCS1FcnJvck5vcGFyYXZpcnQ6ICAg
ICAgICAgICAgICAgICAgICJObyBQYXJhdmlydHVhbGl6YXRpb24iLAotCS1FcnJvck5vdFJlYWR5
OiAgICAgICAgICAgICAgICAgICAgICJOb3QgcmVhZHkiLAotCS1FcnJvck9zZXZlbnRSZWdGYWls
OiAgICAgICAgICAgICAgICJPUyBldmVudCByZWdpc3RyYXRpb24gZmFpbGVkIiwKLQktRXJyb3JC
dWZmZXJmdWxsOiAgICAgICAgICAgICAgICAgICAiQnVmZmVyIGZ1bGwiLAotCS1FcnJvclVua25v
d25DaGlsZDogICAgICAgICAgICAgICAgICJVbmtub3duIGNoaWxkIiwKLQktRXJyb3JMb2NrRmFp
bDogICAgICAgICAgICAgICAgICAgICAiTG9jayBmYWlsZWQiLAotCS1FcnJvckpzb25Db25maWdF
bXB0eTogICAgICAgICAgICAgICJKU09OIGNvbmZpZyBlbXB0eSIsCi0JLUVycm9yRGV2aWNlRXhp
c3RzOiAgICAgICAgICAgICAgICAgIkRldmljZSBleGlzdHMiLAotCS1FcnJvckNoZWNrcG9pbnRE
ZXZvcHNEb2VzTm90TWF0Y2g6ICJDaGVja3BvaW50IGRldm9wcyBkb2VzIG5vdCBtYXRjaCIsCi0J
LUVycm9yQ2hlY2twb2ludERldmljZU5vdFN1cHBvcnRlZDogIkNoZWNrcG9pbnQgZGV2aWNlIG5v
dCBzdXBwb3J0ZWQiLAotCS1FcnJvclZudW1hQ29uZmlnSW52YWxpZDogICAgICAgICAgICJWTlVN
QSBjb25maWcgaW52YWxpZCIsCi0JLUVycm9yRG9tYWluTm90Zm91bmQ6ICAgICAgICAgICAgICAg
IkRvbWFpbiBub3QgZm91bmQiLAotCS1FcnJvckFib3J0ZWQ6ICAgICAgICAgICAgICAgICAgICAg
ICJBYm9ydGVkIiwKLQktRXJyb3JOb3Rmb3VuZDogICAgICAgICAgICAgICAgICAgICAiTm90IGZv
dW5kIiwKLQktRXJyb3JEb21haW5EZXN0cm95ZWQ6ICAgICAgICAgICAgICAiRG9tYWluIGRlc3Ry
b3llZCIsCi0JLUVycm9yRmVhdHVyZVJlbW92ZWQ6ICAgICAgICAgICAgICAgIkZlYXR1cmUgcmVt
b3ZlZCIsCit2YXIgbGlieGxFcnJvcnMgPSBtYXBbRXJyb3Jdc3RyaW5neworCUVycm9yTm9uc3Bl
Y2lmaWM6ICAgICAgICAgICAgICAgICAgIk5vbi1zcGVjaWZpYyBlcnJvciIsCisJRXJyb3JWZXJz
aW9uOiAgICAgICAgICAgICAgICAgICAgICAiV3JvbmcgdmVyc2lvbiIsCisJRXJyb3JGYWlsOiAg
ICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIiwKKwlFcnJvck5pOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJOb3QgSW1wbGVtZW50ZWQiLAorCUVycm9yTm9tZW06ICAgICAgICAgICAg
ICAgICAgICAgICAgIk5vIG1lbW9yeSIsCisJRXJyb3JJbnZhbDogICAgICAgICAgICAgICAgICAg
ICAgICAiSW52YWxpZCBhcmd1bWVudCIsCisJRXJyb3JCYWRmYWlsOiAgICAgICAgICAgICAgICAg
ICAgICAiQmFkIEZhaWwiLAorCUVycm9yR3Vlc3RUaW1lZG91dDogICAgICAgICAgICAgICAgIkd1
ZXN0IHRpbWVkIG91dCIsCisJRXJyb3JUaW1lZG91dDogICAgICAgICAgICAgICAgICAgICAiVGlt
ZWQgb3V0IiwKKwlFcnJvck5vcGFyYXZpcnQ6ICAgICAgICAgICAgICAgICAgICJObyBQYXJhdmly
dHVhbGl6YXRpb24iLAorCUVycm9yTm90UmVhZHk6ICAgICAgICAgICAgICAgICAgICAgIk5vdCBy
ZWFkeSIsCisJRXJyb3JPc2V2ZW50UmVnRmFpbDogICAgICAgICAgICAgICAiT1MgZXZlbnQgcmVn
aXN0cmF0aW9uIGZhaWxlZCIsCisJRXJyb3JCdWZmZXJmdWxsOiAgICAgICAgICAgICAgICAgICAi
QnVmZmVyIGZ1bGwiLAorCUVycm9yVW5rbm93bkNoaWxkOiAgICAgICAgICAgICAgICAgIlVua25v
d24gY2hpbGQiLAorCUVycm9yTG9ja0ZhaWw6ICAgICAgICAgICAgICAgICAgICAgIkxvY2sgZmFp
bGVkIiwKKwlFcnJvckpzb25Db25maWdFbXB0eTogICAgICAgICAgICAgICJKU09OIGNvbmZpZyBl
bXB0eSIsCisJRXJyb3JEZXZpY2VFeGlzdHM6ICAgICAgICAgICAgICAgICAiRGV2aWNlIGV4aXN0
cyIsCisJRXJyb3JDaGVja3BvaW50RGV2b3BzRG9lc05vdE1hdGNoOiAiQ2hlY2twb2ludCBkZXZv
cHMgZG9lcyBub3QgbWF0Y2giLAorCUVycm9yQ2hlY2twb2ludERldmljZU5vdFN1cHBvcnRlZDog
IkNoZWNrcG9pbnQgZGV2aWNlIG5vdCBzdXBwb3J0ZWQiLAorCUVycm9yVm51bWFDb25maWdJbnZh
bGlkOiAgICAgICAgICAgIlZOVU1BIGNvbmZpZyBpbnZhbGlkIiwKKwlFcnJvckRvbWFpbk5vdGZv
dW5kOiAgICAgICAgICAgICAgICJEb21haW4gbm90IGZvdW5kIiwKKwlFcnJvckFib3J0ZWQ6ICAg
ICAgICAgICAgICAgICAgICAgICJBYm9ydGVkIiwKKwlFcnJvck5vdGZvdW5kOiAgICAgICAgICAg
ICAgICAgICAgICJOb3QgZm91bmQiLAorCUVycm9yRG9tYWluRGVzdHJveWVkOiAgICAgICAgICAg
ICAgIkRvbWFpbiBkZXN0cm95ZWQiLAorCUVycm9yRmVhdHVyZVJlbW92ZWQ6ICAgICAgICAgICAg
ICAgIkZlYXR1cmUgcmVtb3ZlZCIsCiB9CiAKIGZ1bmMgKGUgRXJyb3IpIEVycm9yKCkgc3RyaW5n
IHsKLQlpZiAwIDwgaW50KGUpICYmIGludChlKSA8IGxlbihsaWJ4bEVycm9ycykgewotCQlzIDo9
IGxpYnhsRXJyb3JzW2VdCi0JCWlmIHMgIT0gIiIgewotCQkJcmV0dXJuIHMKLQkJfQorCWlmIHMs
IG9rIDo9IGxpYnhsRXJyb3JzW2VdOyBvayB7CisJCXJldHVybiBzCiAJfQotCXJldHVybiBmbXQu
U3ByaW50ZigibGlieGwgZXJyb3I6ICVkIiwgLWUpCisKKwlyZXR1cm4gZm10LlNwcmludGYoImxp
YnhsIGVycm9yOiAlZCIsIGUpCiB9CiAKIC8vIENvbnRleHQgcmVwcmVzZW50cyBhIGxpYnhsX2N0
eC4KLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

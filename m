Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B57A216D6
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:14:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRZqz-0002Tc-4c; Fri, 17 May 2019 10:12:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRZqw-0002Sm-UT
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:12:38 +0000
X-Inumbo-ID: 4a93e68c-788c-11e9-9406-7b80c7f6c08a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a93e68c-788c-11e9-9406-7b80c7f6c08a;
 Fri, 17 May 2019 10:12:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:12:35 -0600
Message-Id: <5CDE89120200007800230037@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:12:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC1F1@prv1-mh.provo.novell.com>
 <5B61C21202000078001F8805@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC6BD@prv1-mh.provo.novell.com>
 <5B61C212020000780020B6D8@prv1-mh.provo.novell.com>
 <5B61C21202000000000FF27E@prv1-mh.provo.novell.com>
 <5B61C2120200007800224310@prv1-mh.provo.novell.com>
 <5B61C2120200000000101EDC@prv1-mh.provo.novell.com>
 <5B61C212020000780022FF0D@prv1-mh.provo.novell.com>
 <5CDE88900200007800230027@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE88900200007800230027@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 3/3] x86/cpuidle: clean up Cx dumping
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgbG9nIHRoZSBzYW1lIGdsb2JhbCBpbmZvcm1hdGlvbiBvbmNlIHBlciBDUFUuIERvbid0
IGxvZyB0aGUgc2FtZQppbmZvcm1hdGlvbiAoaGVyZTogdGhlIGN1cnJlbnRseSBhY3RpdmUgc3Rh
dGUpIHR3aWNlLiBEb24ndCBwcmVmaXgKZGVjaW1hbCBudW1iZXJzIHdpdGggemVyb3MgKGdpdmlu
ZyB0aGUgaW1wcmVzc2lvbiB0aGV5J3JlIG9jdGFsKS4gVXNlCmZvcm1hdCBzcGVjaWZpZXJzIG1h
dGNoaW5nIHRoZSB0eXBlIG9mIHRoZSBjb3JyZXNwb25kaW5nIGV4cHJlc3Npb25zLgpEb24ndCBz
cGxpdCBwcmludGsoKS1zIHdpdGhvdXQgaW50ZXJ2ZW5pbmcgbmV3LWxpbmVzLgoKU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpBY2tlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9hY3Bp
L2NwdV9pZGxlLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYwpAQCAtMzA0LDkg
KzMwNCw2IEBAIHN0YXRpYyB2b2lkIHByaW50X2FjcGlfcG93ZXIodWludDMyX3QgY3AKIAogICAg
IHByaW50aygiPT1jcHUlZD09XG4iLCBjcHUpOwogICAgIGxhc3Rfc3RhdGVfaWR4ID0gcG93ZXIt
Pmxhc3Rfc3RhdGUgPyBwb3dlci0+bGFzdF9zdGF0ZS0+aWR4IDogLTE7Ci0gICAgcHJpbnRrKCJh
Y3RpdmUgc3RhdGU6XHRcdEMlZFxuIiwgbGFzdF9zdGF0ZV9pZHgpOwotICAgIHByaW50aygibWF4
X2NzdGF0ZTpcdFx0QyVkXG4iLCBtYXhfY3N0YXRlKTsKLSAgICBwcmludGsoInN0YXRlczpcbiIp
OwogCiAgICAgc3Bpbl9sb2NrX2lycSgmcG93ZXItPnN0YXRfbG9jayk7CiAgICAgY3VycmVudF90
aWNrID0gY3B1aWRsZV9nZXRfdGljaygpOwpAQCAtMzMxLDE2ICszMjgsMTQgQEAgc3RhdGljIHZv
aWQgcHJpbnRfYWNwaV9wb3dlcih1aW50MzJfdCBjcAogICAgICAgICBpZGxlX3VzYWdlICs9IHVz
YWdlW2ldOwogICAgICAgICBpZGxlX3JlcyArPSB0aWNrX3RvX25zKHJlc190aWNrW2ldKTsKIAot
ICAgICAgICBwcmludGsoKGxhc3Rfc3RhdGVfaWR4ID09IGkpID8gIiAgICoiIDogIiAgICAiKTsK
LSAgICAgICAgcHJpbnRrKCJDJWQ6XHQiLCBpKTsKLSAgICAgICAgcHJpbnRrKCJ0eXBlW0MlZF0g
IiwgcG93ZXItPnN0YXRlc1tpXS50eXBlKTsKLSAgICAgICAgcHJpbnRrKCJsYXRlbmN5WyUwM2Rd
ICIsIHBvd2VyLT5zdGF0ZXNbaV0ubGF0ZW5jeSk7Ci0gICAgICAgIHByaW50aygidXNhZ2VbJTA4
IlBSSXU2NCJdICIsIHVzYWdlW2ldKTsKLSAgICAgICAgcHJpbnRrKCJtZXRob2RbJTVzXSAiLCBh
Y3BpX2NzdGF0ZV9tZXRob2RfbmFtZVtwb3dlci0+c3RhdGVzW2ldLmVudHJ5X21ldGhvZF0pOwot
ICAgICAgICBwcmludGsoImR1cmF0aW9uWyUiUFJJdTY0Il1cbiIsIHRpY2tfdG9fbnMocmVzX3Rp
Y2tbaV0pKTsKKyAgICAgICAgcHJpbnRrKCIgICAlY0MldTpcdHR5cGVbQyVkXSBsYXRlbmN5WyUz
dV0gdXNhZ2VbJTgiUFJJdTY0Il0gbWV0aG9kWyU1c10gZHVyYXRpb25bJSJQUkl1NjQiXVxuIiwK
KyAgICAgICAgICAgICAgIChsYXN0X3N0YXRlX2lkeCA9PSBpKSA/ICcqJyA6ICcgJywgaSwKKyAg
ICAgICAgICAgICAgIHBvd2VyLT5zdGF0ZXNbaV0udHlwZSwgcG93ZXItPnN0YXRlc1tpXS5sYXRl
bmN5LCB1c2FnZVtpXSwKKyAgICAgICAgICAgICAgIGFjcGlfY3N0YXRlX21ldGhvZF9uYW1lW3Bv
d2VyLT5zdGF0ZXNbaV0uZW50cnlfbWV0aG9kXSwKKyAgICAgICAgICAgICAgIHRpY2tfdG9fbnMo
cmVzX3RpY2tbaV0pKTsKICAgICB9Ci0gICAgcHJpbnRrKChsYXN0X3N0YXRlX2lkeCA9PSAwKSA/
ICIgICAqIiA6ICIgICAgIik7Ci0gICAgcHJpbnRrKCJDMDpcdHVzYWdlWyUwOCJQUkl1NjQiXSBk
dXJhdGlvblslIlBSSXU2NCJdXG4iLAorICAgIHByaW50aygiICAgJWNDMDpcdHVzYWdlWyU4IlBS
SXU2NCJdIGR1cmF0aW9uWyUiUFJJdTY0Il1cbiIsCisgICAgICAgICAgIChsYXN0X3N0YXRlX2lk
eCA9PSAwKSA/ICcqJyA6ICcgJywKICAgICAgICAgICAgdXNhZ2VbMF0gKyBpZGxlX3VzYWdlLCBj
dXJyZW50X3N0aW1lIC0gaWRsZV9yZXMpOwogCiAgICAgcHJpbnRfaHdfcmVzaWRlbmNpZXMoY3B1
KTsKQEAgLTM1MSw2ICszNDYsNyBAQCBzdGF0aWMgdm9pZCBkdW1wX2N4KHVuc2lnbmVkIGNoYXIg
a2V5KQogICAgIHVuc2lnbmVkIGludCBjcHU7CiAKICAgICBwcmludGsoIiclYycgcHJlc3NlZCAt
PiBwcmludGluZyBBQ1BJIEN4IHN0cnVjdHVyZXNcbiIsIGtleSk7CisgICAgcHJpbnRrKCJtYXgg
Y3N0YXRlOiBDJXVcbiIsIG1heF9jc3RhdGUpOwogICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1ICgg
Y3B1ICkKICAgICB7CiAgICAgICAgIHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9wb3dlciAqcG93ZXIg
PSBwcm9jZXNzb3JfcG93ZXJzW2NwdV07CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

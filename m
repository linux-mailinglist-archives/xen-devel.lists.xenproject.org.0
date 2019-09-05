Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FAAABC8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 21:15:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5xBC-0002qI-HG; Thu, 05 Sep 2019 19:12:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oY4+=XA=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i5xBA-0002q8-V2
 for xen-devel@lists.xen.org; Thu, 05 Sep 2019 19:12:24 +0000
X-Inumbo-ID: 168cefdc-d011-11e9-abd9-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 168cefdc-d011-11e9-abd9-12813bfff9fa;
 Thu, 05 Sep 2019 19:12:22 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x85JBvma116753;
 Thu, 5 Sep 2019 19:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=pZjkRojZmeJbVrGkwERsU1y900DpsXm1kmbnjbnOeJE=;
 b=e57Mk3p3L+gxdlFye1E/Dmr756qd0EBh9NIPUtrhORdTshek2FfM4C0v1b8Y+Apde1Xq
 0OmAwdbVqVKp4kCQFApWBzJQyGTfP64fMFECPGkebcoiOVYoFP5qTdT98D8owy9XV8/b
 u4kpP/A6fEIYJQBuTym1tzg/7aIFEultq+txy0+PWqF2FeFT9KLDHApoWdLCSItSaYyC
 /kYTKoHxXm3wZBNTMBo0L4sC41ZNmNMqwc9NSLc7twgBzffluMVjFn7SdT5WaFNW5jQt
 M/2sR7jcDkqusYFJziVRLr4L7/Ar/xWW/3feWe5bWBU8rTnU8jtWfKtXYsqwigsAy41C Pg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2uu89e808q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Sep 2019 19:12:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x85J4Spk171441;
 Thu, 5 Sep 2019 19:12:05 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2utvr43dd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Sep 2019 19:12:05 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x85JC33x023592;
 Thu, 5 Sep 2019 19:12:03 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 05 Sep 2019 12:12:02 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id F34516A0101; Thu,  5 Sep 2019 15:13:45 -0400 (EDT)
Date: Thu, 5 Sep 2019 15:13:45 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190905191345.GA6846@char.us.oracle.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827084624.116917-1-wipawel@amazon.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9371
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909050177
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9371
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909050177
Subject: Re: [Xen-devel] [PATCH v2 00/12] livepatch: new features and fixes
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
Cc: Tim Deegan <tim@xen.org>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 xen-devel@lists.xen.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDg6NDY6MTJBTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBuZXcgZmVhdHVyZXMgdG8gdGhl
IGxpdmVwYXRjaCBmdW5jdGlvbmFsaXR5IGFzCj4gYnJpZWZseSBkaXNjdXNzZWQgZHVyaW5nIFhl
biBEZXZlbG9wZXIgU3VtbWl0IDIwMTk6IFthXSBhbmQgW2JdLgo+IEl0IGFsc28gcHJvdmlkZXMg
YSBmZXcgZml4ZXMgYW5kIHNvbWUgc21hbGwgaW1wcm92ZW1lbnRzLgo+IAo+IE1haW4gY2hhbmdl
cyBpbiB2MjoKPiAtIGFkZGVkIG5ldyBmZWF0dXJlcyB0byBsaXZlcGF0Y2ggZG9jdW1lbnRhdGlv
bgo+IC0gYWRkZWQgbGl2ZXBhdGNoIHRlc3RzCj4gLSBlbmFibGVkIEFybSBzdXBwb3J0IGZvciBb
NV0KPiAtIG1ha2UgLm1vZGluZm8gb3B0aW9uYWwgZm9yIFsxMV0KPiAtIGZpeGVkIHR5cG9zCgpJ
IHRvb2sgeW91ciBwYXRjaGVzLCByZWRpZCB0aGVtIHBlciB3aGF0IEkgaGFkIHJlc3BvbmRlZCBv
biB0aGVzZSBwYXRjaGVzCihhbmQgc3F1YXNoZWQgeW91ciBmaXggZm9yIHhlbl9leHBlY3RhdGlv
bnMpIGFuZCBzdHVjayB0aGVtIGluIG15IGJyYW5jaDoKCmh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPXBlb3BsZS9rb25yYWR3aWxrL3hlbi5naXQ7YT1zaG9ydGxvZztoPXJlZnMvaGVh
ZHMvbGl2ZXBhdGNoLmF3cy52MwoKVGhlcmUgYXJlIHRocmVlIGV4dHJhIHBhdGNoZXMgdGhhdCB3
ZXJlIG5lZWRlZCBmb3IgbWUgdG8gdGVzdCBvbiBBUk0zMiAtIHRob3NlCmFyZSBrbm93biBpc3N1
ZXMgYW5kIHRoZXkgZG9uJ3QgYmxvY2sgeW91ciBwYXRjaGVzLiBJIHdpbGwgcG9zdCB0aGVtIGlu
ZGVwZW5kZW50Cm9mIHlvdXIgcGF0Y2hlcy4KCkZyb20gbXkgcGVyc3BlY3RpdmUsIHlvdXIgcGF0
Y2hlcyBhcmUgZ29vZCB0byBnby4KCkJ1dCBJIGJlbGlldmUgSSBuZWVkOgogLSB0aGUgdG9vbHMg
Zm9sa3MgQWNrIG9uIHRoZSBsaWJ4YyBjb2RlIGNoYW5nZXMsCiAtIGFuZCBhbHNvIGFuIEFjayBm
cm9tIHRoZSBSRVNUIG9uIHN5c2N0bC5oLAogLSBhbmQgSnVsaWFuIE9LIG9uIHRoZSBBUk0zMi9B
Uk02NCBjb2RlIGNoYW5nZXMgd2hpY2ggYXJlIHRpbnksIGJ1dCBub25ldGhsZXNzIGFyZSBoaXMu
CgpQYXdlbCwgSWYgSSBkb24ndCBnZXQgdG8gc2VuZCB0aGVtIG91dCBieSB0aGUgZW5kIG9mIHRo
ZSBuZXh0IHdlZWsgLSBmZWVsIGZyZWUKdG8gZ3JhYiB0aGVtIGZyb20gbXkgYnJhbmNoIHRyZWUg
YW5kIHJlcG9zdCB0aGVtIGFzIHYzLgoKVGhhbmsgeW91IQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

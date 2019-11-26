Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578E10A372
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 18:38:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZel0-0004IM-Af; Tue, 26 Nov 2019 17:36:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xtMf=ZS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iZeky-0004IH-BX
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 17:36:08 +0000
X-Inumbo-ID: 394c441c-1073-11ea-a3a6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 394c441c-1073-11ea-a3a6-12813bfff9fa;
 Tue, 26 Nov 2019 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574789767;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=sTgSpVKEJfykIzn0LQ3ZotI5pXWeMcMsmLm0+nMrGKE=;
 b=Gf6Znnskow27v4/d5UdwWhf8hD0iJq09EcEM7HyUSjyAHJUY5fA7Z2ls
 F+VIiBvHaO4X236bI1HA+jeF4Z6IvYftnt4Fa6mx20lmT8tQvdXelF00S
 O3pRbkvYMbg+4MCmqkTYkbXXeCYkEcVONsFu7pCt6b9o6cpBwDjeCpe86 I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hTgpZoK4OtOf8dBrX8jgrF3F/eP4hKHXJaoSdEs3cSgX9qjjl6B+jOHVonLDn/n8JhzYIufdqv
 Zk/61zDr0kKW6ZdYcZ9jOVvqxcXwKsnK8wx1xmSjAs3n2JXSziVSj3mezIgQvkBMkJjDlAfJC1
 u/vlWpWpVZLzzUVacs3R4jukKQ4lRKdzAd8j8bcjQZF8UyJw48vIZXkz+i3yAiRegeitS0O+6w
 BZUnWu3TY0SzzKJgAQCEPAELNCR7OmoFl5XgESzzi4tqnWw5l8sZN8NlIWW2Df1i0HRvGyEh3z
 iY8=
X-SBRS: 2.7
X-MesageID: 8869751
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="8869751"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24029.25218.75565.126333@mariner.uk.xensource.com>
Date: Tue, 26 Nov 2019 17:36:02 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <20191126171747.3185988-2-george.dunlap@citrix.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Hans
 van Kranenburg <hans@knorrie.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTMgMi8yXSBSYXRpb25hbGl6ZSBt
YXhfZ3JhbnRfZnJhbWVzIGFuZCBtYXhfbWFwdHJhY2tfZnJhbWVzIGhhbmRsaW5nIik6Cj4gWGVu
IHVzZWQgdG8gaGF2ZSBzaW5nbGUsIHN5c3RlbS13aWRlIGxpbWl0cyBmb3IgdGhlIG51bWJlciBv
ZiBncmFudAo+IGZyYW1lcyBhbmQgbWFwdHJhY2sgZnJhbWVzIGEgZ3Vlc3Qgd2FzIGFsbG93ZWQg
dG8gY3JlYXRlLiAgSW5jcmVhc2luZwo+IG9yIGRlY3JlYXNpbmcgdGhpcyBzaW5nbGUgbGltaXQg
b24gdGhlIFhlbiBjb21tYW5kLWxpbmUgd291bGQgY2hhbmdlCj4gdGhlIGxpbWl0IGZvciBhbGwg
Z3Vlc3RzIG9uIHRoZSBzeXN0ZW0uCgpJZiBJIGFtIG5vdCBtaXN0YWtlbiwgdGhpcyBpcyBhbiBp
bXBvcnRhbnQgY2hhbmdlIHRvIGhhdmUuCgpJIGhhdmUgc2VlbiByZXBvcnRzIG9mIHVzZXJzIHdo
byByYW4gb3V0IG9mIGdyYW50L21hcHRyYWNrIGZyYW1lcwpiZWNhdXNlIG9mIHVwZGF0ZXMgdG8g
dXNlIG11bHRpcmluZyBwcm90b2NvbHMgZXRjLiAgVGhlIGVycm9yIG1lc3NhZ2VzCmFyZSBub3Qg
dmVyeSBnb29kIGFuZCB0aGUgcmVjb21tZW5kZWQgd29ya2Fyb3VuZCBoYXMgYmVlbiB0byBpbmNy
ZWFzZQp0aGUgZGVmYXVsdCBsaW1pdCBvbiB0aGUgaHlwZXJ2aXNvciBjb21tYW5kIGxpbmUuCgpJ
dCBpcyBpbXBvcnRhbnQgdGhhdCB3ZSBkb24ndCBicmVhayB0aGF0IHdvcmthcm91bmQhCgpUaGFu
a3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

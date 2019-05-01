Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0210CCC
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 20:41:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLu76-0000Kx-RQ; Wed, 01 May 2019 18:37:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=546Y=TB=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hLu75-0000Kp-3n
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 18:37:51 +0000
X-Inumbo-ID: 38cd88c2-6c40-11e9-843c-bc764e045a96
Received: from mail-vk1-xa2f.google.com (unknown [2607:f8b0:4864:20::a2f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38cd88c2-6c40-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 18:37:50 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id r195so724129vke.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 11:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SSXFMBs3Vs9nMI2rGDV5fQeQHOTB0vY+kX8vWXPm1TM=;
 b=blTStX/hUbcZikCBfVqoW+HBXVEdAz7sxIHlVw9H2Y8+EeKZVZfXjgJ3aKpS8DUija
 SSmeIAViqmRqXsXfUHJCksNyqNoGdhY6CJxQ/3jhlRNyGEtmFoBcN+D5Y3PAArRXGpol
 ZNdnO7bvp/ayW7uprXcckFDr6qA/dxQZPi9GVvqG4jMxdu2pSDG/6glEzlWYmsD4a7w0
 N3YDqRwgDsDGDX69Ss7erg4+KjWEdndpcilK1g7WG8pruxTI1JL1pPqt4oriaFsqUO7V
 q41672zxMTCdyLrqjDUquNBS4TMWiYur7oa+SEd8FoTdLcwf8AmglCJF3L9b1OcYq+ux
 kZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SSXFMBs3Vs9nMI2rGDV5fQeQHOTB0vY+kX8vWXPm1TM=;
 b=O6mSdm1M+/rRy1WXD0fCbvy+MFF/XUxvE/v48lMN8Tc/bY3XHmDh5nDYZeQ77IwNgC
 DAOcgyFvP37VRhkcOqYt63qnzwPjP+gqrk87hjd0dyfnXerhoRIBnmdb4IGoWzYFeEFQ
 eKuzBhDFHY/OeJ1Bt3ljw1+gibaandHv7ZmbLI+4Bg6QjIGoaZ2Sq6ruGLrcMwDVo3JI
 mE7v+7B84xFw6vaWE2Gnx7HbAn1hjbLW3EhI8pbcvAQ0uV/NvTP7Ttf/jTnebifU3twc
 gh4VWGH8znf5ffA7cgz16rbhnpsU8OhgBV+OQr3rBpeSuy0uugja0VuR8gLaxaJCQTc6
 2Opw==
X-Gm-Message-State: APjAAAXEzEJgoCKwRSwumffkhJVkIgTJEXN3DrS3Yb1hUiUoj5ZjuF+1
 9jHP3bcyLM2dtESnvywvCXY=
X-Google-Smtp-Source: APXvYqxWR4wvyOopDQJ64XVsd/LV2idPiPx8N+HxhpreDnrRtVNb8uz7Q44cRwWCOXDE9sK7VDHsow==
X-Received: by 2002:a1f:a247:: with SMTP id l68mr38786447vke.32.1556735868972; 
 Wed, 01 May 2019 11:37:48 -0700 (PDT)
Received: from [192.168.0.101] (ip78-141-50-179.ct.co.cr. [179.50.141.78])
 by smtp.gmail.com with ESMTPSA id b80sm2437319vke.52.2019.05.01.11.37.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 11:37:48 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
In-Reply-To: <DB7FD117-5AFE-4D4E-8BA6-A08475E48923@gmail.com>
Date: Wed, 1 May 2019 12:37:44 -0600
Message-Id: <6C8757E6-5421-4082-81E1-C08CE7CEB992@xenproject.org>
References: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
 <DB7FD117-5AFE-4D4E-8BA6-A08475E48923@gmail.com>
To: Rich Persaud <persaur@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [VOTE] tagging for operational messages sent to
 xen-devel@ (was Re: Xen 4.13 Development Update)
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 'Jan Beulich' <JBeulich@suse.com>, Pu Wen <puwen@hygon.cn>,
 Luwei Kang <luwei.kang@intel.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmljaCwKYXMgbm9ib2R5IHJlcGxpZWQgdG8gdGhlIG1haWwsIEkgYW0gaW5jbGluZWQgdG8gZGlz
bWlzcyB0aGUgcHJvcG9zYWwgb2YgQU5OIGZvciBub3cKTGFycwoKPiBPbiAyNSBBcHIgMjAxOSwg
YXQgMTY6NTksIFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFpbC5jb20+IHdyb3RlOgo+IAo+PiBP
biBBcHIgMjUsIDIwMTksIGF0IDEyOjM2LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiAKPj4gQWxyaWdodCwKPj4gCj4+IHRoZXJlIHdhcyBhIGxlbmd0aHkgZGlz
Y3Vzc2lvbiBvbiB0aGlzIHRvcGljIG9uIElSQyAtIGxvZyBhdHRhY2hlZC4gVGhlIGNvbnNlbnN1
cyBhcHBlYXJzIHRvIGJlIHRvIHVzZSBDYW5vbmljYWwgbWVzc2FnZXMgd2l0aCBhIENBUElUQUxJ
U0VEIHRhZy4gRS5nLiAiW1RBR10gWGVuIDQuMTMgRGV2ZWxvcG1lbnQgVXBkYXRlIi4KPj4gCj4+
IFRoZSBvcHRpb25zIHdoaWNoIHNlZW1lZCB0byBoYXZlIGxlYXN0IG9iamVjdGlvbnMgYXJlCj4+
IDE6IFtBTk5PVU5DRV0KPj4gMjogW09QRVJBVElPTlNdIAo+PiAzOiBbUFJPQ0VTU10KPj4gCj4+
IEFuZCB0aGF0IHdlIHNob3VsZCB1c2UgdGhlc2UgZm9yIG90aGVyIG1lc3NhZ2VzL2Fubm91bmNl
bWVudHMgcmVsYXRlZCB0byB0aGUgb3BlcmF0aW9uIG9mIFhlbiBQcm9qZWN0IERldmVsb3BtZW50
Lgo+IAo+IE9uIG1vYmlsZSBkZXZpY2VzLCBzaG9ydGVyIHN1YmplY3RzIGFyZSBiZXR0ZXIuICBB
IFt4ZW4tZGV2ZWxdIGVtYWlsIGFscmVhZHkgaGFzIG9uZSAxMS1jaGFyYWN0ZXIgdGFnLiBTaW5j
ZSB0YWdzIGFyZSBpbiBDQVBJVEFMUywgYWJicmV2aWF0ZWQgdGFncyA9IGxlc3MgU0hPdXRpbmcu
Cj4gCj4+IFtEaXppZXRdIE9ubHkgYmVjYXVzZSB3ZSBjb3B5IGV2ZXJ5dGhpbmcgZnJvbSAtYW5u
b3VuY2UgdG8gLWRldmVsLgo+IAo+IFNvbWUgbWFpbGluZyBsaXN0cyB1c2UgW0FOTl0gZm9yIGFu
bm91bmNlbWVudHMuICBFbWFpbCBtaXJyb3JlZCB0byB4ZW4tZGV2ZWwgZnJvbSAtYW5ub3VuY2Ug
Y291bGQgcHJlZml4IHRoZSBbQU5OXSB0YWcsIHdoaWNoIHdvdWxkIG5vdCBiZSB1c2VkIGZvciBu
b24tbWlycm9yZWQgZW1haWwsIHNpbmNlIGFsbCBhbm5vdW5jZW1lbnRzIHdvdWxkIGJlIGRpcmVj
dGVkIHRvIC1hbm5vdW5jZS4KPiAKPj4gW2d3ZF0gQnV0IGluIG15IG1pbmQsIHRoaW5ncyBsaWtl
IFJNIHVwZGF0ZXMgKHdoaWNoIGhhcHBlbiBwcmV0dHkgcmVndWxhcmx5KSBhbmQgc2F5LCBEZXZl
bG9wZXIgU3VtbWl0IGFubm91bmNlbWVudHMsIGFyZSBkaWZmZXJlbnQgdGhpbmdzLgo+IAo+IFRo
ZSBtZXNzYWdlcyB3aGljaCBwcm9tcHRlZCB0aGlzIGRpc2N1c3Npb24gd2VyZSByZWxhdGVkIHRv
IHJlbGVhc2UgbWFuYWdlbWVudC4gIFRoZXNlIHdlcmUgY2FsbGVkIFJNIGluIHRoZSBJUkMgZGlz
Y3Vzc2lvbiwgd2hpY2ggc3VnZ2VzdHMgW1JNXSBhcyBhIHBvc3NpYmxlIHRhZy4gIEl0J3MgcXVp
Y2sgdG8gdHlwZSBhbmQgbm9uLWRpc3RyYWN0aW5nIHRvIHJlYWQuICBUaGlzIHdvdWxkIG5vdCBw
cmVjbHVkZSBvdGhlciB0YWdzIGZvciBub24gW1JNXSBtZXNzYWdlcy4KPiAKPiBSaWNoCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

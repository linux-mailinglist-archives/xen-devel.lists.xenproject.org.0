Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD31387B7
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jan 2020 19:30:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqhwY-0000W9-Ge; Sun, 12 Jan 2020 18:26:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kOYZ=3B=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iqhwX-0000W2-DL
 for xen-devel@lists.xen.org; Sun, 12 Jan 2020 18:26:33 +0000
X-Inumbo-ID: 0e91998c-3569-11ea-ac27-bc764e2007e4
Received: from mail-yw1-xc29.google.com (unknown [2607:f8b0:4864:20::c29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e91998c-3569-11ea-ac27-bc764e2007e4;
 Sun, 12 Jan 2020 18:26:32 +0000 (UTC)
Received: by mail-yw1-xc29.google.com with SMTP id 192so4285398ywy.0
 for <xen-devel@lists.xen.org>; Sun, 12 Jan 2020 10:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F1BprwwgJsXsPOnTpIveU/cls2/h6EBv0vZw4NQJrT0=;
 b=K921z6PWh3mnMkeKsfCWk9J1fVUEllot6KsYcfx6Z9BkT0+BoDD7uUZ9o2TvynV0gi
 D06mw8PJ6bLWMlxnjSj4ZkdgCjx2vMAXU68kK14390dCGY9VLMEfmPfAmgD0vs/PKnrb
 oCjh4uCmh55Kix+aVMKpckpTXJ7+wRDbHNDhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F1BprwwgJsXsPOnTpIveU/cls2/h6EBv0vZw4NQJrT0=;
 b=Dxn9rRrRuft6imhQDV6TvJq2Ta8vo6S+3zLOvHUxrmSnntfNDVP+Pt9XY33wej8c3A
 y6i276iXst3Yzy96IlsZUVRrplOUW76XwJM8Rqwmb13P26x1BjH8QJlYpPBQUBKVbQUw
 Kr2kLK0+yMT2a7rQKOFXcpScEtRdZ58JX4IfuhDdXNowVI20D4qWdqy1dD73HslHLQGe
 TRJweSFwO3xkhGdNczB0VwBWVufRD32xZ1IdCRv+0K5T4DstWQghHFBRmwze0Rza9nRT
 yc5YfVenpFBxabWsnqlbMY1tu5Hb+dXaNk99sbtnLSFR2JQeApI1JOKFnPaiat4hGAaK
 QShQ==
X-Gm-Message-State: APjAAAVmcoQ+Fho0w4a2iN+tYMbNQemfe/4JZqUo908cC3+Cq9mea9al
 CdCkgFHkHClDMgT2aqGkGdv3uA==
X-Google-Smtp-Source: APXvYqyzo6ZsP312dhyZhKsr/RHlrh7yDSvVCQlnu3dFchkYayFZaHib5RNvFDOlWizN2lY+fZcBEg==
X-Received: by 2002:a81:1201:: with SMTP id 1mr10603090yws.304.1578853591724; 
 Sun, 12 Jan 2020 10:26:31 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:9442:bd3b:678f:5645])
 by smtp.gmail.com with ESMTPSA id
 d137sm4073865ywd.86.2020.01.12.10.26.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 Jan 2020 10:26:31 -0800 (PST)
To: George Dunlap <George.Dunlap@citrix.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
 <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
Date: Sun, 12 Jan 2020 12:26:14 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xMS8yMCAzOjAyIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IAo+IAo+PiBPbiBKYW4g
MTEsIDIwMjAsIGF0IDQ6MDIgQU0sIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4g
d3JvdGU6Cj4+Cj4+Cj4+Cj4+IE9uIDEvMTAvMjAgNDozNyBBTSwgU2VyZ2V5IER5YXNsaSB3cm90
ZToKPj4+IEhpZGUgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbiB0aGF0IGNhbiBoZWxwIGlkZW50
aWZ5IHRoZSBydW5uaW5nIFhlbgo+Pj4gYmluYXJ5IHZlcnNpb246IFhFTlZFUl9leHRyYXZlcnNp
b24sIFhFTlZFUl9jb21waWxlX2luZm8sIFhFTlZFUl9jaGFuZ2VzZXQuCj4+PiBBZGQgZXhwbGlj
aXQgY2FzZXMgZm9yIFhFTlZFUl9jb21tYW5kbGluZSBhbmQgWEVOVkVSX2J1aWxkX2lkIGFzIHdl
bGwuCj4+PiBJbnRyb2R1Y2UgeHNtX2ZpbHRlcl9kZW5pZWQoKSB0byBodm1sb2FkZXIgdG8gcmVt
b3ZlICI8ZGVuaWVkPiIgc3RyaW5nCj4+PiBmcm9tIGd1ZXN0J3MgRE1JIHRhYmxlcyB0aGF0IG90
aGVyd2lzZSB3b3VsZCBiZSBzaG93biBpbiB0b29scyBsaWtlCj4+PiBkbWlkZWNvZGUuCj4+PiBT
aWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4+
PiAtLS0KPj4+IHYxIC0tPiB2MjoKPj4+IC0gQWRkZWQgeHNtX2ZpbHRlcl9kZW5pZWQoKSB0byBo
dm1sb2FkZXIgaW5zdGVhZCBvZiBtb2RpZnlpbmcgeGVuX2RlbnkoKQo+Pgo+PiBTbyAxMDAlIHRo
aXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggd29uJ3QgZmx5IHdpdGggdGhlIHZhcmlvdXMgZG93bnN0
cmVhbXMgdGhhdCBydW4gdGhlIHYxIG9mIHRoaXMgcGF0Y2guIFRob3NlIHZhcmlvdXMgY29uc3Vt
ZXJzIHdpbGwgc3RpY2sgd2l0aCB2MS4KPj4KPj4gSWYgdGhlIGdvYWwgb2YgdGhpcyBpcyB0byBy
ZWR1Y2UgdGhlIGJ1cmRlbiBvZiB0aGUgZG93bnN0cmVhbXMgYW5kIHRoZWlyIGN1c3RvbWVycyB0
byBjYXJyeSBhIHBhdGNoIGFnYWluc3QgWGVuIHRoZW4gSSB3b3VsZG4ndCBldmVuIGJvdGhlciB3
aXRoIHRoaXMgdmVyc2lvbi4KPiAKPiBJZiB0aGUgZ29hbCBpcyB0byBjb21lIHVwIHdpdGggYSBz
b2x1dGlvbiB0aGF0IHdvcmtzIGZvciBldmVyeW9uZSwgaXQgd291bGQgYmUgaGVscGZ1bCBpZiB5
b3Ugc2FpZCAqd2h5KiDigJx2YXJpb3VzIGNvbnN1bWVyc+KAnSB3b3VsZCBmaW5kIHRoaXMgcGF0
Y2ggdW5hY2NlcHRhYmxlOyBhbmQgYWxzbyB3aGF0IHRoZXkgbWlnaHQgdGhpbmsgYWJvdXQgdGhl
IGFsdGVybmF0ZSBzb2x1dGlvbnMgcHJvcG9zZWQgKGFuZCB3aHkpLgo+IAo+ICAgLUdlb3JnZQo+
IAoKSSdkIGJlIGhhcHB5IGlmIHdlIGhhZCBhIEtjb25maWcgb3B0aW9uIGJlaGluZCB3aGF0IHRo
ZSBzdHJpbmcgaXMuIEdpdmUgCm1lIGEgYmxhbmsgYXMgYW4gb3B0aW9uIGJ1dCBkZWZhdWx0IGl0
IHRvIHdoYXRldmVyIHN0cmluZyBsaWtlIAoiPGhpZGRlbj4iIHRoYXQgeW91J2QgbGlrZS4gRXZl
cnkgc2hpcHBpbmcgWGVuIGRpc3RybyBJJ3ZlIHdvcmtlZCBvbiBoYXMgCmhhZCBpdHMgb3duIHYx
IHZhcmlhbnQgb2YgdGhlIHBhdGNoIGFuZCBub25lIG9mIHRoZW0gYXV0aG9yZWQgYnkgbWUuCgpY
ZW4gaXMgYSBiaXQgdW5pcXVlIGluIHRoZSBzb2Z0d2FyZSB3b3JsZCBhcyBtb3N0IHBpZWNlcyBv
ZiBzb2Z0d2FyZSAKYXJlbid0IHJ1biBpbiBhbiAiYWR2ZXJzYXJpYWwiIGVudmlyb25tZW50LiBM
b29rIGF0IGFueSBtdWx0aS10ZW5hbnQgCmNsb3VkIHByb3ZpZGVyLiBUaGVyZSdzIGNvbnRpbnVh
bGx5IGJhZCBhY3RvcnMgdGhhdCBhcmUgY3JlYXRpbmcgVk1zIGFuZCAKcHJvYmluZyB5b3VyIHN5
c3RlbSBjb25maWd1cmF0aW9ucyBhbmQgYXR0ZW1wdGluZyB0byBidWlsZCBhIApmaW5nZXJwcmlu
dGluZyB0ZWNobmlxdWUgdG8gaWRlbnRpZnkgZXhwbG9pdGFibGUgc3lzdGVtcyB2cyBub3QgCmV4
cGxvaXRhYmxlIHN5c3RlbXMuIE1hbnkgc2VjdXJpdHkgaXNzdWVzIGFyZSBkcm9wcGVkIG9uIHBy
b3ZpZGVycyAKd2l0aG91dCBhZGVxdWF0ZSB0aW1lIHRvIHBhdGNoIGFsbCB0aGUgc3lzdGVtcyBw
cmlvciB0byBhIGRpc2Nsb3N1cmUuIApMb29rIGF0IHN5c3RlbXMgbGlrZSBPcGVuWFQsIFNlY3Vy
ZVZpZXcgYW5kIFF1YmVzIHdoZXJlIHRoZSB1c2VycyBvZiAKdGhlc2Ugc3lzdGVtcyBkb24ndCBu
ZWNlc3NhcmlseSB1cGRhdGUgdG8gdGhlIGxhdGVzdCBmaXggaW1tZWRpYXRlbHkuCgpOb3cgSSBr
bm93IHNvbWVvbmUgaXMgZ29pbmcgdG8gcmVhZCB0aGlzIGFuZCBzYXkgIkxvb2sgYXQgRG91ZyBh
bmQgaGltIAphZHZvY2F0aW5nIGZvciBzZWN1cml0eSB0aHJvdWdoIG9ic2N1cml0eSIuIEJ1dCB0
aGF0J3Mgc2ltcGx5IG5vdCB0aGUgCmNhc2UuIFRoZSBwb2ludCBpcyBhbnl0aGluZyB0aGF0IGNh
biBiZSB1c2VkIHRvIGZpbmdlcnByaW50IGEgc3lzdGVtIAplYXNpbHkgYW5kIHRhcmdldCBhbiBh
dHRhY2sgYWdhaW5zdCB0aGF0IHN5c3RlbSBpcyB2ZXJ5IGRpZmZlcmVudCBmcm9tIApzYXlpbmcg
bXkgaW50ZXJmYWNlcyBhcmUgc2VjdXJlIGJlY2F1c2UgSSBkb24ndCBwdWJsaXNoIHRoZSBzcGVj
LiBXaGVuIAphdHRhY2tlcnMgYXJlIGZvcmNlZCB0byBwcm9iZSBhIHN5c3RlbSBpdCByZXN1bHRz
IGluIGFuIG9wcG9ydHVuaXR5IHRvIAppZGVudGl0eSB0aGF0IGJlaGF2aW9yIGFuZCB0YWtlIGFj
dGlvbi4KCkknbGwganVzdCBlbmQgc2F5aW5nIHRoYXQgc3RyaXBwaW5nIGluZm9ybWF0aW9uIGlu
IGRvbTAgZnJvbSB0aGUgZG9tVSAKaGFzIG5vdCBiZWVuIGNvbnNpZGVyZWQgYWNjZXB0YWJsZSBp
biB2YXJpb3VzIGNpcmNsZXMgYmVjYXVzZSBpdCBjaGFuZ2VzIAp0aGUgc3RhbmNlIGZyb20gIkl0
IGlzIG5vdCBwb3NzaWJsZSB0byBsZWFrIHRoaXMgZGF0YSIgdG8gIlRoaXMgZGF0YSAKY2Fubm90
IGxlYWsgaWYgYWN0aW9uIFggaGFwcGVucyBjb3JyZWN0bHkiLiBXaGljaCB0aGVuIHJlcXVpcmVz
IHRlc3RzIAphbmQgZG9jdW1lbnRhdGlvbiB0byBzaG93IHRoYXQgaXQgaXMgbm90IHBvc3NpYmxl
IHRvIGxlYWsuCgpVbHRpbWF0ZWx5IG15IHBvaW50IGlzIGlmIHRoZSBnb2FsIG9mIHRoaXMgcGF0
Y2ggaXMgdG8gdXBzdHJlYW0gYSBwYXRjaCAKdGhhdCdzIGNhcnJpZWQgYnkgdmFyaW91cyBkb3du
c3RyZWFtcywgd2h5IG5vdCBhY3R1YWxseSBsaXN0ZW4gdG8gd2hhdCAKY2F1c2VkIHRoZW0gdG8g
d3JpdGUgdGhlIHBhdGNoPyBJbiB5b3VyIG90aGVyIGVtYWlsIHlvdSB0YWxrIGFib3V0IApkZXZl
bG9wZXJzIGJlaW5nIGNvbmNlcm5lZCBhYm91dCB0cmFjaW5nIHRoZSBidWlsZCBvZiBYZW4gb3Ig
aWYgdGhleSAKYnVpbHQgaXQgd3JvbmcuIEluIHRoZSBjYXNlcyBJJ20gdGFsa2luZyBhYm91dCB0
aGVyZSdzIGxpdGVyYWxseSAwIApjb25jZXJuIGZvciB0aGF0LiBUaGUgYnVpbGQgb2YgWGVuIGlz
IGNhcHR1cmVkIHZlcnkgd2VsbCBhcyBhbiBhcnRpZmFjdCAKb2YgdGhlIGRlcGxveW1lbnQgYW5k
IGNlcnRpZmljYXRpb24gb2YgdGhhdCBidWlsZC4gVGhlIGRldmVsb3BlcnMgb2YgCnRoYXQgYnVp
bGQgb2YgWGVuIGtub3cgZXhhY3RseSB0aGUgcmV2aXNpb24gdGhhdCB0aGUgc3BlY2lmaWMgc3lz
dGVtIGlzIAp1c2luZyBhbmQgd2hlbiB0aGV5IHJlY2VpdmUgaW5mb3JtYXRpb24gdGhleSBjYW4g
Z28gcmlnaHQgdG8gdGhhdCByZXZpc2lvbi4KCi0tCkRvdWcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3117EE13
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 09:54:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htSKF-0008KO-U7; Fri, 02 Aug 2019 07:50:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bRuE=V6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1htSKF-0008KJ-Ab
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 07:50:07 +0000
X-Inumbo-ID: 23d93097-b4fa-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23d93097-b4fa-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 07:50:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k18so71919106ljc.11
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1+nDH53a3Uy1d3vsKKgH1Z4HjvDMm8Oh0lW+LxI8Y+M=;
 b=f4JrSF/UYRvvk6xaRMYqRKen4Ju8kfYdxldFacyU1dKvDNBuGRGOBhB98rL0t/Z8tf
 yjov/NBW4HF9EQ3GrDxrygo45nJsRCIUF2eC0/kXz31S7JTh5k7wxuL/obscjdkVUKWe
 jZhy/w008PETRkU2ET0UP88Jnuf9A3RTAGuyvsHFfuzmeVhxCmxwt1iwEctm6thjO1kw
 oEe4kp7YY5A25PWVH+nNBfclRT6Pab5oPuTvhTPC13D2nrVYRg7OTlQmJI4AuTw24U8m
 TlpEljJobJ++bcytTyg1NpWL6ZG+88FGBBiRICIv/yZ2d4PofTf5S9FYSIA1FAe7KVmt
 r0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1+nDH53a3Uy1d3vsKKgH1Z4HjvDMm8Oh0lW+LxI8Y+M=;
 b=sr58Uh3g+C4LdlaxUMzP1KJUhkJ5hz9n8kOwqouH9alsT5OJklHg8nnlCT1OE5Ktq3
 QmPlW6uJ0HSgX/Dcyh+UEFFg0iViDmWZbPcCJboN3UCEIalPXxpyzSw813wmFe3zFfFd
 4gMRF6oqee+8PhAIUowFHSoSy5ivtKLScAFwMQrH2D5YIYXpyyK2ODP1A/a5RdqnGsvP
 +QIkbuNHL8s1F2gsmfW5tTV+8YZ3D8x9PkLAmhcxI0O+ewPRjxvJXoLhOpstV6HxMxfi
 jUav3ABvUma/hn8tNZ8zllQcBivSaVnEuFR37BG4gwYG5FExh2EAFzlPmhObzFndyd54
 nmuw==
X-Gm-Message-State: APjAAAVdBvmGW66u5JuhMSUexHHsPRwkpZ1oBJmxJzVNtMrxf65NI6a0
 WHEatKNh/+3Sa83esHtP9+g=
X-Google-Smtp-Source: APXvYqz/FS6RncsVIe0qgYg5UJxzSE6aM+cLCsB9XyCK2Ehzwbi8MPrV9vDLycBEiwArVx1olWL/Gw==
X-Received: by 2002:a2e:834e:: with SMTP id l14mr24533377ljh.158.1564732204039; 
 Fri, 02 Aug 2019 00:50:04 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 u9sm12670140lfb.38.2019.08.02.00.50.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 00:50:03 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, 
 xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
Date: Fri, 2 Aug 2019 10:50:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gRGFyaW8KCk9uIDAxLjA4LjE5IDE0OjE5LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBP
biBUaHUsIDIwMTktMDgtMDEgYXQgMDk6NDUgKzAzMDAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+
IEhlbGxvIEp1bGllbiwKPj4KPj4gT24gMzAuMDcuMTkgMjM6MTAsIEp1bGllbiBHcmFsbCB3cm90
ZToKPj4KPj4+PiBJbiB0aGlzIHNlcmllcyBJIHRoaW5rIEkgbmVlZCBpbnRlcnJ1cHRzIGxvY2tl
ZCB1bnRpbCBJIHN0YXJ0Cj4+Pj4gdGltZSBhY2NvdW50aW5nIGZvciBoeXBlcnZpc29yLiBUaW1l
IGFjY291bnRpbmcgaXMgc3RhcnRlZCBieQo+Pj4+IGB0YWNjX2hlYWQoKWAgZnVuY3Rpb24uIEkg
cHJlZmVyIHRvIGhhdmUgaXQgY2FsbGVkIGZyb20gQywKPj4+PiBiZWNhdXNlIGl0IGlzIG1vcmUg
Y29udmVuaWVudCBhbmQgb2J2aW91cyBmb3IgdGhvc2Ugd2hvIGFyZSBsZXNzCj4+Pj4gZmFtaWxp
YXIgd2l0aCB0aGUgQVJNIGNvZGUuCj4+Cj4+IEhlcmUgaXMgdGhlIHF1ZXN0aW9uIHRvIHlvdTog
d2hhdCBpcyB0aGUgYmVzdCBwbGFjZSAoYW5kIHdheSkgdG8KPj4gc3RhcnQgaHlwZXJ2aXNvciB0
aW1lIHRyYWNraW5nPwo+Pgo+IFRoaXMgaXMgYWN0dWFsbHkgcXVpdGUgYW4gaW1wb3J0YW50IHF1
ZXN0aW9uLi4uIEFuZCBJJ2QgbGlrZSB0byB0aHJvdwo+IGl0IGJhY2sgYXQgeW91IChBbmRyaWkp
ISA6LUQgOi1QIDotKQoKQXQgdGhpcyBzZXJpZXMgSSBzdGFydCB0aW1lIGFjY291bnRpbmcgZm9y
IGh5cGVydmlzb3IgYWZ0ZXIgdGhlIHRyYXAsIGJlZm9yZSBpbnRlcnJ1cHRzIGJlaW5nIGVuYWJs
ZWQuIEl0IGlzIGRvbmUgZm9yIGFsbCB0cmFwcyBleGNlcHQgc3luY2hyb25vdXMgdHJhcHMgZnJv
bSBndWVzdCwgd2hhdCBhcmUgaHlwZWNhbGxzIGFuZCBpbyBlbXVsYXRpb24uIEZvciBzeW5jaHJv
bm91cyB0cmFwcywgSSBzdGFydCBoeXAgYWNjb3VudGluZyBhZnRlciB0aGUgZ3Vlc3QncyByZXF1
ZXN0IGhhcyBiZWVuIHNlcnZlZCwgYW5kIHdlIHN0YXJ0IHNvZnRpcnEgcHJvY2Vzc2luZyAoYWN0
dWFsbHkgYWxsIHRoZSBzdHVmZiBgbGVhdmVfaHlwZXJ2aXNvcl90YWlsKClgIGRvZXMpLiBJIGJl
bGlldmUgaXQgc2hvdWxkIGJlIHNvLgoKPiBJbiBmYWN0LCBJIHdhcyBhYm91dCB0byBhc2sgbXlz
ZWxmIHNvbWV0aGluZyBzaW1pbGFyLCBzdWNoIGFzLCBjYW4gd2UKPiB0YWtlIGEgYml0IG9mIGEg
c3RlcCBiYWNrIGFuZCBkZWZpbmU6Cj4gCj4gLSB3aGF0J3MgdGhlLCBsZXQncyBzYXksIGFjY291
bnRpbmcgZ3JhbnVsYXJpdHkgd2Ugd2FudD8gIkp1c3QiIGd1ZXN0Cj4gYW5kIGh5cGVydmlzb3I/
IE9yIG1vcmUgZmluZSBncmFpbmVkPwoKQXMgZm9yIG1lIGh5cGVydmlzb3IvZ3Vlc3QvaWRsZSBp
cyBxdWl0ZSBmaW5lIGdyYW51bGFyaXR5IGZvciB0aGUgYmVnaW5uaW5nLgpTdWNoIGFwcHJvYWNo
IG1pZ2h0IGJlIGVub3VnaCB0byBpbXBsZW1lbnQgZmFpciB0aW1lIGFjY291bnRpbmcuCllldCB3
ZSBtaWdodCBuZWVkIHNvbWV0aGluZyBtb3JlIHNvcGhpc3RpY2F0ZWQgZm9yIFJUIHNjaGVkdWxp
bmcuIEUuZy4gZ3Vlc3QncyBJUlEgdGltZSB0cmFja2luZywgdG8gbm90IGxldCBzb21lIGd1ZXN0
IHRvIHNwYW0gdGhlIHN5c3RlbSB3aXRoIGl0cyBJUlFzLgoKPiAtIGFzc3VtaW5nIHdlICJqdXN0
IiB3YW50IGh5cGVydmlzb3IgYW5kIGd1ZXN0LCB3aGljaCBhcmUgdGhlCj4gZXZlbnRzL3R1cm5p
bmcgcG9pbnRzIGF0IHdoaWNoIHdlIHNob3VsZCBzd2l0Y2ggInRpbWluZyBhY2NvdW50aW5nCj4g
YnVja2V0Ij8gQ2FuIHdlIG1ha2UgYSBsaXN0Pwo+IEFuZCBJJ2QgYmUgZmluZSBmb3Igc3VjaCBs
aXN0IHRvIGJlIGdlbmVyaWMsIGluIHRoZSBmaXJzdCBwbGFjZSAoZS5nLiwKPiBoeXBlcmNhbGws
IElSUSwgZXRjKS4uLiBUaGVuIHdlJ2xsIHR1cm4gdGhlIGVudHJpZXMgaW50byBhY3R1YWwKPiBs
b2NhdGlvbnMgaW4gdGhlIGNvZGUsIGFzIGEgc2Vjb25kIHN0ZXAuCgoKSSBjYW4gbWFrZSBzdWNo
IGEgbGlzdCwgaG93IGl0IGlzIGRvbmUgaW4gdGhpcyBzZXJpZXM6CgpHdWVzdCAtW2FzeW5jIHRy
YXAgKElSUSldLT4gSHlwIDogc3dpdGNoIHRvIGh5cCB0aW1lIGFjY291bnRpbmcKR3Vlc3QgLVtz
eW5jIHRyYXAgKGh5cGVyY2FsbCwgaW8gZW11bGF0aW9uKV0tPiBIWVAgOiBzd2l0Y2ggdG8gaHlw
IHRpbWUgYWNjb3VudGluZyAqYWZ0ZXIqIHNlcnZpbmcgc3luYyB0cmFwIChoeXBlcmNhbGwsIGlv
IGVtdWxhdGlvbikKCkh5cCAtW2FueSB0cmFwXS0+IEh5cCA6IGlmICh0cmFwcGVkIGZyb20gZ3Vl
c3Qgc3luYyB0cmFwIHNlcnZpbmcpIHRoZW4ge3N3aXRjaCB0byBoeXAgdGltZSBhY2NvdW50aW5n
fQpIeXAgLVtyZXR1cm4gZnJvbSB0cmFwXS0+IEh5cCA6IGlmIChyZXR1cm5pbmcgdG8gZ3Vlc3Qg
c3luYyB0cmFwIHNlcnZpbmcpIHRoZW4ge3N3aXRjaCB0byBndWVzdCB0aW1lIGFjY291bnRpbmd9
CgpIeXAgLVtyZXR1cm4gZnJvbSB0cmFwXS0+IEd1ZXN0IDogc3dpdGNoIHRvIGd1ZXN0IHRpbWUg
YWNjb3VudGluZwoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

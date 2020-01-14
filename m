Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37A013B3E7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 22:00:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irTGc-0002VO-4H; Tue, 14 Jan 2020 20:58:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irTGb-0002VJ-1T
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 20:58:25 +0000
X-Inumbo-ID: 9a71d7e8-3710-11ea-846f-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a71d7e8-3710-11ea-846f-12813bfff9fa;
 Tue, 14 Jan 2020 20:58:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so13579197wrl.13
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 12:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5YqkNoSZgxNkFsK00MTTs//5XtQ6HrQwv6ykvRKBJBk=;
 b=mf0DAtxrBIgZqbVgaEMVFCo0LqrP3OjswOZdTpPcs2kyDMAR6L5KOQIKyL+50W+3lI
 IJ00XDxL4lihiDyvycQpXYc9xUXDfO0WU4Y0msSB2HUtSgAooEnXxUNj9yoBUzWuXN+T
 xKV8hA8wpmHgZlpMR8Blf+ZtAFnuXjZgGZ0d1vdERCmBuqHLO9vxFZqrhMoyfsEZ9vlO
 qbiSTqFRjMhA1FKuEyN+hI2fPqKTmZ7jHtlUVXRyshFK9lGASvW8RP29ucW46RZvbg/Y
 RHmAJ5cKUiv0ZLu5xnGwDHVHDdfGC3wWloSVOq1t6fyqfcwFUUGpoAJ2MrVq3wwzcRRp
 g+SA==
X-Gm-Message-State: APjAAAXQ5e0NN7OV2k//ZET8TKJEzozbPDZFZt8NQO8cKhPjHvX8UBXl
 WUqAJFiXOJtBd7Bt5NANqm0=
X-Google-Smtp-Source: APXvYqykNH5dfrdxy5e8T0/iOTipbhg1pjcqmgSssfbPm/ghSGUNBB1rtaYDys2MOfLXujYIcQ9E3Q==
X-Received: by 2002:a05:6000:1052:: with SMTP id
 c18mr27113067wrx.268.1579035503435; 
 Tue, 14 Jan 2020 12:58:23 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id q68sm21684590wme.14.2020.01.14.12.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 12:58:22 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200114203545.8897-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <47ce51b9-3712-5976-0743-06161b65d3a8@xen.org>
Date: Tue, 14 Jan 2020 20:58:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200114203545.8897-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/list: Remove prefetching
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC8wMS8yMDIwIDIwOjM1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFhlbiBpbmhlcml0
ZWQgaXRzIGxpc3QgaW5mcmFzdHJ1Y3R1cmUgZnJvbSBMaW51eC4gIE9uZSBhcmVhIHdoZXJlIGhh
cyBmYWxsZW4KPiBiZWhpbmQgaXMgdGhhdCBvZiBwcmVmZXRjaGluZywgd2hpY2ggYXMgaXQgdHVy
bnMgb3V0IGlzIGEgcGVyZm9ybWFuY2UgcGVuYWx0eQo+IGluIG1vc3QgY2FzZXMuCj4gCj4gUHJl
ZmV0Y2ggb2YgTlVMTCBvbiB4ODYgaXMgbm93IHdpZGVseSBtZWFzdXJlZCB0byBoYXZlIGdsYWNp
YWwgcGVyZm9ybWFuY2UKPiBwcm9wZXJ0aWVzLCBhbmQgd2lsbCB1bmNvbmRpdGlvbmFsbHkgaGl0
IG9uIGV2ZXJ5IGhsaXN0IHVzZSBkdWUgdG8gdGhlCj4gdGVybWluYXRpb24gY29uZGl0aW9uLgo+
IAo+IENyb3NzLXBvcnQgdGhlIGZvbGxvd2luZyBMaW51eCBwYXRjaGVzOgo+IAo+ICAgIDc1ZDY1
YTQyNWMgKDIwMTEpICJobGlzdDogcmVtb3ZlIHNvZnR3YXJlIHByZWZldGNoaW5nIGluIGhsaXN0
IGl0ZXJhdG9ycyIKPiAgICBlNjZlZWQ2NTFmICgyMDExKSAibGlzdDogcmVtb3ZlIHByZWZldGNo
aW5nIGZyb20gcmVndWxhciBsaXN0IGl0ZXJhdG9ycyIKPiAgICBjMGQxNWNjN2VlICgyMDEzKSAi
bGlua2VkLWxpc3Q6IFJlbW92ZSBfX2xpc3RfZm9yX2VhY2giCj4gCj4gdG8gWGVuLCB3aGljaCBy
ZXN1bHRzIGluIHRoZSBmb2xsb3dpbmcgbmV0IGRpZmZzdGF0IG9uIHg4NjoKPiAKPiAgICBhZGQv
cmVtb3ZlOiAwLzEgZ3Jvdy9zaHJpbms6IDI3LzgzIHVwL2Rvd246IDU3Ni8tMTY0OCAoLTEwNzIp
Cj4gCj4gKFRoZSBjb2RlIGFkZGl0aW9ucyBjb21lcyBmcm9tIGEgZmV3IG5vdy1pbmxpbmVkIGZ1
bmN0aW9ucywgYW5kIHNsaWdodGx5Cj4gZGlmZmVyZW50IGJhc2ljIGJsb2NrIHBhZGRpbmcuKQo+
IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAA2179267
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:36:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9V6Y-0005NH-Iy; Wed, 04 Mar 2020 14:34:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/75R=4V=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9V6W-0005NC-Go
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:34:32 +0000
X-Inumbo-ID: 427ce9d8-5e25-11ea-a3f8-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 427ce9d8-5e25-11ea-a3f8-12813bfff9fa;
 Wed, 04 Mar 2020 14:34:31 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id g19so2540762eds.11
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 06:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZZOdGFHVxDGuX9ovujg8HEQtN1lAp8tOVYW+nOo91Ms=;
 b=NvD9VSRc8ydmAXpsnSPYkmotnPpIv0/7k76bfsCu0dGX/4/ulOgAuz750ziG18nmQX
 s4G731aXmM6WSzYKdfFrB2qNs+hhnTSz0yJYKOqurZd7z4JIiWgzsaJN6Lo5UXffNbeA
 gEvBnjb+75C/C7Gn0fuSzuz84v0wz7ljNJveOjwDIOgH7WTAFLI9Oh2IGkTlPJ5QzJi8
 B3LZShV6IpdrbLYDPlZfd48+tSfnUscaAK9uEytp4TDJNxxKGZIZABmRkSZfGj8FJTUX
 yxTTVS7pBeputKgQK8IqEc4CVtvvhD75MV91A1N9yupNWjlfC8X+xu23L10andZ3bH+0
 +m/g==
X-Gm-Message-State: ANhLgQ2UtVAqlv9KDGbpNhMXFSKmXKZohchxJwn8K/dBeBuc8zECzym+
 WW0SnlSClJtytsG6uUOI7lQ=
X-Google-Smtp-Source: ADFU+vsVnNGHP6JOhsSqPMFtIRVvhRSvUwt2Y2xgn19QZvekArj1HN53oPqzfDFqjQV934nFYo6mBA==
X-Received: by 2002:a17:906:e091:: with SMTP id
 gh17mr2722525ejb.269.1583332470701; 
 Wed, 04 Mar 2020 06:34:30 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id ha6sm114231ejb.69.2020.03.04.06.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 06:34:30 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <18d23419-2a46-4aaa-4bf5-0485aceba026@xen.org>
Date: Wed, 4 Mar 2020 14:34:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 0/5] IOMMU: restrict visibility/scope if
 certain variables
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Paul Durrant <pdurrant@amzn.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKQWRkaW5nIFBhdWwgaW4gQ0MgYXMgaGUgbm93IGNvLW1haW50YWluIHRoZSBJT01N
VSBjb2RlLgoKCk9uIDI4LzAyLzIwMjAgMTI6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEEgbnVt
YmVyIG9mIHRoZSBjb21tYW5kIGxpbmUgY29udHJvbGxlZCB2YXJpYWJsZXMgYXJlIHg4Ni0KPiBv
ciBldmVuIHg4Ni1IVk0tc3BlY2lmaWMuIERvbid0IGhhdmUgdGhvc2UgdmFyaWFibGVzIGVsc2V3
aGVyZQo+IGluIHRoZSBmaXJzdCBwbGFjZSAoaW4gc29tZSBjYXNlcyByZXBsYWNlIHRoZW0gYnkg
YSAjZGVmaW5lKSwKPiBhbmQgYXMgYSByZXN1bHQgYWxzbyBkb24ndCBzaWxlbnRseSBhY2NlcHQg
c3VjaCAiaW9tbXU9Igo+IHN1Yi1vcHRpb25zIHdoaWNoIGluIGZhY3QgaGF2ZSBubyBlZmZlY3Qu
CgpJIGNhbiBjb25maXJtIHRoYXQgYWxsIHRoZSBwYXJhbWV0ZXJzIGxpc3RlZCBiZWxvdyBhcmUg
bm90IHVzZWQgb24gQXJtLgoKPiAKPiAxOiBpb21tdV9pbnRyZW1hcCBpcyB4ODYtb25seQo+IDI6
IGlvbW11X2ludHBvc3QgaXMgeDg2L0hWTS1vbmx5Cj4gMzogaW9tbXVfaWdmeCBpcyB4ODYtb25s
eQo+IDQ6IGlvbW11X3FpbnZhbCBpcyB4ODYtb25seQo+IDU6IGlvbW11X3Nub29wIGlzIHg4Ni9I
Vk0tb25seQo+IAo+IFRoZSBzZXJpZXMgY29udGV4dHVhbGx5IGRlcGVuZHMgb24gIkFNRC9JT01N
VTogd2l0aG91dCBYVCwKPiB4MkFQSUMgbmVlZHMgdG8gYmUgZm9yY2VkIGludG8gcGh5c2ljYWwg
bW9kZSIKPiAKPiBKYW4KPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4E17BE36
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:24:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACw3-0003Id-Q8; Fri, 06 Mar 2020 13:22:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jACw1-0003IY-JS
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:22:37 +0000
X-Inumbo-ID: 8ba6aae8-5fad-11ea-b52f-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ba6aae8-5fad-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 13:22:37 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id cq8so2511989edb.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=iuqSPWj4HM5xY2iBcSCcXj3DXzbW+xtr+HnEVbvqrzg=;
 b=LWM6iLe+wsByu8AypWhJ7cf0tXiq8nr70HypuoNkhZQfq9XFMhPu+adSQXv/a2cPN5
 Ho/qvyREYYRXv3fzVU59z8R8z0AbaIgSpEMFqAT1877QuwWntIsqQdN8F5cG6ey7wjRO
 NsIQFeIiuLHRqScdw4Fe5urJTG1XpokUPX1TarWM/mVTHg4S2c3T/0EFX393LnbLX9Ra
 n51KkUKb2h445UHM7PFvVq1uE8m1LGsc99IpIDx99s98BxTUYT41rB2HubNMbiCtulPL
 7DbuCvzO1FYzVGqIpHXKzkMis4TACLq3VfcKT5R0GRtj1CwaA65whovKmtrMDeDbxCRY
 HFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=iuqSPWj4HM5xY2iBcSCcXj3DXzbW+xtr+HnEVbvqrzg=;
 b=MlqedaT3BWjAlvZnG7hlL6M7t/aByr/2ex1A0qoXMQNYOq6IKmDIo5yQeuDyZazxJn
 9URYKfJKLYd4oUxQIOPtKDQHpXiNN/PxUsTm1dih/moMIGzqU7nNX/j97J3W3DdwXPBi
 mN1Te3CNVmjElm7ftPJka0NTQnyRftOlFGqUn4WVtFARPJqNV68IyiOt0wBhUuxlqLKx
 xEqi47er2Z/IOcIsn02lbnKq7kGYW2vtAhMz9Eud3X/eOR2hm5e7bF+1VG8H6FNEXQB7
 on2lye7jmNZolIl8pCqQQIL/BsWEeFZj9mXkerdXZal5OIv0Fj39m5o+WcNKOxiuMXim
 H78g==
X-Gm-Message-State: ANhLgQ38MJQtTMZEMDSJ4stZ3G4OeM0RdaHxoNK2JXz0aR2VpBY+671U
 WXCvXBaEznAiIO8sG80rf+8=
X-Google-Smtp-Source: ADFU+vtjP/K9ZoJDD8hcbzKrHT0QleaBskHRdBamgoN4mU+GTI7qT0x5MNG3Wv+cvcjm+TZuIoaqcQ==
X-Received: by 2002:a17:906:a2d3:: with SMTP id
 by19mr2903841ejb.7.1583500956185; 
 Fri, 06 Mar 2020 05:22:36 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id q3sm2084360eju.88.2020.03.06.05.22.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:22:35 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>	
 <20200225095357.3923-3-pdurrant@amazon.com>	
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>	
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>	
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>	
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>	
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>	
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>	
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>	
 <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>	
 <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>	
 <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
 <812d161a895fa9f18bc5ed2e058d18ef9e9d3fae.camel@infradead.org>
In-Reply-To: <812d161a895fa9f18bc5ed2e058d18ef9e9d3fae.camel@infradead.org>
Date: Fri, 6 Mar 2020 13:22:34 -0000
Message-ID: <008a01d5f3ba$4ce09170$e6a1b450$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV87lYHAJvfVndcEiEcAXBc0AZ06g7i77w
Content-Language: en-gb
Subject: Re: [Xen-devel] [EXTERNAL][PATCH 2/2] domain: use PGC_extra domheap
 page for shared_info
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdt
dzJAaW5mcmFkZWFkLm9yZz4KPiBTZW50OiAwNiBNYXJjaCAyMDIwIDEzOjE2Cj4gVG86IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpv
bi5jby51az4KPiBDYzoganVsaWVuQHhlbi5vcmc7IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207
IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGtvbnJhZC53aWxrQG9yYWNsZS5jb207Cj4gVm9sb2R5
bXlyX0JhYmNodWtAZXBhbS5jb207IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb207IHdsQHhlbi5v
cmc7IGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbTsgeGVuLQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF1bUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQ
R0NfZXh0cmEgZG9taGVhcCBwYWdlIGZvciBzaGFyZWRfaW5mbwo+IAo+IE9uIEZyaSwgMjAyMC0w
My0wNiBhdCAxNDoxMCArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBFc3RhYmxpc2hpbmcg
b2Ygd2hhdCB0aGUgbmV3IHNlcGFyYXRpb24gcnVsZSBhbmQgbWVjaGFuaXNtIGlzIGdvaW5nCj4g
PiB0byBiZSAobm8gbWF0dGVyIGhvdyB0aGUgdHdvIHJlc3VsdGluZyBwaWVjZXMgYXJlIGdvaW5n
IHRvIGJlCj4gPiBuYW1lZCkuCj4gCj4gUGF1bCdzIG9waW5pb24gc2VlbWVkIHRvIGJlIHRoYXQg
d2l0aCBzZWNyZXQgaGlkaW5nIGNvbWluZyBhbG9uZyBhbmQKPiBkZXN0cm95aW5nIHRoZSAieGVu
aGVhcCBpcyBtYXBwZWQgYW55d2F5IiBhc3N1bXB0aW9uLCB0aGUgYmVuZWZpdCBvZgo+IGFsbG9j
YXRpbmcgYSB4ZW5oZWFwIHBhZ2UgYW5kIHRoZW4gbWFwcGluZyBpdCB0byBhIGd1ZXN0IGlzIGJh
c2ljYWxseQo+IGdvbmUgKmFueXdheSosIHNvIHRoYXQgcGFydCBhdCBsZWFzdCBtYWRlIGEgdmlh
YmxlIGNsZWFudXAgcmVnYXJkbGVzcwo+IG9mIHRoZSBvdmVyYWxsIGRpcmVjdGlvbi4KCkluZGVl
ZCwgdGhhdCBpcyBteSBvcGluaW9uLiBUaGUgZGlzdGluY3Rpb24gYmV0d2VlbiBhIG1hcHBlZCBk
b21oZWFwIHBhZ2UgYW5kIGEgeGVuaGVhcCBwYWdlIGJhc2ljYWxseSBnb2VzIGF3YXkgd2l0aCBz
ZWNyZXQgaGlkaW5nIHNpbmNlIHRoZSBkaXJlY3QgbWFwIGlzIGJhc2ljYWxseSBnb25lIHNvLCBn
aXZlbiB0aGF0IGl0IGhlbHBzIHNpbXBsaWZ5IExVICphbmQqIGdldHMgcmlkIG9mIHRoZSBkb21h
aW4geGVuaGVhcCBsaXN0IChhbmQgaGVuY2UgdGhlIHNvbWV3aGF0IHN1YnRsZSBwcm9jZXNzaW5n
IG9mIHRoYXQgbGlzdCBpbiBkb21haW5fa2lsbCgpKSwgZ2V0dGluZyByaWQgb2Ygc2hhcmVkIHhl
bmhlYXAgcGFnZXMgc2VlbXMgbGlrZSBhIHVzZWZ1bCB0aGluZyB0byBkby4KCiAgUGF1bAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

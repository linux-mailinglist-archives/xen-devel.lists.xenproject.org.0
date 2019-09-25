Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B17BE275
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:29:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDA7q-0007nW-OR; Wed, 25 Sep 2019 16:26:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDA7p-0007nK-9o
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:26:45 +0000
X-Inumbo-ID: e9096cf2-dfb0-11e9-bf31-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by localhost (Halon) with ESMTPS
 id e9096cf2-dfb0-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 16:24:13 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id t8so4665299lfc.13
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=z2JzwIc2VAs6oFG1dTTDPO27p0ln4UYifxDnKOPLzgY=;
 b=dYtDEBh9JvZ6YWvnXS27iJ2mWKwOkEl56B47Ky790XbmarqOoodp8NEL0/nyQZ6jJM
 +fs0fWyv/2F//sMAwDwyCv3DtrqIaf7SaagUoP8Chy8fWhC0Cw5sCViqdUVORZWEciVx
 DJ7Z4daP+7Y6D7yZCqi0Oz7HYm3y/7wmBtdQ3Ab1PfnnvJCvtIiftPOoSYYiy740vcs0
 yaz1lPVhqJkCv+uHtP7LsrX8BStE5frOHf4TQlcKajRVwKUT9cV0FOnP21XhmHEuiLdb
 5HNWMu/DT25l64l1pIAaCIXKIJ4H31KNjX0ukzQEC5SQIJphVdSC6ZeKhhE27b69nRwr
 Zy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=z2JzwIc2VAs6oFG1dTTDPO27p0ln4UYifxDnKOPLzgY=;
 b=cGieGWcBs6xGl3jBqF5hGurOm7wsz/As9CUqtt+ueFgqWLjuAgdXyawXjZtkno0itp
 mnnskfMPXjQf/uudf60tGRAoQ/caJ50y4XQc1h7qRl9W5VkklYcmZNubyKL/UnSco54F
 GJlkxZGS5Gfl8F52c7j2eZ8WNxJEGI3ejanx9LFHtZk9RwZySU4tNgbyQPvp3ctpWoeM
 nM4vr0SYXn0eoSg02BN17Uo8Bv8K2e8yeYP7voI9fAA3KE+iwc0QwFDe2XNiEOW7E5Es
 Khjw0tJ3bsPzZf0OvunrCyKljVstR4pLido9C8S8nDx2m80HYmT8WkgeezH43BFC89Fu
 vLhg==
X-Gm-Message-State: APjAAAUrRLmG0mNgZuzrG4kTkmT0QsNQyPE2RIkrEFiDXswGZEutGAAv
 7X+/BpKuWg2kSJR6x4rdmHo=
X-Google-Smtp-Source: APXvYqzbWGweg9nvWhvVd/ElmHLuwkEisSPHZy3BNm8exgXwxz9sigOg8q2Nycap8iR+E5D0f2xUMA==
X-Received: by 2002:ac2:5483:: with SMTP id t3mr6799274lfk.39.1569428652408;
 Wed, 25 Sep 2019 09:24:12 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id k23sm1311211ljk.93.2019.09.25.09.24.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 09:24:11 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5735846b-1a52-3260-39bd-e393c87dfb64@gmail.com>
Date: Wed, 25 Sep 2019 19:24:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI1LjA5LjE5IDE5OjEwLCBQYXVsIER1cnJhbnQgd3JvdGU6CgpIaSBQYXVsCgo+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBPbGVrc2FuZHIgPG9sZWtzdHlzaEBnbWFp
bC5jb20+Cj4+IFNlbnQ6IDI1IFNlcHRlbWJlciAyMDE5IDE2OjUwCj4+IFRvOiBQYXVsIER1cnJh
bnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ0phbiBCZXVsaWNoJyA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4+IENjOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdQo+
PiA8d2xAeGVuLm9yZz47IEtvbnJhZFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPjsgQW5kcmV3IENvb3Blcgo+PiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IERhdmlk
IFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IEdl
b3JnZSBEdW5sYXAKPj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFRhbWFzIEsgTGVuZ3ll
bCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IElhbiBKYWNrc29uCj4+IDxJYW4uSmFja3NvbkBjaXRy
aXguY29tPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7Cj4+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlt
eXJfQmFiY2h1a0BlcGFtLmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+OyBKdWxpZW4gR3JhbGwKPj4gPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiBTdWJqZWN0OiBS
ZTogW1hlbi1kZXZlbF0gW1BBVENIIHYxMyAwLzRdIGFkZCBwZXItZG9tYWluIElPTU1VIGNvbnRy
b2wKPj4KPj4KPj4gW0NDIEp1bGllbl0KPj4KPj4KPj4gSGkgUGF1bAo+Pgo+PiBJIG1heSBtaXN0
YWtlLCBidXQgbG9va3MgbGlrZQo+Pgo+PiA4MGZmM2QzMzhkYzkzMjYwYjQxZmZlZWViYjBmODUy
YzJlZGVmOWNlIGlvbW11OiB0aWR5IHVwCj4+IGlvbW11X3VzZV9oYXBfcHQoKSBhbmQgbmVlZF9p
b21tdV9wdF9zeW5jKCkgbWFjcm9zCj4+Cj4+IHRyaWdnZXJzIEFTU0VSVF9VTlJFQUNIQUJMRSBv
biBBcm0gaWYgbm8gSU9NTVUgaGFzIGJlZW4gZm91bmQgKEkgYnVpbHQKPj4gd2l0aCBteSBwbGF0
Zm9ybSdzIElPTU1VIGRyaXZlciBkaXNhYmxlZDogIyBDT05GSUdfSVBNTVVfVk1TQSBpcyBub3Qg
c2V0KSAuCj4+Cj4+IFNvLCBpb21tdV9zZXR1cCgpIGNhbGxzIGNsZWFyX2lvbW11X2hhcF9wdF9z
aGFyZSgpIHdpdGgKPj4gaW9tbXVfaGFwX3B0X3NoYXJlIGJlaW5nIHNldCAoQ09ORklHX0lPTU1V
X0ZPUkNFX1BUX1NIQVJFPXkpIHdoaWNoLAo+PiBhY3R1YWxseSwgdHJpZ2dlcnMgQVNTRVJULgo+
Pgo+IEhlcmUgYSBtaW5pbWFsIHBhdGNoLCBsZWF2aW5nICdmb3JjZSBwdCBzaGFyZScgaW4gcGxh
Y2UuIERvZXMgdGhpcyBhdm9pZCB0aGUgcHJvYmxlbT8KPgo+IC0tLTg8LS0tCj4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vc3lzY3RsLmMgYi94ZW4vY29tbW9uL3N5c2N0bC5jCj4gaW5kZXggZTg3
NjNjN2ZkZi4uZjg4YTI4NWU3ZiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3N5c2N0bC5jCj4g
KysrIGIveGVuL2NvbW1vbi9zeXNjdGwuYwo+IEBAIC0yNjgsOSArMjY4LDExIEBAIGxvbmcgZG9f
c3lzY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkKPiAg
ICAgICAgICAgcGktPm1heF9tZm4gPSBnZXRfdXBwZXJfbWZuX2JvdW5kKCk7Cj4gICAgICAgICAg
IGFyY2hfZG9fcGh5c2luZm8ocGkpOwo+ICAgICAgICAgICBpZiAoIGlvbW11X2VuYWJsZWQgKQo+
ICsgICAgICAgIHsKPiAgICAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NU
TF9QSFlTQ0FQX2RpcmVjdGlvOwo+IC0gICAgICAgIGlmICggaW9tbXVfaGFwX3B0X3NoYXJlICkK
PiAtICAgICAgICAgICAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaW9t
bXVfaGFwX3B0X3NoYXJlOwo+ICsgICAgICAgICAgICBpZiAoIGlvbW11X2hhcF9wdF9zaGFyZSAp
Cj4gKyAgICAgICAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NB
UF9pb21tdV9oYXBfcHRfc2hhcmU7Cj4gKyAgICAgICAgfQo+Cj4gICAgICAgICAgIGlmICggY29w
eV90b19ndWVzdCh1X3N5c2N0bCwgb3AsIDEpICkKPiAgICAgICAgICAgICAgIHJldCA9IC1FRkFV
TFQ7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oIGIveGVuL2luY2x1ZGUv
eGVuL2lvbW11LmgKPiBpbmRleCA3YzMwMDNmM2YxLi42YTEwYTI0MTI4IDEwMDY0NAo+IC0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgK
PiBAQCAtNjgsOCArNjgsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY2xlYXJfaW9tbXVfaGFwX3B0
X3NoYXJlKHZvaWQpCj4gICB7Cj4gICAjaWZuZGVmIGlvbW11X2hhcF9wdF9zaGFyZQo+ICAgICAg
IGlvbW11X2hhcF9wdF9zaGFyZSA9IGZhbHNlOwo+IC0jZWxpZiBpb21tdV9oYXBfcHRfc2hhcmUK
PiAtICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+ICAgI2VuZGlmCj4gICB9Cj4gLS0tODwtLS0K
Pgo+ICAgIFBhdWwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLCBidXQgSSBuZWVkIHNvbWUgdGlt
ZSB0byBjaGVjayBpdCAobm93IEkgaGF2ZSAKc29tZSB0cm91YmxlcyB3aXRoIHN0YXJ0aW5nIGd1
ZXN0IFZNKS4gSSB3aWxsIGluZm9ybSB5b3Ugb25jZSBJIGNoZWNrLgoKCi0tIApSZWdhcmRzLAoK
T2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

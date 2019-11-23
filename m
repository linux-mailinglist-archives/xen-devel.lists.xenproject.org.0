Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68DA108069
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 21:38:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYc7r-0002xo-ON; Sat, 23 Nov 2019 20:35:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6pY=ZP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iYc7q-0002xj-FB
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 20:35:26 +0000
X-Inumbo-ID: c7502aca-0e30-11ea-b08b-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7502aca-0e30-11ea-b08b-bc764e2007e4;
 Sat, 23 Nov 2019 20:35:25 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a15so12716615wrf.9
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 12:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6H2OMHEZM/kngreXLV4v7qE6DloEgibK0bUrDlcr49Y=;
 b=F86QSRBdBLOZC7tPfpWrkNBNddOttOsNnks2+4R+jQYQ5Vx9T9vlbLec4x64tRuXt/
 R83C1ilndYXx9eLrj3/wd8HhsLk2gXXaYIb6IM+tjqs7mo51o6/FKdArQPogCSvBDv4L
 OowaLHS30Ig2vZUsIGUXqPOMEvq4ExUeuKA2Qz5AI63L6VTuEz1T14rshTeLrVmQn21J
 +c6lm2v8blURnoh87MoGxS+vxhniPdpy/6Pd/J7pPPbHBJS8t0wObBFT4mfHxRzZe4+J
 vim8FfWGYPSlJxiudgDuIMIe7exijnPfJOKO6b+brS98CCsy2GuQJ2L5PbCBjlttkFn8
 W4mw==
X-Gm-Message-State: APjAAAW3jaXPiZyyYo54b0VK18h3ki6fS8sd9FBQ+6bk7LHK4Ucx9YBt
 lROiFsBg1TZ7L7Q8YQLr6r0=
X-Google-Smtp-Source: APXvYqxF62bZKI4EvbklYL5pflA45XUBh4jCJUH7mGNM+8sfxNnrylKTpSCZ3RI5hCApLCxMt2r4qg==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr23818905wra.277.1574541324946; 
 Sat, 23 Nov 2019 12:35:24 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id 91sm3520551wrm.42.2019.11.23.12.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 12:35:24 -0800 (PST)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b0bac87a-3a11-bbb1-6c13-a23087590d87@xen.org>
Date: Sat, 23 Nov 2019 20:35:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS8xMS8yMDE5IDIwOjEwLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gQWxs
b3cgdmdpY19nZXRfaHdfaXJxX2Rlc2MgdG8gYmUgY2FsbGVkIHdpdGggYSB2Y3B1IGFyZ3VtZW50
Lgo+IAo+IFVzZSB2Y3B1IGFyZ3VtZW50IGluIHZnaWNfY29ubmVjdF9od19pcnEuCj4gCj4gdmdp
Y19jb25uZWN0X2h3X2lycSBpcyBjYWxsZWQgZm9yIFBQSXMgYW5kIFNQSXMsIG5vdCBTR0lzLiBF
bmZvcmNlIHdpdGgKPiBBU1NFUlRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVi
cmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KPiAKPiAtLS0KPiB2Mzog
bmV3IHBhdGNoCj4gCj4gLS0tCj4gTm90ZTogSSBoYXZlIG9ubHkgbW9kaWZpZWQgdGhlIG9sZCB2
Z2ljIHRvIGFsbG93IGRlbGl2ZXJ5IG9mIFBQSXMuCgpUaGUgbmV3IHZHSUMgc2hvdWxkIGFsc28g
YmUgbW9kaWZpZWQgdG8gc3VwcG9ydCBkZWxpdmVyeSBvZiBQUElzLgoKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3ZnaWMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLmMKPiBpbmRleCA4MmY1MjRh
MzVjLi5jMzkzM2MyNjg3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLmMKPiArKysg
Yi94ZW4vYXJjaC9hcm0vdmdpYy5jCj4gQEAgLTQxMCwxMCArNDEwLDEwIEBAIHZvaWQgdmdpY19l
bmFibGVfaXJxcyhzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgciwgaW50IG4pCj4gICAgICAgICAg
ICAgICBpcnFfc2V0X2FmZmluaXR5KHAtPmRlc2MsIGNwdW1hc2tfb2Yodl90YXJnZXQtPnByb2Nl
c3NvcikpOwo+ICAgICAgICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnAtPmRlc2MtPmxvY2ss
IGZsYWdzKTsKPiAgICAgICAgICAgICAgIC8qCj4gLSAgICAgICAgICAgICAqIFRoZSBpcnEgY2Fu
bm90IGJlIGEgUFBJLCB3ZSBvbmx5IHN1cHBvcnQgZGVsaXZlcnkgb2YgU1BJcwo+IC0gICAgICAg
ICAgICAgKiB0byBndWVzdHMuCj4gKyAgICAgICAgICAgICAqIFRoZSBpcnEgY2Fubm90IGJlIGEg
U0dJLCB3ZSBvbmx5IHN1cHBvcnQgZGVsaXZlcnkgb2YgU1BJcwo+ICsgICAgICAgICAgICAgKiBh
bmQgUFBJcyB0byBndWVzdHMuCj4gICAgICAgICAgICAgICAgKi8KPiAtICAgICAgICAgICAgQVNT
RVJUKGlycSA+PSAzMik7Cj4gKyAgICAgICAgICAgIEFTU0VSVChpcnEgPj0gTlJfU0dJUyk7CgpX
ZSB1c3VhbGx5IHB1dCBBU1NFUlQoKSBpbiBwbGFjZSB3ZSBrbm93IHRoYXQgY29kZSB3b3VsZG4n
dCBiZSBhYmxlIHRvIAp3b3JrIGNvcnJlY3RseSBpZiB0aGVyZSBBU1NFUlQgd2VyZSBoaXQuIElu
IHRoaXMgcGFydGljdWxhciBjYXNlOgoKPiAgICAgICAgICAgICAgIGlmICggaXJxX3R5cGVfc2V0
X2J5X2RvbWFpbihkKSApCj4gICAgICAgICAgICAgICAgICAgZ2ljX3NldF9pcnFfdHlwZShwLT5k
ZXNjLCB2Z2ljX2dldF92aXJxX3R5cGUodiwgbiwgaSkpOwoKMSkgV2UgZG9uJ3Qgd2FudCB0byBh
bGxvdyBhbnkgZG9tYWluIChpbmNsdWRpbmcgRG9tMCkgdG8gbW9kaWZ5IHRoZSAKaW50ZXJydXB0
IHR5cGUgKGkuZS4gbGV2ZWwvZWRnZSkgZm9yIFBQSXMgYXMgdGhpcyBpcyBzaGFyZWQuIFlvdSB3
aWxsIAphbHNvIG1vc3QgbGlrZWx5IG5lZWQgdG8gbW9kaWZ5IHRoZSBjb3VudGVycGFydCBpbiBz
ZXR1cF9ndWVzdF9pcnEoKS4KCj4gICAgICAgICAgICAgICBwLT5kZXNjLT5oYW5kbGVyLT5lbmFi
bGUocC0+ZGVzYyk7CgoyKSBPbiBHSUN2MywgdGhlIHJlLWRpc3RyaWJ1dG9yIG9mIHZDUFUgQSBp
cyBhY2Nlc3NpYmxlIGJ5IHZDUFUgQi4gU28gCnZDUFUgQiBjb3VsZCBlbmFibGUgdGhlIFNHSSBm
b3IgdkNQVSBBLiBCdXQgdGhpcyB3b3VsZCBiZSBjYWxsZWQgb24gdGhlIAp3cm9uZyBwQ1BVIGxl
YWRpbmcgdG8gaW5jb25zaXN0ZW5jeSBiZXR3ZWVuIHRoZSBoYXJkd2FyZSBzdGF0ZSBvZiB0aGUg
CmludGVybmFsIHZHSUMgc3RhdGUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

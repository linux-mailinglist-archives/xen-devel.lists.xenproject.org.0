Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A8C05D0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpkv-00023I-JF; Fri, 27 Sep 2019 12:53:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1rL=XW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDpkt-00023D-Ig
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:53:51 +0000
X-Inumbo-ID: d455bda8-e125-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by localhost (Halon) with ESMTPS
 id d455bda8-e125-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 12:53:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v24so2405950ljj.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mSWf7xzR/X2vWLMszEWxMDxCd0q88yHf9aqWveDFly0=;
 b=qsmXyMNryRfJCKiB3tP/+Pt1KS9jQaf/Ip4TPiPilsUI3CUQtEG3ORTc3hy2tXZyTQ
 n6VtsXiehOj6SIGVUIPiaLMz9XfERQA5i5haD2o7eG8uaWMWfLElHY+j6RXZUKMCfwk4
 7jFpdwmEveY3Qr8twWmGwTndga3mjivRkEDmBdVGk82Rd1525kVMPYXU1INwu4tPXdvY
 vNn5JX7FOZ5oIwrcvhQF0ZkLkiP7/qHiyPicjPGrEbZWS01pWKEkakouybYQ3X1jYc0N
 PS9vW6pqhE6si07cvxDArTWEU/eI/RzJKnKS/qCAwqsFqsb7TwPEKWbAWTT/BlZzofaN
 0AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mSWf7xzR/X2vWLMszEWxMDxCd0q88yHf9aqWveDFly0=;
 b=RgTSYEKoZyx+xcdV4+6Dk22tszRfK4jlBOzUnTnNyo0pnwANLSyKkKmqmvGc42yuJ6
 PhnGqHwwiY7gOlSg4mGueRZv0wC6dXK/wULfj7bj/UhXbMuGXC/1j2oqdGUHef/4xos+
 bPJJzE3p8BE7XIYtlFlvTPi1xJ7eDXxlhBLgC0XA5oRGbvaX2fCMGrJcXR0NkUVuxmGo
 SXsvsAPX76o5ep8MvBjC9VAqdY7zQqW89TnnCl/AsASaTVHG1wSC1NYT+I+uV5TcvOf0
 RMn5A7z4SPzcuIugka3Nuh1ndczUCFqpVEzNvSiPf6sssyUFmfC64GJiG1e/StYibeig
 /VRw==
X-Gm-Message-State: APjAAAXBKc3saCCVVn2/taYSAVmAs1fCGR7AIHfaiydANELz3leY7rgf
 qnnsAx6ZCaTKe34MkgP7w9Q=
X-Google-Smtp-Source: APXvYqxZJZS4XoussiFz7YPa5Mqc8T1pat9Dq4/JbgumO7Aq4zxx4HK0IxYFZg5TNCu90I5tlXOwvA==
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr2872463ljj.127.1569588819918; 
 Fri, 27 Sep 2019 05:53:39 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id k13sm442006ljc.96.2019.09.27.05.53.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 05:53:39 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1569585474-8955-1-git-send-email-olekstysh@gmail.com>
 <a630303c-7951-385d-2875-da40eca2511a@arm.com>
 <03825b64-8773-d0fe-7b3d-e185d3382b50@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7d295ca0-1ef9-18f7-6846-60d623e34dfd@gmail.com>
Date: Fri, 27 Sep 2019 15:53:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <03825b64-8773-d0fe-7b3d-e185d3382b50@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI3LjA5LjE5IDE1OjM4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMjcvMDkvMjAxOSAx
MzozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKCkhpIEp1bGllbiwKCgo+Pgo+PiBPbiAy
Ny8wOS8yMDE5IDEyOjU3LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4+IEZyb206IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Cj4+
PiBUaGVyZSBpcyBhIHN0cmljdCByZXF1aXJlbWVudCBmb3IgdGhlIElPTU1VIHdoaWNoIHdhbnRz
IHRvIHNoYXJlCj4+PiB0aGUgUDJNIHRhYmxlIHdpdGggdGhlIENQVS4gVGhlIElPTU1VJ3MgU3Rh
Z2UtMiBpbnB1dCBzaXplIG11c3QgYmUgCj4+PiBlcXVhbAo+Pj4gdG8gdGhlIFAyTSBJUEEgc2l6
ZS4gSXQgaXMgbm90IGEgcHJvYmxlbSB3aGVuIHRoZSBJT01NVSBjYW4gc3VwcG9ydAo+Pj4gYWxs
IHZhbHVlcyB0aGUgQ1BVIHN1cHBvcnRzLiBJbiB0aGF0IGNhc2UsIHRoZSBJT01NVSBkcml2ZXIg
d291bGQganVzdAo+Pj4gdXNlIGFueSAicDJtX2lwYV9iaXRzIiB2YWx1ZSBhcyBpcy4gQnV0LCB0
aGVyZSBhcmUgY2FzZXMgd2hlbiBub3QuCj4+Pgo+Pj4gSW4gb3JkZXIgdG8gbWFrZSBQMk0gc2hh
cmluZyBwb3NzaWJsZSBvbiB0aGUgcGxhdGZvcm1zIHdoaWNoCj4+PiBJT01NVXMgaGF2ZSBhIGxp
bWl0YXRpb24gaW4gbWF4aW11bSBTdGFnZS0yIGlucHV0IHNpemUgaW50cm9kdWNlCj4+PiB0aGUg
Zm9sbG93aW5nIGxvZ2ljLgo+Pj4KPj4+IEZpcnN0IGluaXRpYWxpemUgdGhlIElPTU1VIHN1YnN5
c3RlbSBhbmQgZ2F0aGVyIHJlcXVpcmVtZW50cyByZWdhcmRpbmcKPj4+IHRoZSBtYXhpbXVtIElQ
QSBiaXRzIHN1cHBvcnRlZCBieSBlYWNoIElPTU1VIGRldmljZSB0byBmaWd1cmUgb3V0Cj4+PiB0
aGUgbWluaW11bSB2YWx1ZSBhbW9uZyB0aGVtLiBJbiB0aGUgUDJNIGNvZGUsIHRha2UgaW50byB0
aGUgYWNjb3VudAo+Pj4gdGhlIElPTU1VIHJlcXVpcmVtZW50cyBhbmQgY2hvb3NlIHN1aXRhYmxl
ICJwYV9yYW5nZSIgYWNjb3JkaW5nCj4+PiB0byB0aGUgcmVzdHJpY3RlZCAicDJtX2lwYV9iaXRz
Ii4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRy
X3R5c2hjaGVua29AZXBhbS5jb20+Cj4+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPj4KPj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4KPiBDb21taXR0ZWQgbm93LiBUaGFuayB5b3UhCgpUaGFuayB5b3UhCgoKSSB3b3Vs
ZCBsaWtlIHRvIHJlbWluZCByZWdhcmRpbmcgdGhlIGxhc3QgcGF0Y2ggZm9yIHRoaXMgbW9tZW50
OgoKU1VQUE9SVC5tZDogRGVzY3JpYmUgUmVuZXNhcyBJUE1NVS1WTVNBIHN1cHBvcnQgKEFybSkK
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OS0wOS9tc2cwMjc2OC5odG1sCgoKVGhhbmsgeW91IGluIGFkdmFuY2UuCgoKLS0gClJlZ2FyZHMs
CgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED83B391C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:09:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9orH-0008A5-Aw; Mon, 16 Sep 2019 11:07:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xTZH=XL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i9orF-00089k-K2
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:07:49 +0000
X-Inumbo-ID: 37946372-d872-11e9-b76c-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37946372-d872-11e9-b76c-bc764e2007e4;
 Mon, 16 Sep 2019 11:07:48 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y127so3885364lfc.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HNVJDafmHLrh/AkDuJLXuXBcL/mplJQLdGiHx4yjgC4=;
 b=rATHhhqrHUnm89d7yeoG412CrJPgCloUGioNJXycNaKbOdkh0ckVpD+bDysGDzQSA4
 WYKJO3L6q4tG+PRQy5cuxEhG56gLGGHuZe2cYggcHXd+JjYPP4SU2mF7VfCDaL4XYFp6
 VQ5wUptDhOssd97i+MqORyG7AQRTqVoE5mVNg0QJ5yIRSRRLakCGN4O8XJi8ejH/ZIpD
 pXwMskNq7HHXbaOXtbGh0RHCO4aNGFZ0nzR3zk47CnzpuowiIskqGMrn+SPRxHx6VKZ2
 CwqbsIoOMWN3SLHXNASse3eDciCSatxKPMs2HvPjrZ85cAFzvzIVVuBtvDoFKIKHbXZB
 l1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HNVJDafmHLrh/AkDuJLXuXBcL/mplJQLdGiHx4yjgC4=;
 b=ui9OYaT2YfrRDLamW89Tj86gJU1K3hOpv+qE9d0gMHztOn0zhODwtODuc8X72L12dI
 /x3FsGA5muHvI8xcu3NRtKaj7WV3aGAFdB4pUVJ0wdNbsQSCKIjEXMNK4fIpiJUTb866
 u/VJniiv6A7+yq22uprUeBgogod0LzbOm6N0+fYWDryCZk3NIj7uz5NgEutwVFCwryCy
 Tx/mgq3QNNIMM6dX8WSaP4JPRn7sHSh1EkzpyEHnf8ZV9wHUg4iUvhVqfWBVj/JvfUpc
 USvG6h+4KYeWK6bLqC7NmE457ZsZ3pKPT/kZZWAtsQ2EUrHfUe+zAzvESHoOtBRSqSHw
 2PoA==
X-Gm-Message-State: APjAAAV/zkZDwZoeW11HyObXTrC2Weq/loi40HqDRptrnNgyXpiYuBAn
 41ef6Rg0ZlUKBDZMl6i20bE=
X-Google-Smtp-Source: APXvYqyaH6FPD4qt4YJVR40LTziwKkdEs2XTvZsjtzYtUcVNxGGZD0l0v8n/Yjvdq/WhlKnN1GVTIA==
X-Received: by 2002:ac2:5ec1:: with SMTP id d1mr37047971lfq.83.1568632067598; 
 Mon, 16 Sep 2019 04:07:47 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id s1sm1789398lfd.14.2019.09.16.04.07.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 04:07:47 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-8-git-send-email-olekstysh@gmail.com>
 <ad0d8cfc-55fa-f97a-a507-70186e69ae0b@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5b002c2f-59a6-8818-750a-a1ecedec91af@gmail.com>
Date: Mon, 16 Sep 2019 14:07:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ad0d8cfc-55fa-f97a-a507-70186e69ae0b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjA5LjE5IDEyOjUzLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4gT24gMTMu
MDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9pb21tdS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4+IEBA
IC0yMzksNiArMjM5LDE2IEBAIHN0cnVjdCBpb21tdV9vcHMgewo+PiAgICAgICBpbnQgX19tdXN0
X2NoZWNrICgqaW90bGJfZmx1c2hfYWxsKShzdHJ1Y3QgZG9tYWluICpkKTsKPj4gICAgICAgaW50
ICgqZ2V0X3Jlc2VydmVkX2RldmljZV9tZW1vcnkpKGlvbW11X2dyZG1fdCAqLCB2b2lkICopOwo+
PiAgICAgICB2b2lkICgqZHVtcF9wMm1fdGFibGUpKHN0cnVjdCBkb21haW4gKmQpOwo+PiArCj4+
ICsjaWZkZWYgQ09ORklHX0hBU19ERVZJQ0VfVFJFRQo+PiArICAgIC8qCj4+ICsgICAgICogQWxs
IElPTU1VIGRyaXZlcnMgd2hpY2ggc3VwcG9ydCBnZW5lcmljIElPTU1VIERUIGJpbmRpbmdzIHNo
b3VsZCB1c2UKPj4gKyAgICAgKiB0aGlzIGNhbGxiYWNrLiBUaGlzIGlzIGEgd2F5IGZvciB0aGUg
ZnJhbWV3b3JrIHRvIHByb3ZpZGUgdGhlIGRyaXZlcgo+PiArICAgICAqIHdpdGggRFQgSU9NTVUg
c3BlY2lmaWVyIHdoaWNoIGRlc2NyaWJlcyB0aGUgSU9NTVUgbWFzdGVyIGludGVyZmFjZXMgb2YK
Pj4gKyAgICAgKiB0aGF0IGRldmljZSAoZGV2aWNlIElEcywgZXRjKS4KPj4gKyAgICAgKi8KPj4g
KyAgICBpbnQgKCpkdF94bGF0ZSkoZGV2aWNlX3QgKmRldiwgc3RydWN0IGR0X3BoYW5kbGVfYXJn
cyAqYXJncyk7Cj4+ICsjZW5kaWYKPj4gICB9Owo+IEJlZm9yZSBJIGdpdmUgbXkgYWNrIG9uIHRo
aXMsIHdvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB3aGV0aGVyCj4gaW5kZWVkIGJvdGggcGFyYW1l
dGVycyBhcmUgaW50ZW5kZWQgdG8gYmUgd3JpdHRlbiB0byBieSB0aGUKPiBob29rIGZ1bmN0aW9u
PyBJZiBub3QsIGVpdGhlciBvciBib3RoIHNob3VsZCBnZXQgImNvbnN0IiBhZGRlZC4KCkdvb2Qg
cXVlc3Rpb24uIEkgd2lsbCBhZGQgImNvbnN0IiB0byBhcmdzIHBhcmFtZXRlci4KCi0tIApSZWdh
cmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

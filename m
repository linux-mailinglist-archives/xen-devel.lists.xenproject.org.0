Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1F184450
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 11:05:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCh9O-0006yJ-J9; Fri, 13 Mar 2020 10:02:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FVV1=46=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jCh9N-0006yC-DD
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 10:02:41 +0000
X-Inumbo-ID: c64bfcb6-6511-11ea-bec1-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c64bfcb6-6511-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 10:02:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a132so9218630wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 03:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mu1YuW0bxTctI2r17OCrV55x9gUBomV/AeZ4ZVxcpEc=;
 b=t5mEnrQSGdXZtXRCNn6Rkyz71UjUdMLSyZki8bZisiixsVhXL+llHRMbtQh3pqZKcS
 M48ckuQlQ60y9PQ5BEoPTanIbNCqiI8weMZvRqgdyGFyoSqSqjDh5vM/LK3SOhR1/g29
 J+IOsaLQUboJzPXXXa3bnciYy2bvm/YrYuHW8cD7lxSbRl1kw093EJoH0nKZbbGHuMOc
 ooktFjVY42FWCxBIyk88n6HvpHdaYf3r0zQ8WcyrH7reC9ZD/5gnUXHSiTm2QL/1qV1C
 VRi6dB4cambHKXCg0Z+MTVCQNpeonQ8zWAkI/jVp/lMQpZlJdeTbG5peHC2NXjSCXCg2
 5Kbg==
X-Gm-Message-State: ANhLgQ0cKi7xhpaZZ7oly+Q8JAu5mm5uvJ2cMRaaHxROdwcgKc3C7EO2
 XGNyvRIUx/+bHM3/v/2r0Ks=
X-Google-Smtp-Source: ADFU+vsy+qsFp8dxefPxoumWUVyEZPjW8jrdQhxzP+mpWgktaspQdL2gT+QSuZJs4v40blNFsLwC/g==
X-Received: by 2002:a7b:c153:: with SMTP id z19mr9609361wmi.37.1584093759878; 
 Fri, 13 Mar 2020 03:02:39 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id q16sm65132017wrj.73.2020.03.13.03.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 03:02:39 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c41f57af-59ca-5418-5198-be9d82ff4cd6@xen.org>
Date: Fri, 13 Mar 2020 10:02:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313080517.28728-2-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] xen/rwlocks: call preempt_disable()
 when taking a rwlock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDEzLzAzLzIwMjAgMDg6MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
U2ltaWxhciB0byBzcGlubG9ja3MgcHJlZW1wdGlvbiBzaG91bGQgYmUgZGlzYWJsZWQgd2hpbGUg
aG9sZGluZyBhCj4gcndsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgIHhlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCB8IDE4ICsr
KysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oIGIv
eGVuL2luY2x1ZGUveGVuL3J3bG9jay5oCj4gaW5kZXggMWMyMjFkZDBkOS4uNGVlMzQxYTE4MiAx
MDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcndsb2NrLmgKPiBAQCAtMiw2ICsyLDcgQEAKPiAgICNkZWZpbmUgX19SV0xPQ0tfSF9f
Cj4gICAKPiAgICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4vcHJlZW1w
dC5oPgo+ICAgI2luY2x1ZGUgPHhlbi9zbXAuaD4KPiAgICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2su
aD4KPiAgIAo+IEBAIC01NywxMCArNTgsMTIgQEAgc3RhdGljIGlubGluZSBpbnQgX3JlYWRfdHJ5
bG9jayhyd2xvY2tfdCAqbG9jaykKPiAgICAgICBjbnRzID0gYXRvbWljX3JlYWQoJmxvY2stPmNu
dHMpOwo+ICAgICAgIGlmICggbGlrZWx5KF9jYW5fcmVhZF9sb2NrKGNudHMpKSApCj4gICAgICAg
ewoKSWYgeW91IGdldCBwcmVlbXB0ZWQgaGVyZSwgdGhlbiBpdCBtZWFucyB0aGUgY2hlY2sgYmVs
b3cgaXMgbGlrZWx5IGdvaW5nIAp0byBmYWlsLiBTbyBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3Qg
dG8gZGlzYWJsZSBwcmVlbXB0aW9uIGJlZm9yZSwgdG8gCmdpdmUgbW9yZSBjaGFuY2UgdG8gc3Vj
Y2VlZC4KCj4gKyAgICAgICAgcHJlZW1wdF9kaXNhYmxlKCk7Cj4gICAgICAgICAgIGNudHMgPSAo
dTMyKWF0b21pY19hZGRfcmV0dXJuKF9RUl9CSUFTLCAmbG9jay0+Y250cyk7Cj4gICAgICAgICAg
IGlmICggbGlrZWx5KF9jYW5fcmVhZF9sb2NrKGNudHMpKSApCj4gICAgICAgICAgICAgICByZXR1
cm4gMTsKPiAgICAgICAgICAgYXRvbWljX3N1YihfUVJfQklBUywgJmxvY2stPmNudHMpOwo+ICsg
ICAgICAgIHByZWVtcHRfZW5hYmxlKCk7Cj4gICAgICAgfQo+ICAgICAgIHJldHVybiAwOwo+ICAg
fQo+IEBAIC03Myw2ICs3Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfcmVhZF9sb2NrKHJ3bG9j
a190ICpsb2NrKQo+ICAgewo+ICAgICAgIHUzMiBjbnRzOwo+ICAgCj4gKyAgICBwcmVlbXB0X2Rp
c2FibGUoKTsKPiAgICAgICBjbnRzID0gYXRvbWljX2FkZF9yZXR1cm4oX1FSX0JJQVMsICZsb2Nr
LT5jbnRzKTsKPiAgICAgICBpZiAoIGxpa2VseShfY2FuX3JlYWRfbG9jayhjbnRzKSkgKQo+ICAg
ICAgICAgICByZXR1cm47Cj4gQEAgLTEwNiw2ICsxMTAsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
X3JlYWRfdW5sb2NrKHJ3bG9ja190ICpsb2NrKQo+ICAgICAgICAqIEF0b21pY2FsbHkgZGVjcmVt
ZW50IHRoZSByZWFkZXIgY291bnQKPiAgICAgICAgKi8KPiAgICAgICBhdG9taWNfc3ViKF9RUl9C
SUFTLCAmbG9jay0+Y250cyk7Cj4gKyAgICBwcmVlbXB0X2VuYWJsZSgpOwo+ICAgfQo+ICAgCj4g
ICBzdGF0aWMgaW5saW5lIHZvaWQgX3JlYWRfdW5sb2NrX2lycShyd2xvY2tfdCAqbG9jaykKPiBA
QCAtMTM3LDYgKzE0Miw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IF93cml0ZV9sb2Nr
X3ZhbCh2b2lkKQo+ICAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV9sb2NrKHJ3bG9ja190ICps
b2NrKQo+ICAgewo+ICAgICAgIC8qIE9wdGltaXplIGZvciB0aGUgdW5mYWlyIGxvY2sgY2FzZSB3
aGVyZSB0aGUgZmFpciBmbGFnIGlzIDAuICovCj4gKyAgICBwcmVlbXB0X2Rpc2FibGUoKTsKPiAg
ICAgICBpZiAoIGF0b21pY19jbXB4Y2hnKCZsb2NrLT5jbnRzLCAwLCBfd3JpdGVfbG9ja192YWwo
KSkgPT0gMCApCj4gICAgICAgICAgIHJldHVybjsKPiAgIAo+IEBAIC0xNzIsMTMgKzE3OCwyMSBA
QCBzdGF0aWMgaW5saW5lIGludCBfd3JpdGVfdHJ5bG9jayhyd2xvY2tfdCAqbG9jaykKPiAgICAg
ICBpZiAoIHVubGlrZWx5KGNudHMpICkKPiAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAKPiAtICAg
IHJldHVybiBsaWtlbHkoYXRvbWljX2NtcHhjaGcoJmxvY2stPmNudHMsIDAsIF93cml0ZV9sb2Nr
X3ZhbCgpKSA9PSAwKTsKPiArICAgIHByZWVtcHRfZGlzYWJsZSgpOwoKU2ltaWxhciByZW1hcmsg
YXMgdGhlIHJlYWRfdHJ5bG9jaygpLgoKPiArICAgIGlmICggdW5saWtlbHkoYXRvbWljX2NtcHhj
aGcoJmxvY2stPmNudHMsIDAsIF93cml0ZV9sb2NrX3ZhbCgpKSAhPSAwKSApCj4gKyAgICB7Cj4g
KyAgICAgICAgcHJlZW1wdF9lbmFibGUoKTsKPiArICAgICAgICByZXR1cm4gMDsKPiArICAgIH0K
PiArCj4gKyAgICByZXR1cm4gMTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGlubGluZSB2b2lkIF93
cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCj4gICB7Cj4gICAgICAgQVNTRVJUKF9pc193cml0
ZV9sb2NrZWRfYnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4gICAgICAgYXRvbWlj
X2FuZCh+KF9RV19DUFVNQVNLIHwgX1FXX1dNQVNLKSwgJmxvY2stPmNudHMpOwo+ICsgICAgcHJl
ZW1wdF9lbmFibGUoKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91
bmxvY2tfaXJxKHJ3bG9ja190ICpsb2NrKQo+IEBAIC0yNzQsNiArMjg4LDcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIF9wZXJjcHVfcmVhZF9sb2NrKHBlcmNwdV9yd2xvY2tfdCAqKnBlcl9jcHVkYXRh
LAo+ICAgICAgIH0KPiAgIAo+ICAgICAgIC8qIEluZGljYXRlIHRoaXMgY3B1IGlzIHJlYWRpbmcu
ICovCj4gKyAgICBwcmVlbXB0X2Rpc2FibGUoKTsKPiAgICAgICB0aGlzX2NwdV9wdHIocGVyX2Nw
dWRhdGEpID0gcGVyY3B1X3J3bG9jazsKPiAgICAgICBzbXBfbWIoKTsKPiAgICAgICAvKiBDaGVj
ayBpZiBhIHdyaXRlciBpcyB3YWl0aW5nLiAqLwo+IEBAIC0zMDgsNiArMzIzLDcgQEAgc3RhdGlj
IGlubGluZSB2b2lkIF9wZXJjcHVfcmVhZF91bmxvY2socGVyY3B1X3J3bG9ja190ICoqcGVyX2Nw
dWRhdGEsCj4gICAgICAgICAgIHJldHVybjsKPiAgICAgICB9Cj4gICAgICAgdGhpc19jcHVfcHRy
KHBlcl9jcHVkYXRhKSA9IE5VTEw7Cj4gKyAgICBwcmVlbXB0X2VuYWJsZSgpOwo+ICAgICAgIHNt
cF93bWIoKTsKPiAgIH0KPiAgIAo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

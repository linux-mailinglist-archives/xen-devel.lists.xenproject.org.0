Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07814127BE4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:42:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiIVg-0007Zm-2P; Fri, 20 Dec 2019 13:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiIVe-0007Xd-UG
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:40:02 +0000
X-Inumbo-ID: 37ebfd2e-232e-11ea-935c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37ebfd2e-232e-11ea-935c-12813bfff9fa;
 Fri, 20 Dec 2019 13:40:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC74EAED6;
 Fri, 20 Dec 2019 13:39:59 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Message-ID: <8d54cc42-ecfb-158d-63f6-cdf8dc8e7ac4@suse.com>
Date: Fri, 20 Dec 2019 14:40:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 4/5] x86emul: introduce CASE_SIMD_..._FP_VEX()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgdGhlcmUgYXJlIG1hbnkgQVZYeywyfSBpbnNucyBoYXZpbmcgbGVnYWN5IFNJTUQgY291
bnRlcnBhcnRzLCBoYXZlCm1hY3JvcyBjb3ZlcmluZyBib3RoIGluIG9uZSBnby4gVGhpcyAoaW1v
KSBpbXByb3ZlcyByZWFkYWJpbGl0eSBhbmQgaGVscHMKcHJlcGFyZSBmb3Igb3B0aW9uYWxseSBk
aXNhYmxpbmcgU0lNRCBzdXBwb3J0IGluIHRoZSBlbXVsYXRvci4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11
bGF0ZS94ODZfZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11
bGF0ZS5jCkBAIC02MDIzLDU5ICs2MDIzLDcyIEBAIHg4Nl9lbXVsYXRlKAogICAgIGNhc2UgWDg2
RU1VTF9PUEMjI2tpbmQocGZ4LCBvcGMpOiAgICAgICAgXAogICAgIGNhc2UgWDg2RU1VTF9PUEMj
I2tpbmQjI19GMyhwZngsIG9wYykKIAorI2RlZmluZSBDQVNFX1NJTURfQUxMX0ZQX1ZFWChwZngs
IG9wYykgICAgICAgXAorICAgIENBU0VfU0lNRF9BTExfRlAoLCBwZngsIG9wYyk6ICAgICAgICAg
ICAgXAorICAgIENBU0VfU0lNRF9BTExfRlAoX1ZFWCwgcGZ4LCBvcGMpCisjZGVmaW5lIENBU0Vf
U0lNRF9QQUNLRURfRlBfVkVYKHBmeCwgb3BjKSAgICBcCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9G
UCgsIHBmeCwgb3BjKTogICAgICAgICBcCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUChfVkVYLCBw
ZngsIG9wYykKKyNkZWZpbmUgQ0FTRV9TSU1EX1NDQUxBUl9GUF9WRVgocGZ4LCBvcGMpICAgIFwK
KyAgICBDQVNFX1NJTURfU0NBTEFSX0ZQKCwgcGZ4LCBvcGMpOiAgICAgICAgIFwKKyAgICBDQVNF
X1NJTURfU0NBTEFSX0ZQKF9WRVgsIHBmeCwgb3BjKQorI2RlZmluZSBDQVNFX1NJTURfU0lOR0xF
X0ZQX1ZFWChwZngsIG9wYykgICAgXAorICAgIENBU0VfU0lNRF9TSU5HTEVfRlAoLCBwZngsIG9w
Yyk6ICAgICAgICAgXAorICAgIENBU0VfU0lNRF9TSU5HTEVfRlAoX1ZFWCwgcGZ4LCBvcGMpCisK
ICAgICBDQVNFX1NJTURfU0NBTEFSX0ZQKCwgMHgwZiwgMHgyYik6ICAgICAvKiBtb3ZudHN7cyxk
fSB4bW0sbWVtICovCiAgICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZlKHNzZTRhKTsKICAg
ICAgICAgLyogZmFsbCB0aHJvdWdoICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUCgsIDB4MGYs
IDB4MmIpOiAgICAgLyogbW92bnRwe3MsZH0geG1tLG0xMjggKi8KLSAgICBDQVNFX1NJTURfUEFD
S0VEX0ZQKF9WRVgsIDB4MGYsIDB4MmIpOiAvKiB2bW92bnRwe3MsZH0ge3gseX1tbSxtZW0gKi8K
KyAgICBDQVNFX1NJTURfUEFDS0VEX0ZQX1ZFWCgweDBmLCAweDJiKTogICAvKiBtb3ZudHB7cyxk
fSB4bW0sbTEyOCAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIHZtb3ZudHB7cyxkfSB7eCx5fW1tLG1lbSAqLwogICAgICAgICBnZW5lcmF0ZV9leGNlcHRp
b25faWYoZWEudHlwZSAhPSBPUF9NRU0sIEVYQ19VRCk7CiAgICAgICAgIHNmZW5jZSA9IHRydWU7
CiAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwotICAgIENBU0VfU0lNRF9BTExfRlAoLCAweDBm
LCAweDEwKTogICAgICAgIC8qIG1vdnt1cCxzfXtzLGR9IHhtbS9tZW0seG1tICovCi0gICAgQ0FT
RV9TSU1EX1BBQ0tFRF9GUChfVkVYLCAweDBmLCAweDEwKTogLyogdm1vdnVwe3MsZH0ge3gseX1t
bS9tZW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9TQ0FMQVJfRlAoX1ZFWCwgMHgwZiwgMHgx
MCk6IC8qIHZtb3Zze3MsZH0gbWVtLHhtbSAqLworICAgIENBU0VfU0lNRF9BTExfRlBfVkVYKDB4
MGYsIDB4MTApOiAgICAgIC8qIG1vdnt1cCxzfXtzLGR9IHhtbS9tZW0seG1tICovCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdm1vdnVwe3MsZH0ge3gseX1t
bS9tZW0se3gseX1tbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIHZtb3Zze3MsZH0gbWVtLHhtbSAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIHZtb3Zze3MsZH0geG1tLHhtbSx4bW0gKi8KLSAgICBDQVNFX1NJ
TURfQUxMX0ZQKCwgMHgwZiwgMHgxMSk6ICAgICAgICAvKiBtb3Z7dXAsc317cyxkfSB4bW0seG1t
L21lbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfRlAoX1ZFWCwgMHgwZiwgMHgxMSk6IC8qIHZt
b3Z1cHtzLGR9IHt4LHl9bW0se3gseX1tbS9tZW0gKi8KLSAgICBDQVNFX1NJTURfU0NBTEFSX0ZQ
KF9WRVgsIDB4MGYsIDB4MTEpOiAvKiB2bW92c3tzLGR9IHhtbSxtZW0gKi8KKyAgICBDQVNFX1NJ
TURfQUxMX0ZQX1ZFWCgweDBmLCAweDExKTogICAgICAvKiBtb3Z7dXAsc317cyxkfSB4bW0seG1t
L21lbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZt
b3Z1cHtzLGR9IHt4LHl9bW0se3gseX1tbS9tZW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAvKiB2bW92c3tzLGR9IHhtbSxtZW0gKi8KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2bW92c3tzLGR9IHhtbSx4bW0seG1t
ICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUCgsIDB4MGYsIDB4MTQpOiAgICAgLyogdW5wY2ts
cHtzLGR9IHhtbS9tMTI4LHhtbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfRlAoX1ZFWCwgMHgw
ZiwgMHgxNCk6IC8qIHZ1bnBja2xwe3MsZH0ge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICov
Ci0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUCgsIDB4MGYsIDB4MTUpOiAgICAgLyogdW5wY2tocHtz
LGR9IHhtbS9tMTI4LHhtbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfRlAoX1ZFWCwgMHgwZiwg
MHgxNSk6IC8qIHZ1bnBja2hwe3MsZH0ge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0g
ICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUCgsIDB4MGYsIDB4MjgpOiAgICAgLyogbW92YXB7cyxkfSB4
bW0vbTEyOCx4bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0ZQKF9WRVgsIDB4MGYsIDB4Mjgp
OiAvKiB2bW92YXB7cyxkfSB7eCx5fW1tL21lbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BB
Q0tFRF9GUCgsIDB4MGYsIDB4MjkpOiAgICAgLyogbW92YXB7cyxkfSB4bW0seG1tL20xMjggKi8K
LSAgICBDQVNFX1NJTURfUEFDS0VEX0ZQKF9WRVgsIDB4MGYsIDB4MjkpOiAvKiB2bW92YXB7cyxk
fSB7eCx5fW1tLHt4LHl9bW0vbWVtICovCi0gICAgQ0FTRV9TSU1EX0FMTF9GUCgsIDB4MGYsIDB4
NTEpOiAgICAgICAgLyogc3FydHtwLHN9e3MsZH0geG1tL21lbSx4bW0gKi8KLSAgICBDQVNFX1NJ
TURfQUxMX0ZQKF9WRVgsIDB4MGYsIDB4NTEpOiAgICAvKiB2c3FydHB7cyxkfSB7eCx5fW1tL21l
bSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUF9WRVgoMHgwZiwgMHgxNCk6ICAg
LyogdW5wY2tscHtzLGR9IHhtbS9tMTI4LHhtbSAqLworICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC8qIHZ1bnBja2xwe3MsZH0ge3gseX1tbS9tZW0se3gseX1tbSx7
eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUF9WRVgoMHgwZiwgMHgxNSk6ICAgLyog
dW5wY2tocHtzLGR9IHhtbS9tMTI4LHhtbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIHZ1bnBja2hwe3MsZH0ge3gseX1tbS9tZW0se3gseX1tbSx7eCx5
fW1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUF9WRVgoMHgwZiwgMHgyOCk6ICAgLyogbW92
YXB7cyxkfSB4bW0vbTEyOCx4bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAvKiB2bW92YXB7cyxkfSB7eCx5fW1tL21lbSx7eCx5fW1tICovCisgICAgQ0FT
RV9TSU1EX1BBQ0tFRF9GUF9WRVgoMHgwZiwgMHgyOSk6ICAgLyogbW92YXB7cyxkfSB4bW0seG1t
L20xMjggKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2
bW92YXB7cyxkfSB7eCx5fW1tLHt4LHl9bW0vbWVtICovCisgICAgQ0FTRV9TSU1EX0FMTF9GUF9W
RVgoMHgwZiwgMHg1MSk6ICAgICAgLyogc3FydHtwLHN9e3MsZH0geG1tL21lbSx4bW0gKi8KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2c3FydHB7cyxkfSB7
eCx5fW1tL21lbSx7eCx5fW1tICovCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLyogdnNxcnRze3MsZH0geG1tL20zMix4bW0seG1tICovCi0gICAgQ0FTRV9TSU1E
X1NJTkdMRV9GUCgsIDB4MGYsIDB4NTIpOiAgICAgLyogcnNxcnR7cCxzfXMgeG1tL21lbSx4bW0g
Ki8KLSAgICBDQVNFX1NJTURfU0lOR0xFX0ZQKF9WRVgsIDB4MGYsIDB4NTIpOiAvKiB2cnNxcnRw
cyB7eCx5fW1tL21lbSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1NJTkdMRV9GUF9WRVgoMHgw
ZiwgMHg1Mik6ICAgLyogcnNxcnR7cCxzfXMgeG1tL21lbSx4bW0gKi8KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cnNxcnRwcyB7eCx5fW1tL21lbSx7eCx5
fW1tICovCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdnJz
cXJ0c3MgeG1tL20zMix4bW0seG1tICovCi0gICAgQ0FTRV9TSU1EX1NJTkdMRV9GUCgsIDB4MGYs
IDB4NTMpOiAgICAgLyogcmNwe3Asc31zIHhtbS9tZW0seG1tICovCi0gICAgQ0FTRV9TSU1EX1NJ
TkdMRV9GUChfVkVYLCAweDBmLCAweDUzKTogLyogdnJjcHBzIHt4LHl9bW0vbWVtLHt4LHl9bW0g
Ki8KKyAgICBDQVNFX1NJTURfU0lOR0xFX0ZQX1ZFWCgweDBmLCAweDUzKTogICAvKiByY3B7cCxz
fXMgeG1tL21lbSx4bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiB2cmNwcHMge3gseX1tbS9tZW0se3gseX1tbSAqLwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZyY3BzcyB4bW0vbTMyLHhtbSx4bW0gKi8KLSAg
ICBDQVNFX1NJTURfUEFDS0VEX0ZQKCwgMHgwZiwgMHg1NCk6ICAgICAvKiBhbmRwe3MsZH0geG1t
L20xMjgseG1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUChfVkVYLCAweDBmLCAweDU0KTog
LyogdmFuZHB7cyxkfSB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJ
TURfUEFDS0VEX0ZQKCwgMHgwZiwgMHg1NSk6ICAgICAvKiBhbmRucHtzLGR9IHhtbS9tMTI4LHht
bSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfRlAoX1ZFWCwgMHgwZiwgMHg1NSk6IC8qIHZhbmRu
cHtzLGR9IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNL
RURfRlAoLCAweDBmLCAweDU2KTogICAgIC8qIG9ycHtzLGR9IHhtbS9tMTI4LHhtbSAqLwotICAg
IENBU0VfU0lNRF9QQUNLRURfRlAoX1ZFWCwgMHgwZiwgMHg1Nik6IC8qIHZvcnB7cyxkfSB7eCx5
fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0ZQKCwgMHgw
ZiwgMHg1Nyk6ICAgICAvKiB4b3Jwe3MsZH0geG1tL20xMjgseG1tICovCi0gICAgQ0FTRV9TSU1E
X1BBQ0tFRF9GUChfVkVYLCAweDBmLCAweDU3KTogLyogdnhvcnB7cyxkfSB7eCx5fW1tL21lbSx7
eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfQUxMX0ZQKCwgMHgwZiwgMHg1OCk6ICAg
ICAgICAvKiBhZGR7cCxzfXtzLGR9IHhtbS9tZW0seG1tICovCi0gICAgQ0FTRV9TSU1EX0FMTF9G
UChfVkVYLCAweDBmLCAweDU4KTogICAgLyogdmFkZHtwLHN9e3MsZH0ge3gseX1tbS9tZW0se3gs
eX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX0FMTF9GUCgsIDB4MGYsIDB4NTkpOiAgICAg
ICAgLyogbXVse3Asc317cyxkfSB4bW0vbWVtLHhtbSAqLwotICAgIENBU0VfU0lNRF9BTExfRlAo
X1ZFWCwgMHgwZiwgMHg1OSk6ICAgIC8qIHZtdWx7cCxzfXtzLGR9IHt4LHl9bW0vbWVtLHt4LHl9
bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9BTExfRlAoLCAweDBmLCAweDVjKTogICAgICAg
IC8qIHN1YntwLHN9e3MsZH0geG1tL21lbSx4bW0gKi8KLSAgICBDQVNFX1NJTURfQUxMX0ZQKF9W
RVgsIDB4MGYsIDB4NWMpOiAgICAvKiB2c3Vie3Asc317cyxkfSB7eCx5fW1tL21lbSx7eCx5fW1t
LHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfQUxMX0ZQKCwgMHgwZiwgMHg1ZCk6ICAgICAgICAv
KiBtaW57cCxzfXtzLGR9IHhtbS9tZW0seG1tICovCi0gICAgQ0FTRV9TSU1EX0FMTF9GUChfVkVY
LCAweDBmLCAweDVkKTogICAgLyogdm1pbntwLHN9e3MsZH0ge3gseX1tbS9tZW0se3gseX1tbSx7
eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX0FMTF9GUCgsIDB4MGYsIDB4NWUpOiAgICAgICAgLyog
ZGl2e3Asc317cyxkfSB4bW0vbWVtLHhtbSAqLwotICAgIENBU0VfU0lNRF9BTExfRlAoX1ZFWCwg
MHgwZiwgMHg1ZSk6ICAgIC8qIHZkaXZ7cCxzfXtzLGR9IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gs
eX1tbSAqLwotICAgIENBU0VfU0lNRF9BTExfRlAoLCAweDBmLCAweDVmKTogICAgICAgIC8qIG1h
eHtwLHN9e3MsZH0geG1tL21lbSx4bW0gKi8KLSAgICBDQVNFX1NJTURfQUxMX0ZQKF9WRVgsIDB4
MGYsIDB4NWYpOiAgICAvKiB2bWF4e3Asc317cyxkfSB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9
bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0ZQX1ZFWCgweDBmLCAweDU0KTogICAvKiBhbmRw
e3MsZH0geG1tL20xMjgseG1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLyogdmFuZHB7cyxkfSB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAg
ICBDQVNFX1NJTURfUEFDS0VEX0ZQX1ZFWCgweDBmLCAweDU1KTogICAvKiBhbmRucHtzLGR9IHht
bS9tMTI4LHhtbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIHZhbmRucHtzLGR9IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0Vf
U0lNRF9QQUNLRURfRlBfVkVYKDB4MGYsIDB4NTYpOiAgIC8qIG9ycHtzLGR9IHhtbS9tMTI4LHht
bSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZvcnB7
cyxkfSB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VE
X0ZQX1ZFWCgweDBmLCAweDU3KTogICAvKiB4b3Jwe3MsZH0geG1tL20xMjgseG1tICovCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdnhvcnB7cyxkfSB7eCx5
fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfQUxMX0ZQX1ZFWCgweDBm
LCAweDU4KTogICAgICAvKiBhZGR7cCxzfXtzLGR9IHhtbS9tZW0seG1tICovCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdmFkZHtwLHN9e3MsZH0ge3gseX1t
bS9tZW0se3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX0FMTF9GUF9WRVgoMHgwZiwg
MHg1OSk6ICAgICAgLyogbXVse3Asc317cyxkfSB4bW0vbWVtLHhtbSAqLworICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZtdWx7cCxzfXtzLGR9IHt4LHl9bW0v
bWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9BTExfRlBfVkVYKDB4MGYsIDB4
NWMpOiAgICAgIC8qIHN1YntwLHN9e3MsZH0geG1tL21lbSx4bW0gKi8KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2c3Vie3Asc317cyxkfSB7eCx5fW1tL21l
bSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfQUxMX0ZQX1ZFWCgweDBmLCAweDVk
KTogICAgICAvKiBtaW57cCxzfXtzLGR9IHhtbS9tZW0seG1tICovCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdm1pbntwLHN9e3MsZH0ge3gseX1tbS9tZW0s
e3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX0FMTF9GUF9WRVgoMHgwZiwgMHg1ZSk6
ICAgICAgLyogZGl2e3Asc317cyxkfSB4bW0vbWVtLHhtbSAqLworICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZkaXZ7cCxzfXtzLGR9IHt4LHl9bW0vbWVtLHt4
LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9BTExfRlBfVkVYKDB4MGYsIDB4NWYpOiAg
ICAgIC8qIG1heHtwLHN9e3MsZH0geG1tL21lbSx4bW0gKi8KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiB2bWF4e3Asc317cyxkfSB7eCx5fW1tL21lbSx7eCx5
fW1tLHt4LHl9bW0gKi8KICAgICBzaW1kXzBmX2ZwOgogICAgICAgICBpZiAoIHZleC5vcGN4ID09
IHZleF9ub25lICkKICAgICAgICAgewpAQCAtNjE2MiwxMiArNjE3NSwxMiBAQCB4ODZfZW11bGF0
ZSgKIAogICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwgMHgxMik6ICAgICAgIC8qIG1vdmxw
ZCBtNjQseG1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHgxMik6ICAg
Lyogdm1vdmxwZCBtNjQseG1tLHhtbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfRlAoLCAweDBm
LCAweDEzKTogICAgIC8qIG1vdmxwe3MsZH0geG1tLG02NCAqLwotICAgIENBU0VfU0lNRF9QQUNL
RURfRlAoX1ZFWCwgMHgwZiwgMHgxMyk6IC8qIHZtb3ZscHtzLGR9IHhtbSxtNjQgKi8KKyAgICBD
QVNFX1NJTURfUEFDS0VEX0ZQX1ZFWCgweDBmLCAweDEzKTogICAvKiBtb3ZscHtzLGR9IHhtbSxt
NjQgKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2bW92
bHB7cyxkfSB4bW0sbTY0ICovCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweDE2KTog
ICAgICAgLyogbW92aHBkIG02NCx4bW0gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82Nigw
eDBmLCAweDE2KTogICAvKiB2bW92aHBkIG02NCx4bW0seG1tICovCi0gICAgQ0FTRV9TSU1EX1BB
Q0tFRF9GUCgsIDB4MGYsIDB4MTcpOiAgICAgLyogbW92aHB7cyxkfSB4bW0sbTY0ICovCi0gICAg
Q0FTRV9TSU1EX1BBQ0tFRF9GUChfVkVYLCAweDBmLCAweDE3KTogLyogdm1vdmhwe3MsZH0geG1t
LG02NCAqLworICAgIENBU0VfU0lNRF9QQUNLRURfRlBfVkVYKDB4MGYsIDB4MTcpOiAgIC8qIG1v
dmhwe3MsZH0geG1tLG02NCAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIHZtb3ZocHtzLGR9IHhtbSxtNjQgKi8KICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0
aW9uX2lmKGVhLnR5cGUgIT0gT1BfTUVNLCBFWENfVUQpOwogICAgICAgICAvKiBmYWxsIHRocm91
Z2ggKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDKDB4MGYsIDB4MTIpOiAgICAgICAgICAvKiBtb3Zs
cHMgbTY0LHhtbSAqLwpAQCAtNjMwMyw4ICs2MzE2LDcgQEAgeDg2X2VtdWxhdGUoCiAgICAgICAg
IG9wX2J5dGVzID0gKGIgJiA0KSAmJiAodmV4LnBmeCAmIFZFWF9QUkVGSVhfRE9VQkxFX01BU0sp
ID8gMTYgOiA4OwogICAgICAgICBnb3RvIHNpbWRfMGZfZnA7CiAKLSAgICBDQVNFX1NJTURfU0NB
TEFSX0ZQKCwgMHgwZiwgMHgyYSk6ICAgICAvKiBjdnRzaTJze3MsZH0gci9tLHhtbSAqLwotICAg
IENBU0VfU0lNRF9TQ0FMQVJfRlAoX1ZFWCwgMHgwZiwgMHgyYSk6IC8qIHZjdnRzaTJze3MsZH0g
ci9tLHhtbSx4bW0gKi8KKyAgICBDQVNFX1NJTURfU0NBTEFSX0ZQX1ZFWCgweDBmLCAweDJhKTog
ICAvKiB7LHZ9Y3Z0c2kyc3tzLGR9IHIvbSx4bW0gKi8KICAgICAgICAgaWYgKCB2ZXgub3BjeCA9
PSB2ZXhfbm9uZSApCiAgICAgICAgIHsKICAgICAgICAgICAgIGlmICggdmV4LnBmeCAmIFZFWF9Q
UkVGSVhfRE9VQkxFX01BU0sgKQpAQCAtNjM3NSwxMCArNjM4Nyw4IEBAIHg4Nl9lbXVsYXRlKAog
ICAgICAgICBzdGF0ZS0+c2ltZF9zaXplID0gc2ltZF9ub25lOwogICAgICAgICBicmVhazsKIAot
ICAgIENBU0VfU0lNRF9TQ0FMQVJfRlAoLCAweDBmLCAweDJjKTogICAgIC8qIGN2dHRze3MsZH0y
c2kgeG1tL21lbSxyZWcgKi8KLSAgICBDQVNFX1NJTURfU0NBTEFSX0ZQKF9WRVgsIDB4MGYsIDB4
MmMpOiAvKiB2Y3Z0dHN7cyxkfTJzaSB4bW0vbWVtLHJlZyAqLwotICAgIENBU0VfU0lNRF9TQ0FM
QVJfRlAoLCAweDBmLCAweDJkKTogICAgIC8qIGN2dHN7cyxkfTJzaSB4bW0vbWVtLHJlZyAqLwot
ICAgIENBU0VfU0lNRF9TQ0FMQVJfRlAoX1ZFWCwgMHgwZiwgMHgyZCk6IC8qIHZjdnRze3MsZH0y
c2kgeG1tL21lbSxyZWcgKi8KKyAgICBDQVNFX1NJTURfU0NBTEFSX0ZQX1ZFWCgweDBmLCAweDJj
KTogICAvKiB7LHZ9Y3Z0dHN7cyxkfTJzaSB4bW0vbWVtLHJlZyAqLworICAgIENBU0VfU0lNRF9T
Q0FMQVJfRlBfVkVYKDB4MGYsIDB4MmQpOiAgIC8qIHssdn1jdnRze3MsZH0yc2kgeG1tL21lbSxy
ZWcgKi8KICAgICAgICAgaWYgKCB2ZXgub3BjeCA9PSB2ZXhfbm9uZSApCiAgICAgICAgIHsKICAg
ICAgICAgICAgIGlmICggdmV4LnBmeCAmIFZFWF9QUkVGSVhfRE9VQkxFX01BU0sgKQpAQCAtNjQ1
NiwxMCArNjQ2Niw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBvcGMgPSBpbml0X2V2ZXgoc3R1
Yik7CiAgICAgICAgIGdvdG8gY3Z0c18yc2k7CiAKLSAgICBDQVNFX1NJTURfUEFDS0VEX0ZQKCwg
MHgwZiwgMHgyZSk6ICAgICAvKiB1Y29taXN7cyxkfSB4bW0vbWVtLHhtbSAqLwotICAgIENBU0Vf
U0lNRF9QQUNLRURfRlAoX1ZFWCwgMHgwZiwgMHgyZSk6IC8qIHZ1Y29taXN7cyxkfSB4bW0vbWVt
LHhtbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfRlAoLCAweDBmLCAweDJmKTogICAgIC8qIGNv
bWlze3MsZH0geG1tL21lbSx4bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0ZQKF9WRVgsIDB4
MGYsIDB4MmYpOiAvKiB2Y29taXN7cyxkfSB4bW0vbWVtLHhtbSAqLworICAgIENBU0VfU0lNRF9Q
QUNLRURfRlBfVkVYKDB4MGYsIDB4MmUpOiAgIC8qIHssdn11Y29taXN7cyxkfSB4bW0vbWVtLHht
bSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfRlBfVkVYKDB4MGYsIDB4MmYpOiAgIC8qIHssdn1j
b21pc3tzLGR9IHhtbS9tZW0seG1tICovCiAgICAgICAgIGlmICggdmV4Lm9wY3ggPT0gdmV4X25v
bmUgKQogICAgICAgICB7CiAgICAgICAgICAgICBpZiAoIHZleC5wZnggKQpAQCAtNjcwNSw4ICs2
NzEzLDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZighdmV4
LmwgfHwgdmV4LncsIEVYQ19VRCk7CiAgICAgICAgIGdvdG8gb3BtYXNrX2NvbW1vbjsKIAotICAg
IENBU0VfU0lNRF9QQUNLRURfRlAoLCAweDBmLCAweDUwKTogICAgIC8qIG1vdm1za3B7cyxkfSB4
bW0scmVnICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUChfVkVYLCAweDBmLCAweDUwKTogLyog
dm1vdm1za3B7cyxkfSB7eCx5fW1tLHJlZyAqLworICAgIENBU0VfU0lNRF9QQUNLRURfRlBfVkVY
KDB4MGYsIDB4NTApOiAgIC8qIG1vdm1za3B7cyxkfSB4bW0scmVnICovCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdm1vdm1za3B7cyxkfSB7eCx5fW1tLHJl
ZyAqLwogICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweGQ3KTogIC8qIHBtb3Zt
c2tiIHsseH1tbSxyZWcgKi8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiB2cG1vdm1za2Ige3gseX1tbSxyZWcgKi8KICAgICAgICAgb3BjID0gaW5pdF9wcmVm
aXhlcyhzdHViKTsKQEAgLTY3NzIsOCArNjc4MCw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBh
dng1MTJfdmxlbl9jaGVjayhmYWxzZSk7CiAgICAgICAgIGdvdG8gc2ltZF96bW07CiAKLSAgICBD
QVNFX1NJTURfQUxMX0ZQKCwgMHgwZiwgMHg1YSk6ICAgICAgICAvKiBjdnR7cCxzfXtzLGR9Mntw
LHN9e3MsZH0geG1tL21lbSx4bW0gKi8KLSAgICBDQVNFX1NJTURfQUxMX0ZQKF9WRVgsIDB4MGYs
IDB4NWEpOiAgICAvKiB2Y3Z0cHtzLGR9MnB7cyxkfSB7eCx5fW1tL21lbSx7eCx5fW1tICovCisg
ICAgQ0FTRV9TSU1EX0FMTF9GUF9WRVgoMHgwZiwgMHg1YSk6ICAgICAgLyogY3Z0e3Asc317cyxk
fTJ7cCxzfXtzLGR9IHhtbS9tZW0seG1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLyogdmN2dHB7cyxkfTJwe3MsZH0ge3gseX1tbS9tZW0se3gseX1tbSAq
LwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZjdnRze3Ms
ZH0yc3tzLGR9IHhtbS9tZW0seG1tLHhtbSAqLwogICAgICAgICBvcF9ieXRlcyA9IDQgPDwgKCgo
dmV4LnBmeCAmIFZFWF9QUkVGSVhfU0NBTEFSX01BU0spID8gMCA6IDEgKyB2ZXgubCkgKwogICAg
ICAgICAgICAgICAgICAgICAgICAgICEhKHZleC5wZnggJiBWRVhfUFJFRklYX0RPVUJMRV9NQVNL
KSk7CkBAIC02Nzg4LDggKzY3OTYsOCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgICAgICAgICAg
ICAgICAgICBldmV4LncpOwogICAgICAgICBnb3RvIGF2eDUxMmZfYWxsX2ZwOwogCi0gICAgQ0FT
RV9TSU1EX1BBQ0tFRF9GUCgsIDB4MGYsIDB4NWIpOiAgICAgLyogY3Z0e3BzLGRxfTJ7ZHEscHN9
IHhtbS9tZW0seG1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUChfVkVYLCAweDBmLCAweDVi
KTogLyogdmN2dHtwcyxkcX0ye2RxLHBzfSB7eCx5fW1tL21lbSx7eCx5fW1tICovCisgICAgQ0FT
RV9TSU1EX1BBQ0tFRF9GUF9WRVgoMHgwZiwgMHg1Yik6ICAgLyogY3Z0e3BzLGRxfTJ7ZHEscHN9
IHhtbS9tZW0seG1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogdmN2dHtwcyxkcX0ye2RxLHBzfSB7eCx5fW1tL21lbSx7eCx5fW1tICovCiAgICAgY2Fz
ZSBYODZFTVVMX09QQ19GMygweDBmLCAweDViKTogICAgICAgLyogY3Z0dHBzMmRxIHhtbS9tZW0s
eG1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfRjMoMHgwZiwgMHg1Yik6ICAgLyogdmN2
dHRwczJkcSB7eCx5fW1tL21lbSx7eCx5fW1tICovCiAgICAgICAgIGQgfD0gVHdvT3A7CkBAIC04
MTA1LDEwICs4MTEzLDEwIEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICB9CiAgICAgICAgIGdvdG8g
YWRkOwogCi0gICAgQ0FTRV9TSU1EX0FMTF9GUCgsIDB4MGYsIDB4YzIpOiAgICAgICAgLyogY21w
e3Asc317cyxkfSAkaW1tOCx4bW0vbWVtLHhtbSAqLwotICAgIENBU0VfU0lNRF9BTExfRlAoX1ZF
WCwgMHgwZiwgMHhjMik6ICAgIC8qIHZjbXB7cCxzfXtzLGR9ICRpbW04LHt4LHl9bW0vbWVtLHt4
LHl9bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfRlAoLCAweDBmLCAweGM2KTog
ICAgIC8qIHNodWZwe3MsZH0gJGltbTgseG1tL21lbSx4bW0gKi8KLSAgICBDQVNFX1NJTURfUEFD
S0VEX0ZQKF9WRVgsIDB4MGYsIDB4YzYpOiAvKiB2c2h1ZnB7cyxkfSAkaW1tOCx7eCx5fW1tL21l
bSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfQUxMX0ZQX1ZFWCgweDBmLCAweGMy
KTogICAgICAvKiBjbXB7cCxzfXtzLGR9ICRpbW04LHhtbS9tZW0seG1tICovCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdmNtcHtwLHN9e3MsZH0gJGltbTgs
e3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUF9W
RVgoMHgwZiwgMHhjNik6ICAgLyogc2h1ZnB7cyxkfSAkaW1tOCx4bW0vbWVtLHhtbSAqLworICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZzaHVmcHtzLGR9ICRp
bW04LHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwogICAgICAgICBkID0gKGQgJiB+U3Jj
TWFzaykgfCBTcmNNZW07CiAgICAgICAgIGlmICggdmV4Lm9wY3ggPT0gdmV4X25vbmUgKQogICAg
ICAgICB7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

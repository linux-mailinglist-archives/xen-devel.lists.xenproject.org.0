Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D4B127BE6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:44:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiIWZ-0008A0-E8; Fri, 20 Dec 2019 13:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiIWY-00089o-Bb
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:40:58 +0000
X-Inumbo-ID: 546a7a66-232e-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 546a7a66-232e-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 13:40:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8E08B038;
 Fri, 20 Dec 2019 13:40:47 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Message-ID: <87154c20-c60e-a215-f7f4-0290fadd90e4@suse.com>
Date: Fri, 20 Dec 2019 14:41:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 5/5] x86emul: disable FPU/MMX/SIMD insn
 emulation when !HVM
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

SW4gYSBwdXJlIFBWIGVudmlyb25tZW50ICh0aGUgUFYgc2hpbSBpbiBwYXJ0aWN1bGFyKSB3ZSBk
b24ndCByZWFsbHkKbmVlZCBlbXVsYXRpb24gb2YgYWxsIHRoZXNlLiBUbyBsaW1pdCAjaWZkZWYt
YXJ5IHV0aWxpemUgc29tZSBvZiB0aGUKQ0FTRV8qKCkgbWFjcm9zIHdlIGhhdmUsIGJ5IHByb3Zp
ZGluZyB2YXJpYW50cyBleHBhbmRpbmcgdG8KKGVmZmVjdGl2ZWx5KSBub3RoaW5nIChyZWFsbHkg
YSBsYWJlbCwgd2hpY2ggaW4gdHVybiByZXF1aXJlcyBwYXNzaW5nCi1Xbm8tdW51c2VkLWxhYmVs
IHRvIHRoZSBjb21waWxlciB3aGVuIGJ1aWxkIHN1Y2ggY29uZmlndXJhdGlvbnMpLgoKRHVlIHRv
IHRoZSBtaXh0dXJlIG9mIG1hY3JvIGFuZCAjaWZkZWYgdXNlLCB0aGUgcGxhY2VtZW50IG9mIHNv
bWUgb2YKdGhlICNpZmRlZi1zIGlzIGEgbGl0dGxlIGFyYml0cmFyeS4KClRoZSByZXN1bHRpbmcg
b2JqZWN0IGZpbGUncyAudGV4dCBpcyBsZXNzIHRoYW4gaGFsZiB0aGUgc2l6ZSBvZiB0aGUKb3Jp
Z2luYWwsIGFuZCBsb29rcyB0byBhbHNvIGJlIGNvbXBpbGluZyBhIGxpdHRsZSBtb3JlIHF1aWNr
bHkuCgpUaGlzIGlzIG1lYW50IGFzIGEgZmlyc3Qgc3RlcDsgbW9yZSBwYXJ0cyBjYW4gbGlrZWx5
IGJlIGRpc2FibGVkIGRvd24KdGhlIHJvYWQuCgpTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KLS0tCkknbGwgYmUgaGFwcHkgdG8gdGFrZSBzdWdnZXN0aW9ucyBh
bGxvd2luZyB0byBhdm9pZCAtV25vLXVudXNlZC1sYWJlbC4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9N
YWtlZmlsZQorKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAgLTc5LDYgKzc5LDkgQEAgb2Jq
LXkgKz0gaHBldC5vCiBvYmoteSArPSB2bV9ldmVudC5vCiBvYmoteSArPSB4c3RhdGUubwogCitp
Zm5lcSAoJChDT05GSUdfSFZNKSx5KQoreDg2X2VtdWxhdGUubzogQ0ZMQUdTICs9IC1Xbm8tdW51
c2VkLWxhYmVsCitlbmRpZgogeDg2X2VtdWxhdGUubzogeDg2X2VtdWxhdGUveDg2X2VtdWxhdGUu
YyB4ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5oCiAKIGVmaS15IDo9ICQoc2hlbGwgaWYgWyAhIC1y
ICQoQkFTRURJUikvaW5jbHVkZS94ZW4vY29tcGlsZS5oIC1vIFwKLS0tIGEveGVuL2FyY2gveDg2
L3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMKQEAgLTQyLDYg
KzQyLDEyIEBACiAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKIH0pCiAKKyNpZm5kZWYgQ09ORklHX0hWTQorIyBkZWZpbmUgWDg2RU1V
TF9OT19GUFUKKyMgZGVmaW5lIFg4NkVNVUxfTk9fTU1YCisjIGRlZmluZSBYODZFTVVMX05PX1NJ
TUQKKyNlbmRpZgorCiAjaW5jbHVkZSAieDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYyIKIAogaW50
IHg4NmVtdWxfcmVhZF94Y3IodW5zaWduZWQgaW50IHJlZywgdWludDY0X3QgKnZhbCwKLS0tIGEv
eGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2
L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTM0NzYsNiArMzQ3Niw3IEBAIHg4Nl9kZWNv
ZGUoCiAgICAgICAgICAgICBvcF9ieXRlcyA9IDQ7CiAgICAgICAgIGJyZWFrOwogCisjaWZuZGVm
IFg4NkVNVUxfTk9fU0lNRAogICAgIGNhc2Ugc2ltZF9wYWNrZWRfaW50OgogICAgICAgICBzd2l0
Y2ggKCB2ZXgucGZ4ICkKICAgICAgICAgewpAQCAtMzU0MSw2ICszNTQyLDcgQEAgeDg2X2RlY29k
ZSgKICAgICBjYXNlIHNpbWRfMjU2OgogICAgICAgICBvcF9ieXRlcyA9IDMyOwogICAgICAgICBi
cmVhazsKKyNlbmRpZiAvKiAhWDg2RU1VTF9OT19TSU1EICovCiAKICAgICBkZWZhdWx0OgogICAg
ICAgICBvcF9ieXRlcyA9IDA7CkBAIC0zNjk1LDYgKzM2OTcsNyBAQCB4ODZfZW11bGF0ZSgKICAg
ICAgICAgYnJlYWs7CiAgICAgfQogCisjaWZuZGVmIFg4NkVNVUxfTk9fU0lNRAogICAgIC8qIFdp
dGggYSBtZW1vcnkgb3BlcmFuZCwgZmV0Y2ggdGhlIG1hc2sgcmVnaXN0ZXIgaW4gdXNlIChpZiBh
bnkpLiAqLwogICAgIGlmICggZWEudHlwZSA9PSBPUF9NRU0gJiYgZXZleC5vcG1zayAmJgogICAg
ICAgICAgX2dldF9mcHUoZnB1X3R5cGUgPSBYODZFTVVMX0ZQVV9vcG1hc2ssIGN0eHQsIG9wcykg
PT0gWDg2RU1VTF9PS0FZICkKQEAgLTM3MjUsNiArMzcyOCw3IEBAIHg4Nl9lbXVsYXRlKAogICAg
ICAgICBwdXRfZnB1KFg4NkVNVUxfRlBVX29wbWFzaywgZmFsc2UsIHN0YXRlLCBjdHh0LCBvcHMp
OwogICAgICAgICBmcHVfdHlwZSA9IFg4NkVNVUxfRlBVX25vbmU7CiAgICAgfQorI2VuZGlmIC8q
ICFYODZFTVVMX05PX1NJTUQgKi8KIAogICAgIC8qIERlY29kZSAoYnV0IGRvbid0IGZldGNoKSB0
aGUgZGVzdGluYXRpb24gb3BlcmFuZDogcmVnaXN0ZXIgb3IgbWVtb3J5LiAqLwogICAgIHN3aXRj
aCAoIGQgJiBEc3RNYXNrICkKQEAgLTQzNzIsMTEgKzQzNzYsMTMgQEAgeDg2X2VtdWxhdGUoCiAg
ICAgICAgIHNpbmdsZXN0ZXAgPSBfcmVncy5lZmxhZ3MgJiBYODZfRUZMQUdTX1RGOwogICAgICAg
ICBicmVhazsKIAorI2lmbmRlZiBYODZFTVVMX05PX0ZQVQogICAgIGNhc2UgMHg5YjogIC8qIHdh
aXQvZndhaXQgKi8KICAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoZnB1KTsKICAgICAg
ICAgZ2V0X2ZwdShYODZFTVVMX0ZQVV93YWl0KTsKICAgICAgICAgZW11bGF0ZV9mcHVfaW5zbl9z
dHViKGIpOwogICAgICAgICBicmVhazsKKyNlbmRpZgogCiAgICAgY2FzZSAweDljOiAvKiBwdXNo
ZiAqLwogICAgICAgICBpZiAoIChfcmVncy5lZmxhZ3MgJiBYODZfRUZMQUdTX1ZNKSAmJgpAQCAt
NDc4NSw2ICs0NzkxLDcgQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIGJyZWFrOwogICAgIH0KIAor
I2lmbmRlZiBYODZFTVVMX05PX0ZQVQogICAgIGNhc2UgMHhkODogLyogRlBVIDB4ZDggKi8KICAg
ICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoZnB1KTsKICAgICAgICAgZ2V0X2ZwdShYODZF
TVVMX0ZQVV9mcHUpOwpAQCAtNTExOSw2ICs1MTI2LDcgQEAgeDg2X2VtdWxhdGUoCiAgICAgICAg
ICAgICB9CiAgICAgICAgIH0KICAgICAgICAgYnJlYWs7CisjZW5kaWYgLyogIVg4NkVNVUxfTk9f
RlBVICovCiAKICAgICBjYXNlIDB4ZTAgLi4uIDB4ZTI6IC8qIGxvb3B7LHosbnp9ICovIHsKICAg
ICAgICAgdW5zaWduZWQgbG9uZyBjb3VudCA9IGdldF9sb29wX2NvdW50KCZfcmVncywgYWRfYnl0
ZXMpOwpAQCAtNTk4Myw2ICs1OTkxLDggQEAgeDg2X2VtdWxhdGUoCiAgICAgY2FzZSBYODZFTVVM
X09QQygweDBmLCAweDE5KSAuLi4gWDg2RU1VTF9PUEMoMHgwZiwgMHgxZik6IC8qIG5vcCAqLwog
ICAgICAgICBicmVhazsKIAorI2lmbmRlZiBYODZFTVVMX05PX01NWAorCiAgICAgY2FzZSBYODZF
TVVMX09QQygweDBmLCAweDBlKTogLyogZmVtbXMgKi8KICAgICAgICAgaG9zdF9hbmRfdmNwdV9t
dXN0X2hhdmUoM2Rub3cpOwogICAgICAgICBhc20gdm9sYXRpbGUgKCAiZmVtbXMiICk7CkBAIC02
MDAzLDM5ICs2MDEzLDcxIEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBzdGF0ZS0+c2ltZF9zaXpl
ID0gc2ltZF9vdGhlcjsKICAgICAgICAgZ290byBzaW1kXzBmX2ltbTg7CiAKLSNkZWZpbmUgQ0FT
RV9TSU1EX1BBQ0tFRF9JTlQocGZ4LCBvcGMpICAgICAgIFwKKyNlbmRpZiAvKiAhWDg2RU1VTF9O
T19NTVggKi8KKworI2lmICFkZWZpbmVkKFg4NkVNVUxfTk9fU0lNRCkgJiYgIWRlZmluZWQoWDg2
RU1VTF9OT19NTVgpCisjIGRlZmluZSBDQVNFX1NJTURfUEFDS0VEX0lOVChwZngsIG9wYykgICAg
ICBcCiAgICAgY2FzZSBYODZFTVVMX09QQyhwZngsIG9wYyk6ICAgICAgICAgICAgICBcCiAgICAg
Y2FzZSBYODZFTVVMX09QQ182NihwZngsIG9wYykKLSNkZWZpbmUgQ0FTRV9TSU1EX1BBQ0tFRF9J
TlRfVkVYKHBmeCwgb3BjKSAgIFwKKyNlbGlmICFkZWZpbmVkKFg4NkVNVUxfTk9fU0lNRCkKKyMg
ZGVmaW5lIENBU0VfU0lNRF9QQUNLRURfSU5UKHBmeCwgb3BjKSAgICAgIFwKKyAgICBjYXNlIFg4
NkVNVUxfT1BDXzY2KHBmeCwgb3BjKQorI2VsaWYgIWRlZmluZWQoWDg2RU1VTF9OT19NTVgpCisj
IGRlZmluZSBDQVNFX1NJTURfUEFDS0VEX0lOVChwZngsIG9wYykgICAgICBcCisgICAgY2FzZSBY
ODZFTVVMX09QQyhwZngsIG9wYykKKyNlbHNlCisjIGRlZmluZSBDQVNFX1NJTURfUEFDS0VEX0lO
VChwZngsIG9wYykgQyMjcGZ4IyNfIyNvcGMKKyNlbmRpZgorCisjaWZuZGVmIFg4NkVNVUxfTk9f
U0lNRAorCisjIGRlZmluZSBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgocGZ4LCBvcGMpICBcCiAg
ICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQocGZ4LCBvcGMpOiAgICAgICAgICBcCiAgICAgY2FzZSBY
ODZFTVVMX09QQ19WRVhfNjYocGZ4LCBvcGMpCiAKLSNkZWZpbmUgQ0FTRV9TSU1EX0FMTF9GUChr
aW5kLCBwZngsIG9wYykgICAgIFwKKyMgZGVmaW5lIENBU0VfU0lNRF9BTExfRlAoa2luZCwgcGZ4
LCBvcGMpICAgIFwKICAgICBDQVNFX1NJTURfUEFDS0VEX0ZQKGtpbmQsIHBmeCwgb3BjKTogICAg
IFwKICAgICBDQVNFX1NJTURfU0NBTEFSX0ZQKGtpbmQsIHBmeCwgb3BjKQotI2RlZmluZSBDQVNF
X1NJTURfUEFDS0VEX0ZQKGtpbmQsIHBmeCwgb3BjKSAgXAorIyBkZWZpbmUgQ0FTRV9TSU1EX1BB
Q0tFRF9GUChraW5kLCBwZngsIG9wYykgXAogICAgIGNhc2UgWDg2RU1VTF9PUEMjI2tpbmQocGZ4
LCBvcGMpOiAgICAgICAgXAogICAgIGNhc2UgWDg2RU1VTF9PUEMjI2tpbmQjI182NihwZngsIG9w
YykKLSNkZWZpbmUgQ0FTRV9TSU1EX1NDQUxBUl9GUChraW5kLCBwZngsIG9wYykgIFwKKyMgZGVm
aW5lIENBU0VfU0lNRF9TQ0FMQVJfRlAoa2luZCwgcGZ4LCBvcGMpIFwKICAgICBjYXNlIFg4NkVN
VUxfT1BDIyNraW5kIyNfRjMocGZ4LCBvcGMpOiAgIFwKICAgICBjYXNlIFg4NkVNVUxfT1BDIyNr
aW5kIyNfRjIocGZ4LCBvcGMpCi0jZGVmaW5lIENBU0VfU0lNRF9TSU5HTEVfRlAoa2luZCwgcGZ4
LCBvcGMpICBcCisjIGRlZmluZSBDQVNFX1NJTURfU0lOR0xFX0ZQKGtpbmQsIHBmeCwgb3BjKSBc
CiAgICAgY2FzZSBYODZFTVVMX09QQyMja2luZChwZngsIG9wYyk6ICAgICAgICBcCiAgICAgY2Fz
ZSBYODZFTVVMX09QQyMja2luZCMjX0YzKHBmeCwgb3BjKQogCi0jZGVmaW5lIENBU0VfU0lNRF9B
TExfRlBfVkVYKHBmeCwgb3BjKSAgICAgICBcCisjIGRlZmluZSBDQVNFX1NJTURfQUxMX0ZQX1ZF
WChwZngsIG9wYykgICAgICBcCiAgICAgQ0FTRV9TSU1EX0FMTF9GUCgsIHBmeCwgb3BjKTogICAg
ICAgICAgICBcCiAgICAgQ0FTRV9TSU1EX0FMTF9GUChfVkVYLCBwZngsIG9wYykKLSNkZWZpbmUg
Q0FTRV9TSU1EX1BBQ0tFRF9GUF9WRVgocGZ4LCBvcGMpICAgIFwKKyMgZGVmaW5lIENBU0VfU0lN
RF9QQUNLRURfRlBfVkVYKHBmeCwgb3BjKSAgIFwKICAgICBDQVNFX1NJTURfUEFDS0VEX0ZQKCwg
cGZ4LCBvcGMpOiAgICAgICAgIFwKICAgICBDQVNFX1NJTURfUEFDS0VEX0ZQKF9WRVgsIHBmeCwg
b3BjKQotI2RlZmluZSBDQVNFX1NJTURfU0NBTEFSX0ZQX1ZFWChwZngsIG9wYykgICAgXAorIyBk
ZWZpbmUgQ0FTRV9TSU1EX1NDQUxBUl9GUF9WRVgocGZ4LCBvcGMpICAgXAogICAgIENBU0VfU0lN
RF9TQ0FMQVJfRlAoLCBwZngsIG9wYyk6ICAgICAgICAgXAogICAgIENBU0VfU0lNRF9TQ0FMQVJf
RlAoX1ZFWCwgcGZ4LCBvcGMpCi0jZGVmaW5lIENBU0VfU0lNRF9TSU5HTEVfRlBfVkVYKHBmeCwg
b3BjKSAgICBcCisjIGRlZmluZSBDQVNFX1NJTURfU0lOR0xFX0ZQX1ZFWChwZngsIG9wYykgICBc
CiAgICAgQ0FTRV9TSU1EX1NJTkdMRV9GUCgsIHBmeCwgb3BjKTogICAgICAgICBcCiAgICAgQ0FT
RV9TSU1EX1NJTkdMRV9GUChfVkVYLCBwZngsIG9wYykKIAorI2Vsc2UKKworIyBkZWZpbmUgQ0FT
RV9TSU1EX1BBQ0tFRF9JTlRfVkVYKHBmeCwgb3BjKSAgXAorICAgIENBU0VfU0lNRF9QQUNLRURf
SU5UKHBmeCwgb3BjKQorCisjIGRlZmluZSBDQVNFX1NJTURfQUxMX0ZQKGtpbmQsIHBmeCwgb3Bj
KSAgICBDIyNraW5kIyNwZngjI18jI29wYworIyBkZWZpbmUgQ0FTRV9TSU1EX1BBQ0tFRF9GUChr
aW5kLCBwZngsIG9wYykgQ3AjI2tpbmQjI3BmeCMjXyMjb3BjCisjIGRlZmluZSBDQVNFX1NJTURf
U0NBTEFSX0ZQKGtpbmQsIHBmeCwgb3BjKSBDcyMja2luZCMjcGZ4IyNfIyNvcGMKKyMgZGVmaW5l
IENBU0VfU0lNRF9TSU5HTEVfRlAoa2luZCwgcGZ4LCBvcGMpIEMjI2tpbmQjI3BmeCMjXyMjb3Bj
CisKKyMgZGVmaW5lIENBU0VfU0lNRF9BTExfRlBfVkVYKHBmeCwgb3BjKSAgICBDQVNFX1NJTURf
QUxMX0ZQKCwgcGZ4LCBvcGMpCisjIGRlZmluZSBDQVNFX1NJTURfUEFDS0VEX0ZQX1ZFWChwZngs
IG9wYykgQ0FTRV9TSU1EX1BBQ0tFRF9GUCgsIHBmeCwgb3BjKQorIyBkZWZpbmUgQ0FTRV9TSU1E
X1NDQUxBUl9GUF9WRVgocGZ4LCBvcGMpIENBU0VfU0lNRF9TQ0FMQVJfRlAoLCBwZngsIG9wYykK
KyMgZGVmaW5lIENBU0VfU0lNRF9TSU5HTEVfRlBfVkVYKHBmeCwgb3BjKSBDQVNFX1NJTURfU0lO
R0xFX0ZQKCwgcGZ4LCBvcGMpCisKKyNlbmRpZgorCiAgICAgQ0FTRV9TSU1EX1NDQUxBUl9GUCgs
IDB4MGYsIDB4MmIpOiAgICAgLyogbW92bnRze3MsZH0geG1tLG1lbSAqLwogICAgICAgICBob3N0
X2FuZF92Y3B1X211c3RfaGF2ZShzc2U0YSk7CiAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwpA
QCAtNjE3Myw2ICs2MjE1LDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIGluc25fYnl0ZXMgPSBF
VkVYX1BGWF9CWVRFUyArIDI7CiAgICAgICAgIGJyZWFrOwogCisjaWZuZGVmIFg4NkVNVUxfTk9f
U0lNRAorCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweDEyKTogICAgICAgLyogbW92
bHBkIG02NCx4bW0gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweDEyKTog
ICAvKiB2bW92bHBkIG02NCx4bW0seG1tICovCiAgICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUF9WRVgo
MHgwZiwgMHgxMyk6ICAgLyogbW92bHB7cyxkfSB4bW0sbTY0ICovCkBAIC02Mjc5LDYgKzYzMjMs
OCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgYXZ4NTEyX3ZsZW5fY2hlY2soZmFsc2UpOwogICAg
ICAgICBnb3RvIHNpbWRfem1tOwogCisjZW5kaWYgLyogIVg4NkVNVUxfTk9fU0lNRCAqLworCiAg
ICAgY2FzZSBYODZFTVVMX09QQygweDBmLCAweDIwKTogLyogbW92IGNyLHJlZyAqLwogICAgIGNh
c2UgWDg2RU1VTF9PUEMoMHgwZiwgMHgyMSk6IC8qIG1vdiBkcixyZWcgKi8KICAgICBjYXNlIFg4
NkVNVUxfT1BDKDB4MGYsIDB4MjIpOiAvKiBtb3YgcmVnLGNyICovCkBAIC02MzA1LDYgKzYzNTEs
OCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgICAgIGdvdG8gZG9uZTsKICAgICAgICAgYnJlYWs7
CiAKKyNpZiAhZGVmaW5lZChYODZFTVVMX05PX01NWCkgJiYgIWRlZmluZWQoWDg2RU1VTF9OT19T
SU1EKQorCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweDJhKTogICAgICAgLyogY3Z0
cGkycGQgbW0vbTY0LHhtbSAqLwogICAgICAgICBpZiAoIGVhLnR5cGUgPT0gT1BfUkVHICkKICAg
ICAgICAgewpAQCAtNjMxNiw2ICs2MzY0LDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIG9wX2J5
dGVzID0gKGIgJiA0KSAmJiAodmV4LnBmeCAmIFZFWF9QUkVGSVhfRE9VQkxFX01BU0spID8gMTYg
OiA4OwogICAgICAgICBnb3RvIHNpbWRfMGZfZnA7CiAKKyNlbmRpZiAvKiAhWDg2RU1VTF9OT19N
TVggJiYgIVg4NkVNVUxfTk9fU0lNRCAqLworCiAgICAgQ0FTRV9TSU1EX1NDQUxBUl9GUF9WRVgo
MHgwZiwgMHgyYSk6ICAgLyogeyx2fWN2dHNpMnN7cyxkfSByL20seG1tICovCiAgICAgICAgIGlm
ICggdmV4Lm9wY3ggPT0gdmV4X25vbmUgKQogICAgICAgICB7CkBAIC02NjU5LDYgKzY3MDksOCBA
QCB4ODZfZW11bGF0ZSgKICAgICAgICAgICAgIGRzdC52YWwgPSBzcmMudmFsOwogICAgICAgICBi
cmVhazsKIAorI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKKwogICAgIGNhc2UgWDg2RU1VTF9PUENf
VkVYKDB4MGYsIDB4NGEpOiAgICAvKiBrYWRke3cscX0gayxrLGsgKi8KICAgICAgICAgaWYgKCAh
dmV4LncgKQogICAgICAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoYXZ4NTEyZHEpOwpA
QCAtNjcxMyw2ICs2NzY1LDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIGdlbmVyYXRlX2V4Y2Vw
dGlvbl9pZighdmV4LmwgfHwgdmV4LncsIEVYQ19VRCk7CiAgICAgICAgIGdvdG8gb3BtYXNrX2Nv
bW1vbjsKIAorI2VuZGlmIC8qIFg4NkVNVUxfTk9fU0lNRCAqLworCiAgICAgQ0FTRV9TSU1EX1BB
Q0tFRF9GUF9WRVgoMHgwZiwgMHg1MCk6ICAgLyogbW92bXNrcHtzLGR9IHhtbSxyZWcgKi8KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2bW92bXNrcHtzLGR9
IHt4LHl9bW0scmVnICovCiAgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZDcp
OiAgLyogcG1vdm1za2Igeyx4fW1tLHJlZyAqLwpAQCAtNjc5Niw2ICs2ODUwLDggQEAgeDg2X2Vt
dWxhdGUoCiAgICAgICAgICAgICAgICAgICAgICAgICAgZXZleC53KTsKICAgICAgICAgZ290byBh
dng1MTJmX2FsbF9mcDsKIAorI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKKwogICAgIENBU0VfU0lN
RF9QQUNLRURfRlBfVkVYKDB4MGYsIDB4NWIpOiAgIC8qIGN2dHtwcyxkcX0ye2RxLHBzfSB4bW0v
bWVtLHhtbSAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8q
IHZjdnR7cHMsZHF9MntkcSxwc30ge3gseX1tbS9tZW0se3gseX1tbSAqLwogICAgIGNhc2UgWDg2
RU1VTF9PUENfRjMoMHgwZiwgMHg1Yik6ICAgICAgIC8qIGN2dHRwczJkcSB4bW0vbWVtLHhtbSAq
LwpAQCAtNjgyNiw2ICs2ODgyLDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIG9wX2J5dGVzID0g
MTYgPDwgZXZleC5scjsKICAgICAgICAgZ290byBzaW1kX3ptbTsKIAorI2VuZGlmIC8qICFYODZF
TVVMX05PX1NJTUQgKi8KKwogICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweDYw
KTogLyogcHVucGNrbGJ3IHsseH1tbS9tZW0seyx4fW1tICovCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHVucGNrbGJ3IHt4LHl9bW0vbWVtLHt4LHl9bW0s
e3gseX1tbSAqLwogICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweDYxKTogLyog
cHVucGNrbHdkIHsseH1tbS9tZW0seyx4fW1tICovCkBAIC02ODUyLDYgKzY5MTAsNyBAQCB4ODZf
ZW11bGF0ZSgKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZw
YWNrdXNidyB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KICAgICBDQVNFX1NJTURfUEFD
S0VEX0lOVF9WRVgoMHgwZiwgMHg2Yik6IC8qIHBhY2tzc3dkIHsseH1tbS9tZW0seyx4fW1tICov
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cGFja3Nzd2Qg
e3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisjaWZuZGVmIFg4NkVNVUxfTk9fU0lNRAog
ICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwgMHg2Yyk6ICAgICAvKiBwdW5wY2tscWRxIHht
bS9tMTI4LHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4NmMpOiAv
KiB2cHVucGNrbHFkcSB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KICAgICBjYXNlIFg4
NkVNVUxfT1BDXzY2KDB4MGYsIDB4NmQpOiAgICAgLyogcHVucGNraHFkcSB4bW0vbTEyOCx4bW0g
Ki8KQEAgLTY5MzYsNiArNjk5NSw3IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogdnBzdWJkIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gs
eX1tbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwgMHhmYik6ICAgICAvKiBwc3Vi
cSB4bW0vbTEyOCx4bW0gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweGZi
KTogLyogdnBzdWJxIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworI2VuZGlmIC8qICFY
ODZFTVVMX05PX1NJTUQgKi8KICAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHhm
Yyk6IC8qIHBhZGRiIHsseH1tbS9tZW0seyx4fW1tICovCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAvKiB2cGFkZGIge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1t
ICovCiAgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZmQpOiAvKiBwYWRkdyB7
LHh9bW0vbWVtLHsseH1tbSAqLwpAQCAtNjk0Myw2ICs3MDAzLDcgQEAgeDg2X2VtdWxhdGUoCiAg
ICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZmUpOiAvKiBwYWRkZCB7LHh9bW0v
bWVtLHsseH1tbSAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LyogdnBhZGRkIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwogICAgIHNpbWRfMGZfaW50
OgorI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKICAgICAgICAgaWYgKCB2ZXgub3BjeCAhPSB2ZXhf
bm9uZSApCiAgICAgICAgIHsKICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmMzgsIDB4
MDApOiAvKiB2cHNodWZiIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwpAQCAtNjk4NCwx
MSArNzA0NSwxNCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgfQogICAgICAgICBpZiAoIHZleC5w
ZnggKQogICAgICAgICAgICAgZ290byBzaW1kXzBmX3NzZTI7CisjZW5kaWYgLyogIVg4NkVNVUxf
Tk9fU0lNRCAqLwogICAgIHNpbWRfMGZfbW14OgogICAgICAgICBob3N0X2FuZF92Y3B1X211c3Rf
aGF2ZShtbXgpOwogICAgICAgICBnZXRfZnB1KFg4NkVNVUxfRlBVX21teCk7CiAgICAgICAgIGdv
dG8gc2ltZF8wZl9jb21tb247CiAKKyNpZm5kZWYgWDg2RU1VTF9OT19TSU1ECisKICAgICBjYXNl
IFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZiwgMHhmNik6IC8qIHZwc2FkYncgW3h5el1tbS9tZW0s
W3h5el1tbSxbeHl6XW1tICovCiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihldmV4Lm9w
bXNrLCBFWENfVUQpOwogICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KQEAgLTcwODIsNiArNzE0
Niw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoIWV2ZXgu
dywgRVhDX1VEKTsKICAgICAgICAgZ290byBhdng1MTJmX25vX3NhZTsKIAorI2VuZGlmIC8qIFg4
NkVNVUxfTk9fU0lNRCAqLworCiAgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4
NmUpOiAvKiBtb3Z7ZCxxfSByL20seyx4fW1tICovCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiB2bW92e2QscX0gci9tLHhtbSAqLwogICAgIENBU0VfU0lNRF9Q
QUNLRURfSU5UX1ZFWCgweDBmLCAweDdlKTogLyogbW92e2QscX0geyx4fW1tLHIvbSAqLwpAQCAt
NzEyMyw2ICs3MTg5LDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIEFTU0VSVCghc3RhdGUtPnNp
bWRfc2l6ZSk7CiAgICAgICAgIGJyZWFrOwogCisjaWZuZGVmIFg4NkVNVUxfTk9fU0lNRAorCiAg
ICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYsIDB4NmUpOiAvKiB2bW92e2QscX0gci9t
LHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweDdlKTogLyogdm1v
dntkLHF9IHhtbSxyL20gKi8KICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKChldmV4Lmxy
IHx8IGV2ZXgub3Btc2sgfHwgZXZleC5icnMgfHwKQEAgLTcxOTUsMTEgKzcyNjMsMTUgQEAgeDg2
X2VtdWxhdGUoCiAgICAgICAgIGQgfD0gVHdvT3A7CiAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAq
LwogICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwgMHhkNik6ICAgICAvKiBtb3ZxIHhtbSx4
bW0vbTY0ICovCisjZW5kaWYgLyogIVg4NkVNVUxfTk9fU0lNRCAqLworI2lmbmRlZiBYODZFTVVM
X05PX01NWAogICAgIGNhc2UgWDg2RU1VTF9PUEMoMHgwZiwgMHg2Zik6ICAgICAgICAvKiBtb3Zx
IG1tL202NCxtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUEMoMHgwZiwgMHg3Zik6ICAgICAgICAv
KiBtb3ZxIG1tLG1tL202NCAqLworI2VuZGlmCiAgICAgICAgIG9wX2J5dGVzID0gODsKICAgICAg
ICAgZ290byBzaW1kXzBmX2ludDsKIAorI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKICAgICBDQVNF
X1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHg3MCk6LyogcHNodWZ7dyxkfSAkaW1tOCx7LHh9
bW0vbWVtLHsseH1tbSAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKiB2cHNodWZkICRpbW04LHt4LHl9bW0vbWVtLHt4LHl9bW0gKi8KICAgICBjYXNlIFg4NkVN
VUxfT1BDX0YzKDB4MGYsIDB4NzApOiAgICAgLyogcHNodWZodyAkaW1tOCx4bW0vbTEyOCx4bW0g
Ki8KQEAgLTcyMDgsMTIgKzcyODAsMTUgQEAgeDg2X2VtdWxhdGUoCiAgICAgY2FzZSBYODZFTVVM
X09QQ19WRVhfRjIoMHgwZiwgMHg3MCk6IC8qIHZwc2h1Zmx3ICRpbW04LHt4LHl9bW0vbWVtLHt4
LHl9bW0gKi8KICAgICAgICAgZCA9IChkICYgflNyY01hc2spIHwgU3JjTWVtIHwgVHdvT3A7CiAg
ICAgICAgIG9wX2J5dGVzID0gdmV4LnBmeCA/IDE2IDw8IHZleC5sIDogODsKKyNlbmRpZgogICAg
IHNpbWRfMGZfaW50X2ltbTg6CiAgICAgICAgIGlmICggdmV4Lm9wY3ggIT0gdmV4X25vbmUgKQog
ICAgICAgICB7CisjaWZuZGVmIFg4NkVNVUxfTk9fU0lNRAogICAgIGNhc2UgWDg2RU1VTF9PUENf
VkVYXzY2KDB4MGYzYSwgMHgwZSk6IC8qIHZwYmxlbmR3ICRpbW04LHt4LHl9bW0vbWVtLHt4LHl9
bW0se3gseX1tbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYzYSwgMHgwZik6
IC8qIHZwYWxpZ25yICRpbW04LHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwogICAgIGNh
c2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYzYSwgMHg0Mik6IC8qIHZtcHNhZGJ3ICRpbW04LHt4
LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworI2VuZGlmCiAgICAgICAgICAgICBpZiAoIHZl
eC5sICkKICAgICAgICAgICAgIHsKICAgICBzaW1kXzBmX2ltbThfYXZ4MjoKQEAgLTcyMjEsNiAr
NzI5Niw3IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICAgICAgfQogICAgICAgICAgICAgZWxzZQog
ICAgICAgICAgICAgeworI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKICAgICBjYXNlIFg4NkVNVUxf
T1BDX1ZFWF82NigweDBmM2EsIDB4MDgpOiAvKiB2cm91bmRwcyAkaW1tOCx7eCx5fW1tL21lbSx7
eCx5fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZjNhLCAweDA5KTogLyog
dnJvdW5kcGQgJGltbTgse3gseX1tbS9tZW0se3gseX1tbSAqLwogICAgIGNhc2UgWDg2RU1VTF9P
UENfVkVYXzY2KDB4MGYzYSwgMHgwYSk6IC8qIHZyb3VuZHNzICRpbW04LHt4LHl9bW0vbWVtLHt4
LHl9bW0se3gseX1tbSAqLwpAQCAtNzIyOCw2ICs3MzA0LDcgQEAgeDg2X2VtdWxhdGUoCiAgICAg
Y2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZjNhLCAweDBjKTogLyogdmJsZW5kcHMgJGltbTgs
e3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhf
NjYoMHgwZjNhLCAweDBkKTogLyogdmJsZW5kcGQgJGltbTgse3gseX1tbS9tZW0se3gseX1tbSx7
eCx5fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZjNhLCAweDQwKTogLyog
dmRwcHMgJGltbTgse3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisjZW5kaWYKICAgICBz
aW1kXzBmX2ltbThfYXZ4OgogICAgICAgICAgICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZl
KGF2eCk7CiAgICAgICAgICAgICB9CkBAIC03MjYxLDYgKzczMzgsOCBAQCB4ODZfZW11bGF0ZSgK
ICAgICAgICAgaW5zbl9ieXRlcyA9IFBGWF9CWVRFUyArIDM7CiAgICAgICAgIGJyZWFrOwogCisj
aWZuZGVmIFg4NkVNVUxfTk9fU0lNRAorCiAgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4
MGYsIDB4NzApOiAvKiB2cHNodWZkICRpbW04LFt4eXpdbW0vbWVtLFt4eXpdbW17a30gKi8KICAg
ICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfRjMoMHgwZiwgMHg3MCk6IC8qIHZwc2h1Zmh3ICRpbW04
LFt4eXpdbW0vbWVtLFt4eXpdbW17a30gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfRjIo
MHgwZiwgMHg3MCk6IC8qIHZwc2h1Zmx3ICRpbW04LFt4eXpdbW0vbWVtLFt4eXpdbW17a30gKi8K
QEAgLTczMTksNiArNzM5OCw5IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBvcGNbMV0gPSBtb2Ry
bTsKICAgICAgICAgb3BjWzJdID0gaW1tMTsKICAgICAgICAgaW5zbl9ieXRlcyA9IFBGWF9CWVRF
UyArIDM7CisKKyNlbmRpZiAvKiBYODZFTVVMX05PX1NJTUQgKi8KKwogICAgIHNpbWRfMGZfcmVn
X29ubHk6CiAgICAgICAgIG9wY1tpbnNuX2J5dGVzIC0gUEZYX0JZVEVTXSA9IDB4YzM7CiAKQEAg
LTczMjksNiArNzQxMSw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBBU1NFUlQoIXN0YXRlLT5z
aW1kX3NpemUpOwogICAgICAgICBicmVhazsKIAorI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKKwog
ICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweDcxKTogLyogR3JwMTIgKi8KICAg
ICAgICAgc3dpdGNoICggbW9kcm1fcmVnICYgNyApCiAgICAgICAgIHsKQEAgLTczNjAsNiArNzQ0
NCw5IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICB9CiAgICAgICAgIGdvdG8gdW5yZWNvZ25pemVk
X2luc247CiAKKyNlbmRpZiAvKiAhWDg2RU1VTF9OT19TSU1EICovCisjaWZuZGVmIFg4NkVNVUxf
Tk9fTU1YCisKICAgICBjYXNlIFg4NkVNVUxfT1BDKDB4MGYsIDB4NzMpOiAgICAgICAgLyogR3Jw
MTQgKi8KICAgICAgICAgc3dpdGNoICggbW9kcm1fcmVnICYgNyApCiAgICAgICAgIHsKQEAgLTcz
NjksNiArNzQ1Niw5IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICB9CiAgICAgICAgIGdvdG8gdW5y
ZWNvZ25pemVkX2luc247CiAKKyNlbmRpZiAvKiAhWDg2RU1VTF9OT19NTVggKi8KKyNpZm5kZWYg
WDg2RU1VTF9OT19TSU1ECisKICAgICBjYXNlIFg4NkVNVUxfT1BDXzY2KDB4MGYsIDB4NzMpOgog
ICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4NzMpOgogICAgICAgICBzd2l0Y2gg
KCBtb2RybV9yZWcgJiA3ICkKQEAgLTczOTksNyArNzQ4OSwxMiBAQCB4ODZfZW11bGF0ZSgKICAg
ICAgICAgfQogICAgICAgICBnb3RvIHVucmVjb2duaXplZF9pbnNuOwogCisjZW5kaWYgLyogIVg4
NkVNVUxfTk9fU0lNRCAqLworCisjaWZuZGVmIFg4NkVNVUxfTk9fTU1YCiAgICAgY2FzZSBYODZF
TVVMX09QQygweDBmLCAweDc3KTogICAgICAgIC8qIGVtbXMgKi8KKyNlbmRpZgorI2lmbmRlZiBY
ODZFTVVMX05PX1NJTUQKICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWCgweDBmLCAweDc3KTogICAg
Lyogdnplcm97YWxsLHVwcGVyfSAqLwogICAgICAgICBpZiAoIHZleC5vcGN4ICE9IHZleF9ub25l
ICkKICAgICAgICAgewpAQCAtNzQ0NSw2ICs3NTQwLDcgQEAgeDg2X2VtdWxhdGUoCiAjZW5kaWYK
ICAgICAgICAgfQogICAgICAgICBlbHNlCisjZW5kaWYgLyogIVg4NkVNVUxfTk9fU0lNRCAqLwog
ICAgICAgICB7CiAgICAgICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZShtbXgpOwogICAg
ICAgICAgICAgZ2V0X2ZwdShYODZFTVVMX0ZQVV9tbXgpOwpAQCAtNzQ1OCw2ICs3NTU0LDggQEAg
eDg2X2VtdWxhdGUoCiAgICAgICAgIGluc25fYnl0ZXMgPSBQRlhfQllURVMgKyAxOwogICAgICAg
ICBnb3RvIHNpbWRfMGZfcmVnX29ubHk7CiAKKyNpZm5kZWYgWDg2RU1VTF9OT19TSU1ECisKICAg
ICBjYXNlIFg4NkVNVUxfT1BDXzY2KDB4MGYsIDB4NzgpOiAgICAgLyogR3JwMTcgKi8KICAgICAg
ICAgc3dpdGNoICggbW9kcm1fcmVnICYgNyApCiAgICAgICAgIHsKQEAgLTc1NTUsNiArNzY1Myw4
IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBvcF9ieXRlcyA9IDg7CiAgICAgICAgIGdvdG8gc2lt
ZF96bW07CiAKKyNlbmRpZiAvKiAhWDg2RU1VTF9OT19TSU1EICovCisKICAgICBjYXNlIFg4NkVN
VUxfT1BDKDB4MGYsIDB4ODApIC4uLiBYODZFTVVMX09QQygweDBmLCAweDhmKTogLyogamNjIChu
ZWFyKSAqLwogICAgICAgICBpZiAoIHRlc3RfY2MoYiwgX3JlZ3MuZWZsYWdzKSApCiAgICAgICAg
ICAgICBqbXBfcmVsKChpbnQzMl90KXNyYy52YWwpOwpAQCAtNzU2NSw2ICs3NjY1LDggQEAgeDg2
X2VtdWxhdGUoCiAgICAgICAgIGRzdC52YWwgPSB0ZXN0X2NjKGIsIF9yZWdzLmVmbGFncyk7CiAg
ICAgICAgIGJyZWFrOwogCisjaWZuZGVmIFg4NkVNVUxfTk9fU0lNRAorCiAgICAgY2FzZSBYODZF
TVVMX09QQ19WRVgoMHgwZiwgMHg5MSk6ICAgIC8qIGttb3Z7dyxxfSBrLG1lbSAqLwogICAgIGNh
c2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4OTEpOiAvKiBrbW92e2IsZH0gayxtZW0gKi8K
ICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKGVhLnR5cGUgIT0gT1BfTUVNLCBFWENfVUQp
OwpAQCAtNzcxMyw2ICs3ODE1LDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIGRzdC50eXBlID0g
T1BfTk9ORTsKICAgICAgICAgYnJlYWs7CiAKKyNlbmRpZiAvKiAhWDg2RU1VTF9OT19TSU1EICov
CisKICAgICBjYXNlIFg4NkVNVUxfT1BDKDB4MGYsIDB4YTIpOiAvKiBjcHVpZCAqLwogICAgICAg
ICBtc3JfdmFsID0gMDsKICAgICAgICAgZmFpbF9pZihvcHMtPmNwdWlkID09IE5VTEwpOwpAQCAt
NzgwOSw2ICs3OTEzLDcgQEAgeDg2X2VtdWxhdGUoCiAgICAgY2FzZSBYODZFTVVMX09QQygweDBm
LCAweGFlKTogY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweGFlKTogLyogR3JwMTUgKi8KICAg
ICAgICAgc3dpdGNoICggbW9kcm1fcmVnICYgNyApCiAgICAgICAgIHsKKyNpZm5kZWYgWDg2RU1V
TF9OT19TSU1ECiAgICAgICAgIGNhc2UgMjogLyogbGRteGNzciAqLwogICAgICAgICAgICAgZ2Vu
ZXJhdGVfZXhjZXB0aW9uX2lmKHZleC5wZngsIEVYQ19VRCk7CiAgICAgICAgICAgICB2Y3B1X211
c3RfaGF2ZShzc2UpOwpAQCAtNzgyNyw2ICs3OTMyLDcgQEAgeDg2X2VtdWxhdGUoCiAgICAgICAg
ICAgICBnZXRfZnB1KHZleC5vcGN4ID8gWDg2RU1VTF9GUFVfeW1tIDogWDg2RU1VTF9GUFVfeG1t
KTsKICAgICAgICAgICAgIGFzbSB2b2xhdGlsZSAoICJzdG14Y3NyICUwIiA6ICI9bSIgKGRzdC52
YWwpICk7CiAgICAgICAgICAgICBicmVhazsKKyNlbmRpZiAvKiBYODZFTVVMX05PX1NJTUQgKi8K
IAogICAgICAgICBjYXNlIDU6IC8qIGxmZW5jZSAqLwogICAgICAgICAgICAgZmFpbF9pZihtb2Ry
bV9tb2QgIT0gMyk7CkBAIC03ODc1LDYgKzc5ODEsOCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAg
fQogICAgICAgICBicmVhazsKIAorI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKKwogICAgIGNhc2Ug
WDg2RU1VTF9PUENfVkVYKDB4MGYsIDB4YWUpOiAvKiBHcnAxNSAqLwogICAgICAgICBzd2l0Y2gg
KCBtb2RybV9yZWcgJiA3ICkKICAgICAgICAgewpAQCAtNzg4OSw2ICs3OTk3LDggQEAgeDg2X2Vt
dWxhdGUoCiAgICAgICAgIH0KICAgICAgICAgZ290byB1bnJlY29nbml6ZWRfaW5zbjsKIAorI2Vu
ZGlmIC8qICFYODZFTVVMX05PX1NJTUQgKi8KKwogICAgIGNhc2UgWDg2RU1VTF9PUENfRjMoMHgw
ZiwgMHhhZSk6IC8qIEdycDE1ICovCiAgICAgICAgIGZhaWxfaWYobW9kcm1fbW9kICE9IDMpOwog
ICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoKG1vZHJtX3JlZyAmIDQpIHx8ICFtb2RlXzY0
Yml0KCksIEVYQ19VRCk7CkBAIC04MTI4LDYgKzgyMzgsOCBAQCB4ODZfZW11bGF0ZSgKICAgICAg
ICAgfQogICAgICAgICBnb3RvIHNpbWRfMGZfaW1tOF9hdng7CiAKKyNpZm5kZWYgWDg2RU1VTF9O
T19TSU1ECisKICAgICBDQVNFX1NJTURfQUxMX0ZQKF9FVkVYLCAweDBmLCAweGMyKTogLyogdmNt
cHtwLHN9e3MsZH0gJGltbTgsW3h5el1tbS9tZW0sW3h5el1tbSxre2t9ICovCiAgICAgICAgIGdl
bmVyYXRlX2V4Y2VwdGlvbl9pZigoZXZleC53ICE9IChldmV4LnBmeCAmIFZFWF9QUkVGSVhfRE9V
QkxFX01BU0spIHx8CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGVhLnR5cGUgIT0g
T1BfUkVHICYmIGV2ZXguYnJzICYmCkBAIC04MTU0LDYgKzgyNjYsOCBAQCB4ODZfZW11bGF0ZSgK
ICAgICAgICAgaW5zbl9ieXRlcyA9IEVWRVhfUEZYX0JZVEVTICsgMzsKICAgICAgICAgYnJlYWs7
CiAKKyNlbmRpZiAvKiAhWDg2RU1VTF9OT19TSU1EICovCisKICAgICBjYXNlIFg4NkVNVUxfT1BD
KDB4MGYsIDB4YzMpOiAvKiBtb3ZudGkgKi8KICAgICAgICAgLyogSWdub3JlIHRoZSBub24tdGVt
cG9yYWwgaGludCBmb3Igbm93LiAqLwogICAgICAgICB2Y3B1X211c3RfaGF2ZShzc2UyKTsKQEAg
LTgxNjgsNiArODI4Miw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBlYS50eXBlID0gT1BfTUVN
OwogICAgICAgICBnb3RvIHNpbWRfMGZfaW50X2ltbTg7CiAKKyNpZm5kZWYgWDg2RU1VTF9OT19T
SU1ECisKICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZiwgMHhjNCk6ICAgLyogdnBp
bnNydyAkaW1tOCxyMzIvbTE2LHhtbSx4bW0gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhf
NjYoMHgwZjNhLCAweDIwKTogLyogdnBpbnNyYiAkaW1tOCxyMzIvbTgseG1tLHhtbSAqLwogICAg
IGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmM2EsIDB4MjIpOiAvKiB2cGluc3J7ZCxxfSAk
aW1tOCxyL20seG1tLHhtbSAqLwpAQCAtODE4NSw2ICs4MzAxLDggQEAgeDg2X2VtdWxhdGUoCiAg
ICAgICAgIHN0YXRlLT5zaW1kX3NpemUgPSBzaW1kX290aGVyOwogICAgICAgICBnb3RvIGF2eDUx
MmZfaW1tOF9ub19zYWU7CiAKKyNlbmRpZiAvKiAhWDg2RU1VTF9OT19TSU1EICovCisKICAgICBD
QVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHhjNSk6ICAvKiBwZXh0cncgJGltbTgseyx4
fW1tLHJlZyAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8q
IHZwZXh0cncgJGltbTgseG1tLHJlZyAqLwogICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYo
dmV4LmwsIEVYQ19VRCk7CkBAIC04MjAwLDYgKzgzMTgsOCBAQCB4ODZfZW11bGF0ZSgKICAgICAg
ICAgaW5zbl9ieXRlcyA9IFBGWF9CWVRFUyArIDM7CiAgICAgICAgIGdvdG8gc2ltZF8wZl90b19n
cHI7CiAKKyNpZm5kZWYgWDg2RU1VTF9OT19TSU1ECisKICAgICBDQVNFX1NJTURfUEFDS0VEX0ZQ
KF9FVkVYLCAweDBmLCAweGM2KTogLyogdnNodWZwe3MsZH0gJGltbTgsW3h5el1tbS9tZW0sW3h5
el1tbSxbeHl6XW1te2t9ICovCiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihldmV4Lncg
IT0gKGV2ZXgucGZ4ICYgVkVYX1BSRUZJWF9ET1VCTEVfTUFTSyksCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBFWENfVUQpOwpAQCAtODIxNCw2ICs4MzM0LDggQEAgeDg2X2VtdWxhdGUo
CiAgICAgICAgIGF2eDUxMl92bGVuX2NoZWNrKGZhbHNlKTsKICAgICAgICAgZ290byBzaW1kX2lt
bThfem1tOwogCisjZW5kaWYgLyogWDg2RU1VTF9OT19TSU1EICovCisKICAgICBjYXNlIFg4NkVN
VUxfT1BDKDB4MGYsIDB4YzcpOiAvKiBHcnA5ICovCiAgICAgewogICAgICAgICB1bmlvbiB7CkBA
IC04NDA0LDYgKzg1MjYsOCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgfQogICAgICAgICBicmVh
azsKIAorI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKKwogICAgIGNhc2UgWDg2RU1VTF9PUENfRVZF
WF82NigweDBmLCAweGQyKTogLyogdnBzcmxkIHhtbS9tMTI4LFt4eXpdbW0sW3h5el1tbXtrfSAq
LwogICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweGQzKTogLyogdnBzcmxxIHht
bS9tMTI4LFt4eXpdbW0sW3h5el1tbXtrfSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82
NigweDBmLCAweGUyKTogLyogdnBzcmF7ZCxxfSB4bW0vbTEyOCxbeHl6XW1tLFt4eXpdbW17a30g
Ki8KQEAgLTg0MjUsMTIgKzg1NDksMTggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIGdlbmVyYXRl
X2V4Y2VwdGlvbl9pZihldmV4LncgIT0gKGIgJiAxKSwgRVhDX1VEKTsKICAgICAgICAgZ290byBh
dng1MTJmX25vX3NhZTsKIAorI2VuZGlmIC8qICFYODZFTVVMX05PX1NJTUQgKi8KKyNpZm5kZWYg
WDg2RU1VTF9OT19NTVgKKwogICAgIGNhc2UgWDg2RU1VTF9PUEMoMHgwZiwgMHhkNCk6ICAgICAg
ICAvKiBwYWRkcSBtbS9tNjQsbW0gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDKDB4MGYsIDB4ZjQp
OiAgICAgICAgLyogcG11bHVkcSBtbS9tNjQsbW0gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDKDB4
MGYsIDB4ZmIpOiAgICAgICAgLyogcHN1YnEgbW0vbTY0LG1tICovCiAgICAgICAgIHZjcHVfbXVz
dF9oYXZlKHNzZTIpOwogICAgICAgICBnb3RvIHNpbWRfMGZfbW14OwogCisjZW5kaWYgLyogIVg4
NkVNVUxfTk9fTU1YICovCisjaWYgIWRlZmluZWQoWDg2RU1VTF9OT19NTVgpICYmICFkZWZpbmVk
KFg4NkVNVUxfTk9fU0lNRCkKKwogICAgIGNhc2UgWDg2RU1VTF9PUENfRjMoMHgwZiwgMHhkNik6
ICAgICAvKiBtb3ZxMmRxIG1tLHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfRjIoMHgwZiwg
MHhkNik6ICAgICAvKiBtb3ZkcTJxIHhtbSxtbSAqLwogICAgICAgICBnZW5lcmF0ZV9leGNlcHRp
b25faWYoZWEudHlwZSAhPSBPUF9SRUcsIEVYQ19VRCk7CkBAIC04NDM4LDYgKzg1NjgsOSBAQCB4
ODZfZW11bGF0ZSgKICAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUobW14KTsKICAgICAg
ICAgZ290byBzaW1kXzBmX2ludDsKIAorI2VuZGlmIC8qICFYODZFTVVMX05PX01NWCAmJiAhWDg2
RU1VTF9OT19TSU1EICovCisjaWZuZGVmIFg4NkVNVUxfTk9fTU1YCisKICAgICBjYXNlIFg4NkVN
VUxfT1BDKDB4MGYsIDB4ZTcpOiAgICAgICAgLyogbW92bnRxIG1tLG02NCAqLwogICAgICAgICBn
ZW5lcmF0ZV9leGNlcHRpb25faWYoZWEudHlwZSAhPSBPUF9NRU0sIEVYQ19VRCk7CiAgICAgICAg
IHNmZW5jZSA9IHRydWU7CkBAIC04NDUzLDYgKzg1ODYsOSBAQCB4ODZfZW11bGF0ZSgKICAgICAg
ICAgdmNwdV9tdXN0X2hhdmUobW14ZXh0KTsKICAgICAgICAgZ290byBzaW1kXzBmX21teDsKIAor
I2VuZGlmIC8qICFYODZFTVVMX05PX01NWCAqLworI2lmbmRlZiBYODZFTVVMX05PX1NJTUQKKwog
ICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweGRhKTogLyogdnBtaW51YiBbeHl6
XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhf
NjYoMHgwZiwgMHhkZSk6IC8qIHZwbWF4dWIgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9
ICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYsIDB4ZTQpOiAvKiB2cG11bGh1
dyBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8KQEAgLTg0NzMsNiArODYwOSw4IEBA
IHg4Nl9lbXVsYXRlKAogICAgICAgICBvcF9ieXRlcyA9IDggPDwgKCEhKHZleC5wZnggJiBWRVhf
UFJFRklYX0RPVUJMRV9NQVNLKSArIHZleC5sKTsKICAgICAgICAgZ290byBzaW1kXzBmX2N2dDsK
IAorI2VuZGlmIC8qICFYODZFTVVMX05PX1NJTUQgKi8KKwogICAgIENBU0VfU0lNRF9QQUNLRURf
SU5UX1ZFWCgweDBmLCAweGY3KTogLyogeyx2fW1hc2ttb3Z7cSxkcXV9IHsseH1tbSx7LHh9bW0g
Ki8KICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKGVhLnR5cGUgIT0gT1BfUkVHLCBFWENf
VUQpOwogICAgICAgICBpZiAoIHZleC5vcGN4ICE9IHZleF9ub25lICkKQEAgLTg1NzYsNiArODcx
NCw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBpbnNuX2J5dGVzID0gUEZYX0JZVEVTICsgMzsK
ICAgICAgICAgYnJlYWs7CiAKKyNpZm5kZWYgWDg2RU1VTF9OT19TSU1ECisKICAgICBjYXNlIFg4
NkVNVUxfT1BDX1ZFWF82NigweDBmMzgsIDB4MTkpOiAvKiB2YnJvYWRjYXN0c2QgeG1tL202NCx5
bW0gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmMzgsIDB4MWEpOiAvKiB2YnJv
YWRjYXN0ZjEyOCBtMTI4LHltbSAqLwogICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoIXZl
eC5sLCBFWENfVUQpOwpAQCAtOTE0NSw2ICs5Mjg1LDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAg
IEFTU0VSVCghc3RhdGUtPnNpbWRfc2l6ZSk7CiAgICAgICAgIGJyZWFrOwogCisjZW5kaWYgLyog
IVg4NkVNVUxfTk9fU0lNRCAqLworCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmMzgsIDB4
ODIpOiAvKiBpbnZwY2lkIHJlZyxtMTI4ICovCiAgICAgICAgIHZjcHVfbXVzdF9oYXZlKGludnBj
aWQpOwogICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZWEudHlwZSAhPSBPUF9NRU0sIEVY
Q19VRCk7CkBAIC05MTg3LDYgKzkzMjksOCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgc3RhdGUt
PnNpbWRfc2l6ZSA9IHNpbWRfbm9uZTsKICAgICAgICAgYnJlYWs7CiAKKyNpZm5kZWYgWDg2RU1V
TF9OT19TSU1ECisKICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDgzKTog
LyogdnBtdWx0aXNoaWZ0cWIgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICovCiAgICAg
ICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZighZXZleC53LCBFWENfVUQpOwogICAgICAgICBob3N0
X2FuZF92Y3B1X211c3RfaGF2ZShhdng1MTJfdmJtaSk7CkBAIC05NzUwLDYgKzk4OTQsOCBAQCB4
ODZfZW11bGF0ZSgKICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKGV2ZXguYnJzIHx8IGV2
ZXgub3Btc2ssIEVYQ19VRCk7CiAgICAgICAgIGdvdG8gYXZ4NTEyZl9ub19zYWU7CiAKKyNlbmRp
ZiAvKiAhWDg2RU1VTF9OT19TSU1EICovCisKICAgICBjYXNlIFg4NkVNVUxfT1BDKDB4MGYzOCwg
MHhmMCk6IC8qIG1vdmJlIG0sciAqLwogICAgIGNhc2UgWDg2RU1VTF9PUEMoMHgwZjM4LCAweGYx
KTogLyogbW92YmUgcixtICovCiAgICAgICAgIHZjcHVfbXVzdF9oYXZlKG1vdmJlKTsKQEAgLTk5
MTUsNiArMTAwNjEsOCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA6ICIwIiAoKHVpbnQzMl90KXNyYy52YWwpLCAicm0iIChfcmVncy5lZHgpICk7CiAgICAgICAg
IGJyZWFrOwogCisjaWZuZGVmIFg4NkVNVUxfTk9fU0lNRAorCiAgICAgY2FzZSBYODZFTVVMX09Q
Q19WRVhfNjYoMHgwZjNhLCAweDAwKTogLyogdnBlcm1xICRpbW04LHltbS9tMjU2LHltbSAqLwog
ICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYzYSwgMHgwMSk6IC8qIHZwZXJtcGQgJGlt
bTgseW1tL20yNTYseW1tICovCiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZighdmV4Lmwg
fHwgIXZleC53LCBFWENfVUQpOwpAQCAtOTk3NSw2ICsxMDEyMyw4IEBAIHg4Nl9lbXVsYXRlKAog
ICAgICAgICBhdng1MTJfdmxlbl9jaGVjayhiICYgMik7CiAgICAgICAgIGdvdG8gc2ltZF9pbW04
X3ptbTsKIAorI2VuZGlmIC8qIFg4NkVNVUxfTk9fU0lNRCAqLworCiAgICAgQ0FTRV9TSU1EX1BB
Q0tFRF9JTlQoMHgwZjNhLCAweDBmKTogLyogcGFsaWduciAkaW1tOCx7LHh9bW0vbWVtLHsseH1t
bSAqLwogICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZShzc3NlMyk7CiAgICAgICAgIGlm
ICggdmV4LnBmeCApCkBAIC0xMDAwMiw2ICsxMDE1Miw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAg
ICBpbnNuX2J5dGVzID0gUEZYX0JZVEVTICsgNDsKICAgICAgICAgYnJlYWs7CiAKKyNpZm5kZWYg
WDg2RU1VTF9OT19TSU1ECisKICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjNhLCAw
eDQyKTogLyogdmRicHNhZGJ3ICRpbW04LFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5el1tbXtrfSAq
LwogICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZXZleC53LCBFWENfVUQpOwogICAgICAg
ICAvKiBmYWxsIHRocm91Z2ggKi8KQEAgLTEwNTAwLDYgKzEwNjUyLDggQEAgeDg2X2VtdWxhdGUo
CiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZih2ZXgubCwgRVhDX1VEKTsKICAgICAgICAg
Z290byBzaW1kXzBmX2ltbThfYXZ4OwogCisjZW5kaWYgLyogWDg2RU1VTF9OT19TSU1EICovCisK
ICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF9GMigweDBmM2EsIDB4ZjApOiAvKiByb3J4IGltbSxy
L20sciAqLwogICAgICAgICB2Y3B1X211c3RfaGF2ZShibWkyKTsKICAgICAgICAgZ2VuZXJhdGVf
ZXhjZXB0aW9uX2lmKHZleC5sIHx8IHZleC5yZWcgIT0gMHhmLCBFWENfVUQpOwpAQCAtMTA1MTQs
NiArMTA2NjgsOCBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgICAgIGFzbSAoICJyb3JsICViMSwl
azAiIDogIj1nIiAoZHN0LnZhbCkgOiAiYyIgKGltbTEpLCAiMCIgKHNyYy52YWwpICk7CiAgICAg
ICAgIGJyZWFrOwogCisjaWZuZGVmIFg4NkVNVUxfTk9fU0lNRAorCiAgICAgY2FzZSBYODZFTVVM
X09QQ19YT1AoMDgsIDB4ODUpOiAvKiB2cG1hY3Nzd3cgeG1tLHhtbS9tMTI4LHhtbSx4bW0gKi8K
ICAgICBjYXNlIFg4NkVNVUxfT1BDX1hPUCgwOCwgMHg4Nik6IC8qIHZwbWFjc3N3ZCB4bW0seG1t
L20xMjgseG1tLHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfWE9QKDA4LCAweDg3KTogLyog
dnBtYWNzc2RxbCB4bW0seG1tL20xMjgseG1tLHhtbSAqLwpAQCAtMTA1NDksNiArMTA3MDUsOCBA
QCB4ODZfZW11bGF0ZSgKICAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoeG9wKTsKICAg
ICAgICAgZ290byBzaW1kXzBmX2ltbThfeW1tOwogCisjZW5kaWYgLyogWDg2RU1VTF9OT19TSU1E
ICovCisKICAgICBjYXNlIFg4NkVNVUxfT1BDX1hPUCgwOSwgMHgwMSk6IC8qIFhPUCBHcnAxICov
CiAgICAgICAgIHN3aXRjaCAoIG1vZHJtX3JlZyAmIDcgKQogICAgICAgICB7CkBAIC0xMDYwOCw2
ICsxMDc2Niw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICB9CiAgICAgICAgIGdvdG8gdW5yZWNv
Z25pemVkX2luc247CiAKKyNpZm5kZWYgWDg2RU1VTF9OT19TSU1ECisKICAgICBjYXNlIFg4NkVN
VUxfT1BDX1hPUCgwOSwgMHg4Mik6IC8qIHZmcmN6c3MgeG1tL20xMjgseG1tICovCiAgICAgY2Fz
ZSBYODZFTVVMX09QQ19YT1AoMDksIDB4ODMpOiAvKiB2ZnJjenNkIHhtbS9tMTI4LHhtbSAqLwog
ICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYodmV4LmwsIEVYQ19VRCk7CkBAIC0xMDY2Myw2
ICsxMDgyMyw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2
ZSh4b3ApOwogICAgICAgICBnb3RvIHNpbWRfMGZfeW1tOwogCisjZW5kaWYgLyogWDg2RU1VTF9O
T19TSU1EICovCisKICAgICBjYXNlIFg4NkVNVUxfT1BDX1hPUCgwYSwgMHgxMCk6IC8qIGJleHRy
IGltbSxyL20sciAqLwogICAgIHsKICAgICAgICAgdWludDhfdCAqYnVmID0gZ2V0X3N0dWIoc3R1
Yik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

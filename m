Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D6131A2
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaY8-0006gf-Kc; Fri, 03 May 2019 15:56:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaY7-0006gX-L6
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:56:35 +0000
X-Inumbo-ID: 0621bb57-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0621bb57-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:56:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d8so4744914lfb.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zGcIIOHuIHAA/1xDxGQvxJyqdtyMH/J4cKR9jZ15RsY=;
 b=UXVrq/CgfGcrLe3+FLaZwk5fPEieTRz2M9So4UnaYndhOd19KnNJIYQdN+5Jy86sHQ
 S3ovDLGR0BfxR2RXAwybHFR2GbqjpQrbnpcEzh5ht7LH4mKR7ayn2gh3RHCM0quuVkGO
 EVrz6Z5jAfGL4+LOblyTVgBXRHDjtvsm5PPpJfea4+JXCFNBerAE4Aimf1Akfeo/rnRO
 zPFqnN5hvFF+fs/umCy8Cf/6CKKM4KSYEiWi2495o7iV4oyBxLWGDWvW/cBF6W8q9KMk
 My5otl1MhcbN6maJu1czacpjdNeZezM9ZnOYGehFZHerJNUoA0nDGxwcgeLYiu5Rg0kV
 IYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zGcIIOHuIHAA/1xDxGQvxJyqdtyMH/J4cKR9jZ15RsY=;
 b=BI8aD9CpoVePMjIpQw4Mafdu+nkU0/cSnJ4yTfjXQswVCdjuQZiT2PJXyJDh1RnETl
 Iz9ELm6EcQONqinMXFHWisgFlqwgdFgqdkt83si7ntCLBMMOQjEgOj5ApqthtqNmwYuJ
 gGShpLwuD1SaS94OVtM0kstLe+0zxRz+vtamciLXV1FtuLisv7FAL4bJ7X5DnD+m2N1q
 LzhCE0PDMf3+/fEEeA9lhgiC7dSNEPUevyBtQY2+TAyMthOiDvEeEci/5iJwjExKA9PD
 QfuXecV1h/+Ax4FPJ3VDIGHjet9rQBwuMhvLcozzPaKC6SMHT+esnB2ZNHeK7MLYj7z7
 lXJA==
X-Gm-Message-State: APjAAAV5fz3hw5zOrnowQRmOPzceGP1l/uWk7OPAVzRURl5LDoLsqq2V
 O6PYxh1eIP6u2CRq3jqFUNg=
X-Google-Smtp-Source: APXvYqyHQzK50LBMf5ygKhHJQ+Vuf6Z8iyqh7SVo/YWmlZuZaQkd2A4Xf3qnj4e7bRiWS/e/68D7/A==
X-Received: by 2002:a19:c746:: with SMTP id x67mr5356711lff.152.1556898992949; 
 Fri, 03 May 2019 08:56:32 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id u6sm496738lfu.5.2019.05.03.08.56.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:56:32 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-5-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <baf59ec5-cc0a-5ffc-f637-6bbfd29dd589@gmail.com>
Date: Fri, 3 May 2019 18:56:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-5-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 04/20] xen/arm: Rework HSCTLR_BASE
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgY3VycmVudCB2YWx1ZSBvZiBIU0NUTFJfQkFTRSBmb3IgQXJtNjQgaXMgcHJldHR5IHdyb25n
LiBJdCB3b3VsZAo+IGFjdHVhbGx5IHR1cm4gb24gU0NUTFJfRUwyLm5BQSAoYml0IDYpIG9uIGhh
cmR3YXJlIGltcGxlbWVudGluZwo+IEFSTXY4LjQtTFNFLgo+IAo+IEZ1cnRoZXJtb3JlLCB0aGUg
ZG9jdW1lbnRhdGlvbiBvZiB3aGF0IGlzIGNsZWFyZWQvc2V0IGluIFNDVExSX0VMMiBpcwo+IGFs
c28gbm90IGNvcnJlY3QgYW5kIGxvb2tzIGxpa2UgdG8gYmUgYSB2ZXJiYXRpbSBjb3B5IGZyb20g
QXJtMzIuCj4gCj4gSFNDVExSX0JBU0UgaXMgcmVwbGFjZWQgd2l0aCBhIGJ1bmNoIG9mIHBlci1h
cmNoaXRlY3R1cmUgbmV3IGRlZmluZXMKPiBoZWxwaW5nIHRvIHVuZGVyc3RhbmQgYmV0dGVyIHdo
YXQgaXMgdGhlIGluaXRpYWxpZSB2YWx1ZSBmb3IKPiBTQ1RMUl9FTDIvSFNDVExSLgo+IAo+IE5v
dGUgdGhlIGRlZmluZXMgKl9DTEVBUiBhcmUgb25seSB1c2VkIHRvIGNoZWNrIHRoZSBzdGF0ZSBv
ZiBlYWNoIGJpdHMKPiBhcmUga25vd24uCj4gCj4gTGFzdGx5LCB0aGUgZG9jdW1lbnRhdGlvbiBp
cyBkcm9wcGVkIGZyb20gYXJtezMyLDY0fS9oZWFkLlMgYXMgaXQgd291bGQKPiBiZSBwcmV0dHkg
ZWFzeSB0byBnZXQgb3V0LW9mLXN5bmMgd2l0aCB0aGUgZGVmaW5pdGlvbnMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgIHhl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgICAgICAgfCAxMiArLS0tLS0tLS0tCj4gICB4ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TICAgICAgIHwgMTAgKy0tLS0tLS0KPiAgIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vcHJvY2Vzc29yLmggfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9h
cmNoL2FybS9hcm0zMi9oZWFkLlMKPiBpbmRleCA1ZWY3ZTVhMmYzLi44YTk4NjA3NDU5IDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0v
YXJtMzIvaGVhZC5TCj4gQEAgLTIzNCwxNyArMjM0LDcgQEAgY3B1X2luaXRfZG9uZToKPiAgICAg
ICAgICAgbGRyICAgcjAsID0oVENSX1JFUzF8VENSX1NIMF9JU3xUQ1JfT1JHTjBfV0JXQXxUQ1Jf
SVJHTjBfV0JXQXxUQ1JfVDBTWigwKSkKPiAgICAgICAgICAgbWNyICAgQ1AzMihyMCwgSFRDUikK
PiAgIAo+IC0gICAgICAgIC8qCj4gLSAgICAgICAgICogU2V0IHVwIHRoZSBIU0NUTFI6Cj4gLSAg
ICAgICAgICogRXhjZXB0aW9ucyBpbiBMRSBBUk0sCj4gLSAgICAgICAgICogTG93LWxhdGVuY3kg
SVJRcyBkaXNhYmxlZCwKPiAtICAgICAgICAgKiBXcml0ZS1pbXBsaWVzLVhOIGRpc2FibGVkIChm
b3Igbm93KSwKPiAtICAgICAgICAgKiBELWNhY2hlIGRpc2FibGVkIChmb3Igbm93KSwKPiAtICAg
ICAgICAgKiBJLWNhY2hlIGVuYWJsZWQsCj4gLSAgICAgICAgICogQWxpZ25tZW50IGNoZWNraW5n
IGVuYWJsZWQsCj4gLSAgICAgICAgICogTU1VIHRyYW5zbGF0aW9uIGRpc2FibGVkIChmb3Igbm93
KS4KPiAtICAgICAgICAgKi8KPiAtICAgICAgICBsZHIgICByMCwgPShIU0NUTFJfQkFTRXxTQ1RM
Ul9BWFhfQSkKPiArICAgICAgICBsZHIgICByMCwgPUhTQ1RMUl9TRVQKPiAgICAgICAgICAgbWNy
ICAgQ1AzMihyMCwgSFNDVExSKQo+ICAgCj4gICAgICAgICAgIC8qCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5k
ZXggOGE2YmUzMzUyZS4uNGZlOTA0YzUxZCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC0zNjMsMTUg
KzM2Myw3IEBAIHNraXBfYnNzOgo+ICAgCj4gICAgICAgICAgIG1zciAgIHRjcl9lbDIsIHgwCj4g
ICAKPiAtICAgICAgICAvKiBTZXQgdXAgdGhlIFNDVExSX0VMMjoKPiAtICAgICAgICAgKiBFeGNl
cHRpb25zIGluIExFIEFSTSwKPiAtICAgICAgICAgKiBMb3ctbGF0ZW5jeSBJUlFzIGRpc2FibGVk
LAo+IC0gICAgICAgICAqIFdyaXRlLWltcGxpZXMtWE4gZGlzYWJsZWQgKGZvciBub3cpLAo+IC0g
ICAgICAgICAqIEQtY2FjaGUgZGlzYWJsZWQgKGZvciBub3cpLAo+IC0gICAgICAgICAqIEktY2Fj
aGUgZW5hYmxlZCwKPiAtICAgICAgICAgKiBBbGlnbm1lbnQgY2hlY2tpbmcgZGlzYWJsZWQsCj4g
LSAgICAgICAgICogTU1VIHRyYW5zbGF0aW9uIGRpc2FibGVkIChmb3Igbm93KS4gKi8KPiAtICAg
ICAgICBsZHIgICB4MCwgPShIU0NUTFJfQkFTRSkKPiArICAgICAgICBsZHIgICB4MCwgPVNDVExS
X0VMMl9TRVQKPiAgICAgICAgICAgbXNyICAgU0NUTFJfRUwyLCB4MAo+ICAgCj4gICAgICAgICAg
IC8qIEVuc3VyZSB0aGF0IGFueSBleGNlcHRpb25zIGVuY291bnRlcmVkIGF0IEVMMgo+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9wcm9jZXNzb3IuaAo+IGluZGV4IDFhMTQzZmI2YTMuLjZkYWM1MDBlNDAgMTAwNjQ0Cj4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vcHJvY2Vzc29yLmgKPiBAQCAtMTIyLDYgKzEyMiw5IEBACj4gICAjZGVmaW5lIFND
VExSX0EzMl9FTHhfVEUgICAgX0JJVFVMKDMwKQo+ICAgI2RlZmluZSBTQ1RMUl9BMzJfRUx4X0ZJ
ICAgIF9CSVRVTCgyMSkKPiAgIAo+ICsvKiBDb21tb24gYml0cyBmb3IgU0NUTFJfRUx4IGZvciBB
cm02NCAqLwo+ICsjZGVmaW5lIFNDVExSX0E2NF9FTHhfU0EgICAgX0JJVFVMKDMpCj4gKwo+ICAg
LyogQ29tbW9uIGJpdHMgZm9yIFNDVExSX0VMeCBvbiBhbGwgYXJjaGl0ZWN0dXJlcyAqLwo+ICAg
I2RlZmluZSBTQ1RMUl9BeHhfRUx4X0VFICAgIF9CSVRVTCgyNSkKPiAgICNkZWZpbmUgU0NUTFJf
QXh4X0VMeF9XWE4gICBfQklUVUwoMTkpCj4gQEAgLTEzMCw3ICsxMzMsNTQgQEAKPiAgICNkZWZp
bmUgU0NUTFJfQXh4X0VMeF9BICAgICBfQklUVUwoMSkKPiAgICNkZWZpbmUgU0NUTFJfQXh4X0VM
eF9NICAgICBfQklUVUwoMCkKPiAgIAo+IC0jZGVmaW5lIEhTQ1RMUl9CQVNFICAgICBfQUMoMHgz
MGM1MTg3OCxVKQo+ICsjaWZkZWYgQ09ORklHX0FSTV8zMgo+ICsKPiArI2RlZmluZSBIU0NUTFJf
UkVTMSAgICAgKF9CSVRVTCgzKSAgfCBfQklUVUwoNCkgIHwgX0JJVFVMKDUpICB8IF9CSVRVTCg2
KSAgfFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIF9CSVRVTCgxMSkgfCBfQklUVUwoMTYp
IHwgX0JJVFVMKDE4KSB8IF9CSVRVTCgyMikgfFwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
IF9CSVRVTCgyMykgfCBfQklUVUwoMjgpIHwgX0JJVFVMKDI5KSkKPiArCj4gKyNkZWZpbmUgSFND
VExSX1JFUzAgICAgIChfQklUVUwoNykgIHwgX0JJVFVMKDgpICB8IF9CSVRVTCg5KSAgfCBfQklU
VUwoMTApIHxcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBfQklUVUwoMTMpIHwgX0JJVFVM
KDE0KSB8IF9CSVRVTCgxNSkgfCBfQklUVUwoMTcpIHxcCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICBfQklUVUwoMjApIHwgX0JJVFVMKDI0KSB8IF9CSVRVTCgyNikgfCBfQklUVUwoMjcpIHxc
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBfQklUVUwoMzEpKQo+ICsKPiArLyogSW5pdGlh
bCB2YWx1ZSBmb3IgSFNDVExSICovCj4gKyNkZWZpbmUgSFNDVExSX1NFVCAgICAgIChIU0NUTFJf
UkVTMSAgICB8IFNDVExSX0F4eF9FTHhfQSAgIHwgU0NUTFJfQXh4X0VMeF9JKQo+ICsKPiArI2Rl
ZmluZSBIU0NUTFJfQ0xFQVIgICAgKEhTQ1RMUl9SRVMwICAgICAgICB8IFNDVExSX0F4eF9FTHhf
TSAgIHxcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBTQ1RMUl9BeHhfRUx4X0MgICAgfCBT
Q1RMUl9BeHhfRUx4X1dYTiB8XAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgU0NUTFJfQTMy
X0VMeF9GSSAgIHwgU0NUTFJfQXh4X0VMeF9FRSAgfFwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgIFNDVExSX0EzMl9FTHhfVEUpCj4gKwo+ICsjaWYgKEhTQ1RMUl9TRVQgXiBIU0NUTFJfQ0xF
QVIpICE9IDB4ZmZmZmZmZmZVCj4gKyNlcnJvciAiSW5jb25zaXN0ZW50IEhTQ1RMUiBzZXQvY2xl
YXIgYml0cyIKPiArI2VuZGlmCj4gKwo+ICsjZWxzZQo+ICsKPiArI2RlZmluZSBTQ1RMUl9FTDJf
UkVTMSAgKF9CSVRVTCg0KSAgfCBfQklUVUwoNSkgIHwgX0JJVFVMKDExKSB8IF9CSVRVTCgxNikg
fFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIF9CSVRVTCgxOCkgfCBfQklUVUwoMjIpIHwg
X0JJVFVMKDIzKSB8IF9CSVRVTCgyOCkgfFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIF9C
SVRVTCgyOSkpCj4gKwo+ICsjZGVmaW5lIFNDVExSX0VMMl9SRVMwICAoX0JJVFVMKDYpICB8IF9C
SVRVTCg3KSAgfCBfQklUVUwoOCkgIHwgX0JJVFVMKDkpICB8XAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgX0JJVFVMKDEwKSB8IF9CSVRVTCgxMykgfCBfQklUVUwoMTQpIHwgX0JJVFVMKDE1
KSB8XAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgX0JJVFVMKDE3KSB8IF9CSVRVTCgyMCkg
fCBfQklUVUwoMjEpIHwgX0JJVFVMKDI0KSB8XAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
X0JJVFVMKDI2KSB8IF9CSVRVTCgyNykgfCBfQklUVUwoMzApIHwgX0JJVFVMKDMxKSB8XAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgKDB4ZmZmZmZmZmZVTEwgPDwgMzIpKQo+ICsKPiArLyog
SW5pdGlhbCB2YWx1ZSBmb3IgU0NUTFJfRUwyICovCj4gKyNkZWZpbmUgU0NUTFJfRUwyX1NFVCAg
IChTQ1RMUl9FTDJfUkVTMSAgICAgfCBTQ1RMUl9BNjRfRUx4X1NBICB8XAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgU0NUTFJfQXh4X0VMeF9JKQo+ICsKPiArI2RlZmluZSBTQ1RMUl9FTDJf
Q0xFQVIgKFNDVExSX0VMMl9SRVMwICAgICB8IFNDVExSX0F4eF9FTHhfTSAgIHxcCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICBTQ1RMUl9BeHhfRUx4X0EgICAgfCBTQ1RMUl9BeHhfRUx4X0Mg
ICB8XAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgU0NUTFJfQXh4X0VMeF9XWE4gIHwgU0NU
TFJfQXh4X0VMeF9FRSkKPiArCj4gKyNpZiAoU0NUTFJfRUwyX1NFVCBeIFNDVExSX0VMMl9DTEVB
UikgIT0gMHhmZmZmZmZmZmZmZmZmZmZmVUwKPiArI2Vycm9yICJJbmNvbnNpc3RlbnQgU0NUTFJf
RUwyIHNldC9jbGVhciBiaXRzIgo+ICsjZW5kaWYKPiArCj4gKyNlbmRpZgo+ICAgCj4gICAvKiBI
Q1IgSHlwIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgKi8KPiAgICNkZWZpbmUgSENSX1JXICAgICAg
ICAgIChfQUMoMSxVTCk8PDMxKSAvKiBSZWdpc3RlciBXaWR0aCwgQVJNNjQgb25seSAqLwo+IAoK
UmVzb2x1dGlvbiBvZiB0aGUgZGlzcHV0ZSB3aXRoIEphbiBhYm91dCBbUEFUQ0ggMDEvMjBdIGlz
IHJlcXVpcmVkIGZpcnN0LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

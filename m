Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB9317910B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 14:15:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9TpZ-0004eC-Qt; Wed, 04 Mar 2020 13:12:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l4g8=4V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j9TpY-0004dS-Vt
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 13:12:57 +0000
X-Inumbo-ID: dcf07d60-5e19-11ea-a3ce-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id dcf07d60-5e19-11ea-a3ce-12813bfff9fa;
 Wed, 04 Mar 2020 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583327576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3p/fFbxB5ezcsfdq9MHESgqC9UtCWJvZwUNOkF4Zu30=;
 b=Y353PzBsOiT3nbDDzu/C+pIrWtNvRu2rtSo45D1lbjAHgnys0X+sFM/GuZTQDb2FdE0MR6
 /jwtRxiWy+TGRas1+6MLhIUhTyjKY4FpK0tM+cQK/m7mBwTlkuCLhP5ELKuIt74d2wzuqM
 hrI67BPvyMjVYCuz6NPRFGURIsVxSn8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-T9qcxSXgOCieaEPcQLmBmw-1; Wed, 04 Mar 2020 08:12:44 -0500
X-MC-Unique: T9qcxSXgOCieaEPcQLmBmw-1
Received: by mail-ed1-f69.google.com with SMTP id r30so1562420edi.9
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 05:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wrv00mxDOOqpdemOYspMDZ/TSsZzjo/OCltlEBUziv8=;
 b=XbDTX6QvvAVeOvATMYKZ9+NW+sTrqBNqNhb+32O5PYU7GnECgZnm9u90fHaSapwx+V
 GZ9CyM2LGiJx4xiw8CBvh8SzYfcnKVz1bPoVodRRaBsmFIKaMvIg/mAvM61HsQlaTH3I
 JiElmYnKxsJ5UNkrrkgTIOBC7KjE9uBpo4viGCxQQeIehI8zopzgnjEUyUJo1+mjL2/D
 mzUsshJmsDfi8KNbiZBFGER/27QtjDdBuim9iBnxR/fPzlkhqAo3HKQ4d5OMG9T7L7Ms
 62JXY+5dDrUB21/4W4fA504GJum4visLXcWeLgahwTMCSEfNEfgIR0N/vKZXqJ1LNpLy
 gTPg==
X-Gm-Message-State: ANhLgQ0A0yVmM6tCcv+XqkvTZeeBribV3KRhKFTTMNwMptLfWZ+D+03y
 QS8TmUg+YFLg5pAzdAx1k69EftxS9kCd27epDumSwy/+eHFV5JEJjoIT7aRnct4YbEVDoeFlJNs
 /HxeAHxpimDr+qyMzGSIGwZpatTU=
X-Received: by 2002:a17:906:bb0c:: with SMTP id
 jz12mr2497635ejb.298.1583327562888; 
 Wed, 04 Mar 2020 05:12:42 -0800 (PST)
X-Google-Smtp-Source: ADFU+vux30Ie4y9HmDhIL9dTaFYuWDhigFHYVeZSlamFHo2iRPgM7EwcNwT0sc/cInsQkQULDMwOLQ==
X-Received: by 2002:a17:906:bb0c:: with SMTP id
 jz12mr2497606ejb.298.1583327562540; 
 Wed, 04 Mar 2020 05:12:42 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id dm24sm296392edb.57.2020.03.04.05.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 05:12:41 -0800 (PST)
To: qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
 <20200304005105.27454-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
Date: Wed, 4 Mar 2020 14:12:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304005105.27454-2-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 1/2] misc: Replace zero-length arrays with
 flexible array member (automatic)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy80LzIwIDE6NTEgQU0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IERlc2Ny
aXB0aW9uIGNvcGllZCBmcm9tIExpbnV4IGtlcm5lbCBjb21taXQgZnJvbSBHdXN0YXZvIEEuIFIu
IFNpbHZhCj4gKHNlZSBbM10pOgo+IAo+IC0tdi0tIGRlc2NyaXB0aW9uIHN0YXJ0IC0tdi0tCj4g
Cj4gICAgVGhlIGN1cnJlbnQgY29kZWJhc2UgbWFrZXMgdXNlIG9mIHRoZSB6ZXJvLWxlbmd0aCBh
cnJheSBsYW5ndWFnZQo+ICAgIGV4dGVuc2lvbiB0byB0aGUgQzkwIHN0YW5kYXJkLCBidXQgdGhl
IHByZWZlcnJlZCBtZWNoYW5pc20gdG8KPiAgICBkZWNsYXJlIHZhcmlhYmxlLWxlbmd0aCB0eXBl
cyBzdWNoIGFzIHRoZXNlIG9uZXMgaXMgYSBmbGV4aWJsZQo+ICAgIGFycmF5IG1lbWJlciBbMV0s
IGludHJvZHVjZWQgaW4gQzk5Ogo+IAo+ICAgIHN0cnVjdCBmb28gewo+ICAgICAgICBpbnQgc3R1
ZmY7Cj4gICAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsKPiAgICB9Owo+IAo+ICAgIEJ5IG1ha2lu
ZyB1c2Ugb2YgdGhlIG1lY2hhbmlzbSBhYm92ZSwgd2Ugd2lsbCBnZXQgYSBjb21waWxlcgo+ICAg
IHdhcm5pbmcgaW4gY2FzZSB0aGUgZmxleGlibGUgYXJyYXkgZG9lcyBub3Qgb2NjdXIgbGFzdCBp
biB0aGUKPiAgICBzdHJ1Y3R1cmUsIHdoaWNoIHdpbGwgaGVscCB1cyBwcmV2ZW50IHNvbWUga2lu
ZCBvZiB1bmRlZmluZWQKPiAgICBiZWhhdmlvciBidWdzIGZyb20gYmVpbmcgdW5hZHZlcnRlbmx5
IGludHJvZHVjZWQgWzJdIHRvIHRoZQo+ICAgIExpbnV4IGNvZGViYXNlIGZyb20gbm93IG9uLgo+
IAo+IC0tXi0tIGRlc2NyaXB0aW9uIGVuZCAtLV4tLQo+IAo+IERvIHRoZSBzaW1pbGFyIGhvdXNl
a2VlcGluZyBpbiB0aGUgUUVNVSBjb2RlYmFzZSAod2hpY2ggdXNlcwo+IEM5OSBzaW5jZSBjb21t
aXQgN2JlNDE2NzVmN2NiKS4KPiAKPiBBbGwgdGhlc2UgaW5zdGFuY2VzIG9mIGNvZGUgd2VyZSBm
b3VuZCB3aXRoIHRoZSBoZWxwIG9mIHRoZQo+IGZvbGxvd2luZyBDb2NjaW5lbGxlIHNjcmlwdDoK
PiAKPiAgICBAQAo+ICAgIGlkZW50aWZpZXIgcywgYTsKPiAgICB0eXBlIFQ7Cj4gICAgQEAKPiAg
ICAgc3RydWN0IHMgewo+ICAgICAgICAuLi4KPiAgICAtICAgVCBhWzBdOwo+ICAgICsgICBUIGFb
XTsKPiAgICB9Owo+ICAgIEBACj4gICAgaWRlbnRpZmllciBzLCBhOwo+ICAgIHR5cGUgVDsKPiAg
ICBAQAo+ICAgICBzdHJ1Y3QgcyB7Cj4gICAgICAgIC4uLgo+ICAgIC0gICBUIGFbMF07Cj4gICAg
KyAgIFQgYVtdOwo+ICAgICB9IFFFTVVfUEFDS0VEOwo+IAo+IFsxXSBodHRwczovL2djYy5nbnUu
b3JnL29ubGluZWRvY3MvZ2NjL1plcm8tTGVuZ3RoLmh0bWwKPiBbMl0gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1p
dC8/aWQ9NzY0OTc3MzI5MzJmCj4gWzNdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2d1c3Rhdm9hcnMvbGludXguZ2l0L2NvbW1pdC8/aWQ9MTc2NDJhMmZi
ZDJjMQo+IAo+IEluc3BpcmVkLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVk
ZGVkb3IuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGJzZC11c2VyL3FlbXUuaCAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICAgY29udHJpYi9saWJ2aG9zdC11c2VyL2xpYnZob3N0LXVzZXIuaCB8
ICAyICstCj4gICBody9tNjhrL2Jvb3RpbmZvLmggICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
PiAgIGh3L3Njc2kvc3JwLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAg
IGh3L3hlbi94ZW5fcHQuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgaW5jbHVk
ZS9ody9hY3BpL2FjcGktZGVmcy5oICAgICAgICAgICB8IDEyICsrKysrKy0tLS0tLQo+ICAgaW5j
bHVkZS9ody9hcm0vc21tdS1jb21tb24uaCAgICAgICAgICB8ICAyICstCj4gICBpbmNsdWRlL2h3
L2kzODYvaW50ZWxfaW9tbXUuaCAgICAgICAgIHwgIDMgKystCj4gICBpbmNsdWRlL2h3L3ZpcnRp
by92aXJ0aW8taW9tbXUuaCAgICAgIHwgIDIgKy0KPiAgIGluY2x1ZGUvc3lzZW11L2NyeXB0b2Rl
di5oICAgICAgICAgICAgfCAgMiArLQo+ICAgaW5jbHVkZS90Y2cvdGNnLmggICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gICBwYy1iaW9zL3MzOTAtY2N3L2Jvb3RtYXAuaCAgICAgICAgICAg
IHwgIDIgKy0KPiAgIHBjLWJpb3MvczM5MC1jY3cvc2NscC5oICAgICAgICAgICAgICAgfCAgMiAr
LQo+ICAgdGVzdHMvcXRlc3QvbGlicW9zL2FoY2kuaCAgICAgICAgICAgICB8ICAyICstCj4gICBi
bG9jay9saW51eC1haW8uYyAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGh3L2FjcGkv
bnZkaW1tLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgIGh3L2RtYS9zb2Nf
ZG1hLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgaHcvaTM4Ni94ODYuYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBody9taXNjL29tYXBfbDQuYyAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGh3L252cmFtL2VlcHJvbTkzeHguYyAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICAgaHcvcmRtYS92bXcvcHZyZG1hX3FwX29wcy5jICAgICAgICAgICB8
ICA0ICsrLS0KPiAgIGh3L3VzYi9kZXYtbmV0d29yay5jICAgICAgICAgICAgICAgICAgfCAgMiAr
LQo+ICAgaHcvdXNiL2Rldi1zbWFydGNhcmQtcmVhZGVyLmMgICAgICAgICB8ICA0ICsrLS0KPiAg
IGh3L3ZpcnRpby92aXJ0aW8uYyAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gICBuZXQv
cXVldWUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIDI1IGZpbGVzIGNo
YW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQo+IApbLi4uXQo+IGRpZmYg
LS1naXQgYS9ody9zY3NpL3NycC5oIGIvaHcvc2NzaS9zcnAuaAo+IGluZGV4IGQyN2YzMWQyZDUu
LjU0Yzk1NGJhZGQgMTAwNjQ0Cj4gLS0tIGEvaHcvc2NzaS9zcnAuaAo+ICsrKyBiL2h3L3Njc2kv
c3JwLmgKPiBAQCAtMTEyLDcgKzExMiw3IEBAIHN0cnVjdCBzcnBfZGlyZWN0X2J1ZiB7Cj4gICBz
dHJ1Y3Qgc3JwX2luZGlyZWN0X2J1ZiB7Cj4gICAgICAgc3RydWN0IHNycF9kaXJlY3RfYnVmICAg
IHRhYmxlX2Rlc2M7Cj4gICAgICAgdWludDMyX3QgICAgICAgICAgICAgICAgIGxlbjsKPiAtICAg
IHN0cnVjdCBzcnBfZGlyZWN0X2J1ZiAgICBkZXNjX2xpc3RbMF07Cj4gKyAgICBzdHJ1Y3Qgc3Jw
X2RpcmVjdF9idWYgICAgZGVzY19saXN0W107Cj4gICB9IFFFTVVfUEFDS0VEOwo+ICAgCj4gICBl
bnVtIHsKPiBAQCAtMjExLDcgKzIxMSw3IEBAIHN0cnVjdCBzcnBfY21kIHsKPiAgICAgICB1aW50
OF90ICAgIHJlc2VydmVkNDsKPiAgICAgICB1aW50OF90ICAgIGFkZF9jZGJfbGVuOwo+ICAgICAg
IHVpbnQ4X3QgICAgY2RiWzE2XTsKPiAtICAgIHVpbnQ4X3QgICAgYWRkX2RhdGFbMF07Cj4gKyAg
ICB1aW50OF90ICAgIGFkZF9kYXRhW107Cj4gICB9IFFFTVVfUEFDS0VEOwo+ICAgCj4gICBlbnVt
IHsKPiBAQCAtMjQxLDcgKzI0MSw3IEBAIHN0cnVjdCBzcnBfcnNwIHsKPiAgICAgICB1aW50MzJf
dCAgIGRhdGFfaW5fcmVzX2NudDsKPiAgICAgICB1aW50MzJfdCAgIHNlbnNlX2RhdGFfbGVuOwo+
ICAgICAgIHVpbnQzMl90ICAgcmVzcF9kYXRhX2xlbjsKPiAtICAgIHVpbnQ4X3QgICAgZGF0YVsw
XTsKPiArICAgIHVpbnQ4X3QgICAgZGF0YVtdOwo+ICAgfSBRRU1VX1BBQ0tFRDsKCmh3L3Njc2kv
c3BhcHJfdnNjc2kuYzo2OToyOTogZXJyb3I6IGZpZWxkICdpdScgd2l0aCB2YXJpYWJsZSBzaXpl
ZCB0eXBlIAondW5pb24gdmlvc3JwX2l1JyBub3QgYXQgdGhlIGVuZCBvZiBhIHN0cnVjdCBvciBj
bGFzcyBpcyBhIEdOVSBleHRlbnNpb24gClstV2Vycm9yLC1XZ251LXZhcmlhYmxlLXNpemVkLXR5
cGUtbm90LWF0LWVuZF0KICAgICB1bmlvbiB2aW9zcnBfaXUgICAgICAgICBpdTsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCgpZYXkgd2UgZm91bmQgYSBidWchIFRoYW5rcyBHdXN0YXZv
IDopCgp1bmlvbiBzcnBfaXUgewogICAgIHN0cnVjdCBzcnBfbG9naW5fcmVxIGxvZ2luX3JlcTsK
ICAgICBzdHJ1Y3Qgc3JwX2xvZ2luX3JzcCBsb2dpbl9yc3A7CiAgICAgc3RydWN0IHNycF9sb2dp
bl9yZWogbG9naW5fcmVqOwogICAgIHN0cnVjdCBzcnBfaV9sb2dvdXQgaV9sb2dvdXQ7CiAgICAg
c3RydWN0IHNycF90X2xvZ291dCB0X2xvZ291dDsKICAgICBzdHJ1Y3Qgc3JwX3Rza19tZ210IHRz
a19tZ210OwogICAgIHN0cnVjdCBzcnBfY21kIGNtZDsKICAgICBzdHJ1Y3Qgc3JwX3JzcCByc3A7
CiAgICAgdWludDhfdCByZXNlcnZlZFtTUlBfTUFYX0lVX0xFTl07Cn07Cgp1bmlvbiB2aW9zcnBf
aXUgewogICAgIHVuaW9uIHNycF9pdSBzcnA7CiAgICAgdW5pb24gbWFkX2l1IG1hZDsKfTsKCnR5
cGVkZWYgc3RydWN0IHZzY3NpX3JlcSB7CiAgICAgdnNjc2lfY3JxICAgICAgICAgICAgICAgY3Jx
OwogICAgIHVuaW9uIHZpb3NycF9pdSAgICAgICAgIGl1OwoKICAgICAvKiBTQ1NJIHJlcXVlc3Qg
dHJhY2tpbmcgKi8KICAgICBTQ1NJUmVxdWVzdCAgICAgICAgICAgICAqc3JlcTsKICAgICB1aW50
MzJfdCAgICAgICAgICAgICAgICBxdGFnOyAvKiBxZW11IHRhZyAhPSBzcnAgdGFnICovCiAgICAg
Ym9vbCAgICAgICAgICAgICAgICAgICAgYWN0aXZlOwogICAgIGJvb2wgICAgICAgICAgICAgICAg
ICAgIHdyaXRpbmc7CiAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgZG1hX2Vycm9yOwogICAg
IHVpbnQzMl90ICAgICAgICAgICAgICAgIGRhdGFfbGVuOwogICAgIHVpbnQzMl90ICAgICAgICAg
ICAgICAgIHNlbnNlbGVuOwogICAgIHVpbnQ4X3QgICAgICAgICAgICAgICAgIHNlbnNlW1NDU0lf
U0VOU0VfQlVGX1NJWkVdOwoKICAgICAvKiBSRE1BIHJlbGF0ZWQgYml0cyAqLwogICAgIHVpbnQ4
X3QgICAgICAgICAgICAgICAgIGRtYV9mbXQ7CiAgICAgdWludDE2X3QgICAgICAgICAgICAgICAg
bG9jYWxfZGVzYzsKICAgICB1aW50MTZfdCAgICAgICAgICAgICAgICB0b3RhbF9kZXNjOwogICAg
IHVpbnQxNl90ICAgICAgICAgICAgICAgIGNkYl9vZmZzZXQ7CiAgICAgdWludDE2X3QgICAgICAg
ICAgICAgICAgY3VyX2Rlc2NfbnVtOwogICAgIHVpbnQxNl90ICAgICAgICAgICAgICAgIGN1cl9k
ZXNjX29mZnNldDsKfSB2c2NzaV9yZXE7Cgo+ICAgCj4gICAjZW5kaWYgLyogU0NTSV9TUlBfSCAq
LwpbLi4uXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9DEB7A7C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 15:29:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAwRx-0000Rt-Fv; Thu, 19 Sep 2019 13:26:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C8m3=XO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iAwRv-0000RU-Qm
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 13:26:19 +0000
X-Inumbo-ID: 100b2040-dae1-11e9-b299-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 100b2040-dae1-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 13:26:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m7so3616646lji.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J1+/TFOiOJFqZIMjn9SuMu2ByeRmgYLNYc3PaT10fUY=;
 b=sE+OlTPTO1K38q0UixGvc6Bf+DAeuiw8R7p/+JSLV2A/SGkw3D9qQOiDhF3JJ4c8sU
 OvvWsBQdMgPB0z+5t80albVSzwGVlt35Z6OCsoomB3oG2WFcZebhVDikam3GKuE78c0s
 S+3IhFYHCwCxwn1ngoa2iTWX3UJsEogtsBF6N6gQNy0vezBHK+G+u88e75S3WxWIqoot
 OgTLEQ0rxpVbXsPEydh05rhVsZzNXoXAdR3kjS8VTs3TSKu3G2YYbX6MJppPRluzQ/46
 23ba2ponfbewFN0QEPOZT66Fx4sc7JfPn/u5xh8zwwHOVk8Ss+Fgq6QKZLn5pTPleQIC
 foDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=J1+/TFOiOJFqZIMjn9SuMu2ByeRmgYLNYc3PaT10fUY=;
 b=Oya2woAqgJHbc+utMpCUTItyNn37iSQreON6E+LkbQK6ECl4bcG8vbS2JSnuDFD1GB
 xs0UVNLS7F9MUtgFFvRmsi3cGmiLwbjIMV5uWC/6s/N8RgQwKM4adHgFsT7h34L4mlbN
 3SndLWyACVkelemZ8KanrSvGq0mRO930XY9XMjOD00b+FJChmcbYvonxtSV9GDYAH2Fe
 a97H/MDPpu3MDdXmZ4xUK9i6VOtbaOBqQwl621QK2v8kR2D6zdiS8jrGphT/fZK5ol6L
 u+PwNTSvmR8vTIjP6rxt59QORqz8A1n2VZOprxMolE8rZewAEcDkqTf++O6Ucv2+wZa8
 O7jQ==
X-Gm-Message-State: APjAAAVOSVlThJul+v2s5FwvEAh18G6SvSqa+xB7HOrTzLuONiAvimjJ
 DNrXdYOpgik/px5TNOFOJzc=
X-Google-Smtp-Source: APXvYqzcQjC1cp8OmFXIhti1gwKU000SGWWaRIXz/uW5QsJEmRw73uqC/MB5Byv4Z092hEUAoymg8Q==
X-Received: by 2002:a2e:8147:: with SMTP id t7mr5493276ljg.75.1568899577891;
 Thu, 19 Sep 2019 06:26:17 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id c197sm1574539lfg.46.2019.09.19.06.26.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 06:26:17 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-8-git-send-email-olekstysh@gmail.com>
 <631c94fe-d3ac-002b-0e1d-30b9b03158d1@arm.com>
 <aa7eb317-7807-71ba-8fe2-2e944516dcd6@gmail.com>
 <538a5486-2702-81f4-f925-c78542ff4118@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1c1bb0b2-cb4d-24ea-75c8-573094bb8601@gmail.com>
Date: Thu, 19 Sep 2019 16:26:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <538a5486-2702-81f4-f925-c78542ff4118@arm.com>
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE5LjA5LjE5IDE1OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSwgSnVsaWVu
CgoKPgo+Pj4+ICsKPj4+PiAraW50IF9faW5pdCBpb21tdV9hZGRfZHRfZGV2aWNlKHN0cnVjdCBk
dF9kZXZpY2Vfbm9kZSAqbnApCj4+Pgo+Pj4gU29ycnkgdG8gb25seSByZWFsaXNlIGl0IG5vdy4g
V291bGQgaXQgbWFrZSBzZW5zZSB0byBoYXZlIHRoaXMgCj4+PiBmdW5jdGlvbiBpbXBsZW1lbnRl
ZCBpbiB4ZW4vcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYz8gCj4+Cj4+IE5vdCBlbnRpcmVseSBz
dXJlLiBkZXZpY2VfdHJlZS5jIGlzIGEgY29tbW9uIGNvZGUuIFRoZSBpb21tdV9md3NwZWMgCj4+
IHN0dWZmICh3aWRlbHkgdXNlZCBpbiB0aGlzIGZ1bmN0aW9uKSBpcyBBUk0gY29kZS4KPgo+IFNv
bWUgb2YgdGhlIGRldmljZV90cmVlLmMgYWxyZWFkeSBjb250YWlucyBBcm0gc3BlY2lmaWMgY29k
ZSAoc3VjaCBhcyAKPiBkZXZpY2UuaCkuCj4KPiBEVCBoYXMgYmVlbiBvbmx5IHVzZWQgYnkgQXJt
IHNvIGZhciwgc28gaXQgaXMgc2FkbHkgZmFpcmx5IHRpZSB0byB0aGUgCj4gYXJjaGl0ZWN0dXJl
LiBCdXQgaXQgc2hvdWxkIGJlIGVhc3kgdG8gbWFrZSBpdCBnZW5lcmljIGlmIG5lZWRzIGJlIAo+
IChzdWNoIGFzIGZvciBSSVNDdikuCj4KPiBXaGlsZSBpb21tdV9md3NwZWMgaXMgYmVlbiBpbXBs
ZW1lbnRlZCBpbiBBcm0gaGVhZGVycywgdGhpcyBjb3VsZCAKPiBwb3RlbnRpYWxseSBiZSBtYWRl
IGNvbW1vbi4gU28gSSB3b3VsZCBzdGlsbCBwcmVmZXIgdGhpcyB0aGF0IGZ1bmN0aW9uIAo+IGlz
IG1vdmVkIGluIGRldmljZV90cmVlLmMKCldlbGwsIHdpbGwgbW92ZS4gQWxzbyBJIHdpbGwgcmVt
b3ZlIF9faW5pdCBhcyBpdCBjYW4gYmUgY2FsbGVkIGF0IHJ1bnRpbWUuLi4KCgpBcyBmb3IgcnVu
dGltZToKClRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGFsbG93cyB1cyB0byBmYWlsIGF0IGVh
cmx5IHN0YWdlIGlmIHNvbWV0aGluZyAKaXMgd3Jvbmcgd2l0aCB0aGUgZGV2aWNlIHdoaWNoIGlz
IGJlaGluZCBhbiBJT01NVSAoYW5kIG5lZWRzIHRvIGJlIApwcm90ZWN0ZWQpLiBBcyB3ZSBzY2Fu
IGZvciBhbGwgcHJlc2VudCBkZXZpY2VzLCBidXQgbm90IG9ubHkgZm9yIAoicGFzc3Rocm91Z2gi
LgpUaGUgInNwbGl0dGluZyIgaW50byBoYW5kbGVfZGV2aWNlKCkgZm9yIGh3ZG9tIGFuZCBpb21t
dV9kb19kdF9kb21jdGwoKSAKZm9yIG90aGVyIGd1ZXN0cyB3aWxsIHBvc3Rwb25lIGFuIGVycm9y
IHJlY29nbml0aW9uIHRvIHRoZSBndWVzdCBkb21haW4gCmNyZWF0aW9uIHRpbWUuIFNvLCB3ZSB3
b3VsZCBoYXZlIG5vbiBmdW5jdGlvbiBzeXN0ZW0gYW55d2F5LiBXb3VsZG4ndCBiZSAKYmV0dGVy
IHRvIGZhaWwgZWFybHkgaW5zdGVhZCBvZiBjb250aW51ZSBhbmQgZmFpbCBhbnl3YXk/CgoKLS0g
ClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
